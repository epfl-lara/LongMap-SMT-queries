; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129594 () Bool)

(assert start!129594)

(declare-fun b!1521707 () Bool)

(declare-fun res!1041140 () Bool)

(declare-fun e!848510 () Bool)

(assert (=> b!1521707 (=> (not res!1041140) (not e!848510))))

(declare-datatypes ((array!101269 0))(
  ( (array!101270 (arr!48868 (Array (_ BitVec 32) (_ BitVec 64))) (size!49420 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101269)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101269 (_ BitVec 32)) Bool)

(assert (=> b!1521707 (= res!1041140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521708 () Bool)

(declare-fun e!848511 () Bool)

(assert (=> b!1521708 (= e!848510 e!848511)))

(declare-fun res!1041138 () Bool)

(assert (=> b!1521708 (=> (not res!1041138) (not e!848511))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13056 0))(
  ( (MissingZero!13056 (index!54619 (_ BitVec 32))) (Found!13056 (index!54620 (_ BitVec 32))) (Intermediate!13056 (undefined!13868 Bool) (index!54621 (_ BitVec 32)) (x!136310 (_ BitVec 32))) (Undefined!13056) (MissingVacant!13056 (index!54622 (_ BitVec 32))) )
))
(declare-fun lt!659187 () SeekEntryResult!13056)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101269 (_ BitVec 32)) SeekEntryResult!13056)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521708 (= res!1041138 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48868 a!2804) j!70) mask!2512) (select (arr!48868 a!2804) j!70) a!2804 mask!2512) lt!659187))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1521708 (= lt!659187 (Intermediate!13056 false resIndex!21 resX!21))))

(declare-fun b!1521709 () Bool)

(declare-fun res!1041135 () Bool)

(assert (=> b!1521709 (=> (not res!1041135) (not e!848510))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521709 (= res!1041135 (validKeyInArray!0 (select (arr!48868 a!2804) i!961)))))

(declare-fun b!1521710 () Bool)

(declare-fun res!1041137 () Bool)

(assert (=> b!1521710 (=> (not res!1041137) (not e!848511))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1521710 (= res!1041137 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48868 a!2804) j!70) a!2804 mask!2512) lt!659187))))

(declare-fun res!1041139 () Bool)

(assert (=> start!129594 (=> (not res!1041139) (not e!848510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129594 (= res!1041139 (validMask!0 mask!2512))))

(assert (=> start!129594 e!848510))

(assert (=> start!129594 true))

(declare-fun array_inv!38101 (array!101269) Bool)

(assert (=> start!129594 (array_inv!38101 a!2804)))

(declare-fun b!1521711 () Bool)

(declare-fun res!1041142 () Bool)

(assert (=> b!1521711 (=> (not res!1041142) (not e!848510))))

(assert (=> b!1521711 (= res!1041142 (and (= (size!49420 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49420 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49420 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521712 () Bool)

(assert (=> b!1521712 (= e!848511 false)))

(declare-fun lt!659186 () SeekEntryResult!13056)

(assert (=> b!1521712 (= lt!659186 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48868 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48868 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101270 (store (arr!48868 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49420 a!2804)) mask!2512))))

(declare-fun b!1521713 () Bool)

(declare-fun res!1041143 () Bool)

(assert (=> b!1521713 (=> (not res!1041143) (not e!848510))))

(assert (=> b!1521713 (= res!1041143 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49420 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49420 a!2804))))))

(declare-fun b!1521714 () Bool)

(declare-fun res!1041136 () Bool)

(assert (=> b!1521714 (=> (not res!1041136) (not e!848510))))

(assert (=> b!1521714 (= res!1041136 (validKeyInArray!0 (select (arr!48868 a!2804) j!70)))))

(declare-fun b!1521715 () Bool)

(declare-fun res!1041141 () Bool)

(assert (=> b!1521715 (=> (not res!1041141) (not e!848510))))

(declare-datatypes ((List!35429 0))(
  ( (Nil!35426) (Cons!35425 (h!36847 (_ BitVec 64)) (t!50115 List!35429)) )
))
(declare-fun arrayNoDuplicates!0 (array!101269 (_ BitVec 32) List!35429) Bool)

(assert (=> b!1521715 (= res!1041141 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35426))))

(assert (= (and start!129594 res!1041139) b!1521711))

(assert (= (and b!1521711 res!1041142) b!1521709))

(assert (= (and b!1521709 res!1041135) b!1521714))

(assert (= (and b!1521714 res!1041136) b!1521707))

(assert (= (and b!1521707 res!1041140) b!1521715))

(assert (= (and b!1521715 res!1041141) b!1521713))

(assert (= (and b!1521713 res!1041143) b!1521708))

(assert (= (and b!1521708 res!1041138) b!1521710))

(assert (= (and b!1521710 res!1041137) b!1521712))

(declare-fun m!1404261 () Bool)

(assert (=> start!129594 m!1404261))

(declare-fun m!1404263 () Bool)

(assert (=> start!129594 m!1404263))

(declare-fun m!1404265 () Bool)

(assert (=> b!1521712 m!1404265))

(declare-fun m!1404267 () Bool)

(assert (=> b!1521712 m!1404267))

(assert (=> b!1521712 m!1404267))

(declare-fun m!1404269 () Bool)

(assert (=> b!1521712 m!1404269))

(assert (=> b!1521712 m!1404269))

(assert (=> b!1521712 m!1404267))

(declare-fun m!1404271 () Bool)

(assert (=> b!1521712 m!1404271))

(declare-fun m!1404273 () Bool)

(assert (=> b!1521715 m!1404273))

(declare-fun m!1404275 () Bool)

(assert (=> b!1521710 m!1404275))

(assert (=> b!1521710 m!1404275))

(declare-fun m!1404277 () Bool)

(assert (=> b!1521710 m!1404277))

(assert (=> b!1521708 m!1404275))

(assert (=> b!1521708 m!1404275))

(declare-fun m!1404279 () Bool)

(assert (=> b!1521708 m!1404279))

(assert (=> b!1521708 m!1404279))

(assert (=> b!1521708 m!1404275))

(declare-fun m!1404281 () Bool)

(assert (=> b!1521708 m!1404281))

(assert (=> b!1521714 m!1404275))

(assert (=> b!1521714 m!1404275))

(declare-fun m!1404283 () Bool)

(assert (=> b!1521714 m!1404283))

(declare-fun m!1404285 () Bool)

(assert (=> b!1521707 m!1404285))

(declare-fun m!1404287 () Bool)

(assert (=> b!1521709 m!1404287))

(assert (=> b!1521709 m!1404287))

(declare-fun m!1404289 () Bool)

(assert (=> b!1521709 m!1404289))

(check-sat (not b!1521715) (not b!1521714) (not start!129594) (not b!1521707) (not b!1521709) (not b!1521710) (not b!1521708) (not b!1521712))
(check-sat)
