; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2888 () Bool)

(assert start!2888)

(declare-fun b_free!573 () Bool)

(declare-fun b_next!573 () Bool)

(assert (=> start!2888 (= b_free!573 (not b_next!573))))

(declare-fun tp!2893 () Bool)

(declare-fun b_and!1191 () Bool)

(assert (=> start!2888 (= tp!2893 b_and!1191)))

(declare-fun res!12311 () Bool)

(declare-fun e!10257 () Bool)

(assert (=> start!2888 (=> (not res!12311) (not e!10257))))

(declare-datatypes ((B!694 0))(
  ( (B!695 (val!445 Int)) )
))
(declare-datatypes ((tuple2!690 0))(
  ( (tuple2!691 (_1!345 (_ BitVec 64)) (_2!345 B!694)) )
))
(declare-datatypes ((List!530 0))(
  ( (Nil!527) (Cons!526 (h!1092 tuple2!690) (t!3143 List!530)) )
))
(declare-datatypes ((ListLongMap!521 0))(
  ( (ListLongMap!522 (toList!276 List!530)) )
))
(declare-fun lm!221 () ListLongMap!521)

(declare-fun p!191 () Int)

(declare-fun forall!147 (List!530 Int) Bool)

(assert (=> start!2888 (= res!12311 (forall!147 (toList!276 lm!221) p!191))))

(assert (=> start!2888 e!10257))

(declare-fun e!10258 () Bool)

(declare-fun inv!897 (ListLongMap!521) Bool)

(assert (=> start!2888 (and (inv!897 lm!221) e!10258)))

(assert (=> start!2888 tp!2893))

(assert (=> start!2888 true))

(declare-fun b!16581 () Bool)

(declare-fun res!12310 () Bool)

(assert (=> b!16581 (=> (not res!12310) (not e!10257))))

(declare-fun isEmpty!165 (ListLongMap!521) Bool)

(assert (=> b!16581 (= res!12310 (isEmpty!165 lm!221))))

(declare-fun a!507 () (_ BitVec 64))

(declare-fun b!16582 () Bool)

(declare-fun -!34 (ListLongMap!521 (_ BitVec 64)) ListLongMap!521)

(assert (=> b!16582 (= e!10257 (not (forall!147 (toList!276 (-!34 lm!221 a!507)) p!191)))))

(declare-fun b!16583 () Bool)

(declare-fun tp!2894 () Bool)

(assert (=> b!16583 (= e!10258 tp!2894)))

(assert (= (and start!2888 res!12311) b!16581))

(assert (= (and b!16581 res!12310) b!16582))

(assert (= start!2888 b!16583))

(declare-fun m!11681 () Bool)

(assert (=> start!2888 m!11681))

(declare-fun m!11683 () Bool)

(assert (=> start!2888 m!11683))

(declare-fun m!11685 () Bool)

(assert (=> b!16581 m!11685))

(declare-fun m!11687 () Bool)

(assert (=> b!16582 m!11687))

(declare-fun m!11689 () Bool)

(assert (=> b!16582 m!11689))

(check-sat (not b!16582) b_and!1191 (not b!16583) (not b!16581) (not start!2888) (not b_next!573))
(check-sat b_and!1191 (not b_next!573))
(get-model)

(declare-fun d!3299 () Bool)

(declare-fun isEmpty!169 (List!530) Bool)

(assert (=> d!3299 (= (isEmpty!165 lm!221) (isEmpty!169 (toList!276 lm!221)))))

(declare-fun bs!791 () Bool)

(assert (= bs!791 d!3299))

(declare-fun m!11705 () Bool)

(assert (=> bs!791 m!11705))

(assert (=> b!16581 d!3299))

(declare-fun d!3303 () Bool)

(declare-fun res!12334 () Bool)

(declare-fun e!10281 () Bool)

(assert (=> d!3303 (=> res!12334 e!10281)))

(get-info :version)

(assert (=> d!3303 (= res!12334 ((_ is Nil!527) (toList!276 lm!221)))))

(assert (=> d!3303 (= (forall!147 (toList!276 lm!221) p!191) e!10281)))

(declare-fun b!16609 () Bool)

(declare-fun e!10282 () Bool)

(assert (=> b!16609 (= e!10281 e!10282)))

(declare-fun res!12335 () Bool)

(assert (=> b!16609 (=> (not res!12335) (not e!10282))))

(declare-fun dynLambda!131 (Int tuple2!690) Bool)

(assert (=> b!16609 (= res!12335 (dynLambda!131 p!191 (h!1092 (toList!276 lm!221))))))

(declare-fun b!16610 () Bool)

(assert (=> b!16610 (= e!10282 (forall!147 (t!3143 (toList!276 lm!221)) p!191))))

(assert (= (and d!3303 (not res!12334)) b!16609))

(assert (= (and b!16609 res!12335) b!16610))

(declare-fun b_lambda!1391 () Bool)

(assert (=> (not b_lambda!1391) (not b!16609)))

(declare-fun t!3150 () Bool)

(declare-fun tb!605 () Bool)

(assert (=> (and start!2888 (= p!191 p!191) t!3150) tb!605))

(declare-fun result!977 () Bool)

(assert (=> tb!605 (= result!977 true)))

(assert (=> b!16609 t!3150))

(declare-fun b_and!1199 () Bool)

(assert (= b_and!1191 (and (=> t!3150 result!977) b_and!1199)))

(declare-fun m!11715 () Bool)

(assert (=> b!16609 m!11715))

(declare-fun m!11717 () Bool)

(assert (=> b!16610 m!11717))

(assert (=> start!2888 d!3303))

(declare-fun d!3309 () Bool)

(declare-fun isStrictlySorted!168 (List!530) Bool)

(assert (=> d!3309 (= (inv!897 lm!221) (isStrictlySorted!168 (toList!276 lm!221)))))

(declare-fun bs!794 () Bool)

(assert (= bs!794 d!3309))

(declare-fun m!11727 () Bool)

(assert (=> bs!794 m!11727))

(assert (=> start!2888 d!3309))

(declare-fun d!3317 () Bool)

(declare-fun res!12340 () Bool)

(declare-fun e!10287 () Bool)

(assert (=> d!3317 (=> res!12340 e!10287)))

(assert (=> d!3317 (= res!12340 ((_ is Nil!527) (toList!276 (-!34 lm!221 a!507))))))

(assert (=> d!3317 (= (forall!147 (toList!276 (-!34 lm!221 a!507)) p!191) e!10287)))

(declare-fun b!16615 () Bool)

(declare-fun e!10288 () Bool)

(assert (=> b!16615 (= e!10287 e!10288)))

(declare-fun res!12341 () Bool)

(assert (=> b!16615 (=> (not res!12341) (not e!10288))))

(assert (=> b!16615 (= res!12341 (dynLambda!131 p!191 (h!1092 (toList!276 (-!34 lm!221 a!507)))))))

(declare-fun b!16616 () Bool)

(assert (=> b!16616 (= e!10288 (forall!147 (t!3143 (toList!276 (-!34 lm!221 a!507))) p!191))))

(assert (= (and d!3317 (not res!12340)) b!16615))

(assert (= (and b!16615 res!12341) b!16616))

(declare-fun b_lambda!1397 () Bool)

(assert (=> (not b_lambda!1397) (not b!16615)))

(declare-fun t!3156 () Bool)

(declare-fun tb!611 () Bool)

(assert (=> (and start!2888 (= p!191 p!191) t!3156) tb!611))

(declare-fun result!983 () Bool)

(assert (=> tb!611 (= result!983 true)))

(assert (=> b!16615 t!3156))

(declare-fun b_and!1205 () Bool)

(assert (= b_and!1199 (and (=> t!3156 result!983) b_and!1205)))

(declare-fun m!11733 () Bool)

(assert (=> b!16615 m!11733))

(declare-fun m!11735 () Bool)

(assert (=> b!16616 m!11735))

(assert (=> b!16582 d!3317))

(declare-fun d!3321 () Bool)

(declare-fun lt!4084 () ListLongMap!521)

(declare-fun contains!207 (ListLongMap!521 (_ BitVec 64)) Bool)

(assert (=> d!3321 (not (contains!207 lt!4084 a!507))))

(declare-fun removeStrictlySorted!19 (List!530 (_ BitVec 64)) List!530)

(assert (=> d!3321 (= lt!4084 (ListLongMap!522 (removeStrictlySorted!19 (toList!276 lm!221) a!507)))))

(assert (=> d!3321 (= (-!34 lm!221 a!507) lt!4084)))

(declare-fun bs!797 () Bool)

(assert (= bs!797 d!3321))

(declare-fun m!11745 () Bool)

(assert (=> bs!797 m!11745))

(declare-fun m!11747 () Bool)

(assert (=> bs!797 m!11747))

(assert (=> b!16582 d!3321))

(declare-fun b!16631 () Bool)

(declare-fun e!10297 () Bool)

(declare-fun tp_is_empty!839 () Bool)

(declare-fun tp!2909 () Bool)

(assert (=> b!16631 (= e!10297 (and tp_is_empty!839 tp!2909))))

(assert (=> b!16583 (= tp!2894 e!10297)))

(assert (= (and b!16583 ((_ is Cons!526) (toList!276 lm!221))) b!16631))

(declare-fun b_lambda!1407 () Bool)

(assert (= b_lambda!1397 (or (and start!2888 b_free!573) b_lambda!1407)))

(declare-fun b_lambda!1409 () Bool)

(assert (= b_lambda!1391 (or (and start!2888 b_free!573) b_lambda!1409)))

(check-sat b_and!1205 (not b!16616) tp_is_empty!839 (not d!3309) (not b!16610) (not b_next!573) (not b_lambda!1407) (not b!16631) (not d!3299) (not b_lambda!1409) (not d!3321))
(check-sat b_and!1205 (not b_next!573))
(get-model)

(declare-fun d!3331 () Bool)

(declare-fun res!12357 () Bool)

(declare-fun e!10316 () Bool)

(assert (=> d!3331 (=> res!12357 e!10316)))

(assert (=> d!3331 (= res!12357 (or ((_ is Nil!527) (toList!276 lm!221)) ((_ is Nil!527) (t!3143 (toList!276 lm!221)))))))

(assert (=> d!3331 (= (isStrictlySorted!168 (toList!276 lm!221)) e!10316)))

(declare-fun b!16653 () Bool)

(declare-fun e!10317 () Bool)

(assert (=> b!16653 (= e!10316 e!10317)))

(declare-fun res!12358 () Bool)

(assert (=> b!16653 (=> (not res!12358) (not e!10317))))

(assert (=> b!16653 (= res!12358 (bvslt (_1!345 (h!1092 (toList!276 lm!221))) (_1!345 (h!1092 (t!3143 (toList!276 lm!221))))))))

(declare-fun b!16654 () Bool)

(assert (=> b!16654 (= e!10317 (isStrictlySorted!168 (t!3143 (toList!276 lm!221))))))

(assert (= (and d!3331 (not res!12357)) b!16653))

(assert (= (and b!16653 res!12358) b!16654))

(declare-fun m!11763 () Bool)

(assert (=> b!16654 m!11763))

(assert (=> d!3309 d!3331))

(declare-fun d!3335 () Bool)

(declare-fun e!10336 () Bool)

(assert (=> d!3335 e!10336))

(declare-fun res!12368 () Bool)

(assert (=> d!3335 (=> res!12368 e!10336)))

(declare-fun lt!4111 () Bool)

(assert (=> d!3335 (= res!12368 (not lt!4111))))

(declare-fun lt!4109 () Bool)

(assert (=> d!3335 (= lt!4111 lt!4109)))

(declare-datatypes ((Unit!333 0))(
  ( (Unit!334) )
))
(declare-fun lt!4108 () Unit!333)

(declare-fun e!10335 () Unit!333)

(assert (=> d!3335 (= lt!4108 e!10335)))

(declare-fun c!1602 () Bool)

(assert (=> d!3335 (= c!1602 lt!4109)))

(declare-fun containsKey!21 (List!530 (_ BitVec 64)) Bool)

(assert (=> d!3335 (= lt!4109 (containsKey!21 (toList!276 lt!4084) a!507))))

(assert (=> d!3335 (= (contains!207 lt!4084 a!507) lt!4111)))

(declare-fun b!16680 () Bool)

(declare-fun lt!4110 () Unit!333)

(assert (=> b!16680 (= e!10335 lt!4110)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!18 (List!530 (_ BitVec 64)) Unit!333)

(assert (=> b!16680 (= lt!4110 (lemmaContainsKeyImpliesGetValueByKeyDefined!18 (toList!276 lt!4084) a!507))))

(declare-datatypes ((Option!63 0))(
  ( (Some!62 (v!1392 B!694)) (None!61) )
))
(declare-fun isDefined!19 (Option!63) Bool)

(declare-fun getValueByKey!57 (List!530 (_ BitVec 64)) Option!63)

(assert (=> b!16680 (isDefined!19 (getValueByKey!57 (toList!276 lt!4084) a!507))))

(declare-fun b!16681 () Bool)

(declare-fun Unit!335 () Unit!333)

(assert (=> b!16681 (= e!10335 Unit!335)))

(declare-fun b!16682 () Bool)

(assert (=> b!16682 (= e!10336 (isDefined!19 (getValueByKey!57 (toList!276 lt!4084) a!507)))))

(assert (= (and d!3335 c!1602) b!16680))

(assert (= (and d!3335 (not c!1602)) b!16681))

(assert (= (and d!3335 (not res!12368)) b!16682))

(declare-fun m!11777 () Bool)

(assert (=> d!3335 m!11777))

(declare-fun m!11781 () Bool)

(assert (=> b!16680 m!11781))

(declare-fun m!11785 () Bool)

(assert (=> b!16680 m!11785))

(assert (=> b!16680 m!11785))

(declare-fun m!11787 () Bool)

(assert (=> b!16680 m!11787))

(assert (=> b!16682 m!11785))

(assert (=> b!16682 m!11785))

(assert (=> b!16682 m!11787))

(assert (=> d!3321 d!3335))

(declare-fun d!3343 () Bool)

(declare-fun e!10354 () Bool)

(assert (=> d!3343 e!10354))

(declare-fun res!12374 () Bool)

(assert (=> d!3343 (=> (not res!12374) (not e!10354))))

(declare-fun lt!4128 () List!530)

(assert (=> d!3343 (= res!12374 (isStrictlySorted!168 lt!4128))))

(declare-fun e!10356 () List!530)

(assert (=> d!3343 (= lt!4128 e!10356)))

(declare-fun c!1615 () Bool)

(assert (=> d!3343 (= c!1615 (and ((_ is Cons!526) (toList!276 lm!221)) (= (_1!345 (h!1092 (toList!276 lm!221))) a!507)))))

(assert (=> d!3343 (isStrictlySorted!168 (toList!276 lm!221))))

(assert (=> d!3343 (= (removeStrictlySorted!19 (toList!276 lm!221) a!507) lt!4128)))

(declare-fun b!16711 () Bool)

(declare-fun e!10355 () List!530)

(assert (=> b!16711 (= e!10355 Nil!527)))

(declare-fun b!16712 () Bool)

(assert (=> b!16712 (= e!10356 (t!3143 (toList!276 lm!221)))))

(declare-fun b!16713 () Bool)

(assert (=> b!16713 (= e!10354 (not (containsKey!21 lt!4128 a!507)))))

(declare-fun b!16714 () Bool)

(declare-fun $colon$colon!28 (List!530 tuple2!690) List!530)

(assert (=> b!16714 (= e!10355 ($colon$colon!28 (removeStrictlySorted!19 (t!3143 (toList!276 lm!221)) a!507) (h!1092 (toList!276 lm!221))))))

(declare-fun b!16715 () Bool)

(assert (=> b!16715 (= e!10356 e!10355)))

(declare-fun c!1614 () Bool)

(assert (=> b!16715 (= c!1614 (and ((_ is Cons!526) (toList!276 lm!221)) (not (= (_1!345 (h!1092 (toList!276 lm!221))) a!507))))))

(assert (= (and d!3343 c!1615) b!16712))

(assert (= (and d!3343 (not c!1615)) b!16715))

(assert (= (and b!16715 c!1614) b!16714))

(assert (= (and b!16715 (not c!1614)) b!16711))

(assert (= (and d!3343 res!12374) b!16713))

(declare-fun m!11797 () Bool)

(assert (=> d!3343 m!11797))

(assert (=> d!3343 m!11727))

(declare-fun m!11799 () Bool)

(assert (=> b!16713 m!11799))

(declare-fun m!11801 () Bool)

(assert (=> b!16714 m!11801))

(assert (=> b!16714 m!11801))

(declare-fun m!11803 () Bool)

(assert (=> b!16714 m!11803))

(assert (=> d!3321 d!3343))

(declare-fun d!3347 () Bool)

(declare-fun res!12377 () Bool)

(declare-fun e!10359 () Bool)

(assert (=> d!3347 (=> res!12377 e!10359)))

(assert (=> d!3347 (= res!12377 ((_ is Nil!527) (t!3143 (toList!276 lm!221))))))

(assert (=> d!3347 (= (forall!147 (t!3143 (toList!276 lm!221)) p!191) e!10359)))

(declare-fun b!16718 () Bool)

(declare-fun e!10360 () Bool)

(assert (=> b!16718 (= e!10359 e!10360)))

(declare-fun res!12378 () Bool)

(assert (=> b!16718 (=> (not res!12378) (not e!10360))))

(assert (=> b!16718 (= res!12378 (dynLambda!131 p!191 (h!1092 (t!3143 (toList!276 lm!221)))))))

(declare-fun b!16719 () Bool)

(assert (=> b!16719 (= e!10360 (forall!147 (t!3143 (t!3143 (toList!276 lm!221))) p!191))))

(assert (= (and d!3347 (not res!12377)) b!16718))

(assert (= (and b!16718 res!12378) b!16719))

(declare-fun b_lambda!1421 () Bool)

(assert (=> (not b_lambda!1421) (not b!16718)))

(declare-fun t!3164 () Bool)

(declare-fun tb!619 () Bool)

(assert (=> (and start!2888 (= p!191 p!191) t!3164) tb!619))

(declare-fun result!997 () Bool)

(assert (=> tb!619 (= result!997 true)))

(assert (=> b!16718 t!3164))

(declare-fun b_and!1213 () Bool)

(assert (= b_and!1205 (and (=> t!3164 result!997) b_and!1213)))

(declare-fun m!11805 () Bool)

(assert (=> b!16718 m!11805))

(declare-fun m!11807 () Bool)

(assert (=> b!16719 m!11807))

(assert (=> b!16610 d!3347))

(declare-fun d!3349 () Bool)

(declare-fun res!12379 () Bool)

(declare-fun e!10361 () Bool)

(assert (=> d!3349 (=> res!12379 e!10361)))

(assert (=> d!3349 (= res!12379 ((_ is Nil!527) (t!3143 (toList!276 (-!34 lm!221 a!507)))))))

(assert (=> d!3349 (= (forall!147 (t!3143 (toList!276 (-!34 lm!221 a!507))) p!191) e!10361)))

(declare-fun b!16720 () Bool)

(declare-fun e!10362 () Bool)

(assert (=> b!16720 (= e!10361 e!10362)))

(declare-fun res!12380 () Bool)

(assert (=> b!16720 (=> (not res!12380) (not e!10362))))

(assert (=> b!16720 (= res!12380 (dynLambda!131 p!191 (h!1092 (t!3143 (toList!276 (-!34 lm!221 a!507))))))))

(declare-fun b!16721 () Bool)

(assert (=> b!16721 (= e!10362 (forall!147 (t!3143 (t!3143 (toList!276 (-!34 lm!221 a!507)))) p!191))))

(assert (= (and d!3349 (not res!12379)) b!16720))

(assert (= (and b!16720 res!12380) b!16721))

(declare-fun b_lambda!1423 () Bool)

(assert (=> (not b_lambda!1423) (not b!16720)))

(declare-fun t!3166 () Bool)

(declare-fun tb!621 () Bool)

(assert (=> (and start!2888 (= p!191 p!191) t!3166) tb!621))

(declare-fun result!999 () Bool)

(assert (=> tb!621 (= result!999 true)))

(assert (=> b!16720 t!3166))

(declare-fun b_and!1215 () Bool)

(assert (= b_and!1213 (and (=> t!3166 result!999) b_and!1215)))

(declare-fun m!11809 () Bool)

(assert (=> b!16720 m!11809))

(declare-fun m!11811 () Bool)

(assert (=> b!16721 m!11811))

(assert (=> b!16616 d!3349))

(declare-fun d!3351 () Bool)

(assert (=> d!3351 (= (isEmpty!169 (toList!276 lm!221)) ((_ is Nil!527) (toList!276 lm!221)))))

(assert (=> d!3299 d!3351))

(declare-fun b!16729 () Bool)

(declare-fun e!10368 () Bool)

(declare-fun tp!2911 () Bool)

(assert (=> b!16729 (= e!10368 (and tp_is_empty!839 tp!2911))))

(assert (=> b!16631 (= tp!2909 e!10368)))

(assert (= (and b!16631 ((_ is Cons!526) (t!3143 (toList!276 lm!221)))) b!16729))

(declare-fun b_lambda!1425 () Bool)

(assert (= b_lambda!1421 (or (and start!2888 b_free!573) b_lambda!1425)))

(declare-fun b_lambda!1427 () Bool)

(assert (= b_lambda!1423 (or (and start!2888 b_free!573) b_lambda!1427)))

(check-sat (not b_lambda!1427) tp_is_empty!839 (not b!16654) (not b!16680) (not b!16719) (not d!3343) b_and!1215 (not b!16721) (not b!16713) (not d!3335) (not b_next!573) (not b!16682) (not b!16714) (not b_lambda!1407) (not b_lambda!1409) (not b!16729) (not b_lambda!1425))
