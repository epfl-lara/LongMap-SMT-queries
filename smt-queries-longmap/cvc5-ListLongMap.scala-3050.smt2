; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42996 () Bool)

(assert start!42996)

(declare-fun b_free!12109 () Bool)

(declare-fun b_next!12109 () Bool)

(assert (=> start!42996 (= b_free!12109 (not b_next!12109))))

(declare-fun tp!42430 () Bool)

(declare-fun b_and!20819 () Bool)

(assert (=> start!42996 (= tp!42430 b_and!20819)))

(declare-datatypes ((B!1058 0))(
  ( (B!1059 (val!6813 Int)) )
))
(declare-datatypes ((tuple2!8998 0))(
  ( (tuple2!8999 (_1!4510 (_ BitVec 64)) (_2!4510 B!1058)) )
))
(declare-datatypes ((List!9056 0))(
  ( (Nil!9053) (Cons!9052 (h!9908 tuple2!8998) (t!15219 List!9056)) )
))
(declare-datatypes ((ListLongMap!7911 0))(
  ( (ListLongMap!7912 (toList!3971 List!9056)) )
))
(declare-fun lm!215 () ListLongMap!7911)

(declare-fun lt!217575 () tuple2!8998)

(declare-fun p!166 () Int)

(declare-fun b!477719 () Bool)

(declare-fun e!280734 () Bool)

(declare-fun forall!200 (List!9056 Int) Bool)

(declare-fun +!1768 (ListLongMap!7911 tuple2!8998) ListLongMap!7911)

(assert (=> b!477719 (= e!280734 (not (forall!200 (toList!3971 (+!1768 lm!215 lt!217575)) p!166)))))

(declare-fun res!285107 () Bool)

(declare-fun e!280733 () Bool)

(assert (=> start!42996 (=> (not res!285107) (not e!280733))))

(assert (=> start!42996 (= res!285107 (forall!200 (toList!3971 lm!215) p!166))))

(assert (=> start!42996 e!280733))

(declare-fun e!280735 () Bool)

(declare-fun inv!15503 (ListLongMap!7911) Bool)

(assert (=> start!42996 (and (inv!15503 lm!215) e!280735)))

(assert (=> start!42996 tp!42430))

(declare-fun tp_is_empty!13531 () Bool)

(assert (=> start!42996 tp_is_empty!13531))

(assert (=> start!42996 true))

(declare-fun b!477717 () Bool)

(assert (=> b!477717 (= e!280733 e!280734)))

(declare-fun res!285108 () Bool)

(assert (=> b!477717 (=> (not res!285108) (not e!280734))))

(declare-fun dynLambda!947 (Int tuple2!8998) Bool)

(assert (=> b!477717 (= res!285108 (dynLambda!947 p!166 lt!217575))))

(declare-fun a!501 () (_ BitVec 64))

(declare-fun b!85 () B!1058)

(assert (=> b!477717 (= lt!217575 (tuple2!8999 a!501 b!85))))

(declare-fun b!477718 () Bool)

(declare-fun res!285109 () Bool)

(assert (=> b!477718 (=> (not res!285109) (not e!280734))))

(declare-fun isEmpty!609 (ListLongMap!7911) Bool)

(assert (=> b!477718 (= res!285109 (isEmpty!609 lm!215))))

(declare-fun b!477720 () Bool)

(declare-fun tp!42429 () Bool)

(assert (=> b!477720 (= e!280735 tp!42429)))

(assert (= (and start!42996 res!285107) b!477717))

(assert (= (and b!477717 res!285108) b!477718))

(assert (= (and b!477718 res!285109) b!477719))

(assert (= start!42996 b!477720))

(declare-fun b_lambda!10707 () Bool)

(assert (=> (not b_lambda!10707) (not b!477717)))

(declare-fun t!15218 () Bool)

(declare-fun tb!4117 () Bool)

(assert (=> (and start!42996 (= p!166 p!166) t!15218) tb!4117))

(declare-fun result!7685 () Bool)

(assert (=> tb!4117 (= result!7685 true)))

(assert (=> b!477717 t!15218))

(declare-fun b_and!20821 () Bool)

(assert (= b_and!20819 (and (=> t!15218 result!7685) b_and!20821)))

(declare-fun m!460153 () Bool)

(assert (=> b!477719 m!460153))

(declare-fun m!460155 () Bool)

(assert (=> b!477719 m!460155))

(declare-fun m!460157 () Bool)

(assert (=> start!42996 m!460157))

(declare-fun m!460159 () Bool)

(assert (=> start!42996 m!460159))

(declare-fun m!460161 () Bool)

(assert (=> b!477717 m!460161))

(declare-fun m!460163 () Bool)

(assert (=> b!477718 m!460163))

(push 1)

(assert tp_is_empty!13531)

(assert b_and!20821)

(assert (not b!477718))

(assert (not b_next!12109))

(assert (not b_lambda!10707))

(assert (not b!477720))

(assert (not b!477719))

(assert (not start!42996))

(check-sat)

(pop 1)

(push 1)

(assert b_and!20821)

(assert (not b_next!12109))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!10713 () Bool)

(assert (= b_lambda!10707 (or (and start!42996 b_free!12109) b_lambda!10713)))

(push 1)

(assert tp_is_empty!13531)

(assert b_and!20821)

(assert (not b!477718))

(assert (not b_next!12109))

(assert (not b!477720))

(assert (not b!477719))

(assert (not start!42996))

(assert (not b_lambda!10713))

(check-sat)

(pop 1)

(push 1)

(assert b_and!20821)

(assert (not b_next!12109))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76373 () Bool)

(declare-fun isEmpty!612 (List!9056) Bool)

(assert (=> d!76373 (= (isEmpty!609 lm!215) (isEmpty!612 (toList!3971 lm!215)))))

(declare-fun bs!15186 () Bool)

(assert (= bs!15186 d!76373))

(declare-fun m!460189 () Bool)

(assert (=> bs!15186 m!460189))

(assert (=> b!477718 d!76373))

(declare-fun d!76375 () Bool)

(declare-fun res!285132 () Bool)

(declare-fun e!280758 () Bool)

(assert (=> d!76375 (=> res!285132 e!280758)))

(assert (=> d!76375 (= res!285132 (is-Nil!9053 (toList!3971 lm!215)))))

(assert (=> d!76375 (= (forall!200 (toList!3971 lm!215) p!166) e!280758)))

(declare-fun b!477749 () Bool)

(declare-fun e!280759 () Bool)

(assert (=> b!477749 (= e!280758 e!280759)))

(declare-fun res!285133 () Bool)

(assert (=> b!477749 (=> (not res!285133) (not e!280759))))

(assert (=> b!477749 (= res!285133 (dynLambda!947 p!166 (h!9908 (toList!3971 lm!215))))))

(declare-fun b!477750 () Bool)

(assert (=> b!477750 (= e!280759 (forall!200 (t!15219 (toList!3971 lm!215)) p!166))))

(assert (= (and d!76375 (not res!285132)) b!477749))

(assert (= (and b!477749 res!285133) b!477750))

(declare-fun b_lambda!10719 () Bool)

(assert (=> (not b_lambda!10719) (not b!477749)))

(declare-fun t!15227 () Bool)

(declare-fun tb!4123 () Bool)

(assert (=> (and start!42996 (= p!166 p!166) t!15227) tb!4123))

(declare-fun result!7691 () Bool)

(assert (=> tb!4123 (= result!7691 true)))

(assert (=> b!477749 t!15227))

(declare-fun b_and!20831 () Bool)

(assert (= b_and!20821 (and (=> t!15227 result!7691) b_and!20831)))

(declare-fun m!460191 () Bool)

(assert (=> b!477749 m!460191))

(declare-fun m!460193 () Bool)

(assert (=> b!477750 m!460193))

(assert (=> start!42996 d!76375))

(declare-fun d!76379 () Bool)

(declare-fun isStrictlySorted!390 (List!9056) Bool)

(assert (=> d!76379 (= (inv!15503 lm!215) (isStrictlySorted!390 (toList!3971 lm!215)))))

(declare-fun bs!15188 () Bool)

(assert (= bs!15188 d!76379))

(declare-fun m!460197 () Bool)

(assert (=> bs!15188 m!460197))

(assert (=> start!42996 d!76379))

(declare-fun d!76385 () Bool)

(declare-fun res!285134 () Bool)

(declare-fun e!280760 () Bool)

(assert (=> d!76385 (=> res!285134 e!280760)))

(assert (=> d!76385 (= res!285134 (is-Nil!9053 (toList!3971 (+!1768 lm!215 lt!217575))))))

(assert (=> d!76385 (= (forall!200 (toList!3971 (+!1768 lm!215 lt!217575)) p!166) e!280760)))

(declare-fun b!477751 () Bool)

(declare-fun e!280761 () Bool)

(assert (=> b!477751 (= e!280760 e!280761)))

(declare-fun res!285135 () Bool)

(assert (=> b!477751 (=> (not res!285135) (not e!280761))))

(assert (=> b!477751 (= res!285135 (dynLambda!947 p!166 (h!9908 (toList!3971 (+!1768 lm!215 lt!217575)))))))

(declare-fun b!477752 () Bool)

(assert (=> b!477752 (= e!280761 (forall!200 (t!15219 (toList!3971 (+!1768 lm!215 lt!217575))) p!166))))

(assert (= (and d!76385 (not res!285134)) b!477751))

(assert (= (and b!477751 res!285135) b!477752))

(declare-fun b_lambda!10721 () Bool)

(assert (=> (not b_lambda!10721) (not b!477751)))

(declare-fun t!15229 () Bool)

(declare-fun tb!4125 () Bool)

(assert (=> (and start!42996 (= p!166 p!166) t!15229) tb!4125))

(declare-fun result!7693 () Bool)

(assert (=> tb!4125 (= result!7693 true)))

(assert (=> b!477751 t!15229))

(declare-fun b_and!20833 () Bool)

(assert (= b_and!20831 (and (=> t!15229 result!7693) b_and!20833)))

(declare-fun m!460201 () Bool)

(assert (=> b!477751 m!460201))

(declare-fun m!460203 () Bool)

(assert (=> b!477752 m!460203))

(assert (=> b!477719 d!76385))

(declare-fun d!76389 () Bool)

(declare-fun e!280780 () Bool)

(assert (=> d!76389 e!280780))

(declare-fun res!285157 () Bool)

(assert (=> d!76389 (=> (not res!285157) (not e!280780))))

(declare-fun lt!217591 () ListLongMap!7911)

(declare-fun contains!2574 (ListLongMap!7911 (_ BitVec 64)) Bool)

(assert (=> d!76389 (= res!285157 (contains!2574 lt!217591 (_1!4510 lt!217575)))))

(declare-fun lt!217590 () List!9056)

(assert (=> d!76389 (= lt!217591 (ListLongMap!7912 lt!217590))))

(declare-datatypes ((Unit!14049 0))(
  ( (Unit!14050) )
))
(declare-fun lt!217593 () Unit!14049)

(declare-fun lt!217592 () Unit!14049)

(assert (=> d!76389 (= lt!217593 lt!217592)))

(declare-datatypes ((Option!395 0))(
  ( (Some!394 (v!9098 B!1058)) (None!393) )
))
(declare-fun getValueByKey!389 (List!9056 (_ BitVec 64)) Option!395)

(assert (=> d!76389 (= (getValueByKey!389 lt!217590 (_1!4510 lt!217575)) (Some!394 (_2!4510 lt!217575)))))

(declare-fun lemmaContainsTupThenGetReturnValue!211 (List!9056 (_ BitVec 64) B!1058) Unit!14049)

(assert (=> d!76389 (= lt!217592 (lemmaContainsTupThenGetReturnValue!211 lt!217590 (_1!4510 lt!217575) (_2!4510 lt!217575)))))

(declare-fun insertStrictlySorted!214 (List!9056 (_ BitVec 64) B!1058) List!9056)

(assert (=> d!76389 (= lt!217590 (insertStrictlySorted!214 (toList!3971 lm!215) (_1!4510 lt!217575) (_2!4510 lt!217575)))))

(assert (=> d!76389 (= (+!1768 lm!215 lt!217575) lt!217591)))

(declare-fun b!477773 () Bool)

(declare-fun res!285156 () Bool)

(assert (=> b!477773 (=> (not res!285156) (not e!280780))))

(assert (=> b!477773 (= res!285156 (= (getValueByKey!389 (toList!3971 lt!217591) (_1!4510 lt!217575)) (Some!394 (_2!4510 lt!217575))))))

(declare-fun b!477774 () Bool)

(declare-fun contains!2576 (List!9056 tuple2!8998) Bool)

(assert (=> b!477774 (= e!280780 (contains!2576 (toList!3971 lt!217591) lt!217575))))

(assert (= (and d!76389 res!285157) b!477773))

(assert (= (and b!477773 res!285156) b!477774))

(declare-fun m!460225 () Bool)

(assert (=> d!76389 m!460225))

(declare-fun m!460227 () Bool)

(assert (=> d!76389 m!460227))

(declare-fun m!460229 () Bool)

(assert (=> d!76389 m!460229))

(declare-fun m!460231 () Bool)

(assert (=> d!76389 m!460231))

(declare-fun m!460233 () Bool)

(assert (=> b!477773 m!460233))

(declare-fun m!460235 () Bool)

(assert (=> b!477774 m!460235))

(assert (=> b!477719 d!76389))

(declare-fun b!477779 () Bool)

(declare-fun e!280783 () Bool)

(declare-fun tp!42445 () Bool)

(assert (=> b!477779 (= e!280783 (and tp_is_empty!13531 tp!42445))))

(assert (=> b!477720 (= tp!42429 e!280783)))

(assert (= (and b!477720 (is-Cons!9052 (toList!3971 lm!215))) b!477779))

(declare-fun b_lambda!10731 () Bool)

(assert (= b_lambda!10719 (or (and start!42996 b_free!12109) b_lambda!10731)))

(declare-fun b_lambda!10733 () Bool)

(assert (= b_lambda!10721 (or (and start!42996 b_free!12109) b_lambda!10733)))

(push 1)

(assert (not d!76379))

(assert b_and!20833)

(assert (not d!76373))

(assert (not b!477750))

(assert (not b!477752))

(assert (not b_lambda!10733))

(assert (not b_lambda!10731))

(assert (not b!477773))

(assert tp_is_empty!13531)

(assert (not b!477779))

(assert (not b_next!12109))

(assert (not b_lambda!10713))

(assert (not b!477774))

(assert (not d!76389))

(check-sat)

(pop 1)

(push 1)

(assert b_and!20833)

(assert (not b_next!12109))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76405 () Bool)

(declare-fun e!280806 () Bool)

(assert (=> d!76405 e!280806))

(declare-fun res!285176 () Bool)

(assert (=> d!76405 (=> res!285176 e!280806)))

(declare-fun lt!217636 () Bool)

(assert (=> d!76405 (= res!285176 (not lt!217636))))

(declare-fun lt!217634 () Bool)

(assert (=> d!76405 (= lt!217636 lt!217634)))

(declare-fun lt!217637 () Unit!14049)

(declare-fun e!280807 () Unit!14049)

(assert (=> d!76405 (= lt!217637 e!280807)))

(declare-fun c!57561 () Bool)

(assert (=> d!76405 (= c!57561 lt!217634)))

(declare-fun containsKey!351 (List!9056 (_ BitVec 64)) Bool)

(assert (=> d!76405 (= lt!217634 (containsKey!351 (toList!3971 lt!217591) (_1!4510 lt!217575)))))

(assert (=> d!76405 (= (contains!2574 lt!217591 (_1!4510 lt!217575)) lt!217636)))

(declare-fun b!477816 () Bool)

(declare-fun lt!217635 () Unit!14049)

(assert (=> b!477816 (= e!280807 lt!217635)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!299 (List!9056 (_ BitVec 64)) Unit!14049)

(assert (=> b!477816 (= lt!217635 (lemmaContainsKeyImpliesGetValueByKeyDefined!299 (toList!3971 lt!217591) (_1!4510 lt!217575)))))

(declare-fun isDefined!300 (Option!395) Bool)

(assert (=> b!477816 (isDefined!300 (getValueByKey!389 (toList!3971 lt!217591) (_1!4510 lt!217575)))))

(declare-fun b!477817 () Bool)

(declare-fun Unit!14055 () Unit!14049)

(assert (=> b!477817 (= e!280807 Unit!14055)))

(declare-fun b!477818 () Bool)

(assert (=> b!477818 (= e!280806 (isDefined!300 (getValueByKey!389 (toList!3971 lt!217591) (_1!4510 lt!217575))))))

(assert (= (and d!76405 c!57561) b!477816))

(assert (= (and d!76405 (not c!57561)) b!477817))

(assert (= (and d!76405 (not res!285176)) b!477818))

(declare-fun m!460265 () Bool)

(assert (=> d!76405 m!460265))

(declare-fun m!460269 () Bool)

(assert (=> b!477816 m!460269))

(assert (=> b!477816 m!460233))

(assert (=> b!477816 m!460233))

(declare-fun m!460273 () Bool)

(assert (=> b!477816 m!460273))

(assert (=> b!477818 m!460233))

(assert (=> b!477818 m!460233))

(assert (=> b!477818 m!460273))

(assert (=> d!76389 d!76405))

(declare-fun b!477839 () Bool)

(declare-fun e!280818 () Option!395)

(declare-fun e!280819 () Option!395)

(assert (=> b!477839 (= e!280818 e!280819)))

(declare-fun c!57572 () Bool)

(assert (=> b!477839 (= c!57572 (and (is-Cons!9052 lt!217590) (not (= (_1!4510 (h!9908 lt!217590)) (_1!4510 lt!217575)))))))

(declare-fun d!76409 () Bool)

(declare-fun c!57571 () Bool)

(assert (=> d!76409 (= c!57571 (and (is-Cons!9052 lt!217590) (= (_1!4510 (h!9908 lt!217590)) (_1!4510 lt!217575))))))

(assert (=> d!76409 (= (getValueByKey!389 lt!217590 (_1!4510 lt!217575)) e!280818)))

(declare-fun b!477840 () Bool)

(assert (=> b!477840 (= e!280819 (getValueByKey!389 (t!15219 lt!217590) (_1!4510 lt!217575)))))

(declare-fun b!477838 () Bool)

(assert (=> b!477838 (= e!280818 (Some!394 (_2!4510 (h!9908 lt!217590))))))

(declare-fun b!477841 () Bool)

(assert (=> b!477841 (= e!280819 None!393)))

(assert (= (and d!76409 c!57571) b!477838))

(assert (= (and d!76409 (not c!57571)) b!477839))

(assert (= (and b!477839 c!57572) b!477840))

(assert (= (and b!477839 (not c!57572)) b!477841))

(declare-fun m!460277 () Bool)

(assert (=> b!477840 m!460277))

(assert (=> d!76389 d!76409))

(declare-fun d!76413 () Bool)

(assert (=> d!76413 (= (getValueByKey!389 lt!217590 (_1!4510 lt!217575)) (Some!394 (_2!4510 lt!217575)))))

(declare-fun lt!217647 () Unit!14049)

(declare-fun choose!1369 (List!9056 (_ BitVec 64) B!1058) Unit!14049)

(assert (=> d!76413 (= lt!217647 (choose!1369 lt!217590 (_1!4510 lt!217575) (_2!4510 lt!217575)))))

(declare-fun e!280827 () Bool)

(assert (=> d!76413 e!280827))

(declare-fun res!285188 () Bool)

(assert (=> d!76413 (=> (not res!285188) (not e!280827))))

(assert (=> d!76413 (= res!285188 (isStrictlySorted!390 lt!217590))))

(assert (=> d!76413 (= (lemmaContainsTupThenGetReturnValue!211 lt!217590 (_1!4510 lt!217575) (_2!4510 lt!217575)) lt!217647)))

(declare-fun b!477856 () Bool)

(declare-fun res!285189 () Bool)

(assert (=> b!477856 (=> (not res!285189) (not e!280827))))

(assert (=> b!477856 (= res!285189 (containsKey!351 lt!217590 (_1!4510 lt!217575)))))

(declare-fun b!477857 () Bool)

(assert (=> b!477857 (= e!280827 (contains!2576 lt!217590 (tuple2!8999 (_1!4510 lt!217575) (_2!4510 lt!217575))))))

(assert (= (and d!76413 res!285188) b!477856))

(assert (= (and b!477856 res!285189) b!477857))

(assert (=> d!76413 m!460227))

(declare-fun m!460285 () Bool)

(assert (=> d!76413 m!460285))

(declare-fun m!460289 () Bool)

(assert (=> d!76413 m!460289))

(declare-fun m!460291 () Bool)

(assert (=> b!477856 m!460291))

(declare-fun m!460295 () Bool)

(assert (=> b!477857 m!460295))

(assert (=> d!76389 d!76413))

(declare-fun bm!30806 () Bool)

(declare-fun call!30809 () List!9056)

(declare-fun call!30810 () List!9056)

(assert (=> bm!30806 (= call!30809 call!30810)))

(declare-fun b!477932 () Bool)

(declare-fun res!285213 () Bool)

(declare-fun e!280874 () Bool)

(assert (=> b!477932 (=> (not res!285213) (not e!280874))))

(declare-fun lt!217656 () List!9056)

(assert (=> b!477932 (= res!285213 (containsKey!351 lt!217656 (_1!4510 lt!217575)))))

(declare-fun e!280875 () List!9056)

(declare-fun c!57604 () Bool)

(declare-fun c!57603 () Bool)

(declare-fun b!477933 () Bool)

(assert (=> b!477933 (= e!280875 (ite c!57603 (t!15219 (toList!3971 lm!215)) (ite c!57604 (Cons!9052 (h!9908 (toList!3971 lm!215)) (t!15219 (toList!3971 lm!215))) Nil!9053)))))

(declare-fun b!477934 () Bool)

(declare-fun e!280871 () List!9056)

(assert (=> b!477934 (= e!280871 call!30809)))

(declare-fun b!477935 () Bool)

(assert (=> b!477935 (= e!280871 call!30809)))

(declare-fun b!477936 () Bool)

(assert (=> b!477936 (= e!280875 (insertStrictlySorted!214 (t!15219 (toList!3971 lm!215)) (_1!4510 lt!217575) (_2!4510 lt!217575)))))

(declare-fun b!477937 () Bool)

(assert (=> b!477937 (= e!280874 (contains!2576 lt!217656 (tuple2!8999 (_1!4510 lt!217575) (_2!4510 lt!217575))))))

(declare-fun b!477938 () Bool)

(declare-fun e!280872 () List!9056)

(declare-fun call!30811 () List!9056)

(assert (=> b!477938 (= e!280872 call!30811)))

(declare-fun d!76419 () Bool)

(assert (=> d!76419 e!280874))

(declare-fun res!285212 () Bool)

(assert (=> d!76419 (=> (not res!285212) (not e!280874))))

(assert (=> d!76419 (= res!285212 (isStrictlySorted!390 lt!217656))))

(assert (=> d!76419 (= lt!217656 e!280872)))

(declare-fun c!57602 () Bool)

(assert (=> d!76419 (= c!57602 (and (is-Cons!9052 (toList!3971 lm!215)) (bvslt (_1!4510 (h!9908 (toList!3971 lm!215))) (_1!4510 lt!217575))))))

(assert (=> d!76419 (isStrictlySorted!390 (toList!3971 lm!215))))

(assert (=> d!76419 (= (insertStrictlySorted!214 (toList!3971 lm!215) (_1!4510 lt!217575) (_2!4510 lt!217575)) lt!217656)))

(declare-fun b!477939 () Bool)

(declare-fun e!280873 () List!9056)

(assert (=> b!477939 (= e!280873 call!30810)))

(declare-fun b!477940 () Bool)

(assert (=> b!477940 (= c!57604 (and (is-Cons!9052 (toList!3971 lm!215)) (bvsgt (_1!4510 (h!9908 (toList!3971 lm!215))) (_1!4510 lt!217575))))))

(assert (=> b!477940 (= e!280873 e!280871)))

(declare-fun bm!30807 () Bool)

(assert (=> bm!30807 (= call!30810 call!30811)))

(declare-fun b!477941 () Bool)

(assert (=> b!477941 (= e!280872 e!280873)))

(assert (=> b!477941 (= c!57603 (and (is-Cons!9052 (toList!3971 lm!215)) (= (_1!4510 (h!9908 (toList!3971 lm!215))) (_1!4510 lt!217575))))))

(declare-fun bm!30808 () Bool)

(declare-fun $colon$colon!113 (List!9056 tuple2!8998) List!9056)

(assert (=> bm!30808 (= call!30811 ($colon$colon!113 e!280875 (ite c!57602 (h!9908 (toList!3971 lm!215)) (tuple2!8999 (_1!4510 lt!217575) (_2!4510 lt!217575)))))))

(declare-fun c!57601 () Bool)

(assert (=> bm!30808 (= c!57601 c!57602)))

(assert (= (and d!76419 c!57602) b!477938))

(assert (= (and d!76419 (not c!57602)) b!477941))

(assert (= (and b!477941 c!57603) b!477939))

(assert (= (and b!477941 (not c!57603)) b!477940))

(assert (= (and b!477940 c!57604) b!477935))

(assert (= (and b!477940 (not c!57604)) b!477934))

(assert (= (or b!477935 b!477934) bm!30806))

(assert (= (or b!477939 bm!30806) bm!30807))

(assert (= (or b!477938 bm!30807) bm!30808))

(assert (= (and bm!30808 c!57601) b!477936))

(assert (= (and bm!30808 (not c!57601)) b!477933))

(assert (= (and d!76419 res!285212) b!477932))

(assert (= (and b!477932 res!285213) b!477937))

(declare-fun m!460313 () Bool)

(assert (=> b!477932 m!460313))

(declare-fun m!460315 () Bool)

(assert (=> d!76419 m!460315))

(assert (=> d!76419 m!460197))

(declare-fun m!460321 () Bool)

(assert (=> bm!30808 m!460321))

(declare-fun m!460323 () Bool)

(assert (=> b!477937 m!460323))

(declare-fun m!460325 () Bool)

(assert (=> b!477936 m!460325))

(assert (=> d!76389 d!76419))

(declare-fun d!76431 () Bool)

(declare-fun res!285214 () Bool)

(declare-fun e!280876 () Bool)

(assert (=> d!76431 (=> res!285214 e!280876)))

(assert (=> d!76431 (= res!285214 (is-Nil!9053 (t!15219 (toList!3971 lm!215))))))

(assert (=> d!76431 (= (forall!200 (t!15219 (toList!3971 lm!215)) p!166) e!280876)))

(declare-fun b!477942 () Bool)

(declare-fun e!280877 () Bool)

(assert (=> b!477942 (= e!280876 e!280877)))

(declare-fun res!285215 () Bool)

(assert (=> b!477942 (=> (not res!285215) (not e!280877))))

(assert (=> b!477942 (= res!285215 (dynLambda!947 p!166 (h!9908 (t!15219 (toList!3971 lm!215)))))))

(declare-fun b!477943 () Bool)

(assert (=> b!477943 (= e!280877 (forall!200 (t!15219 (t!15219 (toList!3971 lm!215))) p!166))))

(assert (= (and d!76431 (not res!285214)) b!477942))

(assert (= (and b!477942 res!285215) b!477943))

(declare-fun b_lambda!10745 () Bool)

(assert (=> (not b_lambda!10745) (not b!477942)))

(declare-fun t!15241 () Bool)

(declare-fun tb!4137 () Bool)

(assert (=> (and start!42996 (= p!166 p!166) t!15241) tb!4137))

(declare-fun result!7711 () Bool)

(assert (=> tb!4137 (= result!7711 true)))

(assert (=> b!477942 t!15241))

(declare-fun b_and!20845 () Bool)

(assert (= b_and!20833 (and (=> t!15241 result!7711) b_and!20845)))

(declare-fun m!460327 () Bool)

(assert (=> b!477942 m!460327))

(declare-fun m!460329 () Bool)

(assert (=> b!477943 m!460329))

(assert (=> b!477750 d!76431))

(declare-fun d!76435 () Bool)

(assert (=> d!76435 (= (isEmpty!612 (toList!3971 lm!215)) (is-Nil!9053 (toList!3971 lm!215)))))

(assert (=> d!76373 d!76435))

(declare-fun d!76437 () Bool)

(declare-fun lt!217670 () Bool)

(declare-fun content!211 (List!9056) (Set tuple2!8998))

(assert (=> d!76437 (= lt!217670 (set.member lt!217575 (content!211 (toList!3971 lt!217591))))))

(declare-fun e!280895 () Bool)

(assert (=> d!76437 (= lt!217670 e!280895)))

(declare-fun res!285230 () Bool)

(assert (=> d!76437 (=> (not res!285230) (not e!280895))))

(assert (=> d!76437 (= res!285230 (is-Cons!9052 (toList!3971 lt!217591)))))

(assert (=> d!76437 (= (contains!2576 (toList!3971 lt!217591) lt!217575) lt!217670)))

(declare-fun b!477962 () Bool)

(declare-fun e!280894 () Bool)

(assert (=> b!477962 (= e!280895 e!280894)))

(declare-fun res!285231 () Bool)

(assert (=> b!477962 (=> res!285231 e!280894)))

(assert (=> b!477962 (= res!285231 (= (h!9908 (toList!3971 lt!217591)) lt!217575))))

(declare-fun b!477963 () Bool)

(assert (=> b!477963 (= e!280894 (contains!2576 (t!15219 (toList!3971 lt!217591)) lt!217575))))

(assert (= (and d!76437 res!285230) b!477962))

(assert (= (and b!477962 (not res!285231)) b!477963))

(declare-fun m!460341 () Bool)

(assert (=> d!76437 m!460341))

(declare-fun m!460343 () Bool)

(assert (=> d!76437 m!460343))

(declare-fun m!460345 () Bool)

(assert (=> b!477963 m!460345))

(assert (=> b!477774 d!76437))

(declare-fun d!76443 () Bool)

(declare-fun res!285232 () Bool)

(declare-fun e!280896 () Bool)

(assert (=> d!76443 (=> res!285232 e!280896)))

(assert (=> d!76443 (= res!285232 (is-Nil!9053 (t!15219 (toList!3971 (+!1768 lm!215 lt!217575)))))))

(assert (=> d!76443 (= (forall!200 (t!15219 (toList!3971 (+!1768 lm!215 lt!217575))) p!166) e!280896)))

(declare-fun b!477964 () Bool)

(declare-fun e!280897 () Bool)

(assert (=> b!477964 (= e!280896 e!280897)))

(declare-fun res!285233 () Bool)

(assert (=> b!477964 (=> (not res!285233) (not e!280897))))

(assert (=> b!477964 (= res!285233 (dynLambda!947 p!166 (h!9908 (t!15219 (toList!3971 (+!1768 lm!215 lt!217575))))))))

(declare-fun b!477965 () Bool)

(assert (=> b!477965 (= e!280897 (forall!200 (t!15219 (t!15219 (toList!3971 (+!1768 lm!215 lt!217575)))) p!166))))

(assert (= (and d!76443 (not res!285232)) b!477964))

(assert (= (and b!477964 res!285233) b!477965))

(declare-fun b_lambda!10749 () Bool)

(assert (=> (not b_lambda!10749) (not b!477964)))

(declare-fun t!15245 () Bool)

(declare-fun tb!4141 () Bool)

(assert (=> (and start!42996 (= p!166 p!166) t!15245) tb!4141))

(declare-fun result!7715 () Bool)

(assert (=> tb!4141 (= result!7715 true)))

(assert (=> b!477964 t!15245))

(declare-fun b_and!20849 () Bool)

(assert (= b_and!20845 (and (=> t!15245 result!7715) b_and!20849)))

(declare-fun m!460349 () Bool)

(assert (=> b!477964 m!460349))

(declare-fun m!460353 () Bool)

(assert (=> b!477965 m!460353))

(assert (=> b!477752 d!76443))

(declare-fun b!477970 () Bool)

(declare-fun e!280900 () Option!395)

(declare-fun e!280901 () Option!395)

(assert (=> b!477970 (= e!280900 e!280901)))

(declare-fun c!57609 () Bool)

(assert (=> b!477970 (= c!57609 (and (is-Cons!9052 (toList!3971 lt!217591)) (not (= (_1!4510 (h!9908 (toList!3971 lt!217591))) (_1!4510 lt!217575)))))))

(declare-fun d!76445 () Bool)

(declare-fun c!57608 () Bool)

(assert (=> d!76445 (= c!57608 (and (is-Cons!9052 (toList!3971 lt!217591)) (= (_1!4510 (h!9908 (toList!3971 lt!217591))) (_1!4510 lt!217575))))))

(assert (=> d!76445 (= (getValueByKey!389 (toList!3971 lt!217591) (_1!4510 lt!217575)) e!280900)))

(declare-fun b!477971 () Bool)

(assert (=> b!477971 (= e!280901 (getValueByKey!389 (t!15219 (toList!3971 lt!217591)) (_1!4510 lt!217575)))))

(declare-fun b!477969 () Bool)

(assert (=> b!477969 (= e!280900 (Some!394 (_2!4510 (h!9908 (toList!3971 lt!217591)))))))

(declare-fun b!477972 () Bool)

(assert (=> b!477972 (= e!280901 None!393)))

(assert (= (and d!76445 c!57608) b!477969))

(assert (= (and d!76445 (not c!57608)) b!477970))

(assert (= (and b!477970 c!57609) b!477971))

(assert (= (and b!477970 (not c!57609)) b!477972))

(declare-fun m!460357 () Bool)

(assert (=> b!477971 m!460357))

(assert (=> b!477773 d!76445))

(declare-fun d!76449 () Bool)

(declare-fun res!285245 () Bool)

(declare-fun e!280917 () Bool)

(assert (=> d!76449 (=> res!285245 e!280917)))

(assert (=> d!76449 (= res!285245 (or (is-Nil!9053 (toList!3971 lm!215)) (is-Nil!9053 (t!15219 (toList!3971 lm!215)))))))

(assert (=> d!76449 (= (isStrictlySorted!390 (toList!3971 lm!215)) e!280917)))

(declare-fun b!477992 () Bool)

(declare-fun e!280918 () Bool)

(assert (=> b!477992 (= e!280917 e!280918)))

(declare-fun res!285246 () Bool)

(assert (=> b!477992 (=> (not res!285246) (not e!280918))))

(assert (=> b!477992 (= res!285246 (bvslt (_1!4510 (h!9908 (toList!3971 lm!215))) (_1!4510 (h!9908 (t!15219 (toList!3971 lm!215))))))))

(declare-fun b!477993 () Bool)

(assert (=> b!477993 (= e!280918 (isStrictlySorted!390 (t!15219 (toList!3971 lm!215))))))

(assert (= (and d!76449 (not res!285245)) b!477992))

(assert (= (and b!477992 res!285246) b!477993))

(declare-fun m!460365 () Bool)

(assert (=> b!477993 m!460365))

(assert (=> d!76379 d!76449))

(declare-fun b!477998 () Bool)

(declare-fun e!280921 () Bool)

(declare-fun tp!42453 () Bool)

(assert (=> b!477998 (= e!280921 (and tp_is_empty!13531 tp!42453))))

(assert (=> b!477779 (= tp!42445 e!280921)))

(assert (= (and b!477779 (is-Cons!9052 (t!15219 (toList!3971 lm!215)))) b!477998))

(declare-fun b_lambda!10755 () Bool)

(assert (= b_lambda!10749 (or (and start!42996 b_free!12109) b_lambda!10755)))

(declare-fun b_lambda!10757 () Bool)

(assert (= b_lambda!10745 (or (and start!42996 b_free!12109) b_lambda!10757)))

(push 1)

(assert (not b_lambda!10757))

(assert (not b!477965))

(assert (not d!76419))

(assert (not b!477998))

(assert (not b!477943))

(assert (not b!477993))

(assert b_and!20849)

(assert (not b!477963))

(assert (not b!477856))

(assert (not d!76413))

(assert (not b_lambda!10733))

(assert (not b!477816))

(assert (not d!76437))

(assert (not b!477937))

(assert (not b_lambda!10713))

(assert (not b!477971))

(assert (not d!76405))

(assert tp_is_empty!13531)

(assert (not b_next!12109))

(assert (not b!477932))

(assert (not b_lambda!10755))

(assert (not b!477818))

(assert (not b!477840))

(assert (not b!477936))

(assert (not bm!30808))

(assert (not b!477857))

(assert (not b_lambda!10731))

(check-sat)

(pop 1)

(push 1)

(assert b_and!20849)

(assert (not b_next!12109))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!76501 () Bool)

(declare-fun res!285294 () Bool)

(declare-fun e!280985 () Bool)

(assert (=> d!76501 (=> res!285294 e!280985)))

(assert (=> d!76501 (= res!285294 (is-Nil!9053 (t!15219 (t!15219 (toList!3971 (+!1768 lm!215 lt!217575))))))))

(assert (=> d!76501 (= (forall!200 (t!15219 (t!15219 (toList!3971 (+!1768 lm!215 lt!217575)))) p!166) e!280985)))

(declare-fun b!478090 () Bool)

(declare-fun e!280986 () Bool)

(assert (=> b!478090 (= e!280985 e!280986)))

(declare-fun res!285295 () Bool)

(assert (=> b!478090 (=> (not res!285295) (not e!280986))))

(assert (=> b!478090 (= res!285295 (dynLambda!947 p!166 (h!9908 (t!15219 (t!15219 (toList!3971 (+!1768 lm!215 lt!217575)))))))))

(declare-fun b!478091 () Bool)

(assert (=> b!478091 (= e!280986 (forall!200 (t!15219 (t!15219 (t!15219 (toList!3971 (+!1768 lm!215 lt!217575))))) p!166))))

(assert (= (and d!76501 (not res!285294)) b!478090))

(assert (= (and b!478090 res!285295) b!478091))

(declare-fun b_lambda!10775 () Bool)

(assert (=> (not b_lambda!10775) (not b!478090)))

(declare-fun t!15256 () Bool)

(declare-fun tb!4151 () Bool)

(assert (=> (and start!42996 (= p!166 p!166) t!15256) tb!4151))

(declare-fun result!7725 () Bool)

(assert (=> tb!4151 (= result!7725 true)))

(assert (=> b!478090 t!15256))

(declare-fun b_and!20859 () Bool)

(assert (= b_and!20849 (and (=> t!15256 result!7725) b_and!20859)))

(declare-fun m!460453 () Bool)

(assert (=> b!478090 m!460453))

(declare-fun m!460455 () Bool)

(assert (=> b!478091 m!460455))

(assert (=> b!477965 d!76501))

(declare-fun d!76503 () Bool)

(declare-fun isEmpty!616 (Option!395) Bool)

(assert (=> d!76503 (= (isDefined!300 (getValueByKey!389 (toList!3971 lt!217591) (_1!4510 lt!217575))) (not (isEmpty!616 (getValueByKey!389 (toList!3971 lt!217591) (_1!4510 lt!217575)))))))

(declare-fun bs!15194 () Bool)

(assert (= bs!15194 d!76503))

(assert (=> bs!15194 m!460233))

(declare-fun m!460457 () Bool)

(assert (=> bs!15194 m!460457))

(assert (=> b!477818 d!76503))

(assert (=> b!477818 d!76445))

(declare-fun d!76505 () Bool)

(declare-fun lt!217688 () Bool)

(assert (=> d!76505 (= lt!217688 (set.member (tuple2!8999 (_1!4510 lt!217575) (_2!4510 lt!217575)) (content!211 lt!217656)))))

(declare-fun e!280988 () Bool)

(assert (=> d!76505 (= lt!217688 e!280988)))

(declare-fun res!285296 () Bool)

(assert (=> d!76505 (=> (not res!285296) (not e!280988))))

(assert (=> d!76505 (= res!285296 (is-Cons!9052 lt!217656))))

(assert (=> d!76505 (= (contains!2576 lt!217656 (tuple2!8999 (_1!4510 lt!217575) (_2!4510 lt!217575))) lt!217688)))

(declare-fun b!478092 () Bool)

(declare-fun e!280987 () Bool)

(assert (=> b!478092 (= e!280988 e!280987)))

(declare-fun res!285297 () Bool)

(assert (=> b!478092 (=> res!285297 e!280987)))

(assert (=> b!478092 (= res!285297 (= (h!9908 lt!217656) (tuple2!8999 (_1!4510 lt!217575) (_2!4510 lt!217575))))))

(declare-fun b!478093 () Bool)

(assert (=> b!478093 (= e!280987 (contains!2576 (t!15219 lt!217656) (tuple2!8999 (_1!4510 lt!217575) (_2!4510 lt!217575))))))

(assert (= (and d!76505 res!285296) b!478092))

(assert (= (and b!478092 (not res!285297)) b!478093))

(declare-fun m!460459 () Bool)

(assert (=> d!76505 m!460459))

(declare-fun m!460461 () Bool)

(assert (=> d!76505 m!460461))

(declare-fun m!460463 () Bool)

(assert (=> b!478093 m!460463))

(assert (=> b!477937 d!76505))

(declare-fun b!478095 () Bool)

(declare-fun e!280989 () Option!395)

(declare-fun e!280990 () Option!395)

(assert (=> b!478095 (= e!280989 e!280990)))

(declare-fun c!57638 () Bool)

(assert (=> b!478095 (= c!57638 (and (is-Cons!9052 (t!15219 lt!217590)) (not (= (_1!4510 (h!9908 (t!15219 lt!217590))) (_1!4510 lt!217575)))))))

(declare-fun d!76507 () Bool)

(declare-fun c!57637 () Bool)

(assert (=> d!76507 (= c!57637 (and (is-Cons!9052 (t!15219 lt!217590)) (= (_1!4510 (h!9908 (t!15219 lt!217590))) (_1!4510 lt!217575))))))

(assert (=> d!76507 (= (getValueByKey!389 (t!15219 lt!217590) (_1!4510 lt!217575)) e!280989)))

(declare-fun b!478096 () Bool)

(assert (=> b!478096 (= e!280990 (getValueByKey!389 (t!15219 (t!15219 lt!217590)) (_1!4510 lt!217575)))))

(declare-fun b!478094 () Bool)

(assert (=> b!478094 (= e!280989 (Some!394 (_2!4510 (h!9908 (t!15219 lt!217590)))))))

(declare-fun b!478097 () Bool)

(assert (=> b!478097 (= e!280990 None!393)))

(assert (= (and d!76507 c!57637) b!478094))

(assert (= (and d!76507 (not c!57637)) b!478095))

(assert (= (and b!478095 c!57638) b!478096))

(assert (= (and b!478095 (not c!57638)) b!478097))

(declare-fun m!460465 () Bool)

(assert (=> b!478096 m!460465))

(assert (=> b!477840 d!76507))

(declare-fun bm!30821 () Bool)

(declare-fun call!30824 () List!9056)

(declare-fun call!30825 () List!9056)

(assert (=> bm!30821 (= call!30824 call!30825)))

(declare-fun b!478098 () Bool)

(declare-fun res!285299 () Bool)

(declare-fun e!280994 () Bool)

(assert (=> b!478098 (=> (not res!285299) (not e!280994))))

(declare-fun lt!217689 () List!9056)

(assert (=> b!478098 (= res!285299 (containsKey!351 lt!217689 (_1!4510 lt!217575)))))

(declare-fun c!57641 () Bool)

(declare-fun b!478099 () Bool)

(declare-fun e!280995 () List!9056)

(declare-fun c!57642 () Bool)

(assert (=> b!478099 (= e!280995 (ite c!57641 (t!15219 (t!15219 (toList!3971 lm!215))) (ite c!57642 (Cons!9052 (h!9908 (t!15219 (toList!3971 lm!215))) (t!15219 (t!15219 (toList!3971 lm!215)))) Nil!9053)))))

(declare-fun b!478100 () Bool)

(declare-fun e!280991 () List!9056)

(assert (=> b!478100 (= e!280991 call!30824)))

(declare-fun b!478101 () Bool)

(assert (=> b!478101 (= e!280991 call!30824)))

(declare-fun b!478102 () Bool)

(assert (=> b!478102 (= e!280995 (insertStrictlySorted!214 (t!15219 (t!15219 (toList!3971 lm!215))) (_1!4510 lt!217575) (_2!4510 lt!217575)))))

(declare-fun b!478103 () Bool)

(assert (=> b!478103 (= e!280994 (contains!2576 lt!217689 (tuple2!8999 (_1!4510 lt!217575) (_2!4510 lt!217575))))))

(declare-fun b!478104 () Bool)

(declare-fun e!280992 () List!9056)

(declare-fun call!30826 () List!9056)

(assert (=> b!478104 (= e!280992 call!30826)))

(declare-fun d!76509 () Bool)

(assert (=> d!76509 e!280994))

(declare-fun res!285298 () Bool)

(assert (=> d!76509 (=> (not res!285298) (not e!280994))))

(assert (=> d!76509 (= res!285298 (isStrictlySorted!390 lt!217689))))

(assert (=> d!76509 (= lt!217689 e!280992)))

(declare-fun c!57640 () Bool)

(assert (=> d!76509 (= c!57640 (and (is-Cons!9052 (t!15219 (toList!3971 lm!215))) (bvslt (_1!4510 (h!9908 (t!15219 (toList!3971 lm!215)))) (_1!4510 lt!217575))))))

(assert (=> d!76509 (isStrictlySorted!390 (t!15219 (toList!3971 lm!215)))))

(assert (=> d!76509 (= (insertStrictlySorted!214 (t!15219 (toList!3971 lm!215)) (_1!4510 lt!217575) (_2!4510 lt!217575)) lt!217689)))

(declare-fun b!478105 () Bool)

(declare-fun e!280993 () List!9056)

(assert (=> b!478105 (= e!280993 call!30825)))

(declare-fun b!478106 () Bool)

(assert (=> b!478106 (= c!57642 (and (is-Cons!9052 (t!15219 (toList!3971 lm!215))) (bvsgt (_1!4510 (h!9908 (t!15219 (toList!3971 lm!215)))) (_1!4510 lt!217575))))))

(assert (=> b!478106 (= e!280993 e!280991)))

(declare-fun bm!30822 () Bool)

(assert (=> bm!30822 (= call!30825 call!30826)))

(declare-fun b!478107 () Bool)

(assert (=> b!478107 (= e!280992 e!280993)))

(assert (=> b!478107 (= c!57641 (and (is-Cons!9052 (t!15219 (toList!3971 lm!215))) (= (_1!4510 (h!9908 (t!15219 (toList!3971 lm!215)))) (_1!4510 lt!217575))))))

(declare-fun bm!30823 () Bool)

(assert (=> bm!30823 (= call!30826 ($colon$colon!113 e!280995 (ite c!57640 (h!9908 (t!15219 (toList!3971 lm!215))) (tuple2!8999 (_1!4510 lt!217575) (_2!4510 lt!217575)))))))

(declare-fun c!57639 () Bool)

(assert (=> bm!30823 (= c!57639 c!57640)))

(assert (= (and d!76509 c!57640) b!478104))

(assert (= (and d!76509 (not c!57640)) b!478107))

(assert (= (and b!478107 c!57641) b!478105))

(assert (= (and b!478107 (not c!57641)) b!478106))

(assert (= (and b!478106 c!57642) b!478101))

(assert (= (and b!478106 (not c!57642)) b!478100))

(assert (= (or b!478101 b!478100) bm!30821))

(assert (= (or b!478105 bm!30821) bm!30822))

(assert (= (or b!478104 bm!30822) bm!30823))

(assert (= (and bm!30823 c!57639) b!478102))

(assert (= (and bm!30823 (not c!57639)) b!478099))

(assert (= (and d!76509 res!285298) b!478098))

(assert (= (and b!478098 res!285299) b!478103))

(declare-fun m!460467 () Bool)

(assert (=> b!478098 m!460467))

(declare-fun m!460469 () Bool)

(assert (=> d!76509 m!460469))

(assert (=> d!76509 m!460365))

(declare-fun m!460471 () Bool)

(assert (=> bm!30823 m!460471))

(declare-fun m!460473 () Bool)

(assert (=> b!478103 m!460473))

(declare-fun m!460475 () Bool)

(assert (=> b!478102 m!460475))

(assert (=> b!477936 d!76509))

(declare-fun d!76511 () Bool)

(declare-fun lt!217690 () Bool)

(assert (=> d!76511 (= lt!217690 (set.member (tuple2!8999 (_1!4510 lt!217575) (_2!4510 lt!217575)) (content!211 lt!217590)))))

(declare-fun e!280997 () Bool)

(assert (=> d!76511 (= lt!217690 e!280997)))

(declare-fun res!285300 () Bool)

(assert (=> d!76511 (=> (not res!285300) (not e!280997))))

(assert (=> d!76511 (= res!285300 (is-Cons!9052 lt!217590))))

(assert (=> d!76511 (= (contains!2576 lt!217590 (tuple2!8999 (_1!4510 lt!217575) (_2!4510 lt!217575))) lt!217690)))

(declare-fun b!478108 () Bool)

(declare-fun e!280996 () Bool)

(assert (=> b!478108 (= e!280997 e!280996)))

(declare-fun res!285301 () Bool)

(assert (=> b!478108 (=> res!285301 e!280996)))

(assert (=> b!478108 (= res!285301 (= (h!9908 lt!217590) (tuple2!8999 (_1!4510 lt!217575) (_2!4510 lt!217575))))))

(declare-fun b!478109 () Bool)

(assert (=> b!478109 (= e!280996 (contains!2576 (t!15219 lt!217590) (tuple2!8999 (_1!4510 lt!217575) (_2!4510 lt!217575))))))

(assert (= (and d!76511 res!285300) b!478108))

(assert (= (and b!478108 (not res!285301)) b!478109))

(declare-fun m!460477 () Bool)

(assert (=> d!76511 m!460477))

(declare-fun m!460479 () Bool)

(assert (=> d!76511 m!460479))

(declare-fun m!460481 () Bool)

(assert (=> b!478109 m!460481))

(assert (=> b!477857 d!76511))

(declare-fun d!76513 () Bool)

(assert (=> d!76513 (isDefined!300 (getValueByKey!389 (toList!3971 lt!217591) (_1!4510 lt!217575)))))

(declare-fun lt!217693 () Unit!14049)

(declare-fun choose!1373 (List!9056 (_ BitVec 64)) Unit!14049)

(assert (=> d!76513 (= lt!217693 (choose!1373 (toList!3971 lt!217591) (_1!4510 lt!217575)))))

(declare-fun e!281000 () Bool)

(assert (=> d!76513 e!281000))

(declare-fun res!285304 () Bool)

(assert (=> d!76513 (=> (not res!285304) (not e!281000))))

(assert (=> d!76513 (= res!285304 (isStrictlySorted!390 (toList!3971 lt!217591)))))

(assert (=> d!76513 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!299 (toList!3971 lt!217591) (_1!4510 lt!217575)) lt!217693)))

(declare-fun b!478112 () Bool)

(assert (=> b!478112 (= e!281000 (containsKey!351 (toList!3971 lt!217591) (_1!4510 lt!217575)))))

(assert (= (and d!76513 res!285304) b!478112))

(assert (=> d!76513 m!460233))

(assert (=> d!76513 m!460233))

(assert (=> d!76513 m!460273))

(declare-fun m!460483 () Bool)

(assert (=> d!76513 m!460483))

(declare-fun m!460485 () Bool)

(assert (=> d!76513 m!460485))

(assert (=> b!478112 m!460265))

(assert (=> b!477816 d!76513))

(assert (=> b!477816 d!76503))

(assert (=> b!477816 d!76445))

(declare-fun d!76515 () Bool)

(declare-fun res!285305 () Bool)

(declare-fun e!281001 () Bool)

(assert (=> d!76515 (=> res!285305 e!281001)))

(assert (=> d!76515 (= res!285305 (or (is-Nil!9053 lt!217656) (is-Nil!9053 (t!15219 lt!217656))))))

(assert (=> d!76515 (= (isStrictlySorted!390 lt!217656) e!281001)))

(declare-fun b!478113 () Bool)

(declare-fun e!281002 () Bool)

(assert (=> b!478113 (= e!281001 e!281002)))

(declare-fun res!285306 () Bool)

(assert (=> b!478113 (=> (not res!285306) (not e!281002))))

(assert (=> b!478113 (= res!285306 (bvslt (_1!4510 (h!9908 lt!217656)) (_1!4510 (h!9908 (t!15219 lt!217656)))))))

(declare-fun b!478114 () Bool)

(assert (=> b!478114 (= e!281002 (isStrictlySorted!390 (t!15219 lt!217656)))))

(assert (= (and d!76515 (not res!285305)) b!478113))

(assert (= (and b!478113 res!285306) b!478114))

(declare-fun m!460487 () Bool)

(assert (=> b!478114 m!460487))

(assert (=> d!76419 d!76515))

(assert (=> d!76419 d!76449))

(declare-fun b!478116 () Bool)

(declare-fun e!281003 () Option!395)

(declare-fun e!281004 () Option!395)

(assert (=> b!478116 (= e!281003 e!281004)))

(declare-fun c!57644 () Bool)

(assert (=> b!478116 (= c!57644 (and (is-Cons!9052 (t!15219 (toList!3971 lt!217591))) (not (= (_1!4510 (h!9908 (t!15219 (toList!3971 lt!217591)))) (_1!4510 lt!217575)))))))

(declare-fun d!76517 () Bool)

(declare-fun c!57643 () Bool)

(assert (=> d!76517 (= c!57643 (and (is-Cons!9052 (t!15219 (toList!3971 lt!217591))) (= (_1!4510 (h!9908 (t!15219 (toList!3971 lt!217591)))) (_1!4510 lt!217575))))))

(assert (=> d!76517 (= (getValueByKey!389 (t!15219 (toList!3971 lt!217591)) (_1!4510 lt!217575)) e!281003)))

(declare-fun b!478117 () Bool)

(assert (=> b!478117 (= e!281004 (getValueByKey!389 (t!15219 (t!15219 (toList!3971 lt!217591))) (_1!4510 lt!217575)))))

(declare-fun b!478115 () Bool)

(assert (=> b!478115 (= e!281003 (Some!394 (_2!4510 (h!9908 (t!15219 (toList!3971 lt!217591))))))))

(declare-fun b!478118 () Bool)

(assert (=> b!478118 (= e!281004 None!393)))

(assert (= (and d!76517 c!57643) b!478115))

(assert (= (and d!76517 (not c!57643)) b!478116))

(assert (= (and b!478116 c!57644) b!478117))

(assert (= (and b!478116 (not c!57644)) b!478118))

(declare-fun m!460489 () Bool)

(assert (=> b!478117 m!460489))

(assert (=> b!477971 d!76517))

(declare-fun d!76519 () Bool)

(declare-fun c!57647 () Bool)

(assert (=> d!76519 (= c!57647 (is-Nil!9053 (toList!3971 lt!217591)))))

(declare-fun e!281007 () (Set tuple2!8998))

(assert (=> d!76519 (= (content!211 (toList!3971 lt!217591)) e!281007)))

(declare-fun b!478123 () Bool)

(assert (=> b!478123 (= e!281007 (as set.empty (Set tuple2!8998)))))

(declare-fun b!478124 () Bool)

(assert (=> b!478124 (= e!281007 (set.union (set.insert (h!9908 (toList!3971 lt!217591)) (as set.empty (Set tuple2!8998))) (content!211 (t!15219 (toList!3971 lt!217591)))))))

(assert (= (and d!76519 c!57647) b!478123))

(assert (= (and d!76519 (not c!57647)) b!478124))

(declare-fun m!460491 () Bool)

(assert (=> b!478124 m!460491))

(declare-fun m!460493 () Bool)

(assert (=> b!478124 m!460493))

(assert (=> d!76437 d!76519))

(declare-fun d!76521 () Bool)

(declare-fun res!285311 () Bool)

(declare-fun e!281012 () Bool)

(assert (=> d!76521 (=> res!285311 e!281012)))

(assert (=> d!76521 (= res!285311 (and (is-Cons!9052 lt!217590) (= (_1!4510 (h!9908 lt!217590)) (_1!4510 lt!217575))))))

(assert (=> d!76521 (= (containsKey!351 lt!217590 (_1!4510 lt!217575)) e!281012)))

(declare-fun b!478129 () Bool)

(declare-fun e!281013 () Bool)

(assert (=> b!478129 (= e!281012 e!281013)))

(declare-fun res!285312 () Bool)

(assert (=> b!478129 (=> (not res!285312) (not e!281013))))

(assert (=> b!478129 (= res!285312 (and (or (not (is-Cons!9052 lt!217590)) (bvsle (_1!4510 (h!9908 lt!217590)) (_1!4510 lt!217575))) (is-Cons!9052 lt!217590) (bvslt (_1!4510 (h!9908 lt!217590)) (_1!4510 lt!217575))))))

(declare-fun b!478130 () Bool)

(assert (=> b!478130 (= e!281013 (containsKey!351 (t!15219 lt!217590) (_1!4510 lt!217575)))))

(assert (= (and d!76521 (not res!285311)) b!478129))

(assert (= (and b!478129 res!285312) b!478130))

(declare-fun m!460495 () Bool)

(assert (=> b!478130 m!460495))

(assert (=> b!477856 d!76521))

(declare-fun d!76523 () Bool)

(declare-fun lt!217694 () Bool)

(assert (=> d!76523 (= lt!217694 (set.member lt!217575 (content!211 (t!15219 (toList!3971 lt!217591)))))))

(declare-fun e!281015 () Bool)

(assert (=> d!76523 (= lt!217694 e!281015)))

(declare-fun res!285313 () Bool)

(assert (=> d!76523 (=> (not res!285313) (not e!281015))))

(assert (=> d!76523 (= res!285313 (is-Cons!9052 (t!15219 (toList!3971 lt!217591))))))

(assert (=> d!76523 (= (contains!2576 (t!15219 (toList!3971 lt!217591)) lt!217575) lt!217694)))

(declare-fun b!478131 () Bool)

(declare-fun e!281014 () Bool)

(assert (=> b!478131 (= e!281015 e!281014)))

(declare-fun res!285314 () Bool)

(assert (=> b!478131 (=> res!285314 e!281014)))

(assert (=> b!478131 (= res!285314 (= (h!9908 (t!15219 (toList!3971 lt!217591))) lt!217575))))

(declare-fun b!478132 () Bool)

(assert (=> b!478132 (= e!281014 (contains!2576 (t!15219 (t!15219 (toList!3971 lt!217591))) lt!217575))))

(assert (= (and d!76523 res!285313) b!478131))

(assert (= (and b!478131 (not res!285314)) b!478132))

(assert (=> d!76523 m!460493))

(declare-fun m!460497 () Bool)

(assert (=> d!76523 m!460497))

(declare-fun m!460499 () Bool)

(assert (=> b!478132 m!460499))

(assert (=> b!477963 d!76523))

(declare-fun d!76525 () Bool)

(declare-fun res!285315 () Bool)

(declare-fun e!281016 () Bool)

(assert (=> d!76525 (=> res!285315 e!281016)))

(assert (=> d!76525 (= res!285315 (and (is-Cons!9052 (toList!3971 lt!217591)) (= (_1!4510 (h!9908 (toList!3971 lt!217591))) (_1!4510 lt!217575))))))

(assert (=> d!76525 (= (containsKey!351 (toList!3971 lt!217591) (_1!4510 lt!217575)) e!281016)))

(declare-fun b!478133 () Bool)

(declare-fun e!281017 () Bool)

(assert (=> b!478133 (= e!281016 e!281017)))

(declare-fun res!285316 () Bool)

(assert (=> b!478133 (=> (not res!285316) (not e!281017))))

(assert (=> b!478133 (= res!285316 (and (or (not (is-Cons!9052 (toList!3971 lt!217591))) (bvsle (_1!4510 (h!9908 (toList!3971 lt!217591))) (_1!4510 lt!217575))) (is-Cons!9052 (toList!3971 lt!217591)) (bvslt (_1!4510 (h!9908 (toList!3971 lt!217591))) (_1!4510 lt!217575))))))

(declare-fun b!478134 () Bool)

(assert (=> b!478134 (= e!281017 (containsKey!351 (t!15219 (toList!3971 lt!217591)) (_1!4510 lt!217575)))))

(assert (= (and d!76525 (not res!285315)) b!478133))

(assert (= (and b!478133 res!285316) b!478134))

(declare-fun m!460501 () Bool)

(assert (=> b!478134 m!460501))

(assert (=> d!76405 d!76525))

(declare-fun d!76527 () Bool)

(declare-fun res!285317 () Bool)

(declare-fun e!281018 () Bool)

(assert (=> d!76527 (=> res!285317 e!281018)))

(assert (=> d!76527 (= res!285317 (and (is-Cons!9052 lt!217656) (= (_1!4510 (h!9908 lt!217656)) (_1!4510 lt!217575))))))

(assert (=> d!76527 (= (containsKey!351 lt!217656 (_1!4510 lt!217575)) e!281018)))

(declare-fun b!478135 () Bool)

(declare-fun e!281019 () Bool)

(assert (=> b!478135 (= e!281018 e!281019)))

(declare-fun res!285318 () Bool)

(assert (=> b!478135 (=> (not res!285318) (not e!281019))))

(assert (=> b!478135 (= res!285318 (and (or (not (is-Cons!9052 lt!217656)) (bvsle (_1!4510 (h!9908 lt!217656)) (_1!4510 lt!217575))) (is-Cons!9052 lt!217656) (bvslt (_1!4510 (h!9908 lt!217656)) (_1!4510 lt!217575))))))

(declare-fun b!478136 () Bool)

