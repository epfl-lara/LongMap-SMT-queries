; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61166 () Bool)

(assert start!61166)

(declare-fun b!685386 () Bool)

(declare-datatypes ((Unit!24125 0))(
  ( (Unit!24126) )
))
(declare-fun e!390293 () Unit!24125)

(declare-fun Unit!24127 () Unit!24125)

(assert (=> b!685386 (= e!390293 Unit!24127)))

(declare-fun b!685387 () Bool)

(declare-fun res!450865 () Bool)

(declare-fun e!390296 () Bool)

(assert (=> b!685387 (=> res!450865 e!390296)))

(declare-datatypes ((List!13075 0))(
  ( (Nil!13072) (Cons!13071 (h!14116 (_ BitVec 64)) (t!19318 List!13075)) )
))
(declare-fun lt!314497 () List!13075)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3597 (List!13075 (_ BitVec 64)) Bool)

(assert (=> b!685387 (= res!450865 (not (contains!3597 lt!314497 k0!2843)))))

(declare-fun b!685388 () Bool)

(declare-fun e!390294 () Bool)

(assert (=> b!685388 (= e!390296 e!390294)))

(declare-fun res!450858 () Bool)

(assert (=> b!685388 (=> (not res!450858) (not e!390294))))

(assert (=> b!685388 (= res!450858 (not (contains!3597 lt!314497 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685389 () Bool)

(declare-fun e!390295 () Unit!24125)

(declare-fun Unit!24128 () Unit!24125)

(assert (=> b!685389 (= e!390295 Unit!24128)))

(declare-fun lt!314496 () Unit!24125)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((array!39636 0))(
  ( (array!39637 (arr!18995 (Array (_ BitVec 32) (_ BitVec 64))) (size!19367 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39636)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39636 (_ BitVec 64) (_ BitVec 32)) Unit!24125)

(assert (=> b!685389 (= lt!314496 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!685389 false))

(declare-fun b!685390 () Bool)

(declare-fun res!450850 () Bool)

(assert (=> b!685390 (=> res!450850 e!390296)))

(declare-fun acc!681 () List!13075)

(declare-fun subseq!200 (List!13075 List!13075) Bool)

(assert (=> b!685390 (= res!450850 (not (subseq!200 acc!681 lt!314497)))))

(declare-fun res!450868 () Bool)

(declare-fun e!390297 () Bool)

(assert (=> start!61166 (=> (not res!450868) (not e!390297))))

(assert (=> start!61166 (= res!450868 (and (bvslt (size!19367 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19367 a!3626))))))

(assert (=> start!61166 e!390297))

(assert (=> start!61166 true))

(declare-fun array_inv!14878 (array!39636) Bool)

(assert (=> start!61166 (array_inv!14878 a!3626)))

(declare-fun b!685391 () Bool)

(declare-fun res!450854 () Bool)

(assert (=> b!685391 (=> (not res!450854) (not e!390297))))

(declare-fun arrayContainsKey!0 (array!39636 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!685391 (= res!450854 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!685392 () Bool)

(declare-fun Unit!24129 () Unit!24125)

(assert (=> b!685392 (= e!390295 Unit!24129)))

(declare-fun b!685393 () Bool)

(declare-fun res!450857 () Bool)

(assert (=> b!685393 (=> (not res!450857) (not e!390297))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!685393 (= res!450857 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19367 a!3626))))))

(declare-fun b!685394 () Bool)

(declare-fun lt!314495 () Unit!24125)

(assert (=> b!685394 (= e!390293 lt!314495)))

(declare-fun lt!314502 () Unit!24125)

(declare-fun lemmaListSubSeqRefl!0 (List!13075) Unit!24125)

(assert (=> b!685394 (= lt!314502 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!685394 (subseq!200 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39636 List!13075 List!13075 (_ BitVec 32)) Unit!24125)

(declare-fun $colon$colon!364 (List!13075 (_ BitVec 64)) List!13075)

(assert (=> b!685394 (= lt!314495 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!364 acc!681 (select (arr!18995 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39636 (_ BitVec 32) List!13075) Bool)

(assert (=> b!685394 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!685395 () Bool)

(declare-fun res!450861 () Bool)

(assert (=> b!685395 (=> (not res!450861) (not e!390297))))

(assert (=> b!685395 (= res!450861 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19367 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!685396 () Bool)

(declare-fun e!390292 () Bool)

(assert (=> b!685396 (= e!390292 (contains!3597 acc!681 k0!2843))))

(declare-fun b!685397 () Bool)

(declare-fun res!450848 () Bool)

(assert (=> b!685397 (=> (not res!450848) (not e!390297))))

(declare-fun noDuplicate!866 (List!13075) Bool)

(assert (=> b!685397 (= res!450848 (noDuplicate!866 acc!681))))

(declare-fun b!685398 () Bool)

(declare-fun res!450866 () Bool)

(assert (=> b!685398 (=> res!450866 e!390296)))

(assert (=> b!685398 (= res!450866 (contains!3597 acc!681 k0!2843))))

(declare-fun b!685399 () Bool)

(declare-fun e!390299 () Bool)

(assert (=> b!685399 (= e!390299 (not (contains!3597 acc!681 k0!2843)))))

(declare-fun b!685400 () Bool)

(assert (=> b!685400 (= e!390294 (not (contains!3597 lt!314497 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685401 () Bool)

(declare-fun res!450851 () Bool)

(assert (=> b!685401 (=> (not res!450851) (not e!390297))))

(assert (=> b!685401 (= res!450851 (not (contains!3597 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685402 () Bool)

(assert (=> b!685402 (= e!390297 (not e!390296))))

(declare-fun res!450853 () Bool)

(assert (=> b!685402 (=> res!450853 e!390296)))

(assert (=> b!685402 (= res!450853 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!165 (List!13075 (_ BitVec 64)) List!13075)

(assert (=> b!685402 (= (-!165 lt!314497 k0!2843) acc!681)))

(assert (=> b!685402 (= lt!314497 ($colon$colon!364 acc!681 k0!2843))))

(declare-fun lt!314498 () Unit!24125)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13075) Unit!24125)

(assert (=> b!685402 (= lt!314498 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!685402 (subseq!200 acc!681 acc!681)))

(declare-fun lt!314501 () Unit!24125)

(assert (=> b!685402 (= lt!314501 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!685402 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314494 () Unit!24125)

(assert (=> b!685402 (= lt!314494 e!390293)))

(declare-fun c!77637 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!685402 (= c!77637 (validKeyInArray!0 (select (arr!18995 a!3626) from!3004)))))

(declare-fun lt!314500 () Unit!24125)

(assert (=> b!685402 (= lt!314500 e!390295)))

(declare-fun c!77636 () Bool)

(declare-fun lt!314499 () Bool)

(assert (=> b!685402 (= c!77636 lt!314499)))

(assert (=> b!685402 (= lt!314499 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!685402 (arrayContainsKey!0 (array!39637 (store (arr!18995 a!3626) i!1382 k0!2843) (size!19367 a!3626)) k0!2843 from!3004)))

(declare-fun b!685403 () Bool)

(declare-fun e!390291 () Bool)

(assert (=> b!685403 (= e!390291 e!390299)))

(declare-fun res!450862 () Bool)

(assert (=> b!685403 (=> (not res!450862) (not e!390299))))

(assert (=> b!685403 (= res!450862 (bvsle from!3004 i!1382))))

(declare-fun b!685404 () Bool)

(declare-fun res!450867 () Bool)

(assert (=> b!685404 (=> (not res!450867) (not e!390297))))

(assert (=> b!685404 (= res!450867 (validKeyInArray!0 k0!2843))))

(declare-fun b!685405 () Bool)

(declare-fun res!450859 () Bool)

(assert (=> b!685405 (=> res!450859 e!390296)))

(assert (=> b!685405 (= res!450859 lt!314499)))

(declare-fun b!685406 () Bool)

(declare-fun res!450863 () Bool)

(assert (=> b!685406 (=> res!450863 e!390296)))

(assert (=> b!685406 (= res!450863 (not (noDuplicate!866 lt!314497)))))

(declare-fun b!685407 () Bool)

(declare-fun res!450849 () Bool)

(assert (=> b!685407 (=> (not res!450849) (not e!390297))))

(assert (=> b!685407 (= res!450849 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13072))))

(declare-fun b!685408 () Bool)

(declare-fun res!450855 () Bool)

(assert (=> b!685408 (=> (not res!450855) (not e!390297))))

(assert (=> b!685408 (= res!450855 (not (contains!3597 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685409 () Bool)

(declare-fun res!450864 () Bool)

(assert (=> b!685409 (=> (not res!450864) (not e!390297))))

(assert (=> b!685409 (= res!450864 e!390291)))

(declare-fun res!450852 () Bool)

(assert (=> b!685409 (=> res!450852 e!390291)))

(assert (=> b!685409 (= res!450852 e!390292)))

(declare-fun res!450856 () Bool)

(assert (=> b!685409 (=> (not res!450856) (not e!390292))))

(assert (=> b!685409 (= res!450856 (bvsgt from!3004 i!1382))))

(declare-fun b!685410 () Bool)

(declare-fun res!450860 () Bool)

(assert (=> b!685410 (=> (not res!450860) (not e!390297))))

(assert (=> b!685410 (= res!450860 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!61166 res!450868) b!685397))

(assert (= (and b!685397 res!450848) b!685401))

(assert (= (and b!685401 res!450851) b!685408))

(assert (= (and b!685408 res!450855) b!685409))

(assert (= (and b!685409 res!450856) b!685396))

(assert (= (and b!685409 (not res!450852)) b!685403))

(assert (= (and b!685403 res!450862) b!685399))

(assert (= (and b!685409 res!450864) b!685407))

(assert (= (and b!685407 res!450849) b!685410))

(assert (= (and b!685410 res!450860) b!685393))

(assert (= (and b!685393 res!450857) b!685404))

(assert (= (and b!685404 res!450867) b!685391))

(assert (= (and b!685391 res!450854) b!685395))

(assert (= (and b!685395 res!450861) b!685402))

(assert (= (and b!685402 c!77636) b!685389))

(assert (= (and b!685402 (not c!77636)) b!685392))

(assert (= (and b!685402 c!77637) b!685394))

(assert (= (and b!685402 (not c!77637)) b!685386))

(assert (= (and b!685402 (not res!450853)) b!685406))

(assert (= (and b!685406 (not res!450863)) b!685405))

(assert (= (and b!685405 (not res!450859)) b!685398))

(assert (= (and b!685398 (not res!450866)) b!685390))

(assert (= (and b!685390 (not res!450850)) b!685387))

(assert (= (and b!685387 (not res!450865)) b!685388))

(assert (= (and b!685388 res!450858) b!685400))

(declare-fun m!649053 () Bool)

(assert (=> b!685391 m!649053))

(declare-fun m!649055 () Bool)

(assert (=> b!685400 m!649055))

(declare-fun m!649057 () Bool)

(assert (=> b!685397 m!649057))

(declare-fun m!649059 () Bool)

(assert (=> b!685387 m!649059))

(declare-fun m!649061 () Bool)

(assert (=> b!685389 m!649061))

(declare-fun m!649063 () Bool)

(assert (=> b!685398 m!649063))

(declare-fun m!649065 () Bool)

(assert (=> b!685410 m!649065))

(declare-fun m!649067 () Bool)

(assert (=> b!685404 m!649067))

(declare-fun m!649069 () Bool)

(assert (=> b!685390 m!649069))

(declare-fun m!649071 () Bool)

(assert (=> b!685407 m!649071))

(declare-fun m!649073 () Bool)

(assert (=> b!685388 m!649073))

(declare-fun m!649075 () Bool)

(assert (=> b!685408 m!649075))

(declare-fun m!649077 () Bool)

(assert (=> b!685406 m!649077))

(declare-fun m!649079 () Bool)

(assert (=> start!61166 m!649079))

(assert (=> b!685396 m!649063))

(declare-fun m!649081 () Bool)

(assert (=> b!685394 m!649081))

(declare-fun m!649083 () Bool)

(assert (=> b!685394 m!649083))

(declare-fun m!649085 () Bool)

(assert (=> b!685394 m!649085))

(declare-fun m!649087 () Bool)

(assert (=> b!685394 m!649087))

(assert (=> b!685394 m!649083))

(assert (=> b!685394 m!649085))

(declare-fun m!649089 () Bool)

(assert (=> b!685394 m!649089))

(declare-fun m!649091 () Bool)

(assert (=> b!685394 m!649091))

(declare-fun m!649093 () Bool)

(assert (=> b!685401 m!649093))

(assert (=> b!685399 m!649063))

(declare-fun m!649095 () Bool)

(assert (=> b!685402 m!649095))

(assert (=> b!685402 m!649081))

(assert (=> b!685402 m!649083))

(declare-fun m!649097 () Bool)

(assert (=> b!685402 m!649097))

(declare-fun m!649099 () Bool)

(assert (=> b!685402 m!649099))

(assert (=> b!685402 m!649089))

(declare-fun m!649101 () Bool)

(assert (=> b!685402 m!649101))

(declare-fun m!649103 () Bool)

(assert (=> b!685402 m!649103))

(assert (=> b!685402 m!649083))

(declare-fun m!649105 () Bool)

(assert (=> b!685402 m!649105))

(declare-fun m!649107 () Bool)

(assert (=> b!685402 m!649107))

(assert (=> b!685402 m!649091))

(check-sat (not b!685394) (not b!685406) (not b!685398) (not b!685404) (not b!685410) (not b!685399) (not b!685402) (not b!685389) (not b!685396) (not b!685401) (not start!61166) (not b!685390) (not b!685391) (not b!685387) (not b!685407) (not b!685397) (not b!685400) (not b!685408) (not b!685388))
(check-sat)
(get-model)

(declare-fun d!94387 () Bool)

(declare-fun res!450999 () Bool)

(declare-fun e!390358 () Bool)

(assert (=> d!94387 (=> res!450999 e!390358)))

(get-info :version)

(assert (=> d!94387 (= res!450999 ((_ is Nil!13072) lt!314497))))

(assert (=> d!94387 (= (noDuplicate!866 lt!314497) e!390358)))

(declare-fun b!685565 () Bool)

(declare-fun e!390359 () Bool)

(assert (=> b!685565 (= e!390358 e!390359)))

(declare-fun res!451000 () Bool)

(assert (=> b!685565 (=> (not res!451000) (not e!390359))))

(assert (=> b!685565 (= res!451000 (not (contains!3597 (t!19318 lt!314497) (h!14116 lt!314497))))))

(declare-fun b!685566 () Bool)

(assert (=> b!685566 (= e!390359 (noDuplicate!866 (t!19318 lt!314497)))))

(assert (= (and d!94387 (not res!450999)) b!685565))

(assert (= (and b!685565 res!451000) b!685566))

(declare-fun m!649221 () Bool)

(assert (=> b!685565 m!649221))

(declare-fun m!649223 () Bool)

(assert (=> b!685566 m!649223))

(assert (=> b!685406 d!94387))

(declare-fun d!94389 () Bool)

(declare-fun lt!314559 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!290 (List!13075) (InoxSet (_ BitVec 64)))

(assert (=> d!94389 (= lt!314559 (select (content!290 acc!681) k0!2843))))

(declare-fun e!390365 () Bool)

(assert (=> d!94389 (= lt!314559 e!390365)))

(declare-fun res!451005 () Bool)

(assert (=> d!94389 (=> (not res!451005) (not e!390365))))

(assert (=> d!94389 (= res!451005 ((_ is Cons!13071) acc!681))))

(assert (=> d!94389 (= (contains!3597 acc!681 k0!2843) lt!314559)))

(declare-fun b!685571 () Bool)

(declare-fun e!390364 () Bool)

(assert (=> b!685571 (= e!390365 e!390364)))

(declare-fun res!451006 () Bool)

(assert (=> b!685571 (=> res!451006 e!390364)))

(assert (=> b!685571 (= res!451006 (= (h!14116 acc!681) k0!2843))))

(declare-fun b!685572 () Bool)

(assert (=> b!685572 (= e!390364 (contains!3597 (t!19318 acc!681) k0!2843))))

(assert (= (and d!94389 res!451005) b!685571))

(assert (= (and b!685571 (not res!451006)) b!685572))

(declare-fun m!649225 () Bool)

(assert (=> d!94389 m!649225))

(declare-fun m!649227 () Bool)

(assert (=> d!94389 m!649227))

(declare-fun m!649229 () Bool)

(assert (=> b!685572 m!649229))

(assert (=> b!685396 d!94389))

(declare-fun d!94391 () Bool)

(declare-fun res!451013 () Bool)

(declare-fun e!390376 () Bool)

(assert (=> d!94391 (=> res!451013 e!390376)))

(assert (=> d!94391 (= res!451013 (bvsge #b00000000000000000000000000000000 (size!19367 a!3626)))))

(assert (=> d!94391 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13072) e!390376)))

(declare-fun b!685583 () Bool)

(declare-fun e!390375 () Bool)

(assert (=> b!685583 (= e!390376 e!390375)))

(declare-fun res!451015 () Bool)

(assert (=> b!685583 (=> (not res!451015) (not e!390375))))

(declare-fun e!390377 () Bool)

(assert (=> b!685583 (= res!451015 (not e!390377))))

(declare-fun res!451014 () Bool)

(assert (=> b!685583 (=> (not res!451014) (not e!390377))))

(assert (=> b!685583 (= res!451014 (validKeyInArray!0 (select (arr!18995 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!685584 () Bool)

(assert (=> b!685584 (= e!390377 (contains!3597 Nil!13072 (select (arr!18995 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!685585 () Bool)

(declare-fun e!390374 () Bool)

(declare-fun call!34051 () Bool)

(assert (=> b!685585 (= e!390374 call!34051)))

(declare-fun bm!34048 () Bool)

(declare-fun c!77652 () Bool)

(assert (=> bm!34048 (= call!34051 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77652 (Cons!13071 (select (arr!18995 a!3626) #b00000000000000000000000000000000) Nil!13072) Nil!13072)))))

(declare-fun b!685586 () Bool)

(assert (=> b!685586 (= e!390374 call!34051)))

(declare-fun b!685587 () Bool)

(assert (=> b!685587 (= e!390375 e!390374)))

(assert (=> b!685587 (= c!77652 (validKeyInArray!0 (select (arr!18995 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!94391 (not res!451013)) b!685583))

(assert (= (and b!685583 res!451014) b!685584))

(assert (= (and b!685583 res!451015) b!685587))

(assert (= (and b!685587 c!77652) b!685585))

(assert (= (and b!685587 (not c!77652)) b!685586))

(assert (= (or b!685585 b!685586) bm!34048))

(declare-fun m!649231 () Bool)

(assert (=> b!685583 m!649231))

(assert (=> b!685583 m!649231))

(declare-fun m!649233 () Bool)

(assert (=> b!685583 m!649233))

(assert (=> b!685584 m!649231))

(assert (=> b!685584 m!649231))

(declare-fun m!649235 () Bool)

(assert (=> b!685584 m!649235))

(assert (=> bm!34048 m!649231))

(declare-fun m!649237 () Bool)

(assert (=> bm!34048 m!649237))

(assert (=> b!685587 m!649231))

(assert (=> b!685587 m!649231))

(assert (=> b!685587 m!649233))

(assert (=> b!685407 d!94391))

(declare-fun d!94393 () Bool)

(declare-fun res!451016 () Bool)

(declare-fun e!390378 () Bool)

(assert (=> d!94393 (=> res!451016 e!390378)))

(assert (=> d!94393 (= res!451016 ((_ is Nil!13072) acc!681))))

(assert (=> d!94393 (= (noDuplicate!866 acc!681) e!390378)))

(declare-fun b!685588 () Bool)

(declare-fun e!390379 () Bool)

(assert (=> b!685588 (= e!390378 e!390379)))

(declare-fun res!451017 () Bool)

(assert (=> b!685588 (=> (not res!451017) (not e!390379))))

(assert (=> b!685588 (= res!451017 (not (contains!3597 (t!19318 acc!681) (h!14116 acc!681))))))

(declare-fun b!685589 () Bool)

(assert (=> b!685589 (= e!390379 (noDuplicate!866 (t!19318 acc!681)))))

(assert (= (and d!94393 (not res!451016)) b!685588))

(assert (= (and b!685588 res!451017) b!685589))

(declare-fun m!649239 () Bool)

(assert (=> b!685588 m!649239))

(declare-fun m!649241 () Bool)

(assert (=> b!685589 m!649241))

(assert (=> b!685397 d!94393))

(declare-fun d!94395 () Bool)

(declare-fun lt!314560 () Bool)

(assert (=> d!94395 (= lt!314560 (select (content!290 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!390381 () Bool)

(assert (=> d!94395 (= lt!314560 e!390381)))

(declare-fun res!451018 () Bool)

(assert (=> d!94395 (=> (not res!451018) (not e!390381))))

(assert (=> d!94395 (= res!451018 ((_ is Cons!13071) acc!681))))

(assert (=> d!94395 (= (contains!3597 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!314560)))

(declare-fun b!685590 () Bool)

(declare-fun e!390380 () Bool)

(assert (=> b!685590 (= e!390381 e!390380)))

(declare-fun res!451019 () Bool)

(assert (=> b!685590 (=> res!451019 e!390380)))

(assert (=> b!685590 (= res!451019 (= (h!14116 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!685591 () Bool)

(assert (=> b!685591 (= e!390380 (contains!3597 (t!19318 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94395 res!451018) b!685590))

(assert (= (and b!685590 (not res!451019)) b!685591))

(assert (=> d!94395 m!649225))

(declare-fun m!649243 () Bool)

(assert (=> d!94395 m!649243))

(declare-fun m!649245 () Bool)

(assert (=> b!685591 m!649245))

(assert (=> b!685408 d!94395))

(declare-fun d!94397 () Bool)

(declare-fun lt!314561 () Bool)

(assert (=> d!94397 (= lt!314561 (select (content!290 lt!314497) k0!2843))))

(declare-fun e!390383 () Bool)

(assert (=> d!94397 (= lt!314561 e!390383)))

(declare-fun res!451020 () Bool)

(assert (=> d!94397 (=> (not res!451020) (not e!390383))))

(assert (=> d!94397 (= res!451020 ((_ is Cons!13071) lt!314497))))

(assert (=> d!94397 (= (contains!3597 lt!314497 k0!2843) lt!314561)))

(declare-fun b!685592 () Bool)

(declare-fun e!390382 () Bool)

(assert (=> b!685592 (= e!390383 e!390382)))

(declare-fun res!451021 () Bool)

(assert (=> b!685592 (=> res!451021 e!390382)))

(assert (=> b!685592 (= res!451021 (= (h!14116 lt!314497) k0!2843))))

(declare-fun b!685593 () Bool)

(assert (=> b!685593 (= e!390382 (contains!3597 (t!19318 lt!314497) k0!2843))))

(assert (= (and d!94397 res!451020) b!685592))

(assert (= (and b!685592 (not res!451021)) b!685593))

(declare-fun m!649247 () Bool)

(assert (=> d!94397 m!649247))

(declare-fun m!649249 () Bool)

(assert (=> d!94397 m!649249))

(declare-fun m!649251 () Bool)

(assert (=> b!685593 m!649251))

(assert (=> b!685387 d!94397))

(assert (=> b!685398 d!94389))

(declare-fun d!94399 () Bool)

(declare-fun lt!314562 () Bool)

(assert (=> d!94399 (= lt!314562 (select (content!290 lt!314497) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!390385 () Bool)

(assert (=> d!94399 (= lt!314562 e!390385)))

(declare-fun res!451022 () Bool)

(assert (=> d!94399 (=> (not res!451022) (not e!390385))))

(assert (=> d!94399 (= res!451022 ((_ is Cons!13071) lt!314497))))

(assert (=> d!94399 (= (contains!3597 lt!314497 #b0000000000000000000000000000000000000000000000000000000000000000) lt!314562)))

(declare-fun b!685594 () Bool)

(declare-fun e!390384 () Bool)

(assert (=> b!685594 (= e!390385 e!390384)))

(declare-fun res!451023 () Bool)

(assert (=> b!685594 (=> res!451023 e!390384)))

(assert (=> b!685594 (= res!451023 (= (h!14116 lt!314497) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!685595 () Bool)

(assert (=> b!685595 (= e!390384 (contains!3597 (t!19318 lt!314497) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94399 res!451022) b!685594))

(assert (= (and b!685594 (not res!451023)) b!685595))

(assert (=> d!94399 m!649247))

(declare-fun m!649253 () Bool)

(assert (=> d!94399 m!649253))

(declare-fun m!649255 () Bool)

(assert (=> b!685595 m!649255))

(assert (=> b!685388 d!94399))

(assert (=> b!685399 d!94389))

(declare-fun d!94401 () Bool)

(declare-fun res!451024 () Bool)

(declare-fun e!390388 () Bool)

(assert (=> d!94401 (=> res!451024 e!390388)))

(assert (=> d!94401 (= res!451024 (bvsge from!3004 (size!19367 a!3626)))))

(assert (=> d!94401 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!390388)))

(declare-fun b!685596 () Bool)

(declare-fun e!390387 () Bool)

(assert (=> b!685596 (= e!390388 e!390387)))

(declare-fun res!451026 () Bool)

(assert (=> b!685596 (=> (not res!451026) (not e!390387))))

(declare-fun e!390389 () Bool)

(assert (=> b!685596 (= res!451026 (not e!390389))))

(declare-fun res!451025 () Bool)

(assert (=> b!685596 (=> (not res!451025) (not e!390389))))

(assert (=> b!685596 (= res!451025 (validKeyInArray!0 (select (arr!18995 a!3626) from!3004)))))

(declare-fun b!685597 () Bool)

(assert (=> b!685597 (= e!390389 (contains!3597 acc!681 (select (arr!18995 a!3626) from!3004)))))

(declare-fun b!685598 () Bool)

(declare-fun e!390386 () Bool)

(declare-fun call!34052 () Bool)

(assert (=> b!685598 (= e!390386 call!34052)))

(declare-fun bm!34049 () Bool)

(declare-fun c!77653 () Bool)

(assert (=> bm!34049 (= call!34052 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77653 (Cons!13071 (select (arr!18995 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!685599 () Bool)

(assert (=> b!685599 (= e!390386 call!34052)))

(declare-fun b!685600 () Bool)

(assert (=> b!685600 (= e!390387 e!390386)))

(assert (=> b!685600 (= c!77653 (validKeyInArray!0 (select (arr!18995 a!3626) from!3004)))))

(assert (= (and d!94401 (not res!451024)) b!685596))

(assert (= (and b!685596 res!451025) b!685597))

(assert (= (and b!685596 res!451026) b!685600))

(assert (= (and b!685600 c!77653) b!685598))

(assert (= (and b!685600 (not c!77653)) b!685599))

(assert (= (or b!685598 b!685599) bm!34049))

(assert (=> b!685596 m!649083))

(assert (=> b!685596 m!649083))

(assert (=> b!685596 m!649105))

(assert (=> b!685597 m!649083))

(assert (=> b!685597 m!649083))

(declare-fun m!649257 () Bool)

(assert (=> b!685597 m!649257))

(assert (=> bm!34049 m!649083))

(declare-fun m!649259 () Bool)

(assert (=> bm!34049 m!649259))

(assert (=> b!685600 m!649083))

(assert (=> b!685600 m!649083))

(assert (=> b!685600 m!649105))

(assert (=> b!685410 d!94401))

(declare-fun d!94403 () Bool)

(assert (=> d!94403 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!314565 () Unit!24125)

(declare-fun choose!13 (array!39636 (_ BitVec 64) (_ BitVec 32)) Unit!24125)

(assert (=> d!94403 (= lt!314565 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!94403 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!94403 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!314565)))

(declare-fun bs!20076 () Bool)

(assert (= bs!20076 d!94403))

(assert (=> bs!20076 m!649053))

(declare-fun m!649261 () Bool)

(assert (=> bs!20076 m!649261))

(assert (=> b!685389 d!94403))

(declare-fun d!94405 () Bool)

(declare-fun lt!314566 () Bool)

(assert (=> d!94405 (= lt!314566 (select (content!290 lt!314497) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!390391 () Bool)

(assert (=> d!94405 (= lt!314566 e!390391)))

(declare-fun res!451027 () Bool)

(assert (=> d!94405 (=> (not res!451027) (not e!390391))))

(assert (=> d!94405 (= res!451027 ((_ is Cons!13071) lt!314497))))

(assert (=> d!94405 (= (contains!3597 lt!314497 #b1000000000000000000000000000000000000000000000000000000000000000) lt!314566)))

(declare-fun b!685601 () Bool)

(declare-fun e!390390 () Bool)

(assert (=> b!685601 (= e!390391 e!390390)))

(declare-fun res!451028 () Bool)

(assert (=> b!685601 (=> res!451028 e!390390)))

(assert (=> b!685601 (= res!451028 (= (h!14116 lt!314497) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!685602 () Bool)

(assert (=> b!685602 (= e!390390 (contains!3597 (t!19318 lt!314497) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94405 res!451027) b!685601))

(assert (= (and b!685601 (not res!451028)) b!685602))

(assert (=> d!94405 m!649247))

(declare-fun m!649263 () Bool)

(assert (=> d!94405 m!649263))

(declare-fun m!649265 () Bool)

(assert (=> b!685602 m!649265))

(assert (=> b!685400 d!94405))

(declare-fun b!685611 () Bool)

(declare-fun e!390401 () Bool)

(declare-fun e!390400 () Bool)

(assert (=> b!685611 (= e!390401 e!390400)))

(declare-fun res!451037 () Bool)

(assert (=> b!685611 (=> (not res!451037) (not e!390400))))

(assert (=> b!685611 (= res!451037 ((_ is Cons!13071) lt!314497))))

(declare-fun b!685612 () Bool)

(declare-fun e!390403 () Bool)

(assert (=> b!685612 (= e!390400 e!390403)))

(declare-fun res!451040 () Bool)

(assert (=> b!685612 (=> res!451040 e!390403)))

(declare-fun e!390402 () Bool)

(assert (=> b!685612 (= res!451040 e!390402)))

(declare-fun res!451039 () Bool)

(assert (=> b!685612 (=> (not res!451039) (not e!390402))))

(assert (=> b!685612 (= res!451039 (= (h!14116 acc!681) (h!14116 lt!314497)))))

(declare-fun b!685614 () Bool)

(assert (=> b!685614 (= e!390403 (subseq!200 acc!681 (t!19318 lt!314497)))))

(declare-fun b!685613 () Bool)

(assert (=> b!685613 (= e!390402 (subseq!200 (t!19318 acc!681) (t!19318 lt!314497)))))

(declare-fun d!94407 () Bool)

(declare-fun res!451038 () Bool)

(assert (=> d!94407 (=> res!451038 e!390401)))

(assert (=> d!94407 (= res!451038 ((_ is Nil!13072) acc!681))))

(assert (=> d!94407 (= (subseq!200 acc!681 lt!314497) e!390401)))

(assert (= (and d!94407 (not res!451038)) b!685611))

(assert (= (and b!685611 res!451037) b!685612))

(assert (= (and b!685612 res!451039) b!685613))

(assert (= (and b!685612 (not res!451040)) b!685614))

(declare-fun m!649267 () Bool)

(assert (=> b!685614 m!649267))

(declare-fun m!649269 () Bool)

(assert (=> b!685613 m!649269))

(assert (=> b!685390 d!94407))

(declare-fun d!94411 () Bool)

(declare-fun lt!314567 () Bool)

(assert (=> d!94411 (= lt!314567 (select (content!290 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!390405 () Bool)

(assert (=> d!94411 (= lt!314567 e!390405)))

(declare-fun res!451041 () Bool)

(assert (=> d!94411 (=> (not res!451041) (not e!390405))))

(assert (=> d!94411 (= res!451041 ((_ is Cons!13071) acc!681))))

(assert (=> d!94411 (= (contains!3597 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!314567)))

(declare-fun b!685615 () Bool)

(declare-fun e!390404 () Bool)

(assert (=> b!685615 (= e!390405 e!390404)))

(declare-fun res!451042 () Bool)

(assert (=> b!685615 (=> res!451042 e!390404)))

(assert (=> b!685615 (= res!451042 (= (h!14116 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!685616 () Bool)

(assert (=> b!685616 (= e!390404 (contains!3597 (t!19318 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94411 res!451041) b!685615))

(assert (= (and b!685615 (not res!451042)) b!685616))

(assert (=> d!94411 m!649225))

(declare-fun m!649271 () Bool)

(assert (=> d!94411 m!649271))

(declare-fun m!649273 () Bool)

(assert (=> b!685616 m!649273))

(assert (=> b!685401 d!94411))

(declare-fun d!94413 () Bool)

(declare-fun res!451051 () Bool)

(declare-fun e!390414 () Bool)

(assert (=> d!94413 (=> res!451051 e!390414)))

(assert (=> d!94413 (= res!451051 (= (select (arr!18995 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!94413 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!390414)))

(declare-fun b!685625 () Bool)

(declare-fun e!390415 () Bool)

(assert (=> b!685625 (= e!390414 e!390415)))

(declare-fun res!451052 () Bool)

(assert (=> b!685625 (=> (not res!451052) (not e!390415))))

(assert (=> b!685625 (= res!451052 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19367 a!3626)))))

(declare-fun b!685626 () Bool)

(assert (=> b!685626 (= e!390415 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!94413 (not res!451051)) b!685625))

(assert (= (and b!685625 res!451052) b!685626))

(assert (=> d!94413 m!649231))

(declare-fun m!649275 () Bool)

(assert (=> b!685626 m!649275))

(assert (=> b!685391 d!94413))

(declare-fun b!685629 () Bool)

(declare-fun e!390419 () Bool)

(declare-fun e!390418 () Bool)

(assert (=> b!685629 (= e!390419 e!390418)))

(declare-fun res!451055 () Bool)

(assert (=> b!685629 (=> (not res!451055) (not e!390418))))

(assert (=> b!685629 (= res!451055 ((_ is Cons!13071) acc!681))))

(declare-fun b!685630 () Bool)

(declare-fun e!390421 () Bool)

(assert (=> b!685630 (= e!390418 e!390421)))

(declare-fun res!451058 () Bool)

(assert (=> b!685630 (=> res!451058 e!390421)))

(declare-fun e!390420 () Bool)

(assert (=> b!685630 (= res!451058 e!390420)))

(declare-fun res!451057 () Bool)

(assert (=> b!685630 (=> (not res!451057) (not e!390420))))

(assert (=> b!685630 (= res!451057 (= (h!14116 acc!681) (h!14116 acc!681)))))

(declare-fun b!685632 () Bool)

(assert (=> b!685632 (= e!390421 (subseq!200 acc!681 (t!19318 acc!681)))))

(declare-fun b!685631 () Bool)

(assert (=> b!685631 (= e!390420 (subseq!200 (t!19318 acc!681) (t!19318 acc!681)))))

(declare-fun d!94417 () Bool)

(declare-fun res!451056 () Bool)

(assert (=> d!94417 (=> res!451056 e!390419)))

(assert (=> d!94417 (= res!451056 ((_ is Nil!13072) acc!681))))

(assert (=> d!94417 (= (subseq!200 acc!681 acc!681) e!390419)))

(assert (= (and d!94417 (not res!451056)) b!685629))

(assert (= (and b!685629 res!451055) b!685630))

(assert (= (and b!685630 res!451057) b!685631))

(assert (= (and b!685630 (not res!451058)) b!685632))

(declare-fun m!649283 () Bool)

(assert (=> b!685632 m!649283))

(declare-fun m!649285 () Bool)

(assert (=> b!685631 m!649285))

(assert (=> b!685402 d!94417))

(declare-fun d!94421 () Bool)

(declare-fun e!390448 () Bool)

(assert (=> d!94421 e!390448))

(declare-fun res!451079 () Bool)

(assert (=> d!94421 (=> (not res!451079) (not e!390448))))

(declare-fun lt!314580 () List!13075)

(declare-fun size!19370 (List!13075) Int)

(assert (=> d!94421 (= res!451079 (<= (size!19370 lt!314580) (size!19370 lt!314497)))))

(declare-fun e!390449 () List!13075)

(assert (=> d!94421 (= lt!314580 e!390449)))

(declare-fun c!77658 () Bool)

(assert (=> d!94421 (= c!77658 ((_ is Cons!13071) lt!314497))))

(assert (=> d!94421 (= (-!165 lt!314497 k0!2843) lt!314580)))

(declare-fun bm!34052 () Bool)

(declare-fun call!34055 () List!13075)

(assert (=> bm!34052 (= call!34055 (-!165 (t!19318 lt!314497) k0!2843))))

(declare-fun b!685661 () Bool)

(assert (=> b!685661 (= e!390449 Nil!13072)))

(declare-fun b!685662 () Bool)

(declare-fun e!390447 () List!13075)

(assert (=> b!685662 (= e!390449 e!390447)))

(declare-fun c!77659 () Bool)

(assert (=> b!685662 (= c!77659 (= k0!2843 (h!14116 lt!314497)))))

(declare-fun b!685663 () Bool)

(assert (=> b!685663 (= e!390447 (Cons!13071 (h!14116 lt!314497) call!34055))))

(declare-fun b!685664 () Bool)

(assert (=> b!685664 (= e!390447 call!34055)))

(declare-fun b!685665 () Bool)

(assert (=> b!685665 (= e!390448 (= (content!290 lt!314580) ((_ map and) (content!290 lt!314497) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2843 true)))))))

(assert (= (and d!94421 c!77658) b!685662))

(assert (= (and d!94421 (not c!77658)) b!685661))

(assert (= (and b!685662 c!77659) b!685664))

(assert (= (and b!685662 (not c!77659)) b!685663))

(assert (= (or b!685664 b!685663) bm!34052))

(assert (= (and d!94421 res!451079) b!685665))

(declare-fun m!649309 () Bool)

(assert (=> d!94421 m!649309))

(declare-fun m!649311 () Bool)

(assert (=> d!94421 m!649311))

(declare-fun m!649313 () Bool)

(assert (=> bm!34052 m!649313))

(declare-fun m!649315 () Bool)

(assert (=> b!685665 m!649315))

(assert (=> b!685665 m!649247))

(declare-fun m!649317 () Bool)

(assert (=> b!685665 m!649317))

(assert (=> b!685402 d!94421))

(declare-fun d!94433 () Bool)

(declare-fun res!451090 () Bool)

(declare-fun e!390460 () Bool)

(assert (=> d!94433 (=> res!451090 e!390460)))

(assert (=> d!94433 (= res!451090 (= (select (arr!18995 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!94433 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!390460)))

(declare-fun b!685676 () Bool)

(declare-fun e!390461 () Bool)

(assert (=> b!685676 (= e!390460 e!390461)))

(declare-fun res!451091 () Bool)

(assert (=> b!685676 (=> (not res!451091) (not e!390461))))

(assert (=> b!685676 (= res!451091 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19367 a!3626)))))

(declare-fun b!685677 () Bool)

(assert (=> b!685677 (= e!390461 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94433 (not res!451090)) b!685676))

(assert (= (and b!685676 res!451091) b!685677))

(declare-fun m!649319 () Bool)

(assert (=> d!94433 m!649319))

(declare-fun m!649321 () Bool)

(assert (=> b!685677 m!649321))

(assert (=> b!685402 d!94433))

(declare-fun d!94435 () Bool)

(assert (=> d!94435 (= (-!165 ($colon$colon!364 acc!681 k0!2843) k0!2843) acc!681)))

(declare-fun lt!314583 () Unit!24125)

(declare-fun choose!16 ((_ BitVec 64) List!13075) Unit!24125)

(assert (=> d!94435 (= lt!314583 (choose!16 k0!2843 acc!681))))

(assert (=> d!94435 (not (contains!3597 acc!681 k0!2843))))

(assert (=> d!94435 (= (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681) lt!314583)))

(declare-fun bs!20078 () Bool)

(assert (= bs!20078 d!94435))

(assert (=> bs!20078 m!649103))

(assert (=> bs!20078 m!649103))

(declare-fun m!649331 () Bool)

(assert (=> bs!20078 m!649331))

(declare-fun m!649333 () Bool)

(assert (=> bs!20078 m!649333))

(assert (=> bs!20078 m!649063))

(assert (=> b!685402 d!94435))

(declare-fun d!94441 () Bool)

(declare-fun res!451100 () Bool)

(declare-fun e!390470 () Bool)

(assert (=> d!94441 (=> res!451100 e!390470)))

(assert (=> d!94441 (= res!451100 (= (select (arr!18995 (array!39637 (store (arr!18995 a!3626) i!1382 k0!2843) (size!19367 a!3626))) from!3004) k0!2843))))

(assert (=> d!94441 (= (arrayContainsKey!0 (array!39637 (store (arr!18995 a!3626) i!1382 k0!2843) (size!19367 a!3626)) k0!2843 from!3004) e!390470)))

(declare-fun b!685686 () Bool)

(declare-fun e!390471 () Bool)

(assert (=> b!685686 (= e!390470 e!390471)))

(declare-fun res!451101 () Bool)

(assert (=> b!685686 (=> (not res!451101) (not e!390471))))

(assert (=> b!685686 (= res!451101 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19367 (array!39637 (store (arr!18995 a!3626) i!1382 k0!2843) (size!19367 a!3626)))))))

(declare-fun b!685687 () Bool)

(assert (=> b!685687 (= e!390471 (arrayContainsKey!0 (array!39637 (store (arr!18995 a!3626) i!1382 k0!2843) (size!19367 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94441 (not res!451100)) b!685686))

(assert (= (and b!685686 res!451101) b!685687))

(declare-fun m!649341 () Bool)

(assert (=> d!94441 m!649341))

(declare-fun m!649343 () Bool)

(assert (=> b!685687 m!649343))

(assert (=> b!685402 d!94441))

(declare-fun d!94445 () Bool)

(assert (=> d!94445 (subseq!200 acc!681 acc!681)))

(declare-fun lt!314590 () Unit!24125)

(declare-fun choose!36 (List!13075) Unit!24125)

(assert (=> d!94445 (= lt!314590 (choose!36 acc!681))))

(assert (=> d!94445 (= (lemmaListSubSeqRefl!0 acc!681) lt!314590)))

(declare-fun bs!20080 () Bool)

(assert (= bs!20080 d!94445))

(assert (=> bs!20080 m!649091))

(declare-fun m!649353 () Bool)

(assert (=> bs!20080 m!649353))

(assert (=> b!685402 d!94445))

(declare-fun d!94451 () Bool)

(assert (=> d!94451 (= (validKeyInArray!0 (select (arr!18995 a!3626) from!3004)) (and (not (= (select (arr!18995 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18995 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!685402 d!94451))

(declare-fun d!94453 () Bool)

(assert (=> d!94453 (= ($colon$colon!364 acc!681 k0!2843) (Cons!13071 k0!2843 acc!681))))

(assert (=> b!685402 d!94453))

(declare-fun d!94455 () Bool)

(declare-fun res!451108 () Bool)

(declare-fun e!390480 () Bool)

(assert (=> d!94455 (=> res!451108 e!390480)))

(assert (=> d!94455 (= res!451108 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19367 a!3626)))))

(assert (=> d!94455 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!390480)))

(declare-fun b!685694 () Bool)

(declare-fun e!390479 () Bool)

(assert (=> b!685694 (= e!390480 e!390479)))

(declare-fun res!451110 () Bool)

(assert (=> b!685694 (=> (not res!451110) (not e!390479))))

(declare-fun e!390481 () Bool)

(assert (=> b!685694 (= res!451110 (not e!390481))))

(declare-fun res!451109 () Bool)

(assert (=> b!685694 (=> (not res!451109) (not e!390481))))

(assert (=> b!685694 (= res!451109 (validKeyInArray!0 (select (arr!18995 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!685695 () Bool)

(assert (=> b!685695 (= e!390481 (contains!3597 acc!681 (select (arr!18995 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!685696 () Bool)

(declare-fun e!390478 () Bool)

(declare-fun call!34056 () Bool)

(assert (=> b!685696 (= e!390478 call!34056)))

(declare-fun c!77660 () Bool)

(declare-fun bm!34053 () Bool)

(assert (=> bm!34053 (= call!34056 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77660 (Cons!13071 (select (arr!18995 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!685697 () Bool)

(assert (=> b!685697 (= e!390478 call!34056)))

(declare-fun b!685698 () Bool)

(assert (=> b!685698 (= e!390479 e!390478)))

(assert (=> b!685698 (= c!77660 (validKeyInArray!0 (select (arr!18995 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (= (and d!94455 (not res!451108)) b!685694))

(assert (= (and b!685694 res!451109) b!685695))

(assert (= (and b!685694 res!451110) b!685698))

(assert (= (and b!685698 c!77660) b!685696))

(assert (= (and b!685698 (not c!77660)) b!685697))

(assert (= (or b!685696 b!685697) bm!34053))

(assert (=> b!685694 m!649319))

(assert (=> b!685694 m!649319))

(declare-fun m!649355 () Bool)

(assert (=> b!685694 m!649355))

(assert (=> b!685695 m!649319))

(assert (=> b!685695 m!649319))

(declare-fun m!649357 () Bool)

(assert (=> b!685695 m!649357))

(assert (=> bm!34053 m!649319))

(declare-fun m!649359 () Bool)

(assert (=> bm!34053 m!649359))

(assert (=> b!685698 m!649319))

(assert (=> b!685698 m!649319))

(assert (=> b!685698 m!649355))

(assert (=> b!685402 d!94455))

(declare-fun d!94457 () Bool)

(assert (=> d!94457 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!685404 d!94457))

(declare-fun d!94459 () Bool)

(assert (=> d!94459 (= (array_inv!14878 a!3626) (bvsge (size!19367 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61166 d!94459))

(declare-fun d!94463 () Bool)

(assert (=> d!94463 (= ($colon$colon!364 acc!681 (select (arr!18995 a!3626) from!3004)) (Cons!13071 (select (arr!18995 a!3626) from!3004) acc!681))))

(assert (=> b!685394 d!94463))

(assert (=> b!685394 d!94417))

(declare-fun d!94465 () Bool)

(assert (=> d!94465 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314597 () Unit!24125)

(declare-fun choose!80 (array!39636 List!13075 List!13075 (_ BitVec 32)) Unit!24125)

(assert (=> d!94465 (= lt!314597 (choose!80 a!3626 ($colon$colon!364 acc!681 (select (arr!18995 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!94465 (bvslt (size!19367 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94465 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!364 acc!681 (select (arr!18995 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!314597)))

(declare-fun bs!20081 () Bool)

(assert (= bs!20081 d!94465))

(assert (=> bs!20081 m!649081))

(assert (=> bs!20081 m!649085))

(declare-fun m!649371 () Bool)

(assert (=> bs!20081 m!649371))

(assert (=> b!685394 d!94465))

(assert (=> b!685394 d!94445))

(assert (=> b!685394 d!94455))

(check-sat (not b!685595) (not d!94435) (not b!685677) (not bm!34049) (not bm!34048) (not b!685597) (not d!94399) (not b!685587) (not d!94465) (not b!685631) (not b!685602) (not b!685583) (not b!685589) (not b!685665) (not bm!34053) (not b!685584) (not b!685566) (not d!94403) (not d!94405) (not b!685694) (not b!685616) (not b!685565) (not b!685626) (not b!685632) (not b!685572) (not b!685596) (not d!94397) (not b!685593) (not b!685600) (not b!685698) (not bm!34052) (not b!685591) (not d!94411) (not d!94395) (not b!685695) (not b!685687) (not d!94445) (not b!685613) (not d!94389) (not d!94421) (not b!685614) (not b!685588))
(check-sat)
