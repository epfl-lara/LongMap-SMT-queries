; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137710 () Bool)

(assert start!137710)

(declare-fun res!1081095 () Bool)

(declare-fun e!883148 () Bool)

(assert (=> start!137710 (=> (not res!1081095) (not e!883148))))

(declare-datatypes ((B!2818 0))(
  ( (B!2819 (val!19771 Int)) )
))
(declare-datatypes ((tuple2!25778 0))(
  ( (tuple2!25779 (_1!12900 (_ BitVec 64)) (_2!12900 B!2818)) )
))
(declare-datatypes ((List!36932 0))(
  ( (Nil!36929) (Cons!36928 (h!38472 tuple2!25778) (t!51838 List!36932)) )
))
(declare-fun l!1065 () List!36932)

(declare-fun isStrictlySorted!1123 (List!36932) Bool)

(assert (=> start!137710 (= res!1081095 (isStrictlySorted!1123 l!1065))))

(assert (=> start!137710 e!883148))

(declare-fun e!883147 () Bool)

(assert (=> start!137710 e!883147))

(assert (=> start!137710 true))

(declare-fun b!1582393 () Bool)

(declare-fun res!1081094 () Bool)

(assert (=> b!1582393 (=> (not res!1081094) (not e!883148))))

(declare-fun key!287 () (_ BitVec 64))

(declare-fun containsKey!969 (List!36932 (_ BitVec 64)) Bool)

(assert (=> b!1582393 (= res!1081094 (containsKey!969 l!1065 key!287))))

(declare-fun b!1582394 () Bool)

(declare-fun ListPrimitiveSize!206 (List!36932) Int)

(assert (=> b!1582394 (= e!883148 (< (ListPrimitiveSize!206 l!1065) 0))))

(declare-fun b!1582395 () Bool)

(declare-fun tp_is_empty!39351 () Bool)

(declare-fun tp!114843 () Bool)

(assert (=> b!1582395 (= e!883147 (and tp_is_empty!39351 tp!114843))))

(assert (= (and start!137710 res!1081095) b!1582393))

(assert (= (and b!1582393 res!1081094) b!1582394))

(assert (= (and start!137710 (is-Cons!36928 l!1065)) b!1582395))

(declare-fun m!1452133 () Bool)

(assert (=> start!137710 m!1452133))

(declare-fun m!1452135 () Bool)

(assert (=> b!1582393 m!1452135))

(declare-fun m!1452137 () Bool)

(assert (=> b!1582394 m!1452137))

(push 1)

(assert tp_is_empty!39351)

(assert (not start!137710))

(assert (not b!1582395))

(assert (not b!1582394))

(assert (not b!1582393))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166797 () Bool)

(declare-fun res!1081114 () Bool)

(declare-fun e!883167 () Bool)

(assert (=> d!166797 (=> res!1081114 e!883167)))

(assert (=> d!166797 (= res!1081114 (and (is-Cons!36928 l!1065) (= (_1!12900 (h!38472 l!1065)) key!287)))))

(assert (=> d!166797 (= (containsKey!969 l!1065 key!287) e!883167)))

(declare-fun b!1582417 () Bool)

(declare-fun e!883168 () Bool)

(assert (=> b!1582417 (= e!883167 e!883168)))

(declare-fun res!1081115 () Bool)

(assert (=> b!1582417 (=> (not res!1081115) (not e!883168))))

(assert (=> b!1582417 (= res!1081115 (and (or (not (is-Cons!36928 l!1065)) (bvsle (_1!12900 (h!38472 l!1065)) key!287)) (is-Cons!36928 l!1065) (bvslt (_1!12900 (h!38472 l!1065)) key!287)))))

(declare-fun b!1582418 () Bool)

(assert (=> b!1582418 (= e!883168 (containsKey!969 (t!51838 l!1065) key!287))))

(assert (= (and d!166797 (not res!1081114)) b!1582417))

(assert (= (and b!1582417 res!1081115) b!1582418))

(declare-fun m!1452145 () Bool)

(assert (=> b!1582418 m!1452145))

(assert (=> b!1582393 d!166797))

(declare-fun d!166801 () Bool)

(declare-fun res!1081124 () Bool)

(declare-fun e!883177 () Bool)

(assert (=> d!166801 (=> res!1081124 e!883177)))

(assert (=> d!166801 (= res!1081124 (or (is-Nil!36929 l!1065) (is-Nil!36929 (t!51838 l!1065))))))

(assert (=> d!166801 (= (isStrictlySorted!1123 l!1065) e!883177)))

(declare-fun b!1582429 () Bool)

(declare-fun e!883178 () Bool)

(assert (=> b!1582429 (= e!883177 e!883178)))

(declare-fun res!1081125 () Bool)

(assert (=> b!1582429 (=> (not res!1081125) (not e!883178))))

(assert (=> b!1582429 (= res!1081125 (bvslt (_1!12900 (h!38472 l!1065)) (_1!12900 (h!38472 (t!51838 l!1065)))))))

(declare-fun b!1582430 () Bool)

(assert (=> b!1582430 (= e!883178 (isStrictlySorted!1123 (t!51838 l!1065)))))

(assert (= (and d!166801 (not res!1081124)) b!1582429))

(assert (= (and b!1582429 res!1081125) b!1582430))

(declare-fun m!1452151 () Bool)

(assert (=> b!1582430 m!1452151))

(assert (=> start!137710 d!166801))

(declare-fun d!166807 () Bool)

(declare-fun lt!676853 () Int)

(assert (=> d!166807 (>= lt!676853 0)))

(declare-fun e!883187 () Int)

(assert (=> d!166807 (= lt!676853 e!883187)))

(declare-fun c!146582 () Bool)

(assert (=> d!166807 (= c!146582 (is-Nil!36929 l!1065))))

(assert (=> d!166807 (= (ListPrimitiveSize!206 l!1065) lt!676853)))

(declare-fun b!1582445 () Bool)

(assert (=> b!1582445 (= e!883187 0)))

(declare-fun b!1582446 () Bool)

(assert (=> b!1582446 (= e!883187 (+ 1 (ListPrimitiveSize!206 (t!51838 l!1065))))))

(assert (= (and d!166807 c!146582) b!1582445))

(assert (= (and d!166807 (not c!146582)) b!1582446))

(declare-fun m!1452157 () Bool)

(assert (=> b!1582446 m!1452157))

(assert (=> b!1582394 d!166807))

(declare-fun b!1582451 () Bool)

(declare-fun e!883190 () Bool)

(declare-fun tp!114849 () Bool)

(assert (=> b!1582451 (= e!883190 (and tp_is_empty!39351 tp!114849))))

(assert (=> b!1582395 (= tp!114843 e!883190)))

(assert (= (and b!1582395 (is-Cons!36928 (t!51838 l!1065))) b!1582451))

(push 1)

(assert (not b!1582418))

(assert (not b!1582430))

(assert tp_is_empty!39351)

(assert (not b!1582446))

(assert (not b!1582451))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

