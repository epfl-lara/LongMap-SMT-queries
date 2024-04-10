; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106240 () Bool)

(assert start!106240)

(declare-fun res!842152 () Bool)

(declare-fun e!720118 () Bool)

(assert (=> start!106240 (=> (not res!842152) (not e!720118))))

(declare-datatypes ((B!1916 0))(
  ( (B!1917 (val!16293 Int)) )
))
(declare-datatypes ((tuple2!21104 0))(
  ( (tuple2!21105 (_1!10563 (_ BitVec 64)) (_2!10563 B!1916)) )
))
(declare-datatypes ((List!28285 0))(
  ( (Nil!28282) (Cons!28281 (h!29490 tuple2!21104) (t!41806 List!28285)) )
))
(declare-datatypes ((ListLongMap!18977 0))(
  ( (ListLongMap!18978 (toList!9504 List!28285)) )
))
(declare-fun lm!212 () ListLongMap!18977)

(declare-fun a1!67 () (_ BitVec 64))

(declare-fun contains!7625 (ListLongMap!18977 (_ BitVec 64)) Bool)

(assert (=> start!106240 (= res!842152 (not (contains!7625 lm!212 a1!67)))))

(assert (=> start!106240 e!720118))

(declare-fun e!720119 () Bool)

(declare-fun inv!44080 (ListLongMap!18977) Bool)

(assert (=> start!106240 (and (inv!44080 lm!212) e!720119)))

(assert (=> start!106240 true))

(declare-fun b!1264583 () Bool)

(declare-fun res!842151 () Bool)

(assert (=> b!1264583 (=> (not res!842151) (not e!720118))))

(declare-fun isStrictlySorted!772 (List!28285) Bool)

(assert (=> b!1264583 (= res!842151 (isStrictlySorted!772 (toList!9504 lm!212)))))

(declare-fun b!1264584 () Bool)

(declare-fun containsKey!631 (List!28285 (_ BitVec 64)) Bool)

(assert (=> b!1264584 (= e!720118 (containsKey!631 (toList!9504 lm!212) a1!67))))

(declare-fun b!1264585 () Bool)

(declare-fun tp!96221 () Bool)

(assert (=> b!1264585 (= e!720119 tp!96221)))

(assert (= (and start!106240 res!842152) b!1264583))

(assert (= (and b!1264583 res!842151) b!1264584))

(assert (= start!106240 b!1264585))

(declare-fun m!1165119 () Bool)

(assert (=> start!106240 m!1165119))

(declare-fun m!1165121 () Bool)

(assert (=> start!106240 m!1165121))

(declare-fun m!1165123 () Bool)

(assert (=> b!1264583 m!1165123))

(declare-fun m!1165125 () Bool)

(assert (=> b!1264584 m!1165125))

(push 1)

(assert (not b!1264584))

(assert (not b!1264583))

(assert (not start!106240))

(assert (not b!1264585))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!138755 () Bool)

(declare-fun res!842177 () Bool)

(declare-fun e!720144 () Bool)

(assert (=> d!138755 (=> res!842177 e!720144)))

(assert (=> d!138755 (= res!842177 (and (is-Cons!28281 (toList!9504 lm!212)) (= (_1!10563 (h!29490 (toList!9504 lm!212))) a1!67)))))

(assert (=> d!138755 (= (containsKey!631 (toList!9504 lm!212) a1!67) e!720144)))

(declare-fun b!1264616 () Bool)

(declare-fun e!720145 () Bool)

(assert (=> b!1264616 (= e!720144 e!720145)))

(declare-fun res!842178 () Bool)

(assert (=> b!1264616 (=> (not res!842178) (not e!720145))))

(assert (=> b!1264616 (= res!842178 (and (or (not (is-Cons!28281 (toList!9504 lm!212))) (bvsle (_1!10563 (h!29490 (toList!9504 lm!212))) a1!67)) (is-Cons!28281 (toList!9504 lm!212)) (bvslt (_1!10563 (h!29490 (toList!9504 lm!212))) a1!67)))))

(declare-fun b!1264617 () Bool)

(assert (=> b!1264617 (= e!720145 (containsKey!631 (t!41806 (toList!9504 lm!212)) a1!67))))

(assert (= (and d!138755 (not res!842177)) b!1264616))

(assert (= (and b!1264616 res!842178) b!1264617))

(declare-fun m!1165145 () Bool)

(assert (=> b!1264617 m!1165145))

(assert (=> b!1264584 d!138755))

(declare-fun d!138761 () Bool)

(declare-fun res!842193 () Bool)

(declare-fun e!720160 () Bool)

(assert (=> d!138761 (=> res!842193 e!720160)))

(assert (=> d!138761 (= res!842193 (or (is-Nil!28282 (toList!9504 lm!212)) (is-Nil!28282 (t!41806 (toList!9504 lm!212)))))))

(assert (=> d!138761 (= (isStrictlySorted!772 (toList!9504 lm!212)) e!720160)))

(declare-fun b!1264632 () Bool)

(declare-fun e!720161 () Bool)

(assert (=> b!1264632 (= e!720160 e!720161)))

(declare-fun res!842194 () Bool)

(assert (=> b!1264632 (=> (not res!842194) (not e!720161))))

(assert (=> b!1264632 (= res!842194 (bvslt (_1!10563 (h!29490 (toList!9504 lm!212))) (_1!10563 (h!29490 (t!41806 (toList!9504 lm!212))))))))

(declare-fun b!1264633 () Bool)

(assert (=> b!1264633 (= e!720161 (isStrictlySorted!772 (t!41806 (toList!9504 lm!212))))))

(assert (= (and d!138761 (not res!842193)) b!1264632))

(assert (= (and b!1264632 res!842194) b!1264633))

(declare-fun m!1165151 () Bool)

(assert (=> b!1264633 m!1165151))

(assert (=> b!1264583 d!138761))

(declare-fun d!138767 () Bool)

(declare-fun e!720178 () Bool)

(assert (=> d!138767 e!720178))

(declare-fun res!842205 () Bool)

(assert (=> d!138767 (=> res!842205 e!720178)))

(declare-fun lt!573868 () Bool)

(assert (=> d!138767 (= res!842205 (not lt!573868))))

(declare-fun lt!573866 () Bool)

(assert (=> d!138767 (= lt!573868 lt!573866)))

(declare-datatypes ((Unit!42156 0))(
  ( (Unit!42157) )
))
(declare-fun lt!573867 () Unit!42156)

(declare-fun e!720179 () Unit!42156)

(assert (=> d!138767 (= lt!573867 e!720179)))

(declare-fun c!123152 () Bool)

(assert (=> d!138767 (= c!123152 lt!573866)))

(assert (=> d!138767 (= lt!573866 (containsKey!631 (toList!9504 lm!212) a1!67))))

(assert (=> d!138767 (= (contains!7625 lm!212 a1!67) lt!573868)))

(declare-fun b!1264656 () Bool)

(declare-fun lt!573865 () Unit!42156)

(assert (=> b!1264656 (= e!720179 lt!573865)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!441 (List!28285 (_ BitVec 64)) Unit!42156)

(assert (=> b!1264656 (= lt!573865 (lemmaContainsKeyImpliesGetValueByKeyDefined!441 (toList!9504 lm!212) a1!67))))

(declare-datatypes ((Option!725 0))(
  ( (Some!724 (v!19002 B!1916)) (None!723) )
))
(declare-fun isDefined!480 (Option!725) Bool)

(declare-fun getValueByKey!674 (List!28285 (_ BitVec 64)) Option!725)

(assert (=> b!1264656 (isDefined!480 (getValueByKey!674 (toList!9504 lm!212) a1!67))))

(declare-fun b!1264657 () Bool)

(declare-fun Unit!42159 () Unit!42156)

(assert (=> b!1264657 (= e!720179 Unit!42159)))

(declare-fun b!1264658 () Bool)

(assert (=> b!1264658 (= e!720178 (isDefined!480 (getValueByKey!674 (toList!9504 lm!212) a1!67)))))

(assert (= (and d!138767 c!123152) b!1264656))

(assert (= (and d!138767 (not c!123152)) b!1264657))

(assert (= (and d!138767 (not res!842205)) b!1264658))

(assert (=> d!138767 m!1165125))

(declare-fun m!1165155 () Bool)

(assert (=> b!1264656 m!1165155))

(declare-fun m!1165157 () Bool)

(assert (=> b!1264656 m!1165157))

(assert (=> b!1264656 m!1165157))

(declare-fun m!1165159 () Bool)

(assert (=> b!1264656 m!1165159))

(assert (=> b!1264658 m!1165157))

(assert (=> b!1264658 m!1165157))

(assert (=> b!1264658 m!1165159))

(assert (=> start!106240 d!138767))

(declare-fun d!138771 () Bool)

(assert (=> d!138771 (= (inv!44080 lm!212) (isStrictlySorted!772 (toList!9504 lm!212)))))

(declare-fun bs!35780 () Bool)

(assert (= bs!35780 d!138771))

(assert (=> bs!35780 m!1165123))

(assert (=> start!106240 d!138771))

(declare-fun b!1264675 () Bool)

(declare-fun e!720190 () Bool)

(declare-fun tp_is_empty!32449 () Bool)

(declare-fun tp!96232 () Bool)

(assert (=> b!1264675 (= e!720190 (and tp_is_empty!32449 tp!96232))))

(assert (=> b!1264585 (= tp!96221 e!720190)))

(assert (= (and b!1264585 (is-Cons!28281 (toList!9504 lm!212))) b!1264675))

(push 1)

