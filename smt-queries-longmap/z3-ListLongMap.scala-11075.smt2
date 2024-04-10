; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129284 () Bool)

(assert start!129284)

(declare-fun b!1518293 () Bool)

(declare-fun res!1038199 () Bool)

(declare-fun e!847008 () Bool)

(assert (=> b!1518293 (=> (not res!1038199) (not e!847008))))

(declare-datatypes ((array!101140 0))(
  ( (array!101141 (arr!48807 (Array (_ BitVec 32) (_ BitVec 64))) (size!49357 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101140)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518293 (= res!1038199 (validKeyInArray!0 (select (arr!48807 a!2804) i!961)))))

(declare-fun b!1518294 () Bool)

(declare-fun e!847011 () Bool)

(assert (=> b!1518294 (= e!847011 true)))

(declare-fun lt!658113 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12978 0))(
  ( (MissingZero!12978 (index!54307 (_ BitVec 32))) (Found!12978 (index!54308 (_ BitVec 32))) (Intermediate!12978 (undefined!13790 Bool) (index!54309 (_ BitVec 32)) (x!135984 (_ BitVec 32))) (Undefined!12978) (MissingVacant!12978 (index!54310 (_ BitVec 32))) )
))
(declare-fun lt!658116 () SeekEntryResult!12978)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101140 (_ BitVec 32)) SeekEntryResult!12978)

(assert (=> b!1518294 (= lt!658116 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658113 (select (arr!48807 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518295 () Bool)

(declare-fun e!847009 () Bool)

(declare-fun e!847010 () Bool)

(assert (=> b!1518295 (= e!847009 (not e!847010))))

(declare-fun res!1038197 () Bool)

(assert (=> b!1518295 (=> res!1038197 e!847010)))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1518295 (= res!1038197 (or (not (= (select (arr!48807 a!2804) j!70) (select (store (arr!48807 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!847007 () Bool)

(assert (=> b!1518295 e!847007))

(declare-fun res!1038208 () Bool)

(assert (=> b!1518295 (=> (not res!1038208) (not e!847007))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101140 (_ BitVec 32)) Bool)

(assert (=> b!1518295 (= res!1038208 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50824 0))(
  ( (Unit!50825) )
))
(declare-fun lt!658115 () Unit!50824)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101140 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50824)

(assert (=> b!1518295 (= lt!658115 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518296 () Bool)

(assert (=> b!1518296 (= e!847010 e!847011)))

(declare-fun res!1038201 () Bool)

(assert (=> b!1518296 (=> res!1038201 e!847011)))

(assert (=> b!1518296 (= res!1038201 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658113 #b00000000000000000000000000000000) (bvsge lt!658113 (size!49357 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518296 (= lt!658113 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1518297 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101140 (_ BitVec 32)) SeekEntryResult!12978)

(assert (=> b!1518297 (= e!847007 (= (seekEntry!0 (select (arr!48807 a!2804) j!70) a!2804 mask!2512) (Found!12978 j!70)))))

(declare-fun b!1518298 () Bool)

(declare-fun res!1038196 () Bool)

(assert (=> b!1518298 (=> (not res!1038196) (not e!847008))))

(assert (=> b!1518298 (= res!1038196 (validKeyInArray!0 (select (arr!48807 a!2804) j!70)))))

(declare-fun b!1518300 () Bool)

(declare-fun res!1038205 () Bool)

(assert (=> b!1518300 (=> (not res!1038205) (not e!847008))))

(assert (=> b!1518300 (= res!1038205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518301 () Bool)

(declare-fun res!1038206 () Bool)

(assert (=> b!1518301 (=> (not res!1038206) (not e!847009))))

(declare-fun lt!658114 () SeekEntryResult!12978)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518301 (= res!1038206 (= lt!658114 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48807 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48807 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101141 (store (arr!48807 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49357 a!2804)) mask!2512)))))

(declare-fun b!1518302 () Bool)

(declare-fun res!1038203 () Bool)

(assert (=> b!1518302 (=> (not res!1038203) (not e!847008))))

(declare-datatypes ((List!35290 0))(
  ( (Nil!35287) (Cons!35286 (h!36698 (_ BitVec 64)) (t!49984 List!35290)) )
))
(declare-fun arrayNoDuplicates!0 (array!101140 (_ BitVec 32) List!35290) Bool)

(assert (=> b!1518302 (= res!1038203 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35287))))

(declare-fun b!1518303 () Bool)

(declare-fun res!1038200 () Bool)

(assert (=> b!1518303 (=> (not res!1038200) (not e!847009))))

(declare-fun lt!658117 () SeekEntryResult!12978)

(assert (=> b!1518303 (= res!1038200 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48807 a!2804) j!70) a!2804 mask!2512) lt!658117))))

(declare-fun res!1038207 () Bool)

(assert (=> start!129284 (=> (not res!1038207) (not e!847008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129284 (= res!1038207 (validMask!0 mask!2512))))

(assert (=> start!129284 e!847008))

(assert (=> start!129284 true))

(declare-fun array_inv!37835 (array!101140) Bool)

(assert (=> start!129284 (array_inv!37835 a!2804)))

(declare-fun b!1518299 () Bool)

(declare-fun res!1038198 () Bool)

(assert (=> b!1518299 (=> (not res!1038198) (not e!847008))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1518299 (= res!1038198 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49357 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49357 a!2804))))))

(declare-fun b!1518304 () Bool)

(declare-fun res!1038204 () Bool)

(assert (=> b!1518304 (=> (not res!1038204) (not e!847008))))

(assert (=> b!1518304 (= res!1038204 (and (= (size!49357 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49357 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49357 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518305 () Bool)

(assert (=> b!1518305 (= e!847008 e!847009)))

(declare-fun res!1038202 () Bool)

(assert (=> b!1518305 (=> (not res!1038202) (not e!847009))))

(assert (=> b!1518305 (= res!1038202 (= lt!658114 lt!658117))))

(assert (=> b!1518305 (= lt!658117 (Intermediate!12978 false resIndex!21 resX!21))))

(assert (=> b!1518305 (= lt!658114 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48807 a!2804) j!70) mask!2512) (select (arr!48807 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129284 res!1038207) b!1518304))

(assert (= (and b!1518304 res!1038204) b!1518293))

(assert (= (and b!1518293 res!1038199) b!1518298))

(assert (= (and b!1518298 res!1038196) b!1518300))

(assert (= (and b!1518300 res!1038205) b!1518302))

(assert (= (and b!1518302 res!1038203) b!1518299))

(assert (= (and b!1518299 res!1038198) b!1518305))

(assert (= (and b!1518305 res!1038202) b!1518303))

(assert (= (and b!1518303 res!1038200) b!1518301))

(assert (= (and b!1518301 res!1038206) b!1518295))

(assert (= (and b!1518295 res!1038208) b!1518297))

(assert (= (and b!1518295 (not res!1038197)) b!1518296))

(assert (= (and b!1518296 (not res!1038201)) b!1518294))

(declare-fun m!1401605 () Bool)

(assert (=> b!1518296 m!1401605))

(declare-fun m!1401607 () Bool)

(assert (=> b!1518300 m!1401607))

(declare-fun m!1401609 () Bool)

(assert (=> start!129284 m!1401609))

(declare-fun m!1401611 () Bool)

(assert (=> start!129284 m!1401611))

(declare-fun m!1401613 () Bool)

(assert (=> b!1518303 m!1401613))

(assert (=> b!1518303 m!1401613))

(declare-fun m!1401615 () Bool)

(assert (=> b!1518303 m!1401615))

(assert (=> b!1518294 m!1401613))

(assert (=> b!1518294 m!1401613))

(declare-fun m!1401617 () Bool)

(assert (=> b!1518294 m!1401617))

(declare-fun m!1401619 () Bool)

(assert (=> b!1518301 m!1401619))

(declare-fun m!1401621 () Bool)

(assert (=> b!1518301 m!1401621))

(assert (=> b!1518301 m!1401621))

(declare-fun m!1401623 () Bool)

(assert (=> b!1518301 m!1401623))

(assert (=> b!1518301 m!1401623))

(assert (=> b!1518301 m!1401621))

(declare-fun m!1401625 () Bool)

(assert (=> b!1518301 m!1401625))

(assert (=> b!1518295 m!1401613))

(declare-fun m!1401627 () Bool)

(assert (=> b!1518295 m!1401627))

(assert (=> b!1518295 m!1401619))

(assert (=> b!1518295 m!1401621))

(declare-fun m!1401629 () Bool)

(assert (=> b!1518295 m!1401629))

(assert (=> b!1518305 m!1401613))

(assert (=> b!1518305 m!1401613))

(declare-fun m!1401631 () Bool)

(assert (=> b!1518305 m!1401631))

(assert (=> b!1518305 m!1401631))

(assert (=> b!1518305 m!1401613))

(declare-fun m!1401633 () Bool)

(assert (=> b!1518305 m!1401633))

(declare-fun m!1401635 () Bool)

(assert (=> b!1518302 m!1401635))

(assert (=> b!1518298 m!1401613))

(assert (=> b!1518298 m!1401613))

(declare-fun m!1401637 () Bool)

(assert (=> b!1518298 m!1401637))

(assert (=> b!1518297 m!1401613))

(assert (=> b!1518297 m!1401613))

(declare-fun m!1401639 () Bool)

(assert (=> b!1518297 m!1401639))

(declare-fun m!1401641 () Bool)

(assert (=> b!1518293 m!1401641))

(assert (=> b!1518293 m!1401641))

(declare-fun m!1401643 () Bool)

(assert (=> b!1518293 m!1401643))

(check-sat (not start!129284) (not b!1518305) (not b!1518296) (not b!1518300) (not b!1518293) (not b!1518301) (not b!1518302) (not b!1518294) (not b!1518297) (not b!1518298) (not b!1518295) (not b!1518303))
(check-sat)
