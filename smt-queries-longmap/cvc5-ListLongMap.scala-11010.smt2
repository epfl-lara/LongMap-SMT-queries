; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128892 () Bool)

(assert start!128892)

(declare-fun b!1510708 () Bool)

(declare-fun res!1030620 () Bool)

(declare-fun e!843558 () Bool)

(assert (=> b!1510708 (=> (not res!1030620) (not e!843558))))

(declare-datatypes ((array!100748 0))(
  ( (array!100749 (arr!48611 (Array (_ BitVec 32) (_ BitVec 64))) (size!49161 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100748)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100748 (_ BitVec 32)) Bool)

(assert (=> b!1510708 (= res!1030620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510709 () Bool)

(declare-fun e!843557 () Bool)

(assert (=> b!1510709 (= e!843558 e!843557)))

(declare-fun res!1030619 () Bool)

(assert (=> b!1510709 (=> (not res!1030619) (not e!843557))))

(declare-datatypes ((SeekEntryResult!12782 0))(
  ( (MissingZero!12782 (index!53523 (_ BitVec 32))) (Found!12782 (index!53524 (_ BitVec 32))) (Intermediate!12782 (undefined!13594 Bool) (index!53525 (_ BitVec 32)) (x!135268 (_ BitVec 32))) (Undefined!12782) (MissingVacant!12782 (index!53526 (_ BitVec 32))) )
))
(declare-fun lt!655242 () SeekEntryResult!12782)

(declare-fun lt!655241 () SeekEntryResult!12782)

(assert (=> b!1510709 (= res!1030619 (= lt!655242 lt!655241))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1510709 (= lt!655241 (Intermediate!12782 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100748 (_ BitVec 32)) SeekEntryResult!12782)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510709 (= lt!655242 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48611 a!2804) j!70) mask!2512) (select (arr!48611 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510710 () Bool)

(assert (=> b!1510710 (= e!843557 (not true))))

(declare-fun e!843559 () Bool)

(assert (=> b!1510710 e!843559))

(declare-fun res!1030618 () Bool)

(assert (=> b!1510710 (=> (not res!1030618) (not e!843559))))

(assert (=> b!1510710 (= res!1030618 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50432 0))(
  ( (Unit!50433) )
))
(declare-fun lt!655243 () Unit!50432)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100748 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50432)

(assert (=> b!1510710 (= lt!655243 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1510711 () Bool)

(declare-fun res!1030616 () Bool)

(assert (=> b!1510711 (=> (not res!1030616) (not e!843558))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1510711 (= res!1030616 (and (= (size!49161 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49161 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49161 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510712 () Bool)

(declare-fun res!1030615 () Bool)

(assert (=> b!1510712 (=> (not res!1030615) (not e!843557))))

(assert (=> b!1510712 (= res!1030615 (= lt!655242 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48611 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48611 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100749 (store (arr!48611 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49161 a!2804)) mask!2512)))))

(declare-fun b!1510713 () Bool)

(declare-fun res!1030614 () Bool)

(assert (=> b!1510713 (=> (not res!1030614) (not e!843558))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510713 (= res!1030614 (validKeyInArray!0 (select (arr!48611 a!2804) j!70)))))

(declare-fun b!1510714 () Bool)

(declare-fun res!1030617 () Bool)

(assert (=> b!1510714 (=> (not res!1030617) (not e!843558))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1510714 (= res!1030617 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49161 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49161 a!2804))))))

(declare-fun b!1510715 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100748 (_ BitVec 32)) SeekEntryResult!12782)

(assert (=> b!1510715 (= e!843559 (= (seekEntry!0 (select (arr!48611 a!2804) j!70) a!2804 mask!2512) (Found!12782 j!70)))))

(declare-fun res!1030621 () Bool)

(assert (=> start!128892 (=> (not res!1030621) (not e!843558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128892 (= res!1030621 (validMask!0 mask!2512))))

(assert (=> start!128892 e!843558))

(assert (=> start!128892 true))

(declare-fun array_inv!37639 (array!100748) Bool)

(assert (=> start!128892 (array_inv!37639 a!2804)))

(declare-fun b!1510716 () Bool)

(declare-fun res!1030612 () Bool)

(assert (=> b!1510716 (=> (not res!1030612) (not e!843558))))

(declare-datatypes ((List!35094 0))(
  ( (Nil!35091) (Cons!35090 (h!36502 (_ BitVec 64)) (t!49788 List!35094)) )
))
(declare-fun arrayNoDuplicates!0 (array!100748 (_ BitVec 32) List!35094) Bool)

(assert (=> b!1510716 (= res!1030612 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35091))))

(declare-fun b!1510717 () Bool)

(declare-fun res!1030611 () Bool)

(assert (=> b!1510717 (=> (not res!1030611) (not e!843558))))

(assert (=> b!1510717 (= res!1030611 (validKeyInArray!0 (select (arr!48611 a!2804) i!961)))))

(declare-fun b!1510718 () Bool)

(declare-fun res!1030613 () Bool)

(assert (=> b!1510718 (=> (not res!1030613) (not e!843557))))

(assert (=> b!1510718 (= res!1030613 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48611 a!2804) j!70) a!2804 mask!2512) lt!655241))))

(assert (= (and start!128892 res!1030621) b!1510711))

(assert (= (and b!1510711 res!1030616) b!1510717))

(assert (= (and b!1510717 res!1030611) b!1510713))

(assert (= (and b!1510713 res!1030614) b!1510708))

(assert (= (and b!1510708 res!1030620) b!1510716))

(assert (= (and b!1510716 res!1030612) b!1510714))

(assert (= (and b!1510714 res!1030617) b!1510709))

(assert (= (and b!1510709 res!1030619) b!1510718))

(assert (= (and b!1510718 res!1030613) b!1510712))

(assert (= (and b!1510712 res!1030615) b!1510710))

(assert (= (and b!1510710 res!1030618) b!1510715))

(declare-fun m!1393327 () Bool)

(assert (=> b!1510708 m!1393327))

(declare-fun m!1393329 () Bool)

(assert (=> b!1510713 m!1393329))

(assert (=> b!1510713 m!1393329))

(declare-fun m!1393331 () Bool)

(assert (=> b!1510713 m!1393331))

(declare-fun m!1393333 () Bool)

(assert (=> b!1510717 m!1393333))

(assert (=> b!1510717 m!1393333))

(declare-fun m!1393335 () Bool)

(assert (=> b!1510717 m!1393335))

(declare-fun m!1393337 () Bool)

(assert (=> b!1510716 m!1393337))

(assert (=> b!1510715 m!1393329))

(assert (=> b!1510715 m!1393329))

(declare-fun m!1393339 () Bool)

(assert (=> b!1510715 m!1393339))

(assert (=> b!1510718 m!1393329))

(assert (=> b!1510718 m!1393329))

(declare-fun m!1393341 () Bool)

(assert (=> b!1510718 m!1393341))

(assert (=> b!1510709 m!1393329))

(assert (=> b!1510709 m!1393329))

(declare-fun m!1393343 () Bool)

(assert (=> b!1510709 m!1393343))

(assert (=> b!1510709 m!1393343))

(assert (=> b!1510709 m!1393329))

(declare-fun m!1393345 () Bool)

(assert (=> b!1510709 m!1393345))

(declare-fun m!1393347 () Bool)

(assert (=> b!1510710 m!1393347))

(declare-fun m!1393349 () Bool)

(assert (=> b!1510710 m!1393349))

(declare-fun m!1393351 () Bool)

(assert (=> b!1510712 m!1393351))

(declare-fun m!1393353 () Bool)

(assert (=> b!1510712 m!1393353))

(assert (=> b!1510712 m!1393353))

(declare-fun m!1393355 () Bool)

(assert (=> b!1510712 m!1393355))

(assert (=> b!1510712 m!1393355))

(assert (=> b!1510712 m!1393353))

(declare-fun m!1393357 () Bool)

(assert (=> b!1510712 m!1393357))

(declare-fun m!1393359 () Bool)

(assert (=> start!128892 m!1393359))

(declare-fun m!1393361 () Bool)

(assert (=> start!128892 m!1393361))

(push 1)

