; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138014 () Bool)

(assert start!138014)

(declare-fun e!884452 () Bool)

(declare-datatypes ((B!2738 0))(
  ( (B!2739 (val!19731 Int)) )
))
(declare-datatypes ((tuple2!25690 0))(
  ( (tuple2!25691 (_1!12856 (_ BitVec 64)) (_2!12856 B!2738)) )
))
(declare-datatypes ((List!36883 0))(
  ( (Nil!36880) (Cons!36879 (h!38440 tuple2!25690) (t!51789 List!36883)) )
))
(declare-fun l!1356 () List!36883)

(declare-fun value!184 () B!2738)

(declare-fun key!387 () (_ BitVec 64))

(declare-fun b!1584623 () Bool)

(declare-fun contains!10559 (List!36883 tuple2!25690) Bool)

(assert (=> b!1584623 (= e!884452 (contains!10559 l!1356 (tuple2!25691 key!387 value!184)))))

(declare-fun b!1584624 () Bool)

(declare-fun e!884453 () Bool)

(declare-fun tp_is_empty!39283 () Bool)

(declare-fun tp!114678 () Bool)

(assert (=> b!1584624 (= e!884453 (and tp_is_empty!39283 tp!114678))))

(declare-fun b!1584622 () Bool)

(declare-fun res!1081790 () Bool)

(assert (=> b!1584622 (=> (not res!1081790) (not e!884452))))

(get-info :version)

(assert (=> b!1584622 (= res!1081790 ((_ is Nil!36880) l!1356))))

(declare-fun res!1081789 () Bool)

(assert (=> start!138014 (=> (not res!1081789) (not e!884452))))

(declare-fun isStrictlySorted!1094 (List!36883) Bool)

(assert (=> start!138014 (= res!1081789 (isStrictlySorted!1094 l!1356))))

(assert (=> start!138014 e!884452))

(assert (=> start!138014 e!884453))

(assert (=> start!138014 true))

(assert (=> start!138014 tp_is_empty!39283))

(declare-fun b!1584621 () Bool)

(declare-fun res!1081788 () Bool)

(assert (=> b!1584621 (=> (not res!1081788) (not e!884452))))

(declare-fun containsKey!953 (List!36883 (_ BitVec 64)) Bool)

(assert (=> b!1584621 (= res!1081788 (not (containsKey!953 l!1356 key!387)))))

(assert (= (and start!138014 res!1081789) b!1584621))

(assert (= (and b!1584621 res!1081788) b!1584622))

(assert (= (and b!1584622 res!1081790) b!1584623))

(assert (= (and start!138014 ((_ is Cons!36879) l!1356)) b!1584624))

(declare-fun m!1455057 () Bool)

(assert (=> b!1584623 m!1455057))

(declare-fun m!1455059 () Bool)

(assert (=> start!138014 m!1455059))

(declare-fun m!1455061 () Bool)

(assert (=> b!1584621 m!1455061))

(check-sat (not b!1584621) (not b!1584624) tp_is_empty!39283 (not b!1584623) (not start!138014))
(check-sat)
(get-model)

(declare-fun d!167641 () Bool)

(declare-fun res!1081823 () Bool)

(declare-fun e!884480 () Bool)

(assert (=> d!167641 (=> res!1081823 e!884480)))

(assert (=> d!167641 (= res!1081823 (and ((_ is Cons!36879) l!1356) (= (_1!12856 (h!38440 l!1356)) key!387)))))

(assert (=> d!167641 (= (containsKey!953 l!1356 key!387) e!884480)))

(declare-fun b!1584663 () Bool)

(declare-fun e!884481 () Bool)

(assert (=> b!1584663 (= e!884480 e!884481)))

(declare-fun res!1081824 () Bool)

(assert (=> b!1584663 (=> (not res!1081824) (not e!884481))))

(assert (=> b!1584663 (= res!1081824 (and (or (not ((_ is Cons!36879) l!1356)) (bvsle (_1!12856 (h!38440 l!1356)) key!387)) ((_ is Cons!36879) l!1356) (bvslt (_1!12856 (h!38440 l!1356)) key!387)))))

(declare-fun b!1584664 () Bool)

(assert (=> b!1584664 (= e!884481 (containsKey!953 (t!51789 l!1356) key!387))))

(assert (= (and d!167641 (not res!1081823)) b!1584663))

(assert (= (and b!1584663 res!1081824) b!1584664))

(declare-fun m!1455077 () Bool)

(assert (=> b!1584664 m!1455077))

(assert (=> b!1584621 d!167641))

(declare-fun d!167649 () Bool)

(declare-fun lt!677959 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!841 (List!36883) (InoxSet tuple2!25690))

(assert (=> d!167649 (= lt!677959 (select (content!841 l!1356) (tuple2!25691 key!387 value!184)))))

(declare-fun e!884497 () Bool)

(assert (=> d!167649 (= lt!677959 e!884497)))

(declare-fun res!1081841 () Bool)

(assert (=> d!167649 (=> (not res!1081841) (not e!884497))))

(assert (=> d!167649 (= res!1081841 ((_ is Cons!36879) l!1356))))

(assert (=> d!167649 (= (contains!10559 l!1356 (tuple2!25691 key!387 value!184)) lt!677959)))

(declare-fun b!1584681 () Bool)

(declare-fun e!884499 () Bool)

(assert (=> b!1584681 (= e!884497 e!884499)))

(declare-fun res!1081842 () Bool)

(assert (=> b!1584681 (=> res!1081842 e!884499)))

(assert (=> b!1584681 (= res!1081842 (= (h!38440 l!1356) (tuple2!25691 key!387 value!184)))))

(declare-fun b!1584682 () Bool)

(assert (=> b!1584682 (= e!884499 (contains!10559 (t!51789 l!1356) (tuple2!25691 key!387 value!184)))))

(assert (= (and d!167649 res!1081841) b!1584681))

(assert (= (and b!1584681 (not res!1081842)) b!1584682))

(declare-fun m!1455081 () Bool)

(assert (=> d!167649 m!1455081))

(declare-fun m!1455085 () Bool)

(assert (=> d!167649 m!1455085))

(declare-fun m!1455089 () Bool)

(assert (=> b!1584682 m!1455089))

(assert (=> b!1584623 d!167649))

(declare-fun d!167653 () Bool)

(declare-fun res!1081859 () Bool)

(declare-fun e!884516 () Bool)

(assert (=> d!167653 (=> res!1081859 e!884516)))

(assert (=> d!167653 (= res!1081859 (or ((_ is Nil!36880) l!1356) ((_ is Nil!36880) (t!51789 l!1356))))))

(assert (=> d!167653 (= (isStrictlySorted!1094 l!1356) e!884516)))

(declare-fun b!1584699 () Bool)

(declare-fun e!884517 () Bool)

(assert (=> b!1584699 (= e!884516 e!884517)))

(declare-fun res!1081860 () Bool)

(assert (=> b!1584699 (=> (not res!1081860) (not e!884517))))

(assert (=> b!1584699 (= res!1081860 (bvslt (_1!12856 (h!38440 l!1356)) (_1!12856 (h!38440 (t!51789 l!1356)))))))

(declare-fun b!1584700 () Bool)

(assert (=> b!1584700 (= e!884517 (isStrictlySorted!1094 (t!51789 l!1356)))))

(assert (= (and d!167653 (not res!1081859)) b!1584699))

(assert (= (and b!1584699 res!1081860) b!1584700))

(declare-fun m!1455101 () Bool)

(assert (=> b!1584700 m!1455101))

(assert (=> start!138014 d!167653))

(declare-fun b!1584712 () Bool)

(declare-fun e!884525 () Bool)

(declare-fun tp!114690 () Bool)

(assert (=> b!1584712 (= e!884525 (and tp_is_empty!39283 tp!114690))))

(assert (=> b!1584624 (= tp!114678 e!884525)))

(assert (= (and b!1584624 ((_ is Cons!36879) (t!51789 l!1356))) b!1584712))

(check-sat (not b!1584664) (not b!1584700) (not b!1584712) (not d!167649) (not b!1584682) tp_is_empty!39283)
(check-sat)
