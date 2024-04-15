; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119282 () Bool)

(assert start!119282)

(declare-fun b!1390959 () Bool)

(declare-fun res!931028 () Bool)

(declare-fun e!787683 () Bool)

(assert (=> b!1390959 (=> (not res!931028) (not e!787683))))

(declare-datatypes ((array!95121 0))(
  ( (array!95122 (arr!45925 (Array (_ BitVec 32) (_ BitVec 64))) (size!46477 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95121)

(declare-datatypes ((List!32522 0))(
  ( (Nil!32519) (Cons!32518 (h!33739 (_ BitVec 64)) (t!47208 List!32522)) )
))
(declare-fun arrayNoDuplicates!0 (array!95121 (_ BitVec 32) List!32522) Bool)

(assert (=> b!1390959 (= res!931028 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32519))))

(declare-fun res!931025 () Bool)

(assert (=> start!119282 (=> (not res!931025) (not e!787683))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119282 (= res!931025 (validMask!0 mask!2840))))

(assert (=> start!119282 e!787683))

(assert (=> start!119282 true))

(declare-fun array_inv!35158 (array!95121) Bool)

(assert (=> start!119282 (array_inv!35158 a!2901)))

(declare-fun b!1390960 () Bool)

(declare-fun res!931026 () Bool)

(assert (=> b!1390960 (=> (not res!931026) (not e!787683))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1390960 (= res!931026 (and (= (size!46477 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46477 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46477 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390961 () Bool)

(declare-fun res!931030 () Bool)

(assert (=> b!1390961 (=> (not res!931030) (not e!787683))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390961 (= res!931030 (validKeyInArray!0 (select (arr!45925 a!2901) j!112)))))

(declare-fun b!1390962 () Bool)

(declare-fun e!787684 () Bool)

(declare-datatypes ((SeekEntryResult!10268 0))(
  ( (MissingZero!10268 (index!43443 (_ BitVec 32))) (Found!10268 (index!43444 (_ BitVec 32))) (Intermediate!10268 (undefined!11080 Bool) (index!43445 (_ BitVec 32)) (x!125117 (_ BitVec 32))) (Undefined!10268) (MissingVacant!10268 (index!43446 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95121 (_ BitVec 32)) SeekEntryResult!10268)

(assert (=> b!1390962 (= e!787684 (= (seekEntryOrOpen!0 (select (arr!45925 a!2901) j!112) a!2901 mask!2840) (Found!10268 j!112)))))

(declare-fun b!1390963 () Bool)

(declare-fun res!931024 () Bool)

(assert (=> b!1390963 (=> (not res!931024) (not e!787683))))

(assert (=> b!1390963 (= res!931024 (validKeyInArray!0 (select (arr!45925 a!2901) i!1037)))))

(declare-fun b!1390964 () Bool)

(declare-fun res!931027 () Bool)

(assert (=> b!1390964 (=> (not res!931027) (not e!787683))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95121 (_ BitVec 32)) Bool)

(assert (=> b!1390964 (= res!931027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun lt!610853 () SeekEntryResult!10268)

(declare-fun b!1390965 () Bool)

(declare-fun lt!610851 () (_ BitVec 32))

(get-info :version)

(assert (=> b!1390965 (= e!787683 (not (or (not ((_ is Intermediate!10268) lt!610853)) (undefined!11080 lt!610853) (bvslt mask!2840 #b00000000000000000000000000000000) (and (bvsge lt!610851 #b00000000000000000000000000000000) (bvslt lt!610851 (bvadd #b00000000000000000000000000000001 mask!2840))))))))

(assert (=> b!1390965 e!787684))

(declare-fun res!931029 () Bool)

(assert (=> b!1390965 (=> (not res!931029) (not e!787684))))

(assert (=> b!1390965 (= res!931029 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46383 0))(
  ( (Unit!46384) )
))
(declare-fun lt!610852 () Unit!46383)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95121 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46383)

(assert (=> b!1390965 (= lt!610852 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95121 (_ BitVec 32)) SeekEntryResult!10268)

(assert (=> b!1390965 (= lt!610853 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!610851 (select (arr!45925 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390965 (= lt!610851 (toIndex!0 (select (arr!45925 a!2901) j!112) mask!2840))))

(assert (= (and start!119282 res!931025) b!1390960))

(assert (= (and b!1390960 res!931026) b!1390963))

(assert (= (and b!1390963 res!931024) b!1390961))

(assert (= (and b!1390961 res!931030) b!1390964))

(assert (= (and b!1390964 res!931027) b!1390959))

(assert (= (and b!1390959 res!931028) b!1390965))

(assert (= (and b!1390965 res!931029) b!1390962))

(declare-fun m!1276339 () Bool)

(assert (=> b!1390964 m!1276339))

(declare-fun m!1276341 () Bool)

(assert (=> b!1390965 m!1276341))

(declare-fun m!1276343 () Bool)

(assert (=> b!1390965 m!1276343))

(assert (=> b!1390965 m!1276341))

(declare-fun m!1276345 () Bool)

(assert (=> b!1390965 m!1276345))

(assert (=> b!1390965 m!1276341))

(declare-fun m!1276347 () Bool)

(assert (=> b!1390965 m!1276347))

(declare-fun m!1276349 () Bool)

(assert (=> b!1390965 m!1276349))

(declare-fun m!1276351 () Bool)

(assert (=> b!1390959 m!1276351))

(declare-fun m!1276353 () Bool)

(assert (=> start!119282 m!1276353))

(declare-fun m!1276355 () Bool)

(assert (=> start!119282 m!1276355))

(assert (=> b!1390961 m!1276341))

(assert (=> b!1390961 m!1276341))

(declare-fun m!1276357 () Bool)

(assert (=> b!1390961 m!1276357))

(declare-fun m!1276359 () Bool)

(assert (=> b!1390963 m!1276359))

(assert (=> b!1390963 m!1276359))

(declare-fun m!1276361 () Bool)

(assert (=> b!1390963 m!1276361))

(assert (=> b!1390962 m!1276341))

(assert (=> b!1390962 m!1276341))

(declare-fun m!1276363 () Bool)

(assert (=> b!1390962 m!1276363))

(check-sat (not b!1390964) (not b!1390959) (not b!1390963) (not start!119282) (not b!1390961) (not b!1390962) (not b!1390965))
(check-sat)
(get-model)

(declare-fun d!150147 () Bool)

(assert (=> d!150147 (= (validKeyInArray!0 (select (arr!45925 a!2901) i!1037)) (and (not (= (select (arr!45925 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45925 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1390963 d!150147))

(declare-fun d!150149 () Bool)

(assert (=> d!150149 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119282 d!150149))

(declare-fun d!150157 () Bool)

(assert (=> d!150157 (= (array_inv!35158 a!2901) (bvsge (size!46477 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119282 d!150157))

(declare-fun b!1391030 () Bool)

(declare-fun e!787724 () Bool)

(declare-fun e!787722 () Bool)

(assert (=> b!1391030 (= e!787724 e!787722)))

(declare-fun res!931087 () Bool)

(assert (=> b!1391030 (=> (not res!931087) (not e!787722))))

(declare-fun e!787723 () Bool)

(assert (=> b!1391030 (= res!931087 (not e!787723))))

(declare-fun res!931086 () Bool)

(assert (=> b!1391030 (=> (not res!931086) (not e!787723))))

(assert (=> b!1391030 (= res!931086 (validKeyInArray!0 (select (arr!45925 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66701 () Bool)

(declare-fun call!66704 () Bool)

(declare-fun c!129421 () Bool)

(assert (=> bm!66701 (= call!66704 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129421 (Cons!32518 (select (arr!45925 a!2901) #b00000000000000000000000000000000) Nil!32519) Nil!32519)))))

(declare-fun d!150159 () Bool)

(declare-fun res!931085 () Bool)

(assert (=> d!150159 (=> res!931085 e!787724)))

(assert (=> d!150159 (= res!931085 (bvsge #b00000000000000000000000000000000 (size!46477 a!2901)))))

(assert (=> d!150159 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32519) e!787724)))

(declare-fun b!1391031 () Bool)

(declare-fun e!787721 () Bool)

(assert (=> b!1391031 (= e!787721 call!66704)))

(declare-fun b!1391032 () Bool)

(assert (=> b!1391032 (= e!787722 e!787721)))

(assert (=> b!1391032 (= c!129421 (validKeyInArray!0 (select (arr!45925 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1391033 () Bool)

(declare-fun contains!9725 (List!32522 (_ BitVec 64)) Bool)

(assert (=> b!1391033 (= e!787723 (contains!9725 Nil!32519 (select (arr!45925 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1391034 () Bool)

(assert (=> b!1391034 (= e!787721 call!66704)))

(assert (= (and d!150159 (not res!931085)) b!1391030))

(assert (= (and b!1391030 res!931086) b!1391033))

(assert (= (and b!1391030 res!931087) b!1391032))

(assert (= (and b!1391032 c!129421) b!1391031))

(assert (= (and b!1391032 (not c!129421)) b!1391034))

(assert (= (or b!1391031 b!1391034) bm!66701))

(declare-fun m!1276429 () Bool)

(assert (=> b!1391030 m!1276429))

(assert (=> b!1391030 m!1276429))

(declare-fun m!1276431 () Bool)

(assert (=> b!1391030 m!1276431))

(assert (=> bm!66701 m!1276429))

(declare-fun m!1276433 () Bool)

(assert (=> bm!66701 m!1276433))

(assert (=> b!1391032 m!1276429))

(assert (=> b!1391032 m!1276429))

(assert (=> b!1391032 m!1276431))

(assert (=> b!1391033 m!1276429))

(assert (=> b!1391033 m!1276429))

(declare-fun m!1276435 () Bool)

(assert (=> b!1391033 m!1276435))

(assert (=> b!1390959 d!150159))

(declare-fun bm!66704 () Bool)

(declare-fun call!66707 () Bool)

(assert (=> bm!66704 (= call!66707 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1391043 () Bool)

(declare-fun e!787732 () Bool)

(assert (=> b!1391043 (= e!787732 call!66707)))

(declare-fun b!1391044 () Bool)

(declare-fun e!787733 () Bool)

(assert (=> b!1391044 (= e!787733 e!787732)))

(declare-fun lt!610887 () (_ BitVec 64))

(assert (=> b!1391044 (= lt!610887 (select (arr!45925 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!610889 () Unit!46383)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95121 (_ BitVec 64) (_ BitVec 32)) Unit!46383)

(assert (=> b!1391044 (= lt!610889 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610887 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95121 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1391044 (arrayContainsKey!0 a!2901 lt!610887 #b00000000000000000000000000000000)))

(declare-fun lt!610888 () Unit!46383)

(assert (=> b!1391044 (= lt!610888 lt!610889)))

(declare-fun res!931093 () Bool)

(assert (=> b!1391044 (= res!931093 (= (seekEntryOrOpen!0 (select (arr!45925 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10268 #b00000000000000000000000000000000)))))

(assert (=> b!1391044 (=> (not res!931093) (not e!787732))))

(declare-fun b!1391046 () Bool)

(assert (=> b!1391046 (= e!787733 call!66707)))

(declare-fun d!150167 () Bool)

(declare-fun res!931092 () Bool)

(declare-fun e!787731 () Bool)

(assert (=> d!150167 (=> res!931092 e!787731)))

(assert (=> d!150167 (= res!931092 (bvsge #b00000000000000000000000000000000 (size!46477 a!2901)))))

(assert (=> d!150167 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!787731)))

(declare-fun b!1391045 () Bool)

(assert (=> b!1391045 (= e!787731 e!787733)))

(declare-fun c!129424 () Bool)

(assert (=> b!1391045 (= c!129424 (validKeyInArray!0 (select (arr!45925 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!150167 (not res!931092)) b!1391045))

(assert (= (and b!1391045 c!129424) b!1391044))

(assert (= (and b!1391045 (not c!129424)) b!1391046))

(assert (= (and b!1391044 res!931093) b!1391043))

(assert (= (or b!1391043 b!1391046) bm!66704))

(declare-fun m!1276437 () Bool)

(assert (=> bm!66704 m!1276437))

(assert (=> b!1391044 m!1276429))

(declare-fun m!1276439 () Bool)

(assert (=> b!1391044 m!1276439))

(declare-fun m!1276441 () Bool)

(assert (=> b!1391044 m!1276441))

(assert (=> b!1391044 m!1276429))

(declare-fun m!1276443 () Bool)

(assert (=> b!1391044 m!1276443))

(assert (=> b!1391045 m!1276429))

(assert (=> b!1391045 m!1276429))

(assert (=> b!1391045 m!1276431))

(assert (=> b!1390964 d!150167))

(declare-fun call!66708 () Bool)

(declare-fun bm!66705 () Bool)

(assert (=> bm!66705 (= call!66708 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1391047 () Bool)

(declare-fun e!787735 () Bool)

(assert (=> b!1391047 (= e!787735 call!66708)))

(declare-fun b!1391048 () Bool)

(declare-fun e!787736 () Bool)

(assert (=> b!1391048 (= e!787736 e!787735)))

(declare-fun lt!610890 () (_ BitVec 64))

(assert (=> b!1391048 (= lt!610890 (select (arr!45925 a!2901) j!112))))

(declare-fun lt!610892 () Unit!46383)

(assert (=> b!1391048 (= lt!610892 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610890 j!112))))

(assert (=> b!1391048 (arrayContainsKey!0 a!2901 lt!610890 #b00000000000000000000000000000000)))

(declare-fun lt!610891 () Unit!46383)

(assert (=> b!1391048 (= lt!610891 lt!610892)))

(declare-fun res!931095 () Bool)

(assert (=> b!1391048 (= res!931095 (= (seekEntryOrOpen!0 (select (arr!45925 a!2901) j!112) a!2901 mask!2840) (Found!10268 j!112)))))

(assert (=> b!1391048 (=> (not res!931095) (not e!787735))))

(declare-fun b!1391050 () Bool)

(assert (=> b!1391050 (= e!787736 call!66708)))

(declare-fun d!150175 () Bool)

(declare-fun res!931094 () Bool)

(declare-fun e!787734 () Bool)

(assert (=> d!150175 (=> res!931094 e!787734)))

(assert (=> d!150175 (= res!931094 (bvsge j!112 (size!46477 a!2901)))))

(assert (=> d!150175 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!787734)))

(declare-fun b!1391049 () Bool)

(assert (=> b!1391049 (= e!787734 e!787736)))

(declare-fun c!129425 () Bool)

(assert (=> b!1391049 (= c!129425 (validKeyInArray!0 (select (arr!45925 a!2901) j!112)))))

(assert (= (and d!150175 (not res!931094)) b!1391049))

(assert (= (and b!1391049 c!129425) b!1391048))

(assert (= (and b!1391049 (not c!129425)) b!1391050))

(assert (= (and b!1391048 res!931095) b!1391047))

(assert (= (or b!1391047 b!1391050) bm!66705))

(declare-fun m!1276445 () Bool)

(assert (=> bm!66705 m!1276445))

(assert (=> b!1391048 m!1276341))

(declare-fun m!1276447 () Bool)

(assert (=> b!1391048 m!1276447))

(declare-fun m!1276449 () Bool)

(assert (=> b!1391048 m!1276449))

(assert (=> b!1391048 m!1276341))

(assert (=> b!1391048 m!1276363))

(assert (=> b!1391049 m!1276341))

(assert (=> b!1391049 m!1276341))

(assert (=> b!1391049 m!1276357))

(assert (=> b!1390965 d!150175))

(declare-fun d!150177 () Bool)

(assert (=> d!150177 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!610901 () Unit!46383)

(declare-fun choose!38 (array!95121 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46383)

(assert (=> d!150177 (= lt!610901 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150177 (validMask!0 mask!2840)))

(assert (=> d!150177 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!610901)))

(declare-fun bs!40441 () Bool)

(assert (= bs!40441 d!150177))

(assert (=> bs!40441 m!1276349))

(declare-fun m!1276455 () Bool)

(assert (=> bs!40441 m!1276455))

(assert (=> bs!40441 m!1276353))

(assert (=> b!1390965 d!150177))

(declare-fun b!1391147 () Bool)

(declare-fun e!787798 () SeekEntryResult!10268)

(declare-fun e!787801 () SeekEntryResult!10268)

(assert (=> b!1391147 (= e!787798 e!787801)))

(declare-fun c!129459 () Bool)

(declare-fun lt!610927 () (_ BitVec 64))

(assert (=> b!1391147 (= c!129459 (or (= lt!610927 (select (arr!45925 a!2901) j!112)) (= (bvadd lt!610927 lt!610927) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1391148 () Bool)

(declare-fun lt!610928 () SeekEntryResult!10268)

(assert (=> b!1391148 (and (bvsge (index!43445 lt!610928) #b00000000000000000000000000000000) (bvslt (index!43445 lt!610928) (size!46477 a!2901)))))

(declare-fun res!931126 () Bool)

(assert (=> b!1391148 (= res!931126 (= (select (arr!45925 a!2901) (index!43445 lt!610928)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!787799 () Bool)

(assert (=> b!1391148 (=> res!931126 e!787799)))

(declare-fun b!1391149 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391149 (= e!787801 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!610851 #b00000000000000000000000000000000 mask!2840) (select (arr!45925 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391150 () Bool)

(declare-fun e!787802 () Bool)

(declare-fun e!787800 () Bool)

(assert (=> b!1391150 (= e!787802 e!787800)))

(declare-fun res!931127 () Bool)

(assert (=> b!1391150 (= res!931127 (and ((_ is Intermediate!10268) lt!610928) (not (undefined!11080 lt!610928)) (bvslt (x!125117 lt!610928) #b01111111111111111111111111111110) (bvsge (x!125117 lt!610928) #b00000000000000000000000000000000) (bvsge (x!125117 lt!610928) #b00000000000000000000000000000000)))))

(assert (=> b!1391150 (=> (not res!931127) (not e!787800))))

(declare-fun b!1391151 () Bool)

(assert (=> b!1391151 (= e!787798 (Intermediate!10268 true lt!610851 #b00000000000000000000000000000000))))

(declare-fun b!1391152 () Bool)

(assert (=> b!1391152 (= e!787801 (Intermediate!10268 false lt!610851 #b00000000000000000000000000000000))))

(declare-fun d!150181 () Bool)

(assert (=> d!150181 e!787802))

(declare-fun c!129460 () Bool)

(assert (=> d!150181 (= c!129460 (and ((_ is Intermediate!10268) lt!610928) (undefined!11080 lt!610928)))))

(assert (=> d!150181 (= lt!610928 e!787798)))

(declare-fun c!129461 () Bool)

(assert (=> d!150181 (= c!129461 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!150181 (= lt!610927 (select (arr!45925 a!2901) lt!610851))))

(assert (=> d!150181 (validMask!0 mask!2840)))

(assert (=> d!150181 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!610851 (select (arr!45925 a!2901) j!112) a!2901 mask!2840) lt!610928)))

(declare-fun b!1391153 () Bool)

(assert (=> b!1391153 (and (bvsge (index!43445 lt!610928) #b00000000000000000000000000000000) (bvslt (index!43445 lt!610928) (size!46477 a!2901)))))

(declare-fun res!931128 () Bool)

(assert (=> b!1391153 (= res!931128 (= (select (arr!45925 a!2901) (index!43445 lt!610928)) (select (arr!45925 a!2901) j!112)))))

(assert (=> b!1391153 (=> res!931128 e!787799)))

(assert (=> b!1391153 (= e!787800 e!787799)))

(declare-fun b!1391154 () Bool)

(assert (=> b!1391154 (and (bvsge (index!43445 lt!610928) #b00000000000000000000000000000000) (bvslt (index!43445 lt!610928) (size!46477 a!2901)))))

(assert (=> b!1391154 (= e!787799 (= (select (arr!45925 a!2901) (index!43445 lt!610928)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1391155 () Bool)

(assert (=> b!1391155 (= e!787802 (bvsge (x!125117 lt!610928) #b01111111111111111111111111111110))))

(assert (= (and d!150181 c!129461) b!1391151))

(assert (= (and d!150181 (not c!129461)) b!1391147))

(assert (= (and b!1391147 c!129459) b!1391152))

(assert (= (and b!1391147 (not c!129459)) b!1391149))

(assert (= (and d!150181 c!129460) b!1391155))

(assert (= (and d!150181 (not c!129460)) b!1391150))

(assert (= (and b!1391150 res!931127) b!1391153))

(assert (= (and b!1391153 (not res!931128)) b!1391148))

(assert (= (and b!1391148 (not res!931126)) b!1391154))

(declare-fun m!1276495 () Bool)

(assert (=> b!1391153 m!1276495))

(assert (=> b!1391148 m!1276495))

(assert (=> b!1391154 m!1276495))

(declare-fun m!1276497 () Bool)

(assert (=> b!1391149 m!1276497))

(assert (=> b!1391149 m!1276497))

(assert (=> b!1391149 m!1276341))

(declare-fun m!1276499 () Bool)

(assert (=> b!1391149 m!1276499))

(declare-fun m!1276501 () Bool)

(assert (=> d!150181 m!1276501))

(assert (=> d!150181 m!1276353))

(assert (=> b!1390965 d!150181))

(declare-fun d!150195 () Bool)

(declare-fun lt!610943 () (_ BitVec 32))

(declare-fun lt!610942 () (_ BitVec 32))

(assert (=> d!150195 (= lt!610943 (bvmul (bvxor lt!610942 (bvlshr lt!610942 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150195 (= lt!610942 ((_ extract 31 0) (bvand (bvxor (select (arr!45925 a!2901) j!112) (bvlshr (select (arr!45925 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150195 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!931131 (let ((h!33742 ((_ extract 31 0) (bvand (bvxor (select (arr!45925 a!2901) j!112) (bvlshr (select (arr!45925 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125121 (bvmul (bvxor h!33742 (bvlshr h!33742 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125121 (bvlshr x!125121 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!931131 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!931131 #b00000000000000000000000000000000))))))

(assert (=> d!150195 (= (toIndex!0 (select (arr!45925 a!2901) j!112) mask!2840) (bvand (bvxor lt!610943 (bvlshr lt!610943 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1390965 d!150195))

(declare-fun d!150203 () Bool)

(assert (=> d!150203 (= (validKeyInArray!0 (select (arr!45925 a!2901) j!112)) (and (not (= (select (arr!45925 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45925 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1390961 d!150203))

(declare-fun b!1391226 () Bool)

(declare-fun e!787842 () SeekEntryResult!10268)

(declare-fun lt!610962 () SeekEntryResult!10268)

(assert (=> b!1391226 (= e!787842 (Found!10268 (index!43445 lt!610962)))))

(declare-fun b!1391227 () Bool)

(declare-fun e!787844 () SeekEntryResult!10268)

(assert (=> b!1391227 (= e!787844 e!787842)))

(declare-fun lt!610963 () (_ BitVec 64))

(assert (=> b!1391227 (= lt!610963 (select (arr!45925 a!2901) (index!43445 lt!610962)))))

(declare-fun c!129487 () Bool)

(assert (=> b!1391227 (= c!129487 (= lt!610963 (select (arr!45925 a!2901) j!112)))))

(declare-fun d!150205 () Bool)

(declare-fun lt!610964 () SeekEntryResult!10268)

(assert (=> d!150205 (and (or ((_ is Undefined!10268) lt!610964) (not ((_ is Found!10268) lt!610964)) (and (bvsge (index!43444 lt!610964) #b00000000000000000000000000000000) (bvslt (index!43444 lt!610964) (size!46477 a!2901)))) (or ((_ is Undefined!10268) lt!610964) ((_ is Found!10268) lt!610964) (not ((_ is MissingZero!10268) lt!610964)) (and (bvsge (index!43443 lt!610964) #b00000000000000000000000000000000) (bvslt (index!43443 lt!610964) (size!46477 a!2901)))) (or ((_ is Undefined!10268) lt!610964) ((_ is Found!10268) lt!610964) ((_ is MissingZero!10268) lt!610964) (not ((_ is MissingVacant!10268) lt!610964)) (and (bvsge (index!43446 lt!610964) #b00000000000000000000000000000000) (bvslt (index!43446 lt!610964) (size!46477 a!2901)))) (or ((_ is Undefined!10268) lt!610964) (ite ((_ is Found!10268) lt!610964) (= (select (arr!45925 a!2901) (index!43444 lt!610964)) (select (arr!45925 a!2901) j!112)) (ite ((_ is MissingZero!10268) lt!610964) (= (select (arr!45925 a!2901) (index!43443 lt!610964)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10268) lt!610964) (= (select (arr!45925 a!2901) (index!43446 lt!610964)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150205 (= lt!610964 e!787844)))

(declare-fun c!129488 () Bool)

(assert (=> d!150205 (= c!129488 (and ((_ is Intermediate!10268) lt!610962) (undefined!11080 lt!610962)))))

(assert (=> d!150205 (= lt!610962 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45925 a!2901) j!112) mask!2840) (select (arr!45925 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150205 (validMask!0 mask!2840)))

(assert (=> d!150205 (= (seekEntryOrOpen!0 (select (arr!45925 a!2901) j!112) a!2901 mask!2840) lt!610964)))

(declare-fun b!1391228 () Bool)

(declare-fun c!129489 () Bool)

(assert (=> b!1391228 (= c!129489 (= lt!610963 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!787843 () SeekEntryResult!10268)

(assert (=> b!1391228 (= e!787842 e!787843)))

(declare-fun b!1391229 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95121 (_ BitVec 32)) SeekEntryResult!10268)

(assert (=> b!1391229 (= e!787843 (seekKeyOrZeroReturnVacant!0 (x!125117 lt!610962) (index!43445 lt!610962) (index!43445 lt!610962) (select (arr!45925 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391230 () Bool)

(assert (=> b!1391230 (= e!787843 (MissingZero!10268 (index!43445 lt!610962)))))

(declare-fun b!1391231 () Bool)

(assert (=> b!1391231 (= e!787844 Undefined!10268)))

(assert (= (and d!150205 c!129488) b!1391231))

(assert (= (and d!150205 (not c!129488)) b!1391227))

(assert (= (and b!1391227 c!129487) b!1391226))

(assert (= (and b!1391227 (not c!129487)) b!1391228))

(assert (= (and b!1391228 c!129489) b!1391230))

(assert (= (and b!1391228 (not c!129489)) b!1391229))

(declare-fun m!1276521 () Bool)

(assert (=> b!1391227 m!1276521))

(assert (=> d!150205 m!1276353))

(assert (=> d!150205 m!1276343))

(assert (=> d!150205 m!1276341))

(declare-fun m!1276527 () Bool)

(assert (=> d!150205 m!1276527))

(assert (=> d!150205 m!1276341))

(assert (=> d!150205 m!1276343))

(declare-fun m!1276531 () Bool)

(assert (=> d!150205 m!1276531))

(declare-fun m!1276533 () Bool)

(assert (=> d!150205 m!1276533))

(declare-fun m!1276537 () Bool)

(assert (=> d!150205 m!1276537))

(assert (=> b!1391229 m!1276341))

(declare-fun m!1276539 () Bool)

(assert (=> b!1391229 m!1276539))

(assert (=> b!1390962 d!150205))

(check-sat (not d!150181) (not b!1391030) (not b!1391045) (not b!1391032) (not b!1391149) (not d!150205) (not b!1391229) (not b!1391033) (not b!1391044) (not bm!66701) (not bm!66705) (not bm!66704) (not b!1391048) (not d!150177) (not b!1391049))
(check-sat)
