; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132820 () Bool)

(assert start!132820)

(declare-fun b!1555811 () Bool)

(declare-fun res!1064474 () Bool)

(declare-fun e!866454 () Bool)

(assert (=> b!1555811 (=> (not res!1064474) (not e!866454))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-datatypes ((B!2320 0))(
  ( (B!2321 (val!19246 Int)) )
))
(declare-datatypes ((tuple2!24868 0))(
  ( (tuple2!24869 (_1!12445 (_ BitVec 64)) (_2!12445 B!2320)) )
))
(declare-datatypes ((List!36280 0))(
  ( (Nil!36277) (Cons!36276 (h!37722 tuple2!24868) (t!51001 List!36280)) )
))
(declare-fun l!1177 () List!36280)

(get-info :version)

(assert (=> b!1555811 (= res!1064474 (and (not (= newKey!105 otherKey!50)) (or (not ((_ is Cons!36276) l!1177)) (= (_1!12445 (h!37722 l!1177)) otherKey!50))))))

(declare-fun res!1064476 () Bool)

(assert (=> start!132820 (=> (not res!1064476) (not e!866454))))

(declare-fun isStrictlySorted!933 (List!36280) Bool)

(assert (=> start!132820 (= res!1064476 (isStrictlySorted!933 l!1177))))

(assert (=> start!132820 e!866454))

(declare-fun e!866456 () Bool)

(assert (=> start!132820 e!866456))

(assert (=> start!132820 true))

(declare-fun tp_is_empty!38331 () Bool)

(assert (=> start!132820 tp_is_empty!38331))

(declare-fun b!1555814 () Bool)

(declare-fun tp!112347 () Bool)

(assert (=> b!1555814 (= e!866456 (and tp_is_empty!38331 tp!112347))))

(declare-fun b!1555813 () Bool)

(declare-fun e!866455 () Bool)

(declare-fun lt!670349 () List!36280)

(assert (=> b!1555813 (= e!866455 (not (isStrictlySorted!933 lt!670349)))))

(declare-fun b!1555812 () Bool)

(assert (=> b!1555812 (= e!866454 e!866455)))

(declare-fun res!1064475 () Bool)

(assert (=> b!1555812 (=> (not res!1064475) (not e!866455))))

(declare-fun containsKey!804 (List!36280 (_ BitVec 64)) Bool)

(assert (=> b!1555812 (= res!1064475 (= (containsKey!804 lt!670349 otherKey!50) (containsKey!804 l!1177 otherKey!50)))))

(declare-fun newValue!105 () B!2320)

(declare-fun insertStrictlySorted!544 (List!36280 (_ BitVec 64) B!2320) List!36280)

(assert (=> b!1555812 (= lt!670349 (insertStrictlySorted!544 l!1177 newKey!105 newValue!105))))

(assert (= (and start!132820 res!1064476) b!1555811))

(assert (= (and b!1555811 res!1064474) b!1555812))

(assert (= (and b!1555812 res!1064475) b!1555813))

(assert (= (and start!132820 ((_ is Cons!36276) l!1177)) b!1555814))

(declare-fun m!1433659 () Bool)

(assert (=> start!132820 m!1433659))

(declare-fun m!1433661 () Bool)

(assert (=> b!1555813 m!1433661))

(declare-fun m!1433663 () Bool)

(assert (=> b!1555812 m!1433663))

(declare-fun m!1433665 () Bool)

(assert (=> b!1555812 m!1433665))

(declare-fun m!1433667 () Bool)

(assert (=> b!1555812 m!1433667))

(check-sat tp_is_empty!38331 (not b!1555812) (not start!132820) (not b!1555814) (not b!1555813))
(check-sat)
(get-model)

(declare-fun d!162015 () Bool)

(declare-fun res!1064490 () Bool)

(declare-fun e!866470 () Bool)

(assert (=> d!162015 (=> res!1064490 e!866470)))

(assert (=> d!162015 (= res!1064490 (or ((_ is Nil!36277) lt!670349) ((_ is Nil!36277) (t!51001 lt!670349))))))

(assert (=> d!162015 (= (isStrictlySorted!933 lt!670349) e!866470)))

(declare-fun b!1555831 () Bool)

(declare-fun e!866471 () Bool)

(assert (=> b!1555831 (= e!866470 e!866471)))

(declare-fun res!1064491 () Bool)

(assert (=> b!1555831 (=> (not res!1064491) (not e!866471))))

(assert (=> b!1555831 (= res!1064491 (bvslt (_1!12445 (h!37722 lt!670349)) (_1!12445 (h!37722 (t!51001 lt!670349)))))))

(declare-fun b!1555832 () Bool)

(assert (=> b!1555832 (= e!866471 (isStrictlySorted!933 (t!51001 lt!670349)))))

(assert (= (and d!162015 (not res!1064490)) b!1555831))

(assert (= (and b!1555831 res!1064491) b!1555832))

(declare-fun m!1433679 () Bool)

(assert (=> b!1555832 m!1433679))

(assert (=> b!1555813 d!162015))

(declare-fun d!162021 () Bool)

(declare-fun res!1064492 () Bool)

(declare-fun e!866472 () Bool)

(assert (=> d!162021 (=> res!1064492 e!866472)))

(assert (=> d!162021 (= res!1064492 (or ((_ is Nil!36277) l!1177) ((_ is Nil!36277) (t!51001 l!1177))))))

(assert (=> d!162021 (= (isStrictlySorted!933 l!1177) e!866472)))

(declare-fun b!1555833 () Bool)

(declare-fun e!866473 () Bool)

(assert (=> b!1555833 (= e!866472 e!866473)))

(declare-fun res!1064493 () Bool)

(assert (=> b!1555833 (=> (not res!1064493) (not e!866473))))

(assert (=> b!1555833 (= res!1064493 (bvslt (_1!12445 (h!37722 l!1177)) (_1!12445 (h!37722 (t!51001 l!1177)))))))

(declare-fun b!1555834 () Bool)

(assert (=> b!1555834 (= e!866473 (isStrictlySorted!933 (t!51001 l!1177)))))

(assert (= (and d!162021 (not res!1064492)) b!1555833))

(assert (= (and b!1555833 res!1064493) b!1555834))

(declare-fun m!1433681 () Bool)

(assert (=> b!1555834 m!1433681))

(assert (=> start!132820 d!162021))

(declare-fun d!162023 () Bool)

(declare-fun res!1064510 () Bool)

(declare-fun e!866490 () Bool)

(assert (=> d!162023 (=> res!1064510 e!866490)))

(assert (=> d!162023 (= res!1064510 (and ((_ is Cons!36276) lt!670349) (= (_1!12445 (h!37722 lt!670349)) otherKey!50)))))

(assert (=> d!162023 (= (containsKey!804 lt!670349 otherKey!50) e!866490)))

(declare-fun b!1555851 () Bool)

(declare-fun e!866491 () Bool)

(assert (=> b!1555851 (= e!866490 e!866491)))

(declare-fun res!1064511 () Bool)

(assert (=> b!1555851 (=> (not res!1064511) (not e!866491))))

(assert (=> b!1555851 (= res!1064511 (and (or (not ((_ is Cons!36276) lt!670349)) (bvsle (_1!12445 (h!37722 lt!670349)) otherKey!50)) ((_ is Cons!36276) lt!670349) (bvslt (_1!12445 (h!37722 lt!670349)) otherKey!50)))))

(declare-fun b!1555852 () Bool)

(assert (=> b!1555852 (= e!866491 (containsKey!804 (t!51001 lt!670349) otherKey!50))))

(assert (= (and d!162023 (not res!1064510)) b!1555851))

(assert (= (and b!1555851 res!1064511) b!1555852))

(declare-fun m!1433687 () Bool)

(assert (=> b!1555852 m!1433687))

(assert (=> b!1555812 d!162023))

(declare-fun d!162029 () Bool)

(declare-fun res!1064514 () Bool)

(declare-fun e!866494 () Bool)

(assert (=> d!162029 (=> res!1064514 e!866494)))

(assert (=> d!162029 (= res!1064514 (and ((_ is Cons!36276) l!1177) (= (_1!12445 (h!37722 l!1177)) otherKey!50)))))

(assert (=> d!162029 (= (containsKey!804 l!1177 otherKey!50) e!866494)))

(declare-fun b!1555855 () Bool)

(declare-fun e!866495 () Bool)

(assert (=> b!1555855 (= e!866494 e!866495)))

(declare-fun res!1064515 () Bool)

(assert (=> b!1555855 (=> (not res!1064515) (not e!866495))))

(assert (=> b!1555855 (= res!1064515 (and (or (not ((_ is Cons!36276) l!1177)) (bvsle (_1!12445 (h!37722 l!1177)) otherKey!50)) ((_ is Cons!36276) l!1177) (bvslt (_1!12445 (h!37722 l!1177)) otherKey!50)))))

(declare-fun b!1555856 () Bool)

(assert (=> b!1555856 (= e!866495 (containsKey!804 (t!51001 l!1177) otherKey!50))))

(assert (= (and d!162029 (not res!1064514)) b!1555855))

(assert (= (and b!1555855 res!1064515) b!1555856))

(declare-fun m!1433689 () Bool)

(assert (=> b!1555856 m!1433689))

(assert (=> b!1555812 d!162029))

(declare-fun b!1555899 () Bool)

(declare-fun e!866523 () List!36280)

(declare-fun call!71568 () List!36280)

(assert (=> b!1555899 (= e!866523 call!71568)))

(declare-fun lt!670357 () List!36280)

(declare-fun e!866524 () Bool)

(declare-fun b!1555900 () Bool)

(declare-fun contains!10180 (List!36280 tuple2!24868) Bool)

(assert (=> b!1555900 (= e!866524 (contains!10180 lt!670357 (tuple2!24869 newKey!105 newValue!105)))))

(declare-fun b!1555901 () Bool)

(declare-fun res!1064530 () Bool)

(assert (=> b!1555901 (=> (not res!1064530) (not e!866524))))

(assert (=> b!1555901 (= res!1064530 (containsKey!804 lt!670357 newKey!105))))

(declare-fun bm!71561 () Bool)

(declare-fun call!71567 () List!36280)

(assert (=> bm!71561 (= call!71567 call!71568)))

(declare-fun d!162031 () Bool)

(assert (=> d!162031 e!866524))

(declare-fun res!1064531 () Bool)

(assert (=> d!162031 (=> (not res!1064531) (not e!866524))))

(assert (=> d!162031 (= res!1064531 (isStrictlySorted!933 lt!670357))))

(declare-fun e!866522 () List!36280)

(assert (=> d!162031 (= lt!670357 e!866522)))

(declare-fun c!143685 () Bool)

(assert (=> d!162031 (= c!143685 (and ((_ is Cons!36276) l!1177) (bvslt (_1!12445 (h!37722 l!1177)) newKey!105)))))

(assert (=> d!162031 (isStrictlySorted!933 l!1177)))

(assert (=> d!162031 (= (insertStrictlySorted!544 l!1177 newKey!105 newValue!105) lt!670357)))

(declare-fun bm!71562 () Bool)

(declare-fun call!71566 () List!36280)

(assert (=> bm!71562 (= call!71568 call!71566)))

(declare-fun c!143686 () Bool)

(declare-fun e!866526 () List!36280)

(declare-fun b!1555902 () Bool)

(declare-fun c!143684 () Bool)

(assert (=> b!1555902 (= e!866526 (ite c!143684 (t!51001 l!1177) (ite c!143686 (Cons!36276 (h!37722 l!1177) (t!51001 l!1177)) Nil!36277)))))

(declare-fun bm!71563 () Bool)

(declare-fun $colon$colon!963 (List!36280 tuple2!24868) List!36280)

(assert (=> bm!71563 (= call!71566 ($colon$colon!963 e!866526 (ite c!143685 (h!37722 l!1177) (tuple2!24869 newKey!105 newValue!105))))))

(declare-fun c!143687 () Bool)

(assert (=> bm!71563 (= c!143687 c!143685)))

(declare-fun b!1555903 () Bool)

(declare-fun e!866525 () List!36280)

(assert (=> b!1555903 (= e!866525 call!71567)))

(declare-fun b!1555904 () Bool)

(assert (=> b!1555904 (= e!866522 call!71566)))

(declare-fun b!1555905 () Bool)

(assert (=> b!1555905 (= e!866522 e!866523)))

(assert (=> b!1555905 (= c!143684 (and ((_ is Cons!36276) l!1177) (= (_1!12445 (h!37722 l!1177)) newKey!105)))))

(declare-fun b!1555906 () Bool)

(assert (=> b!1555906 (= e!866526 (insertStrictlySorted!544 (t!51001 l!1177) newKey!105 newValue!105))))

(declare-fun b!1555907 () Bool)

(assert (=> b!1555907 (= e!866525 call!71567)))

(declare-fun b!1555908 () Bool)

(assert (=> b!1555908 (= c!143686 (and ((_ is Cons!36276) l!1177) (bvsgt (_1!12445 (h!37722 l!1177)) newKey!105)))))

(assert (=> b!1555908 (= e!866523 e!866525)))

(assert (= (and d!162031 c!143685) b!1555904))

(assert (= (and d!162031 (not c!143685)) b!1555905))

(assert (= (and b!1555905 c!143684) b!1555899))

(assert (= (and b!1555905 (not c!143684)) b!1555908))

(assert (= (and b!1555908 c!143686) b!1555903))

(assert (= (and b!1555908 (not c!143686)) b!1555907))

(assert (= (or b!1555903 b!1555907) bm!71561))

(assert (= (or b!1555899 bm!71561) bm!71562))

(assert (= (or b!1555904 bm!71562) bm!71563))

(assert (= (and bm!71563 c!143687) b!1555906))

(assert (= (and bm!71563 (not c!143687)) b!1555902))

(assert (= (and d!162031 res!1064531) b!1555901))

(assert (= (and b!1555901 res!1064530) b!1555900))

(declare-fun m!1433699 () Bool)

(assert (=> b!1555900 m!1433699))

(declare-fun m!1433701 () Bool)

(assert (=> bm!71563 m!1433701))

(declare-fun m!1433703 () Bool)

(assert (=> b!1555901 m!1433703))

(declare-fun m!1433705 () Bool)

(assert (=> d!162031 m!1433705))

(assert (=> d!162031 m!1433659))

(declare-fun m!1433707 () Bool)

(assert (=> b!1555906 m!1433707))

(assert (=> b!1555812 d!162031))

(declare-fun b!1555933 () Bool)

(declare-fun e!866539 () Bool)

(declare-fun tp!112353 () Bool)

(assert (=> b!1555933 (= e!866539 (and tp_is_empty!38331 tp!112353))))

(assert (=> b!1555814 (= tp!112347 e!866539)))

(assert (= (and b!1555814 ((_ is Cons!36276) (t!51001 l!1177))) b!1555933))

(check-sat tp_is_empty!38331 (not b!1555900) (not b!1555856) (not bm!71563) (not b!1555834) (not b!1555933) (not b!1555852) (not d!162031) (not b!1555906) (not b!1555832) (not b!1555901))
(check-sat)
