; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87160 () Bool)

(assert start!87160)

(declare-fun b!1009551 () Bool)

(declare-fun e!568159 () Bool)

(declare-fun e!568163 () Bool)

(assert (=> b!1009551 (= e!568159 e!568163)))

(declare-fun res!677690 () Bool)

(assert (=> b!1009551 (=> (not res!677690) (not e!568163))))

(declare-datatypes ((SeekEntryResult!9496 0))(
  ( (MissingZero!9496 (index!40355 (_ BitVec 32))) (Found!9496 (index!40356 (_ BitVec 32))) (Intermediate!9496 (undefined!10308 Bool) (index!40357 (_ BitVec 32)) (x!87906 (_ BitVec 32))) (Undefined!9496) (MissingVacant!9496 (index!40358 (_ BitVec 32))) )
))
(declare-fun lt!446111 () SeekEntryResult!9496)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1009551 (= res!677690 (or (= lt!446111 (MissingVacant!9496 i!1194)) (= lt!446111 (MissingZero!9496 i!1194))))))

(declare-datatypes ((array!63627 0))(
  ( (array!63628 (arr!30628 (Array (_ BitVec 32) (_ BitVec 64))) (size!31131 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63627)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63627 (_ BitVec 32)) SeekEntryResult!9496)

(assert (=> b!1009551 (= lt!446111 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1009552 () Bool)

(declare-fun res!677693 () Bool)

(assert (=> b!1009552 (=> (not res!677693) (not e!568163))))

(declare-datatypes ((List!21275 0))(
  ( (Nil!21272) (Cons!21271 (h!22466 (_ BitVec 64)) (t!30268 List!21275)) )
))
(declare-fun arrayNoDuplicates!0 (array!63627 (_ BitVec 32) List!21275) Bool)

(assert (=> b!1009552 (= res!677693 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21272))))

(declare-fun b!1009553 () Bool)

(declare-fun res!677684 () Bool)

(assert (=> b!1009553 (=> (not res!677684) (not e!568159))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1009553 (= res!677684 (and (= (size!31131 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31131 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31131 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1009554 () Bool)

(declare-fun e!568160 () Bool)

(declare-fun e!568164 () Bool)

(assert (=> b!1009554 (= e!568160 e!568164)))

(declare-fun res!677691 () Bool)

(assert (=> b!1009554 (=> (not res!677691) (not e!568164))))

(declare-fun lt!446113 () SeekEntryResult!9496)

(declare-fun lt!446115 () SeekEntryResult!9496)

(assert (=> b!1009554 (= res!677691 (= lt!446113 lt!446115))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63627 (_ BitVec 32)) SeekEntryResult!9496)

(assert (=> b!1009554 (= lt!446113 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30628 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009555 () Bool)

(declare-fun e!568161 () Bool)

(assert (=> b!1009555 (= e!568164 e!568161)))

(declare-fun res!677686 () Bool)

(assert (=> b!1009555 (=> (not res!677686) (not e!568161))))

(declare-fun lt!446116 () (_ BitVec 64))

(declare-fun lt!446112 () array!63627)

(declare-fun lt!446117 () SeekEntryResult!9496)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009555 (= res!677686 (not (= lt!446117 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446116 mask!3464) lt!446116 lt!446112 mask!3464))))))

(assert (=> b!1009555 (= lt!446116 (select (store (arr!30628 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1009555 (= lt!446112 (array!63628 (store (arr!30628 a!3219) i!1194 k0!2224) (size!31131 a!3219)))))

(declare-fun res!677683 () Bool)

(assert (=> start!87160 (=> (not res!677683) (not e!568159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87160 (= res!677683 (validMask!0 mask!3464))))

(assert (=> start!87160 e!568159))

(declare-fun array_inv!23764 (array!63627) Bool)

(assert (=> start!87160 (array_inv!23764 a!3219)))

(assert (=> start!87160 true))

(declare-fun b!1009556 () Bool)

(declare-fun res!677689 () Bool)

(assert (=> b!1009556 (=> (not res!677689) (not e!568159))))

(declare-fun arrayContainsKey!0 (array!63627 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1009556 (= res!677689 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1009557 () Bool)

(declare-fun res!677695 () Bool)

(assert (=> b!1009557 (=> (not res!677695) (not e!568163))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63627 (_ BitVec 32)) Bool)

(assert (=> b!1009557 (= res!677695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1009558 () Bool)

(assert (=> b!1009558 (= e!568161 false)))

(declare-fun lt!446114 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009558 (= lt!446114 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1009559 () Bool)

(declare-fun res!677685 () Bool)

(assert (=> b!1009559 (=> (not res!677685) (not e!568163))))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1009559 (= res!677685 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31131 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31131 a!3219))))))

(declare-fun b!1009560 () Bool)

(declare-fun res!677687 () Bool)

(assert (=> b!1009560 (=> (not res!677687) (not e!568161))))

(assert (=> b!1009560 (= res!677687 (not (= lt!446113 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446116 lt!446112 mask!3464))))))

(declare-fun b!1009561 () Bool)

(declare-fun res!677692 () Bool)

(assert (=> b!1009561 (=> (not res!677692) (not e!568159))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1009561 (= res!677692 (validKeyInArray!0 k0!2224))))

(declare-fun b!1009562 () Bool)

(declare-fun res!677696 () Bool)

(assert (=> b!1009562 (=> (not res!677696) (not e!568161))))

(assert (=> b!1009562 (= res!677696 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1009563 () Bool)

(declare-fun res!677688 () Bool)

(assert (=> b!1009563 (=> (not res!677688) (not e!568159))))

(assert (=> b!1009563 (= res!677688 (validKeyInArray!0 (select (arr!30628 a!3219) j!170)))))

(declare-fun b!1009564 () Bool)

(assert (=> b!1009564 (= e!568163 e!568160)))

(declare-fun res!677694 () Bool)

(assert (=> b!1009564 (=> (not res!677694) (not e!568160))))

(assert (=> b!1009564 (= res!677694 (= lt!446117 lt!446115))))

(assert (=> b!1009564 (= lt!446115 (Intermediate!9496 false resIndex!38 resX!38))))

(assert (=> b!1009564 (= lt!446117 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30628 a!3219) j!170) mask!3464) (select (arr!30628 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!87160 res!677683) b!1009553))

(assert (= (and b!1009553 res!677684) b!1009563))

(assert (= (and b!1009563 res!677688) b!1009561))

(assert (= (and b!1009561 res!677692) b!1009556))

(assert (= (and b!1009556 res!677689) b!1009551))

(assert (= (and b!1009551 res!677690) b!1009557))

(assert (= (and b!1009557 res!677695) b!1009552))

(assert (= (and b!1009552 res!677693) b!1009559))

(assert (= (and b!1009559 res!677685) b!1009564))

(assert (= (and b!1009564 res!677694) b!1009554))

(assert (= (and b!1009554 res!677691) b!1009555))

(assert (= (and b!1009555 res!677686) b!1009560))

(assert (= (and b!1009560 res!677687) b!1009562))

(assert (= (and b!1009562 res!677696) b!1009558))

(declare-fun m!934595 () Bool)

(assert (=> b!1009558 m!934595))

(declare-fun m!934597 () Bool)

(assert (=> b!1009555 m!934597))

(assert (=> b!1009555 m!934597))

(declare-fun m!934599 () Bool)

(assert (=> b!1009555 m!934599))

(declare-fun m!934601 () Bool)

(assert (=> b!1009555 m!934601))

(declare-fun m!934603 () Bool)

(assert (=> b!1009555 m!934603))

(declare-fun m!934605 () Bool)

(assert (=> b!1009563 m!934605))

(assert (=> b!1009563 m!934605))

(declare-fun m!934607 () Bool)

(assert (=> b!1009563 m!934607))

(declare-fun m!934609 () Bool)

(assert (=> start!87160 m!934609))

(declare-fun m!934611 () Bool)

(assert (=> start!87160 m!934611))

(declare-fun m!934613 () Bool)

(assert (=> b!1009552 m!934613))

(declare-fun m!934615 () Bool)

(assert (=> b!1009556 m!934615))

(declare-fun m!934617 () Bool)

(assert (=> b!1009560 m!934617))

(declare-fun m!934619 () Bool)

(assert (=> b!1009557 m!934619))

(assert (=> b!1009554 m!934605))

(assert (=> b!1009554 m!934605))

(declare-fun m!934621 () Bool)

(assert (=> b!1009554 m!934621))

(declare-fun m!934623 () Bool)

(assert (=> b!1009561 m!934623))

(assert (=> b!1009564 m!934605))

(assert (=> b!1009564 m!934605))

(declare-fun m!934625 () Bool)

(assert (=> b!1009564 m!934625))

(assert (=> b!1009564 m!934625))

(assert (=> b!1009564 m!934605))

(declare-fun m!934627 () Bool)

(assert (=> b!1009564 m!934627))

(declare-fun m!934629 () Bool)

(assert (=> b!1009551 m!934629))

(check-sat (not b!1009558) (not b!1009557) (not b!1009556) (not b!1009552) (not b!1009563) (not b!1009555) (not b!1009560) (not b!1009561) (not b!1009551) (not start!87160) (not b!1009564) (not b!1009554))
(check-sat)
