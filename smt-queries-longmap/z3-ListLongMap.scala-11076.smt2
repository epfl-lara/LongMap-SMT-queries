; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129290 () Bool)

(assert start!129290)

(declare-fun b!1518410 () Bool)

(declare-fun res!1038318 () Bool)

(declare-fun e!847062 () Bool)

(assert (=> b!1518410 (=> (not res!1038318) (not e!847062))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101146 0))(
  ( (array!101147 (arr!48810 (Array (_ BitVec 32) (_ BitVec 64))) (size!49360 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101146)

(assert (=> b!1518410 (= res!1038318 (and (= (size!49360 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49360 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49360 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518411 () Bool)

(declare-fun e!847066 () Bool)

(declare-fun e!847064 () Bool)

(assert (=> b!1518411 (= e!847066 (not e!847064))))

(declare-fun res!1038325 () Bool)

(assert (=> b!1518411 (=> res!1038325 e!847064)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1518411 (= res!1038325 (or (not (= (select (arr!48810 a!2804) j!70) (select (store (arr!48810 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!847061 () Bool)

(assert (=> b!1518411 e!847061))

(declare-fun res!1038315 () Bool)

(assert (=> b!1518411 (=> (not res!1038315) (not e!847061))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101146 (_ BitVec 32)) Bool)

(assert (=> b!1518411 (= res!1038315 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50830 0))(
  ( (Unit!50831) )
))
(declare-fun lt!658160 () Unit!50830)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101146 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50830)

(assert (=> b!1518411 (= lt!658160 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518412 () Bool)

(declare-fun res!1038314 () Bool)

(assert (=> b!1518412 (=> (not res!1038314) (not e!847066))))

(declare-datatypes ((SeekEntryResult!12981 0))(
  ( (MissingZero!12981 (index!54319 (_ BitVec 32))) (Found!12981 (index!54320 (_ BitVec 32))) (Intermediate!12981 (undefined!13793 Bool) (index!54321 (_ BitVec 32)) (x!135995 (_ BitVec 32))) (Undefined!12981) (MissingVacant!12981 (index!54322 (_ BitVec 32))) )
))
(declare-fun lt!658161 () SeekEntryResult!12981)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101146 (_ BitVec 32)) SeekEntryResult!12981)

(assert (=> b!1518412 (= res!1038314 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48810 a!2804) j!70) a!2804 mask!2512) lt!658161))))

(declare-fun b!1518413 () Bool)

(declare-fun res!1038320 () Bool)

(assert (=> b!1518413 (=> (not res!1038320) (not e!847066))))

(declare-fun lt!658158 () SeekEntryResult!12981)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518413 (= res!1038320 (= lt!658158 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48810 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48810 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101147 (store (arr!48810 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49360 a!2804)) mask!2512)))))

(declare-fun b!1518414 () Bool)

(declare-fun res!1038319 () Bool)

(assert (=> b!1518414 (=> (not res!1038319) (not e!847062))))

(assert (=> b!1518414 (= res!1038319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518415 () Bool)

(declare-fun res!1038324 () Bool)

(assert (=> b!1518415 (=> (not res!1038324) (not e!847062))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518415 (= res!1038324 (validKeyInArray!0 (select (arr!48810 a!2804) j!70)))))

(declare-fun b!1518416 () Bool)

(declare-fun e!847065 () Bool)

(assert (=> b!1518416 (= e!847065 true)))

(declare-fun lt!658159 () (_ BitVec 32))

(declare-fun lt!658162 () SeekEntryResult!12981)

(assert (=> b!1518416 (= lt!658162 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658159 (select (arr!48810 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518417 () Bool)

(declare-fun res!1038313 () Bool)

(assert (=> b!1518417 (=> (not res!1038313) (not e!847062))))

(assert (=> b!1518417 (= res!1038313 (validKeyInArray!0 (select (arr!48810 a!2804) i!961)))))

(declare-fun b!1518418 () Bool)

(declare-fun res!1038322 () Bool)

(assert (=> b!1518418 (=> (not res!1038322) (not e!847062))))

(declare-datatypes ((List!35293 0))(
  ( (Nil!35290) (Cons!35289 (h!36701 (_ BitVec 64)) (t!49987 List!35293)) )
))
(declare-fun arrayNoDuplicates!0 (array!101146 (_ BitVec 32) List!35293) Bool)

(assert (=> b!1518418 (= res!1038322 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35290))))

(declare-fun b!1518419 () Bool)

(assert (=> b!1518419 (= e!847064 e!847065)))

(declare-fun res!1038321 () Bool)

(assert (=> b!1518419 (=> res!1038321 e!847065)))

(assert (=> b!1518419 (= res!1038321 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658159 #b00000000000000000000000000000000) (bvsge lt!658159 (size!49360 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518419 (= lt!658159 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1518420 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101146 (_ BitVec 32)) SeekEntryResult!12981)

(assert (=> b!1518420 (= e!847061 (= (seekEntry!0 (select (arr!48810 a!2804) j!70) a!2804 mask!2512) (Found!12981 j!70)))))

(declare-fun res!1038316 () Bool)

(assert (=> start!129290 (=> (not res!1038316) (not e!847062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129290 (= res!1038316 (validMask!0 mask!2512))))

(assert (=> start!129290 e!847062))

(assert (=> start!129290 true))

(declare-fun array_inv!37838 (array!101146) Bool)

(assert (=> start!129290 (array_inv!37838 a!2804)))

(declare-fun b!1518421 () Bool)

(assert (=> b!1518421 (= e!847062 e!847066)))

(declare-fun res!1038317 () Bool)

(assert (=> b!1518421 (=> (not res!1038317) (not e!847066))))

(assert (=> b!1518421 (= res!1038317 (= lt!658158 lt!658161))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1518421 (= lt!658161 (Intermediate!12981 false resIndex!21 resX!21))))

(assert (=> b!1518421 (= lt!658158 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48810 a!2804) j!70) mask!2512) (select (arr!48810 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518422 () Bool)

(declare-fun res!1038323 () Bool)

(assert (=> b!1518422 (=> (not res!1038323) (not e!847062))))

(assert (=> b!1518422 (= res!1038323 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49360 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49360 a!2804))))))

(assert (= (and start!129290 res!1038316) b!1518410))

(assert (= (and b!1518410 res!1038318) b!1518417))

(assert (= (and b!1518417 res!1038313) b!1518415))

(assert (= (and b!1518415 res!1038324) b!1518414))

(assert (= (and b!1518414 res!1038319) b!1518418))

(assert (= (and b!1518418 res!1038322) b!1518422))

(assert (= (and b!1518422 res!1038323) b!1518421))

(assert (= (and b!1518421 res!1038317) b!1518412))

(assert (= (and b!1518412 res!1038314) b!1518413))

(assert (= (and b!1518413 res!1038320) b!1518411))

(assert (= (and b!1518411 res!1038315) b!1518420))

(assert (= (and b!1518411 (not res!1038325)) b!1518419))

(assert (= (and b!1518419 (not res!1038321)) b!1518416))

(declare-fun m!1401725 () Bool)

(assert (=> b!1518411 m!1401725))

(declare-fun m!1401727 () Bool)

(assert (=> b!1518411 m!1401727))

(declare-fun m!1401729 () Bool)

(assert (=> b!1518411 m!1401729))

(declare-fun m!1401731 () Bool)

(assert (=> b!1518411 m!1401731))

(declare-fun m!1401733 () Bool)

(assert (=> b!1518411 m!1401733))

(assert (=> b!1518416 m!1401725))

(assert (=> b!1518416 m!1401725))

(declare-fun m!1401735 () Bool)

(assert (=> b!1518416 m!1401735))

(assert (=> b!1518421 m!1401725))

(assert (=> b!1518421 m!1401725))

(declare-fun m!1401737 () Bool)

(assert (=> b!1518421 m!1401737))

(assert (=> b!1518421 m!1401737))

(assert (=> b!1518421 m!1401725))

(declare-fun m!1401739 () Bool)

(assert (=> b!1518421 m!1401739))

(declare-fun m!1401741 () Bool)

(assert (=> b!1518418 m!1401741))

(declare-fun m!1401743 () Bool)

(assert (=> b!1518414 m!1401743))

(assert (=> b!1518412 m!1401725))

(assert (=> b!1518412 m!1401725))

(declare-fun m!1401745 () Bool)

(assert (=> b!1518412 m!1401745))

(assert (=> b!1518413 m!1401729))

(assert (=> b!1518413 m!1401731))

(assert (=> b!1518413 m!1401731))

(declare-fun m!1401747 () Bool)

(assert (=> b!1518413 m!1401747))

(assert (=> b!1518413 m!1401747))

(assert (=> b!1518413 m!1401731))

(declare-fun m!1401749 () Bool)

(assert (=> b!1518413 m!1401749))

(declare-fun m!1401751 () Bool)

(assert (=> b!1518417 m!1401751))

(assert (=> b!1518417 m!1401751))

(declare-fun m!1401753 () Bool)

(assert (=> b!1518417 m!1401753))

(assert (=> b!1518420 m!1401725))

(assert (=> b!1518420 m!1401725))

(declare-fun m!1401755 () Bool)

(assert (=> b!1518420 m!1401755))

(declare-fun m!1401757 () Bool)

(assert (=> b!1518419 m!1401757))

(declare-fun m!1401759 () Bool)

(assert (=> start!129290 m!1401759))

(declare-fun m!1401761 () Bool)

(assert (=> start!129290 m!1401761))

(assert (=> b!1518415 m!1401725))

(assert (=> b!1518415 m!1401725))

(declare-fun m!1401763 () Bool)

(assert (=> b!1518415 m!1401763))

(check-sat (not b!1518420) (not b!1518411) (not b!1518415) (not b!1518417) (not b!1518421) (not start!129290) (not b!1518414) (not b!1518416) (not b!1518412) (not b!1518419) (not b!1518413) (not b!1518418))
(check-sat)
