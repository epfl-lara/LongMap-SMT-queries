; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134406 () Bool)

(assert start!134406)

(declare-fun res!1072593 () Bool)

(declare-fun e!874882 () Bool)

(assert (=> start!134406 (=> (not res!1072593) (not e!874882))))

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun key2!21 () (_ BitVec 64))

(assert (=> start!134406 (= res!1072593 (not (= key1!37 key2!21)))))

(assert (=> start!134406 e!874882))

(assert (=> start!134406 true))

(declare-fun e!874883 () Bool)

(assert (=> start!134406 e!874883))

(declare-fun b!1569404 () Bool)

(declare-fun res!1072591 () Bool)

(assert (=> b!1569404 (=> (not res!1072591) (not e!874882))))

(declare-datatypes ((B!2534 0))(
  ( (B!2535 (val!19629 Int)) )
))
(declare-datatypes ((tuple2!25428 0))(
  ( (tuple2!25429 (_1!12725 (_ BitVec 64)) (_2!12725 B!2534)) )
))
(declare-datatypes ((List!36790 0))(
  ( (Nil!36787) (Cons!36786 (h!38234 tuple2!25428) (t!51690 List!36790)) )
))
(declare-fun l!750 () List!36790)

(declare-fun isStrictlySorted!1011 (List!36790) Bool)

(assert (=> b!1569404 (= res!1072591 (isStrictlySorted!1011 l!750))))

(declare-fun b!1569406 () Bool)

(assert (=> b!1569406 (= e!874882 (not (isStrictlySorted!1011 (t!51690 l!750))))))

(declare-fun b!1569407 () Bool)

(declare-fun tp_is_empty!39085 () Bool)

(declare-fun tp!114175 () Bool)

(assert (=> b!1569407 (= e!874883 (and tp_is_empty!39085 tp!114175))))

(declare-fun b!1569405 () Bool)

(declare-fun res!1072592 () Bool)

(assert (=> b!1569405 (=> (not res!1072592) (not e!874882))))

(get-info :version)

(assert (=> b!1569405 (= res!1072592 (and ((_ is Cons!36786) l!750) (bvslt (_1!12725 (h!38234 l!750)) key1!37) (bvslt (_1!12725 (h!38234 l!750)) key2!21)))))

(assert (= (and start!134406 res!1072593) b!1569404))

(assert (= (and b!1569404 res!1072591) b!1569405))

(assert (= (and b!1569405 res!1072592) b!1569406))

(assert (= (and start!134406 ((_ is Cons!36786) l!750)) b!1569407))

(declare-fun m!1442991 () Bool)

(assert (=> b!1569404 m!1442991))

(declare-fun m!1442993 () Bool)

(assert (=> b!1569406 m!1442993))

(check-sat (not b!1569406) (not b!1569404) (not b!1569407) tp_is_empty!39085)
(check-sat)
(get-model)

(declare-fun d!163679 () Bool)

(declare-fun res!1072616 () Bool)

(declare-fun e!874900 () Bool)

(assert (=> d!163679 (=> res!1072616 e!874900)))

(assert (=> d!163679 (= res!1072616 (or ((_ is Nil!36787) (t!51690 l!750)) ((_ is Nil!36787) (t!51690 (t!51690 l!750)))))))

(assert (=> d!163679 (= (isStrictlySorted!1011 (t!51690 l!750)) e!874900)))

(declare-fun b!1569436 () Bool)

(declare-fun e!874901 () Bool)

(assert (=> b!1569436 (= e!874900 e!874901)))

(declare-fun res!1072617 () Bool)

(assert (=> b!1569436 (=> (not res!1072617) (not e!874901))))

(assert (=> b!1569436 (= res!1072617 (bvslt (_1!12725 (h!38234 (t!51690 l!750))) (_1!12725 (h!38234 (t!51690 (t!51690 l!750))))))))

(declare-fun b!1569437 () Bool)

(assert (=> b!1569437 (= e!874901 (isStrictlySorted!1011 (t!51690 (t!51690 l!750))))))

(assert (= (and d!163679 (not res!1072616)) b!1569436))

(assert (= (and b!1569436 res!1072617) b!1569437))

(declare-fun m!1443003 () Bool)

(assert (=> b!1569437 m!1443003))

(assert (=> b!1569406 d!163679))

(declare-fun d!163681 () Bool)

(declare-fun res!1072618 () Bool)

(declare-fun e!874902 () Bool)

(assert (=> d!163681 (=> res!1072618 e!874902)))

(assert (=> d!163681 (= res!1072618 (or ((_ is Nil!36787) l!750) ((_ is Nil!36787) (t!51690 l!750))))))

(assert (=> d!163681 (= (isStrictlySorted!1011 l!750) e!874902)))

(declare-fun b!1569438 () Bool)

(declare-fun e!874903 () Bool)

(assert (=> b!1569438 (= e!874902 e!874903)))

(declare-fun res!1072619 () Bool)

(assert (=> b!1569438 (=> (not res!1072619) (not e!874903))))

(assert (=> b!1569438 (= res!1072619 (bvslt (_1!12725 (h!38234 l!750)) (_1!12725 (h!38234 (t!51690 l!750)))))))

(declare-fun b!1569439 () Bool)

(assert (=> b!1569439 (= e!874903 (isStrictlySorted!1011 (t!51690 l!750)))))

(assert (= (and d!163681 (not res!1072618)) b!1569438))

(assert (= (and b!1569438 res!1072619) b!1569439))

(assert (=> b!1569439 m!1442993))

(assert (=> b!1569404 d!163681))

(declare-fun b!1569444 () Bool)

(declare-fun e!874906 () Bool)

(declare-fun tp!114184 () Bool)

(assert (=> b!1569444 (= e!874906 (and tp_is_empty!39085 tp!114184))))

(assert (=> b!1569407 (= tp!114175 e!874906)))

(assert (= (and b!1569407 ((_ is Cons!36786) (t!51690 l!750))) b!1569444))

(check-sat (not b!1569439) (not b!1569437) (not b!1569444) tp_is_empty!39085)
(check-sat)
