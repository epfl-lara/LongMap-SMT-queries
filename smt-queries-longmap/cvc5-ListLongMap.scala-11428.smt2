; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133292 () Bool)

(assert start!133292)

(declare-fun b!1558871 () Bool)

(declare-fun e!868460 () Bool)

(declare-fun tp_is_empty!38449 () Bool)

(declare-fun tp!112677 () Bool)

(assert (=> b!1558871 (= e!868460 (and tp_is_empty!38449 tp!112677))))

(declare-fun b!1558869 () Bool)

(declare-fun res!1066121 () Bool)

(declare-fun e!868459 () Bool)

(assert (=> b!1558869 (=> (not res!1066121) (not e!868459))))

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun newKey!135 () (_ BitVec 64))

(declare-datatypes ((B!2444 0))(
  ( (B!2445 (val!19308 Int)) )
))
(declare-datatypes ((tuple2!24992 0))(
  ( (tuple2!24993 (_1!12507 (_ BitVec 64)) (_2!12507 B!2444)) )
))
(declare-datatypes ((List!36342 0))(
  ( (Nil!36339) (Cons!36338 (h!37784 tuple2!24992) (t!51072 List!36342)) )
))
(declare-fun l!1292 () List!36342)

(assert (=> b!1558869 (= res!1066121 (and (not (= otherKey!62 newKey!135)) (or (not (is-Cons!36338 l!1292)) (= (_1!12507 (h!37784 l!1292)) otherKey!62))))))

(declare-fun res!1066122 () Bool)

(assert (=> start!133292 (=> (not res!1066122) (not e!868459))))

(declare-fun isStrictlySorted!982 (List!36342) Bool)

(assert (=> start!133292 (= res!1066122 (isStrictlySorted!982 l!1292))))

(assert (=> start!133292 e!868459))

(assert (=> start!133292 e!868460))

(assert (=> start!133292 true))

(assert (=> start!133292 tp_is_empty!38449))

(declare-fun b!1558870 () Bool)

(declare-fun newValue!135 () B!2444)

(declare-fun containsKey!845 (List!36342 (_ BitVec 64)) Bool)

(declare-fun insertStrictlySorted!573 (List!36342 (_ BitVec 64) B!2444) List!36342)

(assert (=> b!1558870 (= e!868459 (not (containsKey!845 (insertStrictlySorted!573 l!1292 newKey!135 newValue!135) otherKey!62)))))

(declare-fun b!1558868 () Bool)

(declare-fun res!1066123 () Bool)

(assert (=> b!1558868 (=> (not res!1066123) (not e!868459))))

(assert (=> b!1558868 (= res!1066123 (containsKey!845 l!1292 otherKey!62))))

(assert (= (and start!133292 res!1066122) b!1558868))

(assert (= (and b!1558868 res!1066123) b!1558869))

(assert (= (and b!1558869 res!1066121) b!1558870))

(assert (= (and start!133292 (is-Cons!36338 l!1292)) b!1558871))

(declare-fun m!1435347 () Bool)

(assert (=> start!133292 m!1435347))

(declare-fun m!1435349 () Bool)

(assert (=> b!1558870 m!1435349))

(assert (=> b!1558870 m!1435349))

(declare-fun m!1435351 () Bool)

(assert (=> b!1558870 m!1435351))

(declare-fun m!1435353 () Bool)

(assert (=> b!1558868 m!1435353))

(push 1)

(assert (not b!1558870))

(assert (not b!1558871))

(assert (not start!133292))

(assert (not b!1558868))

(assert tp_is_empty!38449)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162823 () Bool)

(declare-fun res!1066158 () Bool)

(declare-fun e!868489 () Bool)

(assert (=> d!162823 (=> res!1066158 e!868489)))

(assert (=> d!162823 (= res!1066158 (and (is-Cons!36338 l!1292) (= (_1!12507 (h!37784 l!1292)) otherKey!62)))))

(assert (=> d!162823 (= (containsKey!845 l!1292 otherKey!62) e!868489)))

(declare-fun b!1558912 () Bool)

(declare-fun e!868490 () Bool)

(assert (=> b!1558912 (= e!868489 e!868490)))

(declare-fun res!1066159 () Bool)

(assert (=> b!1558912 (=> (not res!1066159) (not e!868490))))

(assert (=> b!1558912 (= res!1066159 (and (or (not (is-Cons!36338 l!1292)) (bvsle (_1!12507 (h!37784 l!1292)) otherKey!62)) (is-Cons!36338 l!1292) (bvslt (_1!12507 (h!37784 l!1292)) otherKey!62)))))

(declare-fun b!1558913 () Bool)

(assert (=> b!1558913 (= e!868490 (containsKey!845 (t!51072 l!1292) otherKey!62))))

(assert (= (and d!162823 (not res!1066158)) b!1558912))

(assert (= (and b!1558912 res!1066159) b!1558913))

(declare-fun m!1435375 () Bool)

(assert (=> b!1558913 m!1435375))

(assert (=> b!1558868 d!162823))

(declare-fun d!162829 () Bool)

(declare-fun res!1066170 () Bool)

(declare-fun e!868501 () Bool)

(assert (=> d!162829 (=> res!1066170 e!868501)))

(assert (=> d!162829 (= res!1066170 (or (is-Nil!36339 l!1292) (is-Nil!36339 (t!51072 l!1292))))))

(assert (=> d!162829 (= (isStrictlySorted!982 l!1292) e!868501)))

(declare-fun b!1558924 () Bool)

(declare-fun e!868502 () Bool)

(assert (=> b!1558924 (= e!868501 e!868502)))

(declare-fun res!1066171 () Bool)

(assert (=> b!1558924 (=> (not res!1066171) (not e!868502))))

(assert (=> b!1558924 (= res!1066171 (bvslt (_1!12507 (h!37784 l!1292)) (_1!12507 (h!37784 (t!51072 l!1292)))))))

(declare-fun b!1558925 () Bool)

(assert (=> b!1558925 (= e!868502 (isStrictlySorted!982 (t!51072 l!1292)))))

(assert (= (and d!162829 (not res!1066170)) b!1558924))

(assert (= (and b!1558924 res!1066171) b!1558925))

(declare-fun m!1435377 () Bool)

(assert (=> b!1558925 m!1435377))

(assert (=> start!133292 d!162829))

(declare-fun d!162831 () Bool)

(declare-fun res!1066172 () Bool)

(declare-fun e!868503 () Bool)

(assert (=> d!162831 (=> res!1066172 e!868503)))

(assert (=> d!162831 (= res!1066172 (and (is-Cons!36338 (insertStrictlySorted!573 l!1292 newKey!135 newValue!135)) (= (_1!12507 (h!37784 (insertStrictlySorted!573 l!1292 newKey!135 newValue!135))) otherKey!62)))))

(assert (=> d!162831 (= (containsKey!845 (insertStrictlySorted!573 l!1292 newKey!135 newValue!135) otherKey!62) e!868503)))

(declare-fun b!1558926 () Bool)

(declare-fun e!868504 () Bool)

(assert (=> b!1558926 (= e!868503 e!868504)))

(declare-fun res!1066173 () Bool)

(assert (=> b!1558926 (=> (not res!1066173) (not e!868504))))

(assert (=> b!1558926 (= res!1066173 (and (or (not (is-Cons!36338 (insertStrictlySorted!573 l!1292 newKey!135 newValue!135))) (bvsle (_1!12507 (h!37784 (insertStrictlySorted!573 l!1292 newKey!135 newValue!135))) otherKey!62)) (is-Cons!36338 (insertStrictlySorted!573 l!1292 newKey!135 newValue!135)) (bvslt (_1!12507 (h!37784 (insertStrictlySorted!573 l!1292 newKey!135 newValue!135))) otherKey!62)))))

(declare-fun b!1558927 () Bool)

(assert (=> b!1558927 (= e!868504 (containsKey!845 (t!51072 (insertStrictlySorted!573 l!1292 newKey!135 newValue!135)) otherKey!62))))

(assert (= (and d!162831 (not res!1066172)) b!1558926))

(assert (= (and b!1558926 res!1066173) b!1558927))

(declare-fun m!1435381 () Bool)

(assert (=> b!1558927 m!1435381))

(assert (=> b!1558870 d!162831))

(declare-fun b!1559021 () Bool)

(declare-fun e!868559 () List!36342)

(declare-fun call!71821 () List!36342)

(assert (=> b!1559021 (= e!868559 call!71821)))

(declare-fun b!1559022 () Bool)

(declare-fun c!144198 () Bool)

(assert (=> b!1559022 (= c!144198 (and (is-Cons!36338 l!1292) (bvsgt (_1!12507 (h!37784 l!1292)) newKey!135)))))

(declare-fun e!868557 () List!36342)

(declare-fun e!868560 () List!36342)

(assert (=> b!1559022 (= e!868557 e!868560)))

(declare-fun b!1559023 () Bool)

(assert (=> b!1559023 (= e!868559 e!868557)))

(declare-fun c!144197 () Bool)

(assert (=> b!1559023 (= c!144197 (and (is-Cons!36338 l!1292) (= (_1!12507 (h!37784 l!1292)) newKey!135)))))

(declare-fun b!1559024 () Bool)

(declare-fun e!868558 () List!36342)

(assert (=> b!1559024 (= e!868558 (insertStrictlySorted!573 (t!51072 l!1292) newKey!135 newValue!135))))

(declare-fun d!162835 () Bool)

(declare-fun e!868556 () Bool)

(assert (=> d!162835 e!868556))

(declare-fun res!1066198 () Bool)

(assert (=> d!162835 (=> (not res!1066198) (not e!868556))))

(declare-fun lt!670838 () List!36342)

(assert (=> d!162835 (= res!1066198 (isStrictlySorted!982 lt!670838))))

(assert (=> d!162835 (= lt!670838 e!868559)))

(declare-fun c!144199 () Bool)

(assert (=> d!162835 (= c!144199 (and (is-Cons!36338 l!1292) (bvslt (_1!12507 (h!37784 l!1292)) newKey!135)))))

(assert (=> d!162835 (isStrictlySorted!982 l!1292)))

(assert (=> d!162835 (= (insertStrictlySorted!573 l!1292 newKey!135 newValue!135) lt!670838)))

(declare-fun bm!71818 () Bool)

(declare-fun call!71822 () List!36342)

(assert (=> bm!71818 (= call!71822 call!71821)))

(declare-fun b!1559025 () Bool)

(declare-fun res!1066199 () Bool)

(assert (=> b!1559025 (=> (not res!1066199) (not e!868556))))

(assert (=> b!1559025 (= res!1066199 (containsKey!845 lt!670838 newKey!135))))

(declare-fun b!1559026 () Bool)

(declare-fun contains!10217 (List!36342 tuple2!24992) Bool)

(assert (=> b!1559026 (= e!868556 (contains!10217 lt!670838 (tuple2!24993 newKey!135 newValue!135)))))

(declare-fun b!1559027 () Bool)

(declare-fun call!71823 () List!36342)

(assert (=> b!1559027 (= e!868560 call!71823)))

(declare-fun bm!71819 () Bool)

(assert (=> bm!71819 (= call!71823 call!71822)))

(declare-fun bm!71820 () Bool)

(declare-fun $colon$colon!985 (List!36342 tuple2!24992) List!36342)

(assert (=> bm!71820 (= call!71821 ($colon$colon!985 e!868558 (ite c!144199 (h!37784 l!1292) (tuple2!24993 newKey!135 newValue!135))))))

(declare-fun c!144200 () Bool)

(assert (=> bm!71820 (= c!144200 c!144199)))

(declare-fun b!1559028 () Bool)

(assert (=> b!1559028 (= e!868560 call!71823)))

(declare-fun b!1559029 () Bool)

(assert (=> b!1559029 (= e!868557 call!71822)))

(declare-fun b!1559030 () Bool)

(assert (=> b!1559030 (= e!868558 (ite c!144197 (t!51072 l!1292) (ite c!144198 (Cons!36338 (h!37784 l!1292) (t!51072 l!1292)) Nil!36339)))))

(assert (= (and d!162835 c!144199) b!1559021))

(assert (= (and d!162835 (not c!144199)) b!1559023))

(assert (= (and b!1559023 c!144197) b!1559029))

(assert (= (and b!1559023 (not c!144197)) b!1559022))

(assert (= (and b!1559022 c!144198) b!1559027))

(assert (= (and b!1559022 (not c!144198)) b!1559028))

(assert (= (or b!1559027 b!1559028) bm!71819))

(assert (= (or b!1559029 bm!71819) bm!71818))

(assert (= (or b!1559021 bm!71818) bm!71820))

(assert (= (and bm!71820 c!144200) b!1559024))

(assert (= (and bm!71820 (not c!144200)) b!1559030))

(assert (= (and d!162835 res!1066198) b!1559025))

(assert (= (and b!1559025 res!1066199) b!1559026))

(declare-fun m!1435407 () Bool)

(assert (=> b!1559026 m!1435407))

(declare-fun m!1435409 () Bool)

(assert (=> bm!71820 m!1435409))

(declare-fun m!1435411 () Bool)

(assert (=> b!1559025 m!1435411))

(declare-fun m!1435413 () Bool)

(assert (=> b!1559024 m!1435413))

(declare-fun m!1435415 () Bool)

(assert (=> d!162835 m!1435415))

(assert (=> d!162835 m!1435347))

(assert (=> b!1558870 d!162835))

(declare-fun b!1559041 () Bool)

(declare-fun e!868567 () Bool)

(declare-fun tp!112691 () Bool)

(assert (=> b!1559041 (= e!868567 (and tp_is_empty!38449 tp!112691))))

(assert (=> b!1558871 (= tp!112677 e!868567)))

(assert (= (and b!1558871 (is-Cons!36338 (t!51072 l!1292))) b!1559041))

(push 1)

(assert (not bm!71820))

(assert (not b!1559041))

(assert (not b!1559024))

(assert (not b!1558913))

(assert tp_is_empty!38449)

(assert (not b!1558925))

(assert (not b!1559025))

(assert (not b!1559026))

(assert (not b!1558927))

(assert (not d!162835))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!162843 () Bool)

(assert (=> d!162843 (= ($colon$colon!985 e!868558 (ite c!144199 (h!37784 l!1292) (tuple2!24993 newKey!135 newValue!135))) (Cons!36338 (ite c!144199 (h!37784 l!1292) (tuple2!24993 newKey!135 newValue!135)) e!868558))))

(assert (=> bm!71820 d!162843))

(declare-fun d!162845 () Bool)

(declare-fun res!1066202 () Bool)

(declare-fun e!868569 () Bool)

(assert (=> d!162845 (=> res!1066202 e!868569)))

(assert (=> d!162845 (= res!1066202 (and (is-Cons!36338 (t!51072 l!1292)) (= (_1!12507 (h!37784 (t!51072 l!1292))) otherKey!62)))))

(assert (=> d!162845 (= (containsKey!845 (t!51072 l!1292) otherKey!62) e!868569)))

(declare-fun b!1559043 () Bool)

(declare-fun e!868570 () Bool)

(assert (=> b!1559043 (= e!868569 e!868570)))

(declare-fun res!1066203 () Bool)

(assert (=> b!1559043 (=> (not res!1066203) (not e!868570))))

(assert (=> b!1559043 (= res!1066203 (and (or (not (is-Cons!36338 (t!51072 l!1292))) (bvsle (_1!12507 (h!37784 (t!51072 l!1292))) otherKey!62)) (is-Cons!36338 (t!51072 l!1292)) (bvslt (_1!12507 (h!37784 (t!51072 l!1292))) otherKey!62)))))

(declare-fun b!1559044 () Bool)

(assert (=> b!1559044 (= e!868570 (containsKey!845 (t!51072 (t!51072 l!1292)) otherKey!62))))

(assert (= (and d!162845 (not res!1066202)) b!1559043))

(assert (= (and b!1559043 res!1066203) b!1559044))

(declare-fun m!1435419 () Bool)

(assert (=> b!1559044 m!1435419))

(assert (=> b!1558913 d!162845))

(declare-fun d!162847 () Bool)

(declare-fun res!1066204 () Bool)

(declare-fun e!868571 () Bool)

(assert (=> d!162847 (=> res!1066204 e!868571)))

(assert (=> d!162847 (= res!1066204 (or (is-Nil!36339 lt!670838) (is-Nil!36339 (t!51072 lt!670838))))))

(assert (=> d!162847 (= (isStrictlySorted!982 lt!670838) e!868571)))

(declare-fun b!1559045 () Bool)

(declare-fun e!868572 () Bool)

(assert (=> b!1559045 (= e!868571 e!868572)))

(declare-fun res!1066205 () Bool)

(assert (=> b!1559045 (=> (not res!1066205) (not e!868572))))

(assert (=> b!1559045 (= res!1066205 (bvslt (_1!12507 (h!37784 lt!670838)) (_1!12507 (h!37784 (t!51072 lt!670838)))))))

(declare-fun b!1559046 () Bool)

(assert (=> b!1559046 (= e!868572 (isStrictlySorted!982 (t!51072 lt!670838)))))

(assert (= (and d!162847 (not res!1066204)) b!1559045))

(assert (= (and b!1559045 res!1066205) b!1559046))

(declare-fun m!1435421 () Bool)

(assert (=> b!1559046 m!1435421))

(assert (=> d!162835 d!162847))

(assert (=> d!162835 d!162829))

(declare-fun d!162849 () Bool)

(declare-fun res!1066206 () Bool)

(declare-fun e!868573 () Bool)

(assert (=> d!162849 (=> res!1066206 e!868573)))

(assert (=> d!162849 (= res!1066206 (or (is-Nil!36339 (t!51072 l!1292)) (is-Nil!36339 (t!51072 (t!51072 l!1292)))))))

(assert (=> d!162849 (= (isStrictlySorted!982 (t!51072 l!1292)) e!868573)))

(declare-fun b!1559047 () Bool)

(declare-fun e!868574 () Bool)

(assert (=> b!1559047 (= e!868573 e!868574)))

(declare-fun res!1066207 () Bool)

(assert (=> b!1559047 (=> (not res!1066207) (not e!868574))))

(assert (=> b!1559047 (= res!1066207 (bvslt (_1!12507 (h!37784 (t!51072 l!1292))) (_1!12507 (h!37784 (t!51072 (t!51072 l!1292))))))))

(declare-fun b!1559048 () Bool)

(assert (=> b!1559048 (= e!868574 (isStrictlySorted!982 (t!51072 (t!51072 l!1292))))))

(assert (= (and d!162849 (not res!1066206)) b!1559047))

(assert (= (and b!1559047 res!1066207) b!1559048))

(declare-fun m!1435423 () Bool)

(assert (=> b!1559048 m!1435423))

(assert (=> b!1558925 d!162849))

(declare-fun b!1559049 () Bool)

(declare-fun e!868578 () List!36342)

(declare-fun call!71824 () List!36342)

(assert (=> b!1559049 (= e!868578 call!71824)))

(declare-fun b!1559050 () Bool)

(declare-fun c!144202 () Bool)

(assert (=> b!1559050 (= c!144202 (and (is-Cons!36338 (t!51072 l!1292)) (bvsgt (_1!12507 (h!37784 (t!51072 l!1292))) newKey!135)))))

(declare-fun e!868576 () List!36342)

(declare-fun e!868579 () List!36342)

(assert (=> b!1559050 (= e!868576 e!868579)))

(declare-fun b!1559051 () Bool)

(assert (=> b!1559051 (= e!868578 e!868576)))

(declare-fun c!144201 () Bool)

(assert (=> b!1559051 (= c!144201 (and (is-Cons!36338 (t!51072 l!1292)) (= (_1!12507 (h!37784 (t!51072 l!1292))) newKey!135)))))

(declare-fun e!868577 () List!36342)

(declare-fun b!1559052 () Bool)

(assert (=> b!1559052 (= e!868577 (insertStrictlySorted!573 (t!51072 (t!51072 l!1292)) newKey!135 newValue!135))))

(declare-fun d!162851 () Bool)

(declare-fun e!868575 () Bool)

(assert (=> d!162851 e!868575))

(declare-fun res!1066208 () Bool)

(assert (=> d!162851 (=> (not res!1066208) (not e!868575))))

(declare-fun lt!670839 () List!36342)

(assert (=> d!162851 (= res!1066208 (isStrictlySorted!982 lt!670839))))

(assert (=> d!162851 (= lt!670839 e!868578)))

(declare-fun c!144203 () Bool)

(assert (=> d!162851 (= c!144203 (and (is-Cons!36338 (t!51072 l!1292)) (bvslt (_1!12507 (h!37784 (t!51072 l!1292))) newKey!135)))))

(assert (=> d!162851 (isStrictlySorted!982 (t!51072 l!1292))))

(assert (=> d!162851 (= (insertStrictlySorted!573 (t!51072 l!1292) newKey!135 newValue!135) lt!670839)))

(declare-fun bm!71821 () Bool)

(declare-fun call!71825 () List!36342)

(assert (=> bm!71821 (= call!71825 call!71824)))

(declare-fun b!1559053 () Bool)

(declare-fun res!1066209 () Bool)

(assert (=> b!1559053 (=> (not res!1066209) (not e!868575))))

(assert (=> b!1559053 (= res!1066209 (containsKey!845 lt!670839 newKey!135))))

(declare-fun b!1559054 () Bool)

(assert (=> b!1559054 (= e!868575 (contains!10217 lt!670839 (tuple2!24993 newKey!135 newValue!135)))))

(declare-fun b!1559055 () Bool)

(declare-fun call!71826 () List!36342)

(assert (=> b!1559055 (= e!868579 call!71826)))

(declare-fun bm!71822 () Bool)

(assert (=> bm!71822 (= call!71826 call!71825)))

(declare-fun bm!71823 () Bool)

(assert (=> bm!71823 (= call!71824 ($colon$colon!985 e!868577 (ite c!144203 (h!37784 (t!51072 l!1292)) (tuple2!24993 newKey!135 newValue!135))))))

(declare-fun c!144204 () Bool)

(assert (=> bm!71823 (= c!144204 c!144203)))

(declare-fun b!1559056 () Bool)

(assert (=> b!1559056 (= e!868579 call!71826)))

(declare-fun b!1559057 () Bool)

(assert (=> b!1559057 (= e!868576 call!71825)))

(declare-fun b!1559058 () Bool)

(assert (=> b!1559058 (= e!868577 (ite c!144201 (t!51072 (t!51072 l!1292)) (ite c!144202 (Cons!36338 (h!37784 (t!51072 l!1292)) (t!51072 (t!51072 l!1292))) Nil!36339)))))

(assert (= (and d!162851 c!144203) b!1559049))

(assert (= (and d!162851 (not c!144203)) b!1559051))

(assert (= (and b!1559051 c!144201) b!1559057))

(assert (= (and b!1559051 (not c!144201)) b!1559050))

(assert (= (and b!1559050 c!144202) b!1559055))

(assert (= (and b!1559050 (not c!144202)) b!1559056))

(assert (= (or b!1559055 b!1559056) bm!71822))

(assert (= (or b!1559057 bm!71822) bm!71821))

(assert (= (or b!1559049 bm!71821) bm!71823))

(assert (= (and bm!71823 c!144204) b!1559052))

(assert (= (and bm!71823 (not c!144204)) b!1559058))

(assert (= (and d!162851 res!1066208) b!1559053))

(assert (= (and b!1559053 res!1066209) b!1559054))

(declare-fun m!1435425 () Bool)

(assert (=> b!1559054 m!1435425))

(declare-fun m!1435427 () Bool)

(assert (=> bm!71823 m!1435427))

(declare-fun m!1435429 () Bool)

(assert (=> b!1559053 m!1435429))

(declare-fun m!1435431 () Bool)

(assert (=> b!1559052 m!1435431))

(declare-fun m!1435433 () Bool)

(assert (=> d!162851 m!1435433))

(assert (=> d!162851 m!1435377))

(assert (=> b!1559024 d!162851))

(declare-fun d!162853 () Bool)

(declare-fun res!1066210 () Bool)

(declare-fun e!868580 () Bool)

(assert (=> d!162853 (=> res!1066210 e!868580)))

(assert (=> d!162853 (= res!1066210 (and (is-Cons!36338 (t!51072 (insertStrictlySorted!573 l!1292 newKey!135 newValue!135))) (= (_1!12507 (h!37784 (t!51072 (insertStrictlySorted!573 l!1292 newKey!135 newValue!135)))) otherKey!62)))))

(assert (=> d!162853 (= (containsKey!845 (t!51072 (insertStrictlySorted!573 l!1292 newKey!135 newValue!135)) otherKey!62) e!868580)))

(declare-fun b!1559059 () Bool)

(declare-fun e!868581 () Bool)

(assert (=> b!1559059 (= e!868580 e!868581)))

(declare-fun res!1066211 () Bool)

(assert (=> b!1559059 (=> (not res!1066211) (not e!868581))))

(assert (=> b!1559059 (= res!1066211 (and (or (not (is-Cons!36338 (t!51072 (insertStrictlySorted!573 l!1292 newKey!135 newValue!135)))) (bvsle (_1!12507 (h!37784 (t!51072 (insertStrictlySorted!573 l!1292 newKey!135 newValue!135)))) otherKey!62)) (is-Cons!36338 (t!51072 (insertStrictlySorted!573 l!1292 newKey!135 newValue!135))) (bvslt (_1!12507 (h!37784 (t!51072 (insertStrictlySorted!573 l!1292 newKey!135 newValue!135)))) otherKey!62)))))

(declare-fun b!1559060 () Bool)

(assert (=> b!1559060 (= e!868581 (containsKey!845 (t!51072 (t!51072 (insertStrictlySorted!573 l!1292 newKey!135 newValue!135))) otherKey!62))))

(assert (= (and d!162853 (not res!1066210)) b!1559059))

(assert (= (and b!1559059 res!1066211) b!1559060))

(declare-fun m!1435435 () Bool)

(assert (=> b!1559060 m!1435435))

(assert (=> b!1558927 d!162853))

(declare-fun lt!670842 () Bool)

(declare-fun d!162855 () Bool)

(declare-fun content!806 (List!36342) (Set tuple2!24992))

(assert (=> d!162855 (= lt!670842 (set.member (tuple2!24993 newKey!135 newValue!135) (content!806 lt!670838)))))

(declare-fun e!868586 () Bool)

(assert (=> d!162855 (= lt!670842 e!868586)))

(declare-fun res!1066216 () Bool)

(assert (=> d!162855 (=> (not res!1066216) (not e!868586))))

(assert (=> d!162855 (= res!1066216 (is-Cons!36338 lt!670838))))

(assert (=> d!162855 (= (contains!10217 lt!670838 (tuple2!24993 newKey!135 newValue!135)) lt!670842)))

(declare-fun b!1559065 () Bool)

(declare-fun e!868587 () Bool)

(assert (=> b!1559065 (= e!868586 e!868587)))

(declare-fun res!1066217 () Bool)

(assert (=> b!1559065 (=> res!1066217 e!868587)))

(assert (=> b!1559065 (= res!1066217 (= (h!37784 lt!670838) (tuple2!24993 newKey!135 newValue!135)))))

(declare-fun b!1559066 () Bool)

(assert (=> b!1559066 (= e!868587 (contains!10217 (t!51072 lt!670838) (tuple2!24993 newKey!135 newValue!135)))))

(assert (= (and d!162855 res!1066216) b!1559065))

(assert (= (and b!1559065 (not res!1066217)) b!1559066))

(declare-fun m!1435437 () Bool)

(assert (=> d!162855 m!1435437))

(declare-fun m!1435439 () Bool)

(assert (=> d!162855 m!1435439))

(declare-fun m!1435441 () Bool)

(assert (=> b!1559066 m!1435441))

(assert (=> b!1559026 d!162855))

(declare-fun d!162857 () Bool)

(declare-fun res!1066218 () Bool)

(declare-fun e!868588 () Bool)

(assert (=> d!162857 (=> res!1066218 e!868588)))

(assert (=> d!162857 (= res!1066218 (and (is-Cons!36338 lt!670838) (= (_1!12507 (h!37784 lt!670838)) newKey!135)))))

(assert (=> d!162857 (= (containsKey!845 lt!670838 newKey!135) e!868588)))

(declare-fun b!1559067 () Bool)

(declare-fun e!868589 () Bool)

(assert (=> b!1559067 (= e!868588 e!868589)))

(declare-fun res!1066219 () Bool)

(assert (=> b!1559067 (=> (not res!1066219) (not e!868589))))

(assert (=> b!1559067 (= res!1066219 (and (or (not (is-Cons!36338 lt!670838)) (bvsle (_1!12507 (h!37784 lt!670838)) newKey!135)) (is-Cons!36338 lt!670838) (bvslt (_1!12507 (h!37784 lt!670838)) newKey!135)))))

(declare-fun b!1559068 () Bool)

(assert (=> b!1559068 (= e!868589 (containsKey!845 (t!51072 lt!670838) newKey!135))))

(assert (= (and d!162857 (not res!1066218)) b!1559067))

(assert (= (and b!1559067 res!1066219) b!1559068))

(declare-fun m!1435443 () Bool)

(assert (=> b!1559068 m!1435443))

(assert (=> b!1559025 d!162857))

(declare-fun b!1559069 () Bool)

(declare-fun e!868590 () Bool)

(declare-fun tp!112693 () Bool)

(assert (=> b!1559069 (= e!868590 (and tp_is_empty!38449 tp!112693))))

(assert (=> b!1559041 (= tp!112691 e!868590)))

(assert (= (and b!1559041 (is-Cons!36338 (t!51072 (t!51072 l!1292)))) b!1559069))

(push 1)

(assert (not b!1559054))

(assert (not b!1559068))

(assert (not b!1559060))

(assert (not b!1559069))

(assert (not b!1559053))

(assert (not b!1559046))

(assert (not b!1559048))

(assert (not d!162855))

(assert (not bm!71823))

(assert (not b!1559066))

(assert (not b!1559052))

(assert (not d!162851))

(assert tp_is_empty!38449)

(assert (not b!1559044))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

