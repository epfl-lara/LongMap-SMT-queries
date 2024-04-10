; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138054 () Bool)

(assert start!138054)

(declare-fun b!1584362 () Bool)

(declare-fun e!884443 () Bool)

(declare-datatypes ((B!2920 0))(
  ( (B!2921 (val!19822 Int)) )
))
(declare-datatypes ((tuple2!25812 0))(
  ( (tuple2!25813 (_1!12917 (_ BitVec 64)) (_2!12917 B!2920)) )
))
(declare-datatypes ((List!36942 0))(
  ( (Nil!36939) (Cons!36938 (h!38481 tuple2!25812) (t!51856 List!36942)) )
))
(declare-fun l!1251 () List!36942)

(declare-fun ListPrimitiveSize!221 (List!36942) Int)

(assert (=> b!1584362 (= e!884443 (>= (ListPrimitiveSize!221 (t!51856 l!1251)) (ListPrimitiveSize!221 l!1251)))))

(declare-fun b!1584363 () Bool)

(declare-fun res!1082182 () Bool)

(assert (=> b!1584363 (=> (not res!1082182) (not e!884443))))

(declare-fun newKey!123 () (_ BitVec 64))

(declare-fun otherKey!56 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1584363 (= res!1082182 (and (not (= otherKey!56 newKey!123)) ((_ is Cons!36938) l!1251)))))

(declare-fun b!1584364 () Bool)

(declare-fun res!1082186 () Bool)

(assert (=> b!1584364 (=> (not res!1082186) (not e!884443))))

(declare-fun isStrictlySorted!1167 (List!36942) Bool)

(assert (=> b!1584364 (= res!1082186 (isStrictlySorted!1167 (t!51856 l!1251)))))

(declare-fun b!1584365 () Bool)

(declare-fun res!1082184 () Bool)

(assert (=> b!1584365 (=> (not res!1082184) (not e!884443))))

(declare-fun containsKey!1001 (List!36942 (_ BitVec 64)) Bool)

(assert (=> b!1584365 (= res!1082184 (not (containsKey!1001 l!1251 otherKey!56)))))

(declare-fun b!1584366 () Bool)

(declare-fun e!884442 () Bool)

(declare-fun tp_is_empty!39453 () Bool)

(declare-fun tp!115105 () Bool)

(assert (=> b!1584366 (= e!884442 (and tp_is_empty!39453 tp!115105))))

(declare-fun res!1082183 () Bool)

(assert (=> start!138054 (=> (not res!1082183) (not e!884443))))

(assert (=> start!138054 (= res!1082183 (isStrictlySorted!1167 l!1251))))

(assert (=> start!138054 e!884443))

(assert (=> start!138054 e!884442))

(assert (=> start!138054 true))

(declare-fun b!1584367 () Bool)

(declare-fun res!1082185 () Bool)

(assert (=> b!1584367 (=> (not res!1082185) (not e!884443))))

(assert (=> b!1584367 (= res!1082185 (not (containsKey!1001 (t!51856 l!1251) otherKey!56)))))

(assert (= (and start!138054 res!1082183) b!1584365))

(assert (= (and b!1584365 res!1082184) b!1584363))

(assert (= (and b!1584363 res!1082182) b!1584364))

(assert (= (and b!1584364 res!1082186) b!1584367))

(assert (= (and b!1584367 res!1082185) b!1584362))

(assert (= (and start!138054 ((_ is Cons!36938) l!1251)) b!1584366))

(declare-fun m!1453697 () Bool)

(assert (=> b!1584367 m!1453697))

(declare-fun m!1453699 () Bool)

(assert (=> b!1584365 m!1453699))

(declare-fun m!1453701 () Bool)

(assert (=> start!138054 m!1453701))

(declare-fun m!1453703 () Bool)

(assert (=> b!1584362 m!1453703))

(declare-fun m!1453705 () Bool)

(assert (=> b!1584362 m!1453705))

(declare-fun m!1453707 () Bool)

(assert (=> b!1584364 m!1453707))

(check-sat (not b!1584362) (not b!1584367) tp_is_empty!39453 (not b!1584365) (not b!1584366) (not b!1584364) (not start!138054))
(check-sat)
(get-model)

(declare-fun d!167401 () Bool)

(declare-fun res!1082212 () Bool)

(declare-fun e!884460 () Bool)

(assert (=> d!167401 (=> res!1082212 e!884460)))

(assert (=> d!167401 (= res!1082212 (or ((_ is Nil!36939) (t!51856 l!1251)) ((_ is Nil!36939) (t!51856 (t!51856 l!1251)))))))

(assert (=> d!167401 (= (isStrictlySorted!1167 (t!51856 l!1251)) e!884460)))

(declare-fun b!1584396 () Bool)

(declare-fun e!884461 () Bool)

(assert (=> b!1584396 (= e!884460 e!884461)))

(declare-fun res!1082213 () Bool)

(assert (=> b!1584396 (=> (not res!1082213) (not e!884461))))

(assert (=> b!1584396 (= res!1082213 (bvslt (_1!12917 (h!38481 (t!51856 l!1251))) (_1!12917 (h!38481 (t!51856 (t!51856 l!1251))))))))

(declare-fun b!1584397 () Bool)

(assert (=> b!1584397 (= e!884461 (isStrictlySorted!1167 (t!51856 (t!51856 l!1251))))))

(assert (= (and d!167401 (not res!1082212)) b!1584396))

(assert (= (and b!1584396 res!1082213) b!1584397))

(declare-fun m!1453721 () Bool)

(assert (=> b!1584397 m!1453721))

(assert (=> b!1584364 d!167401))

(declare-fun d!167409 () Bool)

(declare-fun res!1082228 () Bool)

(declare-fun e!884480 () Bool)

(assert (=> d!167409 (=> res!1082228 e!884480)))

(assert (=> d!167409 (= res!1082228 (and ((_ is Cons!36938) l!1251) (= (_1!12917 (h!38481 l!1251)) otherKey!56)))))

(assert (=> d!167409 (= (containsKey!1001 l!1251 otherKey!56) e!884480)))

(declare-fun b!1584418 () Bool)

(declare-fun e!884481 () Bool)

(assert (=> b!1584418 (= e!884480 e!884481)))

(declare-fun res!1082229 () Bool)

(assert (=> b!1584418 (=> (not res!1082229) (not e!884481))))

(assert (=> b!1584418 (= res!1082229 (and (or (not ((_ is Cons!36938) l!1251)) (bvsle (_1!12917 (h!38481 l!1251)) otherKey!56)) ((_ is Cons!36938) l!1251) (bvslt (_1!12917 (h!38481 l!1251)) otherKey!56)))))

(declare-fun b!1584419 () Bool)

(assert (=> b!1584419 (= e!884481 (containsKey!1001 (t!51856 l!1251) otherKey!56))))

(assert (= (and d!167409 (not res!1082228)) b!1584418))

(assert (= (and b!1584418 res!1082229) b!1584419))

(assert (=> b!1584419 m!1453697))

(assert (=> b!1584365 d!167409))

(declare-fun d!167419 () Bool)

(declare-fun res!1082232 () Bool)

(declare-fun e!884484 () Bool)

(assert (=> d!167419 (=> res!1082232 e!884484)))

(assert (=> d!167419 (= res!1082232 (or ((_ is Nil!36939) l!1251) ((_ is Nil!36939) (t!51856 l!1251))))))

(assert (=> d!167419 (= (isStrictlySorted!1167 l!1251) e!884484)))

(declare-fun b!1584424 () Bool)

(declare-fun e!884485 () Bool)

(assert (=> b!1584424 (= e!884484 e!884485)))

(declare-fun res!1082233 () Bool)

(assert (=> b!1584424 (=> (not res!1082233) (not e!884485))))

(assert (=> b!1584424 (= res!1082233 (bvslt (_1!12917 (h!38481 l!1251)) (_1!12917 (h!38481 (t!51856 l!1251)))))))

(declare-fun b!1584425 () Bool)

(assert (=> b!1584425 (= e!884485 (isStrictlySorted!1167 (t!51856 l!1251)))))

(assert (= (and d!167419 (not res!1082232)) b!1584424))

(assert (= (and b!1584424 res!1082233) b!1584425))

(assert (=> b!1584425 m!1453707))

(assert (=> start!138054 d!167419))

(declare-fun d!167421 () Bool)

(declare-fun lt!677255 () Int)

(assert (=> d!167421 (>= lt!677255 0)))

(declare-fun e!884499 () Int)

(assert (=> d!167421 (= lt!677255 e!884499)))

(declare-fun c!146854 () Bool)

(assert (=> d!167421 (= c!146854 ((_ is Nil!36939) (t!51856 l!1251)))))

(assert (=> d!167421 (= (ListPrimitiveSize!221 (t!51856 l!1251)) lt!677255)))

(declare-fun b!1584447 () Bool)

(assert (=> b!1584447 (= e!884499 0)))

(declare-fun b!1584448 () Bool)

(assert (=> b!1584448 (= e!884499 (+ 1 (ListPrimitiveSize!221 (t!51856 (t!51856 l!1251)))))))

(assert (= (and d!167421 c!146854) b!1584447))

(assert (= (and d!167421 (not c!146854)) b!1584448))

(declare-fun m!1453731 () Bool)

(assert (=> b!1584448 m!1453731))

(assert (=> b!1584362 d!167421))

(declare-fun d!167429 () Bool)

(declare-fun lt!677256 () Int)

(assert (=> d!167429 (>= lt!677256 0)))

(declare-fun e!884500 () Int)

(assert (=> d!167429 (= lt!677256 e!884500)))

(declare-fun c!146855 () Bool)

(assert (=> d!167429 (= c!146855 ((_ is Nil!36939) l!1251))))

(assert (=> d!167429 (= (ListPrimitiveSize!221 l!1251) lt!677256)))

(declare-fun b!1584449 () Bool)

(assert (=> b!1584449 (= e!884500 0)))

(declare-fun b!1584450 () Bool)

(assert (=> b!1584450 (= e!884500 (+ 1 (ListPrimitiveSize!221 (t!51856 l!1251))))))

(assert (= (and d!167429 c!146855) b!1584449))

(assert (= (and d!167429 (not c!146855)) b!1584450))

(assert (=> b!1584450 m!1453703))

(assert (=> b!1584362 d!167429))

(declare-fun d!167431 () Bool)

(declare-fun res!1082238 () Bool)

(declare-fun e!884501 () Bool)

(assert (=> d!167431 (=> res!1082238 e!884501)))

(assert (=> d!167431 (= res!1082238 (and ((_ is Cons!36938) (t!51856 l!1251)) (= (_1!12917 (h!38481 (t!51856 l!1251))) otherKey!56)))))

(assert (=> d!167431 (= (containsKey!1001 (t!51856 l!1251) otherKey!56) e!884501)))

(declare-fun b!1584451 () Bool)

(declare-fun e!884502 () Bool)

(assert (=> b!1584451 (= e!884501 e!884502)))

(declare-fun res!1082239 () Bool)

(assert (=> b!1584451 (=> (not res!1082239) (not e!884502))))

(assert (=> b!1584451 (= res!1082239 (and (or (not ((_ is Cons!36938) (t!51856 l!1251))) (bvsle (_1!12917 (h!38481 (t!51856 l!1251))) otherKey!56)) ((_ is Cons!36938) (t!51856 l!1251)) (bvslt (_1!12917 (h!38481 (t!51856 l!1251))) otherKey!56)))))

(declare-fun b!1584452 () Bool)

(assert (=> b!1584452 (= e!884502 (containsKey!1001 (t!51856 (t!51856 l!1251)) otherKey!56))))

(assert (= (and d!167431 (not res!1082238)) b!1584451))

(assert (= (and b!1584451 res!1082239) b!1584452))

(declare-fun m!1453733 () Bool)

(assert (=> b!1584452 m!1453733))

(assert (=> b!1584367 d!167431))

(declare-fun b!1584461 () Bool)

(declare-fun e!884509 () Bool)

(declare-fun tp!115114 () Bool)

(assert (=> b!1584461 (= e!884509 (and tp_is_empty!39453 tp!115114))))

(assert (=> b!1584366 (= tp!115105 e!884509)))

(assert (= (and b!1584366 ((_ is Cons!36938) (t!51856 l!1251))) b!1584461))

(check-sat (not b!1584452) (not b!1584448) (not b!1584450) (not b!1584419) (not b!1584425) (not b!1584397) tp_is_empty!39453 (not b!1584461))
(check-sat)
