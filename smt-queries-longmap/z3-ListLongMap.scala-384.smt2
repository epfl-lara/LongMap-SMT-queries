; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7242 () Bool)

(assert start!7242)

(declare-fun res!27052 () Bool)

(declare-fun e!29488 () Bool)

(assert (=> start!7242 (=> (not res!27052) (not e!29488))))

(declare-datatypes ((B!884 0))(
  ( (B!885 (val!1029 Int)) )
))
(declare-datatypes ((tuple2!1710 0))(
  ( (tuple2!1711 (_1!866 (_ BitVec 64)) (_2!866 B!884)) )
))
(declare-datatypes ((List!1240 0))(
  ( (Nil!1237) (Cons!1236 (h!1816 tuple2!1710) (t!4264 List!1240)) )
))
(declare-fun l!812 () List!1240)

(declare-fun isStrictlySorted!233 (List!1240) Bool)

(assert (=> start!7242 (= res!27052 (isStrictlySorted!233 l!812))))

(assert (=> start!7242 e!29488))

(declare-fun e!29487 () Bool)

(assert (=> start!7242 e!29487))

(declare-fun b!46263 () Bool)

(declare-fun res!27051 () Bool)

(assert (=> b!46263 (=> (not res!27051) (not e!29488))))

(get-info :version)

(assert (=> b!46263 (= res!27051 ((_ is Cons!1236) l!812))))

(declare-fun b!46265 () Bool)

(declare-fun ListPrimitiveSize!46 (List!1240) Int)

(assert (=> b!46265 (= e!29488 (>= (ListPrimitiveSize!46 (t!4264 l!812)) (ListPrimitiveSize!46 l!812)))))

(declare-fun b!46264 () Bool)

(declare-fun res!27050 () Bool)

(assert (=> b!46264 (=> (not res!27050) (not e!29488))))

(assert (=> b!46264 (= res!27050 (isStrictlySorted!233 (t!4264 l!812)))))

(declare-fun b!46266 () Bool)

(declare-fun tp_is_empty!1981 () Bool)

(declare-fun tp!6119 () Bool)

(assert (=> b!46266 (= e!29487 (and tp_is_empty!1981 tp!6119))))

(assert (= (and start!7242 res!27052) b!46263))

(assert (= (and b!46263 res!27051) b!46264))

(assert (= (and b!46264 res!27050) b!46265))

(assert (= (and start!7242 ((_ is Cons!1236) l!812)) b!46266))

(declare-fun m!40595 () Bool)

(assert (=> start!7242 m!40595))

(declare-fun m!40597 () Bool)

(assert (=> b!46265 m!40597))

(declare-fun m!40599 () Bool)

(assert (=> b!46265 m!40599))

(declare-fun m!40601 () Bool)

(assert (=> b!46264 m!40601))

(check-sat (not b!46265) (not start!7242) (not b!46266) tp_is_empty!1981 (not b!46264))
(check-sat)
(get-model)

(declare-fun d!9039 () Bool)

(declare-fun res!27079 () Bool)

(declare-fun e!29509 () Bool)

(assert (=> d!9039 (=> res!27079 e!29509)))

(assert (=> d!9039 (= res!27079 (or ((_ is Nil!1237) (t!4264 l!812)) ((_ is Nil!1237) (t!4264 (t!4264 l!812)))))))

(assert (=> d!9039 (= (isStrictlySorted!233 (t!4264 l!812)) e!29509)))

(declare-fun b!46299 () Bool)

(declare-fun e!29511 () Bool)

(assert (=> b!46299 (= e!29509 e!29511)))

(declare-fun res!27081 () Bool)

(assert (=> b!46299 (=> (not res!27081) (not e!29511))))

(assert (=> b!46299 (= res!27081 (bvslt (_1!866 (h!1816 (t!4264 l!812))) (_1!866 (h!1816 (t!4264 (t!4264 l!812))))))))

(declare-fun b!46301 () Bool)

(assert (=> b!46301 (= e!29511 (isStrictlySorted!233 (t!4264 (t!4264 l!812))))))

(assert (= (and d!9039 (not res!27079)) b!46299))

(assert (= (and b!46299 res!27081) b!46301))

(declare-fun m!40621 () Bool)

(assert (=> b!46301 m!40621))

(assert (=> b!46264 d!9039))

(declare-fun d!9042 () Bool)

(declare-fun lt!20274 () Int)

(assert (=> d!9042 (>= lt!20274 0)))

(declare-fun e!29518 () Int)

(assert (=> d!9042 (= lt!20274 e!29518)))

(declare-fun c!6235 () Bool)

(assert (=> d!9042 (= c!6235 ((_ is Nil!1237) (t!4264 l!812)))))

(assert (=> d!9042 (= (ListPrimitiveSize!46 (t!4264 l!812)) lt!20274)))

(declare-fun b!46312 () Bool)

(assert (=> b!46312 (= e!29518 0)))

(declare-fun b!46314 () Bool)

(assert (=> b!46314 (= e!29518 (+ 1 (ListPrimitiveSize!46 (t!4264 (t!4264 l!812)))))))

(assert (= (and d!9042 c!6235) b!46312))

(assert (= (and d!9042 (not c!6235)) b!46314))

(declare-fun m!40623 () Bool)

(assert (=> b!46314 m!40623))

(assert (=> b!46265 d!9042))

(declare-fun d!9048 () Bool)

(declare-fun lt!20276 () Int)

(assert (=> d!9048 (>= lt!20276 0)))

(declare-fun e!29520 () Int)

(assert (=> d!9048 (= lt!20276 e!29520)))

(declare-fun c!6237 () Bool)

(assert (=> d!9048 (= c!6237 ((_ is Nil!1237) l!812))))

(assert (=> d!9048 (= (ListPrimitiveSize!46 l!812) lt!20276)))

(declare-fun b!46316 () Bool)

(assert (=> b!46316 (= e!29520 0)))

(declare-fun b!46318 () Bool)

(assert (=> b!46318 (= e!29520 (+ 1 (ListPrimitiveSize!46 (t!4264 l!812))))))

(assert (= (and d!9048 c!6237) b!46316))

(assert (= (and d!9048 (not c!6237)) b!46318))

(assert (=> b!46318 m!40597))

(assert (=> b!46265 d!9048))

(declare-fun d!9053 () Bool)

(declare-fun res!27084 () Bool)

(declare-fun e!29522 () Bool)

(assert (=> d!9053 (=> res!27084 e!29522)))

(assert (=> d!9053 (= res!27084 (or ((_ is Nil!1237) l!812) ((_ is Nil!1237) (t!4264 l!812))))))

(assert (=> d!9053 (= (isStrictlySorted!233 l!812) e!29522)))

(declare-fun b!46321 () Bool)

(declare-fun e!29524 () Bool)

(assert (=> b!46321 (= e!29522 e!29524)))

(declare-fun res!27086 () Bool)

(assert (=> b!46321 (=> (not res!27086) (not e!29524))))

(assert (=> b!46321 (= res!27086 (bvslt (_1!866 (h!1816 l!812)) (_1!866 (h!1816 (t!4264 l!812)))))))

(declare-fun b!46322 () Bool)

(assert (=> b!46322 (= e!29524 (isStrictlySorted!233 (t!4264 l!812)))))

(assert (= (and d!9053 (not res!27084)) b!46321))

(assert (= (and b!46321 res!27086) b!46322))

(assert (=> b!46322 m!40601))

(assert (=> start!7242 d!9053))

(declare-fun b!46336 () Bool)

(declare-fun e!29534 () Bool)

(declare-fun tp!6131 () Bool)

(assert (=> b!46336 (= e!29534 (and tp_is_empty!1981 tp!6131))))

(assert (=> b!46266 (= tp!6119 e!29534)))

(assert (= (and b!46266 ((_ is Cons!1236) (t!4264 l!812))) b!46336))

(check-sat (not b!46314) (not b!46322) (not b!46318) (not b!46336) (not b!46301) tp_is_empty!1981)
(check-sat)
