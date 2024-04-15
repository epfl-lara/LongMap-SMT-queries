; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121232 () Bool)

(assert start!121232)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96339 0))(
  ( (array!96340 (arr!46513 (Array (_ BitVec 32) (_ BitVec 64))) (size!47065 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96339)

(declare-fun b!1409597 () Bool)

(declare-fun e!797675 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10850 0))(
  ( (MissingZero!10850 (index!45777 (_ BitVec 32))) (Found!10850 (index!45778 (_ BitVec 32))) (Intermediate!10850 (undefined!11662 Bool) (index!45779 (_ BitVec 32)) (x!127360 (_ BitVec 32))) (Undefined!10850) (MissingVacant!10850 (index!45780 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96339 (_ BitVec 32)) SeekEntryResult!10850)

(assert (=> b!1409597 (= e!797675 (= (seekEntryOrOpen!0 (select (arr!46513 a!2901) j!112) a!2901 mask!2840) (Found!10850 j!112)))))

(declare-fun b!1409598 () Bool)

(declare-fun e!797677 () Bool)

(declare-fun lt!620622 () SeekEntryResult!10850)

(declare-fun lt!620623 () SeekEntryResult!10850)

(get-info :version)

(assert (=> b!1409598 (= e!797677 (or (= lt!620622 lt!620623) (not ((_ is Intermediate!10850) lt!620623)) (and (bvsge (x!127360 lt!620622) #b00000000000000000000000000000000) (bvsle (x!127360 lt!620622) #b01111111111111111111111111111110))))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96339 (_ BitVec 32)) SeekEntryResult!10850)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409598 (= lt!620623 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96340 (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47065 a!2901)) mask!2840))))

(declare-fun b!1409600 () Bool)

(declare-fun res!947374 () Bool)

(declare-fun e!797678 () Bool)

(assert (=> b!1409600 (=> (not res!947374) (not e!797678))))

(assert (=> b!1409600 (= res!947374 (and (= (size!47065 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47065 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47065 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409601 () Bool)

(declare-fun res!947370 () Bool)

(assert (=> b!1409601 (=> (not res!947370) (not e!797678))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409601 (= res!947370 (validKeyInArray!0 (select (arr!46513 a!2901) j!112)))))

(declare-fun b!1409602 () Bool)

(declare-fun res!947371 () Bool)

(assert (=> b!1409602 (=> (not res!947371) (not e!797678))))

(assert (=> b!1409602 (= res!947371 (validKeyInArray!0 (select (arr!46513 a!2901) i!1037)))))

(declare-fun b!1409599 () Bool)

(declare-fun res!947372 () Bool)

(assert (=> b!1409599 (=> (not res!947372) (not e!797678))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96339 (_ BitVec 32)) Bool)

(assert (=> b!1409599 (= res!947372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!947375 () Bool)

(assert (=> start!121232 (=> (not res!947375) (not e!797678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121232 (= res!947375 (validMask!0 mask!2840))))

(assert (=> start!121232 e!797678))

(assert (=> start!121232 true))

(declare-fun array_inv!35746 (array!96339) Bool)

(assert (=> start!121232 (array_inv!35746 a!2901)))

(declare-fun b!1409603 () Bool)

(assert (=> b!1409603 (= e!797678 (not e!797677))))

(declare-fun res!947376 () Bool)

(assert (=> b!1409603 (=> res!947376 e!797677)))

(assert (=> b!1409603 (= res!947376 (or (not ((_ is Intermediate!10850) lt!620622)) (undefined!11662 lt!620622)))))

(assert (=> b!1409603 e!797675))

(declare-fun res!947377 () Bool)

(assert (=> b!1409603 (=> (not res!947377) (not e!797675))))

(assert (=> b!1409603 (= res!947377 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47517 0))(
  ( (Unit!47518) )
))
(declare-fun lt!620624 () Unit!47517)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96339 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47517)

(assert (=> b!1409603 (= lt!620624 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1409603 (= lt!620622 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46513 a!2901) j!112) mask!2840) (select (arr!46513 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409604 () Bool)

(declare-fun res!947373 () Bool)

(assert (=> b!1409604 (=> (not res!947373) (not e!797678))))

(declare-datatypes ((List!33110 0))(
  ( (Nil!33107) (Cons!33106 (h!34369 (_ BitVec 64)) (t!47796 List!33110)) )
))
(declare-fun arrayNoDuplicates!0 (array!96339 (_ BitVec 32) List!33110) Bool)

(assert (=> b!1409604 (= res!947373 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33107))))

(assert (= (and start!121232 res!947375) b!1409600))

(assert (= (and b!1409600 res!947374) b!1409602))

(assert (= (and b!1409602 res!947371) b!1409601))

(assert (= (and b!1409601 res!947370) b!1409599))

(assert (= (and b!1409599 res!947372) b!1409604))

(assert (= (and b!1409604 res!947373) b!1409603))

(assert (= (and b!1409603 res!947377) b!1409597))

(assert (= (and b!1409603 (not res!947376)) b!1409598))

(declare-fun m!1298959 () Bool)

(assert (=> b!1409604 m!1298959))

(declare-fun m!1298961 () Bool)

(assert (=> b!1409602 m!1298961))

(assert (=> b!1409602 m!1298961))

(declare-fun m!1298963 () Bool)

(assert (=> b!1409602 m!1298963))

(declare-fun m!1298965 () Bool)

(assert (=> start!121232 m!1298965))

(declare-fun m!1298967 () Bool)

(assert (=> start!121232 m!1298967))

(declare-fun m!1298969 () Bool)

(assert (=> b!1409601 m!1298969))

(assert (=> b!1409601 m!1298969))

(declare-fun m!1298971 () Bool)

(assert (=> b!1409601 m!1298971))

(assert (=> b!1409597 m!1298969))

(assert (=> b!1409597 m!1298969))

(declare-fun m!1298973 () Bool)

(assert (=> b!1409597 m!1298973))

(declare-fun m!1298975 () Bool)

(assert (=> b!1409598 m!1298975))

(declare-fun m!1298977 () Bool)

(assert (=> b!1409598 m!1298977))

(assert (=> b!1409598 m!1298977))

(declare-fun m!1298979 () Bool)

(assert (=> b!1409598 m!1298979))

(assert (=> b!1409598 m!1298979))

(assert (=> b!1409598 m!1298977))

(declare-fun m!1298981 () Bool)

(assert (=> b!1409598 m!1298981))

(assert (=> b!1409603 m!1298969))

(declare-fun m!1298983 () Bool)

(assert (=> b!1409603 m!1298983))

(assert (=> b!1409603 m!1298969))

(declare-fun m!1298985 () Bool)

(assert (=> b!1409603 m!1298985))

(assert (=> b!1409603 m!1298983))

(assert (=> b!1409603 m!1298969))

(declare-fun m!1298987 () Bool)

(assert (=> b!1409603 m!1298987))

(declare-fun m!1298989 () Bool)

(assert (=> b!1409603 m!1298989))

(declare-fun m!1298991 () Bool)

(assert (=> b!1409599 m!1298991))

(check-sat (not start!121232) (not b!1409601) (not b!1409603) (not b!1409598) (not b!1409602) (not b!1409604) (not b!1409599) (not b!1409597))
(check-sat)
(get-model)

(declare-fun d!151601 () Bool)

(assert (=> d!151601 (= (validKeyInArray!0 (select (arr!46513 a!2901) j!112)) (and (not (= (select (arr!46513 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46513 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1409601 d!151601))

(declare-fun d!151603 () Bool)

(assert (=> d!151603 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121232 d!151603))

(declare-fun d!151605 () Bool)

(assert (=> d!151605 (= (array_inv!35746 a!2901) (bvsge (size!47065 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121232 d!151605))

(declare-fun b!1409661 () Bool)

(declare-fun e!797710 () Bool)

(declare-fun call!66995 () Bool)

(assert (=> b!1409661 (= e!797710 call!66995)))

(declare-fun bm!66992 () Bool)

(assert (=> bm!66992 (= call!66995 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!151607 () Bool)

(declare-fun res!947431 () Bool)

(declare-fun e!797709 () Bool)

(assert (=> d!151607 (=> res!947431 e!797709)))

(assert (=> d!151607 (= res!947431 (bvsge #b00000000000000000000000000000000 (size!47065 a!2901)))))

(assert (=> d!151607 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!797709)))

(declare-fun b!1409662 () Bool)

(declare-fun e!797711 () Bool)

(assert (=> b!1409662 (= e!797711 e!797710)))

(declare-fun lt!620650 () (_ BitVec 64))

(assert (=> b!1409662 (= lt!620650 (select (arr!46513 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!620649 () Unit!47517)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96339 (_ BitVec 64) (_ BitVec 32)) Unit!47517)

(assert (=> b!1409662 (= lt!620649 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!620650 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1409662 (arrayContainsKey!0 a!2901 lt!620650 #b00000000000000000000000000000000)))

(declare-fun lt!620651 () Unit!47517)

(assert (=> b!1409662 (= lt!620651 lt!620649)))

(declare-fun res!947430 () Bool)

(assert (=> b!1409662 (= res!947430 (= (seekEntryOrOpen!0 (select (arr!46513 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10850 #b00000000000000000000000000000000)))))

(assert (=> b!1409662 (=> (not res!947430) (not e!797710))))

(declare-fun b!1409663 () Bool)

(assert (=> b!1409663 (= e!797711 call!66995)))

(declare-fun b!1409664 () Bool)

(assert (=> b!1409664 (= e!797709 e!797711)))

(declare-fun c!130585 () Bool)

(assert (=> b!1409664 (= c!130585 (validKeyInArray!0 (select (arr!46513 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!151607 (not res!947431)) b!1409664))

(assert (= (and b!1409664 c!130585) b!1409662))

(assert (= (and b!1409664 (not c!130585)) b!1409663))

(assert (= (and b!1409662 res!947430) b!1409661))

(assert (= (or b!1409661 b!1409663) bm!66992))

(declare-fun m!1299061 () Bool)

(assert (=> bm!66992 m!1299061))

(declare-fun m!1299063 () Bool)

(assert (=> b!1409662 m!1299063))

(declare-fun m!1299065 () Bool)

(assert (=> b!1409662 m!1299065))

(declare-fun m!1299067 () Bool)

(assert (=> b!1409662 m!1299067))

(assert (=> b!1409662 m!1299063))

(declare-fun m!1299069 () Bool)

(assert (=> b!1409662 m!1299069))

(assert (=> b!1409664 m!1299063))

(assert (=> b!1409664 m!1299063))

(declare-fun m!1299071 () Bool)

(assert (=> b!1409664 m!1299071))

(assert (=> b!1409599 d!151607))

(declare-fun b!1409665 () Bool)

(declare-fun e!797713 () Bool)

(declare-fun call!66996 () Bool)

(assert (=> b!1409665 (= e!797713 call!66996)))

(declare-fun bm!66993 () Bool)

(assert (=> bm!66993 (= call!66996 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!151613 () Bool)

(declare-fun res!947433 () Bool)

(declare-fun e!797712 () Bool)

(assert (=> d!151613 (=> res!947433 e!797712)))

(assert (=> d!151613 (= res!947433 (bvsge j!112 (size!47065 a!2901)))))

(assert (=> d!151613 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!797712)))

(declare-fun b!1409666 () Bool)

(declare-fun e!797714 () Bool)

(assert (=> b!1409666 (= e!797714 e!797713)))

(declare-fun lt!620653 () (_ BitVec 64))

(assert (=> b!1409666 (= lt!620653 (select (arr!46513 a!2901) j!112))))

(declare-fun lt!620652 () Unit!47517)

(assert (=> b!1409666 (= lt!620652 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!620653 j!112))))

(assert (=> b!1409666 (arrayContainsKey!0 a!2901 lt!620653 #b00000000000000000000000000000000)))

(declare-fun lt!620654 () Unit!47517)

(assert (=> b!1409666 (= lt!620654 lt!620652)))

(declare-fun res!947432 () Bool)

(assert (=> b!1409666 (= res!947432 (= (seekEntryOrOpen!0 (select (arr!46513 a!2901) j!112) a!2901 mask!2840) (Found!10850 j!112)))))

(assert (=> b!1409666 (=> (not res!947432) (not e!797713))))

(declare-fun b!1409667 () Bool)

(assert (=> b!1409667 (= e!797714 call!66996)))

(declare-fun b!1409668 () Bool)

(assert (=> b!1409668 (= e!797712 e!797714)))

(declare-fun c!130586 () Bool)

(assert (=> b!1409668 (= c!130586 (validKeyInArray!0 (select (arr!46513 a!2901) j!112)))))

(assert (= (and d!151613 (not res!947433)) b!1409668))

(assert (= (and b!1409668 c!130586) b!1409666))

(assert (= (and b!1409668 (not c!130586)) b!1409667))

(assert (= (and b!1409666 res!947432) b!1409665))

(assert (= (or b!1409665 b!1409667) bm!66993))

(declare-fun m!1299073 () Bool)

(assert (=> bm!66993 m!1299073))

(assert (=> b!1409666 m!1298969))

(declare-fun m!1299075 () Bool)

(assert (=> b!1409666 m!1299075))

(declare-fun m!1299077 () Bool)

(assert (=> b!1409666 m!1299077))

(assert (=> b!1409666 m!1298969))

(assert (=> b!1409666 m!1298973))

(assert (=> b!1409668 m!1298969))

(assert (=> b!1409668 m!1298969))

(assert (=> b!1409668 m!1298971))

(assert (=> b!1409603 d!151613))

(declare-fun d!151615 () Bool)

(assert (=> d!151615 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!620657 () Unit!47517)

(declare-fun choose!38 (array!96339 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47517)

(assert (=> d!151615 (= lt!620657 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151615 (validMask!0 mask!2840)))

(assert (=> d!151615 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!620657)))

(declare-fun bs!41077 () Bool)

(assert (= bs!41077 d!151615))

(assert (=> bs!41077 m!1298989))

(declare-fun m!1299079 () Bool)

(assert (=> bs!41077 m!1299079))

(assert (=> bs!41077 m!1298965))

(assert (=> b!1409603 d!151615))

(declare-fun b!1409726 () Bool)

(declare-fun e!797746 () SeekEntryResult!10850)

(assert (=> b!1409726 (= e!797746 (Intermediate!10850 false (toIndex!0 (select (arr!46513 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1409727 () Bool)

(declare-fun lt!620680 () SeekEntryResult!10850)

(assert (=> b!1409727 (and (bvsge (index!45779 lt!620680) #b00000000000000000000000000000000) (bvslt (index!45779 lt!620680) (size!47065 a!2901)))))

(declare-fun res!947450 () Bool)

(assert (=> b!1409727 (= res!947450 (= (select (arr!46513 a!2901) (index!45779 lt!620680)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!797749 () Bool)

(assert (=> b!1409727 (=> res!947450 e!797749)))

(declare-fun b!1409728 () Bool)

(declare-fun e!797747 () SeekEntryResult!10850)

(assert (=> b!1409728 (= e!797747 (Intermediate!10850 true (toIndex!0 (select (arr!46513 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1409729 () Bool)

(assert (=> b!1409729 (and (bvsge (index!45779 lt!620680) #b00000000000000000000000000000000) (bvslt (index!45779 lt!620680) (size!47065 a!2901)))))

(declare-fun res!947452 () Bool)

(assert (=> b!1409729 (= res!947452 (= (select (arr!46513 a!2901) (index!45779 lt!620680)) (select (arr!46513 a!2901) j!112)))))

(assert (=> b!1409729 (=> res!947452 e!797749)))

(declare-fun e!797750 () Bool)

(assert (=> b!1409729 (= e!797750 e!797749)))

(declare-fun b!1409730 () Bool)

(declare-fun e!797748 () Bool)

(assert (=> b!1409730 (= e!797748 e!797750)))

(declare-fun res!947451 () Bool)

(assert (=> b!1409730 (= res!947451 (and ((_ is Intermediate!10850) lt!620680) (not (undefined!11662 lt!620680)) (bvslt (x!127360 lt!620680) #b01111111111111111111111111111110) (bvsge (x!127360 lt!620680) #b00000000000000000000000000000000) (bvsge (x!127360 lt!620680) #b00000000000000000000000000000000)))))

(assert (=> b!1409730 (=> (not res!947451) (not e!797750))))

(declare-fun d!151617 () Bool)

(assert (=> d!151617 e!797748))

(declare-fun c!130609 () Bool)

(assert (=> d!151617 (= c!130609 (and ((_ is Intermediate!10850) lt!620680) (undefined!11662 lt!620680)))))

(assert (=> d!151617 (= lt!620680 e!797747)))

(declare-fun c!130610 () Bool)

(assert (=> d!151617 (= c!130610 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!620681 () (_ BitVec 64))

(assert (=> d!151617 (= lt!620681 (select (arr!46513 a!2901) (toIndex!0 (select (arr!46513 a!2901) j!112) mask!2840)))))

(assert (=> d!151617 (validMask!0 mask!2840)))

(assert (=> d!151617 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46513 a!2901) j!112) mask!2840) (select (arr!46513 a!2901) j!112) a!2901 mask!2840) lt!620680)))

(declare-fun b!1409731 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409731 (= e!797746 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46513 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46513 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409732 () Bool)

(assert (=> b!1409732 (= e!797748 (bvsge (x!127360 lt!620680) #b01111111111111111111111111111110))))

(declare-fun b!1409733 () Bool)

(assert (=> b!1409733 (= e!797747 e!797746)))

(declare-fun c!130608 () Bool)

(assert (=> b!1409733 (= c!130608 (or (= lt!620681 (select (arr!46513 a!2901) j!112)) (= (bvadd lt!620681 lt!620681) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1409734 () Bool)

(assert (=> b!1409734 (and (bvsge (index!45779 lt!620680) #b00000000000000000000000000000000) (bvslt (index!45779 lt!620680) (size!47065 a!2901)))))

(assert (=> b!1409734 (= e!797749 (= (select (arr!46513 a!2901) (index!45779 lt!620680)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!151617 c!130610) b!1409728))

(assert (= (and d!151617 (not c!130610)) b!1409733))

(assert (= (and b!1409733 c!130608) b!1409726))

(assert (= (and b!1409733 (not c!130608)) b!1409731))

(assert (= (and d!151617 c!130609) b!1409732))

(assert (= (and d!151617 (not c!130609)) b!1409730))

(assert (= (and b!1409730 res!947451) b!1409729))

(assert (= (and b!1409729 (not res!947452)) b!1409727))

(assert (= (and b!1409727 (not res!947450)) b!1409734))

(declare-fun m!1299089 () Bool)

(assert (=> b!1409734 m!1299089))

(assert (=> b!1409731 m!1298983))

(declare-fun m!1299091 () Bool)

(assert (=> b!1409731 m!1299091))

(assert (=> b!1409731 m!1299091))

(assert (=> b!1409731 m!1298969))

(declare-fun m!1299093 () Bool)

(assert (=> b!1409731 m!1299093))

(assert (=> b!1409729 m!1299089))

(assert (=> b!1409727 m!1299089))

(assert (=> d!151617 m!1298983))

(declare-fun m!1299095 () Bool)

(assert (=> d!151617 m!1299095))

(assert (=> d!151617 m!1298965))

(assert (=> b!1409603 d!151617))

(declare-fun d!151629 () Bool)

(declare-fun lt!620690 () (_ BitVec 32))

(declare-fun lt!620689 () (_ BitVec 32))

(assert (=> d!151629 (= lt!620690 (bvmul (bvxor lt!620689 (bvlshr lt!620689 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151629 (= lt!620689 ((_ extract 31 0) (bvand (bvxor (select (arr!46513 a!2901) j!112) (bvlshr (select (arr!46513 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151629 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!947453 (let ((h!34373 ((_ extract 31 0) (bvand (bvxor (select (arr!46513 a!2901) j!112) (bvlshr (select (arr!46513 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127366 (bvmul (bvxor h!34373 (bvlshr h!34373 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127366 (bvlshr x!127366 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!947453 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!947453 #b00000000000000000000000000000000))))))

(assert (=> d!151629 (= (toIndex!0 (select (arr!46513 a!2901) j!112) mask!2840) (bvand (bvxor lt!620690 (bvlshr lt!620690 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1409603 d!151629))

(declare-fun e!797754 () SeekEntryResult!10850)

(declare-fun b!1409741 () Bool)

(assert (=> b!1409741 (= e!797754 (Intermediate!10850 false (toIndex!0 (select (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1409742 () Bool)

(declare-fun lt!620691 () SeekEntryResult!10850)

(assert (=> b!1409742 (and (bvsge (index!45779 lt!620691) #b00000000000000000000000000000000) (bvslt (index!45779 lt!620691) (size!47065 (array!96340 (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47065 a!2901)))))))

(declare-fun res!947454 () Bool)

(assert (=> b!1409742 (= res!947454 (= (select (arr!46513 (array!96340 (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47065 a!2901))) (index!45779 lt!620691)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!797757 () Bool)

(assert (=> b!1409742 (=> res!947454 e!797757)))

(declare-fun e!797755 () SeekEntryResult!10850)

(declare-fun b!1409743 () Bool)

(assert (=> b!1409743 (= e!797755 (Intermediate!10850 true (toIndex!0 (select (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1409744 () Bool)

(assert (=> b!1409744 (and (bvsge (index!45779 lt!620691) #b00000000000000000000000000000000) (bvslt (index!45779 lt!620691) (size!47065 (array!96340 (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47065 a!2901)))))))

(declare-fun res!947456 () Bool)

(assert (=> b!1409744 (= res!947456 (= (select (arr!46513 (array!96340 (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47065 a!2901))) (index!45779 lt!620691)) (select (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1409744 (=> res!947456 e!797757)))

(declare-fun e!797758 () Bool)

(assert (=> b!1409744 (= e!797758 e!797757)))

(declare-fun b!1409745 () Bool)

(declare-fun e!797756 () Bool)

(assert (=> b!1409745 (= e!797756 e!797758)))

(declare-fun res!947455 () Bool)

(assert (=> b!1409745 (= res!947455 (and ((_ is Intermediate!10850) lt!620691) (not (undefined!11662 lt!620691)) (bvslt (x!127360 lt!620691) #b01111111111111111111111111111110) (bvsge (x!127360 lt!620691) #b00000000000000000000000000000000) (bvsge (x!127360 lt!620691) #b00000000000000000000000000000000)))))

(assert (=> b!1409745 (=> (not res!947455) (not e!797758))))

(declare-fun d!151633 () Bool)

(assert (=> d!151633 e!797756))

(declare-fun c!130615 () Bool)

(assert (=> d!151633 (= c!130615 (and ((_ is Intermediate!10850) lt!620691) (undefined!11662 lt!620691)))))

(assert (=> d!151633 (= lt!620691 e!797755)))

(declare-fun c!130616 () Bool)

(assert (=> d!151633 (= c!130616 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!620692 () (_ BitVec 64))

(assert (=> d!151633 (= lt!620692 (select (arr!46513 (array!96340 (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47065 a!2901))) (toIndex!0 (select (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!151633 (validMask!0 mask!2840)))

(assert (=> d!151633 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96340 (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47065 a!2901)) mask!2840) lt!620691)))

(declare-fun b!1409746 () Bool)

(assert (=> b!1409746 (= e!797754 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96340 (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47065 a!2901)) mask!2840))))

(declare-fun b!1409747 () Bool)

(assert (=> b!1409747 (= e!797756 (bvsge (x!127360 lt!620691) #b01111111111111111111111111111110))))

(declare-fun b!1409748 () Bool)

(assert (=> b!1409748 (= e!797755 e!797754)))

(declare-fun c!130614 () Bool)

(assert (=> b!1409748 (= c!130614 (or (= lt!620692 (select (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!620692 lt!620692) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1409749 () Bool)

(assert (=> b!1409749 (and (bvsge (index!45779 lt!620691) #b00000000000000000000000000000000) (bvslt (index!45779 lt!620691) (size!47065 (array!96340 (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47065 a!2901)))))))

(assert (=> b!1409749 (= e!797757 (= (select (arr!46513 (array!96340 (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47065 a!2901))) (index!45779 lt!620691)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!151633 c!130616) b!1409743))

(assert (= (and d!151633 (not c!130616)) b!1409748))

(assert (= (and b!1409748 c!130614) b!1409741))

(assert (= (and b!1409748 (not c!130614)) b!1409746))

(assert (= (and d!151633 c!130615) b!1409747))

(assert (= (and d!151633 (not c!130615)) b!1409745))

(assert (= (and b!1409745 res!947455) b!1409744))

(assert (= (and b!1409744 (not res!947456)) b!1409742))

(assert (= (and b!1409742 (not res!947454)) b!1409749))

(declare-fun m!1299107 () Bool)

(assert (=> b!1409749 m!1299107))

(assert (=> b!1409746 m!1298979))

(declare-fun m!1299109 () Bool)

(assert (=> b!1409746 m!1299109))

(assert (=> b!1409746 m!1299109))

(assert (=> b!1409746 m!1298977))

(declare-fun m!1299111 () Bool)

(assert (=> b!1409746 m!1299111))

(assert (=> b!1409744 m!1299107))

(assert (=> b!1409742 m!1299107))

(assert (=> d!151633 m!1298979))

(declare-fun m!1299113 () Bool)

(assert (=> d!151633 m!1299113))

(assert (=> d!151633 m!1298965))

(assert (=> b!1409598 d!151633))

(declare-fun d!151635 () Bool)

(declare-fun lt!620694 () (_ BitVec 32))

(declare-fun lt!620693 () (_ BitVec 32))

(assert (=> d!151635 (= lt!620694 (bvmul (bvxor lt!620693 (bvlshr lt!620693 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151635 (= lt!620693 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151635 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!947453 (let ((h!34373 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127366 (bvmul (bvxor h!34373 (bvlshr h!34373 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127366 (bvlshr x!127366 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!947453 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!947453 #b00000000000000000000000000000000))))))

(assert (=> d!151635 (= (toIndex!0 (select (store (arr!46513 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!620694 (bvlshr lt!620694 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1409598 d!151635))

(declare-fun b!1409772 () Bool)

(declare-fun e!797776 () Bool)

(declare-fun contains!9765 (List!33110 (_ BitVec 64)) Bool)

(assert (=> b!1409772 (= e!797776 (contains!9765 Nil!33107 (select (arr!46513 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1409773 () Bool)

(declare-fun e!797779 () Bool)

(declare-fun e!797777 () Bool)

(assert (=> b!1409773 (= e!797779 e!797777)))

(declare-fun c!130622 () Bool)

(assert (=> b!1409773 (= c!130622 (validKeyInArray!0 (select (arr!46513 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1409774 () Bool)

(declare-fun e!797778 () Bool)

(assert (=> b!1409774 (= e!797778 e!797779)))

(declare-fun res!947471 () Bool)

(assert (=> b!1409774 (=> (not res!947471) (not e!797779))))

(assert (=> b!1409774 (= res!947471 (not e!797776))))

(declare-fun res!947470 () Bool)

(assert (=> b!1409774 (=> (not res!947470) (not e!797776))))

(assert (=> b!1409774 (= res!947470 (validKeyInArray!0 (select (arr!46513 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66999 () Bool)

(declare-fun call!67002 () Bool)

(assert (=> bm!66999 (= call!67002 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130622 (Cons!33106 (select (arr!46513 a!2901) #b00000000000000000000000000000000) Nil!33107) Nil!33107)))))

(declare-fun d!151637 () Bool)

(declare-fun res!947469 () Bool)

(assert (=> d!151637 (=> res!947469 e!797778)))

(assert (=> d!151637 (= res!947469 (bvsge #b00000000000000000000000000000000 (size!47065 a!2901)))))

(assert (=> d!151637 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33107) e!797778)))

(declare-fun b!1409775 () Bool)

(assert (=> b!1409775 (= e!797777 call!67002)))

(declare-fun b!1409776 () Bool)

(assert (=> b!1409776 (= e!797777 call!67002)))

(assert (= (and d!151637 (not res!947469)) b!1409774))

(assert (= (and b!1409774 res!947470) b!1409772))

(assert (= (and b!1409774 res!947471) b!1409773))

(assert (= (and b!1409773 c!130622) b!1409776))

(assert (= (and b!1409773 (not c!130622)) b!1409775))

(assert (= (or b!1409776 b!1409775) bm!66999))

(assert (=> b!1409772 m!1299063))

(assert (=> b!1409772 m!1299063))

(declare-fun m!1299121 () Bool)

(assert (=> b!1409772 m!1299121))

(assert (=> b!1409773 m!1299063))

(assert (=> b!1409773 m!1299063))

(assert (=> b!1409773 m!1299071))

(assert (=> b!1409774 m!1299063))

(assert (=> b!1409774 m!1299063))

(assert (=> b!1409774 m!1299071))

(assert (=> bm!66999 m!1299063))

(declare-fun m!1299123 () Bool)

(assert (=> bm!66999 m!1299123))

(assert (=> b!1409604 d!151637))

(declare-fun d!151647 () Bool)

(assert (=> d!151647 (= (validKeyInArray!0 (select (arr!46513 a!2901) i!1037)) (and (not (= (select (arr!46513 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46513 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1409602 d!151647))

(declare-fun b!1409817 () Bool)

(declare-fun c!130642 () Bool)

(declare-fun lt!620727 () (_ BitVec 64))

(assert (=> b!1409817 (= c!130642 (= lt!620727 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!797800 () SeekEntryResult!10850)

(declare-fun e!797799 () SeekEntryResult!10850)

(assert (=> b!1409817 (= e!797800 e!797799)))

(declare-fun b!1409818 () Bool)

(declare-fun e!797801 () SeekEntryResult!10850)

(assert (=> b!1409818 (= e!797801 e!797800)))

(declare-fun lt!620728 () SeekEntryResult!10850)

(assert (=> b!1409818 (= lt!620727 (select (arr!46513 a!2901) (index!45779 lt!620728)))))

(declare-fun c!130643 () Bool)

(assert (=> b!1409818 (= c!130643 (= lt!620727 (select (arr!46513 a!2901) j!112)))))

(declare-fun b!1409819 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96339 (_ BitVec 32)) SeekEntryResult!10850)

(assert (=> b!1409819 (= e!797799 (seekKeyOrZeroReturnVacant!0 (x!127360 lt!620728) (index!45779 lt!620728) (index!45779 lt!620728) (select (arr!46513 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409820 () Bool)

(assert (=> b!1409820 (= e!797801 Undefined!10850)))

(declare-fun b!1409821 () Bool)

(assert (=> b!1409821 (= e!797800 (Found!10850 (index!45779 lt!620728)))))

(declare-fun d!151649 () Bool)

(declare-fun lt!620726 () SeekEntryResult!10850)

(assert (=> d!151649 (and (or ((_ is Undefined!10850) lt!620726) (not ((_ is Found!10850) lt!620726)) (and (bvsge (index!45778 lt!620726) #b00000000000000000000000000000000) (bvslt (index!45778 lt!620726) (size!47065 a!2901)))) (or ((_ is Undefined!10850) lt!620726) ((_ is Found!10850) lt!620726) (not ((_ is MissingZero!10850) lt!620726)) (and (bvsge (index!45777 lt!620726) #b00000000000000000000000000000000) (bvslt (index!45777 lt!620726) (size!47065 a!2901)))) (or ((_ is Undefined!10850) lt!620726) ((_ is Found!10850) lt!620726) ((_ is MissingZero!10850) lt!620726) (not ((_ is MissingVacant!10850) lt!620726)) (and (bvsge (index!45780 lt!620726) #b00000000000000000000000000000000) (bvslt (index!45780 lt!620726) (size!47065 a!2901)))) (or ((_ is Undefined!10850) lt!620726) (ite ((_ is Found!10850) lt!620726) (= (select (arr!46513 a!2901) (index!45778 lt!620726)) (select (arr!46513 a!2901) j!112)) (ite ((_ is MissingZero!10850) lt!620726) (= (select (arr!46513 a!2901) (index!45777 lt!620726)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10850) lt!620726) (= (select (arr!46513 a!2901) (index!45780 lt!620726)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!151649 (= lt!620726 e!797801)))

(declare-fun c!130644 () Bool)

(assert (=> d!151649 (= c!130644 (and ((_ is Intermediate!10850) lt!620728) (undefined!11662 lt!620728)))))

(assert (=> d!151649 (= lt!620728 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46513 a!2901) j!112) mask!2840) (select (arr!46513 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151649 (validMask!0 mask!2840)))

(assert (=> d!151649 (= (seekEntryOrOpen!0 (select (arr!46513 a!2901) j!112) a!2901 mask!2840) lt!620726)))

(declare-fun b!1409822 () Bool)

(assert (=> b!1409822 (= e!797799 (MissingZero!10850 (index!45779 lt!620728)))))

(assert (= (and d!151649 c!130644) b!1409820))

(assert (= (and d!151649 (not c!130644)) b!1409818))

(assert (= (and b!1409818 c!130643) b!1409821))

(assert (= (and b!1409818 (not c!130643)) b!1409817))

(assert (= (and b!1409817 c!130642) b!1409822))

(assert (= (and b!1409817 (not c!130642)) b!1409819))

(declare-fun m!1299137 () Bool)

(assert (=> b!1409818 m!1299137))

(assert (=> b!1409819 m!1298969))

(declare-fun m!1299139 () Bool)

(assert (=> b!1409819 m!1299139))

(declare-fun m!1299141 () Bool)

(assert (=> d!151649 m!1299141))

(assert (=> d!151649 m!1298969))

(assert (=> d!151649 m!1298983))

(assert (=> d!151649 m!1298983))

(assert (=> d!151649 m!1298969))

(assert (=> d!151649 m!1298987))

(assert (=> d!151649 m!1298965))

(declare-fun m!1299143 () Bool)

(assert (=> d!151649 m!1299143))

(declare-fun m!1299145 () Bool)

(assert (=> d!151649 m!1299145))

(assert (=> b!1409597 d!151649))

(check-sat (not d!151633) (not b!1409773) (not bm!66999) (not d!151617) (not b!1409774) (not d!151649) (not b!1409668) (not b!1409819) (not b!1409666) (not d!151615) (not b!1409664) (not b!1409772) (not b!1409731) (not b!1409662) (not b!1409746) (not bm!66992) (not bm!66993))
(check-sat)
