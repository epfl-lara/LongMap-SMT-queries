; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66782 () Bool)

(assert start!66782)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42363 0))(
  ( (array!42364 (arr!20282 (Array (_ BitVec 32) (_ BitVec 64))) (size!20703 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42363)

(declare-fun b!770266 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7879 0))(
  ( (MissingZero!7879 (index!33884 (_ BitVec 32))) (Found!7879 (index!33885 (_ BitVec 32))) (Intermediate!7879 (undefined!8691 Bool) (index!33886 (_ BitVec 32)) (x!64821 (_ BitVec 32))) (Undefined!7879) (MissingVacant!7879 (index!33887 (_ BitVec 32))) )
))
(declare-fun lt!342705 () SeekEntryResult!7879)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!428840 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42363 (_ BitVec 32)) SeekEntryResult!7879)

(assert (=> b!770266 (= e!428840 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20282 a!3186) j!159) a!3186 mask!3328) lt!342705))))

(declare-fun b!770267 () Bool)

(declare-fun e!428845 () Bool)

(assert (=> b!770267 (= e!428845 true)))

(declare-datatypes ((Unit!26510 0))(
  ( (Unit!26511) )
))
(declare-fun lt!342700 () Unit!26510)

(declare-fun e!428844 () Unit!26510)

(assert (=> b!770267 (= lt!342700 e!428844)))

(declare-fun c!84977 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!770267 (= c!84977 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!342697 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770267 (= lt!342697 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!770268 () Bool)

(declare-fun e!428842 () Bool)

(declare-fun e!428841 () Bool)

(assert (=> b!770268 (= e!428842 e!428841)))

(declare-fun res!521114 () Bool)

(assert (=> b!770268 (=> (not res!521114) (not e!428841))))

(declare-fun lt!342701 () SeekEntryResult!7879)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42363 (_ BitVec 32)) SeekEntryResult!7879)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770268 (= res!521114 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20282 a!3186) j!159) mask!3328) (select (arr!20282 a!3186) j!159) a!3186 mask!3328) lt!342701))))

(assert (=> b!770268 (= lt!342701 (Intermediate!7879 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!770269 () Bool)

(declare-fun res!521112 () Bool)

(assert (=> b!770269 (=> (not res!521112) (not e!428842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42363 (_ BitVec 32)) Bool)

(assert (=> b!770269 (= res!521112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!770270 () Bool)

(declare-fun e!428843 () Bool)

(assert (=> b!770270 (= e!428843 e!428840)))

(declare-fun res!521117 () Bool)

(assert (=> b!770270 (=> (not res!521117) (not e!428840))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42363 (_ BitVec 32)) SeekEntryResult!7879)

(assert (=> b!770270 (= res!521117 (= (seekEntryOrOpen!0 (select (arr!20282 a!3186) j!159) a!3186 mask!3328) lt!342705))))

(assert (=> b!770270 (= lt!342705 (Found!7879 j!159))))

(declare-fun b!770271 () Bool)

(declare-fun res!521115 () Bool)

(declare-fun e!428836 () Bool)

(assert (=> b!770271 (=> (not res!521115) (not e!428836))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!770271 (= res!521115 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun e!428838 () Bool)

(declare-fun b!770272 () Bool)

(assert (=> b!770272 (= e!428838 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20282 a!3186) j!159) a!3186 mask!3328) (Found!7879 j!159)))))

(declare-fun b!770273 () Bool)

(declare-fun Unit!26512 () Unit!26510)

(assert (=> b!770273 (= e!428844 Unit!26512)))

(assert (=> b!770273 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342697 (select (arr!20282 a!3186) j!159) a!3186 mask!3328) lt!342701)))

(declare-fun b!770274 () Bool)

(declare-fun e!428837 () Bool)

(assert (=> b!770274 (= e!428837 (not e!428845))))

(declare-fun res!521111 () Bool)

(assert (=> b!770274 (=> res!521111 e!428845)))

(declare-fun lt!342707 () SeekEntryResult!7879)

(get-info :version)

(assert (=> b!770274 (= res!521111 (or (not ((_ is Intermediate!7879) lt!342707)) (bvsge x!1131 (x!64821 lt!342707))))))

(assert (=> b!770274 e!428843))

(declare-fun res!521110 () Bool)

(assert (=> b!770274 (=> (not res!521110) (not e!428843))))

(assert (=> b!770274 (= res!521110 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!342698 () Unit!26510)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42363 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26510)

(assert (=> b!770274 (= lt!342698 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!770276 () Bool)

(declare-fun res!521108 () Bool)

(assert (=> b!770276 (=> (not res!521108) (not e!428836))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!770276 (= res!521108 (validKeyInArray!0 (select (arr!20282 a!3186) j!159)))))

(declare-fun b!770277 () Bool)

(assert (=> b!770277 (= e!428841 e!428837)))

(declare-fun res!521103 () Bool)

(assert (=> b!770277 (=> (not res!521103) (not e!428837))))

(declare-fun lt!342704 () SeekEntryResult!7879)

(assert (=> b!770277 (= res!521103 (= lt!342704 lt!342707))))

(declare-fun lt!342699 () (_ BitVec 64))

(declare-fun lt!342706 () array!42363)

(assert (=> b!770277 (= lt!342707 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342699 lt!342706 mask!3328))))

(assert (=> b!770277 (= lt!342704 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342699 mask!3328) lt!342699 lt!342706 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!770277 (= lt!342699 (select (store (arr!20282 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!770277 (= lt!342706 (array!42364 (store (arr!20282 a!3186) i!1173 k0!2102) (size!20703 a!3186)))))

(declare-fun b!770278 () Bool)

(declare-fun Unit!26513 () Unit!26510)

(assert (=> b!770278 (= e!428844 Unit!26513)))

(declare-fun lt!342702 () SeekEntryResult!7879)

(assert (=> b!770278 (= lt!342702 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20282 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!770278 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342697 resIntermediateIndex!5 (select (arr!20282 a!3186) j!159) a!3186 mask!3328) (Found!7879 j!159))))

(declare-fun b!770279 () Bool)

(assert (=> b!770279 (= e!428838 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20282 a!3186) j!159) a!3186 mask!3328) lt!342701))))

(declare-fun b!770280 () Bool)

(assert (=> b!770280 (= e!428836 e!428842)))

(declare-fun res!521113 () Bool)

(assert (=> b!770280 (=> (not res!521113) (not e!428842))))

(declare-fun lt!342703 () SeekEntryResult!7879)

(assert (=> b!770280 (= res!521113 (or (= lt!342703 (MissingZero!7879 i!1173)) (= lt!342703 (MissingVacant!7879 i!1173))))))

(assert (=> b!770280 (= lt!342703 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!770281 () Bool)

(declare-fun res!521109 () Bool)

(assert (=> b!770281 (=> (not res!521109) (not e!428842))))

(declare-datatypes ((List!14323 0))(
  ( (Nil!14320) (Cons!14319 (h!15418 (_ BitVec 64)) (t!20629 List!14323)) )
))
(declare-fun arrayNoDuplicates!0 (array!42363 (_ BitVec 32) List!14323) Bool)

(assert (=> b!770281 (= res!521109 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14320))))

(declare-fun b!770282 () Bool)

(declare-fun res!521105 () Bool)

(assert (=> b!770282 (=> (not res!521105) (not e!428836))))

(assert (=> b!770282 (= res!521105 (and (= (size!20703 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20703 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20703 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!770283 () Bool)

(declare-fun res!521106 () Bool)

(assert (=> b!770283 (=> (not res!521106) (not e!428841))))

(assert (=> b!770283 (= res!521106 e!428838)))

(declare-fun c!84978 () Bool)

(assert (=> b!770283 (= c!84978 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!770284 () Bool)

(declare-fun res!521104 () Bool)

(assert (=> b!770284 (=> (not res!521104) (not e!428842))))

(assert (=> b!770284 (= res!521104 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20703 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20703 a!3186))))))

(declare-fun b!770285 () Bool)

(declare-fun res!521118 () Bool)

(assert (=> b!770285 (=> (not res!521118) (not e!428841))))

(assert (=> b!770285 (= res!521118 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20282 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!770275 () Bool)

(declare-fun res!521116 () Bool)

(assert (=> b!770275 (=> (not res!521116) (not e!428836))))

(assert (=> b!770275 (= res!521116 (validKeyInArray!0 k0!2102))))

(declare-fun res!521107 () Bool)

(assert (=> start!66782 (=> (not res!521107) (not e!428836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66782 (= res!521107 (validMask!0 mask!3328))))

(assert (=> start!66782 e!428836))

(assert (=> start!66782 true))

(declare-fun array_inv!16165 (array!42363) Bool)

(assert (=> start!66782 (array_inv!16165 a!3186)))

(assert (= (and start!66782 res!521107) b!770282))

(assert (= (and b!770282 res!521105) b!770276))

(assert (= (and b!770276 res!521108) b!770275))

(assert (= (and b!770275 res!521116) b!770271))

(assert (= (and b!770271 res!521115) b!770280))

(assert (= (and b!770280 res!521113) b!770269))

(assert (= (and b!770269 res!521112) b!770281))

(assert (= (and b!770281 res!521109) b!770284))

(assert (= (and b!770284 res!521104) b!770268))

(assert (= (and b!770268 res!521114) b!770285))

(assert (= (and b!770285 res!521118) b!770283))

(assert (= (and b!770283 c!84978) b!770279))

(assert (= (and b!770283 (not c!84978)) b!770272))

(assert (= (and b!770283 res!521106) b!770277))

(assert (= (and b!770277 res!521103) b!770274))

(assert (= (and b!770274 res!521110) b!770270))

(assert (= (and b!770270 res!521117) b!770266))

(assert (= (and b!770274 (not res!521111)) b!770267))

(assert (= (and b!770267 c!84977) b!770273))

(assert (= (and b!770267 (not c!84977)) b!770278))

(declare-fun m!715029 () Bool)

(assert (=> b!770280 m!715029))

(declare-fun m!715031 () Bool)

(assert (=> b!770276 m!715031))

(assert (=> b!770276 m!715031))

(declare-fun m!715033 () Bool)

(assert (=> b!770276 m!715033))

(assert (=> b!770268 m!715031))

(assert (=> b!770268 m!715031))

(declare-fun m!715035 () Bool)

(assert (=> b!770268 m!715035))

(assert (=> b!770268 m!715035))

(assert (=> b!770268 m!715031))

(declare-fun m!715037 () Bool)

(assert (=> b!770268 m!715037))

(assert (=> b!770279 m!715031))

(assert (=> b!770279 m!715031))

(declare-fun m!715039 () Bool)

(assert (=> b!770279 m!715039))

(assert (=> b!770272 m!715031))

(assert (=> b!770272 m!715031))

(declare-fun m!715041 () Bool)

(assert (=> b!770272 m!715041))

(declare-fun m!715043 () Bool)

(assert (=> b!770269 m!715043))

(assert (=> b!770266 m!715031))

(assert (=> b!770266 m!715031))

(declare-fun m!715045 () Bool)

(assert (=> b!770266 m!715045))

(assert (=> b!770273 m!715031))

(assert (=> b!770273 m!715031))

(declare-fun m!715047 () Bool)

(assert (=> b!770273 m!715047))

(declare-fun m!715049 () Bool)

(assert (=> b!770277 m!715049))

(declare-fun m!715051 () Bool)

(assert (=> b!770277 m!715051))

(declare-fun m!715053 () Bool)

(assert (=> b!770277 m!715053))

(declare-fun m!715055 () Bool)

(assert (=> b!770277 m!715055))

(declare-fun m!715057 () Bool)

(assert (=> b!770277 m!715057))

(assert (=> b!770277 m!715051))

(declare-fun m!715059 () Bool)

(assert (=> b!770275 m!715059))

(declare-fun m!715061 () Bool)

(assert (=> b!770274 m!715061))

(declare-fun m!715063 () Bool)

(assert (=> b!770274 m!715063))

(declare-fun m!715065 () Bool)

(assert (=> b!770285 m!715065))

(assert (=> b!770278 m!715031))

(assert (=> b!770278 m!715031))

(assert (=> b!770278 m!715041))

(assert (=> b!770278 m!715031))

(declare-fun m!715067 () Bool)

(assert (=> b!770278 m!715067))

(declare-fun m!715069 () Bool)

(assert (=> b!770281 m!715069))

(assert (=> b!770270 m!715031))

(assert (=> b!770270 m!715031))

(declare-fun m!715071 () Bool)

(assert (=> b!770270 m!715071))

(declare-fun m!715073 () Bool)

(assert (=> b!770267 m!715073))

(declare-fun m!715075 () Bool)

(assert (=> b!770271 m!715075))

(declare-fun m!715077 () Bool)

(assert (=> start!66782 m!715077))

(declare-fun m!715079 () Bool)

(assert (=> start!66782 m!715079))

(check-sat (not b!770277) (not b!770267) (not b!770266) (not b!770279) (not b!770281) (not b!770275) (not b!770268) (not b!770271) (not b!770270) (not start!66782) (not b!770273) (not b!770278) (not b!770269) (not b!770276) (not b!770280) (not b!770272) (not b!770274))
(check-sat)
