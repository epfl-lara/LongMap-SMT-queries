; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134382 () Bool)

(assert start!134382)

(declare-fun res!1072553 () Bool)

(declare-fun e!874819 () Bool)

(assert (=> start!134382 (=> (not res!1072553) (not e!874819))))

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun key2!21 () (_ BitVec 64))

(assert (=> start!134382 (= res!1072553 (not (= key1!37 key2!21)))))

(assert (=> start!134382 e!874819))

(assert (=> start!134382 true))

(declare-fun e!874820 () Bool)

(assert (=> start!134382 e!874820))

(declare-fun b!1569315 () Bool)

(declare-fun res!1072554 () Bool)

(assert (=> b!1569315 (=> (not res!1072554) (not e!874819))))

(declare-datatypes ((B!2522 0))(
  ( (B!2523 (val!19623 Int)) )
))
(declare-datatypes ((tuple2!25416 0))(
  ( (tuple2!25417 (_1!12719 (_ BitVec 64)) (_2!12719 B!2522)) )
))
(declare-datatypes ((List!36784 0))(
  ( (Nil!36781) (Cons!36780 (h!38228 tuple2!25416) (t!51684 List!36784)) )
))
(declare-fun l!750 () List!36784)

(declare-fun isStrictlySorted!1008 (List!36784) Bool)

(assert (=> b!1569315 (= res!1072554 (isStrictlySorted!1008 l!750))))

(declare-fun b!1569316 () Bool)

(declare-fun ListPrimitiveSize!187 (List!36784) Int)

(assert (=> b!1569316 (= e!874819 (< (ListPrimitiveSize!187 l!750) 0))))

(declare-fun b!1569317 () Bool)

(declare-fun tp_is_empty!39073 () Bool)

(declare-fun tp!114148 () Bool)

(assert (=> b!1569317 (= e!874820 (and tp_is_empty!39073 tp!114148))))

(assert (= (and start!134382 res!1072553) b!1569315))

(assert (= (and b!1569315 res!1072554) b!1569316))

(get-info :version)

(assert (= (and start!134382 ((_ is Cons!36780) l!750)) b!1569317))

(declare-fun m!1442967 () Bool)

(assert (=> b!1569315 m!1442967))

(declare-fun m!1442969 () Bool)

(assert (=> b!1569316 m!1442969))

(check-sat (not b!1569315) (not b!1569316) (not b!1569317) tp_is_empty!39073)
(check-sat)
(get-model)

(declare-fun d!163663 () Bool)

(declare-fun res!1072575 () Bool)

(declare-fun e!874841 () Bool)

(assert (=> d!163663 (=> res!1072575 e!874841)))

(assert (=> d!163663 (= res!1072575 (or ((_ is Nil!36781) l!750) ((_ is Nil!36781) (t!51684 l!750))))))

(assert (=> d!163663 (= (isStrictlySorted!1008 l!750) e!874841)))

(declare-fun b!1569344 () Bool)

(declare-fun e!874842 () Bool)

(assert (=> b!1569344 (= e!874841 e!874842)))

(declare-fun res!1072576 () Bool)

(assert (=> b!1569344 (=> (not res!1072576) (not e!874842))))

(assert (=> b!1569344 (= res!1072576 (bvslt (_1!12719 (h!38228 l!750)) (_1!12719 (h!38228 (t!51684 l!750)))))))

(declare-fun b!1569345 () Bool)

(assert (=> b!1569345 (= e!874842 (isStrictlySorted!1008 (t!51684 l!750)))))

(assert (= (and d!163663 (not res!1072575)) b!1569344))

(assert (= (and b!1569344 res!1072576) b!1569345))

(declare-fun m!1442979 () Bool)

(assert (=> b!1569345 m!1442979))

(assert (=> b!1569315 d!163663))

(declare-fun d!163669 () Bool)

(declare-fun lt!673034 () Int)

(assert (=> d!163669 (>= lt!673034 0)))

(declare-fun e!874855 () Int)

(assert (=> d!163669 (= lt!673034 e!874855)))

(declare-fun c!144690 () Bool)

(assert (=> d!163669 (= c!144690 ((_ is Nil!36781) l!750))))

(assert (=> d!163669 (= (ListPrimitiveSize!187 l!750) lt!673034)))

(declare-fun b!1569362 () Bool)

(assert (=> b!1569362 (= e!874855 0)))

(declare-fun b!1569363 () Bool)

(assert (=> b!1569363 (= e!874855 (+ 1 (ListPrimitiveSize!187 (t!51684 l!750))))))

(assert (= (and d!163669 c!144690) b!1569362))

(assert (= (and d!163669 (not c!144690)) b!1569363))

(declare-fun m!1442985 () Bool)

(assert (=> b!1569363 m!1442985))

(assert (=> b!1569316 d!163669))

(declare-fun b!1569378 () Bool)

(declare-fun e!874863 () Bool)

(declare-fun tp!114157 () Bool)

(assert (=> b!1569378 (= e!874863 (and tp_is_empty!39073 tp!114157))))

(assert (=> b!1569317 (= tp!114148 e!874863)))

(assert (= (and b!1569317 ((_ is Cons!36780) (t!51684 l!750))) b!1569378))

(check-sat (not b!1569363) (not b!1569345) (not b!1569378) tp_is_empty!39073)
(check-sat)
