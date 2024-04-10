; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132688 () Bool)

(assert start!132688)

(declare-fun res!1063972 () Bool)

(declare-fun e!865811 () Bool)

(assert (=> start!132688 (=> (not res!1063972) (not e!865811))))

(declare-datatypes ((B!2260 0))(
  ( (B!2261 (val!19216 Int)) )
))
(declare-datatypes ((tuple2!24808 0))(
  ( (tuple2!24809 (_1!12415 (_ BitVec 64)) (_2!12415 B!2260)) )
))
(declare-datatypes ((List!36250 0))(
  ( (Nil!36247) (Cons!36246 (h!37692 tuple2!24808) (t!50971 List!36250)) )
))
(declare-fun l!1177 () List!36250)

(declare-fun isStrictlySorted!909 (List!36250) Bool)

(assert (=> start!132688 (= res!1063972 (isStrictlySorted!909 l!1177))))

(assert (=> start!132688 e!865811))

(declare-fun e!865810 () Bool)

(assert (=> start!132688 e!865810))

(assert (=> start!132688 true))

(declare-fun tp_is_empty!38271 () Bool)

(assert (=> start!132688 tp_is_empty!38271))

(declare-fun b!1554814 () Bool)

(declare-fun tp!112230 () Bool)

(assert (=> b!1554814 (= e!865810 (and tp_is_empty!38271 tp!112230))))

(declare-fun b!1554815 () Bool)

(declare-fun res!1063974 () Bool)

(assert (=> b!1554815 (=> (not res!1063974) (not e!865811))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1554815 (= res!1063974 (and (not (= newKey!105 otherKey!50)) ((_ is Cons!36246) l!1177) (not (= (_1!12415 (h!37692 l!1177)) otherKey!50))))))

(declare-fun b!1554816 () Bool)

(declare-fun res!1063973 () Bool)

(assert (=> b!1554816 (=> (not res!1063973) (not e!865811))))

(assert (=> b!1554816 (= res!1063973 (isStrictlySorted!909 (t!50971 l!1177)))))

(declare-fun b!1554817 () Bool)

(assert (=> b!1554817 (= e!865811 (not true))))

(declare-fun e!865809 () Bool)

(assert (=> b!1554817 e!865809))

(declare-fun res!1063975 () Bool)

(assert (=> b!1554817 (=> (not res!1063975) (not e!865809))))

(declare-fun lt!670159 () List!36250)

(declare-fun containsKey!780 (List!36250 (_ BitVec 64)) Bool)

(assert (=> b!1554817 (= res!1063975 (= (containsKey!780 lt!670159 otherKey!50) (containsKey!780 (t!50971 l!1177) otherKey!50)))))

(declare-fun newValue!105 () B!2260)

(declare-fun insertStrictlySorted!520 (List!36250 (_ BitVec 64) B!2260) List!36250)

(assert (=> b!1554817 (= lt!670159 (insertStrictlySorted!520 (t!50971 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51804 0))(
  ( (Unit!51805) )
))
(declare-fun lt!670160 () Unit!51804)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!17 (List!36250 (_ BitVec 64) B!2260 (_ BitVec 64)) Unit!51804)

(assert (=> b!1554817 (= lt!670160 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!17 (t!50971 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun b!1554818 () Bool)

(declare-datatypes ((Option!834 0))(
  ( (Some!833 (v!22018 B!2260)) (None!832) )
))
(declare-fun getValueByKey!758 (List!36250 (_ BitVec 64)) Option!834)

(assert (=> b!1554818 (= e!865809 (= (getValueByKey!758 lt!670159 otherKey!50) (getValueByKey!758 (t!50971 l!1177) otherKey!50)))))

(assert (= (and start!132688 res!1063972) b!1554815))

(assert (= (and b!1554815 res!1063974) b!1554816))

(assert (= (and b!1554816 res!1063973) b!1554817))

(assert (= (and b!1554817 res!1063975) b!1554818))

(assert (= (and start!132688 ((_ is Cons!36246) l!1177)) b!1554814))

(declare-fun m!1433017 () Bool)

(assert (=> start!132688 m!1433017))

(declare-fun m!1433019 () Bool)

(assert (=> b!1554816 m!1433019))

(declare-fun m!1433021 () Bool)

(assert (=> b!1554817 m!1433021))

(declare-fun m!1433023 () Bool)

(assert (=> b!1554817 m!1433023))

(declare-fun m!1433025 () Bool)

(assert (=> b!1554817 m!1433025))

(declare-fun m!1433027 () Bool)

(assert (=> b!1554817 m!1433027))

(declare-fun m!1433029 () Bool)

(assert (=> b!1554818 m!1433029))

(declare-fun m!1433031 () Bool)

(assert (=> b!1554818 m!1433031))

(check-sat (not b!1554817) (not b!1554816) tp_is_empty!38271 (not b!1554818) (not start!132688) (not b!1554814))
(check-sat)
