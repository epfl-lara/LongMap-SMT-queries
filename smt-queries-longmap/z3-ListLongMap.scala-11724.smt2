; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137324 () Bool)

(assert start!137324)

(declare-fun b!1581104 () Bool)

(declare-fun e!882172 () Bool)

(declare-fun e!882175 () Bool)

(assert (=> b!1581104 (= e!882172 e!882175)))

(declare-fun res!1080152 () Bool)

(assert (=> b!1581104 (=> res!1080152 e!882175)))

(declare-datatypes ((B!2686 0))(
  ( (B!2687 (val!19705 Int)) )
))
(declare-datatypes ((tuple2!25556 0))(
  ( (tuple2!25557 (_1!12789 (_ BitVec 64)) (_2!12789 B!2686)) )
))
(declare-datatypes ((List!36825 0))(
  ( (Nil!36822) (Cons!36821 (h!38364 tuple2!25556) (t!51739 List!36825)) )
))
(declare-fun l!1390 () List!36825)

(declare-fun isStrictlySorted!1083 (List!36825) Bool)

(assert (=> b!1581104 (= res!1080152 (not (isStrictlySorted!1083 (t!51739 l!1390))))))

(declare-fun b!1581105 () Bool)

(declare-fun res!1080156 () Bool)

(assert (=> b!1581105 (=> res!1080156 e!882175)))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!929 (List!36825 (_ BitVec 64)) Bool)

(assert (=> b!1581105 (= res!1080156 (not (containsKey!929 (t!51739 l!1390) key!405)))))

(declare-fun b!1581106 () Bool)

(declare-fun lt!676881 () tuple2!25556)

(declare-fun contains!10497 (List!36825 tuple2!25556) Bool)

(assert (=> b!1581106 (= e!882175 (not (contains!10497 (t!51739 l!1390) lt!676881)))))

(declare-fun b!1581107 () Bool)

(declare-fun e!882171 () Bool)

(assert (=> b!1581107 (= e!882171 e!882172)))

(declare-fun res!1080154 () Bool)

(assert (=> b!1581107 (=> (not res!1080154) (not e!882172))))

(declare-fun e!882173 () Bool)

(assert (=> b!1581107 (= res!1080154 e!882173)))

(declare-fun res!1080153 () Bool)

(assert (=> b!1581107 (=> res!1080153 e!882173)))

(declare-datatypes ((tuple2!25558 0))(
  ( (tuple2!25559 (_1!12790 tuple2!25556) (_2!12790 List!36825)) )
))
(declare-datatypes ((Option!918 0))(
  ( (Some!917 (v!22427 tuple2!25558)) (None!916) )
))
(declare-fun lt!676880 () Option!918)

(declare-fun isEmpty!1176 (Option!918) Bool)

(assert (=> b!1581107 (= res!1080153 (isEmpty!1176 lt!676880))))

(declare-fun unapply!92 (List!36825) Option!918)

(assert (=> b!1581107 (= lt!676880 (unapply!92 l!1390))))

(declare-fun b!1581108 () Bool)

(declare-fun res!1080157 () Bool)

(assert (=> b!1581108 (=> (not res!1080157) (not e!882172))))

(get-info :version)

(assert (=> b!1581108 (= res!1080157 (and (or (not ((_ is Cons!36821) l!1390)) (not (= (_1!12789 (h!38364 l!1390)) key!405))) ((_ is Cons!36821) l!1390)))))

(declare-fun b!1581109 () Bool)

(declare-fun res!1080159 () Bool)

(declare-fun e!882174 () Bool)

(assert (=> b!1581109 (=> (not res!1080159) (not e!882174))))

(assert (=> b!1581109 (= res!1080159 (containsKey!929 l!1390 key!405))))

(declare-fun res!1080158 () Bool)

(assert (=> start!137324 (=> (not res!1080158) (not e!882174))))

(assert (=> start!137324 (= res!1080158 (isStrictlySorted!1083 l!1390))))

(assert (=> start!137324 e!882174))

(declare-fun e!882176 () Bool)

(assert (=> start!137324 e!882176))

(assert (=> start!137324 true))

(declare-fun tp_is_empty!39231 () Bool)

(assert (=> start!137324 tp_is_empty!39231))

(declare-fun b!1581110 () Bool)

(declare-fun get!26809 (Option!918) tuple2!25558)

(assert (=> b!1581110 (= e!882173 (not ((_ is Nil!36822) (_2!12790 (get!26809 lt!676880)))))))

(declare-fun b!1581111 () Bool)

(assert (=> b!1581111 (= e!882174 e!882171)))

(declare-fun res!1080155 () Bool)

(assert (=> b!1581111 (=> (not res!1080155) (not e!882171))))

(assert (=> b!1581111 (= res!1080155 (contains!10497 l!1390 lt!676881))))

(declare-fun value!194 () B!2686)

(assert (=> b!1581111 (= lt!676881 (tuple2!25557 key!405 value!194))))

(declare-fun b!1581112 () Bool)

(declare-fun tp!114545 () Bool)

(assert (=> b!1581112 (= e!882176 (and tp_is_empty!39231 tp!114545))))

(assert (= (and start!137324 res!1080158) b!1581109))

(assert (= (and b!1581109 res!1080159) b!1581111))

(assert (= (and b!1581111 res!1080155) b!1581107))

(assert (= (and b!1581107 (not res!1080153)) b!1581110))

(assert (= (and b!1581107 res!1080154) b!1581108))

(assert (= (and b!1581108 res!1080157) b!1581104))

(assert (= (and b!1581104 (not res!1080152)) b!1581105))

(assert (= (and b!1581105 (not res!1080156)) b!1581106))

(assert (= (and start!137324 ((_ is Cons!36821) l!1390)) b!1581112))

(declare-fun m!1452221 () Bool)

(assert (=> b!1581104 m!1452221))

(declare-fun m!1452223 () Bool)

(assert (=> b!1581109 m!1452223))

(declare-fun m!1452225 () Bool)

(assert (=> b!1581110 m!1452225))

(declare-fun m!1452227 () Bool)

(assert (=> start!137324 m!1452227))

(declare-fun m!1452229 () Bool)

(assert (=> b!1581107 m!1452229))

(declare-fun m!1452231 () Bool)

(assert (=> b!1581107 m!1452231))

(declare-fun m!1452233 () Bool)

(assert (=> b!1581105 m!1452233))

(declare-fun m!1452235 () Bool)

(assert (=> b!1581111 m!1452235))

(declare-fun m!1452237 () Bool)

(assert (=> b!1581106 m!1452237))

(check-sat (not b!1581109) (not b!1581105) (not start!137324) tp_is_empty!39231 (not b!1581111) (not b!1581106) (not b!1581104) (not b!1581107) (not b!1581110) (not b!1581112))
(check-sat)
(get-model)

(declare-fun d!166617 () Bool)

(declare-fun lt!676890 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!843 (List!36825) (InoxSet tuple2!25556))

(assert (=> d!166617 (= lt!676890 (select (content!843 l!1390) lt!676881))))

(declare-fun e!882200 () Bool)

(assert (=> d!166617 (= lt!676890 e!882200)))

(declare-fun res!1080188 () Bool)

(assert (=> d!166617 (=> (not res!1080188) (not e!882200))))

(assert (=> d!166617 (= res!1080188 ((_ is Cons!36821) l!1390))))

(assert (=> d!166617 (= (contains!10497 l!1390 lt!676881) lt!676890)))

(declare-fun b!1581144 () Bool)

(declare-fun e!882199 () Bool)

(assert (=> b!1581144 (= e!882200 e!882199)))

(declare-fun res!1080189 () Bool)

(assert (=> b!1581144 (=> res!1080189 e!882199)))

(assert (=> b!1581144 (= res!1080189 (= (h!38364 l!1390) lt!676881))))

(declare-fun b!1581145 () Bool)

(assert (=> b!1581145 (= e!882199 (contains!10497 (t!51739 l!1390) lt!676881))))

(assert (= (and d!166617 res!1080188) b!1581144))

(assert (= (and b!1581144 (not res!1080189)) b!1581145))

(declare-fun m!1452257 () Bool)

(assert (=> d!166617 m!1452257))

(declare-fun m!1452259 () Bool)

(assert (=> d!166617 m!1452259))

(assert (=> b!1581145 m!1452237))

(assert (=> b!1581111 d!166617))

(declare-fun d!166627 () Bool)

(declare-fun lt!676893 () Bool)

(assert (=> d!166627 (= lt!676893 (select (content!843 (t!51739 l!1390)) lt!676881))))

(declare-fun e!882204 () Bool)

(assert (=> d!166627 (= lt!676893 e!882204)))

(declare-fun res!1080192 () Bool)

(assert (=> d!166627 (=> (not res!1080192) (not e!882204))))

(assert (=> d!166627 (= res!1080192 ((_ is Cons!36821) (t!51739 l!1390)))))

(assert (=> d!166627 (= (contains!10497 (t!51739 l!1390) lt!676881) lt!676893)))

(declare-fun b!1581148 () Bool)

(declare-fun e!882203 () Bool)

(assert (=> b!1581148 (= e!882204 e!882203)))

(declare-fun res!1080193 () Bool)

(assert (=> b!1581148 (=> res!1080193 e!882203)))

(assert (=> b!1581148 (= res!1080193 (= (h!38364 (t!51739 l!1390)) lt!676881))))

(declare-fun b!1581149 () Bool)

(assert (=> b!1581149 (= e!882203 (contains!10497 (t!51739 (t!51739 l!1390)) lt!676881))))

(assert (= (and d!166627 res!1080192) b!1581148))

(assert (= (and b!1581148 (not res!1080193)) b!1581149))

(declare-fun m!1452261 () Bool)

(assert (=> d!166627 m!1452261))

(declare-fun m!1452263 () Bool)

(assert (=> d!166627 m!1452263))

(declare-fun m!1452265 () Bool)

(assert (=> b!1581149 m!1452265))

(assert (=> b!1581106 d!166627))

(declare-fun d!166629 () Bool)

(declare-fun res!1080206 () Bool)

(declare-fun e!882217 () Bool)

(assert (=> d!166629 (=> res!1080206 e!882217)))

(assert (=> d!166629 (= res!1080206 (or ((_ is Nil!36822) (t!51739 l!1390)) ((_ is Nil!36822) (t!51739 (t!51739 l!1390)))))))

(assert (=> d!166629 (= (isStrictlySorted!1083 (t!51739 l!1390)) e!882217)))

(declare-fun b!1581162 () Bool)

(declare-fun e!882218 () Bool)

(assert (=> b!1581162 (= e!882217 e!882218)))

(declare-fun res!1080207 () Bool)

(assert (=> b!1581162 (=> (not res!1080207) (not e!882218))))

(assert (=> b!1581162 (= res!1080207 (bvslt (_1!12789 (h!38364 (t!51739 l!1390))) (_1!12789 (h!38364 (t!51739 (t!51739 l!1390))))))))

(declare-fun b!1581163 () Bool)

(assert (=> b!1581163 (= e!882218 (isStrictlySorted!1083 (t!51739 (t!51739 l!1390))))))

(assert (= (and d!166629 (not res!1080206)) b!1581162))

(assert (= (and b!1581162 res!1080207) b!1581163))

(declare-fun m!1452271 () Bool)

(assert (=> b!1581163 m!1452271))

(assert (=> b!1581104 d!166629))

(declare-fun d!166635 () Bool)

(assert (=> d!166635 (= (get!26809 lt!676880) (v!22427 lt!676880))))

(assert (=> b!1581110 d!166635))

(declare-fun d!166637 () Bool)

(declare-fun res!1080230 () Bool)

(declare-fun e!882241 () Bool)

(assert (=> d!166637 (=> res!1080230 e!882241)))

(assert (=> d!166637 (= res!1080230 (and ((_ is Cons!36821) (t!51739 l!1390)) (= (_1!12789 (h!38364 (t!51739 l!1390))) key!405)))))

(assert (=> d!166637 (= (containsKey!929 (t!51739 l!1390) key!405) e!882241)))

(declare-fun b!1581186 () Bool)

(declare-fun e!882242 () Bool)

(assert (=> b!1581186 (= e!882241 e!882242)))

(declare-fun res!1080231 () Bool)

(assert (=> b!1581186 (=> (not res!1080231) (not e!882242))))

(assert (=> b!1581186 (= res!1080231 (and (or (not ((_ is Cons!36821) (t!51739 l!1390))) (bvsle (_1!12789 (h!38364 (t!51739 l!1390))) key!405)) ((_ is Cons!36821) (t!51739 l!1390)) (bvslt (_1!12789 (h!38364 (t!51739 l!1390))) key!405)))))

(declare-fun b!1581187 () Bool)

(assert (=> b!1581187 (= e!882242 (containsKey!929 (t!51739 (t!51739 l!1390)) key!405))))

(assert (= (and d!166637 (not res!1080230)) b!1581186))

(assert (= (and b!1581186 res!1080231) b!1581187))

(declare-fun m!1452273 () Bool)

(assert (=> b!1581187 m!1452273))

(assert (=> b!1581105 d!166637))

(declare-fun d!166645 () Bool)

(declare-fun res!1080234 () Bool)

(declare-fun e!882245 () Bool)

(assert (=> d!166645 (=> res!1080234 e!882245)))

(assert (=> d!166645 (= res!1080234 (and ((_ is Cons!36821) l!1390) (= (_1!12789 (h!38364 l!1390)) key!405)))))

(assert (=> d!166645 (= (containsKey!929 l!1390 key!405) e!882245)))

(declare-fun b!1581190 () Bool)

(declare-fun e!882246 () Bool)

(assert (=> b!1581190 (= e!882245 e!882246)))

(declare-fun res!1080235 () Bool)

(assert (=> b!1581190 (=> (not res!1080235) (not e!882246))))

(assert (=> b!1581190 (= res!1080235 (and (or (not ((_ is Cons!36821) l!1390)) (bvsle (_1!12789 (h!38364 l!1390)) key!405)) ((_ is Cons!36821) l!1390) (bvslt (_1!12789 (h!38364 l!1390)) key!405)))))

(declare-fun b!1581191 () Bool)

(assert (=> b!1581191 (= e!882246 (containsKey!929 (t!51739 l!1390) key!405))))

(assert (= (and d!166645 (not res!1080234)) b!1581190))

(assert (= (and b!1581190 res!1080235) b!1581191))

(assert (=> b!1581191 m!1452233))

(assert (=> b!1581109 d!166645))

(declare-fun d!166649 () Bool)

(declare-fun res!1080240 () Bool)

(declare-fun e!882251 () Bool)

(assert (=> d!166649 (=> res!1080240 e!882251)))

(assert (=> d!166649 (= res!1080240 (or ((_ is Nil!36822) l!1390) ((_ is Nil!36822) (t!51739 l!1390))))))

(assert (=> d!166649 (= (isStrictlySorted!1083 l!1390) e!882251)))

(declare-fun b!1581196 () Bool)

(declare-fun e!882252 () Bool)

(assert (=> b!1581196 (= e!882251 e!882252)))

(declare-fun res!1080241 () Bool)

(assert (=> b!1581196 (=> (not res!1080241) (not e!882252))))

(assert (=> b!1581196 (= res!1080241 (bvslt (_1!12789 (h!38364 l!1390)) (_1!12789 (h!38364 (t!51739 l!1390)))))))

(declare-fun b!1581197 () Bool)

(assert (=> b!1581197 (= e!882252 (isStrictlySorted!1083 (t!51739 l!1390)))))

(assert (= (and d!166649 (not res!1080240)) b!1581196))

(assert (= (and b!1581196 res!1080241) b!1581197))

(assert (=> b!1581197 m!1452221))

(assert (=> start!137324 d!166649))

(declare-fun d!166655 () Bool)

(assert (=> d!166655 (= (isEmpty!1176 lt!676880) (not ((_ is Some!917) lt!676880)))))

(assert (=> b!1581107 d!166655))

(declare-fun d!166659 () Bool)

(assert (=> d!166659 (= (unapply!92 l!1390) (ite ((_ is Nil!36822) l!1390) None!916 (Some!917 (tuple2!25559 (h!38364 l!1390) (t!51739 l!1390)))))))

(assert (=> b!1581107 d!166659))

(declare-fun b!1581210 () Bool)

(declare-fun e!882263 () Bool)

(declare-fun tp!114551 () Bool)

(assert (=> b!1581210 (= e!882263 (and tp_is_empty!39231 tp!114551))))

(assert (=> b!1581112 (= tp!114545 e!882263)))

(assert (= (and b!1581112 ((_ is Cons!36821) (t!51739 l!1390))) b!1581210))

(check-sat (not d!166617) (not b!1581191) (not b!1581149) (not b!1581210) (not b!1581145) tp_is_empty!39231 (not b!1581163) (not b!1581187) (not d!166627) (not b!1581197))
(check-sat)
