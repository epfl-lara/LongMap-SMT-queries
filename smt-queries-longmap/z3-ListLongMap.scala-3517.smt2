; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48664 () Bool)

(assert start!48664)

(declare-fun b!534715 () Bool)

(declare-fun res!329979 () Bool)

(declare-fun e!310775 () Bool)

(assert (=> b!534715 (=> (not res!329979) (not e!310775))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534715 (= res!329979 (validKeyInArray!0 k0!1998))))

(declare-fun res!329974 () Bool)

(assert (=> start!48664 (=> (not res!329974) (not e!310775))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48664 (= res!329974 (validMask!0 mask!3216))))

(assert (=> start!48664 e!310775))

(assert (=> start!48664 true))

(declare-datatypes ((array!33875 0))(
  ( (array!33876 (arr!16276 (Array (_ BitVec 32) (_ BitVec 64))) (size!16640 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33875)

(declare-fun array_inv!12135 (array!33875) Bool)

(assert (=> start!48664 (array_inv!12135 a!3154)))

(declare-fun b!534716 () Bool)

(declare-fun res!329977 () Bool)

(declare-fun e!310774 () Bool)

(assert (=> b!534716 (=> (not res!329977) (not e!310774))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4690 0))(
  ( (MissingZero!4690 (index!20984 (_ BitVec 32))) (Found!4690 (index!20985 (_ BitVec 32))) (Intermediate!4690 (undefined!5502 Bool) (index!20986 (_ BitVec 32)) (x!50086 (_ BitVec 32))) (Undefined!4690) (MissingVacant!4690 (index!20987 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33875 (_ BitVec 32)) SeekEntryResult!4690)

(assert (=> b!534716 (= res!329977 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16276 a!3154) j!147) a!3154 mask!3216) (Intermediate!4690 false resIndex!32 resX!32)))))

(declare-fun b!534717 () Bool)

(declare-fun res!329976 () Bool)

(assert (=> b!534717 (=> (not res!329976) (not e!310774))))

(assert (=> b!534717 (= res!329976 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16640 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16640 a!3154)) (= (select (arr!16276 a!3154) resIndex!32) (select (arr!16276 a!3154) j!147))))))

(declare-fun b!534718 () Bool)

(declare-fun res!329978 () Bool)

(assert (=> b!534718 (=> (not res!329978) (not e!310775))))

(assert (=> b!534718 (= res!329978 (validKeyInArray!0 (select (arr!16276 a!3154) j!147)))))

(declare-fun b!534719 () Bool)

(declare-fun res!329975 () Bool)

(assert (=> b!534719 (=> (not res!329975) (not e!310774))))

(declare-datatypes ((List!10302 0))(
  ( (Nil!10299) (Cons!10298 (h!11241 (_ BitVec 64)) (t!16522 List!10302)) )
))
(declare-fun arrayNoDuplicates!0 (array!33875 (_ BitVec 32) List!10302) Bool)

(assert (=> b!534719 (= res!329975 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10299))))

(declare-fun b!534720 () Bool)

(declare-fun res!329982 () Bool)

(assert (=> b!534720 (=> (not res!329982) (not e!310775))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534720 (= res!329982 (and (= (size!16640 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16640 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16640 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534721 () Bool)

(declare-fun res!329983 () Bool)

(assert (=> b!534721 (=> (not res!329983) (not e!310775))))

(declare-fun arrayContainsKey!0 (array!33875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534721 (= res!329983 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534722 () Bool)

(declare-fun res!329980 () Bool)

(assert (=> b!534722 (=> (not res!329980) (not e!310774))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33875 (_ BitVec 32)) Bool)

(assert (=> b!534722 (= res!329980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534723 () Bool)

(assert (=> b!534723 (= e!310774 false)))

(declare-fun lt!245712 () SeekEntryResult!4690)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534723 (= lt!245712 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16276 a!3154) j!147) mask!3216) (select (arr!16276 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534724 () Bool)

(assert (=> b!534724 (= e!310775 e!310774)))

(declare-fun res!329981 () Bool)

(assert (=> b!534724 (=> (not res!329981) (not e!310774))))

(declare-fun lt!245713 () SeekEntryResult!4690)

(assert (=> b!534724 (= res!329981 (or (= lt!245713 (MissingZero!4690 i!1153)) (= lt!245713 (MissingVacant!4690 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33875 (_ BitVec 32)) SeekEntryResult!4690)

(assert (=> b!534724 (= lt!245713 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(assert (= (and start!48664 res!329974) b!534720))

(assert (= (and b!534720 res!329982) b!534718))

(assert (= (and b!534718 res!329978) b!534715))

(assert (= (and b!534715 res!329979) b!534721))

(assert (= (and b!534721 res!329983) b!534724))

(assert (= (and b!534724 res!329981) b!534722))

(assert (= (and b!534722 res!329980) b!534719))

(assert (= (and b!534719 res!329975) b!534717))

(assert (= (and b!534717 res!329976) b!534716))

(assert (= (and b!534716 res!329977) b!534723))

(declare-fun m!514633 () Bool)

(assert (=> start!48664 m!514633))

(declare-fun m!514635 () Bool)

(assert (=> start!48664 m!514635))

(declare-fun m!514637 () Bool)

(assert (=> b!534718 m!514637))

(assert (=> b!534718 m!514637))

(declare-fun m!514639 () Bool)

(assert (=> b!534718 m!514639))

(assert (=> b!534723 m!514637))

(assert (=> b!534723 m!514637))

(declare-fun m!514641 () Bool)

(assert (=> b!534723 m!514641))

(assert (=> b!534723 m!514641))

(assert (=> b!534723 m!514637))

(declare-fun m!514643 () Bool)

(assert (=> b!534723 m!514643))

(declare-fun m!514645 () Bool)

(assert (=> b!534715 m!514645))

(declare-fun m!514647 () Bool)

(assert (=> b!534721 m!514647))

(declare-fun m!514649 () Bool)

(assert (=> b!534719 m!514649))

(declare-fun m!514651 () Bool)

(assert (=> b!534722 m!514651))

(assert (=> b!534716 m!514637))

(assert (=> b!534716 m!514637))

(declare-fun m!514653 () Bool)

(assert (=> b!534716 m!514653))

(declare-fun m!514655 () Bool)

(assert (=> b!534717 m!514655))

(assert (=> b!534717 m!514637))

(declare-fun m!514657 () Bool)

(assert (=> b!534724 m!514657))

(check-sat (not b!534718) (not b!534722) (not b!534719) (not b!534716) (not start!48664) (not b!534715) (not b!534723) (not b!534721) (not b!534724))
(check-sat)
