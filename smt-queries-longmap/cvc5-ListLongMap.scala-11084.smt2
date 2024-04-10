; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129336 () Bool)

(assert start!129336)

(declare-fun b!1519374 () Bool)

(declare-fun e!847549 () Bool)

(declare-fun e!847544 () Bool)

(assert (=> b!1519374 (= e!847549 e!847544)))

(declare-fun res!1039287 () Bool)

(assert (=> b!1519374 (=> res!1039287 e!847544)))

(declare-datatypes ((array!101192 0))(
  ( (array!101193 (arr!48833 (Array (_ BitVec 32) (_ BitVec 64))) (size!49383 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101192)

(declare-fun lt!658633 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1519374 (= res!1039287 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658633 #b00000000000000000000000000000000) (bvsge lt!658633 (size!49383 a!2804))))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519374 (= lt!658633 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1519375 () Bool)

(declare-fun res!1039277 () Bool)

(declare-fun e!847542 () Bool)

(assert (=> b!1519375 (=> (not res!1039277) (not e!847542))))

(declare-datatypes ((List!35316 0))(
  ( (Nil!35313) (Cons!35312 (h!36724 (_ BitVec 64)) (t!50010 List!35316)) )
))
(declare-fun arrayNoDuplicates!0 (array!101192 (_ BitVec 32) List!35316) Bool)

(assert (=> b!1519375 (= res!1039277 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35313))))

(declare-fun b!1519376 () Bool)

(declare-fun e!847547 () Bool)

(declare-fun lt!658636 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1519376 (= e!847547 (validKeyInArray!0 lt!658636))))

(declare-fun b!1519377 () Bool)

(declare-fun e!847543 () Bool)

(assert (=> b!1519377 (= e!847542 e!847543)))

(declare-fun res!1039289 () Bool)

(assert (=> b!1519377 (=> (not res!1039289) (not e!847543))))

(declare-datatypes ((SeekEntryResult!13004 0))(
  ( (MissingZero!13004 (index!54411 (_ BitVec 32))) (Found!13004 (index!54412 (_ BitVec 32))) (Intermediate!13004 (undefined!13816 Bool) (index!54413 (_ BitVec 32)) (x!136082 (_ BitVec 32))) (Undefined!13004) (MissingVacant!13004 (index!54414 (_ BitVec 32))) )
))
(declare-fun lt!658634 () SeekEntryResult!13004)

(declare-fun lt!658638 () SeekEntryResult!13004)

(assert (=> b!1519377 (= res!1039289 (= lt!658634 lt!658638))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1519377 (= lt!658638 (Intermediate!13004 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101192 (_ BitVec 32)) SeekEntryResult!13004)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519377 (= lt!658634 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48833 a!2804) j!70) mask!2512) (select (arr!48833 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519378 () Bool)

(declare-fun res!1039291 () Bool)

(assert (=> b!1519378 (=> res!1039291 e!847544)))

(assert (=> b!1519378 (= res!1039291 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658633 (select (arr!48833 a!2804) j!70) a!2804 mask!2512) lt!658638)))))

(declare-fun b!1519379 () Bool)

(assert (=> b!1519379 (= e!847544 e!847547)))

(declare-fun res!1039284 () Bool)

(assert (=> b!1519379 (=> res!1039284 e!847547)))

(assert (=> b!1519379 (= res!1039284 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun lt!658639 () array!101192)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101192 (_ BitVec 32)) SeekEntryResult!13004)

(assert (=> b!1519379 (= (seekEntryOrOpen!0 (select (arr!48833 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!658636 lt!658639 mask!2512))))

(declare-datatypes ((Unit!50876 0))(
  ( (Unit!50877) )
))
(declare-fun lt!658635 () Unit!50876)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101192 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50876)

(assert (=> b!1519379 (= lt!658635 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!658633 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1519380 () Bool)

(declare-fun res!1039283 () Bool)

(assert (=> b!1519380 (=> (not res!1039283) (not e!847543))))

(assert (=> b!1519380 (= res!1039283 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48833 a!2804) j!70) a!2804 mask!2512) lt!658638))))

(declare-fun b!1519381 () Bool)

(declare-fun e!847548 () Bool)

(assert (=> b!1519381 (= e!847548 (not e!847549))))

(declare-fun res!1039280 () Bool)

(assert (=> b!1519381 (=> res!1039280 e!847549)))

(assert (=> b!1519381 (= res!1039280 (or (not (= (select (arr!48833 a!2804) j!70) lt!658636)) (= x!534 resX!21)))))

(declare-fun e!847546 () Bool)

(assert (=> b!1519381 e!847546))

(declare-fun res!1039281 () Bool)

(assert (=> b!1519381 (=> (not res!1039281) (not e!847546))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101192 (_ BitVec 32)) Bool)

(assert (=> b!1519381 (= res!1039281 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!658637 () Unit!50876)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101192 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50876)

(assert (=> b!1519381 (= lt!658637 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1519382 () Bool)

(declare-fun res!1039285 () Bool)

(assert (=> b!1519382 (=> (not res!1039285) (not e!847542))))

(assert (=> b!1519382 (= res!1039285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1519383 () Bool)

(assert (=> b!1519383 (= e!847543 e!847548)))

(declare-fun res!1039279 () Bool)

(assert (=> b!1519383 (=> (not res!1039279) (not e!847548))))

(assert (=> b!1519383 (= res!1039279 (= lt!658634 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!658636 mask!2512) lt!658636 lt!658639 mask!2512)))))

(assert (=> b!1519383 (= lt!658636 (select (store (arr!48833 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1519383 (= lt!658639 (array!101193 (store (arr!48833 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49383 a!2804)))))

(declare-fun res!1039286 () Bool)

(assert (=> start!129336 (=> (not res!1039286) (not e!847542))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129336 (= res!1039286 (validMask!0 mask!2512))))

(assert (=> start!129336 e!847542))

(assert (=> start!129336 true))

(declare-fun array_inv!37861 (array!101192) Bool)

(assert (=> start!129336 (array_inv!37861 a!2804)))

(declare-fun b!1519384 () Bool)

(declare-fun res!1039288 () Bool)

(assert (=> b!1519384 (=> (not res!1039288) (not e!847542))))

(assert (=> b!1519384 (= res!1039288 (and (= (size!49383 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49383 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49383 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1519385 () Bool)

(declare-fun res!1039290 () Bool)

(assert (=> b!1519385 (=> (not res!1039290) (not e!847542))))

(assert (=> b!1519385 (= res!1039290 (validKeyInArray!0 (select (arr!48833 a!2804) j!70)))))

(declare-fun b!1519386 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101192 (_ BitVec 32)) SeekEntryResult!13004)

(assert (=> b!1519386 (= e!847546 (= (seekEntry!0 (select (arr!48833 a!2804) j!70) a!2804 mask!2512) (Found!13004 j!70)))))

(declare-fun b!1519387 () Bool)

(declare-fun res!1039282 () Bool)

(assert (=> b!1519387 (=> (not res!1039282) (not e!847542))))

(assert (=> b!1519387 (= res!1039282 (validKeyInArray!0 (select (arr!48833 a!2804) i!961)))))

(declare-fun b!1519388 () Bool)

(declare-fun res!1039278 () Bool)

(assert (=> b!1519388 (=> (not res!1039278) (not e!847542))))

(assert (=> b!1519388 (= res!1039278 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49383 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49383 a!2804))))))

(assert (= (and start!129336 res!1039286) b!1519384))

(assert (= (and b!1519384 res!1039288) b!1519387))

(assert (= (and b!1519387 res!1039282) b!1519385))

(assert (= (and b!1519385 res!1039290) b!1519382))

(assert (= (and b!1519382 res!1039285) b!1519375))

(assert (= (and b!1519375 res!1039277) b!1519388))

(assert (= (and b!1519388 res!1039278) b!1519377))

(assert (= (and b!1519377 res!1039289) b!1519380))

(assert (= (and b!1519380 res!1039283) b!1519383))

(assert (= (and b!1519383 res!1039279) b!1519381))

(assert (= (and b!1519381 res!1039281) b!1519386))

(assert (= (and b!1519381 (not res!1039280)) b!1519374))

(assert (= (and b!1519374 (not res!1039287)) b!1519378))

(assert (= (and b!1519378 (not res!1039291)) b!1519379))

(assert (= (and b!1519379 (not res!1039284)) b!1519376))

(declare-fun m!1402771 () Bool)

(assert (=> b!1519382 m!1402771))

(declare-fun m!1402773 () Bool)

(assert (=> b!1519385 m!1402773))

(assert (=> b!1519385 m!1402773))

(declare-fun m!1402775 () Bool)

(assert (=> b!1519385 m!1402775))

(declare-fun m!1402777 () Bool)

(assert (=> b!1519374 m!1402777))

(declare-fun m!1402779 () Bool)

(assert (=> b!1519376 m!1402779))

(assert (=> b!1519380 m!1402773))

(assert (=> b!1519380 m!1402773))

(declare-fun m!1402781 () Bool)

(assert (=> b!1519380 m!1402781))

(declare-fun m!1402783 () Bool)

(assert (=> b!1519383 m!1402783))

(assert (=> b!1519383 m!1402783))

(declare-fun m!1402785 () Bool)

(assert (=> b!1519383 m!1402785))

(declare-fun m!1402787 () Bool)

(assert (=> b!1519383 m!1402787))

(declare-fun m!1402789 () Bool)

(assert (=> b!1519383 m!1402789))

(assert (=> b!1519379 m!1402773))

(assert (=> b!1519379 m!1402773))

(declare-fun m!1402791 () Bool)

(assert (=> b!1519379 m!1402791))

(declare-fun m!1402793 () Bool)

(assert (=> b!1519379 m!1402793))

(declare-fun m!1402795 () Bool)

(assert (=> b!1519379 m!1402795))

(assert (=> b!1519381 m!1402773))

(declare-fun m!1402797 () Bool)

(assert (=> b!1519381 m!1402797))

(declare-fun m!1402799 () Bool)

(assert (=> b!1519381 m!1402799))

(assert (=> b!1519378 m!1402773))

(assert (=> b!1519378 m!1402773))

(declare-fun m!1402801 () Bool)

(assert (=> b!1519378 m!1402801))

(declare-fun m!1402803 () Bool)

(assert (=> start!129336 m!1402803))

(declare-fun m!1402805 () Bool)

(assert (=> start!129336 m!1402805))

(declare-fun m!1402807 () Bool)

(assert (=> b!1519375 m!1402807))

(assert (=> b!1519377 m!1402773))

(assert (=> b!1519377 m!1402773))

(declare-fun m!1402809 () Bool)

(assert (=> b!1519377 m!1402809))

(assert (=> b!1519377 m!1402809))

(assert (=> b!1519377 m!1402773))

(declare-fun m!1402811 () Bool)

(assert (=> b!1519377 m!1402811))

(assert (=> b!1519386 m!1402773))

(assert (=> b!1519386 m!1402773))

(declare-fun m!1402813 () Bool)

(assert (=> b!1519386 m!1402813))

(declare-fun m!1402815 () Bool)

(assert (=> b!1519387 m!1402815))

(assert (=> b!1519387 m!1402815))

(declare-fun m!1402817 () Bool)

(assert (=> b!1519387 m!1402817))

(push 1)

