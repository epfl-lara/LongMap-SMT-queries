; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87964 () Bool)

(assert start!87964)

(declare-fun b!1015861 () Bool)

(declare-fun e!571581 () Bool)

(declare-fun tp_is_empty!23503 () Bool)

(declare-fun tp!70539 () Bool)

(assert (=> b!1015861 (= e!571581 (and tp_is_empty!23503 tp!70539))))

(declare-fun b!1015859 () Bool)

(declare-fun res!681308 () Bool)

(declare-fun e!571580 () Bool)

(assert (=> b!1015859 (=> (not res!681308) (not e!571580))))

(declare-datatypes ((B!1436 0))(
  ( (B!1437 (val!11802 Int)) )
))
(declare-datatypes ((tuple2!15154 0))(
  ( (tuple2!15155 (_1!7588 (_ BitVec 64)) (_2!7588 B!1436)) )
))
(declare-datatypes ((List!21425 0))(
  ( (Nil!21422) (Cons!21421 (h!22628 tuple2!15154) (t!30418 List!21425)) )
))
(declare-fun l!412 () List!21425)

(declare-fun value!115 () B!1436)

(declare-datatypes ((List!21426 0))(
  ( (Nil!21423) (Cons!21422 (h!22629 (_ BitVec 64)) (t!30419 List!21426)) )
))
(declare-fun isEmpty!839 (List!21426) Bool)

(declare-fun getKeysOf!49 (List!21425 B!1436) List!21426)

(assert (=> b!1015859 (= res!681308 (not (isEmpty!839 (getKeysOf!49 (t!30418 l!412) value!115))))))

(declare-fun b!1015858 () Bool)

(declare-fun res!681306 () Bool)

(assert (=> b!1015858 (=> (not res!681306) (not e!571580))))

(get-info :version)

(assert (=> b!1015858 (= res!681306 (and (not (= (_2!7588 (h!22628 l!412)) value!115)) ((_ is Cons!21421) l!412)))))

(declare-fun res!681307 () Bool)

(assert (=> start!87964 (=> (not res!681307) (not e!571580))))

(declare-fun isStrictlySorted!564 (List!21425) Bool)

(assert (=> start!87964 (= res!681307 (isStrictlySorted!564 l!412))))

(assert (=> start!87964 e!571580))

(assert (=> start!87964 e!571581))

(assert (=> start!87964 tp_is_empty!23503))

(declare-fun b!1015860 () Bool)

(declare-fun ListPrimitiveSize!115 (List!21425) Int)

(assert (=> b!1015860 (= e!571580 (>= (ListPrimitiveSize!115 (t!30418 l!412)) (ListPrimitiveSize!115 l!412)))))

(assert (= (and start!87964 res!681307) b!1015858))

(assert (= (and b!1015858 res!681306) b!1015859))

(assert (= (and b!1015859 res!681308) b!1015860))

(assert (= (and start!87964 ((_ is Cons!21421) l!412)) b!1015861))

(declare-fun m!938753 () Bool)

(assert (=> b!1015859 m!938753))

(assert (=> b!1015859 m!938753))

(declare-fun m!938755 () Bool)

(assert (=> b!1015859 m!938755))

(declare-fun m!938757 () Bool)

(assert (=> start!87964 m!938757))

(declare-fun m!938759 () Bool)

(assert (=> b!1015860 m!938759))

(declare-fun m!938761 () Bool)

(assert (=> b!1015860 m!938761))

(check-sat (not b!1015859) (not b!1015860) tp_is_empty!23503 (not start!87964) (not b!1015861))
(check-sat)
(get-model)

(declare-fun d!121251 () Bool)

(assert (=> d!121251 (= (isEmpty!839 (getKeysOf!49 (t!30418 l!412) value!115)) ((_ is Nil!21423) (getKeysOf!49 (t!30418 l!412) value!115)))))

(assert (=> b!1015859 d!121251))

(declare-fun b!1015950 () Bool)

(assert (=> b!1015950 true))

(assert (=> b!1015950 true))

(assert (=> b!1015950 true))

(declare-fun bs!29298 () Bool)

(declare-fun b!1015953 () Bool)

(assert (= bs!29298 (and b!1015953 b!1015950)))

(declare-fun lt!449219 () tuple2!15154)

(declare-fun lambda!733 () Int)

(declare-fun lt!449216 () List!21425)

(declare-fun lt!449222 () tuple2!15154)

(declare-fun lambda!730 () Int)

(declare-fun lt!449213 () List!21425)

(assert (=> bs!29298 (= (= (Cons!21421 lt!449222 lt!449213) (Cons!21421 lt!449219 lt!449216)) (= lambda!733 lambda!730))))

(assert (=> b!1015953 true))

(assert (=> b!1015953 true))

(assert (=> b!1015953 true))

(declare-fun bs!29302 () Bool)

(declare-fun d!121253 () Bool)

(assert (= bs!29302 (and d!121253 b!1015950)))

(declare-fun lambda!736 () Int)

(assert (=> bs!29302 (= (= (t!30418 l!412) (Cons!21421 lt!449219 lt!449216)) (= lambda!736 lambda!730))))

(declare-fun bs!29303 () Bool)

(assert (= bs!29303 (and d!121253 b!1015953)))

(assert (=> bs!29303 (= (= (t!30418 l!412) (Cons!21421 lt!449222 lt!449213)) (= lambda!736 lambda!733))))

(assert (=> d!121253 true))

(assert (=> d!121253 true))

(declare-fun bm!42906 () Bool)

(declare-fun call!42909 () List!21426)

(assert (=> bm!42906 (= call!42909 (getKeysOf!49 (t!30418 (t!30418 l!412)) value!115))))

(declare-fun b!1015948 () Bool)

(declare-datatypes ((Unit!33178 0))(
  ( (Unit!33179) )
))
(declare-fun e!571631 () Unit!33178)

(declare-fun Unit!33180 () Unit!33178)

(assert (=> b!1015948 (= e!571631 Unit!33180)))

(declare-fun b!1015949 () Bool)

(declare-fun e!571628 () Unit!33178)

(declare-fun Unit!33181 () Unit!33178)

(assert (=> b!1015949 (= e!571628 Unit!33181)))

(declare-fun lt!449221 () List!21426)

(declare-fun forall!245 (List!21426 Int) Bool)

(assert (=> d!121253 (forall!245 lt!449221 lambda!736)))

(declare-fun e!571629 () List!21426)

(assert (=> d!121253 (= lt!449221 e!571629)))

(declare-fun c!103150 () Bool)

(assert (=> d!121253 (= c!103150 (and ((_ is Cons!21421) (t!30418 l!412)) (= (_2!7588 (h!22628 (t!30418 l!412))) value!115)))))

(assert (=> d!121253 (isStrictlySorted!564 (t!30418 l!412))))

(assert (=> d!121253 (= (getKeysOf!49 (t!30418 l!412) value!115) lt!449221)))

(declare-fun lt!449211 () List!21426)

(declare-fun bm!42907 () Bool)

(declare-fun lt!449220 () List!21426)

(declare-fun call!42912 () Bool)

(assert (=> bm!42907 (= call!42912 (forall!245 (ite c!103150 lt!449220 lt!449211) (ite c!103150 lambda!730 lambda!733)))))

(assert (=> b!1015950 call!42912))

(declare-fun lt!449212 () Unit!33178)

(declare-fun call!42911 () Unit!33178)

(assert (=> b!1015950 (= lt!449212 call!42911)))

(assert (=> b!1015950 (= lt!449219 (h!22628 (t!30418 l!412)))))

(assert (=> b!1015950 (= lt!449220 call!42909)))

(assert (=> b!1015950 (= lt!449216 (t!30418 (t!30418 l!412)))))

(assert (=> b!1015950 (= e!571631 lt!449212)))

(declare-fun b!1015951 () Bool)

(assert (=> b!1015951 (= e!571629 (Cons!21422 (_1!7588 (h!22628 (t!30418 l!412))) call!42909))))

(declare-fun c!103149 () Bool)

(declare-fun call!42910 () Bool)

(assert (=> b!1015951 (= c!103149 (not call!42910))))

(declare-fun lt!449215 () Unit!33178)

(assert (=> b!1015951 (= lt!449215 e!571631)))

(declare-fun b!1015952 () Bool)

(declare-fun e!571630 () List!21426)

(assert (=> b!1015952 (= e!571629 e!571630)))

(declare-fun c!103152 () Bool)

(assert (=> b!1015952 (= c!103152 (and ((_ is Cons!21421) (t!30418 l!412)) (not (= (_2!7588 (h!22628 (t!30418 l!412))) value!115))))))

(declare-fun lt!449217 () Unit!33178)

(assert (=> b!1015953 (= e!571628 lt!449217)))

(assert (=> b!1015953 (= lt!449213 (t!30418 (t!30418 l!412)))))

(assert (=> b!1015953 (= lt!449211 call!42909)))

(assert (=> b!1015953 (= lt!449222 (h!22628 (t!30418 l!412)))))

(assert (=> b!1015953 (= lt!449217 call!42911)))

(assert (=> b!1015953 call!42912))

(declare-fun b!1015954 () Bool)

(declare-fun lt!449214 () Unit!33178)

(assert (=> b!1015954 (= lt!449214 e!571628)))

(declare-fun c!103151 () Bool)

(assert (=> b!1015954 (= c!103151 (not call!42910))))

(declare-fun lt!449218 () List!21426)

(assert (=> b!1015954 (= lt!449218 call!42909)))

(assert (=> b!1015954 (= e!571630 call!42909)))

(declare-fun b!1015955 () Bool)

(assert (=> b!1015955 (= e!571630 Nil!21423)))

(declare-fun bm!42908 () Bool)

(assert (=> bm!42908 (= call!42910 (isEmpty!839 call!42909))))

(declare-fun bm!42909 () Bool)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!39 (List!21425 List!21426 B!1436 tuple2!15154) Unit!33178)

(assert (=> bm!42909 (= call!42911 (lemmaForallGetValueByKeySameWithASmallerHead!39 (ite c!103150 lt!449216 lt!449213) (ite c!103150 lt!449220 lt!449211) value!115 (ite c!103150 lt!449219 lt!449222)))))

(assert (= (and d!121253 c!103150) b!1015951))

(assert (= (and d!121253 (not c!103150)) b!1015952))

(assert (= (and b!1015951 c!103149) b!1015950))

(assert (= (and b!1015951 (not c!103149)) b!1015948))

(assert (= (and b!1015952 c!103152) b!1015954))

(assert (= (and b!1015952 (not c!103152)) b!1015955))

(assert (= (and b!1015954 c!103151) b!1015953))

(assert (= (and b!1015954 (not c!103151)) b!1015949))

(assert (= (or b!1015950 b!1015953) bm!42909))

(assert (= (or b!1015950 b!1015953) bm!42907))

(assert (= (or b!1015951 b!1015950 b!1015953 b!1015954) bm!42906))

(assert (= (or b!1015951 b!1015954) bm!42908))

(declare-fun m!938797 () Bool)

(assert (=> bm!42908 m!938797))

(declare-fun m!938800 () Bool)

(assert (=> bm!42909 m!938800))

(declare-fun m!938803 () Bool)

(assert (=> d!121253 m!938803))

(declare-fun m!938805 () Bool)

(assert (=> d!121253 m!938805))

(declare-fun m!938809 () Bool)

(assert (=> bm!42906 m!938809))

(declare-fun m!938815 () Bool)

(assert (=> bm!42907 m!938815))

(assert (=> b!1015859 d!121253))

(declare-fun d!121267 () Bool)

(declare-fun lt!449245 () Int)

(assert (=> d!121267 (>= lt!449245 0)))

(declare-fun e!571646 () Int)

(assert (=> d!121267 (= lt!449245 e!571646)))

(declare-fun c!103167 () Bool)

(assert (=> d!121267 (= c!103167 ((_ is Nil!21422) (t!30418 l!412)))))

(assert (=> d!121267 (= (ListPrimitiveSize!115 (t!30418 l!412)) lt!449245)))

(declare-fun b!1016002 () Bool)

(assert (=> b!1016002 (= e!571646 0)))

(declare-fun b!1016003 () Bool)

(assert (=> b!1016003 (= e!571646 (+ 1 (ListPrimitiveSize!115 (t!30418 (t!30418 l!412)))))))

(assert (= (and d!121267 c!103167) b!1016002))

(assert (= (and d!121267 (not c!103167)) b!1016003))

(declare-fun m!938823 () Bool)

(assert (=> b!1016003 m!938823))

(assert (=> b!1015860 d!121267))

(declare-fun d!121277 () Bool)

(declare-fun lt!449246 () Int)

(assert (=> d!121277 (>= lt!449246 0)))

(declare-fun e!571649 () Int)

(assert (=> d!121277 (= lt!449246 e!571649)))

(declare-fun c!103168 () Bool)

(assert (=> d!121277 (= c!103168 ((_ is Nil!21422) l!412))))

(assert (=> d!121277 (= (ListPrimitiveSize!115 l!412) lt!449246)))

(declare-fun b!1016008 () Bool)

(assert (=> b!1016008 (= e!571649 0)))

(declare-fun b!1016009 () Bool)

(assert (=> b!1016009 (= e!571649 (+ 1 (ListPrimitiveSize!115 (t!30418 l!412))))))

(assert (= (and d!121277 c!103168) b!1016008))

(assert (= (and d!121277 (not c!103168)) b!1016009))

(assert (=> b!1016009 m!938759))

(assert (=> b!1015860 d!121277))

(declare-fun d!121279 () Bool)

(declare-fun res!681343 () Bool)

(declare-fun e!571664 () Bool)

(assert (=> d!121279 (=> res!681343 e!571664)))

(assert (=> d!121279 (= res!681343 (or ((_ is Nil!21422) l!412) ((_ is Nil!21422) (t!30418 l!412))))))

(assert (=> d!121279 (= (isStrictlySorted!564 l!412) e!571664)))

(declare-fun b!1016026 () Bool)

(declare-fun e!571665 () Bool)

(assert (=> b!1016026 (= e!571664 e!571665)))

(declare-fun res!681344 () Bool)

(assert (=> b!1016026 (=> (not res!681344) (not e!571665))))

(assert (=> b!1016026 (= res!681344 (bvslt (_1!7588 (h!22628 l!412)) (_1!7588 (h!22628 (t!30418 l!412)))))))

(declare-fun b!1016027 () Bool)

(assert (=> b!1016027 (= e!571665 (isStrictlySorted!564 (t!30418 l!412)))))

(assert (= (and d!121279 (not res!681343)) b!1016026))

(assert (= (and b!1016026 res!681344) b!1016027))

(assert (=> b!1016027 m!938805))

(assert (=> start!87964 d!121279))

(declare-fun b!1016032 () Bool)

(declare-fun e!571668 () Bool)

(declare-fun tp!70554 () Bool)

(assert (=> b!1016032 (= e!571668 (and tp_is_empty!23503 tp!70554))))

(assert (=> b!1015861 (= tp!70539 e!571668)))

(assert (= (and b!1015861 ((_ is Cons!21421) (t!30418 l!412))) b!1016032))

(check-sat (not b!1016032) tp_is_empty!23503 (not d!121253) (not b!1016003) (not bm!42906) (not b!1016009) (not bm!42907) (not b!1016027) (not bm!42908) (not bm!42909))
(check-sat)
