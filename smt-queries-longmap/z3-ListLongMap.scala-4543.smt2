; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63334 () Bool)

(assert start!63334)

(declare-fun b!712971 () Bool)

(declare-fun res!476042 () Bool)

(declare-fun e!401074 () Bool)

(assert (=> b!712971 (=> (not res!476042) (not e!401074))))

(declare-datatypes ((List!13302 0))(
  ( (Nil!13299) (Cons!13298 (h!14346 (_ BitVec 64)) (t!19606 List!13302)) )
))
(declare-fun lt!318718 () List!13302)

(declare-fun noDuplicate!1228 (List!13302) Bool)

(assert (=> b!712971 (= res!476042 (noDuplicate!1228 lt!318718))))

(declare-fun b!712972 () Bool)

(declare-fun res!476028 () Bool)

(declare-fun e!401076 () Bool)

(assert (=> b!712972 (=> (not res!476028) (not e!401076))))

(declare-fun newAcc!49 () List!13302)

(declare-fun contains!3954 (List!13302 (_ BitVec 64)) Bool)

(assert (=> b!712972 (= res!476028 (not (contains!3954 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712973 () Bool)

(declare-fun res!476038 () Bool)

(assert (=> b!712973 (=> (not res!476038) (not e!401076))))

(declare-fun k0!2824 () (_ BitVec 64))

(assert (=> b!712973 (= res!476038 (contains!3954 newAcc!49 k0!2824))))

(declare-fun b!712974 () Bool)

(declare-fun res!476021 () Bool)

(assert (=> b!712974 (=> (not res!476021) (not e!401074))))

(declare-fun lt!318719 () List!13302)

(declare-fun -!386 (List!13302 (_ BitVec 64)) List!13302)

(assert (=> b!712974 (= res!476021 (= (-!386 lt!318719 k0!2824) lt!318718))))

(declare-fun b!712975 () Bool)

(declare-fun res!476020 () Bool)

(assert (=> b!712975 (=> (not res!476020) (not e!401074))))

(assert (=> b!712975 (= res!476020 (not (contains!3954 lt!318719 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712976 () Bool)

(declare-fun res!476034 () Bool)

(assert (=> b!712976 (=> (not res!476034) (not e!401076))))

(assert (=> b!712976 (= res!476034 (noDuplicate!1228 newAcc!49))))

(declare-fun b!712977 () Bool)

(assert (=> b!712977 (= e!401076 e!401074)))

(declare-fun res!476044 () Bool)

(assert (=> b!712977 (=> (not res!476044) (not e!401074))))

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!712977 (= res!476044 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-datatypes ((array!40431 0))(
  ( (array!40432 (arr!19354 (Array (_ BitVec 32) (_ BitVec 64))) (size!19763 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40431)

(declare-fun $colon$colon!530 (List!13302 (_ BitVec 64)) List!13302)

(assert (=> b!712977 (= lt!318719 ($colon$colon!530 newAcc!49 (select (arr!19354 a!3591) from!2969)))))

(declare-fun acc!652 () List!13302)

(assert (=> b!712977 (= lt!318718 ($colon$colon!530 acc!652 (select (arr!19354 a!3591) from!2969)))))

(declare-fun b!712978 () Bool)

(declare-fun res!476039 () Bool)

(assert (=> b!712978 (=> (not res!476039) (not e!401076))))

(assert (=> b!712978 (= res!476039 (not (contains!3954 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712979 () Bool)

(declare-fun res!476026 () Bool)

(assert (=> b!712979 (=> (not res!476026) (not e!401076))))

(declare-fun arrayContainsKey!0 (array!40431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!712979 (= res!476026 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!712980 () Bool)

(declare-fun res!476022 () Bool)

(assert (=> b!712980 (=> (not res!476022) (not e!401076))))

(assert (=> b!712980 (= res!476022 (noDuplicate!1228 acc!652))))

(declare-fun b!712981 () Bool)

(declare-fun res!476037 () Bool)

(assert (=> b!712981 (=> (not res!476037) (not e!401074))))

(assert (=> b!712981 (= res!476037 (not (contains!3954 lt!318718 k0!2824)))))

(declare-fun b!712982 () Bool)

(declare-fun res!476040 () Bool)

(assert (=> b!712982 (=> (not res!476040) (not e!401074))))

(declare-fun arrayNoDuplicates!0 (array!40431 (_ BitVec 32) List!13302) Bool)

(assert (=> b!712982 (= res!476040 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318718))))

(declare-fun b!712983 () Bool)

(declare-fun res!476033 () Bool)

(assert (=> b!712983 (=> (not res!476033) (not e!401076))))

(assert (=> b!712983 (= res!476033 (not (contains!3954 acc!652 k0!2824)))))

(declare-fun b!712984 () Bool)

(declare-fun res!476025 () Bool)

(assert (=> b!712984 (=> (not res!476025) (not e!401076))))

(assert (=> b!712984 (= res!476025 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19763 a!3591)))))

(declare-fun b!712985 () Bool)

(declare-fun res!476018 () Bool)

(assert (=> b!712985 (=> (not res!476018) (not e!401076))))

(declare-fun subseq!422 (List!13302 List!13302) Bool)

(assert (=> b!712985 (= res!476018 (subseq!422 acc!652 newAcc!49))))

(declare-fun b!712986 () Bool)

(declare-fun res!476024 () Bool)

(assert (=> b!712986 (=> (not res!476024) (not e!401074))))

(assert (=> b!712986 (= res!476024 (noDuplicate!1228 lt!318719))))

(declare-fun b!712987 () Bool)

(declare-fun res!476023 () Bool)

(assert (=> b!712987 (=> (not res!476023) (not e!401076))))

(assert (=> b!712987 (= res!476023 (= (-!386 newAcc!49 k0!2824) acc!652))))

(declare-fun b!712988 () Bool)

(declare-fun res!476027 () Bool)

(assert (=> b!712988 (=> (not res!476027) (not e!401074))))

(assert (=> b!712988 (= res!476027 (not (contains!3954 lt!318718 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712989 () Bool)

(declare-fun res!476031 () Bool)

(assert (=> b!712989 (=> (not res!476031) (not e!401076))))

(assert (=> b!712989 (= res!476031 (not (contains!3954 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!476035 () Bool)

(assert (=> start!63334 (=> (not res!476035) (not e!401076))))

(assert (=> start!63334 (= res!476035 (and (bvslt (size!19763 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19763 a!3591))))))

(assert (=> start!63334 e!401076))

(assert (=> start!63334 true))

(declare-fun array_inv!15213 (array!40431) Bool)

(assert (=> start!63334 (array_inv!15213 a!3591)))

(declare-fun b!712990 () Bool)

(declare-fun res!476016 () Bool)

(assert (=> b!712990 (=> (not res!476016) (not e!401076))))

(assert (=> b!712990 (= res!476016 (not (contains!3954 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712991 () Bool)

(declare-fun res!476019 () Bool)

(assert (=> b!712991 (=> (not res!476019) (not e!401074))))

(assert (=> b!712991 (= res!476019 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!712992 () Bool)

(declare-fun res!476036 () Bool)

(assert (=> b!712992 (=> (not res!476036) (not e!401074))))

(assert (=> b!712992 (= res!476036 (not (contains!3954 lt!318718 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712993 () Bool)

(declare-fun res!476043 () Bool)

(assert (=> b!712993 (=> (not res!476043) (not e!401074))))

(assert (=> b!712993 (= res!476043 (subseq!422 lt!318718 lt!318719))))

(declare-fun b!712994 () Bool)

(assert (=> b!712994 (= e!401074 (not (arrayNoDuplicates!0 a!3591 from!2969 newAcc!49)))))

(assert (=> b!712994 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318719)))

(declare-datatypes ((Unit!24609 0))(
  ( (Unit!24610) )
))
(declare-fun lt!318720 () Unit!24609)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40431 (_ BitVec 64) (_ BitVec 32) List!13302 List!13302) Unit!24609)

(assert (=> b!712994 (= lt!318720 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!318718 lt!318719))))

(declare-fun b!712995 () Bool)

(declare-fun res!476032 () Bool)

(assert (=> b!712995 (=> (not res!476032) (not e!401074))))

(assert (=> b!712995 (= res!476032 (not (contains!3954 lt!318719 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712996 () Bool)

(declare-fun res!476030 () Bool)

(assert (=> b!712996 (=> (not res!476030) (not e!401076))))

(assert (=> b!712996 (= res!476030 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!712997 () Bool)

(declare-fun res!476017 () Bool)

(assert (=> b!712997 (=> (not res!476017) (not e!401076))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!712997 (= res!476017 (validKeyInArray!0 (select (arr!19354 a!3591) from!2969)))))

(declare-fun b!712998 () Bool)

(declare-fun res!476041 () Bool)

(assert (=> b!712998 (=> (not res!476041) (not e!401074))))

(assert (=> b!712998 (= res!476041 (contains!3954 lt!318719 k0!2824))))

(declare-fun b!712999 () Bool)

(declare-fun res!476029 () Bool)

(assert (=> b!712999 (=> (not res!476029) (not e!401076))))

(assert (=> b!712999 (= res!476029 (validKeyInArray!0 k0!2824))))

(assert (= (and start!63334 res!476035) b!712980))

(assert (= (and b!712980 res!476022) b!712976))

(assert (= (and b!712976 res!476034) b!712989))

(assert (= (and b!712989 res!476031) b!712978))

(assert (= (and b!712978 res!476039) b!712979))

(assert (= (and b!712979 res!476026) b!712983))

(assert (= (and b!712983 res!476033) b!712999))

(assert (= (and b!712999 res!476029) b!712996))

(assert (= (and b!712996 res!476030) b!712985))

(assert (= (and b!712985 res!476018) b!712973))

(assert (= (and b!712973 res!476038) b!712987))

(assert (= (and b!712987 res!476023) b!712972))

(assert (= (and b!712972 res!476028) b!712990))

(assert (= (and b!712990 res!476016) b!712984))

(assert (= (and b!712984 res!476025) b!712997))

(assert (= (and b!712997 res!476017) b!712977))

(assert (= (and b!712977 res!476044) b!712971))

(assert (= (and b!712971 res!476042) b!712986))

(assert (= (and b!712986 res!476024) b!712988))

(assert (= (and b!712988 res!476027) b!712992))

(assert (= (and b!712992 res!476036) b!712991))

(assert (= (and b!712991 res!476019) b!712981))

(assert (= (and b!712981 res!476037) b!712982))

(assert (= (and b!712982 res!476040) b!712993))

(assert (= (and b!712993 res!476043) b!712998))

(assert (= (and b!712998 res!476041) b!712974))

(assert (= (and b!712974 res!476021) b!712995))

(assert (= (and b!712995 res!476032) b!712975))

(assert (= (and b!712975 res!476020) b!712994))

(declare-fun m!670323 () Bool)

(assert (=> b!712995 m!670323))

(declare-fun m!670325 () Bool)

(assert (=> b!712971 m!670325))

(declare-fun m!670327 () Bool)

(assert (=> b!712998 m!670327))

(declare-fun m!670329 () Bool)

(assert (=> b!712992 m!670329))

(declare-fun m!670331 () Bool)

(assert (=> b!712991 m!670331))

(declare-fun m!670333 () Bool)

(assert (=> start!63334 m!670333))

(declare-fun m!670335 () Bool)

(assert (=> b!712980 m!670335))

(declare-fun m!670337 () Bool)

(assert (=> b!712994 m!670337))

(declare-fun m!670339 () Bool)

(assert (=> b!712994 m!670339))

(declare-fun m!670341 () Bool)

(assert (=> b!712994 m!670341))

(declare-fun m!670343 () Bool)

(assert (=> b!712982 m!670343))

(declare-fun m!670345 () Bool)

(assert (=> b!712996 m!670345))

(declare-fun m!670347 () Bool)

(assert (=> b!712999 m!670347))

(declare-fun m!670349 () Bool)

(assert (=> b!712972 m!670349))

(declare-fun m!670351 () Bool)

(assert (=> b!712983 m!670351))

(declare-fun m!670353 () Bool)

(assert (=> b!712975 m!670353))

(declare-fun m!670355 () Bool)

(assert (=> b!712977 m!670355))

(assert (=> b!712977 m!670355))

(declare-fun m!670357 () Bool)

(assert (=> b!712977 m!670357))

(assert (=> b!712977 m!670355))

(declare-fun m!670359 () Bool)

(assert (=> b!712977 m!670359))

(declare-fun m!670361 () Bool)

(assert (=> b!712990 m!670361))

(declare-fun m!670363 () Bool)

(assert (=> b!712978 m!670363))

(declare-fun m!670365 () Bool)

(assert (=> b!712974 m!670365))

(declare-fun m!670367 () Bool)

(assert (=> b!712979 m!670367))

(declare-fun m!670369 () Bool)

(assert (=> b!712976 m!670369))

(declare-fun m!670371 () Bool)

(assert (=> b!712987 m!670371))

(declare-fun m!670373 () Bool)

(assert (=> b!712985 m!670373))

(declare-fun m!670375 () Bool)

(assert (=> b!712981 m!670375))

(assert (=> b!712997 m!670355))

(assert (=> b!712997 m!670355))

(declare-fun m!670377 () Bool)

(assert (=> b!712997 m!670377))

(declare-fun m!670379 () Bool)

(assert (=> b!712993 m!670379))

(declare-fun m!670381 () Bool)

(assert (=> b!712973 m!670381))

(declare-fun m!670383 () Bool)

(assert (=> b!712989 m!670383))

(declare-fun m!670385 () Bool)

(assert (=> b!712986 m!670385))

(declare-fun m!670387 () Bool)

(assert (=> b!712988 m!670387))

(check-sat (not b!712990) (not b!712987) (not b!712993) (not b!712974) (not b!712986) (not b!712972) (not b!712992) (not b!712983) (not b!712996) (not b!712979) (not b!712999) (not b!712985) (not b!712976) (not b!712975) (not b!712989) (not b!712997) (not b!712978) (not b!712973) (not b!712982) (not b!712971) (not b!712981) (not b!712994) (not b!712988) (not b!712991) (not b!712977) (not b!712998) (not start!63334) (not b!712995) (not b!712980))
(check-sat)
(get-model)

(declare-fun d!98169 () Bool)

(declare-fun lt!318741 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!362 (List!13302) (InoxSet (_ BitVec 64)))

(assert (=> d!98169 (= lt!318741 (select (content!362 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401100 () Bool)

(assert (=> d!98169 (= lt!318741 e!401100)))

(declare-fun res!476224 () Bool)

(assert (=> d!98169 (=> (not res!476224) (not e!401100))))

(get-info :version)

(assert (=> d!98169 (= res!476224 ((_ is Cons!13298) newAcc!49))))

(assert (=> d!98169 (= (contains!3954 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318741)))

(declare-fun b!713178 () Bool)

(declare-fun e!401099 () Bool)

(assert (=> b!713178 (= e!401100 e!401099)))

(declare-fun res!476223 () Bool)

(assert (=> b!713178 (=> res!476223 e!401099)))

(assert (=> b!713178 (= res!476223 (= (h!14346 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713179 () Bool)

(assert (=> b!713179 (= e!401099 (contains!3954 (t!19606 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98169 res!476224) b!713178))

(assert (= (and b!713178 (not res!476223)) b!713179))

(declare-fun m!670521 () Bool)

(assert (=> d!98169 m!670521))

(declare-fun m!670523 () Bool)

(assert (=> d!98169 m!670523))

(declare-fun m!670525 () Bool)

(assert (=> b!713179 m!670525))

(assert (=> b!712972 d!98169))

(declare-fun d!98171 () Bool)

(declare-fun lt!318742 () Bool)

(assert (=> d!98171 (= lt!318742 (select (content!362 newAcc!49) k0!2824))))

(declare-fun e!401102 () Bool)

(assert (=> d!98171 (= lt!318742 e!401102)))

(declare-fun res!476226 () Bool)

(assert (=> d!98171 (=> (not res!476226) (not e!401102))))

(assert (=> d!98171 (= res!476226 ((_ is Cons!13298) newAcc!49))))

(assert (=> d!98171 (= (contains!3954 newAcc!49 k0!2824) lt!318742)))

(declare-fun b!713180 () Bool)

(declare-fun e!401101 () Bool)

(assert (=> b!713180 (= e!401102 e!401101)))

(declare-fun res!476225 () Bool)

(assert (=> b!713180 (=> res!476225 e!401101)))

(assert (=> b!713180 (= res!476225 (= (h!14346 newAcc!49) k0!2824))))

(declare-fun b!713181 () Bool)

(assert (=> b!713181 (= e!401101 (contains!3954 (t!19606 newAcc!49) k0!2824))))

(assert (= (and d!98171 res!476226) b!713180))

(assert (= (and b!713180 (not res!476225)) b!713181))

(assert (=> d!98171 m!670521))

(declare-fun m!670527 () Bool)

(assert (=> d!98171 m!670527))

(declare-fun m!670529 () Bool)

(assert (=> b!713181 m!670529))

(assert (=> b!712973 d!98171))

(declare-fun b!713192 () Bool)

(declare-fun e!401114 () Bool)

(declare-fun call!34572 () Bool)

(assert (=> b!713192 (= e!401114 call!34572)))

(declare-fun b!713193 () Bool)

(declare-fun e!401111 () Bool)

(declare-fun e!401112 () Bool)

(assert (=> b!713193 (= e!401111 e!401112)))

(declare-fun res!476235 () Bool)

(assert (=> b!713193 (=> (not res!476235) (not e!401112))))

(declare-fun e!401113 () Bool)

(assert (=> b!713193 (= res!476235 (not e!401113))))

(declare-fun res!476234 () Bool)

(assert (=> b!713193 (=> (not res!476234) (not e!401113))))

(assert (=> b!713193 (= res!476234 (validKeyInArray!0 (select (arr!19354 a!3591) from!2969)))))

(declare-fun b!713194 () Bool)

(assert (=> b!713194 (= e!401114 call!34572)))

(declare-fun c!78848 () Bool)

(declare-fun bm!34569 () Bool)

(assert (=> bm!34569 (= call!34572 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78848 (Cons!13298 (select (arr!19354 a!3591) from!2969) newAcc!49) newAcc!49)))))

(declare-fun b!713196 () Bool)

(assert (=> b!713196 (= e!401112 e!401114)))

(assert (=> b!713196 (= c!78848 (validKeyInArray!0 (select (arr!19354 a!3591) from!2969)))))

(declare-fun b!713195 () Bool)

(assert (=> b!713195 (= e!401113 (contains!3954 newAcc!49 (select (arr!19354 a!3591) from!2969)))))

(declare-fun d!98173 () Bool)

(declare-fun res!476233 () Bool)

(assert (=> d!98173 (=> res!476233 e!401111)))

(assert (=> d!98173 (= res!476233 (bvsge from!2969 (size!19763 a!3591)))))

(assert (=> d!98173 (= (arrayNoDuplicates!0 a!3591 from!2969 newAcc!49) e!401111)))

(assert (= (and d!98173 (not res!476233)) b!713193))

(assert (= (and b!713193 res!476234) b!713195))

(assert (= (and b!713193 res!476235) b!713196))

(assert (= (and b!713196 c!78848) b!713192))

(assert (= (and b!713196 (not c!78848)) b!713194))

(assert (= (or b!713192 b!713194) bm!34569))

(assert (=> b!713193 m!670355))

(assert (=> b!713193 m!670355))

(assert (=> b!713193 m!670377))

(assert (=> bm!34569 m!670355))

(declare-fun m!670531 () Bool)

(assert (=> bm!34569 m!670531))

(assert (=> b!713196 m!670355))

(assert (=> b!713196 m!670355))

(assert (=> b!713196 m!670377))

(assert (=> b!713195 m!670355))

(assert (=> b!713195 m!670355))

(declare-fun m!670533 () Bool)

(assert (=> b!713195 m!670533))

(assert (=> b!712994 d!98173))

(declare-fun b!713197 () Bool)

(declare-fun e!401118 () Bool)

(declare-fun call!34573 () Bool)

(assert (=> b!713197 (= e!401118 call!34573)))

(declare-fun b!713198 () Bool)

(declare-fun e!401115 () Bool)

(declare-fun e!401116 () Bool)

(assert (=> b!713198 (= e!401115 e!401116)))

(declare-fun res!476238 () Bool)

(assert (=> b!713198 (=> (not res!476238) (not e!401116))))

(declare-fun e!401117 () Bool)

(assert (=> b!713198 (= res!476238 (not e!401117))))

(declare-fun res!476237 () Bool)

(assert (=> b!713198 (=> (not res!476237) (not e!401117))))

(assert (=> b!713198 (= res!476237 (validKeyInArray!0 (select (arr!19354 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!713199 () Bool)

(assert (=> b!713199 (= e!401118 call!34573)))

(declare-fun c!78849 () Bool)

(declare-fun bm!34570 () Bool)

(assert (=> bm!34570 (= call!34573 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78849 (Cons!13298 (select (arr!19354 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) lt!318719) lt!318719)))))

(declare-fun b!713201 () Bool)

(assert (=> b!713201 (= e!401116 e!401118)))

(assert (=> b!713201 (= c!78849 (validKeyInArray!0 (select (arr!19354 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!713200 () Bool)

(assert (=> b!713200 (= e!401117 (contains!3954 lt!318719 (select (arr!19354 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun d!98175 () Bool)

(declare-fun res!476236 () Bool)

(assert (=> d!98175 (=> res!476236 e!401115)))

(assert (=> d!98175 (= res!476236 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19763 a!3591)))))

(assert (=> d!98175 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318719) e!401115)))

(assert (= (and d!98175 (not res!476236)) b!713198))

(assert (= (and b!713198 res!476237) b!713200))

(assert (= (and b!713198 res!476238) b!713201))

(assert (= (and b!713201 c!78849) b!713197))

(assert (= (and b!713201 (not c!78849)) b!713199))

(assert (= (or b!713197 b!713199) bm!34570))

(declare-fun m!670535 () Bool)

(assert (=> b!713198 m!670535))

(assert (=> b!713198 m!670535))

(declare-fun m!670537 () Bool)

(assert (=> b!713198 m!670537))

(assert (=> bm!34570 m!670535))

(declare-fun m!670539 () Bool)

(assert (=> bm!34570 m!670539))

(assert (=> b!713201 m!670535))

(assert (=> b!713201 m!670535))

(assert (=> b!713201 m!670537))

(assert (=> b!713200 m!670535))

(assert (=> b!713200 m!670535))

(declare-fun m!670541 () Bool)

(assert (=> b!713200 m!670541))

(assert (=> b!712994 d!98175))

(declare-fun d!98177 () Bool)

(assert (=> d!98177 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318719)))

(declare-fun lt!318745 () Unit!24609)

(declare-fun choose!66 (array!40431 (_ BitVec 64) (_ BitVec 32) List!13302 List!13302) Unit!24609)

(assert (=> d!98177 (= lt!318745 (choose!66 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!318718 lt!318719))))

(assert (=> d!98177 (bvslt (size!19763 a!3591) #b01111111111111111111111111111111)))

(assert (=> d!98177 (= (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!318718 lt!318719) lt!318745)))

(declare-fun bs!20576 () Bool)

(assert (= bs!20576 d!98177))

(assert (=> bs!20576 m!670339))

(declare-fun m!670543 () Bool)

(assert (=> bs!20576 m!670543))

(assert (=> b!712994 d!98177))

(declare-fun d!98179 () Bool)

(declare-fun lt!318746 () Bool)

(assert (=> d!98179 (= lt!318746 (select (content!362 lt!318719) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401120 () Bool)

(assert (=> d!98179 (= lt!318746 e!401120)))

(declare-fun res!476240 () Bool)

(assert (=> d!98179 (=> (not res!476240) (not e!401120))))

(assert (=> d!98179 (= res!476240 ((_ is Cons!13298) lt!318719))))

(assert (=> d!98179 (= (contains!3954 lt!318719 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318746)))

(declare-fun b!713202 () Bool)

(declare-fun e!401119 () Bool)

(assert (=> b!713202 (= e!401120 e!401119)))

(declare-fun res!476239 () Bool)

(assert (=> b!713202 (=> res!476239 e!401119)))

(assert (=> b!713202 (= res!476239 (= (h!14346 lt!318719) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713203 () Bool)

(assert (=> b!713203 (= e!401119 (contains!3954 (t!19606 lt!318719) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98179 res!476240) b!713202))

(assert (= (and b!713202 (not res!476239)) b!713203))

(declare-fun m!670545 () Bool)

(assert (=> d!98179 m!670545))

(declare-fun m!670547 () Bool)

(assert (=> d!98179 m!670547))

(declare-fun m!670549 () Bool)

(assert (=> b!713203 m!670549))

(assert (=> b!712995 d!98179))

(declare-fun b!713230 () Bool)

(declare-fun e!401146 () List!13302)

(declare-fun call!34576 () List!13302)

(assert (=> b!713230 (= e!401146 call!34576)))

(declare-fun b!713231 () Bool)

(declare-fun e!401145 () List!13302)

(assert (=> b!713231 (= e!401145 e!401146)))

(declare-fun c!78855 () Bool)

(assert (=> b!713231 (= c!78855 (= k0!2824 (h!14346 lt!318719)))))

(declare-fun d!98181 () Bool)

(declare-fun e!401144 () Bool)

(assert (=> d!98181 e!401144))

(declare-fun res!476259 () Bool)

(assert (=> d!98181 (=> (not res!476259) (not e!401144))))

(declare-fun lt!318751 () List!13302)

(declare-fun size!19766 (List!13302) Int)

(assert (=> d!98181 (= res!476259 (<= (size!19766 lt!318751) (size!19766 lt!318719)))))

(assert (=> d!98181 (= lt!318751 e!401145)))

(declare-fun c!78854 () Bool)

(assert (=> d!98181 (= c!78854 ((_ is Cons!13298) lt!318719))))

(assert (=> d!98181 (= (-!386 lt!318719 k0!2824) lt!318751)))

(declare-fun bm!34573 () Bool)

(assert (=> bm!34573 (= call!34576 (-!386 (t!19606 lt!318719) k0!2824))))

(declare-fun b!713232 () Bool)

(assert (=> b!713232 (= e!401144 (= (content!362 lt!318751) ((_ map and) (content!362 lt!318719) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun b!713233 () Bool)

(assert (=> b!713233 (= e!401145 Nil!13299)))

(declare-fun b!713234 () Bool)

(assert (=> b!713234 (= e!401146 (Cons!13298 (h!14346 lt!318719) call!34576))))

(assert (= (and d!98181 c!78854) b!713231))

(assert (= (and d!98181 (not c!78854)) b!713233))

(assert (= (and b!713231 c!78855) b!713230))

(assert (= (and b!713231 (not c!78855)) b!713234))

(assert (= (or b!713230 b!713234) bm!34573))

(assert (= (and d!98181 res!476259) b!713232))

(declare-fun m!670557 () Bool)

(assert (=> d!98181 m!670557))

(declare-fun m!670559 () Bool)

(assert (=> d!98181 m!670559))

(declare-fun m!670561 () Bool)

(assert (=> bm!34573 m!670561))

(declare-fun m!670563 () Bool)

(assert (=> b!713232 m!670563))

(assert (=> b!713232 m!670545))

(declare-fun m!670565 () Bool)

(assert (=> b!713232 m!670565))

(assert (=> b!712974 d!98181))

(declare-fun d!98191 () Bool)

(declare-fun lt!318753 () Bool)

(assert (=> d!98191 (= lt!318753 (select (content!362 lt!318719) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401150 () Bool)

(assert (=> d!98191 (= lt!318753 e!401150)))

(declare-fun res!476263 () Bool)

(assert (=> d!98191 (=> (not res!476263) (not e!401150))))

(assert (=> d!98191 (= res!476263 ((_ is Cons!13298) lt!318719))))

(assert (=> d!98191 (= (contains!3954 lt!318719 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318753)))

(declare-fun b!713237 () Bool)

(declare-fun e!401149 () Bool)

(assert (=> b!713237 (= e!401150 e!401149)))

(declare-fun res!476262 () Bool)

(assert (=> b!713237 (=> res!476262 e!401149)))

(assert (=> b!713237 (= res!476262 (= (h!14346 lt!318719) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713238 () Bool)

(assert (=> b!713238 (= e!401149 (contains!3954 (t!19606 lt!318719) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98191 res!476263) b!713237))

(assert (= (and b!713237 (not res!476262)) b!713238))

(assert (=> d!98191 m!670545))

(declare-fun m!670573 () Bool)

(assert (=> d!98191 m!670573))

(declare-fun m!670575 () Bool)

(assert (=> b!713238 m!670575))

(assert (=> b!712975 d!98191))

(declare-fun b!713241 () Bool)

(declare-fun e!401156 () Bool)

(declare-fun call!34577 () Bool)

(assert (=> b!713241 (= e!401156 call!34577)))

(declare-fun b!713242 () Bool)

(declare-fun e!401153 () Bool)

(declare-fun e!401154 () Bool)

(assert (=> b!713242 (= e!401153 e!401154)))

(declare-fun res!476268 () Bool)

(assert (=> b!713242 (=> (not res!476268) (not e!401154))))

(declare-fun e!401155 () Bool)

(assert (=> b!713242 (= res!476268 (not e!401155))))

(declare-fun res!476267 () Bool)

(assert (=> b!713242 (=> (not res!476267) (not e!401155))))

(assert (=> b!713242 (= res!476267 (validKeyInArray!0 (select (arr!19354 a!3591) from!2969)))))

(declare-fun b!713243 () Bool)

(assert (=> b!713243 (= e!401156 call!34577)))

(declare-fun bm!34574 () Bool)

(declare-fun c!78856 () Bool)

(assert (=> bm!34574 (= call!34577 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78856 (Cons!13298 (select (arr!19354 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!713245 () Bool)

(assert (=> b!713245 (= e!401154 e!401156)))

(assert (=> b!713245 (= c!78856 (validKeyInArray!0 (select (arr!19354 a!3591) from!2969)))))

(declare-fun b!713244 () Bool)

(assert (=> b!713244 (= e!401155 (contains!3954 acc!652 (select (arr!19354 a!3591) from!2969)))))

(declare-fun d!98195 () Bool)

(declare-fun res!476266 () Bool)

(assert (=> d!98195 (=> res!476266 e!401153)))

(assert (=> d!98195 (= res!476266 (bvsge from!2969 (size!19763 a!3591)))))

(assert (=> d!98195 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!401153)))

(assert (= (and d!98195 (not res!476266)) b!713242))

(assert (= (and b!713242 res!476267) b!713244))

(assert (= (and b!713242 res!476268) b!713245))

(assert (= (and b!713245 c!78856) b!713241))

(assert (= (and b!713245 (not c!78856)) b!713243))

(assert (= (or b!713241 b!713243) bm!34574))

(assert (=> b!713242 m!670355))

(assert (=> b!713242 m!670355))

(assert (=> b!713242 m!670377))

(assert (=> bm!34574 m!670355))

(declare-fun m!670583 () Bool)

(assert (=> bm!34574 m!670583))

(assert (=> b!713245 m!670355))

(assert (=> b!713245 m!670355))

(assert (=> b!713245 m!670377))

(assert (=> b!713244 m!670355))

(assert (=> b!713244 m!670355))

(declare-fun m!670585 () Bool)

(assert (=> b!713244 m!670585))

(assert (=> b!712996 d!98195))

(declare-fun d!98199 () Bool)

(assert (=> d!98199 (= (validKeyInArray!0 (select (arr!19354 a!3591) from!2969)) (and (not (= (select (arr!19354 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19354 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!712997 d!98199))

(declare-fun d!98203 () Bool)

(declare-fun res!476279 () Bool)

(declare-fun e!401167 () Bool)

(assert (=> d!98203 (=> res!476279 e!401167)))

(assert (=> d!98203 (= res!476279 ((_ is Nil!13299) newAcc!49))))

(assert (=> d!98203 (= (noDuplicate!1228 newAcc!49) e!401167)))

(declare-fun b!713256 () Bool)

(declare-fun e!401168 () Bool)

(assert (=> b!713256 (= e!401167 e!401168)))

(declare-fun res!476280 () Bool)

(assert (=> b!713256 (=> (not res!476280) (not e!401168))))

(assert (=> b!713256 (= res!476280 (not (contains!3954 (t!19606 newAcc!49) (h!14346 newAcc!49))))))

(declare-fun b!713257 () Bool)

(assert (=> b!713257 (= e!401168 (noDuplicate!1228 (t!19606 newAcc!49)))))

(assert (= (and d!98203 (not res!476279)) b!713256))

(assert (= (and b!713256 res!476280) b!713257))

(declare-fun m!670593 () Bool)

(assert (=> b!713256 m!670593))

(declare-fun m!670595 () Bool)

(assert (=> b!713257 m!670595))

(assert (=> b!712976 d!98203))

(declare-fun d!98207 () Bool)

(assert (=> d!98207 (= ($colon$colon!530 newAcc!49 (select (arr!19354 a!3591) from!2969)) (Cons!13298 (select (arr!19354 a!3591) from!2969) newAcc!49))))

(assert (=> b!712977 d!98207))

(declare-fun d!98209 () Bool)

(assert (=> d!98209 (= ($colon$colon!530 acc!652 (select (arr!19354 a!3591) from!2969)) (Cons!13298 (select (arr!19354 a!3591) from!2969) acc!652))))

(assert (=> b!712977 d!98209))

(declare-fun d!98211 () Bool)

(declare-fun lt!318758 () Bool)

(assert (=> d!98211 (= lt!318758 (select (content!362 lt!318719) k0!2824))))

(declare-fun e!401178 () Bool)

(assert (=> d!98211 (= lt!318758 e!401178)))

(declare-fun res!476288 () Bool)

(assert (=> d!98211 (=> (not res!476288) (not e!401178))))

(assert (=> d!98211 (= res!476288 ((_ is Cons!13298) lt!318719))))

(assert (=> d!98211 (= (contains!3954 lt!318719 k0!2824) lt!318758)))

(declare-fun b!713268 () Bool)

(declare-fun e!401177 () Bool)

(assert (=> b!713268 (= e!401178 e!401177)))

(declare-fun res!476287 () Bool)

(assert (=> b!713268 (=> res!476287 e!401177)))

(assert (=> b!713268 (= res!476287 (= (h!14346 lt!318719) k0!2824))))

(declare-fun b!713269 () Bool)

(assert (=> b!713269 (= e!401177 (contains!3954 (t!19606 lt!318719) k0!2824))))

(assert (= (and d!98211 res!476288) b!713268))

(assert (= (and b!713268 (not res!476287)) b!713269))

(assert (=> d!98211 m!670545))

(declare-fun m!670597 () Bool)

(assert (=> d!98211 m!670597))

(declare-fun m!670599 () Bool)

(assert (=> b!713269 m!670599))

(assert (=> b!712998 d!98211))

(declare-fun d!98213 () Bool)

(assert (=> d!98213 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!712999 d!98213))

(declare-fun d!98215 () Bool)

(assert (=> d!98215 (= (array_inv!15213 a!3591) (bvsge (size!19763 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63334 d!98215))

(declare-fun d!98217 () Bool)

(declare-fun lt!318759 () Bool)

(assert (=> d!98217 (= lt!318759 (select (content!362 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401188 () Bool)

(assert (=> d!98217 (= lt!318759 e!401188)))

(declare-fun res!476296 () Bool)

(assert (=> d!98217 (=> (not res!476296) (not e!401188))))

(assert (=> d!98217 (= res!476296 ((_ is Cons!13298) acc!652))))

(assert (=> d!98217 (= (contains!3954 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318759)))

(declare-fun b!713280 () Bool)

(declare-fun e!401187 () Bool)

(assert (=> b!713280 (= e!401188 e!401187)))

(declare-fun res!476295 () Bool)

(assert (=> b!713280 (=> res!476295 e!401187)))

(assert (=> b!713280 (= res!476295 (= (h!14346 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713281 () Bool)

(assert (=> b!713281 (= e!401187 (contains!3954 (t!19606 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98217 res!476296) b!713280))

(assert (= (and b!713280 (not res!476295)) b!713281))

(declare-fun m!670601 () Bool)

(assert (=> d!98217 m!670601))

(declare-fun m!670603 () Bool)

(assert (=> d!98217 m!670603))

(declare-fun m!670605 () Bool)

(assert (=> b!713281 m!670605))

(assert (=> b!712978 d!98217))

(declare-fun d!98219 () Bool)

(declare-fun res!476307 () Bool)

(declare-fun e!401201 () Bool)

(assert (=> d!98219 (=> res!476307 e!401201)))

(assert (=> d!98219 (= res!476307 (= (select (arr!19354 a!3591) from!2969) k0!2824))))

(assert (=> d!98219 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!401201)))

(declare-fun b!713296 () Bool)

(declare-fun e!401202 () Bool)

(assert (=> b!713296 (= e!401201 e!401202)))

(declare-fun res!476308 () Bool)

(assert (=> b!713296 (=> (not res!476308) (not e!401202))))

(assert (=> b!713296 (= res!476308 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19763 a!3591)))))

(declare-fun b!713297 () Bool)

(assert (=> b!713297 (= e!401202 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98219 (not res!476307)) b!713296))

(assert (= (and b!713296 res!476308) b!713297))

(assert (=> d!98219 m!670355))

(declare-fun m!670619 () Bool)

(assert (=> b!713297 m!670619))

(assert (=> b!712979 d!98219))

(declare-fun d!98223 () Bool)

(declare-fun res!476309 () Bool)

(declare-fun e!401203 () Bool)

(assert (=> d!98223 (=> res!476309 e!401203)))

(assert (=> d!98223 (= res!476309 ((_ is Nil!13299) acc!652))))

(assert (=> d!98223 (= (noDuplicate!1228 acc!652) e!401203)))

(declare-fun b!713298 () Bool)

(declare-fun e!401204 () Bool)

(assert (=> b!713298 (= e!401203 e!401204)))

(declare-fun res!476310 () Bool)

(assert (=> b!713298 (=> (not res!476310) (not e!401204))))

(assert (=> b!713298 (= res!476310 (not (contains!3954 (t!19606 acc!652) (h!14346 acc!652))))))

(declare-fun b!713299 () Bool)

(assert (=> b!713299 (= e!401204 (noDuplicate!1228 (t!19606 acc!652)))))

(assert (= (and d!98223 (not res!476309)) b!713298))

(assert (= (and b!713298 res!476310) b!713299))

(declare-fun m!670621 () Bool)

(assert (=> b!713298 m!670621))

(declare-fun m!670625 () Bool)

(assert (=> b!713299 m!670625))

(assert (=> b!712980 d!98223))

(declare-fun d!98227 () Bool)

(declare-fun lt!318761 () Bool)

(assert (=> d!98227 (= lt!318761 (select (content!362 lt!318718) k0!2824))))

(declare-fun e!401208 () Bool)

(assert (=> d!98227 (= lt!318761 e!401208)))

(declare-fun res!476314 () Bool)

(assert (=> d!98227 (=> (not res!476314) (not e!401208))))

(assert (=> d!98227 (= res!476314 ((_ is Cons!13298) lt!318718))))

(assert (=> d!98227 (= (contains!3954 lt!318718 k0!2824) lt!318761)))

(declare-fun b!713302 () Bool)

(declare-fun e!401207 () Bool)

(assert (=> b!713302 (= e!401208 e!401207)))

(declare-fun res!476313 () Bool)

(assert (=> b!713302 (=> res!476313 e!401207)))

(assert (=> b!713302 (= res!476313 (= (h!14346 lt!318718) k0!2824))))

(declare-fun b!713303 () Bool)

(assert (=> b!713303 (= e!401207 (contains!3954 (t!19606 lt!318718) k0!2824))))

(assert (= (and d!98227 res!476314) b!713302))

(assert (= (and b!713302 (not res!476313)) b!713303))

(declare-fun m!670631 () Bool)

(assert (=> d!98227 m!670631))

(declare-fun m!670633 () Bool)

(assert (=> d!98227 m!670633))

(declare-fun m!670635 () Bool)

(assert (=> b!713303 m!670635))

(assert (=> b!712981 d!98227))

(declare-fun b!713309 () Bool)

(declare-fun e!401216 () Bool)

(declare-fun call!34585 () Bool)

(assert (=> b!713309 (= e!401216 call!34585)))

(declare-fun b!713310 () Bool)

(declare-fun e!401213 () Bool)

(declare-fun e!401214 () Bool)

(assert (=> b!713310 (= e!401213 e!401214)))

(declare-fun res!476320 () Bool)

(assert (=> b!713310 (=> (not res!476320) (not e!401214))))

(declare-fun e!401215 () Bool)

(assert (=> b!713310 (= res!476320 (not e!401215))))

(declare-fun res!476319 () Bool)

(assert (=> b!713310 (=> (not res!476319) (not e!401215))))

(assert (=> b!713310 (= res!476319 (validKeyInArray!0 (select (arr!19354 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!713311 () Bool)

(assert (=> b!713311 (= e!401216 call!34585)))

(declare-fun bm!34582 () Bool)

(declare-fun c!78864 () Bool)

(assert (=> bm!34582 (= call!34585 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78864 (Cons!13298 (select (arr!19354 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) lt!318718) lt!318718)))))

(declare-fun b!713313 () Bool)

(assert (=> b!713313 (= e!401214 e!401216)))

(assert (=> b!713313 (= c!78864 (validKeyInArray!0 (select (arr!19354 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!713312 () Bool)

(assert (=> b!713312 (= e!401215 (contains!3954 lt!318718 (select (arr!19354 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun d!98231 () Bool)

(declare-fun res!476318 () Bool)

(assert (=> d!98231 (=> res!476318 e!401213)))

(assert (=> d!98231 (= res!476318 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19763 a!3591)))))

(assert (=> d!98231 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318718) e!401213)))

(assert (= (and d!98231 (not res!476318)) b!713310))

(assert (= (and b!713310 res!476319) b!713312))

(assert (= (and b!713310 res!476320) b!713313))

(assert (= (and b!713313 c!78864) b!713309))

(assert (= (and b!713313 (not c!78864)) b!713311))

(assert (= (or b!713309 b!713311) bm!34582))

(assert (=> b!713310 m!670535))

(assert (=> b!713310 m!670535))

(assert (=> b!713310 m!670537))

(assert (=> bm!34582 m!670535))

(declare-fun m!670641 () Bool)

(assert (=> bm!34582 m!670641))

(assert (=> b!713313 m!670535))

(assert (=> b!713313 m!670535))

(assert (=> b!713313 m!670537))

(assert (=> b!713312 m!670535))

(assert (=> b!713312 m!670535))

(declare-fun m!670643 () Bool)

(assert (=> b!713312 m!670643))

(assert (=> b!712982 d!98231))

(declare-fun d!98235 () Bool)

(declare-fun lt!318762 () Bool)

(assert (=> d!98235 (= lt!318762 (select (content!362 acc!652) k0!2824))))

(declare-fun e!401230 () Bool)

(assert (=> d!98235 (= lt!318762 e!401230)))

(declare-fun res!476333 () Bool)

(assert (=> d!98235 (=> (not res!476333) (not e!401230))))

(assert (=> d!98235 (= res!476333 ((_ is Cons!13298) acc!652))))

(assert (=> d!98235 (= (contains!3954 acc!652 k0!2824) lt!318762)))

(declare-fun b!713327 () Bool)

(declare-fun e!401229 () Bool)

(assert (=> b!713327 (= e!401230 e!401229)))

(declare-fun res!476332 () Bool)

(assert (=> b!713327 (=> res!476332 e!401229)))

(assert (=> b!713327 (= res!476332 (= (h!14346 acc!652) k0!2824))))

(declare-fun b!713328 () Bool)

(assert (=> b!713328 (= e!401229 (contains!3954 (t!19606 acc!652) k0!2824))))

(assert (= (and d!98235 res!476333) b!713327))

(assert (= (and b!713327 (not res!476332)) b!713328))

(assert (=> d!98235 m!670601))

(declare-fun m!670645 () Bool)

(assert (=> d!98235 m!670645))

(declare-fun m!670649 () Bool)

(assert (=> b!713328 m!670649))

(assert (=> b!712983 d!98235))

(declare-fun d!98237 () Bool)

(declare-fun res!476351 () Bool)

(declare-fun e!401246 () Bool)

(assert (=> d!98237 (=> res!476351 e!401246)))

(assert (=> d!98237 (= res!476351 ((_ is Nil!13299) acc!652))))

(assert (=> d!98237 (= (subseq!422 acc!652 newAcc!49) e!401246)))

(declare-fun b!713344 () Bool)

(declare-fun e!401248 () Bool)

(declare-fun e!401247 () Bool)

(assert (=> b!713344 (= e!401248 e!401247)))

(declare-fun res!476348 () Bool)

(assert (=> b!713344 (=> res!476348 e!401247)))

(declare-fun e!401245 () Bool)

(assert (=> b!713344 (= res!476348 e!401245)))

(declare-fun res!476350 () Bool)

(assert (=> b!713344 (=> (not res!476350) (not e!401245))))

(assert (=> b!713344 (= res!476350 (= (h!14346 acc!652) (h!14346 newAcc!49)))))

(declare-fun b!713346 () Bool)

(assert (=> b!713346 (= e!401247 (subseq!422 acc!652 (t!19606 newAcc!49)))))

(declare-fun b!713345 () Bool)

(assert (=> b!713345 (= e!401245 (subseq!422 (t!19606 acc!652) (t!19606 newAcc!49)))))

(declare-fun b!713343 () Bool)

(assert (=> b!713343 (= e!401246 e!401248)))

(declare-fun res!476349 () Bool)

(assert (=> b!713343 (=> (not res!476349) (not e!401248))))

(assert (=> b!713343 (= res!476349 ((_ is Cons!13298) newAcc!49))))

(assert (= (and d!98237 (not res!476351)) b!713343))

(assert (= (and b!713343 res!476349) b!713344))

(assert (= (and b!713344 res!476350) b!713345))

(assert (= (and b!713344 (not res!476348)) b!713346))

(declare-fun m!670663 () Bool)

(assert (=> b!713346 m!670663))

(declare-fun m!670665 () Bool)

(assert (=> b!713345 m!670665))

(assert (=> b!712985 d!98237))

(declare-fun d!98251 () Bool)

(declare-fun res!476354 () Bool)

(declare-fun e!401252 () Bool)

(assert (=> d!98251 (=> res!476354 e!401252)))

(assert (=> d!98251 (= res!476354 ((_ is Nil!13299) lt!318719))))

(assert (=> d!98251 (= (noDuplicate!1228 lt!318719) e!401252)))

(declare-fun b!713349 () Bool)

(declare-fun e!401253 () Bool)

(assert (=> b!713349 (= e!401252 e!401253)))

(declare-fun res!476355 () Bool)

(assert (=> b!713349 (=> (not res!476355) (not e!401253))))

(assert (=> b!713349 (= res!476355 (not (contains!3954 (t!19606 lt!318719) (h!14346 lt!318719))))))

(declare-fun b!713350 () Bool)

(assert (=> b!713350 (= e!401253 (noDuplicate!1228 (t!19606 lt!318719)))))

(assert (= (and d!98251 (not res!476354)) b!713349))

(assert (= (and b!713349 res!476355) b!713350))

(declare-fun m!670671 () Bool)

(assert (=> b!713349 m!670671))

(declare-fun m!670673 () Bool)

(assert (=> b!713350 m!670673))

(assert (=> b!712986 d!98251))

(declare-fun b!713364 () Bool)

(declare-fun e!401264 () List!13302)

(declare-fun call!34588 () List!13302)

(assert (=> b!713364 (= e!401264 call!34588)))

(declare-fun b!713365 () Bool)

(declare-fun e!401263 () List!13302)

(assert (=> b!713365 (= e!401263 e!401264)))

(declare-fun c!78872 () Bool)

(assert (=> b!713365 (= c!78872 (= k0!2824 (h!14346 newAcc!49)))))

(declare-fun d!98255 () Bool)

(declare-fun e!401262 () Bool)

(assert (=> d!98255 e!401262))

(declare-fun res!476359 () Bool)

(assert (=> d!98255 (=> (not res!476359) (not e!401262))))

(declare-fun lt!318769 () List!13302)

(assert (=> d!98255 (= res!476359 (<= (size!19766 lt!318769) (size!19766 newAcc!49)))))

(assert (=> d!98255 (= lt!318769 e!401263)))

(declare-fun c!78871 () Bool)

(assert (=> d!98255 (= c!78871 ((_ is Cons!13298) newAcc!49))))

(assert (=> d!98255 (= (-!386 newAcc!49 k0!2824) lt!318769)))

(declare-fun bm!34585 () Bool)

(assert (=> bm!34585 (= call!34588 (-!386 (t!19606 newAcc!49) k0!2824))))

(declare-fun b!713366 () Bool)

(assert (=> b!713366 (= e!401262 (= (content!362 lt!318769) ((_ map and) (content!362 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun b!713367 () Bool)

(assert (=> b!713367 (= e!401263 Nil!13299)))

(declare-fun b!713368 () Bool)

(assert (=> b!713368 (= e!401264 (Cons!13298 (h!14346 newAcc!49) call!34588))))

(assert (= (and d!98255 c!78871) b!713365))

(assert (= (and d!98255 (not c!78871)) b!713367))

(assert (= (and b!713365 c!78872) b!713364))

(assert (= (and b!713365 (not c!78872)) b!713368))

(assert (= (or b!713364 b!713368) bm!34585))

(assert (= (and d!98255 res!476359) b!713366))

(declare-fun m!670677 () Bool)

(assert (=> d!98255 m!670677))

(declare-fun m!670679 () Bool)

(assert (=> d!98255 m!670679))

(declare-fun m!670683 () Bool)

(assert (=> bm!34585 m!670683))

(declare-fun m!670685 () Bool)

(assert (=> b!713366 m!670685))

(assert (=> b!713366 m!670521))

(assert (=> b!713366 m!670565))

(assert (=> b!712987 d!98255))

(declare-fun d!98259 () Bool)

(declare-fun lt!318771 () Bool)

(assert (=> d!98259 (= lt!318771 (select (content!362 lt!318718) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401268 () Bool)

(assert (=> d!98259 (= lt!318771 e!401268)))

(declare-fun res!476363 () Bool)

(assert (=> d!98259 (=> (not res!476363) (not e!401268))))

(assert (=> d!98259 (= res!476363 ((_ is Cons!13298) lt!318718))))

(assert (=> d!98259 (= (contains!3954 lt!318718 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318771)))

(declare-fun b!713371 () Bool)

(declare-fun e!401267 () Bool)

(assert (=> b!713371 (= e!401268 e!401267)))

(declare-fun res!476362 () Bool)

(assert (=> b!713371 (=> res!476362 e!401267)))

(assert (=> b!713371 (= res!476362 (= (h!14346 lt!318718) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713372 () Bool)

(assert (=> b!713372 (= e!401267 (contains!3954 (t!19606 lt!318718) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98259 res!476363) b!713371))

(assert (= (and b!713371 (not res!476362)) b!713372))

(assert (=> d!98259 m!670631))

(declare-fun m!670691 () Bool)

(assert (=> d!98259 m!670691))

(declare-fun m!670695 () Bool)

(assert (=> b!713372 m!670695))

(assert (=> b!712988 d!98259))

(declare-fun d!98263 () Bool)

(declare-fun lt!318772 () Bool)

(assert (=> d!98263 (= lt!318772 (select (content!362 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401272 () Bool)

(assert (=> d!98263 (= lt!318772 e!401272)))

(declare-fun res!476367 () Bool)

(assert (=> d!98263 (=> (not res!476367) (not e!401272))))

(assert (=> d!98263 (= res!476367 ((_ is Cons!13298) acc!652))))

(assert (=> d!98263 (= (contains!3954 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318772)))

(declare-fun b!713375 () Bool)

(declare-fun e!401271 () Bool)

(assert (=> b!713375 (= e!401272 e!401271)))

(declare-fun res!476366 () Bool)

(assert (=> b!713375 (=> res!476366 e!401271)))

(assert (=> b!713375 (= res!476366 (= (h!14346 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713376 () Bool)

(assert (=> b!713376 (= e!401271 (contains!3954 (t!19606 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98263 res!476367) b!713375))

(assert (= (and b!713375 (not res!476366)) b!713376))

(assert (=> d!98263 m!670601))

(declare-fun m!670697 () Bool)

(assert (=> d!98263 m!670697))

(declare-fun m!670699 () Bool)

(assert (=> b!713376 m!670699))

(assert (=> b!712989 d!98263))

(declare-fun d!98265 () Bool)

(declare-fun lt!318773 () Bool)

(assert (=> d!98265 (= lt!318773 (select (content!362 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401274 () Bool)

(assert (=> d!98265 (= lt!318773 e!401274)))

(declare-fun res!476369 () Bool)

(assert (=> d!98265 (=> (not res!476369) (not e!401274))))

(assert (=> d!98265 (= res!476369 ((_ is Cons!13298) newAcc!49))))

(assert (=> d!98265 (= (contains!3954 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318773)))

(declare-fun b!713377 () Bool)

(declare-fun e!401273 () Bool)

(assert (=> b!713377 (= e!401274 e!401273)))

(declare-fun res!476368 () Bool)

(assert (=> b!713377 (=> res!476368 e!401273)))

(assert (=> b!713377 (= res!476368 (= (h!14346 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713378 () Bool)

(assert (=> b!713378 (= e!401273 (contains!3954 (t!19606 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98265 res!476369) b!713377))

(assert (= (and b!713377 (not res!476368)) b!713378))

(assert (=> d!98265 m!670521))

(declare-fun m!670701 () Bool)

(assert (=> d!98265 m!670701))

(declare-fun m!670703 () Bool)

(assert (=> b!713378 m!670703))

(assert (=> b!712990 d!98265))

(declare-fun d!98269 () Bool)

(declare-fun res!476370 () Bool)

(declare-fun e!401275 () Bool)

(assert (=> d!98269 (=> res!476370 e!401275)))

(assert (=> d!98269 (= res!476370 (= (select (arr!19354 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k0!2824))))

(assert (=> d!98269 (= (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!401275)))

(declare-fun b!713379 () Bool)

(declare-fun e!401276 () Bool)

(assert (=> b!713379 (= e!401275 e!401276)))

(declare-fun res!476371 () Bool)

(assert (=> b!713379 (=> (not res!476371) (not e!401276))))

(assert (=> b!713379 (= res!476371 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19763 a!3591)))))

(declare-fun b!713380 () Bool)

(assert (=> b!713380 (= e!401276 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98269 (not res!476370)) b!713379))

(assert (= (and b!713379 res!476371) b!713380))

(assert (=> d!98269 m!670535))

(declare-fun m!670705 () Bool)

(assert (=> b!713380 m!670705))

(assert (=> b!712991 d!98269))

(declare-fun d!98271 () Bool)

(declare-fun res!476372 () Bool)

(declare-fun e!401277 () Bool)

(assert (=> d!98271 (=> res!476372 e!401277)))

(assert (=> d!98271 (= res!476372 ((_ is Nil!13299) lt!318718))))

(assert (=> d!98271 (= (noDuplicate!1228 lt!318718) e!401277)))

(declare-fun b!713381 () Bool)

(declare-fun e!401278 () Bool)

(assert (=> b!713381 (= e!401277 e!401278)))

(declare-fun res!476373 () Bool)

(assert (=> b!713381 (=> (not res!476373) (not e!401278))))

(assert (=> b!713381 (= res!476373 (not (contains!3954 (t!19606 lt!318718) (h!14346 lt!318718))))))

(declare-fun b!713382 () Bool)

(assert (=> b!713382 (= e!401278 (noDuplicate!1228 (t!19606 lt!318718)))))

(assert (= (and d!98271 (not res!476372)) b!713381))

(assert (= (and b!713381 res!476373) b!713382))

(declare-fun m!670707 () Bool)

(assert (=> b!713381 m!670707))

(declare-fun m!670709 () Bool)

(assert (=> b!713382 m!670709))

(assert (=> b!712971 d!98271))

(declare-fun d!98273 () Bool)

(declare-fun lt!318774 () Bool)

(assert (=> d!98273 (= lt!318774 (select (content!362 lt!318718) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401280 () Bool)

(assert (=> d!98273 (= lt!318774 e!401280)))

(declare-fun res!476375 () Bool)

(assert (=> d!98273 (=> (not res!476375) (not e!401280))))

(assert (=> d!98273 (= res!476375 ((_ is Cons!13298) lt!318718))))

(assert (=> d!98273 (= (contains!3954 lt!318718 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318774)))

(declare-fun b!713383 () Bool)

(declare-fun e!401279 () Bool)

(assert (=> b!713383 (= e!401280 e!401279)))

(declare-fun res!476374 () Bool)

(assert (=> b!713383 (=> res!476374 e!401279)))

(assert (=> b!713383 (= res!476374 (= (h!14346 lt!318718) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713384 () Bool)

(assert (=> b!713384 (= e!401279 (contains!3954 (t!19606 lt!318718) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98273 res!476375) b!713383))

(assert (= (and b!713383 (not res!476374)) b!713384))

(assert (=> d!98273 m!670631))

(declare-fun m!670711 () Bool)

(assert (=> d!98273 m!670711))

(declare-fun m!670713 () Bool)

(assert (=> b!713384 m!670713))

(assert (=> b!712992 d!98273))

(declare-fun d!98275 () Bool)

(declare-fun res!476380 () Bool)

(declare-fun e!401285 () Bool)

(assert (=> d!98275 (=> res!476380 e!401285)))

(assert (=> d!98275 (= res!476380 ((_ is Nil!13299) lt!318718))))

(assert (=> d!98275 (= (subseq!422 lt!318718 lt!318719) e!401285)))

(declare-fun b!713391 () Bool)

(declare-fun e!401287 () Bool)

(declare-fun e!401286 () Bool)

(assert (=> b!713391 (= e!401287 e!401286)))

(declare-fun res!476377 () Bool)

(assert (=> b!713391 (=> res!476377 e!401286)))

(declare-fun e!401284 () Bool)

(assert (=> b!713391 (= res!476377 e!401284)))

(declare-fun res!476379 () Bool)

(assert (=> b!713391 (=> (not res!476379) (not e!401284))))

(assert (=> b!713391 (= res!476379 (= (h!14346 lt!318718) (h!14346 lt!318719)))))

(declare-fun b!713393 () Bool)

(assert (=> b!713393 (= e!401286 (subseq!422 lt!318718 (t!19606 lt!318719)))))

(declare-fun b!713392 () Bool)

(assert (=> b!713392 (= e!401284 (subseq!422 (t!19606 lt!318718) (t!19606 lt!318719)))))

(declare-fun b!713390 () Bool)

(assert (=> b!713390 (= e!401285 e!401287)))

(declare-fun res!476378 () Bool)

(assert (=> b!713390 (=> (not res!476378) (not e!401287))))

(assert (=> b!713390 (= res!476378 ((_ is Cons!13298) lt!318719))))

(assert (= (and d!98275 (not res!476380)) b!713390))

(assert (= (and b!713390 res!476378) b!713391))

(assert (= (and b!713391 res!476379) b!713392))

(assert (= (and b!713391 (not res!476377)) b!713393))

(declare-fun m!670723 () Bool)

(assert (=> b!713393 m!670723))

(declare-fun m!670727 () Bool)

(assert (=> b!713392 m!670727))

(assert (=> b!712993 d!98275))

(check-sat (not b!713366) (not d!98191) (not b!713393) (not b!713313) (not d!98177) (not b!713350) (not b!713298) (not b!713349) (not b!713384) (not b!713376) (not d!98179) (not d!98259) (not b!713181) (not bm!34569) (not b!713382) (not b!713201) (not b!713269) (not b!713203) (not d!98171) (not b!713179) (not b!713257) (not b!713256) (not b!713310) (not d!98265) (not b!713196) (not b!713345) (not b!713312) (not bm!34574) (not d!98263) (not bm!34582) (not b!713392) (not b!713303) (not d!98273) (not b!713380) (not b!713372) (not d!98235) (not d!98217) (not b!713232) (not d!98211) (not b!713297) (not b!713193) (not bm!34585) (not d!98227) (not b!713328) (not b!713281) (not b!713195) (not d!98255) (not bm!34570) (not d!98181) (not b!713200) (not b!713244) (not b!713381) (not b!713245) (not b!713238) (not b!713378) (not b!713242) (not d!98169) (not b!713346) (not b!713198) (not b!713299) (not bm!34573))
(check-sat)
