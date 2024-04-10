; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50670 () Bool)

(assert start!50670)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!553973 () Bool)

(declare-fun e!319488 () Bool)

(declare-datatypes ((array!34895 0))(
  ( (array!34896 (arr!16757 (Array (_ BitVec 32) (_ BitVec 64))) (size!17121 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34895)

(declare-datatypes ((SeekEntryResult!5206 0))(
  ( (MissingZero!5206 (index!23051 (_ BitVec 32))) (Found!5206 (index!23052 (_ BitVec 32))) (Intermediate!5206 (undefined!6018 Bool) (index!23053 (_ BitVec 32)) (x!51968 (_ BitVec 32))) (Undefined!5206) (MissingVacant!5206 (index!23054 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34895 (_ BitVec 32)) SeekEntryResult!5206)

(assert (=> b!553973 (= e!319488 (= (seekEntryOrOpen!0 (select (arr!16757 a!3118) j!142) a!3118 mask!3119) (Found!5206 j!142)))))

(declare-fun b!553974 () Bool)

(declare-fun res!346392 () Bool)

(declare-fun e!319486 () Bool)

(assert (=> b!553974 (=> (not res!346392) (not e!319486))))

(declare-datatypes ((List!10837 0))(
  ( (Nil!10834) (Cons!10833 (h!11818 (_ BitVec 64)) (t!17065 List!10837)) )
))
(declare-fun arrayNoDuplicates!0 (array!34895 (_ BitVec 32) List!10837) Bool)

(assert (=> b!553974 (= res!346392 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10834))))

(declare-fun lt!251647 () SeekEntryResult!5206)

(declare-fun e!319484 () Bool)

(declare-fun b!553975 () Bool)

(assert (=> b!553975 (= e!319484 (not (or (not (is-Intermediate!5206 lt!251647)) (undefined!6018 lt!251647) (not (= (select (arr!16757 a!3118) (index!23053 lt!251647)) (select (arr!16757 a!3118) j!142))) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(assert (=> b!553975 e!319488))

(declare-fun res!346387 () Bool)

(assert (=> b!553975 (=> (not res!346387) (not e!319488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34895 (_ BitVec 32)) Bool)

(assert (=> b!553975 (= res!346387 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17186 0))(
  ( (Unit!17187) )
))
(declare-fun lt!251645 () Unit!17186)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34895 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17186)

(assert (=> b!553975 (= lt!251645 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553976 () Bool)

(declare-fun e!319485 () Bool)

(assert (=> b!553976 (= e!319485 e!319486)))

(declare-fun res!346386 () Bool)

(assert (=> b!553976 (=> (not res!346386) (not e!319486))))

(declare-fun lt!251646 () SeekEntryResult!5206)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!553976 (= res!346386 (or (= lt!251646 (MissingZero!5206 i!1132)) (= lt!251646 (MissingVacant!5206 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!553976 (= lt!251646 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!553977 () Bool)

(declare-fun res!346388 () Bool)

(assert (=> b!553977 (=> (not res!346388) (not e!319485))))

(declare-fun arrayContainsKey!0 (array!34895 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553977 (= res!346388 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553978 () Bool)

(declare-fun res!346393 () Bool)

(assert (=> b!553978 (=> (not res!346393) (not e!319485))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553978 (= res!346393 (validKeyInArray!0 (select (arr!16757 a!3118) j!142)))))

(declare-fun b!553979 () Bool)

(declare-fun res!346389 () Bool)

(assert (=> b!553979 (=> (not res!346389) (not e!319485))))

(assert (=> b!553979 (= res!346389 (validKeyInArray!0 k!1914))))

(declare-fun b!553980 () Bool)

(declare-fun res!346391 () Bool)

(assert (=> b!553980 (=> (not res!346391) (not e!319486))))

(assert (=> b!553980 (= res!346391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!346394 () Bool)

(assert (=> start!50670 (=> (not res!346394) (not e!319485))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50670 (= res!346394 (validMask!0 mask!3119))))

(assert (=> start!50670 e!319485))

(assert (=> start!50670 true))

(declare-fun array_inv!12553 (array!34895) Bool)

(assert (=> start!50670 (array_inv!12553 a!3118)))

(declare-fun b!553981 () Bool)

(assert (=> b!553981 (= e!319486 e!319484)))

(declare-fun res!346385 () Bool)

(assert (=> b!553981 (=> (not res!346385) (not e!319484))))

(declare-fun lt!251643 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34895 (_ BitVec 32)) SeekEntryResult!5206)

(assert (=> b!553981 (= res!346385 (= lt!251647 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251643 (select (store (arr!16757 a!3118) i!1132 k!1914) j!142) (array!34896 (store (arr!16757 a!3118) i!1132 k!1914) (size!17121 a!3118)) mask!3119)))))

(declare-fun lt!251644 () (_ BitVec 32))

(assert (=> b!553981 (= lt!251647 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251644 (select (arr!16757 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553981 (= lt!251643 (toIndex!0 (select (store (arr!16757 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!553981 (= lt!251644 (toIndex!0 (select (arr!16757 a!3118) j!142) mask!3119))))

(declare-fun b!553982 () Bool)

(declare-fun res!346390 () Bool)

(assert (=> b!553982 (=> (not res!346390) (not e!319485))))

(assert (=> b!553982 (= res!346390 (and (= (size!17121 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17121 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17121 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50670 res!346394) b!553982))

(assert (= (and b!553982 res!346390) b!553978))

(assert (= (and b!553978 res!346393) b!553979))

(assert (= (and b!553979 res!346389) b!553977))

(assert (= (and b!553977 res!346388) b!553976))

(assert (= (and b!553976 res!346386) b!553980))

(assert (= (and b!553980 res!346391) b!553974))

(assert (= (and b!553974 res!346392) b!553981))

(assert (= (and b!553981 res!346385) b!553975))

(assert (= (and b!553975 res!346387) b!553973))

(declare-fun m!531169 () Bool)

(assert (=> b!553976 m!531169))

(declare-fun m!531171 () Bool)

(assert (=> b!553978 m!531171))

(assert (=> b!553978 m!531171))

(declare-fun m!531173 () Bool)

(assert (=> b!553978 m!531173))

(declare-fun m!531175 () Bool)

(assert (=> b!553980 m!531175))

(assert (=> b!553981 m!531171))

(declare-fun m!531177 () Bool)

(assert (=> b!553981 m!531177))

(assert (=> b!553981 m!531171))

(declare-fun m!531179 () Bool)

(assert (=> b!553981 m!531179))

(assert (=> b!553981 m!531171))

(declare-fun m!531181 () Bool)

(assert (=> b!553981 m!531181))

(declare-fun m!531183 () Bool)

(assert (=> b!553981 m!531183))

(assert (=> b!553981 m!531181))

(declare-fun m!531185 () Bool)

(assert (=> b!553981 m!531185))

(assert (=> b!553981 m!531181))

(declare-fun m!531187 () Bool)

(assert (=> b!553981 m!531187))

(declare-fun m!531189 () Bool)

(assert (=> b!553979 m!531189))

(declare-fun m!531191 () Bool)

(assert (=> b!553977 m!531191))

(declare-fun m!531193 () Bool)

(assert (=> b!553974 m!531193))

(assert (=> b!553973 m!531171))

(assert (=> b!553973 m!531171))

(declare-fun m!531195 () Bool)

(assert (=> b!553973 m!531195))

(declare-fun m!531197 () Bool)

(assert (=> start!50670 m!531197))

(declare-fun m!531199 () Bool)

(assert (=> start!50670 m!531199))

(declare-fun m!531201 () Bool)

(assert (=> b!553975 m!531201))

(assert (=> b!553975 m!531171))

(declare-fun m!531203 () Bool)

(assert (=> b!553975 m!531203))

(declare-fun m!531205 () Bool)

(assert (=> b!553975 m!531205))

(push 1)

