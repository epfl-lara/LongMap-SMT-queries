; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87318 () Bool)

(assert start!87318)

(declare-fun b!1011969 () Bool)

(assert (=> b!1011969 true))

(assert (=> b!1011969 true))

(declare-fun res!679823 () Bool)

(declare-fun e!569266 () Bool)

(assert (=> start!87318 (=> (not res!679823) (not e!569266))))

(declare-datatypes ((B!1328 0))(
  ( (B!1329 (val!11748 Int)) )
))
(declare-datatypes ((tuple2!15122 0))(
  ( (tuple2!15123 (_1!7572 (_ BitVec 64)) (_2!7572 B!1328)) )
))
(declare-datatypes ((List!21381 0))(
  ( (Nil!21378) (Cons!21377 (h!22575 tuple2!15122) (t!30373 List!21381)) )
))
(declare-fun l!412 () List!21381)

(declare-fun isStrictlySorted!524 (List!21381) Bool)

(assert (=> start!87318 (= res!679823 (isStrictlySorted!524 l!412))))

(assert (=> start!87318 e!569266))

(declare-fun e!569265 () Bool)

(assert (=> start!87318 e!569265))

(declare-fun tp_is_empty!23395 () Bool)

(assert (=> start!87318 tp_is_empty!23395))

(declare-datatypes ((Unit!32929 0))(
  ( (Unit!32930) )
))
(declare-fun e!569267 () Unit!32929)

(declare-fun lt!447104 () Unit!32929)

(assert (=> b!1011969 (= e!569267 lt!447104)))

(declare-datatypes ((List!21382 0))(
  ( (Nil!21379) (Cons!21378 (h!22576 (_ BitVec 64)) (t!30374 List!21382)) )
))
(declare-fun lt!447106 () List!21382)

(declare-fun value!115 () B!1328)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!7 (List!21381 List!21382 B!1328 tuple2!15122) Unit!32929)

(assert (=> b!1011969 (= lt!447104 (lemmaForallGetValueByKeySameWithASmallerHead!7 (t!30373 l!412) lt!447106 value!115 (h!22575 l!412)))))

(declare-fun lambda!287 () Int)

(declare-fun forall!209 (List!21382 Int) Bool)

(assert (=> b!1011969 (forall!209 lt!447106 lambda!287)))

(declare-fun b!1011970 () Bool)

(assert (=> b!1011970 (= e!569266 (not (isStrictlySorted!524 (t!30373 l!412))))))

(declare-fun lt!447105 () Unit!32929)

(assert (=> b!1011970 (= lt!447105 e!569267)))

(declare-fun c!102193 () Bool)

(declare-fun isEmpty!788 (List!21382) Bool)

(assert (=> b!1011970 (= c!102193 (not (isEmpty!788 lt!447106)))))

(declare-fun getKeysOf!13 (List!21381 B!1328) List!21382)

(assert (=> b!1011970 (= lt!447106 (getKeysOf!13 (t!30373 l!412) value!115))))

(declare-fun b!1011971 () Bool)

(declare-fun tp!70257 () Bool)

(assert (=> b!1011971 (= e!569265 (and tp_is_empty!23395 tp!70257))))

(declare-fun b!1011972 () Bool)

(declare-fun res!679822 () Bool)

(assert (=> b!1011972 (=> (not res!679822) (not e!569266))))

(get-info :version)

(assert (=> b!1011972 (= res!679822 (and ((_ is Cons!21377) l!412) (= (_2!7572 (h!22575 l!412)) value!115)))))

(declare-fun b!1011973 () Bool)

(declare-fun Unit!32931 () Unit!32929)

(assert (=> b!1011973 (= e!569267 Unit!32931)))

(assert (= (and start!87318 res!679823) b!1011972))

(assert (= (and b!1011972 res!679822) b!1011970))

(assert (= (and b!1011970 c!102193) b!1011969))

(assert (= (and b!1011970 (not c!102193)) b!1011973))

(assert (= (and start!87318 ((_ is Cons!21377) l!412)) b!1011971))

(declare-fun m!935221 () Bool)

(assert (=> start!87318 m!935221))

(declare-fun m!935223 () Bool)

(assert (=> b!1011969 m!935223))

(declare-fun m!935225 () Bool)

(assert (=> b!1011969 m!935225))

(declare-fun m!935227 () Bool)

(assert (=> b!1011970 m!935227))

(declare-fun m!935229 () Bool)

(assert (=> b!1011970 m!935229))

(declare-fun m!935231 () Bool)

(assert (=> b!1011970 m!935231))

(check-sat tp_is_empty!23395 (not start!87318) (not b!1011970) (not b!1011969) (not b!1011971))
(check-sat)
(get-model)

(declare-fun d!120097 () Bool)

(declare-fun res!679840 () Bool)

(declare-fun e!569290 () Bool)

(assert (=> d!120097 (=> res!679840 e!569290)))

(assert (=> d!120097 (= res!679840 (or ((_ is Nil!21378) (t!30373 l!412)) ((_ is Nil!21378) (t!30373 (t!30373 l!412)))))))

(assert (=> d!120097 (= (isStrictlySorted!524 (t!30373 l!412)) e!569290)))

(declare-fun b!1012020 () Bool)

(declare-fun e!569291 () Bool)

(assert (=> b!1012020 (= e!569290 e!569291)))

(declare-fun res!679841 () Bool)

(assert (=> b!1012020 (=> (not res!679841) (not e!569291))))

(assert (=> b!1012020 (= res!679841 (bvslt (_1!7572 (h!22575 (t!30373 l!412))) (_1!7572 (h!22575 (t!30373 (t!30373 l!412))))))))

(declare-fun b!1012021 () Bool)

(assert (=> b!1012021 (= e!569291 (isStrictlySorted!524 (t!30373 (t!30373 l!412))))))

(assert (= (and d!120097 (not res!679840)) b!1012020))

(assert (= (and b!1012020 res!679841) b!1012021))

(declare-fun m!935257 () Bool)

(assert (=> b!1012021 m!935257))

(assert (=> b!1011970 d!120097))

(declare-fun d!120103 () Bool)

(assert (=> d!120103 (= (isEmpty!788 lt!447106) ((_ is Nil!21379) lt!447106))))

(assert (=> b!1011970 d!120103))

(declare-fun bs!28738 () Bool)

(declare-fun b!1012087 () Bool)

(assert (= bs!28738 (and b!1012087 b!1011969)))

(declare-fun lt!447179 () tuple2!15122)

(declare-fun lt!447177 () List!21381)

(declare-fun lambda!312 () Int)

(assert (=> bs!28738 (= (= (Cons!21377 lt!447179 lt!447177) l!412) (= lambda!312 lambda!287))))

(assert (=> b!1012087 true))

(assert (=> b!1012087 true))

(assert (=> b!1012087 true))

(declare-fun bs!28739 () Bool)

(declare-fun b!1012089 () Bool)

(assert (= bs!28739 (and b!1012089 b!1011969)))

(declare-fun lt!447186 () List!21381)

(declare-fun lt!447178 () tuple2!15122)

(declare-fun lambda!313 () Int)

(assert (=> bs!28739 (= (= (Cons!21377 lt!447178 lt!447186) l!412) (= lambda!313 lambda!287))))

(declare-fun bs!28740 () Bool)

(assert (= bs!28740 (and b!1012089 b!1012087)))

(assert (=> bs!28740 (= (= (Cons!21377 lt!447178 lt!447186) (Cons!21377 lt!447179 lt!447177)) (= lambda!313 lambda!312))))

(assert (=> b!1012089 true))

(assert (=> b!1012089 true))

(assert (=> b!1012089 true))

(declare-fun bs!28742 () Bool)

(declare-fun d!120105 () Bool)

(assert (= bs!28742 (and d!120105 b!1011969)))

(declare-fun lambda!315 () Int)

(assert (=> bs!28742 (= (= (t!30373 l!412) l!412) (= lambda!315 lambda!287))))

(declare-fun bs!28743 () Bool)

(assert (= bs!28743 (and d!120105 b!1012087)))

(assert (=> bs!28743 (= (= (t!30373 l!412) (Cons!21377 lt!447179 lt!447177)) (= lambda!315 lambda!312))))

(declare-fun bs!28745 () Bool)

(assert (= bs!28745 (and d!120105 b!1012089)))

(assert (=> bs!28745 (= (= (t!30373 l!412) (Cons!21377 lt!447178 lt!447186)) (= lambda!315 lambda!313))))

(assert (=> d!120105 true))

(assert (=> d!120105 true))

(declare-fun bm!42468 () Bool)

(declare-fun call!42474 () Unit!32929)

(declare-fun lt!447181 () List!21382)

(declare-fun lt!447187 () List!21382)

(declare-fun c!102217 () Bool)

(assert (=> bm!42468 (= call!42474 (lemmaForallGetValueByKeySameWithASmallerHead!7 (ite c!102217 lt!447177 lt!447186) (ite c!102217 lt!447181 lt!447187) value!115 (ite c!102217 lt!447179 lt!447178)))))

(declare-fun b!1012085 () Bool)

(declare-fun e!569331 () List!21382)

(declare-fun call!42473 () List!21382)

(assert (=> b!1012085 (= e!569331 (Cons!21378 (_1!7572 (h!22575 (t!30373 l!412))) call!42473))))

(declare-fun c!102218 () Bool)

(declare-fun call!42471 () Bool)

(assert (=> b!1012085 (= c!102218 (not call!42471))))

(declare-fun lt!447180 () Unit!32929)

(declare-fun e!569332 () Unit!32929)

(assert (=> b!1012085 (= lt!447180 e!569332)))

(declare-fun b!1012086 () Bool)

(declare-fun e!569333 () List!21382)

(assert (=> b!1012086 (= e!569333 Nil!21379)))

(declare-fun call!42472 () Bool)

(declare-fun bm!42469 () Bool)

(assert (=> bm!42469 (= call!42472 (forall!209 (ite c!102217 lt!447181 lt!447187) (ite c!102217 lambda!312 lambda!313)))))

(declare-fun bm!42470 () Bool)

(assert (=> bm!42470 (= call!42473 (getKeysOf!13 (t!30373 (t!30373 l!412)) value!115))))

(assert (=> b!1012087 call!42472))

(declare-fun lt!447176 () Unit!32929)

(assert (=> b!1012087 (= lt!447176 call!42474)))

(assert (=> b!1012087 (= lt!447179 (h!22575 (t!30373 l!412)))))

(assert (=> b!1012087 (= lt!447181 call!42473)))

(assert (=> b!1012087 (= lt!447177 (t!30373 (t!30373 l!412)))))

(assert (=> b!1012087 (= e!569332 lt!447176)))

(declare-fun lt!447185 () List!21382)

(assert (=> d!120105 (forall!209 lt!447185 lambda!315)))

(assert (=> d!120105 (= lt!447185 e!569331)))

(assert (=> d!120105 (= c!102217 (and ((_ is Cons!21377) (t!30373 l!412)) (= (_2!7572 (h!22575 (t!30373 l!412))) value!115)))))

(assert (=> d!120105 (isStrictlySorted!524 (t!30373 l!412))))

(assert (=> d!120105 (= (getKeysOf!13 (t!30373 l!412) value!115) lt!447185)))

(declare-fun b!1012088 () Bool)

(declare-fun e!569334 () Unit!32929)

(declare-fun Unit!32939 () Unit!32929)

(assert (=> b!1012088 (= e!569334 Unit!32939)))

(declare-fun lt!447183 () Unit!32929)

(assert (=> b!1012089 (= e!569334 lt!447183)))

(assert (=> b!1012089 (= lt!447186 (t!30373 (t!30373 l!412)))))

(assert (=> b!1012089 (= lt!447187 call!42473)))

(assert (=> b!1012089 (= lt!447178 (h!22575 (t!30373 l!412)))))

(assert (=> b!1012089 (= lt!447183 call!42474)))

(assert (=> b!1012089 call!42472))

(declare-fun b!1012090 () Bool)

(assert (=> b!1012090 (= e!569331 e!569333)))

(declare-fun c!102219 () Bool)

(assert (=> b!1012090 (= c!102219 (and ((_ is Cons!21377) (t!30373 l!412)) (not (= (_2!7572 (h!22575 (t!30373 l!412))) value!115))))))

(declare-fun bm!42471 () Bool)

(assert (=> bm!42471 (= call!42471 (isEmpty!788 call!42473))))

(declare-fun b!1012091 () Bool)

(declare-fun lt!447184 () Unit!32929)

(assert (=> b!1012091 (= lt!447184 e!569334)))

(declare-fun c!102216 () Bool)

(assert (=> b!1012091 (= c!102216 (not call!42471))))

(declare-fun lt!447182 () List!21382)

(assert (=> b!1012091 (= lt!447182 call!42473)))

(assert (=> b!1012091 (= e!569333 call!42473)))

(declare-fun b!1012092 () Bool)

(declare-fun Unit!32941 () Unit!32929)

(assert (=> b!1012092 (= e!569332 Unit!32941)))

(assert (= (and d!120105 c!102217) b!1012085))

(assert (= (and d!120105 (not c!102217)) b!1012090))

(assert (= (and b!1012085 c!102218) b!1012087))

(assert (= (and b!1012085 (not c!102218)) b!1012092))

(assert (= (and b!1012090 c!102219) b!1012091))

(assert (= (and b!1012090 (not c!102219)) b!1012086))

(assert (= (and b!1012091 c!102216) b!1012089))

(assert (= (and b!1012091 (not c!102216)) b!1012088))

(assert (= (or b!1012087 b!1012089) bm!42468))

(assert (= (or b!1012087 b!1012089) bm!42469))

(assert (= (or b!1012085 b!1012087 b!1012091 b!1012089) bm!42470))

(assert (= (or b!1012085 b!1012091) bm!42471))

(declare-fun m!935277 () Bool)

(assert (=> bm!42471 m!935277))

(declare-fun m!935279 () Bool)

(assert (=> d!120105 m!935279))

(assert (=> d!120105 m!935227))

(declare-fun m!935281 () Bool)

(assert (=> bm!42470 m!935281))

(declare-fun m!935283 () Bool)

(assert (=> bm!42468 m!935283))

(declare-fun m!935285 () Bool)

(assert (=> bm!42469 m!935285))

(assert (=> b!1011970 d!120105))

(declare-fun d!120121 () Bool)

(declare-fun res!679871 () Bool)

(declare-fun e!569343 () Bool)

(assert (=> d!120121 (=> res!679871 e!569343)))

(assert (=> d!120121 (= res!679871 (or ((_ is Nil!21378) l!412) ((_ is Nil!21378) (t!30373 l!412))))))

(assert (=> d!120121 (= (isStrictlySorted!524 l!412) e!569343)))

(declare-fun b!1012113 () Bool)

(declare-fun e!569344 () Bool)

(assert (=> b!1012113 (= e!569343 e!569344)))

(declare-fun res!679872 () Bool)

(assert (=> b!1012113 (=> (not res!679872) (not e!569344))))

(assert (=> b!1012113 (= res!679872 (bvslt (_1!7572 (h!22575 l!412)) (_1!7572 (h!22575 (t!30373 l!412)))))))

(declare-fun b!1012114 () Bool)

(assert (=> b!1012114 (= e!569344 (isStrictlySorted!524 (t!30373 l!412)))))

(assert (= (and d!120121 (not res!679871)) b!1012113))

(assert (= (and b!1012113 res!679872) b!1012114))

(assert (=> b!1012114 m!935227))

(assert (=> start!87318 d!120121))

(declare-fun bs!28750 () Bool)

(declare-fun b!1012136 () Bool)

(assert (= bs!28750 (and b!1012136 b!1011969)))

(declare-fun lambda!332 () Int)

(assert (=> bs!28750 (= (= (t!30373 l!412) l!412) (= lambda!332 lambda!287))))

(declare-fun bs!28751 () Bool)

(assert (= bs!28751 (and b!1012136 b!1012087)))

(assert (=> bs!28751 (= (= (t!30373 l!412) (Cons!21377 lt!447179 lt!447177)) (= lambda!332 lambda!312))))

(declare-fun bs!28752 () Bool)

(assert (= bs!28752 (and b!1012136 b!1012089)))

(assert (=> bs!28752 (= (= (t!30373 l!412) (Cons!21377 lt!447178 lt!447186)) (= lambda!332 lambda!313))))

(declare-fun bs!28753 () Bool)

(assert (= bs!28753 (and b!1012136 d!120105)))

(assert (=> bs!28753 (= lambda!332 lambda!315)))

(assert (=> b!1012136 true))

(assert (=> b!1012136 true))

(declare-fun bs!28758 () Bool)

(declare-fun d!120123 () Bool)

(assert (= bs!28758 (and d!120123 b!1011969)))

(declare-fun lambda!334 () Int)

(assert (=> bs!28758 (= (= (Cons!21377 (h!22575 l!412) (t!30373 l!412)) l!412) (= lambda!334 lambda!287))))

(declare-fun bs!28759 () Bool)

(assert (= bs!28759 (and d!120123 b!1012087)))

(assert (=> bs!28759 (= (= (Cons!21377 (h!22575 l!412) (t!30373 l!412)) (Cons!21377 lt!447179 lt!447177)) (= lambda!334 lambda!312))))

(declare-fun bs!28761 () Bool)

(assert (= bs!28761 (and d!120123 b!1012089)))

(assert (=> bs!28761 (= (= (Cons!21377 (h!22575 l!412) (t!30373 l!412)) (Cons!21377 lt!447178 lt!447186)) (= lambda!334 lambda!313))))

(declare-fun bs!28763 () Bool)

(assert (= bs!28763 (and d!120123 d!120105)))

(assert (=> bs!28763 (= (= (Cons!21377 (h!22575 l!412) (t!30373 l!412)) (t!30373 l!412)) (= lambda!334 lambda!315))))

(declare-fun bs!28766 () Bool)

(assert (= bs!28766 (and d!120123 b!1012136)))

(assert (=> bs!28766 (= (= (Cons!21377 (h!22575 l!412) (t!30373 l!412)) (t!30373 l!412)) (= lambda!334 lambda!332))))

(assert (=> d!120123 true))

(assert (=> d!120123 true))

(assert (=> d!120123 true))

(assert (=> d!120123 (forall!209 lt!447106 lambda!334)))

(declare-fun lt!447228 () Unit!32929)

(declare-fun choose!1633 (List!21381 List!21382 B!1328 tuple2!15122) Unit!32929)

(assert (=> d!120123 (= lt!447228 (choose!1633 (t!30373 l!412) lt!447106 value!115 (h!22575 l!412)))))

(declare-fun e!569353 () Bool)

(assert (=> d!120123 e!569353))

(declare-fun res!679886 () Bool)

(assert (=> d!120123 (=> (not res!679886) (not e!569353))))

(assert (=> d!120123 (= res!679886 (isStrictlySorted!524 (t!30373 l!412)))))

(assert (=> d!120123 (= (lemmaForallGetValueByKeySameWithASmallerHead!7 (t!30373 l!412) lt!447106 value!115 (h!22575 l!412)) lt!447228)))

(declare-fun b!1012135 () Bool)

(declare-fun res!679885 () Bool)

(assert (=> b!1012135 (=> (not res!679885) (not e!569353))))

(declare-fun isEmpty!792 (List!21381) Bool)

(assert (=> b!1012135 (= res!679885 (not (isEmpty!792 (t!30373 l!412))))))

(declare-fun res!679887 () Bool)

(assert (=> b!1012136 (=> (not res!679887) (not e!569353))))

(assert (=> b!1012136 (= res!679887 (forall!209 lt!447106 lambda!332))))

(declare-fun b!1012137 () Bool)

(declare-fun head!924 (List!21381) tuple2!15122)

(assert (=> b!1012137 (= e!569353 (bvslt (_1!7572 (h!22575 l!412)) (_1!7572 (head!924 (t!30373 l!412)))))))

(assert (= (and d!120123 res!679886) b!1012135))

(assert (= (and b!1012135 res!679885) b!1012136))

(assert (= (and b!1012136 res!679887) b!1012137))

(declare-fun m!935297 () Bool)

(assert (=> d!120123 m!935297))

(declare-fun m!935299 () Bool)

(assert (=> d!120123 m!935299))

(assert (=> d!120123 m!935227))

(declare-fun m!935301 () Bool)

(assert (=> b!1012135 m!935301))

(declare-fun m!935303 () Bool)

(assert (=> b!1012136 m!935303))

(declare-fun m!935305 () Bool)

(assert (=> b!1012137 m!935305))

(assert (=> b!1011969 d!120123))

(declare-fun d!120127 () Bool)

(declare-fun res!679899 () Bool)

(declare-fun e!569367 () Bool)

(assert (=> d!120127 (=> res!679899 e!569367)))

(assert (=> d!120127 (= res!679899 ((_ is Nil!21379) lt!447106))))

(assert (=> d!120127 (= (forall!209 lt!447106 lambda!287) e!569367)))

(declare-fun b!1012157 () Bool)

(declare-fun e!569368 () Bool)

(assert (=> b!1012157 (= e!569367 e!569368)))

(declare-fun res!679900 () Bool)

(assert (=> b!1012157 (=> (not res!679900) (not e!569368))))

(declare-fun dynLambda!1869 (Int (_ BitVec 64)) Bool)

(assert (=> b!1012157 (= res!679900 (dynLambda!1869 lambda!287 (h!22576 lt!447106)))))

(declare-fun b!1012158 () Bool)

(assert (=> b!1012158 (= e!569368 (forall!209 (t!30374 lt!447106) lambda!287))))

(assert (= (and d!120127 (not res!679899)) b!1012157))

(assert (= (and b!1012157 res!679900) b!1012158))

(declare-fun b_lambda!15213 () Bool)

(assert (=> (not b_lambda!15213) (not b!1012157)))

(declare-fun m!935317 () Bool)

(assert (=> b!1012157 m!935317))

(declare-fun m!935319 () Bool)

(assert (=> b!1012158 m!935319))

(assert (=> b!1011969 d!120127))

(declare-fun b!1012167 () Bool)

(declare-fun e!569375 () Bool)

(declare-fun tp!70266 () Bool)

(assert (=> b!1012167 (= e!569375 (and tp_is_empty!23395 tp!70266))))

(assert (=> b!1011971 (= tp!70257 e!569375)))

(assert (= (and b!1011971 ((_ is Cons!21377) (t!30373 l!412))) b!1012167))

(declare-fun b_lambda!15217 () Bool)

(assert (= b_lambda!15213 (or b!1011969 b_lambda!15217)))

(declare-fun bs!28780 () Bool)

(declare-fun d!120133 () Bool)

(assert (= bs!28780 (and d!120133 b!1011969)))

(declare-datatypes ((Option!570 0))(
  ( (Some!569 (v!14417 B!1328)) (None!568) )
))
(declare-fun getValueByKey!519 (List!21381 (_ BitVec 64)) Option!570)

(assert (=> bs!28780 (= (dynLambda!1869 lambda!287 (h!22576 lt!447106)) (= (getValueByKey!519 l!412 (h!22576 lt!447106)) (Some!569 value!115)))))

(declare-fun m!935335 () Bool)

(assert (=> bs!28780 m!935335))

(assert (=> b!1012157 d!120133))

(check-sat tp_is_empty!23395 (not b!1012167) (not bs!28780) (not b!1012136) (not b!1012158) (not b_lambda!15217) (not bm!42468) (not bm!42471) (not b!1012021) (not d!120123) (not b!1012135) (not d!120105) (not bm!42470) (not b!1012114) (not bm!42469) (not b!1012137))
(check-sat)
