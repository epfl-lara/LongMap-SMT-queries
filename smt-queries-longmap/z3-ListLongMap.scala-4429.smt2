; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61608 () Bool)

(assert start!61608)

(declare-fun b!688267 () Bool)

(declare-fun res!452942 () Bool)

(declare-fun e!392080 () Bool)

(assert (=> b!688267 (=> (not res!452942) (not e!392080))))

(declare-datatypes ((array!39687 0))(
  ( (array!39688 (arr!19012 (Array (_ BitVec 32) (_ BitVec 64))) (size!19392 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39687)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12960 0))(
  ( (Nil!12957) (Cons!12956 (h!14004 (_ BitVec 64)) (t!19216 List!12960)) )
))
(declare-fun acc!681 () List!12960)

(declare-fun arrayNoDuplicates!0 (array!39687 (_ BitVec 32) List!12960) Bool)

(assert (=> b!688267 (= res!452942 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!688268 () Bool)

(declare-fun e!392081 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3612 (List!12960 (_ BitVec 64)) Bool)

(assert (=> b!688268 (= e!392081 (contains!3612 acc!681 k0!2843))))

(declare-fun b!688269 () Bool)

(declare-fun res!452932 () Bool)

(declare-fun e!392084 () Bool)

(assert (=> b!688269 (=> res!452932 e!392084)))

(declare-fun lt!315716 () List!12960)

(declare-fun noDuplicate!886 (List!12960) Bool)

(assert (=> b!688269 (= res!452932 (not (noDuplicate!886 lt!315716)))))

(declare-fun b!688270 () Bool)

(declare-fun e!392083 () Bool)

(assert (=> b!688270 (= e!392083 (contains!3612 lt!315716 k0!2843))))

(declare-fun b!688271 () Bool)

(assert (=> b!688271 (= e!392084 true)))

(declare-fun lt!315719 () Bool)

(declare-fun e!392079 () Bool)

(assert (=> b!688271 (= lt!315719 e!392079)))

(declare-fun res!452933 () Bool)

(assert (=> b!688271 (=> res!452933 e!392079)))

(assert (=> b!688271 (= res!452933 e!392083)))

(declare-fun res!452943 () Bool)

(assert (=> b!688271 (=> (not res!452943) (not e!392083))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!688271 (= res!452943 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688272 () Bool)

(declare-fun res!452936 () Bool)

(assert (=> b!688272 (=> (not res!452936) (not e!392080))))

(assert (=> b!688272 (= res!452936 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12957))))

(declare-fun b!688273 () Bool)

(declare-datatypes ((Unit!24231 0))(
  ( (Unit!24232) )
))
(declare-fun e!392077 () Unit!24231)

(declare-fun Unit!24233 () Unit!24231)

(assert (=> b!688273 (= e!392077 Unit!24233)))

(declare-fun b!688274 () Bool)

(declare-fun res!452924 () Bool)

(assert (=> b!688274 (=> (not res!452924) (not e!392080))))

(declare-fun arrayContainsKey!0 (array!39687 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!688274 (= res!452924 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun res!452926 () Bool)

(assert (=> start!61608 (=> (not res!452926) (not e!392080))))

(assert (=> start!61608 (= res!452926 (and (bvslt (size!19392 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19392 a!3626))))))

(assert (=> start!61608 e!392080))

(assert (=> start!61608 true))

(declare-fun array_inv!14871 (array!39687) Bool)

(assert (=> start!61608 (array_inv!14871 a!3626)))

(declare-fun b!688275 () Bool)

(declare-fun e!392075 () Bool)

(assert (=> b!688275 (= e!392075 (not (contains!3612 lt!315716 k0!2843)))))

(declare-fun b!688276 () Bool)

(declare-fun res!452934 () Bool)

(assert (=> b!688276 (=> (not res!452934) (not e!392080))))

(assert (=> b!688276 (= res!452934 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19392 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!688277 () Bool)

(declare-fun res!452937 () Bool)

(assert (=> b!688277 (=> (not res!452937) (not e!392080))))

(assert (=> b!688277 (= res!452937 (not (contains!3612 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688278 () Bool)

(declare-fun e!392082 () Bool)

(declare-fun e!392076 () Bool)

(assert (=> b!688278 (= e!392082 e!392076)))

(declare-fun res!452931 () Bool)

(assert (=> b!688278 (=> (not res!452931) (not e!392076))))

(assert (=> b!688278 (= res!452931 (bvsle from!3004 i!1382))))

(declare-fun b!688279 () Bool)

(declare-fun res!452941 () Bool)

(assert (=> b!688279 (=> (not res!452941) (not e!392080))))

(assert (=> b!688279 (= res!452941 (noDuplicate!886 acc!681))))

(declare-fun b!688280 () Bool)

(declare-fun res!452939 () Bool)

(assert (=> b!688280 (=> res!452939 e!392084)))

(assert (=> b!688280 (= res!452939 (contains!3612 lt!315716 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688281 () Bool)

(assert (=> b!688281 (= e!392080 (not e!392084))))

(declare-fun res!452927 () Bool)

(assert (=> b!688281 (=> res!452927 e!392084)))

(assert (=> b!688281 (= res!452927 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!688281 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315716)))

(declare-fun lt!315721 () Unit!24231)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39687 (_ BitVec 64) (_ BitVec 32) List!12960 List!12960) Unit!24231)

(assert (=> b!688281 (= lt!315721 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315716))))

(declare-fun -!185 (List!12960 (_ BitVec 64)) List!12960)

(assert (=> b!688281 (= (-!185 lt!315716 k0!2843) acc!681)))

(declare-fun $colon$colon!383 (List!12960 (_ BitVec 64)) List!12960)

(assert (=> b!688281 (= lt!315716 ($colon$colon!383 acc!681 k0!2843))))

(declare-fun lt!315720 () Unit!24231)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12960) Unit!24231)

(assert (=> b!688281 (= lt!315720 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!221 (List!12960 List!12960) Bool)

(assert (=> b!688281 (subseq!221 acc!681 acc!681)))

(declare-fun lt!315713 () Unit!24231)

(declare-fun lemmaListSubSeqRefl!0 (List!12960) Unit!24231)

(assert (=> b!688281 (= lt!315713 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!688281 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315712 () Unit!24231)

(declare-fun e!392078 () Unit!24231)

(assert (=> b!688281 (= lt!315712 e!392078)))

(declare-fun c!78041 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!688281 (= c!78041 (validKeyInArray!0 (select (arr!19012 a!3626) from!3004)))))

(declare-fun lt!315718 () Unit!24231)

(assert (=> b!688281 (= lt!315718 e!392077)))

(declare-fun c!78040 () Bool)

(assert (=> b!688281 (= c!78040 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688281 (arrayContainsKey!0 (array!39688 (store (arr!19012 a!3626) i!1382 k0!2843) (size!19392 a!3626)) k0!2843 from!3004)))

(declare-fun b!688282 () Bool)

(assert (=> b!688282 (= e!392076 (not (contains!3612 acc!681 k0!2843)))))

(declare-fun b!688283 () Bool)

(declare-fun res!452925 () Bool)

(assert (=> b!688283 (=> res!452925 e!392084)))

(assert (=> b!688283 (= res!452925 (contains!3612 lt!315716 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688284 () Bool)

(declare-fun res!452929 () Bool)

(assert (=> b!688284 (=> (not res!452929) (not e!392080))))

(assert (=> b!688284 (= res!452929 e!392082)))

(declare-fun res!452930 () Bool)

(assert (=> b!688284 (=> res!452930 e!392082)))

(assert (=> b!688284 (= res!452930 e!392081)))

(declare-fun res!452944 () Bool)

(assert (=> b!688284 (=> (not res!452944) (not e!392081))))

(assert (=> b!688284 (= res!452944 (bvsgt from!3004 i!1382))))

(declare-fun b!688285 () Bool)

(declare-fun res!452928 () Bool)

(assert (=> b!688285 (=> (not res!452928) (not e!392080))))

(assert (=> b!688285 (= res!452928 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19392 a!3626))))))

(declare-fun b!688286 () Bool)

(declare-fun res!452938 () Bool)

(assert (=> b!688286 (=> (not res!452938) (not e!392080))))

(assert (=> b!688286 (= res!452938 (not (contains!3612 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688287 () Bool)

(declare-fun Unit!24234 () Unit!24231)

(assert (=> b!688287 (= e!392078 Unit!24234)))

(declare-fun b!688288 () Bool)

(declare-fun Unit!24235 () Unit!24231)

(assert (=> b!688288 (= e!392077 Unit!24235)))

(declare-fun lt!315715 () Unit!24231)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39687 (_ BitVec 64) (_ BitVec 32)) Unit!24231)

(assert (=> b!688288 (= lt!315715 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!688288 false))

(declare-fun b!688289 () Bool)

(declare-fun lt!315714 () Unit!24231)

(assert (=> b!688289 (= e!392078 lt!315714)))

(declare-fun lt!315717 () Unit!24231)

(assert (=> b!688289 (= lt!315717 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!688289 (subseq!221 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39687 List!12960 List!12960 (_ BitVec 32)) Unit!24231)

(assert (=> b!688289 (= lt!315714 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!383 acc!681 (select (arr!19012 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688289 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!688290 () Bool)

(assert (=> b!688290 (= e!392079 e!392075)))

(declare-fun res!452940 () Bool)

(assert (=> b!688290 (=> (not res!452940) (not e!392075))))

(assert (=> b!688290 (= res!452940 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688291 () Bool)

(declare-fun res!452935 () Bool)

(assert (=> b!688291 (=> (not res!452935) (not e!392080))))

(assert (=> b!688291 (= res!452935 (validKeyInArray!0 k0!2843))))

(assert (= (and start!61608 res!452926) b!688279))

(assert (= (and b!688279 res!452941) b!688277))

(assert (= (and b!688277 res!452937) b!688286))

(assert (= (and b!688286 res!452938) b!688284))

(assert (= (and b!688284 res!452944) b!688268))

(assert (= (and b!688284 (not res!452930)) b!688278))

(assert (= (and b!688278 res!452931) b!688282))

(assert (= (and b!688284 res!452929) b!688272))

(assert (= (and b!688272 res!452936) b!688267))

(assert (= (and b!688267 res!452942) b!688285))

(assert (= (and b!688285 res!452928) b!688291))

(assert (= (and b!688291 res!452935) b!688274))

(assert (= (and b!688274 res!452924) b!688276))

(assert (= (and b!688276 res!452934) b!688281))

(assert (= (and b!688281 c!78040) b!688288))

(assert (= (and b!688281 (not c!78040)) b!688273))

(assert (= (and b!688281 c!78041) b!688289))

(assert (= (and b!688281 (not c!78041)) b!688287))

(assert (= (and b!688281 (not res!452927)) b!688269))

(assert (= (and b!688269 (not res!452932)) b!688280))

(assert (= (and b!688280 (not res!452939)) b!688283))

(assert (= (and b!688283 (not res!452925)) b!688271))

(assert (= (and b!688271 res!452943) b!688270))

(assert (= (and b!688271 (not res!452933)) b!688290))

(assert (= (and b!688290 res!452940) b!688275))

(declare-fun m!652723 () Bool)

(assert (=> b!688274 m!652723))

(declare-fun m!652725 () Bool)

(assert (=> b!688288 m!652725))

(declare-fun m!652727 () Bool)

(assert (=> b!688280 m!652727))

(declare-fun m!652729 () Bool)

(assert (=> b!688272 m!652729))

(declare-fun m!652731 () Bool)

(assert (=> b!688267 m!652731))

(declare-fun m!652733 () Bool)

(assert (=> b!688268 m!652733))

(declare-fun m!652735 () Bool)

(assert (=> b!688270 m!652735))

(declare-fun m!652737 () Bool)

(assert (=> start!61608 m!652737))

(declare-fun m!652739 () Bool)

(assert (=> b!688289 m!652739))

(declare-fun m!652741 () Bool)

(assert (=> b!688289 m!652741))

(declare-fun m!652743 () Bool)

(assert (=> b!688289 m!652743))

(declare-fun m!652745 () Bool)

(assert (=> b!688289 m!652745))

(assert (=> b!688289 m!652741))

(assert (=> b!688289 m!652743))

(declare-fun m!652747 () Bool)

(assert (=> b!688289 m!652747))

(declare-fun m!652749 () Bool)

(assert (=> b!688289 m!652749))

(declare-fun m!652751 () Bool)

(assert (=> b!688281 m!652751))

(assert (=> b!688281 m!652739))

(assert (=> b!688281 m!652741))

(declare-fun m!652753 () Bool)

(assert (=> b!688281 m!652753))

(declare-fun m!652755 () Bool)

(assert (=> b!688281 m!652755))

(declare-fun m!652757 () Bool)

(assert (=> b!688281 m!652757))

(declare-fun m!652759 () Bool)

(assert (=> b!688281 m!652759))

(assert (=> b!688281 m!652747))

(declare-fun m!652761 () Bool)

(assert (=> b!688281 m!652761))

(declare-fun m!652763 () Bool)

(assert (=> b!688281 m!652763))

(assert (=> b!688281 m!652741))

(declare-fun m!652765 () Bool)

(assert (=> b!688281 m!652765))

(declare-fun m!652767 () Bool)

(assert (=> b!688281 m!652767))

(assert (=> b!688281 m!652749))

(declare-fun m!652769 () Bool)

(assert (=> b!688269 m!652769))

(assert (=> b!688275 m!652735))

(declare-fun m!652771 () Bool)

(assert (=> b!688279 m!652771))

(declare-fun m!652773 () Bool)

(assert (=> b!688283 m!652773))

(declare-fun m!652775 () Bool)

(assert (=> b!688286 m!652775))

(declare-fun m!652777 () Bool)

(assert (=> b!688277 m!652777))

(declare-fun m!652779 () Bool)

(assert (=> b!688291 m!652779))

(assert (=> b!688282 m!652733))

(check-sat (not b!688275) (not b!688270) (not b!688267) (not b!688274) (not b!688289) (not b!688277) (not b!688269) (not b!688281) (not b!688280) (not start!61608) (not b!688282) (not b!688283) (not b!688272) (not b!688268) (not b!688291) (not b!688286) (not b!688279) (not b!688288))
(check-sat)
