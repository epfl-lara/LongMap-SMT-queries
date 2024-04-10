; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7170 () Bool)

(assert start!7170)

(declare-fun res!26903 () Bool)

(declare-fun e!29267 () Bool)

(assert (=> start!7170 (=> (not res!26903) (not e!29267))))

(declare-datatypes ((B!856 0))(
  ( (B!857 (val!1015 Int)) )
))
(declare-datatypes ((tuple2!1678 0))(
  ( (tuple2!1679 (_1!850 (_ BitVec 64)) (_2!850 B!856)) )
))
(declare-datatypes ((List!1233 0))(
  ( (Nil!1230) (Cons!1229 (h!1809 tuple2!1678) (t!4258 List!1233)) )
))
(declare-fun l!812 () List!1233)

(declare-fun isStrictlySorted!227 (List!1233) Bool)

(assert (=> start!7170 (= res!26903 (isStrictlySorted!227 l!812))))

(assert (=> start!7170 e!29267))

(declare-fun e!29266 () Bool)

(assert (=> start!7170 e!29266))

(assert (=> start!7170 true))

(declare-fun b!45970 () Bool)

(declare-fun res!26904 () Bool)

(assert (=> b!45970 (=> (not res!26904) (not e!29267))))

(get-info :version)

(assert (=> b!45970 (= res!26904 (not ((_ is Cons!1229) l!812)))))

(declare-fun b!45971 () Bool)

(declare-fun key1!43 () (_ BitVec 64))

(declare-fun removeStrictlySorted!37 (List!1233 (_ BitVec 64)) List!1233)

(assert (=> b!45971 (= e!29267 (not (isStrictlySorted!227 (removeStrictlySorted!37 l!812 key1!43))))))

(declare-fun b!45972 () Bool)

(declare-fun tp_is_empty!1953 () Bool)

(declare-fun tp!6041 () Bool)

(assert (=> b!45972 (= e!29266 (and tp_is_empty!1953 tp!6041))))

(assert (= (and start!7170 res!26903) b!45970))

(assert (= (and b!45970 res!26904) b!45971))

(assert (= (and start!7170 ((_ is Cons!1229) l!812)) b!45972))

(declare-fun m!40533 () Bool)

(assert (=> start!7170 m!40533))

(declare-fun m!40535 () Bool)

(assert (=> b!45971 m!40535))

(assert (=> b!45971 m!40535))

(declare-fun m!40537 () Bool)

(assert (=> b!45971 m!40537))

(check-sat (not b!45971) (not start!7170) (not b!45972) tp_is_empty!1953)
(check-sat)
(get-model)

(declare-fun d!8994 () Bool)

(declare-fun res!26923 () Bool)

(declare-fun e!29286 () Bool)

(assert (=> d!8994 (=> res!26923 e!29286)))

(assert (=> d!8994 (= res!26923 (or ((_ is Nil!1230) (removeStrictlySorted!37 l!812 key1!43)) ((_ is Nil!1230) (t!4258 (removeStrictlySorted!37 l!812 key1!43)))))))

(assert (=> d!8994 (= (isStrictlySorted!227 (removeStrictlySorted!37 l!812 key1!43)) e!29286)))

(declare-fun b!45994 () Bool)

(declare-fun e!29288 () Bool)

(assert (=> b!45994 (= e!29286 e!29288)))

(declare-fun res!26925 () Bool)

(assert (=> b!45994 (=> (not res!26925) (not e!29288))))

(assert (=> b!45994 (= res!26925 (bvslt (_1!850 (h!1809 (removeStrictlySorted!37 l!812 key1!43))) (_1!850 (h!1809 (t!4258 (removeStrictlySorted!37 l!812 key1!43))))))))

(declare-fun b!45996 () Bool)

(assert (=> b!45996 (= e!29288 (isStrictlySorted!227 (t!4258 (removeStrictlySorted!37 l!812 key1!43))))))

(assert (= (and d!8994 (not res!26923)) b!45994))

(assert (= (and b!45994 res!26925) b!45996))

(declare-fun m!40547 () Bool)

(assert (=> b!45996 m!40547))

(assert (=> b!45971 d!8994))

(declare-fun b!46030 () Bool)

(declare-fun e!29310 () List!1233)

(assert (=> b!46030 (= e!29310 Nil!1230)))

(declare-fun b!46031 () Bool)

(declare-fun $colon$colon!38 (List!1233 tuple2!1678) List!1233)

(assert (=> b!46031 (= e!29310 ($colon$colon!38 (removeStrictlySorted!37 (t!4258 l!812) key1!43) (h!1809 l!812)))))

(declare-fun d!9001 () Bool)

(declare-fun e!29311 () Bool)

(assert (=> d!9001 e!29311))

(declare-fun res!26935 () Bool)

(assert (=> d!9001 (=> (not res!26935) (not e!29311))))

(declare-fun lt!20264 () List!1233)

(assert (=> d!9001 (= res!26935 (isStrictlySorted!227 lt!20264))))

(declare-fun e!29312 () List!1233)

(assert (=> d!9001 (= lt!20264 e!29312)))

(declare-fun c!6220 () Bool)

(assert (=> d!9001 (= c!6220 (and ((_ is Cons!1229) l!812) (= (_1!850 (h!1809 l!812)) key1!43)))))

(assert (=> d!9001 (isStrictlySorted!227 l!812)))

(assert (=> d!9001 (= (removeStrictlySorted!37 l!812 key1!43) lt!20264)))

(declare-fun b!46032 () Bool)

(assert (=> b!46032 (= e!29312 (t!4258 l!812))))

(declare-fun b!46033 () Bool)

(assert (=> b!46033 (= e!29312 e!29310)))

(declare-fun c!6221 () Bool)

(assert (=> b!46033 (= c!6221 (and ((_ is Cons!1229) l!812) (not (= (_1!850 (h!1809 l!812)) key1!43))))))

(declare-fun b!46034 () Bool)

(declare-fun containsKey!84 (List!1233 (_ BitVec 64)) Bool)

(assert (=> b!46034 (= e!29311 (not (containsKey!84 lt!20264 key1!43)))))

(assert (= (and d!9001 c!6220) b!46032))

(assert (= (and d!9001 (not c!6220)) b!46033))

(assert (= (and b!46033 c!6221) b!46031))

(assert (= (and b!46033 (not c!6221)) b!46030))

(assert (= (and d!9001 res!26935) b!46034))

(declare-fun m!40551 () Bool)

(assert (=> b!46031 m!40551))

(assert (=> b!46031 m!40551))

(declare-fun m!40555 () Bool)

(assert (=> b!46031 m!40555))

(declare-fun m!40557 () Bool)

(assert (=> d!9001 m!40557))

(assert (=> d!9001 m!40533))

(declare-fun m!40561 () Bool)

(assert (=> b!46034 m!40561))

(assert (=> b!45971 d!9001))

(declare-fun d!9005 () Bool)

(declare-fun res!26937 () Bool)

(declare-fun e!29316 () Bool)

(assert (=> d!9005 (=> res!26937 e!29316)))

(assert (=> d!9005 (= res!26937 (or ((_ is Nil!1230) l!812) ((_ is Nil!1230) (t!4258 l!812))))))

(assert (=> d!9005 (= (isStrictlySorted!227 l!812) e!29316)))

(declare-fun b!46040 () Bool)

(declare-fun e!29317 () Bool)

(assert (=> b!46040 (= e!29316 e!29317)))

(declare-fun res!26938 () Bool)

(assert (=> b!46040 (=> (not res!26938) (not e!29317))))

(assert (=> b!46040 (= res!26938 (bvslt (_1!850 (h!1809 l!812)) (_1!850 (h!1809 (t!4258 l!812)))))))

(declare-fun b!46041 () Bool)

(assert (=> b!46041 (= e!29317 (isStrictlySorted!227 (t!4258 l!812)))))

(assert (= (and d!9005 (not res!26937)) b!46040))

(assert (= (and b!46040 res!26938) b!46041))

(declare-fun m!40567 () Bool)

(assert (=> b!46041 m!40567))

(assert (=> start!7170 d!9005))

(declare-fun b!46057 () Bool)

(declare-fun e!29327 () Bool)

(declare-fun tp!6049 () Bool)

(assert (=> b!46057 (= e!29327 (and tp_is_empty!1953 tp!6049))))

(assert (=> b!45972 (= tp!6041 e!29327)))

(assert (= (and b!45972 ((_ is Cons!1229) (t!4258 l!812))) b!46057))

(check-sat (not b!46057) (not b!46031) (not b!45996) tp_is_empty!1953 (not b!46041) (not b!46034) (not d!9001))
(check-sat)
