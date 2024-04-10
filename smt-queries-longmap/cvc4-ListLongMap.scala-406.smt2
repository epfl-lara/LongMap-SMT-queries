; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7598 () Bool)

(assert start!7598)

(declare-fun b!48493 () Bool)

(declare-fun res!28145 () Bool)

(declare-fun e!31120 () Bool)

(assert (=> b!48493 (=> (not res!28145) (not e!31120))))

(declare-datatypes ((B!954 0))(
  ( (B!955 (val!1097 Int)) )
))
(declare-datatypes ((tuple2!1776 0))(
  ( (tuple2!1777 (_1!899 (_ BitVec 64)) (_2!899 B!954)) )
))
(declare-datatypes ((List!1294 0))(
  ( (Nil!1291) (Cons!1290 (h!1870 tuple2!1776) (t!4322 List!1294)) )
))
(declare-fun l!1333 () List!1294)

(declare-fun isStrictlySorted!261 (List!1294) Bool)

(assert (=> b!48493 (= res!28145 (isStrictlySorted!261 (t!4322 l!1333)))))

(declare-fun b!48494 () Bool)

(declare-fun res!28142 () Bool)

(assert (=> b!48494 (=> (not res!28142) (not e!31120))))

(assert (=> b!48494 (= res!28142 (not (is-Nil!1291 l!1333)))))

(declare-fun b!48495 () Bool)

(declare-fun res!28144 () Bool)

(assert (=> b!48495 (=> (not res!28144) (not e!31120))))

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun containsKey!110 (List!1294 (_ BitVec 64)) Bool)

(assert (=> b!48495 (= res!28144 (not (containsKey!110 l!1333 newKey!147)))))

(declare-fun res!28143 () Bool)

(assert (=> start!7598 (=> (not res!28143) (not e!31120))))

(assert (=> start!7598 (= res!28143 (isStrictlySorted!261 l!1333))))

(assert (=> start!7598 e!31120))

(declare-fun e!31119 () Bool)

(assert (=> start!7598 e!31119))

(assert (=> start!7598 true))

(declare-fun b!48496 () Bool)

(declare-fun tp_is_empty!2105 () Bool)

(declare-fun tp!6407 () Bool)

(assert (=> b!48496 (= e!31119 (and tp_is_empty!2105 tp!6407))))

(declare-fun b!48497 () Bool)

(assert (=> b!48497 (= e!31120 (containsKey!110 (t!4322 l!1333) newKey!147))))

(assert (= (and start!7598 res!28143) b!48495))

(assert (= (and b!48495 res!28144) b!48494))

(assert (= (and b!48494 res!28142) b!48493))

(assert (= (and b!48493 res!28145) b!48497))

(assert (= (and start!7598 (is-Cons!1290 l!1333)) b!48496))

(declare-fun m!42295 () Bool)

(assert (=> b!48493 m!42295))

(declare-fun m!42297 () Bool)

(assert (=> b!48495 m!42297))

(declare-fun m!42299 () Bool)

(assert (=> start!7598 m!42299))

(declare-fun m!42301 () Bool)

(assert (=> b!48497 m!42301))

(push 1)

(assert (not b!48493))

(assert (not b!48497))

(assert (not b!48496))

(assert (not b!48495))

(assert tp_is_empty!2105)

(assert (not start!7598))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9629 () Bool)

(declare-fun res!28164 () Bool)

(declare-fun e!31139 () Bool)

(assert (=> d!9629 (=> res!28164 e!31139)))

(assert (=> d!9629 (= res!28164 (and (is-Cons!1290 l!1333) (= (_1!899 (h!1870 l!1333)) newKey!147)))))

(assert (=> d!9629 (= (containsKey!110 l!1333 newKey!147) e!31139)))

(declare-fun b!48516 () Bool)

(declare-fun e!31142 () Bool)

(assert (=> b!48516 (= e!31139 e!31142)))

(declare-fun res!28167 () Bool)

(assert (=> b!48516 (=> (not res!28167) (not e!31142))))

(assert (=> b!48516 (= res!28167 (and (or (not (is-Cons!1290 l!1333)) (bvsle (_1!899 (h!1870 l!1333)) newKey!147)) (is-Cons!1290 l!1333) (bvslt (_1!899 (h!1870 l!1333)) newKey!147)))))

(declare-fun b!48517 () Bool)

(assert (=> b!48517 (= e!31142 (containsKey!110 (t!4322 l!1333) newKey!147))))

(assert (= (and d!9629 (not res!28164)) b!48516))

(assert (= (and b!48516 res!28167) b!48517))

(assert (=> b!48517 m!42301))

(assert (=> b!48495 d!9629))

(declare-fun d!9635 () Bool)

(declare-fun res!28186 () Bool)

(declare-fun e!31164 () Bool)

(assert (=> d!9635 (=> res!28186 e!31164)))

(assert (=> d!9635 (= res!28186 (or (is-Nil!1291 (t!4322 l!1333)) (is-Nil!1291 (t!4322 (t!4322 l!1333)))))))

(assert (=> d!9635 (= (isStrictlySorted!261 (t!4322 l!1333)) e!31164)))

(declare-fun b!48543 () Bool)

(declare-fun e!31165 () Bool)

(assert (=> b!48543 (= e!31164 e!31165)))

(declare-fun res!28187 () Bool)

(assert (=> b!48543 (=> (not res!28187) (not e!31165))))

(assert (=> b!48543 (= res!28187 (bvslt (_1!899 (h!1870 (t!4322 l!1333))) (_1!899 (h!1870 (t!4322 (t!4322 l!1333))))))))

(declare-fun b!48544 () Bool)

(assert (=> b!48544 (= e!31165 (isStrictlySorted!261 (t!4322 (t!4322 l!1333))))))

(assert (= (and d!9635 (not res!28186)) b!48543))

(assert (= (and b!48543 res!28187) b!48544))

(declare-fun m!42309 () Bool)

(assert (=> b!48544 m!42309))

(assert (=> b!48493 d!9635))

(declare-fun d!9645 () Bool)

(declare-fun res!28190 () Bool)

(declare-fun e!31168 () Bool)

(assert (=> d!9645 (=> res!28190 e!31168)))

(assert (=> d!9645 (= res!28190 (or (is-Nil!1291 l!1333) (is-Nil!1291 (t!4322 l!1333))))))

(assert (=> d!9645 (= (isStrictlySorted!261 l!1333) e!31168)))

(declare-fun b!48547 () Bool)

(declare-fun e!31169 () Bool)

(assert (=> b!48547 (= e!31168 e!31169)))

(declare-fun res!28191 () Bool)

(assert (=> b!48547 (=> (not res!28191) (not e!31169))))

(assert (=> b!48547 (= res!28191 (bvslt (_1!899 (h!1870 l!1333)) (_1!899 (h!1870 (t!4322 l!1333)))))))

(declare-fun b!48548 () Bool)

(assert (=> b!48548 (= e!31169 (isStrictlySorted!261 (t!4322 l!1333)))))

(assert (= (and d!9645 (not res!28190)) b!48547))

(assert (= (and b!48547 res!28191) b!48548))

(assert (=> b!48548 m!42295))

(assert (=> start!7598 d!9645))

(declare-fun d!9647 () Bool)

(declare-fun res!28192 () Bool)

(declare-fun e!31172 () Bool)

(assert (=> d!9647 (=> res!28192 e!31172)))

(assert (=> d!9647 (= res!28192 (and (is-Cons!1290 (t!4322 l!1333)) (= (_1!899 (h!1870 (t!4322 l!1333))) newKey!147)))))

(assert (=> d!9647 (= (containsKey!110 (t!4322 l!1333) newKey!147) e!31172)))

(declare-fun b!48553 () Bool)

(declare-fun e!31173 () Bool)

(assert (=> b!48553 (= e!31172 e!31173)))

(declare-fun res!28193 () Bool)

(assert (=> b!48553 (=> (not res!28193) (not e!31173))))

(assert (=> b!48553 (= res!28193 (and (or (not (is-Cons!1290 (t!4322 l!1333))) (bvsle (_1!899 (h!1870 (t!4322 l!1333))) newKey!147)) (is-Cons!1290 (t!4322 l!1333)) (bvslt (_1!899 (h!1870 (t!4322 l!1333))) newKey!147)))))

(declare-fun b!48554 () Bool)

(assert (=> b!48554 (= e!31173 (containsKey!110 (t!4322 (t!4322 l!1333)) newKey!147))))

(assert (= (and d!9647 (not res!28192)) b!48553))

(assert (= (and b!48553 res!28193) b!48554))

(declare-fun m!42313 () Bool)

(assert (=> b!48554 m!42313))

(assert (=> b!48497 d!9647))

(declare-fun b!48560 () Bool)

(declare-fun e!31177 () Bool)

(declare-fun tp!6416 () Bool)

(assert (=> b!48560 (= e!31177 (and tp_is_empty!2105 tp!6416))))

(assert (=> b!48496 (= tp!6407 e!31177)))

(assert (= (and b!48496 (is-Cons!1290 (t!4322 l!1333))) b!48560))

(push 1)

(assert (not b!48548))

(assert (not b!48554))

(assert (not b!48517))

(assert tp_is_empty!2105)

(assert (not b!48560))

(assert (not b!48544))

(check-sat)

(pop 1)

(push 1)

(check-sat)

