; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4768 () Bool)

(assert start!4768)

(declare-fun b_free!1331 () Bool)

(declare-fun b_next!1331 () Bool)

(assert (=> start!4768 (= b_free!1331 (not b_next!1331))))

(declare-fun tp!5464 () Bool)

(declare-fun b_and!2189 () Bool)

(assert (=> start!4768 (= tp!5464 b_and!2189)))

(declare-fun res!22270 () Bool)

(declare-fun e!23237 () Bool)

(assert (=> start!4768 (=> (not res!22270) (not e!23237))))

(declare-datatypes ((B!738 0))(
  ( (B!739 (val!869 Int)) )
))
(declare-datatypes ((tuple2!1398 0))(
  ( (tuple2!1399 (_1!710 (_ BitVec 64)) (_2!710 B!738)) )
))
(declare-datatypes ((List!973 0))(
  ( (Nil!970) (Cons!969 (h!1537 tuple2!1398) (t!3710 List!973)) )
))
(declare-datatypes ((ListLongMap!975 0))(
  ( (ListLongMap!976 (toList!503 List!973)) )
))
(declare-fun lm!252 () ListLongMap!975)

(declare-fun p!304 () Int)

(declare-fun forall!169 (List!973 Int) Bool)

(assert (=> start!4768 (= res!22270 (forall!169 (toList!503 lm!252) p!304))))

(assert (=> start!4768 e!23237))

(declare-fun e!23238 () Bool)

(declare-fun inv!1624 (ListLongMap!975) Bool)

(assert (=> start!4768 (and (inv!1624 lm!252) e!23238)))

(assert (=> start!4768 tp!5464))

(assert (=> start!4768 true))

(declare-fun b!36782 () Bool)

(declare-fun res!22271 () Bool)

(assert (=> b!36782 (=> (not res!22271) (not e!23237))))

(declare-fun k!388 () (_ BitVec 64))

(declare-fun contains!454 (ListLongMap!975 (_ BitVec 64)) Bool)

(assert (=> b!36782 (= res!22271 (contains!454 lm!252 k!388))))

(declare-fun b!36783 () Bool)

(declare-fun e!23239 () Bool)

(assert (=> b!36783 (= e!23237 e!23239)))

(declare-fun res!22268 () Bool)

(assert (=> b!36783 (=> res!22268 e!23239)))

(declare-fun lt!13599 () ListLongMap!975)

(assert (=> b!36783 (= res!22268 (not (forall!169 (toList!503 lt!13599) p!304)))))

(declare-fun tail!94 (ListLongMap!975) ListLongMap!975)

(assert (=> b!36783 (= lt!13599 (tail!94 lm!252))))

(declare-fun b!36784 () Bool)

(assert (=> b!36784 (= e!23239 (not (contains!454 lt!13599 k!388)))))

(declare-fun b!36785 () Bool)

(declare-fun res!22272 () Bool)

(assert (=> b!36785 (=> (not res!22272) (not e!23237))))

(declare-fun isEmpty!192 (ListLongMap!975) Bool)

(assert (=> b!36785 (= res!22272 (not (isEmpty!192 lm!252)))))

(declare-fun b!36786 () Bool)

(declare-fun tp!5465 () Bool)

(assert (=> b!36786 (= e!23238 tp!5465)))

(declare-fun b!36787 () Bool)

(declare-fun res!22269 () Bool)

(assert (=> b!36787 (=> (not res!22269) (not e!23237))))

(declare-fun head!841 (List!973) tuple2!1398)

(assert (=> b!36787 (= res!22269 (not (= (_1!710 (head!841 (toList!503 lm!252))) k!388)))))

(assert (= (and start!4768 res!22270) b!36782))

(assert (= (and b!36782 res!22271) b!36785))

(assert (= (and b!36785 res!22272) b!36787))

(assert (= (and b!36787 res!22269) b!36783))

(assert (= (and b!36783 (not res!22268)) b!36784))

(assert (= start!4768 b!36786))

(declare-fun m!29633 () Bool)

(assert (=> b!36782 m!29633))

(declare-fun m!29635 () Bool)

(assert (=> b!36787 m!29635))

(declare-fun m!29637 () Bool)

(assert (=> b!36784 m!29637))

(declare-fun m!29639 () Bool)

(assert (=> b!36783 m!29639))

(declare-fun m!29641 () Bool)

(assert (=> b!36783 m!29641))

(declare-fun m!29643 () Bool)

(assert (=> b!36785 m!29643))

(declare-fun m!29645 () Bool)

(assert (=> start!4768 m!29645))

(declare-fun m!29647 () Bool)

(assert (=> start!4768 m!29647))

(push 1)

(assert (not b!36784))

(assert (not b!36787))

(assert b_and!2189)

(assert (not start!4768))

(assert (not b_next!1331))

(assert (not b!36782))

(assert (not b!36783))

(assert (not b!36786))

(assert (not b!36785))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2189)

(assert (not b_next!1331))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5555 () Bool)

(declare-fun isEmpty!193 (List!973) Bool)

(assert (=> d!5555 (= (isEmpty!192 lm!252) (isEmpty!193 (toList!503 lm!252)))))

(declare-fun bs!1409 () Bool)

(assert (= bs!1409 d!5555))

(declare-fun m!29649 () Bool)

(assert (=> bs!1409 m!29649))

(assert (=> b!36785 d!5555))

(declare-fun d!5557 () Bool)

(assert (=> d!5557 (= (head!841 (toList!503 lm!252)) (h!1537 (toList!503 lm!252)))))

(assert (=> b!36787 d!5557))

(declare-fun d!5561 () Bool)

(declare-fun e!23252 () Bool)

(assert (=> d!5561 e!23252))

(declare-fun res!22281 () Bool)

(assert (=> d!5561 (=> res!22281 e!23252)))

(declare-fun lt!13617 () Bool)

(assert (=> d!5561 (= res!22281 (not lt!13617))))

(declare-fun lt!13616 () Bool)

(assert (=> d!5561 (= lt!13617 lt!13616)))

(declare-datatypes ((Unit!824 0))(
  ( (Unit!825) )
))
(declare-fun lt!13618 () Unit!824)

(declare-fun e!23253 () Unit!824)

(assert (=> d!5561 (= lt!13618 e!23253)))

(declare-fun c!4207 () Bool)

(assert (=> d!5561 (= c!4207 lt!13616)))

(declare-fun containsKey!45 (List!973 (_ BitVec 64)) Bool)

(assert (=> d!5561 (= lt!13616 (containsKey!45 (toList!503 lm!252) k!388))))

(assert (=> d!5561 (= (contains!454 lm!252 k!388) lt!13617)))

(declare-fun b!36804 () Bool)

(declare-fun lt!13619 () Unit!824)

(assert (=> b!36804 (= e!23253 lt!13619)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!42 (List!973 (_ BitVec 64)) Unit!824)

(assert (=> b!36804 (= lt!13619 (lemmaContainsKeyImpliesGetValueByKeyDefined!42 (toList!503 lm!252) k!388))))

(declare-datatypes ((Option!87 0))(
  ( (Some!86 (v!1955 B!738)) (None!85) )
))
(declare-fun isDefined!43 (Option!87) Bool)

(declare-fun getValueByKey!81 (List!973 (_ BitVec 64)) Option!87)

(assert (=> b!36804 (isDefined!43 (getValueByKey!81 (toList!503 lm!252) k!388))))

(declare-fun b!36805 () Bool)

(declare-fun Unit!828 () Unit!824)

(assert (=> b!36805 (= e!23253 Unit!828)))

(declare-fun b!36806 () Bool)

(assert (=> b!36806 (= e!23252 (isDefined!43 (getValueByKey!81 (toList!503 lm!252) k!388)))))

(assert (= (and d!5561 c!4207) b!36804))

(assert (= (and d!5561 (not c!4207)) b!36805))

(assert (= (and d!5561 (not res!22281)) b!36806))

(declare-fun m!29661 () Bool)

(assert (=> d!5561 m!29661))

(declare-fun m!29663 () Bool)

(assert (=> b!36804 m!29663))

(declare-fun m!29665 () Bool)

(assert (=> b!36804 m!29665))

(assert (=> b!36804 m!29665))

(declare-fun m!29667 () Bool)

(assert (=> b!36804 m!29667))

(assert (=> b!36806 m!29665))

(assert (=> b!36806 m!29665))

(assert (=> b!36806 m!29667))

(assert (=> b!36782 d!5561))

(declare-fun d!5575 () Bool)

(declare-fun res!22289 () Bool)

(declare-fun e!23262 () Bool)

(assert (=> d!5575 (=> res!22289 e!23262)))

(assert (=> d!5575 (= res!22289 (is-Nil!970 (toList!503 lt!13599)))))

(assert (=> d!5575 (= (forall!169 (toList!503 lt!13599) p!304) e!23262)))

(declare-fun b!36816 () Bool)

(declare-fun e!23263 () Bool)

(assert (=> b!36816 (= e!23262 e!23263)))

(declare-fun res!22290 () Bool)

(assert (=> b!36816 (=> (not res!22290) (not e!23263))))

(declare-fun dynLambda!171 (Int tuple2!1398) Bool)

(assert (=> b!36816 (= res!22290 (dynLambda!171 p!304 (h!1537 (toList!503 lt!13599))))))

(declare-fun b!36817 () Bool)

(assert (=> b!36817 (= e!23263 (forall!169 (t!3710 (toList!503 lt!13599)) p!304))))

(assert (= (and d!5575 (not res!22289)) b!36816))

(assert (= (and b!36816 res!22290) b!36817))

(declare-fun b_lambda!1787 () Bool)

(assert (=> (not b_lambda!1787) (not b!36816)))

(declare-fun t!3714 () Bool)

(declare-fun tb!727 () Bool)

(assert (=> (and start!4768 (= p!304 p!304) t!3714) tb!727))

(declare-fun result!1251 () Bool)

(assert (=> tb!727 (= result!1251 true)))

(assert (=> b!36816 t!3714))

(declare-fun b_and!2193 () Bool)

(assert (= b_and!2189 (and (=> t!3714 result!1251) b_and!2193)))

(declare-fun m!29677 () Bool)

(assert (=> b!36816 m!29677))

(declare-fun m!29679 () Bool)

(assert (=> b!36817 m!29679))

(assert (=> b!36783 d!5575))

(declare-fun d!5579 () Bool)

(declare-fun tail!97 (List!973) List!973)

(assert (=> d!5579 (= (tail!94 lm!252) (ListLongMap!976 (tail!97 (toList!503 lm!252))))))

(declare-fun bs!1413 () Bool)

(assert (= bs!1413 d!5579))

(declare-fun m!29681 () Bool)

(assert (=> bs!1413 m!29681))

(assert (=> b!36783 d!5579))

(declare-fun d!5581 () Bool)

(declare-fun e!23274 () Bool)

(assert (=> d!5581 e!23274))

(declare-fun res!22299 () Bool)

(assert (=> d!5581 (=> res!22299 e!23274)))

(declare-fun lt!13633 () Bool)

(assert (=> d!5581 (= res!22299 (not lt!13633))))

(declare-fun lt!13632 () Bool)

(assert (=> d!5581 (= lt!13633 lt!13632)))

(declare-fun lt!13634 () Unit!824)

(declare-fun e!23275 () Unit!824)

(assert (=> d!5581 (= lt!13634 e!23275)))

(declare-fun c!4211 () Bool)

(assert (=> d!5581 (= c!4211 lt!13632)))

(assert (=> d!5581 (= lt!13632 (containsKey!45 (toList!503 lt!13599) k!388))))

(assert (=> d!5581 (= (contains!454 lt!13599 k!388) lt!13633)))

(declare-fun b!36830 () Bool)

(declare-fun lt!13635 () Unit!824)

(assert (=> b!36830 (= e!23275 lt!13635)))

(assert (=> b!36830 (= lt!13635 (lemmaContainsKeyImpliesGetValueByKeyDefined!42 (toList!503 lt!13599) k!388))))

(assert (=> b!36830 (isDefined!43 (getValueByKey!81 (toList!503 lt!13599) k!388))))

(declare-fun b!36831 () Bool)

(declare-fun Unit!834 () Unit!824)

(assert (=> b!36831 (= e!23275 Unit!834)))

(declare-fun b!36832 () Bool)

(assert (=> b!36832 (= e!23274 (isDefined!43 (getValueByKey!81 (toList!503 lt!13599) k!388)))))

(assert (= (and d!5581 c!4211) b!36830))

(assert (= (and d!5581 (not c!4211)) b!36831))

(assert (= (and d!5581 (not res!22299)) b!36832))

(declare-fun m!29683 () Bool)

(assert (=> d!5581 m!29683))

(declare-fun m!29687 () Bool)

(assert (=> b!36830 m!29687))

(declare-fun m!29691 () Bool)

(assert (=> b!36830 m!29691))

(assert (=> b!36830 m!29691))

(declare-fun m!29693 () Bool)

(assert (=> b!36830 m!29693))

(assert (=> b!36832 m!29691))

(assert (=> b!36832 m!29691))

(assert (=> b!36832 m!29693))

(assert (=> b!36784 d!5581))

(declare-fun d!5585 () Bool)

(declare-fun res!22301 () Bool)

(declare-fun e!23278 () Bool)

(assert (=> d!5585 (=> res!22301 e!23278)))

(assert (=> d!5585 (= res!22301 (is-Nil!970 (toList!503 lm!252)))))

(assert (=> d!5585 (= (forall!169 (toList!503 lm!252) p!304) e!23278)))

(declare-fun b!36836 () Bool)

(declare-fun e!23279 () Bool)

(assert (=> b!36836 (= e!23278 e!23279)))

(declare-fun res!22302 () Bool)

(assert (=> b!36836 (=> (not res!22302) (not e!23279))))

(assert (=> b!36836 (= res!22302 (dynLambda!171 p!304 (h!1537 (toList!503 lm!252))))))

(declare-fun b!36837 () Bool)

(assert (=> b!36837 (= e!23279 (forall!169 (t!3710 (toList!503 lm!252)) p!304))))

(assert (= (and d!5585 (not res!22301)) b!36836))

(assert (= (and b!36836 res!22302) b!36837))

(declare-fun b_lambda!1791 () Bool)

(assert (=> (not b_lambda!1791) (not b!36836)))

(declare-fun t!3718 () Bool)

(declare-fun tb!731 () Bool)

(assert (=> (and start!4768 (= p!304 p!304) t!3718) tb!731))

(declare-fun result!1255 () Bool)

(assert (=> tb!731 (= result!1255 true)))

(assert (=> b!36836 t!3718))

(declare-fun b_and!2197 () Bool)

(assert (= b_and!2193 (and (=> t!3718 result!1255) b_and!2197)))

(declare-fun m!29703 () Bool)

(assert (=> b!36836 m!29703))

(declare-fun m!29705 () Bool)

(assert (=> b!36837 m!29705))

(assert (=> start!4768 d!5585))

(declare-fun d!5589 () Bool)

(declare-fun isStrictlySorted!181 (List!973) Bool)

(assert (=> d!5589 (= (inv!1624 lm!252) (isStrictlySorted!181 (toList!503 lm!252)))))

(declare-fun bs!1415 () Bool)

(assert (= bs!1415 d!5589))

(declare-fun m!29717 () Bool)

(assert (=> bs!1415 m!29717))

(assert (=> start!4768 d!5589))

(declare-fun b!36849 () Bool)

(declare-fun e!23288 () Bool)

(declare-fun tp_is_empty!1657 () Bool)

(declare-fun tp!5468 () Bool)

(assert (=> b!36849 (= e!23288 (and tp_is_empty!1657 tp!5468))))

(assert (=> b!36786 (= tp!5465 e!23288)))

(assert (= (and b!36786 (is-Cons!969 (toList!503 lm!252))) b!36849))

(declare-fun b_lambda!1797 () Bool)

(assert (= b_lambda!1787 (or (and start!4768 b_free!1331) b_lambda!1797)))

(declare-fun b_lambda!1799 () Bool)

(assert (= b_lambda!1791 (or (and start!4768 b_free!1331) b_lambda!1799)))

(push 1)

(assert (not d!5555))

(assert b_and!2197)

(assert (not b!36830))

(assert (not b!36837))

(assert (not d!5579))

(assert (not b!36804))

(assert (not d!5561))

(assert (not b!36849))

(assert (not b!36832))

(assert (not b_lambda!1797))

(assert (not b_lambda!1799))

(assert (not d!5589))

(assert (not d!5581))

(assert tp_is_empty!1657)

(assert (not b!36817))

(assert (not b_next!1331))

(assert (not b!36806))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2197)

(assert (not b_next!1331))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5623 () Bool)

(assert (=> d!5623 (= (tail!97 (toList!503 lm!252)) (t!3710 (toList!503 lm!252)))))

(assert (=> d!5579 d!5623))

(declare-fun d!5625 () Bool)

(declare-fun res!22329 () Bool)

(declare-fun e!23323 () Bool)

(assert (=> d!5625 (=> res!22329 e!23323)))

(assert (=> d!5625 (= res!22329 (is-Nil!970 (t!3710 (toList!503 lt!13599))))))

(assert (=> d!5625 (= (forall!169 (t!3710 (toList!503 lt!13599)) p!304) e!23323)))

(declare-fun b!36895 () Bool)

(declare-fun e!23324 () Bool)

(assert (=> b!36895 (= e!23323 e!23324)))

(declare-fun res!22330 () Bool)

(assert (=> b!36895 (=> (not res!22330) (not e!23324))))

(assert (=> b!36895 (= res!22330 (dynLambda!171 p!304 (h!1537 (t!3710 (toList!503 lt!13599)))))))

(declare-fun b!36896 () Bool)

(assert (=> b!36896 (= e!23324 (forall!169 (t!3710 (t!3710 (toList!503 lt!13599))) p!304))))

(assert (= (and d!5625 (not res!22329)) b!36895))

(assert (= (and b!36895 res!22330) b!36896))

(declare-fun b_lambda!1813 () Bool)

(assert (=> (not b_lambda!1813) (not b!36895)))

(declare-fun t!3728 () Bool)

(declare-fun tb!741 () Bool)

(assert (=> (and start!4768 (= p!304 p!304) t!3728) tb!741))

(declare-fun result!1271 () Bool)

(assert (=> tb!741 (= result!1271 true)))

(assert (=> b!36895 t!3728))

(declare-fun b_and!2207 () Bool)

(assert (= b_and!2197 (and (=> t!3728 result!1271) b_and!2207)))

(declare-fun m!29755 () Bool)

(assert (=> b!36895 m!29755))

(declare-fun m!29757 () Bool)

(assert (=> b!36896 m!29757))

(assert (=> b!36817 d!5625))

(declare-fun d!5627 () Bool)

(declare-fun isEmpty!197 (Option!87) Bool)

(assert (=> d!5627 (= (isDefined!43 (getValueByKey!81 (toList!503 lm!252) k!388)) (not (isEmpty!197 (getValueByKey!81 (toList!503 lm!252) k!388))))))

(declare-fun bs!1420 () Bool)

(assert (= bs!1420 d!5627))

(assert (=> bs!1420 m!29665))

(declare-fun m!29765 () Bool)

(assert (=> bs!1420 m!29765))

(assert (=> b!36806 d!5627))

(declare-fun b!36922 () Bool)

(declare-fun e!23339 () Option!87)

(assert (=> b!36922 (= e!23339 (getValueByKey!81 (t!3710 (toList!503 lm!252)) k!388))))

(declare-fun b!36921 () Bool)

(declare-fun e!23338 () Option!87)

(assert (=> b!36921 (= e!23338 e!23339)))

(declare-fun c!4232 () Bool)

(assert (=> b!36921 (= c!4232 (and (is-Cons!969 (toList!503 lm!252)) (not (= (_1!710 (h!1537 (toList!503 lm!252))) k!388))))))

(declare-fun b!36920 () Bool)

(assert (=> b!36920 (= e!23338 (Some!86 (_2!710 (h!1537 (toList!503 lm!252)))))))

(declare-fun d!5635 () Bool)

(declare-fun c!4231 () Bool)

(assert (=> d!5635 (= c!4231 (and (is-Cons!969 (toList!503 lm!252)) (= (_1!710 (h!1537 (toList!503 lm!252))) k!388)))))

(assert (=> d!5635 (= (getValueByKey!81 (toList!503 lm!252) k!388) e!23338)))

(declare-fun b!36923 () Bool)

(assert (=> b!36923 (= e!23339 None!85)))

(assert (= (and d!5635 c!4231) b!36920))

(assert (= (and d!5635 (not c!4231)) b!36921))

(assert (= (and b!36921 c!4232) b!36922))

(assert (= (and b!36921 (not c!4232)) b!36923))

(declare-fun m!29775 () Bool)

(assert (=> b!36922 m!29775))

(assert (=> b!36806 d!5635))

(declare-fun d!5647 () Bool)

(declare-fun res!22348 () Bool)

(declare-fun e!23356 () Bool)

(assert (=> d!5647 (=> res!22348 e!23356)))

(assert (=> d!5647 (= res!22348 (or (is-Nil!970 (toList!503 lm!252)) (is-Nil!970 (t!3710 (toList!503 lm!252)))))))

(assert (=> d!5647 (= (isStrictlySorted!181 (toList!503 lm!252)) e!23356)))

(declare-fun b!36942 () Bool)

(declare-fun e!23357 () Bool)

(assert (=> b!36942 (= e!23356 e!23357)))

(declare-fun res!22349 () Bool)

(assert (=> b!36942 (=> (not res!22349) (not e!23357))))

(assert (=> b!36942 (= res!22349 (bvslt (_1!710 (h!1537 (toList!503 lm!252))) (_1!710 (h!1537 (t!3710 (toList!503 lm!252))))))))

(declare-fun b!36943 () Bool)

(assert (=> b!36943 (= e!23357 (isStrictlySorted!181 (t!3710 (toList!503 lm!252))))))

(assert (= (and d!5647 (not res!22348)) b!36942))

(assert (= (and b!36942 res!22349) b!36943))

(declare-fun m!29787 () Bool)

(assert (=> b!36943 m!29787))

(assert (=> d!5589 d!5647))

(declare-fun d!5655 () Bool)

(declare-fun res!22356 () Bool)

(declare-fun e!23365 () Bool)

(assert (=> d!5655 (=> res!22356 e!23365)))

(assert (=> d!5655 (= res!22356 (and (is-Cons!969 (toList!503 lm!252)) (= (_1!710 (h!1537 (toList!503 lm!252))) k!388)))))

(assert (=> d!5655 (= (containsKey!45 (toList!503 lm!252) k!388) e!23365)))

(declare-fun b!36951 () Bool)

(declare-fun e!23366 () Bool)

(assert (=> b!36951 (= e!23365 e!23366)))

(declare-fun res!22357 () Bool)

(assert (=> b!36951 (=> (not res!22357) (not e!23366))))

(assert (=> b!36951 (= res!22357 (and (or (not (is-Cons!969 (toList!503 lm!252))) (bvsle (_1!710 (h!1537 (toList!503 lm!252))) k!388)) (is-Cons!969 (toList!503 lm!252)) (bvslt (_1!710 (h!1537 (toList!503 lm!252))) k!388)))))

(declare-fun b!36952 () Bool)

(assert (=> b!36952 (= e!23366 (containsKey!45 (t!3710 (toList!503 lm!252)) k!388))))

(assert (= (and d!5655 (not res!22356)) b!36951))

(assert (= (and b!36951 res!22357) b!36952))

(declare-fun m!29793 () Bool)

(assert (=> b!36952 m!29793))

(assert (=> d!5561 d!5655))

(declare-fun d!5659 () Bool)

(assert (=> d!5659 (= (isEmpty!193 (toList!503 lm!252)) (is-Nil!970 (toList!503 lm!252)))))

(assert (=> d!5555 d!5659))

(declare-fun d!5661 () Bool)

(assert (=> d!5661 (isDefined!43 (getValueByKey!81 (toList!503 lt!13599) k!388))))

(declare-fun lt!13658 () Unit!824)

(declare-fun choose!228 (List!973 (_ BitVec 64)) Unit!824)

(assert (=> d!5661 (= lt!13658 (choose!228 (toList!503 lt!13599) k!388))))

(declare-fun e!23376 () Bool)

(assert (=> d!5661 e!23376))

(declare-fun res!22367 () Bool)

(assert (=> d!5661 (=> (not res!22367) (not e!23376))))

(assert (=> d!5661 (= res!22367 (isStrictlySorted!181 (toList!503 lt!13599)))))

(assert (=> d!5661 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!42 (toList!503 lt!13599) k!388) lt!13658)))

(declare-fun b!36962 () Bool)

(assert (=> b!36962 (= e!23376 (containsKey!45 (toList!503 lt!13599) k!388))))

(assert (= (and d!5661 res!22367) b!36962))

(assert (=> d!5661 m!29691))

(assert (=> d!5661 m!29691))

(assert (=> d!5661 m!29693))

(declare-fun m!29803 () Bool)

(assert (=> d!5661 m!29803))

(declare-fun m!29805 () Bool)

(assert (=> d!5661 m!29805))

(assert (=> b!36962 m!29683))

(assert (=> b!36830 d!5661))

(declare-fun d!5669 () Bool)

(assert (=> d!5669 (= (isDefined!43 (getValueByKey!81 (toList!503 lt!13599) k!388)) (not (isEmpty!197 (getValueByKey!81 (toList!503 lt!13599) k!388))))))

(declare-fun bs!1423 () Bool)

(assert (= bs!1423 d!5669))

(assert (=> bs!1423 m!29691))

(declare-fun m!29807 () Bool)

(assert (=> bs!1423 m!29807))

(assert (=> b!36830 d!5669))

(declare-fun b!36969 () Bool)

(declare-fun e!23380 () Option!87)

(assert (=> b!36969 (= e!23380 (getValueByKey!81 (t!3710 (toList!503 lt!13599)) k!388))))

(declare-fun b!36968 () Bool)

(declare-fun e!23379 () Option!87)

(assert (=> b!36968 (= e!23379 e!23380)))

(declare-fun c!4238 () Bool)

(assert (=> b!36968 (= c!4238 (and (is-Cons!969 (toList!503 lt!13599)) (not (= (_1!710 (h!1537 (toList!503 lt!13599))) k!388))))))

(declare-fun b!36967 () Bool)

(assert (=> b!36967 (= e!23379 (Some!86 (_2!710 (h!1537 (toList!503 lt!13599)))))))

(declare-fun d!5671 () Bool)

(declare-fun c!4237 () Bool)

(assert (=> d!5671 (= c!4237 (and (is-Cons!969 (toList!503 lt!13599)) (= (_1!710 (h!1537 (toList!503 lt!13599))) k!388)))))

(assert (=> d!5671 (= (getValueByKey!81 (toList!503 lt!13599) k!388) e!23379)))

(declare-fun b!36970 () Bool)

(assert (=> b!36970 (= e!23380 None!85)))

(assert (= (and d!5671 c!4237) b!36967))

(assert (= (and d!5671 (not c!4237)) b!36968))

(assert (= (and b!36968 c!4238) b!36969))

(assert (= (and b!36968 (not c!4238)) b!36970))

(declare-fun m!29811 () Bool)

(assert (=> b!36969 m!29811))

(assert (=> b!36830 d!5671))

(declare-fun d!5675 () Bool)

(declare-fun res!22370 () Bool)

(declare-fun e!23383 () Bool)

(assert (=> d!5675 (=> res!22370 e!23383)))

(assert (=> d!5675 (= res!22370 (and (is-Cons!969 (toList!503 lt!13599)) (= (_1!710 (h!1537 (toList!503 lt!13599))) k!388)))))

(assert (=> d!5675 (= (containsKey!45 (toList!503 lt!13599) k!388) e!23383)))

(declare-fun b!36973 () Bool)

(declare-fun e!23384 () Bool)

(assert (=> b!36973 (= e!23383 e!23384)))

(declare-fun res!22371 () Bool)

(assert (=> b!36973 (=> (not res!22371) (not e!23384))))

(assert (=> b!36973 (= res!22371 (and (or (not (is-Cons!969 (toList!503 lt!13599))) (bvsle (_1!710 (h!1537 (toList!503 lt!13599))) k!388)) (is-Cons!969 (toList!503 lt!13599)) (bvslt (_1!710 (h!1537 (toList!503 lt!13599))) k!388)))))

(declare-fun b!36974 () Bool)

(assert (=> b!36974 (= e!23384 (containsKey!45 (t!3710 (toList!503 lt!13599)) k!388))))

(assert (= (and d!5675 (not res!22370)) b!36973))

(assert (= (and b!36973 res!22371) b!36974))

(declare-fun m!29815 () Bool)

(assert (=> b!36974 m!29815))

(assert (=> d!5581 d!5675))

(declare-fun d!5677 () Bool)

(declare-fun res!22372 () Bool)

(declare-fun e!23386 () Bool)

(assert (=> d!5677 (=> res!22372 e!23386)))

(assert (=> d!5677 (= res!22372 (is-Nil!970 (t!3710 (toList!503 lm!252))))))

(assert (=> d!5677 (= (forall!169 (t!3710 (toList!503 lm!252)) p!304) e!23386)))

(declare-fun b!36976 () Bool)

(declare-fun e!23387 () Bool)

(assert (=> b!36976 (= e!23386 e!23387)))

(declare-fun res!22373 () Bool)

(assert (=> b!36976 (=> (not res!22373) (not e!23387))))

(assert (=> b!36976 (= res!22373 (dynLambda!171 p!304 (h!1537 (t!3710 (toList!503 lm!252)))))))

(declare-fun b!36977 () Bool)

(assert (=> b!36977 (= e!23387 (forall!169 (t!3710 (t!3710 (toList!503 lm!252))) p!304))))

(assert (= (and d!5677 (not res!22372)) b!36976))

(assert (= (and b!36976 res!22373) b!36977))

(declare-fun b_lambda!1827 () Bool)

(assert (=> (not b_lambda!1827) (not b!36976)))

(declare-fun t!3734 () Bool)

(declare-fun tb!747 () Bool)

(assert (=> (and start!4768 (= p!304 p!304) t!3734) tb!747))

(declare-fun result!1277 () Bool)

(assert (=> tb!747 (= result!1277 true)))

(assert (=> b!36976 t!3734))

(declare-fun b_and!2213 () Bool)

(assert (= b_and!2207 (and (=> t!3734 result!1277) b_and!2213)))

(declare-fun m!29817 () Bool)

(assert (=> b!36976 m!29817))

(declare-fun m!29819 () Bool)

(assert (=> b!36977 m!29819))

(assert (=> b!36837 d!5677))

(assert (=> b!36832 d!5669))

(assert (=> b!36832 d!5671))

