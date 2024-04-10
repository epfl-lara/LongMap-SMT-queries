; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129580 () Bool)

(assert start!129580)

(declare-fun b!1521172 () Bool)

(declare-fun res!1040398 () Bool)

(declare-fun e!848461 () Bool)

(assert (=> b!1521172 (=> (not res!1040398) (not e!848461))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101255 0))(
  ( (array!101256 (arr!48860 (Array (_ BitVec 32) (_ BitVec 64))) (size!49410 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101255)

(assert (=> b!1521172 (= res!1040398 (and (= (size!49410 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49410 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49410 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521173 () Bool)

(declare-fun res!1040401 () Bool)

(assert (=> b!1521173 (=> (not res!1040401) (not e!848461))))

(declare-datatypes ((List!35343 0))(
  ( (Nil!35340) (Cons!35339 (h!36760 (_ BitVec 64)) (t!50037 List!35343)) )
))
(declare-fun arrayNoDuplicates!0 (array!101255 (_ BitVec 32) List!35343) Bool)

(assert (=> b!1521173 (= res!1040401 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35340))))

(declare-fun b!1521174 () Bool)

(declare-fun res!1040397 () Bool)

(assert (=> b!1521174 (=> (not res!1040397) (not e!848461))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13025 0))(
  ( (MissingZero!13025 (index!54495 (_ BitVec 32))) (Found!13025 (index!54496 (_ BitVec 32))) (Intermediate!13025 (undefined!13837 Bool) (index!54497 (_ BitVec 32)) (x!136197 (_ BitVec 32))) (Undefined!13025) (MissingVacant!13025 (index!54498 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101255 (_ BitVec 32)) SeekEntryResult!13025)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521174 (= res!1040397 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48860 a!2804) j!70) mask!2512) (select (arr!48860 a!2804) j!70) a!2804 mask!2512) (Intermediate!13025 false resIndex!21 resX!21)))))

(declare-fun b!1521175 () Bool)

(declare-fun res!1040395 () Bool)

(assert (=> b!1521175 (=> (not res!1040395) (not e!848461))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101255 (_ BitVec 32)) Bool)

(assert (=> b!1521175 (= res!1040395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521176 () Bool)

(declare-fun res!1040394 () Bool)

(assert (=> b!1521176 (=> (not res!1040394) (not e!848461))))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1521176 (= res!1040394 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49410 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49410 a!2804))))))

(declare-fun res!1040400 () Bool)

(assert (=> start!129580 (=> (not res!1040400) (not e!848461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129580 (= res!1040400 (validMask!0 mask!2512))))

(assert (=> start!129580 e!848461))

(assert (=> start!129580 true))

(declare-fun array_inv!37888 (array!101255) Bool)

(assert (=> start!129580 (array_inv!37888 a!2804)))

(declare-fun b!1521177 () Bool)

(declare-fun res!1040396 () Bool)

(assert (=> b!1521177 (=> (not res!1040396) (not e!848461))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521177 (= res!1040396 (validKeyInArray!0 (select (arr!48860 a!2804) j!70)))))

(declare-fun b!1521178 () Bool)

(assert (=> b!1521178 (= e!848461 false)))

(declare-fun lt!659317 () SeekEntryResult!13025)

(assert (=> b!1521178 (= lt!659317 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48860 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1521179 () Bool)

(declare-fun res!1040399 () Bool)

(assert (=> b!1521179 (=> (not res!1040399) (not e!848461))))

(assert (=> b!1521179 (= res!1040399 (validKeyInArray!0 (select (arr!48860 a!2804) i!961)))))

(assert (= (and start!129580 res!1040400) b!1521172))

(assert (= (and b!1521172 res!1040398) b!1521179))

(assert (= (and b!1521179 res!1040399) b!1521177))

(assert (= (and b!1521177 res!1040396) b!1521175))

(assert (= (and b!1521175 res!1040395) b!1521173))

(assert (= (and b!1521173 res!1040401) b!1521176))

(assert (= (and b!1521176 res!1040394) b!1521174))

(assert (= (and b!1521174 res!1040397) b!1521178))

(declare-fun m!1404287 () Bool)

(assert (=> b!1521178 m!1404287))

(assert (=> b!1521178 m!1404287))

(declare-fun m!1404289 () Bool)

(assert (=> b!1521178 m!1404289))

(assert (=> b!1521174 m!1404287))

(assert (=> b!1521174 m!1404287))

(declare-fun m!1404291 () Bool)

(assert (=> b!1521174 m!1404291))

(assert (=> b!1521174 m!1404291))

(assert (=> b!1521174 m!1404287))

(declare-fun m!1404293 () Bool)

(assert (=> b!1521174 m!1404293))

(declare-fun m!1404295 () Bool)

(assert (=> start!129580 m!1404295))

(declare-fun m!1404297 () Bool)

(assert (=> start!129580 m!1404297))

(declare-fun m!1404299 () Bool)

(assert (=> b!1521173 m!1404299))

(assert (=> b!1521177 m!1404287))

(assert (=> b!1521177 m!1404287))

(declare-fun m!1404301 () Bool)

(assert (=> b!1521177 m!1404301))

(declare-fun m!1404303 () Bool)

(assert (=> b!1521175 m!1404303))

(declare-fun m!1404305 () Bool)

(assert (=> b!1521179 m!1404305))

(assert (=> b!1521179 m!1404305))

(declare-fun m!1404307 () Bool)

(assert (=> b!1521179 m!1404307))

(push 1)

(assert (not b!1521178))

(assert (not b!1521173))

(assert (not start!129580))

(assert (not b!1521177))

(assert (not b!1521175))

(assert (not b!1521179))

(assert (not b!1521174))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

