; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52134 () Bool)

(assert start!52134)

(declare-fun b!568968 () Bool)

(declare-fun res!358987 () Bool)

(declare-fun e!327370 () Bool)

(assert (=> b!568968 (=> (not res!358987) (not e!327370))))

(declare-datatypes ((array!35657 0))(
  ( (array!35658 (arr!17120 (Array (_ BitVec 32) (_ BitVec 64))) (size!17484 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35657)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!568968 (= res!358987 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!568969 () Bool)

(declare-fun res!358990 () Bool)

(declare-fun e!327369 () Bool)

(assert (=> b!568969 (=> (not res!358990) (not e!327369))))

(declare-datatypes ((List!11200 0))(
  ( (Nil!11197) (Cons!11196 (h!12217 (_ BitVec 64)) (t!17428 List!11200)) )
))
(declare-fun arrayNoDuplicates!0 (array!35657 (_ BitVec 32) List!11200) Bool)

(assert (=> b!568969 (= res!358990 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11197))))

(declare-fun b!568970 () Bool)

(declare-fun e!327371 () Bool)

(assert (=> b!568970 (= e!327369 e!327371)))

(declare-fun res!358988 () Bool)

(assert (=> b!568970 (=> (not res!358988) (not e!327371))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!259231 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5569 0))(
  ( (MissingZero!5569 (index!24503 (_ BitVec 32))) (Found!5569 (index!24504 (_ BitVec 32))) (Intermediate!5569 (undefined!6381 Bool) (index!24505 (_ BitVec 32)) (x!53380 (_ BitVec 32))) (Undefined!5569) (MissingVacant!5569 (index!24506 (_ BitVec 32))) )
))
(declare-fun lt!259232 () SeekEntryResult!5569)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35657 (_ BitVec 32)) SeekEntryResult!5569)

(assert (=> b!568970 (= res!358988 (= lt!259232 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259231 (select (store (arr!17120 a!3118) i!1132 k!1914) j!142) (array!35658 (store (arr!17120 a!3118) i!1132 k!1914) (size!17484 a!3118)) mask!3119)))))

(declare-fun lt!259234 () (_ BitVec 32))

(assert (=> b!568970 (= lt!259232 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259234 (select (arr!17120 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568970 (= lt!259231 (toIndex!0 (select (store (arr!17120 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!568970 (= lt!259234 (toIndex!0 (select (arr!17120 a!3118) j!142) mask!3119))))

(declare-fun b!568972 () Bool)

(assert (=> b!568972 (= e!327371 (not true))))

(declare-fun lt!259233 () SeekEntryResult!5569)

(assert (=> b!568972 (and (= lt!259233 (Found!5569 j!142)) (or (undefined!6381 lt!259232) (not (is-Intermediate!5569 lt!259232)) (= (select (arr!17120 a!3118) (index!24505 lt!259232)) (select (arr!17120 a!3118) j!142)) (not (= (select (arr!17120 a!3118) (index!24505 lt!259232)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259233 (MissingZero!5569 (index!24505 lt!259232)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35657 (_ BitVec 32)) SeekEntryResult!5569)

(assert (=> b!568972 (= lt!259233 (seekEntryOrOpen!0 (select (arr!17120 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35657 (_ BitVec 32)) Bool)

(assert (=> b!568972 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17840 0))(
  ( (Unit!17841) )
))
(declare-fun lt!259229 () Unit!17840)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35657 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17840)

(assert (=> b!568972 (= lt!259229 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!568973 () Bool)

(declare-fun res!358991 () Bool)

(assert (=> b!568973 (=> (not res!358991) (not e!327370))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!568973 (= res!358991 (validKeyInArray!0 k!1914))))

(declare-fun b!568974 () Bool)

(declare-fun res!358993 () Bool)

(assert (=> b!568974 (=> (not res!358993) (not e!327369))))

(assert (=> b!568974 (= res!358993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!568975 () Bool)

(declare-fun res!358992 () Bool)

(assert (=> b!568975 (=> (not res!358992) (not e!327370))))

(assert (=> b!568975 (= res!358992 (validKeyInArray!0 (select (arr!17120 a!3118) j!142)))))

(declare-fun b!568976 () Bool)

(assert (=> b!568976 (= e!327370 e!327369)))

(declare-fun res!358986 () Bool)

(assert (=> b!568976 (=> (not res!358986) (not e!327369))))

(declare-fun lt!259230 () SeekEntryResult!5569)

(assert (=> b!568976 (= res!358986 (or (= lt!259230 (MissingZero!5569 i!1132)) (= lt!259230 (MissingVacant!5569 i!1132))))))

(assert (=> b!568976 (= lt!259230 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!358989 () Bool)

(assert (=> start!52134 (=> (not res!358989) (not e!327370))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52134 (= res!358989 (validMask!0 mask!3119))))

(assert (=> start!52134 e!327370))

(assert (=> start!52134 true))

(declare-fun array_inv!12916 (array!35657) Bool)

(assert (=> start!52134 (array_inv!12916 a!3118)))

(declare-fun b!568971 () Bool)

(declare-fun res!358994 () Bool)

(assert (=> b!568971 (=> (not res!358994) (not e!327370))))

(assert (=> b!568971 (= res!358994 (and (= (size!17484 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17484 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17484 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!52134 res!358989) b!568971))

(assert (= (and b!568971 res!358994) b!568975))

(assert (= (and b!568975 res!358992) b!568973))

(assert (= (and b!568973 res!358991) b!568968))

(assert (= (and b!568968 res!358987) b!568976))

(assert (= (and b!568976 res!358986) b!568974))

(assert (= (and b!568974 res!358993) b!568969))

(assert (= (and b!568969 res!358990) b!568970))

(assert (= (and b!568970 res!358988) b!568972))

(declare-fun m!547507 () Bool)

(assert (=> b!568975 m!547507))

(assert (=> b!568975 m!547507))

(declare-fun m!547509 () Bool)

(assert (=> b!568975 m!547509))

(declare-fun m!547511 () Bool)

(assert (=> b!568973 m!547511))

(declare-fun m!547513 () Bool)

(assert (=> start!52134 m!547513))

(declare-fun m!547515 () Bool)

(assert (=> start!52134 m!547515))

(declare-fun m!547517 () Bool)

(assert (=> b!568969 m!547517))

(assert (=> b!568972 m!547507))

(declare-fun m!547519 () Bool)

(assert (=> b!568972 m!547519))

(declare-fun m!547521 () Bool)

(assert (=> b!568972 m!547521))

(declare-fun m!547523 () Bool)

(assert (=> b!568972 m!547523))

(assert (=> b!568972 m!547507))

(declare-fun m!547525 () Bool)

(assert (=> b!568972 m!547525))

(declare-fun m!547527 () Bool)

(assert (=> b!568968 m!547527))

(assert (=> b!568970 m!547507))

(declare-fun m!547529 () Bool)

(assert (=> b!568970 m!547529))

(assert (=> b!568970 m!547507))

(declare-fun m!547531 () Bool)

(assert (=> b!568970 m!547531))

(assert (=> b!568970 m!547531))

(declare-fun m!547533 () Bool)

(assert (=> b!568970 m!547533))

(declare-fun m!547535 () Bool)

(assert (=> b!568970 m!547535))

(assert (=> b!568970 m!547507))

(declare-fun m!547537 () Bool)

(assert (=> b!568970 m!547537))

(assert (=> b!568970 m!547531))

(declare-fun m!547539 () Bool)

(assert (=> b!568970 m!547539))

(declare-fun m!547541 () Bool)

(assert (=> b!568976 m!547541))

(declare-fun m!547543 () Bool)

(assert (=> b!568974 m!547543))

(push 1)

