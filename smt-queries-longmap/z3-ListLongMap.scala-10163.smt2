; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119744 () Bool)

(assert start!119744)

(declare-fun b!1394962 () Bool)

(declare-fun e!789743 () Bool)

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1394962 (= e!789743 (or (bvslt mask!2840 #b00000000000000000000000000000000) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(declare-fun b!1394963 () Bool)

(declare-fun res!934375 () Bool)

(declare-fun e!789741 () Bool)

(assert (=> b!1394963 (=> (not res!934375) (not e!789741))))

(declare-datatypes ((array!95426 0))(
  ( (array!95427 (arr!46071 (Array (_ BitVec 32) (_ BitVec 64))) (size!46621 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95426)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1394963 (= res!934375 (and (= (size!46621 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46621 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46621 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394964 () Bool)

(declare-fun res!934378 () Bool)

(assert (=> b!1394964 (=> (not res!934378) (not e!789741))))

(declare-datatypes ((List!32590 0))(
  ( (Nil!32587) (Cons!32586 (h!33819 (_ BitVec 64)) (t!47284 List!32590)) )
))
(declare-fun arrayNoDuplicates!0 (array!95426 (_ BitVec 32) List!32590) Bool)

(assert (=> b!1394964 (= res!934378 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32587))))

(declare-fun res!934373 () Bool)

(assert (=> start!119744 (=> (not res!934373) (not e!789741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119744 (= res!934373 (validMask!0 mask!2840))))

(assert (=> start!119744 e!789741))

(assert (=> start!119744 true))

(declare-fun array_inv!35099 (array!95426) Bool)

(assert (=> start!119744 (array_inv!35099 a!2901)))

(declare-fun b!1394965 () Bool)

(declare-fun e!789742 () Bool)

(declare-datatypes ((SeekEntryResult!10388 0))(
  ( (MissingZero!10388 (index!43923 (_ BitVec 32))) (Found!10388 (index!43924 (_ BitVec 32))) (Intermediate!10388 (undefined!11200 Bool) (index!43925 (_ BitVec 32)) (x!125584 (_ BitVec 32))) (Undefined!10388) (MissingVacant!10388 (index!43926 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95426 (_ BitVec 32)) SeekEntryResult!10388)

(assert (=> b!1394965 (= e!789742 (= (seekEntryOrOpen!0 (select (arr!46071 a!2901) j!112) a!2901 mask!2840) (Found!10388 j!112)))))

(declare-fun b!1394966 () Bool)

(declare-fun res!934371 () Bool)

(assert (=> b!1394966 (=> (not res!934371) (not e!789741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95426 (_ BitVec 32)) Bool)

(assert (=> b!1394966 (= res!934371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394967 () Bool)

(declare-fun res!934370 () Bool)

(assert (=> b!1394967 (=> res!934370 e!789743)))

(declare-fun lt!612800 () SeekEntryResult!10388)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95426 (_ BitVec 32)) SeekEntryResult!10388)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394967 (= res!934370 (= lt!612800 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46071 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46071 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95427 (store (arr!46071 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46621 a!2901)) mask!2840)))))

(declare-fun b!1394968 () Bool)

(assert (=> b!1394968 (= e!789741 (not e!789743))))

(declare-fun res!934374 () Bool)

(assert (=> b!1394968 (=> res!934374 e!789743)))

(get-info :version)

(assert (=> b!1394968 (= res!934374 (or (not ((_ is Intermediate!10388) lt!612800)) (undefined!11200 lt!612800)))))

(assert (=> b!1394968 e!789742))

(declare-fun res!934377 () Bool)

(assert (=> b!1394968 (=> (not res!934377) (not e!789742))))

(assert (=> b!1394968 (= res!934377 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46780 0))(
  ( (Unit!46781) )
))
(declare-fun lt!612801 () Unit!46780)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95426 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46780)

(assert (=> b!1394968 (= lt!612801 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394968 (= lt!612800 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46071 a!2901) j!112) mask!2840) (select (arr!46071 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1394969 () Bool)

(declare-fun res!934372 () Bool)

(assert (=> b!1394969 (=> (not res!934372) (not e!789741))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394969 (= res!934372 (validKeyInArray!0 (select (arr!46071 a!2901) i!1037)))))

(declare-fun b!1394970 () Bool)

(declare-fun res!934376 () Bool)

(assert (=> b!1394970 (=> (not res!934376) (not e!789741))))

(assert (=> b!1394970 (= res!934376 (validKeyInArray!0 (select (arr!46071 a!2901) j!112)))))

(assert (= (and start!119744 res!934373) b!1394963))

(assert (= (and b!1394963 res!934375) b!1394969))

(assert (= (and b!1394969 res!934372) b!1394970))

(assert (= (and b!1394970 res!934376) b!1394966))

(assert (= (and b!1394966 res!934371) b!1394964))

(assert (= (and b!1394964 res!934378) b!1394968))

(assert (= (and b!1394968 res!934377) b!1394965))

(assert (= (and b!1394968 (not res!934374)) b!1394967))

(assert (= (and b!1394967 (not res!934370)) b!1394962))

(declare-fun m!1281475 () Bool)

(assert (=> b!1394969 m!1281475))

(assert (=> b!1394969 m!1281475))

(declare-fun m!1281477 () Bool)

(assert (=> b!1394969 m!1281477))

(declare-fun m!1281479 () Bool)

(assert (=> b!1394965 m!1281479))

(assert (=> b!1394965 m!1281479))

(declare-fun m!1281481 () Bool)

(assert (=> b!1394965 m!1281481))

(declare-fun m!1281483 () Bool)

(assert (=> start!119744 m!1281483))

(declare-fun m!1281485 () Bool)

(assert (=> start!119744 m!1281485))

(declare-fun m!1281487 () Bool)

(assert (=> b!1394966 m!1281487))

(declare-fun m!1281489 () Bool)

(assert (=> b!1394967 m!1281489))

(declare-fun m!1281491 () Bool)

(assert (=> b!1394967 m!1281491))

(assert (=> b!1394967 m!1281491))

(declare-fun m!1281493 () Bool)

(assert (=> b!1394967 m!1281493))

(assert (=> b!1394967 m!1281493))

(assert (=> b!1394967 m!1281491))

(declare-fun m!1281495 () Bool)

(assert (=> b!1394967 m!1281495))

(assert (=> b!1394968 m!1281479))

(declare-fun m!1281497 () Bool)

(assert (=> b!1394968 m!1281497))

(assert (=> b!1394968 m!1281479))

(declare-fun m!1281499 () Bool)

(assert (=> b!1394968 m!1281499))

(assert (=> b!1394968 m!1281497))

(assert (=> b!1394968 m!1281479))

(declare-fun m!1281501 () Bool)

(assert (=> b!1394968 m!1281501))

(declare-fun m!1281503 () Bool)

(assert (=> b!1394968 m!1281503))

(declare-fun m!1281505 () Bool)

(assert (=> b!1394964 m!1281505))

(assert (=> b!1394970 m!1281479))

(assert (=> b!1394970 m!1281479))

(declare-fun m!1281507 () Bool)

(assert (=> b!1394970 m!1281507))

(check-sat (not b!1394967) (not b!1394965) (not b!1394969) (not b!1394970) (not start!119744) (not b!1394964) (not b!1394968) (not b!1394966))
(check-sat)
(get-model)

(declare-fun b!1395006 () Bool)

(declare-fun e!789764 () Bool)

(declare-fun e!789762 () Bool)

(assert (=> b!1395006 (= e!789764 e!789762)))

(declare-fun lt!612814 () (_ BitVec 64))

(assert (=> b!1395006 (= lt!612814 (select (arr!46071 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!612816 () Unit!46780)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95426 (_ BitVec 64) (_ BitVec 32)) Unit!46780)

(assert (=> b!1395006 (= lt!612816 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!612814 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95426 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1395006 (arrayContainsKey!0 a!2901 lt!612814 #b00000000000000000000000000000000)))

(declare-fun lt!612815 () Unit!46780)

(assert (=> b!1395006 (= lt!612815 lt!612816)))

(declare-fun res!934411 () Bool)

(assert (=> b!1395006 (= res!934411 (= (seekEntryOrOpen!0 (select (arr!46071 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10388 #b00000000000000000000000000000000)))))

(assert (=> b!1395006 (=> (not res!934411) (not e!789762))))

(declare-fun d!150635 () Bool)

(declare-fun res!934410 () Bool)

(declare-fun e!789763 () Bool)

(assert (=> d!150635 (=> res!934410 e!789763)))

(assert (=> d!150635 (= res!934410 (bvsge #b00000000000000000000000000000000 (size!46621 a!2901)))))

(assert (=> d!150635 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!789763)))

(declare-fun bm!66802 () Bool)

(declare-fun call!66805 () Bool)

(assert (=> bm!66802 (= call!66805 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1395007 () Bool)

(assert (=> b!1395007 (= e!789764 call!66805)))

(declare-fun b!1395008 () Bool)

(assert (=> b!1395008 (= e!789762 call!66805)))

(declare-fun b!1395009 () Bool)

(assert (=> b!1395009 (= e!789763 e!789764)))

(declare-fun c!129750 () Bool)

(assert (=> b!1395009 (= c!129750 (validKeyInArray!0 (select (arr!46071 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!150635 (not res!934410)) b!1395009))

(assert (= (and b!1395009 c!129750) b!1395006))

(assert (= (and b!1395009 (not c!129750)) b!1395007))

(assert (= (and b!1395006 res!934411) b!1395008))

(assert (= (or b!1395008 b!1395007) bm!66802))

(declare-fun m!1281543 () Bool)

(assert (=> b!1395006 m!1281543))

(declare-fun m!1281545 () Bool)

(assert (=> b!1395006 m!1281545))

(declare-fun m!1281547 () Bool)

(assert (=> b!1395006 m!1281547))

(assert (=> b!1395006 m!1281543))

(declare-fun m!1281549 () Bool)

(assert (=> b!1395006 m!1281549))

(declare-fun m!1281551 () Bool)

(assert (=> bm!66802 m!1281551))

(assert (=> b!1395009 m!1281543))

(assert (=> b!1395009 m!1281543))

(declare-fun m!1281553 () Bool)

(assert (=> b!1395009 m!1281553))

(assert (=> b!1394966 d!150635))

(declare-fun b!1395036 () Bool)

(declare-fun lt!612825 () SeekEntryResult!10388)

(assert (=> b!1395036 (and (bvsge (index!43925 lt!612825) #b00000000000000000000000000000000) (bvslt (index!43925 lt!612825) (size!46621 (array!95427 (store (arr!46071 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46621 a!2901)))))))

(declare-fun e!789782 () Bool)

(assert (=> b!1395036 (= e!789782 (= (select (arr!46071 (array!95427 (store (arr!46071 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46621 a!2901))) (index!43925 lt!612825)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1395037 () Bool)

(assert (=> b!1395037 (and (bvsge (index!43925 lt!612825) #b00000000000000000000000000000000) (bvslt (index!43925 lt!612825) (size!46621 (array!95427 (store (arr!46071 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46621 a!2901)))))))

(declare-fun res!934420 () Bool)

(assert (=> b!1395037 (= res!934420 (= (select (arr!46071 (array!95427 (store (arr!46071 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46621 a!2901))) (index!43925 lt!612825)) (select (store (arr!46071 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1395037 (=> res!934420 e!789782)))

(declare-fun e!789783 () Bool)

(assert (=> b!1395037 (= e!789783 e!789782)))

(declare-fun b!1395038 () Bool)

(declare-fun e!789781 () SeekEntryResult!10388)

(assert (=> b!1395038 (= e!789781 (Intermediate!10388 true (toIndex!0 (select (store (arr!46071 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun e!789779 () SeekEntryResult!10388)

(declare-fun b!1395039 () Bool)

(assert (=> b!1395039 (= e!789779 (Intermediate!10388 false (toIndex!0 (select (store (arr!46071 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1395040 () Bool)

(assert (=> b!1395040 (and (bvsge (index!43925 lt!612825) #b00000000000000000000000000000000) (bvslt (index!43925 lt!612825) (size!46621 (array!95427 (store (arr!46071 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46621 a!2901)))))))

(declare-fun res!934419 () Bool)

(assert (=> b!1395040 (= res!934419 (= (select (arr!46071 (array!95427 (store (arr!46071 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46621 a!2901))) (index!43925 lt!612825)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1395040 (=> res!934419 e!789782)))

(declare-fun b!1395041 () Bool)

(declare-fun e!789780 () Bool)

(assert (=> b!1395041 (= e!789780 (bvsge (x!125584 lt!612825) #b01111111111111111111111111111110))))

(declare-fun b!1395042 () Bool)

(assert (=> b!1395042 (= e!789780 e!789783)))

(declare-fun res!934418 () Bool)

(assert (=> b!1395042 (= res!934418 (and ((_ is Intermediate!10388) lt!612825) (not (undefined!11200 lt!612825)) (bvslt (x!125584 lt!612825) #b01111111111111111111111111111110) (bvsge (x!125584 lt!612825) #b00000000000000000000000000000000) (bvsge (x!125584 lt!612825) #b00000000000000000000000000000000)))))

(assert (=> b!1395042 (=> (not res!934418) (not e!789783))))

(declare-fun d!150637 () Bool)

(assert (=> d!150637 e!789780))

(declare-fun c!129762 () Bool)

(assert (=> d!150637 (= c!129762 (and ((_ is Intermediate!10388) lt!612825) (undefined!11200 lt!612825)))))

(assert (=> d!150637 (= lt!612825 e!789781)))

(declare-fun c!129761 () Bool)

(assert (=> d!150637 (= c!129761 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!612826 () (_ BitVec 64))

(assert (=> d!150637 (= lt!612826 (select (arr!46071 (array!95427 (store (arr!46071 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46621 a!2901))) (toIndex!0 (select (store (arr!46071 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!150637 (validMask!0 mask!2840)))

(assert (=> d!150637 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46071 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46071 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95427 (store (arr!46071 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46621 a!2901)) mask!2840) lt!612825)))

(declare-fun b!1395043 () Bool)

(assert (=> b!1395043 (= e!789781 e!789779)))

(declare-fun c!129763 () Bool)

(assert (=> b!1395043 (= c!129763 (or (= lt!612826 (select (store (arr!46071 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!612826 lt!612826) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1395044 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395044 (= e!789779 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46071 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46071 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95427 (store (arr!46071 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46621 a!2901)) mask!2840))))

(assert (= (and d!150637 c!129761) b!1395038))

(assert (= (and d!150637 (not c!129761)) b!1395043))

(assert (= (and b!1395043 c!129763) b!1395039))

(assert (= (and b!1395043 (not c!129763)) b!1395044))

(assert (= (and d!150637 c!129762) b!1395041))

(assert (= (and d!150637 (not c!129762)) b!1395042))

(assert (= (and b!1395042 res!934418) b!1395037))

(assert (= (and b!1395037 (not res!934420)) b!1395040))

(assert (= (and b!1395040 (not res!934419)) b!1395036))

(declare-fun m!1281555 () Bool)

(assert (=> b!1395036 m!1281555))

(assert (=> b!1395044 m!1281493))

(declare-fun m!1281557 () Bool)

(assert (=> b!1395044 m!1281557))

(assert (=> b!1395044 m!1281557))

(assert (=> b!1395044 m!1281491))

(declare-fun m!1281559 () Bool)

(assert (=> b!1395044 m!1281559))

(assert (=> b!1395040 m!1281555))

(assert (=> d!150637 m!1281493))

(declare-fun m!1281561 () Bool)

(assert (=> d!150637 m!1281561))

(assert (=> d!150637 m!1281483))

(assert (=> b!1395037 m!1281555))

(assert (=> b!1394967 d!150637))

(declare-fun d!150643 () Bool)

(declare-fun lt!612838 () (_ BitVec 32))

(declare-fun lt!612837 () (_ BitVec 32))

(assert (=> d!150643 (= lt!612838 (bvmul (bvxor lt!612837 (bvlshr lt!612837 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150643 (= lt!612837 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46071 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46071 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150643 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!934427 (let ((h!33821 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46071 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46071 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125589 (bvmul (bvxor h!33821 (bvlshr h!33821 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125589 (bvlshr x!125589 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!934427 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!934427 #b00000000000000000000000000000000))))))

(assert (=> d!150643 (= (toIndex!0 (select (store (arr!46071 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!612838 (bvlshr lt!612838 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1394967 d!150643))

(declare-fun d!150647 () Bool)

(assert (=> d!150647 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119744 d!150647))

(declare-fun d!150655 () Bool)

(assert (=> d!150655 (= (array_inv!35099 a!2901) (bvsge (size!46621 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119744 d!150655))

(declare-fun b!1395091 () Bool)

(declare-fun e!789812 () Bool)

(declare-fun e!789810 () Bool)

(assert (=> b!1395091 (= e!789812 e!789810)))

(declare-fun lt!612853 () (_ BitVec 64))

(assert (=> b!1395091 (= lt!612853 (select (arr!46071 a!2901) j!112))))

(declare-fun lt!612855 () Unit!46780)

(assert (=> b!1395091 (= lt!612855 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!612853 j!112))))

(assert (=> b!1395091 (arrayContainsKey!0 a!2901 lt!612853 #b00000000000000000000000000000000)))

(declare-fun lt!612854 () Unit!46780)

(assert (=> b!1395091 (= lt!612854 lt!612855)))

(declare-fun res!934443 () Bool)

(assert (=> b!1395091 (= res!934443 (= (seekEntryOrOpen!0 (select (arr!46071 a!2901) j!112) a!2901 mask!2840) (Found!10388 j!112)))))

(assert (=> b!1395091 (=> (not res!934443) (not e!789810))))

(declare-fun d!150657 () Bool)

(declare-fun res!934442 () Bool)

(declare-fun e!789811 () Bool)

(assert (=> d!150657 (=> res!934442 e!789811)))

(assert (=> d!150657 (= res!934442 (bvsge j!112 (size!46621 a!2901)))))

(assert (=> d!150657 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!789811)))

(declare-fun bm!66803 () Bool)

(declare-fun call!66806 () Bool)

(assert (=> bm!66803 (= call!66806 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1395092 () Bool)

(assert (=> b!1395092 (= e!789812 call!66806)))

(declare-fun b!1395093 () Bool)

(assert (=> b!1395093 (= e!789810 call!66806)))

(declare-fun b!1395094 () Bool)

(assert (=> b!1395094 (= e!789811 e!789812)))

(declare-fun c!129778 () Bool)

(assert (=> b!1395094 (= c!129778 (validKeyInArray!0 (select (arr!46071 a!2901) j!112)))))

(assert (= (and d!150657 (not res!934442)) b!1395094))

(assert (= (and b!1395094 c!129778) b!1395091))

(assert (= (and b!1395094 (not c!129778)) b!1395092))

(assert (= (and b!1395091 res!934443) b!1395093))

(assert (= (or b!1395093 b!1395092) bm!66803))

(assert (=> b!1395091 m!1281479))

(declare-fun m!1281579 () Bool)

(assert (=> b!1395091 m!1281579))

(declare-fun m!1281581 () Bool)

(assert (=> b!1395091 m!1281581))

(assert (=> b!1395091 m!1281479))

(assert (=> b!1395091 m!1281481))

(declare-fun m!1281583 () Bool)

(assert (=> bm!66803 m!1281583))

(assert (=> b!1395094 m!1281479))

(assert (=> b!1395094 m!1281479))

(assert (=> b!1395094 m!1281507))

(assert (=> b!1394968 d!150657))

(declare-fun d!150659 () Bool)

(assert (=> d!150659 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!612864 () Unit!46780)

(declare-fun choose!38 (array!95426 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46780)

(assert (=> d!150659 (= lt!612864 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150659 (validMask!0 mask!2840)))

(assert (=> d!150659 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!612864)))

(declare-fun bs!40601 () Bool)

(assert (= bs!40601 d!150659))

(assert (=> bs!40601 m!1281503))

(declare-fun m!1281585 () Bool)

(assert (=> bs!40601 m!1281585))

(assert (=> bs!40601 m!1281483))

(assert (=> b!1394968 d!150659))

(declare-fun b!1395107 () Bool)

(declare-fun lt!612868 () SeekEntryResult!10388)

(assert (=> b!1395107 (and (bvsge (index!43925 lt!612868) #b00000000000000000000000000000000) (bvslt (index!43925 lt!612868) (size!46621 a!2901)))))

(declare-fun e!789825 () Bool)

(assert (=> b!1395107 (= e!789825 (= (select (arr!46071 a!2901) (index!43925 lt!612868)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1395108 () Bool)

(assert (=> b!1395108 (and (bvsge (index!43925 lt!612868) #b00000000000000000000000000000000) (bvslt (index!43925 lt!612868) (size!46621 a!2901)))))

(declare-fun res!934452 () Bool)

(assert (=> b!1395108 (= res!934452 (= (select (arr!46071 a!2901) (index!43925 lt!612868)) (select (arr!46071 a!2901) j!112)))))

(assert (=> b!1395108 (=> res!934452 e!789825)))

(declare-fun e!789826 () Bool)

(assert (=> b!1395108 (= e!789826 e!789825)))

(declare-fun b!1395109 () Bool)

(declare-fun e!789824 () SeekEntryResult!10388)

(assert (=> b!1395109 (= e!789824 (Intermediate!10388 true (toIndex!0 (select (arr!46071 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun e!789822 () SeekEntryResult!10388)

(declare-fun b!1395110 () Bool)

(assert (=> b!1395110 (= e!789822 (Intermediate!10388 false (toIndex!0 (select (arr!46071 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1395111 () Bool)

(assert (=> b!1395111 (and (bvsge (index!43925 lt!612868) #b00000000000000000000000000000000) (bvslt (index!43925 lt!612868) (size!46621 a!2901)))))

(declare-fun res!934451 () Bool)

(assert (=> b!1395111 (= res!934451 (= (select (arr!46071 a!2901) (index!43925 lt!612868)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1395111 (=> res!934451 e!789825)))

(declare-fun b!1395112 () Bool)

(declare-fun e!789823 () Bool)

(assert (=> b!1395112 (= e!789823 (bvsge (x!125584 lt!612868) #b01111111111111111111111111111110))))

(declare-fun b!1395113 () Bool)

(assert (=> b!1395113 (= e!789823 e!789826)))

(declare-fun res!934450 () Bool)

(assert (=> b!1395113 (= res!934450 (and ((_ is Intermediate!10388) lt!612868) (not (undefined!11200 lt!612868)) (bvslt (x!125584 lt!612868) #b01111111111111111111111111111110) (bvsge (x!125584 lt!612868) #b00000000000000000000000000000000) (bvsge (x!125584 lt!612868) #b00000000000000000000000000000000)))))

(assert (=> b!1395113 (=> (not res!934450) (not e!789826))))

(declare-fun d!150661 () Bool)

(assert (=> d!150661 e!789823))

(declare-fun c!129783 () Bool)

(assert (=> d!150661 (= c!129783 (and ((_ is Intermediate!10388) lt!612868) (undefined!11200 lt!612868)))))

(assert (=> d!150661 (= lt!612868 e!789824)))

(declare-fun c!129782 () Bool)

(assert (=> d!150661 (= c!129782 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!612869 () (_ BitVec 64))

(assert (=> d!150661 (= lt!612869 (select (arr!46071 a!2901) (toIndex!0 (select (arr!46071 a!2901) j!112) mask!2840)))))

(assert (=> d!150661 (validMask!0 mask!2840)))

(assert (=> d!150661 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46071 a!2901) j!112) mask!2840) (select (arr!46071 a!2901) j!112) a!2901 mask!2840) lt!612868)))

(declare-fun b!1395114 () Bool)

(assert (=> b!1395114 (= e!789824 e!789822)))

(declare-fun c!129784 () Bool)

(assert (=> b!1395114 (= c!129784 (or (= lt!612869 (select (arr!46071 a!2901) j!112)) (= (bvadd lt!612869 lt!612869) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1395115 () Bool)

(assert (=> b!1395115 (= e!789822 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46071 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46071 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and d!150661 c!129782) b!1395109))

(assert (= (and d!150661 (not c!129782)) b!1395114))

(assert (= (and b!1395114 c!129784) b!1395110))

(assert (= (and b!1395114 (not c!129784)) b!1395115))

(assert (= (and d!150661 c!129783) b!1395112))

(assert (= (and d!150661 (not c!129783)) b!1395113))

(assert (= (and b!1395113 res!934450) b!1395108))

(assert (= (and b!1395108 (not res!934452)) b!1395111))

(assert (= (and b!1395111 (not res!934451)) b!1395107))

(declare-fun m!1281599 () Bool)

(assert (=> b!1395107 m!1281599))

(assert (=> b!1395115 m!1281497))

(declare-fun m!1281601 () Bool)

(assert (=> b!1395115 m!1281601))

(assert (=> b!1395115 m!1281601))

(assert (=> b!1395115 m!1281479))

(declare-fun m!1281603 () Bool)

(assert (=> b!1395115 m!1281603))

(assert (=> b!1395111 m!1281599))

(assert (=> d!150661 m!1281497))

(declare-fun m!1281605 () Bool)

(assert (=> d!150661 m!1281605))

(assert (=> d!150661 m!1281483))

(assert (=> b!1395108 m!1281599))

(assert (=> b!1394968 d!150661))

(declare-fun d!150665 () Bool)

(declare-fun lt!612871 () (_ BitVec 32))

(declare-fun lt!612870 () (_ BitVec 32))

(assert (=> d!150665 (= lt!612871 (bvmul (bvxor lt!612870 (bvlshr lt!612870 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150665 (= lt!612870 ((_ extract 31 0) (bvand (bvxor (select (arr!46071 a!2901) j!112) (bvlshr (select (arr!46071 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150665 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!934427 (let ((h!33821 ((_ extract 31 0) (bvand (bvxor (select (arr!46071 a!2901) j!112) (bvlshr (select (arr!46071 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125589 (bvmul (bvxor h!33821 (bvlshr h!33821 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125589 (bvlshr x!125589 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!934427 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!934427 #b00000000000000000000000000000000))))))

(assert (=> d!150665 (= (toIndex!0 (select (arr!46071 a!2901) j!112) mask!2840) (bvand (bvxor lt!612871 (bvlshr lt!612871 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1394968 d!150665))

(declare-fun d!150667 () Bool)

(assert (=> d!150667 (= (validKeyInArray!0 (select (arr!46071 a!2901) i!1037)) (and (not (= (select (arr!46071 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46071 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1394969 d!150667))

(declare-fun b!1395144 () Bool)

(declare-fun e!789844 () Bool)

(declare-fun e!789845 () Bool)

(assert (=> b!1395144 (= e!789844 e!789845)))

(declare-fun res!934461 () Bool)

(assert (=> b!1395144 (=> (not res!934461) (not e!789845))))

(declare-fun e!789846 () Bool)

(assert (=> b!1395144 (= res!934461 (not e!789846))))

(declare-fun res!934460 () Bool)

(assert (=> b!1395144 (=> (not res!934460) (not e!789846))))

(assert (=> b!1395144 (= res!934460 (validKeyInArray!0 (select (arr!46071 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66809 () Bool)

(declare-fun call!66812 () Bool)

(declare-fun c!129796 () Bool)

(assert (=> bm!66809 (= call!66812 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129796 (Cons!32586 (select (arr!46071 a!2901) #b00000000000000000000000000000000) Nil!32587) Nil!32587)))))

(declare-fun b!1395146 () Bool)

(declare-fun contains!9774 (List!32590 (_ BitVec 64)) Bool)

(assert (=> b!1395146 (= e!789846 (contains!9774 Nil!32587 (select (arr!46071 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1395147 () Bool)

(declare-fun e!789847 () Bool)

(assert (=> b!1395147 (= e!789845 e!789847)))

(assert (=> b!1395147 (= c!129796 (validKeyInArray!0 (select (arr!46071 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1395148 () Bool)

(assert (=> b!1395148 (= e!789847 call!66812)))

(declare-fun b!1395145 () Bool)

(assert (=> b!1395145 (= e!789847 call!66812)))

(declare-fun d!150669 () Bool)

(declare-fun res!934459 () Bool)

(assert (=> d!150669 (=> res!934459 e!789844)))

(assert (=> d!150669 (= res!934459 (bvsge #b00000000000000000000000000000000 (size!46621 a!2901)))))

(assert (=> d!150669 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32587) e!789844)))

(assert (= (and d!150669 (not res!934459)) b!1395144))

(assert (= (and b!1395144 res!934460) b!1395146))

(assert (= (and b!1395144 res!934461) b!1395147))

(assert (= (and b!1395147 c!129796) b!1395145))

(assert (= (and b!1395147 (not c!129796)) b!1395148))

(assert (= (or b!1395145 b!1395148) bm!66809))

(assert (=> b!1395144 m!1281543))

(assert (=> b!1395144 m!1281543))

(assert (=> b!1395144 m!1281553))

(assert (=> bm!66809 m!1281543))

(declare-fun m!1281609 () Bool)

(assert (=> bm!66809 m!1281609))

(assert (=> b!1395146 m!1281543))

(assert (=> b!1395146 m!1281543))

(declare-fun m!1281613 () Bool)

(assert (=> b!1395146 m!1281613))

(assert (=> b!1395147 m!1281543))

(assert (=> b!1395147 m!1281543))

(assert (=> b!1395147 m!1281553))

(assert (=> b!1394964 d!150669))

(declare-fun d!150671 () Bool)

(assert (=> d!150671 (= (validKeyInArray!0 (select (arr!46071 a!2901) j!112)) (and (not (= (select (arr!46071 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46071 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1394970 d!150671))

(declare-fun b!1395200 () Bool)

(declare-fun e!789883 () SeekEntryResult!10388)

(assert (=> b!1395200 (= e!789883 Undefined!10388)))

(declare-fun b!1395201 () Bool)

(declare-fun e!789881 () SeekEntryResult!10388)

(declare-fun lt!612903 () SeekEntryResult!10388)

(assert (=> b!1395201 (= e!789881 (MissingZero!10388 (index!43925 lt!612903)))))

(declare-fun b!1395202 () Bool)

(declare-fun e!789882 () SeekEntryResult!10388)

(assert (=> b!1395202 (= e!789883 e!789882)))

(declare-fun lt!612904 () (_ BitVec 64))

(assert (=> b!1395202 (= lt!612904 (select (arr!46071 a!2901) (index!43925 lt!612903)))))

(declare-fun c!129816 () Bool)

(assert (=> b!1395202 (= c!129816 (= lt!612904 (select (arr!46071 a!2901) j!112)))))

(declare-fun d!150675 () Bool)

(declare-fun lt!612902 () SeekEntryResult!10388)

(assert (=> d!150675 (and (or ((_ is Undefined!10388) lt!612902) (not ((_ is Found!10388) lt!612902)) (and (bvsge (index!43924 lt!612902) #b00000000000000000000000000000000) (bvslt (index!43924 lt!612902) (size!46621 a!2901)))) (or ((_ is Undefined!10388) lt!612902) ((_ is Found!10388) lt!612902) (not ((_ is MissingZero!10388) lt!612902)) (and (bvsge (index!43923 lt!612902) #b00000000000000000000000000000000) (bvslt (index!43923 lt!612902) (size!46621 a!2901)))) (or ((_ is Undefined!10388) lt!612902) ((_ is Found!10388) lt!612902) ((_ is MissingZero!10388) lt!612902) (not ((_ is MissingVacant!10388) lt!612902)) (and (bvsge (index!43926 lt!612902) #b00000000000000000000000000000000) (bvslt (index!43926 lt!612902) (size!46621 a!2901)))) (or ((_ is Undefined!10388) lt!612902) (ite ((_ is Found!10388) lt!612902) (= (select (arr!46071 a!2901) (index!43924 lt!612902)) (select (arr!46071 a!2901) j!112)) (ite ((_ is MissingZero!10388) lt!612902) (= (select (arr!46071 a!2901) (index!43923 lt!612902)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10388) lt!612902) (= (select (arr!46071 a!2901) (index!43926 lt!612902)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150675 (= lt!612902 e!789883)))

(declare-fun c!129815 () Bool)

(assert (=> d!150675 (= c!129815 (and ((_ is Intermediate!10388) lt!612903) (undefined!11200 lt!612903)))))

(assert (=> d!150675 (= lt!612903 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46071 a!2901) j!112) mask!2840) (select (arr!46071 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150675 (validMask!0 mask!2840)))

(assert (=> d!150675 (= (seekEntryOrOpen!0 (select (arr!46071 a!2901) j!112) a!2901 mask!2840) lt!612902)))

(declare-fun b!1395203 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95426 (_ BitVec 32)) SeekEntryResult!10388)

(assert (=> b!1395203 (= e!789881 (seekKeyOrZeroReturnVacant!0 (x!125584 lt!612903) (index!43925 lt!612903) (index!43925 lt!612903) (select (arr!46071 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395204 () Bool)

(assert (=> b!1395204 (= e!789882 (Found!10388 (index!43925 lt!612903)))))

(declare-fun b!1395205 () Bool)

(declare-fun c!129817 () Bool)

(assert (=> b!1395205 (= c!129817 (= lt!612904 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1395205 (= e!789882 e!789881)))

(assert (= (and d!150675 c!129815) b!1395200))

(assert (= (and d!150675 (not c!129815)) b!1395202))

(assert (= (and b!1395202 c!129816) b!1395204))

(assert (= (and b!1395202 (not c!129816)) b!1395205))

(assert (= (and b!1395205 c!129817) b!1395201))

(assert (= (and b!1395205 (not c!129817)) b!1395203))

(declare-fun m!1281637 () Bool)

(assert (=> b!1395202 m!1281637))

(assert (=> d!150675 m!1281483))

(declare-fun m!1281639 () Bool)

(assert (=> d!150675 m!1281639))

(assert (=> d!150675 m!1281497))

(assert (=> d!150675 m!1281479))

(assert (=> d!150675 m!1281501))

(assert (=> d!150675 m!1281479))

(assert (=> d!150675 m!1281497))

(declare-fun m!1281641 () Bool)

(assert (=> d!150675 m!1281641))

(declare-fun m!1281643 () Bool)

(assert (=> d!150675 m!1281643))

(assert (=> b!1395203 m!1281479))

(declare-fun m!1281645 () Bool)

(assert (=> b!1395203 m!1281645))

(assert (=> b!1394965 d!150675))

(check-sat (not d!150637) (not bm!66809) (not b!1395146) (not d!150659) (not bm!66803) (not b!1395115) (not b!1395006) (not b!1395203) (not b!1395144) (not b!1395094) (not b!1395091) (not d!150661) (not b!1395044) (not b!1395009) (not bm!66802) (not b!1395147) (not d!150675))
(check-sat)
