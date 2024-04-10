; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129654 () Bool)

(assert start!129654)

(declare-fun b!1522160 () Bool)

(declare-fun res!1041384 () Bool)

(declare-fun e!848761 () Bool)

(assert (=> b!1522160 (=> (not res!1041384) (not e!848761))))

(declare-datatypes ((array!101329 0))(
  ( (array!101330 (arr!48897 (Array (_ BitVec 32) (_ BitVec 64))) (size!49447 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101329)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1522160 (= res!1041384 (validKeyInArray!0 (select (arr!48897 a!2804) i!961)))))

(declare-fun res!1041386 () Bool)

(assert (=> start!129654 (=> (not res!1041386) (not e!848761))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129654 (= res!1041386 (validMask!0 mask!2512))))

(assert (=> start!129654 e!848761))

(assert (=> start!129654 true))

(declare-fun array_inv!37925 (array!101329) Bool)

(assert (=> start!129654 (array_inv!37925 a!2804)))

(declare-fun b!1522161 () Bool)

(declare-fun res!1041382 () Bool)

(declare-fun e!848759 () Bool)

(assert (=> b!1522161 (=> (not res!1041382) (not e!848759))))

(declare-datatypes ((SeekEntryResult!13062 0))(
  ( (MissingZero!13062 (index!54643 (_ BitVec 32))) (Found!13062 (index!54644 (_ BitVec 32))) (Intermediate!13062 (undefined!13874 Bool) (index!54645 (_ BitVec 32)) (x!136330 (_ BitVec 32))) (Undefined!13062) (MissingVacant!13062 (index!54646 (_ BitVec 32))) )
))
(declare-fun lt!659512 () SeekEntryResult!13062)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101329 (_ BitVec 32)) SeekEntryResult!13062)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1522161 (= res!1041382 (= lt!659512 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48897 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48897 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101330 (store (arr!48897 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49447 a!2804)) mask!2512)))))

(declare-fun b!1522162 () Bool)

(declare-fun res!1041389 () Bool)

(assert (=> b!1522162 (=> (not res!1041389) (not e!848761))))

(assert (=> b!1522162 (= res!1041389 (and (= (size!49447 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49447 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49447 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1522163 () Bool)

(assert (=> b!1522163 (= e!848761 e!848759)))

(declare-fun res!1041385 () Bool)

(assert (=> b!1522163 (=> (not res!1041385) (not e!848759))))

(declare-fun lt!659510 () SeekEntryResult!13062)

(assert (=> b!1522163 (= res!1041385 (= lt!659512 lt!659510))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1522163 (= lt!659510 (Intermediate!13062 false resIndex!21 resX!21))))

(assert (=> b!1522163 (= lt!659512 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48897 a!2804) j!70) mask!2512) (select (arr!48897 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522164 () Bool)

(declare-fun res!1041391 () Bool)

(assert (=> b!1522164 (=> (not res!1041391) (not e!848761))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1522164 (= res!1041391 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49447 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49447 a!2804))))))

(declare-fun b!1522165 () Bool)

(declare-fun res!1041383 () Bool)

(assert (=> b!1522165 (=> (not res!1041383) (not e!848759))))

(assert (=> b!1522165 (= res!1041383 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48897 a!2804) j!70) a!2804 mask!2512) lt!659510))))

(declare-fun b!1522166 () Bool)

(declare-fun res!1041388 () Bool)

(assert (=> b!1522166 (=> (not res!1041388) (not e!848761))))

(declare-datatypes ((List!35380 0))(
  ( (Nil!35377) (Cons!35376 (h!36797 (_ BitVec 64)) (t!50074 List!35380)) )
))
(declare-fun arrayNoDuplicates!0 (array!101329 (_ BitVec 32) List!35380) Bool)

(assert (=> b!1522166 (= res!1041388 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35377))))

(declare-fun b!1522167 () Bool)

(assert (=> b!1522167 (= e!848759 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101329 (_ BitVec 32)) Bool)

(assert (=> b!1522167 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-datatypes ((Unit!50908 0))(
  ( (Unit!50909) )
))
(declare-fun lt!659511 () Unit!50908)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101329 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50908)

(assert (=> b!1522167 (= lt!659511 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1522168 () Bool)

(declare-fun res!1041390 () Bool)

(assert (=> b!1522168 (=> (not res!1041390) (not e!848761))))

(assert (=> b!1522168 (= res!1041390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1522169 () Bool)

(declare-fun res!1041387 () Bool)

(assert (=> b!1522169 (=> (not res!1041387) (not e!848761))))

(assert (=> b!1522169 (= res!1041387 (validKeyInArray!0 (select (arr!48897 a!2804) j!70)))))

(assert (= (and start!129654 res!1041386) b!1522162))

(assert (= (and b!1522162 res!1041389) b!1522160))

(assert (= (and b!1522160 res!1041384) b!1522169))

(assert (= (and b!1522169 res!1041387) b!1522168))

(assert (= (and b!1522168 res!1041390) b!1522166))

(assert (= (and b!1522166 res!1041388) b!1522164))

(assert (= (and b!1522164 res!1041391) b!1522163))

(assert (= (and b!1522163 res!1041385) b!1522165))

(assert (= (and b!1522165 res!1041383) b!1522161))

(assert (= (and b!1522161 res!1041382) b!1522167))

(declare-fun m!1405293 () Bool)

(assert (=> b!1522163 m!1405293))

(assert (=> b!1522163 m!1405293))

(declare-fun m!1405295 () Bool)

(assert (=> b!1522163 m!1405295))

(assert (=> b!1522163 m!1405295))

(assert (=> b!1522163 m!1405293))

(declare-fun m!1405297 () Bool)

(assert (=> b!1522163 m!1405297))

(assert (=> b!1522165 m!1405293))

(assert (=> b!1522165 m!1405293))

(declare-fun m!1405299 () Bool)

(assert (=> b!1522165 m!1405299))

(declare-fun m!1405301 () Bool)

(assert (=> b!1522167 m!1405301))

(declare-fun m!1405303 () Bool)

(assert (=> b!1522167 m!1405303))

(assert (=> b!1522169 m!1405293))

(assert (=> b!1522169 m!1405293))

(declare-fun m!1405305 () Bool)

(assert (=> b!1522169 m!1405305))

(declare-fun m!1405307 () Bool)

(assert (=> b!1522168 m!1405307))

(declare-fun m!1405309 () Bool)

(assert (=> b!1522161 m!1405309))

(declare-fun m!1405311 () Bool)

(assert (=> b!1522161 m!1405311))

(assert (=> b!1522161 m!1405311))

(declare-fun m!1405313 () Bool)

(assert (=> b!1522161 m!1405313))

(assert (=> b!1522161 m!1405313))

(assert (=> b!1522161 m!1405311))

(declare-fun m!1405315 () Bool)

(assert (=> b!1522161 m!1405315))

(declare-fun m!1405317 () Bool)

(assert (=> start!129654 m!1405317))

(declare-fun m!1405319 () Bool)

(assert (=> start!129654 m!1405319))

(declare-fun m!1405321 () Bool)

(assert (=> b!1522166 m!1405321))

(declare-fun m!1405323 () Bool)

(assert (=> b!1522160 m!1405323))

(assert (=> b!1522160 m!1405323))

(declare-fun m!1405325 () Bool)

(assert (=> b!1522160 m!1405325))

(check-sat (not start!129654) (not b!1522168) (not b!1522160) (not b!1522163) (not b!1522167) (not b!1522166) (not b!1522165) (not b!1522161) (not b!1522169))
(check-sat)
