; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60948 () Bool)

(assert start!60948)

(declare-fun b!683443 () Bool)

(declare-fun res!449158 () Bool)

(declare-fun e!389313 () Bool)

(assert (=> b!683443 (=> (not res!449158) (not e!389313))))

(declare-fun e!389319 () Bool)

(assert (=> b!683443 (= res!449158 e!389319)))

(declare-fun res!449157 () Bool)

(assert (=> b!683443 (=> res!449157 e!389319)))

(declare-fun e!389314 () Bool)

(assert (=> b!683443 (= res!449157 e!389314)))

(declare-fun res!449168 () Bool)

(assert (=> b!683443 (=> (not res!449168) (not e!389314))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!683443 (= res!449168 (bvsgt from!3004 i!1382))))

(declare-fun b!683444 () Bool)

(declare-fun res!449167 () Bool)

(assert (=> b!683444 (=> (not res!449167) (not e!389313))))

(declare-datatypes ((array!39570 0))(
  ( (array!39571 (arr!18964 (Array (_ BitVec 32) (_ BitVec 64))) (size!19328 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39570)

(declare-datatypes ((List!12912 0))(
  ( (Nil!12909) (Cons!12908 (h!13956 (_ BitVec 64)) (t!19147 List!12912)) )
))
(declare-fun arrayNoDuplicates!0 (array!39570 (_ BitVec 32) List!12912) Bool)

(assert (=> b!683444 (= res!449167 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12909))))

(declare-fun b!683445 () Bool)

(declare-fun acc!681 () List!12912)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3564 (List!12912 (_ BitVec 64)) Bool)

(assert (=> b!683445 (= e!389314 (contains!3564 acc!681 k0!2843))))

(declare-fun res!449164 () Bool)

(assert (=> start!60948 (=> (not res!449164) (not e!389313))))

(assert (=> start!60948 (= res!449164 (and (bvslt (size!19328 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19328 a!3626))))))

(assert (=> start!60948 e!389313))

(assert (=> start!60948 true))

(declare-fun array_inv!14823 (array!39570) Bool)

(assert (=> start!60948 (array_inv!14823 a!3626)))

(declare-fun b!683446 () Bool)

(declare-fun res!449165 () Bool)

(assert (=> b!683446 (=> (not res!449165) (not e!389313))))

(declare-fun arrayContainsKey!0 (array!39570 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!683446 (= res!449165 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!683447 () Bool)

(declare-fun res!449166 () Bool)

(assert (=> b!683447 (=> (not res!449166) (not e!389313))))

(assert (=> b!683447 (= res!449166 (not (contains!3564 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683448 () Bool)

(declare-fun e!389312 () Bool)

(assert (=> b!683448 (= e!389312 (not (contains!3564 acc!681 k0!2843)))))

(declare-fun b!683449 () Bool)

(declare-fun res!449162 () Bool)

(assert (=> b!683449 (=> (not res!449162) (not e!389313))))

(declare-fun noDuplicate!838 (List!12912) Bool)

(assert (=> b!683449 (= res!449162 (noDuplicate!838 acc!681))))

(declare-fun b!683450 () Bool)

(declare-datatypes ((Unit!23991 0))(
  ( (Unit!23992) )
))
(declare-fun e!389317 () Unit!23991)

(declare-fun Unit!23993 () Unit!23991)

(assert (=> b!683450 (= e!389317 Unit!23993)))

(declare-fun b!683451 () Bool)

(declare-fun res!449170 () Bool)

(assert (=> b!683451 (=> (not res!449170) (not e!389313))))

(assert (=> b!683451 (= res!449170 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19328 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!683452 () Bool)

(declare-fun res!449161 () Bool)

(assert (=> b!683452 (=> (not res!449161) (not e!389313))))

(assert (=> b!683452 (= res!449161 (not (contains!3564 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683453 () Bool)

(declare-fun e!389316 () Bool)

(declare-fun lt!313920 () List!12912)

(assert (=> b!683453 (= e!389316 (noDuplicate!838 lt!313920))))

(declare-fun b!683454 () Bool)

(assert (=> b!683454 (= e!389319 e!389312)))

(declare-fun res!449160 () Bool)

(assert (=> b!683454 (=> (not res!449160) (not e!389312))))

(assert (=> b!683454 (= res!449160 (bvsle from!3004 i!1382))))

(declare-fun b!683455 () Bool)

(declare-fun Unit!23994 () Unit!23991)

(assert (=> b!683455 (= e!389317 Unit!23994)))

(declare-fun lt!313923 () Unit!23991)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39570 (_ BitVec 64) (_ BitVec 32)) Unit!23991)

(assert (=> b!683455 (= lt!313923 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!683455 false))

(declare-fun b!683456 () Bool)

(declare-fun res!449159 () Bool)

(assert (=> b!683456 (=> (not res!449159) (not e!389313))))

(assert (=> b!683456 (= res!449159 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19328 a!3626))))))

(declare-fun b!683457 () Bool)

(declare-fun res!449169 () Bool)

(assert (=> b!683457 (=> (not res!449169) (not e!389313))))

(assert (=> b!683457 (= res!449169 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!683458 () Bool)

(assert (=> b!683458 (= e!389313 (not e!389316))))

(declare-fun res!449163 () Bool)

(assert (=> b!683458 (=> res!449163 e!389316)))

(assert (=> b!683458 (= res!449163 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!137 (List!12912 (_ BitVec 64)) List!12912)

(assert (=> b!683458 (= (-!137 lt!313920 k0!2843) acc!681)))

(declare-fun $colon$colon!335 (List!12912 (_ BitVec 64)) List!12912)

(assert (=> b!683458 (= lt!313920 ($colon$colon!335 acc!681 k0!2843))))

(declare-fun lt!313927 () Unit!23991)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12912) Unit!23991)

(assert (=> b!683458 (= lt!313927 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!173 (List!12912 List!12912) Bool)

(assert (=> b!683458 (subseq!173 acc!681 acc!681)))

(declare-fun lt!313925 () Unit!23991)

(declare-fun lemmaListSubSeqRefl!0 (List!12912) Unit!23991)

(assert (=> b!683458 (= lt!313925 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!683458 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313926 () Unit!23991)

(declare-fun e!389315 () Unit!23991)

(assert (=> b!683458 (= lt!313926 e!389315)))

(declare-fun c!77512 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!683458 (= c!77512 (validKeyInArray!0 (select (arr!18964 a!3626) from!3004)))))

(declare-fun lt!313921 () Unit!23991)

(assert (=> b!683458 (= lt!313921 e!389317)))

(declare-fun c!77513 () Bool)

(assert (=> b!683458 (= c!77513 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683458 (arrayContainsKey!0 (array!39571 (store (arr!18964 a!3626) i!1382 k0!2843) (size!19328 a!3626)) k0!2843 from!3004)))

(declare-fun b!683459 () Bool)

(declare-fun res!449156 () Bool)

(assert (=> b!683459 (=> (not res!449156) (not e!389313))))

(assert (=> b!683459 (= res!449156 (validKeyInArray!0 k0!2843))))

(declare-fun b!683460 () Bool)

(declare-fun lt!313922 () Unit!23991)

(assert (=> b!683460 (= e!389315 lt!313922)))

(declare-fun lt!313924 () Unit!23991)

(assert (=> b!683460 (= lt!313924 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!683460 (subseq!173 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39570 List!12912 List!12912 (_ BitVec 32)) Unit!23991)

(assert (=> b!683460 (= lt!313922 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!335 acc!681 (select (arr!18964 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683460 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!683461 () Bool)

(declare-fun Unit!23995 () Unit!23991)

(assert (=> b!683461 (= e!389315 Unit!23995)))

(assert (= (and start!60948 res!449164) b!683449))

(assert (= (and b!683449 res!449162) b!683447))

(assert (= (and b!683447 res!449166) b!683452))

(assert (= (and b!683452 res!449161) b!683443))

(assert (= (and b!683443 res!449168) b!683445))

(assert (= (and b!683443 (not res!449157)) b!683454))

(assert (= (and b!683454 res!449160) b!683448))

(assert (= (and b!683443 res!449158) b!683444))

(assert (= (and b!683444 res!449167) b!683457))

(assert (= (and b!683457 res!449169) b!683456))

(assert (= (and b!683456 res!449159) b!683459))

(assert (= (and b!683459 res!449156) b!683446))

(assert (= (and b!683446 res!449165) b!683451))

(assert (= (and b!683451 res!449170) b!683458))

(assert (= (and b!683458 c!77513) b!683455))

(assert (= (and b!683458 (not c!77513)) b!683450))

(assert (= (and b!683458 c!77512) b!683460))

(assert (= (and b!683458 (not c!77512)) b!683461))

(assert (= (and b!683458 (not res!449163)) b!683453))

(declare-fun m!648487 () Bool)

(assert (=> start!60948 m!648487))

(declare-fun m!648489 () Bool)

(assert (=> b!683452 m!648489))

(declare-fun m!648491 () Bool)

(assert (=> b!683458 m!648491))

(declare-fun m!648493 () Bool)

(assert (=> b!683458 m!648493))

(declare-fun m!648495 () Bool)

(assert (=> b!683458 m!648495))

(declare-fun m!648497 () Bool)

(assert (=> b!683458 m!648497))

(declare-fun m!648499 () Bool)

(assert (=> b!683458 m!648499))

(declare-fun m!648501 () Bool)

(assert (=> b!683458 m!648501))

(assert (=> b!683458 m!648493))

(declare-fun m!648503 () Bool)

(assert (=> b!683458 m!648503))

(declare-fun m!648505 () Bool)

(assert (=> b!683458 m!648505))

(declare-fun m!648507 () Bool)

(assert (=> b!683458 m!648507))

(declare-fun m!648509 () Bool)

(assert (=> b!683458 m!648509))

(declare-fun m!648511 () Bool)

(assert (=> b!683458 m!648511))

(declare-fun m!648513 () Bool)

(assert (=> b!683447 m!648513))

(declare-fun m!648515 () Bool)

(assert (=> b!683459 m!648515))

(declare-fun m!648517 () Bool)

(assert (=> b!683445 m!648517))

(assert (=> b!683448 m!648517))

(declare-fun m!648519 () Bool)

(assert (=> b!683444 m!648519))

(declare-fun m!648521 () Bool)

(assert (=> b!683449 m!648521))

(declare-fun m!648523 () Bool)

(assert (=> b!683457 m!648523))

(assert (=> b!683460 m!648491))

(assert (=> b!683460 m!648493))

(declare-fun m!648525 () Bool)

(assert (=> b!683460 m!648525))

(declare-fun m!648527 () Bool)

(assert (=> b!683460 m!648527))

(assert (=> b!683460 m!648493))

(assert (=> b!683460 m!648525))

(assert (=> b!683460 m!648499))

(assert (=> b!683460 m!648511))

(declare-fun m!648529 () Bool)

(assert (=> b!683453 m!648529))

(declare-fun m!648531 () Bool)

(assert (=> b!683455 m!648531))

(declare-fun m!648533 () Bool)

(assert (=> b!683446 m!648533))

(check-sat (not b!683460) (not b!683445) (not b!683444) (not b!683449) (not b!683446) (not b!683452) (not b!683459) (not b!683453) (not b!683448) (not b!683455) (not b!683457) (not b!683447) (not start!60948) (not b!683458))
(check-sat)
(get-model)

(declare-fun d!94293 () Bool)

(declare-fun res!449265 () Bool)

(declare-fun e!389372 () Bool)

(assert (=> d!94293 (=> res!449265 e!389372)))

(get-info :version)

(assert (=> d!94293 (= res!449265 ((_ is Nil!12909) acc!681))))

(assert (=> d!94293 (= (noDuplicate!838 acc!681) e!389372)))

(declare-fun b!683580 () Bool)

(declare-fun e!389373 () Bool)

(assert (=> b!683580 (= e!389372 e!389373)))

(declare-fun res!449266 () Bool)

(assert (=> b!683580 (=> (not res!449266) (not e!389373))))

(assert (=> b!683580 (= res!449266 (not (contains!3564 (t!19147 acc!681) (h!13956 acc!681))))))

(declare-fun b!683581 () Bool)

(assert (=> b!683581 (= e!389373 (noDuplicate!838 (t!19147 acc!681)))))

(assert (= (and d!94293 (not res!449265)) b!683580))

(assert (= (and b!683580 res!449266) b!683581))

(declare-fun m!648631 () Bool)

(assert (=> b!683580 m!648631))

(declare-fun m!648633 () Bool)

(assert (=> b!683581 m!648633))

(assert (=> b!683449 d!94293))

(declare-fun d!94295 () Bool)

(assert (=> d!94295 (= ($colon$colon!335 acc!681 (select (arr!18964 a!3626) from!3004)) (Cons!12908 (select (arr!18964 a!3626) from!3004) acc!681))))

(assert (=> b!683460 d!94295))

(declare-fun d!94297 () Bool)

(declare-fun res!449282 () Bool)

(declare-fun e!389389 () Bool)

(assert (=> d!94297 (=> res!449282 e!389389)))

(assert (=> d!94297 (= res!449282 ((_ is Nil!12909) acc!681))))

(assert (=> d!94297 (= (subseq!173 acc!681 acc!681) e!389389)))

(declare-fun b!683594 () Bool)

(declare-fun e!389388 () Bool)

(assert (=> b!683594 (= e!389389 e!389388)))

(declare-fun res!449281 () Bool)

(assert (=> b!683594 (=> (not res!449281) (not e!389388))))

(assert (=> b!683594 (= res!449281 ((_ is Cons!12908) acc!681))))

(declare-fun b!683597 () Bool)

(declare-fun e!389386 () Bool)

(assert (=> b!683597 (= e!389386 (subseq!173 acc!681 (t!19147 acc!681)))))

(declare-fun b!683596 () Bool)

(declare-fun e!389387 () Bool)

(assert (=> b!683596 (= e!389387 (subseq!173 (t!19147 acc!681) (t!19147 acc!681)))))

(declare-fun b!683595 () Bool)

(assert (=> b!683595 (= e!389388 e!389386)))

(declare-fun res!449280 () Bool)

(assert (=> b!683595 (=> res!449280 e!389386)))

(assert (=> b!683595 (= res!449280 e!389387)))

(declare-fun res!449279 () Bool)

(assert (=> b!683595 (=> (not res!449279) (not e!389387))))

(assert (=> b!683595 (= res!449279 (= (h!13956 acc!681) (h!13956 acc!681)))))

(assert (= (and d!94297 (not res!449282)) b!683594))

(assert (= (and b!683594 res!449281) b!683595))

(assert (= (and b!683595 res!449279) b!683596))

(assert (= (and b!683595 (not res!449280)) b!683597))

(declare-fun m!648635 () Bool)

(assert (=> b!683597 m!648635))

(declare-fun m!648637 () Bool)

(assert (=> b!683596 m!648637))

(assert (=> b!683460 d!94297))

(declare-fun d!94301 () Bool)

(assert (=> d!94301 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313981 () Unit!23991)

(declare-fun choose!80 (array!39570 List!12912 List!12912 (_ BitVec 32)) Unit!23991)

(assert (=> d!94301 (= lt!313981 (choose!80 a!3626 ($colon$colon!335 acc!681 (select (arr!18964 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!94301 (bvslt (size!19328 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94301 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!335 acc!681 (select (arr!18964 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!313981)))

(declare-fun bs!20063 () Bool)

(assert (= bs!20063 d!94301))

(assert (=> bs!20063 m!648491))

(assert (=> bs!20063 m!648525))

(declare-fun m!648645 () Bool)

(assert (=> bs!20063 m!648645))

(assert (=> b!683460 d!94301))

(declare-fun d!94305 () Bool)

(assert (=> d!94305 (subseq!173 acc!681 acc!681)))

(declare-fun lt!313985 () Unit!23991)

(declare-fun choose!36 (List!12912) Unit!23991)

(assert (=> d!94305 (= lt!313985 (choose!36 acc!681))))

(assert (=> d!94305 (= (lemmaListSubSeqRefl!0 acc!681) lt!313985)))

(declare-fun bs!20064 () Bool)

(assert (= bs!20064 d!94305))

(assert (=> bs!20064 m!648511))

(declare-fun m!648659 () Bool)

(assert (=> bs!20064 m!648659))

(assert (=> b!683460 d!94305))

(declare-fun b!683628 () Bool)

(declare-fun e!389421 () Bool)

(declare-fun e!389420 () Bool)

(assert (=> b!683628 (= e!389421 e!389420)))

(declare-fun c!77528 () Bool)

(assert (=> b!683628 (= c!77528 (validKeyInArray!0 (select (arr!18964 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!683629 () Bool)

(declare-fun e!389418 () Bool)

(assert (=> b!683629 (= e!389418 e!389421)))

(declare-fun res!449311 () Bool)

(assert (=> b!683629 (=> (not res!449311) (not e!389421))))

(declare-fun e!389419 () Bool)

(assert (=> b!683629 (= res!449311 (not e!389419))))

(declare-fun res!449309 () Bool)

(assert (=> b!683629 (=> (not res!449309) (not e!389419))))

(assert (=> b!683629 (= res!449309 (validKeyInArray!0 (select (arr!18964 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!94313 () Bool)

(declare-fun res!449310 () Bool)

(assert (=> d!94313 (=> res!449310 e!389418)))

(assert (=> d!94313 (= res!449310 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19328 a!3626)))))

(assert (=> d!94313 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!389418)))

(declare-fun b!683630 () Bool)

(declare-fun call!34014 () Bool)

(assert (=> b!683630 (= e!389420 call!34014)))

(declare-fun b!683631 () Bool)

(assert (=> b!683631 (= e!389419 (contains!3564 acc!681 (select (arr!18964 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!683632 () Bool)

(assert (=> b!683632 (= e!389420 call!34014)))

(declare-fun bm!34011 () Bool)

(assert (=> bm!34011 (= call!34014 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77528 (Cons!12908 (select (arr!18964 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(assert (= (and d!94313 (not res!449310)) b!683629))

(assert (= (and b!683629 res!449309) b!683631))

(assert (= (and b!683629 res!449311) b!683628))

(assert (= (and b!683628 c!77528) b!683632))

(assert (= (and b!683628 (not c!77528)) b!683630))

(assert (= (or b!683632 b!683630) bm!34011))

(declare-fun m!648663 () Bool)

(assert (=> b!683628 m!648663))

(assert (=> b!683628 m!648663))

(declare-fun m!648665 () Bool)

(assert (=> b!683628 m!648665))

(assert (=> b!683629 m!648663))

(assert (=> b!683629 m!648663))

(assert (=> b!683629 m!648665))

(assert (=> b!683631 m!648663))

(assert (=> b!683631 m!648663))

(declare-fun m!648667 () Bool)

(assert (=> b!683631 m!648667))

(assert (=> bm!34011 m!648663))

(declare-fun m!648669 () Bool)

(assert (=> bm!34011 m!648669))

(assert (=> b!683460 d!94313))

(declare-fun b!683633 () Bool)

(declare-fun e!389425 () Bool)

(declare-fun e!389424 () Bool)

(assert (=> b!683633 (= e!389425 e!389424)))

(declare-fun c!77529 () Bool)

(assert (=> b!683633 (= c!77529 (validKeyInArray!0 (select (arr!18964 a!3626) from!3004)))))

(declare-fun b!683634 () Bool)

(declare-fun e!389422 () Bool)

(assert (=> b!683634 (= e!389422 e!389425)))

(declare-fun res!449314 () Bool)

(assert (=> b!683634 (=> (not res!449314) (not e!389425))))

(declare-fun e!389423 () Bool)

(assert (=> b!683634 (= res!449314 (not e!389423))))

(declare-fun res!449312 () Bool)

(assert (=> b!683634 (=> (not res!449312) (not e!389423))))

(assert (=> b!683634 (= res!449312 (validKeyInArray!0 (select (arr!18964 a!3626) from!3004)))))

(declare-fun d!94321 () Bool)

(declare-fun res!449313 () Bool)

(assert (=> d!94321 (=> res!449313 e!389422)))

(assert (=> d!94321 (= res!449313 (bvsge from!3004 (size!19328 a!3626)))))

(assert (=> d!94321 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!389422)))

(declare-fun b!683635 () Bool)

(declare-fun call!34015 () Bool)

(assert (=> b!683635 (= e!389424 call!34015)))

(declare-fun b!683636 () Bool)

(assert (=> b!683636 (= e!389423 (contains!3564 acc!681 (select (arr!18964 a!3626) from!3004)))))

(declare-fun b!683637 () Bool)

(assert (=> b!683637 (= e!389424 call!34015)))

(declare-fun bm!34012 () Bool)

(assert (=> bm!34012 (= call!34015 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77529 (Cons!12908 (select (arr!18964 a!3626) from!3004) acc!681) acc!681)))))

(assert (= (and d!94321 (not res!449313)) b!683634))

(assert (= (and b!683634 res!449312) b!683636))

(assert (= (and b!683634 res!449314) b!683633))

(assert (= (and b!683633 c!77529) b!683637))

(assert (= (and b!683633 (not c!77529)) b!683635))

(assert (= (or b!683637 b!683635) bm!34012))

(assert (=> b!683633 m!648493))

(assert (=> b!683633 m!648493))

(assert (=> b!683633 m!648503))

(assert (=> b!683634 m!648493))

(assert (=> b!683634 m!648493))

(assert (=> b!683634 m!648503))

(assert (=> b!683636 m!648493))

(assert (=> b!683636 m!648493))

(declare-fun m!648673 () Bool)

(assert (=> b!683636 m!648673))

(assert (=> bm!34012 m!648493))

(declare-fun m!648677 () Bool)

(assert (=> bm!34012 m!648677))

(assert (=> b!683457 d!94321))

(declare-fun d!94325 () Bool)

(declare-fun res!449323 () Bool)

(declare-fun e!389434 () Bool)

(assert (=> d!94325 (=> res!449323 e!389434)))

(assert (=> d!94325 (= res!449323 (= (select (arr!18964 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!94325 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!389434)))

(declare-fun b!683646 () Bool)

(declare-fun e!389435 () Bool)

(assert (=> b!683646 (= e!389434 e!389435)))

(declare-fun res!449324 () Bool)

(assert (=> b!683646 (=> (not res!449324) (not e!389435))))

(assert (=> b!683646 (= res!449324 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19328 a!3626)))))

(declare-fun b!683647 () Bool)

(assert (=> b!683647 (= e!389435 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!94325 (not res!449323)) b!683646))

(assert (= (and b!683646 res!449324) b!683647))

(declare-fun m!648681 () Bool)

(assert (=> d!94325 m!648681))

(declare-fun m!648683 () Bool)

(assert (=> b!683647 m!648683))

(assert (=> b!683446 d!94325))

(declare-fun d!94329 () Bool)

(declare-fun lt!313997 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!283 (List!12912) (InoxSet (_ BitVec 64)))

(assert (=> d!94329 (= lt!313997 (select (content!283 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!389440 () Bool)

(assert (=> d!94329 (= lt!313997 e!389440)))

(declare-fun res!449329 () Bool)

(assert (=> d!94329 (=> (not res!449329) (not e!389440))))

(assert (=> d!94329 (= res!449329 ((_ is Cons!12908) acc!681))))

(assert (=> d!94329 (= (contains!3564 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313997)))

(declare-fun b!683652 () Bool)

(declare-fun e!389441 () Bool)

(assert (=> b!683652 (= e!389440 e!389441)))

(declare-fun res!449330 () Bool)

(assert (=> b!683652 (=> res!449330 e!389441)))

(assert (=> b!683652 (= res!449330 (= (h!13956 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!683653 () Bool)

(assert (=> b!683653 (= e!389441 (contains!3564 (t!19147 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94329 res!449329) b!683652))

(assert (= (and b!683652 (not res!449330)) b!683653))

(declare-fun m!648687 () Bool)

(assert (=> d!94329 m!648687))

(declare-fun m!648689 () Bool)

(assert (=> d!94329 m!648689))

(declare-fun m!648691 () Bool)

(assert (=> b!683653 m!648691))

(assert (=> b!683447 d!94329))

(declare-fun b!683685 () Bool)

(declare-fun e!389469 () List!12912)

(declare-fun call!34021 () List!12912)

(assert (=> b!683685 (= e!389469 call!34021)))

(declare-fun b!683686 () Bool)

(assert (=> b!683686 (= e!389469 (Cons!12908 (h!13956 lt!313920) call!34021))))

(declare-fun b!683687 () Bool)

(declare-fun e!389467 () List!12912)

(assert (=> b!683687 (= e!389467 Nil!12909)))

(declare-fun d!94335 () Bool)

(declare-fun e!389468 () Bool)

(assert (=> d!94335 e!389468))

(declare-fun res!449348 () Bool)

(assert (=> d!94335 (=> (not res!449348) (not e!389468))))

(declare-fun lt!314003 () List!12912)

(declare-fun size!19331 (List!12912) Int)

(assert (=> d!94335 (= res!449348 (<= (size!19331 lt!314003) (size!19331 lt!313920)))))

(assert (=> d!94335 (= lt!314003 e!389467)))

(declare-fun c!77538 () Bool)

(assert (=> d!94335 (= c!77538 ((_ is Cons!12908) lt!313920))))

(assert (=> d!94335 (= (-!137 lt!313920 k0!2843) lt!314003)))

(declare-fun b!683688 () Bool)

(assert (=> b!683688 (= e!389467 e!389469)))

(declare-fun c!77537 () Bool)

(assert (=> b!683688 (= c!77537 (= k0!2843 (h!13956 lt!313920)))))

(declare-fun bm!34018 () Bool)

(assert (=> bm!34018 (= call!34021 (-!137 (t!19147 lt!313920) k0!2843))))

(declare-fun b!683689 () Bool)

(assert (=> b!683689 (= e!389468 (= (content!283 lt!314003) ((_ map and) (content!283 lt!313920) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2843 true)))))))

(assert (= (and d!94335 c!77538) b!683688))

(assert (= (and d!94335 (not c!77538)) b!683687))

(assert (= (and b!683688 c!77537) b!683685))

(assert (= (and b!683688 (not c!77537)) b!683686))

(assert (= (or b!683685 b!683686) bm!34018))

(assert (= (and d!94335 res!449348) b!683689))

(declare-fun m!648707 () Bool)

(assert (=> d!94335 m!648707))

(declare-fun m!648709 () Bool)

(assert (=> d!94335 m!648709))

(declare-fun m!648711 () Bool)

(assert (=> bm!34018 m!648711))

(declare-fun m!648713 () Bool)

(assert (=> b!683689 m!648713))

(declare-fun m!648715 () Bool)

(assert (=> b!683689 m!648715))

(declare-fun m!648717 () Bool)

(assert (=> b!683689 m!648717))

(assert (=> b!683458 d!94335))

(assert (=> b!683458 d!94297))

(declare-fun d!94343 () Bool)

(declare-fun res!449351 () Bool)

(declare-fun e!389472 () Bool)

(assert (=> d!94343 (=> res!449351 e!389472)))

(assert (=> d!94343 (= res!449351 (= (select (arr!18964 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!94343 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!389472)))

(declare-fun b!683692 () Bool)

(declare-fun e!389473 () Bool)

(assert (=> b!683692 (= e!389472 e!389473)))

(declare-fun res!449352 () Bool)

(assert (=> b!683692 (=> (not res!449352) (not e!389473))))

(assert (=> b!683692 (= res!449352 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19328 a!3626)))))

(declare-fun b!683693 () Bool)

(assert (=> b!683693 (= e!389473 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94343 (not res!449351)) b!683692))

(assert (= (and b!683692 res!449352) b!683693))

(assert (=> d!94343 m!648663))

(declare-fun m!648723 () Bool)

(assert (=> b!683693 m!648723))

(assert (=> b!683458 d!94343))

(declare-fun d!94347 () Bool)

(assert (=> d!94347 (= (-!137 ($colon$colon!335 acc!681 k0!2843) k0!2843) acc!681)))

(declare-fun lt!314007 () Unit!23991)

(declare-fun choose!16 ((_ BitVec 64) List!12912) Unit!23991)

(assert (=> d!94347 (= lt!314007 (choose!16 k0!2843 acc!681))))

(assert (=> d!94347 (not (contains!3564 acc!681 k0!2843))))

(assert (=> d!94347 (= (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681) lt!314007)))

(declare-fun bs!20069 () Bool)

(assert (= bs!20069 d!94347))

(assert (=> bs!20069 m!648501))

(assert (=> bs!20069 m!648501))

(declare-fun m!648731 () Bool)

(assert (=> bs!20069 m!648731))

(declare-fun m!648733 () Bool)

(assert (=> bs!20069 m!648733))

(assert (=> bs!20069 m!648517))

(assert (=> b!683458 d!94347))

(declare-fun d!94353 () Bool)

(declare-fun res!449362 () Bool)

(declare-fun e!389486 () Bool)

(assert (=> d!94353 (=> res!449362 e!389486)))

(assert (=> d!94353 (= res!449362 (= (select (arr!18964 (array!39571 (store (arr!18964 a!3626) i!1382 k0!2843) (size!19328 a!3626))) from!3004) k0!2843))))

(assert (=> d!94353 (= (arrayContainsKey!0 (array!39571 (store (arr!18964 a!3626) i!1382 k0!2843) (size!19328 a!3626)) k0!2843 from!3004) e!389486)))

(declare-fun b!683709 () Bool)

(declare-fun e!389487 () Bool)

(assert (=> b!683709 (= e!389486 e!389487)))

(declare-fun res!449363 () Bool)

(assert (=> b!683709 (=> (not res!449363) (not e!389487))))

(assert (=> b!683709 (= res!449363 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19328 (array!39571 (store (arr!18964 a!3626) i!1382 k0!2843) (size!19328 a!3626)))))))

(declare-fun b!683710 () Bool)

(assert (=> b!683710 (= e!389487 (arrayContainsKey!0 (array!39571 (store (arr!18964 a!3626) i!1382 k0!2843) (size!19328 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94353 (not res!449362)) b!683709))

(assert (= (and b!683709 res!449363) b!683710))

(declare-fun m!648735 () Bool)

(assert (=> d!94353 m!648735))

(declare-fun m!648737 () Bool)

(assert (=> b!683710 m!648737))

(assert (=> b!683458 d!94353))

(assert (=> b!683458 d!94305))

(declare-fun d!94355 () Bool)

(assert (=> d!94355 (= (validKeyInArray!0 (select (arr!18964 a!3626) from!3004)) (and (not (= (select (arr!18964 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18964 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!683458 d!94355))

(declare-fun d!94357 () Bool)

(assert (=> d!94357 (= ($colon$colon!335 acc!681 k0!2843) (Cons!12908 k0!2843 acc!681))))

(assert (=> b!683458 d!94357))

(assert (=> b!683458 d!94313))

(declare-fun d!94359 () Bool)

(assert (=> d!94359 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!683459 d!94359))

(declare-fun d!94361 () Bool)

(declare-fun lt!314008 () Bool)

(assert (=> d!94361 (= lt!314008 (select (content!283 acc!681) k0!2843))))

(declare-fun e!389488 () Bool)

(assert (=> d!94361 (= lt!314008 e!389488)))

(declare-fun res!449364 () Bool)

(assert (=> d!94361 (=> (not res!449364) (not e!389488))))

(assert (=> d!94361 (= res!449364 ((_ is Cons!12908) acc!681))))

(assert (=> d!94361 (= (contains!3564 acc!681 k0!2843) lt!314008)))

(declare-fun b!683711 () Bool)

(declare-fun e!389489 () Bool)

(assert (=> b!683711 (= e!389488 e!389489)))

(declare-fun res!449365 () Bool)

(assert (=> b!683711 (=> res!449365 e!389489)))

(assert (=> b!683711 (= res!449365 (= (h!13956 acc!681) k0!2843))))

(declare-fun b!683712 () Bool)

(assert (=> b!683712 (= e!389489 (contains!3564 (t!19147 acc!681) k0!2843))))

(assert (= (and d!94361 res!449364) b!683711))

(assert (= (and b!683711 (not res!449365)) b!683712))

(assert (=> d!94361 m!648687))

(declare-fun m!648739 () Bool)

(assert (=> d!94361 m!648739))

(declare-fun m!648741 () Bool)

(assert (=> b!683712 m!648741))

(assert (=> b!683448 d!94361))

(declare-fun d!94363 () Bool)

(assert (=> d!94363 (= (array_inv!14823 a!3626) (bvsge (size!19328 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60948 d!94363))

(declare-fun d!94365 () Bool)

(assert (=> d!94365 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!314013 () Unit!23991)

(declare-fun choose!13 (array!39570 (_ BitVec 64) (_ BitVec 32)) Unit!23991)

(assert (=> d!94365 (= lt!314013 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!94365 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!94365 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!314013)))

(declare-fun bs!20070 () Bool)

(assert (= bs!20070 d!94365))

(assert (=> bs!20070 m!648533))

(declare-fun m!648743 () Bool)

(assert (=> bs!20070 m!648743))

(assert (=> b!683455 d!94365))

(declare-fun b!683728 () Bool)

(declare-fun e!389504 () Bool)

(declare-fun e!389503 () Bool)

(assert (=> b!683728 (= e!389504 e!389503)))

(declare-fun c!77547 () Bool)

(assert (=> b!683728 (= c!77547 (validKeyInArray!0 (select (arr!18964 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!683729 () Bool)

(declare-fun e!389501 () Bool)

(assert (=> b!683729 (= e!389501 e!389504)))

(declare-fun res!449373 () Bool)

(assert (=> b!683729 (=> (not res!449373) (not e!389504))))

(declare-fun e!389502 () Bool)

(assert (=> b!683729 (= res!449373 (not e!389502))))

(declare-fun res!449371 () Bool)

(assert (=> b!683729 (=> (not res!449371) (not e!389502))))

(assert (=> b!683729 (= res!449371 (validKeyInArray!0 (select (arr!18964 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!94367 () Bool)

(declare-fun res!449372 () Bool)

(assert (=> d!94367 (=> res!449372 e!389501)))

(assert (=> d!94367 (= res!449372 (bvsge #b00000000000000000000000000000000 (size!19328 a!3626)))))

(assert (=> d!94367 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12909) e!389501)))

(declare-fun b!683730 () Bool)

(declare-fun call!34028 () Bool)

(assert (=> b!683730 (= e!389503 call!34028)))

(declare-fun b!683731 () Bool)

(assert (=> b!683731 (= e!389502 (contains!3564 Nil!12909 (select (arr!18964 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!683732 () Bool)

(assert (=> b!683732 (= e!389503 call!34028)))

(declare-fun bm!34025 () Bool)

(assert (=> bm!34025 (= call!34028 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77547 (Cons!12908 (select (arr!18964 a!3626) #b00000000000000000000000000000000) Nil!12909) Nil!12909)))))

(assert (= (and d!94367 (not res!449372)) b!683729))

(assert (= (and b!683729 res!449371) b!683731))

(assert (= (and b!683729 res!449373) b!683728))

(assert (= (and b!683728 c!77547) b!683732))

(assert (= (and b!683728 (not c!77547)) b!683730))

(assert (= (or b!683732 b!683730) bm!34025))

(assert (=> b!683728 m!648681))

(assert (=> b!683728 m!648681))

(declare-fun m!648751 () Bool)

(assert (=> b!683728 m!648751))

(assert (=> b!683729 m!648681))

(assert (=> b!683729 m!648681))

(assert (=> b!683729 m!648751))

(assert (=> b!683731 m!648681))

(assert (=> b!683731 m!648681))

(declare-fun m!648763 () Bool)

(assert (=> b!683731 m!648763))

(assert (=> bm!34025 m!648681))

(declare-fun m!648765 () Bool)

(assert (=> bm!34025 m!648765))

(assert (=> b!683444 d!94367))

(assert (=> b!683445 d!94361))

(declare-fun d!94373 () Bool)

(declare-fun lt!314015 () Bool)

(assert (=> d!94373 (= lt!314015 (select (content!283 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!389510 () Bool)

(assert (=> d!94373 (= lt!314015 e!389510)))

(declare-fun res!449377 () Bool)

(assert (=> d!94373 (=> (not res!449377) (not e!389510))))

(assert (=> d!94373 (= res!449377 ((_ is Cons!12908) acc!681))))

(assert (=> d!94373 (= (contains!3564 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!314015)))

(declare-fun b!683740 () Bool)

(declare-fun e!389511 () Bool)

(assert (=> b!683740 (= e!389510 e!389511)))

(declare-fun res!449378 () Bool)

(assert (=> b!683740 (=> res!449378 e!389511)))

(assert (=> b!683740 (= res!449378 (= (h!13956 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!683741 () Bool)

(assert (=> b!683741 (= e!389511 (contains!3564 (t!19147 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94373 res!449377) b!683740))

(assert (= (and b!683740 (not res!449378)) b!683741))

(assert (=> d!94373 m!648687))

(declare-fun m!648769 () Bool)

(assert (=> d!94373 m!648769))

(declare-fun m!648771 () Bool)

(assert (=> b!683741 m!648771))

(assert (=> b!683452 d!94373))

(declare-fun d!94377 () Bool)

(declare-fun res!449379 () Bool)

(declare-fun e!389512 () Bool)

(assert (=> d!94377 (=> res!449379 e!389512)))

(assert (=> d!94377 (= res!449379 ((_ is Nil!12909) lt!313920))))

(assert (=> d!94377 (= (noDuplicate!838 lt!313920) e!389512)))

(declare-fun b!683742 () Bool)

(declare-fun e!389513 () Bool)

(assert (=> b!683742 (= e!389512 e!389513)))

(declare-fun res!449380 () Bool)

(assert (=> b!683742 (=> (not res!449380) (not e!389513))))

(assert (=> b!683742 (= res!449380 (not (contains!3564 (t!19147 lt!313920) (h!13956 lt!313920))))))

(declare-fun b!683743 () Bool)

(assert (=> b!683743 (= e!389513 (noDuplicate!838 (t!19147 lt!313920)))))

(assert (= (and d!94377 (not res!449379)) b!683742))

(assert (= (and b!683742 res!449380) b!683743))

(declare-fun m!648773 () Bool)

(assert (=> b!683742 m!648773))

(declare-fun m!648775 () Bool)

(assert (=> b!683743 m!648775))

(assert (=> b!683453 d!94377))

(check-sat (not b!683647) (not b!683742) (not b!683729) (not d!94335) (not d!94301) (not b!683631) (not d!94305) (not d!94329) (not b!683710) (not b!683628) (not b!683629) (not b!683741) (not bm!34012) (not b!683634) (not b!683743) (not b!683731) (not b!683689) (not bm!34018) (not b!683653) (not b!683580) (not bm!34025) (not d!94373) (not b!683633) (not b!683581) (not b!683596) (not b!683597) (not b!683712) (not b!683728) (not b!683636) (not d!94361) (not bm!34011) (not d!94347) (not d!94365) (not b!683693))
(check-sat)
