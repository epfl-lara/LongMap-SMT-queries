; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62156 () Bool)

(assert start!62156)

(declare-fun b!696187 () Bool)

(declare-fun e!395882 () Bool)

(declare-datatypes ((array!39946 0))(
  ( (array!39947 (arr!19134 (Array (_ BitVec 32) (_ BitVec 64))) (size!19519 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39946)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!13175 0))(
  ( (Nil!13172) (Cons!13171 (h!14216 (_ BitVec 64)) (t!19457 List!13175)) )
))
(declare-fun acc!681 () List!13175)

(declare-fun arrayNoDuplicates!0 (array!39946 (_ BitVec 32) List!13175) Bool)

(assert (=> b!696187 (= e!395882 (not (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))))

(declare-fun b!696188 () Bool)

(declare-fun res!460137 () Bool)

(assert (=> b!696188 (=> (not res!460137) (not e!395882))))

(declare-fun e!395885 () Bool)

(assert (=> b!696188 (= res!460137 e!395885)))

(declare-fun res!460147 () Bool)

(assert (=> b!696188 (=> res!460147 e!395885)))

(declare-fun e!395884 () Bool)

(assert (=> b!696188 (= res!460147 e!395884)))

(declare-fun res!460143 () Bool)

(assert (=> b!696188 (=> (not res!460143) (not e!395884))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!696188 (= res!460143 (bvsgt from!3004 i!1382))))

(declare-fun b!696189 () Bool)

(declare-fun res!460138 () Bool)

(assert (=> b!696189 (=> (not res!460138) (not e!395882))))

(declare-fun noDuplicate!999 (List!13175) Bool)

(assert (=> b!696189 (= res!460138 (noDuplicate!999 acc!681))))

(declare-fun b!696190 () Bool)

(declare-fun res!460145 () Bool)

(assert (=> b!696190 (=> (not res!460145) (not e!395882))))

(declare-fun contains!3752 (List!13175 (_ BitVec 64)) Bool)

(assert (=> b!696190 (= res!460145 (not (contains!3752 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696191 () Bool)

(declare-fun e!395887 () Bool)

(assert (=> b!696191 (= e!395885 e!395887)))

(declare-fun res!460136 () Bool)

(assert (=> b!696191 (=> (not res!460136) (not e!395887))))

(assert (=> b!696191 (= res!460136 (bvsle from!3004 i!1382))))

(declare-fun b!696192 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!696192 (= e!395887 (not (contains!3752 acc!681 k!2843)))))

(declare-fun b!696193 () Bool)

(declare-fun e!395886 () Bool)

(assert (=> b!696193 (= e!395886 (contains!3752 acc!681 k!2843))))

(declare-fun b!696194 () Bool)

(assert (=> b!696194 (= e!395884 (contains!3752 acc!681 k!2843))))

(declare-fun b!696195 () Bool)

(declare-fun e!395889 () Bool)

(assert (=> b!696195 (= e!395889 (not (contains!3752 acc!681 k!2843)))))

(declare-fun res!460149 () Bool)

(assert (=> start!62156 (=> (not res!460149) (not e!395882))))

(assert (=> start!62156 (= res!460149 (and (bvslt (size!19519 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19519 a!3626))))))

(assert (=> start!62156 e!395882))

(assert (=> start!62156 true))

(declare-fun array_inv!14930 (array!39946) Bool)

(assert (=> start!62156 (array_inv!14930 a!3626)))

(declare-fun b!696196 () Bool)

(declare-fun res!460148 () Bool)

(assert (=> b!696196 (=> (not res!460148) (not e!395882))))

(assert (=> b!696196 (= res!460148 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19519 a!3626))))))

(declare-fun b!696197 () Bool)

(declare-fun res!460142 () Bool)

(assert (=> b!696197 (=> (not res!460142) (not e!395882))))

(assert (=> b!696197 (= res!460142 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!696198 () Bool)

(declare-fun res!460153 () Bool)

(assert (=> b!696198 (=> (not res!460153) (not e!395882))))

(assert (=> b!696198 (= res!460153 (not (contains!3752 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696199 () Bool)

(declare-fun res!460135 () Bool)

(assert (=> b!696199 (=> (not res!460135) (not e!395882))))

(assert (=> b!696199 (= res!460135 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19519 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!696200 () Bool)

(declare-fun res!460139 () Bool)

(assert (=> b!696200 (=> (not res!460139) (not e!395882))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!696200 (= res!460139 (not (validKeyInArray!0 (select (arr!19134 a!3626) from!3004))))))

(declare-fun b!696201 () Bool)

(declare-fun res!460146 () Bool)

(assert (=> b!696201 (=> (not res!460146) (not e!395882))))

(assert (=> b!696201 (= res!460146 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!696202 () Bool)

(declare-fun res!460152 () Bool)

(assert (=> b!696202 (=> (not res!460152) (not e!395882))))

(assert (=> b!696202 (= res!460152 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13172))))

(declare-fun b!696203 () Bool)

(declare-fun res!460141 () Bool)

(assert (=> b!696203 (=> (not res!460141) (not e!395882))))

(declare-fun e!395888 () Bool)

(assert (=> b!696203 (= res!460141 e!395888)))

(declare-fun res!460151 () Bool)

(assert (=> b!696203 (=> res!460151 e!395888)))

(assert (=> b!696203 (= res!460151 e!395886)))

(declare-fun res!460140 () Bool)

(assert (=> b!696203 (=> (not res!460140) (not e!395886))))

(assert (=> b!696203 (= res!460140 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!696204 () Bool)

(declare-fun res!460154 () Bool)

(assert (=> b!696204 (=> (not res!460154) (not e!395882))))

(assert (=> b!696204 (= res!460154 (validKeyInArray!0 k!2843))))

(declare-fun b!696205 () Bool)

(declare-fun res!460144 () Bool)

(assert (=> b!696205 (=> (not res!460144) (not e!395882))))

(declare-fun arrayContainsKey!0 (array!39946 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!696205 (= res!460144 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!696206 () Bool)

(assert (=> b!696206 (= e!395888 e!395889)))

(declare-fun res!460150 () Bool)

(assert (=> b!696206 (=> (not res!460150) (not e!395889))))

(assert (=> b!696206 (= res!460150 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!62156 res!460149) b!696189))

(assert (= (and b!696189 res!460138) b!696190))

(assert (= (and b!696190 res!460145) b!696198))

(assert (= (and b!696198 res!460153) b!696188))

(assert (= (and b!696188 res!460143) b!696194))

(assert (= (and b!696188 (not res!460147)) b!696191))

(assert (= (and b!696191 res!460136) b!696192))

(assert (= (and b!696188 res!460137) b!696202))

(assert (= (and b!696202 res!460152) b!696197))

(assert (= (and b!696197 res!460142) b!696196))

(assert (= (and b!696196 res!460148) b!696204))

(assert (= (and b!696204 res!460154) b!696205))

(assert (= (and b!696205 res!460144) b!696199))

(assert (= (and b!696199 res!460135) b!696200))

(assert (= (and b!696200 res!460139) b!696201))

(assert (= (and b!696201 res!460146) b!696203))

(assert (= (and b!696203 res!460140) b!696193))

(assert (= (and b!696203 (not res!460151)) b!696206))

(assert (= (and b!696206 res!460150) b!696195))

(assert (= (and b!696203 res!460141) b!696187))

(declare-fun m!657275 () Bool)

(assert (=> b!696194 m!657275))

(declare-fun m!657277 () Bool)

(assert (=> b!696202 m!657277))

(declare-fun m!657279 () Bool)

(assert (=> b!696197 m!657279))

(assert (=> b!696195 m!657275))

(declare-fun m!657281 () Bool)

(assert (=> b!696205 m!657281))

(declare-fun m!657283 () Bool)

(assert (=> b!696189 m!657283))

(declare-fun m!657285 () Bool)

(assert (=> b!696200 m!657285))

(assert (=> b!696200 m!657285))

(declare-fun m!657287 () Bool)

(assert (=> b!696200 m!657287))

(declare-fun m!657289 () Bool)

(assert (=> b!696190 m!657289))

(declare-fun m!657291 () Bool)

(assert (=> b!696198 m!657291))

(assert (=> b!696193 m!657275))

(declare-fun m!657293 () Bool)

(assert (=> b!696204 m!657293))

(declare-fun m!657295 () Bool)

(assert (=> start!62156 m!657295))

(assert (=> b!696192 m!657275))

(declare-fun m!657297 () Bool)

(assert (=> b!696187 m!657297))

(push 1)

(assert (not b!696200))

(assert (not b!696204))

(assert (not b!696192))

(assert (not b!696198))

(assert (not b!696193))

(assert (not b!696187))

(assert (not b!696202))

(assert (not start!62156))

(assert (not b!696189))

(assert (not b!696194))

(assert (not b!696197))

(assert (not b!696190))

(assert (not b!696205))

(assert (not b!696195))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!96083 () Bool)

(declare-fun lt!317104 () Bool)

(declare-fun content!325 (List!13175) (Set (_ BitVec 64)))

(assert (=> d!96083 (= lt!317104 (set.member k!2843 (content!325 acc!681)))))

(declare-fun e!395975 () Bool)

(assert (=> d!96083 (= lt!317104 e!395975)))

(declare-fun res!460306 () Bool)

(assert (=> d!96083 (=> (not res!460306) (not e!395975))))

(assert (=> d!96083 (= res!460306 (is-Cons!13171 acc!681))))

(assert (=> d!96083 (= (contains!3752 acc!681 k!2843) lt!317104)))

(declare-fun b!696368 () Bool)

(declare-fun e!395974 () Bool)

(assert (=> b!696368 (= e!395975 e!395974)))

(declare-fun res!460307 () Bool)

(assert (=> b!696368 (=> res!460307 e!395974)))

(assert (=> b!696368 (= res!460307 (= (h!14216 acc!681) k!2843))))

(declare-fun b!696369 () Bool)

(assert (=> b!696369 (= e!395974 (contains!3752 (t!19457 acc!681) k!2843))))

(assert (= (and d!96083 res!460306) b!696368))

(assert (= (and b!696368 (not res!460307)) b!696369))

(declare-fun m!657377 () Bool)

(assert (=> d!96083 m!657377))

(declare-fun m!657379 () Bool)

(assert (=> d!96083 m!657379))

(declare-fun m!657381 () Bool)

(assert (=> b!696369 m!657381))

(assert (=> b!696195 d!96083))

(declare-fun b!696406 () Bool)

(declare-fun e!396008 () Bool)

(assert (=> b!696406 (= e!396008 (contains!3752 acc!681 (select (arr!19134 a!3626) from!3004)))))

(declare-fun bm!34305 () Bool)

(declare-fun c!78402 () Bool)

(declare-fun call!34308 () Bool)

(assert (=> bm!34305 (= call!34308 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78402 (Cons!13171 (select (arr!19134 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!696407 () Bool)

(declare-fun e!396011 () Bool)

(assert (=> b!696407 (= e!396011 call!34308)))

(declare-fun b!696409 () Bool)

(declare-fun e!396009 () Bool)

(declare-fun e!396010 () Bool)

(assert (=> b!696409 (= e!396009 e!396010)))

(declare-fun res!460336 () Bool)

(assert (=> b!696409 (=> (not res!460336) (not e!396010))))

(assert (=> b!696409 (= res!460336 (not e!396008))))

(declare-fun res!460337 () Bool)

(assert (=> b!696409 (=> (not res!460337) (not e!396008))))

(assert (=> b!696409 (= res!460337 (validKeyInArray!0 (select (arr!19134 a!3626) from!3004)))))

(declare-fun b!696410 () Bool)

(assert (=> b!696410 (= e!396010 e!396011)))

(assert (=> b!696410 (= c!78402 (validKeyInArray!0 (select (arr!19134 a!3626) from!3004)))))

(declare-fun b!696408 () Bool)

(assert (=> b!696408 (= e!396011 call!34308)))

(declare-fun d!96095 () Bool)

(declare-fun res!460338 () Bool)

(assert (=> d!96095 (=> res!460338 e!396009)))

(assert (=> d!96095 (= res!460338 (bvsge from!3004 (size!19519 a!3626)))))

(assert (=> d!96095 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!396009)))

(assert (= (and d!96095 (not res!460338)) b!696409))

(assert (= (and b!696409 res!460337) b!696406))

(assert (= (and b!696409 res!460336) b!696410))

(assert (= (and b!696410 c!78402) b!696408))

(assert (= (and b!696410 (not c!78402)) b!696407))

(assert (= (or b!696408 b!696407) bm!34305))

(assert (=> b!696406 m!657285))

(assert (=> b!696406 m!657285))

(declare-fun m!657399 () Bool)

(assert (=> b!696406 m!657399))

(assert (=> bm!34305 m!657285))

(declare-fun m!657401 () Bool)

(assert (=> bm!34305 m!657401))

(assert (=> b!696409 m!657285))

(assert (=> b!696409 m!657285))

(assert (=> b!696409 m!657287))

(assert (=> b!696410 m!657285))

(assert (=> b!696410 m!657285))

(assert (=> b!696410 m!657287))

(assert (=> b!696197 d!96095))

(declare-fun b!696411 () Bool)

(declare-fun e!396012 () Bool)

(assert (=> b!696411 (= e!396012 (contains!3752 acc!681 (select (arr!19134 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun call!34309 () Bool)

(declare-fun bm!34306 () Bool)

(declare-fun c!78403 () Bool)

(assert (=> bm!34306 (= call!34309 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!78403 (Cons!13171 (select (arr!19134 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!696412 () Bool)

(declare-fun e!396015 () Bool)

(assert (=> b!696412 (= e!396015 call!34309)))

(declare-fun b!696414 () Bool)

(declare-fun e!396013 () Bool)

(declare-fun e!396014 () Bool)

(assert (=> b!696414 (= e!396013 e!396014)))

(declare-fun res!460339 () Bool)

(assert (=> b!696414 (=> (not res!460339) (not e!396014))))

(assert (=> b!696414 (= res!460339 (not e!396012))))

(declare-fun res!460340 () Bool)

(assert (=> b!696414 (=> (not res!460340) (not e!396012))))

(assert (=> b!696414 (= res!460340 (validKeyInArray!0 (select (arr!19134 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!696415 () Bool)

(assert (=> b!696415 (= e!396014 e!396015)))

(assert (=> b!696415 (= c!78403 (validKeyInArray!0 (select (arr!19134 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!696413 () Bool)

(assert (=> b!696413 (= e!396015 call!34309)))

(declare-fun d!96109 () Bool)

(declare-fun res!460341 () Bool)

(assert (=> d!96109 (=> res!460341 e!396013)))

(assert (=> d!96109 (= res!460341 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19519 a!3626)))))

(assert (=> d!96109 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!396013)))

(assert (= (and d!96109 (not res!460341)) b!696414))

(assert (= (and b!696414 res!460340) b!696411))

(assert (= (and b!696414 res!460339) b!696415))

(assert (= (and b!696415 c!78403) b!696413))

(assert (= (and b!696415 (not c!78403)) b!696412))

(assert (= (or b!696413 b!696412) bm!34306))

(declare-fun m!657403 () Bool)

(assert (=> b!696411 m!657403))

(assert (=> b!696411 m!657403))

(declare-fun m!657405 () Bool)

(assert (=> b!696411 m!657405))

(assert (=> bm!34306 m!657403))

(declare-fun m!657407 () Bool)

(assert (=> bm!34306 m!657407))

(assert (=> b!696414 m!657403))

(assert (=> b!696414 m!657403))

(declare-fun m!657409 () Bool)

(assert (=> b!696414 m!657409))

(assert (=> b!696415 m!657403))

(assert (=> b!696415 m!657403))

(assert (=> b!696415 m!657409))

(assert (=> b!696187 d!96109))

(declare-fun d!96111 () Bool)

(declare-fun lt!317107 () Bool)

(assert (=> d!96111 (= lt!317107 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!325 acc!681)))))

(declare-fun e!396021 () Bool)

(assert (=> d!96111 (= lt!317107 e!396021)))

(declare-fun res!460345 () Bool)

(assert (=> d!96111 (=> (not res!460345) (not e!396021))))

(assert (=> d!96111 (= res!460345 (is-Cons!13171 acc!681))))

(assert (=> d!96111 (= (contains!3752 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!317107)))

(declare-fun b!696421 () Bool)

(declare-fun e!396020 () Bool)

(assert (=> b!696421 (= e!396021 e!396020)))

(declare-fun res!460346 () Bool)

(assert (=> b!696421 (=> res!460346 e!396020)))

(assert (=> b!696421 (= res!460346 (= (h!14216 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!696422 () Bool)

(assert (=> b!696422 (= e!396020 (contains!3752 (t!19457 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96111 res!460345) b!696421))

(assert (= (and b!696421 (not res!460346)) b!696422))

(assert (=> d!96111 m!657377))

(declare-fun m!657419 () Bool)

(assert (=> d!96111 m!657419))

(declare-fun m!657421 () Bool)

(assert (=> b!696422 m!657421))

(assert (=> b!696198 d!96111))

(declare-fun d!96113 () Bool)

(declare-fun res!460355 () Bool)

(declare-fun e!396030 () Bool)

(assert (=> d!96113 (=> res!460355 e!396030)))

(assert (=> d!96113 (= res!460355 (is-Nil!13172 acc!681))))

(assert (=> d!96113 (= (noDuplicate!999 acc!681) e!396030)))

(declare-fun b!696431 () Bool)

(declare-fun e!396031 () Bool)

(assert (=> b!696431 (= e!396030 e!396031)))

(declare-fun res!460356 () Bool)

(assert (=> b!696431 (=> (not res!460356) (not e!396031))))

(assert (=> b!696431 (= res!460356 (not (contains!3752 (t!19457 acc!681) (h!14216 acc!681))))))

(declare-fun b!696432 () Bool)

(assert (=> b!696432 (= e!396031 (noDuplicate!999 (t!19457 acc!681)))))

(assert (= (and d!96113 (not res!460355)) b!696431))

(assert (= (and b!696431 res!460356) b!696432))

(declare-fun m!657423 () Bool)

(assert (=> b!696431 m!657423))

(declare-fun m!657425 () Bool)

(assert (=> b!696432 m!657425))

(assert (=> b!696189 d!96113))

(declare-fun d!96117 () Bool)

(assert (=> d!96117 (= (array_inv!14930 a!3626) (bvsge (size!19519 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!62156 d!96117))

(declare-fun d!96121 () Bool)

(assert (=> d!96121 (= (validKeyInArray!0 (select (arr!19134 a!3626) from!3004)) (and (not (= (select (arr!19134 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19134 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!696200 d!96121))

(declare-fun d!96123 () Bool)

(declare-fun lt!317108 () Bool)

(assert (=> d!96123 (= lt!317108 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!325 acc!681)))))

(declare-fun e!396039 () Bool)

(assert (=> d!96123 (= lt!317108 e!396039)))

(declare-fun res!460363 () Bool)

(assert (=> d!96123 (=> (not res!460363) (not e!396039))))

(assert (=> d!96123 (= res!460363 (is-Cons!13171 acc!681))))

(assert (=> d!96123 (= (contains!3752 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!317108)))

(declare-fun b!696439 () Bool)

(declare-fun e!396038 () Bool)

(assert (=> b!696439 (= e!396039 e!396038)))

(declare-fun res!460364 () Bool)

(assert (=> b!696439 (=> res!460364 e!396038)))

(assert (=> b!696439 (= res!460364 (= (h!14216 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

