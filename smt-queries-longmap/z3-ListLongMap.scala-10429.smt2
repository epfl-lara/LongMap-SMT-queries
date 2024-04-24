; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122978 () Bool)

(assert start!122978)

(declare-fun b!1423752 () Bool)

(declare-fun res!958306 () Bool)

(declare-fun e!805013 () Bool)

(assert (=> b!1423752 (=> (not res!958306) (not e!805013))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97214 0))(
  ( (array!97215 (arr!46921 (Array (_ BitVec 32) (_ BitVec 64))) (size!47472 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97214)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1423752 (= res!958306 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47472 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47472 a!2831))))))

(declare-fun b!1423753 () Bool)

(declare-fun res!958300 () Bool)

(declare-fun e!805010 () Bool)

(assert (=> b!1423753 (=> (not res!958300) (not e!805010))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1423753 (= res!958300 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1423754 () Bool)

(declare-fun e!805012 () Bool)

(assert (=> b!1423754 (= e!805012 true)))

(declare-fun lt!627150 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11108 0))(
  ( (MissingZero!11108 (index!46824 (_ BitVec 32))) (Found!11108 (index!46825 (_ BitVec 32))) (Intermediate!11108 (undefined!11920 Bool) (index!46826 (_ BitVec 32)) (x!128631 (_ BitVec 32))) (Undefined!11108) (MissingVacant!11108 (index!46827 (_ BitVec 32))) )
))
(declare-fun lt!627148 () SeekEntryResult!11108)

(declare-fun lt!627152 () array!97214)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!627146 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97214 (_ BitVec 32)) SeekEntryResult!11108)

(assert (=> b!1423754 (= lt!627148 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627150 lt!627146 lt!627152 mask!2608))))

(declare-fun b!1423755 () Bool)

(declare-fun res!958304 () Bool)

(assert (=> b!1423755 (=> (not res!958304) (not e!805013))))

(declare-datatypes ((List!33418 0))(
  ( (Nil!33415) (Cons!33414 (h!34727 (_ BitVec 64)) (t!48104 List!33418)) )
))
(declare-fun arrayNoDuplicates!0 (array!97214 (_ BitVec 32) List!33418) Bool)

(assert (=> b!1423755 (= res!958304 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33415))))

(declare-fun b!1423756 () Bool)

(declare-fun res!958302 () Bool)

(assert (=> b!1423756 (=> (not res!958302) (not e!805013))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97214 (_ BitVec 32)) Bool)

(assert (=> b!1423756 (= res!958302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1423757 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun e!805007 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97214 (_ BitVec 32)) SeekEntryResult!11108)

(assert (=> b!1423757 (= e!805007 (= (seekEntryOrOpen!0 (select (arr!46921 a!2831) j!81) a!2831 mask!2608) (Found!11108 j!81)))))

(declare-fun b!1423759 () Bool)

(declare-fun res!958305 () Bool)

(assert (=> b!1423759 (=> (not res!958305) (not e!805013))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423759 (= res!958305 (validKeyInArray!0 (select (arr!46921 a!2831) i!982)))))

(declare-fun b!1423760 () Bool)

(declare-fun e!805011 () Bool)

(assert (=> b!1423760 (= e!805010 (not e!805011))))

(declare-fun res!958311 () Bool)

(assert (=> b!1423760 (=> res!958311 e!805011)))

(assert (=> b!1423760 (= res!958311 (or (= (select (arr!46921 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46921 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46921 a!2831) index!585) (select (arr!46921 a!2831) j!81)) (= (select (store (arr!46921 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1423760 e!805007))

(declare-fun res!958303 () Bool)

(assert (=> b!1423760 (=> (not res!958303) (not e!805007))))

(assert (=> b!1423760 (= res!958303 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48083 0))(
  ( (Unit!48084) )
))
(declare-fun lt!627147 () Unit!48083)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97214 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48083)

(assert (=> b!1423760 (= lt!627147 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1423761 () Bool)

(declare-fun res!958313 () Bool)

(assert (=> b!1423761 (=> (not res!958313) (not e!805013))))

(assert (=> b!1423761 (= res!958313 (validKeyInArray!0 (select (arr!46921 a!2831) j!81)))))

(declare-fun b!1423762 () Bool)

(declare-fun e!805008 () Bool)

(assert (=> b!1423762 (= e!805008 e!805010)))

(declare-fun res!958312 () Bool)

(assert (=> b!1423762 (=> (not res!958312) (not e!805010))))

(declare-fun lt!627149 () SeekEntryResult!11108)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423762 (= res!958312 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627146 mask!2608) lt!627146 lt!627152 mask!2608) lt!627149))))

(assert (=> b!1423762 (= lt!627149 (Intermediate!11108 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1423762 (= lt!627146 (select (store (arr!46921 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423762 (= lt!627152 (array!97215 (store (arr!46921 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47472 a!2831)))))

(declare-fun b!1423763 () Bool)

(declare-fun res!958307 () Bool)

(assert (=> b!1423763 (=> (not res!958307) (not e!805010))))

(assert (=> b!1423763 (= res!958307 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627146 lt!627152 mask!2608) lt!627149))))

(declare-fun b!1423758 () Bool)

(assert (=> b!1423758 (= e!805013 e!805008)))

(declare-fun res!958315 () Bool)

(assert (=> b!1423758 (=> (not res!958315) (not e!805008))))

(declare-fun lt!627151 () SeekEntryResult!11108)

(assert (=> b!1423758 (= res!958315 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46921 a!2831) j!81) mask!2608) (select (arr!46921 a!2831) j!81) a!2831 mask!2608) lt!627151))))

(assert (=> b!1423758 (= lt!627151 (Intermediate!11108 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun res!958314 () Bool)

(assert (=> start!122978 (=> (not res!958314) (not e!805013))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122978 (= res!958314 (validMask!0 mask!2608))))

(assert (=> start!122978 e!805013))

(assert (=> start!122978 true))

(declare-fun array_inv!36202 (array!97214) Bool)

(assert (=> start!122978 (array_inv!36202 a!2831)))

(declare-fun b!1423764 () Bool)

(declare-fun res!958301 () Bool)

(assert (=> b!1423764 (=> res!958301 e!805012)))

(assert (=> b!1423764 (= res!958301 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627150 (select (arr!46921 a!2831) j!81) a!2831 mask!2608) lt!627151)))))

(declare-fun b!1423765 () Bool)

(declare-fun res!958309 () Bool)

(assert (=> b!1423765 (=> (not res!958309) (not e!805010))))

(assert (=> b!1423765 (= res!958309 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46921 a!2831) j!81) a!2831 mask!2608) lt!627151))))

(declare-fun b!1423766 () Bool)

(assert (=> b!1423766 (= e!805011 e!805012)))

(declare-fun res!958308 () Bool)

(assert (=> b!1423766 (=> res!958308 e!805012)))

(assert (=> b!1423766 (= res!958308 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627150 #b00000000000000000000000000000000) (bvsge lt!627150 (size!47472 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423766 (= lt!627150 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1423767 () Bool)

(declare-fun res!958310 () Bool)

(assert (=> b!1423767 (=> (not res!958310) (not e!805013))))

(assert (=> b!1423767 (= res!958310 (and (= (size!47472 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47472 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47472 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122978 res!958314) b!1423767))

(assert (= (and b!1423767 res!958310) b!1423759))

(assert (= (and b!1423759 res!958305) b!1423761))

(assert (= (and b!1423761 res!958313) b!1423756))

(assert (= (and b!1423756 res!958302) b!1423755))

(assert (= (and b!1423755 res!958304) b!1423752))

(assert (= (and b!1423752 res!958306) b!1423758))

(assert (= (and b!1423758 res!958315) b!1423762))

(assert (= (and b!1423762 res!958312) b!1423765))

(assert (= (and b!1423765 res!958309) b!1423763))

(assert (= (and b!1423763 res!958307) b!1423753))

(assert (= (and b!1423753 res!958300) b!1423760))

(assert (= (and b!1423760 res!958303) b!1423757))

(assert (= (and b!1423760 (not res!958311)) b!1423766))

(assert (= (and b!1423766 (not res!958308)) b!1423764))

(assert (= (and b!1423764 (not res!958301)) b!1423754))

(declare-fun m!1314417 () Bool)

(assert (=> b!1423754 m!1314417))

(declare-fun m!1314419 () Bool)

(assert (=> b!1423756 m!1314419))

(declare-fun m!1314421 () Bool)

(assert (=> b!1423762 m!1314421))

(assert (=> b!1423762 m!1314421))

(declare-fun m!1314423 () Bool)

(assert (=> b!1423762 m!1314423))

(declare-fun m!1314425 () Bool)

(assert (=> b!1423762 m!1314425))

(declare-fun m!1314427 () Bool)

(assert (=> b!1423762 m!1314427))

(declare-fun m!1314429 () Bool)

(assert (=> b!1423765 m!1314429))

(assert (=> b!1423765 m!1314429))

(declare-fun m!1314431 () Bool)

(assert (=> b!1423765 m!1314431))

(declare-fun m!1314433 () Bool)

(assert (=> b!1423763 m!1314433))

(declare-fun m!1314435 () Bool)

(assert (=> b!1423766 m!1314435))

(assert (=> b!1423757 m!1314429))

(assert (=> b!1423757 m!1314429))

(declare-fun m!1314437 () Bool)

(assert (=> b!1423757 m!1314437))

(declare-fun m!1314439 () Bool)

(assert (=> b!1423759 m!1314439))

(assert (=> b!1423759 m!1314439))

(declare-fun m!1314441 () Bool)

(assert (=> b!1423759 m!1314441))

(assert (=> b!1423758 m!1314429))

(assert (=> b!1423758 m!1314429))

(declare-fun m!1314443 () Bool)

(assert (=> b!1423758 m!1314443))

(assert (=> b!1423758 m!1314443))

(assert (=> b!1423758 m!1314429))

(declare-fun m!1314445 () Bool)

(assert (=> b!1423758 m!1314445))

(assert (=> b!1423764 m!1314429))

(assert (=> b!1423764 m!1314429))

(declare-fun m!1314447 () Bool)

(assert (=> b!1423764 m!1314447))

(assert (=> b!1423760 m!1314425))

(declare-fun m!1314449 () Bool)

(assert (=> b!1423760 m!1314449))

(declare-fun m!1314451 () Bool)

(assert (=> b!1423760 m!1314451))

(declare-fun m!1314453 () Bool)

(assert (=> b!1423760 m!1314453))

(assert (=> b!1423760 m!1314429))

(declare-fun m!1314455 () Bool)

(assert (=> b!1423760 m!1314455))

(declare-fun m!1314457 () Bool)

(assert (=> start!122978 m!1314457))

(declare-fun m!1314459 () Bool)

(assert (=> start!122978 m!1314459))

(declare-fun m!1314461 () Bool)

(assert (=> b!1423755 m!1314461))

(assert (=> b!1423761 m!1314429))

(assert (=> b!1423761 m!1314429))

(declare-fun m!1314463 () Bool)

(assert (=> b!1423761 m!1314463))

(check-sat (not b!1423765) (not b!1423764) (not b!1423756) (not b!1423766) (not b!1423755) (not b!1423757) (not b!1423754) (not start!122978) (not b!1423761) (not b!1423759) (not b!1423762) (not b!1423763) (not b!1423758) (not b!1423760))
(check-sat)
