; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137322 () Bool)

(assert start!137322)

(declare-fun b!1581077 () Bool)

(declare-fun e!882154 () Bool)

(declare-fun e!882155 () Bool)

(assert (=> b!1581077 (= e!882154 e!882155)))

(declare-fun res!1080131 () Bool)

(assert (=> b!1581077 (=> (not res!1080131) (not e!882155))))

(declare-fun e!882158 () Bool)

(assert (=> b!1581077 (= res!1080131 e!882158)))

(declare-fun res!1080129 () Bool)

(assert (=> b!1581077 (=> res!1080129 e!882158)))

(declare-datatypes ((B!2684 0))(
  ( (B!2685 (val!19704 Int)) )
))
(declare-datatypes ((tuple2!25552 0))(
  ( (tuple2!25553 (_1!12787 (_ BitVec 64)) (_2!12787 B!2684)) )
))
(declare-datatypes ((List!36824 0))(
  ( (Nil!36821) (Cons!36820 (h!38363 tuple2!25552) (t!51738 List!36824)) )
))
(declare-datatypes ((tuple2!25554 0))(
  ( (tuple2!25555 (_1!12788 tuple2!25552) (_2!12788 List!36824)) )
))
(declare-datatypes ((Option!917 0))(
  ( (Some!916 (v!22426 tuple2!25554)) (None!915) )
))
(declare-fun lt!676874 () Option!917)

(declare-fun isEmpty!1175 (Option!917) Bool)

(assert (=> b!1581077 (= res!1080129 (isEmpty!1175 lt!676874))))

(declare-fun l!1390 () List!36824)

(declare-fun unapply!91 (List!36824) Option!917)

(assert (=> b!1581077 (= lt!676874 (unapply!91 l!1390))))

(declare-fun b!1581078 () Bool)

(declare-fun e!882153 () Bool)

(assert (=> b!1581078 (= e!882153 e!882154)))

(declare-fun res!1080132 () Bool)

(assert (=> b!1581078 (=> (not res!1080132) (not e!882154))))

(declare-fun lt!676875 () tuple2!25552)

(declare-fun contains!10496 (List!36824 tuple2!25552) Bool)

(assert (=> b!1581078 (= res!1080132 (contains!10496 l!1390 lt!676875))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun value!194 () B!2684)

(assert (=> b!1581078 (= lt!676875 (tuple2!25553 key!405 value!194))))

(declare-fun b!1581079 () Bool)

(declare-fun e!882157 () Bool)

(declare-fun tp_is_empty!39229 () Bool)

(declare-fun tp!114542 () Bool)

(assert (=> b!1581079 (= e!882157 (and tp_is_empty!39229 tp!114542))))

(declare-fun b!1581080 () Bool)

(declare-fun res!1080128 () Bool)

(assert (=> b!1581080 (=> (not res!1080128) (not e!882155))))

(assert (=> b!1581080 (= res!1080128 (and (or (not (is-Cons!36820 l!1390)) (not (= (_1!12787 (h!38363 l!1390)) key!405))) (is-Cons!36820 l!1390)))))

(declare-fun res!1080130 () Bool)

(assert (=> start!137322 (=> (not res!1080130) (not e!882153))))

(declare-fun isStrictlySorted!1082 (List!36824) Bool)

(assert (=> start!137322 (= res!1080130 (isStrictlySorted!1082 l!1390))))

(assert (=> start!137322 e!882153))

(assert (=> start!137322 e!882157))

(assert (=> start!137322 true))

(assert (=> start!137322 tp_is_empty!39229))

(declare-fun b!1581081 () Bool)

(declare-fun res!1080135 () Bool)

(assert (=> b!1581081 (=> (not res!1080135) (not e!882153))))

(declare-fun containsKey!928 (List!36824 (_ BitVec 64)) Bool)

(assert (=> b!1581081 (= res!1080135 (containsKey!928 l!1390 key!405))))

(declare-fun b!1581082 () Bool)

(declare-fun get!26808 (Option!917) tuple2!25554)

(assert (=> b!1581082 (= e!882158 (not (is-Nil!36821 (_2!12788 (get!26808 lt!676874)))))))

(declare-fun b!1581083 () Bool)

(declare-fun res!1080134 () Bool)

(declare-fun e!882156 () Bool)

(assert (=> b!1581083 (=> res!1080134 e!882156)))

(assert (=> b!1581083 (= res!1080134 (not (containsKey!928 (t!51738 l!1390) key!405)))))

(declare-fun b!1581084 () Bool)

(assert (=> b!1581084 (= e!882156 (not (contains!10496 (t!51738 l!1390) lt!676875)))))

(declare-fun b!1581085 () Bool)

(assert (=> b!1581085 (= e!882155 e!882156)))

(declare-fun res!1080133 () Bool)

(assert (=> b!1581085 (=> res!1080133 e!882156)))

(assert (=> b!1581085 (= res!1080133 (not (isStrictlySorted!1082 (t!51738 l!1390))))))

(assert (= (and start!137322 res!1080130) b!1581081))

(assert (= (and b!1581081 res!1080135) b!1581078))

(assert (= (and b!1581078 res!1080132) b!1581077))

(assert (= (and b!1581077 (not res!1080129)) b!1581082))

(assert (= (and b!1581077 res!1080131) b!1581080))

(assert (= (and b!1581080 res!1080128) b!1581085))

(assert (= (and b!1581085 (not res!1080133)) b!1581083))

(assert (= (and b!1581083 (not res!1080134)) b!1581084))

(assert (= (and start!137322 (is-Cons!36820 l!1390)) b!1581079))

(declare-fun m!1452203 () Bool)

(assert (=> b!1581082 m!1452203))

(declare-fun m!1452205 () Bool)

(assert (=> b!1581078 m!1452205))

(declare-fun m!1452207 () Bool)

(assert (=> b!1581077 m!1452207))

(declare-fun m!1452209 () Bool)

(assert (=> b!1581077 m!1452209))

(declare-fun m!1452211 () Bool)

(assert (=> b!1581084 m!1452211))

(declare-fun m!1452213 () Bool)

(assert (=> start!137322 m!1452213))

(declare-fun m!1452215 () Bool)

(assert (=> b!1581081 m!1452215))

(declare-fun m!1452217 () Bool)

(assert (=> b!1581085 m!1452217))

(declare-fun m!1452219 () Bool)

(assert (=> b!1581083 m!1452219))

(push 1)

(assert (not b!1581078))

(assert (not b!1581082))

(assert (not b!1581079))

(assert (not b!1581077))

(assert tp_is_empty!39229)

(assert (not b!1581081))

(assert (not b!1581084))

(assert (not start!137322))

(assert (not b!1581085))

(assert (not b!1581083))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166621 () Bool)

(assert (=> d!166621 (= (get!26808 lt!676874) (v!22426 lt!676874))))

(assert (=> b!1581082 d!166621))

(declare-fun d!166623 () Bool)

(assert (=> d!166623 (= (isEmpty!1175 lt!676874) (not (is-Some!916 lt!676874)))))

(assert (=> b!1581077 d!166623))

(declare-fun d!166625 () Bool)

(assert (=> d!166625 (= (unapply!91 l!1390) (ite (is-Nil!36821 l!1390) None!915 (Some!916 (tuple2!25555 (h!38363 l!1390) (t!51738 l!1390)))))))

(assert (=> b!1581077 d!166625))

(declare-fun d!166631 () Bool)

(declare-fun res!1080212 () Bool)

(declare-fun e!882223 () Bool)

(assert (=> d!166631 (=> res!1080212 e!882223)))

(assert (=> d!166631 (= res!1080212 (and (is-Cons!36820 l!1390) (= (_1!12787 (h!38363 l!1390)) key!405)))))

(assert (=> d!166631 (= (containsKey!928 l!1390 key!405) e!882223)))

(declare-fun b!1581168 () Bool)

(declare-fun e!882224 () Bool)

(assert (=> b!1581168 (= e!882223 e!882224)))

(declare-fun res!1080213 () Bool)

(assert (=> b!1581168 (=> (not res!1080213) (not e!882224))))

(assert (=> b!1581168 (= res!1080213 (and (or (not (is-Cons!36820 l!1390)) (bvsle (_1!12787 (h!38363 l!1390)) key!405)) (is-Cons!36820 l!1390) (bvslt (_1!12787 (h!38363 l!1390)) key!405)))))

(declare-fun b!1581169 () Bool)

(assert (=> b!1581169 (= e!882224 (containsKey!928 (t!51738 l!1390) key!405))))

(assert (= (and d!166631 (not res!1080212)) b!1581168))

(assert (= (and b!1581168 res!1080213) b!1581169))

(assert (=> b!1581169 m!1452219))

(assert (=> b!1581081 d!166631))

(declare-fun d!166639 () Bool)

(declare-fun res!1080228 () Bool)

(declare-fun e!882239 () Bool)

(assert (=> d!166639 (=> res!1080228 e!882239)))

(assert (=> d!166639 (= res!1080228 (or (is-Nil!36821 l!1390) (is-Nil!36821 (t!51738 l!1390))))))

(assert (=> d!166639 (= (isStrictlySorted!1082 l!1390) e!882239)))

(declare-fun b!1581184 () Bool)

(declare-fun e!882240 () Bool)

(assert (=> b!1581184 (= e!882239 e!882240)))

(declare-fun res!1080229 () Bool)

(assert (=> b!1581184 (=> (not res!1080229) (not e!882240))))

(assert (=> b!1581184 (= res!1080229 (bvslt (_1!12787 (h!38363 l!1390)) (_1!12787 (h!38363 (t!51738 l!1390)))))))

(declare-fun b!1581185 () Bool)

(assert (=> b!1581185 (= e!882240 (isStrictlySorted!1082 (t!51738 l!1390)))))

(assert (= (and d!166639 (not res!1080228)) b!1581184))

(assert (= (and b!1581184 res!1080229) b!1581185))

(assert (=> b!1581185 m!1452217))

(assert (=> start!137322 d!166639))

(declare-fun d!166643 () Bool)

(declare-fun res!1080232 () Bool)

(declare-fun e!882243 () Bool)

(assert (=> d!166643 (=> res!1080232 e!882243)))

(assert (=> d!166643 (= res!1080232 (or (is-Nil!36821 (t!51738 l!1390)) (is-Nil!36821 (t!51738 (t!51738 l!1390)))))))

(assert (=> d!166643 (= (isStrictlySorted!1082 (t!51738 l!1390)) e!882243)))

(declare-fun b!1581188 () Bool)

(declare-fun e!882244 () Bool)

(assert (=> b!1581188 (= e!882243 e!882244)))

(declare-fun res!1080233 () Bool)

(assert (=> b!1581188 (=> (not res!1080233) (not e!882244))))

(assert (=> b!1581188 (= res!1080233 (bvslt (_1!12787 (h!38363 (t!51738 l!1390))) (_1!12787 (h!38363 (t!51738 (t!51738 l!1390))))))))

(declare-fun b!1581189 () Bool)

(assert (=> b!1581189 (= e!882244 (isStrictlySorted!1082 (t!51738 (t!51738 l!1390))))))

(assert (= (and d!166643 (not res!1080232)) b!1581188))

(assert (= (and b!1581188 res!1080233) b!1581189))

(declare-fun m!1452275 () Bool)

(assert (=> b!1581189 m!1452275))

(assert (=> b!1581085 d!166643))

(declare-fun d!166647 () Bool)

(declare-fun res!1080236 () Bool)

(declare-fun e!882247 () Bool)

(assert (=> d!166647 (=> res!1080236 e!882247)))

(assert (=> d!166647 (= res!1080236 (and (is-Cons!36820 (t!51738 l!1390)) (= (_1!12787 (h!38363 (t!51738 l!1390))) key!405)))))

(assert (=> d!166647 (= (containsKey!928 (t!51738 l!1390) key!405) e!882247)))

(declare-fun b!1581192 () Bool)

(declare-fun e!882248 () Bool)

(assert (=> b!1581192 (= e!882247 e!882248)))

(declare-fun res!1080237 () Bool)

(assert (=> b!1581192 (=> (not res!1080237) (not e!882248))))

(assert (=> b!1581192 (= res!1080237 (and (or (not (is-Cons!36820 (t!51738 l!1390))) (bvsle (_1!12787 (h!38363 (t!51738 l!1390))) key!405)) (is-Cons!36820 (t!51738 l!1390)) (bvslt (_1!12787 (h!38363 (t!51738 l!1390))) key!405)))))

(declare-fun b!1581193 () Bool)

(assert (=> b!1581193 (= e!882248 (containsKey!928 (t!51738 (t!51738 l!1390)) key!405))))

(assert (= (and d!166647 (not res!1080236)) b!1581192))

(assert (= (and b!1581192 res!1080237) b!1581193))

(declare-fun m!1452277 () Bool)

(assert (=> b!1581193 m!1452277))

(assert (=> b!1581083 d!166647))

(declare-fun d!166651 () Bool)

(declare-fun lt!676897 () Bool)

(declare-fun content!845 (List!36824) (Set tuple2!25552))

(assert (=> d!166651 (= lt!676897 (set.member lt!676875 (content!845 l!1390)))))

(declare-fun e!882264 () Bool)

(assert (=> d!166651 (= lt!676897 e!882264)))

(declare-fun res!1080251 () Bool)

(assert (=> d!166651 (=> (not res!1080251) (not e!882264))))

(assert (=> d!166651 (= res!1080251 (is-Cons!36820 l!1390))))

(assert (=> d!166651 (= (contains!10496 l!1390 lt!676875) lt!676897)))

(declare-fun b!1581211 () Bool)

(declare-fun e!882265 () Bool)

(assert (=> b!1581211 (= e!882264 e!882265)))

(declare-fun res!1080250 () Bool)

(assert (=> b!1581211 (=> res!1080250 e!882265)))

(assert (=> b!1581211 (= res!1080250 (= (h!38363 l!1390) lt!676875))))

(declare-fun b!1581212 () Bool)

(assert (=> b!1581212 (= e!882265 (contains!10496 (t!51738 l!1390) lt!676875))))

(assert (= (and d!166651 res!1080251) b!1581211))

(assert (= (and b!1581211 (not res!1080250)) b!1581212))

(declare-fun m!1452285 () Bool)

(assert (=> d!166651 m!1452285))

(declare-fun m!1452289 () Bool)

(assert (=> d!166651 m!1452289))

(assert (=> b!1581212 m!1452211))

(assert (=> b!1581078 d!166651))

(declare-fun d!166669 () Bool)

(declare-fun lt!676899 () Bool)

(assert (=> d!166669 (= lt!676899 (set.member lt!676875 (content!845 (t!51738 l!1390))))))

(declare-fun e!882270 () Bool)

(assert (=> d!166669 (= lt!676899 e!882270)))

(declare-fun res!1080255 () Bool)

(assert (=> d!166669 (=> (not res!1080255) (not e!882270))))

(assert (=> d!166669 (= res!1080255 (is-Cons!36820 (t!51738 l!1390)))))

(assert (=> d!166669 (= (contains!10496 (t!51738 l!1390) lt!676875) lt!676899)))

(declare-fun b!1581219 () Bool)

(declare-fun e!882271 () Bool)

(assert (=> b!1581219 (= e!882270 e!882271)))

(declare-fun res!1080254 () Bool)

(assert (=> b!1581219 (=> res!1080254 e!882271)))

(assert (=> b!1581219 (= res!1080254 (= (h!38363 (t!51738 l!1390)) lt!676875))))

(declare-fun b!1581220 () Bool)

(assert (=> b!1581220 (= e!882271 (contains!10496 (t!51738 (t!51738 l!1390)) lt!676875))))

(assert (= (and d!166669 res!1080255) b!1581219))

(assert (= (and b!1581219 (not res!1080254)) b!1581220))

(declare-fun m!1452293 () Bool)

(assert (=> d!166669 m!1452293))

(declare-fun m!1452295 () Bool)

(assert (=> d!166669 m!1452295))

(declare-fun m!1452297 () Bool)

(assert (=> b!1581220 m!1452297))

(assert (=> b!1581084 d!166669))

(declare-fun b!1581226 () Bool)

(declare-fun e!882275 () Bool)

(declare-fun tp!114557 () Bool)

(assert (=> b!1581226 (= e!882275 (and tp_is_empty!39229 tp!114557))))

(assert (=> b!1581079 (= tp!114542 e!882275)))

(assert (= (and b!1581079 (is-Cons!36820 (t!51738 l!1390))) b!1581226))

(push 1)

(assert tp_is_empty!39229)

(assert (not b!1581189))

(assert (not b!1581212))

(assert (not d!166651))

(assert (not b!1581193))

