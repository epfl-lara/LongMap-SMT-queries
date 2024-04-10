; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52462 () Bool)

(assert start!52462)

(declare-fun b!572972 () Bool)

(declare-fun res!362491 () Bool)

(declare-fun e!329610 () Bool)

(assert (=> b!572972 (=> (not res!362491) (not e!329610))))

(declare-datatypes ((array!35859 0))(
  ( (array!35860 (arr!17218 (Array (_ BitVec 32) (_ BitVec 64))) (size!17582 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35859)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35859 (_ BitVec 32)) Bool)

(assert (=> b!572972 (= res!362491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572974 () Bool)

(declare-fun e!329607 () Bool)

(declare-fun e!329609 () Bool)

(assert (=> b!572974 (= e!329607 e!329609)))

(declare-fun res!362486 () Bool)

(assert (=> b!572974 (=> res!362486 e!329609)))

(declare-datatypes ((SeekEntryResult!5667 0))(
  ( (MissingZero!5667 (index!24895 (_ BitVec 32))) (Found!5667 (index!24896 (_ BitVec 32))) (Intermediate!5667 (undefined!6479 Bool) (index!24897 (_ BitVec 32)) (x!53760 (_ BitVec 32))) (Undefined!5667) (MissingVacant!5667 (index!24898 (_ BitVec 32))) )
))
(declare-fun lt!261609 () SeekEntryResult!5667)

(get-info :version)

(assert (=> b!572974 (= res!362486 (or (undefined!6479 lt!261609) (not ((_ is Intermediate!5667) lt!261609))))))

(declare-fun b!572975 () Bool)

(declare-fun res!362488 () Bool)

(declare-fun e!329604 () Bool)

(assert (=> b!572975 (=> (not res!362488) (not e!329604))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572975 (= res!362488 (validKeyInArray!0 (select (arr!17218 a!3118) j!142)))))

(declare-fun b!572976 () Bool)

(declare-fun e!329608 () Bool)

(assert (=> b!572976 (= e!329610 e!329608)))

(declare-fun res!362490 () Bool)

(assert (=> b!572976 (=> (not res!362490) (not e!329608))))

(declare-fun lt!261613 () (_ BitVec 64))

(declare-fun lt!261612 () (_ BitVec 32))

(declare-fun lt!261608 () array!35859)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35859 (_ BitVec 32)) SeekEntryResult!5667)

(assert (=> b!572976 (= res!362490 (= lt!261609 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261612 lt!261613 lt!261608 mask!3119)))))

(declare-fun lt!261610 () (_ BitVec 32))

(assert (=> b!572976 (= lt!261609 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261610 (select (arr!17218 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572976 (= lt!261612 (toIndex!0 lt!261613 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!572976 (= lt!261613 (select (store (arr!17218 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!572976 (= lt!261610 (toIndex!0 (select (arr!17218 a!3118) j!142) mask!3119))))

(assert (=> b!572976 (= lt!261608 (array!35860 (store (arr!17218 a!3118) i!1132 k0!1914) (size!17582 a!3118)))))

(declare-fun b!572977 () Bool)

(declare-fun res!362483 () Bool)

(assert (=> b!572977 (=> (not res!362483) (not e!329610))))

(declare-datatypes ((List!11298 0))(
  ( (Nil!11295) (Cons!11294 (h!12321 (_ BitVec 64)) (t!17526 List!11298)) )
))
(declare-fun arrayNoDuplicates!0 (array!35859 (_ BitVec 32) List!11298) Bool)

(assert (=> b!572977 (= res!362483 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11295))))

(declare-fun b!572978 () Bool)

(declare-fun res!362489 () Bool)

(assert (=> b!572978 (=> (not res!362489) (not e!329604))))

(assert (=> b!572978 (= res!362489 (validKeyInArray!0 k0!1914))))

(declare-fun b!572979 () Bool)

(declare-fun e!329606 () Bool)

(assert (=> b!572979 (= e!329609 e!329606)))

(declare-fun res!362487 () Bool)

(assert (=> b!572979 (=> res!362487 e!329606)))

(declare-fun lt!261607 () (_ BitVec 64))

(assert (=> b!572979 (= res!362487 (or (= lt!261607 (select (arr!17218 a!3118) j!142)) (= lt!261607 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!572979 (= lt!261607 (select (arr!17218 a!3118) (index!24897 lt!261609)))))

(declare-fun b!572980 () Bool)

(declare-fun e!329605 () Bool)

(assert (=> b!572980 (= e!329606 e!329605)))

(declare-fun res!362482 () Bool)

(assert (=> b!572980 (=> (not res!362482) (not e!329605))))

(declare-fun lt!261606 () SeekEntryResult!5667)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35859 (_ BitVec 32)) SeekEntryResult!5667)

(assert (=> b!572980 (= res!362482 (= lt!261606 (seekKeyOrZeroReturnVacant!0 (x!53760 lt!261609) (index!24897 lt!261609) (index!24897 lt!261609) (select (arr!17218 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572981 () Bool)

(declare-fun res!362485 () Bool)

(assert (=> b!572981 (=> (not res!362485) (not e!329604))))

(declare-fun arrayContainsKey!0 (array!35859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572981 (= res!362485 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572973 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35859 (_ BitVec 32)) SeekEntryResult!5667)

(assert (=> b!572973 (= e!329605 (= (seekEntryOrOpen!0 lt!261613 lt!261608 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53760 lt!261609) (index!24897 lt!261609) (index!24897 lt!261609) lt!261613 lt!261608 mask!3119)))))

(declare-fun res!362484 () Bool)

(assert (=> start!52462 (=> (not res!362484) (not e!329604))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52462 (= res!362484 (validMask!0 mask!3119))))

(assert (=> start!52462 e!329604))

(assert (=> start!52462 true))

(declare-fun array_inv!13014 (array!35859) Bool)

(assert (=> start!52462 (array_inv!13014 a!3118)))

(declare-fun b!572982 () Bool)

(declare-fun res!362481 () Bool)

(assert (=> b!572982 (=> (not res!362481) (not e!329604))))

(assert (=> b!572982 (= res!362481 (and (= (size!17582 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17582 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17582 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572983 () Bool)

(assert (=> b!572983 (= e!329604 e!329610)))

(declare-fun res!362492 () Bool)

(assert (=> b!572983 (=> (not res!362492) (not e!329610))))

(declare-fun lt!261611 () SeekEntryResult!5667)

(assert (=> b!572983 (= res!362492 (or (= lt!261611 (MissingZero!5667 i!1132)) (= lt!261611 (MissingVacant!5667 i!1132))))))

(assert (=> b!572983 (= lt!261611 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!572984 () Bool)

(assert (=> b!572984 (= e!329608 (not true))))

(assert (=> b!572984 e!329607))

(declare-fun res!362480 () Bool)

(assert (=> b!572984 (=> (not res!362480) (not e!329607))))

(assert (=> b!572984 (= res!362480 (= lt!261606 (Found!5667 j!142)))))

(assert (=> b!572984 (= lt!261606 (seekEntryOrOpen!0 (select (arr!17218 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!572984 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18036 0))(
  ( (Unit!18037) )
))
(declare-fun lt!261605 () Unit!18036)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35859 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18036)

(assert (=> b!572984 (= lt!261605 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!52462 res!362484) b!572982))

(assert (= (and b!572982 res!362481) b!572975))

(assert (= (and b!572975 res!362488) b!572978))

(assert (= (and b!572978 res!362489) b!572981))

(assert (= (and b!572981 res!362485) b!572983))

(assert (= (and b!572983 res!362492) b!572972))

(assert (= (and b!572972 res!362491) b!572977))

(assert (= (and b!572977 res!362483) b!572976))

(assert (= (and b!572976 res!362490) b!572984))

(assert (= (and b!572984 res!362480) b!572974))

(assert (= (and b!572974 (not res!362486)) b!572979))

(assert (= (and b!572979 (not res!362487)) b!572980))

(assert (= (and b!572980 res!362482) b!572973))

(declare-fun m!552017 () Bool)

(assert (=> b!572978 m!552017))

(declare-fun m!552019 () Bool)

(assert (=> b!572972 m!552019))

(declare-fun m!552021 () Bool)

(assert (=> b!572979 m!552021))

(declare-fun m!552023 () Bool)

(assert (=> b!572979 m!552023))

(assert (=> b!572975 m!552021))

(assert (=> b!572975 m!552021))

(declare-fun m!552025 () Bool)

(assert (=> b!572975 m!552025))

(declare-fun m!552027 () Bool)

(assert (=> start!52462 m!552027))

(declare-fun m!552029 () Bool)

(assert (=> start!52462 m!552029))

(declare-fun m!552031 () Bool)

(assert (=> b!572981 m!552031))

(declare-fun m!552033 () Bool)

(assert (=> b!572977 m!552033))

(assert (=> b!572984 m!552021))

(assert (=> b!572984 m!552021))

(declare-fun m!552035 () Bool)

(assert (=> b!572984 m!552035))

(declare-fun m!552037 () Bool)

(assert (=> b!572984 m!552037))

(declare-fun m!552039 () Bool)

(assert (=> b!572984 m!552039))

(assert (=> b!572980 m!552021))

(assert (=> b!572980 m!552021))

(declare-fun m!552041 () Bool)

(assert (=> b!572980 m!552041))

(assert (=> b!572976 m!552021))

(declare-fun m!552043 () Bool)

(assert (=> b!572976 m!552043))

(assert (=> b!572976 m!552021))

(declare-fun m!552045 () Bool)

(assert (=> b!572976 m!552045))

(declare-fun m!552047 () Bool)

(assert (=> b!572976 m!552047))

(declare-fun m!552049 () Bool)

(assert (=> b!572976 m!552049))

(declare-fun m!552051 () Bool)

(assert (=> b!572976 m!552051))

(assert (=> b!572976 m!552021))

(declare-fun m!552053 () Bool)

(assert (=> b!572976 m!552053))

(declare-fun m!552055 () Bool)

(assert (=> b!572973 m!552055))

(declare-fun m!552057 () Bool)

(assert (=> b!572973 m!552057))

(declare-fun m!552059 () Bool)

(assert (=> b!572983 m!552059))

(check-sat (not start!52462) (not b!572983) (not b!572984) (not b!572978) (not b!572977) (not b!572980) (not b!572981) (not b!572973) (not b!572975) (not b!572972) (not b!572976))
(check-sat)
