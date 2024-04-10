; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62904 () Bool)

(assert start!62904)

(declare-fun b!709276 () Bool)

(declare-fun res!472837 () Bool)

(declare-fun e!399164 () Bool)

(assert (=> b!709276 (=> (not res!472837) (not e!399164))))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40371 0))(
  ( (array!40372 (arr!19336 (Array (_ BitVec 32) (_ BitVec 64))) (size!19729 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40371)

(assert (=> b!709276 (= res!472837 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19729 a!3591)))))

(declare-fun b!709277 () Bool)

(declare-fun res!472833 () Bool)

(assert (=> b!709277 (=> (not res!472833) (not e!399164))))

(declare-datatypes ((List!13377 0))(
  ( (Nil!13374) (Cons!13373 (h!14418 (_ BitVec 64)) (t!19671 List!13377)) )
))
(declare-fun newAcc!49 () List!13377)

(declare-fun contains!3954 (List!13377 (_ BitVec 64)) Bool)

(assert (=> b!709277 (= res!472833 (not (contains!3954 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709278 () Bool)

(declare-fun res!472831 () Bool)

(assert (=> b!709278 (=> (not res!472831) (not e!399164))))

(declare-fun acc!652 () List!13377)

(assert (=> b!709278 (= res!472831 (not (contains!3954 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709279 () Bool)

(declare-fun res!472842 () Bool)

(declare-fun e!399163 () Bool)

(assert (=> b!709279 (=> (not res!472842) (not e!399163))))

(declare-fun lt!318203 () List!13377)

(assert (=> b!709279 (= res!472842 (not (contains!3954 lt!318203 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709280 () Bool)

(assert (=> b!709280 (= e!399164 e!399163)))

(declare-fun res!472826 () Bool)

(assert (=> b!709280 (=> (not res!472826) (not e!399163))))

(assert (=> b!709280 (= res!472826 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!510 (List!13377 (_ BitVec 64)) List!13377)

(assert (=> b!709280 (= lt!318203 ($colon$colon!510 acc!652 (select (arr!19336 a!3591) from!2969)))))

(declare-fun res!472824 () Bool)

(assert (=> start!62904 (=> (not res!472824) (not e!399164))))

(assert (=> start!62904 (= res!472824 (and (bvslt (size!19729 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19729 a!3591))))))

(assert (=> start!62904 e!399164))

(assert (=> start!62904 true))

(declare-fun array_inv!15132 (array!40371) Bool)

(assert (=> start!62904 (array_inv!15132 a!3591)))

(declare-fun b!709281 () Bool)

(declare-fun res!472834 () Bool)

(assert (=> b!709281 (=> (not res!472834) (not e!399164))))

(declare-fun noDuplicate!1201 (List!13377) Bool)

(assert (=> b!709281 (= res!472834 (noDuplicate!1201 newAcc!49))))

(declare-fun b!709282 () Bool)

(declare-fun res!472839 () Bool)

(assert (=> b!709282 (=> (not res!472839) (not e!399164))))

(declare-fun subseq!399 (List!13377 List!13377) Bool)

(assert (=> b!709282 (= res!472839 (subseq!399 acc!652 newAcc!49))))

(declare-fun b!709283 () Bool)

(declare-fun res!472823 () Bool)

(assert (=> b!709283 (=> (not res!472823) (not e!399164))))

(assert (=> b!709283 (= res!472823 (noDuplicate!1201 acc!652))))

(declare-fun b!709284 () Bool)

(declare-fun res!472840 () Bool)

(assert (=> b!709284 (=> (not res!472840) (not e!399163))))

(assert (=> b!709284 (= res!472840 (not (contains!3954 lt!318203 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709285 () Bool)

(declare-fun res!472843 () Bool)

(assert (=> b!709285 (=> (not res!472843) (not e!399164))))

(declare-fun k0!2824 () (_ BitVec 64))

(assert (=> b!709285 (= res!472843 (not (contains!3954 acc!652 k0!2824)))))

(declare-fun b!709286 () Bool)

(declare-fun res!472838 () Bool)

(assert (=> b!709286 (=> (not res!472838) (not e!399164))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!709286 (= res!472838 (validKeyInArray!0 (select (arr!19336 a!3591) from!2969)))))

(declare-fun b!709287 () Bool)

(declare-fun res!472832 () Bool)

(assert (=> b!709287 (=> (not res!472832) (not e!399164))))

(assert (=> b!709287 (= res!472832 (not (contains!3954 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709288 () Bool)

(declare-fun res!472825 () Bool)

(assert (=> b!709288 (=> (not res!472825) (not e!399164))))

(declare-fun arrayNoDuplicates!0 (array!40371 (_ BitVec 32) List!13377) Bool)

(assert (=> b!709288 (= res!472825 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!709289 () Bool)

(declare-fun res!472827 () Bool)

(assert (=> b!709289 (=> (not res!472827) (not e!399164))))

(declare-fun arrayContainsKey!0 (array!40371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!709289 (= res!472827 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!709290 () Bool)

(declare-fun res!472835 () Bool)

(assert (=> b!709290 (=> (not res!472835) (not e!399163))))

(assert (=> b!709290 (= res!472835 (noDuplicate!1201 ($colon$colon!510 newAcc!49 (select (arr!19336 a!3591) from!2969))))))

(declare-fun b!709291 () Bool)

(declare-fun res!472841 () Bool)

(assert (=> b!709291 (=> (not res!472841) (not e!399163))))

(assert (=> b!709291 (= res!472841 (noDuplicate!1201 lt!318203))))

(declare-fun b!709292 () Bool)

(declare-fun res!472829 () Bool)

(assert (=> b!709292 (=> (not res!472829) (not e!399164))))

(declare-fun -!364 (List!13377 (_ BitVec 64)) List!13377)

(assert (=> b!709292 (= res!472829 (= (-!364 newAcc!49 k0!2824) acc!652))))

(declare-fun b!709293 () Bool)

(declare-fun res!472822 () Bool)

(assert (=> b!709293 (=> (not res!472822) (not e!399164))))

(assert (=> b!709293 (= res!472822 (contains!3954 newAcc!49 k0!2824))))

(declare-fun b!709294 () Bool)

(declare-fun res!472836 () Bool)

(assert (=> b!709294 (=> (not res!472836) (not e!399164))))

(assert (=> b!709294 (= res!472836 (validKeyInArray!0 k0!2824))))

(declare-fun b!709295 () Bool)

(declare-fun res!472828 () Bool)

(assert (=> b!709295 (=> (not res!472828) (not e!399164))))

(assert (=> b!709295 (= res!472828 (not (contains!3954 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!709296 () Bool)

(declare-fun res!472830 () Bool)

(assert (=> b!709296 (=> (not res!472830) (not e!399163))))

(assert (=> b!709296 (= res!472830 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!709297 () Bool)

(assert (=> b!709297 (= e!399163 (contains!3954 lt!318203 k0!2824))))

(assert (= (and start!62904 res!472824) b!709283))

(assert (= (and b!709283 res!472823) b!709281))

(assert (= (and b!709281 res!472834) b!709287))

(assert (= (and b!709287 res!472832) b!709278))

(assert (= (and b!709278 res!472831) b!709289))

(assert (= (and b!709289 res!472827) b!709285))

(assert (= (and b!709285 res!472843) b!709294))

(assert (= (and b!709294 res!472836) b!709288))

(assert (= (and b!709288 res!472825) b!709282))

(assert (= (and b!709282 res!472839) b!709293))

(assert (= (and b!709293 res!472822) b!709292))

(assert (= (and b!709292 res!472829) b!709277))

(assert (= (and b!709277 res!472833) b!709295))

(assert (= (and b!709295 res!472828) b!709276))

(assert (= (and b!709276 res!472837) b!709286))

(assert (= (and b!709286 res!472838) b!709280))

(assert (= (and b!709280 res!472826) b!709291))

(assert (= (and b!709291 res!472841) b!709290))

(assert (= (and b!709290 res!472835) b!709279))

(assert (= (and b!709279 res!472842) b!709284))

(assert (= (and b!709284 res!472840) b!709296))

(assert (= (and b!709296 res!472830) b!709297))

(declare-fun m!666589 () Bool)

(assert (=> b!709297 m!666589))

(declare-fun m!666591 () Bool)

(assert (=> b!709281 m!666591))

(declare-fun m!666593 () Bool)

(assert (=> b!709293 m!666593))

(declare-fun m!666595 () Bool)

(assert (=> b!709278 m!666595))

(declare-fun m!666597 () Bool)

(assert (=> b!709282 m!666597))

(declare-fun m!666599 () Bool)

(assert (=> b!709283 m!666599))

(declare-fun m!666601 () Bool)

(assert (=> b!709294 m!666601))

(declare-fun m!666603 () Bool)

(assert (=> b!709295 m!666603))

(declare-fun m!666605 () Bool)

(assert (=> b!709286 m!666605))

(assert (=> b!709286 m!666605))

(declare-fun m!666607 () Bool)

(assert (=> b!709286 m!666607))

(declare-fun m!666609 () Bool)

(assert (=> b!709287 m!666609))

(declare-fun m!666611 () Bool)

(assert (=> b!709277 m!666611))

(assert (=> b!709290 m!666605))

(assert (=> b!709290 m!666605))

(declare-fun m!666613 () Bool)

(assert (=> b!709290 m!666613))

(assert (=> b!709290 m!666613))

(declare-fun m!666615 () Bool)

(assert (=> b!709290 m!666615))

(declare-fun m!666617 () Bool)

(assert (=> b!709288 m!666617))

(declare-fun m!666619 () Bool)

(assert (=> b!709292 m!666619))

(declare-fun m!666621 () Bool)

(assert (=> b!709291 m!666621))

(declare-fun m!666623 () Bool)

(assert (=> b!709279 m!666623))

(declare-fun m!666625 () Bool)

(assert (=> b!709289 m!666625))

(declare-fun m!666627 () Bool)

(assert (=> b!709296 m!666627))

(assert (=> b!709280 m!666605))

(assert (=> b!709280 m!666605))

(declare-fun m!666629 () Bool)

(assert (=> b!709280 m!666629))

(declare-fun m!666631 () Bool)

(assert (=> b!709285 m!666631))

(declare-fun m!666633 () Bool)

(assert (=> b!709284 m!666633))

(declare-fun m!666635 () Bool)

(assert (=> start!62904 m!666635))

(check-sat (not b!709296) (not b!709297) (not b!709280) (not b!709292) (not b!709281) (not start!62904) (not b!709278) (not b!709288) (not b!709284) (not b!709291) (not b!709279) (not b!709295) (not b!709294) (not b!709287) (not b!709293) (not b!709289) (not b!709290) (not b!709283) (not b!709282) (not b!709277) (not b!709285) (not b!709286))
(check-sat)
(get-model)

(declare-fun d!97081 () Bool)

(declare-fun res!472914 () Bool)

(declare-fun e!399178 () Bool)

(assert (=> d!97081 (=> res!472914 e!399178)))

(get-info :version)

(assert (=> d!97081 (= res!472914 ((_ is Nil!13374) newAcc!49))))

(assert (=> d!97081 (= (noDuplicate!1201 newAcc!49) e!399178)))

(declare-fun b!709368 () Bool)

(declare-fun e!399179 () Bool)

(assert (=> b!709368 (= e!399178 e!399179)))

(declare-fun res!472915 () Bool)

(assert (=> b!709368 (=> (not res!472915) (not e!399179))))

(assert (=> b!709368 (= res!472915 (not (contains!3954 (t!19671 newAcc!49) (h!14418 newAcc!49))))))

(declare-fun b!709369 () Bool)

(assert (=> b!709369 (= e!399179 (noDuplicate!1201 (t!19671 newAcc!49)))))

(assert (= (and d!97081 (not res!472914)) b!709368))

(assert (= (and b!709368 res!472915) b!709369))

(declare-fun m!666685 () Bool)

(assert (=> b!709368 m!666685))

(declare-fun m!666687 () Bool)

(assert (=> b!709369 m!666687))

(assert (=> b!709281 d!97081))

(declare-fun d!97083 () Bool)

(assert (=> d!97083 (= (array_inv!15132 a!3591) (bvsge (size!19729 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!62904 d!97083))

(declare-fun d!97085 () Bool)

(declare-fun res!472916 () Bool)

(declare-fun e!399180 () Bool)

(assert (=> d!97085 (=> res!472916 e!399180)))

(assert (=> d!97085 (= res!472916 ((_ is Nil!13374) lt!318203))))

(assert (=> d!97085 (= (noDuplicate!1201 lt!318203) e!399180)))

(declare-fun b!709370 () Bool)

(declare-fun e!399181 () Bool)

(assert (=> b!709370 (= e!399180 e!399181)))

(declare-fun res!472917 () Bool)

(assert (=> b!709370 (=> (not res!472917) (not e!399181))))

(assert (=> b!709370 (= res!472917 (not (contains!3954 (t!19671 lt!318203) (h!14418 lt!318203))))))

(declare-fun b!709371 () Bool)

(assert (=> b!709371 (= e!399181 (noDuplicate!1201 (t!19671 lt!318203)))))

(assert (= (and d!97085 (not res!472916)) b!709370))

(assert (= (and b!709370 res!472917) b!709371))

(declare-fun m!666689 () Bool)

(assert (=> b!709370 m!666689))

(declare-fun m!666691 () Bool)

(assert (=> b!709371 m!666691))

(assert (=> b!709291 d!97085))

(declare-fun d!97087 () Bool)

(assert (=> d!97087 (= ($colon$colon!510 acc!652 (select (arr!19336 a!3591) from!2969)) (Cons!13373 (select (arr!19336 a!3591) from!2969) acc!652))))

(assert (=> b!709280 d!97087))

(declare-fun d!97089 () Bool)

(declare-fun res!472918 () Bool)

(declare-fun e!399182 () Bool)

(assert (=> d!97089 (=> res!472918 e!399182)))

(assert (=> d!97089 (= res!472918 ((_ is Nil!13374) ($colon$colon!510 newAcc!49 (select (arr!19336 a!3591) from!2969))))))

(assert (=> d!97089 (= (noDuplicate!1201 ($colon$colon!510 newAcc!49 (select (arr!19336 a!3591) from!2969))) e!399182)))

(declare-fun b!709372 () Bool)

(declare-fun e!399183 () Bool)

(assert (=> b!709372 (= e!399182 e!399183)))

(declare-fun res!472919 () Bool)

(assert (=> b!709372 (=> (not res!472919) (not e!399183))))

(assert (=> b!709372 (= res!472919 (not (contains!3954 (t!19671 ($colon$colon!510 newAcc!49 (select (arr!19336 a!3591) from!2969))) (h!14418 ($colon$colon!510 newAcc!49 (select (arr!19336 a!3591) from!2969))))))))

(declare-fun b!709373 () Bool)

(assert (=> b!709373 (= e!399183 (noDuplicate!1201 (t!19671 ($colon$colon!510 newAcc!49 (select (arr!19336 a!3591) from!2969)))))))

(assert (= (and d!97089 (not res!472918)) b!709372))

(assert (= (and b!709372 res!472919) b!709373))

(declare-fun m!666693 () Bool)

(assert (=> b!709372 m!666693))

(declare-fun m!666695 () Bool)

(assert (=> b!709373 m!666695))

(assert (=> b!709290 d!97089))

(declare-fun d!97091 () Bool)

(assert (=> d!97091 (= ($colon$colon!510 newAcc!49 (select (arr!19336 a!3591) from!2969)) (Cons!13373 (select (arr!19336 a!3591) from!2969) newAcc!49))))

(assert (=> b!709290 d!97091))

(declare-fun d!97095 () Bool)

(declare-fun lt!318209 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!343 (List!13377) (InoxSet (_ BitVec 64)))

(assert (=> d!97095 (= lt!318209 (select (content!343 lt!318203) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399197 () Bool)

(assert (=> d!97095 (= lt!318209 e!399197)))

(declare-fun res!472932 () Bool)

(assert (=> d!97095 (=> (not res!472932) (not e!399197))))

(assert (=> d!97095 (= res!472932 ((_ is Cons!13373) lt!318203))))

(assert (=> d!97095 (= (contains!3954 lt!318203 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318209)))

(declare-fun b!709386 () Bool)

(declare-fun e!399196 () Bool)

(assert (=> b!709386 (= e!399197 e!399196)))

(declare-fun res!472933 () Bool)

(assert (=> b!709386 (=> res!472933 e!399196)))

(assert (=> b!709386 (= res!472933 (= (h!14418 lt!318203) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709387 () Bool)

(assert (=> b!709387 (= e!399196 (contains!3954 (t!19671 lt!318203) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97095 res!472932) b!709386))

(assert (= (and b!709386 (not res!472933)) b!709387))

(declare-fun m!666697 () Bool)

(assert (=> d!97095 m!666697))

(declare-fun m!666699 () Bool)

(assert (=> d!97095 m!666699))

(declare-fun m!666701 () Bool)

(assert (=> b!709387 m!666701))

(assert (=> b!709279 d!97095))

(declare-fun d!97097 () Bool)

(declare-fun res!472942 () Bool)

(declare-fun e!399206 () Bool)

(assert (=> d!97097 (=> res!472942 e!399206)))

(assert (=> d!97097 (= res!472942 (= (select (arr!19336 a!3591) from!2969) k0!2824))))

(assert (=> d!97097 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!399206)))

(declare-fun b!709396 () Bool)

(declare-fun e!399207 () Bool)

(assert (=> b!709396 (= e!399206 e!399207)))

(declare-fun res!472943 () Bool)

(assert (=> b!709396 (=> (not res!472943) (not e!399207))))

(assert (=> b!709396 (= res!472943 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19729 a!3591)))))

(declare-fun b!709397 () Bool)

(assert (=> b!709397 (= e!399207 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97097 (not res!472942)) b!709396))

(assert (= (and b!709396 res!472943) b!709397))

(assert (=> d!97097 m!666605))

(declare-fun m!666707 () Bool)

(assert (=> b!709397 m!666707))

(assert (=> b!709289 d!97097))

(declare-fun d!97101 () Bool)

(declare-fun lt!318210 () Bool)

(assert (=> d!97101 (= lt!318210 (select (content!343 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399209 () Bool)

(assert (=> d!97101 (= lt!318210 e!399209)))

(declare-fun res!472944 () Bool)

(assert (=> d!97101 (=> (not res!472944) (not e!399209))))

(assert (=> d!97101 (= res!472944 ((_ is Cons!13373) acc!652))))

(assert (=> d!97101 (= (contains!3954 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318210)))

(declare-fun b!709398 () Bool)

(declare-fun e!399208 () Bool)

(assert (=> b!709398 (= e!399209 e!399208)))

(declare-fun res!472945 () Bool)

(assert (=> b!709398 (=> res!472945 e!399208)))

(assert (=> b!709398 (= res!472945 (= (h!14418 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709399 () Bool)

(assert (=> b!709399 (= e!399208 (contains!3954 (t!19671 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97101 res!472944) b!709398))

(assert (= (and b!709398 (not res!472945)) b!709399))

(declare-fun m!666709 () Bool)

(assert (=> d!97101 m!666709))

(declare-fun m!666711 () Bool)

(assert (=> d!97101 m!666711))

(declare-fun m!666713 () Bool)

(assert (=> b!709399 m!666713))

(assert (=> b!709278 d!97101))

(declare-fun c!78602 () Bool)

(declare-fun bm!34437 () Bool)

(declare-fun call!34440 () Bool)

(assert (=> bm!34437 (= call!34440 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78602 (Cons!13373 (select (arr!19336 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!709434 () Bool)

(declare-fun e!399237 () Bool)

(assert (=> b!709434 (= e!399237 call!34440)))

(declare-fun b!709435 () Bool)

(declare-fun e!399239 () Bool)

(declare-fun e!399238 () Bool)

(assert (=> b!709435 (= e!399239 e!399238)))

(declare-fun res!472964 () Bool)

(assert (=> b!709435 (=> (not res!472964) (not e!399238))))

(declare-fun e!399236 () Bool)

(assert (=> b!709435 (= res!472964 (not e!399236))))

(declare-fun res!472963 () Bool)

(assert (=> b!709435 (=> (not res!472963) (not e!399236))))

(assert (=> b!709435 (= res!472963 (validKeyInArray!0 (select (arr!19336 a!3591) from!2969)))))

(declare-fun b!709436 () Bool)

(assert (=> b!709436 (= e!399236 (contains!3954 acc!652 (select (arr!19336 a!3591) from!2969)))))

(declare-fun b!709437 () Bool)

(assert (=> b!709437 (= e!399237 call!34440)))

(declare-fun d!97103 () Bool)

(declare-fun res!472965 () Bool)

(assert (=> d!97103 (=> res!472965 e!399239)))

(assert (=> d!97103 (= res!472965 (bvsge from!2969 (size!19729 a!3591)))))

(assert (=> d!97103 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!399239)))

(declare-fun b!709433 () Bool)

(assert (=> b!709433 (= e!399238 e!399237)))

(assert (=> b!709433 (= c!78602 (validKeyInArray!0 (select (arr!19336 a!3591) from!2969)))))

(assert (= (and d!97103 (not res!472965)) b!709435))

(assert (= (and b!709435 res!472963) b!709436))

(assert (= (and b!709435 res!472964) b!709433))

(assert (= (and b!709433 c!78602) b!709437))

(assert (= (and b!709433 (not c!78602)) b!709434))

(assert (= (or b!709437 b!709434) bm!34437))

(assert (=> bm!34437 m!666605))

(declare-fun m!666739 () Bool)

(assert (=> bm!34437 m!666739))

(assert (=> b!709435 m!666605))

(assert (=> b!709435 m!666605))

(assert (=> b!709435 m!666607))

(assert (=> b!709436 m!666605))

(assert (=> b!709436 m!666605))

(declare-fun m!666741 () Bool)

(assert (=> b!709436 m!666741))

(assert (=> b!709433 m!666605))

(assert (=> b!709433 m!666605))

(assert (=> b!709433 m!666607))

(assert (=> b!709288 d!97103))

(declare-fun d!97115 () Bool)

(declare-fun lt!318220 () Bool)

(assert (=> d!97115 (= lt!318220 (select (content!343 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399249 () Bool)

(assert (=> d!97115 (= lt!318220 e!399249)))

(declare-fun res!472974 () Bool)

(assert (=> d!97115 (=> (not res!472974) (not e!399249))))

(assert (=> d!97115 (= res!472974 ((_ is Cons!13373) newAcc!49))))

(assert (=> d!97115 (= (contains!3954 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318220)))

(declare-fun b!709446 () Bool)

(declare-fun e!399248 () Bool)

(assert (=> b!709446 (= e!399249 e!399248)))

(declare-fun res!472975 () Bool)

(assert (=> b!709446 (=> res!472975 e!399248)))

(assert (=> b!709446 (= res!472975 (= (h!14418 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709447 () Bool)

(assert (=> b!709447 (= e!399248 (contains!3954 (t!19671 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97115 res!472974) b!709446))

(assert (= (and b!709446 (not res!472975)) b!709447))

(declare-fun m!666743 () Bool)

(assert (=> d!97115 m!666743))

(declare-fun m!666745 () Bool)

(assert (=> d!97115 m!666745))

(declare-fun m!666747 () Bool)

(assert (=> b!709447 m!666747))

(assert (=> b!709277 d!97115))

(declare-fun d!97117 () Bool)

(declare-fun lt!318221 () Bool)

(assert (=> d!97117 (= lt!318221 (select (content!343 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399251 () Bool)

(assert (=> d!97117 (= lt!318221 e!399251)))

(declare-fun res!472976 () Bool)

(assert (=> d!97117 (=> (not res!472976) (not e!399251))))

(assert (=> d!97117 (= res!472976 ((_ is Cons!13373) acc!652))))

(assert (=> d!97117 (= (contains!3954 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318221)))

(declare-fun b!709448 () Bool)

(declare-fun e!399250 () Bool)

(assert (=> b!709448 (= e!399251 e!399250)))

(declare-fun res!472977 () Bool)

(assert (=> b!709448 (=> res!472977 e!399250)))

(assert (=> b!709448 (= res!472977 (= (h!14418 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709449 () Bool)

(assert (=> b!709449 (= e!399250 (contains!3954 (t!19671 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97117 res!472976) b!709448))

(assert (= (and b!709448 (not res!472977)) b!709449))

(assert (=> d!97117 m!666709))

(declare-fun m!666749 () Bool)

(assert (=> d!97117 m!666749))

(declare-fun m!666751 () Bool)

(assert (=> b!709449 m!666751))

(assert (=> b!709287 d!97117))

(declare-fun d!97119 () Bool)

(declare-fun lt!318223 () Bool)

(assert (=> d!97119 (= lt!318223 (select (content!343 lt!318203) k0!2824))))

(declare-fun e!399257 () Bool)

(assert (=> d!97119 (= lt!318223 e!399257)))

(declare-fun res!472982 () Bool)

(assert (=> d!97119 (=> (not res!472982) (not e!399257))))

(assert (=> d!97119 (= res!472982 ((_ is Cons!13373) lt!318203))))

(assert (=> d!97119 (= (contains!3954 lt!318203 k0!2824) lt!318223)))

(declare-fun b!709454 () Bool)

(declare-fun e!399256 () Bool)

(assert (=> b!709454 (= e!399257 e!399256)))

(declare-fun res!472983 () Bool)

(assert (=> b!709454 (=> res!472983 e!399256)))

(assert (=> b!709454 (= res!472983 (= (h!14418 lt!318203) k0!2824))))

(declare-fun b!709455 () Bool)

(assert (=> b!709455 (= e!399256 (contains!3954 (t!19671 lt!318203) k0!2824))))

(assert (= (and d!97119 res!472982) b!709454))

(assert (= (and b!709454 (not res!472983)) b!709455))

(assert (=> d!97119 m!666697))

(declare-fun m!666761 () Bool)

(assert (=> d!97119 m!666761))

(declare-fun m!666763 () Bool)

(assert (=> b!709455 m!666763))

(assert (=> b!709297 d!97119))

(declare-fun d!97125 () Bool)

(assert (=> d!97125 (= (validKeyInArray!0 (select (arr!19336 a!3591) from!2969)) (and (not (= (select (arr!19336 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19336 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!709286 d!97125))

(declare-fun d!97129 () Bool)

(declare-fun res!472984 () Bool)

(declare-fun e!399258 () Bool)

(assert (=> d!97129 (=> res!472984 e!399258)))

(assert (=> d!97129 (= res!472984 (= (select (arr!19336 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k0!2824))))

(assert (=> d!97129 (= (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!399258)))

(declare-fun b!709456 () Bool)

(declare-fun e!399259 () Bool)

(assert (=> b!709456 (= e!399258 e!399259)))

(declare-fun res!472985 () Bool)

(assert (=> b!709456 (=> (not res!472985) (not e!399259))))

(assert (=> b!709456 (= res!472985 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19729 a!3591)))))

(declare-fun b!709457 () Bool)

(assert (=> b!709457 (= e!399259 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97129 (not res!472984)) b!709456))

(assert (= (and b!709456 res!472985) b!709457))

(declare-fun m!666765 () Bool)

(assert (=> d!97129 m!666765))

(declare-fun m!666767 () Bool)

(assert (=> b!709457 m!666767))

(assert (=> b!709296 d!97129))

(declare-fun d!97131 () Bool)

(declare-fun lt!318224 () Bool)

(assert (=> d!97131 (= lt!318224 (select (content!343 acc!652) k0!2824))))

(declare-fun e!399261 () Bool)

(assert (=> d!97131 (= lt!318224 e!399261)))

(declare-fun res!472986 () Bool)

(assert (=> d!97131 (=> (not res!472986) (not e!399261))))

(assert (=> d!97131 (= res!472986 ((_ is Cons!13373) acc!652))))

(assert (=> d!97131 (= (contains!3954 acc!652 k0!2824) lt!318224)))

(declare-fun b!709458 () Bool)

(declare-fun e!399260 () Bool)

(assert (=> b!709458 (= e!399261 e!399260)))

(declare-fun res!472987 () Bool)

(assert (=> b!709458 (=> res!472987 e!399260)))

(assert (=> b!709458 (= res!472987 (= (h!14418 acc!652) k0!2824))))

(declare-fun b!709459 () Bool)

(assert (=> b!709459 (= e!399260 (contains!3954 (t!19671 acc!652) k0!2824))))

(assert (= (and d!97131 res!472986) b!709458))

(assert (= (and b!709458 (not res!472987)) b!709459))

(assert (=> d!97131 m!666709))

(declare-fun m!666769 () Bool)

(assert (=> d!97131 m!666769))

(declare-fun m!666771 () Bool)

(assert (=> b!709459 m!666771))

(assert (=> b!709285 d!97131))

(declare-fun d!97133 () Bool)

(declare-fun lt!318225 () Bool)

(assert (=> d!97133 (= lt!318225 (select (content!343 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399263 () Bool)

(assert (=> d!97133 (= lt!318225 e!399263)))

(declare-fun res!472988 () Bool)

(assert (=> d!97133 (=> (not res!472988) (not e!399263))))

(assert (=> d!97133 (= res!472988 ((_ is Cons!13373) newAcc!49))))

(assert (=> d!97133 (= (contains!3954 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318225)))

(declare-fun b!709460 () Bool)

(declare-fun e!399262 () Bool)

(assert (=> b!709460 (= e!399263 e!399262)))

(declare-fun res!472989 () Bool)

(assert (=> b!709460 (=> res!472989 e!399262)))

(assert (=> b!709460 (= res!472989 (= (h!14418 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709461 () Bool)

(assert (=> b!709461 (= e!399262 (contains!3954 (t!19671 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97133 res!472988) b!709460))

(assert (= (and b!709460 (not res!472989)) b!709461))

(assert (=> d!97133 m!666743))

(declare-fun m!666773 () Bool)

(assert (=> d!97133 m!666773))

(declare-fun m!666775 () Bool)

(assert (=> b!709461 m!666775))

(assert (=> b!709295 d!97133))

(declare-fun d!97135 () Bool)

(declare-fun lt!318226 () Bool)

(assert (=> d!97135 (= lt!318226 (select (content!343 lt!318203) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!399265 () Bool)

(assert (=> d!97135 (= lt!318226 e!399265)))

(declare-fun res!472990 () Bool)

(assert (=> d!97135 (=> (not res!472990) (not e!399265))))

(assert (=> d!97135 (= res!472990 ((_ is Cons!13373) lt!318203))))

(assert (=> d!97135 (= (contains!3954 lt!318203 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318226)))

(declare-fun b!709462 () Bool)

(declare-fun e!399264 () Bool)

(assert (=> b!709462 (= e!399265 e!399264)))

(declare-fun res!472991 () Bool)

(assert (=> b!709462 (=> res!472991 e!399264)))

(assert (=> b!709462 (= res!472991 (= (h!14418 lt!318203) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709463 () Bool)

(assert (=> b!709463 (= e!399264 (contains!3954 (t!19671 lt!318203) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97135 res!472990) b!709462))

(assert (= (and b!709462 (not res!472991)) b!709463))

(assert (=> d!97135 m!666697))

(declare-fun m!666777 () Bool)

(assert (=> d!97135 m!666777))

(declare-fun m!666779 () Bool)

(assert (=> b!709463 m!666779))

(assert (=> b!709284 d!97135))

(declare-fun d!97137 () Bool)

(assert (=> d!97137 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!709294 d!97137))

(declare-fun d!97139 () Bool)

(declare-fun res!472992 () Bool)

(declare-fun e!399266 () Bool)

(assert (=> d!97139 (=> res!472992 e!399266)))

(assert (=> d!97139 (= res!472992 ((_ is Nil!13374) acc!652))))

(assert (=> d!97139 (= (noDuplicate!1201 acc!652) e!399266)))

(declare-fun b!709464 () Bool)

(declare-fun e!399267 () Bool)

(assert (=> b!709464 (= e!399266 e!399267)))

(declare-fun res!472993 () Bool)

(assert (=> b!709464 (=> (not res!472993) (not e!399267))))

(assert (=> b!709464 (= res!472993 (not (contains!3954 (t!19671 acc!652) (h!14418 acc!652))))))

(declare-fun b!709465 () Bool)

(assert (=> b!709465 (= e!399267 (noDuplicate!1201 (t!19671 acc!652)))))

(assert (= (and d!97139 (not res!472992)) b!709464))

(assert (= (and b!709464 res!472993) b!709465))

(declare-fun m!666781 () Bool)

(assert (=> b!709464 m!666781))

(declare-fun m!666783 () Bool)

(assert (=> b!709465 m!666783))

(assert (=> b!709283 d!97139))

(declare-fun d!97141 () Bool)

(declare-fun lt!318227 () Bool)

(assert (=> d!97141 (= lt!318227 (select (content!343 newAcc!49) k0!2824))))

(declare-fun e!399279 () Bool)

(assert (=> d!97141 (= lt!318227 e!399279)))

(declare-fun res!473004 () Bool)

(assert (=> d!97141 (=> (not res!473004) (not e!399279))))

(assert (=> d!97141 (= res!473004 ((_ is Cons!13373) newAcc!49))))

(assert (=> d!97141 (= (contains!3954 newAcc!49 k0!2824) lt!318227)))

(declare-fun b!709472 () Bool)

(declare-fun e!399278 () Bool)

(assert (=> b!709472 (= e!399279 e!399278)))

(declare-fun res!473005 () Bool)

(assert (=> b!709472 (=> res!473005 e!399278)))

(assert (=> b!709472 (= res!473005 (= (h!14418 newAcc!49) k0!2824))))

(declare-fun b!709473 () Bool)

(assert (=> b!709473 (= e!399278 (contains!3954 (t!19671 newAcc!49) k0!2824))))

(assert (= (and d!97141 res!473004) b!709472))

(assert (= (and b!709472 (not res!473005)) b!709473))

(assert (=> d!97141 m!666743))

(declare-fun m!666785 () Bool)

(assert (=> d!97141 m!666785))

(declare-fun m!666787 () Bool)

(assert (=> b!709473 m!666787))

(assert (=> b!709293 d!97141))

(declare-fun b!709514 () Bool)

(declare-fun e!399311 () Bool)

(assert (=> b!709514 (= e!399311 (subseq!399 acc!652 (t!19671 newAcc!49)))))

(declare-fun b!709510 () Bool)

(declare-fun e!399313 () Bool)

(declare-fun e!399308 () Bool)

(assert (=> b!709510 (= e!399313 e!399308)))

(declare-fun res!473034 () Bool)

(assert (=> b!709510 (=> (not res!473034) (not e!399308))))

(assert (=> b!709510 (= res!473034 ((_ is Cons!13373) newAcc!49))))

(declare-fun b!709513 () Bool)

(declare-fun e!399309 () Bool)

(assert (=> b!709513 (= e!399309 (subseq!399 (t!19671 acc!652) (t!19671 newAcc!49)))))

(declare-fun d!97143 () Bool)

(declare-fun res!473031 () Bool)

(assert (=> d!97143 (=> res!473031 e!399313)))

(assert (=> d!97143 (= res!473031 ((_ is Nil!13374) acc!652))))

(assert (=> d!97143 (= (subseq!399 acc!652 newAcc!49) e!399313)))

(declare-fun b!709512 () Bool)

(assert (=> b!709512 (= e!399308 e!399311)))

(declare-fun res!473036 () Bool)

(assert (=> b!709512 (=> res!473036 e!399311)))

(assert (=> b!709512 (= res!473036 e!399309)))

(declare-fun res!473033 () Bool)

(assert (=> b!709512 (=> (not res!473033) (not e!399309))))

(assert (=> b!709512 (= res!473033 (= (h!14418 acc!652) (h!14418 newAcc!49)))))

(assert (= (and d!97143 (not res!473031)) b!709510))

(assert (= (and b!709510 res!473034) b!709512))

(assert (= (and b!709512 res!473033) b!709513))

(assert (= (and b!709512 (not res!473036)) b!709514))

(declare-fun m!666809 () Bool)

(assert (=> b!709514 m!666809))

(declare-fun m!666813 () Bool)

(assert (=> b!709513 m!666813))

(assert (=> b!709282 d!97143))

(declare-fun b!709555 () Bool)

(declare-fun e!399349 () List!13377)

(declare-fun call!34448 () List!13377)

(assert (=> b!709555 (= e!399349 (Cons!13373 (h!14418 newAcc!49) call!34448))))

(declare-fun d!97155 () Bool)

(declare-fun e!399350 () Bool)

(assert (=> d!97155 e!399350))

(declare-fun res!473065 () Bool)

(assert (=> d!97155 (=> (not res!473065) (not e!399350))))

(declare-fun lt!318236 () List!13377)

(declare-fun size!19733 (List!13377) Int)

(assert (=> d!97155 (= res!473065 (<= (size!19733 lt!318236) (size!19733 newAcc!49)))))

(declare-fun e!399351 () List!13377)

(assert (=> d!97155 (= lt!318236 e!399351)))

(declare-fun c!78612 () Bool)

(assert (=> d!97155 (= c!78612 ((_ is Cons!13373) newAcc!49))))

(assert (=> d!97155 (= (-!364 newAcc!49 k0!2824) lt!318236)))

(declare-fun b!709556 () Bool)

(assert (=> b!709556 (= e!399349 call!34448)))

(declare-fun b!709557 () Bool)

(assert (=> b!709557 (= e!399350 (= (content!343 lt!318236) ((_ map and) (content!343 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun b!709558 () Bool)

(assert (=> b!709558 (= e!399351 Nil!13374)))

(declare-fun bm!34445 () Bool)

(assert (=> bm!34445 (= call!34448 (-!364 (t!19671 newAcc!49) k0!2824))))

(declare-fun b!709559 () Bool)

(assert (=> b!709559 (= e!399351 e!399349)))

(declare-fun c!78613 () Bool)

(assert (=> b!709559 (= c!78613 (= k0!2824 (h!14418 newAcc!49)))))

(assert (= (and d!97155 c!78612) b!709559))

(assert (= (and d!97155 (not c!78612)) b!709558))

(assert (= (and b!709559 c!78613) b!709556))

(assert (= (and b!709559 (not c!78613)) b!709555))

(assert (= (or b!709556 b!709555) bm!34445))

(assert (= (and d!97155 res!473065) b!709557))

(declare-fun m!666843 () Bool)

(assert (=> d!97155 m!666843))

(declare-fun m!666845 () Bool)

(assert (=> d!97155 m!666845))

(declare-fun m!666847 () Bool)

(assert (=> b!709557 m!666847))

(assert (=> b!709557 m!666743))

(declare-fun m!666849 () Bool)

(assert (=> b!709557 m!666849))

(declare-fun m!666851 () Bool)

(assert (=> bm!34445 m!666851))

(assert (=> b!709292 d!97155))

(check-sat (not d!97095) (not d!97115) (not d!97135) (not b!709369) (not b!709399) (not b!709435) (not b!709372) (not b!709387) (not b!709433) (not b!709461) (not d!97119) (not d!97155) (not bm!34445) (not d!97133) (not b!709368) (not b!709397) (not b!709449) (not d!97131) (not d!97141) (not b!709370) (not b!709465) (not b!709447) (not b!709463) (not b!709473) (not b!709557) (not b!709373) (not b!709371) (not b!709455) (not b!709513) (not d!97101) (not b!709457) (not b!709514) (not d!97117) (not b!709464) (not b!709436) (not b!709459) (not bm!34437))
(check-sat)
