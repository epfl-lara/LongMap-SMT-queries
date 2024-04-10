; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7580 () Bool)

(assert start!7580)

(declare-fun b!48392 () Bool)

(declare-fun res!28066 () Bool)

(declare-fun e!31051 () Bool)

(assert (=> b!48392 (=> (not res!28066) (not e!31051))))

(declare-datatypes ((B!948 0))(
  ( (B!949 (val!1094 Int)) )
))
(declare-datatypes ((tuple2!1770 0))(
  ( (tuple2!1771 (_1!896 (_ BitVec 64)) (_2!896 B!948)) )
))
(declare-datatypes ((List!1291 0))(
  ( (Nil!1288) (Cons!1287 (h!1867 tuple2!1770) (t!4319 List!1291)) )
))
(declare-fun l!1333 () List!1291)

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun containsKey!107 (List!1291 (_ BitVec 64)) Bool)

(assert (=> b!48392 (= res!28066 (not (containsKey!107 l!1333 newKey!147)))))

(declare-fun b!48395 () Bool)

(declare-fun e!31050 () Bool)

(declare-fun tp_is_empty!2099 () Bool)

(declare-fun tp!6389 () Bool)

(assert (=> b!48395 (= e!31050 (and tp_is_empty!2099 tp!6389))))

(declare-fun res!28067 () Bool)

(assert (=> start!7580 (=> (not res!28067) (not e!31051))))

(declare-fun isStrictlySorted!258 (List!1291) Bool)

(assert (=> start!7580 (= res!28067 (isStrictlySorted!258 l!1333))))

(assert (=> start!7580 e!31051))

(assert (=> start!7580 e!31050))

(assert (=> start!7580 true))

(declare-fun b!48393 () Bool)

(declare-fun res!28065 () Bool)

(assert (=> b!48393 (=> (not res!28065) (not e!31051))))

(assert (=> b!48393 (= res!28065 (not (is-Nil!1288 l!1333)))))

(declare-fun b!48394 () Bool)

(assert (=> b!48394 (= e!31051 (not (isStrictlySorted!258 (t!4319 l!1333))))))

(assert (= (and start!7580 res!28067) b!48392))

(assert (= (and b!48392 res!28066) b!48393))

(assert (= (and b!48393 res!28065) b!48394))

(assert (= (and start!7580 (is-Cons!1287 l!1333)) b!48395))

(declare-fun m!42261 () Bool)

(assert (=> b!48392 m!42261))

(declare-fun m!42263 () Bool)

(assert (=> start!7580 m!42263))

(declare-fun m!42265 () Bool)

(assert (=> b!48394 m!42265))

(push 1)

(assert (not start!7580))

(assert (not b!48395))

(assert tp_is_empty!2099)

(assert (not b!48392))

(assert (not b!48394))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9607 () Bool)

(declare-fun res!28076 () Bool)

(declare-fun e!31060 () Bool)

(assert (=> d!9607 (=> res!28076 e!31060)))

(assert (=> d!9607 (= res!28076 (or (is-Nil!1288 (t!4319 l!1333)) (is-Nil!1288 (t!4319 (t!4319 l!1333)))))))

(assert (=> d!9607 (= (isStrictlySorted!258 (t!4319 l!1333)) e!31060)))

(declare-fun b!48404 () Bool)

(declare-fun e!31062 () Bool)

(assert (=> b!48404 (= e!31060 e!31062)))

(declare-fun res!28078 () Bool)

(assert (=> b!48404 (=> (not res!28078) (not e!31062))))

(assert (=> b!48404 (= res!28078 (bvslt (_1!896 (h!1867 (t!4319 l!1333))) (_1!896 (h!1867 (t!4319 (t!4319 l!1333))))))))

(declare-fun b!48406 () Bool)

(assert (=> b!48406 (= e!31062 (isStrictlySorted!258 (t!4319 (t!4319 l!1333))))))

(assert (= (and d!9607 (not res!28076)) b!48404))

(assert (= (and b!48404 res!28078) b!48406))

(declare-fun m!42267 () Bool)

(assert (=> b!48406 m!42267))

(assert (=> b!48394 d!9607))

(declare-fun d!9610 () Bool)

(declare-fun res!28090 () Bool)

(declare-fun e!31074 () Bool)

(assert (=> d!9610 (=> res!28090 e!31074)))

(assert (=> d!9610 (= res!28090 (and (is-Cons!1287 l!1333) (= (_1!896 (h!1867 l!1333)) newKey!147)))))

(assert (=> d!9610 (= (containsKey!107 l!1333 newKey!147) e!31074)))

(declare-fun b!48418 () Bool)

(declare-fun e!31075 () Bool)

(assert (=> b!48418 (= e!31074 e!31075)))

(declare-fun res!28091 () Bool)

(assert (=> b!48418 (=> (not res!28091) (not e!31075))))

(assert (=> b!48418 (= res!28091 (and (or (not (is-Cons!1287 l!1333)) (bvsle (_1!896 (h!1867 l!1333)) newKey!147)) (is-Cons!1287 l!1333) (bvslt (_1!896 (h!1867 l!1333)) newKey!147)))))

(declare-fun b!48419 () Bool)

(assert (=> b!48419 (= e!31075 (containsKey!107 (t!4319 l!1333) newKey!147))))

(assert (= (and d!9610 (not res!28090)) b!48418))

(assert (= (and b!48418 res!28091) b!48419))

(declare-fun m!42271 () Bool)

(assert (=> b!48419 m!42271))

(assert (=> b!48392 d!9610))

(declare-fun d!9617 () Bool)

(declare-fun res!28094 () Bool)

(declare-fun e!31078 () Bool)

(assert (=> d!9617 (=> res!28094 e!31078)))

(assert (=> d!9617 (= res!28094 (or (is-Nil!1288 l!1333) (is-Nil!1288 (t!4319 l!1333))))))

(assert (=> d!9617 (= (isStrictlySorted!258 l!1333) e!31078)))

(declare-fun b!48422 () Bool)

(declare-fun e!31079 () Bool)

(assert (=> b!48422 (= e!31078 e!31079)))

(declare-fun res!28095 () Bool)

(assert (=> b!48422 (=> (not res!28095) (not e!31079))))

(assert (=> b!48422 (= res!28095 (bvslt (_1!896 (h!1867 l!1333)) (_1!896 (h!1867 (t!4319 l!1333)))))))

(declare-fun b!48423 () Bool)

(assert (=> b!48423 (= e!31079 (isStrictlySorted!258 (t!4319 l!1333)))))

(assert (= (and d!9617 (not res!28094)) b!48422))

(assert (= (and b!48422 res!28095) b!48423))

(assert (=> b!48423 m!42265))

(assert (=> start!7580 d!9617))

(declare-fun b!48432 () Bool)

(declare-fun e!31084 () Bool)

(declare-fun tp!6394 () Bool)

(assert (=> b!48432 (= e!31084 (and tp_is_empty!2099 tp!6394))))

(assert (=> b!48395 (= tp!6389 e!31084)))

(assert (= (and b!48395 (is-Cons!1287 (t!4319 l!1333))) b!48432))

(push 1)

