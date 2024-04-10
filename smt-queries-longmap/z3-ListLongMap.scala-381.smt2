; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7194 () Bool)

(assert start!7194)

(declare-fun res!26954 () Bool)

(declare-fun e!29354 () Bool)

(assert (=> start!7194 (=> (not res!26954) (not e!29354))))

(declare-datatypes ((B!868 0))(
  ( (B!869 (val!1021 Int)) )
))
(declare-datatypes ((tuple2!1690 0))(
  ( (tuple2!1691 (_1!856 (_ BitVec 64)) (_2!856 B!868)) )
))
(declare-datatypes ((List!1239 0))(
  ( (Nil!1236) (Cons!1235 (h!1815 tuple2!1690) (t!4264 List!1239)) )
))
(declare-fun l!812 () List!1239)

(declare-fun isStrictlySorted!230 (List!1239) Bool)

(assert (=> start!7194 (= res!26954 (isStrictlySorted!230 l!812))))

(assert (=> start!7194 e!29354))

(declare-fun e!29353 () Bool)

(assert (=> start!7194 e!29353))

(assert (=> start!7194 true))

(declare-fun b!46090 () Bool)

(declare-fun res!26955 () Bool)

(assert (=> b!46090 (=> (not res!26955) (not e!29354))))

(get-info :version)

(assert (=> b!46090 (= res!26955 (not ((_ is Cons!1235) l!812)))))

(declare-fun b!46091 () Bool)

(declare-fun key2!27 () (_ BitVec 64))

(declare-fun removeStrictlySorted!40 (List!1239 (_ BitVec 64)) List!1239)

(assert (=> b!46091 (= e!29354 (not (isStrictlySorted!230 (removeStrictlySorted!40 l!812 key2!27))))))

(declare-fun b!46092 () Bool)

(declare-fun tp_is_empty!1965 () Bool)

(declare-fun tp!6068 () Bool)

(assert (=> b!46092 (= e!29353 (and tp_is_empty!1965 tp!6068))))

(assert (= (and start!7194 res!26954) b!46090))

(assert (= (and b!46090 res!26955) b!46091))

(assert (= (and start!7194 ((_ is Cons!1235) l!812)) b!46092))

(declare-fun m!40587 () Bool)

(assert (=> start!7194 m!40587))

(declare-fun m!40589 () Bool)

(assert (=> b!46091 m!40589))

(assert (=> b!46091 m!40589))

(declare-fun m!40591 () Bool)

(assert (=> b!46091 m!40591))

(check-sat (not start!7194) (not b!46091) (not b!46092) tp_is_empty!1965)
(check-sat)
(get-model)

(declare-fun d!9023 () Bool)

(declare-fun res!26982 () Bool)

(declare-fun e!29389 () Bool)

(assert (=> d!9023 (=> res!26982 e!29389)))

(assert (=> d!9023 (= res!26982 (or ((_ is Nil!1236) l!812) ((_ is Nil!1236) (t!4264 l!812))))))

(assert (=> d!9023 (= (isStrictlySorted!230 l!812) e!29389)))

(declare-fun b!46138 () Bool)

(declare-fun e!29390 () Bool)

(assert (=> b!46138 (= e!29389 e!29390)))

(declare-fun res!26983 () Bool)

(assert (=> b!46138 (=> (not res!26983) (not e!29390))))

(assert (=> b!46138 (= res!26983 (bvslt (_1!856 (h!1815 l!812)) (_1!856 (h!1815 (t!4264 l!812)))))))

(declare-fun b!46139 () Bool)

(assert (=> b!46139 (= e!29390 (isStrictlySorted!230 (t!4264 l!812)))))

(assert (= (and d!9023 (not res!26982)) b!46138))

(assert (= (and b!46138 res!26983) b!46139))

(declare-fun m!40607 () Bool)

(assert (=> b!46139 m!40607))

(assert (=> start!7194 d!9023))

(declare-fun d!9029 () Bool)

(declare-fun res!26984 () Bool)

(declare-fun e!29392 () Bool)

(assert (=> d!9029 (=> res!26984 e!29392)))

(assert (=> d!9029 (= res!26984 (or ((_ is Nil!1236) (removeStrictlySorted!40 l!812 key2!27)) ((_ is Nil!1236) (t!4264 (removeStrictlySorted!40 l!812 key2!27)))))))

(assert (=> d!9029 (= (isStrictlySorted!230 (removeStrictlySorted!40 l!812 key2!27)) e!29392)))

(declare-fun b!46140 () Bool)

(declare-fun e!29394 () Bool)

(assert (=> b!46140 (= e!29392 e!29394)))

(declare-fun res!26987 () Bool)

(assert (=> b!46140 (=> (not res!26987) (not e!29394))))

(assert (=> b!46140 (= res!26987 (bvslt (_1!856 (h!1815 (removeStrictlySorted!40 l!812 key2!27))) (_1!856 (h!1815 (t!4264 (removeStrictlySorted!40 l!812 key2!27))))))))

(declare-fun b!46141 () Bool)

(assert (=> b!46141 (= e!29394 (isStrictlySorted!230 (t!4264 (removeStrictlySorted!40 l!812 key2!27))))))

(assert (= (and d!9029 (not res!26984)) b!46140))

(assert (= (and b!46140 res!26987) b!46141))

(declare-fun m!40609 () Bool)

(assert (=> b!46141 m!40609))

(assert (=> b!46091 d!9029))

(declare-fun d!9031 () Bool)

(declare-fun e!29416 () Bool)

(assert (=> d!9031 e!29416))

(declare-fun res!26994 () Bool)

(assert (=> d!9031 (=> (not res!26994) (not e!29416))))

(declare-fun lt!20275 () List!1239)

(assert (=> d!9031 (= res!26994 (isStrictlySorted!230 lt!20275))))

(declare-fun e!29415 () List!1239)

(assert (=> d!9031 (= lt!20275 e!29415)))

(declare-fun c!6242 () Bool)

(assert (=> d!9031 (= c!6242 (and ((_ is Cons!1235) l!812) (= (_1!856 (h!1815 l!812)) key2!27)))))

(assert (=> d!9031 (isStrictlySorted!230 l!812)))

(assert (=> d!9031 (= (removeStrictlySorted!40 l!812 key2!27) lt!20275)))

(declare-fun b!46176 () Bool)

(declare-fun containsKey!89 (List!1239 (_ BitVec 64)) Bool)

(assert (=> b!46176 (= e!29416 (not (containsKey!89 lt!20275 key2!27)))))

(declare-fun b!46177 () Bool)

(declare-fun e!29417 () List!1239)

(declare-fun $colon$colon!42 (List!1239 tuple2!1690) List!1239)

(assert (=> b!46177 (= e!29417 ($colon$colon!42 (removeStrictlySorted!40 (t!4264 l!812) key2!27) (h!1815 l!812)))))

(declare-fun b!46178 () Bool)

(assert (=> b!46178 (= e!29415 (t!4264 l!812))))

(declare-fun b!46179 () Bool)

(assert (=> b!46179 (= e!29417 Nil!1236)))

(declare-fun b!46180 () Bool)

(assert (=> b!46180 (= e!29415 e!29417)))

(declare-fun c!6243 () Bool)

(assert (=> b!46180 (= c!6243 (and ((_ is Cons!1235) l!812) (not (= (_1!856 (h!1815 l!812)) key2!27))))))

(assert (= (and d!9031 c!6242) b!46178))

(assert (= (and d!9031 (not c!6242)) b!46180))

(assert (= (and b!46180 c!6243) b!46177))

(assert (= (and b!46180 (not c!6243)) b!46179))

(assert (= (and d!9031 res!26994) b!46176))

(declare-fun m!40627 () Bool)

(assert (=> d!9031 m!40627))

(assert (=> d!9031 m!40587))

(declare-fun m!40629 () Bool)

(assert (=> b!46176 m!40629))

(declare-fun m!40631 () Bool)

(assert (=> b!46177 m!40631))

(assert (=> b!46177 m!40631))

(declare-fun m!40633 () Bool)

(assert (=> b!46177 m!40633))

(assert (=> b!46091 d!9031))

(declare-fun b!46185 () Bool)

(declare-fun e!29420 () Bool)

(declare-fun tp!6080 () Bool)

(assert (=> b!46185 (= e!29420 (and tp_is_empty!1965 tp!6080))))

(assert (=> b!46092 (= tp!6068 e!29420)))

(assert (= (and b!46092 ((_ is Cons!1235) (t!4264 l!812))) b!46185))

(check-sat (not b!46141) (not b!46177) (not b!46176) (not d!9031) (not b!46139) tp_is_empty!1965 (not b!46185))
(check-sat)
