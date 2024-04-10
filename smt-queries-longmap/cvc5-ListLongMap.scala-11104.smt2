; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129646 () Bool)

(assert start!129646)

(declare-fun b!1522047 () Bool)

(declare-fun res!1041277 () Bool)

(declare-fun e!848725 () Bool)

(assert (=> b!1522047 (=> (not res!1041277) (not e!848725))))

(declare-datatypes ((array!101321 0))(
  ( (array!101322 (arr!48893 (Array (_ BitVec 32) (_ BitVec 64))) (size!49443 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101321)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101321 (_ BitVec 32)) Bool)

(assert (=> b!1522047 (= res!1041277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1522048 () Bool)

(declare-fun res!1041271 () Bool)

(assert (=> b!1522048 (=> (not res!1041271) (not e!848725))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1522048 (= res!1041271 (and (= (size!49443 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49443 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49443 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1522049 () Bool)

(declare-fun res!1041272 () Bool)

(assert (=> b!1522049 (=> (not res!1041272) (not e!848725))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1522049 (= res!1041272 (validKeyInArray!0 (select (arr!48893 a!2804) j!70)))))

(declare-fun res!1041270 () Bool)

(assert (=> start!129646 (=> (not res!1041270) (not e!848725))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129646 (= res!1041270 (validMask!0 mask!2512))))

(assert (=> start!129646 e!848725))

(assert (=> start!129646 true))

(declare-fun array_inv!37921 (array!101321) Bool)

(assert (=> start!129646 (array_inv!37921 a!2804)))

(declare-fun b!1522050 () Bool)

(declare-fun res!1041276 () Bool)

(declare-fun e!848723 () Bool)

(assert (=> b!1522050 (=> (not res!1041276) (not e!848723))))

(declare-datatypes ((SeekEntryResult!13058 0))(
  ( (MissingZero!13058 (index!54627 (_ BitVec 32))) (Found!13058 (index!54628 (_ BitVec 32))) (Intermediate!13058 (undefined!13870 Bool) (index!54629 (_ BitVec 32)) (x!136318 (_ BitVec 32))) (Undefined!13058) (MissingVacant!13058 (index!54630 (_ BitVec 32))) )
))
(declare-fun lt!659482 () SeekEntryResult!13058)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101321 (_ BitVec 32)) SeekEntryResult!13058)

(assert (=> b!1522050 (= res!1041276 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48893 a!2804) j!70) a!2804 mask!2512) lt!659482))))

(declare-fun b!1522051 () Bool)

(declare-fun res!1041273 () Bool)

(assert (=> b!1522051 (=> (not res!1041273) (not e!848725))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1522051 (= res!1041273 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49443 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49443 a!2804))))))

(declare-fun b!1522052 () Bool)

(declare-fun res!1041274 () Bool)

(assert (=> b!1522052 (=> (not res!1041274) (not e!848725))))

(declare-datatypes ((List!35376 0))(
  ( (Nil!35373) (Cons!35372 (h!36793 (_ BitVec 64)) (t!50070 List!35376)) )
))
(declare-fun arrayNoDuplicates!0 (array!101321 (_ BitVec 32) List!35376) Bool)

(assert (=> b!1522052 (= res!1041274 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35373))))

(declare-fun b!1522053 () Bool)

(assert (=> b!1522053 (= e!848725 e!848723)))

(declare-fun res!1041275 () Bool)

(assert (=> b!1522053 (=> (not res!1041275) (not e!848723))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1522053 (= res!1041275 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48893 a!2804) j!70) mask!2512) (select (arr!48893 a!2804) j!70) a!2804 mask!2512) lt!659482))))

(assert (=> b!1522053 (= lt!659482 (Intermediate!13058 false resIndex!21 resX!21))))

(declare-fun b!1522054 () Bool)

(assert (=> b!1522054 (= e!848723 false)))

(declare-fun lt!659481 () SeekEntryResult!13058)

(assert (=> b!1522054 (= lt!659481 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48893 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48893 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101322 (store (arr!48893 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49443 a!2804)) mask!2512))))

(declare-fun b!1522055 () Bool)

(declare-fun res!1041269 () Bool)

(assert (=> b!1522055 (=> (not res!1041269) (not e!848725))))

(assert (=> b!1522055 (= res!1041269 (validKeyInArray!0 (select (arr!48893 a!2804) i!961)))))

(assert (= (and start!129646 res!1041270) b!1522048))

(assert (= (and b!1522048 res!1041271) b!1522055))

(assert (= (and b!1522055 res!1041269) b!1522049))

(assert (= (and b!1522049 res!1041272) b!1522047))

(assert (= (and b!1522047 res!1041277) b!1522052))

(assert (= (and b!1522052 res!1041274) b!1522051))

(assert (= (and b!1522051 res!1041273) b!1522053))

(assert (= (and b!1522053 res!1041275) b!1522050))

(assert (= (and b!1522050 res!1041276) b!1522054))

(declare-fun m!1405169 () Bool)

(assert (=> b!1522054 m!1405169))

(declare-fun m!1405171 () Bool)

(assert (=> b!1522054 m!1405171))

(assert (=> b!1522054 m!1405171))

(declare-fun m!1405173 () Bool)

(assert (=> b!1522054 m!1405173))

(assert (=> b!1522054 m!1405173))

(assert (=> b!1522054 m!1405171))

(declare-fun m!1405175 () Bool)

(assert (=> b!1522054 m!1405175))

(declare-fun m!1405177 () Bool)

(assert (=> b!1522053 m!1405177))

(assert (=> b!1522053 m!1405177))

(declare-fun m!1405179 () Bool)

(assert (=> b!1522053 m!1405179))

(assert (=> b!1522053 m!1405179))

(assert (=> b!1522053 m!1405177))

(declare-fun m!1405181 () Bool)

(assert (=> b!1522053 m!1405181))

(assert (=> b!1522049 m!1405177))

(assert (=> b!1522049 m!1405177))

(declare-fun m!1405183 () Bool)

(assert (=> b!1522049 m!1405183))

(declare-fun m!1405185 () Bool)

(assert (=> b!1522055 m!1405185))

(assert (=> b!1522055 m!1405185))

(declare-fun m!1405187 () Bool)

(assert (=> b!1522055 m!1405187))

(assert (=> b!1522050 m!1405177))

(assert (=> b!1522050 m!1405177))

(declare-fun m!1405189 () Bool)

(assert (=> b!1522050 m!1405189))

(declare-fun m!1405191 () Bool)

(assert (=> start!129646 m!1405191))

(declare-fun m!1405193 () Bool)

(assert (=> start!129646 m!1405193))

(declare-fun m!1405195 () Bool)

(assert (=> b!1522047 m!1405195))

(declare-fun m!1405197 () Bool)

(assert (=> b!1522052 m!1405197))

(push 1)

