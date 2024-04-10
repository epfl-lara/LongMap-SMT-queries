; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134472 () Bool)

(assert start!134472)

(declare-fun b!1569824 () Bool)

(declare-fun e!875144 () Bool)

(declare-fun tp_is_empty!39095 () Bool)

(declare-fun tp!114198 () Bool)

(assert (=> b!1569824 (= e!875144 (and tp_is_empty!39095 tp!114198))))

(declare-fun b!1569825 () Bool)

(declare-fun res!1072798 () Bool)

(declare-fun e!875143 () Bool)

(assert (=> b!1569825 (=> (not res!1072798) (not e!875143))))

(declare-datatypes ((B!2544 0))(
  ( (B!2545 (val!19634 Int)) )
))
(declare-datatypes ((tuple2!25370 0))(
  ( (tuple2!25371 (_1!12696 (_ BitVec 64)) (_2!12696 B!2544)) )
))
(declare-datatypes ((List!36754 0))(
  ( (Nil!36751) (Cons!36750 (h!38197 tuple2!25370) (t!51662 List!36754)) )
))
(declare-fun l!750 () List!36754)

(declare-fun isStrictlySorted!1018 (List!36754) Bool)

(assert (=> b!1569825 (= res!1072798 (isStrictlySorted!1018 l!750))))

(declare-fun b!1569826 () Bool)

(declare-fun res!1072799 () Bool)

(assert (=> b!1569826 (=> (not res!1072799) (not e!875143))))

(assert (=> b!1569826 (= res!1072799 (isStrictlySorted!1018 (t!51662 l!750)))))

(declare-fun b!1569827 () Bool)

(declare-fun ListPrimitiveSize!192 (List!36754) Int)

(assert (=> b!1569827 (= e!875143 (>= (ListPrimitiveSize!192 (t!51662 l!750)) (ListPrimitiveSize!192 l!750)))))

(declare-fun b!1569828 () Bool)

(declare-fun res!1072800 () Bool)

(assert (=> b!1569828 (=> (not res!1072800) (not e!875143))))

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun key1!37 () (_ BitVec 64))

(assert (=> b!1569828 (= res!1072800 (and (is-Cons!36750 l!750) (bvslt (_1!12696 (h!38197 l!750)) key1!37) (bvslt (_1!12696 (h!38197 l!750)) key2!21)))))

(declare-fun res!1072797 () Bool)

(assert (=> start!134472 (=> (not res!1072797) (not e!875143))))

(assert (=> start!134472 (= res!1072797 (not (= key1!37 key2!21)))))

(assert (=> start!134472 e!875143))

(assert (=> start!134472 true))

(assert (=> start!134472 e!875144))

(assert (= (and start!134472 res!1072797) b!1569825))

(assert (= (and b!1569825 res!1072798) b!1569828))

(assert (= (and b!1569828 res!1072800) b!1569826))

(assert (= (and b!1569826 res!1072799) b!1569827))

(assert (= (and start!134472 (is-Cons!36750 l!750)) b!1569824))

(declare-fun m!1443917 () Bool)

(assert (=> b!1569825 m!1443917))

(declare-fun m!1443919 () Bool)

(assert (=> b!1569826 m!1443919))

(declare-fun m!1443921 () Bool)

(assert (=> b!1569827 m!1443921))

(declare-fun m!1443923 () Bool)

(assert (=> b!1569827 m!1443923))

(push 1)

(assert tp_is_empty!39095)

(assert (not b!1569826))

(assert (not b!1569827))

(assert (not b!1569824))

(assert (not b!1569825))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!163961 () Bool)

(declare-fun lt!673335 () Int)

(assert (=> d!163961 (>= lt!673335 0)))

(declare-fun e!875176 () Int)

(assert (=> d!163961 (= lt!673335 e!875176)))

(declare-fun c!144794 () Bool)

(assert (=> d!163961 (= c!144794 (is-Nil!36751 (t!51662 l!750)))))

(assert (=> d!163961 (= (ListPrimitiveSize!192 (t!51662 l!750)) lt!673335)))

(declare-fun b!1569874 () Bool)

(assert (=> b!1569874 (= e!875176 0)))

(declare-fun b!1569875 () Bool)

(assert (=> b!1569875 (= e!875176 (+ 1 (ListPrimitiveSize!192 (t!51662 (t!51662 l!750)))))))

(assert (= (and d!163961 c!144794) b!1569874))

(assert (= (and d!163961 (not c!144794)) b!1569875))

(declare-fun m!1443933 () Bool)

(assert (=> b!1569875 m!1443933))

(assert (=> b!1569827 d!163961))

(declare-fun d!163965 () Bool)

(declare-fun lt!673336 () Int)

(assert (=> d!163965 (>= lt!673336 0)))

(declare-fun e!875177 () Int)

(assert (=> d!163965 (= lt!673336 e!875177)))

(declare-fun c!144795 () Bool)

(assert (=> d!163965 (= c!144795 (is-Nil!36751 l!750))))

