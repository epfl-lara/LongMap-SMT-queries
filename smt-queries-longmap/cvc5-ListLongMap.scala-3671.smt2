; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50642 () Bool)

(assert start!50642)

(declare-fun e!319304 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!553553 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5192 0))(
  ( (MissingZero!5192 (index!22995 (_ BitVec 32))) (Found!5192 (index!22996 (_ BitVec 32))) (Intermediate!5192 (undefined!6004 Bool) (index!22997 (_ BitVec 32)) (x!51922 (_ BitVec 32))) (Undefined!5192) (MissingVacant!5192 (index!22998 (_ BitVec 32))) )
))
(declare-fun lt!251516 () SeekEntryResult!5192)

(declare-datatypes ((array!34867 0))(
  ( (array!34868 (arr!16743 (Array (_ BitVec 32) (_ BitVec 64))) (size!17107 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34867)

(assert (=> b!553553 (= e!319304 (not (or (not (is-Intermediate!5192 lt!251516)) (undefined!6004 lt!251516) (not (= (select (arr!16743 a!3118) (index!22997 lt!251516)) (select (arr!16743 a!3118) j!142))) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(declare-fun e!319302 () Bool)

(assert (=> b!553553 e!319302))

(declare-fun res!345966 () Bool)

(assert (=> b!553553 (=> (not res!345966) (not e!319302))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34867 (_ BitVec 32)) Bool)

(assert (=> b!553553 (= res!345966 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17158 0))(
  ( (Unit!17159) )
))
(declare-fun lt!251518 () Unit!17158)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34867 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17158)

(assert (=> b!553553 (= lt!251518 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553554 () Bool)

(declare-fun res!345965 () Bool)

(declare-fun e!319303 () Bool)

(assert (=> b!553554 (=> (not res!345965) (not e!319303))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34867 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553554 (= res!345965 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553555 () Bool)

(declare-fun e!319305 () Bool)

(assert (=> b!553555 (= e!319305 e!319304)))

(declare-fun res!345972 () Bool)

(assert (=> b!553555 (=> (not res!345972) (not e!319304))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!251515 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34867 (_ BitVec 32)) SeekEntryResult!5192)

(assert (=> b!553555 (= res!345972 (= lt!251516 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251515 (select (store (arr!16743 a!3118) i!1132 k!1914) j!142) (array!34868 (store (arr!16743 a!3118) i!1132 k!1914) (size!17107 a!3118)) mask!3119)))))

(declare-fun lt!251514 () (_ BitVec 32))

(assert (=> b!553555 (= lt!251516 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251514 (select (arr!16743 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553555 (= lt!251515 (toIndex!0 (select (store (arr!16743 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!553555 (= lt!251514 (toIndex!0 (select (arr!16743 a!3118) j!142) mask!3119))))

(declare-fun b!553556 () Bool)

(declare-fun res!345968 () Bool)

(assert (=> b!553556 (=> (not res!345968) (not e!319305))))

(assert (=> b!553556 (= res!345968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553557 () Bool)

(declare-fun res!345974 () Bool)

(assert (=> b!553557 (=> (not res!345974) (not e!319305))))

(declare-datatypes ((List!10823 0))(
  ( (Nil!10820) (Cons!10819 (h!11804 (_ BitVec 64)) (t!17051 List!10823)) )
))
(declare-fun arrayNoDuplicates!0 (array!34867 (_ BitVec 32) List!10823) Bool)

(assert (=> b!553557 (= res!345974 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10820))))

(declare-fun res!345973 () Bool)

(assert (=> start!50642 (=> (not res!345973) (not e!319303))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50642 (= res!345973 (validMask!0 mask!3119))))

(assert (=> start!50642 e!319303))

(assert (=> start!50642 true))

(declare-fun array_inv!12539 (array!34867) Bool)

(assert (=> start!50642 (array_inv!12539 a!3118)))

(declare-fun b!553558 () Bool)

(declare-fun res!345969 () Bool)

(assert (=> b!553558 (=> (not res!345969) (not e!319303))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553558 (= res!345969 (validKeyInArray!0 k!1914))))

(declare-fun b!553559 () Bool)

(declare-fun res!345970 () Bool)

(assert (=> b!553559 (=> (not res!345970) (not e!319303))))

(assert (=> b!553559 (= res!345970 (and (= (size!17107 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17107 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17107 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553560 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34867 (_ BitVec 32)) SeekEntryResult!5192)

(assert (=> b!553560 (= e!319302 (= (seekEntryOrOpen!0 (select (arr!16743 a!3118) j!142) a!3118 mask!3119) (Found!5192 j!142)))))

(declare-fun b!553561 () Bool)

(assert (=> b!553561 (= e!319303 e!319305)))

(declare-fun res!345967 () Bool)

(assert (=> b!553561 (=> (not res!345967) (not e!319305))))

(declare-fun lt!251517 () SeekEntryResult!5192)

(assert (=> b!553561 (= res!345967 (or (= lt!251517 (MissingZero!5192 i!1132)) (= lt!251517 (MissingVacant!5192 i!1132))))))

(assert (=> b!553561 (= lt!251517 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!553562 () Bool)

(declare-fun res!345971 () Bool)

(assert (=> b!553562 (=> (not res!345971) (not e!319303))))

(assert (=> b!553562 (= res!345971 (validKeyInArray!0 (select (arr!16743 a!3118) j!142)))))

(assert (= (and start!50642 res!345973) b!553559))

(assert (= (and b!553559 res!345970) b!553562))

(assert (= (and b!553562 res!345971) b!553558))

(assert (= (and b!553558 res!345969) b!553554))

(assert (= (and b!553554 res!345965) b!553561))

(assert (= (and b!553561 res!345967) b!553556))

(assert (= (and b!553556 res!345968) b!553557))

(assert (= (and b!553557 res!345974) b!553555))

(assert (= (and b!553555 res!345972) b!553553))

(assert (= (and b!553553 res!345966) b!553560))

(declare-fun m!530655 () Bool)

(assert (=> b!553562 m!530655))

(assert (=> b!553562 m!530655))

(declare-fun m!530657 () Bool)

(assert (=> b!553562 m!530657))

(declare-fun m!530659 () Bool)

(assert (=> start!50642 m!530659))

(declare-fun m!530661 () Bool)

(assert (=> start!50642 m!530661))

(declare-fun m!530663 () Bool)

(assert (=> b!553556 m!530663))

(declare-fun m!530665 () Bool)

(assert (=> b!553558 m!530665))

(declare-fun m!530667 () Bool)

(assert (=> b!553554 m!530667))

(declare-fun m!530669 () Bool)

(assert (=> b!553553 m!530669))

(assert (=> b!553553 m!530655))

(declare-fun m!530671 () Bool)

(assert (=> b!553553 m!530671))

(declare-fun m!530673 () Bool)

(assert (=> b!553553 m!530673))

(declare-fun m!530675 () Bool)

(assert (=> b!553557 m!530675))

(assert (=> b!553555 m!530655))

(declare-fun m!530677 () Bool)

(assert (=> b!553555 m!530677))

(assert (=> b!553555 m!530655))

(declare-fun m!530679 () Bool)

(assert (=> b!553555 m!530679))

(assert (=> b!553555 m!530655))

(declare-fun m!530681 () Bool)

(assert (=> b!553555 m!530681))

(assert (=> b!553555 m!530681))

(declare-fun m!530683 () Bool)

(assert (=> b!553555 m!530683))

(declare-fun m!530685 () Bool)

(assert (=> b!553555 m!530685))

(assert (=> b!553555 m!530681))

(declare-fun m!530687 () Bool)

(assert (=> b!553555 m!530687))

(declare-fun m!530689 () Bool)

(assert (=> b!553561 m!530689))

(assert (=> b!553560 m!530655))

(assert (=> b!553560 m!530655))

(declare-fun m!530691 () Bool)

(assert (=> b!553560 m!530691))

(push 1)

(assert (not b!553553))

(assert (not b!553556))

(assert (not b!553554))

(assert (not b!553557))

(assert (not b!553561))

(assert (not b!553558))

(assert (not b!553562))

(assert (not b!553555))

(assert (not b!553560))

(assert (not start!50642))

(check-sat)

(pop 1)

