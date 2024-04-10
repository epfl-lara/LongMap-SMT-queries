; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7652 () Bool)

(assert start!7652)

(declare-fun res!28299 () Bool)

(declare-fun e!31294 () Bool)

(assert (=> start!7652 (=> (not res!28299) (not e!31294))))

(declare-datatypes ((B!978 0))(
  ( (B!979 (val!1109 Int)) )
))
(declare-datatypes ((tuple2!1800 0))(
  ( (tuple2!1801 (_1!911 (_ BitVec 64)) (_2!911 B!978)) )
))
(declare-datatypes ((List!1306 0))(
  ( (Nil!1303) (Cons!1302 (h!1882 tuple2!1800) (t!4334 List!1306)) )
))
(declare-fun l!1333 () List!1306)

(declare-fun isStrictlySorted!270 (List!1306) Bool)

(assert (=> start!7652 (= res!28299 (isStrictlySorted!270 l!1333))))

(assert (=> start!7652 e!31294))

(declare-fun e!31293 () Bool)

(assert (=> start!7652 e!31293))

(assert (=> start!7652 true))

(declare-fun tp_is_empty!2129 () Bool)

(assert (=> start!7652 tp_is_empty!2129))

(declare-fun b!48737 () Bool)

(declare-fun tp!6461 () Bool)

(assert (=> b!48737 (= e!31293 (and tp_is_empty!2129 tp!6461))))

(declare-fun b!48735 () Bool)

(declare-fun res!28300 () Bool)

(assert (=> b!48735 (=> (not res!28300) (not e!31294))))

(assert (=> b!48735 (= res!28300 (is-Nil!1303 l!1333))))

(declare-fun b!48734 () Bool)

(declare-fun res!28301 () Bool)

(assert (=> b!48734 (=> (not res!28301) (not e!31294))))

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun containsKey!119 (List!1306 (_ BitVec 64)) Bool)

(assert (=> b!48734 (= res!28301 (not (containsKey!119 l!1333 newKey!147)))))

(declare-fun b!48736 () Bool)

(declare-fun newValue!147 () B!978)

(declare-fun content!51 (List!1306) (Set tuple2!1800))

(declare-fun insertStrictlySorted!36 (List!1306 (_ BitVec 64) B!978) List!1306)

(assert (=> b!48736 (= e!31294 (not (= (union (content!51 l!1333) (insert (tuple2!1801 newKey!147 newValue!147) (as emptyset (Set tuple2!1800)))) (content!51 (insertStrictlySorted!36 l!1333 newKey!147 newValue!147)))))))

(assert (= (and start!7652 res!28299) b!48734))

(assert (= (and b!48734 res!28301) b!48735))

(assert (= (and b!48735 res!28300) b!48736))

(assert (= (and start!7652 (is-Cons!1302 l!1333)) b!48737))

(declare-fun m!42393 () Bool)

(assert (=> start!7652 m!42393))

(declare-fun m!42395 () Bool)

(assert (=> b!48734 m!42395))

(declare-fun m!42397 () Bool)

(assert (=> b!48736 m!42397))

(declare-fun m!42399 () Bool)

(assert (=> b!48736 m!42399))

(declare-fun m!42401 () Bool)

(assert (=> b!48736 m!42401))

(assert (=> b!48736 m!42401))

(declare-fun m!42403 () Bool)

(assert (=> b!48736 m!42403))

(push 1)

(assert (not b!48736))

(assert (not start!7652))

(assert tp_is_empty!2129)

(assert (not b!48737))

(assert (not b!48734))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9676 () Bool)

(declare-fun res!28306 () Bool)

(declare-fun e!31302 () Bool)

(assert (=> d!9676 (=> res!28306 e!31302)))

(assert (=> d!9676 (= res!28306 (or (is-Nil!1303 l!1333) (is-Nil!1303 (t!4334 l!1333))))))

(assert (=> d!9676 (= (isStrictlySorted!270 l!1333) e!31302)))

(declare-fun b!48748 () Bool)

(declare-fun e!31303 () Bool)

(assert (=> b!48748 (= e!31302 e!31303)))

(declare-fun res!28307 () Bool)

(assert (=> b!48748 (=> (not res!28307) (not e!31303))))

(assert (=> b!48748 (= res!28307 (bvslt (_1!911 (h!1882 l!1333)) (_1!911 (h!1882 (t!4334 l!1333)))))))

(declare-fun b!48749 () Bool)

(assert (=> b!48749 (= e!31303 (isStrictlySorted!270 (t!4334 l!1333)))))

(assert (= (and d!9676 (not res!28306)) b!48748))

(assert (= (and b!48748 res!28307) b!48749))

(declare-fun m!42407 () Bool)

(assert (=> b!48749 m!42407))

(assert (=> start!7652 d!9676))

(declare-fun d!9682 () Bool)

(declare-fun c!6535 () Bool)

(assert (=> d!9682 (= c!6535 (is-Nil!1303 l!1333))))

(declare-fun e!31313 () (Set tuple2!1800))

(assert (=> d!9682 (= (content!51 l!1333) e!31313)))

(declare-fun b!48762 () Bool)

(assert (=> b!48762 (= e!31313 (as emptyset (Set tuple2!1800)))))

(declare-fun b!48763 () Bool)

(assert (=> b!48763 (= e!31313 (union (insert (h!1882 l!1333) (as emptyset (Set tuple2!1800))) (content!51 (t!4334 l!1333))))))

(assert (= (and d!9682 c!6535) b!48762))

(assert (= (and d!9682 (not c!6535)) b!48763))

(declare-fun m!42417 () Bool)

(assert (=> b!48763 m!42417))

(declare-fun m!42419 () Bool)

(assert (=> b!48763 m!42419))

(assert (=> b!48736 d!9682))

(declare-fun c!6536 () Bool)

(declare-fun d!9689 () Bool)

(assert (=> d!9689 (= c!6536 (is-Nil!1303 (insertStrictlySorted!36 l!1333 newKey!147 newValue!147)))))

(declare-fun e!31314 () (Set tuple2!1800))

(assert (=> d!9689 (= (content!51 (insertStrictlySorted!36 l!1333 newKey!147 newValue!147)) e!31314)))

(declare-fun b!48764 () Bool)

(assert (=> b!48764 (= e!31314 (as emptyset (Set tuple2!1800)))))

(declare-fun b!48765 () Bool)

(assert (=> b!48765 (= e!31314 (union (insert (h!1882 (insertStrictlySorted!36 l!1333 newKey!147 newValue!147)) (as emptyset (Set tuple2!1800))) (content!51 (t!4334 (insertStrictlySorted!36 l!1333 newKey!147 newValue!147)))))))

(assert (= (and d!9689 c!6536) b!48764))

(assert (= (and d!9689 (not c!6536)) b!48765))

(declare-fun m!42421 () Bool)

(assert (=> b!48765 m!42421))

(declare-fun m!42423 () Bool)

(assert (=> b!48765 m!42423))

(assert (=> b!48736 d!9689))

(declare-fun b!48842 () Bool)

(declare-fun e!31359 () List!1306)

(assert (=> b!48842 (= e!31359 (insertStrictlySorted!36 (t!4334 l!1333) newKey!147 newValue!147))))

(declare-fun b!48843 () Bool)

(declare-fun e!31358 () List!1306)

(declare-fun call!3794 () List!1306)

(assert (=> b!48843 (= e!31358 call!3794)))

(declare-fun lt!20689 () List!1306)

(declare-fun b!48844 () Bool)

(declare-fun e!31357 () Bool)

(declare-fun contains!608 (List!1306 tuple2!1800) Bool)

(assert (=> b!48844 (= e!31357 (contains!608 lt!20689 (tuple2!1801 newKey!147 newValue!147)))))

(declare-fun d!9691 () Bool)

(assert (=> d!9691 e!31357))

(declare-fun res!28331 () Bool)

(assert (=> d!9691 (=> (not res!28331) (not e!31357))))

(assert (=> d!9691 (= res!28331 (isStrictlySorted!270 lt!20689))))

(declare-fun e!31360 () List!1306)

(assert (=> d!9691 (= lt!20689 e!31360)))

(declare-fun c!6567 () Bool)

(assert (=> d!9691 (= c!6567 (and (is-Cons!1302 l!1333) (bvslt (_1!911 (h!1882 l!1333)) newKey!147)))))

(assert (=> d!9691 (isStrictlySorted!270 l!1333)))

(assert (=> d!9691 (= (insertStrictlySorted!36 l!1333 newKey!147 newValue!147) lt!20689)))

(declare-fun b!48845 () Bool)

(declare-fun res!28330 () Bool)

(assert (=> b!48845 (=> (not res!28330) (not e!31357))))

(assert (=> b!48845 (= res!28330 (containsKey!119 lt!20689 newKey!147))))

(declare-fun bm!3789 () Bool)

(declare-fun call!3793 () List!1306)

(assert (=> bm!3789 (= call!3794 call!3793)))

(declare-fun b!48846 () Bool)

(assert (=> b!48846 (= e!31358 call!3794)))

(declare-fun b!48847 () Bool)

(declare-fun c!6568 () Bool)

(declare-fun c!6570 () Bool)

(assert (=> b!48847 (= e!31359 (ite c!6568 (t!4334 l!1333) (ite c!6570 (Cons!1302 (h!1882 l!1333) (t!4334 l!1333)) Nil!1303)))))

(declare-fun call!3792 () List!1306)

(declare-fun bm!3790 () Bool)

(declare-fun $colon$colon!55 (List!1306 tuple2!1800) List!1306)

(assert (=> bm!3790 (= call!3792 ($colon$colon!55 e!31359 (ite c!6567 (h!1882 l!1333) (tuple2!1801 newKey!147 newValue!147))))))

(declare-fun c!6569 () Bool)

(assert (=> bm!3790 (= c!6569 c!6567)))

(declare-fun b!48848 () Bool)

(assert (=> b!48848 (= c!6570 (and (is-Cons!1302 l!1333) (bvsgt (_1!911 (h!1882 l!1333)) newKey!147)))))

(declare-fun e!31356 () List!1306)

(assert (=> b!48848 (= e!31356 e!31358)))

(declare-fun b!48849 () Bool)

(assert (=> b!48849 (= e!31360 call!3792)))

(declare-fun b!48850 () Bool)

(assert (=> b!48850 (= e!31356 call!3793)))

(declare-fun bm!3791 () Bool)

(assert (=> bm!3791 (= call!3793 call!3792)))

(declare-fun b!48851 () Bool)

(assert (=> b!48851 (= e!31360 e!31356)))

(assert (=> b!48851 (= c!6568 (and (is-Cons!1302 l!1333) (= (_1!911 (h!1882 l!1333)) newKey!147)))))

(assert (= (and d!9691 c!6567) b!48849))

(assert (= (and d!9691 (not c!6567)) b!48851))

(assert (= (and b!48851 c!6568) b!48850))

(assert (= (and b!48851 (not c!6568)) b!48848))

(assert (= (and b!48848 c!6570) b!48843))

(assert (= (and b!48848 (not c!6570)) b!48846))

(assert (= (or b!48843 b!48846) bm!3789))

(assert (= (or b!48850 bm!3789) bm!3791))

(assert (= (or b!48849 bm!3791) bm!3790))

(assert (= (and bm!3790 c!6569) b!48842))

(assert (= (and bm!3790 (not c!6569)) b!48847))

(assert (= (and d!9691 res!28331) b!48845))

(assert (= (and b!48845 res!28330) b!48844))

(declare-fun m!42445 () Bool)

(assert (=> bm!3790 m!42445))

(declare-fun m!42447 () Bool)

(assert (=> d!9691 m!42447))

(assert (=> d!9691 m!42393))

(declare-fun m!42449 () Bool)

(assert (=> b!48845 m!42449))

(declare-fun m!42451 () Bool)

(assert (=> b!48844 m!42451))

(declare-fun m!42453 () Bool)

(assert (=> b!48842 m!42453))

(assert (=> b!48736 d!9691))

(declare-fun d!9701 () Bool)

(declare-fun res!28350 () Bool)

(declare-fun e!31379 () Bool)

(assert (=> d!9701 (=> res!28350 e!31379)))

(assert (=> d!9701 (= res!28350 (and (is-Cons!1302 l!1333) (= (_1!911 (h!1882 l!1333)) newKey!147)))))

(assert (=> d!9701 (= (containsKey!119 l!1333 newKey!147) e!31379)))

(declare-fun b!48874 () Bool)

(declare-fun e!31380 () Bool)

(assert (=> b!48874 (= e!31379 e!31380)))

(declare-fun res!28351 () Bool)

(assert (=> b!48874 (=> (not res!28351) (not e!31380))))

(assert (=> b!48874 (= res!28351 (and (or (not (is-Cons!1302 l!1333)) (bvsle (_1!911 (h!1882 l!1333)) newKey!147)) (is-Cons!1302 l!1333) (bvslt (_1!911 (h!1882 l!1333)) newKey!147)))))

(declare-fun b!48875 () Bool)

(assert (=> b!48875 (= e!31380 (containsKey!119 (t!4334 l!1333) newKey!147))))

(assert (= (and d!9701 (not res!28350)) b!48874))

(assert (= (and b!48874 res!28351) b!48875))

(declare-fun m!42457 () Bool)

(assert (=> b!48875 m!42457))

(assert (=> b!48734 d!9701))

(declare-fun b!48892 () Bool)

(declare-fun e!31390 () Bool)

(declare-fun tp!6464 () Bool)

(assert (=> b!48892 (= e!31390 (and tp_is_empty!2129 tp!6464))))

(assert (=> b!48737 (= tp!6461 e!31390)))

(assert (= (and b!48737 (is-Cons!1302 (t!4334 l!1333))) b!48892))

(push 1)

(assert (not bm!3790))

(assert (not b!48875))

(assert (not b!48749))

(assert (not b!48844))

(assert tp_is_empty!2129)

(assert (not d!9691))

(assert (not b!48892))

(assert (not b!48842))

(assert (not b!48845))

(assert (not b!48765))

(assert (not b!48763))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!48961 () Bool)

(declare-fun e!31444 () List!1306)

(assert (=> b!48961 (= e!31444 (insertStrictlySorted!36 (t!4334 (t!4334 l!1333)) newKey!147 newValue!147))))

(declare-fun b!48962 () Bool)

(declare-fun e!31443 () List!1306)

(declare-fun call!3808 () List!1306)

(assert (=> b!48962 (= e!31443 call!3808)))

(declare-fun e!31442 () Bool)

(declare-fun lt!20699 () List!1306)

(declare-fun b!48963 () Bool)

(assert (=> b!48963 (= e!31442 (contains!608 lt!20699 (tuple2!1801 newKey!147 newValue!147)))))

(declare-fun d!9741 () Bool)

(assert (=> d!9741 e!31442))

(declare-fun res!28389 () Bool)

(assert (=> d!9741 (=> (not res!28389) (not e!31442))))

(assert (=> d!9741 (= res!28389 (isStrictlySorted!270 lt!20699))))

(declare-fun e!31445 () List!1306)

(assert (=> d!9741 (= lt!20699 e!31445)))

(declare-fun c!6589 () Bool)

(assert (=> d!9741 (= c!6589 (and (is-Cons!1302 (t!4334 l!1333)) (bvslt (_1!911 (h!1882 (t!4334 l!1333))) newKey!147)))))

(assert (=> d!9741 (isStrictlySorted!270 (t!4334 l!1333))))

(assert (=> d!9741 (= (insertStrictlySorted!36 (t!4334 l!1333) newKey!147 newValue!147) lt!20699)))

(declare-fun b!48964 () Bool)

(declare-fun res!28388 () Bool)

(assert (=> b!48964 (=> (not res!28388) (not e!31442))))

(assert (=> b!48964 (= res!28388 (containsKey!119 lt!20699 newKey!147))))

(declare-fun bm!3803 () Bool)

(declare-fun call!3807 () List!1306)

(assert (=> bm!3803 (= call!3808 call!3807)))

