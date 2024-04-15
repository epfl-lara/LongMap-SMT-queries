; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128714 () Bool)

(assert start!128714)

(declare-fun b!1508420 () Bool)

(declare-fun e!842657 () Bool)

(assert (=> b!1508420 (= e!842657 false)))

(declare-fun lt!654441 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100570 0))(
  ( (array!100571 (arr!48523 (Array (_ BitVec 32) (_ BitVec 64))) (size!49075 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100570)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508420 (= lt!654441 (toIndex!0 (select (store (arr!48523 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1508421 () Bool)

(declare-fun res!1028532 () Bool)

(declare-fun e!842656 () Bool)

(assert (=> b!1508421 (=> (not res!1028532) (not e!842656))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100570 (_ BitVec 32)) Bool)

(assert (=> b!1508421 (= res!1028532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508422 () Bool)

(declare-fun res!1028537 () Bool)

(assert (=> b!1508422 (=> (not res!1028537) (not e!842656))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508422 (= res!1028537 (validKeyInArray!0 (select (arr!48523 a!2804) i!961)))))

(declare-fun b!1508423 () Bool)

(declare-fun res!1028534 () Bool)

(assert (=> b!1508423 (=> (not res!1028534) (not e!842656))))

(assert (=> b!1508423 (= res!1028534 (validKeyInArray!0 (select (arr!48523 a!2804) j!70)))))

(declare-fun b!1508424 () Bool)

(declare-fun res!1028531 () Bool)

(assert (=> b!1508424 (=> (not res!1028531) (not e!842656))))

(declare-datatypes ((List!35084 0))(
  ( (Nil!35081) (Cons!35080 (h!36493 (_ BitVec 64)) (t!49770 List!35084)) )
))
(declare-fun arrayNoDuplicates!0 (array!100570 (_ BitVec 32) List!35084) Bool)

(assert (=> b!1508424 (= res!1028531 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35081))))

(declare-fun b!1508425 () Bool)

(declare-fun res!1028530 () Bool)

(assert (=> b!1508425 (=> (not res!1028530) (not e!842656))))

(assert (=> b!1508425 (= res!1028530 (and (= (size!49075 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49075 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49075 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508427 () Bool)

(assert (=> b!1508427 (= e!842656 e!842657)))

(declare-fun res!1028529 () Bool)

(assert (=> b!1508427 (=> (not res!1028529) (not e!842657))))

(declare-datatypes ((SeekEntryResult!12717 0))(
  ( (MissingZero!12717 (index!53263 (_ BitVec 32))) (Found!12717 (index!53264 (_ BitVec 32))) (Intermediate!12717 (undefined!13529 Bool) (index!53265 (_ BitVec 32)) (x!135029 (_ BitVec 32))) (Undefined!12717) (MissingVacant!12717 (index!53266 (_ BitVec 32))) )
))
(declare-fun lt!654440 () SeekEntryResult!12717)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100570 (_ BitVec 32)) SeekEntryResult!12717)

(assert (=> b!1508427 (= res!1028529 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48523 a!2804) j!70) mask!2512) (select (arr!48523 a!2804) j!70) a!2804 mask!2512) lt!654440))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1508427 (= lt!654440 (Intermediate!12717 false resIndex!21 resX!21))))

(declare-fun b!1508428 () Bool)

(declare-fun res!1028533 () Bool)

(assert (=> b!1508428 (=> (not res!1028533) (not e!842656))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1508428 (= res!1028533 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49075 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49075 a!2804))))))

(declare-fun res!1028536 () Bool)

(assert (=> start!128714 (=> (not res!1028536) (not e!842656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128714 (= res!1028536 (validMask!0 mask!2512))))

(assert (=> start!128714 e!842656))

(assert (=> start!128714 true))

(declare-fun array_inv!37756 (array!100570) Bool)

(assert (=> start!128714 (array_inv!37756 a!2804)))

(declare-fun b!1508426 () Bool)

(declare-fun res!1028535 () Bool)

(assert (=> b!1508426 (=> (not res!1028535) (not e!842657))))

(assert (=> b!1508426 (= res!1028535 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48523 a!2804) j!70) a!2804 mask!2512) lt!654440))))

(assert (= (and start!128714 res!1028536) b!1508425))

(assert (= (and b!1508425 res!1028530) b!1508422))

(assert (= (and b!1508422 res!1028537) b!1508423))

(assert (= (and b!1508423 res!1028534) b!1508421))

(assert (= (and b!1508421 res!1028532) b!1508424))

(assert (= (and b!1508424 res!1028531) b!1508428))

(assert (= (and b!1508428 res!1028533) b!1508427))

(assert (= (and b!1508427 res!1028529) b!1508426))

(assert (= (and b!1508426 res!1028535) b!1508420))

(declare-fun m!1390271 () Bool)

(assert (=> b!1508427 m!1390271))

(assert (=> b!1508427 m!1390271))

(declare-fun m!1390273 () Bool)

(assert (=> b!1508427 m!1390273))

(assert (=> b!1508427 m!1390273))

(assert (=> b!1508427 m!1390271))

(declare-fun m!1390275 () Bool)

(assert (=> b!1508427 m!1390275))

(assert (=> b!1508423 m!1390271))

(assert (=> b!1508423 m!1390271))

(declare-fun m!1390277 () Bool)

(assert (=> b!1508423 m!1390277))

(declare-fun m!1390279 () Bool)

(assert (=> b!1508424 m!1390279))

(declare-fun m!1390281 () Bool)

(assert (=> b!1508422 m!1390281))

(assert (=> b!1508422 m!1390281))

(declare-fun m!1390283 () Bool)

(assert (=> b!1508422 m!1390283))

(declare-fun m!1390285 () Bool)

(assert (=> start!128714 m!1390285))

(declare-fun m!1390287 () Bool)

(assert (=> start!128714 m!1390287))

(declare-fun m!1390289 () Bool)

(assert (=> b!1508421 m!1390289))

(declare-fun m!1390291 () Bool)

(assert (=> b!1508420 m!1390291))

(declare-fun m!1390293 () Bool)

(assert (=> b!1508420 m!1390293))

(assert (=> b!1508420 m!1390293))

(declare-fun m!1390295 () Bool)

(assert (=> b!1508420 m!1390295))

(assert (=> b!1508426 m!1390271))

(assert (=> b!1508426 m!1390271))

(declare-fun m!1390297 () Bool)

(assert (=> b!1508426 m!1390297))

(check-sat (not b!1508421) (not b!1508427) (not b!1508424) (not b!1508420) (not b!1508422) (not start!128714) (not b!1508423) (not b!1508426))
(check-sat)
