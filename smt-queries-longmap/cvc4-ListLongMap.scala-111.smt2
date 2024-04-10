; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1930 () Bool)

(assert start!1930)

(declare-fun res!10299 () Bool)

(declare-fun e!7790 () Bool)

(assert (=> start!1930 (=> (not res!10299) (not e!7790))))

(declare-datatypes ((B!468 0))(
  ( (B!469 (val!332 Int)) )
))
(declare-datatypes ((tuple2!464 0))(
  ( (tuple2!465 (_1!232 (_ BitVec 64)) (_2!232 B!468)) )
))
(declare-datatypes ((List!387 0))(
  ( (Nil!384) (Cons!383 (h!949 tuple2!464) (t!2780 List!387)) )
))
(declare-fun l!522 () List!387)

(declare-fun isStrictlySorted!74 (List!387) Bool)

(assert (=> start!1930 (= res!10299 (isStrictlySorted!74 l!522))))

(assert (=> start!1930 e!7790))

(declare-fun e!7789 () Bool)

(assert (=> start!1930 e!7789))

(declare-fun tp_is_empty!647 () Bool)

(assert (=> start!1930 tp_is_empty!647))

(declare-fun b!12996 () Bool)

(declare-fun res!10300 () Bool)

(assert (=> b!12996 (=> (not res!10300) (not e!7790))))

(declare-fun value!159 () B!468)

(assert (=> b!12996 (= res!10300 (and (is-Cons!383 l!522) (= (_2!232 (h!949 l!522)) value!159)))))

(declare-fun b!12997 () Bool)

(assert (=> b!12997 (= e!7790 (not (isStrictlySorted!74 (t!2780 l!522))))))

(declare-fun b!12998 () Bool)

(declare-fun tp!2129 () Bool)

(assert (=> b!12998 (= e!7789 (and tp_is_empty!647 tp!2129))))

(assert (= (and start!1930 res!10299) b!12996))

(assert (= (and b!12996 res!10300) b!12997))

(assert (= (and start!1930 (is-Cons!383 l!522)) b!12998))

(declare-fun m!8917 () Bool)

(assert (=> start!1930 m!8917))

(declare-fun m!8919 () Bool)

(assert (=> b!12997 m!8919))

(push 1)

(assert (not start!1930))

(assert (not b!12997))

(assert (not b!12998))

(assert tp_is_empty!647)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1935 () Bool)

(declare-fun res!10313 () Bool)

(declare-fun e!7803 () Bool)

(assert (=> d!1935 (=> res!10313 e!7803)))

(assert (=> d!1935 (= res!10313 (or (is-Nil!384 l!522) (is-Nil!384 (t!2780 l!522))))))

(assert (=> d!1935 (= (isStrictlySorted!74 l!522) e!7803)))

(declare-fun b!13011 () Bool)

(declare-fun e!7804 () Bool)

(assert (=> b!13011 (= e!7803 e!7804)))

(declare-fun res!10314 () Bool)

(assert (=> b!13011 (=> (not res!10314) (not e!7804))))

(assert (=> b!13011 (= res!10314 (bvslt (_1!232 (h!949 l!522)) (_1!232 (h!949 (t!2780 l!522)))))))

(declare-fun b!13012 () Bool)

(assert (=> b!13012 (= e!7804 (isStrictlySorted!74 (t!2780 l!522)))))

(assert (= (and d!1935 (not res!10313)) b!13011))

(assert (= (and b!13011 res!10314) b!13012))

(assert (=> b!13012 m!8919))

(assert (=> start!1930 d!1935))

(declare-fun d!1941 () Bool)

(declare-fun res!10321 () Bool)

(declare-fun e!7811 () Bool)

(assert (=> d!1941 (=> res!10321 e!7811)))

(assert (=> d!1941 (= res!10321 (or (is-Nil!384 (t!2780 l!522)) (is-Nil!384 (t!2780 (t!2780 l!522)))))))

(assert (=> d!1941 (= (isStrictlySorted!74 (t!2780 l!522)) e!7811)))

(declare-fun b!13019 () Bool)

(declare-fun e!7813 () Bool)

(assert (=> b!13019 (= e!7811 e!7813)))

(declare-fun res!10323 () Bool)

(assert (=> b!13019 (=> (not res!10323) (not e!7813))))

(assert (=> b!13019 (= res!10323 (bvslt (_1!232 (h!949 (t!2780 l!522))) (_1!232 (h!949 (t!2780 (t!2780 l!522))))))))

(declare-fun b!13021 () Bool)

(assert (=> b!13021 (= e!7813 (isStrictlySorted!74 (t!2780 (t!2780 l!522))))))

(assert (= (and d!1941 (not res!10321)) b!13019))

(assert (= (and b!13019 res!10323) b!13021))

(declare-fun m!8923 () Bool)

(assert (=> b!13021 m!8923))

(assert (=> b!12997 d!1941))

(declare-fun b!13036 () Bool)

(declare-fun e!7822 () Bool)

(declare-fun tp!2137 () Bool)

(assert (=> b!13036 (= e!7822 (and tp_is_empty!647 tp!2137))))

(assert (=> b!12998 (= tp!2129 e!7822)))

(assert (= (and b!12998 (is-Cons!383 (t!2780 l!522))) b!13036))

(push 1)

