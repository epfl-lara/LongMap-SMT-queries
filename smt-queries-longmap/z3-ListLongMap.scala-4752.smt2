; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65574 () Bool)

(assert start!65574)

(declare-fun b!749319 () Bool)

(declare-fun res!505584 () Bool)

(declare-fun e!418131 () Bool)

(assert (=> b!749319 (=> (not res!505584) (not e!418131))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41747 0))(
  ( (array!41748 (arr!19987 (Array (_ BitVec 32) (_ BitVec 64))) (size!20408 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41747)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!749319 (= res!505584 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19987 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!749320 () Bool)

(declare-datatypes ((Unit!25728 0))(
  ( (Unit!25729) )
))
(declare-fun e!418137 () Unit!25728)

(declare-fun Unit!25730 () Unit!25728)

(assert (=> b!749320 (= e!418137 Unit!25730)))

(assert (=> b!749320 false))

(declare-fun b!749321 () Bool)

(declare-fun res!505580 () Bool)

(declare-fun e!418132 () Bool)

(assert (=> b!749321 (=> (not res!505580) (not e!418132))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41747 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!749321 (= res!505580 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!418139 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!749322 () Bool)

(declare-datatypes ((SeekEntryResult!7587 0))(
  ( (MissingZero!7587 (index!32716 (_ BitVec 32))) (Found!7587 (index!32717 (_ BitVec 32))) (Intermediate!7587 (undefined!8399 Bool) (index!32718 (_ BitVec 32)) (x!63649 (_ BitVec 32))) (Undefined!7587) (MissingVacant!7587 (index!32719 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41747 (_ BitVec 32)) SeekEntryResult!7587)

(assert (=> b!749322 (= e!418139 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19987 a!3186) j!159) a!3186 mask!3328) (Found!7587 j!159)))))

(declare-fun e!418136 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!749323 () Bool)

(declare-fun lt!333131 () SeekEntryResult!7587)

(assert (=> b!749323 (= e!418136 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19987 a!3186) j!159) a!3186 mask!3328) lt!333131))))

(declare-fun b!749324 () Bool)

(declare-fun res!505591 () Bool)

(assert (=> b!749324 (=> (not res!505591) (not e!418132))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!749324 (= res!505591 (validKeyInArray!0 k0!2102))))

(declare-fun b!749325 () Bool)

(declare-fun e!418134 () Bool)

(assert (=> b!749325 (= e!418132 e!418134)))

(declare-fun res!505578 () Bool)

(assert (=> b!749325 (=> (not res!505578) (not e!418134))))

(declare-fun lt!333121 () SeekEntryResult!7587)

(assert (=> b!749325 (= res!505578 (or (= lt!333121 (MissingZero!7587 i!1173)) (= lt!333121 (MissingVacant!7587 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41747 (_ BitVec 32)) SeekEntryResult!7587)

(assert (=> b!749325 (= lt!333121 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!749326 () Bool)

(declare-fun res!505581 () Bool)

(declare-fun e!418138 () Bool)

(assert (=> b!749326 (=> res!505581 e!418138)))

(assert (=> b!749326 (= res!505581 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19987 a!3186) j!159) a!3186 mask!3328) lt!333131)))))

(declare-fun b!749327 () Bool)

(declare-fun res!505585 () Bool)

(assert (=> b!749327 (=> (not res!505585) (not e!418134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41747 (_ BitVec 32)) Bool)

(assert (=> b!749327 (= res!505585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!749328 () Bool)

(declare-fun e!418133 () Bool)

(assert (=> b!749328 (= e!418133 true)))

(declare-fun e!418135 () Bool)

(assert (=> b!749328 e!418135))

(declare-fun res!505587 () Bool)

(assert (=> b!749328 (=> (not res!505587) (not e!418135))))

(declare-fun lt!333124 () (_ BitVec 64))

(assert (=> b!749328 (= res!505587 (= lt!333124 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333130 () Unit!25728)

(assert (=> b!749328 (= lt!333130 e!418137)))

(declare-fun c!82251 () Bool)

(assert (=> b!749328 (= c!82251 (= lt!333124 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!749329 () Bool)

(declare-fun e!418129 () Bool)

(assert (=> b!749329 (= e!418129 (not e!418138))))

(declare-fun res!505582 () Bool)

(assert (=> b!749329 (=> res!505582 e!418138)))

(declare-fun lt!333122 () SeekEntryResult!7587)

(get-info :version)

(assert (=> b!749329 (= res!505582 (or (not ((_ is Intermediate!7587) lt!333122)) (bvslt x!1131 (x!63649 lt!333122)) (not (= x!1131 (x!63649 lt!333122))) (not (= index!1321 (index!32718 lt!333122)))))))

(assert (=> b!749329 e!418136))

(declare-fun res!505589 () Bool)

(assert (=> b!749329 (=> (not res!505589) (not e!418136))))

(declare-fun lt!333126 () SeekEntryResult!7587)

(assert (=> b!749329 (= res!505589 (= lt!333126 lt!333131))))

(assert (=> b!749329 (= lt!333131 (Found!7587 j!159))))

(assert (=> b!749329 (= lt!333126 (seekEntryOrOpen!0 (select (arr!19987 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!749329 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333128 () Unit!25728)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41747 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25728)

(assert (=> b!749329 (= lt!333128 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!749331 () Bool)

(declare-fun res!505592 () Bool)

(assert (=> b!749331 (=> (not res!505592) (not e!418132))))

(assert (=> b!749331 (= res!505592 (and (= (size!20408 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20408 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20408 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!749332 () Bool)

(declare-fun Unit!25731 () Unit!25728)

(assert (=> b!749332 (= e!418137 Unit!25731)))

(declare-fun b!749333 () Bool)

(declare-fun lt!333123 () SeekEntryResult!7587)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41747 (_ BitVec 32)) SeekEntryResult!7587)

(assert (=> b!749333 (= e!418139 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19987 a!3186) j!159) a!3186 mask!3328) lt!333123))))

(declare-fun b!749334 () Bool)

(declare-fun res!505583 () Bool)

(assert (=> b!749334 (=> (not res!505583) (not e!418131))))

(assert (=> b!749334 (= res!505583 e!418139)))

(declare-fun c!82252 () Bool)

(assert (=> b!749334 (= c!82252 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!749335 () Bool)

(declare-fun res!505586 () Bool)

(assert (=> b!749335 (=> (not res!505586) (not e!418132))))

(assert (=> b!749335 (= res!505586 (validKeyInArray!0 (select (arr!19987 a!3186) j!159)))))

(declare-fun b!749336 () Bool)

(assert (=> b!749336 (= e!418131 e!418129)))

(declare-fun res!505588 () Bool)

(assert (=> b!749336 (=> (not res!505588) (not e!418129))))

(declare-fun lt!333129 () SeekEntryResult!7587)

(assert (=> b!749336 (= res!505588 (= lt!333129 lt!333122))))

(declare-fun lt!333127 () array!41747)

(declare-fun lt!333125 () (_ BitVec 64))

(assert (=> b!749336 (= lt!333122 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333125 lt!333127 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!749336 (= lt!333129 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333125 mask!3328) lt!333125 lt!333127 mask!3328))))

(assert (=> b!749336 (= lt!333125 (select (store (arr!19987 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!749336 (= lt!333127 (array!41748 (store (arr!19987 a!3186) i!1173 k0!2102) (size!20408 a!3186)))))

(declare-fun b!749337 () Bool)

(assert (=> b!749337 (= e!418138 e!418133)))

(declare-fun res!505590 () Bool)

(assert (=> b!749337 (=> res!505590 e!418133)))

(assert (=> b!749337 (= res!505590 (= lt!333124 lt!333125))))

(assert (=> b!749337 (= lt!333124 (select (store (arr!19987 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!749338 () Bool)

(assert (=> b!749338 (= e!418134 e!418131)))

(declare-fun res!505595 () Bool)

(assert (=> b!749338 (=> (not res!505595) (not e!418131))))

(assert (=> b!749338 (= res!505595 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19987 a!3186) j!159) mask!3328) (select (arr!19987 a!3186) j!159) a!3186 mask!3328) lt!333123))))

(assert (=> b!749338 (= lt!333123 (Intermediate!7587 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!749339 () Bool)

(declare-fun res!505593 () Bool)

(assert (=> b!749339 (=> (not res!505593) (not e!418134))))

(assert (=> b!749339 (= res!505593 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20408 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20408 a!3186))))))

(declare-fun b!749340 () Bool)

(assert (=> b!749340 (= e!418135 (= (seekEntryOrOpen!0 lt!333125 lt!333127 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333125 lt!333127 mask!3328)))))

(declare-fun res!505594 () Bool)

(assert (=> start!65574 (=> (not res!505594) (not e!418132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65574 (= res!505594 (validMask!0 mask!3328))))

(assert (=> start!65574 e!418132))

(assert (=> start!65574 true))

(declare-fun array_inv!15783 (array!41747) Bool)

(assert (=> start!65574 (array_inv!15783 a!3186)))

(declare-fun b!749330 () Bool)

(declare-fun res!505579 () Bool)

(assert (=> b!749330 (=> (not res!505579) (not e!418134))))

(declare-datatypes ((List!13989 0))(
  ( (Nil!13986) (Cons!13985 (h!15057 (_ BitVec 64)) (t!20304 List!13989)) )
))
(declare-fun arrayNoDuplicates!0 (array!41747 (_ BitVec 32) List!13989) Bool)

(assert (=> b!749330 (= res!505579 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13986))))

(assert (= (and start!65574 res!505594) b!749331))

(assert (= (and b!749331 res!505592) b!749335))

(assert (= (and b!749335 res!505586) b!749324))

(assert (= (and b!749324 res!505591) b!749321))

(assert (= (and b!749321 res!505580) b!749325))

(assert (= (and b!749325 res!505578) b!749327))

(assert (= (and b!749327 res!505585) b!749330))

(assert (= (and b!749330 res!505579) b!749339))

(assert (= (and b!749339 res!505593) b!749338))

(assert (= (and b!749338 res!505595) b!749319))

(assert (= (and b!749319 res!505584) b!749334))

(assert (= (and b!749334 c!82252) b!749333))

(assert (= (and b!749334 (not c!82252)) b!749322))

(assert (= (and b!749334 res!505583) b!749336))

(assert (= (and b!749336 res!505588) b!749329))

(assert (= (and b!749329 res!505589) b!749323))

(assert (= (and b!749329 (not res!505582)) b!749326))

(assert (= (and b!749326 (not res!505581)) b!749337))

(assert (= (and b!749337 (not res!505590)) b!749328))

(assert (= (and b!749328 c!82251) b!749320))

(assert (= (and b!749328 (not c!82251)) b!749332))

(assert (= (and b!749328 res!505587) b!749340))

(declare-fun m!698951 () Bool)

(assert (=> start!65574 m!698951))

(declare-fun m!698953 () Bool)

(assert (=> start!65574 m!698953))

(declare-fun m!698955 () Bool)

(assert (=> b!749338 m!698955))

(assert (=> b!749338 m!698955))

(declare-fun m!698957 () Bool)

(assert (=> b!749338 m!698957))

(assert (=> b!749338 m!698957))

(assert (=> b!749338 m!698955))

(declare-fun m!698959 () Bool)

(assert (=> b!749338 m!698959))

(assert (=> b!749323 m!698955))

(assert (=> b!749323 m!698955))

(declare-fun m!698961 () Bool)

(assert (=> b!749323 m!698961))

(assert (=> b!749333 m!698955))

(assert (=> b!749333 m!698955))

(declare-fun m!698963 () Bool)

(assert (=> b!749333 m!698963))

(declare-fun m!698965 () Bool)

(assert (=> b!749327 m!698965))

(declare-fun m!698967 () Bool)

(assert (=> b!749324 m!698967))

(declare-fun m!698969 () Bool)

(assert (=> b!749325 m!698969))

(assert (=> b!749322 m!698955))

(assert (=> b!749322 m!698955))

(declare-fun m!698971 () Bool)

(assert (=> b!749322 m!698971))

(declare-fun m!698973 () Bool)

(assert (=> b!749319 m!698973))

(declare-fun m!698975 () Bool)

(assert (=> b!749340 m!698975))

(declare-fun m!698977 () Bool)

(assert (=> b!749340 m!698977))

(declare-fun m!698979 () Bool)

(assert (=> b!749336 m!698979))

(declare-fun m!698981 () Bool)

(assert (=> b!749336 m!698981))

(declare-fun m!698983 () Bool)

(assert (=> b!749336 m!698983))

(declare-fun m!698985 () Bool)

(assert (=> b!749336 m!698985))

(declare-fun m!698987 () Bool)

(assert (=> b!749336 m!698987))

(assert (=> b!749336 m!698979))

(assert (=> b!749329 m!698955))

(assert (=> b!749329 m!698955))

(declare-fun m!698989 () Bool)

(assert (=> b!749329 m!698989))

(declare-fun m!698991 () Bool)

(assert (=> b!749329 m!698991))

(declare-fun m!698993 () Bool)

(assert (=> b!749329 m!698993))

(declare-fun m!698995 () Bool)

(assert (=> b!749321 m!698995))

(assert (=> b!749337 m!698985))

(declare-fun m!698997 () Bool)

(assert (=> b!749337 m!698997))

(assert (=> b!749335 m!698955))

(assert (=> b!749335 m!698955))

(declare-fun m!698999 () Bool)

(assert (=> b!749335 m!698999))

(declare-fun m!699001 () Bool)

(assert (=> b!749330 m!699001))

(assert (=> b!749326 m!698955))

(assert (=> b!749326 m!698955))

(assert (=> b!749326 m!698971))

(check-sat (not b!749324) (not b!749329) (not b!749338) (not b!749323) (not b!749340) (not start!65574) (not b!749330) (not b!749327) (not b!749325) (not b!749335) (not b!749333) (not b!749336) (not b!749326) (not b!749322) (not b!749321))
(check-sat)
