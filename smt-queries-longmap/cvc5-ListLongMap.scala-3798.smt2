; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52142 () Bool)

(assert start!52142)

(declare-fun res!359095 () Bool)

(declare-fun e!327419 () Bool)

(assert (=> start!52142 (=> (not res!359095) (not e!327419))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52142 (= res!359095 (validMask!0 mask!3119))))

(assert (=> start!52142 e!327419))

(assert (=> start!52142 true))

(declare-datatypes ((array!35665 0))(
  ( (array!35666 (arr!17124 (Array (_ BitVec 32) (_ BitVec 64))) (size!17488 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35665)

(declare-fun array_inv!12920 (array!35665) Bool)

(assert (=> start!52142 (array_inv!12920 a!3118)))

(declare-fun b!569076 () Bool)

(declare-fun res!359100 () Bool)

(assert (=> b!569076 (=> (not res!359100) (not e!327419))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569076 (= res!359100 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569077 () Bool)

(declare-fun res!359099 () Bool)

(assert (=> b!569077 (=> (not res!359099) (not e!327419))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569077 (= res!359099 (validKeyInArray!0 (select (arr!17124 a!3118) j!142)))))

(declare-fun b!569078 () Bool)

(declare-fun res!359098 () Bool)

(declare-fun e!327420 () Bool)

(assert (=> b!569078 (=> (not res!359098) (not e!327420))))

(declare-datatypes ((List!11204 0))(
  ( (Nil!11201) (Cons!11200 (h!12221 (_ BitVec 64)) (t!17432 List!11204)) )
))
(declare-fun arrayNoDuplicates!0 (array!35665 (_ BitVec 32) List!11204) Bool)

(assert (=> b!569078 (= res!359098 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11201))))

(declare-datatypes ((SeekEntryResult!5573 0))(
  ( (MissingZero!5573 (index!24519 (_ BitVec 32))) (Found!5573 (index!24520 (_ BitVec 32))) (Intermediate!5573 (undefined!6385 Bool) (index!24521 (_ BitVec 32)) (x!53400 (_ BitVec 32))) (Undefined!5573) (MissingVacant!5573 (index!24522 (_ BitVec 32))) )
))
(declare-fun lt!259302 () SeekEntryResult!5573)

(declare-fun e!327418 () Bool)

(declare-fun b!569079 () Bool)

(assert (=> b!569079 (= e!327418 (not (or (undefined!6385 lt!259302) (not (is-Intermediate!5573 lt!259302)) (= (select (arr!17124 a!3118) (index!24521 lt!259302)) (select (arr!17124 a!3118) j!142)) (not (= (select (arr!17124 a!3118) (index!24521 lt!259302)) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!17488 a!3118)))))))

(declare-fun lt!259305 () SeekEntryResult!5573)

(assert (=> b!569079 (and (= lt!259305 (Found!5573 j!142)) (or (undefined!6385 lt!259302) (not (is-Intermediate!5573 lt!259302)) (= (select (arr!17124 a!3118) (index!24521 lt!259302)) (select (arr!17124 a!3118) j!142)) (not (= (select (arr!17124 a!3118) (index!24521 lt!259302)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259305 (MissingZero!5573 (index!24521 lt!259302)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35665 (_ BitVec 32)) SeekEntryResult!5573)

(assert (=> b!569079 (= lt!259305 (seekEntryOrOpen!0 (select (arr!17124 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35665 (_ BitVec 32)) Bool)

(assert (=> b!569079 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17848 0))(
  ( (Unit!17849) )
))
(declare-fun lt!259301 () Unit!17848)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35665 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17848)

(assert (=> b!569079 (= lt!259301 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569080 () Bool)

(assert (=> b!569080 (= e!327419 e!327420)))

(declare-fun res!359094 () Bool)

(assert (=> b!569080 (=> (not res!359094) (not e!327420))))

(declare-fun lt!259304 () SeekEntryResult!5573)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!569080 (= res!359094 (or (= lt!259304 (MissingZero!5573 i!1132)) (= lt!259304 (MissingVacant!5573 i!1132))))))

(assert (=> b!569080 (= lt!259304 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!569081 () Bool)

(declare-fun res!359096 () Bool)

(assert (=> b!569081 (=> (not res!359096) (not e!327419))))

(assert (=> b!569081 (= res!359096 (validKeyInArray!0 k!1914))))

(declare-fun b!569082 () Bool)

(assert (=> b!569082 (= e!327420 e!327418)))

(declare-fun res!359102 () Bool)

(assert (=> b!569082 (=> (not res!359102) (not e!327418))))

(declare-fun lt!259306 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35665 (_ BitVec 32)) SeekEntryResult!5573)

(assert (=> b!569082 (= res!359102 (= lt!259302 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259306 (select (store (arr!17124 a!3118) i!1132 k!1914) j!142) (array!35666 (store (arr!17124 a!3118) i!1132 k!1914) (size!17488 a!3118)) mask!3119)))))

(declare-fun lt!259303 () (_ BitVec 32))

(assert (=> b!569082 (= lt!259302 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259303 (select (arr!17124 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569082 (= lt!259306 (toIndex!0 (select (store (arr!17124 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!569082 (= lt!259303 (toIndex!0 (select (arr!17124 a!3118) j!142) mask!3119))))

(declare-fun b!569083 () Bool)

(declare-fun res!359097 () Bool)

(assert (=> b!569083 (=> (not res!359097) (not e!327419))))

(assert (=> b!569083 (= res!359097 (and (= (size!17488 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17488 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17488 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569084 () Bool)

(declare-fun res!359101 () Bool)

(assert (=> b!569084 (=> (not res!359101) (not e!327420))))

(assert (=> b!569084 (= res!359101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!52142 res!359095) b!569083))

(assert (= (and b!569083 res!359097) b!569077))

(assert (= (and b!569077 res!359099) b!569081))

(assert (= (and b!569081 res!359096) b!569076))

(assert (= (and b!569076 res!359100) b!569080))

(assert (= (and b!569080 res!359094) b!569084))

(assert (= (and b!569084 res!359101) b!569078))

(assert (= (and b!569078 res!359098) b!569082))

(assert (= (and b!569082 res!359102) b!569079))

(declare-fun m!547659 () Bool)

(assert (=> b!569076 m!547659))

(declare-fun m!547661 () Bool)

(assert (=> b!569079 m!547661))

(declare-fun m!547663 () Bool)

(assert (=> b!569079 m!547663))

(declare-fun m!547665 () Bool)

(assert (=> b!569079 m!547665))

(declare-fun m!547667 () Bool)

(assert (=> b!569079 m!547667))

(assert (=> b!569079 m!547663))

(declare-fun m!547669 () Bool)

(assert (=> b!569079 m!547669))

(declare-fun m!547671 () Bool)

(assert (=> b!569084 m!547671))

(declare-fun m!547673 () Bool)

(assert (=> b!569080 m!547673))

(declare-fun m!547675 () Bool)

(assert (=> b!569081 m!547675))

(assert (=> b!569077 m!547663))

(assert (=> b!569077 m!547663))

(declare-fun m!547677 () Bool)

(assert (=> b!569077 m!547677))

(assert (=> b!569082 m!547663))

(declare-fun m!547679 () Bool)

(assert (=> b!569082 m!547679))

(assert (=> b!569082 m!547663))

(declare-fun m!547681 () Bool)

(assert (=> b!569082 m!547681))

(assert (=> b!569082 m!547663))

(declare-fun m!547683 () Bool)

(assert (=> b!569082 m!547683))

(assert (=> b!569082 m!547683))

(declare-fun m!547685 () Bool)

(assert (=> b!569082 m!547685))

(declare-fun m!547687 () Bool)

(assert (=> b!569082 m!547687))

(assert (=> b!569082 m!547683))

(declare-fun m!547689 () Bool)

(assert (=> b!569082 m!547689))

(declare-fun m!547691 () Bool)

(assert (=> b!569078 m!547691))

(declare-fun m!547693 () Bool)

(assert (=> start!52142 m!547693))

(declare-fun m!547695 () Bool)

(assert (=> start!52142 m!547695))

(push 1)

