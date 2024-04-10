; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87288 () Bool)

(assert start!87288)

(declare-fun b!1011849 () Bool)

(declare-fun res!679773 () Bool)

(declare-fun e!569227 () Bool)

(assert (=> b!1011849 (=> (not res!679773) (not e!569227))))

(declare-datatypes ((B!1316 0))(
  ( (B!1317 (val!11742 Int)) )
))
(declare-datatypes ((tuple2!15030 0))(
  ( (tuple2!15031 (_1!7526 (_ BitVec 64)) (_2!7526 B!1316)) )
))
(declare-datatypes ((List!21334 0))(
  ( (Nil!21331) (Cons!21330 (h!22528 tuple2!15030) (t!30335 List!21334)) )
))
(declare-fun l!412 () List!21334)

(declare-fun value!115 () B!1316)

(declare-datatypes ((List!21335 0))(
  ( (Nil!21332) (Cons!21331 (h!22529 (_ BitVec 64)) (t!30336 List!21335)) )
))
(declare-fun isEmpty!774 (List!21335) Bool)

(declare-fun getKeysOf!7 (List!21334 B!1316) List!21335)

(assert (=> b!1011849 (= res!679773 (not (isEmpty!774 (getKeysOf!7 (t!30335 l!412) value!115))))))

(declare-fun b!1011848 () Bool)

(declare-fun res!679772 () Bool)

(assert (=> b!1011848 (=> (not res!679772) (not e!569227))))

(assert (=> b!1011848 (= res!679772 (and (is-Cons!21330 l!412) (= (_2!7526 (h!22528 l!412)) value!115)))))

(declare-fun b!1011851 () Bool)

(declare-fun e!569226 () Bool)

(declare-fun tp_is_empty!23383 () Bool)

(declare-fun tp!70229 () Bool)

(assert (=> b!1011851 (= e!569226 (and tp_is_empty!23383 tp!70229))))

(declare-fun res!679771 () Bool)

(assert (=> start!87288 (=> (not res!679771) (not e!569227))))

(declare-fun isStrictlySorted!522 (List!21334) Bool)

(assert (=> start!87288 (= res!679771 (isStrictlySorted!522 l!412))))

(assert (=> start!87288 e!569227))

(assert (=> start!87288 e!569226))

(assert (=> start!87288 tp_is_empty!23383))

(declare-fun b!1011850 () Bool)

(assert (=> b!1011850 (= e!569227 (not (isStrictlySorted!522 (t!30335 l!412))))))

(assert (= (and start!87288 res!679771) b!1011848))

(assert (= (and b!1011848 res!679772) b!1011849))

(assert (= (and b!1011849 res!679773) b!1011850))

(assert (= (and start!87288 (is-Cons!21330 l!412)) b!1011851))

(declare-fun m!935757 () Bool)

(assert (=> b!1011849 m!935757))

(assert (=> b!1011849 m!935757))

(declare-fun m!935759 () Bool)

(assert (=> b!1011849 m!935759))

(declare-fun m!935761 () Bool)

(assert (=> start!87288 m!935761))

(declare-fun m!935763 () Bool)

(assert (=> b!1011850 m!935763))

(push 1)

(assert (not b!1011849))

(assert (not start!87288))

(assert tp_is_empty!23383)

(assert (not b!1011850))

(assert (not b!1011851))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120209 () Bool)

(assert (=> d!120209 (= (isEmpty!774 (getKeysOf!7 (t!30335 l!412) value!115)) (is-Nil!21332 (getKeysOf!7 (t!30335 l!412) value!115)))))

(assert (=> b!1011849 d!120209))

(declare-fun b!1011930 () Bool)

(assert (=> b!1011930 true))

(assert (=> b!1011930 true))

(assert (=> b!1011930 true))

(declare-fun bs!28749 () Bool)

(declare-fun b!1011926 () Bool)

(assert (= bs!28749 (and b!1011926 b!1011930)))

(declare-fun lt!447232 () tuple2!15030)

(declare-fun lt!447239 () List!21334)

(declare-fun lt!447234 () tuple2!15030)

(declare-fun lambda!250 () Int)

(declare-fun lambda!249 () Int)

(declare-fun lt!447240 () List!21334)

(assert (=> bs!28749 (= (= (Cons!21330 lt!447232 lt!447240) (Cons!21330 lt!447234 lt!447239)) (= lambda!250 lambda!249))))

(assert (=> b!1011926 true))

(assert (=> b!1011926 true))

(assert (=> b!1011926 true))

(declare-fun bs!28750 () Bool)

(declare-fun d!120211 () Bool)

(assert (= bs!28750 (and d!120211 b!1011930)))

(declare-fun lambda!251 () Int)

(assert (=> bs!28750 (= (= (t!30335 l!412) (Cons!21330 lt!447234 lt!447239)) (= lambda!251 lambda!249))))

(declare-fun bs!28751 () Bool)

(assert (= bs!28751 (and d!120211 b!1011926)))

(assert (=> bs!28751 (= (= (t!30335 l!412) (Cons!21330 lt!447232 lt!447240)) (= lambda!251 lambda!250))))

(assert (=> d!120211 true))

(assert (=> d!120211 true))

(declare-fun b!1011924 () Bool)

(declare-fun e!569272 () List!21335)

(assert (=> b!1011924 (= e!569272 Nil!21332)))

(declare-datatypes ((Unit!33040 0))(
  ( (Unit!33041) )
))
(declare-fun e!569273 () Unit!33040)

(declare-fun lt!447237 () Unit!33040)

(assert (=> b!1011926 (= e!569273 lt!447237)))

(assert (=> b!1011926 (= lt!447240 (t!30335 (t!30335 l!412)))))

(declare-fun lt!447230 () List!21335)

(declare-fun call!42453 () List!21335)

(assert (=> b!1011926 (= lt!447230 call!42453)))

(assert (=> b!1011926 (= lt!447232 (h!22528 (t!30335 l!412)))))

(declare-fun call!42452 () Unit!33040)

(assert (=> b!1011926 (= lt!447237 call!42452)))

(declare-fun call!42450 () Bool)

(assert (=> b!1011926 call!42450))

(declare-fun b!1011927 () Bool)

(declare-fun e!569274 () List!21335)

(assert (=> b!1011927 (= e!569274 (Cons!21331 (_1!7526 (h!22528 (t!30335 l!412))) call!42453))))

(declare-fun c!102205 () Bool)

(declare-fun call!42451 () Bool)

(assert (=> b!1011927 (= c!102205 (not call!42451))))

(declare-fun lt!447236 () Unit!33040)

(declare-fun e!569275 () Unit!33040)

(assert (=> b!1011927 (= lt!447236 e!569275)))

(declare-fun b!1011928 () Bool)

(declare-fun lt!447231 () Unit!33040)

(assert (=> b!1011928 (= lt!447231 e!569273)))

(declare-fun c!102204 () Bool)

(assert (=> b!1011928 (= c!102204 (not call!42451))))

(declare-fun lt!447229 () List!21335)

(assert (=> b!1011928 (= lt!447229 call!42453)))

(assert (=> b!1011928 (= e!569272 call!42453)))

(declare-fun lt!447238 () List!21335)

(declare-fun c!102203 () Bool)

(declare-fun bm!42447 () Bool)

(declare-fun forall!203 (List!21335 Int) Bool)

(assert (=> bm!42447 (= call!42450 (forall!203 (ite c!102203 lt!447238 lt!447230) (ite c!102203 lambda!249 lambda!250)))))

(declare-fun bm!42448 () Bool)

(assert (=> bm!42448 (= call!42451 (isEmpty!774 call!42453))))

(declare-fun b!1011929 () Bool)

(declare-fun Unit!33042 () Unit!33040)

(assert (=> b!1011929 (= e!569275 Unit!33042)))

(declare-fun lt!447235 () List!21335)

(assert (=> d!120211 (forall!203 lt!447235 lambda!251)))

(assert (=> d!120211 (= lt!447235 e!569274)))

(assert (=> d!120211 (= c!102203 (and (is-Cons!21330 (t!30335 l!412)) (= (_2!7526 (h!22528 (t!30335 l!412))) value!115)))))

(assert (=> d!120211 (isStrictlySorted!522 (t!30335 l!412))))

(assert (=> d!120211 (= (getKeysOf!7 (t!30335 l!412) value!115) lt!447235)))

(declare-fun b!1011925 () Bool)

(declare-fun Unit!33043 () Unit!33040)

(assert (=> b!1011925 (= e!569273 Unit!33043)))

(declare-fun bm!42449 () Bool)

(assert (=> bm!42449 (= call!42453 (getKeysOf!7 (t!30335 (t!30335 l!412)) value!115))))

(assert (=> b!1011930 call!42450))

(declare-fun lt!447233 () Unit!33040)

(assert (=> b!1011930 (= lt!447233 call!42452)))

(assert (=> b!1011930 (= lt!447234 (h!22528 (t!30335 l!412)))))

(assert (=> b!1011930 (= lt!447238 call!42453)))

(assert (=> b!1011930 (= lt!447239 (t!30335 (t!30335 l!412)))))

(assert (=> b!1011930 (= e!569275 lt!447233)))

(declare-fun b!1011931 () Bool)

(assert (=> b!1011931 (= e!569274 e!569272)))

(declare-fun c!102206 () Bool)

(assert (=> b!1011931 (= c!102206 (and (is-Cons!21330 (t!30335 l!412)) (not (= (_2!7526 (h!22528 (t!30335 l!412))) value!115))))))

(declare-fun bm!42450 () Bool)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!4 (List!21334 List!21335 B!1316 tuple2!15030) Unit!33040)

(assert (=> bm!42450 (= call!42452 (lemmaForallGetValueByKeySameWithASmallerHead!4 (ite c!102203 lt!447239 lt!447240) (ite c!102203 lt!447238 lt!447230) value!115 (ite c!102203 lt!447234 lt!447232)))))

(assert (= (and d!120211 c!102203) b!1011927))

(assert (= (and d!120211 (not c!102203)) b!1011931))

(assert (= (and b!1011927 c!102205) b!1011930))

(assert (= (and b!1011927 (not c!102205)) b!1011929))

(assert (= (and b!1011931 c!102206) b!1011928))

(assert (= (and b!1011931 (not c!102206)) b!1011924))

(assert (= (and b!1011928 c!102204) b!1011926))

(assert (= (and b!1011928 (not c!102204)) b!1011925))

(assert (= (or b!1011930 b!1011926) bm!42450))

(assert (= (or b!1011930 b!1011926) bm!42447))

(assert (= (or b!1011927 b!1011930 b!1011926 b!1011928) bm!42449))

(assert (= (or b!1011927 b!1011928) bm!42448))

(declare-fun m!935785 () Bool)

(assert (=> bm!42448 m!935785))

(declare-fun m!935787 () Bool)

(assert (=> d!120211 m!935787))

(assert (=> d!120211 m!935763))

(declare-fun m!935789 () Bool)

(assert (=> bm!42450 m!935789))

(declare-fun m!935791 () Bool)

(assert (=> bm!42447 m!935791))

(declare-fun m!935793 () Bool)

(assert (=> bm!42449 m!935793))

(assert (=> b!1011849 d!120211))

(declare-fun d!120227 () Bool)

(declare-fun res!679812 () Bool)

(declare-fun e!569280 () Bool)

(assert (=> d!120227 (=> res!679812 e!569280)))

(assert (=> d!120227 (= res!679812 (or (is-Nil!21331 l!412) (is-Nil!21331 (t!30335 l!412))))))

(assert (=> d!120227 (= (isStrictlySorted!522 l!412) e!569280)))

(declare-fun b!1011942 () Bool)

(declare-fun e!569281 () Bool)

(assert (=> b!1011942 (= e!569280 e!569281)))

(declare-fun res!679813 () Bool)

(assert (=> b!1011942 (=> (not res!679813) (not e!569281))))

(assert (=> b!1011942 (= res!679813 (bvslt (_1!7526 (h!22528 l!412)) (_1!7526 (h!22528 (t!30335 l!412)))))))

(declare-fun b!1011943 () Bool)

(assert (=> b!1011943 (= e!569281 (isStrictlySorted!522 (t!30335 l!412)))))

(assert (= (and d!120227 (not res!679812)) b!1011942))

(assert (= (and b!1011942 res!679813) b!1011943))

(assert (=> b!1011943 m!935763))

(assert (=> start!87288 d!120227))

(declare-fun d!120229 () Bool)

(declare-fun res!679814 () Bool)

(declare-fun e!569282 () Bool)

(assert (=> d!120229 (=> res!679814 e!569282)))

(assert (=> d!120229 (= res!679814 (or (is-Nil!21331 (t!30335 l!412)) (is-Nil!21331 (t!30335 (t!30335 l!412)))))))

(assert (=> d!120229 (= (isStrictlySorted!522 (t!30335 l!412)) e!569282)))

(declare-fun b!1011944 () Bool)

(declare-fun e!569283 () Bool)

(assert (=> b!1011944 (= e!569282 e!569283)))

(declare-fun res!679815 () Bool)

(assert (=> b!1011944 (=> (not res!679815) (not e!569283))))

(assert (=> b!1011944 (= res!679815 (bvslt (_1!7526 (h!22528 (t!30335 l!412))) (_1!7526 (h!22528 (t!30335 (t!30335 l!412))))))))

(declare-fun b!1011945 () Bool)

(assert (=> b!1011945 (= e!569283 (isStrictlySorted!522 (t!30335 (t!30335 l!412))))))

(assert (= (and d!120229 (not res!679814)) b!1011944))

(assert (= (and b!1011944 res!679815) b!1011945))

(declare-fun m!935795 () Bool)

(assert (=> b!1011945 m!935795))

(assert (=> b!1011850 d!120229))

(declare-fun b!1011950 () Bool)

(declare-fun e!569286 () Bool)

(declare-fun tp!70238 () Bool)

(assert (=> b!1011950 (= e!569286 (and tp_is_empty!23383 tp!70238))))

(assert (=> b!1011851 (= tp!70229 e!569286)))

(assert (= (and b!1011851 (is-Cons!21330 (t!30335 l!412))) b!1011950))

(push 1)

(assert (not bm!42447))

(assert (not bm!42450))

(assert tp_is_empty!23383)

(assert (not b!1011950))

(assert (not bm!42449))

(assert (not d!120211))

(assert (not bm!42448))

(assert (not b!1011943))

(assert (not b!1011945))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

