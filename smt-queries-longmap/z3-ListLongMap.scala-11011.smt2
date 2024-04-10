; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128900 () Bool)

(assert start!128900)

(declare-fun b!1510840 () Bool)

(declare-fun res!1030750 () Bool)

(declare-fun e!843604 () Bool)

(assert (=> b!1510840 (=> (not res!1030750) (not e!843604))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100756 0))(
  ( (array!100757 (arr!48615 (Array (_ BitVec 32) (_ BitVec 64))) (size!49165 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100756)

(assert (=> b!1510840 (= res!1030750 (and (= (size!49165 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49165 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49165 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510841 () Bool)

(declare-fun res!1030745 () Bool)

(assert (=> b!1510841 (=> (not res!1030745) (not e!843604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100756 (_ BitVec 32)) Bool)

(assert (=> b!1510841 (= res!1030745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510842 () Bool)

(declare-fun res!1030753 () Bool)

(assert (=> b!1510842 (=> (not res!1030753) (not e!843604))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510842 (= res!1030753 (validKeyInArray!0 (select (arr!48615 a!2804) i!961)))))

(declare-fun b!1510843 () Bool)

(declare-fun res!1030752 () Bool)

(assert (=> b!1510843 (=> (not res!1030752) (not e!843604))))

(declare-datatypes ((List!35098 0))(
  ( (Nil!35095) (Cons!35094 (h!36506 (_ BitVec 64)) (t!49792 List!35098)) )
))
(declare-fun arrayNoDuplicates!0 (array!100756 (_ BitVec 32) List!35098) Bool)

(assert (=> b!1510843 (= res!1030752 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35095))))

(declare-fun b!1510844 () Bool)

(declare-fun e!843607 () Bool)

(assert (=> b!1510844 (= e!843604 e!843607)))

(declare-fun res!1030744 () Bool)

(assert (=> b!1510844 (=> (not res!1030744) (not e!843607))))

(declare-datatypes ((SeekEntryResult!12786 0))(
  ( (MissingZero!12786 (index!53539 (_ BitVec 32))) (Found!12786 (index!53540 (_ BitVec 32))) (Intermediate!12786 (undefined!13598 Bool) (index!53541 (_ BitVec 32)) (x!135280 (_ BitVec 32))) (Undefined!12786) (MissingVacant!12786 (index!53542 (_ BitVec 32))) )
))
(declare-fun lt!655279 () SeekEntryResult!12786)

(declare-fun lt!655278 () SeekEntryResult!12786)

(assert (=> b!1510844 (= res!1030744 (= lt!655279 lt!655278))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1510844 (= lt!655278 (Intermediate!12786 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100756 (_ BitVec 32)) SeekEntryResult!12786)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510844 (= lt!655279 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48615 a!2804) j!70) mask!2512) (select (arr!48615 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510845 () Bool)

(declare-fun e!843606 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100756 (_ BitVec 32)) SeekEntryResult!12786)

(assert (=> b!1510845 (= e!843606 (= (seekEntry!0 (select (arr!48615 a!2804) j!70) a!2804 mask!2512) (Found!12786 j!70)))))

(declare-fun res!1030747 () Bool)

(assert (=> start!128900 (=> (not res!1030747) (not e!843604))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128900 (= res!1030747 (validMask!0 mask!2512))))

(assert (=> start!128900 e!843604))

(assert (=> start!128900 true))

(declare-fun array_inv!37643 (array!100756) Bool)

(assert (=> start!128900 (array_inv!37643 a!2804)))

(declare-fun b!1510846 () Bool)

(declare-fun res!1030748 () Bool)

(assert (=> b!1510846 (=> (not res!1030748) (not e!843604))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1510846 (= res!1030748 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49165 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49165 a!2804))))))

(declare-fun b!1510847 () Bool)

(declare-fun res!1030751 () Bool)

(assert (=> b!1510847 (=> (not res!1030751) (not e!843604))))

(assert (=> b!1510847 (= res!1030751 (validKeyInArray!0 (select (arr!48615 a!2804) j!70)))))

(declare-fun b!1510848 () Bool)

(declare-fun res!1030746 () Bool)

(assert (=> b!1510848 (=> (not res!1030746) (not e!843607))))

(assert (=> b!1510848 (= res!1030746 (= lt!655279 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48615 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48615 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100757 (store (arr!48615 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49165 a!2804)) mask!2512)))))

(declare-fun b!1510849 () Bool)

(assert (=> b!1510849 (= e!843607 (not true))))

(assert (=> b!1510849 e!843606))

(declare-fun res!1030743 () Bool)

(assert (=> b!1510849 (=> (not res!1030743) (not e!843606))))

(assert (=> b!1510849 (= res!1030743 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50440 0))(
  ( (Unit!50441) )
))
(declare-fun lt!655277 () Unit!50440)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100756 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50440)

(assert (=> b!1510849 (= lt!655277 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1510850 () Bool)

(declare-fun res!1030749 () Bool)

(assert (=> b!1510850 (=> (not res!1030749) (not e!843607))))

(assert (=> b!1510850 (= res!1030749 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48615 a!2804) j!70) a!2804 mask!2512) lt!655278))))

(assert (= (and start!128900 res!1030747) b!1510840))

(assert (= (and b!1510840 res!1030750) b!1510842))

(assert (= (and b!1510842 res!1030753) b!1510847))

(assert (= (and b!1510847 res!1030751) b!1510841))

(assert (= (and b!1510841 res!1030745) b!1510843))

(assert (= (and b!1510843 res!1030752) b!1510846))

(assert (= (and b!1510846 res!1030748) b!1510844))

(assert (= (and b!1510844 res!1030744) b!1510850))

(assert (= (and b!1510850 res!1030749) b!1510848))

(assert (= (and b!1510848 res!1030746) b!1510849))

(assert (= (and b!1510849 res!1030743) b!1510845))

(declare-fun m!1393471 () Bool)

(assert (=> b!1510844 m!1393471))

(assert (=> b!1510844 m!1393471))

(declare-fun m!1393473 () Bool)

(assert (=> b!1510844 m!1393473))

(assert (=> b!1510844 m!1393473))

(assert (=> b!1510844 m!1393471))

(declare-fun m!1393475 () Bool)

(assert (=> b!1510844 m!1393475))

(declare-fun m!1393477 () Bool)

(assert (=> b!1510841 m!1393477))

(declare-fun m!1393479 () Bool)

(assert (=> b!1510843 m!1393479))

(declare-fun m!1393481 () Bool)

(assert (=> start!128900 m!1393481))

(declare-fun m!1393483 () Bool)

(assert (=> start!128900 m!1393483))

(assert (=> b!1510847 m!1393471))

(assert (=> b!1510847 m!1393471))

(declare-fun m!1393485 () Bool)

(assert (=> b!1510847 m!1393485))

(declare-fun m!1393487 () Bool)

(assert (=> b!1510849 m!1393487))

(declare-fun m!1393489 () Bool)

(assert (=> b!1510849 m!1393489))

(declare-fun m!1393491 () Bool)

(assert (=> b!1510848 m!1393491))

(declare-fun m!1393493 () Bool)

(assert (=> b!1510848 m!1393493))

(assert (=> b!1510848 m!1393493))

(declare-fun m!1393495 () Bool)

(assert (=> b!1510848 m!1393495))

(assert (=> b!1510848 m!1393495))

(assert (=> b!1510848 m!1393493))

(declare-fun m!1393497 () Bool)

(assert (=> b!1510848 m!1393497))

(assert (=> b!1510850 m!1393471))

(assert (=> b!1510850 m!1393471))

(declare-fun m!1393499 () Bool)

(assert (=> b!1510850 m!1393499))

(assert (=> b!1510845 m!1393471))

(assert (=> b!1510845 m!1393471))

(declare-fun m!1393501 () Bool)

(assert (=> b!1510845 m!1393501))

(declare-fun m!1393503 () Bool)

(assert (=> b!1510842 m!1393503))

(assert (=> b!1510842 m!1393503))

(declare-fun m!1393505 () Bool)

(assert (=> b!1510842 m!1393505))

(check-sat (not b!1510847) (not b!1510848) (not b!1510850) (not start!128900) (not b!1510844) (not b!1510841) (not b!1510845) (not b!1510843) (not b!1510849) (not b!1510842))
(check-sat)
