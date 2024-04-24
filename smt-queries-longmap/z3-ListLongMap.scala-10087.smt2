; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118952 () Bool)

(assert start!118952)

(declare-fun res!928987 () Bool)

(declare-fun e!786918 () Bool)

(assert (=> start!118952 (=> (not res!928987) (not e!786918))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118952 (= res!928987 (validMask!0 mask!2987))))

(assert (=> start!118952 e!786918))

(assert (=> start!118952 true))

(declare-datatypes ((array!95045 0))(
  ( (array!95046 (arr!45895 (Array (_ BitVec 32) (_ BitVec 64))) (size!46446 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!95045)

(declare-fun array_inv!35176 (array!95045) Bool)

(assert (=> start!118952 (array_inv!35176 a!2938)))

(declare-fun b!1389030 () Bool)

(declare-fun e!786916 () Bool)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389030 (= e!786916 (validKeyInArray!0 (select (arr!45895 a!2938) startIndex!16)))))

(declare-fun e!786920 () Bool)

(declare-fun lt!610481 () array!95045)

(declare-fun b!1389031 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95045 (_ BitVec 32)) Bool)

(assert (=> b!1389031 (= e!786920 (not (arrayForallSeekEntryOrOpenFound!0 startIndex!16 lt!610481 mask!2987)))))

(declare-fun b!1389032 () Bool)

(declare-fun res!928986 () Bool)

(assert (=> b!1389032 (=> (not res!928986) (not e!786918))))

(assert (=> b!1389032 (= res!928986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1389033 () Bool)

(declare-fun res!928983 () Bool)

(assert (=> b!1389033 (=> (not res!928983) (not e!786918))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1389033 (= res!928983 (and (= (size!46446 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46446 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46446 a!2938))))))

(declare-fun b!1389034 () Bool)

(declare-fun res!928990 () Bool)

(assert (=> b!1389034 (=> (not res!928990) (not e!786918))))

(assert (=> b!1389034 (= res!928990 (validKeyInArray!0 (select (arr!45895 a!2938) i!1065)))))

(declare-fun b!1389035 () Bool)

(declare-fun res!928984 () Bool)

(assert (=> b!1389035 (=> (not res!928984) (not e!786918))))

(assert (=> b!1389035 (= res!928984 (and (not (= (select (arr!45895 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45895 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1389036 () Bool)

(assert (=> b!1389036 (= e!786918 e!786920)))

(declare-fun res!928988 () Bool)

(assert (=> b!1389036 (=> (not res!928988) (not e!786920))))

(assert (=> b!1389036 (= res!928988 (bvsge startIndex!16 (bvsub (size!46446 a!2938) #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!46338 0))(
  ( (Unit!46339) )
))
(declare-fun lt!610478 () Unit!46338)

(declare-fun e!786917 () Unit!46338)

(assert (=> b!1389036 (= lt!610478 e!786917)))

(declare-fun c!129472 () Bool)

(assert (=> b!1389036 (= c!129472 e!786916)))

(declare-fun res!928985 () Bool)

(assert (=> b!1389036 (=> (not res!928985) (not e!786916))))

(assert (=> b!1389036 (= res!928985 (not (= startIndex!16 i!1065)))))

(assert (=> b!1389036 (= lt!610481 (array!95046 (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46446 a!2938)))))

(declare-fun b!1389037 () Bool)

(declare-fun lt!610480 () Unit!46338)

(assert (=> b!1389037 (= e!786917 lt!610480)))

(declare-fun lt!610479 () Unit!46338)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!95045 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46338)

(assert (=> b!1389037 (= lt!610479 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10142 0))(
  ( (MissingZero!10142 (index!42939 (_ BitVec 32))) (Found!10142 (index!42940 (_ BitVec 32))) (Intermediate!10142 (undefined!10954 Bool) (index!42941 (_ BitVec 32)) (x!124707 (_ BitVec 32))) (Undefined!10142) (MissingVacant!10142 (index!42942 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95045 (_ BitVec 32)) SeekEntryResult!10142)

(assert (=> b!1389037 (= (seekEntryOrOpen!0 (select (arr!45895 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610481 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95045 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46338)

(assert (=> b!1389037 (= lt!610480 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1389037 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1389038 () Bool)

(declare-fun res!928989 () Bool)

(assert (=> b!1389038 (=> (not res!928989) (not e!786918))))

(declare-datatypes ((List!32410 0))(
  ( (Nil!32407) (Cons!32406 (h!33626 (_ BitVec 64)) (t!47096 List!32410)) )
))
(declare-fun arrayNoDuplicates!0 (array!95045 (_ BitVec 32) List!32410) Bool)

(assert (=> b!1389038 (= res!928989 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32407))))

(declare-fun b!1389039 () Bool)

(declare-fun Unit!46340 () Unit!46338)

(assert (=> b!1389039 (= e!786917 Unit!46340)))

(assert (= (and start!118952 res!928987) b!1389033))

(assert (= (and b!1389033 res!928983) b!1389034))

(assert (= (and b!1389034 res!928990) b!1389038))

(assert (= (and b!1389038 res!928989) b!1389032))

(assert (= (and b!1389032 res!928986) b!1389035))

(assert (= (and b!1389035 res!928984) b!1389036))

(assert (= (and b!1389036 res!928985) b!1389030))

(assert (= (and b!1389036 c!129472) b!1389037))

(assert (= (and b!1389036 (not c!129472)) b!1389039))

(assert (= (and b!1389036 res!928988) b!1389031))

(declare-fun m!1274917 () Bool)

(assert (=> b!1389031 m!1274917))

(declare-fun m!1274919 () Bool)

(assert (=> b!1389030 m!1274919))

(assert (=> b!1389030 m!1274919))

(declare-fun m!1274921 () Bool)

(assert (=> b!1389030 m!1274921))

(declare-fun m!1274923 () Bool)

(assert (=> b!1389037 m!1274923))

(declare-fun m!1274925 () Bool)

(assert (=> b!1389037 m!1274925))

(declare-fun m!1274927 () Bool)

(assert (=> b!1389037 m!1274927))

(assert (=> b!1389037 m!1274925))

(declare-fun m!1274929 () Bool)

(assert (=> b!1389037 m!1274929))

(declare-fun m!1274931 () Bool)

(assert (=> b!1389037 m!1274931))

(assert (=> b!1389037 m!1274919))

(declare-fun m!1274933 () Bool)

(assert (=> b!1389037 m!1274933))

(assert (=> b!1389037 m!1274919))

(declare-fun m!1274935 () Bool)

(assert (=> b!1389037 m!1274935))

(assert (=> b!1389036 m!1274927))

(declare-fun m!1274937 () Bool)

(assert (=> b!1389032 m!1274937))

(declare-fun m!1274939 () Bool)

(assert (=> b!1389038 m!1274939))

(declare-fun m!1274941 () Bool)

(assert (=> b!1389034 m!1274941))

(assert (=> b!1389034 m!1274941))

(declare-fun m!1274943 () Bool)

(assert (=> b!1389034 m!1274943))

(assert (=> b!1389035 m!1274941))

(declare-fun m!1274945 () Bool)

(assert (=> start!118952 m!1274945))

(declare-fun m!1274947 () Bool)

(assert (=> start!118952 m!1274947))

(check-sat (not b!1389034) (not b!1389030) (not b!1389031) (not b!1389037) (not b!1389038) (not b!1389032) (not start!118952))
(check-sat)
(get-model)

(declare-fun d!150071 () Bool)

(assert (=> d!150071 (= (validKeyInArray!0 (select (arr!45895 a!2938) startIndex!16)) (and (not (= (select (arr!45895 a!2938) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45895 a!2938) startIndex!16) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1389030 d!150071))

(declare-fun d!150073 () Bool)

(assert (=> d!150073 (= (validMask!0 mask!2987) (and (or (= mask!2987 #b00000000000000000000000000000111) (= mask!2987 #b00000000000000000000000000001111) (= mask!2987 #b00000000000000000000000000011111) (= mask!2987 #b00000000000000000000000000111111) (= mask!2987 #b00000000000000000000000001111111) (= mask!2987 #b00000000000000000000000011111111) (= mask!2987 #b00000000000000000000000111111111) (= mask!2987 #b00000000000000000000001111111111) (= mask!2987 #b00000000000000000000011111111111) (= mask!2987 #b00000000000000000000111111111111) (= mask!2987 #b00000000000000000001111111111111) (= mask!2987 #b00000000000000000011111111111111) (= mask!2987 #b00000000000000000111111111111111) (= mask!2987 #b00000000000000001111111111111111) (= mask!2987 #b00000000000000011111111111111111) (= mask!2987 #b00000000000000111111111111111111) (= mask!2987 #b00000000000001111111111111111111) (= mask!2987 #b00000000000011111111111111111111) (= mask!2987 #b00000000000111111111111111111111) (= mask!2987 #b00000000001111111111111111111111) (= mask!2987 #b00000000011111111111111111111111) (= mask!2987 #b00000000111111111111111111111111) (= mask!2987 #b00000001111111111111111111111111) (= mask!2987 #b00000011111111111111111111111111) (= mask!2987 #b00000111111111111111111111111111) (= mask!2987 #b00001111111111111111111111111111) (= mask!2987 #b00011111111111111111111111111111) (= mask!2987 #b00111111111111111111111111111111)) (bvsle mask!2987 #b00111111111111111111111111111111)))))

(assert (=> start!118952 d!150073))

(declare-fun d!150075 () Bool)

(assert (=> d!150075 (= (array_inv!35176 a!2938) (bvsge (size!46446 a!2938) #b00000000000000000000000000000000))))

(assert (=> start!118952 d!150075))

(declare-fun d!150077 () Bool)

(assert (=> d!150077 (= (validKeyInArray!0 (select (arr!45895 a!2938) i!1065)) (and (not (= (select (arr!45895 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45895 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1389034 d!150077))

(declare-fun b!1389110 () Bool)

(declare-fun e!786962 () Bool)

(declare-fun e!786959 () Bool)

(assert (=> b!1389110 (= e!786962 e!786959)))

(declare-fun c!129481 () Bool)

(assert (=> b!1389110 (= c!129481 (validKeyInArray!0 (select (arr!45895 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1389111 () Bool)

(declare-fun call!66660 () Bool)

(assert (=> b!1389111 (= e!786959 call!66660)))

(declare-fun b!1389112 () Bool)

(declare-fun e!786961 () Bool)

(assert (=> b!1389112 (= e!786961 e!786962)))

(declare-fun res!929046 () Bool)

(assert (=> b!1389112 (=> (not res!929046) (not e!786962))))

(declare-fun e!786960 () Bool)

(assert (=> b!1389112 (= res!929046 (not e!786960))))

(declare-fun res!929045 () Bool)

(assert (=> b!1389112 (=> (not res!929045) (not e!786960))))

(assert (=> b!1389112 (= res!929045 (validKeyInArray!0 (select (arr!45895 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1389113 () Bool)

(declare-fun contains!9790 (List!32410 (_ BitVec 64)) Bool)

(assert (=> b!1389113 (= e!786960 (contains!9790 Nil!32407 (select (arr!45895 a!2938) #b00000000000000000000000000000000)))))

(declare-fun d!150079 () Bool)

(declare-fun res!929047 () Bool)

(assert (=> d!150079 (=> res!929047 e!786961)))

(assert (=> d!150079 (= res!929047 (bvsge #b00000000000000000000000000000000 (size!46446 a!2938)))))

(assert (=> d!150079 (= (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32407) e!786961)))

(declare-fun b!1389114 () Bool)

(assert (=> b!1389114 (= e!786959 call!66660)))

(declare-fun bm!66657 () Bool)

(assert (=> bm!66657 (= call!66660 (arrayNoDuplicates!0 a!2938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129481 (Cons!32406 (select (arr!45895 a!2938) #b00000000000000000000000000000000) Nil!32407) Nil!32407)))))

(assert (= (and d!150079 (not res!929047)) b!1389112))

(assert (= (and b!1389112 res!929045) b!1389113))

(assert (= (and b!1389112 res!929046) b!1389110))

(assert (= (and b!1389110 c!129481) b!1389114))

(assert (= (and b!1389110 (not c!129481)) b!1389111))

(assert (= (or b!1389114 b!1389111) bm!66657))

(declare-fun m!1275013 () Bool)

(assert (=> b!1389110 m!1275013))

(assert (=> b!1389110 m!1275013))

(declare-fun m!1275015 () Bool)

(assert (=> b!1389110 m!1275015))

(assert (=> b!1389112 m!1275013))

(assert (=> b!1389112 m!1275013))

(assert (=> b!1389112 m!1275015))

(assert (=> b!1389113 m!1275013))

(assert (=> b!1389113 m!1275013))

(declare-fun m!1275017 () Bool)

(assert (=> b!1389113 m!1275017))

(assert (=> bm!66657 m!1275013))

(declare-fun m!1275019 () Bool)

(assert (=> bm!66657 m!1275019))

(assert (=> b!1389038 d!150079))

(declare-fun b!1389123 () Bool)

(declare-fun e!786971 () Bool)

(declare-fun e!786969 () Bool)

(assert (=> b!1389123 (= e!786971 e!786969)))

(declare-fun lt!610512 () (_ BitVec 64))

(assert (=> b!1389123 (= lt!610512 (select (arr!45895 a!2938) #b00000000000000000000000000000000))))

(declare-fun lt!610514 () Unit!46338)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95045 (_ BitVec 64) (_ BitVec 32)) Unit!46338)

(assert (=> b!1389123 (= lt!610514 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610512 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1389123 (arrayContainsKey!0 a!2938 lt!610512 #b00000000000000000000000000000000)))

(declare-fun lt!610513 () Unit!46338)

(assert (=> b!1389123 (= lt!610513 lt!610514)))

(declare-fun res!929053 () Bool)

(assert (=> b!1389123 (= res!929053 (= (seekEntryOrOpen!0 (select (arr!45895 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987) (Found!10142 #b00000000000000000000000000000000)))))

(assert (=> b!1389123 (=> (not res!929053) (not e!786969))))

(declare-fun b!1389124 () Bool)

(declare-fun call!66663 () Bool)

(assert (=> b!1389124 (= e!786969 call!66663)))

(declare-fun b!1389125 () Bool)

(declare-fun e!786970 () Bool)

(assert (=> b!1389125 (= e!786970 e!786971)))

(declare-fun c!129484 () Bool)

(assert (=> b!1389125 (= c!129484 (validKeyInArray!0 (select (arr!45895 a!2938) #b00000000000000000000000000000000)))))

(declare-fun d!150081 () Bool)

(declare-fun res!929052 () Bool)

(assert (=> d!150081 (=> res!929052 e!786970)))

(assert (=> d!150081 (= res!929052 (bvsge #b00000000000000000000000000000000 (size!46446 a!2938)))))

(assert (=> d!150081 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987) e!786970)))

(declare-fun bm!66660 () Bool)

(assert (=> bm!66660 (= call!66663 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun b!1389126 () Bool)

(assert (=> b!1389126 (= e!786971 call!66663)))

(assert (= (and d!150081 (not res!929052)) b!1389125))

(assert (= (and b!1389125 c!129484) b!1389123))

(assert (= (and b!1389125 (not c!129484)) b!1389126))

(assert (= (and b!1389123 res!929053) b!1389124))

(assert (= (or b!1389124 b!1389126) bm!66660))

(assert (=> b!1389123 m!1275013))

(declare-fun m!1275021 () Bool)

(assert (=> b!1389123 m!1275021))

(declare-fun m!1275023 () Bool)

(assert (=> b!1389123 m!1275023))

(assert (=> b!1389123 m!1275013))

(declare-fun m!1275025 () Bool)

(assert (=> b!1389123 m!1275025))

(assert (=> b!1389125 m!1275013))

(assert (=> b!1389125 m!1275013))

(assert (=> b!1389125 m!1275015))

(declare-fun m!1275027 () Bool)

(assert (=> bm!66660 m!1275027))

(assert (=> b!1389032 d!150081))

(declare-fun d!150087 () Bool)

(assert (=> d!150087 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun lt!610523 () Unit!46338)

(declare-fun choose!38 (array!95045 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46338)

(assert (=> d!150087 (= lt!610523 (choose!38 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> d!150087 (validMask!0 mask!2987)))

(assert (=> d!150087 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16) lt!610523)))

(declare-fun bs!40345 () Bool)

(assert (= bs!40345 d!150087))

(assert (=> bs!40345 m!1274935))

(declare-fun m!1275029 () Bool)

(assert (=> bs!40345 m!1275029))

(assert (=> bs!40345 m!1274945))

(assert (=> b!1389037 d!150087))

(declare-fun b!1389145 () Bool)

(declare-fun e!786988 () Bool)

(declare-fun e!786986 () Bool)

(assert (=> b!1389145 (= e!786988 e!786986)))

(declare-fun lt!610524 () (_ BitVec 64))

(assert (=> b!1389145 (= lt!610524 (select (arr!45895 a!2938) startIndex!16))))

(declare-fun lt!610526 () Unit!46338)

(assert (=> b!1389145 (= lt!610526 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610524 startIndex!16))))

(assert (=> b!1389145 (arrayContainsKey!0 a!2938 lt!610524 #b00000000000000000000000000000000)))

(declare-fun lt!610525 () Unit!46338)

(assert (=> b!1389145 (= lt!610525 lt!610526)))

(declare-fun res!929065 () Bool)

(assert (=> b!1389145 (= res!929065 (= (seekEntryOrOpen!0 (select (arr!45895 a!2938) startIndex!16) a!2938 mask!2987) (Found!10142 startIndex!16)))))

(assert (=> b!1389145 (=> (not res!929065) (not e!786986))))

(declare-fun b!1389146 () Bool)

(declare-fun call!66668 () Bool)

(assert (=> b!1389146 (= e!786986 call!66668)))

(declare-fun b!1389147 () Bool)

(declare-fun e!786987 () Bool)

(assert (=> b!1389147 (= e!786987 e!786988)))

(declare-fun c!129489 () Bool)

(assert (=> b!1389147 (= c!129489 (validKeyInArray!0 (select (arr!45895 a!2938) startIndex!16)))))

(declare-fun d!150089 () Bool)

(declare-fun res!929064 () Bool)

(assert (=> d!150089 (=> res!929064 e!786987)))

(assert (=> d!150089 (= res!929064 (bvsge startIndex!16 (size!46446 a!2938)))))

(assert (=> d!150089 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987) e!786987)))

(declare-fun bm!66665 () Bool)

(assert (=> bm!66665 (= call!66668 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun b!1389148 () Bool)

(assert (=> b!1389148 (= e!786988 call!66668)))

(assert (= (and d!150089 (not res!929064)) b!1389147))

(assert (= (and b!1389147 c!129489) b!1389145))

(assert (= (and b!1389147 (not c!129489)) b!1389148))

(assert (= (and b!1389145 res!929065) b!1389146))

(assert (= (or b!1389146 b!1389148) bm!66665))

(assert (=> b!1389145 m!1274919))

(declare-fun m!1275031 () Bool)

(assert (=> b!1389145 m!1275031))

(declare-fun m!1275033 () Bool)

(assert (=> b!1389145 m!1275033))

(assert (=> b!1389145 m!1274919))

(assert (=> b!1389145 m!1274933))

(assert (=> b!1389147 m!1274919))

(assert (=> b!1389147 m!1274919))

(assert (=> b!1389147 m!1274921))

(declare-fun m!1275035 () Bool)

(assert (=> bm!66665 m!1275035))

(assert (=> b!1389037 d!150089))

(declare-fun d!150091 () Bool)

(declare-fun e!787007 () Bool)

(assert (=> d!150091 e!787007))

(declare-fun res!929079 () Bool)

(assert (=> d!150091 (=> (not res!929079) (not e!787007))))

(assert (=> d!150091 (= res!929079 (and (or (bvslt i!1065 #b00000000000000000000000000000000) (bvsge i!1065 (size!46446 a!2938)) (and (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46446 a!2938)))) (or (bvslt i!1065 #b00000000000000000000000000000000) (bvsge i!1065 (size!46446 a!2938)) (and (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46446 a!2938)))) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46446 a!2938))))))

(declare-fun lt!610541 () Unit!46338)

(declare-fun choose!14 (array!95045 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46338)

(assert (=> d!150091 (= lt!610541 (choose!14 a!2938 i!1065 startIndex!16 mask!2987))))

(assert (=> d!150091 (validMask!0 mask!2987)))

(assert (=> d!150091 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987) lt!610541)))

(declare-fun b!1389172 () Bool)

(assert (=> b!1389172 (= e!787007 (= (seekEntryOrOpen!0 (select (arr!45895 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!95046 (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46446 a!2938)) mask!2987)))))

(assert (= (and d!150091 res!929079) b!1389172))

(declare-fun m!1275065 () Bool)

(assert (=> d!150091 m!1275065))

(assert (=> d!150091 m!1274945))

(assert (=> b!1389172 m!1274919))

(assert (=> b!1389172 m!1274933))

(assert (=> b!1389172 m!1274925))

(assert (=> b!1389172 m!1274919))

(assert (=> b!1389172 m!1274927))

(assert (=> b!1389172 m!1274925))

(declare-fun m!1275067 () Bool)

(assert (=> b!1389172 m!1275067))

(assert (=> b!1389037 d!150091))

(declare-fun e!787034 () SeekEntryResult!10142)

(declare-fun b!1389208 () Bool)

(declare-fun lt!610559 () SeekEntryResult!10142)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95045 (_ BitVec 32)) SeekEntryResult!10142)

(assert (=> b!1389208 (= e!787034 (seekKeyOrZeroReturnVacant!0 (x!124707 lt!610559) (index!42941 lt!610559) (index!42941 lt!610559) (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610481 mask!2987))))

(declare-fun b!1389209 () Bool)

(declare-fun e!787032 () SeekEntryResult!10142)

(assert (=> b!1389209 (= e!787032 (Found!10142 (index!42941 lt!610559)))))

(declare-fun b!1389210 () Bool)

(declare-fun e!787033 () SeekEntryResult!10142)

(assert (=> b!1389210 (= e!787033 Undefined!10142)))

(declare-fun d!150107 () Bool)

(declare-fun lt!610557 () SeekEntryResult!10142)

(get-info :version)

(assert (=> d!150107 (and (or ((_ is Undefined!10142) lt!610557) (not ((_ is Found!10142) lt!610557)) (and (bvsge (index!42940 lt!610557) #b00000000000000000000000000000000) (bvslt (index!42940 lt!610557) (size!46446 lt!610481)))) (or ((_ is Undefined!10142) lt!610557) ((_ is Found!10142) lt!610557) (not ((_ is MissingZero!10142) lt!610557)) (and (bvsge (index!42939 lt!610557) #b00000000000000000000000000000000) (bvslt (index!42939 lt!610557) (size!46446 lt!610481)))) (or ((_ is Undefined!10142) lt!610557) ((_ is Found!10142) lt!610557) ((_ is MissingZero!10142) lt!610557) (not ((_ is MissingVacant!10142) lt!610557)) (and (bvsge (index!42942 lt!610557) #b00000000000000000000000000000000) (bvslt (index!42942 lt!610557) (size!46446 lt!610481)))) (or ((_ is Undefined!10142) lt!610557) (ite ((_ is Found!10142) lt!610557) (= (select (arr!45895 lt!610481) (index!42940 lt!610557)) (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (ite ((_ is MissingZero!10142) lt!610557) (= (select (arr!45895 lt!610481) (index!42939 lt!610557)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10142) lt!610557) (= (select (arr!45895 lt!610481) (index!42942 lt!610557)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150107 (= lt!610557 e!787033)))

(declare-fun c!129508 () Bool)

(assert (=> d!150107 (= c!129508 (and ((_ is Intermediate!10142) lt!610559) (undefined!10954 lt!610559)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95045 (_ BitVec 32)) SeekEntryResult!10142)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!150107 (= lt!610559 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610481 mask!2987))))

(assert (=> d!150107 (validMask!0 mask!2987)))

(assert (=> d!150107 (= (seekEntryOrOpen!0 (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610481 mask!2987) lt!610557)))

(declare-fun b!1389211 () Bool)

(assert (=> b!1389211 (= e!787034 (MissingZero!10142 (index!42941 lt!610559)))))

(declare-fun b!1389212 () Bool)

(assert (=> b!1389212 (= e!787033 e!787032)))

(declare-fun lt!610558 () (_ BitVec 64))

(assert (=> b!1389212 (= lt!610558 (select (arr!45895 lt!610481) (index!42941 lt!610559)))))

(declare-fun c!129506 () Bool)

(assert (=> b!1389212 (= c!129506 (= lt!610558 (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(declare-fun b!1389213 () Bool)

(declare-fun c!129507 () Bool)

(assert (=> b!1389213 (= c!129507 (= lt!610558 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1389213 (= e!787032 e!787034)))

(assert (= (and d!150107 c!129508) b!1389210))

(assert (= (and d!150107 (not c!129508)) b!1389212))

(assert (= (and b!1389212 c!129506) b!1389209))

(assert (= (and b!1389212 (not c!129506)) b!1389213))

(assert (= (and b!1389213 c!129507) b!1389211))

(assert (= (and b!1389213 (not c!129507)) b!1389208))

(assert (=> b!1389208 m!1274925))

(declare-fun m!1275093 () Bool)

(assert (=> b!1389208 m!1275093))

(declare-fun m!1275095 () Bool)

(assert (=> d!150107 m!1275095))

(assert (=> d!150107 m!1274925))

(declare-fun m!1275097 () Bool)

(assert (=> d!150107 m!1275097))

(assert (=> d!150107 m!1275097))

(assert (=> d!150107 m!1274925))

(declare-fun m!1275099 () Bool)

(assert (=> d!150107 m!1275099))

(declare-fun m!1275101 () Bool)

(assert (=> d!150107 m!1275101))

(assert (=> d!150107 m!1274945))

(declare-fun m!1275103 () Bool)

(assert (=> d!150107 m!1275103))

(declare-fun m!1275105 () Bool)

(assert (=> b!1389212 m!1275105))

(assert (=> b!1389037 d!150107))

(declare-fun b!1389214 () Bool)

(declare-fun e!787037 () SeekEntryResult!10142)

(declare-fun lt!610562 () SeekEntryResult!10142)

(assert (=> b!1389214 (= e!787037 (seekKeyOrZeroReturnVacant!0 (x!124707 lt!610562) (index!42941 lt!610562) (index!42941 lt!610562) (select (arr!45895 a!2938) startIndex!16) a!2938 mask!2987))))

(declare-fun b!1389215 () Bool)

(declare-fun e!787035 () SeekEntryResult!10142)

(assert (=> b!1389215 (= e!787035 (Found!10142 (index!42941 lt!610562)))))

(declare-fun b!1389216 () Bool)

(declare-fun e!787036 () SeekEntryResult!10142)

(assert (=> b!1389216 (= e!787036 Undefined!10142)))

(declare-fun d!150123 () Bool)

(declare-fun lt!610560 () SeekEntryResult!10142)

(assert (=> d!150123 (and (or ((_ is Undefined!10142) lt!610560) (not ((_ is Found!10142) lt!610560)) (and (bvsge (index!42940 lt!610560) #b00000000000000000000000000000000) (bvslt (index!42940 lt!610560) (size!46446 a!2938)))) (or ((_ is Undefined!10142) lt!610560) ((_ is Found!10142) lt!610560) (not ((_ is MissingZero!10142) lt!610560)) (and (bvsge (index!42939 lt!610560) #b00000000000000000000000000000000) (bvslt (index!42939 lt!610560) (size!46446 a!2938)))) (or ((_ is Undefined!10142) lt!610560) ((_ is Found!10142) lt!610560) ((_ is MissingZero!10142) lt!610560) (not ((_ is MissingVacant!10142) lt!610560)) (and (bvsge (index!42942 lt!610560) #b00000000000000000000000000000000) (bvslt (index!42942 lt!610560) (size!46446 a!2938)))) (or ((_ is Undefined!10142) lt!610560) (ite ((_ is Found!10142) lt!610560) (= (select (arr!45895 a!2938) (index!42940 lt!610560)) (select (arr!45895 a!2938) startIndex!16)) (ite ((_ is MissingZero!10142) lt!610560) (= (select (arr!45895 a!2938) (index!42939 lt!610560)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10142) lt!610560) (= (select (arr!45895 a!2938) (index!42942 lt!610560)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150123 (= lt!610560 e!787036)))

(declare-fun c!129511 () Bool)

(assert (=> d!150123 (= c!129511 (and ((_ is Intermediate!10142) lt!610562) (undefined!10954 lt!610562)))))

(assert (=> d!150123 (= lt!610562 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45895 a!2938) startIndex!16) mask!2987) (select (arr!45895 a!2938) startIndex!16) a!2938 mask!2987))))

(assert (=> d!150123 (validMask!0 mask!2987)))

(assert (=> d!150123 (= (seekEntryOrOpen!0 (select (arr!45895 a!2938) startIndex!16) a!2938 mask!2987) lt!610560)))

(declare-fun b!1389217 () Bool)

(assert (=> b!1389217 (= e!787037 (MissingZero!10142 (index!42941 lt!610562)))))

(declare-fun b!1389218 () Bool)

(assert (=> b!1389218 (= e!787036 e!787035)))

(declare-fun lt!610561 () (_ BitVec 64))

(assert (=> b!1389218 (= lt!610561 (select (arr!45895 a!2938) (index!42941 lt!610562)))))

(declare-fun c!129509 () Bool)

(assert (=> b!1389218 (= c!129509 (= lt!610561 (select (arr!45895 a!2938) startIndex!16)))))

(declare-fun b!1389219 () Bool)

(declare-fun c!129510 () Bool)

(assert (=> b!1389219 (= c!129510 (= lt!610561 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1389219 (= e!787035 e!787037)))

(assert (= (and d!150123 c!129511) b!1389216))

(assert (= (and d!150123 (not c!129511)) b!1389218))

(assert (= (and b!1389218 c!129509) b!1389215))

(assert (= (and b!1389218 (not c!129509)) b!1389219))

(assert (= (and b!1389219 c!129510) b!1389217))

(assert (= (and b!1389219 (not c!129510)) b!1389214))

(assert (=> b!1389214 m!1274919))

(declare-fun m!1275107 () Bool)

(assert (=> b!1389214 m!1275107))

(declare-fun m!1275109 () Bool)

(assert (=> d!150123 m!1275109))

(assert (=> d!150123 m!1274919))

(declare-fun m!1275111 () Bool)

(assert (=> d!150123 m!1275111))

(assert (=> d!150123 m!1275111))

(assert (=> d!150123 m!1274919))

(declare-fun m!1275113 () Bool)

(assert (=> d!150123 m!1275113))

(declare-fun m!1275115 () Bool)

(assert (=> d!150123 m!1275115))

(assert (=> d!150123 m!1274945))

(declare-fun m!1275117 () Bool)

(assert (=> d!150123 m!1275117))

(declare-fun m!1275119 () Bool)

(assert (=> b!1389218 m!1275119))

(assert (=> b!1389037 d!150123))

(declare-fun b!1389220 () Bool)

(declare-fun e!787042 () Bool)

(declare-fun e!787040 () Bool)

(assert (=> b!1389220 (= e!787042 e!787040)))

(declare-fun lt!610565 () (_ BitVec 64))

(assert (=> b!1389220 (= lt!610565 (select (arr!45895 lt!610481) startIndex!16))))

(declare-fun lt!610567 () Unit!46338)

(assert (=> b!1389220 (= lt!610567 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!610481 lt!610565 startIndex!16))))

(assert (=> b!1389220 (arrayContainsKey!0 lt!610481 lt!610565 #b00000000000000000000000000000000)))

(declare-fun lt!610566 () Unit!46338)

(assert (=> b!1389220 (= lt!610566 lt!610567)))

(declare-fun res!929096 () Bool)

(assert (=> b!1389220 (= res!929096 (= (seekEntryOrOpen!0 (select (arr!45895 lt!610481) startIndex!16) lt!610481 mask!2987) (Found!10142 startIndex!16)))))

(assert (=> b!1389220 (=> (not res!929096) (not e!787040))))

(declare-fun b!1389221 () Bool)

(declare-fun call!66679 () Bool)

(assert (=> b!1389221 (= e!787040 call!66679)))

(declare-fun b!1389222 () Bool)

(declare-fun e!787041 () Bool)

(assert (=> b!1389222 (= e!787041 e!787042)))

(declare-fun c!129512 () Bool)

(assert (=> b!1389222 (= c!129512 (validKeyInArray!0 (select (arr!45895 lt!610481) startIndex!16)))))

(declare-fun d!150125 () Bool)

(declare-fun res!929093 () Bool)

(assert (=> d!150125 (=> res!929093 e!787041)))

(assert (=> d!150125 (= res!929093 (bvsge startIndex!16 (size!46446 lt!610481)))))

(assert (=> d!150125 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!16 lt!610481 mask!2987) e!787041)))

(declare-fun bm!66676 () Bool)

(assert (=> bm!66676 (= call!66679 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) lt!610481 mask!2987))))

(declare-fun b!1389223 () Bool)

(assert (=> b!1389223 (= e!787042 call!66679)))

(assert (= (and d!150125 (not res!929093)) b!1389222))

(assert (= (and b!1389222 c!129512) b!1389220))

(assert (= (and b!1389222 (not c!129512)) b!1389223))

(assert (= (and b!1389220 res!929096) b!1389221))

(assert (= (or b!1389221 b!1389223) bm!66676))

(declare-fun m!1275121 () Bool)

(assert (=> b!1389220 m!1275121))

(declare-fun m!1275123 () Bool)

(assert (=> b!1389220 m!1275123))

(declare-fun m!1275125 () Bool)

(assert (=> b!1389220 m!1275125))

(assert (=> b!1389220 m!1275121))

(declare-fun m!1275127 () Bool)

(assert (=> b!1389220 m!1275127))

(assert (=> b!1389222 m!1275121))

(assert (=> b!1389222 m!1275121))

(declare-fun m!1275129 () Bool)

(assert (=> b!1389222 m!1275129))

(declare-fun m!1275131 () Bool)

(assert (=> bm!66676 m!1275131))

(assert (=> b!1389031 d!150125))

(check-sat (not b!1389220) (not bm!66657) (not b!1389222) (not b!1389112) (not d!150091) (not b!1389125) (not d!150123) (not d!150087) (not b!1389113) (not b!1389214) (not b!1389145) (not b!1389123) (not b!1389172) (not b!1389147) (not bm!66676) (not d!150107) (not bm!66665) (not bm!66660) (not b!1389208) (not b!1389110))
(check-sat)
(get-model)

(assert (=> b!1389147 d!150071))

(declare-fun b!1389286 () Bool)

(declare-fun e!787079 () Bool)

(declare-fun e!787077 () Bool)

(assert (=> b!1389286 (= e!787079 e!787077)))

(declare-fun lt!610605 () (_ BitVec 64))

(assert (=> b!1389286 (= lt!610605 (select (arr!45895 lt!610481) (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(declare-fun lt!610607 () Unit!46338)

(assert (=> b!1389286 (= lt!610607 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!610481 lt!610605 (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(assert (=> b!1389286 (arrayContainsKey!0 lt!610481 lt!610605 #b00000000000000000000000000000000)))

(declare-fun lt!610606 () Unit!46338)

(assert (=> b!1389286 (= lt!610606 lt!610607)))

(declare-fun res!929106 () Bool)

(assert (=> b!1389286 (= res!929106 (= (seekEntryOrOpen!0 (select (arr!45895 lt!610481) (bvadd startIndex!16 #b00000000000000000000000000000001)) lt!610481 mask!2987) (Found!10142 (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(assert (=> b!1389286 (=> (not res!929106) (not e!787077))))

(declare-fun b!1389287 () Bool)

(declare-fun call!66682 () Bool)

(assert (=> b!1389287 (= e!787077 call!66682)))

(declare-fun b!1389288 () Bool)

(declare-fun e!787078 () Bool)

(assert (=> b!1389288 (= e!787078 e!787079)))

(declare-fun c!129539 () Bool)

(assert (=> b!1389288 (= c!129539 (validKeyInArray!0 (select (arr!45895 lt!610481) (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(declare-fun d!150143 () Bool)

(declare-fun res!929105 () Bool)

(assert (=> d!150143 (=> res!929105 e!787078)))

(assert (=> d!150143 (= res!929105 (bvsge (bvadd startIndex!16 #b00000000000000000000000000000001) (size!46446 lt!610481)))))

(assert (=> d!150143 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) lt!610481 mask!2987) e!787078)))

(declare-fun bm!66679 () Bool)

(assert (=> bm!66679 (= call!66682 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!610481 mask!2987))))

(declare-fun b!1389289 () Bool)

(assert (=> b!1389289 (= e!787079 call!66682)))

(assert (= (and d!150143 (not res!929105)) b!1389288))

(assert (= (and b!1389288 c!129539) b!1389286))

(assert (= (and b!1389288 (not c!129539)) b!1389289))

(assert (= (and b!1389286 res!929106) b!1389287))

(assert (= (or b!1389287 b!1389289) bm!66679))

(declare-fun m!1275217 () Bool)

(assert (=> b!1389286 m!1275217))

(declare-fun m!1275219 () Bool)

(assert (=> b!1389286 m!1275219))

(declare-fun m!1275221 () Bool)

(assert (=> b!1389286 m!1275221))

(assert (=> b!1389286 m!1275217))

(declare-fun m!1275223 () Bool)

(assert (=> b!1389286 m!1275223))

(assert (=> b!1389288 m!1275217))

(assert (=> b!1389288 m!1275217))

(declare-fun m!1275225 () Bool)

(assert (=> b!1389288 m!1275225))

(declare-fun m!1275227 () Bool)

(assert (=> bm!66679 m!1275227))

(assert (=> bm!66676 d!150143))

(declare-fun b!1389308 () Bool)

(declare-fun e!787091 () Bool)

(declare-fun e!787094 () Bool)

(assert (=> b!1389308 (= e!787091 e!787094)))

(declare-fun res!929113 () Bool)

(declare-fun lt!610613 () SeekEntryResult!10142)

(assert (=> b!1389308 (= res!929113 (and ((_ is Intermediate!10142) lt!610613) (not (undefined!10954 lt!610613)) (bvslt (x!124707 lt!610613) #b01111111111111111111111111111110) (bvsge (x!124707 lt!610613) #b00000000000000000000000000000000) (bvsge (x!124707 lt!610613) #b00000000000000000000000000000000)))))

(assert (=> b!1389308 (=> (not res!929113) (not e!787094))))

(declare-fun e!787093 () SeekEntryResult!10142)

(declare-fun b!1389309 () Bool)

(assert (=> b!1389309 (= e!787093 (Intermediate!10142 true (toIndex!0 (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun e!787090 () SeekEntryResult!10142)

(declare-fun b!1389310 () Bool)

(assert (=> b!1389310 (= e!787090 (Intermediate!10142 false (toIndex!0 (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun b!1389311 () Bool)

(assert (=> b!1389311 (and (bvsge (index!42941 lt!610613) #b00000000000000000000000000000000) (bvslt (index!42941 lt!610613) (size!46446 lt!610481)))))

(declare-fun res!929114 () Bool)

(assert (=> b!1389311 (= res!929114 (= (select (arr!45895 lt!610481) (index!42941 lt!610613)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!787092 () Bool)

(assert (=> b!1389311 (=> res!929114 e!787092)))

(declare-fun b!1389312 () Bool)

(assert (=> b!1389312 (and (bvsge (index!42941 lt!610613) #b00000000000000000000000000000000) (bvslt (index!42941 lt!610613) (size!46446 lt!610481)))))

(assert (=> b!1389312 (= e!787092 (= (select (arr!45895 lt!610481) (index!42941 lt!610613)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1389313 () Bool)

(assert (=> b!1389313 (= e!787091 (bvsge (x!124707 lt!610613) #b01111111111111111111111111111110))))

(declare-fun b!1389314 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389314 (= e!787090 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2987) (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610481 mask!2987))))

(declare-fun b!1389315 () Bool)

(assert (=> b!1389315 (= e!787093 e!787090)))

(declare-fun c!129548 () Bool)

(declare-fun lt!610612 () (_ BitVec 64))

(assert (=> b!1389315 (= c!129548 (or (= lt!610612 (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (= (bvadd lt!610612 lt!610612) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1389316 () Bool)

(assert (=> b!1389316 (and (bvsge (index!42941 lt!610613) #b00000000000000000000000000000000) (bvslt (index!42941 lt!610613) (size!46446 lt!610481)))))

(declare-fun res!929115 () Bool)

(assert (=> b!1389316 (= res!929115 (= (select (arr!45895 lt!610481) (index!42941 lt!610613)) (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(assert (=> b!1389316 (=> res!929115 e!787092)))

(assert (=> b!1389316 (= e!787094 e!787092)))

(declare-fun d!150145 () Bool)

(assert (=> d!150145 e!787091))

(declare-fun c!129546 () Bool)

(assert (=> d!150145 (= c!129546 (and ((_ is Intermediate!10142) lt!610613) (undefined!10954 lt!610613)))))

(assert (=> d!150145 (= lt!610613 e!787093)))

(declare-fun c!129547 () Bool)

(assert (=> d!150145 (= c!129547 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!150145 (= lt!610612 (select (arr!45895 lt!610481) (toIndex!0 (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987)))))

(assert (=> d!150145 (validMask!0 mask!2987)))

(assert (=> d!150145 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610481 mask!2987) lt!610613)))

(assert (= (and d!150145 c!129547) b!1389309))

(assert (= (and d!150145 (not c!129547)) b!1389315))

(assert (= (and b!1389315 c!129548) b!1389310))

(assert (= (and b!1389315 (not c!129548)) b!1389314))

(assert (= (and d!150145 c!129546) b!1389313))

(assert (= (and d!150145 (not c!129546)) b!1389308))

(assert (= (and b!1389308 res!929113) b!1389316))

(assert (= (and b!1389316 (not res!929115)) b!1389311))

(assert (= (and b!1389311 (not res!929114)) b!1389312))

(assert (=> d!150145 m!1275097))

(declare-fun m!1275229 () Bool)

(assert (=> d!150145 m!1275229))

(assert (=> d!150145 m!1274945))

(assert (=> b!1389314 m!1275097))

(declare-fun m!1275231 () Bool)

(assert (=> b!1389314 m!1275231))

(assert (=> b!1389314 m!1275231))

(assert (=> b!1389314 m!1274925))

(declare-fun m!1275233 () Bool)

(assert (=> b!1389314 m!1275233))

(declare-fun m!1275235 () Bool)

(assert (=> b!1389312 m!1275235))

(assert (=> b!1389311 m!1275235))

(assert (=> b!1389316 m!1275235))

(assert (=> d!150107 d!150145))

(declare-fun d!150147 () Bool)

(declare-fun lt!610619 () (_ BitVec 32))

(declare-fun lt!610618 () (_ BitVec 32))

(assert (=> d!150147 (= lt!610619 (bvmul (bvxor lt!610618 (bvlshr lt!610618 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150147 (= lt!610618 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (bvlshr (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150147 (and (bvsge mask!2987 #b00000000000000000000000000000000) (let ((res!929116 (let ((h!33629 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (bvlshr (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!124711 (bvmul (bvxor h!33629 (bvlshr h!33629 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!124711 (bvlshr x!124711 #b00000000000000000000000000001101)) mask!2987))))) (and (bvslt res!929116 (bvadd mask!2987 #b00000000000000000000000000000001)) (bvsge res!929116 #b00000000000000000000000000000000))))))

(assert (=> d!150147 (= (toIndex!0 (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (bvand (bvxor lt!610619 (bvlshr lt!610619 #b00000000000000000000000000001101)) mask!2987))))

(assert (=> d!150107 d!150147))

(assert (=> d!150107 d!150073))

(declare-fun b!1389317 () Bool)

(declare-fun e!787098 () Bool)

(declare-fun e!787095 () Bool)

(assert (=> b!1389317 (= e!787098 e!787095)))

(declare-fun c!129549 () Bool)

(assert (=> b!1389317 (= c!129549 (validKeyInArray!0 (select (arr!45895 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1389318 () Bool)

(declare-fun call!66683 () Bool)

(assert (=> b!1389318 (= e!787095 call!66683)))

(declare-fun b!1389319 () Bool)

(declare-fun e!787097 () Bool)

(assert (=> b!1389319 (= e!787097 e!787098)))

(declare-fun res!929118 () Bool)

(assert (=> b!1389319 (=> (not res!929118) (not e!787098))))

(declare-fun e!787096 () Bool)

(assert (=> b!1389319 (= res!929118 (not e!787096))))

(declare-fun res!929117 () Bool)

(assert (=> b!1389319 (=> (not res!929117) (not e!787096))))

(assert (=> b!1389319 (= res!929117 (validKeyInArray!0 (select (arr!45895 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1389320 () Bool)

(assert (=> b!1389320 (= e!787096 (contains!9790 (ite c!129481 (Cons!32406 (select (arr!45895 a!2938) #b00000000000000000000000000000000) Nil!32407) Nil!32407) (select (arr!45895 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!150149 () Bool)

(declare-fun res!929119 () Bool)

(assert (=> d!150149 (=> res!929119 e!787097)))

(assert (=> d!150149 (= res!929119 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46446 a!2938)))))

(assert (=> d!150149 (= (arrayNoDuplicates!0 a!2938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129481 (Cons!32406 (select (arr!45895 a!2938) #b00000000000000000000000000000000) Nil!32407) Nil!32407)) e!787097)))

(declare-fun b!1389321 () Bool)

(assert (=> b!1389321 (= e!787095 call!66683)))

(declare-fun bm!66680 () Bool)

(assert (=> bm!66680 (= call!66683 (arrayNoDuplicates!0 a!2938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!129549 (Cons!32406 (select (arr!45895 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!129481 (Cons!32406 (select (arr!45895 a!2938) #b00000000000000000000000000000000) Nil!32407) Nil!32407)) (ite c!129481 (Cons!32406 (select (arr!45895 a!2938) #b00000000000000000000000000000000) Nil!32407) Nil!32407))))))

(assert (= (and d!150149 (not res!929119)) b!1389319))

(assert (= (and b!1389319 res!929117) b!1389320))

(assert (= (and b!1389319 res!929118) b!1389317))

(assert (= (and b!1389317 c!129549) b!1389321))

(assert (= (and b!1389317 (not c!129549)) b!1389318))

(assert (= (or b!1389321 b!1389318) bm!66680))

(declare-fun m!1275237 () Bool)

(assert (=> b!1389317 m!1275237))

(assert (=> b!1389317 m!1275237))

(declare-fun m!1275239 () Bool)

(assert (=> b!1389317 m!1275239))

(assert (=> b!1389319 m!1275237))

(assert (=> b!1389319 m!1275237))

(assert (=> b!1389319 m!1275239))

(assert (=> b!1389320 m!1275237))

(assert (=> b!1389320 m!1275237))

(declare-fun m!1275241 () Bool)

(assert (=> b!1389320 m!1275241))

(assert (=> bm!66680 m!1275237))

(declare-fun m!1275243 () Bool)

(assert (=> bm!66680 m!1275243))

(assert (=> bm!66657 d!150149))

(declare-fun b!1389322 () Bool)

(declare-fun e!787101 () Bool)

(declare-fun e!787099 () Bool)

(assert (=> b!1389322 (= e!787101 e!787099)))

(declare-fun lt!610620 () (_ BitVec 64))

(assert (=> b!1389322 (= lt!610620 (select (arr!45895 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!610622 () Unit!46338)

(assert (=> b!1389322 (= lt!610622 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610620 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1389322 (arrayContainsKey!0 a!2938 lt!610620 #b00000000000000000000000000000000)))

(declare-fun lt!610621 () Unit!46338)

(assert (=> b!1389322 (= lt!610621 lt!610622)))

(declare-fun res!929121 () Bool)

(assert (=> b!1389322 (= res!929121 (= (seekEntryOrOpen!0 (select (arr!45895 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!2938 mask!2987) (Found!10142 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1389322 (=> (not res!929121) (not e!787099))))

(declare-fun b!1389323 () Bool)

(declare-fun call!66684 () Bool)

(assert (=> b!1389323 (= e!787099 call!66684)))

(declare-fun b!1389324 () Bool)

(declare-fun e!787100 () Bool)

(assert (=> b!1389324 (= e!787100 e!787101)))

(declare-fun c!129550 () Bool)

(assert (=> b!1389324 (= c!129550 (validKeyInArray!0 (select (arr!45895 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!150151 () Bool)

(declare-fun res!929120 () Bool)

(assert (=> d!150151 (=> res!929120 e!787100)))

(assert (=> d!150151 (= res!929120 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46446 a!2938)))))

(assert (=> d!150151 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2938 mask!2987) e!787100)))

(declare-fun bm!66681 () Bool)

(assert (=> bm!66681 (= call!66684 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun b!1389325 () Bool)

(assert (=> b!1389325 (= e!787101 call!66684)))

(assert (= (and d!150151 (not res!929120)) b!1389324))

(assert (= (and b!1389324 c!129550) b!1389322))

(assert (= (and b!1389324 (not c!129550)) b!1389325))

(assert (= (and b!1389322 res!929121) b!1389323))

(assert (= (or b!1389323 b!1389325) bm!66681))

(assert (=> b!1389322 m!1275237))

(declare-fun m!1275245 () Bool)

(assert (=> b!1389322 m!1275245))

(declare-fun m!1275247 () Bool)

(assert (=> b!1389322 m!1275247))

(assert (=> b!1389322 m!1275237))

(declare-fun m!1275249 () Bool)

(assert (=> b!1389322 m!1275249))

(assert (=> b!1389324 m!1275237))

(assert (=> b!1389324 m!1275237))

(assert (=> b!1389324 m!1275239))

(declare-fun m!1275251 () Bool)

(assert (=> bm!66681 m!1275251))

(assert (=> bm!66660 d!150151))

(assert (=> d!150087 d!150089))

(declare-fun d!150153 () Bool)

(assert (=> d!150153 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(assert (=> d!150153 true))

(declare-fun _$72!125 () Unit!46338)

(assert (=> d!150153 (= (choose!38 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16) _$72!125)))

(declare-fun bs!40348 () Bool)

(assert (= bs!40348 d!150153))

(assert (=> bs!40348 m!1274935))

(assert (=> d!150087 d!150153))

(assert (=> d!150087 d!150073))

(declare-fun d!150155 () Bool)

(assert (=> d!150155 (arrayContainsKey!0 a!2938 lt!610524 #b00000000000000000000000000000000)))

(declare-fun lt!610625 () Unit!46338)

(declare-fun choose!13 (array!95045 (_ BitVec 64) (_ BitVec 32)) Unit!46338)

(assert (=> d!150155 (= lt!610625 (choose!13 a!2938 lt!610524 startIndex!16))))

(assert (=> d!150155 (bvsge startIndex!16 #b00000000000000000000000000000000)))

(assert (=> d!150155 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610524 startIndex!16) lt!610625)))

(declare-fun bs!40349 () Bool)

(assert (= bs!40349 d!150155))

(assert (=> bs!40349 m!1275033))

(declare-fun m!1275253 () Bool)

(assert (=> bs!40349 m!1275253))

(assert (=> b!1389145 d!150155))

(declare-fun d!150157 () Bool)

(declare-fun res!929126 () Bool)

(declare-fun e!787106 () Bool)

(assert (=> d!150157 (=> res!929126 e!787106)))

(assert (=> d!150157 (= res!929126 (= (select (arr!45895 a!2938) #b00000000000000000000000000000000) lt!610524))))

(assert (=> d!150157 (= (arrayContainsKey!0 a!2938 lt!610524 #b00000000000000000000000000000000) e!787106)))

(declare-fun b!1389330 () Bool)

(declare-fun e!787107 () Bool)

(assert (=> b!1389330 (= e!787106 e!787107)))

(declare-fun res!929127 () Bool)

(assert (=> b!1389330 (=> (not res!929127) (not e!787107))))

(assert (=> b!1389330 (= res!929127 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46446 a!2938)))))

(declare-fun b!1389331 () Bool)

(assert (=> b!1389331 (= e!787107 (arrayContainsKey!0 a!2938 lt!610524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!150157 (not res!929126)) b!1389330))

(assert (= (and b!1389330 res!929127) b!1389331))

(assert (=> d!150157 m!1275013))

(declare-fun m!1275255 () Bool)

(assert (=> b!1389331 m!1275255))

(assert (=> b!1389145 d!150157))

(assert (=> b!1389145 d!150123))

(declare-fun d!150159 () Bool)

(assert (=> d!150159 (= (validKeyInArray!0 (select (arr!45895 lt!610481) startIndex!16)) (and (not (= (select (arr!45895 lt!610481) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45895 lt!610481) startIndex!16) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1389222 d!150159))

(declare-fun b!1389332 () Bool)

(declare-fun e!787110 () Bool)

(declare-fun e!787108 () Bool)

(assert (=> b!1389332 (= e!787110 e!787108)))

(declare-fun lt!610626 () (_ BitVec 64))

(assert (=> b!1389332 (= lt!610626 (select (arr!45895 a!2938) (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(declare-fun lt!610628 () Unit!46338)

(assert (=> b!1389332 (= lt!610628 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610626 (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(assert (=> b!1389332 (arrayContainsKey!0 a!2938 lt!610626 #b00000000000000000000000000000000)))

(declare-fun lt!610627 () Unit!46338)

(assert (=> b!1389332 (= lt!610627 lt!610628)))

(declare-fun res!929129 () Bool)

(assert (=> b!1389332 (= res!929129 (= (seekEntryOrOpen!0 (select (arr!45895 a!2938) (bvadd startIndex!16 #b00000000000000000000000000000001)) a!2938 mask!2987) (Found!10142 (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(assert (=> b!1389332 (=> (not res!929129) (not e!787108))))

(declare-fun b!1389333 () Bool)

(declare-fun call!66685 () Bool)

(assert (=> b!1389333 (= e!787108 call!66685)))

(declare-fun b!1389334 () Bool)

(declare-fun e!787109 () Bool)

(assert (=> b!1389334 (= e!787109 e!787110)))

(declare-fun c!129551 () Bool)

(assert (=> b!1389334 (= c!129551 (validKeyInArray!0 (select (arr!45895 a!2938) (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(declare-fun d!150161 () Bool)

(declare-fun res!929128 () Bool)

(assert (=> d!150161 (=> res!929128 e!787109)))

(assert (=> d!150161 (= res!929128 (bvsge (bvadd startIndex!16 #b00000000000000000000000000000001) (size!46446 a!2938)))))

(assert (=> d!150161 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) a!2938 mask!2987) e!787109)))

(declare-fun bm!66682 () Bool)

(assert (=> bm!66682 (= call!66685 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun b!1389335 () Bool)

(assert (=> b!1389335 (= e!787110 call!66685)))

(assert (= (and d!150161 (not res!929128)) b!1389334))

(assert (= (and b!1389334 c!129551) b!1389332))

(assert (= (and b!1389334 (not c!129551)) b!1389335))

(assert (= (and b!1389332 res!929129) b!1389333))

(assert (= (or b!1389333 b!1389335) bm!66682))

(declare-fun m!1275257 () Bool)

(assert (=> b!1389332 m!1275257))

(declare-fun m!1275259 () Bool)

(assert (=> b!1389332 m!1275259))

(declare-fun m!1275261 () Bool)

(assert (=> b!1389332 m!1275261))

(assert (=> b!1389332 m!1275257))

(declare-fun m!1275263 () Bool)

(assert (=> b!1389332 m!1275263))

(assert (=> b!1389334 m!1275257))

(assert (=> b!1389334 m!1275257))

(declare-fun m!1275265 () Bool)

(assert (=> b!1389334 m!1275265))

(declare-fun m!1275267 () Bool)

(assert (=> bm!66682 m!1275267))

(assert (=> bm!66665 d!150161))

(declare-fun d!150163 () Bool)

(assert (=> d!150163 (= (validKeyInArray!0 (select (arr!45895 a!2938) #b00000000000000000000000000000000)) (and (not (= (select (arr!45895 a!2938) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45895 a!2938) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1389110 d!150163))

(assert (=> b!1389172 d!150123))

(declare-fun lt!610631 () SeekEntryResult!10142)

(declare-fun e!787113 () SeekEntryResult!10142)

(declare-fun b!1389336 () Bool)

(assert (=> b!1389336 (= e!787113 (seekKeyOrZeroReturnVacant!0 (x!124707 lt!610631) (index!42941 lt!610631) (index!42941 lt!610631) (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!95046 (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46446 a!2938)) mask!2987))))

(declare-fun b!1389337 () Bool)

(declare-fun e!787111 () SeekEntryResult!10142)

(assert (=> b!1389337 (= e!787111 (Found!10142 (index!42941 lt!610631)))))

(declare-fun b!1389338 () Bool)

(declare-fun e!787112 () SeekEntryResult!10142)

(assert (=> b!1389338 (= e!787112 Undefined!10142)))

(declare-fun lt!610629 () SeekEntryResult!10142)

(declare-fun d!150165 () Bool)

(assert (=> d!150165 (and (or ((_ is Undefined!10142) lt!610629) (not ((_ is Found!10142) lt!610629)) (and (bvsge (index!42940 lt!610629) #b00000000000000000000000000000000) (bvslt (index!42940 lt!610629) (size!46446 (array!95046 (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46446 a!2938)))))) (or ((_ is Undefined!10142) lt!610629) ((_ is Found!10142) lt!610629) (not ((_ is MissingZero!10142) lt!610629)) (and (bvsge (index!42939 lt!610629) #b00000000000000000000000000000000) (bvslt (index!42939 lt!610629) (size!46446 (array!95046 (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46446 a!2938)))))) (or ((_ is Undefined!10142) lt!610629) ((_ is Found!10142) lt!610629) ((_ is MissingZero!10142) lt!610629) (not ((_ is MissingVacant!10142) lt!610629)) (and (bvsge (index!42942 lt!610629) #b00000000000000000000000000000000) (bvslt (index!42942 lt!610629) (size!46446 (array!95046 (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46446 a!2938)))))) (or ((_ is Undefined!10142) lt!610629) (ite ((_ is Found!10142) lt!610629) (= (select (arr!45895 (array!95046 (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46446 a!2938))) (index!42940 lt!610629)) (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (ite ((_ is MissingZero!10142) lt!610629) (= (select (arr!45895 (array!95046 (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46446 a!2938))) (index!42939 lt!610629)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10142) lt!610629) (= (select (arr!45895 (array!95046 (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46446 a!2938))) (index!42942 lt!610629)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150165 (= lt!610629 e!787112)))

(declare-fun c!129554 () Bool)

(assert (=> d!150165 (= c!129554 (and ((_ is Intermediate!10142) lt!610631) (undefined!10954 lt!610631)))))

(assert (=> d!150165 (= lt!610631 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!95046 (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46446 a!2938)) mask!2987))))

(assert (=> d!150165 (validMask!0 mask!2987)))

(assert (=> d!150165 (= (seekEntryOrOpen!0 (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!95046 (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46446 a!2938)) mask!2987) lt!610629)))

(declare-fun b!1389339 () Bool)

(assert (=> b!1389339 (= e!787113 (MissingZero!10142 (index!42941 lt!610631)))))

(declare-fun b!1389340 () Bool)

(assert (=> b!1389340 (= e!787112 e!787111)))

(declare-fun lt!610630 () (_ BitVec 64))

(assert (=> b!1389340 (= lt!610630 (select (arr!45895 (array!95046 (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46446 a!2938))) (index!42941 lt!610631)))))

(declare-fun c!129552 () Bool)

(assert (=> b!1389340 (= c!129552 (= lt!610630 (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(declare-fun b!1389341 () Bool)

(declare-fun c!129553 () Bool)

(assert (=> b!1389341 (= c!129553 (= lt!610630 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1389341 (= e!787111 e!787113)))

(assert (= (and d!150165 c!129554) b!1389338))

(assert (= (and d!150165 (not c!129554)) b!1389340))

(assert (= (and b!1389340 c!129552) b!1389337))

(assert (= (and b!1389340 (not c!129552)) b!1389341))

(assert (= (and b!1389341 c!129553) b!1389339))

(assert (= (and b!1389341 (not c!129553)) b!1389336))

(assert (=> b!1389336 m!1274925))

(declare-fun m!1275269 () Bool)

(assert (=> b!1389336 m!1275269))

(declare-fun m!1275271 () Bool)

(assert (=> d!150165 m!1275271))

(assert (=> d!150165 m!1274925))

(assert (=> d!150165 m!1275097))

(assert (=> d!150165 m!1275097))

(assert (=> d!150165 m!1274925))

(declare-fun m!1275273 () Bool)

(assert (=> d!150165 m!1275273))

(declare-fun m!1275275 () Bool)

(assert (=> d!150165 m!1275275))

(assert (=> d!150165 m!1274945))

(declare-fun m!1275277 () Bool)

(assert (=> d!150165 m!1275277))

(declare-fun m!1275279 () Bool)

(assert (=> b!1389340 m!1275279))

(assert (=> b!1389172 d!150165))

(declare-fun d!150167 () Bool)

(assert (=> d!150167 (= (seekEntryOrOpen!0 (select (arr!45895 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!95046 (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46446 a!2938)) mask!2987))))

(assert (=> d!150167 true))

(declare-fun _$42!22 () Unit!46338)

(assert (=> d!150167 (= (choose!14 a!2938 i!1065 startIndex!16 mask!2987) _$42!22)))

(declare-fun bs!40350 () Bool)

(assert (= bs!40350 d!150167))

(assert (=> bs!40350 m!1274919))

(assert (=> bs!40350 m!1274925))

(assert (=> bs!40350 m!1274927))

(assert (=> bs!40350 m!1274919))

(assert (=> bs!40350 m!1274933))

(assert (=> bs!40350 m!1274925))

(assert (=> bs!40350 m!1275067))

(assert (=> d!150091 d!150167))

(assert (=> d!150091 d!150073))

(declare-fun d!150169 () Bool)

(declare-fun lt!610634 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!756 (List!32410) (InoxSet (_ BitVec 64)))

(assert (=> d!150169 (= lt!610634 (select (content!756 Nil!32407) (select (arr!45895 a!2938) #b00000000000000000000000000000000)))))

(declare-fun e!787119 () Bool)

(assert (=> d!150169 (= lt!610634 e!787119)))

(declare-fun res!929134 () Bool)

(assert (=> d!150169 (=> (not res!929134) (not e!787119))))

(assert (=> d!150169 (= res!929134 ((_ is Cons!32406) Nil!32407))))

(assert (=> d!150169 (= (contains!9790 Nil!32407 (select (arr!45895 a!2938) #b00000000000000000000000000000000)) lt!610634)))

(declare-fun b!1389346 () Bool)

(declare-fun e!787118 () Bool)

(assert (=> b!1389346 (= e!787119 e!787118)))

(declare-fun res!929135 () Bool)

(assert (=> b!1389346 (=> res!929135 e!787118)))

(assert (=> b!1389346 (= res!929135 (= (h!33626 Nil!32407) (select (arr!45895 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1389347 () Bool)

(assert (=> b!1389347 (= e!787118 (contains!9790 (t!47096 Nil!32407) (select (arr!45895 a!2938) #b00000000000000000000000000000000)))))

(assert (= (and d!150169 res!929134) b!1389346))

(assert (= (and b!1389346 (not res!929135)) b!1389347))

(declare-fun m!1275281 () Bool)

(assert (=> d!150169 m!1275281))

(assert (=> d!150169 m!1275013))

(declare-fun m!1275283 () Bool)

(assert (=> d!150169 m!1275283))

(assert (=> b!1389347 m!1275013))

(declare-fun m!1275285 () Bool)

(assert (=> b!1389347 m!1275285))

(assert (=> b!1389113 d!150169))

(assert (=> b!1389125 d!150163))

(declare-fun d!150171 () Bool)

(assert (=> d!150171 (arrayContainsKey!0 lt!610481 lt!610565 #b00000000000000000000000000000000)))

(declare-fun lt!610635 () Unit!46338)

(assert (=> d!150171 (= lt!610635 (choose!13 lt!610481 lt!610565 startIndex!16))))

(assert (=> d!150171 (bvsge startIndex!16 #b00000000000000000000000000000000)))

(assert (=> d!150171 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!610481 lt!610565 startIndex!16) lt!610635)))

(declare-fun bs!40351 () Bool)

(assert (= bs!40351 d!150171))

(assert (=> bs!40351 m!1275125))

(declare-fun m!1275287 () Bool)

(assert (=> bs!40351 m!1275287))

(assert (=> b!1389220 d!150171))

(declare-fun d!150173 () Bool)

(declare-fun res!929136 () Bool)

(declare-fun e!787120 () Bool)

(assert (=> d!150173 (=> res!929136 e!787120)))

(assert (=> d!150173 (= res!929136 (= (select (arr!45895 lt!610481) #b00000000000000000000000000000000) lt!610565))))

(assert (=> d!150173 (= (arrayContainsKey!0 lt!610481 lt!610565 #b00000000000000000000000000000000) e!787120)))

(declare-fun b!1389348 () Bool)

(declare-fun e!787121 () Bool)

(assert (=> b!1389348 (= e!787120 e!787121)))

(declare-fun res!929137 () Bool)

(assert (=> b!1389348 (=> (not res!929137) (not e!787121))))

(assert (=> b!1389348 (= res!929137 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46446 lt!610481)))))

(declare-fun b!1389349 () Bool)

(assert (=> b!1389349 (= e!787121 (arrayContainsKey!0 lt!610481 lt!610565 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!150173 (not res!929136)) b!1389348))

(assert (= (and b!1389348 res!929137) b!1389349))

(declare-fun m!1275289 () Bool)

(assert (=> d!150173 m!1275289))

(declare-fun m!1275291 () Bool)

(assert (=> b!1389349 m!1275291))

(assert (=> b!1389220 d!150173))

(declare-fun lt!610638 () SeekEntryResult!10142)

(declare-fun e!787124 () SeekEntryResult!10142)

(declare-fun b!1389350 () Bool)

(assert (=> b!1389350 (= e!787124 (seekKeyOrZeroReturnVacant!0 (x!124707 lt!610638) (index!42941 lt!610638) (index!42941 lt!610638) (select (arr!45895 lt!610481) startIndex!16) lt!610481 mask!2987))))

(declare-fun b!1389351 () Bool)

(declare-fun e!787122 () SeekEntryResult!10142)

(assert (=> b!1389351 (= e!787122 (Found!10142 (index!42941 lt!610638)))))

(declare-fun b!1389352 () Bool)

(declare-fun e!787123 () SeekEntryResult!10142)

(assert (=> b!1389352 (= e!787123 Undefined!10142)))

(declare-fun d!150175 () Bool)

(declare-fun lt!610636 () SeekEntryResult!10142)

(assert (=> d!150175 (and (or ((_ is Undefined!10142) lt!610636) (not ((_ is Found!10142) lt!610636)) (and (bvsge (index!42940 lt!610636) #b00000000000000000000000000000000) (bvslt (index!42940 lt!610636) (size!46446 lt!610481)))) (or ((_ is Undefined!10142) lt!610636) ((_ is Found!10142) lt!610636) (not ((_ is MissingZero!10142) lt!610636)) (and (bvsge (index!42939 lt!610636) #b00000000000000000000000000000000) (bvslt (index!42939 lt!610636) (size!46446 lt!610481)))) (or ((_ is Undefined!10142) lt!610636) ((_ is Found!10142) lt!610636) ((_ is MissingZero!10142) lt!610636) (not ((_ is MissingVacant!10142) lt!610636)) (and (bvsge (index!42942 lt!610636) #b00000000000000000000000000000000) (bvslt (index!42942 lt!610636) (size!46446 lt!610481)))) (or ((_ is Undefined!10142) lt!610636) (ite ((_ is Found!10142) lt!610636) (= (select (arr!45895 lt!610481) (index!42940 lt!610636)) (select (arr!45895 lt!610481) startIndex!16)) (ite ((_ is MissingZero!10142) lt!610636) (= (select (arr!45895 lt!610481) (index!42939 lt!610636)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10142) lt!610636) (= (select (arr!45895 lt!610481) (index!42942 lt!610636)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150175 (= lt!610636 e!787123)))

(declare-fun c!129557 () Bool)

(assert (=> d!150175 (= c!129557 (and ((_ is Intermediate!10142) lt!610638) (undefined!10954 lt!610638)))))

(assert (=> d!150175 (= lt!610638 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45895 lt!610481) startIndex!16) mask!2987) (select (arr!45895 lt!610481) startIndex!16) lt!610481 mask!2987))))

(assert (=> d!150175 (validMask!0 mask!2987)))

(assert (=> d!150175 (= (seekEntryOrOpen!0 (select (arr!45895 lt!610481) startIndex!16) lt!610481 mask!2987) lt!610636)))

(declare-fun b!1389353 () Bool)

(assert (=> b!1389353 (= e!787124 (MissingZero!10142 (index!42941 lt!610638)))))

(declare-fun b!1389354 () Bool)

(assert (=> b!1389354 (= e!787123 e!787122)))

(declare-fun lt!610637 () (_ BitVec 64))

(assert (=> b!1389354 (= lt!610637 (select (arr!45895 lt!610481) (index!42941 lt!610638)))))

(declare-fun c!129555 () Bool)

(assert (=> b!1389354 (= c!129555 (= lt!610637 (select (arr!45895 lt!610481) startIndex!16)))))

(declare-fun b!1389355 () Bool)

(declare-fun c!129556 () Bool)

(assert (=> b!1389355 (= c!129556 (= lt!610637 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1389355 (= e!787122 e!787124)))

(assert (= (and d!150175 c!129557) b!1389352))

(assert (= (and d!150175 (not c!129557)) b!1389354))

(assert (= (and b!1389354 c!129555) b!1389351))

(assert (= (and b!1389354 (not c!129555)) b!1389355))

(assert (= (and b!1389355 c!129556) b!1389353))

(assert (= (and b!1389355 (not c!129556)) b!1389350))

(assert (=> b!1389350 m!1275121))

(declare-fun m!1275293 () Bool)

(assert (=> b!1389350 m!1275293))

(declare-fun m!1275295 () Bool)

(assert (=> d!150175 m!1275295))

(assert (=> d!150175 m!1275121))

(declare-fun m!1275297 () Bool)

(assert (=> d!150175 m!1275297))

(assert (=> d!150175 m!1275297))

(assert (=> d!150175 m!1275121))

(declare-fun m!1275299 () Bool)

(assert (=> d!150175 m!1275299))

(declare-fun m!1275301 () Bool)

(assert (=> d!150175 m!1275301))

(assert (=> d!150175 m!1274945))

(declare-fun m!1275303 () Bool)

(assert (=> d!150175 m!1275303))

(declare-fun m!1275305 () Bool)

(assert (=> b!1389354 m!1275305))

(assert (=> b!1389220 d!150175))

(assert (=> b!1389112 d!150163))

(declare-fun d!150177 () Bool)

(declare-fun lt!610644 () SeekEntryResult!10142)

(assert (=> d!150177 (and (or ((_ is Undefined!10142) lt!610644) (not ((_ is Found!10142) lt!610644)) (and (bvsge (index!42940 lt!610644) #b00000000000000000000000000000000) (bvslt (index!42940 lt!610644) (size!46446 a!2938)))) (or ((_ is Undefined!10142) lt!610644) ((_ is Found!10142) lt!610644) (not ((_ is MissingVacant!10142) lt!610644)) (not (= (index!42942 lt!610644) (index!42941 lt!610562))) (and (bvsge (index!42942 lt!610644) #b00000000000000000000000000000000) (bvslt (index!42942 lt!610644) (size!46446 a!2938)))) (or ((_ is Undefined!10142) lt!610644) (ite ((_ is Found!10142) lt!610644) (= (select (arr!45895 a!2938) (index!42940 lt!610644)) (select (arr!45895 a!2938) startIndex!16)) (and ((_ is MissingVacant!10142) lt!610644) (= (index!42942 lt!610644) (index!42941 lt!610562)) (= (select (arr!45895 a!2938) (index!42942 lt!610644)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!787133 () SeekEntryResult!10142)

(assert (=> d!150177 (= lt!610644 e!787133)))

(declare-fun c!129566 () Bool)

(assert (=> d!150177 (= c!129566 (bvsge (x!124707 lt!610562) #b01111111111111111111111111111110))))

(declare-fun lt!610643 () (_ BitVec 64))

(assert (=> d!150177 (= lt!610643 (select (arr!45895 a!2938) (index!42941 lt!610562)))))

(assert (=> d!150177 (validMask!0 mask!2987)))

(assert (=> d!150177 (= (seekKeyOrZeroReturnVacant!0 (x!124707 lt!610562) (index!42941 lt!610562) (index!42941 lt!610562) (select (arr!45895 a!2938) startIndex!16) a!2938 mask!2987) lt!610644)))

(declare-fun b!1389368 () Bool)

(declare-fun e!787131 () SeekEntryResult!10142)

(assert (=> b!1389368 (= e!787131 (Found!10142 (index!42941 lt!610562)))))

(declare-fun b!1389369 () Bool)

(assert (=> b!1389369 (= e!787133 e!787131)))

(declare-fun c!129564 () Bool)

(assert (=> b!1389369 (= c!129564 (= lt!610643 (select (arr!45895 a!2938) startIndex!16)))))

(declare-fun b!1389370 () Bool)

(declare-fun e!787132 () SeekEntryResult!10142)

(assert (=> b!1389370 (= e!787132 (MissingVacant!10142 (index!42941 lt!610562)))))

(declare-fun b!1389371 () Bool)

(assert (=> b!1389371 (= e!787133 Undefined!10142)))

(declare-fun b!1389372 () Bool)

(assert (=> b!1389372 (= e!787132 (seekKeyOrZeroReturnVacant!0 (bvadd (x!124707 lt!610562) #b00000000000000000000000000000001) (nextIndex!0 (index!42941 lt!610562) (bvadd (x!124707 lt!610562) #b00000000000000000000000000000001) mask!2987) (index!42941 lt!610562) (select (arr!45895 a!2938) startIndex!16) a!2938 mask!2987))))

(declare-fun b!1389373 () Bool)

(declare-fun c!129565 () Bool)

(assert (=> b!1389373 (= c!129565 (= lt!610643 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1389373 (= e!787131 e!787132)))

(assert (= (and d!150177 c!129566) b!1389371))

(assert (= (and d!150177 (not c!129566)) b!1389369))

(assert (= (and b!1389369 c!129564) b!1389368))

(assert (= (and b!1389369 (not c!129564)) b!1389373))

(assert (= (and b!1389373 c!129565) b!1389370))

(assert (= (and b!1389373 (not c!129565)) b!1389372))

(declare-fun m!1275307 () Bool)

(assert (=> d!150177 m!1275307))

(declare-fun m!1275309 () Bool)

(assert (=> d!150177 m!1275309))

(assert (=> d!150177 m!1275119))

(assert (=> d!150177 m!1274945))

(declare-fun m!1275311 () Bool)

(assert (=> b!1389372 m!1275311))

(assert (=> b!1389372 m!1275311))

(assert (=> b!1389372 m!1274919))

(declare-fun m!1275313 () Bool)

(assert (=> b!1389372 m!1275313))

(assert (=> b!1389214 d!150177))

(declare-fun lt!610646 () SeekEntryResult!10142)

(declare-fun d!150179 () Bool)

(assert (=> d!150179 (and (or ((_ is Undefined!10142) lt!610646) (not ((_ is Found!10142) lt!610646)) (and (bvsge (index!42940 lt!610646) #b00000000000000000000000000000000) (bvslt (index!42940 lt!610646) (size!46446 lt!610481)))) (or ((_ is Undefined!10142) lt!610646) ((_ is Found!10142) lt!610646) (not ((_ is MissingVacant!10142) lt!610646)) (not (= (index!42942 lt!610646) (index!42941 lt!610559))) (and (bvsge (index!42942 lt!610646) #b00000000000000000000000000000000) (bvslt (index!42942 lt!610646) (size!46446 lt!610481)))) (or ((_ is Undefined!10142) lt!610646) (ite ((_ is Found!10142) lt!610646) (= (select (arr!45895 lt!610481) (index!42940 lt!610646)) (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (and ((_ is MissingVacant!10142) lt!610646) (= (index!42942 lt!610646) (index!42941 lt!610559)) (= (select (arr!45895 lt!610481) (index!42942 lt!610646)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!787136 () SeekEntryResult!10142)

(assert (=> d!150179 (= lt!610646 e!787136)))

(declare-fun c!129569 () Bool)

(assert (=> d!150179 (= c!129569 (bvsge (x!124707 lt!610559) #b01111111111111111111111111111110))))

(declare-fun lt!610645 () (_ BitVec 64))

(assert (=> d!150179 (= lt!610645 (select (arr!45895 lt!610481) (index!42941 lt!610559)))))

(assert (=> d!150179 (validMask!0 mask!2987)))

(assert (=> d!150179 (= (seekKeyOrZeroReturnVacant!0 (x!124707 lt!610559) (index!42941 lt!610559) (index!42941 lt!610559) (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610481 mask!2987) lt!610646)))

(declare-fun b!1389374 () Bool)

(declare-fun e!787134 () SeekEntryResult!10142)

(assert (=> b!1389374 (= e!787134 (Found!10142 (index!42941 lt!610559)))))

(declare-fun b!1389375 () Bool)

(assert (=> b!1389375 (= e!787136 e!787134)))

(declare-fun c!129567 () Bool)

(assert (=> b!1389375 (= c!129567 (= lt!610645 (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(declare-fun b!1389376 () Bool)

(declare-fun e!787135 () SeekEntryResult!10142)

(assert (=> b!1389376 (= e!787135 (MissingVacant!10142 (index!42941 lt!610559)))))

(declare-fun b!1389377 () Bool)

(assert (=> b!1389377 (= e!787136 Undefined!10142)))

(declare-fun b!1389378 () Bool)

(assert (=> b!1389378 (= e!787135 (seekKeyOrZeroReturnVacant!0 (bvadd (x!124707 lt!610559) #b00000000000000000000000000000001) (nextIndex!0 (index!42941 lt!610559) (bvadd (x!124707 lt!610559) #b00000000000000000000000000000001) mask!2987) (index!42941 lt!610559) (select (store (arr!45895 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610481 mask!2987))))

(declare-fun b!1389379 () Bool)

(declare-fun c!129568 () Bool)

(assert (=> b!1389379 (= c!129568 (= lt!610645 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1389379 (= e!787134 e!787135)))

(assert (= (and d!150179 c!129569) b!1389377))

(assert (= (and d!150179 (not c!129569)) b!1389375))

(assert (= (and b!1389375 c!129567) b!1389374))

(assert (= (and b!1389375 (not c!129567)) b!1389379))

(assert (= (and b!1389379 c!129568) b!1389376))

(assert (= (and b!1389379 (not c!129568)) b!1389378))

(declare-fun m!1275315 () Bool)

(assert (=> d!150179 m!1275315))

(declare-fun m!1275317 () Bool)

(assert (=> d!150179 m!1275317))

(assert (=> d!150179 m!1275105))

(assert (=> d!150179 m!1274945))

(declare-fun m!1275319 () Bool)

(assert (=> b!1389378 m!1275319))

(assert (=> b!1389378 m!1275319))

(assert (=> b!1389378 m!1274925))

(declare-fun m!1275321 () Bool)

(assert (=> b!1389378 m!1275321))

(assert (=> b!1389208 d!150179))

(declare-fun d!150181 () Bool)

(assert (=> d!150181 (arrayContainsKey!0 a!2938 lt!610512 #b00000000000000000000000000000000)))

(declare-fun lt!610647 () Unit!46338)

(assert (=> d!150181 (= lt!610647 (choose!13 a!2938 lt!610512 #b00000000000000000000000000000000))))

(assert (=> d!150181 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!150181 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610512 #b00000000000000000000000000000000) lt!610647)))

(declare-fun bs!40352 () Bool)

(assert (= bs!40352 d!150181))

(assert (=> bs!40352 m!1275023))

(declare-fun m!1275323 () Bool)

(assert (=> bs!40352 m!1275323))

(assert (=> b!1389123 d!150181))

(declare-fun d!150183 () Bool)

(declare-fun res!929138 () Bool)

(declare-fun e!787137 () Bool)

(assert (=> d!150183 (=> res!929138 e!787137)))

(assert (=> d!150183 (= res!929138 (= (select (arr!45895 a!2938) #b00000000000000000000000000000000) lt!610512))))

(assert (=> d!150183 (= (arrayContainsKey!0 a!2938 lt!610512 #b00000000000000000000000000000000) e!787137)))

(declare-fun b!1389380 () Bool)

(declare-fun e!787138 () Bool)

(assert (=> b!1389380 (= e!787137 e!787138)))

(declare-fun res!929139 () Bool)

(assert (=> b!1389380 (=> (not res!929139) (not e!787138))))

(assert (=> b!1389380 (= res!929139 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46446 a!2938)))))

(declare-fun b!1389381 () Bool)

(assert (=> b!1389381 (= e!787138 (arrayContainsKey!0 a!2938 lt!610512 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!150183 (not res!929138)) b!1389380))

(assert (= (and b!1389380 res!929139) b!1389381))

(assert (=> d!150183 m!1275013))

(declare-fun m!1275325 () Bool)

(assert (=> b!1389381 m!1275325))

(assert (=> b!1389123 d!150183))

(declare-fun b!1389382 () Bool)

(declare-fun e!787141 () SeekEntryResult!10142)

(declare-fun lt!610650 () SeekEntryResult!10142)

(assert (=> b!1389382 (= e!787141 (seekKeyOrZeroReturnVacant!0 (x!124707 lt!610650) (index!42941 lt!610650) (index!42941 lt!610650) (select (arr!45895 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987))))

(declare-fun b!1389383 () Bool)

(declare-fun e!787139 () SeekEntryResult!10142)

(assert (=> b!1389383 (= e!787139 (Found!10142 (index!42941 lt!610650)))))

(declare-fun b!1389384 () Bool)

(declare-fun e!787140 () SeekEntryResult!10142)

(assert (=> b!1389384 (= e!787140 Undefined!10142)))

(declare-fun d!150185 () Bool)

(declare-fun lt!610648 () SeekEntryResult!10142)

(assert (=> d!150185 (and (or ((_ is Undefined!10142) lt!610648) (not ((_ is Found!10142) lt!610648)) (and (bvsge (index!42940 lt!610648) #b00000000000000000000000000000000) (bvslt (index!42940 lt!610648) (size!46446 a!2938)))) (or ((_ is Undefined!10142) lt!610648) ((_ is Found!10142) lt!610648) (not ((_ is MissingZero!10142) lt!610648)) (and (bvsge (index!42939 lt!610648) #b00000000000000000000000000000000) (bvslt (index!42939 lt!610648) (size!46446 a!2938)))) (or ((_ is Undefined!10142) lt!610648) ((_ is Found!10142) lt!610648) ((_ is MissingZero!10142) lt!610648) (not ((_ is MissingVacant!10142) lt!610648)) (and (bvsge (index!42942 lt!610648) #b00000000000000000000000000000000) (bvslt (index!42942 lt!610648) (size!46446 a!2938)))) (or ((_ is Undefined!10142) lt!610648) (ite ((_ is Found!10142) lt!610648) (= (select (arr!45895 a!2938) (index!42940 lt!610648)) (select (arr!45895 a!2938) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10142) lt!610648) (= (select (arr!45895 a!2938) (index!42939 lt!610648)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10142) lt!610648) (= (select (arr!45895 a!2938) (index!42942 lt!610648)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150185 (= lt!610648 e!787140)))

(declare-fun c!129572 () Bool)

(assert (=> d!150185 (= c!129572 (and ((_ is Intermediate!10142) lt!610650) (undefined!10954 lt!610650)))))

(assert (=> d!150185 (= lt!610650 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45895 a!2938) #b00000000000000000000000000000000) mask!2987) (select (arr!45895 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987))))

(assert (=> d!150185 (validMask!0 mask!2987)))

(assert (=> d!150185 (= (seekEntryOrOpen!0 (select (arr!45895 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987) lt!610648)))

(declare-fun b!1389385 () Bool)

(assert (=> b!1389385 (= e!787141 (MissingZero!10142 (index!42941 lt!610650)))))

(declare-fun b!1389386 () Bool)

(assert (=> b!1389386 (= e!787140 e!787139)))

(declare-fun lt!610649 () (_ BitVec 64))

(assert (=> b!1389386 (= lt!610649 (select (arr!45895 a!2938) (index!42941 lt!610650)))))

(declare-fun c!129570 () Bool)

(assert (=> b!1389386 (= c!129570 (= lt!610649 (select (arr!45895 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1389387 () Bool)

(declare-fun c!129571 () Bool)

(assert (=> b!1389387 (= c!129571 (= lt!610649 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1389387 (= e!787139 e!787141)))

(assert (= (and d!150185 c!129572) b!1389384))

(assert (= (and d!150185 (not c!129572)) b!1389386))

(assert (= (and b!1389386 c!129570) b!1389383))

(assert (= (and b!1389386 (not c!129570)) b!1389387))

(assert (= (and b!1389387 c!129571) b!1389385))

(assert (= (and b!1389387 (not c!129571)) b!1389382))

(assert (=> b!1389382 m!1275013))

(declare-fun m!1275327 () Bool)

(assert (=> b!1389382 m!1275327))

(declare-fun m!1275329 () Bool)

(assert (=> d!150185 m!1275329))

(assert (=> d!150185 m!1275013))

(declare-fun m!1275331 () Bool)

(assert (=> d!150185 m!1275331))

(assert (=> d!150185 m!1275331))

(assert (=> d!150185 m!1275013))

(declare-fun m!1275333 () Bool)

(assert (=> d!150185 m!1275333))

(declare-fun m!1275335 () Bool)

(assert (=> d!150185 m!1275335))

(assert (=> d!150185 m!1274945))

(declare-fun m!1275337 () Bool)

(assert (=> d!150185 m!1275337))

(declare-fun m!1275339 () Bool)

(assert (=> b!1389386 m!1275339))

(assert (=> b!1389123 d!150185))

(declare-fun b!1389388 () Bool)

(declare-fun e!787143 () Bool)

(declare-fun e!787146 () Bool)

(assert (=> b!1389388 (= e!787143 e!787146)))

(declare-fun res!929140 () Bool)

(declare-fun lt!610652 () SeekEntryResult!10142)

(assert (=> b!1389388 (= res!929140 (and ((_ is Intermediate!10142) lt!610652) (not (undefined!10954 lt!610652)) (bvslt (x!124707 lt!610652) #b01111111111111111111111111111110) (bvsge (x!124707 lt!610652) #b00000000000000000000000000000000) (bvsge (x!124707 lt!610652) #b00000000000000000000000000000000)))))

(assert (=> b!1389388 (=> (not res!929140) (not e!787146))))

(declare-fun e!787145 () SeekEntryResult!10142)

(declare-fun b!1389389 () Bool)

(assert (=> b!1389389 (= e!787145 (Intermediate!10142 true (toIndex!0 (select (arr!45895 a!2938) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun e!787142 () SeekEntryResult!10142)

(declare-fun b!1389390 () Bool)

(assert (=> b!1389390 (= e!787142 (Intermediate!10142 false (toIndex!0 (select (arr!45895 a!2938) startIndex!16) mask!2987) #b00000000000000000000000000000000))))

(declare-fun b!1389391 () Bool)

(assert (=> b!1389391 (and (bvsge (index!42941 lt!610652) #b00000000000000000000000000000000) (bvslt (index!42941 lt!610652) (size!46446 a!2938)))))

(declare-fun res!929141 () Bool)

(assert (=> b!1389391 (= res!929141 (= (select (arr!45895 a!2938) (index!42941 lt!610652)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!787144 () Bool)

(assert (=> b!1389391 (=> res!929141 e!787144)))

(declare-fun b!1389392 () Bool)

(assert (=> b!1389392 (and (bvsge (index!42941 lt!610652) #b00000000000000000000000000000000) (bvslt (index!42941 lt!610652) (size!46446 a!2938)))))

(assert (=> b!1389392 (= e!787144 (= (select (arr!45895 a!2938) (index!42941 lt!610652)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1389393 () Bool)

(assert (=> b!1389393 (= e!787143 (bvsge (x!124707 lt!610652) #b01111111111111111111111111111110))))

(declare-fun b!1389394 () Bool)

(assert (=> b!1389394 (= e!787142 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!45895 a!2938) startIndex!16) mask!2987) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2987) (select (arr!45895 a!2938) startIndex!16) a!2938 mask!2987))))

(declare-fun b!1389395 () Bool)

(assert (=> b!1389395 (= e!787145 e!787142)))

(declare-fun lt!610651 () (_ BitVec 64))

(declare-fun c!129575 () Bool)

(assert (=> b!1389395 (= c!129575 (or (= lt!610651 (select (arr!45895 a!2938) startIndex!16)) (= (bvadd lt!610651 lt!610651) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1389396 () Bool)

(assert (=> b!1389396 (and (bvsge (index!42941 lt!610652) #b00000000000000000000000000000000) (bvslt (index!42941 lt!610652) (size!46446 a!2938)))))

(declare-fun res!929142 () Bool)

(assert (=> b!1389396 (= res!929142 (= (select (arr!45895 a!2938) (index!42941 lt!610652)) (select (arr!45895 a!2938) startIndex!16)))))

(assert (=> b!1389396 (=> res!929142 e!787144)))

(assert (=> b!1389396 (= e!787146 e!787144)))

(declare-fun d!150187 () Bool)

(assert (=> d!150187 e!787143))

(declare-fun c!129573 () Bool)

(assert (=> d!150187 (= c!129573 (and ((_ is Intermediate!10142) lt!610652) (undefined!10954 lt!610652)))))

(assert (=> d!150187 (= lt!610652 e!787145)))

(declare-fun c!129574 () Bool)

(assert (=> d!150187 (= c!129574 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!150187 (= lt!610651 (select (arr!45895 a!2938) (toIndex!0 (select (arr!45895 a!2938) startIndex!16) mask!2987)))))

(assert (=> d!150187 (validMask!0 mask!2987)))

(assert (=> d!150187 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45895 a!2938) startIndex!16) mask!2987) (select (arr!45895 a!2938) startIndex!16) a!2938 mask!2987) lt!610652)))

(assert (= (and d!150187 c!129574) b!1389389))

(assert (= (and d!150187 (not c!129574)) b!1389395))

(assert (= (and b!1389395 c!129575) b!1389390))

(assert (= (and b!1389395 (not c!129575)) b!1389394))

(assert (= (and d!150187 c!129573) b!1389393))

(assert (= (and d!150187 (not c!129573)) b!1389388))

(assert (= (and b!1389388 res!929140) b!1389396))

(assert (= (and b!1389396 (not res!929142)) b!1389391))

(assert (= (and b!1389391 (not res!929141)) b!1389392))

(assert (=> d!150187 m!1275111))

(declare-fun m!1275341 () Bool)

(assert (=> d!150187 m!1275341))

(assert (=> d!150187 m!1274945))

(assert (=> b!1389394 m!1275111))

(declare-fun m!1275343 () Bool)

(assert (=> b!1389394 m!1275343))

(assert (=> b!1389394 m!1275343))

(assert (=> b!1389394 m!1274919))

(declare-fun m!1275345 () Bool)

(assert (=> b!1389394 m!1275345))

(declare-fun m!1275347 () Bool)

(assert (=> b!1389392 m!1275347))

(assert (=> b!1389391 m!1275347))

(assert (=> b!1389396 m!1275347))

(assert (=> d!150123 d!150187))

(declare-fun d!150189 () Bool)

(declare-fun lt!610654 () (_ BitVec 32))

(declare-fun lt!610653 () (_ BitVec 32))

(assert (=> d!150189 (= lt!610654 (bvmul (bvxor lt!610653 (bvlshr lt!610653 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150189 (= lt!610653 ((_ extract 31 0) (bvand (bvxor (select (arr!45895 a!2938) startIndex!16) (bvlshr (select (arr!45895 a!2938) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150189 (and (bvsge mask!2987 #b00000000000000000000000000000000) (let ((res!929116 (let ((h!33629 ((_ extract 31 0) (bvand (bvxor (select (arr!45895 a!2938) startIndex!16) (bvlshr (select (arr!45895 a!2938) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!124711 (bvmul (bvxor h!33629 (bvlshr h!33629 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!124711 (bvlshr x!124711 #b00000000000000000000000000001101)) mask!2987))))) (and (bvslt res!929116 (bvadd mask!2987 #b00000000000000000000000000000001)) (bvsge res!929116 #b00000000000000000000000000000000))))))

(assert (=> d!150189 (= (toIndex!0 (select (arr!45895 a!2938) startIndex!16) mask!2987) (bvand (bvxor lt!610654 (bvlshr lt!610654 #b00000000000000000000000000001101)) mask!2987))))

(assert (=> d!150123 d!150189))

(assert (=> d!150123 d!150073))

(check-sat (not b!1389317) (not b!1389332) (not d!150177) (not d!150145) (not b!1389378) (not b!1389334) (not b!1389324) (not bm!66682) (not d!150181) (not d!150175) (not d!150171) (not d!150167) (not b!1389349) (not b!1389381) (not bm!66679) (not b!1389347) (not b!1389322) (not b!1389372) (not b!1389314) (not bm!66681) (not d!150153) (not b!1389394) (not bm!66680) (not b!1389350) (not b!1389319) (not b!1389286) (not d!150185) (not d!150165) (not d!150169) (not b!1389331) (not d!150187) (not b!1389320) (not b!1389336) (not b!1389382) (not d!150179) (not b!1389288) (not d!150155))
(check-sat)
