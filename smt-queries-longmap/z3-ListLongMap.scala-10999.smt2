; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128774 () Bool)

(assert start!128774)

(declare-fun b!1509270 () Bool)

(declare-fun res!1029380 () Bool)

(declare-fun e!842937 () Bool)

(assert (=> b!1509270 (=> (not res!1029380) (not e!842937))))

(declare-datatypes ((array!100630 0))(
  ( (array!100631 (arr!48553 (Array (_ BitVec 32) (_ BitVec 64))) (size!49105 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100630)

(declare-datatypes ((List!35114 0))(
  ( (Nil!35111) (Cons!35110 (h!36523 (_ BitVec 64)) (t!49800 List!35114)) )
))
(declare-fun arrayNoDuplicates!0 (array!100630 (_ BitVec 32) List!35114) Bool)

(assert (=> b!1509270 (= res!1029380 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35111))))

(declare-fun b!1509271 () Bool)

(declare-fun res!1029389 () Bool)

(declare-fun e!842940 () Bool)

(assert (=> b!1509271 (=> (not res!1029389) (not e!842940))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12747 0))(
  ( (MissingZero!12747 (index!53383 (_ BitVec 32))) (Found!12747 (index!53384 (_ BitVec 32))) (Intermediate!12747 (undefined!13559 Bool) (index!53385 (_ BitVec 32)) (x!135139 (_ BitVec 32))) (Undefined!12747) (MissingVacant!12747 (index!53386 (_ BitVec 32))) )
))
(declare-fun lt!654650 () SeekEntryResult!12747)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100630 (_ BitVec 32)) SeekEntryResult!12747)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509271 (= res!1029389 (= lt!654650 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48553 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48553 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100631 (store (arr!48553 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49105 a!2804)) mask!2512)))))

(declare-fun b!1509272 () Bool)

(declare-fun res!1029386 () Bool)

(assert (=> b!1509272 (=> (not res!1029386) (not e!842937))))

(assert (=> b!1509272 (= res!1029386 (and (= (size!49105 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49105 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49105 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509273 () Bool)

(declare-fun res!1029387 () Bool)

(assert (=> b!1509273 (=> (not res!1029387) (not e!842940))))

(declare-fun lt!654651 () SeekEntryResult!12747)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1509273 (= res!1029387 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48553 a!2804) j!70) a!2804 mask!2512) lt!654651))))

(declare-fun b!1509274 () Bool)

(declare-fun res!1029379 () Bool)

(assert (=> b!1509274 (=> (not res!1029379) (not e!842937))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509274 (= res!1029379 (validKeyInArray!0 (select (arr!48553 a!2804) i!961)))))

(declare-fun b!1509275 () Bool)

(declare-fun res!1029388 () Bool)

(assert (=> b!1509275 (=> (not res!1029388) (not e!842937))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100630 (_ BitVec 32)) Bool)

(assert (=> b!1509275 (= res!1029388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509276 () Bool)

(declare-fun e!842938 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100630 (_ BitVec 32)) SeekEntryResult!12747)

(assert (=> b!1509276 (= e!842938 (= (seekEntry!0 (select (arr!48553 a!2804) j!70) a!2804 mask!2512) (Found!12747 j!70)))))

(declare-fun b!1509277 () Bool)

(declare-fun res!1029382 () Bool)

(assert (=> b!1509277 (=> (not res!1029382) (not e!842937))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1509277 (= res!1029382 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49105 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49105 a!2804))))))

(declare-fun b!1509278 () Bool)

(declare-fun res!1029384 () Bool)

(assert (=> b!1509278 (=> (not res!1029384) (not e!842937))))

(assert (=> b!1509278 (= res!1029384 (validKeyInArray!0 (select (arr!48553 a!2804) j!70)))))

(declare-fun res!1029381 () Bool)

(assert (=> start!128774 (=> (not res!1029381) (not e!842937))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128774 (= res!1029381 (validMask!0 mask!2512))))

(assert (=> start!128774 e!842937))

(assert (=> start!128774 true))

(declare-fun array_inv!37786 (array!100630) Bool)

(assert (=> start!128774 (array_inv!37786 a!2804)))

(declare-fun b!1509279 () Bool)

(assert (=> b!1509279 (= e!842940 (not true))))

(assert (=> b!1509279 e!842938))

(declare-fun res!1029385 () Bool)

(assert (=> b!1509279 (=> (not res!1029385) (not e!842938))))

(assert (=> b!1509279 (= res!1029385 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50201 0))(
  ( (Unit!50202) )
))
(declare-fun lt!654649 () Unit!50201)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100630 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50201)

(assert (=> b!1509279 (= lt!654649 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1509280 () Bool)

(assert (=> b!1509280 (= e!842937 e!842940)))

(declare-fun res!1029383 () Bool)

(assert (=> b!1509280 (=> (not res!1029383) (not e!842940))))

(assert (=> b!1509280 (= res!1029383 (= lt!654650 lt!654651))))

(assert (=> b!1509280 (= lt!654651 (Intermediate!12747 false resIndex!21 resX!21))))

(assert (=> b!1509280 (= lt!654650 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48553 a!2804) j!70) mask!2512) (select (arr!48553 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!128774 res!1029381) b!1509272))

(assert (= (and b!1509272 res!1029386) b!1509274))

(assert (= (and b!1509274 res!1029379) b!1509278))

(assert (= (and b!1509278 res!1029384) b!1509275))

(assert (= (and b!1509275 res!1029388) b!1509270))

(assert (= (and b!1509270 res!1029380) b!1509277))

(assert (= (and b!1509277 res!1029382) b!1509280))

(assert (= (and b!1509280 res!1029383) b!1509273))

(assert (= (and b!1509273 res!1029387) b!1509271))

(assert (= (and b!1509271 res!1029389) b!1509279))

(assert (= (and b!1509279 res!1029385) b!1509276))

(declare-fun m!1391201 () Bool)

(assert (=> b!1509273 m!1391201))

(assert (=> b!1509273 m!1391201))

(declare-fun m!1391203 () Bool)

(assert (=> b!1509273 m!1391203))

(declare-fun m!1391205 () Bool)

(assert (=> b!1509279 m!1391205))

(declare-fun m!1391207 () Bool)

(assert (=> b!1509279 m!1391207))

(declare-fun m!1391209 () Bool)

(assert (=> b!1509270 m!1391209))

(declare-fun m!1391211 () Bool)

(assert (=> b!1509271 m!1391211))

(declare-fun m!1391213 () Bool)

(assert (=> b!1509271 m!1391213))

(assert (=> b!1509271 m!1391213))

(declare-fun m!1391215 () Bool)

(assert (=> b!1509271 m!1391215))

(assert (=> b!1509271 m!1391215))

(assert (=> b!1509271 m!1391213))

(declare-fun m!1391217 () Bool)

(assert (=> b!1509271 m!1391217))

(assert (=> b!1509280 m!1391201))

(assert (=> b!1509280 m!1391201))

(declare-fun m!1391219 () Bool)

(assert (=> b!1509280 m!1391219))

(assert (=> b!1509280 m!1391219))

(assert (=> b!1509280 m!1391201))

(declare-fun m!1391221 () Bool)

(assert (=> b!1509280 m!1391221))

(declare-fun m!1391223 () Bool)

(assert (=> start!128774 m!1391223))

(declare-fun m!1391225 () Bool)

(assert (=> start!128774 m!1391225))

(declare-fun m!1391227 () Bool)

(assert (=> b!1509275 m!1391227))

(assert (=> b!1509278 m!1391201))

(assert (=> b!1509278 m!1391201))

(declare-fun m!1391229 () Bool)

(assert (=> b!1509278 m!1391229))

(assert (=> b!1509276 m!1391201))

(assert (=> b!1509276 m!1391201))

(declare-fun m!1391231 () Bool)

(assert (=> b!1509276 m!1391231))

(declare-fun m!1391233 () Bool)

(assert (=> b!1509274 m!1391233))

(assert (=> b!1509274 m!1391233))

(declare-fun m!1391235 () Bool)

(assert (=> b!1509274 m!1391235))

(check-sat (not b!1509279) (not b!1509278) (not b!1509280) (not b!1509274) (not b!1509271) (not b!1509270) (not b!1509275) (not start!128774) (not b!1509273) (not b!1509276))
(check-sat)
