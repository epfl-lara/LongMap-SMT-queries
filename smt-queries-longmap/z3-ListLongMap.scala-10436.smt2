; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122774 () Bool)

(assert start!122774)

(declare-fun b!1423230 () Bool)

(declare-fun res!958722 () Bool)

(declare-fun e!804487 () Bool)

(assert (=> b!1423230 (=> res!958722 e!804487)))

(declare-fun lt!626871 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97092 0))(
  ( (array!97093 (arr!46864 (Array (_ BitVec 32) (_ BitVec 64))) (size!47416 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97092)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11176 0))(
  ( (MissingZero!11176 (index!47096 (_ BitVec 32))) (Found!11176 (index!47097 (_ BitVec 32))) (Intermediate!11176 (undefined!11988 Bool) (index!47098 (_ BitVec 32)) (x!128727 (_ BitVec 32))) (Undefined!11176) (MissingVacant!11176 (index!47099 (_ BitVec 32))) )
))
(declare-fun lt!626869 () SeekEntryResult!11176)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97092 (_ BitVec 32)) SeekEntryResult!11176)

(assert (=> b!1423230 (= res!958722 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626871 (select (arr!46864 a!2831) j!81) a!2831 mask!2608) lt!626869)))))

(declare-fun b!1423231 () Bool)

(declare-fun res!958725 () Bool)

(declare-fun e!804482 () Bool)

(assert (=> b!1423231 (=> (not res!958725) (not e!804482))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1423231 (= res!958725 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1423232 () Bool)

(declare-fun res!958717 () Bool)

(declare-fun e!804486 () Bool)

(assert (=> b!1423232 (=> (not res!958717) (not e!804486))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97092 (_ BitVec 32)) Bool)

(assert (=> b!1423232 (= res!958717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1423233 () Bool)

(declare-fun e!804484 () Bool)

(assert (=> b!1423233 (= e!804484 e!804482)))

(declare-fun res!958721 () Bool)

(assert (=> b!1423233 (=> (not res!958721) (not e!804482))))

(declare-fun lt!626868 () array!97092)

(declare-fun lt!626872 () SeekEntryResult!11176)

(declare-fun lt!626867 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423233 (= res!958721 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626867 mask!2608) lt!626867 lt!626868 mask!2608) lt!626872))))

(assert (=> b!1423233 (= lt!626872 (Intermediate!11176 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1423233 (= lt!626867 (select (store (arr!46864 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423233 (= lt!626868 (array!97093 (store (arr!46864 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47416 a!2831)))))

(declare-fun b!1423234 () Bool)

(declare-fun res!958715 () Bool)

(assert (=> b!1423234 (=> (not res!958715) (not e!804486))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423234 (= res!958715 (validKeyInArray!0 (select (arr!46864 a!2831) j!81)))))

(declare-fun b!1423235 () Bool)

(declare-fun res!958723 () Bool)

(assert (=> b!1423235 (=> (not res!958723) (not e!804482))))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1423235 (= res!958723 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46864 a!2831) j!81) a!2831 mask!2608) lt!626869))))

(declare-fun b!1423236 () Bool)

(declare-fun res!958720 () Bool)

(assert (=> b!1423236 (=> (not res!958720) (not e!804486))))

(declare-datatypes ((List!33452 0))(
  ( (Nil!33449) (Cons!33448 (h!34750 (_ BitVec 64)) (t!48138 List!33452)) )
))
(declare-fun arrayNoDuplicates!0 (array!97092 (_ BitVec 32) List!33452) Bool)

(assert (=> b!1423236 (= res!958720 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33449))))

(declare-fun b!1423237 () Bool)

(assert (=> b!1423237 (= e!804486 e!804484)))

(declare-fun res!958728 () Bool)

(assert (=> b!1423237 (=> (not res!958728) (not e!804484))))

(assert (=> b!1423237 (= res!958728 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46864 a!2831) j!81) mask!2608) (select (arr!46864 a!2831) j!81) a!2831 mask!2608) lt!626869))))

(assert (=> b!1423237 (= lt!626869 (Intermediate!11176 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1423238 () Bool)

(assert (=> b!1423238 (= e!804487 true)))

(declare-fun lt!626870 () SeekEntryResult!11176)

(assert (=> b!1423238 (= lt!626870 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626871 lt!626867 lt!626868 mask!2608))))

(declare-fun b!1423239 () Bool)

(declare-fun res!958714 () Bool)

(assert (=> b!1423239 (=> (not res!958714) (not e!804486))))

(assert (=> b!1423239 (= res!958714 (and (= (size!47416 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47416 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47416 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1423240 () Bool)

(declare-fun res!958726 () Bool)

(assert (=> b!1423240 (=> (not res!958726) (not e!804482))))

(assert (=> b!1423240 (= res!958726 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626867 lt!626868 mask!2608) lt!626872))))

(declare-fun b!1423241 () Bool)

(declare-fun res!958719 () Bool)

(assert (=> b!1423241 (=> (not res!958719) (not e!804486))))

(assert (=> b!1423241 (= res!958719 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47416 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47416 a!2831))))))

(declare-fun e!804485 () Bool)

(declare-fun b!1423242 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97092 (_ BitVec 32)) SeekEntryResult!11176)

(assert (=> b!1423242 (= e!804485 (= (seekEntryOrOpen!0 (select (arr!46864 a!2831) j!81) a!2831 mask!2608) (Found!11176 j!81)))))

(declare-fun b!1423243 () Bool)

(declare-fun res!958716 () Bool)

(assert (=> b!1423243 (=> (not res!958716) (not e!804486))))

(assert (=> b!1423243 (= res!958716 (validKeyInArray!0 (select (arr!46864 a!2831) i!982)))))

(declare-fun res!958718 () Bool)

(assert (=> start!122774 (=> (not res!958718) (not e!804486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122774 (= res!958718 (validMask!0 mask!2608))))

(assert (=> start!122774 e!804486))

(assert (=> start!122774 true))

(declare-fun array_inv!36097 (array!97092) Bool)

(assert (=> start!122774 (array_inv!36097 a!2831)))

(declare-fun b!1423244 () Bool)

(declare-fun e!804488 () Bool)

(assert (=> b!1423244 (= e!804488 e!804487)))

(declare-fun res!958729 () Bool)

(assert (=> b!1423244 (=> res!958729 e!804487)))

(assert (=> b!1423244 (= res!958729 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626871 #b00000000000000000000000000000000) (bvsge lt!626871 (size!47416 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423244 (= lt!626871 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1423245 () Bool)

(assert (=> b!1423245 (= e!804482 (not e!804488))))

(declare-fun res!958724 () Bool)

(assert (=> b!1423245 (=> res!958724 e!804488)))

(assert (=> b!1423245 (= res!958724 (or (= (select (arr!46864 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46864 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46864 a!2831) index!585) (select (arr!46864 a!2831) j!81)) (= (select (store (arr!46864 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1423245 e!804485))

(declare-fun res!958727 () Bool)

(assert (=> b!1423245 (=> (not res!958727) (not e!804485))))

(assert (=> b!1423245 (= res!958727 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48027 0))(
  ( (Unit!48028) )
))
(declare-fun lt!626873 () Unit!48027)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97092 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48027)

(assert (=> b!1423245 (= lt!626873 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (= (and start!122774 res!958718) b!1423239))

(assert (= (and b!1423239 res!958714) b!1423243))

(assert (= (and b!1423243 res!958716) b!1423234))

(assert (= (and b!1423234 res!958715) b!1423232))

(assert (= (and b!1423232 res!958717) b!1423236))

(assert (= (and b!1423236 res!958720) b!1423241))

(assert (= (and b!1423241 res!958719) b!1423237))

(assert (= (and b!1423237 res!958728) b!1423233))

(assert (= (and b!1423233 res!958721) b!1423235))

(assert (= (and b!1423235 res!958723) b!1423240))

(assert (= (and b!1423240 res!958726) b!1423231))

(assert (= (and b!1423231 res!958725) b!1423245))

(assert (= (and b!1423245 res!958727) b!1423242))

(assert (= (and b!1423245 (not res!958724)) b!1423244))

(assert (= (and b!1423244 (not res!958729)) b!1423230))

(assert (= (and b!1423230 (not res!958722)) b!1423238))

(declare-fun m!1313307 () Bool)

(assert (=> b!1423245 m!1313307))

(declare-fun m!1313309 () Bool)

(assert (=> b!1423245 m!1313309))

(declare-fun m!1313311 () Bool)

(assert (=> b!1423245 m!1313311))

(declare-fun m!1313313 () Bool)

(assert (=> b!1423245 m!1313313))

(declare-fun m!1313315 () Bool)

(assert (=> b!1423245 m!1313315))

(declare-fun m!1313317 () Bool)

(assert (=> b!1423245 m!1313317))

(declare-fun m!1313319 () Bool)

(assert (=> b!1423233 m!1313319))

(assert (=> b!1423233 m!1313319))

(declare-fun m!1313321 () Bool)

(assert (=> b!1423233 m!1313321))

(assert (=> b!1423233 m!1313307))

(declare-fun m!1313323 () Bool)

(assert (=> b!1423233 m!1313323))

(declare-fun m!1313325 () Bool)

(assert (=> b!1423240 m!1313325))

(assert (=> b!1423235 m!1313315))

(assert (=> b!1423235 m!1313315))

(declare-fun m!1313327 () Bool)

(assert (=> b!1423235 m!1313327))

(declare-fun m!1313329 () Bool)

(assert (=> b!1423243 m!1313329))

(assert (=> b!1423243 m!1313329))

(declare-fun m!1313331 () Bool)

(assert (=> b!1423243 m!1313331))

(assert (=> b!1423242 m!1313315))

(assert (=> b!1423242 m!1313315))

(declare-fun m!1313333 () Bool)

(assert (=> b!1423242 m!1313333))

(declare-fun m!1313335 () Bool)

(assert (=> b!1423244 m!1313335))

(assert (=> b!1423230 m!1313315))

(assert (=> b!1423230 m!1313315))

(declare-fun m!1313337 () Bool)

(assert (=> b!1423230 m!1313337))

(declare-fun m!1313339 () Bool)

(assert (=> start!122774 m!1313339))

(declare-fun m!1313341 () Bool)

(assert (=> start!122774 m!1313341))

(declare-fun m!1313343 () Bool)

(assert (=> b!1423238 m!1313343))

(assert (=> b!1423237 m!1313315))

(assert (=> b!1423237 m!1313315))

(declare-fun m!1313345 () Bool)

(assert (=> b!1423237 m!1313345))

(assert (=> b!1423237 m!1313345))

(assert (=> b!1423237 m!1313315))

(declare-fun m!1313347 () Bool)

(assert (=> b!1423237 m!1313347))

(declare-fun m!1313349 () Bool)

(assert (=> b!1423236 m!1313349))

(assert (=> b!1423234 m!1313315))

(assert (=> b!1423234 m!1313315))

(declare-fun m!1313351 () Bool)

(assert (=> b!1423234 m!1313351))

(declare-fun m!1313353 () Bool)

(assert (=> b!1423232 m!1313353))

(check-sat (not b!1423230) (not b!1423237) (not b!1423243) (not b!1423236) (not b!1423232) (not b!1423233) (not b!1423244) (not b!1423238) (not b!1423240) (not b!1423234) (not b!1423245) (not start!122774) (not b!1423235) (not b!1423242))
(check-sat)
