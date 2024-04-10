; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52140 () Bool)

(assert start!52140)

(declare-fun b!569050 () Bool)

(declare-fun res!359075 () Bool)

(declare-fun e!327407 () Bool)

(assert (=> b!569050 (=> (not res!359075) (not e!327407))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569050 (= res!359075 (validKeyInArray!0 k!1914))))

(declare-fun b!569051 () Bool)

(declare-fun res!359067 () Bool)

(declare-fun e!327408 () Bool)

(assert (=> b!569051 (=> (not res!359067) (not e!327408))))

(declare-datatypes ((array!35663 0))(
  ( (array!35664 (arr!17123 (Array (_ BitVec 32) (_ BitVec 64))) (size!17487 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35663)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35663 (_ BitVec 32)) Bool)

(assert (=> b!569051 (= res!359067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!569052 () Bool)

(declare-fun e!327405 () Bool)

(assert (=> b!569052 (= e!327405 (not true))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5572 0))(
  ( (MissingZero!5572 (index!24515 (_ BitVec 32))) (Found!5572 (index!24516 (_ BitVec 32))) (Intermediate!5572 (undefined!6384 Bool) (index!24517 (_ BitVec 32)) (x!53391 (_ BitVec 32))) (Undefined!5572) (MissingVacant!5572 (index!24518 (_ BitVec 32))) )
))
(declare-fun lt!259283 () SeekEntryResult!5572)

(declare-fun lt!259288 () SeekEntryResult!5572)

(assert (=> b!569052 (and (= lt!259288 (Found!5572 j!142)) (or (undefined!6384 lt!259283) (not (is-Intermediate!5572 lt!259283)) (= (select (arr!17123 a!3118) (index!24517 lt!259283)) (select (arr!17123 a!3118) j!142)) (not (= (select (arr!17123 a!3118) (index!24517 lt!259283)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259288 (MissingZero!5572 (index!24517 lt!259283)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35663 (_ BitVec 32)) SeekEntryResult!5572)

(assert (=> b!569052 (= lt!259288 (seekEntryOrOpen!0 (select (arr!17123 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!569052 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17846 0))(
  ( (Unit!17847) )
))
(declare-fun lt!259285 () Unit!17846)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35663 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17846)

(assert (=> b!569052 (= lt!259285 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569053 () Bool)

(declare-fun res!359070 () Bool)

(assert (=> b!569053 (=> (not res!359070) (not e!327407))))

(assert (=> b!569053 (= res!359070 (validKeyInArray!0 (select (arr!17123 a!3118) j!142)))))

(declare-fun b!569054 () Bool)

(assert (=> b!569054 (= e!327408 e!327405)))

(declare-fun res!359068 () Bool)

(assert (=> b!569054 (=> (not res!359068) (not e!327405))))

(declare-fun lt!259284 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35663 (_ BitVec 32)) SeekEntryResult!5572)

(assert (=> b!569054 (= res!359068 (= lt!259283 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259284 (select (store (arr!17123 a!3118) i!1132 k!1914) j!142) (array!35664 (store (arr!17123 a!3118) i!1132 k!1914) (size!17487 a!3118)) mask!3119)))))

(declare-fun lt!259286 () (_ BitVec 32))

(assert (=> b!569054 (= lt!259283 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259286 (select (arr!17123 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569054 (= lt!259284 (toIndex!0 (select (store (arr!17123 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!569054 (= lt!259286 (toIndex!0 (select (arr!17123 a!3118) j!142) mask!3119))))

(declare-fun b!569055 () Bool)

(declare-fun res!359073 () Bool)

(assert (=> b!569055 (=> (not res!359073) (not e!327407))))

(declare-fun arrayContainsKey!0 (array!35663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569055 (= res!359073 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!569049 () Bool)

(declare-fun res!359072 () Bool)

(assert (=> b!569049 (=> (not res!359072) (not e!327407))))

(assert (=> b!569049 (= res!359072 (and (= (size!17487 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17487 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17487 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!359069 () Bool)

(assert (=> start!52140 (=> (not res!359069) (not e!327407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52140 (= res!359069 (validMask!0 mask!3119))))

(assert (=> start!52140 e!327407))

(assert (=> start!52140 true))

(declare-fun array_inv!12919 (array!35663) Bool)

(assert (=> start!52140 (array_inv!12919 a!3118)))

(declare-fun b!569056 () Bool)

(assert (=> b!569056 (= e!327407 e!327408)))

(declare-fun res!359074 () Bool)

(assert (=> b!569056 (=> (not res!359074) (not e!327408))))

(declare-fun lt!259287 () SeekEntryResult!5572)

(assert (=> b!569056 (= res!359074 (or (= lt!259287 (MissingZero!5572 i!1132)) (= lt!259287 (MissingVacant!5572 i!1132))))))

(assert (=> b!569056 (= lt!259287 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!569057 () Bool)

(declare-fun res!359071 () Bool)

(assert (=> b!569057 (=> (not res!359071) (not e!327408))))

(declare-datatypes ((List!11203 0))(
  ( (Nil!11200) (Cons!11199 (h!12220 (_ BitVec 64)) (t!17431 List!11203)) )
))
(declare-fun arrayNoDuplicates!0 (array!35663 (_ BitVec 32) List!11203) Bool)

(assert (=> b!569057 (= res!359071 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11200))))

(assert (= (and start!52140 res!359069) b!569049))

(assert (= (and b!569049 res!359072) b!569053))

(assert (= (and b!569053 res!359070) b!569050))

(assert (= (and b!569050 res!359075) b!569055))

(assert (= (and b!569055 res!359073) b!569056))

(assert (= (and b!569056 res!359074) b!569051))

(assert (= (and b!569051 res!359067) b!569057))

(assert (= (and b!569057 res!359071) b!569054))

(assert (= (and b!569054 res!359068) b!569052))

(declare-fun m!547621 () Bool)

(assert (=> b!569056 m!547621))

(declare-fun m!547623 () Bool)

(assert (=> b!569057 m!547623))

(declare-fun m!547625 () Bool)

(assert (=> b!569052 m!547625))

(declare-fun m!547627 () Bool)

(assert (=> b!569052 m!547627))

(declare-fun m!547629 () Bool)

(assert (=> b!569052 m!547629))

(declare-fun m!547631 () Bool)

(assert (=> b!569052 m!547631))

(assert (=> b!569052 m!547627))

(declare-fun m!547633 () Bool)

(assert (=> b!569052 m!547633))

(declare-fun m!547635 () Bool)

(assert (=> b!569055 m!547635))

(declare-fun m!547637 () Bool)

(assert (=> b!569051 m!547637))

(assert (=> b!569054 m!547627))

(declare-fun m!547639 () Bool)

(assert (=> b!569054 m!547639))

(assert (=> b!569054 m!547627))

(declare-fun m!547641 () Bool)

(assert (=> b!569054 m!547641))

(assert (=> b!569054 m!547627))

(declare-fun m!547643 () Bool)

(assert (=> b!569054 m!547643))

(assert (=> b!569054 m!547643))

(declare-fun m!547645 () Bool)

(assert (=> b!569054 m!547645))

(declare-fun m!547647 () Bool)

(assert (=> b!569054 m!547647))

(assert (=> b!569054 m!547643))

(declare-fun m!547649 () Bool)

(assert (=> b!569054 m!547649))

(declare-fun m!547651 () Bool)

(assert (=> b!569050 m!547651))

(declare-fun m!547653 () Bool)

(assert (=> start!52140 m!547653))

(declare-fun m!547655 () Bool)

(assert (=> start!52140 m!547655))

(assert (=> b!569053 m!547627))

(assert (=> b!569053 m!547627))

(declare-fun m!547657 () Bool)

(assert (=> b!569053 m!547657))

(push 1)

