; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128576 () Bool)

(assert start!128576)

(declare-fun res!1027577 () Bool)

(declare-fun e!842241 () Bool)

(assert (=> start!128576 (=> (not res!1027577) (not e!842241))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128576 (= res!1027577 (validMask!0 mask!2512))))

(assert (=> start!128576 e!842241))

(assert (=> start!128576 true))

(declare-datatypes ((array!100549 0))(
  ( (array!100550 (arr!48516 (Array (_ BitVec 32) (_ BitVec 64))) (size!49066 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100549)

(declare-fun array_inv!37544 (array!100549) Bool)

(assert (=> start!128576 (array_inv!37544 a!2804)))

(declare-fun b!1507356 () Bool)

(declare-fun res!1027581 () Bool)

(assert (=> b!1507356 (=> (not res!1027581) (not e!842241))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1507356 (= res!1027581 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49066 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49066 a!2804))))))

(declare-fun b!1507357 () Bool)

(declare-fun e!842240 () Bool)

(assert (=> b!1507357 (= e!842240 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun b!1507358 () Bool)

(declare-fun res!1027574 () Bool)

(assert (=> b!1507358 (=> (not res!1027574) (not e!842241))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507358 (= res!1027574 (validKeyInArray!0 (select (arr!48516 a!2804) i!961)))))

(declare-fun b!1507359 () Bool)

(declare-fun res!1027579 () Bool)

(assert (=> b!1507359 (=> (not res!1027579) (not e!842241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100549 (_ BitVec 32)) Bool)

(assert (=> b!1507359 (= res!1027579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507360 () Bool)

(assert (=> b!1507360 (= e!842241 e!842240)))

(declare-fun res!1027575 () Bool)

(assert (=> b!1507360 (=> (not res!1027575) (not e!842240))))

(declare-datatypes ((SeekEntryResult!12687 0))(
  ( (MissingZero!12687 (index!53143 (_ BitVec 32))) (Found!12687 (index!53144 (_ BitVec 32))) (Intermediate!12687 (undefined!13499 Bool) (index!53145 (_ BitVec 32)) (x!134899 (_ BitVec 32))) (Undefined!12687) (MissingVacant!12687 (index!53146 (_ BitVec 32))) )
))
(declare-fun lt!654379 () SeekEntryResult!12687)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100549 (_ BitVec 32)) SeekEntryResult!12687)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507360 (= res!1027575 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48516 a!2804) j!70) mask!2512) (select (arr!48516 a!2804) j!70) a!2804 mask!2512) lt!654379))))

(assert (=> b!1507360 (= lt!654379 (Intermediate!12687 false resIndex!21 resX!21))))

(declare-fun b!1507361 () Bool)

(declare-fun res!1027578 () Bool)

(assert (=> b!1507361 (=> (not res!1027578) (not e!842240))))

(assert (=> b!1507361 (= res!1027578 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48516 a!2804) j!70) a!2804 mask!2512) lt!654379))))

(declare-fun b!1507362 () Bool)

(declare-fun res!1027576 () Bool)

(assert (=> b!1507362 (=> (not res!1027576) (not e!842241))))

(declare-datatypes ((List!34999 0))(
  ( (Nil!34996) (Cons!34995 (h!36398 (_ BitVec 64)) (t!49693 List!34999)) )
))
(declare-fun arrayNoDuplicates!0 (array!100549 (_ BitVec 32) List!34999) Bool)

(assert (=> b!1507362 (= res!1027576 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34996))))

(declare-fun b!1507363 () Bool)

(declare-fun res!1027582 () Bool)

(assert (=> b!1507363 (=> (not res!1027582) (not e!842241))))

(assert (=> b!1507363 (= res!1027582 (validKeyInArray!0 (select (arr!48516 a!2804) j!70)))))

(declare-fun b!1507364 () Bool)

(declare-fun res!1027580 () Bool)

(assert (=> b!1507364 (=> (not res!1027580) (not e!842241))))

(assert (=> b!1507364 (= res!1027580 (and (= (size!49066 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49066 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49066 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!128576 res!1027577) b!1507364))

(assert (= (and b!1507364 res!1027580) b!1507358))

(assert (= (and b!1507358 res!1027574) b!1507363))

(assert (= (and b!1507363 res!1027582) b!1507359))

(assert (= (and b!1507359 res!1027579) b!1507362))

(assert (= (and b!1507362 res!1027576) b!1507356))

(assert (= (and b!1507356 res!1027581) b!1507360))

(assert (= (and b!1507360 res!1027575) b!1507361))

(assert (= (and b!1507361 res!1027578) b!1507357))

(declare-fun m!1390115 () Bool)

(assert (=> b!1507363 m!1390115))

(assert (=> b!1507363 m!1390115))

(declare-fun m!1390117 () Bool)

(assert (=> b!1507363 m!1390117))

(declare-fun m!1390119 () Bool)

(assert (=> b!1507362 m!1390119))

(declare-fun m!1390121 () Bool)

(assert (=> b!1507359 m!1390121))

(assert (=> b!1507361 m!1390115))

(assert (=> b!1507361 m!1390115))

(declare-fun m!1390123 () Bool)

(assert (=> b!1507361 m!1390123))

(declare-fun m!1390125 () Bool)

(assert (=> b!1507358 m!1390125))

(assert (=> b!1507358 m!1390125))

(declare-fun m!1390127 () Bool)

(assert (=> b!1507358 m!1390127))

(declare-fun m!1390129 () Bool)

(assert (=> start!128576 m!1390129))

(declare-fun m!1390131 () Bool)

(assert (=> start!128576 m!1390131))

(assert (=> b!1507360 m!1390115))

(assert (=> b!1507360 m!1390115))

(declare-fun m!1390133 () Bool)

(assert (=> b!1507360 m!1390133))

(assert (=> b!1507360 m!1390133))

(assert (=> b!1507360 m!1390115))

(declare-fun m!1390135 () Bool)

(assert (=> b!1507360 m!1390135))

(check-sat (not b!1507363) (not b!1507361) (not b!1507359) (not b!1507360) (not b!1507358) (not b!1507362) (not start!128576))
(check-sat)
