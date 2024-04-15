; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43770 () Bool)

(assert start!43770)

(declare-fun res!288214 () Bool)

(declare-fun e!284672 () Bool)

(assert (=> start!43770 (=> (not res!288214) (not e!284672))))

(declare-datatypes ((B!1112 0))(
  ( (B!1113 (val!7008 Int)) )
))
(declare-datatypes ((tuple2!9268 0))(
  ( (tuple2!9269 (_1!4645 (_ BitVec 64)) (_2!4645 B!1112)) )
))
(declare-datatypes ((List!9310 0))(
  ( (Nil!9307) (Cons!9306 (h!10162 tuple2!9268) (t!15523 List!9310)) )
))
(declare-fun l!956 () List!9310)

(declare-fun isStrictlySorted!407 (List!9310) Bool)

(assert (=> start!43770 (= res!288214 (isStrictlySorted!407 l!956))))

(assert (=> start!43770 e!284672))

(declare-fun e!284673 () Bool)

(assert (=> start!43770 e!284673))

(assert (=> start!43770 true))

(declare-fun tp_is_empty!13921 () Bool)

(assert (=> start!43770 tp_is_empty!13921))

(declare-fun b!483674 () Bool)

(declare-fun res!288215 () Bool)

(assert (=> b!483674 (=> (not res!288215) (not e!284672))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!372 (List!9310 (_ BitVec 64)) Bool)

(assert (=> b!483674 (= res!288215 (not (containsKey!372 l!956 key!251)))))

(declare-fun b!483675 () Bool)

(assert (=> b!483675 (= e!284672 false)))

(declare-fun value!166 () B!1112)

(declare-fun lt!219091 () List!9310)

(declare-fun insertStrictlySorted!230 (List!9310 (_ BitVec 64) B!1112) List!9310)

(assert (=> b!483675 (= lt!219091 (insertStrictlySorted!230 l!956 key!251 value!166))))

(declare-fun b!483676 () Bool)

(declare-fun tp!43471 () Bool)

(assert (=> b!483676 (= e!284673 (and tp_is_empty!13921 tp!43471))))

(assert (= (and start!43770 res!288214) b!483674))

(assert (= (and b!483674 res!288215) b!483675))

(get-info :version)

(assert (= (and start!43770 ((_ is Cons!9306) l!956)) b!483676))

(declare-fun m!464091 () Bool)

(assert (=> start!43770 m!464091))

(declare-fun m!464093 () Bool)

(assert (=> b!483674 m!464093))

(declare-fun m!464095 () Bool)

(assert (=> b!483675 m!464095))

(check-sat (not b!483676) tp_is_empty!13921 (not b!483674) (not b!483675) (not start!43770))
(check-sat)
