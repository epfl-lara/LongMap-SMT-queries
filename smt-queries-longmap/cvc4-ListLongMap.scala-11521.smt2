; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134136 () Bool)

(assert start!134136)

(declare-datatypes ((B!2454 0))(
  ( (B!2455 (val!19589 Int)) )
))
(declare-datatypes ((tuple2!25280 0))(
  ( (tuple2!25281 (_1!12651 (_ BitVec 64)) (_2!12651 B!2454)) )
))
(declare-datatypes ((List!36664 0))(
  ( (Nil!36661) (Cons!36660 (h!38107 tuple2!25280) (t!51572 List!36664)) )
))
(declare-datatypes ((ListLongMap!22715 0))(
  ( (ListLongMap!22716 (toList!11373 List!36664)) )
))
(declare-fun inv!57998 (ListLongMap!22715) Bool)

(assert (=> start!134136 (not (inv!57998 (ListLongMap!22716 Nil!36661)))))

(declare-fun bs!45117 () Bool)

(assert (= bs!45117 start!134136))

(declare-fun m!1442375 () Bool)

(assert (=> bs!45117 m!1442375))

(push 1)

(assert (not start!134136))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!163593 () Bool)

(declare-fun isStrictlySorted!989 (List!36664) Bool)

(assert (=> d!163593 (= (inv!57998 (ListLongMap!22716 Nil!36661)) (isStrictlySorted!989 (toList!11373 (ListLongMap!22716 Nil!36661))))))

(declare-fun bs!45120 () Bool)

(assert (= bs!45120 d!163593))

(declare-fun m!1442381 () Bool)

(assert (=> bs!45120 m!1442381))

(assert (=> start!134136 d!163593))

(push 1)

(assert (not d!163593))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

