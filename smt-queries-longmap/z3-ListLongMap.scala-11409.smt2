; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133260 () Bool)

(assert start!133260)

(declare-fun res!1065435 () Bool)

(declare-fun e!868100 () Bool)

(assert (=> start!133260 (=> (not res!1065435) (not e!868100))))

(declare-datatypes ((B!2330 0))(
  ( (B!2331 (val!19251 Int)) )
))
(declare-datatypes ((tuple2!24932 0))(
  ( (tuple2!24933 (_1!12477 (_ BitVec 64)) (_2!12477 B!2330)) )
))
(declare-datatypes ((List!36314 0))(
  ( (Nil!36311) (Cons!36310 (h!37774 tuple2!24932) (t!51027 List!36314)) )
))
(declare-fun l!1177 () List!36314)

(declare-fun isStrictlySorted!925 (List!36314) Bool)

(assert (=> start!133260 (= res!1065435 (isStrictlySorted!925 l!1177))))

(assert (=> start!133260 e!868100))

(declare-fun e!868099 () Bool)

(assert (=> start!133260 e!868099))

(assert (=> start!133260 true))

(declare-fun b!1558449 () Bool)

(declare-fun res!1065434 () Bool)

(assert (=> b!1558449 (=> (not res!1065434) (not e!868100))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(assert (=> b!1558449 (= res!1065434 (not (= newKey!105 otherKey!50)))))

(declare-fun b!1558450 () Bool)

(declare-fun ListPrimitiveSize!175 (List!36314) Int)

(assert (=> b!1558450 (= e!868100 (< (ListPrimitiveSize!175 l!1177) 0))))

(declare-fun b!1558451 () Bool)

(declare-fun tp_is_empty!38341 () Bool)

(declare-fun tp!112371 () Bool)

(assert (=> b!1558451 (= e!868099 (and tp_is_empty!38341 tp!112371))))

(assert (= (and start!133260 res!1065435) b!1558449))

(assert (= (and b!1558449 res!1065434) b!1558450))

(get-info :version)

(assert (= (and start!133260 ((_ is Cons!36310) l!1177)) b!1558451))

(declare-fun m!1436009 () Bool)

(assert (=> start!133260 m!1436009))

(declare-fun m!1436011 () Bool)

(assert (=> b!1558450 m!1436011))

(check-sat (not b!1558450) (not start!133260) (not b!1558451) tp_is_empty!38341)
(check-sat)
(get-model)

(declare-fun d!162751 () Bool)

(declare-fun lt!671283 () Int)

(assert (=> d!162751 (>= lt!671283 0)))

(declare-fun e!868121 () Int)

(assert (=> d!162751 (= lt!671283 e!868121)))

(declare-fun c!144510 () Bool)

(assert (=> d!162751 (= c!144510 ((_ is Nil!36311) l!1177))))

(assert (=> d!162751 (= (ListPrimitiveSize!175 l!1177) lt!671283)))

(declare-fun b!1558482 () Bool)

(assert (=> b!1558482 (= e!868121 0)))

(declare-fun b!1558483 () Bool)

(assert (=> b!1558483 (= e!868121 (+ 1 (ListPrimitiveSize!175 (t!51027 l!1177))))))

(assert (= (and d!162751 c!144510) b!1558482))

(assert (= (and d!162751 (not c!144510)) b!1558483))

(declare-fun m!1436021 () Bool)

(assert (=> b!1558483 m!1436021))

(assert (=> b!1558450 d!162751))

(declare-fun d!162755 () Bool)

(declare-fun res!1065462 () Bool)

(declare-fun e!868136 () Bool)

(assert (=> d!162755 (=> res!1065462 e!868136)))

(assert (=> d!162755 (= res!1065462 (or ((_ is Nil!36311) l!1177) ((_ is Nil!36311) (t!51027 l!1177))))))

(assert (=> d!162755 (= (isStrictlySorted!925 l!1177) e!868136)))

(declare-fun b!1558502 () Bool)

(declare-fun e!868137 () Bool)

(assert (=> b!1558502 (= e!868136 e!868137)))

(declare-fun res!1065463 () Bool)

(assert (=> b!1558502 (=> (not res!1065463) (not e!868137))))

(assert (=> b!1558502 (= res!1065463 (bvslt (_1!12477 (h!37774 l!1177)) (_1!12477 (h!37774 (t!51027 l!1177)))))))

(declare-fun b!1558503 () Bool)

(assert (=> b!1558503 (= e!868137 (isStrictlySorted!925 (t!51027 l!1177)))))

(assert (= (and d!162755 (not res!1065462)) b!1558502))

(assert (= (and b!1558502 res!1065463) b!1558503))

(declare-fun m!1436029 () Bool)

(assert (=> b!1558503 m!1436029))

(assert (=> start!133260 d!162755))

(declare-fun b!1558513 () Bool)

(declare-fun e!868144 () Bool)

(declare-fun tp!112383 () Bool)

(assert (=> b!1558513 (= e!868144 (and tp_is_empty!38341 tp!112383))))

(assert (=> b!1558451 (= tp!112371 e!868144)))

(assert (= (and b!1558451 ((_ is Cons!36310) (t!51027 l!1177))) b!1558513))

(check-sat (not b!1558503) (not b!1558483) (not b!1558513) tp_is_empty!38341)
(check-sat)
