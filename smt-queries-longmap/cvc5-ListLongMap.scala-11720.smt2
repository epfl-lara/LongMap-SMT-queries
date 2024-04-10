; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137144 () Bool)

(assert start!137144)

(declare-fun b!1580388 () Bool)

(declare-fun e!881651 () Bool)

(declare-fun tp_is_empty!39205 () Bool)

(declare-fun tp!114468 () Bool)

(assert (=> b!1580388 (= e!881651 (and tp_is_empty!39205 tp!114468))))

(declare-fun b!1580385 () Bool)

(declare-fun res!1079645 () Bool)

(declare-fun e!881650 () Bool)

(assert (=> b!1580385 (=> (not res!1079645) (not e!881650))))

(declare-datatypes ((B!2660 0))(
  ( (B!2661 (val!19692 Int)) )
))
(declare-datatypes ((tuple2!25510 0))(
  ( (tuple2!25511 (_1!12766 (_ BitVec 64)) (_2!12766 B!2660)) )
))
(declare-datatypes ((List!36812 0))(
  ( (Nil!36809) (Cons!36808 (h!38351 tuple2!25510) (t!51726 List!36812)) )
))
(declare-fun l!1390 () List!36812)

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!916 (List!36812 (_ BitVec 64)) Bool)

(assert (=> b!1580385 (= res!1079645 (containsKey!916 l!1390 key!405))))

(declare-fun b!1580386 () Bool)

(declare-fun res!1079644 () Bool)

(assert (=> b!1580386 (=> (not res!1079644) (not e!881650))))

(declare-fun value!194 () B!2660)

(declare-fun contains!10484 (List!36812 tuple2!25510) Bool)

(assert (=> b!1580386 (= res!1079644 (contains!10484 l!1390 (tuple2!25511 key!405 value!194)))))

(declare-fun res!1079646 () Bool)

(assert (=> start!137144 (=> (not res!1079646) (not e!881650))))

(declare-fun isStrictlySorted!1070 (List!36812) Bool)

(assert (=> start!137144 (= res!1079646 (isStrictlySorted!1070 l!1390))))

(assert (=> start!137144 e!881650))

(assert (=> start!137144 e!881651))

(assert (=> start!137144 true))

(assert (=> start!137144 tp_is_empty!39205))

(declare-fun b!1580387 () Bool)

(declare-fun ListPrimitiveSize!193 (List!36812) Int)

(assert (=> b!1580387 (= e!881650 (< (ListPrimitiveSize!193 l!1390) 0))))

(assert (= (and start!137144 res!1079646) b!1580385))

(assert (= (and b!1580385 res!1079645) b!1580386))

(assert (= (and b!1580386 res!1079644) b!1580387))

(assert (= (and start!137144 (is-Cons!36808 l!1390)) b!1580388))

(declare-fun m!1451833 () Bool)

(assert (=> b!1580385 m!1451833))

(declare-fun m!1451835 () Bool)

(assert (=> b!1580386 m!1451835))

(declare-fun m!1451837 () Bool)

(assert (=> start!137144 m!1451837))

(declare-fun m!1451839 () Bool)

(assert (=> b!1580387 m!1451839))

(push 1)

(assert (not b!1580387))

(assert (not b!1580385))

(assert (not b!1580386))

(assert tp_is_empty!39205)

(assert (not start!137144))

(assert (not b!1580388))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166411 () Bool)

(declare-fun res!1079677 () Bool)

(declare-fun e!881676 () Bool)

(assert (=> d!166411 (=> res!1079677 e!881676)))

(assert (=> d!166411 (= res!1079677 (or (is-Nil!36809 l!1390) (is-Nil!36809 (t!51726 l!1390))))))

(assert (=> d!166411 (= (isStrictlySorted!1070 l!1390) e!881676)))

(declare-fun b!1580425 () Bool)

(declare-fun e!881677 () Bool)

(assert (=> b!1580425 (= e!881676 e!881677)))

(declare-fun res!1079678 () Bool)

(assert (=> b!1580425 (=> (not res!1079678) (not e!881677))))

(assert (=> b!1580425 (= res!1079678 (bvslt (_1!12766 (h!38351 l!1390)) (_1!12766 (h!38351 (t!51726 l!1390)))))))

(declare-fun b!1580426 () Bool)

(assert (=> b!1580426 (= e!881677 (isStrictlySorted!1070 (t!51726 l!1390)))))

(assert (= (and d!166411 (not res!1079677)) b!1580425))

(assert (= (and b!1580425 res!1079678) b!1580426))

(declare-fun m!1451857 () Bool)

(assert (=> b!1580426 m!1451857))

(assert (=> start!137144 d!166411))

(declare-fun d!166415 () Bool)

(declare-fun lt!676771 () Int)

(assert (=> d!166415 (>= lt!676771 0)))

(declare-fun e!881688 () Int)

(assert (=> d!166415 (= lt!676771 e!881688)))

(declare-fun c!146526 () Bool)

(assert (=> d!166415 (= c!146526 (is-Nil!36809 l!1390))))

(assert (=> d!166415 (= (ListPrimitiveSize!193 l!1390) lt!676771)))

(declare-fun b!1580439 () Bool)

(assert (=> b!1580439 (= e!881688 0)))

(declare-fun b!1580440 () Bool)

(assert (=> b!1580440 (= e!881688 (+ 1 (ListPrimitiveSize!193 (t!51726 l!1390))))))

(assert (= (and d!166415 c!146526) b!1580439))

(assert (= (and d!166415 (not c!146526)) b!1580440))

(declare-fun m!1451867 () Bool)

(assert (=> b!1580440 m!1451867))

(assert (=> b!1580387 d!166415))

(declare-fun lt!676777 () Bool)

(declare-fun d!166421 () Bool)

(declare-fun content!832 (List!36812) (Set tuple2!25510))

(assert (=> d!166421 (= lt!676777 (set.member (tuple2!25511 key!405 value!194) (content!832 l!1390)))))

(declare-fun e!881705 () Bool)

(assert (=> d!166421 (= lt!676777 e!881705)))

(declare-fun res!1079700 () Bool)

(assert (=> d!166421 (=> (not res!1079700) (not e!881705))))

(assert (=> d!166421 (= res!1079700 (is-Cons!36808 l!1390))))

(assert (=> d!166421 (= (contains!10484 l!1390 (tuple2!25511 key!405 value!194)) lt!676777)))

(declare-fun b!1580459 () Bool)

(declare-fun e!881704 () Bool)

(assert (=> b!1580459 (= e!881705 e!881704)))

(declare-fun res!1079699 () Bool)

(assert (=> b!1580459 (=> res!1079699 e!881704)))

(assert (=> b!1580459 (= res!1079699 (= (h!38351 l!1390) (tuple2!25511 key!405 value!194)))))

(declare-fun b!1580460 () Bool)

(assert (=> b!1580460 (= e!881704 (contains!10484 (t!51726 l!1390) (tuple2!25511 key!405 value!194)))))

(assert (= (and d!166421 res!1079700) b!1580459))

(assert (= (and b!1580459 (not res!1079699)) b!1580460))

(declare-fun m!1451875 () Bool)

(assert (=> d!166421 m!1451875))

(declare-fun m!1451877 () Bool)

(assert (=> d!166421 m!1451877))

(declare-fun m!1451879 () Bool)

(assert (=> b!1580460 m!1451879))

(assert (=> b!1580386 d!166421))

(declare-fun d!166429 () Bool)

(declare-fun res!1079717 () Bool)

(declare-fun e!881724 () Bool)

(assert (=> d!166429 (=> res!1079717 e!881724)))

(assert (=> d!166429 (= res!1079717 (and (is-Cons!36808 l!1390) (= (_1!12766 (h!38351 l!1390)) key!405)))))

(assert (=> d!166429 (= (containsKey!916 l!1390 key!405) e!881724)))

(declare-fun b!1580483 () Bool)

(declare-fun e!881725 () Bool)

(assert (=> b!1580483 (= e!881724 e!881725)))

(declare-fun res!1079718 () Bool)

(assert (=> b!1580483 (=> (not res!1079718) (not e!881725))))

(assert (=> b!1580483 (= res!1079718 (and (or (not (is-Cons!36808 l!1390)) (bvsle (_1!12766 (h!38351 l!1390)) key!405)) (is-Cons!36808 l!1390) (bvslt (_1!12766 (h!38351 l!1390)) key!405)))))

(declare-fun b!1580484 () Bool)

(assert (=> b!1580484 (= e!881725 (containsKey!916 (t!51726 l!1390) key!405))))

(assert (= (and d!166429 (not res!1079717)) b!1580483))

(assert (= (and b!1580483 res!1079718) b!1580484))

(declare-fun m!1451889 () Bool)

(assert (=> b!1580484 m!1451889))

(assert (=> b!1580385 d!166429))

(declare-fun b!1580498 () Bool)

(declare-fun e!881734 () Bool)

(declare-fun tp!114482 () Bool)

(assert (=> b!1580498 (= e!881734 (and tp_is_empty!39205 tp!114482))))

(assert (=> b!1580388 (= tp!114468 e!881734)))

(assert (= (and b!1580388 (is-Cons!36808 (t!51726 l!1390))) b!1580498))

(push 1)

