; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130076 () Bool)

(assert start!130076)

(declare-fun b!1526482 () Bool)

(declare-fun res!1044524 () Bool)

(declare-fun e!850853 () Bool)

(assert (=> b!1526482 (=> (not res!1044524) (not e!850853))))

(declare-datatypes ((array!101489 0))(
  ( (array!101490 (arr!48971 (Array (_ BitVec 32) (_ BitVec 64))) (size!49521 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101489)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526482 (= res!1044524 (validKeyInArray!0 (select (arr!48971 a!2804) i!961)))))

(declare-fun b!1526483 () Bool)

(declare-fun res!1044526 () Bool)

(assert (=> b!1526483 (=> (not res!1044526) (not e!850853))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101489 (_ BitVec 32)) Bool)

(assert (=> b!1526483 (= res!1044526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1526484 () Bool)

(declare-fun res!1044519 () Bool)

(assert (=> b!1526484 (=> (not res!1044519) (not e!850853))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1526484 (= res!1044519 (validKeyInArray!0 (select (arr!48971 a!2804) j!70)))))

(declare-fun b!1526485 () Bool)

(declare-fun e!850855 () Bool)

(declare-fun e!850858 () Bool)

(assert (=> b!1526485 (= e!850855 e!850858)))

(declare-fun res!1044518 () Bool)

(assert (=> b!1526485 (=> (not res!1044518) (not e!850858))))

(declare-fun lt!661090 () (_ BitVec 64))

(declare-fun lt!661092 () array!101489)

(declare-datatypes ((SeekEntryResult!13136 0))(
  ( (MissingZero!13136 (index!54939 (_ BitVec 32))) (Found!13136 (index!54940 (_ BitVec 32))) (Intermediate!13136 (undefined!13948 Bool) (index!54941 (_ BitVec 32)) (x!136638 (_ BitVec 32))) (Undefined!13136) (MissingVacant!13136 (index!54942 (_ BitVec 32))) )
))
(declare-fun lt!661091 () SeekEntryResult!13136)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101489 (_ BitVec 32)) SeekEntryResult!13136)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526485 (= res!1044518 (= lt!661091 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661090 mask!2512) lt!661090 lt!661092 mask!2512)))))

(assert (=> b!1526485 (= lt!661090 (select (store (arr!48971 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526485 (= lt!661092 (array!101490 (store (arr!48971 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49521 a!2804)))))

(declare-fun e!850854 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun b!1526486 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101489 (_ BitVec 32)) SeekEntryResult!13136)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101489 (_ BitVec 32)) SeekEntryResult!13136)

(assert (=> b!1526486 (= e!850854 (= (seekEntryOrOpen!0 lt!661090 lt!661092 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661090 lt!661092 mask!2512)))))

(declare-fun b!1526487 () Bool)

(assert (=> b!1526487 (= e!850853 e!850855)))

(declare-fun res!1044521 () Bool)

(assert (=> b!1526487 (=> (not res!1044521) (not e!850855))))

(declare-fun lt!661093 () SeekEntryResult!13136)

(assert (=> b!1526487 (= res!1044521 (= lt!661091 lt!661093))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1526487 (= lt!661093 (Intermediate!13136 false resIndex!21 resX!21))))

(assert (=> b!1526487 (= lt!661091 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48971 a!2804) j!70) mask!2512) (select (arr!48971 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526488 () Bool)

(assert (=> b!1526488 (= e!850858 (not true))))

(declare-fun e!850856 () Bool)

(assert (=> b!1526488 e!850856))

(declare-fun res!1044525 () Bool)

(assert (=> b!1526488 (=> (not res!1044525) (not e!850856))))

(assert (=> b!1526488 (= res!1044525 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51056 0))(
  ( (Unit!51057) )
))
(declare-fun lt!661089 () Unit!51056)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101489 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51056)

(assert (=> b!1526488 (= lt!661089 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526489 () Bool)

(declare-fun res!1044516 () Bool)

(assert (=> b!1526489 (=> (not res!1044516) (not e!850853))))

(assert (=> b!1526489 (= res!1044516 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49521 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49521 a!2804))))))

(declare-fun b!1526490 () Bool)

(declare-fun res!1044528 () Bool)

(assert (=> b!1526490 (=> (not res!1044528) (not e!850856))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101489 (_ BitVec 32)) SeekEntryResult!13136)

(assert (=> b!1526490 (= res!1044528 (= (seekEntry!0 (select (arr!48971 a!2804) j!70) a!2804 mask!2512) (Found!13136 j!70)))))

(declare-fun b!1526491 () Bool)

(declare-fun res!1044522 () Bool)

(assert (=> b!1526491 (=> (not res!1044522) (not e!850853))))

(declare-datatypes ((List!35454 0))(
  ( (Nil!35451) (Cons!35450 (h!36883 (_ BitVec 64)) (t!50148 List!35454)) )
))
(declare-fun arrayNoDuplicates!0 (array!101489 (_ BitVec 32) List!35454) Bool)

(assert (=> b!1526491 (= res!1044522 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35451))))

(declare-fun b!1526492 () Bool)

(declare-fun res!1044520 () Bool)

(assert (=> b!1526492 (=> (not res!1044520) (not e!850853))))

(assert (=> b!1526492 (= res!1044520 (and (= (size!49521 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49521 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49521 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526493 () Bool)

(declare-fun res!1044529 () Bool)

(assert (=> b!1526493 (=> (not res!1044529) (not e!850855))))

(assert (=> b!1526493 (= res!1044529 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48971 a!2804) j!70) a!2804 mask!2512) lt!661093))))

(declare-fun res!1044517 () Bool)

(assert (=> start!130076 (=> (not res!1044517) (not e!850853))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130076 (= res!1044517 (validMask!0 mask!2512))))

(assert (=> start!130076 e!850853))

(assert (=> start!130076 true))

(declare-fun array_inv!37999 (array!101489) Bool)

(assert (=> start!130076 (array_inv!37999 a!2804)))

(declare-fun b!1526494 () Bool)

(declare-fun e!850852 () Bool)

(assert (=> b!1526494 (= e!850852 e!850854)))

(declare-fun res!1044523 () Bool)

(assert (=> b!1526494 (=> (not res!1044523) (not e!850854))))

(assert (=> b!1526494 (= res!1044523 (= (seekEntryOrOpen!0 (select (arr!48971 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48971 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1526495 () Bool)

(assert (=> b!1526495 (= e!850856 e!850852)))

(declare-fun res!1044527 () Bool)

(assert (=> b!1526495 (=> res!1044527 e!850852)))

(assert (=> b!1526495 (= res!1044527 (or (not (= (select (arr!48971 a!2804) j!70) lt!661090)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48971 a!2804) index!487) (select (arr!48971 a!2804) j!70)) (not (= (select (arr!48971 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!130076 res!1044517) b!1526492))

(assert (= (and b!1526492 res!1044520) b!1526482))

(assert (= (and b!1526482 res!1044524) b!1526484))

(assert (= (and b!1526484 res!1044519) b!1526483))

(assert (= (and b!1526483 res!1044526) b!1526491))

(assert (= (and b!1526491 res!1044522) b!1526489))

(assert (= (and b!1526489 res!1044516) b!1526487))

(assert (= (and b!1526487 res!1044521) b!1526493))

(assert (= (and b!1526493 res!1044529) b!1526485))

(assert (= (and b!1526485 res!1044518) b!1526488))

(assert (= (and b!1526488 res!1044525) b!1526490))

(assert (= (and b!1526490 res!1044528) b!1526495))

(assert (= (and b!1526495 (not res!1044527)) b!1526494))

(assert (= (and b!1526494 res!1044523) b!1526486))

(declare-fun m!1409289 () Bool)

(assert (=> b!1526487 m!1409289))

(assert (=> b!1526487 m!1409289))

(declare-fun m!1409291 () Bool)

(assert (=> b!1526487 m!1409291))

(assert (=> b!1526487 m!1409291))

(assert (=> b!1526487 m!1409289))

(declare-fun m!1409293 () Bool)

(assert (=> b!1526487 m!1409293))

(assert (=> b!1526494 m!1409289))

(assert (=> b!1526494 m!1409289))

(declare-fun m!1409295 () Bool)

(assert (=> b!1526494 m!1409295))

(assert (=> b!1526494 m!1409289))

(declare-fun m!1409297 () Bool)

(assert (=> b!1526494 m!1409297))

(assert (=> b!1526495 m!1409289))

(declare-fun m!1409299 () Bool)

(assert (=> b!1526495 m!1409299))

(declare-fun m!1409301 () Bool)

(assert (=> b!1526482 m!1409301))

(assert (=> b!1526482 m!1409301))

(declare-fun m!1409303 () Bool)

(assert (=> b!1526482 m!1409303))

(assert (=> b!1526493 m!1409289))

(assert (=> b!1526493 m!1409289))

(declare-fun m!1409305 () Bool)

(assert (=> b!1526493 m!1409305))

(assert (=> b!1526490 m!1409289))

(assert (=> b!1526490 m!1409289))

(declare-fun m!1409307 () Bool)

(assert (=> b!1526490 m!1409307))

(declare-fun m!1409309 () Bool)

(assert (=> b!1526491 m!1409309))

(assert (=> b!1526484 m!1409289))

(assert (=> b!1526484 m!1409289))

(declare-fun m!1409311 () Bool)

(assert (=> b!1526484 m!1409311))

(declare-fun m!1409313 () Bool)

(assert (=> b!1526483 m!1409313))

(declare-fun m!1409315 () Bool)

(assert (=> b!1526485 m!1409315))

(assert (=> b!1526485 m!1409315))

(declare-fun m!1409317 () Bool)

(assert (=> b!1526485 m!1409317))

(declare-fun m!1409319 () Bool)

(assert (=> b!1526485 m!1409319))

(declare-fun m!1409321 () Bool)

(assert (=> b!1526485 m!1409321))

(declare-fun m!1409323 () Bool)

(assert (=> start!130076 m!1409323))

(declare-fun m!1409325 () Bool)

(assert (=> start!130076 m!1409325))

(declare-fun m!1409327 () Bool)

(assert (=> b!1526486 m!1409327))

(declare-fun m!1409329 () Bool)

(assert (=> b!1526486 m!1409329))

(declare-fun m!1409331 () Bool)

(assert (=> b!1526488 m!1409331))

(declare-fun m!1409333 () Bool)

(assert (=> b!1526488 m!1409333))

(push 1)

