; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43746 () Bool)

(assert start!43746)

(declare-fun res!288237 () Bool)

(declare-fun e!284726 () Bool)

(assert (=> start!43746 (=> (not res!288237) (not e!284726))))

(declare-datatypes ((B!1088 0))(
  ( (B!1089 (val!6996 Int)) )
))
(declare-datatypes ((tuple2!9108 0))(
  ( (tuple2!9109 (_1!4565 (_ BitVec 64)) (_2!4565 B!1088)) )
))
(declare-datatypes ((List!9162 0))(
  ( (Nil!9159) (Cons!9158 (h!10014 tuple2!9108) (t!15376 List!9162)) )
))
(declare-fun l!956 () List!9162)

(declare-fun isStrictlySorted!387 (List!9162) Bool)

(assert (=> start!43746 (= res!288237 (isStrictlySorted!387 l!956))))

(assert (=> start!43746 e!284726))

(declare-fun e!284727 () Bool)

(assert (=> start!43746 e!284727))

(assert (=> start!43746 true))

(declare-fun tp_is_empty!13897 () Bool)

(assert (=> start!43746 tp_is_empty!13897))

(declare-fun b!483749 () Bool)

(declare-fun res!288238 () Bool)

(assert (=> b!483749 (=> (not res!288238) (not e!284726))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!362 (List!9162 (_ BitVec 64)) Bool)

(assert (=> b!483749 (= res!288238 (not (containsKey!362 l!956 key!251)))))

(declare-fun b!483750 () Bool)

(assert (=> b!483750 (= e!284726 false)))

(declare-fun lt!219292 () List!9162)

(declare-fun value!166 () B!1088)

(declare-fun insertStrictlySorted!218 (List!9162 (_ BitVec 64) B!1088) List!9162)

(assert (=> b!483750 (= lt!219292 (insertStrictlySorted!218 l!956 key!251 value!166))))

(declare-fun b!483751 () Bool)

(declare-fun tp!43435 () Bool)

(assert (=> b!483751 (= e!284727 (and tp_is_empty!13897 tp!43435))))

(assert (= (and start!43746 res!288237) b!483749))

(assert (= (and b!483749 res!288238) b!483750))

(get-info :version)

(assert (= (and start!43746 ((_ is Cons!9158) l!956)) b!483751))

(declare-fun m!464899 () Bool)

(assert (=> start!43746 m!464899))

(declare-fun m!464901 () Bool)

(assert (=> b!483749 m!464901))

(declare-fun m!464903 () Bool)

(assert (=> b!483750 m!464903))

(check-sat tp_is_empty!13897 (not b!483750) (not b!483749) (not start!43746) (not b!483751))
(check-sat)
