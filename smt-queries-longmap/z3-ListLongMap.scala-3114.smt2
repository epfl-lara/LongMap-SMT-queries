; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43764 () Bool)

(assert start!43764)

(declare-fun res!288196 () Bool)

(declare-fun e!284654 () Bool)

(assert (=> start!43764 (=> (not res!288196) (not e!284654))))

(declare-datatypes ((B!1106 0))(
  ( (B!1107 (val!7005 Int)) )
))
(declare-datatypes ((tuple2!9262 0))(
  ( (tuple2!9263 (_1!4642 (_ BitVec 64)) (_2!4642 B!1106)) )
))
(declare-datatypes ((List!9307 0))(
  ( (Nil!9304) (Cons!9303 (h!10159 tuple2!9262) (t!15520 List!9307)) )
))
(declare-fun l!956 () List!9307)

(declare-fun isStrictlySorted!404 (List!9307) Bool)

(assert (=> start!43764 (= res!288196 (isStrictlySorted!404 l!956))))

(assert (=> start!43764 e!284654))

(declare-fun e!284655 () Bool)

(assert (=> start!43764 e!284655))

(assert (=> start!43764 true))

(declare-fun tp_is_empty!13915 () Bool)

(assert (=> start!43764 tp_is_empty!13915))

(declare-fun b!483647 () Bool)

(declare-fun res!288197 () Bool)

(assert (=> b!483647 (=> (not res!288197) (not e!284654))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!369 (List!9307 (_ BitVec 64)) Bool)

(assert (=> b!483647 (= res!288197 (not (containsKey!369 l!956 key!251)))))

(declare-fun b!483648 () Bool)

(assert (=> b!483648 (= e!284654 false)))

(declare-fun lt!219082 () List!9307)

(declare-fun value!166 () B!1106)

(declare-fun insertStrictlySorted!227 (List!9307 (_ BitVec 64) B!1106) List!9307)

(assert (=> b!483648 (= lt!219082 (insertStrictlySorted!227 l!956 key!251 value!166))))

(declare-fun b!483649 () Bool)

(declare-fun tp!43462 () Bool)

(assert (=> b!483649 (= e!284655 (and tp_is_empty!13915 tp!43462))))

(assert (= (and start!43764 res!288196) b!483647))

(assert (= (and b!483647 res!288197) b!483648))

(get-info :version)

(assert (= (and start!43764 ((_ is Cons!9303) l!956)) b!483649))

(declare-fun m!464073 () Bool)

(assert (=> start!43764 m!464073))

(declare-fun m!464075 () Bool)

(assert (=> b!483647 m!464075))

(declare-fun m!464077 () Bool)

(assert (=> b!483648 m!464077))

(check-sat (not b!483649) tp_is_empty!13915 (not b!483647) (not b!483648) (not start!43764))
(check-sat)
