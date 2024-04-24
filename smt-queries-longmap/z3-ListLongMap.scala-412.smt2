; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7720 () Bool)

(assert start!7720)

(declare-fun b!49052 () Bool)

(declare-fun res!28448 () Bool)

(declare-fun e!31505 () Bool)

(assert (=> b!49052 (=> (not res!28448) (not e!31505))))

(declare-datatypes ((B!986 0))(
  ( (B!987 (val!1113 Int)) )
))
(declare-datatypes ((tuple2!1790 0))(
  ( (tuple2!1791 (_1!906 (_ BitVec 64)) (_2!906 B!986)) )
))
(declare-datatypes ((List!1296 0))(
  ( (Nil!1293) (Cons!1292 (h!1872 tuple2!1790) (t!4327 List!1296)) )
))
(declare-fun l!1333 () List!1296)

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun containsKey!123 (List!1296 (_ BitVec 64)) Bool)

(assert (=> b!49052 (= res!28448 (not (containsKey!123 l!1333 newKey!147)))))

(declare-fun res!28450 () Bool)

(assert (=> start!7720 (=> (not res!28450) (not e!31505))))

(declare-fun isStrictlySorted!262 (List!1296) Bool)

(assert (=> start!7720 (= res!28450 (isStrictlySorted!262 l!1333))))

(assert (=> start!7720 e!31505))

(declare-fun e!31506 () Bool)

(assert (=> start!7720 e!31506))

(assert (=> start!7720 true))

(declare-fun tp_is_empty!2137 () Bool)

(assert (=> start!7720 tp_is_empty!2137))

(declare-fun b!49053 () Bool)

(declare-fun res!28449 () Bool)

(assert (=> b!49053 (=> (not res!28449) (not e!31505))))

(get-info :version)

(assert (=> b!49053 (= res!28449 (not ((_ is Nil!1293) l!1333)))))

(declare-fun newValue!147 () B!986)

(declare-fun b!49054 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!53 (List!1296) (InoxSet tuple2!1790))

(declare-fun insertStrictlySorted!38 (List!1296 (_ BitVec 64) B!986) List!1296)

(assert (=> b!49054 (= e!31505 (not (= ((_ map or) (content!53 l!1333) (store ((as const (Array tuple2!1790 Bool)) false) (tuple2!1791 newKey!147 newValue!147) true)) (content!53 (insertStrictlySorted!38 l!1333 newKey!147 newValue!147)))))))

(declare-datatypes ((Unit!1380 0))(
  ( (Unit!1381) )
))
(declare-fun lt!20674 () Unit!1380)

(declare-fun lemmaInsertStrictlySortedNotContainedContent!7 (List!1296 (_ BitVec 64) B!986) Unit!1380)

(assert (=> b!49054 (= lt!20674 (lemmaInsertStrictlySortedNotContainedContent!7 (t!4327 l!1333) newKey!147 newValue!147))))

(declare-fun b!49055 () Bool)

(declare-fun tp!6494 () Bool)

(assert (=> b!49055 (= e!31506 (and tp_is_empty!2137 tp!6494))))

(assert (= (and start!7720 res!28450) b!49052))

(assert (= (and b!49052 res!28448) b!49053))

(assert (= (and b!49053 res!28449) b!49054))

(assert (= (and start!7720 ((_ is Cons!1292) l!1333)) b!49055))

(declare-fun m!42485 () Bool)

(assert (=> b!49052 m!42485))

(declare-fun m!42487 () Bool)

(assert (=> start!7720 m!42487))

(declare-fun m!42489 () Bool)

(assert (=> b!49054 m!42489))

(declare-fun m!42491 () Bool)

(assert (=> b!49054 m!42491))

(declare-fun m!42493 () Bool)

(assert (=> b!49054 m!42493))

(assert (=> b!49054 m!42493))

(declare-fun m!42495 () Bool)

(assert (=> b!49054 m!42495))

(declare-fun m!42497 () Bool)

(assert (=> b!49054 m!42497))

(check-sat (not b!49054) (not start!7720) (not b!49052) tp_is_empty!2137 (not b!49055))
(check-sat)
(get-model)

(declare-fun d!9775 () Bool)

(declare-fun res!28479 () Bool)

(declare-fun e!31529 () Bool)

(assert (=> d!9775 (=> res!28479 e!31529)))

(assert (=> d!9775 (= res!28479 (and ((_ is Cons!1292) l!1333) (= (_1!906 (h!1872 l!1333)) newKey!147)))))

(assert (=> d!9775 (= (containsKey!123 l!1333 newKey!147) e!31529)))

(declare-fun b!49088 () Bool)

(declare-fun e!31530 () Bool)

(assert (=> b!49088 (= e!31529 e!31530)))

(declare-fun res!28480 () Bool)

(assert (=> b!49088 (=> (not res!28480) (not e!31530))))

(assert (=> b!49088 (= res!28480 (and (or (not ((_ is Cons!1292) l!1333)) (bvsle (_1!906 (h!1872 l!1333)) newKey!147)) ((_ is Cons!1292) l!1333) (bvslt (_1!906 (h!1872 l!1333)) newKey!147)))))

(declare-fun b!49089 () Bool)

(assert (=> b!49089 (= e!31530 (containsKey!123 (t!4327 l!1333) newKey!147))))

(assert (= (and d!9775 (not res!28479)) b!49088))

(assert (= (and b!49088 res!28480) b!49089))

(declare-fun m!42527 () Bool)

(assert (=> b!49089 m!42527))

(assert (=> b!49052 d!9775))

(declare-fun d!9781 () Bool)

(declare-fun res!28497 () Bool)

(declare-fun e!31547 () Bool)

(assert (=> d!9781 (=> res!28497 e!31547)))

(assert (=> d!9781 (= res!28497 (or ((_ is Nil!1293) l!1333) ((_ is Nil!1293) (t!4327 l!1333))))))

(assert (=> d!9781 (= (isStrictlySorted!262 l!1333) e!31547)))

(declare-fun b!49106 () Bool)

(declare-fun e!31548 () Bool)

(assert (=> b!49106 (= e!31547 e!31548)))

(declare-fun res!28498 () Bool)

(assert (=> b!49106 (=> (not res!28498) (not e!31548))))

(assert (=> b!49106 (= res!28498 (bvslt (_1!906 (h!1872 l!1333)) (_1!906 (h!1872 (t!4327 l!1333)))))))

(declare-fun b!49107 () Bool)

(assert (=> b!49107 (= e!31548 (isStrictlySorted!262 (t!4327 l!1333)))))

(assert (= (and d!9781 (not res!28497)) b!49106))

(assert (= (and b!49106 res!28498) b!49107))

(declare-fun m!42533 () Bool)

(assert (=> b!49107 m!42533))

(assert (=> start!7720 d!9781))

(declare-fun d!9787 () Bool)

(declare-fun c!6597 () Bool)

(assert (=> d!9787 (= c!6597 ((_ is Nil!1293) l!1333))))

(declare-fun e!31561 () (InoxSet tuple2!1790))

(assert (=> d!9787 (= (content!53 l!1333) e!31561)))

(declare-fun b!49128 () Bool)

(assert (=> b!49128 (= e!31561 ((as const (Array tuple2!1790 Bool)) false))))

(declare-fun b!49129 () Bool)

(assert (=> b!49129 (= e!31561 ((_ map or) (store ((as const (Array tuple2!1790 Bool)) false) (h!1872 l!1333) true) (content!53 (t!4327 l!1333))))))

(assert (= (and d!9787 c!6597) b!49128))

(assert (= (and d!9787 (not c!6597)) b!49129))

(declare-fun m!42539 () Bool)

(assert (=> b!49129 m!42539))

(declare-fun m!42541 () Bool)

(assert (=> b!49129 m!42541))

(assert (=> b!49054 d!9787))

(declare-fun d!9793 () Bool)

(declare-fun c!6599 () Bool)

(assert (=> d!9793 (= c!6599 ((_ is Nil!1293) (insertStrictlySorted!38 l!1333 newKey!147 newValue!147)))))

(declare-fun e!31563 () (InoxSet tuple2!1790))

(assert (=> d!9793 (= (content!53 (insertStrictlySorted!38 l!1333 newKey!147 newValue!147)) e!31563)))

(declare-fun b!49132 () Bool)

(assert (=> b!49132 (= e!31563 ((as const (Array tuple2!1790 Bool)) false))))

(declare-fun b!49133 () Bool)

(assert (=> b!49133 (= e!31563 ((_ map or) (store ((as const (Array tuple2!1790 Bool)) false) (h!1872 (insertStrictlySorted!38 l!1333 newKey!147 newValue!147)) true) (content!53 (t!4327 (insertStrictlySorted!38 l!1333 newKey!147 newValue!147)))))))

(assert (= (and d!9793 c!6599) b!49132))

(assert (= (and d!9793 (not c!6599)) b!49133))

(declare-fun m!42547 () Bool)

(assert (=> b!49133 m!42547))

(declare-fun m!42549 () Bool)

(assert (=> b!49133 m!42549))

(assert (=> b!49054 d!9793))

(declare-fun d!9797 () Bool)

(declare-fun e!31603 () Bool)

(assert (=> d!9797 e!31603))

(declare-fun res!28517 () Bool)

(assert (=> d!9797 (=> (not res!28517) (not e!31603))))

(declare-fun lt!20687 () List!1296)

(assert (=> d!9797 (= res!28517 (isStrictlySorted!262 lt!20687))))

(declare-fun e!31604 () List!1296)

(assert (=> d!9797 (= lt!20687 e!31604)))

(declare-fun c!6632 () Bool)

(assert (=> d!9797 (= c!6632 (and ((_ is Cons!1292) l!1333) (bvslt (_1!906 (h!1872 l!1333)) newKey!147)))))

(assert (=> d!9797 (isStrictlySorted!262 l!1333)))

(assert (=> d!9797 (= (insertStrictlySorted!38 l!1333 newKey!147 newValue!147) lt!20687)))

(declare-fun bm!3810 () Bool)

(declare-fun call!3813 () List!1296)

(declare-fun call!3816 () List!1296)

(assert (=> bm!3810 (= call!3813 call!3816)))

(declare-fun b!49200 () Bool)

(declare-fun call!3814 () List!1296)

(assert (=> b!49200 (= e!31604 call!3814)))

(declare-fun b!49201 () Bool)

(declare-fun res!28519 () Bool)

(assert (=> b!49201 (=> (not res!28519) (not e!31603))))

(assert (=> b!49201 (= res!28519 (containsKey!123 lt!20687 newKey!147))))

(declare-fun bm!3811 () Bool)

(declare-fun e!31598 () List!1296)

(declare-fun $colon$colon!55 (List!1296 tuple2!1790) List!1296)

(assert (=> bm!3811 (= call!3814 ($colon$colon!55 e!31598 (ite c!6632 (h!1872 l!1333) (tuple2!1791 newKey!147 newValue!147))))))

(declare-fun c!6629 () Bool)

(assert (=> bm!3811 (= c!6629 c!6632)))

(declare-fun b!49203 () Bool)

(declare-fun e!31605 () List!1296)

(assert (=> b!49203 (= e!31605 call!3816)))

(declare-fun b!49205 () Bool)

(declare-fun c!6627 () Bool)

(assert (=> b!49205 (= c!6627 (and ((_ is Cons!1292) l!1333) (bvsgt (_1!906 (h!1872 l!1333)) newKey!147)))))

(declare-fun e!31600 () List!1296)

(assert (=> b!49205 (= e!31605 e!31600)))

(declare-fun b!49207 () Bool)

(declare-fun c!6630 () Bool)

(assert (=> b!49207 (= e!31598 (ite c!6630 (t!4327 l!1333) (ite c!6627 (Cons!1292 (h!1872 l!1333) (t!4327 l!1333)) Nil!1293)))))

(declare-fun bm!3812 () Bool)

(assert (=> bm!3812 (= call!3816 call!3814)))

(declare-fun b!49209 () Bool)

(assert (=> b!49209 (= e!31600 call!3813)))

(declare-fun b!49211 () Bool)

(assert (=> b!49211 (= e!31604 e!31605)))

(assert (=> b!49211 (= c!6630 (and ((_ is Cons!1292) l!1333) (= (_1!906 (h!1872 l!1333)) newKey!147)))))

(declare-fun b!49213 () Bool)

(assert (=> b!49213 (= e!31600 call!3813)))

(declare-fun b!49215 () Bool)

(assert (=> b!49215 (= e!31598 (insertStrictlySorted!38 (t!4327 l!1333) newKey!147 newValue!147))))

(declare-fun b!49217 () Bool)

(declare-fun contains!601 (List!1296 tuple2!1790) Bool)

(assert (=> b!49217 (= e!31603 (contains!601 lt!20687 (tuple2!1791 newKey!147 newValue!147)))))

(assert (= (and d!9797 c!6632) b!49200))

(assert (= (and d!9797 (not c!6632)) b!49211))

(assert (= (and b!49211 c!6630) b!49203))

(assert (= (and b!49211 (not c!6630)) b!49205))

(assert (= (and b!49205 c!6627) b!49209))

(assert (= (and b!49205 (not c!6627)) b!49213))

(assert (= (or b!49209 b!49213) bm!3810))

(assert (= (or b!49203 bm!3810) bm!3812))

(assert (= (or b!49200 bm!3812) bm!3811))

(assert (= (and bm!3811 c!6629) b!49215))

(assert (= (and bm!3811 (not c!6629)) b!49207))

(assert (= (and d!9797 res!28517) b!49201))

(assert (= (and b!49201 res!28519) b!49217))

(declare-fun m!42565 () Bool)

(assert (=> b!49215 m!42565))

(declare-fun m!42569 () Bool)

(assert (=> b!49201 m!42569))

(declare-fun m!42571 () Bool)

(assert (=> d!9797 m!42571))

(assert (=> d!9797 m!42487))

(declare-fun m!42577 () Bool)

(assert (=> bm!3811 m!42577))

(declare-fun m!42583 () Bool)

(assert (=> b!49217 m!42583))

(assert (=> b!49054 d!9797))

(declare-fun d!9805 () Bool)

(assert (=> d!9805 (= ((_ map or) (content!53 (t!4327 l!1333)) (store ((as const (Array tuple2!1790 Bool)) false) (tuple2!1791 newKey!147 newValue!147) true)) (content!53 (insertStrictlySorted!38 (t!4327 l!1333) newKey!147 newValue!147)))))

(declare-fun lt!20697 () Unit!1380)

(declare-fun choose!290 (List!1296 (_ BitVec 64) B!986) Unit!1380)

(assert (=> d!9805 (= lt!20697 (choose!290 (t!4327 l!1333) newKey!147 newValue!147))))

(assert (=> d!9805 (isStrictlySorted!262 (t!4327 l!1333))))

(assert (=> d!9805 (= (lemmaInsertStrictlySortedNotContainedContent!7 (t!4327 l!1333) newKey!147 newValue!147) lt!20697)))

(declare-fun bs!2282 () Bool)

(assert (= bs!2282 d!9805))

(assert (=> bs!2282 m!42533))

(assert (=> bs!2282 m!42541))

(declare-fun m!42594 () Bool)

(assert (=> bs!2282 m!42594))

(assert (=> bs!2282 m!42565))

(assert (=> bs!2282 m!42565))

(declare-fun m!42599 () Bool)

(assert (=> bs!2282 m!42599))

(assert (=> bs!2282 m!42489))

(assert (=> b!49054 d!9805))

(declare-fun b!49243 () Bool)

(declare-fun e!31620 () Bool)

(declare-fun tp!6508 () Bool)

(assert (=> b!49243 (= e!31620 (and tp_is_empty!2137 tp!6508))))

(assert (=> b!49055 (= tp!6494 e!31620)))

(assert (= (and b!49055 ((_ is Cons!1292) (t!4327 l!1333))) b!49243))

(check-sat (not d!9805) (not b!49089) (not b!49133) (not d!9797) tp_is_empty!2137 (not b!49217) (not b!49129) (not b!49107) (not bm!3811) (not b!49215) (not b!49243) (not b!49201))
(check-sat)
(get-model)

(declare-fun d!9811 () Bool)

(assert (=> d!9811 (= ((_ map or) (content!53 (t!4327 l!1333)) (store ((as const (Array tuple2!1790 Bool)) false) (tuple2!1791 newKey!147 newValue!147) true)) (content!53 (insertStrictlySorted!38 (t!4327 l!1333) newKey!147 newValue!147)))))

(assert (=> d!9811 true))

(declare-fun _$19!23 () Unit!1380)

(assert (=> d!9811 (= (choose!290 (t!4327 l!1333) newKey!147 newValue!147) _$19!23)))

(declare-fun bs!2284 () Bool)

(assert (= bs!2284 d!9811))

(assert (=> bs!2284 m!42541))

(assert (=> bs!2284 m!42489))

(assert (=> bs!2284 m!42565))

(assert (=> bs!2284 m!42565))

(assert (=> bs!2284 m!42599))

(assert (=> d!9805 d!9811))

(declare-fun d!9813 () Bool)

(declare-fun c!6639 () Bool)

(assert (=> d!9813 (= c!6639 ((_ is Nil!1293) (t!4327 l!1333)))))

(declare-fun e!31621 () (InoxSet tuple2!1790))

(assert (=> d!9813 (= (content!53 (t!4327 l!1333)) e!31621)))

(declare-fun b!49245 () Bool)

(assert (=> b!49245 (= e!31621 ((as const (Array tuple2!1790 Bool)) false))))

(declare-fun b!49246 () Bool)

(assert (=> b!49246 (= e!31621 ((_ map or) (store ((as const (Array tuple2!1790 Bool)) false) (h!1872 (t!4327 l!1333)) true) (content!53 (t!4327 (t!4327 l!1333)))))))

(assert (= (and d!9813 c!6639) b!49245))

(assert (= (and d!9813 (not c!6639)) b!49246))

(declare-fun m!42605 () Bool)

(assert (=> b!49246 m!42605))

(declare-fun m!42607 () Bool)

(assert (=> b!49246 m!42607))

(assert (=> d!9805 d!9813))

(declare-fun d!9815 () Bool)

(declare-fun e!31624 () Bool)

(assert (=> d!9815 e!31624))

(declare-fun res!28523 () Bool)

(assert (=> d!9815 (=> (not res!28523) (not e!31624))))

(declare-fun lt!20699 () List!1296)

(assert (=> d!9815 (= res!28523 (isStrictlySorted!262 lt!20699))))

(declare-fun e!31625 () List!1296)

(assert (=> d!9815 (= lt!20699 e!31625)))

(declare-fun c!6643 () Bool)

(assert (=> d!9815 (= c!6643 (and ((_ is Cons!1292) (t!4327 l!1333)) (bvslt (_1!906 (h!1872 (t!4327 l!1333))) newKey!147)))))

(assert (=> d!9815 (isStrictlySorted!262 (t!4327 l!1333))))

(assert (=> d!9815 (= (insertStrictlySorted!38 (t!4327 l!1333) newKey!147 newValue!147) lt!20699)))

(declare-fun bm!3819 () Bool)

(declare-fun call!3822 () List!1296)

(declare-fun call!3824 () List!1296)

(assert (=> bm!3819 (= call!3822 call!3824)))

(declare-fun b!49247 () Bool)

(declare-fun call!3823 () List!1296)

(assert (=> b!49247 (= e!31625 call!3823)))

(declare-fun b!49248 () Bool)

(declare-fun res!28524 () Bool)

(assert (=> b!49248 (=> (not res!28524) (not e!31624))))

(assert (=> b!49248 (= res!28524 (containsKey!123 lt!20699 newKey!147))))

(declare-fun bm!3820 () Bool)

(declare-fun e!31622 () List!1296)

(assert (=> bm!3820 (= call!3823 ($colon$colon!55 e!31622 (ite c!6643 (h!1872 (t!4327 l!1333)) (tuple2!1791 newKey!147 newValue!147))))))

(declare-fun c!6641 () Bool)

(assert (=> bm!3820 (= c!6641 c!6643)))

(declare-fun b!49249 () Bool)

(declare-fun e!31626 () List!1296)

(assert (=> b!49249 (= e!31626 call!3824)))

(declare-fun b!49250 () Bool)

(declare-fun c!6640 () Bool)

(assert (=> b!49250 (= c!6640 (and ((_ is Cons!1292) (t!4327 l!1333)) (bvsgt (_1!906 (h!1872 (t!4327 l!1333))) newKey!147)))))

(declare-fun e!31623 () List!1296)

(assert (=> b!49250 (= e!31626 e!31623)))

(declare-fun b!49251 () Bool)

(declare-fun c!6642 () Bool)

(assert (=> b!49251 (= e!31622 (ite c!6642 (t!4327 (t!4327 l!1333)) (ite c!6640 (Cons!1292 (h!1872 (t!4327 l!1333)) (t!4327 (t!4327 l!1333))) Nil!1293)))))

(declare-fun bm!3821 () Bool)

(assert (=> bm!3821 (= call!3824 call!3823)))

(declare-fun b!49252 () Bool)

(assert (=> b!49252 (= e!31623 call!3822)))

(declare-fun b!49253 () Bool)

(assert (=> b!49253 (= e!31625 e!31626)))

(assert (=> b!49253 (= c!6642 (and ((_ is Cons!1292) (t!4327 l!1333)) (= (_1!906 (h!1872 (t!4327 l!1333))) newKey!147)))))

(declare-fun b!49254 () Bool)

(assert (=> b!49254 (= e!31623 call!3822)))

(declare-fun b!49255 () Bool)

(assert (=> b!49255 (= e!31622 (insertStrictlySorted!38 (t!4327 (t!4327 l!1333)) newKey!147 newValue!147))))

(declare-fun b!49256 () Bool)

(assert (=> b!49256 (= e!31624 (contains!601 lt!20699 (tuple2!1791 newKey!147 newValue!147)))))

(assert (= (and d!9815 c!6643) b!49247))

(assert (= (and d!9815 (not c!6643)) b!49253))

(assert (= (and b!49253 c!6642) b!49249))

(assert (= (and b!49253 (not c!6642)) b!49250))

(assert (= (and b!49250 c!6640) b!49252))

(assert (= (and b!49250 (not c!6640)) b!49254))

(assert (= (or b!49252 b!49254) bm!3819))

(assert (= (or b!49249 bm!3819) bm!3821))

(assert (= (or b!49247 bm!3821) bm!3820))

(assert (= (and bm!3820 c!6641) b!49255))

(assert (= (and bm!3820 (not c!6641)) b!49251))

(assert (= (and d!9815 res!28523) b!49248))

(assert (= (and b!49248 res!28524) b!49256))

(declare-fun m!42609 () Bool)

(assert (=> b!49255 m!42609))

(declare-fun m!42611 () Bool)

(assert (=> b!49248 m!42611))

(declare-fun m!42613 () Bool)

(assert (=> d!9815 m!42613))

(assert (=> d!9815 m!42533))

(declare-fun m!42615 () Bool)

(assert (=> bm!3820 m!42615))

(declare-fun m!42617 () Bool)

(assert (=> b!49256 m!42617))

(assert (=> d!9805 d!9815))

(declare-fun c!6644 () Bool)

(declare-fun d!9817 () Bool)

(assert (=> d!9817 (= c!6644 ((_ is Nil!1293) (insertStrictlySorted!38 (t!4327 l!1333) newKey!147 newValue!147)))))

(declare-fun e!31627 () (InoxSet tuple2!1790))

(assert (=> d!9817 (= (content!53 (insertStrictlySorted!38 (t!4327 l!1333) newKey!147 newValue!147)) e!31627)))

(declare-fun b!49257 () Bool)

(assert (=> b!49257 (= e!31627 ((as const (Array tuple2!1790 Bool)) false))))

(declare-fun b!49258 () Bool)

(assert (=> b!49258 (= e!31627 ((_ map or) (store ((as const (Array tuple2!1790 Bool)) false) (h!1872 (insertStrictlySorted!38 (t!4327 l!1333) newKey!147 newValue!147)) true) (content!53 (t!4327 (insertStrictlySorted!38 (t!4327 l!1333) newKey!147 newValue!147)))))))

(assert (= (and d!9817 c!6644) b!49257))

(assert (= (and d!9817 (not c!6644)) b!49258))

(declare-fun m!42619 () Bool)

(assert (=> b!49258 m!42619))

(declare-fun m!42621 () Bool)

(assert (=> b!49258 m!42621))

(assert (=> d!9805 d!9817))

(declare-fun d!9819 () Bool)

(declare-fun res!28525 () Bool)

(declare-fun e!31628 () Bool)

(assert (=> d!9819 (=> res!28525 e!31628)))

(assert (=> d!9819 (= res!28525 (or ((_ is Nil!1293) (t!4327 l!1333)) ((_ is Nil!1293) (t!4327 (t!4327 l!1333)))))))

(assert (=> d!9819 (= (isStrictlySorted!262 (t!4327 l!1333)) e!31628)))

(declare-fun b!49259 () Bool)

(declare-fun e!31629 () Bool)

(assert (=> b!49259 (= e!31628 e!31629)))

(declare-fun res!28526 () Bool)

(assert (=> b!49259 (=> (not res!28526) (not e!31629))))

(assert (=> b!49259 (= res!28526 (bvslt (_1!906 (h!1872 (t!4327 l!1333))) (_1!906 (h!1872 (t!4327 (t!4327 l!1333))))))))

(declare-fun b!49260 () Bool)

(assert (=> b!49260 (= e!31629 (isStrictlySorted!262 (t!4327 (t!4327 l!1333))))))

(assert (= (and d!9819 (not res!28525)) b!49259))

(assert (= (and b!49259 res!28526) b!49260))

(declare-fun m!42623 () Bool)

(assert (=> b!49260 m!42623))

(assert (=> d!9805 d!9819))

(declare-fun d!9821 () Bool)

(assert (=> d!9821 (= ($colon$colon!55 e!31598 (ite c!6632 (h!1872 l!1333) (tuple2!1791 newKey!147 newValue!147))) (Cons!1292 (ite c!6632 (h!1872 l!1333) (tuple2!1791 newKey!147 newValue!147)) e!31598))))

(assert (=> bm!3811 d!9821))

(assert (=> b!49215 d!9815))

(declare-fun d!9823 () Bool)

(declare-fun lt!20702 () Bool)

(assert (=> d!9823 (= lt!20702 (select (content!53 lt!20687) (tuple2!1791 newKey!147 newValue!147)))))

(declare-fun e!31635 () Bool)

(assert (=> d!9823 (= lt!20702 e!31635)))

(declare-fun res!28531 () Bool)

(assert (=> d!9823 (=> (not res!28531) (not e!31635))))

(assert (=> d!9823 (= res!28531 ((_ is Cons!1292) lt!20687))))

(assert (=> d!9823 (= (contains!601 lt!20687 (tuple2!1791 newKey!147 newValue!147)) lt!20702)))

(declare-fun b!49265 () Bool)

(declare-fun e!31634 () Bool)

(assert (=> b!49265 (= e!31635 e!31634)))

(declare-fun res!28532 () Bool)

(assert (=> b!49265 (=> res!28532 e!31634)))

(assert (=> b!49265 (= res!28532 (= (h!1872 lt!20687) (tuple2!1791 newKey!147 newValue!147)))))

(declare-fun b!49266 () Bool)

(assert (=> b!49266 (= e!31634 (contains!601 (t!4327 lt!20687) (tuple2!1791 newKey!147 newValue!147)))))

(assert (= (and d!9823 res!28531) b!49265))

(assert (= (and b!49265 (not res!28532)) b!49266))

(declare-fun m!42625 () Bool)

(assert (=> d!9823 m!42625))

(declare-fun m!42627 () Bool)

(assert (=> d!9823 m!42627))

(declare-fun m!42629 () Bool)

(assert (=> b!49266 m!42629))

(assert (=> b!49217 d!9823))

(declare-fun d!9825 () Bool)

(declare-fun res!28533 () Bool)

(declare-fun e!31636 () Bool)

(assert (=> d!9825 (=> res!28533 e!31636)))

(assert (=> d!9825 (= res!28533 (or ((_ is Nil!1293) lt!20687) ((_ is Nil!1293) (t!4327 lt!20687))))))

(assert (=> d!9825 (= (isStrictlySorted!262 lt!20687) e!31636)))

(declare-fun b!49267 () Bool)

(declare-fun e!31637 () Bool)

(assert (=> b!49267 (= e!31636 e!31637)))

(declare-fun res!28534 () Bool)

(assert (=> b!49267 (=> (not res!28534) (not e!31637))))

(assert (=> b!49267 (= res!28534 (bvslt (_1!906 (h!1872 lt!20687)) (_1!906 (h!1872 (t!4327 lt!20687)))))))

(declare-fun b!49268 () Bool)

(assert (=> b!49268 (= e!31637 (isStrictlySorted!262 (t!4327 lt!20687)))))

(assert (= (and d!9825 (not res!28533)) b!49267))

(assert (= (and b!49267 res!28534) b!49268))

(declare-fun m!42631 () Bool)

(assert (=> b!49268 m!42631))

(assert (=> d!9797 d!9825))

(assert (=> d!9797 d!9781))

(declare-fun d!9827 () Bool)

(declare-fun res!28535 () Bool)

(declare-fun e!31638 () Bool)

(assert (=> d!9827 (=> res!28535 e!31638)))

(assert (=> d!9827 (= res!28535 (and ((_ is Cons!1292) lt!20687) (= (_1!906 (h!1872 lt!20687)) newKey!147)))))

(assert (=> d!9827 (= (containsKey!123 lt!20687 newKey!147) e!31638)))

(declare-fun b!49269 () Bool)

(declare-fun e!31639 () Bool)

(assert (=> b!49269 (= e!31638 e!31639)))

(declare-fun res!28536 () Bool)

(assert (=> b!49269 (=> (not res!28536) (not e!31639))))

(assert (=> b!49269 (= res!28536 (and (or (not ((_ is Cons!1292) lt!20687)) (bvsle (_1!906 (h!1872 lt!20687)) newKey!147)) ((_ is Cons!1292) lt!20687) (bvslt (_1!906 (h!1872 lt!20687)) newKey!147)))))

(declare-fun b!49270 () Bool)

(assert (=> b!49270 (= e!31639 (containsKey!123 (t!4327 lt!20687) newKey!147))))

(assert (= (and d!9827 (not res!28535)) b!49269))

(assert (= (and b!49269 res!28536) b!49270))

(declare-fun m!42633 () Bool)

(assert (=> b!49270 m!42633))

(assert (=> b!49201 d!9827))

(assert (=> b!49129 d!9813))

(declare-fun d!9829 () Bool)

(declare-fun c!6645 () Bool)

(assert (=> d!9829 (= c!6645 ((_ is Nil!1293) (t!4327 (insertStrictlySorted!38 l!1333 newKey!147 newValue!147))))))

(declare-fun e!31640 () (InoxSet tuple2!1790))

(assert (=> d!9829 (= (content!53 (t!4327 (insertStrictlySorted!38 l!1333 newKey!147 newValue!147))) e!31640)))

(declare-fun b!49271 () Bool)

(assert (=> b!49271 (= e!31640 ((as const (Array tuple2!1790 Bool)) false))))

(declare-fun b!49272 () Bool)

(assert (=> b!49272 (= e!31640 ((_ map or) (store ((as const (Array tuple2!1790 Bool)) false) (h!1872 (t!4327 (insertStrictlySorted!38 l!1333 newKey!147 newValue!147))) true) (content!53 (t!4327 (t!4327 (insertStrictlySorted!38 l!1333 newKey!147 newValue!147))))))))

(assert (= (and d!9829 c!6645) b!49271))

(assert (= (and d!9829 (not c!6645)) b!49272))

(declare-fun m!42635 () Bool)

(assert (=> b!49272 m!42635))

(declare-fun m!42637 () Bool)

(assert (=> b!49272 m!42637))

(assert (=> b!49133 d!9829))

(declare-fun d!9831 () Bool)

(declare-fun res!28537 () Bool)

(declare-fun e!31641 () Bool)

(assert (=> d!9831 (=> res!28537 e!31641)))

(assert (=> d!9831 (= res!28537 (and ((_ is Cons!1292) (t!4327 l!1333)) (= (_1!906 (h!1872 (t!4327 l!1333))) newKey!147)))))

(assert (=> d!9831 (= (containsKey!123 (t!4327 l!1333) newKey!147) e!31641)))

(declare-fun b!49273 () Bool)

(declare-fun e!31642 () Bool)

(assert (=> b!49273 (= e!31641 e!31642)))

(declare-fun res!28538 () Bool)

(assert (=> b!49273 (=> (not res!28538) (not e!31642))))

(assert (=> b!49273 (= res!28538 (and (or (not ((_ is Cons!1292) (t!4327 l!1333))) (bvsle (_1!906 (h!1872 (t!4327 l!1333))) newKey!147)) ((_ is Cons!1292) (t!4327 l!1333)) (bvslt (_1!906 (h!1872 (t!4327 l!1333))) newKey!147)))))

(declare-fun b!49274 () Bool)

(assert (=> b!49274 (= e!31642 (containsKey!123 (t!4327 (t!4327 l!1333)) newKey!147))))

(assert (= (and d!9831 (not res!28537)) b!49273))

(assert (= (and b!49273 res!28538) b!49274))

(declare-fun m!42639 () Bool)

(assert (=> b!49274 m!42639))

(assert (=> b!49089 d!9831))

(assert (=> b!49107 d!9819))

(declare-fun b!49275 () Bool)

(declare-fun e!31643 () Bool)

(declare-fun tp!6510 () Bool)

(assert (=> b!49275 (= e!31643 (and tp_is_empty!2137 tp!6510))))

(assert (=> b!49243 (= tp!6508 e!31643)))

(assert (= (and b!49243 ((_ is Cons!1292) (t!4327 (t!4327 l!1333)))) b!49275))

(check-sat (not b!49255) (not d!9815) (not b!49274) (not b!49260) (not b!49258) (not b!49268) tp_is_empty!2137 (not b!49270) (not b!49256) (not d!9823) (not b!49272) (not b!49248) (not b!49275) (not d!9811) (not b!49266) (not bm!3820) (not b!49246))
(check-sat)
