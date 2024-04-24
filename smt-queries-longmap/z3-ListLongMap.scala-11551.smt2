; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134880 () Bool)

(assert start!134880)

(declare-fun b!1572230 () Bool)

(declare-fun e!876641 () Bool)

(declare-datatypes ((B!2540 0))(
  ( (B!2541 (val!19632 Int)) )
))
(declare-datatypes ((tuple2!25426 0))(
  ( (tuple2!25427 (_1!12724 (_ BitVec 64)) (_2!12724 B!2540)) )
))
(declare-datatypes ((List!36784 0))(
  ( (Nil!36781) (Cons!36780 (h!38245 tuple2!25426) (t!51684 List!36784)) )
))
(declare-fun l!750 () List!36784)

(declare-fun ListPrimitiveSize!190 (List!36784) Int)

(assert (=> b!1572230 (= e!876641 (>= (ListPrimitiveSize!190 (t!51684 l!750)) (ListPrimitiveSize!190 l!750)))))

(declare-fun b!1572231 () Bool)

(declare-fun e!876640 () Bool)

(declare-fun tp_is_empty!39091 () Bool)

(declare-fun tp!114192 () Bool)

(assert (=> b!1572231 (= e!876640 (and tp_is_empty!39091 tp!114192))))

(declare-fun b!1572232 () Bool)

(declare-fun res!1073634 () Bool)

(assert (=> b!1572232 (=> (not res!1073634) (not e!876641))))

(declare-fun isStrictlySorted!1004 (List!36784) Bool)

(assert (=> b!1572232 (= res!1073634 (isStrictlySorted!1004 (t!51684 l!750)))))

(declare-fun b!1572233 () Bool)

(declare-fun res!1073636 () Bool)

(assert (=> b!1572233 (=> (not res!1073636) (not e!876641))))

(assert (=> b!1572233 (= res!1073636 (isStrictlySorted!1004 l!750))))

(declare-fun res!1073633 () Bool)

(assert (=> start!134880 (=> (not res!1073633) (not e!876641))))

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun key2!21 () (_ BitVec 64))

(assert (=> start!134880 (= res!1073633 (not (= key1!37 key2!21)))))

(assert (=> start!134880 e!876641))

(assert (=> start!134880 true))

(assert (=> start!134880 e!876640))

(declare-fun b!1572234 () Bool)

(declare-fun res!1073635 () Bool)

(assert (=> b!1572234 (=> (not res!1073635) (not e!876641))))

(get-info :version)

(assert (=> b!1572234 (= res!1073635 (and ((_ is Cons!36780) l!750) (bvslt (_1!12724 (h!38245 l!750)) key1!37) (bvslt (_1!12724 (h!38245 l!750)) key2!21)))))

(assert (= (and start!134880 res!1073633) b!1572233))

(assert (= (and b!1572233 res!1073636) b!1572234))

(assert (= (and b!1572234 res!1073635) b!1572232))

(assert (= (and b!1572232 res!1073634) b!1572230))

(assert (= (and start!134880 ((_ is Cons!36780) l!750)) b!1572231))

(declare-fun m!1446159 () Bool)

(assert (=> b!1572230 m!1446159))

(declare-fun m!1446161 () Bool)

(assert (=> b!1572230 m!1446161))

(declare-fun m!1446163 () Bool)

(assert (=> b!1572232 m!1446163))

(declare-fun m!1446165 () Bool)

(assert (=> b!1572233 m!1446165))

(check-sat (not b!1572230) (not b!1572233) (not b!1572232) (not b!1572231) tp_is_empty!39091)
(check-sat)
(get-model)

(declare-fun d!164649 () Bool)

(declare-fun lt!674235 () Int)

(assert (=> d!164649 (>= lt!674235 0)))

(declare-fun e!876656 () Int)

(assert (=> d!164649 (= lt!674235 e!876656)))

(declare-fun c!145586 () Bool)

(assert (=> d!164649 (= c!145586 ((_ is Nil!36781) (t!51684 l!750)))))

(assert (=> d!164649 (= (ListPrimitiveSize!190 (t!51684 l!750)) lt!674235)))

(declare-fun b!1572269 () Bool)

(assert (=> b!1572269 (= e!876656 0)))

(declare-fun b!1572270 () Bool)

(assert (=> b!1572270 (= e!876656 (+ 1 (ListPrimitiveSize!190 (t!51684 (t!51684 l!750)))))))

(assert (= (and d!164649 c!145586) b!1572269))

(assert (= (and d!164649 (not c!145586)) b!1572270))

(declare-fun m!1446183 () Bool)

(assert (=> b!1572270 m!1446183))

(assert (=> b!1572230 d!164649))

(declare-fun d!164651 () Bool)

(declare-fun lt!674236 () Int)

(assert (=> d!164651 (>= lt!674236 0)))

(declare-fun e!876657 () Int)

(assert (=> d!164651 (= lt!674236 e!876657)))

(declare-fun c!145587 () Bool)

(assert (=> d!164651 (= c!145587 ((_ is Nil!36781) l!750))))

(assert (=> d!164651 (= (ListPrimitiveSize!190 l!750) lt!674236)))

(declare-fun b!1572271 () Bool)

(assert (=> b!1572271 (= e!876657 0)))

(declare-fun b!1572272 () Bool)

(assert (=> b!1572272 (= e!876657 (+ 1 (ListPrimitiveSize!190 (t!51684 l!750))))))

(assert (= (and d!164651 c!145587) b!1572271))

(assert (= (and d!164651 (not c!145587)) b!1572272))

(assert (=> b!1572272 m!1446159))

(assert (=> b!1572230 d!164651))

(declare-fun d!164653 () Bool)

(declare-fun res!1073665 () Bool)

(declare-fun e!876662 () Bool)

(assert (=> d!164653 (=> res!1073665 e!876662)))

(assert (=> d!164653 (= res!1073665 (or ((_ is Nil!36781) l!750) ((_ is Nil!36781) (t!51684 l!750))))))

(assert (=> d!164653 (= (isStrictlySorted!1004 l!750) e!876662)))

(declare-fun b!1572277 () Bool)

(declare-fun e!876663 () Bool)

(assert (=> b!1572277 (= e!876662 e!876663)))

(declare-fun res!1073666 () Bool)

(assert (=> b!1572277 (=> (not res!1073666) (not e!876663))))

(assert (=> b!1572277 (= res!1073666 (bvslt (_1!12724 (h!38245 l!750)) (_1!12724 (h!38245 (t!51684 l!750)))))))

(declare-fun b!1572278 () Bool)

(assert (=> b!1572278 (= e!876663 (isStrictlySorted!1004 (t!51684 l!750)))))

(assert (= (and d!164653 (not res!1073665)) b!1572277))

(assert (= (and b!1572277 res!1073666) b!1572278))

(assert (=> b!1572278 m!1446163))

(assert (=> b!1572233 d!164653))

(declare-fun d!164657 () Bool)

(declare-fun res!1073667 () Bool)

(declare-fun e!876664 () Bool)

(assert (=> d!164657 (=> res!1073667 e!876664)))

(assert (=> d!164657 (= res!1073667 (or ((_ is Nil!36781) (t!51684 l!750)) ((_ is Nil!36781) (t!51684 (t!51684 l!750)))))))

(assert (=> d!164657 (= (isStrictlySorted!1004 (t!51684 l!750)) e!876664)))

(declare-fun b!1572279 () Bool)

(declare-fun e!876665 () Bool)

(assert (=> b!1572279 (= e!876664 e!876665)))

(declare-fun res!1073668 () Bool)

(assert (=> b!1572279 (=> (not res!1073668) (not e!876665))))

(assert (=> b!1572279 (= res!1073668 (bvslt (_1!12724 (h!38245 (t!51684 l!750))) (_1!12724 (h!38245 (t!51684 (t!51684 l!750))))))))

(declare-fun b!1572280 () Bool)

(assert (=> b!1572280 (= e!876665 (isStrictlySorted!1004 (t!51684 (t!51684 l!750))))))

(assert (= (and d!164657 (not res!1073667)) b!1572279))

(assert (= (and b!1572279 res!1073668) b!1572280))

(declare-fun m!1446185 () Bool)

(assert (=> b!1572280 m!1446185))

(assert (=> b!1572232 d!164657))

(declare-fun b!1572289 () Bool)

(declare-fun e!876670 () Bool)

(declare-fun tp!114201 () Bool)

(assert (=> b!1572289 (= e!876670 (and tp_is_empty!39091 tp!114201))))

(assert (=> b!1572231 (= tp!114192 e!876670)))

(assert (= (and b!1572231 ((_ is Cons!36780) (t!51684 l!750))) b!1572289))

(check-sat (not b!1572272) (not b!1572280) (not b!1572278) (not b!1572270) (not b!1572289) tp_is_empty!39091)
(check-sat)
