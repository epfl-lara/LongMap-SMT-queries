; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85392 () Bool)

(assert start!85392)

(declare-fun res!663818 () Bool)

(declare-fun e!560454 () Bool)

(assert (=> start!85392 (=> (not res!663818) (not e!560454))))

(declare-datatypes ((List!20919 0))(
  ( (Nil!20916) (Cons!20915 (h!22077 (_ BitVec 64)) (t!29920 List!20919)) )
))
(declare-fun l!3519 () List!20919)

(declare-fun e!29 () (_ BitVec 64))

(declare-fun contains!5780 (List!20919 (_ BitVec 64)) Bool)

(assert (=> start!85392 (= res!663818 (not (contains!5780 l!3519 e!29)))))

(assert (=> start!85392 e!560454))

(assert (=> start!85392 true))

(declare-fun b!993219 () Bool)

(declare-fun res!663819 () Bool)

(assert (=> b!993219 (=> (not res!663819) (not e!560454))))

(declare-datatypes ((tuple2!15016 0))(
  ( (tuple2!15017 (_1!7519 (_ BitVec 64)) (_2!7519 List!20919)) )
))
(declare-datatypes ((Option!563 0))(
  ( (Some!562 (v!14396 tuple2!15016)) (None!561) )
))
(declare-fun isEmpty!770 (Option!563) Bool)

(declare-fun unapply!42 (List!20919) Option!563)

(assert (=> b!993219 (= res!663819 (isEmpty!770 (unapply!42 l!3519)))))

(declare-fun b!993220 () Bool)

(assert (=> b!993220 (= e!560454 (not (is-Nil!20916 l!3519)))))

(assert (= (and start!85392 res!663818) b!993219))

(assert (= (and b!993219 res!663819) b!993220))

(declare-fun m!920971 () Bool)

(assert (=> start!85392 m!920971))

(declare-fun m!920973 () Bool)

(assert (=> b!993219 m!920973))

(assert (=> b!993219 m!920973))

(declare-fun m!920975 () Bool)

(assert (=> b!993219 m!920975))

(push 1)

(assert (not start!85392))

(assert (not b!993219))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!118481 () Bool)

(declare-fun lt!440478 () Bool)

(declare-fun content!470 (List!20919) (Set (_ BitVec 64)))

(assert (=> d!118481 (= lt!440478 (member e!29 (content!470 l!3519)))))

(declare-fun e!560463 () Bool)

(assert (=> d!118481 (= lt!440478 e!560463)))

(declare-fun res!663829 () Bool)

(assert (=> d!118481 (=> (not res!663829) (not e!560463))))

(assert (=> d!118481 (= res!663829 (is-Cons!20915 l!3519))))

(assert (=> d!118481 (= (contains!5780 l!3519 e!29) lt!440478)))

(declare-fun b!993229 () Bool)

(declare-fun e!560464 () Bool)

(assert (=> b!993229 (= e!560463 e!560464)))

(declare-fun res!663828 () Bool)

(assert (=> b!993229 (=> res!663828 e!560464)))

(assert (=> b!993229 (= res!663828 (= (h!22077 l!3519) e!29))))

(declare-fun b!993230 () Bool)

(assert (=> b!993230 (= e!560464 (contains!5780 (t!29920 l!3519) e!29))))

(assert (= (and d!118481 res!663829) b!993229))

(assert (= (and b!993229 (not res!663828)) b!993230))

(declare-fun m!920977 () Bool)

(assert (=> d!118481 m!920977))

(declare-fun m!920979 () Bool)

(assert (=> d!118481 m!920979))

(declare-fun m!920981 () Bool)

(assert (=> b!993230 m!920981))

(assert (=> start!85392 d!118481))

(declare-fun d!118491 () Bool)

(assert (=> d!118491 (= (isEmpty!770 (unapply!42 l!3519)) (not (is-Some!562 (unapply!42 l!3519))))))

(assert (=> b!993219 d!118491))

(declare-fun d!118495 () Bool)

(assert (=> d!118495 (= (unapply!42 l!3519) (ite (is-Nil!20916 l!3519) None!561 (Some!562 (tuple2!15017 (h!22077 l!3519) (t!29920 l!3519)))))))

(assert (=> b!993219 d!118495))

(push 1)

