; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61556 () Bool)

(assert start!61556)

(declare-fun b!688268 () Bool)

(declare-fun e!392033 () Bool)

(declare-fun e!392039 () Bool)

(assert (=> b!688268 (= e!392033 e!392039)))

(declare-fun res!453007 () Bool)

(assert (=> b!688268 (=> (not res!453007) (not e!392039))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!688268 (= res!453007 (bvsle from!3004 i!1382))))

(declare-fun b!688269 () Bool)

(declare-fun res!453020 () Bool)

(declare-fun e!392040 () Bool)

(assert (=> b!688269 (=> res!453020 e!392040)))

(declare-datatypes ((List!13061 0))(
  ( (Nil!13058) (Cons!13057 (h!14102 (_ BitVec 64)) (t!19325 List!13061)) )
))
(declare-fun lt!315701 () List!13061)

(declare-fun contains!3638 (List!13061 (_ BitVec 64)) Bool)

(assert (=> b!688269 (= res!453020 (contains!3638 lt!315701 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688270 () Bool)

(declare-fun e!392036 () Bool)

(assert (=> b!688270 (= e!392036 (not e!392040))))

(declare-fun res!453008 () Bool)

(assert (=> b!688270 (=> res!453008 e!392040)))

(assert (=> b!688270 (= res!453008 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39697 0))(
  ( (array!39698 (arr!19020 (Array (_ BitVec 32) (_ BitVec 64))) (size!19402 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39697)

(declare-fun arrayNoDuplicates!0 (array!39697 (_ BitVec 32) List!13061) Bool)

(assert (=> b!688270 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315701)))

(declare-datatypes ((Unit!24267 0))(
  ( (Unit!24268) )
))
(declare-fun lt!315702 () Unit!24267)

(declare-fun acc!681 () List!13061)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39697 (_ BitVec 64) (_ BitVec 32) List!13061 List!13061) Unit!24267)

(assert (=> b!688270 (= lt!315702 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315701))))

(declare-fun -!189 (List!13061 (_ BitVec 64)) List!13061)

(assert (=> b!688270 (= (-!189 lt!315701 k!2843) acc!681)))

(declare-fun $colon$colon!389 (List!13061 (_ BitVec 64)) List!13061)

(assert (=> b!688270 (= lt!315701 ($colon$colon!389 acc!681 k!2843))))

(declare-fun lt!315708 () Unit!24267)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13061) Unit!24267)

(assert (=> b!688270 (= lt!315708 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!224 (List!13061 List!13061) Bool)

(assert (=> b!688270 (subseq!224 acc!681 acc!681)))

(declare-fun lt!315700 () Unit!24267)

(declare-fun lemmaListSubSeqRefl!0 (List!13061) Unit!24267)

(assert (=> b!688270 (= lt!315700 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!688270 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315706 () Unit!24267)

(declare-fun e!392042 () Unit!24267)

(assert (=> b!688270 (= lt!315706 e!392042)))

(declare-fun c!78001 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!688270 (= c!78001 (validKeyInArray!0 (select (arr!19020 a!3626) from!3004)))))

(declare-fun lt!315707 () Unit!24267)

(declare-fun e!392035 () Unit!24267)

(assert (=> b!688270 (= lt!315707 e!392035)))

(declare-fun c!78002 () Bool)

(declare-fun arrayContainsKey!0 (array!39697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!688270 (= c!78002 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688270 (arrayContainsKey!0 (array!39698 (store (arr!19020 a!3626) i!1382 k!2843) (size!19402 a!3626)) k!2843 from!3004)))

(declare-fun b!688271 () Bool)

(declare-fun Unit!24269 () Unit!24267)

(assert (=> b!688271 (= e!392042 Unit!24269)))

(declare-fun b!688272 () Bool)

(declare-fun e!392041 () Bool)

(declare-fun e!392037 () Bool)

(assert (=> b!688272 (= e!392041 e!392037)))

(declare-fun res!453001 () Bool)

(assert (=> b!688272 (=> (not res!453001) (not e!392037))))

(assert (=> b!688272 (= res!453001 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688273 () Bool)

(declare-fun res!453016 () Bool)

(assert (=> b!688273 (=> (not res!453016) (not e!392036))))

(declare-fun noDuplicate!885 (List!13061) Bool)

(assert (=> b!688273 (= res!453016 (noDuplicate!885 acc!681))))

(declare-fun b!688275 () Bool)

(declare-fun res!453014 () Bool)

(assert (=> b!688275 (=> (not res!453014) (not e!392036))))

(assert (=> b!688275 (= res!453014 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19402 a!3626))))))

(declare-fun b!688276 () Bool)

(declare-fun res!453019 () Bool)

(assert (=> b!688276 (=> (not res!453019) (not e!392036))))

(assert (=> b!688276 (= res!453019 (not (contains!3638 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688277 () Bool)

(declare-fun Unit!24270 () Unit!24267)

(assert (=> b!688277 (= e!392035 Unit!24270)))

(declare-fun b!688278 () Bool)

(declare-fun lt!315703 () Unit!24267)

(assert (=> b!688278 (= e!392042 lt!315703)))

(declare-fun lt!315704 () Unit!24267)

(assert (=> b!688278 (= lt!315704 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!688278 (subseq!224 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39697 List!13061 List!13061 (_ BitVec 32)) Unit!24267)

(assert (=> b!688278 (= lt!315703 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!389 acc!681 (select (arr!19020 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688278 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!688279 () Bool)

(declare-fun res!453002 () Bool)

(assert (=> b!688279 (=> (not res!453002) (not e!392036))))

(assert (=> b!688279 (= res!453002 e!392033)))

(declare-fun res!453000 () Bool)

(assert (=> b!688279 (=> res!453000 e!392033)))

(declare-fun e!392038 () Bool)

(assert (=> b!688279 (= res!453000 e!392038)))

(declare-fun res!453013 () Bool)

(assert (=> b!688279 (=> (not res!453013) (not e!392038))))

(assert (=> b!688279 (= res!453013 (bvsgt from!3004 i!1382))))

(declare-fun b!688280 () Bool)

(declare-fun res!453006 () Bool)

(assert (=> b!688280 (=> (not res!453006) (not e!392036))))

(assert (=> b!688280 (= res!453006 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13058))))

(declare-fun b!688281 () Bool)

(declare-fun res!453012 () Bool)

(assert (=> b!688281 (=> res!453012 e!392040)))

(assert (=> b!688281 (= res!453012 (contains!3638 lt!315701 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688282 () Bool)

(declare-fun res!453005 () Bool)

(assert (=> b!688282 (=> (not res!453005) (not e!392036))))

(assert (=> b!688282 (= res!453005 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!688283 () Bool)

(declare-fun res!453017 () Bool)

(assert (=> b!688283 (=> (not res!453017) (not e!392036))))

(assert (=> b!688283 (= res!453017 (validKeyInArray!0 k!2843))))

(declare-fun res!453018 () Bool)

(assert (=> start!61556 (=> (not res!453018) (not e!392036))))

(assert (=> start!61556 (= res!453018 (and (bvslt (size!19402 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19402 a!3626))))))

(assert (=> start!61556 e!392036))

(assert (=> start!61556 true))

(declare-fun array_inv!14816 (array!39697) Bool)

(assert (=> start!61556 (array_inv!14816 a!3626)))

(declare-fun b!688274 () Bool)

(declare-fun e!392034 () Bool)

(assert (=> b!688274 (= e!392034 (contains!3638 lt!315701 k!2843))))

(declare-fun b!688284 () Bool)

(assert (=> b!688284 (= e!392037 (not (contains!3638 lt!315701 k!2843)))))

(declare-fun b!688285 () Bool)

(declare-fun res!453003 () Bool)

(assert (=> b!688285 (=> res!453003 e!392040)))

(assert (=> b!688285 (= res!453003 (not (noDuplicate!885 lt!315701)))))

(declare-fun b!688286 () Bool)

(declare-fun res!453010 () Bool)

(assert (=> b!688286 (=> (not res!453010) (not e!392036))))

(assert (=> b!688286 (= res!453010 (not (contains!3638 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688287 () Bool)

(assert (=> b!688287 (= e!392039 (not (contains!3638 acc!681 k!2843)))))

(declare-fun b!688288 () Bool)

(declare-fun res!453009 () Bool)

(assert (=> b!688288 (=> (not res!453009) (not e!392036))))

(assert (=> b!688288 (= res!453009 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19402 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!688289 () Bool)

(assert (=> b!688289 (= e!392038 (contains!3638 acc!681 k!2843))))

(declare-fun b!688290 () Bool)

(declare-fun res!453015 () Bool)

(assert (=> b!688290 (=> (not res!453015) (not e!392036))))

(assert (=> b!688290 (= res!453015 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!688291 () Bool)

(assert (=> b!688291 (= e!392040 true)))

(declare-fun lt!315709 () Bool)

(assert (=> b!688291 (= lt!315709 e!392041)))

(declare-fun res!453011 () Bool)

(assert (=> b!688291 (=> res!453011 e!392041)))

(assert (=> b!688291 (= res!453011 e!392034)))

(declare-fun res!453004 () Bool)

(assert (=> b!688291 (=> (not res!453004) (not e!392034))))

(assert (=> b!688291 (= res!453004 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688292 () Bool)

(declare-fun Unit!24271 () Unit!24267)

(assert (=> b!688292 (= e!392035 Unit!24271)))

(declare-fun lt!315705 () Unit!24267)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39697 (_ BitVec 64) (_ BitVec 32)) Unit!24267)

(assert (=> b!688292 (= lt!315705 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!688292 false))

(assert (= (and start!61556 res!453018) b!688273))

(assert (= (and b!688273 res!453016) b!688276))

(assert (= (and b!688276 res!453019) b!688286))

(assert (= (and b!688286 res!453010) b!688279))

(assert (= (and b!688279 res!453013) b!688289))

(assert (= (and b!688279 (not res!453000)) b!688268))

(assert (= (and b!688268 res!453007) b!688287))

(assert (= (and b!688279 res!453002) b!688280))

(assert (= (and b!688280 res!453006) b!688290))

(assert (= (and b!688290 res!453015) b!688275))

(assert (= (and b!688275 res!453014) b!688283))

(assert (= (and b!688283 res!453017) b!688282))

(assert (= (and b!688282 res!453005) b!688288))

(assert (= (and b!688288 res!453009) b!688270))

(assert (= (and b!688270 c!78002) b!688292))

(assert (= (and b!688270 (not c!78002)) b!688277))

(assert (= (and b!688270 c!78001) b!688278))

(assert (= (and b!688270 (not c!78001)) b!688271))

(assert (= (and b!688270 (not res!453008)) b!688285))

(assert (= (and b!688285 (not res!453003)) b!688269))

(assert (= (and b!688269 (not res!453020)) b!688281))

(assert (= (and b!688281 (not res!453012)) b!688291))

(assert (= (and b!688291 res!453004) b!688274))

(assert (= (and b!688291 (not res!453011)) b!688272))

(assert (= (and b!688272 res!453001) b!688284))

(declare-fun m!652199 () Bool)

(assert (=> b!688274 m!652199))

(declare-fun m!652201 () Bool)

(assert (=> start!61556 m!652201))

(declare-fun m!652203 () Bool)

(assert (=> b!688283 m!652203))

(declare-fun m!652205 () Bool)

(assert (=> b!688292 m!652205))

(declare-fun m!652207 () Bool)

(assert (=> b!688269 m!652207))

(declare-fun m!652209 () Bool)

(assert (=> b!688290 m!652209))

(declare-fun m!652211 () Bool)

(assert (=> b!688280 m!652211))

(declare-fun m!652213 () Bool)

(assert (=> b!688287 m!652213))

(declare-fun m!652215 () Bool)

(assert (=> b!688270 m!652215))

(declare-fun m!652217 () Bool)

(assert (=> b!688270 m!652217))

(declare-fun m!652219 () Bool)

(assert (=> b!688270 m!652219))

(declare-fun m!652221 () Bool)

(assert (=> b!688270 m!652221))

(declare-fun m!652223 () Bool)

(assert (=> b!688270 m!652223))

(declare-fun m!652225 () Bool)

(assert (=> b!688270 m!652225))

(declare-fun m!652227 () Bool)

(assert (=> b!688270 m!652227))

(declare-fun m!652229 () Bool)

(assert (=> b!688270 m!652229))

(declare-fun m!652231 () Bool)

(assert (=> b!688270 m!652231))

(declare-fun m!652233 () Bool)

(assert (=> b!688270 m!652233))

(assert (=> b!688270 m!652219))

(declare-fun m!652235 () Bool)

(assert (=> b!688270 m!652235))

(declare-fun m!652237 () Bool)

(assert (=> b!688270 m!652237))

(declare-fun m!652239 () Bool)

(assert (=> b!688270 m!652239))

(declare-fun m!652241 () Bool)

(assert (=> b!688276 m!652241))

(declare-fun m!652243 () Bool)

(assert (=> b!688282 m!652243))

(assert (=> b!688278 m!652217))

(assert (=> b!688278 m!652219))

(declare-fun m!652245 () Bool)

(assert (=> b!688278 m!652245))

(declare-fun m!652247 () Bool)

(assert (=> b!688278 m!652247))

(assert (=> b!688278 m!652219))

(assert (=> b!688278 m!652245))

(assert (=> b!688278 m!652229))

(assert (=> b!688278 m!652239))

(declare-fun m!652249 () Bool)

(assert (=> b!688285 m!652249))

(declare-fun m!652251 () Bool)

(assert (=> b!688286 m!652251))

(assert (=> b!688289 m!652213))

(assert (=> b!688284 m!652199))

(declare-fun m!652253 () Bool)

(assert (=> b!688281 m!652253))

(declare-fun m!652255 () Bool)

(assert (=> b!688273 m!652255))

(push 1)

(assert (not b!688274))

(assert (not b!688270))

(assert (not b!688282))

(assert (not b!688276))

(assert (not b!688285))

(assert (not b!688290))

(assert (not b!688289))

(assert (not b!688287))

(assert (not start!61556))

(assert (not b!688269))

(assert (not b!688283))

(assert (not b!688286))

(assert (not b!688280))

(assert (not b!688284))

(assert (not b!688278))

(assert (not b!688292))

(assert (not b!688273))

(assert (not b!688281))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

