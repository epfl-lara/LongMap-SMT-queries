; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130314 () Bool)

(assert start!130314)

(declare-fun b!1530005 () Bool)

(declare-fun res!1047713 () Bool)

(declare-fun e!852556 () Bool)

(assert (=> b!1530005 (=> (not res!1047713) (not e!852556))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101605 0))(
  ( (array!101606 (arr!49027 (Array (_ BitVec 32) (_ BitVec 64))) (size!49579 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101605)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1530005 (= res!1047713 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49579 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49579 a!2804))))))

(declare-fun b!1530006 () Bool)

(declare-fun res!1047722 () Bool)

(assert (=> b!1530006 (=> (not res!1047722) (not e!852556))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1530006 (= res!1047722 (validKeyInArray!0 (select (arr!49027 a!2804) j!70)))))

(declare-fun b!1530007 () Bool)

(declare-fun e!852559 () Bool)

(assert (=> b!1530007 (= e!852556 e!852559)))

(declare-fun res!1047719 () Bool)

(assert (=> b!1530007 (=> (not res!1047719) (not e!852559))))

(declare-datatypes ((SeekEntryResult!13215 0))(
  ( (MissingZero!13215 (index!55255 (_ BitVec 32))) (Found!13215 (index!55256 (_ BitVec 32))) (Intermediate!13215 (undefined!14027 Bool) (index!55257 (_ BitVec 32)) (x!136946 (_ BitVec 32))) (Undefined!13215) (MissingVacant!13215 (index!55258 (_ BitVec 32))) )
))
(declare-fun lt!662493 () SeekEntryResult!13215)

(declare-fun lt!662490 () SeekEntryResult!13215)

(assert (=> b!1530007 (= res!1047719 (= lt!662493 lt!662490))))

(assert (=> b!1530007 (= lt!662490 (Intermediate!13215 false resIndex!21 resX!21))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101605 (_ BitVec 32)) SeekEntryResult!13215)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530007 (= lt!662493 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49027 a!2804) j!70) mask!2512) (select (arr!49027 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530008 () Bool)

(declare-fun res!1047716 () Bool)

(assert (=> b!1530008 (=> (not res!1047716) (not e!852559))))

(assert (=> b!1530008 (= res!1047716 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49027 a!2804) j!70) a!2804 mask!2512) lt!662490))))

(declare-fun b!1530009 () Bool)

(declare-fun res!1047720 () Bool)

(assert (=> b!1530009 (=> (not res!1047720) (not e!852559))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1530009 (= res!1047720 (= lt!662493 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49027 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49027 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101606 (store (arr!49027 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49579 a!2804)) mask!2512)))))

(declare-fun res!1047717 () Bool)

(assert (=> start!130314 (=> (not res!1047717) (not e!852556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130314 (= res!1047717 (validMask!0 mask!2512))))

(assert (=> start!130314 e!852556))

(assert (=> start!130314 true))

(declare-fun array_inv!38260 (array!101605) Bool)

(assert (=> start!130314 (array_inv!38260 a!2804)))

(declare-fun b!1530010 () Bool)

(declare-fun res!1047723 () Bool)

(assert (=> b!1530010 (=> (not res!1047723) (not e!852556))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101605 (_ BitVec 32)) Bool)

(assert (=> b!1530010 (= res!1047723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1530011 () Bool)

(declare-fun e!852557 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101605 (_ BitVec 32)) SeekEntryResult!13215)

(assert (=> b!1530011 (= e!852557 (= (seekEntry!0 (select (arr!49027 a!2804) j!70) a!2804 mask!2512) (Found!13215 j!70)))))

(declare-fun b!1530012 () Bool)

(declare-fun res!1047714 () Bool)

(assert (=> b!1530012 (=> (not res!1047714) (not e!852556))))

(assert (=> b!1530012 (= res!1047714 (and (= (size!49579 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49579 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49579 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1530013 () Bool)

(declare-fun res!1047721 () Bool)

(assert (=> b!1530013 (=> (not res!1047721) (not e!852556))))

(declare-datatypes ((List!35588 0))(
  ( (Nil!35585) (Cons!35584 (h!37024 (_ BitVec 64)) (t!50274 List!35588)) )
))
(declare-fun arrayNoDuplicates!0 (array!101605 (_ BitVec 32) List!35588) Bool)

(assert (=> b!1530013 (= res!1047721 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35585))))

(declare-fun b!1530014 () Bool)

(declare-fun e!852558 () Bool)

(assert (=> b!1530014 (= e!852558 true)))

(declare-fun lt!662491 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530014 (= lt!662491 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1530015 () Bool)

(declare-fun res!1047724 () Bool)

(assert (=> b!1530015 (=> (not res!1047724) (not e!852556))))

(assert (=> b!1530015 (= res!1047724 (validKeyInArray!0 (select (arr!49027 a!2804) i!961)))))

(declare-fun b!1530016 () Bool)

(assert (=> b!1530016 (= e!852559 (not e!852558))))

(declare-fun res!1047715 () Bool)

(assert (=> b!1530016 (=> res!1047715 e!852558)))

(assert (=> b!1530016 (= res!1047715 (or (not (= (select (arr!49027 a!2804) j!70) (select (store (arr!49027 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1530016 e!852557))

(declare-fun res!1047718 () Bool)

(assert (=> b!1530016 (=> (not res!1047718) (not e!852557))))

(assert (=> b!1530016 (= res!1047718 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51053 0))(
  ( (Unit!51054) )
))
(declare-fun lt!662492 () Unit!51053)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101605 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51053)

(assert (=> b!1530016 (= lt!662492 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!130314 res!1047717) b!1530012))

(assert (= (and b!1530012 res!1047714) b!1530015))

(assert (= (and b!1530015 res!1047724) b!1530006))

(assert (= (and b!1530006 res!1047722) b!1530010))

(assert (= (and b!1530010 res!1047723) b!1530013))

(assert (= (and b!1530013 res!1047721) b!1530005))

(assert (= (and b!1530005 res!1047713) b!1530007))

(assert (= (and b!1530007 res!1047719) b!1530008))

(assert (= (and b!1530008 res!1047716) b!1530009))

(assert (= (and b!1530009 res!1047720) b!1530016))

(assert (= (and b!1530016 res!1047718) b!1530011))

(assert (= (and b!1530016 (not res!1047715)) b!1530014))

(declare-fun m!1412291 () Bool)

(assert (=> b!1530014 m!1412291))

(declare-fun m!1412293 () Bool)

(assert (=> b!1530010 m!1412293))

(declare-fun m!1412295 () Bool)

(assert (=> b!1530008 m!1412295))

(assert (=> b!1530008 m!1412295))

(declare-fun m!1412297 () Bool)

(assert (=> b!1530008 m!1412297))

(declare-fun m!1412299 () Bool)

(assert (=> start!130314 m!1412299))

(declare-fun m!1412301 () Bool)

(assert (=> start!130314 m!1412301))

(assert (=> b!1530011 m!1412295))

(assert (=> b!1530011 m!1412295))

(declare-fun m!1412303 () Bool)

(assert (=> b!1530011 m!1412303))

(assert (=> b!1530016 m!1412295))

(declare-fun m!1412305 () Bool)

(assert (=> b!1530016 m!1412305))

(declare-fun m!1412307 () Bool)

(assert (=> b!1530016 m!1412307))

(declare-fun m!1412309 () Bool)

(assert (=> b!1530016 m!1412309))

(declare-fun m!1412311 () Bool)

(assert (=> b!1530016 m!1412311))

(declare-fun m!1412313 () Bool)

(assert (=> b!1530013 m!1412313))

(declare-fun m!1412315 () Bool)

(assert (=> b!1530015 m!1412315))

(assert (=> b!1530015 m!1412315))

(declare-fun m!1412317 () Bool)

(assert (=> b!1530015 m!1412317))

(assert (=> b!1530007 m!1412295))

(assert (=> b!1530007 m!1412295))

(declare-fun m!1412319 () Bool)

(assert (=> b!1530007 m!1412319))

(assert (=> b!1530007 m!1412319))

(assert (=> b!1530007 m!1412295))

(declare-fun m!1412321 () Bool)

(assert (=> b!1530007 m!1412321))

(assert (=> b!1530009 m!1412307))

(assert (=> b!1530009 m!1412309))

(assert (=> b!1530009 m!1412309))

(declare-fun m!1412323 () Bool)

(assert (=> b!1530009 m!1412323))

(assert (=> b!1530009 m!1412323))

(assert (=> b!1530009 m!1412309))

(declare-fun m!1412325 () Bool)

(assert (=> b!1530009 m!1412325))

(assert (=> b!1530006 m!1412295))

(assert (=> b!1530006 m!1412295))

(declare-fun m!1412327 () Bool)

(assert (=> b!1530006 m!1412327))

(check-sat (not b!1530011) (not b!1530016) (not start!130314) (not b!1530009) (not b!1530008) (not b!1530014) (not b!1530006) (not b!1530015) (not b!1530007) (not b!1530013) (not b!1530010))
(check-sat)
