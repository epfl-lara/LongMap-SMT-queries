; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85298 () Bool)

(assert start!85298)

(declare-fun res!663581 () Bool)

(declare-fun e!560155 () Bool)

(assert (=> start!85298 (=> (not res!663581) (not e!560155))))

(declare-datatypes ((List!20946 0))(
  ( (Nil!20943) (Cons!20942 (h!22104 (_ BitVec 64)) (t!29938 List!20946)) )
))
(declare-fun l!3519 () List!20946)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5745 (List!20946 (_ BitVec 64)) Bool)

(assert (=> start!85298 (= res!663581 (not (contains!5745 l!3519 e!29)))))

(assert (=> start!85298 e!560155))

(assert (=> start!85298 true))

(declare-fun b!992769 () Bool)

(declare-fun e!560154 () Bool)

(assert (=> b!992769 (= e!560155 e!560154)))

(declare-fun res!663582 () Bool)

(assert (=> b!992769 (=> (not res!663582) (not e!560154))))

(declare-datatypes ((tuple2!15080 0))(
  ( (tuple2!15081 (_1!7551 (_ BitVec 64)) (_2!7551 List!20946)) )
))
(declare-datatypes ((Option!558 0))(
  ( (Some!557 (v!14381 tuple2!15080)) (None!556) )
))
(declare-fun lt!440168 () Option!558)

(declare-fun isEmpty!767 (Option!558) Bool)

(assert (=> b!992769 (= res!663582 (not (isEmpty!767 lt!440168)))))

(declare-fun unapply!34 (List!20946) Option!558)

(assert (=> b!992769 (= lt!440168 (unapply!34 l!3519))))

(declare-fun b!992770 () Bool)

(declare-fun e!560156 () Bool)

(assert (=> b!992770 (= e!560154 e!560156)))

(declare-fun res!663583 () Bool)

(assert (=> b!992770 (=> (not res!663583) (not e!560156))))

(declare-fun lt!440167 () tuple2!15080)

(assert (=> b!992770 (= res!663583 (not (contains!5745 (_2!7551 lt!440167) e!29)))))

(declare-fun get!15718 (Option!558) tuple2!15080)

(assert (=> b!992770 (= lt!440167 (get!15718 lt!440168))))

(declare-fun b!992771 () Bool)

(declare-fun -!450 (List!20946 (_ BitVec 64)) List!20946)

(assert (=> b!992771 (= e!560156 (not (= (-!450 l!3519 e!29) l!3519)))))

(assert (=> b!992771 (= (-!450 (_2!7551 lt!440167) e!29) (_2!7551 lt!440167))))

(declare-datatypes ((Unit!32783 0))(
  ( (Unit!32784) )
))
(declare-fun lt!440166 () Unit!32783)

(declare-fun lemmaListMinusENotContainedEqualsList!0 ((_ BitVec 64) List!20946) Unit!32783)

(assert (=> b!992771 (= lt!440166 (lemmaListMinusENotContainedEqualsList!0 e!29 (_2!7551 lt!440167)))))

(assert (= (and start!85298 res!663581) b!992769))

(assert (= (and b!992769 res!663582) b!992770))

(assert (= (and b!992770 res!663583) b!992771))

(declare-fun m!919985 () Bool)

(assert (=> start!85298 m!919985))

(declare-fun m!919987 () Bool)

(assert (=> b!992769 m!919987))

(declare-fun m!919989 () Bool)

(assert (=> b!992769 m!919989))

(declare-fun m!919991 () Bool)

(assert (=> b!992770 m!919991))

(declare-fun m!919993 () Bool)

(assert (=> b!992770 m!919993))

(declare-fun m!919995 () Bool)

(assert (=> b!992771 m!919995))

(declare-fun m!919997 () Bool)

(assert (=> b!992771 m!919997))

(declare-fun m!919999 () Bool)

(assert (=> b!992771 m!919999))

(check-sat (not start!85298) (not b!992769) (not b!992770) (not b!992771))
(check-sat)
(get-model)

(declare-fun d!118207 () Bool)

(declare-fun lt!440189 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!461 (List!20946) (InoxSet (_ BitVec 64)))

(assert (=> d!118207 (= lt!440189 (select (content!461 l!3519) e!29))))

(declare-fun e!560179 () Bool)

(assert (=> d!118207 (= lt!440189 e!560179)))

(declare-fun res!663607 () Bool)

(assert (=> d!118207 (=> (not res!663607) (not e!560179))))

(get-info :version)

(assert (=> d!118207 (= res!663607 ((_ is Cons!20942) l!3519))))

(assert (=> d!118207 (= (contains!5745 l!3519 e!29) lt!440189)))

(declare-fun b!992794 () Bool)

(declare-fun e!560180 () Bool)

(assert (=> b!992794 (= e!560179 e!560180)))

(declare-fun res!663606 () Bool)

(assert (=> b!992794 (=> res!663606 e!560180)))

(assert (=> b!992794 (= res!663606 (= (h!22104 l!3519) e!29))))

(declare-fun b!992795 () Bool)

(assert (=> b!992795 (= e!560180 (contains!5745 (t!29938 l!3519) e!29))))

(assert (= (and d!118207 res!663607) b!992794))

(assert (= (and b!992794 (not res!663606)) b!992795))

(declare-fun m!920033 () Bool)

(assert (=> d!118207 m!920033))

(declare-fun m!920035 () Bool)

(assert (=> d!118207 m!920035))

(declare-fun m!920037 () Bool)

(assert (=> b!992795 m!920037))

(assert (=> start!85298 d!118207))

(declare-fun d!118217 () Bool)

(assert (=> d!118217 (= (isEmpty!767 lt!440168) (not ((_ is Some!557) lt!440168)))))

(assert (=> b!992769 d!118217))

(declare-fun d!118219 () Bool)

(assert (=> d!118219 (= (unapply!34 l!3519) (ite ((_ is Nil!20943) l!3519) None!556 (Some!557 (tuple2!15081 (h!22104 l!3519) (t!29938 l!3519)))))))

(assert (=> b!992769 d!118219))

(declare-fun d!118221 () Bool)

(declare-fun lt!440195 () Bool)

(assert (=> d!118221 (= lt!440195 (select (content!461 (_2!7551 lt!440167)) e!29))))

(declare-fun e!560191 () Bool)

(assert (=> d!118221 (= lt!440195 e!560191)))

(declare-fun res!663621 () Bool)

(assert (=> d!118221 (=> (not res!663621) (not e!560191))))

(assert (=> d!118221 (= res!663621 ((_ is Cons!20942) (_2!7551 lt!440167)))))

(assert (=> d!118221 (= (contains!5745 (_2!7551 lt!440167) e!29) lt!440195)))

(declare-fun b!992806 () Bool)

(declare-fun e!560192 () Bool)

(assert (=> b!992806 (= e!560191 e!560192)))

(declare-fun res!663618 () Bool)

(assert (=> b!992806 (=> res!663618 e!560192)))

(assert (=> b!992806 (= res!663618 (= (h!22104 (_2!7551 lt!440167)) e!29))))

(declare-fun b!992807 () Bool)

(assert (=> b!992807 (= e!560192 (contains!5745 (t!29938 (_2!7551 lt!440167)) e!29))))

(assert (= (and d!118221 res!663621) b!992806))

(assert (= (and b!992806 (not res!663618)) b!992807))

(declare-fun m!920045 () Bool)

(assert (=> d!118221 m!920045))

(declare-fun m!920049 () Bool)

(assert (=> d!118221 m!920049))

(declare-fun m!920053 () Bool)

(assert (=> b!992807 m!920053))

(assert (=> b!992770 d!118221))

(declare-fun d!118225 () Bool)

(assert (=> d!118225 (= (get!15718 lt!440168) (v!14381 lt!440168))))

(assert (=> b!992770 d!118225))

(declare-fun b!992843 () Bool)

(declare-fun e!560218 () Bool)

(declare-fun lt!440205 () List!20946)

(assert (=> b!992843 (= e!560218 (= (content!461 lt!440205) ((_ map and) (content!461 l!3519) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) e!29 true)))))))

(declare-fun bm!42099 () Bool)

(declare-fun call!42103 () List!20946)

(assert (=> bm!42099 (= call!42103 (-!450 (t!29938 l!3519) e!29))))

(declare-fun d!118229 () Bool)

(assert (=> d!118229 e!560218))

(declare-fun res!663630 () Bool)

(assert (=> d!118229 (=> (not res!663630) (not e!560218))))

(declare-fun size!30664 (List!20946) Int)

(assert (=> d!118229 (= res!663630 (<= (size!30664 lt!440205) (size!30664 l!3519)))))

(declare-fun e!560223 () List!20946)

(assert (=> d!118229 (= lt!440205 e!560223)))

(declare-fun c!100746 () Bool)

(assert (=> d!118229 (= c!100746 ((_ is Cons!20942) l!3519))))

(assert (=> d!118229 (= (-!450 l!3519 e!29) lt!440205)))

(declare-fun b!992846 () Bool)

(declare-fun e!560221 () List!20946)

(assert (=> b!992846 (= e!560223 e!560221)))

(declare-fun c!100743 () Bool)

(assert (=> b!992846 (= c!100743 (= e!29 (h!22104 l!3519)))))

(declare-fun b!992848 () Bool)

(assert (=> b!992848 (= e!560223 Nil!20943)))

(declare-fun b!992849 () Bool)

(assert (=> b!992849 (= e!560221 (Cons!20942 (h!22104 l!3519) call!42103))))

(declare-fun b!992851 () Bool)

(assert (=> b!992851 (= e!560221 call!42103)))

(assert (= (and d!118229 c!100746) b!992846))

(assert (= (and d!118229 (not c!100746)) b!992848))

(assert (= (and b!992846 c!100743) b!992851))

(assert (= (and b!992846 (not c!100743)) b!992849))

(assert (= (or b!992851 b!992849) bm!42099))

(assert (= (and d!118229 res!663630) b!992843))

(declare-fun m!920065 () Bool)

(assert (=> b!992843 m!920065))

(assert (=> b!992843 m!920033))

(declare-fun m!920071 () Bool)

(assert (=> b!992843 m!920071))

(declare-fun m!920077 () Bool)

(assert (=> bm!42099 m!920077))

(declare-fun m!920079 () Bool)

(assert (=> d!118229 m!920079))

(declare-fun m!920083 () Bool)

(assert (=> d!118229 m!920083))

(assert (=> b!992771 d!118229))

(declare-fun lt!440207 () List!20946)

(declare-fun e!560227 () Bool)

(declare-fun b!992857 () Bool)

(assert (=> b!992857 (= e!560227 (= (content!461 lt!440207) ((_ map and) (content!461 (_2!7551 lt!440167)) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) e!29 true)))))))

(declare-fun bm!42102 () Bool)

(declare-fun call!42105 () List!20946)

(assert (=> bm!42102 (= call!42105 (-!450 (t!29938 (_2!7551 lt!440167)) e!29))))

(declare-fun d!118243 () Bool)

(assert (=> d!118243 e!560227))

(declare-fun res!663633 () Bool)

(assert (=> d!118243 (=> (not res!663633) (not e!560227))))

(assert (=> d!118243 (= res!663633 (<= (size!30664 lt!440207) (size!30664 (_2!7551 lt!440167))))))

(declare-fun e!560229 () List!20946)

(assert (=> d!118243 (= lt!440207 e!560229)))

(declare-fun c!100750 () Bool)

(assert (=> d!118243 (= c!100750 ((_ is Cons!20942) (_2!7551 lt!440167)))))

(assert (=> d!118243 (= (-!450 (_2!7551 lt!440167) e!29) lt!440207)))

(declare-fun b!992858 () Bool)

(declare-fun e!560228 () List!20946)

(assert (=> b!992858 (= e!560229 e!560228)))

(declare-fun c!100749 () Bool)

(assert (=> b!992858 (= c!100749 (= e!29 (h!22104 (_2!7551 lt!440167))))))

(declare-fun b!992859 () Bool)

(assert (=> b!992859 (= e!560229 Nil!20943)))

(declare-fun b!992860 () Bool)

(assert (=> b!992860 (= e!560228 (Cons!20942 (h!22104 (_2!7551 lt!440167)) call!42105))))

(declare-fun b!992861 () Bool)

(assert (=> b!992861 (= e!560228 call!42105)))

(assert (= (and d!118243 c!100750) b!992858))

(assert (= (and d!118243 (not c!100750)) b!992859))

(assert (= (and b!992858 c!100749) b!992861))

(assert (= (and b!992858 (not c!100749)) b!992860))

(assert (= (or b!992861 b!992860) bm!42102))

(assert (= (and d!118243 res!663633) b!992857))

(declare-fun m!920085 () Bool)

(assert (=> b!992857 m!920085))

(assert (=> b!992857 m!920045))

(assert (=> b!992857 m!920071))

(declare-fun m!920089 () Bool)

(assert (=> bm!42102 m!920089))

(declare-fun m!920093 () Bool)

(assert (=> d!118243 m!920093))

(declare-fun m!920097 () Bool)

(assert (=> d!118243 m!920097))

(assert (=> b!992771 d!118243))

(declare-fun d!118245 () Bool)

(assert (=> d!118245 (= (-!450 (_2!7551 lt!440167) e!29) (_2!7551 lt!440167))))

(declare-fun lt!440215 () Unit!32783)

(declare-fun choose!48 ((_ BitVec 64) List!20946) Unit!32783)

(assert (=> d!118245 (= lt!440215 (choose!48 e!29 (_2!7551 lt!440167)))))

(assert (=> d!118245 (not (contains!5745 (_2!7551 lt!440167) e!29))))

(assert (=> d!118245 (= (lemmaListMinusENotContainedEqualsList!0 e!29 (_2!7551 lt!440167)) lt!440215)))

(declare-fun bs!28223 () Bool)

(assert (= bs!28223 d!118245))

(assert (=> bs!28223 m!919997))

(declare-fun m!920121 () Bool)

(assert (=> bs!28223 m!920121))

(assert (=> bs!28223 m!919991))

(assert (=> b!992771 d!118245))

(check-sat (not bm!42102) (not d!118243) (not d!118221) (not b!992857) (not d!118207) (not b!992843) (not bm!42099) (not d!118229) (not d!118245) (not b!992795) (not b!992807))
(check-sat)
