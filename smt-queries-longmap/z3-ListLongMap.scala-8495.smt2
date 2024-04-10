; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103514 () Bool)

(assert start!103514)

(declare-fun res!827760 () Bool)

(declare-fun e!703145 () Bool)

(assert (=> start!103514 (=> (not res!827760) (not e!703145))))

(declare-fun a1!66 () (_ BitVec 64))

(declare-fun a2!55 () (_ BitVec 64))

(assert (=> start!103514 (= res!827760 (not (= a1!66 a2!55)))))

(assert (=> start!103514 e!703145))

(assert (=> start!103514 true))

(declare-datatypes ((B!1798 0))(
  ( (B!1799 (val!15661 Int)) )
))
(declare-datatypes ((tuple2!20194 0))(
  ( (tuple2!20195 (_1!10108 (_ BitVec 64)) (_2!10108 B!1798)) )
))
(declare-datatypes ((List!27326 0))(
  ( (Nil!27323) (Cons!27322 (h!28531 tuple2!20194) (t!40789 List!27326)) )
))
(declare-datatypes ((ListLongMap!18163 0))(
  ( (ListLongMap!18164 (toList!9097 List!27326)) )
))
(declare-fun lm!211 () ListLongMap!18163)

(declare-fun e!703146 () Bool)

(declare-fun inv!42774 (ListLongMap!18163) Bool)

(assert (=> start!103514 (and (inv!42774 lm!211) e!703146)))

(declare-fun tp_is_empty!31197 () Bool)

(assert (=> start!103514 tp_is_empty!31197))

(declare-fun b!1240521 () Bool)

(declare-fun res!827761 () Bool)

(assert (=> b!1240521 (=> (not res!827761) (not e!703145))))

(declare-fun isStrictlySorted!734 (List!27326) Bool)

(assert (=> b!1240521 (= res!827761 (isStrictlySorted!734 (toList!9097 lm!211)))))

(declare-fun lt!561935 () tuple2!20194)

(declare-fun b!1240522 () Bool)

(declare-fun -!1986 (ListLongMap!18163 (_ BitVec 64)) ListLongMap!18163)

(declare-fun +!4133 (ListLongMap!18163 tuple2!20194) ListLongMap!18163)

(assert (=> b!1240522 (= e!703145 (not (= (-!1986 (+!4133 lm!211 lt!561935) a2!55) (+!4133 (-!1986 lm!211 a2!55) lt!561935))))))

(declare-fun b1!77 () B!1798)

(assert (=> b!1240522 (= lt!561935 (tuple2!20195 a1!66 b1!77))))

(declare-fun insertStrictlySorted!420 (List!27326 (_ BitVec 64) B!1798) List!27326)

(declare-fun removeStrictlySorted!113 (List!27326 (_ BitVec 64)) List!27326)

(assert (=> b!1240522 (= (insertStrictlySorted!420 (removeStrictlySorted!113 (toList!9097 lm!211) a2!55) a1!66 b1!77) (removeStrictlySorted!113 (insertStrictlySorted!420 (toList!9097 lm!211) a1!66 b1!77) a2!55))))

(declare-datatypes ((Unit!41233 0))(
  ( (Unit!41234) )
))
(declare-fun lt!561934 () Unit!41233)

(declare-fun lemmaInsertAndRemoveStrictlySortedCommutative!2 (List!27326 (_ BitVec 64) B!1798 (_ BitVec 64)) Unit!41233)

(assert (=> b!1240522 (= lt!561934 (lemmaInsertAndRemoveStrictlySortedCommutative!2 (toList!9097 lm!211) a1!66 b1!77 a2!55))))

(declare-fun b!1240523 () Bool)

(declare-fun tp!92540 () Bool)

(assert (=> b!1240523 (= e!703146 tp!92540)))

(assert (= (and start!103514 res!827760) b!1240521))

(assert (= (and b!1240521 res!827761) b!1240522))

(assert (= start!103514 b!1240523))

(declare-fun m!1143785 () Bool)

(assert (=> start!103514 m!1143785))

(declare-fun m!1143787 () Bool)

(assert (=> b!1240521 m!1143787))

(declare-fun m!1143789 () Bool)

(assert (=> b!1240522 m!1143789))

(declare-fun m!1143791 () Bool)

(assert (=> b!1240522 m!1143791))

(declare-fun m!1143793 () Bool)

(assert (=> b!1240522 m!1143793))

(declare-fun m!1143795 () Bool)

(assert (=> b!1240522 m!1143795))

(declare-fun m!1143797 () Bool)

(assert (=> b!1240522 m!1143797))

(declare-fun m!1143799 () Bool)

(assert (=> b!1240522 m!1143799))

(assert (=> b!1240522 m!1143793))

(declare-fun m!1143801 () Bool)

(assert (=> b!1240522 m!1143801))

(assert (=> b!1240522 m!1143789))

(assert (=> b!1240522 m!1143799))

(declare-fun m!1143803 () Bool)

(assert (=> b!1240522 m!1143803))

(assert (=> b!1240522 m!1143801))

(declare-fun m!1143805 () Bool)

(assert (=> b!1240522 m!1143805))

(check-sat (not b!1240521) (not b!1240523) tp_is_empty!31197 (not start!103514) (not b!1240522))
(check-sat)
(get-model)

(declare-fun d!136303 () Bool)

(declare-fun res!827778 () Bool)

(declare-fun e!703163 () Bool)

(assert (=> d!136303 (=> res!827778 e!703163)))

(get-info :version)

(assert (=> d!136303 (= res!827778 (or ((_ is Nil!27323) (toList!9097 lm!211)) ((_ is Nil!27323) (t!40789 (toList!9097 lm!211)))))))

(assert (=> d!136303 (= (isStrictlySorted!734 (toList!9097 lm!211)) e!703163)))

(declare-fun b!1240543 () Bool)

(declare-fun e!703164 () Bool)

(assert (=> b!1240543 (= e!703163 e!703164)))

(declare-fun res!827779 () Bool)

(assert (=> b!1240543 (=> (not res!827779) (not e!703164))))

(assert (=> b!1240543 (= res!827779 (bvslt (_1!10108 (h!28531 (toList!9097 lm!211))) (_1!10108 (h!28531 (t!40789 (toList!9097 lm!211))))))))

(declare-fun b!1240544 () Bool)

(assert (=> b!1240544 (= e!703164 (isStrictlySorted!734 (t!40789 (toList!9097 lm!211))))))

(assert (= (and d!136303 (not res!827778)) b!1240543))

(assert (= (and b!1240543 res!827779) b!1240544))

(declare-fun m!1143831 () Bool)

(assert (=> b!1240544 m!1143831))

(assert (=> b!1240521 d!136303))

(declare-fun d!136307 () Bool)

(declare-fun e!703179 () Bool)

(assert (=> d!136307 e!703179))

(declare-fun res!827790 () Bool)

(assert (=> d!136307 (=> (not res!827790) (not e!703179))))

(declare-fun lt!561953 () ListLongMap!18163)

(declare-fun contains!7378 (ListLongMap!18163 (_ BitVec 64)) Bool)

(assert (=> d!136307 (= res!827790 (contains!7378 lt!561953 (_1!10108 lt!561935)))))

(declare-fun lt!561954 () List!27326)

(assert (=> d!136307 (= lt!561953 (ListLongMap!18164 lt!561954))))

(declare-fun lt!561955 () Unit!41233)

(declare-fun lt!561952 () Unit!41233)

(assert (=> d!136307 (= lt!561955 lt!561952)))

(declare-datatypes ((Option!700 0))(
  ( (Some!699 (v!18370 B!1798)) (None!698) )
))
(declare-fun getValueByKey!649 (List!27326 (_ BitVec 64)) Option!700)

(assert (=> d!136307 (= (getValueByKey!649 lt!561954 (_1!10108 lt!561935)) (Some!699 (_2!10108 lt!561935)))))

(declare-fun lemmaContainsTupThenGetReturnValue!326 (List!27326 (_ BitVec 64) B!1798) Unit!41233)

(assert (=> d!136307 (= lt!561952 (lemmaContainsTupThenGetReturnValue!326 lt!561954 (_1!10108 lt!561935) (_2!10108 lt!561935)))))

(assert (=> d!136307 (= lt!561954 (insertStrictlySorted!420 (toList!9097 lm!211) (_1!10108 lt!561935) (_2!10108 lt!561935)))))

(assert (=> d!136307 (= (+!4133 lm!211 lt!561935) lt!561953)))

(declare-fun b!1240567 () Bool)

(declare-fun res!827791 () Bool)

(assert (=> b!1240567 (=> (not res!827791) (not e!703179))))

(assert (=> b!1240567 (= res!827791 (= (getValueByKey!649 (toList!9097 lt!561953) (_1!10108 lt!561935)) (Some!699 (_2!10108 lt!561935))))))

(declare-fun b!1240568 () Bool)

(declare-fun contains!7380 (List!27326 tuple2!20194) Bool)

(assert (=> b!1240568 (= e!703179 (contains!7380 (toList!9097 lt!561953) lt!561935))))

(assert (= (and d!136307 res!827790) b!1240567))

(assert (= (and b!1240567 res!827791) b!1240568))

(declare-fun m!1143835 () Bool)

(assert (=> d!136307 m!1143835))

(declare-fun m!1143837 () Bool)

(assert (=> d!136307 m!1143837))

(declare-fun m!1143839 () Bool)

(assert (=> d!136307 m!1143839))

(declare-fun m!1143841 () Bool)

(assert (=> d!136307 m!1143841))

(declare-fun m!1143843 () Bool)

(assert (=> b!1240567 m!1143843))

(declare-fun m!1143845 () Bool)

(assert (=> b!1240568 m!1143845))

(assert (=> b!1240522 d!136307))

(declare-fun b!1240647 () Bool)

(declare-fun e!703224 () List!27326)

(declare-fun e!703222 () List!27326)

(assert (=> b!1240647 (= e!703224 e!703222)))

(declare-fun c!121255 () Bool)

(assert (=> b!1240647 (= c!121255 (and ((_ is Cons!27322) (removeStrictlySorted!113 (toList!9097 lm!211) a2!55)) (= (_1!10108 (h!28531 (removeStrictlySorted!113 (toList!9097 lm!211) a2!55))) a1!66)))))

(declare-fun c!121256 () Bool)

(declare-fun b!1240648 () Bool)

(assert (=> b!1240648 (= c!121256 (and ((_ is Cons!27322) (removeStrictlySorted!113 (toList!9097 lm!211) a2!55)) (bvsgt (_1!10108 (h!28531 (removeStrictlySorted!113 (toList!9097 lm!211) a2!55))) a1!66)))))

(declare-fun e!703221 () List!27326)

(assert (=> b!1240648 (= e!703222 e!703221)))

(declare-fun e!703220 () List!27326)

(declare-fun b!1240649 () Bool)

(assert (=> b!1240649 (= e!703220 (insertStrictlySorted!420 (t!40789 (removeStrictlySorted!113 (toList!9097 lm!211) a2!55)) a1!66 b1!77))))

(declare-fun b!1240650 () Bool)

(assert (=> b!1240650 (= e!703220 (ite c!121255 (t!40789 (removeStrictlySorted!113 (toList!9097 lm!211) a2!55)) (ite c!121256 (Cons!27322 (h!28531 (removeStrictlySorted!113 (toList!9097 lm!211) a2!55)) (t!40789 (removeStrictlySorted!113 (toList!9097 lm!211) a2!55))) Nil!27323)))))

(declare-fun b!1240651 () Bool)

(declare-fun res!827810 () Bool)

(declare-fun e!703223 () Bool)

(assert (=> b!1240651 (=> (not res!827810) (not e!703223))))

(declare-fun lt!561967 () List!27326)

(declare-fun containsKey!598 (List!27326 (_ BitVec 64)) Bool)

(assert (=> b!1240651 (= res!827810 (containsKey!598 lt!561967 a1!66))))

(declare-fun bm!61151 () Bool)

(declare-fun call!61156 () List!27326)

(declare-fun call!61155 () List!27326)

(assert (=> bm!61151 (= call!61156 call!61155)))

(declare-fun call!61154 () List!27326)

(declare-fun bm!61152 () Bool)

(declare-fun c!121254 () Bool)

(declare-fun $colon$colon!612 (List!27326 tuple2!20194) List!27326)

(assert (=> bm!61152 (= call!61154 ($colon$colon!612 e!703220 (ite c!121254 (h!28531 (removeStrictlySorted!113 (toList!9097 lm!211) a2!55)) (tuple2!20195 a1!66 b1!77))))))

(declare-fun c!121253 () Bool)

(assert (=> bm!61152 (= c!121253 c!121254)))

(declare-fun b!1240652 () Bool)

(assert (=> b!1240652 (= e!703223 (contains!7380 lt!561967 (tuple2!20195 a1!66 b1!77)))))

(declare-fun bm!61153 () Bool)

(assert (=> bm!61153 (= call!61155 call!61154)))

(declare-fun d!136313 () Bool)

(assert (=> d!136313 e!703223))

(declare-fun res!827811 () Bool)

(assert (=> d!136313 (=> (not res!827811) (not e!703223))))

(assert (=> d!136313 (= res!827811 (isStrictlySorted!734 lt!561967))))

(assert (=> d!136313 (= lt!561967 e!703224)))

(assert (=> d!136313 (= c!121254 (and ((_ is Cons!27322) (removeStrictlySorted!113 (toList!9097 lm!211) a2!55)) (bvslt (_1!10108 (h!28531 (removeStrictlySorted!113 (toList!9097 lm!211) a2!55))) a1!66)))))

(assert (=> d!136313 (isStrictlySorted!734 (removeStrictlySorted!113 (toList!9097 lm!211) a2!55))))

(assert (=> d!136313 (= (insertStrictlySorted!420 (removeStrictlySorted!113 (toList!9097 lm!211) a2!55) a1!66 b1!77) lt!561967)))

(declare-fun b!1240653 () Bool)

(assert (=> b!1240653 (= e!703224 call!61154)))

(declare-fun b!1240654 () Bool)

(assert (=> b!1240654 (= e!703222 call!61155)))

(declare-fun b!1240655 () Bool)

(assert (=> b!1240655 (= e!703221 call!61156)))

(declare-fun b!1240656 () Bool)

(assert (=> b!1240656 (= e!703221 call!61156)))

(assert (= (and d!136313 c!121254) b!1240653))

(assert (= (and d!136313 (not c!121254)) b!1240647))

(assert (= (and b!1240647 c!121255) b!1240654))

(assert (= (and b!1240647 (not c!121255)) b!1240648))

(assert (= (and b!1240648 c!121256) b!1240656))

(assert (= (and b!1240648 (not c!121256)) b!1240655))

(assert (= (or b!1240656 b!1240655) bm!61151))

(assert (= (or b!1240654 bm!61151) bm!61153))

(assert (= (or b!1240653 bm!61153) bm!61152))

(assert (= (and bm!61152 c!121253) b!1240649))

(assert (= (and bm!61152 (not c!121253)) b!1240650))

(assert (= (and d!136313 res!827811) b!1240651))

(assert (= (and b!1240651 res!827810) b!1240652))

(declare-fun m!1143873 () Bool)

(assert (=> b!1240649 m!1143873))

(declare-fun m!1143875 () Bool)

(assert (=> bm!61152 m!1143875))

(declare-fun m!1143877 () Bool)

(assert (=> b!1240652 m!1143877))

(declare-fun m!1143879 () Bool)

(assert (=> b!1240651 m!1143879))

(declare-fun m!1143881 () Bool)

(assert (=> d!136313 m!1143881))

(assert (=> d!136313 m!1143793))

(declare-fun m!1143885 () Bool)

(assert (=> d!136313 m!1143885))

(assert (=> b!1240522 d!136313))

(declare-fun d!136321 () Bool)

(declare-fun lt!561975 () ListLongMap!18163)

(assert (=> d!136321 (not (contains!7378 lt!561975 a2!55))))

(assert (=> d!136321 (= lt!561975 (ListLongMap!18164 (removeStrictlySorted!113 (toList!9097 lm!211) a2!55)))))

(assert (=> d!136321 (= (-!1986 lm!211 a2!55) lt!561975)))

(declare-fun bs!34915 () Bool)

(assert (= bs!34915 d!136321))

(declare-fun m!1143905 () Bool)

(assert (=> bs!34915 m!1143905))

(assert (=> bs!34915 m!1143793))

(assert (=> b!1240522 d!136321))

(declare-fun b!1240681 () Bool)

(declare-fun e!703241 () Bool)

(declare-fun lt!561986 () List!27326)

(assert (=> b!1240681 (= e!703241 (not (containsKey!598 lt!561986 a2!55)))))

(declare-fun d!136329 () Bool)

(assert (=> d!136329 e!703241))

(declare-fun res!827820 () Bool)

(assert (=> d!136329 (=> (not res!827820) (not e!703241))))

(assert (=> d!136329 (= res!827820 (isStrictlySorted!734 lt!561986))))

(declare-fun e!703240 () List!27326)

(assert (=> d!136329 (= lt!561986 e!703240)))

(declare-fun c!121266 () Bool)

(assert (=> d!136329 (= c!121266 (and ((_ is Cons!27322) (insertStrictlySorted!420 (toList!9097 lm!211) a1!66 b1!77)) (= (_1!10108 (h!28531 (insertStrictlySorted!420 (toList!9097 lm!211) a1!66 b1!77))) a2!55)))))

(assert (=> d!136329 (isStrictlySorted!734 (insertStrictlySorted!420 (toList!9097 lm!211) a1!66 b1!77))))

(assert (=> d!136329 (= (removeStrictlySorted!113 (insertStrictlySorted!420 (toList!9097 lm!211) a1!66 b1!77) a2!55) lt!561986)))

(declare-fun b!1240682 () Bool)

(declare-fun e!703239 () List!27326)

(assert (=> b!1240682 (= e!703239 Nil!27323)))

(declare-fun b!1240683 () Bool)

(assert (=> b!1240683 (= e!703240 (t!40789 (insertStrictlySorted!420 (toList!9097 lm!211) a1!66 b1!77)))))

(declare-fun b!1240684 () Bool)

(assert (=> b!1240684 (= e!703239 ($colon$colon!612 (removeStrictlySorted!113 (t!40789 (insertStrictlySorted!420 (toList!9097 lm!211) a1!66 b1!77)) a2!55) (h!28531 (insertStrictlySorted!420 (toList!9097 lm!211) a1!66 b1!77))))))

(declare-fun b!1240685 () Bool)

(assert (=> b!1240685 (= e!703240 e!703239)))

(declare-fun c!121265 () Bool)

(assert (=> b!1240685 (= c!121265 (and ((_ is Cons!27322) (insertStrictlySorted!420 (toList!9097 lm!211) a1!66 b1!77)) (not (= (_1!10108 (h!28531 (insertStrictlySorted!420 (toList!9097 lm!211) a1!66 b1!77))) a2!55))))))

(assert (= (and d!136329 c!121266) b!1240683))

(assert (= (and d!136329 (not c!121266)) b!1240685))

(assert (= (and b!1240685 c!121265) b!1240684))

(assert (= (and b!1240685 (not c!121265)) b!1240682))

(assert (= (and d!136329 res!827820) b!1240681))

(declare-fun m!1143907 () Bool)

(assert (=> b!1240681 m!1143907))

(declare-fun m!1143909 () Bool)

(assert (=> d!136329 m!1143909))

(assert (=> d!136329 m!1143799))

(declare-fun m!1143911 () Bool)

(assert (=> d!136329 m!1143911))

(declare-fun m!1143913 () Bool)

(assert (=> b!1240684 m!1143913))

(assert (=> b!1240684 m!1143913))

(declare-fun m!1143919 () Bool)

(assert (=> b!1240684 m!1143919))

(assert (=> b!1240522 d!136329))

(declare-fun b!1240688 () Bool)

(declare-fun e!703245 () Bool)

(declare-fun lt!561999 () List!27326)

(assert (=> b!1240688 (= e!703245 (not (containsKey!598 lt!561999 a2!55)))))

(declare-fun d!136331 () Bool)

(assert (=> d!136331 e!703245))

(declare-fun res!827823 () Bool)

(assert (=> d!136331 (=> (not res!827823) (not e!703245))))

(assert (=> d!136331 (= res!827823 (isStrictlySorted!734 lt!561999))))

(declare-fun e!703244 () List!27326)

(assert (=> d!136331 (= lt!561999 e!703244)))

(declare-fun c!121268 () Bool)

(assert (=> d!136331 (= c!121268 (and ((_ is Cons!27322) (toList!9097 lm!211)) (= (_1!10108 (h!28531 (toList!9097 lm!211))) a2!55)))))

(assert (=> d!136331 (isStrictlySorted!734 (toList!9097 lm!211))))

(assert (=> d!136331 (= (removeStrictlySorted!113 (toList!9097 lm!211) a2!55) lt!561999)))

(declare-fun b!1240689 () Bool)

(declare-fun e!703243 () List!27326)

(assert (=> b!1240689 (= e!703243 Nil!27323)))

(declare-fun b!1240690 () Bool)

(assert (=> b!1240690 (= e!703244 (t!40789 (toList!9097 lm!211)))))

(declare-fun b!1240691 () Bool)

(assert (=> b!1240691 (= e!703243 ($colon$colon!612 (removeStrictlySorted!113 (t!40789 (toList!9097 lm!211)) a2!55) (h!28531 (toList!9097 lm!211))))))

(declare-fun b!1240692 () Bool)

(assert (=> b!1240692 (= e!703244 e!703243)))

(declare-fun c!121267 () Bool)

(assert (=> b!1240692 (= c!121267 (and ((_ is Cons!27322) (toList!9097 lm!211)) (not (= (_1!10108 (h!28531 (toList!9097 lm!211))) a2!55))))))

(assert (= (and d!136331 c!121268) b!1240690))

(assert (= (and d!136331 (not c!121268)) b!1240692))

(assert (= (and b!1240692 c!121267) b!1240691))

(assert (= (and b!1240692 (not c!121267)) b!1240689))

(assert (= (and d!136331 res!827823) b!1240688))

(declare-fun m!1143933 () Bool)

(assert (=> b!1240688 m!1143933))

(declare-fun m!1143935 () Bool)

(assert (=> d!136331 m!1143935))

(assert (=> d!136331 m!1143787))

(declare-fun m!1143937 () Bool)

(assert (=> b!1240691 m!1143937))

(assert (=> b!1240691 m!1143937))

(declare-fun m!1143939 () Bool)

(assert (=> b!1240691 m!1143939))

(assert (=> b!1240522 d!136331))

(declare-fun d!136337 () Bool)

(declare-fun e!703249 () Bool)

(assert (=> d!136337 e!703249))

(declare-fun res!827830 () Bool)

(assert (=> d!136337 (=> (not res!827830) (not e!703249))))

(declare-fun lt!562006 () ListLongMap!18163)

(assert (=> d!136337 (= res!827830 (contains!7378 lt!562006 (_1!10108 lt!561935)))))

(declare-fun lt!562007 () List!27326)

(assert (=> d!136337 (= lt!562006 (ListLongMap!18164 lt!562007))))

(declare-fun lt!562008 () Unit!41233)

(declare-fun lt!562005 () Unit!41233)

(assert (=> d!136337 (= lt!562008 lt!562005)))

(assert (=> d!136337 (= (getValueByKey!649 lt!562007 (_1!10108 lt!561935)) (Some!699 (_2!10108 lt!561935)))))

(assert (=> d!136337 (= lt!562005 (lemmaContainsTupThenGetReturnValue!326 lt!562007 (_1!10108 lt!561935) (_2!10108 lt!561935)))))

(assert (=> d!136337 (= lt!562007 (insertStrictlySorted!420 (toList!9097 (-!1986 lm!211 a2!55)) (_1!10108 lt!561935) (_2!10108 lt!561935)))))

(assert (=> d!136337 (= (+!4133 (-!1986 lm!211 a2!55) lt!561935) lt!562006)))

(declare-fun b!1240699 () Bool)

(declare-fun res!827831 () Bool)

(assert (=> b!1240699 (=> (not res!827831) (not e!703249))))

(assert (=> b!1240699 (= res!827831 (= (getValueByKey!649 (toList!9097 lt!562006) (_1!10108 lt!561935)) (Some!699 (_2!10108 lt!561935))))))

(declare-fun b!1240700 () Bool)

(assert (=> b!1240700 (= e!703249 (contains!7380 (toList!9097 lt!562006) lt!561935))))

(assert (= (and d!136337 res!827830) b!1240699))

(assert (= (and b!1240699 res!827831) b!1240700))

(declare-fun m!1143953 () Bool)

(assert (=> d!136337 m!1143953))

(declare-fun m!1143955 () Bool)

(assert (=> d!136337 m!1143955))

(declare-fun m!1143957 () Bool)

(assert (=> d!136337 m!1143957))

(declare-fun m!1143959 () Bool)

(assert (=> d!136337 m!1143959))

(declare-fun m!1143961 () Bool)

(assert (=> b!1240699 m!1143961))

(declare-fun m!1143963 () Bool)

(assert (=> b!1240700 m!1143963))

(assert (=> b!1240522 d!136337))

(declare-fun d!136341 () Bool)

(declare-fun lt!562010 () ListLongMap!18163)

(assert (=> d!136341 (not (contains!7378 lt!562010 a2!55))))

(assert (=> d!136341 (= lt!562010 (ListLongMap!18164 (removeStrictlySorted!113 (toList!9097 (+!4133 lm!211 lt!561935)) a2!55)))))

(assert (=> d!136341 (= (-!1986 (+!4133 lm!211 lt!561935) a2!55) lt!562010)))

(declare-fun bs!34917 () Bool)

(assert (= bs!34917 d!136341))

(declare-fun m!1143965 () Bool)

(assert (=> bs!34917 m!1143965))

(declare-fun m!1143967 () Bool)

(assert (=> bs!34917 m!1143967))

(assert (=> b!1240522 d!136341))

(declare-fun b!1240711 () Bool)

(declare-fun e!703259 () List!27326)

(declare-fun e!703257 () List!27326)

(assert (=> b!1240711 (= e!703259 e!703257)))

(declare-fun c!121275 () Bool)

(assert (=> b!1240711 (= c!121275 (and ((_ is Cons!27322) (toList!9097 lm!211)) (= (_1!10108 (h!28531 (toList!9097 lm!211))) a1!66)))))

(declare-fun b!1240712 () Bool)

(declare-fun c!121276 () Bool)

(assert (=> b!1240712 (= c!121276 (and ((_ is Cons!27322) (toList!9097 lm!211)) (bvsgt (_1!10108 (h!28531 (toList!9097 lm!211))) a1!66)))))

(declare-fun e!703256 () List!27326)

(assert (=> b!1240712 (= e!703257 e!703256)))

(declare-fun b!1240713 () Bool)

(declare-fun e!703255 () List!27326)

(assert (=> b!1240713 (= e!703255 (insertStrictlySorted!420 (t!40789 (toList!9097 lm!211)) a1!66 b1!77))))

(declare-fun b!1240714 () Bool)

(assert (=> b!1240714 (= e!703255 (ite c!121275 (t!40789 (toList!9097 lm!211)) (ite c!121276 (Cons!27322 (h!28531 (toList!9097 lm!211)) (t!40789 (toList!9097 lm!211))) Nil!27323)))))

(declare-fun b!1240715 () Bool)

(declare-fun res!827834 () Bool)

(declare-fun e!703258 () Bool)

(assert (=> b!1240715 (=> (not res!827834) (not e!703258))))

(declare-fun lt!562011 () List!27326)

(assert (=> b!1240715 (= res!827834 (containsKey!598 lt!562011 a1!66))))

(declare-fun bm!61157 () Bool)

(declare-fun call!61162 () List!27326)

(declare-fun call!61161 () List!27326)

(assert (=> bm!61157 (= call!61162 call!61161)))

(declare-fun call!61160 () List!27326)

(declare-fun c!121274 () Bool)

(declare-fun bm!61158 () Bool)

(assert (=> bm!61158 (= call!61160 ($colon$colon!612 e!703255 (ite c!121274 (h!28531 (toList!9097 lm!211)) (tuple2!20195 a1!66 b1!77))))))

(declare-fun c!121273 () Bool)

(assert (=> bm!61158 (= c!121273 c!121274)))

(declare-fun b!1240716 () Bool)

(assert (=> b!1240716 (= e!703258 (contains!7380 lt!562011 (tuple2!20195 a1!66 b1!77)))))

(declare-fun bm!61159 () Bool)

(assert (=> bm!61159 (= call!61161 call!61160)))

(declare-fun d!136343 () Bool)

(assert (=> d!136343 e!703258))

(declare-fun res!827835 () Bool)

(assert (=> d!136343 (=> (not res!827835) (not e!703258))))

(assert (=> d!136343 (= res!827835 (isStrictlySorted!734 lt!562011))))

(assert (=> d!136343 (= lt!562011 e!703259)))

(assert (=> d!136343 (= c!121274 (and ((_ is Cons!27322) (toList!9097 lm!211)) (bvslt (_1!10108 (h!28531 (toList!9097 lm!211))) a1!66)))))

(assert (=> d!136343 (isStrictlySorted!734 (toList!9097 lm!211))))

(assert (=> d!136343 (= (insertStrictlySorted!420 (toList!9097 lm!211) a1!66 b1!77) lt!562011)))

(declare-fun b!1240717 () Bool)

(assert (=> b!1240717 (= e!703259 call!61160)))

(declare-fun b!1240718 () Bool)

(assert (=> b!1240718 (= e!703257 call!61161)))

(declare-fun b!1240719 () Bool)

(assert (=> b!1240719 (= e!703256 call!61162)))

(declare-fun b!1240720 () Bool)

(assert (=> b!1240720 (= e!703256 call!61162)))

(assert (= (and d!136343 c!121274) b!1240717))

(assert (= (and d!136343 (not c!121274)) b!1240711))

(assert (= (and b!1240711 c!121275) b!1240718))

(assert (= (and b!1240711 (not c!121275)) b!1240712))

(assert (= (and b!1240712 c!121276) b!1240720))

(assert (= (and b!1240712 (not c!121276)) b!1240719))

(assert (= (or b!1240720 b!1240719) bm!61157))

(assert (= (or b!1240718 bm!61157) bm!61159))

(assert (= (or b!1240717 bm!61159) bm!61158))

(assert (= (and bm!61158 c!121273) b!1240713))

(assert (= (and bm!61158 (not c!121273)) b!1240714))

(assert (= (and d!136343 res!827835) b!1240715))

(assert (= (and b!1240715 res!827834) b!1240716))

(declare-fun m!1143979 () Bool)

(assert (=> b!1240713 m!1143979))

(declare-fun m!1143981 () Bool)

(assert (=> bm!61158 m!1143981))

(declare-fun m!1143983 () Bool)

(assert (=> b!1240716 m!1143983))

(declare-fun m!1143985 () Bool)

(assert (=> b!1240715 m!1143985))

(declare-fun m!1143987 () Bool)

(assert (=> d!136343 m!1143987))

(assert (=> d!136343 m!1143787))

(assert (=> b!1240522 d!136343))

(declare-fun d!136347 () Bool)

(assert (=> d!136347 (= (insertStrictlySorted!420 (removeStrictlySorted!113 (toList!9097 lm!211) a2!55) a1!66 b1!77) (removeStrictlySorted!113 (insertStrictlySorted!420 (toList!9097 lm!211) a1!66 b1!77) a2!55))))

(declare-fun lt!562021 () Unit!41233)

(declare-fun choose!1833 (List!27326 (_ BitVec 64) B!1798 (_ BitVec 64)) Unit!41233)

(assert (=> d!136347 (= lt!562021 (choose!1833 (toList!9097 lm!211) a1!66 b1!77 a2!55))))

(assert (=> d!136347 (not (= a1!66 a2!55))))

(assert (=> d!136347 (= (lemmaInsertAndRemoveStrictlySortedCommutative!2 (toList!9097 lm!211) a1!66 b1!77 a2!55) lt!562021)))

(declare-fun bs!34919 () Bool)

(assert (= bs!34919 d!136347))

(assert (=> bs!34919 m!1143799))

(assert (=> bs!34919 m!1143799))

(assert (=> bs!34919 m!1143803))

(assert (=> bs!34919 m!1143793))

(assert (=> bs!34919 m!1143795))

(declare-fun m!1144003 () Bool)

(assert (=> bs!34919 m!1144003))

(assert (=> bs!34919 m!1143793))

(assert (=> b!1240522 d!136347))

(declare-fun d!136353 () Bool)

(assert (=> d!136353 (= (inv!42774 lm!211) (isStrictlySorted!734 (toList!9097 lm!211)))))

(declare-fun bs!34921 () Bool)

(assert (= bs!34921 d!136353))

(assert (=> bs!34921 m!1143787))

(assert (=> start!103514 d!136353))

(declare-fun b!1240732 () Bool)

(declare-fun e!703266 () Bool)

(declare-fun tp!92549 () Bool)

(assert (=> b!1240732 (= e!703266 (and tp_is_empty!31197 tp!92549))))

(assert (=> b!1240523 (= tp!92540 e!703266)))

(assert (= (and b!1240523 ((_ is Cons!27322) (toList!9097 lm!211))) b!1240732))

(check-sat (not d!136321) (not d!136347) (not b!1240684) (not bm!61158) (not b!1240713) (not b!1240544) (not d!136329) (not b!1240652) (not b!1240567) (not b!1240568) (not d!136307) (not d!136353) (not d!136343) (not d!136331) (not d!136341) (not bm!61152) (not b!1240651) (not b!1240688) (not b!1240732) (not b!1240691) (not b!1240715) (not b!1240699) (not b!1240681) (not d!136337) (not b!1240649) (not b!1240716) (not b!1240700) tp_is_empty!31197 (not d!136313))
(check-sat)
