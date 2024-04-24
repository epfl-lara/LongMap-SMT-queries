; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129584 () Bool)

(assert start!129584)

(declare-fun b!1519315 () Bool)

(declare-fun e!847817 () Bool)

(declare-fun e!847813 () Bool)

(assert (=> b!1519315 (= e!847817 (not e!847813))))

(declare-fun res!1037866 () Bool)

(assert (=> b!1519315 (=> res!1037866 e!847813)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!101203 0))(
  ( (array!101204 (arr!48832 (Array (_ BitVec 32) (_ BitVec 64))) (size!49383 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101203)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1519315 (= res!1037866 (or (not (= (select (arr!48832 a!2804) j!70) (select (store (arr!48832 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!847815 () Bool)

(assert (=> b!1519315 e!847815))

(declare-fun res!1037863 () Bool)

(assert (=> b!1519315 (=> (not res!1037863) (not e!847815))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101203 (_ BitVec 32)) Bool)

(assert (=> b!1519315 (= res!1037863 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50695 0))(
  ( (Unit!50696) )
))
(declare-fun lt!658494 () Unit!50695)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101203 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50695)

(assert (=> b!1519315 (= lt!658494 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1519316 () Bool)

(declare-fun res!1037869 () Bool)

(declare-fun e!847818 () Bool)

(assert (=> b!1519316 (=> (not res!1037869) (not e!847818))))

(assert (=> b!1519316 (= res!1037869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1519317 () Bool)

(declare-fun res!1037860 () Bool)

(assert (=> b!1519317 (=> (not res!1037860) (not e!847818))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1519317 (= res!1037860 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49383 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49383 a!2804))))))

(declare-fun b!1519318 () Bool)

(declare-fun res!1037868 () Bool)

(assert (=> b!1519318 (=> (not res!1037868) (not e!847818))))

(assert (=> b!1519318 (= res!1037868 (and (= (size!49383 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49383 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49383 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1519319 () Bool)

(declare-fun e!847816 () Bool)

(assert (=> b!1519319 (= e!847813 e!847816)))

(declare-fun res!1037861 () Bool)

(assert (=> b!1519319 (=> res!1037861 e!847816)))

(declare-fun lt!658492 () (_ BitVec 32))

(assert (=> b!1519319 (= res!1037861 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658492 #b00000000000000000000000000000000) (bvsge lt!658492 (size!49383 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519319 (= lt!658492 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1519320 () Bool)

(assert (=> b!1519320 (= e!847818 e!847817)))

(declare-fun res!1037859 () Bool)

(assert (=> b!1519320 (=> (not res!1037859) (not e!847817))))

(declare-datatypes ((SeekEntryResult!12896 0))(
  ( (MissingZero!12896 (index!53979 (_ BitVec 32))) (Found!12896 (index!53980 (_ BitVec 32))) (Intermediate!12896 (undefined!13708 Bool) (index!53981 (_ BitVec 32)) (x!135873 (_ BitVec 32))) (Undefined!12896) (MissingVacant!12896 (index!53982 (_ BitVec 32))) )
))
(declare-fun lt!658493 () SeekEntryResult!12896)

(declare-fun lt!658491 () SeekEntryResult!12896)

(assert (=> b!1519320 (= res!1037859 (= lt!658493 lt!658491))))

(assert (=> b!1519320 (= lt!658491 (Intermediate!12896 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101203 (_ BitVec 32)) SeekEntryResult!12896)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519320 (= lt!658493 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48832 a!2804) j!70) mask!2512) (select (arr!48832 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519321 () Bool)

(assert (=> b!1519321 (= e!847816 true)))

(declare-fun lt!658495 () SeekEntryResult!12896)

(assert (=> b!1519321 (= lt!658495 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658492 (select (arr!48832 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519322 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101203 (_ BitVec 32)) SeekEntryResult!12896)

(assert (=> b!1519322 (= e!847815 (= (seekEntry!0 (select (arr!48832 a!2804) j!70) a!2804 mask!2512) (Found!12896 j!70)))))

(declare-fun res!1037865 () Bool)

(assert (=> start!129584 (=> (not res!1037865) (not e!847818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129584 (= res!1037865 (validMask!0 mask!2512))))

(assert (=> start!129584 e!847818))

(assert (=> start!129584 true))

(declare-fun array_inv!38113 (array!101203) Bool)

(assert (=> start!129584 (array_inv!38113 a!2804)))

(declare-fun b!1519323 () Bool)

(declare-fun res!1037867 () Bool)

(assert (=> b!1519323 (=> (not res!1037867) (not e!847817))))

(assert (=> b!1519323 (= res!1037867 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48832 a!2804) j!70) a!2804 mask!2512) lt!658491))))

(declare-fun b!1519324 () Bool)

(declare-fun res!1037862 () Bool)

(assert (=> b!1519324 (=> (not res!1037862) (not e!847818))))

(declare-datatypes ((List!35302 0))(
  ( (Nil!35299) (Cons!35298 (h!36728 (_ BitVec 64)) (t!49988 List!35302)) )
))
(declare-fun arrayNoDuplicates!0 (array!101203 (_ BitVec 32) List!35302) Bool)

(assert (=> b!1519324 (= res!1037862 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35299))))

(declare-fun b!1519325 () Bool)

(declare-fun res!1037858 () Bool)

(assert (=> b!1519325 (=> (not res!1037858) (not e!847818))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1519325 (= res!1037858 (validKeyInArray!0 (select (arr!48832 a!2804) i!961)))))

(declare-fun b!1519326 () Bool)

(declare-fun res!1037870 () Bool)

(assert (=> b!1519326 (=> (not res!1037870) (not e!847817))))

(assert (=> b!1519326 (= res!1037870 (= lt!658493 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48832 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48832 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101204 (store (arr!48832 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49383 a!2804)) mask!2512)))))

(declare-fun b!1519327 () Bool)

(declare-fun res!1037864 () Bool)

(assert (=> b!1519327 (=> (not res!1037864) (not e!847818))))

(assert (=> b!1519327 (= res!1037864 (validKeyInArray!0 (select (arr!48832 a!2804) j!70)))))

(assert (= (and start!129584 res!1037865) b!1519318))

(assert (= (and b!1519318 res!1037868) b!1519325))

(assert (= (and b!1519325 res!1037858) b!1519327))

(assert (= (and b!1519327 res!1037864) b!1519316))

(assert (= (and b!1519316 res!1037869) b!1519324))

(assert (= (and b!1519324 res!1037862) b!1519317))

(assert (= (and b!1519317 res!1037860) b!1519320))

(assert (= (and b!1519320 res!1037859) b!1519323))

(assert (= (and b!1519323 res!1037867) b!1519326))

(assert (= (and b!1519326 res!1037870) b!1519315))

(assert (= (and b!1519315 res!1037863) b!1519322))

(assert (= (and b!1519315 (not res!1037866)) b!1519319))

(assert (= (and b!1519319 (not res!1037861)) b!1519321))

(declare-fun m!1402449 () Bool)

(assert (=> b!1519319 m!1402449))

(declare-fun m!1402451 () Bool)

(assert (=> b!1519322 m!1402451))

(assert (=> b!1519322 m!1402451))

(declare-fun m!1402453 () Bool)

(assert (=> b!1519322 m!1402453))

(assert (=> b!1519315 m!1402451))

(declare-fun m!1402455 () Bool)

(assert (=> b!1519315 m!1402455))

(declare-fun m!1402457 () Bool)

(assert (=> b!1519315 m!1402457))

(declare-fun m!1402459 () Bool)

(assert (=> b!1519315 m!1402459))

(declare-fun m!1402461 () Bool)

(assert (=> b!1519315 m!1402461))

(declare-fun m!1402463 () Bool)

(assert (=> b!1519325 m!1402463))

(assert (=> b!1519325 m!1402463))

(declare-fun m!1402465 () Bool)

(assert (=> b!1519325 m!1402465))

(declare-fun m!1402467 () Bool)

(assert (=> b!1519316 m!1402467))

(assert (=> b!1519320 m!1402451))

(assert (=> b!1519320 m!1402451))

(declare-fun m!1402469 () Bool)

(assert (=> b!1519320 m!1402469))

(assert (=> b!1519320 m!1402469))

(assert (=> b!1519320 m!1402451))

(declare-fun m!1402471 () Bool)

(assert (=> b!1519320 m!1402471))

(declare-fun m!1402473 () Bool)

(assert (=> start!129584 m!1402473))

(declare-fun m!1402475 () Bool)

(assert (=> start!129584 m!1402475))

(declare-fun m!1402477 () Bool)

(assert (=> b!1519324 m!1402477))

(assert (=> b!1519321 m!1402451))

(assert (=> b!1519321 m!1402451))

(declare-fun m!1402479 () Bool)

(assert (=> b!1519321 m!1402479))

(assert (=> b!1519326 m!1402457))

(assert (=> b!1519326 m!1402459))

(assert (=> b!1519326 m!1402459))

(declare-fun m!1402481 () Bool)

(assert (=> b!1519326 m!1402481))

(assert (=> b!1519326 m!1402481))

(assert (=> b!1519326 m!1402459))

(declare-fun m!1402483 () Bool)

(assert (=> b!1519326 m!1402483))

(assert (=> b!1519327 m!1402451))

(assert (=> b!1519327 m!1402451))

(declare-fun m!1402485 () Bool)

(assert (=> b!1519327 m!1402485))

(assert (=> b!1519323 m!1402451))

(assert (=> b!1519323 m!1402451))

(declare-fun m!1402487 () Bool)

(assert (=> b!1519323 m!1402487))

(check-sat (not b!1519327) (not start!129584) (not b!1519324) (not b!1519319) (not b!1519326) (not b!1519321) (not b!1519322) (not b!1519316) (not b!1519320) (not b!1519325) (not b!1519315) (not b!1519323))
(check-sat)
