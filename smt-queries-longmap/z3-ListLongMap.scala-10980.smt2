; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128888 () Bool)

(assert start!128888)

(declare-fun b!1509314 () Bool)

(declare-fun res!1028363 () Bool)

(declare-fun e!843414 () Bool)

(assert (=> b!1509314 (=> (not res!1028363) (not e!843414))))

(declare-datatypes ((array!100675 0))(
  ( (array!100676 (arr!48574 (Array (_ BitVec 32) (_ BitVec 64))) (size!49125 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100675)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509314 (= res!1028363 (validKeyInArray!0 (select (arr!48574 a!2804) i!961)))))

(declare-fun b!1509315 () Bool)

(declare-fun res!1028358 () Bool)

(declare-fun e!843413 () Bool)

(assert (=> b!1509315 (=> (not res!1028358) (not e!843413))))

(declare-datatypes ((SeekEntryResult!12638 0))(
  ( (MissingZero!12638 (index!52947 (_ BitVec 32))) (Found!12638 (index!52948 (_ BitVec 32))) (Intermediate!12638 (undefined!13450 Bool) (index!52949 (_ BitVec 32)) (x!134903 (_ BitVec 32))) (Undefined!12638) (MissingVacant!12638 (index!52950 (_ BitVec 32))) )
))
(declare-fun lt!655059 () SeekEntryResult!12638)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100675 (_ BitVec 32)) SeekEntryResult!12638)

(assert (=> b!1509315 (= res!1028358 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48574 a!2804) j!70) a!2804 mask!2512) lt!655059))))

(declare-fun b!1509316 () Bool)

(declare-fun res!1028360 () Bool)

(assert (=> b!1509316 (=> (not res!1028360) (not e!843414))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1509316 (= res!1028360 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49125 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49125 a!2804))))))

(declare-fun b!1509317 () Bool)

(declare-fun res!1028356 () Bool)

(assert (=> b!1509317 (=> (not res!1028356) (not e!843414))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100675 (_ BitVec 32)) Bool)

(assert (=> b!1509317 (= res!1028356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509318 () Bool)

(declare-fun lt!655060 () (_ BitVec 32))

(assert (=> b!1509318 (= e!843413 (and (bvsge mask!2512 #b00000000000000000000000000000000) (or (bvslt lt!655060 #b00000000000000000000000000000000) (bvsge lt!655060 (bvadd #b00000000000000000000000000000001 mask!2512)))))))

(declare-fun b!1509319 () Bool)

(declare-fun res!1028359 () Bool)

(assert (=> b!1509319 (=> (not res!1028359) (not e!843414))))

(assert (=> b!1509319 (= res!1028359 (and (= (size!49125 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49125 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49125 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509320 () Bool)

(declare-fun res!1028362 () Bool)

(assert (=> b!1509320 (=> (not res!1028362) (not e!843414))))

(declare-datatypes ((List!35044 0))(
  ( (Nil!35041) (Cons!35040 (h!36458 (_ BitVec 64)) (t!49730 List!35044)) )
))
(declare-fun arrayNoDuplicates!0 (array!100675 (_ BitVec 32) List!35044) Bool)

(assert (=> b!1509320 (= res!1028362 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35041))))

(declare-fun res!1028357 () Bool)

(assert (=> start!128888 (=> (not res!1028357) (not e!843414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128888 (= res!1028357 (validMask!0 mask!2512))))

(assert (=> start!128888 e!843414))

(assert (=> start!128888 true))

(declare-fun array_inv!37855 (array!100675) Bool)

(assert (=> start!128888 (array_inv!37855 a!2804)))

(declare-fun b!1509321 () Bool)

(declare-fun res!1028361 () Bool)

(assert (=> b!1509321 (=> (not res!1028361) (not e!843414))))

(assert (=> b!1509321 (= res!1028361 (validKeyInArray!0 (select (arr!48574 a!2804) j!70)))))

(declare-fun b!1509322 () Bool)

(assert (=> b!1509322 (= e!843414 e!843413)))

(declare-fun res!1028355 () Bool)

(assert (=> b!1509322 (=> (not res!1028355) (not e!843413))))

(assert (=> b!1509322 (= res!1028355 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!655060 (select (arr!48574 a!2804) j!70) a!2804 mask!2512) lt!655059))))

(assert (=> b!1509322 (= lt!655059 (Intermediate!12638 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509322 (= lt!655060 (toIndex!0 (select (arr!48574 a!2804) j!70) mask!2512))))

(assert (= (and start!128888 res!1028357) b!1509319))

(assert (= (and b!1509319 res!1028359) b!1509314))

(assert (= (and b!1509314 res!1028363) b!1509321))

(assert (= (and b!1509321 res!1028361) b!1509317))

(assert (= (and b!1509317 res!1028356) b!1509320))

(assert (= (and b!1509320 res!1028362) b!1509316))

(assert (= (and b!1509316 res!1028360) b!1509322))

(assert (= (and b!1509322 res!1028355) b!1509315))

(assert (= (and b!1509315 res!1028358) b!1509318))

(declare-fun m!1392021 () Bool)

(assert (=> b!1509322 m!1392021))

(assert (=> b!1509322 m!1392021))

(declare-fun m!1392023 () Bool)

(assert (=> b!1509322 m!1392023))

(assert (=> b!1509322 m!1392021))

(declare-fun m!1392025 () Bool)

(assert (=> b!1509322 m!1392025))

(assert (=> b!1509321 m!1392021))

(assert (=> b!1509321 m!1392021))

(declare-fun m!1392027 () Bool)

(assert (=> b!1509321 m!1392027))

(declare-fun m!1392029 () Bool)

(assert (=> b!1509320 m!1392029))

(assert (=> b!1509315 m!1392021))

(assert (=> b!1509315 m!1392021))

(declare-fun m!1392031 () Bool)

(assert (=> b!1509315 m!1392031))

(declare-fun m!1392033 () Bool)

(assert (=> start!128888 m!1392033))

(declare-fun m!1392035 () Bool)

(assert (=> start!128888 m!1392035))

(declare-fun m!1392037 () Bool)

(assert (=> b!1509317 m!1392037))

(declare-fun m!1392039 () Bool)

(assert (=> b!1509314 m!1392039))

(assert (=> b!1509314 m!1392039))

(declare-fun m!1392041 () Bool)

(assert (=> b!1509314 m!1392041))

(check-sat (not b!1509320) (not b!1509322) (not b!1509321) (not b!1509317) (not start!128888) (not b!1509315) (not b!1509314))
(check-sat)
(get-model)

(declare-fun d!158835 () Bool)

(assert (=> d!158835 (= (validKeyInArray!0 (select (arr!48574 a!2804) i!961)) (and (not (= (select (arr!48574 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48574 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1509314 d!158835))

(declare-fun d!158837 () Bool)

(assert (=> d!158837 (= (validKeyInArray!0 (select (arr!48574 a!2804) j!70)) (and (not (= (select (arr!48574 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48574 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1509321 d!158837))

(declare-fun b!1509405 () Bool)

(declare-fun e!843454 () Bool)

(declare-fun e!843453 () Bool)

(assert (=> b!1509405 (= e!843454 e!843453)))

(declare-fun res!1028431 () Bool)

(declare-fun lt!655078 () SeekEntryResult!12638)

(get-info :version)

(assert (=> b!1509405 (= res!1028431 (and ((_ is Intermediate!12638) lt!655078) (not (undefined!13450 lt!655078)) (bvslt (x!134903 lt!655078) #b01111111111111111111111111111110) (bvsge (x!134903 lt!655078) #b00000000000000000000000000000000) (bvsge (x!134903 lt!655078) x!534)))))

(assert (=> b!1509405 (=> (not res!1028431) (not e!843453))))

(declare-fun d!158839 () Bool)

(assert (=> d!158839 e!843454))

(declare-fun c!140036 () Bool)

(assert (=> d!158839 (= c!140036 (and ((_ is Intermediate!12638) lt!655078) (undefined!13450 lt!655078)))))

(declare-fun e!843455 () SeekEntryResult!12638)

(assert (=> d!158839 (= lt!655078 e!843455)))

(declare-fun c!140037 () Bool)

(assert (=> d!158839 (= c!140037 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!655077 () (_ BitVec 64))

(assert (=> d!158839 (= lt!655077 (select (arr!48574 a!2804) index!487))))

(assert (=> d!158839 (validMask!0 mask!2512)))

(assert (=> d!158839 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48574 a!2804) j!70) a!2804 mask!2512) lt!655078)))

(declare-fun b!1509406 () Bool)

(declare-fun e!843451 () SeekEntryResult!12638)

(assert (=> b!1509406 (= e!843455 e!843451)))

(declare-fun c!140035 () Bool)

(assert (=> b!1509406 (= c!140035 (or (= lt!655077 (select (arr!48574 a!2804) j!70)) (= (bvadd lt!655077 lt!655077) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1509407 () Bool)

(assert (=> b!1509407 (and (bvsge (index!52949 lt!655078) #b00000000000000000000000000000000) (bvslt (index!52949 lt!655078) (size!49125 a!2804)))))

(declare-fun res!1028432 () Bool)

(assert (=> b!1509407 (= res!1028432 (= (select (arr!48574 a!2804) (index!52949 lt!655078)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!843452 () Bool)

(assert (=> b!1509407 (=> res!1028432 e!843452)))

(declare-fun b!1509408 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509408 (= e!843451 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 (bvadd x!534 #b00000000000000000000000000000001) mask!2512) (select (arr!48574 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509409 () Bool)

(assert (=> b!1509409 (= e!843455 (Intermediate!12638 true index!487 x!534))))

(declare-fun b!1509410 () Bool)

(assert (=> b!1509410 (= e!843454 (bvsge (x!134903 lt!655078) #b01111111111111111111111111111110))))

(declare-fun b!1509411 () Bool)

(assert (=> b!1509411 (= e!843451 (Intermediate!12638 false index!487 x!534))))

(declare-fun b!1509412 () Bool)

(assert (=> b!1509412 (and (bvsge (index!52949 lt!655078) #b00000000000000000000000000000000) (bvslt (index!52949 lt!655078) (size!49125 a!2804)))))

(assert (=> b!1509412 (= e!843452 (= (select (arr!48574 a!2804) (index!52949 lt!655078)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1509413 () Bool)

(assert (=> b!1509413 (and (bvsge (index!52949 lt!655078) #b00000000000000000000000000000000) (bvslt (index!52949 lt!655078) (size!49125 a!2804)))))

(declare-fun res!1028430 () Bool)

(assert (=> b!1509413 (= res!1028430 (= (select (arr!48574 a!2804) (index!52949 lt!655078)) (select (arr!48574 a!2804) j!70)))))

(assert (=> b!1509413 (=> res!1028430 e!843452)))

(assert (=> b!1509413 (= e!843453 e!843452)))

(assert (= (and d!158839 c!140037) b!1509409))

(assert (= (and d!158839 (not c!140037)) b!1509406))

(assert (= (and b!1509406 c!140035) b!1509411))

(assert (= (and b!1509406 (not c!140035)) b!1509408))

(assert (= (and d!158839 c!140036) b!1509410))

(assert (= (and d!158839 (not c!140036)) b!1509405))

(assert (= (and b!1509405 res!1028431) b!1509413))

(assert (= (and b!1509413 (not res!1028430)) b!1509407))

(assert (= (and b!1509407 (not res!1028432)) b!1509412))

(declare-fun m!1392087 () Bool)

(assert (=> b!1509413 m!1392087))

(assert (=> b!1509407 m!1392087))

(assert (=> b!1509412 m!1392087))

(declare-fun m!1392089 () Bool)

(assert (=> b!1509408 m!1392089))

(assert (=> b!1509408 m!1392089))

(assert (=> b!1509408 m!1392021))

(declare-fun m!1392091 () Bool)

(assert (=> b!1509408 m!1392091))

(declare-fun m!1392093 () Bool)

(assert (=> d!158839 m!1392093))

(assert (=> d!158839 m!1392033))

(assert (=> b!1509315 d!158839))

(declare-fun b!1509439 () Bool)

(declare-fun e!843476 () Bool)

(declare-fun call!68369 () Bool)

(assert (=> b!1509439 (= e!843476 call!68369)))

(declare-fun b!1509440 () Bool)

(declare-fun e!843479 () Bool)

(declare-fun e!843477 () Bool)

(assert (=> b!1509440 (= e!843479 e!843477)))

(declare-fun res!1028449 () Bool)

(assert (=> b!1509440 (=> (not res!1028449) (not e!843477))))

(declare-fun e!843478 () Bool)

(assert (=> b!1509440 (= res!1028449 (not e!843478))))

(declare-fun res!1028450 () Bool)

(assert (=> b!1509440 (=> (not res!1028450) (not e!843478))))

(assert (=> b!1509440 (= res!1028450 (validKeyInArray!0 (select (arr!48574 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1509441 () Bool)

(declare-fun contains!10012 (List!35044 (_ BitVec 64)) Bool)

(assert (=> b!1509441 (= e!843478 (contains!10012 Nil!35041 (select (arr!48574 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1509442 () Bool)

(assert (=> b!1509442 (= e!843477 e!843476)))

(declare-fun c!140043 () Bool)

(assert (=> b!1509442 (= c!140043 (validKeyInArray!0 (select (arr!48574 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68366 () Bool)

(assert (=> bm!68366 (= call!68369 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140043 (Cons!35040 (select (arr!48574 a!2804) #b00000000000000000000000000000000) Nil!35041) Nil!35041)))))

(declare-fun d!158847 () Bool)

(declare-fun res!1028448 () Bool)

(assert (=> d!158847 (=> res!1028448 e!843479)))

(assert (=> d!158847 (= res!1028448 (bvsge #b00000000000000000000000000000000 (size!49125 a!2804)))))

(assert (=> d!158847 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35041) e!843479)))

(declare-fun b!1509443 () Bool)

(assert (=> b!1509443 (= e!843476 call!68369)))

(assert (= (and d!158847 (not res!1028448)) b!1509440))

(assert (= (and b!1509440 res!1028450) b!1509441))

(assert (= (and b!1509440 res!1028449) b!1509442))

(assert (= (and b!1509442 c!140043) b!1509439))

(assert (= (and b!1509442 (not c!140043)) b!1509443))

(assert (= (or b!1509439 b!1509443) bm!68366))

(declare-fun m!1392103 () Bool)

(assert (=> b!1509440 m!1392103))

(assert (=> b!1509440 m!1392103))

(declare-fun m!1392105 () Bool)

(assert (=> b!1509440 m!1392105))

(assert (=> b!1509441 m!1392103))

(assert (=> b!1509441 m!1392103))

(declare-fun m!1392107 () Bool)

(assert (=> b!1509441 m!1392107))

(assert (=> b!1509442 m!1392103))

(assert (=> b!1509442 m!1392103))

(assert (=> b!1509442 m!1392105))

(assert (=> bm!68366 m!1392103))

(declare-fun m!1392109 () Bool)

(assert (=> bm!68366 m!1392109))

(assert (=> b!1509320 d!158847))

(declare-fun d!158857 () Bool)

(assert (=> d!158857 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128888 d!158857))

(declare-fun d!158867 () Bool)

(assert (=> d!158867 (= (array_inv!37855 a!2804) (bvsge (size!49125 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128888 d!158867))

(declare-fun b!1509475 () Bool)

(declare-fun e!843502 () Bool)

(declare-fun e!843500 () Bool)

(assert (=> b!1509475 (= e!843502 e!843500)))

(declare-fun lt!655089 () (_ BitVec 64))

(assert (=> b!1509475 (= lt!655089 (select (arr!48574 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50259 0))(
  ( (Unit!50260) )
))
(declare-fun lt!655091 () Unit!50259)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100675 (_ BitVec 64) (_ BitVec 32)) Unit!50259)

(assert (=> b!1509475 (= lt!655091 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!655089 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100675 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1509475 (arrayContainsKey!0 a!2804 lt!655089 #b00000000000000000000000000000000)))

(declare-fun lt!655090 () Unit!50259)

(assert (=> b!1509475 (= lt!655090 lt!655091)))

(declare-fun res!1028464 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100675 (_ BitVec 32)) SeekEntryResult!12638)

(assert (=> b!1509475 (= res!1028464 (= (seekEntryOrOpen!0 (select (arr!48574 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12638 #b00000000000000000000000000000000)))))

(assert (=> b!1509475 (=> (not res!1028464) (not e!843500))))

(declare-fun b!1509476 () Bool)

(declare-fun call!68373 () Bool)

(assert (=> b!1509476 (= e!843500 call!68373)))

(declare-fun b!1509477 () Bool)

(declare-fun e!843501 () Bool)

(assert (=> b!1509477 (= e!843501 e!843502)))

(declare-fun c!140053 () Bool)

(assert (=> b!1509477 (= c!140053 (validKeyInArray!0 (select (arr!48574 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68370 () Bool)

(assert (=> bm!68370 (= call!68373 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1509478 () Bool)

(assert (=> b!1509478 (= e!843502 call!68373)))

(declare-fun d!158869 () Bool)

(declare-fun res!1028465 () Bool)

(assert (=> d!158869 (=> res!1028465 e!843501)))

(assert (=> d!158869 (= res!1028465 (bvsge #b00000000000000000000000000000000 (size!49125 a!2804)))))

(assert (=> d!158869 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!843501)))

(assert (= (and d!158869 (not res!1028465)) b!1509477))

(assert (= (and b!1509477 c!140053) b!1509475))

(assert (= (and b!1509477 (not c!140053)) b!1509478))

(assert (= (and b!1509475 res!1028464) b!1509476))

(assert (= (or b!1509476 b!1509478) bm!68370))

(assert (=> b!1509475 m!1392103))

(declare-fun m!1392119 () Bool)

(assert (=> b!1509475 m!1392119))

(declare-fun m!1392121 () Bool)

(assert (=> b!1509475 m!1392121))

(assert (=> b!1509475 m!1392103))

(declare-fun m!1392123 () Bool)

(assert (=> b!1509475 m!1392123))

(assert (=> b!1509477 m!1392103))

(assert (=> b!1509477 m!1392103))

(assert (=> b!1509477 m!1392105))

(declare-fun m!1392125 () Bool)

(assert (=> bm!68370 m!1392125))

(assert (=> b!1509317 d!158869))

(declare-fun b!1509479 () Bool)

(declare-fun e!843506 () Bool)

(declare-fun e!843505 () Bool)

(assert (=> b!1509479 (= e!843506 e!843505)))

(declare-fun res!1028467 () Bool)

(declare-fun lt!655097 () SeekEntryResult!12638)

(assert (=> b!1509479 (= res!1028467 (and ((_ is Intermediate!12638) lt!655097) (not (undefined!13450 lt!655097)) (bvslt (x!134903 lt!655097) #b01111111111111111111111111111110) (bvsge (x!134903 lt!655097) #b00000000000000000000000000000000) (bvsge (x!134903 lt!655097) #b00000000000000000000000000000000)))))

(assert (=> b!1509479 (=> (not res!1028467) (not e!843505))))

(declare-fun d!158871 () Bool)

(assert (=> d!158871 e!843506))

(declare-fun c!140055 () Bool)

(assert (=> d!158871 (= c!140055 (and ((_ is Intermediate!12638) lt!655097) (undefined!13450 lt!655097)))))

(declare-fun e!843507 () SeekEntryResult!12638)

(assert (=> d!158871 (= lt!655097 e!843507)))

(declare-fun c!140056 () Bool)

(assert (=> d!158871 (= c!140056 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!655096 () (_ BitVec 64))

(assert (=> d!158871 (= lt!655096 (select (arr!48574 a!2804) lt!655060))))

(assert (=> d!158871 (validMask!0 mask!2512)))

(assert (=> d!158871 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!655060 (select (arr!48574 a!2804) j!70) a!2804 mask!2512) lt!655097)))

(declare-fun b!1509480 () Bool)

(declare-fun e!843503 () SeekEntryResult!12638)

(assert (=> b!1509480 (= e!843507 e!843503)))

(declare-fun c!140054 () Bool)

(assert (=> b!1509480 (= c!140054 (or (= lt!655096 (select (arr!48574 a!2804) j!70)) (= (bvadd lt!655096 lt!655096) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1509481 () Bool)

(assert (=> b!1509481 (and (bvsge (index!52949 lt!655097) #b00000000000000000000000000000000) (bvslt (index!52949 lt!655097) (size!49125 a!2804)))))

(declare-fun res!1028468 () Bool)

(assert (=> b!1509481 (= res!1028468 (= (select (arr!48574 a!2804) (index!52949 lt!655097)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!843504 () Bool)

(assert (=> b!1509481 (=> res!1028468 e!843504)))

(declare-fun b!1509482 () Bool)

(assert (=> b!1509482 (= e!843503 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!655060 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (arr!48574 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509483 () Bool)

(assert (=> b!1509483 (= e!843507 (Intermediate!12638 true lt!655060 #b00000000000000000000000000000000))))

(declare-fun b!1509484 () Bool)

(assert (=> b!1509484 (= e!843506 (bvsge (x!134903 lt!655097) #b01111111111111111111111111111110))))

(declare-fun b!1509485 () Bool)

(assert (=> b!1509485 (= e!843503 (Intermediate!12638 false lt!655060 #b00000000000000000000000000000000))))

(declare-fun b!1509486 () Bool)

(assert (=> b!1509486 (and (bvsge (index!52949 lt!655097) #b00000000000000000000000000000000) (bvslt (index!52949 lt!655097) (size!49125 a!2804)))))

(assert (=> b!1509486 (= e!843504 (= (select (arr!48574 a!2804) (index!52949 lt!655097)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1509487 () Bool)

(assert (=> b!1509487 (and (bvsge (index!52949 lt!655097) #b00000000000000000000000000000000) (bvslt (index!52949 lt!655097) (size!49125 a!2804)))))

(declare-fun res!1028466 () Bool)

(assert (=> b!1509487 (= res!1028466 (= (select (arr!48574 a!2804) (index!52949 lt!655097)) (select (arr!48574 a!2804) j!70)))))

(assert (=> b!1509487 (=> res!1028466 e!843504)))

(assert (=> b!1509487 (= e!843505 e!843504)))

(assert (= (and d!158871 c!140056) b!1509483))

(assert (= (and d!158871 (not c!140056)) b!1509480))

(assert (= (and b!1509480 c!140054) b!1509485))

(assert (= (and b!1509480 (not c!140054)) b!1509482))

(assert (= (and d!158871 c!140055) b!1509484))

(assert (= (and d!158871 (not c!140055)) b!1509479))

(assert (= (and b!1509479 res!1028467) b!1509487))

(assert (= (and b!1509487 (not res!1028466)) b!1509481))

(assert (= (and b!1509481 (not res!1028468)) b!1509486))

(declare-fun m!1392127 () Bool)

(assert (=> b!1509487 m!1392127))

(assert (=> b!1509481 m!1392127))

(assert (=> b!1509486 m!1392127))

(declare-fun m!1392129 () Bool)

(assert (=> b!1509482 m!1392129))

(assert (=> b!1509482 m!1392129))

(assert (=> b!1509482 m!1392021))

(declare-fun m!1392131 () Bool)

(assert (=> b!1509482 m!1392131))

(declare-fun m!1392133 () Bool)

(assert (=> d!158871 m!1392133))

(assert (=> d!158871 m!1392033))

(assert (=> b!1509322 d!158871))

(declare-fun d!158873 () Bool)

(declare-fun lt!655107 () (_ BitVec 32))

(declare-fun lt!655106 () (_ BitVec 32))

(assert (=> d!158873 (= lt!655107 (bvmul (bvxor lt!655106 (bvlshr lt!655106 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158873 (= lt!655106 ((_ extract 31 0) (bvand (bvxor (select (arr!48574 a!2804) j!70) (bvlshr (select (arr!48574 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158873 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1028469 (let ((h!36461 ((_ extract 31 0) (bvand (bvxor (select (arr!48574 a!2804) j!70) (bvlshr (select (arr!48574 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!134909 (bvmul (bvxor h!36461 (bvlshr h!36461 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!134909 (bvlshr x!134909 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1028469 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1028469 #b00000000000000000000000000000000))))))

(assert (=> d!158873 (= (toIndex!0 (select (arr!48574 a!2804) j!70) mask!2512) (bvand (bvxor lt!655107 (bvlshr lt!655107 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1509322 d!158873))

(check-sat (not b!1509441) (not bm!68370) (not b!1509482) (not b!1509440) (not d!158871) (not b!1509408) (not b!1509442) (not bm!68366) (not b!1509475) (not b!1509477) (not d!158839))
(check-sat)
