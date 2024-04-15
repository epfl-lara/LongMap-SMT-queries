; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137110 () Bool)

(assert start!137110)

(declare-fun b!1580074 () Bool)

(declare-fun e!881452 () Bool)

(declare-datatypes ((B!2660 0))(
  ( (B!2661 (val!19692 Int)) )
))
(declare-datatypes ((tuple2!25578 0))(
  ( (tuple2!25579 (_1!12800 (_ BitVec 64)) (_2!12800 B!2660)) )
))
(declare-datatypes ((List!36853 0))(
  ( (Nil!36850) (Cons!36849 (h!38393 tuple2!25578) (t!51759 List!36853)) )
))
(declare-fun l!1390 () List!36853)

(declare-fun ListPrimitiveSize!193 (List!36853) Int)

(assert (=> b!1580074 (= e!881452 (< (ListPrimitiveSize!193 l!1390) 0))))

(declare-fun b!1580072 () Bool)

(declare-fun res!1079517 () Bool)

(assert (=> b!1580072 (=> (not res!1079517) (not e!881452))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!914 (List!36853 (_ BitVec 64)) Bool)

(assert (=> b!1580072 (= res!1079517 (containsKey!914 l!1390 key!405))))

(declare-fun res!1079516 () Bool)

(assert (=> start!137110 (=> (not res!1079516) (not e!881452))))

(declare-fun isStrictlySorted!1068 (List!36853) Bool)

(assert (=> start!137110 (= res!1079516 (isStrictlySorted!1068 l!1390))))

(assert (=> start!137110 e!881452))

(declare-fun e!881453 () Bool)

(assert (=> start!137110 e!881453))

(assert (=> start!137110 true))

(declare-fun tp_is_empty!39205 () Bool)

(assert (=> start!137110 tp_is_empty!39205))

(declare-fun b!1580073 () Bool)

(declare-fun res!1079515 () Bool)

(assert (=> b!1580073 (=> (not res!1079515) (not e!881452))))

(declare-fun value!194 () B!2660)

(declare-fun contains!10439 (List!36853 tuple2!25578) Bool)

(assert (=> b!1580073 (= res!1079515 (contains!10439 l!1390 (tuple2!25579 key!405 value!194)))))

(declare-fun b!1580075 () Bool)

(declare-fun tp!114469 () Bool)

(assert (=> b!1580075 (= e!881453 (and tp_is_empty!39205 tp!114469))))

(assert (= (and start!137110 res!1079516) b!1580072))

(assert (= (and b!1580072 res!1079517) b!1580073))

(assert (= (and b!1580073 res!1079515) b!1580074))

(get-info :version)

(assert (= (and start!137110 ((_ is Cons!36849) l!1390)) b!1580075))

(declare-fun m!1450953 () Bool)

(assert (=> b!1580074 m!1450953))

(declare-fun m!1450955 () Bool)

(assert (=> b!1580072 m!1450955))

(declare-fun m!1450957 () Bool)

(assert (=> start!137110 m!1450957))

(declare-fun m!1450959 () Bool)

(assert (=> b!1580073 m!1450959))

(check-sat (not b!1580075) (not b!1580073) (not b!1580072) (not b!1580074) tp_is_empty!39205 (not start!137110))
(check-sat)
(get-model)

(declare-fun d!166171 () Bool)

(declare-fun lt!676485 () Int)

(assert (=> d!166171 (>= lt!676485 0)))

(declare-fun e!881472 () Int)

(assert (=> d!166171 (= lt!676485 e!881472)))

(declare-fun c!146437 () Bool)

(assert (=> d!166171 (= c!146437 ((_ is Nil!36850) l!1390))))

(assert (=> d!166171 (= (ListPrimitiveSize!193 l!1390) lt!676485)))

(declare-fun b!1580108 () Bool)

(assert (=> b!1580108 (= e!881472 0)))

(declare-fun b!1580109 () Bool)

(assert (=> b!1580109 (= e!881472 (+ 1 (ListPrimitiveSize!193 (t!51759 l!1390))))))

(assert (= (and d!166171 c!146437) b!1580108))

(assert (= (and d!166171 (not c!146437)) b!1580109))

(declare-fun m!1450977 () Bool)

(assert (=> b!1580109 m!1450977))

(assert (=> b!1580074 d!166171))

(declare-fun d!166177 () Bool)

(declare-fun res!1079556 () Bool)

(declare-fun e!881489 () Bool)

(assert (=> d!166177 (=> res!1079556 e!881489)))

(assert (=> d!166177 (= res!1079556 (or ((_ is Nil!36850) l!1390) ((_ is Nil!36850) (t!51759 l!1390))))))

(assert (=> d!166177 (= (isStrictlySorted!1068 l!1390) e!881489)))

(declare-fun b!1580126 () Bool)

(declare-fun e!881490 () Bool)

(assert (=> b!1580126 (= e!881489 e!881490)))

(declare-fun res!1079557 () Bool)

(assert (=> b!1580126 (=> (not res!1079557) (not e!881490))))

(assert (=> b!1580126 (= res!1079557 (bvslt (_1!12800 (h!38393 l!1390)) (_1!12800 (h!38393 (t!51759 l!1390)))))))

(declare-fun b!1580127 () Bool)

(assert (=> b!1580127 (= e!881490 (isStrictlySorted!1068 (t!51759 l!1390)))))

(assert (= (and d!166177 (not res!1079556)) b!1580126))

(assert (= (and b!1580126 res!1079557) b!1580127))

(declare-fun m!1450983 () Bool)

(assert (=> b!1580127 m!1450983))

(assert (=> start!137110 d!166177))

(declare-fun d!166183 () Bool)

(declare-fun res!1079572 () Bool)

(declare-fun e!881505 () Bool)

(assert (=> d!166183 (=> res!1079572 e!881505)))

(assert (=> d!166183 (= res!1079572 (and ((_ is Cons!36849) l!1390) (= (_1!12800 (h!38393 l!1390)) key!405)))))

(assert (=> d!166183 (= (containsKey!914 l!1390 key!405) e!881505)))

(declare-fun b!1580142 () Bool)

(declare-fun e!881506 () Bool)

(assert (=> b!1580142 (= e!881505 e!881506)))

(declare-fun res!1079573 () Bool)

(assert (=> b!1580142 (=> (not res!1079573) (not e!881506))))

(assert (=> b!1580142 (= res!1079573 (and (or (not ((_ is Cons!36849) l!1390)) (bvsle (_1!12800 (h!38393 l!1390)) key!405)) ((_ is Cons!36849) l!1390) (bvslt (_1!12800 (h!38393 l!1390)) key!405)))))

(declare-fun b!1580143 () Bool)

(assert (=> b!1580143 (= e!881506 (containsKey!914 (t!51759 l!1390) key!405))))

(assert (= (and d!166183 (not res!1079572)) b!1580142))

(assert (= (and b!1580142 res!1079573) b!1580143))

(declare-fun m!1450989 () Bool)

(assert (=> b!1580143 m!1450989))

(assert (=> b!1580072 d!166183))

(declare-fun d!166189 () Bool)

(declare-fun lt!676496 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!822 (List!36853) (InoxSet tuple2!25578))

(assert (=> d!166189 (= lt!676496 (select (content!822 l!1390) (tuple2!25579 key!405 value!194)))))

(declare-fun e!881523 () Bool)

(assert (=> d!166189 (= lt!676496 e!881523)))

(declare-fun res!1079589 () Bool)

(assert (=> d!166189 (=> (not res!1079589) (not e!881523))))

(assert (=> d!166189 (= res!1079589 ((_ is Cons!36849) l!1390))))

(assert (=> d!166189 (= (contains!10439 l!1390 (tuple2!25579 key!405 value!194)) lt!676496)))

(declare-fun b!1580162 () Bool)

(declare-fun e!881524 () Bool)

(assert (=> b!1580162 (= e!881523 e!881524)))

(declare-fun res!1079588 () Bool)

(assert (=> b!1580162 (=> res!1079588 e!881524)))

(assert (=> b!1580162 (= res!1079588 (= (h!38393 l!1390) (tuple2!25579 key!405 value!194)))))

(declare-fun b!1580163 () Bool)

(assert (=> b!1580163 (= e!881524 (contains!10439 (t!51759 l!1390) (tuple2!25579 key!405 value!194)))))

(assert (= (and d!166189 res!1079589) b!1580162))

(assert (= (and b!1580162 (not res!1079588)) b!1580163))

(declare-fun m!1451003 () Bool)

(assert (=> d!166189 m!1451003))

(declare-fun m!1451005 () Bool)

(assert (=> d!166189 m!1451005))

(declare-fun m!1451007 () Bool)

(assert (=> b!1580163 m!1451007))

(assert (=> b!1580073 d!166189))

(declare-fun b!1580178 () Bool)

(declare-fun e!881532 () Bool)

(declare-fun tp!114480 () Bool)

(assert (=> b!1580178 (= e!881532 (and tp_is_empty!39205 tp!114480))))

(assert (=> b!1580075 (= tp!114469 e!881532)))

(assert (= (and b!1580075 ((_ is Cons!36849) (t!51759 l!1390))) b!1580178))

(check-sat (not b!1580127) (not b!1580163) (not b!1580143) tp_is_empty!39205 (not b!1580178) (not b!1580109) (not d!166189))
(check-sat)
