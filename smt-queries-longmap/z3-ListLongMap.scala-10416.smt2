; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122660 () Bool)

(assert start!122660)

(declare-fun res!956298 () Bool)

(declare-fun e!803529 () Bool)

(assert (=> start!122660 (=> (not res!956298) (not e!803529))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122660 (= res!956298 (validMask!0 mask!2608))))

(assert (=> start!122660 e!803529))

(assert (=> start!122660 true))

(declare-datatypes ((array!97025 0))(
  ( (array!97026 (arr!46830 (Array (_ BitVec 32) (_ BitVec 64))) (size!47380 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97025)

(declare-fun array_inv!35858 (array!97025) Bool)

(assert (=> start!122660 (array_inv!35858 a!2831)))

(declare-fun b!1420863 () Bool)

(declare-fun res!956304 () Bool)

(assert (=> b!1420863 (=> (not res!956304) (not e!803529))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97025 (_ BitVec 32)) Bool)

(assert (=> b!1420863 (= res!956304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420864 () Bool)

(declare-fun res!956302 () Bool)

(assert (=> b!1420864 (=> (not res!956302) (not e!803529))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420864 (= res!956302 (validKeyInArray!0 (select (arr!46830 a!2831) j!81)))))

(declare-fun b!1420865 () Bool)

(declare-fun res!956301 () Bool)

(assert (=> b!1420865 (=> (not res!956301) (not e!803529))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420865 (= res!956301 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47380 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47380 a!2831))))))

(declare-fun b!1420866 () Bool)

(declare-fun e!803531 () Bool)

(assert (=> b!1420866 (= e!803531 false)))

(declare-fun lt!626029 () array!97025)

(declare-fun lt!626030 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11115 0))(
  ( (MissingZero!11115 (index!46852 (_ BitVec 32))) (Found!11115 (index!46853 (_ BitVec 32))) (Intermediate!11115 (undefined!11927 Bool) (index!46854 (_ BitVec 32)) (x!128509 (_ BitVec 32))) (Undefined!11115) (MissingVacant!11115 (index!46855 (_ BitVec 32))) )
))
(declare-fun lt!626028 () SeekEntryResult!11115)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97025 (_ BitVec 32)) SeekEntryResult!11115)

(assert (=> b!1420866 (= lt!626028 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626030 lt!626029 mask!2608))))

(declare-fun b!1420867 () Bool)

(declare-fun e!803530 () Bool)

(assert (=> b!1420867 (= e!803530 e!803531)))

(declare-fun res!956299 () Bool)

(assert (=> b!1420867 (=> (not res!956299) (not e!803531))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420867 (= res!956299 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626030 mask!2608) lt!626030 lt!626029 mask!2608) (Intermediate!11115 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1420867 (= lt!626030 (select (store (arr!46830 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1420867 (= lt!626029 (array!97026 (store (arr!46830 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47380 a!2831)))))

(declare-fun b!1420868 () Bool)

(declare-fun res!956305 () Bool)

(assert (=> b!1420868 (=> (not res!956305) (not e!803529))))

(assert (=> b!1420868 (= res!956305 (and (= (size!47380 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47380 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47380 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420869 () Bool)

(declare-fun res!956296 () Bool)

(assert (=> b!1420869 (=> (not res!956296) (not e!803529))))

(assert (=> b!1420869 (= res!956296 (validKeyInArray!0 (select (arr!46830 a!2831) i!982)))))

(declare-fun b!1420870 () Bool)

(declare-fun res!956303 () Bool)

(assert (=> b!1420870 (=> (not res!956303) (not e!803529))))

(declare-datatypes ((List!33340 0))(
  ( (Nil!33337) (Cons!33336 (h!34638 (_ BitVec 64)) (t!48034 List!33340)) )
))
(declare-fun arrayNoDuplicates!0 (array!97025 (_ BitVec 32) List!33340) Bool)

(assert (=> b!1420870 (= res!956303 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33337))))

(declare-fun b!1420871 () Bool)

(assert (=> b!1420871 (= e!803529 e!803530)))

(declare-fun res!956297 () Bool)

(assert (=> b!1420871 (=> (not res!956297) (not e!803530))))

(declare-fun lt!626031 () SeekEntryResult!11115)

(assert (=> b!1420871 (= res!956297 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46830 a!2831) j!81) mask!2608) (select (arr!46830 a!2831) j!81) a!2831 mask!2608) lt!626031))))

(assert (=> b!1420871 (= lt!626031 (Intermediate!11115 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1420872 () Bool)

(declare-fun res!956300 () Bool)

(assert (=> b!1420872 (=> (not res!956300) (not e!803531))))

(assert (=> b!1420872 (= res!956300 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46830 a!2831) j!81) a!2831 mask!2608) lt!626031))))

(assert (= (and start!122660 res!956298) b!1420868))

(assert (= (and b!1420868 res!956305) b!1420869))

(assert (= (and b!1420869 res!956296) b!1420864))

(assert (= (and b!1420864 res!956302) b!1420863))

(assert (= (and b!1420863 res!956304) b!1420870))

(assert (= (and b!1420870 res!956303) b!1420865))

(assert (= (and b!1420865 res!956301) b!1420871))

(assert (= (and b!1420871 res!956297) b!1420867))

(assert (= (and b!1420867 res!956299) b!1420872))

(assert (= (and b!1420872 res!956300) b!1420866))

(declare-fun m!1311395 () Bool)

(assert (=> b!1420867 m!1311395))

(assert (=> b!1420867 m!1311395))

(declare-fun m!1311397 () Bool)

(assert (=> b!1420867 m!1311397))

(declare-fun m!1311399 () Bool)

(assert (=> b!1420867 m!1311399))

(declare-fun m!1311401 () Bool)

(assert (=> b!1420867 m!1311401))

(declare-fun m!1311403 () Bool)

(assert (=> b!1420866 m!1311403))

(declare-fun m!1311405 () Bool)

(assert (=> b!1420870 m!1311405))

(declare-fun m!1311407 () Bool)

(assert (=> b!1420864 m!1311407))

(assert (=> b!1420864 m!1311407))

(declare-fun m!1311409 () Bool)

(assert (=> b!1420864 m!1311409))

(declare-fun m!1311411 () Bool)

(assert (=> start!122660 m!1311411))

(declare-fun m!1311413 () Bool)

(assert (=> start!122660 m!1311413))

(assert (=> b!1420872 m!1311407))

(assert (=> b!1420872 m!1311407))

(declare-fun m!1311415 () Bool)

(assert (=> b!1420872 m!1311415))

(assert (=> b!1420871 m!1311407))

(assert (=> b!1420871 m!1311407))

(declare-fun m!1311417 () Bool)

(assert (=> b!1420871 m!1311417))

(assert (=> b!1420871 m!1311417))

(assert (=> b!1420871 m!1311407))

(declare-fun m!1311419 () Bool)

(assert (=> b!1420871 m!1311419))

(declare-fun m!1311421 () Bool)

(assert (=> b!1420869 m!1311421))

(assert (=> b!1420869 m!1311421))

(declare-fun m!1311423 () Bool)

(assert (=> b!1420869 m!1311423))

(declare-fun m!1311425 () Bool)

(assert (=> b!1420863 m!1311425))

(check-sat (not b!1420872) (not b!1420870) (not b!1420864) (not b!1420863) (not b!1420869) (not b!1420871) (not start!122660) (not b!1420866) (not b!1420867))
(check-sat)
