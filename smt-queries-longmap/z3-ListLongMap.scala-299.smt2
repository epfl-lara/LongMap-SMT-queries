; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5198 () Bool)

(assert start!5198)

(declare-fun res!22844 () Bool)

(declare-fun e!24015 () Bool)

(assert (=> start!5198 (=> (not res!22844) (not e!24015))))

(declare-datatypes ((B!782 0))(
  ( (B!783 (val!891 Int)) )
))
(declare-fun b!99 () B!782)

(declare-datatypes ((tuple2!1424 0))(
  ( (tuple2!1425 (_1!723 (_ BitVec 64)) (_2!723 B!782)) )
))
(declare-datatypes ((List!987 0))(
  ( (Nil!984) (Cons!983 (h!1551 tuple2!1424) (t!3820 List!987)) )
))
(declare-datatypes ((ListLongMap!995 0))(
  ( (ListLongMap!996 (toList!513 List!987)) )
))
(declare-fun lm!264 () ListLongMap!995)

(declare-fun a!526 () (_ BitVec 64))

(declare-fun contains!466 (List!987 tuple2!1424) Bool)

(assert (=> start!5198 (= res!22844 (contains!466 (toList!513 lm!264) (tuple2!1425 a!526 b!99)))))

(assert (=> start!5198 e!24015))

(declare-fun e!24014 () Bool)

(declare-fun inv!1691 (ListLongMap!995) Bool)

(assert (=> start!5198 (and (inv!1691 lm!264) e!24014)))

(assert (=> start!5198 true))

(declare-fun tp_is_empty!1705 () Bool)

(assert (=> start!5198 tp_is_empty!1705))

(declare-fun b!37842 () Bool)

(declare-fun isStrictlySorted!184 (List!987) Bool)

(assert (=> b!37842 (= e!24015 (not (isStrictlySorted!184 (toList!513 lm!264))))))

(declare-fun containsKey!60 (List!987 (_ BitVec 64)) Bool)

(assert (=> b!37842 (containsKey!60 (toList!513 lm!264) a!526)))

(declare-datatypes ((Unit!881 0))(
  ( (Unit!882) )
))
(declare-fun lt!13894 () Unit!881)

(declare-fun lemmaContainsTupleThenContainsKey!4 (List!987 (_ BitVec 64) B!782) Unit!881)

(assert (=> b!37842 (= lt!13894 (lemmaContainsTupleThenContainsKey!4 (toList!513 lm!264) a!526 b!99))))

(declare-fun b!37843 () Bool)

(declare-fun tp!5624 () Bool)

(assert (=> b!37843 (= e!24014 tp!5624)))

(assert (= (and start!5198 res!22844) b!37842))

(assert (= start!5198 b!37843))

(declare-fun m!30475 () Bool)

(assert (=> start!5198 m!30475))

(declare-fun m!30477 () Bool)

(assert (=> start!5198 m!30477))

(declare-fun m!30479 () Bool)

(assert (=> b!37842 m!30479))

(declare-fun m!30481 () Bool)

(assert (=> b!37842 m!30481))

(declare-fun m!30483 () Bool)

(assert (=> b!37842 m!30483))

(check-sat (not b!37842) (not start!5198) (not b!37843) tp_is_empty!1705)
(check-sat)
(get-model)

(declare-fun d!6111 () Bool)

(declare-fun res!22867 () Bool)

(declare-fun e!24044 () Bool)

(assert (=> d!6111 (=> res!22867 e!24044)))

(get-info :version)

(assert (=> d!6111 (= res!22867 (or ((_ is Nil!984) (toList!513 lm!264)) ((_ is Nil!984) (t!3820 (toList!513 lm!264)))))))

(assert (=> d!6111 (= (isStrictlySorted!184 (toList!513 lm!264)) e!24044)))

(declare-fun b!37872 () Bool)

(declare-fun e!24045 () Bool)

(assert (=> b!37872 (= e!24044 e!24045)))

(declare-fun res!22868 () Bool)

(assert (=> b!37872 (=> (not res!22868) (not e!24045))))

(assert (=> b!37872 (= res!22868 (bvslt (_1!723 (h!1551 (toList!513 lm!264))) (_1!723 (h!1551 (t!3820 (toList!513 lm!264))))))))

(declare-fun b!37873 () Bool)

(assert (=> b!37873 (= e!24045 (isStrictlySorted!184 (t!3820 (toList!513 lm!264))))))

(assert (= (and d!6111 (not res!22867)) b!37872))

(assert (= (and b!37872 res!22868) b!37873))

(declare-fun m!30509 () Bool)

(assert (=> b!37873 m!30509))

(assert (=> b!37842 d!6111))

(declare-fun d!6117 () Bool)

(declare-fun res!22881 () Bool)

(declare-fun e!24058 () Bool)

(assert (=> d!6117 (=> res!22881 e!24058)))

(assert (=> d!6117 (= res!22881 (and ((_ is Cons!983) (toList!513 lm!264)) (= (_1!723 (h!1551 (toList!513 lm!264))) a!526)))))

(assert (=> d!6117 (= (containsKey!60 (toList!513 lm!264) a!526) e!24058)))

(declare-fun b!37886 () Bool)

(declare-fun e!24059 () Bool)

(assert (=> b!37886 (= e!24058 e!24059)))

(declare-fun res!22882 () Bool)

(assert (=> b!37886 (=> (not res!22882) (not e!24059))))

(assert (=> b!37886 (= res!22882 (and (or (not ((_ is Cons!983) (toList!513 lm!264))) (bvsle (_1!723 (h!1551 (toList!513 lm!264))) a!526)) ((_ is Cons!983) (toList!513 lm!264)) (bvslt (_1!723 (h!1551 (toList!513 lm!264))) a!526)))))

(declare-fun b!37887 () Bool)

(assert (=> b!37887 (= e!24059 (containsKey!60 (t!3820 (toList!513 lm!264)) a!526))))

(assert (= (and d!6117 (not res!22881)) b!37886))

(assert (= (and b!37886 res!22882) b!37887))

(declare-fun m!30511 () Bool)

(assert (=> b!37887 m!30511))

(assert (=> b!37842 d!6117))

(declare-fun d!6119 () Bool)

(assert (=> d!6119 (containsKey!60 (toList!513 lm!264) a!526)))

(declare-fun lt!13909 () Unit!881)

(declare-fun choose!241 (List!987 (_ BitVec 64) B!782) Unit!881)

(assert (=> d!6119 (= lt!13909 (choose!241 (toList!513 lm!264) a!526 b!99))))

(declare-fun e!24072 () Bool)

(assert (=> d!6119 e!24072))

(declare-fun res!22895 () Bool)

(assert (=> d!6119 (=> (not res!22895) (not e!24072))))

(assert (=> d!6119 (= res!22895 (isStrictlySorted!184 (toList!513 lm!264)))))

(assert (=> d!6119 (= (lemmaContainsTupleThenContainsKey!4 (toList!513 lm!264) a!526 b!99) lt!13909)))

(declare-fun b!37900 () Bool)

(assert (=> b!37900 (= e!24072 (contains!466 (toList!513 lm!264) (tuple2!1425 a!526 b!99)))))

(assert (= (and d!6119 res!22895) b!37900))

(assert (=> d!6119 m!30481))

(declare-fun m!30521 () Bool)

(assert (=> d!6119 m!30521))

(assert (=> d!6119 m!30479))

(assert (=> b!37900 m!30475))

(assert (=> b!37842 d!6119))

(declare-fun lt!13918 () Bool)

(declare-fun d!6129 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!22 (List!987) (InoxSet tuple2!1424))

(assert (=> d!6129 (= lt!13918 (select (content!22 (toList!513 lm!264)) (tuple2!1425 a!526 b!99)))))

(declare-fun e!24088 () Bool)

(assert (=> d!6129 (= lt!13918 e!24088)))

(declare-fun res!22910 () Bool)

(assert (=> d!6129 (=> (not res!22910) (not e!24088))))

(assert (=> d!6129 (= res!22910 ((_ is Cons!983) (toList!513 lm!264)))))

(assert (=> d!6129 (= (contains!466 (toList!513 lm!264) (tuple2!1425 a!526 b!99)) lt!13918)))

(declare-fun b!37915 () Bool)

(declare-fun e!24087 () Bool)

(assert (=> b!37915 (= e!24088 e!24087)))

(declare-fun res!22911 () Bool)

(assert (=> b!37915 (=> res!22911 e!24087)))

(assert (=> b!37915 (= res!22911 (= (h!1551 (toList!513 lm!264)) (tuple2!1425 a!526 b!99)))))

(declare-fun b!37916 () Bool)

(assert (=> b!37916 (= e!24087 (contains!466 (t!3820 (toList!513 lm!264)) (tuple2!1425 a!526 b!99)))))

(assert (= (and d!6129 res!22910) b!37915))

(assert (= (and b!37915 (not res!22911)) b!37916))

(declare-fun m!30525 () Bool)

(assert (=> d!6129 m!30525))

(declare-fun m!30531 () Bool)

(assert (=> d!6129 m!30531))

(declare-fun m!30537 () Bool)

(assert (=> b!37916 m!30537))

(assert (=> start!5198 d!6129))

(declare-fun d!6133 () Bool)

(assert (=> d!6133 (= (inv!1691 lm!264) (isStrictlySorted!184 (toList!513 lm!264)))))

(declare-fun bs!1510 () Bool)

(assert (= bs!1510 d!6133))

(assert (=> bs!1510 m!30479))

(assert (=> start!5198 d!6133))

(declare-fun b!37931 () Bool)

(declare-fun e!24097 () Bool)

(declare-fun tp!5637 () Bool)

(assert (=> b!37931 (= e!24097 (and tp_is_empty!1705 tp!5637))))

(assert (=> b!37843 (= tp!5624 e!24097)))

(assert (= (and b!37843 ((_ is Cons!983) (toList!513 lm!264))) b!37931))

(check-sat (not b!37887) tp_is_empty!1705 (not b!37931) (not d!6119) (not d!6133) (not b!37900) (not d!6129) (not b!37916) (not b!37873))
(check-sat)
