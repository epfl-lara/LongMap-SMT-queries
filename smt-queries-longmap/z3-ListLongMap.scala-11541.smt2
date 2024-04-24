; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134742 () Bool)

(assert start!134742)

(declare-fun res!1073158 () Bool)

(declare-fun e!875975 () Bool)

(assert (=> start!134742 (=> (not res!1073158) (not e!875975))))

(declare-fun key1!37 () (_ BitVec 64))

(declare-fun key2!21 () (_ BitVec 64))

(assert (=> start!134742 (= res!1073158 (not (= key1!37 key2!21)))))

(assert (=> start!134742 e!875975))

(declare-fun tp_is_empty!39031 () Bool)

(assert (=> start!134742 tp_is_empty!39031))

(declare-fun e!875974 () Bool)

(assert (=> start!134742 e!875974))

(assert (=> start!134742 true))

(declare-fun b!1571075 () Bool)

(declare-fun tp!114048 () Bool)

(assert (=> b!1571075 (= e!875974 (and tp_is_empty!39031 tp!114048))))

(declare-fun b!1571076 () Bool)

(declare-fun res!1073157 () Bool)

(assert (=> b!1571076 (=> (not res!1073157) (not e!875975))))

(declare-datatypes ((B!2480 0))(
  ( (B!2481 (val!19602 Int)) )
))
(declare-datatypes ((tuple2!25366 0))(
  ( (tuple2!25367 (_1!12694 (_ BitVec 64)) (_2!12694 B!2480)) )
))
(declare-datatypes ((List!36754 0))(
  ( (Nil!36751) (Cons!36750 (h!38215 tuple2!25366) (t!51654 List!36754)) )
))
(declare-fun l!750 () List!36754)

(declare-fun isStrictlySorted!983 (List!36754) Bool)

(assert (=> b!1571076 (= res!1073157 (isStrictlySorted!983 l!750))))

(declare-fun v1!32 () B!2480)

(declare-fun b!1571077 () Bool)

(declare-fun insertStrictlySorted!582 (List!36754 (_ BitVec 64) B!2480) List!36754)

(assert (=> b!1571077 (= e!875975 (not (isStrictlySorted!983 (insertStrictlySorted!582 l!750 key1!37 v1!32))))))

(declare-fun v2!10 () B!2480)

(assert (=> b!1571077 (= (insertStrictlySorted!582 (insertStrictlySorted!582 (t!51654 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!582 (insertStrictlySorted!582 (t!51654 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-datatypes ((Unit!51987 0))(
  ( (Unit!51988) )
))
(declare-fun lt!674121 () Unit!51987)

(declare-fun lemmaInsertStrictlySortedCommutative!7 (List!36754 (_ BitVec 64) B!2480 (_ BitVec 64) B!2480) Unit!51987)

(assert (=> b!1571077 (= lt!674121 (lemmaInsertStrictlySortedCommutative!7 (t!51654 l!750) key1!37 v1!32 key2!21 v2!10))))

(declare-fun b!1571078 () Bool)

(declare-fun res!1073159 () Bool)

(assert (=> b!1571078 (=> (not res!1073159) (not e!875975))))

(assert (=> b!1571078 (= res!1073159 (isStrictlySorted!983 (t!51654 l!750)))))

(declare-fun b!1571079 () Bool)

(declare-fun res!1073156 () Bool)

(assert (=> b!1571079 (=> (not res!1073156) (not e!875975))))

(get-info :version)

(assert (=> b!1571079 (= res!1073156 (and ((_ is Cons!36750) l!750) (bvslt (_1!12694 (h!38215 l!750)) key1!37) (bvslt (_1!12694 (h!38215 l!750)) key2!21)))))

(assert (= (and start!134742 res!1073158) b!1571076))

(assert (= (and b!1571076 res!1073157) b!1571079))

(assert (= (and b!1571079 res!1073156) b!1571078))

(assert (= (and b!1571078 res!1073159) b!1571077))

(assert (= (and start!134742 ((_ is Cons!36750) l!750)) b!1571075))

(declare-fun m!1445499 () Bool)

(assert (=> b!1571076 m!1445499))

(declare-fun m!1445501 () Bool)

(assert (=> b!1571077 m!1445501))

(assert (=> b!1571077 m!1445501))

(declare-fun m!1445503 () Bool)

(assert (=> b!1571077 m!1445503))

(declare-fun m!1445505 () Bool)

(assert (=> b!1571077 m!1445505))

(declare-fun m!1445507 () Bool)

(assert (=> b!1571077 m!1445507))

(assert (=> b!1571077 m!1445505))

(declare-fun m!1445509 () Bool)

(assert (=> b!1571077 m!1445509))

(declare-fun m!1445511 () Bool)

(assert (=> b!1571077 m!1445511))

(assert (=> b!1571077 m!1445511))

(declare-fun m!1445513 () Bool)

(assert (=> b!1571077 m!1445513))

(declare-fun m!1445515 () Bool)

(assert (=> b!1571078 m!1445515))

(check-sat (not b!1571078) (not b!1571075) (not b!1571076) (not b!1571077) tp_is_empty!39031)
(check-sat)
(get-model)

(declare-fun d!164461 () Bool)

(declare-fun res!1073188 () Bool)

(declare-fun e!875992 () Bool)

(assert (=> d!164461 (=> res!1073188 e!875992)))

(assert (=> d!164461 (= res!1073188 (or ((_ is Nil!36751) l!750) ((_ is Nil!36751) (t!51654 l!750))))))

(assert (=> d!164461 (= (isStrictlySorted!983 l!750) e!875992)))

(declare-fun b!1571114 () Bool)

(declare-fun e!875993 () Bool)

(assert (=> b!1571114 (= e!875992 e!875993)))

(declare-fun res!1073189 () Bool)

(assert (=> b!1571114 (=> (not res!1073189) (not e!875993))))

(assert (=> b!1571114 (= res!1073189 (bvslt (_1!12694 (h!38215 l!750)) (_1!12694 (h!38215 (t!51654 l!750)))))))

(declare-fun b!1571115 () Bool)

(assert (=> b!1571115 (= e!875993 (isStrictlySorted!983 (t!51654 l!750)))))

(assert (= (and d!164461 (not res!1073188)) b!1571114))

(assert (= (and b!1571114 res!1073189) b!1571115))

(assert (=> b!1571115 m!1445515))

(assert (=> b!1571076 d!164461))

(declare-fun d!164463 () Bool)

(assert (=> d!164463 (= (insertStrictlySorted!582 (insertStrictlySorted!582 (t!51654 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!582 (insertStrictlySorted!582 (t!51654 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-fun lt!674130 () Unit!51987)

(declare-fun choose!2072 (List!36754 (_ BitVec 64) B!2480 (_ BitVec 64) B!2480) Unit!51987)

(assert (=> d!164463 (= lt!674130 (choose!2072 (t!51654 l!750) key1!37 v1!32 key2!21 v2!10))))

(assert (=> d!164463 (not (= key1!37 key2!21))))

(assert (=> d!164463 (= (lemmaInsertStrictlySortedCommutative!7 (t!51654 l!750) key1!37 v1!32 key2!21 v2!10) lt!674130)))

(declare-fun bs!45205 () Bool)

(assert (= bs!45205 d!164463))

(assert (=> bs!45205 m!1445505))

(assert (=> bs!45205 m!1445507))

(assert (=> bs!45205 m!1445505))

(assert (=> bs!45205 m!1445501))

(declare-fun m!1445553 () Bool)

(assert (=> bs!45205 m!1445553))

(assert (=> bs!45205 m!1445501))

(assert (=> bs!45205 m!1445503))

(assert (=> b!1571077 d!164463))

(declare-fun d!164465 () Bool)

(declare-fun res!1073190 () Bool)

(declare-fun e!875994 () Bool)

(assert (=> d!164465 (=> res!1073190 e!875994)))

(assert (=> d!164465 (= res!1073190 (or ((_ is Nil!36751) (insertStrictlySorted!582 l!750 key1!37 v1!32)) ((_ is Nil!36751) (t!51654 (insertStrictlySorted!582 l!750 key1!37 v1!32)))))))

(assert (=> d!164465 (= (isStrictlySorted!983 (insertStrictlySorted!582 l!750 key1!37 v1!32)) e!875994)))

(declare-fun b!1571116 () Bool)

(declare-fun e!875995 () Bool)

(assert (=> b!1571116 (= e!875994 e!875995)))

(declare-fun res!1073191 () Bool)

(assert (=> b!1571116 (=> (not res!1073191) (not e!875995))))

(assert (=> b!1571116 (= res!1073191 (bvslt (_1!12694 (h!38215 (insertStrictlySorted!582 l!750 key1!37 v1!32))) (_1!12694 (h!38215 (t!51654 (insertStrictlySorted!582 l!750 key1!37 v1!32))))))))

(declare-fun b!1571117 () Bool)

(assert (=> b!1571117 (= e!875995 (isStrictlySorted!983 (t!51654 (insertStrictlySorted!582 l!750 key1!37 v1!32))))))

(assert (= (and d!164465 (not res!1073190)) b!1571116))

(assert (= (and b!1571116 res!1073191) b!1571117))

(declare-fun m!1445555 () Bool)

(assert (=> b!1571117 m!1445555))

(assert (=> b!1571077 d!164465))

(declare-fun bm!72093 () Bool)

(declare-fun call!72098 () List!36754)

(declare-fun call!72097 () List!36754)

(assert (=> bm!72093 (= call!72098 call!72097)))

(declare-fun b!1571158 () Bool)

(declare-fun res!1073208 () Bool)

(declare-fun e!876023 () Bool)

(assert (=> b!1571158 (=> (not res!1073208) (not e!876023))))

(declare-fun lt!674141 () List!36754)

(declare-fun containsKey!857 (List!36754 (_ BitVec 64)) Bool)

(assert (=> b!1571158 (= res!1073208 (containsKey!857 lt!674141 key1!37))))

(declare-fun b!1571159 () Bool)

(declare-fun e!876026 () List!36754)

(assert (=> b!1571159 (= e!876026 call!72098)))

(declare-fun bm!72094 () Bool)

(declare-fun call!72096 () List!36754)

(assert (=> bm!72094 (= call!72097 call!72096)))

(declare-fun c!145349 () Bool)

(declare-fun bm!72095 () Bool)

(declare-fun e!876020 () List!36754)

(declare-fun $colon$colon!985 (List!36754 tuple2!25366) List!36754)

(assert (=> bm!72095 (= call!72096 ($colon$colon!985 e!876020 (ite c!145349 (h!38215 l!750) (tuple2!25367 key1!37 v1!32))))))

(declare-fun c!145350 () Bool)

(assert (=> bm!72095 (= c!145350 c!145349)))

(declare-fun d!164467 () Bool)

(assert (=> d!164467 e!876023))

(declare-fun res!1073209 () Bool)

(assert (=> d!164467 (=> (not res!1073209) (not e!876023))))

(assert (=> d!164467 (= res!1073209 (isStrictlySorted!983 lt!674141))))

(declare-fun e!876024 () List!36754)

(assert (=> d!164467 (= lt!674141 e!876024)))

(assert (=> d!164467 (= c!145349 (and ((_ is Cons!36750) l!750) (bvslt (_1!12694 (h!38215 l!750)) key1!37)))))

(assert (=> d!164467 (isStrictlySorted!983 l!750)))

(assert (=> d!164467 (= (insertStrictlySorted!582 l!750 key1!37 v1!32) lt!674141)))

(declare-fun b!1571160 () Bool)

(declare-fun e!876021 () List!36754)

(assert (=> b!1571160 (= e!876021 call!72097)))

(declare-fun b!1571161 () Bool)

(declare-fun contains!10461 (List!36754 tuple2!25366) Bool)

(assert (=> b!1571161 (= e!876023 (contains!10461 lt!674141 (tuple2!25367 key1!37 v1!32)))))

(declare-fun b!1571162 () Bool)

(declare-fun c!145345 () Bool)

(assert (=> b!1571162 (= c!145345 (and ((_ is Cons!36750) l!750) (bvsgt (_1!12694 (h!38215 l!750)) key1!37)))))

(assert (=> b!1571162 (= e!876021 e!876026)))

(declare-fun b!1571163 () Bool)

(assert (=> b!1571163 (= e!876024 call!72096)))

(declare-fun b!1571164 () Bool)

(assert (=> b!1571164 (= e!876020 (insertStrictlySorted!582 (t!51654 l!750) key1!37 v1!32))))

(declare-fun b!1571165 () Bool)

(assert (=> b!1571165 (= e!876026 call!72098)))

(declare-fun b!1571166 () Bool)

(declare-fun c!145347 () Bool)

(assert (=> b!1571166 (= e!876020 (ite c!145347 (t!51654 l!750) (ite c!145345 (Cons!36750 (h!38215 l!750) (t!51654 l!750)) Nil!36751)))))

(declare-fun b!1571167 () Bool)

(assert (=> b!1571167 (= e!876024 e!876021)))

(assert (=> b!1571167 (= c!145347 (and ((_ is Cons!36750) l!750) (= (_1!12694 (h!38215 l!750)) key1!37)))))

(assert (= (and d!164467 c!145349) b!1571163))

(assert (= (and d!164467 (not c!145349)) b!1571167))

(assert (= (and b!1571167 c!145347) b!1571160))

(assert (= (and b!1571167 (not c!145347)) b!1571162))

(assert (= (and b!1571162 c!145345) b!1571165))

(assert (= (and b!1571162 (not c!145345)) b!1571159))

(assert (= (or b!1571165 b!1571159) bm!72093))

(assert (= (or b!1571160 bm!72093) bm!72094))

(assert (= (or b!1571163 bm!72094) bm!72095))

(assert (= (and bm!72095 c!145350) b!1571164))

(assert (= (and bm!72095 (not c!145350)) b!1571166))

(assert (= (and d!164467 res!1073209) b!1571158))

(assert (= (and b!1571158 res!1073208) b!1571161))

(declare-fun m!1445567 () Bool)

(assert (=> d!164467 m!1445567))

(assert (=> d!164467 m!1445499))

(assert (=> b!1571164 m!1445505))

(declare-fun m!1445569 () Bool)

(assert (=> bm!72095 m!1445569))

(declare-fun m!1445571 () Bool)

(assert (=> b!1571158 m!1445571))

(declare-fun m!1445573 () Bool)

(assert (=> b!1571161 m!1445573))

(assert (=> b!1571077 d!164467))

(declare-fun bm!72102 () Bool)

(declare-fun call!72107 () List!36754)

(declare-fun call!72106 () List!36754)

(assert (=> bm!72102 (= call!72107 call!72106)))

(declare-fun b!1571176 () Bool)

(declare-fun res!1073212 () Bool)

(declare-fun e!876033 () Bool)

(assert (=> b!1571176 (=> (not res!1073212) (not e!876033))))

(declare-fun lt!674142 () List!36754)

(assert (=> b!1571176 (= res!1073212 (containsKey!857 lt!674142 key2!21))))

(declare-fun b!1571177 () Bool)

(declare-fun e!876035 () List!36754)

(assert (=> b!1571177 (= e!876035 call!72107)))

(declare-fun bm!72103 () Bool)

(declare-fun call!72105 () List!36754)

(assert (=> bm!72103 (= call!72106 call!72105)))

(declare-fun c!145355 () Bool)

(declare-fun e!876031 () List!36754)

(declare-fun bm!72104 () Bool)

(assert (=> bm!72104 (= call!72105 ($colon$colon!985 e!876031 (ite c!145355 (h!38215 (insertStrictlySorted!582 (t!51654 l!750) key1!37 v1!32)) (tuple2!25367 key2!21 v2!10))))))

(declare-fun c!145356 () Bool)

(assert (=> bm!72104 (= c!145356 c!145355)))

(declare-fun d!164483 () Bool)

(assert (=> d!164483 e!876033))

(declare-fun res!1073213 () Bool)

(assert (=> d!164483 (=> (not res!1073213) (not e!876033))))

(assert (=> d!164483 (= res!1073213 (isStrictlySorted!983 lt!674142))))

(declare-fun e!876034 () List!36754)

(assert (=> d!164483 (= lt!674142 e!876034)))

(assert (=> d!164483 (= c!145355 (and ((_ is Cons!36750) (insertStrictlySorted!582 (t!51654 l!750) key1!37 v1!32)) (bvslt (_1!12694 (h!38215 (insertStrictlySorted!582 (t!51654 l!750) key1!37 v1!32))) key2!21)))))

(assert (=> d!164483 (isStrictlySorted!983 (insertStrictlySorted!582 (t!51654 l!750) key1!37 v1!32))))

(assert (=> d!164483 (= (insertStrictlySorted!582 (insertStrictlySorted!582 (t!51654 l!750) key1!37 v1!32) key2!21 v2!10) lt!674142)))

(declare-fun b!1571178 () Bool)

(declare-fun e!876032 () List!36754)

(assert (=> b!1571178 (= e!876032 call!72106)))

(declare-fun b!1571179 () Bool)

(assert (=> b!1571179 (= e!876033 (contains!10461 lt!674142 (tuple2!25367 key2!21 v2!10)))))

(declare-fun c!145353 () Bool)

(declare-fun b!1571180 () Bool)

(assert (=> b!1571180 (= c!145353 (and ((_ is Cons!36750) (insertStrictlySorted!582 (t!51654 l!750) key1!37 v1!32)) (bvsgt (_1!12694 (h!38215 (insertStrictlySorted!582 (t!51654 l!750) key1!37 v1!32))) key2!21)))))

(assert (=> b!1571180 (= e!876032 e!876035)))

(declare-fun b!1571181 () Bool)

(assert (=> b!1571181 (= e!876034 call!72105)))

(declare-fun b!1571182 () Bool)

(assert (=> b!1571182 (= e!876031 (insertStrictlySorted!582 (t!51654 (insertStrictlySorted!582 (t!51654 l!750) key1!37 v1!32)) key2!21 v2!10))))

(declare-fun b!1571183 () Bool)

(assert (=> b!1571183 (= e!876035 call!72107)))

(declare-fun b!1571184 () Bool)

(declare-fun c!145354 () Bool)

(assert (=> b!1571184 (= e!876031 (ite c!145354 (t!51654 (insertStrictlySorted!582 (t!51654 l!750) key1!37 v1!32)) (ite c!145353 (Cons!36750 (h!38215 (insertStrictlySorted!582 (t!51654 l!750) key1!37 v1!32)) (t!51654 (insertStrictlySorted!582 (t!51654 l!750) key1!37 v1!32))) Nil!36751)))))

(declare-fun b!1571186 () Bool)

(assert (=> b!1571186 (= e!876034 e!876032)))

(assert (=> b!1571186 (= c!145354 (and ((_ is Cons!36750) (insertStrictlySorted!582 (t!51654 l!750) key1!37 v1!32)) (= (_1!12694 (h!38215 (insertStrictlySorted!582 (t!51654 l!750) key1!37 v1!32))) key2!21)))))

(assert (= (and d!164483 c!145355) b!1571181))

(assert (= (and d!164483 (not c!145355)) b!1571186))

(assert (= (and b!1571186 c!145354) b!1571178))

(assert (= (and b!1571186 (not c!145354)) b!1571180))

(assert (= (and b!1571180 c!145353) b!1571183))

(assert (= (and b!1571180 (not c!145353)) b!1571177))

(assert (= (or b!1571183 b!1571177) bm!72102))

(assert (= (or b!1571178 bm!72102) bm!72103))

(assert (= (or b!1571181 bm!72103) bm!72104))

(assert (= (and bm!72104 c!145356) b!1571182))

(assert (= (and bm!72104 (not c!145356)) b!1571184))

(assert (= (and d!164483 res!1073213) b!1571176))

(assert (= (and b!1571176 res!1073212) b!1571179))

(declare-fun m!1445575 () Bool)

(assert (=> d!164483 m!1445575))

(assert (=> d!164483 m!1445505))

(declare-fun m!1445577 () Bool)

(assert (=> d!164483 m!1445577))

(declare-fun m!1445579 () Bool)

(assert (=> b!1571182 m!1445579))

(declare-fun m!1445581 () Bool)

(assert (=> bm!72104 m!1445581))

(declare-fun m!1445583 () Bool)

(assert (=> b!1571176 m!1445583))

(declare-fun m!1445585 () Bool)

(assert (=> b!1571179 m!1445585))

(assert (=> b!1571077 d!164483))

(declare-fun bm!72105 () Bool)

(declare-fun call!72110 () List!36754)

(declare-fun call!72109 () List!36754)

(assert (=> bm!72105 (= call!72110 call!72109)))

(declare-fun b!1571192 () Bool)

(declare-fun res!1073218 () Bool)

(declare-fun e!876042 () Bool)

(assert (=> b!1571192 (=> (not res!1073218) (not e!876042))))

(declare-fun lt!674143 () List!36754)

(assert (=> b!1571192 (= res!1073218 (containsKey!857 lt!674143 key2!21))))

(declare-fun b!1571193 () Bool)

(declare-fun e!876044 () List!36754)

(assert (=> b!1571193 (= e!876044 call!72110)))

(declare-fun bm!72106 () Bool)

(declare-fun call!72108 () List!36754)

(assert (=> bm!72106 (= call!72109 call!72108)))

(declare-fun bm!72107 () Bool)

(declare-fun e!876040 () List!36754)

(declare-fun c!145361 () Bool)

(assert (=> bm!72107 (= call!72108 ($colon$colon!985 e!876040 (ite c!145361 (h!38215 (t!51654 l!750)) (tuple2!25367 key2!21 v2!10))))))

(declare-fun c!145362 () Bool)

(assert (=> bm!72107 (= c!145362 c!145361)))

(declare-fun d!164485 () Bool)

(assert (=> d!164485 e!876042))

(declare-fun res!1073219 () Bool)

(assert (=> d!164485 (=> (not res!1073219) (not e!876042))))

(assert (=> d!164485 (= res!1073219 (isStrictlySorted!983 lt!674143))))

(declare-fun e!876043 () List!36754)

(assert (=> d!164485 (= lt!674143 e!876043)))

(assert (=> d!164485 (= c!145361 (and ((_ is Cons!36750) (t!51654 l!750)) (bvslt (_1!12694 (h!38215 (t!51654 l!750))) key2!21)))))

(assert (=> d!164485 (isStrictlySorted!983 (t!51654 l!750))))

(assert (=> d!164485 (= (insertStrictlySorted!582 (t!51654 l!750) key2!21 v2!10) lt!674143)))

(declare-fun b!1571194 () Bool)

(declare-fun e!876041 () List!36754)

(assert (=> b!1571194 (= e!876041 call!72109)))

(declare-fun b!1571195 () Bool)

(assert (=> b!1571195 (= e!876042 (contains!10461 lt!674143 (tuple2!25367 key2!21 v2!10)))))

(declare-fun b!1571196 () Bool)

(declare-fun c!145359 () Bool)

(assert (=> b!1571196 (= c!145359 (and ((_ is Cons!36750) (t!51654 l!750)) (bvsgt (_1!12694 (h!38215 (t!51654 l!750))) key2!21)))))

(assert (=> b!1571196 (= e!876041 e!876044)))

(declare-fun b!1571197 () Bool)

(assert (=> b!1571197 (= e!876043 call!72108)))

(declare-fun b!1571198 () Bool)

(assert (=> b!1571198 (= e!876040 (insertStrictlySorted!582 (t!51654 (t!51654 l!750)) key2!21 v2!10))))

(declare-fun b!1571199 () Bool)

(assert (=> b!1571199 (= e!876044 call!72110)))

(declare-fun b!1571200 () Bool)

(declare-fun c!145360 () Bool)

(assert (=> b!1571200 (= e!876040 (ite c!145360 (t!51654 (t!51654 l!750)) (ite c!145359 (Cons!36750 (h!38215 (t!51654 l!750)) (t!51654 (t!51654 l!750))) Nil!36751)))))

(declare-fun b!1571201 () Bool)

(assert (=> b!1571201 (= e!876043 e!876041)))

(assert (=> b!1571201 (= c!145360 (and ((_ is Cons!36750) (t!51654 l!750)) (= (_1!12694 (h!38215 (t!51654 l!750))) key2!21)))))

(assert (= (and d!164485 c!145361) b!1571197))

(assert (= (and d!164485 (not c!145361)) b!1571201))

(assert (= (and b!1571201 c!145360) b!1571194))

(assert (= (and b!1571201 (not c!145360)) b!1571196))

(assert (= (and b!1571196 c!145359) b!1571199))

(assert (= (and b!1571196 (not c!145359)) b!1571193))

(assert (= (or b!1571199 b!1571193) bm!72105))

(assert (= (or b!1571194 bm!72105) bm!72106))

(assert (= (or b!1571197 bm!72106) bm!72107))

(assert (= (and bm!72107 c!145362) b!1571198))

(assert (= (and bm!72107 (not c!145362)) b!1571200))

(assert (= (and d!164485 res!1073219) b!1571192))

(assert (= (and b!1571192 res!1073218) b!1571195))

(declare-fun m!1445587 () Bool)

(assert (=> d!164485 m!1445587))

(assert (=> d!164485 m!1445515))

(declare-fun m!1445589 () Bool)

(assert (=> b!1571198 m!1445589))

(declare-fun m!1445591 () Bool)

(assert (=> bm!72107 m!1445591))

(declare-fun m!1445593 () Bool)

(assert (=> b!1571192 m!1445593))

(declare-fun m!1445595 () Bool)

(assert (=> b!1571195 m!1445595))

(assert (=> b!1571077 d!164485))

(declare-fun bm!72108 () Bool)

(declare-fun call!72113 () List!36754)

(declare-fun call!72112 () List!36754)

(assert (=> bm!72108 (= call!72113 call!72112)))

(declare-fun b!1571202 () Bool)

(declare-fun res!1073220 () Bool)

(declare-fun e!876047 () Bool)

(assert (=> b!1571202 (=> (not res!1073220) (not e!876047))))

(declare-fun lt!674144 () List!36754)

(assert (=> b!1571202 (= res!1073220 (containsKey!857 lt!674144 key1!37))))

(declare-fun b!1571203 () Bool)

(declare-fun e!876049 () List!36754)

(assert (=> b!1571203 (= e!876049 call!72113)))

(declare-fun bm!72109 () Bool)

(declare-fun call!72111 () List!36754)

(assert (=> bm!72109 (= call!72112 call!72111)))

(declare-fun e!876045 () List!36754)

(declare-fun c!145365 () Bool)

(declare-fun bm!72110 () Bool)

(assert (=> bm!72110 (= call!72111 ($colon$colon!985 e!876045 (ite c!145365 (h!38215 (insertStrictlySorted!582 (t!51654 l!750) key2!21 v2!10)) (tuple2!25367 key1!37 v1!32))))))

(declare-fun c!145366 () Bool)

(assert (=> bm!72110 (= c!145366 c!145365)))

(declare-fun d!164487 () Bool)

(assert (=> d!164487 e!876047))

(declare-fun res!1073221 () Bool)

(assert (=> d!164487 (=> (not res!1073221) (not e!876047))))

(assert (=> d!164487 (= res!1073221 (isStrictlySorted!983 lt!674144))))

(declare-fun e!876048 () List!36754)

(assert (=> d!164487 (= lt!674144 e!876048)))

(assert (=> d!164487 (= c!145365 (and ((_ is Cons!36750) (insertStrictlySorted!582 (t!51654 l!750) key2!21 v2!10)) (bvslt (_1!12694 (h!38215 (insertStrictlySorted!582 (t!51654 l!750) key2!21 v2!10))) key1!37)))))

(assert (=> d!164487 (isStrictlySorted!983 (insertStrictlySorted!582 (t!51654 l!750) key2!21 v2!10))))

(assert (=> d!164487 (= (insertStrictlySorted!582 (insertStrictlySorted!582 (t!51654 l!750) key2!21 v2!10) key1!37 v1!32) lt!674144)))

(declare-fun b!1571204 () Bool)

(declare-fun e!876046 () List!36754)

(assert (=> b!1571204 (= e!876046 call!72112)))

(declare-fun b!1571205 () Bool)

(assert (=> b!1571205 (= e!876047 (contains!10461 lt!674144 (tuple2!25367 key1!37 v1!32)))))

(declare-fun c!145363 () Bool)

(declare-fun b!1571206 () Bool)

(assert (=> b!1571206 (= c!145363 (and ((_ is Cons!36750) (insertStrictlySorted!582 (t!51654 l!750) key2!21 v2!10)) (bvsgt (_1!12694 (h!38215 (insertStrictlySorted!582 (t!51654 l!750) key2!21 v2!10))) key1!37)))))

(assert (=> b!1571206 (= e!876046 e!876049)))

(declare-fun b!1571207 () Bool)

(assert (=> b!1571207 (= e!876048 call!72111)))

(declare-fun b!1571208 () Bool)

(assert (=> b!1571208 (= e!876045 (insertStrictlySorted!582 (t!51654 (insertStrictlySorted!582 (t!51654 l!750) key2!21 v2!10)) key1!37 v1!32))))

(declare-fun b!1571209 () Bool)

(assert (=> b!1571209 (= e!876049 call!72113)))

(declare-fun c!145364 () Bool)

(declare-fun b!1571210 () Bool)

(assert (=> b!1571210 (= e!876045 (ite c!145364 (t!51654 (insertStrictlySorted!582 (t!51654 l!750) key2!21 v2!10)) (ite c!145363 (Cons!36750 (h!38215 (insertStrictlySorted!582 (t!51654 l!750) key2!21 v2!10)) (t!51654 (insertStrictlySorted!582 (t!51654 l!750) key2!21 v2!10))) Nil!36751)))))

(declare-fun b!1571211 () Bool)

(assert (=> b!1571211 (= e!876048 e!876046)))

(assert (=> b!1571211 (= c!145364 (and ((_ is Cons!36750) (insertStrictlySorted!582 (t!51654 l!750) key2!21 v2!10)) (= (_1!12694 (h!38215 (insertStrictlySorted!582 (t!51654 l!750) key2!21 v2!10))) key1!37)))))

(assert (= (and d!164487 c!145365) b!1571207))

(assert (= (and d!164487 (not c!145365)) b!1571211))

(assert (= (and b!1571211 c!145364) b!1571204))

(assert (= (and b!1571211 (not c!145364)) b!1571206))

(assert (= (and b!1571206 c!145363) b!1571209))

(assert (= (and b!1571206 (not c!145363)) b!1571203))

(assert (= (or b!1571209 b!1571203) bm!72108))

(assert (= (or b!1571204 bm!72108) bm!72109))

(assert (= (or b!1571207 bm!72109) bm!72110))

(assert (= (and bm!72110 c!145366) b!1571208))

(assert (= (and bm!72110 (not c!145366)) b!1571210))

(assert (= (and d!164487 res!1073221) b!1571202))

(assert (= (and b!1571202 res!1073220) b!1571205))

(declare-fun m!1445605 () Bool)

(assert (=> d!164487 m!1445605))

(assert (=> d!164487 m!1445501))

(declare-fun m!1445607 () Bool)

(assert (=> d!164487 m!1445607))

(declare-fun m!1445609 () Bool)

(assert (=> b!1571208 m!1445609))

(declare-fun m!1445611 () Bool)

(assert (=> bm!72110 m!1445611))

(declare-fun m!1445613 () Bool)

(assert (=> b!1571202 m!1445613))

(declare-fun m!1445615 () Bool)

(assert (=> b!1571205 m!1445615))

(assert (=> b!1571077 d!164487))

(declare-fun bm!72117 () Bool)

(declare-fun call!72122 () List!36754)

(declare-fun call!72121 () List!36754)

(assert (=> bm!72117 (= call!72122 call!72121)))

(declare-fun b!1571232 () Bool)

(declare-fun res!1073226 () Bool)

(declare-fun e!876062 () Bool)

(assert (=> b!1571232 (=> (not res!1073226) (not e!876062))))

(declare-fun lt!674147 () List!36754)

(assert (=> b!1571232 (= res!1073226 (containsKey!857 lt!674147 key1!37))))

(declare-fun b!1571233 () Bool)

(declare-fun e!876064 () List!36754)

(assert (=> b!1571233 (= e!876064 call!72122)))

(declare-fun bm!72118 () Bool)

(declare-fun call!72120 () List!36754)

(assert (=> bm!72118 (= call!72121 call!72120)))

(declare-fun e!876060 () List!36754)

(declare-fun c!145377 () Bool)

(declare-fun bm!72119 () Bool)

(assert (=> bm!72119 (= call!72120 ($colon$colon!985 e!876060 (ite c!145377 (h!38215 (t!51654 l!750)) (tuple2!25367 key1!37 v1!32))))))

(declare-fun c!145378 () Bool)

(assert (=> bm!72119 (= c!145378 c!145377)))

(declare-fun d!164491 () Bool)

(assert (=> d!164491 e!876062))

(declare-fun res!1073227 () Bool)

(assert (=> d!164491 (=> (not res!1073227) (not e!876062))))

(assert (=> d!164491 (= res!1073227 (isStrictlySorted!983 lt!674147))))

(declare-fun e!876063 () List!36754)

(assert (=> d!164491 (= lt!674147 e!876063)))

(assert (=> d!164491 (= c!145377 (and ((_ is Cons!36750) (t!51654 l!750)) (bvslt (_1!12694 (h!38215 (t!51654 l!750))) key1!37)))))

(assert (=> d!164491 (isStrictlySorted!983 (t!51654 l!750))))

(assert (=> d!164491 (= (insertStrictlySorted!582 (t!51654 l!750) key1!37 v1!32) lt!674147)))

(declare-fun b!1571234 () Bool)

(declare-fun e!876061 () List!36754)

(assert (=> b!1571234 (= e!876061 call!72121)))

(declare-fun b!1571235 () Bool)

(assert (=> b!1571235 (= e!876062 (contains!10461 lt!674147 (tuple2!25367 key1!37 v1!32)))))

(declare-fun b!1571236 () Bool)

(declare-fun c!145375 () Bool)

(assert (=> b!1571236 (= c!145375 (and ((_ is Cons!36750) (t!51654 l!750)) (bvsgt (_1!12694 (h!38215 (t!51654 l!750))) key1!37)))))

(assert (=> b!1571236 (= e!876061 e!876064)))

(declare-fun b!1571237 () Bool)

(assert (=> b!1571237 (= e!876063 call!72120)))

(declare-fun b!1571238 () Bool)

(assert (=> b!1571238 (= e!876060 (insertStrictlySorted!582 (t!51654 (t!51654 l!750)) key1!37 v1!32))))

(declare-fun b!1571239 () Bool)

(assert (=> b!1571239 (= e!876064 call!72122)))

(declare-fun c!145376 () Bool)

(declare-fun b!1571240 () Bool)

(assert (=> b!1571240 (= e!876060 (ite c!145376 (t!51654 (t!51654 l!750)) (ite c!145375 (Cons!36750 (h!38215 (t!51654 l!750)) (t!51654 (t!51654 l!750))) Nil!36751)))))

(declare-fun b!1571241 () Bool)

(assert (=> b!1571241 (= e!876063 e!876061)))

(assert (=> b!1571241 (= c!145376 (and ((_ is Cons!36750) (t!51654 l!750)) (= (_1!12694 (h!38215 (t!51654 l!750))) key1!37)))))

(assert (= (and d!164491 c!145377) b!1571237))

(assert (= (and d!164491 (not c!145377)) b!1571241))

(assert (= (and b!1571241 c!145376) b!1571234))

(assert (= (and b!1571241 (not c!145376)) b!1571236))

(assert (= (and b!1571236 c!145375) b!1571239))

(assert (= (and b!1571236 (not c!145375)) b!1571233))

(assert (= (or b!1571239 b!1571233) bm!72117))

(assert (= (or b!1571234 bm!72117) bm!72118))

(assert (= (or b!1571237 bm!72118) bm!72119))

(assert (= (and bm!72119 c!145378) b!1571238))

(assert (= (and bm!72119 (not c!145378)) b!1571240))

(assert (= (and d!164491 res!1073227) b!1571232))

(assert (= (and b!1571232 res!1073226) b!1571235))

(declare-fun m!1445639 () Bool)

(assert (=> d!164491 m!1445639))

(assert (=> d!164491 m!1445515))

(declare-fun m!1445641 () Bool)

(assert (=> b!1571238 m!1445641))

(declare-fun m!1445643 () Bool)

(assert (=> bm!72119 m!1445643))

(declare-fun m!1445645 () Bool)

(assert (=> b!1571232 m!1445645))

(declare-fun m!1445647 () Bool)

(assert (=> b!1571235 m!1445647))

(assert (=> b!1571077 d!164491))

(declare-fun d!164497 () Bool)

(declare-fun res!1073232 () Bool)

(declare-fun e!876075 () Bool)

(assert (=> d!164497 (=> res!1073232 e!876075)))

(assert (=> d!164497 (= res!1073232 (or ((_ is Nil!36751) (t!51654 l!750)) ((_ is Nil!36751) (t!51654 (t!51654 l!750)))))))

(assert (=> d!164497 (= (isStrictlySorted!983 (t!51654 l!750)) e!876075)))

(declare-fun b!1571262 () Bool)

(declare-fun e!876076 () Bool)

(assert (=> b!1571262 (= e!876075 e!876076)))

(declare-fun res!1073233 () Bool)

(assert (=> b!1571262 (=> (not res!1073233) (not e!876076))))

(assert (=> b!1571262 (= res!1073233 (bvslt (_1!12694 (h!38215 (t!51654 l!750))) (_1!12694 (h!38215 (t!51654 (t!51654 l!750))))))))

(declare-fun b!1571263 () Bool)

(assert (=> b!1571263 (= e!876076 (isStrictlySorted!983 (t!51654 (t!51654 l!750))))))

(assert (= (and d!164497 (not res!1073232)) b!1571262))

(assert (= (and b!1571262 res!1073233) b!1571263))

(declare-fun m!1445651 () Bool)

(assert (=> b!1571263 m!1445651))

(assert (=> b!1571078 d!164497))

(declare-fun b!1571278 () Bool)

(declare-fun e!876084 () Bool)

(declare-fun tp!114057 () Bool)

(assert (=> b!1571278 (= e!876084 (and tp_is_empty!39031 tp!114057))))

(assert (=> b!1571075 (= tp!114048 e!876084)))

(assert (= (and b!1571075 ((_ is Cons!36750) (t!51654 l!750))) b!1571278))

(check-sat (not d!164463) (not b!1571115) (not b!1571161) (not bm!72110) (not b!1571263) (not d!164487) (not bm!72119) (not b!1571195) (not d!164491) tp_is_empty!39031 (not b!1571278) (not d!164485) (not d!164467) (not b!1571232) (not b!1571238) (not b!1571208) (not bm!72107) (not b!1571179) (not b!1571158) (not b!1571198) (not b!1571117) (not bm!72095) (not bm!72104) (not b!1571235) (not b!1571192) (not b!1571205) (not d!164483) (not b!1571176) (not b!1571164) (not b!1571182) (not b!1571202))
(check-sat)
