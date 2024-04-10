; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87268 () Bool)

(assert start!87268)

(declare-fun b!1011605 () Bool)

(declare-fun e!569095 () Bool)

(declare-fun e!569092 () Bool)

(assert (=> b!1011605 (= e!569095 e!569092)))

(declare-fun res!679564 () Bool)

(assert (=> b!1011605 (=> (not res!679564) (not e!569092))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun lt!447097 () (_ BitVec 64))

(declare-datatypes ((array!63672 0))(
  ( (array!63673 (arr!30651 (Array (_ BitVec 32) (_ BitVec 64))) (size!31153 (_ BitVec 32))) )
))
(declare-fun lt!447098 () array!63672)

(declare-datatypes ((SeekEntryResult!9583 0))(
  ( (MissingZero!9583 (index!40703 (_ BitVec 32))) (Found!9583 (index!40704 (_ BitVec 32))) (Intermediate!9583 (undefined!10395 Bool) (index!40705 (_ BitVec 32)) (x!88117 (_ BitVec 32))) (Undefined!9583) (MissingVacant!9583 (index!40706 (_ BitVec 32))) )
))
(declare-fun lt!447094 () SeekEntryResult!9583)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63672 (_ BitVec 32)) SeekEntryResult!9583)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1011605 (= res!679564 (not (= lt!447094 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!447097 mask!3464) lt!447097 lt!447098 mask!3464))))))

(declare-fun a!3219 () array!63672)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1011605 (= lt!447097 (select (store (arr!30651 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1011605 (= lt!447098 (array!63673 (store (arr!30651 a!3219) i!1194 k!2224) (size!31153 a!3219)))))

(declare-fun b!1011606 () Bool)

(declare-fun e!569094 () Bool)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1011606 (= e!569094 (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!1245)) (bvsub #b01111111111111111111111111111110 x!1245)))))

(declare-fun b!1011607 () Bool)

(declare-fun res!679565 () Bool)

(declare-fun e!569098 () Bool)

(assert (=> b!1011607 (=> (not res!679565) (not e!569098))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1011607 (= res!679565 (validKeyInArray!0 (select (arr!30651 a!3219) j!170)))))

(declare-fun b!1011608 () Bool)

(declare-fun e!569093 () Bool)

(declare-fun e!569091 () Bool)

(assert (=> b!1011608 (= e!569093 e!569091)))

(declare-fun res!679556 () Bool)

(assert (=> b!1011608 (=> (not res!679556) (not e!569091))))

(declare-fun lt!447093 () SeekEntryResult!9583)

(assert (=> b!1011608 (= res!679556 (= lt!447094 lt!447093))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1011608 (= lt!447093 (Intermediate!9583 false resIndex!38 resX!38))))

(assert (=> b!1011608 (= lt!447094 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30651 a!3219) j!170) mask!3464) (select (arr!30651 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011609 () Bool)

(declare-fun res!679567 () Bool)

(assert (=> b!1011609 (=> (not res!679567) (not e!569093))))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1011609 (= res!679567 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31153 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31153 a!3219))))))

(declare-fun b!1011610 () Bool)

(declare-fun res!679553 () Bool)

(assert (=> b!1011610 (=> (not res!679553) (not e!569092))))

(assert (=> b!1011610 (= res!679553 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1011611 () Bool)

(declare-fun res!679555 () Bool)

(assert (=> b!1011611 (=> (not res!679555) (not e!569093))))

(declare-datatypes ((List!21327 0))(
  ( (Nil!21324) (Cons!21323 (h!22521 (_ BitVec 64)) (t!30328 List!21327)) )
))
(declare-fun arrayNoDuplicates!0 (array!63672 (_ BitVec 32) List!21327) Bool)

(assert (=> b!1011611 (= res!679555 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21324))))

(declare-fun b!1011612 () Bool)

(assert (=> b!1011612 (= e!569091 e!569095)))

(declare-fun res!679558 () Bool)

(assert (=> b!1011612 (=> (not res!679558) (not e!569095))))

(declare-fun lt!447096 () SeekEntryResult!9583)

(assert (=> b!1011612 (= res!679558 (= lt!447096 lt!447093))))

(assert (=> b!1011612 (= lt!447096 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30651 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011613 () Bool)

(declare-fun e!569097 () Bool)

(assert (=> b!1011613 (= e!569092 e!569097)))

(declare-fun res!679568 () Bool)

(assert (=> b!1011613 (=> (not res!679568) (not e!569097))))

(declare-fun lt!447092 () (_ BitVec 32))

(assert (=> b!1011613 (= res!679568 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!447092 #b00000000000000000000000000000000) (bvslt lt!447092 (size!31153 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1011613 (= lt!447092 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1011614 () Bool)

(declare-fun res!679560 () Bool)

(assert (=> b!1011614 (=> (not res!679560) (not e!569094))))

(declare-fun lt!447099 () SeekEntryResult!9583)

(assert (=> b!1011614 (= res!679560 (not (= lt!447099 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!447092 lt!447097 lt!447098 mask!3464))))))

(declare-fun b!1011615 () Bool)

(declare-fun res!679566 () Bool)

(assert (=> b!1011615 (=> (not res!679566) (not e!569098))))

(declare-fun arrayContainsKey!0 (array!63672 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1011615 (= res!679566 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1011616 () Bool)

(declare-fun res!679563 () Bool)

(assert (=> b!1011616 (=> (not res!679563) (not e!569092))))

(assert (=> b!1011616 (= res!679563 (not (= lt!447096 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!447097 lt!447098 mask!3464))))))

(declare-fun b!1011604 () Bool)

(declare-fun res!679562 () Bool)

(assert (=> b!1011604 (=> (not res!679562) (not e!569098))))

(assert (=> b!1011604 (= res!679562 (validKeyInArray!0 k!2224))))

(declare-fun res!679569 () Bool)

(assert (=> start!87268 (=> (not res!679569) (not e!569098))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87268 (= res!679569 (validMask!0 mask!3464))))

(assert (=> start!87268 e!569098))

(declare-fun array_inv!23775 (array!63672) Bool)

(assert (=> start!87268 (array_inv!23775 a!3219)))

(assert (=> start!87268 true))

(declare-fun b!1011617 () Bool)

(assert (=> b!1011617 (= e!569097 e!569094)))

(declare-fun res!679561 () Bool)

(assert (=> b!1011617 (=> (not res!679561) (not e!569094))))

(assert (=> b!1011617 (= res!679561 (= lt!447099 lt!447093))))

(assert (=> b!1011617 (= lt!447099 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!447092 (select (arr!30651 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011618 () Bool)

(assert (=> b!1011618 (= e!569098 e!569093)))

(declare-fun res!679557 () Bool)

(assert (=> b!1011618 (=> (not res!679557) (not e!569093))))

(declare-fun lt!447095 () SeekEntryResult!9583)

(assert (=> b!1011618 (= res!679557 (or (= lt!447095 (MissingVacant!9583 i!1194)) (= lt!447095 (MissingZero!9583 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63672 (_ BitVec 32)) SeekEntryResult!9583)

(assert (=> b!1011618 (= lt!447095 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1011619 () Bool)

(declare-fun res!679554 () Bool)

(assert (=> b!1011619 (=> (not res!679554) (not e!569098))))

(assert (=> b!1011619 (= res!679554 (and (= (size!31153 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31153 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31153 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1011620 () Bool)

(declare-fun res!679559 () Bool)

(assert (=> b!1011620 (=> (not res!679559) (not e!569093))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63672 (_ BitVec 32)) Bool)

(assert (=> b!1011620 (= res!679559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!87268 res!679569) b!1011619))

(assert (= (and b!1011619 res!679554) b!1011607))

(assert (= (and b!1011607 res!679565) b!1011604))

(assert (= (and b!1011604 res!679562) b!1011615))

(assert (= (and b!1011615 res!679566) b!1011618))

(assert (= (and b!1011618 res!679557) b!1011620))

(assert (= (and b!1011620 res!679559) b!1011611))

(assert (= (and b!1011611 res!679555) b!1011609))

(assert (= (and b!1011609 res!679567) b!1011608))

(assert (= (and b!1011608 res!679556) b!1011612))

(assert (= (and b!1011612 res!679558) b!1011605))

(assert (= (and b!1011605 res!679564) b!1011616))

(assert (= (and b!1011616 res!679563) b!1011610))

(assert (= (and b!1011610 res!679553) b!1011613))

(assert (= (and b!1011613 res!679568) b!1011617))

(assert (= (and b!1011617 res!679561) b!1011614))

(assert (= (and b!1011614 res!679560) b!1011606))

(declare-fun m!935573 () Bool)

(assert (=> b!1011617 m!935573))

(assert (=> b!1011617 m!935573))

(declare-fun m!935575 () Bool)

(assert (=> b!1011617 m!935575))

(declare-fun m!935577 () Bool)

(assert (=> b!1011616 m!935577))

(declare-fun m!935579 () Bool)

(assert (=> b!1011604 m!935579))

(declare-fun m!935581 () Bool)

(assert (=> b!1011605 m!935581))

(assert (=> b!1011605 m!935581))

(declare-fun m!935583 () Bool)

(assert (=> b!1011605 m!935583))

(declare-fun m!935585 () Bool)

(assert (=> b!1011605 m!935585))

(declare-fun m!935587 () Bool)

(assert (=> b!1011605 m!935587))

(declare-fun m!935589 () Bool)

(assert (=> b!1011611 m!935589))

(declare-fun m!935591 () Bool)

(assert (=> b!1011615 m!935591))

(declare-fun m!935593 () Bool)

(assert (=> b!1011618 m!935593))

(assert (=> b!1011607 m!935573))

(assert (=> b!1011607 m!935573))

(declare-fun m!935595 () Bool)

(assert (=> b!1011607 m!935595))

(declare-fun m!935597 () Bool)

(assert (=> b!1011620 m!935597))

(declare-fun m!935599 () Bool)

(assert (=> start!87268 m!935599))

(declare-fun m!935601 () Bool)

(assert (=> start!87268 m!935601))

(assert (=> b!1011608 m!935573))

(assert (=> b!1011608 m!935573))

(declare-fun m!935603 () Bool)

(assert (=> b!1011608 m!935603))

(assert (=> b!1011608 m!935603))

(assert (=> b!1011608 m!935573))

(declare-fun m!935605 () Bool)

(assert (=> b!1011608 m!935605))

(declare-fun m!935607 () Bool)

(assert (=> b!1011613 m!935607))

(assert (=> b!1011612 m!935573))

(assert (=> b!1011612 m!935573))

(declare-fun m!935609 () Bool)

(assert (=> b!1011612 m!935609))

(declare-fun m!935611 () Bool)

(assert (=> b!1011614 m!935611))

(push 1)

(assert (not b!1011620))

(assert (not start!87268))

(assert (not b!1011618))

(assert (not b!1011604))

(assert (not b!1011614))

(assert (not b!1011615))

(assert (not b!1011612))

(assert (not b!1011608))

(assert (not b!1011613))

(assert (not b!1011607))

(assert (not b!1011605))

(assert (not b!1011616))

(assert (not b!1011611))

(assert (not b!1011617))

(check-sat)

(pop 1)

(push 1)

(check-sat)

