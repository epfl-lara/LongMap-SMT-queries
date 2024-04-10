; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63380 () Bool)

(assert start!63380)

(declare-fun b!714120 () Bool)

(declare-fun res!477211 () Bool)

(declare-fun e!401351 () Bool)

(assert (=> b!714120 (=> (not res!477211) (not e!401351))))

(declare-datatypes ((List!13423 0))(
  ( (Nil!13420) (Cons!13419 (h!14464 (_ BitVec 64)) (t!19738 List!13423)) )
))
(declare-fun newAcc!49 () List!13423)

(declare-fun contains!4000 (List!13423 (_ BitVec 64)) Bool)

(assert (=> b!714120 (= res!477211 (not (contains!4000 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714121 () Bool)

(declare-fun res!477218 () Bool)

(assert (=> b!714121 (=> (not res!477218) (not e!401351))))

(assert (=> b!714121 (= res!477218 (not (contains!4000 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714122 () Bool)

(declare-fun res!477219 () Bool)

(assert (=> b!714122 (=> (not res!477219) (not e!401351))))

(declare-fun acc!652 () List!13423)

(assert (=> b!714122 (= res!477219 (not (contains!4000 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714123 () Bool)

(declare-fun res!477207 () Bool)

(assert (=> b!714123 (=> (not res!477207) (not e!401351))))

(declare-fun noDuplicate!1247 (List!13423) Bool)

(assert (=> b!714123 (= res!477207 (noDuplicate!1247 newAcc!49))))

(declare-fun res!477210 () Bool)

(assert (=> start!63380 (=> (not res!477210) (not e!401351))))

(declare-datatypes ((array!40484 0))(
  ( (array!40485 (arr!19382 (Array (_ BitVec 32) (_ BitVec 64))) (size!19793 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40484)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!63380 (= res!477210 (and (bvslt (size!19793 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19793 a!3591))))))

(assert (=> start!63380 e!401351))

(assert (=> start!63380 true))

(declare-fun array_inv!15178 (array!40484) Bool)

(assert (=> start!63380 (array_inv!15178 a!3591)))

(declare-fun b!714124 () Bool)

(declare-fun res!477220 () Bool)

(assert (=> b!714124 (=> (not res!477220) (not e!401351))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40484 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!714124 (= res!477220 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!714125 () Bool)

(declare-fun res!477206 () Bool)

(assert (=> b!714125 (=> (not res!477206) (not e!401351))))

(assert (=> b!714125 (= res!477206 (noDuplicate!1247 acc!652))))

(declare-fun b!714126 () Bool)

(declare-fun res!477215 () Bool)

(assert (=> b!714126 (=> (not res!477215) (not e!401351))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!714126 (= res!477215 (validKeyInArray!0 k!2824))))

(declare-fun b!714127 () Bool)

(declare-fun res!477209 () Bool)

(assert (=> b!714127 (=> (not res!477209) (not e!401351))))

(assert (=> b!714127 (= res!477209 (contains!4000 newAcc!49 k!2824))))

(declare-fun b!714128 () Bool)

(declare-fun res!477208 () Bool)

(assert (=> b!714128 (=> (not res!477208) (not e!401351))))

(declare-fun arrayNoDuplicates!0 (array!40484 (_ BitVec 32) List!13423) Bool)

(assert (=> b!714128 (= res!477208 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!714129 () Bool)

(declare-fun res!477217 () Bool)

(assert (=> b!714129 (=> (not res!477217) (not e!401351))))

(assert (=> b!714129 (= res!477217 (not (validKeyInArray!0 (select (arr!19382 a!3591) from!2969))))))

(declare-fun b!714130 () Bool)

(declare-fun res!477205 () Bool)

(assert (=> b!714130 (=> (not res!477205) (not e!401351))))

(declare-fun -!410 (List!13423 (_ BitVec 64)) List!13423)

(assert (=> b!714130 (= res!477205 (= (-!410 newAcc!49 k!2824) acc!652))))

(declare-fun b!714131 () Bool)

(declare-fun res!477214 () Bool)

(assert (=> b!714131 (=> (not res!477214) (not e!401351))))

(declare-fun subseq!445 (List!13423 List!13423) Bool)

(assert (=> b!714131 (= res!477214 (subseq!445 acc!652 newAcc!49))))

(declare-fun b!714132 () Bool)

(declare-fun res!477213 () Bool)

(assert (=> b!714132 (=> (not res!477213) (not e!401351))))

(assert (=> b!714132 (= res!477213 (not (contains!4000 acc!652 k!2824)))))

(declare-fun b!714133 () Bool)

(declare-fun res!477212 () Bool)

(assert (=> b!714133 (=> (not res!477212) (not e!401351))))

(assert (=> b!714133 (= res!477212 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!714134 () Bool)

(declare-fun res!477204 () Bool)

(assert (=> b!714134 (=> (not res!477204) (not e!401351))))

(assert (=> b!714134 (= res!477204 (not (contains!4000 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714135 () Bool)

(declare-fun res!477216 () Bool)

(assert (=> b!714135 (=> (not res!477216) (not e!401351))))

(assert (=> b!714135 (= res!477216 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19793 a!3591)))))

(declare-fun b!714136 () Bool)

(assert (=> b!714136 (= e!401351 (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969)))))

(assert (= (and start!63380 res!477210) b!714125))

(assert (= (and b!714125 res!477206) b!714123))

(assert (= (and b!714123 res!477207) b!714134))

(assert (= (and b!714134 res!477204) b!714122))

(assert (= (and b!714122 res!477219) b!714124))

(assert (= (and b!714124 res!477220) b!714132))

(assert (= (and b!714132 res!477213) b!714126))

(assert (= (and b!714126 res!477215) b!714128))

(assert (= (and b!714128 res!477208) b!714131))

(assert (= (and b!714131 res!477214) b!714127))

(assert (= (and b!714127 res!477209) b!714130))

(assert (= (and b!714130 res!477205) b!714121))

(assert (= (and b!714121 res!477218) b!714120))

(assert (= (and b!714120 res!477211) b!714135))

(assert (= (and b!714135 res!477216) b!714129))

(assert (= (and b!714129 res!477217) b!714133))

(assert (= (and b!714133 res!477212) b!714136))

(declare-fun m!670719 () Bool)

(assert (=> b!714128 m!670719))

(declare-fun m!670721 () Bool)

(assert (=> b!714130 m!670721))

(declare-fun m!670723 () Bool)

(assert (=> b!714123 m!670723))

(declare-fun m!670725 () Bool)

(assert (=> b!714131 m!670725))

(declare-fun m!670727 () Bool)

(assert (=> b!714120 m!670727))

(declare-fun m!670729 () Bool)

(assert (=> b!714124 m!670729))

(declare-fun m!670731 () Bool)

(assert (=> b!714136 m!670731))

(declare-fun m!670733 () Bool)

(assert (=> b!714132 m!670733))

(declare-fun m!670735 () Bool)

(assert (=> b!714127 m!670735))

(declare-fun m!670737 () Bool)

(assert (=> start!63380 m!670737))

(declare-fun m!670739 () Bool)

(assert (=> b!714121 m!670739))

(declare-fun m!670741 () Bool)

(assert (=> b!714125 m!670741))

(declare-fun m!670743 () Bool)

(assert (=> b!714134 m!670743))

(declare-fun m!670745 () Bool)

(assert (=> b!714122 m!670745))

(declare-fun m!670747 () Bool)

(assert (=> b!714129 m!670747))

(assert (=> b!714129 m!670747))

(declare-fun m!670749 () Bool)

(assert (=> b!714129 m!670749))

(declare-fun m!670751 () Bool)

(assert (=> b!714126 m!670751))

(push 1)

(assert (not b!714128))

(assert (not b!714132))

(assert (not b!714121))

(assert (not b!714134))

(assert (not b!714123))

(assert (not b!714136))

(assert (not b!714129))

(assert (not b!714122))

(assert (not b!714130))

(assert (not b!714125))

(assert (not start!63380))

(assert (not b!714124))

(assert (not b!714131))

(assert (not b!714127))

(assert (not b!714120))

(assert (not b!714126))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!98231 () Bool)

(declare-fun lt!318737 () Bool)

(declare-fun content!365 (List!13423) (Set (_ BitVec 64)))

(assert (=> d!98231 (= lt!318737 (member k!2824 (content!365 newAcc!49)))))

(declare-fun e!401380 () Bool)

(assert (=> d!98231 (= lt!318737 e!401380)))

(declare-fun res!477243 () Bool)

(assert (=> d!98231 (=> (not res!477243) (not e!401380))))

(assert (=> d!98231 (= res!477243 (is-Cons!13419 newAcc!49))))

(assert (=> d!98231 (= (contains!4000 newAcc!49 k!2824) lt!318737)))

(declare-fun b!714166 () Bool)

(declare-fun e!401381 () Bool)

(assert (=> b!714166 (= e!401380 e!401381)))

(declare-fun res!477242 () Bool)

(assert (=> b!714166 (=> res!477242 e!401381)))

(assert (=> b!714166 (= res!477242 (= (h!14464 newAcc!49) k!2824))))

(declare-fun b!714167 () Bool)

(assert (=> b!714167 (= e!401381 (contains!4000 (t!19738 newAcc!49) k!2824))))

(assert (= (and d!98231 res!477243) b!714166))

(assert (= (and b!714166 (not res!477242)) b!714167))

(declare-fun m!670769 () Bool)

(assert (=> d!98231 m!670769))

(declare-fun m!670771 () Bool)

(assert (=> d!98231 m!670771))

(declare-fun m!670773 () Bool)

(assert (=> b!714167 m!670773))

(assert (=> b!714127 d!98231))

(declare-fun b!714200 () Bool)

(declare-fun e!401409 () Bool)

(declare-fun e!401411 () Bool)

(assert (=> b!714200 (= e!401409 e!401411)))

(declare-fun res!477270 () Bool)

(assert (=> b!714200 (=> (not res!477270) (not e!401411))))

(declare-fun e!401408 () Bool)

(assert (=> b!714200 (= res!477270 (not e!401408))))

(declare-fun res!477269 () Bool)

(assert (=> b!714200 (=> (not res!477269) (not e!401408))))

(assert (=> b!714200 (= res!477269 (validKeyInArray!0 (select (arr!19382 a!3591) from!2969)))))

(declare-fun b!714201 () Bool)

(assert (=> b!714201 (= e!401408 (contains!4000 acc!652 (select (arr!19382 a!3591) from!2969)))))

(declare-fun d!98237 () Bool)

(declare-fun res!477268 () Bool)

(assert (=> d!98237 (=> res!477268 e!401409)))

(assert (=> d!98237 (= res!477268 (bvsge from!2969 (size!19793 a!3591)))))

(assert (=> d!98237 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!401409)))

(declare-fun b!714202 () Bool)

(declare-fun e!401410 () Bool)

(declare-fun call!34599 () Bool)

(assert (=> b!714202 (= e!401410 call!34599)))

(declare-fun b!714203 () Bool)

(assert (=> b!714203 (= e!401411 e!401410)))

(declare-fun c!78833 () Bool)

(assert (=> b!714203 (= c!78833 (validKeyInArray!0 (select (arr!19382 a!3591) from!2969)))))

(declare-fun b!714204 () Bool)

(assert (=> b!714204 (= e!401410 call!34599)))

(declare-fun bm!34596 () Bool)

(assert (=> bm!34596 (= call!34599 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78833 (Cons!13419 (select (arr!19382 a!3591) from!2969) acc!652) acc!652)))))

(assert (= (and d!98237 (not res!477268)) b!714200))

(assert (= (and b!714200 res!477269) b!714201))

(assert (= (and b!714200 res!477270) b!714203))

(assert (= (and b!714203 c!78833) b!714204))

(assert (= (and b!714203 (not c!78833)) b!714202))

(assert (= (or b!714204 b!714202) bm!34596))

(assert (=> b!714200 m!670747))

(assert (=> b!714200 m!670747))

(assert (=> b!714200 m!670749))

(assert (=> b!714201 m!670747))

(assert (=> b!714201 m!670747))

(declare-fun m!670801 () Bool)

(assert (=> b!714201 m!670801))

(assert (=> b!714203 m!670747))

(assert (=> b!714203 m!670747))

(assert (=> b!714203 m!670749))

(assert (=> bm!34596 m!670747))

(declare-fun m!670803 () Bool)

(assert (=> bm!34596 m!670803))

(assert (=> b!714128 d!98237))

(declare-fun d!98259 () Bool)

(declare-fun res!477295 () Bool)

(declare-fun e!401436 () Bool)

(assert (=> d!98259 (=> res!477295 e!401436)))

(assert (=> d!98259 (= res!477295 (= (select (arr!19382 a!3591) from!2969) k!2824))))

(assert (=> d!98259 (= (arrayContainsKey!0 a!3591 k!2824 from!2969) e!401436)))

(declare-fun b!714229 () Bool)

(declare-fun e!401437 () Bool)

(assert (=> b!714229 (= e!401436 e!401437)))

(declare-fun res!477296 () Bool)

(assert (=> b!714229 (=> (not res!477296) (not e!401437))))

(assert (=> b!714229 (= res!477296 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19793 a!3591)))))

(declare-fun b!714230 () Bool)

(assert (=> b!714230 (= e!401437 (arrayContainsKey!0 a!3591 k!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98259 (not res!477295)) b!714229))

(assert (= (and b!714229 res!477296) b!714230))

(assert (=> d!98259 m!670747))

(declare-fun m!670819 () Bool)

(assert (=> b!714230 m!670819))

(assert (=> b!714124 d!98259))

(declare-fun d!98269 () Bool)

(assert (=> d!98269 (= (array_inv!15178 a!3591) (bvsge (size!19793 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63380 d!98269))

(declare-fun d!98271 () Bool)

(assert (=> d!98271 (= (validKeyInArray!0 k!2824) (and (not (= k!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!714126 d!98271))

(declare-fun d!98273 () Bool)

(declare-fun res!477297 () Bool)

(declare-fun e!401438 () Bool)

(assert (=> d!98273 (=> res!477297 e!401438)))

(assert (=> d!98273 (= res!477297 (= (select (arr!19382 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k!2824))))

(assert (=> d!98273 (= (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!401438)))

(declare-fun b!714231 () Bool)

(declare-fun e!401439 () Bool)

(assert (=> b!714231 (= e!401438 e!401439)))

(declare-fun res!477298 () Bool)

(assert (=> b!714231 (=> (not res!477298) (not e!401439))))

(assert (=> b!714231 (= res!477298 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19793 a!3591)))))

(declare-fun b!714232 () Bool)

(assert (=> b!714232 (= e!401439 (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98273 (not res!477297)) b!714231))

(assert (= (and b!714231 res!477298) b!714232))

(declare-fun m!670821 () Bool)

(assert (=> d!98273 m!670821))

(declare-fun m!670823 () Bool)

(assert (=> b!714232 m!670823))

(assert (=> b!714136 d!98273))

(declare-fun d!98275 () Bool)

(declare-fun res!477315 () Bool)

(declare-fun e!401460 () Bool)

(assert (=> d!98275 (=> res!477315 e!401460)))

(assert (=> d!98275 (= res!477315 (is-Nil!13420 acc!652))))

(assert (=> d!98275 (= (noDuplicate!1247 acc!652) e!401460)))

(declare-fun b!714257 () Bool)

(declare-fun e!401461 () Bool)

(assert (=> b!714257 (= e!401460 e!401461)))

(declare-fun res!477316 () Bool)

(assert (=> b!714257 (=> (not res!477316) (not e!401461))))

(assert (=> b!714257 (= res!477316 (not (contains!4000 (t!19738 acc!652) (h!14464 acc!652))))))

(declare-fun b!714258 () Bool)

(assert (=> b!714258 (= e!401461 (noDuplicate!1247 (t!19738 acc!652)))))

(assert (= (and d!98275 (not res!477315)) b!714257))

(assert (= (and b!714257 res!477316) b!714258))

(declare-fun m!670825 () Bool)

(assert (=> b!714257 m!670825))

(declare-fun m!670827 () Bool)

(assert (=> b!714258 m!670827))

(assert (=> b!714125 d!98275))

(declare-fun d!98277 () Bool)

(declare-fun lt!318748 () Bool)

(assert (=> d!98277 (= lt!318748 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!365 acc!652)))))

(declare-fun e!401462 () Bool)

(assert (=> d!98277 (= lt!318748 e!401462)))

(declare-fun res!477318 () Bool)

(assert (=> d!98277 (=> (not res!477318) (not e!401462))))

(assert (=> d!98277 (= res!477318 (is-Cons!13419 acc!652))))

(assert (=> d!98277 (= (contains!4000 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318748)))

(declare-fun b!714259 () Bool)

(declare-fun e!401463 () Bool)

(assert (=> b!714259 (= e!401462 e!401463)))

(declare-fun res!477317 () Bool)

(assert (=> b!714259 (=> res!477317 e!401463)))

(assert (=> b!714259 (= res!477317 (= (h!14464 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!714260 () Bool)

(assert (=> b!714260 (= e!401463 (contains!4000 (t!19738 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98277 res!477318) b!714259))

(assert (= (and b!714259 (not res!477317)) b!714260))

(declare-fun m!670829 () Bool)

(assert (=> d!98277 m!670829))

(declare-fun m!670831 () Bool)

(assert (=> d!98277 m!670831))

(declare-fun m!670833 () Bool)

(assert (=> b!714260 m!670833))

(assert (=> b!714122 d!98277))

(declare-fun d!98279 () Bool)

(declare-fun lt!318749 () Bool)

(assert (=> d!98279 (= lt!318749 (member k!2824 (content!365 acc!652)))))

(declare-fun e!401464 () Bool)

(assert (=> d!98279 (= lt!318749 e!401464)))

(declare-fun res!477320 () Bool)

(assert (=> d!98279 (=> (not res!477320) (not e!401464))))

(assert (=> d!98279 (= res!477320 (is-Cons!13419 acc!652))))

(assert (=> d!98279 (= (contains!4000 acc!652 k!2824) lt!318749)))

(declare-fun b!714261 () Bool)

(declare-fun e!401465 () Bool)

(assert (=> b!714261 (= e!401464 e!401465)))

(declare-fun res!477319 () Bool)

(assert (=> b!714261 (=> res!477319 e!401465)))

(assert (=> b!714261 (= res!477319 (= (h!14464 acc!652) k!2824))))

(declare-fun b!714262 () Bool)

(assert (=> b!714262 (= e!401465 (contains!4000 (t!19738 acc!652) k!2824))))

(assert (= (and d!98279 res!477320) b!714261))

(assert (= (and b!714261 (not res!477319)) b!714262))

(assert (=> d!98279 m!670829))

(declare-fun m!670835 () Bool)

(assert (=> d!98279 m!670835))

(declare-fun m!670837 () Bool)

(assert (=> b!714262 m!670837))

(assert (=> b!714132 d!98279))

(declare-fun d!98281 () Bool)

(declare-fun lt!318750 () Bool)

(assert (=> d!98281 (= lt!318750 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!365 newAcc!49)))))

(declare-fun e!401466 () Bool)

(assert (=> d!98281 (= lt!318750 e!401466)))

(declare-fun res!477322 () Bool)

(assert (=> d!98281 (=> (not res!477322) (not e!401466))))

(assert (=> d!98281 (= res!477322 (is-Cons!13419 newAcc!49))))

(assert (=> d!98281 (= (contains!4000 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318750)))

(declare-fun b!714263 () Bool)

(declare-fun e!401467 () Bool)

(assert (=> b!714263 (= e!401466 e!401467)))

(declare-fun res!477321 () Bool)

(assert (=> b!714263 (=> res!477321 e!401467)))

(assert (=> b!714263 (= res!477321 (= (h!14464 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!714264 () Bool)

(assert (=> b!714264 (= e!401467 (contains!4000 (t!19738 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98281 res!477322) b!714263))

(assert (= (and b!714263 (not res!477321)) b!714264))

(assert (=> d!98281 m!670769))

(declare-fun m!670839 () Bool)

(assert (=> d!98281 m!670839))

(declare-fun m!670841 () Bool)

(assert (=> b!714264 m!670841))

(assert (=> b!714121 d!98281))

(declare-fun d!98283 () Bool)

(declare-fun lt!318751 () Bool)

(assert (=> d!98283 (= lt!318751 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!365 acc!652)))))

(declare-fun e!401468 () Bool)

(assert (=> d!98283 (= lt!318751 e!401468)))

(declare-fun res!477324 () Bool)

(assert (=> d!98283 (=> (not res!477324) (not e!401468))))

(assert (=> d!98283 (= res!477324 (is-Cons!13419 acc!652))))

(assert (=> d!98283 (= (contains!4000 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318751)))

(declare-fun b!714265 () Bool)

(declare-fun e!401469 () Bool)

(assert (=> b!714265 (= e!401468 e!401469)))

(declare-fun res!477323 () Bool)

(assert (=> b!714265 (=> res!477323 e!401469)))

(assert (=> b!714265 (= res!477323 (= (h!14464 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!714266 () Bool)

(assert (=> b!714266 (= e!401469 (contains!4000 (t!19738 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98283 res!477324) b!714265))

