; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133614 () Bool)

(assert start!133614)

(declare-fun b!1560685 () Bool)

(declare-fun res!1066584 () Bool)

(declare-fun e!869555 () Bool)

(assert (=> b!1560685 (=> (not res!1066584) (not e!869555))))

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun newKey!135 () (_ BitVec 64))

(declare-datatypes ((B!2426 0))(
  ( (B!2427 (val!19299 Int)) )
))
(declare-datatypes ((tuple2!25028 0))(
  ( (tuple2!25029 (_1!12525 (_ BitVec 64)) (_2!12525 B!2426)) )
))
(declare-datatypes ((List!36362 0))(
  ( (Nil!36359) (Cons!36358 (h!37822 tuple2!25028) (t!51081 List!36362)) )
))
(declare-fun l!1292 () List!36362)

(get-info :version)

(assert (=> b!1560685 (= res!1066584 (and (not (= otherKey!62 newKey!135)) ((_ is Cons!36358) l!1292) (not (= (_1!12525 (h!37822 l!1292)) otherKey!62))))))

(declare-fun b!1560686 () Bool)

(declare-fun e!869554 () Bool)

(declare-fun containsKey!836 (List!36362 (_ BitVec 64)) Bool)

(assert (=> b!1560686 (= e!869554 (not (containsKey!836 (t!51081 l!1292) otherKey!62)))))

(declare-fun b!1560687 () Bool)

(declare-fun e!869553 () Bool)

(declare-fun tp_is_empty!38431 () Bool)

(declare-fun tp!112620 () Bool)

(assert (=> b!1560687 (= e!869553 (and tp_is_empty!38431 tp!112620))))

(declare-fun res!1066583 () Bool)

(assert (=> start!133614 (=> (not res!1066583) (not e!869555))))

(declare-fun isStrictlySorted!960 (List!36362) Bool)

(assert (=> start!133614 (= res!1066583 (isStrictlySorted!960 l!1292))))

(assert (=> start!133614 e!869555))

(assert (=> start!133614 e!869553))

(assert (=> start!133614 true))

(declare-fun b!1560688 () Bool)

(declare-fun res!1066582 () Bool)

(assert (=> b!1560688 (=> (not res!1066582) (not e!869555))))

(assert (=> b!1560688 (= res!1066582 (containsKey!836 l!1292 otherKey!62))))

(declare-fun b!1560689 () Bool)

(assert (=> b!1560689 (= e!869555 e!869554)))

(declare-fun res!1066581 () Bool)

(assert (=> b!1560689 (=> res!1066581 e!869554)))

(assert (=> b!1560689 (= res!1066581 (not (isStrictlySorted!960 (t!51081 l!1292))))))

(assert (= (and start!133614 res!1066583) b!1560688))

(assert (= (and b!1560688 res!1066582) b!1560685))

(assert (= (and b!1560685 res!1066584) b!1560689))

(assert (= (and b!1560689 (not res!1066581)) b!1560686))

(assert (= (and start!133614 ((_ is Cons!36358) l!1292)) b!1560687))

(declare-fun m!1437263 () Bool)

(assert (=> b!1560686 m!1437263))

(declare-fun m!1437265 () Bool)

(assert (=> start!133614 m!1437265))

(declare-fun m!1437267 () Bool)

(assert (=> b!1560688 m!1437267))

(declare-fun m!1437269 () Bool)

(assert (=> b!1560689 m!1437269))

(check-sat (not b!1560688) tp_is_empty!38431 (not start!133614) (not b!1560689) (not b!1560687) (not b!1560686))
(check-sat)
(get-model)

(declare-fun d!163315 () Bool)

(declare-fun res!1066613 () Bool)

(declare-fun e!869578 () Bool)

(assert (=> d!163315 (=> res!1066613 e!869578)))

(assert (=> d!163315 (= res!1066613 (or ((_ is Nil!36359) (t!51081 l!1292)) ((_ is Nil!36359) (t!51081 (t!51081 l!1292)))))))

(assert (=> d!163315 (= (isStrictlySorted!960 (t!51081 l!1292)) e!869578)))

(declare-fun b!1560724 () Bool)

(declare-fun e!869579 () Bool)

(assert (=> b!1560724 (= e!869578 e!869579)))

(declare-fun res!1066614 () Bool)

(assert (=> b!1560724 (=> (not res!1066614) (not e!869579))))

(assert (=> b!1560724 (= res!1066614 (bvslt (_1!12525 (h!37822 (t!51081 l!1292))) (_1!12525 (h!37822 (t!51081 (t!51081 l!1292))))))))

(declare-fun b!1560725 () Bool)

(assert (=> b!1560725 (= e!869579 (isStrictlySorted!960 (t!51081 (t!51081 l!1292))))))

(assert (= (and d!163315 (not res!1066613)) b!1560724))

(assert (= (and b!1560724 res!1066614) b!1560725))

(declare-fun m!1437287 () Bool)

(assert (=> b!1560725 m!1437287))

(assert (=> b!1560689 d!163315))

(declare-fun d!163319 () Bool)

(declare-fun res!1066631 () Bool)

(declare-fun e!869596 () Bool)

(assert (=> d!163319 (=> res!1066631 e!869596)))

(assert (=> d!163319 (= res!1066631 (and ((_ is Cons!36358) l!1292) (= (_1!12525 (h!37822 l!1292)) otherKey!62)))))

(assert (=> d!163319 (= (containsKey!836 l!1292 otherKey!62) e!869596)))

(declare-fun b!1560740 () Bool)

(declare-fun e!869597 () Bool)

(assert (=> b!1560740 (= e!869596 e!869597)))

(declare-fun res!1066632 () Bool)

(assert (=> b!1560740 (=> (not res!1066632) (not e!869597))))

(assert (=> b!1560740 (= res!1066632 (and (or (not ((_ is Cons!36358) l!1292)) (bvsle (_1!12525 (h!37822 l!1292)) otherKey!62)) ((_ is Cons!36358) l!1292) (bvslt (_1!12525 (h!37822 l!1292)) otherKey!62)))))

(declare-fun b!1560741 () Bool)

(assert (=> b!1560741 (= e!869597 (containsKey!836 (t!51081 l!1292) otherKey!62))))

(assert (= (and d!163319 (not res!1066631)) b!1560740))

(assert (= (and b!1560740 res!1066632) b!1560741))

(assert (=> b!1560741 m!1437263))

(assert (=> b!1560688 d!163319))

(declare-fun d!163327 () Bool)

(declare-fun res!1066633 () Bool)

(declare-fun e!869598 () Bool)

(assert (=> d!163327 (=> res!1066633 e!869598)))

(assert (=> d!163327 (= res!1066633 (and ((_ is Cons!36358) (t!51081 l!1292)) (= (_1!12525 (h!37822 (t!51081 l!1292))) otherKey!62)))))

(assert (=> d!163327 (= (containsKey!836 (t!51081 l!1292) otherKey!62) e!869598)))

(declare-fun b!1560744 () Bool)

(declare-fun e!869599 () Bool)

(assert (=> b!1560744 (= e!869598 e!869599)))

(declare-fun res!1066634 () Bool)

(assert (=> b!1560744 (=> (not res!1066634) (not e!869599))))

(assert (=> b!1560744 (= res!1066634 (and (or (not ((_ is Cons!36358) (t!51081 l!1292))) (bvsle (_1!12525 (h!37822 (t!51081 l!1292))) otherKey!62)) ((_ is Cons!36358) (t!51081 l!1292)) (bvslt (_1!12525 (h!37822 (t!51081 l!1292))) otherKey!62)))))

(declare-fun b!1560745 () Bool)

(assert (=> b!1560745 (= e!869599 (containsKey!836 (t!51081 (t!51081 l!1292)) otherKey!62))))

(assert (= (and d!163327 (not res!1066633)) b!1560744))

(assert (= (and b!1560744 res!1066634) b!1560745))

(declare-fun m!1437291 () Bool)

(assert (=> b!1560745 m!1437291))

(assert (=> b!1560686 d!163327))

(declare-fun d!163329 () Bool)

(declare-fun res!1066635 () Bool)

(declare-fun e!869600 () Bool)

(assert (=> d!163329 (=> res!1066635 e!869600)))

(assert (=> d!163329 (= res!1066635 (or ((_ is Nil!36359) l!1292) ((_ is Nil!36359) (t!51081 l!1292))))))

(assert (=> d!163329 (= (isStrictlySorted!960 l!1292) e!869600)))

(declare-fun b!1560746 () Bool)

(declare-fun e!869601 () Bool)

(assert (=> b!1560746 (= e!869600 e!869601)))

(declare-fun res!1066636 () Bool)

(assert (=> b!1560746 (=> (not res!1066636) (not e!869601))))

(assert (=> b!1560746 (= res!1066636 (bvslt (_1!12525 (h!37822 l!1292)) (_1!12525 (h!37822 (t!51081 l!1292)))))))

(declare-fun b!1560747 () Bool)

(assert (=> b!1560747 (= e!869601 (isStrictlySorted!960 (t!51081 l!1292)))))

(assert (= (and d!163329 (not res!1066635)) b!1560746))

(assert (= (and b!1560746 res!1066636) b!1560747))

(assert (=> b!1560747 m!1437269))

(assert (=> start!133614 d!163329))

(declare-fun b!1560758 () Bool)

(declare-fun e!869610 () Bool)

(declare-fun tp!112629 () Bool)

(assert (=> b!1560758 (= e!869610 (and tp_is_empty!38431 tp!112629))))

(assert (=> b!1560687 (= tp!112620 e!869610)))

(assert (= (and b!1560687 ((_ is Cons!36358) (t!51081 l!1292))) b!1560758))

(check-sat tp_is_empty!38431 (not b!1560741) (not b!1560758) (not b!1560747) (not b!1560745) (not b!1560725))
(check-sat)
