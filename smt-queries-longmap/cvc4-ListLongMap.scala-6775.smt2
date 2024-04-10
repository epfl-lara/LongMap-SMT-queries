; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85200 () Bool)

(assert start!85200)

(declare-fun res!663527 () Bool)

(declare-fun e!560118 () Bool)

(assert (=> start!85200 (=> (not res!663527) (not e!560118))))

(declare-datatypes ((List!20898 0))(
  ( (Nil!20895) (Cons!20894 (h!22056 (_ BitVec 64)) (t!29899 List!20898)) )
))
(declare-fun l!3519 () List!20898)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5759 (List!20898 (_ BitVec 64)) Bool)

(assert (=> start!85200 (= res!663527 (not (contains!5759 l!3519 e!29)))))

(assert (=> start!85200 e!560118))

(assert (=> start!85200 true))

(declare-fun b!992802 () Bool)

(declare-fun e!560117 () Bool)

(assert (=> b!992802 (= e!560118 e!560117)))

(declare-fun res!663528 () Bool)

(assert (=> b!992802 (=> (not res!663528) (not e!560117))))

(declare-datatypes ((tuple2!14980 0))(
  ( (tuple2!14981 (_1!7501 (_ BitVec 64)) (_2!7501 List!20898)) )
))
(declare-datatypes ((Option!545 0))(
  ( (Some!544 (v!14360 tuple2!14980)) (None!543) )
))
(declare-fun lt!440287 () Option!545)

(declare-fun isEmpty!752 (Option!545) Bool)

(assert (=> b!992802 (= res!663528 (not (isEmpty!752 lt!440287)))))

(declare-fun unapply!24 (List!20898) Option!545)

(assert (=> b!992802 (= lt!440287 (unapply!24 l!3519))))

(declare-fun b!992803 () Bool)

(declare-fun isDefined!391 (Option!545) Bool)

(assert (=> b!992803 (= e!560117 (not (isDefined!391 lt!440287)))))

(assert (= (and start!85200 res!663527) b!992802))

(assert (= (and b!992802 res!663528) b!992803))

(declare-fun m!920495 () Bool)

(assert (=> start!85200 m!920495))

(declare-fun m!920497 () Bool)

(assert (=> b!992802 m!920497))

(declare-fun m!920499 () Bool)

(assert (=> b!992802 m!920499))

(declare-fun m!920501 () Bool)

(assert (=> b!992803 m!920501))

(push 1)

(assert (not start!85200))

(assert (not b!992803))

(assert (not b!992802))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118290 () Bool)

(declare-fun lt!440296 () Bool)

(declare-fun content!453 (List!20898) (Set (_ BitVec 64)))

(assert (=> d!118290 (= lt!440296 (member e!29 (content!453 l!3519)))))

(declare-fun e!560133 () Bool)

(assert (=> d!118290 (= lt!440296 e!560133)))

(declare-fun res!663543 () Bool)

(assert (=> d!118290 (=> (not res!663543) (not e!560133))))

(assert (=> d!118290 (= res!663543 (is-Cons!20894 l!3519))))

(assert (=> d!118290 (= (contains!5759 l!3519 e!29) lt!440296)))

(declare-fun b!992819 () Bool)

(declare-fun e!560134 () Bool)

(assert (=> b!992819 (= e!560133 e!560134)))

(declare-fun res!663545 () Bool)

(assert (=> b!992819 (=> res!663545 e!560134)))

(assert (=> b!992819 (= res!663545 (= (h!22056 l!3519) e!29))))

(declare-fun b!992821 () Bool)

(assert (=> b!992821 (= e!560134 (contains!5759 (t!29899 l!3519) e!29))))

(assert (= (and d!118290 res!663543) b!992819))

(assert (= (and b!992819 (not res!663545)) b!992821))

(declare-fun m!920510 () Bool)

(assert (=> d!118290 m!920510))

(declare-fun m!920515 () Bool)

(assert (=> d!118290 m!920515))

(declare-fun m!920518 () Bool)

(assert (=> b!992821 m!920518))

(assert (=> start!85200 d!118290))

(declare-fun d!118300 () Bool)

(assert (=> d!118300 (= (isDefined!391 lt!440287) (not (isEmpty!752 lt!440287)))))

(declare-fun bs!28239 () Bool)

(assert (= bs!28239 d!118300))

(assert (=> bs!28239 m!920497))

(assert (=> b!992803 d!118300))

(declare-fun d!118304 () Bool)

(assert (=> d!118304 (= (isEmpty!752 lt!440287) (not (is-Some!544 lt!440287)))))

(assert (=> b!992802 d!118304))

(declare-fun d!118308 () Bool)

