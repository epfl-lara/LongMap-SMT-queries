; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61146 () Bool)

(assert start!61146)

(declare-fun b!685230 () Bool)

(declare-fun e!390248 () Bool)

(declare-fun e!390250 () Bool)

(assert (=> b!685230 (= e!390248 e!390250)))

(declare-fun res!450570 () Bool)

(assert (=> b!685230 (=> (not res!450570) (not e!390250))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!685230 (= res!450570 (bvsle from!3004 i!1382))))

(declare-fun b!685231 () Bool)

(declare-datatypes ((List!12933 0))(
  ( (Nil!12930) (Cons!12929 (h!13977 (_ BitVec 64)) (t!19174 List!12933)) )
))
(declare-fun acc!681 () List!12933)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3585 (List!12933 (_ BitVec 64)) Bool)

(assert (=> b!685231 (= e!390250 (not (contains!3585 acc!681 k0!2843)))))

(declare-fun b!685232 () Bool)

(declare-datatypes ((Unit!24096 0))(
  ( (Unit!24097) )
))
(declare-fun e!390253 () Unit!24096)

(declare-fun Unit!24098 () Unit!24096)

(assert (=> b!685232 (= e!390253 Unit!24098)))

(declare-fun b!685233 () Bool)

(declare-fun res!450569 () Bool)

(declare-fun e!390254 () Bool)

(assert (=> b!685233 (=> res!450569 e!390254)))

(declare-fun lt!314624 () List!12933)

(declare-fun subseq!194 (List!12933 List!12933) Bool)

(assert (=> b!685233 (= res!450569 (not (subseq!194 acc!681 lt!314624)))))

(declare-fun b!685234 () Bool)

(declare-fun res!450560 () Bool)

(declare-fun e!390251 () Bool)

(assert (=> b!685234 (=> (not res!450560) (not e!390251))))

(declare-datatypes ((array!39618 0))(
  ( (array!39619 (arr!18985 (Array (_ BitVec 32) (_ BitVec 64))) (size!19354 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39618)

(declare-fun arrayNoDuplicates!0 (array!39618 (_ BitVec 32) List!12933) Bool)

(assert (=> b!685234 (= res!450560 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!685235 () Bool)

(declare-fun res!450574 () Bool)

(assert (=> b!685235 (=> (not res!450574) (not e!390251))))

(assert (=> b!685235 (= res!450574 e!390248)))

(declare-fun res!450559 () Bool)

(assert (=> b!685235 (=> res!450559 e!390248)))

(declare-fun e!390249 () Bool)

(assert (=> b!685235 (= res!450559 e!390249)))

(declare-fun res!450577 () Bool)

(assert (=> b!685235 (=> (not res!450577) (not e!390249))))

(assert (=> b!685235 (= res!450577 (bvsgt from!3004 i!1382))))

(declare-fun b!685236 () Bool)

(assert (=> b!685236 (= e!390249 (contains!3585 acc!681 k0!2843))))

(declare-fun res!450565 () Bool)

(assert (=> start!61146 (=> (not res!450565) (not e!390251))))

(assert (=> start!61146 (= res!450565 (and (bvslt (size!19354 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19354 a!3626))))))

(assert (=> start!61146 e!390251))

(assert (=> start!61146 true))

(declare-fun array_inv!14844 (array!39618) Bool)

(assert (=> start!61146 (array_inv!14844 a!3626)))

(declare-fun b!685237 () Bool)

(declare-fun res!450568 () Bool)

(assert (=> b!685237 (=> (not res!450568) (not e!390251))))

(assert (=> b!685237 (= res!450568 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19354 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!685238 () Bool)

(declare-fun res!450567 () Bool)

(assert (=> b!685238 (=> (not res!450567) (not e!390251))))

(assert (=> b!685238 (= res!450567 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19354 a!3626))))))

(declare-fun b!685239 () Bool)

(declare-fun e!390252 () Unit!24096)

(declare-fun Unit!24099 () Unit!24096)

(assert (=> b!685239 (= e!390252 Unit!24099)))

(declare-fun b!685240 () Bool)

(declare-fun res!450571 () Bool)

(assert (=> b!685240 (=> (not res!450571) (not e!390251))))

(declare-fun arrayContainsKey!0 (array!39618 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!685240 (= res!450571 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!685241 () Bool)

(declare-fun res!450564 () Bool)

(assert (=> b!685241 (=> res!450564 e!390254)))

(declare-fun lt!314620 () Bool)

(assert (=> b!685241 (= res!450564 lt!314620)))

(declare-fun b!685242 () Bool)

(declare-fun res!450562 () Bool)

(assert (=> b!685242 (=> (not res!450562) (not e!390251))))

(declare-fun noDuplicate!859 (List!12933) Bool)

(assert (=> b!685242 (= res!450562 (noDuplicate!859 acc!681))))

(declare-fun b!685243 () Bool)

(declare-fun res!450566 () Bool)

(assert (=> b!685243 (=> res!450566 e!390254)))

(assert (=> b!685243 (= res!450566 (contains!3585 acc!681 k0!2843))))

(declare-fun b!685244 () Bool)

(declare-fun lt!314618 () Unit!24096)

(assert (=> b!685244 (= e!390253 lt!314618)))

(declare-fun lt!314623 () Unit!24096)

(declare-fun lemmaListSubSeqRefl!0 (List!12933) Unit!24096)

(assert (=> b!685244 (= lt!314623 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!685244 (subseq!194 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39618 List!12933 List!12933 (_ BitVec 32)) Unit!24096)

(declare-fun $colon$colon!356 (List!12933 (_ BitVec 64)) List!12933)

(assert (=> b!685244 (= lt!314618 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!356 acc!681 (select (arr!18985 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!685244 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!685245 () Bool)

(declare-fun res!450561 () Bool)

(assert (=> b!685245 (=> res!450561 e!390254)))

(assert (=> b!685245 (= res!450561 (not (noDuplicate!859 lt!314624)))))

(declare-fun b!685246 () Bool)

(declare-fun res!450572 () Bool)

(assert (=> b!685246 (=> (not res!450572) (not e!390251))))

(assert (=> b!685246 (= res!450572 (not (contains!3585 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685247 () Bool)

(declare-fun res!450563 () Bool)

(assert (=> b!685247 (=> (not res!450563) (not e!390251))))

(assert (=> b!685247 (= res!450563 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12930))))

(declare-fun b!685248 () Bool)

(declare-fun res!450575 () Bool)

(assert (=> b!685248 (=> (not res!450575) (not e!390251))))

(assert (=> b!685248 (= res!450575 (not (contains!3585 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685249 () Bool)

(assert (=> b!685249 (= e!390254 (contains!3585 lt!314624 k0!2843))))

(declare-fun b!685250 () Bool)

(declare-fun Unit!24100 () Unit!24096)

(assert (=> b!685250 (= e!390252 Unit!24100)))

(declare-fun lt!314621 () Unit!24096)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39618 (_ BitVec 64) (_ BitVec 32)) Unit!24096)

(assert (=> b!685250 (= lt!314621 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!685250 false))

(declare-fun b!685251 () Bool)

(assert (=> b!685251 (= e!390251 (not e!390254))))

(declare-fun res!450573 () Bool)

(assert (=> b!685251 (=> res!450573 e!390254)))

(assert (=> b!685251 (= res!450573 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!158 (List!12933 (_ BitVec 64)) List!12933)

(assert (=> b!685251 (= (-!158 lt!314624 k0!2843) acc!681)))

(assert (=> b!685251 (= lt!314624 ($colon$colon!356 acc!681 k0!2843))))

(declare-fun lt!314619 () Unit!24096)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12933) Unit!24096)

(assert (=> b!685251 (= lt!314619 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!685251 (subseq!194 acc!681 acc!681)))

(declare-fun lt!314625 () Unit!24096)

(assert (=> b!685251 (= lt!314625 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!685251 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314622 () Unit!24096)

(assert (=> b!685251 (= lt!314622 e!390253)))

(declare-fun c!77705 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!685251 (= c!77705 (validKeyInArray!0 (select (arr!18985 a!3626) from!3004)))))

(declare-fun lt!314626 () Unit!24096)

(assert (=> b!685251 (= lt!314626 e!390252)))

(declare-fun c!77704 () Bool)

(assert (=> b!685251 (= c!77704 lt!314620)))

(assert (=> b!685251 (= lt!314620 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!685251 (arrayContainsKey!0 (array!39619 (store (arr!18985 a!3626) i!1382 k0!2843) (size!19354 a!3626)) k0!2843 from!3004)))

(declare-fun b!685252 () Bool)

(declare-fun res!450576 () Bool)

(assert (=> b!685252 (=> (not res!450576) (not e!390251))))

(assert (=> b!685252 (= res!450576 (validKeyInArray!0 k0!2843))))

(assert (= (and start!61146 res!450565) b!685242))

(assert (= (and b!685242 res!450562) b!685248))

(assert (= (and b!685248 res!450575) b!685246))

(assert (= (and b!685246 res!450572) b!685235))

(assert (= (and b!685235 res!450577) b!685236))

(assert (= (and b!685235 (not res!450559)) b!685230))

(assert (= (and b!685230 res!450570) b!685231))

(assert (= (and b!685235 res!450574) b!685247))

(assert (= (and b!685247 res!450563) b!685234))

(assert (= (and b!685234 res!450560) b!685238))

(assert (= (and b!685238 res!450567) b!685252))

(assert (= (and b!685252 res!450576) b!685240))

(assert (= (and b!685240 res!450571) b!685237))

(assert (= (and b!685237 res!450568) b!685251))

(assert (= (and b!685251 c!77704) b!685250))

(assert (= (and b!685251 (not c!77704)) b!685239))

(assert (= (and b!685251 c!77705) b!685244))

(assert (= (and b!685251 (not c!77705)) b!685232))

(assert (= (and b!685251 (not res!450573)) b!685245))

(assert (= (and b!685245 (not res!450561)) b!685241))

(assert (= (and b!685241 (not res!450564)) b!685243))

(assert (= (and b!685243 (not res!450566)) b!685233))

(assert (= (and b!685233 (not res!450569)) b!685249))

(declare-fun m!649969 () Bool)

(assert (=> b!685249 m!649969))

(declare-fun m!649971 () Bool)

(assert (=> b!685247 m!649971))

(declare-fun m!649973 () Bool)

(assert (=> b!685233 m!649973))

(declare-fun m!649975 () Bool)

(assert (=> b!685246 m!649975))

(declare-fun m!649977 () Bool)

(assert (=> b!685231 m!649977))

(declare-fun m!649979 () Bool)

(assert (=> b!685252 m!649979))

(declare-fun m!649981 () Bool)

(assert (=> b!685245 m!649981))

(assert (=> b!685243 m!649977))

(declare-fun m!649983 () Bool)

(assert (=> b!685234 m!649983))

(declare-fun m!649985 () Bool)

(assert (=> start!61146 m!649985))

(declare-fun m!649987 () Bool)

(assert (=> b!685248 m!649987))

(assert (=> b!685236 m!649977))

(declare-fun m!649989 () Bool)

(assert (=> b!685251 m!649989))

(declare-fun m!649991 () Bool)

(assert (=> b!685251 m!649991))

(declare-fun m!649993 () Bool)

(assert (=> b!685251 m!649993))

(declare-fun m!649995 () Bool)

(assert (=> b!685251 m!649995))

(declare-fun m!649997 () Bool)

(assert (=> b!685251 m!649997))

(declare-fun m!649999 () Bool)

(assert (=> b!685251 m!649999))

(declare-fun m!650001 () Bool)

(assert (=> b!685251 m!650001))

(assert (=> b!685251 m!649991))

(declare-fun m!650003 () Bool)

(assert (=> b!685251 m!650003))

(declare-fun m!650005 () Bool)

(assert (=> b!685251 m!650005))

(declare-fun m!650007 () Bool)

(assert (=> b!685251 m!650007))

(declare-fun m!650009 () Bool)

(assert (=> b!685251 m!650009))

(declare-fun m!650011 () Bool)

(assert (=> b!685250 m!650011))

(declare-fun m!650013 () Bool)

(assert (=> b!685240 m!650013))

(assert (=> b!685244 m!649989))

(assert (=> b!685244 m!649991))

(declare-fun m!650015 () Bool)

(assert (=> b!685244 m!650015))

(declare-fun m!650017 () Bool)

(assert (=> b!685244 m!650017))

(assert (=> b!685244 m!649991))

(assert (=> b!685244 m!650015))

(assert (=> b!685244 m!649997))

(assert (=> b!685244 m!650009))

(declare-fun m!650019 () Bool)

(assert (=> b!685242 m!650019))

(check-sat (not b!685252) (not b!685246) (not b!685240) (not b!685245) (not start!61146) (not b!685231) (not b!685248) (not b!685243) (not b!685233) (not b!685234) (not b!685242) (not b!685236) (not b!685250) (not b!685249) (not b!685247) (not b!685244) (not b!685251))
(check-sat)
(get-model)

(declare-fun d!94577 () Bool)

(assert (=> d!94577 (= (array_inv!14844 a!3626) (bvsge (size!19354 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61146 d!94577))

(declare-fun d!94579 () Bool)

(assert (=> d!94579 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!314683 () Unit!24096)

(declare-fun choose!13 (array!39618 (_ BitVec 64) (_ BitVec 32)) Unit!24096)

(assert (=> d!94579 (= lt!314683 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!94579 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!94579 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!314683)))

(declare-fun bs!20108 () Bool)

(assert (= bs!20108 d!94579))

(assert (=> bs!20108 m!650013))

(declare-fun m!650125 () Bool)

(assert (=> bs!20108 m!650125))

(assert (=> b!685250 d!94579))

(declare-fun b!685399 () Bool)

(declare-fun e!390312 () Bool)

(declare-fun e!390315 () Bool)

(assert (=> b!685399 (= e!390312 e!390315)))

(declare-fun res!450700 () Bool)

(assert (=> b!685399 (=> (not res!450700) (not e!390315))))

(get-info :version)

(assert (=> b!685399 (= res!450700 ((_ is Cons!12929) acc!681))))

(declare-fun d!94581 () Bool)

(declare-fun res!450703 () Bool)

(assert (=> d!94581 (=> res!450703 e!390312)))

(assert (=> d!94581 (= res!450703 ((_ is Nil!12930) acc!681))))

(assert (=> d!94581 (= (subseq!194 acc!681 acc!681) e!390312)))

(declare-fun b!685401 () Bool)

(declare-fun e!390313 () Bool)

(assert (=> b!685401 (= e!390313 (subseq!194 (t!19174 acc!681) (t!19174 acc!681)))))

(declare-fun b!685402 () Bool)

(declare-fun e!390314 () Bool)

(assert (=> b!685402 (= e!390314 (subseq!194 acc!681 (t!19174 acc!681)))))

(declare-fun b!685400 () Bool)

(assert (=> b!685400 (= e!390315 e!390314)))

(declare-fun res!450702 () Bool)

(assert (=> b!685400 (=> res!450702 e!390314)))

(assert (=> b!685400 (= res!450702 e!390313)))

(declare-fun res!450701 () Bool)

(assert (=> b!685400 (=> (not res!450701) (not e!390313))))

(assert (=> b!685400 (= res!450701 (= (h!13977 acc!681) (h!13977 acc!681)))))

(assert (= (and d!94581 (not res!450703)) b!685399))

(assert (= (and b!685399 res!450700) b!685400))

(assert (= (and b!685400 res!450701) b!685401))

(assert (= (and b!685400 (not res!450702)) b!685402))

(declare-fun m!650127 () Bool)

(assert (=> b!685401 m!650127))

(declare-fun m!650129 () Bool)

(assert (=> b!685402 m!650129))

(assert (=> b!685251 d!94581))

(declare-fun d!94583 () Bool)

(declare-fun res!450708 () Bool)

(declare-fun e!390320 () Bool)

(assert (=> d!94583 (=> res!450708 e!390320)))

(assert (=> d!94583 (= res!450708 (= (select (arr!18985 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!94583 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!390320)))

(declare-fun b!685407 () Bool)

(declare-fun e!390321 () Bool)

(assert (=> b!685407 (= e!390320 e!390321)))

(declare-fun res!450709 () Bool)

(assert (=> b!685407 (=> (not res!450709) (not e!390321))))

(assert (=> b!685407 (= res!450709 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19354 a!3626)))))

(declare-fun b!685408 () Bool)

(assert (=> b!685408 (= e!390321 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94583 (not res!450708)) b!685407))

(assert (= (and b!685407 res!450709) b!685408))

(declare-fun m!650131 () Bool)

(assert (=> d!94583 m!650131))

(declare-fun m!650133 () Bool)

(assert (=> b!685408 m!650133))

(assert (=> b!685251 d!94583))

(declare-fun lt!314686 () List!12933)

(declare-fun e!390332 () Bool)

(declare-fun b!685421 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!288 (List!12933) (InoxSet (_ BitVec 64)))

(assert (=> b!685421 (= e!390332 (= (content!288 lt!314686) ((_ map and) (content!288 lt!314624) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2843 true)))))))

(declare-fun d!94585 () Bool)

(assert (=> d!94585 e!390332))

(declare-fun res!450714 () Bool)

(assert (=> d!94585 (=> (not res!450714) (not e!390332))))

(declare-fun size!19357 (List!12933) Int)

(assert (=> d!94585 (= res!450714 (<= (size!19357 lt!314686) (size!19357 lt!314624)))))

(declare-fun e!390333 () List!12933)

(assert (=> d!94585 (= lt!314686 e!390333)))

(declare-fun c!77722 () Bool)

(assert (=> d!94585 (= c!77722 ((_ is Cons!12929) lt!314624))))

(assert (=> d!94585 (= (-!158 lt!314624 k0!2843) lt!314686)))

(declare-fun bm!34059 () Bool)

(declare-fun call!34062 () List!12933)

(assert (=> bm!34059 (= call!34062 (-!158 (t!19174 lt!314624) k0!2843))))

(declare-fun b!685422 () Bool)

(declare-fun e!390331 () List!12933)

(assert (=> b!685422 (= e!390331 call!34062)))

(declare-fun b!685423 () Bool)

(assert (=> b!685423 (= e!390333 Nil!12930)))

(declare-fun b!685424 () Bool)

(assert (=> b!685424 (= e!390333 e!390331)))

(declare-fun c!77723 () Bool)

(assert (=> b!685424 (= c!77723 (= k0!2843 (h!13977 lt!314624)))))

(declare-fun b!685425 () Bool)

(assert (=> b!685425 (= e!390331 (Cons!12929 (h!13977 lt!314624) call!34062))))

(assert (= (and d!94585 c!77722) b!685424))

(assert (= (and d!94585 (not c!77722)) b!685423))

(assert (= (and b!685424 c!77723) b!685422))

(assert (= (and b!685424 (not c!77723)) b!685425))

(assert (= (or b!685422 b!685425) bm!34059))

(assert (= (and d!94585 res!450714) b!685421))

(declare-fun m!650135 () Bool)

(assert (=> b!685421 m!650135))

(declare-fun m!650137 () Bool)

(assert (=> b!685421 m!650137))

(declare-fun m!650139 () Bool)

(assert (=> b!685421 m!650139))

(declare-fun m!650141 () Bool)

(assert (=> d!94585 m!650141))

(declare-fun m!650143 () Bool)

(assert (=> d!94585 m!650143))

(declare-fun m!650145 () Bool)

(assert (=> bm!34059 m!650145))

(assert (=> b!685251 d!94585))

(declare-fun d!94591 () Bool)

(assert (=> d!94591 (= (-!158 ($colon$colon!356 acc!681 k0!2843) k0!2843) acc!681)))

(declare-fun lt!314691 () Unit!24096)

(declare-fun choose!16 ((_ BitVec 64) List!12933) Unit!24096)

(assert (=> d!94591 (= lt!314691 (choose!16 k0!2843 acc!681))))

(assert (=> d!94591 (not (contains!3585 acc!681 k0!2843))))

(assert (=> d!94591 (= (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681) lt!314691)))

(declare-fun bs!20109 () Bool)

(assert (= bs!20109 d!94591))

(assert (=> bs!20109 m!650001))

(assert (=> bs!20109 m!650001))

(declare-fun m!650151 () Bool)

(assert (=> bs!20109 m!650151))

(declare-fun m!650153 () Bool)

(assert (=> bs!20109 m!650153))

(assert (=> bs!20109 m!649977))

(assert (=> b!685251 d!94591))

(declare-fun d!94595 () Bool)

(declare-fun res!450725 () Bool)

(declare-fun e!390344 () Bool)

(assert (=> d!94595 (=> res!450725 e!390344)))

(assert (=> d!94595 (= res!450725 (= (select (arr!18985 (array!39619 (store (arr!18985 a!3626) i!1382 k0!2843) (size!19354 a!3626))) from!3004) k0!2843))))

(assert (=> d!94595 (= (arrayContainsKey!0 (array!39619 (store (arr!18985 a!3626) i!1382 k0!2843) (size!19354 a!3626)) k0!2843 from!3004) e!390344)))

(declare-fun b!685436 () Bool)

(declare-fun e!390345 () Bool)

(assert (=> b!685436 (= e!390344 e!390345)))

(declare-fun res!450726 () Bool)

(assert (=> b!685436 (=> (not res!450726) (not e!390345))))

(assert (=> b!685436 (= res!450726 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19354 (array!39619 (store (arr!18985 a!3626) i!1382 k0!2843) (size!19354 a!3626)))))))

(declare-fun b!685437 () Bool)

(assert (=> b!685437 (= e!390345 (arrayContainsKey!0 (array!39619 (store (arr!18985 a!3626) i!1382 k0!2843) (size!19354 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94595 (not res!450725)) b!685436))

(assert (= (and b!685436 res!450726) b!685437))

(declare-fun m!650161 () Bool)

(assert (=> d!94595 m!650161))

(declare-fun m!650163 () Bool)

(assert (=> b!685437 m!650163))

(assert (=> b!685251 d!94595))

(declare-fun d!94599 () Bool)

(assert (=> d!94599 (subseq!194 acc!681 acc!681)))

(declare-fun lt!314695 () Unit!24096)

(declare-fun choose!36 (List!12933) Unit!24096)

(assert (=> d!94599 (= lt!314695 (choose!36 acc!681))))

(assert (=> d!94599 (= (lemmaListSubSeqRefl!0 acc!681) lt!314695)))

(declare-fun bs!20110 () Bool)

(assert (= bs!20110 d!94599))

(assert (=> bs!20110 m!650009))

(declare-fun m!650165 () Bool)

(assert (=> bs!20110 m!650165))

(assert (=> b!685251 d!94599))

(declare-fun d!94601 () Bool)

(assert (=> d!94601 (= (validKeyInArray!0 (select (arr!18985 a!3626) from!3004)) (and (not (= (select (arr!18985 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18985 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!685251 d!94601))

(declare-fun d!94603 () Bool)

(assert (=> d!94603 (= ($colon$colon!356 acc!681 k0!2843) (Cons!12929 k0!2843 acc!681))))

(assert (=> b!685251 d!94603))

(declare-fun b!685476 () Bool)

(declare-fun e!390385 () Bool)

(declare-fun e!390384 () Bool)

(assert (=> b!685476 (= e!390385 e!390384)))

(declare-fun c!77726 () Bool)

(assert (=> b!685476 (= c!77726 (validKeyInArray!0 (select (arr!18985 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!685477 () Bool)

(declare-fun call!34065 () Bool)

(assert (=> b!685477 (= e!390384 call!34065)))

(declare-fun b!685478 () Bool)

(assert (=> b!685478 (= e!390384 call!34065)))

(declare-fun b!685479 () Bool)

(declare-fun e!390382 () Bool)

(assert (=> b!685479 (= e!390382 (contains!3585 acc!681 (select (arr!18985 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!685480 () Bool)

(declare-fun e!390383 () Bool)

(assert (=> b!685480 (= e!390383 e!390385)))

(declare-fun res!450763 () Bool)

(assert (=> b!685480 (=> (not res!450763) (not e!390385))))

(assert (=> b!685480 (= res!450763 (not e!390382))))

(declare-fun res!450761 () Bool)

(assert (=> b!685480 (=> (not res!450761) (not e!390382))))

(assert (=> b!685480 (= res!450761 (validKeyInArray!0 (select (arr!18985 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!94607 () Bool)

(declare-fun res!450762 () Bool)

(assert (=> d!94607 (=> res!450762 e!390383)))

(assert (=> d!94607 (= res!450762 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19354 a!3626)))))

(assert (=> d!94607 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!390383)))

(declare-fun bm!34062 () Bool)

(assert (=> bm!34062 (= call!34065 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77726 (Cons!12929 (select (arr!18985 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(assert (= (and d!94607 (not res!450762)) b!685480))

(assert (= (and b!685480 res!450761) b!685479))

(assert (= (and b!685480 res!450763) b!685476))

(assert (= (and b!685476 c!77726) b!685477))

(assert (= (and b!685476 (not c!77726)) b!685478))

(assert (= (or b!685477 b!685478) bm!34062))

(assert (=> b!685476 m!650131))

(assert (=> b!685476 m!650131))

(declare-fun m!650181 () Bool)

(assert (=> b!685476 m!650181))

(assert (=> b!685479 m!650131))

(assert (=> b!685479 m!650131))

(declare-fun m!650185 () Bool)

(assert (=> b!685479 m!650185))

(assert (=> b!685480 m!650131))

(assert (=> b!685480 m!650131))

(assert (=> b!685480 m!650181))

(assert (=> bm!34062 m!650131))

(declare-fun m!650189 () Bool)

(assert (=> bm!34062 m!650189))

(assert (=> b!685251 d!94607))

(declare-fun d!94617 () Bool)

(declare-fun res!450766 () Bool)

(declare-fun e!390388 () Bool)

(assert (=> d!94617 (=> res!450766 e!390388)))

(assert (=> d!94617 (= res!450766 (= (select (arr!18985 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!94617 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!390388)))

(declare-fun b!685483 () Bool)

(declare-fun e!390389 () Bool)

(assert (=> b!685483 (= e!390388 e!390389)))

(declare-fun res!450767 () Bool)

(assert (=> b!685483 (=> (not res!450767) (not e!390389))))

(assert (=> b!685483 (= res!450767 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19354 a!3626)))))

(declare-fun b!685484 () Bool)

(assert (=> b!685484 (= e!390389 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!94617 (not res!450766)) b!685483))

(assert (= (and b!685483 res!450767) b!685484))

(declare-fun m!650193 () Bool)

(assert (=> d!94617 m!650193))

(declare-fun m!650195 () Bool)

(assert (=> b!685484 m!650195))

(assert (=> b!685240 d!94617))

(declare-fun d!94621 () Bool)

(declare-fun lt!314707 () Bool)

(assert (=> d!94621 (= lt!314707 (select (content!288 acc!681) k0!2843))))

(declare-fun e!390394 () Bool)

(assert (=> d!94621 (= lt!314707 e!390394)))

(declare-fun res!450773 () Bool)

(assert (=> d!94621 (=> (not res!450773) (not e!390394))))

(assert (=> d!94621 (= res!450773 ((_ is Cons!12929) acc!681))))

(assert (=> d!94621 (= (contains!3585 acc!681 k0!2843) lt!314707)))

(declare-fun b!685489 () Bool)

(declare-fun e!390395 () Bool)

(assert (=> b!685489 (= e!390394 e!390395)))

(declare-fun res!450772 () Bool)

(assert (=> b!685489 (=> res!450772 e!390395)))

(assert (=> b!685489 (= res!450772 (= (h!13977 acc!681) k0!2843))))

(declare-fun b!685490 () Bool)

(assert (=> b!685490 (= e!390395 (contains!3585 (t!19174 acc!681) k0!2843))))

(assert (= (and d!94621 res!450773) b!685489))

(assert (= (and b!685489 (not res!450772)) b!685490))

(declare-fun m!650199 () Bool)

(assert (=> d!94621 m!650199))

(declare-fun m!650201 () Bool)

(assert (=> d!94621 m!650201))

(declare-fun m!650203 () Bool)

(assert (=> b!685490 m!650203))

(assert (=> b!685231 d!94621))

(declare-fun d!94625 () Bool)

(assert (=> d!94625 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!685252 d!94625))

(declare-fun d!94627 () Bool)

(declare-fun res!450790 () Bool)

(declare-fun e!390414 () Bool)

(assert (=> d!94627 (=> res!450790 e!390414)))

(assert (=> d!94627 (= res!450790 ((_ is Nil!12930) acc!681))))

(assert (=> d!94627 (= (noDuplicate!859 acc!681) e!390414)))

(declare-fun b!685513 () Bool)

(declare-fun e!390415 () Bool)

(assert (=> b!685513 (= e!390414 e!390415)))

(declare-fun res!450791 () Bool)

(assert (=> b!685513 (=> (not res!450791) (not e!390415))))

(assert (=> b!685513 (= res!450791 (not (contains!3585 (t!19174 acc!681) (h!13977 acc!681))))))

(declare-fun b!685514 () Bool)

(assert (=> b!685514 (= e!390415 (noDuplicate!859 (t!19174 acc!681)))))

(assert (= (and d!94627 (not res!450790)) b!685513))

(assert (= (and b!685513 res!450791) b!685514))

(declare-fun m!650205 () Bool)

(assert (=> b!685513 m!650205))

(declare-fun m!650207 () Bool)

(assert (=> b!685514 m!650207))

(assert (=> b!685242 d!94627))

(assert (=> b!685243 d!94621))

(declare-fun b!685517 () Bool)

(declare-fun e!390418 () Bool)

(declare-fun e!390421 () Bool)

(assert (=> b!685517 (= e!390418 e!390421)))

(declare-fun res!450792 () Bool)

(assert (=> b!685517 (=> (not res!450792) (not e!390421))))

(assert (=> b!685517 (= res!450792 ((_ is Cons!12929) lt!314624))))

(declare-fun d!94629 () Bool)

(declare-fun res!450795 () Bool)

(assert (=> d!94629 (=> res!450795 e!390418)))

(assert (=> d!94629 (= res!450795 ((_ is Nil!12930) acc!681))))

(assert (=> d!94629 (= (subseq!194 acc!681 lt!314624) e!390418)))

(declare-fun b!685519 () Bool)

(declare-fun e!390419 () Bool)

(assert (=> b!685519 (= e!390419 (subseq!194 (t!19174 acc!681) (t!19174 lt!314624)))))

(declare-fun b!685520 () Bool)

(declare-fun e!390420 () Bool)

(assert (=> b!685520 (= e!390420 (subseq!194 acc!681 (t!19174 lt!314624)))))

(declare-fun b!685518 () Bool)

(assert (=> b!685518 (= e!390421 e!390420)))

(declare-fun res!450794 () Bool)

(assert (=> b!685518 (=> res!450794 e!390420)))

(assert (=> b!685518 (= res!450794 e!390419)))

(declare-fun res!450793 () Bool)

(assert (=> b!685518 (=> (not res!450793) (not e!390419))))

(assert (=> b!685518 (= res!450793 (= (h!13977 acc!681) (h!13977 lt!314624)))))

(assert (= (and d!94629 (not res!450795)) b!685517))

(assert (= (and b!685517 res!450792) b!685518))

(assert (= (and b!685518 res!450793) b!685519))

(assert (= (and b!685518 (not res!450794)) b!685520))

(declare-fun m!650209 () Bool)

(assert (=> b!685519 m!650209))

(declare-fun m!650211 () Bool)

(assert (=> b!685520 m!650211))

(assert (=> b!685233 d!94629))

(declare-fun d!94631 () Bool)

(assert (=> d!94631 (= ($colon$colon!356 acc!681 (select (arr!18985 a!3626) from!3004)) (Cons!12929 (select (arr!18985 a!3626) from!3004) acc!681))))

(assert (=> b!685244 d!94631))

(assert (=> b!685244 d!94581))

(declare-fun d!94633 () Bool)

(assert (=> d!94633 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314710 () Unit!24096)

(declare-fun choose!80 (array!39618 List!12933 List!12933 (_ BitVec 32)) Unit!24096)

(assert (=> d!94633 (= lt!314710 (choose!80 a!3626 ($colon$colon!356 acc!681 (select (arr!18985 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!94633 (bvslt (size!19354 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94633 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!356 acc!681 (select (arr!18985 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!314710)))

(declare-fun bs!20113 () Bool)

(assert (= bs!20113 d!94633))

(assert (=> bs!20113 m!649989))

(assert (=> bs!20113 m!650015))

(declare-fun m!650221 () Bool)

(assert (=> bs!20113 m!650221))

(assert (=> b!685244 d!94633))

(assert (=> b!685244 d!94599))

(assert (=> b!685244 d!94607))

(declare-fun d!94637 () Bool)

(declare-fun res!450799 () Bool)

(declare-fun e!390426 () Bool)

(assert (=> d!94637 (=> res!450799 e!390426)))

(assert (=> d!94637 (= res!450799 ((_ is Nil!12930) lt!314624))))

(assert (=> d!94637 (= (noDuplicate!859 lt!314624) e!390426)))

(declare-fun b!685526 () Bool)

(declare-fun e!390427 () Bool)

(assert (=> b!685526 (= e!390426 e!390427)))

(declare-fun res!450800 () Bool)

(assert (=> b!685526 (=> (not res!450800) (not e!390427))))

(assert (=> b!685526 (= res!450800 (not (contains!3585 (t!19174 lt!314624) (h!13977 lt!314624))))))

(declare-fun b!685527 () Bool)

(assert (=> b!685527 (= e!390427 (noDuplicate!859 (t!19174 lt!314624)))))

(assert (= (and d!94637 (not res!450799)) b!685526))

(assert (= (and b!685526 res!450800) b!685527))

(declare-fun m!650223 () Bool)

(assert (=> b!685526 m!650223))

(declare-fun m!650225 () Bool)

(assert (=> b!685527 m!650225))

(assert (=> b!685245 d!94637))

(declare-fun b!685528 () Bool)

(declare-fun e!390431 () Bool)

(declare-fun e!390430 () Bool)

(assert (=> b!685528 (= e!390431 e!390430)))

(declare-fun c!77732 () Bool)

(assert (=> b!685528 (= c!77732 (validKeyInArray!0 (select (arr!18985 a!3626) from!3004)))))

(declare-fun b!685529 () Bool)

(declare-fun call!34071 () Bool)

(assert (=> b!685529 (= e!390430 call!34071)))

(declare-fun b!685530 () Bool)

(assert (=> b!685530 (= e!390430 call!34071)))

(declare-fun e!390428 () Bool)

(declare-fun b!685531 () Bool)

(assert (=> b!685531 (= e!390428 (contains!3585 acc!681 (select (arr!18985 a!3626) from!3004)))))

(declare-fun b!685532 () Bool)

(declare-fun e!390429 () Bool)

(assert (=> b!685532 (= e!390429 e!390431)))

(declare-fun res!450803 () Bool)

(assert (=> b!685532 (=> (not res!450803) (not e!390431))))

(assert (=> b!685532 (= res!450803 (not e!390428))))

(declare-fun res!450801 () Bool)

(assert (=> b!685532 (=> (not res!450801) (not e!390428))))

(assert (=> b!685532 (= res!450801 (validKeyInArray!0 (select (arr!18985 a!3626) from!3004)))))

(declare-fun d!94639 () Bool)

(declare-fun res!450802 () Bool)

(assert (=> d!94639 (=> res!450802 e!390429)))

(assert (=> d!94639 (= res!450802 (bvsge from!3004 (size!19354 a!3626)))))

(assert (=> d!94639 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!390429)))

(declare-fun bm!34068 () Bool)

(assert (=> bm!34068 (= call!34071 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77732 (Cons!12929 (select (arr!18985 a!3626) from!3004) acc!681) acc!681)))))

(assert (= (and d!94639 (not res!450802)) b!685532))

(assert (= (and b!685532 res!450801) b!685531))

(assert (= (and b!685532 res!450803) b!685528))

(assert (= (and b!685528 c!77732) b!685529))

(assert (= (and b!685528 (not c!77732)) b!685530))

(assert (= (or b!685529 b!685530) bm!34068))

(assert (=> b!685528 m!649991))

(assert (=> b!685528 m!649991))

(assert (=> b!685528 m!650003))

(assert (=> b!685531 m!649991))

(assert (=> b!685531 m!649991))

(declare-fun m!650229 () Bool)

(assert (=> b!685531 m!650229))

(assert (=> b!685532 m!649991))

(assert (=> b!685532 m!649991))

(assert (=> b!685532 m!650003))

(assert (=> bm!34068 m!649991))

(declare-fun m!650231 () Bool)

(assert (=> bm!34068 m!650231))

(assert (=> b!685234 d!94639))

(declare-fun d!94643 () Bool)

(declare-fun lt!314714 () Bool)

(assert (=> d!94643 (= lt!314714 (select (content!288 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!390436 () Bool)

(assert (=> d!94643 (= lt!314714 e!390436)))

(declare-fun res!450808 () Bool)

(assert (=> d!94643 (=> (not res!450808) (not e!390436))))

(assert (=> d!94643 (= res!450808 ((_ is Cons!12929) acc!681))))

(assert (=> d!94643 (= (contains!3585 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!314714)))

(declare-fun b!685538 () Bool)

(declare-fun e!390437 () Bool)

(assert (=> b!685538 (= e!390436 e!390437)))

(declare-fun res!450807 () Bool)

(assert (=> b!685538 (=> res!450807 e!390437)))

(assert (=> b!685538 (= res!450807 (= (h!13977 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!685539 () Bool)

(assert (=> b!685539 (= e!390437 (contains!3585 (t!19174 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94643 res!450808) b!685538))

(assert (= (and b!685538 (not res!450807)) b!685539))

(assert (=> d!94643 m!650199))

(declare-fun m!650235 () Bool)

(assert (=> d!94643 m!650235))

(declare-fun m!650237 () Bool)

(assert (=> b!685539 m!650237))

(assert (=> b!685246 d!94643))

(declare-fun b!685542 () Bool)

(declare-fun e!390443 () Bool)

(declare-fun e!390442 () Bool)

(assert (=> b!685542 (= e!390443 e!390442)))

(declare-fun c!77734 () Bool)

(assert (=> b!685542 (= c!77734 (validKeyInArray!0 (select (arr!18985 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!685543 () Bool)

(declare-fun call!34073 () Bool)

(assert (=> b!685543 (= e!390442 call!34073)))

(declare-fun b!685544 () Bool)

(assert (=> b!685544 (= e!390442 call!34073)))

(declare-fun b!685545 () Bool)

(declare-fun e!390440 () Bool)

(assert (=> b!685545 (= e!390440 (contains!3585 Nil!12930 (select (arr!18985 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!685546 () Bool)

(declare-fun e!390441 () Bool)

(assert (=> b!685546 (= e!390441 e!390443)))

(declare-fun res!450813 () Bool)

(assert (=> b!685546 (=> (not res!450813) (not e!390443))))

(assert (=> b!685546 (= res!450813 (not e!390440))))

(declare-fun res!450811 () Bool)

(assert (=> b!685546 (=> (not res!450811) (not e!390440))))

(assert (=> b!685546 (= res!450811 (validKeyInArray!0 (select (arr!18985 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!94647 () Bool)

(declare-fun res!450812 () Bool)

(assert (=> d!94647 (=> res!450812 e!390441)))

(assert (=> d!94647 (= res!450812 (bvsge #b00000000000000000000000000000000 (size!19354 a!3626)))))

(assert (=> d!94647 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12930) e!390441)))

(declare-fun bm!34070 () Bool)

(assert (=> bm!34070 (= call!34073 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77734 (Cons!12929 (select (arr!18985 a!3626) #b00000000000000000000000000000000) Nil!12930) Nil!12930)))))

(assert (= (and d!94647 (not res!450812)) b!685546))

(assert (= (and b!685546 res!450811) b!685545))

(assert (= (and b!685546 res!450813) b!685542))

(assert (= (and b!685542 c!77734) b!685543))

(assert (= (and b!685542 (not c!77734)) b!685544))

(assert (= (or b!685543 b!685544) bm!34070))

(assert (=> b!685542 m!650193))

(assert (=> b!685542 m!650193))

(declare-fun m!650245 () Bool)

(assert (=> b!685542 m!650245))

(assert (=> b!685545 m!650193))

(assert (=> b!685545 m!650193))

(declare-fun m!650247 () Bool)

(assert (=> b!685545 m!650247))

(assert (=> b!685546 m!650193))

(assert (=> b!685546 m!650193))

(assert (=> b!685546 m!650245))

(assert (=> bm!34070 m!650193))

(declare-fun m!650249 () Bool)

(assert (=> bm!34070 m!650249))

(assert (=> b!685247 d!94647))

(assert (=> b!685236 d!94621))

(declare-fun d!94653 () Bool)

(declare-fun lt!314716 () Bool)

(assert (=> d!94653 (= lt!314716 (select (content!288 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!390444 () Bool)

(assert (=> d!94653 (= lt!314716 e!390444)))

(declare-fun res!450815 () Bool)

(assert (=> d!94653 (=> (not res!450815) (not e!390444))))

(assert (=> d!94653 (= res!450815 ((_ is Cons!12929) acc!681))))

(assert (=> d!94653 (= (contains!3585 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!314716)))

(declare-fun b!685547 () Bool)

(declare-fun e!390445 () Bool)

(assert (=> b!685547 (= e!390444 e!390445)))

(declare-fun res!450814 () Bool)

(assert (=> b!685547 (=> res!450814 e!390445)))

(assert (=> b!685547 (= res!450814 (= (h!13977 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!685548 () Bool)

(assert (=> b!685548 (= e!390445 (contains!3585 (t!19174 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94653 res!450815) b!685547))

(assert (= (and b!685547 (not res!450814)) b!685548))

(assert (=> d!94653 m!650199))

(declare-fun m!650251 () Bool)

(assert (=> d!94653 m!650251))

(declare-fun m!650253 () Bool)

(assert (=> b!685548 m!650253))

(assert (=> b!685248 d!94653))

(declare-fun d!94655 () Bool)

(declare-fun lt!314717 () Bool)

(assert (=> d!94655 (= lt!314717 (select (content!288 lt!314624) k0!2843))))

(declare-fun e!390446 () Bool)

(assert (=> d!94655 (= lt!314717 e!390446)))

(declare-fun res!450817 () Bool)

(assert (=> d!94655 (=> (not res!450817) (not e!390446))))

(assert (=> d!94655 (= res!450817 ((_ is Cons!12929) lt!314624))))

(assert (=> d!94655 (= (contains!3585 lt!314624 k0!2843) lt!314717)))

(declare-fun b!685549 () Bool)

(declare-fun e!390447 () Bool)

(assert (=> b!685549 (= e!390446 e!390447)))

(declare-fun res!450816 () Bool)

(assert (=> b!685549 (=> res!450816 e!390447)))

(assert (=> b!685549 (= res!450816 (= (h!13977 lt!314624) k0!2843))))

(declare-fun b!685550 () Bool)

(assert (=> b!685550 (= e!390447 (contains!3585 (t!19174 lt!314624) k0!2843))))

(assert (= (and d!94655 res!450817) b!685549))

(assert (= (and b!685549 (not res!450816)) b!685550))

(assert (=> d!94655 m!650137))

(declare-fun m!650255 () Bool)

(assert (=> d!94655 m!650255))

(declare-fun m!650257 () Bool)

(assert (=> b!685550 m!650257))

(assert (=> b!685249 d!94655))

(check-sat (not bm!34059) (not b!685520) (not b!685545) (not b!685548) (not b!685401) (not b!685476) (not d!94655) (not b!685539) (not bm!34068) (not d!94585) (not b!685514) (not b!685421) (not b!685513) (not b!685480) (not d!94621) (not d!94653) (not bm!34070) (not b!685527) (not b!685550) (not bm!34062) (not b!685532) (not d!94643) (not b!685484) (not b!685542) (not b!685531) (not b!685526) (not b!685519) (not b!685546) (not d!94599) (not d!94579) (not b!685528) (not b!685490) (not b!685479) (not d!94591) (not b!685437) (not d!94633) (not b!685408) (not b!685402))
(check-sat)
