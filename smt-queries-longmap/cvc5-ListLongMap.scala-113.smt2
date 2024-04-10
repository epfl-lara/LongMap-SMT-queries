; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1974 () Bool)

(assert start!1974)

(declare-fun b!13265 () Bool)

(assert (=> b!13265 true))

(declare-fun b!13259 () Bool)

(declare-fun res!10462 () Bool)

(declare-fun e!7953 () Bool)

(assert (=> b!13259 (=> (not res!10462) (not e!7953))))

(declare-datatypes ((B!476 0))(
  ( (B!477 (val!336 Int)) )
))
(declare-datatypes ((tuple2!472 0))(
  ( (tuple2!473 (_1!236 (_ BitVec 64)) (_2!236 B!476)) )
))
(declare-datatypes ((List!391 0))(
  ( (Nil!388) (Cons!387 (h!953 tuple2!472) (t!2787 List!391)) )
))
(declare-fun l!522 () List!391)

(declare-fun value!159 () B!476)

(assert (=> b!13259 (= res!10462 (and (is-Cons!387 l!522) (= (_2!236 (h!953 l!522)) value!159)))))

(declare-fun b!13260 () Bool)

(declare-fun res!10464 () Bool)

(declare-fun e!7954 () Bool)

(assert (=> b!13260 (=> (not res!10464) (not e!7954))))

(declare-fun isEmpty!78 (List!391) Bool)

(assert (=> b!13260 (= res!10464 (not (isEmpty!78 l!522)))))

(declare-fun b!13262 () Bool)

(declare-fun e!7955 () Bool)

(declare-fun tp_is_empty!655 () Bool)

(declare-fun tp!2159 () Bool)

(assert (=> b!13262 (= e!7955 (and tp_is_empty!655 tp!2159))))

(declare-fun b!13263 () Bool)

(assert (=> b!13263 (= e!7954 (= l!522 Nil!388))))

(declare-fun b!13264 () Bool)

(assert (=> b!13264 (= e!7953 e!7954)))

(declare-fun res!10461 () Bool)

(assert (=> b!13264 (=> (not res!10461) (not e!7954))))

(declare-fun lt!3501 () List!391)

(declare-fun isStrictlySorted!78 (List!391) Bool)

(assert (=> b!13264 (= res!10461 (isStrictlySorted!78 lt!3501))))

(declare-fun $colon$colon!12 (List!391 tuple2!472) List!391)

(declare-fun filterByValue!4 (List!391 B!476) List!391)

(assert (=> b!13264 (= lt!3501 ($colon$colon!12 (filterByValue!4 (t!2787 l!522) value!159) (h!953 l!522)))))

(declare-fun res!10460 () Bool)

(assert (=> b!13265 (=> (not res!10460) (not e!7954))))

(declare-fun lambda!62 () Int)

(declare-fun forall!71 (List!391 Int) Bool)

(assert (=> b!13265 (= res!10460 (forall!71 lt!3501 lambda!62))))

(declare-fun res!10463 () Bool)

(assert (=> start!1974 (=> (not res!10463) (not e!7953))))

(assert (=> start!1974 (= res!10463 (isStrictlySorted!78 l!522))))

(assert (=> start!1974 e!7953))

(assert (=> start!1974 e!7955))

(assert (=> start!1974 tp_is_empty!655))

(declare-fun b!13261 () Bool)

(declare-fun res!10465 () Bool)

(assert (=> b!13261 (=> (not res!10465) (not e!7954))))

(assert (=> b!13261 (= res!10465 (not (isEmpty!78 lt!3501)))))

(assert (= (and start!1974 res!10463) b!13259))

(assert (= (and b!13259 res!10462) b!13264))

(assert (= (and b!13264 res!10461) b!13265))

(assert (= (and b!13265 res!10460) b!13260))

(assert (= (and b!13260 res!10464) b!13261))

(assert (= (and b!13261 res!10465) b!13263))

(assert (= (and start!1974 (is-Cons!387 l!522)) b!13262))

(declare-fun m!9041 () Bool)

(assert (=> b!13260 m!9041))

(declare-fun m!9043 () Bool)

(assert (=> b!13264 m!9043))

(declare-fun m!9045 () Bool)

(assert (=> b!13264 m!9045))

(assert (=> b!13264 m!9045))

(declare-fun m!9047 () Bool)

(assert (=> b!13264 m!9047))

(declare-fun m!9049 () Bool)

(assert (=> start!1974 m!9049))

(declare-fun m!9051 () Bool)

(assert (=> b!13261 m!9051))

(declare-fun m!9053 () Bool)

(assert (=> b!13265 m!9053))

(push 1)

