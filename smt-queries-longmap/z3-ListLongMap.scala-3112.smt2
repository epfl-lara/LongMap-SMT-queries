; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43752 () Bool)

(assert start!43752)

(declare-fun res!288256 () Bool)

(declare-fun e!284744 () Bool)

(assert (=> start!43752 (=> (not res!288256) (not e!284744))))

(declare-datatypes ((B!1094 0))(
  ( (B!1095 (val!6999 Int)) )
))
(declare-datatypes ((tuple2!9114 0))(
  ( (tuple2!9115 (_1!4568 (_ BitVec 64)) (_2!4568 B!1094)) )
))
(declare-datatypes ((List!9165 0))(
  ( (Nil!9162) (Cons!9161 (h!10017 tuple2!9114) (t!15379 List!9165)) )
))
(declare-fun l!956 () List!9165)

(declare-fun isStrictlySorted!390 (List!9165) Bool)

(assert (=> start!43752 (= res!288256 (isStrictlySorted!390 l!956))))

(assert (=> start!43752 e!284744))

(declare-fun e!284745 () Bool)

(assert (=> start!43752 e!284745))

(assert (=> start!43752 true))

(declare-fun tp_is_empty!13903 () Bool)

(assert (=> start!43752 tp_is_empty!13903))

(declare-fun b!483776 () Bool)

(declare-fun res!288255 () Bool)

(assert (=> b!483776 (=> (not res!288255) (not e!284744))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!365 (List!9165 (_ BitVec 64)) Bool)

(assert (=> b!483776 (= res!288255 (not (containsKey!365 l!956 key!251)))))

(declare-fun b!483777 () Bool)

(assert (=> b!483777 (= e!284744 false)))

(declare-fun lt!219301 () List!9165)

(declare-fun value!166 () B!1094)

(declare-fun insertStrictlySorted!221 (List!9165 (_ BitVec 64) B!1094) List!9165)

(assert (=> b!483777 (= lt!219301 (insertStrictlySorted!221 l!956 key!251 value!166))))

(declare-fun b!483778 () Bool)

(declare-fun tp!43444 () Bool)

(assert (=> b!483778 (= e!284745 (and tp_is_empty!13903 tp!43444))))

(assert (= (and start!43752 res!288256) b!483776))

(assert (= (and b!483776 res!288255) b!483777))

(get-info :version)

(assert (= (and start!43752 ((_ is Cons!9161) l!956)) b!483778))

(declare-fun m!464917 () Bool)

(assert (=> start!43752 m!464917))

(declare-fun m!464919 () Bool)

(assert (=> b!483776 m!464919))

(declare-fun m!464921 () Bool)

(assert (=> b!483777 m!464921))

(check-sat (not b!483776) (not b!483778) (not start!43752) tp_is_empty!13903 (not b!483777))
(check-sat)
