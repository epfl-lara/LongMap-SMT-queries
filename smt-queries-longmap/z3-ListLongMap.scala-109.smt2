; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1796 () Bool)

(assert start!1796)

(declare-datatypes ((B!460 0))(
  ( (B!461 (val!325 Int)) )
))
(declare-fun v!194 () B!460)

(declare-datatypes ((tuple2!450 0))(
  ( (tuple2!451 (_1!225 (_ BitVec 64)) (_2!225 B!460)) )
))
(declare-datatypes ((List!377 0))(
  ( (Nil!374) (Cons!373 (h!939 tuple2!450) (t!2764 List!377)) )
))
(declare-fun l!1094 () List!377)

(declare-fun key!303 () (_ BitVec 64))

(declare-fun e!7529 () Bool)

(declare-fun b!12586 () Bool)

(declare-fun contains!187 (List!377 tuple2!450) Bool)

(assert (=> b!12586 (= e!7529 (not (contains!187 l!1094 (tuple2!451 key!303 v!194))))))

(declare-fun res!10100 () Bool)

(assert (=> start!1796 (=> (not res!10100) (not e!7529))))

(declare-fun isStrictlySorted!70 (List!377) Bool)

(assert (=> start!1796 (= res!10100 (isStrictlySorted!70 l!1094))))

(assert (=> start!1796 e!7529))

(declare-fun e!7528 () Bool)

(assert (=> start!1796 e!7528))

(assert (=> start!1796 true))

(declare-fun tp_is_empty!633 () Bool)

(assert (=> start!1796 tp_is_empty!633))

(declare-fun b!12587 () Bool)

(declare-fun tp!2099 () Bool)

(assert (=> b!12587 (= e!7528 (and tp_is_empty!633 tp!2099))))

(declare-fun b!12584 () Bool)

(declare-fun res!10101 () Bool)

(assert (=> b!12584 (=> (not res!10101) (not e!7529))))

(declare-datatypes ((Option!57 0))(
  ( (Some!56 (v!1377 B!460)) (None!55) )
))
(declare-fun getValueByKey!51 (List!377 (_ BitVec 64)) Option!57)

(assert (=> b!12584 (= res!10101 (= (getValueByKey!51 l!1094 key!303) (Some!56 v!194)))))

(declare-fun b!12585 () Bool)

(declare-fun res!10102 () Bool)

(assert (=> b!12585 (=> (not res!10102) (not e!7529))))

(get-info :version)

(assert (=> b!12585 (= res!10102 (or (not ((_ is Cons!373) l!1094)) (= (_1!225 (h!939 l!1094)) key!303)))))

(assert (= (and start!1796 res!10100) b!12584))

(assert (= (and b!12584 res!10101) b!12585))

(assert (= (and b!12585 res!10102) b!12586))

(assert (= (and start!1796 ((_ is Cons!373) l!1094)) b!12587))

(declare-fun m!8555 () Bool)

(assert (=> b!12586 m!8555))

(declare-fun m!8557 () Bool)

(assert (=> start!1796 m!8557))

(declare-fun m!8559 () Bool)

(assert (=> b!12584 m!8559))

(check-sat (not b!12587) tp_is_empty!633 (not start!1796) (not b!12584) (not b!12586))
(check-sat)
(get-model)

(declare-fun d!1797 () Bool)

(declare-fun res!10122 () Bool)

(declare-fun e!7546 () Bool)

(assert (=> d!1797 (=> res!10122 e!7546)))

(assert (=> d!1797 (= res!10122 (or ((_ is Nil!374) l!1094) ((_ is Nil!374) (t!2764 l!1094))))))

(assert (=> d!1797 (= (isStrictlySorted!70 l!1094) e!7546)))

(declare-fun b!12610 () Bool)

(declare-fun e!7547 () Bool)

(assert (=> b!12610 (= e!7546 e!7547)))

(declare-fun res!10123 () Bool)

(assert (=> b!12610 (=> (not res!10123) (not e!7547))))

(assert (=> b!12610 (= res!10123 (bvslt (_1!225 (h!939 l!1094)) (_1!225 (h!939 (t!2764 l!1094)))))))

(declare-fun b!12611 () Bool)

(assert (=> b!12611 (= e!7547 (isStrictlySorted!70 (t!2764 l!1094)))))

(assert (= (and d!1797 (not res!10122)) b!12610))

(assert (= (and b!12610 res!10123) b!12611))

(declare-fun m!8569 () Bool)

(assert (=> b!12611 m!8569))

(assert (=> start!1796 d!1797))

(declare-fun lt!3182 () Bool)

(declare-fun d!1805 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!12 (List!377) (InoxSet tuple2!450))

(assert (=> d!1805 (= lt!3182 (select (content!12 l!1094) (tuple2!451 key!303 v!194)))))

(declare-fun e!7568 () Bool)

(assert (=> d!1805 (= lt!3182 e!7568)))

(declare-fun res!10145 () Bool)

(assert (=> d!1805 (=> (not res!10145) (not e!7568))))

(assert (=> d!1805 (= res!10145 ((_ is Cons!373) l!1094))))

(assert (=> d!1805 (= (contains!187 l!1094 (tuple2!451 key!303 v!194)) lt!3182)))

(declare-fun b!12632 () Bool)

(declare-fun e!7569 () Bool)

(assert (=> b!12632 (= e!7568 e!7569)))

(declare-fun res!10144 () Bool)

(assert (=> b!12632 (=> res!10144 e!7569)))

(assert (=> b!12632 (= res!10144 (= (h!939 l!1094) (tuple2!451 key!303 v!194)))))

(declare-fun b!12633 () Bool)

(assert (=> b!12633 (= e!7569 (contains!187 (t!2764 l!1094) (tuple2!451 key!303 v!194)))))

(assert (= (and d!1805 res!10145) b!12632))

(assert (= (and b!12632 (not res!10144)) b!12633))

(declare-fun m!8579 () Bool)

(assert (=> d!1805 m!8579))

(declare-fun m!8581 () Bool)

(assert (=> d!1805 m!8581))

(declare-fun m!8583 () Bool)

(assert (=> b!12633 m!8583))

(assert (=> b!12586 d!1805))

(declare-fun b!12671 () Bool)

(declare-fun e!7590 () Option!57)

(assert (=> b!12671 (= e!7590 (getValueByKey!51 (t!2764 l!1094) key!303))))

(declare-fun b!12670 () Bool)

(declare-fun e!7589 () Option!57)

(assert (=> b!12670 (= e!7589 e!7590)))

(declare-fun c!1140 () Bool)

(assert (=> b!12670 (= c!1140 (and ((_ is Cons!373) l!1094) (not (= (_1!225 (h!939 l!1094)) key!303))))))

(declare-fun d!1811 () Bool)

(declare-fun c!1139 () Bool)

(assert (=> d!1811 (= c!1139 (and ((_ is Cons!373) l!1094) (= (_1!225 (h!939 l!1094)) key!303)))))

(assert (=> d!1811 (= (getValueByKey!51 l!1094 key!303) e!7589)))

(declare-fun b!12672 () Bool)

(assert (=> b!12672 (= e!7590 None!55)))

(declare-fun b!12669 () Bool)

(assert (=> b!12669 (= e!7589 (Some!56 (_2!225 (h!939 l!1094))))))

(assert (= (and d!1811 c!1139) b!12669))

(assert (= (and d!1811 (not c!1139)) b!12670))

(assert (= (and b!12670 c!1140) b!12671))

(assert (= (and b!12670 (not c!1140)) b!12672))

(declare-fun m!8593 () Bool)

(assert (=> b!12671 m!8593))

(assert (=> b!12584 d!1811))

(declare-fun b!12677 () Bool)

(declare-fun e!7593 () Bool)

(declare-fun tp!2108 () Bool)

(assert (=> b!12677 (= e!7593 (and tp_is_empty!633 tp!2108))))

(assert (=> b!12587 (= tp!2099 e!7593)))

(assert (= (and b!12587 ((_ is Cons!373) (t!2764 l!1094))) b!12677))

(check-sat (not b!12633) tp_is_empty!633 (not d!1805) (not b!12671) (not b!12677) (not b!12611))
(check-sat)
