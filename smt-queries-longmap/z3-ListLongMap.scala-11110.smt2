; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130146 () Bool)

(assert start!130146)

(declare-fun b!1525375 () Bool)

(declare-fun res!1042797 () Bool)

(declare-fun e!850628 () Bool)

(assert (=> b!1525375 (=> (not res!1042797) (not e!850628))))

(declare-datatypes ((array!101479 0))(
  ( (array!101480 (arr!48964 (Array (_ BitVec 32) (_ BitVec 64))) (size!49515 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101479)

(declare-datatypes ((List!35434 0))(
  ( (Nil!35431) (Cons!35430 (h!36872 (_ BitVec 64)) (t!50120 List!35434)) )
))
(declare-fun arrayNoDuplicates!0 (array!101479 (_ BitVec 32) List!35434) Bool)

(assert (=> b!1525375 (= res!1042797 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35431))))

(declare-fun b!1525376 () Bool)

(declare-fun res!1042802 () Bool)

(assert (=> b!1525376 (=> (not res!1042802) (not e!850628))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1525376 (= res!1042802 (validKeyInArray!0 (select (arr!48964 a!2804) i!961)))))

(declare-fun b!1525377 () Bool)

(declare-fun e!850630 () Bool)

(assert (=> b!1525377 (= e!850628 e!850630)))

(declare-fun res!1042805 () Bool)

(assert (=> b!1525377 (=> (not res!1042805) (not e!850630))))

(declare-datatypes ((SeekEntryResult!13022 0))(
  ( (MissingZero!13022 (index!54483 (_ BitVec 32))) (Found!13022 (index!54484 (_ BitVec 32))) (Intermediate!13022 (undefined!13834 Bool) (index!54485 (_ BitVec 32)) (x!136387 (_ BitVec 32))) (Undefined!13022) (MissingVacant!13022 (index!54486 (_ BitVec 32))) )
))
(declare-fun lt!660730 () SeekEntryResult!13022)

(declare-fun lt!660731 () SeekEntryResult!13022)

(assert (=> b!1525377 (= res!1042805 (= lt!660730 lt!660731))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1525377 (= lt!660731 (Intermediate!13022 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101479 (_ BitVec 32)) SeekEntryResult!13022)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525377 (= lt!660730 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48964 a!2804) j!70) mask!2512) (select (arr!48964 a!2804) j!70) a!2804 mask!2512))))

(declare-fun e!850627 () Bool)

(declare-fun b!1525378 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101479 (_ BitVec 32)) SeekEntryResult!13022)

(assert (=> b!1525378 (= e!850627 (= (seekEntry!0 (select (arr!48964 a!2804) j!70) a!2804 mask!2512) (Found!13022 j!70)))))

(declare-fun b!1525379 () Bool)

(declare-fun res!1042798 () Bool)

(assert (=> b!1525379 (=> (not res!1042798) (not e!850630))))

(assert (=> b!1525379 (= res!1042798 (= lt!660730 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48964 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48964 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101480 (store (arr!48964 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49515 a!2804)) mask!2512)))))

(declare-fun b!1525380 () Bool)

(declare-fun res!1042796 () Bool)

(assert (=> b!1525380 (=> (not res!1042796) (not e!850630))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1525380 (= res!1042796 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48964 a!2804) j!70) a!2804 mask!2512) lt!660731))))

(declare-fun b!1525381 () Bool)

(declare-fun res!1042804 () Bool)

(assert (=> b!1525381 (=> (not res!1042804) (not e!850628))))

(assert (=> b!1525381 (= res!1042804 (validKeyInArray!0 (select (arr!48964 a!2804) j!70)))))

(declare-fun b!1525382 () Bool)

(declare-fun res!1042799 () Bool)

(assert (=> b!1525382 (=> (not res!1042799) (not e!850628))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101479 (_ BitVec 32)) Bool)

(assert (=> b!1525382 (= res!1042799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1525383 () Bool)

(assert (=> b!1525383 (= e!850630 (not true))))

(assert (=> b!1525383 e!850627))

(declare-fun res!1042803 () Bool)

(assert (=> b!1525383 (=> (not res!1042803) (not e!850627))))

(assert (=> b!1525383 (= res!1042803 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50863 0))(
  ( (Unit!50864) )
))
(declare-fun lt!660732 () Unit!50863)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101479 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50863)

(assert (=> b!1525383 (= lt!660732 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1042800 () Bool)

(assert (=> start!130146 (=> (not res!1042800) (not e!850628))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130146 (= res!1042800 (validMask!0 mask!2512))))

(assert (=> start!130146 e!850628))

(assert (=> start!130146 true))

(declare-fun array_inv!38245 (array!101479) Bool)

(assert (=> start!130146 (array_inv!38245 a!2804)))

(declare-fun b!1525384 () Bool)

(declare-fun res!1042806 () Bool)

(assert (=> b!1525384 (=> (not res!1042806) (not e!850628))))

(assert (=> b!1525384 (= res!1042806 (and (= (size!49515 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49515 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49515 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1525385 () Bool)

(declare-fun res!1042801 () Bool)

(assert (=> b!1525385 (=> (not res!1042801) (not e!850628))))

(assert (=> b!1525385 (= res!1042801 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49515 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49515 a!2804))))))

(assert (= (and start!130146 res!1042800) b!1525384))

(assert (= (and b!1525384 res!1042806) b!1525376))

(assert (= (and b!1525376 res!1042802) b!1525381))

(assert (= (and b!1525381 res!1042804) b!1525382))

(assert (= (and b!1525382 res!1042799) b!1525375))

(assert (= (and b!1525375 res!1042797) b!1525385))

(assert (= (and b!1525385 res!1042801) b!1525377))

(assert (= (and b!1525377 res!1042805) b!1525380))

(assert (= (and b!1525380 res!1042796) b!1525379))

(assert (= (and b!1525379 res!1042798) b!1525383))

(assert (= (and b!1525383 res!1042803) b!1525378))

(declare-fun m!1408309 () Bool)

(assert (=> b!1525380 m!1408309))

(assert (=> b!1525380 m!1408309))

(declare-fun m!1408311 () Bool)

(assert (=> b!1525380 m!1408311))

(declare-fun m!1408313 () Bool)

(assert (=> b!1525376 m!1408313))

(assert (=> b!1525376 m!1408313))

(declare-fun m!1408315 () Bool)

(assert (=> b!1525376 m!1408315))

(assert (=> b!1525378 m!1408309))

(assert (=> b!1525378 m!1408309))

(declare-fun m!1408317 () Bool)

(assert (=> b!1525378 m!1408317))

(declare-fun m!1408319 () Bool)

(assert (=> b!1525375 m!1408319))

(assert (=> b!1525381 m!1408309))

(assert (=> b!1525381 m!1408309))

(declare-fun m!1408321 () Bool)

(assert (=> b!1525381 m!1408321))

(declare-fun m!1408323 () Bool)

(assert (=> start!130146 m!1408323))

(declare-fun m!1408325 () Bool)

(assert (=> start!130146 m!1408325))

(declare-fun m!1408327 () Bool)

(assert (=> b!1525379 m!1408327))

(declare-fun m!1408329 () Bool)

(assert (=> b!1525379 m!1408329))

(assert (=> b!1525379 m!1408329))

(declare-fun m!1408331 () Bool)

(assert (=> b!1525379 m!1408331))

(assert (=> b!1525379 m!1408331))

(assert (=> b!1525379 m!1408329))

(declare-fun m!1408333 () Bool)

(assert (=> b!1525379 m!1408333))

(assert (=> b!1525377 m!1408309))

(assert (=> b!1525377 m!1408309))

(declare-fun m!1408335 () Bool)

(assert (=> b!1525377 m!1408335))

(assert (=> b!1525377 m!1408335))

(assert (=> b!1525377 m!1408309))

(declare-fun m!1408337 () Bool)

(assert (=> b!1525377 m!1408337))

(declare-fun m!1408339 () Bool)

(assert (=> b!1525382 m!1408339))

(declare-fun m!1408341 () Bool)

(assert (=> b!1525383 m!1408341))

(declare-fun m!1408343 () Bool)

(assert (=> b!1525383 m!1408343))

(check-sat (not b!1525377) (not b!1525380) (not b!1525381) (not start!130146) (not b!1525382) (not b!1525376) (not b!1525379) (not b!1525383) (not b!1525378) (not b!1525375))
(check-sat)
