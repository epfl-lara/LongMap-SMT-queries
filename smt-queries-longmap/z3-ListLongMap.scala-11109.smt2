; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130140 () Bool)

(assert start!130140)

(declare-fun b!1525277 () Bool)

(declare-fun res!1042705 () Bool)

(declare-fun e!850592 () Bool)

(assert (=> b!1525277 (=> (not res!1042705) (not e!850592))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101473 0))(
  ( (array!101474 (arr!48961 (Array (_ BitVec 32) (_ BitVec 64))) (size!49512 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101473)

(declare-datatypes ((SeekEntryResult!13019 0))(
  ( (MissingZero!13019 (index!54471 (_ BitVec 32))) (Found!13019 (index!54472 (_ BitVec 32))) (Intermediate!13019 (undefined!13831 Bool) (index!54473 (_ BitVec 32)) (x!136376 (_ BitVec 32))) (Undefined!13019) (MissingVacant!13019 (index!54474 (_ BitVec 32))) )
))
(declare-fun lt!660704 () SeekEntryResult!13019)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101473 (_ BitVec 32)) SeekEntryResult!13019)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525277 (= res!1042705 (= lt!660704 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48961 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48961 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101474 (store (arr!48961 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49512 a!2804)) mask!2512)))))

(declare-fun b!1525278 () Bool)

(declare-fun res!1042702 () Bool)

(declare-fun e!850591 () Bool)

(assert (=> b!1525278 (=> (not res!1042702) (not e!850591))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1525278 (= res!1042702 (validKeyInArray!0 (select (arr!48961 a!2804) i!961)))))

(declare-fun b!1525279 () Bool)

(declare-fun res!1042701 () Bool)

(assert (=> b!1525279 (=> (not res!1042701) (not e!850591))))

(declare-datatypes ((List!35431 0))(
  ( (Nil!35428) (Cons!35427 (h!36869 (_ BitVec 64)) (t!50117 List!35431)) )
))
(declare-fun arrayNoDuplicates!0 (array!101473 (_ BitVec 32) List!35431) Bool)

(assert (=> b!1525279 (= res!1042701 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35428))))

(declare-fun b!1525280 () Bool)

(assert (=> b!1525280 (= e!850592 (not true))))

(declare-fun e!850594 () Bool)

(assert (=> b!1525280 e!850594))

(declare-fun res!1042697 () Bool)

(assert (=> b!1525280 (=> (not res!1042697) (not e!850594))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101473 (_ BitVec 32)) Bool)

(assert (=> b!1525280 (= res!1042697 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50857 0))(
  ( (Unit!50858) )
))
(declare-fun lt!660705 () Unit!50857)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101473 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50857)

(assert (=> b!1525280 (= lt!660705 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1525281 () Bool)

(declare-fun res!1042706 () Bool)

(assert (=> b!1525281 (=> (not res!1042706) (not e!850592))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!660703 () SeekEntryResult!13019)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1525281 (= res!1042706 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48961 a!2804) j!70) a!2804 mask!2512) lt!660703))))

(declare-fun b!1525282 () Bool)

(declare-fun res!1042700 () Bool)

(assert (=> b!1525282 (=> (not res!1042700) (not e!850591))))

(assert (=> b!1525282 (= res!1042700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1042703 () Bool)

(assert (=> start!130140 (=> (not res!1042703) (not e!850591))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130140 (= res!1042703 (validMask!0 mask!2512))))

(assert (=> start!130140 e!850591))

(assert (=> start!130140 true))

(declare-fun array_inv!38242 (array!101473) Bool)

(assert (=> start!130140 (array_inv!38242 a!2804)))

(declare-fun b!1525276 () Bool)

(declare-fun res!1042699 () Bool)

(assert (=> b!1525276 (=> (not res!1042699) (not e!850591))))

(assert (=> b!1525276 (= res!1042699 (and (= (size!49512 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49512 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49512 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1525283 () Bool)

(declare-fun res!1042704 () Bool)

(assert (=> b!1525283 (=> (not res!1042704) (not e!850591))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1525283 (= res!1042704 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49512 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49512 a!2804))))))

(declare-fun b!1525284 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101473 (_ BitVec 32)) SeekEntryResult!13019)

(assert (=> b!1525284 (= e!850594 (= (seekEntry!0 (select (arr!48961 a!2804) j!70) a!2804 mask!2512) (Found!13019 j!70)))))

(declare-fun b!1525285 () Bool)

(declare-fun res!1042707 () Bool)

(assert (=> b!1525285 (=> (not res!1042707) (not e!850591))))

(assert (=> b!1525285 (= res!1042707 (validKeyInArray!0 (select (arr!48961 a!2804) j!70)))))

(declare-fun b!1525286 () Bool)

(assert (=> b!1525286 (= e!850591 e!850592)))

(declare-fun res!1042698 () Bool)

(assert (=> b!1525286 (=> (not res!1042698) (not e!850592))))

(assert (=> b!1525286 (= res!1042698 (= lt!660704 lt!660703))))

(assert (=> b!1525286 (= lt!660703 (Intermediate!13019 false resIndex!21 resX!21))))

(assert (=> b!1525286 (= lt!660704 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48961 a!2804) j!70) mask!2512) (select (arr!48961 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!130140 res!1042703) b!1525276))

(assert (= (and b!1525276 res!1042699) b!1525278))

(assert (= (and b!1525278 res!1042702) b!1525285))

(assert (= (and b!1525285 res!1042707) b!1525282))

(assert (= (and b!1525282 res!1042700) b!1525279))

(assert (= (and b!1525279 res!1042701) b!1525283))

(assert (= (and b!1525283 res!1042704) b!1525286))

(assert (= (and b!1525286 res!1042698) b!1525281))

(assert (= (and b!1525281 res!1042706) b!1525277))

(assert (= (and b!1525277 res!1042705) b!1525280))

(assert (= (and b!1525280 res!1042697) b!1525284))

(declare-fun m!1408201 () Bool)

(assert (=> b!1525281 m!1408201))

(assert (=> b!1525281 m!1408201))

(declare-fun m!1408203 () Bool)

(assert (=> b!1525281 m!1408203))

(declare-fun m!1408205 () Bool)

(assert (=> b!1525278 m!1408205))

(assert (=> b!1525278 m!1408205))

(declare-fun m!1408207 () Bool)

(assert (=> b!1525278 m!1408207))

(declare-fun m!1408209 () Bool)

(assert (=> b!1525277 m!1408209))

(declare-fun m!1408211 () Bool)

(assert (=> b!1525277 m!1408211))

(assert (=> b!1525277 m!1408211))

(declare-fun m!1408213 () Bool)

(assert (=> b!1525277 m!1408213))

(assert (=> b!1525277 m!1408213))

(assert (=> b!1525277 m!1408211))

(declare-fun m!1408215 () Bool)

(assert (=> b!1525277 m!1408215))

(declare-fun m!1408217 () Bool)

(assert (=> b!1525282 m!1408217))

(declare-fun m!1408219 () Bool)

(assert (=> b!1525279 m!1408219))

(assert (=> b!1525284 m!1408201))

(assert (=> b!1525284 m!1408201))

(declare-fun m!1408221 () Bool)

(assert (=> b!1525284 m!1408221))

(assert (=> b!1525285 m!1408201))

(assert (=> b!1525285 m!1408201))

(declare-fun m!1408223 () Bool)

(assert (=> b!1525285 m!1408223))

(assert (=> b!1525286 m!1408201))

(assert (=> b!1525286 m!1408201))

(declare-fun m!1408225 () Bool)

(assert (=> b!1525286 m!1408225))

(assert (=> b!1525286 m!1408225))

(assert (=> b!1525286 m!1408201))

(declare-fun m!1408227 () Bool)

(assert (=> b!1525286 m!1408227))

(declare-fun m!1408229 () Bool)

(assert (=> b!1525280 m!1408229))

(declare-fun m!1408231 () Bool)

(assert (=> b!1525280 m!1408231))

(declare-fun m!1408233 () Bool)

(assert (=> start!130140 m!1408233))

(declare-fun m!1408235 () Bool)

(assert (=> start!130140 m!1408235))

(check-sat (not b!1525277) (not b!1525285) (not b!1525279) (not b!1525278) (not b!1525286) (not b!1525281) (not b!1525284) (not b!1525282) (not start!130140) (not b!1525280))
(check-sat)
