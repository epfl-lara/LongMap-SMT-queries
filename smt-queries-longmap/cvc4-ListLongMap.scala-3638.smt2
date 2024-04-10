; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50208 () Bool)

(assert start!50208)

(declare-fun b!549553 () Bool)

(declare-fun res!342700 () Bool)

(declare-fun e!317384 () Bool)

(assert (=> b!549553 (=> (not res!342700) (not e!317384))))

(declare-datatypes ((array!34661 0))(
  ( (array!34662 (arr!16646 (Array (_ BitVec 32) (_ BitVec 64))) (size!17010 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34661)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549553 (= res!342700 (validKeyInArray!0 (select (arr!16646 a!3118) j!142)))))

(declare-fun b!549554 () Bool)

(declare-fun res!342699 () Bool)

(assert (=> b!549554 (=> (not res!342699) (not e!317384))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549554 (= res!342699 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549555 () Bool)

(declare-fun res!342697 () Bool)

(declare-fun e!317385 () Bool)

(assert (=> b!549555 (=> (not res!342697) (not e!317385))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34661 (_ BitVec 32)) Bool)

(assert (=> b!549555 (= res!342697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!549556 () Bool)

(declare-fun res!342701 () Bool)

(assert (=> b!549556 (=> (not res!342701) (not e!317384))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549556 (= res!342701 (and (= (size!17010 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17010 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17010 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!342698 () Bool)

(assert (=> start!50208 (=> (not res!342698) (not e!317384))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50208 (= res!342698 (validMask!0 mask!3119))))

(assert (=> start!50208 e!317384))

(assert (=> start!50208 true))

(declare-fun array_inv!12442 (array!34661) Bool)

(assert (=> start!50208 (array_inv!12442 a!3118)))

(declare-fun b!549557 () Bool)

(declare-fun res!342704 () Bool)

(assert (=> b!549557 (=> (not res!342704) (not e!317385))))

(declare-datatypes ((List!10726 0))(
  ( (Nil!10723) (Cons!10722 (h!11695 (_ BitVec 64)) (t!16954 List!10726)) )
))
(declare-fun arrayNoDuplicates!0 (array!34661 (_ BitVec 32) List!10726) Bool)

(assert (=> b!549557 (= res!342704 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10723))))

(declare-fun b!549558 () Bool)

(assert (=> b!549558 (= e!317385 false)))

(declare-datatypes ((SeekEntryResult!5095 0))(
  ( (MissingZero!5095 (index!22607 (_ BitVec 32))) (Found!5095 (index!22608 (_ BitVec 32))) (Intermediate!5095 (undefined!5907 Bool) (index!22609 (_ BitVec 32)) (x!51537 (_ BitVec 32))) (Undefined!5095) (MissingVacant!5095 (index!22610 (_ BitVec 32))) )
))
(declare-fun lt!250204 () SeekEntryResult!5095)

(declare-fun lt!250200 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34661 (_ BitVec 32)) SeekEntryResult!5095)

(assert (=> b!549558 (= lt!250204 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250200 (select (store (arr!16646 a!3118) i!1132 k!1914) j!142) (array!34662 (store (arr!16646 a!3118) i!1132 k!1914) (size!17010 a!3118)) mask!3119))))

(declare-fun lt!250202 () SeekEntryResult!5095)

(declare-fun lt!250201 () (_ BitVec 32))

(assert (=> b!549558 (= lt!250202 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250201 (select (arr!16646 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549558 (= lt!250200 (toIndex!0 (select (store (arr!16646 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!549558 (= lt!250201 (toIndex!0 (select (arr!16646 a!3118) j!142) mask!3119))))

(declare-fun b!549559 () Bool)

(assert (=> b!549559 (= e!317384 e!317385)))

(declare-fun res!342703 () Bool)

(assert (=> b!549559 (=> (not res!342703) (not e!317385))))

(declare-fun lt!250203 () SeekEntryResult!5095)

(assert (=> b!549559 (= res!342703 (or (= lt!250203 (MissingZero!5095 i!1132)) (= lt!250203 (MissingVacant!5095 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34661 (_ BitVec 32)) SeekEntryResult!5095)

(assert (=> b!549559 (= lt!250203 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!549560 () Bool)

(declare-fun res!342702 () Bool)

(assert (=> b!549560 (=> (not res!342702) (not e!317384))))

(assert (=> b!549560 (= res!342702 (validKeyInArray!0 k!1914))))

(assert (= (and start!50208 res!342698) b!549556))

(assert (= (and b!549556 res!342701) b!549553))

(assert (= (and b!549553 res!342700) b!549560))

(assert (= (and b!549560 res!342702) b!549554))

(assert (= (and b!549554 res!342699) b!549559))

(assert (= (and b!549559 res!342703) b!549555))

(assert (= (and b!549555 res!342697) b!549557))

(assert (= (and b!549557 res!342704) b!549558))

(declare-fun m!526431 () Bool)

(assert (=> start!50208 m!526431))

(declare-fun m!526433 () Bool)

(assert (=> start!50208 m!526433))

(declare-fun m!526435 () Bool)

(assert (=> b!549557 m!526435))

(declare-fun m!526437 () Bool)

(assert (=> b!549560 m!526437))

(declare-fun m!526439 () Bool)

(assert (=> b!549555 m!526439))

(declare-fun m!526441 () Bool)

(assert (=> b!549558 m!526441))

(declare-fun m!526443 () Bool)

(assert (=> b!549558 m!526443))

(assert (=> b!549558 m!526441))

(declare-fun m!526445 () Bool)

(assert (=> b!549558 m!526445))

(assert (=> b!549558 m!526441))

(declare-fun m!526447 () Bool)

(assert (=> b!549558 m!526447))

(declare-fun m!526449 () Bool)

(assert (=> b!549558 m!526449))

(declare-fun m!526451 () Bool)

(assert (=> b!549558 m!526451))

(assert (=> b!549558 m!526449))

(declare-fun m!526453 () Bool)

(assert (=> b!549558 m!526453))

(assert (=> b!549558 m!526449))

(declare-fun m!526455 () Bool)

(assert (=> b!549554 m!526455))

(declare-fun m!526457 () Bool)

(assert (=> b!549559 m!526457))

(assert (=> b!549553 m!526441))

(assert (=> b!549553 m!526441))

(declare-fun m!526459 () Bool)

(assert (=> b!549553 m!526459))

(push 1)

(assert (not start!50208))

