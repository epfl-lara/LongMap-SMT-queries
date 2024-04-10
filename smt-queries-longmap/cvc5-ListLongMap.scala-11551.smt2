; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134468 () Bool)

(assert start!134468)

(declare-fun b!1569794 () Bool)

(declare-fun e!875132 () Bool)

(declare-datatypes ((B!2540 0))(
  ( (B!2541 (val!19632 Int)) )
))
(declare-datatypes ((tuple2!25366 0))(
  ( (tuple2!25367 (_1!12694 (_ BitVec 64)) (_2!12694 B!2540)) )
))
(declare-datatypes ((List!36752 0))(
  ( (Nil!36749) (Cons!36748 (h!38195 tuple2!25366) (t!51660 List!36752)) )
))
(declare-fun l!750 () List!36752)

(declare-fun ListPrimitiveSize!190 (List!36752) Int)

(assert (=> b!1569794 (= e!875132 (>= (ListPrimitiveSize!190 (t!51660 l!750)) (ListPrimitiveSize!190 l!750)))))

(declare-fun b!1569795 () Bool)

(declare-fun res!1072773 () Bool)

(assert (=> b!1569795 (=> (not res!1072773) (not e!875132))))

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun key1!37 () (_ BitVec 64))

(assert (=> b!1569795 (= res!1072773 (and (is-Cons!36748 l!750) (bvslt (_1!12694 (h!38195 l!750)) key1!37) (bvslt (_1!12694 (h!38195 l!750)) key2!21)))))

(declare-fun b!1569796 () Bool)

(declare-fun res!1072776 () Bool)

(assert (=> b!1569796 (=> (not res!1072776) (not e!875132))))

(declare-fun isStrictlySorted!1016 (List!36752) Bool)

(assert (=> b!1569796 (= res!1072776 (isStrictlySorted!1016 (t!51660 l!750)))))

(declare-fun b!1569797 () Bool)

(declare-fun e!875131 () Bool)

(declare-fun tp_is_empty!39091 () Bool)

(declare-fun tp!114192 () Bool)

(assert (=> b!1569797 (= e!875131 (and tp_is_empty!39091 tp!114192))))

(declare-fun b!1569798 () Bool)

(declare-fun res!1072775 () Bool)

(assert (=> b!1569798 (=> (not res!1072775) (not e!875132))))

(assert (=> b!1569798 (= res!1072775 (isStrictlySorted!1016 l!750))))

(declare-fun res!1072774 () Bool)

(assert (=> start!134468 (=> (not res!1072774) (not e!875132))))

(assert (=> start!134468 (= res!1072774 (not (= key1!37 key2!21)))))

(assert (=> start!134468 e!875132))

(assert (=> start!134468 true))

(assert (=> start!134468 e!875131))

(assert (= (and start!134468 res!1072774) b!1569798))

(assert (= (and b!1569798 res!1072775) b!1569795))

(assert (= (and b!1569795 res!1072773) b!1569796))

(assert (= (and b!1569796 res!1072776) b!1569794))

(assert (= (and start!134468 (is-Cons!36748 l!750)) b!1569797))

(declare-fun m!1443901 () Bool)

(assert (=> b!1569794 m!1443901))

(declare-fun m!1443903 () Bool)

(assert (=> b!1569794 m!1443903))

(declare-fun m!1443905 () Bool)

(assert (=> b!1569796 m!1443905))

(declare-fun m!1443907 () Bool)

(assert (=> b!1569798 m!1443907))

(push 1)

(assert (not b!1569796))

(assert (not b!1569794))

(assert (not b!1569798))

(assert tp_is_empty!39091)

(assert (not b!1569797))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!163953 () Bool)

(declare-fun lt!673331 () Int)

(assert (=> d!163953 (>= lt!673331 0)))

(declare-fun e!875162 () Int)

(assert (=> d!163953 (= lt!673331 e!875162)))

(declare-fun c!144790 () Bool)

(assert (=> d!163953 (= c!144790 (is-Nil!36749 (t!51660 l!750)))))

(assert (=> d!163953 (= (ListPrimitiveSize!190 (t!51660 l!750)) lt!673331)))

(declare-fun b!1569854 () Bool)

(assert (=> b!1569854 (= e!875162 0)))

(declare-fun b!1569855 () Bool)

(assert (=> b!1569855 (= e!875162 (+ 1 (ListPrimitiveSize!190 (t!51660 (t!51660 l!750)))))))

(assert (= (and d!163953 c!144790) b!1569854))

(assert (= (and d!163953 (not c!144790)) b!1569855))

(declare-fun m!1443929 () Bool)

(assert (=> b!1569855 m!1443929))

(assert (=> b!1569794 d!163953))

(declare-fun d!163957 () Bool)

(declare-fun lt!673332 () Int)

(assert (=> d!163957 (>= lt!673332 0)))

(declare-fun e!875163 () Int)

(assert (=> d!163957 (= lt!673332 e!875163)))

(declare-fun c!144791 () Bool)

(assert (=> d!163957 (= c!144791 (is-Nil!36749 l!750))))

(assert (=> d!163957 (= (ListPrimitiveSize!190 l!750) lt!673332)))

(declare-fun b!1569856 () Bool)

(assert (=> b!1569856 (= e!875163 0)))

(declare-fun b!1569857 () Bool)

(assert (=> b!1569857 (= e!875163 (+ 1 (ListPrimitiveSize!190 (t!51660 l!750))))))

(assert (= (and d!163957 c!144791) b!1569856))

(assert (= (and d!163957 (not c!144791)) b!1569857))

(assert (=> b!1569857 m!1443901))

(assert (=> b!1569794 d!163957))

(declare-fun d!163959 () Bool)

(declare-fun res!1072813 () Bool)

(declare-fun e!875168 () Bool)

(assert (=> d!163959 (=> res!1072813 e!875168)))

(assert (=> d!163959 (= res!1072813 (or (is-Nil!36749 l!750) (is-Nil!36749 (t!51660 l!750))))))

(assert (=> d!163959 (= (isStrictlySorted!1016 l!750) e!875168)))

(declare-fun b!1569862 () Bool)

(declare-fun e!875169 () Bool)

(assert (=> b!1569862 (= e!875168 e!875169)))

(declare-fun res!1072814 () Bool)

(assert (=> b!1569862 (=> (not res!1072814) (not e!875169))))

(assert (=> b!1569862 (= res!1072814 (bvslt (_1!12694 (h!38195 l!750)) (_1!12694 (h!38195 (t!51660 l!750)))))))

(declare-fun b!1569863 () Bool)

(assert (=> b!1569863 (= e!875169 (isStrictlySorted!1016 (t!51660 l!750)))))

(assert (= (and d!163959 (not res!1072813)) b!1569862))

(assert (= (and b!1569862 res!1072814) b!1569863))

(assert (=> b!1569863 m!1443905))

(assert (=> b!1569798 d!163959))

(declare-fun d!163963 () Bool)

(declare-fun res!1072815 () Bool)

(declare-fun e!875172 () Bool)

(assert (=> d!163963 (=> res!1072815 e!875172)))

