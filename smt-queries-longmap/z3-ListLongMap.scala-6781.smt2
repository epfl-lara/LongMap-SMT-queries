; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85360 () Bool)

(assert start!85360)

(declare-fun res!663763 () Bool)

(declare-fun e!560394 () Bool)

(assert (=> start!85360 (=> (not res!663763) (not e!560394))))

(declare-datatypes ((List!20915 0))(
  ( (Nil!20912) (Cons!20911 (h!22073 (_ BitVec 64)) (t!29916 List!20915)) )
))
(declare-fun l!3519 () List!20915)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5776 (List!20915 (_ BitVec 64)) Bool)

(assert (=> start!85360 (= res!663763 (not (contains!5776 l!3519 e!29)))))

(assert (=> start!85360 e!560394))

(assert (=> start!85360 true))

(declare-fun b!993128 () Bool)

(declare-fun res!663764 () Bool)

(assert (=> b!993128 (=> (not res!663764) (not e!560394))))

(declare-datatypes ((tuple2!15008 0))(
  ( (tuple2!15009 (_1!7515 (_ BitVec 64)) (_2!7515 List!20915)) )
))
(declare-datatypes ((Option!559 0))(
  ( (Some!558 (v!14389 tuple2!15008)) (None!557) )
))
(declare-fun isEmpty!766 (Option!559) Bool)

(declare-fun unapply!38 (List!20915) Option!559)

(assert (=> b!993128 (= res!663764 (isEmpty!766 (unapply!38 l!3519)))))

(declare-fun b!993129 () Bool)

(declare-fun res!663765 () Bool)

(assert (=> b!993129 (=> (not res!663765) (not e!560394))))

(get-info :version)

(assert (=> b!993129 (= res!663765 ((_ is Nil!20912) l!3519))))

(declare-fun b!993130 () Bool)

(declare-fun -!454 (List!20915 (_ BitVec 64)) List!20915)

(assert (=> b!993130 (= e!560394 (not (= (-!454 l!3519 e!29) l!3519)))))

(assert (= (and start!85360 res!663763) b!993128))

(assert (= (and b!993128 res!663764) b!993129))

(assert (= (and b!993129 res!663765) b!993130))

(declare-fun m!920895 () Bool)

(assert (=> start!85360 m!920895))

(declare-fun m!920897 () Bool)

(assert (=> b!993128 m!920897))

(assert (=> b!993128 m!920897))

(declare-fun m!920899 () Bool)

(assert (=> b!993128 m!920899))

(declare-fun m!920901 () Bool)

(assert (=> b!993130 m!920901))

(check-sat (not b!993130) (not start!85360) (not b!993128))
(check-sat)
(get-model)

(declare-fun b!993175 () Bool)

(declare-fun e!560424 () List!20915)

(assert (=> b!993175 (= e!560424 Nil!20912)))

(declare-fun d!118457 () Bool)

(declare-fun e!560422 () Bool)

(assert (=> d!118457 e!560422))

(declare-fun res!663782 () Bool)

(assert (=> d!118457 (=> (not res!663782) (not e!560422))))

(declare-fun lt!440463 () List!20915)

(declare-fun size!30697 (List!20915) Int)

(assert (=> d!118457 (= res!663782 (<= (size!30697 lt!440463) (size!30697 l!3519)))))

(assert (=> d!118457 (= lt!440463 e!560424)))

(declare-fun c!100835 () Bool)

(assert (=> d!118457 (= c!100835 ((_ is Cons!20911) l!3519))))

(assert (=> d!118457 (= (-!454 l!3519 e!29) lt!440463)))

(declare-fun b!993176 () Bool)

(declare-fun e!560423 () List!20915)

(assert (=> b!993176 (= e!560424 e!560423)))

(declare-fun c!100834 () Bool)

(assert (=> b!993176 (= c!100834 (= e!29 (h!22073 l!3519)))))

(declare-fun b!993177 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!468 (List!20915) (InoxSet (_ BitVec 64)))

(assert (=> b!993177 (= e!560422 (= (content!468 lt!440463) ((_ map and) (content!468 l!3519) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) e!29 true)))))))

(declare-fun b!993178 () Bool)

(declare-fun call!42141 () List!20915)

(assert (=> b!993178 (= e!560423 (Cons!20911 (h!22073 l!3519) call!42141))))

(declare-fun b!993179 () Bool)

(assert (=> b!993179 (= e!560423 call!42141)))

(declare-fun bm!42138 () Bool)

(assert (=> bm!42138 (= call!42141 (-!454 (t!29916 l!3519) e!29))))

(assert (= (and d!118457 c!100835) b!993176))

(assert (= (and d!118457 (not c!100835)) b!993175))

(assert (= (and b!993176 c!100834) b!993179))

(assert (= (and b!993176 (not c!100834)) b!993178))

(assert (= (or b!993179 b!993178) bm!42138))

(assert (= (and d!118457 res!663782) b!993177))

(declare-fun m!920923 () Bool)

(assert (=> d!118457 m!920923))

(declare-fun m!920925 () Bool)

(assert (=> d!118457 m!920925))

(declare-fun m!920927 () Bool)

(assert (=> b!993177 m!920927))

(declare-fun m!920929 () Bool)

(assert (=> b!993177 m!920929))

(declare-fun m!920931 () Bool)

(assert (=> b!993177 m!920931))

(declare-fun m!920933 () Bool)

(assert (=> bm!42138 m!920933))

(assert (=> b!993130 d!118457))

(declare-fun d!118463 () Bool)

(declare-fun lt!440472 () Bool)

(assert (=> d!118463 (= lt!440472 (select (content!468 l!3519) e!29))))

(declare-fun e!560442 () Bool)

(assert (=> d!118463 (= lt!440472 e!560442)))

(declare-fun res!663799 () Bool)

(assert (=> d!118463 (=> (not res!663799) (not e!560442))))

(assert (=> d!118463 (= res!663799 ((_ is Cons!20911) l!3519))))

(assert (=> d!118463 (= (contains!5776 l!3519 e!29) lt!440472)))

(declare-fun b!993199 () Bool)

(declare-fun e!560443 () Bool)

(assert (=> b!993199 (= e!560442 e!560443)))

(declare-fun res!663798 () Bool)

(assert (=> b!993199 (=> res!663798 e!560443)))

(assert (=> b!993199 (= res!663798 (= (h!22073 l!3519) e!29))))

(declare-fun b!993200 () Bool)

(assert (=> b!993200 (= e!560443 (contains!5776 (t!29916 l!3519) e!29))))

(assert (= (and d!118463 res!663799) b!993199))

(assert (= (and b!993199 (not res!663798)) b!993200))

(assert (=> d!118463 m!920929))

(declare-fun m!920951 () Bool)

(assert (=> d!118463 m!920951))

(declare-fun m!920953 () Bool)

(assert (=> b!993200 m!920953))

(assert (=> start!85360 d!118463))

(declare-fun d!118471 () Bool)

(assert (=> d!118471 (= (isEmpty!766 (unapply!38 l!3519)) (not ((_ is Some!558) (unapply!38 l!3519))))))

(assert (=> b!993128 d!118471))

(declare-fun d!118475 () Bool)

(assert (=> d!118475 (= (unapply!38 l!3519) (ite ((_ is Nil!20912) l!3519) None!557 (Some!558 (tuple2!15009 (h!22073 l!3519) (t!29916 l!3519)))))))

(assert (=> b!993128 d!118475))

(check-sat (not d!118457) (not b!993200) (not bm!42138) (not b!993177) (not d!118463))
(check-sat)
