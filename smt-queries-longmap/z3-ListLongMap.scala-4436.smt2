; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61594 () Bool)

(assert start!61594)

(declare-fun b!689716 () Bool)

(declare-fun res!454234 () Bool)

(declare-fun e!392667 () Bool)

(assert (=> b!689716 (=> (not res!454234) (not e!392667))))

(declare-datatypes ((array!39735 0))(
  ( (array!39736 (arr!19039 (Array (_ BitVec 32) (_ BitVec 64))) (size!19421 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39735)

(declare-datatypes ((List!13080 0))(
  ( (Nil!13077) (Cons!13076 (h!14121 (_ BitVec 64)) (t!19344 List!13080)) )
))
(declare-fun arrayNoDuplicates!0 (array!39735 (_ BitVec 32) List!13080) Bool)

(assert (=> b!689716 (= res!454234 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13077))))

(declare-fun b!689717 () Bool)

(declare-fun e!392668 () Bool)

(assert (=> b!689717 (= e!392667 (not e!392668))))

(declare-fun res!454232 () Bool)

(assert (=> b!689717 (=> res!454232 e!392668)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!689717 (= res!454232 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!316281 () List!13080)

(assert (=> b!689717 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316281)))

(declare-fun acc!681 () List!13080)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-datatypes ((Unit!24362 0))(
  ( (Unit!24363) )
))
(declare-fun lt!316275 () Unit!24362)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39735 (_ BitVec 64) (_ BitVec 32) List!13080 List!13080) Unit!24362)

(assert (=> b!689717 (= lt!316275 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!316281))))

(declare-fun -!208 (List!13080 (_ BitVec 64)) List!13080)

(assert (=> b!689717 (= (-!208 lt!316281 k0!2843) acc!681)))

(declare-fun $colon$colon!408 (List!13080 (_ BitVec 64)) List!13080)

(assert (=> b!689717 (= lt!316281 ($colon$colon!408 acc!681 k0!2843))))

(declare-fun lt!316276 () Unit!24362)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13080) Unit!24362)

(assert (=> b!689717 (= lt!316276 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!243 (List!13080 List!13080) Bool)

(assert (=> b!689717 (subseq!243 acc!681 acc!681)))

(declare-fun lt!316284 () Unit!24362)

(declare-fun lemmaListSubSeqRefl!0 (List!13080) Unit!24362)

(assert (=> b!689717 (= lt!316284 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!689717 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!316277 () Unit!24362)

(declare-fun e!392663 () Unit!24362)

(assert (=> b!689717 (= lt!316277 e!392663)))

(declare-fun c!78115 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!689717 (= c!78115 (validKeyInArray!0 (select (arr!19039 a!3626) from!3004)))))

(declare-fun lt!316285 () Unit!24362)

(declare-fun e!392669 () Unit!24362)

(assert (=> b!689717 (= lt!316285 e!392669)))

(declare-fun c!78116 () Bool)

(declare-fun arrayContainsKey!0 (array!39735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!689717 (= c!78116 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun lt!316279 () array!39735)

(assert (=> b!689717 (arrayContainsKey!0 lt!316279 k0!2843 from!3004)))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!689717 (= lt!316279 (array!39736 (store (arr!19039 a!3626) i!1382 k0!2843) (size!19421 a!3626)))))

(declare-fun b!689718 () Bool)

(declare-fun res!454239 () Bool)

(assert (=> b!689718 (=> res!454239 e!392668)))

(declare-fun noDuplicate!904 (List!13080) Bool)

(assert (=> b!689718 (= res!454239 (not (noDuplicate!904 lt!316281)))))

(declare-fun b!689719 () Bool)

(declare-fun e!392670 () Bool)

(declare-fun contains!3657 (List!13080 (_ BitVec 64)) Bool)

(assert (=> b!689719 (= e!392670 (contains!3657 lt!316281 k0!2843))))

(declare-fun b!689720 () Bool)

(declare-fun Unit!24364 () Unit!24362)

(assert (=> b!689720 (= e!392663 Unit!24364)))

(declare-fun b!689721 () Bool)

(declare-fun e!392664 () Bool)

(assert (=> b!689721 (= e!392664 (contains!3657 acc!681 k0!2843))))

(declare-fun b!689722 () Bool)

(declare-fun res!454225 () Bool)

(assert (=> b!689722 (=> (not res!454225) (not e!392667))))

(assert (=> b!689722 (= res!454225 (noDuplicate!904 acc!681))))

(declare-fun b!689723 () Bool)

(declare-fun res!454226 () Bool)

(assert (=> b!689723 (=> (not res!454226) (not e!392667))))

(assert (=> b!689723 (= res!454226 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19421 a!3626))))))

(declare-fun res!454221 () Bool)

(assert (=> start!61594 (=> (not res!454221) (not e!392667))))

(assert (=> start!61594 (= res!454221 (and (bvslt (size!19421 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19421 a!3626))))))

(assert (=> start!61594 e!392667))

(assert (=> start!61594 true))

(declare-fun array_inv!14835 (array!39735) Bool)

(assert (=> start!61594 (array_inv!14835 a!3626)))

(declare-fun b!689724 () Bool)

(declare-fun e!392661 () Bool)

(declare-fun e!392665 () Bool)

(assert (=> b!689724 (= e!392661 e!392665)))

(declare-fun res!454222 () Bool)

(assert (=> b!689724 (=> (not res!454222) (not e!392665))))

(assert (=> b!689724 (= res!454222 (bvsle from!3004 i!1382))))

(declare-fun b!689725 () Bool)

(declare-fun e!392660 () Bool)

(assert (=> b!689725 (= e!392660 (not (contains!3657 lt!316281 k0!2843)))))

(declare-fun b!689726 () Bool)

(declare-fun res!454236 () Bool)

(assert (=> b!689726 (=> (not res!454236) (not e!392667))))

(assert (=> b!689726 (= res!454236 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19421 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!689727 () Bool)

(declare-fun res!454240 () Bool)

(assert (=> b!689727 (=> (not res!454240) (not e!392667))))

(assert (=> b!689727 (= res!454240 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!689728 () Bool)

(declare-fun res!454230 () Bool)

(assert (=> b!689728 (=> (not res!454230) (not e!392667))))

(assert (=> b!689728 (= res!454230 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!689729 () Bool)

(declare-fun res!454231 () Bool)

(assert (=> b!689729 (=> (not res!454231) (not e!392667))))

(assert (=> b!689729 (= res!454231 e!392661)))

(declare-fun res!454233 () Bool)

(assert (=> b!689729 (=> res!454233 e!392661)))

(assert (=> b!689729 (= res!454233 e!392664)))

(declare-fun res!454235 () Bool)

(assert (=> b!689729 (=> (not res!454235) (not e!392664))))

(assert (=> b!689729 (= res!454235 (bvsgt from!3004 i!1382))))

(declare-fun b!689730 () Bool)

(declare-fun res!454237 () Bool)

(assert (=> b!689730 (=> (not res!454237) (not e!392667))))

(assert (=> b!689730 (= res!454237 (not (contains!3657 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689731 () Bool)

(declare-fun e!392666 () Bool)

(assert (=> b!689731 (= e!392666 e!392670)))

(declare-fun res!454220 () Bool)

(assert (=> b!689731 (=> res!454220 e!392670)))

(assert (=> b!689731 (= res!454220 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!689732 () Bool)

(declare-fun res!454224 () Bool)

(assert (=> b!689732 (=> res!454224 e!392668)))

(assert (=> b!689732 (= res!454224 e!392666)))

(declare-fun res!454223 () Bool)

(assert (=> b!689732 (=> (not res!454223) (not e!392666))))

(assert (=> b!689732 (= res!454223 e!392660)))

(declare-fun res!454227 () Bool)

(assert (=> b!689732 (=> res!454227 e!392660)))

(assert (=> b!689732 (= res!454227 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!689733 () Bool)

(declare-fun res!454241 () Bool)

(assert (=> b!689733 (=> (not res!454241) (not e!392667))))

(assert (=> b!689733 (= res!454241 (validKeyInArray!0 k0!2843))))

(declare-fun b!689734 () Bool)

(declare-fun Unit!24365 () Unit!24362)

(assert (=> b!689734 (= e!392669 Unit!24365)))

(declare-fun b!689735 () Bool)

(assert (=> b!689735 (= e!392668 (arrayNoDuplicates!0 lt!316279 from!3004 acc!681))))

(assert (=> b!689735 (arrayNoDuplicates!0 lt!316279 (bvadd #b00000000000000000000000000000001 from!3004) lt!316281)))

(declare-fun lt!316278 () Unit!24362)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39735 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13080) Unit!24362)

(assert (=> b!689735 (= lt!316278 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!316281))))

(declare-fun b!689736 () Bool)

(declare-fun lt!316280 () Unit!24362)

(assert (=> b!689736 (= e!392663 lt!316280)))

(declare-fun lt!316283 () Unit!24362)

(assert (=> b!689736 (= lt!316283 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!689736 (subseq!243 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39735 List!13080 List!13080 (_ BitVec 32)) Unit!24362)

(assert (=> b!689736 (= lt!316280 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!408 acc!681 (select (arr!19039 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!689736 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!689737 () Bool)

(declare-fun Unit!24366 () Unit!24362)

(assert (=> b!689737 (= e!392669 Unit!24366)))

(declare-fun lt!316282 () Unit!24362)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39735 (_ BitVec 64) (_ BitVec 32)) Unit!24362)

(assert (=> b!689737 (= lt!316282 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!689737 false))

(declare-fun b!689738 () Bool)

(assert (=> b!689738 (= e!392665 (not (contains!3657 acc!681 k0!2843)))))

(declare-fun b!689739 () Bool)

(declare-fun res!454238 () Bool)

(assert (=> b!689739 (=> res!454238 e!392668)))

(assert (=> b!689739 (= res!454238 (contains!3657 lt!316281 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689740 () Bool)

(declare-fun res!454228 () Bool)

(assert (=> b!689740 (=> res!454228 e!392668)))

(assert (=> b!689740 (= res!454228 (contains!3657 lt!316281 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689741 () Bool)

(declare-fun res!454229 () Bool)

(assert (=> b!689741 (=> (not res!454229) (not e!392667))))

(assert (=> b!689741 (= res!454229 (not (contains!3657 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!61594 res!454221) b!689722))

(assert (= (and b!689722 res!454225) b!689741))

(assert (= (and b!689741 res!454229) b!689730))

(assert (= (and b!689730 res!454237) b!689729))

(assert (= (and b!689729 res!454235) b!689721))

(assert (= (and b!689729 (not res!454233)) b!689724))

(assert (= (and b!689724 res!454222) b!689738))

(assert (= (and b!689729 res!454231) b!689716))

(assert (= (and b!689716 res!454234) b!689727))

(assert (= (and b!689727 res!454240) b!689723))

(assert (= (and b!689723 res!454226) b!689733))

(assert (= (and b!689733 res!454241) b!689728))

(assert (= (and b!689728 res!454230) b!689726))

(assert (= (and b!689726 res!454236) b!689717))

(assert (= (and b!689717 c!78116) b!689737))

(assert (= (and b!689717 (not c!78116)) b!689734))

(assert (= (and b!689717 c!78115) b!689736))

(assert (= (and b!689717 (not c!78115)) b!689720))

(assert (= (and b!689717 (not res!454232)) b!689718))

(assert (= (and b!689718 (not res!454239)) b!689740))

(assert (= (and b!689740 (not res!454228)) b!689739))

(assert (= (and b!689739 (not res!454238)) b!689732))

(assert (= (and b!689732 (not res!454227)) b!689725))

(assert (= (and b!689732 res!454223) b!689731))

(assert (= (and b!689731 (not res!454220)) b!689719))

(assert (= (and b!689732 (not res!454224)) b!689735))

(declare-fun m!653319 () Bool)

(assert (=> b!689716 m!653319))

(declare-fun m!653321 () Bool)

(assert (=> b!689735 m!653321))

(declare-fun m!653323 () Bool)

(assert (=> b!689735 m!653323))

(declare-fun m!653325 () Bool)

(assert (=> b!689735 m!653325))

(declare-fun m!653327 () Bool)

(assert (=> b!689728 m!653327))

(declare-fun m!653329 () Bool)

(assert (=> b!689725 m!653329))

(declare-fun m!653331 () Bool)

(assert (=> b!689740 m!653331))

(declare-fun m!653333 () Bool)

(assert (=> start!61594 m!653333))

(declare-fun m!653335 () Bool)

(assert (=> b!689736 m!653335))

(declare-fun m!653337 () Bool)

(assert (=> b!689736 m!653337))

(declare-fun m!653339 () Bool)

(assert (=> b!689736 m!653339))

(declare-fun m!653341 () Bool)

(assert (=> b!689736 m!653341))

(assert (=> b!689736 m!653337))

(assert (=> b!689736 m!653339))

(declare-fun m!653343 () Bool)

(assert (=> b!689736 m!653343))

(declare-fun m!653345 () Bool)

(assert (=> b!689736 m!653345))

(declare-fun m!653347 () Bool)

(assert (=> b!689718 m!653347))

(assert (=> b!689719 m!653329))

(declare-fun m!653349 () Bool)

(assert (=> b!689717 m!653349))

(assert (=> b!689717 m!653337))

(declare-fun m!653351 () Bool)

(assert (=> b!689717 m!653351))

(declare-fun m!653353 () Bool)

(assert (=> b!689717 m!653353))

(declare-fun m!653355 () Bool)

(assert (=> b!689717 m!653355))

(assert (=> b!689717 m!653343))

(declare-fun m!653357 () Bool)

(assert (=> b!689717 m!653357))

(declare-fun m!653359 () Bool)

(assert (=> b!689717 m!653359))

(assert (=> b!689717 m!653337))

(declare-fun m!653361 () Bool)

(assert (=> b!689717 m!653361))

(assert (=> b!689717 m!653345))

(declare-fun m!653363 () Bool)

(assert (=> b!689717 m!653363))

(assert (=> b!689717 m!653335))

(declare-fun m!653365 () Bool)

(assert (=> b!689717 m!653365))

(declare-fun m!653367 () Bool)

(assert (=> b!689722 m!653367))

(declare-fun m!653369 () Bool)

(assert (=> b!689737 m!653369))

(declare-fun m!653371 () Bool)

(assert (=> b!689738 m!653371))

(declare-fun m!653373 () Bool)

(assert (=> b!689741 m!653373))

(declare-fun m!653375 () Bool)

(assert (=> b!689730 m!653375))

(declare-fun m!653377 () Bool)

(assert (=> b!689727 m!653377))

(declare-fun m!653379 () Bool)

(assert (=> b!689739 m!653379))

(assert (=> b!689721 m!653371))

(declare-fun m!653381 () Bool)

(assert (=> b!689733 m!653381))

(check-sat (not b!689733) (not b!689717) (not b!689741) (not b!689722) (not b!689736) (not b!689721) (not b!689728) (not b!689727) (not start!61594) (not b!689730) (not b!689740) (not b!689718) (not b!689735) (not b!689725) (not b!689716) (not b!689738) (not b!689739) (not b!689719) (not b!689737))
(check-sat)
(get-model)

(declare-fun b!689831 () Bool)

(declare-fun e!392714 () Bool)

(declare-fun e!392712 () Bool)

(assert (=> b!689831 (= e!392714 e!392712)))

(declare-fun res!454316 () Bool)

(assert (=> b!689831 (=> (not res!454316) (not e!392712))))

(declare-fun e!392713 () Bool)

(assert (=> b!689831 (= res!454316 (not e!392713))))

(declare-fun res!454315 () Bool)

(assert (=> b!689831 (=> (not res!454315) (not e!392713))))

(assert (=> b!689831 (= res!454315 (validKeyInArray!0 (select (arr!19039 lt!316279) from!3004)))))

(declare-fun b!689832 () Bool)

(declare-fun e!392715 () Bool)

(declare-fun call!34184 () Bool)

(assert (=> b!689832 (= e!392715 call!34184)))

(declare-fun b!689833 () Bool)

(assert (=> b!689833 (= e!392712 e!392715)))

(declare-fun c!78125 () Bool)

(assert (=> b!689833 (= c!78125 (validKeyInArray!0 (select (arr!19039 lt!316279) from!3004)))))

(declare-fun b!689830 () Bool)

(assert (=> b!689830 (= e!392713 (contains!3657 acc!681 (select (arr!19039 lt!316279) from!3004)))))

(declare-fun d!95249 () Bool)

(declare-fun res!454314 () Bool)

(assert (=> d!95249 (=> res!454314 e!392714)))

(assert (=> d!95249 (= res!454314 (bvsge from!3004 (size!19421 lt!316279)))))

(assert (=> d!95249 (= (arrayNoDuplicates!0 lt!316279 from!3004 acc!681) e!392714)))

(declare-fun b!689834 () Bool)

(assert (=> b!689834 (= e!392715 call!34184)))

(declare-fun bm!34181 () Bool)

(assert (=> bm!34181 (= call!34184 (arrayNoDuplicates!0 lt!316279 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78125 (Cons!13076 (select (arr!19039 lt!316279) from!3004) acc!681) acc!681)))))

(assert (= (and d!95249 (not res!454314)) b!689831))

(assert (= (and b!689831 res!454315) b!689830))

(assert (= (and b!689831 res!454316) b!689833))

(assert (= (and b!689833 c!78125) b!689832))

(assert (= (and b!689833 (not c!78125)) b!689834))

(assert (= (or b!689832 b!689834) bm!34181))

(declare-fun m!653447 () Bool)

(assert (=> b!689831 m!653447))

(assert (=> b!689831 m!653447))

(declare-fun m!653449 () Bool)

(assert (=> b!689831 m!653449))

(assert (=> b!689833 m!653447))

(assert (=> b!689833 m!653447))

(assert (=> b!689833 m!653449))

(assert (=> b!689830 m!653447))

(assert (=> b!689830 m!653447))

(declare-fun m!653451 () Bool)

(assert (=> b!689830 m!653451))

(assert (=> bm!34181 m!653447))

(declare-fun m!653453 () Bool)

(assert (=> bm!34181 m!653453))

(assert (=> b!689735 d!95249))

(declare-fun b!689836 () Bool)

(declare-fun e!392718 () Bool)

(declare-fun e!392716 () Bool)

(assert (=> b!689836 (= e!392718 e!392716)))

(declare-fun res!454319 () Bool)

(assert (=> b!689836 (=> (not res!454319) (not e!392716))))

(declare-fun e!392717 () Bool)

(assert (=> b!689836 (= res!454319 (not e!392717))))

(declare-fun res!454318 () Bool)

(assert (=> b!689836 (=> (not res!454318) (not e!392717))))

(assert (=> b!689836 (= res!454318 (validKeyInArray!0 (select (arr!19039 lt!316279) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!689837 () Bool)

(declare-fun e!392719 () Bool)

(declare-fun call!34185 () Bool)

(assert (=> b!689837 (= e!392719 call!34185)))

(declare-fun b!689838 () Bool)

(assert (=> b!689838 (= e!392716 e!392719)))

(declare-fun c!78126 () Bool)

(assert (=> b!689838 (= c!78126 (validKeyInArray!0 (select (arr!19039 lt!316279) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!689835 () Bool)

(assert (=> b!689835 (= e!392717 (contains!3657 lt!316281 (select (arr!19039 lt!316279) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!95251 () Bool)

(declare-fun res!454317 () Bool)

(assert (=> d!95251 (=> res!454317 e!392718)))

(assert (=> d!95251 (= res!454317 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19421 lt!316279)))))

(assert (=> d!95251 (= (arrayNoDuplicates!0 lt!316279 (bvadd #b00000000000000000000000000000001 from!3004) lt!316281) e!392718)))

(declare-fun b!689839 () Bool)

(assert (=> b!689839 (= e!392719 call!34185)))

(declare-fun bm!34182 () Bool)

(assert (=> bm!34182 (= call!34185 (arrayNoDuplicates!0 lt!316279 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!78126 (Cons!13076 (select (arr!19039 lt!316279) (bvadd #b00000000000000000000000000000001 from!3004)) lt!316281) lt!316281)))))

(assert (= (and d!95251 (not res!454317)) b!689836))

(assert (= (and b!689836 res!454318) b!689835))

(assert (= (and b!689836 res!454319) b!689838))

(assert (= (and b!689838 c!78126) b!689837))

(assert (= (and b!689838 (not c!78126)) b!689839))

(assert (= (or b!689837 b!689839) bm!34182))

(declare-fun m!653455 () Bool)

(assert (=> b!689836 m!653455))

(assert (=> b!689836 m!653455))

(declare-fun m!653457 () Bool)

(assert (=> b!689836 m!653457))

(assert (=> b!689838 m!653455))

(assert (=> b!689838 m!653455))

(assert (=> b!689838 m!653457))

(assert (=> b!689835 m!653455))

(assert (=> b!689835 m!653455))

(declare-fun m!653459 () Bool)

(assert (=> b!689835 m!653459))

(assert (=> bm!34182 m!653455))

(declare-fun m!653461 () Bool)

(assert (=> bm!34182 m!653461))

(assert (=> b!689735 d!95251))

(declare-fun d!95253 () Bool)

(declare-fun e!392726 () Bool)

(assert (=> d!95253 e!392726))

(declare-fun res!454326 () Bool)

(assert (=> d!95253 (=> (not res!454326) (not e!392726))))

(assert (=> d!95253 (= res!454326 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19421 a!3626))))))

(declare-fun lt!316323 () Unit!24362)

(declare-fun choose!41 (array!39735 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13080) Unit!24362)

(assert (=> d!95253 (= lt!316323 (choose!41 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!316281))))

(assert (=> d!95253 (bvslt (size!19421 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!95253 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!316281) lt!316323)))

(declare-fun b!689846 () Bool)

(assert (=> b!689846 (= e!392726 (arrayNoDuplicates!0 (array!39736 (store (arr!19039 a!3626) i!1382 k0!2843) (size!19421 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!316281))))

(assert (= (and d!95253 res!454326) b!689846))

(declare-fun m!653463 () Bool)

(assert (=> d!95253 m!653463))

(assert (=> b!689846 m!653355))

(declare-fun m!653465 () Bool)

(assert (=> b!689846 m!653465))

(assert (=> b!689735 d!95253))

(declare-fun d!95257 () Bool)

(declare-fun res!454333 () Bool)

(declare-fun e!392733 () Bool)

(assert (=> d!95257 (=> res!454333 e!392733)))

(get-info :version)

(assert (=> d!95257 (= res!454333 ((_ is Nil!13077) acc!681))))

(assert (=> d!95257 (= (noDuplicate!904 acc!681) e!392733)))

(declare-fun b!689853 () Bool)

(declare-fun e!392734 () Bool)

(assert (=> b!689853 (= e!392733 e!392734)))

(declare-fun res!454334 () Bool)

(assert (=> b!689853 (=> (not res!454334) (not e!392734))))

(assert (=> b!689853 (= res!454334 (not (contains!3657 (t!19344 acc!681) (h!14121 acc!681))))))

(declare-fun b!689854 () Bool)

(assert (=> b!689854 (= e!392734 (noDuplicate!904 (t!19344 acc!681)))))

(assert (= (and d!95257 (not res!454333)) b!689853))

(assert (= (and b!689853 res!454334) b!689854))

(declare-fun m!653473 () Bool)

(assert (=> b!689853 m!653473))

(declare-fun m!653475 () Bool)

(assert (=> b!689854 m!653475))

(assert (=> b!689722 d!95257))

(declare-fun d!95261 () Bool)

(assert (=> d!95261 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!689733 d!95261))

(declare-fun d!95271 () Bool)

(declare-fun lt!316335 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!305 (List!13080) (InoxSet (_ BitVec 64)))

(assert (=> d!95271 (= lt!316335 (select (content!305 acc!681) k0!2843))))

(declare-fun e!392755 () Bool)

(assert (=> d!95271 (= lt!316335 e!392755)))

(declare-fun res!454355 () Bool)

(assert (=> d!95271 (=> (not res!454355) (not e!392755))))

(assert (=> d!95271 (= res!454355 ((_ is Cons!13076) acc!681))))

(assert (=> d!95271 (= (contains!3657 acc!681 k0!2843) lt!316335)))

(declare-fun b!689875 () Bool)

(declare-fun e!392756 () Bool)

(assert (=> b!689875 (= e!392755 e!392756)))

(declare-fun res!454356 () Bool)

(assert (=> b!689875 (=> res!454356 e!392756)))

(assert (=> b!689875 (= res!454356 (= (h!14121 acc!681) k0!2843))))

(declare-fun b!689876 () Bool)

(assert (=> b!689876 (= e!392756 (contains!3657 (t!19344 acc!681) k0!2843))))

(assert (= (and d!95271 res!454355) b!689875))

(assert (= (and b!689875 (not res!454356)) b!689876))

(declare-fun m!653499 () Bool)

(assert (=> d!95271 m!653499))

(declare-fun m!653501 () Bool)

(assert (=> d!95271 m!653501))

(declare-fun m!653503 () Bool)

(assert (=> b!689876 m!653503))

(assert (=> b!689721 d!95271))

(declare-fun d!95279 () Bool)

(declare-fun lt!316336 () Bool)

(assert (=> d!95279 (= lt!316336 (select (content!305 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!392757 () Bool)

(assert (=> d!95279 (= lt!316336 e!392757)))

(declare-fun res!454357 () Bool)

(assert (=> d!95279 (=> (not res!454357) (not e!392757))))

(assert (=> d!95279 (= res!454357 ((_ is Cons!13076) acc!681))))

(assert (=> d!95279 (= (contains!3657 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316336)))

(declare-fun b!689877 () Bool)

(declare-fun e!392758 () Bool)

(assert (=> b!689877 (= e!392757 e!392758)))

(declare-fun res!454358 () Bool)

(assert (=> b!689877 (=> res!454358 e!392758)))

(assert (=> b!689877 (= res!454358 (= (h!14121 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689878 () Bool)

(assert (=> b!689878 (= e!392758 (contains!3657 (t!19344 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95279 res!454357) b!689877))

(assert (= (and b!689877 (not res!454358)) b!689878))

(assert (=> d!95279 m!653499))

(declare-fun m!653505 () Bool)

(assert (=> d!95279 m!653505))

(declare-fun m!653507 () Bool)

(assert (=> b!689878 m!653507))

(assert (=> b!689730 d!95279))

(declare-fun d!95283 () Bool)

(declare-fun lt!316337 () Bool)

(assert (=> d!95283 (= lt!316337 (select (content!305 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!392759 () Bool)

(assert (=> d!95283 (= lt!316337 e!392759)))

(declare-fun res!454359 () Bool)

(assert (=> d!95283 (=> (not res!454359) (not e!392759))))

(assert (=> d!95283 (= res!454359 ((_ is Cons!13076) acc!681))))

(assert (=> d!95283 (= (contains!3657 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316337)))

(declare-fun b!689879 () Bool)

(declare-fun e!392760 () Bool)

(assert (=> b!689879 (= e!392759 e!392760)))

(declare-fun res!454360 () Bool)

(assert (=> b!689879 (=> res!454360 e!392760)))

(assert (=> b!689879 (= res!454360 (= (h!14121 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689880 () Bool)

(assert (=> b!689880 (= e!392760 (contains!3657 (t!19344 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95283 res!454359) b!689879))

(assert (= (and b!689879 (not res!454360)) b!689880))

(assert (=> d!95283 m!653499))

(declare-fun m!653509 () Bool)

(assert (=> d!95283 m!653509))

(declare-fun m!653511 () Bool)

(assert (=> b!689880 m!653511))

(assert (=> b!689741 d!95283))

(declare-fun d!95285 () Bool)

(declare-fun res!454361 () Bool)

(declare-fun e!392761 () Bool)

(assert (=> d!95285 (=> res!454361 e!392761)))

(assert (=> d!95285 (= res!454361 ((_ is Nil!13077) lt!316281))))

(assert (=> d!95285 (= (noDuplicate!904 lt!316281) e!392761)))

(declare-fun b!689881 () Bool)

(declare-fun e!392762 () Bool)

(assert (=> b!689881 (= e!392761 e!392762)))

(declare-fun res!454362 () Bool)

(assert (=> b!689881 (=> (not res!454362) (not e!392762))))

(assert (=> b!689881 (= res!454362 (not (contains!3657 (t!19344 lt!316281) (h!14121 lt!316281))))))

(declare-fun b!689882 () Bool)

(assert (=> b!689882 (= e!392762 (noDuplicate!904 (t!19344 lt!316281)))))

(assert (= (and d!95285 (not res!454361)) b!689881))

(assert (= (and b!689881 res!454362) b!689882))

(declare-fun m!653513 () Bool)

(assert (=> b!689881 m!653513))

(declare-fun m!653515 () Bool)

(assert (=> b!689882 m!653515))

(assert (=> b!689718 d!95285))

(declare-fun d!95287 () Bool)

(declare-fun lt!316338 () Bool)

(assert (=> d!95287 (= lt!316338 (select (content!305 lt!316281) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!392763 () Bool)

(assert (=> d!95287 (= lt!316338 e!392763)))

(declare-fun res!454363 () Bool)

(assert (=> d!95287 (=> (not res!454363) (not e!392763))))

(assert (=> d!95287 (= res!454363 ((_ is Cons!13076) lt!316281))))

(assert (=> d!95287 (= (contains!3657 lt!316281 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316338)))

(declare-fun b!689883 () Bool)

(declare-fun e!392764 () Bool)

(assert (=> b!689883 (= e!392763 e!392764)))

(declare-fun res!454364 () Bool)

(assert (=> b!689883 (=> res!454364 e!392764)))

(assert (=> b!689883 (= res!454364 (= (h!14121 lt!316281) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689884 () Bool)

(assert (=> b!689884 (= e!392764 (contains!3657 (t!19344 lt!316281) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95287 res!454363) b!689883))

(assert (= (and b!689883 (not res!454364)) b!689884))

(declare-fun m!653517 () Bool)

(assert (=> d!95287 m!653517))

(declare-fun m!653519 () Bool)

(assert (=> d!95287 m!653519))

(declare-fun m!653521 () Bool)

(assert (=> b!689884 m!653521))

(assert (=> b!689740 d!95287))

(declare-fun d!95289 () Bool)

(declare-fun lt!316339 () Bool)

(assert (=> d!95289 (= lt!316339 (select (content!305 lt!316281) k0!2843))))

(declare-fun e!392765 () Bool)

(assert (=> d!95289 (= lt!316339 e!392765)))

(declare-fun res!454365 () Bool)

(assert (=> d!95289 (=> (not res!454365) (not e!392765))))

(assert (=> d!95289 (= res!454365 ((_ is Cons!13076) lt!316281))))

(assert (=> d!95289 (= (contains!3657 lt!316281 k0!2843) lt!316339)))

(declare-fun b!689885 () Bool)

(declare-fun e!392766 () Bool)

(assert (=> b!689885 (= e!392765 e!392766)))

(declare-fun res!454366 () Bool)

(assert (=> b!689885 (=> res!454366 e!392766)))

(assert (=> b!689885 (= res!454366 (= (h!14121 lt!316281) k0!2843))))

(declare-fun b!689886 () Bool)

(assert (=> b!689886 (= e!392766 (contains!3657 (t!19344 lt!316281) k0!2843))))

(assert (= (and d!95289 res!454365) b!689885))

(assert (= (and b!689885 (not res!454366)) b!689886))

(assert (=> d!95289 m!653517))

(declare-fun m!653523 () Bool)

(assert (=> d!95289 m!653523))

(declare-fun m!653525 () Bool)

(assert (=> b!689886 m!653525))

(assert (=> b!689719 d!95289))

(assert (=> b!689738 d!95271))

(declare-fun b!689924 () Bool)

(declare-fun e!392797 () List!13080)

(assert (=> b!689924 (= e!392797 Nil!13077)))

(declare-fun b!689925 () Bool)

(declare-fun e!392798 () List!13080)

(declare-fun call!34191 () List!13080)

(assert (=> b!689925 (= e!392798 call!34191)))

(declare-fun e!392796 () Bool)

(declare-fun lt!316350 () List!13080)

(declare-fun b!689926 () Bool)

(assert (=> b!689926 (= e!392796 (= (content!305 lt!316350) ((_ map and) (content!305 lt!316281) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2843 true)))))))

(declare-fun b!689927 () Bool)

(assert (=> b!689927 (= e!392797 e!392798)))

(declare-fun c!78138 () Bool)

(assert (=> b!689927 (= c!78138 (= k0!2843 (h!14121 lt!316281)))))

(declare-fun b!689928 () Bool)

(assert (=> b!689928 (= e!392798 (Cons!13076 (h!14121 lt!316281) call!34191))))

(declare-fun d!95291 () Bool)

(assert (=> d!95291 e!392796))

(declare-fun res!454384 () Bool)

(assert (=> d!95291 (=> (not res!454384) (not e!392796))))

(declare-fun size!19424 (List!13080) Int)

(assert (=> d!95291 (= res!454384 (<= (size!19424 lt!316350) (size!19424 lt!316281)))))

(assert (=> d!95291 (= lt!316350 e!392797)))

(declare-fun c!78137 () Bool)

(assert (=> d!95291 (= c!78137 ((_ is Cons!13076) lt!316281))))

(assert (=> d!95291 (= (-!208 lt!316281 k0!2843) lt!316350)))

(declare-fun bm!34188 () Bool)

(assert (=> bm!34188 (= call!34191 (-!208 (t!19344 lt!316281) k0!2843))))

(assert (= (and d!95291 c!78137) b!689927))

(assert (= (and d!95291 (not c!78137)) b!689924))

(assert (= (and b!689927 c!78138) b!689925))

(assert (= (and b!689927 (not c!78138)) b!689928))

(assert (= (or b!689925 b!689928) bm!34188))

(assert (= (and d!95291 res!454384) b!689926))

(declare-fun m!653547 () Bool)

(assert (=> b!689926 m!653547))

(assert (=> b!689926 m!653517))

(declare-fun m!653549 () Bool)

(assert (=> b!689926 m!653549))

(declare-fun m!653551 () Bool)

(assert (=> d!95291 m!653551))

(declare-fun m!653553 () Bool)

(assert (=> d!95291 m!653553))

(declare-fun m!653555 () Bool)

(assert (=> bm!34188 m!653555))

(assert (=> b!689717 d!95291))

(declare-fun d!95301 () Bool)

(assert (=> d!95301 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316281)))

(declare-fun lt!316354 () Unit!24362)

(declare-fun choose!66 (array!39735 (_ BitVec 64) (_ BitVec 32) List!13080 List!13080) Unit!24362)

(assert (=> d!95301 (= lt!316354 (choose!66 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!316281))))

(assert (=> d!95301 (bvslt (size!19421 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!95301 (= (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!316281) lt!316354)))

(declare-fun bs!20209 () Bool)

(assert (= bs!20209 d!95301))

(assert (=> bs!20209 m!653365))

(declare-fun m!653557 () Bool)

(assert (=> bs!20209 m!653557))

(assert (=> b!689717 d!95301))

(declare-fun d!95303 () Bool)

(declare-fun res!454422 () Bool)

(declare-fun e!392846 () Bool)

(assert (=> d!95303 (=> res!454422 e!392846)))

(assert (=> d!95303 (= res!454422 ((_ is Nil!13077) acc!681))))

(assert (=> d!95303 (= (subseq!243 acc!681 acc!681) e!392846)))

(declare-fun b!689983 () Bool)

(declare-fun e!392844 () Bool)

(assert (=> b!689983 (= e!392844 (subseq!243 acc!681 (t!19344 acc!681)))))

(declare-fun b!689980 () Bool)

(declare-fun e!392845 () Bool)

(assert (=> b!689980 (= e!392846 e!392845)))

(declare-fun res!454424 () Bool)

(assert (=> b!689980 (=> (not res!454424) (not e!392845))))

(assert (=> b!689980 (= res!454424 ((_ is Cons!13076) acc!681))))

(declare-fun b!689982 () Bool)

(declare-fun e!392843 () Bool)

(assert (=> b!689982 (= e!392843 (subseq!243 (t!19344 acc!681) (t!19344 acc!681)))))

(declare-fun b!689981 () Bool)

(assert (=> b!689981 (= e!392845 e!392844)))

(declare-fun res!454425 () Bool)

(assert (=> b!689981 (=> res!454425 e!392844)))

(assert (=> b!689981 (= res!454425 e!392843)))

(declare-fun res!454423 () Bool)

(assert (=> b!689981 (=> (not res!454423) (not e!392843))))

(assert (=> b!689981 (= res!454423 (= (h!14121 acc!681) (h!14121 acc!681)))))

(assert (= (and d!95303 (not res!454422)) b!689980))

(assert (= (and b!689980 res!454424) b!689981))

(assert (= (and b!689981 res!454423) b!689982))

(assert (= (and b!689981 (not res!454425)) b!689983))

(declare-fun m!653579 () Bool)

(assert (=> b!689983 m!653579))

(declare-fun m!653581 () Bool)

(assert (=> b!689982 m!653581))

(assert (=> b!689717 d!95303))

(declare-fun b!689985 () Bool)

(declare-fun e!392849 () Bool)

(declare-fun e!392847 () Bool)

(assert (=> b!689985 (= e!392849 e!392847)))

(declare-fun res!454428 () Bool)

(assert (=> b!689985 (=> (not res!454428) (not e!392847))))

(declare-fun e!392848 () Bool)

(assert (=> b!689985 (= res!454428 (not e!392848))))

(declare-fun res!454427 () Bool)

(assert (=> b!689985 (=> (not res!454427) (not e!392848))))

(assert (=> b!689985 (= res!454427 (validKeyInArray!0 (select (arr!19039 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!689986 () Bool)

(declare-fun e!392850 () Bool)

(declare-fun call!34199 () Bool)

(assert (=> b!689986 (= e!392850 call!34199)))

(declare-fun b!689987 () Bool)

(assert (=> b!689987 (= e!392847 e!392850)))

(declare-fun c!78146 () Bool)

(assert (=> b!689987 (= c!78146 (validKeyInArray!0 (select (arr!19039 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!689984 () Bool)

(assert (=> b!689984 (= e!392848 (contains!3657 lt!316281 (select (arr!19039 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!95309 () Bool)

(declare-fun res!454426 () Bool)

(assert (=> d!95309 (=> res!454426 e!392849)))

(assert (=> d!95309 (= res!454426 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19421 a!3626)))))

(assert (=> d!95309 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316281) e!392849)))

(declare-fun b!689988 () Bool)

(assert (=> b!689988 (= e!392850 call!34199)))

(declare-fun bm!34196 () Bool)

(assert (=> bm!34196 (= call!34199 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!78146 (Cons!13076 (select (arr!19039 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) lt!316281) lt!316281)))))

(assert (= (and d!95309 (not res!454426)) b!689985))

(assert (= (and b!689985 res!454427) b!689984))

(assert (= (and b!689985 res!454428) b!689987))

(assert (= (and b!689987 c!78146) b!689986))

(assert (= (and b!689987 (not c!78146)) b!689988))

(assert (= (or b!689986 b!689988) bm!34196))

(declare-fun m!653587 () Bool)

(assert (=> b!689985 m!653587))

(assert (=> b!689985 m!653587))

(declare-fun m!653589 () Bool)

(assert (=> b!689985 m!653589))

(assert (=> b!689987 m!653587))

(assert (=> b!689987 m!653587))

(assert (=> b!689987 m!653589))

(assert (=> b!689984 m!653587))

(assert (=> b!689984 m!653587))

(declare-fun m!653595 () Bool)

(assert (=> b!689984 m!653595))

(assert (=> bm!34196 m!653587))

(declare-fun m!653603 () Bool)

(assert (=> bm!34196 m!653603))

(assert (=> b!689717 d!95309))

(declare-fun d!95315 () Bool)

(declare-fun res!454440 () Bool)

(declare-fun e!392863 () Bool)

(assert (=> d!95315 (=> res!454440 e!392863)))

(assert (=> d!95315 (= res!454440 (= (select (arr!19039 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!95315 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!392863)))

(declare-fun b!690002 () Bool)

(declare-fun e!392864 () Bool)

(assert (=> b!690002 (= e!392863 e!392864)))

(declare-fun res!454441 () Bool)

(assert (=> b!690002 (=> (not res!454441) (not e!392864))))

(assert (=> b!690002 (= res!454441 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19421 a!3626)))))

(declare-fun b!690003 () Bool)

(assert (=> b!690003 (= e!392864 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95315 (not res!454440)) b!690002))

(assert (= (and b!690002 res!454441) b!690003))

(assert (=> d!95315 m!653587))

(declare-fun m!653609 () Bool)

(assert (=> b!690003 m!653609))

(assert (=> b!689717 d!95315))

(declare-fun d!95321 () Bool)

(declare-fun res!454442 () Bool)

(declare-fun e!392865 () Bool)

(assert (=> d!95321 (=> res!454442 e!392865)))

(assert (=> d!95321 (= res!454442 (= (select (arr!19039 lt!316279) from!3004) k0!2843))))

(assert (=> d!95321 (= (arrayContainsKey!0 lt!316279 k0!2843 from!3004) e!392865)))

(declare-fun b!690004 () Bool)

(declare-fun e!392866 () Bool)

(assert (=> b!690004 (= e!392865 e!392866)))

(declare-fun res!454443 () Bool)

(assert (=> b!690004 (=> (not res!454443) (not e!392866))))

(assert (=> b!690004 (= res!454443 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19421 lt!316279)))))

(declare-fun b!690005 () Bool)

(assert (=> b!690005 (= e!392866 (arrayContainsKey!0 lt!316279 k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95321 (not res!454442)) b!690004))

(assert (= (and b!690004 res!454443) b!690005))

(assert (=> d!95321 m!653447))

(declare-fun m!653611 () Bool)

(assert (=> b!690005 m!653611))

(assert (=> b!689717 d!95321))

(declare-fun d!95323 () Bool)

(assert (=> d!95323 (= (-!208 ($colon$colon!408 acc!681 k0!2843) k0!2843) acc!681)))

(declare-fun lt!316363 () Unit!24362)

(declare-fun choose!16 ((_ BitVec 64) List!13080) Unit!24362)

(assert (=> d!95323 (= lt!316363 (choose!16 k0!2843 acc!681))))

(assert (=> d!95323 (not (contains!3657 acc!681 k0!2843))))

(assert (=> d!95323 (= (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681) lt!316363)))

(declare-fun bs!20211 () Bool)

(assert (= bs!20211 d!95323))

(assert (=> bs!20211 m!653359))

(assert (=> bs!20211 m!653359))

(declare-fun m!653625 () Bool)

(assert (=> bs!20211 m!653625))

(declare-fun m!653629 () Bool)

(assert (=> bs!20211 m!653629))

(assert (=> bs!20211 m!653371))

(assert (=> b!689717 d!95323))

(declare-fun d!95333 () Bool)

(assert (=> d!95333 (subseq!243 acc!681 acc!681)))

(declare-fun lt!316366 () Unit!24362)

(declare-fun choose!36 (List!13080) Unit!24362)

(assert (=> d!95333 (= lt!316366 (choose!36 acc!681))))

(assert (=> d!95333 (= (lemmaListSubSeqRefl!0 acc!681) lt!316366)))

(declare-fun bs!20212 () Bool)

(assert (= bs!20212 d!95333))

(assert (=> bs!20212 m!653345))

(declare-fun m!653631 () Bool)

(assert (=> bs!20212 m!653631))

(assert (=> b!689717 d!95333))

(declare-fun d!95335 () Bool)

(assert (=> d!95335 (= (validKeyInArray!0 (select (arr!19039 a!3626) from!3004)) (and (not (= (select (arr!19039 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19039 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!689717 d!95335))

(declare-fun d!95337 () Bool)

(assert (=> d!95337 (= ($colon$colon!408 acc!681 k0!2843) (Cons!13076 k0!2843 acc!681))))

(assert (=> b!689717 d!95337))

(declare-fun b!690027 () Bool)

(declare-fun e!392888 () Bool)

(declare-fun e!392886 () Bool)

(assert (=> b!690027 (= e!392888 e!392886)))

(declare-fun res!454464 () Bool)

(assert (=> b!690027 (=> (not res!454464) (not e!392886))))

(declare-fun e!392887 () Bool)

(assert (=> b!690027 (= res!454464 (not e!392887))))

(declare-fun res!454463 () Bool)

(assert (=> b!690027 (=> (not res!454463) (not e!392887))))

(assert (=> b!690027 (= res!454463 (validKeyInArray!0 (select (arr!19039 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!690028 () Bool)

(declare-fun e!392889 () Bool)

(declare-fun call!34202 () Bool)

(assert (=> b!690028 (= e!392889 call!34202)))

(declare-fun b!690029 () Bool)

(assert (=> b!690029 (= e!392886 e!392889)))

(declare-fun c!78149 () Bool)

(assert (=> b!690029 (= c!78149 (validKeyInArray!0 (select (arr!19039 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!690026 () Bool)

(assert (=> b!690026 (= e!392887 (contains!3657 acc!681 (select (arr!19039 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!95339 () Bool)

(declare-fun res!454462 () Bool)

(assert (=> d!95339 (=> res!454462 e!392888)))

(assert (=> d!95339 (= res!454462 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19421 a!3626)))))

(assert (=> d!95339 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!392888)))

(declare-fun b!690030 () Bool)

(assert (=> b!690030 (= e!392889 call!34202)))

(declare-fun bm!34199 () Bool)

(assert (=> bm!34199 (= call!34202 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!78149 (Cons!13076 (select (arr!19039 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(assert (= (and d!95339 (not res!454462)) b!690027))

(assert (= (and b!690027 res!454463) b!690026))

(assert (= (and b!690027 res!454464) b!690029))

(assert (= (and b!690029 c!78149) b!690028))

(assert (= (and b!690029 (not c!78149)) b!690030))

(assert (= (or b!690028 b!690030) bm!34199))

(assert (=> b!690027 m!653587))

(assert (=> b!690027 m!653587))

(assert (=> b!690027 m!653589))

(assert (=> b!690029 m!653587))

(assert (=> b!690029 m!653587))

(assert (=> b!690029 m!653589))

(assert (=> b!690026 m!653587))

(assert (=> b!690026 m!653587))

(declare-fun m!653641 () Bool)

(assert (=> b!690026 m!653641))

(assert (=> bm!34199 m!653587))

(declare-fun m!653643 () Bool)

(assert (=> bm!34199 m!653643))

(assert (=> b!689717 d!95339))

(declare-fun d!95345 () Bool)

(assert (=> d!95345 (= (array_inv!14835 a!3626) (bvsge (size!19421 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61594 d!95345))

(declare-fun d!95351 () Bool)

(declare-fun res!454469 () Bool)

(declare-fun e!392894 () Bool)

(assert (=> d!95351 (=> res!454469 e!392894)))

(assert (=> d!95351 (= res!454469 (= (select (arr!19039 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!95351 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!392894)))

(declare-fun b!690035 () Bool)

(declare-fun e!392895 () Bool)

(assert (=> b!690035 (= e!392894 e!392895)))

(declare-fun res!454470 () Bool)

(assert (=> b!690035 (=> (not res!454470) (not e!392895))))

(assert (=> b!690035 (= res!454470 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19421 a!3626)))))

(declare-fun b!690036 () Bool)

(assert (=> b!690036 (= e!392895 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95351 (not res!454469)) b!690035))

(assert (= (and b!690035 res!454470) b!690036))

(declare-fun m!653651 () Bool)

(assert (=> d!95351 m!653651))

(declare-fun m!653653 () Bool)

(assert (=> b!690036 m!653653))

(assert (=> b!689728 d!95351))

(declare-fun d!95355 () Bool)

(declare-fun lt!316373 () Bool)

(assert (=> d!95355 (= lt!316373 (select (content!305 lt!316281) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!392900 () Bool)

(assert (=> d!95355 (= lt!316373 e!392900)))

(declare-fun res!454474 () Bool)

(assert (=> d!95355 (=> (not res!454474) (not e!392900))))

(assert (=> d!95355 (= res!454474 ((_ is Cons!13076) lt!316281))))

(assert (=> d!95355 (= (contains!3657 lt!316281 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316373)))

(declare-fun b!690042 () Bool)

(declare-fun e!392901 () Bool)

(assert (=> b!690042 (= e!392900 e!392901)))

(declare-fun res!454475 () Bool)

(assert (=> b!690042 (=> res!454475 e!392901)))

(assert (=> b!690042 (= res!454475 (= (h!14121 lt!316281) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!690043 () Bool)

(assert (=> b!690043 (= e!392901 (contains!3657 (t!19344 lt!316281) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95355 res!454474) b!690042))

(assert (= (and b!690042 (not res!454475)) b!690043))

(assert (=> d!95355 m!653517))

(declare-fun m!653657 () Bool)

(assert (=> d!95355 m!653657))

(declare-fun m!653659 () Bool)

(assert (=> b!690043 m!653659))

(assert (=> b!689739 d!95355))

(declare-fun d!95357 () Bool)

(assert (=> d!95357 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!316377 () Unit!24362)

(declare-fun choose!13 (array!39735 (_ BitVec 64) (_ BitVec 32)) Unit!24362)

(assert (=> d!95357 (= lt!316377 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!95357 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!95357 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!316377)))

(declare-fun bs!20215 () Bool)

(assert (= bs!20215 d!95357))

(assert (=> bs!20215 m!653327))

(declare-fun m!653677 () Bool)

(assert (=> bs!20215 m!653677))

(assert (=> b!689737 d!95357))

(declare-fun b!690056 () Bool)

(declare-fun e!392914 () Bool)

(declare-fun e!392912 () Bool)

(assert (=> b!690056 (= e!392914 e!392912)))

(declare-fun res!454487 () Bool)

(assert (=> b!690056 (=> (not res!454487) (not e!392912))))

(declare-fun e!392913 () Bool)

(assert (=> b!690056 (= res!454487 (not e!392913))))

(declare-fun res!454486 () Bool)

(assert (=> b!690056 (=> (not res!454486) (not e!392913))))

(assert (=> b!690056 (= res!454486 (validKeyInArray!0 (select (arr!19039 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!690057 () Bool)

(declare-fun e!392915 () Bool)

(declare-fun call!34205 () Bool)

(assert (=> b!690057 (= e!392915 call!34205)))

(declare-fun b!690058 () Bool)

(assert (=> b!690058 (= e!392912 e!392915)))

(declare-fun c!78152 () Bool)

(assert (=> b!690058 (= c!78152 (validKeyInArray!0 (select (arr!19039 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!690055 () Bool)

(assert (=> b!690055 (= e!392913 (contains!3657 Nil!13077 (select (arr!19039 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!95373 () Bool)

(declare-fun res!454485 () Bool)

(assert (=> d!95373 (=> res!454485 e!392914)))

(assert (=> d!95373 (= res!454485 (bvsge #b00000000000000000000000000000000 (size!19421 a!3626)))))

(assert (=> d!95373 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13077) e!392914)))

(declare-fun b!690059 () Bool)

(assert (=> b!690059 (= e!392915 call!34205)))

(declare-fun bm!34202 () Bool)

(assert (=> bm!34202 (= call!34205 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78152 (Cons!13076 (select (arr!19039 a!3626) #b00000000000000000000000000000000) Nil!13077) Nil!13077)))))

(assert (= (and d!95373 (not res!454485)) b!690056))

(assert (= (and b!690056 res!454486) b!690055))

(assert (= (and b!690056 res!454487) b!690058))

(assert (= (and b!690058 c!78152) b!690057))

(assert (= (and b!690058 (not c!78152)) b!690059))

(assert (= (or b!690057 b!690059) bm!34202))

(assert (=> b!690056 m!653651))

(assert (=> b!690056 m!653651))

(declare-fun m!653679 () Bool)

(assert (=> b!690056 m!653679))

(assert (=> b!690058 m!653651))

(assert (=> b!690058 m!653651))

(assert (=> b!690058 m!653679))

(assert (=> b!690055 m!653651))

(assert (=> b!690055 m!653651))

(declare-fun m!653685 () Bool)

(assert (=> b!690055 m!653685))

(assert (=> bm!34202 m!653651))

(declare-fun m!653687 () Bool)

(assert (=> bm!34202 m!653687))

(assert (=> b!689716 d!95373))

(declare-fun b!690065 () Bool)

(declare-fun e!392922 () Bool)

(declare-fun e!392920 () Bool)

(assert (=> b!690065 (= e!392922 e!392920)))

(declare-fun res!454494 () Bool)

(assert (=> b!690065 (=> (not res!454494) (not e!392920))))

(declare-fun e!392921 () Bool)

(assert (=> b!690065 (= res!454494 (not e!392921))))

(declare-fun res!454493 () Bool)

(assert (=> b!690065 (=> (not res!454493) (not e!392921))))

(assert (=> b!690065 (= res!454493 (validKeyInArray!0 (select (arr!19039 a!3626) from!3004)))))

(declare-fun b!690066 () Bool)

(declare-fun e!392923 () Bool)

(declare-fun call!34206 () Bool)

(assert (=> b!690066 (= e!392923 call!34206)))

(declare-fun b!690067 () Bool)

(assert (=> b!690067 (= e!392920 e!392923)))

(declare-fun c!78153 () Bool)

(assert (=> b!690067 (= c!78153 (validKeyInArray!0 (select (arr!19039 a!3626) from!3004)))))

(declare-fun b!690064 () Bool)

(assert (=> b!690064 (= e!392921 (contains!3657 acc!681 (select (arr!19039 a!3626) from!3004)))))

(declare-fun d!95379 () Bool)

(declare-fun res!454492 () Bool)

(assert (=> d!95379 (=> res!454492 e!392922)))

(assert (=> d!95379 (= res!454492 (bvsge from!3004 (size!19421 a!3626)))))

(assert (=> d!95379 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!392922)))

(declare-fun b!690068 () Bool)

(assert (=> b!690068 (= e!392923 call!34206)))

(declare-fun bm!34203 () Bool)

(assert (=> bm!34203 (= call!34206 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78153 (Cons!13076 (select (arr!19039 a!3626) from!3004) acc!681) acc!681)))))

(assert (= (and d!95379 (not res!454492)) b!690065))

(assert (= (and b!690065 res!454493) b!690064))

(assert (= (and b!690065 res!454494) b!690067))

(assert (= (and b!690067 c!78153) b!690066))

(assert (= (and b!690067 (not c!78153)) b!690068))

(assert (= (or b!690066 b!690068) bm!34203))

(assert (=> b!690065 m!653337))

(assert (=> b!690065 m!653337))

(assert (=> b!690065 m!653361))

(assert (=> b!690067 m!653337))

(assert (=> b!690067 m!653337))

(assert (=> b!690067 m!653361))

(assert (=> b!690064 m!653337))

(assert (=> b!690064 m!653337))

(declare-fun m!653693 () Bool)

(assert (=> b!690064 m!653693))

(assert (=> bm!34203 m!653337))

(declare-fun m!653699 () Bool)

(assert (=> bm!34203 m!653699))

(assert (=> b!689727 d!95379))

(assert (=> b!689725 d!95289))

(declare-fun d!95383 () Bool)

(assert (=> d!95383 (= ($colon$colon!408 acc!681 (select (arr!19039 a!3626) from!3004)) (Cons!13076 (select (arr!19039 a!3626) from!3004) acc!681))))

(assert (=> b!689736 d!95383))

(assert (=> b!689736 d!95303))

(declare-fun d!95385 () Bool)

(assert (=> d!95385 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!316384 () Unit!24362)

(declare-fun choose!80 (array!39735 List!13080 List!13080 (_ BitVec 32)) Unit!24362)

(assert (=> d!95385 (= lt!316384 (choose!80 a!3626 ($colon$colon!408 acc!681 (select (arr!19039 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!95385 (bvslt (size!19421 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!95385 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!408 acc!681 (select (arr!19039 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!316384)))

(declare-fun bs!20216 () Bool)

(assert (= bs!20216 d!95385))

(assert (=> bs!20216 m!653335))

(assert (=> bs!20216 m!653339))

(declare-fun m!653709 () Bool)

(assert (=> bs!20216 m!653709))

(assert (=> b!689736 d!95385))

(assert (=> b!689736 d!95333))

(assert (=> b!689736 d!95339))

(check-sat (not d!95289) (not b!689926) (not b!689878) (not d!95279) (not d!95301) (not d!95287) (not b!690026) (not b!690065) (not b!689987) (not bm!34203) (not b!689886) (not bm!34188) (not b!690027) (not b!689854) (not b!689881) (not bm!34182) (not d!95385) (not b!689985) (not b!690058) (not b!689882) (not b!689831) (not b!690067) (not d!95323) (not b!690055) (not b!689982) (not d!95291) (not bm!34202) (not d!95271) (not b!689876) (not bm!34199) (not b!689853) (not b!690005) (not b!689983) (not b!690036) (not b!689984) (not d!95357) (not d!95253) (not bm!34181) (not d!95283) (not b!689830) (not b!690029) (not d!95355) (not b!689880) (not b!690043) (not b!689836) (not b!690056) (not b!689884) (not bm!34196) (not d!95333) (not b!689838) (not b!690003) (not b!690064) (not b!689835) (not b!689846) (not b!689833))
(check-sat)
