; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137750 () Bool)

(assert start!137750)

(declare-fun b!1582594 () Bool)

(declare-fun e!883297 () Bool)

(declare-fun tp_is_empty!39361 () Bool)

(declare-fun tp!114876 () Bool)

(assert (=> b!1582594 (= e!883297 (and tp_is_empty!39361 tp!114876))))

(declare-fun b!1582595 () Bool)

(declare-fun e!883298 () Bool)

(declare-datatypes ((B!2828 0))(
  ( (B!2829 (val!19776 Int)) )
))
(declare-datatypes ((tuple2!25788 0))(
  ( (tuple2!25789 (_1!12905 (_ BitVec 64)) (_2!12905 B!2828)) )
))
(declare-datatypes ((List!36937 0))(
  ( (Nil!36934) (Cons!36933 (h!38477 tuple2!25788) (t!51843 List!36937)) )
))
(declare-fun l!1065 () List!36937)

(declare-fun ListPrimitiveSize!208 (List!36937) Int)

(assert (=> b!1582595 (= e!883298 (>= (ListPrimitiveSize!208 (t!51843 l!1065)) (ListPrimitiveSize!208 l!1065)))))

(declare-fun b!1582596 () Bool)

(declare-fun res!1081236 () Bool)

(assert (=> b!1582596 (=> (not res!1081236) (not e!883298))))

(declare-fun key!287 () (_ BitVec 64))

(declare-fun containsKey!974 (List!36937 (_ BitVec 64)) Bool)

(assert (=> b!1582596 (= res!1081236 (containsKey!974 l!1065 key!287))))

(declare-fun res!1081232 () Bool)

(assert (=> start!137750 (=> (not res!1081232) (not e!883298))))

(declare-fun isStrictlySorted!1128 (List!36937) Bool)

(assert (=> start!137750 (= res!1081232 (isStrictlySorted!1128 l!1065))))

(assert (=> start!137750 e!883298))

(assert (=> start!137750 e!883297))

(assert (=> start!137750 true))

(declare-fun b!1582597 () Bool)

(declare-fun res!1081235 () Bool)

(assert (=> b!1582597 (=> (not res!1081235) (not e!883298))))

(assert (=> b!1582597 (= res!1081235 (isStrictlySorted!1128 (t!51843 l!1065)))))

(declare-fun b!1582598 () Bool)

(declare-fun res!1081234 () Bool)

(assert (=> b!1582598 (=> (not res!1081234) (not e!883298))))

(get-info :version)

(assert (=> b!1582598 (= res!1081234 (and ((_ is Cons!36933) l!1065) (not (= (_1!12905 (h!38477 l!1065)) key!287))))))

(declare-fun b!1582599 () Bool)

(declare-fun res!1081233 () Bool)

(assert (=> b!1582599 (=> (not res!1081233) (not e!883298))))

(assert (=> b!1582599 (= res!1081233 (containsKey!974 (t!51843 l!1065) key!287))))

(assert (= (and start!137750 res!1081232) b!1582596))

(assert (= (and b!1582596 res!1081236) b!1582598))

(assert (= (and b!1582598 res!1081234) b!1582597))

(assert (= (and b!1582597 res!1081235) b!1582599))

(assert (= (and b!1582599 res!1081233) b!1582595))

(assert (= (and start!137750 ((_ is Cons!36933) l!1065)) b!1582594))

(declare-fun m!1452199 () Bool)

(assert (=> b!1582596 m!1452199))

(declare-fun m!1452201 () Bool)

(assert (=> start!137750 m!1452201))

(declare-fun m!1452203 () Bool)

(assert (=> b!1582599 m!1452203))

(declare-fun m!1452205 () Bool)

(assert (=> b!1582595 m!1452205))

(declare-fun m!1452207 () Bool)

(assert (=> b!1582595 m!1452207))

(declare-fun m!1452209 () Bool)

(assert (=> b!1582597 m!1452209))

(check-sat (not b!1582596) tp_is_empty!39361 (not b!1582597) (not b!1582595) (not b!1582599) (not b!1582594) (not start!137750))
(check-sat)
(get-model)

(declare-fun d!166841 () Bool)

(declare-fun res!1081271 () Bool)

(declare-fun e!883315 () Bool)

(assert (=> d!166841 (=> res!1081271 e!883315)))

(assert (=> d!166841 (= res!1081271 (or ((_ is Nil!36934) (t!51843 l!1065)) ((_ is Nil!36934) (t!51843 (t!51843 l!1065)))))))

(assert (=> d!166841 (= (isStrictlySorted!1128 (t!51843 l!1065)) e!883315)))

(declare-fun b!1582640 () Bool)

(declare-fun e!883316 () Bool)

(assert (=> b!1582640 (= e!883315 e!883316)))

(declare-fun res!1081272 () Bool)

(assert (=> b!1582640 (=> (not res!1081272) (not e!883316))))

(assert (=> b!1582640 (= res!1081272 (bvslt (_1!12905 (h!38477 (t!51843 l!1065))) (_1!12905 (h!38477 (t!51843 (t!51843 l!1065))))))))

(declare-fun b!1582641 () Bool)

(assert (=> b!1582641 (= e!883316 (isStrictlySorted!1128 (t!51843 (t!51843 l!1065))))))

(assert (= (and d!166841 (not res!1081271)) b!1582640))

(assert (= (and b!1582640 res!1081272) b!1582641))

(declare-fun m!1452235 () Bool)

(assert (=> b!1582641 m!1452235))

(assert (=> b!1582597 d!166841))

(declare-fun d!166845 () Bool)

(declare-fun res!1081273 () Bool)

(declare-fun e!883317 () Bool)

(assert (=> d!166845 (=> res!1081273 e!883317)))

(assert (=> d!166845 (= res!1081273 (or ((_ is Nil!36934) l!1065) ((_ is Nil!36934) (t!51843 l!1065))))))

(assert (=> d!166845 (= (isStrictlySorted!1128 l!1065) e!883317)))

(declare-fun b!1582642 () Bool)

(declare-fun e!883318 () Bool)

(assert (=> b!1582642 (= e!883317 e!883318)))

(declare-fun res!1081274 () Bool)

(assert (=> b!1582642 (=> (not res!1081274) (not e!883318))))

(assert (=> b!1582642 (= res!1081274 (bvslt (_1!12905 (h!38477 l!1065)) (_1!12905 (h!38477 (t!51843 l!1065)))))))

(declare-fun b!1582643 () Bool)

(assert (=> b!1582643 (= e!883318 (isStrictlySorted!1128 (t!51843 l!1065)))))

(assert (= (and d!166845 (not res!1081273)) b!1582642))

(assert (= (and b!1582642 res!1081274) b!1582643))

(assert (=> b!1582643 m!1452209))

(assert (=> start!137750 d!166845))

(declare-fun d!166847 () Bool)

(declare-fun res!1081283 () Bool)

(declare-fun e!883329 () Bool)

(assert (=> d!166847 (=> res!1081283 e!883329)))

(assert (=> d!166847 (= res!1081283 (and ((_ is Cons!36933) (t!51843 l!1065)) (= (_1!12905 (h!38477 (t!51843 l!1065))) key!287)))))

(assert (=> d!166847 (= (containsKey!974 (t!51843 l!1065) key!287) e!883329)))

(declare-fun b!1582656 () Bool)

(declare-fun e!883330 () Bool)

(assert (=> b!1582656 (= e!883329 e!883330)))

(declare-fun res!1081284 () Bool)

(assert (=> b!1582656 (=> (not res!1081284) (not e!883330))))

(assert (=> b!1582656 (= res!1081284 (and (or (not ((_ is Cons!36933) (t!51843 l!1065))) (bvsle (_1!12905 (h!38477 (t!51843 l!1065))) key!287)) ((_ is Cons!36933) (t!51843 l!1065)) (bvslt (_1!12905 (h!38477 (t!51843 l!1065))) key!287)))))

(declare-fun b!1582657 () Bool)

(assert (=> b!1582657 (= e!883330 (containsKey!974 (t!51843 (t!51843 l!1065)) key!287))))

(assert (= (and d!166847 (not res!1081283)) b!1582656))

(assert (= (and b!1582656 res!1081284) b!1582657))

(declare-fun m!1452237 () Bool)

(assert (=> b!1582657 m!1452237))

(assert (=> b!1582599 d!166847))

(declare-fun d!166851 () Bool)

(declare-fun res!1081285 () Bool)

(declare-fun e!883331 () Bool)

(assert (=> d!166851 (=> res!1081285 e!883331)))

(assert (=> d!166851 (= res!1081285 (and ((_ is Cons!36933) l!1065) (= (_1!12905 (h!38477 l!1065)) key!287)))))

(assert (=> d!166851 (= (containsKey!974 l!1065 key!287) e!883331)))

(declare-fun b!1582658 () Bool)

(declare-fun e!883332 () Bool)

(assert (=> b!1582658 (= e!883331 e!883332)))

(declare-fun res!1081286 () Bool)

(assert (=> b!1582658 (=> (not res!1081286) (not e!883332))))

(assert (=> b!1582658 (= res!1081286 (and (or (not ((_ is Cons!36933) l!1065)) (bvsle (_1!12905 (h!38477 l!1065)) key!287)) ((_ is Cons!36933) l!1065) (bvslt (_1!12905 (h!38477 l!1065)) key!287)))))

(declare-fun b!1582659 () Bool)

(assert (=> b!1582659 (= e!883332 (containsKey!974 (t!51843 l!1065) key!287))))

(assert (= (and d!166851 (not res!1081285)) b!1582658))

(assert (= (and b!1582658 res!1081286) b!1582659))

(assert (=> b!1582659 m!1452203))

(assert (=> b!1582596 d!166851))

(declare-fun d!166853 () Bool)

(declare-fun lt!676860 () Int)

(assert (=> d!166853 (>= lt!676860 0)))

(declare-fun e!883341 () Int)

(assert (=> d!166853 (= lt!676860 e!883341)))

(declare-fun c!146589 () Bool)

(assert (=> d!166853 (= c!146589 ((_ is Nil!36934) (t!51843 l!1065)))))

(assert (=> d!166853 (= (ListPrimitiveSize!208 (t!51843 l!1065)) lt!676860)))

(declare-fun b!1582672 () Bool)

(assert (=> b!1582672 (= e!883341 0)))

(declare-fun b!1582673 () Bool)

(assert (=> b!1582673 (= e!883341 (+ 1 (ListPrimitiveSize!208 (t!51843 (t!51843 l!1065)))))))

(assert (= (and d!166853 c!146589) b!1582672))

(assert (= (and d!166853 (not c!146589)) b!1582673))

(declare-fun m!1452243 () Bool)

(assert (=> b!1582673 m!1452243))

(assert (=> b!1582595 d!166853))

(declare-fun d!166863 () Bool)

(declare-fun lt!676861 () Int)

(assert (=> d!166863 (>= lt!676861 0)))

(declare-fun e!883342 () Int)

(assert (=> d!166863 (= lt!676861 e!883342)))

(declare-fun c!146590 () Bool)

(assert (=> d!166863 (= c!146590 ((_ is Nil!36934) l!1065))))

(assert (=> d!166863 (= (ListPrimitiveSize!208 l!1065) lt!676861)))

(declare-fun b!1582674 () Bool)

(assert (=> b!1582674 (= e!883342 0)))

(declare-fun b!1582675 () Bool)

(assert (=> b!1582675 (= e!883342 (+ 1 (ListPrimitiveSize!208 (t!51843 l!1065))))))

(assert (= (and d!166863 c!146590) b!1582674))

(assert (= (and d!166863 (not c!146590)) b!1582675))

(assert (=> b!1582675 m!1452205))

(assert (=> b!1582595 d!166863))

(declare-fun b!1582686 () Bool)

(declare-fun e!883353 () Bool)

(declare-fun tp!114885 () Bool)

(assert (=> b!1582686 (= e!883353 (and tp_is_empty!39361 tp!114885))))

(assert (=> b!1582594 (= tp!114876 e!883353)))

(assert (= (and b!1582594 ((_ is Cons!36933) (t!51843 l!1065))) b!1582686))

(check-sat (not b!1582686) (not b!1582675) tp_is_empty!39361 (not b!1582641) (not b!1582643) (not b!1582657) (not b!1582673) (not b!1582659))
(check-sat)
