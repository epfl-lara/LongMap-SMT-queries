; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7650 () Bool)

(assert start!7650)

(declare-fun b!48722 () Bool)

(declare-fun res!28292 () Bool)

(declare-fun e!31288 () Bool)

(assert (=> b!48722 (=> (not res!28292) (not e!31288))))

(declare-datatypes ((B!976 0))(
  ( (B!977 (val!1108 Int)) )
))
(declare-datatypes ((tuple2!1798 0))(
  ( (tuple2!1799 (_1!910 (_ BitVec 64)) (_2!910 B!976)) )
))
(declare-datatypes ((List!1305 0))(
  ( (Nil!1302) (Cons!1301 (h!1881 tuple2!1798) (t!4333 List!1305)) )
))
(declare-fun l!1333 () List!1305)

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun containsKey!118 (List!1305 (_ BitVec 64)) Bool)

(assert (=> b!48722 (= res!28292 (not (containsKey!118 l!1333 newKey!147)))))

(declare-fun res!28290 () Bool)

(assert (=> start!7650 (=> (not res!28290) (not e!31288))))

(declare-fun isStrictlySorted!269 (List!1305) Bool)

(assert (=> start!7650 (= res!28290 (isStrictlySorted!269 l!1333))))

(assert (=> start!7650 e!31288))

(declare-fun e!31287 () Bool)

(assert (=> start!7650 e!31287))

(assert (=> start!7650 true))

(declare-fun tp_is_empty!2127 () Bool)

(assert (=> start!7650 tp_is_empty!2127))

(declare-fun b!48723 () Bool)

(declare-fun res!28291 () Bool)

(assert (=> b!48723 (=> (not res!28291) (not e!31288))))

(get-info :version)

(assert (=> b!48723 (= res!28291 ((_ is Nil!1302) l!1333))))

(declare-fun b!48724 () Bool)

(declare-fun newValue!147 () B!976)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!50 (List!1305) (InoxSet tuple2!1798))

(declare-fun insertStrictlySorted!35 (List!1305 (_ BitVec 64) B!976) List!1305)

(assert (=> b!48724 (= e!31288 (not (= ((_ map or) (content!50 l!1333) (store ((as const (Array tuple2!1798 Bool)) false) (tuple2!1799 newKey!147 newValue!147) true)) (content!50 (insertStrictlySorted!35 l!1333 newKey!147 newValue!147)))))))

(declare-fun b!48725 () Bool)

(declare-fun tp!6458 () Bool)

(assert (=> b!48725 (= e!31287 (and tp_is_empty!2127 tp!6458))))

(assert (= (and start!7650 res!28290) b!48722))

(assert (= (and b!48722 res!28292) b!48723))

(assert (= (and b!48723 res!28291) b!48724))

(assert (= (and start!7650 ((_ is Cons!1301) l!1333)) b!48725))

(declare-fun m!42381 () Bool)

(assert (=> b!48722 m!42381))

(declare-fun m!42383 () Bool)

(assert (=> start!7650 m!42383))

(declare-fun m!42385 () Bool)

(assert (=> b!48724 m!42385))

(declare-fun m!42387 () Bool)

(assert (=> b!48724 m!42387))

(declare-fun m!42389 () Bool)

(assert (=> b!48724 m!42389))

(assert (=> b!48724 m!42389))

(declare-fun m!42391 () Bool)

(assert (=> b!48724 m!42391))

(check-sat (not b!48724) tp_is_empty!2127 (not start!7650) (not b!48722) (not b!48725))
(check-sat)
(get-model)

(declare-fun d!9677 () Bool)

(declare-fun c!6531 () Bool)

(assert (=> d!9677 (= c!6531 ((_ is Nil!1302) l!1333))))

(declare-fun e!31301 () (InoxSet tuple2!1798))

(assert (=> d!9677 (= (content!50 l!1333) e!31301)))

(declare-fun b!48746 () Bool)

(assert (=> b!48746 (= e!31301 ((as const (Array tuple2!1798 Bool)) false))))

(declare-fun b!48747 () Bool)

(assert (=> b!48747 (= e!31301 ((_ map or) (store ((as const (Array tuple2!1798 Bool)) false) (h!1881 l!1333) true) (content!50 (t!4333 l!1333))))))

(assert (= (and d!9677 c!6531) b!48746))

(assert (= (and d!9677 (not c!6531)) b!48747))

(declare-fun m!42405 () Bool)

(assert (=> b!48747 m!42405))

(declare-fun m!42409 () Bool)

(assert (=> b!48747 m!42409))

(assert (=> b!48724 d!9677))

(declare-fun d!9683 () Bool)

(declare-fun c!6532 () Bool)

(assert (=> d!9683 (= c!6532 ((_ is Nil!1302) (insertStrictlySorted!35 l!1333 newKey!147 newValue!147)))))

(declare-fun e!31304 () (InoxSet tuple2!1798))

(assert (=> d!9683 (= (content!50 (insertStrictlySorted!35 l!1333 newKey!147 newValue!147)) e!31304)))

(declare-fun b!48750 () Bool)

(assert (=> b!48750 (= e!31304 ((as const (Array tuple2!1798 Bool)) false))))

(declare-fun b!48751 () Bool)

(assert (=> b!48751 (= e!31304 ((_ map or) (store ((as const (Array tuple2!1798 Bool)) false) (h!1881 (insertStrictlySorted!35 l!1333 newKey!147 newValue!147)) true) (content!50 (t!4333 (insertStrictlySorted!35 l!1333 newKey!147 newValue!147)))))))

(assert (= (and d!9683 c!6532) b!48750))

(assert (= (and d!9683 (not c!6532)) b!48751))

(declare-fun m!42411 () Bool)

(assert (=> b!48751 m!42411))

(declare-fun m!42413 () Bool)

(assert (=> b!48751 m!42413))

(assert (=> b!48724 d!9683))

(declare-fun d!9685 () Bool)

(declare-fun e!31347 () Bool)

(assert (=> d!9685 e!31347))

(declare-fun res!28329 () Bool)

(assert (=> d!9685 (=> (not res!28329) (not e!31347))))

(declare-fun lt!20686 () List!1305)

(assert (=> d!9685 (= res!28329 (isStrictlySorted!269 lt!20686))))

(declare-fun e!31348 () List!1305)

(assert (=> d!9685 (= lt!20686 e!31348)))

(declare-fun c!6558 () Bool)

(assert (=> d!9685 (= c!6558 (and ((_ is Cons!1301) l!1333) (bvslt (_1!910 (h!1881 l!1333)) newKey!147)))))

(assert (=> d!9685 (isStrictlySorted!269 l!1333)))

(assert (=> d!9685 (= (insertStrictlySorted!35 l!1333 newKey!147 newValue!147) lt!20686)))

(declare-fun bm!3782 () Bool)

(declare-fun call!3785 () List!1305)

(declare-fun call!3786 () List!1305)

(assert (=> bm!3782 (= call!3785 call!3786)))

(declare-fun b!48820 () Bool)

(declare-fun res!28328 () Bool)

(assert (=> b!48820 (=> (not res!28328) (not e!31347))))

(assert (=> b!48820 (= res!28328 (containsKey!118 lt!20686 newKey!147))))

(declare-fun b!48821 () Bool)

(assert (=> b!48821 (= e!31348 call!3786)))

(declare-fun b!48822 () Bool)

(declare-fun e!31349 () List!1305)

(assert (=> b!48822 (= e!31349 (insertStrictlySorted!35 (t!4333 l!1333) newKey!147 newValue!147))))

(declare-fun bm!3783 () Bool)

(declare-fun $colon$colon!53 (List!1305 tuple2!1798) List!1305)

(assert (=> bm!3783 (= call!3786 ($colon$colon!53 e!31349 (ite c!6558 (h!1881 l!1333) (tuple2!1799 newKey!147 newValue!147))))))

(declare-fun c!6557 () Bool)

(assert (=> bm!3783 (= c!6557 c!6558)))

(declare-fun c!6560 () Bool)

(declare-fun c!6559 () Bool)

(declare-fun b!48823 () Bool)

(assert (=> b!48823 (= e!31349 (ite c!6560 (t!4333 l!1333) (ite c!6559 (Cons!1301 (h!1881 l!1333) (t!4333 l!1333)) Nil!1302)))))

(declare-fun b!48824 () Bool)

(declare-fun contains!606 (List!1305 tuple2!1798) Bool)

(assert (=> b!48824 (= e!31347 (contains!606 lt!20686 (tuple2!1799 newKey!147 newValue!147)))))

(declare-fun b!48825 () Bool)

(declare-fun e!31345 () List!1305)

(assert (=> b!48825 (= e!31345 call!3785)))

(declare-fun bm!3784 () Bool)

(declare-fun call!3787 () List!1305)

(assert (=> bm!3784 (= call!3787 call!3785)))

(declare-fun b!48826 () Bool)

(assert (=> b!48826 (= c!6559 (and ((_ is Cons!1301) l!1333) (bvsgt (_1!910 (h!1881 l!1333)) newKey!147)))))

(declare-fun e!31346 () List!1305)

(assert (=> b!48826 (= e!31345 e!31346)))

(declare-fun b!48827 () Bool)

(assert (=> b!48827 (= e!31348 e!31345)))

(assert (=> b!48827 (= c!6560 (and ((_ is Cons!1301) l!1333) (= (_1!910 (h!1881 l!1333)) newKey!147)))))

(declare-fun b!48828 () Bool)

(assert (=> b!48828 (= e!31346 call!3787)))

(declare-fun b!48829 () Bool)

(assert (=> b!48829 (= e!31346 call!3787)))

(assert (= (and d!9685 c!6558) b!48821))

(assert (= (and d!9685 (not c!6558)) b!48827))

(assert (= (and b!48827 c!6560) b!48825))

(assert (= (and b!48827 (not c!6560)) b!48826))

(assert (= (and b!48826 c!6559) b!48828))

(assert (= (and b!48826 (not c!6559)) b!48829))

(assert (= (or b!48828 b!48829) bm!3784))

(assert (= (or b!48825 bm!3784) bm!3782))

(assert (= (or b!48821 bm!3782) bm!3783))

(assert (= (and bm!3783 c!6557) b!48822))

(assert (= (and bm!3783 (not c!6557)) b!48823))

(assert (= (and d!9685 res!28329) b!48820))

(assert (= (and b!48820 res!28328) b!48824))

(declare-fun m!42435 () Bool)

(assert (=> b!48824 m!42435))

(declare-fun m!42437 () Bool)

(assert (=> d!9685 m!42437))

(assert (=> d!9685 m!42383))

(declare-fun m!42439 () Bool)

(assert (=> b!48820 m!42439))

(declare-fun m!42441 () Bool)

(assert (=> b!48822 m!42441))

(declare-fun m!42443 () Bool)

(assert (=> bm!3783 m!42443))

(assert (=> b!48724 d!9685))

(declare-fun d!9699 () Bool)

(declare-fun res!28340 () Bool)

(declare-fun e!31369 () Bool)

(assert (=> d!9699 (=> res!28340 e!31369)))

(assert (=> d!9699 (= res!28340 (and ((_ is Cons!1301) l!1333) (= (_1!910 (h!1881 l!1333)) newKey!147)))))

(assert (=> d!9699 (= (containsKey!118 l!1333 newKey!147) e!31369)))

(declare-fun b!48864 () Bool)

(declare-fun e!31370 () Bool)

(assert (=> b!48864 (= e!31369 e!31370)))

(declare-fun res!28341 () Bool)

(assert (=> b!48864 (=> (not res!28341) (not e!31370))))

(assert (=> b!48864 (= res!28341 (and (or (not ((_ is Cons!1301) l!1333)) (bvsle (_1!910 (h!1881 l!1333)) newKey!147)) ((_ is Cons!1301) l!1333) (bvslt (_1!910 (h!1881 l!1333)) newKey!147)))))

(declare-fun b!48865 () Bool)

(assert (=> b!48865 (= e!31370 (containsKey!118 (t!4333 l!1333) newKey!147))))

(assert (= (and d!9699 (not res!28340)) b!48864))

(assert (= (and b!48864 res!28341) b!48865))

(declare-fun m!42455 () Bool)

(assert (=> b!48865 m!42455))

(assert (=> b!48722 d!9699))

(declare-fun d!9703 () Bool)

(declare-fun res!28354 () Bool)

(declare-fun e!31388 () Bool)

(assert (=> d!9703 (=> res!28354 e!31388)))

(assert (=> d!9703 (= res!28354 (or ((_ is Nil!1302) l!1333) ((_ is Nil!1302) (t!4333 l!1333))))))

(assert (=> d!9703 (= (isStrictlySorted!269 l!1333) e!31388)))

(declare-fun b!48890 () Bool)

(declare-fun e!31389 () Bool)

(assert (=> b!48890 (= e!31388 e!31389)))

(declare-fun res!28355 () Bool)

(assert (=> b!48890 (=> (not res!28355) (not e!31389))))

(assert (=> b!48890 (= res!28355 (bvslt (_1!910 (h!1881 l!1333)) (_1!910 (h!1881 (t!4333 l!1333)))))))

(declare-fun b!48891 () Bool)

(assert (=> b!48891 (= e!31389 (isStrictlySorted!269 (t!4333 l!1333)))))

(assert (= (and d!9703 (not res!28354)) b!48890))

(assert (= (and b!48890 res!28355) b!48891))

(declare-fun m!42459 () Bool)

(assert (=> b!48891 m!42459))

(assert (=> start!7650 d!9703))

(declare-fun b!48901 () Bool)

(declare-fun e!31395 () Bool)

(declare-fun tp!6467 () Bool)

(assert (=> b!48901 (= e!31395 (and tp_is_empty!2127 tp!6467))))

(assert (=> b!48725 (= tp!6458 e!31395)))

(assert (= (and b!48725 ((_ is Cons!1301) (t!4333 l!1333))) b!48901))

(check-sat (not b!48747) (not b!48865) (not d!9685) (not bm!3783) (not b!48901) (not b!48824) (not b!48751) (not b!48820) (not b!48822) tp_is_empty!2127 (not b!48891))
(check-sat)
(get-model)

(declare-fun d!9705 () Bool)

(declare-fun res!28356 () Bool)

(declare-fun e!31397 () Bool)

(assert (=> d!9705 (=> res!28356 e!31397)))

(assert (=> d!9705 (= res!28356 (or ((_ is Nil!1302) lt!20686) ((_ is Nil!1302) (t!4333 lt!20686))))))

(assert (=> d!9705 (= (isStrictlySorted!269 lt!20686) e!31397)))

(declare-fun b!48903 () Bool)

(declare-fun e!31398 () Bool)

(assert (=> b!48903 (= e!31397 e!31398)))

(declare-fun res!28357 () Bool)

(assert (=> b!48903 (=> (not res!28357) (not e!31398))))

(assert (=> b!48903 (= res!28357 (bvslt (_1!910 (h!1881 lt!20686)) (_1!910 (h!1881 (t!4333 lt!20686)))))))

(declare-fun b!48904 () Bool)

(assert (=> b!48904 (= e!31398 (isStrictlySorted!269 (t!4333 lt!20686)))))

(assert (= (and d!9705 (not res!28356)) b!48903))

(assert (= (and b!48903 res!28357) b!48904))

(declare-fun m!42471 () Bool)

(assert (=> b!48904 m!42471))

(assert (=> d!9685 d!9705))

(assert (=> d!9685 d!9703))

(declare-fun d!9707 () Bool)

(declare-fun c!6577 () Bool)

(assert (=> d!9707 (= c!6577 ((_ is Nil!1302) (t!4333 (insertStrictlySorted!35 l!1333 newKey!147 newValue!147))))))

(declare-fun e!31399 () (InoxSet tuple2!1798))

(assert (=> d!9707 (= (content!50 (t!4333 (insertStrictlySorted!35 l!1333 newKey!147 newValue!147))) e!31399)))

(declare-fun b!48905 () Bool)

(assert (=> b!48905 (= e!31399 ((as const (Array tuple2!1798 Bool)) false))))

(declare-fun b!48906 () Bool)

(assert (=> b!48906 (= e!31399 ((_ map or) (store ((as const (Array tuple2!1798 Bool)) false) (h!1881 (t!4333 (insertStrictlySorted!35 l!1333 newKey!147 newValue!147))) true) (content!50 (t!4333 (t!4333 (insertStrictlySorted!35 l!1333 newKey!147 newValue!147))))))))

(assert (= (and d!9707 c!6577) b!48905))

(assert (= (and d!9707 (not c!6577)) b!48906))

(declare-fun m!42473 () Bool)

(assert (=> b!48906 m!42473))

(declare-fun m!42475 () Bool)

(assert (=> b!48906 m!42475))

(assert (=> b!48751 d!9707))

(declare-fun d!9709 () Bool)

(declare-fun res!28358 () Bool)

(declare-fun e!31400 () Bool)

(assert (=> d!9709 (=> res!28358 e!31400)))

(assert (=> d!9709 (= res!28358 (or ((_ is Nil!1302) (t!4333 l!1333)) ((_ is Nil!1302) (t!4333 (t!4333 l!1333)))))))

(assert (=> d!9709 (= (isStrictlySorted!269 (t!4333 l!1333)) e!31400)))

(declare-fun b!48907 () Bool)

(declare-fun e!31401 () Bool)

(assert (=> b!48907 (= e!31400 e!31401)))

(declare-fun res!28359 () Bool)

(assert (=> b!48907 (=> (not res!28359) (not e!31401))))

(assert (=> b!48907 (= res!28359 (bvslt (_1!910 (h!1881 (t!4333 l!1333))) (_1!910 (h!1881 (t!4333 (t!4333 l!1333))))))))

(declare-fun b!48908 () Bool)

(assert (=> b!48908 (= e!31401 (isStrictlySorted!269 (t!4333 (t!4333 l!1333))))))

(assert (= (and d!9709 (not res!28358)) b!48907))

(assert (= (and b!48907 res!28359) b!48908))

(declare-fun m!42477 () Bool)

(assert (=> b!48908 m!42477))

(assert (=> b!48891 d!9709))

(declare-fun d!9711 () Bool)

(declare-fun res!28360 () Bool)

(declare-fun e!31402 () Bool)

(assert (=> d!9711 (=> res!28360 e!31402)))

(assert (=> d!9711 (= res!28360 (and ((_ is Cons!1301) lt!20686) (= (_1!910 (h!1881 lt!20686)) newKey!147)))))

(assert (=> d!9711 (= (containsKey!118 lt!20686 newKey!147) e!31402)))

(declare-fun b!48909 () Bool)

(declare-fun e!31403 () Bool)

(assert (=> b!48909 (= e!31402 e!31403)))

(declare-fun res!28361 () Bool)

(assert (=> b!48909 (=> (not res!28361) (not e!31403))))

(assert (=> b!48909 (= res!28361 (and (or (not ((_ is Cons!1301) lt!20686)) (bvsle (_1!910 (h!1881 lt!20686)) newKey!147)) ((_ is Cons!1301) lt!20686) (bvslt (_1!910 (h!1881 lt!20686)) newKey!147)))))

(declare-fun b!48910 () Bool)

(assert (=> b!48910 (= e!31403 (containsKey!118 (t!4333 lt!20686) newKey!147))))

(assert (= (and d!9711 (not res!28360)) b!48909))

(assert (= (and b!48909 res!28361) b!48910))

(declare-fun m!42479 () Bool)

(assert (=> b!48910 m!42479))

(assert (=> b!48820 d!9711))

(declare-fun d!9713 () Bool)

(declare-fun lt!20693 () Bool)

(assert (=> d!9713 (= lt!20693 (select (content!50 lt!20686) (tuple2!1799 newKey!147 newValue!147)))))

(declare-fun e!31408 () Bool)

(assert (=> d!9713 (= lt!20693 e!31408)))

(declare-fun res!28366 () Bool)

(assert (=> d!9713 (=> (not res!28366) (not e!31408))))

(assert (=> d!9713 (= res!28366 ((_ is Cons!1301) lt!20686))))

(assert (=> d!9713 (= (contains!606 lt!20686 (tuple2!1799 newKey!147 newValue!147)) lt!20693)))

(declare-fun b!48915 () Bool)

(declare-fun e!31409 () Bool)

(assert (=> b!48915 (= e!31408 e!31409)))

(declare-fun res!28367 () Bool)

(assert (=> b!48915 (=> res!28367 e!31409)))

(assert (=> b!48915 (= res!28367 (= (h!1881 lt!20686) (tuple2!1799 newKey!147 newValue!147)))))

(declare-fun b!48916 () Bool)

(assert (=> b!48916 (= e!31409 (contains!606 (t!4333 lt!20686) (tuple2!1799 newKey!147 newValue!147)))))

(assert (= (and d!9713 res!28366) b!48915))

(assert (= (and b!48915 (not res!28367)) b!48916))

(declare-fun m!42481 () Bool)

(assert (=> d!9713 m!42481))

(declare-fun m!42483 () Bool)

(assert (=> d!9713 m!42483))

(declare-fun m!42485 () Bool)

(assert (=> b!48916 m!42485))

(assert (=> b!48824 d!9713))

(declare-fun d!9715 () Bool)

(declare-fun c!6578 () Bool)

(assert (=> d!9715 (= c!6578 ((_ is Nil!1302) (t!4333 l!1333)))))

(declare-fun e!31410 () (InoxSet tuple2!1798))

(assert (=> d!9715 (= (content!50 (t!4333 l!1333)) e!31410)))

(declare-fun b!48917 () Bool)

(assert (=> b!48917 (= e!31410 ((as const (Array tuple2!1798 Bool)) false))))

(declare-fun b!48918 () Bool)

(assert (=> b!48918 (= e!31410 ((_ map or) (store ((as const (Array tuple2!1798 Bool)) false) (h!1881 (t!4333 l!1333)) true) (content!50 (t!4333 (t!4333 l!1333)))))))

(assert (= (and d!9715 c!6578) b!48917))

(assert (= (and d!9715 (not c!6578)) b!48918))

(declare-fun m!42487 () Bool)

(assert (=> b!48918 m!42487))

(declare-fun m!42489 () Bool)

(assert (=> b!48918 m!42489))

(assert (=> b!48747 d!9715))

(declare-fun d!9717 () Bool)

(assert (=> d!9717 (= ($colon$colon!53 e!31349 (ite c!6558 (h!1881 l!1333) (tuple2!1799 newKey!147 newValue!147))) (Cons!1301 (ite c!6558 (h!1881 l!1333) (tuple2!1799 newKey!147 newValue!147)) e!31349))))

(assert (=> bm!3783 d!9717))

(declare-fun d!9719 () Bool)

(declare-fun res!28368 () Bool)

(declare-fun e!31411 () Bool)

(assert (=> d!9719 (=> res!28368 e!31411)))

(assert (=> d!9719 (= res!28368 (and ((_ is Cons!1301) (t!4333 l!1333)) (= (_1!910 (h!1881 (t!4333 l!1333))) newKey!147)))))

(assert (=> d!9719 (= (containsKey!118 (t!4333 l!1333) newKey!147) e!31411)))

(declare-fun b!48919 () Bool)

(declare-fun e!31412 () Bool)

(assert (=> b!48919 (= e!31411 e!31412)))

(declare-fun res!28369 () Bool)

(assert (=> b!48919 (=> (not res!28369) (not e!31412))))

(assert (=> b!48919 (= res!28369 (and (or (not ((_ is Cons!1301) (t!4333 l!1333))) (bvsle (_1!910 (h!1881 (t!4333 l!1333))) newKey!147)) ((_ is Cons!1301) (t!4333 l!1333)) (bvslt (_1!910 (h!1881 (t!4333 l!1333))) newKey!147)))))

(declare-fun b!48920 () Bool)

(assert (=> b!48920 (= e!31412 (containsKey!118 (t!4333 (t!4333 l!1333)) newKey!147))))

(assert (= (and d!9719 (not res!28368)) b!48919))

(assert (= (and b!48919 res!28369) b!48920))

(declare-fun m!42491 () Bool)

(assert (=> b!48920 m!42491))

(assert (=> b!48865 d!9719))

(declare-fun d!9721 () Bool)

(declare-fun e!31415 () Bool)

(assert (=> d!9721 e!31415))

(declare-fun res!28371 () Bool)

(assert (=> d!9721 (=> (not res!28371) (not e!31415))))

(declare-fun lt!20694 () List!1305)

(assert (=> d!9721 (= res!28371 (isStrictlySorted!269 lt!20694))))

(declare-fun e!31416 () List!1305)

(assert (=> d!9721 (= lt!20694 e!31416)))

(declare-fun c!6580 () Bool)

(assert (=> d!9721 (= c!6580 (and ((_ is Cons!1301) (t!4333 l!1333)) (bvslt (_1!910 (h!1881 (t!4333 l!1333))) newKey!147)))))

(assert (=> d!9721 (isStrictlySorted!269 (t!4333 l!1333))))

(assert (=> d!9721 (= (insertStrictlySorted!35 (t!4333 l!1333) newKey!147 newValue!147) lt!20694)))

(declare-fun bm!3797 () Bool)

(declare-fun call!3800 () List!1305)

(declare-fun call!3801 () List!1305)

(assert (=> bm!3797 (= call!3800 call!3801)))

(declare-fun b!48921 () Bool)

(declare-fun res!28370 () Bool)

(assert (=> b!48921 (=> (not res!28370) (not e!31415))))

(assert (=> b!48921 (= res!28370 (containsKey!118 lt!20694 newKey!147))))

(declare-fun b!48922 () Bool)

(assert (=> b!48922 (= e!31416 call!3801)))

(declare-fun b!48923 () Bool)

(declare-fun e!31417 () List!1305)

(assert (=> b!48923 (= e!31417 (insertStrictlySorted!35 (t!4333 (t!4333 l!1333)) newKey!147 newValue!147))))

(declare-fun bm!3798 () Bool)

(assert (=> bm!3798 (= call!3801 ($colon$colon!53 e!31417 (ite c!6580 (h!1881 (t!4333 l!1333)) (tuple2!1799 newKey!147 newValue!147))))))

(declare-fun c!6579 () Bool)

(assert (=> bm!3798 (= c!6579 c!6580)))

(declare-fun c!6582 () Bool)

(declare-fun c!6581 () Bool)

(declare-fun b!48924 () Bool)

(assert (=> b!48924 (= e!31417 (ite c!6582 (t!4333 (t!4333 l!1333)) (ite c!6581 (Cons!1301 (h!1881 (t!4333 l!1333)) (t!4333 (t!4333 l!1333))) Nil!1302)))))

(declare-fun b!48925 () Bool)

(assert (=> b!48925 (= e!31415 (contains!606 lt!20694 (tuple2!1799 newKey!147 newValue!147)))))

(declare-fun b!48926 () Bool)

(declare-fun e!31413 () List!1305)

(assert (=> b!48926 (= e!31413 call!3800)))

(declare-fun bm!3799 () Bool)

(declare-fun call!3802 () List!1305)

(assert (=> bm!3799 (= call!3802 call!3800)))

(declare-fun b!48927 () Bool)

(assert (=> b!48927 (= c!6581 (and ((_ is Cons!1301) (t!4333 l!1333)) (bvsgt (_1!910 (h!1881 (t!4333 l!1333))) newKey!147)))))

(declare-fun e!31414 () List!1305)

(assert (=> b!48927 (= e!31413 e!31414)))

(declare-fun b!48928 () Bool)

(assert (=> b!48928 (= e!31416 e!31413)))

(assert (=> b!48928 (= c!6582 (and ((_ is Cons!1301) (t!4333 l!1333)) (= (_1!910 (h!1881 (t!4333 l!1333))) newKey!147)))))

(declare-fun b!48929 () Bool)

(assert (=> b!48929 (= e!31414 call!3802)))

(declare-fun b!48930 () Bool)

(assert (=> b!48930 (= e!31414 call!3802)))

(assert (= (and d!9721 c!6580) b!48922))

(assert (= (and d!9721 (not c!6580)) b!48928))

(assert (= (and b!48928 c!6582) b!48926))

(assert (= (and b!48928 (not c!6582)) b!48927))

(assert (= (and b!48927 c!6581) b!48929))

(assert (= (and b!48927 (not c!6581)) b!48930))

(assert (= (or b!48929 b!48930) bm!3799))

(assert (= (or b!48926 bm!3799) bm!3797))

(assert (= (or b!48922 bm!3797) bm!3798))

(assert (= (and bm!3798 c!6579) b!48923))

(assert (= (and bm!3798 (not c!6579)) b!48924))

(assert (= (and d!9721 res!28371) b!48921))

(assert (= (and b!48921 res!28370) b!48925))

(declare-fun m!42497 () Bool)

(assert (=> b!48925 m!42497))

(declare-fun m!42499 () Bool)

(assert (=> d!9721 m!42499))

(assert (=> d!9721 m!42459))

(declare-fun m!42501 () Bool)

(assert (=> b!48921 m!42501))

(declare-fun m!42503 () Bool)

(assert (=> b!48923 m!42503))

(declare-fun m!42505 () Bool)

(assert (=> bm!3798 m!42505))

(assert (=> b!48822 d!9721))

(declare-fun b!48933 () Bool)

(declare-fun e!31419 () Bool)

(declare-fun tp!6471 () Bool)

(assert (=> b!48933 (= e!31419 (and tp_is_empty!2127 tp!6471))))

(assert (=> b!48901 (= tp!6467 e!31419)))

(assert (= (and b!48901 ((_ is Cons!1301) (t!4333 (t!4333 l!1333)))) b!48933))

(check-sat (not b!48920) (not d!9713) (not b!48908) (not b!48904) (not b!48916) (not d!9721) tp_is_empty!2127 (not b!48918) (not b!48906) (not bm!3798) (not b!48910) (not b!48933) (not b!48923) (not b!48925) (not b!48921))
(check-sat)
