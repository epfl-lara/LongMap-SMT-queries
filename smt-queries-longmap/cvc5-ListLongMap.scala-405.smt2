; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7576 () Bool)

(assert start!7576)

(declare-fun b!48369 () Bool)

(declare-fun res!28047 () Bool)

(declare-fun e!31038 () Bool)

(assert (=> b!48369 (=> (not res!28047) (not e!31038))))

(declare-datatypes ((B!944 0))(
  ( (B!945 (val!1092 Int)) )
))
(declare-datatypes ((tuple2!1766 0))(
  ( (tuple2!1767 (_1!894 (_ BitVec 64)) (_2!894 B!944)) )
))
(declare-datatypes ((List!1289 0))(
  ( (Nil!1286) (Cons!1285 (h!1865 tuple2!1766) (t!4317 List!1289)) )
))
(declare-fun l!1333 () List!1289)

(assert (=> b!48369 (= res!28047 (not (is-Nil!1286 l!1333)))))

(declare-fun b!48368 () Bool)

(declare-fun res!28048 () Bool)

(assert (=> b!48368 (=> (not res!28048) (not e!31038))))

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun containsKey!105 (List!1289 (_ BitVec 64)) Bool)

(assert (=> b!48368 (= res!28048 (not (containsKey!105 l!1333 newKey!147)))))

(declare-fun b!48370 () Bool)

(declare-fun isStrictlySorted!256 (List!1289) Bool)

(assert (=> b!48370 (= e!31038 (not (isStrictlySorted!256 (t!4317 l!1333))))))

(declare-fun b!48371 () Bool)

(declare-fun e!31039 () Bool)

(declare-fun tp_is_empty!2095 () Bool)

(declare-fun tp!6383 () Bool)

(assert (=> b!48371 (= e!31039 (and tp_is_empty!2095 tp!6383))))

(declare-fun res!28049 () Bool)

(assert (=> start!7576 (=> (not res!28049) (not e!31038))))

(assert (=> start!7576 (= res!28049 (isStrictlySorted!256 l!1333))))

(assert (=> start!7576 e!31038))

(assert (=> start!7576 e!31039))

(assert (=> start!7576 true))

(assert (= (and start!7576 res!28049) b!48368))

(assert (= (and b!48368 res!28048) b!48369))

(assert (= (and b!48369 res!28047) b!48370))

(assert (= (and start!7576 (is-Cons!1285 l!1333)) b!48371))

(declare-fun m!42249 () Bool)

(assert (=> b!48368 m!42249))

(declare-fun m!42251 () Bool)

(assert (=> b!48370 m!42251))

(declare-fun m!42253 () Bool)

(assert (=> start!7576 m!42253))

(push 1)

(assert (not start!7576))

(assert (not b!48368))

(assert (not b!48371))

(assert (not b!48370))

(assert tp_is_empty!2095)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9606 () Bool)

(declare-fun res!28077 () Bool)

(declare-fun e!31061 () Bool)

(assert (=> d!9606 (=> res!28077 e!31061)))

(assert (=> d!9606 (= res!28077 (or (is-Nil!1286 l!1333) (is-Nil!1286 (t!4317 l!1333))))))

(assert (=> d!9606 (= (isStrictlySorted!256 l!1333) e!31061)))

(declare-fun b!48405 () Bool)

(declare-fun e!31063 () Bool)

(assert (=> b!48405 (= e!31061 e!31063)))

(declare-fun res!28079 () Bool)

(assert (=> b!48405 (=> (not res!28079) (not e!31063))))

(assert (=> b!48405 (= res!28079 (bvslt (_1!894 (h!1865 l!1333)) (_1!894 (h!1865 (t!4317 l!1333)))))))

(declare-fun b!48407 () Bool)

(assert (=> b!48407 (= e!31063 (isStrictlySorted!256 (t!4317 l!1333)))))

(assert (= (and d!9606 (not res!28077)) b!48405))

(assert (= (and b!48405 res!28079) b!48407))

(assert (=> b!48407 m!42251))

(assert (=> start!7576 d!9606))

(declare-fun d!9611 () Bool)

(declare-fun res!28080 () Bool)

(declare-fun e!31064 () Bool)

(assert (=> d!9611 (=> res!28080 e!31064)))

(assert (=> d!9611 (= res!28080 (or (is-Nil!1286 (t!4317 l!1333)) (is-Nil!1286 (t!4317 (t!4317 l!1333)))))))

(assert (=> d!9611 (= (isStrictlySorted!256 (t!4317 l!1333)) e!31064)))

(declare-fun b!48408 () Bool)

(declare-fun e!31065 () Bool)

(assert (=> b!48408 (= e!31064 e!31065)))

(declare-fun res!28081 () Bool)

(assert (=> b!48408 (=> (not res!28081) (not e!31065))))

(assert (=> b!48408 (= res!28081 (bvslt (_1!894 (h!1865 (t!4317 l!1333))) (_1!894 (h!1865 (t!4317 (t!4317 l!1333))))))))

(declare-fun b!48409 () Bool)

(assert (=> b!48409 (= e!31065 (isStrictlySorted!256 (t!4317 (t!4317 l!1333))))))

(assert (= (and d!9611 (not res!28080)) b!48408))

(assert (= (and b!48408 res!28081) b!48409))

(declare-fun m!42269 () Bool)

(assert (=> b!48409 m!42269))

(assert (=> b!48370 d!9611))

(declare-fun d!9613 () Bool)

(declare-fun res!28092 () Bool)

(declare-fun e!31076 () Bool)

(assert (=> d!9613 (=> res!28092 e!31076)))

(assert (=> d!9613 (= res!28092 (and (is-Cons!1285 l!1333) (= (_1!894 (h!1865 l!1333)) newKey!147)))))

(assert (=> d!9613 (= (containsKey!105 l!1333 newKey!147) e!31076)))

(declare-fun b!48420 () Bool)

(declare-fun e!31077 () Bool)

(assert (=> b!48420 (= e!31076 e!31077)))

(declare-fun res!28093 () Bool)

(assert (=> b!48420 (=> (not res!28093) (not e!31077))))

(assert (=> b!48420 (= res!28093 (and (or (not (is-Cons!1285 l!1333)) (bvsle (_1!894 (h!1865 l!1333)) newKey!147)) (is-Cons!1285 l!1333) (bvslt (_1!894 (h!1865 l!1333)) newKey!147)))))

(declare-fun b!48421 () Bool)

(assert (=> b!48421 (= e!31077 (containsKey!105 (t!4317 l!1333) newKey!147))))

(assert (= (and d!9613 (not res!28092)) b!48420))

(assert (= (and b!48420 res!28093) b!48421))

(declare-fun m!42273 () Bool)

(assert (=> b!48421 m!42273))

(assert (=> b!48368 d!9613))

(declare-fun b!48433 () Bool)

(declare-fun e!31085 () Bool)

(declare-fun tp!6395 () Bool)

(assert (=> b!48433 (= e!31085 (and tp_is_empty!2095 tp!6395))))

(assert (=> b!48371 (= tp!6383 e!31085)))

(assert (= (and b!48371 (is-Cons!1285 (t!4317 l!1333))) b!48433))

(push 1)

(assert (not b!48421))

(assert (not b!48409))

(assert (not b!48433))

(assert tp_is_empty!2095)

(assert (not b!48407))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

