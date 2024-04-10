; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136922 () Bool)

(assert start!136922)

(declare-datatypes ((B!2576 0))(
  ( (B!2577 (val!19650 Int)) )
))
(declare-datatypes ((tuple2!25402 0))(
  ( (tuple2!25403 (_1!12712 (_ BitVec 64)) (_2!12712 B!2576)) )
))
(declare-datatypes ((List!36770 0))(
  ( (Nil!36767) (Cons!36766 (h!38309 tuple2!25402) (t!51684 List!36770)) )
))
(declare-datatypes ((ListLongMap!22741 0))(
  ( (ListLongMap!22742 (toList!11386 List!36770)) )
))
(declare-fun thiss!201 () ListLongMap!22741)

(declare-fun isStrictlySorted!1031 (List!36770) Bool)

(assert (=> start!136922 (not (isStrictlySorted!1031 (toList!11386 thiss!201)))))

(declare-fun e!880937 () Bool)

(declare-fun inv!58936 (ListLongMap!22741) Bool)

(assert (=> start!136922 (and (inv!58936 thiss!201) e!880937)))

(declare-fun b!1579242 () Bool)

(declare-fun tp!114297 () Bool)

(assert (=> b!1579242 (= e!880937 tp!114297)))

(assert (= start!136922 b!1579242))

(declare-fun m!1451125 () Bool)

(assert (=> start!136922 m!1451125))

(declare-fun m!1451127 () Bool)

(assert (=> start!136922 m!1451127))

(push 1)

(assert (not start!136922))

(assert (not b!1579242))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166241 () Bool)

(declare-fun res!1079024 () Bool)

(declare-fun e!880965 () Bool)

(assert (=> d!166241 (=> res!1079024 e!880965)))

(assert (=> d!166241 (= res!1079024 (or (is-Nil!36767 (toList!11386 thiss!201)) (is-Nil!36767 (t!51684 (toList!11386 thiss!201)))))))

(assert (=> d!166241 (= (isStrictlySorted!1031 (toList!11386 thiss!201)) e!880965)))

(declare-fun b!1579274 () Bool)

(declare-fun e!880966 () Bool)

(assert (=> b!1579274 (= e!880965 e!880966)))

(declare-fun res!1079025 () Bool)

(assert (=> b!1579274 (=> (not res!1079025) (not e!880966))))

(assert (=> b!1579274 (= res!1079025 (bvslt (_1!12712 (h!38309 (toList!11386 thiss!201))) (_1!12712 (h!38309 (t!51684 (toList!11386 thiss!201))))))))

(declare-fun b!1579275 () Bool)

(assert (=> b!1579275 (= e!880966 (isStrictlySorted!1031 (t!51684 (toList!11386 thiss!201))))))

