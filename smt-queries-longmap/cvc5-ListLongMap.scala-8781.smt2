; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106786 () Bool)

(assert start!106786)

(declare-fun res!843662 () Bool)

(declare-fun e!722008 () Bool)

(assert (=> start!106786 (=> (not res!843662) (not e!722008))))

(declare-datatypes ((B!2078 0))(
  ( (B!2079 (val!16374 Int)) )
))
(declare-datatypes ((tuple2!21266 0))(
  ( (tuple2!21267 (_1!10644 (_ BitVec 64)) (_2!10644 B!2078)) )
))
(declare-datatypes ((List!28366 0))(
  ( (Nil!28363) (Cons!28362 (h!29571 tuple2!21266) (t!41893 List!28366)) )
))
(declare-fun l!874 () List!28366)

(declare-fun isStrictlySorted!823 (List!28366) Bool)

(assert (=> start!106786 (= res!843662 (isStrictlySorted!823 l!874))))

(assert (=> start!106786 e!722008))

(declare-fun e!722009 () Bool)

(assert (=> start!106786 e!722009))

(assert (=> start!106786 true))

(declare-fun b!1267401 () Bool)

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!682 (List!28366 (_ BitVec 64)) Bool)

(assert (=> b!1267401 (= e!722008 (containsKey!682 (t!41893 l!874) key!235))))

(declare-fun b!1267402 () Bool)

(declare-fun tp_is_empty!32599 () Bool)

(declare-fun tp!96605 () Bool)

(assert (=> b!1267402 (= e!722009 (and tp_is_empty!32599 tp!96605))))

(declare-fun b!1267403 () Bool)

(declare-fun res!843663 () Bool)

(assert (=> b!1267403 (=> (not res!843663) (not e!722008))))

(assert (=> b!1267403 (= res!843663 (isStrictlySorted!823 (t!41893 l!874)))))

(declare-fun b!1267404 () Bool)

(declare-fun res!843661 () Bool)

(assert (=> b!1267404 (=> (not res!843661) (not e!722008))))

(assert (=> b!1267404 (= res!843661 (not (containsKey!682 l!874 key!235)))))

(declare-fun b!1267405 () Bool)

(declare-fun res!843664 () Bool)

(assert (=> b!1267405 (=> (not res!843664) (not e!722008))))

(assert (=> b!1267405 (= res!843664 (is-Cons!28362 l!874))))

(assert (= (and start!106786 res!843662) b!1267404))

(assert (= (and b!1267404 res!843661) b!1267405))

(assert (= (and b!1267405 res!843664) b!1267403))

(assert (= (and b!1267403 res!843663) b!1267401))

(assert (= (and start!106786 (is-Cons!28362 l!874)) b!1267402))

(declare-fun m!1166721 () Bool)

(assert (=> start!106786 m!1166721))

(declare-fun m!1166723 () Bool)

(assert (=> b!1267401 m!1166723))

(declare-fun m!1166725 () Bool)

(assert (=> b!1267403 m!1166725))

(declare-fun m!1166727 () Bool)

(assert (=> b!1267404 m!1166727))

(push 1)

(assert (not b!1267402))

(assert (not b!1267401))

(assert (not start!106786))

(assert (not b!1267404))

(assert (not b!1267403))

(assert tp_is_empty!32599)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!139463 () Bool)

(declare-fun res!843697 () Bool)

(declare-fun e!722030 () Bool)

(assert (=> d!139463 (=> res!843697 e!722030)))

(assert (=> d!139463 (= res!843697 (or (is-Nil!28363 (t!41893 l!874)) (is-Nil!28363 (t!41893 (t!41893 l!874)))))))

(assert (=> d!139463 (= (isStrictlySorted!823 (t!41893 l!874)) e!722030)))

(declare-fun b!1267444 () Bool)

(declare-fun e!722031 () Bool)

(assert (=> b!1267444 (= e!722030 e!722031)))

(declare-fun res!843698 () Bool)

(assert (=> b!1267444 (=> (not res!843698) (not e!722031))))

(assert (=> b!1267444 (= res!843698 (bvslt (_1!10644 (h!29571 (t!41893 l!874))) (_1!10644 (h!29571 (t!41893 (t!41893 l!874))))))))

(declare-fun b!1267445 () Bool)

(assert (=> b!1267445 (= e!722031 (isStrictlySorted!823 (t!41893 (t!41893 l!874))))))

(assert (= (and d!139463 (not res!843697)) b!1267444))

(assert (= (and b!1267444 res!843698) b!1267445))

(declare-fun m!1166745 () Bool)

(assert (=> b!1267445 m!1166745))

(assert (=> b!1267403 d!139463))

(declare-fun d!139465 () Bool)

(declare-fun res!843709 () Bool)

(declare-fun e!722042 () Bool)

(assert (=> d!139465 (=> res!843709 e!722042)))

(assert (=> d!139465 (= res!843709 (and (is-Cons!28362 l!874) (= (_1!10644 (h!29571 l!874)) key!235)))))

(assert (=> d!139465 (= (containsKey!682 l!874 key!235) e!722042)))

(declare-fun b!1267456 () Bool)

(declare-fun e!722044 () Bool)

(assert (=> b!1267456 (= e!722042 e!722044)))

(declare-fun res!843711 () Bool)

(assert (=> b!1267456 (=> (not res!843711) (not e!722044))))

(assert (=> b!1267456 (= res!843711 (and (or (not (is-Cons!28362 l!874)) (bvsle (_1!10644 (h!29571 l!874)) key!235)) (is-Cons!28362 l!874) (bvslt (_1!10644 (h!29571 l!874)) key!235)))))

(declare-fun b!1267458 () Bool)

(assert (=> b!1267458 (= e!722044 (containsKey!682 (t!41893 l!874) key!235))))

(assert (= (and d!139465 (not res!843709)) b!1267456))

(assert (= (and b!1267456 res!843711) b!1267458))

(assert (=> b!1267458 m!1166723))

(assert (=> b!1267404 d!139465))

(declare-fun d!139470 () Bool)

(declare-fun res!843713 () Bool)

(declare-fun e!722046 () Bool)

(assert (=> d!139470 (=> res!843713 e!722046)))

(assert (=> d!139470 (= res!843713 (or (is-Nil!28363 l!874) (is-Nil!28363 (t!41893 l!874))))))

(assert (=> d!139470 (= (isStrictlySorted!823 l!874) e!722046)))

(declare-fun b!1267460 () Bool)

(declare-fun e!722047 () Bool)

(assert (=> b!1267460 (= e!722046 e!722047)))

(declare-fun res!843714 () Bool)

(assert (=> b!1267460 (=> (not res!843714) (not e!722047))))

(assert (=> b!1267460 (= res!843714 (bvslt (_1!10644 (h!29571 l!874)) (_1!10644 (h!29571 (t!41893 l!874)))))))

(declare-fun b!1267461 () Bool)

(assert (=> b!1267461 (= e!722047 (isStrictlySorted!823 (t!41893 l!874)))))

(assert (= (and d!139470 (not res!843713)) b!1267460))

(assert (= (and b!1267460 res!843714) b!1267461))

(assert (=> b!1267461 m!1166725))

(assert (=> start!106786 d!139470))

(declare-fun d!139473 () Bool)

(declare-fun res!843717 () Bool)

(declare-fun e!722050 () Bool)

(assert (=> d!139473 (=> res!843717 e!722050)))

(assert (=> d!139473 (= res!843717 (and (is-Cons!28362 (t!41893 l!874)) (= (_1!10644 (h!29571 (t!41893 l!874))) key!235)))))

(assert (=> d!139473 (= (containsKey!682 (t!41893 l!874) key!235) e!722050)))

(declare-fun b!1267464 () Bool)

(declare-fun e!722051 () Bool)

(assert (=> b!1267464 (= e!722050 e!722051)))

(declare-fun res!843718 () Bool)

(assert (=> b!1267464 (=> (not res!843718) (not e!722051))))

(assert (=> b!1267464 (= res!843718 (and (or (not (is-Cons!28362 (t!41893 l!874))) (bvsle (_1!10644 (h!29571 (t!41893 l!874))) key!235)) (is-Cons!28362 (t!41893 l!874)) (bvslt (_1!10644 (h!29571 (t!41893 l!874))) key!235)))))

(declare-fun b!1267465 () Bool)

(assert (=> b!1267465 (= e!722051 (containsKey!682 (t!41893 (t!41893 l!874)) key!235))))

(assert (= (and d!139473 (not res!843717)) b!1267464))

(assert (= (and b!1267464 res!843718) b!1267465))

(declare-fun m!1166749 () Bool)

(assert (=> b!1267465 m!1166749))

(assert (=> b!1267401 d!139473))

(declare-fun b!1267477 () Bool)

(declare-fun e!722059 () Bool)

(declare-fun tp!96617 () Bool)

(assert (=> b!1267477 (= e!722059 (and tp_is_empty!32599 tp!96617))))

(assert (=> b!1267402 (= tp!96605 e!722059)))

(assert (= (and b!1267402 (is-Cons!28362 (t!41893 l!874))) b!1267477))

(push 1)

(assert (not b!1267461))

(assert (not b!1267465))

(assert (not b!1267445))

(assert tp_is_empty!32599)

(assert (not b!1267458))

(assert (not b!1267477))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

