; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137614 () Bool)

(assert start!137614)

(declare-fun b!1583020 () Bool)

(declare-fun e!883298 () Bool)

(declare-fun tp_is_empty!39213 () Bool)

(declare-fun tp!114489 () Bool)

(assert (=> b!1583020 (= e!883298 (and tp_is_empty!39213 tp!114489))))

(declare-fun b!1583021 () Bool)

(declare-fun e!883297 () Bool)

(declare-fun e!883296 () Bool)

(assert (=> b!1583021 (= e!883297 e!883296)))

(declare-fun res!1080659 () Bool)

(assert (=> b!1583021 (=> (not res!1080659) (not e!883296))))

(declare-datatypes ((B!2668 0))(
  ( (B!2669 (val!19696 Int)) )
))
(declare-datatypes ((tuple2!25580 0))(
  ( (tuple2!25581 (_1!12801 (_ BitVec 64)) (_2!12801 B!2668)) )
))
(declare-datatypes ((List!36848 0))(
  ( (Nil!36845) (Cons!36844 (h!38405 tuple2!25580) (t!51754 List!36848)) )
))
(declare-datatypes ((tuple2!25582 0))(
  ( (tuple2!25583 (_1!12802 tuple2!25580) (_2!12802 List!36848)) )
))
(declare-datatypes ((Option!899 0))(
  ( (Some!898 (v!22396 tuple2!25582)) (None!897) )
))
(declare-fun lt!677697 () Option!899)

(declare-fun isEmpty!1170 (Option!899) Bool)

(assert (=> b!1583021 (= res!1080659 (not (isEmpty!1170 lt!677697)))))

(declare-fun l!1390 () List!36848)

(declare-fun unapply!83 (List!36848) Option!899)

(assert (=> b!1583021 (= lt!677697 (unapply!83 l!1390))))

(declare-fun b!1583022 () Bool)

(declare-fun res!1080662 () Bool)

(assert (=> b!1583022 (=> (not res!1080662) (not e!883297))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun value!194 () B!2668)

(declare-fun contains!10533 (List!36848 tuple2!25580) Bool)

(assert (=> b!1583022 (= res!1080662 (contains!10533 l!1390 (tuple2!25581 key!405 value!194)))))

(declare-fun b!1583023 () Bool)

(declare-fun res!1080658 () Bool)

(assert (=> b!1583023 (=> (not res!1080658) (not e!883297))))

(declare-fun containsKey!921 (List!36848 (_ BitVec 64)) Bool)

(assert (=> b!1583023 (= res!1080658 (containsKey!921 l!1390 key!405))))

(declare-fun res!1080660 () Bool)

(assert (=> start!137614 (=> (not res!1080660) (not e!883297))))

(declare-fun isStrictlySorted!1062 (List!36848) Bool)

(assert (=> start!137614 (= res!1080660 (isStrictlySorted!1062 l!1390))))

(assert (=> start!137614 e!883297))

(assert (=> start!137614 e!883298))

(assert (=> start!137614 true))

(assert (=> start!137614 tp_is_empty!39213))

(declare-fun b!1583024 () Bool)

(declare-fun res!1080661 () Bool)

(assert (=> b!1583024 (=> (not res!1080661) (not e!883296))))

(declare-fun get!26838 (Option!899) tuple2!25582)

(assert (=> b!1583024 (= res!1080661 (is-Nil!36845 (_2!12802 (get!26838 lt!677697))))))

(declare-fun b!1583025 () Bool)

(declare-datatypes ((Option!900 0))(
  ( (Some!899 (v!22397 B!2668)) (None!898) )
))
(declare-fun getValueByKey!811 (List!36848 (_ BitVec 64)) Option!900)

(assert (=> b!1583025 (= e!883296 (not (= (getValueByKey!811 l!1390 key!405) (Some!899 value!194))))))

(assert (= (and start!137614 res!1080660) b!1583023))

(assert (= (and b!1583023 res!1080658) b!1583022))

(assert (= (and b!1583022 res!1080662) b!1583021))

(assert (= (and b!1583021 res!1080659) b!1583024))

(assert (= (and b!1583024 res!1080661) b!1583025))

(assert (= (and start!137614 (is-Cons!36844 l!1390)) b!1583020))

(declare-fun m!1454219 () Bool)

(assert (=> b!1583021 m!1454219))

(declare-fun m!1454221 () Bool)

(assert (=> b!1583021 m!1454221))

(declare-fun m!1454223 () Bool)

(assert (=> start!137614 m!1454223))

(declare-fun m!1454225 () Bool)

(assert (=> b!1583022 m!1454225))

(declare-fun m!1454227 () Bool)

(assert (=> b!1583024 m!1454227))

(declare-fun m!1454229 () Bool)

(assert (=> b!1583023 m!1454229))

(declare-fun m!1454231 () Bool)

(assert (=> b!1583025 m!1454231))

(push 1)

(assert (not b!1583021))

(assert (not b!1583025))

(assert (not b!1583023))

(assert (not b!1583024))

(assert (not b!1583022))

(assert tp_is_empty!39213)

(assert (not b!1583020))

(assert (not start!137614))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun lt!677703 () Bool)

(declare-fun d!167157 () Bool)

(declare-fun content!820 (List!36848) (Set tuple2!25580))

(assert (=> d!167157 (= lt!677703 (member (tuple2!25581 key!405 value!194) (content!820 l!1390)))))

(declare-fun e!883321 () Bool)

(assert (=> d!167157 (= lt!677703 e!883321)))

(declare-fun res!1080686 () Bool)

(assert (=> d!167157 (=> (not res!1080686) (not e!883321))))

(assert (=> d!167157 (= res!1080686 (is-Cons!36844 l!1390))))

(assert (=> d!167157 (= (contains!10533 l!1390 (tuple2!25581 key!405 value!194)) lt!677703)))

(declare-fun b!1583060 () Bool)

(declare-fun e!883320 () Bool)

(assert (=> b!1583060 (= e!883321 e!883320)))

(declare-fun res!1080687 () Bool)

(assert (=> b!1583060 (=> res!1080687 e!883320)))

(assert (=> b!1583060 (= res!1080687 (= (h!38405 l!1390) (tuple2!25581 key!405 value!194)))))

(declare-fun b!1583061 () Bool)

(assert (=> b!1583061 (= e!883320 (contains!10533 (t!51754 l!1390) (tuple2!25581 key!405 value!194)))))

(assert (= (and d!167157 res!1080686) b!1583060))

(assert (= (and b!1583060 (not res!1080687)) b!1583061))

(declare-fun m!1454247 () Bool)

(assert (=> d!167157 m!1454247))

(declare-fun m!1454249 () Bool)

(assert (=> d!167157 m!1454249))

(declare-fun m!1454251 () Bool)

(assert (=> b!1583061 m!1454251))

(assert (=> b!1583022 d!167157))

(declare-fun d!167161 () Bool)

(assert (=> d!167161 (= (isEmpty!1170 lt!677697) (not (is-Some!898 lt!677697)))))

(assert (=> b!1583021 d!167161))

(declare-fun d!167165 () Bool)

(assert (=> d!167165 (= (unapply!83 l!1390) (ite (is-Nil!36845 l!1390) None!897 (Some!898 (tuple2!25583 (h!38405 l!1390) (t!51754 l!1390)))))))

(assert (=> b!1583021 d!167165))

(declare-fun d!167171 () Bool)

(assert (=> d!167171 (= (get!26838 lt!677697) (v!22396 lt!677697))))

(assert (=> b!1583024 d!167171))

(declare-fun b!1583086 () Bool)

(declare-fun e!883335 () Option!900)

(assert (=> b!1583086 (= e!883335 (getValueByKey!811 (t!51754 l!1390) key!405))))

(declare-fun d!167173 () Bool)

(declare-fun c!147347 () Bool)

(assert (=> d!167173 (= c!147347 (and (is-Cons!36844 l!1390) (= (_1!12801 (h!38405 l!1390)) key!405)))))

(declare-fun e!883334 () Option!900)

(assert (=> d!167173 (= (getValueByKey!811 l!1390 key!405) e!883334)))

(declare-fun b!1583084 () Bool)

(assert (=> b!1583084 (= e!883334 (Some!899 (_2!12801 (h!38405 l!1390))))))

(declare-fun b!1583085 () Bool)

(assert (=> b!1583085 (= e!883334 e!883335)))

(declare-fun c!147348 () Bool)

(assert (=> b!1583085 (= c!147348 (and (is-Cons!36844 l!1390) (not (= (_1!12801 (h!38405 l!1390)) key!405))))))

(declare-fun b!1583087 () Bool)

(assert (=> b!1583087 (= e!883335 None!898)))

(assert (= (and d!167173 c!147347) b!1583084))

(assert (= (and d!167173 (not c!147347)) b!1583085))

(assert (= (and b!1583085 c!147348) b!1583086))

(assert (= (and b!1583085 (not c!147348)) b!1583087))

(declare-fun m!1454257 () Bool)

(assert (=> b!1583086 m!1454257))

(assert (=> b!1583025 d!167173))

(declare-fun d!167183 () Bool)

(declare-fun res!1080698 () Bool)

(declare-fun e!883346 () Bool)

(assert (=> d!167183 (=> res!1080698 e!883346)))

(assert (=> d!167183 (= res!1080698 (or (is-Nil!36845 l!1390) (is-Nil!36845 (t!51754 l!1390))))))

(assert (=> d!167183 (= (isStrictlySorted!1062 l!1390) e!883346)))

(declare-fun b!1583100 () Bool)

(declare-fun e!883347 () Bool)

(assert (=> b!1583100 (= e!883346 e!883347)))

(declare-fun res!1080699 () Bool)

(assert (=> b!1583100 (=> (not res!1080699) (not e!883347))))

(assert (=> b!1583100 (= res!1080699 (bvslt (_1!12801 (h!38405 l!1390)) (_1!12801 (h!38405 (t!51754 l!1390)))))))

(declare-fun b!1583101 () Bool)

(assert (=> b!1583101 (= e!883347 (isStrictlySorted!1062 (t!51754 l!1390)))))

(assert (= (and d!167183 (not res!1080698)) b!1583100))

(assert (= (and b!1583100 res!1080699) b!1583101))

(declare-fun m!1454261 () Bool)

(assert (=> b!1583101 m!1454261))

(assert (=> start!137614 d!167183))

(declare-fun d!167187 () Bool)

(declare-fun res!1080708 () Bool)

(declare-fun e!883357 () Bool)

(assert (=> d!167187 (=> res!1080708 e!883357)))

(assert (=> d!167187 (= res!1080708 (and (is-Cons!36844 l!1390) (= (_1!12801 (h!38405 l!1390)) key!405)))))

(assert (=> d!167187 (= (containsKey!921 l!1390 key!405) e!883357)))

(declare-fun b!1583112 () Bool)

(declare-fun e!883361 () Bool)

(assert (=> b!1583112 (= e!883357 e!883361)))

(declare-fun res!1080713 () Bool)

(assert (=> b!1583112 (=> (not res!1080713) (not e!883361))))

(assert (=> b!1583112 (= res!1080713 (and (or (not (is-Cons!36844 l!1390)) (bvsle (_1!12801 (h!38405 l!1390)) key!405)) (is-Cons!36844 l!1390) (bvslt (_1!12801 (h!38405 l!1390)) key!405)))))

(declare-fun b!1583113 () Bool)

(assert (=> b!1583113 (= e!883361 (containsKey!921 (t!51754 l!1390) key!405))))

(assert (= (and d!167187 (not res!1080708)) b!1583112))

(assert (= (and b!1583112 res!1080713) b!1583113))

(declare-fun m!1454265 () Bool)

(assert (=> b!1583113 m!1454265))

(assert (=> b!1583023 d!167187))

(declare-fun b!1583122 () Bool)

(declare-fun e!883366 () Bool)

(declare-fun tp!114495 () Bool)

(assert (=> b!1583122 (= e!883366 (and tp_is_empty!39213 tp!114495))))

(assert (=> b!1583020 (= tp!114489 e!883366)))

(assert (= (and b!1583020 (is-Cons!36844 (t!51754 l!1390))) b!1583122))

(push 1)

(assert (not b!1583113))

(assert (not b!1583122))

(assert (not b!1583086))

(assert (not d!167157))

(assert (not b!1583061))

(assert tp_is_empty!39213)

(assert (not b!1583101))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167197 () Bool)

(declare-fun c!147353 () Bool)

(assert (=> d!167197 (= c!147353 (is-Nil!36845 l!1390))))

(declare-fun e!883391 () (Set tuple2!25580))

(assert (=> d!167197 (= (content!820 l!1390) e!883391)))

(declare-fun b!1583153 () Bool)

(assert (=> b!1583153 (= e!883391 (as emptyset (Set tuple2!25580)))))

(declare-fun b!1583154 () Bool)

(assert (=> b!1583154 (= e!883391 (union (insert (h!38405 l!1390) (as emptyset (Set tuple2!25580))) (content!820 (t!51754 l!1390))))))

(assert (= (and d!167197 c!147353) b!1583153))

(assert (= (and d!167197 (not c!147353)) b!1583154))

(declare-fun m!1454283 () Bool)

(assert (=> b!1583154 m!1454283))

(declare-fun m!1454285 () Bool)

(assert (=> b!1583154 m!1454285))

(assert (=> d!167157 d!167197))

(declare-fun d!167199 () Bool)

(declare-fun res!1080732 () Bool)

(declare-fun e!883392 () Bool)

(assert (=> d!167199 (=> res!1080732 e!883392)))

(assert (=> d!167199 (= res!1080732 (or (is-Nil!36845 (t!51754 l!1390)) (is-Nil!36845 (t!51754 (t!51754 l!1390)))))))

(assert (=> d!167199 (= (isStrictlySorted!1062 (t!51754 l!1390)) e!883392)))

(declare-fun b!1583155 () Bool)

(declare-fun e!883393 () Bool)

(assert (=> b!1583155 (= e!883392 e!883393)))

(declare-fun res!1080733 () Bool)

(assert (=> b!1583155 (=> (not res!1080733) (not e!883393))))

(assert (=> b!1583155 (= res!1080733 (bvslt (_1!12801 (h!38405 (t!51754 l!1390))) (_1!12801 (h!38405 (t!51754 (t!51754 l!1390))))))))

(declare-fun b!1583156 () Bool)

(assert (=> b!1583156 (= e!883393 (isStrictlySorted!1062 (t!51754 (t!51754 l!1390))))))

(assert (= (and d!167199 (not res!1080732)) b!1583155))

(assert (= (and b!1583155 res!1080733) b!1583156))

(declare-fun m!1454287 () Bool)

(assert (=> b!1583156 m!1454287))

(assert (=> b!1583101 d!167199))

(declare-fun d!167201 () Bool)

(declare-fun res!1080734 () Bool)

(declare-fun e!883394 () Bool)

(assert (=> d!167201 (=> res!1080734 e!883394)))

(assert (=> d!167201 (= res!1080734 (and (is-Cons!36844 (t!51754 l!1390)) (= (_1!12801 (h!38405 (t!51754 l!1390))) key!405)))))

(assert (=> d!167201 (= (containsKey!921 (t!51754 l!1390) key!405) e!883394)))

(declare-fun b!1583157 () Bool)

(declare-fun e!883395 () Bool)

(assert (=> b!1583157 (= e!883394 e!883395)))

(declare-fun res!1080735 () Bool)

(assert (=> b!1583157 (=> (not res!1080735) (not e!883395))))

(assert (=> b!1583157 (= res!1080735 (and (or (not (is-Cons!36844 (t!51754 l!1390))) (bvsle (_1!12801 (h!38405 (t!51754 l!1390))) key!405)) (is-Cons!36844 (t!51754 l!1390)) (bvslt (_1!12801 (h!38405 (t!51754 l!1390))) key!405)))))

(declare-fun b!1583158 () Bool)

(assert (=> b!1583158 (= e!883395 (containsKey!921 (t!51754 (t!51754 l!1390)) key!405))))

(assert (= (and d!167201 (not res!1080734)) b!1583157))

(assert (= (and b!1583157 res!1080735) b!1583158))

(declare-fun m!1454289 () Bool)

(assert (=> b!1583158 m!1454289))

(assert (=> b!1583113 d!167201))

(declare-fun lt!677710 () Bool)

(declare-fun d!167203 () Bool)

(assert (=> d!167203 (= lt!677710 (member (tuple2!25581 key!405 value!194) (content!820 (t!51754 l!1390))))))

(declare-fun e!883397 () Bool)

(assert (=> d!167203 (= lt!677710 e!883397)))

(declare-fun res!1080736 () Bool)

(assert (=> d!167203 (=> (not res!1080736) (not e!883397))))

(assert (=> d!167203 (= res!1080736 (is-Cons!36844 (t!51754 l!1390)))))

(assert (=> d!167203 (= (contains!10533 (t!51754 l!1390) (tuple2!25581 key!405 value!194)) lt!677710)))

(declare-fun b!1583159 () Bool)

(declare-fun e!883396 () Bool)

(assert (=> b!1583159 (= e!883397 e!883396)))

(declare-fun res!1080737 () Bool)

(assert (=> b!1583159 (=> res!1080737 e!883396)))

(assert (=> b!1583159 (= res!1080737 (= (h!38405 (t!51754 l!1390)) (tuple2!25581 key!405 value!194)))))

(declare-fun b!1583160 () Bool)

(assert (=> b!1583160 (= e!883396 (contains!10533 (t!51754 (t!51754 l!1390)) (tuple2!25581 key!405 value!194)))))

(assert (= (and d!167203 res!1080736) b!1583159))

(assert (= (and b!1583159 (not res!1080737)) b!1583160))

(assert (=> d!167203 m!1454285))

(declare-fun m!1454291 () Bool)

(assert (=> d!167203 m!1454291))

(declare-fun m!1454293 () Bool)

(assert (=> b!1583160 m!1454293))

(assert (=> b!1583061 d!167203))

(declare-fun b!1583163 () Bool)

(declare-fun e!883399 () Option!900)

(assert (=> b!1583163 (= e!883399 (getValueByKey!811 (t!51754 (t!51754 l!1390)) key!405))))

(declare-fun d!167205 () Bool)

(declare-fun c!147354 () Bool)

(assert (=> d!167205 (= c!147354 (and (is-Cons!36844 (t!51754 l!1390)) (= (_1!12801 (h!38405 (t!51754 l!1390))) key!405)))))

(declare-fun e!883398 () Option!900)

(assert (=> d!167205 (= (getValueByKey!811 (t!51754 l!1390) key!405) e!883398)))

(declare-fun b!1583161 () Bool)

(assert (=> b!1583161 (= e!883398 (Some!899 (_2!12801 (h!38405 (t!51754 l!1390)))))))

(declare-fun b!1583162 () Bool)

(assert (=> b!1583162 (= e!883398 e!883399)))

(declare-fun c!147355 () Bool)

(assert (=> b!1583162 (= c!147355 (and (is-Cons!36844 (t!51754 l!1390)) (not (= (_1!12801 (h!38405 (t!51754 l!1390))) key!405))))))

(declare-fun b!1583164 () Bool)

(assert (=> b!1583164 (= e!883399 None!898)))

(assert (= (and d!167205 c!147354) b!1583161))

(assert (= (and d!167205 (not c!147354)) b!1583162))

(assert (= (and b!1583162 c!147355) b!1583163))

(assert (= (and b!1583162 (not c!147355)) b!1583164))

(declare-fun m!1454295 () Bool)

(assert (=> b!1583163 m!1454295))

(assert (=> b!1583086 d!167205))

(declare-fun b!1583165 () Bool)

(declare-fun e!883400 () Bool)

(declare-fun tp!114502 () Bool)

(assert (=> b!1583165 (= e!883400 (and tp_is_empty!39213 tp!114502))))

(assert (=> b!1583122 (= tp!114495 e!883400)))

(assert (= (and b!1583122 (is-Cons!36844 (t!51754 (t!51754 l!1390)))) b!1583165))

(push 1)

(assert (not b!1583165))

(assert (not b!1583154))

(assert tp_is_empty!39213)

(assert (not d!167203))

(assert (not b!1583158))

(assert (not b!1583163))

(assert (not b!1583156))

(assert (not b!1583160))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

