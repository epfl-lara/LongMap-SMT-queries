; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123032 () Bool)

(assert start!123032)

(declare-fun b!1425048 () Bool)

(declare-fun e!805574 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97268 0))(
  ( (array!97269 (arr!46948 (Array (_ BitVec 32) (_ BitVec 64))) (size!47499 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97268)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11135 0))(
  ( (MissingZero!11135 (index!46932 (_ BitVec 32))) (Found!11135 (index!46933 (_ BitVec 32))) (Intermediate!11135 (undefined!11947 Bool) (index!46934 (_ BitVec 32)) (x!128730 (_ BitVec 32))) (Undefined!11135) (MissingVacant!11135 (index!46935 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97268 (_ BitVec 32)) SeekEntryResult!11135)

(assert (=> b!1425048 (= e!805574 (= (seekEntryOrOpen!0 (select (arr!46948 a!2831) j!81) a!2831 mask!2608) (Found!11135 j!81)))))

(declare-fun res!959596 () Bool)

(declare-fun e!805579 () Bool)

(assert (=> start!123032 (=> (not res!959596) (not e!805579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123032 (= res!959596 (validMask!0 mask!2608))))

(assert (=> start!123032 e!805579))

(assert (=> start!123032 true))

(declare-fun array_inv!36229 (array!97268) Bool)

(assert (=> start!123032 (array_inv!36229 a!2831)))

(declare-fun b!1425049 () Bool)

(declare-fun e!805575 () Bool)

(assert (=> b!1425049 (= e!805575 true)))

(declare-fun lt!627719 () (_ BitVec 64))

(declare-fun lt!627713 () array!97268)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!627715 () (_ BitVec 32))

(declare-fun lt!627714 () SeekEntryResult!11135)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97268 (_ BitVec 32)) SeekEntryResult!11135)

(assert (=> b!1425049 (= lt!627714 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627715 lt!627719 lt!627713 mask!2608))))

(declare-fun b!1425050 () Bool)

(declare-fun e!805578 () Bool)

(declare-fun e!805580 () Bool)

(assert (=> b!1425050 (= e!805578 e!805580)))

(declare-fun res!959601 () Bool)

(assert (=> b!1425050 (=> (not res!959601) (not e!805580))))

(declare-fun lt!627718 () SeekEntryResult!11135)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425050 (= res!959601 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627719 mask!2608) lt!627719 lt!627713 mask!2608) lt!627718))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1425050 (= lt!627718 (Intermediate!11135 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1425050 (= lt!627719 (select (store (arr!46948 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1425050 (= lt!627713 (array!97269 (store (arr!46948 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47499 a!2831)))))

(declare-fun b!1425051 () Bool)

(declare-fun res!959603 () Bool)

(assert (=> b!1425051 (=> (not res!959603) (not e!805579))))

(assert (=> b!1425051 (= res!959603 (and (= (size!47499 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47499 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47499 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425052 () Bool)

(declare-fun res!959609 () Bool)

(assert (=> b!1425052 (=> (not res!959609) (not e!805579))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425052 (= res!959609 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47499 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47499 a!2831))))))

(declare-fun b!1425053 () Bool)

(declare-fun res!959597 () Bool)

(assert (=> b!1425053 (=> (not res!959597) (not e!805580))))

(assert (=> b!1425053 (= res!959597 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1425054 () Bool)

(declare-fun res!959606 () Bool)

(assert (=> b!1425054 (=> (not res!959606) (not e!805579))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425054 (= res!959606 (validKeyInArray!0 (select (arr!46948 a!2831) i!982)))))

(declare-fun b!1425055 () Bool)

(declare-fun res!959610 () Bool)

(assert (=> b!1425055 (=> (not res!959610) (not e!805579))))

(assert (=> b!1425055 (= res!959610 (validKeyInArray!0 (select (arr!46948 a!2831) j!81)))))

(declare-fun b!1425056 () Bool)

(declare-fun res!959608 () Bool)

(assert (=> b!1425056 (=> (not res!959608) (not e!805580))))

(assert (=> b!1425056 (= res!959608 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627719 lt!627713 mask!2608) lt!627718))))

(declare-fun b!1425057 () Bool)

(declare-fun res!959607 () Bool)

(assert (=> b!1425057 (=> (not res!959607) (not e!805579))))

(declare-datatypes ((List!33445 0))(
  ( (Nil!33442) (Cons!33441 (h!34754 (_ BitVec 64)) (t!48131 List!33445)) )
))
(declare-fun arrayNoDuplicates!0 (array!97268 (_ BitVec 32) List!33445) Bool)

(assert (=> b!1425057 (= res!959607 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33442))))

(declare-fun b!1425058 () Bool)

(assert (=> b!1425058 (= e!805579 e!805578)))

(declare-fun res!959604 () Bool)

(assert (=> b!1425058 (=> (not res!959604) (not e!805578))))

(declare-fun lt!627716 () SeekEntryResult!11135)

(assert (=> b!1425058 (= res!959604 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46948 a!2831) j!81) mask!2608) (select (arr!46948 a!2831) j!81) a!2831 mask!2608) lt!627716))))

(assert (=> b!1425058 (= lt!627716 (Intermediate!11135 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1425059 () Bool)

(declare-fun e!805577 () Bool)

(assert (=> b!1425059 (= e!805577 e!805575)))

(declare-fun res!959611 () Bool)

(assert (=> b!1425059 (=> res!959611 e!805575)))

(assert (=> b!1425059 (= res!959611 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627715 #b00000000000000000000000000000000) (bvsge lt!627715 (size!47499 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425059 (= lt!627715 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1425060 () Bool)

(assert (=> b!1425060 (= e!805580 (not e!805577))))

(declare-fun res!959602 () Bool)

(assert (=> b!1425060 (=> res!959602 e!805577)))

(assert (=> b!1425060 (= res!959602 (or (= (select (arr!46948 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46948 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46948 a!2831) index!585) (select (arr!46948 a!2831) j!81)) (= (select (store (arr!46948 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1425060 e!805574))

(declare-fun res!959600 () Bool)

(assert (=> b!1425060 (=> (not res!959600) (not e!805574))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97268 (_ BitVec 32)) Bool)

(assert (=> b!1425060 (= res!959600 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48137 0))(
  ( (Unit!48138) )
))
(declare-fun lt!627717 () Unit!48137)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97268 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48137)

(assert (=> b!1425060 (= lt!627717 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1425061 () Bool)

(declare-fun res!959599 () Bool)

(assert (=> b!1425061 (=> (not res!959599) (not e!805579))))

(assert (=> b!1425061 (= res!959599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425062 () Bool)

(declare-fun res!959598 () Bool)

(assert (=> b!1425062 (=> res!959598 e!805575)))

(assert (=> b!1425062 (= res!959598 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627715 (select (arr!46948 a!2831) j!81) a!2831 mask!2608) lt!627716)))))

(declare-fun b!1425063 () Bool)

(declare-fun res!959605 () Bool)

(assert (=> b!1425063 (=> (not res!959605) (not e!805580))))

(assert (=> b!1425063 (= res!959605 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46948 a!2831) j!81) a!2831 mask!2608) lt!627716))))

(assert (= (and start!123032 res!959596) b!1425051))

(assert (= (and b!1425051 res!959603) b!1425054))

(assert (= (and b!1425054 res!959606) b!1425055))

(assert (= (and b!1425055 res!959610) b!1425061))

(assert (= (and b!1425061 res!959599) b!1425057))

(assert (= (and b!1425057 res!959607) b!1425052))

(assert (= (and b!1425052 res!959609) b!1425058))

(assert (= (and b!1425058 res!959604) b!1425050))

(assert (= (and b!1425050 res!959601) b!1425063))

(assert (= (and b!1425063 res!959605) b!1425056))

(assert (= (and b!1425056 res!959608) b!1425053))

(assert (= (and b!1425053 res!959597) b!1425060))

(assert (= (and b!1425060 res!959600) b!1425048))

(assert (= (and b!1425060 (not res!959602)) b!1425059))

(assert (= (and b!1425059 (not res!959611)) b!1425062))

(assert (= (and b!1425062 (not res!959598)) b!1425049))

(declare-fun m!1315713 () Bool)

(assert (=> b!1425055 m!1315713))

(assert (=> b!1425055 m!1315713))

(declare-fun m!1315715 () Bool)

(assert (=> b!1425055 m!1315715))

(declare-fun m!1315717 () Bool)

(assert (=> b!1425050 m!1315717))

(assert (=> b!1425050 m!1315717))

(declare-fun m!1315719 () Bool)

(assert (=> b!1425050 m!1315719))

(declare-fun m!1315721 () Bool)

(assert (=> b!1425050 m!1315721))

(declare-fun m!1315723 () Bool)

(assert (=> b!1425050 m!1315723))

(declare-fun m!1315725 () Bool)

(assert (=> b!1425061 m!1315725))

(declare-fun m!1315727 () Bool)

(assert (=> b!1425059 m!1315727))

(declare-fun m!1315729 () Bool)

(assert (=> b!1425049 m!1315729))

(declare-fun m!1315731 () Bool)

(assert (=> start!123032 m!1315731))

(declare-fun m!1315733 () Bool)

(assert (=> start!123032 m!1315733))

(declare-fun m!1315735 () Bool)

(assert (=> b!1425054 m!1315735))

(assert (=> b!1425054 m!1315735))

(declare-fun m!1315737 () Bool)

(assert (=> b!1425054 m!1315737))

(assert (=> b!1425058 m!1315713))

(assert (=> b!1425058 m!1315713))

(declare-fun m!1315739 () Bool)

(assert (=> b!1425058 m!1315739))

(assert (=> b!1425058 m!1315739))

(assert (=> b!1425058 m!1315713))

(declare-fun m!1315741 () Bool)

(assert (=> b!1425058 m!1315741))

(assert (=> b!1425063 m!1315713))

(assert (=> b!1425063 m!1315713))

(declare-fun m!1315743 () Bool)

(assert (=> b!1425063 m!1315743))

(assert (=> b!1425060 m!1315721))

(declare-fun m!1315745 () Bool)

(assert (=> b!1425060 m!1315745))

(declare-fun m!1315747 () Bool)

(assert (=> b!1425060 m!1315747))

(declare-fun m!1315749 () Bool)

(assert (=> b!1425060 m!1315749))

(assert (=> b!1425060 m!1315713))

(declare-fun m!1315751 () Bool)

(assert (=> b!1425060 m!1315751))

(declare-fun m!1315753 () Bool)

(assert (=> b!1425056 m!1315753))

(assert (=> b!1425062 m!1315713))

(assert (=> b!1425062 m!1315713))

(declare-fun m!1315755 () Bool)

(assert (=> b!1425062 m!1315755))

(declare-fun m!1315757 () Bool)

(assert (=> b!1425057 m!1315757))

(assert (=> b!1425048 m!1315713))

(assert (=> b!1425048 m!1315713))

(declare-fun m!1315759 () Bool)

(assert (=> b!1425048 m!1315759))

(check-sat (not b!1425057) (not b!1425061) (not b!1425056) (not b!1425058) (not b!1425050) (not b!1425060) (not b!1425055) (not b!1425059) (not b!1425048) (not b!1425049) (not b!1425054) (not start!123032) (not b!1425062) (not b!1425063))
(check-sat)
