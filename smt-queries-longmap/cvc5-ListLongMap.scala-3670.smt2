; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50636 () Bool)

(assert start!50636)

(declare-fun b!553463 () Bool)

(declare-fun res!345882 () Bool)

(declare-fun e!319265 () Bool)

(assert (=> b!553463 (=> (not res!345882) (not e!319265))))

(declare-datatypes ((array!34861 0))(
  ( (array!34862 (arr!16740 (Array (_ BitVec 32) (_ BitVec 64))) (size!17104 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34861)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34861 (_ BitVec 32)) Bool)

(assert (=> b!553463 (= res!345882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553464 () Bool)

(declare-fun e!319266 () Bool)

(assert (=> b!553464 (= e!319266 e!319265)))

(declare-fun res!345880 () Bool)

(assert (=> b!553464 (=> (not res!345880) (not e!319265))))

(declare-datatypes ((SeekEntryResult!5189 0))(
  ( (MissingZero!5189 (index!22983 (_ BitVec 32))) (Found!5189 (index!22984 (_ BitVec 32))) (Intermediate!5189 (undefined!6001 Bool) (index!22985 (_ BitVec 32)) (x!51911 (_ BitVec 32))) (Undefined!5189) (MissingVacant!5189 (index!22986 (_ BitVec 32))) )
))
(declare-fun lt!251490 () SeekEntryResult!5189)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!553464 (= res!345880 (or (= lt!251490 (MissingZero!5189 i!1132)) (= lt!251490 (MissingVacant!5189 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34861 (_ BitVec 32)) SeekEntryResult!5189)

(assert (=> b!553464 (= lt!251490 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!553465 () Bool)

(assert (=> b!553465 (= e!319265 (not true))))

(declare-fun e!319263 () Bool)

(assert (=> b!553465 e!319263))

(declare-fun res!345878 () Bool)

(assert (=> b!553465 (=> (not res!345878) (not e!319263))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!553465 (= res!345878 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17152 0))(
  ( (Unit!17153) )
))
(declare-fun lt!251491 () Unit!17152)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34861 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17152)

(assert (=> b!553465 (= lt!251491 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553466 () Bool)

(declare-fun res!345883 () Bool)

(assert (=> b!553466 (=> (not res!345883) (not e!319265))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34861 (_ BitVec 32)) SeekEntryResult!5189)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553466 (= res!345883 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16740 a!3118) j!142) mask!3119) (select (arr!16740 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16740 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16740 a!3118) i!1132 k!1914) j!142) (array!34862 (store (arr!16740 a!3118) i!1132 k!1914) (size!17104 a!3118)) mask!3119)))))

(declare-fun b!553467 () Bool)

(declare-fun res!345884 () Bool)

(assert (=> b!553467 (=> (not res!345884) (not e!319266))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553467 (= res!345884 (validKeyInArray!0 k!1914))))

(declare-fun res!345875 () Bool)

(assert (=> start!50636 (=> (not res!345875) (not e!319266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50636 (= res!345875 (validMask!0 mask!3119))))

(assert (=> start!50636 e!319266))

(assert (=> start!50636 true))

(declare-fun array_inv!12536 (array!34861) Bool)

(assert (=> start!50636 (array_inv!12536 a!3118)))

(declare-fun b!553468 () Bool)

(declare-fun res!345876 () Bool)

(assert (=> b!553468 (=> (not res!345876) (not e!319265))))

(declare-datatypes ((List!10820 0))(
  ( (Nil!10817) (Cons!10816 (h!11801 (_ BitVec 64)) (t!17048 List!10820)) )
))
(declare-fun arrayNoDuplicates!0 (array!34861 (_ BitVec 32) List!10820) Bool)

(assert (=> b!553468 (= res!345876 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10817))))

(declare-fun b!553469 () Bool)

(declare-fun res!345881 () Bool)

(assert (=> b!553469 (=> (not res!345881) (not e!319266))))

(declare-fun arrayContainsKey!0 (array!34861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553469 (= res!345881 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553470 () Bool)

(declare-fun res!345879 () Bool)

(assert (=> b!553470 (=> (not res!345879) (not e!319266))))

(assert (=> b!553470 (= res!345879 (validKeyInArray!0 (select (arr!16740 a!3118) j!142)))))

(declare-fun b!553471 () Bool)

(assert (=> b!553471 (= e!319263 (= (seekEntryOrOpen!0 (select (arr!16740 a!3118) j!142) a!3118 mask!3119) (Found!5189 j!142)))))

(declare-fun b!553472 () Bool)

(declare-fun res!345877 () Bool)

(assert (=> b!553472 (=> (not res!345877) (not e!319266))))

(assert (=> b!553472 (= res!345877 (and (= (size!17104 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17104 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17104 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50636 res!345875) b!553472))

(assert (= (and b!553472 res!345877) b!553470))

(assert (= (and b!553470 res!345879) b!553467))

(assert (= (and b!553467 res!345884) b!553469))

(assert (= (and b!553469 res!345881) b!553464))

(assert (= (and b!553464 res!345880) b!553463))

(assert (= (and b!553463 res!345882) b!553468))

(assert (= (and b!553468 res!345876) b!553466))

(assert (= (and b!553466 res!345883) b!553465))

(assert (= (and b!553465 res!345878) b!553471))

(declare-fun m!530547 () Bool)

(assert (=> b!553464 m!530547))

(declare-fun m!530549 () Bool)

(assert (=> b!553469 m!530549))

(declare-fun m!530551 () Bool)

(assert (=> b!553468 m!530551))

(declare-fun m!530553 () Bool)

(assert (=> b!553467 m!530553))

(declare-fun m!530555 () Bool)

(assert (=> b!553471 m!530555))

(assert (=> b!553471 m!530555))

(declare-fun m!530557 () Bool)

(assert (=> b!553471 m!530557))

(declare-fun m!530559 () Bool)

(assert (=> b!553465 m!530559))

(declare-fun m!530561 () Bool)

(assert (=> b!553465 m!530561))

(declare-fun m!530563 () Bool)

(assert (=> start!50636 m!530563))

(declare-fun m!530565 () Bool)

(assert (=> start!50636 m!530565))

(declare-fun m!530567 () Bool)

(assert (=> b!553463 m!530567))

(assert (=> b!553466 m!530555))

(declare-fun m!530569 () Bool)

(assert (=> b!553466 m!530569))

(assert (=> b!553466 m!530555))

(declare-fun m!530571 () Bool)

(assert (=> b!553466 m!530571))

(declare-fun m!530573 () Bool)

(assert (=> b!553466 m!530573))

(assert (=> b!553466 m!530571))

(declare-fun m!530575 () Bool)

(assert (=> b!553466 m!530575))

(assert (=> b!553466 m!530569))

(assert (=> b!553466 m!530555))

(declare-fun m!530577 () Bool)

(assert (=> b!553466 m!530577))

(declare-fun m!530579 () Bool)

(assert (=> b!553466 m!530579))

(assert (=> b!553466 m!530571))

(assert (=> b!553466 m!530573))

(assert (=> b!553470 m!530555))

(assert (=> b!553470 m!530555))

(declare-fun m!530581 () Bool)

(assert (=> b!553470 m!530581))

(push 1)

