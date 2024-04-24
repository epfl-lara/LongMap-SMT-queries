; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124102 () Bool)

(assert start!124102)

(declare-fun b!1436822 () Bool)

(declare-fun e!811011 () Bool)

(declare-fun e!811016 () Bool)

(assert (=> b!1436822 (= e!811011 e!811016)))

(declare-fun res!969003 () Bool)

(assert (=> b!1436822 (=> res!969003 e!811016)))

(declare-fun lt!632389 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97727 0))(
  ( (array!97728 (arr!47161 (Array (_ BitVec 32) (_ BitVec 64))) (size!47712 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97727)

(assert (=> b!1436822 (= res!969003 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!632389 #b00000000000000000000000000000000) (bvsge lt!632389 (size!47712 a!2831))))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436822 (= lt!632389 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1436823 () Bool)

(assert (=> b!1436823 (= e!811016 (bvslt (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!605)) (bvsub #b01111111111111111111111111111110 x!605)))))

(declare-fun b!1436824 () Bool)

(declare-fun res!969005 () Bool)

(declare-fun e!811013 () Bool)

(assert (=> b!1436824 (=> (not res!969005) (not e!811013))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97727 (_ BitVec 32)) Bool)

(assert (=> b!1436824 (= res!969005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1436825 () Bool)

(declare-fun res!968991 () Bool)

(assert (=> b!1436825 (=> (not res!968991) (not e!811013))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1436825 (= res!968991 (and (= (size!47712 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47712 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47712 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1436826 () Bool)

(declare-fun res!969001 () Bool)

(assert (=> b!1436826 (=> (not res!969001) (not e!811013))))

(declare-datatypes ((List!33658 0))(
  ( (Nil!33655) (Cons!33654 (h!35000 (_ BitVec 64)) (t!48344 List!33658)) )
))
(declare-fun arrayNoDuplicates!0 (array!97727 (_ BitVec 32) List!33658) Bool)

(assert (=> b!1436826 (= res!969001 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33655))))

(declare-fun res!969004 () Bool)

(assert (=> start!124102 (=> (not res!969004) (not e!811013))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124102 (= res!969004 (validMask!0 mask!2608))))

(assert (=> start!124102 e!811013))

(assert (=> start!124102 true))

(declare-fun array_inv!36442 (array!97727) Bool)

(assert (=> start!124102 (array_inv!36442 a!2831)))

(declare-fun b!1436827 () Bool)

(declare-fun res!969007 () Bool)

(declare-fun e!811010 () Bool)

(assert (=> b!1436827 (=> (not res!969007) (not e!811010))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1436827 (= res!969007 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1436828 () Bool)

(declare-fun e!811012 () Bool)

(assert (=> b!1436828 (= e!811013 e!811012)))

(declare-fun res!968995 () Bool)

(assert (=> b!1436828 (=> (not res!968995) (not e!811012))))

(declare-datatypes ((SeekEntryResult!11342 0))(
  ( (MissingZero!11342 (index!47760 (_ BitVec 32))) (Found!11342 (index!47761 (_ BitVec 32))) (Intermediate!11342 (undefined!12154 Bool) (index!47762 (_ BitVec 32)) (x!129588 (_ BitVec 32))) (Undefined!11342) (MissingVacant!11342 (index!47763 (_ BitVec 32))) )
))
(declare-fun lt!632391 () SeekEntryResult!11342)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97727 (_ BitVec 32)) SeekEntryResult!11342)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436828 (= res!968995 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47161 a!2831) j!81) mask!2608) (select (arr!47161 a!2831) j!81) a!2831 mask!2608) lt!632391))))

(assert (=> b!1436828 (= lt!632391 (Intermediate!11342 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1436829 () Bool)

(declare-fun res!968997 () Bool)

(assert (=> b!1436829 (=> (not res!968997) (not e!811013))))

(assert (=> b!1436829 (= res!968997 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47712 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47712 a!2831))))))

(declare-fun b!1436830 () Bool)

(declare-fun res!968994 () Bool)

(assert (=> b!1436830 (=> (not res!968994) (not e!811013))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436830 (= res!968994 (validKeyInArray!0 (select (arr!47161 a!2831) i!982)))))

(declare-fun b!1436831 () Bool)

(declare-fun res!968992 () Bool)

(assert (=> b!1436831 (=> (not res!968992) (not e!811013))))

(assert (=> b!1436831 (= res!968992 (validKeyInArray!0 (select (arr!47161 a!2831) j!81)))))

(declare-fun b!1436832 () Bool)

(declare-fun res!968998 () Bool)

(assert (=> b!1436832 (=> res!968998 e!811016)))

(declare-fun lt!632393 () array!97727)

(declare-fun lt!632392 () SeekEntryResult!11342)

(declare-fun lt!632388 () (_ BitVec 64))

(assert (=> b!1436832 (= res!968998 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!632389 lt!632388 lt!632393 mask!2608) lt!632392)))))

(declare-fun b!1436833 () Bool)

(assert (=> b!1436833 (= e!811010 (not e!811011))))

(declare-fun res!968993 () Bool)

(assert (=> b!1436833 (=> res!968993 e!811011)))

(assert (=> b!1436833 (= res!968993 (or (= (select (arr!47161 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47161 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47161 a!2831) index!585) (select (arr!47161 a!2831) j!81)) (= (select (store (arr!47161 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!811015 () Bool)

(assert (=> b!1436833 e!811015))

(declare-fun res!968996 () Bool)

(assert (=> b!1436833 (=> (not res!968996) (not e!811015))))

(assert (=> b!1436833 (= res!968996 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48461 0))(
  ( (Unit!48462) )
))
(declare-fun lt!632390 () Unit!48461)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97727 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48461)

(assert (=> b!1436833 (= lt!632390 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1436834 () Bool)

(assert (=> b!1436834 (= e!811012 e!811010)))

(declare-fun res!969000 () Bool)

(assert (=> b!1436834 (=> (not res!969000) (not e!811010))))

(assert (=> b!1436834 (= res!969000 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!632388 mask!2608) lt!632388 lt!632393 mask!2608) lt!632392))))

(assert (=> b!1436834 (= lt!632392 (Intermediate!11342 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1436834 (= lt!632388 (select (store (arr!47161 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1436834 (= lt!632393 (array!97728 (store (arr!47161 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47712 a!2831)))))

(declare-fun b!1436835 () Bool)

(declare-fun res!968999 () Bool)

(assert (=> b!1436835 (=> (not res!968999) (not e!811010))))

(assert (=> b!1436835 (= res!968999 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!632388 lt!632393 mask!2608) lt!632392))))

(declare-fun b!1436836 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97727 (_ BitVec 32)) SeekEntryResult!11342)

(assert (=> b!1436836 (= e!811015 (= (seekEntryOrOpen!0 (select (arr!47161 a!2831) j!81) a!2831 mask!2608) (Found!11342 j!81)))))

(declare-fun b!1436837 () Bool)

(declare-fun res!969006 () Bool)

(assert (=> b!1436837 (=> res!969006 e!811016)))

(assert (=> b!1436837 (= res!969006 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!632389 (select (arr!47161 a!2831) j!81) a!2831 mask!2608) lt!632391)))))

(declare-fun b!1436838 () Bool)

(declare-fun res!969002 () Bool)

(assert (=> b!1436838 (=> (not res!969002) (not e!811010))))

(assert (=> b!1436838 (= res!969002 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47161 a!2831) j!81) a!2831 mask!2608) lt!632391))))

(assert (= (and start!124102 res!969004) b!1436825))

(assert (= (and b!1436825 res!968991) b!1436830))

(assert (= (and b!1436830 res!968994) b!1436831))

(assert (= (and b!1436831 res!968992) b!1436824))

(assert (= (and b!1436824 res!969005) b!1436826))

(assert (= (and b!1436826 res!969001) b!1436829))

(assert (= (and b!1436829 res!968997) b!1436828))

(assert (= (and b!1436828 res!968995) b!1436834))

(assert (= (and b!1436834 res!969000) b!1436838))

(assert (= (and b!1436838 res!969002) b!1436835))

(assert (= (and b!1436835 res!968999) b!1436827))

(assert (= (and b!1436827 res!969007) b!1436833))

(assert (= (and b!1436833 res!968996) b!1436836))

(assert (= (and b!1436833 (not res!968993)) b!1436822))

(assert (= (and b!1436822 (not res!969003)) b!1436837))

(assert (= (and b!1436837 (not res!969006)) b!1436832))

(assert (= (and b!1436832 (not res!968998)) b!1436823))

(declare-fun m!1326307 () Bool)

(assert (=> b!1436830 m!1326307))

(assert (=> b!1436830 m!1326307))

(declare-fun m!1326309 () Bool)

(assert (=> b!1436830 m!1326309))

(declare-fun m!1326311 () Bool)

(assert (=> b!1436835 m!1326311))

(declare-fun m!1326313 () Bool)

(assert (=> b!1436828 m!1326313))

(assert (=> b!1436828 m!1326313))

(declare-fun m!1326315 () Bool)

(assert (=> b!1436828 m!1326315))

(assert (=> b!1436828 m!1326315))

(assert (=> b!1436828 m!1326313))

(declare-fun m!1326317 () Bool)

(assert (=> b!1436828 m!1326317))

(assert (=> b!1436831 m!1326313))

(assert (=> b!1436831 m!1326313))

(declare-fun m!1326319 () Bool)

(assert (=> b!1436831 m!1326319))

(declare-fun m!1326321 () Bool)

(assert (=> b!1436834 m!1326321))

(assert (=> b!1436834 m!1326321))

(declare-fun m!1326323 () Bool)

(assert (=> b!1436834 m!1326323))

(declare-fun m!1326325 () Bool)

(assert (=> b!1436834 m!1326325))

(declare-fun m!1326327 () Bool)

(assert (=> b!1436834 m!1326327))

(assert (=> b!1436833 m!1326325))

(declare-fun m!1326329 () Bool)

(assert (=> b!1436833 m!1326329))

(declare-fun m!1326331 () Bool)

(assert (=> b!1436833 m!1326331))

(declare-fun m!1326333 () Bool)

(assert (=> b!1436833 m!1326333))

(assert (=> b!1436833 m!1326313))

(declare-fun m!1326335 () Bool)

(assert (=> b!1436833 m!1326335))

(declare-fun m!1326337 () Bool)

(assert (=> b!1436824 m!1326337))

(assert (=> b!1436836 m!1326313))

(assert (=> b!1436836 m!1326313))

(declare-fun m!1326339 () Bool)

(assert (=> b!1436836 m!1326339))

(declare-fun m!1326341 () Bool)

(assert (=> start!124102 m!1326341))

(declare-fun m!1326343 () Bool)

(assert (=> start!124102 m!1326343))

(assert (=> b!1436838 m!1326313))

(assert (=> b!1436838 m!1326313))

(declare-fun m!1326345 () Bool)

(assert (=> b!1436838 m!1326345))

(assert (=> b!1436837 m!1326313))

(assert (=> b!1436837 m!1326313))

(declare-fun m!1326347 () Bool)

(assert (=> b!1436837 m!1326347))

(declare-fun m!1326349 () Bool)

(assert (=> b!1436822 m!1326349))

(declare-fun m!1326351 () Bool)

(assert (=> b!1436826 m!1326351))

(declare-fun m!1326353 () Bool)

(assert (=> b!1436832 m!1326353))

(check-sat (not b!1436831) (not b!1436830) (not b!1436834) (not b!1436836) (not b!1436824) (not b!1436837) (not b!1436835) (not b!1436838) (not b!1436833) (not b!1436822) (not start!124102) (not b!1436826) (not b!1436832) (not b!1436828))
(check-sat)
