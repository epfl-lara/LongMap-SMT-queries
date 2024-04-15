; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1974 () Bool)

(assert start!1974)

(declare-fun b!13264 () Bool)

(assert (=> b!13264 true))

(declare-fun b!13259 () Bool)

(declare-fun e!7954 () Bool)

(declare-fun e!7955 () Bool)

(assert (=> b!13259 (= e!7954 e!7955)))

(declare-fun res!10462 () Bool)

(assert (=> b!13259 (=> (not res!10462) (not e!7955))))

(declare-datatypes ((B!476 0))(
  ( (B!477 (val!336 Int)) )
))
(declare-datatypes ((tuple2!468 0))(
  ( (tuple2!469 (_1!234 (_ BitVec 64)) (_2!234 B!476)) )
))
(declare-datatypes ((List!387 0))(
  ( (Nil!384) (Cons!383 (h!949 tuple2!468) (t!2783 List!387)) )
))
(declare-fun lt!3501 () List!387)

(declare-fun isStrictlySorted!75 (List!387) Bool)

(assert (=> b!13259 (= res!10462 (isStrictlySorted!75 lt!3501))))

(declare-fun l!522 () List!387)

(declare-fun value!159 () B!476)

(declare-fun $colon$colon!12 (List!387 tuple2!468) List!387)

(declare-fun filterByValue!4 (List!387 B!476) List!387)

(assert (=> b!13259 (= lt!3501 ($colon$colon!12 (filterByValue!4 (t!2783 l!522) value!159) (h!949 l!522)))))

(declare-fun b!13260 () Bool)

(declare-fun e!7953 () Bool)

(declare-fun tp_is_empty!655 () Bool)

(declare-fun tp!2159 () Bool)

(assert (=> b!13260 (= e!7953 (and tp_is_empty!655 tp!2159))))

(declare-fun res!10464 () Bool)

(assert (=> start!1974 (=> (not res!10464) (not e!7954))))

(assert (=> start!1974 (= res!10464 (isStrictlySorted!75 l!522))))

(assert (=> start!1974 e!7954))

(assert (=> start!1974 e!7953))

(assert (=> start!1974 tp_is_empty!655))

(declare-fun b!13261 () Bool)

(declare-fun res!10460 () Bool)

(assert (=> b!13261 (=> (not res!10460) (not e!7954))))

(get-info :version)

(assert (=> b!13261 (= res!10460 (and ((_ is Cons!383) l!522) (= (_2!234 (h!949 l!522)) value!159)))))

(declare-fun b!13262 () Bool)

(assert (=> b!13262 (= e!7955 (= l!522 Nil!384))))

(declare-fun b!13263 () Bool)

(declare-fun res!10463 () Bool)

(assert (=> b!13263 (=> (not res!10463) (not e!7955))))

(declare-fun isEmpty!78 (List!387) Bool)

(assert (=> b!13263 (= res!10463 (not (isEmpty!78 l!522)))))

(declare-fun res!10461 () Bool)

(assert (=> b!13264 (=> (not res!10461) (not e!7955))))

(declare-fun lambda!62 () Int)

(declare-fun forall!71 (List!387 Int) Bool)

(assert (=> b!13264 (= res!10461 (forall!71 lt!3501 lambda!62))))

(declare-fun b!13265 () Bool)

(declare-fun res!10465 () Bool)

(assert (=> b!13265 (=> (not res!10465) (not e!7955))))

(assert (=> b!13265 (= res!10465 (not (isEmpty!78 lt!3501)))))

(assert (= (and start!1974 res!10464) b!13261))

(assert (= (and b!13261 res!10460) b!13259))

(assert (= (and b!13259 res!10462) b!13264))

(assert (= (and b!13264 res!10461) b!13263))

(assert (= (and b!13263 res!10463) b!13265))

(assert (= (and b!13265 res!10465) b!13262))

(assert (= (and start!1974 ((_ is Cons!383) l!522)) b!13260))

(declare-fun m!9033 () Bool)

(assert (=> b!13265 m!9033))

(declare-fun m!9035 () Bool)

(assert (=> b!13259 m!9035))

(declare-fun m!9037 () Bool)

(assert (=> b!13259 m!9037))

(assert (=> b!13259 m!9037))

(declare-fun m!9039 () Bool)

(assert (=> b!13259 m!9039))

(declare-fun m!9041 () Bool)

(assert (=> start!1974 m!9041))

(declare-fun m!9043 () Bool)

(assert (=> b!13264 m!9043))

(declare-fun m!9045 () Bool)

(assert (=> b!13263 m!9045))

(check-sat (not b!13264) (not b!13265) (not b!13259) (not start!1974) (not b!13260) tp_is_empty!655 (not b!13263))
(check-sat)
