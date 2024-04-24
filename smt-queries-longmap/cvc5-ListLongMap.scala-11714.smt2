; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137502 () Bool)

(assert start!137502)

(declare-fun b!1582424 () Bool)

(declare-fun e!882918 () Bool)

(declare-fun tp_is_empty!39161 () Bool)

(declare-fun tp!114393 () Bool)

(assert (=> b!1582424 (= e!882918 (and tp_is_empty!39161 tp!114393))))

(declare-fun b!1582425 () Bool)

(declare-fun res!1080188 () Bool)

(declare-fun e!882919 () Bool)

(assert (=> b!1582425 (=> (not res!1080188) (not e!882919))))

(declare-datatypes ((B!2616 0))(
  ( (B!2617 (val!19670 Int)) )
))
(declare-datatypes ((tuple2!25506 0))(
  ( (tuple2!25507 (_1!12764 (_ BitVec 64)) (_2!12764 B!2616)) )
))
(declare-datatypes ((List!36822 0))(
  ( (Nil!36819) (Cons!36818 (h!38379 tuple2!25506) (t!51728 List!36822)) )
))
(declare-fun l!1390 () List!36822)

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!895 (List!36822 (_ BitVec 64)) Bool)

(assert (=> b!1582425 (= res!1080188 (containsKey!895 l!1390 key!405))))

(declare-fun b!1582426 () Bool)

(declare-fun e!882920 () Bool)

(assert (=> b!1582426 (= e!882919 e!882920)))

(declare-fun res!1080190 () Bool)

(assert (=> b!1582426 (=> (not res!1080190) (not e!882920))))

(declare-datatypes ((tuple2!25508 0))(
  ( (tuple2!25509 (_1!12765 tuple2!25506) (_2!12765 List!36822)) )
))
(declare-datatypes ((Option!884 0))(
  ( (Some!883 (v!22375 tuple2!25508)) (None!882) )
))
(declare-fun lt!677556 () Option!884)

(declare-fun isEmpty!1159 (Option!884) Bool)

(assert (=> b!1582426 (= res!1080190 (not (isEmpty!1159 lt!677556)))))

(declare-fun unapply!72 (List!36822) Option!884)

(assert (=> b!1582426 (= lt!677556 (unapply!72 l!1390))))

(declare-fun res!1080191 () Bool)

(assert (=> start!137502 (=> (not res!1080191) (not e!882919))))

(declare-fun isStrictlySorted!1036 (List!36822) Bool)

(assert (=> start!137502 (= res!1080191 (isStrictlySorted!1036 l!1390))))

(assert (=> start!137502 e!882919))

(assert (=> start!137502 e!882918))

(assert (=> start!137502 true))

(assert (=> start!137502 tp_is_empty!39161))

(declare-fun b!1582427 () Bool)

(declare-fun res!1080189 () Bool)

(assert (=> b!1582427 (=> (not res!1080189) (not e!882919))))

(declare-fun value!194 () B!2616)

(declare-fun contains!10507 (List!36822 tuple2!25506) Bool)

(assert (=> b!1582427 (= res!1080189 (contains!10507 l!1390 (tuple2!25507 key!405 value!194)))))

(declare-fun b!1582428 () Bool)

(declare-fun isDefined!595 (Option!884) Bool)

(assert (=> b!1582428 (= e!882920 (not (isDefined!595 lt!677556)))))

(assert (= (and start!137502 res!1080191) b!1582425))

(assert (= (and b!1582425 res!1080188) b!1582427))

(assert (= (and b!1582427 res!1080189) b!1582426))

(assert (= (and b!1582426 res!1080190) b!1582428))

(assert (= (and start!137502 (is-Cons!36818 l!1390)) b!1582424))

(declare-fun m!1453851 () Bool)

(assert (=> b!1582428 m!1453851))

(declare-fun m!1453853 () Bool)

(assert (=> b!1582426 m!1453853))

(declare-fun m!1453855 () Bool)

(assert (=> b!1582426 m!1453855))

(declare-fun m!1453857 () Bool)

(assert (=> b!1582425 m!1453857))

(declare-fun m!1453859 () Bool)

(assert (=> start!137502 m!1453859))

(declare-fun m!1453861 () Bool)

(assert (=> b!1582427 m!1453861))

(push 1)

(assert (not start!137502))

(assert tp_is_empty!39161)

(assert (not b!1582425))

(assert (not b!1582424))

(assert (not b!1582428))

(assert (not b!1582427))

(assert (not b!1582426))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167077 () Bool)

(declare-fun res!1080196 () Bool)

(declare-fun e!882925 () Bool)

(assert (=> d!167077 (=> res!1080196 e!882925)))

(assert (=> d!167077 (= res!1080196 (or (is-Nil!36819 l!1390) (is-Nil!36819 (t!51728 l!1390))))))

(assert (=> d!167077 (= (isStrictlySorted!1036 l!1390) e!882925)))

(declare-fun b!1582433 () Bool)

(declare-fun e!882926 () Bool)

(assert (=> b!1582433 (= e!882925 e!882926)))

(declare-fun res!1080197 () Bool)

(assert (=> b!1582433 (=> (not res!1080197) (not e!882926))))

(assert (=> b!1582433 (= res!1080197 (bvslt (_1!12764 (h!38379 l!1390)) (_1!12764 (h!38379 (t!51728 l!1390)))))))

(declare-fun b!1582434 () Bool)

(assert (=> b!1582434 (= e!882926 (isStrictlySorted!1036 (t!51728 l!1390)))))

(assert (= (and d!167077 (not res!1080196)) b!1582433))

(assert (= (and b!1582433 res!1080197) b!1582434))

(declare-fun m!1453863 () Bool)

(assert (=> b!1582434 m!1453863))

(assert (=> start!137502 d!167077))

(declare-fun d!167087 () Bool)

(declare-fun lt!677559 () Bool)

(declare-fun content!816 (List!36822) (Set tuple2!25506))

(assert (=> d!167087 (= lt!677559 (set.member (tuple2!25507 key!405 value!194) (content!816 l!1390)))))

(declare-fun e!882934 () Bool)

(assert (=> d!167087 (= lt!677559 e!882934)))

(declare-fun res!1080204 () Bool)

(assert (=> d!167087 (=> (not res!1080204) (not e!882934))))

(assert (=> d!167087 (= res!1080204 (is-Cons!36818 l!1390))))

(assert (=> d!167087 (= (contains!10507 l!1390 (tuple2!25507 key!405 value!194)) lt!677559)))

(declare-fun b!1582441 () Bool)

(declare-fun e!882933 () Bool)

(assert (=> b!1582441 (= e!882934 e!882933)))

(declare-fun res!1080205 () Bool)

(assert (=> b!1582441 (=> res!1080205 e!882933)))

(assert (=> b!1582441 (= res!1080205 (= (h!38379 l!1390) (tuple2!25507 key!405 value!194)))))

(declare-fun b!1582442 () Bool)

(assert (=> b!1582442 (= e!882933 (contains!10507 (t!51728 l!1390) (tuple2!25507 key!405 value!194)))))

(assert (= (and d!167087 res!1080204) b!1582441))

(assert (= (and b!1582441 (not res!1080205)) b!1582442))

(declare-fun m!1453865 () Bool)

(assert (=> d!167087 m!1453865))

(declare-fun m!1453867 () Bool)

(assert (=> d!167087 m!1453867))

(declare-fun m!1453869 () Bool)

(assert (=> b!1582442 m!1453869))

(assert (=> b!1582427 d!167087))

(declare-fun d!167097 () Bool)

(assert (=> d!167097 (= (isDefined!595 lt!677556) (not (isEmpty!1159 lt!677556)))))

(declare-fun bs!45791 () Bool)

(assert (= bs!45791 d!167097))

(assert (=> bs!45791 m!1453853))

(assert (=> b!1582428 d!167097))

(declare-fun d!167099 () Bool)

(declare-fun res!1080220 () Bool)

(declare-fun e!882949 () Bool)

(assert (=> d!167099 (=> res!1080220 e!882949)))

(assert (=> d!167099 (= res!1080220 (and (is-Cons!36818 l!1390) (= (_1!12764 (h!38379 l!1390)) key!405)))))

(assert (=> d!167099 (= (containsKey!895 l!1390 key!405) e!882949)))

(declare-fun b!1582457 () Bool)

(declare-fun e!882950 () Bool)

(assert (=> b!1582457 (= e!882949 e!882950)))

(declare-fun res!1080221 () Bool)

(assert (=> b!1582457 (=> (not res!1080221) (not e!882950))))

(assert (=> b!1582457 (= res!1080221 (and (or (not (is-Cons!36818 l!1390)) (bvsle (_1!12764 (h!38379 l!1390)) key!405)) (is-Cons!36818 l!1390) (bvslt (_1!12764 (h!38379 l!1390)) key!405)))))

(declare-fun b!1582458 () Bool)

(assert (=> b!1582458 (= e!882950 (containsKey!895 (t!51728 l!1390) key!405))))

(assert (= (and d!167099 (not res!1080220)) b!1582457))

(assert (= (and b!1582457 res!1080221) b!1582458))

(declare-fun m!1453875 () Bool)

(assert (=> b!1582458 m!1453875))

(assert (=> b!1582425 d!167099))

(declare-fun d!167105 () Bool)

(assert (=> d!167105 (= (isEmpty!1159 lt!677556) (not (is-Some!883 lt!677556)))))

(assert (=> b!1582426 d!167105))

(declare-fun d!167107 () Bool)

(assert (=> d!167107 (= (unapply!72 l!1390) (ite (is-Nil!36819 l!1390) None!882 (Some!883 (tuple2!25509 (h!38379 l!1390) (t!51728 l!1390)))))))

(assert (=> b!1582426 d!167107))

(declare-fun b!1582473 () Bool)

(declare-fun e!882963 () Bool)

(declare-fun tp!114396 () Bool)

(assert (=> b!1582473 (= e!882963 (and tp_is_empty!39161 tp!114396))))

(assert (=> b!1582424 (= tp!114393 e!882963)))

(assert (= (and b!1582424 (is-Cons!36818 (t!51728 l!1390))) b!1582473))

(push 1)

(assert (not b!1582442))

(assert tp_is_empty!39161)

(assert (not b!1582434))

(assert (not d!167097))

(assert (not b!1582473))

(assert (not b!1582458))

(assert (not d!167087))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

