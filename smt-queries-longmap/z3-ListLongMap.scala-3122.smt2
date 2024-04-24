; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43962 () Bool)

(assert start!43962)

(declare-fun res!288964 () Bool)

(declare-fun e!285639 () Bool)

(assert (=> start!43962 (=> (not res!288964) (not e!285639))))

(declare-datatypes ((B!1154 0))(
  ( (B!1155 (val!7029 Int)) )
))
(declare-datatypes ((tuple2!9174 0))(
  ( (tuple2!9175 (_1!4598 (_ BitVec 64)) (_2!4598 B!1154)) )
))
(declare-datatypes ((List!9195 0))(
  ( (Nil!9192) (Cons!9191 (h!10047 tuple2!9174) (t!15412 List!9195)) )
))
(declare-fun l!956 () List!9195)

(declare-fun isStrictlySorted!420 (List!9195) Bool)

(assert (=> start!43962 (= res!288964 (isStrictlySorted!420 l!956))))

(assert (=> start!43962 e!285639))

(declare-fun e!285638 () Bool)

(assert (=> start!43962 e!285638))

(assert (=> start!43962 true))

(declare-fun tp_is_empty!13963 () Bool)

(assert (=> start!43962 tp_is_empty!13963))

(declare-fun b!485153 () Bool)

(declare-fun res!288963 () Bool)

(assert (=> b!485153 (=> (not res!288963) (not e!285639))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!395 (List!9195 (_ BitVec 64)) Bool)

(assert (=> b!485153 (= res!288963 (not (containsKey!395 l!956 key!251)))))

(declare-fun b!485154 () Bool)

(assert (=> b!485154 (= e!285639 false)))

(declare-fun lt!219511 () List!9195)

(declare-fun value!166 () B!1154)

(declare-fun insertStrictlySorted!248 (List!9195 (_ BitVec 64) B!1154) List!9195)

(assert (=> b!485154 (= lt!219511 (insertStrictlySorted!248 l!956 key!251 value!166))))

(declare-fun b!485155 () Bool)

(declare-fun tp!43591 () Bool)

(assert (=> b!485155 (= e!285638 (and tp_is_empty!13963 tp!43591))))

(assert (= (and start!43962 res!288964) b!485153))

(assert (= (and b!485153 res!288963) b!485154))

(get-info :version)

(assert (= (and start!43962 ((_ is Cons!9191) l!956)) b!485155))

(declare-fun m!465631 () Bool)

(assert (=> start!43962 m!465631))

(declare-fun m!465633 () Bool)

(assert (=> b!485153 m!465633))

(declare-fun m!465635 () Bool)

(assert (=> b!485154 m!465635))

(check-sat (not b!485153) (not b!485154) (not start!43962) (not b!485155) tp_is_empty!13963)
(check-sat)
