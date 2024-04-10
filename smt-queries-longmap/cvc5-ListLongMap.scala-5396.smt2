; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71986 () Bool)

(assert start!71986)

(declare-fun res!568963 () Bool)

(declare-fun e!466527 () Bool)

(assert (=> start!71986 (=> (not res!568963) (not e!466527))))

(declare-datatypes ((B!1178 0))(
  ( (B!1179 (val!7671 Int)) )
))
(declare-datatypes ((tuple2!10202 0))(
  ( (tuple2!10203 (_1!5112 (_ BitVec 64)) (_2!5112 B!1178)) )
))
(declare-datatypes ((List!15976 0))(
  ( (Nil!15973) (Cons!15972 (h!17103 tuple2!10202) (t!22347 List!15976)) )
))
(declare-fun l!390 () List!15976)

(declare-fun isStrictlySorted!446 (List!15976) Bool)

(assert (=> start!71986 (= res!568963 (isStrictlySorted!446 l!390))))

(assert (=> start!71986 e!466527))

(declare-fun e!466526 () Bool)

(assert (=> start!71986 e!466526))

(declare-fun b!836262 () Bool)

(declare-fun res!568964 () Bool)

(assert (=> b!836262 (=> (not res!568964) (not e!466527))))

(assert (=> b!836262 (= res!568964 (is-Cons!15972 l!390))))

(declare-fun b!836263 () Bool)

(assert (=> b!836263 (= e!466527 (not (isStrictlySorted!446 (t!22347 l!390))))))

(declare-fun b!836264 () Bool)

(declare-fun tp_is_empty!15247 () Bool)

(declare-fun tp!47405 () Bool)

(assert (=> b!836264 (= e!466526 (and tp_is_empty!15247 tp!47405))))

(assert (= (and start!71986 res!568963) b!836262))

(assert (= (and b!836262 res!568964) b!836263))

(assert (= (and start!71986 (is-Cons!15972 l!390)) b!836264))

(declare-fun m!781639 () Bool)

(assert (=> start!71986 m!781639))

(declare-fun m!781641 () Bool)

(assert (=> b!836263 m!781641))

(push 1)

(assert (not start!71986))

(assert (not b!836263))

(assert (not b!836264))

(assert tp_is_empty!15247)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107553 () Bool)

(declare-fun res!568991 () Bool)

(declare-fun e!466554 () Bool)

(assert (=> d!107553 (=> res!568991 e!466554)))

(assert (=> d!107553 (= res!568991 (or (is-Nil!15973 l!390) (is-Nil!15973 (t!22347 l!390))))))

(assert (=> d!107553 (= (isStrictlySorted!446 l!390) e!466554)))

(declare-fun b!836297 () Bool)

(declare-fun e!466555 () Bool)

(assert (=> b!836297 (= e!466554 e!466555)))

(declare-fun res!568992 () Bool)

(assert (=> b!836297 (=> (not res!568992) (not e!466555))))

(assert (=> b!836297 (= res!568992 (bvslt (_1!5112 (h!17103 l!390)) (_1!5112 (h!17103 (t!22347 l!390)))))))

(declare-fun b!836298 () Bool)

(assert (=> b!836298 (= e!466555 (isStrictlySorted!446 (t!22347 l!390)))))

(assert (= (and d!107553 (not res!568991)) b!836297))

(assert (= (and b!836297 res!568992) b!836298))

(assert (=> b!836298 m!781641))

(assert (=> start!71986 d!107553))

(declare-fun d!107557 () Bool)

(declare-fun res!568993 () Bool)

(declare-fun e!466556 () Bool)

(assert (=> d!107557 (=> res!568993 e!466556)))

(assert (=> d!107557 (= res!568993 (or (is-Nil!15973 (t!22347 l!390)) (is-Nil!15973 (t!22347 (t!22347 l!390)))))))

(assert (=> d!107557 (= (isStrictlySorted!446 (t!22347 l!390)) e!466556)))

(declare-fun b!836299 () Bool)

(declare-fun e!466557 () Bool)

(assert (=> b!836299 (= e!466556 e!466557)))

(declare-fun res!568994 () Bool)

(assert (=> b!836299 (=> (not res!568994) (not e!466557))))

(assert (=> b!836299 (= res!568994 (bvslt (_1!5112 (h!17103 (t!22347 l!390))) (_1!5112 (h!17103 (t!22347 (t!22347 l!390))))))))

(declare-fun b!836300 () Bool)

(assert (=> b!836300 (= e!466557 (isStrictlySorted!446 (t!22347 (t!22347 l!390))))))

(assert (= (and d!107557 (not res!568993)) b!836299))

(assert (= (and b!836299 res!568994) b!836300))

(declare-fun m!781651 () Bool)

(assert (=> b!836300 m!781651))

(assert (=> b!836263 d!107557))

(declare-fun b!836315 () Bool)

(declare-fun e!466568 () Bool)

(declare-fun tp!47416 () Bool)

(assert (=> b!836315 (= e!466568 (and tp_is_empty!15247 tp!47416))))

(assert (=> b!836264 (= tp!47405 e!466568)))

(assert (= (and b!836264 (is-Cons!15972 (t!22347 l!390))) b!836315))

(push 1)

(assert (not b!836300))

(assert (not b!836298))

(assert (not b!836315))

(assert tp_is_empty!15247)

(check-sat)

(pop 1)

