; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130494 () Bool)

(assert start!130494)

(declare-fun b!1529530 () Bool)

(declare-fun e!852649 () Bool)

(declare-fun e!852651 () Bool)

(assert (=> b!1529530 (= e!852649 e!852651)))

(declare-fun res!1046090 () Bool)

(assert (=> b!1529530 (=> (not res!1046090) (not e!852651))))

(declare-datatypes ((array!101644 0))(
  ( (array!101645 (arr!49042 (Array (_ BitVec 32) (_ BitVec 64))) (size!49593 (_ BitVec 32))) )
))
(declare-fun lt!662238 () array!101644)

(declare-datatypes ((SeekEntryResult!13100 0))(
  ( (MissingZero!13100 (index!54795 (_ BitVec 32))) (Found!13100 (index!54796 (_ BitVec 32))) (Intermediate!13100 (undefined!13912 Bool) (index!54797 (_ BitVec 32)) (x!136697 (_ BitVec 32))) (Undefined!13100) (MissingVacant!13100 (index!54798 (_ BitVec 32))) )
))
(declare-fun lt!662234 () SeekEntryResult!13100)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun lt!662235 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101644 (_ BitVec 32)) SeekEntryResult!13100)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529530 (= res!1046090 (= lt!662234 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!662235 mask!2512) lt!662235 lt!662238 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun a!2804 () array!101644)

(assert (=> b!1529530 (= lt!662235 (select (store (arr!49042 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1529530 (= lt!662238 (array!101645 (store (arr!49042 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49593 a!2804)))))

(declare-fun b!1529531 () Bool)

(declare-fun res!1046085 () Bool)

(declare-fun e!852655 () Bool)

(assert (=> b!1529531 (=> (not res!1046085) (not e!852655))))

(assert (=> b!1529531 (= res!1046085 (and (= (size!49593 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49593 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49593 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529532 () Bool)

(assert (=> b!1529532 (= e!852651 (not true))))

(declare-fun e!852654 () Bool)

(assert (=> b!1529532 e!852654))

(declare-fun res!1046084 () Bool)

(assert (=> b!1529532 (=> (not res!1046084) (not e!852654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101644 (_ BitVec 32)) Bool)

(assert (=> b!1529532 (= res!1046084 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51019 0))(
  ( (Unit!51020) )
))
(declare-fun lt!662236 () Unit!51019)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101644 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51019)

(assert (=> b!1529532 (= lt!662236 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529533 () Bool)

(declare-fun e!852650 () Bool)

(declare-fun e!852653 () Bool)

(assert (=> b!1529533 (= e!852650 e!852653)))

(declare-fun res!1046083 () Bool)

(assert (=> b!1529533 (=> (not res!1046083) (not e!852653))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101644 (_ BitVec 32)) SeekEntryResult!13100)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101644 (_ BitVec 32)) SeekEntryResult!13100)

(assert (=> b!1529533 (= res!1046083 (= (seekEntryOrOpen!0 (select (arr!49042 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49042 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1529534 () Bool)

(declare-fun res!1046080 () Bool)

(assert (=> b!1529534 (=> (not res!1046080) (not e!852655))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529534 (= res!1046080 (validKeyInArray!0 (select (arr!49042 a!2804) i!961)))))

(declare-fun res!1046081 () Bool)

(assert (=> start!130494 (=> (not res!1046081) (not e!852655))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130494 (= res!1046081 (validMask!0 mask!2512))))

(assert (=> start!130494 e!852655))

(assert (=> start!130494 true))

(declare-fun array_inv!38323 (array!101644) Bool)

(assert (=> start!130494 (array_inv!38323 a!2804)))

(declare-fun b!1529535 () Bool)

(assert (=> b!1529535 (= e!852655 e!852649)))

(declare-fun res!1046089 () Bool)

(assert (=> b!1529535 (=> (not res!1046089) (not e!852649))))

(declare-fun lt!662237 () SeekEntryResult!13100)

(assert (=> b!1529535 (= res!1046089 (= lt!662234 lt!662237))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1529535 (= lt!662237 (Intermediate!13100 false resIndex!21 resX!21))))

(assert (=> b!1529535 (= lt!662234 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49042 a!2804) j!70) mask!2512) (select (arr!49042 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529536 () Bool)

(declare-fun res!1046091 () Bool)

(assert (=> b!1529536 (=> (not res!1046091) (not e!852655))))

(assert (=> b!1529536 (= res!1046091 (validKeyInArray!0 (select (arr!49042 a!2804) j!70)))))

(declare-fun b!1529537 () Bool)

(declare-fun res!1046087 () Bool)

(assert (=> b!1529537 (=> (not res!1046087) (not e!852654))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101644 (_ BitVec 32)) SeekEntryResult!13100)

(assert (=> b!1529537 (= res!1046087 (= (seekEntry!0 (select (arr!49042 a!2804) j!70) a!2804 mask!2512) (Found!13100 j!70)))))

(declare-fun b!1529538 () Bool)

(declare-fun res!1046078 () Bool)

(assert (=> b!1529538 (=> (not res!1046078) (not e!852649))))

(assert (=> b!1529538 (= res!1046078 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49042 a!2804) j!70) a!2804 mask!2512) lt!662237))))

(declare-fun b!1529539 () Bool)

(declare-fun res!1046079 () Bool)

(assert (=> b!1529539 (=> (not res!1046079) (not e!852655))))

(declare-datatypes ((List!35512 0))(
  ( (Nil!35509) (Cons!35508 (h!36959 (_ BitVec 64)) (t!50198 List!35512)) )
))
(declare-fun arrayNoDuplicates!0 (array!101644 (_ BitVec 32) List!35512) Bool)

(assert (=> b!1529539 (= res!1046079 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35509))))

(declare-fun b!1529540 () Bool)

(assert (=> b!1529540 (= e!852654 e!852650)))

(declare-fun res!1046086 () Bool)

(assert (=> b!1529540 (=> res!1046086 e!852650)))

(assert (=> b!1529540 (= res!1046086 (or (not (= (select (arr!49042 a!2804) j!70) lt!662235)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49042 a!2804) index!487) (select (arr!49042 a!2804) j!70)) (not (= (select (arr!49042 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1529541 () Bool)

(declare-fun res!1046088 () Bool)

(assert (=> b!1529541 (=> (not res!1046088) (not e!852655))))

(assert (=> b!1529541 (= res!1046088 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49593 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49593 a!2804))))))

(declare-fun b!1529542 () Bool)

(assert (=> b!1529542 (= e!852653 (= (seekEntryOrOpen!0 lt!662235 lt!662238 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!662235 lt!662238 mask!2512)))))

(declare-fun b!1529543 () Bool)

(declare-fun res!1046082 () Bool)

(assert (=> b!1529543 (=> (not res!1046082) (not e!852655))))

(assert (=> b!1529543 (= res!1046082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!130494 res!1046081) b!1529531))

(assert (= (and b!1529531 res!1046085) b!1529534))

(assert (= (and b!1529534 res!1046080) b!1529536))

(assert (= (and b!1529536 res!1046091) b!1529543))

(assert (= (and b!1529543 res!1046082) b!1529539))

(assert (= (and b!1529539 res!1046079) b!1529541))

(assert (= (and b!1529541 res!1046088) b!1529535))

(assert (= (and b!1529535 res!1046089) b!1529538))

(assert (= (and b!1529538 res!1046078) b!1529530))

(assert (= (and b!1529530 res!1046090) b!1529532))

(assert (= (and b!1529532 res!1046084) b!1529537))

(assert (= (and b!1529537 res!1046087) b!1529540))

(assert (= (and b!1529540 (not res!1046086)) b!1529533))

(assert (= (and b!1529533 res!1046083) b!1529542))

(declare-fun m!1412257 () Bool)

(assert (=> b!1529533 m!1412257))

(assert (=> b!1529533 m!1412257))

(declare-fun m!1412259 () Bool)

(assert (=> b!1529533 m!1412259))

(assert (=> b!1529533 m!1412257))

(declare-fun m!1412261 () Bool)

(assert (=> b!1529533 m!1412261))

(declare-fun m!1412263 () Bool)

(assert (=> b!1529534 m!1412263))

(assert (=> b!1529534 m!1412263))

(declare-fun m!1412265 () Bool)

(assert (=> b!1529534 m!1412265))

(declare-fun m!1412267 () Bool)

(assert (=> b!1529530 m!1412267))

(assert (=> b!1529530 m!1412267))

(declare-fun m!1412269 () Bool)

(assert (=> b!1529530 m!1412269))

(declare-fun m!1412271 () Bool)

(assert (=> b!1529530 m!1412271))

(declare-fun m!1412273 () Bool)

(assert (=> b!1529530 m!1412273))

(declare-fun m!1412275 () Bool)

(assert (=> b!1529532 m!1412275))

(declare-fun m!1412277 () Bool)

(assert (=> b!1529532 m!1412277))

(declare-fun m!1412279 () Bool)

(assert (=> start!130494 m!1412279))

(declare-fun m!1412281 () Bool)

(assert (=> start!130494 m!1412281))

(assert (=> b!1529536 m!1412257))

(assert (=> b!1529536 m!1412257))

(declare-fun m!1412283 () Bool)

(assert (=> b!1529536 m!1412283))

(assert (=> b!1529540 m!1412257))

(declare-fun m!1412285 () Bool)

(assert (=> b!1529540 m!1412285))

(assert (=> b!1529537 m!1412257))

(assert (=> b!1529537 m!1412257))

(declare-fun m!1412287 () Bool)

(assert (=> b!1529537 m!1412287))

(assert (=> b!1529538 m!1412257))

(assert (=> b!1529538 m!1412257))

(declare-fun m!1412289 () Bool)

(assert (=> b!1529538 m!1412289))

(assert (=> b!1529535 m!1412257))

(assert (=> b!1529535 m!1412257))

(declare-fun m!1412291 () Bool)

(assert (=> b!1529535 m!1412291))

(assert (=> b!1529535 m!1412291))

(assert (=> b!1529535 m!1412257))

(declare-fun m!1412293 () Bool)

(assert (=> b!1529535 m!1412293))

(declare-fun m!1412295 () Bool)

(assert (=> b!1529539 m!1412295))

(declare-fun m!1412297 () Bool)

(assert (=> b!1529542 m!1412297))

(declare-fun m!1412299 () Bool)

(assert (=> b!1529542 m!1412299))

(declare-fun m!1412301 () Bool)

(assert (=> b!1529543 m!1412301))

(check-sat (not b!1529539) (not b!1529537) (not b!1529536) (not b!1529535) (not b!1529530) (not b!1529538) (not start!130494) (not b!1529543) (not b!1529532) (not b!1529533) (not b!1529534) (not b!1529542))
(check-sat)
