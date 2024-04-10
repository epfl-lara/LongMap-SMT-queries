; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129040 () Bool)

(assert start!129040)

(declare-fun b!1513490 () Bool)

(declare-fun res!1033397 () Bool)

(declare-fun e!844699 () Bool)

(assert (=> b!1513490 (=> (not res!1033397) (not e!844699))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100896 0))(
  ( (array!100897 (arr!48685 (Array (_ BitVec 32) (_ BitVec 64))) (size!49235 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100896)

(assert (=> b!1513490 (= res!1033397 (and (= (size!49235 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49235 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49235 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513491 () Bool)

(declare-fun e!844694 () Bool)

(assert (=> b!1513491 (= e!844694 (not true))))

(declare-fun e!844693 () Bool)

(assert (=> b!1513491 e!844693))

(declare-fun res!1033392 () Bool)

(assert (=> b!1513491 (=> (not res!1033392) (not e!844693))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100896 (_ BitVec 32)) Bool)

(assert (=> b!1513491 (= res!1033392 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50580 0))(
  ( (Unit!50581) )
))
(declare-fun lt!655995 () Unit!50580)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100896 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50580)

(assert (=> b!1513491 (= lt!655995 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513492 () Bool)

(declare-fun e!844697 () Bool)

(assert (=> b!1513492 (= e!844697 e!844694)))

(declare-fun res!1033399 () Bool)

(assert (=> b!1513492 (=> (not res!1033399) (not e!844694))))

(declare-fun lt!655997 () (_ BitVec 64))

(declare-fun lt!655999 () array!100896)

(declare-datatypes ((SeekEntryResult!12856 0))(
  ( (MissingZero!12856 (index!53819 (_ BitVec 32))) (Found!12856 (index!53820 (_ BitVec 32))) (Intermediate!12856 (undefined!13668 Bool) (index!53821 (_ BitVec 32)) (x!135534 (_ BitVec 32))) (Undefined!12856) (MissingVacant!12856 (index!53822 (_ BitVec 32))) )
))
(declare-fun lt!655998 () SeekEntryResult!12856)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100896 (_ BitVec 32)) SeekEntryResult!12856)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513492 (= res!1033399 (= lt!655998 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!655997 mask!2512) lt!655997 lt!655999 mask!2512)))))

(assert (=> b!1513492 (= lt!655997 (select (store (arr!48685 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513492 (= lt!655999 (array!100897 (store (arr!48685 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49235 a!2804)))))

(declare-fun b!1513493 () Bool)

(declare-fun res!1033398 () Bool)

(assert (=> b!1513493 (=> (not res!1033398) (not e!844699))))

(assert (=> b!1513493 (= res!1033398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513494 () Bool)

(declare-fun res!1033401 () Bool)

(assert (=> b!1513494 (=> (not res!1033401) (not e!844699))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513494 (= res!1033401 (validKeyInArray!0 (select (arr!48685 a!2804) j!70)))))

(declare-fun b!1513495 () Bool)

(declare-fun e!844695 () Bool)

(declare-fun e!844696 () Bool)

(assert (=> b!1513495 (= e!844695 e!844696)))

(declare-fun res!1033404 () Bool)

(assert (=> b!1513495 (=> (not res!1033404) (not e!844696))))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100896 (_ BitVec 32)) SeekEntryResult!12856)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100896 (_ BitVec 32)) SeekEntryResult!12856)

(assert (=> b!1513495 (= res!1033404 (= (seekEntryOrOpen!0 (select (arr!48685 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48685 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513496 () Bool)

(declare-fun res!1033403 () Bool)

(assert (=> b!1513496 (=> (not res!1033403) (not e!844699))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1513496 (= res!1033403 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49235 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49235 a!2804))))))

(declare-fun b!1513497 () Bool)

(assert (=> b!1513497 (= e!844693 e!844695)))

(declare-fun res!1033393 () Bool)

(assert (=> b!1513497 (=> res!1033393 e!844695)))

(assert (=> b!1513497 (= res!1033393 (or (not (= (select (arr!48685 a!2804) j!70) lt!655997)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48685 a!2804) index!487) (select (arr!48685 a!2804) j!70)) (not (= (select (arr!48685 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1513498 () Bool)

(declare-fun res!1033396 () Bool)

(assert (=> b!1513498 (=> (not res!1033396) (not e!844699))))

(assert (=> b!1513498 (= res!1033396 (validKeyInArray!0 (select (arr!48685 a!2804) i!961)))))

(declare-fun b!1513499 () Bool)

(declare-fun res!1033394 () Bool)

(assert (=> b!1513499 (=> (not res!1033394) (not e!844697))))

(declare-fun lt!655996 () SeekEntryResult!12856)

(assert (=> b!1513499 (= res!1033394 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48685 a!2804) j!70) a!2804 mask!2512) lt!655996))))

(declare-fun res!1033395 () Bool)

(assert (=> start!129040 (=> (not res!1033395) (not e!844699))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129040 (= res!1033395 (validMask!0 mask!2512))))

(assert (=> start!129040 e!844699))

(assert (=> start!129040 true))

(declare-fun array_inv!37713 (array!100896) Bool)

(assert (=> start!129040 (array_inv!37713 a!2804)))

(declare-fun b!1513489 () Bool)

(assert (=> b!1513489 (= e!844696 (= (seekEntryOrOpen!0 lt!655997 lt!655999 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!655997 lt!655999 mask!2512)))))

(declare-fun b!1513500 () Bool)

(declare-fun res!1033405 () Bool)

(assert (=> b!1513500 (=> (not res!1033405) (not e!844699))))

(declare-datatypes ((List!35168 0))(
  ( (Nil!35165) (Cons!35164 (h!36576 (_ BitVec 64)) (t!49862 List!35168)) )
))
(declare-fun arrayNoDuplicates!0 (array!100896 (_ BitVec 32) List!35168) Bool)

(assert (=> b!1513500 (= res!1033405 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35165))))

(declare-fun b!1513501 () Bool)

(assert (=> b!1513501 (= e!844699 e!844697)))

(declare-fun res!1033400 () Bool)

(assert (=> b!1513501 (=> (not res!1033400) (not e!844697))))

(assert (=> b!1513501 (= res!1033400 (= lt!655998 lt!655996))))

(assert (=> b!1513501 (= lt!655996 (Intermediate!12856 false resIndex!21 resX!21))))

(assert (=> b!1513501 (= lt!655998 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48685 a!2804) j!70) mask!2512) (select (arr!48685 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513502 () Bool)

(declare-fun res!1033402 () Bool)

(assert (=> b!1513502 (=> (not res!1033402) (not e!844693))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100896 (_ BitVec 32)) SeekEntryResult!12856)

(assert (=> b!1513502 (= res!1033402 (= (seekEntry!0 (select (arr!48685 a!2804) j!70) a!2804 mask!2512) (Found!12856 j!70)))))

(assert (= (and start!129040 res!1033395) b!1513490))

(assert (= (and b!1513490 res!1033397) b!1513498))

(assert (= (and b!1513498 res!1033396) b!1513494))

(assert (= (and b!1513494 res!1033401) b!1513493))

(assert (= (and b!1513493 res!1033398) b!1513500))

(assert (= (and b!1513500 res!1033405) b!1513496))

(assert (= (and b!1513496 res!1033403) b!1513501))

(assert (= (and b!1513501 res!1033400) b!1513499))

(assert (= (and b!1513499 res!1033394) b!1513492))

(assert (= (and b!1513492 res!1033399) b!1513491))

(assert (= (and b!1513491 res!1033392) b!1513502))

(assert (= (and b!1513502 res!1033402) b!1513497))

(assert (= (and b!1513497 (not res!1033393)) b!1513495))

(assert (= (and b!1513495 res!1033404) b!1513489))

(declare-fun m!1396353 () Bool)

(assert (=> b!1513491 m!1396353))

(declare-fun m!1396355 () Bool)

(assert (=> b!1513491 m!1396355))

(declare-fun m!1396357 () Bool)

(assert (=> b!1513493 m!1396357))

(declare-fun m!1396359 () Bool)

(assert (=> b!1513497 m!1396359))

(declare-fun m!1396361 () Bool)

(assert (=> b!1513497 m!1396361))

(declare-fun m!1396363 () Bool)

(assert (=> b!1513492 m!1396363))

(assert (=> b!1513492 m!1396363))

(declare-fun m!1396365 () Bool)

(assert (=> b!1513492 m!1396365))

(declare-fun m!1396367 () Bool)

(assert (=> b!1513492 m!1396367))

(declare-fun m!1396369 () Bool)

(assert (=> b!1513492 m!1396369))

(assert (=> b!1513501 m!1396359))

(assert (=> b!1513501 m!1396359))

(declare-fun m!1396371 () Bool)

(assert (=> b!1513501 m!1396371))

(assert (=> b!1513501 m!1396371))

(assert (=> b!1513501 m!1396359))

(declare-fun m!1396373 () Bool)

(assert (=> b!1513501 m!1396373))

(declare-fun m!1396375 () Bool)

(assert (=> b!1513500 m!1396375))

(assert (=> b!1513495 m!1396359))

(assert (=> b!1513495 m!1396359))

(declare-fun m!1396377 () Bool)

(assert (=> b!1513495 m!1396377))

(assert (=> b!1513495 m!1396359))

(declare-fun m!1396379 () Bool)

(assert (=> b!1513495 m!1396379))

(assert (=> b!1513499 m!1396359))

(assert (=> b!1513499 m!1396359))

(declare-fun m!1396381 () Bool)

(assert (=> b!1513499 m!1396381))

(assert (=> b!1513494 m!1396359))

(assert (=> b!1513494 m!1396359))

(declare-fun m!1396383 () Bool)

(assert (=> b!1513494 m!1396383))

(declare-fun m!1396385 () Bool)

(assert (=> b!1513498 m!1396385))

(assert (=> b!1513498 m!1396385))

(declare-fun m!1396387 () Bool)

(assert (=> b!1513498 m!1396387))

(declare-fun m!1396389 () Bool)

(assert (=> b!1513489 m!1396389))

(declare-fun m!1396391 () Bool)

(assert (=> b!1513489 m!1396391))

(declare-fun m!1396393 () Bool)

(assert (=> start!129040 m!1396393))

(declare-fun m!1396395 () Bool)

(assert (=> start!129040 m!1396395))

(assert (=> b!1513502 m!1396359))

(assert (=> b!1513502 m!1396359))

(declare-fun m!1396397 () Bool)

(assert (=> b!1513502 m!1396397))

(push 1)

