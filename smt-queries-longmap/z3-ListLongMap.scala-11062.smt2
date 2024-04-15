; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129152 () Bool)

(assert start!129152)

(declare-fun b!1516393 () Bool)

(declare-fun e!846075 () Bool)

(declare-fun e!846074 () Bool)

(assert (=> b!1516393 (= e!846075 (not e!846074))))

(declare-fun res!1036514 () Bool)

(assert (=> b!1516393 (=> res!1036514 e!846074)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!101008 0))(
  ( (array!101009 (arr!48742 (Array (_ BitVec 32) (_ BitVec 64))) (size!49294 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101008)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1516393 (= res!1036514 (or (not (= (select (arr!48742 a!2804) j!70) (select (store (arr!48742 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846076 () Bool)

(assert (=> b!1516393 e!846076))

(declare-fun res!1036505 () Bool)

(assert (=> b!1516393 (=> (not res!1036505) (not e!846076))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101008 (_ BitVec 32)) Bool)

(assert (=> b!1516393 (= res!1036505 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50579 0))(
  ( (Unit!50580) )
))
(declare-fun lt!657222 () Unit!50579)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101008 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50579)

(assert (=> b!1516393 (= lt!657222 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516394 () Bool)

(declare-fun res!1036510 () Bool)

(declare-fun e!846073 () Bool)

(assert (=> b!1516394 (=> (not res!1036510) (not e!846073))))

(declare-datatypes ((List!35303 0))(
  ( (Nil!35300) (Cons!35299 (h!36712 (_ BitVec 64)) (t!49989 List!35303)) )
))
(declare-fun arrayNoDuplicates!0 (array!101008 (_ BitVec 32) List!35303) Bool)

(assert (=> b!1516394 (= res!1036510 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35300))))

(declare-fun res!1036502 () Bool)

(assert (=> start!129152 (=> (not res!1036502) (not e!846073))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129152 (= res!1036502 (validMask!0 mask!2512))))

(assert (=> start!129152 e!846073))

(assert (=> start!129152 true))

(declare-fun array_inv!37975 (array!101008) Bool)

(assert (=> start!129152 (array_inv!37975 a!2804)))

(declare-fun b!1516395 () Bool)

(assert (=> b!1516395 (= e!846073 e!846075)))

(declare-fun res!1036508 () Bool)

(assert (=> b!1516395 (=> (not res!1036508) (not e!846075))))

(declare-datatypes ((SeekEntryResult!12936 0))(
  ( (MissingZero!12936 (index!54139 (_ BitVec 32))) (Found!12936 (index!54140 (_ BitVec 32))) (Intermediate!12936 (undefined!13748 Bool) (index!54141 (_ BitVec 32)) (x!135832 (_ BitVec 32))) (Undefined!12936) (MissingVacant!12936 (index!54142 (_ BitVec 32))) )
))
(declare-fun lt!657221 () SeekEntryResult!12936)

(declare-fun lt!657218 () SeekEntryResult!12936)

(assert (=> b!1516395 (= res!1036508 (= lt!657221 lt!657218))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1516395 (= lt!657218 (Intermediate!12936 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101008 (_ BitVec 32)) SeekEntryResult!12936)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516395 (= lt!657221 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48742 a!2804) j!70) mask!2512) (select (arr!48742 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516396 () Bool)

(declare-fun res!1036513 () Bool)

(assert (=> b!1516396 (=> (not res!1036513) (not e!846075))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1516396 (= res!1036513 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48742 a!2804) j!70) a!2804 mask!2512) lt!657218))))

(declare-fun b!1516397 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101008 (_ BitVec 32)) SeekEntryResult!12936)

(assert (=> b!1516397 (= e!846076 (= (seekEntry!0 (select (arr!48742 a!2804) j!70) a!2804 mask!2512) (Found!12936 j!70)))))

(declare-fun b!1516398 () Bool)

(declare-fun res!1036507 () Bool)

(assert (=> b!1516398 (=> (not res!1036507) (not e!846073))))

(assert (=> b!1516398 (= res!1036507 (and (= (size!49294 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49294 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49294 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516399 () Bool)

(declare-fun res!1036506 () Bool)

(assert (=> b!1516399 (=> (not res!1036506) (not e!846073))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516399 (= res!1036506 (validKeyInArray!0 (select (arr!48742 a!2804) i!961)))))

(declare-fun b!1516400 () Bool)

(declare-fun res!1036511 () Bool)

(assert (=> b!1516400 (=> (not res!1036511) (not e!846073))))

(assert (=> b!1516400 (= res!1036511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516401 () Bool)

(declare-fun e!846077 () Bool)

(assert (=> b!1516401 (= e!846077 true)))

(declare-fun lt!657219 () SeekEntryResult!12936)

(declare-fun lt!657220 () (_ BitVec 32))

(assert (=> b!1516401 (= lt!657219 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657220 (select (arr!48742 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516402 () Bool)

(assert (=> b!1516402 (= e!846074 e!846077)))

(declare-fun res!1036504 () Bool)

(assert (=> b!1516402 (=> res!1036504 e!846077)))

(assert (=> b!1516402 (= res!1036504 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657220 #b00000000000000000000000000000000) (bvsge lt!657220 (size!49294 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516402 (= lt!657220 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1516403 () Bool)

(declare-fun res!1036503 () Bool)

(assert (=> b!1516403 (=> (not res!1036503) (not e!846073))))

(assert (=> b!1516403 (= res!1036503 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49294 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49294 a!2804))))))

(declare-fun b!1516404 () Bool)

(declare-fun res!1036512 () Bool)

(assert (=> b!1516404 (=> (not res!1036512) (not e!846075))))

(assert (=> b!1516404 (= res!1036512 (= lt!657221 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48742 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48742 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101009 (store (arr!48742 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49294 a!2804)) mask!2512)))))

(declare-fun b!1516405 () Bool)

(declare-fun res!1036509 () Bool)

(assert (=> b!1516405 (=> (not res!1036509) (not e!846073))))

(assert (=> b!1516405 (= res!1036509 (validKeyInArray!0 (select (arr!48742 a!2804) j!70)))))

(assert (= (and start!129152 res!1036502) b!1516398))

(assert (= (and b!1516398 res!1036507) b!1516399))

(assert (= (and b!1516399 res!1036506) b!1516405))

(assert (= (and b!1516405 res!1036509) b!1516400))

(assert (= (and b!1516400 res!1036511) b!1516394))

(assert (= (and b!1516394 res!1036510) b!1516403))

(assert (= (and b!1516403 res!1036503) b!1516395))

(assert (= (and b!1516395 res!1036508) b!1516396))

(assert (= (and b!1516396 res!1036513) b!1516404))

(assert (= (and b!1516404 res!1036512) b!1516393))

(assert (= (and b!1516393 res!1036505) b!1516397))

(assert (= (and b!1516393 (not res!1036514)) b!1516402))

(assert (= (and b!1516402 (not res!1036504)) b!1516401))

(declare-fun m!1399097 () Bool)

(assert (=> b!1516401 m!1399097))

(assert (=> b!1516401 m!1399097))

(declare-fun m!1399099 () Bool)

(assert (=> b!1516401 m!1399099))

(declare-fun m!1399101 () Bool)

(assert (=> b!1516402 m!1399101))

(assert (=> b!1516395 m!1399097))

(assert (=> b!1516395 m!1399097))

(declare-fun m!1399103 () Bool)

(assert (=> b!1516395 m!1399103))

(assert (=> b!1516395 m!1399103))

(assert (=> b!1516395 m!1399097))

(declare-fun m!1399105 () Bool)

(assert (=> b!1516395 m!1399105))

(declare-fun m!1399107 () Bool)

(assert (=> b!1516400 m!1399107))

(declare-fun m!1399109 () Bool)

(assert (=> start!129152 m!1399109))

(declare-fun m!1399111 () Bool)

(assert (=> start!129152 m!1399111))

(declare-fun m!1399113 () Bool)

(assert (=> b!1516394 m!1399113))

(assert (=> b!1516397 m!1399097))

(assert (=> b!1516397 m!1399097))

(declare-fun m!1399115 () Bool)

(assert (=> b!1516397 m!1399115))

(assert (=> b!1516396 m!1399097))

(assert (=> b!1516396 m!1399097))

(declare-fun m!1399117 () Bool)

(assert (=> b!1516396 m!1399117))

(assert (=> b!1516393 m!1399097))

(declare-fun m!1399119 () Bool)

(assert (=> b!1516393 m!1399119))

(declare-fun m!1399121 () Bool)

(assert (=> b!1516393 m!1399121))

(declare-fun m!1399123 () Bool)

(assert (=> b!1516393 m!1399123))

(declare-fun m!1399125 () Bool)

(assert (=> b!1516393 m!1399125))

(assert (=> b!1516405 m!1399097))

(assert (=> b!1516405 m!1399097))

(declare-fun m!1399127 () Bool)

(assert (=> b!1516405 m!1399127))

(declare-fun m!1399129 () Bool)

(assert (=> b!1516399 m!1399129))

(assert (=> b!1516399 m!1399129))

(declare-fun m!1399131 () Bool)

(assert (=> b!1516399 m!1399131))

(assert (=> b!1516404 m!1399121))

(assert (=> b!1516404 m!1399123))

(assert (=> b!1516404 m!1399123))

(declare-fun m!1399133 () Bool)

(assert (=> b!1516404 m!1399133))

(assert (=> b!1516404 m!1399133))

(assert (=> b!1516404 m!1399123))

(declare-fun m!1399135 () Bool)

(assert (=> b!1516404 m!1399135))

(check-sat (not b!1516402) (not start!129152) (not b!1516404) (not b!1516393) (not b!1516400) (not b!1516394) (not b!1516397) (not b!1516401) (not b!1516396) (not b!1516405) (not b!1516395) (not b!1516399))
(check-sat)
