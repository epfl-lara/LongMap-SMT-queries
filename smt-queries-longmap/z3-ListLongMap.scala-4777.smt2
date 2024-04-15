; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65702 () Bool)

(assert start!65702)

(declare-fun b!754072 () Bool)

(declare-fun e!420541 () Bool)

(assert (=> b!754072 (= e!420541 true)))

(declare-fun e!420538 () Bool)

(assert (=> b!754072 e!420538))

(declare-fun res!509591 () Bool)

(assert (=> b!754072 (=> (not res!509591) (not e!420538))))

(declare-fun lt!335450 () (_ BitVec 64))

(assert (=> b!754072 (= res!509591 (= lt!335450 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25988 0))(
  ( (Unit!25989) )
))
(declare-fun lt!335452 () Unit!25988)

(declare-fun e!420540 () Unit!25988)

(assert (=> b!754072 (= lt!335452 e!420540)))

(declare-fun c!82625 () Bool)

(assert (=> b!754072 (= c!82625 (= lt!335450 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!754073 () Bool)

(declare-fun Unit!25990 () Unit!25988)

(assert (=> b!754073 (= e!420540 Unit!25990)))

(assert (=> b!754073 false))

(declare-fun b!754074 () Bool)

(declare-fun e!420536 () Bool)

(declare-fun e!420544 () Bool)

(assert (=> b!754074 (= e!420536 (not e!420544))))

(declare-fun res!509596 () Bool)

(assert (=> b!754074 (=> res!509596 e!420544)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7657 0))(
  ( (MissingZero!7657 (index!32996 (_ BitVec 32))) (Found!7657 (index!32997 (_ BitVec 32))) (Intermediate!7657 (undefined!8469 Bool) (index!32998 (_ BitVec 32)) (x!63914 (_ BitVec 32))) (Undefined!7657) (MissingVacant!7657 (index!32999 (_ BitVec 32))) )
))
(declare-fun lt!335442 () SeekEntryResult!7657)

(get-info :version)

(assert (=> b!754074 (= res!509596 (or (not ((_ is Intermediate!7657) lt!335442)) (bvslt x!1131 (x!63914 lt!335442)) (not (= x!1131 (x!63914 lt!335442))) (not (= index!1321 (index!32998 lt!335442)))))))

(declare-fun e!420545 () Bool)

(assert (=> b!754074 e!420545))

(declare-fun res!509594 () Bool)

(assert (=> b!754074 (=> (not res!509594) (not e!420545))))

(declare-fun lt!335448 () SeekEntryResult!7657)

(declare-fun lt!335443 () SeekEntryResult!7657)

(assert (=> b!754074 (= res!509594 (= lt!335448 lt!335443))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!754074 (= lt!335443 (Found!7657 j!159))))

(declare-datatypes ((array!41892 0))(
  ( (array!41893 (arr!20060 (Array (_ BitVec 32) (_ BitVec 64))) (size!20481 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41892)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41892 (_ BitVec 32)) SeekEntryResult!7657)

(assert (=> b!754074 (= lt!335448 (seekEntryOrOpen!0 (select (arr!20060 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41892 (_ BitVec 32)) Bool)

(assert (=> b!754074 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335446 () Unit!25988)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41892 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25988)

(assert (=> b!754074 (= lt!335446 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!754075 () Bool)

(declare-fun e!420542 () Bool)

(assert (=> b!754075 (= e!420544 e!420542)))

(declare-fun res!509589 () Bool)

(assert (=> b!754075 (=> res!509589 e!420542)))

(declare-fun lt!335451 () SeekEntryResult!7657)

(assert (=> b!754075 (= res!509589 (not (= lt!335451 lt!335443)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41892 (_ BitVec 32)) SeekEntryResult!7657)

(assert (=> b!754075 (= lt!335451 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20060 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!509588 () Bool)

(declare-fun e!420539 () Bool)

(assert (=> start!65702 (=> (not res!509588) (not e!420539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65702 (= res!509588 (validMask!0 mask!3328))))

(assert (=> start!65702 e!420539))

(assert (=> start!65702 true))

(declare-fun array_inv!15943 (array!41892) Bool)

(assert (=> start!65702 (array_inv!15943 a!3186)))

(declare-fun e!420543 () Bool)

(declare-fun b!754076 () Bool)

(assert (=> b!754076 (= e!420543 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20060 a!3186) j!159) a!3186 mask!3328) (Found!7657 j!159)))))

(declare-fun b!754077 () Bool)

(declare-fun res!509597 () Bool)

(declare-fun e!420547 () Bool)

(assert (=> b!754077 (=> (not res!509597) (not e!420547))))

(declare-datatypes ((List!14101 0))(
  ( (Nil!14098) (Cons!14097 (h!15169 (_ BitVec 64)) (t!20407 List!14101)) )
))
(declare-fun arrayNoDuplicates!0 (array!41892 (_ BitVec 32) List!14101) Bool)

(assert (=> b!754077 (= res!509597 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14098))))

(declare-fun b!754078 () Bool)

(declare-fun res!509593 () Bool)

(assert (=> b!754078 (=> (not res!509593) (not e!420538))))

(declare-fun lt!335447 () array!41892)

(declare-fun lt!335449 () (_ BitVec 64))

(assert (=> b!754078 (= res!509593 (= (seekEntryOrOpen!0 lt!335449 lt!335447 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335449 lt!335447 mask!3328)))))

(declare-fun b!754079 () Bool)

(declare-fun e!420546 () Bool)

(assert (=> b!754079 (= e!420546 e!420536)))

(declare-fun res!509600 () Bool)

(assert (=> b!754079 (=> (not res!509600) (not e!420536))))

(declare-fun lt!335445 () SeekEntryResult!7657)

(assert (=> b!754079 (= res!509600 (= lt!335445 lt!335442))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41892 (_ BitVec 32)) SeekEntryResult!7657)

(assert (=> b!754079 (= lt!335442 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335449 lt!335447 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!754079 (= lt!335445 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335449 mask!3328) lt!335449 lt!335447 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!754079 (= lt!335449 (select (store (arr!20060 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!754079 (= lt!335447 (array!41893 (store (arr!20060 a!3186) i!1173 k0!2102) (size!20481 a!3186)))))

(declare-fun b!754080 () Bool)

(assert (=> b!754080 (= e!420538 (= lt!335448 lt!335451))))

(declare-fun b!754081 () Bool)

(declare-fun res!509590 () Bool)

(assert (=> b!754081 (=> (not res!509590) (not e!420547))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!754081 (= res!509590 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20481 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20481 a!3186))))))

(declare-fun b!754082 () Bool)

(assert (=> b!754082 (= e!420547 e!420546)))

(declare-fun res!509598 () Bool)

(assert (=> b!754082 (=> (not res!509598) (not e!420546))))

(declare-fun lt!335453 () SeekEntryResult!7657)

(assert (=> b!754082 (= res!509598 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20060 a!3186) j!159) mask!3328) (select (arr!20060 a!3186) j!159) a!3186 mask!3328) lt!335453))))

(assert (=> b!754082 (= lt!335453 (Intermediate!7657 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!754083 () Bool)

(declare-fun res!509583 () Bool)

(assert (=> b!754083 (=> (not res!509583) (not e!420539))))

(assert (=> b!754083 (= res!509583 (and (= (size!20481 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20481 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20481 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!754084 () Bool)

(declare-fun res!509601 () Bool)

(assert (=> b!754084 (=> (not res!509601) (not e!420539))))

(declare-fun arrayContainsKey!0 (array!41892 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!754084 (= res!509601 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!754085 () Bool)

(assert (=> b!754085 (= e!420539 e!420547)))

(declare-fun res!509584 () Bool)

(assert (=> b!754085 (=> (not res!509584) (not e!420547))))

(declare-fun lt!335444 () SeekEntryResult!7657)

(assert (=> b!754085 (= res!509584 (or (= lt!335444 (MissingZero!7657 i!1173)) (= lt!335444 (MissingVacant!7657 i!1173))))))

(assert (=> b!754085 (= lt!335444 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!754086 () Bool)

(declare-fun res!509586 () Bool)

(assert (=> b!754086 (=> (not res!509586) (not e!420539))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!754086 (= res!509586 (validKeyInArray!0 k0!2102))))

(declare-fun b!754087 () Bool)

(declare-fun res!509585 () Bool)

(assert (=> b!754087 (=> (not res!509585) (not e!420539))))

(assert (=> b!754087 (= res!509585 (validKeyInArray!0 (select (arr!20060 a!3186) j!159)))))

(declare-fun b!754088 () Bool)

(declare-fun res!509599 () Bool)

(assert (=> b!754088 (=> (not res!509599) (not e!420546))))

(assert (=> b!754088 (= res!509599 e!420543)))

(declare-fun c!82626 () Bool)

(assert (=> b!754088 (= c!82626 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!754089 () Bool)

(declare-fun res!509592 () Bool)

(assert (=> b!754089 (=> (not res!509592) (not e!420546))))

(assert (=> b!754089 (= res!509592 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20060 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!754090 () Bool)

(assert (=> b!754090 (= e!420542 e!420541)))

(declare-fun res!509595 () Bool)

(assert (=> b!754090 (=> res!509595 e!420541)))

(assert (=> b!754090 (= res!509595 (= lt!335450 lt!335449))))

(assert (=> b!754090 (= lt!335450 (select (store (arr!20060 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!754091 () Bool)

(declare-fun Unit!25991 () Unit!25988)

(assert (=> b!754091 (= e!420540 Unit!25991)))

(declare-fun b!754092 () Bool)

(declare-fun res!509587 () Bool)

(assert (=> b!754092 (=> (not res!509587) (not e!420547))))

(assert (=> b!754092 (= res!509587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!754093 () Bool)

(assert (=> b!754093 (= e!420543 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20060 a!3186) j!159) a!3186 mask!3328) lt!335453))))

(declare-fun b!754094 () Bool)

(assert (=> b!754094 (= e!420545 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20060 a!3186) j!159) a!3186 mask!3328) lt!335443))))

(assert (= (and start!65702 res!509588) b!754083))

(assert (= (and b!754083 res!509583) b!754087))

(assert (= (and b!754087 res!509585) b!754086))

(assert (= (and b!754086 res!509586) b!754084))

(assert (= (and b!754084 res!509601) b!754085))

(assert (= (and b!754085 res!509584) b!754092))

(assert (= (and b!754092 res!509587) b!754077))

(assert (= (and b!754077 res!509597) b!754081))

(assert (= (and b!754081 res!509590) b!754082))

(assert (= (and b!754082 res!509598) b!754089))

(assert (= (and b!754089 res!509592) b!754088))

(assert (= (and b!754088 c!82626) b!754093))

(assert (= (and b!754088 (not c!82626)) b!754076))

(assert (= (and b!754088 res!509599) b!754079))

(assert (= (and b!754079 res!509600) b!754074))

(assert (= (and b!754074 res!509594) b!754094))

(assert (= (and b!754074 (not res!509596)) b!754075))

(assert (= (and b!754075 (not res!509589)) b!754090))

(assert (= (and b!754090 (not res!509595)) b!754072))

(assert (= (and b!754072 c!82625) b!754073))

(assert (= (and b!754072 (not c!82625)) b!754091))

(assert (= (and b!754072 res!509591) b!754078))

(assert (= (and b!754078 res!509593) b!754080))

(declare-fun m!702041 () Bool)

(assert (=> b!754093 m!702041))

(assert (=> b!754093 m!702041))

(declare-fun m!702043 () Bool)

(assert (=> b!754093 m!702043))

(declare-fun m!702045 () Bool)

(assert (=> b!754084 m!702045))

(declare-fun m!702047 () Bool)

(assert (=> b!754092 m!702047))

(declare-fun m!702049 () Bool)

(assert (=> b!754090 m!702049))

(declare-fun m!702051 () Bool)

(assert (=> b!754090 m!702051))

(assert (=> b!754075 m!702041))

(assert (=> b!754075 m!702041))

(declare-fun m!702053 () Bool)

(assert (=> b!754075 m!702053))

(declare-fun m!702055 () Bool)

(assert (=> b!754078 m!702055))

(declare-fun m!702057 () Bool)

(assert (=> b!754078 m!702057))

(assert (=> b!754082 m!702041))

(assert (=> b!754082 m!702041))

(declare-fun m!702059 () Bool)

(assert (=> b!754082 m!702059))

(assert (=> b!754082 m!702059))

(assert (=> b!754082 m!702041))

(declare-fun m!702061 () Bool)

(assert (=> b!754082 m!702061))

(declare-fun m!702063 () Bool)

(assert (=> b!754077 m!702063))

(assert (=> b!754094 m!702041))

(assert (=> b!754094 m!702041))

(declare-fun m!702065 () Bool)

(assert (=> b!754094 m!702065))

(assert (=> b!754076 m!702041))

(assert (=> b!754076 m!702041))

(assert (=> b!754076 m!702053))

(declare-fun m!702067 () Bool)

(assert (=> b!754086 m!702067))

(assert (=> b!754087 m!702041))

(assert (=> b!754087 m!702041))

(declare-fun m!702069 () Bool)

(assert (=> b!754087 m!702069))

(declare-fun m!702071 () Bool)

(assert (=> b!754089 m!702071))

(assert (=> b!754074 m!702041))

(assert (=> b!754074 m!702041))

(declare-fun m!702073 () Bool)

(assert (=> b!754074 m!702073))

(declare-fun m!702075 () Bool)

(assert (=> b!754074 m!702075))

(declare-fun m!702077 () Bool)

(assert (=> b!754074 m!702077))

(declare-fun m!702079 () Bool)

(assert (=> b!754085 m!702079))

(declare-fun m!702081 () Bool)

(assert (=> start!65702 m!702081))

(declare-fun m!702083 () Bool)

(assert (=> start!65702 m!702083))

(declare-fun m!702085 () Bool)

(assert (=> b!754079 m!702085))

(declare-fun m!702087 () Bool)

(assert (=> b!754079 m!702087))

(assert (=> b!754079 m!702049))

(declare-fun m!702089 () Bool)

(assert (=> b!754079 m!702089))

(declare-fun m!702091 () Bool)

(assert (=> b!754079 m!702091))

(assert (=> b!754079 m!702085))

(check-sat (not b!754079) (not b!754074) (not b!754078) (not b!754092) (not b!754076) (not b!754085) (not b!754082) (not b!754084) (not b!754086) (not start!65702) (not b!754093) (not b!754087) (not b!754094) (not b!754077) (not b!754075))
(check-sat)
