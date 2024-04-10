; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128814 () Bool)

(assert start!128814)

(declare-fun b!1509428 () Bool)

(declare-fun res!1029332 () Bool)

(declare-fun e!843095 () Bool)

(assert (=> b!1509428 (=> (not res!1029332) (not e!843095))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100670 0))(
  ( (array!100671 (arr!48572 (Array (_ BitVec 32) (_ BitVec 64))) (size!49122 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100670)

(assert (=> b!1509428 (= res!1029332 (and (= (size!49122 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49122 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49122 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509429 () Bool)

(declare-fun res!1029337 () Bool)

(assert (=> b!1509429 (=> (not res!1029337) (not e!843095))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1509429 (= res!1029337 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49122 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49122 a!2804))))))

(declare-fun b!1509430 () Bool)

(declare-fun res!1029335 () Bool)

(assert (=> b!1509430 (=> (not res!1029335) (not e!843095))))

(declare-datatypes ((List!35055 0))(
  ( (Nil!35052) (Cons!35051 (h!36463 (_ BitVec 64)) (t!49749 List!35055)) )
))
(declare-fun arrayNoDuplicates!0 (array!100670 (_ BitVec 32) List!35055) Bool)

(assert (=> b!1509430 (= res!1029335 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35052))))

(declare-fun res!1029333 () Bool)

(assert (=> start!128814 (=> (not res!1029333) (not e!843095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128814 (= res!1029333 (validMask!0 mask!2512))))

(assert (=> start!128814 e!843095))

(assert (=> start!128814 true))

(declare-fun array_inv!37600 (array!100670) Bool)

(assert (=> start!128814 (array_inv!37600 a!2804)))

(declare-fun b!1509431 () Bool)

(declare-fun res!1029331 () Bool)

(assert (=> b!1509431 (=> (not res!1029331) (not e!843095))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509431 (= res!1029331 (validKeyInArray!0 (select (arr!48572 a!2804) j!70)))))

(declare-fun b!1509432 () Bool)

(declare-fun res!1029334 () Bool)

(declare-fun e!843097 () Bool)

(assert (=> b!1509432 (=> (not res!1029334) (not e!843097))))

(declare-datatypes ((SeekEntryResult!12743 0))(
  ( (MissingZero!12743 (index!53367 (_ BitVec 32))) (Found!12743 (index!53368 (_ BitVec 32))) (Intermediate!12743 (undefined!13555 Bool) (index!53369 (_ BitVec 32)) (x!135125 (_ BitVec 32))) (Undefined!12743) (MissingVacant!12743 (index!53370 (_ BitVec 32))) )
))
(declare-fun lt!654890 () SeekEntryResult!12743)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100670 (_ BitVec 32)) SeekEntryResult!12743)

(assert (=> b!1509432 (= res!1029334 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48572 a!2804) j!70) a!2804 mask!2512) lt!654890))))

(declare-fun b!1509433 () Bool)

(declare-fun res!1029340 () Bool)

(assert (=> b!1509433 (=> (not res!1029340) (not e!843095))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100670 (_ BitVec 32)) Bool)

(assert (=> b!1509433 (= res!1029340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509434 () Bool)

(assert (=> b!1509434 (= e!843095 e!843097)))

(declare-fun res!1029336 () Bool)

(assert (=> b!1509434 (=> (not res!1029336) (not e!843097))))

(declare-fun lt!654891 () SeekEntryResult!12743)

(assert (=> b!1509434 (= res!1029336 (= lt!654891 lt!654890))))

(assert (=> b!1509434 (= lt!654890 (Intermediate!12743 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509434 (= lt!654891 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48572 a!2804) j!70) mask!2512) (select (arr!48572 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509435 () Bool)

(assert (=> b!1509435 (= e!843097 (not true))))

(assert (=> b!1509435 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-datatypes ((Unit!50354 0))(
  ( (Unit!50355) )
))
(declare-fun lt!654892 () Unit!50354)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100670 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50354)

(assert (=> b!1509435 (= lt!654892 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1509436 () Bool)

(declare-fun res!1029339 () Bool)

(assert (=> b!1509436 (=> (not res!1029339) (not e!843097))))

(assert (=> b!1509436 (= res!1029339 (= lt!654891 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48572 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48572 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100671 (store (arr!48572 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49122 a!2804)) mask!2512)))))

(declare-fun b!1509437 () Bool)

(declare-fun res!1029338 () Bool)

(assert (=> b!1509437 (=> (not res!1029338) (not e!843095))))

(assert (=> b!1509437 (= res!1029338 (validKeyInArray!0 (select (arr!48572 a!2804) i!961)))))

(assert (= (and start!128814 res!1029333) b!1509428))

(assert (= (and b!1509428 res!1029332) b!1509437))

(assert (= (and b!1509437 res!1029338) b!1509431))

(assert (= (and b!1509431 res!1029331) b!1509433))

(assert (= (and b!1509433 res!1029340) b!1509430))

(assert (= (and b!1509430 res!1029335) b!1509429))

(assert (= (and b!1509429 res!1029337) b!1509434))

(assert (= (and b!1509434 res!1029336) b!1509432))

(assert (= (and b!1509432 res!1029334) b!1509436))

(assert (= (and b!1509436 res!1029339) b!1509435))

(declare-fun m!1391905 () Bool)

(assert (=> b!1509436 m!1391905))

(declare-fun m!1391907 () Bool)

(assert (=> b!1509436 m!1391907))

(assert (=> b!1509436 m!1391907))

(declare-fun m!1391909 () Bool)

(assert (=> b!1509436 m!1391909))

(assert (=> b!1509436 m!1391909))

(assert (=> b!1509436 m!1391907))

(declare-fun m!1391911 () Bool)

(assert (=> b!1509436 m!1391911))

(declare-fun m!1391913 () Bool)

(assert (=> b!1509430 m!1391913))

(declare-fun m!1391915 () Bool)

(assert (=> b!1509433 m!1391915))

(declare-fun m!1391917 () Bool)

(assert (=> b!1509431 m!1391917))

(assert (=> b!1509431 m!1391917))

(declare-fun m!1391919 () Bool)

(assert (=> b!1509431 m!1391919))

(declare-fun m!1391921 () Bool)

(assert (=> b!1509435 m!1391921))

(declare-fun m!1391923 () Bool)

(assert (=> b!1509435 m!1391923))

(assert (=> b!1509434 m!1391917))

(assert (=> b!1509434 m!1391917))

(declare-fun m!1391925 () Bool)

(assert (=> b!1509434 m!1391925))

(assert (=> b!1509434 m!1391925))

(assert (=> b!1509434 m!1391917))

(declare-fun m!1391927 () Bool)

(assert (=> b!1509434 m!1391927))

(declare-fun m!1391929 () Bool)

(assert (=> start!128814 m!1391929))

(declare-fun m!1391931 () Bool)

(assert (=> start!128814 m!1391931))

(assert (=> b!1509432 m!1391917))

(assert (=> b!1509432 m!1391917))

(declare-fun m!1391933 () Bool)

(assert (=> b!1509432 m!1391933))

(declare-fun m!1391935 () Bool)

(assert (=> b!1509437 m!1391935))

(assert (=> b!1509437 m!1391935))

(declare-fun m!1391937 () Bool)

(assert (=> b!1509437 m!1391937))

(push 1)

