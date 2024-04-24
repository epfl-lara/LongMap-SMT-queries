; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43770 () Bool)

(assert start!43770)

(declare-fun res!288336 () Bool)

(declare-fun e!284808 () Bool)

(assert (=> start!43770 (=> (not res!288336) (not e!284808))))

(declare-datatypes ((B!1112 0))(
  ( (B!1113 (val!7008 Int)) )
))
(declare-datatypes ((tuple2!9132 0))(
  ( (tuple2!9133 (_1!4577 (_ BitVec 64)) (_2!4577 B!1112)) )
))
(declare-datatypes ((List!9174 0))(
  ( (Nil!9171) (Cons!9170 (h!10026 tuple2!9132) (t!15388 List!9174)) )
))
(declare-fun l!956 () List!9174)

(declare-fun isStrictlySorted!399 (List!9174) Bool)

(assert (=> start!43770 (= res!288336 (isStrictlySorted!399 l!956))))

(assert (=> start!43770 e!284808))

(declare-fun e!284807 () Bool)

(assert (=> start!43770 e!284807))

(assert (=> start!43770 true))

(declare-fun tp_is_empty!13921 () Bool)

(assert (=> start!43770 tp_is_empty!13921))

(declare-fun b!483884 () Bool)

(declare-fun res!288337 () Bool)

(assert (=> b!483884 (=> (not res!288337) (not e!284808))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!374 (List!9174 (_ BitVec 64)) Bool)

(assert (=> b!483884 (= res!288337 (not (containsKey!374 l!956 key!251)))))

(declare-fun b!483885 () Bool)

(assert (=> b!483885 (= e!284808 false)))

(declare-fun value!166 () B!1112)

(declare-fun lt!219337 () List!9174)

(declare-fun insertStrictlySorted!230 (List!9174 (_ BitVec 64) B!1112) List!9174)

(assert (=> b!483885 (= lt!219337 (insertStrictlySorted!230 l!956 key!251 value!166))))

(declare-fun b!483886 () Bool)

(declare-fun tp!43471 () Bool)

(assert (=> b!483886 (= e!284807 (and tp_is_empty!13921 tp!43471))))

(assert (= (and start!43770 res!288336) b!483884))

(assert (= (and b!483884 res!288337) b!483885))

(get-info :version)

(assert (= (and start!43770 ((_ is Cons!9170) l!956)) b!483886))

(declare-fun m!465007 () Bool)

(assert (=> start!43770 m!465007))

(declare-fun m!465009 () Bool)

(assert (=> b!483884 m!465009))

(declare-fun m!465011 () Bool)

(assert (=> b!483885 m!465011))

(check-sat (not b!483886) tp_is_empty!13921 (not b!483884) (not b!483885) (not start!43770))
(check-sat)
