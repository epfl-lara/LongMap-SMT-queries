; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129588 () Bool)

(assert start!129588)

(declare-fun b!1521268 () Bool)

(declare-fun res!1040494 () Bool)

(declare-fun e!848484 () Bool)

(assert (=> b!1521268 (=> (not res!1040494) (not e!848484))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!101263 0))(
  ( (array!101264 (arr!48864 (Array (_ BitVec 32) (_ BitVec 64))) (size!49414 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101263)

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13029 0))(
  ( (MissingZero!13029 (index!54511 (_ BitVec 32))) (Found!13029 (index!54512 (_ BitVec 32))) (Intermediate!13029 (undefined!13841 Bool) (index!54513 (_ BitVec 32)) (x!136209 (_ BitVec 32))) (Undefined!13029) (MissingVacant!13029 (index!54514 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101263 (_ BitVec 32)) SeekEntryResult!13029)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521268 (= res!1040494 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48864 a!2804) j!70) mask!2512) (select (arr!48864 a!2804) j!70) a!2804 mask!2512) (Intermediate!13029 false resIndex!21 resX!21)))))

(declare-fun b!1521269 () Bool)

(assert (=> b!1521269 (= e!848484 false)))

(declare-fun lt!659329 () SeekEntryResult!13029)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1521269 (= lt!659329 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48864 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1521270 () Bool)

(declare-fun res!1040490 () Bool)

(assert (=> b!1521270 (=> (not res!1040490) (not e!848484))))

(declare-datatypes ((List!35347 0))(
  ( (Nil!35344) (Cons!35343 (h!36764 (_ BitVec 64)) (t!50041 List!35347)) )
))
(declare-fun arrayNoDuplicates!0 (array!101263 (_ BitVec 32) List!35347) Bool)

(assert (=> b!1521270 (= res!1040490 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35344))))

(declare-fun res!1040491 () Bool)

(assert (=> start!129588 (=> (not res!1040491) (not e!848484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129588 (= res!1040491 (validMask!0 mask!2512))))

(assert (=> start!129588 e!848484))

(assert (=> start!129588 true))

(declare-fun array_inv!37892 (array!101263) Bool)

(assert (=> start!129588 (array_inv!37892 a!2804)))

(declare-fun b!1521271 () Bool)

(declare-fun res!1040492 () Bool)

(assert (=> b!1521271 (=> (not res!1040492) (not e!848484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101263 (_ BitVec 32)) Bool)

(assert (=> b!1521271 (= res!1040492 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521272 () Bool)

(declare-fun res!1040497 () Bool)

(assert (=> b!1521272 (=> (not res!1040497) (not e!848484))))

(assert (=> b!1521272 (= res!1040497 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49414 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49414 a!2804))))))

(declare-fun b!1521273 () Bool)

(declare-fun res!1040493 () Bool)

(assert (=> b!1521273 (=> (not res!1040493) (not e!848484))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1521273 (= res!1040493 (and (= (size!49414 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49414 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49414 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521274 () Bool)

(declare-fun res!1040495 () Bool)

(assert (=> b!1521274 (=> (not res!1040495) (not e!848484))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521274 (= res!1040495 (validKeyInArray!0 (select (arr!48864 a!2804) i!961)))))

(declare-fun b!1521275 () Bool)

(declare-fun res!1040496 () Bool)

(assert (=> b!1521275 (=> (not res!1040496) (not e!848484))))

(assert (=> b!1521275 (= res!1040496 (validKeyInArray!0 (select (arr!48864 a!2804) j!70)))))

(assert (= (and start!129588 res!1040491) b!1521273))

(assert (= (and b!1521273 res!1040493) b!1521274))

(assert (= (and b!1521274 res!1040495) b!1521275))

(assert (= (and b!1521275 res!1040496) b!1521271))

(assert (= (and b!1521271 res!1040492) b!1521270))

(assert (= (and b!1521270 res!1040490) b!1521272))

(assert (= (and b!1521272 res!1040497) b!1521268))

(assert (= (and b!1521268 res!1040494) b!1521269))

(declare-fun m!1404375 () Bool)

(assert (=> b!1521270 m!1404375))

(declare-fun m!1404377 () Bool)

(assert (=> b!1521269 m!1404377))

(assert (=> b!1521269 m!1404377))

(declare-fun m!1404379 () Bool)

(assert (=> b!1521269 m!1404379))

(declare-fun m!1404381 () Bool)

(assert (=> b!1521271 m!1404381))

(assert (=> b!1521268 m!1404377))

(assert (=> b!1521268 m!1404377))

(declare-fun m!1404383 () Bool)

(assert (=> b!1521268 m!1404383))

(assert (=> b!1521268 m!1404383))

(assert (=> b!1521268 m!1404377))

(declare-fun m!1404385 () Bool)

(assert (=> b!1521268 m!1404385))

(assert (=> b!1521275 m!1404377))

(assert (=> b!1521275 m!1404377))

(declare-fun m!1404387 () Bool)

(assert (=> b!1521275 m!1404387))

(declare-fun m!1404389 () Bool)

(assert (=> start!129588 m!1404389))

(declare-fun m!1404391 () Bool)

(assert (=> start!129588 m!1404391))

(declare-fun m!1404393 () Bool)

(assert (=> b!1521274 m!1404393))

(assert (=> b!1521274 m!1404393))

(declare-fun m!1404395 () Bool)

(assert (=> b!1521274 m!1404395))

(check-sat (not b!1521268) (not b!1521275) (not b!1521274) (not b!1521271) (not b!1521269) (not start!129588) (not b!1521270))
(check-sat)
