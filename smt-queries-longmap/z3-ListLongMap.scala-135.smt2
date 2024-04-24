; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2412 () Bool)

(assert start!2412)

(declare-fun b_free!487 () Bool)

(declare-fun b_next!487 () Bool)

(assert (=> start!2412 (= b_free!487 (not b_next!487))))

(declare-fun tp!2543 () Bool)

(declare-fun b_and!915 () Bool)

(assert (=> start!2412 (= tp!2543 b_and!915)))

(declare-fun res!11632 () Bool)

(declare-fun e!9310 () Bool)

(assert (=> start!2412 (=> (not res!11632) (not e!9310))))

(declare-datatypes ((B!608 0))(
  ( (B!609 (val!402 Int)) )
))
(declare-datatypes ((tuple2!600 0))(
  ( (tuple2!601 (_1!300 (_ BitVec 64)) (_2!300 B!608)) )
))
(declare-datatypes ((List!462 0))(
  ( (Nil!459) (Cons!458 (h!1024 tuple2!600) (t!2882 List!462)) )
))
(declare-datatypes ((ListLongMap!431 0))(
  ( (ListLongMap!432 (toList!231 List!462)) )
))
(declare-fun lm!238 () ListLongMap!431)

(declare-fun p!262 () Int)

(declare-fun forall!110 (List!462 Int) Bool)

(assert (=> start!2412 (= res!11632 (forall!110 (toList!231 lm!238) p!262))))

(assert (=> start!2412 e!9310))

(declare-fun e!9309 () Bool)

(declare-fun inv!784 (ListLongMap!431) Bool)

(assert (=> start!2412 (and (inv!784 lm!238) e!9309)))

(assert (=> start!2412 tp!2543))

(assert (=> start!2412 true))

(declare-fun b!15345 () Bool)

(declare-fun res!11633 () Bool)

(assert (=> b!15345 (=> (not res!11633) (not e!9310))))

(declare-datatypes ((List!463 0))(
  ( (Nil!460) (Cons!459 (h!1025 (_ BitVec 64)) (t!2883 List!463)) )
))
(declare-fun l!1612 () List!463)

(declare-fun isEmpty!123 (List!463) Bool)

(assert (=> b!15345 (= res!11633 (not (isEmpty!123 l!1612)))))

(declare-fun b!15346 () Bool)

(assert (=> b!15346 (= e!9310 (not (not (= l!1612 Nil!460))))))

(declare-fun lt!3720 () (_ BitVec 64))

(declare-fun -!12 (ListLongMap!431 (_ BitVec 64)) ListLongMap!431)

(assert (=> b!15346 (forall!110 (toList!231 (-!12 lm!238 lt!3720)) p!262)))

(declare-datatypes ((Unit!298 0))(
  ( (Unit!299) )
))
(declare-fun lt!3719 () Unit!298)

(declare-fun removeValidProp!5 (ListLongMap!431 Int (_ BitVec 64)) Unit!298)

(assert (=> b!15346 (= lt!3719 (removeValidProp!5 lm!238 p!262 lt!3720))))

(declare-fun head!801 (List!463) (_ BitVec 64))

(assert (=> b!15346 (= lt!3720 (head!801 l!1612))))

(declare-fun b!15347 () Bool)

(declare-fun tp!2542 () Bool)

(assert (=> b!15347 (= e!9309 tp!2542)))

(assert (= (and start!2412 res!11632) b!15345))

(assert (= (and b!15345 res!11633) b!15346))

(assert (= start!2412 b!15347))

(declare-fun m!10251 () Bool)

(assert (=> start!2412 m!10251))

(declare-fun m!10253 () Bool)

(assert (=> start!2412 m!10253))

(declare-fun m!10255 () Bool)

(assert (=> b!15345 m!10255))

(declare-fun m!10257 () Bool)

(assert (=> b!15346 m!10257))

(declare-fun m!10259 () Bool)

(assert (=> b!15346 m!10259))

(declare-fun m!10261 () Bool)

(assert (=> b!15346 m!10261))

(declare-fun m!10263 () Bool)

(assert (=> b!15346 m!10263))

(check-sat (not b_next!487) (not b!15346) (not start!2412) b_and!915 (not b!15347) (not b!15345))
(check-sat b_and!915 (not b_next!487))
(get-model)

(declare-fun d!2613 () Bool)

(declare-fun res!11650 () Bool)

(declare-fun e!9327 () Bool)

(assert (=> d!2613 (=> res!11650 e!9327)))

(get-info :version)

(assert (=> d!2613 (= res!11650 ((_ is Nil!459) (toList!231 lm!238)))))

(assert (=> d!2613 (= (forall!110 (toList!231 lm!238) p!262) e!9327)))

(declare-fun b!15370 () Bool)

(declare-fun e!9328 () Bool)

(assert (=> b!15370 (= e!9327 e!9328)))

(declare-fun res!11651 () Bool)

(assert (=> b!15370 (=> (not res!11651) (not e!9328))))

(declare-fun dynLambda!101 (Int tuple2!600) Bool)

(assert (=> b!15370 (= res!11651 (dynLambda!101 p!262 (h!1024 (toList!231 lm!238))))))

(declare-fun b!15371 () Bool)

(assert (=> b!15371 (= e!9328 (forall!110 (t!2882 (toList!231 lm!238)) p!262))))

(assert (= (and d!2613 (not res!11650)) b!15370))

(assert (= (and b!15370 res!11651) b!15371))

(declare-fun b_lambda!1007 () Bool)

(assert (=> (not b_lambda!1007) (not b!15370)))

(declare-fun t!2889 () Bool)

(declare-fun tb!411 () Bool)

(assert (=> (and start!2412 (= p!262 p!262) t!2889) tb!411))

(declare-fun result!729 () Bool)

(assert (=> tb!411 (= result!729 true)))

(assert (=> b!15370 t!2889))

(declare-fun b_and!921 () Bool)

(assert (= b_and!915 (and (=> t!2889 result!729) b_and!921)))

(declare-fun m!10293 () Bool)

(assert (=> b!15370 m!10293))

(declare-fun m!10295 () Bool)

(assert (=> b!15371 m!10295))

(assert (=> start!2412 d!2613))

(declare-fun d!2615 () Bool)

(declare-fun isStrictlySorted!133 (List!462) Bool)

(assert (=> d!2615 (= (inv!784 lm!238) (isStrictlySorted!133 (toList!231 lm!238)))))

(declare-fun bs!663 () Bool)

(assert (= bs!663 d!2615))

(declare-fun m!10297 () Bool)

(assert (=> bs!663 m!10297))

(assert (=> start!2412 d!2615))

(declare-fun d!2623 () Bool)

(declare-fun res!11652 () Bool)

(declare-fun e!9329 () Bool)

(assert (=> d!2623 (=> res!11652 e!9329)))

(assert (=> d!2623 (= res!11652 ((_ is Nil!459) (toList!231 (-!12 lm!238 lt!3720))))))

(assert (=> d!2623 (= (forall!110 (toList!231 (-!12 lm!238 lt!3720)) p!262) e!9329)))

(declare-fun b!15372 () Bool)

(declare-fun e!9330 () Bool)

(assert (=> b!15372 (= e!9329 e!9330)))

(declare-fun res!11653 () Bool)

(assert (=> b!15372 (=> (not res!11653) (not e!9330))))

(assert (=> b!15372 (= res!11653 (dynLambda!101 p!262 (h!1024 (toList!231 (-!12 lm!238 lt!3720)))))))

(declare-fun b!15373 () Bool)

(assert (=> b!15373 (= e!9330 (forall!110 (t!2882 (toList!231 (-!12 lm!238 lt!3720))) p!262))))

(assert (= (and d!2623 (not res!11652)) b!15372))

(assert (= (and b!15372 res!11653) b!15373))

(declare-fun b_lambda!1009 () Bool)

(assert (=> (not b_lambda!1009) (not b!15372)))

(declare-fun t!2891 () Bool)

(declare-fun tb!413 () Bool)

(assert (=> (and start!2412 (= p!262 p!262) t!2891) tb!413))

(declare-fun result!731 () Bool)

(assert (=> tb!413 (= result!731 true)))

(assert (=> b!15372 t!2891))

(declare-fun b_and!923 () Bool)

(assert (= b_and!921 (and (=> t!2891 result!731) b_and!923)))

(declare-fun m!10299 () Bool)

(assert (=> b!15372 m!10299))

(declare-fun m!10301 () Bool)

(assert (=> b!15373 m!10301))

(assert (=> b!15346 d!2623))

(declare-fun d!2625 () Bool)

(declare-fun lt!3735 () ListLongMap!431)

(declare-fun contains!193 (ListLongMap!431 (_ BitVec 64)) Bool)

(assert (=> d!2625 (not (contains!193 lt!3735 lt!3720))))

(declare-fun removeStrictlySorted!7 (List!462 (_ BitVec 64)) List!462)

(assert (=> d!2625 (= lt!3735 (ListLongMap!432 (removeStrictlySorted!7 (toList!231 lm!238) lt!3720)))))

(assert (=> d!2625 (= (-!12 lm!238 lt!3720) lt!3735)))

(declare-fun bs!664 () Bool)

(assert (= bs!664 d!2625))

(declare-fun m!10311 () Bool)

(assert (=> bs!664 m!10311))

(declare-fun m!10313 () Bool)

(assert (=> bs!664 m!10313))

(assert (=> b!15346 d!2625))

(declare-fun d!2631 () Bool)

(assert (=> d!2631 (forall!110 (toList!231 (-!12 lm!238 lt!3720)) p!262)))

(declare-fun lt!3742 () Unit!298)

(declare-fun choose!173 (ListLongMap!431 Int (_ BitVec 64)) Unit!298)

(assert (=> d!2631 (= lt!3742 (choose!173 lm!238 p!262 lt!3720))))

(assert (=> d!2631 (forall!110 (toList!231 lm!238) p!262)))

(assert (=> d!2631 (= (removeValidProp!5 lm!238 p!262 lt!3720) lt!3742)))

(declare-fun bs!665 () Bool)

(assert (= bs!665 d!2631))

(assert (=> bs!665 m!10257))

(assert (=> bs!665 m!10259))

(declare-fun m!10315 () Bool)

(assert (=> bs!665 m!10315))

(assert (=> bs!665 m!10251))

(assert (=> b!15346 d!2631))

(declare-fun d!2633 () Bool)

(assert (=> d!2633 (= (head!801 l!1612) (h!1025 l!1612))))

(assert (=> b!15346 d!2633))

(declare-fun d!2639 () Bool)

(assert (=> d!2639 (= (isEmpty!123 l!1612) ((_ is Nil!460) l!1612))))

(assert (=> b!15345 d!2639))

(declare-fun b!15390 () Bool)

(declare-fun e!9345 () Bool)

(declare-fun tp_is_empty!781 () Bool)

(declare-fun tp!2558 () Bool)

(assert (=> b!15390 (= e!9345 (and tp_is_empty!781 tp!2558))))

(assert (=> b!15347 (= tp!2542 e!9345)))

(assert (= (and b!15347 ((_ is Cons!458) (toList!231 lm!238))) b!15390))

(declare-fun b_lambda!1015 () Bool)

(assert (= b_lambda!1009 (or (and start!2412 b_free!487) b_lambda!1015)))

(declare-fun b_lambda!1017 () Bool)

(assert (= b_lambda!1007 (or (and start!2412 b_free!487) b_lambda!1017)))

(check-sat (not b!15390) (not b_next!487) b_and!923 (not d!2625) (not b_lambda!1015) (not b!15371) tp_is_empty!781 (not d!2615) (not b_lambda!1017) (not d!2631) (not b!15373))
(check-sat b_and!923 (not b_next!487))
