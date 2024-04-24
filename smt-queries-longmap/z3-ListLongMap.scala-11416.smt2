; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133440 () Bool)

(assert start!133440)

(declare-fun b!1559682 () Bool)

(declare-fun res!1066040 () Bool)

(declare-fun e!868949 () Bool)

(assert (=> b!1559682 (=> (not res!1066040) (not e!868949))))

(declare-datatypes ((B!2372 0))(
  ( (B!2373 (val!19272 Int)) )
))
(declare-datatypes ((tuple2!24974 0))(
  ( (tuple2!24975 (_1!12498 (_ BitVec 64)) (_2!12498 B!2372)) )
))
(declare-datatypes ((List!36335 0))(
  ( (Nil!36332) (Cons!36331 (h!37795 tuple2!24974) (t!51054 List!36335)) )
))
(declare-datatypes ((ListLongMap!22483 0))(
  ( (ListLongMap!22484 (toList!11257 List!36335)) )
))
(declare-fun lm!250 () ListLongMap!22483)

(declare-fun a0!50 () (_ BitVec 64))

(declare-fun containsKey!818 (List!36335 (_ BitVec 64)) Bool)

(assert (=> b!1559682 (= res!1066040 (containsKey!818 (toList!11257 lm!250) a0!50))))

(declare-fun b!97 () B!2372)

(declare-fun a!524 () (_ BitVec 64))

(declare-fun b!1559683 () Bool)

(declare-fun contains!10238 (ListLongMap!22483 (_ BitVec 64)) Bool)

(declare-fun +!5058 (ListLongMap!22483 tuple2!24974) ListLongMap!22483)

(assert (=> b!1559683 (= e!868949 (not (contains!10238 (+!5058 lm!250 (tuple2!24975 a!524 b!97)) a0!50)))))

(declare-fun insertStrictlySorted!556 (List!36335 (_ BitVec 64) B!2372) List!36335)

(assert (=> b!1559683 (containsKey!818 (insertStrictlySorted!556 (toList!11257 lm!250) a!524 b!97) a0!50)))

(declare-datatypes ((Unit!51764 0))(
  ( (Unit!51765) )
))
(declare-fun lt!671431 () Unit!51764)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!1 (List!36335 (_ BitVec 64) B!2372 (_ BitVec 64)) Unit!51764)

(assert (=> b!1559683 (= lt!671431 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!1 (toList!11257 lm!250) a!524 b!97 a0!50))))

(declare-fun b!1559684 () Bool)

(declare-fun res!1066043 () Bool)

(assert (=> b!1559684 (=> (not res!1066043) (not e!868949))))

(assert (=> b!1559684 (= res!1066043 (not (= a0!50 a!524)))))

(declare-fun res!1066041 () Bool)

(assert (=> start!133440 (=> (not res!1066041) (not e!868949))))

(assert (=> start!133440 (= res!1066041 (contains!10238 lm!250 a0!50))))

(assert (=> start!133440 e!868949))

(declare-fun e!868948 () Bool)

(declare-fun inv!57465 (ListLongMap!22483) Bool)

(assert (=> start!133440 (and (inv!57465 lm!250) e!868948)))

(assert (=> start!133440 true))

(declare-fun tp_is_empty!38377 () Bool)

(assert (=> start!133440 tp_is_empty!38377))

(declare-fun b!1559685 () Bool)

(declare-fun res!1066044 () Bool)

(assert (=> b!1559685 (=> (not res!1066044) (not e!868949))))

(declare-fun isStrictlySorted!943 (List!36335) Bool)

(assert (=> b!1559685 (= res!1066044 (isStrictlySorted!943 (toList!11257 lm!250)))))

(declare-fun b!1559686 () Bool)

(declare-fun res!1066042 () Bool)

(assert (=> b!1559686 (=> (not res!1066042) (not e!868949))))

(assert (=> b!1559686 (= res!1066042 (not (= a!524 a0!50)))))

(declare-fun b!1559687 () Bool)

(declare-fun tp!112494 () Bool)

(assert (=> b!1559687 (= e!868948 tp!112494)))

(assert (= (and start!133440 res!1066041) b!1559686))

(assert (= (and b!1559686 res!1066042) b!1559685))

(assert (= (and b!1559685 res!1066044) b!1559682))

(assert (= (and b!1559682 res!1066040) b!1559684))

(assert (= (and b!1559684 res!1066043) b!1559683))

(assert (= start!133440 b!1559687))

(declare-fun m!1436675 () Bool)

(assert (=> b!1559682 m!1436675))

(declare-fun m!1436677 () Bool)

(assert (=> b!1559683 m!1436677))

(declare-fun m!1436679 () Bool)

(assert (=> b!1559683 m!1436679))

(declare-fun m!1436681 () Bool)

(assert (=> b!1559683 m!1436681))

(assert (=> b!1559683 m!1436679))

(assert (=> b!1559683 m!1436677))

(declare-fun m!1436683 () Bool)

(assert (=> b!1559683 m!1436683))

(declare-fun m!1436685 () Bool)

(assert (=> b!1559683 m!1436685))

(declare-fun m!1436687 () Bool)

(assert (=> start!133440 m!1436687))

(declare-fun m!1436689 () Bool)

(assert (=> start!133440 m!1436689))

(declare-fun m!1436691 () Bool)

(assert (=> b!1559685 m!1436691))

(check-sat (not b!1559685) (not b!1559683) (not start!133440) tp_is_empty!38377 (not b!1559682) (not b!1559687))
(check-sat)
(get-model)

(declare-fun d!163123 () Bool)

(declare-fun res!1066083 () Bool)

(declare-fun e!868970 () Bool)

(assert (=> d!163123 (=> res!1066083 e!868970)))

(get-info :version)

(assert (=> d!163123 (= res!1066083 (and ((_ is Cons!36331) (toList!11257 lm!250)) (= (_1!12498 (h!37795 (toList!11257 lm!250))) a0!50)))))

(assert (=> d!163123 (= (containsKey!818 (toList!11257 lm!250) a0!50) e!868970)))

(declare-fun b!1559732 () Bool)

(declare-fun e!868971 () Bool)

(assert (=> b!1559732 (= e!868970 e!868971)))

(declare-fun res!1066084 () Bool)

(assert (=> b!1559732 (=> (not res!1066084) (not e!868971))))

(assert (=> b!1559732 (= res!1066084 (and (or (not ((_ is Cons!36331) (toList!11257 lm!250))) (bvsle (_1!12498 (h!37795 (toList!11257 lm!250))) a0!50)) ((_ is Cons!36331) (toList!11257 lm!250)) (bvslt (_1!12498 (h!37795 (toList!11257 lm!250))) a0!50)))))

(declare-fun b!1559733 () Bool)

(assert (=> b!1559733 (= e!868971 (containsKey!818 (t!51054 (toList!11257 lm!250)) a0!50))))

(assert (= (and d!163123 (not res!1066083)) b!1559732))

(assert (= (and b!1559732 res!1066084) b!1559733))

(declare-fun m!1436729 () Bool)

(assert (=> b!1559733 m!1436729))

(assert (=> b!1559682 d!163123))

(declare-fun b!1559786 () Bool)

(declare-fun e!869010 () List!36335)

(assert (=> b!1559786 (= e!869010 (insertStrictlySorted!556 (t!51054 (toList!11257 lm!250)) a!524 b!97))))

(declare-fun d!163129 () Bool)

(declare-fun e!869011 () Bool)

(assert (=> d!163129 e!869011))

(declare-fun res!1066109 () Bool)

(assert (=> d!163129 (=> (not res!1066109) (not e!869011))))

(declare-fun lt!671464 () List!36335)

(assert (=> d!163129 (= res!1066109 (isStrictlySorted!943 lt!671464))))

(declare-fun e!869009 () List!36335)

(assert (=> d!163129 (= lt!671464 e!869009)))

(declare-fun c!144756 () Bool)

(assert (=> d!163129 (= c!144756 (and ((_ is Cons!36331) (toList!11257 lm!250)) (bvslt (_1!12498 (h!37795 (toList!11257 lm!250))) a!524)))))

(assert (=> d!163129 (isStrictlySorted!943 (toList!11257 lm!250))))

(assert (=> d!163129 (= (insertStrictlySorted!556 (toList!11257 lm!250) a!524 b!97) lt!671464)))

(declare-fun b!1559787 () Bool)

(declare-fun call!71818 () List!36335)

(assert (=> b!1559787 (= e!869009 call!71818)))

(declare-fun b!1559788 () Bool)

(declare-fun e!869008 () List!36335)

(declare-fun call!71819 () List!36335)

(assert (=> b!1559788 (= e!869008 call!71819)))

(declare-fun bm!71815 () Bool)

(assert (=> bm!71815 (= call!71819 call!71818)))

(declare-fun b!1559789 () Bool)

(declare-fun e!869012 () List!36335)

(declare-fun call!71820 () List!36335)

(assert (=> b!1559789 (= e!869012 call!71820)))

(declare-fun bm!71816 () Bool)

(assert (=> bm!71816 (= call!71820 call!71819)))

(declare-fun b!1559790 () Bool)

(declare-fun contains!10241 (List!36335 tuple2!24974) Bool)

(assert (=> b!1559790 (= e!869011 (contains!10241 lt!671464 (tuple2!24975 a!524 b!97)))))

(declare-fun b!1559791 () Bool)

(declare-fun c!144757 () Bool)

(assert (=> b!1559791 (= c!144757 (and ((_ is Cons!36331) (toList!11257 lm!250)) (bvsgt (_1!12498 (h!37795 (toList!11257 lm!250))) a!524)))))

(assert (=> b!1559791 (= e!869008 e!869012)))

(declare-fun b!1559792 () Bool)

(assert (=> b!1559792 (= e!869009 e!869008)))

(declare-fun c!144755 () Bool)

(assert (=> b!1559792 (= c!144755 (and ((_ is Cons!36331) (toList!11257 lm!250)) (= (_1!12498 (h!37795 (toList!11257 lm!250))) a!524)))))

(declare-fun b!1559793 () Bool)

(assert (=> b!1559793 (= e!869010 (ite c!144755 (t!51054 (toList!11257 lm!250)) (ite c!144757 (Cons!36331 (h!37795 (toList!11257 lm!250)) (t!51054 (toList!11257 lm!250))) Nil!36332)))))

(declare-fun b!1559794 () Bool)

(assert (=> b!1559794 (= e!869012 call!71820)))

(declare-fun b!1559795 () Bool)

(declare-fun res!1066110 () Bool)

(assert (=> b!1559795 (=> (not res!1066110) (not e!869011))))

(assert (=> b!1559795 (= res!1066110 (containsKey!818 lt!671464 a!524))))

(declare-fun bm!71817 () Bool)

(declare-fun $colon$colon!971 (List!36335 tuple2!24974) List!36335)

(assert (=> bm!71817 (= call!71818 ($colon$colon!971 e!869010 (ite c!144756 (h!37795 (toList!11257 lm!250)) (tuple2!24975 a!524 b!97))))))

(declare-fun c!144754 () Bool)

(assert (=> bm!71817 (= c!144754 c!144756)))

(assert (= (and d!163129 c!144756) b!1559787))

(assert (= (and d!163129 (not c!144756)) b!1559792))

(assert (= (and b!1559792 c!144755) b!1559788))

(assert (= (and b!1559792 (not c!144755)) b!1559791))

(assert (= (and b!1559791 c!144757) b!1559789))

(assert (= (and b!1559791 (not c!144757)) b!1559794))

(assert (= (or b!1559789 b!1559794) bm!71816))

(assert (= (or b!1559788 bm!71816) bm!71815))

(assert (= (or b!1559787 bm!71815) bm!71817))

(assert (= (and bm!71817 c!144754) b!1559786))

(assert (= (and bm!71817 (not c!144754)) b!1559793))

(assert (= (and d!163129 res!1066109) b!1559795))

(assert (= (and b!1559795 res!1066110) b!1559790))

(declare-fun m!1436749 () Bool)

(assert (=> b!1559795 m!1436749))

(declare-fun m!1436751 () Bool)

(assert (=> b!1559786 m!1436751))

(declare-fun m!1436753 () Bool)

(assert (=> b!1559790 m!1436753))

(declare-fun m!1436755 () Bool)

(assert (=> bm!71817 m!1436755))

(declare-fun m!1436757 () Bool)

(assert (=> d!163129 m!1436757))

(assert (=> d!163129 m!1436691))

(assert (=> b!1559683 d!163129))

(declare-fun d!163145 () Bool)

(declare-fun e!869036 () Bool)

(assert (=> d!163145 e!869036))

(declare-fun res!1066117 () Bool)

(assert (=> d!163145 (=> res!1066117 e!869036)))

(declare-fun lt!671477 () Bool)

(assert (=> d!163145 (= res!1066117 (not lt!671477))))

(declare-fun lt!671480 () Bool)

(assert (=> d!163145 (= lt!671477 lt!671480)))

(declare-fun lt!671478 () Unit!51764)

(declare-fun e!869035 () Unit!51764)

(assert (=> d!163145 (= lt!671478 e!869035)))

(declare-fun c!144776 () Bool)

(assert (=> d!163145 (= c!144776 lt!671480)))

(assert (=> d!163145 (= lt!671480 (containsKey!818 (toList!11257 (+!5058 lm!250 (tuple2!24975 a!524 b!97))) a0!50))))

(assert (=> d!163145 (= (contains!10238 (+!5058 lm!250 (tuple2!24975 a!524 b!97)) a0!50) lt!671477)))

(declare-fun b!1559838 () Bool)

(declare-fun lt!671479 () Unit!51764)

(assert (=> b!1559838 (= e!869035 lt!671479)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!527 (List!36335 (_ BitVec 64)) Unit!51764)

(assert (=> b!1559838 (= lt!671479 (lemmaContainsKeyImpliesGetValueByKeyDefined!527 (toList!11257 (+!5058 lm!250 (tuple2!24975 a!524 b!97))) a0!50))))

(declare-datatypes ((Option!857 0))(
  ( (Some!856 (v!22044 B!2372)) (None!855) )
))
(declare-fun isDefined!573 (Option!857) Bool)

(declare-fun getValueByKey!782 (List!36335 (_ BitVec 64)) Option!857)

(assert (=> b!1559838 (isDefined!573 (getValueByKey!782 (toList!11257 (+!5058 lm!250 (tuple2!24975 a!524 b!97))) a0!50))))

(declare-fun b!1559839 () Bool)

(declare-fun Unit!51772 () Unit!51764)

(assert (=> b!1559839 (= e!869035 Unit!51772)))

(declare-fun b!1559840 () Bool)

(assert (=> b!1559840 (= e!869036 (isDefined!573 (getValueByKey!782 (toList!11257 (+!5058 lm!250 (tuple2!24975 a!524 b!97))) a0!50)))))

(assert (= (and d!163145 c!144776) b!1559838))

(assert (= (and d!163145 (not c!144776)) b!1559839))

(assert (= (and d!163145 (not res!1066117)) b!1559840))

(declare-fun m!1436759 () Bool)

(assert (=> d!163145 m!1436759))

(declare-fun m!1436761 () Bool)

(assert (=> b!1559838 m!1436761))

(declare-fun m!1436763 () Bool)

(assert (=> b!1559838 m!1436763))

(assert (=> b!1559838 m!1436763))

(declare-fun m!1436765 () Bool)

(assert (=> b!1559838 m!1436765))

(assert (=> b!1559840 m!1436763))

(assert (=> b!1559840 m!1436763))

(assert (=> b!1559840 m!1436765))

(assert (=> b!1559683 d!163145))

(declare-fun d!163147 () Bool)

(assert (=> d!163147 (containsKey!818 (insertStrictlySorted!556 (toList!11257 lm!250) a!524 b!97) a0!50)))

(declare-fun lt!671493 () Unit!51764)

(declare-fun choose!2058 (List!36335 (_ BitVec 64) B!2372 (_ BitVec 64)) Unit!51764)

(assert (=> d!163147 (= lt!671493 (choose!2058 (toList!11257 lm!250) a!524 b!97 a0!50))))

(declare-fun e!869055 () Bool)

(assert (=> d!163147 e!869055))

(declare-fun res!1066132 () Bool)

(assert (=> d!163147 (=> (not res!1066132) (not e!869055))))

(assert (=> d!163147 (= res!1066132 (isStrictlySorted!943 (toList!11257 lm!250)))))

(assert (=> d!163147 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!1 (toList!11257 lm!250) a!524 b!97 a0!50) lt!671493)))

(declare-fun b!1559875 () Bool)

(declare-fun res!1066133 () Bool)

(assert (=> b!1559875 (=> (not res!1066133) (not e!869055))))

(assert (=> b!1559875 (= res!1066133 (containsKey!818 (toList!11257 lm!250) a0!50))))

(declare-fun b!1559876 () Bool)

(assert (=> b!1559876 (= e!869055 (not (= a0!50 a!524)))))

(assert (= (and d!163147 res!1066132) b!1559875))

(assert (= (and b!1559875 res!1066133) b!1559876))

(assert (=> d!163147 m!1436679))

(assert (=> d!163147 m!1436679))

(assert (=> d!163147 m!1436681))

(declare-fun m!1436803 () Bool)

(assert (=> d!163147 m!1436803))

(assert (=> d!163147 m!1436691))

(assert (=> b!1559875 m!1436675))

(assert (=> b!1559683 d!163147))

(declare-fun d!163157 () Bool)

(declare-fun res!1066134 () Bool)

(declare-fun e!869056 () Bool)

(assert (=> d!163157 (=> res!1066134 e!869056)))

(assert (=> d!163157 (= res!1066134 (and ((_ is Cons!36331) (insertStrictlySorted!556 (toList!11257 lm!250) a!524 b!97)) (= (_1!12498 (h!37795 (insertStrictlySorted!556 (toList!11257 lm!250) a!524 b!97))) a0!50)))))

(assert (=> d!163157 (= (containsKey!818 (insertStrictlySorted!556 (toList!11257 lm!250) a!524 b!97) a0!50) e!869056)))

(declare-fun b!1559877 () Bool)

(declare-fun e!869057 () Bool)

(assert (=> b!1559877 (= e!869056 e!869057)))

(declare-fun res!1066135 () Bool)

(assert (=> b!1559877 (=> (not res!1066135) (not e!869057))))

(assert (=> b!1559877 (= res!1066135 (and (or (not ((_ is Cons!36331) (insertStrictlySorted!556 (toList!11257 lm!250) a!524 b!97))) (bvsle (_1!12498 (h!37795 (insertStrictlySorted!556 (toList!11257 lm!250) a!524 b!97))) a0!50)) ((_ is Cons!36331) (insertStrictlySorted!556 (toList!11257 lm!250) a!524 b!97)) (bvslt (_1!12498 (h!37795 (insertStrictlySorted!556 (toList!11257 lm!250) a!524 b!97))) a0!50)))))

(declare-fun b!1559878 () Bool)

(assert (=> b!1559878 (= e!869057 (containsKey!818 (t!51054 (insertStrictlySorted!556 (toList!11257 lm!250) a!524 b!97)) a0!50))))

(assert (= (and d!163157 (not res!1066134)) b!1559877))

(assert (= (and b!1559877 res!1066135) b!1559878))

(declare-fun m!1436805 () Bool)

(assert (=> b!1559878 m!1436805))

(assert (=> b!1559683 d!163157))

(declare-fun d!163159 () Bool)

(declare-fun e!869072 () Bool)

(assert (=> d!163159 e!869072))

(declare-fun res!1066160 () Bool)

(assert (=> d!163159 (=> (not res!1066160) (not e!869072))))

(declare-fun lt!671516 () ListLongMap!22483)

(assert (=> d!163159 (= res!1066160 (contains!10238 lt!671516 (_1!12498 (tuple2!24975 a!524 b!97))))))

(declare-fun lt!671518 () List!36335)

(assert (=> d!163159 (= lt!671516 (ListLongMap!22484 lt!671518))))

(declare-fun lt!671517 () Unit!51764)

(declare-fun lt!671519 () Unit!51764)

(assert (=> d!163159 (= lt!671517 lt!671519)))

(assert (=> d!163159 (= (getValueByKey!782 lt!671518 (_1!12498 (tuple2!24975 a!524 b!97))) (Some!856 (_2!12498 (tuple2!24975 a!524 b!97))))))

(declare-fun lemmaContainsTupThenGetReturnValue!380 (List!36335 (_ BitVec 64) B!2372) Unit!51764)

(assert (=> d!163159 (= lt!671519 (lemmaContainsTupThenGetReturnValue!380 lt!671518 (_1!12498 (tuple2!24975 a!524 b!97)) (_2!12498 (tuple2!24975 a!524 b!97))))))

(assert (=> d!163159 (= lt!671518 (insertStrictlySorted!556 (toList!11257 lm!250) (_1!12498 (tuple2!24975 a!524 b!97)) (_2!12498 (tuple2!24975 a!524 b!97))))))

(assert (=> d!163159 (= (+!5058 lm!250 (tuple2!24975 a!524 b!97)) lt!671516)))

(declare-fun b!1559903 () Bool)

(declare-fun res!1066161 () Bool)

(assert (=> b!1559903 (=> (not res!1066161) (not e!869072))))

(assert (=> b!1559903 (= res!1066161 (= (getValueByKey!782 (toList!11257 lt!671516) (_1!12498 (tuple2!24975 a!524 b!97))) (Some!856 (_2!12498 (tuple2!24975 a!524 b!97)))))))

(declare-fun b!1559904 () Bool)

(assert (=> b!1559904 (= e!869072 (contains!10241 (toList!11257 lt!671516) (tuple2!24975 a!524 b!97)))))

(assert (= (and d!163159 res!1066160) b!1559903))

(assert (= (and b!1559903 res!1066161) b!1559904))

(declare-fun m!1436815 () Bool)

(assert (=> d!163159 m!1436815))

(declare-fun m!1436817 () Bool)

(assert (=> d!163159 m!1436817))

(declare-fun m!1436819 () Bool)

(assert (=> d!163159 m!1436819))

(declare-fun m!1436821 () Bool)

(assert (=> d!163159 m!1436821))

(declare-fun m!1436823 () Bool)

(assert (=> b!1559903 m!1436823))

(declare-fun m!1436825 () Bool)

(assert (=> b!1559904 m!1436825))

(assert (=> b!1559683 d!163159))

(declare-fun d!163169 () Bool)

(declare-fun e!869074 () Bool)

(assert (=> d!163169 e!869074))

(declare-fun res!1066162 () Bool)

(assert (=> d!163169 (=> res!1066162 e!869074)))

(declare-fun lt!671520 () Bool)

(assert (=> d!163169 (= res!1066162 (not lt!671520))))

(declare-fun lt!671523 () Bool)

(assert (=> d!163169 (= lt!671520 lt!671523)))

(declare-fun lt!671521 () Unit!51764)

(declare-fun e!869073 () Unit!51764)

(assert (=> d!163169 (= lt!671521 e!869073)))

(declare-fun c!144787 () Bool)

(assert (=> d!163169 (= c!144787 lt!671523)))

(assert (=> d!163169 (= lt!671523 (containsKey!818 (toList!11257 lm!250) a0!50))))

(assert (=> d!163169 (= (contains!10238 lm!250 a0!50) lt!671520)))

(declare-fun b!1559905 () Bool)

(declare-fun lt!671522 () Unit!51764)

(assert (=> b!1559905 (= e!869073 lt!671522)))

(assert (=> b!1559905 (= lt!671522 (lemmaContainsKeyImpliesGetValueByKeyDefined!527 (toList!11257 lm!250) a0!50))))

(assert (=> b!1559905 (isDefined!573 (getValueByKey!782 (toList!11257 lm!250) a0!50))))

(declare-fun b!1559906 () Bool)

(declare-fun Unit!51774 () Unit!51764)

(assert (=> b!1559906 (= e!869073 Unit!51774)))

(declare-fun b!1559907 () Bool)

(assert (=> b!1559907 (= e!869074 (isDefined!573 (getValueByKey!782 (toList!11257 lm!250) a0!50)))))

(assert (= (and d!163169 c!144787) b!1559905))

(assert (= (and d!163169 (not c!144787)) b!1559906))

(assert (= (and d!163169 (not res!1066162)) b!1559907))

(assert (=> d!163169 m!1436675))

(declare-fun m!1436827 () Bool)

(assert (=> b!1559905 m!1436827))

(declare-fun m!1436829 () Bool)

(assert (=> b!1559905 m!1436829))

(assert (=> b!1559905 m!1436829))

(declare-fun m!1436831 () Bool)

(assert (=> b!1559905 m!1436831))

(assert (=> b!1559907 m!1436829))

(assert (=> b!1559907 m!1436829))

(assert (=> b!1559907 m!1436831))

(assert (=> start!133440 d!163169))

(declare-fun d!163171 () Bool)

(assert (=> d!163171 (= (inv!57465 lm!250) (isStrictlySorted!943 (toList!11257 lm!250)))))

(declare-fun bs!44785 () Bool)

(assert (= bs!44785 d!163171))

(assert (=> bs!44785 m!1436691))

(assert (=> start!133440 d!163171))

(declare-fun d!163173 () Bool)

(declare-fun res!1066179 () Bool)

(declare-fun e!869087 () Bool)

(assert (=> d!163173 (=> res!1066179 e!869087)))

(assert (=> d!163173 (= res!1066179 (or ((_ is Nil!36332) (toList!11257 lm!250)) ((_ is Nil!36332) (t!51054 (toList!11257 lm!250)))))))

(assert (=> d!163173 (= (isStrictlySorted!943 (toList!11257 lm!250)) e!869087)))

(declare-fun b!1559924 () Bool)

(declare-fun e!869088 () Bool)

(assert (=> b!1559924 (= e!869087 e!869088)))

(declare-fun res!1066180 () Bool)

(assert (=> b!1559924 (=> (not res!1066180) (not e!869088))))

(assert (=> b!1559924 (= res!1066180 (bvslt (_1!12498 (h!37795 (toList!11257 lm!250))) (_1!12498 (h!37795 (t!51054 (toList!11257 lm!250))))))))

(declare-fun b!1559925 () Bool)

(assert (=> b!1559925 (= e!869088 (isStrictlySorted!943 (t!51054 (toList!11257 lm!250))))))

(assert (= (and d!163173 (not res!1066179)) b!1559924))

(assert (= (and b!1559924 res!1066180) b!1559925))

(declare-fun m!1436845 () Bool)

(assert (=> b!1559925 m!1436845))

(assert (=> b!1559685 d!163173))

(declare-fun b!1559940 () Bool)

(declare-fun e!869097 () Bool)

(declare-fun tp!112505 () Bool)

(assert (=> b!1559940 (= e!869097 (and tp_is_empty!38377 tp!112505))))

(assert (=> b!1559687 (= tp!112494 e!869097)))

(assert (= (and b!1559687 ((_ is Cons!36331) (toList!11257 lm!250))) b!1559940))

(check-sat (not b!1559786) (not b!1559940) (not d!163147) (not b!1559840) (not b!1559838) (not d!163169) (not b!1559878) (not b!1559733) (not d!163159) (not d!163145) (not d!163129) tp_is_empty!38377 (not b!1559795) (not b!1559925) (not b!1559904) (not b!1559907) (not b!1559790) (not bm!71817) (not b!1559875) (not d!163171) (not b!1559905) (not b!1559903))
(check-sat)
