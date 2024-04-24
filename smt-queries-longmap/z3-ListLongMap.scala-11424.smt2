; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133590 () Bool)

(assert start!133590)

(declare-fun b!1560579 () Bool)

(declare-fun res!1066516 () Bool)

(declare-fun e!869479 () Bool)

(assert (=> b!1560579 (=> (not res!1066516) (not e!869479))))

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun newKey!135 () (_ BitVec 64))

(assert (=> b!1560579 (= res!1066516 (not (= otherKey!62 newKey!135)))))

(declare-fun b!1560580 () Bool)

(declare-datatypes ((B!2420 0))(
  ( (B!2421 (val!19296 Int)) )
))
(declare-datatypes ((tuple2!25022 0))(
  ( (tuple2!25023 (_1!12522 (_ BitVec 64)) (_2!12522 B!2420)) )
))
(declare-datatypes ((List!36359 0))(
  ( (Nil!36356) (Cons!36355 (h!37819 tuple2!25022) (t!51078 List!36359)) )
))
(declare-fun l!1292 () List!36359)

(declare-fun ListPrimitiveSize!181 (List!36359) Int)

(assert (=> b!1560580 (= e!869479 (< (ListPrimitiveSize!181 l!1292) 0))))

(declare-fun b!1560578 () Bool)

(declare-fun res!1066517 () Bool)

(assert (=> b!1560578 (=> (not res!1066517) (not e!869479))))

(declare-fun containsKey!833 (List!36359 (_ BitVec 64)) Bool)

(assert (=> b!1560578 (= res!1066517 (containsKey!833 l!1292 otherKey!62))))

(declare-fun b!1560581 () Bool)

(declare-fun e!869480 () Bool)

(declare-fun tp_is_empty!38425 () Bool)

(declare-fun tp!112602 () Bool)

(assert (=> b!1560581 (= e!869480 (and tp_is_empty!38425 tp!112602))))

(declare-fun res!1066518 () Bool)

(assert (=> start!133590 (=> (not res!1066518) (not e!869479))))

(declare-fun isStrictlySorted!957 (List!36359) Bool)

(assert (=> start!133590 (= res!1066518 (isStrictlySorted!957 l!1292))))

(assert (=> start!133590 e!869479))

(assert (=> start!133590 e!869480))

(assert (=> start!133590 true))

(assert (= (and start!133590 res!1066518) b!1560578))

(assert (= (and b!1560578 res!1066517) b!1560579))

(assert (= (and b!1560579 res!1066516) b!1560580))

(get-info :version)

(assert (= (and start!133590 ((_ is Cons!36355) l!1292)) b!1560581))

(declare-fun m!1437227 () Bool)

(assert (=> b!1560580 m!1437227))

(declare-fun m!1437229 () Bool)

(assert (=> b!1560578 m!1437229))

(declare-fun m!1437231 () Bool)

(assert (=> start!133590 m!1437231))

(check-sat tp_is_empty!38425 (not b!1560581) (not b!1560578) (not b!1560580) (not start!133590))
(check-sat)
(get-model)

(declare-fun d!163295 () Bool)

(declare-fun res!1066541 () Bool)

(declare-fun e!869499 () Bool)

(assert (=> d!163295 (=> res!1066541 e!869499)))

(assert (=> d!163295 (= res!1066541 (or ((_ is Nil!36356) l!1292) ((_ is Nil!36356) (t!51078 l!1292))))))

(assert (=> d!163295 (= (isStrictlySorted!957 l!1292) e!869499)))

(declare-fun b!1560614 () Bool)

(declare-fun e!869500 () Bool)

(assert (=> b!1560614 (= e!869499 e!869500)))

(declare-fun res!1066542 () Bool)

(assert (=> b!1560614 (=> (not res!1066542) (not e!869500))))

(assert (=> b!1560614 (= res!1066542 (bvslt (_1!12522 (h!37819 l!1292)) (_1!12522 (h!37819 (t!51078 l!1292)))))))

(declare-fun b!1560615 () Bool)

(assert (=> b!1560615 (= e!869500 (isStrictlySorted!957 (t!51078 l!1292)))))

(assert (= (and d!163295 (not res!1066541)) b!1560614))

(assert (= (and b!1560614 res!1066542) b!1560615))

(declare-fun m!1437245 () Bool)

(assert (=> b!1560615 m!1437245))

(assert (=> start!133590 d!163295))

(declare-fun d!163301 () Bool)

(declare-fun lt!671677 () Int)

(assert (=> d!163301 (>= lt!671677 0)))

(declare-fun e!869508 () Int)

(assert (=> d!163301 (= lt!671677 e!869508)))

(declare-fun c!144889 () Bool)

(assert (=> d!163301 (= c!144889 ((_ is Nil!36356) l!1292))))

(assert (=> d!163301 (= (ListPrimitiveSize!181 l!1292) lt!671677)))

(declare-fun b!1560626 () Bool)

(assert (=> b!1560626 (= e!869508 0)))

(declare-fun b!1560627 () Bool)

(assert (=> b!1560627 (= e!869508 (+ 1 (ListPrimitiveSize!181 (t!51078 l!1292))))))

(assert (= (and d!163301 c!144889) b!1560626))

(assert (= (and d!163301 (not c!144889)) b!1560627))

(declare-fun m!1437249 () Bool)

(assert (=> b!1560627 m!1437249))

(assert (=> b!1560580 d!163301))

(declare-fun d!163305 () Bool)

(declare-fun res!1066559 () Bool)

(declare-fun e!869521 () Bool)

(assert (=> d!163305 (=> res!1066559 e!869521)))

(assert (=> d!163305 (= res!1066559 (and ((_ is Cons!36355) l!1292) (= (_1!12522 (h!37819 l!1292)) otherKey!62)))))

(assert (=> d!163305 (= (containsKey!833 l!1292 otherKey!62) e!869521)))

(declare-fun b!1560640 () Bool)

(declare-fun e!869522 () Bool)

(assert (=> b!1560640 (= e!869521 e!869522)))

(declare-fun res!1066560 () Bool)

(assert (=> b!1560640 (=> (not res!1066560) (not e!869522))))

(assert (=> b!1560640 (= res!1066560 (and (or (not ((_ is Cons!36355) l!1292)) (bvsle (_1!12522 (h!37819 l!1292)) otherKey!62)) ((_ is Cons!36355) l!1292) (bvslt (_1!12522 (h!37819 l!1292)) otherKey!62)))))

(declare-fun b!1560641 () Bool)

(assert (=> b!1560641 (= e!869522 (containsKey!833 (t!51078 l!1292) otherKey!62))))

(assert (= (and d!163305 (not res!1066559)) b!1560640))

(assert (= (and b!1560640 res!1066560) b!1560641))

(declare-fun m!1437253 () Bool)

(assert (=> b!1560641 m!1437253))

(assert (=> b!1560578 d!163305))

(declare-fun b!1560646 () Bool)

(declare-fun e!869527 () Bool)

(declare-fun tp!112611 () Bool)

(assert (=> b!1560646 (= e!869527 (and tp_is_empty!38425 tp!112611))))

(assert (=> b!1560581 (= tp!112602 e!869527)))

(assert (= (and b!1560581 ((_ is Cons!36355) (t!51078 l!1292))) b!1560646))

(check-sat tp_is_empty!38425 (not b!1560646) (not b!1560641) (not b!1560627) (not b!1560615))
(check-sat)
