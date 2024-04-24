; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87820 () Bool)

(assert start!87820)

(declare-fun b!1015020 () Bool)

(assert (=> b!1015020 true))

(assert (=> b!1015020 true))

(declare-datatypes ((Unit!33133 0))(
  ( (Unit!33134) )
))
(declare-fun e!571096 () Unit!33133)

(declare-fun lt!448655 () Unit!33133)

(assert (=> b!1015020 (= e!571096 lt!448655)))

(declare-datatypes ((List!21404 0))(
  ( (Nil!21401) (Cons!21400 (h!22607 (_ BitVec 64)) (t!30397 List!21404)) )
))
(declare-fun lt!448653 () List!21404)

(declare-datatypes ((B!1412 0))(
  ( (B!1413 (val!11790 Int)) )
))
(declare-fun value!115 () B!1412)

(declare-datatypes ((tuple2!15130 0))(
  ( (tuple2!15131 (_1!7576 (_ BitVec 64)) (_2!7576 B!1412)) )
))
(declare-datatypes ((List!21405 0))(
  ( (Nil!21402) (Cons!21401 (h!22608 tuple2!15130) (t!30398 List!21405)) )
))
(declare-fun l!412 () List!21405)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!29 (List!21405 List!21404 B!1412 tuple2!15130) Unit!33133)

(assert (=> b!1015020 (= lt!448655 (lemmaForallGetValueByKeySameWithASmallerHead!29 (t!30398 l!412) lt!448653 value!115 (h!22608 l!412)))))

(declare-fun lambda!545 () Int)

(declare-fun forall!234 (List!21404 Int) Bool)

(assert (=> b!1015020 (forall!234 lt!448653 lambda!545)))

(declare-fun b!1015021 () Bool)

(declare-fun Unit!33135 () Unit!33133)

(assert (=> b!1015021 (= e!571096 Unit!33135)))

(declare-fun b!1015022 () Bool)

(declare-fun e!571098 () Bool)

(declare-fun tp_is_empty!23479 () Bool)

(declare-fun tp!70464 () Bool)

(assert (=> b!1015022 (= e!571098 (and tp_is_empty!23479 tp!70464))))

(declare-fun b!1015023 () Bool)

(declare-fun res!681013 () Bool)

(declare-fun e!571097 () Bool)

(assert (=> b!1015023 (=> (not res!681013) (not e!571097))))

(get-info :version)

(assert (=> b!1015023 (= res!681013 (and ((_ is Cons!21401) l!412) (= (_2!7576 (h!22608 l!412)) value!115)))))

(declare-fun b!1015024 () Bool)

(declare-fun ListPrimitiveSize!106 (List!21405) Int)

(assert (=> b!1015024 (= e!571097 (>= (ListPrimitiveSize!106 (t!30398 l!412)) (ListPrimitiveSize!106 l!412)))))

(declare-fun lt!448654 () Unit!33133)

(assert (=> b!1015024 (= lt!448654 e!571096)))

(declare-fun c!102925 () Bool)

(declare-fun isEmpty!826 (List!21404) Bool)

(assert (=> b!1015024 (= c!102925 (not (isEmpty!826 lt!448653)))))

(declare-fun getKeysOf!40 (List!21405 B!1412) List!21404)

(assert (=> b!1015024 (= lt!448653 (getKeysOf!40 (t!30398 l!412) value!115))))

(declare-fun res!681014 () Bool)

(assert (=> start!87820 (=> (not res!681014) (not e!571097))))

(declare-fun isStrictlySorted!552 (List!21405) Bool)

(assert (=> start!87820 (= res!681014 (isStrictlySorted!552 l!412))))

(assert (=> start!87820 e!571097))

(assert (=> start!87820 e!571098))

(assert (=> start!87820 tp_is_empty!23479))

(assert (= (and start!87820 res!681014) b!1015023))

(assert (= (and b!1015023 res!681013) b!1015024))

(assert (= (and b!1015024 c!102925) b!1015020))

(assert (= (and b!1015024 (not c!102925)) b!1015021))

(assert (= (and start!87820 ((_ is Cons!21401) l!412)) b!1015022))

(declare-fun m!938201 () Bool)

(assert (=> b!1015020 m!938201))

(declare-fun m!938203 () Bool)

(assert (=> b!1015020 m!938203))

(declare-fun m!938205 () Bool)

(assert (=> b!1015024 m!938205))

(declare-fun m!938207 () Bool)

(assert (=> b!1015024 m!938207))

(declare-fun m!938209 () Bool)

(assert (=> b!1015024 m!938209))

(declare-fun m!938211 () Bool)

(assert (=> b!1015024 m!938211))

(declare-fun m!938213 () Bool)

(assert (=> start!87820 m!938213))

(check-sat tp_is_empty!23479 (not b!1015024) (not b!1015022) (not b!1015020) (not start!87820))
(check-sat)
(get-model)

(declare-fun bs!28970 () Bool)

(declare-fun b!1015090 () Bool)

(assert (= bs!28970 (and b!1015090 b!1015020)))

(declare-fun lambda!556 () Int)

(assert (=> bs!28970 (= (= (t!30398 l!412) l!412) (= lambda!556 lambda!545))))

(assert (=> b!1015090 true))

(assert (=> b!1015090 true))

(declare-fun bs!28971 () Bool)

(declare-fun d!120985 () Bool)

(assert (= bs!28971 (and d!120985 b!1015020)))

(declare-fun lambda!557 () Int)

(assert (=> bs!28971 (= (= (Cons!21401 (h!22608 l!412) (t!30398 l!412)) l!412) (= lambda!557 lambda!545))))

(declare-fun bs!28972 () Bool)

(assert (= bs!28972 (and d!120985 b!1015090)))

(assert (=> bs!28972 (= (= (Cons!21401 (h!22608 l!412) (t!30398 l!412)) (t!30398 l!412)) (= lambda!557 lambda!556))))

(assert (=> d!120985 true))

(assert (=> d!120985 true))

(assert (=> d!120985 true))

(assert (=> d!120985 (forall!234 lt!448653 lambda!557)))

(declare-fun lt!448678 () Unit!33133)

(declare-fun choose!1634 (List!21405 List!21404 B!1412 tuple2!15130) Unit!33133)

(assert (=> d!120985 (= lt!448678 (choose!1634 (t!30398 l!412) lt!448653 value!115 (h!22608 l!412)))))

(declare-fun e!571133 () Bool)

(assert (=> d!120985 e!571133))

(declare-fun res!681045 () Bool)

(assert (=> d!120985 (=> (not res!681045) (not e!571133))))

(assert (=> d!120985 (= res!681045 (isStrictlySorted!552 (t!30398 l!412)))))

(assert (=> d!120985 (= (lemmaForallGetValueByKeySameWithASmallerHead!29 (t!30398 l!412) lt!448653 value!115 (h!22608 l!412)) lt!448678)))

(declare-fun b!1015089 () Bool)

(declare-fun res!681047 () Bool)

(assert (=> b!1015089 (=> (not res!681047) (not e!571133))))

(declare-fun isEmpty!829 (List!21405) Bool)

(assert (=> b!1015089 (= res!681047 (not (isEmpty!829 (t!30398 l!412))))))

(declare-fun res!681046 () Bool)

(assert (=> b!1015090 (=> (not res!681046) (not e!571133))))

(assert (=> b!1015090 (= res!681046 (forall!234 lt!448653 lambda!556))))

(declare-fun b!1015091 () Bool)

(declare-fun head!932 (List!21405) tuple2!15130)

(assert (=> b!1015091 (= e!571133 (bvslt (_1!7576 (h!22608 l!412)) (_1!7576 (head!932 (t!30398 l!412)))))))

(assert (= (and d!120985 res!681045) b!1015089))

(assert (= (and b!1015089 res!681047) b!1015090))

(assert (= (and b!1015090 res!681046) b!1015091))

(declare-fun m!938249 () Bool)

(assert (=> d!120985 m!938249))

(declare-fun m!938251 () Bool)

(assert (=> d!120985 m!938251))

(declare-fun m!938253 () Bool)

(assert (=> d!120985 m!938253))

(declare-fun m!938255 () Bool)

(assert (=> b!1015089 m!938255))

(declare-fun m!938257 () Bool)

(assert (=> b!1015090 m!938257))

(declare-fun m!938259 () Bool)

(assert (=> b!1015091 m!938259))

(assert (=> b!1015020 d!120985))

(declare-fun d!121001 () Bool)

(declare-fun res!681052 () Bool)

(declare-fun e!571144 () Bool)

(assert (=> d!121001 (=> res!681052 e!571144)))

(assert (=> d!121001 (= res!681052 ((_ is Nil!21401) lt!448653))))

(assert (=> d!121001 (= (forall!234 lt!448653 lambda!545) e!571144)))

(declare-fun b!1015110 () Bool)

(declare-fun e!571145 () Bool)

(assert (=> b!1015110 (= e!571144 e!571145)))

(declare-fun res!681053 () Bool)

(assert (=> b!1015110 (=> (not res!681053) (not e!571145))))

(declare-fun dynLambda!1911 (Int (_ BitVec 64)) Bool)

(assert (=> b!1015110 (= res!681053 (dynLambda!1911 lambda!545 (h!22607 lt!448653)))))

(declare-fun b!1015111 () Bool)

(assert (=> b!1015111 (= e!571145 (forall!234 (t!30397 lt!448653) lambda!545))))

(assert (= (and d!121001 (not res!681052)) b!1015110))

(assert (= (and b!1015110 res!681053) b!1015111))

(declare-fun b_lambda!15279 () Bool)

(assert (=> (not b_lambda!15279) (not b!1015110)))

(declare-fun m!938263 () Bool)

(assert (=> b!1015110 m!938263))

(declare-fun m!938265 () Bool)

(assert (=> b!1015111 m!938265))

(assert (=> b!1015020 d!121001))

(declare-fun d!121009 () Bool)

(declare-fun lt!448687 () Int)

(assert (=> d!121009 (>= lt!448687 0)))

(declare-fun e!571148 () Int)

(assert (=> d!121009 (= lt!448687 e!571148)))

(declare-fun c!102942 () Bool)

(assert (=> d!121009 (= c!102942 ((_ is Nil!21402) (t!30398 l!412)))))

(assert (=> d!121009 (= (ListPrimitiveSize!106 (t!30398 l!412)) lt!448687)))

(declare-fun b!1015116 () Bool)

(assert (=> b!1015116 (= e!571148 0)))

(declare-fun b!1015117 () Bool)

(assert (=> b!1015117 (= e!571148 (+ 1 (ListPrimitiveSize!106 (t!30398 (t!30398 l!412)))))))

(assert (= (and d!121009 c!102942) b!1015116))

(assert (= (and d!121009 (not c!102942)) b!1015117))

(declare-fun m!938267 () Bool)

(assert (=> b!1015117 m!938267))

(assert (=> b!1015024 d!121009))

(declare-fun d!121011 () Bool)

(declare-fun lt!448688 () Int)

(assert (=> d!121011 (>= lt!448688 0)))

(declare-fun e!571149 () Int)

(assert (=> d!121011 (= lt!448688 e!571149)))

(declare-fun c!102943 () Bool)

(assert (=> d!121011 (= c!102943 ((_ is Nil!21402) l!412))))

(assert (=> d!121011 (= (ListPrimitiveSize!106 l!412) lt!448688)))

(declare-fun b!1015118 () Bool)

(assert (=> b!1015118 (= e!571149 0)))

(declare-fun b!1015119 () Bool)

(assert (=> b!1015119 (= e!571149 (+ 1 (ListPrimitiveSize!106 (t!30398 l!412))))))

(assert (= (and d!121011 c!102943) b!1015118))

(assert (= (and d!121011 (not c!102943)) b!1015119))

(assert (=> b!1015119 m!938205))

(assert (=> b!1015024 d!121011))

(declare-fun d!121013 () Bool)

(assert (=> d!121013 (= (isEmpty!826 lt!448653) ((_ is Nil!21401) lt!448653))))

(assert (=> b!1015024 d!121013))

(declare-fun bs!28973 () Bool)

(declare-fun b!1015175 () Bool)

(assert (= bs!28973 (and b!1015175 b!1015020)))

(declare-fun lambda!572 () Int)

(declare-fun lt!448772 () List!21405)

(declare-fun lt!448769 () tuple2!15130)

(assert (=> bs!28973 (= (= (Cons!21401 lt!448769 lt!448772) l!412) (= lambda!572 lambda!545))))

(declare-fun bs!28974 () Bool)

(assert (= bs!28974 (and b!1015175 b!1015090)))

(assert (=> bs!28974 (= (= (Cons!21401 lt!448769 lt!448772) (t!30398 l!412)) (= lambda!572 lambda!556))))

(declare-fun bs!28975 () Bool)

(assert (= bs!28975 (and b!1015175 d!120985)))

(assert (=> bs!28975 (= (= (Cons!21401 lt!448769 lt!448772) (Cons!21401 (h!22608 l!412) (t!30398 l!412))) (= lambda!572 lambda!557))))

(assert (=> b!1015175 true))

(assert (=> b!1015175 true))

(assert (=> b!1015175 true))

(declare-fun bs!28976 () Bool)

(declare-fun b!1015168 () Bool)

(assert (= bs!28976 (and b!1015168 b!1015020)))

(declare-fun lt!448761 () List!21405)

(declare-fun lambda!573 () Int)

(declare-fun lt!448768 () tuple2!15130)

(assert (=> bs!28976 (= (= (Cons!21401 lt!448768 lt!448761) l!412) (= lambda!573 lambda!545))))

(declare-fun bs!28977 () Bool)

(assert (= bs!28977 (and b!1015168 b!1015090)))

(assert (=> bs!28977 (= (= (Cons!21401 lt!448768 lt!448761) (t!30398 l!412)) (= lambda!573 lambda!556))))

(declare-fun bs!28978 () Bool)

(assert (= bs!28978 (and b!1015168 d!120985)))

(assert (=> bs!28978 (= (= (Cons!21401 lt!448768 lt!448761) (Cons!21401 (h!22608 l!412) (t!30398 l!412))) (= lambda!573 lambda!557))))

(declare-fun bs!28979 () Bool)

(assert (= bs!28979 (and b!1015168 b!1015175)))

(assert (=> bs!28979 (= (= (Cons!21401 lt!448768 lt!448761) (Cons!21401 lt!448769 lt!448772)) (= lambda!573 lambda!572))))

(assert (=> b!1015168 true))

(assert (=> b!1015168 true))

(assert (=> b!1015168 true))

(declare-fun bs!28980 () Bool)

(declare-fun d!121015 () Bool)

(assert (= bs!28980 (and d!121015 b!1015020)))

(declare-fun lambda!574 () Int)

(assert (=> bs!28980 (= (= (t!30398 l!412) l!412) (= lambda!574 lambda!545))))

(declare-fun bs!28981 () Bool)

(assert (= bs!28981 (and d!121015 b!1015175)))

(assert (=> bs!28981 (= (= (t!30398 l!412) (Cons!21401 lt!448769 lt!448772)) (= lambda!574 lambda!572))))

(declare-fun bs!28982 () Bool)

(assert (= bs!28982 (and d!121015 d!120985)))

(assert (=> bs!28982 (= (= (t!30398 l!412) (Cons!21401 (h!22608 l!412) (t!30398 l!412))) (= lambda!574 lambda!557))))

(declare-fun bs!28983 () Bool)

(assert (= bs!28983 (and d!121015 b!1015168)))

(assert (=> bs!28983 (= (= (t!30398 l!412) (Cons!21401 lt!448768 lt!448761)) (= lambda!574 lambda!573))))

(declare-fun bs!28984 () Bool)

(assert (= bs!28984 (and d!121015 b!1015090)))

(assert (=> bs!28984 (= lambda!574 lambda!556)))

(assert (=> d!121015 true))

(assert (=> d!121015 true))

(declare-fun e!571175 () Unit!33133)

(declare-fun lt!448771 () Unit!33133)

(assert (=> b!1015168 (= e!571175 lt!448771)))

(assert (=> b!1015168 (= lt!448761 (t!30398 (t!30398 l!412)))))

(declare-fun lt!448762 () List!21404)

(declare-fun call!42769 () List!21404)

(assert (=> b!1015168 (= lt!448762 call!42769)))

(assert (=> b!1015168 (= lt!448768 (h!22608 (t!30398 l!412)))))

(declare-fun call!42772 () Unit!33133)

(assert (=> b!1015168 (= lt!448771 call!42772)))

(declare-fun call!42771 () Bool)

(assert (=> b!1015168 call!42771))

(declare-fun lt!448766 () List!21404)

(assert (=> d!121015 (forall!234 lt!448766 lambda!574)))

(declare-fun e!571177 () List!21404)

(assert (=> d!121015 (= lt!448766 e!571177)))

(declare-fun c!102969 () Bool)

(assert (=> d!121015 (= c!102969 (and ((_ is Cons!21401) (t!30398 l!412)) (= (_2!7576 (h!22608 (t!30398 l!412))) value!115)))))

(assert (=> d!121015 (isStrictlySorted!552 (t!30398 l!412))))

(assert (=> d!121015 (= (getKeysOf!40 (t!30398 l!412) value!115) lt!448766)))

(declare-fun bm!42766 () Bool)

(assert (=> bm!42766 (= call!42769 (getKeysOf!40 (t!30398 (t!30398 l!412)) value!115))))

(declare-fun b!1015169 () Bool)

(declare-fun e!571174 () Unit!33133)

(declare-fun Unit!33142 () Unit!33133)

(assert (=> b!1015169 (= e!571174 Unit!33142)))

(declare-fun b!1015170 () Bool)

(declare-fun Unit!33143 () Unit!33133)

(assert (=> b!1015170 (= e!571175 Unit!33143)))

(declare-fun lt!448763 () List!21404)

(declare-fun bm!42767 () Bool)

(assert (=> bm!42767 (= call!42772 (lemmaForallGetValueByKeySameWithASmallerHead!29 (ite c!102969 lt!448772 lt!448761) (ite c!102969 lt!448763 lt!448762) value!115 (ite c!102969 lt!448769 lt!448768)))))

(declare-fun bm!42768 () Bool)

(assert (=> bm!42768 (= call!42771 (forall!234 (ite c!102969 lt!448763 lt!448762) (ite c!102969 lambda!572 lambda!573)))))

(declare-fun b!1015171 () Bool)

(assert (=> b!1015171 (= e!571177 (Cons!21400 (_1!7576 (h!22608 (t!30398 l!412))) call!42769))))

(declare-fun c!102970 () Bool)

(declare-fun call!42770 () Bool)

(assert (=> b!1015171 (= c!102970 (not call!42770))))

(declare-fun lt!448767 () Unit!33133)

(assert (=> b!1015171 (= lt!448767 e!571174)))

(declare-fun bm!42769 () Bool)

(assert (=> bm!42769 (= call!42770 (isEmpty!826 call!42769))))

(declare-fun b!1015172 () Bool)

(declare-fun lt!448770 () Unit!33133)

(assert (=> b!1015172 (= lt!448770 e!571175)))

(declare-fun c!102968 () Bool)

(assert (=> b!1015172 (= c!102968 (not call!42770))))

(declare-fun lt!448764 () List!21404)

(assert (=> b!1015172 (= lt!448764 call!42769)))

(declare-fun e!571176 () List!21404)

(assert (=> b!1015172 (= e!571176 call!42769)))

(declare-fun b!1015173 () Bool)

(assert (=> b!1015173 (= e!571176 Nil!21401)))

(declare-fun b!1015174 () Bool)

(assert (=> b!1015174 (= e!571177 e!571176)))

(declare-fun c!102971 () Bool)

(assert (=> b!1015174 (= c!102971 (and ((_ is Cons!21401) (t!30398 l!412)) (not (= (_2!7576 (h!22608 (t!30398 l!412))) value!115))))))

(assert (=> b!1015175 call!42771))

(declare-fun lt!448765 () Unit!33133)

(assert (=> b!1015175 (= lt!448765 call!42772)))

(assert (=> b!1015175 (= lt!448769 (h!22608 (t!30398 l!412)))))

(assert (=> b!1015175 (= lt!448763 call!42769)))

(assert (=> b!1015175 (= lt!448772 (t!30398 (t!30398 l!412)))))

(assert (=> b!1015175 (= e!571174 lt!448765)))

(assert (= (and d!121015 c!102969) b!1015171))

(assert (= (and d!121015 (not c!102969)) b!1015174))

(assert (= (and b!1015171 c!102970) b!1015175))

(assert (= (and b!1015171 (not c!102970)) b!1015169))

(assert (= (and b!1015174 c!102971) b!1015172))

(assert (= (and b!1015174 (not c!102971)) b!1015173))

(assert (= (and b!1015172 c!102968) b!1015168))

(assert (= (and b!1015172 (not c!102968)) b!1015170))

(assert (= (or b!1015175 b!1015168) bm!42767))

(assert (= (or b!1015175 b!1015168) bm!42768))

(assert (= (or b!1015171 b!1015175 b!1015168 b!1015172) bm!42766))

(assert (= (or b!1015171 b!1015172) bm!42769))

(declare-fun m!938269 () Bool)

(assert (=> d!121015 m!938269))

(assert (=> d!121015 m!938253))

(declare-fun m!938271 () Bool)

(assert (=> bm!42767 m!938271))

(declare-fun m!938273 () Bool)

(assert (=> bm!42769 m!938273))

(declare-fun m!938275 () Bool)

(assert (=> bm!42768 m!938275))

(declare-fun m!938277 () Bool)

(assert (=> bm!42766 m!938277))

(assert (=> b!1015024 d!121015))

(declare-fun d!121017 () Bool)

(declare-fun res!681058 () Bool)

(declare-fun e!571182 () Bool)

(assert (=> d!121017 (=> res!681058 e!571182)))

(assert (=> d!121017 (= res!681058 (or ((_ is Nil!21402) l!412) ((_ is Nil!21402) (t!30398 l!412))))))

(assert (=> d!121017 (= (isStrictlySorted!552 l!412) e!571182)))

(declare-fun b!1015180 () Bool)

(declare-fun e!571183 () Bool)

(assert (=> b!1015180 (= e!571182 e!571183)))

(declare-fun res!681059 () Bool)

(assert (=> b!1015180 (=> (not res!681059) (not e!571183))))

(assert (=> b!1015180 (= res!681059 (bvslt (_1!7576 (h!22608 l!412)) (_1!7576 (h!22608 (t!30398 l!412)))))))

(declare-fun b!1015181 () Bool)

(assert (=> b!1015181 (= e!571183 (isStrictlySorted!552 (t!30398 l!412)))))

(assert (= (and d!121017 (not res!681058)) b!1015180))

(assert (= (and b!1015180 res!681059) b!1015181))

(assert (=> b!1015181 m!938253))

(assert (=> start!87820 d!121017))

(declare-fun b!1015186 () Bool)

(declare-fun e!571186 () Bool)

(declare-fun tp!70473 () Bool)

(assert (=> b!1015186 (= e!571186 (and tp_is_empty!23479 tp!70473))))

(assert (=> b!1015022 (= tp!70464 e!571186)))

(assert (= (and b!1015022 ((_ is Cons!21401) (t!30398 l!412))) b!1015186))

(declare-fun b_lambda!15281 () Bool)

(assert (= b_lambda!15279 (or b!1015020 b_lambda!15281)))

(declare-fun bs!28985 () Bool)

(declare-fun d!121019 () Bool)

(assert (= bs!28985 (and d!121019 b!1015020)))

(declare-datatypes ((Option!571 0))(
  ( (Some!570 (v!14421 B!1412)) (None!569) )
))
(declare-fun getValueByKey!520 (List!21405 (_ BitVec 64)) Option!571)

(assert (=> bs!28985 (= (dynLambda!1911 lambda!545 (h!22607 lt!448653)) (= (getValueByKey!520 l!412 (h!22607 lt!448653)) (Some!570 value!115)))))

(declare-fun m!938279 () Bool)

(assert (=> bs!28985 m!938279))

(assert (=> b!1015110 d!121019))

(check-sat (not b!1015111) (not d!120985) (not b!1015119) (not bm!42767) (not b!1015089) (not b_lambda!15281) (not bm!42768) (not bm!42769) (not b!1015181) (not b!1015091) (not b!1015186) (not bm!42766) (not b!1015117) tp_is_empty!23479 (not d!121015) (not b!1015090) (not bs!28985))
(check-sat)
