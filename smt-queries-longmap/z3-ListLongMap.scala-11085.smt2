; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129290 () Bool)

(assert start!129290)

(declare-fun b!1519161 () Bool)

(declare-fun res!1039278 () Bool)

(declare-fun e!847392 () Bool)

(assert (=> b!1519161 (=> (not res!1039278) (not e!847392))))

(declare-datatypes ((array!101146 0))(
  ( (array!101147 (arr!48811 (Array (_ BitVec 32) (_ BitVec 64))) (size!49363 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101146)

(declare-datatypes ((List!35372 0))(
  ( (Nil!35369) (Cons!35368 (h!36781 (_ BitVec 64)) (t!50058 List!35372)) )
))
(declare-fun arrayNoDuplicates!0 (array!101146 (_ BitVec 32) List!35372) Bool)

(assert (=> b!1519161 (= res!1039278 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35369))))

(declare-fun b!1519162 () Bool)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun e!847394 () Bool)

(assert (=> b!1519162 (= e!847394 (not (= (select (arr!48811 a!2804) j!70) (select (store (arr!48811 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))))

(declare-fun e!847393 () Bool)

(assert (=> b!1519162 e!847393))

(declare-fun res!1039273 () Bool)

(assert (=> b!1519162 (=> (not res!1039273) (not e!847393))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101146 (_ BitVec 32)) Bool)

(assert (=> b!1519162 (= res!1039273 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50717 0))(
  ( (Unit!50718) )
))
(declare-fun lt!658394 () Unit!50717)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101146 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50717)

(assert (=> b!1519162 (= lt!658394 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1519163 () Bool)

(declare-fun res!1039274 () Bool)

(assert (=> b!1519163 (=> (not res!1039274) (not e!847392))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1519163 (= res!1039274 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49363 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49363 a!2804))))))

(declare-fun b!1519164 () Bool)

(declare-fun res!1039270 () Bool)

(assert (=> b!1519164 (=> (not res!1039270) (not e!847394))))

(declare-datatypes ((SeekEntryResult!13005 0))(
  ( (MissingZero!13005 (index!54415 (_ BitVec 32))) (Found!13005 (index!54416 (_ BitVec 32))) (Intermediate!13005 (undefined!13817 Bool) (index!54417 (_ BitVec 32)) (x!136085 (_ BitVec 32))) (Undefined!13005) (MissingVacant!13005 (index!54418 (_ BitVec 32))) )
))
(declare-fun lt!658393 () SeekEntryResult!13005)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101146 (_ BitVec 32)) SeekEntryResult!13005)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519164 (= res!1039270 (= lt!658393 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48811 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48811 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101147 (store (arr!48811 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49363 a!2804)) mask!2512)))))

(declare-fun b!1519165 () Bool)

(declare-fun res!1039280 () Bool)

(assert (=> b!1519165 (=> (not res!1039280) (not e!847392))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1519165 (= res!1039280 (validKeyInArray!0 (select (arr!48811 a!2804) i!961)))))

(declare-fun res!1039275 () Bool)

(assert (=> start!129290 (=> (not res!1039275) (not e!847392))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129290 (= res!1039275 (validMask!0 mask!2512))))

(assert (=> start!129290 e!847392))

(assert (=> start!129290 true))

(declare-fun array_inv!38044 (array!101146) Bool)

(assert (=> start!129290 (array_inv!38044 a!2804)))

(declare-fun b!1519166 () Bool)

(declare-fun res!1039277 () Bool)

(assert (=> b!1519166 (=> (not res!1039277) (not e!847394))))

(declare-fun lt!658395 () SeekEntryResult!13005)

(assert (=> b!1519166 (= res!1039277 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48811 a!2804) j!70) a!2804 mask!2512) lt!658395))))

(declare-fun b!1519167 () Bool)

(declare-fun res!1039271 () Bool)

(assert (=> b!1519167 (=> (not res!1039271) (not e!847392))))

(assert (=> b!1519167 (= res!1039271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1519168 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101146 (_ BitVec 32)) SeekEntryResult!13005)

(assert (=> b!1519168 (= e!847393 (= (seekEntry!0 (select (arr!48811 a!2804) j!70) a!2804 mask!2512) (Found!13005 j!70)))))

(declare-fun b!1519169 () Bool)

(declare-fun res!1039272 () Bool)

(assert (=> b!1519169 (=> (not res!1039272) (not e!847392))))

(assert (=> b!1519169 (= res!1039272 (and (= (size!49363 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49363 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49363 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1519170 () Bool)

(declare-fun res!1039276 () Bool)

(assert (=> b!1519170 (=> (not res!1039276) (not e!847392))))

(assert (=> b!1519170 (= res!1039276 (validKeyInArray!0 (select (arr!48811 a!2804) j!70)))))

(declare-fun b!1519171 () Bool)

(assert (=> b!1519171 (= e!847392 e!847394)))

(declare-fun res!1039279 () Bool)

(assert (=> b!1519171 (=> (not res!1039279) (not e!847394))))

(assert (=> b!1519171 (= res!1039279 (= lt!658393 lt!658395))))

(assert (=> b!1519171 (= lt!658395 (Intermediate!13005 false resIndex!21 resX!21))))

(assert (=> b!1519171 (= lt!658393 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48811 a!2804) j!70) mask!2512) (select (arr!48811 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129290 res!1039275) b!1519169))

(assert (= (and b!1519169 res!1039272) b!1519165))

(assert (= (and b!1519165 res!1039280) b!1519170))

(assert (= (and b!1519170 res!1039276) b!1519167))

(assert (= (and b!1519167 res!1039271) b!1519161))

(assert (= (and b!1519161 res!1039278) b!1519163))

(assert (= (and b!1519163 res!1039274) b!1519171))

(assert (= (and b!1519171 res!1039279) b!1519166))

(assert (= (and b!1519166 res!1039277) b!1519164))

(assert (= (and b!1519164 res!1039270) b!1519162))

(assert (= (and b!1519162 res!1039273) b!1519168))

(declare-fun m!1402007 () Bool)

(assert (=> b!1519161 m!1402007))

(declare-fun m!1402009 () Bool)

(assert (=> b!1519165 m!1402009))

(assert (=> b!1519165 m!1402009))

(declare-fun m!1402011 () Bool)

(assert (=> b!1519165 m!1402011))

(declare-fun m!1402013 () Bool)

(assert (=> b!1519168 m!1402013))

(assert (=> b!1519168 m!1402013))

(declare-fun m!1402015 () Bool)

(assert (=> b!1519168 m!1402015))

(assert (=> b!1519171 m!1402013))

(assert (=> b!1519171 m!1402013))

(declare-fun m!1402017 () Bool)

(assert (=> b!1519171 m!1402017))

(assert (=> b!1519171 m!1402017))

(assert (=> b!1519171 m!1402013))

(declare-fun m!1402019 () Bool)

(assert (=> b!1519171 m!1402019))

(declare-fun m!1402021 () Bool)

(assert (=> b!1519164 m!1402021))

(declare-fun m!1402023 () Bool)

(assert (=> b!1519164 m!1402023))

(assert (=> b!1519164 m!1402023))

(declare-fun m!1402025 () Bool)

(assert (=> b!1519164 m!1402025))

(assert (=> b!1519164 m!1402025))

(assert (=> b!1519164 m!1402023))

(declare-fun m!1402027 () Bool)

(assert (=> b!1519164 m!1402027))

(assert (=> b!1519166 m!1402013))

(assert (=> b!1519166 m!1402013))

(declare-fun m!1402029 () Bool)

(assert (=> b!1519166 m!1402029))

(assert (=> b!1519162 m!1402013))

(declare-fun m!1402031 () Bool)

(assert (=> b!1519162 m!1402031))

(assert (=> b!1519162 m!1402021))

(assert (=> b!1519162 m!1402023))

(declare-fun m!1402033 () Bool)

(assert (=> b!1519162 m!1402033))

(assert (=> b!1519170 m!1402013))

(assert (=> b!1519170 m!1402013))

(declare-fun m!1402035 () Bool)

(assert (=> b!1519170 m!1402035))

(declare-fun m!1402037 () Bool)

(assert (=> b!1519167 m!1402037))

(declare-fun m!1402039 () Bool)

(assert (=> start!129290 m!1402039))

(declare-fun m!1402041 () Bool)

(assert (=> start!129290 m!1402041))

(check-sat (not b!1519161) (not b!1519168) (not b!1519171) (not b!1519166) (not b!1519170) (not b!1519164) (not start!129290) (not b!1519162) (not b!1519167) (not b!1519165))
(check-sat)
