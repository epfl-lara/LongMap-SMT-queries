; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132952 () Bool)

(assert start!132952)

(declare-fun b!1556777 () Bool)

(declare-fun res!1064954 () Bool)

(declare-fun e!867118 () Bool)

(assert (=> b!1556777 (=> (not res!1064954) (not e!867118))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(declare-datatypes ((B!2356 0))(
  ( (B!2357 (val!19264 Int)) )
))
(declare-datatypes ((tuple2!24904 0))(
  ( (tuple2!24905 (_1!12463 (_ BitVec 64)) (_2!12463 B!2356)) )
))
(declare-datatypes ((List!36298 0))(
  ( (Nil!36295) (Cons!36294 (h!37740 tuple2!24904) (t!51022 List!36298)) )
))
(declare-fun l!1177 () List!36298)

(get-info :version)

(assert (=> b!1556777 (= res!1064954 (and (not (= newKey!105 otherKey!50)) (or (not ((_ is Cons!36294) l!1177)) (= (_1!12463 (h!37740 l!1177)) otherKey!50))))))

(declare-fun res!1064955 () Bool)

(assert (=> start!132952 (=> (not res!1064955) (not e!867118))))

(declare-fun isStrictlySorted!951 (List!36298) Bool)

(assert (=> start!132952 (= res!1064955 (isStrictlySorted!951 l!1177))))

(assert (=> start!132952 e!867118))

(declare-fun e!867119 () Bool)

(assert (=> start!132952 e!867119))

(assert (=> start!132952 true))

(declare-fun tp_is_empty!38367 () Bool)

(assert (=> start!132952 tp_is_empty!38367))

(declare-fun b!1556780 () Bool)

(declare-fun tp!112449 () Bool)

(assert (=> b!1556780 (= e!867119 (and tp_is_empty!38367 tp!112449))))

(declare-fun b!1556778 () Bool)

(declare-fun e!867117 () Bool)

(assert (=> b!1556778 (= e!867118 e!867117)))

(declare-fun res!1064956 () Bool)

(assert (=> b!1556778 (=> res!1064956 e!867117)))

(declare-fun lt!670460 () List!36298)

(declare-fun containsKey!813 (List!36298 (_ BitVec 64)) Bool)

(assert (=> b!1556778 (= res!1064956 (not (= (containsKey!813 lt!670460 otherKey!50) (containsKey!813 l!1177 otherKey!50))))))

(declare-fun newValue!105 () B!2356)

(declare-fun insertStrictlySorted!553 (List!36298 (_ BitVec 64) B!2356) List!36298)

(assert (=> b!1556778 (= lt!670460 (insertStrictlySorted!553 l!1177 newKey!105 newValue!105))))

(declare-fun b!1556779 () Bool)

(declare-datatypes ((Option!855 0))(
  ( (Some!854 (v!22042 B!2356)) (None!853) )
))
(declare-fun getValueByKey!779 (List!36298 (_ BitVec 64)) Option!855)

(assert (=> b!1556779 (= e!867117 (not (= (getValueByKey!779 lt!670460 otherKey!50) (getValueByKey!779 l!1177 otherKey!50))))))

(assert (= (and start!132952 res!1064955) b!1556777))

(assert (= (and b!1556777 res!1064954) b!1556778))

(assert (= (and b!1556778 (not res!1064956)) b!1556779))

(assert (= (and start!132952 ((_ is Cons!36294) l!1177)) b!1556780))

(declare-fun m!1434177 () Bool)

(assert (=> start!132952 m!1434177))

(declare-fun m!1434179 () Bool)

(assert (=> b!1556778 m!1434179))

(declare-fun m!1434181 () Bool)

(assert (=> b!1556778 m!1434181))

(declare-fun m!1434183 () Bool)

(assert (=> b!1556778 m!1434183))

(declare-fun m!1434185 () Bool)

(assert (=> b!1556779 m!1434185))

(declare-fun m!1434187 () Bool)

(assert (=> b!1556779 m!1434187))

(check-sat (not b!1556780) (not start!132952) (not b!1556779) (not b!1556778) tp_is_empty!38367)
(check-sat)
(get-model)

(declare-fun d!162297 () Bool)

(declare-fun res!1064970 () Bool)

(declare-fun e!867133 () Bool)

(assert (=> d!162297 (=> res!1064970 e!867133)))

(assert (=> d!162297 (= res!1064970 (and ((_ is Cons!36294) lt!670460) (= (_1!12463 (h!37740 lt!670460)) otherKey!50)))))

(assert (=> d!162297 (= (containsKey!813 lt!670460 otherKey!50) e!867133)))

(declare-fun b!1556797 () Bool)

(declare-fun e!867134 () Bool)

(assert (=> b!1556797 (= e!867133 e!867134)))

(declare-fun res!1064971 () Bool)

(assert (=> b!1556797 (=> (not res!1064971) (not e!867134))))

(assert (=> b!1556797 (= res!1064971 (and (or (not ((_ is Cons!36294) lt!670460)) (bvsle (_1!12463 (h!37740 lt!670460)) otherKey!50)) ((_ is Cons!36294) lt!670460) (bvslt (_1!12463 (h!37740 lt!670460)) otherKey!50)))))

(declare-fun b!1556798 () Bool)

(assert (=> b!1556798 (= e!867134 (containsKey!813 (t!51022 lt!670460) otherKey!50))))

(assert (= (and d!162297 (not res!1064970)) b!1556797))

(assert (= (and b!1556797 res!1064971) b!1556798))

(declare-fun m!1434201 () Bool)

(assert (=> b!1556798 m!1434201))

(assert (=> b!1556778 d!162297))

(declare-fun d!162301 () Bool)

(declare-fun res!1064972 () Bool)

(declare-fun e!867135 () Bool)

(assert (=> d!162301 (=> res!1064972 e!867135)))

(assert (=> d!162301 (= res!1064972 (and ((_ is Cons!36294) l!1177) (= (_1!12463 (h!37740 l!1177)) otherKey!50)))))

(assert (=> d!162301 (= (containsKey!813 l!1177 otherKey!50) e!867135)))

(declare-fun b!1556799 () Bool)

(declare-fun e!867136 () Bool)

(assert (=> b!1556799 (= e!867135 e!867136)))

(declare-fun res!1064973 () Bool)

(assert (=> b!1556799 (=> (not res!1064973) (not e!867136))))

(assert (=> b!1556799 (= res!1064973 (and (or (not ((_ is Cons!36294) l!1177)) (bvsle (_1!12463 (h!37740 l!1177)) otherKey!50)) ((_ is Cons!36294) l!1177) (bvslt (_1!12463 (h!37740 l!1177)) otherKey!50)))))

(declare-fun b!1556800 () Bool)

(assert (=> b!1556800 (= e!867136 (containsKey!813 (t!51022 l!1177) otherKey!50))))

(assert (= (and d!162301 (not res!1064972)) b!1556799))

(assert (= (and b!1556799 res!1064973) b!1556800))

(declare-fun m!1434203 () Bool)

(assert (=> b!1556800 m!1434203))

(assert (=> b!1556778 d!162301))

(declare-fun bm!71629 () Bool)

(declare-fun call!71634 () List!36298)

(declare-fun call!71632 () List!36298)

(assert (=> bm!71629 (= call!71634 call!71632)))

(declare-fun b!1556837 () Bool)

(declare-fun c!143857 () Bool)

(declare-fun c!143856 () Bool)

(declare-fun e!867164 () List!36298)

(assert (=> b!1556837 (= e!867164 (ite c!143857 (t!51022 l!1177) (ite c!143856 (Cons!36294 (h!37740 l!1177) (t!51022 l!1177)) Nil!36295)))))

(declare-fun b!1556838 () Bool)

(declare-fun e!867165 () List!36298)

(declare-fun e!867163 () List!36298)

(assert (=> b!1556838 (= e!867165 e!867163)))

(assert (=> b!1556838 (= c!143857 (and ((_ is Cons!36294) l!1177) (= (_1!12463 (h!37740 l!1177)) newKey!105)))))

(declare-fun b!1556839 () Bool)

(assert (=> b!1556839 (= c!143856 (and ((_ is Cons!36294) l!1177) (bvsgt (_1!12463 (h!37740 l!1177)) newKey!105)))))

(declare-fun e!867167 () List!36298)

(assert (=> b!1556839 (= e!867163 e!867167)))

(declare-fun b!1556840 () Bool)

(assert (=> b!1556840 (= e!867164 (insertStrictlySorted!553 (t!51022 l!1177) newKey!105 newValue!105))))

(declare-fun b!1556841 () Bool)

(assert (=> b!1556841 (= e!867167 call!71634)))

(declare-fun b!1556842 () Bool)

(assert (=> b!1556842 (= e!867167 call!71634)))

(declare-fun b!1556843 () Bool)

(declare-fun call!71633 () List!36298)

(assert (=> b!1556843 (= e!867165 call!71633)))

(declare-fun bm!71630 () Bool)

(assert (=> bm!71630 (= call!71632 call!71633)))

(declare-fun b!1556844 () Bool)

(assert (=> b!1556844 (= e!867163 call!71632)))

(declare-fun b!1556845 () Bool)

(declare-fun res!1064994 () Bool)

(declare-fun e!867166 () Bool)

(assert (=> b!1556845 (=> (not res!1064994) (not e!867166))))

(declare-fun lt!670466 () List!36298)

(assert (=> b!1556845 (= res!1064994 (containsKey!813 lt!670466 newKey!105))))

(declare-fun d!162303 () Bool)

(assert (=> d!162303 e!867166))

(declare-fun res!1064995 () Bool)

(assert (=> d!162303 (=> (not res!1064995) (not e!867166))))

(assert (=> d!162303 (= res!1064995 (isStrictlySorted!951 lt!670466))))

(assert (=> d!162303 (= lt!670466 e!867165)))

(declare-fun c!143855 () Bool)

(assert (=> d!162303 (= c!143855 (and ((_ is Cons!36294) l!1177) (bvslt (_1!12463 (h!37740 l!1177)) newKey!105)))))

(assert (=> d!162303 (isStrictlySorted!951 l!1177)))

(assert (=> d!162303 (= (insertStrictlySorted!553 l!1177 newKey!105 newValue!105) lt!670466)))

(declare-fun bm!71631 () Bool)

(declare-fun $colon$colon!969 (List!36298 tuple2!24904) List!36298)

(assert (=> bm!71631 (= call!71633 ($colon$colon!969 e!867164 (ite c!143855 (h!37740 l!1177) (tuple2!24905 newKey!105 newValue!105))))))

(declare-fun c!143858 () Bool)

(assert (=> bm!71631 (= c!143858 c!143855)))

(declare-fun b!1556846 () Bool)

(declare-fun contains!10185 (List!36298 tuple2!24904) Bool)

(assert (=> b!1556846 (= e!867166 (contains!10185 lt!670466 (tuple2!24905 newKey!105 newValue!105)))))

(assert (= (and d!162303 c!143855) b!1556843))

(assert (= (and d!162303 (not c!143855)) b!1556838))

(assert (= (and b!1556838 c!143857) b!1556844))

(assert (= (and b!1556838 (not c!143857)) b!1556839))

(assert (= (and b!1556839 c!143856) b!1556842))

(assert (= (and b!1556839 (not c!143856)) b!1556841))

(assert (= (or b!1556842 b!1556841) bm!71629))

(assert (= (or b!1556844 bm!71629) bm!71630))

(assert (= (or b!1556843 bm!71630) bm!71631))

(assert (= (and bm!71631 c!143858) b!1556840))

(assert (= (and bm!71631 (not c!143858)) b!1556837))

(assert (= (and d!162303 res!1064995) b!1556845))

(assert (= (and b!1556845 res!1064994) b!1556846))

(declare-fun m!1434213 () Bool)

(assert (=> b!1556846 m!1434213))

(declare-fun m!1434215 () Bool)

(assert (=> b!1556840 m!1434215))

(declare-fun m!1434217 () Bool)

(assert (=> b!1556845 m!1434217))

(declare-fun m!1434219 () Bool)

(assert (=> d!162303 m!1434219))

(assert (=> d!162303 m!1434177))

(declare-fun m!1434221 () Bool)

(assert (=> bm!71631 m!1434221))

(assert (=> b!1556778 d!162303))

(declare-fun b!1556867 () Bool)

(declare-fun e!867178 () Option!855)

(assert (=> b!1556867 (= e!867178 (Some!854 (_2!12463 (h!37740 lt!670460))))))

(declare-fun d!162315 () Bool)

(declare-fun c!143869 () Bool)

(assert (=> d!162315 (= c!143869 (and ((_ is Cons!36294) lt!670460) (= (_1!12463 (h!37740 lt!670460)) otherKey!50)))))

(assert (=> d!162315 (= (getValueByKey!779 lt!670460 otherKey!50) e!867178)))

(declare-fun b!1556868 () Bool)

(declare-fun e!867179 () Option!855)

(assert (=> b!1556868 (= e!867178 e!867179)))

(declare-fun c!143870 () Bool)

(assert (=> b!1556868 (= c!143870 (and ((_ is Cons!36294) lt!670460) (not (= (_1!12463 (h!37740 lt!670460)) otherKey!50))))))

(declare-fun b!1556870 () Bool)

(assert (=> b!1556870 (= e!867179 None!853)))

(declare-fun b!1556869 () Bool)

(assert (=> b!1556869 (= e!867179 (getValueByKey!779 (t!51022 lt!670460) otherKey!50))))

(assert (= (and d!162315 c!143869) b!1556867))

(assert (= (and d!162315 (not c!143869)) b!1556868))

(assert (= (and b!1556868 c!143870) b!1556869))

(assert (= (and b!1556868 (not c!143870)) b!1556870))

(declare-fun m!1434223 () Bool)

(assert (=> b!1556869 m!1434223))

(assert (=> b!1556779 d!162315))

(declare-fun b!1556875 () Bool)

(declare-fun e!867182 () Option!855)

(assert (=> b!1556875 (= e!867182 (Some!854 (_2!12463 (h!37740 l!1177))))))

(declare-fun d!162317 () Bool)

(declare-fun c!143873 () Bool)

(assert (=> d!162317 (= c!143873 (and ((_ is Cons!36294) l!1177) (= (_1!12463 (h!37740 l!1177)) otherKey!50)))))

(assert (=> d!162317 (= (getValueByKey!779 l!1177 otherKey!50) e!867182)))

(declare-fun b!1556876 () Bool)

(declare-fun e!867183 () Option!855)

(assert (=> b!1556876 (= e!867182 e!867183)))

(declare-fun c!143874 () Bool)

(assert (=> b!1556876 (= c!143874 (and ((_ is Cons!36294) l!1177) (not (= (_1!12463 (h!37740 l!1177)) otherKey!50))))))

(declare-fun b!1556878 () Bool)

(assert (=> b!1556878 (= e!867183 None!853)))

(declare-fun b!1556877 () Bool)

(assert (=> b!1556877 (= e!867183 (getValueByKey!779 (t!51022 l!1177) otherKey!50))))

(assert (= (and d!162317 c!143873) b!1556875))

(assert (= (and d!162317 (not c!143873)) b!1556876))

(assert (= (and b!1556876 c!143874) b!1556877))

(assert (= (and b!1556876 (not c!143874)) b!1556878))

(declare-fun m!1434225 () Bool)

(assert (=> b!1556877 m!1434225))

(assert (=> b!1556779 d!162317))

(declare-fun d!162319 () Bool)

(declare-fun res!1065004 () Bool)

(declare-fun e!867196 () Bool)

(assert (=> d!162319 (=> res!1065004 e!867196)))

(assert (=> d!162319 (= res!1065004 (or ((_ is Nil!36295) l!1177) ((_ is Nil!36295) (t!51022 l!1177))))))

(assert (=> d!162319 (= (isStrictlySorted!951 l!1177) e!867196)))

(declare-fun b!1556899 () Bool)

(declare-fun e!867197 () Bool)

(assert (=> b!1556899 (= e!867196 e!867197)))

(declare-fun res!1065005 () Bool)

(assert (=> b!1556899 (=> (not res!1065005) (not e!867197))))

(assert (=> b!1556899 (= res!1065005 (bvslt (_1!12463 (h!37740 l!1177)) (_1!12463 (h!37740 (t!51022 l!1177)))))))

(declare-fun b!1556900 () Bool)

(assert (=> b!1556900 (= e!867197 (isStrictlySorted!951 (t!51022 l!1177)))))

(assert (= (and d!162319 (not res!1065004)) b!1556899))

(assert (= (and b!1556899 res!1065005) b!1556900))

(declare-fun m!1434227 () Bool)

(assert (=> b!1556900 m!1434227))

(assert (=> start!132952 d!162319))

(declare-fun b!1556909 () Bool)

(declare-fun e!867202 () Bool)

(declare-fun tp!112455 () Bool)

(assert (=> b!1556909 (= e!867202 (and tp_is_empty!38367 tp!112455))))

(assert (=> b!1556780 (= tp!112449 e!867202)))

(assert (= (and b!1556780 ((_ is Cons!36294) (t!51022 l!1177))) b!1556909))

(check-sat (not b!1556909) (not bm!71631) (not d!162303) (not b!1556840) (not b!1556800) tp_is_empty!38367 (not b!1556869) (not b!1556798) (not b!1556877) (not b!1556900) (not b!1556845) (not b!1556846))
(check-sat)
(get-model)

(declare-fun d!162353 () Bool)

(declare-fun res!1065044 () Bool)

(declare-fun e!867275 () Bool)

(assert (=> d!162353 (=> res!1065044 e!867275)))

(assert (=> d!162353 (= res!1065044 (or ((_ is Nil!36295) lt!670466) ((_ is Nil!36295) (t!51022 lt!670466))))))

(assert (=> d!162353 (= (isStrictlySorted!951 lt!670466) e!867275)))

(declare-fun b!1557023 () Bool)

(declare-fun e!867276 () Bool)

(assert (=> b!1557023 (= e!867275 e!867276)))

(declare-fun res!1065045 () Bool)

(assert (=> b!1557023 (=> (not res!1065045) (not e!867276))))

(assert (=> b!1557023 (= res!1065045 (bvslt (_1!12463 (h!37740 lt!670466)) (_1!12463 (h!37740 (t!51022 lt!670466)))))))

(declare-fun b!1557024 () Bool)

(assert (=> b!1557024 (= e!867276 (isStrictlySorted!951 (t!51022 lt!670466)))))

(assert (= (and d!162353 (not res!1065044)) b!1557023))

(assert (= (and b!1557023 res!1065045) b!1557024))

(declare-fun m!1434291 () Bool)

(assert (=> b!1557024 m!1434291))

(assert (=> d!162303 d!162353))

(assert (=> d!162303 d!162319))

(declare-fun d!162355 () Bool)

(declare-fun res!1065046 () Bool)

(declare-fun e!867277 () Bool)

(assert (=> d!162355 (=> res!1065046 e!867277)))

(assert (=> d!162355 (= res!1065046 (and ((_ is Cons!36294) (t!51022 l!1177)) (= (_1!12463 (h!37740 (t!51022 l!1177))) otherKey!50)))))

(assert (=> d!162355 (= (containsKey!813 (t!51022 l!1177) otherKey!50) e!867277)))

(declare-fun b!1557025 () Bool)

(declare-fun e!867278 () Bool)

(assert (=> b!1557025 (= e!867277 e!867278)))

(declare-fun res!1065047 () Bool)

(assert (=> b!1557025 (=> (not res!1065047) (not e!867278))))

(assert (=> b!1557025 (= res!1065047 (and (or (not ((_ is Cons!36294) (t!51022 l!1177))) (bvsle (_1!12463 (h!37740 (t!51022 l!1177))) otherKey!50)) ((_ is Cons!36294) (t!51022 l!1177)) (bvslt (_1!12463 (h!37740 (t!51022 l!1177))) otherKey!50)))))

(declare-fun b!1557026 () Bool)

(assert (=> b!1557026 (= e!867278 (containsKey!813 (t!51022 (t!51022 l!1177)) otherKey!50))))

(assert (= (and d!162355 (not res!1065046)) b!1557025))

(assert (= (and b!1557025 res!1065047) b!1557026))

(declare-fun m!1434293 () Bool)

(assert (=> b!1557026 m!1434293))

(assert (=> b!1556800 d!162355))

(declare-fun lt!670479 () Bool)

(declare-fun d!162357 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!800 (List!36298) (InoxSet tuple2!24904))

(assert (=> d!162357 (= lt!670479 (select (content!800 lt!670466) (tuple2!24905 newKey!105 newValue!105)))))

(declare-fun e!867283 () Bool)

(assert (=> d!162357 (= lt!670479 e!867283)))

(declare-fun res!1065053 () Bool)

(assert (=> d!162357 (=> (not res!1065053) (not e!867283))))

(assert (=> d!162357 (= res!1065053 ((_ is Cons!36294) lt!670466))))

(assert (=> d!162357 (= (contains!10185 lt!670466 (tuple2!24905 newKey!105 newValue!105)) lt!670479)))

(declare-fun b!1557031 () Bool)

(declare-fun e!867284 () Bool)

(assert (=> b!1557031 (= e!867283 e!867284)))

(declare-fun res!1065052 () Bool)

(assert (=> b!1557031 (=> res!1065052 e!867284)))

(assert (=> b!1557031 (= res!1065052 (= (h!37740 lt!670466) (tuple2!24905 newKey!105 newValue!105)))))

(declare-fun b!1557032 () Bool)

(assert (=> b!1557032 (= e!867284 (contains!10185 (t!51022 lt!670466) (tuple2!24905 newKey!105 newValue!105)))))

(assert (= (and d!162357 res!1065053) b!1557031))

(assert (= (and b!1557031 (not res!1065052)) b!1557032))

(declare-fun m!1434295 () Bool)

(assert (=> d!162357 m!1434295))

(declare-fun m!1434297 () Bool)

(assert (=> d!162357 m!1434297))

(declare-fun m!1434299 () Bool)

(assert (=> b!1557032 m!1434299))

(assert (=> b!1556846 d!162357))

(declare-fun d!162359 () Bool)

(declare-fun res!1065054 () Bool)

(declare-fun e!867285 () Bool)

(assert (=> d!162359 (=> res!1065054 e!867285)))

(assert (=> d!162359 (= res!1065054 (and ((_ is Cons!36294) (t!51022 lt!670460)) (= (_1!12463 (h!37740 (t!51022 lt!670460))) otherKey!50)))))

(assert (=> d!162359 (= (containsKey!813 (t!51022 lt!670460) otherKey!50) e!867285)))

(declare-fun b!1557033 () Bool)

(declare-fun e!867286 () Bool)

(assert (=> b!1557033 (= e!867285 e!867286)))

(declare-fun res!1065055 () Bool)

(assert (=> b!1557033 (=> (not res!1065055) (not e!867286))))

(assert (=> b!1557033 (= res!1065055 (and (or (not ((_ is Cons!36294) (t!51022 lt!670460))) (bvsle (_1!12463 (h!37740 (t!51022 lt!670460))) otherKey!50)) ((_ is Cons!36294) (t!51022 lt!670460)) (bvslt (_1!12463 (h!37740 (t!51022 lt!670460))) otherKey!50)))))

(declare-fun b!1557034 () Bool)

(assert (=> b!1557034 (= e!867286 (containsKey!813 (t!51022 (t!51022 lt!670460)) otherKey!50))))

(assert (= (and d!162359 (not res!1065054)) b!1557033))

(assert (= (and b!1557033 res!1065055) b!1557034))

(declare-fun m!1434301 () Bool)

(assert (=> b!1557034 m!1434301))

(assert (=> b!1556798 d!162359))

(declare-fun b!1557035 () Bool)

(declare-fun e!867287 () Option!855)

(assert (=> b!1557035 (= e!867287 (Some!854 (_2!12463 (h!37740 (t!51022 lt!670460)))))))

(declare-fun d!162361 () Bool)

(declare-fun c!143915 () Bool)

(assert (=> d!162361 (= c!143915 (and ((_ is Cons!36294) (t!51022 lt!670460)) (= (_1!12463 (h!37740 (t!51022 lt!670460))) otherKey!50)))))

(assert (=> d!162361 (= (getValueByKey!779 (t!51022 lt!670460) otherKey!50) e!867287)))

(declare-fun b!1557036 () Bool)

(declare-fun e!867288 () Option!855)

(assert (=> b!1557036 (= e!867287 e!867288)))

(declare-fun c!143916 () Bool)

(assert (=> b!1557036 (= c!143916 (and ((_ is Cons!36294) (t!51022 lt!670460)) (not (= (_1!12463 (h!37740 (t!51022 lt!670460))) otherKey!50))))))

(declare-fun b!1557038 () Bool)

(assert (=> b!1557038 (= e!867288 None!853)))

(declare-fun b!1557037 () Bool)

(assert (=> b!1557037 (= e!867288 (getValueByKey!779 (t!51022 (t!51022 lt!670460)) otherKey!50))))

(assert (= (and d!162361 c!143915) b!1557035))

(assert (= (and d!162361 (not c!143915)) b!1557036))

(assert (= (and b!1557036 c!143916) b!1557037))

(assert (= (and b!1557036 (not c!143916)) b!1557038))

(declare-fun m!1434303 () Bool)

(assert (=> b!1557037 m!1434303))

(assert (=> b!1556869 d!162361))

(declare-fun d!162363 () Bool)

(assert (=> d!162363 (= ($colon$colon!969 e!867164 (ite c!143855 (h!37740 l!1177) (tuple2!24905 newKey!105 newValue!105))) (Cons!36294 (ite c!143855 (h!37740 l!1177) (tuple2!24905 newKey!105 newValue!105)) e!867164))))

(assert (=> bm!71631 d!162363))

(declare-fun b!1557039 () Bool)

(declare-fun e!867289 () Option!855)

(assert (=> b!1557039 (= e!867289 (Some!854 (_2!12463 (h!37740 (t!51022 l!1177)))))))

(declare-fun d!162365 () Bool)

(declare-fun c!143917 () Bool)

(assert (=> d!162365 (= c!143917 (and ((_ is Cons!36294) (t!51022 l!1177)) (= (_1!12463 (h!37740 (t!51022 l!1177))) otherKey!50)))))

(assert (=> d!162365 (= (getValueByKey!779 (t!51022 l!1177) otherKey!50) e!867289)))

(declare-fun b!1557040 () Bool)

(declare-fun e!867290 () Option!855)

(assert (=> b!1557040 (= e!867289 e!867290)))

(declare-fun c!143918 () Bool)

(assert (=> b!1557040 (= c!143918 (and ((_ is Cons!36294) (t!51022 l!1177)) (not (= (_1!12463 (h!37740 (t!51022 l!1177))) otherKey!50))))))

(declare-fun b!1557042 () Bool)

(assert (=> b!1557042 (= e!867290 None!853)))

(declare-fun b!1557041 () Bool)

(assert (=> b!1557041 (= e!867290 (getValueByKey!779 (t!51022 (t!51022 l!1177)) otherKey!50))))

(assert (= (and d!162365 c!143917) b!1557039))

(assert (= (and d!162365 (not c!143917)) b!1557040))

(assert (= (and b!1557040 c!143918) b!1557041))

(assert (= (and b!1557040 (not c!143918)) b!1557042))

(declare-fun m!1434305 () Bool)

(assert (=> b!1557041 m!1434305))

(assert (=> b!1556877 d!162365))

(declare-fun d!162367 () Bool)

(declare-fun res!1065056 () Bool)

(declare-fun e!867291 () Bool)

(assert (=> d!162367 (=> res!1065056 e!867291)))

(assert (=> d!162367 (= res!1065056 (and ((_ is Cons!36294) lt!670466) (= (_1!12463 (h!37740 lt!670466)) newKey!105)))))

(assert (=> d!162367 (= (containsKey!813 lt!670466 newKey!105) e!867291)))

(declare-fun b!1557043 () Bool)

(declare-fun e!867292 () Bool)

(assert (=> b!1557043 (= e!867291 e!867292)))

(declare-fun res!1065057 () Bool)

(assert (=> b!1557043 (=> (not res!1065057) (not e!867292))))

(assert (=> b!1557043 (= res!1065057 (and (or (not ((_ is Cons!36294) lt!670466)) (bvsle (_1!12463 (h!37740 lt!670466)) newKey!105)) ((_ is Cons!36294) lt!670466) (bvslt (_1!12463 (h!37740 lt!670466)) newKey!105)))))

(declare-fun b!1557044 () Bool)

(assert (=> b!1557044 (= e!867292 (containsKey!813 (t!51022 lt!670466) newKey!105))))

(assert (= (and d!162367 (not res!1065056)) b!1557043))

(assert (= (and b!1557043 res!1065057) b!1557044))

(declare-fun m!1434307 () Bool)

(assert (=> b!1557044 m!1434307))

(assert (=> b!1556845 d!162367))

(declare-fun d!162369 () Bool)

(declare-fun res!1065058 () Bool)

(declare-fun e!867293 () Bool)

(assert (=> d!162369 (=> res!1065058 e!867293)))

(assert (=> d!162369 (= res!1065058 (or ((_ is Nil!36295) (t!51022 l!1177)) ((_ is Nil!36295) (t!51022 (t!51022 l!1177)))))))

(assert (=> d!162369 (= (isStrictlySorted!951 (t!51022 l!1177)) e!867293)))

(declare-fun b!1557045 () Bool)

(declare-fun e!867294 () Bool)

(assert (=> b!1557045 (= e!867293 e!867294)))

(declare-fun res!1065059 () Bool)

(assert (=> b!1557045 (=> (not res!1065059) (not e!867294))))

(assert (=> b!1557045 (= res!1065059 (bvslt (_1!12463 (h!37740 (t!51022 l!1177))) (_1!12463 (h!37740 (t!51022 (t!51022 l!1177))))))))

(declare-fun b!1557046 () Bool)

(assert (=> b!1557046 (= e!867294 (isStrictlySorted!951 (t!51022 (t!51022 l!1177))))))

(assert (= (and d!162369 (not res!1065058)) b!1557045))

(assert (= (and b!1557045 res!1065059) b!1557046))

(declare-fun m!1434309 () Bool)

(assert (=> b!1557046 m!1434309))

(assert (=> b!1556900 d!162369))

(declare-fun bm!71653 () Bool)

(declare-fun call!71658 () List!36298)

(declare-fun call!71656 () List!36298)

(assert (=> bm!71653 (= call!71658 call!71656)))

(declare-fun c!143920 () Bool)

(declare-fun c!143921 () Bool)

(declare-fun b!1557047 () Bool)

(declare-fun e!867296 () List!36298)

(assert (=> b!1557047 (= e!867296 (ite c!143921 (t!51022 (t!51022 l!1177)) (ite c!143920 (Cons!36294 (h!37740 (t!51022 l!1177)) (t!51022 (t!51022 l!1177))) Nil!36295)))))

(declare-fun b!1557048 () Bool)

(declare-fun e!867297 () List!36298)

(declare-fun e!867295 () List!36298)

(assert (=> b!1557048 (= e!867297 e!867295)))

(assert (=> b!1557048 (= c!143921 (and ((_ is Cons!36294) (t!51022 l!1177)) (= (_1!12463 (h!37740 (t!51022 l!1177))) newKey!105)))))

(declare-fun b!1557049 () Bool)

(assert (=> b!1557049 (= c!143920 (and ((_ is Cons!36294) (t!51022 l!1177)) (bvsgt (_1!12463 (h!37740 (t!51022 l!1177))) newKey!105)))))

(declare-fun e!867299 () List!36298)

(assert (=> b!1557049 (= e!867295 e!867299)))

(declare-fun b!1557050 () Bool)

(assert (=> b!1557050 (= e!867296 (insertStrictlySorted!553 (t!51022 (t!51022 l!1177)) newKey!105 newValue!105))))

(declare-fun b!1557051 () Bool)

(assert (=> b!1557051 (= e!867299 call!71658)))

(declare-fun b!1557052 () Bool)

(assert (=> b!1557052 (= e!867299 call!71658)))

(declare-fun b!1557053 () Bool)

(declare-fun call!71657 () List!36298)

(assert (=> b!1557053 (= e!867297 call!71657)))

(declare-fun bm!71654 () Bool)

(assert (=> bm!71654 (= call!71656 call!71657)))

(declare-fun b!1557054 () Bool)

(assert (=> b!1557054 (= e!867295 call!71656)))

(declare-fun b!1557055 () Bool)

(declare-fun res!1065060 () Bool)

(declare-fun e!867298 () Bool)

(assert (=> b!1557055 (=> (not res!1065060) (not e!867298))))

(declare-fun lt!670480 () List!36298)

(assert (=> b!1557055 (= res!1065060 (containsKey!813 lt!670480 newKey!105))))

(declare-fun d!162371 () Bool)

(assert (=> d!162371 e!867298))

(declare-fun res!1065061 () Bool)

(assert (=> d!162371 (=> (not res!1065061) (not e!867298))))

(assert (=> d!162371 (= res!1065061 (isStrictlySorted!951 lt!670480))))

(assert (=> d!162371 (= lt!670480 e!867297)))

(declare-fun c!143919 () Bool)

(assert (=> d!162371 (= c!143919 (and ((_ is Cons!36294) (t!51022 l!1177)) (bvslt (_1!12463 (h!37740 (t!51022 l!1177))) newKey!105)))))

(assert (=> d!162371 (isStrictlySorted!951 (t!51022 l!1177))))

(assert (=> d!162371 (= (insertStrictlySorted!553 (t!51022 l!1177) newKey!105 newValue!105) lt!670480)))

(declare-fun bm!71655 () Bool)

(assert (=> bm!71655 (= call!71657 ($colon$colon!969 e!867296 (ite c!143919 (h!37740 (t!51022 l!1177)) (tuple2!24905 newKey!105 newValue!105))))))

(declare-fun c!143922 () Bool)

(assert (=> bm!71655 (= c!143922 c!143919)))

(declare-fun b!1557056 () Bool)

(assert (=> b!1557056 (= e!867298 (contains!10185 lt!670480 (tuple2!24905 newKey!105 newValue!105)))))

(assert (= (and d!162371 c!143919) b!1557053))

(assert (= (and d!162371 (not c!143919)) b!1557048))

(assert (= (and b!1557048 c!143921) b!1557054))

(assert (= (and b!1557048 (not c!143921)) b!1557049))

(assert (= (and b!1557049 c!143920) b!1557052))

(assert (= (and b!1557049 (not c!143920)) b!1557051))

(assert (= (or b!1557052 b!1557051) bm!71653))

(assert (= (or b!1557054 bm!71653) bm!71654))

(assert (= (or b!1557053 bm!71654) bm!71655))

(assert (= (and bm!71655 c!143922) b!1557050))

(assert (= (and bm!71655 (not c!143922)) b!1557047))

(assert (= (and d!162371 res!1065061) b!1557055))

(assert (= (and b!1557055 res!1065060) b!1557056))

(declare-fun m!1434311 () Bool)

(assert (=> b!1557056 m!1434311))

(declare-fun m!1434313 () Bool)

(assert (=> b!1557050 m!1434313))

(declare-fun m!1434315 () Bool)

(assert (=> b!1557055 m!1434315))

(declare-fun m!1434317 () Bool)

(assert (=> d!162371 m!1434317))

(assert (=> d!162371 m!1434227))

(declare-fun m!1434319 () Bool)

(assert (=> bm!71655 m!1434319))

(assert (=> b!1556840 d!162371))

(declare-fun b!1557057 () Bool)

(declare-fun e!867300 () Bool)

(declare-fun tp!112463 () Bool)

(assert (=> b!1557057 (= e!867300 (and tp_is_empty!38367 tp!112463))))

(assert (=> b!1556909 (= tp!112455 e!867300)))

(assert (= (and b!1556909 ((_ is Cons!36294) (t!51022 (t!51022 l!1177)))) b!1557057))

(check-sat (not b!1557050) (not b!1557046) (not b!1557057) (not b!1557037) (not b!1557056) (not b!1557055) (not b!1557044) (not b!1557032) (not b!1557026) tp_is_empty!38367 (not b!1557041) (not b!1557024) (not bm!71655) (not d!162357) (not b!1557034) (not d!162371))
(check-sat)
