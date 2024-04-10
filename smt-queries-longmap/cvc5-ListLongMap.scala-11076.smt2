; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129288 () Bool)

(assert start!129288)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun e!847047 () Bool)

(declare-datatypes ((array!101144 0))(
  ( (array!101145 (arr!48809 (Array (_ BitVec 32) (_ BitVec 64))) (size!49359 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101144)

(declare-fun b!1518371 () Bool)

(declare-datatypes ((SeekEntryResult!12980 0))(
  ( (MissingZero!12980 (index!54315 (_ BitVec 32))) (Found!12980 (index!54316 (_ BitVec 32))) (Intermediate!12980 (undefined!13792 Bool) (index!54317 (_ BitVec 32)) (x!135994 (_ BitVec 32))) (Undefined!12980) (MissingVacant!12980 (index!54318 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101144 (_ BitVec 32)) SeekEntryResult!12980)

(assert (=> b!1518371 (= e!847047 (= (seekEntry!0 (select (arr!48809 a!2804) j!70) a!2804 mask!2512) (Found!12980 j!70)))))

(declare-fun b!1518372 () Bool)

(declare-fun res!1038274 () Bool)

(declare-fun e!847044 () Bool)

(assert (=> b!1518372 (=> (not res!1038274) (not e!847044))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1518372 (= res!1038274 (and (= (size!49359 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49359 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49359 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518373 () Bool)

(declare-fun e!847046 () Bool)

(declare-fun e!847043 () Bool)

(assert (=> b!1518373 (= e!847046 e!847043)))

(declare-fun res!1038276 () Bool)

(assert (=> b!1518373 (=> res!1038276 e!847043)))

(declare-fun lt!658144 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1518373 (= res!1038276 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658144 #b00000000000000000000000000000000) (bvsge lt!658144 (size!49359 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518373 (= lt!658144 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1518374 () Bool)

(declare-fun e!847045 () Bool)

(assert (=> b!1518374 (= e!847044 e!847045)))

(declare-fun res!1038286 () Bool)

(assert (=> b!1518374 (=> (not res!1038286) (not e!847045))))

(declare-fun lt!658143 () SeekEntryResult!12980)

(declare-fun lt!658145 () SeekEntryResult!12980)

(assert (=> b!1518374 (= res!1038286 (= lt!658143 lt!658145))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1518374 (= lt!658145 (Intermediate!12980 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101144 (_ BitVec 32)) SeekEntryResult!12980)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518374 (= lt!658143 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48809 a!2804) j!70) mask!2512) (select (arr!48809 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518375 () Bool)

(declare-fun res!1038278 () Bool)

(assert (=> b!1518375 (=> (not res!1038278) (not e!847045))))

(assert (=> b!1518375 (= res!1038278 (= lt!658143 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48809 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48809 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101145 (store (arr!48809 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49359 a!2804)) mask!2512)))))

(declare-fun b!1518376 () Bool)

(assert (=> b!1518376 (= e!847043 true)))

(declare-fun lt!658146 () SeekEntryResult!12980)

(assert (=> b!1518376 (= lt!658146 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658144 (select (arr!48809 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518377 () Bool)

(declare-fun res!1038279 () Bool)

(assert (=> b!1518377 (=> (not res!1038279) (not e!847045))))

(assert (=> b!1518377 (= res!1038279 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48809 a!2804) j!70) a!2804 mask!2512) lt!658145))))

(declare-fun b!1518378 () Bool)

(declare-fun res!1038281 () Bool)

(assert (=> b!1518378 (=> (not res!1038281) (not e!847044))))

(assert (=> b!1518378 (= res!1038281 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49359 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49359 a!2804))))))

(declare-fun b!1518379 () Bool)

(declare-fun res!1038277 () Bool)

(assert (=> b!1518379 (=> (not res!1038277) (not e!847044))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518379 (= res!1038277 (validKeyInArray!0 (select (arr!48809 a!2804) i!961)))))

(declare-fun b!1518380 () Bool)

(declare-fun res!1038280 () Bool)

(assert (=> b!1518380 (=> (not res!1038280) (not e!847044))))

(assert (=> b!1518380 (= res!1038280 (validKeyInArray!0 (select (arr!48809 a!2804) j!70)))))

(declare-fun b!1518381 () Bool)

(assert (=> b!1518381 (= e!847045 (not e!847046))))

(declare-fun res!1038275 () Bool)

(assert (=> b!1518381 (=> res!1038275 e!847046)))

(assert (=> b!1518381 (= res!1038275 (or (not (= (select (arr!48809 a!2804) j!70) (select (store (arr!48809 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1518381 e!847047))

(declare-fun res!1038283 () Bool)

(assert (=> b!1518381 (=> (not res!1038283) (not e!847047))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101144 (_ BitVec 32)) Bool)

(assert (=> b!1518381 (= res!1038283 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50828 0))(
  ( (Unit!50829) )
))
(declare-fun lt!658147 () Unit!50828)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101144 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50828)

(assert (=> b!1518381 (= lt!658147 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1038284 () Bool)

(assert (=> start!129288 (=> (not res!1038284) (not e!847044))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129288 (= res!1038284 (validMask!0 mask!2512))))

(assert (=> start!129288 e!847044))

(assert (=> start!129288 true))

(declare-fun array_inv!37837 (array!101144) Bool)

(assert (=> start!129288 (array_inv!37837 a!2804)))

(declare-fun b!1518382 () Bool)

(declare-fun res!1038282 () Bool)

(assert (=> b!1518382 (=> (not res!1038282) (not e!847044))))

(declare-datatypes ((List!35292 0))(
  ( (Nil!35289) (Cons!35288 (h!36700 (_ BitVec 64)) (t!49986 List!35292)) )
))
(declare-fun arrayNoDuplicates!0 (array!101144 (_ BitVec 32) List!35292) Bool)

(assert (=> b!1518382 (= res!1038282 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35289))))

(declare-fun b!1518383 () Bool)

(declare-fun res!1038285 () Bool)

(assert (=> b!1518383 (=> (not res!1038285) (not e!847044))))

(assert (=> b!1518383 (= res!1038285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!129288 res!1038284) b!1518372))

(assert (= (and b!1518372 res!1038274) b!1518379))

(assert (= (and b!1518379 res!1038277) b!1518380))

(assert (= (and b!1518380 res!1038280) b!1518383))

(assert (= (and b!1518383 res!1038285) b!1518382))

(assert (= (and b!1518382 res!1038282) b!1518378))

(assert (= (and b!1518378 res!1038281) b!1518374))

(assert (= (and b!1518374 res!1038286) b!1518377))

(assert (= (and b!1518377 res!1038279) b!1518375))

(assert (= (and b!1518375 res!1038278) b!1518381))

(assert (= (and b!1518381 res!1038283) b!1518371))

(assert (= (and b!1518381 (not res!1038275)) b!1518373))

(assert (= (and b!1518373 (not res!1038276)) b!1518376))

(declare-fun m!1401685 () Bool)

(assert (=> b!1518381 m!1401685))

(declare-fun m!1401687 () Bool)

(assert (=> b!1518381 m!1401687))

(declare-fun m!1401689 () Bool)

(assert (=> b!1518381 m!1401689))

(declare-fun m!1401691 () Bool)

(assert (=> b!1518381 m!1401691))

(declare-fun m!1401693 () Bool)

(assert (=> b!1518381 m!1401693))

(assert (=> b!1518371 m!1401685))

(assert (=> b!1518371 m!1401685))

(declare-fun m!1401695 () Bool)

(assert (=> b!1518371 m!1401695))

(assert (=> b!1518375 m!1401689))

(assert (=> b!1518375 m!1401691))

(assert (=> b!1518375 m!1401691))

(declare-fun m!1401697 () Bool)

(assert (=> b!1518375 m!1401697))

(assert (=> b!1518375 m!1401697))

(assert (=> b!1518375 m!1401691))

(declare-fun m!1401699 () Bool)

(assert (=> b!1518375 m!1401699))

(assert (=> b!1518380 m!1401685))

(assert (=> b!1518380 m!1401685))

(declare-fun m!1401701 () Bool)

(assert (=> b!1518380 m!1401701))

(assert (=> b!1518374 m!1401685))

(assert (=> b!1518374 m!1401685))

(declare-fun m!1401703 () Bool)

(assert (=> b!1518374 m!1401703))

(assert (=> b!1518374 m!1401703))

(assert (=> b!1518374 m!1401685))

(declare-fun m!1401705 () Bool)

(assert (=> b!1518374 m!1401705))

(assert (=> b!1518376 m!1401685))

(assert (=> b!1518376 m!1401685))

(declare-fun m!1401707 () Bool)

(assert (=> b!1518376 m!1401707))

(declare-fun m!1401709 () Bool)

(assert (=> b!1518373 m!1401709))

(declare-fun m!1401711 () Bool)

(assert (=> b!1518383 m!1401711))

(declare-fun m!1401713 () Bool)

(assert (=> b!1518379 m!1401713))

(assert (=> b!1518379 m!1401713))

(declare-fun m!1401715 () Bool)

(assert (=> b!1518379 m!1401715))

(assert (=> b!1518377 m!1401685))

(assert (=> b!1518377 m!1401685))

(declare-fun m!1401717 () Bool)

(assert (=> b!1518377 m!1401717))

(declare-fun m!1401719 () Bool)

(assert (=> start!129288 m!1401719))

(declare-fun m!1401721 () Bool)

(assert (=> start!129288 m!1401721))

(declare-fun m!1401723 () Bool)

(assert (=> b!1518382 m!1401723))

(push 1)

