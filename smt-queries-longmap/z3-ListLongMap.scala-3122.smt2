; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43962 () Bool)

(assert start!43962)

(declare-fun res!288841 () Bool)

(declare-fun e!285504 () Bool)

(assert (=> start!43962 (=> (not res!288841) (not e!285504))))

(declare-datatypes ((B!1154 0))(
  ( (B!1155 (val!7029 Int)) )
))
(declare-datatypes ((tuple2!9310 0))(
  ( (tuple2!9311 (_1!4666 (_ BitVec 64)) (_2!4666 B!1154)) )
))
(declare-datatypes ((List!9331 0))(
  ( (Nil!9328) (Cons!9327 (h!10183 tuple2!9310) (t!15547 List!9331)) )
))
(declare-fun l!956 () List!9331)

(declare-fun isStrictlySorted!428 (List!9331) Bool)

(assert (=> start!43962 (= res!288841 (isStrictlySorted!428 l!956))))

(assert (=> start!43962 e!285504))

(declare-fun e!285503 () Bool)

(assert (=> start!43962 e!285503))

(assert (=> start!43962 true))

(declare-fun tp_is_empty!13963 () Bool)

(assert (=> start!43962 tp_is_empty!13963))

(declare-fun b!484943 () Bool)

(declare-fun res!288842 () Bool)

(assert (=> b!484943 (=> (not res!288842) (not e!285504))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!393 (List!9331 (_ BitVec 64)) Bool)

(assert (=> b!484943 (= res!288842 (not (containsKey!393 l!956 key!251)))))

(declare-fun b!484944 () Bool)

(assert (=> b!484944 (= e!285504 false)))

(declare-fun value!166 () B!1154)

(declare-fun lt!219265 () List!9331)

(declare-fun insertStrictlySorted!248 (List!9331 (_ BitVec 64) B!1154) List!9331)

(assert (=> b!484944 (= lt!219265 (insertStrictlySorted!248 l!956 key!251 value!166))))

(declare-fun b!484945 () Bool)

(declare-fun tp!43591 () Bool)

(assert (=> b!484945 (= e!285503 (and tp_is_empty!13963 tp!43591))))

(assert (= (and start!43962 res!288841) b!484943))

(assert (= (and b!484943 res!288842) b!484944))

(get-info :version)

(assert (= (and start!43962 ((_ is Cons!9327) l!956)) b!484945))

(declare-fun m!464715 () Bool)

(assert (=> start!43962 m!464715))

(declare-fun m!464717 () Bool)

(assert (=> b!484943 m!464717))

(declare-fun m!464719 () Bool)

(assert (=> b!484944 m!464719))

(check-sat (not b!484945) (not start!43962) (not b!484943) (not b!484944) tp_is_empty!13963)
(check-sat)
