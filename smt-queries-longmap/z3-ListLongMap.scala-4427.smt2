; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61428 () Bool)

(assert start!61428)

(declare-fun b!687305 () Bool)

(declare-fun res!452182 () Bool)

(declare-fun e!391427 () Bool)

(assert (=> b!687305 (=> (not res!452182) (not e!391427))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39669 0))(
  ( (array!39670 (arr!19006 (Array (_ BitVec 32) (_ BitVec 64))) (size!19382 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39669)

(assert (=> b!687305 (= res!452182 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19382 a!3626))))))

(declare-fun b!687306 () Bool)

(declare-fun e!391432 () Bool)

(declare-datatypes ((List!12954 0))(
  ( (Nil!12951) (Cons!12950 (h!13998 (_ BitVec 64)) (t!19204 List!12954)) )
))
(declare-fun acc!681 () List!12954)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3606 (List!12954 (_ BitVec 64)) Bool)

(assert (=> b!687306 (= e!391432 (not (contains!3606 acc!681 k0!2843)))))

(declare-fun b!687307 () Bool)

(declare-fun res!452187 () Bool)

(declare-fun e!391429 () Bool)

(assert (=> b!687307 (=> res!452187 e!391429)))

(declare-fun lt!315402 () List!12954)

(declare-fun noDuplicate!880 (List!12954) Bool)

(assert (=> b!687307 (= res!452187 (not (noDuplicate!880 lt!315402)))))

(declare-fun b!687308 () Bool)

(declare-fun e!391426 () Bool)

(assert (=> b!687308 (= e!391426 (contains!3606 acc!681 k0!2843))))

(declare-fun b!687309 () Bool)

(declare-fun res!452184 () Bool)

(assert (=> b!687309 (=> (not res!452184) (not e!391427))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39669 (_ BitVec 32) List!12954) Bool)

(assert (=> b!687309 (= res!452184 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!687311 () Bool)

(declare-datatypes ((Unit!24201 0))(
  ( (Unit!24202) )
))
(declare-fun e!391428 () Unit!24201)

(declare-fun Unit!24203 () Unit!24201)

(assert (=> b!687311 (= e!391428 Unit!24203)))

(declare-fun lt!315398 () Unit!24201)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39669 (_ BitVec 64) (_ BitVec 32)) Unit!24201)

(assert (=> b!687311 (= lt!315398 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!687311 false))

(declare-fun b!687312 () Bool)

(declare-fun res!452181 () Bool)

(assert (=> b!687312 (=> (not res!452181) (not e!391427))))

(assert (=> b!687312 (= res!452181 (noDuplicate!880 acc!681))))

(declare-fun b!687313 () Bool)

(declare-fun e!391430 () Bool)

(assert (=> b!687313 (= e!391430 (not (contains!3606 lt!315402 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!687314 () Bool)

(declare-fun res!452185 () Bool)

(assert (=> b!687314 (=> (not res!452185) (not e!391427))))

(declare-fun arrayContainsKey!0 (array!39669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!687314 (= res!452185 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!687315 () Bool)

(declare-fun Unit!24204 () Unit!24201)

(assert (=> b!687315 (= e!391428 Unit!24204)))

(declare-fun b!687316 () Bool)

(declare-fun res!452188 () Bool)

(assert (=> b!687316 (=> (not res!452188) (not e!391427))))

(assert (=> b!687316 (= res!452188 (not (contains!3606 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!687310 () Bool)

(declare-fun e!391433 () Unit!24201)

(declare-fun lt!315401 () Unit!24201)

(assert (=> b!687310 (= e!391433 lt!315401)))

(declare-fun lt!315399 () Unit!24201)

(declare-fun lemmaListSubSeqRefl!0 (List!12954) Unit!24201)

(assert (=> b!687310 (= lt!315399 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!215 (List!12954 List!12954) Bool)

(assert (=> b!687310 (subseq!215 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39669 List!12954 List!12954 (_ BitVec 32)) Unit!24201)

(declare-fun $colon$colon!377 (List!12954 (_ BitVec 64)) List!12954)

(assert (=> b!687310 (= lt!315401 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!377 acc!681 (select (arr!19006 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!687310 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun res!452178 () Bool)

(assert (=> start!61428 (=> (not res!452178) (not e!391427))))

(assert (=> start!61428 (= res!452178 (and (bvslt (size!19382 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19382 a!3626))))))

(assert (=> start!61428 e!391427))

(assert (=> start!61428 true))

(declare-fun array_inv!14865 (array!39669) Bool)

(assert (=> start!61428 (array_inv!14865 a!3626)))

(declare-fun b!687317 () Bool)

(declare-fun e!391434 () Bool)

(assert (=> b!687317 (= e!391434 e!391432)))

(declare-fun res!452189 () Bool)

(assert (=> b!687317 (=> (not res!452189) (not e!391432))))

(assert (=> b!687317 (= res!452189 (bvsle from!3004 i!1382))))

(declare-fun b!687318 () Bool)

(declare-fun res!452180 () Bool)

(assert (=> b!687318 (=> (not res!452180) (not e!391427))))

(assert (=> b!687318 (= res!452180 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19382 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!687319 () Bool)

(declare-fun res!452192 () Bool)

(assert (=> b!687319 (=> (not res!452192) (not e!391427))))

(assert (=> b!687319 (= res!452192 (not (contains!3606 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!687320 () Bool)

(assert (=> b!687320 (= e!391429 e!391430)))

(declare-fun res!452190 () Bool)

(assert (=> b!687320 (=> (not res!452190) (not e!391430))))

(assert (=> b!687320 (= res!452190 (not (contains!3606 lt!315402 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!687321 () Bool)

(declare-fun res!452179 () Bool)

(assert (=> b!687321 (=> (not res!452179) (not e!391427))))

(assert (=> b!687321 (= res!452179 e!391434)))

(declare-fun res!452193 () Bool)

(assert (=> b!687321 (=> res!452193 e!391434)))

(assert (=> b!687321 (= res!452193 e!391426)))

(declare-fun res!452194 () Bool)

(assert (=> b!687321 (=> (not res!452194) (not e!391426))))

(assert (=> b!687321 (= res!452194 (bvsgt from!3004 i!1382))))

(declare-fun b!687322 () Bool)

(declare-fun res!452183 () Bool)

(assert (=> b!687322 (=> (not res!452183) (not e!391427))))

(assert (=> b!687322 (= res!452183 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12951))))

(declare-fun b!687323 () Bool)

(declare-fun Unit!24205 () Unit!24201)

(assert (=> b!687323 (= e!391433 Unit!24205)))

(declare-fun b!687324 () Bool)

(declare-fun res!452191 () Bool)

(assert (=> b!687324 (=> (not res!452191) (not e!391427))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!687324 (= res!452191 (validKeyInArray!0 k0!2843))))

(declare-fun b!687325 () Bool)

(assert (=> b!687325 (= e!391427 (not e!391429))))

(declare-fun res!452186 () Bool)

(assert (=> b!687325 (=> res!452186 e!391429)))

(assert (=> b!687325 (= res!452186 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!687325 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315402)))

(declare-fun lt!315400 () Unit!24201)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39669 (_ BitVec 64) (_ BitVec 32) List!12954 List!12954) Unit!24201)

(assert (=> b!687325 (= lt!315400 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315402))))

(declare-fun -!179 (List!12954 (_ BitVec 64)) List!12954)

(assert (=> b!687325 (= (-!179 lt!315402 k0!2843) acc!681)))

(assert (=> b!687325 (= lt!315402 ($colon$colon!377 acc!681 k0!2843))))

(declare-fun lt!315403 () Unit!24201)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12954) Unit!24201)

(assert (=> b!687325 (= lt!315403 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!687325 (subseq!215 acc!681 acc!681)))

(declare-fun lt!315395 () Unit!24201)

(assert (=> b!687325 (= lt!315395 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!687325 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315397 () Unit!24201)

(assert (=> b!687325 (= lt!315397 e!391433)))

(declare-fun c!77933 () Bool)

(assert (=> b!687325 (= c!77933 (validKeyInArray!0 (select (arr!19006 a!3626) from!3004)))))

(declare-fun lt!315396 () Unit!24201)

(assert (=> b!687325 (= lt!315396 e!391428)))

(declare-fun c!77932 () Bool)

(assert (=> b!687325 (= c!77932 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!687325 (arrayContainsKey!0 (array!39670 (store (arr!19006 a!3626) i!1382 k0!2843) (size!19382 a!3626)) k0!2843 from!3004)))

(assert (= (and start!61428 res!452178) b!687312))

(assert (= (and b!687312 res!452181) b!687319))

(assert (= (and b!687319 res!452192) b!687316))

(assert (= (and b!687316 res!452188) b!687321))

(assert (= (and b!687321 res!452194) b!687308))

(assert (= (and b!687321 (not res!452193)) b!687317))

(assert (= (and b!687317 res!452189) b!687306))

(assert (= (and b!687321 res!452179) b!687322))

(assert (= (and b!687322 res!452183) b!687309))

(assert (= (and b!687309 res!452184) b!687305))

(assert (= (and b!687305 res!452182) b!687324))

(assert (= (and b!687324 res!452191) b!687314))

(assert (= (and b!687314 res!452185) b!687318))

(assert (= (and b!687318 res!452180) b!687325))

(assert (= (and b!687325 c!77932) b!687311))

(assert (= (and b!687325 (not c!77932)) b!687315))

(assert (= (and b!687325 c!77933) b!687310))

(assert (= (and b!687325 (not c!77933)) b!687323))

(assert (= (and b!687325 (not res!452186)) b!687307))

(assert (= (and b!687307 (not res!452187)) b!687320))

(assert (= (and b!687320 res!452190) b!687313))

(declare-fun m!651829 () Bool)

(assert (=> b!687320 m!651829))

(declare-fun m!651831 () Bool)

(assert (=> b!687314 m!651831))

(declare-fun m!651833 () Bool)

(assert (=> b!687313 m!651833))

(declare-fun m!651835 () Bool)

(assert (=> b!687307 m!651835))

(declare-fun m!651837 () Bool)

(assert (=> b!687306 m!651837))

(declare-fun m!651839 () Bool)

(assert (=> start!61428 m!651839))

(assert (=> b!687308 m!651837))

(declare-fun m!651841 () Bool)

(assert (=> b!687324 m!651841))

(declare-fun m!651843 () Bool)

(assert (=> b!687322 m!651843))

(declare-fun m!651845 () Bool)

(assert (=> b!687309 m!651845))

(declare-fun m!651847 () Bool)

(assert (=> b!687312 m!651847))

(declare-fun m!651849 () Bool)

(assert (=> b!687325 m!651849))

(declare-fun m!651851 () Bool)

(assert (=> b!687325 m!651851))

(declare-fun m!651853 () Bool)

(assert (=> b!687325 m!651853))

(declare-fun m!651855 () Bool)

(assert (=> b!687325 m!651855))

(declare-fun m!651857 () Bool)

(assert (=> b!687325 m!651857))

(declare-fun m!651859 () Bool)

(assert (=> b!687325 m!651859))

(declare-fun m!651861 () Bool)

(assert (=> b!687325 m!651861))

(declare-fun m!651863 () Bool)

(assert (=> b!687325 m!651863))

(assert (=> b!687325 m!651853))

(declare-fun m!651865 () Bool)

(assert (=> b!687325 m!651865))

(declare-fun m!651867 () Bool)

(assert (=> b!687325 m!651867))

(declare-fun m!651869 () Bool)

(assert (=> b!687325 m!651869))

(declare-fun m!651871 () Bool)

(assert (=> b!687325 m!651871))

(declare-fun m!651873 () Bool)

(assert (=> b!687325 m!651873))

(declare-fun m!651875 () Bool)

(assert (=> b!687319 m!651875))

(declare-fun m!651877 () Bool)

(assert (=> b!687316 m!651877))

(declare-fun m!651879 () Bool)

(assert (=> b!687311 m!651879))

(assert (=> b!687310 m!651851))

(assert (=> b!687310 m!651853))

(declare-fun m!651881 () Bool)

(assert (=> b!687310 m!651881))

(declare-fun m!651883 () Bool)

(assert (=> b!687310 m!651883))

(assert (=> b!687310 m!651853))

(assert (=> b!687310 m!651881))

(assert (=> b!687310 m!651859))

(assert (=> b!687310 m!651873))

(check-sat (not b!687325) (not b!687310) (not b!687307) (not b!687312) (not b!687320) (not start!61428) (not b!687313) (not b!687308) (not b!687322) (not b!687314) (not b!687316) (not b!687311) (not b!687324) (not b!687309) (not b!687319) (not b!687306))
(check-sat)
(get-model)

(declare-fun d!95035 () Bool)

(declare-fun res!452301 () Bool)

(declare-fun e!391493 () Bool)

(assert (=> d!95035 (=> res!452301 e!391493)))

(get-info :version)

(assert (=> d!95035 (= res!452301 ((_ is Nil!12951) acc!681))))

(assert (=> d!95035 (= (noDuplicate!880 acc!681) e!391493)))

(declare-fun b!687456 () Bool)

(declare-fun e!391494 () Bool)

(assert (=> b!687456 (= e!391493 e!391494)))

(declare-fun res!452302 () Bool)

(assert (=> b!687456 (=> (not res!452302) (not e!391494))))

(assert (=> b!687456 (= res!452302 (not (contains!3606 (t!19204 acc!681) (h!13998 acc!681))))))

(declare-fun b!687457 () Bool)

(assert (=> b!687457 (= e!391494 (noDuplicate!880 (t!19204 acc!681)))))

(assert (= (and d!95035 (not res!452301)) b!687456))

(assert (= (and b!687456 res!452302) b!687457))

(declare-fun m!651997 () Bool)

(assert (=> b!687456 m!651997))

(declare-fun m!651999 () Bool)

(assert (=> b!687457 m!651999))

(assert (=> b!687312 d!95035))

(declare-fun bm!34134 () Bool)

(declare-fun call!34137 () Bool)

(declare-fun c!77948 () Bool)

(assert (=> bm!34134 (= call!34137 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77948 (Cons!12950 (select (arr!19006 a!3626) #b00000000000000000000000000000000) Nil!12951) Nil!12951)))))

(declare-fun b!687468 () Bool)

(declare-fun e!391503 () Bool)

(declare-fun e!391506 () Bool)

(assert (=> b!687468 (= e!391503 e!391506)))

(declare-fun res!452311 () Bool)

(assert (=> b!687468 (=> (not res!452311) (not e!391506))))

(declare-fun e!391504 () Bool)

(assert (=> b!687468 (= res!452311 (not e!391504))))

(declare-fun res!452309 () Bool)

(assert (=> b!687468 (=> (not res!452309) (not e!391504))))

(assert (=> b!687468 (= res!452309 (validKeyInArray!0 (select (arr!19006 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!95037 () Bool)

(declare-fun res!452310 () Bool)

(assert (=> d!95037 (=> res!452310 e!391503)))

(assert (=> d!95037 (= res!452310 (bvsge #b00000000000000000000000000000000 (size!19382 a!3626)))))

(assert (=> d!95037 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12951) e!391503)))

(declare-fun b!687469 () Bool)

(assert (=> b!687469 (= e!391504 (contains!3606 Nil!12951 (select (arr!19006 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!687470 () Bool)

(declare-fun e!391505 () Bool)

(assert (=> b!687470 (= e!391505 call!34137)))

(declare-fun b!687471 () Bool)

(assert (=> b!687471 (= e!391505 call!34137)))

(declare-fun b!687472 () Bool)

(assert (=> b!687472 (= e!391506 e!391505)))

(assert (=> b!687472 (= c!77948 (validKeyInArray!0 (select (arr!19006 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!95037 (not res!452310)) b!687468))

(assert (= (and b!687468 res!452309) b!687469))

(assert (= (and b!687468 res!452311) b!687472))

(assert (= (and b!687472 c!77948) b!687471))

(assert (= (and b!687472 (not c!77948)) b!687470))

(assert (= (or b!687471 b!687470) bm!34134))

(declare-fun m!652001 () Bool)

(assert (=> bm!34134 m!652001))

(declare-fun m!652003 () Bool)

(assert (=> bm!34134 m!652003))

(assert (=> b!687468 m!652001))

(assert (=> b!687468 m!652001))

(declare-fun m!652005 () Bool)

(assert (=> b!687468 m!652005))

(assert (=> b!687469 m!652001))

(assert (=> b!687469 m!652001))

(declare-fun m!652007 () Bool)

(assert (=> b!687469 m!652007))

(assert (=> b!687472 m!652001))

(assert (=> b!687472 m!652001))

(assert (=> b!687472 m!652005))

(assert (=> b!687322 d!95037))

(declare-fun d!95039 () Bool)

(assert (=> d!95039 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!315460 () Unit!24201)

(declare-fun choose!13 (array!39669 (_ BitVec 64) (_ BitVec 32)) Unit!24201)

(assert (=> d!95039 (= lt!315460 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!95039 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!95039 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!315460)))

(declare-fun bs!20168 () Bool)

(assert (= bs!20168 d!95039))

(assert (=> bs!20168 m!651831))

(declare-fun m!652009 () Bool)

(assert (=> bs!20168 m!652009))

(assert (=> b!687311 d!95039))

(declare-fun d!95041 () Bool)

(assert (=> d!95041 (= (array_inv!14865 a!3626) (bvsge (size!19382 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61428 d!95041))

(declare-fun d!95043 () Bool)

(assert (=> d!95043 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315402)))

(declare-fun lt!315463 () Unit!24201)

(declare-fun choose!66 (array!39669 (_ BitVec 64) (_ BitVec 32) List!12954 List!12954) Unit!24201)

(assert (=> d!95043 (= lt!315463 (choose!66 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315402))))

(assert (=> d!95043 (bvslt (size!19382 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!95043 (= (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315402) lt!315463)))

(declare-fun bs!20169 () Bool)

(assert (= bs!20169 d!95043))

(assert (=> bs!20169 m!651863))

(declare-fun m!652011 () Bool)

(assert (=> bs!20169 m!652011))

(assert (=> b!687325 d!95043))

(declare-fun bm!34135 () Bool)

(declare-fun c!77949 () Bool)

(declare-fun call!34138 () Bool)

(assert (=> bm!34135 (= call!34138 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77949 (Cons!12950 (select (arr!19006 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) lt!315402) lt!315402)))))

(declare-fun b!687473 () Bool)

(declare-fun e!391507 () Bool)

(declare-fun e!391510 () Bool)

(assert (=> b!687473 (= e!391507 e!391510)))

(declare-fun res!452314 () Bool)

(assert (=> b!687473 (=> (not res!452314) (not e!391510))))

(declare-fun e!391508 () Bool)

(assert (=> b!687473 (= res!452314 (not e!391508))))

(declare-fun res!452312 () Bool)

(assert (=> b!687473 (=> (not res!452312) (not e!391508))))

(assert (=> b!687473 (= res!452312 (validKeyInArray!0 (select (arr!19006 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!95045 () Bool)

(declare-fun res!452313 () Bool)

(assert (=> d!95045 (=> res!452313 e!391507)))

(assert (=> d!95045 (= res!452313 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19382 a!3626)))))

(assert (=> d!95045 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315402) e!391507)))

(declare-fun b!687474 () Bool)

(assert (=> b!687474 (= e!391508 (contains!3606 lt!315402 (select (arr!19006 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!687475 () Bool)

(declare-fun e!391509 () Bool)

(assert (=> b!687475 (= e!391509 call!34138)))

(declare-fun b!687476 () Bool)

(assert (=> b!687476 (= e!391509 call!34138)))

(declare-fun b!687477 () Bool)

(assert (=> b!687477 (= e!391510 e!391509)))

(assert (=> b!687477 (= c!77949 (validKeyInArray!0 (select (arr!19006 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (= (and d!95045 (not res!452313)) b!687473))

(assert (= (and b!687473 res!452312) b!687474))

(assert (= (and b!687473 res!452314) b!687477))

(assert (= (and b!687477 c!77949) b!687476))

(assert (= (and b!687477 (not c!77949)) b!687475))

(assert (= (or b!687476 b!687475) bm!34135))

(declare-fun m!652013 () Bool)

(assert (=> bm!34135 m!652013))

(declare-fun m!652015 () Bool)

(assert (=> bm!34135 m!652015))

(assert (=> b!687473 m!652013))

(assert (=> b!687473 m!652013))

(declare-fun m!652017 () Bool)

(assert (=> b!687473 m!652017))

(assert (=> b!687474 m!652013))

(assert (=> b!687474 m!652013))

(declare-fun m!652019 () Bool)

(assert (=> b!687474 m!652019))

(assert (=> b!687477 m!652013))

(assert (=> b!687477 m!652013))

(assert (=> b!687477 m!652017))

(assert (=> b!687325 d!95045))

(declare-fun b!687487 () Bool)

(declare-fun e!391520 () Bool)

(declare-fun e!391521 () Bool)

(assert (=> b!687487 (= e!391520 e!391521)))

(declare-fun res!452324 () Bool)

(assert (=> b!687487 (=> res!452324 e!391521)))

(declare-fun e!391522 () Bool)

(assert (=> b!687487 (= res!452324 e!391522)))

(declare-fun res!452326 () Bool)

(assert (=> b!687487 (=> (not res!452326) (not e!391522))))

(assert (=> b!687487 (= res!452326 (= (h!13998 acc!681) (h!13998 acc!681)))))

(declare-fun b!687488 () Bool)

(assert (=> b!687488 (= e!391522 (subseq!215 (t!19204 acc!681) (t!19204 acc!681)))))

(declare-fun b!687489 () Bool)

(assert (=> b!687489 (= e!391521 (subseq!215 acc!681 (t!19204 acc!681)))))

(declare-fun b!687486 () Bool)

(declare-fun e!391519 () Bool)

(assert (=> b!687486 (= e!391519 e!391520)))

(declare-fun res!452325 () Bool)

(assert (=> b!687486 (=> (not res!452325) (not e!391520))))

(assert (=> b!687486 (= res!452325 ((_ is Cons!12950) acc!681))))

(declare-fun d!95047 () Bool)

(declare-fun res!452323 () Bool)

(assert (=> d!95047 (=> res!452323 e!391519)))

(assert (=> d!95047 (= res!452323 ((_ is Nil!12951) acc!681))))

(assert (=> d!95047 (= (subseq!215 acc!681 acc!681) e!391519)))

(assert (= (and d!95047 (not res!452323)) b!687486))

(assert (= (and b!687486 res!452325) b!687487))

(assert (= (and b!687487 res!452326) b!687488))

(assert (= (and b!687487 (not res!452324)) b!687489))

(declare-fun m!652021 () Bool)

(assert (=> b!687488 m!652021))

(declare-fun m!652023 () Bool)

(assert (=> b!687489 m!652023))

(assert (=> b!687325 d!95047))

(declare-fun d!95049 () Bool)

(declare-fun res!452331 () Bool)

(declare-fun e!391527 () Bool)

(assert (=> d!95049 (=> res!452331 e!391527)))

(assert (=> d!95049 (= res!452331 (= (select (arr!19006 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!95049 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!391527)))

(declare-fun b!687494 () Bool)

(declare-fun e!391528 () Bool)

(assert (=> b!687494 (= e!391527 e!391528)))

(declare-fun res!452332 () Bool)

(assert (=> b!687494 (=> (not res!452332) (not e!391528))))

(assert (=> b!687494 (= res!452332 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19382 a!3626)))))

(declare-fun b!687495 () Bool)

(assert (=> b!687495 (= e!391528 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95049 (not res!452331)) b!687494))

(assert (= (and b!687494 res!452332) b!687495))

(assert (=> d!95049 m!652013))

(declare-fun m!652025 () Bool)

(assert (=> b!687495 m!652025))

(assert (=> b!687325 d!95049))

(declare-fun b!687506 () Bool)

(declare-fun e!391538 () List!12954)

(declare-fun e!391536 () List!12954)

(assert (=> b!687506 (= e!391538 e!391536)))

(declare-fun c!77955 () Bool)

(assert (=> b!687506 (= c!77955 (= k0!2843 (h!13998 lt!315402)))))

(declare-fun bm!34138 () Bool)

(declare-fun call!34141 () List!12954)

(assert (=> bm!34138 (= call!34141 (-!179 (t!19204 lt!315402) k0!2843))))

(declare-fun b!687507 () Bool)

(assert (=> b!687507 (= e!391536 call!34141)))

(declare-fun b!687508 () Bool)

(assert (=> b!687508 (= e!391538 Nil!12951)))

(declare-fun b!687509 () Bool)

(declare-fun e!391537 () Bool)

(declare-fun lt!315466 () List!12954)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!297 (List!12954) (InoxSet (_ BitVec 64)))

(assert (=> b!687509 (= e!391537 (= (content!297 lt!315466) ((_ map and) (content!297 lt!315402) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2843 true)))))))

(declare-fun b!687510 () Bool)

(assert (=> b!687510 (= e!391536 (Cons!12950 (h!13998 lt!315402) call!34141))))

(declare-fun d!95051 () Bool)

(assert (=> d!95051 e!391537))

(declare-fun res!452335 () Bool)

(assert (=> d!95051 (=> (not res!452335) (not e!391537))))

(declare-fun size!19385 (List!12954) Int)

(assert (=> d!95051 (= res!452335 (<= (size!19385 lt!315466) (size!19385 lt!315402)))))

(assert (=> d!95051 (= lt!315466 e!391538)))

(declare-fun c!77954 () Bool)

(assert (=> d!95051 (= c!77954 ((_ is Cons!12950) lt!315402))))

(assert (=> d!95051 (= (-!179 lt!315402 k0!2843) lt!315466)))

(assert (= (and d!95051 c!77954) b!687506))

(assert (= (and d!95051 (not c!77954)) b!687508))

(assert (= (and b!687506 c!77955) b!687507))

(assert (= (and b!687506 (not c!77955)) b!687510))

(assert (= (or b!687507 b!687510) bm!34138))

(assert (= (and d!95051 res!452335) b!687509))

(declare-fun m!652027 () Bool)

(assert (=> bm!34138 m!652027))

(declare-fun m!652029 () Bool)

(assert (=> b!687509 m!652029))

(declare-fun m!652031 () Bool)

(assert (=> b!687509 m!652031))

(declare-fun m!652033 () Bool)

(assert (=> b!687509 m!652033))

(declare-fun m!652035 () Bool)

(assert (=> d!95051 m!652035))

(declare-fun m!652037 () Bool)

(assert (=> d!95051 m!652037))

(assert (=> b!687325 d!95051))

(declare-fun d!95057 () Bool)

(assert (=> d!95057 (= (-!179 ($colon$colon!377 acc!681 k0!2843) k0!2843) acc!681)))

(declare-fun lt!315473 () Unit!24201)

(declare-fun choose!16 ((_ BitVec 64) List!12954) Unit!24201)

(assert (=> d!95057 (= lt!315473 (choose!16 k0!2843 acc!681))))

(assert (=> d!95057 (not (contains!3606 acc!681 k0!2843))))

(assert (=> d!95057 (= (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681) lt!315473)))

(declare-fun bs!20170 () Bool)

(assert (= bs!20170 d!95057))

(assert (=> bs!20170 m!651861))

(assert (=> bs!20170 m!651861))

(declare-fun m!652039 () Bool)

(assert (=> bs!20170 m!652039))

(declare-fun m!652041 () Bool)

(assert (=> bs!20170 m!652041))

(assert (=> bs!20170 m!651837))

(assert (=> b!687325 d!95057))

(declare-fun d!95059 () Bool)

(declare-fun res!452344 () Bool)

(declare-fun e!391547 () Bool)

(assert (=> d!95059 (=> res!452344 e!391547)))

(assert (=> d!95059 (= res!452344 (= (select (arr!19006 (array!39670 (store (arr!19006 a!3626) i!1382 k0!2843) (size!19382 a!3626))) from!3004) k0!2843))))

(assert (=> d!95059 (= (arrayContainsKey!0 (array!39670 (store (arr!19006 a!3626) i!1382 k0!2843) (size!19382 a!3626)) k0!2843 from!3004) e!391547)))

(declare-fun b!687519 () Bool)

(declare-fun e!391548 () Bool)

(assert (=> b!687519 (= e!391547 e!391548)))

(declare-fun res!452345 () Bool)

(assert (=> b!687519 (=> (not res!452345) (not e!391548))))

(assert (=> b!687519 (= res!452345 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19382 (array!39670 (store (arr!19006 a!3626) i!1382 k0!2843) (size!19382 a!3626)))))))

(declare-fun b!687520 () Bool)

(assert (=> b!687520 (= e!391548 (arrayContainsKey!0 (array!39670 (store (arr!19006 a!3626) i!1382 k0!2843) (size!19382 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95059 (not res!452344)) b!687519))

(assert (= (and b!687519 res!452345) b!687520))

(declare-fun m!652043 () Bool)

(assert (=> d!95059 m!652043))

(declare-fun m!652045 () Bool)

(assert (=> b!687520 m!652045))

(assert (=> b!687325 d!95059))

(declare-fun d!95061 () Bool)

(assert (=> d!95061 (subseq!215 acc!681 acc!681)))

(declare-fun lt!315478 () Unit!24201)

(declare-fun choose!36 (List!12954) Unit!24201)

(assert (=> d!95061 (= lt!315478 (choose!36 acc!681))))

(assert (=> d!95061 (= (lemmaListSubSeqRefl!0 acc!681) lt!315478)))

(declare-fun bs!20171 () Bool)

(assert (= bs!20171 d!95061))

(assert (=> bs!20171 m!651873))

(declare-fun m!652059 () Bool)

(assert (=> bs!20171 m!652059))

(assert (=> b!687325 d!95061))

(declare-fun d!95067 () Bool)

(assert (=> d!95067 (= (validKeyInArray!0 (select (arr!19006 a!3626) from!3004)) (and (not (= (select (arr!19006 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19006 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!687325 d!95067))

(declare-fun d!95071 () Bool)

(assert (=> d!95071 (= ($colon$colon!377 acc!681 k0!2843) (Cons!12950 k0!2843 acc!681))))

(assert (=> b!687325 d!95071))

(declare-fun bm!34139 () Bool)

(declare-fun call!34142 () Bool)

(declare-fun c!77956 () Bool)

(assert (=> bm!34139 (= call!34142 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77956 (Cons!12950 (select (arr!19006 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!687527 () Bool)

(declare-fun e!391555 () Bool)

(declare-fun e!391558 () Bool)

(assert (=> b!687527 (= e!391555 e!391558)))

(declare-fun res!452354 () Bool)

(assert (=> b!687527 (=> (not res!452354) (not e!391558))))

(declare-fun e!391556 () Bool)

(assert (=> b!687527 (= res!452354 (not e!391556))))

(declare-fun res!452352 () Bool)

(assert (=> b!687527 (=> (not res!452352) (not e!391556))))

(assert (=> b!687527 (= res!452352 (validKeyInArray!0 (select (arr!19006 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!95073 () Bool)

(declare-fun res!452353 () Bool)

(assert (=> d!95073 (=> res!452353 e!391555)))

(assert (=> d!95073 (= res!452353 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19382 a!3626)))))

(assert (=> d!95073 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!391555)))

(declare-fun b!687528 () Bool)

(assert (=> b!687528 (= e!391556 (contains!3606 acc!681 (select (arr!19006 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!687529 () Bool)

(declare-fun e!391557 () Bool)

(assert (=> b!687529 (= e!391557 call!34142)))

(declare-fun b!687530 () Bool)

(assert (=> b!687530 (= e!391557 call!34142)))

(declare-fun b!687531 () Bool)

(assert (=> b!687531 (= e!391558 e!391557)))

(assert (=> b!687531 (= c!77956 (validKeyInArray!0 (select (arr!19006 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (= (and d!95073 (not res!452353)) b!687527))

(assert (= (and b!687527 res!452352) b!687528))

(assert (= (and b!687527 res!452354) b!687531))

(assert (= (and b!687531 c!77956) b!687530))

(assert (= (and b!687531 (not c!77956)) b!687529))

(assert (= (or b!687530 b!687529) bm!34139))

(assert (=> bm!34139 m!652013))

(declare-fun m!652065 () Bool)

(assert (=> bm!34139 m!652065))

(assert (=> b!687527 m!652013))

(assert (=> b!687527 m!652013))

(assert (=> b!687527 m!652017))

(assert (=> b!687528 m!652013))

(assert (=> b!687528 m!652013))

(declare-fun m!652067 () Bool)

(assert (=> b!687528 m!652067))

(assert (=> b!687531 m!652013))

(assert (=> b!687531 m!652013))

(assert (=> b!687531 m!652017))

(assert (=> b!687325 d!95073))

(declare-fun d!95077 () Bool)

(declare-fun res!452359 () Bool)

(declare-fun e!391563 () Bool)

(assert (=> d!95077 (=> res!452359 e!391563)))

(assert (=> d!95077 (= res!452359 (= (select (arr!19006 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!95077 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!391563)))

(declare-fun b!687536 () Bool)

(declare-fun e!391564 () Bool)

(assert (=> b!687536 (= e!391563 e!391564)))

(declare-fun res!452360 () Bool)

(assert (=> b!687536 (=> (not res!452360) (not e!391564))))

(assert (=> b!687536 (= res!452360 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19382 a!3626)))))

(declare-fun b!687537 () Bool)

(assert (=> b!687537 (= e!391564 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95077 (not res!452359)) b!687536))

(assert (= (and b!687536 res!452360) b!687537))

(assert (=> d!95077 m!652001))

(declare-fun m!652069 () Bool)

(assert (=> b!687537 m!652069))

(assert (=> b!687314 d!95077))

(declare-fun d!95079 () Bool)

(assert (=> d!95079 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!687324 d!95079))

(declare-fun d!95081 () Bool)

(declare-fun lt!315483 () Bool)

(assert (=> d!95081 (= lt!315483 (select (content!297 lt!315402) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!391580 () Bool)

(assert (=> d!95081 (= lt!315483 e!391580)))

(declare-fun res!452376 () Bool)

(assert (=> d!95081 (=> (not res!452376) (not e!391580))))

(assert (=> d!95081 (= res!452376 ((_ is Cons!12950) lt!315402))))

(assert (=> d!95081 (= (contains!3606 lt!315402 #b1000000000000000000000000000000000000000000000000000000000000000) lt!315483)))

(declare-fun b!687552 () Bool)

(declare-fun e!391579 () Bool)

(assert (=> b!687552 (= e!391580 e!391579)))

(declare-fun res!452375 () Bool)

(assert (=> b!687552 (=> res!452375 e!391579)))

(assert (=> b!687552 (= res!452375 (= (h!13998 lt!315402) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687553 () Bool)

(assert (=> b!687553 (= e!391579 (contains!3606 (t!19204 lt!315402) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95081 res!452376) b!687552))

(assert (= (and b!687552 (not res!452375)) b!687553))

(assert (=> d!95081 m!652031))

(declare-fun m!652085 () Bool)

(assert (=> d!95081 m!652085))

(declare-fun m!652087 () Bool)

(assert (=> b!687553 m!652087))

(assert (=> b!687313 d!95081))

(declare-fun d!95089 () Bool)

(declare-fun res!452377 () Bool)

(declare-fun e!391581 () Bool)

(assert (=> d!95089 (=> res!452377 e!391581)))

(assert (=> d!95089 (= res!452377 ((_ is Nil!12951) lt!315402))))

(assert (=> d!95089 (= (noDuplicate!880 lt!315402) e!391581)))

(declare-fun b!687554 () Bool)

(declare-fun e!391582 () Bool)

(assert (=> b!687554 (= e!391581 e!391582)))

(declare-fun res!452378 () Bool)

(assert (=> b!687554 (=> (not res!452378) (not e!391582))))

(assert (=> b!687554 (= res!452378 (not (contains!3606 (t!19204 lt!315402) (h!13998 lt!315402))))))

(declare-fun b!687555 () Bool)

(assert (=> b!687555 (= e!391582 (noDuplicate!880 (t!19204 lt!315402)))))

(assert (= (and d!95089 (not res!452377)) b!687554))

(assert (= (and b!687554 res!452378) b!687555))

(declare-fun m!652089 () Bool)

(assert (=> b!687554 m!652089))

(declare-fun m!652091 () Bool)

(assert (=> b!687555 m!652091))

(assert (=> b!687307 d!95089))

(declare-fun d!95091 () Bool)

(declare-fun lt!315484 () Bool)

(assert (=> d!95091 (= lt!315484 (select (content!297 acc!681) k0!2843))))

(declare-fun e!391584 () Bool)

(assert (=> d!95091 (= lt!315484 e!391584)))

(declare-fun res!452380 () Bool)

(assert (=> d!95091 (=> (not res!452380) (not e!391584))))

(assert (=> d!95091 (= res!452380 ((_ is Cons!12950) acc!681))))

(assert (=> d!95091 (= (contains!3606 acc!681 k0!2843) lt!315484)))

(declare-fun b!687556 () Bool)

(declare-fun e!391583 () Bool)

(assert (=> b!687556 (= e!391584 e!391583)))

(declare-fun res!452379 () Bool)

(assert (=> b!687556 (=> res!452379 e!391583)))

(assert (=> b!687556 (= res!452379 (= (h!13998 acc!681) k0!2843))))

(declare-fun b!687557 () Bool)

(assert (=> b!687557 (= e!391583 (contains!3606 (t!19204 acc!681) k0!2843))))

(assert (= (and d!95091 res!452380) b!687556))

(assert (= (and b!687556 (not res!452379)) b!687557))

(declare-fun m!652093 () Bool)

(assert (=> d!95091 m!652093))

(declare-fun m!652095 () Bool)

(assert (=> d!95091 m!652095))

(declare-fun m!652097 () Bool)

(assert (=> b!687557 m!652097))

(assert (=> b!687306 d!95091))

(declare-fun d!95093 () Bool)

(declare-fun lt!315485 () Bool)

(assert (=> d!95093 (= lt!315485 (select (content!297 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!391586 () Bool)

(assert (=> d!95093 (= lt!315485 e!391586)))

(declare-fun res!452382 () Bool)

(assert (=> d!95093 (=> (not res!452382) (not e!391586))))

(assert (=> d!95093 (= res!452382 ((_ is Cons!12950) acc!681))))

(assert (=> d!95093 (= (contains!3606 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!315485)))

(declare-fun b!687558 () Bool)

(declare-fun e!391585 () Bool)

(assert (=> b!687558 (= e!391586 e!391585)))

(declare-fun res!452381 () Bool)

(assert (=> b!687558 (=> res!452381 e!391585)))

(assert (=> b!687558 (= res!452381 (= (h!13998 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687559 () Bool)

(assert (=> b!687559 (= e!391585 (contains!3606 (t!19204 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95093 res!452382) b!687558))

(assert (= (and b!687558 (not res!452381)) b!687559))

(assert (=> d!95093 m!652093))

(declare-fun m!652099 () Bool)

(assert (=> d!95093 m!652099))

(declare-fun m!652101 () Bool)

(assert (=> b!687559 m!652101))

(assert (=> b!687316 d!95093))

(declare-fun d!95095 () Bool)

(assert (=> d!95095 (= ($colon$colon!377 acc!681 (select (arr!19006 a!3626) from!3004)) (Cons!12950 (select (arr!19006 a!3626) from!3004) acc!681))))

(assert (=> b!687310 d!95095))

(assert (=> b!687310 d!95047))

(declare-fun d!95097 () Bool)

(assert (=> d!95097 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315488 () Unit!24201)

(declare-fun choose!80 (array!39669 List!12954 List!12954 (_ BitVec 32)) Unit!24201)

(assert (=> d!95097 (= lt!315488 (choose!80 a!3626 ($colon$colon!377 acc!681 (select (arr!19006 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!95097 (bvslt (size!19382 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!95097 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!377 acc!681 (select (arr!19006 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!315488)))

(declare-fun bs!20172 () Bool)

(assert (= bs!20172 d!95097))

(assert (=> bs!20172 m!651851))

(assert (=> bs!20172 m!651881))

(declare-fun m!652107 () Bool)

(assert (=> bs!20172 m!652107))

(assert (=> b!687310 d!95097))

(assert (=> b!687310 d!95061))

(assert (=> b!687310 d!95073))

(declare-fun d!95101 () Bool)

(declare-fun lt!315490 () Bool)

(assert (=> d!95101 (= lt!315490 (select (content!297 lt!315402) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!391596 () Bool)

(assert (=> d!95101 (= lt!315490 e!391596)))

(declare-fun res!452392 () Bool)

(assert (=> d!95101 (=> (not res!452392) (not e!391596))))

(assert (=> d!95101 (= res!452392 ((_ is Cons!12950) lt!315402))))

(assert (=> d!95101 (= (contains!3606 lt!315402 #b0000000000000000000000000000000000000000000000000000000000000000) lt!315490)))

(declare-fun b!687568 () Bool)

(declare-fun e!391595 () Bool)

(assert (=> b!687568 (= e!391596 e!391595)))

(declare-fun res!452391 () Bool)

(assert (=> b!687568 (=> res!452391 e!391595)))

(assert (=> b!687568 (= res!452391 (= (h!13998 lt!315402) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687569 () Bool)

(assert (=> b!687569 (= e!391595 (contains!3606 (t!19204 lt!315402) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95101 res!452392) b!687568))

(assert (= (and b!687568 (not res!452391)) b!687569))

(assert (=> d!95101 m!652031))

(declare-fun m!652111 () Bool)

(assert (=> d!95101 m!652111))

(declare-fun m!652113 () Bool)

(assert (=> b!687569 m!652113))

(assert (=> b!687320 d!95101))

(declare-fun call!34143 () Bool)

(declare-fun c!77957 () Bool)

(declare-fun bm!34140 () Bool)

(assert (=> bm!34140 (= call!34143 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77957 (Cons!12950 (select (arr!19006 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!687570 () Bool)

(declare-fun e!391597 () Bool)

(declare-fun e!391600 () Bool)

(assert (=> b!687570 (= e!391597 e!391600)))

(declare-fun res!452395 () Bool)

(assert (=> b!687570 (=> (not res!452395) (not e!391600))))

(declare-fun e!391598 () Bool)

(assert (=> b!687570 (= res!452395 (not e!391598))))

(declare-fun res!452393 () Bool)

(assert (=> b!687570 (=> (not res!452393) (not e!391598))))

(assert (=> b!687570 (= res!452393 (validKeyInArray!0 (select (arr!19006 a!3626) from!3004)))))

(declare-fun d!95103 () Bool)

(declare-fun res!452394 () Bool)

(assert (=> d!95103 (=> res!452394 e!391597)))

(assert (=> d!95103 (= res!452394 (bvsge from!3004 (size!19382 a!3626)))))

(assert (=> d!95103 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!391597)))

(declare-fun b!687571 () Bool)

(assert (=> b!687571 (= e!391598 (contains!3606 acc!681 (select (arr!19006 a!3626) from!3004)))))

(declare-fun b!687572 () Bool)

(declare-fun e!391599 () Bool)

(assert (=> b!687572 (= e!391599 call!34143)))

(declare-fun b!687573 () Bool)

(assert (=> b!687573 (= e!391599 call!34143)))

(declare-fun b!687574 () Bool)

(assert (=> b!687574 (= e!391600 e!391599)))

(assert (=> b!687574 (= c!77957 (validKeyInArray!0 (select (arr!19006 a!3626) from!3004)))))

(assert (= (and d!95103 (not res!452394)) b!687570))

(assert (= (and b!687570 res!452393) b!687571))

(assert (= (and b!687570 res!452395) b!687574))

(assert (= (and b!687574 c!77957) b!687573))

(assert (= (and b!687574 (not c!77957)) b!687572))

(assert (= (or b!687573 b!687572) bm!34140))

(assert (=> bm!34140 m!651853))

(declare-fun m!652117 () Bool)

(assert (=> bm!34140 m!652117))

(assert (=> b!687570 m!651853))

(assert (=> b!687570 m!651853))

(assert (=> b!687570 m!651865))

(assert (=> b!687571 m!651853))

(assert (=> b!687571 m!651853))

(declare-fun m!652119 () Bool)

(assert (=> b!687571 m!652119))

(assert (=> b!687574 m!651853))

(assert (=> b!687574 m!651853))

(assert (=> b!687574 m!651865))

(assert (=> b!687309 d!95103))

(declare-fun d!95108 () Bool)

(declare-fun lt!315491 () Bool)

(assert (=> d!95108 (= lt!315491 (select (content!297 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!391604 () Bool)

(assert (=> d!95108 (= lt!315491 e!391604)))

(declare-fun res!452399 () Bool)

(assert (=> d!95108 (=> (not res!452399) (not e!391604))))

(assert (=> d!95108 (= res!452399 ((_ is Cons!12950) acc!681))))

(assert (=> d!95108 (= (contains!3606 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!315491)))

(declare-fun b!687577 () Bool)

(declare-fun e!391603 () Bool)

(assert (=> b!687577 (= e!391604 e!391603)))

(declare-fun res!452398 () Bool)

(assert (=> b!687577 (=> res!452398 e!391603)))

(assert (=> b!687577 (= res!452398 (= (h!13998 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687578 () Bool)

(assert (=> b!687578 (= e!391603 (contains!3606 (t!19204 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95108 res!452399) b!687577))

(assert (= (and b!687577 (not res!452398)) b!687578))

(assert (=> d!95108 m!652093))

(declare-fun m!652121 () Bool)

(assert (=> d!95108 m!652121))

(declare-fun m!652123 () Bool)

(assert (=> b!687578 m!652123))

(assert (=> b!687319 d!95108))

(assert (=> b!687308 d!95091))

(check-sat (not bm!34139) (not b!687569) (not b!687468) (not bm!34135) (not d!95101) (not b!687531) (not d!95039) (not b!687488) (not d!95057) (not b!687474) (not bm!34138) (not b!687571) (not b!687557) (not b!687553) (not b!687554) (not b!687469) (not d!95043) (not b!687509) (not d!95093) (not b!687456) (not b!687574) (not d!95051) (not bm!34140) (not b!687528) (not b!687537) (not bm!34134) (not d!95081) (not b!687559) (not b!687555) (not d!95061) (not b!687473) (not b!687489) (not d!95108) (not b!687477) (not b!687527) (not b!687495) (not b!687570) (not d!95091) (not b!687457) (not b!687578) (not b!687520) (not d!95097) (not b!687472))
(check-sat)
