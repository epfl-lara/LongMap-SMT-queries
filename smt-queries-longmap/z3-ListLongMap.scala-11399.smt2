; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132730 () Bool)

(assert start!132730)

(declare-datatypes ((B!2272 0))(
  ( (B!2273 (val!19222 Int)) )
))
(declare-datatypes ((tuple2!24820 0))(
  ( (tuple2!24821 (_1!12421 (_ BitVec 64)) (_2!12421 B!2272)) )
))
(declare-datatypes ((List!36256 0))(
  ( (Nil!36253) (Cons!36252 (h!37698 tuple2!24820) (t!50977 List!36256)) )
))
(declare-fun lt!670216 () List!36256)

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-fun e!866030 () Bool)

(declare-fun b!1555159 () Bool)

(declare-fun l!1177 () List!36256)

(declare-datatypes ((Option!840 0))(
  ( (Some!839 (v!22024 B!2272)) (None!838) )
))
(declare-fun getValueByKey!764 (List!36256 (_ BitVec 64)) Option!840)

(assert (=> b!1555159 (= e!866030 (= (getValueByKey!764 lt!670216 otherKey!50) (getValueByKey!764 (t!50977 l!1177) otherKey!50)))))

(declare-fun res!1064141 () Bool)

(declare-fun e!866028 () Bool)

(assert (=> start!132730 (=> (not res!1064141) (not e!866028))))

(declare-fun isStrictlySorted!915 (List!36256) Bool)

(assert (=> start!132730 (= res!1064141 (isStrictlySorted!915 l!1177))))

(assert (=> start!132730 e!866028))

(declare-fun e!866029 () Bool)

(assert (=> start!132730 e!866029))

(assert (=> start!132730 true))

(declare-fun tp_is_empty!38283 () Bool)

(assert (=> start!132730 tp_is_empty!38283))

(declare-fun b!1555160 () Bool)

(assert (=> b!1555160 (= e!866028 (not true))))

(assert (=> b!1555160 e!866030))

(declare-fun res!1064140 () Bool)

(assert (=> b!1555160 (=> (not res!1064140) (not e!866030))))

(declare-fun containsKey!786 (List!36256 (_ BitVec 64)) Bool)

(assert (=> b!1555160 (= res!1064140 (= (containsKey!786 lt!670216 otherKey!50) (containsKey!786 (t!50977 l!1177) otherKey!50)))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun newValue!105 () B!2272)

(declare-fun insertStrictlySorted!526 (List!36256 (_ BitVec 64) B!2272) List!36256)

(assert (=> b!1555160 (= lt!670216 (insertStrictlySorted!526 (t!50977 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51816 0))(
  ( (Unit!51817) )
))
(declare-fun lt!670217 () Unit!51816)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!23 (List!36256 (_ BitVec 64) B!2272 (_ BitVec 64)) Unit!51816)

(assert (=> b!1555160 (= lt!670217 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!23 (t!50977 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun b!1555161 () Bool)

(declare-fun tp!112257 () Bool)

(assert (=> b!1555161 (= e!866029 (and tp_is_empty!38283 tp!112257))))

(declare-fun b!1555162 () Bool)

(declare-fun res!1064142 () Bool)

(assert (=> b!1555162 (=> (not res!1064142) (not e!866028))))

(assert (=> b!1555162 (= res!1064142 (isStrictlySorted!915 (t!50977 l!1177)))))

(declare-fun b!1555163 () Bool)

(declare-fun res!1064143 () Bool)

(assert (=> b!1555163 (=> (not res!1064143) (not e!866028))))

(get-info :version)

(assert (=> b!1555163 (= res!1064143 (and (not (= newKey!105 otherKey!50)) ((_ is Cons!36252) l!1177) (not (= (_1!12421 (h!37698 l!1177)) otherKey!50))))))

(assert (= (and start!132730 res!1064141) b!1555163))

(assert (= (and b!1555163 res!1064143) b!1555162))

(assert (= (and b!1555162 res!1064142) b!1555160))

(assert (= (and b!1555160 res!1064140) b!1555159))

(assert (= (and start!132730 ((_ is Cons!36252) l!1177)) b!1555161))

(declare-fun m!1433233 () Bool)

(assert (=> b!1555159 m!1433233))

(declare-fun m!1433235 () Bool)

(assert (=> b!1555159 m!1433235))

(declare-fun m!1433237 () Bool)

(assert (=> start!132730 m!1433237))

(declare-fun m!1433239 () Bool)

(assert (=> b!1555160 m!1433239))

(declare-fun m!1433241 () Bool)

(assert (=> b!1555160 m!1433241))

(declare-fun m!1433243 () Bool)

(assert (=> b!1555160 m!1433243))

(declare-fun m!1433245 () Bool)

(assert (=> b!1555160 m!1433245))

(declare-fun m!1433247 () Bool)

(assert (=> b!1555162 m!1433247))

(check-sat tp_is_empty!38283 (not b!1555160) (not b!1555159) (not start!132730) (not b!1555162) (not b!1555161))
(check-sat)
