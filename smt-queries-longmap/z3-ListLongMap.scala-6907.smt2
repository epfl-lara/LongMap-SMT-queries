; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86806 () Bool)

(assert start!86806)

(declare-fun b!1006550 () Bool)

(declare-fun res!675648 () Bool)

(declare-fun e!566538 () Bool)

(assert (=> b!1006550 (=> (not res!675648) (not e!566538))))

(declare-datatypes ((array!63505 0))(
  ( (array!63506 (arr!30575 (Array (_ BitVec 32) (_ BitVec 64))) (size!31077 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63505)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006550 (= res!675648 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006551 () Bool)

(declare-fun e!566539 () Bool)

(assert (=> b!1006551 (= e!566539 false)))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9507 0))(
  ( (MissingZero!9507 (index!40399 (_ BitVec 32))) (Found!9507 (index!40400 (_ BitVec 32))) (Intermediate!9507 (undefined!10319 Bool) (index!40401 (_ BitVec 32)) (x!87795 (_ BitVec 32))) (Undefined!9507) (MissingVacant!9507 (index!40402 (_ BitVec 32))) )
))
(declare-fun lt!444818 () SeekEntryResult!9507)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63505 (_ BitVec 32)) SeekEntryResult!9507)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006551 (= lt!444818 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30575 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30575 a!3219) i!1194 k0!2224) j!170) (array!63506 (store (arr!30575 a!3219) i!1194 k0!2224) (size!31077 a!3219)) mask!3464))))

(declare-fun b!1006552 () Bool)

(declare-fun res!675642 () Bool)

(assert (=> b!1006552 (=> (not res!675642) (not e!566539))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!444816 () SeekEntryResult!9507)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1006552 (= res!675642 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30575 a!3219) j!170) a!3219 mask!3464) lt!444816))))

(declare-fun b!1006553 () Bool)

(declare-fun res!675647 () Bool)

(declare-fun e!566537 () Bool)

(assert (=> b!1006553 (=> (not res!675647) (not e!566537))))

(declare-datatypes ((List!21251 0))(
  ( (Nil!21248) (Cons!21247 (h!22430 (_ BitVec 64)) (t!30252 List!21251)) )
))
(declare-fun arrayNoDuplicates!0 (array!63505 (_ BitVec 32) List!21251) Bool)

(assert (=> b!1006553 (= res!675647 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21248))))

(declare-fun b!1006554 () Bool)

(assert (=> b!1006554 (= e!566538 e!566537)))

(declare-fun res!675639 () Bool)

(assert (=> b!1006554 (=> (not res!675639) (not e!566537))))

(declare-fun lt!444817 () SeekEntryResult!9507)

(assert (=> b!1006554 (= res!675639 (or (= lt!444817 (MissingVacant!9507 i!1194)) (= lt!444817 (MissingZero!9507 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63505 (_ BitVec 32)) SeekEntryResult!9507)

(assert (=> b!1006554 (= lt!444817 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1006555 () Bool)

(declare-fun res!675643 () Bool)

(assert (=> b!1006555 (=> (not res!675643) (not e!566537))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1006555 (= res!675643 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31077 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31077 a!3219))))))

(declare-fun res!675644 () Bool)

(assert (=> start!86806 (=> (not res!675644) (not e!566538))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86806 (= res!675644 (validMask!0 mask!3464))))

(assert (=> start!86806 e!566538))

(declare-fun array_inv!23699 (array!63505) Bool)

(assert (=> start!86806 (array_inv!23699 a!3219)))

(assert (=> start!86806 true))

(declare-fun b!1006556 () Bool)

(declare-fun res!675640 () Bool)

(assert (=> b!1006556 (=> (not res!675640) (not e!566537))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63505 (_ BitVec 32)) Bool)

(assert (=> b!1006556 (= res!675640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1006557 () Bool)

(assert (=> b!1006557 (= e!566537 e!566539)))

(declare-fun res!675646 () Bool)

(assert (=> b!1006557 (=> (not res!675646) (not e!566539))))

(assert (=> b!1006557 (= res!675646 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30575 a!3219) j!170) mask!3464) (select (arr!30575 a!3219) j!170) a!3219 mask!3464) lt!444816))))

(assert (=> b!1006557 (= lt!444816 (Intermediate!9507 false resIndex!38 resX!38))))

(declare-fun b!1006558 () Bool)

(declare-fun res!675638 () Bool)

(assert (=> b!1006558 (=> (not res!675638) (not e!566538))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006558 (= res!675638 (validKeyInArray!0 k0!2224))))

(declare-fun b!1006559 () Bool)

(declare-fun res!675645 () Bool)

(assert (=> b!1006559 (=> (not res!675645) (not e!566538))))

(assert (=> b!1006559 (= res!675645 (validKeyInArray!0 (select (arr!30575 a!3219) j!170)))))

(declare-fun b!1006560 () Bool)

(declare-fun res!675641 () Bool)

(assert (=> b!1006560 (=> (not res!675641) (not e!566538))))

(assert (=> b!1006560 (= res!675641 (and (= (size!31077 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31077 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31077 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86806 res!675644) b!1006560))

(assert (= (and b!1006560 res!675641) b!1006559))

(assert (= (and b!1006559 res!675645) b!1006558))

(assert (= (and b!1006558 res!675638) b!1006550))

(assert (= (and b!1006550 res!675648) b!1006554))

(assert (= (and b!1006554 res!675639) b!1006556))

(assert (= (and b!1006556 res!675640) b!1006553))

(assert (= (and b!1006553 res!675647) b!1006555))

(assert (= (and b!1006555 res!675643) b!1006557))

(assert (= (and b!1006557 res!675646) b!1006552))

(assert (= (and b!1006552 res!675642) b!1006551))

(declare-fun m!931645 () Bool)

(assert (=> b!1006556 m!931645))

(declare-fun m!931647 () Bool)

(assert (=> b!1006550 m!931647))

(declare-fun m!931649 () Bool)

(assert (=> b!1006558 m!931649))

(declare-fun m!931651 () Bool)

(assert (=> b!1006553 m!931651))

(declare-fun m!931653 () Bool)

(assert (=> b!1006552 m!931653))

(assert (=> b!1006552 m!931653))

(declare-fun m!931655 () Bool)

(assert (=> b!1006552 m!931655))

(declare-fun m!931657 () Bool)

(assert (=> b!1006554 m!931657))

(declare-fun m!931659 () Bool)

(assert (=> b!1006551 m!931659))

(declare-fun m!931661 () Bool)

(assert (=> b!1006551 m!931661))

(assert (=> b!1006551 m!931661))

(declare-fun m!931663 () Bool)

(assert (=> b!1006551 m!931663))

(assert (=> b!1006551 m!931663))

(assert (=> b!1006551 m!931661))

(declare-fun m!931665 () Bool)

(assert (=> b!1006551 m!931665))

(assert (=> b!1006559 m!931653))

(assert (=> b!1006559 m!931653))

(declare-fun m!931667 () Bool)

(assert (=> b!1006559 m!931667))

(assert (=> b!1006557 m!931653))

(assert (=> b!1006557 m!931653))

(declare-fun m!931669 () Bool)

(assert (=> b!1006557 m!931669))

(assert (=> b!1006557 m!931669))

(assert (=> b!1006557 m!931653))

(declare-fun m!931671 () Bool)

(assert (=> b!1006557 m!931671))

(declare-fun m!931673 () Bool)

(assert (=> start!86806 m!931673))

(declare-fun m!931675 () Bool)

(assert (=> start!86806 m!931675))

(check-sat (not b!1006557) (not b!1006551) (not b!1006550) (not b!1006556) (not b!1006554) (not b!1006553) (not b!1006552) (not b!1006559) (not start!86806) (not b!1006558))
(check-sat)
