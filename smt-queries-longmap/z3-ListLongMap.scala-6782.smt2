; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85390 () Bool)

(assert start!85390)

(declare-fun res!663812 () Bool)

(declare-fun e!560451 () Bool)

(assert (=> start!85390 (=> (not res!663812) (not e!560451))))

(declare-datatypes ((List!20918 0))(
  ( (Nil!20915) (Cons!20914 (h!22076 (_ BitVec 64)) (t!29919 List!20918)) )
))
(declare-fun l!3519 () List!20918)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5779 (List!20918 (_ BitVec 64)) Bool)

(assert (=> start!85390 (= res!663812 (not (contains!5779 l!3519 e!29)))))

(assert (=> start!85390 e!560451))

(assert (=> start!85390 true))

(declare-fun b!993213 () Bool)

(declare-fun res!663813 () Bool)

(assert (=> b!993213 (=> (not res!663813) (not e!560451))))

(declare-datatypes ((tuple2!15014 0))(
  ( (tuple2!15015 (_1!7518 (_ BitVec 64)) (_2!7518 List!20918)) )
))
(declare-datatypes ((Option!562 0))(
  ( (Some!561 (v!14395 tuple2!15014)) (None!560) )
))
(declare-fun isEmpty!769 (Option!562) Bool)

(declare-fun unapply!41 (List!20918) Option!562)

(assert (=> b!993213 (= res!663813 (isEmpty!769 (unapply!41 l!3519)))))

(declare-fun b!993214 () Bool)

(get-info :version)

(assert (=> b!993214 (= e!560451 (not ((_ is Nil!20915) l!3519)))))

(assert (= (and start!85390 res!663812) b!993213))

(assert (= (and b!993213 res!663813) b!993214))

(declare-fun m!920965 () Bool)

(assert (=> start!85390 m!920965))

(declare-fun m!920967 () Bool)

(assert (=> b!993213 m!920967))

(assert (=> b!993213 m!920967))

(declare-fun m!920969 () Bool)

(assert (=> b!993213 m!920969))

(check-sat (not b!993213) (not start!85390))
(check-sat)
(get-model)

(declare-fun d!118485 () Bool)

(assert (=> d!118485 (= (isEmpty!769 (unapply!41 l!3519)) (not ((_ is Some!561) (unapply!41 l!3519))))))

(assert (=> b!993213 d!118485))

(declare-fun d!118487 () Bool)

(assert (=> d!118487 (= (unapply!41 l!3519) (ite ((_ is Nil!20915) l!3519) None!560 (Some!561 (tuple2!15015 (h!22076 l!3519) (t!29919 l!3519)))))))

(assert (=> b!993213 d!118487))

(declare-fun d!118489 () Bool)

(declare-fun lt!440482 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!471 (List!20918) (InoxSet (_ BitVec 64)))

(assert (=> d!118489 (= lt!440482 (select (content!471 l!3519) e!29))))

(declare-fun e!560472 () Bool)

(assert (=> d!118489 (= lt!440482 e!560472)))

(declare-fun res!663836 () Bool)

(assert (=> d!118489 (=> (not res!663836) (not e!560472))))

(assert (=> d!118489 (= res!663836 ((_ is Cons!20914) l!3519))))

(assert (=> d!118489 (= (contains!5779 l!3519 e!29) lt!440482)))

(declare-fun b!993237 () Bool)

(declare-fun e!560471 () Bool)

(assert (=> b!993237 (= e!560472 e!560471)))

(declare-fun res!663837 () Bool)

(assert (=> b!993237 (=> res!663837 e!560471)))

(assert (=> b!993237 (= res!663837 (= (h!22076 l!3519) e!29))))

(declare-fun b!993238 () Bool)

(assert (=> b!993238 (= e!560471 (contains!5779 (t!29919 l!3519) e!29))))

(assert (= (and d!118489 res!663836) b!993237))

(assert (= (and b!993237 (not res!663837)) b!993238))

(declare-fun m!920989 () Bool)

(assert (=> d!118489 m!920989))

(declare-fun m!920991 () Bool)

(assert (=> d!118489 m!920991))

(declare-fun m!920993 () Bool)

(assert (=> b!993238 m!920993))

(assert (=> start!85390 d!118489))

(check-sat (not d!118489) (not b!993238))
(check-sat)
