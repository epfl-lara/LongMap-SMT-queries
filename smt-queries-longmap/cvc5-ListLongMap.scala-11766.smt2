; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138152 () Bool)

(assert start!138152)

(declare-fun res!1082578 () Bool)

(declare-fun e!884900 () Bool)

(assert (=> start!138152 (=> (not res!1082578) (not e!884900))))

(declare-datatypes ((B!2936 0))(
  ( (B!2937 (val!19830 Int)) )
))
(declare-datatypes ((tuple2!25828 0))(
  ( (tuple2!25829 (_1!12925 (_ BitVec 64)) (_2!12925 B!2936)) )
))
(declare-datatypes ((List!36950 0))(
  ( (Nil!36947) (Cons!36946 (h!38489 tuple2!25828) (t!51868 List!36950)) )
))
(declare-fun l!556 () List!36950)

(declare-fun isStrictlySorted!1175 (List!36950) Bool)

(assert (=> start!138152 (= res!1082578 (isStrictlySorted!1175 l!556))))

(assert (=> start!138152 e!884900))

(declare-fun e!884901 () Bool)

(assert (=> start!138152 e!884901))

(assert (=> start!138152 true))

(declare-fun b!1585056 () Bool)

(declare-fun res!1082579 () Bool)

(assert (=> b!1585056 (=> (not res!1082579) (not e!884900))))

(declare-fun newKey!21 () (_ BitVec 64))

(assert (=> b!1585056 (= res!1082579 (and (is-Cons!36946 l!556) (bvslt (_1!12925 (h!38489 l!556)) newKey!21)))))

(declare-fun b!1585057 () Bool)

(assert (=> b!1585057 (= e!884900 (not (isStrictlySorted!1175 (t!51868 l!556))))))

(declare-fun b!1585058 () Bool)

(declare-fun tp_is_empty!39469 () Bool)

(declare-fun tp!115161 () Bool)

(assert (=> b!1585058 (= e!884901 (and tp_is_empty!39469 tp!115161))))

(assert (= (and start!138152 res!1082578) b!1585056))

(assert (= (and b!1585056 res!1082579) b!1585057))

(assert (= (and start!138152 (is-Cons!36946 l!556)) b!1585058))

(declare-fun m!1454079 () Bool)

(assert (=> start!138152 m!1454079))

(declare-fun m!1454081 () Bool)

(assert (=> b!1585057 m!1454081))

(push 1)

(assert (not start!138152))

(assert (not b!1585057))

(assert (not b!1585058))

(assert tp_is_empty!39469)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167617 () Bool)

(declare-fun res!1082604 () Bool)

(declare-fun e!884929 () Bool)

(assert (=> d!167617 (=> res!1082604 e!884929)))

(assert (=> d!167617 (= res!1082604 (or (is-Nil!36947 l!556) (is-Nil!36947 (t!51868 l!556))))))

(assert (=> d!167617 (= (isStrictlySorted!1175 l!556) e!884929)))

(declare-fun b!1585094 () Bool)

(declare-fun e!884930 () Bool)

(assert (=> b!1585094 (= e!884929 e!884930)))

(declare-fun res!1082605 () Bool)

(assert (=> b!1585094 (=> (not res!1082605) (not e!884930))))

(assert (=> b!1585094 (= res!1082605 (bvslt (_1!12925 (h!38489 l!556)) (_1!12925 (h!38489 (t!51868 l!556)))))))

(declare-fun b!1585095 () Bool)

(assert (=> b!1585095 (= e!884930 (isStrictlySorted!1175 (t!51868 l!556)))))

(assert (= (and d!167617 (not res!1082604)) b!1585094))

(assert (= (and b!1585094 res!1082605) b!1585095))

(assert (=> b!1585095 m!1454081))

(assert (=> start!138152 d!167617))

(declare-fun d!167621 () Bool)

(declare-fun res!1082610 () Bool)

(declare-fun e!884935 () Bool)

(assert (=> d!167621 (=> res!1082610 e!884935)))

(assert (=> d!167621 (= res!1082610 (or (is-Nil!36947 (t!51868 l!556)) (is-Nil!36947 (t!51868 (t!51868 l!556)))))))

(assert (=> d!167621 (= (isStrictlySorted!1175 (t!51868 l!556)) e!884935)))

(declare-fun b!1585100 () Bool)

(declare-fun e!884936 () Bool)

(assert (=> b!1585100 (= e!884935 e!884936)))

(declare-fun res!1082611 () Bool)

(assert (=> b!1585100 (=> (not res!1082611) (not e!884936))))

(assert (=> b!1585100 (= res!1082611 (bvslt (_1!12925 (h!38489 (t!51868 l!556))) (_1!12925 (h!38489 (t!51868 (t!51868 l!556))))))))

(declare-fun b!1585101 () Bool)

(assert (=> b!1585101 (= e!884936 (isStrictlySorted!1175 (t!51868 (t!51868 l!556))))))

(assert (= (and d!167621 (not res!1082610)) b!1585100))

