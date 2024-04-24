; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88470 () Bool)

(assert start!88470)

(declare-fun b!1018148 () Bool)

(assert (=> b!1018148 true))

(assert (=> b!1018148 true))

(declare-fun b!1018143 () Bool)

(declare-fun res!682532 () Bool)

(declare-fun e!572896 () Bool)

(assert (=> b!1018143 (=> (not res!682532) (not e!572896))))

(declare-datatypes ((B!1544 0))(
  ( (B!1545 (val!11856 Int)) )
))
(declare-datatypes ((tuple2!15262 0))(
  ( (tuple2!15263 (_1!7642 (_ BitVec 64)) (_2!7642 B!1544)) )
))
(declare-datatypes ((List!21524 0))(
  ( (Nil!21521) (Cons!21520 (h!22727 tuple2!15262) (t!30517 List!21524)) )
))
(declare-fun l!1114 () List!21524)

(declare-fun isEmpty!896 (List!21524) Bool)

(assert (=> b!1018143 (= res!682532 (not (isEmpty!896 l!1114)))))

(declare-fun b!1018145 () Bool)

(declare-fun e!572894 () Bool)

(declare-datatypes ((List!21525 0))(
  ( (Nil!21522) (Cons!21521 (h!22728 (_ BitVec 64)) (t!30518 List!21525)) )
))
(declare-fun keys!40 () List!21525)

(declare-fun ListPrimitiveSize!124 (List!21525) Int)

(assert (=> b!1018145 (= e!572894 (< (ListPrimitiveSize!124 (t!30518 keys!40)) (ListPrimitiveSize!124 keys!40)))))

(declare-fun b!1018146 () Bool)

(declare-fun res!682536 () Bool)

(assert (=> b!1018146 (=> (not res!682536) (not e!572896))))

(get-info :version)

(assert (=> b!1018146 (= res!682536 ((_ is Cons!21521) keys!40))))

(declare-fun b!1018147 () Bool)

(assert (=> b!1018147 (= e!572896 (not e!572894))))

(declare-fun res!682533 () Bool)

(assert (=> b!1018147 (=> res!682533 e!572894)))

(declare-fun lambda!1045 () Int)

(declare-fun forall!288 (List!21525 Int) Bool)

(assert (=> b!1018147 (= res!682533 (not (forall!288 (t!30518 keys!40) lambda!1045)))))

(declare-fun lt!449850 () List!21524)

(declare-datatypes ((Option!605 0))(
  ( (Some!604 (v!14455 B!1544)) (None!603) )
))
(declare-fun isDefined!406 (Option!605) Bool)

(declare-fun getValueByKey!554 (List!21524 (_ BitVec 64)) Option!605)

(assert (=> b!1018147 (isDefined!406 (getValueByKey!554 lt!449850 (h!22728 keys!40)))))

(declare-datatypes ((Unit!33258 0))(
  ( (Unit!33259) )
))
(declare-fun lt!449851 () Unit!33258)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!386 (List!21524 (_ BitVec 64)) Unit!33258)

(assert (=> b!1018147 (= lt!449851 (lemmaContainsKeyImpliesGetValueByKeyDefined!386 lt!449850 (h!22728 keys!40)))))

(declare-fun newHead!31 () tuple2!15262)

(assert (=> b!1018147 (= lt!449850 (Cons!21520 newHead!31 l!1114))))

(declare-fun containsKey!498 (List!21524 (_ BitVec 64)) Bool)

(assert (=> b!1018147 (containsKey!498 l!1114 (h!22728 keys!40))))

(declare-fun lt!449852 () Unit!33258)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!16 (List!21524 (_ BitVec 64)) Unit!33258)

(assert (=> b!1018147 (= lt!449852 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!16 l!1114 (h!22728 keys!40)))))

(declare-fun res!682534 () Bool)

(assert (=> b!1018148 (=> (not res!682534) (not e!572896))))

(assert (=> b!1018148 (= res!682534 (forall!288 keys!40 lambda!1045))))

(declare-fun b!1018149 () Bool)

(declare-fun e!572895 () Bool)

(declare-fun tp_is_empty!23611 () Bool)

(declare-fun tp!70811 () Bool)

(assert (=> b!1018149 (= e!572895 (and tp_is_empty!23611 tp!70811))))

(declare-fun b!1018144 () Bool)

(declare-fun res!682531 () Bool)

(assert (=> b!1018144 (=> (not res!682531) (not e!572896))))

(declare-fun head!969 (List!21524) tuple2!15262)

(assert (=> b!1018144 (= res!682531 (bvslt (_1!7642 newHead!31) (_1!7642 (head!969 l!1114))))))

(declare-fun res!682535 () Bool)

(assert (=> start!88470 (=> (not res!682535) (not e!572896))))

(declare-fun isStrictlySorted!612 (List!21524) Bool)

(assert (=> start!88470 (= res!682535 (isStrictlySorted!612 l!1114))))

(assert (=> start!88470 e!572896))

(assert (=> start!88470 e!572895))

(assert (=> start!88470 true))

(assert (=> start!88470 tp_is_empty!23611))

(assert (= (and start!88470 res!682535) b!1018143))

(assert (= (and b!1018143 res!682532) b!1018148))

(assert (= (and b!1018148 res!682534) b!1018144))

(assert (= (and b!1018144 res!682531) b!1018146))

(assert (= (and b!1018146 res!682536) b!1018147))

(assert (= (and b!1018147 (not res!682533)) b!1018145))

(assert (= (and start!88470 ((_ is Cons!21520) l!1114)) b!1018149))

(declare-fun m!940017 () Bool)

(assert (=> start!88470 m!940017))

(declare-fun m!940019 () Bool)

(assert (=> b!1018144 m!940019))

(declare-fun m!940021 () Bool)

(assert (=> b!1018148 m!940021))

(declare-fun m!940023 () Bool)

(assert (=> b!1018147 m!940023))

(declare-fun m!940025 () Bool)

(assert (=> b!1018147 m!940025))

(assert (=> b!1018147 m!940023))

(declare-fun m!940027 () Bool)

(assert (=> b!1018147 m!940027))

(declare-fun m!940029 () Bool)

(assert (=> b!1018147 m!940029))

(declare-fun m!940031 () Bool)

(assert (=> b!1018147 m!940031))

(declare-fun m!940033 () Bool)

(assert (=> b!1018147 m!940033))

(declare-fun m!940035 () Bool)

(assert (=> b!1018145 m!940035))

(declare-fun m!940037 () Bool)

(assert (=> b!1018145 m!940037))

(declare-fun m!940039 () Bool)

(assert (=> b!1018143 m!940039))

(check-sat (not start!88470) (not b!1018148) (not b!1018144) tp_is_empty!23611 (not b!1018145) (not b!1018143) (not b!1018147) (not b!1018149))
(check-sat)
(get-model)

(declare-fun d!121851 () Bool)

(declare-fun res!682577 () Bool)

(declare-fun e!572919 () Bool)

(assert (=> d!121851 (=> res!682577 e!572919)))

(assert (=> d!121851 (= res!682577 (and ((_ is Cons!21520) l!1114) (= (_1!7642 (h!22727 l!1114)) (h!22728 keys!40))))))

(assert (=> d!121851 (= (containsKey!498 l!1114 (h!22728 keys!40)) e!572919)))

(declare-fun b!1018208 () Bool)

(declare-fun e!572920 () Bool)

(assert (=> b!1018208 (= e!572919 e!572920)))

(declare-fun res!682578 () Bool)

(assert (=> b!1018208 (=> (not res!682578) (not e!572920))))

(assert (=> b!1018208 (= res!682578 (and (or (not ((_ is Cons!21520) l!1114)) (bvsle (_1!7642 (h!22727 l!1114)) (h!22728 keys!40))) ((_ is Cons!21520) l!1114) (bvslt (_1!7642 (h!22727 l!1114)) (h!22728 keys!40))))))

(declare-fun b!1018209 () Bool)

(assert (=> b!1018209 (= e!572920 (containsKey!498 (t!30517 l!1114) (h!22728 keys!40)))))

(assert (= (and d!121851 (not res!682577)) b!1018208))

(assert (= (and b!1018208 res!682578) b!1018209))

(declare-fun m!940089 () Bool)

(assert (=> b!1018209 m!940089))

(assert (=> b!1018147 d!121851))

(declare-fun d!121853 () Bool)

(assert (=> d!121853 (isDefined!406 (getValueByKey!554 lt!449850 (h!22728 keys!40)))))

(declare-fun lt!449873 () Unit!33258)

(declare-fun choose!1661 (List!21524 (_ BitVec 64)) Unit!33258)

(assert (=> d!121853 (= lt!449873 (choose!1661 lt!449850 (h!22728 keys!40)))))

(declare-fun e!572923 () Bool)

(assert (=> d!121853 e!572923))

(declare-fun res!682581 () Bool)

(assert (=> d!121853 (=> (not res!682581) (not e!572923))))

(assert (=> d!121853 (= res!682581 (isStrictlySorted!612 lt!449850))))

(assert (=> d!121853 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!386 lt!449850 (h!22728 keys!40)) lt!449873)))

(declare-fun b!1018212 () Bool)

(assert (=> b!1018212 (= e!572923 (containsKey!498 lt!449850 (h!22728 keys!40)))))

(assert (= (and d!121853 res!682581) b!1018212))

(assert (=> d!121853 m!940023))

(assert (=> d!121853 m!940023))

(assert (=> d!121853 m!940025))

(declare-fun m!940091 () Bool)

(assert (=> d!121853 m!940091))

(declare-fun m!940093 () Bool)

(assert (=> d!121853 m!940093))

(declare-fun m!940095 () Bool)

(assert (=> b!1018212 m!940095))

(assert (=> b!1018147 d!121853))

(declare-fun d!121861 () Bool)

(assert (=> d!121861 (containsKey!498 l!1114 (h!22728 keys!40))))

(declare-fun lt!449884 () Unit!33258)

(declare-fun choose!1662 (List!21524 (_ BitVec 64)) Unit!33258)

(assert (=> d!121861 (= lt!449884 (choose!1662 l!1114 (h!22728 keys!40)))))

(declare-fun e!572934 () Bool)

(assert (=> d!121861 e!572934))

(declare-fun res!682584 () Bool)

(assert (=> d!121861 (=> (not res!682584) (not e!572934))))

(assert (=> d!121861 (= res!682584 (isStrictlySorted!612 l!1114))))

(assert (=> d!121861 (= (lemmaGetValueByKeyIsDefinedImpliesContainsKey!16 l!1114 (h!22728 keys!40)) lt!449884)))

(declare-fun b!1018231 () Bool)

(assert (=> b!1018231 (= e!572934 (isDefined!406 (getValueByKey!554 l!1114 (h!22728 keys!40))))))

(assert (= (and d!121861 res!682584) b!1018231))

(assert (=> d!121861 m!940031))

(declare-fun m!940101 () Bool)

(assert (=> d!121861 m!940101))

(assert (=> d!121861 m!940017))

(declare-fun m!940103 () Bool)

(assert (=> b!1018231 m!940103))

(assert (=> b!1018231 m!940103))

(declare-fun m!940105 () Bool)

(assert (=> b!1018231 m!940105))

(assert (=> b!1018147 d!121861))

(declare-fun d!121871 () Bool)

(declare-fun isEmpty!899 (Option!605) Bool)

(assert (=> d!121871 (= (isDefined!406 (getValueByKey!554 lt!449850 (h!22728 keys!40))) (not (isEmpty!899 (getValueByKey!554 lt!449850 (h!22728 keys!40)))))))

(declare-fun bs!29559 () Bool)

(assert (= bs!29559 d!121871))

(assert (=> bs!29559 m!940023))

(declare-fun m!940107 () Bool)

(assert (=> bs!29559 m!940107))

(assert (=> b!1018147 d!121871))

(declare-fun b!1018259 () Bool)

(declare-fun e!572956 () Option!605)

(assert (=> b!1018259 (= e!572956 None!603)))

(declare-fun b!1018258 () Bool)

(assert (=> b!1018258 (= e!572956 (getValueByKey!554 (t!30517 lt!449850) (h!22728 keys!40)))))

(declare-fun b!1018257 () Bool)

(declare-fun e!572955 () Option!605)

(assert (=> b!1018257 (= e!572955 e!572956)))

(declare-fun c!103387 () Bool)

(assert (=> b!1018257 (= c!103387 (and ((_ is Cons!21520) lt!449850) (not (= (_1!7642 (h!22727 lt!449850)) (h!22728 keys!40)))))))

(declare-fun b!1018256 () Bool)

(assert (=> b!1018256 (= e!572955 (Some!604 (_2!7642 (h!22727 lt!449850))))))

(declare-fun d!121873 () Bool)

(declare-fun c!103386 () Bool)

(assert (=> d!121873 (= c!103386 (and ((_ is Cons!21520) lt!449850) (= (_1!7642 (h!22727 lt!449850)) (h!22728 keys!40))))))

(assert (=> d!121873 (= (getValueByKey!554 lt!449850 (h!22728 keys!40)) e!572955)))

(assert (= (and d!121873 c!103386) b!1018256))

(assert (= (and d!121873 (not c!103386)) b!1018257))

(assert (= (and b!1018257 c!103387) b!1018258))

(assert (= (and b!1018257 (not c!103387)) b!1018259))

(declare-fun m!940113 () Bool)

(assert (=> b!1018258 m!940113))

(assert (=> b!1018147 d!121873))

(declare-fun d!121883 () Bool)

(declare-fun res!682613 () Bool)

(declare-fun e!572973 () Bool)

(assert (=> d!121883 (=> res!682613 e!572973)))

(assert (=> d!121883 (= res!682613 ((_ is Nil!21522) (t!30518 keys!40)))))

(assert (=> d!121883 (= (forall!288 (t!30518 keys!40) lambda!1045) e!572973)))

(declare-fun b!1018280 () Bool)

(declare-fun e!572974 () Bool)

(assert (=> b!1018280 (= e!572973 e!572974)))

(declare-fun res!682614 () Bool)

(assert (=> b!1018280 (=> (not res!682614) (not e!572974))))

(declare-fun dynLambda!1945 (Int (_ BitVec 64)) Bool)

(assert (=> b!1018280 (= res!682614 (dynLambda!1945 lambda!1045 (h!22728 (t!30518 keys!40))))))

(declare-fun b!1018281 () Bool)

(assert (=> b!1018281 (= e!572974 (forall!288 (t!30518 (t!30518 keys!40)) lambda!1045))))

(assert (= (and d!121883 (not res!682613)) b!1018280))

(assert (= (and b!1018280 res!682614) b!1018281))

(declare-fun b_lambda!15567 () Bool)

(assert (=> (not b_lambda!15567) (not b!1018280)))

(declare-fun m!940119 () Bool)

(assert (=> b!1018280 m!940119))

(declare-fun m!940121 () Bool)

(assert (=> b!1018281 m!940121))

(assert (=> b!1018147 d!121883))

(declare-fun d!121889 () Bool)

(assert (=> d!121889 (= (isEmpty!896 l!1114) ((_ is Nil!21521) l!1114))))

(assert (=> b!1018143 d!121889))

(declare-fun d!121891 () Bool)

(declare-fun res!682615 () Bool)

(declare-fun e!572979 () Bool)

(assert (=> d!121891 (=> res!682615 e!572979)))

(assert (=> d!121891 (= res!682615 ((_ is Nil!21522) keys!40))))

(assert (=> d!121891 (= (forall!288 keys!40 lambda!1045) e!572979)))

(declare-fun b!1018290 () Bool)

(declare-fun e!572980 () Bool)

(assert (=> b!1018290 (= e!572979 e!572980)))

(declare-fun res!682616 () Bool)

(assert (=> b!1018290 (=> (not res!682616) (not e!572980))))

(assert (=> b!1018290 (= res!682616 (dynLambda!1945 lambda!1045 (h!22728 keys!40)))))

(declare-fun b!1018291 () Bool)

(assert (=> b!1018291 (= e!572980 (forall!288 (t!30518 keys!40) lambda!1045))))

(assert (= (and d!121891 (not res!682615)) b!1018290))

(assert (= (and b!1018290 res!682616) b!1018291))

(declare-fun b_lambda!15569 () Bool)

(assert (=> (not b_lambda!15569) (not b!1018290)))

(declare-fun m!940123 () Bool)

(assert (=> b!1018290 m!940123))

(assert (=> b!1018291 m!940029))

(assert (=> b!1018148 d!121891))

(declare-fun d!121893 () Bool)

(assert (=> d!121893 (= (head!969 l!1114) (h!22727 l!1114))))

(assert (=> b!1018144 d!121893))

(declare-fun d!121897 () Bool)

(declare-fun res!682623 () Bool)

(declare-fun e!572991 () Bool)

(assert (=> d!121897 (=> res!682623 e!572991)))

(assert (=> d!121897 (= res!682623 (or ((_ is Nil!21521) l!1114) ((_ is Nil!21521) (t!30517 l!1114))))))

(assert (=> d!121897 (= (isStrictlySorted!612 l!1114) e!572991)))

(declare-fun b!1018306 () Bool)

(declare-fun e!572992 () Bool)

(assert (=> b!1018306 (= e!572991 e!572992)))

(declare-fun res!682624 () Bool)

(assert (=> b!1018306 (=> (not res!682624) (not e!572992))))

(assert (=> b!1018306 (= res!682624 (bvslt (_1!7642 (h!22727 l!1114)) (_1!7642 (h!22727 (t!30517 l!1114)))))))

(declare-fun b!1018307 () Bool)

(assert (=> b!1018307 (= e!572992 (isStrictlySorted!612 (t!30517 l!1114)))))

(assert (= (and d!121897 (not res!682623)) b!1018306))

(assert (= (and b!1018306 res!682624) b!1018307))

(declare-fun m!940129 () Bool)

(assert (=> b!1018307 m!940129))

(assert (=> start!88470 d!121897))

(declare-fun d!121901 () Bool)

(declare-fun lt!449893 () Int)

(assert (=> d!121901 (>= lt!449893 0)))

(declare-fun e!572999 () Int)

(assert (=> d!121901 (= lt!449893 e!572999)))

(declare-fun c!103402 () Bool)

(assert (=> d!121901 (= c!103402 ((_ is Nil!21522) (t!30518 keys!40)))))

(assert (=> d!121901 (= (ListPrimitiveSize!124 (t!30518 keys!40)) lt!449893)))

(declare-fun b!1018316 () Bool)

(assert (=> b!1018316 (= e!572999 0)))

(declare-fun b!1018317 () Bool)

(assert (=> b!1018317 (= e!572999 (+ 1 (ListPrimitiveSize!124 (t!30518 (t!30518 keys!40)))))))

(assert (= (and d!121901 c!103402) b!1018316))

(assert (= (and d!121901 (not c!103402)) b!1018317))

(declare-fun m!940147 () Bool)

(assert (=> b!1018317 m!940147))

(assert (=> b!1018145 d!121901))

(declare-fun d!121911 () Bool)

(declare-fun lt!449894 () Int)

(assert (=> d!121911 (>= lt!449894 0)))

(declare-fun e!573000 () Int)

(assert (=> d!121911 (= lt!449894 e!573000)))

(declare-fun c!103403 () Bool)

(assert (=> d!121911 (= c!103403 ((_ is Nil!21522) keys!40))))

(assert (=> d!121911 (= (ListPrimitiveSize!124 keys!40) lt!449894)))

(declare-fun b!1018318 () Bool)

(assert (=> b!1018318 (= e!573000 0)))

(declare-fun b!1018319 () Bool)

(assert (=> b!1018319 (= e!573000 (+ 1 (ListPrimitiveSize!124 (t!30518 keys!40))))))

(assert (= (and d!121911 c!103403) b!1018318))

(assert (= (and d!121911 (not c!103403)) b!1018319))

(assert (=> b!1018319 m!940035))

(assert (=> b!1018145 d!121911))

(declare-fun b!1018326 () Bool)

(declare-fun e!573005 () Bool)

(declare-fun tp!70820 () Bool)

(assert (=> b!1018326 (= e!573005 (and tp_is_empty!23611 tp!70820))))

(assert (=> b!1018149 (= tp!70811 e!573005)))

(assert (= (and b!1018149 ((_ is Cons!21520) (t!30517 l!1114))) b!1018326))

(declare-fun b_lambda!15571 () Bool)

(assert (= b_lambda!15567 (or b!1018148 b_lambda!15571)))

(declare-fun bs!29562 () Bool)

(declare-fun d!121913 () Bool)

(assert (= bs!29562 (and d!121913 b!1018148)))

(declare-fun value!178 () B!1544)

(assert (=> bs!29562 (= (dynLambda!1945 lambda!1045 (h!22728 (t!30518 keys!40))) (= (getValueByKey!554 l!1114 (h!22728 (t!30518 keys!40))) (Some!604 value!178)))))

(declare-fun m!940149 () Bool)

(assert (=> bs!29562 m!940149))

(assert (=> b!1018280 d!121913))

(declare-fun b_lambda!15573 () Bool)

(assert (= b_lambda!15569 (or b!1018148 b_lambda!15573)))

(declare-fun bs!29563 () Bool)

(declare-fun d!121915 () Bool)

(assert (= bs!29563 (and d!121915 b!1018148)))

(assert (=> bs!29563 (= (dynLambda!1945 lambda!1045 (h!22728 keys!40)) (= (getValueByKey!554 l!1114 (h!22728 keys!40)) (Some!604 value!178)))))

(assert (=> bs!29563 m!940103))

(assert (=> b!1018290 d!121915))

(check-sat (not b!1018319) (not b!1018231) (not bs!29562) (not d!121871) (not b!1018281) (not b_lambda!15573) (not d!121853) (not d!121861) tp_is_empty!23611 (not b!1018212) (not b!1018326) (not b!1018209) (not b!1018307) (not b_lambda!15571) (not b!1018258) (not bs!29563) (not b!1018291) (not b!1018317))
(check-sat)
