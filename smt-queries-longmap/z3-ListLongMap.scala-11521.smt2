; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134544 () Bool)

(assert start!134544)

(declare-datatypes ((B!2450 0))(
  ( (B!2451 (val!19587 Int)) )
))
(declare-datatypes ((tuple2!25336 0))(
  ( (tuple2!25337 (_1!12679 (_ BitVec 64)) (_2!12679 B!2450)) )
))
(declare-datatypes ((List!36694 0))(
  ( (Nil!36691) (Cons!36690 (h!38155 tuple2!25336) (t!51594 List!36694)) )
))
(declare-datatypes ((ListLongMap!22779 0))(
  ( (ListLongMap!22780 (toList!11405 List!36694)) )
))
(declare-fun inv!57996 (ListLongMap!22779) Bool)

(assert (=> start!134544 (not (inv!57996 (ListLongMap!22780 Nil!36691)))))

(declare-fun bs!45133 () Bool)

(assert (= bs!45133 start!134544))

(declare-fun m!1444629 () Bool)

(assert (=> bs!45133 m!1444629))

(check-sat (not start!134544))
(check-sat)
(get-model)

(declare-fun d!164293 () Bool)

(declare-fun isStrictlySorted!975 (List!36694) Bool)

(assert (=> d!164293 (= (inv!57996 (ListLongMap!22780 Nil!36691)) (isStrictlySorted!975 (toList!11405 (ListLongMap!22780 Nil!36691))))))

(declare-fun bs!45137 () Bool)

(assert (= bs!45137 d!164293))

(declare-fun m!1444638 () Bool)

(assert (=> bs!45137 m!1444638))

(assert (=> start!134544 d!164293))

(check-sat (not d!164293))
(check-sat)
(get-model)

(declare-fun d!164295 () Bool)

(assert (=> d!164295 (= (isStrictlySorted!975 (toList!11405 (ListLongMap!22780 Nil!36691))) true)))

(assert (=> d!164293 d!164295))

(check-sat)
