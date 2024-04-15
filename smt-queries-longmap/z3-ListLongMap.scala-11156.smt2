; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130248 () Bool)

(assert start!130248)

(declare-fun b!1529615 () Bool)

(declare-fun res!1047516 () Bool)

(declare-fun e!852337 () Bool)

(assert (=> b!1529615 (=> (not res!1047516) (not e!852337))))

(declare-datatypes ((SeekEntryResult!13212 0))(
  ( (MissingZero!13212 (index!55243 (_ BitVec 32))) (Found!13212 (index!55244 (_ BitVec 32))) (Intermediate!13212 (undefined!14024 Bool) (index!55245 (_ BitVec 32)) (x!136926 (_ BitVec 32))) (Undefined!13212) (MissingVacant!13212 (index!55246 (_ BitVec 32))) )
))
(declare-fun lt!662312 () SeekEntryResult!13212)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101596 0))(
  ( (array!101597 (arr!49024 (Array (_ BitVec 32) (_ BitVec 64))) (size!49576 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101596)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101596 (_ BitVec 32)) SeekEntryResult!13212)

(assert (=> b!1529615 (= res!1047516 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49024 a!2804) j!70) a!2804 mask!2512) lt!662312))))

(declare-fun b!1529616 () Bool)

(declare-fun res!1047511 () Bool)

(assert (=> b!1529616 (=> (not res!1047511) (not e!852337))))

(declare-fun lt!662313 () SeekEntryResult!13212)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529616 (= res!1047511 (= lt!662313 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101597 (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49576 a!2804)) mask!2512)))))

(declare-fun b!1529617 () Bool)

(declare-fun e!852336 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101596 (_ BitVec 32)) SeekEntryResult!13212)

(assert (=> b!1529617 (= e!852336 (= (seekEntry!0 (select (arr!49024 a!2804) j!70) a!2804 mask!2512) (Found!13212 j!70)))))

(declare-fun res!1047509 () Bool)

(declare-fun e!852339 () Bool)

(assert (=> start!130248 (=> (not res!1047509) (not e!852339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130248 (= res!1047509 (validMask!0 mask!2512))))

(assert (=> start!130248 e!852339))

(assert (=> start!130248 true))

(declare-fun array_inv!38257 (array!101596) Bool)

(assert (=> start!130248 (array_inv!38257 a!2804)))

(declare-fun b!1529618 () Bool)

(declare-fun res!1047508 () Bool)

(assert (=> b!1529618 (=> (not res!1047508) (not e!852339))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529618 (= res!1047508 (validKeyInArray!0 (select (arr!49024 a!2804) i!961)))))

(declare-fun b!1529619 () Bool)

(declare-fun res!1047514 () Bool)

(assert (=> b!1529619 (=> (not res!1047514) (not e!852339))))

(assert (=> b!1529619 (= res!1047514 (and (= (size!49576 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49576 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49576 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529620 () Bool)

(assert (=> b!1529620 (= e!852339 e!852337)))

(declare-fun res!1047510 () Bool)

(assert (=> b!1529620 (=> (not res!1047510) (not e!852337))))

(assert (=> b!1529620 (= res!1047510 (= lt!662313 lt!662312))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1529620 (= lt!662312 (Intermediate!13212 false resIndex!21 resX!21))))

(assert (=> b!1529620 (= lt!662313 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49024 a!2804) j!70) mask!2512) (select (arr!49024 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529621 () Bool)

(declare-fun e!852338 () Bool)

(assert (=> b!1529621 (= e!852337 (not e!852338))))

(declare-fun res!1047513 () Bool)

(assert (=> b!1529621 (=> res!1047513 e!852338)))

(assert (=> b!1529621 (= res!1047513 (or (not (= (select (arr!49024 a!2804) j!70) (select (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1529621 e!852336))

(declare-fun res!1047507 () Bool)

(assert (=> b!1529621 (=> (not res!1047507) (not e!852336))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101596 (_ BitVec 32)) Bool)

(assert (=> b!1529621 (= res!1047507 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51047 0))(
  ( (Unit!51048) )
))
(declare-fun lt!662311 () Unit!51047)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101596 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51047)

(assert (=> b!1529621 (= lt!662311 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529622 () Bool)

(declare-fun res!1047512 () Bool)

(assert (=> b!1529622 (=> (not res!1047512) (not e!852339))))

(assert (=> b!1529622 (= res!1047512 (validKeyInArray!0 (select (arr!49024 a!2804) j!70)))))

(declare-fun b!1529623 () Bool)

(declare-fun res!1047517 () Bool)

(assert (=> b!1529623 (=> (not res!1047517) (not e!852339))))

(declare-datatypes ((List!35585 0))(
  ( (Nil!35582) (Cons!35581 (h!37018 (_ BitVec 64)) (t!50271 List!35585)) )
))
(declare-fun arrayNoDuplicates!0 (array!101596 (_ BitVec 32) List!35585) Bool)

(assert (=> b!1529623 (= res!1047517 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35582))))

(declare-fun b!1529624 () Bool)

(declare-fun res!1047506 () Bool)

(assert (=> b!1529624 (=> (not res!1047506) (not e!852339))))

(assert (=> b!1529624 (= res!1047506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529625 () Bool)

(assert (=> b!1529625 (= e!852338 (and (bvsge (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110)))))

(declare-fun lt!662310 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529625 (= lt!662310 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1529626 () Bool)

(declare-fun res!1047515 () Bool)

(assert (=> b!1529626 (=> (not res!1047515) (not e!852339))))

(assert (=> b!1529626 (= res!1047515 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49576 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49576 a!2804))))))

(assert (= (and start!130248 res!1047509) b!1529619))

(assert (= (and b!1529619 res!1047514) b!1529618))

(assert (= (and b!1529618 res!1047508) b!1529622))

(assert (= (and b!1529622 res!1047512) b!1529624))

(assert (= (and b!1529624 res!1047506) b!1529623))

(assert (= (and b!1529623 res!1047517) b!1529626))

(assert (= (and b!1529626 res!1047515) b!1529620))

(assert (= (and b!1529620 res!1047510) b!1529615))

(assert (= (and b!1529615 res!1047516) b!1529616))

(assert (= (and b!1529616 res!1047511) b!1529621))

(assert (= (and b!1529621 res!1047507) b!1529617))

(assert (= (and b!1529621 (not res!1047513)) b!1529625))

(declare-fun m!1412009 () Bool)

(assert (=> b!1529615 m!1412009))

(assert (=> b!1529615 m!1412009))

(declare-fun m!1412011 () Bool)

(assert (=> b!1529615 m!1412011))

(declare-fun m!1412013 () Bool)

(assert (=> b!1529616 m!1412013))

(declare-fun m!1412015 () Bool)

(assert (=> b!1529616 m!1412015))

(assert (=> b!1529616 m!1412015))

(declare-fun m!1412017 () Bool)

(assert (=> b!1529616 m!1412017))

(assert (=> b!1529616 m!1412017))

(assert (=> b!1529616 m!1412015))

(declare-fun m!1412019 () Bool)

(assert (=> b!1529616 m!1412019))

(assert (=> b!1529620 m!1412009))

(assert (=> b!1529620 m!1412009))

(declare-fun m!1412021 () Bool)

(assert (=> b!1529620 m!1412021))

(assert (=> b!1529620 m!1412021))

(assert (=> b!1529620 m!1412009))

(declare-fun m!1412023 () Bool)

(assert (=> b!1529620 m!1412023))

(declare-fun m!1412025 () Bool)

(assert (=> start!130248 m!1412025))

(declare-fun m!1412027 () Bool)

(assert (=> start!130248 m!1412027))

(declare-fun m!1412029 () Bool)

(assert (=> b!1529625 m!1412029))

(declare-fun m!1412031 () Bool)

(assert (=> b!1529624 m!1412031))

(assert (=> b!1529617 m!1412009))

(assert (=> b!1529617 m!1412009))

(declare-fun m!1412033 () Bool)

(assert (=> b!1529617 m!1412033))

(declare-fun m!1412035 () Bool)

(assert (=> b!1529618 m!1412035))

(assert (=> b!1529618 m!1412035))

(declare-fun m!1412037 () Bool)

(assert (=> b!1529618 m!1412037))

(assert (=> b!1529621 m!1412009))

(declare-fun m!1412039 () Bool)

(assert (=> b!1529621 m!1412039))

(assert (=> b!1529621 m!1412013))

(assert (=> b!1529621 m!1412015))

(declare-fun m!1412041 () Bool)

(assert (=> b!1529621 m!1412041))

(assert (=> b!1529622 m!1412009))

(assert (=> b!1529622 m!1412009))

(declare-fun m!1412043 () Bool)

(assert (=> b!1529622 m!1412043))

(declare-fun m!1412045 () Bool)

(assert (=> b!1529623 m!1412045))

(check-sat (not b!1529622) (not b!1529625) (not b!1529615) (not start!130248) (not b!1529624) (not b!1529617) (not b!1529623) (not b!1529621) (not b!1529618) (not b!1529616) (not b!1529620))
(check-sat)
(get-model)

(declare-fun bm!68455 () Bool)

(declare-fun call!68458 () Bool)

(assert (=> bm!68455 (= call!68458 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!159483 () Bool)

(declare-fun res!1047595 () Bool)

(declare-fun e!852377 () Bool)

(assert (=> d!159483 (=> res!1047595 e!852377)))

(assert (=> d!159483 (= res!1047595 (bvsge #b00000000000000000000000000000000 (size!49576 a!2804)))))

(assert (=> d!159483 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!852377)))

(declare-fun b!1529707 () Bool)

(declare-fun e!852379 () Bool)

(assert (=> b!1529707 (= e!852379 call!68458)))

(declare-fun b!1529708 () Bool)

(declare-fun e!852378 () Bool)

(assert (=> b!1529708 (= e!852378 call!68458)))

(declare-fun b!1529709 () Bool)

(assert (=> b!1529709 (= e!852379 e!852378)))

(declare-fun lt!662345 () (_ BitVec 64))

(assert (=> b!1529709 (= lt!662345 (select (arr!49024 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!662346 () Unit!51047)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101596 (_ BitVec 64) (_ BitVec 32)) Unit!51047)

(assert (=> b!1529709 (= lt!662346 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!662345 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101596 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1529709 (arrayContainsKey!0 a!2804 lt!662345 #b00000000000000000000000000000000)))

(declare-fun lt!662344 () Unit!51047)

(assert (=> b!1529709 (= lt!662344 lt!662346)))

(declare-fun res!1047594 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101596 (_ BitVec 32)) SeekEntryResult!13212)

(assert (=> b!1529709 (= res!1047594 (= (seekEntryOrOpen!0 (select (arr!49024 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13212 #b00000000000000000000000000000000)))))

(assert (=> b!1529709 (=> (not res!1047594) (not e!852378))))

(declare-fun b!1529710 () Bool)

(assert (=> b!1529710 (= e!852377 e!852379)))

(declare-fun c!140613 () Bool)

(assert (=> b!1529710 (= c!140613 (validKeyInArray!0 (select (arr!49024 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!159483 (not res!1047595)) b!1529710))

(assert (= (and b!1529710 c!140613) b!1529709))

(assert (= (and b!1529710 (not c!140613)) b!1529707))

(assert (= (and b!1529709 res!1047594) b!1529708))

(assert (= (or b!1529708 b!1529707) bm!68455))

(declare-fun m!1412123 () Bool)

(assert (=> bm!68455 m!1412123))

(declare-fun m!1412125 () Bool)

(assert (=> b!1529709 m!1412125))

(declare-fun m!1412127 () Bool)

(assert (=> b!1529709 m!1412127))

(declare-fun m!1412129 () Bool)

(assert (=> b!1529709 m!1412129))

(assert (=> b!1529709 m!1412125))

(declare-fun m!1412131 () Bool)

(assert (=> b!1529709 m!1412131))

(assert (=> b!1529710 m!1412125))

(assert (=> b!1529710 m!1412125))

(declare-fun m!1412133 () Bool)

(assert (=> b!1529710 m!1412133))

(assert (=> b!1529624 d!159483))

(declare-fun d!159485 () Bool)

(assert (=> d!159485 (= (validKeyInArray!0 (select (arr!49024 a!2804) i!961)) (and (not (= (select (arr!49024 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49024 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1529618 d!159485))

(declare-fun d!159487 () Bool)

(assert (=> d!159487 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!130248 d!159487))

(declare-fun d!159491 () Bool)

(assert (=> d!159491 (= (array_inv!38257 a!2804) (bvsge (size!49576 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!130248 d!159491))

(declare-fun bm!68458 () Bool)

(declare-fun call!68461 () Bool)

(declare-fun c!140616 () Bool)

(assert (=> bm!68458 (= call!68461 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140616 (Cons!35581 (select (arr!49024 a!2804) #b00000000000000000000000000000000) Nil!35582) Nil!35582)))))

(declare-fun d!159495 () Bool)

(declare-fun res!1047602 () Bool)

(declare-fun e!852388 () Bool)

(assert (=> d!159495 (=> res!1047602 e!852388)))

(assert (=> d!159495 (= res!1047602 (bvsge #b00000000000000000000000000000000 (size!49576 a!2804)))))

(assert (=> d!159495 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35582) e!852388)))

(declare-fun b!1529721 () Bool)

(declare-fun e!852391 () Bool)

(declare-fun e!852389 () Bool)

(assert (=> b!1529721 (= e!852391 e!852389)))

(assert (=> b!1529721 (= c!140616 (validKeyInArray!0 (select (arr!49024 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1529722 () Bool)

(declare-fun e!852390 () Bool)

(declare-fun contains!9961 (List!35585 (_ BitVec 64)) Bool)

(assert (=> b!1529722 (= e!852390 (contains!9961 Nil!35582 (select (arr!49024 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1529723 () Bool)

(assert (=> b!1529723 (= e!852389 call!68461)))

(declare-fun b!1529724 () Bool)

(assert (=> b!1529724 (= e!852388 e!852391)))

(declare-fun res!1047604 () Bool)

(assert (=> b!1529724 (=> (not res!1047604) (not e!852391))))

(assert (=> b!1529724 (= res!1047604 (not e!852390))))

(declare-fun res!1047603 () Bool)

(assert (=> b!1529724 (=> (not res!1047603) (not e!852390))))

(assert (=> b!1529724 (= res!1047603 (validKeyInArray!0 (select (arr!49024 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1529725 () Bool)

(assert (=> b!1529725 (= e!852389 call!68461)))

(assert (= (and d!159495 (not res!1047602)) b!1529724))

(assert (= (and b!1529724 res!1047603) b!1529722))

(assert (= (and b!1529724 res!1047604) b!1529721))

(assert (= (and b!1529721 c!140616) b!1529725))

(assert (= (and b!1529721 (not c!140616)) b!1529723))

(assert (= (or b!1529725 b!1529723) bm!68458))

(assert (=> bm!68458 m!1412125))

(declare-fun m!1412137 () Bool)

(assert (=> bm!68458 m!1412137))

(assert (=> b!1529721 m!1412125))

(assert (=> b!1529721 m!1412125))

(assert (=> b!1529721 m!1412133))

(assert (=> b!1529722 m!1412125))

(assert (=> b!1529722 m!1412125))

(declare-fun m!1412139 () Bool)

(assert (=> b!1529722 m!1412139))

(assert (=> b!1529724 m!1412125))

(assert (=> b!1529724 m!1412125))

(assert (=> b!1529724 m!1412133))

(assert (=> b!1529623 d!159495))

(declare-fun b!1529777 () Bool)

(declare-fun e!852423 () SeekEntryResult!13212)

(assert (=> b!1529777 (= e!852423 Undefined!13212)))

(declare-fun b!1529778 () Bool)

(declare-fun c!140636 () Bool)

(declare-fun lt!662378 () (_ BitVec 64))

(assert (=> b!1529778 (= c!140636 (= lt!662378 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!852422 () SeekEntryResult!13212)

(declare-fun e!852424 () SeekEntryResult!13212)

(assert (=> b!1529778 (= e!852422 e!852424)))

(declare-fun b!1529779 () Bool)

(declare-fun lt!662376 () SeekEntryResult!13212)

(assert (=> b!1529779 (= e!852424 (MissingZero!13212 (index!55245 lt!662376)))))

(declare-fun b!1529780 () Bool)

(declare-fun lt!662377 () SeekEntryResult!13212)

(get-info :version)

(assert (=> b!1529780 (= e!852424 (ite ((_ is MissingVacant!13212) lt!662377) (MissingZero!13212 (index!55246 lt!662377)) lt!662377))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101596 (_ BitVec 32)) SeekEntryResult!13212)

(assert (=> b!1529780 (= lt!662377 (seekKeyOrZeroReturnVacant!0 (x!136926 lt!662376) (index!55245 lt!662376) (index!55245 lt!662376) (select (arr!49024 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529781 () Bool)

(assert (=> b!1529781 (= e!852422 (Found!13212 (index!55245 lt!662376)))))

(declare-fun b!1529782 () Bool)

(assert (=> b!1529782 (= e!852423 e!852422)))

(assert (=> b!1529782 (= lt!662378 (select (arr!49024 a!2804) (index!55245 lt!662376)))))

(declare-fun c!140635 () Bool)

(assert (=> b!1529782 (= c!140635 (= lt!662378 (select (arr!49024 a!2804) j!70)))))

(declare-fun d!159501 () Bool)

(declare-fun lt!662379 () SeekEntryResult!13212)

(assert (=> d!159501 (and (or ((_ is MissingVacant!13212) lt!662379) (not ((_ is Found!13212) lt!662379)) (and (bvsge (index!55244 lt!662379) #b00000000000000000000000000000000) (bvslt (index!55244 lt!662379) (size!49576 a!2804)))) (not ((_ is MissingVacant!13212) lt!662379)) (or (not ((_ is Found!13212) lt!662379)) (= (select (arr!49024 a!2804) (index!55244 lt!662379)) (select (arr!49024 a!2804) j!70))))))

(assert (=> d!159501 (= lt!662379 e!852423)))

(declare-fun c!140637 () Bool)

(assert (=> d!159501 (= c!140637 (and ((_ is Intermediate!13212) lt!662376) (undefined!14024 lt!662376)))))

(assert (=> d!159501 (= lt!662376 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49024 a!2804) j!70) mask!2512) (select (arr!49024 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159501 (validMask!0 mask!2512)))

(assert (=> d!159501 (= (seekEntry!0 (select (arr!49024 a!2804) j!70) a!2804 mask!2512) lt!662379)))

(assert (= (and d!159501 c!140637) b!1529777))

(assert (= (and d!159501 (not c!140637)) b!1529782))

(assert (= (and b!1529782 c!140635) b!1529781))

(assert (= (and b!1529782 (not c!140635)) b!1529778))

(assert (= (and b!1529778 c!140636) b!1529779))

(assert (= (and b!1529778 (not c!140636)) b!1529780))

(assert (=> b!1529780 m!1412009))

(declare-fun m!1412159 () Bool)

(assert (=> b!1529780 m!1412159))

(declare-fun m!1412161 () Bool)

(assert (=> b!1529782 m!1412161))

(declare-fun m!1412163 () Bool)

(assert (=> d!159501 m!1412163))

(assert (=> d!159501 m!1412009))

(assert (=> d!159501 m!1412021))

(assert (=> d!159501 m!1412021))

(assert (=> d!159501 m!1412009))

(assert (=> d!159501 m!1412023))

(assert (=> d!159501 m!1412025))

(assert (=> b!1529617 d!159501))

(declare-fun d!159509 () Bool)

(assert (=> d!159509 (= (validKeyInArray!0 (select (arr!49024 a!2804) j!70)) (and (not (= (select (arr!49024 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49024 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1529622 d!159509))

(declare-fun b!1529828 () Bool)

(declare-fun lt!662403 () SeekEntryResult!13212)

(assert (=> b!1529828 (and (bvsge (index!55245 lt!662403) #b00000000000000000000000000000000) (bvslt (index!55245 lt!662403) (size!49576 (array!101597 (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49576 a!2804)))))))

(declare-fun e!852452 () Bool)

(assert (=> b!1529828 (= e!852452 (= (select (arr!49024 (array!101597 (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49576 a!2804))) (index!55245 lt!662403)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1529829 () Bool)

(assert (=> b!1529829 (and (bvsge (index!55245 lt!662403) #b00000000000000000000000000000000) (bvslt (index!55245 lt!662403) (size!49576 (array!101597 (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49576 a!2804)))))))

(declare-fun res!1047637 () Bool)

(assert (=> b!1529829 (= res!1047637 (= (select (arr!49024 (array!101597 (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49576 a!2804))) (index!55245 lt!662403)) (select (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1529829 (=> res!1047637 e!852452)))

(declare-fun e!852451 () Bool)

(assert (=> b!1529829 (= e!852451 e!852452)))

(declare-fun e!852453 () SeekEntryResult!13212)

(declare-fun b!1529830 () Bool)

(assert (=> b!1529830 (= e!852453 (Intermediate!13212 true (toIndex!0 (select (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun e!852454 () SeekEntryResult!13212)

(declare-fun b!1529831 () Bool)

(assert (=> b!1529831 (= e!852454 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101597 (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49576 a!2804)) mask!2512))))

(declare-fun d!159511 () Bool)

(declare-fun e!852450 () Bool)

(assert (=> d!159511 e!852450))

(declare-fun c!140654 () Bool)

(assert (=> d!159511 (= c!140654 (and ((_ is Intermediate!13212) lt!662403) (undefined!14024 lt!662403)))))

(assert (=> d!159511 (= lt!662403 e!852453)))

(declare-fun c!140653 () Bool)

(assert (=> d!159511 (= c!140653 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!662404 () (_ BitVec 64))

(assert (=> d!159511 (= lt!662404 (select (arr!49024 (array!101597 (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49576 a!2804))) (toIndex!0 (select (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!159511 (validMask!0 mask!2512)))

(assert (=> d!159511 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101597 (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49576 a!2804)) mask!2512) lt!662403)))

(declare-fun b!1529832 () Bool)

(assert (=> b!1529832 (= e!852454 (Intermediate!13212 false (toIndex!0 (select (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1529833 () Bool)

(assert (=> b!1529833 (= e!852453 e!852454)))

(declare-fun c!140655 () Bool)

(assert (=> b!1529833 (= c!140655 (or (= lt!662404 (select (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!662404 lt!662404) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1529834 () Bool)

(assert (=> b!1529834 (= e!852450 (bvsge (x!136926 lt!662403) #b01111111111111111111111111111110))))

(declare-fun b!1529835 () Bool)

(assert (=> b!1529835 (and (bvsge (index!55245 lt!662403) #b00000000000000000000000000000000) (bvslt (index!55245 lt!662403) (size!49576 (array!101597 (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49576 a!2804)))))))

(declare-fun res!1047638 () Bool)

(assert (=> b!1529835 (= res!1047638 (= (select (arr!49024 (array!101597 (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49576 a!2804))) (index!55245 lt!662403)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1529835 (=> res!1047638 e!852452)))

(declare-fun b!1529836 () Bool)

(assert (=> b!1529836 (= e!852450 e!852451)))

(declare-fun res!1047639 () Bool)

(assert (=> b!1529836 (= res!1047639 (and ((_ is Intermediate!13212) lt!662403) (not (undefined!14024 lt!662403)) (bvslt (x!136926 lt!662403) #b01111111111111111111111111111110) (bvsge (x!136926 lt!662403) #b00000000000000000000000000000000) (bvsge (x!136926 lt!662403) #b00000000000000000000000000000000)))))

(assert (=> b!1529836 (=> (not res!1047639) (not e!852451))))

(assert (= (and d!159511 c!140653) b!1529830))

(assert (= (and d!159511 (not c!140653)) b!1529833))

(assert (= (and b!1529833 c!140655) b!1529832))

(assert (= (and b!1529833 (not c!140655)) b!1529831))

(assert (= (and d!159511 c!140654) b!1529834))

(assert (= (and d!159511 (not c!140654)) b!1529836))

(assert (= (and b!1529836 res!1047639) b!1529829))

(assert (= (and b!1529829 (not res!1047637)) b!1529835))

(assert (= (and b!1529835 (not res!1047638)) b!1529828))

(assert (=> d!159511 m!1412017))

(declare-fun m!1412175 () Bool)

(assert (=> d!159511 m!1412175))

(assert (=> d!159511 m!1412025))

(declare-fun m!1412177 () Bool)

(assert (=> b!1529828 m!1412177))

(assert (=> b!1529835 m!1412177))

(assert (=> b!1529829 m!1412177))

(assert (=> b!1529831 m!1412017))

(declare-fun m!1412179 () Bool)

(assert (=> b!1529831 m!1412179))

(assert (=> b!1529831 m!1412179))

(assert (=> b!1529831 m!1412015))

(declare-fun m!1412181 () Bool)

(assert (=> b!1529831 m!1412181))

(assert (=> b!1529616 d!159511))

(declare-fun d!159527 () Bool)

(declare-fun lt!662421 () (_ BitVec 32))

(declare-fun lt!662420 () (_ BitVec 32))

(assert (=> d!159527 (= lt!662421 (bvmul (bvxor lt!662420 (bvlshr lt!662420 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159527 (= lt!662420 ((_ extract 31 0) (bvand (bvxor (select (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159527 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1047644 (let ((h!37023 ((_ extract 31 0) (bvand (bvxor (select (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136936 (bvmul (bvxor h!37023 (bvlshr h!37023 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136936 (bvlshr x!136936 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1047644 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1047644 #b00000000000000000000000000000000))))))

(assert (=> d!159527 (= (toIndex!0 (select (store (arr!49024 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!662421 (bvlshr lt!662421 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1529616 d!159527))

(declare-fun bm!68467 () Bool)

(declare-fun call!68470 () Bool)

(assert (=> bm!68467 (= call!68470 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!159531 () Bool)

(declare-fun res!1047654 () Bool)

(declare-fun e!852472 () Bool)

(assert (=> d!159531 (=> res!1047654 e!852472)))

(assert (=> d!159531 (= res!1047654 (bvsge j!70 (size!49576 a!2804)))))

(assert (=> d!159531 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!852472)))

(declare-fun b!1529859 () Bool)

(declare-fun e!852474 () Bool)

(assert (=> b!1529859 (= e!852474 call!68470)))

(declare-fun b!1529860 () Bool)

(declare-fun e!852473 () Bool)

(assert (=> b!1529860 (= e!852473 call!68470)))

(declare-fun b!1529861 () Bool)

(assert (=> b!1529861 (= e!852474 e!852473)))

(declare-fun lt!662423 () (_ BitVec 64))

(assert (=> b!1529861 (= lt!662423 (select (arr!49024 a!2804) j!70))))

(declare-fun lt!662424 () Unit!51047)

(assert (=> b!1529861 (= lt!662424 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!662423 j!70))))

(assert (=> b!1529861 (arrayContainsKey!0 a!2804 lt!662423 #b00000000000000000000000000000000)))

(declare-fun lt!662422 () Unit!51047)

(assert (=> b!1529861 (= lt!662422 lt!662424)))

(declare-fun res!1047653 () Bool)

(assert (=> b!1529861 (= res!1047653 (= (seekEntryOrOpen!0 (select (arr!49024 a!2804) j!70) a!2804 mask!2512) (Found!13212 j!70)))))

(assert (=> b!1529861 (=> (not res!1047653) (not e!852473))))

(declare-fun b!1529862 () Bool)

(assert (=> b!1529862 (= e!852472 e!852474)))

(declare-fun c!140661 () Bool)

(assert (=> b!1529862 (= c!140661 (validKeyInArray!0 (select (arr!49024 a!2804) j!70)))))

(assert (= (and d!159531 (not res!1047654)) b!1529862))

(assert (= (and b!1529862 c!140661) b!1529861))

(assert (= (and b!1529862 (not c!140661)) b!1529859))

(assert (= (and b!1529861 res!1047653) b!1529860))

(assert (= (or b!1529860 b!1529859) bm!68467))

(declare-fun m!1412191 () Bool)

(assert (=> bm!68467 m!1412191))

(assert (=> b!1529861 m!1412009))

(declare-fun m!1412193 () Bool)

(assert (=> b!1529861 m!1412193))

(declare-fun m!1412195 () Bool)

(assert (=> b!1529861 m!1412195))

(assert (=> b!1529861 m!1412009))

(declare-fun m!1412197 () Bool)

(assert (=> b!1529861 m!1412197))

(assert (=> b!1529862 m!1412009))

(assert (=> b!1529862 m!1412009))

(assert (=> b!1529862 m!1412043))

(assert (=> b!1529621 d!159531))

(declare-fun d!159533 () Bool)

(assert (=> d!159533 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!662441 () Unit!51047)

(declare-fun choose!38 (array!101596 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51047)

(assert (=> d!159533 (= lt!662441 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159533 (validMask!0 mask!2512)))

(assert (=> d!159533 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!662441)))

(declare-fun bs!43831 () Bool)

(assert (= bs!43831 d!159533))

(assert (=> bs!43831 m!1412041))

(declare-fun m!1412239 () Bool)

(assert (=> bs!43831 m!1412239))

(assert (=> bs!43831 m!1412025))

(assert (=> b!1529621 d!159533))

(declare-fun b!1529899 () Bool)

(declare-fun lt!662444 () SeekEntryResult!13212)

(assert (=> b!1529899 (and (bvsge (index!55245 lt!662444) #b00000000000000000000000000000000) (bvslt (index!55245 lt!662444) (size!49576 a!2804)))))

(declare-fun e!852499 () Bool)

(assert (=> b!1529899 (= e!852499 (= (select (arr!49024 a!2804) (index!55245 lt!662444)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1529900 () Bool)

(assert (=> b!1529900 (and (bvsge (index!55245 lt!662444) #b00000000000000000000000000000000) (bvslt (index!55245 lt!662444) (size!49576 a!2804)))))

(declare-fun res!1047669 () Bool)

(assert (=> b!1529900 (= res!1047669 (= (select (arr!49024 a!2804) (index!55245 lt!662444)) (select (arr!49024 a!2804) j!70)))))

(assert (=> b!1529900 (=> res!1047669 e!852499)))

(declare-fun e!852498 () Bool)

(assert (=> b!1529900 (= e!852498 e!852499)))

(declare-fun b!1529901 () Bool)

(declare-fun e!852500 () SeekEntryResult!13212)

(assert (=> b!1529901 (= e!852500 (Intermediate!13212 true index!487 x!534))))

(declare-fun b!1529902 () Bool)

(declare-fun e!852501 () SeekEntryResult!13212)

(assert (=> b!1529902 (= e!852501 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!49024 a!2804) j!70) a!2804 mask!2512))))

(declare-fun d!159549 () Bool)

(declare-fun e!852497 () Bool)

(assert (=> d!159549 e!852497))

(declare-fun c!140674 () Bool)

(assert (=> d!159549 (= c!140674 (and ((_ is Intermediate!13212) lt!662444) (undefined!14024 lt!662444)))))

(assert (=> d!159549 (= lt!662444 e!852500)))

(declare-fun c!140673 () Bool)

(assert (=> d!159549 (= c!140673 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!662445 () (_ BitVec 64))

(assert (=> d!159549 (= lt!662445 (select (arr!49024 a!2804) index!487))))

(assert (=> d!159549 (validMask!0 mask!2512)))

(assert (=> d!159549 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49024 a!2804) j!70) a!2804 mask!2512) lt!662444)))

(declare-fun b!1529903 () Bool)

(assert (=> b!1529903 (= e!852501 (Intermediate!13212 false index!487 x!534))))

(declare-fun b!1529904 () Bool)

(assert (=> b!1529904 (= e!852500 e!852501)))

(declare-fun c!140675 () Bool)

(assert (=> b!1529904 (= c!140675 (or (= lt!662445 (select (arr!49024 a!2804) j!70)) (= (bvadd lt!662445 lt!662445) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1529905 () Bool)

(assert (=> b!1529905 (= e!852497 (bvsge (x!136926 lt!662444) #b01111111111111111111111111111110))))

(declare-fun b!1529906 () Bool)

(assert (=> b!1529906 (and (bvsge (index!55245 lt!662444) #b00000000000000000000000000000000) (bvslt (index!55245 lt!662444) (size!49576 a!2804)))))

(declare-fun res!1047670 () Bool)

(assert (=> b!1529906 (= res!1047670 (= (select (arr!49024 a!2804) (index!55245 lt!662444)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1529906 (=> res!1047670 e!852499)))

(declare-fun b!1529907 () Bool)

(assert (=> b!1529907 (= e!852497 e!852498)))

(declare-fun res!1047671 () Bool)

(assert (=> b!1529907 (= res!1047671 (and ((_ is Intermediate!13212) lt!662444) (not (undefined!14024 lt!662444)) (bvslt (x!136926 lt!662444) #b01111111111111111111111111111110) (bvsge (x!136926 lt!662444) #b00000000000000000000000000000000) (bvsge (x!136926 lt!662444) x!534)))))

(assert (=> b!1529907 (=> (not res!1047671) (not e!852498))))

(assert (= (and d!159549 c!140673) b!1529901))

(assert (= (and d!159549 (not c!140673)) b!1529904))

(assert (= (and b!1529904 c!140675) b!1529903))

(assert (= (and b!1529904 (not c!140675)) b!1529902))

(assert (= (and d!159549 c!140674) b!1529905))

(assert (= (and d!159549 (not c!140674)) b!1529907))

(assert (= (and b!1529907 res!1047671) b!1529900))

(assert (= (and b!1529900 (not res!1047669)) b!1529906))

(assert (= (and b!1529906 (not res!1047670)) b!1529899))

(declare-fun m!1412241 () Bool)

(assert (=> d!159549 m!1412241))

(assert (=> d!159549 m!1412025))

(declare-fun m!1412243 () Bool)

(assert (=> b!1529899 m!1412243))

(assert (=> b!1529906 m!1412243))

(assert (=> b!1529900 m!1412243))

(assert (=> b!1529902 m!1412029))

(assert (=> b!1529902 m!1412029))

(assert (=> b!1529902 m!1412009))

(declare-fun m!1412245 () Bool)

(assert (=> b!1529902 m!1412245))

(assert (=> b!1529615 d!159549))

(declare-fun b!1529908 () Bool)

(declare-fun lt!662446 () SeekEntryResult!13212)

(assert (=> b!1529908 (and (bvsge (index!55245 lt!662446) #b00000000000000000000000000000000) (bvslt (index!55245 lt!662446) (size!49576 a!2804)))))

(declare-fun e!852504 () Bool)

(assert (=> b!1529908 (= e!852504 (= (select (arr!49024 a!2804) (index!55245 lt!662446)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1529909 () Bool)

(assert (=> b!1529909 (and (bvsge (index!55245 lt!662446) #b00000000000000000000000000000000) (bvslt (index!55245 lt!662446) (size!49576 a!2804)))))

(declare-fun res!1047672 () Bool)

(assert (=> b!1529909 (= res!1047672 (= (select (arr!49024 a!2804) (index!55245 lt!662446)) (select (arr!49024 a!2804) j!70)))))

(assert (=> b!1529909 (=> res!1047672 e!852504)))

(declare-fun e!852503 () Bool)

(assert (=> b!1529909 (= e!852503 e!852504)))

(declare-fun e!852505 () SeekEntryResult!13212)

(declare-fun b!1529910 () Bool)

(assert (=> b!1529910 (= e!852505 (Intermediate!13212 true (toIndex!0 (select (arr!49024 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1529911 () Bool)

(declare-fun e!852506 () SeekEntryResult!13212)

(assert (=> b!1529911 (= e!852506 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!49024 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!49024 a!2804) j!70) a!2804 mask!2512))))

(declare-fun d!159553 () Bool)

(declare-fun e!852502 () Bool)

(assert (=> d!159553 e!852502))

(declare-fun c!140677 () Bool)

(assert (=> d!159553 (= c!140677 (and ((_ is Intermediate!13212) lt!662446) (undefined!14024 lt!662446)))))

(assert (=> d!159553 (= lt!662446 e!852505)))

(declare-fun c!140676 () Bool)

(assert (=> d!159553 (= c!140676 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!662447 () (_ BitVec 64))

(assert (=> d!159553 (= lt!662447 (select (arr!49024 a!2804) (toIndex!0 (select (arr!49024 a!2804) j!70) mask!2512)))))

(assert (=> d!159553 (validMask!0 mask!2512)))

(assert (=> d!159553 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49024 a!2804) j!70) mask!2512) (select (arr!49024 a!2804) j!70) a!2804 mask!2512) lt!662446)))

(declare-fun b!1529912 () Bool)

(assert (=> b!1529912 (= e!852506 (Intermediate!13212 false (toIndex!0 (select (arr!49024 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1529913 () Bool)

(assert (=> b!1529913 (= e!852505 e!852506)))

(declare-fun c!140678 () Bool)

(assert (=> b!1529913 (= c!140678 (or (= lt!662447 (select (arr!49024 a!2804) j!70)) (= (bvadd lt!662447 lt!662447) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1529914 () Bool)

(assert (=> b!1529914 (= e!852502 (bvsge (x!136926 lt!662446) #b01111111111111111111111111111110))))

(declare-fun b!1529915 () Bool)

(assert (=> b!1529915 (and (bvsge (index!55245 lt!662446) #b00000000000000000000000000000000) (bvslt (index!55245 lt!662446) (size!49576 a!2804)))))

(declare-fun res!1047673 () Bool)

(assert (=> b!1529915 (= res!1047673 (= (select (arr!49024 a!2804) (index!55245 lt!662446)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1529915 (=> res!1047673 e!852504)))

(declare-fun b!1529916 () Bool)

(assert (=> b!1529916 (= e!852502 e!852503)))

(declare-fun res!1047674 () Bool)

(assert (=> b!1529916 (= res!1047674 (and ((_ is Intermediate!13212) lt!662446) (not (undefined!14024 lt!662446)) (bvslt (x!136926 lt!662446) #b01111111111111111111111111111110) (bvsge (x!136926 lt!662446) #b00000000000000000000000000000000) (bvsge (x!136926 lt!662446) #b00000000000000000000000000000000)))))

(assert (=> b!1529916 (=> (not res!1047674) (not e!852503))))

(assert (= (and d!159553 c!140676) b!1529910))

(assert (= (and d!159553 (not c!140676)) b!1529913))

(assert (= (and b!1529913 c!140678) b!1529912))

(assert (= (and b!1529913 (not c!140678)) b!1529911))

(assert (= (and d!159553 c!140677) b!1529914))

(assert (= (and d!159553 (not c!140677)) b!1529916))

(assert (= (and b!1529916 res!1047674) b!1529909))

(assert (= (and b!1529909 (not res!1047672)) b!1529915))

(assert (= (and b!1529915 (not res!1047673)) b!1529908))

(assert (=> d!159553 m!1412021))

(declare-fun m!1412247 () Bool)

(assert (=> d!159553 m!1412247))

(assert (=> d!159553 m!1412025))

(declare-fun m!1412249 () Bool)

(assert (=> b!1529908 m!1412249))

(assert (=> b!1529915 m!1412249))

(assert (=> b!1529909 m!1412249))

(assert (=> b!1529911 m!1412021))

(declare-fun m!1412251 () Bool)

(assert (=> b!1529911 m!1412251))

(assert (=> b!1529911 m!1412251))

(assert (=> b!1529911 m!1412009))

(declare-fun m!1412253 () Bool)

(assert (=> b!1529911 m!1412253))

(assert (=> b!1529620 d!159553))

(declare-fun d!159555 () Bool)

(declare-fun lt!662449 () (_ BitVec 32))

(declare-fun lt!662448 () (_ BitVec 32))

(assert (=> d!159555 (= lt!662449 (bvmul (bvxor lt!662448 (bvlshr lt!662448 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159555 (= lt!662448 ((_ extract 31 0) (bvand (bvxor (select (arr!49024 a!2804) j!70) (bvlshr (select (arr!49024 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159555 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1047644 (let ((h!37023 ((_ extract 31 0) (bvand (bvxor (select (arr!49024 a!2804) j!70) (bvlshr (select (arr!49024 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136936 (bvmul (bvxor h!37023 (bvlshr h!37023 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136936 (bvlshr x!136936 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1047644 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1047644 #b00000000000000000000000000000000))))))

(assert (=> d!159555 (= (toIndex!0 (select (arr!49024 a!2804) j!70) mask!2512) (bvand (bvxor lt!662449 (bvlshr lt!662449 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1529620 d!159555))

(declare-fun d!159557 () Bool)

(declare-fun lt!662452 () (_ BitVec 32))

(assert (=> d!159557 (and (bvsge lt!662452 #b00000000000000000000000000000000) (bvslt lt!662452 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!159557 (= lt!662452 (choose!52 index!487 x!534 mask!2512))))

(assert (=> d!159557 (validMask!0 mask!2512)))

(assert (=> d!159557 (= (nextIndex!0 index!487 x!534 mask!2512) lt!662452)))

(declare-fun bs!43832 () Bool)

(assert (= bs!43832 d!159557))

(declare-fun m!1412255 () Bool)

(assert (=> bs!43832 m!1412255))

(assert (=> bs!43832 m!1412025))

(assert (=> b!1529625 d!159557))

(check-sat (not b!1529724) (not d!159557) (not b!1529780) (not b!1529862) (not b!1529902) (not d!159553) (not bm!68455) (not d!159533) (not b!1529722) (not d!159549) (not b!1529710) (not b!1529911) (not b!1529709) (not d!159511) (not bm!68458) (not b!1529861) (not b!1529721) (not b!1529831) (not bm!68467) (not d!159501))
(check-sat)
