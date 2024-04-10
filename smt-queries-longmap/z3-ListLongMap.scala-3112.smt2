; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43766 () Bool)

(assert start!43766)

(declare-fun res!288269 () Bool)

(declare-fun e!284789 () Bool)

(assert (=> start!43766 (=> (not res!288269) (not e!284789))))

(declare-datatypes ((B!1096 0))(
  ( (B!1097 (val!7000 Int)) )
))
(declare-datatypes ((tuple2!9202 0))(
  ( (tuple2!9203 (_1!4612 (_ BitVec 64)) (_2!4612 B!1096)) )
))
(declare-datatypes ((List!9264 0))(
  ( (Nil!9261) (Cons!9260 (h!10116 tuple2!9202) (t!15486 List!9264)) )
))
(declare-fun l!956 () List!9264)

(declare-fun isStrictlySorted!403 (List!9264) Bool)

(assert (=> start!43766 (= res!288269 (isStrictlySorted!403 l!956))))

(assert (=> start!43766 e!284789))

(declare-fun e!284790 () Bool)

(assert (=> start!43766 e!284790))

(assert (=> start!43766 true))

(declare-fun tp_is_empty!13905 () Bool)

(assert (=> start!43766 tp_is_empty!13905))

(declare-fun b!483846 () Bool)

(declare-fun res!288268 () Bool)

(assert (=> b!483846 (=> (not res!288268) (not e!284789))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!366 (List!9264 (_ BitVec 64)) Bool)

(assert (=> b!483846 (= res!288268 (not (containsKey!366 l!956 key!251)))))

(declare-fun b!483847 () Bool)

(assert (=> b!483847 (= e!284789 false)))

(declare-fun value!166 () B!1096)

(declare-fun lt!219292 () List!9264)

(declare-fun insertStrictlySorted!221 (List!9264 (_ BitVec 64) B!1096) List!9264)

(assert (=> b!483847 (= lt!219292 (insertStrictlySorted!221 l!956 key!251 value!166))))

(declare-fun b!483848 () Bool)

(declare-fun tp!43447 () Bool)

(assert (=> b!483848 (= e!284790 (and tp_is_empty!13905 tp!43447))))

(assert (= (and start!43766 res!288269) b!483846))

(assert (= (and b!483846 res!288268) b!483847))

(get-info :version)

(assert (= (and start!43766 ((_ is Cons!9260) l!956)) b!483848))

(declare-fun m!464739 () Bool)

(assert (=> start!43766 m!464739))

(declare-fun m!464741 () Bool)

(assert (=> b!483846 m!464741))

(declare-fun m!464743 () Bool)

(assert (=> b!483847 m!464743))

(check-sat (not b!483846) (not b!483848) (not b!483847) tp_is_empty!13905 (not start!43766))
(check-sat)
