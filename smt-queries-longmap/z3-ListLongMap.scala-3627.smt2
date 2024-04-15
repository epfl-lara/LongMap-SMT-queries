; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50036 () Bool)

(assert start!50036)

(declare-fun b!548127 () Bool)

(declare-fun res!341594 () Bool)

(declare-fun e!316671 () Bool)

(assert (=> b!548127 (=> (not res!341594) (not e!316671))))

(declare-datatypes ((array!34582 0))(
  ( (array!34583 (arr!16610 (Array (_ BitVec 32) (_ BitVec 64))) (size!16975 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34582)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34582 (_ BitVec 32)) Bool)

(assert (=> b!548127 (= res!341594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!548128 () Bool)

(declare-fun res!341593 () Bool)

(declare-fun e!316670 () Bool)

(assert (=> b!548128 (=> (not res!341593) (not e!316670))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548128 (= res!341593 (validKeyInArray!0 k0!1914))))

(declare-fun b!548129 () Bool)

(declare-fun res!341595 () Bool)

(assert (=> b!548129 (=> (not res!341595) (not e!316670))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!548129 (= res!341595 (validKeyInArray!0 (select (arr!16610 a!3118) j!142)))))

(declare-fun res!341597 () Bool)

(assert (=> start!50036 (=> (not res!341597) (not e!316670))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50036 (= res!341597 (validMask!0 mask!3119))))

(assert (=> start!50036 e!316670))

(assert (=> start!50036 true))

(declare-fun array_inv!12493 (array!34582) Bool)

(assert (=> start!50036 (array_inv!12493 a!3118)))

(declare-fun b!548130 () Bool)

(assert (=> b!548130 (= e!316670 e!316671)))

(declare-fun res!341596 () Bool)

(assert (=> b!548130 (=> (not res!341596) (not e!316671))))

(declare-datatypes ((SeekEntryResult!5056 0))(
  ( (MissingZero!5056 (index!22451 (_ BitVec 32))) (Found!5056 (index!22452 (_ BitVec 32))) (Intermediate!5056 (undefined!5868 Bool) (index!22453 (_ BitVec 32)) (x!51402 (_ BitVec 32))) (Undefined!5056) (MissingVacant!5056 (index!22454 (_ BitVec 32))) )
))
(declare-fun lt!249598 () SeekEntryResult!5056)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548130 (= res!341596 (or (= lt!249598 (MissingZero!5056 i!1132)) (= lt!249598 (MissingVacant!5056 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34582 (_ BitVec 32)) SeekEntryResult!5056)

(assert (=> b!548130 (= lt!249598 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!548131 () Bool)

(declare-fun res!341591 () Bool)

(assert (=> b!548131 (=> (not res!341591) (not e!316670))))

(declare-fun arrayContainsKey!0 (array!34582 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548131 (= res!341591 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!548132 () Bool)

(declare-fun res!341590 () Bool)

(assert (=> b!548132 (=> (not res!341590) (not e!316671))))

(declare-datatypes ((List!10729 0))(
  ( (Nil!10726) (Cons!10725 (h!11695 (_ BitVec 64)) (t!16948 List!10729)) )
))
(declare-fun arrayNoDuplicates!0 (array!34582 (_ BitVec 32) List!10729) Bool)

(assert (=> b!548132 (= res!341590 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10726))))

(declare-fun b!548133 () Bool)

(declare-fun res!341592 () Bool)

(assert (=> b!548133 (=> (not res!341592) (not e!316670))))

(assert (=> b!548133 (= res!341592 (and (= (size!16975 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16975 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16975 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548134 () Bool)

(assert (=> b!548134 (= e!316671 false)))

(declare-fun lt!249597 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548134 (= lt!249597 (toIndex!0 (select (arr!16610 a!3118) j!142) mask!3119))))

(assert (= (and start!50036 res!341597) b!548133))

(assert (= (and b!548133 res!341592) b!548129))

(assert (= (and b!548129 res!341595) b!548128))

(assert (= (and b!548128 res!341593) b!548131))

(assert (= (and b!548131 res!341591) b!548130))

(assert (= (and b!548130 res!341596) b!548127))

(assert (= (and b!548127 res!341594) b!548132))

(assert (= (and b!548132 res!341590) b!548134))

(declare-fun m!524651 () Bool)

(assert (=> b!548134 m!524651))

(assert (=> b!548134 m!524651))

(declare-fun m!524653 () Bool)

(assert (=> b!548134 m!524653))

(declare-fun m!524655 () Bool)

(assert (=> b!548128 m!524655))

(declare-fun m!524657 () Bool)

(assert (=> b!548130 m!524657))

(declare-fun m!524659 () Bool)

(assert (=> b!548132 m!524659))

(declare-fun m!524661 () Bool)

(assert (=> b!548127 m!524661))

(declare-fun m!524663 () Bool)

(assert (=> start!50036 m!524663))

(declare-fun m!524665 () Bool)

(assert (=> start!50036 m!524665))

(declare-fun m!524667 () Bool)

(assert (=> b!548131 m!524667))

(assert (=> b!548129 m!524651))

(assert (=> b!548129 m!524651))

(declare-fun m!524669 () Bool)

(assert (=> b!548129 m!524669))

(check-sat (not b!548131) (not b!548132) (not b!548127) (not b!548134) (not b!548130) (not b!548129) (not start!50036) (not b!548128))
(check-sat)
