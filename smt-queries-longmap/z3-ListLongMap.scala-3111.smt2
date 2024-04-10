; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43760 () Bool)

(assert start!43760)

(declare-fun res!288250 () Bool)

(declare-fun e!284772 () Bool)

(assert (=> start!43760 (=> (not res!288250) (not e!284772))))

(declare-datatypes ((B!1090 0))(
  ( (B!1091 (val!6997 Int)) )
))
(declare-datatypes ((tuple2!9196 0))(
  ( (tuple2!9197 (_1!4609 (_ BitVec 64)) (_2!4609 B!1090)) )
))
(declare-datatypes ((List!9261 0))(
  ( (Nil!9258) (Cons!9257 (h!10113 tuple2!9196) (t!15483 List!9261)) )
))
(declare-fun l!956 () List!9261)

(declare-fun isStrictlySorted!400 (List!9261) Bool)

(assert (=> start!43760 (= res!288250 (isStrictlySorted!400 l!956))))

(assert (=> start!43760 e!284772))

(declare-fun e!284771 () Bool)

(assert (=> start!43760 e!284771))

(assert (=> start!43760 true))

(declare-fun tp_is_empty!13899 () Bool)

(assert (=> start!43760 tp_is_empty!13899))

(declare-fun b!483819 () Bool)

(declare-fun res!288251 () Bool)

(assert (=> b!483819 (=> (not res!288251) (not e!284772))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!363 (List!9261 (_ BitVec 64)) Bool)

(assert (=> b!483819 (= res!288251 (not (containsKey!363 l!956 key!251)))))

(declare-fun b!483820 () Bool)

(assert (=> b!483820 (= e!284772 false)))

(declare-fun lt!219283 () List!9261)

(declare-fun value!166 () B!1090)

(declare-fun insertStrictlySorted!218 (List!9261 (_ BitVec 64) B!1090) List!9261)

(assert (=> b!483820 (= lt!219283 (insertStrictlySorted!218 l!956 key!251 value!166))))

(declare-fun b!483821 () Bool)

(declare-fun tp!43438 () Bool)

(assert (=> b!483821 (= e!284771 (and tp_is_empty!13899 tp!43438))))

(assert (= (and start!43760 res!288250) b!483819))

(assert (= (and b!483819 res!288251) b!483820))

(get-info :version)

(assert (= (and start!43760 ((_ is Cons!9257) l!956)) b!483821))

(declare-fun m!464721 () Bool)

(assert (=> start!43760 m!464721))

(declare-fun m!464723 () Bool)

(assert (=> b!483819 m!464723))

(declare-fun m!464725 () Bool)

(assert (=> b!483820 m!464725))

(check-sat (not b!483821) (not b!483820) tp_is_empty!13899 (not start!43760) (not b!483819))
(check-sat)
