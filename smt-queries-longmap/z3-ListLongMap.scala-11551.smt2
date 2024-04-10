; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134470 () Bool)

(assert start!134470)

(declare-fun res!1072786 () Bool)

(declare-fun e!875137 () Bool)

(assert (=> start!134470 (=> (not res!1072786) (not e!875137))))

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun key2!21 () (_ BitVec 64))

(assert (=> start!134470 (= res!1072786 (not (= key1!37 key2!21)))))

(assert (=> start!134470 e!875137))

(assert (=> start!134470 true))

(declare-fun e!875138 () Bool)

(assert (=> start!134470 e!875138))

(declare-fun b!1569809 () Bool)

(declare-fun res!1072788 () Bool)

(assert (=> b!1569809 (=> (not res!1072788) (not e!875137))))

(declare-datatypes ((B!2542 0))(
  ( (B!2543 (val!19633 Int)) )
))
(declare-datatypes ((tuple2!25368 0))(
  ( (tuple2!25369 (_1!12695 (_ BitVec 64)) (_2!12695 B!2542)) )
))
(declare-datatypes ((List!36753 0))(
  ( (Nil!36750) (Cons!36749 (h!38196 tuple2!25368) (t!51661 List!36753)) )
))
(declare-fun l!750 () List!36753)

(declare-fun isStrictlySorted!1017 (List!36753) Bool)

(assert (=> b!1569809 (= res!1072788 (isStrictlySorted!1017 (t!51661 l!750)))))

(declare-fun b!1569810 () Bool)

(declare-fun tp_is_empty!39093 () Bool)

(declare-fun tp!114195 () Bool)

(assert (=> b!1569810 (= e!875138 (and tp_is_empty!39093 tp!114195))))

(declare-fun b!1569811 () Bool)

(declare-fun res!1072785 () Bool)

(assert (=> b!1569811 (=> (not res!1072785) (not e!875137))))

(get-info :version)

(assert (=> b!1569811 (= res!1072785 (and ((_ is Cons!36749) l!750) (bvslt (_1!12695 (h!38196 l!750)) key1!37) (bvslt (_1!12695 (h!38196 l!750)) key2!21)))))

(declare-fun b!1569812 () Bool)

(declare-fun res!1072787 () Bool)

(assert (=> b!1569812 (=> (not res!1072787) (not e!875137))))

(assert (=> b!1569812 (= res!1072787 (isStrictlySorted!1017 l!750))))

(declare-fun b!1569813 () Bool)

(declare-fun ListPrimitiveSize!191 (List!36753) Int)

(assert (=> b!1569813 (= e!875137 (>= (ListPrimitiveSize!191 (t!51661 l!750)) (ListPrimitiveSize!191 l!750)))))

(assert (= (and start!134470 res!1072786) b!1569812))

(assert (= (and b!1569812 res!1072787) b!1569811))

(assert (= (and b!1569811 res!1072785) b!1569809))

(assert (= (and b!1569809 res!1072788) b!1569813))

(assert (= (and start!134470 ((_ is Cons!36749) l!750)) b!1569810))

(declare-fun m!1443909 () Bool)

(assert (=> b!1569809 m!1443909))

(declare-fun m!1443911 () Bool)

(assert (=> b!1569812 m!1443911))

(declare-fun m!1443913 () Bool)

(assert (=> b!1569813 m!1443913))

(declare-fun m!1443915 () Bool)

(assert (=> b!1569813 m!1443915))

(check-sat (not b!1569809) (not b!1569813) tp_is_empty!39093 (not b!1569810) (not b!1569812))
(check-sat)
(get-model)

(declare-fun d!163947 () Bool)

(declare-fun res!1072805 () Bool)

(declare-fun e!875149 () Bool)

(assert (=> d!163947 (=> res!1072805 e!875149)))

(assert (=> d!163947 (= res!1072805 (or ((_ is Nil!36750) l!750) ((_ is Nil!36750) (t!51661 l!750))))))

(assert (=> d!163947 (= (isStrictlySorted!1017 l!750) e!875149)))

(declare-fun b!1569833 () Bool)

(declare-fun e!875150 () Bool)

(assert (=> b!1569833 (= e!875149 e!875150)))

(declare-fun res!1072806 () Bool)

(assert (=> b!1569833 (=> (not res!1072806) (not e!875150))))

(assert (=> b!1569833 (= res!1072806 (bvslt (_1!12695 (h!38196 l!750)) (_1!12695 (h!38196 (t!51661 l!750)))))))

(declare-fun b!1569834 () Bool)

(assert (=> b!1569834 (= e!875150 (isStrictlySorted!1017 (t!51661 l!750)))))

(assert (= (and d!163947 (not res!1072805)) b!1569833))

(assert (= (and b!1569833 res!1072806) b!1569834))

(assert (=> b!1569834 m!1443909))

(assert (=> b!1569812 d!163947))

(declare-fun d!163949 () Bool)

(declare-fun res!1072807 () Bool)

(declare-fun e!875151 () Bool)

(assert (=> d!163949 (=> res!1072807 e!875151)))

(assert (=> d!163949 (= res!1072807 (or ((_ is Nil!36750) (t!51661 l!750)) ((_ is Nil!36750) (t!51661 (t!51661 l!750)))))))

(assert (=> d!163949 (= (isStrictlySorted!1017 (t!51661 l!750)) e!875151)))

(declare-fun b!1569835 () Bool)

(declare-fun e!875152 () Bool)

(assert (=> b!1569835 (= e!875151 e!875152)))

(declare-fun res!1072808 () Bool)

(assert (=> b!1569835 (=> (not res!1072808) (not e!875152))))

(assert (=> b!1569835 (= res!1072808 (bvslt (_1!12695 (h!38196 (t!51661 l!750))) (_1!12695 (h!38196 (t!51661 (t!51661 l!750))))))))

(declare-fun b!1569836 () Bool)

(assert (=> b!1569836 (= e!875152 (isStrictlySorted!1017 (t!51661 (t!51661 l!750))))))

(assert (= (and d!163949 (not res!1072807)) b!1569835))

(assert (= (and b!1569835 res!1072808) b!1569836))

(declare-fun m!1443925 () Bool)

(assert (=> b!1569836 m!1443925))

(assert (=> b!1569809 d!163949))

(declare-fun d!163951 () Bool)

(declare-fun lt!673327 () Int)

(assert (=> d!163951 (>= lt!673327 0)))

(declare-fun e!875155 () Int)

(assert (=> d!163951 (= lt!673327 e!875155)))

(declare-fun c!144786 () Bool)

(assert (=> d!163951 (= c!144786 ((_ is Nil!36750) (t!51661 l!750)))))

(assert (=> d!163951 (= (ListPrimitiveSize!191 (t!51661 l!750)) lt!673327)))

(declare-fun b!1569841 () Bool)

(assert (=> b!1569841 (= e!875155 0)))

(declare-fun b!1569842 () Bool)

(assert (=> b!1569842 (= e!875155 (+ 1 (ListPrimitiveSize!191 (t!51661 (t!51661 l!750)))))))

(assert (= (and d!163951 c!144786) b!1569841))

(assert (= (and d!163951 (not c!144786)) b!1569842))

(declare-fun m!1443927 () Bool)

(assert (=> b!1569842 m!1443927))

(assert (=> b!1569813 d!163951))

(declare-fun d!163955 () Bool)

(declare-fun lt!673328 () Int)

(assert (=> d!163955 (>= lt!673328 0)))

(declare-fun e!875156 () Int)

(assert (=> d!163955 (= lt!673328 e!875156)))

(declare-fun c!144787 () Bool)

(assert (=> d!163955 (= c!144787 ((_ is Nil!36750) l!750))))

(assert (=> d!163955 (= (ListPrimitiveSize!191 l!750) lt!673328)))

(declare-fun b!1569843 () Bool)

(assert (=> b!1569843 (= e!875156 0)))

(declare-fun b!1569844 () Bool)

(assert (=> b!1569844 (= e!875156 (+ 1 (ListPrimitiveSize!191 (t!51661 l!750))))))

(assert (= (and d!163955 c!144787) b!1569843))

(assert (= (and d!163955 (not c!144787)) b!1569844))

(assert (=> b!1569844 m!1443913))

(assert (=> b!1569813 d!163955))

(declare-fun b!1569849 () Bool)

(declare-fun e!875159 () Bool)

(declare-fun tp!114201 () Bool)

(assert (=> b!1569849 (= e!875159 (and tp_is_empty!39093 tp!114201))))

(assert (=> b!1569810 (= tp!114195 e!875159)))

(assert (= (and b!1569810 ((_ is Cons!36749) (t!51661 l!750))) b!1569849))

(check-sat (not b!1569836) (not b!1569834) (not b!1569844) tp_is_empty!39093 (not b!1569849) (not b!1569842))
(check-sat)
