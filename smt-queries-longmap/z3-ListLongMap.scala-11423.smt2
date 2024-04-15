; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133104 () Bool)

(assert start!133104)

(declare-fun b!1557649 () Bool)

(declare-fun e!867658 () Bool)

(declare-fun tp_is_empty!38419 () Bool)

(declare-fun tp!112585 () Bool)

(assert (=> b!1557649 (= e!867658 (and tp_is_empty!38419 tp!112585))))

(declare-datatypes ((B!2414 0))(
  ( (B!2415 (val!19293 Int)) )
))
(declare-fun newValue!135 () B!2414)

(declare-fun b!1557648 () Bool)

(declare-fun newKey!135 () (_ BitVec 64))

(declare-fun e!867659 () Bool)

(declare-datatypes ((tuple2!25034 0))(
  ( (tuple2!25035 (_1!12528 (_ BitVec 64)) (_2!12528 B!2414)) )
))
(declare-datatypes ((List!36372 0))(
  ( (Nil!36369) (Cons!36368 (h!37815 tuple2!25034) (t!51091 List!36372)) )
))
(declare-fun l!1292 () List!36372)

(declare-fun isStrictlySorted!966 (List!36372) Bool)

(declare-fun insertStrictlySorted!568 (List!36372 (_ BitVec 64) B!2414) List!36372)

(assert (=> b!1557648 (= e!867659 (not (isStrictlySorted!966 (insertStrictlySorted!568 l!1292 newKey!135 newValue!135))))))

(declare-fun b!1557647 () Bool)

(declare-fun res!1065442 () Bool)

(assert (=> b!1557647 (=> (not res!1065442) (not e!867659))))

(declare-fun otherKey!62 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1557647 (= res!1065442 (and (not (= otherKey!62 newKey!135)) (or (not ((_ is Cons!36368) l!1292)) (= (_1!12528 (h!37815 l!1292)) otherKey!62))))))

(declare-fun res!1065441 () Bool)

(assert (=> start!133104 (=> (not res!1065441) (not e!867659))))

(assert (=> start!133104 (= res!1065441 (isStrictlySorted!966 l!1292))))

(assert (=> start!133104 e!867659))

(assert (=> start!133104 e!867658))

(assert (=> start!133104 true))

(assert (=> start!133104 tp_is_empty!38419))

(declare-fun b!1557646 () Bool)

(declare-fun res!1065440 () Bool)

(assert (=> b!1557646 (=> (not res!1065440) (not e!867659))))

(declare-fun containsKey!828 (List!36372 (_ BitVec 64)) Bool)

(assert (=> b!1557646 (= res!1065440 (containsKey!828 l!1292 otherKey!62))))

(assert (= (and start!133104 res!1065441) b!1557646))

(assert (= (and b!1557646 res!1065440) b!1557647))

(assert (= (and b!1557647 res!1065442) b!1557648))

(assert (= (and start!133104 ((_ is Cons!36368) l!1292)) b!1557649))

(declare-fun m!1434005 () Bool)

(assert (=> b!1557648 m!1434005))

(assert (=> b!1557648 m!1434005))

(declare-fun m!1434007 () Bool)

(assert (=> b!1557648 m!1434007))

(declare-fun m!1434009 () Bool)

(assert (=> start!133104 m!1434009))

(declare-fun m!1434011 () Bool)

(assert (=> b!1557646 m!1434011))

(check-sat (not b!1557649) tp_is_empty!38419 (not start!133104) (not b!1557648) (not b!1557646))
(check-sat)
(get-model)

(declare-fun d!162315 () Bool)

(declare-fun res!1065465 () Bool)

(declare-fun e!867676 () Bool)

(assert (=> d!162315 (=> res!1065465 e!867676)))

(assert (=> d!162315 (= res!1065465 (and ((_ is Cons!36368) l!1292) (= (_1!12528 (h!37815 l!1292)) otherKey!62)))))

(assert (=> d!162315 (= (containsKey!828 l!1292 otherKey!62) e!867676)))

(declare-fun b!1557678 () Bool)

(declare-fun e!867677 () Bool)

(assert (=> b!1557678 (= e!867676 e!867677)))

(declare-fun res!1065466 () Bool)

(assert (=> b!1557678 (=> (not res!1065466) (not e!867677))))

(assert (=> b!1557678 (= res!1065466 (and (or (not ((_ is Cons!36368) l!1292)) (bvsle (_1!12528 (h!37815 l!1292)) otherKey!62)) ((_ is Cons!36368) l!1292) (bvslt (_1!12528 (h!37815 l!1292)) otherKey!62)))))

(declare-fun b!1557679 () Bool)

(assert (=> b!1557679 (= e!867677 (containsKey!828 (t!51091 l!1292) otherKey!62))))

(assert (= (and d!162315 (not res!1065465)) b!1557678))

(assert (= (and b!1557678 res!1065466) b!1557679))

(declare-fun m!1434029 () Bool)

(assert (=> b!1557679 m!1434029))

(assert (=> b!1557646 d!162315))

(declare-fun d!162319 () Bool)

(declare-fun res!1065481 () Bool)

(declare-fun e!867692 () Bool)

(assert (=> d!162319 (=> res!1065481 e!867692)))

(assert (=> d!162319 (= res!1065481 (or ((_ is Nil!36369) l!1292) ((_ is Nil!36369) (t!51091 l!1292))))))

(assert (=> d!162319 (= (isStrictlySorted!966 l!1292) e!867692)))

(declare-fun b!1557694 () Bool)

(declare-fun e!867693 () Bool)

(assert (=> b!1557694 (= e!867692 e!867693)))

(declare-fun res!1065482 () Bool)

(assert (=> b!1557694 (=> (not res!1065482) (not e!867693))))

(assert (=> b!1557694 (= res!1065482 (bvslt (_1!12528 (h!37815 l!1292)) (_1!12528 (h!37815 (t!51091 l!1292)))))))

(declare-fun b!1557695 () Bool)

(assert (=> b!1557695 (= e!867693 (isStrictlySorted!966 (t!51091 l!1292)))))

(assert (= (and d!162319 (not res!1065481)) b!1557694))

(assert (= (and b!1557694 res!1065482) b!1557695))

(declare-fun m!1434033 () Bool)

(assert (=> b!1557695 m!1434033))

(assert (=> start!133104 d!162319))

(declare-fun d!162325 () Bool)

(declare-fun res!1065483 () Bool)

(declare-fun e!867694 () Bool)

(assert (=> d!162325 (=> res!1065483 e!867694)))

(assert (=> d!162325 (= res!1065483 (or ((_ is Nil!36369) (insertStrictlySorted!568 l!1292 newKey!135 newValue!135)) ((_ is Nil!36369) (t!51091 (insertStrictlySorted!568 l!1292 newKey!135 newValue!135)))))))

(assert (=> d!162325 (= (isStrictlySorted!966 (insertStrictlySorted!568 l!1292 newKey!135 newValue!135)) e!867694)))

(declare-fun b!1557696 () Bool)

(declare-fun e!867695 () Bool)

(assert (=> b!1557696 (= e!867694 e!867695)))

(declare-fun res!1065484 () Bool)

(assert (=> b!1557696 (=> (not res!1065484) (not e!867695))))

(assert (=> b!1557696 (= res!1065484 (bvslt (_1!12528 (h!37815 (insertStrictlySorted!568 l!1292 newKey!135 newValue!135))) (_1!12528 (h!37815 (t!51091 (insertStrictlySorted!568 l!1292 newKey!135 newValue!135))))))))

(declare-fun b!1557697 () Bool)

(assert (=> b!1557697 (= e!867695 (isStrictlySorted!966 (t!51091 (insertStrictlySorted!568 l!1292 newKey!135 newValue!135))))))

(assert (= (and d!162325 (not res!1065483)) b!1557696))

(assert (= (and b!1557696 res!1065484) b!1557697))

(declare-fun m!1434035 () Bool)

(assert (=> b!1557697 m!1434035))

(assert (=> b!1557648 d!162325))

(declare-fun b!1557773 () Bool)

(declare-fun e!867737 () List!36372)

(declare-fun call!71713 () List!36372)

(assert (=> b!1557773 (= e!867737 call!71713)))

(declare-fun lt!670476 () List!36372)

(declare-fun b!1557774 () Bool)

(declare-fun e!867736 () Bool)

(declare-fun contains!10167 (List!36372 tuple2!25034) Bool)

(assert (=> b!1557774 (= e!867736 (contains!10167 lt!670476 (tuple2!25035 newKey!135 newValue!135)))))

(declare-fun b!1557775 () Bool)

(declare-fun e!867735 () List!36372)

(assert (=> b!1557775 (= e!867735 (insertStrictlySorted!568 (t!51091 l!1292) newKey!135 newValue!135))))

(declare-fun b!1557776 () Bool)

(declare-fun res!1065504 () Bool)

(assert (=> b!1557776 (=> (not res!1065504) (not e!867736))))

(assert (=> b!1557776 (= res!1065504 (containsKey!828 lt!670476 newKey!135))))

(declare-fun call!71711 () List!36372)

(declare-fun bm!71708 () Bool)

(declare-fun c!143987 () Bool)

(declare-fun $colon$colon!980 (List!36372 tuple2!25034) List!36372)

(assert (=> bm!71708 (= call!71711 ($colon$colon!980 e!867735 (ite c!143987 (h!37815 l!1292) (tuple2!25035 newKey!135 newValue!135))))))

(declare-fun c!143989 () Bool)

(assert (=> bm!71708 (= c!143989 c!143987)))

(declare-fun b!1557777 () Bool)

(declare-fun e!867739 () List!36372)

(assert (=> b!1557777 (= e!867739 call!71711)))

(declare-fun b!1557778 () Bool)

(assert (=> b!1557778 (= e!867737 call!71713)))

(declare-fun b!1557779 () Bool)

(declare-fun c!143988 () Bool)

(assert (=> b!1557779 (= c!143988 (and ((_ is Cons!36368) l!1292) (bvsgt (_1!12528 (h!37815 l!1292)) newKey!135)))))

(declare-fun e!867738 () List!36372)

(assert (=> b!1557779 (= e!867738 e!867737)))

(declare-fun bm!71709 () Bool)

(declare-fun call!71712 () List!36372)

(assert (=> bm!71709 (= call!71712 call!71711)))

(declare-fun bm!71710 () Bool)

(assert (=> bm!71710 (= call!71713 call!71712)))

(declare-fun c!143990 () Bool)

(declare-fun b!1557772 () Bool)

(assert (=> b!1557772 (= e!867735 (ite c!143990 (t!51091 l!1292) (ite c!143988 (Cons!36368 (h!37815 l!1292) (t!51091 l!1292)) Nil!36369)))))

(declare-fun d!162327 () Bool)

(assert (=> d!162327 e!867736))

(declare-fun res!1065503 () Bool)

(assert (=> d!162327 (=> (not res!1065503) (not e!867736))))

(assert (=> d!162327 (= res!1065503 (isStrictlySorted!966 lt!670476))))

(assert (=> d!162327 (= lt!670476 e!867739)))

(assert (=> d!162327 (= c!143987 (and ((_ is Cons!36368) l!1292) (bvslt (_1!12528 (h!37815 l!1292)) newKey!135)))))

(assert (=> d!162327 (isStrictlySorted!966 l!1292)))

(assert (=> d!162327 (= (insertStrictlySorted!568 l!1292 newKey!135 newValue!135) lt!670476)))

(declare-fun b!1557780 () Bool)

(assert (=> b!1557780 (= e!867739 e!867738)))

(assert (=> b!1557780 (= c!143990 (and ((_ is Cons!36368) l!1292) (= (_1!12528 (h!37815 l!1292)) newKey!135)))))

(declare-fun b!1557781 () Bool)

(assert (=> b!1557781 (= e!867738 call!71712)))

(assert (= (and d!162327 c!143987) b!1557777))

(assert (= (and d!162327 (not c!143987)) b!1557780))

(assert (= (and b!1557780 c!143990) b!1557781))

(assert (= (and b!1557780 (not c!143990)) b!1557779))

(assert (= (and b!1557779 c!143988) b!1557773))

(assert (= (and b!1557779 (not c!143988)) b!1557778))

(assert (= (or b!1557773 b!1557778) bm!71710))

(assert (= (or b!1557781 bm!71710) bm!71709))

(assert (= (or b!1557777 bm!71709) bm!71708))

(assert (= (and bm!71708 c!143989) b!1557775))

(assert (= (and bm!71708 (not c!143989)) b!1557772))

(assert (= (and d!162327 res!1065503) b!1557776))

(assert (= (and b!1557776 res!1065504) b!1557774))

(declare-fun m!1434051 () Bool)

(assert (=> b!1557776 m!1434051))

(declare-fun m!1434053 () Bool)

(assert (=> d!162327 m!1434053))

(assert (=> d!162327 m!1434009))

(declare-fun m!1434055 () Bool)

(assert (=> bm!71708 m!1434055))

(declare-fun m!1434057 () Bool)

(assert (=> b!1557775 m!1434057))

(declare-fun m!1434059 () Bool)

(assert (=> b!1557774 m!1434059))

(assert (=> b!1557648 d!162327))

(declare-fun b!1557798 () Bool)

(declare-fun e!867749 () Bool)

(declare-fun tp!112594 () Bool)

(assert (=> b!1557798 (= e!867749 (and tp_is_empty!38419 tp!112594))))

(assert (=> b!1557649 (= tp!112585 e!867749)))

(assert (= (and b!1557649 ((_ is Cons!36368) (t!51091 l!1292))) b!1557798))

(check-sat (not b!1557776) (not d!162327) (not b!1557798) (not b!1557775) (not b!1557697) (not bm!71708) (not b!1557695) (not b!1557774) (not b!1557679) tp_is_empty!38419)
(check-sat)
