; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121296 () Bool)

(assert start!121296)

(declare-fun b!1410005 () Bool)

(declare-fun e!797912 () Bool)

(declare-fun e!797910 () Bool)

(assert (=> b!1410005 (= e!797912 (not e!797910))))

(declare-fun res!947567 () Bool)

(assert (=> b!1410005 (=> res!947567 e!797910)))

(declare-datatypes ((SeekEntryResult!10852 0))(
  ( (MissingZero!10852 (index!45785 (_ BitVec 32))) (Found!10852 (index!45786 (_ BitVec 32))) (Intermediate!10852 (undefined!11664 Bool) (index!45787 (_ BitVec 32)) (x!127379 (_ BitVec 32))) (Undefined!10852) (MissingVacant!10852 (index!45788 (_ BitVec 32))) )
))
(declare-fun lt!620961 () SeekEntryResult!10852)

(assert (=> b!1410005 (= res!947567 (or (not (is-Intermediate!10852 lt!620961)) (undefined!11664 lt!620961)))))

(declare-fun e!797909 () Bool)

(assert (=> b!1410005 e!797909))

(declare-fun res!947562 () Bool)

(assert (=> b!1410005 (=> (not res!947562) (not e!797909))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96399 0))(
  ( (array!96400 (arr!46541 (Array (_ BitVec 32) (_ BitVec 64))) (size!47091 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96399)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96399 (_ BitVec 32)) Bool)

(assert (=> b!1410005 (= res!947562 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47678 0))(
  ( (Unit!47679) )
))
(declare-fun lt!620963 () Unit!47678)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96399 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47678)

(assert (=> b!1410005 (= lt!620963 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!620964 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96399 (_ BitVec 32)) SeekEntryResult!10852)

(assert (=> b!1410005 (= lt!620961 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620964 (select (arr!46541 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410005 (= lt!620964 (toIndex!0 (select (arr!46541 a!2901) j!112) mask!2840))))

(declare-fun b!1410006 () Bool)

(declare-fun res!947565 () Bool)

(assert (=> b!1410006 (=> (not res!947565) (not e!797912))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410006 (= res!947565 (validKeyInArray!0 (select (arr!46541 a!2901) i!1037)))))

(declare-fun b!1410007 () Bool)

(declare-fun res!947569 () Bool)

(assert (=> b!1410007 (=> (not res!947569) (not e!797912))))

(assert (=> b!1410007 (= res!947569 (and (= (size!47091 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47091 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47091 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!947566 () Bool)

(assert (=> start!121296 (=> (not res!947566) (not e!797912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121296 (= res!947566 (validMask!0 mask!2840))))

(assert (=> start!121296 e!797912))

(assert (=> start!121296 true))

(declare-fun array_inv!35569 (array!96399) Bool)

(assert (=> start!121296 (array_inv!35569 a!2901)))

(declare-fun b!1410008 () Bool)

(declare-fun res!947563 () Bool)

(assert (=> b!1410008 (=> (not res!947563) (not e!797912))))

(declare-datatypes ((List!33060 0))(
  ( (Nil!33057) (Cons!33056 (h!34322 (_ BitVec 64)) (t!47754 List!33060)) )
))
(declare-fun arrayNoDuplicates!0 (array!96399 (_ BitVec 32) List!33060) Bool)

(assert (=> b!1410008 (= res!947563 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33057))))

(declare-fun b!1410009 () Bool)

(declare-fun res!947568 () Bool)

(assert (=> b!1410009 (=> (not res!947568) (not e!797912))))

(assert (=> b!1410009 (= res!947568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410010 () Bool)

(declare-fun res!947564 () Bool)

(assert (=> b!1410010 (=> (not res!947564) (not e!797912))))

(assert (=> b!1410010 (= res!947564 (validKeyInArray!0 (select (arr!46541 a!2901) j!112)))))

(declare-fun lt!620962 () SeekEntryResult!10852)

(declare-fun b!1410011 () Bool)

(assert (=> b!1410011 (= e!797910 (or (= lt!620961 lt!620962) (not (is-Intermediate!10852 lt!620962)) (bvslt (x!127379 lt!620961) #b00000000000000000000000000000000) (bvsgt (x!127379 lt!620961) #b01111111111111111111111111111110) (and (bvsge lt!620964 #b00000000000000000000000000000000) (bvslt lt!620964 (size!47091 a!2901)))))))

(assert (=> b!1410011 (= lt!620962 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46541 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46541 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96400 (store (arr!46541 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47091 a!2901)) mask!2840))))

(declare-fun b!1410012 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96399 (_ BitVec 32)) SeekEntryResult!10852)

(assert (=> b!1410012 (= e!797909 (= (seekEntryOrOpen!0 (select (arr!46541 a!2901) j!112) a!2901 mask!2840) (Found!10852 j!112)))))

(assert (= (and start!121296 res!947566) b!1410007))

(assert (= (and b!1410007 res!947569) b!1410006))

(assert (= (and b!1410006 res!947565) b!1410010))

(assert (= (and b!1410010 res!947564) b!1410009))

(assert (= (and b!1410009 res!947568) b!1410008))

(assert (= (and b!1410008 res!947563) b!1410005))

(assert (= (and b!1410005 res!947562) b!1410012))

(assert (= (and b!1410005 (not res!947567)) b!1410011))

(declare-fun m!1299747 () Bool)

(assert (=> b!1410010 m!1299747))

(assert (=> b!1410010 m!1299747))

(declare-fun m!1299749 () Bool)

(assert (=> b!1410010 m!1299749))

(declare-fun m!1299751 () Bool)

(assert (=> b!1410008 m!1299751))

(declare-fun m!1299753 () Bool)

(assert (=> start!121296 m!1299753))

(declare-fun m!1299755 () Bool)

(assert (=> start!121296 m!1299755))

(assert (=> b!1410005 m!1299747))

(declare-fun m!1299757 () Bool)

(assert (=> b!1410005 m!1299757))

(assert (=> b!1410005 m!1299747))

(declare-fun m!1299759 () Bool)

(assert (=> b!1410005 m!1299759))

(assert (=> b!1410005 m!1299747))

(declare-fun m!1299761 () Bool)

(assert (=> b!1410005 m!1299761))

(declare-fun m!1299763 () Bool)

(assert (=> b!1410005 m!1299763))

(declare-fun m!1299765 () Bool)

(assert (=> b!1410006 m!1299765))

(assert (=> b!1410006 m!1299765))

(declare-fun m!1299767 () Bool)

(assert (=> b!1410006 m!1299767))

(assert (=> b!1410012 m!1299747))

(assert (=> b!1410012 m!1299747))

(declare-fun m!1299769 () Bool)

(assert (=> b!1410012 m!1299769))

(declare-fun m!1299771 () Bool)

(assert (=> b!1410011 m!1299771))

(declare-fun m!1299773 () Bool)

(assert (=> b!1410011 m!1299773))

(assert (=> b!1410011 m!1299773))

(declare-fun m!1299775 () Bool)

(assert (=> b!1410011 m!1299775))

(assert (=> b!1410011 m!1299775))

(assert (=> b!1410011 m!1299773))

(declare-fun m!1299777 () Bool)

(assert (=> b!1410011 m!1299777))

(declare-fun m!1299779 () Bool)

(assert (=> b!1410009 m!1299779))

(push 1)

(assert (not b!1410012))

(assert (not b!1410010))

(assert (not b!1410006))

(assert (not b!1410011))

(assert (not b!1410009))

(assert (not b!1410005))

(assert (not b!1410008))

(assert (not start!121296))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!151811 () Bool)

(assert (=> d!151811 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121296 d!151811))

(declare-fun d!151819 () Bool)

(assert (=> d!151819 (= (array_inv!35569 a!2901) (bvsge (size!47091 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121296 d!151819))

(declare-fun bm!67036 () Bool)

(declare-fun call!67039 () Bool)

(assert (=> bm!67036 (= call!67039 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1410120 () Bool)

(declare-fun e!797974 () Bool)

(declare-fun e!797973 () Bool)

(assert (=> b!1410120 (= e!797974 e!797973)))

(declare-fun lt!621024 () (_ BitVec 64))

(assert (=> b!1410120 (= lt!621024 (select (arr!46541 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!621022 () Unit!47678)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96399 (_ BitVec 64) (_ BitVec 32)) Unit!47678)

(assert (=> b!1410120 (= lt!621022 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!621024 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96399 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1410120 (arrayContainsKey!0 a!2901 lt!621024 #b00000000000000000000000000000000)))

(declare-fun lt!621023 () Unit!47678)

(assert (=> b!1410120 (= lt!621023 lt!621022)))

(declare-fun res!947639 () Bool)

(assert (=> b!1410120 (= res!947639 (= (seekEntryOrOpen!0 (select (arr!46541 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10852 #b00000000000000000000000000000000)))))

(assert (=> b!1410120 (=> (not res!947639) (not e!797973))))

(declare-fun d!151823 () Bool)

(declare-fun res!947638 () Bool)

(declare-fun e!797975 () Bool)

(assert (=> d!151823 (=> res!947638 e!797975)))

(assert (=> d!151823 (= res!947638 (bvsge #b00000000000000000000000000000000 (size!47091 a!2901)))))

(assert (=> d!151823 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!797975)))

(declare-fun b!1410121 () Bool)

(assert (=> b!1410121 (= e!797975 e!797974)))

(declare-fun c!130710 () Bool)

(assert (=> b!1410121 (= c!130710 (validKeyInArray!0 (select (arr!46541 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1410122 () Bool)

(assert (=> b!1410122 (= e!797973 call!67039)))

(declare-fun b!1410123 () Bool)

(assert (=> b!1410123 (= e!797974 call!67039)))

(assert (= (and d!151823 (not res!947638)) b!1410121))

(assert (= (and b!1410121 c!130710) b!1410120))

(assert (= (and b!1410121 (not c!130710)) b!1410123))

(assert (= (and b!1410120 res!947639) b!1410122))

(assert (= (or b!1410122 b!1410123) bm!67036))

(declare-fun m!1299869 () Bool)

(assert (=> bm!67036 m!1299869))

(declare-fun m!1299871 () Bool)

(assert (=> b!1410120 m!1299871))

(declare-fun m!1299873 () Bool)

(assert (=> b!1410120 m!1299873))

(declare-fun m!1299875 () Bool)

(assert (=> b!1410120 m!1299875))

(assert (=> b!1410120 m!1299871))

(declare-fun m!1299877 () Bool)

(assert (=> b!1410120 m!1299877))

(assert (=> b!1410121 m!1299871))

(assert (=> b!1410121 m!1299871))

(declare-fun m!1299879 () Bool)

(assert (=> b!1410121 m!1299879))

(assert (=> b!1410009 d!151823))

(declare-fun b!1410178 () Bool)

(declare-fun e!798008 () SeekEntryResult!10852)

(declare-fun e!798011 () SeekEntryResult!10852)

(assert (=> b!1410178 (= e!798008 e!798011)))

(declare-fun c!130734 () Bool)

(declare-fun lt!621051 () (_ BitVec 64))

(assert (=> b!1410178 (= c!130734 (or (= lt!621051 (select (store (arr!46541 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!621051 lt!621051) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1410180 () Bool)

(assert (=> b!1410180 (= e!798011 (Intermediate!10852 false (toIndex!0 (select (store (arr!46541 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1410181 () Bool)

(declare-fun lt!621050 () SeekEntryResult!10852)

(assert (=> b!1410181 (and (bvsge (index!45787 lt!621050) #b00000000000000000000000000000000) (bvslt (index!45787 lt!621050) (size!47091 (array!96400 (store (arr!46541 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47091 a!2901)))))))

(declare-fun res!947654 () Bool)

(assert (=> b!1410181 (= res!947654 (= (select (arr!46541 (array!96400 (store (arr!46541 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47091 a!2901))) (index!45787 lt!621050)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!798009 () Bool)

(assert (=> b!1410181 (=> res!947654 e!798009)))

(declare-fun b!1410182 () Bool)

(assert (=> b!1410182 (= e!798008 (Intermediate!10852 true (toIndex!0 (select (store (arr!46541 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1410183 () Bool)

(assert (=> b!1410183 (and (bvsge (index!45787 lt!621050) #b00000000000000000000000000000000) (bvslt (index!45787 lt!621050) (size!47091 (array!96400 (store (arr!46541 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47091 a!2901)))))))

(declare-fun res!947653 () Bool)

(assert (=> b!1410183 (= res!947653 (= (select (arr!46541 (array!96400 (store (arr!46541 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47091 a!2901))) (index!45787 lt!621050)) (select (store (arr!46541 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1410183 (=> res!947653 e!798009)))

(declare-fun e!798007 () Bool)

(assert (=> b!1410183 (= e!798007 e!798009)))

(declare-fun b!1410184 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410184 (= e!798011 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46541 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46541 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96400 (store (arr!46541 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47091 a!2901)) mask!2840))))

(declare-fun b!1410179 () Bool)

(assert (=> b!1410179 (and (bvsge (index!45787 lt!621050) #b00000000000000000000000000000000) (bvslt (index!45787 lt!621050) (size!47091 (array!96400 (store (arr!46541 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47091 a!2901)))))))

(assert (=> b!1410179 (= e!798009 (= (select (arr!46541 (array!96400 (store (arr!46541 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47091 a!2901))) (index!45787 lt!621050)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!151827 () Bool)

(declare-fun e!798010 () Bool)

(assert (=> d!151827 e!798010))

(declare-fun c!130732 () Bool)

(assert (=> d!151827 (= c!130732 (and (is-Intermediate!10852 lt!621050) (undefined!11664 lt!621050)))))

(assert (=> d!151827 (= lt!621050 e!798008)))

(declare-fun c!130733 () Bool)

(assert (=> d!151827 (= c!130733 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151827 (= lt!621051 (select (arr!46541 (array!96400 (store (arr!46541 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47091 a!2901))) (toIndex!0 (select (store (arr!46541 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!151827 (validMask!0 mask!2840)))

(assert (=> d!151827 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46541 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46541 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96400 (store (arr!46541 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47091 a!2901)) mask!2840) lt!621050)))

(declare-fun b!1410185 () Bool)

(assert (=> b!1410185 (= e!798010 e!798007)))

(declare-fun res!947652 () Bool)

(assert (=> b!1410185 (= res!947652 (and (is-Intermediate!10852 lt!621050) (not (undefined!11664 lt!621050)) (bvslt (x!127379 lt!621050) #b01111111111111111111111111111110) (bvsge (x!127379 lt!621050) #b00000000000000000000000000000000) (bvsge (x!127379 lt!621050) #b00000000000000000000000000000000)))))

(assert (=> b!1410185 (=> (not res!947652) (not e!798007))))

(declare-fun b!1410186 () Bool)

(assert (=> b!1410186 (= e!798010 (bvsge (x!127379 lt!621050) #b01111111111111111111111111111110))))

(assert (= (and d!151827 c!130733) b!1410182))

(assert (= (and d!151827 (not c!130733)) b!1410178))

(assert (= (and b!1410178 c!130734) b!1410180))

(assert (= (and b!1410178 (not c!130734)) b!1410184))

(assert (= (and d!151827 c!130732) b!1410186))

(assert (= (and d!151827 (not c!130732)) b!1410185))

(assert (= (and b!1410185 res!947652) b!1410183))

(assert (= (and b!1410183 (not res!947653)) b!1410181))

(assert (= (and b!1410181 (not res!947654)) b!1410179))

(declare-fun m!1299911 () Bool)

(assert (=> b!1410179 m!1299911))

(assert (=> b!1410183 m!1299911))

(assert (=> b!1410181 m!1299911))

(assert (=> d!151827 m!1299775))

(declare-fun m!1299913 () Bool)

(assert (=> d!151827 m!1299913))

(assert (=> d!151827 m!1299753))

(assert (=> b!1410184 m!1299775))

(declare-fun m!1299915 () Bool)

(assert (=> b!1410184 m!1299915))

(assert (=> b!1410184 m!1299915))

(assert (=> b!1410184 m!1299773))

(declare-fun m!1299919 () Bool)

(assert (=> b!1410184 m!1299919))

(assert (=> b!1410011 d!151827))

(declare-fun d!151843 () Bool)

(declare-fun lt!621067 () (_ BitVec 32))

(declare-fun lt!621066 () (_ BitVec 32))

(assert (=> d!151843 (= lt!621067 (bvmul (bvxor lt!621066 (bvlshr lt!621066 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151843 (= lt!621066 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46541 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46541 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151843 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!947660 (let ((h!34326 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46541 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46541 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127385 (bvmul (bvxor h!34326 (bvlshr h!34326 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127385 (bvlshr x!127385 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!947660 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!947660 #b00000000000000000000000000000000))))))

(assert (=> d!151843 (= (toIndex!0 (select (store (arr!46541 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!621067 (bvlshr lt!621067 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1410011 d!151843))

(declare-fun d!151853 () Bool)

(assert (=> d!151853 (= (validKeyInArray!0 (select (arr!46541 a!2901) j!112)) (and (not (= (select (arr!46541 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46541 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1410010 d!151853))

(declare-fun bm!67043 () Bool)

(declare-fun call!67046 () Bool)

(assert (=> bm!67043 (= call!67046 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1410210 () Bool)

(declare-fun e!798029 () Bool)

(declare-fun e!798028 () Bool)

(assert (=> b!1410210 (= e!798029 e!798028)))

(declare-fun lt!621070 () (_ BitVec 64))

(assert (=> b!1410210 (= lt!621070 (select (arr!46541 a!2901) j!112))))

(declare-fun lt!621068 () Unit!47678)

(assert (=> b!1410210 (= lt!621068 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!621070 j!112))))

(assert (=> b!1410210 (arrayContainsKey!0 a!2901 lt!621070 #b00000000000000000000000000000000)))

(declare-fun lt!621069 () Unit!47678)

(assert (=> b!1410210 (= lt!621069 lt!621068)))

(declare-fun res!947668 () Bool)

(assert (=> b!1410210 (= res!947668 (= (seekEntryOrOpen!0 (select (arr!46541 a!2901) j!112) a!2901 mask!2840) (Found!10852 j!112)))))

(assert (=> b!1410210 (=> (not res!947668) (not e!798028))))

(declare-fun d!151855 () Bool)

(declare-fun res!947667 () Bool)

(declare-fun e!798030 () Bool)

(assert (=> d!151855 (=> res!947667 e!798030)))

(assert (=> d!151855 (= res!947667 (bvsge j!112 (size!47091 a!2901)))))

(assert (=> d!151855 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!798030)))

(declare-fun b!1410211 () Bool)

(assert (=> b!1410211 (= e!798030 e!798029)))

(declare-fun c!130741 () Bool)

(assert (=> b!1410211 (= c!130741 (validKeyInArray!0 (select (arr!46541 a!2901) j!112)))))

(declare-fun b!1410212 () Bool)

(assert (=> b!1410212 (= e!798028 call!67046)))

(declare-fun b!1410213 () Bool)

(assert (=> b!1410213 (= e!798029 call!67046)))

(assert (= (and d!151855 (not res!947667)) b!1410211))

(assert (= (and b!1410211 c!130741) b!1410210))

(assert (= (and b!1410211 (not c!130741)) b!1410213))

(assert (= (and b!1410210 res!947668) b!1410212))

(assert (= (or b!1410212 b!1410213) bm!67043))

(declare-fun m!1299941 () Bool)

(assert (=> bm!67043 m!1299941))

(assert (=> b!1410210 m!1299747))

(declare-fun m!1299943 () Bool)

(assert (=> b!1410210 m!1299943))

(declare-fun m!1299945 () Bool)

(assert (=> b!1410210 m!1299945))

(assert (=> b!1410210 m!1299747))

(assert (=> b!1410210 m!1299769))

(assert (=> b!1410211 m!1299747))

(assert (=> b!1410211 m!1299747))

(assert (=> b!1410211 m!1299749))

(assert (=> b!1410005 d!151855))

(declare-fun d!151857 () Bool)

(assert (=> d!151857 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!621076 () Unit!47678)

(declare-fun choose!38 (array!96399 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47678)

(assert (=> d!151857 (= lt!621076 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151857 (validMask!0 mask!2840)))

(assert (=> d!151857 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!621076)))

(declare-fun bs!41112 () Bool)

(assert (= bs!41112 d!151857))

(assert (=> bs!41112 m!1299763))

(declare-fun m!1299957 () Bool)

(assert (=> bs!41112 m!1299957))

(assert (=> bs!41112 m!1299753))

(assert (=> b!1410005 d!151857))

(declare-fun b!1410223 () Bool)

(declare-fun e!798039 () SeekEntryResult!10852)

(declare-fun e!798042 () SeekEntryResult!10852)

(assert (=> b!1410223 (= e!798039 e!798042)))

(declare-fun lt!621078 () (_ BitVec 64))

(declare-fun c!130746 () Bool)

(assert (=> b!1410223 (= c!130746 (or (= lt!621078 (select (arr!46541 a!2901) j!112)) (= (bvadd lt!621078 lt!621078) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1410225 () Bool)

(assert (=> b!1410225 (= e!798042 (Intermediate!10852 false lt!620964 #b00000000000000000000000000000000))))

(declare-fun b!1410226 () Bool)

(declare-fun lt!621077 () SeekEntryResult!10852)

(assert (=> b!1410226 (and (bvsge (index!45787 lt!621077) #b00000000000000000000000000000000) (bvslt (index!45787 lt!621077) (size!47091 a!2901)))))

(declare-fun res!947676 () Bool)

(assert (=> b!1410226 (= res!947676 (= (select (arr!46541 a!2901) (index!45787 lt!621077)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!798040 () Bool)

(assert (=> b!1410226 (=> res!947676 e!798040)))

(declare-fun b!1410227 () Bool)

(assert (=> b!1410227 (= e!798039 (Intermediate!10852 true lt!620964 #b00000000000000000000000000000000))))

(declare-fun b!1410228 () Bool)

(assert (=> b!1410228 (and (bvsge (index!45787 lt!621077) #b00000000000000000000000000000000) (bvslt (index!45787 lt!621077) (size!47091 a!2901)))))

(declare-fun res!947675 () Bool)

(assert (=> b!1410228 (= res!947675 (= (select (arr!46541 a!2901) (index!45787 lt!621077)) (select (arr!46541 a!2901) j!112)))))

(assert (=> b!1410228 (=> res!947675 e!798040)))

(declare-fun e!798038 () Bool)

(assert (=> b!1410228 (= e!798038 e!798040)))

(declare-fun b!1410229 () Bool)

(assert (=> b!1410229 (= e!798042 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!620964 #b00000000000000000000000000000000 mask!2840) (select (arr!46541 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1410224 () Bool)

(assert (=> b!1410224 (and (bvsge (index!45787 lt!621077) #b00000000000000000000000000000000) (bvslt (index!45787 lt!621077) (size!47091 a!2901)))))

(assert (=> b!1410224 (= e!798040 (= (select (arr!46541 a!2901) (index!45787 lt!621077)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!151863 () Bool)

(declare-fun e!798041 () Bool)

(assert (=> d!151863 e!798041))

(declare-fun c!130744 () Bool)

(assert (=> d!151863 (= c!130744 (and (is-Intermediate!10852 lt!621077) (undefined!11664 lt!621077)))))

(assert (=> d!151863 (= lt!621077 e!798039)))

(declare-fun c!130745 () Bool)

(assert (=> d!151863 (= c!130745 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151863 (= lt!621078 (select (arr!46541 a!2901) lt!620964))))

(assert (=> d!151863 (validMask!0 mask!2840)))

(assert (=> d!151863 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620964 (select (arr!46541 a!2901) j!112) a!2901 mask!2840) lt!621077)))

(declare-fun b!1410230 () Bool)

(assert (=> b!1410230 (= e!798041 e!798038)))

(declare-fun res!947674 () Bool)

(assert (=> b!1410230 (= res!947674 (and (is-Intermediate!10852 lt!621077) (not (undefined!11664 lt!621077)) (bvslt (x!127379 lt!621077) #b01111111111111111111111111111110) (bvsge (x!127379 lt!621077) #b00000000000000000000000000000000) (bvsge (x!127379 lt!621077) #b00000000000000000000000000000000)))))

(assert (=> b!1410230 (=> (not res!947674) (not e!798038))))

(declare-fun b!1410231 () Bool)

(assert (=> b!1410231 (= e!798041 (bvsge (x!127379 lt!621077) #b01111111111111111111111111111110))))

(assert (= (and d!151863 c!130745) b!1410227))

(assert (= (and d!151863 (not c!130745)) b!1410223))

(assert (= (and b!1410223 c!130746) b!1410225))

(assert (= (and b!1410223 (not c!130746)) b!1410229))

(assert (= (and d!151863 c!130744) b!1410231))

(assert (= (and d!151863 (not c!130744)) b!1410230))

(assert (= (and b!1410230 res!947674) b!1410228))

(assert (= (and b!1410228 (not res!947675)) b!1410226))

(assert (= (and b!1410226 (not res!947676)) b!1410224))

(declare-fun m!1299959 () Bool)

(assert (=> b!1410224 m!1299959))

(assert (=> b!1410228 m!1299959))

(assert (=> b!1410226 m!1299959))

(declare-fun m!1299961 () Bool)

(assert (=> d!151863 m!1299961))

(assert (=> d!151863 m!1299753))

(declare-fun m!1299963 () Bool)

(assert (=> b!1410229 m!1299963))

(assert (=> b!1410229 m!1299963))

(assert (=> b!1410229 m!1299747))

(declare-fun m!1299965 () Bool)

(assert (=> b!1410229 m!1299965))

(assert (=> b!1410005 d!151863))

(declare-fun d!151869 () Bool)

(declare-fun lt!621083 () (_ BitVec 32))

(declare-fun lt!621082 () (_ BitVec 32))

(assert (=> d!151869 (= lt!621083 (bvmul (bvxor lt!621082 (bvlshr lt!621082 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151869 (= lt!621082 ((_ extract 31 0) (bvand (bvxor (select (arr!46541 a!2901) j!112) (bvlshr (select (arr!46541 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151869 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!947660 (let ((h!34326 ((_ extract 31 0) (bvand (bvxor (select (arr!46541 a!2901) j!112) (bvlshr (select (arr!46541 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127385 (bvmul (bvxor h!34326 (bvlshr h!34326 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127385 (bvlshr x!127385 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!947660 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!947660 #b00000000000000000000000000000000))))))

(assert (=> d!151869 (= (toIndex!0 (select (arr!46541 a!2901) j!112) mask!2840) (bvand (bvxor lt!621083 (bvlshr lt!621083 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1410005 d!151869))

(declare-fun b!1410277 () Bool)

(declare-fun e!798073 () SeekEntryResult!10852)

(declare-fun e!798072 () SeekEntryResult!10852)

(assert (=> b!1410277 (= e!798073 e!798072)))

(declare-fun lt!621095 () (_ BitVec 64))

(declare-fun lt!621096 () SeekEntryResult!10852)

(assert (=> b!1410277 (= lt!621095 (select (arr!46541 a!2901) (index!45787 lt!621096)))))

(declare-fun c!130762 () Bool)

(assert (=> b!1410277 (= c!130762 (= lt!621095 (select (arr!46541 a!2901) j!112)))))

(declare-fun b!1410279 () Bool)

(assert (=> b!1410279 (= e!798072 (Found!10852 (index!45787 lt!621096)))))

(declare-fun b!1410280 () Bool)

(declare-fun e!798071 () SeekEntryResult!10852)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96399 (_ BitVec 32)) SeekEntryResult!10852)

(assert (=> b!1410280 (= e!798071 (seekKeyOrZeroReturnVacant!0 (x!127379 lt!621096) (index!45787 lt!621096) (index!45787 lt!621096) (select (arr!46541 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1410281 () Bool)

(assert (=> b!1410281 (= e!798073 Undefined!10852)))

(declare-fun b!1410282 () Bool)

(assert (=> b!1410282 (= e!798071 (MissingZero!10852 (index!45787 lt!621096)))))

(declare-fun b!1410278 () Bool)

(declare-fun c!130763 () Bool)

(assert (=> b!1410278 (= c!130763 (= lt!621095 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1410278 (= e!798072 e!798071)))

(declare-fun d!151873 () Bool)

(declare-fun lt!621094 () SeekEntryResult!10852)

(assert (=> d!151873 (and (or (is-Undefined!10852 lt!621094) (not (is-Found!10852 lt!621094)) (and (bvsge (index!45786 lt!621094) #b00000000000000000000000000000000) (bvslt (index!45786 lt!621094) (size!47091 a!2901)))) (or (is-Undefined!10852 lt!621094) (is-Found!10852 lt!621094) (not (is-MissingZero!10852 lt!621094)) (and (bvsge (index!45785 lt!621094) #b00000000000000000000000000000000) (bvslt (index!45785 lt!621094) (size!47091 a!2901)))) (or (is-Undefined!10852 lt!621094) (is-Found!10852 lt!621094) (is-MissingZero!10852 lt!621094) (not (is-MissingVacant!10852 lt!621094)) (and (bvsge (index!45788 lt!621094) #b00000000000000000000000000000000) (bvslt (index!45788 lt!621094) (size!47091 a!2901)))) (or (is-Undefined!10852 lt!621094) (ite (is-Found!10852 lt!621094) (= (select (arr!46541 a!2901) (index!45786 lt!621094)) (select (arr!46541 a!2901) j!112)) (ite (is-MissingZero!10852 lt!621094) (= (select (arr!46541 a!2901) (index!45785 lt!621094)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10852 lt!621094) (= (select (arr!46541 a!2901) (index!45788 lt!621094)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!151873 (= lt!621094 e!798073)))

(declare-fun c!130764 () Bool)

(assert (=> d!151873 (= c!130764 (and (is-Intermediate!10852 lt!621096) (undefined!11664 lt!621096)))))

(assert (=> d!151873 (= lt!621096 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46541 a!2901) j!112) mask!2840) (select (arr!46541 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151873 (validMask!0 mask!2840)))

(assert (=> d!151873 (= (seekEntryOrOpen!0 (select (arr!46541 a!2901) j!112) a!2901 mask!2840) lt!621094)))

(assert (= (and d!151873 c!130764) b!1410281))

(assert (= (and d!151873 (not c!130764)) b!1410277))

(assert (= (and b!1410277 c!130762) b!1410279))

(assert (= (and b!1410277 (not c!130762)) b!1410278))

(assert (= (and b!1410278 c!130763) b!1410282))

(assert (= (and b!1410278 (not c!130763)) b!1410280))

(declare-fun m!1299973 () Bool)

(assert (=> b!1410277 m!1299973))

(assert (=> b!1410280 m!1299747))

(declare-fun m!1299975 () Bool)

(assert (=> b!1410280 m!1299975))

(declare-fun m!1299977 () Bool)

(assert (=> d!151873 m!1299977))

(declare-fun m!1299979 () Bool)

(assert (=> d!151873 m!1299979))

(assert (=> d!151873 m!1299747))

(assert (=> d!151873 m!1299757))

(declare-fun m!1299981 () Bool)

(assert (=> d!151873 m!1299981))

(assert (=> d!151873 m!1299757))

(assert (=> d!151873 m!1299747))

(declare-fun m!1299983 () Bool)

(assert (=> d!151873 m!1299983))

(assert (=> d!151873 m!1299753))

(assert (=> b!1410012 d!151873))

(declare-fun d!151875 () Bool)

(assert (=> d!151875 (= (validKeyInArray!0 (select (arr!46541 a!2901) i!1037)) (and (not (= (select (arr!46541 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46541 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1410006 d!151875))

(declare-fun bm!67051 () Bool)

(declare-fun call!67054 () Bool)

(declare-fun c!130773 () Bool)

(assert (=> bm!67051 (= call!67054 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130773 (Cons!33056 (select (arr!46541 a!2901) #b00000000000000000000000000000000) Nil!33057) Nil!33057)))))

(declare-fun b!1410311 () Bool)

(declare-fun e!798093 () Bool)

(assert (=> b!1410311 (= e!798093 call!67054)))

(declare-fun b!1410312 () Bool)

(declare-fun e!798094 () Bool)

(assert (=> b!1410312 (= e!798094 e!798093)))

(assert (=> b!1410312 (= c!130773 (validKeyInArray!0 (select (arr!46541 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1410313 () Bool)

(assert (=> b!1410313 (= e!798093 call!67054)))

(declare-fun b!1410314 () Bool)

(declare-fun e!798095 () Bool)

(assert (=> b!1410314 (= e!798095 e!798094)))

(declare-fun res!947707 () Bool)

(assert (=> b!1410314 (=> (not res!947707) (not e!798094))))

(declare-fun e!798092 () Bool)

(assert (=> b!1410314 (= res!947707 (not e!798092))))

(declare-fun res!947705 () Bool)

(assert (=> b!1410314 (=> (not res!947705) (not e!798092))))

(assert (=> b!1410314 (= res!947705 (validKeyInArray!0 (select (arr!46541 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1410315 () Bool)

(declare-fun contains!9807 (List!33060 (_ BitVec 64)) Bool)

(assert (=> b!1410315 (= e!798092 (contains!9807 Nil!33057 (select (arr!46541 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!151877 () Bool)

(declare-fun res!947706 () Bool)

(assert (=> d!151877 (=> res!947706 e!798095)))

(assert (=> d!151877 (= res!947706 (bvsge #b00000000000000000000000000000000 (size!47091 a!2901)))))

(assert (=> d!151877 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33057) e!798095)))

(assert (= (and d!151877 (not res!947706)) b!1410314))

(assert (= (and b!1410314 res!947705) b!1410315))

(assert (= (and b!1410314 res!947707) b!1410312))

(assert (= (and b!1410312 c!130773) b!1410313))

(assert (= (and b!1410312 (not c!130773)) b!1410311))

(assert (= (or b!1410313 b!1410311) bm!67051))

(assert (=> bm!67051 m!1299871))

(declare-fun m!1300001 () Bool)

(assert (=> bm!67051 m!1300001))

(assert (=> b!1410312 m!1299871))

(assert (=> b!1410312 m!1299871))

(assert (=> b!1410312 m!1299879))

(assert (=> b!1410314 m!1299871))

(assert (=> b!1410314 m!1299871))

(assert (=> b!1410314 m!1299879))

(assert (=> b!1410315 m!1299871))

(assert (=> b!1410315 m!1299871))

(declare-fun m!1300003 () Bool)

(assert (=> b!1410315 m!1300003))

(assert (=> b!1410008 d!151877))

(push 1)

(assert (not b!1410314))

(assert (not bm!67051))

(assert (not b!1410315))

(assert (not b!1410210))

(assert (not d!151827))

(assert (not bm!67036))

(assert (not b!1410120))

(assert (not bm!67043))

(assert (not d!151857))

(assert (not d!151873))

(assert (not b!1410312))

(assert (not b!1410184))

(assert (not d!151863))

(assert (not b!1410121))

(assert (not b!1410280))

(assert (not b!1410229))

(assert (not b!1410211))

(check-sat)

