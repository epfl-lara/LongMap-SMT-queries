; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48902 () Bool)

(assert start!48902)

(declare-fun b!538994 () Bool)

(declare-fun e!312516 () Bool)

(assert (=> b!538994 (= e!312516 false)))

(declare-fun lt!247039 () Bool)

(declare-datatypes ((array!34114 0))(
  ( (array!34115 (arr!16396 (Array (_ BitVec 32) (_ BitVec 64))) (size!16760 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34114)

(declare-datatypes ((List!10515 0))(
  ( (Nil!10512) (Cons!10511 (h!11454 (_ BitVec 64)) (t!16743 List!10515)) )
))
(declare-fun arrayNoDuplicates!0 (array!34114 (_ BitVec 32) List!10515) Bool)

(assert (=> b!538994 (= lt!247039 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10512))))

(declare-fun b!538995 () Bool)

(declare-fun res!334204 () Bool)

(assert (=> b!538995 (=> (not res!334204) (not e!312516))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34114 (_ BitVec 32)) Bool)

(assert (=> b!538995 (= res!334204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!334200 () Bool)

(declare-fun e!312515 () Bool)

(assert (=> start!48902 (=> (not res!334200) (not e!312515))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48902 (= res!334200 (validMask!0 mask!3216))))

(assert (=> start!48902 e!312515))

(assert (=> start!48902 true))

(declare-fun array_inv!12192 (array!34114) Bool)

(assert (=> start!48902 (array_inv!12192 a!3154)))

(declare-fun b!538996 () Bool)

(declare-fun res!334199 () Bool)

(assert (=> b!538996 (=> (not res!334199) (not e!312515))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34114 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538996 (= res!334199 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538997 () Bool)

(declare-fun res!334202 () Bool)

(assert (=> b!538997 (=> (not res!334202) (not e!312515))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538997 (= res!334202 (validKeyInArray!0 (select (arr!16396 a!3154) j!147)))))

(declare-fun b!538998 () Bool)

(assert (=> b!538998 (= e!312515 e!312516)))

(declare-fun res!334201 () Bool)

(assert (=> b!538998 (=> (not res!334201) (not e!312516))))

(declare-datatypes ((SeekEntryResult!4854 0))(
  ( (MissingZero!4854 (index!21640 (_ BitVec 32))) (Found!4854 (index!21641 (_ BitVec 32))) (Intermediate!4854 (undefined!5666 Bool) (index!21642 (_ BitVec 32)) (x!50557 (_ BitVec 32))) (Undefined!4854) (MissingVacant!4854 (index!21643 (_ BitVec 32))) )
))
(declare-fun lt!247038 () SeekEntryResult!4854)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538998 (= res!334201 (or (= lt!247038 (MissingZero!4854 i!1153)) (= lt!247038 (MissingVacant!4854 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34114 (_ BitVec 32)) SeekEntryResult!4854)

(assert (=> b!538998 (= lt!247038 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!538999 () Bool)

(declare-fun res!334205 () Bool)

(assert (=> b!538999 (=> (not res!334205) (not e!312515))))

(assert (=> b!538999 (= res!334205 (and (= (size!16760 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16760 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16760 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539000 () Bool)

(declare-fun res!334203 () Bool)

(assert (=> b!539000 (=> (not res!334203) (not e!312515))))

(assert (=> b!539000 (= res!334203 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48902 res!334200) b!538999))

(assert (= (and b!538999 res!334205) b!538997))

(assert (= (and b!538997 res!334202) b!539000))

(assert (= (and b!539000 res!334203) b!538996))

(assert (= (and b!538996 res!334199) b!538998))

(assert (= (and b!538998 res!334201) b!538995))

(assert (= (and b!538995 res!334204) b!538994))

(declare-fun m!518103 () Bool)

(assert (=> b!539000 m!518103))

(declare-fun m!518105 () Bool)

(assert (=> b!538994 m!518105))

(declare-fun m!518107 () Bool)

(assert (=> start!48902 m!518107))

(declare-fun m!518109 () Bool)

(assert (=> start!48902 m!518109))

(declare-fun m!518111 () Bool)

(assert (=> b!538995 m!518111))

(declare-fun m!518113 () Bool)

(assert (=> b!538996 m!518113))

(declare-fun m!518115 () Bool)

(assert (=> b!538998 m!518115))

(declare-fun m!518117 () Bool)

(assert (=> b!538997 m!518117))

(assert (=> b!538997 m!518117))

(declare-fun m!518119 () Bool)

(assert (=> b!538997 m!518119))

(check-sat (not b!538995) (not b!539000) (not b!538997) (not start!48902) (not b!538994) (not b!538998) (not b!538996))
(check-sat)
