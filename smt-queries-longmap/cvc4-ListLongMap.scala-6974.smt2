; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88304 () Bool)

(assert start!88304)

(declare-fun b!1017093 () Bool)

(assert (=> b!1017093 true))

(assert (=> b!1017093 true))

(declare-fun bs!29553 () Bool)

(declare-fun b!1017096 () Bool)

(assert (= bs!29553 (and b!1017096 b!1017093)))

(declare-fun lambda!1085 () Int)

(declare-datatypes ((B!1554 0))(
  ( (B!1555 (val!11861 Int)) )
))
(declare-datatypes ((tuple2!15268 0))(
  ( (tuple2!15269 (_1!7645 (_ BitVec 64)) (_2!7645 B!1554)) )
))
(declare-datatypes ((List!21545 0))(
  ( (Nil!21542) (Cons!21541 (h!22739 tuple2!15268) (t!30546 List!21545)) )
))
(declare-fun lt!449420 () List!21545)

(declare-fun l!1114 () List!21545)

(declare-fun lambda!1084 () Int)

(assert (=> bs!29553 (= (= lt!449420 l!1114) (= lambda!1085 lambda!1084))))

(assert (=> b!1017096 true))

(assert (=> b!1017096 true))

(declare-fun res!682185 () Bool)

(declare-fun e!572203 () Bool)

(assert (=> start!88304 (=> (not res!682185) (not e!572203))))

(declare-fun isStrictlySorted!629 (List!21545) Bool)

(assert (=> start!88304 (= res!682185 (isStrictlySorted!629 l!1114))))

(assert (=> start!88304 e!572203))

(declare-fun e!572204 () Bool)

(assert (=> start!88304 e!572204))

(assert (=> start!88304 true))

(declare-fun tp_is_empty!23621 () Bool)

(assert (=> start!88304 tp_is_empty!23621))

(declare-fun b!1017091 () Bool)

(declare-fun tp!70834 () Bool)

(assert (=> b!1017091 (= e!572204 (and tp_is_empty!23621 tp!70834))))

(declare-fun b!1017092 () Bool)

(declare-fun e!572205 () Bool)

(assert (=> b!1017092 (= e!572203 (not e!572205))))

(declare-fun res!682188 () Bool)

(assert (=> b!1017092 (=> res!682188 e!572205)))

(declare-datatypes ((List!21546 0))(
  ( (Nil!21543) (Cons!21542 (h!22740 (_ BitVec 64)) (t!30547 List!21546)) )
))
(declare-fun keys!40 () List!21546)

(declare-fun forall!291 (List!21546 Int) Bool)

(assert (=> b!1017092 (= res!682188 (not (forall!291 (t!30547 keys!40) lambda!1084)))))

(declare-datatypes ((Option!614 0))(
  ( (Some!613 (v!14464 B!1554)) (None!612) )
))
(declare-fun isDefined!412 (Option!614) Bool)

(declare-fun getValueByKey!563 (List!21545 (_ BitVec 64)) Option!614)

(assert (=> b!1017092 (isDefined!412 (getValueByKey!563 lt!449420 (h!22740 keys!40)))))

(declare-datatypes ((Unit!33267 0))(
  ( (Unit!33268) )
))
(declare-fun lt!449418 () Unit!33267)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!391 (List!21545 (_ BitVec 64)) Unit!33267)

(assert (=> b!1017092 (= lt!449418 (lemmaContainsKeyImpliesGetValueByKeyDefined!391 lt!449420 (h!22740 keys!40)))))

(declare-fun newHead!31 () tuple2!15268)

(assert (=> b!1017092 (= lt!449420 (Cons!21541 newHead!31 l!1114))))

(declare-fun containsKey!501 (List!21545 (_ BitVec 64)) Bool)

(assert (=> b!1017092 (containsKey!501 l!1114 (h!22740 keys!40))))

(declare-fun lt!449419 () Unit!33267)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!21 (List!21545 (_ BitVec 64)) Unit!33267)

(assert (=> b!1017092 (= lt!449419 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!21 l!1114 (h!22740 keys!40)))))

(declare-fun res!682189 () Bool)

(assert (=> b!1017093 (=> (not res!682189) (not e!572203))))

(assert (=> b!1017093 (= res!682189 (forall!291 keys!40 lambda!1084))))

(declare-fun b!1017094 () Bool)

(declare-fun res!682187 () Bool)

(assert (=> b!1017094 (=> (not res!682187) (not e!572203))))

(declare-fun head!978 (List!21545) tuple2!15268)

(assert (=> b!1017094 (= res!682187 (bvslt (_1!7645 newHead!31) (_1!7645 (head!978 l!1114))))))

(declare-fun b!1017095 () Bool)

(declare-fun res!682190 () Bool)

(assert (=> b!1017095 (=> (not res!682190) (not e!572203))))

(assert (=> b!1017095 (= res!682190 (is-Cons!21542 keys!40))))

(assert (=> b!1017096 (= e!572205 (forall!291 keys!40 lambda!1085))))

(assert (=> b!1017096 (forall!291 (t!30547 keys!40) lambda!1085)))

(declare-fun value!178 () B!1554)

(declare-fun lt!449421 () Unit!33267)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!52 (List!21545 List!21546 B!1554 tuple2!15268) Unit!33267)

(assert (=> b!1017096 (= lt!449421 (lemmaForallGetValueByKeySameWithASmallerHead!52 l!1114 (t!30547 keys!40) value!178 newHead!31))))

(declare-fun b!1017097 () Bool)

(declare-fun res!682186 () Bool)

(assert (=> b!1017097 (=> (not res!682186) (not e!572203))))

(declare-fun isEmpty!900 (List!21545) Bool)

(assert (=> b!1017097 (= res!682186 (not (isEmpty!900 l!1114)))))

(assert (= (and start!88304 res!682185) b!1017097))

(assert (= (and b!1017097 res!682186) b!1017093))

(assert (= (and b!1017093 res!682189) b!1017094))

(assert (= (and b!1017094 res!682187) b!1017095))

(assert (= (and b!1017095 res!682190) b!1017092))

(assert (= (and b!1017092 (not res!682188)) b!1017096))

(assert (= (and start!88304 (is-Cons!21541 l!1114)) b!1017091))

(declare-fun m!938561 () Bool)

(assert (=> b!1017093 m!938561))

(declare-fun m!938563 () Bool)

(assert (=> b!1017092 m!938563))

(declare-fun m!938565 () Bool)

(assert (=> b!1017092 m!938565))

(declare-fun m!938567 () Bool)

(assert (=> b!1017092 m!938567))

(declare-fun m!938569 () Bool)

(assert (=> b!1017092 m!938569))

(declare-fun m!938571 () Bool)

(assert (=> b!1017092 m!938571))

(assert (=> b!1017092 m!938565))

(declare-fun m!938573 () Bool)

(assert (=> b!1017092 m!938573))

(declare-fun m!938575 () Bool)

(assert (=> b!1017096 m!938575))

(declare-fun m!938577 () Bool)

(assert (=> b!1017096 m!938577))

(declare-fun m!938579 () Bool)

(assert (=> b!1017096 m!938579))

(declare-fun m!938581 () Bool)

(assert (=> b!1017097 m!938581))

(declare-fun m!938583 () Bool)

(assert (=> b!1017094 m!938583))

(declare-fun m!938585 () Bool)

(assert (=> start!88304 m!938585))

(push 1)

(assert (not b!1017091))

(assert tp_is_empty!23621)

(assert (not b!1017092))

(assert (not b!1017093))

(assert (not b!1017097))

(assert (not start!88304))

(assert (not b!1017094))

(assert (not b!1017096))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121483 () Bool)

(assert (=> d!121483 (= (isEmpty!900 l!1114) (is-Nil!21542 l!1114))))

(assert (=> b!1017097 d!121483))

(declare-fun d!121485 () Bool)

(declare-fun res!682226 () Bool)

(declare-fun e!572235 () Bool)

(assert (=> d!121485 (=> res!682226 e!572235)))

(assert (=> d!121485 (= res!682226 (is-Nil!21543 keys!40))))

(assert (=> d!121485 (= (forall!291 keys!40 lambda!1085) e!572235)))

(declare-fun b!1017139 () Bool)

(declare-fun e!572236 () Bool)

(assert (=> b!1017139 (= e!572235 e!572236)))

(declare-fun res!682227 () Bool)

(assert (=> b!1017139 (=> (not res!682227) (not e!572236))))

(declare-fun dynLambda!1926 (Int (_ BitVec 64)) Bool)

(assert (=> b!1017139 (= res!682227 (dynLambda!1926 lambda!1085 (h!22740 keys!40)))))

(declare-fun b!1017140 () Bool)

(assert (=> b!1017140 (= e!572236 (forall!291 (t!30547 keys!40) lambda!1085))))

(assert (= (and d!121485 (not res!682226)) b!1017139))

(assert (= (and b!1017139 res!682227) b!1017140))

(declare-fun b_lambda!15587 () Bool)

(assert (=> (not b_lambda!15587) (not b!1017139)))

(declare-fun m!938607 () Bool)

(assert (=> b!1017139 m!938607))

(assert (=> b!1017140 m!938577))

(assert (=> b!1017096 d!121485))

(declare-fun d!121493 () Bool)

(declare-fun res!682228 () Bool)

(declare-fun e!572237 () Bool)

(assert (=> d!121493 (=> res!682228 e!572237)))

(assert (=> d!121493 (= res!682228 (is-Nil!21543 (t!30547 keys!40)))))

(assert (=> d!121493 (= (forall!291 (t!30547 keys!40) lambda!1085) e!572237)))

(declare-fun b!1017141 () Bool)

(declare-fun e!572238 () Bool)

(assert (=> b!1017141 (= e!572237 e!572238)))

(declare-fun res!682229 () Bool)

(assert (=> b!1017141 (=> (not res!682229) (not e!572238))))

(assert (=> b!1017141 (= res!682229 (dynLambda!1926 lambda!1085 (h!22740 (t!30547 keys!40))))))

(declare-fun b!1017142 () Bool)

(assert (=> b!1017142 (= e!572238 (forall!291 (t!30547 (t!30547 keys!40)) lambda!1085))))

(assert (= (and d!121493 (not res!682228)) b!1017141))

(assert (= (and b!1017141 res!682229) b!1017142))

(declare-fun b_lambda!15589 () Bool)

(assert (=> (not b_lambda!15589) (not b!1017141)))

(declare-fun m!938609 () Bool)

(assert (=> b!1017141 m!938609))

(declare-fun m!938611 () Bool)

(assert (=> b!1017142 m!938611))

(assert (=> b!1017096 d!121493))

(declare-fun bs!29565 () Bool)

(declare-fun b!1017170 () Bool)

(assert (= bs!29565 (and b!1017170 b!1017093)))

(declare-fun lambda!1102 () Int)

(assert (=> bs!29565 (= lambda!1102 lambda!1084)))

(declare-fun bs!29566 () Bool)

(assert (= bs!29566 (and b!1017170 b!1017096)))

(assert (=> bs!29566 (= (= l!1114 lt!449420) (= lambda!1102 lambda!1085))))

(assert (=> b!1017170 true))

(assert (=> b!1017170 true))

(declare-fun bs!29567 () Bool)

(declare-fun d!121497 () Bool)

(assert (= bs!29567 (and d!121497 b!1017093)))

(declare-fun lambda!1103 () Int)

(assert (=> bs!29567 (= (= (Cons!21541 newHead!31 l!1114) l!1114) (= lambda!1103 lambda!1084))))

(declare-fun bs!29568 () Bool)

(assert (= bs!29568 (and d!121497 b!1017096)))

(assert (=> bs!29568 (= (= (Cons!21541 newHead!31 l!1114) lt!449420) (= lambda!1103 lambda!1085))))

(declare-fun bs!29569 () Bool)

(assert (= bs!29569 (and d!121497 b!1017170)))

(assert (=> bs!29569 (= (= (Cons!21541 newHead!31 l!1114) l!1114) (= lambda!1103 lambda!1102))))

(assert (=> d!121497 true))

(assert (=> d!121497 true))

(assert (=> d!121497 true))

(assert (=> d!121497 (forall!291 (t!30547 keys!40) lambda!1103)))

(declare-fun lt!449433 () Unit!33267)

(declare-fun choose!1667 (List!21545 List!21546 B!1554 tuple2!15268) Unit!33267)

(assert (=> d!121497 (= lt!449433 (choose!1667 l!1114 (t!30547 keys!40) value!178 newHead!31))))

(declare-fun e!572253 () Bool)

(assert (=> d!121497 e!572253))

(declare-fun res!682256 () Bool)

(assert (=> d!121497 (=> (not res!682256) (not e!572253))))

(assert (=> d!121497 (= res!682256 (isStrictlySorted!629 l!1114))))

(assert (=> d!121497 (= (lemmaForallGetValueByKeySameWithASmallerHead!52 l!1114 (t!30547 keys!40) value!178 newHead!31) lt!449433)))

(declare-fun b!1017169 () Bool)

(declare-fun res!682255 () Bool)

(assert (=> b!1017169 (=> (not res!682255) (not e!572253))))

(assert (=> b!1017169 (= res!682255 (not (isEmpty!900 l!1114)))))

(declare-fun res!682254 () Bool)

(assert (=> b!1017170 (=> (not res!682254) (not e!572253))))

(assert (=> b!1017170 (= res!682254 (forall!291 (t!30547 keys!40) lambda!1102))))

(declare-fun b!1017171 () Bool)

(assert (=> b!1017171 (= e!572253 (bvslt (_1!7645 newHead!31) (_1!7645 (head!978 l!1114))))))

(assert (= (and d!121497 res!682256) b!1017169))

(assert (= (and b!1017169 res!682255) b!1017170))

(assert (= (and b!1017170 res!682254) b!1017171))

(declare-fun m!938629 () Bool)

(assert (=> d!121497 m!938629))

(declare-fun m!938631 () Bool)

(assert (=> d!121497 m!938631))

(assert (=> d!121497 m!938585))

(assert (=> b!1017169 m!938581))

(declare-fun m!938633 () Bool)

(assert (=> b!1017170 m!938633))

(assert (=> b!1017171 m!938583))

(assert (=> b!1017096 d!121497))

(declare-fun d!121507 () Bool)

(declare-fun res!682269 () Bool)

(declare-fun e!572272 () Bool)

(assert (=> d!121507 (=> res!682269 e!572272)))

(assert (=> d!121507 (= res!682269 (or (is-Nil!21542 l!1114) (is-Nil!21542 (t!30546 l!1114))))))

(assert (=> d!121507 (= (isStrictlySorted!629 l!1114) e!572272)))

(declare-fun b!1017198 () Bool)

(declare-fun e!572273 () Bool)

(assert (=> b!1017198 (= e!572272 e!572273)))

(declare-fun res!682270 () Bool)

(assert (=> b!1017198 (=> (not res!682270) (not e!572273))))

(assert (=> b!1017198 (= res!682270 (bvslt (_1!7645 (h!22739 l!1114)) (_1!7645 (h!22739 (t!30546 l!1114)))))))

(declare-fun b!1017199 () Bool)

(assert (=> b!1017199 (= e!572273 (isStrictlySorted!629 (t!30546 l!1114)))))

(assert (= (and d!121507 (not res!682269)) b!1017198))

(assert (= (and b!1017198 res!682270) b!1017199))

(declare-fun m!938641 () Bool)

(assert (=> b!1017199 m!938641))

(assert (=> start!88304 d!121507))

(declare-fun d!121515 () Bool)

(assert (=> d!121515 (= (head!978 l!1114) (h!22739 l!1114))))

(assert (=> b!1017094 d!121515))

(declare-fun d!121521 () Bool)

(declare-fun res!682276 () Bool)

(declare-fun e!572279 () Bool)

(assert (=> d!121521 (=> res!682276 e!572279)))

(assert (=> d!121521 (= res!682276 (is-Nil!21543 keys!40))))

(assert (=> d!121521 (= (forall!291 keys!40 lambda!1084) e!572279)))

(declare-fun b!1017205 () Bool)

(declare-fun e!572280 () Bool)

(assert (=> b!1017205 (= e!572279 e!572280)))

(declare-fun res!682277 () Bool)

(assert (=> b!1017205 (=> (not res!682277) (not e!572280))))

(assert (=> b!1017205 (= res!682277 (dynLambda!1926 lambda!1084 (h!22740 keys!40)))))

(declare-fun b!1017206 () Bool)

(assert (=> b!1017206 (= e!572280 (forall!291 (t!30547 keys!40) lambda!1084))))

(assert (= (and d!121521 (not res!682276)) b!1017205))

(assert (= (and b!1017205 res!682277) b!1017206))

(declare-fun b_lambda!15595 () Bool)

(assert (=> (not b_lambda!15595) (not b!1017205)))

(declare-fun m!938657 () Bool)

(assert (=> b!1017205 m!938657))

(assert (=> b!1017206 m!938571))

(assert (=> b!1017093 d!121521))

(declare-fun d!121525 () Bool)

(declare-fun res!682290 () Bool)

(declare-fun e!572299 () Bool)

(assert (=> d!121525 (=> res!682290 e!572299)))

(assert (=> d!121525 (= res!682290 (and (is-Cons!21541 l!1114) (= (_1!7645 (h!22739 l!1114)) (h!22740 keys!40))))))

(assert (=> d!121525 (= (containsKey!501 l!1114 (h!22740 keys!40)) e!572299)))

(declare-fun b!1017231 () Bool)

(declare-fun e!572300 () Bool)

(assert (=> b!1017231 (= e!572299 e!572300)))

(declare-fun res!682291 () Bool)

(assert (=> b!1017231 (=> (not res!682291) (not e!572300))))

(assert (=> b!1017231 (= res!682291 (and (or (not (is-Cons!21541 l!1114)) (bvsle (_1!7645 (h!22739 l!1114)) (h!22740 keys!40))) (is-Cons!21541 l!1114) (bvslt (_1!7645 (h!22739 l!1114)) (h!22740 keys!40))))))

(declare-fun b!1017232 () Bool)

(assert (=> b!1017232 (= e!572300 (containsKey!501 (t!30546 l!1114) (h!22740 keys!40)))))

(assert (= (and d!121525 (not res!682290)) b!1017231))

(assert (= (and b!1017231 res!682291) b!1017232))

(declare-fun m!938665 () Bool)

(assert (=> b!1017232 m!938665))

(assert (=> b!1017092 d!121525))

(declare-fun d!121531 () Bool)

(declare-fun c!103005 () Bool)

(assert (=> d!121531 (= c!103005 (and (is-Cons!21541 lt!449420) (= (_1!7645 (h!22739 lt!449420)) (h!22740 keys!40))))))

(declare-fun e!572311 () Option!614)

(assert (=> d!121531 (= (getValueByKey!563 lt!449420 (h!22740 keys!40)) e!572311)))

(declare-fun b!1017250 () Bool)

(declare-fun e!572312 () Option!614)

(assert (=> b!1017250 (= e!572311 e!572312)))

(declare-fun c!103006 () Bool)

(assert (=> b!1017250 (= c!103006 (and (is-Cons!21541 lt!449420) (not (= (_1!7645 (h!22739 lt!449420)) (h!22740 keys!40)))))))

(declare-fun b!1017251 () Bool)

(assert (=> b!1017251 (= e!572312 (getValueByKey!563 (t!30546 lt!449420) (h!22740 keys!40)))))

(declare-fun b!1017249 () Bool)

(assert (=> b!1017249 (= e!572311 (Some!613 (_2!7645 (h!22739 lt!449420))))))

(declare-fun b!1017252 () Bool)

(assert (=> b!1017252 (= e!572312 None!612)))

(assert (= (and d!121531 c!103005) b!1017249))

(assert (= (and d!121531 (not c!103005)) b!1017250))

(assert (= (and b!1017250 c!103006) b!1017251))

(assert (= (and b!1017250 (not c!103006)) b!1017252))

(declare-fun m!938677 () Bool)

(assert (=> b!1017251 m!938677))

(assert (=> b!1017092 d!121531))

(declare-fun d!121543 () Bool)

(declare-fun res!682295 () Bool)

(declare-fun e!572313 () Bool)

(assert (=> d!121543 (=> res!682295 e!572313)))

(assert (=> d!121543 (= res!682295 (is-Nil!21543 (t!30547 keys!40)))))

(assert (=> d!121543 (= (forall!291 (t!30547 keys!40) lambda!1084) e!572313)))

(declare-fun b!1017253 () Bool)

(declare-fun e!572314 () Bool)

(assert (=> b!1017253 (= e!572313 e!572314)))

(declare-fun res!682296 () Bool)

(assert (=> b!1017253 (=> (not res!682296) (not e!572314))))

(assert (=> b!1017253 (= res!682296 (dynLambda!1926 lambda!1084 (h!22740 (t!30547 keys!40))))))

(declare-fun b!1017254 () Bool)

(assert (=> b!1017254 (= e!572314 (forall!291 (t!30547 (t!30547 keys!40)) lambda!1084))))

(assert (= (and d!121543 (not res!682295)) b!1017253))

(assert (= (and b!1017253 res!682296) b!1017254))

(declare-fun b_lambda!15607 () Bool)

(assert (=> (not b_lambda!15607) (not b!1017253)))

(declare-fun m!938679 () Bool)

(assert (=> b!1017253 m!938679))

(declare-fun m!938681 () Bool)

(assert (=> b!1017254 m!938681))

(assert (=> b!1017092 d!121543))

(declare-fun d!121545 () Bool)

(assert (=> d!121545 (isDefined!412 (getValueByKey!563 lt!449420 (h!22740 keys!40)))))

(declare-fun lt!449445 () Unit!33267)

(declare-fun choose!1670 (List!21545 (_ BitVec 64)) Unit!33267)

(assert (=> d!121545 (= lt!449445 (choose!1670 lt!449420 (h!22740 keys!40)))))

(declare-fun e!572325 () Bool)

(assert (=> d!121545 e!572325))

(declare-fun res!682304 () Bool)

(assert (=> d!121545 (=> (not res!682304) (not e!572325))))

(assert (=> d!121545 (= res!682304 (isStrictlySorted!629 lt!449420))))

(assert (=> d!121545 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!391 lt!449420 (h!22740 keys!40)) lt!449445)))

(declare-fun b!1017267 () Bool)

(assert (=> b!1017267 (= e!572325 (containsKey!501 lt!449420 (h!22740 keys!40)))))

(assert (= (and d!121545 res!682304) b!1017267))

(assert (=> d!121545 m!938565))

(assert (=> d!121545 m!938565))

(assert (=> d!121545 m!938567))

(declare-fun m!938691 () Bool)

(assert (=> d!121545 m!938691))

(declare-fun m!938693 () Bool)

(assert (=> d!121545 m!938693))

(declare-fun m!938697 () Bool)

(assert (=> b!1017267 m!938697))

(assert (=> b!1017092 d!121545))

(declare-fun d!121551 () Bool)

(declare-fun isEmpty!903 (Option!614) Bool)

(assert (=> d!121551 (= (isDefined!412 (getValueByKey!563 lt!449420 (h!22740 keys!40))) (not (isEmpty!903 (getValueByKey!563 lt!449420 (h!22740 keys!40)))))))

(declare-fun bs!29579 () Bool)

(assert (= bs!29579 d!121551))

(assert (=> bs!29579 m!938565))

(declare-fun m!938701 () Bool)

(assert (=> bs!29579 m!938701))

(assert (=> b!1017092 d!121551))

(declare-fun d!121559 () Bool)

(assert (=> d!121559 (containsKey!501 l!1114 (h!22740 keys!40))))

(declare-fun lt!449448 () Unit!33267)

(declare-fun choose!1671 (List!21545 (_ BitVec 64)) Unit!33267)

(assert (=> d!121559 (= lt!449448 (choose!1671 l!1114 (h!22740 keys!40)))))

(declare-fun e!572328 () Bool)

(assert (=> d!121559 e!572328))

(declare-fun res!682307 () Bool)

(assert (=> d!121559 (=> (not res!682307) (not e!572328))))

(assert (=> d!121559 (= res!682307 (isStrictlySorted!629 l!1114))))

(assert (=> d!121559 (= (lemmaGetValueByKeyIsDefinedImpliesContainsKey!21 l!1114 (h!22740 keys!40)) lt!449448)))

(declare-fun b!1017270 () Bool)

(assert (=> b!1017270 (= e!572328 (isDefined!412 (getValueByKey!563 l!1114 (h!22740 keys!40))))))

(assert (= (and d!121559 res!682307) b!1017270))

(assert (=> d!121559 m!938563))

(declare-fun m!938703 () Bool)

(assert (=> d!121559 m!938703))

(assert (=> d!121559 m!938585))

(declare-fun m!938705 () Bool)

(assert (=> b!1017270 m!938705))

(assert (=> b!1017270 m!938705))

(declare-fun m!938707 () Bool)

(assert (=> b!1017270 m!938707))

(assert (=> b!1017092 d!121559))

(declare-fun b!1017275 () Bool)

(declare-fun e!572331 () Bool)

(declare-fun tp!70843 () Bool)

(assert (=> b!1017275 (= e!572331 (and tp_is_empty!23621 tp!70843))))

(assert (=> b!1017091 (= tp!70834 e!572331)))

(assert (= (and b!1017091 (is-Cons!21541 (t!30546 l!1114))) b!1017275))

(declare-fun b_lambda!15619 () Bool)

(assert (= b_lambda!15607 (or b!1017093 b_lambda!15619)))

(declare-fun bs!29580 () Bool)

(declare-fun d!121561 () Bool)

(assert (= bs!29580 (and d!121561 b!1017093)))

(assert (=> bs!29580 (= (dynLambda!1926 lambda!1084 (h!22740 (t!30547 keys!40))) (= (getValueByKey!563 l!1114 (h!22740 (t!30547 keys!40))) (Some!613 value!178)))))

(declare-fun m!938709 () Bool)

(assert (=> bs!29580 m!938709))

(assert (=> b!1017253 d!121561))

(declare-fun b_lambda!15621 () Bool)

(assert (= b_lambda!15595 (or b!1017093 b_lambda!15621)))

(declare-fun bs!29581 () Bool)

(declare-fun d!121563 () Bool)

(assert (= bs!29581 (and d!121563 b!1017093)))

(assert (=> bs!29581 (= (dynLambda!1926 lambda!1084 (h!22740 keys!40)) (= (getValueByKey!563 l!1114 (h!22740 keys!40)) (Some!613 value!178)))))

(assert (=> bs!29581 m!938705))

(assert (=> b!1017205 d!121563))

(declare-fun b_lambda!15623 () Bool)

(assert (= b_lambda!15587 (or b!1017096 b_lambda!15623)))

(declare-fun bs!29582 () Bool)

(declare-fun d!121565 () Bool)

(assert (= bs!29582 (and d!121565 b!1017096)))

(assert (=> bs!29582 (= (dynLambda!1926 lambda!1085 (h!22740 keys!40)) (= (getValueByKey!563 lt!449420 (h!22740 keys!40)) (Some!613 value!178)))))

(assert (=> bs!29582 m!938565))

(assert (=> b!1017139 d!121565))

(declare-fun b_lambda!15625 () Bool)

(assert (= b_lambda!15589 (or b!1017096 b_lambda!15625)))

(declare-fun bs!29583 () Bool)

(declare-fun d!121567 () Bool)

(assert (= bs!29583 (and d!121567 b!1017096)))

(assert (=> bs!29583 (= (dynLambda!1926 lambda!1085 (h!22740 (t!30547 keys!40))) (= (getValueByKey!563 lt!449420 (h!22740 (t!30547 keys!40))) (Some!613 value!178)))))

(declare-fun m!938711 () Bool)

(assert (=> bs!29583 m!938711))

(assert (=> b!1017141 d!121567))

(push 1)

