; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1794 () Bool)

(assert start!1794)

(declare-fun res!10090 () Bool)

(declare-fun e!7519 () Bool)

(assert (=> start!1794 (=> (not res!10090) (not e!7519))))

(declare-datatypes ((B!458 0))(
  ( (B!459 (val!324 Int)) )
))
(declare-datatypes ((tuple2!444 0))(
  ( (tuple2!445 (_1!222 (_ BitVec 64)) (_2!222 B!458)) )
))
(declare-datatypes ((List!372 0))(
  ( (Nil!369) (Cons!368 (h!934 tuple2!444) (t!2759 List!372)) )
))
(declare-fun l!1094 () List!372)

(declare-fun isStrictlySorted!63 (List!372) Bool)

(assert (=> start!1794 (= res!10090 (isStrictlySorted!63 l!1094))))

(assert (=> start!1794 e!7519))

(declare-fun e!7518 () Bool)

(assert (=> start!1794 e!7518))

(assert (=> start!1794 true))

(declare-fun tp_is_empty!631 () Bool)

(assert (=> start!1794 tp_is_empty!631))

(declare-fun b!12567 () Bool)

(declare-fun res!10091 () Bool)

(assert (=> b!12567 (=> (not res!10091) (not e!7519))))

(declare-fun key!303 () (_ BitVec 64))

(get-info :version)

(assert (=> b!12567 (= res!10091 (or (not ((_ is Cons!368) l!1094)) (= (_1!222 (h!934 l!1094)) key!303)))))

(declare-fun b!12566 () Bool)

(declare-fun res!10089 () Bool)

(assert (=> b!12566 (=> (not res!10089) (not e!7519))))

(declare-fun v!194 () B!458)

(declare-datatypes ((Option!56 0))(
  ( (Some!55 (v!1376 B!458)) (None!54) )
))
(declare-fun getValueByKey!50 (List!372 (_ BitVec 64)) Option!56)

(assert (=> b!12566 (= res!10089 (= (getValueByKey!50 l!1094 key!303) (Some!55 v!194)))))

(declare-fun b!12569 () Bool)

(declare-fun tp!2096 () Bool)

(assert (=> b!12569 (= e!7518 (and tp_is_empty!631 tp!2096))))

(declare-fun b!12568 () Bool)

(declare-fun contains!184 (List!372 tuple2!444) Bool)

(assert (=> b!12568 (= e!7519 (not (contains!184 l!1094 (tuple2!445 key!303 v!194))))))

(assert (= (and start!1794 res!10090) b!12566))

(assert (= (and b!12566 res!10089) b!12567))

(assert (= (and b!12567 res!10091) b!12568))

(assert (= (and start!1794 ((_ is Cons!368) l!1094)) b!12569))

(declare-fun m!8541 () Bool)

(assert (=> start!1794 m!8541))

(declare-fun m!8543 () Bool)

(assert (=> b!12566 m!8543))

(declare-fun m!8545 () Bool)

(assert (=> b!12568 m!8545))

(check-sat (not start!1794) (not b!12566) (not b!12568) (not b!12569) tp_is_empty!631)
(check-sat)
(get-model)

(declare-fun b!12608 () Bool)

(declare-fun e!7541 () Option!56)

(assert (=> b!12608 (= e!7541 (getValueByKey!50 (t!2759 l!1094) key!303))))

(declare-fun b!12606 () Bool)

(declare-fun e!7540 () Option!56)

(assert (=> b!12606 (= e!7540 (Some!55 (_2!222 (h!934 l!1094))))))

(declare-fun b!12607 () Bool)

(assert (=> b!12607 (= e!7540 e!7541)))

(declare-fun c!1128 () Bool)

(assert (=> b!12607 (= c!1128 (and ((_ is Cons!368) l!1094) (not (= (_1!222 (h!934 l!1094)) key!303))))))

(declare-fun d!1793 () Bool)

(declare-fun c!1127 () Bool)

(assert (=> d!1793 (= c!1127 (and ((_ is Cons!368) l!1094) (= (_1!222 (h!934 l!1094)) key!303)))))

(assert (=> d!1793 (= (getValueByKey!50 l!1094 key!303) e!7540)))

(declare-fun b!12609 () Bool)

(assert (=> b!12609 (= e!7541 None!54)))

(assert (= (and d!1793 c!1127) b!12606))

(assert (= (and d!1793 (not c!1127)) b!12607))

(assert (= (and b!12607 c!1128) b!12608))

(assert (= (and b!12607 (not c!1128)) b!12609))

(declare-fun m!8559 () Bool)

(assert (=> b!12608 m!8559))

(assert (=> b!12566 d!1793))

(declare-fun d!1797 () Bool)

(declare-fun res!10124 () Bool)

(declare-fun e!7552 () Bool)

(assert (=> d!1797 (=> res!10124 e!7552)))

(assert (=> d!1797 (= res!10124 (or ((_ is Nil!369) l!1094) ((_ is Nil!369) (t!2759 l!1094))))))

(assert (=> d!1797 (= (isStrictlySorted!63 l!1094) e!7552)))

(declare-fun b!12620 () Bool)

(declare-fun e!7553 () Bool)

(assert (=> b!12620 (= e!7552 e!7553)))

(declare-fun res!10125 () Bool)

(assert (=> b!12620 (=> (not res!10125) (not e!7553))))

(assert (=> b!12620 (= res!10125 (bvslt (_1!222 (h!934 l!1094)) (_1!222 (h!934 (t!2759 l!1094)))))))

(declare-fun b!12621 () Bool)

(assert (=> b!12621 (= e!7553 (isStrictlySorted!63 (t!2759 l!1094)))))

(assert (= (and d!1797 (not res!10124)) b!12620))

(assert (= (and b!12620 res!10125) b!12621))

(declare-fun m!8563 () Bool)

(assert (=> b!12621 m!8563))

(assert (=> start!1794 d!1797))

(declare-fun lt!3180 () Bool)

(declare-fun d!1803 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!13 (List!372) (InoxSet tuple2!444))

(assert (=> d!1803 (= lt!3180 (select (content!13 l!1094) (tuple2!445 key!303 v!194)))))

(declare-fun e!7568 () Bool)

(assert (=> d!1803 (= lt!3180 e!7568)))

(declare-fun res!10137 () Bool)

(assert (=> d!1803 (=> (not res!10137) (not e!7568))))

(assert (=> d!1803 (= res!10137 ((_ is Cons!368) l!1094))))

(assert (=> d!1803 (= (contains!184 l!1094 (tuple2!445 key!303 v!194)) lt!3180)))

(declare-fun b!12640 () Bool)

(declare-fun e!7569 () Bool)

(assert (=> b!12640 (= e!7568 e!7569)))

(declare-fun res!10136 () Bool)

(assert (=> b!12640 (=> res!10136 e!7569)))

(assert (=> b!12640 (= res!10136 (= (h!934 l!1094) (tuple2!445 key!303 v!194)))))

(declare-fun b!12641 () Bool)

(assert (=> b!12641 (= e!7569 (contains!184 (t!2759 l!1094) (tuple2!445 key!303 v!194)))))

(assert (= (and d!1803 res!10137) b!12640))

(assert (= (and b!12640 (not res!10136)) b!12641))

(declare-fun m!8571 () Bool)

(assert (=> d!1803 m!8571))

(declare-fun m!8573 () Bool)

(assert (=> d!1803 m!8573))

(declare-fun m!8575 () Bool)

(assert (=> b!12641 m!8575))

(assert (=> b!12568 d!1803))

(declare-fun b!12648 () Bool)

(declare-fun e!7574 () Bool)

(declare-fun tp!2105 () Bool)

(assert (=> b!12648 (= e!7574 (and tp_is_empty!631 tp!2105))))

(assert (=> b!12569 (= tp!2096 e!7574)))

(assert (= (and b!12569 ((_ is Cons!368) (t!2759 l!1094))) b!12648))

(check-sat (not b!12641) (not b!12621) (not d!1803) (not b!12608) tp_is_empty!631 (not b!12648))
(check-sat)
