; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129302 () Bool)

(assert start!129302)

(declare-fun b!1514497 () Bool)

(declare-fun res!1033231 () Bool)

(declare-fun e!845433 () Bool)

(assert (=> b!1514497 (=> (not res!1033231) (not e!845433))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100972 0))(
  ( (array!100973 (arr!48718 (Array (_ BitVec 32) (_ BitVec 64))) (size!49269 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100972)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1514497 (= res!1033231 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49269 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49269 a!2804))))))

(declare-fun b!1514498 () Bool)

(declare-fun res!1033233 () Bool)

(assert (=> b!1514498 (=> (not res!1033233) (not e!845433))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514498 (= res!1033233 (validKeyInArray!0 (select (arr!48718 a!2804) j!70)))))

(declare-fun e!845435 () Bool)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun b!1514500 () Bool)

(declare-datatypes ((SeekEntryResult!12782 0))(
  ( (MissingZero!12782 (index!53523 (_ BitVec 32))) (Found!12782 (index!53524 (_ BitVec 32))) (Intermediate!12782 (undefined!13594 Bool) (index!53525 (_ BitVec 32)) (x!135449 (_ BitVec 32))) (Undefined!12782) (MissingVacant!12782 (index!53526 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100972 (_ BitVec 32)) SeekEntryResult!12782)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100972 (_ BitVec 32)) SeekEntryResult!12782)

(assert (=> b!1514500 (= e!845435 (= (seekEntryOrOpen!0 (select (arr!48718 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48718 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514501 () Bool)

(declare-fun res!1033229 () Bool)

(declare-fun e!845436 () Bool)

(assert (=> b!1514501 (=> (not res!1033229) (not e!845436))))

(declare-fun lt!656390 () SeekEntryResult!12782)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100972 (_ BitVec 32)) SeekEntryResult!12782)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514501 (= res!1033229 (= lt!656390 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48718 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48718 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100973 (store (arr!48718 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49269 a!2804)) mask!2512)))))

(declare-fun b!1514502 () Bool)

(assert (=> b!1514502 (= e!845436 (not true))))

(declare-fun e!845434 () Bool)

(assert (=> b!1514502 e!845434))

(declare-fun res!1033227 () Bool)

(assert (=> b!1514502 (=> (not res!1033227) (not e!845434))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100972 (_ BitVec 32)) Bool)

(assert (=> b!1514502 (= res!1033227 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50467 0))(
  ( (Unit!50468) )
))
(declare-fun lt!656392 () Unit!50467)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100972 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50467)

(assert (=> b!1514502 (= lt!656392 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514503 () Bool)

(declare-fun res!1033230 () Bool)

(assert (=> b!1514503 (=> (not res!1033230) (not e!845433))))

(assert (=> b!1514503 (= res!1033230 (and (= (size!49269 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49269 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49269 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1514504 () Bool)

(assert (=> b!1514504 (= e!845433 e!845436)))

(declare-fun res!1033232 () Bool)

(assert (=> b!1514504 (=> (not res!1033232) (not e!845436))))

(declare-fun lt!656391 () SeekEntryResult!12782)

(assert (=> b!1514504 (= res!1033232 (= lt!656390 lt!656391))))

(assert (=> b!1514504 (= lt!656391 (Intermediate!12782 false resIndex!21 resX!21))))

(assert (=> b!1514504 (= lt!656390 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48718 a!2804) j!70) mask!2512) (select (arr!48718 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514505 () Bool)

(declare-fun res!1033223 () Bool)

(assert (=> b!1514505 (=> (not res!1033223) (not e!845436))))

(assert (=> b!1514505 (= res!1033223 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48718 a!2804) j!70) a!2804 mask!2512) lt!656391))))

(declare-fun b!1514506 () Bool)

(assert (=> b!1514506 (= e!845434 e!845435)))

(declare-fun res!1033235 () Bool)

(assert (=> b!1514506 (=> res!1033235 e!845435)))

(assert (=> b!1514506 (= res!1033235 (or (not (= (select (arr!48718 a!2804) j!70) (select (store (arr!48718 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48718 a!2804) index!487) (select (arr!48718 a!2804) j!70)) (not (= (select (arr!48718 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1514507 () Bool)

(declare-fun res!1033225 () Bool)

(assert (=> b!1514507 (=> (not res!1033225) (not e!845433))))

(assert (=> b!1514507 (= res!1033225 (validKeyInArray!0 (select (arr!48718 a!2804) i!961)))))

(declare-fun res!1033224 () Bool)

(assert (=> start!129302 (=> (not res!1033224) (not e!845433))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129302 (= res!1033224 (validMask!0 mask!2512))))

(assert (=> start!129302 e!845433))

(assert (=> start!129302 true))

(declare-fun array_inv!37999 (array!100972) Bool)

(assert (=> start!129302 (array_inv!37999 a!2804)))

(declare-fun b!1514499 () Bool)

(declare-fun res!1033228 () Bool)

(assert (=> b!1514499 (=> (not res!1033228) (not e!845433))))

(assert (=> b!1514499 (= res!1033228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514508 () Bool)

(declare-fun res!1033226 () Bool)

(assert (=> b!1514508 (=> (not res!1033226) (not e!845433))))

(declare-datatypes ((List!35188 0))(
  ( (Nil!35185) (Cons!35184 (h!36611 (_ BitVec 64)) (t!49874 List!35188)) )
))
(declare-fun arrayNoDuplicates!0 (array!100972 (_ BitVec 32) List!35188) Bool)

(assert (=> b!1514508 (= res!1033226 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35185))))

(declare-fun b!1514509 () Bool)

(declare-fun res!1033234 () Bool)

(assert (=> b!1514509 (=> (not res!1033234) (not e!845434))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100972 (_ BitVec 32)) SeekEntryResult!12782)

(assert (=> b!1514509 (= res!1033234 (= (seekEntry!0 (select (arr!48718 a!2804) j!70) a!2804 mask!2512) (Found!12782 j!70)))))

(assert (= (and start!129302 res!1033224) b!1514503))

(assert (= (and b!1514503 res!1033230) b!1514507))

(assert (= (and b!1514507 res!1033225) b!1514498))

(assert (= (and b!1514498 res!1033233) b!1514499))

(assert (= (and b!1514499 res!1033228) b!1514508))

(assert (= (and b!1514508 res!1033226) b!1514497))

(assert (= (and b!1514497 res!1033231) b!1514504))

(assert (= (and b!1514504 res!1033232) b!1514505))

(assert (= (and b!1514505 res!1033223) b!1514501))

(assert (= (and b!1514501 res!1033229) b!1514502))

(assert (= (and b!1514502 res!1033227) b!1514509))

(assert (= (and b!1514509 res!1033234) b!1514506))

(assert (= (and b!1514506 (not res!1033235)) b!1514500))

(declare-fun m!1397247 () Bool)

(assert (=> b!1514505 m!1397247))

(assert (=> b!1514505 m!1397247))

(declare-fun m!1397249 () Bool)

(assert (=> b!1514505 m!1397249))

(assert (=> b!1514500 m!1397247))

(assert (=> b!1514500 m!1397247))

(declare-fun m!1397251 () Bool)

(assert (=> b!1514500 m!1397251))

(assert (=> b!1514500 m!1397247))

(declare-fun m!1397253 () Bool)

(assert (=> b!1514500 m!1397253))

(declare-fun m!1397255 () Bool)

(assert (=> b!1514502 m!1397255))

(declare-fun m!1397257 () Bool)

(assert (=> b!1514502 m!1397257))

(declare-fun m!1397259 () Bool)

(assert (=> b!1514499 m!1397259))

(assert (=> b!1514509 m!1397247))

(assert (=> b!1514509 m!1397247))

(declare-fun m!1397261 () Bool)

(assert (=> b!1514509 m!1397261))

(assert (=> b!1514506 m!1397247))

(declare-fun m!1397263 () Bool)

(assert (=> b!1514506 m!1397263))

(declare-fun m!1397265 () Bool)

(assert (=> b!1514506 m!1397265))

(declare-fun m!1397267 () Bool)

(assert (=> b!1514506 m!1397267))

(assert (=> b!1514501 m!1397263))

(assert (=> b!1514501 m!1397265))

(assert (=> b!1514501 m!1397265))

(declare-fun m!1397269 () Bool)

(assert (=> b!1514501 m!1397269))

(assert (=> b!1514501 m!1397269))

(assert (=> b!1514501 m!1397265))

(declare-fun m!1397271 () Bool)

(assert (=> b!1514501 m!1397271))

(assert (=> b!1514498 m!1397247))

(assert (=> b!1514498 m!1397247))

(declare-fun m!1397273 () Bool)

(assert (=> b!1514498 m!1397273))

(declare-fun m!1397275 () Bool)

(assert (=> b!1514507 m!1397275))

(assert (=> b!1514507 m!1397275))

(declare-fun m!1397277 () Bool)

(assert (=> b!1514507 m!1397277))

(assert (=> b!1514504 m!1397247))

(assert (=> b!1514504 m!1397247))

(declare-fun m!1397279 () Bool)

(assert (=> b!1514504 m!1397279))

(assert (=> b!1514504 m!1397279))

(assert (=> b!1514504 m!1397247))

(declare-fun m!1397281 () Bool)

(assert (=> b!1514504 m!1397281))

(declare-fun m!1397283 () Bool)

(assert (=> b!1514508 m!1397283))

(declare-fun m!1397285 () Bool)

(assert (=> start!129302 m!1397285))

(declare-fun m!1397287 () Bool)

(assert (=> start!129302 m!1397287))

(check-sat (not b!1514505) (not b!1514500) (not b!1514507) (not b!1514498) (not b!1514499) (not b!1514504) (not b!1514501) (not b!1514509) (not b!1514508) (not start!129302) (not b!1514502))
(check-sat)
