; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7462 () Bool)

(assert start!7462)

(declare-fun res!27811 () Bool)

(declare-fun e!30689 () Bool)

(assert (=> start!7462 (=> (not res!27811) (not e!30689))))

(declare-datatypes ((B!914 0))(
  ( (B!915 (val!1077 Int)) )
))
(declare-datatypes ((tuple2!1718 0))(
  ( (tuple2!1719 (_1!870 (_ BitVec 64)) (_2!870 B!914)) )
))
(declare-datatypes ((List!1260 0))(
  ( (Nil!1257) (Cons!1256 (h!1836 tuple2!1718) (t!4288 List!1260)) )
))
(declare-datatypes ((ListLongMap!1205 0))(
  ( (ListLongMap!1206 (toList!618 List!1260)) )
))
(declare-fun lm!267 () ListLongMap!1205)

(declare-fun key!657 () (_ BitVec 64))

(declare-fun contains!585 (ListLongMap!1205 (_ BitVec 64)) Bool)

(assert (=> start!7462 (= res!27811 (not (contains!585 lm!267 key!657)))))

(assert (=> start!7462 e!30689))

(declare-fun e!30690 () Bool)

(declare-fun inv!2220 (ListLongMap!1205) Bool)

(assert (=> start!7462 (and (inv!2220 lm!267) e!30690)))

(assert (=> start!7462 true))

(declare-fun b!47854 () Bool)

(declare-fun isStrictlySorted!235 (List!1260) Bool)

(assert (=> b!47854 (= e!30689 (not (isStrictlySorted!235 (toList!618 lm!267))))))

(declare-fun b!47855 () Bool)

(declare-fun tp!6311 () Bool)

(assert (=> b!47855 (= e!30690 tp!6311)))

(assert (= (and start!7462 res!27811) b!47854))

(assert (= start!7462 b!47855))

(declare-fun m!41813 () Bool)

(assert (=> start!7462 m!41813))

(declare-fun m!41815 () Bool)

(assert (=> start!7462 m!41815))

(declare-fun m!41817 () Bool)

(assert (=> b!47854 m!41817))

(check-sat (not b!47854) (not start!7462) (not b!47855))
(check-sat)
(get-model)

(declare-fun d!9485 () Bool)

(declare-fun res!27822 () Bool)

(declare-fun e!30707 () Bool)

(assert (=> d!9485 (=> res!27822 e!30707)))

(get-info :version)

(assert (=> d!9485 (= res!27822 (or ((_ is Nil!1257) (toList!618 lm!267)) ((_ is Nil!1257) (t!4288 (toList!618 lm!267)))))))

(assert (=> d!9485 (= (isStrictlySorted!235 (toList!618 lm!267)) e!30707)))

(declare-fun b!47872 () Bool)

(declare-fun e!30708 () Bool)

(assert (=> b!47872 (= e!30707 e!30708)))

(declare-fun res!27823 () Bool)

(assert (=> b!47872 (=> (not res!27823) (not e!30708))))

(assert (=> b!47872 (= res!27823 (bvslt (_1!870 (h!1836 (toList!618 lm!267))) (_1!870 (h!1836 (t!4288 (toList!618 lm!267))))))))

(declare-fun b!47873 () Bool)

(assert (=> b!47873 (= e!30708 (isStrictlySorted!235 (t!4288 (toList!618 lm!267))))))

(assert (= (and d!9485 (not res!27822)) b!47872))

(assert (= (and b!47872 res!27823) b!47873))

(declare-fun m!41831 () Bool)

(assert (=> b!47873 m!41831))

(assert (=> b!47854 d!9485))

(declare-fun d!9487 () Bool)

(declare-fun e!30725 () Bool)

(assert (=> d!9487 e!30725))

(declare-fun res!27832 () Bool)

(assert (=> d!9487 (=> res!27832 e!30725)))

(declare-fun lt!20465 () Bool)

(assert (=> d!9487 (= res!27832 (not lt!20465))))

(declare-fun lt!20464 () Bool)

(assert (=> d!9487 (= lt!20465 lt!20464)))

(declare-datatypes ((Unit!1352 0))(
  ( (Unit!1353) )
))
(declare-fun lt!20467 () Unit!1352)

(declare-fun e!30726 () Unit!1352)

(assert (=> d!9487 (= lt!20467 e!30726)))

(declare-fun c!6434 () Bool)

(assert (=> d!9487 (= c!6434 lt!20464)))

(declare-fun containsKey!98 (List!1260 (_ BitVec 64)) Bool)

(assert (=> d!9487 (= lt!20464 (containsKey!98 (toList!618 lm!267) key!657))))

(assert (=> d!9487 (= (contains!585 lm!267 key!657) lt!20465)))

(declare-fun b!47898 () Bool)

(declare-fun lt!20466 () Unit!1352)

(assert (=> b!47898 (= e!30726 lt!20466)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!68 (List!1260 (_ BitVec 64)) Unit!1352)

(assert (=> b!47898 (= lt!20466 (lemmaContainsKeyImpliesGetValueByKeyDefined!68 (toList!618 lm!267) key!657))))

(declare-datatypes ((Option!119 0))(
  ( (Some!118 (v!2135 B!914)) (None!117) )
))
(declare-fun isDefined!69 (Option!119) Bool)

(declare-fun getValueByKey!113 (List!1260 (_ BitVec 64)) Option!119)

(assert (=> b!47898 (isDefined!69 (getValueByKey!113 (toList!618 lm!267) key!657))))

(declare-fun b!47899 () Bool)

(declare-fun Unit!1356 () Unit!1352)

(assert (=> b!47899 (= e!30726 Unit!1356)))

(declare-fun b!47900 () Bool)

(assert (=> b!47900 (= e!30725 (isDefined!69 (getValueByKey!113 (toList!618 lm!267) key!657)))))

(assert (= (and d!9487 c!6434) b!47898))

(assert (= (and d!9487 (not c!6434)) b!47899))

(assert (= (and d!9487 (not res!27832)) b!47900))

(declare-fun m!41849 () Bool)

(assert (=> d!9487 m!41849))

(declare-fun m!41851 () Bool)

(assert (=> b!47898 m!41851))

(declare-fun m!41853 () Bool)

(assert (=> b!47898 m!41853))

(assert (=> b!47898 m!41853))

(declare-fun m!41855 () Bool)

(assert (=> b!47898 m!41855))

(assert (=> b!47900 m!41853))

(assert (=> b!47900 m!41853))

(assert (=> b!47900 m!41855))

(assert (=> start!7462 d!9487))

(declare-fun d!9497 () Bool)

(assert (=> d!9497 (= (inv!2220 lm!267) (isStrictlySorted!235 (toList!618 lm!267)))))

(declare-fun bs!2235 () Bool)

(assert (= bs!2235 d!9497))

(assert (=> bs!2235 m!41817))

(assert (=> start!7462 d!9497))

(declare-fun b!47925 () Bool)

(declare-fun e!30745 () Bool)

(declare-fun tp_is_empty!2065 () Bool)

(declare-fun tp!6324 () Bool)

(assert (=> b!47925 (= e!30745 (and tp_is_empty!2065 tp!6324))))

(assert (=> b!47855 (= tp!6311 e!30745)))

(assert (= (and b!47855 ((_ is Cons!1256) (toList!618 lm!267))) b!47925))

(check-sat (not b!47925) (not d!9487) (not b!47900) (not d!9497) (not b!47898) tp_is_empty!2065 (not b!47873))
(check-sat)
