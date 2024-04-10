; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43976 () Bool)

(assert start!43976)

(declare-fun res!288976 () Bool)

(declare-fun e!285683 () Bool)

(assert (=> start!43976 (=> (not res!288976) (not e!285683))))

(declare-datatypes ((B!1156 0))(
  ( (B!1157 (val!7030 Int)) )
))
(declare-datatypes ((tuple2!9262 0))(
  ( (tuple2!9263 (_1!4642 (_ BitVec 64)) (_2!4642 B!1156)) )
))
(declare-datatypes ((List!9294 0))(
  ( (Nil!9291) (Cons!9290 (h!10146 tuple2!9262) (t!15519 List!9294)) )
))
(declare-fun l!956 () List!9294)

(declare-fun isStrictlySorted!433 (List!9294) Bool)

(assert (=> start!43976 (= res!288976 (isStrictlySorted!433 l!956))))

(assert (=> start!43976 e!285683))

(declare-fun e!285684 () Bool)

(assert (=> start!43976 e!285684))

(assert (=> start!43976 true))

(declare-fun tp_is_empty!13965 () Bool)

(assert (=> start!43976 tp_is_empty!13965))

(declare-fun b!485223 () Bool)

(declare-fun res!288977 () Bool)

(assert (=> b!485223 (=> (not res!288977) (not e!285683))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!396 (List!9294 (_ BitVec 64)) Bool)

(assert (=> b!485223 (= res!288977 (not (containsKey!396 l!956 key!251)))))

(declare-fun b!485224 () Bool)

(assert (=> b!485224 (= e!285683 false)))

(declare-fun lt!219502 () List!9294)

(declare-fun value!166 () B!1156)

(declare-fun insertStrictlySorted!248 (List!9294 (_ BitVec 64) B!1156) List!9294)

(assert (=> b!485224 (= lt!219502 (insertStrictlySorted!248 l!956 key!251 value!166))))

(declare-fun b!485225 () Bool)

(declare-fun tp!43594 () Bool)

(assert (=> b!485225 (= e!285684 (and tp_is_empty!13965 tp!43594))))

(assert (= (and start!43976 res!288976) b!485223))

(assert (= (and b!485223 res!288977) b!485224))

(get-info :version)

(assert (= (and start!43976 ((_ is Cons!9290) l!956)) b!485225))

(declare-fun m!465453 () Bool)

(assert (=> start!43976 m!465453))

(declare-fun m!465455 () Bool)

(assert (=> b!485223 m!465455))

(declare-fun m!465457 () Bool)

(assert (=> b!485224 m!465457))

(check-sat (not b!485223) (not start!43976) (not b!485225) tp_is_empty!13965 (not b!485224))
(check-sat)
