; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52460 () Bool)

(assert start!52460)

(declare-fun b!572933 () Bool)

(declare-fun e!329584 () Bool)

(declare-fun e!329583 () Bool)

(assert (=> b!572933 (= e!329584 e!329583)))

(declare-fun res!362450 () Bool)

(assert (=> b!572933 (=> (not res!362450) (not e!329583))))

(declare-datatypes ((SeekEntryResult!5666 0))(
  ( (MissingZero!5666 (index!24891 (_ BitVec 32))) (Found!5666 (index!24892 (_ BitVec 32))) (Intermediate!5666 (undefined!6478 Bool) (index!24893 (_ BitVec 32)) (x!53759 (_ BitVec 32))) (Undefined!5666) (MissingVacant!5666 (index!24894 (_ BitVec 32))) )
))
(declare-fun lt!261581 () SeekEntryResult!5666)

(declare-datatypes ((array!35857 0))(
  ( (array!35858 (arr!17217 (Array (_ BitVec 32) (_ BitVec 64))) (size!17581 (_ BitVec 32))) )
))
(declare-fun lt!261584 () array!35857)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!261583 () (_ BitVec 64))

(declare-fun lt!261578 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35857 (_ BitVec 32)) SeekEntryResult!5666)

(assert (=> b!572933 (= res!362450 (= lt!261581 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261578 lt!261583 lt!261584 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!261582 () (_ BitVec 32))

(declare-fun a!3118 () array!35857)

(assert (=> b!572933 (= lt!261581 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261582 (select (arr!17217 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572933 (= lt!261578 (toIndex!0 lt!261583 mask!3119))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572933 (= lt!261583 (select (store (arr!17217 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!572933 (= lt!261582 (toIndex!0 (select (arr!17217 a!3118) j!142) mask!3119))))

(assert (=> b!572933 (= lt!261584 (array!35858 (store (arr!17217 a!3118) i!1132 k!1914) (size!17581 a!3118)))))

(declare-fun b!572934 () Bool)

(declare-fun e!329579 () Bool)

(declare-fun e!329586 () Bool)

(assert (=> b!572934 (= e!329579 e!329586)))

(declare-fun res!362453 () Bool)

(assert (=> b!572934 (=> (not res!362453) (not e!329586))))

(declare-fun lt!261580 () SeekEntryResult!5666)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35857 (_ BitVec 32)) SeekEntryResult!5666)

(assert (=> b!572934 (= res!362453 (= lt!261580 (seekKeyOrZeroReturnVacant!0 (x!53759 lt!261581) (index!24893 lt!261581) (index!24893 lt!261581) (select (arr!17217 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572935 () Bool)

(declare-fun e!329585 () Bool)

(declare-fun e!329580 () Bool)

(assert (=> b!572935 (= e!329585 e!329580)))

(declare-fun res!362444 () Bool)

(assert (=> b!572935 (=> res!362444 e!329580)))

(assert (=> b!572935 (= res!362444 (or (undefined!6478 lt!261581) (not (is-Intermediate!5666 lt!261581))))))

(declare-fun b!572936 () Bool)

(assert (=> b!572936 (= e!329580 e!329579)))

(declare-fun res!362441 () Bool)

(assert (=> b!572936 (=> res!362441 e!329579)))

(declare-fun lt!261585 () (_ BitVec 64))

(assert (=> b!572936 (= res!362441 (or (= lt!261585 (select (arr!17217 a!3118) j!142)) (= lt!261585 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!572936 (= lt!261585 (select (arr!17217 a!3118) (index!24893 lt!261581)))))

(declare-fun b!572937 () Bool)

(declare-fun res!362443 () Bool)

(declare-fun e!329582 () Bool)

(assert (=> b!572937 (=> (not res!362443) (not e!329582))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572937 (= res!362443 (validKeyInArray!0 k!1914))))

(declare-fun res!362445 () Bool)

(assert (=> start!52460 (=> (not res!362445) (not e!329582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52460 (= res!362445 (validMask!0 mask!3119))))

(assert (=> start!52460 e!329582))

(assert (=> start!52460 true))

(declare-fun array_inv!13013 (array!35857) Bool)

(assert (=> start!52460 (array_inv!13013 a!3118)))

(declare-fun b!572938 () Bool)

(assert (=> b!572938 (= e!329582 e!329584)))

(declare-fun res!362452 () Bool)

(assert (=> b!572938 (=> (not res!362452) (not e!329584))))

(declare-fun lt!261579 () SeekEntryResult!5666)

(assert (=> b!572938 (= res!362452 (or (= lt!261579 (MissingZero!5666 i!1132)) (= lt!261579 (MissingVacant!5666 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35857 (_ BitVec 32)) SeekEntryResult!5666)

(assert (=> b!572938 (= lt!261579 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!572939 () Bool)

(declare-fun res!362451 () Bool)

(assert (=> b!572939 (=> (not res!362451) (not e!329582))))

(declare-fun arrayContainsKey!0 (array!35857 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572939 (= res!362451 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572940 () Bool)

(declare-fun res!362442 () Bool)

(assert (=> b!572940 (=> (not res!362442) (not e!329584))))

(declare-datatypes ((List!11297 0))(
  ( (Nil!11294) (Cons!11293 (h!12320 (_ BitVec 64)) (t!17525 List!11297)) )
))
(declare-fun arrayNoDuplicates!0 (array!35857 (_ BitVec 32) List!11297) Bool)

(assert (=> b!572940 (= res!362442 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11294))))

(declare-fun b!572941 () Bool)

(assert (=> b!572941 (= e!329583 (not true))))

(assert (=> b!572941 e!329585))

(declare-fun res!362446 () Bool)

(assert (=> b!572941 (=> (not res!362446) (not e!329585))))

(assert (=> b!572941 (= res!362446 (= lt!261580 (Found!5666 j!142)))))

(assert (=> b!572941 (= lt!261580 (seekEntryOrOpen!0 (select (arr!17217 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35857 (_ BitVec 32)) Bool)

(assert (=> b!572941 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18034 0))(
  ( (Unit!18035) )
))
(declare-fun lt!261586 () Unit!18034)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35857 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18034)

(assert (=> b!572941 (= lt!261586 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!572942 () Bool)

(declare-fun res!362449 () Bool)

(assert (=> b!572942 (=> (not res!362449) (not e!329582))))

(assert (=> b!572942 (= res!362449 (validKeyInArray!0 (select (arr!17217 a!3118) j!142)))))

(declare-fun b!572943 () Bool)

(assert (=> b!572943 (= e!329586 (= (seekEntryOrOpen!0 lt!261583 lt!261584 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53759 lt!261581) (index!24893 lt!261581) (index!24893 lt!261581) lt!261583 lt!261584 mask!3119)))))

(declare-fun b!572944 () Bool)

(declare-fun res!362448 () Bool)

(assert (=> b!572944 (=> (not res!362448) (not e!329582))))

(assert (=> b!572944 (= res!362448 (and (= (size!17581 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17581 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17581 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572945 () Bool)

(declare-fun res!362447 () Bool)

(assert (=> b!572945 (=> (not res!362447) (not e!329584))))

(assert (=> b!572945 (= res!362447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!52460 res!362445) b!572944))

(assert (= (and b!572944 res!362448) b!572942))

(assert (= (and b!572942 res!362449) b!572937))

(assert (= (and b!572937 res!362443) b!572939))

(assert (= (and b!572939 res!362451) b!572938))

(assert (= (and b!572938 res!362452) b!572945))

(assert (= (and b!572945 res!362447) b!572940))

(assert (= (and b!572940 res!362442) b!572933))

(assert (= (and b!572933 res!362450) b!572941))

(assert (= (and b!572941 res!362446) b!572935))

(assert (= (and b!572935 (not res!362444)) b!572936))

(assert (= (and b!572936 (not res!362441)) b!572934))

(assert (= (and b!572934 res!362453) b!572943))

(declare-fun m!551973 () Bool)

(assert (=> b!572939 m!551973))

(declare-fun m!551975 () Bool)

(assert (=> b!572937 m!551975))

(declare-fun m!551977 () Bool)

(assert (=> b!572940 m!551977))

(declare-fun m!551979 () Bool)

(assert (=> b!572934 m!551979))

(assert (=> b!572934 m!551979))

(declare-fun m!551981 () Bool)

(assert (=> b!572934 m!551981))

(declare-fun m!551983 () Bool)

(assert (=> b!572943 m!551983))

(declare-fun m!551985 () Bool)

(assert (=> b!572943 m!551985))

(declare-fun m!551987 () Bool)

(assert (=> b!572938 m!551987))

(declare-fun m!551989 () Bool)

(assert (=> start!52460 m!551989))

(declare-fun m!551991 () Bool)

(assert (=> start!52460 m!551991))

(declare-fun m!551993 () Bool)

(assert (=> b!572945 m!551993))

(assert (=> b!572936 m!551979))

(declare-fun m!551995 () Bool)

(assert (=> b!572936 m!551995))

(assert (=> b!572941 m!551979))

(assert (=> b!572941 m!551979))

(declare-fun m!551997 () Bool)

(assert (=> b!572941 m!551997))

(declare-fun m!551999 () Bool)

(assert (=> b!572941 m!551999))

(declare-fun m!552001 () Bool)

(assert (=> b!572941 m!552001))

(assert (=> b!572933 m!551979))

(declare-fun m!552003 () Bool)

(assert (=> b!572933 m!552003))

(assert (=> b!572933 m!551979))

(declare-fun m!552005 () Bool)

(assert (=> b!572933 m!552005))

(declare-fun m!552007 () Bool)

(assert (=> b!572933 m!552007))

(declare-fun m!552009 () Bool)

(assert (=> b!572933 m!552009))

(assert (=> b!572933 m!551979))

(declare-fun m!552011 () Bool)

(assert (=> b!572933 m!552011))

(declare-fun m!552013 () Bool)

(assert (=> b!572933 m!552013))

(assert (=> b!572942 m!551979))

(assert (=> b!572942 m!551979))

(declare-fun m!552015 () Bool)

(assert (=> b!572942 m!552015))

(push 1)

