; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134394 () Bool)

(assert start!134394)

(declare-datatypes ((B!2508 0))(
  ( (B!2509 (val!19616 Int)) )
))
(declare-fun v1!32 () B!2508)

(declare-fun e!874828 () Bool)

(declare-datatypes ((tuple2!25334 0))(
  ( (tuple2!25335 (_1!12678 (_ BitVec 64)) (_2!12678 B!2508)) )
))
(declare-datatypes ((List!36736 0))(
  ( (Nil!36733) (Cons!36732 (h!38179 tuple2!25334) (t!51644 List!36736)) )
))
(declare-fun l!750 () List!36736)

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun b!1569317 () Bool)

(declare-fun isStrictlySorted!1006 (List!36736) Bool)

(declare-fun insertStrictlySorted!592 (List!36736 (_ BitVec 64) B!2508) List!36736)

(assert (=> b!1569317 (= e!874828 (not (isStrictlySorted!1006 (insertStrictlySorted!592 l!750 key1!37 v1!32))))))

(declare-fun b!1569315 () Bool)

(declare-fun res!1072564 () Bool)

(assert (=> b!1569315 (=> (not res!1072564) (not e!874828))))

(assert (=> b!1569315 (= res!1072564 (isStrictlySorted!1006 l!750))))

(declare-fun b!1569316 () Bool)

(declare-fun res!1072565 () Bool)

(assert (=> b!1569316 (=> (not res!1072565) (not e!874828))))

(declare-fun key2!21 () (_ BitVec 64))

(assert (=> b!1569316 (= res!1072565 (or (not (is-Cons!36732 l!750)) (bvsge (_1!12678 (h!38179 l!750)) key1!37) (bvsge (_1!12678 (h!38179 l!750)) key2!21)))))

(declare-fun b!1569318 () Bool)

(declare-fun e!874829 () Bool)

(declare-fun tp_is_empty!39059 () Bool)

(declare-fun tp!114108 () Bool)

(assert (=> b!1569318 (= e!874829 (and tp_is_empty!39059 tp!114108))))

(declare-fun res!1072566 () Bool)

(assert (=> start!134394 (=> (not res!1072566) (not e!874828))))

(assert (=> start!134394 (= res!1072566 (not (= key1!37 key2!21)))))

(assert (=> start!134394 e!874828))

(assert (=> start!134394 true))

(assert (=> start!134394 e!874829))

(assert (=> start!134394 tp_is_empty!39059))

(assert (= (and start!134394 res!1072566) b!1569315))

(assert (= (and b!1569315 res!1072564) b!1569316))

(assert (= (and b!1569316 res!1072565) b!1569317))

(assert (= (and start!134394 (is-Cons!36732 l!750)) b!1569318))

(declare-fun m!1443751 () Bool)

(assert (=> b!1569317 m!1443751))

(assert (=> b!1569317 m!1443751))

(declare-fun m!1443753 () Bool)

(assert (=> b!1569317 m!1443753))

(declare-fun m!1443755 () Bool)

(assert (=> b!1569315 m!1443755))

(push 1)

(assert (not b!1569315))

(assert (not b!1569317))

(assert (not b!1569318))

(assert tp_is_empty!39059)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!163879 () Bool)

(declare-fun res!1072587 () Bool)

(declare-fun e!874850 () Bool)

(assert (=> d!163879 (=> res!1072587 e!874850)))

(assert (=> d!163879 (= res!1072587 (or (is-Nil!36733 l!750) (is-Nil!36733 (t!51644 l!750))))))

(assert (=> d!163879 (= (isStrictlySorted!1006 l!750) e!874850)))

(declare-fun b!1569339 () Bool)

(declare-fun e!874851 () Bool)

(assert (=> b!1569339 (= e!874850 e!874851)))

(declare-fun res!1072588 () Bool)

(assert (=> b!1569339 (=> (not res!1072588) (not e!874851))))

(assert (=> b!1569339 (= res!1072588 (bvslt (_1!12678 (h!38179 l!750)) (_1!12678 (h!38179 (t!51644 l!750)))))))

(declare-fun b!1569340 () Bool)

(assert (=> b!1569340 (= e!874851 (isStrictlySorted!1006 (t!51644 l!750)))))

(assert (= (and d!163879 (not res!1072587)) b!1569339))

(assert (= (and b!1569339 res!1072588) b!1569340))

(declare-fun m!1443765 () Bool)

(assert (=> b!1569340 m!1443765))

(assert (=> b!1569315 d!163879))

(declare-fun d!163889 () Bool)

(declare-fun res!1072589 () Bool)

(declare-fun e!874852 () Bool)

(assert (=> d!163889 (=> res!1072589 e!874852)))

(assert (=> d!163889 (= res!1072589 (or (is-Nil!36733 (insertStrictlySorted!592 l!750 key1!37 v1!32)) (is-Nil!36733 (t!51644 (insertStrictlySorted!592 l!750 key1!37 v1!32)))))))

(assert (=> d!163889 (= (isStrictlySorted!1006 (insertStrictlySorted!592 l!750 key1!37 v1!32)) e!874852)))

(declare-fun b!1569341 () Bool)

(declare-fun e!874853 () Bool)

(assert (=> b!1569341 (= e!874852 e!874853)))

(declare-fun res!1072590 () Bool)

(assert (=> b!1569341 (=> (not res!1072590) (not e!874853))))

(assert (=> b!1569341 (= res!1072590 (bvslt (_1!12678 (h!38179 (insertStrictlySorted!592 l!750 key1!37 v1!32))) (_1!12678 (h!38179 (t!51644 (insertStrictlySorted!592 l!750 key1!37 v1!32))))))))

(declare-fun b!1569342 () Bool)

(assert (=> b!1569342 (= e!874853 (isStrictlySorted!1006 (t!51644 (insertStrictlySorted!592 l!750 key1!37 v1!32))))))

(assert (= (and d!163889 (not res!1072589)) b!1569341))

(assert (= (and b!1569341 res!1072590) b!1569342))

(declare-fun m!1443767 () Bool)

(assert (=> b!1569342 m!1443767))

(assert (=> b!1569317 d!163889))

(declare-fun bm!72087 () Bool)

(declare-fun call!72090 () List!36736)

(declare-fun call!72091 () List!36736)

(assert (=> bm!72087 (= call!72090 call!72091)))

(declare-fun b!1569432 () Bool)

(declare-fun e!874901 () List!36736)

(declare-fun e!874899 () List!36736)

(assert (=> b!1569432 (= e!874901 e!874899)))

(declare-fun c!144736 () Bool)

(assert (=> b!1569432 (= c!144736 (and (is-Cons!36732 l!750) (= (_1!12678 (h!38179 l!750)) key1!37)))))

(declare-fun e!874903 () Bool)

(declare-fun lt!673306 () List!36736)

(declare-fun b!1569433 () Bool)

(declare-fun contains!10423 (List!36736 tuple2!25334) Bool)

