; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132562 () Bool)

(assert start!132562)

(declare-fun b!1554199 () Bool)

(declare-fun e!865407 () Bool)

(declare-fun tp!112185 () Bool)

(assert (=> b!1554199 (= e!865407 tp!112185)))

(declare-fun b!1554200 () Bool)

(declare-fun e!865408 () Bool)

(declare-datatypes ((B!2242 0))(
  ( (B!2243 (val!19207 Int)) )
))
(declare-datatypes ((tuple2!24790 0))(
  ( (tuple2!24791 (_1!12406 (_ BitVec 64)) (_2!12406 B!2242)) )
))
(declare-datatypes ((List!36241 0))(
  ( (Nil!36238) (Cons!36237 (h!37683 tuple2!24790) (t!50962 List!36241)) )
))
(declare-datatypes ((ListLongMap!22399 0))(
  ( (ListLongMap!22400 (toList!11215 List!36241)) )
))
(declare-fun lm!249 () ListLongMap!22399)

(declare-fun isStrictlySorted!903 (List!36241) Bool)

(assert (=> b!1554200 (= e!865408 (not (isStrictlySorted!903 (toList!11215 lm!249))))))

(declare-fun e!865409 () Bool)

(assert (=> b!1554200 e!865409))

(declare-fun res!1063692 () Bool)

(assert (=> b!1554200 (=> (not res!1063692) (not e!865409))))

(declare-fun lt!669962 () List!36241)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun containsKey!774 (List!36241 (_ BitVec 64)) Bool)

(assert (=> b!1554200 (= res!1063692 (containsKey!774 lt!669962 a0!49))))

(declare-fun a!523 () (_ BitVec 64))

(declare-fun b!96 () B!2242)

(declare-fun insertStrictlySorted!514 (List!36241 (_ BitVec 64) B!2242) List!36241)

(assert (=> b!1554200 (= lt!669962 (insertStrictlySorted!514 (toList!11215 lm!249) a!523 b!96))))

(declare-datatypes ((Unit!51787 0))(
  ( (Unit!51788) )
))
(declare-fun lt!669961 () Unit!51787)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!11 (List!36241 (_ BitVec 64) B!2242 (_ BitVec 64)) Unit!51787)

(assert (=> b!1554200 (= lt!669961 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!11 (toList!11215 lm!249) a!523 b!96 a0!49))))

(declare-fun b!1554201 () Bool)

(declare-datatypes ((Option!828 0))(
  ( (Some!827 (v!22012 B!2242)) (None!826) )
))
(declare-fun getValueByKey!752 (List!36241 (_ BitVec 64)) Option!828)

(assert (=> b!1554201 (= e!865409 (= (getValueByKey!752 lt!669962 a0!49) (getValueByKey!752 (toList!11215 lm!249) a0!49)))))

(declare-fun b!1554202 () Bool)

(declare-fun res!1063693 () Bool)

(assert (=> b!1554202 (=> (not res!1063693) (not e!865408))))

(assert (=> b!1554202 (= res!1063693 (not (= a0!49 a!523)))))

(declare-fun b!1554203 () Bool)

(declare-fun res!1063690 () Bool)

(assert (=> b!1554203 (=> (not res!1063690) (not e!865408))))

(assert (=> b!1554203 (= res!1063690 (containsKey!774 (toList!11215 lm!249) a0!49))))

(declare-fun res!1063691 () Bool)

(assert (=> start!132562 (=> (not res!1063691) (not e!865408))))

(declare-fun contains!10160 (ListLongMap!22399 (_ BitVec 64)) Bool)

(assert (=> start!132562 (= res!1063691 (contains!10160 lm!249 a0!49))))

(assert (=> start!132562 e!865408))

(declare-fun inv!57344 (ListLongMap!22399) Bool)

(assert (=> start!132562 (and (inv!57344 lm!249) e!865407)))

(assert (=> start!132562 true))

(declare-fun tp_is_empty!38253 () Bool)

(assert (=> start!132562 tp_is_empty!38253))

(assert (= (and start!132562 res!1063691) b!1554202))

(assert (= (and b!1554202 res!1063693) b!1554203))

(assert (= (and b!1554203 res!1063690) b!1554200))

(assert (= (and b!1554200 res!1063692) b!1554201))

(assert (= start!132562 b!1554199))

(declare-fun m!1432647 () Bool)

(assert (=> b!1554200 m!1432647))

(declare-fun m!1432649 () Bool)

(assert (=> b!1554200 m!1432649))

(declare-fun m!1432651 () Bool)

(assert (=> b!1554200 m!1432651))

(declare-fun m!1432653 () Bool)

(assert (=> b!1554200 m!1432653))

(declare-fun m!1432655 () Bool)

(assert (=> b!1554201 m!1432655))

(declare-fun m!1432657 () Bool)

(assert (=> b!1554201 m!1432657))

(declare-fun m!1432659 () Bool)

(assert (=> b!1554203 m!1432659))

(declare-fun m!1432661 () Bool)

(assert (=> start!132562 m!1432661))

(declare-fun m!1432663 () Bool)

(assert (=> start!132562 m!1432663))

(check-sat (not start!132562) (not b!1554200) (not b!1554201) (not b!1554199) (not b!1554203) tp_is_empty!38253)
(check-sat)
(get-model)

(declare-fun d!161701 () Bool)

(declare-fun res!1063714 () Bool)

(declare-fun e!865427 () Bool)

(assert (=> d!161701 (=> res!1063714 e!865427)))

(get-info :version)

(assert (=> d!161701 (= res!1063714 (or ((_ is Nil!36238) (toList!11215 lm!249)) ((_ is Nil!36238) (t!50962 (toList!11215 lm!249)))))))

(assert (=> d!161701 (= (isStrictlySorted!903 (toList!11215 lm!249)) e!865427)))

(declare-fun b!1554227 () Bool)

(declare-fun e!865428 () Bool)

(assert (=> b!1554227 (= e!865427 e!865428)))

(declare-fun res!1063715 () Bool)

(assert (=> b!1554227 (=> (not res!1063715) (not e!865428))))

(assert (=> b!1554227 (= res!1063715 (bvslt (_1!12406 (h!37683 (toList!11215 lm!249))) (_1!12406 (h!37683 (t!50962 (toList!11215 lm!249))))))))

(declare-fun b!1554228 () Bool)

(assert (=> b!1554228 (= e!865428 (isStrictlySorted!903 (t!50962 (toList!11215 lm!249))))))

(assert (= (and d!161701 (not res!1063714)) b!1554227))

(assert (= (and b!1554227 res!1063715) b!1554228))

(declare-fun m!1432683 () Bool)

(assert (=> b!1554228 m!1432683))

(assert (=> b!1554200 d!161701))

(declare-fun d!161707 () Bool)

(declare-fun res!1063728 () Bool)

(declare-fun e!865443 () Bool)

(assert (=> d!161707 (=> res!1063728 e!865443)))

(assert (=> d!161707 (= res!1063728 (and ((_ is Cons!36237) lt!669962) (= (_1!12406 (h!37683 lt!669962)) a0!49)))))

(assert (=> d!161707 (= (containsKey!774 lt!669962 a0!49) e!865443)))

(declare-fun b!1554245 () Bool)

(declare-fun e!865444 () Bool)

(assert (=> b!1554245 (= e!865443 e!865444)))

(declare-fun res!1063729 () Bool)

(assert (=> b!1554245 (=> (not res!1063729) (not e!865444))))

(assert (=> b!1554245 (= res!1063729 (and (or (not ((_ is Cons!36237) lt!669962)) (bvsle (_1!12406 (h!37683 lt!669962)) a0!49)) ((_ is Cons!36237) lt!669962) (bvslt (_1!12406 (h!37683 lt!669962)) a0!49)))))

(declare-fun b!1554246 () Bool)

(assert (=> b!1554246 (= e!865444 (containsKey!774 (t!50962 lt!669962) a0!49))))

(assert (= (and d!161707 (not res!1063728)) b!1554245))

(assert (= (and b!1554245 res!1063729) b!1554246))

(declare-fun m!1432687 () Bool)

(assert (=> b!1554246 m!1432687))

(assert (=> b!1554200 d!161707))

(declare-fun b!1554304 () Bool)

(declare-fun e!865481 () List!36241)

(declare-fun call!71415 () List!36241)

(assert (=> b!1554304 (= e!865481 call!71415)))

(declare-fun b!1554305 () Bool)

(declare-fun c!143374 () Bool)

(assert (=> b!1554305 (= c!143374 (and ((_ is Cons!36237) (toList!11215 lm!249)) (bvsgt (_1!12406 (h!37683 (toList!11215 lm!249))) a!523)))))

(declare-fun e!865482 () List!36241)

(assert (=> b!1554305 (= e!865481 e!865482)))

(declare-fun lt!669985 () List!36241)

(declare-fun b!1554306 () Bool)

(declare-fun e!865483 () Bool)

(declare-fun contains!10162 (List!36241 tuple2!24790) Bool)

(assert (=> b!1554306 (= e!865483 (contains!10162 lt!669985 (tuple2!24791 a!523 b!96)))))

(declare-fun b!1554307 () Bool)

(declare-fun call!71414 () List!36241)

(assert (=> b!1554307 (= e!865482 call!71414)))

(declare-fun e!865484 () List!36241)

(declare-fun b!1554308 () Bool)

(assert (=> b!1554308 (= e!865484 (insertStrictlySorted!514 (t!50962 (toList!11215 lm!249)) a!523 b!96))))

(declare-fun b!1554309 () Bool)

(declare-fun e!865485 () List!36241)

(declare-fun call!71413 () List!36241)

(assert (=> b!1554309 (= e!865485 call!71413)))

(declare-fun b!1554310 () Bool)

(assert (=> b!1554310 (= e!865485 e!865481)))

(declare-fun c!143373 () Bool)

(assert (=> b!1554310 (= c!143373 (and ((_ is Cons!36237) (toList!11215 lm!249)) (= (_1!12406 (h!37683 (toList!11215 lm!249))) a!523)))))

(declare-fun b!1554311 () Bool)

(assert (=> b!1554311 (= e!865482 call!71414)))

(declare-fun bm!71410 () Bool)

(assert (=> bm!71410 (= call!71415 call!71413)))

(declare-fun bm!71411 () Bool)

(assert (=> bm!71411 (= call!71414 call!71415)))

(declare-fun c!143371 () Bool)

(declare-fun bm!71412 () Bool)

(declare-fun $colon$colon!948 (List!36241 tuple2!24790) List!36241)

(assert (=> bm!71412 (= call!71413 ($colon$colon!948 e!865484 (ite c!143371 (h!37683 (toList!11215 lm!249)) (tuple2!24791 a!523 b!96))))))

(declare-fun c!143372 () Bool)

(assert (=> bm!71412 (= c!143372 c!143371)))

(declare-fun b!1554312 () Bool)

(declare-fun res!1063753 () Bool)

(assert (=> b!1554312 (=> (not res!1063753) (not e!865483))))

(assert (=> b!1554312 (= res!1063753 (containsKey!774 lt!669985 a!523))))

(declare-fun b!1554313 () Bool)

(assert (=> b!1554313 (= e!865484 (ite c!143373 (t!50962 (toList!11215 lm!249)) (ite c!143374 (Cons!36237 (h!37683 (toList!11215 lm!249)) (t!50962 (toList!11215 lm!249))) Nil!36238)))))

(declare-fun d!161711 () Bool)

(assert (=> d!161711 e!865483))

(declare-fun res!1063754 () Bool)

(assert (=> d!161711 (=> (not res!1063754) (not e!865483))))

(assert (=> d!161711 (= res!1063754 (isStrictlySorted!903 lt!669985))))

(assert (=> d!161711 (= lt!669985 e!865485)))

(assert (=> d!161711 (= c!143371 (and ((_ is Cons!36237) (toList!11215 lm!249)) (bvslt (_1!12406 (h!37683 (toList!11215 lm!249))) a!523)))))

(assert (=> d!161711 (isStrictlySorted!903 (toList!11215 lm!249))))

(assert (=> d!161711 (= (insertStrictlySorted!514 (toList!11215 lm!249) a!523 b!96) lt!669985)))

(assert (= (and d!161711 c!143371) b!1554309))

(assert (= (and d!161711 (not c!143371)) b!1554310))

(assert (= (and b!1554310 c!143373) b!1554304))

(assert (= (and b!1554310 (not c!143373)) b!1554305))

(assert (= (and b!1554305 c!143374) b!1554311))

(assert (= (and b!1554305 (not c!143374)) b!1554307))

(assert (= (or b!1554311 b!1554307) bm!71411))

(assert (= (or b!1554304 bm!71411) bm!71410))

(assert (= (or b!1554309 bm!71410) bm!71412))

(assert (= (and bm!71412 c!143372) b!1554308))

(assert (= (and bm!71412 (not c!143372)) b!1554313))

(assert (= (and d!161711 res!1063754) b!1554312))

(assert (= (and b!1554312 res!1063753) b!1554306))

(declare-fun m!1432699 () Bool)

(assert (=> bm!71412 m!1432699))

(declare-fun m!1432701 () Bool)

(assert (=> d!161711 m!1432701))

(assert (=> d!161711 m!1432647))

(declare-fun m!1432705 () Bool)

(assert (=> b!1554308 m!1432705))

(declare-fun m!1432709 () Bool)

(assert (=> b!1554306 m!1432709))

(declare-fun m!1432713 () Bool)

(assert (=> b!1554312 m!1432713))

(assert (=> b!1554200 d!161711))

(declare-fun d!161723 () Bool)

(declare-fun e!865512 () Bool)

(assert (=> d!161723 e!865512))

(declare-fun res!1063772 () Bool)

(assert (=> d!161723 (=> (not res!1063772) (not e!865512))))

(assert (=> d!161723 (= res!1063772 (= (containsKey!774 (insertStrictlySorted!514 (toList!11215 lm!249) a!523 b!96) a0!49) (containsKey!774 (toList!11215 lm!249) a0!49)))))

(declare-fun lt!669994 () Unit!51787)

(declare-fun choose!2046 (List!36241 (_ BitVec 64) B!2242 (_ BitVec 64)) Unit!51787)

(assert (=> d!161723 (= lt!669994 (choose!2046 (toList!11215 lm!249) a!523 b!96 a0!49))))

(declare-fun e!865511 () Bool)

(assert (=> d!161723 e!865511))

(declare-fun res!1063771 () Bool)

(assert (=> d!161723 (=> (not res!1063771) (not e!865511))))

(assert (=> d!161723 (= res!1063771 (isStrictlySorted!903 (toList!11215 lm!249)))))

(assert (=> d!161723 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!11 (toList!11215 lm!249) a!523 b!96 a0!49) lt!669994)))

(declare-fun b!1554354 () Bool)

(assert (=> b!1554354 (= e!865511 (not (= a!523 a0!49)))))

(declare-fun b!1554355 () Bool)

(assert (=> b!1554355 (= e!865512 (= (getValueByKey!752 (insertStrictlySorted!514 (toList!11215 lm!249) a!523 b!96) a0!49) (getValueByKey!752 (toList!11215 lm!249) a0!49)))))

(assert (= (and d!161723 res!1063771) b!1554354))

(assert (= (and d!161723 res!1063772) b!1554355))

(assert (=> d!161723 m!1432651))

(assert (=> d!161723 m!1432647))

(assert (=> d!161723 m!1432651))

(declare-fun m!1432721 () Bool)

(assert (=> d!161723 m!1432721))

(assert (=> d!161723 m!1432659))

(declare-fun m!1432725 () Bool)

(assert (=> d!161723 m!1432725))

(assert (=> b!1554355 m!1432651))

(assert (=> b!1554355 m!1432651))

(declare-fun m!1432729 () Bool)

(assert (=> b!1554355 m!1432729))

(assert (=> b!1554355 m!1432657))

(assert (=> b!1554200 d!161723))

(declare-fun d!161727 () Bool)

(declare-fun res!1063773 () Bool)

(declare-fun e!865513 () Bool)

(assert (=> d!161727 (=> res!1063773 e!865513)))

(assert (=> d!161727 (= res!1063773 (and ((_ is Cons!36237) (toList!11215 lm!249)) (= (_1!12406 (h!37683 (toList!11215 lm!249))) a0!49)))))

(assert (=> d!161727 (= (containsKey!774 (toList!11215 lm!249) a0!49) e!865513)))

(declare-fun b!1554356 () Bool)

(declare-fun e!865514 () Bool)

(assert (=> b!1554356 (= e!865513 e!865514)))

(declare-fun res!1063774 () Bool)

(assert (=> b!1554356 (=> (not res!1063774) (not e!865514))))

(assert (=> b!1554356 (= res!1063774 (and (or (not ((_ is Cons!36237) (toList!11215 lm!249))) (bvsle (_1!12406 (h!37683 (toList!11215 lm!249))) a0!49)) ((_ is Cons!36237) (toList!11215 lm!249)) (bvslt (_1!12406 (h!37683 (toList!11215 lm!249))) a0!49)))))

(declare-fun b!1554357 () Bool)

(assert (=> b!1554357 (= e!865514 (containsKey!774 (t!50962 (toList!11215 lm!249)) a0!49))))

(assert (= (and d!161727 (not res!1063773)) b!1554356))

(assert (= (and b!1554356 res!1063774) b!1554357))

(declare-fun m!1432731 () Bool)

(assert (=> b!1554357 m!1432731))

(assert (=> b!1554203 d!161727))

(declare-fun d!161731 () Bool)

(declare-fun e!865532 () Bool)

(assert (=> d!161731 e!865532))

(declare-fun res!1063785 () Bool)

(assert (=> d!161731 (=> res!1063785 e!865532)))

(declare-fun lt!670020 () Bool)

(assert (=> d!161731 (= res!1063785 (not lt!670020))))

(declare-fun lt!670015 () Bool)

(assert (=> d!161731 (= lt!670020 lt!670015)))

(declare-fun lt!670018 () Unit!51787)

(declare-fun e!865535 () Unit!51787)

(assert (=> d!161731 (= lt!670018 e!865535)))

(declare-fun c!143396 () Bool)

(assert (=> d!161731 (= c!143396 lt!670015)))

(assert (=> d!161731 (= lt!670015 (containsKey!774 (toList!11215 lm!249) a0!49))))

(assert (=> d!161731 (= (contains!10160 lm!249 a0!49) lt!670020)))

(declare-fun b!1554385 () Bool)

(declare-fun lt!670021 () Unit!51787)

(assert (=> b!1554385 (= e!865535 lt!670021)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!517 (List!36241 (_ BitVec 64)) Unit!51787)

(assert (=> b!1554385 (= lt!670021 (lemmaContainsKeyImpliesGetValueByKeyDefined!517 (toList!11215 lm!249) a0!49))))

(declare-fun isDefined!565 (Option!828) Bool)

(assert (=> b!1554385 (isDefined!565 (getValueByKey!752 (toList!11215 lm!249) a0!49))))

(declare-fun b!1554387 () Bool)

(declare-fun Unit!51792 () Unit!51787)

(assert (=> b!1554387 (= e!865535 Unit!51792)))

(declare-fun b!1554389 () Bool)

(assert (=> b!1554389 (= e!865532 (isDefined!565 (getValueByKey!752 (toList!11215 lm!249) a0!49)))))

(assert (= (and d!161731 c!143396) b!1554385))

(assert (= (and d!161731 (not c!143396)) b!1554387))

(assert (= (and d!161731 (not res!1063785)) b!1554389))

(assert (=> d!161731 m!1432659))

(declare-fun m!1432744 () Bool)

(assert (=> b!1554385 m!1432744))

(assert (=> b!1554385 m!1432657))

(assert (=> b!1554385 m!1432657))

(declare-fun m!1432747 () Bool)

(assert (=> b!1554385 m!1432747))

(assert (=> b!1554389 m!1432657))

(assert (=> b!1554389 m!1432657))

(assert (=> b!1554389 m!1432747))

(assert (=> start!132562 d!161731))

(declare-fun d!161735 () Bool)

(assert (=> d!161735 (= (inv!57344 lm!249) (isStrictlySorted!903 (toList!11215 lm!249)))))

(declare-fun bs!44682 () Bool)

(assert (= bs!44682 d!161735))

(assert (=> bs!44682 m!1432647))

(assert (=> start!132562 d!161735))

(declare-fun b!1554421 () Bool)

(declare-fun e!865554 () Option!828)

(declare-fun e!865555 () Option!828)

(assert (=> b!1554421 (= e!865554 e!865555)))

(declare-fun c!143410 () Bool)

(assert (=> b!1554421 (= c!143410 (and ((_ is Cons!36237) lt!669962) (not (= (_1!12406 (h!37683 lt!669962)) a0!49))))))

(declare-fun b!1554422 () Bool)

(assert (=> b!1554422 (= e!865555 (getValueByKey!752 (t!50962 lt!669962) a0!49))))

(declare-fun b!1554423 () Bool)

(assert (=> b!1554423 (= e!865555 None!826)))

(declare-fun d!161739 () Bool)

(declare-fun c!143409 () Bool)

(assert (=> d!161739 (= c!143409 (and ((_ is Cons!36237) lt!669962) (= (_1!12406 (h!37683 lt!669962)) a0!49)))))

(assert (=> d!161739 (= (getValueByKey!752 lt!669962 a0!49) e!865554)))

(declare-fun b!1554420 () Bool)

(assert (=> b!1554420 (= e!865554 (Some!827 (_2!12406 (h!37683 lt!669962))))))

(assert (= (and d!161739 c!143409) b!1554420))

(assert (= (and d!161739 (not c!143409)) b!1554421))

(assert (= (and b!1554421 c!143410) b!1554422))

(assert (= (and b!1554421 (not c!143410)) b!1554423))

(declare-fun m!1432761 () Bool)

(assert (=> b!1554422 m!1432761))

(assert (=> b!1554201 d!161739))

(declare-fun b!1554427 () Bool)

(declare-fun e!865557 () Option!828)

(declare-fun e!865559 () Option!828)

(assert (=> b!1554427 (= e!865557 e!865559)))

(declare-fun c!143414 () Bool)

(assert (=> b!1554427 (= c!143414 (and ((_ is Cons!36237) (toList!11215 lm!249)) (not (= (_1!12406 (h!37683 (toList!11215 lm!249))) a0!49))))))

(declare-fun b!1554429 () Bool)

(assert (=> b!1554429 (= e!865559 (getValueByKey!752 (t!50962 (toList!11215 lm!249)) a0!49))))

(declare-fun b!1554431 () Bool)

(assert (=> b!1554431 (= e!865559 None!826)))

(declare-fun d!161749 () Bool)

(declare-fun c!143412 () Bool)

(assert (=> d!161749 (= c!143412 (and ((_ is Cons!36237) (toList!11215 lm!249)) (= (_1!12406 (h!37683 (toList!11215 lm!249))) a0!49)))))

(assert (=> d!161749 (= (getValueByKey!752 (toList!11215 lm!249) a0!49) e!865557)))

(declare-fun b!1554425 () Bool)

(assert (=> b!1554425 (= e!865557 (Some!827 (_2!12406 (h!37683 (toList!11215 lm!249)))))))

(assert (= (and d!161749 c!143412) b!1554425))

(assert (= (and d!161749 (not c!143412)) b!1554427))

(assert (= (and b!1554427 c!143414) b!1554429))

(assert (= (and b!1554427 (not c!143414)) b!1554431))

(declare-fun m!1432763 () Bool)

(assert (=> b!1554429 m!1432763))

(assert (=> b!1554201 d!161749))

(declare-fun b!1554454 () Bool)

(declare-fun e!865570 () Bool)

(declare-fun tp!112193 () Bool)

(assert (=> b!1554454 (= e!865570 (and tp_is_empty!38253 tp!112193))))

(assert (=> b!1554199 (= tp!112185 e!865570)))

(assert (= (and b!1554199 ((_ is Cons!36237) (toList!11215 lm!249))) b!1554454))

(check-sat (not b!1554429) (not b!1554246) (not d!161731) tp_is_empty!38253 (not b!1554454) (not b!1554422) (not b!1554357) (not d!161723) (not b!1554389) (not b!1554306) (not bm!71412) (not b!1554385) (not b!1554355) (not b!1554228) (not b!1554308) (not d!161711) (not b!1554312) (not d!161735))
(check-sat)
