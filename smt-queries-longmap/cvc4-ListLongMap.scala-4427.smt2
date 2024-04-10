; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61374 () Bool)

(assert start!61374)

(declare-fun b!687207 () Bool)

(declare-fun res!452168 () Bool)

(declare-fun e!391340 () Bool)

(assert (=> b!687207 (=> (not res!452168) (not e!391340))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39677 0))(
  ( (array!39678 (arr!19013 (Array (_ BitVec 32) (_ BitVec 64))) (size!19390 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39677)

(assert (=> b!687207 (= res!452168 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19390 a!3626))))))

(declare-fun b!687208 () Bool)

(declare-fun res!452174 () Bool)

(declare-fun e!391342 () Bool)

(assert (=> b!687208 (=> res!452174 e!391342)))

(declare-datatypes ((List!13054 0))(
  ( (Nil!13051) (Cons!13050 (h!14095 (_ BitVec 64)) (t!19312 List!13054)) )
))
(declare-fun lt!315355 () List!13054)

(declare-fun noDuplicate!878 (List!13054) Bool)

(assert (=> b!687208 (= res!452174 (not (noDuplicate!878 lt!315355)))))

(declare-fun b!687209 () Bool)

(declare-fun e!391344 () Bool)

(declare-fun contains!3631 (List!13054 (_ BitVec 64)) Bool)

(assert (=> b!687209 (= e!391344 (not (contains!3631 lt!315355 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!687210 () Bool)

(declare-datatypes ((Unit!24232 0))(
  ( (Unit!24233) )
))
(declare-fun e!391346 () Unit!24232)

(declare-fun lt!315353 () Unit!24232)

(assert (=> b!687210 (= e!391346 lt!315353)))

(declare-fun lt!315354 () Unit!24232)

(declare-fun acc!681 () List!13054)

(declare-fun lemmaListSubSeqRefl!0 (List!13054) Unit!24232)

(assert (=> b!687210 (= lt!315354 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!217 (List!13054 List!13054) Bool)

(assert (=> b!687210 (subseq!217 acc!681 acc!681)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39677 List!13054 List!13054 (_ BitVec 32)) Unit!24232)

(declare-fun $colon$colon!382 (List!13054 (_ BitVec 64)) List!13054)

(assert (=> b!687210 (= lt!315353 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!382 acc!681 (select (arr!19013 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39677 (_ BitVec 32) List!13054) Bool)

(assert (=> b!687210 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!687211 () Bool)

(declare-fun res!452183 () Bool)

(assert (=> b!687211 (=> (not res!452183) (not e!391340))))

(declare-fun e!391343 () Bool)

(assert (=> b!687211 (= res!452183 e!391343)))

(declare-fun res!452172 () Bool)

(assert (=> b!687211 (=> res!452172 e!391343)))

(declare-fun e!391345 () Bool)

(assert (=> b!687211 (= res!452172 e!391345)))

(declare-fun res!452171 () Bool)

(assert (=> b!687211 (=> (not res!452171) (not e!391345))))

(assert (=> b!687211 (= res!452171 (bvsgt from!3004 i!1382))))

(declare-fun b!687212 () Bool)

(declare-fun res!452167 () Bool)

(assert (=> b!687212 (=> (not res!452167) (not e!391340))))

(assert (=> b!687212 (= res!452167 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13051))))

(declare-fun b!687213 () Bool)

(declare-fun res!452176 () Bool)

(assert (=> b!687213 (=> (not res!452176) (not e!391340))))

(assert (=> b!687213 (= res!452176 (noDuplicate!878 acc!681))))

(declare-fun b!687214 () Bool)

(assert (=> b!687214 (= e!391342 e!391344)))

(declare-fun res!452169 () Bool)

(assert (=> b!687214 (=> (not res!452169) (not e!391344))))

(assert (=> b!687214 (= res!452169 (not (contains!3631 lt!315355 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!687215 () Bool)

(declare-fun res!452178 () Bool)

(assert (=> b!687215 (=> (not res!452178) (not e!391340))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!687215 (= res!452178 (validKeyInArray!0 k!2843))))

(declare-fun b!687216 () Bool)

(declare-fun res!452170 () Bool)

(assert (=> b!687216 (=> (not res!452170) (not e!391340))))

(assert (=> b!687216 (= res!452170 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!687218 () Bool)

(declare-fun res!452179 () Bool)

(assert (=> b!687218 (=> (not res!452179) (not e!391340))))

(assert (=> b!687218 (= res!452179 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19390 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!687219 () Bool)

(assert (=> b!687219 (= e!391345 (contains!3631 acc!681 k!2843))))

(declare-fun b!687220 () Bool)

(declare-fun res!452181 () Bool)

(assert (=> b!687220 (=> (not res!452181) (not e!391340))))

(assert (=> b!687220 (= res!452181 (not (contains!3631 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!687221 () Bool)

(declare-fun e!391339 () Bool)

(assert (=> b!687221 (= e!391339 (not (contains!3631 acc!681 k!2843)))))

(declare-fun b!687222 () Bool)

(assert (=> b!687222 (= e!391340 (not e!391342))))

(declare-fun res!452180 () Bool)

(assert (=> b!687222 (=> res!452180 e!391342)))

(assert (=> b!687222 (= res!452180 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!687222 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315355)))

(declare-fun lt!315352 () Unit!24232)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39677 (_ BitVec 64) (_ BitVec 32) List!13054 List!13054) Unit!24232)

(assert (=> b!687222 (= lt!315352 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315355))))

(declare-fun -!182 (List!13054 (_ BitVec 64)) List!13054)

(assert (=> b!687222 (= (-!182 lt!315355 k!2843) acc!681)))

(assert (=> b!687222 (= lt!315355 ($colon$colon!382 acc!681 k!2843))))

(declare-fun lt!315349 () Unit!24232)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13054) Unit!24232)

(assert (=> b!687222 (= lt!315349 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!687222 (subseq!217 acc!681 acc!681)))

(declare-fun lt!315350 () Unit!24232)

(assert (=> b!687222 (= lt!315350 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!687222 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315348 () Unit!24232)

(assert (=> b!687222 (= lt!315348 e!391346)))

(declare-fun c!77887 () Bool)

(assert (=> b!687222 (= c!77887 (validKeyInArray!0 (select (arr!19013 a!3626) from!3004)))))

(declare-fun lt!315347 () Unit!24232)

(declare-fun e!391347 () Unit!24232)

(assert (=> b!687222 (= lt!315347 e!391347)))

(declare-fun c!77888 () Bool)

(declare-fun arrayContainsKey!0 (array!39677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!687222 (= c!77888 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!687222 (arrayContainsKey!0 (array!39678 (store (arr!19013 a!3626) i!1382 k!2843) (size!19390 a!3626)) k!2843 from!3004)))

(declare-fun b!687223 () Bool)

(declare-fun res!452175 () Bool)

(assert (=> b!687223 (=> (not res!452175) (not e!391340))))

(assert (=> b!687223 (= res!452175 (not (contains!3631 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!687224 () Bool)

(declare-fun Unit!24234 () Unit!24232)

(assert (=> b!687224 (= e!391347 Unit!24234)))

(declare-fun b!687225 () Bool)

(assert (=> b!687225 (= e!391343 e!391339)))

(declare-fun res!452177 () Bool)

(assert (=> b!687225 (=> (not res!452177) (not e!391339))))

(assert (=> b!687225 (= res!452177 (bvsle from!3004 i!1382))))

(declare-fun b!687226 () Bool)

(declare-fun res!452182 () Bool)

(assert (=> b!687226 (=> (not res!452182) (not e!391340))))

(assert (=> b!687226 (= res!452182 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!687227 () Bool)

(declare-fun Unit!24235 () Unit!24232)

(assert (=> b!687227 (= e!391347 Unit!24235)))

(declare-fun lt!315351 () Unit!24232)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39677 (_ BitVec 64) (_ BitVec 32)) Unit!24232)

(assert (=> b!687227 (= lt!315351 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!687227 false))

(declare-fun b!687217 () Bool)

(declare-fun Unit!24236 () Unit!24232)

(assert (=> b!687217 (= e!391346 Unit!24236)))

(declare-fun res!452173 () Bool)

(assert (=> start!61374 (=> (not res!452173) (not e!391340))))

(assert (=> start!61374 (= res!452173 (and (bvslt (size!19390 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19390 a!3626))))))

(assert (=> start!61374 e!391340))

(assert (=> start!61374 true))

(declare-fun array_inv!14809 (array!39677) Bool)

(assert (=> start!61374 (array_inv!14809 a!3626)))

(assert (= (and start!61374 res!452173) b!687213))

(assert (= (and b!687213 res!452176) b!687220))

(assert (= (and b!687220 res!452181) b!687223))

(assert (= (and b!687223 res!452175) b!687211))

(assert (= (and b!687211 res!452171) b!687219))

(assert (= (and b!687211 (not res!452172)) b!687225))

(assert (= (and b!687225 res!452177) b!687221))

(assert (= (and b!687211 res!452183) b!687212))

(assert (= (and b!687212 res!452167) b!687216))

(assert (= (and b!687216 res!452170) b!687207))

(assert (= (and b!687207 res!452168) b!687215))

(assert (= (and b!687215 res!452178) b!687226))

(assert (= (and b!687226 res!452182) b!687218))

(assert (= (and b!687218 res!452179) b!687222))

(assert (= (and b!687222 c!77888) b!687227))

(assert (= (and b!687222 (not c!77888)) b!687224))

(assert (= (and b!687222 c!77887) b!687210))

(assert (= (and b!687222 (not c!77887)) b!687217))

(assert (= (and b!687222 (not res!452180)) b!687208))

(assert (= (and b!687208 (not res!452174)) b!687214))

(assert (= (and b!687214 res!452169) b!687209))

(declare-fun m!651243 () Bool)

(assert (=> b!687212 m!651243))

(declare-fun m!651245 () Bool)

(assert (=> b!687221 m!651245))

(declare-fun m!651247 () Bool)

(assert (=> b!687222 m!651247))

(declare-fun m!651249 () Bool)

(assert (=> b!687222 m!651249))

(declare-fun m!651251 () Bool)

(assert (=> b!687222 m!651251))

(declare-fun m!651253 () Bool)

(assert (=> b!687222 m!651253))

(declare-fun m!651255 () Bool)

(assert (=> b!687222 m!651255))

(declare-fun m!651257 () Bool)

(assert (=> b!687222 m!651257))

(declare-fun m!651259 () Bool)

(assert (=> b!687222 m!651259))

(declare-fun m!651261 () Bool)

(assert (=> b!687222 m!651261))

(declare-fun m!651263 () Bool)

(assert (=> b!687222 m!651263))

(assert (=> b!687222 m!651251))

(declare-fun m!651265 () Bool)

(assert (=> b!687222 m!651265))

(declare-fun m!651267 () Bool)

(assert (=> b!687222 m!651267))

(declare-fun m!651269 () Bool)

(assert (=> b!687222 m!651269))

(declare-fun m!651271 () Bool)

(assert (=> b!687222 m!651271))

(assert (=> b!687219 m!651245))

(declare-fun m!651273 () Bool)

(assert (=> b!687216 m!651273))

(declare-fun m!651275 () Bool)

(assert (=> b!687220 m!651275))

(assert (=> b!687210 m!651249))

(assert (=> b!687210 m!651251))

(declare-fun m!651277 () Bool)

(assert (=> b!687210 m!651277))

(declare-fun m!651279 () Bool)

(assert (=> b!687210 m!651279))

(assert (=> b!687210 m!651251))

(assert (=> b!687210 m!651277))

(assert (=> b!687210 m!651259))

(assert (=> b!687210 m!651271))

(declare-fun m!651281 () Bool)

(assert (=> b!687226 m!651281))

(declare-fun m!651283 () Bool)

(assert (=> b!687215 m!651283))

(declare-fun m!651285 () Bool)

(assert (=> b!687208 m!651285))

(declare-fun m!651287 () Bool)

(assert (=> b!687209 m!651287))

(declare-fun m!651289 () Bool)

(assert (=> b!687223 m!651289))

(declare-fun m!651291 () Bool)

(assert (=> b!687227 m!651291))

(declare-fun m!651293 () Bool)

(assert (=> start!61374 m!651293))

(declare-fun m!651295 () Bool)

(assert (=> b!687213 m!651295))

(declare-fun m!651297 () Bool)

(assert (=> b!687214 m!651297))

(push 1)

(assert (not b!687212))

(assert (not b!687222))

(assert (not b!687219))

(assert (not b!687213))

(assert (not b!687216))

(assert (not b!687226))

(assert (not start!61374))

(assert (not b!687210))

(assert (not b!687223))

(assert (not b!687214))

(assert (not b!687215))

(assert (not b!687221))

(assert (not b!687209))

(assert (not b!687220))

(assert (not b!687227))

(assert (not b!687208))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94925 () Bool)

(assert (=> d!94925 (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))

(declare-fun lt!315366 () Unit!24232)

(declare-fun choose!13 (array!39677 (_ BitVec 64) (_ BitVec 32)) Unit!24232)

(assert (=> d!94925 (= lt!315366 (choose!13 a!3626 k!2843 from!3004))))

(assert (=> d!94925 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!94925 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004) lt!315366)))

(declare-fun bs!20149 () Bool)

(assert (= bs!20149 d!94925))

(assert (=> bs!20149 m!651281))

(declare-fun m!651323 () Bool)

(assert (=> bs!20149 m!651323))

(assert (=> b!687227 d!94925))

(declare-fun d!94933 () Bool)

(declare-fun res!452242 () Bool)

(declare-fun e!391414 () Bool)

(assert (=> d!94933 (=> res!452242 e!391414)))

(assert (=> d!94933 (= res!452242 (bvsge from!3004 (size!19390 a!3626)))))

(assert (=> d!94933 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!391414)))

(declare-fun b!687299 () Bool)

(declare-fun e!391413 () Bool)

(declare-fun call!34135 () Bool)

(assert (=> b!687299 (= e!391413 call!34135)))

(declare-fun b!687300 () Bool)

(assert (=> b!687300 (= e!391413 call!34135)))

(declare-fun b!687301 () Bool)

(declare-fun e!391412 () Bool)

(assert (=> b!687301 (= e!391414 e!391412)))

(declare-fun res!452243 () Bool)

(assert (=> b!687301 (=> (not res!452243) (not e!391412))))

(declare-fun e!391415 () Bool)

(assert (=> b!687301 (= res!452243 (not e!391415))))

(declare-fun res!452241 () Bool)

(assert (=> b!687301 (=> (not res!452241) (not e!391415))))

(assert (=> b!687301 (= res!452241 (validKeyInArray!0 (select (arr!19013 a!3626) from!3004)))))

(declare-fun bm!34132 () Bool)

(declare-fun c!77896 () Bool)

(assert (=> bm!34132 (= call!34135 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77896 (Cons!13050 (select (arr!19013 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!687302 () Bool)

(assert (=> b!687302 (= e!391412 e!391413)))

(assert (=> b!687302 (= c!77896 (validKeyInArray!0 (select (arr!19013 a!3626) from!3004)))))

(declare-fun b!687303 () Bool)

(assert (=> b!687303 (= e!391415 (contains!3631 acc!681 (select (arr!19013 a!3626) from!3004)))))

(assert (= (and d!94933 (not res!452242)) b!687301))

(assert (= (and b!687301 res!452241) b!687303))

(assert (= (and b!687301 res!452243) b!687302))

(assert (= (and b!687302 c!77896) b!687300))

(assert (= (and b!687302 (not c!77896)) b!687299))

(assert (= (or b!687300 b!687299) bm!34132))

(assert (=> b!687301 m!651251))

(assert (=> b!687301 m!651251))

(assert (=> b!687301 m!651265))

(assert (=> bm!34132 m!651251))

(declare-fun m!651343 () Bool)

(assert (=> bm!34132 m!651343))

(assert (=> b!687302 m!651251))

(assert (=> b!687302 m!651251))

(assert (=> b!687302 m!651265))

(assert (=> b!687303 m!651251))

(assert (=> b!687303 m!651251))

(declare-fun m!651345 () Bool)

(assert (=> b!687303 m!651345))

(assert (=> b!687216 d!94933))

(declare-fun d!94945 () Bool)

(declare-fun res!452266 () Bool)

(declare-fun e!391440 () Bool)

(assert (=> d!94945 (=> res!452266 e!391440)))

(assert (=> d!94945 (= res!452266 (= (select (arr!19013 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!94945 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!391440)))

(declare-fun b!687330 () Bool)

(declare-fun e!391441 () Bool)

(assert (=> b!687330 (= e!391440 e!391441)))

(declare-fun res!452267 () Bool)

(assert (=> b!687330 (=> (not res!452267) (not e!391441))))

(assert (=> b!687330 (= res!452267 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19390 a!3626)))))

(declare-fun b!687331 () Bool)

(assert (=> b!687331 (= e!391441 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!94945 (not res!452266)) b!687330))

(assert (= (and b!687330 res!452267) b!687331))

(declare-fun m!651363 () Bool)

(assert (=> d!94945 m!651363))

(declare-fun m!651365 () Bool)

(assert (=> b!687331 m!651365))

(assert (=> b!687226 d!94945))

(declare-fun d!94951 () Bool)

(assert (=> d!94951 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!687215 d!94951))

(declare-fun d!94957 () Bool)

(declare-fun lt!315378 () Bool)

(declare-fun content!299 (List!13054) (Set (_ BitVec 64)))

(assert (=> d!94957 (= lt!315378 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!299 lt!315355)))))

(declare-fun e!391465 () Bool)

(assert (=> d!94957 (= lt!315378 e!391465)))

(declare-fun res!452291 () Bool)

(assert (=> d!94957 (=> (not res!452291) (not e!391465))))

(assert (=> d!94957 (= res!452291 (is-Cons!13050 lt!315355))))

(assert (=> d!94957 (= (contains!3631 lt!315355 #b0000000000000000000000000000000000000000000000000000000000000000) lt!315378)))

(declare-fun b!687354 () Bool)

(declare-fun e!391464 () Bool)

(assert (=> b!687354 (= e!391465 e!391464)))

(declare-fun res!452290 () Bool)

(assert (=> b!687354 (=> res!452290 e!391464)))

(assert (=> b!687354 (= res!452290 (= (h!14095 lt!315355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687355 () Bool)

(assert (=> b!687355 (= e!391464 (contains!3631 (t!19312 lt!315355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94957 res!452291) b!687354))

(assert (= (and b!687354 (not res!452290)) b!687355))

(declare-fun m!651393 () Bool)

(assert (=> d!94957 m!651393))

(declare-fun m!651395 () Bool)

(assert (=> d!94957 m!651395))

(declare-fun m!651397 () Bool)

(assert (=> b!687355 m!651397))

(assert (=> b!687214 d!94957))

(declare-fun d!94969 () Bool)

(declare-fun lt!315379 () Bool)

(assert (=> d!94969 (= lt!315379 (member k!2843 (content!299 acc!681)))))

(declare-fun e!391467 () Bool)

(assert (=> d!94969 (= lt!315379 e!391467)))

(declare-fun res!452293 () Bool)

(assert (=> d!94969 (=> (not res!452293) (not e!391467))))

(assert (=> d!94969 (= res!452293 (is-Cons!13050 acc!681))))

(assert (=> d!94969 (= (contains!3631 acc!681 k!2843) lt!315379)))

(declare-fun b!687356 () Bool)

(declare-fun e!391466 () Bool)

(assert (=> b!687356 (= e!391467 e!391466)))

(declare-fun res!452292 () Bool)

(assert (=> b!687356 (=> res!452292 e!391466)))

(assert (=> b!687356 (= res!452292 (= (h!14095 acc!681) k!2843))))

(declare-fun b!687357 () Bool)

(assert (=> b!687357 (= e!391466 (contains!3631 (t!19312 acc!681) k!2843))))

(assert (= (and d!94969 res!452293) b!687356))

(assert (= (and b!687356 (not res!452292)) b!687357))

(declare-fun m!651399 () Bool)

(assert (=> d!94969 m!651399))

(declare-fun m!651401 () Bool)

(assert (=> d!94969 m!651401))

(declare-fun m!651403 () Bool)

(assert (=> b!687357 m!651403))

(assert (=> b!687219 d!94969))

(declare-fun d!94971 () Bool)

(declare-fun res!452298 () Bool)

(declare-fun e!391477 () Bool)

(assert (=> d!94971 (=> res!452298 e!391477)))

(assert (=> d!94971 (= res!452298 (is-Nil!13051 lt!315355))))

(assert (=> d!94971 (= (noDuplicate!878 lt!315355) e!391477)))

(declare-fun b!687370 () Bool)

(declare-fun e!391478 () Bool)

(assert (=> b!687370 (= e!391477 e!391478)))

(declare-fun res!452299 () Bool)

(assert (=> b!687370 (=> (not res!452299) (not e!391478))))

(assert (=> b!687370 (= res!452299 (not (contains!3631 (t!19312 lt!315355) (h!14095 lt!315355))))))

(declare-fun b!687371 () Bool)

(assert (=> b!687371 (= e!391478 (noDuplicate!878 (t!19312 lt!315355)))))

(assert (= (and d!94971 (not res!452298)) b!687370))

(assert (= (and b!687370 res!452299) b!687371))

(declare-fun m!651407 () Bool)

(assert (=> b!687370 m!651407))

(declare-fun m!651409 () Bool)

(assert (=> b!687371 m!651409))

(assert (=> b!687208 d!94971))

(assert (=> b!687221 d!94969))

(declare-fun d!94975 () Bool)

(assert (=> d!94975 (= ($colon$colon!382 acc!681 (select (arr!19013 a!3626) from!3004)) (Cons!13050 (select (arr!19013 a!3626) from!3004) acc!681))))

(assert (=> b!687210 d!94975))

(declare-fun b!687393 () Bool)

(declare-fun e!391499 () Bool)

(assert (=> b!687393 (= e!391499 (subseq!217 (t!19312 acc!681) (t!19312 acc!681)))))

(declare-fun b!687394 () Bool)

(declare-fun e!391496 () Bool)

(assert (=> b!687394 (= e!391496 (subseq!217 acc!681 (t!19312 acc!681)))))

(declare-fun d!94977 () Bool)

(declare-fun res!452316 () Bool)

(declare-fun e!391497 () Bool)

(assert (=> d!94977 (=> res!452316 e!391497)))

(assert (=> d!94977 (= res!452316 (is-Nil!13051 acc!681))))

(assert (=> d!94977 (= (subseq!217 acc!681 acc!681) e!391497)))

(declare-fun b!687391 () Bool)

(declare-fun e!391498 () Bool)

(assert (=> b!687391 (= e!391497 e!391498)))

(declare-fun res!452317 () Bool)

(assert (=> b!687391 (=> (not res!452317) (not e!391498))))

(assert (=> b!687391 (= res!452317 (is-Cons!13050 acc!681))))

(declare-fun b!687392 () Bool)

(assert (=> b!687392 (= e!391498 e!391496)))

(declare-fun res!452318 () Bool)

(assert (=> b!687392 (=> res!452318 e!391496)))

(assert (=> b!687392 (= res!452318 e!391499)))

(declare-fun res!452315 () Bool)

(assert (=> b!687392 (=> (not res!452315) (not e!391499))))

(assert (=> b!687392 (= res!452315 (= (h!14095 acc!681) (h!14095 acc!681)))))

(assert (= (and d!94977 (not res!452316)) b!687391))

(assert (= (and b!687391 res!452317) b!687392))

(assert (= (and b!687392 res!452315) b!687393))

(assert (= (and b!687392 (not res!452318)) b!687394))

(declare-fun m!651427 () Bool)

(assert (=> b!687393 m!651427))

(declare-fun m!651429 () Bool)

(assert (=> b!687394 m!651429))

(assert (=> b!687210 d!94977))

(declare-fun d!94987 () Bool)

(assert (=> d!94987 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315394 () Unit!24232)

(declare-fun choose!80 (array!39677 List!13054 List!13054 (_ BitVec 32)) Unit!24232)

(assert (=> d!94987 (= lt!315394 (choose!80 a!3626 ($colon$colon!382 acc!681 (select (arr!19013 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!94987 (bvslt (size!19390 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94987 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!382 acc!681 (select (arr!19013 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!315394)))

(declare-fun bs!20155 () Bool)

(assert (= bs!20155 d!94987))

(assert (=> bs!20155 m!651249))

(assert (=> bs!20155 m!651277))

(declare-fun m!651447 () Bool)

(assert (=> bs!20155 m!651447))

(assert (=> b!687210 d!94987))

(declare-fun d!94999 () Bool)

(assert (=> d!94999 (subseq!217 acc!681 acc!681)))

(declare-fun lt!315399 () Unit!24232)

(declare-fun choose!36 (List!13054) Unit!24232)

(assert (=> d!94999 (= lt!315399 (choose!36 acc!681))))

(assert (=> d!94999 (= (lemmaListSubSeqRefl!0 acc!681) lt!315399)))

(declare-fun bs!20156 () Bool)

(assert (= bs!20156 d!94999))

(assert (=> bs!20156 m!651271))

(declare-fun m!651453 () Bool)

(assert (=> bs!20156 m!651453))

(assert (=> b!687210 d!94999))

(declare-fun d!95003 () Bool)

(declare-fun res!452333 () Bool)

(declare-fun e!391518 () Bool)

(assert (=> d!95003 (=> res!452333 e!391518)))

(assert (=> d!95003 (= res!452333 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19390 a!3626)))))

(assert (=> d!95003 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!391518)))

(declare-fun b!687414 () Bool)

(declare-fun e!391517 () Bool)

(declare-fun call!34144 () Bool)

(assert (=> b!687414 (= e!391517 call!34144)))

(declare-fun b!687415 () Bool)

(assert (=> b!687415 (= e!391517 call!34144)))

(declare-fun b!687416 () Bool)

(declare-fun e!391516 () Bool)

(assert (=> b!687416 (= e!391518 e!391516)))

(declare-fun res!452334 () Bool)

(assert (=> b!687416 (=> (not res!452334) (not e!391516))))

(declare-fun e!391519 () Bool)

(assert (=> b!687416 (= res!452334 (not e!391519))))

(declare-fun res!452332 () Bool)

(assert (=> b!687416 (=> (not res!452332) (not e!391519))))

(assert (=> b!687416 (= res!452332 (validKeyInArray!0 (select (arr!19013 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun c!77908 () Bool)

(declare-fun bm!34141 () Bool)

(assert (=> bm!34141 (= call!34144 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77908 (Cons!13050 (select (arr!19013 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!687417 () Bool)

(assert (=> b!687417 (= e!391516 e!391517)))

(assert (=> b!687417 (= c!77908 (validKeyInArray!0 (select (arr!19013 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!687418 () Bool)

(assert (=> b!687418 (= e!391519 (contains!3631 acc!681 (select (arr!19013 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (= (and d!95003 (not res!452333)) b!687416))

(assert (= (and b!687416 res!452332) b!687418))

(assert (= (and b!687416 res!452334) b!687417))

(assert (= (and b!687417 c!77908) b!687415))

(assert (= (and b!687417 (not c!77908)) b!687414))

(assert (= (or b!687415 b!687414) bm!34141))

(declare-fun m!651459 () Bool)

(assert (=> b!687416 m!651459))

(assert (=> b!687416 m!651459))

(declare-fun m!651461 () Bool)

(assert (=> b!687416 m!651461))

(assert (=> bm!34141 m!651459))

(declare-fun m!651463 () Bool)

(assert (=> bm!34141 m!651463))

(assert (=> b!687417 m!651459))

(assert (=> b!687417 m!651459))

(assert (=> b!687417 m!651461))

(assert (=> b!687418 m!651459))

(assert (=> b!687418 m!651459))

(declare-fun m!651469 () Bool)

(assert (=> b!687418 m!651469))

(assert (=> b!687210 d!95003))

(declare-fun d!95009 () Bool)

(declare-fun lt!315401 () Bool)

(assert (=> d!95009 (= lt!315401 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!299 acc!681)))))

(declare-fun e!391523 () Bool)

(assert (=> d!95009 (= lt!315401 e!391523)))

(declare-fun res!452338 () Bool)

(assert (=> d!95009 (=> (not res!452338) (not e!391523))))

(assert (=> d!95009 (= res!452338 (is-Cons!13050 acc!681))))

(assert (=> d!95009 (= (contains!3631 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!315401)))

(declare-fun b!687421 () Bool)

(declare-fun e!391522 () Bool)

(assert (=> b!687421 (= e!391523 e!391522)))

(declare-fun res!452337 () Bool)

(assert (=> b!687421 (=> res!452337 e!391522)))

(assert (=> b!687421 (= res!452337 (= (h!14095 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687422 () Bool)

(assert (=> b!687422 (= e!391522 (contains!3631 (t!19312 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95009 res!452338) b!687421))

(assert (= (and b!687421 (not res!452337)) b!687422))

(assert (=> d!95009 m!651399))

(declare-fun m!651471 () Bool)

(assert (=> d!95009 m!651471))

(declare-fun m!651473 () Bool)

(assert (=> b!687422 m!651473))

(assert (=> b!687220 d!95009))

(declare-fun d!95011 () Bool)

(declare-fun lt!315402 () Bool)

(assert (=> d!95011 (= lt!315402 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!299 lt!315355)))))

(declare-fun e!391525 () Bool)

(assert (=> d!95011 (= lt!315402 e!391525)))

(declare-fun res!452340 () Bool)

(assert (=> d!95011 (=> (not res!452340) (not e!391525))))

(assert (=> d!95011 (= res!452340 (is-Cons!13050 lt!315355))))

(assert (=> d!95011 (= (contains!3631 lt!315355 #b1000000000000000000000000000000000000000000000000000000000000000) lt!315402)))

(declare-fun b!687423 () Bool)

(declare-fun e!391524 () Bool)

(assert (=> b!687423 (= e!391525 e!391524)))

(declare-fun res!452339 () Bool)

(assert (=> b!687423 (=> res!452339 e!391524)))

(assert (=> b!687423 (= res!452339 (= (h!14095 lt!315355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687424 () Bool)

(assert (=> b!687424 (= e!391524 (contains!3631 (t!19312 lt!315355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95011 res!452340) b!687423))

(assert (= (and b!687423 (not res!452339)) b!687424))

(assert (=> d!95011 m!651393))

(declare-fun m!651475 () Bool)

(assert (=> d!95011 m!651475))

(declare-fun m!651477 () Bool)

(assert (=> b!687424 m!651477))

(assert (=> b!687209 d!95011))

(declare-fun d!95013 () Bool)

(declare-fun res!452341 () Bool)

(declare-fun e!391526 () Bool)

(assert (=> d!95013 (=> res!452341 e!391526)))

(assert (=> d!95013 (= res!452341 (is-Nil!13051 acc!681))))

(assert (=> d!95013 (= (noDuplicate!878 acc!681) e!391526)))

(declare-fun b!687425 () Bool)

(declare-fun e!391527 () Bool)

(assert (=> b!687425 (= e!391526 e!391527)))

(declare-fun res!452342 () Bool)

(assert (=> b!687425 (=> (not res!452342) (not e!391527))))

(assert (=> b!687425 (= res!452342 (not (contains!3631 (t!19312 acc!681) (h!14095 acc!681))))))

(declare-fun b!687426 () Bool)

(assert (=> b!687426 (= e!391527 (noDuplicate!878 (t!19312 acc!681)))))

(assert (= (and d!95013 (not res!452341)) b!687425))

(assert (= (and b!687425 res!452342) b!687426))

(declare-fun m!651479 () Bool)

(assert (=> b!687425 m!651479))

(declare-fun m!651481 () Bool)

(assert (=> b!687426 m!651481))

(assert (=> b!687213 d!95013))

(declare-fun d!95015 () Bool)

(assert (=> d!95015 (= (array_inv!14809 a!3626) (bvsge (size!19390 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61374 d!95015))

(declare-fun d!95017 () Bool)

(declare-fun lt!315405 () Bool)

(assert (=> d!95017 (= lt!315405 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!299 acc!681)))))

(declare-fun e!391534 () Bool)

(assert (=> d!95017 (= lt!315405 e!391534)))

(declare-fun res!452344 () Bool)

(assert (=> d!95017 (=> (not res!452344) (not e!391534))))

(assert (=> d!95017 (= res!452344 (is-Cons!13050 acc!681))))

(assert (=> d!95017 (= (contains!3631 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!315405)))

(declare-fun b!687435 () Bool)

(declare-fun e!391533 () Bool)

(assert (=> b!687435 (= e!391534 e!391533)))

(declare-fun res!452343 () Bool)

(assert (=> b!687435 (=> res!452343 e!391533)))

(assert (=> b!687435 (= res!452343 (= (h!14095 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687436 () Bool)

(assert (=> b!687436 (= e!391533 (contains!3631 (t!19312 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95017 res!452344) b!687435))

(assert (= (and b!687435 (not res!452343)) b!687436))

(assert (=> d!95017 m!651399))

(declare-fun m!651483 () Bool)

(assert (=> d!95017 m!651483))

(declare-fun m!651485 () Bool)

(assert (=> b!687436 m!651485))

(assert (=> b!687223 d!95017))

(declare-fun d!95019 () Bool)

(declare-fun res!452348 () Bool)

(declare-fun e!391539 () Bool)

(assert (=> d!95019 (=> res!452348 e!391539)))

(assert (=> d!95019 (= res!452348 (bvsge #b00000000000000000000000000000000 (size!19390 a!3626)))))

(assert (=> d!95019 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13051) e!391539)))

(declare-fun b!687439 () Bool)

(declare-fun e!391538 () Bool)

(declare-fun call!34147 () Bool)

(assert (=> b!687439 (= e!391538 call!34147)))

(declare-fun b!687440 () Bool)

(assert (=> b!687440 (= e!391538 call!34147)))

(declare-fun b!687441 () Bool)

(declare-fun e!391537 () Bool)

(assert (=> b!687441 (= e!391539 e!391537)))

(declare-fun res!452349 () Bool)

(assert (=> b!687441 (=> (not res!452349) (not e!391537))))

(declare-fun e!391540 () Bool)

(assert (=> b!687441 (= res!452349 (not e!391540))))

(declare-fun res!452347 () Bool)

(assert (=> b!687441 (=> (not res!452347) (not e!391540))))

