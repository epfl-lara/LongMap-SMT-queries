; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51596 () Bool)

(assert start!51596)

(declare-fun b!564610 () Bool)

(declare-fun res!355769 () Bool)

(declare-fun e!325183 () Bool)

(assert (=> b!564610 (=> (not res!355769) (not e!325183))))

(declare-datatypes ((array!35461 0))(
  ( (array!35462 (arr!17031 (Array (_ BitVec 32) (_ BitVec 64))) (size!17395 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35461)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564610 (= res!355769 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564611 () Bool)

(declare-fun e!325184 () Bool)

(assert (=> b!564611 (= e!325184 false)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5480 0))(
  ( (MissingZero!5480 (index!24147 (_ BitVec 32))) (Found!5480 (index!24148 (_ BitVec 32))) (Intermediate!5480 (undefined!6292 Bool) (index!24149 (_ BitVec 32)) (x!53023 (_ BitVec 32))) (Undefined!5480) (MissingVacant!5480 (index!24150 (_ BitVec 32))) )
))
(declare-fun lt!257610 () SeekEntryResult!5480)

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!257608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35461 (_ BitVec 32)) SeekEntryResult!5480)

(assert (=> b!564611 (= lt!257610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257608 (select (store (arr!17031 a!3118) i!1132 k!1914) j!142) (array!35462 (store (arr!17031 a!3118) i!1132 k!1914) (size!17395 a!3118)) mask!3119))))

(declare-fun lt!257611 () (_ BitVec 32))

(declare-fun lt!257607 () SeekEntryResult!5480)

(assert (=> b!564611 (= lt!257607 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257611 (select (arr!17031 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564611 (= lt!257608 (toIndex!0 (select (store (arr!17031 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!564611 (= lt!257611 (toIndex!0 (select (arr!17031 a!3118) j!142) mask!3119))))

(declare-fun b!564612 () Bool)

(declare-fun res!355762 () Bool)

(assert (=> b!564612 (=> (not res!355762) (not e!325183))))

(assert (=> b!564612 (= res!355762 (and (= (size!17395 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17395 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17395 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564613 () Bool)

(declare-fun res!355767 () Bool)

(assert (=> b!564613 (=> (not res!355767) (not e!325184))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35461 (_ BitVec 32)) Bool)

(assert (=> b!564613 (= res!355767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564614 () Bool)

(declare-fun res!355766 () Bool)

(assert (=> b!564614 (=> (not res!355766) (not e!325183))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564614 (= res!355766 (validKeyInArray!0 k!1914))))

(declare-fun res!355764 () Bool)

(assert (=> start!51596 (=> (not res!355764) (not e!325183))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51596 (= res!355764 (validMask!0 mask!3119))))

(assert (=> start!51596 e!325183))

(assert (=> start!51596 true))

(declare-fun array_inv!12827 (array!35461) Bool)

(assert (=> start!51596 (array_inv!12827 a!3118)))

(declare-fun b!564615 () Bool)

(declare-fun res!355765 () Bool)

(assert (=> b!564615 (=> (not res!355765) (not e!325184))))

(declare-datatypes ((List!11111 0))(
  ( (Nil!11108) (Cons!11107 (h!12110 (_ BitVec 64)) (t!17339 List!11111)) )
))
(declare-fun arrayNoDuplicates!0 (array!35461 (_ BitVec 32) List!11111) Bool)

(assert (=> b!564615 (= res!355765 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11108))))

(declare-fun b!564616 () Bool)

(assert (=> b!564616 (= e!325183 e!325184)))

(declare-fun res!355768 () Bool)

(assert (=> b!564616 (=> (not res!355768) (not e!325184))))

(declare-fun lt!257609 () SeekEntryResult!5480)

(assert (=> b!564616 (= res!355768 (or (= lt!257609 (MissingZero!5480 i!1132)) (= lt!257609 (MissingVacant!5480 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35461 (_ BitVec 32)) SeekEntryResult!5480)

(assert (=> b!564616 (= lt!257609 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!564617 () Bool)

(declare-fun res!355763 () Bool)

(assert (=> b!564617 (=> (not res!355763) (not e!325183))))

(assert (=> b!564617 (= res!355763 (validKeyInArray!0 (select (arr!17031 a!3118) j!142)))))

(assert (= (and start!51596 res!355764) b!564612))

(assert (= (and b!564612 res!355762) b!564617))

(assert (= (and b!564617 res!355763) b!564614))

(assert (= (and b!564614 res!355766) b!564610))

(assert (= (and b!564610 res!355769) b!564616))

(assert (= (and b!564616 res!355768) b!564613))

(assert (= (and b!564613 res!355767) b!564615))

(assert (= (and b!564615 res!355765) b!564611))

(declare-fun m!543051 () Bool)

(assert (=> b!564610 m!543051))

(declare-fun m!543053 () Bool)

(assert (=> b!564617 m!543053))

(assert (=> b!564617 m!543053))

(declare-fun m!543055 () Bool)

(assert (=> b!564617 m!543055))

(declare-fun m!543057 () Bool)

(assert (=> start!51596 m!543057))

(declare-fun m!543059 () Bool)

(assert (=> start!51596 m!543059))

(declare-fun m!543061 () Bool)

(assert (=> b!564615 m!543061))

(declare-fun m!543063 () Bool)

(assert (=> b!564613 m!543063))

(declare-fun m!543065 () Bool)

(assert (=> b!564614 m!543065))

(declare-fun m!543067 () Bool)

(assert (=> b!564616 m!543067))

(assert (=> b!564611 m!543053))

(declare-fun m!543069 () Bool)

(assert (=> b!564611 m!543069))

(assert (=> b!564611 m!543053))

(declare-fun m!543071 () Bool)

(assert (=> b!564611 m!543071))

(assert (=> b!564611 m!543071))

(declare-fun m!543073 () Bool)

(assert (=> b!564611 m!543073))

(declare-fun m!543075 () Bool)

(assert (=> b!564611 m!543075))

(assert (=> b!564611 m!543053))

(declare-fun m!543077 () Bool)

(assert (=> b!564611 m!543077))

(assert (=> b!564611 m!543071))

(declare-fun m!543079 () Bool)

(assert (=> b!564611 m!543079))

(push 1)

