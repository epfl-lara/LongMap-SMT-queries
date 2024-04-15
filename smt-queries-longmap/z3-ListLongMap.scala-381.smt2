; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7194 () Bool)

(assert start!7194)

(declare-fun res!26929 () Bool)

(declare-fun e!29304 () Bool)

(assert (=> start!7194 (=> (not res!26929) (not e!29304))))

(declare-datatypes ((B!866 0))(
  ( (B!867 (val!1020 Int)) )
))
(declare-datatypes ((tuple2!1692 0))(
  ( (tuple2!1693 (_1!857 (_ BitVec 64)) (_2!857 B!866)) )
))
(declare-datatypes ((List!1231 0))(
  ( (Nil!1228) (Cons!1227 (h!1807 tuple2!1692) (t!4255 List!1231)) )
))
(declare-fun l!812 () List!1231)

(declare-fun isStrictlySorted!224 (List!1231) Bool)

(assert (=> start!7194 (= res!26929 (isStrictlySorted!224 l!812))))

(assert (=> start!7194 e!29304))

(declare-fun e!29305 () Bool)

(assert (=> start!7194 e!29305))

(assert (=> start!7194 true))

(declare-fun b!46015 () Bool)

(declare-fun res!26928 () Bool)

(assert (=> b!46015 (=> (not res!26928) (not e!29304))))

(get-info :version)

(assert (=> b!46015 (= res!26928 (not ((_ is Cons!1227) l!812)))))

(declare-fun b!46016 () Bool)

(declare-fun key2!27 () (_ BitVec 64))

(declare-fun removeStrictlySorted!39 (List!1231 (_ BitVec 64)) List!1231)

(assert (=> b!46016 (= e!29304 (not (isStrictlySorted!224 (removeStrictlySorted!39 l!812 key2!27))))))

(declare-fun b!46017 () Bool)

(declare-fun tp_is_empty!1963 () Bool)

(declare-fun tp!6065 () Bool)

(assert (=> b!46017 (= e!29305 (and tp_is_empty!1963 tp!6065))))

(assert (= (and start!7194 res!26929) b!46015))

(assert (= (and b!46015 res!26928) b!46016))

(assert (= (and start!7194 ((_ is Cons!1227) l!812)) b!46017))

(declare-fun m!40499 () Bool)

(assert (=> start!7194 m!40499))

(declare-fun m!40501 () Bool)

(assert (=> b!46016 m!40501))

(assert (=> b!46016 m!40501))

(declare-fun m!40503 () Bool)

(assert (=> b!46016 m!40503))

(check-sat (not start!7194) (not b!46016) (not b!46017) tp_is_empty!1963)
(check-sat)
(get-model)

(declare-fun d!8991 () Bool)

(declare-fun res!26950 () Bool)

(declare-fun e!29326 () Bool)

(assert (=> d!8991 (=> res!26950 e!29326)))

(assert (=> d!8991 (= res!26950 (or ((_ is Nil!1228) l!812) ((_ is Nil!1228) (t!4255 l!812))))))

(assert (=> d!8991 (= (isStrictlySorted!224 l!812) e!29326)))

(declare-fun b!46044 () Bool)

(declare-fun e!29328 () Bool)

(assert (=> b!46044 (= e!29326 e!29328)))

(declare-fun res!26952 () Bool)

(assert (=> b!46044 (=> (not res!26952) (not e!29328))))

(assert (=> b!46044 (= res!26952 (bvslt (_1!857 (h!1807 l!812)) (_1!857 (h!1807 (t!4255 l!812)))))))

(declare-fun b!46046 () Bool)

(assert (=> b!46046 (= e!29328 (isStrictlySorted!224 (t!4255 l!812)))))

(assert (= (and d!8991 (not res!26950)) b!46044))

(assert (= (and b!46044 res!26952) b!46046))

(declare-fun m!40519 () Bool)

(assert (=> b!46046 m!40519))

(assert (=> start!7194 d!8991))

(declare-fun d!8997 () Bool)

(declare-fun res!26954 () Bool)

(declare-fun e!29330 () Bool)

(assert (=> d!8997 (=> res!26954 e!29330)))

(assert (=> d!8997 (= res!26954 (or ((_ is Nil!1228) (removeStrictlySorted!39 l!812 key2!27)) ((_ is Nil!1228) (t!4255 (removeStrictlySorted!39 l!812 key2!27)))))))

(assert (=> d!8997 (= (isStrictlySorted!224 (removeStrictlySorted!39 l!812 key2!27)) e!29330)))

(declare-fun b!46048 () Bool)

(declare-fun e!29332 () Bool)

(assert (=> b!46048 (= e!29330 e!29332)))

(declare-fun res!26956 () Bool)

(assert (=> b!46048 (=> (not res!26956) (not e!29332))))

(assert (=> b!46048 (= res!26956 (bvslt (_1!857 (h!1807 (removeStrictlySorted!39 l!812 key2!27))) (_1!857 (h!1807 (t!4255 (removeStrictlySorted!39 l!812 key2!27))))))))

(declare-fun b!46050 () Bool)

(assert (=> b!46050 (= e!29332 (isStrictlySorted!224 (t!4255 (removeStrictlySorted!39 l!812 key2!27))))))

(assert (= (and d!8997 (not res!26954)) b!46048))

(assert (= (and b!46048 res!26956) b!46050))

(declare-fun m!40523 () Bool)

(assert (=> b!46050 m!40523))

(assert (=> b!46016 d!8997))

(declare-fun b!46080 () Bool)

(declare-fun e!29356 () Bool)

(declare-fun lt!20255 () List!1231)

(declare-fun containsKey!85 (List!1231 (_ BitVec 64)) Bool)

(assert (=> b!46080 (= e!29356 (not (containsKey!85 lt!20255 key2!27)))))

(declare-fun b!46082 () Bool)

(declare-fun e!29354 () List!1231)

(assert (=> b!46082 (= e!29354 (t!4255 l!812))))

(declare-fun b!46083 () Bool)

(declare-fun e!29355 () List!1231)

(assert (=> b!46083 (= e!29354 e!29355)))

(declare-fun c!6212 () Bool)

(assert (=> b!46083 (= c!6212 (and ((_ is Cons!1227) l!812) (not (= (_1!857 (h!1807 l!812)) key2!27))))))

(declare-fun b!46084 () Bool)

(assert (=> b!46084 (= e!29355 Nil!1228)))

(declare-fun d!9001 () Bool)

(assert (=> d!9001 e!29356))

(declare-fun res!26970 () Bool)

(assert (=> d!9001 (=> (not res!26970) (not e!29356))))

(assert (=> d!9001 (= res!26970 (isStrictlySorted!224 lt!20255))))

(assert (=> d!9001 (= lt!20255 e!29354)))

(declare-fun c!6211 () Bool)

(assert (=> d!9001 (= c!6211 (and ((_ is Cons!1227) l!812) (= (_1!857 (h!1807 l!812)) key2!27)))))

(assert (=> d!9001 (isStrictlySorted!224 l!812)))

(assert (=> d!9001 (= (removeStrictlySorted!39 l!812 key2!27) lt!20255)))

(declare-fun b!46081 () Bool)

(declare-fun $colon$colon!40 (List!1231 tuple2!1692) List!1231)

(assert (=> b!46081 (= e!29355 ($colon$colon!40 (removeStrictlySorted!39 (t!4255 l!812) key2!27) (h!1807 l!812)))))

(assert (= (and d!9001 c!6211) b!46082))

(assert (= (and d!9001 (not c!6211)) b!46083))

(assert (= (and b!46083 c!6212) b!46081))

(assert (= (and b!46083 (not c!6212)) b!46084))

(assert (= (and d!9001 res!26970) b!46080))

(declare-fun m!40529 () Bool)

(assert (=> b!46080 m!40529))

(declare-fun m!40531 () Bool)

(assert (=> d!9001 m!40531))

(assert (=> d!9001 m!40499))

(declare-fun m!40535 () Bool)

(assert (=> b!46081 m!40535))

(assert (=> b!46081 m!40535))

(declare-fun m!40539 () Bool)

(assert (=> b!46081 m!40539))

(assert (=> b!46016 d!9001))

(declare-fun b!46098 () Bool)

(declare-fun e!29364 () Bool)

(declare-fun tp!6076 () Bool)

(assert (=> b!46098 (= e!29364 (and tp_is_empty!1963 tp!6076))))

(assert (=> b!46017 (= tp!6065 e!29364)))

(assert (= (and b!46017 ((_ is Cons!1227) (t!4255 l!812))) b!46098))

(check-sat tp_is_empty!1963 (not b!46080) (not b!46046) (not b!46081) (not b!46050) (not d!9001) (not b!46098))
(check-sat)
