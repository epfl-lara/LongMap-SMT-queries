; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106504 () Bool)

(assert start!106504)

(declare-fun res!842891 () Bool)

(declare-fun e!720968 () Bool)

(assert (=> start!106504 (=> (not res!842891) (not e!720968))))

(declare-datatypes ((B!1998 0))(
  ( (B!1999 (val!16334 Int)) )
))
(declare-datatypes ((tuple2!21268 0))(
  ( (tuple2!21269 (_1!10645 (_ BitVec 64)) (_2!10645 B!1998)) )
))
(declare-datatypes ((List!28410 0))(
  ( (Nil!28407) (Cons!28406 (h!29615 tuple2!21268) (t!41922 List!28410)) )
))
(declare-fun l!706 () List!28410)

(declare-fun isStrictlySorted!797 (List!28410) Bool)

(assert (=> start!106504 (= res!842891 (isStrictlySorted!797 l!706))))

(assert (=> start!106504 e!720968))

(declare-fun e!720967 () Bool)

(assert (=> start!106504 e!720967))

(assert (=> start!106504 true))

(declare-fun tp_is_empty!32531 () Bool)

(assert (=> start!106504 tp_is_empty!32531))

(declare-fun b!1265914 () Bool)

(declare-fun res!842893 () Bool)

(assert (=> b!1265914 (=> (not res!842893) (not e!720968))))

(assert (=> b!1265914 (= res!842893 (isStrictlySorted!797 (t!41922 l!706)))))

(declare-fun b!1265915 () Bool)

(declare-fun res!842892 () Bool)

(assert (=> b!1265915 (=> (not res!842892) (not e!720968))))

(assert (=> b!1265915 (= res!842892 (is-Cons!28406 l!706))))

(declare-fun b!1265916 () Bool)

(declare-fun tp!96416 () Bool)

(assert (=> b!1265916 (= e!720967 (and tp_is_empty!32531 tp!96416))))

(declare-fun b!1265917 () Bool)

(declare-fun res!842895 () Bool)

(assert (=> b!1265917 (=> (not res!842895) (not e!720968))))

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!658 (List!28410 (_ BitVec 64)) Bool)

(assert (=> b!1265917 (= res!842895 (not (containsKey!658 l!706 key1!31)))))

(declare-fun b!1265918 () Bool)

(declare-fun res!842894 () Bool)

(assert (=> b!1265918 (=> (not res!842894) (not e!720968))))

(assert (=> b!1265918 (= res!842894 (not (containsKey!658 (t!41922 l!706) key1!31)))))

(declare-fun b!1265919 () Bool)

(declare-fun v1!26 () B!1998)

(declare-fun removeStrictlySorted!157 (List!28410 (_ BitVec 64)) List!28410)

(declare-fun insertStrictlySorted!468 (List!28410 (_ BitVec 64) B!1998) List!28410)

(assert (=> b!1265919 (= e!720968 (not (= (removeStrictlySorted!157 (insertStrictlySorted!468 l!706 key1!31 v1!26) key1!31) l!706)))))

(assert (=> b!1265919 (= (removeStrictlySorted!157 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26) key1!31) (t!41922 l!706))))

(declare-datatypes ((Unit!42037 0))(
  ( (Unit!42038) )
))
(declare-fun lt!573901 () Unit!42037)

(declare-fun lemmaInsertStrictlySortedThenRemoveIsSame!12 (List!28410 (_ BitVec 64) B!1998) Unit!42037)

(assert (=> b!1265919 (= lt!573901 (lemmaInsertStrictlySortedThenRemoveIsSame!12 (t!41922 l!706) key1!31 v1!26))))

(assert (= (and start!106504 res!842891) b!1265917))

(assert (= (and b!1265917 res!842895) b!1265915))

(assert (= (and b!1265915 res!842892) b!1265914))

(assert (= (and b!1265914 res!842893) b!1265918))

(assert (= (and b!1265918 res!842894) b!1265919))

(assert (= (and start!106504 (is-Cons!28406 l!706)) b!1265916))

(declare-fun m!1165319 () Bool)

(assert (=> start!106504 m!1165319))

(declare-fun m!1165321 () Bool)

(assert (=> b!1265919 m!1165321))

(declare-fun m!1165323 () Bool)

(assert (=> b!1265919 m!1165323))

(assert (=> b!1265919 m!1165321))

(declare-fun m!1165325 () Bool)

(assert (=> b!1265919 m!1165325))

(declare-fun m!1165327 () Bool)

(assert (=> b!1265919 m!1165327))

(assert (=> b!1265919 m!1165327))

(declare-fun m!1165329 () Bool)

(assert (=> b!1265919 m!1165329))

(declare-fun m!1165331 () Bool)

(assert (=> b!1265918 m!1165331))

(declare-fun m!1165333 () Bool)

(assert (=> b!1265914 m!1165333))

(declare-fun m!1165335 () Bool)

(assert (=> b!1265917 m!1165335))

(push 1)

(assert (not b!1265914))

(assert (not b!1265918))

(assert tp_is_empty!32531)

(assert (not b!1265919))

(assert (not b!1265916))

(assert (not start!106504))

(assert (not b!1265917))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!138901 () Bool)

(declare-fun res!842904 () Bool)

(declare-fun e!720977 () Bool)

(assert (=> d!138901 (=> res!842904 e!720977)))

(assert (=> d!138901 (= res!842904 (or (is-Nil!28407 (t!41922 l!706)) (is-Nil!28407 (t!41922 (t!41922 l!706)))))))

(assert (=> d!138901 (= (isStrictlySorted!797 (t!41922 l!706)) e!720977)))

(declare-fun b!1265928 () Bool)

(declare-fun e!720978 () Bool)

(assert (=> b!1265928 (= e!720977 e!720978)))

(declare-fun res!842905 () Bool)

(assert (=> b!1265928 (=> (not res!842905) (not e!720978))))

(assert (=> b!1265928 (= res!842905 (bvslt (_1!10645 (h!29615 (t!41922 l!706))) (_1!10645 (h!29615 (t!41922 (t!41922 l!706))))))))

(declare-fun b!1265929 () Bool)

(assert (=> b!1265929 (= e!720978 (isStrictlySorted!797 (t!41922 (t!41922 l!706))))))

(assert (= (and d!138901 (not res!842904)) b!1265928))

(assert (= (and b!1265928 res!842905) b!1265929))

(declare-fun m!1165337 () Bool)

(assert (=> b!1265929 m!1165337))

(assert (=> b!1265914 d!138901))

(declare-fun d!138905 () Bool)

(declare-fun res!842908 () Bool)

(declare-fun e!720981 () Bool)

(assert (=> d!138905 (=> res!842908 e!720981)))

(assert (=> d!138905 (= res!842908 (or (is-Nil!28407 l!706) (is-Nil!28407 (t!41922 l!706))))))

(assert (=> d!138905 (= (isStrictlySorted!797 l!706) e!720981)))

(declare-fun b!1265932 () Bool)

(declare-fun e!720982 () Bool)

(assert (=> b!1265932 (= e!720981 e!720982)))

(declare-fun res!842909 () Bool)

(assert (=> b!1265932 (=> (not res!842909) (not e!720982))))

(assert (=> b!1265932 (= res!842909 (bvslt (_1!10645 (h!29615 l!706)) (_1!10645 (h!29615 (t!41922 l!706)))))))

(declare-fun b!1265933 () Bool)

(assert (=> b!1265933 (= e!720982 (isStrictlySorted!797 (t!41922 l!706)))))

(assert (= (and d!138905 (not res!842908)) b!1265932))

(assert (= (and b!1265932 res!842909) b!1265933))

(assert (=> b!1265933 m!1165333))

(assert (=> start!106504 d!138905))

(declare-fun d!138907 () Bool)

(declare-fun res!842931 () Bool)

(declare-fun e!721004 () Bool)

(assert (=> d!138907 (=> res!842931 e!721004)))

(assert (=> d!138907 (= res!842931 (and (is-Cons!28406 l!706) (= (_1!10645 (h!29615 l!706)) key1!31)))))

(assert (=> d!138907 (= (containsKey!658 l!706 key1!31) e!721004)))

(declare-fun b!1265954 () Bool)

(declare-fun e!721006 () Bool)

(assert (=> b!1265954 (= e!721004 e!721006)))

(declare-fun res!842933 () Bool)

(assert (=> b!1265954 (=> (not res!842933) (not e!721006))))

(assert (=> b!1265954 (= res!842933 (and (or (not (is-Cons!28406 l!706)) (bvsle (_1!10645 (h!29615 l!706)) key1!31)) (is-Cons!28406 l!706) (bvslt (_1!10645 (h!29615 l!706)) key1!31)))))

(declare-fun b!1265955 () Bool)

(assert (=> b!1265955 (= e!721006 (containsKey!658 (t!41922 l!706) key1!31))))

(assert (= (and d!138907 (not res!842931)) b!1265954))

(assert (= (and b!1265954 res!842933) b!1265955))

(assert (=> b!1265955 m!1165331))

(assert (=> b!1265917 d!138907))

(declare-fun d!138917 () Bool)

(declare-fun res!842934 () Bool)

(declare-fun e!721007 () Bool)

(assert (=> d!138917 (=> res!842934 e!721007)))

(assert (=> d!138917 (= res!842934 (and (is-Cons!28406 (t!41922 l!706)) (= (_1!10645 (h!29615 (t!41922 l!706))) key1!31)))))

(assert (=> d!138917 (= (containsKey!658 (t!41922 l!706) key1!31) e!721007)))

(declare-fun b!1265958 () Bool)

(declare-fun e!721008 () Bool)

(assert (=> b!1265958 (= e!721007 e!721008)))

(declare-fun res!842935 () Bool)

(assert (=> b!1265958 (=> (not res!842935) (not e!721008))))

(assert (=> b!1265958 (= res!842935 (and (or (not (is-Cons!28406 (t!41922 l!706))) (bvsle (_1!10645 (h!29615 (t!41922 l!706))) key1!31)) (is-Cons!28406 (t!41922 l!706)) (bvslt (_1!10645 (h!29615 (t!41922 l!706))) key1!31)))))

(declare-fun b!1265959 () Bool)

(assert (=> b!1265959 (= e!721008 (containsKey!658 (t!41922 (t!41922 l!706)) key1!31))))

(assert (= (and d!138917 (not res!842934)) b!1265958))

(assert (= (and b!1265958 res!842935) b!1265959))

(declare-fun m!1165343 () Bool)

(assert (=> b!1265959 m!1165343))

(assert (=> b!1265918 d!138917))

(declare-fun d!138919 () Bool)

(declare-fun e!721036 () Bool)

(assert (=> d!138919 e!721036))

(declare-fun res!842949 () Bool)

(assert (=> d!138919 (=> (not res!842949) (not e!721036))))

(declare-fun lt!573909 () List!28410)

(assert (=> d!138919 (= res!842949 (isStrictlySorted!797 lt!573909))))

(declare-fun e!721037 () List!28410)

(assert (=> d!138919 (= lt!573909 e!721037)))

(declare-fun c!123337 () Bool)

(assert (=> d!138919 (= c!123337 (and (is-Cons!28406 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26)) (= (_1!10645 (h!29615 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26))) key1!31)))))

(assert (=> d!138919 (isStrictlySorted!797 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26))))

(assert (=> d!138919 (= (removeStrictlySorted!157 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26) key1!31) lt!573909)))

(declare-fun b!1266001 () Bool)

(assert (=> b!1266001 (= e!721036 (not (containsKey!658 lt!573909 key1!31)))))

(declare-fun b!1266002 () Bool)

(assert (=> b!1266002 (= e!721037 (t!41922 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26)))))

(declare-fun b!1266003 () Bool)

(declare-fun e!721038 () List!28410)

(assert (=> b!1266003 (= e!721038 Nil!28407)))

(declare-fun b!1266004 () Bool)

(declare-fun $colon$colon!643 (List!28410 tuple2!21268) List!28410)

(assert (=> b!1266004 (= e!721038 ($colon$colon!643 (removeStrictlySorted!157 (t!41922 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26)) key1!31) (h!29615 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26))))))

(declare-fun b!1266005 () Bool)

(assert (=> b!1266005 (= e!721037 e!721038)))

(declare-fun c!123338 () Bool)

(assert (=> b!1266005 (= c!123338 (and (is-Cons!28406 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26)) (not (= (_1!10645 (h!29615 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26))) key1!31))))))

(assert (= (and d!138919 c!123337) b!1266002))

(assert (= (and d!138919 (not c!123337)) b!1266005))

(assert (= (and b!1266005 c!123338) b!1266004))

(assert (= (and b!1266005 (not c!123338)) b!1266003))

(assert (= (and d!138919 res!842949) b!1266001))

(declare-fun m!1165359 () Bool)

(assert (=> d!138919 m!1165359))

(assert (=> d!138919 m!1165321))

(declare-fun m!1165361 () Bool)

(assert (=> d!138919 m!1165361))

(declare-fun m!1165363 () Bool)

(assert (=> b!1266001 m!1165363))

(declare-fun m!1165365 () Bool)

(assert (=> b!1266004 m!1165365))

(assert (=> b!1266004 m!1165365))

(declare-fun m!1165367 () Bool)

(assert (=> b!1266004 m!1165367))

(assert (=> b!1265919 d!138919))

(declare-fun b!1266081 () Bool)

(declare-fun e!721079 () List!28410)

(declare-fun e!721080 () List!28410)

(assert (=> b!1266081 (= e!721079 e!721080)))

(declare-fun c!123370 () Bool)

(assert (=> b!1266081 (= c!123370 (and (is-Cons!28406 l!706) (= (_1!10645 (h!29615 l!706)) key1!31)))))

(declare-fun bm!62422 () Bool)

(declare-fun call!62427 () List!28410)

(declare-fun call!62425 () List!28410)

(assert (=> bm!62422 (= call!62427 call!62425)))

(declare-fun e!721081 () List!28410)

(declare-fun b!1266082 () Bool)

(assert (=> b!1266082 (= e!721081 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26))))

(declare-fun b!1266083 () Bool)

(declare-fun res!842965 () Bool)

(declare-fun e!721077 () Bool)

(assert (=> b!1266083 (=> (not res!842965) (not e!721077))))

(declare-fun lt!573918 () List!28410)

(assert (=> b!1266083 (= res!842965 (containsKey!658 lt!573918 key1!31))))

(declare-fun b!1266084 () Bool)

(declare-fun e!721078 () List!28410)

(assert (=> b!1266084 (= e!721078 call!62427)))

(declare-fun c!123371 () Bool)

(declare-fun bm!62424 () Bool)

(declare-fun call!62426 () List!28410)

(assert (=> bm!62424 (= call!62426 ($colon$colon!643 e!721081 (ite c!123371 (h!29615 l!706) (tuple2!21269 key1!31 v1!26))))))

(declare-fun c!123369 () Bool)

(assert (=> bm!62424 (= c!123369 c!123371)))

(declare-fun b!1266085 () Bool)

(declare-fun contains!7610 (List!28410 tuple2!21268) Bool)

(assert (=> b!1266085 (= e!721077 (contains!7610 lt!573918 (tuple2!21269 key1!31 v1!26)))))

(declare-fun b!1266086 () Bool)

(assert (=> b!1266086 (= e!721080 call!62425)))

(declare-fun b!1266087 () Bool)

(declare-fun c!123372 () Bool)

(assert (=> b!1266087 (= c!123372 (and (is-Cons!28406 l!706) (bvsgt (_1!10645 (h!29615 l!706)) key1!31)))))

(assert (=> b!1266087 (= e!721080 e!721078)))

(declare-fun b!1266088 () Bool)

(assert (=> b!1266088 (= e!721078 call!62427)))

(declare-fun b!1266089 () Bool)

(assert (=> b!1266089 (= e!721079 call!62426)))

(declare-fun b!1266090 () Bool)

(assert (=> b!1266090 (= e!721081 (ite c!123370 (t!41922 l!706) (ite c!123372 (Cons!28406 (h!29615 l!706) (t!41922 l!706)) Nil!28407)))))

(declare-fun d!138929 () Bool)

(assert (=> d!138929 e!721077))

(declare-fun res!842966 () Bool)

(assert (=> d!138929 (=> (not res!842966) (not e!721077))))

(assert (=> d!138929 (= res!842966 (isStrictlySorted!797 lt!573918))))

(assert (=> d!138929 (= lt!573918 e!721079)))

(assert (=> d!138929 (= c!123371 (and (is-Cons!28406 l!706) (bvslt (_1!10645 (h!29615 l!706)) key1!31)))))

(assert (=> d!138929 (isStrictlySorted!797 l!706)))

(assert (=> d!138929 (= (insertStrictlySorted!468 l!706 key1!31 v1!26) lt!573918)))

(declare-fun bm!62423 () Bool)

(assert (=> bm!62423 (= call!62425 call!62426)))

(assert (= (and d!138929 c!123371) b!1266089))

(assert (= (and d!138929 (not c!123371)) b!1266081))

(assert (= (and b!1266081 c!123370) b!1266086))

(assert (= (and b!1266081 (not c!123370)) b!1266087))

(assert (= (and b!1266087 c!123372) b!1266084))

(assert (= (and b!1266087 (not c!123372)) b!1266088))

(assert (= (or b!1266084 b!1266088) bm!62422))

(assert (= (or b!1266086 bm!62422) bm!62423))

(assert (= (or b!1266089 bm!62423) bm!62424))

(assert (= (and bm!62424 c!123369) b!1266082))

(assert (= (and bm!62424 (not c!123369)) b!1266090))

(assert (= (and d!138929 res!842966) b!1266083))

(assert (= (and b!1266083 res!842965) b!1266085))

(declare-fun m!1165387 () Bool)

(assert (=> d!138929 m!1165387))

(assert (=> d!138929 m!1165319))

(declare-fun m!1165389 () Bool)

(assert (=> b!1266083 m!1165389))

(declare-fun m!1165391 () Bool)

(assert (=> b!1266085 m!1165391))

(declare-fun m!1165393 () Bool)

(assert (=> bm!62424 m!1165393))

(assert (=> b!1266082 m!1165321))

(assert (=> b!1265919 d!138929))

(declare-fun d!138935 () Bool)

(declare-fun e!721090 () Bool)

(assert (=> d!138935 e!721090))

(declare-fun res!842970 () Bool)

(assert (=> d!138935 (=> (not res!842970) (not e!721090))))

(declare-fun lt!573921 () List!28410)

(assert (=> d!138935 (= res!842970 (isStrictlySorted!797 lt!573921))))

(declare-fun e!721091 () List!28410)

(assert (=> d!138935 (= lt!573921 e!721091)))

(declare-fun c!123379 () Bool)

(assert (=> d!138935 (= c!123379 (and (is-Cons!28406 (insertStrictlySorted!468 l!706 key1!31 v1!26)) (= (_1!10645 (h!29615 (insertStrictlySorted!468 l!706 key1!31 v1!26))) key1!31)))))

(assert (=> d!138935 (isStrictlySorted!797 (insertStrictlySorted!468 l!706 key1!31 v1!26))))

(assert (=> d!138935 (= (removeStrictlySorted!157 (insertStrictlySorted!468 l!706 key1!31 v1!26) key1!31) lt!573921)))

(declare-fun b!1266106 () Bool)

(assert (=> b!1266106 (= e!721090 (not (containsKey!658 lt!573921 key1!31)))))

(declare-fun b!1266107 () Bool)

(assert (=> b!1266107 (= e!721091 (t!41922 (insertStrictlySorted!468 l!706 key1!31 v1!26)))))

(declare-fun b!1266108 () Bool)

(declare-fun e!721092 () List!28410)

(assert (=> b!1266108 (= e!721092 Nil!28407)))

(declare-fun b!1266109 () Bool)

(assert (=> b!1266109 (= e!721092 ($colon$colon!643 (removeStrictlySorted!157 (t!41922 (insertStrictlySorted!468 l!706 key1!31 v1!26)) key1!31) (h!29615 (insertStrictlySorted!468 l!706 key1!31 v1!26))))))

(declare-fun b!1266110 () Bool)

(assert (=> b!1266110 (= e!721091 e!721092)))

(declare-fun c!123380 () Bool)

(assert (=> b!1266110 (= c!123380 (and (is-Cons!28406 (insertStrictlySorted!468 l!706 key1!31 v1!26)) (not (= (_1!10645 (h!29615 (insertStrictlySorted!468 l!706 key1!31 v1!26))) key1!31))))))

(assert (= (and d!138935 c!123379) b!1266107))

(assert (= (and d!138935 (not c!123379)) b!1266110))

(assert (= (and b!1266110 c!123380) b!1266109))

(assert (= (and b!1266110 (not c!123380)) b!1266108))

(assert (= (and d!138935 res!842970) b!1266106))

(declare-fun m!1165405 () Bool)

(assert (=> d!138935 m!1165405))

(assert (=> d!138935 m!1165327))

(declare-fun m!1165407 () Bool)

(assert (=> d!138935 m!1165407))

(declare-fun m!1165409 () Bool)

(assert (=> b!1266106 m!1165409))

(declare-fun m!1165411 () Bool)

(assert (=> b!1266109 m!1165411))

(assert (=> b!1266109 m!1165411))

(declare-fun m!1165413 () Bool)

(assert (=> b!1266109 m!1165413))

(assert (=> b!1265919 d!138935))

(declare-fun d!138939 () Bool)

(assert (=> d!138939 (= (removeStrictlySorted!157 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26) key1!31) (t!41922 l!706))))

(declare-fun lt!573928 () Unit!42037)

(declare-fun choose!1896 (List!28410 (_ BitVec 64) B!1998) Unit!42037)

(assert (=> d!138939 (= lt!573928 (choose!1896 (t!41922 l!706) key1!31 v1!26))))

(assert (=> d!138939 (isStrictlySorted!797 (t!41922 l!706))))

(assert (=> d!138939 (= (lemmaInsertStrictlySortedThenRemoveIsSame!12 (t!41922 l!706) key1!31 v1!26) lt!573928)))

(declare-fun bs!35807 () Bool)

(assert (= bs!35807 d!138939))

(assert (=> bs!35807 m!1165321))

(assert (=> bs!35807 m!1165321))

(assert (=> bs!35807 m!1165325))

(declare-fun m!1165435 () Bool)

(assert (=> bs!35807 m!1165435))

(assert (=> bs!35807 m!1165333))

(assert (=> b!1265919 d!138939))

(declare-fun b!1266126 () Bool)

(declare-fun e!721103 () List!28410)

(declare-fun e!721104 () List!28410)

(assert (=> b!1266126 (= e!721103 e!721104)))

(declare-fun c!123388 () Bool)

(assert (=> b!1266126 (= c!123388 (and (is-Cons!28406 (t!41922 l!706)) (= (_1!10645 (h!29615 (t!41922 l!706))) key1!31)))))

(declare-fun bm!62431 () Bool)

(declare-fun call!62436 () List!28410)

(declare-fun call!62434 () List!28410)

(assert (=> bm!62431 (= call!62436 call!62434)))

(declare-fun b!1266127 () Bool)

(declare-fun e!721105 () List!28410)

(assert (=> b!1266127 (= e!721105 (insertStrictlySorted!468 (t!41922 (t!41922 l!706)) key1!31 v1!26))))

(declare-fun b!1266128 () Bool)

(declare-fun res!842974 () Bool)

(declare-fun e!721101 () Bool)

(assert (=> b!1266128 (=> (not res!842974) (not e!721101))))

(declare-fun lt!573932 () List!28410)

(assert (=> b!1266128 (= res!842974 (containsKey!658 lt!573932 key1!31))))

(declare-fun b!1266129 () Bool)

(declare-fun e!721102 () List!28410)

(assert (=> b!1266129 (= e!721102 call!62436)))

(declare-fun call!62435 () List!28410)

(declare-fun bm!62433 () Bool)

(declare-fun c!123389 () Bool)

(assert (=> bm!62433 (= call!62435 ($colon$colon!643 e!721105 (ite c!123389 (h!29615 (t!41922 l!706)) (tuple2!21269 key1!31 v1!26))))))

(declare-fun c!123387 () Bool)

(assert (=> bm!62433 (= c!123387 c!123389)))

(declare-fun b!1266130 () Bool)

(assert (=> b!1266130 (= e!721101 (contains!7610 lt!573932 (tuple2!21269 key1!31 v1!26)))))

(declare-fun b!1266131 () Bool)

(assert (=> b!1266131 (= e!721104 call!62434)))

(declare-fun b!1266132 () Bool)

(declare-fun c!123390 () Bool)

(assert (=> b!1266132 (= c!123390 (and (is-Cons!28406 (t!41922 l!706)) (bvsgt (_1!10645 (h!29615 (t!41922 l!706))) key1!31)))))

(assert (=> b!1266132 (= e!721104 e!721102)))

(declare-fun b!1266133 () Bool)

(assert (=> b!1266133 (= e!721102 call!62436)))

(declare-fun b!1266134 () Bool)

(assert (=> b!1266134 (= e!721103 call!62435)))

(declare-fun b!1266135 () Bool)

(assert (=> b!1266135 (= e!721105 (ite c!123388 (t!41922 (t!41922 l!706)) (ite c!123390 (Cons!28406 (h!29615 (t!41922 l!706)) (t!41922 (t!41922 l!706))) Nil!28407)))))

(declare-fun d!138947 () Bool)

(assert (=> d!138947 e!721101))

(declare-fun res!842975 () Bool)

(assert (=> d!138947 (=> (not res!842975) (not e!721101))))

(assert (=> d!138947 (= res!842975 (isStrictlySorted!797 lt!573932))))

(assert (=> d!138947 (= lt!573932 e!721103)))

(assert (=> d!138947 (= c!123389 (and (is-Cons!28406 (t!41922 l!706)) (bvslt (_1!10645 (h!29615 (t!41922 l!706))) key1!31)))))

(assert (=> d!138947 (isStrictlySorted!797 (t!41922 l!706))))

(assert (=> d!138947 (= (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26) lt!573932)))

(declare-fun bm!62432 () Bool)

(assert (=> bm!62432 (= call!62434 call!62435)))

(assert (= (and d!138947 c!123389) b!1266134))

(assert (= (and d!138947 (not c!123389)) b!1266126))

(assert (= (and b!1266126 c!123388) b!1266131))

(assert (= (and b!1266126 (not c!123388)) b!1266132))

(assert (= (and b!1266132 c!123390) b!1266129))

(assert (= (and b!1266132 (not c!123390)) b!1266133))

(assert (= (or b!1266129 b!1266133) bm!62431))

(assert (= (or b!1266131 bm!62431) bm!62432))

(assert (= (or b!1266134 bm!62432) bm!62433))

(assert (= (and bm!62433 c!123387) b!1266127))

(assert (= (and bm!62433 (not c!123387)) b!1266135))

(assert (= (and d!138947 res!842975) b!1266128))

(assert (= (and b!1266128 res!842974) b!1266130))

(declare-fun m!1165443 () Bool)

(assert (=> d!138947 m!1165443))

(assert (=> d!138947 m!1165333))

(declare-fun m!1165449 () Bool)

(assert (=> b!1266128 m!1165449))

(declare-fun m!1165453 () Bool)

(assert (=> b!1266130 m!1165453))

(declare-fun m!1165455 () Bool)

(assert (=> bm!62433 m!1165455))

(declare-fun m!1165457 () Bool)

(assert (=> b!1266127 m!1165457))

(assert (=> b!1265919 d!138947))

(declare-fun b!1266156 () Bool)

(declare-fun e!721117 () Bool)

(declare-fun tp!96421 () Bool)

(assert (=> b!1266156 (= e!721117 (and tp_is_empty!32531 tp!96421))))

(assert (=> b!1265916 (= tp!96416 e!721117)))

(assert (= (and b!1265916 (is-Cons!28406 (t!41922 l!706))) b!1266156))

(push 1)

(assert (not b!1266004))

(assert (not d!138939))

(assert (not b!1266127))

(assert (not b!1265929))

(assert (not b!1265959))

(assert (not b!1266156))

(assert (not b!1266001))

(assert (not b!1265933))

(assert (not b!1266109))

(assert (not b!1266085))

(assert (not b!1266130))

(assert (not b!1266106))

(assert (not bm!62424))

(assert (not b!1266083))

(assert (not d!138947))

(assert (not bm!62433))

(assert (not b!1265955))

(assert (not d!138919))

(assert (not b!1266128))

(assert (not b!1266082))

(assert tp_is_empty!32531)

(assert (not d!138935))

(assert (not d!138929))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!138997 () Bool)

(declare-fun res!843016 () Bool)

(declare-fun e!721166 () Bool)

(assert (=> d!138997 (=> res!843016 e!721166)))

(assert (=> d!138997 (= res!843016 (and (is-Cons!28406 lt!573921) (= (_1!10645 (h!29615 lt!573921)) key1!31)))))

(assert (=> d!138997 (= (containsKey!658 lt!573921 key1!31) e!721166)))

(declare-fun b!1266216 () Bool)

(declare-fun e!721167 () Bool)

(assert (=> b!1266216 (= e!721166 e!721167)))

(declare-fun res!843017 () Bool)

(assert (=> b!1266216 (=> (not res!843017) (not e!721167))))

(assert (=> b!1266216 (= res!843017 (and (or (not (is-Cons!28406 lt!573921)) (bvsle (_1!10645 (h!29615 lt!573921)) key1!31)) (is-Cons!28406 lt!573921) (bvslt (_1!10645 (h!29615 lt!573921)) key1!31)))))

(declare-fun b!1266217 () Bool)

(assert (=> b!1266217 (= e!721167 (containsKey!658 (t!41922 lt!573921) key1!31))))

(assert (= (and d!138997 (not res!843016)) b!1266216))

(assert (= (and b!1266216 res!843017) b!1266217))

(declare-fun m!1165531 () Bool)

(assert (=> b!1266217 m!1165531))

(assert (=> b!1266106 d!138997))

(declare-fun d!138999 () Bool)

(assert (=> d!138999 (= ($colon$colon!643 e!721081 (ite c!123371 (h!29615 l!706) (tuple2!21269 key1!31 v1!26))) (Cons!28406 (ite c!123371 (h!29615 l!706) (tuple2!21269 key1!31 v1!26)) e!721081))))

(assert (=> bm!62424 d!138999))

(declare-fun lt!573944 () Bool)

(declare-fun d!139001 () Bool)

(declare-fun content!633 (List!28410) (Set tuple2!21268))

(assert (=> d!139001 (= lt!573944 (set.member (tuple2!21269 key1!31 v1!26) (content!633 lt!573918)))))

(declare-fun e!721172 () Bool)

(assert (=> d!139001 (= lt!573944 e!721172)))

(declare-fun res!843023 () Bool)

(assert (=> d!139001 (=> (not res!843023) (not e!721172))))

(assert (=> d!139001 (= res!843023 (is-Cons!28406 lt!573918))))

(assert (=> d!139001 (= (contains!7610 lt!573918 (tuple2!21269 key1!31 v1!26)) lt!573944)))

(declare-fun b!1266222 () Bool)

(declare-fun e!721173 () Bool)

(assert (=> b!1266222 (= e!721172 e!721173)))

(declare-fun res!843022 () Bool)

(assert (=> b!1266222 (=> res!843022 e!721173)))

(assert (=> b!1266222 (= res!843022 (= (h!29615 lt!573918) (tuple2!21269 key1!31 v1!26)))))

(declare-fun b!1266223 () Bool)

(assert (=> b!1266223 (= e!721173 (contains!7610 (t!41922 lt!573918) (tuple2!21269 key1!31 v1!26)))))

(assert (= (and d!139001 res!843023) b!1266222))

(assert (= (and b!1266222 (not res!843022)) b!1266223))

(declare-fun m!1165533 () Bool)

(assert (=> d!139001 m!1165533))

(declare-fun m!1165535 () Bool)

(assert (=> d!139001 m!1165535))

(declare-fun m!1165537 () Bool)

(assert (=> b!1266223 m!1165537))

(assert (=> b!1266085 d!139001))

(declare-fun b!1266224 () Bool)

(declare-fun e!721176 () List!28410)

(declare-fun e!721177 () List!28410)

(assert (=> b!1266224 (= e!721176 e!721177)))

(declare-fun c!123404 () Bool)

(assert (=> b!1266224 (= c!123404 (and (is-Cons!28406 (t!41922 (t!41922 l!706))) (= (_1!10645 (h!29615 (t!41922 (t!41922 l!706)))) key1!31)))))

(declare-fun bm!62440 () Bool)

(declare-fun call!62445 () List!28410)

(declare-fun call!62443 () List!28410)

(assert (=> bm!62440 (= call!62445 call!62443)))

(declare-fun e!721178 () List!28410)

(declare-fun b!1266225 () Bool)

(assert (=> b!1266225 (= e!721178 (insertStrictlySorted!468 (t!41922 (t!41922 (t!41922 l!706))) key1!31 v1!26))))

(declare-fun b!1266226 () Bool)

(declare-fun res!843024 () Bool)

(declare-fun e!721174 () Bool)

(assert (=> b!1266226 (=> (not res!843024) (not e!721174))))

(declare-fun lt!573945 () List!28410)

(assert (=> b!1266226 (= res!843024 (containsKey!658 lt!573945 key1!31))))

(declare-fun b!1266227 () Bool)

(declare-fun e!721175 () List!28410)

(assert (=> b!1266227 (= e!721175 call!62445)))

(declare-fun call!62444 () List!28410)

(declare-fun bm!62442 () Bool)

(declare-fun c!123405 () Bool)

(assert (=> bm!62442 (= call!62444 ($colon$colon!643 e!721178 (ite c!123405 (h!29615 (t!41922 (t!41922 l!706))) (tuple2!21269 key1!31 v1!26))))))

(declare-fun c!123403 () Bool)

(assert (=> bm!62442 (= c!123403 c!123405)))

(declare-fun b!1266228 () Bool)

(assert (=> b!1266228 (= e!721174 (contains!7610 lt!573945 (tuple2!21269 key1!31 v1!26)))))

(declare-fun b!1266229 () Bool)

(assert (=> b!1266229 (= e!721177 call!62443)))

(declare-fun b!1266230 () Bool)

(declare-fun c!123406 () Bool)

(assert (=> b!1266230 (= c!123406 (and (is-Cons!28406 (t!41922 (t!41922 l!706))) (bvsgt (_1!10645 (h!29615 (t!41922 (t!41922 l!706)))) key1!31)))))

(assert (=> b!1266230 (= e!721177 e!721175)))

(declare-fun b!1266231 () Bool)

(assert (=> b!1266231 (= e!721175 call!62445)))

(declare-fun b!1266232 () Bool)

(assert (=> b!1266232 (= e!721176 call!62444)))

(declare-fun b!1266233 () Bool)

(assert (=> b!1266233 (= e!721178 (ite c!123404 (t!41922 (t!41922 (t!41922 l!706))) (ite c!123406 (Cons!28406 (h!29615 (t!41922 (t!41922 l!706))) (t!41922 (t!41922 (t!41922 l!706)))) Nil!28407)))))

(declare-fun d!139003 () Bool)

(assert (=> d!139003 e!721174))

(declare-fun res!843025 () Bool)

(assert (=> d!139003 (=> (not res!843025) (not e!721174))))

(assert (=> d!139003 (= res!843025 (isStrictlySorted!797 lt!573945))))

(assert (=> d!139003 (= lt!573945 e!721176)))

(assert (=> d!139003 (= c!123405 (and (is-Cons!28406 (t!41922 (t!41922 l!706))) (bvslt (_1!10645 (h!29615 (t!41922 (t!41922 l!706)))) key1!31)))))

(assert (=> d!139003 (isStrictlySorted!797 (t!41922 (t!41922 l!706)))))

(assert (=> d!139003 (= (insertStrictlySorted!468 (t!41922 (t!41922 l!706)) key1!31 v1!26) lt!573945)))

(declare-fun bm!62441 () Bool)

(assert (=> bm!62441 (= call!62443 call!62444)))

(assert (= (and d!139003 c!123405) b!1266232))

(assert (= (and d!139003 (not c!123405)) b!1266224))

(assert (= (and b!1266224 c!123404) b!1266229))

(assert (= (and b!1266224 (not c!123404)) b!1266230))

(assert (= (and b!1266230 c!123406) b!1266227))

(assert (= (and b!1266230 (not c!123406)) b!1266231))

(assert (= (or b!1266227 b!1266231) bm!62440))

(assert (= (or b!1266229 bm!62440) bm!62441))

(assert (= (or b!1266232 bm!62441) bm!62442))

(assert (= (and bm!62442 c!123403) b!1266225))

(assert (= (and bm!62442 (not c!123403)) b!1266233))

(assert (= (and d!139003 res!843025) b!1266226))

(assert (= (and b!1266226 res!843024) b!1266228))

(declare-fun m!1165539 () Bool)

(assert (=> d!139003 m!1165539))

(assert (=> d!139003 m!1165337))

(declare-fun m!1165541 () Bool)

(assert (=> b!1266226 m!1165541))

(declare-fun m!1165543 () Bool)

(assert (=> b!1266228 m!1165543))

(declare-fun m!1165545 () Bool)

(assert (=> bm!62442 m!1165545))

(declare-fun m!1165547 () Bool)

(assert (=> b!1266225 m!1165547))

(assert (=> b!1266127 d!139003))

(assert (=> b!1265933 d!138901))

(declare-fun d!139005 () Bool)

(declare-fun res!843026 () Bool)

(declare-fun e!721179 () Bool)

(assert (=> d!139005 (=> res!843026 e!721179)))

(assert (=> d!139005 (= res!843026 (and (is-Cons!28406 lt!573918) (= (_1!10645 (h!29615 lt!573918)) key1!31)))))

(assert (=> d!139005 (= (containsKey!658 lt!573918 key1!31) e!721179)))

(declare-fun b!1266234 () Bool)

(declare-fun e!721180 () Bool)

(assert (=> b!1266234 (= e!721179 e!721180)))

(declare-fun res!843027 () Bool)

(assert (=> b!1266234 (=> (not res!843027) (not e!721180))))

(assert (=> b!1266234 (= res!843027 (and (or (not (is-Cons!28406 lt!573918)) (bvsle (_1!10645 (h!29615 lt!573918)) key1!31)) (is-Cons!28406 lt!573918) (bvslt (_1!10645 (h!29615 lt!573918)) key1!31)))))

(declare-fun b!1266235 () Bool)

(assert (=> b!1266235 (= e!721180 (containsKey!658 (t!41922 lt!573918) key1!31))))

(assert (= (and d!139005 (not res!843026)) b!1266234))

(assert (= (and b!1266234 res!843027) b!1266235))

(declare-fun m!1165549 () Bool)

(assert (=> b!1266235 m!1165549))

(assert (=> b!1266083 d!139005))

(assert (=> d!138939 d!138919))

(assert (=> d!138939 d!138947))

(declare-fun d!139007 () Bool)

(assert (=> d!139007 (= (removeStrictlySorted!157 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26) key1!31) (t!41922 l!706))))

(assert (=> d!139007 true))

(declare-fun _$4!64 () Unit!42037)

(assert (=> d!139007 (= (choose!1896 (t!41922 l!706) key1!31 v1!26) _$4!64)))

(declare-fun bs!35810 () Bool)

(assert (= bs!35810 d!139007))

(assert (=> bs!35810 m!1165321))

(assert (=> bs!35810 m!1165321))

(assert (=> bs!35810 m!1165325))

(assert (=> d!138939 d!139007))

(assert (=> d!138939 d!138901))

(declare-fun d!139009 () Bool)

(declare-fun res!843028 () Bool)

(declare-fun e!721181 () Bool)

(assert (=> d!139009 (=> res!843028 e!721181)))

(assert (=> d!139009 (= res!843028 (or (is-Nil!28407 (t!41922 (t!41922 l!706))) (is-Nil!28407 (t!41922 (t!41922 (t!41922 l!706))))))))

(assert (=> d!139009 (= (isStrictlySorted!797 (t!41922 (t!41922 l!706))) e!721181)))

(declare-fun b!1266236 () Bool)

(declare-fun e!721182 () Bool)

(assert (=> b!1266236 (= e!721181 e!721182)))

(declare-fun res!843029 () Bool)

(assert (=> b!1266236 (=> (not res!843029) (not e!721182))))

(assert (=> b!1266236 (= res!843029 (bvslt (_1!10645 (h!29615 (t!41922 (t!41922 l!706)))) (_1!10645 (h!29615 (t!41922 (t!41922 (t!41922 l!706)))))))))

(declare-fun b!1266237 () Bool)

(assert (=> b!1266237 (= e!721182 (isStrictlySorted!797 (t!41922 (t!41922 (t!41922 l!706)))))))

(assert (= (and d!139009 (not res!843028)) b!1266236))

(assert (= (and b!1266236 res!843029) b!1266237))

(declare-fun m!1165551 () Bool)

(assert (=> b!1266237 m!1165551))

(assert (=> b!1265929 d!139009))

(declare-fun d!139011 () Bool)

(declare-fun res!843030 () Bool)

(declare-fun e!721183 () Bool)

(assert (=> d!139011 (=> res!843030 e!721183)))

(assert (=> d!139011 (= res!843030 (or (is-Nil!28407 lt!573909) (is-Nil!28407 (t!41922 lt!573909))))))

(assert (=> d!139011 (= (isStrictlySorted!797 lt!573909) e!721183)))

(declare-fun b!1266238 () Bool)

(declare-fun e!721184 () Bool)

(assert (=> b!1266238 (= e!721183 e!721184)))

(declare-fun res!843031 () Bool)

(assert (=> b!1266238 (=> (not res!843031) (not e!721184))))

(assert (=> b!1266238 (= res!843031 (bvslt (_1!10645 (h!29615 lt!573909)) (_1!10645 (h!29615 (t!41922 lt!573909)))))))

(declare-fun b!1266239 () Bool)

(assert (=> b!1266239 (= e!721184 (isStrictlySorted!797 (t!41922 lt!573909)))))

(assert (= (and d!139011 (not res!843030)) b!1266238))

(assert (= (and b!1266238 res!843031) b!1266239))

(declare-fun m!1165553 () Bool)

(assert (=> b!1266239 m!1165553))

(assert (=> d!138919 d!139011))

(declare-fun d!139013 () Bool)

(declare-fun res!843032 () Bool)

(declare-fun e!721185 () Bool)

(assert (=> d!139013 (=> res!843032 e!721185)))

(assert (=> d!139013 (= res!843032 (or (is-Nil!28407 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26)) (is-Nil!28407 (t!41922 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26)))))))

(assert (=> d!139013 (= (isStrictlySorted!797 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26)) e!721185)))

(declare-fun b!1266240 () Bool)

(declare-fun e!721186 () Bool)

(assert (=> b!1266240 (= e!721185 e!721186)))

(declare-fun res!843033 () Bool)

(assert (=> b!1266240 (=> (not res!843033) (not e!721186))))

(assert (=> b!1266240 (= res!843033 (bvslt (_1!10645 (h!29615 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26))) (_1!10645 (h!29615 (t!41922 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26))))))))

(declare-fun b!1266241 () Bool)

(assert (=> b!1266241 (= e!721186 (isStrictlySorted!797 (t!41922 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26))))))

(assert (= (and d!139013 (not res!843032)) b!1266240))

(assert (= (and b!1266240 res!843033) b!1266241))

(declare-fun m!1165555 () Bool)

(assert (=> b!1266241 m!1165555))

(assert (=> d!138919 d!139013))

(declare-fun d!139015 () Bool)

(declare-fun res!843034 () Bool)

(declare-fun e!721187 () Bool)

(assert (=> d!139015 (=> res!843034 e!721187)))

(assert (=> d!139015 (= res!843034 (or (is-Nil!28407 lt!573918) (is-Nil!28407 (t!41922 lt!573918))))))

(assert (=> d!139015 (= (isStrictlySorted!797 lt!573918) e!721187)))

(declare-fun b!1266242 () Bool)

(declare-fun e!721188 () Bool)

(assert (=> b!1266242 (= e!721187 e!721188)))

(declare-fun res!843035 () Bool)

(assert (=> b!1266242 (=> (not res!843035) (not e!721188))))

(assert (=> b!1266242 (= res!843035 (bvslt (_1!10645 (h!29615 lt!573918)) (_1!10645 (h!29615 (t!41922 lt!573918)))))))

(declare-fun b!1266243 () Bool)

(assert (=> b!1266243 (= e!721188 (isStrictlySorted!797 (t!41922 lt!573918)))))

(assert (= (and d!139015 (not res!843034)) b!1266242))

(assert (= (and b!1266242 res!843035) b!1266243))

(declare-fun m!1165557 () Bool)

(assert (=> b!1266243 m!1165557))

(assert (=> d!138929 d!139015))

(assert (=> d!138929 d!138905))

(declare-fun d!139017 () Bool)

(declare-fun res!843036 () Bool)

(declare-fun e!721189 () Bool)

(assert (=> d!139017 (=> res!843036 e!721189)))

(assert (=> d!139017 (= res!843036 (or (is-Nil!28407 lt!573932) (is-Nil!28407 (t!41922 lt!573932))))))

(assert (=> d!139017 (= (isStrictlySorted!797 lt!573932) e!721189)))

(declare-fun b!1266244 () Bool)

(declare-fun e!721190 () Bool)

(assert (=> b!1266244 (= e!721189 e!721190)))

(declare-fun res!843037 () Bool)

(assert (=> b!1266244 (=> (not res!843037) (not e!721190))))

(assert (=> b!1266244 (= res!843037 (bvslt (_1!10645 (h!29615 lt!573932)) (_1!10645 (h!29615 (t!41922 lt!573932)))))))

(declare-fun b!1266245 () Bool)

(assert (=> b!1266245 (= e!721190 (isStrictlySorted!797 (t!41922 lt!573932)))))

(assert (= (and d!139017 (not res!843036)) b!1266244))

(assert (= (and b!1266244 res!843037) b!1266245))

(declare-fun m!1165559 () Bool)

(assert (=> b!1266245 m!1165559))

(assert (=> d!138947 d!139017))

(assert (=> d!138947 d!138901))

(declare-fun d!139019 () Bool)

(declare-fun res!843038 () Bool)

(declare-fun e!721191 () Bool)

(assert (=> d!139019 (=> res!843038 e!721191)))

(assert (=> d!139019 (= res!843038 (and (is-Cons!28406 (t!41922 (t!41922 l!706))) (= (_1!10645 (h!29615 (t!41922 (t!41922 l!706)))) key1!31)))))

(assert (=> d!139019 (= (containsKey!658 (t!41922 (t!41922 l!706)) key1!31) e!721191)))

(declare-fun b!1266246 () Bool)

(declare-fun e!721192 () Bool)

(assert (=> b!1266246 (= e!721191 e!721192)))

(declare-fun res!843039 () Bool)

(assert (=> b!1266246 (=> (not res!843039) (not e!721192))))

(assert (=> b!1266246 (= res!843039 (and (or (not (is-Cons!28406 (t!41922 (t!41922 l!706)))) (bvsle (_1!10645 (h!29615 (t!41922 (t!41922 l!706)))) key1!31)) (is-Cons!28406 (t!41922 (t!41922 l!706))) (bvslt (_1!10645 (h!29615 (t!41922 (t!41922 l!706)))) key1!31)))))

(declare-fun b!1266247 () Bool)

(assert (=> b!1266247 (= e!721192 (containsKey!658 (t!41922 (t!41922 (t!41922 l!706))) key1!31))))

(assert (= (and d!139019 (not res!843038)) b!1266246))

(assert (= (and b!1266246 res!843039) b!1266247))

(declare-fun m!1165561 () Bool)

(assert (=> b!1266247 m!1165561))

(assert (=> b!1265959 d!139019))

(declare-fun d!139021 () Bool)

(assert (=> d!139021 (= ($colon$colon!643 e!721105 (ite c!123389 (h!29615 (t!41922 l!706)) (tuple2!21269 key1!31 v1!26))) (Cons!28406 (ite c!123389 (h!29615 (t!41922 l!706)) (tuple2!21269 key1!31 v1!26)) e!721105))))

(assert (=> bm!62433 d!139021))

(declare-fun d!139023 () Bool)

(assert (=> d!139023 (= ($colon$colon!643 (removeStrictlySorted!157 (t!41922 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26)) key1!31) (h!29615 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26))) (Cons!28406 (h!29615 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26)) (removeStrictlySorted!157 (t!41922 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26)) key1!31)))))

(assert (=> b!1266004 d!139023))

(declare-fun d!139025 () Bool)

(declare-fun e!721193 () Bool)

(assert (=> d!139025 e!721193))

(declare-fun res!843040 () Bool)

(assert (=> d!139025 (=> (not res!843040) (not e!721193))))

(declare-fun lt!573946 () List!28410)

(assert (=> d!139025 (= res!843040 (isStrictlySorted!797 lt!573946))))

(declare-fun e!721194 () List!28410)

(assert (=> d!139025 (= lt!573946 e!721194)))

(declare-fun c!123407 () Bool)

(assert (=> d!139025 (= c!123407 (and (is-Cons!28406 (t!41922 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26))) (= (_1!10645 (h!29615 (t!41922 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26)))) key1!31)))))

(assert (=> d!139025 (isStrictlySorted!797 (t!41922 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26)))))

(assert (=> d!139025 (= (removeStrictlySorted!157 (t!41922 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26)) key1!31) lt!573946)))

(declare-fun b!1266248 () Bool)

(assert (=> b!1266248 (= e!721193 (not (containsKey!658 lt!573946 key1!31)))))

(declare-fun b!1266249 () Bool)

(assert (=> b!1266249 (= e!721194 (t!41922 (t!41922 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26))))))

(declare-fun b!1266250 () Bool)

(declare-fun e!721195 () List!28410)

(assert (=> b!1266250 (= e!721195 Nil!28407)))

(declare-fun b!1266251 () Bool)

(assert (=> b!1266251 (= e!721195 ($colon$colon!643 (removeStrictlySorted!157 (t!41922 (t!41922 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26))) key1!31) (h!29615 (t!41922 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26)))))))

(declare-fun b!1266252 () Bool)

(assert (=> b!1266252 (= e!721194 e!721195)))

(declare-fun c!123408 () Bool)

(assert (=> b!1266252 (= c!123408 (and (is-Cons!28406 (t!41922 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26))) (not (= (_1!10645 (h!29615 (t!41922 (insertStrictlySorted!468 (t!41922 l!706) key1!31 v1!26)))) key1!31))))))

(assert (= (and d!139025 c!123407) b!1266249))

(assert (= (and d!139025 (not c!123407)) b!1266252))

(assert (= (and b!1266252 c!123408) b!1266251))

(assert (= (and b!1266252 (not c!123408)) b!1266250))

(assert (= (and d!139025 res!843040) b!1266248))

(declare-fun m!1165563 () Bool)

(assert (=> d!139025 m!1165563))

(assert (=> d!139025 m!1165555))

(declare-fun m!1165565 () Bool)

(assert (=> b!1266248 m!1165565))

(declare-fun m!1165567 () Bool)

(assert (=> b!1266251 m!1165567))

(assert (=> b!1266251 m!1165567))

(declare-fun m!1165569 () Bool)

(assert (=> b!1266251 m!1165569))

(assert (=> b!1266004 d!139025))

(assert (=> b!1266082 d!138947))

(declare-fun d!139027 () Bool)

(declare-fun lt!573947 () Bool)

(assert (=> d!139027 (= lt!573947 (set.member (tuple2!21269 key1!31 v1!26) (content!633 lt!573932)))))

(declare-fun e!721196 () Bool)

(assert (=> d!139027 (= lt!573947 e!721196)))

(declare-fun res!843042 () Bool)

(assert (=> d!139027 (=> (not res!843042) (not e!721196))))

(assert (=> d!139027 (= res!843042 (is-Cons!28406 lt!573932))))

(assert (=> d!139027 (= (contains!7610 lt!573932 (tuple2!21269 key1!31 v1!26)) lt!573947)))

(declare-fun b!1266253 () Bool)

(declare-fun e!721197 () Bool)

(assert (=> b!1266253 (= e!721196 e!721197)))

(declare-fun res!843041 () Bool)

(assert (=> b!1266253 (=> res!843041 e!721197)))

(assert (=> b!1266253 (= res!843041 (= (h!29615 lt!573932) (tuple2!21269 key1!31 v1!26)))))

(declare-fun b!1266254 () Bool)

(assert (=> b!1266254 (= e!721197 (contains!7610 (t!41922 lt!573932) (tuple2!21269 key1!31 v1!26)))))

(assert (= (and d!139027 res!843042) b!1266253))

(assert (= (and b!1266253 (not res!843041)) b!1266254))

(declare-fun m!1165571 () Bool)

(assert (=> d!139027 m!1165571))

(declare-fun m!1165573 () Bool)

(assert (=> d!139027 m!1165573))

(declare-fun m!1165575 () Bool)

(assert (=> b!1266254 m!1165575))

(assert (=> b!1266130 d!139027))

(declare-fun d!139029 () Bool)

(declare-fun res!843043 () Bool)

(declare-fun e!721198 () Bool)

(assert (=> d!139029 (=> res!843043 e!721198)))

(assert (=> d!139029 (= res!843043 (or (is-Nil!28407 lt!573921) (is-Nil!28407 (t!41922 lt!573921))))))

(assert (=> d!139029 (= (isStrictlySorted!797 lt!573921) e!721198)))

(declare-fun b!1266255 () Bool)

(declare-fun e!721199 () Bool)

(assert (=> b!1266255 (= e!721198 e!721199)))

(declare-fun res!843044 () Bool)

(assert (=> b!1266255 (=> (not res!843044) (not e!721199))))

(assert (=> b!1266255 (= res!843044 (bvslt (_1!10645 (h!29615 lt!573921)) (_1!10645 (h!29615 (t!41922 lt!573921)))))))

(declare-fun b!1266256 () Bool)

(assert (=> b!1266256 (= e!721199 (isStrictlySorted!797 (t!41922 lt!573921)))))

(assert (= (and d!139029 (not res!843043)) b!1266255))

(assert (= (and b!1266255 res!843044) b!1266256))

(declare-fun m!1165577 () Bool)

(assert (=> b!1266256 m!1165577))

(assert (=> d!138935 d!139029))

(declare-fun d!139031 () Bool)

(declare-fun res!843045 () Bool)

(declare-fun e!721200 () Bool)

(assert (=> d!139031 (=> res!843045 e!721200)))

(assert (=> d!139031 (= res!843045 (or (is-Nil!28407 (insertStrictlySorted!468 l!706 key1!31 v1!26)) (is-Nil!28407 (t!41922 (insertStrictlySorted!468 l!706 key1!31 v1!26)))))))

(assert (=> d!139031 (= (isStrictlySorted!797 (insertStrictlySorted!468 l!706 key1!31 v1!26)) e!721200)))

(declare-fun b!1266257 () Bool)

(declare-fun e!721201 () Bool)

(assert (=> b!1266257 (= e!721200 e!721201)))

(declare-fun res!843046 () Bool)

(assert (=> b!1266257 (=> (not res!843046) (not e!721201))))

(assert (=> b!1266257 (= res!843046 (bvslt (_1!10645 (h!29615 (insertStrictlySorted!468 l!706 key1!31 v1!26))) (_1!10645 (h!29615 (t!41922 (insertStrictlySorted!468 l!706 key1!31 v1!26))))))))

(declare-fun b!1266258 () Bool)

(assert (=> b!1266258 (= e!721201 (isStrictlySorted!797 (t!41922 (insertStrictlySorted!468 l!706 key1!31 v1!26))))))

(assert (= (and d!139031 (not res!843045)) b!1266257))

(assert (= (and b!1266257 res!843046) b!1266258))

(declare-fun m!1165579 () Bool)

(assert (=> b!1266258 m!1165579))

(assert (=> d!138935 d!139031))

(assert (=> b!1265955 d!138917))

(declare-fun d!139033 () Bool)

(assert (=> d!139033 (= ($colon$colon!643 (removeStrictlySorted!157 (t!41922 (insertStrictlySorted!468 l!706 key1!31 v1!26)) key1!31) (h!29615 (insertStrictlySorted!468 l!706 key1!31 v1!26))) (Cons!28406 (h!29615 (insertStrictlySorted!468 l!706 key1!31 v1!26)) (removeStrictlySorted!157 (t!41922 (insertStrictlySorted!468 l!706 key1!31 v1!26)) key1!31)))))

(assert (=> b!1266109 d!139033))

(declare-fun d!139035 () Bool)

(declare-fun e!721202 () Bool)

(assert (=> d!139035 e!721202))

(declare-fun res!843047 () Bool)

(assert (=> d!139035 (=> (not res!843047) (not e!721202))))

(declare-fun lt!573948 () List!28410)

(assert (=> d!139035 (= res!843047 (isStrictlySorted!797 lt!573948))))

(declare-fun e!721203 () List!28410)

(assert (=> d!139035 (= lt!573948 e!721203)))

(declare-fun c!123409 () Bool)

(assert (=> d!139035 (= c!123409 (and (is-Cons!28406 (t!41922 (insertStrictlySorted!468 l!706 key1!31 v1!26))) (= (_1!10645 (h!29615 (t!41922 (insertStrictlySorted!468 l!706 key1!31 v1!26)))) key1!31)))))

(assert (=> d!139035 (isStrictlySorted!797 (t!41922 (insertStrictlySorted!468 l!706 key1!31 v1!26)))))

(assert (=> d!139035 (= (removeStrictlySorted!157 (t!41922 (insertStrictlySorted!468 l!706 key1!31 v1!26)) key1!31) lt!573948)))

(declare-fun b!1266259 () Bool)

(assert (=> b!1266259 (= e!721202 (not (containsKey!658 lt!573948 key1!31)))))

(declare-fun b!1266260 () Bool)

(assert (=> b!1266260 (= e!721203 (t!41922 (t!41922 (insertStrictlySorted!468 l!706 key1!31 v1!26))))))

(declare-fun b!1266261 () Bool)

(declare-fun e!721204 () List!28410)

(assert (=> b!1266261 (= e!721204 Nil!28407)))

(declare-fun b!1266262 () Bool)

(assert (=> b!1266262 (= e!721204 ($colon$colon!643 (removeStrictlySorted!157 (t!41922 (t!41922 (insertStrictlySorted!468 l!706 key1!31 v1!26))) key1!31) (h!29615 (t!41922 (insertStrictlySorted!468 l!706 key1!31 v1!26)))))))

(declare-fun b!1266263 () Bool)

(assert (=> b!1266263 (= e!721203 e!721204)))

(declare-fun c!123410 () Bool)

(assert (=> b!1266263 (= c!123410 (and (is-Cons!28406 (t!41922 (insertStrictlySorted!468 l!706 key1!31 v1!26))) (not (= (_1!10645 (h!29615 (t!41922 (insertStrictlySorted!468 l!706 key1!31 v1!26)))) key1!31))))))

(assert (= (and d!139035 c!123409) b!1266260))

(assert (= (and d!139035 (not c!123409)) b!1266263))

(assert (= (and b!1266263 c!123410) b!1266262))

(assert (= (and b!1266263 (not c!123410)) b!1266261))

(assert (= (and d!139035 res!843047) b!1266259))

(declare-fun m!1165581 () Bool)

(assert (=> d!139035 m!1165581))

(assert (=> d!139035 m!1165579))

(declare-fun m!1165583 () Bool)

(assert (=> b!1266259 m!1165583))

(declare-fun m!1165585 () Bool)

(assert (=> b!1266262 m!1165585))

(assert (=> b!1266262 m!1165585))

(declare-fun m!1165587 () Bool)

(assert (=> b!1266262 m!1165587))

(assert (=> b!1266109 d!139035))

(declare-fun d!139037 () Bool)

(declare-fun res!843048 () Bool)

(declare-fun e!721205 () Bool)

(assert (=> d!139037 (=> res!843048 e!721205)))

(assert (=> d!139037 (= res!843048 (and (is-Cons!28406 lt!573932) (= (_1!10645 (h!29615 lt!573932)) key1!31)))))

(assert (=> d!139037 (= (containsKey!658 lt!573932 key1!31) e!721205)))

(declare-fun b!1266264 () Bool)

(declare-fun e!721206 () Bool)

(assert (=> b!1266264 (= e!721205 e!721206)))

(declare-fun res!843049 () Bool)

(assert (=> b!1266264 (=> (not res!843049) (not e!721206))))

(assert (=> b!1266264 (= res!843049 (and (or (not (is-Cons!28406 lt!573932)) (bvsle (_1!10645 (h!29615 lt!573932)) key1!31)) (is-Cons!28406 lt!573932) (bvslt (_1!10645 (h!29615 lt!573932)) key1!31)))))

(declare-fun b!1266265 () Bool)

(assert (=> b!1266265 (= e!721206 (containsKey!658 (t!41922 lt!573932) key1!31))))

(assert (= (and d!139037 (not res!843048)) b!1266264))

(assert (= (and b!1266264 res!843049) b!1266265))

(declare-fun m!1165589 () Bool)

(assert (=> b!1266265 m!1165589))

(assert (=> b!1266128 d!139037))

(declare-fun d!139039 () Bool)

(declare-fun res!843050 () Bool)

(declare-fun e!721207 () Bool)

(assert (=> d!139039 (=> res!843050 e!721207)))

(assert (=> d!139039 (= res!843050 (and (is-Cons!28406 lt!573909) (= (_1!10645 (h!29615 lt!573909)) key1!31)))))

(assert (=> d!139039 (= (containsKey!658 lt!573909 key1!31) e!721207)))

(declare-fun b!1266266 () Bool)

(declare-fun e!721208 () Bool)

(assert (=> b!1266266 (= e!721207 e!721208)))

(declare-fun res!843051 () Bool)

(assert (=> b!1266266 (=> (not res!843051) (not e!721208))))

(assert (=> b!1266266 (= res!843051 (and (or (not (is-Cons!28406 lt!573909)) (bvsle (_1!10645 (h!29615 lt!573909)) key1!31)) (is-Cons!28406 lt!573909) (bvslt (_1!10645 (h!29615 lt!573909)) key1!31)))))

(declare-fun b!1266267 () Bool)

(assert (=> b!1266267 (= e!721208 (containsKey!658 (t!41922 lt!573909) key1!31))))

(assert (= (and d!139039 (not res!843050)) b!1266266))

(assert (= (and b!1266266 res!843051) b!1266267))

(declare-fun m!1165591 () Bool)

(assert (=> b!1266267 m!1165591))

(assert (=> b!1266001 d!139039))

(declare-fun b!1266268 () Bool)

(declare-fun e!721209 () Bool)

(declare-fun tp!96427 () Bool)

(assert (=> b!1266268 (= e!721209 (and tp_is_empty!32531 tp!96427))))

(assert (=> b!1266156 (= tp!96421 e!721209)))

(assert (= (and b!1266156 (is-Cons!28406 (t!41922 (t!41922 l!706)))) b!1266268))

(push 1)

(assert (not b!1266228))

(assert (not b!1266223))

(assert (not b!1266265))

(assert (not b!1266251))

(assert (not b!1266235))

(assert (not d!139007))

(assert (not b!1266258))

(assert (not b!1266268))

(assert tp_is_empty!32531)

(assert (not d!139001))

(assert (not b!1266262))

(assert (not b!1266237))

(assert (not b!1266225))

(assert (not b!1266248))

(assert (not b!1266247))

(assert (not bm!62442))

(assert (not b!1266226))

(assert (not b!1266267))

(assert (not d!139035))

(assert (not b!1266254))

(assert (not b!1266241))

(assert (not b!1266243))

(assert (not b!1266259))

(assert (not b!1266217))

(assert (not d!139003))

(assert (not d!139027))

(assert (not d!139025))

(assert (not b!1266239))

(assert (not b!1266245))

(assert (not b!1266256))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

