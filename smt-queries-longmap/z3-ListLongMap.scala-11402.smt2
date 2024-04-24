; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133188 () Bool)

(assert start!133188)

(declare-fun b!1557991 () Bool)

(declare-fun res!1065215 () Bool)

(declare-fun e!867795 () Bool)

(assert (=> b!1557991 (=> (not res!1065215) (not e!867795))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-datatypes ((B!2288 0))(
  ( (B!2289 (val!19230 Int)) )
))
(declare-datatypes ((tuple2!24890 0))(
  ( (tuple2!24891 (_1!12456 (_ BitVec 64)) (_2!12456 B!2288)) )
))
(declare-datatypes ((List!36293 0))(
  ( (Nil!36290) (Cons!36289 (h!37753 tuple2!24890) (t!51006 List!36293)) )
))
(declare-fun l!1177 () List!36293)

(get-info :version)

(assert (=> b!1557991 (= res!1065215 (and (not (= newKey!105 otherKey!50)) ((_ is Cons!36289) l!1177) (not (= (_1!12456 (h!37753 l!1177)) otherKey!50))))))

(declare-fun b!1557992 () Bool)

(declare-fun res!1065216 () Bool)

(assert (=> b!1557992 (=> (not res!1065216) (not e!867795))))

(declare-fun isStrictlySorted!910 (List!36293) Bool)

(assert (=> b!1557992 (= res!1065216 (isStrictlySorted!910 (t!51006 l!1177)))))

(declare-fun b!1557993 () Bool)

(declare-fun e!867797 () Bool)

(declare-fun tp_is_empty!38299 () Bool)

(declare-fun tp!112290 () Bool)

(assert (=> b!1557993 (= e!867797 (and tp_is_empty!38299 tp!112290))))

(declare-fun b!1557994 () Bool)

(declare-fun e!867796 () Bool)

(declare-fun lt!671215 () List!36293)

(declare-datatypes ((Option!843 0))(
  ( (Some!842 (v!22024 B!2288)) (None!841) )
))
(declare-fun getValueByKey!768 (List!36293 (_ BitVec 64)) Option!843)

(assert (=> b!1557994 (= e!867796 (= (getValueByKey!768 lt!671215 otherKey!50) (getValueByKey!768 (t!51006 l!1177) otherKey!50)))))

(declare-fun res!1065213 () Bool)

(assert (=> start!133188 (=> (not res!1065213) (not e!867795))))

(assert (=> start!133188 (= res!1065213 (isStrictlySorted!910 l!1177))))

(assert (=> start!133188 e!867795))

(assert (=> start!133188 e!867797))

(assert (=> start!133188 true))

(assert (=> start!133188 tp_is_empty!38299))

(declare-fun b!1557995 () Bool)

(assert (=> b!1557995 (= e!867795 (not true))))

(declare-fun lt!671213 () Bool)

(declare-fun newValue!105 () B!2288)

(declare-fun containsKey!794 (List!36293 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!535 (List!36293 (_ BitVec 64) B!2288) List!36293)

(assert (=> b!1557995 (= lt!671213 (containsKey!794 (insertStrictlySorted!535 l!1177 newKey!105 newValue!105) otherKey!50))))

(assert (=> b!1557995 e!867796))

(declare-fun res!1065214 () Bool)

(assert (=> b!1557995 (=> (not res!1065214) (not e!867796))))

(assert (=> b!1557995 (= res!1065214 (= (containsKey!794 lt!671215 otherKey!50) (containsKey!794 (t!51006 l!1177) otherKey!50)))))

(assert (=> b!1557995 (= lt!671215 (insertStrictlySorted!535 (t!51006 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51743 0))(
  ( (Unit!51744) )
))
(declare-fun lt!671214 () Unit!51743)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!31 (List!36293 (_ BitVec 64) B!2288 (_ BitVec 64)) Unit!51743)

(assert (=> b!1557995 (= lt!671214 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!31 (t!51006 l!1177) newKey!105 newValue!105 otherKey!50))))

(assert (= (and start!133188 res!1065213) b!1557991))

(assert (= (and b!1557991 res!1065215) b!1557992))

(assert (= (and b!1557992 res!1065216) b!1557995))

(assert (= (and b!1557995 res!1065214) b!1557994))

(assert (= (and start!133188 ((_ is Cons!36289) l!1177)) b!1557993))

(declare-fun m!1435769 () Bool)

(assert (=> b!1557992 m!1435769))

(declare-fun m!1435771 () Bool)

(assert (=> b!1557994 m!1435771))

(declare-fun m!1435773 () Bool)

(assert (=> b!1557994 m!1435773))

(declare-fun m!1435775 () Bool)

(assert (=> start!133188 m!1435775))

(declare-fun m!1435777 () Bool)

(assert (=> b!1557995 m!1435777))

(declare-fun m!1435779 () Bool)

(assert (=> b!1557995 m!1435779))

(declare-fun m!1435781 () Bool)

(assert (=> b!1557995 m!1435781))

(declare-fun m!1435783 () Bool)

(assert (=> b!1557995 m!1435783))

(declare-fun m!1435785 () Bool)

(assert (=> b!1557995 m!1435785))

(assert (=> b!1557995 m!1435779))

(declare-fun m!1435787 () Bool)

(assert (=> b!1557995 m!1435787))

(check-sat (not b!1557992) (not start!133188) tp_is_empty!38299 (not b!1557993) (not b!1557995) (not b!1557994))
(check-sat)
