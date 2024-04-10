; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7716 () Bool)

(assert start!7716)

(declare-fun b!49123 () Bool)

(declare-fun e!31549 () Bool)

(declare-fun newKey!147 () (_ BitVec 64))

(declare-datatypes ((B!988 0))(
  ( (B!989 (val!1114 Int)) )
))
(declare-fun newValue!147 () B!988)

(declare-datatypes ((tuple2!1810 0))(
  ( (tuple2!1811 (_1!916 (_ BitVec 64)) (_2!916 B!988)) )
))
(declare-datatypes ((List!1311 0))(
  ( (Nil!1308) (Cons!1307 (h!1887 tuple2!1810) (t!4342 List!1311)) )
))
(declare-fun l!1333 () List!1311)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!53 (List!1311) (InoxSet tuple2!1810))

(declare-fun insertStrictlySorted!38 (List!1311 (_ BitVec 64) B!988) List!1311)

(assert (=> b!49123 (= e!31549 (not (= ((_ map or) (content!53 l!1333) (store ((as const (Array tuple2!1810 Bool)) false) (tuple2!1811 newKey!147 newValue!147) true)) (content!53 (insertStrictlySorted!38 l!1333 newKey!147 newValue!147)))))))

(declare-datatypes ((Unit!1371 0))(
  ( (Unit!1372) )
))
(declare-fun lt!20720 () Unit!1371)

(declare-fun lemmaInsertStrictlySortedNotContainedContent!8 (List!1311 (_ BitVec 64) B!988) Unit!1371)

(assert (=> b!49123 (= lt!20720 (lemmaInsertStrictlySortedNotContainedContent!8 (t!4342 l!1333) newKey!147 newValue!147))))

(declare-fun b!49122 () Bool)

(declare-fun res!28484 () Bool)

(assert (=> b!49122 (=> (not res!28484) (not e!31549))))

(get-info :version)

(assert (=> b!49122 (= res!28484 (not ((_ is Nil!1308) l!1333)))))

(declare-fun b!49124 () Bool)

(declare-fun e!31548 () Bool)

(declare-fun tp_is_empty!2139 () Bool)

(declare-fun tp!6497 () Bool)

(assert (=> b!49124 (= e!31548 (and tp_is_empty!2139 tp!6497))))

(declare-fun b!49121 () Bool)

(declare-fun res!28482 () Bool)

(assert (=> b!49121 (=> (not res!28482) (not e!31549))))

(declare-fun containsKey!124 (List!1311 (_ BitVec 64)) Bool)

(assert (=> b!49121 (= res!28482 (not (containsKey!124 l!1333 newKey!147)))))

(declare-fun res!28483 () Bool)

(assert (=> start!7716 (=> (not res!28483) (not e!31549))))

(declare-fun isStrictlySorted!275 (List!1311) Bool)

(assert (=> start!7716 (= res!28483 (isStrictlySorted!275 l!1333))))

(assert (=> start!7716 e!31549))

(assert (=> start!7716 e!31548))

(assert (=> start!7716 true))

(assert (=> start!7716 tp_is_empty!2139))

(assert (= (and start!7716 res!28483) b!49121))

(assert (= (and b!49121 res!28482) b!49122))

(assert (= (and b!49122 res!28484) b!49123))

(assert (= (and start!7716 ((_ is Cons!1307) l!1333)) b!49124))

(declare-fun m!42623 () Bool)

(assert (=> b!49123 m!42623))

(declare-fun m!42625 () Bool)

(assert (=> b!49123 m!42625))

(declare-fun m!42627 () Bool)

(assert (=> b!49123 m!42627))

(assert (=> b!49123 m!42627))

(declare-fun m!42629 () Bool)

(assert (=> b!49123 m!42629))

(declare-fun m!42631 () Bool)

(assert (=> b!49123 m!42631))

(declare-fun m!42633 () Bool)

(assert (=> b!49121 m!42633))

(declare-fun m!42635 () Bool)

(assert (=> start!7716 m!42635))

(check-sat (not b!49124) (not b!49123) (not b!49121) tp_is_empty!2139 (not start!7716))
(check-sat)
(get-model)

(declare-fun d!9787 () Bool)

(declare-fun c!6613 () Bool)

(assert (=> d!9787 (= c!6613 ((_ is Nil!1308) l!1333))))

(declare-fun e!31562 () (InoxSet tuple2!1810))

(assert (=> d!9787 (= (content!53 l!1333) e!31562)))

(declare-fun b!49149 () Bool)

(assert (=> b!49149 (= e!31562 ((as const (Array tuple2!1810 Bool)) false))))

(declare-fun b!49150 () Bool)

(assert (=> b!49150 (= e!31562 ((_ map or) (store ((as const (Array tuple2!1810 Bool)) false) (h!1887 l!1333) true) (content!53 (t!4342 l!1333))))))

(assert (= (and d!9787 c!6613) b!49149))

(assert (= (and d!9787 (not c!6613)) b!49150))

(declare-fun m!42651 () Bool)

(assert (=> b!49150 m!42651))

(declare-fun m!42653 () Bool)

(assert (=> b!49150 m!42653))

(assert (=> b!49123 d!9787))

(declare-fun d!9793 () Bool)

(declare-fun c!6615 () Bool)

(assert (=> d!9793 (= c!6615 ((_ is Nil!1308) (insertStrictlySorted!38 l!1333 newKey!147 newValue!147)))))

(declare-fun e!31564 () (InoxSet tuple2!1810))

(assert (=> d!9793 (= (content!53 (insertStrictlySorted!38 l!1333 newKey!147 newValue!147)) e!31564)))

(declare-fun b!49153 () Bool)

(assert (=> b!49153 (= e!31564 ((as const (Array tuple2!1810 Bool)) false))))

(declare-fun b!49154 () Bool)

(assert (=> b!49154 (= e!31564 ((_ map or) (store ((as const (Array tuple2!1810 Bool)) false) (h!1887 (insertStrictlySorted!38 l!1333 newKey!147 newValue!147)) true) (content!53 (t!4342 (insertStrictlySorted!38 l!1333 newKey!147 newValue!147)))))))

(assert (= (and d!9793 c!6615) b!49153))

(assert (= (and d!9793 (not c!6615)) b!49154))

(declare-fun m!42659 () Bool)

(assert (=> b!49154 m!42659))

(declare-fun m!42661 () Bool)

(assert (=> b!49154 m!42661))

(assert (=> b!49123 d!9793))

(declare-fun b!49221 () Bool)

(declare-fun c!6643 () Bool)

(assert (=> b!49221 (= c!6643 (and ((_ is Cons!1307) l!1333) (bvsgt (_1!916 (h!1887 l!1333)) newKey!147)))))

(declare-fun e!31602 () List!1311)

(declare-fun e!31598 () List!1311)

(assert (=> b!49221 (= e!31602 e!31598)))

(declare-fun bm!3824 () Bool)

(declare-fun call!3829 () List!1311)

(declare-fun call!3828 () List!1311)

(assert (=> bm!3824 (= call!3829 call!3828)))

(declare-fun b!49222 () Bool)

(declare-fun res!28506 () Bool)

(declare-fun e!31601 () Bool)

(assert (=> b!49222 (=> (not res!28506) (not e!31601))))

(declare-fun lt!20730 () List!1311)

(assert (=> b!49222 (= res!28506 (containsKey!124 lt!20730 newKey!147))))

(declare-fun e!31600 () List!1311)

(declare-fun c!6645 () Bool)

(declare-fun b!49223 () Bool)

(assert (=> b!49223 (= e!31600 (ite c!6645 (t!4342 l!1333) (ite c!6643 (Cons!1307 (h!1887 l!1333) (t!4342 l!1333)) Nil!1308)))))

(declare-fun bm!3825 () Bool)

(declare-fun call!3827 () List!1311)

(assert (=> bm!3825 (= call!3827 call!3829)))

(declare-fun b!49224 () Bool)

(assert (=> b!49224 (= e!31600 (insertStrictlySorted!38 (t!4342 l!1333) newKey!147 newValue!147))))

(declare-fun b!49225 () Bool)

(assert (=> b!49225 (= e!31598 call!3827)))

(declare-fun d!9797 () Bool)

(assert (=> d!9797 e!31601))

(declare-fun res!28507 () Bool)

(assert (=> d!9797 (=> (not res!28507) (not e!31601))))

(assert (=> d!9797 (= res!28507 (isStrictlySorted!275 lt!20730))))

(declare-fun e!31599 () List!1311)

(assert (=> d!9797 (= lt!20730 e!31599)))

(declare-fun c!6644 () Bool)

(assert (=> d!9797 (= c!6644 (and ((_ is Cons!1307) l!1333) (bvslt (_1!916 (h!1887 l!1333)) newKey!147)))))

(assert (=> d!9797 (isStrictlySorted!275 l!1333)))

(assert (=> d!9797 (= (insertStrictlySorted!38 l!1333 newKey!147 newValue!147) lt!20730)))

(declare-fun b!49226 () Bool)

(assert (=> b!49226 (= e!31599 e!31602)))

(assert (=> b!49226 (= c!6645 (and ((_ is Cons!1307) l!1333) (= (_1!916 (h!1887 l!1333)) newKey!147)))))

(declare-fun b!49227 () Bool)

(assert (=> b!49227 (= e!31598 call!3827)))

(declare-fun bm!3826 () Bool)

(declare-fun $colon$colon!58 (List!1311 tuple2!1810) List!1311)

(assert (=> bm!3826 (= call!3828 ($colon$colon!58 e!31600 (ite c!6644 (h!1887 l!1333) (tuple2!1811 newKey!147 newValue!147))))))

(declare-fun c!6646 () Bool)

(assert (=> bm!3826 (= c!6646 c!6644)))

(declare-fun b!49228 () Bool)

(assert (=> b!49228 (= e!31602 call!3829)))

(declare-fun b!49229 () Bool)

(declare-fun contains!610 (List!1311 tuple2!1810) Bool)

(assert (=> b!49229 (= e!31601 (contains!610 lt!20730 (tuple2!1811 newKey!147 newValue!147)))))

(declare-fun b!49230 () Bool)

(assert (=> b!49230 (= e!31599 call!3828)))

(assert (= (and d!9797 c!6644) b!49230))

(assert (= (and d!9797 (not c!6644)) b!49226))

(assert (= (and b!49226 c!6645) b!49228))

(assert (= (and b!49226 (not c!6645)) b!49221))

(assert (= (and b!49221 c!6643) b!49225))

(assert (= (and b!49221 (not c!6643)) b!49227))

(assert (= (or b!49225 b!49227) bm!3825))

(assert (= (or b!49228 bm!3825) bm!3824))

(assert (= (or b!49230 bm!3824) bm!3826))

(assert (= (and bm!3826 c!6646) b!49224))

(assert (= (and bm!3826 (not c!6646)) b!49223))

(assert (= (and d!9797 res!28507) b!49222))

(assert (= (and b!49222 res!28506) b!49229))

(declare-fun m!42675 () Bool)

(assert (=> b!49229 m!42675))

(declare-fun m!42677 () Bool)

(assert (=> b!49222 m!42677))

(declare-fun m!42679 () Bool)

(assert (=> d!9797 m!42679))

(assert (=> d!9797 m!42635))

(declare-fun m!42683 () Bool)

(assert (=> bm!3826 m!42683))

(declare-fun m!42687 () Bool)

(assert (=> b!49224 m!42687))

(assert (=> b!49123 d!9797))

(declare-fun d!9805 () Bool)

(assert (=> d!9805 (= ((_ map or) (content!53 (t!4342 l!1333)) (store ((as const (Array tuple2!1810 Bool)) false) (tuple2!1811 newKey!147 newValue!147) true)) (content!53 (insertStrictlySorted!38 (t!4342 l!1333) newKey!147 newValue!147)))))

(declare-fun lt!20740 () Unit!1371)

(declare-fun choose!283 (List!1311 (_ BitVec 64) B!988) Unit!1371)

(assert (=> d!9805 (= lt!20740 (choose!283 (t!4342 l!1333) newKey!147 newValue!147))))

(assert (=> d!9805 (isStrictlySorted!275 (t!4342 l!1333))))

(assert (=> d!9805 (= (lemmaInsertStrictlySortedNotContainedContent!8 (t!4342 l!1333) newKey!147 newValue!147) lt!20740)))

(declare-fun bs!2281 () Bool)

(assert (= bs!2281 d!9805))

(declare-fun m!42705 () Bool)

(assert (=> bs!2281 m!42705))

(assert (=> bs!2281 m!42687))

(assert (=> bs!2281 m!42623))

(assert (=> bs!2281 m!42687))

(declare-fun m!42717 () Bool)

(assert (=> bs!2281 m!42717))

(assert (=> bs!2281 m!42653))

(declare-fun m!42721 () Bool)

(assert (=> bs!2281 m!42721))

(assert (=> b!49123 d!9805))

(declare-fun d!9815 () Bool)

(declare-fun res!28524 () Bool)

(declare-fun e!31625 () Bool)

(assert (=> d!9815 (=> res!28524 e!31625)))

(assert (=> d!9815 (= res!28524 (or ((_ is Nil!1308) l!1333) ((_ is Nil!1308) (t!4342 l!1333))))))

(assert (=> d!9815 (= (isStrictlySorted!275 l!1333) e!31625)))

(declare-fun b!49263 () Bool)

(declare-fun e!31626 () Bool)

(assert (=> b!49263 (= e!31625 e!31626)))

(declare-fun res!28525 () Bool)

(assert (=> b!49263 (=> (not res!28525) (not e!31626))))

(assert (=> b!49263 (= res!28525 (bvslt (_1!916 (h!1887 l!1333)) (_1!916 (h!1887 (t!4342 l!1333)))))))

(declare-fun b!49264 () Bool)

(assert (=> b!49264 (= e!31626 (isStrictlySorted!275 (t!4342 l!1333)))))

(assert (= (and d!9815 (not res!28524)) b!49263))

(assert (= (and b!49263 res!28525) b!49264))

(assert (=> b!49264 m!42721))

(assert (=> start!7716 d!9815))

(declare-fun d!9817 () Bool)

(declare-fun res!28542 () Bool)

(declare-fun e!31643 () Bool)

(assert (=> d!9817 (=> res!28542 e!31643)))

(assert (=> d!9817 (= res!28542 (and ((_ is Cons!1307) l!1333) (= (_1!916 (h!1887 l!1333)) newKey!147)))))

(assert (=> d!9817 (= (containsKey!124 l!1333 newKey!147) e!31643)))

(declare-fun b!49281 () Bool)

(declare-fun e!31644 () Bool)

(assert (=> b!49281 (= e!31643 e!31644)))

(declare-fun res!28543 () Bool)

(assert (=> b!49281 (=> (not res!28543) (not e!31644))))

(assert (=> b!49281 (= res!28543 (and (or (not ((_ is Cons!1307) l!1333)) (bvsle (_1!916 (h!1887 l!1333)) newKey!147)) ((_ is Cons!1307) l!1333) (bvslt (_1!916 (h!1887 l!1333)) newKey!147)))))

(declare-fun b!49282 () Bool)

(assert (=> b!49282 (= e!31644 (containsKey!124 (t!4342 l!1333) newKey!147))))

(assert (= (and d!9817 (not res!28542)) b!49281))

(assert (= (and b!49281 res!28543) b!49282))

(declare-fun m!42727 () Bool)

(assert (=> b!49282 m!42727))

(assert (=> b!49121 d!9817))

(declare-fun b!49299 () Bool)

(declare-fun e!31655 () Bool)

(declare-fun tp!6507 () Bool)

(assert (=> b!49299 (= e!31655 (and tp_is_empty!2139 tp!6507))))

(assert (=> b!49124 (= tp!6497 e!31655)))

(assert (= (and b!49124 ((_ is Cons!1307) (t!4342 l!1333))) b!49299))

(check-sat (not bm!3826) (not b!49150) (not b!49282) tp_is_empty!2139 (not b!49224) (not b!49154) (not b!49299) (not b!49229) (not d!9797) (not b!49264) (not b!49222) (not d!9805))
(check-sat)
(get-model)

(declare-fun d!9823 () Bool)

(declare-fun res!28548 () Bool)

(declare-fun e!31658 () Bool)

(assert (=> d!9823 (=> res!28548 e!31658)))

(assert (=> d!9823 (= res!28548 (or ((_ is Nil!1308) lt!20730) ((_ is Nil!1308) (t!4342 lt!20730))))))

(assert (=> d!9823 (= (isStrictlySorted!275 lt!20730) e!31658)))

(declare-fun b!49302 () Bool)

(declare-fun e!31659 () Bool)

(assert (=> b!49302 (= e!31658 e!31659)))

(declare-fun res!28549 () Bool)

(assert (=> b!49302 (=> (not res!28549) (not e!31659))))

(assert (=> b!49302 (= res!28549 (bvslt (_1!916 (h!1887 lt!20730)) (_1!916 (h!1887 (t!4342 lt!20730)))))))

(declare-fun b!49303 () Bool)

(assert (=> b!49303 (= e!31659 (isStrictlySorted!275 (t!4342 lt!20730)))))

(assert (= (and d!9823 (not res!28548)) b!49302))

(assert (= (and b!49302 res!28549) b!49303))

(declare-fun m!42729 () Bool)

(assert (=> b!49303 m!42729))

(assert (=> d!9797 d!9823))

(assert (=> d!9797 d!9815))

(declare-fun d!9825 () Bool)

(assert (=> d!9825 (= ((_ map or) (content!53 (t!4342 l!1333)) (store ((as const (Array tuple2!1810 Bool)) false) (tuple2!1811 newKey!147 newValue!147) true)) (content!53 (insertStrictlySorted!38 (t!4342 l!1333) newKey!147 newValue!147)))))

(assert (=> d!9825 true))

(declare-fun _$19!23 () Unit!1371)

(assert (=> d!9825 (= (choose!283 (t!4342 l!1333) newKey!147 newValue!147) _$19!23)))

(declare-fun bs!2284 () Bool)

(assert (= bs!2284 d!9825))

(assert (=> bs!2284 m!42653))

(assert (=> bs!2284 m!42623))

(assert (=> bs!2284 m!42687))

(assert (=> bs!2284 m!42687))

(assert (=> bs!2284 m!42717))

(assert (=> d!9805 d!9825))

(declare-fun d!9827 () Bool)

(declare-fun c!6655 () Bool)

(assert (=> d!9827 (= c!6655 ((_ is Nil!1308) (t!4342 l!1333)))))

(declare-fun e!31660 () (InoxSet tuple2!1810))

(assert (=> d!9827 (= (content!53 (t!4342 l!1333)) e!31660)))

(declare-fun b!49304 () Bool)

(assert (=> b!49304 (= e!31660 ((as const (Array tuple2!1810 Bool)) false))))

(declare-fun b!49305 () Bool)

(assert (=> b!49305 (= e!31660 ((_ map or) (store ((as const (Array tuple2!1810 Bool)) false) (h!1887 (t!4342 l!1333)) true) (content!53 (t!4342 (t!4342 l!1333)))))))

(assert (= (and d!9827 c!6655) b!49304))

(assert (= (and d!9827 (not c!6655)) b!49305))

(declare-fun m!42731 () Bool)

(assert (=> b!49305 m!42731))

(declare-fun m!42733 () Bool)

(assert (=> b!49305 m!42733))

(assert (=> d!9805 d!9827))

(declare-fun b!49306 () Bool)

(declare-fun c!6656 () Bool)

(assert (=> b!49306 (= c!6656 (and ((_ is Cons!1307) (t!4342 l!1333)) (bvsgt (_1!916 (h!1887 (t!4342 l!1333))) newKey!147)))))

(declare-fun e!31665 () List!1311)

(declare-fun e!31661 () List!1311)

(assert (=> b!49306 (= e!31665 e!31661)))

(declare-fun bm!3833 () Bool)

(declare-fun call!3838 () List!1311)

(declare-fun call!3837 () List!1311)

(assert (=> bm!3833 (= call!3838 call!3837)))

(declare-fun b!49307 () Bool)

(declare-fun res!28550 () Bool)

(declare-fun e!31664 () Bool)

(assert (=> b!49307 (=> (not res!28550) (not e!31664))))

(declare-fun lt!20742 () List!1311)

(assert (=> b!49307 (= res!28550 (containsKey!124 lt!20742 newKey!147))))

(declare-fun e!31663 () List!1311)

(declare-fun c!6658 () Bool)

(declare-fun b!49308 () Bool)

(assert (=> b!49308 (= e!31663 (ite c!6658 (t!4342 (t!4342 l!1333)) (ite c!6656 (Cons!1307 (h!1887 (t!4342 l!1333)) (t!4342 (t!4342 l!1333))) Nil!1308)))))

(declare-fun bm!3834 () Bool)

(declare-fun call!3836 () List!1311)

(assert (=> bm!3834 (= call!3836 call!3838)))

(declare-fun b!49309 () Bool)

(assert (=> b!49309 (= e!31663 (insertStrictlySorted!38 (t!4342 (t!4342 l!1333)) newKey!147 newValue!147))))

(declare-fun b!49310 () Bool)

(assert (=> b!49310 (= e!31661 call!3836)))

(declare-fun d!9829 () Bool)

(assert (=> d!9829 e!31664))

(declare-fun res!28551 () Bool)

(assert (=> d!9829 (=> (not res!28551) (not e!31664))))

(assert (=> d!9829 (= res!28551 (isStrictlySorted!275 lt!20742))))

(declare-fun e!31662 () List!1311)

(assert (=> d!9829 (= lt!20742 e!31662)))

(declare-fun c!6657 () Bool)

(assert (=> d!9829 (= c!6657 (and ((_ is Cons!1307) (t!4342 l!1333)) (bvslt (_1!916 (h!1887 (t!4342 l!1333))) newKey!147)))))

(assert (=> d!9829 (isStrictlySorted!275 (t!4342 l!1333))))

(assert (=> d!9829 (= (insertStrictlySorted!38 (t!4342 l!1333) newKey!147 newValue!147) lt!20742)))

(declare-fun b!49311 () Bool)

(assert (=> b!49311 (= e!31662 e!31665)))

(assert (=> b!49311 (= c!6658 (and ((_ is Cons!1307) (t!4342 l!1333)) (= (_1!916 (h!1887 (t!4342 l!1333))) newKey!147)))))

(declare-fun b!49312 () Bool)

(assert (=> b!49312 (= e!31661 call!3836)))

(declare-fun bm!3835 () Bool)

(assert (=> bm!3835 (= call!3837 ($colon$colon!58 e!31663 (ite c!6657 (h!1887 (t!4342 l!1333)) (tuple2!1811 newKey!147 newValue!147))))))

(declare-fun c!6659 () Bool)

(assert (=> bm!3835 (= c!6659 c!6657)))

(declare-fun b!49313 () Bool)

(assert (=> b!49313 (= e!31665 call!3838)))

(declare-fun b!49314 () Bool)

(assert (=> b!49314 (= e!31664 (contains!610 lt!20742 (tuple2!1811 newKey!147 newValue!147)))))

(declare-fun b!49315 () Bool)

(assert (=> b!49315 (= e!31662 call!3837)))

(assert (= (and d!9829 c!6657) b!49315))

(assert (= (and d!9829 (not c!6657)) b!49311))

(assert (= (and b!49311 c!6658) b!49313))

(assert (= (and b!49311 (not c!6658)) b!49306))

(assert (= (and b!49306 c!6656) b!49310))

(assert (= (and b!49306 (not c!6656)) b!49312))

(assert (= (or b!49310 b!49312) bm!3834))

(assert (= (or b!49313 bm!3834) bm!3833))

(assert (= (or b!49315 bm!3833) bm!3835))

(assert (= (and bm!3835 c!6659) b!49309))

(assert (= (and bm!3835 (not c!6659)) b!49308))

(assert (= (and d!9829 res!28551) b!49307))

(assert (= (and b!49307 res!28550) b!49314))

(declare-fun m!42735 () Bool)

(assert (=> b!49314 m!42735))

(declare-fun m!42737 () Bool)

(assert (=> b!49307 m!42737))

(declare-fun m!42739 () Bool)

(assert (=> d!9829 m!42739))

(assert (=> d!9829 m!42721))

(declare-fun m!42741 () Bool)

(assert (=> bm!3835 m!42741))

(declare-fun m!42743 () Bool)

(assert (=> b!49309 m!42743))

(assert (=> d!9805 d!9829))

(declare-fun d!9833 () Bool)

(declare-fun c!6660 () Bool)

(assert (=> d!9833 (= c!6660 ((_ is Nil!1308) (insertStrictlySorted!38 (t!4342 l!1333) newKey!147 newValue!147)))))

(declare-fun e!31666 () (InoxSet tuple2!1810))

(assert (=> d!9833 (= (content!53 (insertStrictlySorted!38 (t!4342 l!1333) newKey!147 newValue!147)) e!31666)))

(declare-fun b!49316 () Bool)

(assert (=> b!49316 (= e!31666 ((as const (Array tuple2!1810 Bool)) false))))

(declare-fun b!49317 () Bool)

(assert (=> b!49317 (= e!31666 ((_ map or) (store ((as const (Array tuple2!1810 Bool)) false) (h!1887 (insertStrictlySorted!38 (t!4342 l!1333) newKey!147 newValue!147)) true) (content!53 (t!4342 (insertStrictlySorted!38 (t!4342 l!1333) newKey!147 newValue!147)))))))

(assert (= (and d!9833 c!6660) b!49316))

(assert (= (and d!9833 (not c!6660)) b!49317))

(declare-fun m!42745 () Bool)

(assert (=> b!49317 m!42745))

(declare-fun m!42747 () Bool)

(assert (=> b!49317 m!42747))

(assert (=> d!9805 d!9833))

(declare-fun d!9835 () Bool)

(declare-fun res!28552 () Bool)

(declare-fun e!31667 () Bool)

(assert (=> d!9835 (=> res!28552 e!31667)))

(assert (=> d!9835 (= res!28552 (or ((_ is Nil!1308) (t!4342 l!1333)) ((_ is Nil!1308) (t!4342 (t!4342 l!1333)))))))

(assert (=> d!9835 (= (isStrictlySorted!275 (t!4342 l!1333)) e!31667)))

(declare-fun b!49318 () Bool)

(declare-fun e!31668 () Bool)

(assert (=> b!49318 (= e!31667 e!31668)))

(declare-fun res!28553 () Bool)

(assert (=> b!49318 (=> (not res!28553) (not e!31668))))

(assert (=> b!49318 (= res!28553 (bvslt (_1!916 (h!1887 (t!4342 l!1333))) (_1!916 (h!1887 (t!4342 (t!4342 l!1333))))))))

(declare-fun b!49319 () Bool)

(assert (=> b!49319 (= e!31668 (isStrictlySorted!275 (t!4342 (t!4342 l!1333))))))

(assert (= (and d!9835 (not res!28552)) b!49318))

(assert (= (and b!49318 res!28553) b!49319))

(declare-fun m!42749 () Bool)

(assert (=> b!49319 m!42749))

(assert (=> d!9805 d!9835))

(declare-fun c!6661 () Bool)

(declare-fun d!9837 () Bool)

(assert (=> d!9837 (= c!6661 ((_ is Nil!1308) (t!4342 (insertStrictlySorted!38 l!1333 newKey!147 newValue!147))))))

(declare-fun e!31669 () (InoxSet tuple2!1810))

(assert (=> d!9837 (= (content!53 (t!4342 (insertStrictlySorted!38 l!1333 newKey!147 newValue!147))) e!31669)))

(declare-fun b!49320 () Bool)

(assert (=> b!49320 (= e!31669 ((as const (Array tuple2!1810 Bool)) false))))

(declare-fun b!49321 () Bool)

(assert (=> b!49321 (= e!31669 ((_ map or) (store ((as const (Array tuple2!1810 Bool)) false) (h!1887 (t!4342 (insertStrictlySorted!38 l!1333 newKey!147 newValue!147))) true) (content!53 (t!4342 (t!4342 (insertStrictlySorted!38 l!1333 newKey!147 newValue!147))))))))

(assert (= (and d!9837 c!6661) b!49320))

(assert (= (and d!9837 (not c!6661)) b!49321))

(declare-fun m!42751 () Bool)

(assert (=> b!49321 m!42751))

(declare-fun m!42753 () Bool)

(assert (=> b!49321 m!42753))

(assert (=> b!49154 d!9837))

(declare-fun d!9839 () Bool)

(assert (=> d!9839 (= ($colon$colon!58 e!31600 (ite c!6644 (h!1887 l!1333) (tuple2!1811 newKey!147 newValue!147))) (Cons!1307 (ite c!6644 (h!1887 l!1333) (tuple2!1811 newKey!147 newValue!147)) e!31600))))

(assert (=> bm!3826 d!9839))

(declare-fun d!9841 () Bool)

(declare-fun res!28554 () Bool)

(declare-fun e!31670 () Bool)

(assert (=> d!9841 (=> res!28554 e!31670)))

(assert (=> d!9841 (= res!28554 (and ((_ is Cons!1307) (t!4342 l!1333)) (= (_1!916 (h!1887 (t!4342 l!1333))) newKey!147)))))

(assert (=> d!9841 (= (containsKey!124 (t!4342 l!1333) newKey!147) e!31670)))

(declare-fun b!49322 () Bool)

(declare-fun e!31671 () Bool)

(assert (=> b!49322 (= e!31670 e!31671)))

(declare-fun res!28555 () Bool)

(assert (=> b!49322 (=> (not res!28555) (not e!31671))))

(assert (=> b!49322 (= res!28555 (and (or (not ((_ is Cons!1307) (t!4342 l!1333))) (bvsle (_1!916 (h!1887 (t!4342 l!1333))) newKey!147)) ((_ is Cons!1307) (t!4342 l!1333)) (bvslt (_1!916 (h!1887 (t!4342 l!1333))) newKey!147)))))

(declare-fun b!49323 () Bool)

(assert (=> b!49323 (= e!31671 (containsKey!124 (t!4342 (t!4342 l!1333)) newKey!147))))

(assert (= (and d!9841 (not res!28554)) b!49322))

(assert (= (and b!49322 res!28555) b!49323))

(declare-fun m!42755 () Bool)

(assert (=> b!49323 m!42755))

(assert (=> b!49282 d!9841))

(assert (=> b!49264 d!9835))

(assert (=> b!49224 d!9829))

(declare-fun d!9845 () Bool)

(declare-fun lt!20746 () Bool)

(assert (=> d!9845 (= lt!20746 (select (content!53 lt!20730) (tuple2!1811 newKey!147 newValue!147)))))

(declare-fun e!31686 () Bool)

(assert (=> d!9845 (= lt!20746 e!31686)))

(declare-fun res!28564 () Bool)

(assert (=> d!9845 (=> (not res!28564) (not e!31686))))

(assert (=> d!9845 (= res!28564 ((_ is Cons!1307) lt!20730))))

(assert (=> d!9845 (= (contains!610 lt!20730 (tuple2!1811 newKey!147 newValue!147)) lt!20746)))

(declare-fun b!49344 () Bool)

(declare-fun e!31685 () Bool)

(assert (=> b!49344 (= e!31686 e!31685)))

(declare-fun res!28565 () Bool)

(assert (=> b!49344 (=> res!28565 e!31685)))

(assert (=> b!49344 (= res!28565 (= (h!1887 lt!20730) (tuple2!1811 newKey!147 newValue!147)))))

(declare-fun b!49345 () Bool)

(assert (=> b!49345 (= e!31685 (contains!610 (t!4342 lt!20730) (tuple2!1811 newKey!147 newValue!147)))))

(assert (= (and d!9845 res!28564) b!49344))

(assert (= (and b!49344 (not res!28565)) b!49345))

(declare-fun m!42777 () Bool)

(assert (=> d!9845 m!42777))

(declare-fun m!42779 () Bool)

(assert (=> d!9845 m!42779))

(declare-fun m!42781 () Bool)

(assert (=> b!49345 m!42781))

(assert (=> b!49229 d!9845))

(assert (=> b!49150 d!9827))

(declare-fun d!9855 () Bool)

(declare-fun res!28566 () Bool)

(declare-fun e!31687 () Bool)

(assert (=> d!9855 (=> res!28566 e!31687)))

(assert (=> d!9855 (= res!28566 (and ((_ is Cons!1307) lt!20730) (= (_1!916 (h!1887 lt!20730)) newKey!147)))))

(assert (=> d!9855 (= (containsKey!124 lt!20730 newKey!147) e!31687)))

(declare-fun b!49346 () Bool)

(declare-fun e!31688 () Bool)

(assert (=> b!49346 (= e!31687 e!31688)))

(declare-fun res!28567 () Bool)

(assert (=> b!49346 (=> (not res!28567) (not e!31688))))

(assert (=> b!49346 (= res!28567 (and (or (not ((_ is Cons!1307) lt!20730)) (bvsle (_1!916 (h!1887 lt!20730)) newKey!147)) ((_ is Cons!1307) lt!20730) (bvslt (_1!916 (h!1887 lt!20730)) newKey!147)))))

(declare-fun b!49347 () Bool)

(assert (=> b!49347 (= e!31688 (containsKey!124 (t!4342 lt!20730) newKey!147))))

(assert (= (and d!9855 (not res!28566)) b!49346))

(assert (= (and b!49346 res!28567) b!49347))

(declare-fun m!42783 () Bool)

(assert (=> b!49347 m!42783))

(assert (=> b!49222 d!9855))

(declare-fun b!49348 () Bool)

(declare-fun e!31689 () Bool)

(declare-fun tp!6510 () Bool)

(assert (=> b!49348 (= e!31689 (and tp_is_empty!2139 tp!6510))))

(assert (=> b!49299 (= tp!6507 e!31689)))

(assert (= (and b!49299 ((_ is Cons!1307) (t!4342 (t!4342 l!1333)))) b!49348))

(check-sat (not b!49345) (not b!49347) tp_is_empty!2139 (not b!49307) (not bm!3835) (not b!49305) (not d!9845) (not d!9825) (not b!49321) (not d!9829) (not b!49323) (not b!49317) (not b!49303) (not b!49319) (not b!49314) (not b!49348) (not b!49309))
(check-sat)
