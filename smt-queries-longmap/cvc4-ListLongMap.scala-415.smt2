; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7784 () Bool)

(assert start!7784)

(declare-datatypes ((B!1008 0))(
  ( (B!1009 (val!1124 Int)) )
))
(declare-datatypes ((tuple2!1830 0))(
  ( (tuple2!1831 (_1!926 (_ BitVec 64)) (_2!926 B!1008)) )
))
(declare-datatypes ((List!1321 0))(
  ( (Nil!1318) (Cons!1317 (h!1897 tuple2!1830) (t!4355 List!1321)) )
))
(declare-datatypes ((ListLongMap!1251 0))(
  ( (ListLongMap!1252 (toList!641 List!1321)) )
))
(declare-fun thiss!192 () ListLongMap!1251)

(declare-fun isStrictlySorted!279 (List!1321) Bool)

(assert (=> start!7784 (not (isStrictlySorted!279 (toList!641 thiss!192)))))

(declare-fun e!31753 () Bool)

(declare-fun inv!2306 (ListLongMap!1251) Bool)

(assert (=> start!7784 (and (inv!2306 thiss!192) e!31753)))

(declare-fun b!49421 () Bool)

(declare-fun tp!6539 () Bool)

(assert (=> b!49421 (= e!31753 tp!6539)))

(assert (= start!7784 b!49421))

(declare-fun m!42845 () Bool)

(assert (=> start!7784 m!42845))

(declare-fun m!42847 () Bool)

(assert (=> start!7784 m!42847))

(push 1)

(assert (not start!7784))

(assert (not b!49421))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9897 () Bool)

(declare-fun res!28610 () Bool)

(declare-fun e!31768 () Bool)

(assert (=> d!9897 (=> res!28610 e!31768)))

(assert (=> d!9897 (= res!28610 (or (is-Nil!1318 (toList!641 thiss!192)) (is-Nil!1318 (t!4355 (toList!641 thiss!192)))))))

(assert (=> d!9897 (= (isStrictlySorted!279 (toList!641 thiss!192)) e!31768)))

(declare-fun b!49436 () Bool)

(declare-fun e!31769 () Bool)

(assert (=> b!49436 (= e!31768 e!31769)))

(declare-fun res!28611 () Bool)

(assert (=> b!49436 (=> (not res!28611) (not e!31769))))

(assert (=> b!49436 (= res!28611 (bvslt (_1!926 (h!1897 (toList!641 thiss!192))) (_1!926 (h!1897 (t!4355 (toList!641 thiss!192))))))))

(declare-fun b!49437 () Bool)

(assert (=> b!49437 (= e!31769 (isStrictlySorted!279 (t!4355 (toList!641 thiss!192))))))

(assert (= (and d!9897 (not res!28610)) b!49436))

(assert (= (and b!49436 res!28611) b!49437))

(declare-fun m!42851 () Bool)

(assert (=> b!49437 m!42851))

(assert (=> start!7784 d!9897))

(declare-fun d!9903 () Bool)

(assert (=> d!9903 (= (inv!2306 thiss!192) (isStrictlySorted!279 (toList!641 thiss!192)))))

(declare-fun bs!2297 () Bool)

(assert (= bs!2297 d!9903))

(assert (=> bs!2297 m!42845))

(assert (=> start!7784 d!9903))

(declare-fun b!49453 () Bool)

(declare-fun e!31779 () Bool)

(declare-fun tp_is_empty!2157 () Bool)

(declare-fun tp!6547 () Bool)

(assert (=> b!49453 (= e!31779 (and tp_is_empty!2157 tp!6547))))

