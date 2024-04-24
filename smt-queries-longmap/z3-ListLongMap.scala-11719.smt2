; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137564 () Bool)

(assert start!137564)

(declare-fun b!1582743 () Bool)

(declare-fun res!1080453 () Bool)

(declare-fun e!883122 () Bool)

(assert (=> b!1582743 (=> (not res!1080453) (not e!883122))))

(declare-datatypes ((B!2642 0))(
  ( (B!2643 (val!19683 Int)) )
))
(declare-datatypes ((tuple2!25546 0))(
  ( (tuple2!25547 (_1!12784 (_ BitVec 64)) (_2!12784 B!2642)) )
))
(declare-datatypes ((List!36835 0))(
  ( (Nil!36832) (Cons!36831 (h!38392 tuple2!25546) (t!51741 List!36835)) )
))
(declare-fun l!1390 () List!36835)

(declare-fun lt!677637 () tuple2!25546)

(declare-fun contains!10520 (List!36835 tuple2!25546) Bool)

(assert (=> b!1582743 (= res!1080453 (contains!10520 (t!51741 l!1390) lt!677637))))

(declare-fun b!1582744 () Bool)

(declare-fun e!883120 () Bool)

(declare-fun e!883123 () Bool)

(assert (=> b!1582744 (= e!883120 e!883123)))

(declare-fun res!1080459 () Bool)

(assert (=> b!1582744 (=> (not res!1080459) (not e!883123))))

(assert (=> b!1582744 (= res!1080459 (contains!10520 l!1390 lt!677637))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun value!194 () B!2642)

(assert (=> b!1582744 (= lt!677637 (tuple2!25547 key!405 value!194))))

(declare-fun b!1582745 () Bool)

(assert (=> b!1582745 (= e!883123 e!883122)))

(declare-fun res!1080460 () Bool)

(assert (=> b!1582745 (=> (not res!1080460) (not e!883122))))

(declare-fun e!883124 () Bool)

(assert (=> b!1582745 (= res!1080460 e!883124)))

(declare-fun res!1080461 () Bool)

(assert (=> b!1582745 (=> res!1080461 e!883124)))

(declare-datatypes ((tuple2!25548 0))(
  ( (tuple2!25549 (_1!12785 tuple2!25546) (_2!12785 List!36835)) )
))
(declare-datatypes ((Option!891 0))(
  ( (Some!890 (v!22385 tuple2!25548)) (None!889) )
))
(declare-fun lt!677635 () Option!891)

(declare-fun isEmpty!1166 (Option!891) Bool)

(assert (=> b!1582745 (= res!1080461 (isEmpty!1166 lt!677635))))

(declare-fun unapply!79 (List!36835) Option!891)

(assert (=> b!1582745 (= lt!677635 (unapply!79 l!1390))))

(declare-fun b!1582746 () Bool)

(get-info :version)

(declare-fun get!26826 (Option!891) tuple2!25548)

(assert (=> b!1582746 (= e!883124 (not ((_ is Nil!36832) (_2!12785 (get!26826 lt!677635)))))))

(declare-fun b!1582747 () Bool)

(declare-fun res!1080457 () Bool)

(assert (=> b!1582747 (=> (not res!1080457) (not e!883122))))

(declare-fun containsKey!908 (List!36835 (_ BitVec 64)) Bool)

(assert (=> b!1582747 (= res!1080457 (containsKey!908 (t!51741 l!1390) key!405))))

(declare-fun b!1582748 () Bool)

(declare-fun res!1080454 () Bool)

(assert (=> b!1582748 (=> (not res!1080454) (not e!883122))))

(assert (=> b!1582748 (= res!1080454 (and (or (not ((_ is Cons!36831) l!1390)) (not (= (_1!12784 (h!38392 l!1390)) key!405))) ((_ is Cons!36831) l!1390)))))

(declare-fun b!1582749 () Bool)

(declare-fun res!1080455 () Bool)

(assert (=> b!1582749 (=> (not res!1080455) (not e!883120))))

(assert (=> b!1582749 (= res!1080455 (containsKey!908 l!1390 key!405))))

(declare-fun res!1080458 () Bool)

(assert (=> start!137564 (=> (not res!1080458) (not e!883120))))

(declare-fun isStrictlySorted!1049 (List!36835) Bool)

(assert (=> start!137564 (= res!1080458 (isStrictlySorted!1049 l!1390))))

(assert (=> start!137564 e!883120))

(declare-fun e!883121 () Bool)

(assert (=> start!137564 e!883121))

(assert (=> start!137564 true))

(declare-fun tp_is_empty!39187 () Bool)

(assert (=> start!137564 tp_is_empty!39187))

(declare-fun b!1582750 () Bool)

(assert (=> b!1582750 (= e!883122 (not true))))

(declare-datatypes ((Option!892 0))(
  ( (Some!891 (v!22386 B!2642)) (None!890) )
))
(declare-fun getValueByKey!807 (List!36835 (_ BitVec 64)) Option!892)

(assert (=> b!1582750 (= (getValueByKey!807 (t!51741 l!1390) key!405) (Some!891 value!194))))

(declare-datatypes ((Unit!52147 0))(
  ( (Unit!52148) )
))
(declare-fun lt!677636 () Unit!52147)

(declare-fun lemmaContainsTupThenGetReturnValue!396 (List!36835 (_ BitVec 64) B!2642) Unit!52147)

(assert (=> b!1582750 (= lt!677636 (lemmaContainsTupThenGetReturnValue!396 (t!51741 l!1390) key!405 value!194))))

(declare-fun b!1582751 () Bool)

(declare-fun res!1080456 () Bool)

(assert (=> b!1582751 (=> (not res!1080456) (not e!883122))))

(assert (=> b!1582751 (= res!1080456 (isStrictlySorted!1049 (t!51741 l!1390)))))

(declare-fun b!1582752 () Bool)

(declare-fun tp!114441 () Bool)

(assert (=> b!1582752 (= e!883121 (and tp_is_empty!39187 tp!114441))))

(assert (= (and start!137564 res!1080458) b!1582749))

(assert (= (and b!1582749 res!1080455) b!1582744))

(assert (= (and b!1582744 res!1080459) b!1582745))

(assert (= (and b!1582745 (not res!1080461)) b!1582746))

(assert (= (and b!1582745 res!1080460) b!1582748))

(assert (= (and b!1582748 res!1080454) b!1582751))

(assert (= (and b!1582751 res!1080456) b!1582747))

(assert (= (and b!1582747 res!1080457) b!1582743))

(assert (= (and b!1582743 res!1080453) b!1582750))

(assert (= (and start!137564 ((_ is Cons!36831) l!1390)) b!1582752))

(declare-fun m!1454043 () Bool)

(assert (=> b!1582745 m!1454043))

(declare-fun m!1454045 () Bool)

(assert (=> b!1582745 m!1454045))

(declare-fun m!1454047 () Bool)

(assert (=> b!1582743 m!1454047))

(declare-fun m!1454049 () Bool)

(assert (=> start!137564 m!1454049))

(declare-fun m!1454051 () Bool)

(assert (=> b!1582750 m!1454051))

(declare-fun m!1454053 () Bool)

(assert (=> b!1582750 m!1454053))

(declare-fun m!1454055 () Bool)

(assert (=> b!1582749 m!1454055))

(declare-fun m!1454057 () Bool)

(assert (=> b!1582751 m!1454057))

(declare-fun m!1454059 () Bool)

(assert (=> b!1582746 m!1454059))

(declare-fun m!1454061 () Bool)

(assert (=> b!1582744 m!1454061))

(declare-fun m!1454063 () Bool)

(assert (=> b!1582747 m!1454063))

(check-sat (not b!1582746) (not b!1582752) (not b!1582744) (not b!1582745) (not b!1582750) (not b!1582743) (not start!137564) (not b!1582751) (not b!1582749) tp_is_empty!39187 (not b!1582747))
(check-sat)
