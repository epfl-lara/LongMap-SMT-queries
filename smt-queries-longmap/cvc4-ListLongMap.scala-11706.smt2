; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136926 () Bool)

(assert start!136926)

(declare-datatypes ((B!2580 0))(
  ( (B!2581 (val!19652 Int)) )
))
(declare-datatypes ((tuple2!25406 0))(
  ( (tuple2!25407 (_1!12714 (_ BitVec 64)) (_2!12714 B!2580)) )
))
(declare-datatypes ((List!36772 0))(
  ( (Nil!36769) (Cons!36768 (h!38311 tuple2!25406) (t!51686 List!36772)) )
))
(declare-datatypes ((ListLongMap!22745 0))(
  ( (ListLongMap!22746 (toList!11388 List!36772)) )
))
(declare-fun thiss!201 () ListLongMap!22745)

(declare-fun isStrictlySorted!1033 (List!36772) Bool)

(assert (=> start!136926 (not (isStrictlySorted!1033 (toList!11388 thiss!201)))))

(declare-fun e!880943 () Bool)

(declare-fun inv!58938 (ListLongMap!22745) Bool)

(assert (=> start!136926 (and (inv!58938 thiss!201) e!880943)))

(declare-fun b!1579248 () Bool)

(declare-fun tp!114303 () Bool)

(assert (=> b!1579248 (= e!880943 tp!114303)))

(assert (= start!136926 b!1579248))

(declare-fun m!1451133 () Bool)

(assert (=> start!136926 m!1451133))

(declare-fun m!1451135 () Bool)

(assert (=> start!136926 m!1451135))

(push 1)

(assert (not start!136926))

(assert (not b!1579248))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166239 () Bool)

(declare-fun res!1079022 () Bool)

(declare-fun e!880958 () Bool)

(assert (=> d!166239 (=> res!1079022 e!880958)))

(assert (=> d!166239 (= res!1079022 (or (is-Nil!36769 (toList!11388 thiss!201)) (is-Nil!36769 (t!51686 (toList!11388 thiss!201)))))))

(assert (=> d!166239 (= (isStrictlySorted!1033 (toList!11388 thiss!201)) e!880958)))

(declare-fun b!1579263 () Bool)

(declare-fun e!880959 () Bool)

(assert (=> b!1579263 (= e!880958 e!880959)))

(declare-fun res!1079023 () Bool)

(assert (=> b!1579263 (=> (not res!1079023) (not e!880959))))

(assert (=> b!1579263 (= res!1079023 (bvslt (_1!12714 (h!38311 (toList!11388 thiss!201))) (_1!12714 (h!38311 (t!51686 (toList!11388 thiss!201))))))))

(declare-fun b!1579264 () Bool)

(assert (=> b!1579264 (= e!880959 (isStrictlySorted!1033 (t!51686 (toList!11388 thiss!201))))))

(assert (= (and d!166239 (not res!1079022)) b!1579263))

(assert (= (and b!1579263 res!1079023) b!1579264))

(declare-fun m!1451139 () Bool)

(assert (=> b!1579264 m!1451139))

(assert (=> start!136926 d!166239))

(declare-fun d!166245 () Bool)

(assert (=> d!166245 (= (inv!58938 thiss!201) (isStrictlySorted!1033 (toList!11388 thiss!201)))))

