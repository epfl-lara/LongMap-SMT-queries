; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134392 () Bool)

(assert start!134392)

(declare-fun res!1072556 () Bool)

(declare-fun e!874823 () Bool)

(assert (=> start!134392 (=> (not res!1072556) (not e!874823))))

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun key2!21 () (_ BitVec 64))

(assert (=> start!134392 (= res!1072556 (not (= key1!37 key2!21)))))

(assert (=> start!134392 e!874823))

(assert (=> start!134392 true))

(declare-fun e!874822 () Bool)

(assert (=> start!134392 e!874822))

(declare-fun tp_is_empty!39057 () Bool)

(assert (=> start!134392 tp_is_empty!39057))

(declare-fun b!1569303 () Bool)

(declare-fun res!1072555 () Bool)

(assert (=> b!1569303 (=> (not res!1072555) (not e!874823))))

(declare-datatypes ((B!2506 0))(
  ( (B!2507 (val!19615 Int)) )
))
(declare-datatypes ((tuple2!25332 0))(
  ( (tuple2!25333 (_1!12677 (_ BitVec 64)) (_2!12677 B!2506)) )
))
(declare-datatypes ((List!36735 0))(
  ( (Nil!36732) (Cons!36731 (h!38178 tuple2!25332) (t!51643 List!36735)) )
))
(declare-fun l!750 () List!36735)

(declare-fun isStrictlySorted!1005 (List!36735) Bool)

(assert (=> b!1569303 (= res!1072555 (isStrictlySorted!1005 l!750))))

(declare-fun b!1569306 () Bool)

(declare-fun tp!114105 () Bool)

(assert (=> b!1569306 (= e!874822 (and tp_is_empty!39057 tp!114105))))

(declare-fun b!1569304 () Bool)

(declare-fun res!1072557 () Bool)

(assert (=> b!1569304 (=> (not res!1072557) (not e!874823))))

(get-info :version)

(assert (=> b!1569304 (= res!1072557 (or (not ((_ is Cons!36731) l!750)) (bvsge (_1!12677 (h!38178 l!750)) key1!37) (bvsge (_1!12677 (h!38178 l!750)) key2!21)))))

(declare-fun v1!32 () B!2506)

(declare-fun b!1569305 () Bool)

(declare-fun insertStrictlySorted!591 (List!36735 (_ BitVec 64) B!2506) List!36735)

(assert (=> b!1569305 (= e!874823 (not (isStrictlySorted!1005 (insertStrictlySorted!591 l!750 key1!37 v1!32))))))

(assert (= (and start!134392 res!1072556) b!1569303))

(assert (= (and b!1569303 res!1072555) b!1569304))

(assert (= (and b!1569304 res!1072557) b!1569305))

(assert (= (and start!134392 ((_ is Cons!36731) l!750)) b!1569306))

(declare-fun m!1443745 () Bool)

(assert (=> b!1569303 m!1443745))

(declare-fun m!1443747 () Bool)

(assert (=> b!1569305 m!1443747))

(assert (=> b!1569305 m!1443747))

(declare-fun m!1443749 () Bool)

(assert (=> b!1569305 m!1443749))

(check-sat (not b!1569303) (not b!1569305) (not b!1569306) tp_is_empty!39057)
(check-sat)
(get-model)

(declare-fun d!163875 () Bool)

(declare-fun res!1072575 () Bool)

(declare-fun e!874838 () Bool)

(assert (=> d!163875 (=> res!1072575 e!874838)))

(assert (=> d!163875 (= res!1072575 (or ((_ is Nil!36732) l!750) ((_ is Nil!36732) (t!51643 l!750))))))

(assert (=> d!163875 (= (isStrictlySorted!1005 l!750) e!874838)))

(declare-fun b!1569327 () Bool)

(declare-fun e!874839 () Bool)

(assert (=> b!1569327 (= e!874838 e!874839)))

(declare-fun res!1072576 () Bool)

(assert (=> b!1569327 (=> (not res!1072576) (not e!874839))))

(assert (=> b!1569327 (= res!1072576 (bvslt (_1!12677 (h!38178 l!750)) (_1!12677 (h!38178 (t!51643 l!750)))))))

(declare-fun b!1569328 () Bool)

(assert (=> b!1569328 (= e!874839 (isStrictlySorted!1005 (t!51643 l!750)))))

(assert (= (and d!163875 (not res!1072575)) b!1569327))

(assert (= (and b!1569327 res!1072576) b!1569328))

(declare-fun m!1443757 () Bool)

(assert (=> b!1569328 m!1443757))

(assert (=> b!1569303 d!163875))

(declare-fun d!163881 () Bool)

(declare-fun res!1072579 () Bool)

(declare-fun e!874842 () Bool)

(assert (=> d!163881 (=> res!1072579 e!874842)))

(assert (=> d!163881 (= res!1072579 (or ((_ is Nil!36732) (insertStrictlySorted!591 l!750 key1!37 v1!32)) ((_ is Nil!36732) (t!51643 (insertStrictlySorted!591 l!750 key1!37 v1!32)))))))

(assert (=> d!163881 (= (isStrictlySorted!1005 (insertStrictlySorted!591 l!750 key1!37 v1!32)) e!874842)))

(declare-fun b!1569331 () Bool)

(declare-fun e!874843 () Bool)

(assert (=> b!1569331 (= e!874842 e!874843)))

(declare-fun res!1072580 () Bool)

(assert (=> b!1569331 (=> (not res!1072580) (not e!874843))))

(assert (=> b!1569331 (= res!1072580 (bvslt (_1!12677 (h!38178 (insertStrictlySorted!591 l!750 key1!37 v1!32))) (_1!12677 (h!38178 (t!51643 (insertStrictlySorted!591 l!750 key1!37 v1!32))))))))

(declare-fun b!1569332 () Bool)

(assert (=> b!1569332 (= e!874843 (isStrictlySorted!1005 (t!51643 (insertStrictlySorted!591 l!750 key1!37 v1!32))))))

(assert (= (and d!163881 (not res!1072579)) b!1569331))

(assert (= (and b!1569331 res!1072580) b!1569332))

(declare-fun m!1443761 () Bool)

(assert (=> b!1569332 m!1443761))

(assert (=> b!1569305 d!163881))

(declare-fun bm!72084 () Bool)

(declare-fun call!72088 () List!36735)

(declare-fun call!72087 () List!36735)

(assert (=> bm!72084 (= call!72088 call!72087)))

(declare-fun b!1569418 () Bool)

(declare-fun e!874895 () List!36735)

(declare-fun call!72089 () List!36735)

(assert (=> b!1569418 (= e!874895 call!72089)))

(declare-fun e!874893 () List!36735)

(declare-fun b!1569419 () Bool)

(assert (=> b!1569419 (= e!874893 (insertStrictlySorted!591 (t!51643 l!750) key1!37 v1!32))))

(declare-fun b!1569420 () Bool)

(declare-fun res!1072605 () Bool)

(declare-fun e!874894 () Bool)

(assert (=> b!1569420 (=> (not res!1072605) (not e!874894))))

(declare-fun lt!673305 () List!36735)

(declare-fun containsKey!864 (List!36735 (_ BitVec 64)) Bool)

(assert (=> b!1569420 (= res!1072605 (containsKey!864 lt!673305 key1!37))))

(declare-fun b!1569421 () Bool)

(declare-fun e!874896 () List!36735)

(declare-fun e!874892 () List!36735)

(assert (=> b!1569421 (= e!874896 e!874892)))

(declare-fun c!144731 () Bool)

(assert (=> b!1569421 (= c!144731 (and ((_ is Cons!36731) l!750) (= (_1!12677 (h!38178 l!750)) key1!37)))))

(declare-fun b!1569422 () Bool)

(assert (=> b!1569422 (= e!874892 call!72088)))

(declare-fun c!144732 () Bool)

(declare-fun bm!72085 () Bool)

(declare-fun $colon$colon!995 (List!36735 tuple2!25332) List!36735)

(assert (=> bm!72085 (= call!72087 ($colon$colon!995 e!874893 (ite c!144732 (h!38178 l!750) (tuple2!25333 key1!37 v1!32))))))

(declare-fun c!144733 () Bool)

(assert (=> bm!72085 (= c!144733 c!144732)))

(declare-fun bm!72086 () Bool)

(assert (=> bm!72086 (= call!72089 call!72088)))

(declare-fun d!163885 () Bool)

(assert (=> d!163885 e!874894))

(declare-fun res!1072606 () Bool)

(assert (=> d!163885 (=> (not res!1072606) (not e!874894))))

(assert (=> d!163885 (= res!1072606 (isStrictlySorted!1005 lt!673305))))

(assert (=> d!163885 (= lt!673305 e!874896)))

(assert (=> d!163885 (= c!144732 (and ((_ is Cons!36731) l!750) (bvslt (_1!12677 (h!38178 l!750)) key1!37)))))

(assert (=> d!163885 (isStrictlySorted!1005 l!750)))

(assert (=> d!163885 (= (insertStrictlySorted!591 l!750 key1!37 v1!32) lt!673305)))

(declare-fun b!1569423 () Bool)

(declare-fun contains!10422 (List!36735 tuple2!25332) Bool)

(assert (=> b!1569423 (= e!874894 (contains!10422 lt!673305 (tuple2!25333 key1!37 v1!32)))))

(declare-fun b!1569424 () Bool)

(declare-fun c!144734 () Bool)

(assert (=> b!1569424 (= c!144734 (and ((_ is Cons!36731) l!750) (bvsgt (_1!12677 (h!38178 l!750)) key1!37)))))

(assert (=> b!1569424 (= e!874892 e!874895)))

(declare-fun b!1569425 () Bool)

(assert (=> b!1569425 (= e!874896 call!72087)))

(declare-fun b!1569426 () Bool)

(assert (=> b!1569426 (= e!874893 (ite c!144731 (t!51643 l!750) (ite c!144734 (Cons!36731 (h!38178 l!750) (t!51643 l!750)) Nil!36732)))))

(declare-fun b!1569427 () Bool)

(assert (=> b!1569427 (= e!874895 call!72089)))

(assert (= (and d!163885 c!144732) b!1569425))

(assert (= (and d!163885 (not c!144732)) b!1569421))

(assert (= (and b!1569421 c!144731) b!1569422))

(assert (= (and b!1569421 (not c!144731)) b!1569424))

(assert (= (and b!1569424 c!144734) b!1569418))

(assert (= (and b!1569424 (not c!144734)) b!1569427))

(assert (= (or b!1569418 b!1569427) bm!72086))

(assert (= (or b!1569422 bm!72086) bm!72084))

(assert (= (or b!1569425 bm!72084) bm!72085))

(assert (= (and bm!72085 c!144733) b!1569419))

(assert (= (and bm!72085 (not c!144733)) b!1569426))

(assert (= (and d!163885 res!1072606) b!1569420))

(assert (= (and b!1569420 res!1072605) b!1569423))

(declare-fun m!1443779 () Bool)

(assert (=> d!163885 m!1443779))

