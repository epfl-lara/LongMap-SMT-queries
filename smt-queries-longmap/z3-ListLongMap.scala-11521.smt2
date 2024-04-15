; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134082 () Bool)

(assert start!134082)

(declare-datatypes ((B!2450 0))(
  ( (B!2451 (val!19587 Int)) )
))
(declare-datatypes ((tuple2!25344 0))(
  ( (tuple2!25345 (_1!12683 (_ BitVec 64)) (_2!12683 B!2450)) )
))
(declare-datatypes ((List!36703 0))(
  ( (Nil!36700) (Cons!36699 (h!38147 tuple2!25344) (t!51603 List!36703)) )
))
(declare-datatypes ((ListLongMap!22779 0))(
  ( (ListLongMap!22780 (toList!11405 List!36703)) )
))
(declare-fun inv!57996 (ListLongMap!22779) Bool)

(assert (=> start!134082 (not (inv!57996 (ListLongMap!22780 Nil!36700)))))

(declare-fun bs!45069 () Bool)

(assert (= bs!45069 start!134082))

(declare-fun m!1441479 () Bool)

(assert (=> bs!45069 m!1441479))

(check-sat (not start!134082))
(check-sat)
(get-model)

(declare-fun d!163335 () Bool)

(declare-fun isStrictlySorted!986 (List!36703) Bool)

(assert (=> d!163335 (= (inv!57996 (ListLongMap!22780 Nil!36700)) (isStrictlySorted!986 (toList!11405 (ListLongMap!22780 Nil!36700))))))

(declare-fun bs!45072 () Bool)

(assert (= bs!45072 d!163335))

(declare-fun m!1441485 () Bool)

(assert (=> bs!45072 m!1441485))

(assert (=> start!134082 d!163335))

(check-sat (not d!163335))
(check-sat)
(get-model)

(declare-fun d!163341 () Bool)

(assert (=> d!163341 (= (isStrictlySorted!986 (toList!11405 (ListLongMap!22780 Nil!36700))) true)))

(assert (=> d!163335 d!163341))

(check-sat)
