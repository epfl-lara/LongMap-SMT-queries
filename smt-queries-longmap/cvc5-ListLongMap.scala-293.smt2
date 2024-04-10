; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5038 () Bool)

(assert start!5038)

(declare-fun b_free!1345 () Bool)

(declare-fun b_next!1345 () Bool)

(assert (=> start!5038 (= b_free!1345 (not b_next!1345))))

(declare-fun tp!5543 () Bool)

(declare-fun b_and!2291 () Bool)

(assert (=> start!5038 (= tp!5543 b_and!2291)))

(declare-fun b!37530 () Bool)

(declare-fun e!23763 () Bool)

(declare-datatypes ((B!752 0))(
  ( (B!753 (val!876 Int)) )
))
(declare-datatypes ((tuple2!1412 0))(
  ( (tuple2!1413 (_1!717 (_ BitVec 64)) (_2!717 B!752)) )
))
(declare-datatypes ((List!980 0))(
  ( (Nil!977) (Cons!976 (h!1544 tuple2!1412) (t!3797 List!980)) )
))
(declare-datatypes ((ListLongMap!989 0))(
  ( (ListLongMap!990 (toList!510 List!980)) )
))
(declare-fun lm!252 () ListLongMap!989)

(declare-fun k!388 () (_ BitVec 64))

(declare-fun head!848 (List!980) tuple2!1412)

(assert (=> b!37530 (= e!23763 (= (_1!717 (head!848 (toList!510 lm!252))) k!388))))

(declare-fun b!37531 () Bool)

(declare-fun e!23764 () Bool)

(declare-fun tp!5542 () Bool)

(assert (=> b!37531 (= e!23764 tp!5542)))

(declare-fun b!37532 () Bool)

(declare-fun res!22690 () Bool)

(declare-fun e!23762 () Bool)

(assert (=> b!37532 (=> (not res!22690) (not e!23762))))

(assert (=> b!37532 (= res!22690 e!23763)))

(declare-fun res!22691 () Bool)

(assert (=> b!37532 (=> res!22691 e!23763)))

(declare-fun isEmpty!215 (ListLongMap!989) Bool)

(assert (=> b!37532 (= res!22691 (isEmpty!215 lm!252))))

(declare-fun res!22689 () Bool)

(assert (=> start!5038 (=> (not res!22689) (not e!23762))))

(declare-fun p!304 () Int)

(declare-fun forall!176 (List!980 Int) Bool)

(assert (=> start!5038 (= res!22689 (forall!176 (toList!510 lm!252) p!304))))

(assert (=> start!5038 e!23762))

(declare-fun inv!1646 (ListLongMap!989) Bool)

(assert (=> start!5038 (and (inv!1646 lm!252) e!23764)))

(assert (=> start!5038 tp!5543))

(assert (=> start!5038 true))

(declare-fun b!37533 () Bool)

(declare-fun res!22692 () Bool)

(assert (=> b!37533 (=> (not res!22692) (not e!23762))))

(declare-fun contains!461 (ListLongMap!989 (_ BitVec 64)) Bool)

(assert (=> b!37533 (= res!22692 (contains!461 lm!252 k!388))))

(declare-fun b!37534 () Bool)

(declare-fun dynLambda!178 (Int tuple2!1412) Bool)

(declare-fun apply!49 (ListLongMap!989 (_ BitVec 64)) B!752)

(assert (=> b!37534 (= e!23762 (not (dynLambda!178 p!304 (tuple2!1413 k!388 (apply!49 lm!252 k!388)))))))

(assert (= (and start!5038 res!22689) b!37533))

(assert (= (and b!37533 res!22692) b!37532))

(assert (= (and b!37532 (not res!22691)) b!37530))

(assert (= (and b!37532 res!22690) b!37534))

(assert (= start!5038 b!37531))

(declare-fun b_lambda!1961 () Bool)

(assert (=> (not b_lambda!1961) (not b!37534)))

(declare-fun t!3796 () Bool)

(declare-fun tb!803 () Bool)

(assert (=> (and start!5038 (= p!304 p!304) t!3796) tb!803))

(declare-fun result!1345 () Bool)

(assert (=> tb!803 (= result!1345 true)))

(assert (=> b!37534 t!3796))

(declare-fun b_and!2293 () Bool)

(assert (= b_and!2291 (and (=> t!3796 result!1345) b_and!2293)))

(declare-fun m!30325 () Bool)

(assert (=> b!37534 m!30325))

(declare-fun m!30327 () Bool)

(assert (=> b!37534 m!30327))

(declare-fun m!30329 () Bool)

(assert (=> b!37533 m!30329))

(declare-fun m!30331 () Bool)

(assert (=> b!37532 m!30331))

(declare-fun m!30333 () Bool)

(assert (=> b!37530 m!30333))

(declare-fun m!30335 () Bool)

(assert (=> start!5038 m!30335))

(declare-fun m!30337 () Bool)

(assert (=> start!5038 m!30337))

(push 1)

(assert b_and!2293)

(assert (not b!37533))

(assert (not b!37530))

(assert (not b!37534))

(assert (not b_lambda!1961))

(assert (not b_next!1345))

(assert (not start!5038))

(assert (not b!37531))

(assert (not b!37532))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2293)

(assert (not b_next!1345))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!1969 () Bool)

(assert (= b_lambda!1961 (or (and start!5038 b_free!1345) b_lambda!1969)))

(push 1)

(assert (not b!37533))

(assert (not b!37530))

(assert (not b!37534))

(assert b_and!2293)

(assert (not b_lambda!1969))

(assert (not b_next!1345))

(assert (not start!5038))

(assert (not b!37531))

(assert (not b!37532))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2293)

(assert (not b_next!1345))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5979 () Bool)

(declare-datatypes ((Option!97 0))(
  ( (Some!96 (v!1965 B!752)) (None!95) )
))
(declare-fun get!641 (Option!97) B!752)

(declare-fun getValueByKey!91 (List!980 (_ BitVec 64)) Option!97)

(assert (=> d!5979 (= (apply!49 lm!252 k!388) (get!641 (getValueByKey!91 (toList!510 lm!252) k!388)))))

(declare-fun bs!1469 () Bool)

(assert (= bs!1469 d!5979))

(declare-fun m!30371 () Bool)

(assert (=> bs!1469 m!30371))

(assert (=> bs!1469 m!30371))

(declare-fun m!30373 () Bool)

(assert (=> bs!1469 m!30373))

(assert (=> b!37534 d!5979))

(declare-fun d!5987 () Bool)

(declare-fun isEmpty!218 (List!980) Bool)

(assert (=> d!5987 (= (isEmpty!215 lm!252) (isEmpty!218 (toList!510 lm!252)))))

(declare-fun bs!1471 () Bool)

(assert (= bs!1471 d!5987))

(declare-fun m!30379 () Bool)

(assert (=> bs!1471 m!30379))

(assert (=> b!37532 d!5987))

(declare-fun d!5991 () Bool)

(declare-fun e!23806 () Bool)

(assert (=> d!5991 e!23806))

(declare-fun res!22730 () Bool)

(assert (=> d!5991 (=> res!22730 e!23806)))

(declare-fun lt!13864 () Bool)

(assert (=> d!5991 (= res!22730 (not lt!13864))))

(declare-fun lt!13863 () Bool)

(assert (=> d!5991 (= lt!13864 lt!13863)))

(declare-datatypes ((Unit!863 0))(
  ( (Unit!864) )
))
(declare-fun lt!13861 () Unit!863)

(declare-fun e!23807 () Unit!863)

(assert (=> d!5991 (= lt!13861 e!23807)))

(declare-fun c!4336 () Bool)

(assert (=> d!5991 (= c!4336 lt!13863)))

(declare-fun containsKey!55 (List!980 (_ BitVec 64)) Bool)

(assert (=> d!5991 (= lt!13863 (containsKey!55 (toList!510 lm!252) k!388))))

(assert (=> d!5991 (= (contains!461 lm!252 k!388) lt!13864)))

(declare-fun b!37597 () Bool)

(declare-fun lt!13862 () Unit!863)

(assert (=> b!37597 (= e!23807 lt!13862)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!52 (List!980 (_ BitVec 64)) Unit!863)

(assert (=> b!37597 (= lt!13862 (lemmaContainsKeyImpliesGetValueByKeyDefined!52 (toList!510 lm!252) k!388))))

(declare-fun isDefined!53 (Option!97) Bool)

(assert (=> b!37597 (isDefined!53 (getValueByKey!91 (toList!510 lm!252) k!388))))

(declare-fun b!37598 () Bool)

(declare-fun Unit!867 () Unit!863)

(assert (=> b!37598 (= e!23807 Unit!867)))

(declare-fun b!37599 () Bool)

(assert (=> b!37599 (= e!23806 (isDefined!53 (getValueByKey!91 (toList!510 lm!252) k!388)))))

(assert (= (and d!5991 c!4336) b!37597))

(assert (= (and d!5991 (not c!4336)) b!37598))

(assert (= (and d!5991 (not res!22730)) b!37599))

(declare-fun m!30397 () Bool)

(assert (=> d!5991 m!30397))

(declare-fun m!30399 () Bool)

(assert (=> b!37597 m!30399))

(assert (=> b!37597 m!30371))

(assert (=> b!37597 m!30371))

(declare-fun m!30401 () Bool)

(assert (=> b!37597 m!30401))

(assert (=> b!37599 m!30371))

(assert (=> b!37599 m!30371))

(assert (=> b!37599 m!30401))

(assert (=> b!37533 d!5991))

(declare-fun d!6001 () Bool)

(declare-fun res!22740 () Bool)

(declare-fun e!23818 () Bool)

(assert (=> d!6001 (=> res!22740 e!23818)))

(assert (=> d!6001 (= res!22740 (is-Nil!977 (toList!510 lm!252)))))

(assert (=> d!6001 (= (forall!176 (toList!510 lm!252) p!304) e!23818)))

(declare-fun b!37609 () Bool)

(declare-fun e!23819 () Bool)

(assert (=> b!37609 (= e!23818 e!23819)))

(declare-fun res!22741 () Bool)

(assert (=> b!37609 (=> (not res!22741) (not e!23819))))

(assert (=> b!37609 (= res!22741 (dynLambda!178 p!304 (h!1544 (toList!510 lm!252))))))

(declare-fun b!37610 () Bool)

(assert (=> b!37610 (= e!23819 (forall!176 (t!3797 (toList!510 lm!252)) p!304))))

(assert (= (and d!6001 (not res!22740)) b!37609))

(assert (= (and b!37609 res!22741) b!37610))

(declare-fun b_lambda!1977 () Bool)

(assert (=> (not b_lambda!1977) (not b!37609)))

(declare-fun t!3807 () Bool)

(declare-fun tb!811 () Bool)

(assert (=> (and start!5038 (= p!304 p!304) t!3807) tb!811))

(declare-fun result!1355 () Bool)

(assert (=> tb!811 (= result!1355 true)))

(assert (=> b!37609 t!3807))

(declare-fun b_and!2305 () Bool)

(assert (= b_and!2293 (and (=> t!3807 result!1355) b_and!2305)))

(declare-fun m!30409 () Bool)

(assert (=> b!37609 m!30409))

(declare-fun m!30411 () Bool)

(assert (=> b!37610 m!30411))

(assert (=> start!5038 d!6001))

(declare-fun d!6007 () Bool)

(declare-fun isStrictlySorted!189 (List!980) Bool)

(assert (=> d!6007 (= (inv!1646 lm!252) (isStrictlySorted!189 (toList!510 lm!252)))))

(declare-fun bs!1475 () Bool)

(assert (= bs!1475 d!6007))

(declare-fun m!30413 () Bool)

(assert (=> bs!1475 m!30413))

(assert (=> start!5038 d!6007))

(declare-fun d!6009 () Bool)

(assert (=> d!6009 (= (head!848 (toList!510 lm!252)) (h!1544 (toList!510 lm!252)))))

(assert (=> b!37530 d!6009))

(declare-fun b!37619 () Bool)

(declare-fun e!23824 () Bool)

(declare-fun tp_is_empty!1677 () Bool)

(declare-fun tp!5561 () Bool)

(assert (=> b!37619 (= e!23824 (and tp_is_empty!1677 tp!5561))))

(assert (=> b!37531 (= tp!5542 e!23824)))

(assert (= (and b!37531 (is-Cons!976 (toList!510 lm!252))) b!37619))

(declare-fun b_lambda!1981 () Bool)

(assert (= b_lambda!1977 (or (and start!5038 b_free!1345) b_lambda!1981)))

(push 1)

(assert (not b_lambda!1969))

(assert (not b!37619))

(assert (not d!5991))

(assert (not d!5987))

(assert (not b_lambda!1981))

(assert (not d!5979))

(assert (not b!37599))

(assert tp_is_empty!1677)

(assert (not b!37610))

(assert (not b_next!1345))

(assert (not b!37597))

(assert b_and!2305)

(assert (not d!6007))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2305)

(assert (not b_next!1345))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6021 () Bool)

(assert (=> d!6021 (isDefined!53 (getValueByKey!91 (toList!510 lm!252) k!388))))

(declare-fun lt!13871 () Unit!863)

(declare-fun choose!236 (List!980 (_ BitVec 64)) Unit!863)

(assert (=> d!6021 (= lt!13871 (choose!236 (toList!510 lm!252) k!388))))

(declare-fun e!23848 () Bool)

(assert (=> d!6021 e!23848))

(declare-fun res!22752 () Bool)

(assert (=> d!6021 (=> (not res!22752) (not e!23848))))

(assert (=> d!6021 (= res!22752 (isStrictlySorted!189 (toList!510 lm!252)))))

(assert (=> d!6021 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!52 (toList!510 lm!252) k!388) lt!13871)))

(declare-fun b!37657 () Bool)

(assert (=> b!37657 (= e!23848 (containsKey!55 (toList!510 lm!252) k!388))))

(assert (= (and d!6021 res!22752) b!37657))

(assert (=> d!6021 m!30371))

(assert (=> d!6021 m!30371))

(assert (=> d!6021 m!30401))

(declare-fun m!30429 () Bool)

(assert (=> d!6021 m!30429))

(assert (=> d!6021 m!30413))

(assert (=> b!37657 m!30397))

(assert (=> b!37597 d!6021))

(declare-fun d!6031 () Bool)

(declare-fun isEmpty!222 (Option!97) Bool)

(assert (=> d!6031 (= (isDefined!53 (getValueByKey!91 (toList!510 lm!252) k!388)) (not (isEmpty!222 (getValueByKey!91 (toList!510 lm!252) k!388))))))

(declare-fun bs!1478 () Bool)

(assert (= bs!1478 d!6031))

(assert (=> bs!1478 m!30371))

(declare-fun m!30435 () Bool)

(assert (=> bs!1478 m!30435))

(assert (=> b!37597 d!6031))

(declare-fun b!37678 () Bool)

(declare-fun e!23865 () Option!97)

(assert (=> b!37678 (= e!23865 (Some!96 (_2!717 (h!1544 (toList!510 lm!252)))))))

(declare-fun b!37679 () Bool)

(declare-fun e!23866 () Option!97)

(assert (=> b!37679 (= e!23865 e!23866)))

(declare-fun c!4355 () Bool)

(assert (=> b!37679 (= c!4355 (and (is-Cons!976 (toList!510 lm!252)) (not (= (_1!717 (h!1544 (toList!510 lm!252))) k!388))))))

(declare-fun b!37681 () Bool)

(assert (=> b!37681 (= e!23866 None!95)))

(declare-fun b!37680 () Bool)

(assert (=> b!37680 (= e!23866 (getValueByKey!91 (t!3797 (toList!510 lm!252)) k!388))))

(declare-fun d!6037 () Bool)

(declare-fun c!4354 () Bool)

(assert (=> d!6037 (= c!4354 (and (is-Cons!976 (toList!510 lm!252)) (= (_1!717 (h!1544 (toList!510 lm!252))) k!388)))))

(assert (=> d!6037 (= (getValueByKey!91 (toList!510 lm!252) k!388) e!23865)))

(assert (= (and d!6037 c!4354) b!37678))

(assert (= (and d!6037 (not c!4354)) b!37679))

(assert (= (and b!37679 c!4355) b!37680))

(assert (= (and b!37679 (not c!4355)) b!37681))

(declare-fun m!30443 () Bool)

(assert (=> b!37680 m!30443))

(assert (=> b!37597 d!6037))

(declare-fun d!6047 () Bool)

(declare-fun res!22765 () Bool)

(declare-fun e!23867 () Bool)

(assert (=> d!6047 (=> res!22765 e!23867)))

(assert (=> d!6047 (= res!22765 (is-Nil!977 (t!3797 (toList!510 lm!252))))))

(assert (=> d!6047 (= (forall!176 (t!3797 (toList!510 lm!252)) p!304) e!23867)))

(declare-fun b!37682 () Bool)

(declare-fun e!23868 () Bool)

(assert (=> b!37682 (= e!23867 e!23868)))

(declare-fun res!22766 () Bool)

(assert (=> b!37682 (=> (not res!22766) (not e!23868))))

(assert (=> b!37682 (= res!22766 (dynLambda!178 p!304 (h!1544 (t!3797 (toList!510 lm!252)))))))

(declare-fun b!37683 () Bool)

(assert (=> b!37683 (= e!23868 (forall!176 (t!3797 (t!3797 (toList!510 lm!252))) p!304))))

(assert (= (and d!6047 (not res!22765)) b!37682))

(assert (= (and b!37682 res!22766) b!37683))

(declare-fun b_lambda!1987 () Bool)

(assert (=> (not b_lambda!1987) (not b!37682)))

(declare-fun t!3813 () Bool)

(declare-fun tb!817 () Bool)

(assert (=> (and start!5038 (= p!304 p!304) t!3813) tb!817))

(declare-fun result!1365 () Bool)

(assert (=> tb!817 (= result!1365 true)))

(assert (=> b!37682 t!3813))

(declare-fun b_and!2311 () Bool)

(assert (= b_and!2305 (and (=> t!3813 result!1365) b_and!2311)))

(declare-fun m!30447 () Bool)

(assert (=> b!37682 m!30447))

(declare-fun m!30449 () Bool)

(assert (=> b!37683 m!30449))

(assert (=> b!37610 d!6047))

(declare-fun d!6049 () Bool)

(declare-fun res!22779 () Bool)

(declare-fun e!23882 () Bool)

(assert (=> d!6049 (=> res!22779 e!23882)))

(assert (=> d!6049 (= res!22779 (and (is-Cons!976 (toList!510 lm!252)) (= (_1!717 (h!1544 (toList!510 lm!252))) k!388)))))

(assert (=> d!6049 (= (containsKey!55 (toList!510 lm!252) k!388) e!23882)))

(declare-fun b!37697 () Bool)

(declare-fun e!23883 () Bool)

(assert (=> b!37697 (= e!23882 e!23883)))

(declare-fun res!22780 () Bool)

(assert (=> b!37697 (=> (not res!22780) (not e!23883))))

(assert (=> b!37697 (= res!22780 (and (or (not (is-Cons!976 (toList!510 lm!252))) (bvsle (_1!717 (h!1544 (toList!510 lm!252))) k!388)) (is-Cons!976 (toList!510 lm!252)) (bvslt (_1!717 (h!1544 (toList!510 lm!252))) k!388)))))

(declare-fun b!37698 () Bool)

(assert (=> b!37698 (= e!23883 (containsKey!55 (t!3797 (toList!510 lm!252)) k!388))))

(assert (= (and d!6049 (not res!22779)) b!37697))

(assert (= (and b!37697 res!22780) b!37698))

(declare-fun m!30453 () Bool)

(assert (=> b!37698 m!30453))

(assert (=> d!5991 d!6049))

(declare-fun d!6053 () Bool)

(assert (=> d!6053 (= (isEmpty!218 (toList!510 lm!252)) (is-Nil!977 (toList!510 lm!252)))))

(assert (=> d!5987 d!6053))

(assert (=> b!37599 d!6031))

(assert (=> b!37599 d!6037))

(declare-fun d!6055 () Bool)

(declare-fun res!22793 () Bool)

(declare-fun e!23897 () Bool)

(assert (=> d!6055 (=> res!22793 e!23897)))

(assert (=> d!6055 (= res!22793 (or (is-Nil!977 (toList!510 lm!252)) (is-Nil!977 (t!3797 (toList!510 lm!252)))))))

(assert (=> d!6055 (= (isStrictlySorted!189 (toList!510 lm!252)) e!23897)))

(declare-fun b!37712 () Bool)

(declare-fun e!23898 () Bool)

(assert (=> b!37712 (= e!23897 e!23898)))

(declare-fun res!22794 () Bool)

(assert (=> b!37712 (=> (not res!22794) (not e!23898))))

(assert (=> b!37712 (= res!22794 (bvslt (_1!717 (h!1544 (toList!510 lm!252))) (_1!717 (h!1544 (t!3797 (toList!510 lm!252))))))))

(declare-fun b!37713 () Bool)

(assert (=> b!37713 (= e!23898 (isStrictlySorted!189 (t!3797 (toList!510 lm!252))))))

(assert (= (and d!6055 (not res!22793)) b!37712))

(assert (= (and b!37712 res!22794) b!37713))

(declare-fun m!30461 () Bool)

(assert (=> b!37713 m!30461))

(assert (=> d!6007 d!6055))

(declare-fun d!6059 () Bool)

(assert (=> d!6059 (= (get!641 (getValueByKey!91 (toList!510 lm!252) k!388)) (v!1965 (getValueByKey!91 (toList!510 lm!252) k!388)))))

(assert (=> d!5979 d!6059))

(assert (=> d!5979 d!6037))

(declare-fun b!37714 () Bool)

(declare-fun e!23899 () Bool)

(declare-fun tp!5567 () Bool)

(assert (=> b!37714 (= e!23899 (and tp_is_empty!1677 tp!5567))))

(assert (=> b!37619 (= tp!5561 e!23899)))

(assert (= (and b!37619 (is-Cons!976 (t!3797 (toList!510 lm!252)))) b!37714))

(declare-fun b_lambda!1995 () Bool)

(assert (= b_lambda!1987 (or (and start!5038 b_free!1345) b_lambda!1995)))

(push 1)

