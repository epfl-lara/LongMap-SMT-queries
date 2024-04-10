; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134434 () Bool)

(assert start!134434)

(declare-fun res!1072689 () Bool)

(declare-fun e!875023 () Bool)

(assert (=> start!134434 (=> (not res!1072689) (not e!875023))))

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun key2!21 () (_ BitVec 64))

(assert (=> start!134434 (= res!1072689 (not (= key1!37 key2!21)))))

(assert (=> start!134434 e!875023))

(assert (=> start!134434 true))

(declare-fun e!875024 () Bool)

(assert (=> start!134434 e!875024))

(declare-fun b!1569637 () Bool)

(declare-fun res!1072688 () Bool)

(assert (=> b!1569637 (=> (not res!1072688) (not e!875023))))

(declare-datatypes ((B!2524 0))(
  ( (B!2525 (val!19624 Int)) )
))
(declare-datatypes ((tuple2!25350 0))(
  ( (tuple2!25351 (_1!12686 (_ BitVec 64)) (_2!12686 B!2524)) )
))
(declare-datatypes ((List!36744 0))(
  ( (Nil!36741) (Cons!36740 (h!38187 tuple2!25350) (t!51652 List!36744)) )
))
(declare-fun l!750 () List!36744)

(declare-fun isStrictlySorted!1011 (List!36744) Bool)

(assert (=> b!1569637 (= res!1072688 (isStrictlySorted!1011 l!750))))

(declare-fun b!1569638 () Bool)

(declare-fun ListPrimitiveSize!188 (List!36744) Int)

(assert (=> b!1569638 (= e!875023 (< (ListPrimitiveSize!188 l!750) 0))))

(declare-fun b!1569639 () Bool)

(declare-fun tp_is_empty!39075 () Bool)

(declare-fun tp!114150 () Bool)

(assert (=> b!1569639 (= e!875024 (and tp_is_empty!39075 tp!114150))))

(assert (= (and start!134434 res!1072689) b!1569637))

(assert (= (and b!1569637 res!1072688) b!1569638))

(get-info :version)

(assert (= (and start!134434 ((_ is Cons!36740) l!750)) b!1569639))

(declare-fun m!1443863 () Bool)

(assert (=> b!1569637 m!1443863))

(declare-fun m!1443865 () Bool)

(assert (=> b!1569638 m!1443865))

(check-sat (not b!1569638) (not b!1569637) (not b!1569639) tp_is_empty!39075)
(check-sat)
(get-model)

(declare-fun d!163919 () Bool)

(declare-fun lt!673318 () Int)

(assert (=> d!163919 (>= lt!673318 0)))

(declare-fun e!875037 () Int)

(assert (=> d!163919 (= lt!673318 e!875037)))

(declare-fun c!144777 () Bool)

(assert (=> d!163919 (= c!144777 ((_ is Nil!36741) l!750))))

(assert (=> d!163919 (= (ListPrimitiveSize!188 l!750) lt!673318)))

(declare-fun b!1569657 () Bool)

(assert (=> b!1569657 (= e!875037 0)))

(declare-fun b!1569658 () Bool)

(assert (=> b!1569658 (= e!875037 (+ 1 (ListPrimitiveSize!188 (t!51652 l!750))))))

(assert (= (and d!163919 c!144777) b!1569657))

(assert (= (and d!163919 (not c!144777)) b!1569658))

(declare-fun m!1443871 () Bool)

(assert (=> b!1569658 m!1443871))

(assert (=> b!1569638 d!163919))

(declare-fun d!163923 () Bool)

(declare-fun res!1072706 () Bool)

(declare-fun e!875050 () Bool)

(assert (=> d!163923 (=> res!1072706 e!875050)))

(assert (=> d!163923 (= res!1072706 (or ((_ is Nil!36741) l!750) ((_ is Nil!36741) (t!51652 l!750))))))

(assert (=> d!163923 (= (isStrictlySorted!1011 l!750) e!875050)))

(declare-fun b!1569677 () Bool)

(declare-fun e!875051 () Bool)

(assert (=> b!1569677 (= e!875050 e!875051)))

(declare-fun res!1072707 () Bool)

(assert (=> b!1569677 (=> (not res!1072707) (not e!875051))))

(assert (=> b!1569677 (= res!1072707 (bvslt (_1!12686 (h!38187 l!750)) (_1!12686 (h!38187 (t!51652 l!750)))))))

(declare-fun b!1569678 () Bool)

(assert (=> b!1569678 (= e!875051 (isStrictlySorted!1011 (t!51652 l!750)))))

(assert (= (and d!163923 (not res!1072706)) b!1569677))

(assert (= (and b!1569677 res!1072707) b!1569678))

(declare-fun m!1443879 () Bool)

(assert (=> b!1569678 m!1443879))

(assert (=> b!1569637 d!163923))

(declare-fun b!1569688 () Bool)

(declare-fun e!875059 () Bool)

(declare-fun tp!114159 () Bool)

(assert (=> b!1569688 (= e!875059 (and tp_is_empty!39075 tp!114159))))

(assert (=> b!1569639 (= tp!114150 e!875059)))

(assert (= (and b!1569639 ((_ is Cons!36740) (t!51652 l!750))) b!1569688))

(check-sat (not b!1569658) (not b!1569678) (not b!1569688) tp_is_empty!39075)
(check-sat)
