; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138232 () Bool)

(assert start!138232)

(declare-datatypes ((B!2986 0))(
  ( (B!2987 (val!19855 Int)) )
))
(declare-fun newValue!21 () B!2986)

(declare-fun b!1585411 () Bool)

(declare-fun e!885156 () Bool)

(declare-fun newKey!21 () (_ BitVec 64))

(declare-datatypes ((tuple2!25878 0))(
  ( (tuple2!25879 (_1!12950 (_ BitVec 64)) (_2!12950 B!2986)) )
))
(declare-datatypes ((List!36975 0))(
  ( (Nil!36972) (Cons!36971 (h!38514 tuple2!25878) (t!51893 List!36975)) )
))
(declare-fun lt!677376 () List!36975)

(declare-fun contains!10533 (List!36975 tuple2!25878) Bool)

(assert (=> b!1585411 (= e!885156 (not (contains!10533 lt!677376 (tuple2!25879 newKey!21 newValue!21))))))

(declare-fun b!1585412 () Bool)

(declare-fun e!885155 () Bool)

(declare-fun tp_is_empty!39519 () Bool)

(declare-fun tp!115263 () Bool)

(assert (=> b!1585412 (= e!885155 (and tp_is_empty!39519 tp!115263))))

(declare-fun res!1082773 () Bool)

(declare-fun e!885154 () Bool)

(assert (=> start!138232 (=> (not res!1082773) (not e!885154))))

(declare-fun l!556 () List!36975)

(declare-fun isStrictlySorted!1197 (List!36975) Bool)

(assert (=> start!138232 (= res!1082773 (isStrictlySorted!1197 l!556))))

(assert (=> start!138232 e!885154))

(assert (=> start!138232 e!885155))

(assert (=> start!138232 true))

(assert (=> start!138232 tp_is_empty!39519))

(declare-fun b!1585413 () Bool)

(assert (=> b!1585413 (= e!885154 e!885156)))

(declare-fun res!1082771 () Bool)

(assert (=> b!1585413 (=> res!1082771 e!885156)))

(assert (=> b!1585413 (= res!1082771 (not (isStrictlySorted!1197 lt!677376)))))

(declare-fun $colon$colon!1041 (List!36975 tuple2!25878) List!36975)

(declare-fun insertStrictlySorted!636 (List!36975 (_ BitVec 64) B!2986) List!36975)

(assert (=> b!1585413 (= lt!677376 ($colon$colon!1041 (insertStrictlySorted!636 (t!51893 l!556) newKey!21 newValue!21) (h!38514 l!556)))))

(declare-fun b!1585414 () Bool)

(declare-fun res!1082774 () Bool)

(assert (=> b!1585414 (=> res!1082774 e!885156)))

(declare-fun containsKey!1010 (List!36975 (_ BitVec 64)) Bool)

(assert (=> b!1585414 (= res!1082774 (not (containsKey!1010 lt!677376 newKey!21)))))

(declare-fun b!1585415 () Bool)

(declare-fun res!1082772 () Bool)

(assert (=> b!1585415 (=> (not res!1082772) (not e!885154))))

(get-info :version)

(assert (=> b!1585415 (= res!1082772 (and ((_ is Cons!36971) l!556) (bvslt (_1!12950 (h!38514 l!556)) newKey!21)))))

(assert (= (and start!138232 res!1082773) b!1585415))

(assert (= (and b!1585415 res!1082772) b!1585413))

(assert (= (and b!1585413 (not res!1082771)) b!1585414))

(assert (= (and b!1585414 (not res!1082774)) b!1585411))

(assert (= (and start!138232 ((_ is Cons!36971) l!556)) b!1585412))

(declare-fun m!1454241 () Bool)

(assert (=> b!1585411 m!1454241))

(declare-fun m!1454243 () Bool)

(assert (=> start!138232 m!1454243))

(declare-fun m!1454245 () Bool)

(assert (=> b!1585413 m!1454245))

(declare-fun m!1454247 () Bool)

(assert (=> b!1585413 m!1454247))

(assert (=> b!1585413 m!1454247))

(declare-fun m!1454249 () Bool)

(assert (=> b!1585413 m!1454249))

(declare-fun m!1454251 () Bool)

(assert (=> b!1585414 m!1454251))

(check-sat (not start!138232) (not b!1585414) (not b!1585413) (not b!1585411) (not b!1585412) tp_is_empty!39519)
(check-sat)
(get-model)

(declare-fun d!167671 () Bool)

(declare-fun res!1082791 () Bool)

(declare-fun e!885170 () Bool)

(assert (=> d!167671 (=> res!1082791 e!885170)))

(assert (=> d!167671 (= res!1082791 (and ((_ is Cons!36971) lt!677376) (= (_1!12950 (h!38514 lt!677376)) newKey!21)))))

(assert (=> d!167671 (= (containsKey!1010 lt!677376 newKey!21) e!885170)))

(declare-fun b!1585435 () Bool)

(declare-fun e!885171 () Bool)

(assert (=> b!1585435 (= e!885170 e!885171)))

(declare-fun res!1082792 () Bool)

(assert (=> b!1585435 (=> (not res!1082792) (not e!885171))))

(assert (=> b!1585435 (= res!1082792 (and (or (not ((_ is Cons!36971) lt!677376)) (bvsle (_1!12950 (h!38514 lt!677376)) newKey!21)) ((_ is Cons!36971) lt!677376) (bvslt (_1!12950 (h!38514 lt!677376)) newKey!21)))))

(declare-fun b!1585436 () Bool)

(assert (=> b!1585436 (= e!885171 (containsKey!1010 (t!51893 lt!677376) newKey!21))))

(assert (= (and d!167671 (not res!1082791)) b!1585435))

(assert (= (and b!1585435 res!1082792) b!1585436))

(declare-fun m!1454265 () Bool)

(assert (=> b!1585436 m!1454265))

(assert (=> b!1585414 d!167671))

(declare-fun d!167673 () Bool)

(declare-fun res!1082799 () Bool)

(declare-fun e!885178 () Bool)

(assert (=> d!167673 (=> res!1082799 e!885178)))

(assert (=> d!167673 (= res!1082799 (or ((_ is Nil!36972) l!556) ((_ is Nil!36972) (t!51893 l!556))))))

(assert (=> d!167673 (= (isStrictlySorted!1197 l!556) e!885178)))

(declare-fun b!1585441 () Bool)

(declare-fun e!885179 () Bool)

(assert (=> b!1585441 (= e!885178 e!885179)))

(declare-fun res!1082800 () Bool)

(assert (=> b!1585441 (=> (not res!1082800) (not e!885179))))

(assert (=> b!1585441 (= res!1082800 (bvslt (_1!12950 (h!38514 l!556)) (_1!12950 (h!38514 (t!51893 l!556)))))))

(declare-fun b!1585442 () Bool)

(assert (=> b!1585442 (= e!885179 (isStrictlySorted!1197 (t!51893 l!556)))))

(assert (= (and d!167673 (not res!1082799)) b!1585441))

(assert (= (and b!1585441 res!1082800) b!1585442))

(declare-fun m!1454267 () Bool)

(assert (=> b!1585442 m!1454267))

(assert (=> start!138232 d!167673))

(declare-fun d!167677 () Bool)

(declare-fun lt!677384 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!864 (List!36975) (InoxSet tuple2!25878))

(assert (=> d!167677 (= lt!677384 (select (content!864 lt!677376) (tuple2!25879 newKey!21 newValue!21)))))

(declare-fun e!885188 () Bool)

(assert (=> d!167677 (= lt!677384 e!885188)))

(declare-fun res!1082809 () Bool)

(assert (=> d!167677 (=> (not res!1082809) (not e!885188))))

(assert (=> d!167677 (= res!1082809 ((_ is Cons!36971) lt!677376))))

(assert (=> d!167677 (= (contains!10533 lt!677376 (tuple2!25879 newKey!21 newValue!21)) lt!677384)))

(declare-fun b!1585453 () Bool)

(declare-fun e!885191 () Bool)

(assert (=> b!1585453 (= e!885188 e!885191)))

(declare-fun res!1082811 () Bool)

(assert (=> b!1585453 (=> res!1082811 e!885191)))

(assert (=> b!1585453 (= res!1082811 (= (h!38514 lt!677376) (tuple2!25879 newKey!21 newValue!21)))))

(declare-fun b!1585454 () Bool)

(assert (=> b!1585454 (= e!885191 (contains!10533 (t!51893 lt!677376) (tuple2!25879 newKey!21 newValue!21)))))

(assert (= (and d!167677 res!1082809) b!1585453))

(assert (= (and b!1585453 (not res!1082811)) b!1585454))

(declare-fun m!1454271 () Bool)

(assert (=> d!167677 m!1454271))

(declare-fun m!1454273 () Bool)

(assert (=> d!167677 m!1454273))

(declare-fun m!1454275 () Bool)

(assert (=> b!1585454 m!1454275))

(assert (=> b!1585411 d!167677))

(declare-fun d!167683 () Bool)

(declare-fun res!1082817 () Bool)

(declare-fun e!885196 () Bool)

(assert (=> d!167683 (=> res!1082817 e!885196)))

(assert (=> d!167683 (= res!1082817 (or ((_ is Nil!36972) lt!677376) ((_ is Nil!36972) (t!51893 lt!677376))))))

(assert (=> d!167683 (= (isStrictlySorted!1197 lt!677376) e!885196)))

(declare-fun b!1585461 () Bool)

(declare-fun e!885197 () Bool)

(assert (=> b!1585461 (= e!885196 e!885197)))

(declare-fun res!1082818 () Bool)

(assert (=> b!1585461 (=> (not res!1082818) (not e!885197))))

(assert (=> b!1585461 (= res!1082818 (bvslt (_1!12950 (h!38514 lt!677376)) (_1!12950 (h!38514 (t!51893 lt!677376)))))))

(declare-fun b!1585462 () Bool)

(assert (=> b!1585462 (= e!885197 (isStrictlySorted!1197 (t!51893 lt!677376)))))

(assert (= (and d!167683 (not res!1082817)) b!1585461))

(assert (= (and b!1585461 res!1082818) b!1585462))

(declare-fun m!1454277 () Bool)

(assert (=> b!1585462 m!1454277))

(assert (=> b!1585413 d!167683))

(declare-fun d!167685 () Bool)

(assert (=> d!167685 (= ($colon$colon!1041 (insertStrictlySorted!636 (t!51893 l!556) newKey!21 newValue!21) (h!38514 l!556)) (Cons!36971 (h!38514 l!556) (insertStrictlySorted!636 (t!51893 l!556) newKey!21 newValue!21)))))

(assert (=> b!1585413 d!167685))

(declare-fun bm!72633 () Bool)

(declare-fun call!72637 () List!36975)

(declare-fun call!72638 () List!36975)

(assert (=> bm!72633 (= call!72637 call!72638)))

(declare-fun c!147004 () Bool)

(declare-fun e!885243 () List!36975)

(declare-fun b!1585533 () Bool)

(declare-fun c!147003 () Bool)

(assert (=> b!1585533 (= e!885243 (ite c!147004 (t!51893 (t!51893 l!556)) (ite c!147003 (Cons!36971 (h!38514 (t!51893 l!556)) (t!51893 (t!51893 l!556))) Nil!36972)))))

(declare-fun bm!72634 () Bool)

(declare-fun call!72636 () List!36975)

(assert (=> bm!72634 (= call!72636 call!72637)))

(declare-fun b!1585534 () Bool)

(assert (=> b!1585534 (= e!885243 (insertStrictlySorted!636 (t!51893 (t!51893 l!556)) newKey!21 newValue!21))))

(declare-fun d!167687 () Bool)

(declare-fun e!885240 () Bool)

(assert (=> d!167687 e!885240))

(declare-fun res!1082842 () Bool)

(assert (=> d!167687 (=> (not res!1082842) (not e!885240))))

(declare-fun lt!677392 () List!36975)

(assert (=> d!167687 (= res!1082842 (isStrictlySorted!1197 lt!677392))))

(declare-fun e!885241 () List!36975)

(assert (=> d!167687 (= lt!677392 e!885241)))

(declare-fun c!147001 () Bool)

(assert (=> d!167687 (= c!147001 (and ((_ is Cons!36971) (t!51893 l!556)) (bvslt (_1!12950 (h!38514 (t!51893 l!556))) newKey!21)))))

(assert (=> d!167687 (isStrictlySorted!1197 (t!51893 l!556))))

(assert (=> d!167687 (= (insertStrictlySorted!636 (t!51893 l!556) newKey!21 newValue!21) lt!677392)))

(declare-fun b!1585535 () Bool)

(declare-fun e!885242 () List!36975)

(assert (=> b!1585535 (= e!885241 e!885242)))

(assert (=> b!1585535 (= c!147004 (and ((_ is Cons!36971) (t!51893 l!556)) (= (_1!12950 (h!38514 (t!51893 l!556))) newKey!21)))))

(declare-fun bm!72635 () Bool)

(assert (=> bm!72635 (= call!72638 ($colon$colon!1041 e!885243 (ite c!147001 (h!38514 (t!51893 l!556)) (tuple2!25879 newKey!21 newValue!21))))))

(declare-fun c!147002 () Bool)

(assert (=> bm!72635 (= c!147002 c!147001)))

(declare-fun b!1585536 () Bool)

(declare-fun e!885244 () List!36975)

(assert (=> b!1585536 (= e!885244 call!72636)))

(declare-fun b!1585537 () Bool)

(assert (=> b!1585537 (= e!885244 call!72636)))

(declare-fun b!1585538 () Bool)

(assert (=> b!1585538 (= e!885242 call!72637)))

(declare-fun b!1585539 () Bool)

(assert (=> b!1585539 (= e!885240 (contains!10533 lt!677392 (tuple2!25879 newKey!21 newValue!21)))))

(declare-fun b!1585540 () Bool)

(assert (=> b!1585540 (= c!147003 (and ((_ is Cons!36971) (t!51893 l!556)) (bvsgt (_1!12950 (h!38514 (t!51893 l!556))) newKey!21)))))

(assert (=> b!1585540 (= e!885242 e!885244)))

(declare-fun b!1585541 () Bool)

(assert (=> b!1585541 (= e!885241 call!72638)))

(declare-fun b!1585542 () Bool)

(declare-fun res!1082841 () Bool)

(assert (=> b!1585542 (=> (not res!1082841) (not e!885240))))

(assert (=> b!1585542 (= res!1082841 (containsKey!1010 lt!677392 newKey!21))))

(assert (= (and d!167687 c!147001) b!1585541))

(assert (= (and d!167687 (not c!147001)) b!1585535))

(assert (= (and b!1585535 c!147004) b!1585538))

(assert (= (and b!1585535 (not c!147004)) b!1585540))

(assert (= (and b!1585540 c!147003) b!1585536))

(assert (= (and b!1585540 (not c!147003)) b!1585537))

(assert (= (or b!1585536 b!1585537) bm!72634))

(assert (= (or b!1585538 bm!72634) bm!72633))

(assert (= (or b!1585541 bm!72633) bm!72635))

(assert (= (and bm!72635 c!147002) b!1585534))

(assert (= (and bm!72635 (not c!147002)) b!1585533))

(assert (= (and d!167687 res!1082842) b!1585542))

(assert (= (and b!1585542 res!1082841) b!1585539))

(declare-fun m!1454291 () Bool)

(assert (=> d!167687 m!1454291))

(assert (=> d!167687 m!1454267))

(declare-fun m!1454293 () Bool)

(assert (=> b!1585542 m!1454293))

(declare-fun m!1454295 () Bool)

(assert (=> b!1585534 m!1454295))

(declare-fun m!1454297 () Bool)

(assert (=> bm!72635 m!1454297))

(declare-fun m!1454299 () Bool)

(assert (=> b!1585539 m!1454299))

(assert (=> b!1585413 d!167687))

(declare-fun b!1585561 () Bool)

(declare-fun e!885254 () Bool)

(declare-fun tp!115269 () Bool)

(assert (=> b!1585561 (= e!885254 (and tp_is_empty!39519 tp!115269))))

(assert (=> b!1585412 (= tp!115263 e!885254)))

(assert (= (and b!1585412 ((_ is Cons!36971) (t!51893 l!556))) b!1585561))

(check-sat (not b!1585436) (not b!1585454) (not bm!72635) (not b!1585539) (not d!167677) (not b!1585462) (not b!1585534) (not b!1585442) (not d!167687) (not b!1585561) (not b!1585542) tp_is_empty!39519)
(check-sat)
(get-model)

(declare-fun bm!72642 () Bool)

(declare-fun call!72646 () List!36975)

(declare-fun call!72647 () List!36975)

(assert (=> bm!72642 (= call!72646 call!72647)))

(declare-fun c!147015 () Bool)

(declare-fun e!885283 () List!36975)

(declare-fun c!147016 () Bool)

(declare-fun b!1585596 () Bool)

(assert (=> b!1585596 (= e!885283 (ite c!147016 (t!51893 (t!51893 (t!51893 l!556))) (ite c!147015 (Cons!36971 (h!38514 (t!51893 (t!51893 l!556))) (t!51893 (t!51893 (t!51893 l!556)))) Nil!36972)))))

(declare-fun bm!72643 () Bool)

(declare-fun call!72645 () List!36975)

(assert (=> bm!72643 (= call!72645 call!72646)))

(declare-fun b!1585597 () Bool)

(assert (=> b!1585597 (= e!885283 (insertStrictlySorted!636 (t!51893 (t!51893 (t!51893 l!556))) newKey!21 newValue!21))))

(declare-fun d!167707 () Bool)

(declare-fun e!885280 () Bool)

(assert (=> d!167707 e!885280))

(declare-fun res!1082866 () Bool)

(assert (=> d!167707 (=> (not res!1082866) (not e!885280))))

(declare-fun lt!677398 () List!36975)

(assert (=> d!167707 (= res!1082866 (isStrictlySorted!1197 lt!677398))))

(declare-fun e!885281 () List!36975)

(assert (=> d!167707 (= lt!677398 e!885281)))

(declare-fun c!147013 () Bool)

(assert (=> d!167707 (= c!147013 (and ((_ is Cons!36971) (t!51893 (t!51893 l!556))) (bvslt (_1!12950 (h!38514 (t!51893 (t!51893 l!556)))) newKey!21)))))

(assert (=> d!167707 (isStrictlySorted!1197 (t!51893 (t!51893 l!556)))))

(assert (=> d!167707 (= (insertStrictlySorted!636 (t!51893 (t!51893 l!556)) newKey!21 newValue!21) lt!677398)))

(declare-fun b!1585598 () Bool)

(declare-fun e!885282 () List!36975)

(assert (=> b!1585598 (= e!885281 e!885282)))

(assert (=> b!1585598 (= c!147016 (and ((_ is Cons!36971) (t!51893 (t!51893 l!556))) (= (_1!12950 (h!38514 (t!51893 (t!51893 l!556)))) newKey!21)))))

(declare-fun bm!72644 () Bool)

(assert (=> bm!72644 (= call!72647 ($colon$colon!1041 e!885283 (ite c!147013 (h!38514 (t!51893 (t!51893 l!556))) (tuple2!25879 newKey!21 newValue!21))))))

(declare-fun c!147014 () Bool)

(assert (=> bm!72644 (= c!147014 c!147013)))

(declare-fun b!1585599 () Bool)

(declare-fun e!885284 () List!36975)

(assert (=> b!1585599 (= e!885284 call!72645)))

(declare-fun b!1585600 () Bool)

(assert (=> b!1585600 (= e!885284 call!72645)))

(declare-fun b!1585601 () Bool)

(assert (=> b!1585601 (= e!885282 call!72646)))

(declare-fun b!1585602 () Bool)

(assert (=> b!1585602 (= e!885280 (contains!10533 lt!677398 (tuple2!25879 newKey!21 newValue!21)))))

(declare-fun b!1585603 () Bool)

(assert (=> b!1585603 (= c!147015 (and ((_ is Cons!36971) (t!51893 (t!51893 l!556))) (bvsgt (_1!12950 (h!38514 (t!51893 (t!51893 l!556)))) newKey!21)))))

(assert (=> b!1585603 (= e!885282 e!885284)))

(declare-fun b!1585604 () Bool)

(assert (=> b!1585604 (= e!885281 call!72647)))

(declare-fun b!1585605 () Bool)

(declare-fun res!1082865 () Bool)

(assert (=> b!1585605 (=> (not res!1082865) (not e!885280))))

(assert (=> b!1585605 (= res!1082865 (containsKey!1010 lt!677398 newKey!21))))

(assert (= (and d!167707 c!147013) b!1585604))

(assert (= (and d!167707 (not c!147013)) b!1585598))

(assert (= (and b!1585598 c!147016) b!1585601))

(assert (= (and b!1585598 (not c!147016)) b!1585603))

(assert (= (and b!1585603 c!147015) b!1585599))

(assert (= (and b!1585603 (not c!147015)) b!1585600))

(assert (= (or b!1585599 b!1585600) bm!72643))

(assert (= (or b!1585601 bm!72643) bm!72642))

(assert (= (or b!1585604 bm!72642) bm!72644))

(assert (= (and bm!72644 c!147014) b!1585597))

(assert (= (and bm!72644 (not c!147014)) b!1585596))

(assert (= (and d!167707 res!1082866) b!1585605))

(assert (= (and b!1585605 res!1082865) b!1585602))

(declare-fun m!1454331 () Bool)

(assert (=> d!167707 m!1454331))

(declare-fun m!1454333 () Bool)

(assert (=> d!167707 m!1454333))

(declare-fun m!1454335 () Bool)

(assert (=> b!1585605 m!1454335))

(declare-fun m!1454337 () Bool)

(assert (=> b!1585597 m!1454337))

(declare-fun m!1454339 () Bool)

(assert (=> bm!72644 m!1454339))

(declare-fun m!1454341 () Bool)

(assert (=> b!1585602 m!1454341))

(assert (=> b!1585534 d!167707))

(declare-fun d!167709 () Bool)

(declare-fun c!147019 () Bool)

(assert (=> d!167709 (= c!147019 ((_ is Nil!36972) lt!677376))))

(declare-fun e!885287 () (InoxSet tuple2!25878))

(assert (=> d!167709 (= (content!864 lt!677376) e!885287)))

(declare-fun b!1585610 () Bool)

(assert (=> b!1585610 (= e!885287 ((as const (Array tuple2!25878 Bool)) false))))

(declare-fun b!1585611 () Bool)

(assert (=> b!1585611 (= e!885287 ((_ map or) (store ((as const (Array tuple2!25878 Bool)) false) (h!38514 lt!677376) true) (content!864 (t!51893 lt!677376))))))

(assert (= (and d!167709 c!147019) b!1585610))

(assert (= (and d!167709 (not c!147019)) b!1585611))

(declare-fun m!1454343 () Bool)

(assert (=> b!1585611 m!1454343))

(declare-fun m!1454345 () Bool)

(assert (=> b!1585611 m!1454345))

(assert (=> d!167677 d!167709))

(declare-fun d!167711 () Bool)

(declare-fun res!1082867 () Bool)

(declare-fun e!885288 () Bool)

(assert (=> d!167711 (=> res!1082867 e!885288)))

(assert (=> d!167711 (= res!1082867 (or ((_ is Nil!36972) lt!677392) ((_ is Nil!36972) (t!51893 lt!677392))))))

(assert (=> d!167711 (= (isStrictlySorted!1197 lt!677392) e!885288)))

(declare-fun b!1585612 () Bool)

(declare-fun e!885289 () Bool)

(assert (=> b!1585612 (= e!885288 e!885289)))

(declare-fun res!1082868 () Bool)

(assert (=> b!1585612 (=> (not res!1082868) (not e!885289))))

(assert (=> b!1585612 (= res!1082868 (bvslt (_1!12950 (h!38514 lt!677392)) (_1!12950 (h!38514 (t!51893 lt!677392)))))))

(declare-fun b!1585613 () Bool)

(assert (=> b!1585613 (= e!885289 (isStrictlySorted!1197 (t!51893 lt!677392)))))

(assert (= (and d!167711 (not res!1082867)) b!1585612))

(assert (= (and b!1585612 res!1082868) b!1585613))

(declare-fun m!1454347 () Bool)

(assert (=> b!1585613 m!1454347))

(assert (=> d!167687 d!167711))

(declare-fun d!167713 () Bool)

(declare-fun res!1082869 () Bool)

(declare-fun e!885290 () Bool)

(assert (=> d!167713 (=> res!1082869 e!885290)))

(assert (=> d!167713 (= res!1082869 (or ((_ is Nil!36972) (t!51893 l!556)) ((_ is Nil!36972) (t!51893 (t!51893 l!556)))))))

(assert (=> d!167713 (= (isStrictlySorted!1197 (t!51893 l!556)) e!885290)))

(declare-fun b!1585614 () Bool)

(declare-fun e!885291 () Bool)

(assert (=> b!1585614 (= e!885290 e!885291)))

(declare-fun res!1082870 () Bool)

(assert (=> b!1585614 (=> (not res!1082870) (not e!885291))))

(assert (=> b!1585614 (= res!1082870 (bvslt (_1!12950 (h!38514 (t!51893 l!556))) (_1!12950 (h!38514 (t!51893 (t!51893 l!556))))))))

(declare-fun b!1585615 () Bool)

(assert (=> b!1585615 (= e!885291 (isStrictlySorted!1197 (t!51893 (t!51893 l!556))))))

(assert (= (and d!167713 (not res!1082869)) b!1585614))

(assert (= (and b!1585614 res!1082870) b!1585615))

(assert (=> b!1585615 m!1454333))

(assert (=> d!167687 d!167713))

(declare-fun d!167715 () Bool)

(declare-fun lt!677399 () Bool)

(assert (=> d!167715 (= lt!677399 (select (content!864 lt!677392) (tuple2!25879 newKey!21 newValue!21)))))

(declare-fun e!885292 () Bool)

(assert (=> d!167715 (= lt!677399 e!885292)))

(declare-fun res!1082871 () Bool)

(assert (=> d!167715 (=> (not res!1082871) (not e!885292))))

(assert (=> d!167715 (= res!1082871 ((_ is Cons!36971) lt!677392))))

(assert (=> d!167715 (= (contains!10533 lt!677392 (tuple2!25879 newKey!21 newValue!21)) lt!677399)))

(declare-fun b!1585616 () Bool)

(declare-fun e!885293 () Bool)

(assert (=> b!1585616 (= e!885292 e!885293)))

(declare-fun res!1082872 () Bool)

(assert (=> b!1585616 (=> res!1082872 e!885293)))

(assert (=> b!1585616 (= res!1082872 (= (h!38514 lt!677392) (tuple2!25879 newKey!21 newValue!21)))))

(declare-fun b!1585617 () Bool)

(assert (=> b!1585617 (= e!885293 (contains!10533 (t!51893 lt!677392) (tuple2!25879 newKey!21 newValue!21)))))

(assert (= (and d!167715 res!1082871) b!1585616))

(assert (= (and b!1585616 (not res!1082872)) b!1585617))

(declare-fun m!1454349 () Bool)

(assert (=> d!167715 m!1454349))

(declare-fun m!1454351 () Bool)

(assert (=> d!167715 m!1454351))

(declare-fun m!1454353 () Bool)

(assert (=> b!1585617 m!1454353))

(assert (=> b!1585539 d!167715))

(declare-fun d!167717 () Bool)

(declare-fun res!1082873 () Bool)

(declare-fun e!885294 () Bool)

(assert (=> d!167717 (=> res!1082873 e!885294)))

(assert (=> d!167717 (= res!1082873 (and ((_ is Cons!36971) (t!51893 lt!677376)) (= (_1!12950 (h!38514 (t!51893 lt!677376))) newKey!21)))))

(assert (=> d!167717 (= (containsKey!1010 (t!51893 lt!677376) newKey!21) e!885294)))

(declare-fun b!1585618 () Bool)

(declare-fun e!885295 () Bool)

(assert (=> b!1585618 (= e!885294 e!885295)))

(declare-fun res!1082874 () Bool)

(assert (=> b!1585618 (=> (not res!1082874) (not e!885295))))

(assert (=> b!1585618 (= res!1082874 (and (or (not ((_ is Cons!36971) (t!51893 lt!677376))) (bvsle (_1!12950 (h!38514 (t!51893 lt!677376))) newKey!21)) ((_ is Cons!36971) (t!51893 lt!677376)) (bvslt (_1!12950 (h!38514 (t!51893 lt!677376))) newKey!21)))))

(declare-fun b!1585619 () Bool)

(assert (=> b!1585619 (= e!885295 (containsKey!1010 (t!51893 (t!51893 lt!677376)) newKey!21))))

(assert (= (and d!167717 (not res!1082873)) b!1585618))

(assert (= (and b!1585618 res!1082874) b!1585619))

(declare-fun m!1454355 () Bool)

(assert (=> b!1585619 m!1454355))

(assert (=> b!1585436 d!167717))

(declare-fun d!167719 () Bool)

(declare-fun res!1082875 () Bool)

(declare-fun e!885296 () Bool)

(assert (=> d!167719 (=> res!1082875 e!885296)))

(assert (=> d!167719 (= res!1082875 (or ((_ is Nil!36972) (t!51893 lt!677376)) ((_ is Nil!36972) (t!51893 (t!51893 lt!677376)))))))

(assert (=> d!167719 (= (isStrictlySorted!1197 (t!51893 lt!677376)) e!885296)))

(declare-fun b!1585620 () Bool)

(declare-fun e!885297 () Bool)

(assert (=> b!1585620 (= e!885296 e!885297)))

(declare-fun res!1082876 () Bool)

(assert (=> b!1585620 (=> (not res!1082876) (not e!885297))))

(assert (=> b!1585620 (= res!1082876 (bvslt (_1!12950 (h!38514 (t!51893 lt!677376))) (_1!12950 (h!38514 (t!51893 (t!51893 lt!677376))))))))

(declare-fun b!1585621 () Bool)

(assert (=> b!1585621 (= e!885297 (isStrictlySorted!1197 (t!51893 (t!51893 lt!677376))))))

(assert (= (and d!167719 (not res!1082875)) b!1585620))

(assert (= (and b!1585620 res!1082876) b!1585621))

(declare-fun m!1454357 () Bool)

(assert (=> b!1585621 m!1454357))

(assert (=> b!1585462 d!167719))

(declare-fun d!167721 () Bool)

(assert (=> d!167721 (= ($colon$colon!1041 e!885243 (ite c!147001 (h!38514 (t!51893 l!556)) (tuple2!25879 newKey!21 newValue!21))) (Cons!36971 (ite c!147001 (h!38514 (t!51893 l!556)) (tuple2!25879 newKey!21 newValue!21)) e!885243))))

(assert (=> bm!72635 d!167721))

(declare-fun d!167723 () Bool)

(declare-fun lt!677400 () Bool)

(assert (=> d!167723 (= lt!677400 (select (content!864 (t!51893 lt!677376)) (tuple2!25879 newKey!21 newValue!21)))))

(declare-fun e!885298 () Bool)

(assert (=> d!167723 (= lt!677400 e!885298)))

(declare-fun res!1082877 () Bool)

(assert (=> d!167723 (=> (not res!1082877) (not e!885298))))

(assert (=> d!167723 (= res!1082877 ((_ is Cons!36971) (t!51893 lt!677376)))))

(assert (=> d!167723 (= (contains!10533 (t!51893 lt!677376) (tuple2!25879 newKey!21 newValue!21)) lt!677400)))

(declare-fun b!1585622 () Bool)

(declare-fun e!885299 () Bool)

(assert (=> b!1585622 (= e!885298 e!885299)))

(declare-fun res!1082878 () Bool)

(assert (=> b!1585622 (=> res!1082878 e!885299)))

(assert (=> b!1585622 (= res!1082878 (= (h!38514 (t!51893 lt!677376)) (tuple2!25879 newKey!21 newValue!21)))))

(declare-fun b!1585623 () Bool)

(assert (=> b!1585623 (= e!885299 (contains!10533 (t!51893 (t!51893 lt!677376)) (tuple2!25879 newKey!21 newValue!21)))))

(assert (= (and d!167723 res!1082877) b!1585622))

(assert (= (and b!1585622 (not res!1082878)) b!1585623))

(assert (=> d!167723 m!1454345))

(declare-fun m!1454359 () Bool)

(assert (=> d!167723 m!1454359))

(declare-fun m!1454361 () Bool)

(assert (=> b!1585623 m!1454361))

(assert (=> b!1585454 d!167723))

(declare-fun d!167725 () Bool)

(declare-fun res!1082879 () Bool)

(declare-fun e!885300 () Bool)

(assert (=> d!167725 (=> res!1082879 e!885300)))

(assert (=> d!167725 (= res!1082879 (and ((_ is Cons!36971) lt!677392) (= (_1!12950 (h!38514 lt!677392)) newKey!21)))))

(assert (=> d!167725 (= (containsKey!1010 lt!677392 newKey!21) e!885300)))

(declare-fun b!1585624 () Bool)

(declare-fun e!885301 () Bool)

(assert (=> b!1585624 (= e!885300 e!885301)))

(declare-fun res!1082880 () Bool)

(assert (=> b!1585624 (=> (not res!1082880) (not e!885301))))

(assert (=> b!1585624 (= res!1082880 (and (or (not ((_ is Cons!36971) lt!677392)) (bvsle (_1!12950 (h!38514 lt!677392)) newKey!21)) ((_ is Cons!36971) lt!677392) (bvslt (_1!12950 (h!38514 lt!677392)) newKey!21)))))

(declare-fun b!1585625 () Bool)

(assert (=> b!1585625 (= e!885301 (containsKey!1010 (t!51893 lt!677392) newKey!21))))

(assert (= (and d!167725 (not res!1082879)) b!1585624))

(assert (= (and b!1585624 res!1082880) b!1585625))

(declare-fun m!1454363 () Bool)

(assert (=> b!1585625 m!1454363))

(assert (=> b!1585542 d!167725))

(assert (=> b!1585442 d!167713))

(declare-fun b!1585626 () Bool)

(declare-fun e!885302 () Bool)

(declare-fun tp!115276 () Bool)

(assert (=> b!1585626 (= e!885302 (and tp_is_empty!39519 tp!115276))))

(assert (=> b!1585561 (= tp!115269 e!885302)))

(assert (= (and b!1585561 ((_ is Cons!36971) (t!51893 (t!51893 l!556)))) b!1585626))

(check-sat (not b!1585611) (not d!167723) (not d!167707) (not b!1585625) (not d!167715) (not b!1585597) (not bm!72644) (not b!1585605) (not b!1585621) (not b!1585615) (not b!1585617) (not b!1585626) (not b!1585623) (not b!1585619) (not b!1585602) (not b!1585613) tp_is_empty!39519)
(check-sat)
