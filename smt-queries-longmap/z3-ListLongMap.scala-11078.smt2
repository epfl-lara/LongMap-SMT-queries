; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129248 () Bool)

(assert start!129248)

(declare-fun b!1518276 () Bool)

(declare-fun res!1038392 () Bool)

(declare-fun e!846954 () Bool)

(assert (=> b!1518276 (=> (not res!1038392) (not e!846954))))

(declare-datatypes ((array!101104 0))(
  ( (array!101105 (arr!48790 (Array (_ BitVec 32) (_ BitVec 64))) (size!49342 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101104)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518276 (= res!1038392 (validKeyInArray!0 (select (arr!48790 a!2804) i!961)))))

(declare-fun b!1518277 () Bool)

(declare-fun res!1038386 () Bool)

(assert (=> b!1518277 (=> (not res!1038386) (not e!846954))))

(declare-datatypes ((List!35351 0))(
  ( (Nil!35348) (Cons!35347 (h!36760 (_ BitVec 64)) (t!50037 List!35351)) )
))
(declare-fun arrayNoDuplicates!0 (array!101104 (_ BitVec 32) List!35351) Bool)

(assert (=> b!1518277 (= res!1038386 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35348))))

(declare-fun b!1518278 () Bool)

(declare-fun res!1038397 () Bool)

(assert (=> b!1518278 (=> (not res!1038397) (not e!846954))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1518278 (= res!1038397 (validKeyInArray!0 (select (arr!48790 a!2804) j!70)))))

(declare-fun b!1518279 () Bool)

(declare-fun e!846950 () Bool)

(declare-fun e!846951 () Bool)

(assert (=> b!1518279 (= e!846950 e!846951)))

(declare-fun res!1038390 () Bool)

(assert (=> b!1518279 (=> (not res!1038390) (not e!846951))))

(declare-datatypes ((SeekEntryResult!12984 0))(
  ( (MissingZero!12984 (index!54331 (_ BitVec 32))) (Found!12984 (index!54332 (_ BitVec 32))) (Intermediate!12984 (undefined!13796 Bool) (index!54333 (_ BitVec 32)) (x!136008 (_ BitVec 32))) (Undefined!12984) (MissingVacant!12984 (index!54334 (_ BitVec 32))) )
))
(declare-fun lt!657963 () SeekEntryResult!12984)

(declare-fun lt!657961 () array!101104)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun lt!657965 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101104 (_ BitVec 32)) SeekEntryResult!12984)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518279 (= res!1038390 (= lt!657963 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!657965 mask!2512) lt!657965 lt!657961 mask!2512)))))

(assert (=> b!1518279 (= lt!657965 (select (store (arr!48790 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1518279 (= lt!657961 (array!101105 (store (arr!48790 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49342 a!2804)))))

(declare-fun b!1518280 () Bool)

(declare-fun e!846953 () Bool)

(declare-fun e!846952 () Bool)

(assert (=> b!1518280 (= e!846953 e!846952)))

(declare-fun res!1038393 () Bool)

(assert (=> b!1518280 (=> res!1038393 e!846952)))

(declare-fun lt!657962 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1518280 (= res!1038393 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657962 #b00000000000000000000000000000000) (bvsge lt!657962 (size!49342 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518280 (= lt!657962 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1518281 () Bool)

(assert (=> b!1518281 (= e!846954 e!846950)))

(declare-fun res!1038391 () Bool)

(assert (=> b!1518281 (=> (not res!1038391) (not e!846950))))

(declare-fun lt!657960 () SeekEntryResult!12984)

(assert (=> b!1518281 (= res!1038391 (= lt!657963 lt!657960))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1518281 (= lt!657960 (Intermediate!12984 false resIndex!21 resX!21))))

(assert (=> b!1518281 (= lt!657963 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48790 a!2804) j!70) mask!2512) (select (arr!48790 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518282 () Bool)

(declare-fun res!1038395 () Bool)

(assert (=> b!1518282 (=> (not res!1038395) (not e!846954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101104 (_ BitVec 32)) Bool)

(assert (=> b!1518282 (= res!1038395 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518283 () Bool)

(declare-fun res!1038387 () Bool)

(assert (=> b!1518283 (=> (not res!1038387) (not e!846954))))

(assert (=> b!1518283 (= res!1038387 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49342 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49342 a!2804))))))

(declare-fun b!1518284 () Bool)

(assert (=> b!1518284 (= e!846952 (bvsge mask!2512 #b00000000000000000000000000000000))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101104 (_ BitVec 32)) SeekEntryResult!12984)

(assert (=> b!1518284 (= (seekEntryOrOpen!0 (select (arr!48790 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!657965 lt!657961 mask!2512))))

(declare-datatypes ((Unit!50675 0))(
  ( (Unit!50676) )
))
(declare-fun lt!657966 () Unit!50675)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101104 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50675)

(assert (=> b!1518284 (= lt!657966 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!657962 resX!21 resIndex!21 mask!2512))))

(declare-fun res!1038394 () Bool)

(assert (=> start!129248 (=> (not res!1038394) (not e!846954))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129248 (= res!1038394 (validMask!0 mask!2512))))

(assert (=> start!129248 e!846954))

(assert (=> start!129248 true))

(declare-fun array_inv!38023 (array!101104) Bool)

(assert (=> start!129248 (array_inv!38023 a!2804)))

(declare-fun b!1518285 () Bool)

(declare-fun res!1038396 () Bool)

(assert (=> b!1518285 (=> res!1038396 e!846952)))

(assert (=> b!1518285 (= res!1038396 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657962 (select (arr!48790 a!2804) j!70) a!2804 mask!2512) lt!657960)))))

(declare-fun b!1518286 () Bool)

(declare-fun res!1038388 () Bool)

(assert (=> b!1518286 (=> (not res!1038388) (not e!846950))))

(assert (=> b!1518286 (= res!1038388 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48790 a!2804) j!70) a!2804 mask!2512) lt!657960))))

(declare-fun b!1518287 () Bool)

(assert (=> b!1518287 (= e!846951 (not e!846953))))

(declare-fun res!1038389 () Bool)

(assert (=> b!1518287 (=> res!1038389 e!846953)))

(assert (=> b!1518287 (= res!1038389 (or (not (= (select (arr!48790 a!2804) j!70) lt!657965)) (= x!534 resX!21)))))

(declare-fun e!846948 () Bool)

(assert (=> b!1518287 e!846948))

(declare-fun res!1038398 () Bool)

(assert (=> b!1518287 (=> (not res!1038398) (not e!846948))))

(assert (=> b!1518287 (= res!1038398 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!657964 () Unit!50675)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101104 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50675)

(assert (=> b!1518287 (= lt!657964 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518288 () Bool)

(declare-fun res!1038385 () Bool)

(assert (=> b!1518288 (=> (not res!1038385) (not e!846954))))

(assert (=> b!1518288 (= res!1038385 (and (= (size!49342 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49342 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49342 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518289 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101104 (_ BitVec 32)) SeekEntryResult!12984)

(assert (=> b!1518289 (= e!846948 (= (seekEntry!0 (select (arr!48790 a!2804) j!70) a!2804 mask!2512) (Found!12984 j!70)))))

(assert (= (and start!129248 res!1038394) b!1518288))

(assert (= (and b!1518288 res!1038385) b!1518276))

(assert (= (and b!1518276 res!1038392) b!1518278))

(assert (= (and b!1518278 res!1038397) b!1518282))

(assert (= (and b!1518282 res!1038395) b!1518277))

(assert (= (and b!1518277 res!1038386) b!1518283))

(assert (= (and b!1518283 res!1038387) b!1518281))

(assert (= (and b!1518281 res!1038391) b!1518286))

(assert (= (and b!1518286 res!1038388) b!1518279))

(assert (= (and b!1518279 res!1038390) b!1518287))

(assert (= (and b!1518287 res!1038398) b!1518289))

(assert (= (and b!1518287 (not res!1038389)) b!1518280))

(assert (= (and b!1518280 (not res!1038393)) b!1518285))

(assert (= (and b!1518285 (not res!1038396)) b!1518284))

(declare-fun m!1401035 () Bool)

(assert (=> b!1518286 m!1401035))

(assert (=> b!1518286 m!1401035))

(declare-fun m!1401037 () Bool)

(assert (=> b!1518286 m!1401037))

(assert (=> b!1518285 m!1401035))

(assert (=> b!1518285 m!1401035))

(declare-fun m!1401039 () Bool)

(assert (=> b!1518285 m!1401039))

(declare-fun m!1401041 () Bool)

(assert (=> b!1518280 m!1401041))

(declare-fun m!1401043 () Bool)

(assert (=> b!1518282 m!1401043))

(assert (=> b!1518289 m!1401035))

(assert (=> b!1518289 m!1401035))

(declare-fun m!1401045 () Bool)

(assert (=> b!1518289 m!1401045))

(declare-fun m!1401047 () Bool)

(assert (=> b!1518277 m!1401047))

(declare-fun m!1401049 () Bool)

(assert (=> b!1518276 m!1401049))

(assert (=> b!1518276 m!1401049))

(declare-fun m!1401051 () Bool)

(assert (=> b!1518276 m!1401051))

(assert (=> b!1518284 m!1401035))

(assert (=> b!1518284 m!1401035))

(declare-fun m!1401053 () Bool)

(assert (=> b!1518284 m!1401053))

(declare-fun m!1401055 () Bool)

(assert (=> b!1518284 m!1401055))

(declare-fun m!1401057 () Bool)

(assert (=> b!1518284 m!1401057))

(assert (=> b!1518278 m!1401035))

(assert (=> b!1518278 m!1401035))

(declare-fun m!1401059 () Bool)

(assert (=> b!1518278 m!1401059))

(declare-fun m!1401061 () Bool)

(assert (=> b!1518279 m!1401061))

(assert (=> b!1518279 m!1401061))

(declare-fun m!1401063 () Bool)

(assert (=> b!1518279 m!1401063))

(declare-fun m!1401065 () Bool)

(assert (=> b!1518279 m!1401065))

(declare-fun m!1401067 () Bool)

(assert (=> b!1518279 m!1401067))

(assert (=> b!1518281 m!1401035))

(assert (=> b!1518281 m!1401035))

(declare-fun m!1401069 () Bool)

(assert (=> b!1518281 m!1401069))

(assert (=> b!1518281 m!1401069))

(assert (=> b!1518281 m!1401035))

(declare-fun m!1401071 () Bool)

(assert (=> b!1518281 m!1401071))

(declare-fun m!1401073 () Bool)

(assert (=> start!129248 m!1401073))

(declare-fun m!1401075 () Bool)

(assert (=> start!129248 m!1401075))

(assert (=> b!1518287 m!1401035))

(declare-fun m!1401077 () Bool)

(assert (=> b!1518287 m!1401077))

(declare-fun m!1401079 () Bool)

(assert (=> b!1518287 m!1401079))

(check-sat (not b!1518284) (not b!1518279) (not start!129248) (not b!1518281) (not b!1518278) (not b!1518280) (not b!1518282) (not b!1518277) (not b!1518286) (not b!1518276) (not b!1518289) (not b!1518287) (not b!1518285))
(check-sat)
