; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7600 () Bool)

(assert start!7600)

(declare-fun b!48427 () Bool)

(declare-fun res!28124 () Bool)

(declare-fun e!31077 () Bool)

(assert (=> b!48427 (=> (not res!28124) (not e!31077))))

(declare-datatypes ((B!954 0))(
  ( (B!955 (val!1097 Int)) )
))
(declare-datatypes ((tuple2!1780 0))(
  ( (tuple2!1781 (_1!901 (_ BitVec 64)) (_2!901 B!954)) )
))
(declare-datatypes ((List!1290 0))(
  ( (Nil!1287) (Cons!1286 (h!1866 tuple2!1780) (t!4317 List!1290)) )
))
(declare-fun l!1333 () List!1290)

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun containsKey!108 (List!1290 (_ BitVec 64)) Bool)

(assert (=> b!48427 (= res!28124 (not (containsKey!108 l!1333 newKey!147)))))

(declare-fun b!48428 () Bool)

(declare-fun res!28123 () Bool)

(assert (=> b!48428 (=> (not res!28123) (not e!31077))))

(declare-fun isStrictlySorted!256 (List!1290) Bool)

(assert (=> b!48428 (= res!28123 (isStrictlySorted!256 (t!4317 l!1333)))))

(declare-fun res!28122 () Bool)

(assert (=> start!7600 (=> (not res!28122) (not e!31077))))

(assert (=> start!7600 (= res!28122 (isStrictlySorted!256 l!1333))))

(assert (=> start!7600 e!31077))

(declare-fun e!31076 () Bool)

(assert (=> start!7600 e!31076))

(assert (=> start!7600 true))

(declare-fun b!48429 () Bool)

(declare-fun tp_is_empty!2105 () Bool)

(declare-fun tp!6407 () Bool)

(assert (=> b!48429 (= e!31076 (and tp_is_empty!2105 tp!6407))))

(declare-fun b!48430 () Bool)

(assert (=> b!48430 (= e!31077 (containsKey!108 (t!4317 l!1333) newKey!147))))

(declare-fun b!48431 () Bool)

(declare-fun res!28125 () Bool)

(assert (=> b!48431 (=> (not res!28125) (not e!31077))))

(assert (=> b!48431 (= res!28125 (not (is-Nil!1287 l!1333)))))

(assert (= (and start!7600 res!28122) b!48427))

(assert (= (and b!48427 res!28124) b!48431))

(assert (= (and b!48431 res!28125) b!48428))

(assert (= (and b!48428 res!28123) b!48430))

(assert (= (and start!7600 (is-Cons!1286 l!1333)) b!48429))

(declare-fun m!42213 () Bool)

(assert (=> b!48427 m!42213))

(declare-fun m!42215 () Bool)

(assert (=> b!48428 m!42215))

(declare-fun m!42217 () Bool)

(assert (=> start!7600 m!42217))

(declare-fun m!42219 () Bool)

(assert (=> b!48430 m!42219))

(push 1)

(assert tp_is_empty!2105)

(assert (not start!7600))

(assert (not b!48427))

(assert (not b!48429))

(assert (not b!48428))

(assert (not b!48430))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9599 () Bool)

(declare-fun res!28138 () Bool)

(declare-fun e!31090 () Bool)

(assert (=> d!9599 (=> res!28138 e!31090)))

(assert (=> d!9599 (= res!28138 (or (is-Nil!1287 (t!4317 l!1333)) (is-Nil!1287 (t!4317 (t!4317 l!1333)))))))

(assert (=> d!9599 (= (isStrictlySorted!256 (t!4317 l!1333)) e!31090)))

(declare-fun b!48444 () Bool)

(declare-fun e!31091 () Bool)

(assert (=> b!48444 (= e!31090 e!31091)))

(declare-fun res!28139 () Bool)

(assert (=> b!48444 (=> (not res!28139) (not e!31091))))

(assert (=> b!48444 (= res!28139 (bvslt (_1!901 (h!1866 (t!4317 l!1333))) (_1!901 (h!1866 (t!4317 (t!4317 l!1333))))))))

(declare-fun b!48445 () Bool)

(assert (=> b!48445 (= e!31091 (isStrictlySorted!256 (t!4317 (t!4317 l!1333))))))

(assert (= (and d!9599 (not res!28138)) b!48444))

(assert (= (and b!48444 res!28139) b!48445))

(declare-fun m!42221 () Bool)

(assert (=> b!48445 m!42221))

(assert (=> b!48428 d!9599))

(declare-fun d!9605 () Bool)

(declare-fun res!28154 () Bool)

(declare-fun e!31106 () Bool)

(assert (=> d!9605 (=> res!28154 e!31106)))

(assert (=> d!9605 (= res!28154 (and (is-Cons!1286 l!1333) (= (_1!901 (h!1866 l!1333)) newKey!147)))))

(assert (=> d!9605 (= (containsKey!108 l!1333 newKey!147) e!31106)))

(declare-fun b!48460 () Bool)

(declare-fun e!31107 () Bool)

(assert (=> b!48460 (= e!31106 e!31107)))

(declare-fun res!28155 () Bool)

(assert (=> b!48460 (=> (not res!28155) (not e!31107))))

(assert (=> b!48460 (= res!28155 (and (or (not (is-Cons!1286 l!1333)) (bvsle (_1!901 (h!1866 l!1333)) newKey!147)) (is-Cons!1286 l!1333) (bvslt (_1!901 (h!1866 l!1333)) newKey!147)))))

(declare-fun b!48461 () Bool)

(assert (=> b!48461 (= e!31107 (containsKey!108 (t!4317 l!1333) newKey!147))))

(assert (= (and d!9605 (not res!28154)) b!48460))

(assert (= (and b!48460 res!28155) b!48461))

(assert (=> b!48461 m!42219))

(assert (=> b!48427 d!9605))

(declare-fun d!9613 () Bool)

(declare-fun res!28160 () Bool)

(declare-fun e!31112 () Bool)

(assert (=> d!9613 (=> res!28160 e!31112)))

(assert (=> d!9613 (= res!28160 (or (is-Nil!1287 l!1333) (is-Nil!1287 (t!4317 l!1333))))))

(assert (=> d!9613 (= (isStrictlySorted!256 l!1333) e!31112)))

(declare-fun b!48466 () Bool)

(declare-fun e!31113 () Bool)

(assert (=> b!48466 (= e!31112 e!31113)))

(declare-fun res!28161 () Bool)

(assert (=> b!48466 (=> (not res!28161) (not e!31113))))

(assert (=> b!48466 (= res!28161 (bvslt (_1!901 (h!1866 l!1333)) (_1!901 (h!1866 (t!4317 l!1333)))))))

(declare-fun b!48467 () Bool)

(assert (=> b!48467 (= e!31113 (isStrictlySorted!256 (t!4317 l!1333)))))

(assert (= (and d!9613 (not res!28160)) b!48466))

(assert (= (and b!48466 res!28161) b!48467))

(assert (=> b!48467 m!42215))

(assert (=> start!7600 d!9613))

(declare-fun d!9615 () Bool)

(declare-fun res!28164 () Bool)

(declare-fun e!31116 () Bool)

(assert (=> d!9615 (=> res!28164 e!31116)))

(assert (=> d!9615 (= res!28164 (and (is-Cons!1286 (t!4317 l!1333)) (= (_1!901 (h!1866 (t!4317 l!1333))) newKey!147)))))

(assert (=> d!9615 (= (containsKey!108 (t!4317 l!1333) newKey!147) e!31116)))

(declare-fun b!48470 () Bool)

(declare-fun e!31117 () Bool)

(assert (=> b!48470 (= e!31116 e!31117)))

(declare-fun res!28165 () Bool)

(assert (=> b!48470 (=> (not res!28165) (not e!31117))))

(assert (=> b!48470 (= res!28165 (and (or (not (is-Cons!1286 (t!4317 l!1333))) (bvsle (_1!901 (h!1866 (t!4317 l!1333))) newKey!147)) (is-Cons!1286 (t!4317 l!1333)) (bvslt (_1!901 (h!1866 (t!4317 l!1333))) newKey!147)))))

(declare-fun b!48471 () Bool)

(assert (=> b!48471 (= e!31117 (containsKey!108 (t!4317 (t!4317 l!1333)) newKey!147))))

(assert (= (and d!9615 (not res!28164)) b!48470))

(assert (= (and b!48470 res!28165) b!48471))

(declare-fun m!42227 () Bool)

(assert (=> b!48471 m!42227))

(assert (=> b!48430 d!9615))

(declare-fun b!48485 () Bool)

(declare-fun e!31127 () Bool)

(declare-fun tp!6413 () Bool)

(assert (=> b!48485 (= e!31127 (and tp_is_empty!2105 tp!6413))))

(assert (=> b!48429 (= tp!6407 e!31127)))

(assert (= (and b!48429 (is-Cons!1286 (t!4317 l!1333))) b!48485))

(push 1)

(assert tp_is_empty!2105)

(assert (not b!48461))

(assert (not b!48445))

(assert (not b!48471))

(assert (not b!48467))

(assert (not b!48485))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

