; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43778 () Bool)

(assert start!43778)

(declare-fun res!288331 () Bool)

(declare-fun e!284835 () Bool)

(assert (=> start!43778 (=> (not res!288331) (not e!284835))))

(declare-datatypes ((B!1108 0))(
  ( (B!1109 (val!7006 Int)) )
))
(declare-datatypes ((tuple2!9214 0))(
  ( (tuple2!9215 (_1!4618 (_ BitVec 64)) (_2!4618 B!1108)) )
))
(declare-datatypes ((List!9270 0))(
  ( (Nil!9267) (Cons!9266 (h!10122 tuple2!9214) (t!15492 List!9270)) )
))
(declare-fun l!956 () List!9270)

(declare-fun isStrictlySorted!409 (List!9270) Bool)

(assert (=> start!43778 (= res!288331 (isStrictlySorted!409 l!956))))

(assert (=> start!43778 e!284835))

(declare-fun e!284834 () Bool)

(assert (=> start!43778 e!284834))

(assert (=> start!43778 true))

(declare-fun tp_is_empty!13917 () Bool)

(assert (=> start!43778 tp_is_empty!13917))

(declare-fun b!483927 () Bool)

(declare-fun res!288332 () Bool)

(assert (=> b!483927 (=> (not res!288332) (not e!284835))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!372 (List!9270 (_ BitVec 64)) Bool)

(assert (=> b!483927 (= res!288332 (not (containsKey!372 l!956 key!251)))))

(declare-fun b!483928 () Bool)

(assert (=> b!483928 (= e!284835 false)))

(declare-fun value!166 () B!1108)

(declare-fun lt!219319 () List!9270)

(declare-fun insertStrictlySorted!227 (List!9270 (_ BitVec 64) B!1108) List!9270)

(assert (=> b!483928 (= lt!219319 (insertStrictlySorted!227 l!956 key!251 value!166))))

(declare-fun b!483929 () Bool)

(declare-fun tp!43465 () Bool)

(assert (=> b!483929 (= e!284834 (and tp_is_empty!13917 tp!43465))))

(assert (= (and start!43778 res!288331) b!483927))

(assert (= (and b!483927 res!288332) b!483928))

(get-info :version)

(assert (= (and start!43778 ((_ is Cons!9266) l!956)) b!483929))

(declare-fun m!464811 () Bool)

(assert (=> start!43778 m!464811))

(declare-fun m!464813 () Bool)

(assert (=> b!483927 m!464813))

(declare-fun m!464815 () Bool)

(assert (=> b!483928 m!464815))

(check-sat (not start!43778) (not b!483927) (not b!483928) (not b!483929) tp_is_empty!13917)
(check-sat)
