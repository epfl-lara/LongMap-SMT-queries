; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7594 () Bool)

(assert start!7594)

(declare-fun res!28120 () Bool)

(declare-fun e!31108 () Bool)

(assert (=> start!7594 (=> (not res!28120) (not e!31108))))

(declare-datatypes ((B!950 0))(
  ( (B!951 (val!1095 Int)) )
))
(declare-datatypes ((tuple2!1772 0))(
  ( (tuple2!1773 (_1!897 (_ BitVec 64)) (_2!897 B!950)) )
))
(declare-datatypes ((List!1292 0))(
  ( (Nil!1289) (Cons!1288 (h!1868 tuple2!1772) (t!4320 List!1292)) )
))
(declare-fun l!1333 () List!1292)

(declare-fun isStrictlySorted!259 (List!1292) Bool)

(assert (=> start!7594 (= res!28120 (isStrictlySorted!259 l!1333))))

(assert (=> start!7594 e!31108))

(declare-fun e!31107 () Bool)

(assert (=> start!7594 e!31107))

(assert (=> start!7594 true))

(declare-fun b!48463 () Bool)

(declare-fun res!28121 () Bool)

(assert (=> b!48463 (=> (not res!28121) (not e!31108))))

(assert (=> b!48463 (= res!28121 (not (is-Nil!1289 l!1333)))))

(declare-fun b!48464 () Bool)

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun containsKey!108 (List!1292 (_ BitVec 64)) Bool)

(assert (=> b!48464 (= e!31108 (containsKey!108 (t!4320 l!1333) newKey!147))))

(declare-fun b!48465 () Bool)

(declare-fun res!28118 () Bool)

(assert (=> b!48465 (=> (not res!28118) (not e!31108))))

(assert (=> b!48465 (= res!28118 (isStrictlySorted!259 (t!4320 l!1333)))))

(declare-fun b!48466 () Bool)

(declare-fun tp_is_empty!2101 () Bool)

(declare-fun tp!6401 () Bool)

(assert (=> b!48466 (= e!31107 (and tp_is_empty!2101 tp!6401))))

(declare-fun b!48467 () Bool)

(declare-fun res!28119 () Bool)

(assert (=> b!48467 (=> (not res!28119) (not e!31108))))

(assert (=> b!48467 (= res!28119 (not (containsKey!108 l!1333 newKey!147)))))

(assert (= (and start!7594 res!28120) b!48467))

(assert (= (and b!48467 res!28119) b!48463))

(assert (= (and b!48463 res!28121) b!48465))

(assert (= (and b!48465 res!28118) b!48464))

(assert (= (and start!7594 (is-Cons!1288 l!1333)) b!48466))

(declare-fun m!42279 () Bool)

(assert (=> start!7594 m!42279))

(declare-fun m!42281 () Bool)

(assert (=> b!48464 m!42281))

(declare-fun m!42283 () Bool)

(assert (=> b!48465 m!42283))

(declare-fun m!42285 () Bool)

(assert (=> b!48467 m!42285))

(push 1)

(assert tp_is_empty!2101)

(assert (not b!48465))

(assert (not b!48464))

(assert (not start!7594))

(assert (not b!48466))

(assert (not b!48467))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9627 () Bool)

(declare-fun res!28158 () Bool)

(declare-fun e!31133 () Bool)

(assert (=> d!9627 (=> res!28158 e!31133)))

(assert (=> d!9627 (= res!28158 (or (is-Nil!1289 l!1333) (is-Nil!1289 (t!4320 l!1333))))))

(assert (=> d!9627 (= (isStrictlySorted!259 l!1333) e!31133)))

(declare-fun b!48510 () Bool)

(declare-fun e!31134 () Bool)

(assert (=> b!48510 (= e!31133 e!31134)))

(declare-fun res!28159 () Bool)

(assert (=> b!48510 (=> (not res!28159) (not e!31134))))

(assert (=> b!48510 (= res!28159 (bvslt (_1!897 (h!1868 l!1333)) (_1!897 (h!1868 (t!4320 l!1333)))))))

(declare-fun b!48511 () Bool)

(assert (=> b!48511 (= e!31134 (isStrictlySorted!259 (t!4320 l!1333)))))

(assert (= (and d!9627 (not res!28158)) b!48510))

(assert (= (and b!48510 res!28159) b!48511))

(assert (=> b!48511 m!42283))

(assert (=> start!7594 d!9627))

(declare-fun d!9633 () Bool)

(declare-fun res!28182 () Bool)

(declare-fun e!31160 () Bool)

(assert (=> d!9633 (=> res!28182 e!31160)))

(assert (=> d!9633 (= res!28182 (and (is-Cons!1288 l!1333) (= (_1!897 (h!1868 l!1333)) newKey!147)))))

(assert (=> d!9633 (= (containsKey!108 l!1333 newKey!147) e!31160)))

(declare-fun b!48539 () Bool)

(declare-fun e!31161 () Bool)

(assert (=> b!48539 (= e!31160 e!31161)))

(declare-fun res!28183 () Bool)

(assert (=> b!48539 (=> (not res!28183) (not e!31161))))

(assert (=> b!48539 (= res!28183 (and (or (not (is-Cons!1288 l!1333)) (bvsle (_1!897 (h!1868 l!1333)) newKey!147)) (is-Cons!1288 l!1333) (bvslt (_1!897 (h!1868 l!1333)) newKey!147)))))

(declare-fun b!48540 () Bool)

(assert (=> b!48540 (= e!31161 (containsKey!108 (t!4320 l!1333) newKey!147))))

(assert (= (and d!9633 (not res!28182)) b!48539))

(assert (= (and b!48539 res!28183) b!48540))

(assert (=> b!48540 m!42281))

(assert (=> b!48467 d!9633))

(declare-fun d!9641 () Bool)

(declare-fun res!28184 () Bool)

(declare-fun e!31162 () Bool)

(assert (=> d!9641 (=> res!28184 e!31162)))

(assert (=> d!9641 (= res!28184 (or (is-Nil!1289 (t!4320 l!1333)) (is-Nil!1289 (t!4320 (t!4320 l!1333)))))))

(assert (=> d!9641 (= (isStrictlySorted!259 (t!4320 l!1333)) e!31162)))

(declare-fun b!48541 () Bool)

(declare-fun e!31163 () Bool)

(assert (=> b!48541 (= e!31162 e!31163)))

(declare-fun res!28185 () Bool)

(assert (=> b!48541 (=> (not res!28185) (not e!31163))))

(assert (=> b!48541 (= res!28185 (bvslt (_1!897 (h!1868 (t!4320 l!1333))) (_1!897 (h!1868 (t!4320 (t!4320 l!1333))))))))

(declare-fun b!48542 () Bool)

(assert (=> b!48542 (= e!31163 (isStrictlySorted!259 (t!4320 (t!4320 l!1333))))))

(assert (= (and d!9641 (not res!28184)) b!48541))

(assert (= (and b!48541 res!28185) b!48542))

(declare-fun m!42307 () Bool)

(assert (=> b!48542 m!42307))

(assert (=> b!48465 d!9641))

(declare-fun d!9643 () Bool)

(declare-fun res!28188 () Bool)

(declare-fun e!31166 () Bool)

(assert (=> d!9643 (=> res!28188 e!31166)))

(assert (=> d!9643 (= res!28188 (and (is-Cons!1288 (t!4320 l!1333)) (= (_1!897 (h!1868 (t!4320 l!1333))) newKey!147)))))

(assert (=> d!9643 (= (containsKey!108 (t!4320 l!1333) newKey!147) e!31166)))

(declare-fun b!48545 () Bool)

(declare-fun e!31167 () Bool)

(assert (=> b!48545 (= e!31166 e!31167)))

(declare-fun res!28189 () Bool)

(assert (=> b!48545 (=> (not res!28189) (not e!31167))))

(assert (=> b!48545 (= res!28189 (and (or (not (is-Cons!1288 (t!4320 l!1333))) (bvsle (_1!897 (h!1868 (t!4320 l!1333))) newKey!147)) (is-Cons!1288 (t!4320 l!1333)) (bvslt (_1!897 (h!1868 (t!4320 l!1333))) newKey!147)))))

(declare-fun b!48546 () Bool)

(assert (=> b!48546 (= e!31167 (containsKey!108 (t!4320 (t!4320 l!1333)) newKey!147))))

(assert (= (and d!9643 (not res!28188)) b!48545))

(assert (= (and b!48545 res!28189) b!48546))

(declare-fun m!42311 () Bool)

(assert (=> b!48546 m!42311))

(assert (=> b!48464 d!9643))

(declare-fun b!48556 () Bool)

(declare-fun e!31174 () Bool)

(declare-fun tp!6413 () Bool)

(assert (=> b!48556 (= e!31174 (and tp_is_empty!2101 tp!6413))))

(assert (=> b!48466 (= tp!6401 e!31174)))

(assert (= (and b!48466 (is-Cons!1288 (t!4320 l!1333))) b!48556))

(push 1)

(assert (not b!48546))

(assert tp_is_empty!2101)

(assert (not b!48542))

(assert (not b!48540))

(assert (not b!48511))

(assert (not b!48556))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

