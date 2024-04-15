; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4754 () Bool)

(assert start!4754)

(declare-fun b_free!1327 () Bool)

(declare-fun b_next!1327 () Bool)

(assert (=> start!4754 (= b_free!1327 (not b_next!1327))))

(declare-fun tp!5453 () Bool)

(declare-fun b_and!2179 () Bool)

(assert (=> start!4754 (= tp!5453 b_and!2179)))

(declare-fun b!36692 () Bool)

(declare-fun res!22207 () Bool)

(declare-fun e!23176 () Bool)

(assert (=> b!36692 (=> (not res!22207) (not e!23176))))

(declare-datatypes ((B!734 0))(
  ( (B!735 (val!867 Int)) )
))
(declare-datatypes ((tuple2!1398 0))(
  ( (tuple2!1399 (_1!710 (_ BitVec 64)) (_2!710 B!734)) )
))
(declare-datatypes ((List!964 0))(
  ( (Nil!961) (Cons!960 (h!1528 tuple2!1398) (t!3694 List!964)) )
))
(declare-datatypes ((ListLongMap!963 0))(
  ( (ListLongMap!964 (toList!497 List!964)) )
))
(declare-fun lm!252 () ListLongMap!963)

(declare-fun k0!388 () (_ BitVec 64))

(declare-fun head!839 (List!964) tuple2!1398)

(assert (=> b!36692 (= res!22207 (not (= (_1!710 (head!839 (toList!497 lm!252))) k0!388)))))

(declare-fun b!36693 () Bool)

(declare-fun e!23177 () Bool)

(declare-fun lt!13589 () ListLongMap!963)

(declare-fun contains!449 (ListLongMap!963 (_ BitVec 64)) Bool)

(assert (=> b!36693 (= e!23177 (not (contains!449 lt!13589 k0!388)))))

(declare-fun b!36694 () Bool)

(declare-fun e!23178 () Bool)

(declare-fun tp!5452 () Bool)

(assert (=> b!36694 (= e!23178 tp!5452)))

(declare-fun b!36695 () Bool)

(declare-fun res!22206 () Bool)

(assert (=> b!36695 (=> (not res!22206) (not e!23176))))

(declare-fun isEmpty!191 (ListLongMap!963) Bool)

(assert (=> b!36695 (= res!22206 (not (isEmpty!191 lm!252)))))

(declare-fun b!36696 () Bool)

(declare-fun res!22209 () Bool)

(assert (=> b!36696 (=> (not res!22209) (not e!23176))))

(assert (=> b!36696 (= res!22209 (contains!449 lm!252 k0!388))))

(declare-fun res!22208 () Bool)

(assert (=> start!4754 (=> (not res!22208) (not e!23176))))

(declare-fun p!304 () Int)

(declare-fun forall!167 (List!964 Int) Bool)

(assert (=> start!4754 (= res!22208 (forall!167 (toList!497 lm!252) p!304))))

(assert (=> start!4754 e!23176))

(declare-fun inv!1622 (ListLongMap!963) Bool)

(assert (=> start!4754 (and (inv!1622 lm!252) e!23178)))

(assert (=> start!4754 tp!5453))

(assert (=> start!4754 true))

(declare-fun b!36697 () Bool)

(assert (=> b!36697 (= e!23176 e!23177)))

(declare-fun res!22210 () Bool)

(assert (=> b!36697 (=> res!22210 e!23177)))

(assert (=> b!36697 (= res!22210 (not (forall!167 (toList!497 lt!13589) p!304)))))

(declare-fun tail!92 (ListLongMap!963) ListLongMap!963)

(assert (=> b!36697 (= lt!13589 (tail!92 lm!252))))

(assert (= (and start!4754 res!22208) b!36696))

(assert (= (and b!36696 res!22209) b!36695))

(assert (= (and b!36695 res!22206) b!36692))

(assert (= (and b!36692 res!22207) b!36697))

(assert (= (and b!36697 (not res!22210)) b!36693))

(assert (= start!4754 b!36694))

(declare-fun m!29531 () Bool)

(assert (=> b!36696 m!29531))

(declare-fun m!29533 () Bool)

(assert (=> b!36692 m!29533))

(declare-fun m!29535 () Bool)

(assert (=> start!4754 m!29535))

(declare-fun m!29537 () Bool)

(assert (=> start!4754 m!29537))

(declare-fun m!29539 () Bool)

(assert (=> b!36695 m!29539))

(declare-fun m!29541 () Bool)

(assert (=> b!36693 m!29541))

(declare-fun m!29543 () Bool)

(assert (=> b!36697 m!29543))

(declare-fun m!29545 () Bool)

(assert (=> b!36697 m!29545))

(check-sat (not b!36692) (not b!36695) (not b!36697) b_and!2179 (not b!36694) (not b!36693) (not start!4754) (not b_next!1327) (not b!36696))
(check-sat b_and!2179 (not b_next!1327))
(get-model)

(declare-fun d!5517 () Bool)

(declare-fun e!23205 () Bool)

(assert (=> d!5517 e!23205))

(declare-fun res!22243 () Bool)

(assert (=> d!5517 (=> res!22243 e!23205)))

(declare-fun lt!13620 () Bool)

(assert (=> d!5517 (= res!22243 (not lt!13620))))

(declare-fun lt!13621 () Bool)

(assert (=> d!5517 (= lt!13620 lt!13621)))

(declare-datatypes ((Unit!827 0))(
  ( (Unit!828) )
))
(declare-fun lt!13619 () Unit!827)

(declare-fun e!23203 () Unit!827)

(assert (=> d!5517 (= lt!13619 e!23203)))

(declare-fun c!4197 () Bool)

(assert (=> d!5517 (= c!4197 lt!13621)))

(declare-fun containsKey!44 (List!964 (_ BitVec 64)) Bool)

(assert (=> d!5517 (= lt!13621 (containsKey!44 (toList!497 lm!252) k0!388))))

(assert (=> d!5517 (= (contains!449 lm!252 k0!388) lt!13620)))

(declare-fun b!36748 () Bool)

(declare-fun lt!13618 () Unit!827)

(assert (=> b!36748 (= e!23203 lt!13618)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!41 (List!964 (_ BitVec 64)) Unit!827)

(assert (=> b!36748 (= lt!13618 (lemmaContainsKeyImpliesGetValueByKeyDefined!41 (toList!497 lm!252) k0!388))))

(declare-datatypes ((Option!86 0))(
  ( (Some!85 (v!1954 B!734)) (None!84) )
))
(declare-fun isDefined!42 (Option!86) Bool)

(declare-fun getValueByKey!80 (List!964 (_ BitVec 64)) Option!86)

(assert (=> b!36748 (isDefined!42 (getValueByKey!80 (toList!497 lm!252) k0!388))))

(declare-fun b!36749 () Bool)

(declare-fun Unit!833 () Unit!827)

(assert (=> b!36749 (= e!23203 Unit!833)))

(declare-fun b!36750 () Bool)

(assert (=> b!36750 (= e!23205 (isDefined!42 (getValueByKey!80 (toList!497 lm!252) k0!388)))))

(assert (= (and d!5517 c!4197) b!36748))

(assert (= (and d!5517 (not c!4197)) b!36749))

(assert (= (and d!5517 (not res!22243)) b!36750))

(declare-fun m!29581 () Bool)

(assert (=> d!5517 m!29581))

(declare-fun m!29583 () Bool)

(assert (=> b!36748 m!29583))

(declare-fun m!29585 () Bool)

(assert (=> b!36748 m!29585))

(assert (=> b!36748 m!29585))

(declare-fun m!29587 () Bool)

(assert (=> b!36748 m!29587))

(assert (=> b!36750 m!29585))

(assert (=> b!36750 m!29585))

(assert (=> b!36750 m!29587))

(assert (=> b!36696 d!5517))

(declare-fun d!5527 () Bool)

(assert (=> d!5527 (= (head!839 (toList!497 lm!252)) (h!1528 (toList!497 lm!252)))))

(assert (=> b!36692 d!5527))

(declare-fun d!5529 () Bool)

(declare-fun res!22254 () Bool)

(declare-fun e!23219 () Bool)

(assert (=> d!5529 (=> res!22254 e!23219)))

(get-info :version)

(assert (=> d!5529 (= res!22254 ((_ is Nil!961) (toList!497 lt!13589)))))

(assert (=> d!5529 (= (forall!167 (toList!497 lt!13589) p!304) e!23219)))

(declare-fun b!36765 () Bool)

(declare-fun e!23220 () Bool)

(assert (=> b!36765 (= e!23219 e!23220)))

(declare-fun res!22255 () Bool)

(assert (=> b!36765 (=> (not res!22255) (not e!23220))))

(declare-fun dynLambda!168 (Int tuple2!1398) Bool)

(assert (=> b!36765 (= res!22255 (dynLambda!168 p!304 (h!1528 (toList!497 lt!13589))))))

(declare-fun b!36766 () Bool)

(assert (=> b!36766 (= e!23220 (forall!167 (t!3694 (toList!497 lt!13589)) p!304))))

(assert (= (and d!5529 (not res!22254)) b!36765))

(assert (= (and b!36765 res!22255) b!36766))

(declare-fun b_lambda!1773 () Bool)

(assert (=> (not b_lambda!1773) (not b!36765)))

(declare-fun t!3698 () Bool)

(declare-fun tb!719 () Bool)

(assert (=> (and start!4754 (= p!304 p!304) t!3698) tb!719))

(declare-fun result!1243 () Bool)

(assert (=> tb!719 (= result!1243 true)))

(assert (=> b!36765 t!3698))

(declare-fun b_and!2185 () Bool)

(assert (= b_and!2179 (and (=> t!3698 result!1243) b_and!2185)))

(declare-fun m!29607 () Bool)

(assert (=> b!36765 m!29607))

(declare-fun m!29609 () Bool)

(assert (=> b!36766 m!29609))

(assert (=> b!36697 d!5529))

(declare-fun d!5539 () Bool)

(declare-fun tail!95 (List!964) List!964)

(assert (=> d!5539 (= (tail!92 lm!252) (ListLongMap!964 (tail!95 (toList!497 lm!252))))))

(declare-fun bs!1409 () Bool)

(assert (= bs!1409 d!5539))

(declare-fun m!29615 () Bool)

(assert (=> bs!1409 m!29615))

(assert (=> b!36697 d!5539))

(declare-fun d!5543 () Bool)

(declare-fun e!23232 () Bool)

(assert (=> d!5543 e!23232))

(declare-fun res!22266 () Bool)

(assert (=> d!5543 (=> res!22266 e!23232)))

(declare-fun lt!13634 () Bool)

(assert (=> d!5543 (= res!22266 (not lt!13634))))

(declare-fun lt!13635 () Bool)

(assert (=> d!5543 (= lt!13634 lt!13635)))

(declare-fun lt!13633 () Unit!827)

(declare-fun e!23231 () Unit!827)

(assert (=> d!5543 (= lt!13633 e!23231)))

(declare-fun c!4201 () Bool)

(assert (=> d!5543 (= c!4201 lt!13635)))

(assert (=> d!5543 (= lt!13635 (containsKey!44 (toList!497 lt!13589) k0!388))))

(assert (=> d!5543 (= (contains!449 lt!13589 k0!388) lt!13634)))

(declare-fun b!36777 () Bool)

(declare-fun lt!13632 () Unit!827)

(assert (=> b!36777 (= e!23231 lt!13632)))

(assert (=> b!36777 (= lt!13632 (lemmaContainsKeyImpliesGetValueByKeyDefined!41 (toList!497 lt!13589) k0!388))))

(assert (=> b!36777 (isDefined!42 (getValueByKey!80 (toList!497 lt!13589) k0!388))))

(declare-fun b!36778 () Bool)

(declare-fun Unit!836 () Unit!827)

(assert (=> b!36778 (= e!23231 Unit!836)))

(declare-fun b!36779 () Bool)

(assert (=> b!36779 (= e!23232 (isDefined!42 (getValueByKey!80 (toList!497 lt!13589) k0!388)))))

(assert (= (and d!5543 c!4201) b!36777))

(assert (= (and d!5543 (not c!4201)) b!36778))

(assert (= (and d!5543 (not res!22266)) b!36779))

(declare-fun m!29617 () Bool)

(assert (=> d!5543 m!29617))

(declare-fun m!29619 () Bool)

(assert (=> b!36777 m!29619))

(declare-fun m!29621 () Bool)

(assert (=> b!36777 m!29621))

(assert (=> b!36777 m!29621))

(declare-fun m!29623 () Bool)

(assert (=> b!36777 m!29623))

(assert (=> b!36779 m!29621))

(assert (=> b!36779 m!29621))

(assert (=> b!36779 m!29623))

(assert (=> b!36693 d!5543))

(declare-fun d!5545 () Bool)

(declare-fun isEmpty!196 (List!964) Bool)

(assert (=> d!5545 (= (isEmpty!191 lm!252) (isEmpty!196 (toList!497 lm!252)))))

(declare-fun bs!1411 () Bool)

(assert (= bs!1411 d!5545))

(declare-fun m!29635 () Bool)

(assert (=> bs!1411 m!29635))

(assert (=> b!36695 d!5545))

(declare-fun d!5551 () Bool)

(declare-fun res!22270 () Bool)

(declare-fun e!23237 () Bool)

(assert (=> d!5551 (=> res!22270 e!23237)))

(assert (=> d!5551 (= res!22270 ((_ is Nil!961) (toList!497 lm!252)))))

(assert (=> d!5551 (= (forall!167 (toList!497 lm!252) p!304) e!23237)))

(declare-fun b!36785 () Bool)

(declare-fun e!23238 () Bool)

(assert (=> b!36785 (= e!23237 e!23238)))

(declare-fun res!22271 () Bool)

(assert (=> b!36785 (=> (not res!22271) (not e!23238))))

(assert (=> b!36785 (= res!22271 (dynLambda!168 p!304 (h!1528 (toList!497 lm!252))))))

(declare-fun b!36786 () Bool)

(assert (=> b!36786 (= e!23238 (forall!167 (t!3694 (toList!497 lm!252)) p!304))))

(assert (= (and d!5551 (not res!22270)) b!36785))

(assert (= (and b!36785 res!22271) b!36786))

(declare-fun b_lambda!1779 () Bool)

(assert (=> (not b_lambda!1779) (not b!36785)))

(declare-fun t!3704 () Bool)

(declare-fun tb!725 () Bool)

(assert (=> (and start!4754 (= p!304 p!304) t!3704) tb!725))

(declare-fun result!1249 () Bool)

(assert (=> tb!725 (= result!1249 true)))

(assert (=> b!36785 t!3704))

(declare-fun b_and!2191 () Bool)

(assert (= b_and!2185 (and (=> t!3704 result!1249) b_and!2191)))

(declare-fun m!29643 () Bool)

(assert (=> b!36785 m!29643))

(declare-fun m!29645 () Bool)

(assert (=> b!36786 m!29645))

(assert (=> start!4754 d!5551))

(declare-fun d!5557 () Bool)

(declare-fun isStrictlySorted!173 (List!964) Bool)

(assert (=> d!5557 (= (inv!1622 lm!252) (isStrictlySorted!173 (toList!497 lm!252)))))

(declare-fun bs!1413 () Bool)

(assert (= bs!1413 d!5557))

(declare-fun m!29659 () Bool)

(assert (=> bs!1413 m!29659))

(assert (=> start!4754 d!5557))

(declare-fun b!36802 () Bool)

(declare-fun e!23249 () Bool)

(declare-fun tp_is_empty!1658 () Bool)

(declare-fun tp!5470 () Bool)

(assert (=> b!36802 (= e!23249 (and tp_is_empty!1658 tp!5470))))

(assert (=> b!36694 (= tp!5452 e!23249)))

(assert (= (and b!36694 ((_ is Cons!960) (toList!497 lm!252))) b!36802))

(declare-fun b_lambda!1787 () Bool)

(assert (= b_lambda!1779 (or (and start!4754 b_free!1327) b_lambda!1787)))

(declare-fun b_lambda!1790 () Bool)

(assert (= b_lambda!1773 (or (and start!4754 b_free!1327) b_lambda!1790)))

(check-sat (not b!36802) (not d!5545) (not b!36750) (not b!36779) (not b_next!1327) (not b_lambda!1787) (not b!36748) b_and!2191 (not b!36786) (not d!5557) (not b_lambda!1790) (not d!5517) (not b!36766) (not b!36777) (not d!5543) tp_is_empty!1658 (not d!5539))
(check-sat b_and!2191 (not b_next!1327))
(get-model)

(declare-fun d!5565 () Bool)

(assert (=> d!5565 (= (isEmpty!196 (toList!497 lm!252)) ((_ is Nil!961) (toList!497 lm!252)))))

(assert (=> d!5545 d!5565))

(declare-fun d!5567 () Bool)

(assert (=> d!5567 (isDefined!42 (getValueByKey!80 (toList!497 lt!13589) k0!388))))

(declare-fun lt!13646 () Unit!827)

(declare-fun choose!226 (List!964 (_ BitVec 64)) Unit!827)

(assert (=> d!5567 (= lt!13646 (choose!226 (toList!497 lt!13589) k0!388))))

(declare-fun e!23256 () Bool)

(assert (=> d!5567 e!23256))

(declare-fun res!22279 () Bool)

(assert (=> d!5567 (=> (not res!22279) (not e!23256))))

(assert (=> d!5567 (= res!22279 (isStrictlySorted!173 (toList!497 lt!13589)))))

(assert (=> d!5567 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!41 (toList!497 lt!13589) k0!388) lt!13646)))

(declare-fun b!36811 () Bool)

(assert (=> b!36811 (= e!23256 (containsKey!44 (toList!497 lt!13589) k0!388))))

(assert (= (and d!5567 res!22279) b!36811))

(assert (=> d!5567 m!29621))

(assert (=> d!5567 m!29621))

(assert (=> d!5567 m!29623))

(declare-fun m!29669 () Bool)

(assert (=> d!5567 m!29669))

(declare-fun m!29671 () Bool)

(assert (=> d!5567 m!29671))

(assert (=> b!36811 m!29617))

(assert (=> b!36777 d!5567))

(declare-fun d!5569 () Bool)

(declare-fun isEmpty!197 (Option!86) Bool)

(assert (=> d!5569 (= (isDefined!42 (getValueByKey!80 (toList!497 lt!13589) k0!388)) (not (isEmpty!197 (getValueByKey!80 (toList!497 lt!13589) k0!388))))))

(declare-fun bs!1416 () Bool)

(assert (= bs!1416 d!5569))

(assert (=> bs!1416 m!29621))

(declare-fun m!29673 () Bool)

(assert (=> bs!1416 m!29673))

(assert (=> b!36777 d!5569))

(declare-fun b!36820 () Bool)

(declare-fun e!23261 () Option!86)

(assert (=> b!36820 (= e!23261 (Some!85 (_2!710 (h!1528 (toList!497 lt!13589)))))))

(declare-fun d!5571 () Bool)

(declare-fun c!4208 () Bool)

(assert (=> d!5571 (= c!4208 (and ((_ is Cons!960) (toList!497 lt!13589)) (= (_1!710 (h!1528 (toList!497 lt!13589))) k0!388)))))

(assert (=> d!5571 (= (getValueByKey!80 (toList!497 lt!13589) k0!388) e!23261)))

(declare-fun b!36822 () Bool)

(declare-fun e!23262 () Option!86)

(assert (=> b!36822 (= e!23262 (getValueByKey!80 (t!3694 (toList!497 lt!13589)) k0!388))))

(declare-fun b!36823 () Bool)

(assert (=> b!36823 (= e!23262 None!84)))

(declare-fun b!36821 () Bool)

(assert (=> b!36821 (= e!23261 e!23262)))

(declare-fun c!4209 () Bool)

(assert (=> b!36821 (= c!4209 (and ((_ is Cons!960) (toList!497 lt!13589)) (not (= (_1!710 (h!1528 (toList!497 lt!13589))) k0!388))))))

(assert (= (and d!5571 c!4208) b!36820))

(assert (= (and d!5571 (not c!4208)) b!36821))

(assert (= (and b!36821 c!4209) b!36822))

(assert (= (and b!36821 (not c!4209)) b!36823))

(declare-fun m!29675 () Bool)

(assert (=> b!36822 m!29675))

(assert (=> b!36777 d!5571))

(declare-fun d!5575 () Bool)

(assert (=> d!5575 (= (isDefined!42 (getValueByKey!80 (toList!497 lm!252) k0!388)) (not (isEmpty!197 (getValueByKey!80 (toList!497 lm!252) k0!388))))))

(declare-fun bs!1417 () Bool)

(assert (= bs!1417 d!5575))

(assert (=> bs!1417 m!29585))

(declare-fun m!29677 () Bool)

(assert (=> bs!1417 m!29677))

(assert (=> b!36750 d!5575))

(declare-fun b!36824 () Bool)

(declare-fun e!23263 () Option!86)

(assert (=> b!36824 (= e!23263 (Some!85 (_2!710 (h!1528 (toList!497 lm!252)))))))

(declare-fun d!5577 () Bool)

(declare-fun c!4210 () Bool)

(assert (=> d!5577 (= c!4210 (and ((_ is Cons!960) (toList!497 lm!252)) (= (_1!710 (h!1528 (toList!497 lm!252))) k0!388)))))

(assert (=> d!5577 (= (getValueByKey!80 (toList!497 lm!252) k0!388) e!23263)))

(declare-fun b!36826 () Bool)

(declare-fun e!23264 () Option!86)

(assert (=> b!36826 (= e!23264 (getValueByKey!80 (t!3694 (toList!497 lm!252)) k0!388))))

(declare-fun b!36827 () Bool)

(assert (=> b!36827 (= e!23264 None!84)))

(declare-fun b!36825 () Bool)

(assert (=> b!36825 (= e!23263 e!23264)))

(declare-fun c!4211 () Bool)

(assert (=> b!36825 (= c!4211 (and ((_ is Cons!960) (toList!497 lm!252)) (not (= (_1!710 (h!1528 (toList!497 lm!252))) k0!388))))))

(assert (= (and d!5577 c!4210) b!36824))

(assert (= (and d!5577 (not c!4210)) b!36825))

(assert (= (and b!36825 c!4211) b!36826))

(assert (= (and b!36825 (not c!4211)) b!36827))

(declare-fun m!29679 () Bool)

(assert (=> b!36826 m!29679))

(assert (=> b!36750 d!5577))

(declare-fun d!5579 () Bool)

(declare-fun res!22287 () Bool)

(declare-fun e!23272 () Bool)

(assert (=> d!5579 (=> res!22287 e!23272)))

(assert (=> d!5579 (= res!22287 (and ((_ is Cons!960) (toList!497 lm!252)) (= (_1!710 (h!1528 (toList!497 lm!252))) k0!388)))))

(assert (=> d!5579 (= (containsKey!44 (toList!497 lm!252) k0!388) e!23272)))

(declare-fun b!36835 () Bool)

(declare-fun e!23273 () Bool)

(assert (=> b!36835 (= e!23272 e!23273)))

(declare-fun res!22288 () Bool)

(assert (=> b!36835 (=> (not res!22288) (not e!23273))))

(assert (=> b!36835 (= res!22288 (and (or (not ((_ is Cons!960) (toList!497 lm!252))) (bvsle (_1!710 (h!1528 (toList!497 lm!252))) k0!388)) ((_ is Cons!960) (toList!497 lm!252)) (bvslt (_1!710 (h!1528 (toList!497 lm!252))) k0!388)))))

(declare-fun b!36836 () Bool)

(assert (=> b!36836 (= e!23273 (containsKey!44 (t!3694 (toList!497 lm!252)) k0!388))))

(assert (= (and d!5579 (not res!22287)) b!36835))

(assert (= (and b!36835 res!22288) b!36836))

(declare-fun m!29685 () Bool)

(assert (=> b!36836 m!29685))

(assert (=> d!5517 d!5579))

(declare-fun d!5585 () Bool)

(declare-fun res!22289 () Bool)

(declare-fun e!23274 () Bool)

(assert (=> d!5585 (=> res!22289 e!23274)))

(assert (=> d!5585 (= res!22289 ((_ is Nil!961) (t!3694 (toList!497 lm!252))))))

(assert (=> d!5585 (= (forall!167 (t!3694 (toList!497 lm!252)) p!304) e!23274)))

(declare-fun b!36837 () Bool)

(declare-fun e!23275 () Bool)

(assert (=> b!36837 (= e!23274 e!23275)))

(declare-fun res!22290 () Bool)

(assert (=> b!36837 (=> (not res!22290) (not e!23275))))

(assert (=> b!36837 (= res!22290 (dynLambda!168 p!304 (h!1528 (t!3694 (toList!497 lm!252)))))))

(declare-fun b!36838 () Bool)

(assert (=> b!36838 (= e!23275 (forall!167 (t!3694 (t!3694 (toList!497 lm!252))) p!304))))

(assert (= (and d!5585 (not res!22289)) b!36837))

(assert (= (and b!36837 res!22290) b!36838))

(declare-fun b_lambda!1797 () Bool)

(assert (=> (not b_lambda!1797) (not b!36837)))

(declare-fun t!3710 () Bool)

(declare-fun tb!731 () Bool)

(assert (=> (and start!4754 (= p!304 p!304) t!3710) tb!731))

(declare-fun result!1261 () Bool)

(assert (=> tb!731 (= result!1261 true)))

(assert (=> b!36837 t!3710))

(declare-fun b_and!2197 () Bool)

(assert (= b_and!2191 (and (=> t!3710 result!1261) b_and!2197)))

(declare-fun m!29687 () Bool)

(assert (=> b!36837 m!29687))

(declare-fun m!29689 () Bool)

(assert (=> b!36838 m!29689))

(assert (=> b!36786 d!5585))

(declare-fun d!5587 () Bool)

(assert (=> d!5587 (isDefined!42 (getValueByKey!80 (toList!497 lm!252) k0!388))))

(declare-fun lt!13650 () Unit!827)

(assert (=> d!5587 (= lt!13650 (choose!226 (toList!497 lm!252) k0!388))))

(declare-fun e!23280 () Bool)

(assert (=> d!5587 e!23280))

(declare-fun res!22291 () Bool)

(assert (=> d!5587 (=> (not res!22291) (not e!23280))))

(assert (=> d!5587 (= res!22291 (isStrictlySorted!173 (toList!497 lm!252)))))

(assert (=> d!5587 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!41 (toList!497 lm!252) k0!388) lt!13650)))

(declare-fun b!36847 () Bool)

(assert (=> b!36847 (= e!23280 (containsKey!44 (toList!497 lm!252) k0!388))))

(assert (= (and d!5587 res!22291) b!36847))

(assert (=> d!5587 m!29585))

(assert (=> d!5587 m!29585))

(assert (=> d!5587 m!29587))

(declare-fun m!29691 () Bool)

(assert (=> d!5587 m!29691))

(assert (=> d!5587 m!29659))

(assert (=> b!36847 m!29581))

(assert (=> b!36748 d!5587))

(assert (=> b!36748 d!5575))

(assert (=> b!36748 d!5577))

(declare-fun d!5589 () Bool)

(declare-fun res!22292 () Bool)

(declare-fun e!23281 () Bool)

(assert (=> d!5589 (=> res!22292 e!23281)))

(assert (=> d!5589 (= res!22292 ((_ is Nil!961) (t!3694 (toList!497 lt!13589))))))

(assert (=> d!5589 (= (forall!167 (t!3694 (toList!497 lt!13589)) p!304) e!23281)))

(declare-fun b!36848 () Bool)

(declare-fun e!23282 () Bool)

(assert (=> b!36848 (= e!23281 e!23282)))

(declare-fun res!22293 () Bool)

(assert (=> b!36848 (=> (not res!22293) (not e!23282))))

(assert (=> b!36848 (= res!22293 (dynLambda!168 p!304 (h!1528 (t!3694 (toList!497 lt!13589)))))))

(declare-fun b!36849 () Bool)

(assert (=> b!36849 (= e!23282 (forall!167 (t!3694 (t!3694 (toList!497 lt!13589))) p!304))))

(assert (= (and d!5589 (not res!22292)) b!36848))

(assert (= (and b!36848 res!22293) b!36849))

(declare-fun b_lambda!1799 () Bool)

(assert (=> (not b_lambda!1799) (not b!36848)))

(declare-fun t!3712 () Bool)

(declare-fun tb!733 () Bool)

(assert (=> (and start!4754 (= p!304 p!304) t!3712) tb!733))

(declare-fun result!1263 () Bool)

(assert (=> tb!733 (= result!1263 true)))

(assert (=> b!36848 t!3712))

(declare-fun b_and!2199 () Bool)

(assert (= b_and!2197 (and (=> t!3712 result!1263) b_and!2199)))

(declare-fun m!29693 () Bool)

(assert (=> b!36848 m!29693))

(declare-fun m!29695 () Bool)

(assert (=> b!36849 m!29695))

(assert (=> b!36766 d!5589))

(declare-fun d!5591 () Bool)

(declare-fun res!22294 () Bool)

(declare-fun e!23283 () Bool)

(assert (=> d!5591 (=> res!22294 e!23283)))

(assert (=> d!5591 (= res!22294 (and ((_ is Cons!960) (toList!497 lt!13589)) (= (_1!710 (h!1528 (toList!497 lt!13589))) k0!388)))))

(assert (=> d!5591 (= (containsKey!44 (toList!497 lt!13589) k0!388) e!23283)))

(declare-fun b!36850 () Bool)

(declare-fun e!23284 () Bool)

(assert (=> b!36850 (= e!23283 e!23284)))

(declare-fun res!22295 () Bool)

(assert (=> b!36850 (=> (not res!22295) (not e!23284))))

(assert (=> b!36850 (= res!22295 (and (or (not ((_ is Cons!960) (toList!497 lt!13589))) (bvsle (_1!710 (h!1528 (toList!497 lt!13589))) k0!388)) ((_ is Cons!960) (toList!497 lt!13589)) (bvslt (_1!710 (h!1528 (toList!497 lt!13589))) k0!388)))))

(declare-fun b!36851 () Bool)

(assert (=> b!36851 (= e!23284 (containsKey!44 (t!3694 (toList!497 lt!13589)) k0!388))))

(assert (= (and d!5591 (not res!22294)) b!36850))

(assert (= (and b!36850 res!22295) b!36851))

(declare-fun m!29697 () Bool)

(assert (=> b!36851 m!29697))

(assert (=> d!5543 d!5591))

(assert (=> b!36779 d!5569))

(assert (=> b!36779 d!5571))

(declare-fun d!5593 () Bool)

(declare-fun res!22308 () Bool)

(declare-fun e!23299 () Bool)

(assert (=> d!5593 (=> res!22308 e!23299)))

(assert (=> d!5593 (= res!22308 (or ((_ is Nil!961) (toList!497 lm!252)) ((_ is Nil!961) (t!3694 (toList!497 lm!252)))))))

(assert (=> d!5593 (= (isStrictlySorted!173 (toList!497 lm!252)) e!23299)))

(declare-fun b!36868 () Bool)

(declare-fun e!23300 () Bool)

(assert (=> b!36868 (= e!23299 e!23300)))

(declare-fun res!22309 () Bool)

(assert (=> b!36868 (=> (not res!22309) (not e!23300))))

(assert (=> b!36868 (= res!22309 (bvslt (_1!710 (h!1528 (toList!497 lm!252))) (_1!710 (h!1528 (t!3694 (toList!497 lm!252))))))))

(declare-fun b!36869 () Bool)

(assert (=> b!36869 (= e!23300 (isStrictlySorted!173 (t!3694 (toList!497 lm!252))))))

(assert (= (and d!5593 (not res!22308)) b!36868))

(assert (= (and b!36868 res!22309) b!36869))

(declare-fun m!29709 () Bool)

(assert (=> b!36869 m!29709))

(assert (=> d!5557 d!5593))

(declare-fun d!5605 () Bool)

(assert (=> d!5605 (= (tail!95 (toList!497 lm!252)) (t!3694 (toList!497 lm!252)))))

(assert (=> d!5539 d!5605))

(declare-fun b!36873 () Bool)

(declare-fun e!23304 () Bool)

(declare-fun tp!5475 () Bool)

(assert (=> b!36873 (= e!23304 (and tp_is_empty!1658 tp!5475))))

(assert (=> b!36802 (= tp!5470 e!23304)))

(assert (= (and b!36802 ((_ is Cons!960) (t!3694 (toList!497 lm!252)))) b!36873))

(declare-fun b_lambda!1805 () Bool)

(assert (= b_lambda!1799 (or (and start!4754 b_free!1327) b_lambda!1805)))

(declare-fun b_lambda!1807 () Bool)

(assert (= b_lambda!1797 (or (and start!4754 b_free!1327) b_lambda!1807)))

(check-sat (not b_lambda!1790) (not d!5567) (not b!36849) (not b!36822) (not b!36836) (not d!5587) (not b!36873) (not d!5575) (not b!36851) (not b!36869) (not d!5569) (not b_lambda!1787) (not b_lambda!1805) (not b!36847) (not b_lambda!1807) (not b!36826) tp_is_empty!1658 (not b!36838) (not b_next!1327) b_and!2199 (not b!36811))
(check-sat b_and!2199 (not b_next!1327))
