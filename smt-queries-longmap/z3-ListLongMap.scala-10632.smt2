; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124932 () Bool)

(assert start!124932)

(declare-fun e!817375 () Bool)

(declare-fun b!1451799 () Bool)

(declare-fun lt!636758 () (_ BitVec 64))

(declare-datatypes ((array!98380 0))(
  ( (array!98381 (arr!47478 (Array (_ BitVec 32) (_ BitVec 64))) (size!48028 (_ BitVec 32))) )
))
(declare-fun lt!636757 () array!98380)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11730 0))(
  ( (MissingZero!11730 (index!49312 (_ BitVec 32))) (Found!11730 (index!49313 (_ BitVec 32))) (Intermediate!11730 (undefined!12542 Bool) (index!49314 (_ BitVec 32)) (x!130963 (_ BitVec 32))) (Undefined!11730) (MissingVacant!11730 (index!49315 (_ BitVec 32))) )
))
(declare-fun lt!636756 () SeekEntryResult!11730)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98380 (_ BitVec 32)) SeekEntryResult!11730)

(assert (=> b!1451799 (= e!817375 (= lt!636756 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636758 lt!636757 mask!2687)))))

(declare-fun b!1451800 () Bool)

(declare-fun e!817372 () Bool)

(assert (=> b!1451800 (= e!817372 (not true))))

(declare-fun e!817376 () Bool)

(assert (=> b!1451800 e!817376))

(declare-fun res!983002 () Bool)

(assert (=> b!1451800 (=> (not res!983002) (not e!817376))))

(declare-fun a!2862 () array!98380)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98380 (_ BitVec 32)) Bool)

(assert (=> b!1451800 (= res!983002 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48956 0))(
  ( (Unit!48957) )
))
(declare-fun lt!636755 () Unit!48956)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98380 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48956)

(assert (=> b!1451800 (= lt!636755 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1451801 () Bool)

(declare-fun res!983001 () Bool)

(declare-fun e!817370 () Bool)

(assert (=> b!1451801 (=> (not res!983001) (not e!817370))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1451801 (= res!983001 (validKeyInArray!0 (select (arr!47478 a!2862) j!93)))))

(declare-fun b!1451802 () Bool)

(declare-fun res!982991 () Bool)

(assert (=> b!1451802 (=> (not res!982991) (not e!817370))))

(assert (=> b!1451802 (= res!982991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1451803 () Bool)

(declare-fun e!817374 () Bool)

(assert (=> b!1451803 (= e!817370 e!817374)))

(declare-fun res!983004 () Bool)

(assert (=> b!1451803 (=> (not res!983004) (not e!817374))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1451803 (= res!983004 (= (select (store (arr!47478 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1451803 (= lt!636757 (array!98381 (store (arr!47478 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48028 a!2862)))))

(declare-fun b!1451804 () Bool)

(declare-fun e!817373 () Bool)

(assert (=> b!1451804 (= e!817373 e!817372)))

(declare-fun res!982998 () Bool)

(assert (=> b!1451804 (=> (not res!982998) (not e!817372))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1451804 (= res!982998 (= lt!636756 (Intermediate!11730 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451804 (= lt!636756 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636758 mask!2687) lt!636758 lt!636757 mask!2687))))

(assert (=> b!1451804 (= lt!636758 (select (store (arr!47478 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1451805 () Bool)

(assert (=> b!1451805 (= e!817374 e!817373)))

(declare-fun res!983000 () Bool)

(assert (=> b!1451805 (=> (not res!983000) (not e!817373))))

(declare-fun lt!636759 () SeekEntryResult!11730)

(assert (=> b!1451805 (= res!983000 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47478 a!2862) j!93) mask!2687) (select (arr!47478 a!2862) j!93) a!2862 mask!2687) lt!636759))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1451805 (= lt!636759 (Intermediate!11730 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1451806 () Bool)

(declare-fun res!982992 () Bool)

(assert (=> b!1451806 (=> (not res!982992) (not e!817370))))

(declare-datatypes ((List!33979 0))(
  ( (Nil!33976) (Cons!33975 (h!35325 (_ BitVec 64)) (t!48673 List!33979)) )
))
(declare-fun arrayNoDuplicates!0 (array!98380 (_ BitVec 32) List!33979) Bool)

(assert (=> b!1451806 (= res!982992 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33976))))

(declare-fun res!982995 () Bool)

(assert (=> start!124932 (=> (not res!982995) (not e!817370))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124932 (= res!982995 (validMask!0 mask!2687))))

(assert (=> start!124932 e!817370))

(assert (=> start!124932 true))

(declare-fun array_inv!36506 (array!98380) Bool)

(assert (=> start!124932 (array_inv!36506 a!2862)))

(declare-fun b!1451798 () Bool)

(declare-fun res!982999 () Bool)

(assert (=> b!1451798 (=> (not res!982999) (not e!817370))))

(assert (=> b!1451798 (= res!982999 (validKeyInArray!0 (select (arr!47478 a!2862) i!1006)))))

(declare-fun b!1451807 () Bool)

(declare-fun res!982993 () Bool)

(assert (=> b!1451807 (=> (not res!982993) (not e!817372))))

(assert (=> b!1451807 (= res!982993 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1451808 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98380 (_ BitVec 32)) SeekEntryResult!11730)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98380 (_ BitVec 32)) SeekEntryResult!11730)

(assert (=> b!1451808 (= e!817375 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636758 lt!636757 mask!2687) (seekEntryOrOpen!0 lt!636758 lt!636757 mask!2687)))))

(declare-fun b!1451809 () Bool)

(declare-fun res!983003 () Bool)

(assert (=> b!1451809 (=> (not res!983003) (not e!817370))))

(assert (=> b!1451809 (= res!983003 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48028 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48028 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48028 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1451810 () Bool)

(declare-fun res!982997 () Bool)

(assert (=> b!1451810 (=> (not res!982997) (not e!817373))))

(assert (=> b!1451810 (= res!982997 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47478 a!2862) j!93) a!2862 mask!2687) lt!636759))))

(declare-fun b!1451811 () Bool)

(assert (=> b!1451811 (= e!817376 (and (or (= (select (arr!47478 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47478 a!2862) intermediateBeforeIndex!19) (select (arr!47478 a!2862) j!93))) (or (and (= (select (arr!47478 a!2862) index!646) (select (store (arr!47478 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47478 a!2862) index!646) (select (arr!47478 a!2862) j!93))) (= (select (arr!47478 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47478 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1451812 () Bool)

(declare-fun res!982994 () Bool)

(assert (=> b!1451812 (=> (not res!982994) (not e!817372))))

(assert (=> b!1451812 (= res!982994 e!817375)))

(declare-fun c!133914 () Bool)

(assert (=> b!1451812 (= c!133914 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1451813 () Bool)

(declare-fun res!983005 () Bool)

(assert (=> b!1451813 (=> (not res!983005) (not e!817376))))

(assert (=> b!1451813 (= res!983005 (= (seekEntryOrOpen!0 (select (arr!47478 a!2862) j!93) a!2862 mask!2687) (Found!11730 j!93)))))

(declare-fun b!1451814 () Bool)

(declare-fun res!982996 () Bool)

(assert (=> b!1451814 (=> (not res!982996) (not e!817370))))

(assert (=> b!1451814 (= res!982996 (and (= (size!48028 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48028 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48028 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124932 res!982995) b!1451814))

(assert (= (and b!1451814 res!982996) b!1451798))

(assert (= (and b!1451798 res!982999) b!1451801))

(assert (= (and b!1451801 res!983001) b!1451802))

(assert (= (and b!1451802 res!982991) b!1451806))

(assert (= (and b!1451806 res!982992) b!1451809))

(assert (= (and b!1451809 res!983003) b!1451803))

(assert (= (and b!1451803 res!983004) b!1451805))

(assert (= (and b!1451805 res!983000) b!1451810))

(assert (= (and b!1451810 res!982997) b!1451804))

(assert (= (and b!1451804 res!982998) b!1451812))

(assert (= (and b!1451812 c!133914) b!1451799))

(assert (= (and b!1451812 (not c!133914)) b!1451808))

(assert (= (and b!1451812 res!982994) b!1451807))

(assert (= (and b!1451807 res!982993) b!1451800))

(assert (= (and b!1451800 res!983002) b!1451813))

(assert (= (and b!1451813 res!983005) b!1451811))

(declare-fun m!1340385 () Bool)

(assert (=> b!1451813 m!1340385))

(assert (=> b!1451813 m!1340385))

(declare-fun m!1340387 () Bool)

(assert (=> b!1451813 m!1340387))

(declare-fun m!1340389 () Bool)

(assert (=> b!1451799 m!1340389))

(declare-fun m!1340391 () Bool)

(assert (=> b!1451803 m!1340391))

(declare-fun m!1340393 () Bool)

(assert (=> b!1451803 m!1340393))

(assert (=> b!1451801 m!1340385))

(assert (=> b!1451801 m!1340385))

(declare-fun m!1340395 () Bool)

(assert (=> b!1451801 m!1340395))

(declare-fun m!1340397 () Bool)

(assert (=> b!1451798 m!1340397))

(assert (=> b!1451798 m!1340397))

(declare-fun m!1340399 () Bool)

(assert (=> b!1451798 m!1340399))

(declare-fun m!1340401 () Bool)

(assert (=> b!1451800 m!1340401))

(declare-fun m!1340403 () Bool)

(assert (=> b!1451800 m!1340403))

(assert (=> b!1451811 m!1340391))

(declare-fun m!1340405 () Bool)

(assert (=> b!1451811 m!1340405))

(declare-fun m!1340407 () Bool)

(assert (=> b!1451811 m!1340407))

(declare-fun m!1340409 () Bool)

(assert (=> b!1451811 m!1340409))

(assert (=> b!1451811 m!1340385))

(declare-fun m!1340411 () Bool)

(assert (=> start!124932 m!1340411))

(declare-fun m!1340413 () Bool)

(assert (=> start!124932 m!1340413))

(assert (=> b!1451810 m!1340385))

(assert (=> b!1451810 m!1340385))

(declare-fun m!1340415 () Bool)

(assert (=> b!1451810 m!1340415))

(declare-fun m!1340417 () Bool)

(assert (=> b!1451806 m!1340417))

(declare-fun m!1340419 () Bool)

(assert (=> b!1451808 m!1340419))

(declare-fun m!1340421 () Bool)

(assert (=> b!1451808 m!1340421))

(assert (=> b!1451805 m!1340385))

(assert (=> b!1451805 m!1340385))

(declare-fun m!1340423 () Bool)

(assert (=> b!1451805 m!1340423))

(assert (=> b!1451805 m!1340423))

(assert (=> b!1451805 m!1340385))

(declare-fun m!1340425 () Bool)

(assert (=> b!1451805 m!1340425))

(declare-fun m!1340427 () Bool)

(assert (=> b!1451804 m!1340427))

(assert (=> b!1451804 m!1340427))

(declare-fun m!1340429 () Bool)

(assert (=> b!1451804 m!1340429))

(assert (=> b!1451804 m!1340391))

(declare-fun m!1340431 () Bool)

(assert (=> b!1451804 m!1340431))

(declare-fun m!1340433 () Bool)

(assert (=> b!1451802 m!1340433))

(check-sat (not b!1451808) (not b!1451806) (not start!124932) (not b!1451798) (not b!1451802) (not b!1451799) (not b!1451800) (not b!1451805) (not b!1451810) (not b!1451813) (not b!1451804) (not b!1451801))
(check-sat)
