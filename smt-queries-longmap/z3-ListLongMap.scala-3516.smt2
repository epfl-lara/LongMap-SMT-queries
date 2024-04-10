; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48668 () Bool)

(assert start!48668)

(declare-fun res!329927 () Bool)

(declare-fun e!310795 () Bool)

(assert (=> start!48668 (=> (not res!329927) (not e!310795))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48668 (= res!329927 (validMask!0 mask!3216))))

(assert (=> start!48668 e!310795))

(assert (=> start!48668 true))

(declare-datatypes ((array!33880 0))(
  ( (array!33881 (arr!16279 (Array (_ BitVec 32) (_ BitVec 64))) (size!16643 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33880)

(declare-fun array_inv!12075 (array!33880) Bool)

(assert (=> start!48668 (array_inv!12075 a!3154)))

(declare-fun b!534716 () Bool)

(declare-fun res!329930 () Bool)

(declare-fun e!310797 () Bool)

(assert (=> b!534716 (=> (not res!329930) (not e!310797))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4737 0))(
  ( (MissingZero!4737 (index!21172 (_ BitVec 32))) (Found!4737 (index!21173 (_ BitVec 32))) (Intermediate!4737 (undefined!5549 Bool) (index!21174 (_ BitVec 32)) (x!50128 (_ BitVec 32))) (Undefined!4737) (MissingVacant!4737 (index!21175 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33880 (_ BitVec 32)) SeekEntryResult!4737)

(assert (=> b!534716 (= res!329930 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16279 a!3154) j!147) a!3154 mask!3216) (Intermediate!4737 false resIndex!32 resX!32)))))

(declare-fun b!534717 () Bool)

(assert (=> b!534717 (= e!310795 e!310797)))

(declare-fun res!329924 () Bool)

(assert (=> b!534717 (=> (not res!329924) (not e!310797))))

(declare-fun lt!245688 () SeekEntryResult!4737)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534717 (= res!329924 (or (= lt!245688 (MissingZero!4737 i!1153)) (= lt!245688 (MissingVacant!4737 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33880 (_ BitVec 32)) SeekEntryResult!4737)

(assert (=> b!534717 (= lt!245688 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!534718 () Bool)

(declare-fun res!329925 () Bool)

(assert (=> b!534718 (=> (not res!329925) (not e!310797))))

(declare-datatypes ((List!10398 0))(
  ( (Nil!10395) (Cons!10394 (h!11337 (_ BitVec 64)) (t!16626 List!10398)) )
))
(declare-fun arrayNoDuplicates!0 (array!33880 (_ BitVec 32) List!10398) Bool)

(assert (=> b!534718 (= res!329925 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10395))))

(declare-fun b!534719 () Bool)

(declare-fun res!329921 () Bool)

(assert (=> b!534719 (=> (not res!329921) (not e!310797))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33880 (_ BitVec 32)) Bool)

(assert (=> b!534719 (= res!329921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534720 () Bool)

(declare-fun res!329926 () Bool)

(assert (=> b!534720 (=> (not res!329926) (not e!310797))))

(assert (=> b!534720 (= res!329926 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16643 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16643 a!3154)) (= (select (arr!16279 a!3154) resIndex!32) (select (arr!16279 a!3154) j!147))))))

(declare-fun b!534721 () Bool)

(declare-fun res!329922 () Bool)

(assert (=> b!534721 (=> (not res!329922) (not e!310795))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534721 (= res!329922 (validKeyInArray!0 (select (arr!16279 a!3154) j!147)))))

(declare-fun b!534722 () Bool)

(assert (=> b!534722 (= e!310797 false)))

(declare-fun lt!245689 () SeekEntryResult!4737)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534722 (= lt!245689 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16279 a!3154) j!147) mask!3216) (select (arr!16279 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534723 () Bool)

(declare-fun res!329929 () Bool)

(assert (=> b!534723 (=> (not res!329929) (not e!310795))))

(assert (=> b!534723 (= res!329929 (and (= (size!16643 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16643 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16643 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534724 () Bool)

(declare-fun res!329928 () Bool)

(assert (=> b!534724 (=> (not res!329928) (not e!310795))))

(declare-fun arrayContainsKey!0 (array!33880 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534724 (= res!329928 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534725 () Bool)

(declare-fun res!329923 () Bool)

(assert (=> b!534725 (=> (not res!329923) (not e!310795))))

(assert (=> b!534725 (= res!329923 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48668 res!329927) b!534723))

(assert (= (and b!534723 res!329929) b!534721))

(assert (= (and b!534721 res!329922) b!534725))

(assert (= (and b!534725 res!329923) b!534724))

(assert (= (and b!534724 res!329928) b!534717))

(assert (= (and b!534717 res!329924) b!534719))

(assert (= (and b!534719 res!329921) b!534718))

(assert (= (and b!534718 res!329925) b!534720))

(assert (= (and b!534720 res!329926) b!534716))

(assert (= (and b!534716 res!329930) b!534722))

(declare-fun m!514397 () Bool)

(assert (=> b!534719 m!514397))

(declare-fun m!514399 () Bool)

(assert (=> b!534721 m!514399))

(assert (=> b!534721 m!514399))

(declare-fun m!514401 () Bool)

(assert (=> b!534721 m!514401))

(declare-fun m!514403 () Bool)

(assert (=> b!534720 m!514403))

(assert (=> b!534720 m!514399))

(declare-fun m!514405 () Bool)

(assert (=> start!48668 m!514405))

(declare-fun m!514407 () Bool)

(assert (=> start!48668 m!514407))

(assert (=> b!534716 m!514399))

(assert (=> b!534716 m!514399))

(declare-fun m!514409 () Bool)

(assert (=> b!534716 m!514409))

(declare-fun m!514411 () Bool)

(assert (=> b!534724 m!514411))

(declare-fun m!514413 () Bool)

(assert (=> b!534717 m!514413))

(declare-fun m!514415 () Bool)

(assert (=> b!534718 m!514415))

(assert (=> b!534722 m!514399))

(assert (=> b!534722 m!514399))

(declare-fun m!514417 () Bool)

(assert (=> b!534722 m!514417))

(assert (=> b!534722 m!514417))

(assert (=> b!534722 m!514399))

(declare-fun m!514419 () Bool)

(assert (=> b!534722 m!514419))

(declare-fun m!514421 () Bool)

(assert (=> b!534725 m!514421))

(check-sat (not b!534722) (not b!534718) (not b!534725) (not b!534719) (not b!534724) (not b!534717) (not b!534721) (not b!534716) (not start!48668))
(check-sat)
