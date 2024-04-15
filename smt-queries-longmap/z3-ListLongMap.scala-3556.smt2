; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48894 () Bool)

(assert start!48894)

(declare-fun b!538765 () Bool)

(declare-fun res!334114 () Bool)

(declare-fun e!312359 () Bool)

(assert (=> b!538765 (=> (not res!334114) (not e!312359))))

(declare-datatypes ((array!34116 0))(
  ( (array!34117 (arr!16397 (Array (_ BitVec 32) (_ BitVec 64))) (size!16762 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34116)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34116 (_ BitVec 32)) Bool)

(assert (=> b!538765 (= res!334114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538766 () Bool)

(declare-fun e!312358 () Bool)

(assert (=> b!538766 (= e!312358 e!312359)))

(declare-fun res!334118 () Bool)

(assert (=> b!538766 (=> (not res!334118) (not e!312359))))

(declare-datatypes ((SeekEntryResult!4852 0))(
  ( (MissingZero!4852 (index!21632 (_ BitVec 32))) (Found!4852 (index!21633 (_ BitVec 32))) (Intermediate!4852 (undefined!5664 Bool) (index!21634 (_ BitVec 32)) (x!50558 (_ BitVec 32))) (Undefined!4852) (MissingVacant!4852 (index!21635 (_ BitVec 32))) )
))
(declare-fun lt!246816 () SeekEntryResult!4852)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538766 (= res!334118 (or (= lt!246816 (MissingZero!4852 i!1153)) (= lt!246816 (MissingVacant!4852 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34116 (_ BitVec 32)) SeekEntryResult!4852)

(assert (=> b!538766 (= lt!246816 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!538767 () Bool)

(declare-fun res!334117 () Bool)

(assert (=> b!538767 (=> (not res!334117) (not e!312358))))

(declare-fun arrayContainsKey!0 (array!34116 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538767 (= res!334117 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538768 () Bool)

(declare-fun res!334116 () Bool)

(assert (=> b!538768 (=> (not res!334116) (not e!312358))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538768 (= res!334116 (validKeyInArray!0 k0!1998))))

(declare-fun b!538769 () Bool)

(declare-fun res!334115 () Bool)

(assert (=> b!538769 (=> (not res!334115) (not e!312358))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!538769 (= res!334115 (and (= (size!16762 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16762 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16762 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538770 () Bool)

(declare-fun res!334112 () Bool)

(assert (=> b!538770 (=> (not res!334112) (not e!312358))))

(assert (=> b!538770 (= res!334112 (validKeyInArray!0 (select (arr!16397 a!3154) j!147)))))

(declare-fun res!334113 () Bool)

(assert (=> start!48894 (=> (not res!334113) (not e!312358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48894 (= res!334113 (validMask!0 mask!3216))))

(assert (=> start!48894 e!312358))

(assert (=> start!48894 true))

(declare-fun array_inv!12280 (array!34116) Bool)

(assert (=> start!48894 (array_inv!12280 a!3154)))

(declare-fun b!538771 () Bool)

(assert (=> b!538771 (= e!312359 false)))

(declare-fun lt!246817 () Bool)

(declare-datatypes ((List!10555 0))(
  ( (Nil!10552) (Cons!10551 (h!11494 (_ BitVec 64)) (t!16774 List!10555)) )
))
(declare-fun arrayNoDuplicates!0 (array!34116 (_ BitVec 32) List!10555) Bool)

(assert (=> b!538771 (= lt!246817 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10552))))

(assert (= (and start!48894 res!334113) b!538769))

(assert (= (and b!538769 res!334115) b!538770))

(assert (= (and b!538770 res!334112) b!538768))

(assert (= (and b!538768 res!334116) b!538767))

(assert (= (and b!538767 res!334117) b!538766))

(assert (= (and b!538766 res!334118) b!538765))

(assert (= (and b!538765 res!334114) b!538771))

(declare-fun m!517387 () Bool)

(assert (=> b!538771 m!517387))

(declare-fun m!517389 () Bool)

(assert (=> start!48894 m!517389))

(declare-fun m!517391 () Bool)

(assert (=> start!48894 m!517391))

(declare-fun m!517393 () Bool)

(assert (=> b!538767 m!517393))

(declare-fun m!517395 () Bool)

(assert (=> b!538766 m!517395))

(declare-fun m!517397 () Bool)

(assert (=> b!538770 m!517397))

(assert (=> b!538770 m!517397))

(declare-fun m!517399 () Bool)

(assert (=> b!538770 m!517399))

(declare-fun m!517401 () Bool)

(assert (=> b!538765 m!517401))

(declare-fun m!517403 () Bool)

(assert (=> b!538768 m!517403))

(check-sat (not b!538770) (not b!538765) (not b!538766) (not b!538768) (not b!538771) (not b!538767) (not start!48894))
(check-sat)
