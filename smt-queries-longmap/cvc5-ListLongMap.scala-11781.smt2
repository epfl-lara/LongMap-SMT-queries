; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138386 () Bool)

(assert start!138386)

(declare-fun res!1083290 () Bool)

(declare-fun e!885746 () Bool)

(assert (=> start!138386 (=> (not res!1083290) (not e!885746))))

(declare-datatypes ((B!3026 0))(
  ( (B!3027 (val!19875 Int)) )
))
(declare-datatypes ((tuple2!25918 0))(
  ( (tuple2!25919 (_1!12970 (_ BitVec 64)) (_2!12970 B!3026)) )
))
(declare-datatypes ((List!36995 0))(
  ( (Nil!36992) (Cons!36991 (h!38534 tuple2!25918) (t!51925 List!36995)) )
))
(declare-fun l!636 () List!36995)

(declare-fun isStrictlySorted!1217 (List!36995) Bool)

(assert (=> start!138386 (= res!1083290 (isStrictlySorted!1217 l!636))))

(assert (=> start!138386 e!885746))

(declare-fun e!885747 () Bool)

(assert (=> start!138386 e!885747))

(declare-fun b!1586191 () Bool)

(declare-fun ListPrimitiveSize!229 (List!36995) Int)

(assert (=> b!1586191 (= e!885746 (< (ListPrimitiveSize!229 l!636) 0))))

(declare-fun b!1586192 () Bool)

(declare-fun tp_is_empty!39559 () Bool)

(declare-fun tp!115380 () Bool)

(assert (=> b!1586192 (= e!885747 (and tp_is_empty!39559 tp!115380))))

(assert (= (and start!138386 res!1083290) b!1586191))

(assert (= (and start!138386 (is-Cons!36991 l!636)) b!1586192))

(declare-fun m!1454679 () Bool)

(assert (=> start!138386 m!1454679))

(declare-fun m!1454681 () Bool)

(assert (=> b!1586191 m!1454681))

(push 1)

(assert (not b!1586191))

(assert (not start!138386))

(assert (not b!1586192))

(assert tp_is_empty!39559)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167887 () Bool)

(declare-fun lt!677502 () Int)

(assert (=> d!167887 (>= lt!677502 0)))

(declare-fun e!885769 () Int)

(assert (=> d!167887 (= lt!677502 e!885769)))

(declare-fun c!147039 () Bool)

(assert (=> d!167887 (= c!147039 (is-Nil!36992 l!636))))

(assert (=> d!167887 (= (ListPrimitiveSize!229 l!636) lt!677502)))

(declare-fun b!1586218 () Bool)

(assert (=> b!1586218 (= e!885769 0)))

(declare-fun b!1586220 () Bool)

(assert (=> b!1586220 (= e!885769 (+ 1 (ListPrimitiveSize!229 (t!51925 l!636))))))

(assert (= (and d!167887 c!147039) b!1586218))

(assert (= (and d!167887 (not c!147039)) b!1586220))

(declare-fun m!1454692 () Bool)

(assert (=> b!1586220 m!1454692))

(assert (=> b!1586191 d!167887))

(declare-fun d!167891 () Bool)

(declare-fun res!1083311 () Bool)

(declare-fun e!885782 () Bool)

(assert (=> d!167891 (=> res!1083311 e!885782)))

(assert (=> d!167891 (= res!1083311 (or (is-Nil!36992 l!636) (is-Nil!36992 (t!51925 l!636))))))

(assert (=> d!167891 (= (isStrictlySorted!1217 l!636) e!885782)))

(declare-fun b!1586235 () Bool)

(declare-fun e!885783 () Bool)

(assert (=> b!1586235 (= e!885782 e!885783)))

(declare-fun res!1083312 () Bool)

(assert (=> b!1586235 (=> (not res!1083312) (not e!885783))))

(assert (=> b!1586235 (= res!1083312 (bvslt (_1!12970 (h!38534 l!636)) (_1!12970 (h!38534 (t!51925 l!636)))))))

(declare-fun b!1586236 () Bool)

(assert (=> b!1586236 (= e!885783 (isStrictlySorted!1217 (t!51925 l!636)))))

(assert (= (and d!167891 (not res!1083311)) b!1586235))

(assert (= (and b!1586235 res!1083312) b!1586236))

(declare-fun m!1454697 () Bool)

(assert (=> b!1586236 m!1454697))

(assert (=> start!138386 d!167891))

(declare-fun b!1586248 () Bool)

(declare-fun e!885791 () Bool)

(declare-fun tp!115392 () Bool)

(assert (=> b!1586248 (= e!885791 (and tp_is_empty!39559 tp!115392))))

(assert (=> b!1586192 (= tp!115380 e!885791)))

(assert (= (and b!1586192 (is-Cons!36991 (t!51925 l!636))) b!1586248))

(push 1)

(assert (not b!1586236))

(assert (not b!1586220))

(assert (not b!1586248))

(assert tp_is_empty!39559)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

