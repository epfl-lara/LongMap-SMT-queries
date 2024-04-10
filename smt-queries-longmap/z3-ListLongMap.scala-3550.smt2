; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48872 () Bool)

(assert start!48872)

(declare-fun res!333695 () Bool)

(declare-fun e!312248 () Bool)

(assert (=> start!48872 (=> (not res!333695) (not e!312248))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48872 (= res!333695 (validMask!0 mask!3216))))

(assert (=> start!48872 e!312248))

(assert (=> start!48872 true))

(declare-datatypes ((array!34084 0))(
  ( (array!34085 (arr!16381 (Array (_ BitVec 32) (_ BitVec 64))) (size!16745 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34084)

(declare-fun array_inv!12177 (array!34084) Bool)

(assert (=> start!48872 (array_inv!12177 a!3154)))

(declare-fun b!538484 () Bool)

(declare-fun res!333692 () Bool)

(declare-fun e!312249 () Bool)

(assert (=> b!538484 (=> (not res!333692) (not e!312249))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!538484 (= res!333692 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16745 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16745 a!3154)) (= (select (arr!16381 a!3154) resIndex!32) (select (arr!16381 a!3154) j!147))))))

(declare-fun b!538485 () Bool)

(assert (=> b!538485 (= e!312248 e!312249)))

(declare-fun res!333698 () Bool)

(assert (=> b!538485 (=> (not res!333698) (not e!312249))))

(declare-datatypes ((SeekEntryResult!4839 0))(
  ( (MissingZero!4839 (index!21580 (_ BitVec 32))) (Found!4839 (index!21581 (_ BitVec 32))) (Intermediate!4839 (undefined!5651 Bool) (index!21582 (_ BitVec 32)) (x!50502 (_ BitVec 32))) (Undefined!4839) (MissingVacant!4839 (index!21583 (_ BitVec 32))) )
))
(declare-fun lt!246799 () SeekEntryResult!4839)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538485 (= res!333698 (or (= lt!246799 (MissingZero!4839 i!1153)) (= lt!246799 (MissingVacant!4839 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34084 (_ BitVec 32)) SeekEntryResult!4839)

(assert (=> b!538485 (= lt!246799 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!538486 () Bool)

(declare-fun e!312247 () Bool)

(declare-fun e!312252 () Bool)

(assert (=> b!538486 (= e!312247 e!312252)))

(declare-fun res!333694 () Bool)

(assert (=> b!538486 (=> (not res!333694) (not e!312252))))

(declare-fun lt!246793 () SeekEntryResult!4839)

(declare-fun lt!246798 () SeekEntryResult!4839)

(assert (=> b!538486 (= res!333694 (and (= lt!246798 lt!246793) (not (= (select (arr!16381 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16381 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16381 a!3154) index!1177) (select (arr!16381 a!3154) j!147)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34084 (_ BitVec 32)) SeekEntryResult!4839)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538486 (= lt!246798 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16381 a!3154) j!147) mask!3216) (select (arr!16381 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538487 () Bool)

(declare-fun e!312246 () Bool)

(assert (=> b!538487 (= e!312252 e!312246)))

(declare-fun res!333700 () Bool)

(assert (=> b!538487 (=> (not res!333700) (not e!312246))))

(declare-fun lt!246795 () (_ BitVec 32))

(assert (=> b!538487 (= res!333700 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246795 #b00000000000000000000000000000000) (bvslt lt!246795 (size!16745 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538487 (= lt!246795 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!538488 () Bool)

(declare-fun e!312250 () Bool)

(assert (=> b!538488 (= e!312246 e!312250)))

(declare-fun res!333701 () Bool)

(assert (=> b!538488 (=> (not res!333701) (not e!312250))))

(declare-fun lt!246797 () SeekEntryResult!4839)

(declare-fun lt!246796 () SeekEntryResult!4839)

(assert (=> b!538488 (= res!333701 (and (= lt!246796 lt!246797) (= lt!246798 lt!246796)))))

(assert (=> b!538488 (= lt!246796 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246795 (select (arr!16381 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538489 () Bool)

(declare-fun res!333691 () Bool)

(assert (=> b!538489 (=> (not res!333691) (not e!312248))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538489 (= res!333691 (validKeyInArray!0 k0!1998))))

(declare-fun b!538490 () Bool)

(assert (=> b!538490 (= e!312250 (not true))))

(assert (=> b!538490 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246795 (select (store (arr!16381 a!3154) i!1153 k0!1998) j!147) (array!34085 (store (arr!16381 a!3154) i!1153 k0!1998) (size!16745 a!3154)) mask!3216) lt!246797)))

(declare-datatypes ((Unit!16862 0))(
  ( (Unit!16863) )
))
(declare-fun lt!246794 () Unit!16862)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34084 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16862)

(assert (=> b!538490 (= lt!246794 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!246795 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!538491 () Bool)

(declare-fun res!333697 () Bool)

(assert (=> b!538491 (=> (not res!333697) (not e!312249))))

(declare-datatypes ((List!10500 0))(
  ( (Nil!10497) (Cons!10496 (h!11439 (_ BitVec 64)) (t!16728 List!10500)) )
))
(declare-fun arrayNoDuplicates!0 (array!34084 (_ BitVec 32) List!10500) Bool)

(assert (=> b!538491 (= res!333697 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10497))))

(declare-fun b!538492 () Bool)

(declare-fun res!333690 () Bool)

(assert (=> b!538492 (=> (not res!333690) (not e!312248))))

(assert (=> b!538492 (= res!333690 (and (= (size!16745 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16745 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16745 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538493 () Bool)

(assert (=> b!538493 (= e!312249 e!312247)))

(declare-fun res!333693 () Bool)

(assert (=> b!538493 (=> (not res!333693) (not e!312247))))

(assert (=> b!538493 (= res!333693 (= lt!246793 lt!246797))))

(assert (=> b!538493 (= lt!246797 (Intermediate!4839 false resIndex!32 resX!32))))

(assert (=> b!538493 (= lt!246793 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16381 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538494 () Bool)

(declare-fun res!333699 () Bool)

(assert (=> b!538494 (=> (not res!333699) (not e!312249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34084 (_ BitVec 32)) Bool)

(assert (=> b!538494 (= res!333699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538495 () Bool)

(declare-fun res!333689 () Bool)

(assert (=> b!538495 (=> (not res!333689) (not e!312248))))

(declare-fun arrayContainsKey!0 (array!34084 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538495 (= res!333689 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538496 () Bool)

(declare-fun res!333696 () Bool)

(assert (=> b!538496 (=> (not res!333696) (not e!312248))))

(assert (=> b!538496 (= res!333696 (validKeyInArray!0 (select (arr!16381 a!3154) j!147)))))

(assert (= (and start!48872 res!333695) b!538492))

(assert (= (and b!538492 res!333690) b!538496))

(assert (= (and b!538496 res!333696) b!538489))

(assert (= (and b!538489 res!333691) b!538495))

(assert (= (and b!538495 res!333689) b!538485))

(assert (= (and b!538485 res!333698) b!538494))

(assert (= (and b!538494 res!333699) b!538491))

(assert (= (and b!538491 res!333697) b!538484))

(assert (= (and b!538484 res!333692) b!538493))

(assert (= (and b!538493 res!333693) b!538486))

(assert (= (and b!538486 res!333694) b!538487))

(assert (= (and b!538487 res!333700) b!538488))

(assert (= (and b!538488 res!333701) b!538490))

(declare-fun m!517585 () Bool)

(assert (=> b!538494 m!517585))

(declare-fun m!517587 () Bool)

(assert (=> b!538488 m!517587))

(assert (=> b!538488 m!517587))

(declare-fun m!517589 () Bool)

(assert (=> b!538488 m!517589))

(declare-fun m!517591 () Bool)

(assert (=> b!538485 m!517591))

(declare-fun m!517593 () Bool)

(assert (=> b!538484 m!517593))

(assert (=> b!538484 m!517587))

(assert (=> b!538493 m!517587))

(assert (=> b!538493 m!517587))

(declare-fun m!517595 () Bool)

(assert (=> b!538493 m!517595))

(declare-fun m!517597 () Bool)

(assert (=> b!538495 m!517597))

(declare-fun m!517599 () Bool)

(assert (=> start!48872 m!517599))

(declare-fun m!517601 () Bool)

(assert (=> start!48872 m!517601))

(declare-fun m!517603 () Bool)

(assert (=> b!538491 m!517603))

(declare-fun m!517605 () Bool)

(assert (=> b!538487 m!517605))

(declare-fun m!517607 () Bool)

(assert (=> b!538486 m!517607))

(assert (=> b!538486 m!517587))

(assert (=> b!538486 m!517587))

(declare-fun m!517609 () Bool)

(assert (=> b!538486 m!517609))

(assert (=> b!538486 m!517609))

(assert (=> b!538486 m!517587))

(declare-fun m!517611 () Bool)

(assert (=> b!538486 m!517611))

(declare-fun m!517613 () Bool)

(assert (=> b!538490 m!517613))

(declare-fun m!517615 () Bool)

(assert (=> b!538490 m!517615))

(assert (=> b!538490 m!517615))

(declare-fun m!517617 () Bool)

(assert (=> b!538490 m!517617))

(declare-fun m!517619 () Bool)

(assert (=> b!538490 m!517619))

(declare-fun m!517621 () Bool)

(assert (=> b!538489 m!517621))

(assert (=> b!538496 m!517587))

(assert (=> b!538496 m!517587))

(declare-fun m!517623 () Bool)

(assert (=> b!538496 m!517623))

(check-sat (not b!538494) (not b!538486) (not b!538489) (not b!538487) (not b!538490) (not b!538493) (not b!538496) (not b!538485) (not b!538495) (not b!538491) (not b!538488) (not start!48872))
(check-sat)
