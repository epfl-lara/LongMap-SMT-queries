; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67012 () Bool)

(assert start!67012)

(declare-fun b!773360 () Bool)

(declare-fun e!430508 () Bool)

(assert (=> b!773360 (= e!430508 true)))

(declare-datatypes ((Unit!26674 0))(
  ( (Unit!26675) )
))
(declare-fun lt!344368 () Unit!26674)

(declare-fun e!430505 () Unit!26674)

(assert (=> b!773360 (= lt!344368 e!430505)))

(declare-fun c!85569 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!773360 (= c!85569 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!344365 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773360 (= lt!344365 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!773361 () Bool)

(declare-fun e!430509 () Bool)

(declare-fun e!430502 () Bool)

(assert (=> b!773361 (= e!430509 e!430502)))

(declare-fun res!523026 () Bool)

(assert (=> b!773361 (=> (not res!523026) (not e!430502))))

(declare-datatypes ((array!42436 0))(
  ( (array!42437 (arr!20315 (Array (_ BitVec 32) (_ BitVec 64))) (size!20736 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42436)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7915 0))(
  ( (MissingZero!7915 (index!34028 (_ BitVec 32))) (Found!7915 (index!34029 (_ BitVec 32))) (Intermediate!7915 (undefined!8727 Bool) (index!34030 (_ BitVec 32)) (x!64966 (_ BitVec 32))) (Undefined!7915) (MissingVacant!7915 (index!34031 (_ BitVec 32))) )
))
(declare-fun lt!344371 () SeekEntryResult!7915)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42436 (_ BitVec 32)) SeekEntryResult!7915)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773361 (= res!523026 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20315 a!3186) j!159) mask!3328) (select (arr!20315 a!3186) j!159) a!3186 mask!3328) lt!344371))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!773361 (= lt!344371 (Intermediate!7915 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!773362 () Bool)

(declare-fun res!523025 () Bool)

(declare-fun e!430507 () Bool)

(assert (=> b!773362 (=> (not res!523025) (not e!430507))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!773362 (= res!523025 (validKeyInArray!0 (select (arr!20315 a!3186) j!159)))))

(declare-fun res!523023 () Bool)

(assert (=> start!67012 (=> (not res!523023) (not e!430507))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67012 (= res!523023 (validMask!0 mask!3328))))

(assert (=> start!67012 e!430507))

(assert (=> start!67012 true))

(declare-fun array_inv!16111 (array!42436) Bool)

(assert (=> start!67012 (array_inv!16111 a!3186)))

(declare-fun b!773363 () Bool)

(declare-fun res!523029 () Bool)

(assert (=> b!773363 (=> (not res!523029) (not e!430509))))

(assert (=> b!773363 (= res!523029 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20736 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20736 a!3186))))))

(declare-fun b!773364 () Bool)

(declare-fun e!430511 () Bool)

(assert (=> b!773364 (= e!430502 e!430511)))

(declare-fun res!523034 () Bool)

(assert (=> b!773364 (=> (not res!523034) (not e!430511))))

(declare-fun lt!344366 () SeekEntryResult!7915)

(declare-fun lt!344370 () SeekEntryResult!7915)

(assert (=> b!773364 (= res!523034 (= lt!344366 lt!344370))))

(declare-fun lt!344374 () array!42436)

(declare-fun lt!344369 () (_ BitVec 64))

(assert (=> b!773364 (= lt!344370 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344369 lt!344374 mask!3328))))

(assert (=> b!773364 (= lt!344366 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344369 mask!3328) lt!344369 lt!344374 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!773364 (= lt!344369 (select (store (arr!20315 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!773364 (= lt!344374 (array!42437 (store (arr!20315 a!3186) i!1173 k!2102) (size!20736 a!3186)))))

(declare-fun e!430503 () Bool)

(declare-fun b!773365 () Bool)

(assert (=> b!773365 (= e!430503 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20315 a!3186) j!159) a!3186 mask!3328) lt!344371))))

(declare-fun b!773366 () Bool)

(declare-fun res!523022 () Bool)

(assert (=> b!773366 (=> (not res!523022) (not e!430502))))

(assert (=> b!773366 (= res!523022 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20315 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!773367 () Bool)

(declare-fun res!523021 () Bool)

(assert (=> b!773367 (=> (not res!523021) (not e!430507))))

(declare-fun arrayContainsKey!0 (array!42436 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!773367 (= res!523021 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!773368 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42436 (_ BitVec 32)) SeekEntryResult!7915)

(assert (=> b!773368 (= e!430503 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20315 a!3186) j!159) a!3186 mask!3328) (Found!7915 j!159)))))

(declare-fun b!773369 () Bool)

(assert (=> b!773369 (= e!430511 (not e!430508))))

(declare-fun res!523024 () Bool)

(assert (=> b!773369 (=> res!523024 e!430508)))

(assert (=> b!773369 (= res!523024 (or (not (is-Intermediate!7915 lt!344370)) (bvsge x!1131 (x!64966 lt!344370))))))

(declare-fun e!430510 () Bool)

(assert (=> b!773369 e!430510))

(declare-fun res!523019 () Bool)

(assert (=> b!773369 (=> (not res!523019) (not e!430510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42436 (_ BitVec 32)) Bool)

(assert (=> b!773369 (= res!523019 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!344367 () Unit!26674)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42436 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26674)

(assert (=> b!773369 (= lt!344367 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!773370 () Bool)

(assert (=> b!773370 (= e!430507 e!430509)))

(declare-fun res!523031 () Bool)

(assert (=> b!773370 (=> (not res!523031) (not e!430509))))

(declare-fun lt!344373 () SeekEntryResult!7915)

(assert (=> b!773370 (= res!523031 (or (= lt!344373 (MissingZero!7915 i!1173)) (= lt!344373 (MissingVacant!7915 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42436 (_ BitVec 32)) SeekEntryResult!7915)

(assert (=> b!773370 (= lt!344373 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!773371 () Bool)

(declare-fun Unit!26676 () Unit!26674)

(assert (=> b!773371 (= e!430505 Unit!26676)))

(declare-fun lt!344372 () SeekEntryResult!7915)

(assert (=> b!773371 (= lt!344372 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20315 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!773371 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344365 resIntermediateIndex!5 (select (arr!20315 a!3186) j!159) a!3186 mask!3328) (Found!7915 j!159))))

(declare-fun lt!344375 () SeekEntryResult!7915)

(declare-fun b!773372 () Bool)

(declare-fun e!430506 () Bool)

(assert (=> b!773372 (= e!430506 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20315 a!3186) j!159) a!3186 mask!3328) lt!344375))))

(declare-fun b!773373 () Bool)

(declare-fun res!523033 () Bool)

(assert (=> b!773373 (=> (not res!523033) (not e!430509))))

(assert (=> b!773373 (= res!523033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!773374 () Bool)

(declare-fun Unit!26677 () Unit!26674)

(assert (=> b!773374 (= e!430505 Unit!26677)))

(assert (=> b!773374 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344365 (select (arr!20315 a!3186) j!159) a!3186 mask!3328) lt!344371)))

(declare-fun b!773375 () Bool)

(declare-fun res!523028 () Bool)

(assert (=> b!773375 (=> (not res!523028) (not e!430509))))

(declare-datatypes ((List!14317 0))(
  ( (Nil!14314) (Cons!14313 (h!15418 (_ BitVec 64)) (t!20632 List!14317)) )
))
(declare-fun arrayNoDuplicates!0 (array!42436 (_ BitVec 32) List!14317) Bool)

(assert (=> b!773375 (= res!523028 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14314))))

(declare-fun b!773376 () Bool)

(declare-fun res!523020 () Bool)

(assert (=> b!773376 (=> (not res!523020) (not e!430507))))

(assert (=> b!773376 (= res!523020 (and (= (size!20736 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20736 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20736 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!773377 () Bool)

(declare-fun res!523032 () Bool)

(assert (=> b!773377 (=> (not res!523032) (not e!430502))))

(assert (=> b!773377 (= res!523032 e!430503)))

(declare-fun c!85570 () Bool)

(assert (=> b!773377 (= c!85570 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!773378 () Bool)

(assert (=> b!773378 (= e!430510 e!430506)))

(declare-fun res!523030 () Bool)

(assert (=> b!773378 (=> (not res!523030) (not e!430506))))

(assert (=> b!773378 (= res!523030 (= (seekEntryOrOpen!0 (select (arr!20315 a!3186) j!159) a!3186 mask!3328) lt!344375))))

(assert (=> b!773378 (= lt!344375 (Found!7915 j!159))))

(declare-fun b!773379 () Bool)

(declare-fun res!523027 () Bool)

(assert (=> b!773379 (=> (not res!523027) (not e!430507))))

(assert (=> b!773379 (= res!523027 (validKeyInArray!0 k!2102))))

(assert (= (and start!67012 res!523023) b!773376))

(assert (= (and b!773376 res!523020) b!773362))

(assert (= (and b!773362 res!523025) b!773379))

(assert (= (and b!773379 res!523027) b!773367))

(assert (= (and b!773367 res!523021) b!773370))

(assert (= (and b!773370 res!523031) b!773373))

(assert (= (and b!773373 res!523033) b!773375))

(assert (= (and b!773375 res!523028) b!773363))

(assert (= (and b!773363 res!523029) b!773361))

(assert (= (and b!773361 res!523026) b!773366))

(assert (= (and b!773366 res!523022) b!773377))

(assert (= (and b!773377 c!85570) b!773365))

(assert (= (and b!773377 (not c!85570)) b!773368))

(assert (= (and b!773377 res!523032) b!773364))

(assert (= (and b!773364 res!523034) b!773369))

(assert (= (and b!773369 res!523019) b!773378))

(assert (= (and b!773378 res!523030) b!773372))

(assert (= (and b!773369 (not res!523024)) b!773360))

(assert (= (and b!773360 c!85569) b!773374))

(assert (= (and b!773360 (not c!85569)) b!773371))

(declare-fun m!718099 () Bool)

(assert (=> b!773365 m!718099))

(assert (=> b!773365 m!718099))

(declare-fun m!718101 () Bool)

(assert (=> b!773365 m!718101))

(declare-fun m!718103 () Bool)

(assert (=> b!773360 m!718103))

(declare-fun m!718105 () Bool)

(assert (=> b!773375 m!718105))

(assert (=> b!773374 m!718099))

(assert (=> b!773374 m!718099))

(declare-fun m!718107 () Bool)

(assert (=> b!773374 m!718107))

(declare-fun m!718109 () Bool)

(assert (=> b!773373 m!718109))

(declare-fun m!718111 () Bool)

(assert (=> b!773364 m!718111))

(declare-fun m!718113 () Bool)

(assert (=> b!773364 m!718113))

(declare-fun m!718115 () Bool)

(assert (=> b!773364 m!718115))

(assert (=> b!773364 m!718111))

(declare-fun m!718117 () Bool)

(assert (=> b!773364 m!718117))

(declare-fun m!718119 () Bool)

(assert (=> b!773364 m!718119))

(declare-fun m!718121 () Bool)

(assert (=> b!773369 m!718121))

(declare-fun m!718123 () Bool)

(assert (=> b!773369 m!718123))

(assert (=> b!773378 m!718099))

(assert (=> b!773378 m!718099))

(declare-fun m!718125 () Bool)

(assert (=> b!773378 m!718125))

(assert (=> b!773371 m!718099))

(assert (=> b!773371 m!718099))

(declare-fun m!718127 () Bool)

(assert (=> b!773371 m!718127))

(assert (=> b!773371 m!718099))

(declare-fun m!718129 () Bool)

(assert (=> b!773371 m!718129))

(declare-fun m!718131 () Bool)

(assert (=> b!773370 m!718131))

(assert (=> b!773362 m!718099))

(assert (=> b!773362 m!718099))

(declare-fun m!718133 () Bool)

(assert (=> b!773362 m!718133))

(declare-fun m!718135 () Bool)

(assert (=> b!773379 m!718135))

(declare-fun m!718137 () Bool)

(assert (=> b!773366 m!718137))

(assert (=> b!773372 m!718099))

(assert (=> b!773372 m!718099))

(declare-fun m!718139 () Bool)

(assert (=> b!773372 m!718139))

(declare-fun m!718141 () Bool)

(assert (=> b!773367 m!718141))

(declare-fun m!718143 () Bool)

(assert (=> start!67012 m!718143))

(declare-fun m!718145 () Bool)

(assert (=> start!67012 m!718145))

(assert (=> b!773368 m!718099))

(assert (=> b!773368 m!718099))

(assert (=> b!773368 m!718127))

(assert (=> b!773361 m!718099))

(assert (=> b!773361 m!718099))

(declare-fun m!718147 () Bool)

(assert (=> b!773361 m!718147))

(assert (=> b!773361 m!718147))

(assert (=> b!773361 m!718099))

(declare-fun m!718149 () Bool)

(assert (=> b!773361 m!718149))

(push 1)

(assert (not b!773375))

(assert (not b!773367))

(assert (not b!773374))

(assert (not b!773379))

(assert (not b!773369))

(assert (not b!773364))

(assert (not b!773360))

(assert (not start!67012))

(assert (not b!773361))

(assert (not b!773371))

(assert (not b!773373))

(assert (not b!773362))

(assert (not b!773368))

(assert (not b!773365))

(assert (not b!773372))

(assert (not b!773370))

(assert (not b!773378))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

