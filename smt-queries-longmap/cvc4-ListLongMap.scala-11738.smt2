; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137668 () Bool)

(assert start!137668)

(declare-datatypes ((B!2772 0))(
  ( (B!2773 (val!19748 Int)) )
))
(declare-datatypes ((tuple2!25664 0))(
  ( (tuple2!25665 (_1!12843 (_ BitVec 64)) (_2!12843 B!2772)) )
))
(declare-datatypes ((List!36868 0))(
  ( (Nil!36865) (Cons!36864 (h!38407 tuple2!25664) (t!51782 List!36868)) )
))
(declare-datatypes ((ListLongMap!22775 0))(
  ( (ListLongMap!22776 (toList!11403 List!36868)) )
))
(declare-fun thiss!185 () ListLongMap!22775)

(declare-fun isStrictlySorted!1117 (List!36868) Bool)

(assert (=> start!137668 (not (isStrictlySorted!1117 (toList!11403 thiss!185)))))

(declare-fun e!883163 () Bool)

(declare-fun inv!59113 (ListLongMap!22775) Bool)

(assert (=> start!137668 (and (inv!59113 thiss!185) e!883163)))

(declare-fun b!1582462 () Bool)

(declare-fun tp!114755 () Bool)

(assert (=> b!1582462 (= e!883163 tp!114755)))

(assert (= start!137668 b!1582462))

(declare-fun m!1452889 () Bool)

(assert (=> start!137668 m!1452889))

(declare-fun m!1452891 () Bool)

(assert (=> start!137668 m!1452891))

(push 1)

(assert (not start!137668))

(assert (not b!1582462))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166988 () Bool)

(declare-fun res!1081111 () Bool)

(declare-fun e!883179 () Bool)

(assert (=> d!166988 (=> res!1081111 e!883179)))

(assert (=> d!166988 (= res!1081111 (or (is-Nil!36865 (toList!11403 thiss!185)) (is-Nil!36865 (t!51782 (toList!11403 thiss!185)))))))

(assert (=> d!166988 (= (isStrictlySorted!1117 (toList!11403 thiss!185)) e!883179)))

(declare-fun b!1582478 () Bool)

(declare-fun e!883180 () Bool)

(assert (=> b!1582478 (= e!883179 e!883180)))

(declare-fun res!1081112 () Bool)

(assert (=> b!1582478 (=> (not res!1081112) (not e!883180))))

(assert (=> b!1582478 (= res!1081112 (bvslt (_1!12843 (h!38407 (toList!11403 thiss!185))) (_1!12843 (h!38407 (t!51782 (toList!11403 thiss!185))))))))

(declare-fun b!1582479 () Bool)

(assert (=> b!1582479 (= e!883180 (isStrictlySorted!1117 (t!51782 (toList!11403 thiss!185))))))

(assert (= (and d!166988 (not res!1081111)) b!1582478))

