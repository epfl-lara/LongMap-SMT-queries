; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129350 () Bool)

(assert start!129350)

(declare-fun b!1515489 () Bool)

(declare-fun e!845918 () Bool)

(assert (=> b!1515489 (= e!845918 (not true))))

(declare-fun e!845914 () Bool)

(assert (=> b!1515489 e!845914))

(declare-fun res!1034218 () Bool)

(assert (=> b!1515489 (=> (not res!1034218) (not e!845914))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101020 0))(
  ( (array!101021 (arr!48742 (Array (_ BitVec 32) (_ BitVec 64))) (size!49293 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101020)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101020 (_ BitVec 32)) Bool)

(assert (=> b!1515489 (= res!1034218 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50515 0))(
  ( (Unit!50516) )
))
(declare-fun lt!656722 () Unit!50515)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101020 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50515)

(assert (=> b!1515489 (= lt!656722 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun lt!656720 () array!101020)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!656719 () (_ BitVec 64))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun e!845913 () Bool)

(declare-fun b!1515490 () Bool)

(declare-datatypes ((SeekEntryResult!12806 0))(
  ( (MissingZero!12806 (index!53619 (_ BitVec 32))) (Found!12806 (index!53620 (_ BitVec 32))) (Intermediate!12806 (undefined!13618 Bool) (index!53621 (_ BitVec 32)) (x!135537 (_ BitVec 32))) (Undefined!12806) (MissingVacant!12806 (index!53622 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101020 (_ BitVec 32)) SeekEntryResult!12806)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101020 (_ BitVec 32)) SeekEntryResult!12806)

(assert (=> b!1515490 (= e!845913 (= (seekEntryOrOpen!0 lt!656719 lt!656720 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656719 lt!656720 mask!2512)))))

(declare-fun b!1515491 () Bool)

(declare-fun res!1034220 () Bool)

(declare-fun e!845917 () Bool)

(assert (=> b!1515491 (=> (not res!1034220) (not e!845917))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515491 (= res!1034220 (validKeyInArray!0 (select (arr!48742 a!2804) j!70)))))

(declare-fun b!1515492 () Bool)

(declare-fun res!1034228 () Bool)

(assert (=> b!1515492 (=> (not res!1034228) (not e!845917))))

(declare-datatypes ((List!35212 0))(
  ( (Nil!35209) (Cons!35208 (h!36635 (_ BitVec 64)) (t!49898 List!35212)) )
))
(declare-fun arrayNoDuplicates!0 (array!101020 (_ BitVec 32) List!35212) Bool)

(assert (=> b!1515492 (= res!1034228 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35209))))

(declare-fun b!1515493 () Bool)

(declare-fun res!1034221 () Bool)

(assert (=> b!1515493 (=> (not res!1034221) (not e!845917))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1515493 (= res!1034221 (and (= (size!49293 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49293 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49293 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515494 () Bool)

(declare-fun e!845916 () Bool)

(assert (=> b!1515494 (= e!845916 e!845918)))

(declare-fun res!1034225 () Bool)

(assert (=> b!1515494 (=> (not res!1034225) (not e!845918))))

(declare-fun lt!656721 () SeekEntryResult!12806)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101020 (_ BitVec 32)) SeekEntryResult!12806)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515494 (= res!1034225 (= lt!656721 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656719 mask!2512) lt!656719 lt!656720 mask!2512)))))

(assert (=> b!1515494 (= lt!656719 (select (store (arr!48742 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515494 (= lt!656720 (array!101021 (store (arr!48742 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49293 a!2804)))))

(declare-fun b!1515495 () Bool)

(declare-fun e!845919 () Bool)

(assert (=> b!1515495 (= e!845919 e!845913)))

(declare-fun res!1034227 () Bool)

(assert (=> b!1515495 (=> (not res!1034227) (not e!845913))))

(assert (=> b!1515495 (= res!1034227 (= (seekEntryOrOpen!0 (select (arr!48742 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48742 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun res!1034226 () Bool)

(assert (=> start!129350 (=> (not res!1034226) (not e!845917))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129350 (= res!1034226 (validMask!0 mask!2512))))

(assert (=> start!129350 e!845917))

(assert (=> start!129350 true))

(declare-fun array_inv!38023 (array!101020) Bool)

(assert (=> start!129350 (array_inv!38023 a!2804)))

(declare-fun b!1515496 () Bool)

(assert (=> b!1515496 (= e!845917 e!845916)))

(declare-fun res!1034219 () Bool)

(assert (=> b!1515496 (=> (not res!1034219) (not e!845916))))

(declare-fun lt!656718 () SeekEntryResult!12806)

(assert (=> b!1515496 (= res!1034219 (= lt!656721 lt!656718))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1515496 (= lt!656718 (Intermediate!12806 false resIndex!21 resX!21))))

(assert (=> b!1515496 (= lt!656721 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48742 a!2804) j!70) mask!2512) (select (arr!48742 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515497 () Bool)

(declare-fun res!1034215 () Bool)

(assert (=> b!1515497 (=> (not res!1034215) (not e!845916))))

(assert (=> b!1515497 (= res!1034215 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48742 a!2804) j!70) a!2804 mask!2512) lt!656718))))

(declare-fun b!1515498 () Bool)

(declare-fun res!1034216 () Bool)

(assert (=> b!1515498 (=> (not res!1034216) (not e!845914))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101020 (_ BitVec 32)) SeekEntryResult!12806)

(assert (=> b!1515498 (= res!1034216 (= (seekEntry!0 (select (arr!48742 a!2804) j!70) a!2804 mask!2512) (Found!12806 j!70)))))

(declare-fun b!1515499 () Bool)

(declare-fun res!1034222 () Bool)

(assert (=> b!1515499 (=> (not res!1034222) (not e!845917))))

(assert (=> b!1515499 (= res!1034222 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49293 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49293 a!2804))))))

(declare-fun b!1515500 () Bool)

(declare-fun res!1034217 () Bool)

(assert (=> b!1515500 (=> (not res!1034217) (not e!845917))))

(assert (=> b!1515500 (= res!1034217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515501 () Bool)

(declare-fun res!1034223 () Bool)

(assert (=> b!1515501 (=> (not res!1034223) (not e!845917))))

(assert (=> b!1515501 (= res!1034223 (validKeyInArray!0 (select (arr!48742 a!2804) i!961)))))

(declare-fun b!1515502 () Bool)

(assert (=> b!1515502 (= e!845914 e!845919)))

(declare-fun res!1034224 () Bool)

(assert (=> b!1515502 (=> res!1034224 e!845919)))

(assert (=> b!1515502 (= res!1034224 (or (not (= (select (arr!48742 a!2804) j!70) lt!656719)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48742 a!2804) index!487) (select (arr!48742 a!2804) j!70)) (not (= (select (arr!48742 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!129350 res!1034226) b!1515493))

(assert (= (and b!1515493 res!1034221) b!1515501))

(assert (= (and b!1515501 res!1034223) b!1515491))

(assert (= (and b!1515491 res!1034220) b!1515500))

(assert (= (and b!1515500 res!1034217) b!1515492))

(assert (= (and b!1515492 res!1034228) b!1515499))

(assert (= (and b!1515499 res!1034222) b!1515496))

(assert (= (and b!1515496 res!1034219) b!1515497))

(assert (= (and b!1515497 res!1034215) b!1515494))

(assert (= (and b!1515494 res!1034225) b!1515489))

(assert (= (and b!1515489 res!1034218) b!1515498))

(assert (= (and b!1515498 res!1034216) b!1515502))

(assert (= (and b!1515502 (not res!1034224)) b!1515495))

(assert (= (and b!1515495 res!1034227) b!1515490))

(declare-fun m!1398333 () Bool)

(assert (=> b!1515500 m!1398333))

(declare-fun m!1398335 () Bool)

(assert (=> b!1515489 m!1398335))

(declare-fun m!1398337 () Bool)

(assert (=> b!1515489 m!1398337))

(declare-fun m!1398339 () Bool)

(assert (=> b!1515502 m!1398339))

(declare-fun m!1398341 () Bool)

(assert (=> b!1515502 m!1398341))

(declare-fun m!1398343 () Bool)

(assert (=> b!1515494 m!1398343))

(assert (=> b!1515494 m!1398343))

(declare-fun m!1398345 () Bool)

(assert (=> b!1515494 m!1398345))

(declare-fun m!1398347 () Bool)

(assert (=> b!1515494 m!1398347))

(declare-fun m!1398349 () Bool)

(assert (=> b!1515494 m!1398349))

(assert (=> b!1515495 m!1398339))

(assert (=> b!1515495 m!1398339))

(declare-fun m!1398351 () Bool)

(assert (=> b!1515495 m!1398351))

(assert (=> b!1515495 m!1398339))

(declare-fun m!1398353 () Bool)

(assert (=> b!1515495 m!1398353))

(declare-fun m!1398355 () Bool)

(assert (=> b!1515490 m!1398355))

(declare-fun m!1398357 () Bool)

(assert (=> b!1515490 m!1398357))

(declare-fun m!1398359 () Bool)

(assert (=> b!1515492 m!1398359))

(assert (=> b!1515496 m!1398339))

(assert (=> b!1515496 m!1398339))

(declare-fun m!1398361 () Bool)

(assert (=> b!1515496 m!1398361))

(assert (=> b!1515496 m!1398361))

(assert (=> b!1515496 m!1398339))

(declare-fun m!1398363 () Bool)

(assert (=> b!1515496 m!1398363))

(declare-fun m!1398365 () Bool)

(assert (=> b!1515501 m!1398365))

(assert (=> b!1515501 m!1398365))

(declare-fun m!1398367 () Bool)

(assert (=> b!1515501 m!1398367))

(assert (=> b!1515497 m!1398339))

(assert (=> b!1515497 m!1398339))

(declare-fun m!1398369 () Bool)

(assert (=> b!1515497 m!1398369))

(assert (=> b!1515498 m!1398339))

(assert (=> b!1515498 m!1398339))

(declare-fun m!1398371 () Bool)

(assert (=> b!1515498 m!1398371))

(declare-fun m!1398373 () Bool)

(assert (=> start!129350 m!1398373))

(declare-fun m!1398375 () Bool)

(assert (=> start!129350 m!1398375))

(assert (=> b!1515491 m!1398339))

(assert (=> b!1515491 m!1398339))

(declare-fun m!1398377 () Bool)

(assert (=> b!1515491 m!1398377))

(check-sat (not b!1515490) (not b!1515492) (not b!1515497) (not b!1515496) (not start!129350) (not b!1515491) (not b!1515498) (not b!1515489) (not b!1515501) (not b!1515494) (not b!1515500) (not b!1515495))
(check-sat)
