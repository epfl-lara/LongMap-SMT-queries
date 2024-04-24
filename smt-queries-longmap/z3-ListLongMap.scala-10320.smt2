; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121484 () Bool)

(assert start!121484)

(declare-fun b!1411145 () Bool)

(declare-fun res!948019 () Bool)

(declare-fun e!798650 () Bool)

(assert (=> b!1411145 (=> (not res!948019) (not e!798650))))

(declare-datatypes ((array!96509 0))(
  ( (array!96510 (arr!46594 (Array (_ BitVec 32) (_ BitVec 64))) (size!47145 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96509)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1411145 (= res!948019 (validKeyInArray!0 (select (arr!46594 a!2901) j!112)))))

(declare-fun res!948021 () Bool)

(assert (=> start!121484 (=> (not res!948021) (not e!798650))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121484 (= res!948021 (validMask!0 mask!2840))))

(assert (=> start!121484 e!798650))

(assert (=> start!121484 true))

(declare-fun array_inv!35875 (array!96509) Bool)

(assert (=> start!121484 (array_inv!35875 a!2901)))

(declare-fun b!1411146 () Bool)

(declare-fun e!798649 () Bool)

(assert (=> b!1411146 (= e!798650 (not e!798649))))

(declare-fun res!948022 () Bool)

(assert (=> b!1411146 (=> res!948022 e!798649)))

(declare-datatypes ((SeekEntryResult!10808 0))(
  ( (MissingZero!10808 (index!45609 (_ BitVec 32))) (Found!10808 (index!45610 (_ BitVec 32))) (Intermediate!10808 (undefined!11620 Bool) (index!45611 (_ BitVec 32)) (x!127354 (_ BitVec 32))) (Undefined!10808) (MissingVacant!10808 (index!45612 (_ BitVec 32))) )
))
(declare-fun lt!621361 () SeekEntryResult!10808)

(get-info :version)

(assert (=> b!1411146 (= res!948022 (or (not ((_ is Intermediate!10808) lt!621361)) (undefined!11620 lt!621361)))))

(declare-fun e!798647 () Bool)

(assert (=> b!1411146 e!798647))

(declare-fun res!948020 () Bool)

(assert (=> b!1411146 (=> (not res!948020) (not e!798647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96509 (_ BitVec 32)) Bool)

(assert (=> b!1411146 (= res!948020 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47617 0))(
  ( (Unit!47618) )
))
(declare-fun lt!621360 () Unit!47617)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96509 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47617)

(assert (=> b!1411146 (= lt!621360 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!621359 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96509 (_ BitVec 32)) SeekEntryResult!10808)

(assert (=> b!1411146 (= lt!621361 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621359 (select (arr!46594 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411146 (= lt!621359 (toIndex!0 (select (arr!46594 a!2901) j!112) mask!2840))))

(declare-fun b!1411147 () Bool)

(declare-fun res!948018 () Bool)

(assert (=> b!1411147 (=> (not res!948018) (not e!798650))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1411147 (= res!948018 (validKeyInArray!0 (select (arr!46594 a!2901) i!1037)))))

(declare-fun lt!621362 () SeekEntryResult!10808)

(declare-fun b!1411148 () Bool)

(assert (=> b!1411148 (= e!798649 (or (= lt!621361 lt!621362) (not ((_ is Intermediate!10808) lt!621362)) (bvslt (x!127354 lt!621361) #b00000000000000000000000000000000) (bvsgt (x!127354 lt!621361) #b01111111111111111111111111111110) (and (bvsge lt!621359 #b00000000000000000000000000000000) (bvslt lt!621359 (size!47145 a!2901)))))))

(assert (=> b!1411148 (= lt!621362 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96510 (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47145 a!2901)) mask!2840))))

(declare-fun b!1411149 () Bool)

(declare-fun res!948025 () Bool)

(assert (=> b!1411149 (=> (not res!948025) (not e!798650))))

(assert (=> b!1411149 (= res!948025 (and (= (size!47145 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47145 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47145 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1411150 () Bool)

(declare-fun res!948023 () Bool)

(assert (=> b!1411150 (=> (not res!948023) (not e!798650))))

(assert (=> b!1411150 (= res!948023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1411151 () Bool)

(declare-fun res!948024 () Bool)

(assert (=> b!1411151 (=> (not res!948024) (not e!798650))))

(declare-datatypes ((List!33100 0))(
  ( (Nil!33097) (Cons!33096 (h!34370 (_ BitVec 64)) (t!47786 List!33100)) )
))
(declare-fun arrayNoDuplicates!0 (array!96509 (_ BitVec 32) List!33100) Bool)

(assert (=> b!1411151 (= res!948024 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33097))))

(declare-fun b!1411152 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96509 (_ BitVec 32)) SeekEntryResult!10808)

(assert (=> b!1411152 (= e!798647 (= (seekEntryOrOpen!0 (select (arr!46594 a!2901) j!112) a!2901 mask!2840) (Found!10808 j!112)))))

(assert (= (and start!121484 res!948021) b!1411149))

(assert (= (and b!1411149 res!948025) b!1411147))

(assert (= (and b!1411147 res!948018) b!1411145))

(assert (= (and b!1411145 res!948019) b!1411150))

(assert (= (and b!1411150 res!948023) b!1411151))

(assert (= (and b!1411151 res!948024) b!1411146))

(assert (= (and b!1411146 res!948020) b!1411152))

(assert (= (and b!1411146 (not res!948022)) b!1411148))

(declare-fun m!1301119 () Bool)

(assert (=> b!1411151 m!1301119))

(declare-fun m!1301121 () Bool)

(assert (=> b!1411148 m!1301121))

(declare-fun m!1301123 () Bool)

(assert (=> b!1411148 m!1301123))

(assert (=> b!1411148 m!1301123))

(declare-fun m!1301125 () Bool)

(assert (=> b!1411148 m!1301125))

(assert (=> b!1411148 m!1301125))

(assert (=> b!1411148 m!1301123))

(declare-fun m!1301127 () Bool)

(assert (=> b!1411148 m!1301127))

(declare-fun m!1301129 () Bool)

(assert (=> b!1411147 m!1301129))

(assert (=> b!1411147 m!1301129))

(declare-fun m!1301131 () Bool)

(assert (=> b!1411147 m!1301131))

(declare-fun m!1301133 () Bool)

(assert (=> b!1411150 m!1301133))

(declare-fun m!1301135 () Bool)

(assert (=> b!1411146 m!1301135))

(declare-fun m!1301137 () Bool)

(assert (=> b!1411146 m!1301137))

(assert (=> b!1411146 m!1301135))

(declare-fun m!1301139 () Bool)

(assert (=> b!1411146 m!1301139))

(assert (=> b!1411146 m!1301135))

(declare-fun m!1301141 () Bool)

(assert (=> b!1411146 m!1301141))

(declare-fun m!1301143 () Bool)

(assert (=> b!1411146 m!1301143))

(declare-fun m!1301145 () Bool)

(assert (=> start!121484 m!1301145))

(declare-fun m!1301147 () Bool)

(assert (=> start!121484 m!1301147))

(assert (=> b!1411145 m!1301135))

(assert (=> b!1411145 m!1301135))

(declare-fun m!1301149 () Bool)

(assert (=> b!1411145 m!1301149))

(assert (=> b!1411152 m!1301135))

(assert (=> b!1411152 m!1301135))

(declare-fun m!1301151 () Bool)

(assert (=> b!1411152 m!1301151))

(check-sat (not start!121484) (not b!1411146) (not b!1411148) (not b!1411152) (not b!1411150) (not b!1411147) (not b!1411145) (not b!1411151))
(check-sat)
(get-model)

(declare-fun b!1411211 () Bool)

(declare-fun e!798685 () Bool)

(declare-fun call!67095 () Bool)

(assert (=> b!1411211 (= e!798685 call!67095)))

(declare-fun bm!67092 () Bool)

(declare-fun c!131041 () Bool)

(assert (=> bm!67092 (= call!67095 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131041 (Cons!33096 (select (arr!46594 a!2901) #b00000000000000000000000000000000) Nil!33097) Nil!33097)))))

(declare-fun b!1411212 () Bool)

(assert (=> b!1411212 (= e!798685 call!67095)))

(declare-fun b!1411213 () Bool)

(declare-fun e!798684 () Bool)

(declare-fun contains!9847 (List!33100 (_ BitVec 64)) Bool)

(assert (=> b!1411213 (= e!798684 (contains!9847 Nil!33097 (select (arr!46594 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1411214 () Bool)

(declare-fun e!798683 () Bool)

(assert (=> b!1411214 (= e!798683 e!798685)))

(assert (=> b!1411214 (= c!131041 (validKeyInArray!0 (select (arr!46594 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1411215 () Bool)

(declare-fun e!798686 () Bool)

(assert (=> b!1411215 (= e!798686 e!798683)))

(declare-fun res!948082 () Bool)

(assert (=> b!1411215 (=> (not res!948082) (not e!798683))))

(assert (=> b!1411215 (= res!948082 (not e!798684))))

(declare-fun res!948080 () Bool)

(assert (=> b!1411215 (=> (not res!948080) (not e!798684))))

(assert (=> b!1411215 (= res!948080 (validKeyInArray!0 (select (arr!46594 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!152151 () Bool)

(declare-fun res!948081 () Bool)

(assert (=> d!152151 (=> res!948081 e!798686)))

(assert (=> d!152151 (= res!948081 (bvsge #b00000000000000000000000000000000 (size!47145 a!2901)))))

(assert (=> d!152151 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33097) e!798686)))

(assert (= (and d!152151 (not res!948081)) b!1411215))

(assert (= (and b!1411215 res!948080) b!1411213))

(assert (= (and b!1411215 res!948082) b!1411214))

(assert (= (and b!1411214 c!131041) b!1411211))

(assert (= (and b!1411214 (not c!131041)) b!1411212))

(assert (= (or b!1411211 b!1411212) bm!67092))

(declare-fun m!1301221 () Bool)

(assert (=> bm!67092 m!1301221))

(declare-fun m!1301223 () Bool)

(assert (=> bm!67092 m!1301223))

(assert (=> b!1411213 m!1301221))

(assert (=> b!1411213 m!1301221))

(declare-fun m!1301225 () Bool)

(assert (=> b!1411213 m!1301225))

(assert (=> b!1411214 m!1301221))

(assert (=> b!1411214 m!1301221))

(declare-fun m!1301227 () Bool)

(assert (=> b!1411214 m!1301227))

(assert (=> b!1411215 m!1301221))

(assert (=> b!1411215 m!1301221))

(assert (=> b!1411215 m!1301227))

(assert (=> b!1411151 d!152151))

(declare-fun d!152153 () Bool)

(declare-fun res!948088 () Bool)

(declare-fun e!798694 () Bool)

(assert (=> d!152153 (=> res!948088 e!798694)))

(assert (=> d!152153 (= res!948088 (bvsge j!112 (size!47145 a!2901)))))

(assert (=> d!152153 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!798694)))

(declare-fun call!67098 () Bool)

(declare-fun bm!67095 () Bool)

(assert (=> bm!67095 (= call!67098 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1411224 () Bool)

(declare-fun e!798693 () Bool)

(assert (=> b!1411224 (= e!798694 e!798693)))

(declare-fun c!131044 () Bool)

(assert (=> b!1411224 (= c!131044 (validKeyInArray!0 (select (arr!46594 a!2901) j!112)))))

(declare-fun b!1411225 () Bool)

(declare-fun e!798695 () Bool)

(assert (=> b!1411225 (= e!798695 call!67098)))

(declare-fun b!1411226 () Bool)

(assert (=> b!1411226 (= e!798693 call!67098)))

(declare-fun b!1411227 () Bool)

(assert (=> b!1411227 (= e!798693 e!798695)))

(declare-fun lt!621394 () (_ BitVec 64))

(assert (=> b!1411227 (= lt!621394 (select (arr!46594 a!2901) j!112))))

(declare-fun lt!621395 () Unit!47617)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96509 (_ BitVec 64) (_ BitVec 32)) Unit!47617)

(assert (=> b!1411227 (= lt!621395 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!621394 j!112))))

(declare-fun arrayContainsKey!0 (array!96509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1411227 (arrayContainsKey!0 a!2901 lt!621394 #b00000000000000000000000000000000)))

(declare-fun lt!621393 () Unit!47617)

(assert (=> b!1411227 (= lt!621393 lt!621395)))

(declare-fun res!948087 () Bool)

(assert (=> b!1411227 (= res!948087 (= (seekEntryOrOpen!0 (select (arr!46594 a!2901) j!112) a!2901 mask!2840) (Found!10808 j!112)))))

(assert (=> b!1411227 (=> (not res!948087) (not e!798695))))

(assert (= (and d!152153 (not res!948088)) b!1411224))

(assert (= (and b!1411224 c!131044) b!1411227))

(assert (= (and b!1411224 (not c!131044)) b!1411226))

(assert (= (and b!1411227 res!948087) b!1411225))

(assert (= (or b!1411225 b!1411226) bm!67095))

(declare-fun m!1301229 () Bool)

(assert (=> bm!67095 m!1301229))

(assert (=> b!1411224 m!1301135))

(assert (=> b!1411224 m!1301135))

(assert (=> b!1411224 m!1301149))

(assert (=> b!1411227 m!1301135))

(declare-fun m!1301231 () Bool)

(assert (=> b!1411227 m!1301231))

(declare-fun m!1301233 () Bool)

(assert (=> b!1411227 m!1301233))

(assert (=> b!1411227 m!1301135))

(assert (=> b!1411227 m!1301151))

(assert (=> b!1411146 d!152153))

(declare-fun d!152157 () Bool)

(assert (=> d!152157 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!621398 () Unit!47617)

(declare-fun choose!38 (array!96509 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47617)

(assert (=> d!152157 (= lt!621398 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152157 (validMask!0 mask!2840)))

(assert (=> d!152157 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!621398)))

(declare-fun bs!41116 () Bool)

(assert (= bs!41116 d!152157))

(assert (=> bs!41116 m!1301143))

(declare-fun m!1301235 () Bool)

(assert (=> bs!41116 m!1301235))

(assert (=> bs!41116 m!1301145))

(assert (=> b!1411146 d!152157))

(declare-fun b!1411281 () Bool)

(declare-fun e!798731 () SeekEntryResult!10808)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1411281 (= e!798731 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!621359 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (arr!46594 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1411282 () Bool)

(declare-fun e!798729 () SeekEntryResult!10808)

(assert (=> b!1411282 (= e!798729 e!798731)))

(declare-fun lt!621422 () (_ BitVec 64))

(declare-fun c!131064 () Bool)

(assert (=> b!1411282 (= c!131064 (or (= lt!621422 (select (arr!46594 a!2901) j!112)) (= (bvadd lt!621422 lt!621422) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1411283 () Bool)

(declare-fun e!798727 () Bool)

(declare-fun lt!621421 () SeekEntryResult!10808)

(assert (=> b!1411283 (= e!798727 (bvsge (x!127354 lt!621421) #b01111111111111111111111111111110))))

(declare-fun b!1411284 () Bool)

(assert (=> b!1411284 (and (bvsge (index!45611 lt!621421) #b00000000000000000000000000000000) (bvslt (index!45611 lt!621421) (size!47145 a!2901)))))

(declare-fun e!798728 () Bool)

(assert (=> b!1411284 (= e!798728 (= (select (arr!46594 a!2901) (index!45611 lt!621421)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!152161 () Bool)

(assert (=> d!152161 e!798727))

(declare-fun c!131062 () Bool)

(assert (=> d!152161 (= c!131062 (and ((_ is Intermediate!10808) lt!621421) (undefined!11620 lt!621421)))))

(assert (=> d!152161 (= lt!621421 e!798729)))

(declare-fun c!131063 () Bool)

(assert (=> d!152161 (= c!131063 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152161 (= lt!621422 (select (arr!46594 a!2901) lt!621359))))

(assert (=> d!152161 (validMask!0 mask!2840)))

(assert (=> d!152161 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621359 (select (arr!46594 a!2901) j!112) a!2901 mask!2840) lt!621421)))

(declare-fun b!1411285 () Bool)

(declare-fun e!798730 () Bool)

(assert (=> b!1411285 (= e!798727 e!798730)))

(declare-fun res!948109 () Bool)

(assert (=> b!1411285 (= res!948109 (and ((_ is Intermediate!10808) lt!621421) (not (undefined!11620 lt!621421)) (bvslt (x!127354 lt!621421) #b01111111111111111111111111111110) (bvsge (x!127354 lt!621421) #b00000000000000000000000000000000) (bvsge (x!127354 lt!621421) #b00000000000000000000000000000000)))))

(assert (=> b!1411285 (=> (not res!948109) (not e!798730))))

(declare-fun b!1411286 () Bool)

(assert (=> b!1411286 (= e!798729 (Intermediate!10808 true lt!621359 #b00000000000000000000000000000000))))

(declare-fun b!1411287 () Bool)

(assert (=> b!1411287 (= e!798731 (Intermediate!10808 false lt!621359 #b00000000000000000000000000000000))))

(declare-fun b!1411288 () Bool)

(assert (=> b!1411288 (and (bvsge (index!45611 lt!621421) #b00000000000000000000000000000000) (bvslt (index!45611 lt!621421) (size!47145 a!2901)))))

(declare-fun res!948110 () Bool)

(assert (=> b!1411288 (= res!948110 (= (select (arr!46594 a!2901) (index!45611 lt!621421)) (select (arr!46594 a!2901) j!112)))))

(assert (=> b!1411288 (=> res!948110 e!798728)))

(assert (=> b!1411288 (= e!798730 e!798728)))

(declare-fun b!1411289 () Bool)

(assert (=> b!1411289 (and (bvsge (index!45611 lt!621421) #b00000000000000000000000000000000) (bvslt (index!45611 lt!621421) (size!47145 a!2901)))))

(declare-fun res!948111 () Bool)

(assert (=> b!1411289 (= res!948111 (= (select (arr!46594 a!2901) (index!45611 lt!621421)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1411289 (=> res!948111 e!798728)))

(assert (= (and d!152161 c!131063) b!1411286))

(assert (= (and d!152161 (not c!131063)) b!1411282))

(assert (= (and b!1411282 c!131064) b!1411287))

(assert (= (and b!1411282 (not c!131064)) b!1411281))

(assert (= (and d!152161 c!131062) b!1411283))

(assert (= (and d!152161 (not c!131062)) b!1411285))

(assert (= (and b!1411285 res!948109) b!1411288))

(assert (= (and b!1411288 (not res!948110)) b!1411289))

(assert (= (and b!1411289 (not res!948111)) b!1411284))

(declare-fun m!1301245 () Bool)

(assert (=> d!152161 m!1301245))

(assert (=> d!152161 m!1301145))

(declare-fun m!1301247 () Bool)

(assert (=> b!1411289 m!1301247))

(assert (=> b!1411288 m!1301247))

(assert (=> b!1411284 m!1301247))

(declare-fun m!1301249 () Bool)

(assert (=> b!1411281 m!1301249))

(assert (=> b!1411281 m!1301249))

(assert (=> b!1411281 m!1301135))

(declare-fun m!1301251 () Bool)

(assert (=> b!1411281 m!1301251))

(assert (=> b!1411146 d!152161))

(declare-fun d!152175 () Bool)

(declare-fun lt!621435 () (_ BitVec 32))

(declare-fun lt!621434 () (_ BitVec 32))

(assert (=> d!152175 (= lt!621435 (bvmul (bvxor lt!621434 (bvlshr lt!621434 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152175 (= lt!621434 ((_ extract 31 0) (bvand (bvxor (select (arr!46594 a!2901) j!112) (bvlshr (select (arr!46594 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152175 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!948112 (let ((h!34374 ((_ extract 31 0) (bvand (bvxor (select (arr!46594 a!2901) j!112) (bvlshr (select (arr!46594 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127360 (bvmul (bvxor h!34374 (bvlshr h!34374 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127360 (bvlshr x!127360 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!948112 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!948112 #b00000000000000000000000000000000))))))

(assert (=> d!152175 (= (toIndex!0 (select (arr!46594 a!2901) j!112) mask!2840) (bvand (bvxor lt!621435 (bvlshr lt!621435 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1411146 d!152175))

(declare-fun b!1411372 () Bool)

(declare-fun e!798783 () SeekEntryResult!10808)

(declare-fun lt!621465 () SeekEntryResult!10808)

(assert (=> b!1411372 (= e!798783 (Found!10808 (index!45611 lt!621465)))))

(declare-fun e!798784 () SeekEntryResult!10808)

(declare-fun b!1411373 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96509 (_ BitVec 32)) SeekEntryResult!10808)

(assert (=> b!1411373 (= e!798784 (seekKeyOrZeroReturnVacant!0 (x!127354 lt!621465) (index!45611 lt!621465) (index!45611 lt!621465) (select (arr!46594 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1411374 () Bool)

(assert (=> b!1411374 (= e!798784 (MissingZero!10808 (index!45611 lt!621465)))))

(declare-fun d!152179 () Bool)

(declare-fun lt!621466 () SeekEntryResult!10808)

(assert (=> d!152179 (and (or ((_ is Undefined!10808) lt!621466) (not ((_ is Found!10808) lt!621466)) (and (bvsge (index!45610 lt!621466) #b00000000000000000000000000000000) (bvslt (index!45610 lt!621466) (size!47145 a!2901)))) (or ((_ is Undefined!10808) lt!621466) ((_ is Found!10808) lt!621466) (not ((_ is MissingZero!10808) lt!621466)) (and (bvsge (index!45609 lt!621466) #b00000000000000000000000000000000) (bvslt (index!45609 lt!621466) (size!47145 a!2901)))) (or ((_ is Undefined!10808) lt!621466) ((_ is Found!10808) lt!621466) ((_ is MissingZero!10808) lt!621466) (not ((_ is MissingVacant!10808) lt!621466)) (and (bvsge (index!45612 lt!621466) #b00000000000000000000000000000000) (bvslt (index!45612 lt!621466) (size!47145 a!2901)))) (or ((_ is Undefined!10808) lt!621466) (ite ((_ is Found!10808) lt!621466) (= (select (arr!46594 a!2901) (index!45610 lt!621466)) (select (arr!46594 a!2901) j!112)) (ite ((_ is MissingZero!10808) lt!621466) (= (select (arr!46594 a!2901) (index!45609 lt!621466)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10808) lt!621466) (= (select (arr!46594 a!2901) (index!45612 lt!621466)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!798785 () SeekEntryResult!10808)

(assert (=> d!152179 (= lt!621466 e!798785)))

(declare-fun c!131094 () Bool)

(assert (=> d!152179 (= c!131094 (and ((_ is Intermediate!10808) lt!621465) (undefined!11620 lt!621465)))))

(assert (=> d!152179 (= lt!621465 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46594 a!2901) j!112) mask!2840) (select (arr!46594 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152179 (validMask!0 mask!2840)))

(assert (=> d!152179 (= (seekEntryOrOpen!0 (select (arr!46594 a!2901) j!112) a!2901 mask!2840) lt!621466)))

(declare-fun b!1411375 () Bool)

(declare-fun c!131095 () Bool)

(declare-fun lt!621467 () (_ BitVec 64))

(assert (=> b!1411375 (= c!131095 (= lt!621467 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1411375 (= e!798783 e!798784)))

(declare-fun b!1411376 () Bool)

(assert (=> b!1411376 (= e!798785 Undefined!10808)))

(declare-fun b!1411377 () Bool)

(assert (=> b!1411377 (= e!798785 e!798783)))

(assert (=> b!1411377 (= lt!621467 (select (arr!46594 a!2901) (index!45611 lt!621465)))))

(declare-fun c!131093 () Bool)

(assert (=> b!1411377 (= c!131093 (= lt!621467 (select (arr!46594 a!2901) j!112)))))

(assert (= (and d!152179 c!131094) b!1411376))

(assert (= (and d!152179 (not c!131094)) b!1411377))

(assert (= (and b!1411377 c!131093) b!1411372))

(assert (= (and b!1411377 (not c!131093)) b!1411375))

(assert (= (and b!1411375 c!131095) b!1411374))

(assert (= (and b!1411375 (not c!131095)) b!1411373))

(assert (=> b!1411373 m!1301135))

(declare-fun m!1301289 () Bool)

(assert (=> b!1411373 m!1301289))

(declare-fun m!1301291 () Bool)

(assert (=> d!152179 m!1301291))

(assert (=> d!152179 m!1301145))

(assert (=> d!152179 m!1301135))

(assert (=> d!152179 m!1301137))

(assert (=> d!152179 m!1301137))

(assert (=> d!152179 m!1301135))

(declare-fun m!1301293 () Bool)

(assert (=> d!152179 m!1301293))

(declare-fun m!1301295 () Bool)

(assert (=> d!152179 m!1301295))

(declare-fun m!1301297 () Bool)

(assert (=> d!152179 m!1301297))

(declare-fun m!1301299 () Bool)

(assert (=> b!1411377 m!1301299))

(assert (=> b!1411152 d!152179))

(declare-fun d!152191 () Bool)

(declare-fun res!948141 () Bool)

(declare-fun e!798787 () Bool)

(assert (=> d!152191 (=> res!948141 e!798787)))

(assert (=> d!152191 (= res!948141 (bvsge #b00000000000000000000000000000000 (size!47145 a!2901)))))

(assert (=> d!152191 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!798787)))

(declare-fun bm!67105 () Bool)

(declare-fun call!67108 () Bool)

(assert (=> bm!67105 (= call!67108 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1411378 () Bool)

(declare-fun e!798786 () Bool)

(assert (=> b!1411378 (= e!798787 e!798786)))

(declare-fun c!131096 () Bool)

(assert (=> b!1411378 (= c!131096 (validKeyInArray!0 (select (arr!46594 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1411379 () Bool)

(declare-fun e!798788 () Bool)

(assert (=> b!1411379 (= e!798788 call!67108)))

(declare-fun b!1411380 () Bool)

(assert (=> b!1411380 (= e!798786 call!67108)))

(declare-fun b!1411381 () Bool)

(assert (=> b!1411381 (= e!798786 e!798788)))

(declare-fun lt!621469 () (_ BitVec 64))

(assert (=> b!1411381 (= lt!621469 (select (arr!46594 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!621470 () Unit!47617)

(assert (=> b!1411381 (= lt!621470 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!621469 #b00000000000000000000000000000000))))

(assert (=> b!1411381 (arrayContainsKey!0 a!2901 lt!621469 #b00000000000000000000000000000000)))

(declare-fun lt!621468 () Unit!47617)

(assert (=> b!1411381 (= lt!621468 lt!621470)))

(declare-fun res!948140 () Bool)

(assert (=> b!1411381 (= res!948140 (= (seekEntryOrOpen!0 (select (arr!46594 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10808 #b00000000000000000000000000000000)))))

(assert (=> b!1411381 (=> (not res!948140) (not e!798788))))

(assert (= (and d!152191 (not res!948141)) b!1411378))

(assert (= (and b!1411378 c!131096) b!1411381))

(assert (= (and b!1411378 (not c!131096)) b!1411380))

(assert (= (and b!1411381 res!948140) b!1411379))

(assert (= (or b!1411379 b!1411380) bm!67105))

(declare-fun m!1301301 () Bool)

(assert (=> bm!67105 m!1301301))

(assert (=> b!1411378 m!1301221))

(assert (=> b!1411378 m!1301221))

(assert (=> b!1411378 m!1301227))

(assert (=> b!1411381 m!1301221))

(declare-fun m!1301303 () Bool)

(assert (=> b!1411381 m!1301303))

(declare-fun m!1301305 () Bool)

(assert (=> b!1411381 m!1301305))

(assert (=> b!1411381 m!1301221))

(declare-fun m!1301307 () Bool)

(assert (=> b!1411381 m!1301307))

(assert (=> b!1411150 d!152191))

(declare-fun d!152193 () Bool)

(assert (=> d!152193 (= (validKeyInArray!0 (select (arr!46594 a!2901) j!112)) (and (not (= (select (arr!46594 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46594 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1411145 d!152193))

(declare-fun d!152195 () Bool)

(assert (=> d!152195 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121484 d!152195))

(declare-fun d!152207 () Bool)

(assert (=> d!152207 (= (array_inv!35875 a!2901) (bvsge (size!47145 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121484 d!152207))

(declare-fun d!152209 () Bool)

(assert (=> d!152209 (= (validKeyInArray!0 (select (arr!46594 a!2901) i!1037)) (and (not (= (select (arr!46594 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46594 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1411147 d!152209))

(declare-fun e!798804 () SeekEntryResult!10808)

(declare-fun b!1411401 () Bool)

(assert (=> b!1411401 (= e!798804 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96510 (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47145 a!2901)) mask!2840))))

(declare-fun b!1411402 () Bool)

(declare-fun e!798802 () SeekEntryResult!10808)

(assert (=> b!1411402 (= e!798802 e!798804)))

(declare-fun c!131106 () Bool)

(declare-fun lt!621485 () (_ BitVec 64))

(assert (=> b!1411402 (= c!131106 (or (= lt!621485 (select (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!621485 lt!621485) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1411403 () Bool)

(declare-fun e!798800 () Bool)

(declare-fun lt!621484 () SeekEntryResult!10808)

(assert (=> b!1411403 (= e!798800 (bvsge (x!127354 lt!621484) #b01111111111111111111111111111110))))

(declare-fun b!1411404 () Bool)

(assert (=> b!1411404 (and (bvsge (index!45611 lt!621484) #b00000000000000000000000000000000) (bvslt (index!45611 lt!621484) (size!47145 (array!96510 (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47145 a!2901)))))))

(declare-fun e!798801 () Bool)

(assert (=> b!1411404 (= e!798801 (= (select (arr!46594 (array!96510 (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47145 a!2901))) (index!45611 lt!621484)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!152211 () Bool)

(assert (=> d!152211 e!798800))

(declare-fun c!131104 () Bool)

(assert (=> d!152211 (= c!131104 (and ((_ is Intermediate!10808) lt!621484) (undefined!11620 lt!621484)))))

(assert (=> d!152211 (= lt!621484 e!798802)))

(declare-fun c!131105 () Bool)

(assert (=> d!152211 (= c!131105 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152211 (= lt!621485 (select (arr!46594 (array!96510 (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47145 a!2901))) (toIndex!0 (select (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!152211 (validMask!0 mask!2840)))

(assert (=> d!152211 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96510 (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47145 a!2901)) mask!2840) lt!621484)))

(declare-fun b!1411405 () Bool)

(declare-fun e!798803 () Bool)

(assert (=> b!1411405 (= e!798800 e!798803)))

(declare-fun res!948147 () Bool)

(assert (=> b!1411405 (= res!948147 (and ((_ is Intermediate!10808) lt!621484) (not (undefined!11620 lt!621484)) (bvslt (x!127354 lt!621484) #b01111111111111111111111111111110) (bvsge (x!127354 lt!621484) #b00000000000000000000000000000000) (bvsge (x!127354 lt!621484) #b00000000000000000000000000000000)))))

(assert (=> b!1411405 (=> (not res!948147) (not e!798803))))

(declare-fun b!1411406 () Bool)

(assert (=> b!1411406 (= e!798802 (Intermediate!10808 true (toIndex!0 (select (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1411407 () Bool)

(assert (=> b!1411407 (= e!798804 (Intermediate!10808 false (toIndex!0 (select (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1411408 () Bool)

(assert (=> b!1411408 (and (bvsge (index!45611 lt!621484) #b00000000000000000000000000000000) (bvslt (index!45611 lt!621484) (size!47145 (array!96510 (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47145 a!2901)))))))

(declare-fun res!948148 () Bool)

(assert (=> b!1411408 (= res!948148 (= (select (arr!46594 (array!96510 (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47145 a!2901))) (index!45611 lt!621484)) (select (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1411408 (=> res!948148 e!798801)))

(assert (=> b!1411408 (= e!798803 e!798801)))

(declare-fun b!1411409 () Bool)

(assert (=> b!1411409 (and (bvsge (index!45611 lt!621484) #b00000000000000000000000000000000) (bvslt (index!45611 lt!621484) (size!47145 (array!96510 (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47145 a!2901)))))))

(declare-fun res!948149 () Bool)

(assert (=> b!1411409 (= res!948149 (= (select (arr!46594 (array!96510 (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47145 a!2901))) (index!45611 lt!621484)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1411409 (=> res!948149 e!798801)))

(assert (= (and d!152211 c!131105) b!1411406))

(assert (= (and d!152211 (not c!131105)) b!1411402))

(assert (= (and b!1411402 c!131106) b!1411407))

(assert (= (and b!1411402 (not c!131106)) b!1411401))

(assert (= (and d!152211 c!131104) b!1411403))

(assert (= (and d!152211 (not c!131104)) b!1411405))

(assert (= (and b!1411405 res!948147) b!1411408))

(assert (= (and b!1411408 (not res!948148)) b!1411409))

(assert (= (and b!1411409 (not res!948149)) b!1411404))

(assert (=> d!152211 m!1301125))

(declare-fun m!1301337 () Bool)

(assert (=> d!152211 m!1301337))

(assert (=> d!152211 m!1301145))

(declare-fun m!1301339 () Bool)

(assert (=> b!1411409 m!1301339))

(assert (=> b!1411408 m!1301339))

(assert (=> b!1411404 m!1301339))

(assert (=> b!1411401 m!1301125))

(declare-fun m!1301341 () Bool)

(assert (=> b!1411401 m!1301341))

(assert (=> b!1411401 m!1301341))

(assert (=> b!1411401 m!1301123))

(declare-fun m!1301343 () Bool)

(assert (=> b!1411401 m!1301343))

(assert (=> b!1411148 d!152211))

(declare-fun d!152213 () Bool)

(declare-fun lt!621487 () (_ BitVec 32))

(declare-fun lt!621486 () (_ BitVec 32))

(assert (=> d!152213 (= lt!621487 (bvmul (bvxor lt!621486 (bvlshr lt!621486 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152213 (= lt!621486 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152213 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!948112 (let ((h!34374 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127360 (bvmul (bvxor h!34374 (bvlshr h!34374 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127360 (bvlshr x!127360 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!948112 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!948112 #b00000000000000000000000000000000))))))

(assert (=> d!152213 (= (toIndex!0 (select (store (arr!46594 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!621487 (bvlshr lt!621487 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1411148 d!152213))

(check-sat (not bm!67105) (not bm!67095) (not b!1411381) (not b!1411281) (not bm!67092) (not b!1411373) (not b!1411215) (not d!152161) (not b!1411378) (not b!1411227) (not b!1411213) (not b!1411401) (not b!1411224) (not d!152157) (not b!1411214) (not d!152179) (not d!152211))
(check-sat)
