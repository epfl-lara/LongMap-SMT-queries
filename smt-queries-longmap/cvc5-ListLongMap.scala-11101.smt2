; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129628 () Bool)

(assert start!129628)

(declare-fun b!1521786 () Bool)

(declare-fun res!1041015 () Bool)

(declare-fun e!848643 () Bool)

(assert (=> b!1521786 (=> (not res!1041015) (not e!848643))))

(declare-datatypes ((array!101303 0))(
  ( (array!101304 (arr!48884 (Array (_ BitVec 32) (_ BitVec 64))) (size!49434 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101303)

(declare-datatypes ((List!35367 0))(
  ( (Nil!35364) (Cons!35363 (h!36784 (_ BitVec 64)) (t!50061 List!35367)) )
))
(declare-fun arrayNoDuplicates!0 (array!101303 (_ BitVec 32) List!35367) Bool)

(assert (=> b!1521786 (= res!1041015 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35364))))

(declare-fun b!1521788 () Bool)

(declare-fun res!1041014 () Bool)

(assert (=> b!1521788 (=> (not res!1041014) (not e!848643))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521788 (= res!1041014 (validKeyInArray!0 (select (arr!48884 a!2804) j!70)))))

(declare-fun b!1521789 () Bool)

(declare-fun res!1041016 () Bool)

(assert (=> b!1521789 (=> (not res!1041016) (not e!848643))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1521789 (= res!1041016 (validKeyInArray!0 (select (arr!48884 a!2804) i!961)))))

(declare-fun b!1521790 () Bool)

(declare-fun e!848644 () Bool)

(assert (=> b!1521790 (= e!848643 e!848644)))

(declare-fun res!1041009 () Bool)

(assert (=> b!1521790 (=> (not res!1041009) (not e!848644))))

(declare-datatypes ((SeekEntryResult!13049 0))(
  ( (MissingZero!13049 (index!54591 (_ BitVec 32))) (Found!13049 (index!54592 (_ BitVec 32))) (Intermediate!13049 (undefined!13861 Bool) (index!54593 (_ BitVec 32)) (x!136285 (_ BitVec 32))) (Undefined!13049) (MissingVacant!13049 (index!54594 (_ BitVec 32))) )
))
(declare-fun lt!659427 () SeekEntryResult!13049)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101303 (_ BitVec 32)) SeekEntryResult!13049)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521790 (= res!1041009 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48884 a!2804) j!70) mask!2512) (select (arr!48884 a!2804) j!70) a!2804 mask!2512) lt!659427))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1521790 (= lt!659427 (Intermediate!13049 false resIndex!21 resX!21))))

(declare-fun b!1521791 () Bool)

(declare-fun res!1041012 () Bool)

(assert (=> b!1521791 (=> (not res!1041012) (not e!848643))))

(assert (=> b!1521791 (= res!1041012 (and (= (size!49434 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49434 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49434 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521792 () Bool)

(declare-fun res!1041013 () Bool)

(assert (=> b!1521792 (=> (not res!1041013) (not e!848644))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1521792 (= res!1041013 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48884 a!2804) j!70) a!2804 mask!2512) lt!659427))))

(declare-fun b!1521787 () Bool)

(declare-fun res!1041010 () Bool)

(assert (=> b!1521787 (=> (not res!1041010) (not e!848643))))

(assert (=> b!1521787 (= res!1041010 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49434 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49434 a!2804))))))

(declare-fun res!1041008 () Bool)

(assert (=> start!129628 (=> (not res!1041008) (not e!848643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129628 (= res!1041008 (validMask!0 mask!2512))))

(assert (=> start!129628 e!848643))

(assert (=> start!129628 true))

(declare-fun array_inv!37912 (array!101303) Bool)

(assert (=> start!129628 (array_inv!37912 a!2804)))

(declare-fun b!1521793 () Bool)

(declare-fun res!1041011 () Bool)

(assert (=> b!1521793 (=> (not res!1041011) (not e!848643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101303 (_ BitVec 32)) Bool)

(assert (=> b!1521793 (= res!1041011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521794 () Bool)

(assert (=> b!1521794 (= e!848644 false)))

(declare-fun lt!659428 () SeekEntryResult!13049)

(assert (=> b!1521794 (= lt!659428 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48884 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48884 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101304 (store (arr!48884 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49434 a!2804)) mask!2512))))

(assert (= (and start!129628 res!1041008) b!1521791))

(assert (= (and b!1521791 res!1041012) b!1521789))

(assert (= (and b!1521789 res!1041016) b!1521788))

(assert (= (and b!1521788 res!1041014) b!1521793))

(assert (= (and b!1521793 res!1041011) b!1521786))

(assert (= (and b!1521786 res!1041015) b!1521787))

(assert (= (and b!1521787 res!1041010) b!1521790))

(assert (= (and b!1521790 res!1041009) b!1521792))

(assert (= (and b!1521792 res!1041013) b!1521794))

(declare-fun m!1404899 () Bool)

(assert (=> start!129628 m!1404899))

(declare-fun m!1404901 () Bool)

(assert (=> start!129628 m!1404901))

(declare-fun m!1404903 () Bool)

(assert (=> b!1521794 m!1404903))

(declare-fun m!1404905 () Bool)

(assert (=> b!1521794 m!1404905))

(assert (=> b!1521794 m!1404905))

(declare-fun m!1404907 () Bool)

(assert (=> b!1521794 m!1404907))

(assert (=> b!1521794 m!1404907))

(assert (=> b!1521794 m!1404905))

(declare-fun m!1404909 () Bool)

(assert (=> b!1521794 m!1404909))

(declare-fun m!1404911 () Bool)

(assert (=> b!1521789 m!1404911))

(assert (=> b!1521789 m!1404911))

(declare-fun m!1404913 () Bool)

(assert (=> b!1521789 m!1404913))

(declare-fun m!1404915 () Bool)

(assert (=> b!1521788 m!1404915))

(assert (=> b!1521788 m!1404915))

(declare-fun m!1404917 () Bool)

(assert (=> b!1521788 m!1404917))

(declare-fun m!1404919 () Bool)

(assert (=> b!1521786 m!1404919))

(assert (=> b!1521790 m!1404915))

(assert (=> b!1521790 m!1404915))

(declare-fun m!1404921 () Bool)

(assert (=> b!1521790 m!1404921))

(assert (=> b!1521790 m!1404921))

(assert (=> b!1521790 m!1404915))

(declare-fun m!1404923 () Bool)

(assert (=> b!1521790 m!1404923))

(assert (=> b!1521792 m!1404915))

(assert (=> b!1521792 m!1404915))

(declare-fun m!1404925 () Bool)

(assert (=> b!1521792 m!1404925))

(declare-fun m!1404927 () Bool)

(assert (=> b!1521793 m!1404927))

(push 1)

