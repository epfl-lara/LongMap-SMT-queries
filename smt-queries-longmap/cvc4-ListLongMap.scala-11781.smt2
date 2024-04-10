; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138390 () Bool)

(assert start!138390)

(declare-fun res!1083296 () Bool)

(declare-fun e!885758 () Bool)

(assert (=> start!138390 (=> (not res!1083296) (not e!885758))))

(declare-datatypes ((B!3030 0))(
  ( (B!3031 (val!19877 Int)) )
))
(declare-datatypes ((tuple2!25922 0))(
  ( (tuple2!25923 (_1!12972 (_ BitVec 64)) (_2!12972 B!3030)) )
))
(declare-datatypes ((List!36997 0))(
  ( (Nil!36994) (Cons!36993 (h!38536 tuple2!25922) (t!51927 List!36997)) )
))
(declare-fun l!636 () List!36997)

(declare-fun isStrictlySorted!1219 (List!36997) Bool)

(assert (=> start!138390 (= res!1083296 (isStrictlySorted!1219 l!636))))

(assert (=> start!138390 e!885758))

(declare-fun e!885759 () Bool)

(assert (=> start!138390 e!885759))

(declare-fun b!1586203 () Bool)

(declare-fun ListPrimitiveSize!231 (List!36997) Int)

(assert (=> b!1586203 (= e!885758 (< (ListPrimitiveSize!231 l!636) 0))))

(declare-fun b!1586204 () Bool)

(declare-fun tp_is_empty!39563 () Bool)

(declare-fun tp!115386 () Bool)

(assert (=> b!1586204 (= e!885759 (and tp_is_empty!39563 tp!115386))))

(assert (= (and start!138390 res!1083296) b!1586203))

(assert (= (and start!138390 (is-Cons!36993 l!636)) b!1586204))

(declare-fun m!1454687 () Bool)

(assert (=> start!138390 m!1454687))

(declare-fun m!1454689 () Bool)

(assert (=> b!1586203 m!1454689))

(push 1)

(assert (not b!1586203))

(assert (not start!138390))

(assert (not b!1586204))

(assert tp_is_empty!39563)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167885 () Bool)

(declare-fun lt!677501 () Int)

(assert (=> d!167885 (>= lt!677501 0)))

(declare-fun e!885768 () Int)

(assert (=> d!167885 (= lt!677501 e!885768)))

(declare-fun c!147038 () Bool)

(assert (=> d!167885 (= c!147038 (is-Nil!36994 l!636))))

(assert (=> d!167885 (= (ListPrimitiveSize!231 l!636) lt!677501)))

(declare-fun b!1586217 () Bool)

(assert (=> b!1586217 (= e!885768 0)))

(declare-fun b!1586219 () Bool)

(assert (=> b!1586219 (= e!885768 (+ 1 (ListPrimitiveSize!231 (t!51927 l!636))))))

(assert (= (and d!167885 c!147038) b!1586217))

(assert (= (and d!167885 (not c!147038)) b!1586219))

(declare-fun m!1454693 () Bool)

(assert (=> b!1586219 m!1454693))

(assert (=> b!1586203 d!167885))

(declare-fun d!167890 () Bool)

(declare-fun res!1083313 () Bool)

(declare-fun e!885784 () Bool)

(assert (=> d!167890 (=> res!1083313 e!885784)))

(assert (=> d!167890 (= res!1083313 (or (is-Nil!36994 l!636) (is-Nil!36994 (t!51927 l!636))))))

(assert (=> d!167890 (= (isStrictlySorted!1219 l!636) e!885784)))

(declare-fun b!1586237 () Bool)

(declare-fun e!885785 () Bool)

(assert (=> b!1586237 (= e!885784 e!885785)))

(declare-fun res!1083314 () Bool)

(assert (=> b!1586237 (=> (not res!1083314) (not e!885785))))

(assert (=> b!1586237 (= res!1083314 (bvslt (_1!12972 (h!38536 l!636)) (_1!12972 (h!38536 (t!51927 l!636)))))))

(declare-fun b!1586238 () Bool)

(assert (=> b!1586238 (= e!885785 (isStrictlySorted!1219 (t!51927 l!636)))))

(assert (= (and d!167890 (not res!1083313)) b!1586237))

(assert (= (and b!1586237 res!1083314) b!1586238))

(declare-fun m!1454699 () Bool)

(assert (=> b!1586238 m!1454699))

(assert (=> start!138390 d!167890))

(declare-fun b!1586247 () Bool)

(declare-fun e!885790 () Bool)

(declare-fun tp!115391 () Bool)

(assert (=> b!1586247 (= e!885790 (and tp_is_empty!39563 tp!115391))))

(assert (=> b!1586204 (= tp!115386 e!885790)))

(assert (= (and b!1586204 (is-Cons!36993 (t!51927 l!636))) b!1586247))

(push 1)

