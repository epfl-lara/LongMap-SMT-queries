; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137326 () Bool)

(assert start!137326)

(declare-fun b!1581131 () Bool)

(declare-fun e!882192 () Bool)

(declare-datatypes ((B!2688 0))(
  ( (B!2689 (val!19706 Int)) )
))
(declare-datatypes ((tuple2!25560 0))(
  ( (tuple2!25561 (_1!12791 (_ BitVec 64)) (_2!12791 B!2688)) )
))
(declare-datatypes ((List!36826 0))(
  ( (Nil!36823) (Cons!36822 (h!38365 tuple2!25560) (t!51740 List!36826)) )
))
(declare-fun l!1390 () List!36826)

(declare-fun lt!676887 () tuple2!25560)

(declare-fun contains!10498 (List!36826 tuple2!25560) Bool)

(assert (=> b!1581131 (= e!882192 (not (contains!10498 (t!51740 l!1390) lt!676887)))))

(declare-fun b!1581132 () Bool)

(declare-fun e!882194 () Bool)

(assert (=> b!1581132 (= e!882194 e!882192)))

(declare-fun res!1080182 () Bool)

(assert (=> b!1581132 (=> res!1080182 e!882192)))

(declare-fun isStrictlySorted!1084 (List!36826) Bool)

(assert (=> b!1581132 (= res!1080182 (not (isStrictlySorted!1084 (t!51740 l!1390))))))

(declare-fun b!1581133 () Bool)

(declare-fun e!882193 () Bool)

(declare-fun tp_is_empty!39233 () Bool)

(declare-fun tp!114548 () Bool)

(assert (=> b!1581133 (= e!882193 (and tp_is_empty!39233 tp!114548))))

(declare-fun b!1581134 () Bool)

(declare-fun res!1080180 () Bool)

(assert (=> b!1581134 (=> (not res!1080180) (not e!882194))))

(declare-fun key!405 () (_ BitVec 64))

(assert (=> b!1581134 (= res!1080180 (and (or (not (is-Cons!36822 l!1390)) (not (= (_1!12791 (h!38365 l!1390)) key!405))) (is-Cons!36822 l!1390)))))

(declare-fun b!1581135 () Bool)

(declare-fun e!882191 () Bool)

(declare-fun e!882189 () Bool)

(assert (=> b!1581135 (= e!882191 e!882189)))

(declare-fun res!1080177 () Bool)

(assert (=> b!1581135 (=> (not res!1080177) (not e!882189))))

(assert (=> b!1581135 (= res!1080177 (contains!10498 l!1390 lt!676887))))

(declare-fun value!194 () B!2688)

(assert (=> b!1581135 (= lt!676887 (tuple2!25561 key!405 value!194))))

(declare-fun b!1581137 () Bool)

(declare-fun res!1080179 () Bool)

(assert (=> b!1581137 (=> res!1080179 e!882192)))

(declare-fun containsKey!930 (List!36826 (_ BitVec 64)) Bool)

(assert (=> b!1581137 (= res!1080179 (not (containsKey!930 (t!51740 l!1390) key!405)))))

(declare-fun b!1581138 () Bool)

(assert (=> b!1581138 (= e!882189 e!882194)))

(declare-fun res!1080176 () Bool)

(assert (=> b!1581138 (=> (not res!1080176) (not e!882194))))

(declare-fun e!882190 () Bool)

(assert (=> b!1581138 (= res!1080176 e!882190)))

(declare-fun res!1080183 () Bool)

(assert (=> b!1581138 (=> res!1080183 e!882190)))

(declare-datatypes ((tuple2!25562 0))(
  ( (tuple2!25563 (_1!12792 tuple2!25560) (_2!12792 List!36826)) )
))
(declare-datatypes ((Option!919 0))(
  ( (Some!918 (v!22428 tuple2!25562)) (None!917) )
))
(declare-fun lt!676886 () Option!919)

(declare-fun isEmpty!1177 (Option!919) Bool)

(assert (=> b!1581138 (= res!1080183 (isEmpty!1177 lt!676886))))

(declare-fun unapply!93 (List!36826) Option!919)

(assert (=> b!1581138 (= lt!676886 (unapply!93 l!1390))))

(declare-fun b!1581139 () Bool)

(declare-fun res!1080181 () Bool)

(assert (=> b!1581139 (=> (not res!1080181) (not e!882191))))

(assert (=> b!1581139 (= res!1080181 (containsKey!930 l!1390 key!405))))

(declare-fun res!1080178 () Bool)

(assert (=> start!137326 (=> (not res!1080178) (not e!882191))))

(assert (=> start!137326 (= res!1080178 (isStrictlySorted!1084 l!1390))))

(assert (=> start!137326 e!882191))

(assert (=> start!137326 e!882193))

(assert (=> start!137326 true))

(assert (=> start!137326 tp_is_empty!39233))

(declare-fun b!1581136 () Bool)

(declare-fun get!26810 (Option!919) tuple2!25562)

(assert (=> b!1581136 (= e!882190 (not (is-Nil!36823 (_2!12792 (get!26810 lt!676886)))))))

(assert (= (and start!137326 res!1080178) b!1581139))

(assert (= (and b!1581139 res!1080181) b!1581135))

(assert (= (and b!1581135 res!1080177) b!1581138))

(assert (= (and b!1581138 (not res!1080183)) b!1581136))

(assert (= (and b!1581138 res!1080176) b!1581134))

(assert (= (and b!1581134 res!1080180) b!1581132))

(assert (= (and b!1581132 (not res!1080182)) b!1581137))

(assert (= (and b!1581137 (not res!1080179)) b!1581131))

(assert (= (and start!137326 (is-Cons!36822 l!1390)) b!1581133))

(declare-fun m!1452239 () Bool)

(assert (=> b!1581135 m!1452239))

(declare-fun m!1452241 () Bool)

(assert (=> b!1581137 m!1452241))

(declare-fun m!1452243 () Bool)

(assert (=> b!1581138 m!1452243))

(declare-fun m!1452245 () Bool)

(assert (=> b!1581138 m!1452245))

(declare-fun m!1452247 () Bool)

(assert (=> b!1581131 m!1452247))

(declare-fun m!1452249 () Bool)

(assert (=> b!1581132 m!1452249))

(declare-fun m!1452251 () Bool)

(assert (=> b!1581139 m!1452251))

(declare-fun m!1452253 () Bool)

(assert (=> start!137326 m!1452253))

(declare-fun m!1452255 () Bool)

(assert (=> b!1581136 m!1452255))

(push 1)

(assert (not b!1581133))

(assert (not b!1581138))

(assert (not b!1581131))

(assert (not b!1581135))

(assert tp_is_empty!39233)

(assert (not start!137326))

(assert (not b!1581132))

(assert (not b!1581139))

(assert (not b!1581136))

(assert (not b!1581137))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166619 () Bool)

(declare-fun lt!676894 () Bool)

(declare-fun content!844 (List!36826) (Set tuple2!25560))

(assert (=> d!166619 (= lt!676894 (member lt!676887 (content!844 l!1390)))))

(declare-fun e!882207 () Bool)

(assert (=> d!166619 (= lt!676894 e!882207)))

(declare-fun res!1080196 () Bool)

(assert (=> d!166619 (=> (not res!1080196) (not e!882207))))

(assert (=> d!166619 (= res!1080196 (is-Cons!36822 l!1390))))

(assert (=> d!166619 (= (contains!10498 l!1390 lt!676887) lt!676894)))

(declare-fun b!1581152 () Bool)

(declare-fun e!882208 () Bool)

(assert (=> b!1581152 (= e!882207 e!882208)))

(declare-fun res!1080197 () Bool)

(assert (=> b!1581152 (=> res!1080197 e!882208)))

(assert (=> b!1581152 (= res!1080197 (= (h!38365 l!1390) lt!676887))))

(declare-fun b!1581153 () Bool)

(assert (=> b!1581153 (= e!882208 (contains!10498 (t!51740 l!1390) lt!676887))))

(assert (= (and d!166619 res!1080196) b!1581152))

(assert (= (and b!1581152 (not res!1080197)) b!1581153))

(declare-fun m!1452267 () Bool)

(assert (=> d!166619 m!1452267))

(declare-fun m!1452269 () Bool)

(assert (=> d!166619 m!1452269))

(assert (=> b!1581153 m!1452247))

(assert (=> b!1581135 d!166619))

(declare-fun d!166633 () Bool)

(declare-fun res!1080214 () Bool)

(declare-fun e!882225 () Bool)

(assert (=> d!166633 (=> res!1080214 e!882225)))

(assert (=> d!166633 (= res!1080214 (or (is-Nil!36823 l!1390) (is-Nil!36823 (t!51740 l!1390))))))

(assert (=> d!166633 (= (isStrictlySorted!1084 l!1390) e!882225)))

(declare-fun b!1581170 () Bool)

(declare-fun e!882226 () Bool)

(assert (=> b!1581170 (= e!882225 e!882226)))

(declare-fun res!1080215 () Bool)

(assert (=> b!1581170 (=> (not res!1080215) (not e!882226))))

(assert (=> b!1581170 (= res!1080215 (bvslt (_1!12791 (h!38365 l!1390)) (_1!12791 (h!38365 (t!51740 l!1390)))))))

(declare-fun b!1581171 () Bool)

(assert (=> b!1581171 (= e!882226 (isStrictlySorted!1084 (t!51740 l!1390)))))

(assert (= (and d!166633 (not res!1080214)) b!1581170))

(assert (= (and b!1581170 res!1080215) b!1581171))

(assert (=> b!1581171 m!1452249))

(assert (=> start!137326 d!166633))

(declare-fun d!166641 () Bool)

(declare-fun res!1080238 () Bool)

(declare-fun e!882249 () Bool)

(assert (=> d!166641 (=> res!1080238 e!882249)))

(assert (=> d!166641 (= res!1080238 (and (is-Cons!36822 l!1390) (= (_1!12791 (h!38365 l!1390)) key!405)))))

(assert (=> d!166641 (= (containsKey!930 l!1390 key!405) e!882249)))

(declare-fun b!1581194 () Bool)

(declare-fun e!882250 () Bool)

(assert (=> b!1581194 (= e!882249 e!882250)))

(declare-fun res!1080239 () Bool)

(assert (=> b!1581194 (=> (not res!1080239) (not e!882250))))

(assert (=> b!1581194 (= res!1080239 (and (or (not (is-Cons!36822 l!1390)) (bvsle (_1!12791 (h!38365 l!1390)) key!405)) (is-Cons!36822 l!1390) (bvslt (_1!12791 (h!38365 l!1390)) key!405)))))

(declare-fun b!1581195 () Bool)

(assert (=> b!1581195 (= e!882250 (containsKey!930 (t!51740 l!1390) key!405))))

(assert (= (and d!166641 (not res!1080238)) b!1581194))

(assert (= (and b!1581194 res!1080239) b!1581195))

(assert (=> b!1581195 m!1452241))

(assert (=> b!1581139 d!166641))

(declare-fun d!166653 () Bool)

(declare-fun res!1080242 () Bool)

(declare-fun e!882253 () Bool)

(assert (=> d!166653 (=> res!1080242 e!882253)))

(assert (=> d!166653 (= res!1080242 (and (is-Cons!36822 (t!51740 l!1390)) (= (_1!12791 (h!38365 (t!51740 l!1390))) key!405)))))

(assert (=> d!166653 (= (containsKey!930 (t!51740 l!1390) key!405) e!882253)))

(declare-fun b!1581198 () Bool)

(declare-fun e!882254 () Bool)

(assert (=> b!1581198 (= e!882253 e!882254)))

(declare-fun res!1080243 () Bool)

(assert (=> b!1581198 (=> (not res!1080243) (not e!882254))))

(assert (=> b!1581198 (= res!1080243 (and (or (not (is-Cons!36822 (t!51740 l!1390))) (bvsle (_1!12791 (h!38365 (t!51740 l!1390))) key!405)) (is-Cons!36822 (t!51740 l!1390)) (bvslt (_1!12791 (h!38365 (t!51740 l!1390))) key!405)))))

(declare-fun b!1581199 () Bool)

(assert (=> b!1581199 (= e!882254 (containsKey!930 (t!51740 (t!51740 l!1390)) key!405))))

(assert (= (and d!166653 (not res!1080242)) b!1581198))

(assert (= (and b!1581198 res!1080243) b!1581199))

(declare-fun m!1452279 () Bool)

(assert (=> b!1581199 m!1452279))

(assert (=> b!1581137 d!166653))

(declare-fun d!166657 () Bool)

(declare-fun res!1080244 () Bool)

(declare-fun e!882255 () Bool)

(assert (=> d!166657 (=> res!1080244 e!882255)))

(assert (=> d!166657 (= res!1080244 (or (is-Nil!36823 (t!51740 l!1390)) (is-Nil!36823 (t!51740 (t!51740 l!1390)))))))

(assert (=> d!166657 (= (isStrictlySorted!1084 (t!51740 l!1390)) e!882255)))

(declare-fun b!1581200 () Bool)

(declare-fun e!882256 () Bool)

(assert (=> b!1581200 (= e!882255 e!882256)))

(declare-fun res!1080245 () Bool)

(assert (=> b!1581200 (=> (not res!1080245) (not e!882256))))

(assert (=> b!1581200 (= res!1080245 (bvslt (_1!12791 (h!38365 (t!51740 l!1390))) (_1!12791 (h!38365 (t!51740 (t!51740 l!1390))))))))

(declare-fun b!1581201 () Bool)

(assert (=> b!1581201 (= e!882256 (isStrictlySorted!1084 (t!51740 (t!51740 l!1390))))))

(assert (= (and d!166657 (not res!1080244)) b!1581200))

(assert (= (and b!1581200 res!1080245) b!1581201))

(declare-fun m!1452281 () Bool)

(assert (=> b!1581201 m!1452281))

(assert (=> b!1581132 d!166657))

(declare-fun d!166661 () Bool)

(assert (=> d!166661 (= (isEmpty!1177 lt!676886) (not (is-Some!918 lt!676886)))))

(assert (=> b!1581138 d!166661))

(declare-fun d!166663 () Bool)

(assert (=> d!166663 (= (unapply!93 l!1390) (ite (is-Nil!36823 l!1390) None!917 (Some!918 (tuple2!25563 (h!38365 l!1390) (t!51740 l!1390)))))))

(assert (=> b!1581138 d!166663))

(declare-fun d!166665 () Bool)

(assert (=> d!166665 (= (get!26810 lt!676886) (v!22428 lt!676886))))

(assert (=> b!1581136 d!166665))

(declare-fun d!166667 () Bool)

(declare-fun lt!676898 () Bool)

(assert (=> d!166667 (= lt!676898 (member lt!676887 (content!844 (t!51740 l!1390))))))

(declare-fun e!882266 () Bool)

(assert (=> d!166667 (= lt!676898 e!882266)))

(declare-fun res!1080252 () Bool)

(assert (=> d!166667 (=> (not res!1080252) (not e!882266))))

(assert (=> d!166667 (= res!1080252 (is-Cons!36822 (t!51740 l!1390)))))

(assert (=> d!166667 (= (contains!10498 (t!51740 l!1390) lt!676887) lt!676898)))

(declare-fun b!1581213 () Bool)

(declare-fun e!882267 () Bool)

(assert (=> b!1581213 (= e!882266 e!882267)))

(declare-fun res!1080253 () Bool)

(assert (=> b!1581213 (=> res!1080253 e!882267)))

(assert (=> b!1581213 (= res!1080253 (= (h!38365 (t!51740 l!1390)) lt!676887))))

(declare-fun b!1581214 () Bool)

(assert (=> b!1581214 (= e!882267 (contains!10498 (t!51740 (t!51740 l!1390)) lt!676887))))

(assert (= (and d!166667 res!1080252) b!1581213))

(assert (= (and b!1581213 (not res!1080253)) b!1581214))

(declare-fun m!1452283 () Bool)

(assert (=> d!166667 m!1452283))

(declare-fun m!1452287 () Bool)

