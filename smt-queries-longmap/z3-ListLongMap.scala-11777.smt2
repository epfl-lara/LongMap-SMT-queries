; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138334 () Bool)

(assert start!138334)

(declare-fun b!1585954 () Bool)

(declare-fun res!1083128 () Bool)

(declare-fun e!885556 () Bool)

(assert (=> b!1585954 (=> res!1083128 e!885556)))

(declare-datatypes ((B!3004 0))(
  ( (B!3005 (val!19864 Int)) )
))
(declare-datatypes ((tuple2!25896 0))(
  ( (tuple2!25897 (_1!12959 (_ BitVec 64)) (_2!12959 B!3004)) )
))
(declare-datatypes ((List!36984 0))(
  ( (Nil!36981) (Cons!36980 (h!38523 tuple2!25896) (t!51911 List!36984)) )
))
(declare-fun lt!677472 () List!36984)

(declare-fun newKey!21 () (_ BitVec 64))

(declare-fun containsKey!1019 (List!36984 (_ BitVec 64)) Bool)

(assert (=> b!1585954 (= res!1083128 (not (containsKey!1019 lt!677472 newKey!21)))))

(declare-fun res!1083127 () Bool)

(declare-fun e!885558 () Bool)

(assert (=> start!138334 (=> (not res!1083127) (not e!885558))))

(declare-fun l!556 () List!36984)

(declare-fun isStrictlySorted!1206 (List!36984) Bool)

(assert (=> start!138334 (= res!1083127 (isStrictlySorted!1206 l!556))))

(assert (=> start!138334 e!885558))

(declare-fun e!885557 () Bool)

(assert (=> start!138334 e!885557))

(assert (=> start!138334 true))

(declare-fun tp_is_empty!39537 () Bool)

(assert (=> start!138334 tp_is_empty!39537))

(declare-fun b!1585955 () Bool)

(declare-fun res!1083125 () Bool)

(assert (=> b!1585955 (=> (not res!1083125) (not e!885558))))

(get-info :version)

(assert (=> b!1585955 (= res!1083125 (and (or (not ((_ is Cons!36980) l!556)) (bvsge (_1!12959 (h!38523 l!556)) newKey!21)) (or (not ((_ is Cons!36980) l!556)) (not (= (_1!12959 (h!38523 l!556)) newKey!21))) (or (not ((_ is Cons!36980) l!556)) (bvsle (_1!12959 (h!38523 l!556)) newKey!21)) ((_ is Nil!36981) l!556)))))

(declare-fun b!1585956 () Bool)

(declare-fun lt!677471 () tuple2!25896)

(declare-fun contains!10542 (List!36984 tuple2!25896) Bool)

(assert (=> b!1585956 (= e!885556 (not (contains!10542 lt!677472 lt!677471)))))

(declare-fun b!1585957 () Bool)

(declare-fun tp!115320 () Bool)

(assert (=> b!1585957 (= e!885557 (and tp_is_empty!39537 tp!115320))))

(declare-fun b!1585958 () Bool)

(assert (=> b!1585958 (= e!885558 e!885556)))

(declare-fun res!1083126 () Bool)

(assert (=> b!1585958 (=> res!1083126 e!885556)))

(assert (=> b!1585958 (= res!1083126 (not (isStrictlySorted!1206 lt!677472)))))

(declare-fun $colon$colon!1050 (List!36984 tuple2!25896) List!36984)

(assert (=> b!1585958 (= lt!677472 ($colon$colon!1050 Nil!36981 lt!677471))))

(declare-fun newValue!21 () B!3004)

(assert (=> b!1585958 (= lt!677471 (tuple2!25897 newKey!21 newValue!21))))

(assert (= (and start!138334 res!1083127) b!1585955))

(assert (= (and b!1585955 res!1083125) b!1585958))

(assert (= (and b!1585958 (not res!1083126)) b!1585954))

(assert (= (and b!1585954 (not res!1083128)) b!1585956))

(assert (= (and start!138334 ((_ is Cons!36980) l!556)) b!1585957))

(declare-fun m!1454575 () Bool)

(assert (=> b!1585954 m!1454575))

(declare-fun m!1454577 () Bool)

(assert (=> start!138334 m!1454577))

(declare-fun m!1454579 () Bool)

(assert (=> b!1585956 m!1454579))

(declare-fun m!1454581 () Bool)

(assert (=> b!1585958 m!1454581))

(declare-fun m!1454583 () Bool)

(assert (=> b!1585958 m!1454583))

(check-sat (not b!1585956) (not b!1585954) tp_is_empty!39537 (not b!1585958) (not b!1585957) (not start!138334))
(check-sat)
(get-model)

(declare-fun d!167833 () Bool)

(declare-fun lt!677481 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!873 (List!36984) (InoxSet tuple2!25896))

(assert (=> d!167833 (= lt!677481 (select (content!873 lt!677472) lt!677471))))

(declare-fun e!885577 () Bool)

(assert (=> d!167833 (= lt!677481 e!885577)))

(declare-fun res!1083149 () Bool)

(assert (=> d!167833 (=> (not res!1083149) (not e!885577))))

(assert (=> d!167833 (= res!1083149 ((_ is Cons!36980) lt!677472))))

(assert (=> d!167833 (= (contains!10542 lt!677472 lt!677471) lt!677481)))

(declare-fun b!1585982 () Bool)

(declare-fun e!885576 () Bool)

(assert (=> b!1585982 (= e!885577 e!885576)))

(declare-fun res!1083150 () Bool)

(assert (=> b!1585982 (=> res!1083150 e!885576)))

(assert (=> b!1585982 (= res!1083150 (= (h!38523 lt!677472) lt!677471))))

(declare-fun b!1585983 () Bool)

(assert (=> b!1585983 (= e!885576 (contains!10542 (t!51911 lt!677472) lt!677471))))

(assert (= (and d!167833 res!1083149) b!1585982))

(assert (= (and b!1585982 (not res!1083150)) b!1585983))

(declare-fun m!1454595 () Bool)

(assert (=> d!167833 m!1454595))

(declare-fun m!1454597 () Bool)

(assert (=> d!167833 m!1454597))

(declare-fun m!1454599 () Bool)

(assert (=> b!1585983 m!1454599))

(assert (=> b!1585956 d!167833))

(declare-fun d!167839 () Bool)

(declare-fun res!1083163 () Bool)

(declare-fun e!885590 () Bool)

(assert (=> d!167839 (=> res!1083163 e!885590)))

(assert (=> d!167839 (= res!1083163 (or ((_ is Nil!36981) lt!677472) ((_ is Nil!36981) (t!51911 lt!677472))))))

(assert (=> d!167839 (= (isStrictlySorted!1206 lt!677472) e!885590)))

(declare-fun b!1585996 () Bool)

(declare-fun e!885591 () Bool)

(assert (=> b!1585996 (= e!885590 e!885591)))

(declare-fun res!1083164 () Bool)

(assert (=> b!1585996 (=> (not res!1083164) (not e!885591))))

(assert (=> b!1585996 (= res!1083164 (bvslt (_1!12959 (h!38523 lt!677472)) (_1!12959 (h!38523 (t!51911 lt!677472)))))))

(declare-fun b!1585997 () Bool)

(assert (=> b!1585997 (= e!885591 (isStrictlySorted!1206 (t!51911 lt!677472)))))

(assert (= (and d!167839 (not res!1083163)) b!1585996))

(assert (= (and b!1585996 res!1083164) b!1585997))

(declare-fun m!1454609 () Bool)

(assert (=> b!1585997 m!1454609))

(assert (=> b!1585958 d!167839))

(declare-fun d!167847 () Bool)

(assert (=> d!167847 (= ($colon$colon!1050 Nil!36981 lt!677471) (Cons!36980 lt!677471 Nil!36981))))

(assert (=> b!1585958 d!167847))

(declare-fun d!167849 () Bool)

(declare-fun res!1083181 () Bool)

(declare-fun e!885608 () Bool)

(assert (=> d!167849 (=> res!1083181 e!885608)))

(assert (=> d!167849 (= res!1083181 (and ((_ is Cons!36980) lt!677472) (= (_1!12959 (h!38523 lt!677472)) newKey!21)))))

(assert (=> d!167849 (= (containsKey!1019 lt!677472 newKey!21) e!885608)))

(declare-fun b!1586014 () Bool)

(declare-fun e!885609 () Bool)

(assert (=> b!1586014 (= e!885608 e!885609)))

(declare-fun res!1083182 () Bool)

(assert (=> b!1586014 (=> (not res!1083182) (not e!885609))))

(assert (=> b!1586014 (= res!1083182 (and (or (not ((_ is Cons!36980) lt!677472)) (bvsle (_1!12959 (h!38523 lt!677472)) newKey!21)) ((_ is Cons!36980) lt!677472) (bvslt (_1!12959 (h!38523 lt!677472)) newKey!21)))))

(declare-fun b!1586015 () Bool)

(assert (=> b!1586015 (= e!885609 (containsKey!1019 (t!51911 lt!677472) newKey!21))))

(assert (= (and d!167849 (not res!1083181)) b!1586014))

(assert (= (and b!1586014 res!1083182) b!1586015))

(declare-fun m!1454615 () Bool)

(assert (=> b!1586015 m!1454615))

(assert (=> b!1585954 d!167849))

(declare-fun d!167855 () Bool)

(declare-fun res!1083187 () Bool)

(declare-fun e!885614 () Bool)

(assert (=> d!167855 (=> res!1083187 e!885614)))

(assert (=> d!167855 (= res!1083187 (or ((_ is Nil!36981) l!556) ((_ is Nil!36981) (t!51911 l!556))))))

(assert (=> d!167855 (= (isStrictlySorted!1206 l!556) e!885614)))

(declare-fun b!1586020 () Bool)

(declare-fun e!885615 () Bool)

(assert (=> b!1586020 (= e!885614 e!885615)))

(declare-fun res!1083188 () Bool)

(assert (=> b!1586020 (=> (not res!1083188) (not e!885615))))

(assert (=> b!1586020 (= res!1083188 (bvslt (_1!12959 (h!38523 l!556)) (_1!12959 (h!38523 (t!51911 l!556)))))))

(declare-fun b!1586021 () Bool)

(assert (=> b!1586021 (= e!885615 (isStrictlySorted!1206 (t!51911 l!556)))))

(assert (= (and d!167855 (not res!1083187)) b!1586020))

(assert (= (and b!1586020 res!1083188) b!1586021))

(declare-fun m!1454617 () Bool)

(assert (=> b!1586021 m!1454617))

(assert (=> start!138334 d!167855))

(declare-fun b!1586030 () Bool)

(declare-fun e!885622 () Bool)

(declare-fun tp!115326 () Bool)

(assert (=> b!1586030 (= e!885622 (and tp_is_empty!39537 tp!115326))))

(assert (=> b!1585957 (= tp!115320 e!885622)))

(assert (= (and b!1585957 ((_ is Cons!36980) (t!51911 l!556))) b!1586030))

(check-sat (not b!1586015) (not d!167833) (not b!1586030) (not b!1585997) (not b!1586021) (not b!1585983) tp_is_empty!39537)
(check-sat)
