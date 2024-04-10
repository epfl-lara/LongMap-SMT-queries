; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129662 () Bool)

(assert start!129662)

(declare-fun b!1522280 () Bool)

(declare-fun res!1041504 () Bool)

(declare-fun e!848797 () Bool)

(assert (=> b!1522280 (=> (not res!1041504) (not e!848797))))

(declare-datatypes ((array!101337 0))(
  ( (array!101338 (arr!48901 (Array (_ BitVec 32) (_ BitVec 64))) (size!49451 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101337)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1522280 (= res!1041504 (validKeyInArray!0 (select (arr!48901 a!2804) i!961)))))

(declare-fun b!1522281 () Bool)

(declare-fun res!1041508 () Bool)

(assert (=> b!1522281 (=> (not res!1041508) (not e!848797))))

(declare-datatypes ((List!35384 0))(
  ( (Nil!35381) (Cons!35380 (h!36801 (_ BitVec 64)) (t!50078 List!35384)) )
))
(declare-fun arrayNoDuplicates!0 (array!101337 (_ BitVec 32) List!35384) Bool)

(assert (=> b!1522281 (= res!1041508 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35381))))

(declare-fun b!1522282 () Bool)

(declare-fun res!1041502 () Bool)

(assert (=> b!1522282 (=> (not res!1041502) (not e!848797))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1522282 (= res!1041502 (validKeyInArray!0 (select (arr!48901 a!2804) j!70)))))

(declare-fun b!1522283 () Bool)

(declare-fun res!1041510 () Bool)

(declare-fun e!848795 () Bool)

(assert (=> b!1522283 (=> (not res!1041510) (not e!848795))))

(declare-datatypes ((SeekEntryResult!13066 0))(
  ( (MissingZero!13066 (index!54659 (_ BitVec 32))) (Found!13066 (index!54660 (_ BitVec 32))) (Intermediate!13066 (undefined!13878 Bool) (index!54661 (_ BitVec 32)) (x!136342 (_ BitVec 32))) (Undefined!13066) (MissingVacant!13066 (index!54662 (_ BitVec 32))) )
))
(declare-fun lt!659546 () SeekEntryResult!13066)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101337 (_ BitVec 32)) SeekEntryResult!13066)

(assert (=> b!1522283 (= res!1041510 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48901 a!2804) j!70) a!2804 mask!2512) lt!659546))))

(declare-fun b!1522284 () Bool)

(declare-fun res!1041503 () Bool)

(assert (=> b!1522284 (=> (not res!1041503) (not e!848795))))

(declare-fun lt!659547 () SeekEntryResult!13066)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1522284 (= res!1041503 (= lt!659547 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101338 (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49451 a!2804)) mask!2512)))))

(declare-fun b!1522285 () Bool)

(declare-fun res!1041511 () Bool)

(assert (=> b!1522285 (=> (not res!1041511) (not e!848797))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1522285 (= res!1041511 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49451 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49451 a!2804))))))

(declare-fun b!1522286 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101337 (_ BitVec 32)) SeekEntryResult!13066)

(assert (=> b!1522286 (= e!848795 (not (= (seekEntry!0 (select (arr!48901 a!2804) j!70) a!2804 mask!2512) (Found!13066 j!70))))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101337 (_ BitVec 32)) Bool)

(assert (=> b!1522286 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-datatypes ((Unit!50916 0))(
  ( (Unit!50917) )
))
(declare-fun lt!659548 () Unit!50916)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101337 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50916)

(assert (=> b!1522286 (= lt!659548 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1522287 () Bool)

(declare-fun res!1041507 () Bool)

(assert (=> b!1522287 (=> (not res!1041507) (not e!848797))))

(assert (=> b!1522287 (= res!1041507 (and (= (size!49451 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49451 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49451 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1522289 () Bool)

(declare-fun res!1041506 () Bool)

(assert (=> b!1522289 (=> (not res!1041506) (not e!848797))))

(assert (=> b!1522289 (= res!1041506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1041505 () Bool)

(assert (=> start!129662 (=> (not res!1041505) (not e!848797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129662 (= res!1041505 (validMask!0 mask!2512))))

(assert (=> start!129662 e!848797))

(assert (=> start!129662 true))

(declare-fun array_inv!37929 (array!101337) Bool)

(assert (=> start!129662 (array_inv!37929 a!2804)))

(declare-fun b!1522288 () Bool)

(assert (=> b!1522288 (= e!848797 e!848795)))

(declare-fun res!1041509 () Bool)

(assert (=> b!1522288 (=> (not res!1041509) (not e!848795))))

(assert (=> b!1522288 (= res!1041509 (= lt!659547 lt!659546))))

(assert (=> b!1522288 (= lt!659546 (Intermediate!13066 false resIndex!21 resX!21))))

(assert (=> b!1522288 (= lt!659547 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48901 a!2804) j!70) mask!2512) (select (arr!48901 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129662 res!1041505) b!1522287))

(assert (= (and b!1522287 res!1041507) b!1522280))

(assert (= (and b!1522280 res!1041504) b!1522282))

(assert (= (and b!1522282 res!1041502) b!1522289))

(assert (= (and b!1522289 res!1041506) b!1522281))

(assert (= (and b!1522281 res!1041508) b!1522285))

(assert (= (and b!1522285 res!1041511) b!1522288))

(assert (= (and b!1522288 res!1041509) b!1522283))

(assert (= (and b!1522283 res!1041510) b!1522284))

(assert (= (and b!1522284 res!1041503) b!1522286))

(declare-fun m!1405433 () Bool)

(assert (=> b!1522288 m!1405433))

(assert (=> b!1522288 m!1405433))

(declare-fun m!1405435 () Bool)

(assert (=> b!1522288 m!1405435))

(assert (=> b!1522288 m!1405435))

(assert (=> b!1522288 m!1405433))

(declare-fun m!1405437 () Bool)

(assert (=> b!1522288 m!1405437))

(assert (=> b!1522282 m!1405433))

(assert (=> b!1522282 m!1405433))

(declare-fun m!1405439 () Bool)

(assert (=> b!1522282 m!1405439))

(declare-fun m!1405441 () Bool)

(assert (=> b!1522284 m!1405441))

(declare-fun m!1405443 () Bool)

(assert (=> b!1522284 m!1405443))

(assert (=> b!1522284 m!1405443))

(declare-fun m!1405445 () Bool)

(assert (=> b!1522284 m!1405445))

(assert (=> b!1522284 m!1405445))

(assert (=> b!1522284 m!1405443))

(declare-fun m!1405447 () Bool)

(assert (=> b!1522284 m!1405447))

(declare-fun m!1405449 () Bool)

(assert (=> start!129662 m!1405449))

(declare-fun m!1405451 () Bool)

(assert (=> start!129662 m!1405451))

(declare-fun m!1405453 () Bool)

(assert (=> b!1522281 m!1405453))

(assert (=> b!1522283 m!1405433))

(assert (=> b!1522283 m!1405433))

(declare-fun m!1405455 () Bool)

(assert (=> b!1522283 m!1405455))

(declare-fun m!1405457 () Bool)

(assert (=> b!1522280 m!1405457))

(assert (=> b!1522280 m!1405457))

(declare-fun m!1405459 () Bool)

(assert (=> b!1522280 m!1405459))

(assert (=> b!1522286 m!1405433))

(assert (=> b!1522286 m!1405433))

(declare-fun m!1405461 () Bool)

(assert (=> b!1522286 m!1405461))

(declare-fun m!1405463 () Bool)

(assert (=> b!1522286 m!1405463))

(declare-fun m!1405465 () Bool)

(assert (=> b!1522286 m!1405465))

(declare-fun m!1405467 () Bool)

(assert (=> b!1522289 m!1405467))

(push 1)

(assert (not start!129662))

(assert (not b!1522286))

(assert (not b!1522280))

(assert (not b!1522283))

(assert (not b!1522282))

(assert (not b!1522288))

(assert (not b!1522284))

(assert (not b!1522289))

(assert (not b!1522281))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!159079 () Bool)

(assert (=> d!159079 (= (validKeyInArray!0 (select (arr!48901 a!2804) j!70)) (and (not (= (select (arr!48901 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48901 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1522282 d!159079))

(declare-fun d!159081 () Bool)

(assert (=> d!159081 (= (validKeyInArray!0 (select (arr!48901 a!2804) i!961)) (and (not (= (select (arr!48901 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48901 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1522280 d!159081))

(declare-fun d!159083 () Bool)

(assert (=> d!159083 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!129662 d!159083))

(declare-fun d!159087 () Bool)

(assert (=> d!159087 (= (array_inv!37929 a!2804) (bvsge (size!49451 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!129662 d!159087))

(declare-fun b!1522383 () Bool)

(declare-fun c!139968 () Bool)

(declare-fun lt!659597 () (_ BitVec 64))

(assert (=> b!1522383 (= c!139968 (= lt!659597 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!848854 () SeekEntryResult!13066)

(declare-fun e!848855 () SeekEntryResult!13066)

(assert (=> b!1522383 (= e!848854 e!848855)))

(declare-fun b!1522384 () Bool)

(declare-fun e!848856 () SeekEntryResult!13066)

(assert (=> b!1522384 (= e!848856 e!848854)))

(declare-fun lt!659598 () SeekEntryResult!13066)

(assert (=> b!1522384 (= lt!659597 (select (arr!48901 a!2804) (index!54661 lt!659598)))))

(declare-fun c!139970 () Bool)

(assert (=> b!1522384 (= c!139970 (= lt!659597 (select (arr!48901 a!2804) j!70)))))

(declare-fun d!159089 () Bool)

(declare-fun lt!659596 () SeekEntryResult!13066)

(assert (=> d!159089 (and (or (is-MissingVacant!13066 lt!659596) (not (is-Found!13066 lt!659596)) (and (bvsge (index!54660 lt!659596) #b00000000000000000000000000000000) (bvslt (index!54660 lt!659596) (size!49451 a!2804)))) (not (is-MissingVacant!13066 lt!659596)) (or (not (is-Found!13066 lt!659596)) (= (select (arr!48901 a!2804) (index!54660 lt!659596)) (select (arr!48901 a!2804) j!70))))))

(assert (=> d!159089 (= lt!659596 e!848856)))

(declare-fun c!139969 () Bool)

(assert (=> d!159089 (= c!139969 (and (is-Intermediate!13066 lt!659598) (undefined!13878 lt!659598)))))

(assert (=> d!159089 (= lt!659598 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48901 a!2804) j!70) mask!2512) (select (arr!48901 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159089 (validMask!0 mask!2512)))

(assert (=> d!159089 (= (seekEntry!0 (select (arr!48901 a!2804) j!70) a!2804 mask!2512) lt!659596)))

(declare-fun b!1522385 () Bool)

(assert (=> b!1522385 (= e!848855 (MissingZero!13066 (index!54661 lt!659598)))))

(declare-fun b!1522386 () Bool)

(assert (=> b!1522386 (= e!848854 (Found!13066 (index!54661 lt!659598)))))

(declare-fun b!1522387 () Bool)

(declare-fun lt!659595 () SeekEntryResult!13066)

(assert (=> b!1522387 (= e!848855 (ite (is-MissingVacant!13066 lt!659595) (MissingZero!13066 (index!54662 lt!659595)) lt!659595))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101337 (_ BitVec 32)) SeekEntryResult!13066)

(assert (=> b!1522387 (= lt!659595 (seekKeyOrZeroReturnVacant!0 (x!136342 lt!659598) (index!54661 lt!659598) (index!54661 lt!659598) (select (arr!48901 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522388 () Bool)

(assert (=> b!1522388 (= e!848856 Undefined!13066)))

(assert (= (and d!159089 c!139969) b!1522388))

(assert (= (and d!159089 (not c!139969)) b!1522384))

(assert (= (and b!1522384 c!139970) b!1522386))

(assert (= (and b!1522384 (not c!139970)) b!1522383))

(assert (= (and b!1522383 c!139968) b!1522385))

(assert (= (and b!1522383 (not c!139968)) b!1522387))

(declare-fun m!1405505 () Bool)

(assert (=> b!1522384 m!1405505))

(declare-fun m!1405509 () Bool)

(assert (=> d!159089 m!1405509))

(assert (=> d!159089 m!1405433))

(assert (=> d!159089 m!1405435))

(assert (=> d!159089 m!1405435))

(assert (=> d!159089 m!1405433))

(assert (=> d!159089 m!1405437))

(assert (=> d!159089 m!1405449))

(assert (=> b!1522387 m!1405433))

(declare-fun m!1405513 () Bool)

(assert (=> b!1522387 m!1405513))

(assert (=> b!1522286 d!159089))

(declare-fun b!1522430 () Bool)

(declare-fun e!848886 () Bool)

(declare-fun call!68391 () Bool)

(assert (=> b!1522430 (= e!848886 call!68391)))

(declare-fun b!1522431 () Bool)

(declare-fun e!848885 () Bool)

(assert (=> b!1522431 (= e!848886 e!848885)))

(declare-fun lt!659609 () (_ BitVec 64))

(assert (=> b!1522431 (= lt!659609 (select (arr!48901 a!2804) j!70))))

(declare-fun lt!659611 () Unit!50916)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101337 (_ BitVec 64) (_ BitVec 32)) Unit!50916)

(assert (=> b!1522431 (= lt!659611 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659609 j!70))))

(declare-fun arrayContainsKey!0 (array!101337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1522431 (arrayContainsKey!0 a!2804 lt!659609 #b00000000000000000000000000000000)))

(declare-fun lt!659610 () Unit!50916)

(assert (=> b!1522431 (= lt!659610 lt!659611)))

(declare-fun res!1041560 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101337 (_ BitVec 32)) SeekEntryResult!13066)

(assert (=> b!1522431 (= res!1041560 (= (seekEntryOrOpen!0 (select (arr!48901 a!2804) j!70) a!2804 mask!2512) (Found!13066 j!70)))))

(assert (=> b!1522431 (=> (not res!1041560) (not e!848885))))

(declare-fun bm!68388 () Bool)

(assert (=> bm!68388 (= call!68391 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1522432 () Bool)

(declare-fun e!848887 () Bool)

(assert (=> b!1522432 (= e!848887 e!848886)))

(declare-fun c!139982 () Bool)

(assert (=> b!1522432 (= c!139982 (validKeyInArray!0 (select (arr!48901 a!2804) j!70)))))

(declare-fun d!159105 () Bool)

(declare-fun res!1041559 () Bool)

(assert (=> d!159105 (=> res!1041559 e!848887)))

(assert (=> d!159105 (= res!1041559 (bvsge j!70 (size!49451 a!2804)))))

(assert (=> d!159105 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!848887)))

(declare-fun b!1522433 () Bool)

(assert (=> b!1522433 (= e!848885 call!68391)))

(assert (= (and d!159105 (not res!1041559)) b!1522432))

(assert (= (and b!1522432 c!139982) b!1522431))

(assert (= (and b!1522432 (not c!139982)) b!1522430))

(assert (= (and b!1522431 res!1041560) b!1522433))

(assert (= (or b!1522433 b!1522430) bm!68388))

(assert (=> b!1522431 m!1405433))

(declare-fun m!1405523 () Bool)

(assert (=> b!1522431 m!1405523))

(declare-fun m!1405525 () Bool)

(assert (=> b!1522431 m!1405525))

(assert (=> b!1522431 m!1405433))

(declare-fun m!1405527 () Bool)

(assert (=> b!1522431 m!1405527))

(declare-fun m!1405529 () Bool)

(assert (=> bm!68388 m!1405529))

(assert (=> b!1522432 m!1405433))

(assert (=> b!1522432 m!1405433))

(assert (=> b!1522432 m!1405439))

(assert (=> b!1522286 d!159105))

(declare-fun d!159109 () Bool)

(assert (=> d!159109 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!659616 () Unit!50916)

(declare-fun choose!38 (array!101337 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50916)

(assert (=> d!159109 (= lt!659616 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159109 (validMask!0 mask!2512)))

(assert (=> d!159109 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!659616)))

(declare-fun bs!43697 () Bool)

(assert (= bs!43697 d!159109))

(assert (=> bs!43697 m!1405463))

(declare-fun m!1405539 () Bool)

(assert (=> bs!43697 m!1405539))

(assert (=> bs!43697 m!1405449))

(assert (=> b!1522286 d!159109))

(declare-fun b!1522465 () Bool)

(declare-fun e!848907 () Bool)

(declare-fun call!68394 () Bool)

(assert (=> b!1522465 (= e!848907 call!68394)))

(declare-fun bm!68391 () Bool)

(declare-fun c!139994 () Bool)

(assert (=> bm!68391 (= call!68394 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139994 (Cons!35380 (select (arr!48901 a!2804) #b00000000000000000000000000000000) Nil!35381) Nil!35381)))))

(declare-fun d!159113 () Bool)

(declare-fun res!1041573 () Bool)

(declare-fun e!848908 () Bool)

(assert (=> d!159113 (=> res!1041573 e!848908)))

(assert (=> d!159113 (= res!1041573 (bvsge #b00000000000000000000000000000000 (size!49451 a!2804)))))

(assert (=> d!159113 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35381) e!848908)))

(declare-fun b!1522466 () Bool)

(declare-fun e!848909 () Bool)

(assert (=> b!1522466 (= e!848908 e!848909)))

(declare-fun res!1041571 () Bool)

(assert (=> b!1522466 (=> (not res!1041571) (not e!848909))))

(declare-fun e!848910 () Bool)

(assert (=> b!1522466 (= res!1041571 (not e!848910))))

(declare-fun res!1041572 () Bool)

(assert (=> b!1522466 (=> (not res!1041572) (not e!848910))))

(assert (=> b!1522466 (= res!1041572 (validKeyInArray!0 (select (arr!48901 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1522467 () Bool)

(assert (=> b!1522467 (= e!848909 e!848907)))

(assert (=> b!1522467 (= c!139994 (validKeyInArray!0 (select (arr!48901 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1522468 () Bool)

(declare-fun contains!9987 (List!35384 (_ BitVec 64)) Bool)

(assert (=> b!1522468 (= e!848910 (contains!9987 Nil!35381 (select (arr!48901 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1522469 () Bool)

(assert (=> b!1522469 (= e!848907 call!68394)))

(assert (= (and d!159113 (not res!1041573)) b!1522466))

(assert (= (and b!1522466 res!1041572) b!1522468))

(assert (= (and b!1522466 res!1041571) b!1522467))

(assert (= (and b!1522467 c!139994) b!1522465))

(assert (= (and b!1522467 (not c!139994)) b!1522469))

(assert (= (or b!1522465 b!1522469) bm!68391))

(declare-fun m!1405541 () Bool)

(assert (=> bm!68391 m!1405541))

(declare-fun m!1405543 () Bool)

(assert (=> bm!68391 m!1405543))

(assert (=> b!1522466 m!1405541))

(assert (=> b!1522466 m!1405541))

(declare-fun m!1405545 () Bool)

(assert (=> b!1522466 m!1405545))

(assert (=> b!1522467 m!1405541))

(assert (=> b!1522467 m!1405541))

(assert (=> b!1522467 m!1405545))

(assert (=> b!1522468 m!1405541))

(assert (=> b!1522468 m!1405541))

(declare-fun m!1405547 () Bool)

(assert (=> b!1522468 m!1405547))

(assert (=> b!1522281 d!159113))

(declare-fun b!1522528 () Bool)

(declare-fun e!848949 () Bool)

(declare-fun e!848948 () Bool)

(assert (=> b!1522528 (= e!848949 e!848948)))

(declare-fun res!1041596 () Bool)

(declare-fun lt!659660 () SeekEntryResult!13066)

(assert (=> b!1522528 (= res!1041596 (and (is-Intermediate!13066 lt!659660) (not (undefined!13878 lt!659660)) (bvslt (x!136342 lt!659660) #b01111111111111111111111111111110) (bvsge (x!136342 lt!659660) #b00000000000000000000000000000000) (bvsge (x!136342 lt!659660) #b00000000000000000000000000000000)))))

(assert (=> b!1522528 (=> (not res!1041596) (not e!848948))))

(declare-fun b!1522529 () Bool)

(assert (=> b!1522529 (and (bvsge (index!54661 lt!659660) #b00000000000000000000000000000000) (bvslt (index!54661 lt!659660) (size!49451 (array!101338 (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49451 a!2804)))))))

(declare-fun res!1041594 () Bool)

(assert (=> b!1522529 (= res!1041594 (= (select (arr!48901 (array!101338 (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49451 a!2804))) (index!54661 lt!659660)) (select (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(declare-fun e!848946 () Bool)

(assert (=> b!1522529 (=> res!1041594 e!848946)))

(assert (=> b!1522529 (= e!848948 e!848946)))

(declare-fun b!1522530 () Bool)

(assert (=> b!1522530 (and (bvsge (index!54661 lt!659660) #b00000000000000000000000000000000) (bvslt (index!54661 lt!659660) (size!49451 (array!101338 (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49451 a!2804)))))))

(assert (=> b!1522530 (= e!848946 (= (select (arr!48901 (array!101338 (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49451 a!2804))) (index!54661 lt!659660)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1522532 () Bool)

(declare-fun e!848950 () SeekEntryResult!13066)

(declare-fun e!848947 () SeekEntryResult!13066)

(assert (=> b!1522532 (= e!848950 e!848947)))

(declare-fun lt!659661 () (_ BitVec 64))

(declare-fun c!140015 () Bool)

(assert (=> b!1522532 (= c!140015 (or (= lt!659661 (select (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!659661 lt!659661) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1522533 () Bool)

(assert (=> b!1522533 (and (bvsge (index!54661 lt!659660) #b00000000000000000000000000000000) (bvslt (index!54661 lt!659660) (size!49451 (array!101338 (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49451 a!2804)))))))

(declare-fun res!1041595 () Bool)

(assert (=> b!1522533 (= res!1041595 (= (select (arr!48901 (array!101338 (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49451 a!2804))) (index!54661 lt!659660)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522533 (=> res!1041595 e!848946)))

(declare-fun b!1522534 () Bool)

(assert (=> b!1522534 (= e!848950 (Intermediate!13066 true (toIndex!0 (select (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1522535 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1522535 (= e!848947 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101338 (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49451 a!2804)) mask!2512))))

(declare-fun b!1522536 () Bool)

(assert (=> b!1522536 (= e!848947 (Intermediate!13066 false (toIndex!0 (select (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1522531 () Bool)

(assert (=> b!1522531 (= e!848949 (bvsge (x!136342 lt!659660) #b01111111111111111111111111111110))))

(declare-fun d!159117 () Bool)

(assert (=> d!159117 e!848949))

(declare-fun c!140016 () Bool)

(assert (=> d!159117 (= c!140016 (and (is-Intermediate!13066 lt!659660) (undefined!13878 lt!659660)))))

(assert (=> d!159117 (= lt!659660 e!848950)))

(declare-fun c!140014 () Bool)

(assert (=> d!159117 (= c!140014 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159117 (= lt!659661 (select (arr!48901 (array!101338 (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49451 a!2804))) (toIndex!0 (select (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!159117 (validMask!0 mask!2512)))

(assert (=> d!159117 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101338 (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49451 a!2804)) mask!2512) lt!659660)))

(assert (= (and d!159117 c!140014) b!1522534))

(assert (= (and d!159117 (not c!140014)) b!1522532))

(assert (= (and b!1522532 c!140015) b!1522536))

(assert (= (and b!1522532 (not c!140015)) b!1522535))

(assert (= (and d!159117 c!140016) b!1522531))

(assert (= (and d!159117 (not c!140016)) b!1522528))

(assert (= (and b!1522528 res!1041596) b!1522529))

(assert (= (and b!1522529 (not res!1041594)) b!1522533))

(assert (= (and b!1522533 (not res!1041595)) b!1522530))

(declare-fun m!1405589 () Bool)

(assert (=> b!1522530 m!1405589))

(assert (=> b!1522529 m!1405589))

(assert (=> b!1522535 m!1405445))

(declare-fun m!1405591 () Bool)

(assert (=> b!1522535 m!1405591))

(assert (=> b!1522535 m!1405591))

(assert (=> b!1522535 m!1405443))

(declare-fun m!1405593 () Bool)

(assert (=> b!1522535 m!1405593))

(assert (=> d!159117 m!1405445))

(declare-fun m!1405595 () Bool)

(assert (=> d!159117 m!1405595))

(assert (=> d!159117 m!1405449))

(assert (=> b!1522533 m!1405589))

(assert (=> b!1522284 d!159117))

(declare-fun d!159135 () Bool)

(declare-fun lt!659674 () (_ BitVec 32))

(declare-fun lt!659673 () (_ BitVec 32))

(assert (=> d!159135 (= lt!659674 (bvmul (bvxor lt!659673 (bvlshr lt!659673 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159135 (= lt!659673 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159135 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1041597 (let ((h!36804 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136348 (bvmul (bvxor h!36804 (bvlshr h!36804 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136348 (bvlshr x!136348 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1041597 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1041597 #b00000000000000000000000000000000))))))

(assert (=> d!159135 (= (toIndex!0 (select (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!659674 (bvlshr lt!659674 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1522284 d!159135))

(declare-fun b!1522550 () Bool)

(declare-fun e!848962 () Bool)

(declare-fun e!848961 () Bool)

(assert (=> b!1522550 (= e!848962 e!848961)))

(declare-fun res!1041605 () Bool)

(declare-fun lt!659675 () SeekEntryResult!13066)

(assert (=> b!1522550 (= res!1041605 (and (is-Intermediate!13066 lt!659675) (not (undefined!13878 lt!659675)) (bvslt (x!136342 lt!659675) #b01111111111111111111111111111110) (bvsge (x!136342 lt!659675) #b00000000000000000000000000000000) (bvsge (x!136342 lt!659675) #b00000000000000000000000000000000)))))

(assert (=> b!1522550 (=> (not res!1041605) (not e!848961))))

(declare-fun b!1522551 () Bool)

(assert (=> b!1522551 (and (bvsge (index!54661 lt!659675) #b00000000000000000000000000000000) (bvslt (index!54661 lt!659675) (size!49451 a!2804)))))

(declare-fun res!1041603 () Bool)

(assert (=> b!1522551 (= res!1041603 (= (select (arr!48901 a!2804) (index!54661 lt!659675)) (select (arr!48901 a!2804) j!70)))))

(declare-fun e!848959 () Bool)

(assert (=> b!1522551 (=> res!1041603 e!848959)))

(assert (=> b!1522551 (= e!848961 e!848959)))

(declare-fun b!1522552 () Bool)

(assert (=> b!1522552 (and (bvsge (index!54661 lt!659675) #b00000000000000000000000000000000) (bvslt (index!54661 lt!659675) (size!49451 a!2804)))))

(assert (=> b!1522552 (= e!848959 (= (select (arr!48901 a!2804) (index!54661 lt!659675)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1522554 () Bool)

(declare-fun e!848963 () SeekEntryResult!13066)

(declare-fun e!848960 () SeekEntryResult!13066)

(assert (=> b!1522554 (= e!848963 e!848960)))

(declare-fun lt!659676 () (_ BitVec 64))

(declare-fun c!140022 () Bool)

(assert (=> b!1522554 (= c!140022 (or (= lt!659676 (select (arr!48901 a!2804) j!70)) (= (bvadd lt!659676 lt!659676) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1522555 () Bool)

(assert (=> b!1522555 (and (bvsge (index!54661 lt!659675) #b00000000000000000000000000000000) (bvslt (index!54661 lt!659675) (size!49451 a!2804)))))

(declare-fun res!1041604 () Bool)

(assert (=> b!1522555 (= res!1041604 (= (select (arr!48901 a!2804) (index!54661 lt!659675)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522555 (=> res!1041604 e!848959)))

(declare-fun b!1522556 () Bool)

(assert (=> b!1522556 (= e!848963 (Intermediate!13066 true (toIndex!0 (select (arr!48901 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1522557 () Bool)

(assert (=> b!1522557 (= e!848960 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48901 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48901 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522558 () Bool)

(assert (=> b!1522558 (= e!848960 (Intermediate!13066 false (toIndex!0 (select (arr!48901 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1522553 () Bool)

(assert (=> b!1522553 (= e!848962 (bvsge (x!136342 lt!659675) #b01111111111111111111111111111110))))

(declare-fun d!159145 () Bool)

(assert (=> d!159145 e!848962))

(declare-fun c!140023 () Bool)

(assert (=> d!159145 (= c!140023 (and (is-Intermediate!13066 lt!659675) (undefined!13878 lt!659675)))))

(assert (=> d!159145 (= lt!659675 e!848963)))

(declare-fun c!140021 () Bool)

(assert (=> d!159145 (= c!140021 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159145 (= lt!659676 (select (arr!48901 a!2804) (toIndex!0 (select (arr!48901 a!2804) j!70) mask!2512)))))

(assert (=> d!159145 (validMask!0 mask!2512)))

(assert (=> d!159145 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48901 a!2804) j!70) mask!2512) (select (arr!48901 a!2804) j!70) a!2804 mask!2512) lt!659675)))

(assert (= (and d!159145 c!140021) b!1522556))

(assert (= (and d!159145 (not c!140021)) b!1522554))

(assert (= (and b!1522554 c!140022) b!1522558))

(assert (= (and b!1522554 (not c!140022)) b!1522557))

(assert (= (and d!159145 c!140023) b!1522553))

(assert (= (and d!159145 (not c!140023)) b!1522550))

(assert (= (and b!1522550 res!1041605) b!1522551))

(assert (= (and b!1522551 (not res!1041603)) b!1522555))

(assert (= (and b!1522555 (not res!1041604)) b!1522552))

(declare-fun m!1405613 () Bool)

(assert (=> b!1522552 m!1405613))

(assert (=> b!1522551 m!1405613))

(assert (=> b!1522557 m!1405435))

(declare-fun m!1405615 () Bool)

(assert (=> b!1522557 m!1405615))

(assert (=> b!1522557 m!1405615))

(assert (=> b!1522557 m!1405433))

(declare-fun m!1405617 () Bool)

(assert (=> b!1522557 m!1405617))

(assert (=> d!159145 m!1405435))

(declare-fun m!1405619 () Bool)

(assert (=> d!159145 m!1405619))

(assert (=> d!159145 m!1405449))

(assert (=> b!1522555 m!1405613))

(assert (=> b!1522288 d!159145))

(declare-fun d!159147 () Bool)

(declare-fun lt!659678 () (_ BitVec 32))

(declare-fun lt!659677 () (_ BitVec 32))

(assert (=> d!159147 (= lt!659678 (bvmul (bvxor lt!659677 (bvlshr lt!659677 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159147 (= lt!659677 ((_ extract 31 0) (bvand (bvxor (select (arr!48901 a!2804) j!70) (bvlshr (select (arr!48901 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159147 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1041597 (let ((h!36804 ((_ extract 31 0) (bvand (bvxor (select (arr!48901 a!2804) j!70) (bvlshr (select (arr!48901 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136348 (bvmul (bvxor h!36804 (bvlshr h!36804 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136348 (bvlshr x!136348 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1041597 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1041597 #b00000000000000000000000000000000))))))

(assert (=> d!159147 (= (toIndex!0 (select (arr!48901 a!2804) j!70) mask!2512) (bvand (bvxor lt!659678 (bvlshr lt!659678 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1522288 d!159147))

(declare-fun b!1522559 () Bool)

(declare-fun e!848967 () Bool)

(declare-fun e!848966 () Bool)

(assert (=> b!1522559 (= e!848967 e!848966)))

(declare-fun res!1041608 () Bool)

(declare-fun lt!659679 () SeekEntryResult!13066)

(assert (=> b!1522559 (= res!1041608 (and (is-Intermediate!13066 lt!659679) (not (undefined!13878 lt!659679)) (bvslt (x!136342 lt!659679) #b01111111111111111111111111111110) (bvsge (x!136342 lt!659679) #b00000000000000000000000000000000) (bvsge (x!136342 lt!659679) x!534)))))

(assert (=> b!1522559 (=> (not res!1041608) (not e!848966))))

(declare-fun b!1522560 () Bool)

(assert (=> b!1522560 (and (bvsge (index!54661 lt!659679) #b00000000000000000000000000000000) (bvslt (index!54661 lt!659679) (size!49451 a!2804)))))

(declare-fun res!1041606 () Bool)

(assert (=> b!1522560 (= res!1041606 (= (select (arr!48901 a!2804) (index!54661 lt!659679)) (select (arr!48901 a!2804) j!70)))))

(declare-fun e!848964 () Bool)

(assert (=> b!1522560 (=> res!1041606 e!848964)))

(assert (=> b!1522560 (= e!848966 e!848964)))

(declare-fun b!1522561 () Bool)

(assert (=> b!1522561 (and (bvsge (index!54661 lt!659679) #b00000000000000000000000000000000) (bvslt (index!54661 lt!659679) (size!49451 a!2804)))))

(assert (=> b!1522561 (= e!848964 (= (select (arr!48901 a!2804) (index!54661 lt!659679)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1522563 () Bool)

(declare-fun e!848968 () SeekEntryResult!13066)

(declare-fun e!848965 () SeekEntryResult!13066)

(assert (=> b!1522563 (= e!848968 e!848965)))

(declare-fun c!140025 () Bool)

(declare-fun lt!659680 () (_ BitVec 64))

(assert (=> b!1522563 (= c!140025 (or (= lt!659680 (select (arr!48901 a!2804) j!70)) (= (bvadd lt!659680 lt!659680) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1522564 () Bool)

(assert (=> b!1522564 (and (bvsge (index!54661 lt!659679) #b00000000000000000000000000000000) (bvslt (index!54661 lt!659679) (size!49451 a!2804)))))

(declare-fun res!1041607 () Bool)

(assert (=> b!1522564 (= res!1041607 (= (select (arr!48901 a!2804) (index!54661 lt!659679)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522564 (=> res!1041607 e!848964)))

(declare-fun b!1522565 () Bool)

(assert (=> b!1522565 (= e!848968 (Intermediate!13066 true index!487 x!534))))

(declare-fun b!1522566 () Bool)

(assert (=> b!1522566 (= e!848965 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48901 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522567 () Bool)

(assert (=> b!1522567 (= e!848965 (Intermediate!13066 false index!487 x!534))))

(declare-fun b!1522562 () Bool)

(assert (=> b!1522562 (= e!848967 (bvsge (x!136342 lt!659679) #b01111111111111111111111111111110))))

(declare-fun d!159149 () Bool)

(assert (=> d!159149 e!848967))

(declare-fun c!140026 () Bool)

(assert (=> d!159149 (= c!140026 (and (is-Intermediate!13066 lt!659679) (undefined!13878 lt!659679)))))

(assert (=> d!159149 (= lt!659679 e!848968)))

(declare-fun c!140024 () Bool)

(assert (=> d!159149 (= c!140024 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!159149 (= lt!659680 (select (arr!48901 a!2804) index!487))))

(assert (=> d!159149 (validMask!0 mask!2512)))

(assert (=> d!159149 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48901 a!2804) j!70) a!2804 mask!2512) lt!659679)))

(assert (= (and d!159149 c!140024) b!1522565))

(assert (= (and d!159149 (not c!140024)) b!1522563))

(assert (= (and b!1522563 c!140025) b!1522567))

(assert (= (and b!1522563 (not c!140025)) b!1522566))

(assert (= (and d!159149 c!140026) b!1522562))

(assert (= (and d!159149 (not c!140026)) b!1522559))

(assert (= (and b!1522559 res!1041608) b!1522560))

(assert (= (and b!1522560 (not res!1041606)) b!1522564))

(assert (= (and b!1522564 (not res!1041607)) b!1522561))

(declare-fun m!1405621 () Bool)

(assert (=> b!1522561 m!1405621))

(assert (=> b!1522560 m!1405621))

(declare-fun m!1405623 () Bool)

(assert (=> b!1522566 m!1405623))

(assert (=> b!1522566 m!1405623))

(assert (=> b!1522566 m!1405433))

(declare-fun m!1405625 () Bool)

(assert (=> b!1522566 m!1405625))

(declare-fun m!1405627 () Bool)

(assert (=> d!159149 m!1405627))

(assert (=> d!159149 m!1405449))

(assert (=> b!1522564 m!1405621))

(assert (=> b!1522283 d!159149))

(declare-fun b!1522568 () Bool)

(declare-fun e!848970 () Bool)

(declare-fun call!68400 () Bool)

(assert (=> b!1522568 (= e!848970 call!68400)))

(declare-fun b!1522569 () Bool)

(declare-fun e!848969 () Bool)

(assert (=> b!1522569 (= e!848970 e!848969)))

(declare-fun lt!659681 () (_ BitVec 64))

(assert (=> b!1522569 (= lt!659681 (select (arr!48901 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!659683 () Unit!50916)

(assert (=> b!1522569 (= lt!659683 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659681 #b00000000000000000000000000000000))))

(assert (=> b!1522569 (arrayContainsKey!0 a!2804 lt!659681 #b00000000000000000000000000000000)))

(declare-fun lt!659682 () Unit!50916)

(assert (=> b!1522569 (= lt!659682 lt!659683)))

(declare-fun res!1041610 () Bool)

(assert (=> b!1522569 (= res!1041610 (= (seekEntryOrOpen!0 (select (arr!48901 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13066 #b00000000000000000000000000000000)))))

(assert (=> b!1522569 (=> (not res!1041610) (not e!848969))))

(declare-fun bm!68397 () Bool)

(assert (=> bm!68397 (= call!68400 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1522570 () Bool)

(declare-fun e!848971 () Bool)

(assert (=> b!1522570 (= e!848971 e!848970)))

(declare-fun c!140027 () Bool)

(assert (=> b!1522570 (= c!140027 (validKeyInArray!0 (select (arr!48901 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!159151 () Bool)

(declare-fun res!1041609 () Bool)

(assert (=> d!159151 (=> res!1041609 e!848971)))

(assert (=> d!159151 (= res!1041609 (bvsge #b00000000000000000000000000000000 (size!49451 a!2804)))))

(assert (=> d!159151 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!848971)))

(declare-fun b!1522571 () Bool)

(assert (=> b!1522571 (= e!848969 call!68400)))

(assert (= (and d!159151 (not res!1041609)) b!1522570))

(assert (= (and b!1522570 c!140027) b!1522569))

(assert (= (and b!1522570 (not c!140027)) b!1522568))

(assert (= (and b!1522569 res!1041610) b!1522571))

(assert (= (or b!1522571 b!1522568) bm!68397))

(assert (=> b!1522569 m!1405541))

(declare-fun m!1405629 () Bool)

(assert (=> b!1522569 m!1405629))

(declare-fun m!1405631 () Bool)

(assert (=> b!1522569 m!1405631))

(assert (=> b!1522569 m!1405541))

(declare-fun m!1405633 () Bool)

(assert (=> b!1522569 m!1405633))

(declare-fun m!1405635 () Bool)

(assert (=> bm!68397 m!1405635))

(assert (=> b!1522570 m!1405541))

(assert (=> b!1522570 m!1405541))

(assert (=> b!1522570 m!1405545))

(assert (=> b!1522289 d!159151))

(push 1)

(assert (not b!1522468))

(assert (not b!1522535))

(assert (not bm!68397))

(assert (not d!159117))

(assert (not b!1522570))

(assert (not d!159089))

(assert (not bm!68391))

(assert (not d!159145))

(assert (not b!1522387))

(assert (not b!1522557))

(assert (not b!1522431))

(assert (not bm!68388))

(assert (not b!1522432))

(assert (not b!1522569))

(assert (not b!1522566))

(assert (not d!159149))

(assert (not b!1522466))

(assert (not b!1522467))

(assert (not d!159109))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!159191 () Bool)

(assert (=> d!159191 (= (validKeyInArray!0 (select (arr!48901 a!2804) #b00000000000000000000000000000000)) (and (not (= (select (arr!48901 a!2804) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48901 a!2804) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1522466 d!159191))

(assert (=> d!159149 d!159083))

(declare-fun b!1522668 () Bool)

(declare-fun e!849035 () Bool)

(declare-fun e!849034 () Bool)

(assert (=> b!1522668 (= e!849035 e!849034)))

(declare-fun res!1041643 () Bool)

(declare-fun lt!659726 () SeekEntryResult!13066)

(assert (=> b!1522668 (= res!1041643 (and (is-Intermediate!13066 lt!659726) (not (undefined!13878 lt!659726)) (bvslt (x!136342 lt!659726) #b01111111111111111111111111111110) (bvsge (x!136342 lt!659726) #b00000000000000000000000000000000) (bvsge (x!136342 lt!659726) (bvadd x!534 #b00000000000000000000000000000001))))))

(assert (=> b!1522668 (=> (not res!1041643) (not e!849034))))

(declare-fun b!1522669 () Bool)

(assert (=> b!1522669 (and (bvsge (index!54661 lt!659726) #b00000000000000000000000000000000) (bvslt (index!54661 lt!659726) (size!49451 a!2804)))))

(declare-fun res!1041641 () Bool)

(assert (=> b!1522669 (= res!1041641 (= (select (arr!48901 a!2804) (index!54661 lt!659726)) (select (arr!48901 a!2804) j!70)))))

(declare-fun e!849032 () Bool)

(assert (=> b!1522669 (=> res!1041641 e!849032)))

(assert (=> b!1522669 (= e!849034 e!849032)))

(declare-fun b!1522670 () Bool)

(assert (=> b!1522670 (and (bvsge (index!54661 lt!659726) #b00000000000000000000000000000000) (bvslt (index!54661 lt!659726) (size!49451 a!2804)))))

(assert (=> b!1522670 (= e!849032 (= (select (arr!48901 a!2804) (index!54661 lt!659726)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1522672 () Bool)

(declare-fun e!849036 () SeekEntryResult!13066)

(declare-fun e!849033 () SeekEntryResult!13066)

(assert (=> b!1522672 (= e!849036 e!849033)))

(declare-fun c!140062 () Bool)

(declare-fun lt!659727 () (_ BitVec 64))

(assert (=> b!1522672 (= c!140062 (or (= lt!659727 (select (arr!48901 a!2804) j!70)) (= (bvadd lt!659727 lt!659727) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1522673 () Bool)

(assert (=> b!1522673 (and (bvsge (index!54661 lt!659726) #b00000000000000000000000000000000) (bvslt (index!54661 lt!659726) (size!49451 a!2804)))))

(declare-fun res!1041642 () Bool)

(assert (=> b!1522673 (= res!1041642 (= (select (arr!48901 a!2804) (index!54661 lt!659726)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522673 (=> res!1041642 e!849032)))

(declare-fun b!1522674 () Bool)

(assert (=> b!1522674 (= e!849036 (Intermediate!13066 true (nextIndex!0 index!487 x!534 mask!2512) (bvadd x!534 #b00000000000000000000000000000001)))))

(declare-fun b!1522675 () Bool)

(assert (=> b!1522675 (= e!849033 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!487 x!534 mask!2512) (bvadd x!534 #b00000000000000000000000000000001) mask!2512) (select (arr!48901 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522676 () Bool)

(assert (=> b!1522676 (= e!849033 (Intermediate!13066 false (nextIndex!0 index!487 x!534 mask!2512) (bvadd x!534 #b00000000000000000000000000000001)))))

(declare-fun b!1522671 () Bool)

(assert (=> b!1522671 (= e!849035 (bvsge (x!136342 lt!659726) #b01111111111111111111111111111110))))

(declare-fun d!159193 () Bool)

(assert (=> d!159193 e!849035))

(declare-fun c!140063 () Bool)

(assert (=> d!159193 (= c!140063 (and (is-Intermediate!13066 lt!659726) (undefined!13878 lt!659726)))))

(assert (=> d!159193 (= lt!659726 e!849036)))

(declare-fun c!140061 () Bool)

(assert (=> d!159193 (= c!140061 (bvsge (bvadd x!534 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!159193 (= lt!659727 (select (arr!48901 a!2804) (nextIndex!0 index!487 x!534 mask!2512)))))

(assert (=> d!159193 (validMask!0 mask!2512)))

(assert (=> d!159193 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48901 a!2804) j!70) a!2804 mask!2512) lt!659726)))

(assert (= (and d!159193 c!140061) b!1522674))

(assert (= (and d!159193 (not c!140061)) b!1522672))

(assert (= (and b!1522672 c!140062) b!1522676))

(assert (= (and b!1522672 (not c!140062)) b!1522675))

(assert (= (and d!159193 c!140063) b!1522671))

(assert (= (and d!159193 (not c!140063)) b!1522668))

(assert (= (and b!1522668 res!1041643) b!1522669))

(assert (= (and b!1522669 (not res!1041641)) b!1522673))

(assert (= (and b!1522673 (not res!1041642)) b!1522670))

(declare-fun m!1405741 () Bool)

(assert (=> b!1522670 m!1405741))

(assert (=> b!1522669 m!1405741))

(assert (=> b!1522675 m!1405623))

(declare-fun m!1405743 () Bool)

(assert (=> b!1522675 m!1405743))

(assert (=> b!1522675 m!1405743))

(assert (=> b!1522675 m!1405433))

(declare-fun m!1405745 () Bool)

(assert (=> b!1522675 m!1405745))

(assert (=> d!159193 m!1405623))

(declare-fun m!1405747 () Bool)

(assert (=> d!159193 m!1405747))

(assert (=> d!159193 m!1405449))

(assert (=> b!1522673 m!1405741))

(assert (=> b!1522566 d!159193))

(declare-fun d!159195 () Bool)

(declare-fun lt!659730 () (_ BitVec 32))

(assert (=> d!159195 (and (bvsge lt!659730 #b00000000000000000000000000000000) (bvslt lt!659730 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!159195 (= lt!659730 (choose!52 index!487 x!534 mask!2512))))

(assert (=> d!159195 (validMask!0 mask!2512)))

(assert (=> d!159195 (= (nextIndex!0 index!487 x!534 mask!2512) lt!659730)))

(declare-fun bs!43705 () Bool)

(assert (= bs!43705 d!159195))

(declare-fun m!1405749 () Bool)

(assert (=> bs!43705 m!1405749))

(assert (=> bs!43705 m!1405449))

(assert (=> b!1522566 d!159195))

(declare-fun d!159197 () Bool)

(assert (=> d!159197 (arrayContainsKey!0 a!2804 lt!659609 #b00000000000000000000000000000000)))

(declare-fun lt!659733 () Unit!50916)

(declare-fun choose!13 (array!101337 (_ BitVec 64) (_ BitVec 32)) Unit!50916)

(assert (=> d!159197 (= lt!659733 (choose!13 a!2804 lt!659609 j!70))))

(assert (=> d!159197 (bvsge j!70 #b00000000000000000000000000000000)))

(assert (=> d!159197 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659609 j!70) lt!659733)))

(declare-fun bs!43706 () Bool)

(assert (= bs!43706 d!159197))

(assert (=> bs!43706 m!1405525))

(declare-fun m!1405751 () Bool)

(assert (=> bs!43706 m!1405751))

(assert (=> b!1522431 d!159197))

(declare-fun d!159199 () Bool)

(declare-fun res!1041648 () Bool)

(declare-fun e!849041 () Bool)

(assert (=> d!159199 (=> res!1041648 e!849041)))

(assert (=> d!159199 (= res!1041648 (= (select (arr!48901 a!2804) #b00000000000000000000000000000000) lt!659609))))

(assert (=> d!159199 (= (arrayContainsKey!0 a!2804 lt!659609 #b00000000000000000000000000000000) e!849041)))

(declare-fun b!1522681 () Bool)

(declare-fun e!849042 () Bool)

(assert (=> b!1522681 (= e!849041 e!849042)))

(declare-fun res!1041649 () Bool)

(assert (=> b!1522681 (=> (not res!1041649) (not e!849042))))

(assert (=> b!1522681 (= res!1041649 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!49451 a!2804)))))

(declare-fun b!1522682 () Bool)

(assert (=> b!1522682 (= e!849042 (arrayContainsKey!0 a!2804 lt!659609 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!159199 (not res!1041648)) b!1522681))

(assert (= (and b!1522681 res!1041649) b!1522682))

(assert (=> d!159199 m!1405541))

(declare-fun m!1405753 () Bool)

(assert (=> b!1522682 m!1405753))

(assert (=> b!1522431 d!159199))

(declare-fun b!1522695 () Bool)

(declare-fun c!140072 () Bool)

(declare-fun lt!659742 () (_ BitVec 64))

(assert (=> b!1522695 (= c!140072 (= lt!659742 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!849050 () SeekEntryResult!13066)

(declare-fun e!849049 () SeekEntryResult!13066)

(assert (=> b!1522695 (= e!849050 e!849049)))

(declare-fun d!159201 () Bool)

(declare-fun lt!659740 () SeekEntryResult!13066)

(assert (=> d!159201 (and (or (is-Undefined!13066 lt!659740) (not (is-Found!13066 lt!659740)) (and (bvsge (index!54660 lt!659740) #b00000000000000000000000000000000) (bvslt (index!54660 lt!659740) (size!49451 a!2804)))) (or (is-Undefined!13066 lt!659740) (is-Found!13066 lt!659740) (not (is-MissingZero!13066 lt!659740)) (and (bvsge (index!54659 lt!659740) #b00000000000000000000000000000000) (bvslt (index!54659 lt!659740) (size!49451 a!2804)))) (or (is-Undefined!13066 lt!659740) (is-Found!13066 lt!659740) (is-MissingZero!13066 lt!659740) (not (is-MissingVacant!13066 lt!659740)) (and (bvsge (index!54662 lt!659740) #b00000000000000000000000000000000) (bvslt (index!54662 lt!659740) (size!49451 a!2804)))) (or (is-Undefined!13066 lt!659740) (ite (is-Found!13066 lt!659740) (= (select (arr!48901 a!2804) (index!54660 lt!659740)) (select (arr!48901 a!2804) j!70)) (ite (is-MissingZero!13066 lt!659740) (= (select (arr!48901 a!2804) (index!54659 lt!659740)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!13066 lt!659740) (= (select (arr!48901 a!2804) (index!54662 lt!659740)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!849051 () SeekEntryResult!13066)

(assert (=> d!159201 (= lt!659740 e!849051)))

(declare-fun c!140071 () Bool)

(declare-fun lt!659741 () SeekEntryResult!13066)

(assert (=> d!159201 (= c!140071 (and (is-Intermediate!13066 lt!659741) (undefined!13878 lt!659741)))))

(assert (=> d!159201 (= lt!659741 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48901 a!2804) j!70) mask!2512) (select (arr!48901 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159201 (validMask!0 mask!2512)))

(assert (=> d!159201 (= (seekEntryOrOpen!0 (select (arr!48901 a!2804) j!70) a!2804 mask!2512) lt!659740)))

(declare-fun b!1522696 () Bool)

(assert (=> b!1522696 (= e!849051 e!849050)))

(assert (=> b!1522696 (= lt!659742 (select (arr!48901 a!2804) (index!54661 lt!659741)))))

(declare-fun c!140070 () Bool)

(assert (=> b!1522696 (= c!140070 (= lt!659742 (select (arr!48901 a!2804) j!70)))))

(declare-fun b!1522697 () Bool)

(assert (=> b!1522697 (= e!849049 (seekKeyOrZeroReturnVacant!0 (x!136342 lt!659741) (index!54661 lt!659741) (index!54661 lt!659741) (select (arr!48901 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522698 () Bool)

(assert (=> b!1522698 (= e!849051 Undefined!13066)))

(declare-fun b!1522699 () Bool)

(assert (=> b!1522699 (= e!849050 (Found!13066 (index!54661 lt!659741)))))

(declare-fun b!1522700 () Bool)

(assert (=> b!1522700 (= e!849049 (MissingZero!13066 (index!54661 lt!659741)))))

(assert (= (and d!159201 c!140071) b!1522698))

(assert (= (and d!159201 (not c!140071)) b!1522696))

(assert (= (and b!1522696 c!140070) b!1522699))

(assert (= (and b!1522696 (not c!140070)) b!1522695))

(assert (= (and b!1522695 c!140072) b!1522700))

(assert (= (and b!1522695 (not c!140072)) b!1522697))

(declare-fun m!1405755 () Bool)

(assert (=> d!159201 m!1405755))

(assert (=> d!159201 m!1405433))

(assert (=> d!159201 m!1405435))

(declare-fun m!1405757 () Bool)

(assert (=> d!159201 m!1405757))

(declare-fun m!1405759 () Bool)

(assert (=> d!159201 m!1405759))

(assert (=> d!159201 m!1405435))

(assert (=> d!159201 m!1405433))

(assert (=> d!159201 m!1405437))

(assert (=> d!159201 m!1405449))

(declare-fun m!1405761 () Bool)

(assert (=> b!1522696 m!1405761))

(assert (=> b!1522697 m!1405433))

(declare-fun m!1405763 () Bool)

(assert (=> b!1522697 m!1405763))

(assert (=> b!1522431 d!159201))

(declare-fun d!159203 () Bool)

(declare-fun lt!659745 () Bool)

(declare-fun content!789 (List!35384) (Set (_ BitVec 64)))

(assert (=> d!159203 (= lt!659745 (member (select (arr!48901 a!2804) #b00000000000000000000000000000000) (content!789 Nil!35381)))))

(declare-fun e!849056 () Bool)

(assert (=> d!159203 (= lt!659745 e!849056)))

(declare-fun res!1041654 () Bool)

(assert (=> d!159203 (=> (not res!1041654) (not e!849056))))

(assert (=> d!159203 (= res!1041654 (is-Cons!35380 Nil!35381))))

(assert (=> d!159203 (= (contains!9987 Nil!35381 (select (arr!48901 a!2804) #b00000000000000000000000000000000)) lt!659745)))

(declare-fun b!1522705 () Bool)

(declare-fun e!849057 () Bool)

(assert (=> b!1522705 (= e!849056 e!849057)))

(declare-fun res!1041655 () Bool)

(assert (=> b!1522705 (=> res!1041655 e!849057)))

(assert (=> b!1522705 (= res!1041655 (= (h!36801 Nil!35381) (select (arr!48901 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1522706 () Bool)

(assert (=> b!1522706 (= e!849057 (contains!9987 (t!50078 Nil!35381) (select (arr!48901 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!159203 res!1041654) b!1522705))

(assert (= (and b!1522705 (not res!1041655)) b!1522706))

(declare-fun m!1405765 () Bool)

(assert (=> d!159203 m!1405765))

(assert (=> d!159203 m!1405541))

(declare-fun m!1405767 () Bool)

(assert (=> d!159203 m!1405767))

(assert (=> b!1522706 m!1405541))

(declare-fun m!1405769 () Bool)

(assert (=> b!1522706 m!1405769))

(assert (=> b!1522468 d!159203))

(declare-fun d!159205 () Bool)

(assert (=> d!159205 (arrayContainsKey!0 a!2804 lt!659681 #b00000000000000000000000000000000)))

(declare-fun lt!659746 () Unit!50916)

(assert (=> d!159205 (= lt!659746 (choose!13 a!2804 lt!659681 #b00000000000000000000000000000000))))

(assert (=> d!159205 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!159205 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659681 #b00000000000000000000000000000000) lt!659746)))

(declare-fun bs!43707 () Bool)

(assert (= bs!43707 d!159205))

(assert (=> bs!43707 m!1405631))

(declare-fun m!1405771 () Bool)

(assert (=> bs!43707 m!1405771))

(assert (=> b!1522569 d!159205))

(declare-fun d!159207 () Bool)

(declare-fun res!1041656 () Bool)

(declare-fun e!849058 () Bool)

(assert (=> d!159207 (=> res!1041656 e!849058)))

(assert (=> d!159207 (= res!1041656 (= (select (arr!48901 a!2804) #b00000000000000000000000000000000) lt!659681))))

(assert (=> d!159207 (= (arrayContainsKey!0 a!2804 lt!659681 #b00000000000000000000000000000000) e!849058)))

(declare-fun b!1522707 () Bool)

(declare-fun e!849059 () Bool)

(assert (=> b!1522707 (= e!849058 e!849059)))

(declare-fun res!1041657 () Bool)

(assert (=> b!1522707 (=> (not res!1041657) (not e!849059))))

(assert (=> b!1522707 (= res!1041657 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!49451 a!2804)))))

(declare-fun b!1522708 () Bool)

(assert (=> b!1522708 (= e!849059 (arrayContainsKey!0 a!2804 lt!659681 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!159207 (not res!1041656)) b!1522707))

(assert (= (and b!1522707 res!1041657) b!1522708))

(assert (=> d!159207 m!1405541))

(declare-fun m!1405773 () Bool)

(assert (=> b!1522708 m!1405773))

(assert (=> b!1522569 d!159207))

(declare-fun b!1522709 () Bool)

(declare-fun c!140075 () Bool)

(declare-fun lt!659749 () (_ BitVec 64))

(assert (=> b!1522709 (= c!140075 (= lt!659749 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!849061 () SeekEntryResult!13066)

(declare-fun e!849060 () SeekEntryResult!13066)

(assert (=> b!1522709 (= e!849061 e!849060)))

(declare-fun d!159209 () Bool)

(declare-fun lt!659747 () SeekEntryResult!13066)

(assert (=> d!159209 (and (or (is-Undefined!13066 lt!659747) (not (is-Found!13066 lt!659747)) (and (bvsge (index!54660 lt!659747) #b00000000000000000000000000000000) (bvslt (index!54660 lt!659747) (size!49451 a!2804)))) (or (is-Undefined!13066 lt!659747) (is-Found!13066 lt!659747) (not (is-MissingZero!13066 lt!659747)) (and (bvsge (index!54659 lt!659747) #b00000000000000000000000000000000) (bvslt (index!54659 lt!659747) (size!49451 a!2804)))) (or (is-Undefined!13066 lt!659747) (is-Found!13066 lt!659747) (is-MissingZero!13066 lt!659747) (not (is-MissingVacant!13066 lt!659747)) (and (bvsge (index!54662 lt!659747) #b00000000000000000000000000000000) (bvslt (index!54662 lt!659747) (size!49451 a!2804)))) (or (is-Undefined!13066 lt!659747) (ite (is-Found!13066 lt!659747) (= (select (arr!48901 a!2804) (index!54660 lt!659747)) (select (arr!48901 a!2804) #b00000000000000000000000000000000)) (ite (is-MissingZero!13066 lt!659747) (= (select (arr!48901 a!2804) (index!54659 lt!659747)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!13066 lt!659747) (= (select (arr!48901 a!2804) (index!54662 lt!659747)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!849062 () SeekEntryResult!13066)

(assert (=> d!159209 (= lt!659747 e!849062)))

(declare-fun c!140074 () Bool)

(declare-fun lt!659748 () SeekEntryResult!13066)

(assert (=> d!159209 (= c!140074 (and (is-Intermediate!13066 lt!659748) (undefined!13878 lt!659748)))))

(assert (=> d!159209 (= lt!659748 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48901 a!2804) #b00000000000000000000000000000000) mask!2512) (select (arr!48901 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512))))

(assert (=> d!159209 (validMask!0 mask!2512)))

(assert (=> d!159209 (= (seekEntryOrOpen!0 (select (arr!48901 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) lt!659747)))

(declare-fun b!1522710 () Bool)

(assert (=> b!1522710 (= e!849062 e!849061)))

(assert (=> b!1522710 (= lt!659749 (select (arr!48901 a!2804) (index!54661 lt!659748)))))

(declare-fun c!140073 () Bool)

(assert (=> b!1522710 (= c!140073 (= lt!659749 (select (arr!48901 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1522711 () Bool)

(assert (=> b!1522711 (= e!849060 (seekKeyOrZeroReturnVacant!0 (x!136342 lt!659748) (index!54661 lt!659748) (index!54661 lt!659748) (select (arr!48901 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512))))

(declare-fun b!1522712 () Bool)

(assert (=> b!1522712 (= e!849062 Undefined!13066)))

(declare-fun b!1522713 () Bool)

(assert (=> b!1522713 (= e!849061 (Found!13066 (index!54661 lt!659748)))))

(declare-fun b!1522714 () Bool)

(assert (=> b!1522714 (= e!849060 (MissingZero!13066 (index!54661 lt!659748)))))

(assert (= (and d!159209 c!140074) b!1522712))

(assert (= (and d!159209 (not c!140074)) b!1522710))

(assert (= (and b!1522710 c!140073) b!1522713))

(assert (= (and b!1522710 (not c!140073)) b!1522709))

(assert (= (and b!1522709 c!140075) b!1522714))

(assert (= (and b!1522709 (not c!140075)) b!1522711))

(declare-fun m!1405775 () Bool)

(assert (=> d!159209 m!1405775))

(assert (=> d!159209 m!1405541))

(declare-fun m!1405777 () Bool)

(assert (=> d!159209 m!1405777))

(declare-fun m!1405779 () Bool)

(assert (=> d!159209 m!1405779))

(declare-fun m!1405781 () Bool)

(assert (=> d!159209 m!1405781))

(assert (=> d!159209 m!1405777))

(assert (=> d!159209 m!1405541))

(declare-fun m!1405783 () Bool)

(assert (=> d!159209 m!1405783))

(assert (=> d!159209 m!1405449))

(declare-fun m!1405785 () Bool)

(assert (=> b!1522710 m!1405785))

(assert (=> b!1522711 m!1405541))

(declare-fun m!1405787 () Bool)

(assert (=> b!1522711 m!1405787))

(assert (=> b!1522569 d!159209))

(assert (=> b!1522467 d!159191))

(assert (=> b!1522570 d!159191))

(declare-fun b!1522715 () Bool)

(declare-fun e!849064 () Bool)

(declare-fun call!68404 () Bool)

(assert (=> b!1522715 (= e!849064 call!68404)))

(declare-fun b!1522716 () Bool)

(declare-fun e!849063 () Bool)

(assert (=> b!1522716 (= e!849064 e!849063)))

(declare-fun lt!659750 () (_ BitVec 64))

(assert (=> b!1522716 (= lt!659750 (select (arr!48901 a!2804) (bvadd j!70 #b00000000000000000000000000000001)))))

(declare-fun lt!659752 () Unit!50916)

(assert (=> b!1522716 (= lt!659752 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659750 (bvadd j!70 #b00000000000000000000000000000001)))))

(assert (=> b!1522716 (arrayContainsKey!0 a!2804 lt!659750 #b00000000000000000000000000000000)))

(declare-fun lt!659751 () Unit!50916)

(assert (=> b!1522716 (= lt!659751 lt!659752)))

(declare-fun res!1041659 () Bool)

(assert (=> b!1522716 (= res!1041659 (= (seekEntryOrOpen!0 (select (arr!48901 a!2804) (bvadd j!70 #b00000000000000000000000000000001)) a!2804 mask!2512) (Found!13066 (bvadd j!70 #b00000000000000000000000000000001))))))

(assert (=> b!1522716 (=> (not res!1041659) (not e!849063))))

(declare-fun bm!68401 () Bool)

(assert (=> bm!68401 (= call!68404 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1522717 () Bool)

(declare-fun e!849065 () Bool)

(assert (=> b!1522717 (= e!849065 e!849064)))

(declare-fun c!140076 () Bool)

(assert (=> b!1522717 (= c!140076 (validKeyInArray!0 (select (arr!48901 a!2804) (bvadd j!70 #b00000000000000000000000000000001))))))

(declare-fun d!159211 () Bool)

(declare-fun res!1041658 () Bool)

(assert (=> d!159211 (=> res!1041658 e!849065)))

(assert (=> d!159211 (= res!1041658 (bvsge (bvadd j!70 #b00000000000000000000000000000001) (size!49451 a!2804)))))

(assert (=> d!159211 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512) e!849065)))

(declare-fun b!1522718 () Bool)

(assert (=> b!1522718 (= e!849063 call!68404)))

(assert (= (and d!159211 (not res!1041658)) b!1522717))

(assert (= (and b!1522717 c!140076) b!1522716))

(assert (= (and b!1522717 (not c!140076)) b!1522715))

(assert (= (and b!1522716 res!1041659) b!1522718))

(assert (= (or b!1522718 b!1522715) bm!68401))

(declare-fun m!1405789 () Bool)

(assert (=> b!1522716 m!1405789))

(declare-fun m!1405791 () Bool)

(assert (=> b!1522716 m!1405791))

(declare-fun m!1405793 () Bool)

(assert (=> b!1522716 m!1405793))

(assert (=> b!1522716 m!1405789))

(declare-fun m!1405795 () Bool)

(assert (=> b!1522716 m!1405795))

(declare-fun m!1405797 () Bool)

(assert (=> bm!68401 m!1405797))

(assert (=> b!1522717 m!1405789))

(assert (=> b!1522717 m!1405789))

(declare-fun m!1405799 () Bool)

(assert (=> b!1522717 m!1405799))

(assert (=> bm!68388 d!159211))

(assert (=> d!159117 d!159083))

(declare-fun b!1522719 () Bool)

(declare-fun e!849067 () Bool)

(declare-fun call!68405 () Bool)

(assert (=> b!1522719 (= e!849067 call!68405)))

(declare-fun b!1522720 () Bool)

(declare-fun e!849066 () Bool)

(assert (=> b!1522720 (= e!849067 e!849066)))

(declare-fun lt!659753 () (_ BitVec 64))

(assert (=> b!1522720 (= lt!659753 (select (arr!48901 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!659755 () Unit!50916)

(assert (=> b!1522720 (= lt!659755 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659753 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1522720 (arrayContainsKey!0 a!2804 lt!659753 #b00000000000000000000000000000000)))

(declare-fun lt!659754 () Unit!50916)

(assert (=> b!1522720 (= lt!659754 lt!659755)))

(declare-fun res!1041661 () Bool)

(assert (=> b!1522720 (= res!1041661 (= (seekEntryOrOpen!0 (select (arr!48901 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!2804 mask!2512) (Found!13066 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1522720 (=> (not res!1041661) (not e!849066))))

(declare-fun bm!68402 () Bool)

(assert (=> bm!68402 (= call!68405 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1522721 () Bool)

(declare-fun e!849068 () Bool)

(assert (=> b!1522721 (= e!849068 e!849067)))

(declare-fun c!140077 () Bool)

(assert (=> b!1522721 (= c!140077 (validKeyInArray!0 (select (arr!48901 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!159213 () Bool)

(declare-fun res!1041660 () Bool)

(assert (=> d!159213 (=> res!1041660 e!849068)))

(assert (=> d!159213 (= res!1041660 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!49451 a!2804)))))

(assert (=> d!159213 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512) e!849068)))

(declare-fun b!1522722 () Bool)

(assert (=> b!1522722 (= e!849066 call!68405)))

(assert (= (and d!159213 (not res!1041660)) b!1522721))

(assert (= (and b!1522721 c!140077) b!1522720))

(assert (= (and b!1522721 (not c!140077)) b!1522719))

(assert (= (and b!1522720 res!1041661) b!1522722))

(assert (= (or b!1522722 b!1522719) bm!68402))

(declare-fun m!1405801 () Bool)

(assert (=> b!1522720 m!1405801))

(declare-fun m!1405803 () Bool)

(assert (=> b!1522720 m!1405803))

(declare-fun m!1405805 () Bool)

(assert (=> b!1522720 m!1405805))

(assert (=> b!1522720 m!1405801))

(declare-fun m!1405807 () Bool)

(assert (=> b!1522720 m!1405807))

(declare-fun m!1405809 () Bool)

(assert (=> bm!68402 m!1405809))

(assert (=> b!1522721 m!1405801))

(assert (=> b!1522721 m!1405801))

(declare-fun m!1405811 () Bool)

(assert (=> b!1522721 m!1405811))

(assert (=> bm!68397 d!159213))

(assert (=> d!159089 d!159145))

(assert (=> d!159089 d!159147))

(assert (=> d!159089 d!159083))

(assert (=> d!159109 d!159105))

(declare-fun d!159215 () Bool)

(assert (=> d!159215 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(assert (=> d!159215 true))

(declare-fun _$72!173 () Unit!50916)

(assert (=> d!159215 (= (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) _$72!173)))

(declare-fun bs!43708 () Bool)

(assert (= bs!43708 d!159215))

(assert (=> bs!43708 m!1405463))

(assert (=> d!159109 d!159215))

(assert (=> d!159109 d!159083))

(assert (=> b!1522432 d!159079))

(declare-fun b!1522735 () Bool)

(declare-fun e!849076 () SeekEntryResult!13066)

(assert (=> b!1522735 (= e!849076 Undefined!13066)))

(declare-fun b!1522736 () Bool)

(declare-fun e!849075 () SeekEntryResult!13066)

(assert (=> b!1522736 (= e!849075 (MissingVacant!13066 (index!54661 lt!659598)))))

(declare-fun b!1522737 () Bool)

(assert (=> b!1522737 (= e!849075 (seekKeyOrZeroReturnVacant!0 (bvadd (x!136342 lt!659598) #b00000000000000000000000000000001) (nextIndex!0 (index!54661 lt!659598) (x!136342 lt!659598) mask!2512) (index!54661 lt!659598) (select (arr!48901 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522738 () Bool)

(declare-fun c!140084 () Bool)

(declare-fun lt!659761 () (_ BitVec 64))

(assert (=> b!1522738 (= c!140084 (= lt!659761 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!849077 () SeekEntryResult!13066)

(assert (=> b!1522738 (= e!849077 e!849075)))

(declare-fun b!1522739 () Bool)

(assert (=> b!1522739 (= e!849076 e!849077)))

(declare-fun c!140086 () Bool)

(assert (=> b!1522739 (= c!140086 (= lt!659761 (select (arr!48901 a!2804) j!70)))))

(declare-fun b!1522740 () Bool)

(assert (=> b!1522740 (= e!849077 (Found!13066 (index!54661 lt!659598)))))

(declare-fun d!159217 () Bool)

(declare-fun lt!659760 () SeekEntryResult!13066)

(assert (=> d!159217 (and (or (is-Undefined!13066 lt!659760) (not (is-Found!13066 lt!659760)) (and (bvsge (index!54660 lt!659760) #b00000000000000000000000000000000) (bvslt (index!54660 lt!659760) (size!49451 a!2804)))) (or (is-Undefined!13066 lt!659760) (is-Found!13066 lt!659760) (not (is-MissingVacant!13066 lt!659760)) (not (= (index!54662 lt!659760) (index!54661 lt!659598))) (and (bvsge (index!54662 lt!659760) #b00000000000000000000000000000000) (bvslt (index!54662 lt!659760) (size!49451 a!2804)))) (or (is-Undefined!13066 lt!659760) (ite (is-Found!13066 lt!659760) (= (select (arr!48901 a!2804) (index!54660 lt!659760)) (select (arr!48901 a!2804) j!70)) (and (is-MissingVacant!13066 lt!659760) (= (index!54662 lt!659760) (index!54661 lt!659598)) (= (select (arr!48901 a!2804) (index!54662 lt!659760)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!159217 (= lt!659760 e!849076)))

(declare-fun c!140085 () Bool)

(assert (=> d!159217 (= c!140085 (bvsge (x!136342 lt!659598) #b01111111111111111111111111111110))))

(assert (=> d!159217 (= lt!659761 (select (arr!48901 a!2804) (index!54661 lt!659598)))))

(assert (=> d!159217 (validMask!0 mask!2512)))

(assert (=> d!159217 (= (seekKeyOrZeroReturnVacant!0 (x!136342 lt!659598) (index!54661 lt!659598) (index!54661 lt!659598) (select (arr!48901 a!2804) j!70) a!2804 mask!2512) lt!659760)))

(assert (= (and d!159217 c!140085) b!1522735))

(assert (= (and d!159217 (not c!140085)) b!1522739))

(assert (= (and b!1522739 c!140086) b!1522740))

(assert (= (and b!1522739 (not c!140086)) b!1522738))

(assert (= (and b!1522738 c!140084) b!1522736))

(assert (= (and b!1522738 (not c!140084)) b!1522737))

(declare-fun m!1405813 () Bool)

(assert (=> b!1522737 m!1405813))

(assert (=> b!1522737 m!1405813))

(assert (=> b!1522737 m!1405433))

(declare-fun m!1405815 () Bool)

(assert (=> b!1522737 m!1405815))

(declare-fun m!1405817 () Bool)

(assert (=> d!159217 m!1405817))

(declare-fun m!1405819 () Bool)

(assert (=> d!159217 m!1405819))

(assert (=> d!159217 m!1405505))

(assert (=> d!159217 m!1405449))

(assert (=> b!1522387 d!159217))

(assert (=> d!159145 d!159083))

(declare-fun b!1522741 () Bool)

(declare-fun e!849081 () Bool)

(declare-fun e!849080 () Bool)

(assert (=> b!1522741 (= e!849081 e!849080)))

(declare-fun res!1041664 () Bool)

(declare-fun lt!659762 () SeekEntryResult!13066)

(assert (=> b!1522741 (= res!1041664 (and (is-Intermediate!13066 lt!659762) (not (undefined!13878 lt!659762)) (bvslt (x!136342 lt!659762) #b01111111111111111111111111111110) (bvsge (x!136342 lt!659762) #b00000000000000000000000000000000) (bvsge (x!136342 lt!659762) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1522741 (=> (not res!1041664) (not e!849080))))

(declare-fun b!1522742 () Bool)

(assert (=> b!1522742 (and (bvsge (index!54661 lt!659762) #b00000000000000000000000000000000) (bvslt (index!54661 lt!659762) (size!49451 a!2804)))))

(declare-fun res!1041662 () Bool)

(assert (=> b!1522742 (= res!1041662 (= (select (arr!48901 a!2804) (index!54661 lt!659762)) (select (arr!48901 a!2804) j!70)))))

(declare-fun e!849078 () Bool)

(assert (=> b!1522742 (=> res!1041662 e!849078)))

(assert (=> b!1522742 (= e!849080 e!849078)))

(declare-fun b!1522743 () Bool)

(assert (=> b!1522743 (and (bvsge (index!54661 lt!659762) #b00000000000000000000000000000000) (bvslt (index!54661 lt!659762) (size!49451 a!2804)))))

(assert (=> b!1522743 (= e!849078 (= (select (arr!48901 a!2804) (index!54661 lt!659762)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1522745 () Bool)

(declare-fun e!849082 () SeekEntryResult!13066)

(declare-fun e!849079 () SeekEntryResult!13066)

(assert (=> b!1522745 (= e!849082 e!849079)))

(declare-fun c!140088 () Bool)

(declare-fun lt!659763 () (_ BitVec 64))

(assert (=> b!1522745 (= c!140088 (or (= lt!659763 (select (arr!48901 a!2804) j!70)) (= (bvadd lt!659763 lt!659763) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1522746 () Bool)

(assert (=> b!1522746 (and (bvsge (index!54661 lt!659762) #b00000000000000000000000000000000) (bvslt (index!54661 lt!659762) (size!49451 a!2804)))))

(declare-fun res!1041663 () Bool)

(assert (=> b!1522746 (= res!1041663 (= (select (arr!48901 a!2804) (index!54661 lt!659762)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522746 (=> res!1041663 e!849078)))

(declare-fun b!1522747 () Bool)

(assert (=> b!1522747 (= e!849082 (Intermediate!13066 true (nextIndex!0 (toIndex!0 (select (arr!48901 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1522748 () Bool)

(assert (=> b!1522748 (= e!849079 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (arr!48901 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (arr!48901 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522749 () Bool)

(assert (=> b!1522749 (= e!849079 (Intermediate!13066 false (nextIndex!0 (toIndex!0 (select (arr!48901 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1522744 () Bool)

(assert (=> b!1522744 (= e!849081 (bvsge (x!136342 lt!659762) #b01111111111111111111111111111110))))

(declare-fun d!159219 () Bool)

(assert (=> d!159219 e!849081))

(declare-fun c!140089 () Bool)

(assert (=> d!159219 (= c!140089 (and (is-Intermediate!13066 lt!659762) (undefined!13878 lt!659762)))))

(assert (=> d!159219 (= lt!659762 e!849082)))

(declare-fun c!140087 () Bool)

(assert (=> d!159219 (= c!140087 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!159219 (= lt!659763 (select (arr!48901 a!2804) (nextIndex!0 (toIndex!0 (select (arr!48901 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512)))))

(assert (=> d!159219 (validMask!0 mask!2512)))

(assert (=> d!159219 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48901 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48901 a!2804) j!70) a!2804 mask!2512) lt!659762)))

(assert (= (and d!159219 c!140087) b!1522747))

(assert (= (and d!159219 (not c!140087)) b!1522745))

(assert (= (and b!1522745 c!140088) b!1522749))

(assert (= (and b!1522745 (not c!140088)) b!1522748))

(assert (= (and d!159219 c!140089) b!1522744))

(assert (= (and d!159219 (not c!140089)) b!1522741))

(assert (= (and b!1522741 res!1041664) b!1522742))

(assert (= (and b!1522742 (not res!1041662)) b!1522746))

(assert (= (and b!1522746 (not res!1041663)) b!1522743))

(declare-fun m!1405821 () Bool)

(assert (=> b!1522743 m!1405821))

(assert (=> b!1522742 m!1405821))

(assert (=> b!1522748 m!1405615))

(declare-fun m!1405823 () Bool)

(assert (=> b!1522748 m!1405823))

(assert (=> b!1522748 m!1405823))

(assert (=> b!1522748 m!1405433))

(declare-fun m!1405825 () Bool)

(assert (=> b!1522748 m!1405825))

(assert (=> d!159219 m!1405615))

(declare-fun m!1405827 () Bool)

(assert (=> d!159219 m!1405827))

(assert (=> d!159219 m!1405449))

(assert (=> b!1522746 m!1405821))

(assert (=> b!1522557 d!159219))

(declare-fun d!159221 () Bool)

(declare-fun lt!659764 () (_ BitVec 32))

(assert (=> d!159221 (and (bvsge lt!659764 #b00000000000000000000000000000000) (bvslt lt!659764 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(assert (=> d!159221 (= lt!659764 (choose!52 (toIndex!0 (select (arr!48901 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512))))

(assert (=> d!159221 (validMask!0 mask!2512)))

(assert (=> d!159221 (= (nextIndex!0 (toIndex!0 (select (arr!48901 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) lt!659764)))

(declare-fun bs!43709 () Bool)

(assert (= bs!43709 d!159221))

(assert (=> bs!43709 m!1405435))

(declare-fun m!1405829 () Bool)

(assert (=> bs!43709 m!1405829))

(assert (=> bs!43709 m!1405449))

(assert (=> b!1522557 d!159221))

(declare-fun b!1522750 () Bool)

(declare-fun e!849086 () Bool)

(declare-fun e!849085 () Bool)

(assert (=> b!1522750 (= e!849086 e!849085)))

(declare-fun res!1041667 () Bool)

(declare-fun lt!659765 () SeekEntryResult!13066)

(assert (=> b!1522750 (= res!1041667 (and (is-Intermediate!13066 lt!659765) (not (undefined!13878 lt!659765)) (bvslt (x!136342 lt!659765) #b01111111111111111111111111111110) (bvsge (x!136342 lt!659765) #b00000000000000000000000000000000) (bvsge (x!136342 lt!659765) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1522750 (=> (not res!1041667) (not e!849085))))

(declare-fun b!1522751 () Bool)

(assert (=> b!1522751 (and (bvsge (index!54661 lt!659765) #b00000000000000000000000000000000) (bvslt (index!54661 lt!659765) (size!49451 (array!101338 (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49451 a!2804)))))))

(declare-fun res!1041665 () Bool)

(assert (=> b!1522751 (= res!1041665 (= (select (arr!48901 (array!101338 (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49451 a!2804))) (index!54661 lt!659765)) (select (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(declare-fun e!849083 () Bool)

(assert (=> b!1522751 (=> res!1041665 e!849083)))

(assert (=> b!1522751 (= e!849085 e!849083)))

(declare-fun b!1522752 () Bool)

(assert (=> b!1522752 (and (bvsge (index!54661 lt!659765) #b00000000000000000000000000000000) (bvslt (index!54661 lt!659765) (size!49451 (array!101338 (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49451 a!2804)))))))

(assert (=> b!1522752 (= e!849083 (= (select (arr!48901 (array!101338 (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49451 a!2804))) (index!54661 lt!659765)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1522754 () Bool)

(declare-fun e!849087 () SeekEntryResult!13066)

(declare-fun e!849084 () SeekEntryResult!13066)

(assert (=> b!1522754 (= e!849087 e!849084)))

(declare-fun lt!659766 () (_ BitVec 64))

(declare-fun c!140091 () Bool)

(assert (=> b!1522754 (= c!140091 (or (= lt!659766 (select (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!659766 lt!659766) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1522755 () Bool)

(assert (=> b!1522755 (and (bvsge (index!54661 lt!659765) #b00000000000000000000000000000000) (bvslt (index!54661 lt!659765) (size!49451 (array!101338 (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49451 a!2804)))))))

(declare-fun res!1041666 () Bool)

(assert (=> b!1522755 (= res!1041666 (= (select (arr!48901 (array!101338 (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49451 a!2804))) (index!54661 lt!659765)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522755 (=> res!1041666 e!849083)))

(declare-fun b!1522756 () Bool)

(assert (=> b!1522756 (= e!849087 (Intermediate!13066 true (nextIndex!0 (toIndex!0 (select (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1522757 () Bool)

(assert (=> b!1522757 (= e!849084 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101338 (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49451 a!2804)) mask!2512))))

(declare-fun b!1522758 () Bool)

(assert (=> b!1522758 (= e!849084 (Intermediate!13066 false (nextIndex!0 (toIndex!0 (select (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1522753 () Bool)

(assert (=> b!1522753 (= e!849086 (bvsge (x!136342 lt!659765) #b01111111111111111111111111111110))))

(declare-fun d!159223 () Bool)

(assert (=> d!159223 e!849086))

(declare-fun c!140092 () Bool)

(assert (=> d!159223 (= c!140092 (and (is-Intermediate!13066 lt!659765) (undefined!13878 lt!659765)))))

(assert (=> d!159223 (= lt!659765 e!849087)))

(declare-fun c!140090 () Bool)

(assert (=> d!159223 (= c!140090 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!159223 (= lt!659766 (select (arr!48901 (array!101338 (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49451 a!2804))) (nextIndex!0 (toIndex!0 (select (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512)))))

(assert (=> d!159223 (validMask!0 mask!2512)))

(assert (=> d!159223 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101338 (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49451 a!2804)) mask!2512) lt!659765)))

(assert (= (and d!159223 c!140090) b!1522756))

(assert (= (and d!159223 (not c!140090)) b!1522754))

(assert (= (and b!1522754 c!140091) b!1522758))

(assert (= (and b!1522754 (not c!140091)) b!1522757))

(assert (= (and d!159223 c!140092) b!1522753))

(assert (= (and d!159223 (not c!140092)) b!1522750))

(assert (= (and b!1522750 res!1041667) b!1522751))

(assert (= (and b!1522751 (not res!1041665)) b!1522755))

(assert (= (and b!1522755 (not res!1041666)) b!1522752))

(declare-fun m!1405831 () Bool)

(assert (=> b!1522752 m!1405831))

(assert (=> b!1522751 m!1405831))

(assert (=> b!1522757 m!1405591))

(declare-fun m!1405833 () Bool)

(assert (=> b!1522757 m!1405833))

(assert (=> b!1522757 m!1405833))

(assert (=> b!1522757 m!1405443))

(declare-fun m!1405835 () Bool)

(assert (=> b!1522757 m!1405835))

(assert (=> d!159223 m!1405591))

(declare-fun m!1405837 () Bool)

(assert (=> d!159223 m!1405837))

(assert (=> d!159223 m!1405449))

(assert (=> b!1522755 m!1405831))

(assert (=> b!1522535 d!159223))

(declare-fun d!159225 () Bool)

(declare-fun lt!659767 () (_ BitVec 32))

(assert (=> d!159225 (and (bvsge lt!659767 #b00000000000000000000000000000000) (bvslt lt!659767 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(assert (=> d!159225 (= lt!659767 (choose!52 (toIndex!0 (select (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512))))

(assert (=> d!159225 (validMask!0 mask!2512)))

(assert (=> d!159225 (= (nextIndex!0 (toIndex!0 (select (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) lt!659767)))

(declare-fun bs!43710 () Bool)

(assert (= bs!43710 d!159225))

(assert (=> bs!43710 m!1405445))

(declare-fun m!1405839 () Bool)

(assert (=> bs!43710 m!1405839))

(assert (=> bs!43710 m!1405449))

(assert (=> b!1522535 d!159225))

(declare-fun b!1522759 () Bool)

(declare-fun e!849088 () Bool)

(declare-fun call!68406 () Bool)

(assert (=> b!1522759 (= e!849088 call!68406)))

(declare-fun bm!68403 () Bool)

(declare-fun c!140093 () Bool)

(assert (=> bm!68403 (= call!68406 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!140093 (Cons!35380 (select (arr!48901 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!139994 (Cons!35380 (select (arr!48901 a!2804) #b00000000000000000000000000000000) Nil!35381) Nil!35381)) (ite c!139994 (Cons!35380 (select (arr!48901 a!2804) #b00000000000000000000000000000000) Nil!35381) Nil!35381))))))

(declare-fun d!159227 () Bool)

(declare-fun res!1041670 () Bool)

(declare-fun e!849089 () Bool)

(assert (=> d!159227 (=> res!1041670 e!849089)))

(assert (=> d!159227 (= res!1041670 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!49451 a!2804)))))

(assert (=> d!159227 (= (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139994 (Cons!35380 (select (arr!48901 a!2804) #b00000000000000000000000000000000) Nil!35381) Nil!35381)) e!849089)))

(declare-fun b!1522760 () Bool)

(declare-fun e!849090 () Bool)

(assert (=> b!1522760 (= e!849089 e!849090)))

(declare-fun res!1041668 () Bool)

(assert (=> b!1522760 (=> (not res!1041668) (not e!849090))))

(declare-fun e!849091 () Bool)

(assert (=> b!1522760 (= res!1041668 (not e!849091))))

(declare-fun res!1041669 () Bool)

(assert (=> b!1522760 (=> (not res!1041669) (not e!849091))))

(assert (=> b!1522760 (= res!1041669 (validKeyInArray!0 (select (arr!48901 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1522761 () Bool)

(assert (=> b!1522761 (= e!849090 e!849088)))

(assert (=> b!1522761 (= c!140093 (validKeyInArray!0 (select (arr!48901 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1522762 () Bool)

(assert (=> b!1522762 (= e!849091 (contains!9987 (ite c!139994 (Cons!35380 (select (arr!48901 a!2804) #b00000000000000000000000000000000) Nil!35381) Nil!35381) (select (arr!48901 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1522763 () Bool)

(assert (=> b!1522763 (= e!849088 call!68406)))

(assert (= (and d!159227 (not res!1041670)) b!1522760))

(assert (= (and b!1522760 res!1041669) b!1522762))

(assert (= (and b!1522760 res!1041668) b!1522761))

(assert (= (and b!1522761 c!140093) b!1522759))

(assert (= (and b!1522761 (not c!140093)) b!1522763))

(assert (= (or b!1522759 b!1522763) bm!68403))

(assert (=> bm!68403 m!1405801))

(declare-fun m!1405841 () Bool)

(assert (=> bm!68403 m!1405841))

(assert (=> b!1522760 m!1405801))

(assert (=> b!1522760 m!1405801))

(assert (=> b!1522760 m!1405811))

(assert (=> b!1522761 m!1405801))

(assert (=> b!1522761 m!1405801))

(assert (=> b!1522761 m!1405811))

(assert (=> b!1522762 m!1405801))

(assert (=> b!1522762 m!1405801))

(declare-fun m!1405843 () Bool)

(assert (=> b!1522762 m!1405843))

(assert (=> bm!68391 d!159227))

(push 1)

