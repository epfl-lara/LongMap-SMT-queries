; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52148 () Bool)

(assert start!52148)

(declare-fun b!569157 () Bool)

(declare-fun e!327455 () Bool)

(declare-fun e!327454 () Bool)

(assert (=> b!569157 (= e!327455 e!327454)))

(declare-fun res!359175 () Bool)

(assert (=> b!569157 (=> (not res!359175) (not e!327454))))

(declare-datatypes ((SeekEntryResult!5576 0))(
  ( (MissingZero!5576 (index!24531 (_ BitVec 32))) (Found!5576 (index!24532 (_ BitVec 32))) (Intermediate!5576 (undefined!6388 Bool) (index!24533 (_ BitVec 32)) (x!53411 (_ BitVec 32))) (Undefined!5576) (MissingVacant!5576 (index!24534 (_ BitVec 32))) )
))
(declare-fun lt!259355 () SeekEntryResult!5576)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!259357 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35671 0))(
  ( (array!35672 (arr!17127 (Array (_ BitVec 32) (_ BitVec 64))) (size!17491 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35671)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35671 (_ BitVec 32)) SeekEntryResult!5576)

(assert (=> b!569157 (= res!359175 (= lt!259355 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259357 (select (store (arr!17127 a!3118) i!1132 k!1914) j!142) (array!35672 (store (arr!17127 a!3118) i!1132 k!1914) (size!17491 a!3118)) mask!3119)))))

(declare-fun lt!259356 () (_ BitVec 32))

(assert (=> b!569157 (= lt!259355 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259356 (select (arr!17127 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!569157 (= lt!259357 (toIndex!0 (select (store (arr!17127 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!569157 (= lt!259356 (toIndex!0 (select (arr!17127 a!3118) j!142) mask!3119))))

(declare-fun b!569158 () Bool)

(declare-fun res!359177 () Bool)

(declare-fun e!327453 () Bool)

(assert (=> b!569158 (=> (not res!359177) (not e!327453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!569158 (= res!359177 (validKeyInArray!0 (select (arr!17127 a!3118) j!142)))))

(declare-fun b!569160 () Bool)

(declare-fun res!359178 () Bool)

(assert (=> b!569160 (=> (not res!359178) (not e!327455))))

(declare-datatypes ((List!11207 0))(
  ( (Nil!11204) (Cons!11203 (h!12224 (_ BitVec 64)) (t!17435 List!11207)) )
))
(declare-fun arrayNoDuplicates!0 (array!35671 (_ BitVec 32) List!11207) Bool)

(assert (=> b!569160 (= res!359178 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11204))))

(declare-fun b!569161 () Bool)

(declare-fun res!359183 () Bool)

(assert (=> b!569161 (=> (not res!359183) (not e!327453))))

(assert (=> b!569161 (= res!359183 (validKeyInArray!0 k!1914))))

(declare-fun b!569162 () Bool)

(assert (=> b!569162 (= e!327453 e!327455)))

(declare-fun res!359179 () Bool)

(assert (=> b!569162 (=> (not res!359179) (not e!327455))))

(declare-fun lt!259360 () SeekEntryResult!5576)

(assert (=> b!569162 (= res!359179 (or (= lt!259360 (MissingZero!5576 i!1132)) (= lt!259360 (MissingVacant!5576 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35671 (_ BitVec 32)) SeekEntryResult!5576)

(assert (=> b!569162 (= lt!259360 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!569163 () Bool)

(declare-fun res!359180 () Bool)

(assert (=> b!569163 (=> (not res!359180) (not e!327453))))

(declare-fun arrayContainsKey!0 (array!35671 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!569163 (= res!359180 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!359182 () Bool)

(assert (=> start!52148 (=> (not res!359182) (not e!327453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52148 (= res!359182 (validMask!0 mask!3119))))

(assert (=> start!52148 e!327453))

(assert (=> start!52148 true))

(declare-fun array_inv!12923 (array!35671) Bool)

(assert (=> start!52148 (array_inv!12923 a!3118)))

(declare-fun b!569159 () Bool)

(declare-fun res!359181 () Bool)

(assert (=> b!569159 (=> (not res!359181) (not e!327453))))

(assert (=> b!569159 (= res!359181 (and (= (size!17491 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17491 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17491 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!569164 () Bool)

(assert (=> b!569164 (= e!327454 (not (or (undefined!6388 lt!259355) (not (is-Intermediate!5576 lt!259355)) (= (select (arr!17127 a!3118) (index!24533 lt!259355)) (select (arr!17127 a!3118) j!142)) (not (= (select (arr!17127 a!3118) (index!24533 lt!259355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsgt #b00000000000000000000000000000000 (size!17491 a!3118)) (bvsle j!142 (size!17491 a!3118)))))))

(declare-fun lt!259358 () SeekEntryResult!5576)

(assert (=> b!569164 (and (= lt!259358 (Found!5576 j!142)) (or (undefined!6388 lt!259355) (not (is-Intermediate!5576 lt!259355)) (= (select (arr!17127 a!3118) (index!24533 lt!259355)) (select (arr!17127 a!3118) j!142)) (not (= (select (arr!17127 a!3118) (index!24533 lt!259355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259358 (MissingZero!5576 (index!24533 lt!259355)))))))

(assert (=> b!569164 (= lt!259358 (seekEntryOrOpen!0 (select (arr!17127 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35671 (_ BitVec 32)) Bool)

(assert (=> b!569164 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17854 0))(
  ( (Unit!17855) )
))
(declare-fun lt!259359 () Unit!17854)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35671 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17854)

(assert (=> b!569164 (= lt!259359 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!569165 () Bool)

(declare-fun res!359176 () Bool)

(assert (=> b!569165 (=> (not res!359176) (not e!327455))))

(assert (=> b!569165 (= res!359176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!52148 res!359182) b!569159))

(assert (= (and b!569159 res!359181) b!569158))

(assert (= (and b!569158 res!359177) b!569161))

(assert (= (and b!569161 res!359183) b!569163))

(assert (= (and b!569163 res!359180) b!569162))

(assert (= (and b!569162 res!359179) b!569165))

(assert (= (and b!569165 res!359176) b!569160))

(assert (= (and b!569160 res!359178) b!569157))

(assert (= (and b!569157 res!359175) b!569164))

(declare-fun m!547773 () Bool)

(assert (=> start!52148 m!547773))

(declare-fun m!547775 () Bool)

(assert (=> start!52148 m!547775))

(declare-fun m!547777 () Bool)

(assert (=> b!569161 m!547777))

(declare-fun m!547779 () Bool)

(assert (=> b!569164 m!547779))

(declare-fun m!547781 () Bool)

(assert (=> b!569164 m!547781))

(declare-fun m!547783 () Bool)

(assert (=> b!569164 m!547783))

(declare-fun m!547785 () Bool)

(assert (=> b!569164 m!547785))

(assert (=> b!569164 m!547779))

(declare-fun m!547787 () Bool)

(assert (=> b!569164 m!547787))

(assert (=> b!569157 m!547779))

(declare-fun m!547789 () Bool)

(assert (=> b!569157 m!547789))

(assert (=> b!569157 m!547779))

(assert (=> b!569157 m!547779))

(declare-fun m!547791 () Bool)

(assert (=> b!569157 m!547791))

(declare-fun m!547793 () Bool)

(assert (=> b!569157 m!547793))

(declare-fun m!547795 () Bool)

(assert (=> b!569157 m!547795))

(assert (=> b!569157 m!547793))

(declare-fun m!547797 () Bool)

(assert (=> b!569157 m!547797))

(assert (=> b!569157 m!547793))

(declare-fun m!547799 () Bool)

(assert (=> b!569157 m!547799))

(declare-fun m!547801 () Bool)

(assert (=> b!569165 m!547801))

(declare-fun m!547803 () Bool)

(assert (=> b!569163 m!547803))

(declare-fun m!547805 () Bool)

(assert (=> b!569160 m!547805))

(assert (=> b!569158 m!547779))

(assert (=> b!569158 m!547779))

(declare-fun m!547807 () Bool)

(assert (=> b!569158 m!547807))

(declare-fun m!547809 () Bool)

(assert (=> b!569162 m!547809))

(push 1)

