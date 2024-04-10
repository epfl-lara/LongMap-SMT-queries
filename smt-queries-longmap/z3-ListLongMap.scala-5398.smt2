; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72018 () Bool)

(assert start!72018)

(declare-fun res!569038 () Bool)

(declare-fun e!466638 () Bool)

(assert (=> start!72018 (=> (not res!569038) (not e!466638))))

(declare-datatypes ((B!1192 0))(
  ( (B!1193 (val!7678 Int)) )
))
(declare-datatypes ((tuple2!10216 0))(
  ( (tuple2!10217 (_1!5119 (_ BitVec 64)) (_2!5119 B!1192)) )
))
(declare-datatypes ((List!15983 0))(
  ( (Nil!15980) (Cons!15979 (h!17110 tuple2!10216) (t!22354 List!15983)) )
))
(declare-fun l!390 () List!15983)

(declare-fun isStrictlySorted!453 (List!15983) Bool)

(assert (=> start!72018 (= res!569038 (isStrictlySorted!453 l!390))))

(assert (=> start!72018 e!466638))

(declare-fun e!466637 () Bool)

(assert (=> start!72018 e!466637))

(declare-fun b!836406 () Bool)

(declare-fun res!569039 () Bool)

(assert (=> b!836406 (=> (not res!569039) (not e!466638))))

(get-info :version)

(assert (=> b!836406 (= res!569039 ((_ is Cons!15979) l!390))))

(declare-fun b!836407 () Bool)

(declare-fun ListPrimitiveSize!71 (List!15983) Int)

(assert (=> b!836407 (= e!466638 (>= (ListPrimitiveSize!71 (t!22354 l!390)) (ListPrimitiveSize!71 l!390)))))

(declare-fun b!836408 () Bool)

(declare-fun tp_is_empty!15261 () Bool)

(declare-fun tp!47444 () Bool)

(assert (=> b!836408 (= e!466637 (and tp_is_empty!15261 tp!47444))))

(assert (= (and start!72018 res!569038) b!836406))

(assert (= (and b!836406 res!569039) b!836407))

(assert (= (and start!72018 ((_ is Cons!15979) l!390)) b!836408))

(declare-fun m!781687 () Bool)

(assert (=> start!72018 m!781687))

(declare-fun m!781689 () Bool)

(assert (=> b!836407 m!781689))

(declare-fun m!781691 () Bool)

(assert (=> b!836407 m!781691))

(check-sat (not start!72018) (not b!836407) (not b!836408) tp_is_empty!15261)
(check-sat)
(get-model)

(declare-fun d!107587 () Bool)

(declare-fun res!569062 () Bool)

(declare-fun e!466675 () Bool)

(assert (=> d!107587 (=> res!569062 e!466675)))

(assert (=> d!107587 (= res!569062 (or ((_ is Nil!15980) l!390) ((_ is Nil!15980) (t!22354 l!390))))))

(assert (=> d!107587 (= (isStrictlySorted!453 l!390) e!466675)))

(declare-fun b!836460 () Bool)

(declare-fun e!466676 () Bool)

(assert (=> b!836460 (= e!466675 e!466676)))

(declare-fun res!569063 () Bool)

(assert (=> b!836460 (=> (not res!569063) (not e!466676))))

(assert (=> b!836460 (= res!569063 (bvslt (_1!5119 (h!17110 l!390)) (_1!5119 (h!17110 (t!22354 l!390)))))))

(declare-fun b!836461 () Bool)

(assert (=> b!836461 (= e!466676 (isStrictlySorted!453 (t!22354 l!390)))))

(assert (= (and d!107587 (not res!569062)) b!836460))

(assert (= (and b!836460 res!569063) b!836461))

(declare-fun m!781707 () Bool)

(assert (=> b!836461 m!781707))

(assert (=> start!72018 d!107587))

(declare-fun d!107593 () Bool)

(declare-fun lt!380409 () Int)

(assert (=> d!107593 (>= lt!380409 0)))

(declare-fun e!466679 () Int)

(assert (=> d!107593 (= lt!380409 e!466679)))

(declare-fun c!91051 () Bool)

(assert (=> d!107593 (= c!91051 ((_ is Nil!15980) (t!22354 l!390)))))

(assert (=> d!107593 (= (ListPrimitiveSize!71 (t!22354 l!390)) lt!380409)))

(declare-fun b!836466 () Bool)

(assert (=> b!836466 (= e!466679 0)))

(declare-fun b!836467 () Bool)

(assert (=> b!836467 (= e!466679 (+ 1 (ListPrimitiveSize!71 (t!22354 (t!22354 l!390)))))))

(assert (= (and d!107593 c!91051) b!836466))

(assert (= (and d!107593 (not c!91051)) b!836467))

(declare-fun m!781709 () Bool)

(assert (=> b!836467 m!781709))

(assert (=> b!836407 d!107593))

(declare-fun d!107595 () Bool)

