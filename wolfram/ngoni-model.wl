(* ══════════════════════════════════════════════════════════════════
   Ngoni (Kamele N'goni) — Wolfram Model Package
   Heifer Zephyr Instrument Works · Tony Koop
   Generated: 2026-05-08

   Physics:  Mersenne–Taylor string model + Helmholtz bowl resonator
   Variants: Donso 6-string · Kamele 10-string · Kamele 14-string
   Tuning:   Pentatonic D–F–G–A–C (repeating across octaves)

   Run in Wolfram Desktop or wolframscript.
   Sections:
     §1  Parameters (blue inputs — change these)
     §2  Core formulas
     §3  String schedules (all three variants)
     §4  Bowl resonator estimate
     §5  Manipulate: interactive string explorer
     §6  Audio preview (Kamele 10)
     §7  Validation plot
     §8  Cultural context timeline
   ══════════════════════════════════════════════════════════════════ *)

(* ─── §1  Parameters ─────────────────────────────────────────── *)

(* Nylon material constants *)
\[Rho]nylon = 0.04155;         (* lb/in³ *)
\[Sigma]break = 44600;          (* psi, nylon breaking stress *)
g = 386.4;                      (* in/s², imperial gravity *)

(* Speed of sound at 68°F *)
cSound = 13552;                 (* in/s *)

(* Kamele 10 bowl geometry *)
bowlOD = 12.6;                  (* in, outer diameter *)
bowlDepth = 6.5;                (* in *)
neckHoleDiam = 1.25;            (* in *)
wallThick = 0.375;              (* in, target finished wall *)

(* String vibrating lengths (in) — Kamele 10 *)
lengths10 = {6.5, 7.5, 9.0, 10.5, 12.0, 14.0, 16.0, 18.5, 20.5, 22.0};

(* String tensions (lbf) — Kamele 10 *)
tensions10 = {6, 6, 6, 8, 8, 10, 10, 12, 12, 12};

(* Note names and MIDI numbers — Kamele 10 *)
noteNames10 = {"D5","C5","A4","G4","F4","D4","C4","A3","G3","F3"};
midiNotes10 = {74, 72, 69, 67, 65, 62, 60, 57, 55, 53};


(* ─── §2  Core Formulas ──────────────────────────────────────── *)

(* MIDI to Hz *)
midiToHz[m_] := 440.0 * 2^((m - 69)/12.0)

(* Linear mass density from gauge diameter *)
mu[d_] := \[Rho]nylon * Pi * (d/2)^2

(* Mersenne–Taylor frequency *)
fString[L_, T_, d_] := (1/(2*L)) * Sqrt[T / mu[d]]

(* Solve for gauge diameter given L, T, f *)
gaugeDiam[L_, T_, f_] := 2 * Sqrt[T * g / (\[Rho]nylon * Pi * 4 * L^2 * f^2)]

(* % breaking stress (independent of diameter for ideal round nylon) *)
pctBreaking[L_, f_] := \[Rho]nylon * 4 * L^2 * f^2 / (\[Sigma]break * g) * 100

(* Helmholtz resonator (rigid walls — first-order estimate) *)
fHelmholtz[V_, A_, Leff_] := (cSound / (2*Pi)) * Sqrt[A / (V * Leff)]


(* ─── §3  String Schedules ───────────────────────────────────── *)

(* Kamele 10 computed schedule *)
freqs10 = midiToHz /@ midiNotes10;

gauges10 = MapThread[gaugeDiam, {lengths10, tensions10, freqs10}];
gaugesMM10 = gauges10 * 25.4;
pctBreak10 = MapThread[pctBreaking, {lengths10, freqs10}];

kamele10Table = Transpose[{
  Range[10],
  noteNames10,
  NumberForm[#, {5,2}]& /@ freqs10,
  lengths10,
  tensions10,
  NumberForm[#, {4,4}]& /@ gauges10,
  NumberForm[#, {4,3}]& /@ gaugesMM10,
  NumberForm[#, {4,1}]& /@ pctBreak10
}];

Print["=== Kamele 10 String Schedule (Mersenne-Taylor) ==="];
Print[TableForm[kamele10Table,
  TableHeadings -> {None, {"#","Note","Freq(Hz)","Len(in)","T(lbf)","Gauge(in)","Gauge(mm)","%Break"}}
]];


(* ─── §4  Bowl Resonator ─────────────────────────────────────── *)

(* Volume estimate (cylindrical approximation — first order) *)
Vbowl = Pi * (bowlOD/2)^2 * bowlDepth;  (* in³ *)
Aport = Pi * (neckHoleDiam/2)^2;        (* in² *)
Lport = 0.75;                            (* in, effective neck length at bowl entry *)

fHelm = fHelmholtz[Vbowl, Aport, Lport];

Print["\n=== Bowl Helmholtz Resonance (first-order, rigid walls) ==="];
Print["Bowl volume (cylindrical approx): ", NumberForm[Vbowl, 5], " in³ = ",
      NumberForm[Vbowl * 16.387, 6], " cm³"];
Print["Helmholtz f ≈ ", NumberForm[fHelm, 4], " Hz"];
Print["Note: goatskin compliance will shift resonance LOWER than this estimate."];
Print["Bowl acts primarily as broadband radiator + skin-mode coupling, not sharp resonator."];


(* ─── §5  Manipulate: Interactive String Explorer ────────────── *)

(* Interactive: adjust string length and tension; see frequency and gauge *)
stringExplorer = Manipulate[
  Module[{f, d, pct},
    f = (1/(2*L)) * Sqrt[T * g / (\[Rho]nylon * Pi * (d0/2)^2)];
    d = gaugeDiam[L, T, midiToHz[midi]];
    pct = pctBreaking[L, midiToHz[midi]];
    Column[{
      Row[{"Note: ", midiToHz[midi]//Round, " Hz (MIDI ", midi, ")"}],
      Row[{"Vibrating length: ", L, " in"}],
      Row[{"Tension: ", T, " lbf"}],
      Row[{"Required gauge: ", NumberForm[d, {4,4}], " in = ", NumberForm[d*25.4, {4,3}], " mm"}],
      Row[{"% Breaking: ", NumberForm[pct, {4,1}], "%",
           If[pct > 60, Style["  ⚠ HIGH", Red], Style["  ✓ SAFE", Darker[Green]]]}],
      BarChart[{pct, 100 - pct},
        ChartLabels -> {"% used", "margin"},
        ChartStyle -> {If[pct > 60, Red, Darker[Green]], LightGray},
        PlotLabel -> "String Tension Usage",
        ImageSize -> 300]
    }]
  ],
  {{L, 14.0, "Vibrating length (in)"}, 4.0, 30.0, 0.5, Appearance -> "Labeled"},
  {{T, 8.0, "Tension (lbf)"}, 2.0, 20.0, 0.5, Appearance -> "Labeled"},
  {{midi, 62, "MIDI note"}, 48, 86, 1, Appearance -> "Labeled"},
  {{d0, 0.040, "Gauge for freq check (in)"}, 0.010, 0.060, 0.001, Appearance -> "Labeled"},
  ControlPlacement -> Left
];


(* ─── §6  Audio Preview — Kamele 10 Pentatonic ──────────────── *)

(* Synthesize plucked string tones (Karplus-Strong approximation via SoundNote) *)
pentatonicD = {"D5","C5","A4","G4","F4","D4","C4","A3","G3","F3"};

ngoniAudioPreview = Sound[
  Table[
    SoundNote[pentatonicD[[i]], {(i-1)*0.6, (i-1)*0.6 + 1.2}, "ElectricGuitar"],
    {i, 1, 10}
  ]
];

(* To play: EmitSound[ngoniAudioPreview] *)
Print["\n§6 Audio Preview ready. Run: EmitSound[ngoniAudioPreview]"];
Print["(Uses ElectricGuitar approximation — substitute nylon pluck if available)"];


(* ─── §7  Validation Plot ────────────────────────────────────── *)

(* Plot predicted vs measured frequencies (fill in measured column after build) *)
predictedHz10 = midiToHz /@ midiNotes10;

(* Placeholder measured values — replace with actual tuner measurements *)
measuredHz10 = Table[TBD, {10}];  (* Replace TBD with measured values *)

(* Cents error function *)
centsError[pred_, meas_] := 1200 * Log[2, meas/pred];

(* Uncomment after filling in measuredHz10:
centsErrors = MapThread[centsError, {predictedHz10, measuredHz10}];
ListPlot[centsErrors,
  PlotLabel -> "Kamele 10 — Cents Error (measured vs predicted)",
  AxesLabel -> {"String #", "Cents Error"},
  PlotStyle -> PointSize[0.015],
  GridLines -> {{}, {-5, 0, 5}},
  ImageSize -> 480]
*)

Print["\n§7 Validation plot: fill in measuredHz10 after tuning and uncomment plot."];


(* ─── §8  Cultural Context Timeline ─────────────────────────── *)

(* Historical timeline of ngoni development *)
ngoniTimeline = TimelinePlot[
  {
    Labeled[Interval[{DateObject[{-1000}], DateObject[{1200}]}],
            "Donso ngoni\n(hunter's brotherhoods, Mande)"],
    Labeled[DateObject[{1960}],
            "Kamele ngoni modernized\n(Allata Brulaye Sidibé, Guinea, ~1950s–60s)"],
    Labeled[DateObject[{1800}],
            "Transatlantic diaspora\n(ngoni → banjo lineage, debated)"],
    Labeled[DateObject[{2000}],
            "World music adoption\n(international luthiery + pedagogy)"]
  },
  PlotLabel -> "Ngoni Family — Historical Timeline",
  ImageSize -> 550
];

(* To display: ngoniTimeline *)
Print["\n§8 Cultural timeline ready. Run: ngoniTimeline"];
Print["Ref: Charry (2000) Mande Music; Coolen (1984) Fodet paper."];


(* ─── End of package ─────────────────────────────────────────── *)
Print["\n✓ Ngoni model package loaded. Sections: §1 params · §2 formulas · §3 schedules · §4 bowl · §5 Manipulate · §6 audio · §7 validation · §8 timeline"];
