; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4738 () Bool)

(assert start!4738)

(declare-fun b_free!1325 () Bool)

(declare-fun b_next!1325 () Bool)

(assert (=> start!4738 (= b_free!1325 (not b_next!1325))))

(declare-fun tp!5438 () Bool)

(declare-fun b_and!2177 () Bool)

(assert (=> start!4738 (= tp!5438 b_and!2177)))

(declare-fun res!22200 () Bool)

(declare-fun e!23158 () Bool)

(assert (=> start!4738 (=> (not res!22200) (not e!23158))))

(declare-datatypes ((B!732 0))(
  ( (B!733 (val!866 Int)) )
))
(declare-datatypes ((tuple2!1392 0))(
  ( (tuple2!1393 (_1!707 (_ BitVec 64)) (_2!707 B!732)) )
))
(declare-datatypes ((List!970 0))(
  ( (Nil!967) (Cons!966 (h!1534 tuple2!1392) (t!3701 List!970)) )
))
(declare-datatypes ((ListLongMap!969 0))(
  ( (ListLongMap!970 (toList!500 List!970)) )
))
(declare-fun lm!252 () ListLongMap!969)

(declare-fun p!304 () Int)

(declare-fun forall!166 (List!970 Int) Bool)

(assert (=> start!4738 (= res!22200 (forall!166 (toList!500 lm!252) p!304))))

(assert (=> start!4738 e!23158))

(declare-fun e!23157 () Bool)

(declare-fun inv!1616 (ListLongMap!969) Bool)

(assert (=> start!4738 (and (inv!1616 lm!252) e!23157)))

(assert (=> start!4738 tp!5438))

(assert (=> start!4738 true))

(declare-fun b!36653 () Bool)

(declare-fun res!22199 () Bool)

(assert (=> b!36653 (=> (not res!22199) (not e!23158))))

(declare-fun k!388 () (_ BitVec 64))

(declare-fun contains!451 (ListLongMap!969 (_ BitVec 64)) Bool)

(assert (=> b!36653 (= res!22199 (contains!451 lm!252 k!388))))

(declare-fun b!36654 () Bool)

(declare-fun size!1300 (List!970) Int)

(assert (=> b!36654 (= e!23158 (< (size!1300 (toList!500 lm!252)) 0))))

(declare-fun b!36655 () Bool)

(declare-fun tp!5437 () Bool)

(assert (=> b!36655 (= e!23157 tp!5437)))

(assert (= (and start!4738 res!22200) b!36653))

(assert (= (and b!36653 res!22199) b!36654))

(assert (= start!4738 b!36655))

(declare-fun m!29545 () Bool)

(assert (=> start!4738 m!29545))

(declare-fun m!29547 () Bool)

(assert (=> start!4738 m!29547))

(declare-fun m!29549 () Bool)

(assert (=> b!36653 m!29549))

(declare-fun m!29551 () Bool)

(assert (=> b!36654 m!29551))

(push 1)

(assert (not b_next!1325))

(assert (not start!4738))

(assert b_and!2177)

(assert (not b!36654))

(assert (not b!36655))

(assert (not b!36653))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2177)

(assert (not b_next!1325))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5529 () Bool)

(declare-fun e!23174 () Bool)

(assert (=> d!5529 e!23174))

(declare-fun res!22209 () Bool)

(assert (=> d!5529 (=> res!22209 e!23174)))

(declare-fun lt!13559 () Bool)

(assert (=> d!5529 (= res!22209 (not lt!13559))))

(declare-fun lt!13562 () Bool)

(assert (=> d!5529 (= lt!13559 lt!13562)))

(declare-datatypes ((Unit!815 0))(
  ( (Unit!816) )
))
(declare-fun lt!13560 () Unit!815)

(declare-fun e!23175 () Unit!815)

(assert (=> d!5529 (= lt!13560 e!23175)))

(declare-fun c!4192 () Bool)

(assert (=> d!5529 (= c!4192 lt!13562)))

(declare-fun containsKey!42 (List!970 (_ BitVec 64)) Bool)

(assert (=> d!5529 (= lt!13562 (containsKey!42 (toList!500 lm!252) k!388))))

(assert (=> d!5529 (= (contains!451 lm!252 k!388) lt!13559)))

(declare-fun b!36678 () Bool)

(declare-fun lt!13561 () Unit!815)

(assert (=> b!36678 (= e!23175 lt!13561)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!39 (List!970 (_ BitVec 64)) Unit!815)

(assert (=> b!36678 (= lt!13561 (lemmaContainsKeyImpliesGetValueByKeyDefined!39 (toList!500 lm!252) k!388))))

(declare-datatypes ((Option!84 0))(
  ( (Some!83 (v!1952 B!732)) (None!82) )
))
(declare-fun isDefined!40 (Option!84) Bool)

(declare-fun getValueByKey!78 (List!970 (_ BitVec 64)) Option!84)

(assert (=> b!36678 (isDefined!40 (getValueByKey!78 (toList!500 lm!252) k!388))))

(declare-fun b!36679 () Bool)

(declare-fun Unit!819 () Unit!815)

(assert (=> b!36679 (= e!23175 Unit!819)))

(declare-fun b!36680 () Bool)

(assert (=> b!36680 (= e!23174 (isDefined!40 (getValueByKey!78 (toList!500 lm!252) k!388)))))

(assert (= (and d!5529 c!4192) b!36678))

(assert (= (and d!5529 (not c!4192)) b!36679))

(assert (= (and d!5529 (not res!22209)) b!36680))

(declare-fun m!29561 () Bool)

(assert (=> d!5529 m!29561))

(declare-fun m!29563 () Bool)

(assert (=> b!36678 m!29563))

(declare-fun m!29565 () Bool)

(assert (=> b!36678 m!29565))

(assert (=> b!36678 m!29565))

(declare-fun m!29567 () Bool)

(assert (=> b!36678 m!29567))

(assert (=> b!36680 m!29565))

(assert (=> b!36680 m!29565))

(assert (=> b!36680 m!29567))

(assert (=> b!36653 d!5529))

(declare-fun d!5541 () Bool)

(declare-fun res!22216 () Bool)

(declare-fun e!23185 () Bool)

(assert (=> d!5541 (=> res!22216 e!23185)))

(assert (=> d!5541 (= res!22216 (is-Nil!967 (toList!500 lm!252)))))

(assert (=> d!5541 (= (forall!166 (toList!500 lm!252) p!304) e!23185)))

(declare-fun b!36693 () Bool)

(declare-fun e!23186 () Bool)

(assert (=> b!36693 (= e!23185 e!23186)))

(declare-fun res!22217 () Bool)

(assert (=> b!36693 (=> (not res!22217) (not e!23186))))

(declare-fun dynLambda!168 (Int tuple2!1392) Bool)

(assert (=> b!36693 (= res!22217 (dynLambda!168 p!304 (h!1534 (toList!500 lm!252))))))

(declare-fun b!36694 () Bool)

(assert (=> b!36694 (= e!23186 (forall!166 (t!3701 (toList!500 lm!252)) p!304))))

(assert (= (and d!5541 (not res!22216)) b!36693))

(assert (= (and b!36693 res!22217) b!36694))

(declare-fun b_lambda!1775 () Bool)

(assert (=> (not b_lambda!1775) (not b!36693)))

(declare-fun t!3705 () Bool)

(declare-fun tb!721 () Bool)

(assert (=> (and start!4738 (= p!304 p!304) t!3705) tb!721))

(declare-fun result!1239 () Bool)

(assert (=> tb!721 (= result!1239 true)))

(assert (=> b!36693 t!3705))

(declare-fun b_and!2181 () Bool)

(assert (= b_and!2177 (and (=> t!3705 result!1239) b_and!2181)))

(declare-fun m!29571 () Bool)

(assert (=> b!36693 m!29571))

(declare-fun m!29573 () Bool)

(assert (=> b!36694 m!29573))

(assert (=> start!4738 d!5541))

(declare-fun d!5545 () Bool)

(declare-fun isStrictlySorted!178 (List!970) Bool)

(assert (=> d!5545 (= (inv!1616 lm!252) (isStrictlySorted!178 (toList!500 lm!252)))))

(declare-fun bs!1404 () Bool)

(assert (= bs!1404 d!5545))

(declare-fun m!29583 () Bool)

(assert (=> bs!1404 m!29583))

(assert (=> start!4738 d!5545))

(declare-fun d!5549 () Bool)

(declare-fun lt!13586 () Int)

(assert (=> d!5549 (>= lt!13586 0)))

(declare-fun e!23199 () Int)

(assert (=> d!5549 (= lt!13586 e!23199)))

(declare-fun c!4201 () Bool)

(assert (=> d!5549 (= c!4201 (is-Nil!967 (toList!500 lm!252)))))

(assert (=> d!5549 (= (size!1300 (toList!500 lm!252)) lt!13586)))

(declare-fun b!36712 () Bool)

(assert (=> b!36712 (= e!23199 0)))

