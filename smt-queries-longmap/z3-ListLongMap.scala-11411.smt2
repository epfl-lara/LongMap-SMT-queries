; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132828 () Bool)

(assert start!132828)

(declare-fun b!1555846 () Bool)

(declare-fun res!1064526 () Bool)

(declare-fun e!866497 () Bool)

(assert (=> b!1555846 (=> (not res!1064526) (not e!866497))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-datatypes ((B!2342 0))(
  ( (B!2343 (val!19257 Int)) )
))
(declare-datatypes ((tuple2!24962 0))(
  ( (tuple2!24963 (_1!12492 (_ BitVec 64)) (_2!12492 B!2342)) )
))
(declare-datatypes ((List!36336 0))(
  ( (Nil!36333) (Cons!36332 (h!37779 tuple2!24962) (t!51049 List!36336)) )
))
(declare-fun l!1177 () List!36336)

(get-info :version)

(assert (=> b!1555846 (= res!1064526 (and (not (= newKey!105 otherKey!50)) ((_ is Cons!36332) l!1177) (not (= (_1!12492 (h!37779 l!1177)) otherKey!50))))))

(declare-fun b!1555848 () Bool)

(declare-fun ListPrimitiveSize!178 (List!36336) Int)

(assert (=> b!1555848 (= e!866497 (>= (ListPrimitiveSize!178 (t!51049 l!1177)) (ListPrimitiveSize!178 l!1177)))))

(declare-fun res!1064527 () Bool)

(assert (=> start!132828 (=> (not res!1064527) (not e!866497))))

(declare-fun isStrictlySorted!942 (List!36336) Bool)

(assert (=> start!132828 (= res!1064527 (isStrictlySorted!942 l!1177))))

(assert (=> start!132828 e!866497))

(declare-fun e!866498 () Bool)

(assert (=> start!132828 e!866498))

(assert (=> start!132828 true))

(declare-fun b!1555847 () Bool)

(declare-fun res!1064525 () Bool)

(assert (=> b!1555847 (=> (not res!1064525) (not e!866497))))

(assert (=> b!1555847 (= res!1064525 (isStrictlySorted!942 (t!51049 l!1177)))))

(declare-fun b!1555849 () Bool)

(declare-fun tp_is_empty!38353 () Bool)

(declare-fun tp!112408 () Bool)

(assert (=> b!1555849 (= e!866498 (and tp_is_empty!38353 tp!112408))))

(assert (= (and start!132828 res!1064527) b!1555846))

(assert (= (and b!1555846 res!1064526) b!1555847))

(assert (= (and b!1555847 res!1064525) b!1555848))

(assert (= (and start!132828 ((_ is Cons!36332) l!1177)) b!1555849))

(declare-fun m!1432901 () Bool)

(assert (=> b!1555848 m!1432901))

(declare-fun m!1432903 () Bool)

(assert (=> b!1555848 m!1432903))

(declare-fun m!1432905 () Bool)

(assert (=> start!132828 m!1432905))

(declare-fun m!1432907 () Bool)

(assert (=> b!1555847 m!1432907))

(check-sat (not b!1555847) (not b!1555849) (not start!132828) tp_is_empty!38353 (not b!1555848))
(check-sat)
(get-model)

(declare-fun d!161823 () Bool)

(declare-fun res!1064554 () Bool)

(declare-fun e!866519 () Bool)

(assert (=> d!161823 (=> res!1064554 e!866519)))

(assert (=> d!161823 (= res!1064554 (or ((_ is Nil!36333) l!1177) ((_ is Nil!36333) (t!51049 l!1177))))))

(assert (=> d!161823 (= (isStrictlySorted!942 l!1177) e!866519)))

(declare-fun b!1555882 () Bool)

(declare-fun e!866520 () Bool)

(assert (=> b!1555882 (= e!866519 e!866520)))

(declare-fun res!1064555 () Bool)

(assert (=> b!1555882 (=> (not res!1064555) (not e!866520))))

(assert (=> b!1555882 (= res!1064555 (bvslt (_1!12492 (h!37779 l!1177)) (_1!12492 (h!37779 (t!51049 l!1177)))))))

(declare-fun b!1555883 () Bool)

(assert (=> b!1555883 (= e!866520 (isStrictlySorted!942 (t!51049 l!1177)))))

(assert (= (and d!161823 (not res!1064554)) b!1555882))

(assert (= (and b!1555882 res!1064555) b!1555883))

(assert (=> b!1555883 m!1432907))

(assert (=> start!132828 d!161823))

(declare-fun d!161827 () Bool)

(declare-fun lt!670098 () Int)

(assert (=> d!161827 (>= lt!670098 0)))

(declare-fun e!866529 () Int)

(assert (=> d!161827 (= lt!670098 e!866529)))

(declare-fun c!143630 () Bool)

(assert (=> d!161827 (= c!143630 ((_ is Nil!36333) (t!51049 l!1177)))))

(assert (=> d!161827 (= (ListPrimitiveSize!178 (t!51049 l!1177)) lt!670098)))

(declare-fun b!1555896 () Bool)

(assert (=> b!1555896 (= e!866529 0)))

(declare-fun b!1555897 () Bool)

(assert (=> b!1555897 (= e!866529 (+ 1 (ListPrimitiveSize!178 (t!51049 (t!51049 l!1177)))))))

(assert (= (and d!161827 c!143630) b!1555896))

(assert (= (and d!161827 (not c!143630)) b!1555897))

(declare-fun m!1432927 () Bool)

(assert (=> b!1555897 m!1432927))

(assert (=> b!1555848 d!161827))

(declare-fun d!161833 () Bool)

(declare-fun lt!670099 () Int)

(assert (=> d!161833 (>= lt!670099 0)))

(declare-fun e!866530 () Int)

(assert (=> d!161833 (= lt!670099 e!866530)))

(declare-fun c!143631 () Bool)

(assert (=> d!161833 (= c!143631 ((_ is Nil!36333) l!1177))))

(assert (=> d!161833 (= (ListPrimitiveSize!178 l!1177) lt!670099)))

(declare-fun b!1555898 () Bool)

(assert (=> b!1555898 (= e!866530 0)))

(declare-fun b!1555899 () Bool)

(assert (=> b!1555899 (= e!866530 (+ 1 (ListPrimitiveSize!178 (t!51049 l!1177))))))

(assert (= (and d!161833 c!143631) b!1555898))

(assert (= (and d!161833 (not c!143631)) b!1555899))

(assert (=> b!1555899 m!1432901))

(assert (=> b!1555848 d!161833))

(declare-fun d!161835 () Bool)

(declare-fun res!1064560 () Bool)

(declare-fun e!866531 () Bool)

(assert (=> d!161835 (=> res!1064560 e!866531)))

(assert (=> d!161835 (= res!1064560 (or ((_ is Nil!36333) (t!51049 l!1177)) ((_ is Nil!36333) (t!51049 (t!51049 l!1177)))))))

(assert (=> d!161835 (= (isStrictlySorted!942 (t!51049 l!1177)) e!866531)))

(declare-fun b!1555900 () Bool)

(declare-fun e!866532 () Bool)

(assert (=> b!1555900 (= e!866531 e!866532)))

(declare-fun res!1064561 () Bool)

(assert (=> b!1555900 (=> (not res!1064561) (not e!866532))))

(assert (=> b!1555900 (= res!1064561 (bvslt (_1!12492 (h!37779 (t!51049 l!1177))) (_1!12492 (h!37779 (t!51049 (t!51049 l!1177))))))))

(declare-fun b!1555901 () Bool)

(assert (=> b!1555901 (= e!866532 (isStrictlySorted!942 (t!51049 (t!51049 l!1177))))))

(assert (= (and d!161835 (not res!1064560)) b!1555900))

(assert (= (and b!1555900 res!1064561) b!1555901))

(declare-fun m!1432929 () Bool)

(assert (=> b!1555901 m!1432929))

(assert (=> b!1555847 d!161835))

(declare-fun b!1555910 () Bool)

(declare-fun e!866537 () Bool)

(declare-fun tp!112417 () Bool)

(assert (=> b!1555910 (= e!866537 (and tp_is_empty!38353 tp!112417))))

(assert (=> b!1555849 (= tp!112408 e!866537)))

(assert (= (and b!1555849 ((_ is Cons!36332) (t!51049 l!1177))) b!1555910))

(check-sat (not b!1555899) (not b!1555897) (not b!1555910) (not b!1555883) (not b!1555901) tp_is_empty!38353)
(check-sat)
