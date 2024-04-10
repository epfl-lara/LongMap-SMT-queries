; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121506 () Bool)

(assert start!121506)

(declare-fun b!1411877 () Bool)

(declare-fun res!949111 () Bool)

(declare-fun e!798967 () Bool)

(assert (=> b!1411877 (=> (not res!949111) (not e!798967))))

(declare-datatypes ((array!96507 0))(
  ( (array!96508 (arr!46592 (Array (_ BitVec 32) (_ BitVec 64))) (size!47142 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96507)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96507 (_ BitVec 32)) Bool)

(assert (=> b!1411877 (= res!949111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411878 () Bool)

(declare-fun res!949104 () Bool)

(assert (=> b!1411878 (=> (not res!949104) (not e!798967))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411878 (= res!949104 (validKeyInArray!0 (select (arr!46592 a!2901) i!1037)))))

(declare-fun b!1411879 () Bool)

(declare-fun res!949107 () Bool)

(assert (=> b!1411879 (=> (not res!949107) (not e!798967))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1411879 (= res!949107 (validKeyInArray!0 (select (arr!46592 a!2901) j!112)))))

(declare-fun b!1411880 () Bool)

(declare-fun res!949103 () Bool)

(assert (=> b!1411880 (=> (not res!949103) (not e!798967))))

(declare-datatypes ((List!33111 0))(
  ( (Nil!33108) (Cons!33107 (h!34379 (_ BitVec 64)) (t!47805 List!33111)) )
))
(declare-fun arrayNoDuplicates!0 (array!96507 (_ BitVec 32) List!33111) Bool)

(assert (=> b!1411880 (= res!949103 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33108))))

(declare-datatypes ((SeekEntryResult!10903 0))(
  ( (MissingZero!10903 (index!45989 (_ BitVec 32))) (Found!10903 (index!45990 (_ BitVec 32))) (Intermediate!10903 (undefined!11715 Bool) (index!45991 (_ BitVec 32)) (x!127578 (_ BitVec 32))) (Undefined!10903) (MissingVacant!10903 (index!45992 (_ BitVec 32))) )
))
(declare-fun lt!622011 () SeekEntryResult!10903)

(declare-fun b!1411881 () Bool)

(declare-fun e!798971 () Bool)

(declare-fun lt!622014 () (_ BitVec 64))

(declare-fun lt!622013 () array!96507)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96507 (_ BitVec 32)) SeekEntryResult!10903)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96507 (_ BitVec 32)) SeekEntryResult!10903)

(assert (=> b!1411881 (= e!798971 (= (seekEntryOrOpen!0 lt!622014 lt!622013 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127578 lt!622011) (index!45991 lt!622011) (index!45991 lt!622011) (select (arr!46592 a!2901) j!112) lt!622013 mask!2840)))))

(declare-fun lt!622012 () SeekEntryResult!10903)

(assert (=> b!1411881 (and (not (undefined!11715 lt!622011)) (= (index!45991 lt!622011) i!1037) (bvslt (x!127578 lt!622011) (x!127578 lt!622012)) (= (select (store (arr!46592 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45991 lt!622011)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47780 0))(
  ( (Unit!47781) )
))
(declare-fun lt!622009 () Unit!47780)

(declare-fun lt!622010 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96507 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47780)

(assert (=> b!1411881 (= lt!622009 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622010 (x!127578 lt!622012) (index!45991 lt!622012) (x!127578 lt!622011) (index!45991 lt!622011) (undefined!11715 lt!622011) mask!2840))))

(declare-fun b!1411882 () Bool)

(declare-fun e!798970 () Bool)

(assert (=> b!1411882 (= e!798970 e!798971)))

(declare-fun res!949108 () Bool)

(assert (=> b!1411882 (=> res!949108 e!798971)))

(assert (=> b!1411882 (= res!949108 (or (= lt!622012 lt!622011) (not (is-Intermediate!10903 lt!622011))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96507 (_ BitVec 32)) SeekEntryResult!10903)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411882 (= lt!622011 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622014 mask!2840) lt!622014 lt!622013 mask!2840))))

(assert (=> b!1411882 (= lt!622014 (select (store (arr!46592 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1411882 (= lt!622013 (array!96508 (store (arr!46592 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47142 a!2901)))))

(declare-fun res!949110 () Bool)

(assert (=> start!121506 (=> (not res!949110) (not e!798967))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121506 (= res!949110 (validMask!0 mask!2840))))

(assert (=> start!121506 e!798967))

(assert (=> start!121506 true))

(declare-fun array_inv!35620 (array!96507) Bool)

(assert (=> start!121506 (array_inv!35620 a!2901)))

(declare-fun b!1411876 () Bool)

(assert (=> b!1411876 (= e!798967 (not e!798970))))

(declare-fun res!949109 () Bool)

(assert (=> b!1411876 (=> res!949109 e!798970)))

(assert (=> b!1411876 (= res!949109 (or (not (is-Intermediate!10903 lt!622012)) (undefined!11715 lt!622012)))))

(declare-fun e!798969 () Bool)

(assert (=> b!1411876 e!798969))

(declare-fun res!949106 () Bool)

(assert (=> b!1411876 (=> (not res!949106) (not e!798969))))

(assert (=> b!1411876 (= res!949106 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622008 () Unit!47780)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96507 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47780)

(assert (=> b!1411876 (= lt!622008 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1411876 (= lt!622012 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622010 (select (arr!46592 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1411876 (= lt!622010 (toIndex!0 (select (arr!46592 a!2901) j!112) mask!2840))))

(declare-fun b!1411883 () Bool)

(assert (=> b!1411883 (= e!798969 (= (seekEntryOrOpen!0 (select (arr!46592 a!2901) j!112) a!2901 mask!2840) (Found!10903 j!112)))))

(declare-fun b!1411884 () Bool)

(declare-fun res!949105 () Bool)

(assert (=> b!1411884 (=> (not res!949105) (not e!798967))))

(assert (=> b!1411884 (= res!949105 (and (= (size!47142 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47142 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47142 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121506 res!949110) b!1411884))

(assert (= (and b!1411884 res!949105) b!1411878))

(assert (= (and b!1411878 res!949104) b!1411879))

(assert (= (and b!1411879 res!949107) b!1411877))

(assert (= (and b!1411877 res!949111) b!1411880))

(assert (= (and b!1411880 res!949103) b!1411876))

(assert (= (and b!1411876 res!949106) b!1411883))

(assert (= (and b!1411876 (not res!949109)) b!1411882))

(assert (= (and b!1411882 (not res!949108)) b!1411881))

(declare-fun m!1301901 () Bool)

(assert (=> start!121506 m!1301901))

(declare-fun m!1301903 () Bool)

(assert (=> start!121506 m!1301903))

(declare-fun m!1301905 () Bool)

(assert (=> b!1411881 m!1301905))

(declare-fun m!1301907 () Bool)

(assert (=> b!1411881 m!1301907))

(declare-fun m!1301909 () Bool)

(assert (=> b!1411881 m!1301909))

(declare-fun m!1301911 () Bool)

(assert (=> b!1411881 m!1301911))

(declare-fun m!1301913 () Bool)

(assert (=> b!1411881 m!1301913))

(assert (=> b!1411881 m!1301913))

(declare-fun m!1301915 () Bool)

(assert (=> b!1411881 m!1301915))

(declare-fun m!1301917 () Bool)

(assert (=> b!1411882 m!1301917))

(assert (=> b!1411882 m!1301917))

(declare-fun m!1301919 () Bool)

(assert (=> b!1411882 m!1301919))

(assert (=> b!1411882 m!1301909))

(declare-fun m!1301921 () Bool)

(assert (=> b!1411882 m!1301921))

(assert (=> b!1411879 m!1301913))

(assert (=> b!1411879 m!1301913))

(declare-fun m!1301923 () Bool)

(assert (=> b!1411879 m!1301923))

(declare-fun m!1301925 () Bool)

(assert (=> b!1411877 m!1301925))

(assert (=> b!1411883 m!1301913))

(assert (=> b!1411883 m!1301913))

(declare-fun m!1301927 () Bool)

(assert (=> b!1411883 m!1301927))

(declare-fun m!1301929 () Bool)

(assert (=> b!1411878 m!1301929))

(assert (=> b!1411878 m!1301929))

(declare-fun m!1301931 () Bool)

(assert (=> b!1411878 m!1301931))

(declare-fun m!1301933 () Bool)

(assert (=> b!1411880 m!1301933))

(assert (=> b!1411876 m!1301913))

(declare-fun m!1301935 () Bool)

(assert (=> b!1411876 m!1301935))

(assert (=> b!1411876 m!1301913))

(declare-fun m!1301937 () Bool)

(assert (=> b!1411876 m!1301937))

(assert (=> b!1411876 m!1301913))

(declare-fun m!1301939 () Bool)

(assert (=> b!1411876 m!1301939))

(declare-fun m!1301941 () Bool)

(assert (=> b!1411876 m!1301941))

(push 1)

(assert (not b!1411878))

(assert (not start!121506))

(assert (not b!1411877))

(assert (not b!1411876))

(assert (not b!1411880))

(assert (not b!1411881))

(assert (not b!1411883))

(assert (not b!1411882))

(assert (not b!1411879))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!151999 () Bool)

(assert (=> d!151999 (= (validKeyInArray!0 (select (arr!46592 a!2901) j!112)) (and (not (= (select (arr!46592 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46592 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1411879 d!151999))

(declare-fun d!152001 () Bool)

(assert (=> d!152001 (= (validKeyInArray!0 (select (arr!46592 a!2901) i!1037)) (and (not (= (select (arr!46592 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46592 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1411878 d!152001))

(declare-fun b!1411993 () Bool)

(declare-fun e!799036 () SeekEntryResult!10903)

(assert (=> b!1411993 (= e!799036 Undefined!10903)))

(declare-fun lt!622077 () SeekEntryResult!10903)

(declare-fun b!1411994 () Bool)

(declare-fun e!799037 () SeekEntryResult!10903)

(assert (=> b!1411994 (= e!799037 (seekKeyOrZeroReturnVacant!0 (x!127578 lt!622077) (index!45991 lt!622077) (index!45991 lt!622077) (select (arr!46592 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1411996 () Bool)

(declare-fun c!130876 () Bool)

(declare-fun lt!622075 () (_ BitVec 64))

(assert (=> b!1411996 (= c!130876 (= lt!622075 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!799035 () SeekEntryResult!10903)

(assert (=> b!1411996 (= e!799035 e!799037)))

(declare-fun b!1411997 () Bool)

(assert (=> b!1411997 (= e!799035 (Found!10903 (index!45991 lt!622077)))))

(declare-fun b!1411998 () Bool)

(assert (=> b!1411998 (= e!799036 e!799035)))

(assert (=> b!1411998 (= lt!622075 (select (arr!46592 a!2901) (index!45991 lt!622077)))))

(declare-fun c!130877 () Bool)

(assert (=> b!1411998 (= c!130877 (= lt!622075 (select (arr!46592 a!2901) j!112)))))

(declare-fun b!1411995 () Bool)

(assert (=> b!1411995 (= e!799037 (MissingZero!10903 (index!45991 lt!622077)))))

(declare-fun d!152003 () Bool)

(declare-fun lt!622076 () SeekEntryResult!10903)

(assert (=> d!152003 (and (or (is-Undefined!10903 lt!622076) (not (is-Found!10903 lt!622076)) (and (bvsge (index!45990 lt!622076) #b00000000000000000000000000000000) (bvslt (index!45990 lt!622076) (size!47142 a!2901)))) (or (is-Undefined!10903 lt!622076) (is-Found!10903 lt!622076) (not (is-MissingZero!10903 lt!622076)) (and (bvsge (index!45989 lt!622076) #b00000000000000000000000000000000) (bvslt (index!45989 lt!622076) (size!47142 a!2901)))) (or (is-Undefined!10903 lt!622076) (is-Found!10903 lt!622076) (is-MissingZero!10903 lt!622076) (not (is-MissingVacant!10903 lt!622076)) (and (bvsge (index!45992 lt!622076) #b00000000000000000000000000000000) (bvslt (index!45992 lt!622076) (size!47142 a!2901)))) (or (is-Undefined!10903 lt!622076) (ite (is-Found!10903 lt!622076) (= (select (arr!46592 a!2901) (index!45990 lt!622076)) (select (arr!46592 a!2901) j!112)) (ite (is-MissingZero!10903 lt!622076) (= (select (arr!46592 a!2901) (index!45989 lt!622076)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10903 lt!622076) (= (select (arr!46592 a!2901) (index!45992 lt!622076)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152003 (= lt!622076 e!799036)))

(declare-fun c!130878 () Bool)

(assert (=> d!152003 (= c!130878 (and (is-Intermediate!10903 lt!622077) (undefined!11715 lt!622077)))))

(assert (=> d!152003 (= lt!622077 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46592 a!2901) j!112) mask!2840) (select (arr!46592 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152003 (validMask!0 mask!2840)))

(assert (=> d!152003 (= (seekEntryOrOpen!0 (select (arr!46592 a!2901) j!112) a!2901 mask!2840) lt!622076)))

(assert (= (and d!152003 c!130878) b!1411993))

(assert (= (and d!152003 (not c!130878)) b!1411998))

(assert (= (and b!1411998 c!130877) b!1411997))

(assert (= (and b!1411998 (not c!130877)) b!1411996))

(assert (= (and b!1411996 c!130876) b!1411995))

(assert (= (and b!1411996 (not c!130876)) b!1411994))

(assert (=> b!1411994 m!1301913))

(declare-fun m!1302043 () Bool)

(assert (=> b!1411994 m!1302043))

(declare-fun m!1302045 () Bool)

(assert (=> b!1411998 m!1302045))

(declare-fun m!1302047 () Bool)

(assert (=> d!152003 m!1302047))

(assert (=> d!152003 m!1301913))

(assert (=> d!152003 m!1301937))

(assert (=> d!152003 m!1301901))

(assert (=> d!152003 m!1301937))

(assert (=> d!152003 m!1301913))

(declare-fun m!1302049 () Bool)

(assert (=> d!152003 m!1302049))

(declare-fun m!1302051 () Bool)

(assert (=> d!152003 m!1302051))

(declare-fun m!1302053 () Bool)

(assert (=> d!152003 m!1302053))

(assert (=> b!1411883 d!152003))

(declare-fun b!1412015 () Bool)

(declare-fun e!799051 () Bool)

(declare-fun call!67083 () Bool)

(assert (=> b!1412015 (= e!799051 call!67083)))

(declare-fun d!152017 () Bool)

(declare-fun res!949194 () Bool)

(declare-fun e!799050 () Bool)

(assert (=> d!152017 (=> res!949194 e!799050)))

(assert (=> d!152017 (= res!949194 (bvsge #b00000000000000000000000000000000 (size!47142 a!2901)))))

(assert (=> d!152017 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!799050)))

(declare-fun bm!67080 () Bool)

(assert (=> bm!67080 (= call!67083 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1412016 () Bool)

(declare-fun e!799052 () Bool)

(assert (=> b!1412016 (= e!799050 e!799052)))

(declare-fun c!130883 () Bool)

(assert (=> b!1412016 (= c!130883 (validKeyInArray!0 (select (arr!46592 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1412017 () Bool)

(assert (=> b!1412017 (= e!799052 call!67083)))

(declare-fun b!1412018 () Bool)

(assert (=> b!1412018 (= e!799052 e!799051)))

(declare-fun lt!622092 () (_ BitVec 64))

(assert (=> b!1412018 (= lt!622092 (select (arr!46592 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!622091 () Unit!47780)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96507 (_ BitVec 64) (_ BitVec 32)) Unit!47780)

(assert (=> b!1412018 (= lt!622091 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!622092 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1412018 (arrayContainsKey!0 a!2901 lt!622092 #b00000000000000000000000000000000)))

(declare-fun lt!622090 () Unit!47780)

(assert (=> b!1412018 (= lt!622090 lt!622091)))

(declare-fun res!949193 () Bool)

(assert (=> b!1412018 (= res!949193 (= (seekEntryOrOpen!0 (select (arr!46592 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10903 #b00000000000000000000000000000000)))))

(assert (=> b!1412018 (=> (not res!949193) (not e!799051))))

(assert (= (and d!152017 (not res!949194)) b!1412016))

(assert (= (and b!1412016 c!130883) b!1412018))

(assert (= (and b!1412016 (not c!130883)) b!1412017))

(assert (= (and b!1412018 res!949193) b!1412015))

(assert (= (or b!1412015 b!1412017) bm!67080))

(declare-fun m!1302055 () Bool)

(assert (=> bm!67080 m!1302055))

(declare-fun m!1302057 () Bool)

(assert (=> b!1412016 m!1302057))

(assert (=> b!1412016 m!1302057))

(declare-fun m!1302059 () Bool)

(assert (=> b!1412016 m!1302059))

(assert (=> b!1412018 m!1302057))

(declare-fun m!1302061 () Bool)

(assert (=> b!1412018 m!1302061))

(declare-fun m!1302063 () Bool)

(assert (=> b!1412018 m!1302063))

(assert (=> b!1412018 m!1302057))

(declare-fun m!1302065 () Bool)

(assert (=> b!1412018 m!1302065))

(assert (=> b!1411877 d!152017))

(declare-fun b!1412096 () Bool)

(declare-fun lt!622122 () SeekEntryResult!10903)

(assert (=> b!1412096 (and (bvsge (index!45991 lt!622122) #b00000000000000000000000000000000) (bvslt (index!45991 lt!622122) (size!47142 lt!622013)))))

(declare-fun res!949228 () Bool)

(assert (=> b!1412096 (= res!949228 (= (select (arr!46592 lt!622013) (index!45991 lt!622122)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!799103 () Bool)

(assert (=> b!1412096 (=> res!949228 e!799103)))

(declare-fun b!1412097 () Bool)

(declare-fun e!799102 () Bool)

(assert (=> b!1412097 (= e!799102 (bvsge (x!127578 lt!622122) #b01111111111111111111111111111110))))

(declare-fun b!1412098 () Bool)

(assert (=> b!1412098 (and (bvsge (index!45991 lt!622122) #b00000000000000000000000000000000) (bvslt (index!45991 lt!622122) (size!47142 lt!622013)))))

(declare-fun res!949227 () Bool)

(assert (=> b!1412098 (= res!949227 (= (select (arr!46592 lt!622013) (index!45991 lt!622122)) lt!622014))))

(assert (=> b!1412098 (=> res!949227 e!799103)))

(declare-fun e!799101 () Bool)

(assert (=> b!1412098 (= e!799101 e!799103)))

(declare-fun b!1412099 () Bool)

(declare-fun e!799105 () SeekEntryResult!10903)

(assert (=> b!1412099 (= e!799105 (Intermediate!10903 true (toIndex!0 lt!622014 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1412100 () Bool)

(assert (=> b!1412100 (= e!799102 e!799101)))

(declare-fun res!949229 () Bool)

(assert (=> b!1412100 (= res!949229 (and (is-Intermediate!10903 lt!622122) (not (undefined!11715 lt!622122)) (bvslt (x!127578 lt!622122) #b01111111111111111111111111111110) (bvsge (x!127578 lt!622122) #b00000000000000000000000000000000) (bvsge (x!127578 lt!622122) #b00000000000000000000000000000000)))))

(assert (=> b!1412100 (=> (not res!949229) (not e!799101))))

(declare-fun b!1412101 () Bool)

(declare-fun e!799104 () SeekEntryResult!10903)

(assert (=> b!1412101 (= e!799104 (Intermediate!10903 false (toIndex!0 lt!622014 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1412102 () Bool)

(assert (=> b!1412102 (and (bvsge (index!45991 lt!622122) #b00000000000000000000000000000000) (bvslt (index!45991 lt!622122) (size!47142 lt!622013)))))

(assert (=> b!1412102 (= e!799103 (= (select (arr!46592 lt!622013) (index!45991 lt!622122)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1412103 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412103 (= e!799104 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!622014 mask!2840) #b00000000000000000000000000000000 mask!2840) lt!622014 lt!622013 mask!2840))))

(declare-fun d!152023 () Bool)

(assert (=> d!152023 e!799102))

(declare-fun c!130908 () Bool)

(assert (=> d!152023 (= c!130908 (and (is-Intermediate!10903 lt!622122) (undefined!11715 lt!622122)))))

(assert (=> d!152023 (= lt!622122 e!799105)))

(declare-fun c!130909 () Bool)

(assert (=> d!152023 (= c!130909 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!622123 () (_ BitVec 64))

(assert (=> d!152023 (= lt!622123 (select (arr!46592 lt!622013) (toIndex!0 lt!622014 mask!2840)))))

(assert (=> d!152023 (validMask!0 mask!2840)))

(assert (=> d!152023 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622014 mask!2840) lt!622014 lt!622013 mask!2840) lt!622122)))

(declare-fun b!1412104 () Bool)

(assert (=> b!1412104 (= e!799105 e!799104)))

(declare-fun c!130907 () Bool)

(assert (=> b!1412104 (= c!130907 (or (= lt!622123 lt!622014) (= (bvadd lt!622123 lt!622123) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!152023 c!130909) b!1412099))

(assert (= (and d!152023 (not c!130909)) b!1412104))

(assert (= (and b!1412104 c!130907) b!1412101))

(assert (= (and b!1412104 (not c!130907)) b!1412103))

(assert (= (and d!152023 c!130908) b!1412097))

(assert (= (and d!152023 (not c!130908)) b!1412100))

(assert (= (and b!1412100 res!949229) b!1412098))

(assert (= (and b!1412098 (not res!949227)) b!1412096))

(assert (= (and b!1412096 (not res!949228)) b!1412102))

(declare-fun m!1302107 () Bool)

(assert (=> b!1412096 m!1302107))

(assert (=> b!1412103 m!1301917))

(declare-fun m!1302109 () Bool)

(assert (=> b!1412103 m!1302109))

(assert (=> b!1412103 m!1302109))

(declare-fun m!1302111 () Bool)

(assert (=> b!1412103 m!1302111))

(assert (=> b!1412098 m!1302107))

(assert (=> b!1412102 m!1302107))

(assert (=> d!152023 m!1301917))

(declare-fun m!1302113 () Bool)

(assert (=> d!152023 m!1302113))

(assert (=> d!152023 m!1301901))

(assert (=> b!1411882 d!152023))

(declare-fun d!152045 () Bool)

(declare-fun lt!622129 () (_ BitVec 32))

(declare-fun lt!622128 () (_ BitVec 32))

(assert (=> d!152045 (= lt!622129 (bvmul (bvxor lt!622128 (bvlshr lt!622128 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152045 (= lt!622128 ((_ extract 31 0) (bvand (bvxor lt!622014 (bvlshr lt!622014 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152045 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!949230 (let ((h!34384 ((_ extract 31 0) (bvand (bvxor lt!622014 (bvlshr lt!622014 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127586 (bvmul (bvxor h!34384 (bvlshr h!34384 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127586 (bvlshr x!127586 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!949230 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!949230 #b00000000000000000000000000000000))))))

(assert (=> d!152045 (= (toIndex!0 lt!622014 mask!2840) (bvand (bvxor lt!622129 (bvlshr lt!622129 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1411882 d!152045))

(declare-fun b!1412105 () Bool)

(declare-fun e!799107 () Bool)

(declare-fun call!67089 () Bool)

(assert (=> b!1412105 (= e!799107 call!67089)))

(declare-fun d!152047 () Bool)

(declare-fun res!949232 () Bool)

(declare-fun e!799106 () Bool)

(assert (=> d!152047 (=> res!949232 e!799106)))

(assert (=> d!152047 (= res!949232 (bvsge j!112 (size!47142 a!2901)))))

(assert (=> d!152047 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!799106)))

(declare-fun bm!67086 () Bool)

(assert (=> bm!67086 (= call!67089 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1412106 () Bool)

(declare-fun e!799108 () Bool)

(assert (=> b!1412106 (= e!799106 e!799108)))

(declare-fun c!130910 () Bool)

(assert (=> b!1412106 (= c!130910 (validKeyInArray!0 (select (arr!46592 a!2901) j!112)))))

(declare-fun b!1412107 () Bool)

(assert (=> b!1412107 (= e!799108 call!67089)))

(declare-fun b!1412108 () Bool)

(assert (=> b!1412108 (= e!799108 e!799107)))

(declare-fun lt!622132 () (_ BitVec 64))

(assert (=> b!1412108 (= lt!622132 (select (arr!46592 a!2901) j!112))))

(declare-fun lt!622131 () Unit!47780)

(assert (=> b!1412108 (= lt!622131 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!622132 j!112))))

(assert (=> b!1412108 (arrayContainsKey!0 a!2901 lt!622132 #b00000000000000000000000000000000)))

(declare-fun lt!622130 () Unit!47780)

(assert (=> b!1412108 (= lt!622130 lt!622131)))

(declare-fun res!949231 () Bool)

(assert (=> b!1412108 (= res!949231 (= (seekEntryOrOpen!0 (select (arr!46592 a!2901) j!112) a!2901 mask!2840) (Found!10903 j!112)))))

(assert (=> b!1412108 (=> (not res!949231) (not e!799107))))

(assert (= (and d!152047 (not res!949232)) b!1412106))

(assert (= (and b!1412106 c!130910) b!1412108))

(assert (= (and b!1412106 (not c!130910)) b!1412107))

(assert (= (and b!1412108 res!949231) b!1412105))

(assert (= (or b!1412105 b!1412107) bm!67086))

(declare-fun m!1302115 () Bool)

(assert (=> bm!67086 m!1302115))

(assert (=> b!1412106 m!1301913))

(assert (=> b!1412106 m!1301913))

(assert (=> b!1412106 m!1301923))

(assert (=> b!1412108 m!1301913))

(declare-fun m!1302117 () Bool)

(assert (=> b!1412108 m!1302117))

(declare-fun m!1302119 () Bool)

(assert (=> b!1412108 m!1302119))

(assert (=> b!1412108 m!1301913))

(assert (=> b!1412108 m!1301927))

(assert (=> b!1411876 d!152047))

(declare-fun d!152049 () Bool)

(assert (=> d!152049 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!622145 () Unit!47780)

(declare-fun choose!38 (array!96507 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47780)

(assert (=> d!152049 (= lt!622145 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152049 (validMask!0 mask!2840)))

(assert (=> d!152049 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!622145)))

(declare-fun bs!41169 () Bool)

(assert (= bs!41169 d!152049))

(assert (=> bs!41169 m!1301941))

(declare-fun m!1302121 () Bool)

(assert (=> bs!41169 m!1302121))

(assert (=> bs!41169 m!1301901))

(assert (=> b!1411876 d!152049))

(declare-fun b!1412133 () Bool)

(declare-fun lt!622148 () SeekEntryResult!10903)

(assert (=> b!1412133 (and (bvsge (index!45991 lt!622148) #b00000000000000000000000000000000) (bvslt (index!45991 lt!622148) (size!47142 a!2901)))))

(declare-fun res!949234 () Bool)

(assert (=> b!1412133 (= res!949234 (= (select (arr!46592 a!2901) (index!45991 lt!622148)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!799121 () Bool)

(assert (=> b!1412133 (=> res!949234 e!799121)))

(declare-fun b!1412134 () Bool)

(declare-fun e!799120 () Bool)

(assert (=> b!1412134 (= e!799120 (bvsge (x!127578 lt!622148) #b01111111111111111111111111111110))))

(declare-fun b!1412135 () Bool)

(assert (=> b!1412135 (and (bvsge (index!45991 lt!622148) #b00000000000000000000000000000000) (bvslt (index!45991 lt!622148) (size!47142 a!2901)))))

(declare-fun res!949233 () Bool)

(assert (=> b!1412135 (= res!949233 (= (select (arr!46592 a!2901) (index!45991 lt!622148)) (select (arr!46592 a!2901) j!112)))))

(assert (=> b!1412135 (=> res!949233 e!799121)))

(declare-fun e!799119 () Bool)

(assert (=> b!1412135 (= e!799119 e!799121)))

(declare-fun b!1412136 () Bool)

(declare-fun e!799124 () SeekEntryResult!10903)

(assert (=> b!1412136 (= e!799124 (Intermediate!10903 true lt!622010 #b00000000000000000000000000000000))))

(declare-fun b!1412137 () Bool)

(assert (=> b!1412137 (= e!799120 e!799119)))

(declare-fun res!949235 () Bool)

(assert (=> b!1412137 (= res!949235 (and (is-Intermediate!10903 lt!622148) (not (undefined!11715 lt!622148)) (bvslt (x!127578 lt!622148) #b01111111111111111111111111111110) (bvsge (x!127578 lt!622148) #b00000000000000000000000000000000) (bvsge (x!127578 lt!622148) #b00000000000000000000000000000000)))))

(assert (=> b!1412137 (=> (not res!949235) (not e!799119))))

(declare-fun b!1412138 () Bool)

(declare-fun e!799122 () SeekEntryResult!10903)

(assert (=> b!1412138 (= e!799122 (Intermediate!10903 false lt!622010 #b00000000000000000000000000000000))))

(declare-fun b!1412139 () Bool)

(assert (=> b!1412139 (and (bvsge (index!45991 lt!622148) #b00000000000000000000000000000000) (bvslt (index!45991 lt!622148) (size!47142 a!2901)))))

(assert (=> b!1412139 (= e!799121 (= (select (arr!46592 a!2901) (index!45991 lt!622148)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1412140 () Bool)

(assert (=> b!1412140 (= e!799122 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!622010 #b00000000000000000000000000000000 mask!2840) (select (arr!46592 a!2901) j!112) a!2901 mask!2840))))

(declare-fun d!152051 () Bool)

(assert (=> d!152051 e!799120))

(declare-fun c!130922 () Bool)

(assert (=> d!152051 (= c!130922 (and (is-Intermediate!10903 lt!622148) (undefined!11715 lt!622148)))))

(assert (=> d!152051 (= lt!622148 e!799124)))

(declare-fun c!130923 () Bool)

(assert (=> d!152051 (= c!130923 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!622149 () (_ BitVec 64))

(assert (=> d!152051 (= lt!622149 (select (arr!46592 a!2901) lt!622010))))

(assert (=> d!152051 (validMask!0 mask!2840)))

(assert (=> d!152051 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622010 (select (arr!46592 a!2901) j!112) a!2901 mask!2840) lt!622148)))

(declare-fun b!1412141 () Bool)

(assert (=> b!1412141 (= e!799124 e!799122)))

(declare-fun c!130921 () Bool)

(assert (=> b!1412141 (= c!130921 (or (= lt!622149 (select (arr!46592 a!2901) j!112)) (= (bvadd lt!622149 lt!622149) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!152051 c!130923) b!1412136))

(assert (= (and d!152051 (not c!130923)) b!1412141))

(assert (= (and b!1412141 c!130921) b!1412138))

(assert (= (and b!1412141 (not c!130921)) b!1412140))

(assert (= (and d!152051 c!130922) b!1412134))

(assert (= (and d!152051 (not c!130922)) b!1412137))

(assert (= (and b!1412137 res!949235) b!1412135))

(assert (= (and b!1412135 (not res!949233)) b!1412133))

(assert (= (and b!1412133 (not res!949234)) b!1412139))

(declare-fun m!1302123 () Bool)

(assert (=> b!1412133 m!1302123))

(declare-fun m!1302125 () Bool)

(assert (=> b!1412140 m!1302125))

(assert (=> b!1412140 m!1302125))

(assert (=> b!1412140 m!1301913))

(declare-fun m!1302127 () Bool)

(assert (=> b!1412140 m!1302127))

(assert (=> b!1412135 m!1302123))

(assert (=> b!1412139 m!1302123))

(declare-fun m!1302129 () Bool)

(assert (=> d!152051 m!1302129))

(assert (=> d!152051 m!1301901))

(assert (=> b!1411876 d!152051))

(declare-fun d!152053 () Bool)

(declare-fun lt!622151 () (_ BitVec 32))

(declare-fun lt!622150 () (_ BitVec 32))

(assert (=> d!152053 (= lt!622151 (bvmul (bvxor lt!622150 (bvlshr lt!622150 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152053 (= lt!622150 ((_ extract 31 0) (bvand (bvxor (select (arr!46592 a!2901) j!112) (bvlshr (select (arr!46592 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152053 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!949230 (let ((h!34384 ((_ extract 31 0) (bvand (bvxor (select (arr!46592 a!2901) j!112) (bvlshr (select (arr!46592 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127586 (bvmul (bvxor h!34384 (bvlshr h!34384 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127586 (bvlshr x!127586 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!949230 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!949230 #b00000000000000000000000000000000))))))

(assert (=> d!152053 (= (toIndex!0 (select (arr!46592 a!2901) j!112) mask!2840) (bvand (bvxor lt!622151 (bvlshr lt!622151 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1411876 d!152053))

(declare-fun b!1412142 () Bool)

(declare-fun e!799127 () SeekEntryResult!10903)

(assert (=> b!1412142 (= e!799127 Undefined!10903)))

(declare-fun b!1412143 () Bool)

(declare-fun e!799128 () SeekEntryResult!10903)

(declare-fun lt!622154 () SeekEntryResult!10903)

(assert (=> b!1412143 (= e!799128 (seekKeyOrZeroReturnVacant!0 (x!127578 lt!622154) (index!45991 lt!622154) (index!45991 lt!622154) lt!622014 lt!622013 mask!2840))))

(declare-fun b!1412145 () Bool)

(declare-fun c!130926 () Bool)

(declare-fun lt!622152 () (_ BitVec 64))

(assert (=> b!1412145 (= c!130926 (= lt!622152 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!799126 () SeekEntryResult!10903)

(assert (=> b!1412145 (= e!799126 e!799128)))

(declare-fun b!1412146 () Bool)

(assert (=> b!1412146 (= e!799126 (Found!10903 (index!45991 lt!622154)))))

(declare-fun b!1412147 () Bool)

(assert (=> b!1412147 (= e!799127 e!799126)))

(assert (=> b!1412147 (= lt!622152 (select (arr!46592 lt!622013) (index!45991 lt!622154)))))

(declare-fun c!130927 () Bool)

(assert (=> b!1412147 (= c!130927 (= lt!622152 lt!622014))))

(declare-fun b!1412144 () Bool)

(assert (=> b!1412144 (= e!799128 (MissingZero!10903 (index!45991 lt!622154)))))

(declare-fun d!152055 () Bool)

(declare-fun lt!622153 () SeekEntryResult!10903)

(assert (=> d!152055 (and (or (is-Undefined!10903 lt!622153) (not (is-Found!10903 lt!622153)) (and (bvsge (index!45990 lt!622153) #b00000000000000000000000000000000) (bvslt (index!45990 lt!622153) (size!47142 lt!622013)))) (or (is-Undefined!10903 lt!622153) (is-Found!10903 lt!622153) (not (is-MissingZero!10903 lt!622153)) (and (bvsge (index!45989 lt!622153) #b00000000000000000000000000000000) (bvslt (index!45989 lt!622153) (size!47142 lt!622013)))) (or (is-Undefined!10903 lt!622153) (is-Found!10903 lt!622153) (is-MissingZero!10903 lt!622153) (not (is-MissingVacant!10903 lt!622153)) (and (bvsge (index!45992 lt!622153) #b00000000000000000000000000000000) (bvslt (index!45992 lt!622153) (size!47142 lt!622013)))) (or (is-Undefined!10903 lt!622153) (ite (is-Found!10903 lt!622153) (= (select (arr!46592 lt!622013) (index!45990 lt!622153)) lt!622014) (ite (is-MissingZero!10903 lt!622153) (= (select (arr!46592 lt!622013) (index!45989 lt!622153)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10903 lt!622153) (= (select (arr!46592 lt!622013) (index!45992 lt!622153)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152055 (= lt!622153 e!799127)))

(declare-fun c!130928 () Bool)

(assert (=> d!152055 (= c!130928 (and (is-Intermediate!10903 lt!622154) (undefined!11715 lt!622154)))))

(assert (=> d!152055 (= lt!622154 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622014 mask!2840) lt!622014 lt!622013 mask!2840))))

(assert (=> d!152055 (validMask!0 mask!2840)))

(assert (=> d!152055 (= (seekEntryOrOpen!0 lt!622014 lt!622013 mask!2840) lt!622153)))

(assert (= (and d!152055 c!130928) b!1412142))

(assert (= (and d!152055 (not c!130928)) b!1412147))

(assert (= (and b!1412147 c!130927) b!1412146))

(assert (= (and b!1412147 (not c!130927)) b!1412145))

(assert (= (and b!1412145 c!130926) b!1412144))

(assert (= (and b!1412145 (not c!130926)) b!1412143))

(declare-fun m!1302131 () Bool)

(assert (=> b!1412143 m!1302131))

(declare-fun m!1302133 () Bool)

(assert (=> b!1412147 m!1302133))

(declare-fun m!1302135 () Bool)

(assert (=> d!152055 m!1302135))

(assert (=> d!152055 m!1301917))

(assert (=> d!152055 m!1301901))

(assert (=> d!152055 m!1301917))

(assert (=> d!152055 m!1301919))

(declare-fun m!1302137 () Bool)

(assert (=> d!152055 m!1302137))

(declare-fun m!1302139 () Bool)

(assert (=> d!152055 m!1302139))

(assert (=> b!1411881 d!152055))

(declare-fun lt!622177 () SeekEntryResult!10903)

(declare-fun d!152057 () Bool)

(assert (=> d!152057 (and (or (is-Undefined!10903 lt!622177) (not (is-Found!10903 lt!622177)) (and (bvsge (index!45990 lt!622177) #b00000000000000000000000000000000) (bvslt (index!45990 lt!622177) (size!47142 lt!622013)))) (or (is-Undefined!10903 lt!622177) (is-Found!10903 lt!622177) (not (is-MissingVacant!10903 lt!622177)) (not (= (index!45992 lt!622177) (index!45991 lt!622011))) (and (bvsge (index!45992 lt!622177) #b00000000000000000000000000000000) (bvslt (index!45992 lt!622177) (size!47142 lt!622013)))) (or (is-Undefined!10903 lt!622177) (ite (is-Found!10903 lt!622177) (= (select (arr!46592 lt!622013) (index!45990 lt!622177)) (select (arr!46592 a!2901) j!112)) (and (is-MissingVacant!10903 lt!622177) (= (index!45992 lt!622177) (index!45991 lt!622011)) (= (select (arr!46592 lt!622013) (index!45992 lt!622177)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!799151 () SeekEntryResult!10903)

(assert (=> d!152057 (= lt!622177 e!799151)))

(declare-fun c!130952 () Bool)

(assert (=> d!152057 (= c!130952 (bvsge (x!127578 lt!622011) #b01111111111111111111111111111110))))

(declare-fun lt!622176 () (_ BitVec 64))

(assert (=> d!152057 (= lt!622176 (select (arr!46592 lt!622013) (index!45991 lt!622011)))))

(assert (=> d!152057 (validMask!0 mask!2840)))

(assert (=> d!152057 (= (seekKeyOrZeroReturnVacant!0 (x!127578 lt!622011) (index!45991 lt!622011) (index!45991 lt!622011) (select (arr!46592 a!2901) j!112) lt!622013 mask!2840) lt!622177)))

(declare-fun b!1412190 () Bool)

(declare-fun e!799152 () SeekEntryResult!10903)

(assert (=> b!1412190 (= e!799152 (MissingVacant!10903 (index!45991 lt!622011)))))

(declare-fun b!1412191 () Bool)

(assert (=> b!1412191 (= e!799151 Undefined!10903)))

(declare-fun b!1412192 () Bool)

(declare-fun e!799150 () SeekEntryResult!10903)

(assert (=> b!1412192 (= e!799151 e!799150)))

(declare-fun c!130951 () Bool)

(assert (=> b!1412192 (= c!130951 (= lt!622176 (select (arr!46592 a!2901) j!112)))))

(declare-fun b!1412193 () Bool)

(declare-fun c!130950 () Bool)

(assert (=> b!1412193 (= c!130950 (= lt!622176 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1412193 (= e!799150 e!799152)))

(declare-fun b!1412194 () Bool)

(assert (=> b!1412194 (= e!799150 (Found!10903 (index!45991 lt!622011)))))

(declare-fun b!1412195 () Bool)

(assert (=> b!1412195 (= e!799152 (seekKeyOrZeroReturnVacant!0 (bvadd (x!127578 lt!622011) #b00000000000000000000000000000001) (nextIndex!0 (index!45991 lt!622011) (x!127578 lt!622011) mask!2840) (index!45991 lt!622011) (select (arr!46592 a!2901) j!112) lt!622013 mask!2840))))

(assert (= (and d!152057 c!130952) b!1412191))

(assert (= (and d!152057 (not c!130952)) b!1412192))

(assert (= (and b!1412192 c!130951) b!1412194))

(assert (= (and b!1412192 (not c!130951)) b!1412193))

(assert (= (and b!1412193 c!130950) b!1412190))

(assert (= (and b!1412193 (not c!130950)) b!1412195))

(declare-fun m!1302173 () Bool)

(assert (=> d!152057 m!1302173))

(declare-fun m!1302175 () Bool)

(assert (=> d!152057 m!1302175))

(declare-fun m!1302177 () Bool)

(assert (=> d!152057 m!1302177))

(assert (=> d!152057 m!1301901))

(declare-fun m!1302179 () Bool)

(assert (=> b!1412195 m!1302179))

(assert (=> b!1412195 m!1302179))

(assert (=> b!1412195 m!1301913))

(declare-fun m!1302181 () Bool)

(assert (=> b!1412195 m!1302181))

(assert (=> b!1411881 d!152057))

(declare-fun d!152065 () Bool)

(assert (=> d!152065 (and (not (undefined!11715 lt!622011)) (= (index!45991 lt!622011) i!1037) (bvslt (x!127578 lt!622011) (x!127578 lt!622012)))))

(declare-fun lt!622182 () Unit!47780)

(declare-fun choose!62 (array!96507 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47780)

(assert (=> d!152065 (= lt!622182 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622010 (x!127578 lt!622012) (index!45991 lt!622012) (x!127578 lt!622011) (index!45991 lt!622011) (undefined!11715 lt!622011) mask!2840))))

(assert (=> d!152065 (validMask!0 mask!2840)))

(assert (=> d!152065 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622010 (x!127578 lt!622012) (index!45991 lt!622012) (x!127578 lt!622011) (index!45991 lt!622011) (undefined!11715 lt!622011) mask!2840) lt!622182)))

(declare-fun bs!41170 () Bool)

(assert (= bs!41170 d!152065))

(declare-fun m!1302193 () Bool)

(assert (=> bs!41170 m!1302193))

(assert (=> bs!41170 m!1301901))

(assert (=> b!1411881 d!152065))

(declare-fun b!1412230 () Bool)

(declare-fun e!799173 () Bool)

(declare-fun e!799176 () Bool)

(assert (=> b!1412230 (= e!799173 e!799176)))

(declare-fun res!949243 () Bool)

(assert (=> b!1412230 (=> (not res!949243) (not e!799176))))

(declare-fun e!799175 () Bool)

(assert (=> b!1412230 (= res!949243 (not e!799175))))

(declare-fun res!949244 () Bool)

(assert (=> b!1412230 (=> (not res!949244) (not e!799175))))

(assert (=> b!1412230 (= res!949244 (validKeyInArray!0 (select (arr!46592 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67089 () Bool)

(declare-fun call!67092 () Bool)

(declare-fun c!130967 () Bool)

(assert (=> bm!67089 (= call!67092 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130967 (Cons!33107 (select (arr!46592 a!2901) #b00000000000000000000000000000000) Nil!33108) Nil!33108)))))

(declare-fun d!152069 () Bool)

(declare-fun res!949242 () Bool)

(assert (=> d!152069 (=> res!949242 e!799173)))

(assert (=> d!152069 (= res!949242 (bvsge #b00000000000000000000000000000000 (size!47142 a!2901)))))

(assert (=> d!152069 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33108) e!799173)))

(declare-fun b!1412231 () Bool)

(declare-fun e!799174 () Bool)

(assert (=> b!1412231 (= e!799174 call!67092)))

(declare-fun b!1412232 () Bool)

(declare-fun contains!9813 (List!33111 (_ BitVec 64)) Bool)

(assert (=> b!1412232 (= e!799175 (contains!9813 Nil!33108 (select (arr!46592 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1412233 () Bool)

(assert (=> b!1412233 (= e!799176 e!799174)))

(assert (=> b!1412233 (= c!130967 (validKeyInArray!0 (select (arr!46592 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1412234 () Bool)

(assert (=> b!1412234 (= e!799174 call!67092)))

(assert (= (and d!152069 (not res!949242)) b!1412230))

(assert (= (and b!1412230 res!949244) b!1412232))

(assert (= (and b!1412230 res!949243) b!1412233))

(assert (= (and b!1412233 c!130967) b!1412234))

(assert (= (and b!1412233 (not c!130967)) b!1412231))

(assert (= (or b!1412234 b!1412231) bm!67089))

(assert (=> b!1412230 m!1302057))

(assert (=> b!1412230 m!1302057))

(assert (=> b!1412230 m!1302059))

(assert (=> bm!67089 m!1302057))

(declare-fun m!1302209 () Bool)

(assert (=> bm!67089 m!1302209))

(assert (=> b!1412232 m!1302057))

(assert (=> b!1412232 m!1302057))

(declare-fun m!1302211 () Bool)

(assert (=> b!1412232 m!1302211))

(assert (=> b!1412233 m!1302057))

(assert (=> b!1412233 m!1302057))

(assert (=> b!1412233 m!1302059))

(assert (=> b!1411880 d!152069))

(declare-fun d!152075 () Bool)

(assert (=> d!152075 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121506 d!152075))

(declare-fun d!152081 () Bool)

(assert (=> d!152081 (= (array_inv!35620 a!2901) (bvsge (size!47142 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121506 d!152081))

(push 1)

(assert (not d!152065))

(assert (not b!1412143))

(assert (not b!1412232))

(assert (not b!1412016))

(assert (not d!152051))

(assert (not d!152057))

(assert (not b!1412103))

(assert (not d!152049))

(assert (not b!1412018))

(assert (not b!1412233))

(assert (not d!152055))

(assert (not d!152023))

(assert (not b!1412106))

(assert (not d!152003))

(assert (not b!1412140))

(assert (not b!1412195))

(assert (not b!1412108))

(assert (not b!1412230))

(assert (not bm!67080))

(assert (not bm!67086))

(assert (not b!1411994))

(assert (not bm!67089))

(check-sat)

(pop 1)

(push 1)

(check-sat)

