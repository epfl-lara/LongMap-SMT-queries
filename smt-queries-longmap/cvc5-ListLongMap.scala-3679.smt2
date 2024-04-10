; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50690 () Bool)

(assert start!50690)

(declare-fun b!554282 () Bool)

(declare-fun res!346699 () Bool)

(declare-fun e!319626 () Bool)

(assert (=> b!554282 (=> (not res!346699) (not e!319626))))

(declare-datatypes ((array!34915 0))(
  ( (array!34916 (arr!16767 (Array (_ BitVec 32) (_ BitVec 64))) (size!17131 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34915)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34915 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554282 (= res!346699 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554283 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5216 0))(
  ( (MissingZero!5216 (index!23091 (_ BitVec 32))) (Found!5216 (index!23092 (_ BitVec 32))) (Intermediate!5216 (undefined!6028 Bool) (index!23093 (_ BitVec 32)) (x!52010 (_ BitVec 32))) (Undefined!5216) (MissingVacant!5216 (index!23094 (_ BitVec 32))) )
))
(declare-fun lt!251743 () SeekEntryResult!5216)

(declare-fun e!319625 () Bool)

(assert (=> b!554283 (= e!319625 (not (or (not (is-Intermediate!5216 lt!251743)) (undefined!6028 lt!251743) (= (select (arr!16767 a!3118) (index!23093 lt!251743)) (select (arr!16767 a!3118) j!142)) (not (= (select (arr!16767 a!3118) (index!23093 lt!251743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(declare-fun e!319627 () Bool)

(assert (=> b!554283 e!319627))

(declare-fun res!346700 () Bool)

(assert (=> b!554283 (=> (not res!346700) (not e!319627))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34915 (_ BitVec 32)) Bool)

(assert (=> b!554283 (= res!346700 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17206 0))(
  ( (Unit!17207) )
))
(declare-fun lt!251742 () Unit!17206)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34915 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17206)

(assert (=> b!554283 (= lt!251742 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554285 () Bool)

(declare-fun res!346698 () Bool)

(assert (=> b!554285 (=> (not res!346698) (not e!319626))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!554285 (= res!346698 (and (= (size!17131 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17131 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17131 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554286 () Bool)

(declare-fun res!346694 () Bool)

(declare-fun e!319629 () Bool)

(assert (=> b!554286 (=> (not res!346694) (not e!319629))))

(declare-datatypes ((List!10847 0))(
  ( (Nil!10844) (Cons!10843 (h!11828 (_ BitVec 64)) (t!17075 List!10847)) )
))
(declare-fun arrayNoDuplicates!0 (array!34915 (_ BitVec 32) List!10847) Bool)

(assert (=> b!554286 (= res!346694 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10844))))

(declare-fun b!554287 () Bool)

(declare-fun res!346696 () Bool)

(assert (=> b!554287 (=> (not res!346696) (not e!319626))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554287 (= res!346696 (validKeyInArray!0 (select (arr!16767 a!3118) j!142)))))

(declare-fun b!554288 () Bool)

(assert (=> b!554288 (= e!319626 e!319629)))

(declare-fun res!346697 () Bool)

(assert (=> b!554288 (=> (not res!346697) (not e!319629))))

(declare-fun lt!251741 () SeekEntryResult!5216)

(assert (=> b!554288 (= res!346697 (or (= lt!251741 (MissingZero!5216 i!1132)) (= lt!251741 (MissingVacant!5216 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34915 (_ BitVec 32)) SeekEntryResult!5216)

(assert (=> b!554288 (= lt!251741 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!554289 () Bool)

(assert (=> b!554289 (= e!319629 e!319625)))

(declare-fun res!346703 () Bool)

(assert (=> b!554289 (=> (not res!346703) (not e!319625))))

(declare-fun lt!251739 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34915 (_ BitVec 32)) SeekEntryResult!5216)

(assert (=> b!554289 (= res!346703 (= lt!251743 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251739 (select (store (arr!16767 a!3118) i!1132 k!1914) j!142) (array!34916 (store (arr!16767 a!3118) i!1132 k!1914) (size!17131 a!3118)) mask!3119)))))

(declare-fun lt!251740 () (_ BitVec 32))

(assert (=> b!554289 (= lt!251743 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251740 (select (arr!16767 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554289 (= lt!251739 (toIndex!0 (select (store (arr!16767 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!554289 (= lt!251740 (toIndex!0 (select (arr!16767 a!3118) j!142) mask!3119))))

(declare-fun b!554290 () Bool)

(declare-fun res!346701 () Bool)

(assert (=> b!554290 (=> (not res!346701) (not e!319629))))

(assert (=> b!554290 (= res!346701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554291 () Bool)

(assert (=> b!554291 (= e!319627 (= (seekEntryOrOpen!0 (select (arr!16767 a!3118) j!142) a!3118 mask!3119) (Found!5216 j!142)))))

(declare-fun b!554284 () Bool)

(declare-fun res!346695 () Bool)

(assert (=> b!554284 (=> (not res!346695) (not e!319626))))

(assert (=> b!554284 (= res!346695 (validKeyInArray!0 k!1914))))

(declare-fun res!346702 () Bool)

(assert (=> start!50690 (=> (not res!346702) (not e!319626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50690 (= res!346702 (validMask!0 mask!3119))))

(assert (=> start!50690 e!319626))

(assert (=> start!50690 true))

(declare-fun array_inv!12563 (array!34915) Bool)

(assert (=> start!50690 (array_inv!12563 a!3118)))

(assert (= (and start!50690 res!346702) b!554285))

(assert (= (and b!554285 res!346698) b!554287))

(assert (= (and b!554287 res!346696) b!554284))

(assert (= (and b!554284 res!346695) b!554282))

(assert (= (and b!554282 res!346699) b!554288))

(assert (= (and b!554288 res!346697) b!554290))

(assert (= (and b!554290 res!346701) b!554286))

(assert (= (and b!554286 res!346694) b!554289))

(assert (= (and b!554289 res!346703) b!554283))

(assert (= (and b!554283 res!346700) b!554291))

(declare-fun m!531543 () Bool)

(assert (=> b!554289 m!531543))

(declare-fun m!531545 () Bool)

(assert (=> b!554289 m!531545))

(declare-fun m!531547 () Bool)

(assert (=> b!554289 m!531547))

(declare-fun m!531549 () Bool)

(assert (=> b!554289 m!531549))

(assert (=> b!554289 m!531543))

(assert (=> b!554289 m!531547))

(assert (=> b!554289 m!531543))

(declare-fun m!531551 () Bool)

(assert (=> b!554289 m!531551))

(declare-fun m!531553 () Bool)

(assert (=> b!554289 m!531553))

(assert (=> b!554289 m!531547))

(declare-fun m!531555 () Bool)

(assert (=> b!554289 m!531555))

(declare-fun m!531557 () Bool)

(assert (=> b!554288 m!531557))

(declare-fun m!531559 () Bool)

(assert (=> b!554284 m!531559))

(assert (=> b!554291 m!531543))

(assert (=> b!554291 m!531543))

(declare-fun m!531561 () Bool)

(assert (=> b!554291 m!531561))

(declare-fun m!531563 () Bool)

(assert (=> b!554290 m!531563))

(declare-fun m!531565 () Bool)

(assert (=> b!554283 m!531565))

(assert (=> b!554283 m!531543))

(declare-fun m!531567 () Bool)

(assert (=> b!554283 m!531567))

(declare-fun m!531569 () Bool)

(assert (=> b!554283 m!531569))

(declare-fun m!531571 () Bool)

(assert (=> start!50690 m!531571))

(declare-fun m!531573 () Bool)

(assert (=> start!50690 m!531573))

(assert (=> b!554287 m!531543))

(assert (=> b!554287 m!531543))

(declare-fun m!531575 () Bool)

(assert (=> b!554287 m!531575))

(declare-fun m!531577 () Bool)

(assert (=> b!554286 m!531577))

(declare-fun m!531579 () Bool)

(assert (=> b!554282 m!531579))

(push 1)

