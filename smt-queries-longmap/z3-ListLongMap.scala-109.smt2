; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1794 () Bool)

(assert start!1794)

(declare-fun b!12575 () Bool)

(declare-fun e!7522 () Bool)

(declare-fun tp_is_empty!631 () Bool)

(declare-fun tp!2096 () Bool)

(assert (=> b!12575 (= e!7522 (and tp_is_empty!631 tp!2096))))

(declare-fun res!10093 () Bool)

(declare-fun e!7523 () Bool)

(assert (=> start!1794 (=> (not res!10093) (not e!7523))))

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

(declare-fun isStrictlySorted!66 (List!372) Bool)

(assert (=> start!1794 (= res!10093 (isStrictlySorted!66 l!1094))))

(assert (=> start!1794 e!7523))

(assert (=> start!1794 e!7522))

(assert (=> start!1794 true))

(assert (=> start!1794 tp_is_empty!631))

(declare-fun b!12574 () Bool)

(declare-fun key!303 () (_ BitVec 64))

(declare-fun v!194 () B!458)

(declare-fun contains!184 (List!372 tuple2!444) Bool)

(assert (=> b!12574 (= e!7523 (not (contains!184 l!1094 (tuple2!445 key!303 v!194))))))

(declare-fun b!12572 () Bool)

(declare-fun res!10091 () Bool)

(assert (=> b!12572 (=> (not res!10091) (not e!7523))))

(declare-datatypes ((Option!56 0))(
  ( (Some!55 (v!1376 B!458)) (None!54) )
))
(declare-fun getValueByKey!50 (List!372 (_ BitVec 64)) Option!56)

(assert (=> b!12572 (= res!10091 (= (getValueByKey!50 l!1094 key!303) (Some!55 v!194)))))

(declare-fun b!12573 () Bool)

(declare-fun res!10092 () Bool)

(assert (=> b!12573 (=> (not res!10092) (not e!7523))))

(get-info :version)

(assert (=> b!12573 (= res!10092 (or (not ((_ is Cons!368) l!1094)) (= (_1!222 (h!934 l!1094)) key!303)))))

(assert (= (and start!1794 res!10093) b!12572))

(assert (= (and b!12572 res!10091) b!12573))

(assert (= (and b!12573 res!10092) b!12574))

(assert (= (and start!1794 ((_ is Cons!368) l!1094)) b!12575))

(declare-fun m!8547 () Bool)

(assert (=> start!1794 m!8547))

(declare-fun m!8549 () Bool)

(assert (=> b!12574 m!8549))

(declare-fun m!8551 () Bool)

(assert (=> b!12572 m!8551))

(check-sat (not b!12574) (not b!12575) (not start!1794) tp_is_empty!631 (not b!12572))
(check-sat)
(get-model)

(declare-fun b!12621 () Bool)

(declare-fun e!7547 () Option!56)

(assert (=> b!12621 (= e!7547 None!54)))

(declare-fun b!12618 () Bool)

(declare-fun e!7545 () Option!56)

(assert (=> b!12618 (= e!7545 e!7547)))

(declare-fun c!1136 () Bool)

(assert (=> b!12618 (= c!1136 (and ((_ is Cons!368) l!1094) (not (= (_1!222 (h!934 l!1094)) key!303))))))

(declare-fun d!1797 () Bool)

(declare-fun c!1134 () Bool)

(assert (=> d!1797 (= c!1134 (and ((_ is Cons!368) l!1094) (= (_1!222 (h!934 l!1094)) key!303)))))

(assert (=> d!1797 (= (getValueByKey!50 l!1094 key!303) e!7545)))

(declare-fun b!12620 () Bool)

(assert (=> b!12620 (= e!7547 (getValueByKey!50 (t!2759 l!1094) key!303))))

(declare-fun b!12616 () Bool)

(assert (=> b!12616 (= e!7545 (Some!55 (_2!222 (h!934 l!1094))))))

(assert (= (and d!1797 c!1134) b!12616))

(assert (= (and d!1797 (not c!1134)) b!12618))

(assert (= (and b!12618 c!1136) b!12620))

(assert (= (and b!12618 (not c!1136)) b!12621))

(declare-fun m!8567 () Bool)

(assert (=> b!12620 m!8567))

(assert (=> b!12572 d!1797))

(declare-fun d!1803 () Bool)

(declare-fun res!10122 () Bool)

(declare-fun e!7558 () Bool)

(assert (=> d!1803 (=> res!10122 e!7558)))

(assert (=> d!1803 (= res!10122 (or ((_ is Nil!369) l!1094) ((_ is Nil!369) (t!2759 l!1094))))))

(assert (=> d!1803 (= (isStrictlySorted!66 l!1094) e!7558)))

(declare-fun b!12634 () Bool)

(declare-fun e!7559 () Bool)

(assert (=> b!12634 (= e!7558 e!7559)))

(declare-fun res!10123 () Bool)

(assert (=> b!12634 (=> (not res!10123) (not e!7559))))

(assert (=> b!12634 (= res!10123 (bvslt (_1!222 (h!934 l!1094)) (_1!222 (h!934 (t!2759 l!1094)))))))

(declare-fun b!12635 () Bool)

(assert (=> b!12635 (= e!7559 (isStrictlySorted!66 (t!2759 l!1094)))))

(assert (= (and d!1803 (not res!10122)) b!12634))

(assert (= (and b!12634 res!10123) b!12635))

(declare-fun m!8571 () Bool)

(assert (=> b!12635 m!8571))

(assert (=> start!1794 d!1803))

(declare-fun lt!3180 () Bool)

(declare-fun d!1809 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!12 (List!372) (InoxSet tuple2!444))

(assert (=> d!1809 (= lt!3180 (select (content!12 l!1094) (tuple2!445 key!303 v!194)))))

(declare-fun e!7575 () Bool)

(assert (=> d!1809 (= lt!3180 e!7575)))

(declare-fun res!10134 () Bool)

(assert (=> d!1809 (=> (not res!10134) (not e!7575))))

(assert (=> d!1809 (= res!10134 ((_ is Cons!368) l!1094))))

(assert (=> d!1809 (= (contains!184 l!1094 (tuple2!445 key!303 v!194)) lt!3180)))

(declare-fun b!12654 () Bool)

(declare-fun e!7574 () Bool)

(assert (=> b!12654 (= e!7575 e!7574)))

(declare-fun res!10135 () Bool)

(assert (=> b!12654 (=> res!10135 e!7574)))

(assert (=> b!12654 (= res!10135 (= (h!934 l!1094) (tuple2!445 key!303 v!194)))))

(declare-fun b!12655 () Bool)

(assert (=> b!12655 (= e!7574 (contains!184 (t!2759 l!1094) (tuple2!445 key!303 v!194)))))

(assert (= (and d!1809 res!10134) b!12654))

(assert (= (and b!12654 (not res!10135)) b!12655))

(declare-fun m!8575 () Bool)

(assert (=> d!1809 m!8575))

(declare-fun m!8579 () Bool)

(assert (=> d!1809 m!8579))

(declare-fun m!8583 () Bool)

(assert (=> b!12655 m!8583))

(assert (=> b!12574 d!1809))

(declare-fun b!12664 () Bool)

(declare-fun e!7580 () Bool)

(declare-fun tp!2107 () Bool)

(assert (=> b!12664 (= e!7580 (and tp_is_empty!631 tp!2107))))

(assert (=> b!12575 (= tp!2096 e!7580)))

(assert (= (and b!12575 ((_ is Cons!368) (t!2759 l!1094))) b!12664))

(check-sat (not b!12635) (not b!12664) (not b!12620) (not d!1809) (not b!12655) tp_is_empty!631)
(check-sat)
