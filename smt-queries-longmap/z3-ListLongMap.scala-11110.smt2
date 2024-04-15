; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129714 () Bool)

(assert start!129714)

(declare-fun e!849012 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!101308 0))(
  ( (array!101309 (arr!48886 (Array (_ BitVec 32) (_ BitVec 64))) (size!49438 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101308)

(declare-fun b!1522770 () Bool)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13074 0))(
  ( (MissingZero!13074 (index!54691 (_ BitVec 32))) (Found!13074 (index!54692 (_ BitVec 32))) (Intermediate!13074 (undefined!13886 Bool) (index!54693 (_ BitVec 32)) (x!136387 (_ BitVec 32))) (Undefined!13074) (MissingVacant!13074 (index!54694 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101308 (_ BitVec 32)) SeekEntryResult!13074)

(assert (=> b!1522770 (= e!849012 (= (seekEntry!0 (select (arr!48886 a!2804) j!70) a!2804 mask!2512) (Found!13074 j!70)))))

(declare-fun b!1522771 () Bool)

(declare-fun res!1041863 () Bool)

(declare-fun e!849013 () Bool)

(assert (=> b!1522771 (=> (not res!1041863) (not e!849013))))

(declare-fun lt!659570 () SeekEntryResult!13074)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101308 (_ BitVec 32)) SeekEntryResult!13074)

(assert (=> b!1522771 (= res!1041863 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48886 a!2804) j!70) a!2804 mask!2512) lt!659570))))

(declare-fun b!1522772 () Bool)

(declare-fun e!849010 () Bool)

(assert (=> b!1522772 (= e!849010 e!849013)))

(declare-fun res!1041867 () Bool)

(assert (=> b!1522772 (=> (not res!1041867) (not e!849013))))

(declare-fun lt!659571 () SeekEntryResult!13074)

(assert (=> b!1522772 (= res!1041867 (= lt!659571 lt!659570))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1522772 (= lt!659570 (Intermediate!13074 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1522772 (= lt!659571 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48886 a!2804) j!70) mask!2512) (select (arr!48886 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522773 () Bool)

(declare-fun res!1041869 () Bool)

(assert (=> b!1522773 (=> (not res!1041869) (not e!849010))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1522773 (= res!1041869 (and (= (size!49438 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49438 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49438 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1522775 () Bool)

(assert (=> b!1522775 (= e!849013 (not true))))

(assert (=> b!1522775 e!849012))

(declare-fun res!1041870 () Bool)

(assert (=> b!1522775 (=> (not res!1041870) (not e!849012))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101308 (_ BitVec 32)) Bool)

(assert (=> b!1522775 (= res!1041870 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50771 0))(
  ( (Unit!50772) )
))
(declare-fun lt!659569 () Unit!50771)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101308 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50771)

(assert (=> b!1522775 (= lt!659569 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1522776 () Bool)

(declare-fun res!1041861 () Bool)

(assert (=> b!1522776 (=> (not res!1041861) (not e!849010))))

(declare-datatypes ((List!35447 0))(
  ( (Nil!35444) (Cons!35443 (h!36868 (_ BitVec 64)) (t!50133 List!35447)) )
))
(declare-fun arrayNoDuplicates!0 (array!101308 (_ BitVec 32) List!35447) Bool)

(assert (=> b!1522776 (= res!1041861 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35444))))

(declare-fun b!1522777 () Bool)

(declare-fun res!1041862 () Bool)

(assert (=> b!1522777 (=> (not res!1041862) (not e!849010))))

(assert (=> b!1522777 (= res!1041862 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49438 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49438 a!2804))))))

(declare-fun b!1522778 () Bool)

(declare-fun res!1041868 () Bool)

(assert (=> b!1522778 (=> (not res!1041868) (not e!849013))))

(assert (=> b!1522778 (= res!1041868 (= lt!659571 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48886 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48886 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101309 (store (arr!48886 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49438 a!2804)) mask!2512)))))

(declare-fun b!1522779 () Bool)

(declare-fun res!1041864 () Bool)

(assert (=> b!1522779 (=> (not res!1041864) (not e!849010))))

(assert (=> b!1522779 (= res!1041864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1522780 () Bool)

(declare-fun res!1041871 () Bool)

(assert (=> b!1522780 (=> (not res!1041871) (not e!849010))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1522780 (= res!1041871 (validKeyInArray!0 (select (arr!48886 a!2804) i!961)))))

(declare-fun res!1041866 () Bool)

(assert (=> start!129714 (=> (not res!1041866) (not e!849010))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129714 (= res!1041866 (validMask!0 mask!2512))))

(assert (=> start!129714 e!849010))

(assert (=> start!129714 true))

(declare-fun array_inv!38119 (array!101308) Bool)

(assert (=> start!129714 (array_inv!38119 a!2804)))

(declare-fun b!1522774 () Bool)

(declare-fun res!1041865 () Bool)

(assert (=> b!1522774 (=> (not res!1041865) (not e!849010))))

(assert (=> b!1522774 (= res!1041865 (validKeyInArray!0 (select (arr!48886 a!2804) j!70)))))

(assert (= (and start!129714 res!1041866) b!1522773))

(assert (= (and b!1522773 res!1041869) b!1522780))

(assert (= (and b!1522780 res!1041871) b!1522774))

(assert (= (and b!1522774 res!1041865) b!1522779))

(assert (= (and b!1522779 res!1041864) b!1522776))

(assert (= (and b!1522776 res!1041861) b!1522777))

(assert (= (and b!1522777 res!1041862) b!1522772))

(assert (= (and b!1522772 res!1041867) b!1522771))

(assert (= (and b!1522771 res!1041863) b!1522778))

(assert (= (and b!1522778 res!1041868) b!1522775))

(assert (= (and b!1522775 res!1041870) b!1522770))

(declare-fun m!1405277 () Bool)

(assert (=> b!1522774 m!1405277))

(assert (=> b!1522774 m!1405277))

(declare-fun m!1405279 () Bool)

(assert (=> b!1522774 m!1405279))

(declare-fun m!1405281 () Bool)

(assert (=> b!1522776 m!1405281))

(assert (=> b!1522772 m!1405277))

(assert (=> b!1522772 m!1405277))

(declare-fun m!1405283 () Bool)

(assert (=> b!1522772 m!1405283))

(assert (=> b!1522772 m!1405283))

(assert (=> b!1522772 m!1405277))

(declare-fun m!1405285 () Bool)

(assert (=> b!1522772 m!1405285))

(declare-fun m!1405287 () Bool)

(assert (=> b!1522778 m!1405287))

(declare-fun m!1405289 () Bool)

(assert (=> b!1522778 m!1405289))

(assert (=> b!1522778 m!1405289))

(declare-fun m!1405291 () Bool)

(assert (=> b!1522778 m!1405291))

(assert (=> b!1522778 m!1405291))

(assert (=> b!1522778 m!1405289))

(declare-fun m!1405293 () Bool)

(assert (=> b!1522778 m!1405293))

(assert (=> b!1522771 m!1405277))

(assert (=> b!1522771 m!1405277))

(declare-fun m!1405295 () Bool)

(assert (=> b!1522771 m!1405295))

(declare-fun m!1405297 () Bool)

(assert (=> b!1522780 m!1405297))

(assert (=> b!1522780 m!1405297))

(declare-fun m!1405299 () Bool)

(assert (=> b!1522780 m!1405299))

(declare-fun m!1405301 () Bool)

(assert (=> start!129714 m!1405301))

(declare-fun m!1405303 () Bool)

(assert (=> start!129714 m!1405303))

(declare-fun m!1405305 () Bool)

(assert (=> b!1522779 m!1405305))

(assert (=> b!1522770 m!1405277))

(assert (=> b!1522770 m!1405277))

(declare-fun m!1405307 () Bool)

(assert (=> b!1522770 m!1405307))

(declare-fun m!1405309 () Bool)

(assert (=> b!1522775 m!1405309))

(declare-fun m!1405311 () Bool)

(assert (=> b!1522775 m!1405311))

(check-sat (not b!1522771) (not start!129714) (not b!1522772) (not b!1522775) (not b!1522774) (not b!1522778) (not b!1522776) (not b!1522779) (not b!1522770) (not b!1522780))
(check-sat)
