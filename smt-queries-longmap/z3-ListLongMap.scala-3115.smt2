; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43784 () Bool)

(assert start!43784)

(declare-fun res!288350 () Bool)

(declare-fun e!284853 () Bool)

(assert (=> start!43784 (=> (not res!288350) (not e!284853))))

(declare-datatypes ((B!1114 0))(
  ( (B!1115 (val!7009 Int)) )
))
(declare-datatypes ((tuple2!9220 0))(
  ( (tuple2!9221 (_1!4621 (_ BitVec 64)) (_2!4621 B!1114)) )
))
(declare-datatypes ((List!9273 0))(
  ( (Nil!9270) (Cons!9269 (h!10125 tuple2!9220) (t!15495 List!9273)) )
))
(declare-fun l!956 () List!9273)

(declare-fun isStrictlySorted!412 (List!9273) Bool)

(assert (=> start!43784 (= res!288350 (isStrictlySorted!412 l!956))))

(assert (=> start!43784 e!284853))

(declare-fun e!284852 () Bool)

(assert (=> start!43784 e!284852))

(assert (=> start!43784 true))

(declare-fun tp_is_empty!13923 () Bool)

(assert (=> start!43784 tp_is_empty!13923))

(declare-fun b!483954 () Bool)

(declare-fun res!288349 () Bool)

(assert (=> b!483954 (=> (not res!288349) (not e!284853))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!375 (List!9273 (_ BitVec 64)) Bool)

(assert (=> b!483954 (= res!288349 (not (containsKey!375 l!956 key!251)))))

(declare-fun b!483955 () Bool)

(assert (=> b!483955 (= e!284853 false)))

(declare-fun value!166 () B!1114)

(declare-fun lt!219328 () List!9273)

(declare-fun insertStrictlySorted!230 (List!9273 (_ BitVec 64) B!1114) List!9273)

(assert (=> b!483955 (= lt!219328 (insertStrictlySorted!230 l!956 key!251 value!166))))

(declare-fun b!483956 () Bool)

(declare-fun tp!43474 () Bool)

(assert (=> b!483956 (= e!284852 (and tp_is_empty!13923 tp!43474))))

(assert (= (and start!43784 res!288350) b!483954))

(assert (= (and b!483954 res!288349) b!483955))

(get-info :version)

(assert (= (and start!43784 ((_ is Cons!9269) l!956)) b!483956))

(declare-fun m!464829 () Bool)

(assert (=> start!43784 m!464829))

(declare-fun m!464831 () Bool)

(assert (=> b!483954 m!464831))

(declare-fun m!464833 () Bool)

(assert (=> b!483955 m!464833))

(check-sat (not start!43784) (not b!483956) (not b!483954) tp_is_empty!13923 (not b!483955))
(check-sat)
