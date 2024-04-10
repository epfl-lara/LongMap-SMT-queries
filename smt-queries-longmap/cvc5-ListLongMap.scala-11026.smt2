; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128988 () Bool)

(assert start!128988)

(declare-fun res!1032338 () Bool)

(declare-fun e!844210 () Bool)

(assert (=> start!128988 (=> (not res!1032338) (not e!844210))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128988 (= res!1032338 (validMask!0 mask!2512))))

(assert (=> start!128988 e!844210))

(assert (=> start!128988 true))

(declare-datatypes ((array!100844 0))(
  ( (array!100845 (arr!48659 (Array (_ BitVec 32) (_ BitVec 64))) (size!49209 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100844)

(declare-fun array_inv!37687 (array!100844) Bool)

(assert (=> start!128988 (array_inv!37687 a!2804)))

(declare-fun b!1512431 () Bool)

(declare-fun res!1032344 () Bool)

(assert (=> b!1512431 (=> (not res!1032344) (not e!844210))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1512431 (= res!1032344 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49209 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49209 a!2804))))))

(declare-fun b!1512432 () Bool)

(declare-fun res!1032339 () Bool)

(declare-fun e!844206 () Bool)

(assert (=> b!1512432 (=> (not res!1032339) (not e!844206))))

(declare-datatypes ((SeekEntryResult!12830 0))(
  ( (MissingZero!12830 (index!53715 (_ BitVec 32))) (Found!12830 (index!53716 (_ BitVec 32))) (Intermediate!12830 (undefined!13642 Bool) (index!53717 (_ BitVec 32)) (x!135444 (_ BitVec 32))) (Undefined!12830) (MissingVacant!12830 (index!53718 (_ BitVec 32))) )
))
(declare-fun lt!655674 () SeekEntryResult!12830)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100844 (_ BitVec 32)) SeekEntryResult!12830)

(assert (=> b!1512432 (= res!1032339 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48659 a!2804) j!70) a!2804 mask!2512) lt!655674))))

(declare-fun b!1512433 () Bool)

(declare-fun res!1032335 () Bool)

(assert (=> b!1512433 (=> (not res!1032335) (not e!844210))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512433 (= res!1032335 (validKeyInArray!0 (select (arr!48659 a!2804) i!961)))))

(declare-fun b!1512434 () Bool)

(assert (=> b!1512434 (= e!844206 (not (or (not (= (select (arr!48659 a!2804) j!70) (select (store (arr!48659 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48659 a!2804) index!487) (select (arr!48659 a!2804) j!70)) (not (= (select (arr!48659 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!2512 #b00000000000000000000000000000000) (bvslt index!487 (bvadd #b00000000000000000000000000000001 mask!2512)))))))

(declare-fun e!844208 () Bool)

(assert (=> b!1512434 e!844208))

(declare-fun res!1032341 () Bool)

(assert (=> b!1512434 (=> (not res!1032341) (not e!844208))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100844 (_ BitVec 32)) Bool)

(assert (=> b!1512434 (= res!1032341 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50528 0))(
  ( (Unit!50529) )
))
(declare-fun lt!655675 () Unit!50528)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100844 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50528)

(assert (=> b!1512434 (= lt!655675 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512435 () Bool)

(declare-fun e!844209 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100844 (_ BitVec 32)) SeekEntryResult!12830)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100844 (_ BitVec 32)) SeekEntryResult!12830)

(assert (=> b!1512435 (= e!844209 (= (seekEntryOrOpen!0 (select (arr!48659 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48659 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1512436 () Bool)

(declare-fun res!1032345 () Bool)

(assert (=> b!1512436 (=> (not res!1032345) (not e!844210))))

(assert (=> b!1512436 (= res!1032345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512437 () Bool)

(declare-fun res!1032337 () Bool)

(assert (=> b!1512437 (=> (not res!1032337) (not e!844210))))

(assert (=> b!1512437 (= res!1032337 (and (= (size!49209 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49209 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49209 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512438 () Bool)

(assert (=> b!1512438 (= e!844210 e!844206)))

(declare-fun res!1032336 () Bool)

(assert (=> b!1512438 (=> (not res!1032336) (not e!844206))))

(declare-fun lt!655673 () SeekEntryResult!12830)

(assert (=> b!1512438 (= res!1032336 (= lt!655673 lt!655674))))

(assert (=> b!1512438 (= lt!655674 (Intermediate!12830 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512438 (= lt!655673 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48659 a!2804) j!70) mask!2512) (select (arr!48659 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512439 () Bool)

(declare-fun res!1032340 () Bool)

(assert (=> b!1512439 (=> (not res!1032340) (not e!844208))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100844 (_ BitVec 32)) SeekEntryResult!12830)

(assert (=> b!1512439 (= res!1032340 (= (seekEntry!0 (select (arr!48659 a!2804) j!70) a!2804 mask!2512) (Found!12830 j!70)))))

(declare-fun b!1512440 () Bool)

(declare-fun res!1032334 () Bool)

(assert (=> b!1512440 (=> (not res!1032334) (not e!844210))))

(assert (=> b!1512440 (= res!1032334 (validKeyInArray!0 (select (arr!48659 a!2804) j!70)))))

(declare-fun b!1512441 () Bool)

(declare-fun res!1032343 () Bool)

(assert (=> b!1512441 (=> (not res!1032343) (not e!844210))))

(declare-datatypes ((List!35142 0))(
  ( (Nil!35139) (Cons!35138 (h!36550 (_ BitVec 64)) (t!49836 List!35142)) )
))
(declare-fun arrayNoDuplicates!0 (array!100844 (_ BitVec 32) List!35142) Bool)

(assert (=> b!1512441 (= res!1032343 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35139))))

(declare-fun b!1512442 () Bool)

(assert (=> b!1512442 (= e!844208 e!844209)))

(declare-fun res!1032342 () Bool)

(assert (=> b!1512442 (=> res!1032342 e!844209)))

(assert (=> b!1512442 (= res!1032342 (or (not (= (select (arr!48659 a!2804) j!70) (select (store (arr!48659 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48659 a!2804) index!487) (select (arr!48659 a!2804) j!70)) (not (= (select (arr!48659 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1512443 () Bool)

(declare-fun res!1032346 () Bool)

(assert (=> b!1512443 (=> (not res!1032346) (not e!844206))))

(assert (=> b!1512443 (= res!1032346 (= lt!655673 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48659 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48659 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100845 (store (arr!48659 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49209 a!2804)) mask!2512)))))

(assert (= (and start!128988 res!1032338) b!1512437))

(assert (= (and b!1512437 res!1032337) b!1512433))

(assert (= (and b!1512433 res!1032335) b!1512440))

(assert (= (and b!1512440 res!1032334) b!1512436))

(assert (= (and b!1512436 res!1032345) b!1512441))

(assert (= (and b!1512441 res!1032343) b!1512431))

(assert (= (and b!1512431 res!1032344) b!1512438))

(assert (= (and b!1512438 res!1032336) b!1512432))

(assert (= (and b!1512432 res!1032339) b!1512443))

(assert (= (and b!1512443 res!1032346) b!1512434))

(assert (= (and b!1512434 res!1032341) b!1512439))

(assert (= (and b!1512439 res!1032340) b!1512442))

(assert (= (and b!1512442 (not res!1032342)) b!1512435))

(declare-fun m!1395199 () Bool)

(assert (=> b!1512443 m!1395199))

(declare-fun m!1395201 () Bool)

(assert (=> b!1512443 m!1395201))

(assert (=> b!1512443 m!1395201))

(declare-fun m!1395203 () Bool)

(assert (=> b!1512443 m!1395203))

(assert (=> b!1512443 m!1395203))

(assert (=> b!1512443 m!1395201))

(declare-fun m!1395205 () Bool)

(assert (=> b!1512443 m!1395205))

(declare-fun m!1395207 () Bool)

(assert (=> b!1512432 m!1395207))

(assert (=> b!1512432 m!1395207))

(declare-fun m!1395209 () Bool)

(assert (=> b!1512432 m!1395209))

(assert (=> b!1512440 m!1395207))

(assert (=> b!1512440 m!1395207))

(declare-fun m!1395211 () Bool)

(assert (=> b!1512440 m!1395211))

(assert (=> b!1512442 m!1395207))

(assert (=> b!1512442 m!1395199))

(assert (=> b!1512442 m!1395201))

(declare-fun m!1395213 () Bool)

(assert (=> b!1512442 m!1395213))

(declare-fun m!1395215 () Bool)

(assert (=> b!1512433 m!1395215))

(assert (=> b!1512433 m!1395215))

(declare-fun m!1395217 () Bool)

(assert (=> b!1512433 m!1395217))

(assert (=> b!1512435 m!1395207))

(assert (=> b!1512435 m!1395207))

(declare-fun m!1395219 () Bool)

(assert (=> b!1512435 m!1395219))

(assert (=> b!1512435 m!1395207))

(declare-fun m!1395221 () Bool)

(assert (=> b!1512435 m!1395221))

(assert (=> b!1512434 m!1395207))

(declare-fun m!1395223 () Bool)

(assert (=> b!1512434 m!1395223))

(assert (=> b!1512434 m!1395199))

(assert (=> b!1512434 m!1395213))

(assert (=> b!1512434 m!1395201))

(declare-fun m!1395225 () Bool)

(assert (=> b!1512434 m!1395225))

(declare-fun m!1395227 () Bool)

(assert (=> b!1512436 m!1395227))

(declare-fun m!1395229 () Bool)

(assert (=> start!128988 m!1395229))

(declare-fun m!1395231 () Bool)

(assert (=> start!128988 m!1395231))

(declare-fun m!1395233 () Bool)

(assert (=> b!1512441 m!1395233))

(assert (=> b!1512439 m!1395207))

(assert (=> b!1512439 m!1395207))

(declare-fun m!1395235 () Bool)

(assert (=> b!1512439 m!1395235))

(assert (=> b!1512438 m!1395207))

(assert (=> b!1512438 m!1395207))

(declare-fun m!1395237 () Bool)

(assert (=> b!1512438 m!1395237))

(assert (=> b!1512438 m!1395237))

(assert (=> b!1512438 m!1395207))

(declare-fun m!1395239 () Bool)

(assert (=> b!1512438 m!1395239))

(push 1)

(assert (not b!1512433))

(assert (not b!1512443))

(assert (not b!1512438))

(assert (not b!1512441))

(assert (not b!1512435))

(assert (not b!1512440))

(assert (not start!128988))

(assert (not b!1512436))

(assert (not b!1512432))

(assert (not b!1512439))

(assert (not b!1512434))

(check-sat)

(pop 1)

(push 1)

(check-sat)

