; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137450 () Bool)

(assert start!137450)

(declare-fun res!1080086 () Bool)

(declare-fun e!882755 () Bool)

(assert (=> start!137450 (=> (not res!1080086) (not e!882755))))

(declare-datatypes ((B!2600 0))(
  ( (B!2601 (val!19662 Int)) )
))
(declare-datatypes ((tuple2!25486 0))(
  ( (tuple2!25487 (_1!12754 (_ BitVec 64)) (_2!12754 B!2600)) )
))
(declare-datatypes ((List!36814 0))(
  ( (Nil!36811) (Cons!36810 (h!38371 tuple2!25486) (t!51720 List!36814)) )
))
(declare-fun lt!677472 () List!36814)

(declare-fun keyValue!4 () tuple2!25486)

(declare-datatypes ((ListLongMap!22833 0))(
  ( (ListLongMap!22834 (toList!11432 List!36814)) )
))
(declare-fun contains!10499 (ListLongMap!22833 (_ BitVec 64)) Bool)

(assert (=> start!137450 (= res!1080086 (contains!10499 (ListLongMap!22834 lt!677472) (_1!12754 keyValue!4)))))

(declare-datatypes ((Option!879 0))(
  ( (Some!878 (v!22367 B!2600)) (None!877) )
))
(declare-fun getValueByKey!804 (List!36814 (_ BitVec 64)) Option!879)

(assert (=> start!137450 (= (getValueByKey!804 lt!677472 (_1!12754 keyValue!4)) (Some!878 (_2!12754 keyValue!4)))))

(declare-datatypes ((Unit!52134 0))(
  ( (Unit!52135) )
))
(declare-fun lt!677471 () Unit!52134)

(declare-fun lemmaContainsTupThenGetReturnValue!393 (List!36814 (_ BitVec 64) B!2600) Unit!52134)

(assert (=> start!137450 (= lt!677471 (lemmaContainsTupThenGetReturnValue!393 lt!677472 (_1!12754 keyValue!4) (_2!12754 keyValue!4)))))

(declare-fun thiss!201 () ListLongMap!22833)

(declare-fun insertStrictlySorted!615 (List!36814 (_ BitVec 64) B!2600) List!36814)

(assert (=> start!137450 (= lt!677472 (insertStrictlySorted!615 (toList!11432 thiss!201) (_1!12754 keyValue!4) (_2!12754 keyValue!4)))))

(assert (=> start!137450 (not e!882755)))

(declare-fun e!882754 () Bool)

(declare-fun inv!58978 (ListLongMap!22833) Bool)

(assert (=> start!137450 (and (inv!58978 thiss!201) e!882754)))

(declare-fun tp_is_empty!39145 () Bool)

(assert (=> start!137450 tp_is_empty!39145))

(declare-fun b!1582157 () Bool)

(declare-fun contains!10500 (List!36814 tuple2!25486) Bool)

(assert (=> b!1582157 (= e!882755 (contains!10500 lt!677472 keyValue!4))))

(declare-fun b!1582158 () Bool)

(declare-fun tp!114360 () Bool)

(assert (=> b!1582158 (= e!882754 tp!114360)))

(assert (= (and start!137450 res!1080086) b!1582157))

(assert (= start!137450 b!1582158))

(declare-fun m!1453683 () Bool)

(assert (=> start!137450 m!1453683))

(declare-fun m!1453685 () Bool)

(assert (=> start!137450 m!1453685))

(declare-fun m!1453687 () Bool)

(assert (=> start!137450 m!1453687))

(declare-fun m!1453689 () Bool)

(assert (=> start!137450 m!1453689))

(declare-fun m!1453691 () Bool)

(assert (=> start!137450 m!1453691))

(declare-fun m!1453693 () Bool)

(assert (=> b!1582157 m!1453693))

(check-sat (not b!1582157) (not start!137450) (not b!1582158) tp_is_empty!39145)
(check-sat)
(get-model)

(declare-fun d!167037 () Bool)

(declare-fun lt!677487 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!814 (List!36814) (InoxSet tuple2!25486))

(assert (=> d!167037 (= lt!677487 (select (content!814 lt!677472) keyValue!4))))

(declare-fun e!882772 () Bool)

(assert (=> d!167037 (= lt!677487 e!882772)))

(declare-fun res!1080097 () Bool)

(assert (=> d!167037 (=> (not res!1080097) (not e!882772))))

(get-info :version)

(assert (=> d!167037 (= res!1080097 ((_ is Cons!36810) lt!677472))))

(assert (=> d!167037 (= (contains!10500 lt!677472 keyValue!4) lt!677487)))

(declare-fun b!1582175 () Bool)

(declare-fun e!882773 () Bool)

(assert (=> b!1582175 (= e!882772 e!882773)))

(declare-fun res!1080098 () Bool)

(assert (=> b!1582175 (=> res!1080098 e!882773)))

(assert (=> b!1582175 (= res!1080098 (= (h!38371 lt!677472) keyValue!4))))

(declare-fun b!1582176 () Bool)

(assert (=> b!1582176 (= e!882773 (contains!10500 (t!51720 lt!677472) keyValue!4))))

(assert (= (and d!167037 res!1080097) b!1582175))

(assert (= (and b!1582175 (not res!1080098)) b!1582176))

(declare-fun m!1453719 () Bool)

(assert (=> d!167037 m!1453719))

(declare-fun m!1453721 () Bool)

(assert (=> d!167037 m!1453721))

(declare-fun m!1453723 () Bool)

(assert (=> b!1582176 m!1453723))

(assert (=> b!1582157 d!167037))

(declare-fun d!167043 () Bool)

(assert (=> d!167043 (= (getValueByKey!804 lt!677472 (_1!12754 keyValue!4)) (Some!878 (_2!12754 keyValue!4)))))

(declare-fun lt!677493 () Unit!52134)

(declare-fun choose!2086 (List!36814 (_ BitVec 64) B!2600) Unit!52134)

(assert (=> d!167043 (= lt!677493 (choose!2086 lt!677472 (_1!12754 keyValue!4) (_2!12754 keyValue!4)))))

(declare-fun e!882782 () Bool)

(assert (=> d!167043 e!882782))

(declare-fun res!1080109 () Bool)

(assert (=> d!167043 (=> (not res!1080109) (not e!882782))))

(declare-fun isStrictlySorted!1031 (List!36814) Bool)

(assert (=> d!167043 (= res!1080109 (isStrictlySorted!1031 lt!677472))))

(assert (=> d!167043 (= (lemmaContainsTupThenGetReturnValue!393 lt!677472 (_1!12754 keyValue!4) (_2!12754 keyValue!4)) lt!677493)))

(declare-fun b!1582187 () Bool)

(declare-fun res!1080110 () Bool)

(assert (=> b!1582187 (=> (not res!1080110) (not e!882782))))

(declare-fun containsKey!890 (List!36814 (_ BitVec 64)) Bool)

(assert (=> b!1582187 (= res!1080110 (containsKey!890 lt!677472 (_1!12754 keyValue!4)))))

(declare-fun b!1582188 () Bool)

(assert (=> b!1582188 (= e!882782 (contains!10500 lt!677472 (tuple2!25487 (_1!12754 keyValue!4) (_2!12754 keyValue!4))))))

(assert (= (and d!167043 res!1080109) b!1582187))

(assert (= (and b!1582187 res!1080110) b!1582188))

(assert (=> d!167043 m!1453687))

(declare-fun m!1453733 () Bool)

(assert (=> d!167043 m!1453733))

(declare-fun m!1453735 () Bool)

(assert (=> d!167043 m!1453735))

(declare-fun m!1453737 () Bool)

(assert (=> b!1582187 m!1453737))

(declare-fun m!1453739 () Bool)

(assert (=> b!1582188 m!1453739))

(assert (=> start!137450 d!167043))

(declare-fun d!167049 () Bool)

(assert (=> d!167049 (= (inv!58978 thiss!201) (isStrictlySorted!1031 (toList!11432 thiss!201)))))

(declare-fun bs!45782 () Bool)

(assert (= bs!45782 d!167049))

(declare-fun m!1453743 () Bool)

(assert (=> bs!45782 m!1453743))

(assert (=> start!137450 d!167049))

(declare-fun b!1582203 () Bool)

(declare-fun e!882790 () Option!879)

(assert (=> b!1582203 (= e!882790 (Some!878 (_2!12754 (h!38371 lt!677472))))))

(declare-fun d!167053 () Bool)

(declare-fun c!147265 () Bool)

(assert (=> d!167053 (= c!147265 (and ((_ is Cons!36810) lt!677472) (= (_1!12754 (h!38371 lt!677472)) (_1!12754 keyValue!4))))))

(assert (=> d!167053 (= (getValueByKey!804 lt!677472 (_1!12754 keyValue!4)) e!882790)))

(declare-fun b!1582205 () Bool)

(declare-fun e!882791 () Option!879)

(assert (=> b!1582205 (= e!882791 (getValueByKey!804 (t!51720 lt!677472) (_1!12754 keyValue!4)))))

(declare-fun b!1582204 () Bool)

(assert (=> b!1582204 (= e!882790 e!882791)))

(declare-fun c!147266 () Bool)

(assert (=> b!1582204 (= c!147266 (and ((_ is Cons!36810) lt!677472) (not (= (_1!12754 (h!38371 lt!677472)) (_1!12754 keyValue!4)))))))

(declare-fun b!1582206 () Bool)

(assert (=> b!1582206 (= e!882791 None!877)))

(assert (= (and d!167053 c!147265) b!1582203))

(assert (= (and d!167053 (not c!147265)) b!1582204))

(assert (= (and b!1582204 c!147266) b!1582205))

(assert (= (and b!1582204 (not c!147266)) b!1582206))

(declare-fun m!1453753 () Bool)

(assert (=> b!1582205 m!1453753))

(assert (=> start!137450 d!167053))

(declare-fun d!167057 () Bool)

(declare-fun e!882805 () Bool)

(assert (=> d!167057 e!882805))

(declare-fun res!1080125 () Bool)

(assert (=> d!167057 (=> res!1080125 e!882805)))

(declare-fun lt!677510 () Bool)

(assert (=> d!167057 (= res!1080125 (not lt!677510))))

(declare-fun lt!677509 () Bool)

(assert (=> d!167057 (= lt!677510 lt!677509)))

(declare-fun lt!677508 () Unit!52134)

(declare-fun e!882806 () Unit!52134)

(assert (=> d!167057 (= lt!677508 e!882806)))

(declare-fun c!147275 () Bool)

(assert (=> d!167057 (= c!147275 lt!677509)))

(assert (=> d!167057 (= lt!677509 (containsKey!890 (toList!11432 (ListLongMap!22834 lt!677472)) (_1!12754 keyValue!4)))))

(assert (=> d!167057 (= (contains!10499 (ListLongMap!22834 lt!677472) (_1!12754 keyValue!4)) lt!677510)))

(declare-fun b!1582231 () Bool)

(declare-fun lt!677511 () Unit!52134)

(assert (=> b!1582231 (= e!882806 lt!677511)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!546 (List!36814 (_ BitVec 64)) Unit!52134)

(assert (=> b!1582231 (= lt!677511 (lemmaContainsKeyImpliesGetValueByKeyDefined!546 (toList!11432 (ListLongMap!22834 lt!677472)) (_1!12754 keyValue!4)))))

(declare-fun isDefined!592 (Option!879) Bool)

(assert (=> b!1582231 (isDefined!592 (getValueByKey!804 (toList!11432 (ListLongMap!22834 lt!677472)) (_1!12754 keyValue!4)))))

(declare-fun b!1582232 () Bool)

(declare-fun Unit!52140 () Unit!52134)

(assert (=> b!1582232 (= e!882806 Unit!52140)))

(declare-fun b!1582233 () Bool)

(assert (=> b!1582233 (= e!882805 (isDefined!592 (getValueByKey!804 (toList!11432 (ListLongMap!22834 lt!677472)) (_1!12754 keyValue!4))))))

(assert (= (and d!167057 c!147275) b!1582231))

(assert (= (and d!167057 (not c!147275)) b!1582232))

(assert (= (and d!167057 (not res!1080125)) b!1582233))

(declare-fun m!1453765 () Bool)

(assert (=> d!167057 m!1453765))

(declare-fun m!1453767 () Bool)

(assert (=> b!1582231 m!1453767))

(declare-fun m!1453769 () Bool)

(assert (=> b!1582231 m!1453769))

(assert (=> b!1582231 m!1453769))

(declare-fun m!1453771 () Bool)

(assert (=> b!1582231 m!1453771))

(assert (=> b!1582233 m!1453769))

(assert (=> b!1582233 m!1453769))

(assert (=> b!1582233 m!1453771))

(assert (=> start!137450 d!167057))

(declare-fun b!1582294 () Bool)

(declare-fun e!882841 () List!36814)

(declare-fun call!72622 () List!36814)

(assert (=> b!1582294 (= e!882841 call!72622)))

(declare-fun b!1582295 () Bool)

(declare-fun c!147303 () Bool)

(assert (=> b!1582295 (= c!147303 (and ((_ is Cons!36810) (toList!11432 thiss!201)) (bvsgt (_1!12754 (h!38371 (toList!11432 thiss!201))) (_1!12754 keyValue!4))))))

(declare-fun e!882839 () List!36814)

(declare-fun e!882837 () List!36814)

(assert (=> b!1582295 (= e!882839 e!882837)))

(declare-fun b!1582296 () Bool)

(declare-fun c!147302 () Bool)

(declare-fun e!882838 () List!36814)

(assert (=> b!1582296 (= e!882838 (ite c!147302 (t!51720 (toList!11432 thiss!201)) (ite c!147303 (Cons!36810 (h!38371 (toList!11432 thiss!201)) (t!51720 (toList!11432 thiss!201))) Nil!36811)))))

(declare-fun b!1582297 () Bool)

(assert (=> b!1582297 (= e!882841 e!882839)))

(assert (=> b!1582297 (= c!147302 (and ((_ is Cons!36810) (toList!11432 thiss!201)) (= (_1!12754 (h!38371 (toList!11432 thiss!201))) (_1!12754 keyValue!4))))))

(declare-fun bm!72618 () Bool)

(declare-fun call!72623 () List!36814)

(declare-fun call!72621 () List!36814)

(assert (=> bm!72618 (= call!72623 call!72621)))

(declare-fun b!1582298 () Bool)

(assert (=> b!1582298 (= e!882838 (insertStrictlySorted!615 (t!51720 (toList!11432 thiss!201)) (_1!12754 keyValue!4) (_2!12754 keyValue!4)))))

(declare-fun d!167063 () Bool)

(declare-fun e!882840 () Bool)

(assert (=> d!167063 e!882840))

(declare-fun res!1080138 () Bool)

(assert (=> d!167063 (=> (not res!1080138) (not e!882840))))

(declare-fun lt!677518 () List!36814)

(assert (=> d!167063 (= res!1080138 (isStrictlySorted!1031 lt!677518))))

(assert (=> d!167063 (= lt!677518 e!882841)))

(declare-fun c!147300 () Bool)

(assert (=> d!167063 (= c!147300 (and ((_ is Cons!36810) (toList!11432 thiss!201)) (bvslt (_1!12754 (h!38371 (toList!11432 thiss!201))) (_1!12754 keyValue!4))))))

(assert (=> d!167063 (isStrictlySorted!1031 (toList!11432 thiss!201))))

(assert (=> d!167063 (= (insertStrictlySorted!615 (toList!11432 thiss!201) (_1!12754 keyValue!4) (_2!12754 keyValue!4)) lt!677518)))

(declare-fun b!1582299 () Bool)

(assert (=> b!1582299 (= e!882839 call!72621)))

(declare-fun bm!72619 () Bool)

(declare-fun $colon$colon!1009 (List!36814 tuple2!25486) List!36814)

(assert (=> bm!72619 (= call!72622 ($colon$colon!1009 e!882838 (ite c!147300 (h!38371 (toList!11432 thiss!201)) (tuple2!25487 (_1!12754 keyValue!4) (_2!12754 keyValue!4)))))))

(declare-fun c!147301 () Bool)

(assert (=> bm!72619 (= c!147301 c!147300)))

(declare-fun b!1582300 () Bool)

(assert (=> b!1582300 (= e!882837 call!72623)))

(declare-fun b!1582301 () Bool)

(declare-fun res!1080139 () Bool)

(assert (=> b!1582301 (=> (not res!1080139) (not e!882840))))

(assert (=> b!1582301 (= res!1080139 (containsKey!890 lt!677518 (_1!12754 keyValue!4)))))

(declare-fun b!1582302 () Bool)

(assert (=> b!1582302 (= e!882840 (contains!10500 lt!677518 (tuple2!25487 (_1!12754 keyValue!4) (_2!12754 keyValue!4))))))

(declare-fun bm!72620 () Bool)

(assert (=> bm!72620 (= call!72621 call!72622)))

(declare-fun b!1582303 () Bool)

(assert (=> b!1582303 (= e!882837 call!72623)))

(assert (= (and d!167063 c!147300) b!1582294))

(assert (= (and d!167063 (not c!147300)) b!1582297))

(assert (= (and b!1582297 c!147302) b!1582299))

(assert (= (and b!1582297 (not c!147302)) b!1582295))

(assert (= (and b!1582295 c!147303) b!1582303))

(assert (= (and b!1582295 (not c!147303)) b!1582300))

(assert (= (or b!1582303 b!1582300) bm!72618))

(assert (= (or b!1582299 bm!72618) bm!72620))

(assert (= (or b!1582294 bm!72620) bm!72619))

(assert (= (and bm!72619 c!147301) b!1582298))

(assert (= (and bm!72619 (not c!147301)) b!1582296))

(assert (= (and d!167063 res!1080138) b!1582301))

(assert (= (and b!1582301 res!1080139) b!1582302))

(declare-fun m!1453773 () Bool)

(assert (=> b!1582302 m!1453773))

(declare-fun m!1453775 () Bool)

(assert (=> b!1582298 m!1453775))

(declare-fun m!1453777 () Bool)

(assert (=> b!1582301 m!1453777))

(declare-fun m!1453779 () Bool)

(assert (=> bm!72619 m!1453779))

(declare-fun m!1453781 () Bool)

(assert (=> d!167063 m!1453781))

(assert (=> d!167063 m!1453743))

(assert (=> start!137450 d!167063))

(declare-fun b!1582308 () Bool)

(declare-fun e!882844 () Bool)

(declare-fun tp!114369 () Bool)

(assert (=> b!1582308 (= e!882844 (and tp_is_empty!39145 tp!114369))))

(assert (=> b!1582158 (= tp!114360 e!882844)))

(assert (= (and b!1582158 ((_ is Cons!36810) (toList!11432 thiss!201))) b!1582308))

(check-sat (not d!167049) (not d!167037) (not b!1582302) (not b!1582188) (not b!1582205) (not d!167043) (not b!1582176) (not b!1582301) (not b!1582298) (not d!167063) (not b!1582187) (not d!167057) tp_is_empty!39145 (not b!1582231) (not b!1582233) (not bm!72619) (not b!1582308))
(check-sat)
