; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103748 () Bool)

(assert start!103748)

(declare-fun res!828288 () Bool)

(declare-fun e!704002 () Bool)

(assert (=> start!103748 (=> (not res!828288) (not e!704002))))

(declare-fun a1!66 () (_ BitVec 64))

(declare-fun a2!55 () (_ BitVec 64))

(assert (=> start!103748 (= res!828288 (not (= a1!66 a2!55)))))

(assert (=> start!103748 e!704002))

(assert (=> start!103748 true))

(declare-datatypes ((B!1796 0))(
  ( (B!1797 (val!15660 Int)) )
))
(declare-datatypes ((tuple2!20208 0))(
  ( (tuple2!20209 (_1!10115 (_ BitVec 64)) (_2!10115 B!1796)) )
))
(declare-datatypes ((List!27350 0))(
  ( (Nil!27347) (Cons!27346 (h!28564 tuple2!20208) (t!40805 List!27350)) )
))
(declare-datatypes ((ListLongMap!18185 0))(
  ( (ListLongMap!18186 (toList!9108 List!27350)) )
))
(declare-fun lm!211 () ListLongMap!18185)

(declare-fun e!704003 () Bool)

(declare-fun inv!42773 (ListLongMap!18185) Bool)

(assert (=> start!103748 (and (inv!42773 lm!211) e!704003)))

(declare-fun tp_is_empty!31195 () Bool)

(assert (=> start!103748 tp_is_empty!31195))

(declare-fun b!1241836 () Bool)

(declare-fun res!828287 () Bool)

(assert (=> b!1241836 (=> (not res!828287) (not e!704002))))

(declare-fun isStrictlySorted!721 (List!27350) Bool)

(assert (=> b!1241836 (= res!828287 (isStrictlySorted!721 (toList!9108 lm!211)))))

(declare-fun b!1241837 () Bool)

(declare-fun lt!562415 () tuple2!20208)

(declare-fun -!1967 (ListLongMap!18185 (_ BitVec 64)) ListLongMap!18185)

(declare-fun +!4189 (ListLongMap!18185 tuple2!20208) ListLongMap!18185)

(assert (=> b!1241837 (= e!704002 (not (= (-!1967 (+!4189 lm!211 lt!562415) a2!55) (+!4189 (-!1967 lm!211 a2!55) lt!562415))))))

(declare-fun b1!77 () B!1796)

(assert (=> b!1241837 (= lt!562415 (tuple2!20209 a1!66 b1!77))))

(declare-fun insertStrictlySorted!420 (List!27350 (_ BitVec 64) B!1796) List!27350)

(declare-fun removeStrictlySorted!111 (List!27350 (_ BitVec 64)) List!27350)

(assert (=> b!1241837 (= (insertStrictlySorted!420 (removeStrictlySorted!111 (toList!9108 lm!211) a2!55) a1!66 b1!77) (removeStrictlySorted!111 (insertStrictlySorted!420 (toList!9108 lm!211) a1!66 b1!77) a2!55))))

(declare-datatypes ((Unit!41204 0))(
  ( (Unit!41205) )
))
(declare-fun lt!562414 () Unit!41204)

(declare-fun lemmaInsertAndRemoveStrictlySortedCommutative!1 (List!27350 (_ BitVec 64) B!1796 (_ BitVec 64)) Unit!41204)

(assert (=> b!1241837 (= lt!562414 (lemmaInsertAndRemoveStrictlySortedCommutative!1 (toList!9108 lm!211) a1!66 b1!77 a2!55))))

(declare-fun b!1241838 () Bool)

(declare-fun tp!92537 () Bool)

(assert (=> b!1241838 (= e!704003 tp!92537)))

(assert (= (and start!103748 res!828288) b!1241836))

(assert (= (and b!1241836 res!828287) b!1241837))

(assert (= start!103748 b!1241838))

(declare-fun m!1145405 () Bool)

(assert (=> start!103748 m!1145405))

(declare-fun m!1145407 () Bool)

(assert (=> b!1241836 m!1145407))

(declare-fun m!1145409 () Bool)

(assert (=> b!1241837 m!1145409))

(declare-fun m!1145411 () Bool)

(assert (=> b!1241837 m!1145411))

(declare-fun m!1145413 () Bool)

(assert (=> b!1241837 m!1145413))

(declare-fun m!1145415 () Bool)

(assert (=> b!1241837 m!1145415))

(declare-fun m!1145417 () Bool)

(assert (=> b!1241837 m!1145417))

(assert (=> b!1241837 m!1145409))

(declare-fun m!1145419 () Bool)

(assert (=> b!1241837 m!1145419))

(assert (=> b!1241837 m!1145419))

(declare-fun m!1145421 () Bool)

(assert (=> b!1241837 m!1145421))

(assert (=> b!1241837 m!1145415))

(declare-fun m!1145423 () Bool)

(assert (=> b!1241837 m!1145423))

(assert (=> b!1241837 m!1145417))

(declare-fun m!1145425 () Bool)

(assert (=> b!1241837 m!1145425))

(check-sat (not b!1241836) (not b!1241837) tp_is_empty!31195 (not start!103748) (not b!1241838))
(check-sat)
(get-model)

(declare-fun e!704044 () List!27350)

(declare-fun b!1241908 () Bool)

(assert (=> b!1241908 (= e!704044 (insertStrictlySorted!420 (t!40805 (removeStrictlySorted!111 (toList!9108 lm!211) a2!55)) a1!66 b1!77))))

(declare-fun b!1241909 () Bool)

(declare-fun res!828312 () Bool)

(declare-fun e!704041 () Bool)

(assert (=> b!1241909 (=> (not res!828312) (not e!704041))))

(declare-fun lt!562433 () List!27350)

(declare-fun containsKey!599 (List!27350 (_ BitVec 64)) Bool)

(assert (=> b!1241909 (= res!828312 (containsKey!599 lt!562433 a1!66))))

(declare-fun bm!61210 () Bool)

(declare-fun call!61214 () List!27350)

(declare-fun call!61213 () List!27350)

(assert (=> bm!61210 (= call!61214 call!61213)))

(declare-fun bm!61211 () Bool)

(declare-fun c!121641 () Bool)

(declare-fun $colon$colon!612 (List!27350 tuple2!20208) List!27350)

(assert (=> bm!61211 (= call!61213 ($colon$colon!612 e!704044 (ite c!121641 (h!28564 (removeStrictlySorted!111 (toList!9108 lm!211) a2!55)) (tuple2!20209 a1!66 b1!77))))))

(declare-fun c!121640 () Bool)

(assert (=> bm!61211 (= c!121640 c!121641)))

(declare-fun c!121643 () Bool)

(declare-fun b!1241910 () Bool)

(get-info :version)

(assert (=> b!1241910 (= c!121643 (and ((_ is Cons!27346) (removeStrictlySorted!111 (toList!9108 lm!211) a2!55)) (bvsgt (_1!10115 (h!28564 (removeStrictlySorted!111 (toList!9108 lm!211) a2!55))) a1!66)))))

(declare-fun e!704045 () List!27350)

(declare-fun e!704042 () List!27350)

(assert (=> b!1241910 (= e!704045 e!704042)))

(declare-fun b!1241911 () Bool)

(declare-fun call!61215 () List!27350)

(assert (=> b!1241911 (= e!704042 call!61215)))

(declare-fun b!1241912 () Bool)

(declare-fun e!704043 () List!27350)

(assert (=> b!1241912 (= e!704043 e!704045)))

(declare-fun c!121642 () Bool)

(assert (=> b!1241912 (= c!121642 (and ((_ is Cons!27346) (removeStrictlySorted!111 (toList!9108 lm!211) a2!55)) (= (_1!10115 (h!28564 (removeStrictlySorted!111 (toList!9108 lm!211) a2!55))) a1!66)))))

(declare-fun b!1241913 () Bool)

(declare-fun contains!7412 (List!27350 tuple2!20208) Bool)

(assert (=> b!1241913 (= e!704041 (contains!7412 lt!562433 (tuple2!20209 a1!66 b1!77)))))

(declare-fun b!1241914 () Bool)

(assert (=> b!1241914 (= e!704044 (ite c!121642 (t!40805 (removeStrictlySorted!111 (toList!9108 lm!211) a2!55)) (ite c!121643 (Cons!27346 (h!28564 (removeStrictlySorted!111 (toList!9108 lm!211) a2!55)) (t!40805 (removeStrictlySorted!111 (toList!9108 lm!211) a2!55))) Nil!27347)))))

(declare-fun b!1241915 () Bool)

(assert (=> b!1241915 (= e!704045 call!61214)))

(declare-fun b!1241907 () Bool)

(assert (=> b!1241907 (= e!704043 call!61213)))

(declare-fun d!136767 () Bool)

(assert (=> d!136767 e!704041))

(declare-fun res!828311 () Bool)

(assert (=> d!136767 (=> (not res!828311) (not e!704041))))

(assert (=> d!136767 (= res!828311 (isStrictlySorted!721 lt!562433))))

(assert (=> d!136767 (= lt!562433 e!704043)))

(assert (=> d!136767 (= c!121641 (and ((_ is Cons!27346) (removeStrictlySorted!111 (toList!9108 lm!211) a2!55)) (bvslt (_1!10115 (h!28564 (removeStrictlySorted!111 (toList!9108 lm!211) a2!55))) a1!66)))))

(assert (=> d!136767 (isStrictlySorted!721 (removeStrictlySorted!111 (toList!9108 lm!211) a2!55))))

(assert (=> d!136767 (= (insertStrictlySorted!420 (removeStrictlySorted!111 (toList!9108 lm!211) a2!55) a1!66 b1!77) lt!562433)))

(declare-fun bm!61212 () Bool)

(assert (=> bm!61212 (= call!61215 call!61214)))

(declare-fun b!1241916 () Bool)

(assert (=> b!1241916 (= e!704042 call!61215)))

(assert (= (and d!136767 c!121641) b!1241907))

(assert (= (and d!136767 (not c!121641)) b!1241912))

(assert (= (and b!1241912 c!121642) b!1241915))

(assert (= (and b!1241912 (not c!121642)) b!1241910))

(assert (= (and b!1241910 c!121643) b!1241911))

(assert (= (and b!1241910 (not c!121643)) b!1241916))

(assert (= (or b!1241911 b!1241916) bm!61212))

(assert (= (or b!1241915 bm!61212) bm!61210))

(assert (= (or b!1241907 bm!61210) bm!61211))

(assert (= (and bm!61211 c!121640) b!1241908))

(assert (= (and bm!61211 (not c!121640)) b!1241914))

(assert (= (and d!136767 res!828311) b!1241909))

(assert (= (and b!1241909 res!828312) b!1241913))

(declare-fun m!1145483 () Bool)

(assert (=> b!1241909 m!1145483))

(declare-fun m!1145485 () Bool)

(assert (=> d!136767 m!1145485))

(assert (=> d!136767 m!1145409))

(declare-fun m!1145487 () Bool)

(assert (=> d!136767 m!1145487))

(declare-fun m!1145489 () Bool)

(assert (=> b!1241908 m!1145489))

(declare-fun m!1145491 () Bool)

(assert (=> bm!61211 m!1145491))

(declare-fun m!1145493 () Bool)

(assert (=> b!1241913 m!1145493))

(assert (=> b!1241837 d!136767))

(declare-fun d!136773 () Bool)

(declare-fun e!704059 () Bool)

(assert (=> d!136773 e!704059))

(declare-fun res!828324 () Bool)

(assert (=> d!136773 (=> (not res!828324) (not e!704059))))

(declare-fun lt!562456 () ListLongMap!18185)

(declare-fun contains!7415 (ListLongMap!18185 (_ BitVec 64)) Bool)

(assert (=> d!136773 (= res!828324 (contains!7415 lt!562456 (_1!10115 lt!562415)))))

(declare-fun lt!562457 () List!27350)

(assert (=> d!136773 (= lt!562456 (ListLongMap!18186 lt!562457))))

(declare-fun lt!562458 () Unit!41204)

(declare-fun lt!562459 () Unit!41204)

(assert (=> d!136773 (= lt!562458 lt!562459)))

(declare-datatypes ((Option!696 0))(
  ( (Some!695 (v!18366 B!1796)) (None!694) )
))
(declare-fun getValueByKey!645 (List!27350 (_ BitVec 64)) Option!696)

(assert (=> d!136773 (= (getValueByKey!645 lt!562457 (_1!10115 lt!562415)) (Some!695 (_2!10115 lt!562415)))))

(declare-fun lemmaContainsTupThenGetReturnValue!327 (List!27350 (_ BitVec 64) B!1796) Unit!41204)

(assert (=> d!136773 (= lt!562459 (lemmaContainsTupThenGetReturnValue!327 lt!562457 (_1!10115 lt!562415) (_2!10115 lt!562415)))))

(assert (=> d!136773 (= lt!562457 (insertStrictlySorted!420 (toList!9108 lm!211) (_1!10115 lt!562415) (_2!10115 lt!562415)))))

(assert (=> d!136773 (= (+!4189 lm!211 lt!562415) lt!562456)))

(declare-fun b!1241940 () Bool)

(declare-fun res!828325 () Bool)

(assert (=> b!1241940 (=> (not res!828325) (not e!704059))))

(assert (=> b!1241940 (= res!828325 (= (getValueByKey!645 (toList!9108 lt!562456) (_1!10115 lt!562415)) (Some!695 (_2!10115 lt!562415))))))

(declare-fun b!1241941 () Bool)

(assert (=> b!1241941 (= e!704059 (contains!7412 (toList!9108 lt!562456) lt!562415))))

(assert (= (and d!136773 res!828324) b!1241940))

(assert (= (and b!1241940 res!828325) b!1241941))

(declare-fun m!1145505 () Bool)

(assert (=> d!136773 m!1145505))

(declare-fun m!1145507 () Bool)

(assert (=> d!136773 m!1145507))

(declare-fun m!1145509 () Bool)

(assert (=> d!136773 m!1145509))

(declare-fun m!1145511 () Bool)

(assert (=> d!136773 m!1145511))

(declare-fun m!1145513 () Bool)

(assert (=> b!1241940 m!1145513))

(declare-fun m!1145515 () Bool)

(assert (=> b!1241941 m!1145515))

(assert (=> b!1241837 d!136773))

(declare-fun d!136779 () Bool)

(declare-fun lt!562466 () ListLongMap!18185)

(assert (=> d!136779 (not (contains!7415 lt!562466 a2!55))))

(assert (=> d!136779 (= lt!562466 (ListLongMap!18186 (removeStrictlySorted!111 (toList!9108 lm!211) a2!55)))))

(assert (=> d!136779 (= (-!1967 lm!211 a2!55) lt!562466)))

(declare-fun bs!34932 () Bool)

(assert (= bs!34932 d!136779))

(declare-fun m!1145529 () Bool)

(assert (=> bs!34932 m!1145529))

(assert (=> bs!34932 m!1145409))

(assert (=> b!1241837 d!136779))

(declare-fun b!1241962 () Bool)

(declare-fun e!704072 () List!27350)

(assert (=> b!1241962 (= e!704072 ($colon$colon!612 (removeStrictlySorted!111 (t!40805 (insertStrictlySorted!420 (toList!9108 lm!211) a1!66 b1!77)) a2!55) (h!28564 (insertStrictlySorted!420 (toList!9108 lm!211) a1!66 b1!77))))))

(declare-fun b!1241963 () Bool)

(declare-fun e!704073 () Bool)

(declare-fun lt!562485 () List!27350)

(assert (=> b!1241963 (= e!704073 (not (containsKey!599 lt!562485 a2!55)))))

(declare-fun b!1241965 () Bool)

(assert (=> b!1241965 (= e!704072 Nil!27347)))

(declare-fun e!704071 () List!27350)

(declare-fun b!1241966 () Bool)

(assert (=> b!1241966 (= e!704071 (t!40805 (insertStrictlySorted!420 (toList!9108 lm!211) a1!66 b1!77)))))

(declare-fun b!1241964 () Bool)

(assert (=> b!1241964 (= e!704071 e!704072)))

(declare-fun c!121654 () Bool)

(assert (=> b!1241964 (= c!121654 (and ((_ is Cons!27346) (insertStrictlySorted!420 (toList!9108 lm!211) a1!66 b1!77)) (not (= (_1!10115 (h!28564 (insertStrictlySorted!420 (toList!9108 lm!211) a1!66 b1!77))) a2!55))))))

(declare-fun d!136783 () Bool)

(assert (=> d!136783 e!704073))

(declare-fun res!828338 () Bool)

(assert (=> d!136783 (=> (not res!828338) (not e!704073))))

(assert (=> d!136783 (= res!828338 (isStrictlySorted!721 lt!562485))))

(assert (=> d!136783 (= lt!562485 e!704071)))

(declare-fun c!121655 () Bool)

(assert (=> d!136783 (= c!121655 (and ((_ is Cons!27346) (insertStrictlySorted!420 (toList!9108 lm!211) a1!66 b1!77)) (= (_1!10115 (h!28564 (insertStrictlySorted!420 (toList!9108 lm!211) a1!66 b1!77))) a2!55)))))

(assert (=> d!136783 (isStrictlySorted!721 (insertStrictlySorted!420 (toList!9108 lm!211) a1!66 b1!77))))

(assert (=> d!136783 (= (removeStrictlySorted!111 (insertStrictlySorted!420 (toList!9108 lm!211) a1!66 b1!77) a2!55) lt!562485)))

(assert (= (and d!136783 c!121655) b!1241966))

(assert (= (and d!136783 (not c!121655)) b!1241964))

(assert (= (and b!1241964 c!121654) b!1241962))

(assert (= (and b!1241964 (not c!121654)) b!1241965))

(assert (= (and d!136783 res!828338) b!1241963))

(declare-fun m!1145555 () Bool)

(assert (=> b!1241962 m!1145555))

(assert (=> b!1241962 m!1145555))

(declare-fun m!1145557 () Bool)

(assert (=> b!1241962 m!1145557))

(declare-fun m!1145559 () Bool)

(assert (=> b!1241963 m!1145559))

(declare-fun m!1145561 () Bool)

(assert (=> d!136783 m!1145561))

(assert (=> d!136783 m!1145415))

(declare-fun m!1145563 () Bool)

(assert (=> d!136783 m!1145563))

(assert (=> b!1241837 d!136783))

(declare-fun b!1241977 () Bool)

(declare-fun e!704080 () List!27350)

(assert (=> b!1241977 (= e!704080 ($colon$colon!612 (removeStrictlySorted!111 (t!40805 (toList!9108 lm!211)) a2!55) (h!28564 (toList!9108 lm!211))))))

(declare-fun b!1241978 () Bool)

(declare-fun e!704081 () Bool)

(declare-fun lt!562487 () List!27350)

(assert (=> b!1241978 (= e!704081 (not (containsKey!599 lt!562487 a2!55)))))

(declare-fun b!1241980 () Bool)

(assert (=> b!1241980 (= e!704080 Nil!27347)))

(declare-fun b!1241981 () Bool)

(declare-fun e!704079 () List!27350)

(assert (=> b!1241981 (= e!704079 (t!40805 (toList!9108 lm!211)))))

(declare-fun b!1241979 () Bool)

(assert (=> b!1241979 (= e!704079 e!704080)))

(declare-fun c!121660 () Bool)

(assert (=> b!1241979 (= c!121660 (and ((_ is Cons!27346) (toList!9108 lm!211)) (not (= (_1!10115 (h!28564 (toList!9108 lm!211))) a2!55))))))

(declare-fun d!136789 () Bool)

(assert (=> d!136789 e!704081))

(declare-fun res!828341 () Bool)

(assert (=> d!136789 (=> (not res!828341) (not e!704081))))

(assert (=> d!136789 (= res!828341 (isStrictlySorted!721 lt!562487))))

(assert (=> d!136789 (= lt!562487 e!704079)))

(declare-fun c!121661 () Bool)

(assert (=> d!136789 (= c!121661 (and ((_ is Cons!27346) (toList!9108 lm!211)) (= (_1!10115 (h!28564 (toList!9108 lm!211))) a2!55)))))

(assert (=> d!136789 (isStrictlySorted!721 (toList!9108 lm!211))))

(assert (=> d!136789 (= (removeStrictlySorted!111 (toList!9108 lm!211) a2!55) lt!562487)))

(assert (= (and d!136789 c!121661) b!1241981))

(assert (= (and d!136789 (not c!121661)) b!1241979))

(assert (= (and b!1241979 c!121660) b!1241977))

(assert (= (and b!1241979 (not c!121660)) b!1241980))

(assert (= (and d!136789 res!828341) b!1241978))

(declare-fun m!1145567 () Bool)

(assert (=> b!1241977 m!1145567))

(assert (=> b!1241977 m!1145567))

(declare-fun m!1145573 () Bool)

(assert (=> b!1241977 m!1145573))

(declare-fun m!1145575 () Bool)

(assert (=> b!1241978 m!1145575))

(declare-fun m!1145579 () Bool)

(assert (=> d!136789 m!1145579))

(assert (=> d!136789 m!1145407))

(assert (=> b!1241837 d!136789))

(declare-fun b!1241983 () Bool)

(declare-fun e!704085 () List!27350)

(assert (=> b!1241983 (= e!704085 (insertStrictlySorted!420 (t!40805 (toList!9108 lm!211)) a1!66 b1!77))))

(declare-fun b!1241984 () Bool)

(declare-fun res!828343 () Bool)

(declare-fun e!704082 () Bool)

(assert (=> b!1241984 (=> (not res!828343) (not e!704082))))

(declare-fun lt!562488 () List!27350)

(assert (=> b!1241984 (= res!828343 (containsKey!599 lt!562488 a1!66))))

(declare-fun bm!61216 () Bool)

(declare-fun call!61220 () List!27350)

(declare-fun call!61219 () List!27350)

(assert (=> bm!61216 (= call!61220 call!61219)))

(declare-fun c!121663 () Bool)

(declare-fun bm!61217 () Bool)

(assert (=> bm!61217 (= call!61219 ($colon$colon!612 e!704085 (ite c!121663 (h!28564 (toList!9108 lm!211)) (tuple2!20209 a1!66 b1!77))))))

(declare-fun c!121662 () Bool)

(assert (=> bm!61217 (= c!121662 c!121663)))

(declare-fun b!1241985 () Bool)

(declare-fun c!121665 () Bool)

(assert (=> b!1241985 (= c!121665 (and ((_ is Cons!27346) (toList!9108 lm!211)) (bvsgt (_1!10115 (h!28564 (toList!9108 lm!211))) a1!66)))))

(declare-fun e!704086 () List!27350)

(declare-fun e!704083 () List!27350)

(assert (=> b!1241985 (= e!704086 e!704083)))

(declare-fun b!1241986 () Bool)

(declare-fun call!61221 () List!27350)

(assert (=> b!1241986 (= e!704083 call!61221)))

(declare-fun b!1241987 () Bool)

(declare-fun e!704084 () List!27350)

(assert (=> b!1241987 (= e!704084 e!704086)))

(declare-fun c!121664 () Bool)

(assert (=> b!1241987 (= c!121664 (and ((_ is Cons!27346) (toList!9108 lm!211)) (= (_1!10115 (h!28564 (toList!9108 lm!211))) a1!66)))))

(declare-fun b!1241988 () Bool)

(assert (=> b!1241988 (= e!704082 (contains!7412 lt!562488 (tuple2!20209 a1!66 b1!77)))))

(declare-fun b!1241989 () Bool)

(assert (=> b!1241989 (= e!704085 (ite c!121664 (t!40805 (toList!9108 lm!211)) (ite c!121665 (Cons!27346 (h!28564 (toList!9108 lm!211)) (t!40805 (toList!9108 lm!211))) Nil!27347)))))

(declare-fun b!1241990 () Bool)

(assert (=> b!1241990 (= e!704086 call!61220)))

(declare-fun b!1241982 () Bool)

(assert (=> b!1241982 (= e!704084 call!61219)))

(declare-fun d!136793 () Bool)

(assert (=> d!136793 e!704082))

(declare-fun res!828342 () Bool)

(assert (=> d!136793 (=> (not res!828342) (not e!704082))))

(assert (=> d!136793 (= res!828342 (isStrictlySorted!721 lt!562488))))

(assert (=> d!136793 (= lt!562488 e!704084)))

(assert (=> d!136793 (= c!121663 (and ((_ is Cons!27346) (toList!9108 lm!211)) (bvslt (_1!10115 (h!28564 (toList!9108 lm!211))) a1!66)))))

(assert (=> d!136793 (isStrictlySorted!721 (toList!9108 lm!211))))

(assert (=> d!136793 (= (insertStrictlySorted!420 (toList!9108 lm!211) a1!66 b1!77) lt!562488)))

(declare-fun bm!61218 () Bool)

(assert (=> bm!61218 (= call!61221 call!61220)))

(declare-fun b!1241991 () Bool)

(assert (=> b!1241991 (= e!704083 call!61221)))

(assert (= (and d!136793 c!121663) b!1241982))

(assert (= (and d!136793 (not c!121663)) b!1241987))

(assert (= (and b!1241987 c!121664) b!1241990))

(assert (= (and b!1241987 (not c!121664)) b!1241985))

(assert (= (and b!1241985 c!121665) b!1241986))

(assert (= (and b!1241985 (not c!121665)) b!1241991))

(assert (= (or b!1241986 b!1241991) bm!61218))

(assert (= (or b!1241990 bm!61218) bm!61216))

(assert (= (or b!1241982 bm!61216) bm!61217))

(assert (= (and bm!61217 c!121662) b!1241983))

(assert (= (and bm!61217 (not c!121662)) b!1241989))

(assert (= (and d!136793 res!828342) b!1241984))

(assert (= (and b!1241984 res!828343) b!1241988))

(declare-fun m!1145583 () Bool)

(assert (=> b!1241984 m!1145583))

(declare-fun m!1145585 () Bool)

(assert (=> d!136793 m!1145585))

(assert (=> d!136793 m!1145407))

(declare-fun m!1145587 () Bool)

(assert (=> b!1241983 m!1145587))

(declare-fun m!1145589 () Bool)

(assert (=> bm!61217 m!1145589))

(declare-fun m!1145591 () Bool)

(assert (=> b!1241988 m!1145591))

(assert (=> b!1241837 d!136793))

(declare-fun d!136795 () Bool)

(assert (=> d!136795 (= (insertStrictlySorted!420 (removeStrictlySorted!111 (toList!9108 lm!211) a2!55) a1!66 b1!77) (removeStrictlySorted!111 (insertStrictlySorted!420 (toList!9108 lm!211) a1!66 b1!77) a2!55))))

(declare-fun lt!562498 () Unit!41204)

(declare-fun choose!1837 (List!27350 (_ BitVec 64) B!1796 (_ BitVec 64)) Unit!41204)

(assert (=> d!136795 (= lt!562498 (choose!1837 (toList!9108 lm!211) a1!66 b1!77 a2!55))))

(assert (=> d!136795 (not (= a1!66 a2!55))))

(assert (=> d!136795 (= (lemmaInsertAndRemoveStrictlySortedCommutative!1 (toList!9108 lm!211) a1!66 b1!77 a2!55) lt!562498)))

(declare-fun bs!34935 () Bool)

(assert (= bs!34935 d!136795))

(assert (=> bs!34935 m!1145415))

(assert (=> bs!34935 m!1145409))

(assert (=> bs!34935 m!1145411))

(declare-fun m!1145601 () Bool)

(assert (=> bs!34935 m!1145601))

(assert (=> bs!34935 m!1145415))

(assert (=> bs!34935 m!1145423))

(assert (=> bs!34935 m!1145409))

(assert (=> b!1241837 d!136795))

(declare-fun d!136801 () Bool)

(declare-fun lt!562499 () ListLongMap!18185)

(assert (=> d!136801 (not (contains!7415 lt!562499 a2!55))))

(assert (=> d!136801 (= lt!562499 (ListLongMap!18186 (removeStrictlySorted!111 (toList!9108 (+!4189 lm!211 lt!562415)) a2!55)))))

(assert (=> d!136801 (= (-!1967 (+!4189 lm!211 lt!562415) a2!55) lt!562499)))

(declare-fun bs!34936 () Bool)

(assert (= bs!34936 d!136801))

(declare-fun m!1145611 () Bool)

(assert (=> bs!34936 m!1145611))

(declare-fun m!1145613 () Bool)

(assert (=> bs!34936 m!1145613))

(assert (=> b!1241837 d!136801))

(declare-fun d!136805 () Bool)

(declare-fun e!704100 () Bool)

(assert (=> d!136805 e!704100))

(declare-fun res!828349 () Bool)

(assert (=> d!136805 (=> (not res!828349) (not e!704100))))

(declare-fun lt!562500 () ListLongMap!18185)

(assert (=> d!136805 (= res!828349 (contains!7415 lt!562500 (_1!10115 lt!562415)))))

(declare-fun lt!562501 () List!27350)

(assert (=> d!136805 (= lt!562500 (ListLongMap!18186 lt!562501))))

(declare-fun lt!562502 () Unit!41204)

(declare-fun lt!562503 () Unit!41204)

(assert (=> d!136805 (= lt!562502 lt!562503)))

(assert (=> d!136805 (= (getValueByKey!645 lt!562501 (_1!10115 lt!562415)) (Some!695 (_2!10115 lt!562415)))))

(assert (=> d!136805 (= lt!562503 (lemmaContainsTupThenGetReturnValue!327 lt!562501 (_1!10115 lt!562415) (_2!10115 lt!562415)))))

(assert (=> d!136805 (= lt!562501 (insertStrictlySorted!420 (toList!9108 (-!1967 lm!211 a2!55)) (_1!10115 lt!562415) (_2!10115 lt!562415)))))

(assert (=> d!136805 (= (+!4189 (-!1967 lm!211 a2!55) lt!562415) lt!562500)))

(declare-fun b!1242017 () Bool)

(declare-fun res!828350 () Bool)

(assert (=> b!1242017 (=> (not res!828350) (not e!704100))))

(assert (=> b!1242017 (= res!828350 (= (getValueByKey!645 (toList!9108 lt!562500) (_1!10115 lt!562415)) (Some!695 (_2!10115 lt!562415))))))

(declare-fun b!1242018 () Bool)

(assert (=> b!1242018 (= e!704100 (contains!7412 (toList!9108 lt!562500) lt!562415))))

(assert (= (and d!136805 res!828349) b!1242017))

(assert (= (and b!1242017 res!828350) b!1242018))

(declare-fun m!1145615 () Bool)

(assert (=> d!136805 m!1145615))

(declare-fun m!1145617 () Bool)

(assert (=> d!136805 m!1145617))

(declare-fun m!1145619 () Bool)

(assert (=> d!136805 m!1145619))

(declare-fun m!1145621 () Bool)

(assert (=> d!136805 m!1145621))

(declare-fun m!1145623 () Bool)

(assert (=> b!1242017 m!1145623))

(declare-fun m!1145625 () Bool)

(assert (=> b!1242018 m!1145625))

(assert (=> b!1241837 d!136805))

(declare-fun d!136807 () Bool)

(declare-fun res!828361 () Bool)

(declare-fun e!704111 () Bool)

(assert (=> d!136807 (=> res!828361 e!704111)))

(assert (=> d!136807 (= res!828361 (or ((_ is Nil!27347) (toList!9108 lm!211)) ((_ is Nil!27347) (t!40805 (toList!9108 lm!211)))))))

(assert (=> d!136807 (= (isStrictlySorted!721 (toList!9108 lm!211)) e!704111)))

(declare-fun b!1242029 () Bool)

(declare-fun e!704112 () Bool)

(assert (=> b!1242029 (= e!704111 e!704112)))

(declare-fun res!828362 () Bool)

(assert (=> b!1242029 (=> (not res!828362) (not e!704112))))

(assert (=> b!1242029 (= res!828362 (bvslt (_1!10115 (h!28564 (toList!9108 lm!211))) (_1!10115 (h!28564 (t!40805 (toList!9108 lm!211))))))))

(declare-fun b!1242030 () Bool)

(assert (=> b!1242030 (= e!704112 (isStrictlySorted!721 (t!40805 (toList!9108 lm!211))))))

(assert (= (and d!136807 (not res!828361)) b!1242029))

(assert (= (and b!1242029 res!828362) b!1242030))

(declare-fun m!1145629 () Bool)

(assert (=> b!1242030 m!1145629))

(assert (=> b!1241836 d!136807))

(declare-fun d!136811 () Bool)

(assert (=> d!136811 (= (inv!42773 lm!211) (isStrictlySorted!721 (toList!9108 lm!211)))))

(declare-fun bs!34938 () Bool)

(assert (= bs!34938 d!136811))

(assert (=> bs!34938 m!1145407))

(assert (=> start!103748 d!136811))

(declare-fun b!1242050 () Bool)

(declare-fun e!704123 () Bool)

(declare-fun tp!92549 () Bool)

(assert (=> b!1242050 (= e!704123 (and tp_is_empty!31195 tp!92549))))

(assert (=> b!1241838 (= tp!92537 e!704123)))

(assert (= (and b!1241838 ((_ is Cons!27346) (toList!9108 lm!211))) b!1242050))

(check-sat (not b!1241909) (not b!1241913) (not bm!61217) (not b!1241978) (not d!136805) (not b!1242018) (not b!1241984) (not d!136793) (not d!136795) (not b!1241963) (not d!136773) (not b!1242050) (not b!1241983) (not d!136779) (not b!1241941) (not b!1241908) (not b!1241962) (not d!136789) (not b!1241940) (not d!136801) (not b!1241977) (not b!1242030) (not d!136767) (not d!136783) tp_is_empty!31195 (not d!136811) (not bm!61211) (not b!1242017) (not b!1241988))
(check-sat)
