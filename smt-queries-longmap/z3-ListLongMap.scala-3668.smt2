; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50670 () Bool)

(assert start!50670)

(declare-fun b!553474 () Bool)

(declare-fun res!345789 () Bool)

(declare-fun e!319302 () Bool)

(assert (=> b!553474 (=> (not res!345789) (not e!319302))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34842 0))(
  ( (array!34843 (arr!16729 (Array (_ BitVec 32) (_ BitVec 64))) (size!17093 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34842)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!553474 (= res!345789 (and (= (size!17093 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17093 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17093 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553475 () Bool)

(declare-fun e!319304 () Bool)

(declare-datatypes ((SeekEntryResult!5134 0))(
  ( (MissingZero!5134 (index!22763 (_ BitVec 32))) (Found!5134 (index!22764 (_ BitVec 32))) (Intermediate!5134 (undefined!5946 Bool) (index!22765 (_ BitVec 32)) (x!51843 (_ BitVec 32))) (Undefined!5134) (MissingVacant!5134 (index!22766 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34842 (_ BitVec 32)) SeekEntryResult!5134)

(assert (=> b!553475 (= e!319304 (= (seekEntryOrOpen!0 (select (arr!16729 a!3118) j!142) a!3118 mask!3119) (Found!5134 j!142)))))

(declare-fun b!553476 () Bool)

(declare-fun res!345788 () Bool)

(declare-fun e!319303 () Bool)

(assert (=> b!553476 (=> (not res!345788) (not e!319303))))

(declare-datatypes ((List!10716 0))(
  ( (Nil!10713) (Cons!10712 (h!11700 (_ BitVec 64)) (t!16936 List!10716)) )
))
(declare-fun arrayNoDuplicates!0 (array!34842 (_ BitVec 32) List!10716) Bool)

(assert (=> b!553476 (= res!345788 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10713))))

(declare-fun b!553477 () Bool)

(declare-fun res!345787 () Bool)

(assert (=> b!553477 (=> (not res!345787) (not e!319302))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553477 (= res!345787 (validKeyInArray!0 (select (arr!16729 a!3118) j!142)))))

(declare-fun res!345785 () Bool)

(assert (=> start!50670 (=> (not res!345785) (not e!319302))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50670 (= res!345785 (validMask!0 mask!3119))))

(assert (=> start!50670 e!319302))

(assert (=> start!50670 true))

(declare-fun array_inv!12588 (array!34842) Bool)

(assert (=> start!50670 (array_inv!12588 a!3118)))

(declare-fun b!553478 () Bool)

(declare-fun res!345782 () Bool)

(assert (=> b!553478 (=> (not res!345782) (not e!319302))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!553478 (= res!345782 (validKeyInArray!0 k0!1914))))

(declare-fun b!553479 () Bool)

(assert (=> b!553479 (= e!319302 e!319303)))

(declare-fun res!345790 () Bool)

(assert (=> b!553479 (=> (not res!345790) (not e!319303))))

(declare-fun lt!251539 () SeekEntryResult!5134)

(assert (=> b!553479 (= res!345790 (or (= lt!251539 (MissingZero!5134 i!1132)) (= lt!251539 (MissingVacant!5134 i!1132))))))

(assert (=> b!553479 (= lt!251539 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!553480 () Bool)

(declare-fun res!345783 () Bool)

(assert (=> b!553480 (=> (not res!345783) (not e!319303))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34842 (_ BitVec 32)) SeekEntryResult!5134)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553480 (= res!345783 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16729 a!3118) j!142) mask!3119) (select (arr!16729 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16729 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16729 a!3118) i!1132 k0!1914) j!142) (array!34843 (store (arr!16729 a!3118) i!1132 k0!1914) (size!17093 a!3118)) mask!3119)))))

(declare-fun b!553481 () Bool)

(assert (=> b!553481 (= e!319303 (not true))))

(assert (=> b!553481 e!319304))

(declare-fun res!345784 () Bool)

(assert (=> b!553481 (=> (not res!345784) (not e!319304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34842 (_ BitVec 32)) Bool)

(assert (=> b!553481 (= res!345784 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17113 0))(
  ( (Unit!17114) )
))
(declare-fun lt!251538 () Unit!17113)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34842 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17113)

(assert (=> b!553481 (= lt!251538 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553482 () Bool)

(declare-fun res!345781 () Bool)

(assert (=> b!553482 (=> (not res!345781) (not e!319303))))

(assert (=> b!553482 (= res!345781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553483 () Bool)

(declare-fun res!345786 () Bool)

(assert (=> b!553483 (=> (not res!345786) (not e!319302))))

(declare-fun arrayContainsKey!0 (array!34842 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553483 (= res!345786 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50670 res!345785) b!553474))

(assert (= (and b!553474 res!345789) b!553477))

(assert (= (and b!553477 res!345787) b!553478))

(assert (= (and b!553478 res!345782) b!553483))

(assert (= (and b!553483 res!345786) b!553479))

(assert (= (and b!553479 res!345790) b!553482))

(assert (= (and b!553482 res!345781) b!553476))

(assert (= (and b!553476 res!345788) b!553480))

(assert (= (and b!553480 res!345783) b!553481))

(assert (= (and b!553481 res!345784) b!553475))

(declare-fun m!530663 () Bool)

(assert (=> b!553477 m!530663))

(assert (=> b!553477 m!530663))

(declare-fun m!530665 () Bool)

(assert (=> b!553477 m!530665))

(declare-fun m!530667 () Bool)

(assert (=> b!553479 m!530667))

(declare-fun m!530669 () Bool)

(assert (=> b!553476 m!530669))

(declare-fun m!530671 () Bool)

(assert (=> start!50670 m!530671))

(declare-fun m!530673 () Bool)

(assert (=> start!50670 m!530673))

(assert (=> b!553480 m!530663))

(declare-fun m!530675 () Bool)

(assert (=> b!553480 m!530675))

(assert (=> b!553480 m!530663))

(declare-fun m!530677 () Bool)

(assert (=> b!553480 m!530677))

(declare-fun m!530679 () Bool)

(assert (=> b!553480 m!530679))

(assert (=> b!553480 m!530677))

(declare-fun m!530681 () Bool)

(assert (=> b!553480 m!530681))

(assert (=> b!553480 m!530675))

(assert (=> b!553480 m!530663))

(declare-fun m!530683 () Bool)

(assert (=> b!553480 m!530683))

(declare-fun m!530685 () Bool)

(assert (=> b!553480 m!530685))

(assert (=> b!553480 m!530677))

(assert (=> b!553480 m!530679))

(declare-fun m!530687 () Bool)

(assert (=> b!553482 m!530687))

(declare-fun m!530689 () Bool)

(assert (=> b!553483 m!530689))

(declare-fun m!530691 () Bool)

(assert (=> b!553478 m!530691))

(assert (=> b!553475 m!530663))

(assert (=> b!553475 m!530663))

(declare-fun m!530693 () Bool)

(assert (=> b!553475 m!530693))

(declare-fun m!530695 () Bool)

(assert (=> b!553481 m!530695))

(declare-fun m!530697 () Bool)

(assert (=> b!553481 m!530697))

(check-sat (not b!553478) (not b!553475) (not b!553482) (not b!553483) (not b!553480) (not b!553481) (not b!553476) (not b!553477) (not b!553479) (not start!50670))
(check-sat)
