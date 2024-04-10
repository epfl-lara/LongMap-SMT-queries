; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64506 () Bool)

(assert start!64506)

(declare-fun b!725983 () Bool)

(declare-fun e!406511 () Bool)

(declare-fun e!406517 () Bool)

(assert (=> b!725983 (= e!406511 e!406517)))

(declare-fun res!487027 () Bool)

(assert (=> b!725983 (=> (not res!487027) (not e!406517))))

(declare-datatypes ((array!41024 0))(
  ( (array!41025 (arr!19633 (Array (_ BitVec 32) (_ BitVec 64))) (size!20054 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41024)

(declare-datatypes ((SeekEntryResult!7233 0))(
  ( (MissingZero!7233 (index!31300 (_ BitVec 32))) (Found!7233 (index!31301 (_ BitVec 32))) (Intermediate!7233 (undefined!8045 Bool) (index!31302 (_ BitVec 32)) (x!62291 (_ BitVec 32))) (Undefined!7233) (MissingVacant!7233 (index!31303 (_ BitVec 32))) )
))
(declare-fun lt!321535 () SeekEntryResult!7233)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41024 (_ BitVec 32)) SeekEntryResult!7233)

(assert (=> b!725983 (= res!487027 (= (seekEntryOrOpen!0 (select (arr!19633 a!3186) j!159) a!3186 mask!3328) lt!321535))))

(assert (=> b!725983 (= lt!321535 (Found!7233 j!159))))

(declare-fun b!725984 () Bool)

(declare-fun res!487030 () Bool)

(declare-fun e!406509 () Bool)

(assert (=> b!725984 (=> (not res!487030) (not e!406509))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!725984 (= res!487030 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20054 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20054 a!3186))))))

(declare-fun b!725985 () Bool)

(declare-fun e!406514 () Bool)

(declare-fun e!406513 () Bool)

(assert (=> b!725985 (= e!406514 (not e!406513))))

(declare-fun res!487021 () Bool)

(assert (=> b!725985 (=> res!487021 e!406513)))

(assert (=> b!725985 (= res!487021 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(assert (=> b!725985 e!406511))

(declare-fun res!487026 () Bool)

(assert (=> b!725985 (=> (not res!487026) (not e!406511))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41024 (_ BitVec 32)) Bool)

(assert (=> b!725985 (= res!487026 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24784 0))(
  ( (Unit!24785) )
))
(declare-fun lt!321534 () Unit!24784)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41024 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24784)

(assert (=> b!725985 (= lt!321534 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!725986 () Bool)

(declare-fun res!487024 () Bool)

(assert (=> b!725986 (=> (not res!487024) (not e!406509))))

(assert (=> b!725986 (= res!487024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun lt!321536 () SeekEntryResult!7233)

(declare-fun b!725987 () Bool)

(declare-fun e!406512 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41024 (_ BitVec 32)) SeekEntryResult!7233)

(assert (=> b!725987 (= e!406512 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19633 a!3186) j!159) a!3186 mask!3328) lt!321536))))

(declare-fun b!725988 () Bool)

(declare-fun lt!321538 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725988 (= e!406513 (validKeyInArray!0 lt!321538))))

(declare-fun b!725989 () Bool)

(declare-fun res!487020 () Bool)

(declare-fun e!406515 () Bool)

(assert (=> b!725989 (=> (not res!487020) (not e!406515))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!725989 (= res!487020 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19633 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!725990 () Bool)

(declare-fun res!487023 () Bool)

(declare-fun e!406516 () Bool)

(assert (=> b!725990 (=> (not res!487023) (not e!406516))))

(assert (=> b!725990 (= res!487023 (validKeyInArray!0 (select (arr!19633 a!3186) j!159)))))

(declare-fun b!725991 () Bool)

(assert (=> b!725991 (= e!406509 e!406515)))

(declare-fun res!487022 () Bool)

(assert (=> b!725991 (=> (not res!487022) (not e!406515))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725991 (= res!487022 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19633 a!3186) j!159) mask!3328) (select (arr!19633 a!3186) j!159) a!3186 mask!3328) lt!321536))))

(assert (=> b!725991 (= lt!321536 (Intermediate!7233 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!725992 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41024 (_ BitVec 32)) SeekEntryResult!7233)

(assert (=> b!725992 (= e!406512 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19633 a!3186) j!159) a!3186 mask!3328) (Found!7233 j!159)))))

(declare-fun b!725993 () Bool)

(declare-fun res!487034 () Bool)

(assert (=> b!725993 (=> (not res!487034) (not e!406516))))

(assert (=> b!725993 (= res!487034 (and (= (size!20054 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20054 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20054 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!725994 () Bool)

(declare-fun res!487032 () Bool)

(assert (=> b!725994 (=> (not res!487032) (not e!406509))))

(declare-datatypes ((List!13635 0))(
  ( (Nil!13632) (Cons!13631 (h!14688 (_ BitVec 64)) (t!19950 List!13635)) )
))
(declare-fun arrayNoDuplicates!0 (array!41024 (_ BitVec 32) List!13635) Bool)

(assert (=> b!725994 (= res!487032 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13632))))

(declare-fun b!725995 () Bool)

(assert (=> b!725995 (= e!406515 e!406514)))

(declare-fun res!487033 () Bool)

(assert (=> b!725995 (=> (not res!487033) (not e!406514))))

(declare-fun lt!321537 () array!41024)

(assert (=> b!725995 (= res!487033 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321538 mask!3328) lt!321538 lt!321537 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321538 lt!321537 mask!3328)))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!725995 (= lt!321538 (select (store (arr!19633 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!725995 (= lt!321537 (array!41025 (store (arr!19633 a!3186) i!1173 k0!2102) (size!20054 a!3186)))))

(declare-fun b!725996 () Bool)

(declare-fun res!487019 () Bool)

(assert (=> b!725996 (=> (not res!487019) (not e!406516))))

(declare-fun arrayContainsKey!0 (array!41024 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725996 (= res!487019 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!725997 () Bool)

(assert (=> b!725997 (= e!406517 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19633 a!3186) j!159) a!3186 mask!3328) lt!321535))))

(declare-fun b!725998 () Bool)

(assert (=> b!725998 (= e!406516 e!406509)))

(declare-fun res!487029 () Bool)

(assert (=> b!725998 (=> (not res!487029) (not e!406509))))

(declare-fun lt!321539 () SeekEntryResult!7233)

(assert (=> b!725998 (= res!487029 (or (= lt!321539 (MissingZero!7233 i!1173)) (= lt!321539 (MissingVacant!7233 i!1173))))))

(assert (=> b!725998 (= lt!321539 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!725999 () Bool)

(declare-fun res!487028 () Bool)

(assert (=> b!725999 (=> (not res!487028) (not e!406516))))

(assert (=> b!725999 (= res!487028 (validKeyInArray!0 k0!2102))))

(declare-fun res!487025 () Bool)

(assert (=> start!64506 (=> (not res!487025) (not e!406516))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64506 (= res!487025 (validMask!0 mask!3328))))

(assert (=> start!64506 e!406516))

(assert (=> start!64506 true))

(declare-fun array_inv!15429 (array!41024) Bool)

(assert (=> start!64506 (array_inv!15429 a!3186)))

(declare-fun b!726000 () Bool)

(declare-fun res!487031 () Bool)

(assert (=> b!726000 (=> (not res!487031) (not e!406515))))

(assert (=> b!726000 (= res!487031 e!406512)))

(declare-fun c!79855 () Bool)

(assert (=> b!726000 (= c!79855 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!64506 res!487025) b!725993))

(assert (= (and b!725993 res!487034) b!725990))

(assert (= (and b!725990 res!487023) b!725999))

(assert (= (and b!725999 res!487028) b!725996))

(assert (= (and b!725996 res!487019) b!725998))

(assert (= (and b!725998 res!487029) b!725986))

(assert (= (and b!725986 res!487024) b!725994))

(assert (= (and b!725994 res!487032) b!725984))

(assert (= (and b!725984 res!487030) b!725991))

(assert (= (and b!725991 res!487022) b!725989))

(assert (= (and b!725989 res!487020) b!726000))

(assert (= (and b!726000 c!79855) b!725987))

(assert (= (and b!726000 (not c!79855)) b!725992))

(assert (= (and b!726000 res!487031) b!725995))

(assert (= (and b!725995 res!487033) b!725985))

(assert (= (and b!725985 res!487026) b!725983))

(assert (= (and b!725983 res!487027) b!725997))

(assert (= (and b!725985 (not res!487021)) b!725988))

(declare-fun m!680089 () Bool)

(assert (=> b!725994 m!680089))

(declare-fun m!680091 () Bool)

(assert (=> b!725987 m!680091))

(assert (=> b!725987 m!680091))

(declare-fun m!680093 () Bool)

(assert (=> b!725987 m!680093))

(declare-fun m!680095 () Bool)

(assert (=> b!725995 m!680095))

(declare-fun m!680097 () Bool)

(assert (=> b!725995 m!680097))

(declare-fun m!680099 () Bool)

(assert (=> b!725995 m!680099))

(assert (=> b!725995 m!680095))

(declare-fun m!680101 () Bool)

(assert (=> b!725995 m!680101))

(declare-fun m!680103 () Bool)

(assert (=> b!725995 m!680103))

(assert (=> b!725991 m!680091))

(assert (=> b!725991 m!680091))

(declare-fun m!680105 () Bool)

(assert (=> b!725991 m!680105))

(assert (=> b!725991 m!680105))

(assert (=> b!725991 m!680091))

(declare-fun m!680107 () Bool)

(assert (=> b!725991 m!680107))

(declare-fun m!680109 () Bool)

(assert (=> b!725989 m!680109))

(declare-fun m!680111 () Bool)

(assert (=> b!725998 m!680111))

(assert (=> b!725992 m!680091))

(assert (=> b!725992 m!680091))

(declare-fun m!680113 () Bool)

(assert (=> b!725992 m!680113))

(declare-fun m!680115 () Bool)

(assert (=> b!725996 m!680115))

(declare-fun m!680117 () Bool)

(assert (=> b!725999 m!680117))

(declare-fun m!680119 () Bool)

(assert (=> b!725988 m!680119))

(assert (=> b!725990 m!680091))

(assert (=> b!725990 m!680091))

(declare-fun m!680121 () Bool)

(assert (=> b!725990 m!680121))

(declare-fun m!680123 () Bool)

(assert (=> start!64506 m!680123))

(declare-fun m!680125 () Bool)

(assert (=> start!64506 m!680125))

(declare-fun m!680127 () Bool)

(assert (=> b!725986 m!680127))

(assert (=> b!725997 m!680091))

(assert (=> b!725997 m!680091))

(declare-fun m!680129 () Bool)

(assert (=> b!725997 m!680129))

(assert (=> b!725983 m!680091))

(assert (=> b!725983 m!680091))

(declare-fun m!680131 () Bool)

(assert (=> b!725983 m!680131))

(declare-fun m!680133 () Bool)

(assert (=> b!725985 m!680133))

(declare-fun m!680135 () Bool)

(assert (=> b!725985 m!680135))

(check-sat (not b!725996) (not b!725985) (not b!725992) (not b!725997) (not b!725990) (not b!725988) (not b!725995) (not b!725986) (not b!725998) (not b!725999) (not b!725991) (not b!725987) (not b!725983) (not b!725994) (not start!64506))
(check-sat)
