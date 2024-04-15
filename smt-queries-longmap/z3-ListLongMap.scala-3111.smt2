; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43746 () Bool)

(assert start!43746)

(declare-fun res!288115 () Bool)

(declare-fun e!284592 () Bool)

(assert (=> start!43746 (=> (not res!288115) (not e!284592))))

(declare-datatypes ((B!1088 0))(
  ( (B!1089 (val!6996 Int)) )
))
(declare-datatypes ((tuple2!9244 0))(
  ( (tuple2!9245 (_1!4633 (_ BitVec 64)) (_2!4633 B!1088)) )
))
(declare-datatypes ((List!9298 0))(
  ( (Nil!9295) (Cons!9294 (h!10150 tuple2!9244) (t!15511 List!9298)) )
))
(declare-fun l!956 () List!9298)

(declare-fun isStrictlySorted!395 (List!9298) Bool)

(assert (=> start!43746 (= res!288115 (isStrictlySorted!395 l!956))))

(assert (=> start!43746 e!284592))

(declare-fun e!284591 () Bool)

(assert (=> start!43746 e!284591))

(assert (=> start!43746 true))

(declare-fun tp_is_empty!13897 () Bool)

(assert (=> start!43746 tp_is_empty!13897))

(declare-fun b!483539 () Bool)

(declare-fun res!288116 () Bool)

(assert (=> b!483539 (=> (not res!288116) (not e!284592))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!360 (List!9298 (_ BitVec 64)) Bool)

(assert (=> b!483539 (= res!288116 (not (containsKey!360 l!956 key!251)))))

(declare-fun b!483540 () Bool)

(assert (=> b!483540 (= e!284592 false)))

(declare-fun value!166 () B!1088)

(declare-fun lt!219046 () List!9298)

(declare-fun insertStrictlySorted!218 (List!9298 (_ BitVec 64) B!1088) List!9298)

(assert (=> b!483540 (= lt!219046 (insertStrictlySorted!218 l!956 key!251 value!166))))

(declare-fun b!483541 () Bool)

(declare-fun tp!43435 () Bool)

(assert (=> b!483541 (= e!284591 (and tp_is_empty!13897 tp!43435))))

(assert (= (and start!43746 res!288115) b!483539))

(assert (= (and b!483539 res!288116) b!483540))

(get-info :version)

(assert (= (and start!43746 ((_ is Cons!9294) l!956)) b!483541))

(declare-fun m!463983 () Bool)

(assert (=> start!43746 m!463983))

(declare-fun m!463985 () Bool)

(assert (=> b!483539 m!463985))

(declare-fun m!463987 () Bool)

(assert (=> b!483540 m!463987))

(check-sat (not start!43746) tp_is_empty!13897 (not b!483539) (not b!483541) (not b!483540))
(check-sat)
