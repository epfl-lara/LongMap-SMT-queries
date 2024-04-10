; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1976 () Bool)

(assert start!1976)

(declare-fun b!13285 () Bool)

(assert (=> b!13285 true))

(declare-fun b!13282 () Bool)

(declare-fun res!10480 () Bool)

(declare-fun e!7963 () Bool)

(assert (=> b!13282 (=> (not res!10480) (not e!7963))))

(declare-datatypes ((B!478 0))(
  ( (B!479 (val!337 Int)) )
))
(declare-datatypes ((tuple2!474 0))(
  ( (tuple2!475 (_1!237 (_ BitVec 64)) (_2!237 B!478)) )
))
(declare-datatypes ((List!392 0))(
  ( (Nil!389) (Cons!388 (h!954 tuple2!474) (t!2788 List!392)) )
))
(declare-fun lt!3504 () List!392)

(declare-fun isEmpty!79 (List!392) Bool)

(assert (=> b!13282 (= res!10480 (not (isEmpty!79 lt!3504)))))

(declare-fun b!13283 () Bool)

(declare-fun res!10479 () Bool)

(assert (=> b!13283 (=> (not res!10479) (not e!7963))))

(declare-fun l!522 () List!392)

(assert (=> b!13283 (= res!10479 (not (isEmpty!79 l!522)))))

(declare-fun b!13284 () Bool)

(declare-fun e!7962 () Bool)

(declare-fun tp_is_empty!657 () Bool)

(declare-fun tp!2162 () Bool)

(assert (=> b!13284 (= e!7962 (and tp_is_empty!657 tp!2162))))

(declare-fun res!10483 () Bool)

(declare-fun e!7964 () Bool)

(assert (=> start!1976 (=> (not res!10483) (not e!7964))))

(declare-fun isStrictlySorted!79 (List!392) Bool)

(assert (=> start!1976 (= res!10483 (isStrictlySorted!79 l!522))))

(assert (=> start!1976 e!7964))

(assert (=> start!1976 e!7962))

(assert (=> start!1976 tp_is_empty!657))

(declare-fun res!10478 () Bool)

(assert (=> b!13285 (=> (not res!10478) (not e!7963))))

(declare-fun lambda!65 () Int)

(declare-fun forall!72 (List!392 Int) Bool)

(assert (=> b!13285 (= res!10478 (forall!72 lt!3504 lambda!65))))

(declare-fun b!13286 () Bool)

(declare-fun res!10482 () Bool)

(assert (=> b!13286 (=> (not res!10482) (not e!7964))))

(declare-fun value!159 () B!478)

(get-info :version)

(assert (=> b!13286 (= res!10482 (and ((_ is Cons!388) l!522) (= (_2!237 (h!954 l!522)) value!159)))))

(declare-fun b!13287 () Bool)

(assert (=> b!13287 (= e!7964 e!7963)))

(declare-fun res!10481 () Bool)

(assert (=> b!13287 (=> (not res!10481) (not e!7963))))

(assert (=> b!13287 (= res!10481 (isStrictlySorted!79 lt!3504))))

(declare-fun $colon$colon!13 (List!392 tuple2!474) List!392)

(declare-fun filterByValue!5 (List!392 B!478) List!392)

(assert (=> b!13287 (= lt!3504 ($colon$colon!13 (filterByValue!5 (t!2788 l!522) value!159) (h!954 l!522)))))

(declare-fun b!13288 () Bool)

(assert (=> b!13288 (= e!7963 (= l!522 Nil!389))))

(assert (= (and start!1976 res!10483) b!13286))

(assert (= (and b!13286 res!10482) b!13287))

(assert (= (and b!13287 res!10481) b!13285))

(assert (= (and b!13285 res!10478) b!13283))

(assert (= (and b!13283 res!10479) b!13282))

(assert (= (and b!13282 res!10480) b!13288))

(assert (= (and start!1976 ((_ is Cons!388) l!522)) b!13284))

(declare-fun m!9055 () Bool)

(assert (=> b!13287 m!9055))

(declare-fun m!9057 () Bool)

(assert (=> b!13287 m!9057))

(assert (=> b!13287 m!9057))

(declare-fun m!9059 () Bool)

(assert (=> b!13287 m!9059))

(declare-fun m!9061 () Bool)

(assert (=> b!13282 m!9061))

(declare-fun m!9063 () Bool)

(assert (=> b!13283 m!9063))

(declare-fun m!9065 () Bool)

(assert (=> b!13285 m!9065))

(declare-fun m!9067 () Bool)

(assert (=> start!1976 m!9067))

(check-sat (not start!1976) (not b!13282) (not b!13285) tp_is_empty!657 (not b!13283) (not b!13284) (not b!13287))
(check-sat)
