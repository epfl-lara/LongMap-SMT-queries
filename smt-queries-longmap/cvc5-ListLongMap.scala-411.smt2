; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7690 () Bool)

(assert start!7690)

(declare-fun b!48999 () Bool)

(declare-fun res!28411 () Bool)

(declare-fun e!31468 () Bool)

(assert (=> b!48999 (=> (not res!28411) (not e!31468))))

(declare-datatypes ((B!980 0))(
  ( (B!981 (val!1110 Int)) )
))
(declare-datatypes ((tuple2!1802 0))(
  ( (tuple2!1803 (_1!912 (_ BitVec 64)) (_2!912 B!980)) )
))
(declare-datatypes ((List!1307 0))(
  ( (Nil!1304) (Cons!1303 (h!1883 tuple2!1802) (t!4338 List!1307)) )
))
(declare-fun l!1333 () List!1307)

(assert (=> b!48999 (= res!28411 (not (is-Nil!1304 l!1333)))))

(declare-fun b!49001 () Bool)

(declare-fun e!31467 () Bool)

(declare-fun tp_is_empty!2131 () Bool)

(declare-fun tp!6476 () Bool)

(assert (=> b!49001 (= e!31467 (and tp_is_empty!2131 tp!6476))))

(declare-fun res!28412 () Bool)

(assert (=> start!7690 (=> (not res!28412) (not e!31468))))

(declare-fun isStrictlySorted!271 (List!1307) Bool)

(assert (=> start!7690 (= res!28412 (isStrictlySorted!271 l!1333))))

(assert (=> start!7690 e!31468))

(assert (=> start!7690 e!31467))

(assert (=> start!7690 true))

(declare-fun b!49000 () Bool)

(declare-fun ListPrimitiveSize!52 (List!1307) Int)

(assert (=> b!49000 (= e!31468 (>= (ListPrimitiveSize!52 (t!4338 l!1333)) (ListPrimitiveSize!52 l!1333)))))

(declare-fun b!48998 () Bool)

(declare-fun res!28410 () Bool)

(assert (=> b!48998 (=> (not res!28410) (not e!31468))))

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun containsKey!120 (List!1307 (_ BitVec 64)) Bool)

(assert (=> b!48998 (= res!28410 (not (containsKey!120 l!1333 newKey!147)))))

(assert (= (and start!7690 res!28412) b!48998))

(assert (= (and b!48998 res!28410) b!48999))

(assert (= (and b!48999 res!28411) b!49000))

(assert (= (and start!7690 (is-Cons!1303 l!1333)) b!49001))

(declare-fun m!42567 () Bool)

(assert (=> start!7690 m!42567))

(declare-fun m!42569 () Bool)

(assert (=> b!49000 m!42569))

(declare-fun m!42571 () Bool)

(assert (=> b!49000 m!42571))

(declare-fun m!42573 () Bool)

(assert (=> b!48998 m!42573))

(push 1)

(assert (not b!48998))

(assert tp_is_empty!2131)

(assert (not b!49000))

(assert (not b!49001))

(assert (not start!7690))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9763 () Bool)

(declare-fun res!28439 () Bool)

(declare-fun e!31491 () Bool)

(assert (=> d!9763 (=> res!28439 e!31491)))

(assert (=> d!9763 (= res!28439 (or (is-Nil!1304 l!1333) (is-Nil!1304 (t!4338 l!1333))))))

(assert (=> d!9763 (= (isStrictlySorted!271 l!1333) e!31491)))

(declare-fun b!49038 () Bool)

(declare-fun e!31492 () Bool)

(assert (=> b!49038 (= e!31491 e!31492)))

(declare-fun res!28440 () Bool)

(assert (=> b!49038 (=> (not res!28440) (not e!31492))))

(assert (=> b!49038 (= res!28440 (bvslt (_1!912 (h!1883 l!1333)) (_1!912 (h!1883 (t!4338 l!1333)))))))

(declare-fun b!49039 () Bool)

(assert (=> b!49039 (= e!31492 (isStrictlySorted!271 (t!4338 l!1333)))))

(assert (= (and d!9763 (not res!28439)) b!49038))

(assert (= (and b!49038 res!28440) b!49039))

(declare-fun m!42591 () Bool)

(assert (=> b!49039 m!42591))

(assert (=> start!7690 d!9763))

(declare-fun d!9767 () Bool)

(declare-fun res!28451 () Bool)

(declare-fun e!31509 () Bool)

(assert (=> d!9767 (=> res!28451 e!31509)))

(assert (=> d!9767 (= res!28451 (and (is-Cons!1303 l!1333) (= (_1!912 (h!1883 l!1333)) newKey!147)))))

(assert (=> d!9767 (= (containsKey!120 l!1333 newKey!147) e!31509)))

(declare-fun b!49062 () Bool)

(declare-fun e!31510 () Bool)

(assert (=> b!49062 (= e!31509 e!31510)))

(declare-fun res!28452 () Bool)

(assert (=> b!49062 (=> (not res!28452) (not e!31510))))

(assert (=> b!49062 (= res!28452 (and (or (not (is-Cons!1303 l!1333)) (bvsle (_1!912 (h!1883 l!1333)) newKey!147)) (is-Cons!1303 l!1333) (bvslt (_1!912 (h!1883 l!1333)) newKey!147)))))

(declare-fun b!49063 () Bool)

(assert (=> b!49063 (= e!31510 (containsKey!120 (t!4338 l!1333) newKey!147))))

(assert (= (and d!9767 (not res!28451)) b!49062))

(assert (= (and b!49062 res!28452) b!49063))

(declare-fun m!42599 () Bool)

(assert (=> b!49063 m!42599))

(assert (=> b!48998 d!9767))

(declare-fun d!9779 () Bool)

(declare-fun lt!20713 () Int)

(assert (=> d!9779 (>= lt!20713 0)))

(declare-fun e!31525 () Int)

(assert (=> d!9779 (= lt!20713 e!31525)))

(declare-fun c!6605 () Bool)

(assert (=> d!9779 (= c!6605 (is-Nil!1304 (t!4338 l!1333)))))

(assert (=> d!9779 (= (ListPrimitiveSize!52 (t!4338 l!1333)) lt!20713)))

(declare-fun b!49080 () Bool)

(assert (=> b!49080 (= e!31525 0)))

(declare-fun b!49081 () Bool)

(assert (=> b!49081 (= e!31525 (+ 1 (ListPrimitiveSize!52 (t!4338 (t!4338 l!1333)))))))

(assert (= (and d!9779 c!6605) b!49080))

(assert (= (and d!9779 (not c!6605)) b!49081))

(declare-fun m!42605 () Bool)

(assert (=> b!49081 m!42605))

(assert (=> b!49000 d!9779))

(declare-fun d!9783 () Bool)

(declare-fun lt!20714 () Int)

(assert (=> d!9783 (>= lt!20714 0)))

(declare-fun e!31528 () Int)

(assert (=> d!9783 (= lt!20714 e!31528)))

(declare-fun c!6606 () Bool)

(assert (=> d!9783 (= c!6606 (is-Nil!1304 l!1333))))

(assert (=> d!9783 (= (ListPrimitiveSize!52 l!1333) lt!20714)))

(declare-fun b!49086 () Bool)

(assert (=> b!49086 (= e!31528 0)))

(declare-fun b!49087 () Bool)

(assert (=> b!49087 (= e!31528 (+ 1 (ListPrimitiveSize!52 (t!4338 l!1333))))))

(assert (= (and d!9783 c!6606) b!49086))

(assert (= (and d!9783 (not c!6606)) b!49087))

(assert (=> b!49087 m!42569))

(assert (=> b!49000 d!9783))

(declare-fun b!49095 () Bool)

(declare-fun e!31534 () Bool)

(declare-fun tp!6488 () Bool)

(assert (=> b!49095 (= e!31534 (and tp_is_empty!2131 tp!6488))))

(assert (=> b!49001 (= tp!6476 e!31534)))

(assert (= (and b!49001 (is-Cons!1303 (t!4338 l!1333))) b!49095))

(push 1)

