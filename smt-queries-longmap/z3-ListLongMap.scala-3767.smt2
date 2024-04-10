; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51598 () Bool)

(assert start!51598)

(declare-fun b!564634 () Bool)

(declare-fun res!355793 () Bool)

(declare-fun e!325194 () Bool)

(assert (=> b!564634 (=> (not res!355793) (not e!325194))))

(declare-datatypes ((array!35463 0))(
  ( (array!35464 (arr!17032 (Array (_ BitVec 32) (_ BitVec 64))) (size!17396 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35463)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35463 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564634 (= res!355793 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!355790 () Bool)

(assert (=> start!51598 (=> (not res!355790) (not e!325194))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51598 (= res!355790 (validMask!0 mask!3119))))

(assert (=> start!51598 e!325194))

(assert (=> start!51598 true))

(declare-fun array_inv!12828 (array!35463) Bool)

(assert (=> start!51598 (array_inv!12828 a!3118)))

(declare-fun b!564635 () Bool)

(declare-fun res!355786 () Bool)

(declare-fun e!325193 () Bool)

(assert (=> b!564635 (=> (not res!355786) (not e!325193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35463 (_ BitVec 32)) Bool)

(assert (=> b!564635 (= res!355786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564636 () Bool)

(assert (=> b!564636 (= e!325194 e!325193)))

(declare-fun res!355789 () Bool)

(assert (=> b!564636 (=> (not res!355789) (not e!325193))))

(declare-datatypes ((SeekEntryResult!5481 0))(
  ( (MissingZero!5481 (index!24151 (_ BitVec 32))) (Found!5481 (index!24152 (_ BitVec 32))) (Intermediate!5481 (undefined!6293 Bool) (index!24153 (_ BitVec 32)) (x!53024 (_ BitVec 32))) (Undefined!5481) (MissingVacant!5481 (index!24154 (_ BitVec 32))) )
))
(declare-fun lt!257622 () SeekEntryResult!5481)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564636 (= res!355789 (or (= lt!257622 (MissingZero!5481 i!1132)) (= lt!257622 (MissingVacant!5481 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35463 (_ BitVec 32)) SeekEntryResult!5481)

(assert (=> b!564636 (= lt!257622 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!564637 () Bool)

(declare-fun res!355792 () Bool)

(assert (=> b!564637 (=> (not res!355792) (not e!325193))))

(declare-datatypes ((List!11112 0))(
  ( (Nil!11109) (Cons!11108 (h!12111 (_ BitVec 64)) (t!17340 List!11112)) )
))
(declare-fun arrayNoDuplicates!0 (array!35463 (_ BitVec 32) List!11112) Bool)

(assert (=> b!564637 (= res!355792 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11109))))

(declare-fun b!564638 () Bool)

(assert (=> b!564638 (= e!325193 false)))

(declare-fun lt!257623 () SeekEntryResult!5481)

(declare-fun lt!257624 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35463 (_ BitVec 32)) SeekEntryResult!5481)

(assert (=> b!564638 (= lt!257623 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257624 (select (store (arr!17032 a!3118) i!1132 k0!1914) j!142) (array!35464 (store (arr!17032 a!3118) i!1132 k0!1914) (size!17396 a!3118)) mask!3119))))

(declare-fun lt!257626 () SeekEntryResult!5481)

(declare-fun lt!257625 () (_ BitVec 32))

(assert (=> b!564638 (= lt!257626 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257625 (select (arr!17032 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564638 (= lt!257624 (toIndex!0 (select (store (arr!17032 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!564638 (= lt!257625 (toIndex!0 (select (arr!17032 a!3118) j!142) mask!3119))))

(declare-fun b!564639 () Bool)

(declare-fun res!355791 () Bool)

(assert (=> b!564639 (=> (not res!355791) (not e!325194))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564639 (= res!355791 (validKeyInArray!0 (select (arr!17032 a!3118) j!142)))))

(declare-fun b!564640 () Bool)

(declare-fun res!355787 () Bool)

(assert (=> b!564640 (=> (not res!355787) (not e!325194))))

(assert (=> b!564640 (= res!355787 (validKeyInArray!0 k0!1914))))

(declare-fun b!564641 () Bool)

(declare-fun res!355788 () Bool)

(assert (=> b!564641 (=> (not res!355788) (not e!325194))))

(assert (=> b!564641 (= res!355788 (and (= (size!17396 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17396 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17396 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51598 res!355790) b!564641))

(assert (= (and b!564641 res!355788) b!564639))

(assert (= (and b!564639 res!355791) b!564640))

(assert (= (and b!564640 res!355787) b!564634))

(assert (= (and b!564634 res!355793) b!564636))

(assert (= (and b!564636 res!355789) b!564635))

(assert (= (and b!564635 res!355786) b!564637))

(assert (= (and b!564637 res!355792) b!564638))

(declare-fun m!543081 () Bool)

(assert (=> b!564635 m!543081))

(declare-fun m!543083 () Bool)

(assert (=> b!564638 m!543083))

(declare-fun m!543085 () Bool)

(assert (=> b!564638 m!543085))

(assert (=> b!564638 m!543083))

(declare-fun m!543087 () Bool)

(assert (=> b!564638 m!543087))

(assert (=> b!564638 m!543083))

(declare-fun m!543089 () Bool)

(assert (=> b!564638 m!543089))

(declare-fun m!543091 () Bool)

(assert (=> b!564638 m!543091))

(assert (=> b!564638 m!543087))

(declare-fun m!543093 () Bool)

(assert (=> b!564638 m!543093))

(assert (=> b!564638 m!543087))

(declare-fun m!543095 () Bool)

(assert (=> b!564638 m!543095))

(assert (=> b!564639 m!543083))

(assert (=> b!564639 m!543083))

(declare-fun m!543097 () Bool)

(assert (=> b!564639 m!543097))

(declare-fun m!543099 () Bool)

(assert (=> b!564637 m!543099))

(declare-fun m!543101 () Bool)

(assert (=> b!564634 m!543101))

(declare-fun m!543103 () Bool)

(assert (=> b!564636 m!543103))

(declare-fun m!543105 () Bool)

(assert (=> start!51598 m!543105))

(declare-fun m!543107 () Bool)

(assert (=> start!51598 m!543107))

(declare-fun m!543109 () Bool)

(assert (=> b!564640 m!543109))

(check-sat (not b!564639) (not b!564640) (not b!564635) (not b!564637) (not b!564634) (not b!564636) (not b!564638) (not start!51598))
(check-sat)
