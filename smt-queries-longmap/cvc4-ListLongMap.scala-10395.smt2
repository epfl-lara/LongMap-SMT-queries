; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122452 () Bool)

(assert start!122452)

(declare-fun b!1418888 () Bool)

(declare-fun res!954501 () Bool)

(declare-fun e!802858 () Bool)

(assert (=> b!1418888 (=> (not res!954501) (not e!802858))))

(declare-datatypes ((array!96895 0))(
  ( (array!96896 (arr!46768 (Array (_ BitVec 32) (_ BitVec 64))) (size!47318 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96895)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418888 (= res!954501 (validKeyInArray!0 (select (arr!46768 a!2831) j!81)))))

(declare-fun b!1418889 () Bool)

(declare-fun res!954497 () Bool)

(assert (=> b!1418889 (=> (not res!954497) (not e!802858))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96895 (_ BitVec 32)) Bool)

(assert (=> b!1418889 (= res!954497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!954500 () Bool)

(assert (=> start!122452 (=> (not res!954500) (not e!802858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122452 (= res!954500 (validMask!0 mask!2608))))

(assert (=> start!122452 e!802858))

(assert (=> start!122452 true))

(declare-fun array_inv!35796 (array!96895) Bool)

(assert (=> start!122452 (array_inv!35796 a!2831)))

(declare-fun b!1418890 () Bool)

(declare-fun res!954502 () Bool)

(assert (=> b!1418890 (=> (not res!954502) (not e!802858))))

(declare-datatypes ((List!33278 0))(
  ( (Nil!33275) (Cons!33274 (h!34570 (_ BitVec 64)) (t!47972 List!33278)) )
))
(declare-fun arrayNoDuplicates!0 (array!96895 (_ BitVec 32) List!33278) Bool)

(assert (=> b!1418890 (= res!954502 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33275))))

(declare-fun b!1418891 () Bool)

(declare-fun res!954499 () Bool)

(assert (=> b!1418891 (=> (not res!954499) (not e!802858))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1418891 (= res!954499 (and (= (size!47318 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47318 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47318 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1418892 () Bool)

(declare-fun res!954495 () Bool)

(assert (=> b!1418892 (=> (not res!954495) (not e!802858))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1418892 (= res!954495 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47318 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47318 a!2831))))))

(declare-fun b!1418893 () Bool)

(declare-fun res!954498 () Bool)

(assert (=> b!1418893 (=> (not res!954498) (not e!802858))))

(assert (=> b!1418893 (= res!954498 (validKeyInArray!0 (select (arr!46768 a!2831) i!982)))))

(declare-fun b!1418894 () Bool)

(declare-fun res!954496 () Bool)

(assert (=> b!1418894 (=> (not res!954496) (not e!802858))))

(declare-datatypes ((SeekEntryResult!11053 0))(
  ( (MissingZero!11053 (index!46604 (_ BitVec 32))) (Found!11053 (index!46605 (_ BitVec 32))) (Intermediate!11053 (undefined!11865 Bool) (index!46606 (_ BitVec 32)) (x!128267 (_ BitVec 32))) (Undefined!11053) (MissingVacant!11053 (index!46607 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96895 (_ BitVec 32)) SeekEntryResult!11053)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1418894 (= res!954496 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46768 a!2831) j!81) mask!2608) (select (arr!46768 a!2831) j!81) a!2831 mask!2608) (Intermediate!11053 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1418895 () Bool)

(assert (=> b!1418895 (= e!802858 (and (bvsge mask!2608 #b00000000000000000000000000000000) (bvsgt mask!2608 #b00111111111111111111111111111111)))))

(assert (= (and start!122452 res!954500) b!1418891))

(assert (= (and b!1418891 res!954499) b!1418893))

(assert (= (and b!1418893 res!954498) b!1418888))

(assert (= (and b!1418888 res!954501) b!1418889))

(assert (= (and b!1418889 res!954497) b!1418890))

(assert (= (and b!1418890 res!954502) b!1418892))

(assert (= (and b!1418892 res!954495) b!1418894))

(assert (= (and b!1418894 res!954496) b!1418895))

(declare-fun m!1309483 () Bool)

(assert (=> b!1418888 m!1309483))

(assert (=> b!1418888 m!1309483))

(declare-fun m!1309485 () Bool)

(assert (=> b!1418888 m!1309485))

(declare-fun m!1309487 () Bool)

(assert (=> b!1418889 m!1309487))

(declare-fun m!1309489 () Bool)

(assert (=> b!1418890 m!1309489))

(declare-fun m!1309491 () Bool)

(assert (=> b!1418893 m!1309491))

(assert (=> b!1418893 m!1309491))

(declare-fun m!1309493 () Bool)

(assert (=> b!1418893 m!1309493))

(declare-fun m!1309495 () Bool)

(assert (=> start!122452 m!1309495))

(declare-fun m!1309497 () Bool)

(assert (=> start!122452 m!1309497))

(assert (=> b!1418894 m!1309483))

(assert (=> b!1418894 m!1309483))

(declare-fun m!1309499 () Bool)

(assert (=> b!1418894 m!1309499))

(assert (=> b!1418894 m!1309499))

(assert (=> b!1418894 m!1309483))

(declare-fun m!1309501 () Bool)

(assert (=> b!1418894 m!1309501))

(push 1)

(assert (not b!1418888))

(assert (not b!1418893))

(assert (not b!1418890))

(assert (not b!1418889))

(assert (not start!122452))

(assert (not b!1418894))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1418929 () Bool)

(declare-fun e!802886 () Bool)

(declare-fun e!802889 () Bool)

(assert (=> b!1418929 (= e!802886 e!802889)))

(declare-fun res!954522 () Bool)

(assert (=> b!1418929 (=> (not res!954522) (not e!802889))))

(declare-fun e!802887 () Bool)

(assert (=> b!1418929 (= res!954522 (not e!802887))))

(declare-fun res!954523 () Bool)

(assert (=> b!1418929 (=> (not res!954523) (not e!802887))))

(assert (=> b!1418929 (= res!954523 (validKeyInArray!0 (select (arr!46768 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!152939 () Bool)

(declare-fun res!954524 () Bool)

(assert (=> d!152939 (=> res!954524 e!802886)))

(assert (=> d!152939 (= res!954524 (bvsge #b00000000000000000000000000000000 (size!47318 a!2831)))))

(assert (=> d!152939 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33275) e!802886)))

(declare-fun b!1418930 () Bool)

(declare-fun e!802888 () Bool)

(declare-fun call!67293 () Bool)

(assert (=> b!1418930 (= e!802888 call!67293)))

(declare-fun b!1418931 () Bool)

(assert (=> b!1418931 (= e!802888 call!67293)))

(declare-fun b!1418932 () Bool)

(declare-fun contains!9842 (List!33278 (_ BitVec 64)) Bool)

(assert (=> b!1418932 (= e!802887 (contains!9842 Nil!33275 (select (arr!46768 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67290 () Bool)

(declare-fun c!131687 () Bool)

(assert (=> bm!67290 (= call!67293 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131687 (Cons!33274 (select (arr!46768 a!2831) #b00000000000000000000000000000000) Nil!33275) Nil!33275)))))

(declare-fun b!1418933 () Bool)

(assert (=> b!1418933 (= e!802889 e!802888)))

(assert (=> b!1418933 (= c!131687 (validKeyInArray!0 (select (arr!46768 a!2831) #b00000000000000000000000000000000)))))

(assert (= (and d!152939 (not res!954524)) b!1418929))

(assert (= (and b!1418929 res!954523) b!1418932))

(assert (= (and b!1418929 res!954522) b!1418933))

(assert (= (and b!1418933 c!131687) b!1418931))

(assert (= (and b!1418933 (not c!131687)) b!1418930))

(assert (= (or b!1418931 b!1418930) bm!67290))

(declare-fun m!1309511 () Bool)

(assert (=> b!1418929 m!1309511))

(assert (=> b!1418929 m!1309511))

(declare-fun m!1309513 () Bool)

(assert (=> b!1418929 m!1309513))

(assert (=> b!1418932 m!1309511))

(assert (=> b!1418932 m!1309511))

(declare-fun m!1309515 () Bool)

(assert (=> b!1418932 m!1309515))

(assert (=> bm!67290 m!1309511))

(declare-fun m!1309517 () Bool)

(assert (=> bm!67290 m!1309517))

(assert (=> b!1418933 m!1309511))

(assert (=> b!1418933 m!1309511))

(assert (=> b!1418933 m!1309513))

(assert (=> b!1418890 d!152939))

(declare-fun d!152941 () Bool)

(assert (=> d!152941 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122452 d!152941))

(declare-fun d!152947 () Bool)

(assert (=> d!152947 (= (array_inv!35796 a!2831) (bvsge (size!47318 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122452 d!152947))

(declare-fun b!1418973 () Bool)

(declare-fun e!802916 () Bool)

(declare-fun call!67297 () Bool)

(assert (=> b!1418973 (= e!802916 call!67297)))

(declare-fun b!1418974 () Bool)

(declare-fun e!802914 () Bool)

(assert (=> b!1418974 (= e!802914 e!802916)))

(declare-fun c!131700 () Bool)

(assert (=> b!1418974 (= c!131700 (validKeyInArray!0 (select (arr!46768 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!152949 () Bool)

(declare-fun res!954541 () Bool)

(assert (=> d!152949 (=> res!954541 e!802914)))

(assert (=> d!152949 (= res!954541 (bvsge #b00000000000000000000000000000000 (size!47318 a!2831)))))

(assert (=> d!152949 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!802914)))

(declare-fun b!1418975 () Bool)

(declare-fun e!802915 () Bool)

(assert (=> b!1418975 (= e!802916 e!802915)))

(declare-fun lt!625689 () (_ BitVec 64))

(assert (=> b!1418975 (= lt!625689 (select (arr!46768 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48074 0))(
  ( (Unit!48075) )
))
(declare-fun lt!625687 () Unit!48074)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96895 (_ BitVec 64) (_ BitVec 32)) Unit!48074)

(assert (=> b!1418975 (= lt!625687 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!625689 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96895 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1418975 (arrayContainsKey!0 a!2831 lt!625689 #b00000000000000000000000000000000)))

(declare-fun lt!625688 () Unit!48074)

(assert (=> b!1418975 (= lt!625688 lt!625687)))

(declare-fun res!954542 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96895 (_ BitVec 32)) SeekEntryResult!11053)

(assert (=> b!1418975 (= res!954542 (= (seekEntryOrOpen!0 (select (arr!46768 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11053 #b00000000000000000000000000000000)))))

(assert (=> b!1418975 (=> (not res!954542) (not e!802915))))

(declare-fun b!1418976 () Bool)

(assert (=> b!1418976 (= e!802915 call!67297)))

(declare-fun bm!67294 () Bool)

(assert (=> bm!67294 (= call!67297 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(assert (= (and d!152949 (not res!954541)) b!1418974))

(assert (= (and b!1418974 c!131700) b!1418975))

(assert (= (and b!1418974 (not c!131700)) b!1418973))

(assert (= (and b!1418975 res!954542) b!1418976))

(assert (= (or b!1418976 b!1418973) bm!67294))

(assert (=> b!1418974 m!1309511))

(assert (=> b!1418974 m!1309511))

(assert (=> b!1418974 m!1309513))

(assert (=> b!1418975 m!1309511))

(declare-fun m!1309539 () Bool)

(assert (=> b!1418975 m!1309539))

(declare-fun m!1309541 () Bool)

(assert (=> b!1418975 m!1309541))

(assert (=> b!1418975 m!1309511))

(declare-fun m!1309543 () Bool)

(assert (=> b!1418975 m!1309543))

(declare-fun m!1309545 () Bool)

(assert (=> bm!67294 m!1309545))

(assert (=> b!1418889 d!152949))

(declare-fun b!1419034 () Bool)

(declare-fun e!802954 () SeekEntryResult!11053)

(assert (=> b!1419034 (= e!802954 (Intermediate!11053 true (toIndex!0 (select (arr!46768 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1419035 () Bool)

(declare-fun lt!625715 () SeekEntryResult!11053)

(assert (=> b!1419035 (and (bvsge (index!46606 lt!625715) #b00000000000000000000000000000000) (bvslt (index!46606 lt!625715) (size!47318 a!2831)))))

(declare-fun e!802955 () Bool)

(assert (=> b!1419035 (= e!802955 (= (select (arr!46768 a!2831) (index!46606 lt!625715)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1419037 () Bool)

(assert (=> b!1419037 (and (bvsge (index!46606 lt!625715) #b00000000000000000000000000000000) (bvslt (index!46606 lt!625715) (size!47318 a!2831)))))

(declare-fun res!954566 () Bool)

(assert (=> b!1419037 (= res!954566 (= (select (arr!46768 a!2831) (index!46606 lt!625715)) (select (arr!46768 a!2831) j!81)))))

(assert (=> b!1419037 (=> res!954566 e!802955)))

(declare-fun e!802953 () Bool)

(assert (=> b!1419037 (= e!802953 e!802955)))

(declare-fun b!1419038 () Bool)

(assert (=> b!1419038 (and (bvsge (index!46606 lt!625715) #b00000000000000000000000000000000) (bvslt (index!46606 lt!625715) (size!47318 a!2831)))))

(declare-fun res!954567 () Bool)

(assert (=> b!1419038 (= res!954567 (= (select (arr!46768 a!2831) (index!46606 lt!625715)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1419038 (=> res!954567 e!802955)))

(declare-fun b!1419039 () Bool)

(declare-fun e!802952 () SeekEntryResult!11053)

(assert (=> b!1419039 (= e!802952 (Intermediate!11053 false (toIndex!0 (select (arr!46768 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1419040 () Bool)

(declare-fun e!802951 () Bool)

(assert (=> b!1419040 (= e!802951 (bvsge (x!128267 lt!625715) #b01111111111111111111111111111110))))

(declare-fun b!1419041 () Bool)

(assert (=> b!1419041 (= e!802951 e!802953)))

(declare-fun res!954565 () Bool)

(assert (=> b!1419041 (= res!954565 (and (is-Intermediate!11053 lt!625715) (not (undefined!11865 lt!625715)) (bvslt (x!128267 lt!625715) #b01111111111111111111111111111110) (bvsge (x!128267 lt!625715) #b00000000000000000000000000000000) (bvsge (x!128267 lt!625715) #b00000000000000000000000000000000)))))

(assert (=> b!1419041 (=> (not res!954565) (not e!802953))))

(declare-fun b!1419042 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419042 (= e!802952 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46768 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!46768 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1419036 () Bool)

(assert (=> b!1419036 (= e!802954 e!802952)))

(declare-fun lt!625716 () (_ BitVec 64))

(declare-fun c!131720 () Bool)

(assert (=> b!1419036 (= c!131720 (or (= lt!625716 (select (arr!46768 a!2831) j!81)) (= (bvadd lt!625716 lt!625716) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!152959 () Bool)

(assert (=> d!152959 e!802951))

(declare-fun c!131719 () Bool)

(assert (=> d!152959 (= c!131719 (and (is-Intermediate!11053 lt!625715) (undefined!11865 lt!625715)))))

(assert (=> d!152959 (= lt!625715 e!802954)))

(declare-fun c!131721 () Bool)

(assert (=> d!152959 (= c!131721 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152959 (= lt!625716 (select (arr!46768 a!2831) (toIndex!0 (select (arr!46768 a!2831) j!81) mask!2608)))))

(assert (=> d!152959 (validMask!0 mask!2608)))

(assert (=> d!152959 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46768 a!2831) j!81) mask!2608) (select (arr!46768 a!2831) j!81) a!2831 mask!2608) lt!625715)))

(assert (= (and d!152959 c!131721) b!1419034))

(assert (= (and d!152959 (not c!131721)) b!1419036))

(assert (= (and b!1419036 c!131720) b!1419039))

