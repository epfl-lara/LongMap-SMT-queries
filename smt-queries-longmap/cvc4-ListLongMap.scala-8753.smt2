; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106220 () Bool)

(assert start!106220)

(declare-fun res!842119 () Bool)

(declare-fun e!720067 () Bool)

(assert (=> start!106220 (=> (not res!842119) (not e!720067))))

(declare-datatypes ((B!1914 0))(
  ( (B!1915 (val!16292 Int)) )
))
(declare-datatypes ((tuple2!21102 0))(
  ( (tuple2!21103 (_1!10562 (_ BitVec 64)) (_2!10562 B!1914)) )
))
(declare-datatypes ((List!28284 0))(
  ( (Nil!28281) (Cons!28280 (h!29489 tuple2!21102) (t!41805 List!28284)) )
))
(declare-datatypes ((ListLongMap!18975 0))(
  ( (ListLongMap!18976 (toList!9503 List!28284)) )
))
(declare-fun lm!212 () ListLongMap!18975)

(declare-fun a1!67 () (_ BitVec 64))

(declare-fun contains!7624 (ListLongMap!18975 (_ BitVec 64)) Bool)

(assert (=> start!106220 (= res!842119 (not (contains!7624 lm!212 a1!67)))))

(assert (=> start!106220 e!720067))

(declare-fun e!720068 () Bool)

(declare-fun inv!44074 (ListLongMap!18975) Bool)

(assert (=> start!106220 (and (inv!44074 lm!212) e!720068)))

(assert (=> start!106220 true))

(declare-fun b!1264515 () Bool)

(declare-fun isStrictlySorted!771 (List!28284) Bool)

(assert (=> b!1264515 (= e!720067 (not (isStrictlySorted!771 (toList!9503 lm!212))))))

(declare-fun b!1264516 () Bool)

(declare-fun tp!96209 () Bool)

(assert (=> b!1264516 (= e!720068 tp!96209)))

(assert (= (and start!106220 res!842119) b!1264515))

(assert (= start!106220 b!1264516))

(declare-fun m!1165083 () Bool)

(assert (=> start!106220 m!1165083))

(declare-fun m!1165085 () Bool)

(assert (=> start!106220 m!1165085))

(declare-fun m!1165087 () Bool)

(assert (=> b!1264515 m!1165087))

(push 1)

(assert (not start!106220))

(assert (not b!1264515))

(assert (not b!1264516))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!138737 () Bool)

(declare-fun e!720086 () Bool)

(assert (=> d!138737 e!720086))

(declare-fun res!842128 () Bool)

(assert (=> d!138737 (=> res!842128 e!720086)))

(declare-fun lt!573839 () Bool)

(assert (=> d!138737 (= res!842128 (not lt!573839))))

(declare-fun lt!573840 () Bool)

(assert (=> d!138737 (= lt!573839 lt!573840)))

(declare-datatypes ((Unit!42150 0))(
  ( (Unit!42151) )
))
(declare-fun lt!573837 () Unit!42150)

(declare-fun e!720085 () Unit!42150)

(assert (=> d!138737 (= lt!573837 e!720085)))

(declare-fun c!123145 () Bool)

(assert (=> d!138737 (= c!123145 lt!573840)))

(declare-fun containsKey!630 (List!28284 (_ BitVec 64)) Bool)

(assert (=> d!138737 (= lt!573840 (containsKey!630 (toList!9503 lm!212) a1!67))))

(assert (=> d!138737 (= (contains!7624 lm!212 a1!67) lt!573839)))

(declare-fun b!1264541 () Bool)

(declare-fun lt!573838 () Unit!42150)

(assert (=> b!1264541 (= e!720085 lt!573838)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!439 (List!28284 (_ BitVec 64)) Unit!42150)

(assert (=> b!1264541 (= lt!573838 (lemmaContainsKeyImpliesGetValueByKeyDefined!439 (toList!9503 lm!212) a1!67))))

(declare-datatypes ((Option!723 0))(
  ( (Some!722 (v!19000 B!1914)) (None!721) )
))
(declare-fun isDefined!478 (Option!723) Bool)

(declare-fun getValueByKey!672 (List!28284 (_ BitVec 64)) Option!723)

(assert (=> b!1264541 (isDefined!478 (getValueByKey!672 (toList!9503 lm!212) a1!67))))

(declare-fun b!1264542 () Bool)

(declare-fun Unit!42153 () Unit!42150)

(assert (=> b!1264542 (= e!720085 Unit!42153)))

(declare-fun b!1264543 () Bool)

(assert (=> b!1264543 (= e!720086 (isDefined!478 (getValueByKey!672 (toList!9503 lm!212) a1!67)))))

(assert (= (and d!138737 c!123145) b!1264541))

(assert (= (and d!138737 (not c!123145)) b!1264542))

(assert (= (and d!138737 (not res!842128)) b!1264543))

(declare-fun m!1165105 () Bool)

(assert (=> d!138737 m!1165105))

(declare-fun m!1165107 () Bool)

(assert (=> b!1264541 m!1165107))

(declare-fun m!1165109 () Bool)

(assert (=> b!1264541 m!1165109))

(assert (=> b!1264541 m!1165109))

(declare-fun m!1165111 () Bool)

(assert (=> b!1264541 m!1165111))

(assert (=> b!1264543 m!1165109))

(assert (=> b!1264543 m!1165109))

(assert (=> b!1264543 m!1165111))

(assert (=> start!106220 d!138737))

(declare-fun d!138747 () Bool)

(assert (=> d!138747 (= (inv!44074 lm!212) (isStrictlySorted!771 (toList!9503 lm!212)))))

(declare-fun bs!35776 () Bool)

(assert (= bs!35776 d!138747))

(assert (=> bs!35776 m!1165087))

(assert (=> start!106220 d!138747))

