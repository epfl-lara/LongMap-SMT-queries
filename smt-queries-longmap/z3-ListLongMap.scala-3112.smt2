; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43752 () Bool)

(assert start!43752)

(declare-fun res!288133 () Bool)

(declare-fun e!284610 () Bool)

(assert (=> start!43752 (=> (not res!288133) (not e!284610))))

(declare-datatypes ((B!1094 0))(
  ( (B!1095 (val!6999 Int)) )
))
(declare-datatypes ((tuple2!9250 0))(
  ( (tuple2!9251 (_1!4636 (_ BitVec 64)) (_2!4636 B!1094)) )
))
(declare-datatypes ((List!9301 0))(
  ( (Nil!9298) (Cons!9297 (h!10153 tuple2!9250) (t!15514 List!9301)) )
))
(declare-fun l!956 () List!9301)

(declare-fun isStrictlySorted!398 (List!9301) Bool)

(assert (=> start!43752 (= res!288133 (isStrictlySorted!398 l!956))))

(assert (=> start!43752 e!284610))

(declare-fun e!284609 () Bool)

(assert (=> start!43752 e!284609))

(assert (=> start!43752 true))

(declare-fun tp_is_empty!13903 () Bool)

(assert (=> start!43752 tp_is_empty!13903))

(declare-fun b!483566 () Bool)

(declare-fun res!288134 () Bool)

(assert (=> b!483566 (=> (not res!288134) (not e!284610))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!363 (List!9301 (_ BitVec 64)) Bool)

(assert (=> b!483566 (= res!288134 (not (containsKey!363 l!956 key!251)))))

(declare-fun b!483567 () Bool)

(assert (=> b!483567 (= e!284610 false)))

(declare-fun lt!219055 () List!9301)

(declare-fun value!166 () B!1094)

(declare-fun insertStrictlySorted!221 (List!9301 (_ BitVec 64) B!1094) List!9301)

(assert (=> b!483567 (= lt!219055 (insertStrictlySorted!221 l!956 key!251 value!166))))

(declare-fun b!483568 () Bool)

(declare-fun tp!43444 () Bool)

(assert (=> b!483568 (= e!284609 (and tp_is_empty!13903 tp!43444))))

(assert (= (and start!43752 res!288133) b!483566))

(assert (= (and b!483566 res!288134) b!483567))

(get-info :version)

(assert (= (and start!43752 ((_ is Cons!9297) l!956)) b!483568))

(declare-fun m!464001 () Bool)

(assert (=> start!43752 m!464001))

(declare-fun m!464003 () Bool)

(assert (=> b!483566 m!464003))

(declare-fun m!464005 () Bool)

(assert (=> b!483567 m!464005))

(check-sat (not b!483567) (not b!483568) (not b!483566) tp_is_empty!13903 (not start!43752))
(check-sat)
