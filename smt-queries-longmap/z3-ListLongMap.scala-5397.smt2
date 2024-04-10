; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72000 () Bool)

(assert start!72000)

(declare-fun res!569006 () Bool)

(declare-fun e!466583 () Bool)

(assert (=> start!72000 (=> (not res!569006) (not e!466583))))

(declare-datatypes ((B!1186 0))(
  ( (B!1187 (val!7675 Int)) )
))
(declare-datatypes ((tuple2!10210 0))(
  ( (tuple2!10211 (_1!5116 (_ BitVec 64)) (_2!5116 B!1186)) )
))
(declare-datatypes ((List!15980 0))(
  ( (Nil!15977) (Cons!15976 (h!17107 tuple2!10210) (t!22351 List!15980)) )
))
(declare-fun l!390 () List!15980)

(declare-fun isStrictlySorted!450 (List!15980) Bool)

(assert (=> start!72000 (= res!569006 (isStrictlySorted!450 l!390))))

(assert (=> start!72000 e!466583))

(declare-fun e!466584 () Bool)

(assert (=> start!72000 e!466584))

(declare-fun b!836332 () Bool)

(declare-fun ListPrimitiveSize!68 (List!15980) Int)

(assert (=> b!836332 (= e!466583 (< (ListPrimitiveSize!68 l!390) 0))))

(declare-fun b!836333 () Bool)

(declare-fun tp_is_empty!15255 () Bool)

(declare-fun tp!47426 () Bool)

(assert (=> b!836333 (= e!466584 (and tp_is_empty!15255 tp!47426))))

(assert (= (and start!72000 res!569006) b!836332))

(get-info :version)

(assert (= (and start!72000 ((_ is Cons!15976) l!390)) b!836333))

(declare-fun m!781661 () Bool)

(assert (=> start!72000 m!781661))

(declare-fun m!781663 () Bool)

(assert (=> b!836332 m!781663))

(check-sat (not start!72000) (not b!836332) (not b!836333) tp_is_empty!15255)
(check-sat)
(get-model)

(declare-fun d!107565 () Bool)

(declare-fun res!569014 () Bool)

(declare-fun e!466597 () Bool)

(assert (=> d!107565 (=> res!569014 e!466597)))

(assert (=> d!107565 (= res!569014 (or ((_ is Nil!15977) l!390) ((_ is Nil!15977) (t!22351 l!390))))))

(assert (=> d!107565 (= (isStrictlySorted!450 l!390) e!466597)))

(declare-fun b!836348 () Bool)

(declare-fun e!466598 () Bool)

(assert (=> b!836348 (= e!466597 e!466598)))

(declare-fun res!569015 () Bool)

(assert (=> b!836348 (=> (not res!569015) (not e!466598))))

(assert (=> b!836348 (= res!569015 (bvslt (_1!5116 (h!17107 l!390)) (_1!5116 (h!17107 (t!22351 l!390)))))))

(declare-fun b!836349 () Bool)

(assert (=> b!836349 (= e!466598 (isStrictlySorted!450 (t!22351 l!390)))))

(assert (= (and d!107565 (not res!569014)) b!836348))

(assert (= (and b!836348 res!569015) b!836349))

(declare-fun m!781669 () Bool)

(assert (=> b!836349 m!781669))

(assert (=> start!72000 d!107565))

(declare-fun d!107571 () Bool)

(declare-fun lt!380398 () Int)

(assert (=> d!107571 (>= lt!380398 0)))

(declare-fun e!466605 () Int)

(assert (=> d!107571 (= lt!380398 e!466605)))

(declare-fun c!91040 () Bool)

(assert (=> d!107571 (= c!91040 ((_ is Nil!15977) l!390))))

(assert (=> d!107571 (= (ListPrimitiveSize!68 l!390) lt!380398)))

(declare-fun b!836362 () Bool)

(assert (=> b!836362 (= e!466605 0)))

(declare-fun b!836363 () Bool)

(assert (=> b!836363 (= e!466605 (+ 1 (ListPrimitiveSize!68 (t!22351 l!390))))))

(assert (= (and d!107571 c!91040) b!836362))

(assert (= (and d!107571 (not c!91040)) b!836363))

(declare-fun m!781675 () Bool)

(assert (=> b!836363 m!781675))

(assert (=> b!836332 d!107571))

(declare-fun b!836376 () Bool)

(declare-fun e!466616 () Bool)

(declare-fun tp!47432 () Bool)

(assert (=> b!836376 (= e!466616 (and tp_is_empty!15255 tp!47432))))

(assert (=> b!836333 (= tp!47426 e!466616)))

(assert (= (and b!836333 ((_ is Cons!15976) (t!22351 l!390))) b!836376))

(check-sat (not b!836349) (not b!836363) (not b!836376) tp_is_empty!15255)
(check-sat)
