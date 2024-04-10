; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65658 () Bool)

(assert start!65658)

(declare-fun b!752114 () Bool)

(declare-datatypes ((Unit!25896 0))(
  ( (Unit!25897) )
))
(declare-fun e!419538 () Unit!25896)

(declare-fun Unit!25898 () Unit!25896)

(assert (=> b!752114 (= e!419538 Unit!25898)))

(declare-fun b!752115 () Bool)

(declare-fun e!419545 () Bool)

(declare-datatypes ((SeekEntryResult!7629 0))(
  ( (MissingZero!7629 (index!32884 (_ BitVec 32))) (Found!7629 (index!32885 (_ BitVec 32))) (Intermediate!7629 (undefined!8441 Bool) (index!32886 (_ BitVec 32)) (x!63803 (_ BitVec 32))) (Undefined!7629) (MissingVacant!7629 (index!32887 (_ BitVec 32))) )
))
(declare-fun lt!334536 () SeekEntryResult!7629)

(declare-fun lt!334535 () SeekEntryResult!7629)

(assert (=> b!752115 (= e!419545 (= lt!334536 lt!334535))))

(declare-fun b!752116 () Bool)

(declare-fun res!507880 () Bool)

(declare-fun e!419541 () Bool)

(assert (=> b!752116 (=> (not res!507880) (not e!419541))))

(declare-datatypes ((array!41831 0))(
  ( (array!41832 (arr!20029 (Array (_ BitVec 32) (_ BitVec 64))) (size!20450 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41831)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41831 (_ BitVec 32)) Bool)

(assert (=> b!752116 (= res!507880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!752117 () Bool)

(declare-fun res!507875 () Bool)

(assert (=> b!752117 (=> (not res!507875) (not e!419545))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!334533 () array!41831)

(declare-fun lt!334538 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41831 (_ BitVec 32)) SeekEntryResult!7629)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41831 (_ BitVec 32)) SeekEntryResult!7629)

(assert (=> b!752117 (= res!507875 (= (seekEntryOrOpen!0 lt!334538 lt!334533 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334538 lt!334533 mask!3328)))))

(declare-fun b!752118 () Bool)

(declare-fun e!419549 () Bool)

(assert (=> b!752118 (= e!419541 e!419549)))

(declare-fun res!507881 () Bool)

(assert (=> b!752118 (=> (not res!507881) (not e!419549))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!334532 () SeekEntryResult!7629)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41831 (_ BitVec 32)) SeekEntryResult!7629)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!752118 (= res!507881 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20029 a!3186) j!159) mask!3328) (select (arr!20029 a!3186) j!159) a!3186 mask!3328) lt!334532))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!752118 (= lt!334532 (Intermediate!7629 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!752119 () Bool)

(declare-fun e!419540 () Bool)

(assert (=> b!752119 (= e!419549 e!419540)))

(declare-fun res!507876 () Bool)

(assert (=> b!752119 (=> (not res!507876) (not e!419540))))

(declare-fun lt!334531 () SeekEntryResult!7629)

(declare-fun lt!334539 () SeekEntryResult!7629)

(assert (=> b!752119 (= res!507876 (= lt!334531 lt!334539))))

(assert (=> b!752119 (= lt!334539 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334538 lt!334533 mask!3328))))

(assert (=> b!752119 (= lt!334531 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334538 mask!3328) lt!334538 lt!334533 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!752119 (= lt!334538 (select (store (arr!20029 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!752119 (= lt!334533 (array!41832 (store (arr!20029 a!3186) i!1173 k0!2102) (size!20450 a!3186)))))

(declare-fun b!752120 () Bool)

(declare-fun res!507869 () Bool)

(declare-fun e!419548 () Bool)

(assert (=> b!752120 (=> (not res!507869) (not e!419548))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!752120 (= res!507869 (validKeyInArray!0 (select (arr!20029 a!3186) j!159)))))

(declare-fun b!752121 () Bool)

(declare-fun res!507871 () Bool)

(assert (=> b!752121 (=> (not res!507871) (not e!419548))))

(assert (=> b!752121 (= res!507871 (and (= (size!20450 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20450 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20450 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!752122 () Bool)

(declare-fun e!419542 () Bool)

(assert (=> b!752122 (= e!419542 true)))

(assert (=> b!752122 e!419545))

(declare-fun res!507874 () Bool)

(assert (=> b!752122 (=> (not res!507874) (not e!419545))))

(declare-fun lt!334537 () (_ BitVec 64))

(assert (=> b!752122 (= res!507874 (= lt!334537 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334541 () Unit!25896)

(assert (=> b!752122 (= lt!334541 e!419538)))

(declare-fun c!82504 () Bool)

(assert (=> b!752122 (= c!82504 (= lt!334537 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!419546 () Bool)

(declare-fun b!752123 () Bool)

(assert (=> b!752123 (= e!419546 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20029 a!3186) j!159) a!3186 mask!3328) (Found!7629 j!159)))))

(declare-fun b!752124 () Bool)

(declare-fun res!507884 () Bool)

(assert (=> b!752124 (=> (not res!507884) (not e!419541))))

(assert (=> b!752124 (= res!507884 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20450 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20450 a!3186))))))

(declare-fun b!752125 () Bool)

(declare-fun res!507886 () Bool)

(assert (=> b!752125 (=> (not res!507886) (not e!419548))))

(declare-fun arrayContainsKey!0 (array!41831 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!752125 (= res!507886 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun e!419547 () Bool)

(declare-fun b!752126 () Bool)

(declare-fun lt!334530 () SeekEntryResult!7629)

(assert (=> b!752126 (= e!419547 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20029 a!3186) j!159) a!3186 mask!3328) lt!334530))))

(declare-fun b!752127 () Bool)

(declare-fun e!419539 () Bool)

(declare-fun e!419544 () Bool)

(assert (=> b!752127 (= e!419539 e!419544)))

(declare-fun res!507885 () Bool)

(assert (=> b!752127 (=> res!507885 e!419544)))

(assert (=> b!752127 (= res!507885 (not (= lt!334535 lt!334530)))))

(assert (=> b!752127 (= lt!334535 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20029 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!752128 () Bool)

(assert (=> b!752128 (= e!419548 e!419541)))

(declare-fun res!507887 () Bool)

(assert (=> b!752128 (=> (not res!507887) (not e!419541))))

(declare-fun lt!334540 () SeekEntryResult!7629)

(assert (=> b!752128 (= res!507887 (or (= lt!334540 (MissingZero!7629 i!1173)) (= lt!334540 (MissingVacant!7629 i!1173))))))

(assert (=> b!752128 (= lt!334540 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!752129 () Bool)

(assert (=> b!752129 (= e!419544 e!419542)))

(declare-fun res!507872 () Bool)

(assert (=> b!752129 (=> res!507872 e!419542)))

(assert (=> b!752129 (= res!507872 (= lt!334537 lt!334538))))

(assert (=> b!752129 (= lt!334537 (select (store (arr!20029 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!752130 () Bool)

(assert (=> b!752130 (= e!419540 (not e!419539))))

(declare-fun res!507882 () Bool)

(assert (=> b!752130 (=> res!507882 e!419539)))

(get-info :version)

(assert (=> b!752130 (= res!507882 (or (not ((_ is Intermediate!7629) lt!334539)) (bvslt x!1131 (x!63803 lt!334539)) (not (= x!1131 (x!63803 lt!334539))) (not (= index!1321 (index!32886 lt!334539)))))))

(assert (=> b!752130 e!419547))

(declare-fun res!507870 () Bool)

(assert (=> b!752130 (=> (not res!507870) (not e!419547))))

(assert (=> b!752130 (= res!507870 (= lt!334536 lt!334530))))

(assert (=> b!752130 (= lt!334530 (Found!7629 j!159))))

(assert (=> b!752130 (= lt!334536 (seekEntryOrOpen!0 (select (arr!20029 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!752130 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334534 () Unit!25896)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41831 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25896)

(assert (=> b!752130 (= lt!334534 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!507877 () Bool)

(assert (=> start!65658 (=> (not res!507877) (not e!419548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65658 (= res!507877 (validMask!0 mask!3328))))

(assert (=> start!65658 e!419548))

(assert (=> start!65658 true))

(declare-fun array_inv!15825 (array!41831) Bool)

(assert (=> start!65658 (array_inv!15825 a!3186)))

(declare-fun b!752131 () Bool)

(declare-fun res!507873 () Bool)

(assert (=> b!752131 (=> (not res!507873) (not e!419549))))

(assert (=> b!752131 (= res!507873 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20029 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!752132 () Bool)

(declare-fun res!507883 () Bool)

(assert (=> b!752132 (=> (not res!507883) (not e!419541))))

(declare-datatypes ((List!14031 0))(
  ( (Nil!14028) (Cons!14027 (h!15099 (_ BitVec 64)) (t!20346 List!14031)) )
))
(declare-fun arrayNoDuplicates!0 (array!41831 (_ BitVec 32) List!14031) Bool)

(assert (=> b!752132 (= res!507883 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14028))))

(declare-fun b!752133 () Bool)

(declare-fun Unit!25899 () Unit!25896)

(assert (=> b!752133 (= e!419538 Unit!25899)))

(assert (=> b!752133 false))

(declare-fun b!752134 () Bool)

(declare-fun res!507879 () Bool)

(assert (=> b!752134 (=> (not res!507879) (not e!419549))))

(assert (=> b!752134 (= res!507879 e!419546)))

(declare-fun c!82503 () Bool)

(assert (=> b!752134 (= c!82503 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!752135 () Bool)

(declare-fun res!507878 () Bool)

(assert (=> b!752135 (=> (not res!507878) (not e!419548))))

(assert (=> b!752135 (= res!507878 (validKeyInArray!0 k0!2102))))

(declare-fun b!752136 () Bool)

(assert (=> b!752136 (= e!419546 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20029 a!3186) j!159) a!3186 mask!3328) lt!334532))))

(assert (= (and start!65658 res!507877) b!752121))

(assert (= (and b!752121 res!507871) b!752120))

(assert (= (and b!752120 res!507869) b!752135))

(assert (= (and b!752135 res!507878) b!752125))

(assert (= (and b!752125 res!507886) b!752128))

(assert (= (and b!752128 res!507887) b!752116))

(assert (= (and b!752116 res!507880) b!752132))

(assert (= (and b!752132 res!507883) b!752124))

(assert (= (and b!752124 res!507884) b!752118))

(assert (= (and b!752118 res!507881) b!752131))

(assert (= (and b!752131 res!507873) b!752134))

(assert (= (and b!752134 c!82503) b!752136))

(assert (= (and b!752134 (not c!82503)) b!752123))

(assert (= (and b!752134 res!507879) b!752119))

(assert (= (and b!752119 res!507876) b!752130))

(assert (= (and b!752130 res!507870) b!752126))

(assert (= (and b!752130 (not res!507882)) b!752127))

(assert (= (and b!752127 (not res!507885)) b!752129))

(assert (= (and b!752129 (not res!507872)) b!752122))

(assert (= (and b!752122 c!82504) b!752133))

(assert (= (and b!752122 (not c!82504)) b!752114))

(assert (= (and b!752122 res!507874) b!752117))

(assert (= (and b!752117 res!507875) b!752115))

(declare-fun m!701135 () Bool)

(assert (=> b!752129 m!701135))

(declare-fun m!701137 () Bool)

(assert (=> b!752129 m!701137))

(declare-fun m!701139 () Bool)

(assert (=> b!752127 m!701139))

(assert (=> b!752127 m!701139))

(declare-fun m!701141 () Bool)

(assert (=> b!752127 m!701141))

(assert (=> b!752136 m!701139))

(assert (=> b!752136 m!701139))

(declare-fun m!701143 () Bool)

(assert (=> b!752136 m!701143))

(declare-fun m!701145 () Bool)

(assert (=> start!65658 m!701145))

(declare-fun m!701147 () Bool)

(assert (=> start!65658 m!701147))

(declare-fun m!701149 () Bool)

(assert (=> b!752132 m!701149))

(assert (=> b!752120 m!701139))

(assert (=> b!752120 m!701139))

(declare-fun m!701151 () Bool)

(assert (=> b!752120 m!701151))

(declare-fun m!701153 () Bool)

(assert (=> b!752125 m!701153))

(declare-fun m!701155 () Bool)

(assert (=> b!752128 m!701155))

(declare-fun m!701157 () Bool)

(assert (=> b!752116 m!701157))

(declare-fun m!701159 () Bool)

(assert (=> b!752135 m!701159))

(declare-fun m!701161 () Bool)

(assert (=> b!752131 m!701161))

(assert (=> b!752130 m!701139))

(assert (=> b!752130 m!701139))

(declare-fun m!701163 () Bool)

(assert (=> b!752130 m!701163))

(declare-fun m!701165 () Bool)

(assert (=> b!752130 m!701165))

(declare-fun m!701167 () Bool)

(assert (=> b!752130 m!701167))

(declare-fun m!701169 () Bool)

(assert (=> b!752117 m!701169))

(declare-fun m!701171 () Bool)

(assert (=> b!752117 m!701171))

(assert (=> b!752123 m!701139))

(assert (=> b!752123 m!701139))

(assert (=> b!752123 m!701141))

(declare-fun m!701173 () Bool)

(assert (=> b!752119 m!701173))

(assert (=> b!752119 m!701173))

(declare-fun m!701175 () Bool)

(assert (=> b!752119 m!701175))

(declare-fun m!701177 () Bool)

(assert (=> b!752119 m!701177))

(assert (=> b!752119 m!701135))

(declare-fun m!701179 () Bool)

(assert (=> b!752119 m!701179))

(assert (=> b!752126 m!701139))

(assert (=> b!752126 m!701139))

(declare-fun m!701181 () Bool)

(assert (=> b!752126 m!701181))

(assert (=> b!752118 m!701139))

(assert (=> b!752118 m!701139))

(declare-fun m!701183 () Bool)

(assert (=> b!752118 m!701183))

(assert (=> b!752118 m!701183))

(assert (=> b!752118 m!701139))

(declare-fun m!701185 () Bool)

(assert (=> b!752118 m!701185))

(check-sat (not b!752136) (not b!752135) (not b!752128) (not b!752132) (not b!752130) (not b!752118) (not b!752127) (not b!752119) (not b!752116) (not start!65658) (not b!752117) (not b!752123) (not b!752125) (not b!752120) (not b!752126))
(check-sat)
