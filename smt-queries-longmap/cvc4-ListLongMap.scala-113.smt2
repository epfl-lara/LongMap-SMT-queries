; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1978 () Bool)

(assert start!1978)

(declare-fun b!13305 () Bool)

(assert (=> b!13305 true))

(declare-fun res!10500 () Bool)

(declare-fun e!7971 () Bool)

(assert (=> b!13305 (=> (not res!10500) (not e!7971))))

(declare-datatypes ((B!480 0))(
  ( (B!481 (val!338 Int)) )
))
(declare-datatypes ((tuple2!476 0))(
  ( (tuple2!477 (_1!238 (_ BitVec 64)) (_2!238 B!480)) )
))
(declare-datatypes ((List!393 0))(
  ( (Nil!390) (Cons!389 (h!955 tuple2!476) (t!2789 List!393)) )
))
(declare-fun lt!3507 () List!393)

(declare-fun lambda!68 () Int)

(declare-fun forall!73 (List!393 Int) Bool)

(assert (=> b!13305 (= res!10500 (forall!73 lt!3507 lambda!68))))

(declare-fun b!13306 () Bool)

(declare-fun res!10496 () Bool)

(assert (=> b!13306 (=> (not res!10496) (not e!7971))))

(declare-fun isEmpty!80 (List!393) Bool)

(assert (=> b!13306 (= res!10496 (not (isEmpty!80 lt!3507)))))

(declare-fun res!10499 () Bool)

(declare-fun e!7973 () Bool)

(assert (=> start!1978 (=> (not res!10499) (not e!7973))))

(declare-fun l!522 () List!393)

(declare-fun isStrictlySorted!80 (List!393) Bool)

(assert (=> start!1978 (= res!10499 (isStrictlySorted!80 l!522))))

(assert (=> start!1978 e!7973))

(declare-fun e!7972 () Bool)

(assert (=> start!1978 e!7972))

(declare-fun tp_is_empty!659 () Bool)

(assert (=> start!1978 tp_is_empty!659))

(declare-fun b!13307 () Bool)

(assert (=> b!13307 (= e!7973 e!7971)))

(declare-fun res!10497 () Bool)

(assert (=> b!13307 (=> (not res!10497) (not e!7971))))

(assert (=> b!13307 (= res!10497 (isStrictlySorted!80 lt!3507))))

(declare-fun value!159 () B!480)

(declare-fun $colon$colon!14 (List!393 tuple2!476) List!393)

(declare-fun filterByValue!6 (List!393 B!480) List!393)

(assert (=> b!13307 (= lt!3507 ($colon$colon!14 (filterByValue!6 (t!2789 l!522) value!159) (h!955 l!522)))))

(declare-fun b!13308 () Bool)

(assert (=> b!13308 (= e!7971 (= l!522 Nil!390))))

(declare-fun b!13309 () Bool)

(declare-fun res!10498 () Bool)

(assert (=> b!13309 (=> (not res!10498) (not e!7973))))

(assert (=> b!13309 (= res!10498 (and (is-Cons!389 l!522) (= (_2!238 (h!955 l!522)) value!159)))))

(declare-fun b!13310 () Bool)

(declare-fun tp!2165 () Bool)

(assert (=> b!13310 (= e!7972 (and tp_is_empty!659 tp!2165))))

(declare-fun b!13311 () Bool)

(declare-fun res!10501 () Bool)

(assert (=> b!13311 (=> (not res!10501) (not e!7971))))

(assert (=> b!13311 (= res!10501 (not (isEmpty!80 l!522)))))

(assert (= (and start!1978 res!10499) b!13309))

(assert (= (and b!13309 res!10498) b!13307))

(assert (= (and b!13307 res!10497) b!13305))

(assert (= (and b!13305 res!10500) b!13311))

(assert (= (and b!13311 res!10501) b!13306))

(assert (= (and b!13306 res!10496) b!13308))

(assert (= (and start!1978 (is-Cons!389 l!522)) b!13310))

(declare-fun m!9069 () Bool)

(assert (=> b!13305 m!9069))

(declare-fun m!9071 () Bool)

(assert (=> b!13311 m!9071))

(declare-fun m!9073 () Bool)

(assert (=> b!13307 m!9073))

(declare-fun m!9075 () Bool)

(assert (=> b!13307 m!9075))

(assert (=> b!13307 m!9075))

(declare-fun m!9077 () Bool)

(assert (=> b!13307 m!9077))

(declare-fun m!9079 () Bool)

(assert (=> start!1978 m!9079))

(declare-fun m!9081 () Bool)

(assert (=> b!13306 m!9081))

(push 1)

