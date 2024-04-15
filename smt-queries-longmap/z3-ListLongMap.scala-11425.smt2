; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133152 () Bool)

(assert start!133152)

(declare-fun b!1557936 () Bool)

(declare-fun e!867846 () Bool)

(declare-fun e!867848 () Bool)

(assert (=> b!1557936 (= e!867846 e!867848)))

(declare-fun res!1065594 () Bool)

(assert (=> b!1557936 (=> res!1065594 e!867848)))

(declare-datatypes ((B!2426 0))(
  ( (B!2427 (val!19299 Int)) )
))
(declare-datatypes ((tuple2!25046 0))(
  ( (tuple2!25047 (_1!12534 (_ BitVec 64)) (_2!12534 B!2426)) )
))
(declare-datatypes ((List!36378 0))(
  ( (Nil!36375) (Cons!36374 (h!37821 tuple2!25046) (t!51097 List!36378)) )
))
(declare-fun l!1292 () List!36378)

(declare-fun isStrictlySorted!972 (List!36378) Bool)

(assert (=> b!1557936 (= res!1065594 (not (isStrictlySorted!972 (t!51097 l!1292))))))

(declare-fun b!1557937 () Bool)

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun containsKey!834 (List!36378 (_ BitVec 64)) Bool)

(assert (=> b!1557937 (= e!867848 (not (containsKey!834 (t!51097 l!1292) otherKey!62)))))

(declare-fun b!1557938 () Bool)

(declare-fun res!1065593 () Bool)

(assert (=> b!1557938 (=> (not res!1065593) (not e!867846))))

(assert (=> b!1557938 (= res!1065593 (containsKey!834 l!1292 otherKey!62))))

(declare-fun b!1557939 () Bool)

(declare-fun res!1065595 () Bool)

(assert (=> b!1557939 (=> (not res!1065595) (not e!867846))))

(declare-fun newKey!135 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1557939 (= res!1065595 (and (not (= otherKey!62 newKey!135)) ((_ is Cons!36374) l!1292) (not (= (_1!12534 (h!37821 l!1292)) otherKey!62))))))

(declare-fun b!1557940 () Bool)

(declare-fun e!867847 () Bool)

(declare-fun tp_is_empty!38431 () Bool)

(declare-fun tp!112621 () Bool)

(assert (=> b!1557940 (= e!867847 (and tp_is_empty!38431 tp!112621))))

(declare-fun res!1065592 () Bool)

(assert (=> start!133152 (=> (not res!1065592) (not e!867846))))

(assert (=> start!133152 (= res!1065592 (isStrictlySorted!972 l!1292))))

(assert (=> start!133152 e!867846))

(assert (=> start!133152 e!867847))

(assert (=> start!133152 true))

(assert (= (and start!133152 res!1065592) b!1557938))

(assert (= (and b!1557938 res!1065593) b!1557939))

(assert (= (and b!1557939 res!1065595) b!1557936))

(assert (= (and b!1557936 (not res!1065594)) b!1557937))

(assert (= (and start!133152 ((_ is Cons!36374) l!1292)) b!1557940))

(declare-fun m!1434113 () Bool)

(assert (=> b!1557936 m!1434113))

(declare-fun m!1434115 () Bool)

(assert (=> b!1557937 m!1434115))

(declare-fun m!1434117 () Bool)

(assert (=> b!1557938 m!1434117))

(declare-fun m!1434119 () Bool)

(assert (=> start!133152 m!1434119))

(check-sat (not start!133152) (not b!1557937) (not b!1557936) (not b!1557940) (not b!1557938) tp_is_empty!38431)
(check-sat)
(get-model)

(declare-fun d!162361 () Bool)

(declare-fun res!1065630 () Bool)

(declare-fun e!867877 () Bool)

(assert (=> d!162361 (=> res!1065630 e!867877)))

(assert (=> d!162361 (= res!1065630 (and ((_ is Cons!36374) l!1292) (= (_1!12534 (h!37821 l!1292)) otherKey!62)))))

(assert (=> d!162361 (= (containsKey!834 l!1292 otherKey!62) e!867877)))

(declare-fun b!1557981 () Bool)

(declare-fun e!867878 () Bool)

(assert (=> b!1557981 (= e!867877 e!867878)))

(declare-fun res!1065631 () Bool)

(assert (=> b!1557981 (=> (not res!1065631) (not e!867878))))

(assert (=> b!1557981 (= res!1065631 (and (or (not ((_ is Cons!36374) l!1292)) (bvsle (_1!12534 (h!37821 l!1292)) otherKey!62)) ((_ is Cons!36374) l!1292) (bvslt (_1!12534 (h!37821 l!1292)) otherKey!62)))))

(declare-fun b!1557982 () Bool)

(assert (=> b!1557982 (= e!867878 (containsKey!834 (t!51097 l!1292) otherKey!62))))

(assert (= (and d!162361 (not res!1065630)) b!1557981))

(assert (= (and b!1557981 res!1065631) b!1557982))

(assert (=> b!1557982 m!1434115))

(assert (=> b!1557938 d!162361))

(declare-fun d!162367 () Bool)

(declare-fun res!1065632 () Bool)

(declare-fun e!867879 () Bool)

(assert (=> d!162367 (=> res!1065632 e!867879)))

(assert (=> d!162367 (= res!1065632 (and ((_ is Cons!36374) (t!51097 l!1292)) (= (_1!12534 (h!37821 (t!51097 l!1292))) otherKey!62)))))

(assert (=> d!162367 (= (containsKey!834 (t!51097 l!1292) otherKey!62) e!867879)))

(declare-fun b!1557983 () Bool)

(declare-fun e!867880 () Bool)

(assert (=> b!1557983 (= e!867879 e!867880)))

(declare-fun res!1065633 () Bool)

(assert (=> b!1557983 (=> (not res!1065633) (not e!867880))))

(assert (=> b!1557983 (= res!1065633 (and (or (not ((_ is Cons!36374) (t!51097 l!1292))) (bvsle (_1!12534 (h!37821 (t!51097 l!1292))) otherKey!62)) ((_ is Cons!36374) (t!51097 l!1292)) (bvslt (_1!12534 (h!37821 (t!51097 l!1292))) otherKey!62)))))

(declare-fun b!1557984 () Bool)

(assert (=> b!1557984 (= e!867880 (containsKey!834 (t!51097 (t!51097 l!1292)) otherKey!62))))

(assert (= (and d!162367 (not res!1065632)) b!1557983))

(assert (= (and b!1557983 res!1065633) b!1557984))

(declare-fun m!1434137 () Bool)

(assert (=> b!1557984 m!1434137))

(assert (=> b!1557937 d!162367))

(declare-fun d!162369 () Bool)

(declare-fun res!1065650 () Bool)

(declare-fun e!867897 () Bool)

(assert (=> d!162369 (=> res!1065650 e!867897)))

(assert (=> d!162369 (= res!1065650 (or ((_ is Nil!36375) (t!51097 l!1292)) ((_ is Nil!36375) (t!51097 (t!51097 l!1292)))))))

(assert (=> d!162369 (= (isStrictlySorted!972 (t!51097 l!1292)) e!867897)))

(declare-fun b!1557999 () Bool)

(declare-fun e!867898 () Bool)

(assert (=> b!1557999 (= e!867897 e!867898)))

(declare-fun res!1065651 () Bool)

(assert (=> b!1557999 (=> (not res!1065651) (not e!867898))))

(assert (=> b!1557999 (= res!1065651 (bvslt (_1!12534 (h!37821 (t!51097 l!1292))) (_1!12534 (h!37821 (t!51097 (t!51097 l!1292))))))))

(declare-fun b!1558000 () Bool)

(assert (=> b!1558000 (= e!867898 (isStrictlySorted!972 (t!51097 (t!51097 l!1292))))))

(assert (= (and d!162369 (not res!1065650)) b!1557999))

(assert (= (and b!1557999 res!1065651) b!1558000))

(declare-fun m!1434141 () Bool)

(assert (=> b!1558000 m!1434141))

(assert (=> b!1557936 d!162369))

(declare-fun d!162377 () Bool)

(declare-fun res!1065654 () Bool)

(declare-fun e!867901 () Bool)

(assert (=> d!162377 (=> res!1065654 e!867901)))

(assert (=> d!162377 (= res!1065654 (or ((_ is Nil!36375) l!1292) ((_ is Nil!36375) (t!51097 l!1292))))))

(assert (=> d!162377 (= (isStrictlySorted!972 l!1292) e!867901)))

(declare-fun b!1558005 () Bool)

(declare-fun e!867902 () Bool)

(assert (=> b!1558005 (= e!867901 e!867902)))

(declare-fun res!1065655 () Bool)

(assert (=> b!1558005 (=> (not res!1065655) (not e!867902))))

(assert (=> b!1558005 (= res!1065655 (bvslt (_1!12534 (h!37821 l!1292)) (_1!12534 (h!37821 (t!51097 l!1292)))))))

(declare-fun b!1558006 () Bool)

(assert (=> b!1558006 (= e!867902 (isStrictlySorted!972 (t!51097 l!1292)))))

(assert (= (and d!162377 (not res!1065654)) b!1558005))

(assert (= (and b!1558005 res!1065655) b!1558006))

(assert (=> b!1558006 m!1434113))

(assert (=> start!133152 d!162377))

(declare-fun b!1558017 () Bool)

(declare-fun e!867909 () Bool)

(declare-fun tp!112632 () Bool)

(assert (=> b!1558017 (= e!867909 (and tp_is_empty!38431 tp!112632))))

(assert (=> b!1557940 (= tp!112621 e!867909)))

(assert (= (and b!1557940 ((_ is Cons!36374) (t!51097 l!1292))) b!1558017))

(check-sat (not b!1558017) (not b!1558006) (not b!1557984) (not b!1558000) (not b!1557982) tp_is_empty!38431)
(check-sat)
