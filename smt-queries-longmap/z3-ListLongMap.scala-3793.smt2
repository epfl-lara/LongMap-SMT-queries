; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52040 () Bool)

(assert start!52040)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!568102 () Bool)

(declare-fun e!326878 () Bool)

(declare-datatypes ((array!35629 0))(
  ( (array!35630 (arr!17108 (Array (_ BitVec 32) (_ BitVec 64))) (size!17473 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35629)

(declare-datatypes ((SeekEntryResult!5554 0))(
  ( (MissingZero!5554 (index!24443 (_ BitVec 32))) (Found!5554 (index!24444 (_ BitVec 32))) (Intermediate!5554 (undefined!6366 Bool) (index!24445 (_ BitVec 32)) (x!53330 (_ BitVec 32))) (Undefined!5554) (MissingVacant!5554 (index!24446 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35629 (_ BitVec 32)) SeekEntryResult!5554)

(assert (=> b!568102 (= e!326878 (= (seekEntryOrOpen!0 (select (arr!17108 a!3118) j!142) a!3118 mask!3119) (Found!5554 j!142)))))

(declare-fun b!568103 () Bool)

(declare-fun res!358449 () Bool)

(declare-fun e!326880 () Bool)

(assert (=> b!568103 (=> (not res!358449) (not e!326880))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35629 (_ BitVec 32)) Bool)

(assert (=> b!568103 (= res!358449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!568104 () Bool)

(declare-fun res!358450 () Bool)

(declare-fun e!326879 () Bool)

(assert (=> b!568104 (=> (not res!358450) (not e!326879))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!568104 (= res!358450 (validKeyInArray!0 k0!1914))))

(declare-fun b!568106 () Bool)

(declare-fun res!358453 () Bool)

(assert (=> b!568106 (=> (not res!358453) (not e!326879))))

(declare-fun arrayContainsKey!0 (array!35629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!568106 (= res!358453 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!568107 () Bool)

(assert (=> b!568107 (= e!326879 e!326880)))

(declare-fun res!358454 () Bool)

(assert (=> b!568107 (=> (not res!358454) (not e!326880))))

(declare-fun lt!258696 () SeekEntryResult!5554)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!568107 (= res!358454 (or (= lt!258696 (MissingZero!5554 i!1132)) (= lt!258696 (MissingVacant!5554 i!1132))))))

(assert (=> b!568107 (= lt!258696 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!568108 () Bool)

(declare-fun res!358447 () Bool)

(assert (=> b!568108 (=> (not res!358447) (not e!326880))))

(declare-datatypes ((List!11227 0))(
  ( (Nil!11224) (Cons!11223 (h!12241 (_ BitVec 64)) (t!17446 List!11227)) )
))
(declare-fun arrayNoDuplicates!0 (array!35629 (_ BitVec 32) List!11227) Bool)

(assert (=> b!568108 (= res!358447 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11224))))

(declare-fun b!568109 () Bool)

(assert (=> b!568109 (= e!326880 (not true))))

(assert (=> b!568109 e!326878))

(declare-fun res!358445 () Bool)

(assert (=> b!568109 (=> (not res!358445) (not e!326878))))

(assert (=> b!568109 (= res!358445 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17796 0))(
  ( (Unit!17797) )
))
(declare-fun lt!258697 () Unit!17796)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35629 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17796)

(assert (=> b!568109 (= lt!258697 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!568110 () Bool)

(declare-fun res!358452 () Bool)

(assert (=> b!568110 (=> (not res!358452) (not e!326879))))

(assert (=> b!568110 (= res!358452 (and (= (size!17473 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17473 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17473 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!568111 () Bool)

(declare-fun res!358448 () Bool)

(assert (=> b!568111 (=> (not res!358448) (not e!326879))))

(assert (=> b!568111 (= res!358448 (validKeyInArray!0 (select (arr!17108 a!3118) j!142)))))

(declare-fun b!568105 () Bool)

(declare-fun res!358451 () Bool)

(assert (=> b!568105 (=> (not res!358451) (not e!326880))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35629 (_ BitVec 32)) SeekEntryResult!5554)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568105 (= res!358451 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17108 a!3118) j!142) mask!3119) (select (arr!17108 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17108 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17108 a!3118) i!1132 k0!1914) j!142) (array!35630 (store (arr!17108 a!3118) i!1132 k0!1914) (size!17473 a!3118)) mask!3119)))))

(declare-fun res!358446 () Bool)

(assert (=> start!52040 (=> (not res!358446) (not e!326879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52040 (= res!358446 (validMask!0 mask!3119))))

(assert (=> start!52040 e!326879))

(assert (=> start!52040 true))

(declare-fun array_inv!12991 (array!35629) Bool)

(assert (=> start!52040 (array_inv!12991 a!3118)))

(assert (= (and start!52040 res!358446) b!568110))

(assert (= (and b!568110 res!358452) b!568111))

(assert (= (and b!568111 res!358448) b!568104))

(assert (= (and b!568104 res!358450) b!568106))

(assert (= (and b!568106 res!358453) b!568107))

(assert (= (and b!568107 res!358454) b!568103))

(assert (= (and b!568103 res!358449) b!568108))

(assert (= (and b!568108 res!358447) b!568105))

(assert (= (and b!568105 res!358451) b!568109))

(assert (= (and b!568109 res!358445) b!568102))

(declare-fun m!546119 () Bool)

(assert (=> start!52040 m!546119))

(declare-fun m!546121 () Bool)

(assert (=> start!52040 m!546121))

(declare-fun m!546123 () Bool)

(assert (=> b!568106 m!546123))

(declare-fun m!546125 () Bool)

(assert (=> b!568102 m!546125))

(assert (=> b!568102 m!546125))

(declare-fun m!546127 () Bool)

(assert (=> b!568102 m!546127))

(declare-fun m!546129 () Bool)

(assert (=> b!568109 m!546129))

(declare-fun m!546131 () Bool)

(assert (=> b!568109 m!546131))

(declare-fun m!546133 () Bool)

(assert (=> b!568107 m!546133))

(assert (=> b!568105 m!546125))

(declare-fun m!546135 () Bool)

(assert (=> b!568105 m!546135))

(assert (=> b!568105 m!546125))

(declare-fun m!546137 () Bool)

(assert (=> b!568105 m!546137))

(declare-fun m!546139 () Bool)

(assert (=> b!568105 m!546139))

(assert (=> b!568105 m!546137))

(declare-fun m!546141 () Bool)

(assert (=> b!568105 m!546141))

(assert (=> b!568105 m!546135))

(assert (=> b!568105 m!546125))

(declare-fun m!546143 () Bool)

(assert (=> b!568105 m!546143))

(declare-fun m!546145 () Bool)

(assert (=> b!568105 m!546145))

(assert (=> b!568105 m!546137))

(assert (=> b!568105 m!546139))

(declare-fun m!546147 () Bool)

(assert (=> b!568103 m!546147))

(declare-fun m!546149 () Bool)

(assert (=> b!568108 m!546149))

(assert (=> b!568111 m!546125))

(assert (=> b!568111 m!546125))

(declare-fun m!546151 () Bool)

(assert (=> b!568111 m!546151))

(declare-fun m!546153 () Bool)

(assert (=> b!568104 m!546153))

(check-sat (not b!568105) (not b!568102) (not b!568111) (not b!568106) (not b!568107) (not b!568104) (not b!568108) (not b!568109) (not start!52040) (not b!568103))
(check-sat)
