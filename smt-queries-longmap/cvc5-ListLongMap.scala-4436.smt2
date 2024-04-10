; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61592 () Bool)

(assert start!61592)

(declare-fun b!689638 () Bool)

(declare-fun e!392634 () Bool)

(declare-datatypes ((List!13079 0))(
  ( (Nil!13076) (Cons!13075 (h!14120 (_ BitVec 64)) (t!19343 List!13079)) )
))
(declare-fun acc!681 () List!13079)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3656 (List!13079 (_ BitVec 64)) Bool)

(assert (=> b!689638 (= e!392634 (not (contains!3656 acc!681 k!2843)))))

(declare-fun b!689639 () Bool)

(declare-fun res!454157 () Bool)

(declare-fun e!392633 () Bool)

(assert (=> b!689639 (=> (not res!454157) (not e!392633))))

(assert (=> b!689639 (= res!454157 (not (contains!3656 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((array!39733 0))(
  ( (array!39734 (arr!19038 (Array (_ BitVec 32) (_ BitVec 64))) (size!19420 (_ BitVec 32))) )
))
(declare-fun lt!316249 () array!39733)

(declare-fun e!392637 () Bool)

(declare-fun b!689640 () Bool)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39733 (_ BitVec 32) List!13079) Bool)

(assert (=> b!689640 (= e!392637 (arrayNoDuplicates!0 lt!316249 from!3004 acc!681))))

(declare-fun lt!316247 () List!13079)

(assert (=> b!689640 (arrayNoDuplicates!0 lt!316249 (bvadd #b00000000000000000000000000000001 from!3004) lt!316247)))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((Unit!24357 0))(
  ( (Unit!24358) )
))
(declare-fun lt!316250 () Unit!24357)

(declare-fun a!3626 () array!39733)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39733 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13079) Unit!24357)

(assert (=> b!689640 (= lt!316250 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!316247))))

(declare-fun b!689641 () Bool)

(declare-fun res!454173 () Bool)

(assert (=> b!689641 (=> (not res!454173) (not e!392633))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!689641 (= res!454173 (validKeyInArray!0 k!2843))))

(declare-fun b!689642 () Bool)

(declare-fun res!454154 () Bool)

(assert (=> b!689642 (=> (not res!454154) (not e!392633))))

(assert (=> b!689642 (= res!454154 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!689643 () Bool)

(declare-fun e!392636 () Bool)

(assert (=> b!689643 (= e!392636 (contains!3656 lt!316247 k!2843))))

(declare-fun b!689644 () Bool)

(declare-fun e!392627 () Bool)

(assert (=> b!689644 (= e!392627 e!392636)))

(declare-fun res!454172 () Bool)

(assert (=> b!689644 (=> res!454172 e!392636)))

(assert (=> b!689644 (= res!454172 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!689645 () Bool)

(declare-fun res!454155 () Bool)

(assert (=> b!689645 (=> (not res!454155) (not e!392633))))

(assert (=> b!689645 (= res!454155 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19420 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!689646 () Bool)

(declare-fun e!392629 () Bool)

(assert (=> b!689646 (= e!392629 e!392634)))

(declare-fun res!454158 () Bool)

(assert (=> b!689646 (=> (not res!454158) (not e!392634))))

(assert (=> b!689646 (= res!454158 (bvsle from!3004 i!1382))))

(declare-fun b!689647 () Bool)

(declare-fun res!454169 () Bool)

(assert (=> b!689647 (=> (not res!454169) (not e!392633))))

(declare-fun noDuplicate!903 (List!13079) Bool)

(assert (=> b!689647 (= res!454169 (noDuplicate!903 acc!681))))

(declare-fun b!689648 () Bool)

(declare-fun e!392631 () Bool)

(assert (=> b!689648 (= e!392631 (contains!3656 acc!681 k!2843))))

(declare-fun b!689649 () Bool)

(declare-fun res!454159 () Bool)

(assert (=> b!689649 (=> res!454159 e!392637)))

(assert (=> b!689649 (= res!454159 e!392627)))

(declare-fun res!454162 () Bool)

(assert (=> b!689649 (=> (not res!454162) (not e!392627))))

(declare-fun e!392635 () Bool)

(assert (=> b!689649 (= res!454162 e!392635)))

(declare-fun res!454168 () Bool)

(assert (=> b!689649 (=> res!454168 e!392635)))

(assert (=> b!689649 (= res!454168 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!689650 () Bool)

(declare-fun res!454170 () Bool)

(assert (=> b!689650 (=> (not res!454170) (not e!392633))))

(assert (=> b!689650 (= res!454170 (not (contains!3656 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689651 () Bool)

(declare-fun e!392632 () Unit!24357)

(declare-fun Unit!24359 () Unit!24357)

(assert (=> b!689651 (= e!392632 Unit!24359)))

(declare-fun b!689652 () Bool)

(declare-fun e!392630 () Unit!24357)

(declare-fun Unit!24360 () Unit!24357)

(assert (=> b!689652 (= e!392630 Unit!24360)))

(declare-fun b!689653 () Bool)

(declare-fun res!454175 () Bool)

(assert (=> b!689653 (=> (not res!454175) (not e!392633))))

(assert (=> b!689653 (= res!454175 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19420 a!3626))))))

(declare-fun b!689654 () Bool)

(declare-fun res!454164 () Bool)

(assert (=> b!689654 (=> (not res!454164) (not e!392633))))

(declare-fun arrayContainsKey!0 (array!39733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!689654 (= res!454164 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!689655 () Bool)

(declare-fun res!454171 () Bool)

(assert (=> b!689655 (=> res!454171 e!392637)))

(assert (=> b!689655 (= res!454171 (not (noDuplicate!903 lt!316247)))))

(declare-fun b!689656 () Bool)

(declare-fun Unit!24361 () Unit!24357)

(assert (=> b!689656 (= e!392632 Unit!24361)))

(declare-fun lt!316252 () Unit!24357)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39733 (_ BitVec 64) (_ BitVec 32)) Unit!24357)

(assert (=> b!689656 (= lt!316252 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!689656 false))

(declare-fun b!689657 () Bool)

(declare-fun res!454165 () Bool)

(assert (=> b!689657 (=> (not res!454165) (not e!392633))))

(assert (=> b!689657 (= res!454165 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13076))))

(declare-fun b!689658 () Bool)

(declare-fun res!454174 () Bool)

(assert (=> b!689658 (=> res!454174 e!392637)))

(assert (=> b!689658 (= res!454174 (contains!3656 lt!316247 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689659 () Bool)

(declare-fun res!454156 () Bool)

(assert (=> b!689659 (=> res!454156 e!392637)))

(assert (=> b!689659 (= res!454156 (contains!3656 lt!316247 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689660 () Bool)

(assert (=> b!689660 (= e!392633 (not e!392637))))

(declare-fun res!454160 () Bool)

(assert (=> b!689660 (=> res!454160 e!392637)))

(assert (=> b!689660 (= res!454160 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!689660 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316247)))

(declare-fun lt!316245 () Unit!24357)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39733 (_ BitVec 64) (_ BitVec 32) List!13079 List!13079) Unit!24357)

(assert (=> b!689660 (= lt!316245 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!316247))))

(declare-fun -!207 (List!13079 (_ BitVec 64)) List!13079)

(assert (=> b!689660 (= (-!207 lt!316247 k!2843) acc!681)))

(declare-fun $colon$colon!407 (List!13079 (_ BitVec 64)) List!13079)

(assert (=> b!689660 (= lt!316247 ($colon$colon!407 acc!681 k!2843))))

(declare-fun lt!316248 () Unit!24357)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13079) Unit!24357)

(assert (=> b!689660 (= lt!316248 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!242 (List!13079 List!13079) Bool)

(assert (=> b!689660 (subseq!242 acc!681 acc!681)))

(declare-fun lt!316246 () Unit!24357)

(declare-fun lemmaListSubSeqRefl!0 (List!13079) Unit!24357)

(assert (=> b!689660 (= lt!316246 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!689660 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!316242 () Unit!24357)

(assert (=> b!689660 (= lt!316242 e!392630)))

(declare-fun c!78110 () Bool)

(assert (=> b!689660 (= c!78110 (validKeyInArray!0 (select (arr!19038 a!3626) from!3004)))))

(declare-fun lt!316243 () Unit!24357)

(assert (=> b!689660 (= lt!316243 e!392632)))

(declare-fun c!78109 () Bool)

(assert (=> b!689660 (= c!78109 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!689660 (arrayContainsKey!0 lt!316249 k!2843 from!3004)))

(assert (=> b!689660 (= lt!316249 (array!39734 (store (arr!19038 a!3626) i!1382 k!2843) (size!19420 a!3626)))))

(declare-fun b!689661 () Bool)

(declare-fun lt!316251 () Unit!24357)

(assert (=> b!689661 (= e!392630 lt!316251)))

(declare-fun lt!316244 () Unit!24357)

(assert (=> b!689661 (= lt!316244 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!689661 (subseq!242 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39733 List!13079 List!13079 (_ BitVec 32)) Unit!24357)

(assert (=> b!689661 (= lt!316251 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!407 acc!681 (select (arr!19038 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!689661 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun res!454161 () Bool)

(assert (=> start!61592 (=> (not res!454161) (not e!392633))))

(assert (=> start!61592 (= res!454161 (and (bvslt (size!19420 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19420 a!3626))))))

(assert (=> start!61592 e!392633))

(assert (=> start!61592 true))

(declare-fun array_inv!14834 (array!39733) Bool)

(assert (=> start!61592 (array_inv!14834 a!3626)))

(declare-fun b!689662 () Bool)

(assert (=> b!689662 (= e!392635 (not (contains!3656 lt!316247 k!2843)))))

(declare-fun b!689663 () Bool)

(declare-fun res!454166 () Bool)

(assert (=> b!689663 (=> (not res!454166) (not e!392633))))

(assert (=> b!689663 (= res!454166 e!392629)))

(declare-fun res!454163 () Bool)

(assert (=> b!689663 (=> res!454163 e!392629)))

(assert (=> b!689663 (= res!454163 e!392631)))

(declare-fun res!454167 () Bool)

(assert (=> b!689663 (=> (not res!454167) (not e!392631))))

(assert (=> b!689663 (= res!454167 (bvsgt from!3004 i!1382))))

(assert (= (and start!61592 res!454161) b!689647))

(assert (= (and b!689647 res!454169) b!689650))

(assert (= (and b!689650 res!454170) b!689639))

(assert (= (and b!689639 res!454157) b!689663))

(assert (= (and b!689663 res!454167) b!689648))

(assert (= (and b!689663 (not res!454163)) b!689646))

(assert (= (and b!689646 res!454158) b!689638))

(assert (= (and b!689663 res!454166) b!689657))

(assert (= (and b!689657 res!454165) b!689642))

(assert (= (and b!689642 res!454154) b!689653))

(assert (= (and b!689653 res!454175) b!689641))

(assert (= (and b!689641 res!454173) b!689654))

(assert (= (and b!689654 res!454164) b!689645))

(assert (= (and b!689645 res!454155) b!689660))

(assert (= (and b!689660 c!78109) b!689656))

(assert (= (and b!689660 (not c!78109)) b!689651))

(assert (= (and b!689660 c!78110) b!689661))

(assert (= (and b!689660 (not c!78110)) b!689652))

(assert (= (and b!689660 (not res!454160)) b!689655))

(assert (= (and b!689655 (not res!454171)) b!689658))

(assert (= (and b!689658 (not res!454174)) b!689659))

(assert (= (and b!689659 (not res!454156)) b!689649))

(assert (= (and b!689649 (not res!454168)) b!689662))

(assert (= (and b!689649 res!454162) b!689644))

(assert (= (and b!689644 (not res!454172)) b!689643))

(assert (= (and b!689649 (not res!454159)) b!689640))

(declare-fun m!653255 () Bool)

(assert (=> b!689662 m!653255))

(declare-fun m!653257 () Bool)

(assert (=> b!689648 m!653257))

(declare-fun m!653259 () Bool)

(assert (=> b!689660 m!653259))

(declare-fun m!653261 () Bool)

(assert (=> b!689660 m!653261))

(declare-fun m!653263 () Bool)

(assert (=> b!689660 m!653263))

(declare-fun m!653265 () Bool)

(assert (=> b!689660 m!653265))

(declare-fun m!653267 () Bool)

(assert (=> b!689660 m!653267))

(declare-fun m!653269 () Bool)

(assert (=> b!689660 m!653269))

(declare-fun m!653271 () Bool)

(assert (=> b!689660 m!653271))

(declare-fun m!653273 () Bool)

(assert (=> b!689660 m!653273))

(declare-fun m!653275 () Bool)

(assert (=> b!689660 m!653275))

(declare-fun m!653277 () Bool)

(assert (=> b!689660 m!653277))

(declare-fun m!653279 () Bool)

(assert (=> b!689660 m!653279))

(assert (=> b!689660 m!653263))

(declare-fun m!653281 () Bool)

(assert (=> b!689660 m!653281))

(declare-fun m!653283 () Bool)

(assert (=> b!689660 m!653283))

(declare-fun m!653285 () Bool)

(assert (=> b!689657 m!653285))

(declare-fun m!653287 () Bool)

(assert (=> b!689658 m!653287))

(declare-fun m!653289 () Bool)

(assert (=> b!689640 m!653289))

(declare-fun m!653291 () Bool)

(assert (=> b!689640 m!653291))

(declare-fun m!653293 () Bool)

(assert (=> b!689640 m!653293))

(assert (=> b!689661 m!653261))

(assert (=> b!689661 m!653263))

(declare-fun m!653295 () Bool)

(assert (=> b!689661 m!653295))

(declare-fun m!653297 () Bool)

(assert (=> b!689661 m!653297))

(assert (=> b!689661 m!653263))

(assert (=> b!689661 m!653295))

(assert (=> b!689661 m!653275))

(assert (=> b!689661 m!653283))

(declare-fun m!653299 () Bool)

(assert (=> start!61592 m!653299))

(declare-fun m!653301 () Bool)

(assert (=> b!689647 m!653301))

(declare-fun m!653303 () Bool)

(assert (=> b!689650 m!653303))

(assert (=> b!689638 m!653257))

(declare-fun m!653305 () Bool)

(assert (=> b!689659 m!653305))

(declare-fun m!653307 () Bool)

(assert (=> b!689639 m!653307))

(declare-fun m!653309 () Bool)

(assert (=> b!689641 m!653309))

(assert (=> b!689643 m!653255))

(declare-fun m!653311 () Bool)

(assert (=> b!689654 m!653311))

(declare-fun m!653313 () Bool)

(assert (=> b!689655 m!653313))

(declare-fun m!653315 () Bool)

(assert (=> b!689642 m!653315))

(declare-fun m!653317 () Bool)

(assert (=> b!689656 m!653317))

(push 1)

(assert (not b!689655))

(assert (not b!689658))

(assert (not b!689654))

(assert (not b!689647))

(assert (not b!689638))

(assert (not b!689641))

(assert (not b!689639))

(assert (not b!689661))

(assert (not b!689650))

(assert (not b!689657))

(assert (not b!689660))

(assert (not b!689648))

(assert (not b!689659))

(assert (not b!689640))

(assert (not start!61592))

(assert (not b!689643))

(assert (not b!689642))

(assert (not b!689656))

(assert (not b!689662))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95265 () Bool)

(declare-fun lt!316334 () Bool)

(declare-fun content!304 (List!13079) (Set (_ BitVec 64)))

(assert (=> d!95265 (= lt!316334 (set.member k!2843 (content!304 acc!681)))))

(declare-fun e!392753 () Bool)

(assert (=> d!95265 (= lt!316334 e!392753)))

(declare-fun res!454354 () Bool)

(assert (=> d!95265 (=> (not res!454354) (not e!392753))))

(assert (=> d!95265 (= res!454354 (is-Cons!13075 acc!681))))

(assert (=> d!95265 (= (contains!3656 acc!681 k!2843) lt!316334)))

(declare-fun b!689873 () Bool)

(declare-fun e!392754 () Bool)

(assert (=> b!689873 (= e!392753 e!392754)))

(declare-fun res!454353 () Bool)

(assert (=> b!689873 (=> res!454353 e!392754)))

(assert (=> b!689873 (= res!454353 (= (h!14120 acc!681) k!2843))))

(declare-fun b!689874 () Bool)

(assert (=> b!689874 (= e!392754 (contains!3656 (t!19343 acc!681) k!2843))))

(assert (= (and d!95265 res!454354) b!689873))

(assert (= (and b!689873 (not res!454353)) b!689874))

(declare-fun m!653493 () Bool)

(assert (=> d!95265 m!653493))

(declare-fun m!653495 () Bool)

(assert (=> d!95265 m!653495))

(declare-fun m!653497 () Bool)

(assert (=> b!689874 m!653497))

(assert (=> b!689638 d!95265))

(declare-fun b!689917 () Bool)

(declare-fun e!392793 () List!13079)

(declare-fun e!392791 () List!13079)

(assert (=> b!689917 (= e!392793 e!392791)))

(declare-fun c!78136 () Bool)

(assert (=> b!689917 (= c!78136 (= k!2843 (h!14120 lt!316247)))))

(declare-fun b!689918 () Bool)

(assert (=> b!689918 (= e!392793 Nil!13076)))

(declare-fun b!689919 () Bool)

(declare-fun call!34190 () List!13079)

(assert (=> b!689919 (= e!392791 (Cons!13075 (h!14120 lt!316247) call!34190))))

(declare-fun b!689920 () Bool)

(assert (=> b!689920 (= e!392791 call!34190)))

(declare-fun b!689921 () Bool)

(declare-fun e!392792 () Bool)

(declare-fun lt!316344 () List!13079)

(assert (=> b!689921 (= e!392792 (= (content!304 lt!316344) (set.minus (content!304 lt!316247) (set.insert k!2843 (as set.empty (Set (_ BitVec 64)))))))))

(declare-fun d!95275 () Bool)

(assert (=> d!95275 e!392792))

(declare-fun res!454381 () Bool)

(assert (=> d!95275 (=> (not res!454381) (not e!392792))))

(declare-fun size!19423 (List!13079) Int)

(assert (=> d!95275 (= res!454381 (<= (size!19423 lt!316344) (size!19423 lt!316247)))))

(assert (=> d!95275 (= lt!316344 e!392793)))

(declare-fun c!78135 () Bool)

(assert (=> d!95275 (= c!78135 (is-Cons!13075 lt!316247))))

(assert (=> d!95275 (= (-!207 lt!316247 k!2843) lt!316344)))

(declare-fun bm!34187 () Bool)

(assert (=> bm!34187 (= call!34190 (-!207 (t!19343 lt!316247) k!2843))))

(assert (= (and d!95275 c!78135) b!689917))

(assert (= (and d!95275 (not c!78135)) b!689918))

(assert (= (and b!689917 c!78136) b!689920))

(assert (= (and b!689917 (not c!78136)) b!689919))

(assert (= (or b!689920 b!689919) bm!34187))

(assert (= (and d!95275 res!454381) b!689921))

(declare-fun m!653531 () Bool)

(assert (=> b!689921 m!653531))

(declare-fun m!653533 () Bool)

(assert (=> b!689921 m!653533))

(declare-fun m!653535 () Bool)

(assert (=> b!689921 m!653535))

(declare-fun m!653537 () Bool)

(assert (=> d!95275 m!653537))

(declare-fun m!653539 () Bool)

(assert (=> d!95275 m!653539))

(declare-fun m!653541 () Bool)

(assert (=> bm!34187 m!653541))

(assert (=> b!689660 d!95275))

(declare-fun b!689949 () Bool)

(declare-fun e!392818 () Bool)

(declare-fun call!34194 () Bool)

(assert (=> b!689949 (= e!392818 call!34194)))

(declare-fun b!689950 () Bool)

(assert (=> b!689950 (= e!392818 call!34194)))

(declare-fun b!689951 () Bool)

(declare-fun e!392816 () Bool)

(declare-fun e!392817 () Bool)

(assert (=> b!689951 (= e!392816 e!392817)))

(declare-fun res!454397 () Bool)

(assert (=> b!689951 (=> (not res!454397) (not e!392817))))

(declare-fun e!392815 () Bool)

(assert (=> b!689951 (= res!454397 (not e!392815))))

(declare-fun res!454398 () Bool)

(assert (=> b!689951 (=> (not res!454398) (not e!392815))))

(assert (=> b!689951 (= res!454398 (validKeyInArray!0 (select (arr!19038 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!689952 () Bool)

(assert (=> b!689952 (= e!392815 (contains!3656 lt!316247 (select (arr!19038 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun c!78143 () Bool)

(declare-fun bm!34191 () Bool)

(assert (=> bm!34191 (= call!34194 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!78143 (Cons!13075 (select (arr!19038 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) lt!316247) lt!316247)))))

(declare-fun b!689953 () Bool)

(assert (=> b!689953 (= e!392817 e!392818)))

(assert (=> b!689953 (= c!78143 (validKeyInArray!0 (select (arr!19038 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!95295 () Bool)

(declare-fun res!454399 () Bool)

(assert (=> d!95295 (=> res!454399 e!392816)))

(assert (=> d!95295 (= res!454399 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19420 a!3626)))))

(assert (=> d!95295 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316247) e!392816)))

(assert (= (and d!95295 (not res!454399)) b!689951))

(assert (= (and b!689951 res!454398) b!689952))

(assert (= (and b!689951 res!454397) b!689953))

(assert (= (and b!689953 c!78143) b!689950))

(assert (= (and b!689953 (not c!78143)) b!689949))

(assert (= (or b!689950 b!689949) bm!34191))

(declare-fun m!653559 () Bool)

(assert (=> b!689951 m!653559))

(assert (=> b!689951 m!653559))

(declare-fun m!653561 () Bool)

(assert (=> b!689951 m!653561))

(assert (=> b!689952 m!653559))

(assert (=> b!689952 m!653559))

(declare-fun m!653563 () Bool)

(assert (=> b!689952 m!653563))

(assert (=> bm!34191 m!653559))

(declare-fun m!653565 () Bool)

(assert (=> bm!34191 m!653565))

(assert (=> b!689953 m!653559))

(assert (=> b!689953 m!653559))

(assert (=> b!689953 m!653561))

(assert (=> b!689660 d!95295))

(declare-fun b!689997 () Bool)

(declare-fun e!392856 () Bool)

(assert (=> b!689997 (= e!392856 (subseq!242 acc!681 (t!19343 acc!681)))))

(declare-fun d!95305 () Bool)

(declare-fun res!454435 () Bool)

(declare-fun e!392858 () Bool)

(assert (=> d!95305 (=> res!454435 e!392858)))

(assert (=> d!95305 (= res!454435 (is-Nil!13076 acc!681))))

(assert (=> d!95305 (= (subseq!242 acc!681 acc!681) e!392858)))

(declare-fun b!689995 () Bool)

(declare-fun e!392857 () Bool)

(assert (=> b!689995 (= e!392857 e!392856)))

(declare-fun res!454432 () Bool)

(assert (=> b!689995 (=> res!454432 e!392856)))

(declare-fun e!392855 () Bool)

(assert (=> b!689995 (= res!454432 e!392855)))

(declare-fun res!454434 () Bool)

(assert (=> b!689995 (=> (not res!454434) (not e!392855))))

(assert (=> b!689995 (= res!454434 (= (h!14120 acc!681) (h!14120 acc!681)))))

(declare-fun b!689996 () Bool)

(assert (=> b!689996 (= e!392855 (subseq!242 (t!19343 acc!681) (t!19343 acc!681)))))

(declare-fun b!689994 () Bool)

(assert (=> b!689994 (= e!392858 e!392857)))

(declare-fun res!454433 () Bool)

(assert (=> b!689994 (=> (not res!454433) (not e!392857))))

(assert (=> b!689994 (= res!454433 (is-Cons!13075 acc!681))))

(assert (= (and d!95305 (not res!454435)) b!689994))

(assert (= (and b!689994 res!454433) b!689995))

(assert (= (and b!689995 res!454434) b!689996))

(assert (= (and b!689995 (not res!454432)) b!689997))

(declare-fun m!653597 () Bool)

(assert (=> b!689997 m!653597))

(declare-fun m!653601 () Bool)

(assert (=> b!689996 m!653601))

(assert (=> b!689660 d!95305))

(declare-fun d!95313 () Bool)

(assert (=> d!95313 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316247)))

(declare-fun lt!316357 () Unit!24357)

(declare-fun choose!66 (array!39733 (_ BitVec 64) (_ BitVec 32) List!13079 List!13079) Unit!24357)

(assert (=> d!95313 (= lt!316357 (choose!66 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!316247))))

(assert (=> d!95313 (bvslt (size!19420 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!95313 (= (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!316247) lt!316357)))

(declare-fun bs!20210 () Bool)

(assert (= bs!20210 d!95313))

(assert (=> bs!20210 m!653273))

(declare-fun m!653607 () Bool)

(assert (=> bs!20210 m!653607))

(assert (=> b!689660 d!95313))

(declare-fun d!95319 () Bool)

(declare-fun res!454451 () Bool)

(declare-fun e!392874 () Bool)

(assert (=> d!95319 (=> res!454451 e!392874)))

(assert (=> d!95319 (= res!454451 (= (select (arr!19038 lt!316249) from!3004) k!2843))))

(assert (=> d!95319 (= (arrayContainsKey!0 lt!316249 k!2843 from!3004) e!392874)))

(declare-fun b!690013 () Bool)

(declare-fun e!392875 () Bool)

(assert (=> b!690013 (= e!392874 e!392875)))

(declare-fun res!454452 () Bool)

(assert (=> b!690013 (=> (not res!454452) (not e!392875))))

(assert (=> b!690013 (= res!454452 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19420 lt!316249)))))

(declare-fun b!690014 () Bool)

(assert (=> b!690014 (= e!392875 (arrayContainsKey!0 lt!316249 k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95319 (not res!454451)) b!690013))

(assert (= (and b!690013 res!454452) b!690014))

(declare-fun m!653617 () Bool)

(assert (=> d!95319 m!653617))

(declare-fun m!653619 () Bool)

(assert (=> b!690014 m!653619))

(assert (=> b!689660 d!95319))

(declare-fun d!95327 () Bool)

(declare-fun res!454456 () Bool)

(declare-fun e!392880 () Bool)

(assert (=> d!95327 (=> res!454456 e!392880)))

(assert (=> d!95327 (= res!454456 (= (select (arr!19038 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k!2843))))

(assert (=> d!95327 (= (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!392880)))

(declare-fun b!690020 () Bool)

(declare-fun e!392881 () Bool)

(assert (=> b!690020 (= e!392880 e!392881)))

(declare-fun res!454457 () Bool)

(assert (=> b!690020 (=> (not res!454457) (not e!392881))))

(assert (=> b!690020 (= res!454457 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19420 a!3626)))))

(declare-fun b!690021 () Bool)

(assert (=> b!690021 (= e!392881 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95327 (not res!454456)) b!690020))

(assert (= (and b!690020 res!454457) b!690021))

(assert (=> d!95327 m!653559))

(declare-fun m!653621 () Bool)

(assert (=> b!690021 m!653621))

(assert (=> b!689660 d!95327))

(declare-fun d!95329 () Bool)

(assert (=> d!95329 (= (-!207 ($colon$colon!407 acc!681 k!2843) k!2843) acc!681)))

(declare-fun lt!316369 () Unit!24357)

(declare-fun choose!16 ((_ BitVec 64) List!13079) Unit!24357)

(assert (=> d!95329 (= lt!316369 (choose!16 k!2843 acc!681))))

(assert (=> d!95329 (not (contains!3656 acc!681 k!2843))))

(assert (=> d!95329 (= (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681) lt!316369)))

(declare-fun bs!20213 () Bool)

(assert (= bs!20213 d!95329))

(assert (=> bs!20213 m!653279))

(assert (=> bs!20213 m!653279))

(declare-fun m!653633 () Bool)

(assert (=> bs!20213 m!653633))

(declare-fun m!653635 () Bool)

(assert (=> bs!20213 m!653635))

(assert (=> bs!20213 m!653257))

(assert (=> b!689660 d!95329))

(declare-fun d!95341 () Bool)

(assert (=> d!95341 (subseq!242 acc!681 acc!681)))

(declare-fun lt!316372 () Unit!24357)

(declare-fun choose!36 (List!13079) Unit!24357)

(assert (=> d!95341 (= lt!316372 (choose!36 acc!681))))

(assert (=> d!95341 (= (lemmaListSubSeqRefl!0 acc!681) lt!316372)))

(declare-fun bs!20214 () Bool)

(assert (= bs!20214 d!95341))

(assert (=> bs!20214 m!653283))

(declare-fun m!653645 () Bool)

(assert (=> bs!20214 m!653645))

(assert (=> b!689660 d!95341))

(declare-fun d!95349 () Bool)

(assert (=> d!95349 (= (validKeyInArray!0 (select (arr!19038 a!3626) from!3004)) (and (not (= (select (arr!19038 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19038 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!689660 d!95349))

(declare-fun d!95359 () Bool)

(assert (=> d!95359 (= ($colon$colon!407 acc!681 k!2843) (Cons!13075 k!2843 acc!681))))

(assert (=> b!689660 d!95359))

(declare-fun b!690046 () Bool)

(declare-fun e!392907 () Bool)

(declare-fun call!34204 () Bool)

(assert (=> b!690046 (= e!392907 call!34204)))

(declare-fun b!690047 () Bool)

(assert (=> b!690047 (= e!392907 call!34204)))

(declare-fun b!690048 () Bool)

(declare-fun e!392905 () Bool)

(declare-fun e!392906 () Bool)

(assert (=> b!690048 (= e!392905 e!392906)))

(declare-fun res!454478 () Bool)

(assert (=> b!690048 (=> (not res!454478) (not e!392906))))

(declare-fun e!392904 () Bool)

(assert (=> b!690048 (= res!454478 (not e!392904))))

(declare-fun res!454479 () Bool)

(assert (=> b!690048 (=> (not res!454479) (not e!392904))))

(assert (=> b!690048 (= res!454479 (validKeyInArray!0 (select (arr!19038 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!690049 () Bool)

(assert (=> b!690049 (= e!392904 (contains!3656 acc!681 (select (arr!19038 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun bm!34201 () Bool)

(declare-fun c!78151 () Bool)

(assert (=> bm!34201 (= call!34204 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!78151 (Cons!13075 (select (arr!19038 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!690050 () Bool)

(assert (=> b!690050 (= e!392906 e!392907)))

(assert (=> b!690050 (= c!78151 (validKeyInArray!0 (select (arr!19038 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!95363 () Bool)

(declare-fun res!454480 () Bool)

(assert (=> d!95363 (=> res!454480 e!392905)))

(assert (=> d!95363 (= res!454480 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19420 a!3626)))))

(assert (=> d!95363 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!392905)))

(assert (= (and d!95363 (not res!454480)) b!690048))

(assert (= (and b!690048 res!454479) b!690049))

(assert (= (and b!690048 res!454478) b!690050))

(assert (= (and b!690050 c!78151) b!690047))

(assert (= (and b!690050 (not c!78151)) b!690046))

(assert (= (or b!690047 b!690046) bm!34201))

(assert (=> b!690048 m!653559))

(assert (=> b!690048 m!653559))

(assert (=> b!690048 m!653561))

(assert (=> b!690049 m!653559))

(assert (=> b!690049 m!653559))

(declare-fun m!653669 () Bool)

(assert (=> b!690049 m!653669))

(assert (=> bm!34201 m!653559))

(declare-fun m!653671 () Bool)

(assert (=> bm!34201 m!653671))

(assert (=> b!690050 m!653559))

(assert (=> b!690050 m!653559))

(assert (=> b!690050 m!653561))

(assert (=> b!689660 d!95363))

(declare-fun d!95369 () Bool)

(declare-fun lt!316376 () Bool)

(assert (=> d!95369 (= lt!316376 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!304 acc!681)))))

(declare-fun e!392910 () Bool)

(assert (=> d!95369 (= lt!316376 e!392910)))

(declare-fun res!454484 () Bool)

(assert (=> d!95369 (=> (not res!454484) (not e!392910))))

(assert (=> d!95369 (= res!454484 (is-Cons!13075 acc!681))))

(assert (=> d!95369 (= (contains!3656 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316376)))

(declare-fun b!690053 () Bool)

(declare-fun e!392911 () Bool)

(assert (=> b!690053 (= e!392910 e!392911)))

(declare-fun res!454483 () Bool)

(assert (=> b!690053 (=> res!454483 e!392911)))

(assert (=> b!690053 (= res!454483 (= (h!14120 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!690054 () Bool)

(assert (=> b!690054 (= e!392911 (contains!3656 (t!19343 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95369 res!454484) b!690053))

(assert (= (and b!690053 (not res!454483)) b!690054))

(assert (=> d!95369 m!653493))

(declare-fun m!653673 () Bool)

(assert (=> d!95369 m!653673))

(declare-fun m!653675 () Bool)

(assert (=> b!690054 m!653675))

(assert (=> b!689639 d!95369))

(declare-fun d!95371 () Bool)

(assert (=> d!95371 (= (array_inv!14834 a!3626) (bvsge (size!19420 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61592 d!95371))

(declare-fun d!95375 () Bool)

(declare-fun lt!316378 () Bool)

(assert (=> d!95375 (= lt!316378 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!304 lt!316247)))))

(declare-fun e!392916 () Bool)

(assert (=> d!95375 (= lt!316378 e!392916)))

(declare-fun res!454489 () Bool)

(assert (=> d!95375 (=> (not res!454489) (not e!392916))))

(assert (=> d!95375 (= res!454489 (is-Cons!13075 lt!316247))))

(assert (=> d!95375 (= (contains!3656 lt!316247 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316378)))

(declare-fun b!690060 () Bool)

(declare-fun e!392917 () Bool)

(assert (=> b!690060 (= e!392916 e!392917)))

(declare-fun res!454488 () Bool)

(assert (=> b!690060 (=> res!454488 e!392917)))

(assert (=> b!690060 (= res!454488 (= (h!14120 lt!316247) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!690061 () Bool)

(assert (=> b!690061 (= e!392917 (contains!3656 (t!19343 lt!316247) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95375 res!454489) b!690060))

(assert (= (and b!690060 (not res!454488)) b!690061))

(assert (=> d!95375 m!653533))

(declare-fun m!653681 () Bool)

(assert (=> d!95375 m!653681))

(declare-fun m!653683 () Bool)

(assert (=> b!690061 m!653683))

(assert (=> b!689658 d!95375))

(assert (=> b!689648 d!95265))

(declare-fun d!95377 () Bool)

(declare-fun lt!316379 () Bool)

(assert (=> d!95377 (= lt!316379 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!304 lt!316247)))))

(declare-fun e!392918 () Bool)

(assert (=> d!95377 (= lt!316379 e!392918)))

(declare-fun res!454491 () Bool)

(assert (=> d!95377 (=> (not res!454491) (not e!392918))))

(assert (=> d!95377 (= res!454491 (is-Cons!13075 lt!316247))))

(assert (=> d!95377 (= (contains!3656 lt!316247 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316379)))

(declare-fun b!690062 () Bool)

(declare-fun e!392919 () Bool)

(assert (=> b!690062 (= e!392918 e!392919)))

(declare-fun res!454490 () Bool)

(assert (=> b!690062 (=> res!454490 e!392919)))

(assert (=> b!690062 (= res!454490 (= (h!14120 lt!316247) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!690063 () Bool)

(assert (=> b!690063 (= e!392919 (contains!3656 (t!19343 lt!316247) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95377 res!454491) b!690062))

(assert (= (and b!690062 (not res!454490)) b!690063))

(assert (=> d!95377 m!653533))

(declare-fun m!653689 () Bool)

(assert (=> d!95377 m!653689))

(declare-fun m!653691 () Bool)

(assert (=> b!690063 m!653691))

(assert (=> b!689659 d!95377))

(declare-fun b!690069 () Bool)

(declare-fun e!392927 () Bool)

(declare-fun call!34207 () Bool)

(assert (=> b!690069 (= e!392927 call!34207)))

(declare-fun b!690070 () Bool)

(assert (=> b!690070 (= e!392927 call!34207)))

(declare-fun b!690071 () Bool)

(declare-fun e!392925 () Bool)

(declare-fun e!392926 () Bool)

(assert (=> b!690071 (= e!392925 e!392926)))

(declare-fun res!454495 () Bool)

(assert (=> b!690071 (=> (not res!454495) (not e!392926))))

(declare-fun e!392924 () Bool)

(assert (=> b!690071 (= res!454495 (not e!392924))))

(declare-fun res!454496 () Bool)

(assert (=> b!690071 (=> (not res!454496) (not e!392924))))

(assert (=> b!690071 (= res!454496 (validKeyInArray!0 (select (arr!19038 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!690072 () Bool)

(assert (=> b!690072 (= e!392924 (contains!3656 Nil!13076 (select (arr!19038 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!34204 () Bool)

(declare-fun c!78154 () Bool)

(assert (=> bm!34204 (= call!34207 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78154 (Cons!13075 (select (arr!19038 a!3626) #b00000000000000000000000000000000) Nil!13076) Nil!13076)))))

(declare-fun b!690073 () Bool)

(assert (=> b!690073 (= e!392926 e!392927)))

(assert (=> b!690073 (= c!78154 (validKeyInArray!0 (select (arr!19038 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!95381 () Bool)

(declare-fun res!454497 () Bool)

(assert (=> d!95381 (=> res!454497 e!392925)))

(assert (=> d!95381 (= res!454497 (bvsge #b00000000000000000000000000000000 (size!19420 a!3626)))))

(assert (=> d!95381 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13076) e!392925)))

(assert (= (and d!95381 (not res!454497)) b!690071))

(assert (= (and b!690071 res!454496) b!690072))

(assert (= (and b!690071 res!454495) b!690073))

(assert (= (and b!690073 c!78154) b!690070))

(assert (= (and b!690073 (not c!78154)) b!690069))

(assert (= (or b!690070 b!690069) bm!34204))

(declare-fun m!653695 () Bool)

(assert (=> b!690071 m!653695))

(assert (=> b!690071 m!653695))

(declare-fun m!653697 () Bool)

(assert (=> b!690071 m!653697))

(assert (=> b!690072 m!653695))

(assert (=> b!690072 m!653695))

(declare-fun m!653701 () Bool)

(assert (=> b!690072 m!653701))

(assert (=> bm!34204 m!653695))

(declare-fun m!653703 () Bool)

(assert (=> bm!34204 m!653703))

(assert (=> b!690073 m!653695))

(assert (=> b!690073 m!653695))

(assert (=> b!690073 m!653697))

(assert (=> b!689657 d!95381))

(declare-fun d!95387 () Bool)

(declare-fun res!454504 () Bool)

(declare-fun e!392939 () Bool)

(assert (=> d!95387 (=> res!454504 e!392939)))

(assert (=> d!95387 (= res!454504 (is-Nil!13076 acc!681))))

(assert (=> d!95387 (= (noDuplicate!903 acc!681) e!392939)))

(declare-fun b!690088 () Bool)

(declare-fun e!392940 () Bool)

(assert (=> b!690088 (= e!392939 e!392940)))

(declare-fun res!454505 () Bool)

(assert (=> b!690088 (=> (not res!454505) (not e!392940))))

(assert (=> b!690088 (= res!454505 (not (contains!3656 (t!19343 acc!681) (h!14120 acc!681))))))

(declare-fun b!690089 () Bool)

(assert (=> b!690089 (= e!392940 (noDuplicate!903 (t!19343 acc!681)))))

(assert (= (and d!95387 (not res!454504)) b!690088))

(assert (= (and b!690088 res!454505) b!690089))

(declare-fun m!653705 () Bool)

(assert (=> b!690088 m!653705))

(declare-fun m!653707 () Bool)

(assert (=> b!690089 m!653707))

(assert (=> b!689647 d!95387))

(declare-fun d!95389 () Bool)

(assert (=> d!95389 (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))

(declare-fun lt!316388 () Unit!24357)

(declare-fun choose!13 (array!39733 (_ BitVec 64) (_ BitVec 32)) Unit!24357)

(assert (=> d!95389 (= lt!316388 (choose!13 a!3626 k!2843 from!3004))))

(assert (=> d!95389 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!95389 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004) lt!316388)))

(declare-fun bs!20217 () Bool)

(assert (= bs!20217 d!95389))

(assert (=> bs!20217 m!653311))

(declare-fun m!653721 () Bool)

(assert (=> bs!20217 m!653721))

(assert (=> b!689656 d!95389))

(declare-fun d!95393 () Bool)

(declare-fun res!454507 () Bool)

(declare-fun e!392944 () Bool)

(assert (=> d!95393 (=> res!454507 e!392944)))

(assert (=> d!95393 (= res!454507 (= (select (arr!19038 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!95393 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!392944)))

(declare-fun b!690095 () Bool)

(declare-fun e!392945 () Bool)

(assert (=> b!690095 (= e!392944 e!392945)))

(declare-fun res!454508 () Bool)

(assert (=> b!690095 (=> (not res!454508) (not e!392945))))

(assert (=> b!690095 (= res!454508 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19420 a!3626)))))

(declare-fun b!690096 () Bool)

(assert (=> b!690096 (= e!392945 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95393 (not res!454507)) b!690095))

(assert (= (and b!690095 res!454508) b!690096))

(assert (=> d!95393 m!653695))

(declare-fun m!653723 () Bool)

(assert (=> b!690096 m!653723))

(assert (=> b!689654 d!95393))

(declare-fun d!95395 () Bool)

(declare-fun res!454509 () Bool)

(declare-fun e!392946 () Bool)

(assert (=> d!95395 (=> res!454509 e!392946)))

(assert (=> d!95395 (= res!454509 (is-Nil!13076 lt!316247))))

(assert (=> d!95395 (= (noDuplicate!903 lt!316247) e!392946)))

(declare-fun b!690097 () Bool)

(declare-fun e!392947 () Bool)

(assert (=> b!690097 (= e!392946 e!392947)))

(declare-fun res!454510 () Bool)

(assert (=> b!690097 (=> (not res!454510) (not e!392947))))

(assert (=> b!690097 (= res!454510 (not (contains!3656 (t!19343 lt!316247) (h!14120 lt!316247))))))

(declare-fun b!690098 () Bool)

(assert (=> b!690098 (= e!392947 (noDuplicate!903 (t!19343 lt!316247)))))

(assert (= (and d!95395 (not res!454509)) b!690097))

(assert (= (and b!690097 res!454510) b!690098))

(declare-fun m!653725 () Bool)

(assert (=> b!690097 m!653725))

(declare-fun m!653727 () Bool)

(assert (=> b!690098 m!653727))

(assert (=> b!689655 d!95395))

(declare-fun b!690099 () Bool)

(declare-fun e!392951 () Bool)

(declare-fun call!34211 () Bool)

(assert (=> b!690099 (= e!392951 call!34211)))

(declare-fun b!690100 () Bool)

(assert (=> b!690100 (= e!392951 call!34211)))

(declare-fun b!690101 () Bool)

(declare-fun e!392949 () Bool)

(declare-fun e!392950 () Bool)

(assert (=> b!690101 (= e!392949 e!392950)))

(declare-fun res!454511 () Bool)

(assert (=> b!690101 (=> (not res!454511) (not e!392950))))

(declare-fun e!392948 () Bool)

(assert (=> b!690101 (= res!454511 (not e!392948))))

(declare-fun res!454512 () Bool)

(assert (=> b!690101 (=> (not res!454512) (not e!392948))))

(assert (=> b!690101 (= res!454512 (validKeyInArray!0 (select (arr!19038 a!3626) from!3004)))))

(declare-fun b!690102 () Bool)

(assert (=> b!690102 (= e!392948 (contains!3656 acc!681 (select (arr!19038 a!3626) from!3004)))))

(declare-fun c!78161 () Bool)

(declare-fun bm!34208 () Bool)

(assert (=> bm!34208 (= call!34211 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78161 (Cons!13075 (select (arr!19038 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!690103 () Bool)

(assert (=> b!690103 (= e!392950 e!392951)))

(assert (=> b!690103 (= c!78161 (validKeyInArray!0 (select (arr!19038 a!3626) from!3004)))))

(declare-fun d!95397 () Bool)

(declare-fun res!454513 () Bool)

(assert (=> d!95397 (=> res!454513 e!392949)))

(assert (=> d!95397 (= res!454513 (bvsge from!3004 (size!19420 a!3626)))))

(assert (=> d!95397 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!392949)))

(assert (= (and d!95397 (not res!454513)) b!690101))

(assert (= (and b!690101 res!454512) b!690102))

(assert (= (and b!690101 res!454511) b!690103))

(assert (= (and b!690103 c!78161) b!690100))

(assert (= (and b!690103 (not c!78161)) b!690099))

(assert (= (or b!690100 b!690099) bm!34208))

(assert (=> b!690101 m!653263))

(assert (=> b!690101 m!653263))

(assert (=> b!690101 m!653281))

(assert (=> b!690102 m!653263))

(assert (=> b!690102 m!653263))

(declare-fun m!653729 () Bool)

(assert (=> b!690102 m!653729))

(assert (=> bm!34208 m!653263))

(declare-fun m!653731 () Bool)

(assert (=> bm!34208 m!653731))

(assert (=> b!690103 m!653263))

(assert (=> b!690103 m!653263))

(assert (=> b!690103 m!653281))

(assert (=> b!689642 d!95397))

(declare-fun d!95399 () Bool)

(declare-fun lt!316392 () Bool)

(assert (=> d!95399 (= lt!316392 (set.member k!2843 (content!304 lt!316247)))))

(declare-fun e!392952 () Bool)

(assert (=> d!95399 (= lt!316392 e!392952)))

(declare-fun res!454515 () Bool)

(assert (=> d!95399 (=> (not res!454515) (not e!392952))))

(assert (=> d!95399 (= res!454515 (is-Cons!13075 lt!316247))))

(assert (=> d!95399 (= (contains!3656 lt!316247 k!2843) lt!316392)))

(declare-fun b!690104 () Bool)

(declare-fun e!392953 () Bool)

(assert (=> b!690104 (= e!392952 e!392953)))

(declare-fun res!454514 () Bool)

(assert (=> b!690104 (=> res!454514 e!392953)))

(assert (=> b!690104 (= res!454514 (= (h!14120 lt!316247) k!2843))))

(declare-fun b!690105 () Bool)

(assert (=> b!690105 (= e!392953 (contains!3656 (t!19343 lt!316247) k!2843))))

(assert (= (and d!95399 res!454515) b!690104))

(assert (= (and b!690104 (not res!454514)) b!690105))

(assert (=> d!95399 m!653533))

(declare-fun m!653737 () Bool)

(assert (=> d!95399 m!653737))

(declare-fun m!653739 () Bool)

(assert (=> b!690105 m!653739))

(assert (=> b!689643 d!95399))

(assert (=> b!689662 d!95399))

(declare-fun d!95403 () Bool)

(assert (=> d!95403 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!689641 d!95403))

(declare-fun d!95405 () Bool)

(declare-fun lt!316393 () Bool)

(assert (=> d!95405 (= lt!316393 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!304 acc!681)))))

(declare-fun e!392958 () Bool)

(assert (=> d!95405 (= lt!316393 e!392958)))

(declare-fun res!454520 () Bool)

(assert (=> d!95405 (=> (not res!454520) (not e!392958))))

(assert (=> d!95405 (= res!454520 (is-Cons!13075 acc!681))))

(assert (=> d!95405 (= (contains!3656 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316393)))

(declare-fun b!690111 () Bool)

(declare-fun e!392959 () Bool)

(assert (=> b!690111 (= e!392958 e!392959)))

(declare-fun res!454519 () Bool)

(assert (=> b!690111 (=> res!454519 e!392959)))

(assert (=> b!690111 (= res!454519 (= (h!14120 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!690112 () Bool)

(assert (=> b!690112 (= e!392959 (contains!3656 (t!19343 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95405 res!454520) b!690111))

(assert (= (and b!690111 (not res!454519)) b!690112))

(assert (=> d!95405 m!653493))

(declare-fun m!653741 () Bool)

(assert (=> d!95405 m!653741))

(declare-fun m!653743 () Bool)

(assert (=> b!690112 m!653743))

(assert (=> b!689650 d!95405))

(declare-fun d!95407 () Bool)

(assert (=> d!95407 (= ($colon$colon!407 acc!681 (select (arr!19038 a!3626) from!3004)) (Cons!13075 (select (arr!19038 a!3626) from!3004) acc!681))))

(assert (=> b!689661 d!95407))

(assert (=> b!689661 d!95305))

(declare-fun d!95409 () Bool)

(assert (=> d!95409 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!316398 () Unit!24357)

(declare-fun choose!80 (array!39733 List!13079 List!13079 (_ BitVec 32)) Unit!24357)

(assert (=> d!95409 (= lt!316398 (choose!80 a!3626 ($colon$colon!407 acc!681 (select (arr!19038 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!95409 (bvslt (size!19420 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!95409 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!407 acc!681 (select (arr!19038 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!316398)))

(declare-fun bs!20219 () Bool)

(assert (= bs!20219 d!95409))

(assert (=> bs!20219 m!653261))

(assert (=> bs!20219 m!653295))

(declare-fun m!653749 () Bool)

(assert (=> bs!20219 m!653749))

(assert (=> b!689661 d!95409))

(assert (=> b!689661 d!95341))

(assert (=> b!689661 d!95363))

(declare-fun b!690113 () Bool)

(declare-fun e!392963 () Bool)

(declare-fun call!34213 () Bool)

(assert (=> b!690113 (= e!392963 call!34213)))

(declare-fun b!690114 () Bool)

(assert (=> b!690114 (= e!392963 call!34213)))

(declare-fun b!690115 () Bool)

(declare-fun e!392961 () Bool)

(declare-fun e!392962 () Bool)

(assert (=> b!690115 (= e!392961 e!392962)))

(declare-fun res!454521 () Bool)

(assert (=> b!690115 (=> (not res!454521) (not e!392962))))

(declare-fun e!392960 () Bool)

(assert (=> b!690115 (= res!454521 (not e!392960))))

(declare-fun res!454522 () Bool)

(assert (=> b!690115 (=> (not res!454522) (not e!392960))))

(assert (=> b!690115 (= res!454522 (validKeyInArray!0 (select (arr!19038 lt!316249) from!3004)))))

(declare-fun b!690116 () Bool)

(assert (=> b!690116 (= e!392960 (contains!3656 acc!681 (select (arr!19038 lt!316249) from!3004)))))

(declare-fun c!78163 () Bool)

(declare-fun bm!34210 () Bool)

(assert (=> bm!34210 (= call!34213 (arrayNoDuplicates!0 lt!316249 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78163 (Cons!13075 (select (arr!19038 lt!316249) from!3004) acc!681) acc!681)))))

(declare-fun b!690117 () Bool)

(assert (=> b!690117 (= e!392962 e!392963)))

(assert (=> b!690117 (= c!78163 (validKeyInArray!0 (select (arr!19038 lt!316249) from!3004)))))

(declare-fun d!95413 () Bool)

(declare-fun res!454523 () Bool)

(assert (=> d!95413 (=> res!454523 e!392961)))

(assert (=> d!95413 (= res!454523 (bvsge from!3004 (size!19420 lt!316249)))))

(assert (=> d!95413 (= (arrayNoDuplicates!0 lt!316249 from!3004 acc!681) e!392961)))

(assert (= (and d!95413 (not res!454523)) b!690115))

(assert (= (and b!690115 res!454522) b!690116))

(assert (= (and b!690115 res!454521) b!690117))

(assert (= (and b!690117 c!78163) b!690114))

(assert (= (and b!690117 (not c!78163)) b!690113))

(assert (= (or b!690114 b!690113) bm!34210))

(assert (=> b!690115 m!653617))

(assert (=> b!690115 m!653617))

(declare-fun m!653753 () Bool)

(assert (=> b!690115 m!653753))

(assert (=> b!690116 m!653617))

(assert (=> b!690116 m!653617))

(declare-fun m!653755 () Bool)

(assert (=> b!690116 m!653755))

(assert (=> bm!34210 m!653617))

(declare-fun m!653759 () Bool)

(assert (=> bm!34210 m!653759))

(assert (=> b!690117 m!653617))

(assert (=> b!690117 m!653617))

(assert (=> b!690117 m!653753))

(assert (=> b!689640 d!95413))

(declare-fun b!690122 () Bool)

(declare-fun e!392971 () Bool)

(declare-fun call!34214 () Bool)

(assert (=> b!690122 (= e!392971 call!34214)))

(declare-fun b!690123 () Bool)

(assert (=> b!690123 (= e!392971 call!34214)))

(declare-fun b!690124 () Bool)

(declare-fun e!392969 () Bool)

(declare-fun e!392970 () Bool)

(assert (=> b!690124 (= e!392969 e!392970)))

(declare-fun res!454528 () Bool)

(assert (=> b!690124 (=> (not res!454528) (not e!392970))))

(declare-fun e!392968 () Bool)

(assert (=> b!690124 (= res!454528 (not e!392968))))

(declare-fun res!454529 () Bool)

(assert (=> b!690124 (=> (not res!454529) (not e!392968))))

(assert (=> b!690124 (= res!454529 (validKeyInArray!0 (select (arr!19038 lt!316249) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!690125 () Bool)

(assert (=> b!690125 (= e!392968 (contains!3656 lt!316247 (select (arr!19038 lt!316249) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun c!78164 () Bool)

(declare-fun bm!34211 () Bool)

(assert (=> bm!34211 (= call!34214 (arrayNoDuplicates!0 lt!316249 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!78164 (Cons!13075 (select (arr!19038 lt!316249) (bvadd #b00000000000000000000000000000001 from!3004)) lt!316247) lt!316247)))))

(declare-fun b!690126 () Bool)

(assert (=> b!690126 (= e!392970 e!392971)))

(assert (=> b!690126 (= c!78164 (validKeyInArray!0 (select (arr!19038 lt!316249) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!95423 () Bool)

(declare-fun res!454530 () Bool)

(assert (=> d!95423 (=> res!454530 e!392969)))

(assert (=> d!95423 (= res!454530 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19420 lt!316249)))))

(assert (=> d!95423 (= (arrayNoDuplicates!0 lt!316249 (bvadd #b00000000000000000000000000000001 from!3004) lt!316247) e!392969)))

(assert (= (and d!95423 (not res!454530)) b!690124))

(assert (= (and b!690124 res!454529) b!690125))

(assert (= (and b!690124 res!454528) b!690126))

(assert (= (and b!690126 c!78164) b!690123))

(assert (= (and b!690126 (not c!78164)) b!690122))

(assert (= (or b!690123 b!690122) bm!34211))

(declare-fun m!653767 () Bool)

(assert (=> b!690124 m!653767))

(assert (=> b!690124 m!653767))

(declare-fun m!653769 () Bool)

(assert (=> b!690124 m!653769))

(assert (=> b!690125 m!653767))

(assert (=> b!690125 m!653767))

(declare-fun m!653775 () Bool)

(assert (=> b!690125 m!653775))

(assert (=> bm!34211 m!653767))

(declare-fun m!653777 () Bool)

(assert (=> bm!34211 m!653777))

(assert (=> b!690126 m!653767))

(assert (=> b!690126 m!653767))

(assert (=> b!690126 m!653769))

(assert (=> b!689640 d!95423))

(declare-fun d!95427 () Bool)

(declare-fun e!392976 () Bool)

(assert (=> d!95427 e!392976))

(declare-fun res!454535 () Bool)

(assert (=> d!95427 (=> (not res!454535) (not e!392976))))

(assert (=> d!95427 (= res!454535 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19420 a!3626))))))

(declare-fun lt!316405 () Unit!24357)

(declare-fun choose!41 (array!39733 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13079) Unit!24357)

(assert (=> d!95427 (= lt!316405 (choose!41 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!316247))))

(assert (=> d!95427 (bvslt (size!19420 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!95427 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!316247) lt!316405)))

(declare-fun b!690131 () Bool)

(assert (=> b!690131 (= e!392976 (arrayNoDuplicates!0 (array!39734 (store (arr!19038 a!3626) i!1382 k!2843) (size!19420 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!316247))))

(assert (= (and d!95427 res!454535) b!690131))

(declare-fun m!653779 () Bool)

(assert (=> d!95427 m!653779))

(assert (=> b!690131 m!653271))

(declare-fun m!653781 () Bool)

(assert (=> b!690131 m!653781))

(assert (=> b!689640 d!95427))

(push 1)

