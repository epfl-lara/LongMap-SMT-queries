; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134134 () Bool)

(assert start!134134)

(declare-datatypes ((B!2452 0))(
  ( (B!2453 (val!19588 Int)) )
))
(declare-datatypes ((tuple2!25278 0))(
  ( (tuple2!25279 (_1!12650 (_ BitVec 64)) (_2!12650 B!2452)) )
))
(declare-datatypes ((List!36663 0))(
  ( (Nil!36660) (Cons!36659 (h!38106 tuple2!25278) (t!51571 List!36663)) )
))
(declare-datatypes ((ListLongMap!22713 0))(
  ( (ListLongMap!22714 (toList!11372 List!36663)) )
))
(declare-fun inv!57997 (ListLongMap!22713) Bool)

(assert (=> start!134134 (not (inv!57997 (ListLongMap!22714 Nil!36660)))))

(declare-fun bs!45116 () Bool)

(assert (= bs!45116 start!134134))

(declare-fun m!1442373 () Bool)

(assert (=> bs!45116 m!1442373))

(check-sat (not start!134134))
(check-sat)
(get-model)

(declare-fun d!163591 () Bool)

(declare-fun isStrictlySorted!988 (List!36663) Bool)

(assert (=> d!163591 (= (inv!57997 (ListLongMap!22714 Nil!36660)) (isStrictlySorted!988 (toList!11372 (ListLongMap!22714 Nil!36660))))))

(declare-fun bs!45119 () Bool)

(assert (= bs!45119 d!163591))

(declare-fun m!1442379 () Bool)

(assert (=> bs!45119 m!1442379))

(assert (=> start!134134 d!163591))

(check-sat (not d!163591))
(check-sat)
(get-model)

(declare-fun d!163595 () Bool)

(assert (=> d!163595 (= (isStrictlySorted!988 (toList!11372 (ListLongMap!22714 Nil!36660))) true)))

(assert (=> d!163591 d!163595))

(check-sat)
