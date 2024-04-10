; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130366 () Bool)

(assert start!130366)

(declare-fun b!1530354 () Bool)

(declare-fun res!1047886 () Bool)

(declare-fun e!852772 () Bool)

(assert (=> b!1530354 (=> (not res!1047886) (not e!852772))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101659 0))(
  ( (array!101660 (arr!49053 (Array (_ BitVec 32) (_ BitVec 64))) (size!49603 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101659)

(declare-datatypes ((SeekEntryResult!13218 0))(
  ( (MissingZero!13218 (index!55267 (_ BitVec 32))) (Found!13218 (index!55268 (_ BitVec 32))) (Intermediate!13218 (undefined!14030 Bool) (index!55269 (_ BitVec 32)) (x!136954 (_ BitVec 32))) (Undefined!13218) (MissingVacant!13218 (index!55270 (_ BitVec 32))) )
))
(declare-fun lt!662788 () SeekEntryResult!13218)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101659 (_ BitVec 32)) SeekEntryResult!13218)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530354 (= res!1047886 (= lt!662788 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49053 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49053 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101660 (store (arr!49053 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49603 a!2804)) mask!2512)))))

(declare-fun b!1530355 () Bool)

(declare-fun e!852770 () Bool)

(assert (=> b!1530355 (= e!852770 true)))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!662790 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530355 (= lt!662790 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1530356 () Bool)

(declare-fun res!1047883 () Bool)

(declare-fun e!852771 () Bool)

(assert (=> b!1530356 (=> (not res!1047883) (not e!852771))))

(declare-datatypes ((List!35536 0))(
  ( (Nil!35533) (Cons!35532 (h!36971 (_ BitVec 64)) (t!50230 List!35536)) )
))
(declare-fun arrayNoDuplicates!0 (array!101659 (_ BitVec 32) List!35536) Bool)

(assert (=> b!1530356 (= res!1047883 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35533))))

(declare-fun b!1530357 () Bool)

(declare-fun res!1047878 () Bool)

(assert (=> b!1530357 (=> (not res!1047878) (not e!852771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101659 (_ BitVec 32)) Bool)

(assert (=> b!1530357 (= res!1047878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1530358 () Bool)

(declare-fun res!1047884 () Bool)

(assert (=> b!1530358 (=> (not res!1047884) (not e!852771))))

(assert (=> b!1530358 (= res!1047884 (and (= (size!49603 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49603 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49603 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1530359 () Bool)

(declare-fun res!1047881 () Bool)

(assert (=> b!1530359 (=> (not res!1047881) (not e!852771))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1530359 (= res!1047881 (validKeyInArray!0 (select (arr!49053 a!2804) j!70)))))

(declare-fun res!1047888 () Bool)

(assert (=> start!130366 (=> (not res!1047888) (not e!852771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130366 (= res!1047888 (validMask!0 mask!2512))))

(assert (=> start!130366 e!852771))

(assert (=> start!130366 true))

(declare-fun array_inv!38081 (array!101659) Bool)

(assert (=> start!130366 (array_inv!38081 a!2804)))

(declare-fun b!1530360 () Bool)

(assert (=> b!1530360 (= e!852772 (not e!852770))))

(declare-fun res!1047887 () Bool)

(assert (=> b!1530360 (=> res!1047887 e!852770)))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1530360 (= res!1047887 (or (not (= (select (arr!49053 a!2804) j!70) (select (store (arr!49053 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!852768 () Bool)

(assert (=> b!1530360 e!852768))

(declare-fun res!1047879 () Bool)

(assert (=> b!1530360 (=> (not res!1047879) (not e!852768))))

(assert (=> b!1530360 (= res!1047879 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51220 0))(
  ( (Unit!51221) )
))
(declare-fun lt!662789 () Unit!51220)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101659 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51220)

(assert (=> b!1530360 (= lt!662789 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1530361 () Bool)

(declare-fun res!1047885 () Bool)

(assert (=> b!1530361 (=> (not res!1047885) (not e!852771))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1530361 (= res!1047885 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49603 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49603 a!2804))))))

(declare-fun b!1530362 () Bool)

(assert (=> b!1530362 (= e!852771 e!852772)))

(declare-fun res!1047880 () Bool)

(assert (=> b!1530362 (=> (not res!1047880) (not e!852772))))

(declare-fun lt!662791 () SeekEntryResult!13218)

(assert (=> b!1530362 (= res!1047880 (= lt!662788 lt!662791))))

(assert (=> b!1530362 (= lt!662791 (Intermediate!13218 false resIndex!21 resX!21))))

(assert (=> b!1530362 (= lt!662788 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49053 a!2804) j!70) mask!2512) (select (arr!49053 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530363 () Bool)

(declare-fun res!1047889 () Bool)

(assert (=> b!1530363 (=> (not res!1047889) (not e!852772))))

(assert (=> b!1530363 (= res!1047889 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49053 a!2804) j!70) a!2804 mask!2512) lt!662791))))

(declare-fun b!1530364 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101659 (_ BitVec 32)) SeekEntryResult!13218)

(assert (=> b!1530364 (= e!852768 (= (seekEntry!0 (select (arr!49053 a!2804) j!70) a!2804 mask!2512) (Found!13218 j!70)))))

(declare-fun b!1530365 () Bool)

(declare-fun res!1047882 () Bool)

(assert (=> b!1530365 (=> (not res!1047882) (not e!852771))))

(assert (=> b!1530365 (= res!1047882 (validKeyInArray!0 (select (arr!49053 a!2804) i!961)))))

(assert (= (and start!130366 res!1047888) b!1530358))

(assert (= (and b!1530358 res!1047884) b!1530365))

(assert (= (and b!1530365 res!1047882) b!1530359))

(assert (= (and b!1530359 res!1047881) b!1530357))

(assert (= (and b!1530357 res!1047878) b!1530356))

(assert (= (and b!1530356 res!1047883) b!1530361))

(assert (= (and b!1530361 res!1047885) b!1530362))

(assert (= (and b!1530362 res!1047880) b!1530363))

(assert (= (and b!1530363 res!1047889) b!1530354))

(assert (= (and b!1530354 res!1047886) b!1530360))

(assert (= (and b!1530360 res!1047879) b!1530364))

(assert (= (and b!1530360 (not res!1047887)) b!1530355))

(declare-fun m!1413221 () Bool)

(assert (=> b!1530354 m!1413221))

(declare-fun m!1413223 () Bool)

(assert (=> b!1530354 m!1413223))

(assert (=> b!1530354 m!1413223))

(declare-fun m!1413225 () Bool)

(assert (=> b!1530354 m!1413225))

(assert (=> b!1530354 m!1413225))

(assert (=> b!1530354 m!1413223))

(declare-fun m!1413227 () Bool)

(assert (=> b!1530354 m!1413227))

(declare-fun m!1413229 () Bool)

(assert (=> start!130366 m!1413229))

(declare-fun m!1413231 () Bool)

(assert (=> start!130366 m!1413231))

(declare-fun m!1413233 () Bool)

(assert (=> b!1530360 m!1413233))

(declare-fun m!1413235 () Bool)

(assert (=> b!1530360 m!1413235))

(assert (=> b!1530360 m!1413221))

(assert (=> b!1530360 m!1413223))

(declare-fun m!1413237 () Bool)

(assert (=> b!1530360 m!1413237))

(declare-fun m!1413239 () Bool)

(assert (=> b!1530356 m!1413239))

(declare-fun m!1413241 () Bool)

(assert (=> b!1530365 m!1413241))

(assert (=> b!1530365 m!1413241))

(declare-fun m!1413243 () Bool)

(assert (=> b!1530365 m!1413243))

(declare-fun m!1413245 () Bool)

(assert (=> b!1530357 m!1413245))

(assert (=> b!1530364 m!1413233))

(assert (=> b!1530364 m!1413233))

(declare-fun m!1413247 () Bool)

(assert (=> b!1530364 m!1413247))

(declare-fun m!1413249 () Bool)

(assert (=> b!1530355 m!1413249))

(assert (=> b!1530363 m!1413233))

(assert (=> b!1530363 m!1413233))

(declare-fun m!1413251 () Bool)

(assert (=> b!1530363 m!1413251))

(assert (=> b!1530362 m!1413233))

(assert (=> b!1530362 m!1413233))

(declare-fun m!1413253 () Bool)

(assert (=> b!1530362 m!1413253))

(assert (=> b!1530362 m!1413253))

(assert (=> b!1530362 m!1413233))

(declare-fun m!1413255 () Bool)

(assert (=> b!1530362 m!1413255))

(assert (=> b!1530359 m!1413233))

(assert (=> b!1530359 m!1413233))

(declare-fun m!1413257 () Bool)

(assert (=> b!1530359 m!1413257))

(check-sat (not b!1530354) (not b!1530362) (not b!1530359) (not b!1530357) (not b!1530365) (not b!1530363) (not b!1530355) (not b!1530360) (not b!1530364) (not b!1530356) (not start!130366))
(check-sat)
