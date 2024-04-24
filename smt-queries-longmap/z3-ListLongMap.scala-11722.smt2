; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137582 () Bool)

(assert start!137582)

(declare-fun b!1582876 () Bool)

(declare-fun res!1080560 () Bool)

(declare-fun e!883195 () Bool)

(assert (=> b!1582876 (=> (not res!1080560) (not e!883195))))

(declare-fun key!405 () (_ BitVec 64))

(declare-datatypes ((B!2660 0))(
  ( (B!2661 (val!19692 Int)) )
))
(declare-datatypes ((tuple2!25570 0))(
  ( (tuple2!25571 (_1!12796 (_ BitVec 64)) (_2!12796 B!2660)) )
))
(declare-datatypes ((List!36844 0))(
  ( (Nil!36841) (Cons!36840 (h!38401 tuple2!25570) (t!51750 List!36844)) )
))
(declare-fun l!1390 () List!36844)

(declare-fun value!194 () B!2660)

(declare-fun contains!10529 (List!36844 tuple2!25570) Bool)

(assert (=> b!1582876 (= res!1080560 (contains!10529 l!1390 (tuple2!25571 key!405 value!194)))))

(declare-fun res!1080558 () Bool)

(assert (=> start!137582 (=> (not res!1080558) (not e!883195))))

(declare-fun isStrictlySorted!1058 (List!36844) Bool)

(assert (=> start!137582 (= res!1080558 (isStrictlySorted!1058 l!1390))))

(assert (=> start!137582 e!883195))

(declare-fun e!883196 () Bool)

(assert (=> start!137582 e!883196))

(assert (=> start!137582 true))

(declare-fun tp_is_empty!39205 () Bool)

(assert (=> start!137582 tp_is_empty!39205))

(declare-fun b!1582878 () Bool)

(declare-fun tp!114468 () Bool)

(assert (=> b!1582878 (= e!883196 (and tp_is_empty!39205 tp!114468))))

(declare-fun b!1582875 () Bool)

(declare-fun res!1080559 () Bool)

(assert (=> b!1582875 (=> (not res!1080559) (not e!883195))))

(declare-fun containsKey!917 (List!36844 (_ BitVec 64)) Bool)

(assert (=> b!1582875 (= res!1080559 (containsKey!917 l!1390 key!405))))

(declare-fun b!1582877 () Bool)

(declare-fun ListPrimitiveSize!193 (List!36844) Int)

(assert (=> b!1582877 (= e!883195 (< (ListPrimitiveSize!193 l!1390) 0))))

(assert (= (and start!137582 res!1080558) b!1582875))

(assert (= (and b!1582875 res!1080559) b!1582876))

(assert (= (and b!1582876 res!1080560) b!1582877))

(get-info :version)

(assert (= (and start!137582 ((_ is Cons!36840) l!1390)) b!1582878))

(declare-fun m!1454145 () Bool)

(assert (=> b!1582876 m!1454145))

(declare-fun m!1454147 () Bool)

(assert (=> start!137582 m!1454147))

(declare-fun m!1454149 () Bool)

(assert (=> b!1582875 m!1454149))

(declare-fun m!1454151 () Bool)

(assert (=> b!1582877 m!1454151))

(check-sat (not b!1582876) tp_is_empty!39205 (not b!1582878) (not b!1582875) (not start!137582) (not b!1582877))
(check-sat)
(get-model)

(declare-fun d!167129 () Bool)

(declare-fun res!1080583 () Bool)

(declare-fun e!883213 () Bool)

(assert (=> d!167129 (=> res!1080583 e!883213)))

(assert (=> d!167129 (= res!1080583 (or ((_ is Nil!36841) l!1390) ((_ is Nil!36841) (t!51750 l!1390))))))

(assert (=> d!167129 (= (isStrictlySorted!1058 l!1390) e!883213)))

(declare-fun b!1582907 () Bool)

(declare-fun e!883214 () Bool)

(assert (=> b!1582907 (= e!883213 e!883214)))

(declare-fun res!1080584 () Bool)

(assert (=> b!1582907 (=> (not res!1080584) (not e!883214))))

(assert (=> b!1582907 (= res!1080584 (bvslt (_1!12796 (h!38401 l!1390)) (_1!12796 (h!38401 (t!51750 l!1390)))))))

(declare-fun b!1582908 () Bool)

(assert (=> b!1582908 (= e!883214 (isStrictlySorted!1058 (t!51750 l!1390)))))

(assert (= (and d!167129 (not res!1080583)) b!1582907))

(assert (= (and b!1582907 res!1080584) b!1582908))

(declare-fun m!1454169 () Bool)

(assert (=> b!1582908 m!1454169))

(assert (=> start!137582 d!167129))

(declare-fun d!167135 () Bool)

(declare-fun lt!677676 () Int)

(assert (=> d!167135 (>= lt!677676 0)))

(declare-fun e!883227 () Int)

(assert (=> d!167135 (= lt!677676 e!883227)))

(declare-fun c!147326 () Bool)

(assert (=> d!167135 (= c!147326 ((_ is Nil!36841) l!1390))))

(assert (=> d!167135 (= (ListPrimitiveSize!193 l!1390) lt!677676)))

(declare-fun b!1582923 () Bool)

(assert (=> b!1582923 (= e!883227 0)))

(declare-fun b!1582924 () Bool)

(assert (=> b!1582924 (= e!883227 (+ 1 (ListPrimitiveSize!193 (t!51750 l!1390))))))

(assert (= (and d!167135 c!147326) b!1582923))

(assert (= (and d!167135 (not c!147326)) b!1582924))

(declare-fun m!1454173 () Bool)

(assert (=> b!1582924 m!1454173))

(assert (=> b!1582877 d!167135))

(declare-fun lt!677681 () Bool)

(declare-fun d!167139 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!818 (List!36844) (InoxSet tuple2!25570))

(assert (=> d!167139 (= lt!677681 (select (content!818 l!1390) (tuple2!25571 key!405 value!194)))))

(declare-fun e!883243 () Bool)

(assert (=> d!167139 (= lt!677681 e!883243)))

(declare-fun res!1080609 () Bool)

(assert (=> d!167139 (=> (not res!1080609) (not e!883243))))

(assert (=> d!167139 (= res!1080609 ((_ is Cons!36840) l!1390))))

(assert (=> d!167139 (= (contains!10529 l!1390 (tuple2!25571 key!405 value!194)) lt!677681)))

(declare-fun b!1582939 () Bool)

(declare-fun e!883242 () Bool)

(assert (=> b!1582939 (= e!883243 e!883242)))

(declare-fun res!1080610 () Bool)

(assert (=> b!1582939 (=> res!1080610 e!883242)))

(assert (=> b!1582939 (= res!1080610 (= (h!38401 l!1390) (tuple2!25571 key!405 value!194)))))

(declare-fun b!1582940 () Bool)

(assert (=> b!1582940 (= e!883242 (contains!10529 (t!51750 l!1390) (tuple2!25571 key!405 value!194)))))

(assert (= (and d!167139 res!1080609) b!1582939))

(assert (= (and b!1582939 (not res!1080610)) b!1582940))

(declare-fun m!1454177 () Bool)

(assert (=> d!167139 m!1454177))

(declare-fun m!1454179 () Bool)

(assert (=> d!167139 m!1454179))

(declare-fun m!1454181 () Bool)

(assert (=> b!1582940 m!1454181))

(assert (=> b!1582876 d!167139))

(declare-fun d!167143 () Bool)

(declare-fun res!1080619 () Bool)

(declare-fun e!883254 () Bool)

(assert (=> d!167143 (=> res!1080619 e!883254)))

(assert (=> d!167143 (= res!1080619 (and ((_ is Cons!36840) l!1390) (= (_1!12796 (h!38401 l!1390)) key!405)))))

(assert (=> d!167143 (= (containsKey!917 l!1390 key!405) e!883254)))

(declare-fun b!1582953 () Bool)

(declare-fun e!883255 () Bool)

(assert (=> b!1582953 (= e!883254 e!883255)))

(declare-fun res!1080620 () Bool)

(assert (=> b!1582953 (=> (not res!1080620) (not e!883255))))

(assert (=> b!1582953 (= res!1080620 (and (or (not ((_ is Cons!36840) l!1390)) (bvsle (_1!12796 (h!38401 l!1390)) key!405)) ((_ is Cons!36840) l!1390) (bvslt (_1!12796 (h!38401 l!1390)) key!405)))))

(declare-fun b!1582954 () Bool)

(assert (=> b!1582954 (= e!883255 (containsKey!917 (t!51750 l!1390) key!405))))

(assert (= (and d!167143 (not res!1080619)) b!1582953))

(assert (= (and b!1582953 res!1080620) b!1582954))

(declare-fun m!1454191 () Bool)

(assert (=> b!1582954 m!1454191))

(assert (=> b!1582875 d!167143))

(declare-fun b!1582963 () Bool)

(declare-fun e!883260 () Bool)

(declare-fun tp!114477 () Bool)

(assert (=> b!1582963 (= e!883260 (and tp_is_empty!39205 tp!114477))))

(assert (=> b!1582878 (= tp!114468 e!883260)))

(assert (= (and b!1582878 ((_ is Cons!36840) (t!51750 l!1390))) b!1582963))

(check-sat (not b!1582908) (not d!167139) (not b!1582924) tp_is_empty!39205 (not b!1582940) (not b!1582954) (not b!1582963))
(check-sat)
