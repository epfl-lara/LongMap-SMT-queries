; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5042 () Bool)

(assert start!5042)

(declare-fun b_free!1349 () Bool)

(declare-fun b_next!1349 () Bool)

(assert (=> start!5042 (= b_free!1349 (not b_next!1349))))

(declare-fun tp!5554 () Bool)

(declare-fun b_and!2299 () Bool)

(assert (=> start!5042 (= tp!5554 b_and!2299)))

(declare-fun b!37560 () Bool)

(declare-fun res!22713 () Bool)

(declare-fun e!23781 () Bool)

(assert (=> b!37560 (=> (not res!22713) (not e!23781))))

(declare-fun e!23782 () Bool)

(assert (=> b!37560 (= res!22713 e!23782)))

(declare-fun res!22716 () Bool)

(assert (=> b!37560 (=> res!22716 e!23782)))

(declare-datatypes ((B!756 0))(
  ( (B!757 (val!878 Int)) )
))
(declare-datatypes ((tuple2!1416 0))(
  ( (tuple2!1417 (_1!719 (_ BitVec 64)) (_2!719 B!756)) )
))
(declare-datatypes ((List!982 0))(
  ( (Nil!979) (Cons!978 (h!1546 tuple2!1416) (t!3803 List!982)) )
))
(declare-datatypes ((ListLongMap!993 0))(
  ( (ListLongMap!994 (toList!512 List!982)) )
))
(declare-fun lm!252 () ListLongMap!993)

(declare-fun isEmpty!217 (ListLongMap!993) Bool)

(assert (=> b!37560 (= res!22716 (isEmpty!217 lm!252))))

(declare-fun b!37561 () Bool)

(declare-fun e!23780 () Bool)

(declare-fun tp!5555 () Bool)

(assert (=> b!37561 (= e!23780 tp!5555)))

(declare-fun b!37562 () Bool)

(declare-fun k!388 () (_ BitVec 64))

(declare-fun p!304 () Int)

(declare-fun dynLambda!180 (Int tuple2!1416) Bool)

(declare-fun apply!51 (ListLongMap!993 (_ BitVec 64)) B!756)

(assert (=> b!37562 (= e!23781 (not (dynLambda!180 p!304 (tuple2!1417 k!388 (apply!51 lm!252 k!388)))))))

(declare-fun b!37563 () Bool)

(declare-fun res!22715 () Bool)

(assert (=> b!37563 (=> (not res!22715) (not e!23781))))

(declare-fun contains!463 (ListLongMap!993 (_ BitVec 64)) Bool)

(assert (=> b!37563 (= res!22715 (contains!463 lm!252 k!388))))

(declare-fun res!22714 () Bool)

(assert (=> start!5042 (=> (not res!22714) (not e!23781))))

(declare-fun forall!178 (List!982 Int) Bool)

(assert (=> start!5042 (= res!22714 (forall!178 (toList!512 lm!252) p!304))))

(assert (=> start!5042 e!23781))

(declare-fun inv!1648 (ListLongMap!993) Bool)

(assert (=> start!5042 (and (inv!1648 lm!252) e!23780)))

(assert (=> start!5042 tp!5554))

(assert (=> start!5042 true))

(declare-fun b!37564 () Bool)

(declare-fun head!850 (List!982) tuple2!1416)

(assert (=> b!37564 (= e!23782 (= (_1!719 (head!850 (toList!512 lm!252))) k!388))))

(assert (= (and start!5042 res!22714) b!37563))

(assert (= (and b!37563 res!22715) b!37560))

(assert (= (and b!37560 (not res!22716)) b!37564))

(assert (= (and b!37560 res!22713) b!37562))

(assert (= start!5042 b!37561))

(declare-fun b_lambda!1965 () Bool)

(assert (=> (not b_lambda!1965) (not b!37562)))

(declare-fun t!3802 () Bool)

(declare-fun tb!807 () Bool)

(assert (=> (and start!5042 (= p!304 p!304) t!3802) tb!807))

(declare-fun result!1349 () Bool)

(assert (=> tb!807 (= result!1349 true)))

(assert (=> b!37562 t!3802))

(declare-fun b_and!2301 () Bool)

(assert (= b_and!2299 (and (=> t!3802 result!1349) b_and!2301)))

(declare-fun m!30353 () Bool)

(assert (=> b!37563 m!30353))

(declare-fun m!30355 () Bool)

(assert (=> b!37560 m!30355))

(declare-fun m!30357 () Bool)

(assert (=> b!37562 m!30357))

(declare-fun m!30359 () Bool)

(assert (=> b!37562 m!30359))

(declare-fun m!30361 () Bool)

(assert (=> start!5042 m!30361))

(declare-fun m!30363 () Bool)

(assert (=> start!5042 m!30363))

(declare-fun m!30365 () Bool)

(assert (=> b!37564 m!30365))

(push 1)

(assert (not b_next!1349))

(assert (not b!37563))

(assert (not start!5042))

(assert (not b!37564))

(assert (not b!37561))

(assert (not b!37562))

(assert (not b!37560))

(assert (not b_lambda!1965))

(assert b_and!2301)

(check-sat)

(pop 1)

(push 1)

(assert b_and!2301)

(assert (not b_next!1349))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!1967 () Bool)

(assert (= b_lambda!1965 (or (and start!5042 b_free!1349) b_lambda!1967)))

(push 1)

(assert (not b_next!1349))

(assert (not b!37563))

(assert (not start!5042))

(assert b_and!2301)

(assert (not b_lambda!1967))

(assert (not b!37564))

(assert (not b!37561))

(assert (not b!37562))

(assert (not b!37560))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2301)

(assert (not b_next!1349))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5977 () Bool)

(assert (=> d!5977 (= (head!850 (toList!512 lm!252)) (h!1546 (toList!512 lm!252)))))

(assert (=> b!37564 d!5977))

(declare-fun d!5981 () Bool)

(declare-datatypes ((Option!96 0))(
  ( (Some!95 (v!1964 B!756)) (None!94) )
))
(declare-fun get!640 (Option!96) B!756)

(declare-fun getValueByKey!90 (List!982 (_ BitVec 64)) Option!96)

(assert (=> d!5981 (= (apply!51 lm!252 k!388) (get!640 (getValueByKey!90 (toList!512 lm!252) k!388)))))

(declare-fun bs!1468 () Bool)

(assert (= bs!1468 d!5981))

(declare-fun m!30367 () Bool)

(assert (=> bs!1468 m!30367))

(assert (=> bs!1468 m!30367))

(declare-fun m!30369 () Bool)

(assert (=> bs!1468 m!30369))

(assert (=> b!37562 d!5981))

(declare-fun d!5985 () Bool)

(declare-fun e!23787 () Bool)

(assert (=> d!5985 e!23787))

(declare-fun res!22719 () Bool)

(assert (=> d!5985 (=> res!22719 e!23787)))

(declare-fun lt!13842 () Bool)

(assert (=> d!5985 (= res!22719 (not lt!13842))))

(declare-fun lt!13843 () Bool)

(assert (=> d!5985 (= lt!13842 lt!13843)))

(declare-datatypes ((Unit!860 0))(
  ( (Unit!861) )
))
(declare-fun lt!13841 () Unit!860)

(declare-fun e!23788 () Unit!860)

(assert (=> d!5985 (= lt!13841 e!23788)))

(declare-fun c!4331 () Bool)

(assert (=> d!5985 (= c!4331 lt!13843)))

(declare-fun containsKey!54 (List!982 (_ BitVec 64)) Bool)

(assert (=> d!5985 (= lt!13843 (containsKey!54 (toList!512 lm!252) k!388))))

(assert (=> d!5985 (= (contains!463 lm!252 k!388) lt!13842)))

(declare-fun b!37571 () Bool)

(declare-fun lt!13844 () Unit!860)

(assert (=> b!37571 (= e!23788 lt!13844)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!51 (List!982 (_ BitVec 64)) Unit!860)

(assert (=> b!37571 (= lt!13844 (lemmaContainsKeyImpliesGetValueByKeyDefined!51 (toList!512 lm!252) k!388))))

(declare-fun isDefined!52 (Option!96) Bool)

(assert (=> b!37571 (isDefined!52 (getValueByKey!90 (toList!512 lm!252) k!388))))

(declare-fun b!37572 () Bool)

(declare-fun Unit!862 () Unit!860)

(assert (=> b!37572 (= e!23788 Unit!862)))

(declare-fun b!37573 () Bool)

(assert (=> b!37573 (= e!23787 (isDefined!52 (getValueByKey!90 (toList!512 lm!252) k!388)))))

(assert (= (and d!5985 c!4331) b!37571))

(assert (= (and d!5985 (not c!4331)) b!37572))

(assert (= (and d!5985 (not res!22719)) b!37573))

(declare-fun m!30383 () Bool)

(assert (=> d!5985 m!30383))

(declare-fun m!30385 () Bool)

(assert (=> b!37571 m!30385))

(assert (=> b!37571 m!30367))

(assert (=> b!37571 m!30367))

(declare-fun m!30387 () Bool)

(assert (=> b!37571 m!30387))

(assert (=> b!37573 m!30367))

(assert (=> b!37573 m!30367))

(assert (=> b!37573 m!30387))

(assert (=> b!37563 d!5985))

(declare-fun d!5995 () Bool)

(declare-fun res!22724 () Bool)

(declare-fun e!23793 () Bool)

(assert (=> d!5995 (=> res!22724 e!23793)))

(assert (=> d!5995 (= res!22724 (is-Nil!979 (toList!512 lm!252)))))

(assert (=> d!5995 (= (forall!178 (toList!512 lm!252) p!304) e!23793)))

(declare-fun b!37578 () Bool)

(declare-fun e!23794 () Bool)

(assert (=> b!37578 (= e!23793 e!23794)))

(declare-fun res!22725 () Bool)

(assert (=> b!37578 (=> (not res!22725) (not e!23794))))

(assert (=> b!37578 (= res!22725 (dynLambda!180 p!304 (h!1546 (toList!512 lm!252))))))

(declare-fun b!37579 () Bool)

(assert (=> b!37579 (= e!23794 (forall!178 (t!3803 (toList!512 lm!252)) p!304))))

(assert (= (and d!5995 (not res!22724)) b!37578))

(assert (= (and b!37578 res!22725) b!37579))

(declare-fun b_lambda!1973 () Bool)

(assert (=> (not b_lambda!1973) (not b!37578)))

(declare-fun t!3805 () Bool)

(declare-fun tb!809 () Bool)

(assert (=> (and start!5042 (= p!304 p!304) t!3805) tb!809))

(declare-fun result!1351 () Bool)

(assert (=> tb!809 (= result!1351 true)))

(assert (=> b!37578 t!3805))

(declare-fun b_and!2303 () Bool)

(assert (= b_and!2301 (and (=> t!3805 result!1351) b_and!2303)))

(declare-fun m!30389 () Bool)

(assert (=> b!37578 m!30389))

(declare-fun m!30391 () Bool)

(assert (=> b!37579 m!30391))

(assert (=> start!5042 d!5995))

(declare-fun d!5997 () Bool)

(declare-fun isStrictlySorted!188 (List!982) Bool)

(assert (=> d!5997 (= (inv!1648 lm!252) (isStrictlySorted!188 (toList!512 lm!252)))))

(declare-fun bs!1473 () Bool)

(assert (= bs!1473 d!5997))

(declare-fun m!30393 () Bool)

(assert (=> bs!1473 m!30393))

(assert (=> start!5042 d!5997))

(declare-fun d!5999 () Bool)

(declare-fun isEmpty!220 (List!982) Bool)

(assert (=> d!5999 (= (isEmpty!217 lm!252) (isEmpty!220 (toList!512 lm!252)))))

(declare-fun bs!1474 () Bool)

(assert (= bs!1474 d!5999))

(declare-fun m!30395 () Bool)

(assert (=> bs!1474 m!30395))

(assert (=> b!37560 d!5999))

(declare-fun b!37596 () Bool)

(declare-fun e!23805 () Bool)

(declare-fun tp_is_empty!1675 () Bool)

(declare-fun tp!5558 () Bool)

(assert (=> b!37596 (= e!23805 (and tp_is_empty!1675 tp!5558))))

(assert (=> b!37561 (= tp!5555 e!23805)))

(assert (= (and b!37561 (is-Cons!978 (toList!512 lm!252))) b!37596))

(declare-fun b_lambda!1975 () Bool)

(assert (= b_lambda!1973 (or (and start!5042 b_free!1349) b_lambda!1975)))

(push 1)

(assert tp_is_empty!1675)

(assert (not b!37571))

(assert (not b!37596))

(assert b_and!2303)

(assert (not b_lambda!1975))

(assert (not d!5985))

(assert (not d!5997))

(assert (not d!5999))

(assert (not d!5981))

(assert (not b_next!1349))

(assert (not b!37573))

(assert (not b_lambda!1967))

(assert (not b!37579))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2303)

(assert (not b_next!1349))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6013 () Bool)

(declare-fun res!22748 () Bool)

(declare-fun e!23832 () Bool)

(assert (=> d!6013 (=> res!22748 e!23832)))

(assert (=> d!6013 (= res!22748 (and (is-Cons!978 (toList!512 lm!252)) (= (_1!719 (h!1546 (toList!512 lm!252))) k!388)))))

(assert (=> d!6013 (= (containsKey!54 (toList!512 lm!252) k!388) e!23832)))

(declare-fun b!37629 () Bool)

(declare-fun e!23833 () Bool)

(assert (=> b!37629 (= e!23832 e!23833)))

(declare-fun res!22749 () Bool)

(assert (=> b!37629 (=> (not res!22749) (not e!23833))))

(assert (=> b!37629 (= res!22749 (and (or (not (is-Cons!978 (toList!512 lm!252))) (bvsle (_1!719 (h!1546 (toList!512 lm!252))) k!388)) (is-Cons!978 (toList!512 lm!252)) (bvslt (_1!719 (h!1546 (toList!512 lm!252))) k!388)))))

(declare-fun b!37630 () Bool)

(assert (=> b!37630 (= e!23833 (containsKey!54 (t!3803 (toList!512 lm!252)) k!388))))

(assert (= (and d!6013 (not res!22748)) b!37629))

(assert (= (and b!37629 res!22749) b!37630))

(declare-fun m!30423 () Bool)

(assert (=> b!37630 m!30423))

(assert (=> d!5985 d!6013))

(declare-fun d!6019 () Bool)

(assert (=> d!6019 (= (isEmpty!220 (toList!512 lm!252)) (is-Nil!979 (toList!512 lm!252)))))

(assert (=> d!5999 d!6019))

(declare-fun d!6023 () Bool)

(assert (=> d!6023 (= (get!640 (getValueByKey!90 (toList!512 lm!252) k!388)) (v!1964 (getValueByKey!90 (toList!512 lm!252) k!388)))))

(assert (=> d!5981 d!6023))

(declare-fun b!37653 () Bool)

(declare-fun e!23846 () Option!96)

(assert (=> b!37653 (= e!23846 (Some!95 (_2!719 (h!1546 (toList!512 lm!252)))))))

(declare-fun b!37655 () Bool)

(declare-fun e!23847 () Option!96)

(assert (=> b!37655 (= e!23847 (getValueByKey!90 (t!3803 (toList!512 lm!252)) k!388))))

(declare-fun b!37656 () Bool)

(assert (=> b!37656 (= e!23847 None!94)))

(declare-fun b!37654 () Bool)

(assert (=> b!37654 (= e!23846 e!23847)))

(declare-fun c!4349 () Bool)

(assert (=> b!37654 (= c!4349 (and (is-Cons!978 (toList!512 lm!252)) (not (= (_1!719 (h!1546 (toList!512 lm!252))) k!388))))))

(declare-fun d!6025 () Bool)

(declare-fun c!4348 () Bool)

(assert (=> d!6025 (= c!4348 (and (is-Cons!978 (toList!512 lm!252)) (= (_1!719 (h!1546 (toList!512 lm!252))) k!388)))))

(assert (=> d!6025 (= (getValueByKey!90 (toList!512 lm!252) k!388) e!23846)))

(assert (= (and d!6025 c!4348) b!37653))

(assert (= (and d!6025 (not c!4348)) b!37654))

(assert (= (and b!37654 c!4349) b!37655))

(assert (= (and b!37654 (not c!4349)) b!37656))

(declare-fun m!30425 () Bool)

(assert (=> b!37655 m!30425))

(assert (=> d!5981 d!6025))

(declare-fun d!6027 () Bool)

(declare-fun res!22753 () Bool)

(declare-fun e!23849 () Bool)

(assert (=> d!6027 (=> res!22753 e!23849)))

(assert (=> d!6027 (= res!22753 (is-Nil!979 (t!3803 (toList!512 lm!252))))))

(assert (=> d!6027 (= (forall!178 (t!3803 (toList!512 lm!252)) p!304) e!23849)))

(declare-fun b!37658 () Bool)

(declare-fun e!23850 () Bool)

(assert (=> b!37658 (= e!23849 e!23850)))

(declare-fun res!22754 () Bool)

(assert (=> b!37658 (=> (not res!22754) (not e!23850))))

(assert (=> b!37658 (= res!22754 (dynLambda!180 p!304 (h!1546 (t!3803 (toList!512 lm!252)))))))

(declare-fun b!37659 () Bool)

(assert (=> b!37659 (= e!23850 (forall!178 (t!3803 (t!3803 (toList!512 lm!252))) p!304))))

(assert (= (and d!6027 (not res!22753)) b!37658))

(assert (= (and b!37658 res!22754) b!37659))

(declare-fun b_lambda!1985 () Bool)

(assert (=> (not b_lambda!1985) (not b!37658)))

(declare-fun t!3811 () Bool)

(declare-fun tb!815 () Bool)

(assert (=> (and start!5042 (= p!304 p!304) t!3811) tb!815))

(declare-fun result!1363 () Bool)

(assert (=> tb!815 (= result!1363 true)))

(assert (=> b!37658 t!3811))

(declare-fun b_and!2309 () Bool)

(assert (= b_and!2303 (and (=> t!3811 result!1363) b_and!2309)))

(declare-fun m!30431 () Bool)

(assert (=> b!37658 m!30431))

(declare-fun m!30433 () Bool)

(assert (=> b!37659 m!30433))

(assert (=> b!37579 d!6027))

(declare-fun d!6033 () Bool)

(assert (=> d!6033 (isDefined!52 (getValueByKey!90 (toList!512 lm!252) k!388))))

(declare-fun lt!13874 () Unit!860)

(declare-fun choose!237 (List!982 (_ BitVec 64)) Unit!860)

(assert (=> d!6033 (= lt!13874 (choose!237 (toList!512 lm!252) k!388))))

(declare-fun e!23853 () Bool)

(assert (=> d!6033 e!23853))

(declare-fun res!22757 () Bool)

(assert (=> d!6033 (=> (not res!22757) (not e!23853))))

(assert (=> d!6033 (= res!22757 (isStrictlySorted!188 (toList!512 lm!252)))))

(assert (=> d!6033 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!51 (toList!512 lm!252) k!388) lt!13874)))

(declare-fun b!37662 () Bool)

(assert (=> b!37662 (= e!23853 (containsKey!54 (toList!512 lm!252) k!388))))

(assert (= (and d!6033 res!22757) b!37662))

(assert (=> d!6033 m!30367))

(assert (=> d!6033 m!30367))

(assert (=> d!6033 m!30387))

(declare-fun m!30437 () Bool)

(assert (=> d!6033 m!30437))

(assert (=> d!6033 m!30393))

(assert (=> b!37662 m!30383))

(assert (=> b!37571 d!6033))

(declare-fun d!6039 () Bool)

(declare-fun isEmpty!223 (Option!96) Bool)

(assert (=> d!6039 (= (isDefined!52 (getValueByKey!90 (toList!512 lm!252) k!388)) (not (isEmpty!223 (getValueByKey!90 (toList!512 lm!252) k!388))))))

(declare-fun bs!1479 () Bool)

(assert (= bs!1479 d!6039))

(assert (=> bs!1479 m!30367))

(declare-fun m!30439 () Bool)

(assert (=> bs!1479 m!30439))

(assert (=> b!37571 d!6039))

(assert (=> b!37571 d!6025))

(declare-fun d!6041 () Bool)

(declare-fun res!22767 () Bool)

(declare-fun e!23869 () Bool)

(assert (=> d!6041 (=> res!22767 e!23869)))

(assert (=> d!6041 (= res!22767 (or (is-Nil!979 (toList!512 lm!252)) (is-Nil!979 (t!3803 (toList!512 lm!252)))))))

(assert (=> d!6041 (= (isStrictlySorted!188 (toList!512 lm!252)) e!23869)))

(declare-fun b!37684 () Bool)

(declare-fun e!23870 () Bool)

(assert (=> b!37684 (= e!23869 e!23870)))

(declare-fun res!22768 () Bool)

(assert (=> b!37684 (=> (not res!22768) (not e!23870))))

(assert (=> b!37684 (= res!22768 (bvslt (_1!719 (h!1546 (toList!512 lm!252))) (_1!719 (h!1546 (t!3803 (toList!512 lm!252))))))))

(declare-fun b!37685 () Bool)

(assert (=> b!37685 (= e!23870 (isStrictlySorted!188 (t!3803 (toList!512 lm!252))))))

(assert (= (and d!6041 (not res!22767)) b!37684))

(assert (= (and b!37684 res!22768) b!37685))

(declare-fun m!30445 () Bool)

(assert (=> b!37685 m!30445))

(assert (=> d!5997 d!6041))

(assert (=> b!37573 d!6039))

(assert (=> b!37573 d!6025))

(declare-fun b!37686 () Bool)

(declare-fun e!23871 () Bool)

(declare-fun tp!5565 () Bool)

(assert (=> b!37686 (= e!23871 (and tp_is_empty!1675 tp!5565))))

(assert (=> b!37596 (= tp!5558 e!23871)))

(assert (= (and b!37596 (is-Cons!978 (t!3803 (toList!512 lm!252)))) b!37686))

(declare-fun b_lambda!1989 () Bool)

(assert (= b_lambda!1985 (or (and start!5042 b_free!1349) b_lambda!1989)))

(push 1)

(assert (not b!37686))

(assert tp_is_empty!1675)

(assert (not d!6039))

(assert (not b_lambda!1975))

(assert (not b!37685))

(assert (not b_lambda!1967))

(assert b_and!2309)

(assert (not b_lambda!1989))

(assert (not b!37659))

(assert (not b!37662))

(assert (not b_next!1349))

(assert (not d!6033))

(assert (not b!37655))

(assert (not b!37630))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2309)

(assert (not b_next!1349))

(check-sat)

