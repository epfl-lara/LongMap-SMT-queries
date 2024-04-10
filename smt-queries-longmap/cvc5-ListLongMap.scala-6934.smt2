; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87276 () Bool)

(assert start!87276)

(declare-fun res!679728 () Bool)

(declare-fun e!569176 () Bool)

(assert (=> start!87276 (=> (not res!679728) (not e!569176))))

(declare-datatypes ((B!1310 0))(
  ( (B!1311 (val!11739 Int)) )
))
(declare-datatypes ((tuple2!15024 0))(
  ( (tuple2!15025 (_1!7523 (_ BitVec 64)) (_2!7523 B!1310)) )
))
(declare-datatypes ((List!21331 0))(
  ( (Nil!21328) (Cons!21327 (h!22525 tuple2!15024) (t!30332 List!21331)) )
))
(declare-fun l!412 () List!21331)

(declare-fun isStrictlySorted!519 (List!21331) Bool)

(assert (=> start!87276 (= res!679728 (isStrictlySorted!519 l!412))))

(assert (=> start!87276 e!569176))

(declare-fun e!569175 () Bool)

(assert (=> start!87276 e!569175))

(declare-fun tp_is_empty!23377 () Bool)

(assert (=> start!87276 tp_is_empty!23377))

(declare-fun b!1011780 () Bool)

(declare-fun res!679727 () Bool)

(assert (=> b!1011780 (=> (not res!679727) (not e!569176))))

(declare-fun value!115 () B!1310)

(assert (=> b!1011780 (= res!679727 (and (is-Cons!21327 l!412) (= (_2!7523 (h!22525 l!412)) value!115)))))

(declare-fun b!1011781 () Bool)

(assert (=> b!1011781 (= e!569176 (not (isStrictlySorted!519 (t!30332 l!412))))))

(declare-fun b!1011782 () Bool)

(declare-fun tp!70211 () Bool)

(assert (=> b!1011782 (= e!569175 (and tp_is_empty!23377 tp!70211))))

(assert (= (and start!87276 res!679728) b!1011780))

(assert (= (and b!1011780 res!679727) b!1011781))

(assert (= (and start!87276 (is-Cons!21327 l!412)) b!1011782))

(declare-fun m!935739 () Bool)

(assert (=> start!87276 m!935739))

(declare-fun m!935741 () Bool)

(assert (=> b!1011781 m!935741))

(push 1)

(assert (not b!1011781))

(assert (not start!87276))

(assert (not b!1011782))

(assert tp_is_empty!23377)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120193 () Bool)

(declare-fun res!679753 () Bool)

(declare-fun e!569201 () Bool)

(assert (=> d!120193 (=> res!679753 e!569201)))

(assert (=> d!120193 (= res!679753 (or (is-Nil!21328 (t!30332 l!412)) (is-Nil!21328 (t!30332 (t!30332 l!412)))))))

(assert (=> d!120193 (= (isStrictlySorted!519 (t!30332 l!412)) e!569201)))

(declare-fun b!1011813 () Bool)

(declare-fun e!569202 () Bool)

(assert (=> b!1011813 (= e!569201 e!569202)))

(declare-fun res!679754 () Bool)

(assert (=> b!1011813 (=> (not res!679754) (not e!569202))))

(assert (=> b!1011813 (= res!679754 (bvslt (_1!7523 (h!22525 (t!30332 l!412))) (_1!7523 (h!22525 (t!30332 (t!30332 l!412))))))))

(declare-fun b!1011814 () Bool)

(assert (=> b!1011814 (= e!569202 (isStrictlySorted!519 (t!30332 (t!30332 l!412))))))

(assert (= (and d!120193 (not res!679753)) b!1011813))

(assert (= (and b!1011813 res!679754) b!1011814))

(declare-fun m!935751 () Bool)

(assert (=> b!1011814 m!935751))

(assert (=> b!1011781 d!120193))

(declare-fun d!120199 () Bool)

(declare-fun res!679755 () Bool)

(declare-fun e!569203 () Bool)

(assert (=> d!120199 (=> res!679755 e!569203)))

(assert (=> d!120199 (= res!679755 (or (is-Nil!21328 l!412) (is-Nil!21328 (t!30332 l!412))))))

(assert (=> d!120199 (= (isStrictlySorted!519 l!412) e!569203)))

(declare-fun b!1011815 () Bool)

(declare-fun e!569204 () Bool)

(assert (=> b!1011815 (= e!569203 e!569204)))

(declare-fun res!679756 () Bool)

(assert (=> b!1011815 (=> (not res!679756) (not e!569204))))

(assert (=> b!1011815 (= res!679756 (bvslt (_1!7523 (h!22525 l!412)) (_1!7523 (h!22525 (t!30332 l!412)))))))

(declare-fun b!1011816 () Bool)

(assert (=> b!1011816 (= e!569204 (isStrictlySorted!519 (t!30332 l!412)))))

(assert (= (and d!120199 (not res!679755)) b!1011815))

(assert (= (and b!1011815 res!679756) b!1011816))

(assert (=> b!1011816 m!935741))

(assert (=> start!87276 d!120199))

(declare-fun b!1011821 () Bool)

(declare-fun e!569207 () Bool)

(declare-fun tp!70220 () Bool)

(assert (=> b!1011821 (= e!569207 (and tp_is_empty!23377 tp!70220))))

(assert (=> b!1011782 (= tp!70211 e!569207)))

(assert (= (and b!1011782 (is-Cons!21327 (t!30332 l!412))) b!1011821))

(push 1)

(assert (not b!1011814))

(assert (not b!1011816))

(assert (not b!1011821))

(assert tp_is_empty!23377)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

