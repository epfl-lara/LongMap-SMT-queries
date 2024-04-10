; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85282 () Bool)

(assert start!85282)

(declare-fun res!663649 () Bool)

(declare-fun e!560249 () Bool)

(assert (=> start!85282 (=> (not res!663649) (not e!560249))))

(declare-datatypes ((List!20909 0))(
  ( (Nil!20906) (Cons!20905 (h!22067 (_ BitVec 64)) (t!29910 List!20909)) )
))
(declare-fun l!3519 () List!20909)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5770 (List!20909 (_ BitVec 64)) Bool)

(assert (=> start!85282 (= res!663649 (not (contains!5770 l!3519 e!29)))))

(assert (=> start!85282 e!560249))

(assert (=> start!85282 true))

(declare-fun b!992942 () Bool)

(declare-fun e!560248 () Bool)

(assert (=> b!992942 (= e!560249 e!560248)))

(declare-fun res!663650 () Bool)

(assert (=> b!992942 (=> (not res!663650) (not e!560248))))

(declare-datatypes ((tuple2!14996 0))(
  ( (tuple2!14997 (_1!7509 (_ BitVec 64)) (_2!7509 List!20909)) )
))
(declare-datatypes ((Option!553 0))(
  ( (Some!552 (v!14377 tuple2!14996)) (None!551) )
))
(declare-fun lt!440365 () Option!553)

(declare-fun isEmpty!760 (Option!553) Bool)

(assert (=> b!992942 (= res!663650 (not (isEmpty!760 lt!440365)))))

(declare-fun unapply!32 (List!20909) Option!553)

(assert (=> b!992942 (= lt!440365 (unapply!32 l!3519))))

(declare-fun b!992943 () Bool)

(declare-fun e!560250 () Bool)

(assert (=> b!992943 (= e!560248 e!560250)))

(declare-fun res!663651 () Bool)

(assert (=> b!992943 (=> (not res!663651) (not e!560250))))

(declare-fun lt!440364 () tuple2!14996)

(assert (=> b!992943 (= res!663651 (not (contains!5770 (_2!7509 lt!440364) e!29)))))

(declare-fun get!15719 (Option!553) tuple2!14996)

(assert (=> b!992943 (= lt!440364 (get!15719 lt!440365))))

(declare-fun b!992944 () Bool)

(declare-fun ListPrimitiveSize!95 (List!20909) Int)

(assert (=> b!992944 (= e!560250 (>= (ListPrimitiveSize!95 (_2!7509 lt!440364)) (ListPrimitiveSize!95 l!3519)))))

(assert (= (and start!85282 res!663649) b!992942))

(assert (= (and b!992942 res!663650) b!992943))

(assert (= (and b!992943 res!663651) b!992944))

(declare-fun m!920667 () Bool)

(assert (=> start!85282 m!920667))

(declare-fun m!920669 () Bool)

(assert (=> b!992942 m!920669))

(declare-fun m!920671 () Bool)

(assert (=> b!992942 m!920671))

(declare-fun m!920673 () Bool)

(assert (=> b!992943 m!920673))

(declare-fun m!920675 () Bool)

(assert (=> b!992943 m!920675))

(declare-fun m!920677 () Bool)

(assert (=> b!992944 m!920677))

(declare-fun m!920679 () Bool)

(assert (=> b!992944 m!920679))

(check-sat (not b!992943) (not start!85282) (not b!992944) (not b!992942))
(check-sat)
(get-model)

(declare-fun d!118361 () Bool)

(declare-fun lt!440374 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!460 (List!20909) (InoxSet (_ BitVec 64)))

(assert (=> d!118361 (= lt!440374 (select (content!460 (_2!7509 lt!440364)) e!29))))

(declare-fun e!560264 () Bool)

(assert (=> d!118361 (= lt!440374 e!560264)))

(declare-fun res!663665 () Bool)

(assert (=> d!118361 (=> (not res!663665) (not e!560264))))

(get-info :version)

(assert (=> d!118361 (= res!663665 ((_ is Cons!20905) (_2!7509 lt!440364)))))

(assert (=> d!118361 (= (contains!5770 (_2!7509 lt!440364) e!29) lt!440374)))

(declare-fun b!992958 () Bool)

(declare-fun e!560265 () Bool)

(assert (=> b!992958 (= e!560264 e!560265)))

(declare-fun res!663666 () Bool)

(assert (=> b!992958 (=> res!663666 e!560265)))

(assert (=> b!992958 (= res!663666 (= (h!22067 (_2!7509 lt!440364)) e!29))))

(declare-fun b!992959 () Bool)

(assert (=> b!992959 (= e!560265 (contains!5770 (t!29910 (_2!7509 lt!440364)) e!29))))

(assert (= (and d!118361 res!663665) b!992958))

(assert (= (and b!992958 (not res!663666)) b!992959))

(declare-fun m!920695 () Bool)

(assert (=> d!118361 m!920695))

(declare-fun m!920697 () Bool)

(assert (=> d!118361 m!920697))

(declare-fun m!920699 () Bool)

(assert (=> b!992959 m!920699))

(assert (=> b!992943 d!118361))

(declare-fun d!118375 () Bool)

(assert (=> d!118375 (= (get!15719 lt!440365) (v!14377 lt!440365))))

(assert (=> b!992943 d!118375))

(declare-fun d!118377 () Bool)

(declare-fun lt!440375 () Bool)

(assert (=> d!118377 (= lt!440375 (select (content!460 l!3519) e!29))))

(declare-fun e!560266 () Bool)

(assert (=> d!118377 (= lt!440375 e!560266)))

(declare-fun res!663667 () Bool)

(assert (=> d!118377 (=> (not res!663667) (not e!560266))))

(assert (=> d!118377 (= res!663667 ((_ is Cons!20905) l!3519))))

(assert (=> d!118377 (= (contains!5770 l!3519 e!29) lt!440375)))

(declare-fun b!992960 () Bool)

(declare-fun e!560267 () Bool)

(assert (=> b!992960 (= e!560266 e!560267)))

(declare-fun res!663668 () Bool)

(assert (=> b!992960 (=> res!663668 e!560267)))

(assert (=> b!992960 (= res!663668 (= (h!22067 l!3519) e!29))))

(declare-fun b!992961 () Bool)

(assert (=> b!992961 (= e!560267 (contains!5770 (t!29910 l!3519) e!29))))

(assert (= (and d!118377 res!663667) b!992960))

(assert (= (and b!992960 (not res!663668)) b!992961))

(declare-fun m!920701 () Bool)

(assert (=> d!118377 m!920701))

(declare-fun m!920703 () Bool)

(assert (=> d!118377 m!920703))

(declare-fun m!920705 () Bool)

(assert (=> b!992961 m!920705))

(assert (=> start!85282 d!118377))

(declare-fun d!118379 () Bool)

(declare-fun lt!440384 () Int)

(assert (=> d!118379 (>= lt!440384 0)))

(declare-fun e!560282 () Int)

(assert (=> d!118379 (= lt!440384 e!560282)))

(declare-fun c!100786 () Bool)

(assert (=> d!118379 (= c!100786 ((_ is Nil!20906) (_2!7509 lt!440364)))))

(assert (=> d!118379 (= (ListPrimitiveSize!95 (_2!7509 lt!440364)) lt!440384)))

(declare-fun b!992978 () Bool)

(assert (=> b!992978 (= e!560282 0)))

(declare-fun b!992979 () Bool)

(assert (=> b!992979 (= e!560282 (+ 1 (ListPrimitiveSize!95 (t!29910 (_2!7509 lt!440364)))))))

(assert (= (and d!118379 c!100786) b!992978))

(assert (= (and d!118379 (not c!100786)) b!992979))

(declare-fun m!920719 () Bool)

(assert (=> b!992979 m!920719))

(assert (=> b!992944 d!118379))

(declare-fun d!118387 () Bool)

(declare-fun lt!440386 () Int)

(assert (=> d!118387 (>= lt!440386 0)))

(declare-fun e!560285 () Int)

(assert (=> d!118387 (= lt!440386 e!560285)))

(declare-fun c!100787 () Bool)

(assert (=> d!118387 (= c!100787 ((_ is Nil!20906) l!3519))))

(assert (=> d!118387 (= (ListPrimitiveSize!95 l!3519) lt!440386)))

(declare-fun b!992982 () Bool)

(assert (=> b!992982 (= e!560285 0)))

(declare-fun b!992983 () Bool)

(assert (=> b!992983 (= e!560285 (+ 1 (ListPrimitiveSize!95 (t!29910 l!3519))))))

(assert (= (and d!118387 c!100787) b!992982))

(assert (= (and d!118387 (not c!100787)) b!992983))

(declare-fun m!920725 () Bool)

(assert (=> b!992983 m!920725))

(assert (=> b!992944 d!118387))

(declare-fun d!118391 () Bool)

(assert (=> d!118391 (= (isEmpty!760 lt!440365) (not ((_ is Some!552) lt!440365)))))

(assert (=> b!992942 d!118391))

(declare-fun d!118397 () Bool)

(assert (=> d!118397 (= (unapply!32 l!3519) (ite ((_ is Nil!20906) l!3519) None!551 (Some!552 (tuple2!14997 (h!22067 l!3519) (t!29910 l!3519)))))))

(assert (=> b!992942 d!118397))

(check-sat (not b!992979) (not d!118361) (not b!992961) (not d!118377) (not b!992983) (not b!992959))
(check-sat)
