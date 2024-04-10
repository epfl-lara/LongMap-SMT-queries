; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85196 () Bool)

(assert start!85196)

(declare-fun res!663516 () Bool)

(declare-fun e!560105 () Bool)

(assert (=> start!85196 (=> (not res!663516) (not e!560105))))

(declare-datatypes ((List!20896 0))(
  ( (Nil!20893) (Cons!20892 (h!22054 (_ BitVec 64)) (t!29897 List!20896)) )
))
(declare-fun l!3519 () List!20896)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5757 (List!20896 (_ BitVec 64)) Bool)

(assert (=> start!85196 (= res!663516 (not (contains!5757 l!3519 e!29)))))

(assert (=> start!85196 e!560105))

(assert (=> start!85196 true))

(declare-fun b!992790 () Bool)

(declare-fun e!560106 () Bool)

(assert (=> b!992790 (= e!560105 e!560106)))

(declare-fun res!663515 () Bool)

(assert (=> b!992790 (=> (not res!663515) (not e!560106))))

(declare-datatypes ((tuple2!14976 0))(
  ( (tuple2!14977 (_1!7499 (_ BitVec 64)) (_2!7499 List!20896)) )
))
(declare-datatypes ((Option!543 0))(
  ( (Some!542 (v!14358 tuple2!14976)) (None!541) )
))
(declare-fun lt!440281 () Option!543)

(declare-fun isEmpty!750 (Option!543) Bool)

(assert (=> b!992790 (= res!663515 (not (isEmpty!750 lt!440281)))))

(declare-fun unapply!22 (List!20896) Option!543)

(assert (=> b!992790 (= lt!440281 (unapply!22 l!3519))))

(declare-fun b!992791 () Bool)

(declare-fun isDefined!389 (Option!543) Bool)

(assert (=> b!992791 (= e!560106 (not (isDefined!389 lt!440281)))))

(assert (= (and start!85196 res!663516) b!992790))

(assert (= (and b!992790 res!663515) b!992791))

(declare-fun m!920479 () Bool)

(assert (=> start!85196 m!920479))

(declare-fun m!920481 () Bool)

(assert (=> b!992790 m!920481))

(declare-fun m!920483 () Bool)

(assert (=> b!992790 m!920483))

(declare-fun m!920485 () Bool)

(assert (=> b!992791 m!920485))

(push 1)

(assert (not start!85196))

(assert (not b!992791))

(assert (not b!992790))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118291 () Bool)

(declare-fun lt!440294 () Bool)

(declare-fun content!451 (List!20896) (Set (_ BitVec 64)))

(assert (=> d!118291 (= lt!440294 (set.member e!29 (content!451 l!3519)))))

(declare-fun e!560131 () Bool)

(assert (=> d!118291 (= lt!440294 e!560131)))

(declare-fun res!663541 () Bool)

(assert (=> d!118291 (=> (not res!663541) (not e!560131))))

(assert (=> d!118291 (= res!663541 (is-Cons!20892 l!3519))))

(assert (=> d!118291 (= (contains!5757 l!3519 e!29) lt!440294)))

(declare-fun b!992816 () Bool)

(declare-fun e!560132 () Bool)

(assert (=> b!992816 (= e!560131 e!560132)))

(declare-fun res!663542 () Bool)

(assert (=> b!992816 (=> res!663542 e!560132)))

(assert (=> b!992816 (= res!663542 (= (h!22054 l!3519) e!29))))

(declare-fun b!992817 () Bool)

(assert (=> b!992817 (= e!560132 (contains!5757 (t!29897 l!3519) e!29))))

(assert (= (and d!118291 res!663541) b!992816))

(assert (= (and b!992816 (not res!663542)) b!992817))

(declare-fun m!920503 () Bool)

(assert (=> d!118291 m!920503))

(declare-fun m!920505 () Bool)

(assert (=> d!118291 m!920505))

(declare-fun m!920507 () Bool)

(assert (=> b!992817 m!920507))

(assert (=> start!85196 d!118291))

(declare-fun d!118293 () Bool)

(assert (=> d!118293 (= (isDefined!389 lt!440281) (not (isEmpty!750 lt!440281)))))

(declare-fun bs!28237 () Bool)

(assert (= bs!28237 d!118293))

(assert (=> bs!28237 m!920481))

(assert (=> b!992791 d!118293))

(declare-fun d!118295 () Bool)

(assert (=> d!118295 (= (isEmpty!750 lt!440281) (not (is-Some!542 lt!440281)))))

(assert (=> b!992790 d!118295))

(declare-fun d!118297 () Bool)

(assert (=> d!118297 (= (unapply!22 l!3519) (ite (is-Nil!20893 l!3519) None!541 (Some!542 (tuple2!14977 (h!22054 l!3519) (t!29897 l!3519)))))))

(assert (=> b!992790 d!118297))

(push 1)

(assert (not b!992817))

(assert (not d!118291))

(assert (not d!118293))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

