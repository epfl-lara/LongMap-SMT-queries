; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85318 () Bool)

(assert start!85318)

(declare-fun res!663700 () Bool)

(declare-fun e!560311 () Bool)

(assert (=> start!85318 (=> (not res!663700) (not e!560311))))

(declare-datatypes ((List!20912 0))(
  ( (Nil!20909) (Cons!20908 (h!22070 (_ BitVec 64)) (t!29913 List!20912)) )
))
(declare-fun l!3519 () List!20912)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5773 (List!20912 (_ BitVec 64)) Bool)

(assert (=> start!85318 (= res!663700 (not (contains!5773 l!3519 e!29)))))

(assert (=> start!85318 e!560311))

(assert (=> start!85318 true))

(declare-fun b!993017 () Bool)

(declare-fun e!560312 () Bool)

(assert (=> b!993017 (= e!560311 e!560312)))

(declare-fun res!663702 () Bool)

(assert (=> b!993017 (=> (not res!663702) (not e!560312))))

(declare-datatypes ((tuple2!15002 0))(
  ( (tuple2!15003 (_1!7512 (_ BitVec 64)) (_2!7512 List!20912)) )
))
(declare-datatypes ((Option!556 0))(
  ( (Some!555 (v!14383 tuple2!15002)) (None!554) )
))
(declare-fun lt!440411 () Option!556)

(declare-fun isEmpty!763 (Option!556) Bool)

(assert (=> b!993017 (= res!663702 (not (isEmpty!763 lt!440411)))))

(declare-fun unapply!35 (List!20912) Option!556)

(assert (=> b!993017 (= lt!440411 (unapply!35 l!3519))))

(declare-fun b!993018 () Bool)

(declare-fun e!560313 () Bool)

(assert (=> b!993018 (= e!560312 e!560313)))

(declare-fun res!663701 () Bool)

(assert (=> b!993018 (=> (not res!663701) (not e!560313))))

(declare-fun lt!440413 () tuple2!15002)

(assert (=> b!993018 (= res!663701 (not (contains!5773 (_2!7512 lt!440413) e!29)))))

(declare-fun get!15724 (Option!556) tuple2!15002)

(assert (=> b!993018 (= lt!440413 (get!15724 lt!440411))))

(declare-fun b!993019 () Bool)

(declare-fun -!451 (List!20912 (_ BitVec 64)) List!20912)

(assert (=> b!993019 (= e!560313 (not (= (-!451 l!3519 e!29) l!3519)))))

(assert (=> b!993019 (= (-!451 (_2!7512 lt!440413) e!29) (_2!7512 lt!440413))))

(declare-datatypes ((Unit!32912 0))(
  ( (Unit!32913) )
))
(declare-fun lt!440412 () Unit!32912)

(declare-fun lemmaListMinusENotContainedEqualsList!0 ((_ BitVec 64) List!20912) Unit!32912)

(assert (=> b!993019 (= lt!440412 (lemmaListMinusENotContainedEqualsList!0 e!29 (_2!7512 lt!440413)))))

(assert (= (and start!85318 res!663700) b!993017))

(assert (= (and b!993017 res!663702) b!993018))

(assert (= (and b!993018 res!663701) b!993019))

(declare-fun m!920759 () Bool)

(assert (=> start!85318 m!920759))

(declare-fun m!920761 () Bool)

(assert (=> b!993017 m!920761))

(declare-fun m!920763 () Bool)

(assert (=> b!993017 m!920763))

(declare-fun m!920765 () Bool)

(assert (=> b!993018 m!920765))

(declare-fun m!920767 () Bool)

(assert (=> b!993018 m!920767))

(declare-fun m!920769 () Bool)

(assert (=> b!993019 m!920769))

(declare-fun m!920771 () Bool)

(assert (=> b!993019 m!920771))

(declare-fun m!920773 () Bool)

(assert (=> b!993019 m!920773))

(check-sat (not start!85318) (not b!993019) (not b!993018) (not b!993017))
(check-sat)
(get-model)

(declare-fun d!118405 () Bool)

(declare-fun lt!440425 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!463 (List!20912) (InoxSet (_ BitVec 64)))

(assert (=> d!118405 (= lt!440425 (select (content!463 l!3519) e!29))))

(declare-fun e!560327 () Bool)

(assert (=> d!118405 (= lt!440425 e!560327)))

(declare-fun res!663716 () Bool)

(assert (=> d!118405 (=> (not res!663716) (not e!560327))))

(get-info :version)

(assert (=> d!118405 (= res!663716 ((_ is Cons!20908) l!3519))))

(assert (=> d!118405 (= (contains!5773 l!3519 e!29) lt!440425)))

(declare-fun b!993033 () Bool)

(declare-fun e!560328 () Bool)

(assert (=> b!993033 (= e!560327 e!560328)))

(declare-fun res!663717 () Bool)

(assert (=> b!993033 (=> res!663717 e!560328)))

(assert (=> b!993033 (= res!663717 (= (h!22070 l!3519) e!29))))

(declare-fun b!993034 () Bool)

(assert (=> b!993034 (= e!560328 (contains!5773 (t!29913 l!3519) e!29))))

(assert (= (and d!118405 res!663716) b!993033))

(assert (= (and b!993033 (not res!663717)) b!993034))

(declare-fun m!920791 () Bool)

(assert (=> d!118405 m!920791))

(declare-fun m!920793 () Bool)

(assert (=> d!118405 m!920793))

(declare-fun m!920795 () Bool)

(assert (=> b!993034 m!920795))

(assert (=> start!85318 d!118405))

(declare-fun b!993081 () Bool)

(declare-fun e!560364 () List!20912)

(declare-fun call!42130 () List!20912)

(assert (=> b!993081 (= e!560364 call!42130)))

(declare-fun bm!42127 () Bool)

(assert (=> bm!42127 (= call!42130 (-!451 (t!29913 l!3519) e!29))))

(declare-fun b!993082 () Bool)

(declare-fun e!560363 () List!20912)

(assert (=> b!993082 (= e!560363 Nil!20909)))

(declare-fun lt!440437 () List!20912)

(declare-fun b!993083 () Bool)

(declare-fun e!560362 () Bool)

(assert (=> b!993083 (= e!560362 (= (content!463 lt!440437) ((_ map and) (content!463 l!3519) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) e!29 true)))))))

(declare-fun b!993084 () Bool)

(assert (=> b!993084 (= e!560363 e!560364)))

(declare-fun c!100812 () Bool)

(assert (=> b!993084 (= c!100812 (= e!29 (h!22070 l!3519)))))

(declare-fun d!118411 () Bool)

(assert (=> d!118411 e!560362))

(declare-fun res!663732 () Bool)

(assert (=> d!118411 (=> (not res!663732) (not e!560362))))

(declare-fun size!30694 (List!20912) Int)

(assert (=> d!118411 (= res!663732 (<= (size!30694 lt!440437) (size!30694 l!3519)))))

(assert (=> d!118411 (= lt!440437 e!560363)))

(declare-fun c!100813 () Bool)

(assert (=> d!118411 (= c!100813 ((_ is Cons!20908) l!3519))))

(assert (=> d!118411 (= (-!451 l!3519 e!29) lt!440437)))

(declare-fun b!993085 () Bool)

(assert (=> b!993085 (= e!560364 (Cons!20908 (h!22070 l!3519) call!42130))))

(assert (= (and d!118411 c!100813) b!993084))

(assert (= (and d!118411 (not c!100813)) b!993082))

(assert (= (and b!993084 c!100812) b!993081))

(assert (= (and b!993084 (not c!100812)) b!993085))

(assert (= (or b!993081 b!993085) bm!42127))

(assert (= (and d!118411 res!663732) b!993083))

(declare-fun m!920825 () Bool)

(assert (=> bm!42127 m!920825))

(declare-fun m!920827 () Bool)

(assert (=> b!993083 m!920827))

(assert (=> b!993083 m!920791))

(declare-fun m!920829 () Bool)

(assert (=> b!993083 m!920829))

(declare-fun m!920831 () Bool)

(assert (=> d!118411 m!920831))

(declare-fun m!920833 () Bool)

(assert (=> d!118411 m!920833))

(assert (=> b!993019 d!118411))

(declare-fun b!993086 () Bool)

(declare-fun e!560368 () List!20912)

(declare-fun call!42131 () List!20912)

(assert (=> b!993086 (= e!560368 call!42131)))

(declare-fun bm!42128 () Bool)

(assert (=> bm!42128 (= call!42131 (-!451 (t!29913 (_2!7512 lt!440413)) e!29))))

(declare-fun b!993087 () Bool)

(declare-fun e!560367 () List!20912)

(assert (=> b!993087 (= e!560367 Nil!20909)))

(declare-fun b!993088 () Bool)

(declare-fun lt!440440 () List!20912)

(declare-fun e!560366 () Bool)

(assert (=> b!993088 (= e!560366 (= (content!463 lt!440440) ((_ map and) (content!463 (_2!7512 lt!440413)) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) e!29 true)))))))

(declare-fun b!993089 () Bool)

(assert (=> b!993089 (= e!560367 e!560368)))

(declare-fun c!100814 () Bool)

(assert (=> b!993089 (= c!100814 (= e!29 (h!22070 (_2!7512 lt!440413))))))

(declare-fun d!118419 () Bool)

(assert (=> d!118419 e!560366))

(declare-fun res!663733 () Bool)

(assert (=> d!118419 (=> (not res!663733) (not e!560366))))

(assert (=> d!118419 (= res!663733 (<= (size!30694 lt!440440) (size!30694 (_2!7512 lt!440413))))))

(assert (=> d!118419 (= lt!440440 e!560367)))

(declare-fun c!100815 () Bool)

(assert (=> d!118419 (= c!100815 ((_ is Cons!20908) (_2!7512 lt!440413)))))

(assert (=> d!118419 (= (-!451 (_2!7512 lt!440413) e!29) lt!440440)))

(declare-fun b!993090 () Bool)

(assert (=> b!993090 (= e!560368 (Cons!20908 (h!22070 (_2!7512 lt!440413)) call!42131))))

(assert (= (and d!118419 c!100815) b!993089))

(assert (= (and d!118419 (not c!100815)) b!993087))

(assert (= (and b!993089 c!100814) b!993086))

(assert (= (and b!993089 (not c!100814)) b!993090))

(assert (= (or b!993086 b!993090) bm!42128))

(assert (= (and d!118419 res!663733) b!993088))

(declare-fun m!920835 () Bool)

(assert (=> bm!42128 m!920835))

(declare-fun m!920837 () Bool)

(assert (=> b!993088 m!920837))

(declare-fun m!920841 () Bool)

(assert (=> b!993088 m!920841))

(assert (=> b!993088 m!920829))

(declare-fun m!920843 () Bool)

(assert (=> d!118419 m!920843))

(declare-fun m!920845 () Bool)

(assert (=> d!118419 m!920845))

(assert (=> b!993019 d!118419))

(declare-fun d!118423 () Bool)

(assert (=> d!118423 (= (-!451 (_2!7512 lt!440413) e!29) (_2!7512 lt!440413))))

(declare-fun lt!440448 () Unit!32912)

(declare-fun choose!48 ((_ BitVec 64) List!20912) Unit!32912)

(assert (=> d!118423 (= lt!440448 (choose!48 e!29 (_2!7512 lt!440413)))))

(assert (=> d!118423 (not (contains!5773 (_2!7512 lt!440413) e!29))))

(assert (=> d!118423 (= (lemmaListMinusENotContainedEqualsList!0 e!29 (_2!7512 lt!440413)) lt!440448)))

(declare-fun bs!28256 () Bool)

(assert (= bs!28256 d!118423))

(assert (=> bs!28256 m!920771))

(declare-fun m!920867 () Bool)

(assert (=> bs!28256 m!920867))

(assert (=> bs!28256 m!920765))

(assert (=> b!993019 d!118423))

(declare-fun d!118429 () Bool)

(declare-fun lt!440449 () Bool)

(assert (=> d!118429 (= lt!440449 (select (content!463 (_2!7512 lt!440413)) e!29))))

(declare-fun e!560380 () Bool)

(assert (=> d!118429 (= lt!440449 e!560380)))

(declare-fun res!663740 () Bool)

(assert (=> d!118429 (=> (not res!663740) (not e!560380))))

(assert (=> d!118429 (= res!663740 ((_ is Cons!20908) (_2!7512 lt!440413)))))

(assert (=> d!118429 (= (contains!5773 (_2!7512 lt!440413) e!29) lt!440449)))

(declare-fun b!993105 () Bool)

(declare-fun e!560381 () Bool)

(assert (=> b!993105 (= e!560380 e!560381)))

(declare-fun res!663741 () Bool)

(assert (=> b!993105 (=> res!663741 e!560381)))

(assert (=> b!993105 (= res!663741 (= (h!22070 (_2!7512 lt!440413)) e!29))))

(declare-fun b!993106 () Bool)

(assert (=> b!993106 (= e!560381 (contains!5773 (t!29913 (_2!7512 lt!440413)) e!29))))

(assert (= (and d!118429 res!663740) b!993105))

(assert (= (and b!993105 (not res!663741)) b!993106))

(assert (=> d!118429 m!920841))

(declare-fun m!920869 () Bool)

(assert (=> d!118429 m!920869))

(declare-fun m!920871 () Bool)

(assert (=> b!993106 m!920871))

(assert (=> b!993018 d!118429))

(declare-fun d!118431 () Bool)

(assert (=> d!118431 (= (get!15724 lt!440411) (v!14383 lt!440411))))

(assert (=> b!993018 d!118431))

(declare-fun d!118435 () Bool)

(assert (=> d!118435 (= (isEmpty!763 lt!440411) (not ((_ is Some!555) lt!440411)))))

(assert (=> b!993017 d!118435))

(declare-fun d!118439 () Bool)

(assert (=> d!118439 (= (unapply!35 l!3519) (ite ((_ is Nil!20909) l!3519) None!554 (Some!555 (tuple2!15003 (h!22070 l!3519) (t!29913 l!3519)))))))

(assert (=> b!993017 d!118439))

(check-sat (not b!993083) (not bm!42127) (not d!118429) (not d!118423) (not d!118411) (not d!118419) (not b!993088) (not bm!42128) (not b!993106) (not d!118405) (not b!993034))
(check-sat)
