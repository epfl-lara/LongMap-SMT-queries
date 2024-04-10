; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132728 () Bool)

(assert start!132728)

(declare-fun b!1555144 () Bool)

(declare-fun res!1064128 () Bool)

(declare-fun e!866021 () Bool)

(assert (=> b!1555144 (=> (not res!1064128) (not e!866021))))

(declare-datatypes ((B!2270 0))(
  ( (B!2271 (val!19221 Int)) )
))
(declare-datatypes ((tuple2!24818 0))(
  ( (tuple2!24819 (_1!12420 (_ BitVec 64)) (_2!12420 B!2270)) )
))
(declare-datatypes ((List!36255 0))(
  ( (Nil!36252) (Cons!36251 (h!37697 tuple2!24818) (t!50976 List!36255)) )
))
(declare-fun l!1177 () List!36255)

(declare-fun isStrictlySorted!914 (List!36255) Bool)

(assert (=> b!1555144 (= res!1064128 (isStrictlySorted!914 (t!50976 l!1177)))))

(declare-fun b!1555145 () Bool)

(declare-fun e!866019 () Bool)

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-fun lt!670210 () List!36255)

(declare-datatypes ((Option!839 0))(
  ( (Some!838 (v!22023 B!2270)) (None!837) )
))
(declare-fun getValueByKey!763 (List!36255 (_ BitVec 64)) Option!839)

(assert (=> b!1555145 (= e!866019 (= (getValueByKey!763 lt!670210 otherKey!50) (getValueByKey!763 (t!50976 l!1177) otherKey!50)))))

(declare-fun b!1555146 () Bool)

(assert (=> b!1555146 (= e!866021 (not true))))

(assert (=> b!1555146 e!866019))

(declare-fun res!1064131 () Bool)

(assert (=> b!1555146 (=> (not res!1064131) (not e!866019))))

(declare-fun containsKey!785 (List!36255 (_ BitVec 64)) Bool)

(assert (=> b!1555146 (= res!1064131 (= (containsKey!785 lt!670210 otherKey!50) (containsKey!785 (t!50976 l!1177) otherKey!50)))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun newValue!105 () B!2270)

(declare-fun insertStrictlySorted!525 (List!36255 (_ BitVec 64) B!2270) List!36255)

(assert (=> b!1555146 (= lt!670210 (insertStrictlySorted!525 (t!50976 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51814 0))(
  ( (Unit!51815) )
))
(declare-fun lt!670211 () Unit!51814)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!22 (List!36255 (_ BitVec 64) B!2270 (_ BitVec 64)) Unit!51814)

(assert (=> b!1555146 (= lt!670211 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!22 (t!50976 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun b!1555147 () Bool)

(declare-fun res!1064129 () Bool)

(assert (=> b!1555147 (=> (not res!1064129) (not e!866021))))

(assert (=> b!1555147 (= res!1064129 (and (not (= newKey!105 otherKey!50)) (is-Cons!36251 l!1177) (not (= (_1!12420 (h!37697 l!1177)) otherKey!50))))))

(declare-fun res!1064130 () Bool)

(assert (=> start!132728 (=> (not res!1064130) (not e!866021))))

(assert (=> start!132728 (= res!1064130 (isStrictlySorted!914 l!1177))))

(assert (=> start!132728 e!866021))

(declare-fun e!866020 () Bool)

(assert (=> start!132728 e!866020))

(assert (=> start!132728 true))

(declare-fun tp_is_empty!38281 () Bool)

(assert (=> start!132728 tp_is_empty!38281))

(declare-fun b!1555148 () Bool)

(declare-fun tp!112254 () Bool)

(assert (=> b!1555148 (= e!866020 (and tp_is_empty!38281 tp!112254))))

(assert (= (and start!132728 res!1064130) b!1555147))

(assert (= (and b!1555147 res!1064129) b!1555144))

(assert (= (and b!1555144 res!1064128) b!1555146))

(assert (= (and b!1555146 res!1064131) b!1555145))

(assert (= (and start!132728 (is-Cons!36251 l!1177)) b!1555148))

(declare-fun m!1433217 () Bool)

(assert (=> b!1555144 m!1433217))

(declare-fun m!1433219 () Bool)

(assert (=> b!1555145 m!1433219))

(declare-fun m!1433221 () Bool)

(assert (=> b!1555145 m!1433221))

(declare-fun m!1433223 () Bool)

(assert (=> b!1555146 m!1433223))

(declare-fun m!1433225 () Bool)

(assert (=> b!1555146 m!1433225))

(declare-fun m!1433227 () Bool)

(assert (=> b!1555146 m!1433227))

(declare-fun m!1433229 () Bool)

(assert (=> b!1555146 m!1433229))

(declare-fun m!1433231 () Bool)

(assert (=> start!132728 m!1433231))

(push 1)

(assert (not b!1555146))

(assert (not start!132728))

(assert (not b!1555145))

(assert tp_is_empty!38281)

(assert (not b!1555144))

(assert (not b!1555148))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

