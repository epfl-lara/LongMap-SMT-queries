; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137116 () Bool)

(assert start!137116)

(declare-fun b!1580116 () Bool)

(declare-fun res!1079417 () Bool)

(declare-fun e!881502 () Bool)

(assert (=> b!1580116 (=> (not res!1079417) (not e!881502))))

(declare-datatypes ((B!2632 0))(
  ( (B!2633 (val!19678 Int)) )
))
(declare-datatypes ((tuple2!25466 0))(
  ( (tuple2!25467 (_1!12744 (_ BitVec 64)) (_2!12744 B!2632)) )
))
(declare-datatypes ((List!36798 0))(
  ( (Nil!36795) (Cons!36794 (h!38337 tuple2!25466) (t!51712 List!36798)) )
))
(declare-fun l!1390 () List!36798)

(declare-fun isStrictlySorted!1056 (List!36798) Bool)

(assert (=> b!1580116 (= res!1079417 (isStrictlySorted!1056 (t!51712 l!1390)))))

(declare-fun res!1079418 () Bool)

(declare-fun e!881500 () Bool)

(assert (=> start!137116 (=> (not res!1079418) (not e!881500))))

(assert (=> start!137116 (= res!1079418 (isStrictlySorted!1056 l!1390))))

(assert (=> start!137116 e!881500))

(declare-fun e!881504 () Bool)

(assert (=> start!137116 e!881504))

(assert (=> start!137116 true))

(declare-fun tp_is_empty!39177 () Bool)

(assert (=> start!137116 tp_is_empty!39177))

(declare-fun b!1580117 () Bool)

(declare-fun e!881501 () Bool)

(assert (=> b!1580117 (= e!881500 e!881501)))

(declare-fun res!1079423 () Bool)

(assert (=> b!1580117 (=> (not res!1079423) (not e!881501))))

(declare-fun lt!676682 () tuple2!25466)

(declare-fun contains!10470 (List!36798 tuple2!25466) Bool)

(assert (=> b!1580117 (= res!1079423 (contains!10470 l!1390 lt!676682))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun value!194 () B!2632)

(assert (=> b!1580117 (= lt!676682 (tuple2!25467 key!405 value!194))))

(declare-fun b!1580118 () Bool)

(assert (=> b!1580118 (= e!881502 (not true))))

(assert (=> b!1580118 (not (contains!10470 (t!51712 l!1390) lt!676682))))

(declare-datatypes ((Unit!52236 0))(
  ( (Unit!52237) )
))
(declare-fun lt!676684 () Unit!52236)

(declare-fun lemmaNotContainsKeyThenNotContainsTuple!2 (List!36798 (_ BitVec 64) B!2632) Unit!52236)

(assert (=> b!1580118 (= lt!676684 (lemmaNotContainsKeyThenNotContainsTuple!2 (t!51712 l!1390) key!405 value!194))))

(declare-fun b!1580119 () Bool)

(assert (=> b!1580119 (= e!881501 e!881502)))

(declare-fun res!1079420 () Bool)

(assert (=> b!1580119 (=> (not res!1079420) (not e!881502))))

(declare-fun e!881503 () Bool)

(assert (=> b!1580119 (= res!1079420 e!881503)))

(declare-fun res!1079424 () Bool)

(assert (=> b!1580119 (=> res!1079424 e!881503)))

(declare-datatypes ((tuple2!25468 0))(
  ( (tuple2!25469 (_1!12745 tuple2!25466) (_2!12745 List!36798)) )
))
(declare-datatypes ((Option!891 0))(
  ( (Some!890 (v!22388 tuple2!25468)) (None!889) )
))
(declare-fun lt!676683 () Option!891)

(declare-fun isEmpty!1158 (Option!891) Bool)

(assert (=> b!1580119 (= res!1079424 (isEmpty!1158 lt!676683))))

(declare-fun unapply!74 (List!36798) Option!891)

(assert (=> b!1580119 (= lt!676683 (unapply!74 l!1390))))

(declare-fun b!1580120 () Bool)

(declare-fun tp!114426 () Bool)

(assert (=> b!1580120 (= e!881504 (and tp_is_empty!39177 tp!114426))))

(declare-fun b!1580121 () Bool)

(declare-fun res!1079421 () Bool)

(assert (=> b!1580121 (=> (not res!1079421) (not e!881502))))

(get-info :version)

(assert (=> b!1580121 (= res!1079421 (and ((_ is Cons!36794) l!1390) (= (_1!12744 (h!38337 l!1390)) key!405)))))

(declare-fun b!1580122 () Bool)

(declare-fun get!26773 (Option!891) tuple2!25468)

(assert (=> b!1580122 (= e!881503 (not ((_ is Nil!36795) (_2!12745 (get!26773 lt!676683)))))))

(declare-fun b!1580123 () Bool)

(declare-fun res!1079422 () Bool)

(assert (=> b!1580123 (=> (not res!1079422) (not e!881502))))

(declare-fun containsKey!902 (List!36798 (_ BitVec 64)) Bool)

(assert (=> b!1580123 (= res!1079422 (not (containsKey!902 (t!51712 l!1390) key!405)))))

(declare-fun b!1580124 () Bool)

(declare-fun res!1079419 () Bool)

(assert (=> b!1580124 (=> (not res!1079419) (not e!881500))))

(assert (=> b!1580124 (= res!1079419 (containsKey!902 l!1390 key!405))))

(assert (= (and start!137116 res!1079418) b!1580124))

(assert (= (and b!1580124 res!1079419) b!1580117))

(assert (= (and b!1580117 res!1079423) b!1580119))

(assert (= (and b!1580119 (not res!1079424)) b!1580122))

(assert (= (and b!1580119 res!1079420) b!1580121))

(assert (= (and b!1580121 res!1079421) b!1580116))

(assert (= (and b!1580116 res!1079417) b!1580123))

(assert (= (and b!1580123 res!1079422) b!1580118))

(assert (= (and start!137116 ((_ is Cons!36794) l!1390)) b!1580120))

(declare-fun m!1451637 () Bool)

(assert (=> b!1580123 m!1451637))

(declare-fun m!1451639 () Bool)

(assert (=> b!1580119 m!1451639))

(declare-fun m!1451641 () Bool)

(assert (=> b!1580119 m!1451641))

(declare-fun m!1451643 () Bool)

(assert (=> b!1580116 m!1451643))

(declare-fun m!1451645 () Bool)

(assert (=> start!137116 m!1451645))

(declare-fun m!1451647 () Bool)

(assert (=> b!1580124 m!1451647))

(declare-fun m!1451649 () Bool)

(assert (=> b!1580118 m!1451649))

(declare-fun m!1451651 () Bool)

(assert (=> b!1580118 m!1451651))

(declare-fun m!1451653 () Bool)

(assert (=> b!1580122 m!1451653))

(declare-fun m!1451655 () Bool)

(assert (=> b!1580117 m!1451655))

(check-sat (not b!1580123) (not b!1580120) (not start!137116) (not b!1580118) (not b!1580117) (not b!1580116) (not b!1580124) (not b!1580119) tp_is_empty!39177 (not b!1580122))
(check-sat)
