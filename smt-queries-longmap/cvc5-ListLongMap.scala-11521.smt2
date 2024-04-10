; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134132 () Bool)

(assert start!134132)

(declare-datatypes ((B!2450 0))(
  ( (B!2451 (val!19587 Int)) )
))
(declare-datatypes ((tuple2!25276 0))(
  ( (tuple2!25277 (_1!12649 (_ BitVec 64)) (_2!12649 B!2450)) )
))
(declare-datatypes ((List!36662 0))(
  ( (Nil!36659) (Cons!36658 (h!38105 tuple2!25276) (t!51570 List!36662)) )
))
(declare-datatypes ((ListLongMap!22711 0))(
  ( (ListLongMap!22712 (toList!11371 List!36662)) )
))
(declare-fun inv!57996 (ListLongMap!22711) Bool)

(assert (=> start!134132 (not (inv!57996 (ListLongMap!22712 Nil!36659)))))

(declare-fun bs!45115 () Bool)

(assert (= bs!45115 start!134132))

(declare-fun m!1442371 () Bool)

(assert (=> bs!45115 m!1442371))

(push 1)

(assert (not start!134132))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!163589 () Bool)

(declare-fun isStrictlySorted!987 (List!36662) Bool)

(assert (=> d!163589 (= (inv!57996 (ListLongMap!22712 Nil!36659)) (isStrictlySorted!987 (toList!11371 (ListLongMap!22712 Nil!36659))))))

(declare-fun bs!45118 () Bool)

(assert (= bs!45118 d!163589))

(declare-fun m!1442377 () Bool)

(assert (=> bs!45118 m!1442377))

(assert (=> start!134132 d!163589))

(push 1)

(assert (not d!163589))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!163597 () Bool)

(assert (=> d!163597 (= (isStrictlySorted!987 (toList!11371 (ListLongMap!22712 Nil!36659))) true)))

