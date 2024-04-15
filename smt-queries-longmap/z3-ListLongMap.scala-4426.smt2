; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61268 () Bool)

(assert start!61268)

(declare-fun b!686355 () Bool)

(declare-fun res!451621 () Bool)

(declare-fun e!390802 () Bool)

(assert (=> b!686355 (=> (not res!451621) (not e!390802))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39663 0))(
  ( (array!39664 (arr!19007 (Array (_ BitVec 32) (_ BitVec 64))) (size!19381 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39663)

(assert (=> b!686355 (= res!451621 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19381 a!3626))))))

(declare-fun b!686356 () Bool)

(declare-datatypes ((Unit!24185 0))(
  ( (Unit!24186) )
))
(declare-fun e!390805 () Unit!24185)

(declare-fun lt!314892 () Unit!24185)

(assert (=> b!686356 (= e!390805 lt!314892)))

(declare-fun lt!314895 () Unit!24185)

(declare-datatypes ((List!13087 0))(
  ( (Nil!13084) (Cons!13083 (h!14128 (_ BitVec 64)) (t!19333 List!13087)) )
))
(declare-fun acc!681 () List!13087)

(declare-fun lemmaListSubSeqRefl!0 (List!13087) Unit!24185)

(assert (=> b!686356 (= lt!314895 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!212 (List!13087 List!13087) Bool)

(assert (=> b!686356 (subseq!212 acc!681 acc!681)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39663 List!13087 List!13087 (_ BitVec 32)) Unit!24185)

(declare-fun $colon$colon!376 (List!13087 (_ BitVec 64)) List!13087)

(assert (=> b!686356 (= lt!314892 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!376 acc!681 (select (arr!19007 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39663 (_ BitVec 32) List!13087) Bool)

(assert (=> b!686356 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!686357 () Bool)

(declare-fun e!390800 () Bool)

(declare-fun e!390804 () Bool)

(assert (=> b!686357 (= e!390800 e!390804)))

(declare-fun res!451616 () Bool)

(assert (=> b!686357 (=> (not res!451616) (not e!390804))))

(assert (=> b!686357 (= res!451616 (bvsle from!3004 i!1382))))

(declare-fun b!686358 () Bool)

(declare-fun e!390799 () Bool)

(declare-fun lt!314887 () List!13087)

(declare-fun noDuplicate!878 (List!13087) Bool)

(assert (=> b!686358 (= e!390799 (noDuplicate!878 lt!314887))))

(declare-fun b!686360 () Bool)

(declare-fun Unit!24187 () Unit!24185)

(assert (=> b!686360 (= e!390805 Unit!24187)))

(declare-fun b!686361 () Bool)

(declare-fun e!390801 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3609 (List!13087 (_ BitVec 64)) Bool)

(assert (=> b!686361 (= e!390801 (contains!3609 acc!681 k0!2843))))

(declare-fun b!686362 () Bool)

(declare-fun res!451608 () Bool)

(assert (=> b!686362 (=> (not res!451608) (not e!390802))))

(assert (=> b!686362 (= res!451608 (noDuplicate!878 acc!681))))

(declare-fun b!686363 () Bool)

(assert (=> b!686363 (= e!390802 (not e!390799))))

(declare-fun res!451613 () Bool)

(assert (=> b!686363 (=> res!451613 e!390799)))

(assert (=> b!686363 (= res!451613 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!686363 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!314887)))

(declare-fun lt!314893 () Unit!24185)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39663 (_ BitVec 64) (_ BitVec 32) List!13087 List!13087) Unit!24185)

(assert (=> b!686363 (= lt!314893 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!314887))))

(declare-fun -!177 (List!13087 (_ BitVec 64)) List!13087)

(assert (=> b!686363 (= (-!177 lt!314887 k0!2843) acc!681)))

(assert (=> b!686363 (= lt!314887 ($colon$colon!376 acc!681 k0!2843))))

(declare-fun lt!314891 () Unit!24185)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13087) Unit!24185)

(assert (=> b!686363 (= lt!314891 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!686363 (subseq!212 acc!681 acc!681)))

(declare-fun lt!314894 () Unit!24185)

(assert (=> b!686363 (= lt!314894 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!686363 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314889 () Unit!24185)

(assert (=> b!686363 (= lt!314889 e!390805)))

(declare-fun c!77742 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!686363 (= c!77742 (validKeyInArray!0 (select (arr!19007 a!3626) from!3004)))))

(declare-fun lt!314888 () Unit!24185)

(declare-fun e!390803 () Unit!24185)

(assert (=> b!686363 (= lt!314888 e!390803)))

(declare-fun c!77741 () Bool)

(declare-fun arrayContainsKey!0 (array!39663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!686363 (= c!77741 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686363 (arrayContainsKey!0 (array!39664 (store (arr!19007 a!3626) i!1382 k0!2843) (size!19381 a!3626)) k0!2843 from!3004)))

(declare-fun b!686364 () Bool)

(declare-fun res!451612 () Bool)

(assert (=> b!686364 (=> (not res!451612) (not e!390802))))

(assert (=> b!686364 (= res!451612 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!686365 () Bool)

(declare-fun Unit!24188 () Unit!24185)

(assert (=> b!686365 (= e!390803 Unit!24188)))

(declare-fun lt!314890 () Unit!24185)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39663 (_ BitVec 64) (_ BitVec 32)) Unit!24185)

(assert (=> b!686365 (= lt!314890 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!686365 false))

(declare-fun b!686366 () Bool)

(declare-fun res!451619 () Bool)

(assert (=> b!686366 (=> (not res!451619) (not e!390802))))

(assert (=> b!686366 (= res!451619 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19381 a!3626)) (= from!3004 i!1382)))))

(declare-fun res!451614 () Bool)

(assert (=> start!61268 (=> (not res!451614) (not e!390802))))

(assert (=> start!61268 (= res!451614 (and (bvslt (size!19381 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19381 a!3626))))))

(assert (=> start!61268 e!390802))

(assert (=> start!61268 true))

(declare-fun array_inv!14890 (array!39663) Bool)

(assert (=> start!61268 (array_inv!14890 a!3626)))

(declare-fun b!686359 () Bool)

(declare-fun res!451610 () Bool)

(assert (=> b!686359 (=> (not res!451610) (not e!390802))))

(assert (=> b!686359 (= res!451610 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13084))))

(declare-fun b!686367 () Bool)

(declare-fun res!451620 () Bool)

(assert (=> b!686367 (=> (not res!451620) (not e!390802))))

(assert (=> b!686367 (= res!451620 e!390800)))

(declare-fun res!451607 () Bool)

(assert (=> b!686367 (=> res!451607 e!390800)))

(assert (=> b!686367 (= res!451607 e!390801)))

(declare-fun res!451615 () Bool)

(assert (=> b!686367 (=> (not res!451615) (not e!390801))))

(assert (=> b!686367 (= res!451615 (bvsgt from!3004 i!1382))))

(declare-fun b!686368 () Bool)

(declare-fun Unit!24189 () Unit!24185)

(assert (=> b!686368 (= e!390803 Unit!24189)))

(declare-fun b!686369 () Bool)

(declare-fun res!451618 () Bool)

(assert (=> b!686369 (=> (not res!451618) (not e!390802))))

(assert (=> b!686369 (= res!451618 (validKeyInArray!0 k0!2843))))

(declare-fun b!686370 () Bool)

(declare-fun res!451611 () Bool)

(assert (=> b!686370 (=> (not res!451611) (not e!390802))))

(assert (=> b!686370 (= res!451611 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!686371 () Bool)

(declare-fun res!451609 () Bool)

(assert (=> b!686371 (=> (not res!451609) (not e!390802))))

(assert (=> b!686371 (= res!451609 (not (contains!3609 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686372 () Bool)

(assert (=> b!686372 (= e!390804 (not (contains!3609 acc!681 k0!2843)))))

(declare-fun b!686373 () Bool)

(declare-fun res!451617 () Bool)

(assert (=> b!686373 (=> (not res!451617) (not e!390802))))

(assert (=> b!686373 (= res!451617 (not (contains!3609 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!61268 res!451614) b!686362))

(assert (= (and b!686362 res!451608) b!686373))

(assert (= (and b!686373 res!451617) b!686371))

(assert (= (and b!686371 res!451609) b!686367))

(assert (= (and b!686367 res!451615) b!686361))

(assert (= (and b!686367 (not res!451607)) b!686357))

(assert (= (and b!686357 res!451616) b!686372))

(assert (= (and b!686367 res!451620) b!686359))

(assert (= (and b!686359 res!451610) b!686364))

(assert (= (and b!686364 res!451612) b!686355))

(assert (= (and b!686355 res!451621) b!686369))

(assert (= (and b!686369 res!451618) b!686370))

(assert (= (and b!686370 res!451611) b!686366))

(assert (= (and b!686366 res!451619) b!686363))

(assert (= (and b!686363 c!77741) b!686365))

(assert (= (and b!686363 (not c!77741)) b!686368))

(assert (= (and b!686363 c!77742) b!686356))

(assert (= (and b!686363 (not c!77742)) b!686360))

(assert (= (and b!686363 (not res!451613)) b!686358))

(declare-fun m!649947 () Bool)

(assert (=> b!686356 m!649947))

(declare-fun m!649949 () Bool)

(assert (=> b!686356 m!649949))

(declare-fun m!649951 () Bool)

(assert (=> b!686356 m!649951))

(declare-fun m!649953 () Bool)

(assert (=> b!686356 m!649953))

(assert (=> b!686356 m!649949))

(assert (=> b!686356 m!649951))

(declare-fun m!649955 () Bool)

(assert (=> b!686356 m!649955))

(declare-fun m!649957 () Bool)

(assert (=> b!686356 m!649957))

(declare-fun m!649959 () Bool)

(assert (=> b!686362 m!649959))

(declare-fun m!649961 () Bool)

(assert (=> b!686361 m!649961))

(declare-fun m!649963 () Bool)

(assert (=> b!686359 m!649963))

(declare-fun m!649965 () Bool)

(assert (=> b!686370 m!649965))

(declare-fun m!649967 () Bool)

(assert (=> b!686365 m!649967))

(declare-fun m!649969 () Bool)

(assert (=> b!686364 m!649969))

(declare-fun m!649971 () Bool)

(assert (=> b!686373 m!649971))

(assert (=> b!686372 m!649961))

(declare-fun m!649973 () Bool)

(assert (=> b!686369 m!649973))

(declare-fun m!649975 () Bool)

(assert (=> b!686371 m!649975))

(declare-fun m!649977 () Bool)

(assert (=> b!686358 m!649977))

(declare-fun m!649979 () Bool)

(assert (=> start!61268 m!649979))

(declare-fun m!649981 () Bool)

(assert (=> b!686363 m!649981))

(assert (=> b!686363 m!649947))

(assert (=> b!686363 m!649949))

(declare-fun m!649983 () Bool)

(assert (=> b!686363 m!649983))

(declare-fun m!649985 () Bool)

(assert (=> b!686363 m!649985))

(declare-fun m!649987 () Bool)

(assert (=> b!686363 m!649987))

(declare-fun m!649989 () Bool)

(assert (=> b!686363 m!649989))

(assert (=> b!686363 m!649955))

(declare-fun m!649991 () Bool)

(assert (=> b!686363 m!649991))

(declare-fun m!649993 () Bool)

(assert (=> b!686363 m!649993))

(assert (=> b!686363 m!649949))

(declare-fun m!649995 () Bool)

(assert (=> b!686363 m!649995))

(declare-fun m!649997 () Bool)

(assert (=> b!686363 m!649997))

(assert (=> b!686363 m!649957))

(check-sat (not b!686358) (not b!686369) (not b!686363) (not b!686371) (not b!686372) (not b!686362) (not b!686364) (not b!686365) (not b!686361) (not b!686373) (not start!61268) (not b!686356) (not b!686359) (not b!686370))
(check-sat)
(get-model)

(declare-fun d!94551 () Bool)

(assert (=> d!94551 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!314952 () Unit!24185)

(declare-fun choose!13 (array!39663 (_ BitVec 64) (_ BitVec 32)) Unit!24185)

(assert (=> d!94551 (= lt!314952 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!94551 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!94551 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!314952)))

(declare-fun bs!20100 () Bool)

(assert (= bs!20100 d!94551))

(assert (=> bs!20100 m!649965))

(declare-fun m!650103 () Bool)

(assert (=> bs!20100 m!650103))

(assert (=> b!686365 d!94551))

(declare-fun d!94553 () Bool)

(assert (=> d!94553 (= ($colon$colon!376 acc!681 (select (arr!19007 a!3626) from!3004)) (Cons!13083 (select (arr!19007 a!3626) from!3004) acc!681))))

(assert (=> b!686356 d!94553))

(declare-fun b!686496 () Bool)

(declare-fun e!390866 () Bool)

(declare-fun e!390864 () Bool)

(assert (=> b!686496 (= e!390866 e!390864)))

(declare-fun res!451722 () Bool)

(assert (=> b!686496 (=> (not res!451722) (not e!390864))))

(get-info :version)

(assert (=> b!686496 (= res!451722 ((_ is Cons!13083) acc!681))))

(declare-fun b!686499 () Bool)

(declare-fun e!390865 () Bool)

(assert (=> b!686499 (= e!390865 (subseq!212 acc!681 (t!19333 acc!681)))))

(declare-fun b!686497 () Bool)

(assert (=> b!686497 (= e!390864 e!390865)))

(declare-fun res!451721 () Bool)

(assert (=> b!686497 (=> res!451721 e!390865)))

(declare-fun e!390863 () Bool)

(assert (=> b!686497 (= res!451721 e!390863)))

(declare-fun res!451723 () Bool)

(assert (=> b!686497 (=> (not res!451723) (not e!390863))))

(assert (=> b!686497 (= res!451723 (= (h!14128 acc!681) (h!14128 acc!681)))))

(declare-fun d!94555 () Bool)

(declare-fun res!451720 () Bool)

(assert (=> d!94555 (=> res!451720 e!390866)))

(assert (=> d!94555 (= res!451720 ((_ is Nil!13084) acc!681))))

(assert (=> d!94555 (= (subseq!212 acc!681 acc!681) e!390866)))

(declare-fun b!686498 () Bool)

(assert (=> b!686498 (= e!390863 (subseq!212 (t!19333 acc!681) (t!19333 acc!681)))))

(assert (= (and d!94555 (not res!451720)) b!686496))

(assert (= (and b!686496 res!451722) b!686497))

(assert (= (and b!686497 res!451723) b!686498))

(assert (= (and b!686497 (not res!451721)) b!686499))

(declare-fun m!650105 () Bool)

(assert (=> b!686499 m!650105))

(declare-fun m!650107 () Bool)

(assert (=> b!686498 m!650107))

(assert (=> b!686356 d!94555))

(declare-fun d!94557 () Bool)

(assert (=> d!94557 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314955 () Unit!24185)

(declare-fun choose!80 (array!39663 List!13087 List!13087 (_ BitVec 32)) Unit!24185)

(assert (=> d!94557 (= lt!314955 (choose!80 a!3626 ($colon$colon!376 acc!681 (select (arr!19007 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!94557 (bvslt (size!19381 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94557 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!376 acc!681 (select (arr!19007 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!314955)))

(declare-fun bs!20101 () Bool)

(assert (= bs!20101 d!94557))

(assert (=> bs!20101 m!649947))

(assert (=> bs!20101 m!649951))

(declare-fun m!650109 () Bool)

(assert (=> bs!20101 m!650109))

(assert (=> b!686356 d!94557))

(declare-fun d!94559 () Bool)

(assert (=> d!94559 (subseq!212 acc!681 acc!681)))

(declare-fun lt!314958 () Unit!24185)

(declare-fun choose!36 (List!13087) Unit!24185)

(assert (=> d!94559 (= lt!314958 (choose!36 acc!681))))

(assert (=> d!94559 (= (lemmaListSubSeqRefl!0 acc!681) lt!314958)))

(declare-fun bs!20102 () Bool)

(assert (= bs!20102 d!94559))

(assert (=> bs!20102 m!649957))

(declare-fun m!650111 () Bool)

(assert (=> bs!20102 m!650111))

(assert (=> b!686356 d!94559))

(declare-fun b!686511 () Bool)

(declare-fun e!390876 () Bool)

(assert (=> b!686511 (= e!390876 (contains!3609 acc!681 (select (arr!19007 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!686512 () Bool)

(declare-fun e!390878 () Bool)

(declare-fun call!34075 () Bool)

(assert (=> b!686512 (= e!390878 call!34075)))

(declare-fun b!686513 () Bool)

(assert (=> b!686513 (= e!390878 call!34075)))

(declare-fun b!686514 () Bool)

(declare-fun e!390877 () Bool)

(assert (=> b!686514 (= e!390877 e!390878)))

(declare-fun c!77757 () Bool)

(assert (=> b!686514 (= c!77757 (validKeyInArray!0 (select (arr!19007 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun bm!34072 () Bool)

(assert (=> bm!34072 (= call!34075 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77757 (Cons!13083 (select (arr!19007 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!686510 () Bool)

(declare-fun e!390875 () Bool)

(assert (=> b!686510 (= e!390875 e!390877)))

(declare-fun res!451732 () Bool)

(assert (=> b!686510 (=> (not res!451732) (not e!390877))))

(assert (=> b!686510 (= res!451732 (not e!390876))))

(declare-fun res!451730 () Bool)

(assert (=> b!686510 (=> (not res!451730) (not e!390876))))

(assert (=> b!686510 (= res!451730 (validKeyInArray!0 (select (arr!19007 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!94561 () Bool)

(declare-fun res!451731 () Bool)

(assert (=> d!94561 (=> res!451731 e!390875)))

(assert (=> d!94561 (= res!451731 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19381 a!3626)))))

(assert (=> d!94561 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!390875)))

(assert (= (and d!94561 (not res!451731)) b!686510))

(assert (= (and b!686510 res!451730) b!686511))

(assert (= (and b!686510 res!451732) b!686514))

(assert (= (and b!686514 c!77757) b!686512))

(assert (= (and b!686514 (not c!77757)) b!686513))

(assert (= (or b!686512 b!686513) bm!34072))

(declare-fun m!650113 () Bool)

(assert (=> b!686511 m!650113))

(assert (=> b!686511 m!650113))

(declare-fun m!650115 () Bool)

(assert (=> b!686511 m!650115))

(assert (=> b!686514 m!650113))

(assert (=> b!686514 m!650113))

(declare-fun m!650117 () Bool)

(assert (=> b!686514 m!650117))

(assert (=> bm!34072 m!650113))

(declare-fun m!650119 () Bool)

(assert (=> bm!34072 m!650119))

(assert (=> b!686510 m!650113))

(assert (=> b!686510 m!650113))

(assert (=> b!686510 m!650117))

(assert (=> b!686356 d!94561))

(declare-fun d!94563 () Bool)

(assert (=> d!94563 (= (array_inv!14890 a!3626) (bvsge (size!19381 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61268 d!94563))

(assert (=> b!686363 d!94555))

(declare-fun d!94565 () Bool)

(declare-fun res!451737 () Bool)

(declare-fun e!390883 () Bool)

(assert (=> d!94565 (=> res!451737 e!390883)))

(assert (=> d!94565 (= res!451737 (= (select (arr!19007 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!94565 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!390883)))

(declare-fun b!686519 () Bool)

(declare-fun e!390884 () Bool)

(assert (=> b!686519 (= e!390883 e!390884)))

(declare-fun res!451738 () Bool)

(assert (=> b!686519 (=> (not res!451738) (not e!390884))))

(assert (=> b!686519 (= res!451738 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19381 a!3626)))))

(declare-fun b!686520 () Bool)

(assert (=> b!686520 (= e!390884 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94565 (not res!451737)) b!686519))

(assert (= (and b!686519 res!451738) b!686520))

(assert (=> d!94565 m!650113))

(declare-fun m!650121 () Bool)

(assert (=> b!686520 m!650121))

(assert (=> b!686363 d!94565))

(declare-fun b!686537 () Bool)

(declare-fun e!390899 () List!13087)

(assert (=> b!686537 (= e!390899 Nil!13084)))

(declare-fun b!686538 () Bool)

(declare-fun e!390898 () List!13087)

(declare-fun call!34078 () List!13087)

(assert (=> b!686538 (= e!390898 call!34078)))

(declare-fun bm!34075 () Bool)

(assert (=> bm!34075 (= call!34078 (-!177 (t!19333 lt!314887) k0!2843))))

(declare-fun b!686539 () Bool)

(assert (=> b!686539 (= e!390898 (Cons!13083 (h!14128 lt!314887) call!34078))))

(declare-fun b!686540 () Bool)

(assert (=> b!686540 (= e!390899 e!390898)))

(declare-fun c!77763 () Bool)

(assert (=> b!686540 (= c!77763 (= k0!2843 (h!14128 lt!314887)))))

(declare-fun d!94567 () Bool)

(declare-fun e!390900 () Bool)

(assert (=> d!94567 e!390900))

(declare-fun res!451747 () Bool)

(assert (=> d!94567 (=> (not res!451747) (not e!390900))))

(declare-fun lt!314961 () List!13087)

(declare-fun size!19384 (List!13087) Int)

(assert (=> d!94567 (= res!451747 (<= (size!19384 lt!314961) (size!19384 lt!314887)))))

(assert (=> d!94567 (= lt!314961 e!390899)))

(declare-fun c!77762 () Bool)

(assert (=> d!94567 (= c!77762 ((_ is Cons!13083) lt!314887))))

(assert (=> d!94567 (= (-!177 lt!314887 k0!2843) lt!314961)))

(declare-fun b!686541 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!293 (List!13087) (InoxSet (_ BitVec 64)))

(assert (=> b!686541 (= e!390900 (= (content!293 lt!314961) ((_ map and) (content!293 lt!314887) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2843 true)))))))

(assert (= (and d!94567 c!77762) b!686540))

(assert (= (and d!94567 (not c!77762)) b!686537))

(assert (= (and b!686540 c!77763) b!686538))

(assert (= (and b!686540 (not c!77763)) b!686539))

(assert (= (or b!686538 b!686539) bm!34075))

(assert (= (and d!94567 res!451747) b!686541))

(declare-fun m!650127 () Bool)

(assert (=> bm!34075 m!650127))

(declare-fun m!650129 () Bool)

(assert (=> d!94567 m!650129))

(declare-fun m!650131 () Bool)

(assert (=> d!94567 m!650131))

(declare-fun m!650133 () Bool)

(assert (=> b!686541 m!650133))

(declare-fun m!650135 () Bool)

(assert (=> b!686541 m!650135))

(declare-fun m!650137 () Bool)

(assert (=> b!686541 m!650137))

(assert (=> b!686363 d!94567))

(declare-fun d!94573 () Bool)

(assert (=> d!94573 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!314887)))

(declare-fun lt!314967 () Unit!24185)

(declare-fun choose!66 (array!39663 (_ BitVec 64) (_ BitVec 32) List!13087 List!13087) Unit!24185)

(assert (=> d!94573 (= lt!314967 (choose!66 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!314887))))

(assert (=> d!94573 (bvslt (size!19381 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94573 (= (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!314887) lt!314967)))

(declare-fun bs!20103 () Bool)

(assert (= bs!20103 d!94573))

(assert (=> bs!20103 m!649981))

(declare-fun m!650145 () Bool)

(assert (=> bs!20103 m!650145))

(assert (=> b!686363 d!94573))

(declare-fun d!94579 () Bool)

(declare-fun res!451754 () Bool)

(declare-fun e!390907 () Bool)

(assert (=> d!94579 (=> res!451754 e!390907)))

(assert (=> d!94579 (= res!451754 (= (select (arr!19007 (array!39664 (store (arr!19007 a!3626) i!1382 k0!2843) (size!19381 a!3626))) from!3004) k0!2843))))

(assert (=> d!94579 (= (arrayContainsKey!0 (array!39664 (store (arr!19007 a!3626) i!1382 k0!2843) (size!19381 a!3626)) k0!2843 from!3004) e!390907)))

(declare-fun b!686548 () Bool)

(declare-fun e!390908 () Bool)

(assert (=> b!686548 (= e!390907 e!390908)))

(declare-fun res!451755 () Bool)

(assert (=> b!686548 (=> (not res!451755) (not e!390908))))

(assert (=> b!686548 (= res!451755 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19381 (array!39664 (store (arr!19007 a!3626) i!1382 k0!2843) (size!19381 a!3626)))))))

(declare-fun b!686549 () Bool)

(assert (=> b!686549 (= e!390908 (arrayContainsKey!0 (array!39664 (store (arr!19007 a!3626) i!1382 k0!2843) (size!19381 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94579 (not res!451754)) b!686548))

(assert (= (and b!686548 res!451755) b!686549))

(declare-fun m!650147 () Bool)

(assert (=> d!94579 m!650147))

(declare-fun m!650149 () Bool)

(assert (=> b!686549 m!650149))

(assert (=> b!686363 d!94579))

(assert (=> b!686363 d!94559))

(declare-fun d!94583 () Bool)

(assert (=> d!94583 (= (validKeyInArray!0 (select (arr!19007 a!3626) from!3004)) (and (not (= (select (arr!19007 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19007 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!686363 d!94583))

(declare-fun d!94585 () Bool)

(assert (=> d!94585 (= (-!177 ($colon$colon!376 acc!681 k0!2843) k0!2843) acc!681)))

(declare-fun lt!314973 () Unit!24185)

(declare-fun choose!16 ((_ BitVec 64) List!13087) Unit!24185)

(assert (=> d!94585 (= lt!314973 (choose!16 k0!2843 acc!681))))

(assert (=> d!94585 (not (contains!3609 acc!681 k0!2843))))

(assert (=> d!94585 (= (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681) lt!314973)))

(declare-fun bs!20105 () Bool)

(assert (= bs!20105 d!94585))

(assert (=> bs!20105 m!649993))

(assert (=> bs!20105 m!649993))

(declare-fun m!650153 () Bool)

(assert (=> bs!20105 m!650153))

(declare-fun m!650155 () Bool)

(assert (=> bs!20105 m!650155))

(assert (=> bs!20105 m!649961))

(assert (=> b!686363 d!94585))

(declare-fun e!390918 () Bool)

(declare-fun b!686561 () Bool)

(assert (=> b!686561 (= e!390918 (contains!3609 lt!314887 (select (arr!19007 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!686562 () Bool)

(declare-fun e!390920 () Bool)

(declare-fun call!34081 () Bool)

(assert (=> b!686562 (= e!390920 call!34081)))

(declare-fun b!686563 () Bool)

(assert (=> b!686563 (= e!390920 call!34081)))

(declare-fun b!686564 () Bool)

(declare-fun e!390919 () Bool)

(assert (=> b!686564 (= e!390919 e!390920)))

(declare-fun c!77766 () Bool)

(assert (=> b!686564 (= c!77766 (validKeyInArray!0 (select (arr!19007 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun bm!34078 () Bool)

(assert (=> bm!34078 (= call!34081 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77766 (Cons!13083 (select (arr!19007 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) lt!314887) lt!314887)))))

(declare-fun b!686560 () Bool)

(declare-fun e!390917 () Bool)

(assert (=> b!686560 (= e!390917 e!390919)))

(declare-fun res!451764 () Bool)

(assert (=> b!686560 (=> (not res!451764) (not e!390919))))

(assert (=> b!686560 (= res!451764 (not e!390918))))

(declare-fun res!451762 () Bool)

(assert (=> b!686560 (=> (not res!451762) (not e!390918))))

(assert (=> b!686560 (= res!451762 (validKeyInArray!0 (select (arr!19007 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!94591 () Bool)

(declare-fun res!451763 () Bool)

(assert (=> d!94591 (=> res!451763 e!390917)))

(assert (=> d!94591 (= res!451763 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19381 a!3626)))))

(assert (=> d!94591 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!314887) e!390917)))

(assert (= (and d!94591 (not res!451763)) b!686560))

(assert (= (and b!686560 res!451762) b!686561))

(assert (= (and b!686560 res!451764) b!686564))

(assert (= (and b!686564 c!77766) b!686562))

(assert (= (and b!686564 (not c!77766)) b!686563))

(assert (= (or b!686562 b!686563) bm!34078))

(assert (=> b!686561 m!650113))

(assert (=> b!686561 m!650113))

(declare-fun m!650157 () Bool)

(assert (=> b!686561 m!650157))

(assert (=> b!686564 m!650113))

(assert (=> b!686564 m!650113))

(assert (=> b!686564 m!650117))

(assert (=> bm!34078 m!650113))

(declare-fun m!650159 () Bool)

(assert (=> bm!34078 m!650159))

(assert (=> b!686560 m!650113))

(assert (=> b!686560 m!650113))

(assert (=> b!686560 m!650117))

(assert (=> b!686363 d!94591))

(declare-fun d!94593 () Bool)

(assert (=> d!94593 (= ($colon$colon!376 acc!681 k0!2843) (Cons!13083 k0!2843 acc!681))))

(assert (=> b!686363 d!94593))

(assert (=> b!686363 d!94561))

(declare-fun d!94595 () Bool)

(declare-fun lt!314978 () Bool)

(assert (=> d!94595 (= lt!314978 (select (content!293 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!390941 () Bool)

(assert (=> d!94595 (= lt!314978 e!390941)))

(declare-fun res!451784 () Bool)

(assert (=> d!94595 (=> (not res!451784) (not e!390941))))

(assert (=> d!94595 (= res!451784 ((_ is Cons!13083) acc!681))))

(assert (=> d!94595 (= (contains!3609 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!314978)))

(declare-fun b!686586 () Bool)

(declare-fun e!390942 () Bool)

(assert (=> b!686586 (= e!390941 e!390942)))

(declare-fun res!451785 () Bool)

(assert (=> b!686586 (=> res!451785 e!390942)))

(assert (=> b!686586 (= res!451785 (= (h!14128 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!686587 () Bool)

(assert (=> b!686587 (= e!390942 (contains!3609 (t!19333 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94595 res!451784) b!686586))

(assert (= (and b!686586 (not res!451785)) b!686587))

(declare-fun m!650173 () Bool)

(assert (=> d!94595 m!650173))

(declare-fun m!650175 () Bool)

(assert (=> d!94595 m!650175))

(declare-fun m!650177 () Bool)

(assert (=> b!686587 m!650177))

(assert (=> b!686373 d!94595))

(declare-fun e!390944 () Bool)

(declare-fun b!686589 () Bool)

(assert (=> b!686589 (= e!390944 (contains!3609 acc!681 (select (arr!19007 a!3626) from!3004)))))

(declare-fun b!686590 () Bool)

(declare-fun e!390946 () Bool)

(declare-fun call!34083 () Bool)

(assert (=> b!686590 (= e!390946 call!34083)))

(declare-fun b!686591 () Bool)

(assert (=> b!686591 (= e!390946 call!34083)))

(declare-fun b!686592 () Bool)

(declare-fun e!390945 () Bool)

(assert (=> b!686592 (= e!390945 e!390946)))

(declare-fun c!77768 () Bool)

(assert (=> b!686592 (= c!77768 (validKeyInArray!0 (select (arr!19007 a!3626) from!3004)))))

(declare-fun bm!34080 () Bool)

(assert (=> bm!34080 (= call!34083 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77768 (Cons!13083 (select (arr!19007 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!686588 () Bool)

(declare-fun e!390943 () Bool)

(assert (=> b!686588 (= e!390943 e!390945)))

(declare-fun res!451788 () Bool)

(assert (=> b!686588 (=> (not res!451788) (not e!390945))))

(assert (=> b!686588 (= res!451788 (not e!390944))))

(declare-fun res!451786 () Bool)

(assert (=> b!686588 (=> (not res!451786) (not e!390944))))

(assert (=> b!686588 (= res!451786 (validKeyInArray!0 (select (arr!19007 a!3626) from!3004)))))

(declare-fun d!94603 () Bool)

(declare-fun res!451787 () Bool)

(assert (=> d!94603 (=> res!451787 e!390943)))

(assert (=> d!94603 (= res!451787 (bvsge from!3004 (size!19381 a!3626)))))

(assert (=> d!94603 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!390943)))

(assert (= (and d!94603 (not res!451787)) b!686588))

(assert (= (and b!686588 res!451786) b!686589))

(assert (= (and b!686588 res!451788) b!686592))

(assert (= (and b!686592 c!77768) b!686590))

(assert (= (and b!686592 (not c!77768)) b!686591))

(assert (= (or b!686590 b!686591) bm!34080))

(assert (=> b!686589 m!649949))

(assert (=> b!686589 m!649949))

(declare-fun m!650181 () Bool)

(assert (=> b!686589 m!650181))

(assert (=> b!686592 m!649949))

(assert (=> b!686592 m!649949))

(assert (=> b!686592 m!649995))

(assert (=> bm!34080 m!649949))

(declare-fun m!650185 () Bool)

(assert (=> bm!34080 m!650185))

(assert (=> b!686588 m!649949))

(assert (=> b!686588 m!649949))

(assert (=> b!686588 m!649995))

(assert (=> b!686364 d!94603))

(declare-fun d!94607 () Bool)

(declare-fun lt!314982 () Bool)

(assert (=> d!94607 (= lt!314982 (select (content!293 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!390951 () Bool)

(assert (=> d!94607 (= lt!314982 e!390951)))

(declare-fun res!451792 () Bool)

(assert (=> d!94607 (=> (not res!451792) (not e!390951))))

(assert (=> d!94607 (= res!451792 ((_ is Cons!13083) acc!681))))

(assert (=> d!94607 (= (contains!3609 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!314982)))

(declare-fun b!686598 () Bool)

(declare-fun e!390952 () Bool)

(assert (=> b!686598 (= e!390951 e!390952)))

(declare-fun res!451793 () Bool)

(assert (=> b!686598 (=> res!451793 e!390952)))

(assert (=> b!686598 (= res!451793 (= (h!14128 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!686599 () Bool)

(assert (=> b!686599 (= e!390952 (contains!3609 (t!19333 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94607 res!451792) b!686598))

(assert (= (and b!686598 (not res!451793)) b!686599))

(assert (=> d!94607 m!650173))

(declare-fun m!650189 () Bool)

(assert (=> d!94607 m!650189))

(declare-fun m!650193 () Bool)

(assert (=> b!686599 m!650193))

(assert (=> b!686371 d!94607))

(declare-fun d!94613 () Bool)

(declare-fun res!451802 () Bool)

(declare-fun e!390961 () Bool)

(assert (=> d!94613 (=> res!451802 e!390961)))

(assert (=> d!94613 (= res!451802 ((_ is Nil!13084) acc!681))))

(assert (=> d!94613 (= (noDuplicate!878 acc!681) e!390961)))

(declare-fun b!686608 () Bool)

(declare-fun e!390962 () Bool)

(assert (=> b!686608 (= e!390961 e!390962)))

(declare-fun res!451803 () Bool)

(assert (=> b!686608 (=> (not res!451803) (not e!390962))))

(assert (=> b!686608 (= res!451803 (not (contains!3609 (t!19333 acc!681) (h!14128 acc!681))))))

(declare-fun b!686609 () Bool)

(assert (=> b!686609 (= e!390962 (noDuplicate!878 (t!19333 acc!681)))))

(assert (= (and d!94613 (not res!451802)) b!686608))

(assert (= (and b!686608 res!451803) b!686609))

(declare-fun m!650197 () Bool)

(assert (=> b!686608 m!650197))

(declare-fun m!650199 () Bool)

(assert (=> b!686609 m!650199))

(assert (=> b!686362 d!94613))

(declare-fun d!94617 () Bool)

(declare-fun lt!314989 () Bool)

(assert (=> d!94617 (= lt!314989 (select (content!293 acc!681) k0!2843))))

(declare-fun e!390963 () Bool)

(assert (=> d!94617 (= lt!314989 e!390963)))

(declare-fun res!451804 () Bool)

(assert (=> d!94617 (=> (not res!451804) (not e!390963))))

(assert (=> d!94617 (= res!451804 ((_ is Cons!13083) acc!681))))

(assert (=> d!94617 (= (contains!3609 acc!681 k0!2843) lt!314989)))

(declare-fun b!686610 () Bool)

(declare-fun e!390964 () Bool)

(assert (=> b!686610 (= e!390963 e!390964)))

(declare-fun res!451805 () Bool)

(assert (=> b!686610 (=> res!451805 e!390964)))

(assert (=> b!686610 (= res!451805 (= (h!14128 acc!681) k0!2843))))

(declare-fun b!686611 () Bool)

(assert (=> b!686611 (= e!390964 (contains!3609 (t!19333 acc!681) k0!2843))))

(assert (= (and d!94617 res!451804) b!686610))

(assert (= (and b!686610 (not res!451805)) b!686611))

(assert (=> d!94617 m!650173))

(declare-fun m!650201 () Bool)

(assert (=> d!94617 m!650201))

(declare-fun m!650203 () Bool)

(assert (=> b!686611 m!650203))

(assert (=> b!686372 d!94617))

(assert (=> b!686361 d!94617))

(declare-fun d!94619 () Bool)

(declare-fun res!451808 () Bool)

(declare-fun e!390967 () Bool)

(assert (=> d!94619 (=> res!451808 e!390967)))

(assert (=> d!94619 (= res!451808 ((_ is Nil!13084) lt!314887))))

(assert (=> d!94619 (= (noDuplicate!878 lt!314887) e!390967)))

(declare-fun b!686614 () Bool)

(declare-fun e!390968 () Bool)

(assert (=> b!686614 (= e!390967 e!390968)))

(declare-fun res!451809 () Bool)

(assert (=> b!686614 (=> (not res!451809) (not e!390968))))

(assert (=> b!686614 (= res!451809 (not (contains!3609 (t!19333 lt!314887) (h!14128 lt!314887))))))

(declare-fun b!686615 () Bool)

(assert (=> b!686615 (= e!390968 (noDuplicate!878 (t!19333 lt!314887)))))

(assert (= (and d!94619 (not res!451808)) b!686614))

(assert (= (and b!686614 res!451809) b!686615))

(declare-fun m!650211 () Bool)

(assert (=> b!686614 m!650211))

(declare-fun m!650213 () Bool)

(assert (=> b!686615 m!650213))

(assert (=> b!686358 d!94619))

(declare-fun d!94623 () Bool)

(declare-fun res!451810 () Bool)

(declare-fun e!390969 () Bool)

(assert (=> d!94623 (=> res!451810 e!390969)))

(assert (=> d!94623 (= res!451810 (= (select (arr!19007 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!94623 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!390969)))

(declare-fun b!686616 () Bool)

(declare-fun e!390970 () Bool)

(assert (=> b!686616 (= e!390969 e!390970)))

(declare-fun res!451811 () Bool)

(assert (=> b!686616 (=> (not res!451811) (not e!390970))))

(assert (=> b!686616 (= res!451811 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19381 a!3626)))))

(declare-fun b!686617 () Bool)

(assert (=> b!686617 (= e!390970 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!94623 (not res!451810)) b!686616))

(assert (= (and b!686616 res!451811) b!686617))

(declare-fun m!650215 () Bool)

(assert (=> d!94623 m!650215))

(declare-fun m!650217 () Bool)

(assert (=> b!686617 m!650217))

(assert (=> b!686370 d!94623))

(declare-fun b!686619 () Bool)

(declare-fun e!390972 () Bool)

(assert (=> b!686619 (= e!390972 (contains!3609 Nil!13084 (select (arr!19007 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!686620 () Bool)

(declare-fun e!390974 () Bool)

(declare-fun call!34085 () Bool)

(assert (=> b!686620 (= e!390974 call!34085)))

(declare-fun b!686621 () Bool)

(assert (=> b!686621 (= e!390974 call!34085)))

(declare-fun b!686622 () Bool)

(declare-fun e!390973 () Bool)

(assert (=> b!686622 (= e!390973 e!390974)))

(declare-fun c!77770 () Bool)

(assert (=> b!686622 (= c!77770 (validKeyInArray!0 (select (arr!19007 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!34082 () Bool)

(assert (=> bm!34082 (= call!34085 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77770 (Cons!13083 (select (arr!19007 a!3626) #b00000000000000000000000000000000) Nil!13084) Nil!13084)))))

(declare-fun b!686618 () Bool)

(declare-fun e!390971 () Bool)

(assert (=> b!686618 (= e!390971 e!390973)))

(declare-fun res!451814 () Bool)

(assert (=> b!686618 (=> (not res!451814) (not e!390973))))

(assert (=> b!686618 (= res!451814 (not e!390972))))

(declare-fun res!451812 () Bool)

(assert (=> b!686618 (=> (not res!451812) (not e!390972))))

(assert (=> b!686618 (= res!451812 (validKeyInArray!0 (select (arr!19007 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!94625 () Bool)

(declare-fun res!451813 () Bool)

(assert (=> d!94625 (=> res!451813 e!390971)))

(assert (=> d!94625 (= res!451813 (bvsge #b00000000000000000000000000000000 (size!19381 a!3626)))))

(assert (=> d!94625 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13084) e!390971)))

(assert (= (and d!94625 (not res!451813)) b!686618))

(assert (= (and b!686618 res!451812) b!686619))

(assert (= (and b!686618 res!451814) b!686622))

(assert (= (and b!686622 c!77770) b!686620))

(assert (= (and b!686622 (not c!77770)) b!686621))

(assert (= (or b!686620 b!686621) bm!34082))

(assert (=> b!686619 m!650215))

(assert (=> b!686619 m!650215))

(declare-fun m!650219 () Bool)

(assert (=> b!686619 m!650219))

(assert (=> b!686622 m!650215))

(assert (=> b!686622 m!650215))

(declare-fun m!650221 () Bool)

(assert (=> b!686622 m!650221))

(assert (=> bm!34082 m!650215))

(declare-fun m!650223 () Bool)

(assert (=> bm!34082 m!650223))

(assert (=> b!686618 m!650215))

(assert (=> b!686618 m!650215))

(assert (=> b!686618 m!650221))

(assert (=> b!686359 d!94625))

(declare-fun d!94627 () Bool)

(assert (=> d!94627 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!686369 d!94627))

(check-sat (not bm!34075) (not d!94567) (not b!686619) (not b!686514) (not d!94607) (not d!94551) (not b!686592) (not bm!34072) (not b!686608) (not b!686564) (not b!686609) (not b!686611) (not b!686560) (not b!686618) (not b!686589) (not b!686498) (not d!94595) (not d!94617) (not b!686561) (not b!686520) (not b!686614) (not bm!34080) (not b!686511) (not bm!34078) (not d!94557) (not d!94559) (not b!686549) (not d!94573) (not b!686588) (not bm!34082) (not b!686622) (not b!686617) (not b!686541) (not b!686599) (not b!686615) (not b!686499) (not b!686587) (not d!94585) (not b!686510))
(check-sat)
