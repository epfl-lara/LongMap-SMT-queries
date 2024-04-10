; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2038 () Bool)

(assert start!2038)

(declare-fun b!13753 () Bool)

(assert (=> b!13753 true))

(declare-fun res!10792 () Bool)

(declare-fun e!8210 () Bool)

(assert (=> start!2038 (=> (not res!10792) (not e!8210))))

(declare-datatypes ((B!510 0))(
  ( (B!511 (val!353 Int)) )
))
(declare-datatypes ((tuple2!506 0))(
  ( (tuple2!507 (_1!253 (_ BitVec 64)) (_2!253 B!510)) )
))
(declare-datatypes ((List!408 0))(
  ( (Nil!405) (Cons!404 (h!970 tuple2!506) (t!2804 List!408)) )
))
(declare-fun l!522 () List!408)

(declare-fun isStrictlySorted!95 (List!408) Bool)

(assert (=> start!2038 (= res!10792 (isStrictlySorted!95 l!522))))

(assert (=> start!2038 e!8210))

(declare-fun e!8209 () Bool)

(assert (=> start!2038 e!8209))

(declare-fun tp_is_empty!689 () Bool)

(assert (=> start!2038 tp_is_empty!689))

(declare-fun b!13751 () Bool)

(declare-fun tp!2228 () Bool)

(assert (=> b!13751 (= e!8209 (and tp_is_empty!689 tp!2228))))

(declare-fun b!13752 () Bool)

(declare-fun res!10791 () Bool)

(assert (=> b!13752 (=> (not res!10791) (not e!8210))))

(declare-fun value!159 () B!510)

(assert (=> b!13752 (= res!10791 (and (or (not (is-Cons!404 l!522)) (not (= (_2!253 (h!970 l!522)) value!159))) (or (not (is-Cons!404 l!522)) (= (_2!253 (h!970 l!522)) value!159)) (is-Nil!405 l!522)))))

(declare-fun res!10789 () Bool)

(assert (=> b!13753 (=> (not res!10789) (not e!8210))))

(declare-fun lambda!113 () Int)

(declare-fun forall!85 (List!408 Int) Bool)

(assert (=> b!13753 (= res!10789 (forall!85 Nil!405 lambda!113))))

(declare-fun b!13754 () Bool)

(declare-fun res!10790 () Bool)

(assert (=> b!13754 (=> (not res!10790) (not e!8210))))

(declare-fun isEmpty!92 (List!408) Bool)

(assert (=> b!13754 (= res!10790 (not (isEmpty!92 l!522)))))

(declare-fun b!13755 () Bool)

(assert (=> b!13755 (= e!8210 false)))

(assert (= (and start!2038 res!10792) b!13752))

(assert (= (and b!13752 res!10791) b!13753))

(assert (= (and b!13753 res!10789) b!13754))

(assert (= (and b!13754 res!10790) b!13755))

(assert (= (and start!2038 (is-Cons!404 l!522)) b!13751))

(declare-fun m!9275 () Bool)

(assert (=> start!2038 m!9275))

(declare-fun m!9277 () Bool)

(assert (=> b!13753 m!9277))

(declare-fun m!9279 () Bool)

(assert (=> b!13754 m!9279))

(push 1)

(assert (not b!13754))

(assert tp_is_empty!689)

(assert (not start!2038))

(assert (not b!13753))

(assert (not b!13751))

(check-sat)

