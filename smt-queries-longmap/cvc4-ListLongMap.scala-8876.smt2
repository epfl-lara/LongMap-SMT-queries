; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107778 () Bool)

(assert start!107778)

(declare-fun res!847285 () Bool)

(declare-fun e!727377 () Bool)

(assert (=> start!107778 (=> (not res!847285) (not e!727377))))

(declare-datatypes ((B!2130 0))(
  ( (B!2131 (val!16661 Int)) )
))
(declare-datatypes ((tuple2!21404 0))(
  ( (tuple2!21405 (_1!10713 (_ BitVec 64)) (_2!10713 B!2130)) )
))
(declare-datatypes ((List!28587 0))(
  ( (Nil!28584) (Cons!28583 (h!29792 tuple2!21404) (t!42120 List!28587)) )
))
(declare-fun l!595 () List!28587)

(declare-fun isStrictlySorted!845 (List!28587) Bool)

(assert (=> start!107778 (= res!847285 (isStrictlySorted!845 l!595))))

(assert (=> start!107778 e!727377))

(declare-fun e!727378 () Bool)

(assert (=> start!107778 e!727378))

(assert (=> start!107778 true))

(declare-fun b!1274563 () Bool)

(declare-fun res!847284 () Bool)

(assert (=> b!1274563 (=> (not res!847284) (not e!727377))))

(declare-fun key!173 () (_ BitVec 64))

(assert (=> b!1274563 (= res!847284 (and (not (= (_1!10713 (h!29792 l!595)) key!173)) (is-Cons!28583 l!595)))))

(declare-fun b!1274564 () Bool)

(assert (=> b!1274564 (= e!727377 (not (isStrictlySorted!845 (t!42120 l!595))))))

(declare-fun b!1274565 () Bool)

(declare-fun tp_is_empty!33173 () Bool)

(declare-fun tp!97964 () Bool)

(assert (=> b!1274565 (= e!727378 (and tp_is_empty!33173 tp!97964))))

(assert (= (and start!107778 res!847285) b!1274563))

(assert (= (and b!1274563 res!847284) b!1274564))

(assert (= (and start!107778 (is-Cons!28583 l!595)) b!1274565))

(declare-fun m!1171275 () Bool)

(assert (=> start!107778 m!1171275))

(declare-fun m!1171277 () Bool)

(assert (=> b!1274564 m!1171277))

(push 1)

(assert (not start!107778))

(assert (not b!1274564))

(assert (not b!1274565))

(assert tp_is_empty!33173)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!140175 () Bool)

(declare-fun res!847306 () Bool)

(declare-fun e!727404 () Bool)

(assert (=> d!140175 (=> res!847306 e!727404)))

(assert (=> d!140175 (= res!847306 (or (is-Nil!28584 l!595) (is-Nil!28584 (t!42120 l!595))))))

(assert (=> d!140175 (= (isStrictlySorted!845 l!595) e!727404)))

(declare-fun b!1274595 () Bool)

(declare-fun e!727405 () Bool)

(assert (=> b!1274595 (= e!727404 e!727405)))

(declare-fun res!847307 () Bool)

(assert (=> b!1274595 (=> (not res!847307) (not e!727405))))

(assert (=> b!1274595 (= res!847307 (bvslt (_1!10713 (h!29792 l!595)) (_1!10713 (h!29792 (t!42120 l!595)))))))

(declare-fun b!1274596 () Bool)

(assert (=> b!1274596 (= e!727405 (isStrictlySorted!845 (t!42120 l!595)))))

(assert (= (and d!140175 (not res!847306)) b!1274595))

(assert (= (and b!1274595 res!847307) b!1274596))

(assert (=> b!1274596 m!1171277))

(assert (=> start!107778 d!140175))

(declare-fun d!140181 () Bool)

(declare-fun res!847308 () Bool)

(declare-fun e!727407 () Bool)

(assert (=> d!140181 (=> res!847308 e!727407)))

(assert (=> d!140181 (= res!847308 (or (is-Nil!28584 (t!42120 l!595)) (is-Nil!28584 (t!42120 (t!42120 l!595)))))))

(assert (=> d!140181 (= (isStrictlySorted!845 (t!42120 l!595)) e!727407)))

(declare-fun b!1274598 () Bool)

(declare-fun e!727408 () Bool)

(assert (=> b!1274598 (= e!727407 e!727408)))

(declare-fun res!847309 () Bool)

(assert (=> b!1274598 (=> (not res!847309) (not e!727408))))

(assert (=> b!1274598 (= res!847309 (bvslt (_1!10713 (h!29792 (t!42120 l!595))) (_1!10713 (h!29792 (t!42120 (t!42120 l!595))))))))

(declare-fun b!1274599 () Bool)

(assert (=> b!1274599 (= e!727408 (isStrictlySorted!845 (t!42120 (t!42120 l!595))))))

(assert (= (and d!140181 (not res!847308)) b!1274598))

(assert (= (and b!1274598 res!847309) b!1274599))

(declare-fun m!1171283 () Bool)

(assert (=> b!1274599 m!1171283))

(assert (=> b!1274564 d!140181))

(declare-fun b!1274604 () Bool)

(declare-fun e!727411 () Bool)

(declare-fun tp!97973 () Bool)

(assert (=> b!1274604 (= e!727411 (and tp_is_empty!33173 tp!97973))))

(assert (=> b!1274565 (= tp!97964 e!727411)))

(assert (= (and b!1274565 (is-Cons!28583 (t!42120 l!595))) b!1274604))

(push 1)

