; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130074 () Bool)

(assert start!130074)

(declare-fun b!1527177 () Bool)

(declare-fun res!1045405 () Bool)

(declare-fun e!851161 () Bool)

(assert (=> b!1527177 (=> (not res!1045405) (not e!851161))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101485 0))(
  ( (array!101486 (arr!48970 (Array (_ BitVec 32) (_ BitVec 64))) (size!49522 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101485)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1527177 (= res!1045405 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49522 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49522 a!2804))))))

(declare-fun b!1527178 () Bool)

(declare-fun res!1045404 () Bool)

(assert (=> b!1527178 (=> (not res!1045404) (not e!851161))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1527178 (= res!1045404 (validKeyInArray!0 (select (arr!48970 a!2804) j!70)))))

(declare-fun b!1527179 () Bool)

(declare-fun res!1045397 () Bool)

(assert (=> b!1527179 (=> (not res!1045397) (not e!851161))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101485 (_ BitVec 32)) Bool)

(assert (=> b!1527179 (= res!1045397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1527180 () Bool)

(declare-fun e!851160 () Bool)

(assert (=> b!1527180 (= e!851160 (not true))))

(declare-fun e!851162 () Bool)

(assert (=> b!1527180 e!851162))

(declare-fun res!1045396 () Bool)

(assert (=> b!1527180 (=> (not res!1045396) (not e!851162))))

(assert (=> b!1527180 (= res!1045396 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50939 0))(
  ( (Unit!50940) )
))
(declare-fun lt!661163 () Unit!50939)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101485 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50939)

(assert (=> b!1527180 (= lt!661163 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1527181 () Bool)

(declare-fun e!851158 () Bool)

(assert (=> b!1527181 (= e!851161 e!851158)))

(declare-fun res!1045398 () Bool)

(assert (=> b!1527181 (=> (not res!1045398) (not e!851158))))

(declare-datatypes ((SeekEntryResult!13158 0))(
  ( (MissingZero!13158 (index!55027 (_ BitVec 32))) (Found!13158 (index!55028 (_ BitVec 32))) (Intermediate!13158 (undefined!13970 Bool) (index!55029 (_ BitVec 32)) (x!136719 (_ BitVec 32))) (Undefined!13158) (MissingVacant!13158 (index!55030 (_ BitVec 32))) )
))
(declare-fun lt!661167 () SeekEntryResult!13158)

(declare-fun lt!661166 () SeekEntryResult!13158)

(assert (=> b!1527181 (= res!1045398 (= lt!661167 lt!661166))))

(assert (=> b!1527181 (= lt!661166 (Intermediate!13158 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101485 (_ BitVec 32)) SeekEntryResult!13158)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1527181 (= lt!661167 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48970 a!2804) j!70) mask!2512) (select (arr!48970 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527182 () Bool)

(assert (=> b!1527182 (= e!851158 e!851160)))

(declare-fun res!1045399 () Bool)

(assert (=> b!1527182 (=> (not res!1045399) (not e!851160))))

(declare-fun lt!661165 () array!101485)

(declare-fun lt!661164 () (_ BitVec 64))

(assert (=> b!1527182 (= res!1045399 (= lt!661167 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661164 mask!2512) lt!661164 lt!661165 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1527182 (= lt!661164 (select (store (arr!48970 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1527182 (= lt!661165 (array!101486 (store (arr!48970 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49522 a!2804)))))

(declare-fun b!1527183 () Bool)

(declare-fun res!1045406 () Bool)

(assert (=> b!1527183 (=> (not res!1045406) (not e!851161))))

(assert (=> b!1527183 (= res!1045406 (and (= (size!49522 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49522 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49522 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1527184 () Bool)

(declare-fun res!1045402 () Bool)

(assert (=> b!1527184 (=> (not res!1045402) (not e!851161))))

(assert (=> b!1527184 (= res!1045402 (validKeyInArray!0 (select (arr!48970 a!2804) i!961)))))

(declare-fun b!1527185 () Bool)

(declare-fun res!1045408 () Bool)

(assert (=> b!1527185 (=> (not res!1045408) (not e!851158))))

(assert (=> b!1527185 (= res!1045408 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48970 a!2804) j!70) a!2804 mask!2512) lt!661166))))

(declare-fun b!1527186 () Bool)

(declare-fun e!851163 () Bool)

(declare-fun e!851164 () Bool)

(assert (=> b!1527186 (= e!851163 e!851164)))

(declare-fun res!1045407 () Bool)

(assert (=> b!1527186 (=> (not res!1045407) (not e!851164))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101485 (_ BitVec 32)) SeekEntryResult!13158)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101485 (_ BitVec 32)) SeekEntryResult!13158)

(assert (=> b!1527186 (= res!1045407 (= (seekEntryOrOpen!0 (select (arr!48970 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48970 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun res!1045403 () Bool)

(assert (=> start!130074 (=> (not res!1045403) (not e!851161))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130074 (= res!1045403 (validMask!0 mask!2512))))

(assert (=> start!130074 e!851161))

(assert (=> start!130074 true))

(declare-fun array_inv!38203 (array!101485) Bool)

(assert (=> start!130074 (array_inv!38203 a!2804)))

(declare-fun b!1527187 () Bool)

(declare-fun res!1045400 () Bool)

(assert (=> b!1527187 (=> (not res!1045400) (not e!851161))))

(declare-datatypes ((List!35531 0))(
  ( (Nil!35528) (Cons!35527 (h!36961 (_ BitVec 64)) (t!50217 List!35531)) )
))
(declare-fun arrayNoDuplicates!0 (array!101485 (_ BitVec 32) List!35531) Bool)

(assert (=> b!1527187 (= res!1045400 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35528))))

(declare-fun b!1527188 () Bool)

(declare-fun res!1045395 () Bool)

(assert (=> b!1527188 (=> (not res!1045395) (not e!851162))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101485 (_ BitVec 32)) SeekEntryResult!13158)

(assert (=> b!1527188 (= res!1045395 (= (seekEntry!0 (select (arr!48970 a!2804) j!70) a!2804 mask!2512) (Found!13158 j!70)))))

(declare-fun b!1527189 () Bool)

(assert (=> b!1527189 (= e!851162 e!851163)))

(declare-fun res!1045401 () Bool)

(assert (=> b!1527189 (=> res!1045401 e!851163)))

(assert (=> b!1527189 (= res!1045401 (or (not (= (select (arr!48970 a!2804) j!70) lt!661164)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48970 a!2804) index!487) (select (arr!48970 a!2804) j!70)) (not (= (select (arr!48970 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1527190 () Bool)

(assert (=> b!1527190 (= e!851164 (= (seekEntryOrOpen!0 lt!661164 lt!661165 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661164 lt!661165 mask!2512)))))

(assert (= (and start!130074 res!1045403) b!1527183))

(assert (= (and b!1527183 res!1045406) b!1527184))

(assert (= (and b!1527184 res!1045402) b!1527178))

(assert (= (and b!1527178 res!1045404) b!1527179))

(assert (= (and b!1527179 res!1045397) b!1527187))

(assert (= (and b!1527187 res!1045400) b!1527177))

(assert (= (and b!1527177 res!1045405) b!1527181))

(assert (= (and b!1527181 res!1045398) b!1527185))

(assert (= (and b!1527185 res!1045408) b!1527182))

(assert (= (and b!1527182 res!1045399) b!1527180))

(assert (= (and b!1527180 res!1045396) b!1527188))

(assert (= (and b!1527188 res!1045395) b!1527189))

(assert (= (and b!1527189 (not res!1045401)) b!1527186))

(assert (= (and b!1527186 res!1045407) b!1527190))

(declare-fun m!1409501 () Bool)

(assert (=> b!1527189 m!1409501))

(declare-fun m!1409503 () Bool)

(assert (=> b!1527189 m!1409503))

(assert (=> b!1527178 m!1409501))

(assert (=> b!1527178 m!1409501))

(declare-fun m!1409505 () Bool)

(assert (=> b!1527178 m!1409505))

(declare-fun m!1409507 () Bool)

(assert (=> b!1527180 m!1409507))

(declare-fun m!1409509 () Bool)

(assert (=> b!1527180 m!1409509))

(assert (=> b!1527188 m!1409501))

(assert (=> b!1527188 m!1409501))

(declare-fun m!1409511 () Bool)

(assert (=> b!1527188 m!1409511))

(assert (=> b!1527186 m!1409501))

(assert (=> b!1527186 m!1409501))

(declare-fun m!1409513 () Bool)

(assert (=> b!1527186 m!1409513))

(assert (=> b!1527186 m!1409501))

(declare-fun m!1409515 () Bool)

(assert (=> b!1527186 m!1409515))

(declare-fun m!1409517 () Bool)

(assert (=> b!1527184 m!1409517))

(assert (=> b!1527184 m!1409517))

(declare-fun m!1409519 () Bool)

(assert (=> b!1527184 m!1409519))

(declare-fun m!1409521 () Bool)

(assert (=> b!1527187 m!1409521))

(assert (=> b!1527185 m!1409501))

(assert (=> b!1527185 m!1409501))

(declare-fun m!1409523 () Bool)

(assert (=> b!1527185 m!1409523))

(declare-fun m!1409525 () Bool)

(assert (=> b!1527182 m!1409525))

(assert (=> b!1527182 m!1409525))

(declare-fun m!1409527 () Bool)

(assert (=> b!1527182 m!1409527))

(declare-fun m!1409529 () Bool)

(assert (=> b!1527182 m!1409529))

(declare-fun m!1409531 () Bool)

(assert (=> b!1527182 m!1409531))

(assert (=> b!1527181 m!1409501))

(assert (=> b!1527181 m!1409501))

(declare-fun m!1409533 () Bool)

(assert (=> b!1527181 m!1409533))

(assert (=> b!1527181 m!1409533))

(assert (=> b!1527181 m!1409501))

(declare-fun m!1409535 () Bool)

(assert (=> b!1527181 m!1409535))

(declare-fun m!1409537 () Bool)

(assert (=> b!1527179 m!1409537))

(declare-fun m!1409539 () Bool)

(assert (=> start!130074 m!1409539))

(declare-fun m!1409541 () Bool)

(assert (=> start!130074 m!1409541))

(declare-fun m!1409543 () Bool)

(assert (=> b!1527190 m!1409543))

(declare-fun m!1409545 () Bool)

(assert (=> b!1527190 m!1409545))

(check-sat (not b!1527182) (not b!1527180) (not b!1527187) (not b!1527178) (not b!1527181) (not b!1527184) (not b!1527179) (not b!1527185) (not b!1527190) (not start!130074) (not b!1527186) (not b!1527188))
(check-sat)
