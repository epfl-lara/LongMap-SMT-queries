; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1312 () Bool)

(assert start!1312)

(declare-fun b_free!413 () Bool)

(declare-fun b_next!413 () Bool)

(assert (=> start!1312 (= b_free!413 (not b_next!413))))

(declare-fun tp!1654 () Bool)

(declare-fun b_and!595 () Bool)

(assert (=> start!1312 (= tp!1654 b_and!595)))

(declare-fun b!10688 () Bool)

(declare-fun e!6225 () Bool)

(declare-fun tp_is_empty!527 () Bool)

(declare-fun tp!1653 () Bool)

(assert (=> b!10688 (= e!6225 (and tp_is_empty!527 tp!1653))))

(declare-fun b!10689 () Bool)

(declare-fun res!9030 () Bool)

(declare-fun e!6226 () Bool)

(assert (=> b!10689 (=> (not res!9030) (not e!6226))))

(declare-datatypes ((B!354 0))(
  ( (B!355 (val!272 Int)) )
))
(declare-datatypes ((tuple2!344 0))(
  ( (tuple2!345 (_1!172 (_ BitVec 64)) (_2!172 B!354)) )
))
(declare-datatypes ((List!324 0))(
  ( (Nil!321) (Cons!320 (h!886 tuple2!344) (t!2495 List!324)) )
))
(declare-fun kvs!4 () List!324)

(declare-fun isEmpty!53 (List!324) Bool)

(assert (=> b!10689 (= res!9030 (not (isEmpty!53 kvs!4)))))

(declare-fun b!10690 () Bool)

(declare-fun e!6227 () Bool)

(declare-fun tp!1655 () Bool)

(assert (=> b!10690 (= e!6227 tp!1655)))

(declare-fun b!10691 () Bool)

(assert (=> b!10691 (= e!6226 (not (not (= kvs!4 Nil!321))))))

(declare-datatypes ((ListLongMap!325 0))(
  ( (ListLongMap!326 (toList!178 List!324)) )
))
(declare-fun lm!227 () ListLongMap!325)

(declare-fun lt!2603 () tuple2!344)

(declare-fun p!216 () Int)

(declare-fun forall!43 (List!324 Int) Bool)

(declare-fun +!16 (ListLongMap!325 tuple2!344) ListLongMap!325)

(assert (=> b!10691 (forall!43 (toList!178 (+!16 lm!227 (tuple2!345 (_1!172 lt!2603) (_2!172 lt!2603)))) p!216)))

(declare-datatypes ((Unit!217 0))(
  ( (Unit!218) )
))
(declare-fun lt!2604 () Unit!217)

(declare-fun addValidProp!4 (ListLongMap!325 Int (_ BitVec 64) B!354) Unit!217)

(assert (=> b!10691 (= lt!2604 (addValidProp!4 lm!227 p!216 (_1!172 lt!2603) (_2!172 lt!2603)))))

(declare-fun head!760 (List!324) tuple2!344)

(assert (=> b!10691 (= lt!2603 (head!760 kvs!4))))

(declare-fun b!10687 () Bool)

(declare-fun res!9029 () Bool)

(assert (=> b!10687 (=> (not res!9029) (not e!6226))))

(assert (=> b!10687 (= res!9029 (forall!43 kvs!4 p!216))))

(declare-fun res!9031 () Bool)

(assert (=> start!1312 (=> (not res!9031) (not e!6226))))

(assert (=> start!1312 (= res!9031 (forall!43 (toList!178 lm!227) p!216))))

(assert (=> start!1312 e!6226))

(declare-fun inv!512 (ListLongMap!325) Bool)

(assert (=> start!1312 (and (inv!512 lm!227) e!6227)))

(assert (=> start!1312 tp!1654))

(assert (=> start!1312 e!6225))

(assert (= (and start!1312 res!9031) b!10687))

(assert (= (and b!10687 res!9029) b!10689))

(assert (= (and b!10689 res!9030) b!10691))

(assert (= start!1312 b!10690))

(assert (= (and start!1312 (is-Cons!320 kvs!4)) b!10688))

(declare-fun m!6889 () Bool)

(assert (=> b!10689 m!6889))

(declare-fun m!6891 () Bool)

(assert (=> b!10691 m!6891))

(declare-fun m!6893 () Bool)

(assert (=> b!10691 m!6893))

(declare-fun m!6895 () Bool)

(assert (=> b!10691 m!6895))

(declare-fun m!6897 () Bool)

(assert (=> b!10691 m!6897))

(declare-fun m!6899 () Bool)

(assert (=> b!10687 m!6899))

(declare-fun m!6901 () Bool)

(assert (=> start!1312 m!6901))

(declare-fun m!6903 () Bool)

(assert (=> start!1312 m!6903))

(push 1)

(assert (not start!1312))

(assert (not b!10691))

(assert b_and!595)

(assert (not b!10690))

(assert tp_is_empty!527)

(assert (not b!10687))

(assert (not b!10689))

(assert (not b!10688))

(assert (not b_next!413))

(check-sat)

(pop 1)

(push 1)

(assert b_and!595)

(assert (not b_next!413))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1167 () Bool)

(assert (=> d!1167 (= (isEmpty!53 kvs!4) (is-Nil!321 kvs!4))))

(assert (=> b!10689 d!1167))

(declare-fun d!1171 () Bool)

(declare-fun res!9040 () Bool)

(declare-fun e!6236 () Bool)

(assert (=> d!1171 (=> res!9040 e!6236)))

(assert (=> d!1171 (= res!9040 (is-Nil!321 (toList!178 lm!227)))))

(assert (=> d!1171 (= (forall!43 (toList!178 lm!227) p!216) e!6236)))

(declare-fun b!10700 () Bool)

(declare-fun e!6237 () Bool)

(assert (=> b!10700 (= e!6236 e!6237)))

(declare-fun res!9041 () Bool)

(assert (=> b!10700 (=> (not res!9041) (not e!6237))))

(declare-fun dynLambda!56 (Int tuple2!344) Bool)

(assert (=> b!10700 (= res!9041 (dynLambda!56 p!216 (h!886 (toList!178 lm!227))))))

(declare-fun b!10701 () Bool)

(assert (=> b!10701 (= e!6237 (forall!43 (t!2495 (toList!178 lm!227)) p!216))))

(assert (= (and d!1171 (not res!9040)) b!10700))

(assert (= (and b!10700 res!9041) b!10701))

(declare-fun b_lambda!407 () Bool)

(assert (=> (not b_lambda!407) (not b!10700)))

(declare-fun t!2497 () Bool)

(declare-fun tb!171 () Bool)

(assert (=> (and start!1312 (= p!216 p!216) t!2497) tb!171))

(declare-fun result!309 () Bool)

(assert (=> tb!171 (= result!309 true)))

(assert (=> b!10700 t!2497))

(declare-fun b_and!597 () Bool)

(assert (= b_and!595 (and (=> t!2497 result!309) b_and!597)))

(declare-fun m!6905 () Bool)

(assert (=> b!10700 m!6905))

(declare-fun m!6907 () Bool)

(assert (=> b!10701 m!6907))

(assert (=> start!1312 d!1171))

(declare-fun d!1175 () Bool)

(declare-fun isStrictlySorted!29 (List!324) Bool)

(assert (=> d!1175 (= (inv!512 lm!227) (isStrictlySorted!29 (toList!178 lm!227)))))

(declare-fun bs!399 () Bool)

(assert (= bs!399 d!1175))

(declare-fun m!6917 () Bool)

(assert (=> bs!399 m!6917))

(assert (=> start!1312 d!1175))

(declare-fun d!1183 () Bool)

(declare-fun res!9046 () Bool)

(declare-fun e!6242 () Bool)

(assert (=> d!1183 (=> res!9046 e!6242)))

(assert (=> d!1183 (= res!9046 (is-Nil!321 kvs!4))))

(assert (=> d!1183 (= (forall!43 kvs!4 p!216) e!6242)))

(declare-fun b!10706 () Bool)

(declare-fun e!6243 () Bool)

(assert (=> b!10706 (= e!6242 e!6243)))

(declare-fun res!9047 () Bool)

(assert (=> b!10706 (=> (not res!9047) (not e!6243))))

(assert (=> b!10706 (= res!9047 (dynLambda!56 p!216 (h!886 kvs!4)))))

(declare-fun b!10707 () Bool)

(assert (=> b!10707 (= e!6243 (forall!43 (t!2495 kvs!4) p!216))))

(assert (= (and d!1183 (not res!9046)) b!10706))

(assert (= (and b!10706 res!9047) b!10707))

(declare-fun b_lambda!413 () Bool)

(assert (=> (not b_lambda!413) (not b!10706)))

(declare-fun t!2503 () Bool)

(declare-fun tb!177 () Bool)

(assert (=> (and start!1312 (= p!216 p!216) t!2503) tb!177))

(declare-fun result!315 () Bool)

(assert (=> tb!177 (= result!315 true)))

(assert (=> b!10706 t!2503))

(declare-fun b_and!603 () Bool)

(assert (= b_and!597 (and (=> t!2503 result!315) b_and!603)))

(declare-fun m!6919 () Bool)

(assert (=> b!10706 m!6919))

(declare-fun m!6921 () Bool)

(assert (=> b!10707 m!6921))

(assert (=> b!10687 d!1183))

(declare-fun d!1185 () Bool)

(declare-fun res!9052 () Bool)

(declare-fun e!6248 () Bool)

(assert (=> d!1185 (=> res!9052 e!6248)))

(assert (=> d!1185 (= res!9052 (is-Nil!321 (toList!178 (+!16 lm!227 (tuple2!345 (_1!172 lt!2603) (_2!172 lt!2603))))))))

(assert (=> d!1185 (= (forall!43 (toList!178 (+!16 lm!227 (tuple2!345 (_1!172 lt!2603) (_2!172 lt!2603)))) p!216) e!6248)))

(declare-fun b!10712 () Bool)

(declare-fun e!6249 () Bool)

(assert (=> b!10712 (= e!6248 e!6249)))

(declare-fun res!9053 () Bool)

(assert (=> b!10712 (=> (not res!9053) (not e!6249))))

(assert (=> b!10712 (= res!9053 (dynLambda!56 p!216 (h!886 (toList!178 (+!16 lm!227 (tuple2!345 (_1!172 lt!2603) (_2!172 lt!2603)))))))))

(declare-fun b!10713 () Bool)

(assert (=> b!10713 (= e!6249 (forall!43 (t!2495 (toList!178 (+!16 lm!227 (tuple2!345 (_1!172 lt!2603) (_2!172 lt!2603))))) p!216))))

(assert (= (and d!1185 (not res!9052)) b!10712))

(assert (= (and b!10712 res!9053) b!10713))

(declare-fun b_lambda!415 () Bool)

(assert (=> (not b_lambda!415) (not b!10712)))

(declare-fun t!2505 () Bool)

(declare-fun tb!179 () Bool)

(assert (=> (and start!1312 (= p!216 p!216) t!2505) tb!179))

(declare-fun result!317 () Bool)

(assert (=> tb!179 (= result!317 true)))

(assert (=> b!10712 t!2505))

(declare-fun b_and!605 () Bool)

(assert (= b_and!603 (and (=> t!2505 result!317) b_and!605)))

(declare-fun m!6923 () Bool)

(assert (=> b!10712 m!6923))

(declare-fun m!6925 () Bool)

(assert (=> b!10713 m!6925))

(assert (=> b!10691 d!1185))

(declare-fun d!1187 () Bool)

(declare-fun e!6259 () Bool)

(assert (=> d!1187 e!6259))

(declare-fun res!9068 () Bool)

(assert (=> d!1187 (=> (not res!9068) (not e!6259))))

(declare-fun lt!2625 () ListLongMap!325)

(declare-fun contains!144 (ListLongMap!325 (_ BitVec 64)) Bool)

(assert (=> d!1187 (= res!9068 (contains!144 lt!2625 (_1!172 (tuple2!345 (_1!172 lt!2603) (_2!172 lt!2603)))))))

(declare-fun lt!2626 () List!324)

(assert (=> d!1187 (= lt!2625 (ListLongMap!326 lt!2626))))

(declare-fun lt!2627 () Unit!217)

(declare-fun lt!2628 () Unit!217)

(assert (=> d!1187 (= lt!2627 lt!2628)))

(declare-datatypes ((Option!25 0))(
  ( (Some!24 (v!1339 B!354)) (None!23) )
))
(declare-fun getValueByKey!19 (List!324 (_ BitVec 64)) Option!25)

(assert (=> d!1187 (= (getValueByKey!19 lt!2626 (_1!172 (tuple2!345 (_1!172 lt!2603) (_2!172 lt!2603)))) (Some!24 (_2!172 (tuple2!345 (_1!172 lt!2603) (_2!172 lt!2603)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!3 (List!324 (_ BitVec 64) B!354) Unit!217)

(assert (=> d!1187 (= lt!2628 (lemmaContainsTupThenGetReturnValue!3 lt!2626 (_1!172 (tuple2!345 (_1!172 lt!2603) (_2!172 lt!2603))) (_2!172 (tuple2!345 (_1!172 lt!2603) (_2!172 lt!2603)))))))

(declare-fun insertStrictlySorted!3 (List!324 (_ BitVec 64) B!354) List!324)

(assert (=> d!1187 (= lt!2626 (insertStrictlySorted!3 (toList!178 lm!227) (_1!172 (tuple2!345 (_1!172 lt!2603) (_2!172 lt!2603))) (_2!172 (tuple2!345 (_1!172 lt!2603) (_2!172 lt!2603)))))))

(assert (=> d!1187 (= (+!16 lm!227 (tuple2!345 (_1!172 lt!2603) (_2!172 lt!2603))) lt!2625)))

(declare-fun b!10728 () Bool)

(declare-fun res!9069 () Bool)

(assert (=> b!10728 (=> (not res!9069) (not e!6259))))

(assert (=> b!10728 (= res!9069 (= (getValueByKey!19 (toList!178 lt!2625) (_1!172 (tuple2!345 (_1!172 lt!2603) (_2!172 lt!2603)))) (Some!24 (_2!172 (tuple2!345 (_1!172 lt!2603) (_2!172 lt!2603))))))))

(declare-fun b!10729 () Bool)

(declare-fun contains!146 (List!324 tuple2!344) Bool)

(assert (=> b!10729 (= e!6259 (contains!146 (toList!178 lt!2625) (tuple2!345 (_1!172 lt!2603) (_2!172 lt!2603))))))

(assert (= (and d!1187 res!9068) b!10728))

(assert (= (and b!10728 res!9069) b!10729))

(declare-fun m!6949 () Bool)

(assert (=> d!1187 m!6949))

(declare-fun m!6951 () Bool)

(assert (=> d!1187 m!6951))

(declare-fun m!6953 () Bool)

(assert (=> d!1187 m!6953))

(declare-fun m!6955 () Bool)

(assert (=> d!1187 m!6955))

(declare-fun m!6957 () Bool)

(assert (=> b!10728 m!6957))

(declare-fun m!6959 () Bool)

(assert (=> b!10729 m!6959))

(assert (=> b!10691 d!1187))

(declare-fun d!1197 () Bool)

(assert (=> d!1197 (forall!43 (toList!178 (+!16 lm!227 (tuple2!345 (_1!172 lt!2603) (_2!172 lt!2603)))) p!216)))

(declare-fun lt!2646 () Unit!217)

(declare-fun choose!149 (ListLongMap!325 Int (_ BitVec 64) B!354) Unit!217)

(assert (=> d!1197 (= lt!2646 (choose!149 lm!227 p!216 (_1!172 lt!2603) (_2!172 lt!2603)))))

(declare-fun e!6268 () Bool)

(assert (=> d!1197 e!6268))

(declare-fun res!9081 () Bool)

(assert (=> d!1197 (=> (not res!9081) (not e!6268))))

(assert (=> d!1197 (= res!9081 (forall!43 (toList!178 lm!227) p!216))))

(assert (=> d!1197 (= (addValidProp!4 lm!227 p!216 (_1!172 lt!2603) (_2!172 lt!2603)) lt!2646)))

(declare-fun b!10743 () Bool)

(assert (=> b!10743 (= e!6268 (dynLambda!56 p!216 (tuple2!345 (_1!172 lt!2603) (_2!172 lt!2603))))))

(assert (= (and d!1197 res!9081) b!10743))

(declare-fun b_lambda!423 () Bool)

(assert (=> (not b_lambda!423) (not b!10743)))

(declare-fun t!2513 () Bool)

(declare-fun tb!187 () Bool)

(assert (=> (and start!1312 (= p!216 p!216) t!2513) tb!187))

(declare-fun result!325 () Bool)

(assert (=> tb!187 (= result!325 true)))

(assert (=> b!10743 t!2513))

(declare-fun b_and!613 () Bool)

(assert (= b_and!605 (and (=> t!2513 result!325) b_and!613)))

(assert (=> d!1197 m!6891))

(assert (=> d!1197 m!6893))

(declare-fun m!6981 () Bool)

(assert (=> d!1197 m!6981))

(assert (=> d!1197 m!6901))

(declare-fun m!6983 () Bool)

(assert (=> b!10743 m!6983))

(assert (=> b!10691 d!1197))

(declare-fun d!1209 () Bool)

(assert (=> d!1209 (= (head!760 kvs!4) (h!886 kvs!4))))

(assert (=> b!10691 d!1209))

(declare-fun b!10753 () Bool)

(declare-fun e!6275 () Bool)

(declare-fun tp!1658 () Bool)

(assert (=> b!10753 (= e!6275 (and tp_is_empty!527 tp!1658))))

(assert (=> b!10688 (= tp!1653 e!6275)))

(assert (= (and b!10688 (is-Cons!320 (t!2495 kvs!4))) b!10753))

(declare-fun b!10756 () Bool)

