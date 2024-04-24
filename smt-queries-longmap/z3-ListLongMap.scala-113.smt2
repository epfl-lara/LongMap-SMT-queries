; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1974 () Bool)

(assert start!1974)

(declare-fun b!13254 () Bool)

(assert (=> b!13254 true))

(declare-fun b!13253 () Bool)

(declare-fun e!7951 () Bool)

(declare-datatypes ((B!476 0))(
  ( (B!477 (val!336 Int)) )
))
(declare-datatypes ((tuple2!468 0))(
  ( (tuple2!469 (_1!234 (_ BitVec 64)) (_2!234 B!476)) )
))
(declare-datatypes ((List!387 0))(
  ( (Nil!384) (Cons!383 (h!949 tuple2!468) (t!2783 List!387)) )
))
(declare-fun l!522 () List!387)

(assert (=> b!13253 (= e!7951 (= l!522 Nil!384))))

(declare-fun res!10463 () Bool)

(declare-fun e!7949 () Bool)

(assert (=> start!1974 (=> (not res!10463) (not e!7949))))

(declare-fun isStrictlySorted!72 (List!387) Bool)

(assert (=> start!1974 (= res!10463 (isStrictlySorted!72 l!522))))

(assert (=> start!1974 e!7949))

(declare-fun e!7950 () Bool)

(assert (=> start!1974 e!7950))

(declare-fun tp_is_empty!655 () Bool)

(assert (=> start!1974 tp_is_empty!655))

(declare-fun res!10461 () Bool)

(assert (=> b!13254 (=> (not res!10461) (not e!7951))))

(declare-fun lt!3501 () List!387)

(declare-fun lambda!62 () Int)

(declare-fun forall!71 (List!387 Int) Bool)

(assert (=> b!13254 (= res!10461 (forall!71 lt!3501 lambda!62))))

(declare-fun b!13255 () Bool)

(declare-fun res!10459 () Bool)

(assert (=> b!13255 (=> (not res!10459) (not e!7951))))

(declare-fun isEmpty!78 (List!387) Bool)

(assert (=> b!13255 (= res!10459 (not (isEmpty!78 lt!3501)))))

(declare-fun b!13256 () Bool)

(declare-fun res!10458 () Bool)

(assert (=> b!13256 (=> (not res!10458) (not e!7951))))

(assert (=> b!13256 (= res!10458 (not (isEmpty!78 l!522)))))

(declare-fun b!13257 () Bool)

(declare-fun res!10462 () Bool)

(assert (=> b!13257 (=> (not res!10462) (not e!7949))))

(declare-fun value!159 () B!476)

(get-info :version)

(assert (=> b!13257 (= res!10462 (and ((_ is Cons!383) l!522) (= (_2!234 (h!949 l!522)) value!159)))))

(declare-fun b!13258 () Bool)

(assert (=> b!13258 (= e!7949 e!7951)))

(declare-fun res!10460 () Bool)

(assert (=> b!13258 (=> (not res!10460) (not e!7951))))

(assert (=> b!13258 (= res!10460 (isStrictlySorted!72 lt!3501))))

(declare-fun $colon$colon!12 (List!387 tuple2!468) List!387)

(declare-fun filterByValue!4 (List!387 B!476) List!387)

(assert (=> b!13258 (= lt!3501 ($colon$colon!12 (filterByValue!4 (t!2783 l!522) value!159) (h!949 l!522)))))

(declare-fun b!13259 () Bool)

(declare-fun tp!2159 () Bool)

(assert (=> b!13259 (= e!7950 (and tp_is_empty!655 tp!2159))))

(assert (= (and start!1974 res!10463) b!13257))

(assert (= (and b!13257 res!10462) b!13258))

(assert (= (and b!13258 res!10460) b!13254))

(assert (= (and b!13254 res!10461) b!13256))

(assert (= (and b!13256 res!10458) b!13255))

(assert (= (and b!13255 res!10459) b!13253))

(assert (= (and start!1974 ((_ is Cons!383) l!522)) b!13259))

(declare-fun m!9033 () Bool)

(assert (=> b!13254 m!9033))

(declare-fun m!9035 () Bool)

(assert (=> b!13258 m!9035))

(declare-fun m!9037 () Bool)

(assert (=> b!13258 m!9037))

(assert (=> b!13258 m!9037))

(declare-fun m!9039 () Bool)

(assert (=> b!13258 m!9039))

(declare-fun m!9041 () Bool)

(assert (=> start!1974 m!9041))

(declare-fun m!9043 () Bool)

(assert (=> b!13255 m!9043))

(declare-fun m!9045 () Bool)

(assert (=> b!13256 m!9045))

(check-sat (not b!13254) (not b!13259) (not b!13255) (not start!1974) tp_is_empty!655 (not b!13258) (not b!13256))
(check-sat)
