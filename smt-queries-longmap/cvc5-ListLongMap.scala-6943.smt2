; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87420 () Bool)

(assert start!87420)

(declare-fun b!1012846 () Bool)

(assert (=> b!1012846 true))

(assert (=> b!1012846 true))

(declare-fun res!680186 () Bool)

(declare-fun e!569745 () Bool)

(assert (=> start!87420 (=> (not res!680186) (not e!569745))))

(declare-datatypes ((B!1364 0))(
  ( (B!1365 (val!11766 Int)) )
))
(declare-datatypes ((tuple2!15078 0))(
  ( (tuple2!15079 (_1!7550 (_ BitVec 64)) (_2!7550 B!1364)) )
))
(declare-datatypes ((List!21379 0))(
  ( (Nil!21376) (Cons!21375 (h!22573 tuple2!15078) (t!30380 List!21379)) )
))
(declare-fun l!412 () List!21379)

(declare-fun isStrictlySorted!546 (List!21379) Bool)

(assert (=> start!87420 (= res!680186 (isStrictlySorted!546 l!412))))

(assert (=> start!87420 e!569745))

(declare-fun e!569744 () Bool)

(assert (=> start!87420 e!569744))

(declare-fun tp_is_empty!23431 () Bool)

(assert (=> start!87420 tp_is_empty!23431))

(declare-datatypes ((Unit!33087 0))(
  ( (Unit!33088) )
))
(declare-fun e!569746 () Unit!33087)

(declare-fun lt!447710 () Unit!33087)

(assert (=> b!1012846 (= e!569746 lt!447710)))

(declare-datatypes ((List!21380 0))(
  ( (Nil!21377) (Cons!21376 (h!22574 (_ BitVec 64)) (t!30381 List!21380)) )
))
(declare-fun lt!447709 () List!21380)

(declare-fun value!115 () B!1364)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!16 (List!21379 List!21380 B!1364 tuple2!15078) Unit!33087)

(assert (=> b!1012846 (= lt!447710 (lemmaForallGetValueByKeySameWithASmallerHead!16 (t!30380 l!412) lt!447709 value!115 (h!22573 l!412)))))

(declare-fun lambda!419 () Int)

(declare-fun forall!221 (List!21380 Int) Bool)

(assert (=> b!1012846 (forall!221 lt!447709 lambda!419)))

(declare-fun b!1012847 () Bool)

(assert (=> b!1012847 (= e!569745 (not (isStrictlySorted!546 (t!30380 l!412))))))

(declare-fun lt!447711 () Unit!33087)

(assert (=> b!1012847 (= lt!447711 e!569746)))

(declare-fun c!102351 () Bool)

(declare-fun isEmpty!804 (List!21380) Bool)

(assert (=> b!1012847 (= c!102351 (not (isEmpty!804 lt!447709)))))

(declare-fun getKeysOf!28 (List!21379 B!1364) List!21380)

(assert (=> b!1012847 (= lt!447709 (getKeysOf!28 (t!30380 l!412) value!115))))

(declare-fun b!1012848 () Bool)

(declare-fun Unit!33089 () Unit!33087)

(assert (=> b!1012848 (= e!569746 Unit!33089)))

(declare-fun b!1012849 () Bool)

(declare-fun tp!70346 () Bool)

(assert (=> b!1012849 (= e!569744 (and tp_is_empty!23431 tp!70346))))

(declare-fun b!1012850 () Bool)

(declare-fun res!680187 () Bool)

(assert (=> b!1012850 (=> (not res!680187) (not e!569745))))

(assert (=> b!1012850 (= res!680187 (and (not (= (_2!7550 (h!22573 l!412)) value!115)) (is-Cons!21375 l!412)))))

(assert (= (and start!87420 res!680186) b!1012850))

(assert (= (and b!1012850 res!680187) b!1012847))

(assert (= (and b!1012847 c!102351) b!1012846))

(assert (= (and b!1012847 (not c!102351)) b!1012848))

(assert (= (and start!87420 (is-Cons!21375 l!412)) b!1012849))

(declare-fun m!936153 () Bool)

(assert (=> start!87420 m!936153))

(declare-fun m!936155 () Bool)

(assert (=> b!1012846 m!936155))

(declare-fun m!936157 () Bool)

(assert (=> b!1012846 m!936157))

(declare-fun m!936159 () Bool)

(assert (=> b!1012847 m!936159))

(declare-fun m!936161 () Bool)

(assert (=> b!1012847 m!936161))

(declare-fun m!936163 () Bool)

(assert (=> b!1012847 m!936163))

(push 1)

(assert tp_is_empty!23431)

(assert (not b!1012847))

(assert (not b!1012849))

(assert (not start!87420))

(assert (not b!1012846))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120347 () Bool)

(declare-fun res!680220 () Bool)

(declare-fun e!569785 () Bool)

(assert (=> d!120347 (=> res!680220 e!569785)))

(assert (=> d!120347 (= res!680220 (or (is-Nil!21376 (t!30380 l!412)) (is-Nil!21376 (t!30380 (t!30380 l!412)))))))

(assert (=> d!120347 (= (isStrictlySorted!546 (t!30380 l!412)) e!569785)))

(declare-fun b!1012913 () Bool)

(declare-fun e!569786 () Bool)

(assert (=> b!1012913 (= e!569785 e!569786)))

(declare-fun res!680221 () Bool)

(assert (=> b!1012913 (=> (not res!680221) (not e!569786))))

(assert (=> b!1012913 (= res!680221 (bvslt (_1!7550 (h!22573 (t!30380 l!412))) (_1!7550 (h!22573 (t!30380 (t!30380 l!412))))))))

(declare-fun b!1012914 () Bool)

(assert (=> b!1012914 (= e!569786 (isStrictlySorted!546 (t!30380 (t!30380 l!412))))))

(assert (= (and d!120347 (not res!680220)) b!1012913))

(assert (= (and b!1012913 res!680221) b!1012914))

(declare-fun m!936193 () Bool)

(assert (=> b!1012914 m!936193))

(assert (=> b!1012847 d!120347))

(declare-fun d!120359 () Bool)

(assert (=> d!120359 (= (isEmpty!804 lt!447709) (is-Nil!21377 lt!447709))))

(assert (=> b!1012847 d!120359))

(declare-fun bs!28851 () Bool)

(declare-fun b!1012975 () Bool)

(assert (= bs!28851 (and b!1012975 b!1012846)))

(declare-fun lambda!446 () Int)

(declare-fun lt!447823 () List!21379)

(declare-fun lt!447821 () tuple2!15078)

(assert (=> bs!28851 (= (= (Cons!21375 lt!447821 lt!447823) l!412) (= lambda!446 lambda!419))))

(assert (=> b!1012975 true))

(assert (=> b!1012975 true))

(assert (=> b!1012975 true))

(declare-fun bs!28855 () Bool)

(declare-fun b!1012973 () Bool)

(assert (= bs!28855 (and b!1012973 b!1012846)))

(declare-fun lt!447824 () List!21379)

(declare-fun lambda!449 () Int)

(declare-fun lt!447822 () tuple2!15078)

(assert (=> bs!28855 (= (= (Cons!21375 lt!447822 lt!447824) l!412) (= lambda!449 lambda!419))))

(declare-fun bs!28858 () Bool)

(assert (= bs!28858 (and b!1012973 b!1012975)))

(assert (=> bs!28858 (= (= (Cons!21375 lt!447822 lt!447824) (Cons!21375 lt!447821 lt!447823)) (= lambda!449 lambda!446))))

(assert (=> b!1012973 true))

(assert (=> b!1012973 true))

(assert (=> b!1012973 true))

(declare-fun bs!28861 () Bool)

(declare-fun d!120363 () Bool)

(assert (= bs!28861 (and d!120363 b!1012846)))

(declare-fun lambda!451 () Int)

(assert (=> bs!28861 (= (= (t!30380 l!412) l!412) (= lambda!451 lambda!419))))

(declare-fun bs!28863 () Bool)

(assert (= bs!28863 (and d!120363 b!1012975)))

(assert (=> bs!28863 (= (= (t!30380 l!412) (Cons!21375 lt!447821 lt!447823)) (= lambda!451 lambda!446))))

(declare-fun bs!28865 () Bool)

(assert (= bs!28865 (and d!120363 b!1012973)))

(assert (=> bs!28865 (= (= (t!30380 l!412) (Cons!21375 lt!447822 lt!447824)) (= lambda!451 lambda!449))))

(assert (=> d!120363 true))

(assert (=> d!120363 true))

(declare-fun bm!42611 () Bool)

(declare-fun lt!447817 () List!21380)

(declare-fun call!42616 () Bool)

(declare-fun lt!447816 () List!21380)

(declare-fun c!102386 () Bool)

(assert (=> bm!42611 (= call!42616 (forall!221 (ite c!102386 lt!447817 lt!447816) (ite c!102386 lambda!446 lambda!449)))))

(declare-fun e!569818 () Unit!33087)

(declare-fun lt!447825 () Unit!33087)

(assert (=> b!1012973 (= e!569818 lt!447825)))

(assert (=> b!1012973 (= lt!447824 (t!30380 (t!30380 l!412)))))

(declare-fun call!42617 () List!21380)

(assert (=> b!1012973 (= lt!447816 call!42617)))

(assert (=> b!1012973 (= lt!447822 (h!22573 (t!30380 l!412)))))

(declare-fun call!42615 () Unit!33087)

(assert (=> b!1012973 (= lt!447825 call!42615)))

(assert (=> b!1012973 call!42616))

(declare-fun bm!42612 () Bool)

(assert (=> bm!42612 (= call!42617 (getKeysOf!28 (t!30380 (t!30380 l!412)) value!115))))

(declare-fun b!1012974 () Bool)

(declare-fun e!569817 () List!21380)

(declare-fun e!569816 () List!21380)

(assert (=> b!1012974 (= e!569817 e!569816)))

(declare-fun c!102389 () Bool)

(assert (=> b!1012974 (= c!102389 (and (is-Cons!21375 (t!30380 l!412)) (not (= (_2!7550 (h!22573 (t!30380 l!412))) value!115))))))

(declare-fun lt!447818 () List!21380)

(assert (=> d!120363 (forall!221 lt!447818 lambda!451)))

(assert (=> d!120363 (= lt!447818 e!569817)))

(assert (=> d!120363 (= c!102386 (and (is-Cons!21375 (t!30380 l!412)) (= (_2!7550 (h!22573 (t!30380 l!412))) value!115)))))

(assert (=> d!120363 (isStrictlySorted!546 (t!30380 l!412))))

(assert (=> d!120363 (= (getKeysOf!28 (t!30380 l!412) value!115) lt!447818)))

(declare-fun bm!42613 () Bool)

(declare-fun call!42614 () Bool)

(assert (=> bm!42613 (= call!42614 (isEmpty!804 call!42617))))

(assert (=> b!1012975 call!42616))

(declare-fun lt!447819 () Unit!33087)

(assert (=> b!1012975 (= lt!447819 call!42615)))

(assert (=> b!1012975 (= lt!447821 (h!22573 (t!30380 l!412)))))

(assert (=> b!1012975 (= lt!447817 call!42617)))

(assert (=> b!1012975 (= lt!447823 (t!30380 (t!30380 l!412)))))

(declare-fun e!569815 () Unit!33087)

(assert (=> b!1012975 (= e!569815 lt!447819)))

(declare-fun b!1012976 () Bool)

(assert (=> b!1012976 (= e!569817 (Cons!21376 (_1!7550 (h!22573 (t!30380 l!412))) call!42617))))

(declare-fun c!102388 () Bool)

(assert (=> b!1012976 (= c!102388 (not call!42614))))

(declare-fun lt!447815 () Unit!33087)

(assert (=> b!1012976 (= lt!447815 e!569815)))

(declare-fun b!1012977 () Bool)

(declare-fun Unit!33096 () Unit!33087)

(assert (=> b!1012977 (= e!569815 Unit!33096)))

(declare-fun b!1012978 () Bool)

(declare-fun Unit!33097 () Unit!33087)

(assert (=> b!1012978 (= e!569818 Unit!33097)))

(declare-fun b!1012979 () Bool)

(assert (=> b!1012979 (= e!569816 Nil!21377)))

(declare-fun bm!42614 () Bool)

(assert (=> bm!42614 (= call!42615 (lemmaForallGetValueByKeySameWithASmallerHead!16 (ite c!102386 lt!447823 lt!447824) (ite c!102386 lt!447817 lt!447816) value!115 (ite c!102386 lt!447821 lt!447822)))))

(declare-fun b!1012980 () Bool)

(declare-fun lt!447820 () Unit!33087)

(assert (=> b!1012980 (= lt!447820 e!569818)))

(declare-fun c!102387 () Bool)

(assert (=> b!1012980 (= c!102387 (not call!42614))))

(declare-fun lt!447814 () List!21380)

(assert (=> b!1012980 (= lt!447814 call!42617)))

(assert (=> b!1012980 (= e!569816 call!42617)))

(assert (= (and d!120363 c!102386) b!1012976))

(assert (= (and d!120363 (not c!102386)) b!1012974))

(assert (= (and b!1012976 c!102388) b!1012975))

(assert (= (and b!1012976 (not c!102388)) b!1012977))

(assert (= (and b!1012974 c!102389) b!1012980))

(assert (= (and b!1012974 (not c!102389)) b!1012979))

(assert (= (and b!1012980 c!102387) b!1012973))

(assert (= (and b!1012980 (not c!102387)) b!1012978))

(assert (= (or b!1012975 b!1012973) bm!42614))

(assert (= (or b!1012975 b!1012973) bm!42611))

(assert (= (or b!1012976 b!1012975 b!1012973 b!1012980) bm!42612))

(assert (= (or b!1012976 b!1012980) bm!42613))

(declare-fun m!936207 () Bool)

(assert (=> bm!42614 m!936207))

(declare-fun m!936209 () Bool)

(assert (=> bm!42613 m!936209))

(declare-fun m!936213 () Bool)

(assert (=> d!120363 m!936213))

(assert (=> d!120363 m!936159))

(declare-fun m!936219 () Bool)

(assert (=> bm!42612 m!936219))

(declare-fun m!936221 () Bool)

(assert (=> bm!42611 m!936221))

(assert (=> b!1012847 d!120363))

(declare-fun bs!28870 () Bool)

(declare-fun b!1013015 () Bool)

(assert (= bs!28870 (and b!1013015 b!1012846)))

(declare-fun lambda!466 () Int)

(assert (=> bs!28870 (= (= (t!30380 l!412) l!412) (= lambda!466 lambda!419))))

(declare-fun bs!28872 () Bool)

(assert (= bs!28872 (and b!1013015 b!1012975)))

(assert (=> bs!28872 (= (= (t!30380 l!412) (Cons!21375 lt!447821 lt!447823)) (= lambda!466 lambda!446))))

(declare-fun bs!28874 () Bool)

(assert (= bs!28874 (and b!1013015 b!1012973)))

(assert (=> bs!28874 (= (= (t!30380 l!412) (Cons!21375 lt!447822 lt!447824)) (= lambda!466 lambda!449))))

(declare-fun bs!28876 () Bool)

(assert (= bs!28876 (and b!1013015 d!120363)))

(assert (=> bs!28876 (= lambda!466 lambda!451)))

(assert (=> b!1013015 true))

(assert (=> b!1013015 true))

(declare-fun bs!28883 () Bool)

(declare-fun d!120367 () Bool)

(assert (= bs!28883 (and d!120367 d!120363)))

(declare-fun lambda!469 () Int)

(assert (=> bs!28883 (= (= (Cons!21375 (h!22573 l!412) (t!30380 l!412)) (t!30380 l!412)) (= lambda!469 lambda!451))))

(declare-fun bs!28885 () Bool)

(assert (= bs!28885 (and d!120367 b!1012973)))

(assert (=> bs!28885 (= (= (Cons!21375 (h!22573 l!412) (t!30380 l!412)) (Cons!21375 lt!447822 lt!447824)) (= lambda!469 lambda!449))))

(declare-fun bs!28887 () Bool)

(assert (= bs!28887 (and d!120367 b!1012975)))

(assert (=> bs!28887 (= (= (Cons!21375 (h!22573 l!412) (t!30380 l!412)) (Cons!21375 lt!447821 lt!447823)) (= lambda!469 lambda!446))))

(declare-fun bs!28889 () Bool)

(assert (= bs!28889 (and d!120367 b!1012846)))

(assert (=> bs!28889 (= (= (Cons!21375 (h!22573 l!412) (t!30380 l!412)) l!412) (= lambda!469 lambda!419))))

(declare-fun bs!28891 () Bool)

(assert (= bs!28891 (and d!120367 b!1013015)))

(assert (=> bs!28891 (= (= (Cons!21375 (h!22573 l!412) (t!30380 l!412)) (t!30380 l!412)) (= lambda!469 lambda!466))))

(assert (=> d!120367 true))

(assert (=> d!120367 true))

(assert (=> d!120367 true))

(assert (=> d!120367 (forall!221 lt!447709 lambda!469)))

(declare-fun lt!447845 () Unit!33087)

(declare-fun choose!1626 (List!21379 List!21380 B!1364 tuple2!15078) Unit!33087)

(assert (=> d!120367 (= lt!447845 (choose!1626 (t!30380 l!412) lt!447709 value!115 (h!22573 l!412)))))

(declare-fun e!569830 () Bool)

(assert (=> d!120367 e!569830))

(declare-fun res!680245 () Bool)

(assert (=> d!120367 (=> (not res!680245) (not e!569830))))

(assert (=> d!120367 (= res!680245 (isStrictlySorted!546 (t!30380 l!412)))))

(assert (=> d!120367 (= (lemmaForallGetValueByKeySameWithASmallerHead!16 (t!30380 l!412) lt!447709 value!115 (h!22573 l!412)) lt!447845)))

(declare-fun b!1013014 () Bool)

(declare-fun res!680243 () Bool)

(assert (=> b!1013014 (=> (not res!680243) (not e!569830))))

(declare-fun isEmpty!807 (List!21379) Bool)

(assert (=> b!1013014 (= res!680243 (not (isEmpty!807 (t!30380 l!412))))))

(declare-fun res!680244 () Bool)

(assert (=> b!1013015 (=> (not res!680244) (not e!569830))))

(assert (=> b!1013015 (= res!680244 (forall!221 lt!447709 lambda!466))))

(declare-fun b!1013016 () Bool)

(declare-fun head!929 (List!21379) tuple2!15078)

(assert (=> b!1013016 (= e!569830 (bvslt (_1!7550 (h!22573 l!412)) (_1!7550 (head!929 (t!30380 l!412)))))))

(assert (= (and d!120367 res!680245) b!1013014))

(assert (= (and b!1013014 res!680243) b!1013015))

(assert (= (and b!1013015 res!680244) b!1013016))

(declare-fun m!936235 () Bool)

(assert (=> d!120367 m!936235))

(declare-fun m!936237 () Bool)

(assert (=> d!120367 m!936237))

(assert (=> d!120367 m!936159))

(declare-fun m!936241 () Bool)

(assert (=> b!1013014 m!936241))

(declare-fun m!936243 () Bool)

(assert (=> b!1013015 m!936243))

(declare-fun m!936247 () Bool)

(assert (=> b!1013016 m!936247))

(assert (=> b!1012846 d!120367))

(declare-fun d!120373 () Bool)

(declare-fun res!680263 () Bool)

(declare-fun e!569848 () Bool)

(assert (=> d!120373 (=> res!680263 e!569848)))

(assert (=> d!120373 (= res!680263 (is-Nil!21377 lt!447709))))

(assert (=> d!120373 (= (forall!221 lt!447709 lambda!419) e!569848)))

(declare-fun b!1013038 () Bool)

(declare-fun e!569849 () Bool)

(assert (=> b!1013038 (= e!569848 e!569849)))

(declare-fun res!680264 () Bool)

(assert (=> b!1013038 (=> (not res!680264) (not e!569849))))

(declare-fun dynLambda!1881 (Int (_ BitVec 64)) Bool)

(assert (=> b!1013038 (= res!680264 (dynLambda!1881 lambda!419 (h!22574 lt!447709)))))

(declare-fun b!1013039 () Bool)

(assert (=> b!1013039 (= e!569849 (forall!221 (t!30381 lt!447709) lambda!419))))

(assert (= (and d!120373 (not res!680263)) b!1013038))

(assert (= (and b!1013038 res!680264) b!1013039))

(declare-fun b_lambda!15243 () Bool)

(assert (=> (not b_lambda!15243) (not b!1013038)))

(declare-fun m!936259 () Bool)

(assert (=> b!1013038 m!936259))

(declare-fun m!936261 () Bool)

(assert (=> b!1013039 m!936261))

(assert (=> b!1012846 d!120373))

(declare-fun d!120377 () Bool)

(declare-fun res!680267 () Bool)

(declare-fun e!569853 () Bool)

(assert (=> d!120377 (=> res!680267 e!569853)))

(assert (=> d!120377 (= res!680267 (or (is-Nil!21376 l!412) (is-Nil!21376 (t!30380 l!412))))))

(assert (=> d!120377 (= (isStrictlySorted!546 l!412) e!569853)))

(declare-fun b!1013043 () Bool)

(declare-fun e!569854 () Bool)

(assert (=> b!1013043 (= e!569853 e!569854)))

(declare-fun res!680268 () Bool)

(assert (=> b!1013043 (=> (not res!680268) (not e!569854))))

(assert (=> b!1013043 (= res!680268 (bvslt (_1!7550 (h!22573 l!412)) (_1!7550 (h!22573 (t!30380 l!412)))))))

(declare-fun b!1013044 () Bool)

(assert (=> b!1013044 (= e!569854 (isStrictlySorted!546 (t!30380 l!412)))))

(assert (= (and d!120377 (not res!680267)) b!1013043))

(assert (= (and b!1013043 res!680268) b!1013044))

(assert (=> b!1013044 m!936159))

(assert (=> start!87420 d!120377))

(declare-fun b!1013054 () Bool)

(declare-fun e!569860 () Bool)

(declare-fun tp!70361 () Bool)

(assert (=> b!1013054 (= e!569860 (and tp_is_empty!23431 tp!70361))))

(assert (=> b!1012849 (= tp!70346 e!569860)))

(assert (= (and b!1012849 (is-Cons!21375 (t!30380 l!412))) b!1013054))

(declare-fun b_lambda!15251 () Bool)

(assert (= b_lambda!15243 (or b!1012846 b_lambda!15251)))

(declare-fun bs!28895 () Bool)

(declare-fun d!120383 () Bool)

(assert (= bs!28895 (and d!120383 b!1012846)))

(declare-datatypes ((Option!570 0))(
  ( (Some!569 (v!14420 B!1364)) (None!568) )
))
(declare-fun getValueByKey!519 (List!21379 (_ BitVec 64)) Option!570)

(assert (=> bs!28895 (= (dynLambda!1881 lambda!419 (h!22574 lt!447709)) (= (getValueByKey!519 l!412 (h!22574 lt!447709)) (Some!569 value!115)))))

(declare-fun m!936271 () Bool)

(assert (=> bs!28895 m!936271))

(assert (=> b!1013038 d!120383))

(push 1)

