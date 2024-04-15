; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137874 () Bool)

(assert start!137874)

(declare-fun res!1081562 () Bool)

(declare-fun e!883693 () Bool)

(assert (=> start!137874 (=> (not res!1081562) (not e!883693))))

(declare-datatypes ((B!2858 0))(
  ( (B!2859 (val!19791 Int)) )
))
(declare-datatypes ((tuple2!25818 0))(
  ( (tuple2!25819 (_1!12920 (_ BitVec 64)) (_2!12920 B!2858)) )
))
(declare-datatypes ((List!36952 0))(
  ( (Nil!36949) (Cons!36948 (h!38492 tuple2!25818) (t!51858 List!36952)) )
))
(declare-fun l!548 () List!36952)

(declare-fun isStrictlySorted!1143 (List!36952) Bool)

(assert (=> start!137874 (= res!1081562 (isStrictlySorted!1143 l!548))))

(assert (=> start!137874 e!883693))

(declare-fun e!883692 () Bool)

(assert (=> start!137874 e!883692))

(assert (=> start!137874 true))

(declare-fun b!1583179 () Bool)

(declare-fun res!1081561 () Bool)

(assert (=> b!1583179 (=> (not res!1081561) (not e!883693))))

(declare-fun key!159 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1583179 (= res!1081561 (and (not (= (_1!12920 (h!38492 l!548)) key!159)) ((_ is Cons!36948) l!548)))))

(declare-fun b!1583180 () Bool)

(declare-fun ListPrimitiveSize!214 (List!36952) Int)

(assert (=> b!1583180 (= e!883693 (>= (ListPrimitiveSize!214 (t!51858 l!548)) (ListPrimitiveSize!214 l!548)))))

(declare-fun b!1583181 () Bool)

(declare-fun tp_is_empty!39391 () Bool)

(declare-fun tp!114968 () Bool)

(assert (=> b!1583181 (= e!883692 (and tp_is_empty!39391 tp!114968))))

(assert (= (and start!137874 res!1081562) b!1583179))

(assert (= (and b!1583179 res!1081561) b!1583180))

(assert (= (and start!137874 ((_ is Cons!36948) l!548)) b!1583181))

(declare-fun m!1452445 () Bool)

(assert (=> start!137874 m!1452445))

(declare-fun m!1452447 () Bool)

(assert (=> b!1583180 m!1452447))

(declare-fun m!1452449 () Bool)

(assert (=> b!1583180 m!1452449))

(check-sat (not b!1583180) (not start!137874) (not b!1583181) tp_is_empty!39391)
(check-sat)
(get-model)

(declare-fun d!167005 () Bool)

(declare-fun lt!676897 () Int)

(assert (=> d!167005 (>= lt!676897 0)))

(declare-fun e!883710 () Int)

(assert (=> d!167005 (= lt!676897 e!883710)))

(declare-fun c!146654 () Bool)

(assert (=> d!167005 (= c!146654 ((_ is Nil!36949) (t!51858 l!548)))))

(assert (=> d!167005 (= (ListPrimitiveSize!214 (t!51858 l!548)) lt!676897)))

(declare-fun b!1583208 () Bool)

(assert (=> b!1583208 (= e!883710 0)))

(declare-fun b!1583209 () Bool)

(assert (=> b!1583209 (= e!883710 (+ 1 (ListPrimitiveSize!214 (t!51858 (t!51858 l!548)))))))

(assert (= (and d!167005 c!146654) b!1583208))

(assert (= (and d!167005 (not c!146654)) b!1583209))

(declare-fun m!1452463 () Bool)

(assert (=> b!1583209 m!1452463))

(assert (=> b!1583180 d!167005))

(declare-fun d!167011 () Bool)

(declare-fun lt!676899 () Int)

(assert (=> d!167011 (>= lt!676899 0)))

(declare-fun e!883712 () Int)

(assert (=> d!167011 (= lt!676899 e!883712)))

(declare-fun c!146656 () Bool)

(assert (=> d!167011 (= c!146656 ((_ is Nil!36949) l!548))))

(assert (=> d!167011 (= (ListPrimitiveSize!214 l!548) lt!676899)))

(declare-fun b!1583212 () Bool)

(assert (=> b!1583212 (= e!883712 0)))

(declare-fun b!1583213 () Bool)

(assert (=> b!1583213 (= e!883712 (+ 1 (ListPrimitiveSize!214 (t!51858 l!548))))))

(assert (= (and d!167011 c!146656) b!1583212))

(assert (= (and d!167011 (not c!146656)) b!1583213))

(assert (=> b!1583213 m!1452447))

(assert (=> b!1583180 d!167011))

(declare-fun d!167015 () Bool)

(declare-fun res!1081585 () Bool)

(declare-fun e!883731 () Bool)

(assert (=> d!167015 (=> res!1081585 e!883731)))

(assert (=> d!167015 (= res!1081585 (or ((_ is Nil!36949) l!548) ((_ is Nil!36949) (t!51858 l!548))))))

(assert (=> d!167015 (= (isStrictlySorted!1143 l!548) e!883731)))

(declare-fun b!1583239 () Bool)

(declare-fun e!883732 () Bool)

(assert (=> b!1583239 (= e!883731 e!883732)))

(declare-fun res!1081586 () Bool)

(assert (=> b!1583239 (=> (not res!1081586) (not e!883732))))

(assert (=> b!1583239 (= res!1081586 (bvslt (_1!12920 (h!38492 l!548)) (_1!12920 (h!38492 (t!51858 l!548)))))))

(declare-fun b!1583240 () Bool)

(assert (=> b!1583240 (= e!883732 (isStrictlySorted!1143 (t!51858 l!548)))))

(assert (= (and d!167015 (not res!1081585)) b!1583239))

(assert (= (and b!1583239 res!1081586) b!1583240))

(declare-fun m!1452471 () Bool)

(assert (=> b!1583240 m!1452471))

(assert (=> start!137874 d!167015))

(declare-fun b!1583249 () Bool)

(declare-fun e!883739 () Bool)

(declare-fun tp!114980 () Bool)

(assert (=> b!1583249 (= e!883739 (and tp_is_empty!39391 tp!114980))))

(assert (=> b!1583181 (= tp!114968 e!883739)))

(assert (= (and b!1583181 ((_ is Cons!36948) (t!51858 l!548))) b!1583249))

(check-sat tp_is_empty!39391 (not b!1583209) (not b!1583213) (not b!1583249) (not b!1583240))
(check-sat)
