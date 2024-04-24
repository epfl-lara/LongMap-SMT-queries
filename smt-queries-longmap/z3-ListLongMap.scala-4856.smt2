; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67024 () Bool)

(assert start!67024)

(declare-fun b!772523 () Bool)

(declare-datatypes ((Unit!26587 0))(
  ( (Unit!26588) )
))
(declare-fun e!430141 () Unit!26587)

(declare-fun Unit!26589 () Unit!26587)

(assert (=> b!772523 (= e!430141 Unit!26589)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42397 0))(
  ( (array!42398 (arr!20293 (Array (_ BitVec 32) (_ BitVec 64))) (size!20713 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42397)

(declare-datatypes ((SeekEntryResult!7849 0))(
  ( (MissingZero!7849 (index!33764 (_ BitVec 32))) (Found!7849 (index!33765 (_ BitVec 32))) (Intermediate!7849 (undefined!8661 Bool) (index!33766 (_ BitVec 32)) (x!64859 (_ BitVec 32))) (Undefined!7849) (MissingVacant!7849 (index!33767 (_ BitVec 32))) )
))
(declare-fun lt!343893 () SeekEntryResult!7849)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42397 (_ BitVec 32)) SeekEntryResult!7849)

(assert (=> b!772523 (= lt!343893 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20293 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!343900 () (_ BitVec 32))

(assert (=> b!772523 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343900 resIntermediateIndex!5 (select (arr!20293 a!3186) j!159) a!3186 mask!3328) (Found!7849 j!159))))

(declare-fun b!772524 () Bool)

(declare-fun res!522348 () Bool)

(declare-fun e!430134 () Bool)

(assert (=> b!772524 (=> (not res!522348) (not e!430134))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!772524 (= res!522348 (and (= (size!20713 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20713 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20713 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!772525 () Bool)

(declare-fun Unit!26590 () Unit!26587)

(assert (=> b!772525 (= e!430141 Unit!26590)))

(declare-fun lt!343890 () SeekEntryResult!7849)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42397 (_ BitVec 32)) SeekEntryResult!7849)

(assert (=> b!772525 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343900 (select (arr!20293 a!3186) j!159) a!3186 mask!3328) lt!343890)))

(declare-fun b!772526 () Bool)

(declare-fun e!430138 () Bool)

(declare-fun e!430137 () Bool)

(assert (=> b!772526 (= e!430138 e!430137)))

(declare-fun res!522339 () Bool)

(assert (=> b!772526 (=> (not res!522339) (not e!430137))))

(declare-fun lt!343895 () SeekEntryResult!7849)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42397 (_ BitVec 32)) SeekEntryResult!7849)

(assert (=> b!772526 (= res!522339 (= (seekEntryOrOpen!0 (select (arr!20293 a!3186) j!159) a!3186 mask!3328) lt!343895))))

(assert (=> b!772526 (= lt!343895 (Found!7849 j!159))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!772527 () Bool)

(assert (=> b!772527 (= e!430137 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20293 a!3186) j!159) a!3186 mask!3328) lt!343895))))

(declare-fun b!772528 () Bool)

(declare-fun e!430135 () Bool)

(assert (=> b!772528 (= e!430135 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20293 a!3186) j!159) a!3186 mask!3328) lt!343890))))

(declare-fun b!772529 () Bool)

(declare-fun res!522341 () Bool)

(assert (=> b!772529 (=> (not res!522341) (not e!430134))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!772529 (= res!522341 (validKeyInArray!0 (select (arr!20293 a!3186) j!159)))))

(declare-fun b!772530 () Bool)

(declare-fun e!430140 () Bool)

(assert (=> b!772530 (= e!430140 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000)))))

(declare-fun lt!343899 () Unit!26587)

(assert (=> b!772530 (= lt!343899 e!430141)))

(declare-fun c!85492 () Bool)

(assert (=> b!772530 (= c!85492 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!772530 (= lt!343900 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!772531 () Bool)

(declare-fun res!522346 () Bool)

(assert (=> b!772531 (=> (not res!522346) (not e!430134))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!772531 (= res!522346 (validKeyInArray!0 k0!2102))))

(declare-fun res!522351 () Bool)

(assert (=> start!67024 (=> (not res!522351) (not e!430134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67024 (= res!522351 (validMask!0 mask!3328))))

(assert (=> start!67024 e!430134))

(assert (=> start!67024 true))

(declare-fun array_inv!16152 (array!42397) Bool)

(assert (=> start!67024 (array_inv!16152 a!3186)))

(declare-fun b!772532 () Bool)

(declare-fun res!522353 () Bool)

(declare-fun e!430139 () Bool)

(assert (=> b!772532 (=> (not res!522353) (not e!430139))))

(assert (=> b!772532 (= res!522353 e!430135)))

(declare-fun c!85493 () Bool)

(assert (=> b!772532 (= c!85493 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!772533 () Bool)

(assert (=> b!772533 (= e!430135 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20293 a!3186) j!159) a!3186 mask!3328) (Found!7849 j!159)))))

(declare-fun b!772534 () Bool)

(declare-fun e!430133 () Bool)

(assert (=> b!772534 (= e!430139 e!430133)))

(declare-fun res!522344 () Bool)

(assert (=> b!772534 (=> (not res!522344) (not e!430133))))

(declare-fun lt!343894 () SeekEntryResult!7849)

(declare-fun lt!343897 () SeekEntryResult!7849)

(assert (=> b!772534 (= res!522344 (= lt!343894 lt!343897))))

(declare-fun lt!343896 () (_ BitVec 64))

(declare-fun lt!343892 () array!42397)

(assert (=> b!772534 (= lt!343897 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343896 lt!343892 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!772534 (= lt!343894 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343896 mask!3328) lt!343896 lt!343892 mask!3328))))

(assert (=> b!772534 (= lt!343896 (select (store (arr!20293 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!772534 (= lt!343892 (array!42398 (store (arr!20293 a!3186) i!1173 k0!2102) (size!20713 a!3186)))))

(declare-fun b!772535 () Bool)

(declare-fun res!522354 () Bool)

(assert (=> b!772535 (=> (not res!522354) (not e!430139))))

(assert (=> b!772535 (= res!522354 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20293 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!772536 () Bool)

(declare-fun res!522350 () Bool)

(declare-fun e!430136 () Bool)

(assert (=> b!772536 (=> (not res!522350) (not e!430136))))

(assert (=> b!772536 (= res!522350 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20713 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20713 a!3186))))))

(declare-fun b!772537 () Bool)

(assert (=> b!772537 (= e!430136 e!430139)))

(declare-fun res!522347 () Bool)

(assert (=> b!772537 (=> (not res!522347) (not e!430139))))

(assert (=> b!772537 (= res!522347 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20293 a!3186) j!159) mask!3328) (select (arr!20293 a!3186) j!159) a!3186 mask!3328) lt!343890))))

(assert (=> b!772537 (= lt!343890 (Intermediate!7849 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!772538 () Bool)

(declare-fun res!522345 () Bool)

(assert (=> b!772538 (=> (not res!522345) (not e!430136))))

(declare-datatypes ((List!14202 0))(
  ( (Nil!14199) (Cons!14198 (h!15306 (_ BitVec 64)) (t!20509 List!14202)) )
))
(declare-fun arrayNoDuplicates!0 (array!42397 (_ BitVec 32) List!14202) Bool)

(assert (=> b!772538 (= res!522345 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14199))))

(declare-fun b!772539 () Bool)

(assert (=> b!772539 (= e!430133 (not e!430140))))

(declare-fun res!522352 () Bool)

(assert (=> b!772539 (=> res!522352 e!430140)))

(get-info :version)

(assert (=> b!772539 (= res!522352 (or (not ((_ is Intermediate!7849) lt!343897)) (bvsge x!1131 (x!64859 lt!343897))))))

(assert (=> b!772539 e!430138))

(declare-fun res!522342 () Bool)

(assert (=> b!772539 (=> (not res!522342) (not e!430138))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42397 (_ BitVec 32)) Bool)

(assert (=> b!772539 (= res!522342 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!343898 () Unit!26587)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42397 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26587)

(assert (=> b!772539 (= lt!343898 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!772540 () Bool)

(declare-fun res!522349 () Bool)

(assert (=> b!772540 (=> (not res!522349) (not e!430134))))

(declare-fun arrayContainsKey!0 (array!42397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!772540 (= res!522349 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!772541 () Bool)

(assert (=> b!772541 (= e!430134 e!430136)))

(declare-fun res!522340 () Bool)

(assert (=> b!772541 (=> (not res!522340) (not e!430136))))

(declare-fun lt!343891 () SeekEntryResult!7849)

(assert (=> b!772541 (= res!522340 (or (= lt!343891 (MissingZero!7849 i!1173)) (= lt!343891 (MissingVacant!7849 i!1173))))))

(assert (=> b!772541 (= lt!343891 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!772542 () Bool)

(declare-fun res!522343 () Bool)

(assert (=> b!772542 (=> (not res!522343) (not e!430136))))

(assert (=> b!772542 (= res!522343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!67024 res!522351) b!772524))

(assert (= (and b!772524 res!522348) b!772529))

(assert (= (and b!772529 res!522341) b!772531))

(assert (= (and b!772531 res!522346) b!772540))

(assert (= (and b!772540 res!522349) b!772541))

(assert (= (and b!772541 res!522340) b!772542))

(assert (= (and b!772542 res!522343) b!772538))

(assert (= (and b!772538 res!522345) b!772536))

(assert (= (and b!772536 res!522350) b!772537))

(assert (= (and b!772537 res!522347) b!772535))

(assert (= (and b!772535 res!522354) b!772532))

(assert (= (and b!772532 c!85493) b!772528))

(assert (= (and b!772532 (not c!85493)) b!772533))

(assert (= (and b!772532 res!522353) b!772534))

(assert (= (and b!772534 res!522344) b!772539))

(assert (= (and b!772539 res!522342) b!772526))

(assert (= (and b!772526 res!522339) b!772527))

(assert (= (and b!772539 (not res!522352)) b!772530))

(assert (= (and b!772530 c!85492) b!772525))

(assert (= (and b!772530 (not c!85492)) b!772523))

(declare-fun m!717941 () Bool)

(assert (=> b!772530 m!717941))

(declare-fun m!717943 () Bool)

(assert (=> start!67024 m!717943))

(declare-fun m!717945 () Bool)

(assert (=> start!67024 m!717945))

(declare-fun m!717947 () Bool)

(assert (=> b!772526 m!717947))

(assert (=> b!772526 m!717947))

(declare-fun m!717949 () Bool)

(assert (=> b!772526 m!717949))

(declare-fun m!717951 () Bool)

(assert (=> b!772540 m!717951))

(declare-fun m!717953 () Bool)

(assert (=> b!772535 m!717953))

(assert (=> b!772529 m!717947))

(assert (=> b!772529 m!717947))

(declare-fun m!717955 () Bool)

(assert (=> b!772529 m!717955))

(declare-fun m!717957 () Bool)

(assert (=> b!772538 m!717957))

(assert (=> b!772533 m!717947))

(assert (=> b!772533 m!717947))

(declare-fun m!717959 () Bool)

(assert (=> b!772533 m!717959))

(assert (=> b!772537 m!717947))

(assert (=> b!772537 m!717947))

(declare-fun m!717961 () Bool)

(assert (=> b!772537 m!717961))

(assert (=> b!772537 m!717961))

(assert (=> b!772537 m!717947))

(declare-fun m!717963 () Bool)

(assert (=> b!772537 m!717963))

(assert (=> b!772527 m!717947))

(assert (=> b!772527 m!717947))

(declare-fun m!717965 () Bool)

(assert (=> b!772527 m!717965))

(declare-fun m!717967 () Bool)

(assert (=> b!772534 m!717967))

(declare-fun m!717969 () Bool)

(assert (=> b!772534 m!717969))

(declare-fun m!717971 () Bool)

(assert (=> b!772534 m!717971))

(assert (=> b!772534 m!717967))

(declare-fun m!717973 () Bool)

(assert (=> b!772534 m!717973))

(declare-fun m!717975 () Bool)

(assert (=> b!772534 m!717975))

(assert (=> b!772523 m!717947))

(assert (=> b!772523 m!717947))

(assert (=> b!772523 m!717959))

(assert (=> b!772523 m!717947))

(declare-fun m!717977 () Bool)

(assert (=> b!772523 m!717977))

(assert (=> b!772525 m!717947))

(assert (=> b!772525 m!717947))

(declare-fun m!717979 () Bool)

(assert (=> b!772525 m!717979))

(declare-fun m!717981 () Bool)

(assert (=> b!772541 m!717981))

(declare-fun m!717983 () Bool)

(assert (=> b!772539 m!717983))

(declare-fun m!717985 () Bool)

(assert (=> b!772539 m!717985))

(declare-fun m!717987 () Bool)

(assert (=> b!772542 m!717987))

(assert (=> b!772528 m!717947))

(assert (=> b!772528 m!717947))

(declare-fun m!717989 () Bool)

(assert (=> b!772528 m!717989))

(declare-fun m!717991 () Bool)

(assert (=> b!772531 m!717991))

(check-sat (not b!772528) (not b!772542) (not b!772525) (not b!772541) (not start!67024) (not b!772533) (not b!772530) (not b!772526) (not b!772539) (not b!772538) (not b!772529) (not b!772537) (not b!772540) (not b!772523) (not b!772534) (not b!772527) (not b!772531))
(check-sat)
