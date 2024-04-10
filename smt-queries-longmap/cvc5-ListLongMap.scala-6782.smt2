; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85388 () Bool)

(assert start!85388)

(declare-fun res!663806 () Bool)

(declare-fun e!560448 () Bool)

(assert (=> start!85388 (=> (not res!663806) (not e!560448))))

(declare-datatypes ((List!20917 0))(
  ( (Nil!20914) (Cons!20913 (h!22075 (_ BitVec 64)) (t!29918 List!20917)) )
))
(declare-fun l!3519 () List!20917)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5778 (List!20917 (_ BitVec 64)) Bool)

(assert (=> start!85388 (= res!663806 (not (contains!5778 l!3519 e!29)))))

(assert (=> start!85388 e!560448))

(assert (=> start!85388 true))

(declare-fun b!993207 () Bool)

(declare-fun res!663807 () Bool)

(assert (=> b!993207 (=> (not res!663807) (not e!560448))))

(declare-datatypes ((tuple2!15012 0))(
  ( (tuple2!15013 (_1!7517 (_ BitVec 64)) (_2!7517 List!20917)) )
))
(declare-datatypes ((Option!561 0))(
  ( (Some!560 (v!14394 tuple2!15012)) (None!559) )
))
(declare-fun isEmpty!768 (Option!561) Bool)

(declare-fun unapply!40 (List!20917) Option!561)

(assert (=> b!993207 (= res!663807 (isEmpty!768 (unapply!40 l!3519)))))

(declare-fun b!993208 () Bool)

(assert (=> b!993208 (= e!560448 (not (is-Nil!20914 l!3519)))))

(assert (= (and start!85388 res!663806) b!993207))

(assert (= (and b!993207 res!663807) b!993208))

(declare-fun m!920959 () Bool)

(assert (=> start!85388 m!920959))

(declare-fun m!920961 () Bool)

(assert (=> b!993207 m!920961))

(assert (=> b!993207 m!920961))

(declare-fun m!920963 () Bool)

(assert (=> b!993207 m!920963))

(push 1)

(assert (not start!85388))

(assert (not b!993207))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118483 () Bool)

(declare-fun lt!440479 () Bool)

(declare-fun content!469 (List!20917) (Set (_ BitVec 64)))

(assert (=> d!118483 (= lt!440479 (set.member e!29 (content!469 l!3519)))))

(declare-fun e!560465 () Bool)

(assert (=> d!118483 (= lt!440479 e!560465)))

(declare-fun res!663831 () Bool)

(assert (=> d!118483 (=> (not res!663831) (not e!560465))))

(assert (=> d!118483 (= res!663831 (is-Cons!20913 l!3519))))

(assert (=> d!118483 (= (contains!5778 l!3519 e!29) lt!440479)))

(declare-fun b!993231 () Bool)

(declare-fun e!560466 () Bool)

(assert (=> b!993231 (= e!560465 e!560466)))

(declare-fun res!663830 () Bool)

(assert (=> b!993231 (=> res!663830 e!560466)))

(assert (=> b!993231 (= res!663830 (= (h!22075 l!3519) e!29))))

(declare-fun b!993232 () Bool)

(assert (=> b!993232 (= e!560466 (contains!5778 (t!29918 l!3519) e!29))))

(assert (= (and d!118483 res!663831) b!993231))

(assert (= (and b!993231 (not res!663830)) b!993232))

(declare-fun m!920983 () Bool)

(assert (=> d!118483 m!920983))

(declare-fun m!920985 () Bool)

(assert (=> d!118483 m!920985))

(declare-fun m!920987 () Bool)

(assert (=> b!993232 m!920987))

(assert (=> start!85388 d!118483))

(declare-fun d!118493 () Bool)

(assert (=> d!118493 (= (isEmpty!768 (unapply!40 l!3519)) (not (is-Some!560 (unapply!40 l!3519))))))

(assert (=> b!993207 d!118493))

(declare-fun d!118497 () Bool)

(assert (=> d!118497 (= (unapply!40 l!3519) (ite (is-Nil!20914 l!3519) None!559 (Some!560 (tuple2!15013 (h!22075 l!3519) (t!29918 l!3519)))))))

(assert (=> b!993207 d!118497))

(push 1)

