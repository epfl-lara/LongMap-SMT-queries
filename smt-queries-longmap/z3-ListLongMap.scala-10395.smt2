; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122450 () Bool)

(assert start!122450)

(declare-fun b!1418864 () Bool)

(declare-fun res!954474 () Bool)

(declare-fun e!802853 () Bool)

(assert (=> b!1418864 (=> (not res!954474) (not e!802853))))

(declare-datatypes ((array!96893 0))(
  ( (array!96894 (arr!46767 (Array (_ BitVec 32) (_ BitVec 64))) (size!47317 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96893)

(declare-datatypes ((List!33277 0))(
  ( (Nil!33274) (Cons!33273 (h!34569 (_ BitVec 64)) (t!47971 List!33277)) )
))
(declare-fun arrayNoDuplicates!0 (array!96893 (_ BitVec 32) List!33277) Bool)

(assert (=> b!1418864 (= res!954474 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33274))))

(declare-fun b!1418865 () Bool)

(declare-fun res!954477 () Bool)

(assert (=> b!1418865 (=> (not res!954477) (not e!802853))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1418865 (= res!954477 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47317 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47317 a!2831))))))

(declare-fun b!1418866 () Bool)

(declare-fun res!954472 () Bool)

(assert (=> b!1418866 (=> (not res!954472) (not e!802853))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96893 (_ BitVec 32)) Bool)

(assert (=> b!1418866 (= res!954472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1418867 () Bool)

(declare-fun res!954471 () Bool)

(assert (=> b!1418867 (=> (not res!954471) (not e!802853))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418867 (= res!954471 (validKeyInArray!0 (select (arr!46767 a!2831) j!81)))))

(declare-fun b!1418868 () Bool)

(declare-fun res!954478 () Bool)

(assert (=> b!1418868 (=> (not res!954478) (not e!802853))))

(declare-datatypes ((SeekEntryResult!11052 0))(
  ( (MissingZero!11052 (index!46600 (_ BitVec 32))) (Found!11052 (index!46601 (_ BitVec 32))) (Intermediate!11052 (undefined!11864 Bool) (index!46602 (_ BitVec 32)) (x!128266 (_ BitVec 32))) (Undefined!11052) (MissingVacant!11052 (index!46603 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96893 (_ BitVec 32)) SeekEntryResult!11052)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418868 (= res!954478 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46767 a!2831) j!81) mask!2608) (select (arr!46767 a!2831) j!81) a!2831 mask!2608) (Intermediate!11052 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun res!954476 () Bool)

(assert (=> start!122450 (=> (not res!954476) (not e!802853))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122450 (= res!954476 (validMask!0 mask!2608))))

(assert (=> start!122450 e!802853))

(assert (=> start!122450 true))

(declare-fun array_inv!35795 (array!96893) Bool)

(assert (=> start!122450 (array_inv!35795 a!2831)))

(declare-fun b!1418869 () Bool)

(assert (=> b!1418869 (= e!802853 (and (bvsge mask!2608 #b00000000000000000000000000000000) (bvsgt mask!2608 #b00111111111111111111111111111111)))))

(declare-fun b!1418870 () Bool)

(declare-fun res!954475 () Bool)

(assert (=> b!1418870 (=> (not res!954475) (not e!802853))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1418870 (= res!954475 (validKeyInArray!0 (select (arr!46767 a!2831) i!982)))))

(declare-fun b!1418871 () Bool)

(declare-fun res!954473 () Bool)

(assert (=> b!1418871 (=> (not res!954473) (not e!802853))))

(assert (=> b!1418871 (= res!954473 (and (= (size!47317 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47317 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47317 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122450 res!954476) b!1418871))

(assert (= (and b!1418871 res!954473) b!1418870))

(assert (= (and b!1418870 res!954475) b!1418867))

(assert (= (and b!1418867 res!954471) b!1418866))

(assert (= (and b!1418866 res!954472) b!1418864))

(assert (= (and b!1418864 res!954474) b!1418865))

(assert (= (and b!1418865 res!954477) b!1418868))

(assert (= (and b!1418868 res!954478) b!1418869))

(declare-fun m!1309463 () Bool)

(assert (=> b!1418868 m!1309463))

(assert (=> b!1418868 m!1309463))

(declare-fun m!1309465 () Bool)

(assert (=> b!1418868 m!1309465))

(assert (=> b!1418868 m!1309465))

(assert (=> b!1418868 m!1309463))

(declare-fun m!1309467 () Bool)

(assert (=> b!1418868 m!1309467))

(assert (=> b!1418867 m!1309463))

(assert (=> b!1418867 m!1309463))

(declare-fun m!1309469 () Bool)

(assert (=> b!1418867 m!1309469))

(declare-fun m!1309471 () Bool)

(assert (=> b!1418866 m!1309471))

(declare-fun m!1309473 () Bool)

(assert (=> start!122450 m!1309473))

(declare-fun m!1309475 () Bool)

(assert (=> start!122450 m!1309475))

(declare-fun m!1309477 () Bool)

(assert (=> b!1418870 m!1309477))

(assert (=> b!1418870 m!1309477))

(declare-fun m!1309479 () Bool)

(assert (=> b!1418870 m!1309479))

(declare-fun m!1309481 () Bool)

(assert (=> b!1418864 m!1309481))

(check-sat (not b!1418866) (not b!1418868) (not b!1418867) (not start!122450) (not b!1418864) (not b!1418870))
(check-sat)
(get-model)

(declare-fun d!152929 () Bool)

(assert (=> d!152929 (= (validKeyInArray!0 (select (arr!46767 a!2831) i!982)) (and (not (= (select (arr!46767 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46767 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1418870 d!152929))

(declare-fun b!1418906 () Bool)

(declare-fun e!802870 () Bool)

(declare-fun call!67288 () Bool)

(assert (=> b!1418906 (= e!802870 call!67288)))

(declare-fun b!1418907 () Bool)

(declare-fun e!802871 () Bool)

(assert (=> b!1418907 (= e!802871 e!802870)))

(declare-fun c!131682 () Bool)

(assert (=> b!1418907 (= c!131682 (validKeyInArray!0 (select (arr!46767 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!152931 () Bool)

(declare-fun res!954511 () Bool)

(declare-fun e!802869 () Bool)

(assert (=> d!152931 (=> res!954511 e!802869)))

(assert (=> d!152931 (= res!954511 (bvsge #b00000000000000000000000000000000 (size!47317 a!2831)))))

(assert (=> d!152931 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33274) e!802869)))

(declare-fun b!1418908 () Bool)

(assert (=> b!1418908 (= e!802870 call!67288)))

(declare-fun b!1418909 () Bool)

(assert (=> b!1418909 (= e!802869 e!802871)))

(declare-fun res!954510 () Bool)

(assert (=> b!1418909 (=> (not res!954510) (not e!802871))))

(declare-fun e!802868 () Bool)

(assert (=> b!1418909 (= res!954510 (not e!802868))))

(declare-fun res!954509 () Bool)

(assert (=> b!1418909 (=> (not res!954509) (not e!802868))))

(assert (=> b!1418909 (= res!954509 (validKeyInArray!0 (select (arr!46767 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1418910 () Bool)

(declare-fun contains!9841 (List!33277 (_ BitVec 64)) Bool)

(assert (=> b!1418910 (= e!802868 (contains!9841 Nil!33274 (select (arr!46767 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67285 () Bool)

(assert (=> bm!67285 (= call!67288 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131682 (Cons!33273 (select (arr!46767 a!2831) #b00000000000000000000000000000000) Nil!33274) Nil!33274)))))

(assert (= (and d!152931 (not res!954511)) b!1418909))

(assert (= (and b!1418909 res!954509) b!1418910))

(assert (= (and b!1418909 res!954510) b!1418907))

(assert (= (and b!1418907 c!131682) b!1418908))

(assert (= (and b!1418907 (not c!131682)) b!1418906))

(assert (= (or b!1418908 b!1418906) bm!67285))

(declare-fun m!1309503 () Bool)

(assert (=> b!1418907 m!1309503))

(assert (=> b!1418907 m!1309503))

(declare-fun m!1309505 () Bool)

(assert (=> b!1418907 m!1309505))

(assert (=> b!1418909 m!1309503))

(assert (=> b!1418909 m!1309503))

(assert (=> b!1418909 m!1309505))

(assert (=> b!1418910 m!1309503))

(assert (=> b!1418910 m!1309503))

(declare-fun m!1309507 () Bool)

(assert (=> b!1418910 m!1309507))

(assert (=> bm!67285 m!1309503))

(declare-fun m!1309509 () Bool)

(assert (=> bm!67285 m!1309509))

(assert (=> b!1418864 d!152931))

(declare-fun b!1418956 () Bool)

(declare-fun lt!625673 () SeekEntryResult!11052)

(assert (=> b!1418956 (and (bvsge (index!46602 lt!625673) #b00000000000000000000000000000000) (bvslt (index!46602 lt!625673) (size!47317 a!2831)))))

(declare-fun e!802904 () Bool)

(assert (=> b!1418956 (= e!802904 (= (select (arr!46767 a!2831) (index!46602 lt!625673)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!802907 () SeekEntryResult!11052)

(declare-fun b!1418957 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418957 (= e!802907 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46767 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!46767 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1418958 () Bool)

(declare-fun e!802905 () Bool)

(declare-fun e!802906 () Bool)

(assert (=> b!1418958 (= e!802905 e!802906)))

(declare-fun res!954533 () Bool)

(get-info :version)

(assert (=> b!1418958 (= res!954533 (and ((_ is Intermediate!11052) lt!625673) (not (undefined!11864 lt!625673)) (bvslt (x!128266 lt!625673) #b01111111111111111111111111111110) (bvsge (x!128266 lt!625673) #b00000000000000000000000000000000) (bvsge (x!128266 lt!625673) #b00000000000000000000000000000000)))))

(assert (=> b!1418958 (=> (not res!954533) (not e!802906))))

(declare-fun b!1418959 () Bool)

(assert (=> b!1418959 (= e!802907 (Intermediate!11052 false (toIndex!0 (select (arr!46767 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun d!152933 () Bool)

(assert (=> d!152933 e!802905))

(declare-fun c!131695 () Bool)

(assert (=> d!152933 (= c!131695 (and ((_ is Intermediate!11052) lt!625673) (undefined!11864 lt!625673)))))

(declare-fun e!802903 () SeekEntryResult!11052)

(assert (=> d!152933 (= lt!625673 e!802903)))

(declare-fun c!131696 () Bool)

(assert (=> d!152933 (= c!131696 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!625674 () (_ BitVec 64))

(assert (=> d!152933 (= lt!625674 (select (arr!46767 a!2831) (toIndex!0 (select (arr!46767 a!2831) j!81) mask!2608)))))

(assert (=> d!152933 (validMask!0 mask!2608)))

(assert (=> d!152933 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46767 a!2831) j!81) mask!2608) (select (arr!46767 a!2831) j!81) a!2831 mask!2608) lt!625673)))

(declare-fun b!1418960 () Bool)

(assert (=> b!1418960 (= e!802903 e!802907)))

(declare-fun c!131697 () Bool)

(assert (=> b!1418960 (= c!131697 (or (= lt!625674 (select (arr!46767 a!2831) j!81)) (= (bvadd lt!625674 lt!625674) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1418961 () Bool)

(assert (=> b!1418961 (and (bvsge (index!46602 lt!625673) #b00000000000000000000000000000000) (bvslt (index!46602 lt!625673) (size!47317 a!2831)))))

(declare-fun res!954535 () Bool)

(assert (=> b!1418961 (= res!954535 (= (select (arr!46767 a!2831) (index!46602 lt!625673)) (select (arr!46767 a!2831) j!81)))))

(assert (=> b!1418961 (=> res!954535 e!802904)))

(assert (=> b!1418961 (= e!802906 e!802904)))

(declare-fun b!1418962 () Bool)

(assert (=> b!1418962 (and (bvsge (index!46602 lt!625673) #b00000000000000000000000000000000) (bvslt (index!46602 lt!625673) (size!47317 a!2831)))))

(declare-fun res!954534 () Bool)

(assert (=> b!1418962 (= res!954534 (= (select (arr!46767 a!2831) (index!46602 lt!625673)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1418962 (=> res!954534 e!802904)))

(declare-fun b!1418963 () Bool)

(assert (=> b!1418963 (= e!802905 (bvsge (x!128266 lt!625673) #b01111111111111111111111111111110))))

(declare-fun b!1418964 () Bool)

(assert (=> b!1418964 (= e!802903 (Intermediate!11052 true (toIndex!0 (select (arr!46767 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(assert (= (and d!152933 c!131696) b!1418964))

(assert (= (and d!152933 (not c!131696)) b!1418960))

(assert (= (and b!1418960 c!131697) b!1418959))

(assert (= (and b!1418960 (not c!131697)) b!1418957))

(assert (= (and d!152933 c!131695) b!1418963))

(assert (= (and d!152933 (not c!131695)) b!1418958))

(assert (= (and b!1418958 res!954533) b!1418961))

(assert (= (and b!1418961 (not res!954535)) b!1418962))

(assert (= (and b!1418962 (not res!954534)) b!1418956))

(declare-fun m!1309531 () Bool)

(assert (=> b!1418961 m!1309531))

(assert (=> b!1418962 m!1309531))

(assert (=> b!1418957 m!1309465))

(declare-fun m!1309533 () Bool)

(assert (=> b!1418957 m!1309533))

(assert (=> b!1418957 m!1309533))

(assert (=> b!1418957 m!1309463))

(declare-fun m!1309535 () Bool)

(assert (=> b!1418957 m!1309535))

(assert (=> d!152933 m!1309465))

(declare-fun m!1309537 () Bool)

(assert (=> d!152933 m!1309537))

(assert (=> d!152933 m!1309473))

(assert (=> b!1418956 m!1309531))

(assert (=> b!1418868 d!152933))

(declare-fun d!152945 () Bool)

(declare-fun lt!625680 () (_ BitVec 32))

(declare-fun lt!625679 () (_ BitVec 32))

(assert (=> d!152945 (= lt!625680 (bvmul (bvxor lt!625679 (bvlshr lt!625679 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152945 (= lt!625679 ((_ extract 31 0) (bvand (bvxor (select (arr!46767 a!2831) j!81) (bvlshr (select (arr!46767 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152945 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!954536 (let ((h!34571 ((_ extract 31 0) (bvand (bvxor (select (arr!46767 a!2831) j!81) (bvlshr (select (arr!46767 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!128269 (bvmul (bvxor h!34571 (bvlshr h!34571 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!128269 (bvlshr x!128269 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!954536 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!954536 #b00000000000000000000000000000000))))))

(assert (=> d!152945 (= (toIndex!0 (select (arr!46767 a!2831) j!81) mask!2608) (bvand (bvxor lt!625680 (bvlshr lt!625680 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1418868 d!152945))

(declare-fun d!152955 () Bool)

(assert (=> d!152955 (= (validKeyInArray!0 (select (arr!46767 a!2831) j!81)) (and (not (= (select (arr!46767 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46767 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1418867 d!152955))

(declare-fun b!1418985 () Bool)

(declare-fun e!802925 () Bool)

(declare-fun call!67300 () Bool)

(assert (=> b!1418985 (= e!802925 call!67300)))

(declare-fun b!1418986 () Bool)

(declare-fun e!802924 () Bool)

(assert (=> b!1418986 (= e!802924 e!802925)))

(declare-fun c!131703 () Bool)

(assert (=> b!1418986 (= c!131703 (validKeyInArray!0 (select (arr!46767 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67297 () Bool)

(assert (=> bm!67297 (= call!67300 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1418987 () Bool)

(declare-fun e!802923 () Bool)

(assert (=> b!1418987 (= e!802923 call!67300)))

(declare-fun b!1418988 () Bool)

(assert (=> b!1418988 (= e!802925 e!802923)))

(declare-fun lt!625698 () (_ BitVec 64))

(assert (=> b!1418988 (= lt!625698 (select (arr!46767 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48072 0))(
  ( (Unit!48073) )
))
(declare-fun lt!625696 () Unit!48072)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96893 (_ BitVec 64) (_ BitVec 32)) Unit!48072)

(assert (=> b!1418988 (= lt!625696 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!625698 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1418988 (arrayContainsKey!0 a!2831 lt!625698 #b00000000000000000000000000000000)))

(declare-fun lt!625697 () Unit!48072)

(assert (=> b!1418988 (= lt!625697 lt!625696)))

(declare-fun res!954547 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96893 (_ BitVec 32)) SeekEntryResult!11052)

(assert (=> b!1418988 (= res!954547 (= (seekEntryOrOpen!0 (select (arr!46767 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11052 #b00000000000000000000000000000000)))))

(assert (=> b!1418988 (=> (not res!954547) (not e!802923))))

(declare-fun d!152957 () Bool)

(declare-fun res!954548 () Bool)

(assert (=> d!152957 (=> res!954548 e!802924)))

(assert (=> d!152957 (= res!954548 (bvsge #b00000000000000000000000000000000 (size!47317 a!2831)))))

(assert (=> d!152957 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!802924)))

(assert (= (and d!152957 (not res!954548)) b!1418986))

(assert (= (and b!1418986 c!131703) b!1418988))

(assert (= (and b!1418986 (not c!131703)) b!1418985))

(assert (= (and b!1418988 res!954547) b!1418987))

(assert (= (or b!1418987 b!1418985) bm!67297))

(assert (=> b!1418986 m!1309503))

(assert (=> b!1418986 m!1309503))

(assert (=> b!1418986 m!1309505))

(declare-fun m!1309547 () Bool)

(assert (=> bm!67297 m!1309547))

(assert (=> b!1418988 m!1309503))

(declare-fun m!1309549 () Bool)

(assert (=> b!1418988 m!1309549))

(declare-fun m!1309551 () Bool)

(assert (=> b!1418988 m!1309551))

(assert (=> b!1418988 m!1309503))

(declare-fun m!1309553 () Bool)

(assert (=> b!1418988 m!1309553))

(assert (=> b!1418866 d!152957))

(declare-fun d!152961 () Bool)

(assert (=> d!152961 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122450 d!152961))

(declare-fun d!152965 () Bool)

(assert (=> d!152965 (= (array_inv!35795 a!2831) (bvsge (size!47317 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122450 d!152965))

(check-sat (not b!1418957) (not bm!67285) (not b!1418907) (not b!1418910) (not b!1418988) (not b!1418986) (not b!1418909) (not d!152933) (not bm!67297))
(check-sat)
