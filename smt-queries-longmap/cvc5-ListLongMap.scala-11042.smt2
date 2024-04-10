; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129084 () Bool)

(assert start!129084)

(declare-fun b!1514413 () Bool)

(declare-fun res!1034318 () Bool)

(declare-fun e!845157 () Bool)

(assert (=> b!1514413 (=> (not res!1034318) (not e!845157))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100940 0))(
  ( (array!100941 (arr!48707 (Array (_ BitVec 32) (_ BitVec 64))) (size!49257 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100940)

(assert (=> b!1514413 (= res!1034318 (and (= (size!49257 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49257 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49257 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1514414 () Bool)

(declare-fun e!845156 () Bool)

(declare-fun e!845160 () Bool)

(assert (=> b!1514414 (= e!845156 e!845160)))

(declare-fun res!1034324 () Bool)

(assert (=> b!1514414 (=> res!1034324 e!845160)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!656327 () (_ BitVec 64))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1514414 (= res!1034324 (or (not (= (select (arr!48707 a!2804) j!70) lt!656327)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48707 a!2804) index!487) (select (arr!48707 a!2804) j!70)) (not (= (select (arr!48707 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1514415 () Bool)

(declare-fun e!845161 () Bool)

(declare-fun e!845155 () Bool)

(assert (=> b!1514415 (= e!845161 e!845155)))

(declare-fun res!1034319 () Bool)

(assert (=> b!1514415 (=> (not res!1034319) (not e!845155))))

(declare-datatypes ((SeekEntryResult!12878 0))(
  ( (MissingZero!12878 (index!53907 (_ BitVec 32))) (Found!12878 (index!53908 (_ BitVec 32))) (Intermediate!12878 (undefined!13690 Bool) (index!53909 (_ BitVec 32)) (x!135620 (_ BitVec 32))) (Undefined!12878) (MissingVacant!12878 (index!53910 (_ BitVec 32))) )
))
(declare-fun lt!656326 () SeekEntryResult!12878)

(declare-fun lt!656329 () array!100940)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100940 (_ BitVec 32)) SeekEntryResult!12878)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514415 (= res!1034319 (= lt!656326 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656327 mask!2512) lt!656327 lt!656329 mask!2512)))))

(assert (=> b!1514415 (= lt!656327 (select (store (arr!48707 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514415 (= lt!656329 (array!100941 (store (arr!48707 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49257 a!2804)))))

(declare-fun b!1514416 () Bool)

(declare-fun res!1034316 () Bool)

(assert (=> b!1514416 (=> (not res!1034316) (not e!845161))))

(declare-fun lt!656328 () SeekEntryResult!12878)

(assert (=> b!1514416 (= res!1034316 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48707 a!2804) j!70) a!2804 mask!2512) lt!656328))))

(declare-fun b!1514417 () Bool)

(declare-fun res!1034320 () Bool)

(assert (=> b!1514417 (=> (not res!1034320) (not e!845157))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514417 (= res!1034320 (validKeyInArray!0 (select (arr!48707 a!2804) i!961)))))

(declare-fun b!1514418 () Bool)

(declare-fun e!845158 () Bool)

(assert (=> b!1514418 (= e!845160 e!845158)))

(declare-fun res!1034321 () Bool)

(assert (=> b!1514418 (=> (not res!1034321) (not e!845158))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100940 (_ BitVec 32)) SeekEntryResult!12878)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100940 (_ BitVec 32)) SeekEntryResult!12878)

(assert (=> b!1514418 (= res!1034321 (= (seekEntryOrOpen!0 (select (arr!48707 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48707 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514419 () Bool)

(declare-fun res!1034322 () Bool)

(assert (=> b!1514419 (=> (not res!1034322) (not e!845157))))

(assert (=> b!1514419 (= res!1034322 (validKeyInArray!0 (select (arr!48707 a!2804) j!70)))))

(declare-fun b!1514420 () Bool)

(assert (=> b!1514420 (= e!845158 (= (seekEntryOrOpen!0 lt!656327 lt!656329 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656327 lt!656329 mask!2512)))))

(declare-fun b!1514421 () Bool)

(assert (=> b!1514421 (= e!845155 (not true))))

(assert (=> b!1514421 e!845156))

(declare-fun res!1034323 () Bool)

(assert (=> b!1514421 (=> (not res!1034323) (not e!845156))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100940 (_ BitVec 32)) Bool)

(assert (=> b!1514421 (= res!1034323 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50624 0))(
  ( (Unit!50625) )
))
(declare-fun lt!656325 () Unit!50624)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100940 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50624)

(assert (=> b!1514421 (= lt!656325 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514422 () Bool)

(declare-fun res!1034328 () Bool)

(assert (=> b!1514422 (=> (not res!1034328) (not e!845157))))

(declare-datatypes ((List!35190 0))(
  ( (Nil!35187) (Cons!35186 (h!36598 (_ BitVec 64)) (t!49884 List!35190)) )
))
(declare-fun arrayNoDuplicates!0 (array!100940 (_ BitVec 32) List!35190) Bool)

(assert (=> b!1514422 (= res!1034328 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35187))))

(declare-fun b!1514423 () Bool)

(assert (=> b!1514423 (= e!845157 e!845161)))

(declare-fun res!1034326 () Bool)

(assert (=> b!1514423 (=> (not res!1034326) (not e!845161))))

(assert (=> b!1514423 (= res!1034326 (= lt!656326 lt!656328))))

(assert (=> b!1514423 (= lt!656328 (Intermediate!12878 false resIndex!21 resX!21))))

(assert (=> b!1514423 (= lt!656326 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48707 a!2804) j!70) mask!2512) (select (arr!48707 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1034329 () Bool)

(assert (=> start!129084 (=> (not res!1034329) (not e!845157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129084 (= res!1034329 (validMask!0 mask!2512))))

(assert (=> start!129084 e!845157))

(assert (=> start!129084 true))

(declare-fun array_inv!37735 (array!100940) Bool)

(assert (=> start!129084 (array_inv!37735 a!2804)))

(declare-fun b!1514424 () Bool)

(declare-fun res!1034327 () Bool)

(assert (=> b!1514424 (=> (not res!1034327) (not e!845156))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100940 (_ BitVec 32)) SeekEntryResult!12878)

(assert (=> b!1514424 (= res!1034327 (= (seekEntry!0 (select (arr!48707 a!2804) j!70) a!2804 mask!2512) (Found!12878 j!70)))))

(declare-fun b!1514425 () Bool)

(declare-fun res!1034325 () Bool)

(assert (=> b!1514425 (=> (not res!1034325) (not e!845157))))

(assert (=> b!1514425 (= res!1034325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514426 () Bool)

(declare-fun res!1034317 () Bool)

(assert (=> b!1514426 (=> (not res!1034317) (not e!845157))))

(assert (=> b!1514426 (= res!1034317 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49257 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49257 a!2804))))))

(assert (= (and start!129084 res!1034329) b!1514413))

(assert (= (and b!1514413 res!1034318) b!1514417))

(assert (= (and b!1514417 res!1034320) b!1514419))

(assert (= (and b!1514419 res!1034322) b!1514425))

(assert (= (and b!1514425 res!1034325) b!1514422))

(assert (= (and b!1514422 res!1034328) b!1514426))

(assert (= (and b!1514426 res!1034317) b!1514423))

(assert (= (and b!1514423 res!1034326) b!1514416))

(assert (= (and b!1514416 res!1034316) b!1514415))

(assert (= (and b!1514415 res!1034319) b!1514421))

(assert (= (and b!1514421 res!1034323) b!1514424))

(assert (= (and b!1514424 res!1034327) b!1514414))

(assert (= (and b!1514414 (not res!1034324)) b!1514418))

(assert (= (and b!1514418 res!1034321) b!1514420))

(declare-fun m!1397365 () Bool)

(assert (=> b!1514419 m!1397365))

(assert (=> b!1514419 m!1397365))

(declare-fun m!1397367 () Bool)

(assert (=> b!1514419 m!1397367))

(assert (=> b!1514423 m!1397365))

(assert (=> b!1514423 m!1397365))

(declare-fun m!1397369 () Bool)

(assert (=> b!1514423 m!1397369))

(assert (=> b!1514423 m!1397369))

(assert (=> b!1514423 m!1397365))

(declare-fun m!1397371 () Bool)

(assert (=> b!1514423 m!1397371))

(assert (=> b!1514414 m!1397365))

(declare-fun m!1397373 () Bool)

(assert (=> b!1514414 m!1397373))

(assert (=> b!1514424 m!1397365))

(assert (=> b!1514424 m!1397365))

(declare-fun m!1397375 () Bool)

(assert (=> b!1514424 m!1397375))

(declare-fun m!1397377 () Bool)

(assert (=> b!1514417 m!1397377))

(assert (=> b!1514417 m!1397377))

(declare-fun m!1397379 () Bool)

(assert (=> b!1514417 m!1397379))

(declare-fun m!1397381 () Bool)

(assert (=> b!1514420 m!1397381))

(declare-fun m!1397383 () Bool)

(assert (=> b!1514420 m!1397383))

(declare-fun m!1397385 () Bool)

(assert (=> b!1514425 m!1397385))

(assert (=> b!1514416 m!1397365))

(assert (=> b!1514416 m!1397365))

(declare-fun m!1397387 () Bool)

(assert (=> b!1514416 m!1397387))

(assert (=> b!1514418 m!1397365))

(assert (=> b!1514418 m!1397365))

(declare-fun m!1397389 () Bool)

(assert (=> b!1514418 m!1397389))

(assert (=> b!1514418 m!1397365))

(declare-fun m!1397391 () Bool)

(assert (=> b!1514418 m!1397391))

(declare-fun m!1397393 () Bool)

(assert (=> b!1514421 m!1397393))

(declare-fun m!1397395 () Bool)

(assert (=> b!1514421 m!1397395))

(declare-fun m!1397397 () Bool)

(assert (=> b!1514415 m!1397397))

(assert (=> b!1514415 m!1397397))

(declare-fun m!1397399 () Bool)

(assert (=> b!1514415 m!1397399))

(declare-fun m!1397401 () Bool)

(assert (=> b!1514415 m!1397401))

(declare-fun m!1397403 () Bool)

(assert (=> b!1514415 m!1397403))

(declare-fun m!1397405 () Bool)

(assert (=> start!129084 m!1397405))

(declare-fun m!1397407 () Bool)

(assert (=> start!129084 m!1397407))

(declare-fun m!1397409 () Bool)

(assert (=> b!1514422 m!1397409))

(push 1)

