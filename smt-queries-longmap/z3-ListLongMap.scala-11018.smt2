; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128888 () Bool)

(assert start!128888)

(declare-fun b!1511160 () Bool)

(declare-fun res!1031271 () Bool)

(declare-fun e!843630 () Bool)

(assert (=> b!1511160 (=> (not res!1031271) (not e!843630))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100744 0))(
  ( (array!100745 (arr!48610 (Array (_ BitVec 32) (_ BitVec 64))) (size!49162 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100744)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1511160 (= res!1031271 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49162 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49162 a!2804))))))

(declare-fun b!1511161 () Bool)

(declare-fun e!843633 () Bool)

(assert (=> b!1511161 (= e!843630 e!843633)))

(declare-fun res!1031277 () Bool)

(assert (=> b!1511161 (=> (not res!1031277) (not e!843633))))

(declare-datatypes ((SeekEntryResult!12804 0))(
  ( (MissingZero!12804 (index!53611 (_ BitVec 32))) (Found!12804 (index!53612 (_ BitVec 32))) (Intermediate!12804 (undefined!13616 Bool) (index!53613 (_ BitVec 32)) (x!135348 (_ BitVec 32))) (Undefined!12804) (MissingVacant!12804 (index!53614 (_ BitVec 32))) )
))
(declare-fun lt!655163 () SeekEntryResult!12804)

(declare-fun lt!655162 () SeekEntryResult!12804)

(assert (=> b!1511161 (= res!1031277 (= lt!655163 lt!655162))))

(assert (=> b!1511161 (= lt!655162 (Intermediate!12804 false resIndex!21 resX!21))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100744 (_ BitVec 32)) SeekEntryResult!12804)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511161 (= lt!655163 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48610 a!2804) j!70) mask!2512) (select (arr!48610 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511162 () Bool)

(declare-fun res!1031279 () Bool)

(assert (=> b!1511162 (=> (not res!1031279) (not e!843630))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1511162 (= res!1031279 (and (= (size!49162 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49162 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49162 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1031274 () Bool)

(assert (=> start!128888 (=> (not res!1031274) (not e!843630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128888 (= res!1031274 (validMask!0 mask!2512))))

(assert (=> start!128888 e!843630))

(assert (=> start!128888 true))

(declare-fun array_inv!37843 (array!100744) Bool)

(assert (=> start!128888 (array_inv!37843 a!2804)))

(declare-fun b!1511163 () Bool)

(assert (=> b!1511163 (= e!843633 (not true))))

(declare-fun e!843631 () Bool)

(assert (=> b!1511163 e!843631))

(declare-fun res!1031270 () Bool)

(assert (=> b!1511163 (=> (not res!1031270) (not e!843631))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100744 (_ BitVec 32)) Bool)

(assert (=> b!1511163 (= res!1031270 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50315 0))(
  ( (Unit!50316) )
))
(declare-fun lt!655164 () Unit!50315)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100744 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50315)

(assert (=> b!1511163 (= lt!655164 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511164 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100744 (_ BitVec 32)) SeekEntryResult!12804)

(assert (=> b!1511164 (= e!843631 (= (seekEntry!0 (select (arr!48610 a!2804) j!70) a!2804 mask!2512) (Found!12804 j!70)))))

(declare-fun b!1511165 () Bool)

(declare-fun res!1031278 () Bool)

(assert (=> b!1511165 (=> (not res!1031278) (not e!843633))))

(assert (=> b!1511165 (= res!1031278 (= lt!655163 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48610 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48610 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100745 (store (arr!48610 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49162 a!2804)) mask!2512)))))

(declare-fun b!1511166 () Bool)

(declare-fun res!1031273 () Bool)

(assert (=> b!1511166 (=> (not res!1031273) (not e!843630))))

(assert (=> b!1511166 (= res!1031273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511167 () Bool)

(declare-fun res!1031272 () Bool)

(assert (=> b!1511167 (=> (not res!1031272) (not e!843630))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511167 (= res!1031272 (validKeyInArray!0 (select (arr!48610 a!2804) i!961)))))

(declare-fun b!1511168 () Bool)

(declare-fun res!1031269 () Bool)

(assert (=> b!1511168 (=> (not res!1031269) (not e!843630))))

(assert (=> b!1511168 (= res!1031269 (validKeyInArray!0 (select (arr!48610 a!2804) j!70)))))

(declare-fun b!1511169 () Bool)

(declare-fun res!1031276 () Bool)

(assert (=> b!1511169 (=> (not res!1031276) (not e!843630))))

(declare-datatypes ((List!35171 0))(
  ( (Nil!35168) (Cons!35167 (h!36580 (_ BitVec 64)) (t!49857 List!35171)) )
))
(declare-fun arrayNoDuplicates!0 (array!100744 (_ BitVec 32) List!35171) Bool)

(assert (=> b!1511169 (= res!1031276 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35168))))

(declare-fun b!1511170 () Bool)

(declare-fun res!1031275 () Bool)

(assert (=> b!1511170 (=> (not res!1031275) (not e!843633))))

(assert (=> b!1511170 (= res!1031275 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48610 a!2804) j!70) a!2804 mask!2512) lt!655162))))

(assert (= (and start!128888 res!1031274) b!1511162))

(assert (= (and b!1511162 res!1031279) b!1511167))

(assert (= (and b!1511167 res!1031272) b!1511168))

(assert (= (and b!1511168 res!1031269) b!1511166))

(assert (= (and b!1511166 res!1031273) b!1511169))

(assert (= (and b!1511169 res!1031276) b!1511160))

(assert (= (and b!1511160 res!1031271) b!1511161))

(assert (= (and b!1511161 res!1031277) b!1511170))

(assert (= (and b!1511170 res!1031275) b!1511165))

(assert (= (and b!1511165 res!1031278) b!1511163))

(assert (= (and b!1511163 res!1031270) b!1511164))

(declare-fun m!1393295 () Bool)

(assert (=> b!1511164 m!1393295))

(assert (=> b!1511164 m!1393295))

(declare-fun m!1393297 () Bool)

(assert (=> b!1511164 m!1393297))

(assert (=> b!1511161 m!1393295))

(assert (=> b!1511161 m!1393295))

(declare-fun m!1393299 () Bool)

(assert (=> b!1511161 m!1393299))

(assert (=> b!1511161 m!1393299))

(assert (=> b!1511161 m!1393295))

(declare-fun m!1393301 () Bool)

(assert (=> b!1511161 m!1393301))

(declare-fun m!1393303 () Bool)

(assert (=> b!1511163 m!1393303))

(declare-fun m!1393305 () Bool)

(assert (=> b!1511163 m!1393305))

(declare-fun m!1393307 () Bool)

(assert (=> b!1511167 m!1393307))

(assert (=> b!1511167 m!1393307))

(declare-fun m!1393309 () Bool)

(assert (=> b!1511167 m!1393309))

(declare-fun m!1393311 () Bool)

(assert (=> b!1511165 m!1393311))

(declare-fun m!1393313 () Bool)

(assert (=> b!1511165 m!1393313))

(assert (=> b!1511165 m!1393313))

(declare-fun m!1393315 () Bool)

(assert (=> b!1511165 m!1393315))

(assert (=> b!1511165 m!1393315))

(assert (=> b!1511165 m!1393313))

(declare-fun m!1393317 () Bool)

(assert (=> b!1511165 m!1393317))

(declare-fun m!1393319 () Bool)

(assert (=> start!128888 m!1393319))

(declare-fun m!1393321 () Bool)

(assert (=> start!128888 m!1393321))

(declare-fun m!1393323 () Bool)

(assert (=> b!1511169 m!1393323))

(declare-fun m!1393325 () Bool)

(assert (=> b!1511166 m!1393325))

(assert (=> b!1511170 m!1393295))

(assert (=> b!1511170 m!1393295))

(declare-fun m!1393327 () Bool)

(assert (=> b!1511170 m!1393327))

(assert (=> b!1511168 m!1393295))

(assert (=> b!1511168 m!1393295))

(declare-fun m!1393329 () Bool)

(assert (=> b!1511168 m!1393329))

(check-sat (not b!1511164) (not b!1511163) (not b!1511169) (not b!1511167) (not b!1511161) (not b!1511168) (not start!128888) (not b!1511165) (not b!1511170) (not b!1511166))
(check-sat)
