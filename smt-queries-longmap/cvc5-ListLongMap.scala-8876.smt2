; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107774 () Bool)

(assert start!107774)

(declare-fun res!847273 () Bool)

(declare-fun e!727366 () Bool)

(assert (=> start!107774 (=> (not res!847273) (not e!727366))))

(declare-datatypes ((B!2126 0))(
  ( (B!2127 (val!16659 Int)) )
))
(declare-datatypes ((tuple2!21400 0))(
  ( (tuple2!21401 (_1!10711 (_ BitVec 64)) (_2!10711 B!2126)) )
))
(declare-datatypes ((List!28585 0))(
  ( (Nil!28582) (Cons!28581 (h!29790 tuple2!21400) (t!42118 List!28585)) )
))
(declare-fun l!595 () List!28585)

(declare-fun isStrictlySorted!843 (List!28585) Bool)

(assert (=> start!107774 (= res!847273 (isStrictlySorted!843 l!595))))

(assert (=> start!107774 e!727366))

(declare-fun e!727365 () Bool)

(assert (=> start!107774 e!727365))

(assert (=> start!107774 true))

(declare-fun b!1274545 () Bool)

(declare-fun res!847272 () Bool)

(assert (=> b!1274545 (=> (not res!847272) (not e!727366))))

(declare-fun key!173 () (_ BitVec 64))

(assert (=> b!1274545 (= res!847272 (and (not (= (_1!10711 (h!29790 l!595)) key!173)) (is-Cons!28581 l!595)))))

(declare-fun b!1274546 () Bool)

(assert (=> b!1274546 (= e!727366 (not (isStrictlySorted!843 (t!42118 l!595))))))

(declare-fun b!1274547 () Bool)

(declare-fun tp_is_empty!33169 () Bool)

(declare-fun tp!97958 () Bool)

(assert (=> b!1274547 (= e!727365 (and tp_is_empty!33169 tp!97958))))

(assert (= (and start!107774 res!847273) b!1274545))

(assert (= (and b!1274545 res!847272) b!1274546))

(assert (= (and start!107774 (is-Cons!28581 l!595)) b!1274547))

(declare-fun m!1171267 () Bool)

(assert (=> start!107774 m!1171267))

(declare-fun m!1171269 () Bool)

(assert (=> b!1274546 m!1171269))

(push 1)

(assert (not start!107774))

(assert (not b!1274546))

(assert (not b!1274547))

(assert tp_is_empty!33169)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!140173 () Bool)

(declare-fun res!847294 () Bool)

(declare-fun e!727387 () Bool)

(assert (=> d!140173 (=> res!847294 e!727387)))

(assert (=> d!140173 (= res!847294 (or (is-Nil!28582 l!595) (is-Nil!28582 (t!42118 l!595))))))

(assert (=> d!140173 (= (isStrictlySorted!843 l!595) e!727387)))

(declare-fun b!1274574 () Bool)

(declare-fun e!727388 () Bool)

(assert (=> b!1274574 (= e!727387 e!727388)))

(declare-fun res!847295 () Bool)

(assert (=> b!1274574 (=> (not res!847295) (not e!727388))))

(assert (=> b!1274574 (= res!847295 (bvslt (_1!10711 (h!29790 l!595)) (_1!10711 (h!29790 (t!42118 l!595)))))))

(declare-fun b!1274575 () Bool)

(assert (=> b!1274575 (= e!727388 (isStrictlySorted!843 (t!42118 l!595)))))

(assert (= (and d!140173 (not res!847294)) b!1274574))

(assert (= (and b!1274574 res!847295) b!1274575))

(assert (=> b!1274575 m!1171269))

(assert (=> start!107774 d!140173))

(declare-fun d!140177 () Bool)

(declare-fun res!847296 () Bool)

(declare-fun e!727389 () Bool)

(assert (=> d!140177 (=> res!847296 e!727389)))

(assert (=> d!140177 (= res!847296 (or (is-Nil!28582 (t!42118 l!595)) (is-Nil!28582 (t!42118 (t!42118 l!595)))))))

(assert (=> d!140177 (= (isStrictlySorted!843 (t!42118 l!595)) e!727389)))

(declare-fun b!1274576 () Bool)

(declare-fun e!727390 () Bool)

(assert (=> b!1274576 (= e!727389 e!727390)))

(declare-fun res!847297 () Bool)

(assert (=> b!1274576 (=> (not res!847297) (not e!727390))))

(assert (=> b!1274576 (= res!847297 (bvslt (_1!10711 (h!29790 (t!42118 l!595))) (_1!10711 (h!29790 (t!42118 (t!42118 l!595))))))))

(declare-fun b!1274577 () Bool)

(assert (=> b!1274577 (= e!727390 (isStrictlySorted!843 (t!42118 (t!42118 l!595))))))

(assert (= (and d!140177 (not res!847296)) b!1274576))

(assert (= (and b!1274576 res!847297) b!1274577))

(declare-fun m!1171279 () Bool)

(assert (=> b!1274577 m!1171279))

(assert (=> b!1274546 d!140177))

(declare-fun b!1274588 () Bool)

(declare-fun e!727399 () Bool)

(declare-fun tp!97967 () Bool)

(assert (=> b!1274588 (= e!727399 (and tp_is_empty!33169 tp!97967))))

(assert (=> b!1274547 (= tp!97958 e!727399)))

(assert (= (and b!1274547 (is-Cons!28581 (t!42118 l!595))) b!1274588))

(push 1)

(assert (not b!1274577))

(assert (not b!1274575))

(assert (not b!1274588))

(assert tp_is_empty!33169)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

