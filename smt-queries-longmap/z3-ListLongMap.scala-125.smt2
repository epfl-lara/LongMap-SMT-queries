; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2150 () Bool)

(assert start!2150)

(declare-fun b!14473 () Bool)

(assert (=> b!14473 true))

(declare-fun b!14469 () Bool)

(declare-fun e!8669 () Bool)

(declare-fun tp_is_empty!729 () Bool)

(declare-fun tp!2345 () Bool)

(assert (=> b!14469 (= e!8669 (and tp_is_empty!729 tp!2345))))

(declare-fun b!14470 () Bool)

(declare-fun e!8666 () Bool)

(declare-fun e!8668 () Bool)

(assert (=> b!14470 (= e!8666 e!8668)))

(declare-fun c!1352 () Bool)

(declare-datatypes ((B!550 0))(
  ( (B!551 (val!373 Int)) )
))
(declare-datatypes ((tuple2!546 0))(
  ( (tuple2!547 (_1!273 (_ BitVec 64)) (_2!273 B!550)) )
))
(declare-datatypes ((List!428 0))(
  ( (Nil!425) (Cons!424 (h!990 tuple2!546) (t!2827 List!428)) )
))
(declare-fun l!522 () List!428)

(declare-fun isEmpty!103 (List!428) Bool)

(assert (=> b!14470 (= c!1352 (isEmpty!103 l!522))))

(declare-fun b!14471 () Bool)

(declare-fun e!8665 () Bool)

(assert (=> b!14471 (= e!8668 e!8665)))

(declare-fun res!11179 () Bool)

(declare-fun call!422 () Bool)

(assert (=> b!14471 (= res!11179 (not call!422))))

(assert (=> b!14471 (=> (not res!11179) (not e!8665))))

(declare-fun b!14472 () Bool)

(declare-fun e!8667 () Bool)

(assert (=> b!14472 (= e!8667 e!8666)))

(declare-fun res!11181 () Bool)

(assert (=> b!14472 (=> res!11181 e!8666)))

(declare-fun lt!3612 () List!428)

(declare-fun isStrictlySorted!115 (List!428) Bool)

(assert (=> b!14472 (= res!11181 (not (isStrictlySorted!115 lt!3612)))))

(declare-fun value!159 () B!550)

(declare-fun filterByValue!17 (List!428 B!550) List!428)

(assert (=> b!14472 (= lt!3612 (filterByValue!17 (t!2827 l!522) value!159))))

(declare-fun bm!419 () Bool)

(assert (=> bm!419 (= call!422 (isEmpty!103 lt!3612))))

(declare-fun res!11178 () Bool)

(assert (=> start!2150 (=> (not res!11178) (not e!8667))))

(assert (=> start!2150 (= res!11178 (isStrictlySorted!115 l!522))))

(assert (=> start!2150 e!8667))

(assert (=> start!2150 e!8669))

(assert (=> start!2150 tp_is_empty!729))

(declare-fun res!11180 () Bool)

(assert (=> b!14473 (=> res!11180 e!8666)))

(declare-fun lambda!158 () Int)

(declare-fun forall!96 (List!428 Int) Bool)

(assert (=> b!14473 (= res!11180 (not (forall!96 lt!3612 lambda!158)))))

(declare-fun b!14474 () Bool)

(declare-fun head!792 (List!428) tuple2!546)

(assert (=> b!14474 (= e!8665 (bvslt (_1!273 (head!792 lt!3612)) (_1!273 (head!792 l!522))))))

(declare-fun b!14475 () Bool)

(declare-fun res!11182 () Bool)

(assert (=> b!14475 (=> (not res!11182) (not e!8667))))

(get-info :version)

(assert (=> b!14475 (= res!11182 (and (not (= (_2!273 (h!990 l!522)) value!159)) ((_ is Cons!424) l!522)))))

(declare-fun b!14476 () Bool)

(assert (=> b!14476 (= e!8668 (not call!422))))

(assert (= (and start!2150 res!11178) b!14475))

(assert (= (and b!14475 res!11182) b!14472))

(assert (= (and b!14472 (not res!11181)) b!14473))

(assert (= (and b!14473 (not res!11180)) b!14470))

(assert (= (and b!14470 c!1352) b!14476))

(assert (= (and b!14470 (not c!1352)) b!14471))

(assert (= (and b!14471 res!11179) b!14474))

(assert (= (or b!14476 b!14471) bm!419))

(assert (= (and start!2150 ((_ is Cons!424) l!522)) b!14469))

(declare-fun m!9657 () Bool)

(assert (=> b!14470 m!9657))

(declare-fun m!9659 () Bool)

(assert (=> b!14473 m!9659))

(declare-fun m!9661 () Bool)

(assert (=> b!14474 m!9661))

(declare-fun m!9663 () Bool)

(assert (=> b!14474 m!9663))

(declare-fun m!9665 () Bool)

(assert (=> b!14472 m!9665))

(declare-fun m!9667 () Bool)

(assert (=> b!14472 m!9667))

(declare-fun m!9669 () Bool)

(assert (=> start!2150 m!9669))

(declare-fun m!9671 () Bool)

(assert (=> bm!419 m!9671))

(check-sat (not start!2150) (not bm!419) tp_is_empty!729 (not b!14469) (not b!14472) (not b!14473) (not b!14470) (not b!14474))
(check-sat)
(get-model)

(declare-fun d!2261 () Bool)

(assert (=> d!2261 (= (isEmpty!103 lt!3612) ((_ is Nil!425) lt!3612))))

(assert (=> bm!419 d!2261))

(declare-fun d!2263 () Bool)

(declare-fun res!11202 () Bool)

(declare-fun e!8689 () Bool)

(assert (=> d!2263 (=> res!11202 e!8689)))

(assert (=> d!2263 (= res!11202 (or ((_ is Nil!425) l!522) ((_ is Nil!425) (t!2827 l!522))))))

(assert (=> d!2263 (= (isStrictlySorted!115 l!522) e!8689)))

(declare-fun b!14509 () Bool)

(declare-fun e!8690 () Bool)

(assert (=> b!14509 (= e!8689 e!8690)))

(declare-fun res!11203 () Bool)

(assert (=> b!14509 (=> (not res!11203) (not e!8690))))

(assert (=> b!14509 (= res!11203 (bvslt (_1!273 (h!990 l!522)) (_1!273 (h!990 (t!2827 l!522)))))))

(declare-fun b!14510 () Bool)

(assert (=> b!14510 (= e!8690 (isStrictlySorted!115 (t!2827 l!522)))))

(assert (= (and d!2263 (not res!11202)) b!14509))

(assert (= (and b!14509 res!11203) b!14510))

(declare-fun m!9689 () Bool)

(assert (=> b!14510 m!9689))

(assert (=> start!2150 d!2263))

(declare-fun d!2267 () Bool)

(assert (=> d!2267 (= (head!792 lt!3612) (h!990 lt!3612))))

(assert (=> b!14474 d!2267))

(declare-fun d!2269 () Bool)

(assert (=> d!2269 (= (head!792 l!522) (h!990 l!522))))

(assert (=> b!14474 d!2269))

(declare-fun d!2273 () Bool)

(assert (=> d!2273 (= (isEmpty!103 l!522) ((_ is Nil!425) l!522))))

(assert (=> b!14470 d!2273))

(declare-fun d!2275 () Bool)

(declare-fun res!11218 () Bool)

(declare-fun e!8705 () Bool)

(assert (=> d!2275 (=> res!11218 e!8705)))

(assert (=> d!2275 (= res!11218 ((_ is Nil!425) lt!3612))))

(assert (=> d!2275 (= (forall!96 lt!3612 lambda!158) e!8705)))

(declare-fun b!14525 () Bool)

(declare-fun e!8706 () Bool)

(assert (=> b!14525 (= e!8705 e!8706)))

(declare-fun res!11219 () Bool)

(assert (=> b!14525 (=> (not res!11219) (not e!8706))))

(declare-fun dynLambda!91 (Int tuple2!546) Bool)

(assert (=> b!14525 (= res!11219 (dynLambda!91 lambda!158 (h!990 lt!3612)))))

(declare-fun b!14526 () Bool)

(assert (=> b!14526 (= e!8706 (forall!96 (t!2827 lt!3612) lambda!158))))

(assert (= (and d!2275 (not res!11218)) b!14525))

(assert (= (and b!14525 res!11219) b!14526))

(declare-fun b_lambda!923 () Bool)

(assert (=> (not b_lambda!923) (not b!14525)))

(declare-fun m!9693 () Bool)

(assert (=> b!14525 m!9693))

(declare-fun m!9695 () Bool)

(assert (=> b!14526 m!9695))

(assert (=> b!14473 d!2275))

(declare-fun d!2281 () Bool)

(declare-fun res!11222 () Bool)

(declare-fun e!8709 () Bool)

(assert (=> d!2281 (=> res!11222 e!8709)))

(assert (=> d!2281 (= res!11222 (or ((_ is Nil!425) lt!3612) ((_ is Nil!425) (t!2827 lt!3612))))))

(assert (=> d!2281 (= (isStrictlySorted!115 lt!3612) e!8709)))

(declare-fun b!14529 () Bool)

(declare-fun e!8710 () Bool)

(assert (=> b!14529 (= e!8709 e!8710)))

(declare-fun res!11223 () Bool)

(assert (=> b!14529 (=> (not res!11223) (not e!8710))))

(assert (=> b!14529 (= res!11223 (bvslt (_1!273 (h!990 lt!3612)) (_1!273 (h!990 (t!2827 lt!3612)))))))

(declare-fun b!14530 () Bool)

(assert (=> b!14530 (= e!8710 (isStrictlySorted!115 (t!2827 lt!3612)))))

(assert (= (and d!2281 (not res!11222)) b!14529))

(assert (= (and b!14529 res!11223) b!14530))

(declare-fun m!9699 () Bool)

(assert (=> b!14530 m!9699))

(assert (=> b!14472 d!2281))

(declare-fun bs!580 () Bool)

(declare-fun b!14597 () Bool)

(assert (= bs!580 (and b!14597 b!14473)))

(declare-fun lambda!169 () Int)

(assert (=> bs!580 (= lambda!169 lambda!158)))

(assert (=> b!14597 true))

(declare-fun b!14594 () Bool)

(declare-fun e!8753 () List!428)

(declare-fun call!439 () List!428)

(assert (=> b!14594 (= e!8753 call!439)))

(declare-fun b!14595 () Bool)

(declare-fun e!8750 () Bool)

(declare-fun e!8751 () Bool)

(assert (=> b!14595 (= e!8750 e!8751)))

(declare-fun res!11252 () Bool)

(declare-fun call!438 () Bool)

(assert (=> b!14595 (= res!11252 call!438)))

(assert (=> b!14595 (=> res!11252 e!8751)))

(declare-fun b!14596 () Bool)

(declare-fun e!8754 () Bool)

(assert (=> b!14596 (= e!8754 e!8750)))

(declare-fun c!1376 () Bool)

(assert (=> b!14596 (= c!1376 (isEmpty!103 (t!2827 l!522)))))

(declare-fun res!11251 () Bool)

(assert (=> b!14597 (=> (not res!11251) (not e!8754))))

(declare-fun lt!3623 () List!428)

(assert (=> b!14597 (= res!11251 (forall!96 lt!3623 lambda!169))))

(declare-fun b!14598 () Bool)

(assert (=> b!14598 (= e!8753 Nil!425)))

(declare-fun b!14599 () Bool)

(declare-fun e!8752 () List!428)

(declare-fun $colon$colon!21 (List!428 tuple2!546) List!428)

(assert (=> b!14599 (= e!8752 ($colon$colon!21 call!439 (h!990 (t!2827 l!522))))))

(declare-fun bm!435 () Bool)

(assert (=> bm!435 (= call!439 (filterByValue!17 (t!2827 (t!2827 l!522)) value!159))))

(declare-fun d!2283 () Bool)

(assert (=> d!2283 e!8754))

(declare-fun res!11253 () Bool)

(assert (=> d!2283 (=> (not res!11253) (not e!8754))))

(assert (=> d!2283 (= res!11253 (isStrictlySorted!115 lt!3623))))

(assert (=> d!2283 (= lt!3623 e!8752)))

(declare-fun c!1375 () Bool)

(assert (=> d!2283 (= c!1375 (and ((_ is Cons!424) (t!2827 l!522)) (= (_2!273 (h!990 (t!2827 l!522))) value!159)))))

(assert (=> d!2283 (isStrictlySorted!115 (t!2827 l!522))))

(assert (=> d!2283 (= (filterByValue!17 (t!2827 l!522) value!159) lt!3623)))

(declare-fun b!14600 () Bool)

(assert (=> b!14600 (= e!8751 (bvsge (_1!273 (head!792 lt!3623)) (_1!273 (head!792 (t!2827 l!522)))))))

(declare-fun bm!436 () Bool)

(assert (=> bm!436 (= call!438 (isEmpty!103 lt!3623))))

(declare-fun b!14601 () Bool)

(assert (=> b!14601 (= e!8750 call!438)))

(declare-fun b!14602 () Bool)

(assert (=> b!14602 (= e!8752 e!8753)))

(declare-fun c!1377 () Bool)

(assert (=> b!14602 (= c!1377 (and ((_ is Cons!424) (t!2827 l!522)) (not (= (_2!273 (h!990 (t!2827 l!522))) value!159))))))

(assert (= (and d!2283 c!1375) b!14599))

(assert (= (and d!2283 (not c!1375)) b!14602))

(assert (= (and b!14602 c!1377) b!14594))

(assert (= (and b!14602 (not c!1377)) b!14598))

(assert (= (or b!14599 b!14594) bm!435))

(assert (= (and d!2283 res!11253) b!14597))

(assert (= (and b!14597 res!11251) b!14596))

(assert (= (and b!14596 c!1376) b!14601))

(assert (= (and b!14596 (not c!1376)) b!14595))

(assert (= (and b!14595 (not res!11252)) b!14600))

(assert (= (or b!14601 b!14595) bm!436))

(declare-fun m!9725 () Bool)

(assert (=> bm!436 m!9725))

(declare-fun m!9727 () Bool)

(assert (=> b!14600 m!9727))

(declare-fun m!9729 () Bool)

(assert (=> b!14600 m!9729))

(declare-fun m!9731 () Bool)

(assert (=> b!14599 m!9731))

(declare-fun m!9733 () Bool)

(assert (=> b!14597 m!9733))

(declare-fun m!9735 () Bool)

(assert (=> b!14596 m!9735))

(declare-fun m!9737 () Bool)

(assert (=> d!2283 m!9737))

(assert (=> d!2283 m!9689))

(declare-fun m!9739 () Bool)

(assert (=> bm!435 m!9739))

(assert (=> b!14472 d!2283))

(declare-fun b!14621 () Bool)

(declare-fun e!8767 () Bool)

(declare-fun tp!2351 () Bool)

(assert (=> b!14621 (= e!8767 (and tp_is_empty!729 tp!2351))))

(assert (=> b!14469 (= tp!2345 e!8767)))

(assert (= (and b!14469 ((_ is Cons!424) (t!2827 l!522))) b!14621))

(declare-fun b_lambda!929 () Bool)

(assert (= b_lambda!923 (or b!14473 b_lambda!929)))

(declare-fun bs!581 () Bool)

(declare-fun d!2303 () Bool)

(assert (= bs!581 (and d!2303 b!14473)))

(assert (=> bs!581 (= (dynLambda!91 lambda!158 (h!990 lt!3612)) (= (_2!273 (h!990 lt!3612)) value!159))))

(assert (=> b!14525 d!2303))

(check-sat (not b!14600) tp_is_empty!729 (not b!14596) (not b!14597) (not b_lambda!929) (not bm!436) (not b!14526) (not b!14599) (not d!2283) (not b!14621) (not bm!435) (not b!14530) (not b!14510))
(check-sat)
(get-model)

(declare-fun d!2315 () Bool)

(declare-fun res!11267 () Bool)

(declare-fun e!8781 () Bool)

(assert (=> d!2315 (=> res!11267 e!8781)))

(assert (=> d!2315 (= res!11267 (or ((_ is Nil!425) (t!2827 lt!3612)) ((_ is Nil!425) (t!2827 (t!2827 lt!3612)))))))

(assert (=> d!2315 (= (isStrictlySorted!115 (t!2827 lt!3612)) e!8781)))

(declare-fun b!14643 () Bool)

(declare-fun e!8782 () Bool)

(assert (=> b!14643 (= e!8781 e!8782)))

(declare-fun res!11268 () Bool)

(assert (=> b!14643 (=> (not res!11268) (not e!8782))))

(assert (=> b!14643 (= res!11268 (bvslt (_1!273 (h!990 (t!2827 lt!3612))) (_1!273 (h!990 (t!2827 (t!2827 lt!3612))))))))

(declare-fun b!14644 () Bool)

(assert (=> b!14644 (= e!8782 (isStrictlySorted!115 (t!2827 (t!2827 lt!3612))))))

(assert (= (and d!2315 (not res!11267)) b!14643))

(assert (= (and b!14643 res!11268) b!14644))

(declare-fun m!9761 () Bool)

(assert (=> b!14644 m!9761))

(assert (=> b!14530 d!2315))

(declare-fun d!2317 () Bool)

(assert (=> d!2317 (= (isEmpty!103 (t!2827 l!522)) ((_ is Nil!425) (t!2827 l!522)))))

(assert (=> b!14596 d!2317))

(declare-fun d!2319 () Bool)

(assert (=> d!2319 (= (head!792 lt!3623) (h!990 lt!3623))))

(assert (=> b!14600 d!2319))

(declare-fun d!2321 () Bool)

(assert (=> d!2321 (= (head!792 (t!2827 l!522)) (h!990 (t!2827 l!522)))))

(assert (=> b!14600 d!2321))

(declare-fun d!2323 () Bool)

(declare-fun res!11269 () Bool)

(declare-fun e!8783 () Bool)

(assert (=> d!2323 (=> res!11269 e!8783)))

(assert (=> d!2323 (= res!11269 (or ((_ is Nil!425) lt!3623) ((_ is Nil!425) (t!2827 lt!3623))))))

(assert (=> d!2323 (= (isStrictlySorted!115 lt!3623) e!8783)))

(declare-fun b!14645 () Bool)

(declare-fun e!8784 () Bool)

(assert (=> b!14645 (= e!8783 e!8784)))

(declare-fun res!11270 () Bool)

(assert (=> b!14645 (=> (not res!11270) (not e!8784))))

(assert (=> b!14645 (= res!11270 (bvslt (_1!273 (h!990 lt!3623)) (_1!273 (h!990 (t!2827 lt!3623)))))))

(declare-fun b!14646 () Bool)

(assert (=> b!14646 (= e!8784 (isStrictlySorted!115 (t!2827 lt!3623)))))

(assert (= (and d!2323 (not res!11269)) b!14645))

(assert (= (and b!14645 res!11270) b!14646))

(declare-fun m!9763 () Bool)

(assert (=> b!14646 m!9763))

(assert (=> d!2283 d!2323))

(declare-fun d!2325 () Bool)

(declare-fun res!11271 () Bool)

(declare-fun e!8785 () Bool)

(assert (=> d!2325 (=> res!11271 e!8785)))

(assert (=> d!2325 (= res!11271 (or ((_ is Nil!425) (t!2827 l!522)) ((_ is Nil!425) (t!2827 (t!2827 l!522)))))))

(assert (=> d!2325 (= (isStrictlySorted!115 (t!2827 l!522)) e!8785)))

(declare-fun b!14647 () Bool)

(declare-fun e!8786 () Bool)

(assert (=> b!14647 (= e!8785 e!8786)))

(declare-fun res!11272 () Bool)

(assert (=> b!14647 (=> (not res!11272) (not e!8786))))

(assert (=> b!14647 (= res!11272 (bvslt (_1!273 (h!990 (t!2827 l!522))) (_1!273 (h!990 (t!2827 (t!2827 l!522))))))))

(declare-fun b!14648 () Bool)

(assert (=> b!14648 (= e!8786 (isStrictlySorted!115 (t!2827 (t!2827 l!522))))))

(assert (= (and d!2325 (not res!11271)) b!14647))

(assert (= (and b!14647 res!11272) b!14648))

(declare-fun m!9765 () Bool)

(assert (=> b!14648 m!9765))

(assert (=> d!2283 d!2325))

(declare-fun d!2327 () Bool)

(declare-fun res!11273 () Bool)

(declare-fun e!8787 () Bool)

(assert (=> d!2327 (=> res!11273 e!8787)))

(assert (=> d!2327 (= res!11273 ((_ is Nil!425) (t!2827 lt!3612)))))

(assert (=> d!2327 (= (forall!96 (t!2827 lt!3612) lambda!158) e!8787)))

(declare-fun b!14649 () Bool)

(declare-fun e!8788 () Bool)

(assert (=> b!14649 (= e!8787 e!8788)))

(declare-fun res!11274 () Bool)

(assert (=> b!14649 (=> (not res!11274) (not e!8788))))

(assert (=> b!14649 (= res!11274 (dynLambda!91 lambda!158 (h!990 (t!2827 lt!3612))))))

(declare-fun b!14650 () Bool)

(assert (=> b!14650 (= e!8788 (forall!96 (t!2827 (t!2827 lt!3612)) lambda!158))))

(assert (= (and d!2327 (not res!11273)) b!14649))

(assert (= (and b!14649 res!11274) b!14650))

(declare-fun b_lambda!935 () Bool)

(assert (=> (not b_lambda!935) (not b!14649)))

(declare-fun m!9767 () Bool)

(assert (=> b!14649 m!9767))

(declare-fun m!9769 () Bool)

(assert (=> b!14650 m!9769))

(assert (=> b!14526 d!2327))

(declare-fun d!2329 () Bool)

(declare-fun res!11275 () Bool)

(declare-fun e!8789 () Bool)

(assert (=> d!2329 (=> res!11275 e!8789)))

(assert (=> d!2329 (= res!11275 ((_ is Nil!425) lt!3623))))

(assert (=> d!2329 (= (forall!96 lt!3623 lambda!169) e!8789)))

(declare-fun b!14651 () Bool)

(declare-fun e!8790 () Bool)

(assert (=> b!14651 (= e!8789 e!8790)))

(declare-fun res!11276 () Bool)

(assert (=> b!14651 (=> (not res!11276) (not e!8790))))

(assert (=> b!14651 (= res!11276 (dynLambda!91 lambda!169 (h!990 lt!3623)))))

(declare-fun b!14652 () Bool)

(assert (=> b!14652 (= e!8790 (forall!96 (t!2827 lt!3623) lambda!169))))

(assert (= (and d!2329 (not res!11275)) b!14651))

(assert (= (and b!14651 res!11276) b!14652))

(declare-fun b_lambda!937 () Bool)

(assert (=> (not b_lambda!937) (not b!14651)))

(declare-fun m!9771 () Bool)

(assert (=> b!14651 m!9771))

(declare-fun m!9773 () Bool)

(assert (=> b!14652 m!9773))

(assert (=> b!14597 d!2329))

(declare-fun d!2331 () Bool)

(assert (=> d!2331 (= (isEmpty!103 lt!3623) ((_ is Nil!425) lt!3623))))

(assert (=> bm!436 d!2331))

(declare-fun d!2333 () Bool)

(assert (=> d!2333 (= ($colon$colon!21 call!439 (h!990 (t!2827 l!522))) (Cons!424 (h!990 (t!2827 l!522)) call!439))))

(assert (=> b!14599 d!2333))

(declare-fun bs!585 () Bool)

(declare-fun b!14656 () Bool)

(assert (= bs!585 (and b!14656 b!14473)))

(declare-fun lambda!171 () Int)

(assert (=> bs!585 (= lambda!171 lambda!158)))

(declare-fun bs!586 () Bool)

(assert (= bs!586 (and b!14656 b!14597)))

(assert (=> bs!586 (= lambda!171 lambda!169)))

(assert (=> b!14656 true))

(declare-fun b!14653 () Bool)

(declare-fun e!8794 () List!428)

(declare-fun call!445 () List!428)

(assert (=> b!14653 (= e!8794 call!445)))

(declare-fun b!14654 () Bool)

(declare-fun e!8791 () Bool)

(declare-fun e!8792 () Bool)

(assert (=> b!14654 (= e!8791 e!8792)))

(declare-fun res!11278 () Bool)

(declare-fun call!444 () Bool)

(assert (=> b!14654 (= res!11278 call!444)))

(assert (=> b!14654 (=> res!11278 e!8792)))

(declare-fun b!14655 () Bool)

(declare-fun e!8795 () Bool)

(assert (=> b!14655 (= e!8795 e!8791)))

(declare-fun c!1384 () Bool)

(assert (=> b!14655 (= c!1384 (isEmpty!103 (t!2827 (t!2827 l!522))))))

(declare-fun res!11277 () Bool)

(assert (=> b!14656 (=> (not res!11277) (not e!8795))))

(declare-fun lt!3625 () List!428)

(assert (=> b!14656 (= res!11277 (forall!96 lt!3625 lambda!171))))

(declare-fun b!14657 () Bool)

(assert (=> b!14657 (= e!8794 Nil!425)))

(declare-fun b!14658 () Bool)

(declare-fun e!8793 () List!428)

(assert (=> b!14658 (= e!8793 ($colon$colon!21 call!445 (h!990 (t!2827 (t!2827 l!522)))))))

(declare-fun bm!441 () Bool)

(assert (=> bm!441 (= call!445 (filterByValue!17 (t!2827 (t!2827 (t!2827 l!522))) value!159))))

(declare-fun d!2335 () Bool)

(assert (=> d!2335 e!8795))

(declare-fun res!11279 () Bool)

(assert (=> d!2335 (=> (not res!11279) (not e!8795))))

(assert (=> d!2335 (= res!11279 (isStrictlySorted!115 lt!3625))))

(assert (=> d!2335 (= lt!3625 e!8793)))

(declare-fun c!1383 () Bool)

(assert (=> d!2335 (= c!1383 (and ((_ is Cons!424) (t!2827 (t!2827 l!522))) (= (_2!273 (h!990 (t!2827 (t!2827 l!522)))) value!159)))))

(assert (=> d!2335 (isStrictlySorted!115 (t!2827 (t!2827 l!522)))))

(assert (=> d!2335 (= (filterByValue!17 (t!2827 (t!2827 l!522)) value!159) lt!3625)))

(declare-fun b!14659 () Bool)

(assert (=> b!14659 (= e!8792 (bvsge (_1!273 (head!792 lt!3625)) (_1!273 (head!792 (t!2827 (t!2827 l!522))))))))

(declare-fun bm!442 () Bool)

(assert (=> bm!442 (= call!444 (isEmpty!103 lt!3625))))

(declare-fun b!14660 () Bool)

(assert (=> b!14660 (= e!8791 call!444)))

(declare-fun b!14661 () Bool)

(assert (=> b!14661 (= e!8793 e!8794)))

(declare-fun c!1385 () Bool)

(assert (=> b!14661 (= c!1385 (and ((_ is Cons!424) (t!2827 (t!2827 l!522))) (not (= (_2!273 (h!990 (t!2827 (t!2827 l!522)))) value!159))))))

(assert (= (and d!2335 c!1383) b!14658))

(assert (= (and d!2335 (not c!1383)) b!14661))

(assert (= (and b!14661 c!1385) b!14653))

(assert (= (and b!14661 (not c!1385)) b!14657))

(assert (= (or b!14658 b!14653) bm!441))

(assert (= (and d!2335 res!11279) b!14656))

(assert (= (and b!14656 res!11277) b!14655))

(assert (= (and b!14655 c!1384) b!14660))

(assert (= (and b!14655 (not c!1384)) b!14654))

(assert (= (and b!14654 (not res!11278)) b!14659))

(assert (= (or b!14660 b!14654) bm!442))

(declare-fun m!9775 () Bool)

(assert (=> bm!442 m!9775))

(declare-fun m!9777 () Bool)

(assert (=> b!14659 m!9777))

(declare-fun m!9779 () Bool)

(assert (=> b!14659 m!9779))

(declare-fun m!9781 () Bool)

(assert (=> b!14658 m!9781))

(declare-fun m!9783 () Bool)

(assert (=> b!14656 m!9783))

(declare-fun m!9785 () Bool)

(assert (=> b!14655 m!9785))

(declare-fun m!9787 () Bool)

(assert (=> d!2335 m!9787))

(assert (=> d!2335 m!9765))

(declare-fun m!9789 () Bool)

(assert (=> bm!441 m!9789))

(assert (=> bm!435 d!2335))

(assert (=> b!14510 d!2325))

(declare-fun b!14662 () Bool)

(declare-fun e!8796 () Bool)

(declare-fun tp!2358 () Bool)

(assert (=> b!14662 (= e!8796 (and tp_is_empty!729 tp!2358))))

(assert (=> b!14621 (= tp!2351 e!8796)))

(assert (= (and b!14621 ((_ is Cons!424) (t!2827 (t!2827 l!522)))) b!14662))

(declare-fun b_lambda!939 () Bool)

(assert (= b_lambda!935 (or b!14473 b_lambda!939)))

(declare-fun bs!587 () Bool)

(declare-fun d!2337 () Bool)

(assert (= bs!587 (and d!2337 b!14473)))

(assert (=> bs!587 (= (dynLambda!91 lambda!158 (h!990 (t!2827 lt!3612))) (= (_2!273 (h!990 (t!2827 lt!3612))) value!159))))

(assert (=> b!14649 d!2337))

(declare-fun b_lambda!941 () Bool)

(assert (= b_lambda!937 (or b!14597 b_lambda!941)))

(declare-fun bs!588 () Bool)

(declare-fun d!2339 () Bool)

(assert (= bs!588 (and d!2339 b!14597)))

(assert (=> bs!588 (= (dynLambda!91 lambda!169 (h!990 lt!3623)) (= (_2!273 (h!990 lt!3623)) value!159))))

(assert (=> b!14651 d!2339))

(check-sat (not b!14648) (not bm!442) (not b_lambda!941) (not b!14644) tp_is_empty!729 (not b!14662) (not d!2335) (not b!14659) (not b_lambda!929) (not b!14646) (not b!14655) (not b!14658) (not b!14650) (not bm!441) (not b_lambda!939) (not b!14656) (not b!14652))
(check-sat)
