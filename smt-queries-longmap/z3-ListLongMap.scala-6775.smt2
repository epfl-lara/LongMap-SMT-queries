; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85178 () Bool)

(assert start!85178)

(declare-fun res!663406 () Bool)

(declare-fun e!559957 () Bool)

(assert (=> start!85178 (=> (not res!663406) (not e!559957))))

(declare-datatypes ((List!20931 0))(
  ( (Nil!20928) (Cons!20927 (h!22089 (_ BitVec 64)) (t!29923 List!20931)) )
))
(declare-fun l!3519 () List!20931)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5730 (List!20931 (_ BitVec 64)) Bool)

(assert (=> start!85178 (= res!663406 (not (contains!5730 l!3519 e!29)))))

(assert (=> start!85178 e!559957))

(assert (=> start!85178 true))

(declare-fun b!992551 () Bool)

(declare-fun e!559958 () Bool)

(assert (=> b!992551 (= e!559957 e!559958)))

(declare-fun res!663405 () Bool)

(assert (=> b!992551 (=> (not res!663405) (not e!559958))))

(declare-datatypes ((tuple2!15056 0))(
  ( (tuple2!15057 (_1!7539 (_ BitVec 64)) (_2!7539 List!20931)) )
))
(declare-datatypes ((Option!546 0))(
  ( (Some!545 (v!14357 tuple2!15056)) (None!544) )
))
(declare-fun lt!440045 () Option!546)

(declare-fun isEmpty!755 (Option!546) Bool)

(assert (=> b!992551 (= res!663405 (not (isEmpty!755 lt!440045)))))

(declare-fun unapply!22 (List!20931) Option!546)

(assert (=> b!992551 (= lt!440045 (unapply!22 l!3519))))

(declare-fun b!992552 () Bool)

(declare-fun isDefined!392 (Option!546) Bool)

(assert (=> b!992552 (= e!559958 (not (isDefined!392 lt!440045)))))

(assert (= (and start!85178 res!663406) b!992551))

(assert (= (and b!992551 res!663405) b!992552))

(declare-fun m!919721 () Bool)

(assert (=> start!85178 m!919721))

(declare-fun m!919723 () Bool)

(assert (=> b!992551 m!919723))

(declare-fun m!919725 () Bool)

(assert (=> b!992551 m!919725))

(declare-fun m!919727 () Bool)

(assert (=> b!992552 m!919727))

(check-sat (not b!992552) (not b!992551) (not start!85178))
(check-sat)
(get-model)

(declare-fun d!118090 () Bool)

(assert (=> d!118090 (= (isDefined!392 lt!440045) (not (isEmpty!755 lt!440045)))))

(declare-fun bs!28205 () Bool)

(assert (= bs!28205 d!118090))

(assert (=> bs!28205 m!919723))

(assert (=> b!992552 d!118090))

(declare-fun d!118097 () Bool)

(get-info :version)

(assert (=> d!118097 (= (isEmpty!755 lt!440045) (not ((_ is Some!545) lt!440045)))))

(assert (=> b!992551 d!118097))

(declare-fun d!118103 () Bool)

(assert (=> d!118103 (= (unapply!22 l!3519) (ite ((_ is Nil!20928) l!3519) None!544 (Some!545 (tuple2!15057 (h!22089 l!3519) (t!29923 l!3519)))))))

(assert (=> b!992551 d!118103))

(declare-fun d!118109 () Bool)

(declare-fun lt!440058 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!450 (List!20931) (InoxSet (_ BitVec 64)))

(assert (=> d!118109 (= lt!440058 (select (content!450 l!3519) e!29))))

(declare-fun e!559985 () Bool)

(assert (=> d!118109 (= lt!440058 e!559985)))

(declare-fun res!663432 () Bool)

(assert (=> d!118109 (=> (not res!663432) (not e!559985))))

(assert (=> d!118109 (= res!663432 ((_ is Cons!20927) l!3519))))

(assert (=> d!118109 (= (contains!5730 l!3519 e!29) lt!440058)))

(declare-fun b!992578 () Bool)

(declare-fun e!559986 () Bool)

(assert (=> b!992578 (= e!559985 e!559986)))

(declare-fun res!663434 () Bool)

(assert (=> b!992578 (=> res!663434 e!559986)))

(assert (=> b!992578 (= res!663434 (= (h!22089 l!3519) e!29))))

(declare-fun b!992580 () Bool)

(assert (=> b!992580 (= e!559986 (contains!5730 (t!29923 l!3519) e!29))))

(assert (= (and d!118109 res!663432) b!992578))

(assert (= (and b!992578 (not res!663434)) b!992580))

(declare-fun m!919746 () Bool)

(assert (=> d!118109 m!919746))

(declare-fun m!919751 () Bool)

(assert (=> d!118109 m!919751))

(declare-fun m!919755 () Bool)

(assert (=> b!992580 m!919755))

(assert (=> start!85178 d!118109))

(check-sat (not d!118109) (not d!118090) (not b!992580))
(check-sat)
