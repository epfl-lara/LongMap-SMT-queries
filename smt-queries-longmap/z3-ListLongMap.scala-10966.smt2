; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128372 () Bool)

(assert start!128372)

(declare-fun b!1505896 () Bool)

(declare-fun res!1026459 () Bool)

(declare-fun e!841595 () Bool)

(assert (=> b!1505896 (=> (not res!1026459) (not e!841595))))

(declare-datatypes ((array!100417 0))(
  ( (array!100418 (arr!48454 (Array (_ BitVec 32) (_ BitVec 64))) (size!49006 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100417)

(declare-datatypes ((List!35015 0))(
  ( (Nil!35012) (Cons!35011 (h!36409 (_ BitVec 64)) (t!49701 List!35015)) )
))
(declare-fun arrayNoDuplicates!0 (array!100417 (_ BitVec 32) List!35015) Bool)

(assert (=> b!1505896 (= res!1026459 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35012))))

(declare-fun b!1505897 () Bool)

(declare-fun res!1026458 () Bool)

(assert (=> b!1505897 (=> (not res!1026458) (not e!841595))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1505897 (= res!1026458 (and (= (size!49006 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49006 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49006 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1505898 () Bool)

(declare-fun lt!653877 () (_ BitVec 32))

(assert (=> b!1505898 (= e!841595 (and (bvsge mask!2512 #b00000000000000000000000000000000) (or (bvslt lt!653877 #b00000000000000000000000000000000) (bvsge lt!653877 (bvadd #b00000000000000000000000000000001 mask!2512)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1505898 (= lt!653877 (toIndex!0 (select (arr!48454 a!2804) j!70) mask!2512))))

(declare-fun res!1026462 () Bool)

(assert (=> start!128372 (=> (not res!1026462) (not e!841595))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128372 (= res!1026462 (validMask!0 mask!2512))))

(assert (=> start!128372 e!841595))

(assert (=> start!128372 true))

(declare-fun array_inv!37687 (array!100417) Bool)

(assert (=> start!128372 (array_inv!37687 a!2804)))

(declare-fun b!1505899 () Bool)

(declare-fun res!1026464 () Bool)

(assert (=> b!1505899 (=> (not res!1026464) (not e!841595))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505899 (= res!1026464 (validKeyInArray!0 (select (arr!48454 a!2804) i!961)))))

(declare-fun b!1505900 () Bool)

(declare-fun res!1026460 () Bool)

(assert (=> b!1505900 (=> (not res!1026460) (not e!841595))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100417 (_ BitVec 32)) Bool)

(assert (=> b!1505900 (= res!1026460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1505901 () Bool)

(declare-fun res!1026463 () Bool)

(assert (=> b!1505901 (=> (not res!1026463) (not e!841595))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1505901 (= res!1026463 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49006 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49006 a!2804))))))

(declare-fun b!1505902 () Bool)

(declare-fun res!1026461 () Bool)

(assert (=> b!1505902 (=> (not res!1026461) (not e!841595))))

(assert (=> b!1505902 (= res!1026461 (validKeyInArray!0 (select (arr!48454 a!2804) j!70)))))

(assert (= (and start!128372 res!1026462) b!1505897))

(assert (= (and b!1505897 res!1026458) b!1505899))

(assert (= (and b!1505899 res!1026464) b!1505902))

(assert (= (and b!1505902 res!1026461) b!1505900))

(assert (= (and b!1505900 res!1026460) b!1505896))

(assert (= (and b!1505896 res!1026459) b!1505901))

(assert (= (and b!1505901 res!1026463) b!1505898))

(declare-fun m!1388321 () Bool)

(assert (=> b!1505900 m!1388321))

(declare-fun m!1388323 () Bool)

(assert (=> b!1505898 m!1388323))

(assert (=> b!1505898 m!1388323))

(declare-fun m!1388325 () Bool)

(assert (=> b!1505898 m!1388325))

(declare-fun m!1388327 () Bool)

(assert (=> b!1505896 m!1388327))

(declare-fun m!1388329 () Bool)

(assert (=> b!1505899 m!1388329))

(assert (=> b!1505899 m!1388329))

(declare-fun m!1388331 () Bool)

(assert (=> b!1505899 m!1388331))

(assert (=> b!1505902 m!1388323))

(assert (=> b!1505902 m!1388323))

(declare-fun m!1388333 () Bool)

(assert (=> b!1505902 m!1388333))

(declare-fun m!1388335 () Bool)

(assert (=> start!128372 m!1388335))

(declare-fun m!1388337 () Bool)

(assert (=> start!128372 m!1388337))

(check-sat (not b!1505898) (not b!1505900) (not b!1505902) (not b!1505899) (not b!1505896) (not start!128372))
(check-sat)
(get-model)

(declare-fun d!157935 () Bool)

(assert (=> d!157935 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128372 d!157935))

(declare-fun d!157937 () Bool)

(assert (=> d!157937 (= (array_inv!37687 a!2804) (bvsge (size!49006 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128372 d!157937))

(declare-fun d!157939 () Bool)

(assert (=> d!157939 (= (validKeyInArray!0 (select (arr!48454 a!2804) i!961)) (and (not (= (select (arr!48454 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48454 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505899 d!157939))

(declare-fun d!157941 () Bool)

(declare-fun lt!653889 () (_ BitVec 32))

(declare-fun lt!653888 () (_ BitVec 32))

(assert (=> d!157941 (= lt!653889 (bvmul (bvxor lt!653888 (bvlshr lt!653888 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!157941 (= lt!653888 ((_ extract 31 0) (bvand (bvxor (select (arr!48454 a!2804) j!70) (bvlshr (select (arr!48454 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!157941 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1026507 (let ((h!36412 ((_ extract 31 0) (bvand (bvxor (select (arr!48454 a!2804) j!70) (bvlshr (select (arr!48454 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!134755 (bvmul (bvxor h!36412 (bvlshr h!36412 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!134755 (bvlshr x!134755 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1026507 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1026507 #b00000000000000000000000000000000))))))

(assert (=> d!157941 (= (toIndex!0 (select (arr!48454 a!2804) j!70) mask!2512) (bvand (bvxor lt!653889 (bvlshr lt!653889 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1505898 d!157941))

(declare-fun d!157947 () Bool)

(declare-fun res!1026515 () Bool)

(declare-fun e!841617 () Bool)

(assert (=> d!157947 (=> res!1026515 e!841617)))

(assert (=> d!157947 (= res!1026515 (bvsge #b00000000000000000000000000000000 (size!49006 a!2804)))))

(assert (=> d!157947 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35012) e!841617)))

(declare-fun b!1505955 () Bool)

(declare-fun e!841620 () Bool)

(assert (=> b!1505955 (= e!841617 e!841620)))

(declare-fun res!1026517 () Bool)

(assert (=> b!1505955 (=> (not res!1026517) (not e!841620))))

(declare-fun e!841619 () Bool)

(assert (=> b!1505955 (= res!1026517 (not e!841619))))

(declare-fun res!1026516 () Bool)

(assert (=> b!1505955 (=> (not res!1026516) (not e!841619))))

(assert (=> b!1505955 (= res!1026516 (validKeyInArray!0 (select (arr!48454 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68183 () Bool)

(declare-fun call!68186 () Bool)

(declare-fun c!139258 () Bool)

(assert (=> bm!68183 (= call!68186 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139258 (Cons!35011 (select (arr!48454 a!2804) #b00000000000000000000000000000000) Nil!35012) Nil!35012)))))

(declare-fun b!1505956 () Bool)

(declare-fun e!841618 () Bool)

(assert (=> b!1505956 (= e!841620 e!841618)))

(assert (=> b!1505956 (= c!139258 (validKeyInArray!0 (select (arr!48454 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1505957 () Bool)

(assert (=> b!1505957 (= e!841618 call!68186)))

(declare-fun b!1505958 () Bool)

(declare-fun contains!9927 (List!35015 (_ BitVec 64)) Bool)

(assert (=> b!1505958 (= e!841619 (contains!9927 Nil!35012 (select (arr!48454 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1505959 () Bool)

(assert (=> b!1505959 (= e!841618 call!68186)))

(assert (= (and d!157947 (not res!1026515)) b!1505955))

(assert (= (and b!1505955 res!1026516) b!1505958))

(assert (= (and b!1505955 res!1026517) b!1505956))

(assert (= (and b!1505956 c!139258) b!1505959))

(assert (= (and b!1505956 (not c!139258)) b!1505957))

(assert (= (or b!1505959 b!1505957) bm!68183))

(declare-fun m!1388375 () Bool)

(assert (=> b!1505955 m!1388375))

(assert (=> b!1505955 m!1388375))

(declare-fun m!1388377 () Bool)

(assert (=> b!1505955 m!1388377))

(assert (=> bm!68183 m!1388375))

(declare-fun m!1388379 () Bool)

(assert (=> bm!68183 m!1388379))

(assert (=> b!1505956 m!1388375))

(assert (=> b!1505956 m!1388375))

(assert (=> b!1505956 m!1388377))

(assert (=> b!1505958 m!1388375))

(assert (=> b!1505958 m!1388375))

(declare-fun m!1388381 () Bool)

(assert (=> b!1505958 m!1388381))

(assert (=> b!1505896 d!157947))

(declare-fun d!157955 () Bool)

(assert (=> d!157955 (= (validKeyInArray!0 (select (arr!48454 a!2804) j!70)) (and (not (= (select (arr!48454 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48454 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505902 d!157955))

(declare-fun b!1505992 () Bool)

(declare-fun e!841646 () Bool)

(declare-fun call!68195 () Bool)

(assert (=> b!1505992 (= e!841646 call!68195)))

(declare-fun b!1505993 () Bool)

(declare-fun e!841645 () Bool)

(assert (=> b!1505993 (= e!841645 e!841646)))

(declare-fun c!139267 () Bool)

(assert (=> b!1505993 (= c!139267 (validKeyInArray!0 (select (arr!48454 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1505994 () Bool)

(declare-fun e!841647 () Bool)

(assert (=> b!1505994 (= e!841647 call!68195)))

(declare-fun bm!68192 () Bool)

(assert (=> bm!68192 (= call!68195 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!157957 () Bool)

(declare-fun res!1026536 () Bool)

(assert (=> d!157957 (=> res!1026536 e!841645)))

(assert (=> d!157957 (= res!1026536 (bvsge #b00000000000000000000000000000000 (size!49006 a!2804)))))

(assert (=> d!157957 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!841645)))

(declare-fun b!1505995 () Bool)

(assert (=> b!1505995 (= e!841646 e!841647)))

(declare-fun lt!653926 () (_ BitVec 64))

(assert (=> b!1505995 (= lt!653926 (select (arr!48454 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50155 0))(
  ( (Unit!50156) )
))
(declare-fun lt!653924 () Unit!50155)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100417 (_ BitVec 64) (_ BitVec 32)) Unit!50155)

(assert (=> b!1505995 (= lt!653924 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!653926 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100417 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1505995 (arrayContainsKey!0 a!2804 lt!653926 #b00000000000000000000000000000000)))

(declare-fun lt!653925 () Unit!50155)

(assert (=> b!1505995 (= lt!653925 lt!653924)))

(declare-fun res!1026535 () Bool)

(declare-datatypes ((SeekEntryResult!12654 0))(
  ( (MissingZero!12654 (index!53011 (_ BitVec 32))) (Found!12654 (index!53012 (_ BitVec 32))) (Intermediate!12654 (undefined!13466 Bool) (index!53013 (_ BitVec 32)) (x!134758 (_ BitVec 32))) (Undefined!12654) (MissingVacant!12654 (index!53014 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100417 (_ BitVec 32)) SeekEntryResult!12654)

(assert (=> b!1505995 (= res!1026535 (= (seekEntryOrOpen!0 (select (arr!48454 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12654 #b00000000000000000000000000000000)))))

(assert (=> b!1505995 (=> (not res!1026535) (not e!841647))))

(assert (= (and d!157957 (not res!1026536)) b!1505993))

(assert (= (and b!1505993 c!139267) b!1505995))

(assert (= (and b!1505993 (not c!139267)) b!1505992))

(assert (= (and b!1505995 res!1026535) b!1505994))

(assert (= (or b!1505994 b!1505992) bm!68192))

(assert (=> b!1505993 m!1388375))

(assert (=> b!1505993 m!1388375))

(assert (=> b!1505993 m!1388377))

(declare-fun m!1388407 () Bool)

(assert (=> bm!68192 m!1388407))

(assert (=> b!1505995 m!1388375))

(declare-fun m!1388409 () Bool)

(assert (=> b!1505995 m!1388409))

(declare-fun m!1388411 () Bool)

(assert (=> b!1505995 m!1388411))

(assert (=> b!1505995 m!1388375))

(declare-fun m!1388413 () Bool)

(assert (=> b!1505995 m!1388413))

(assert (=> b!1505900 d!157957))

(check-sat (not bm!68192) (not b!1505958) (not b!1505993) (not b!1505995) (not b!1505956) (not bm!68183) (not b!1505955))
(check-sat)
