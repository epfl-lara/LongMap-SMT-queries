; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50604 () Bool)

(assert start!50604)

(declare-fun b!552974 () Bool)

(declare-fun e!319046 () Bool)

(assert (=> b!552974 (= e!319046 (not true))))

(declare-fun e!319047 () Bool)

(assert (=> b!552974 e!319047))

(declare-fun res!345392 () Bool)

(assert (=> b!552974 (=> (not res!345392) (not e!319047))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!34829 0))(
  ( (array!34830 (arr!16724 (Array (_ BitVec 32) (_ BitVec 64))) (size!17088 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34829)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34829 (_ BitVec 32)) Bool)

(assert (=> b!552974 (= res!345392 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17120 0))(
  ( (Unit!17121) )
))
(declare-fun lt!251341 () Unit!17120)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34829 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17120)

(assert (=> b!552974 (= lt!251341 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552975 () Bool)

(declare-fun res!345387 () Bool)

(declare-fun e!319044 () Bool)

(assert (=> b!552975 (=> (not res!345387) (not e!319044))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!552975 (= res!345387 (and (= (size!17088 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17088 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17088 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!345395 () Bool)

(assert (=> start!50604 (=> (not res!345395) (not e!319044))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50604 (= res!345395 (validMask!0 mask!3119))))

(assert (=> start!50604 e!319044))

(assert (=> start!50604 true))

(declare-fun array_inv!12520 (array!34829) Bool)

(assert (=> start!50604 (array_inv!12520 a!3118)))

(declare-fun b!552976 () Bool)

(declare-fun res!345391 () Bool)

(assert (=> b!552976 (=> (not res!345391) (not e!319044))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552976 (= res!345391 (validKeyInArray!0 (select (arr!16724 a!3118) j!142)))))

(declare-fun b!552977 () Bool)

(declare-fun res!345393 () Bool)

(assert (=> b!552977 (=> (not res!345393) (not e!319044))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!552977 (= res!345393 (validKeyInArray!0 k!1914))))

(declare-fun b!552978 () Bool)

(declare-fun res!345390 () Bool)

(assert (=> b!552978 (=> (not res!345390) (not e!319046))))

(declare-datatypes ((List!10804 0))(
  ( (Nil!10801) (Cons!10800 (h!11785 (_ BitVec 64)) (t!17032 List!10804)) )
))
(declare-fun arrayNoDuplicates!0 (array!34829 (_ BitVec 32) List!10804) Bool)

(assert (=> b!552978 (= res!345390 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10801))))

(declare-fun b!552979 () Bool)

(declare-fun res!345388 () Bool)

(assert (=> b!552979 (=> (not res!345388) (not e!319046))))

(assert (=> b!552979 (= res!345388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!552980 () Bool)

(declare-fun res!345386 () Bool)

(assert (=> b!552980 (=> (not res!345386) (not e!319044))))

(declare-fun arrayContainsKey!0 (array!34829 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552980 (= res!345386 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552981 () Bool)

(declare-datatypes ((SeekEntryResult!5173 0))(
  ( (MissingZero!5173 (index!22919 (_ BitVec 32))) (Found!5173 (index!22920 (_ BitVec 32))) (Intermediate!5173 (undefined!5985 Bool) (index!22921 (_ BitVec 32)) (x!51847 (_ BitVec 32))) (Undefined!5173) (MissingVacant!5173 (index!22922 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34829 (_ BitVec 32)) SeekEntryResult!5173)

(assert (=> b!552981 (= e!319047 (= (seekEntryOrOpen!0 (select (arr!16724 a!3118) j!142) a!3118 mask!3119) (Found!5173 j!142)))))

(declare-fun b!552982 () Bool)

(assert (=> b!552982 (= e!319044 e!319046)))

(declare-fun res!345389 () Bool)

(assert (=> b!552982 (=> (not res!345389) (not e!319046))))

(declare-fun lt!251340 () SeekEntryResult!5173)

(assert (=> b!552982 (= res!345389 (or (= lt!251340 (MissingZero!5173 i!1132)) (= lt!251340 (MissingVacant!5173 i!1132))))))

(assert (=> b!552982 (= lt!251340 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!552983 () Bool)

(declare-fun res!345394 () Bool)

(assert (=> b!552983 (=> (not res!345394) (not e!319046))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34829 (_ BitVec 32)) SeekEntryResult!5173)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552983 (= res!345394 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16724 a!3118) j!142) mask!3119) (select (arr!16724 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16724 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16724 a!3118) i!1132 k!1914) j!142) (array!34830 (store (arr!16724 a!3118) i!1132 k!1914) (size!17088 a!3118)) mask!3119)))))

(assert (= (and start!50604 res!345395) b!552975))

(assert (= (and b!552975 res!345387) b!552976))

(assert (= (and b!552976 res!345391) b!552977))

(assert (= (and b!552977 res!345393) b!552980))

(assert (= (and b!552980 res!345386) b!552982))

(assert (= (and b!552982 res!345389) b!552979))

(assert (= (and b!552979 res!345388) b!552978))

(assert (= (and b!552978 res!345390) b!552983))

(assert (= (and b!552983 res!345394) b!552974))

(assert (= (and b!552974 res!345392) b!552981))

(declare-fun m!529965 () Bool)

(assert (=> b!552977 m!529965))

(declare-fun m!529967 () Bool)

(assert (=> b!552982 m!529967))

(declare-fun m!529969 () Bool)

(assert (=> b!552978 m!529969))

(declare-fun m!529971 () Bool)

(assert (=> start!50604 m!529971))

(declare-fun m!529973 () Bool)

(assert (=> start!50604 m!529973))

(declare-fun m!529975 () Bool)

(assert (=> b!552983 m!529975))

(declare-fun m!529977 () Bool)

(assert (=> b!552983 m!529977))

(assert (=> b!552983 m!529975))

(declare-fun m!529979 () Bool)

(assert (=> b!552983 m!529979))

(declare-fun m!529981 () Bool)

(assert (=> b!552983 m!529981))

(assert (=> b!552983 m!529979))

(declare-fun m!529983 () Bool)

(assert (=> b!552983 m!529983))

(assert (=> b!552983 m!529977))

(assert (=> b!552983 m!529975))

(declare-fun m!529985 () Bool)

(assert (=> b!552983 m!529985))

(declare-fun m!529987 () Bool)

(assert (=> b!552983 m!529987))

(assert (=> b!552983 m!529979))

(assert (=> b!552983 m!529981))

(declare-fun m!529989 () Bool)

(assert (=> b!552980 m!529989))

(assert (=> b!552981 m!529975))

(assert (=> b!552981 m!529975))

(declare-fun m!529991 () Bool)

(assert (=> b!552981 m!529991))

(declare-fun m!529993 () Bool)

(assert (=> b!552974 m!529993))

(declare-fun m!529995 () Bool)

(assert (=> b!552974 m!529995))

(declare-fun m!529997 () Bool)

(assert (=> b!552979 m!529997))

(assert (=> b!552976 m!529975))

(assert (=> b!552976 m!529975))

(declare-fun m!529999 () Bool)

(assert (=> b!552976 m!529999))

(push 1)

