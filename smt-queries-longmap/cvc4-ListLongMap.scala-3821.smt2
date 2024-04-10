; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52416 () Bool)

(assert start!52416)

(declare-fun b!572075 () Bool)

(declare-fun res!361588 () Bool)

(declare-fun e!329051 () Bool)

(assert (=> b!572075 (=> (not res!361588) (not e!329051))))

(declare-datatypes ((array!35813 0))(
  ( (array!35814 (arr!17195 (Array (_ BitVec 32) (_ BitVec 64))) (size!17559 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35813)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35813 (_ BitVec 32)) Bool)

(assert (=> b!572075 (= res!361588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!361583 () Bool)

(declare-fun e!329054 () Bool)

(assert (=> start!52416 (=> (not res!361583) (not e!329054))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52416 (= res!361583 (validMask!0 mask!3119))))

(assert (=> start!52416 e!329054))

(assert (=> start!52416 true))

(declare-fun array_inv!12991 (array!35813) Bool)

(assert (=> start!52416 (array_inv!12991 a!3118)))

(declare-fun b!572076 () Bool)

(declare-fun res!361595 () Bool)

(assert (=> b!572076 (=> (not res!361595) (not e!329051))))

(declare-datatypes ((List!11275 0))(
  ( (Nil!11272) (Cons!11271 (h!12298 (_ BitVec 64)) (t!17503 List!11275)) )
))
(declare-fun arrayNoDuplicates!0 (array!35813 (_ BitVec 32) List!11275) Bool)

(assert (=> b!572076 (= res!361595 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11272))))

(declare-fun b!572077 () Bool)

(declare-fun res!361594 () Bool)

(assert (=> b!572077 (=> (not res!361594) (not e!329054))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572077 (= res!361594 (validKeyInArray!0 (select (arr!17195 a!3118) j!142)))))

(declare-fun b!572078 () Bool)

(assert (=> b!572078 (= e!329054 e!329051)))

(declare-fun res!361585 () Bool)

(assert (=> b!572078 (=> (not res!361585) (not e!329051))))

(declare-datatypes ((SeekEntryResult!5644 0))(
  ( (MissingZero!5644 (index!24803 (_ BitVec 32))) (Found!5644 (index!24804 (_ BitVec 32))) (Intermediate!5644 (undefined!6456 Bool) (index!24805 (_ BitVec 32)) (x!53673 (_ BitVec 32))) (Undefined!5644) (MissingVacant!5644 (index!24806 (_ BitVec 32))) )
))
(declare-fun lt!260987 () SeekEntryResult!5644)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572078 (= res!361585 (or (= lt!260987 (MissingZero!5644 i!1132)) (= lt!260987 (MissingVacant!5644 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35813 (_ BitVec 32)) SeekEntryResult!5644)

(assert (=> b!572078 (= lt!260987 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun lt!260992 () array!35813)

(declare-fun lt!260988 () (_ BitVec 64))

(declare-fun b!572079 () Bool)

(declare-fun lt!260986 () SeekEntryResult!5644)

(declare-fun e!329057 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35813 (_ BitVec 32)) SeekEntryResult!5644)

(assert (=> b!572079 (= e!329057 (= (seekEntryOrOpen!0 lt!260988 lt!260992 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53673 lt!260986) (index!24805 lt!260986) (index!24805 lt!260986) lt!260988 lt!260992 mask!3119)))))

(declare-fun b!572080 () Bool)

(declare-fun res!361584 () Bool)

(assert (=> b!572080 (=> (not res!361584) (not e!329054))))

(assert (=> b!572080 (= res!361584 (and (= (size!17559 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17559 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17559 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572081 () Bool)

(declare-fun e!329055 () Bool)

(assert (=> b!572081 (= e!329055 e!329057)))

(declare-fun res!361590 () Bool)

(assert (=> b!572081 (=> (not res!361590) (not e!329057))))

(declare-fun lt!260989 () SeekEntryResult!5644)

(assert (=> b!572081 (= res!361590 (= lt!260989 (seekKeyOrZeroReturnVacant!0 (x!53673 lt!260986) (index!24805 lt!260986) (index!24805 lt!260986) (select (arr!17195 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572082 () Bool)

(declare-fun res!361592 () Bool)

(assert (=> b!572082 (=> (not res!361592) (not e!329054))))

(declare-fun arrayContainsKey!0 (array!35813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572082 (= res!361592 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572083 () Bool)

(declare-fun res!361587 () Bool)

(assert (=> b!572083 (=> (not res!361587) (not e!329054))))

(assert (=> b!572083 (= res!361587 (validKeyInArray!0 k!1914))))

(declare-fun b!572084 () Bool)

(declare-fun e!329058 () Bool)

(assert (=> b!572084 (= e!329058 e!329055)))

(declare-fun res!361591 () Bool)

(assert (=> b!572084 (=> res!361591 e!329055)))

(declare-fun lt!260985 () (_ BitVec 64))

(assert (=> b!572084 (= res!361591 (or (= lt!260985 (select (arr!17195 a!3118) j!142)) (= lt!260985 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!572084 (= lt!260985 (select (arr!17195 a!3118) (index!24805 lt!260986)))))

(declare-fun b!572085 () Bool)

(declare-fun e!329052 () Bool)

(assert (=> b!572085 (= e!329051 e!329052)))

(declare-fun res!361589 () Bool)

(assert (=> b!572085 (=> (not res!361589) (not e!329052))))

(declare-fun lt!260990 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35813 (_ BitVec 32)) SeekEntryResult!5644)

(assert (=> b!572085 (= res!361589 (= lt!260986 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260990 lt!260988 lt!260992 mask!3119)))))

(declare-fun lt!260984 () (_ BitVec 32))

(assert (=> b!572085 (= lt!260986 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260984 (select (arr!17195 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572085 (= lt!260990 (toIndex!0 lt!260988 mask!3119))))

(assert (=> b!572085 (= lt!260988 (select (store (arr!17195 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!572085 (= lt!260984 (toIndex!0 (select (arr!17195 a!3118) j!142) mask!3119))))

(assert (=> b!572085 (= lt!260992 (array!35814 (store (arr!17195 a!3118) i!1132 k!1914) (size!17559 a!3118)))))

(declare-fun b!572086 () Bool)

(assert (=> b!572086 (= e!329052 (not true))))

(declare-fun e!329053 () Bool)

(assert (=> b!572086 e!329053))

(declare-fun res!361593 () Bool)

(assert (=> b!572086 (=> (not res!361593) (not e!329053))))

(assert (=> b!572086 (= res!361593 (= lt!260989 (Found!5644 j!142)))))

(assert (=> b!572086 (= lt!260989 (seekEntryOrOpen!0 (select (arr!17195 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!572086 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17990 0))(
  ( (Unit!17991) )
))
(declare-fun lt!260991 () Unit!17990)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35813 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17990)

(assert (=> b!572086 (= lt!260991 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!572087 () Bool)

(assert (=> b!572087 (= e!329053 e!329058)))

(declare-fun res!361586 () Bool)

(assert (=> b!572087 (=> res!361586 e!329058)))

(assert (=> b!572087 (= res!361586 (or (undefined!6456 lt!260986) (not (is-Intermediate!5644 lt!260986))))))

(assert (= (and start!52416 res!361583) b!572080))

(assert (= (and b!572080 res!361584) b!572077))

(assert (= (and b!572077 res!361594) b!572083))

(assert (= (and b!572083 res!361587) b!572082))

(assert (= (and b!572082 res!361592) b!572078))

(assert (= (and b!572078 res!361585) b!572075))

(assert (= (and b!572075 res!361588) b!572076))

(assert (= (and b!572076 res!361595) b!572085))

(assert (= (and b!572085 res!361589) b!572086))

(assert (= (and b!572086 res!361593) b!572087))

(assert (= (and b!572087 (not res!361586)) b!572084))

(assert (= (and b!572084 (not res!361591)) b!572081))

(assert (= (and b!572081 res!361590) b!572079))

(declare-fun m!551005 () Bool)

(assert (=> b!572075 m!551005))

(declare-fun m!551007 () Bool)

(assert (=> b!572085 m!551007))

(declare-fun m!551009 () Bool)

(assert (=> b!572085 m!551009))

(assert (=> b!572085 m!551007))

(declare-fun m!551011 () Bool)

(assert (=> b!572085 m!551011))

(assert (=> b!572085 m!551007))

(declare-fun m!551013 () Bool)

(assert (=> b!572085 m!551013))

(declare-fun m!551015 () Bool)

(assert (=> b!572085 m!551015))

(declare-fun m!551017 () Bool)

(assert (=> b!572085 m!551017))

(declare-fun m!551019 () Bool)

(assert (=> b!572085 m!551019))

(declare-fun m!551021 () Bool)

(assert (=> b!572082 m!551021))

(declare-fun m!551023 () Bool)

(assert (=> start!52416 m!551023))

(declare-fun m!551025 () Bool)

(assert (=> start!52416 m!551025))

(declare-fun m!551027 () Bool)

(assert (=> b!572083 m!551027))

(assert (=> b!572084 m!551007))

(declare-fun m!551029 () Bool)

(assert (=> b!572084 m!551029))

(declare-fun m!551031 () Bool)

(assert (=> b!572076 m!551031))

(declare-fun m!551033 () Bool)

(assert (=> b!572078 m!551033))

(declare-fun m!551035 () Bool)

(assert (=> b!572079 m!551035))

(declare-fun m!551037 () Bool)

(assert (=> b!572079 m!551037))

(assert (=> b!572081 m!551007))

(assert (=> b!572081 m!551007))

(declare-fun m!551039 () Bool)

(assert (=> b!572081 m!551039))

(assert (=> b!572086 m!551007))

(assert (=> b!572086 m!551007))

(declare-fun m!551041 () Bool)

(assert (=> b!572086 m!551041))

(declare-fun m!551043 () Bool)

(assert (=> b!572086 m!551043))

(declare-fun m!551045 () Bool)

(assert (=> b!572086 m!551045))

(assert (=> b!572077 m!551007))

(assert (=> b!572077 m!551007))

(declare-fun m!551047 () Bool)

(assert (=> b!572077 m!551047))

(push 1)

