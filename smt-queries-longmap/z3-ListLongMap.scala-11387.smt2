; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132348 () Bool)

(assert start!132348)

(declare-fun res!1063123 () Bool)

(declare-fun e!864685 () Bool)

(assert (=> start!132348 (=> (not res!1063123) (not e!864685))))

(declare-datatypes ((B!2198 0))(
  ( (B!2199 (val!19185 Int)) )
))
(declare-datatypes ((tuple2!24818 0))(
  ( (tuple2!24819 (_1!12420 (_ BitVec 64)) (_2!12420 B!2198)) )
))
(declare-datatypes ((List!36264 0))(
  ( (Nil!36261) (Cons!36260 (h!37707 tuple2!24818) (t!50977 List!36264)) )
))
(declare-datatypes ((ListLongMap!22427 0))(
  ( (ListLongMap!22428 (toList!11229 List!36264)) )
))
(declare-fun lm!249 () ListLongMap!22427)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun contains!10092 (ListLongMap!22427 (_ BitVec 64)) Bool)

(assert (=> start!132348 (= res!1063123 (contains!10092 lm!249 a0!49))))

(assert (=> start!132348 e!864685))

(declare-fun e!864686 () Bool)

(declare-fun inv!57287 (ListLongMap!22427) Bool)

(assert (=> start!132348 (and (inv!57287 lm!249) e!864686)))

(assert (=> start!132348 true))

(declare-fun b!1553123 () Bool)

(declare-fun res!1063122 () Bool)

(assert (=> b!1553123 (=> (not res!1063122) (not e!864685))))

(declare-fun a!523 () (_ BitVec 64))

(assert (=> b!1553123 (= res!1063122 (not (= a0!49 a!523)))))

(declare-fun b!1553124 () Bool)

(declare-fun isStrictlySorted!885 (List!36264) Bool)

(assert (=> b!1553124 (= e!864685 (not (isStrictlySorted!885 (toList!11229 lm!249))))))

(declare-fun b!1553125 () Bool)

(declare-fun tp!112084 () Bool)

(assert (=> b!1553125 (= e!864686 tp!112084)))

(assert (= (and start!132348 res!1063123) b!1553123))

(assert (= (and b!1553123 res!1063122) b!1553124))

(assert (= start!132348 b!1553125))

(declare-fun m!1431233 () Bool)

(assert (=> start!132348 m!1431233))

(declare-fun m!1431235 () Bool)

(assert (=> start!132348 m!1431235))

(declare-fun m!1431237 () Bool)

(assert (=> b!1553124 m!1431237))

(check-sat (not b!1553124) (not start!132348) (not b!1553125))
(check-sat)
(get-model)

(declare-fun d!161297 () Bool)

(declare-fun res!1063146 () Bool)

(declare-fun e!864709 () Bool)

(assert (=> d!161297 (=> res!1063146 e!864709)))

(get-info :version)

(assert (=> d!161297 (= res!1063146 (or ((_ is Nil!36261) (toList!11229 lm!249)) ((_ is Nil!36261) (t!50977 (toList!11229 lm!249)))))))

(assert (=> d!161297 (= (isStrictlySorted!885 (toList!11229 lm!249)) e!864709)))

(declare-fun b!1553154 () Bool)

(declare-fun e!864710 () Bool)

(assert (=> b!1553154 (= e!864709 e!864710)))

(declare-fun res!1063147 () Bool)

(assert (=> b!1553154 (=> (not res!1063147) (not e!864710))))

(assert (=> b!1553154 (= res!1063147 (bvslt (_1!12420 (h!37707 (toList!11229 lm!249))) (_1!12420 (h!37707 (t!50977 (toList!11229 lm!249))))))))

(declare-fun b!1553155 () Bool)

(assert (=> b!1553155 (= e!864710 (isStrictlySorted!885 (t!50977 (toList!11229 lm!249))))))

(assert (= (and d!161297 (not res!1063146)) b!1553154))

(assert (= (and b!1553154 res!1063147) b!1553155))

(declare-fun m!1431253 () Bool)

(assert (=> b!1553155 m!1431253))

(assert (=> b!1553124 d!161297))

(declare-fun d!161303 () Bool)

(declare-fun e!864727 () Bool)

(assert (=> d!161303 e!864727))

(declare-fun res!1063156 () Bool)

(assert (=> d!161303 (=> res!1063156 e!864727)))

(declare-fun lt!669407 () Bool)

(assert (=> d!161303 (= res!1063156 (not lt!669407))))

(declare-fun lt!669406 () Bool)

(assert (=> d!161303 (= lt!669407 lt!669406)))

(declare-datatypes ((Unit!51553 0))(
  ( (Unit!51554) )
))
(declare-fun lt!669408 () Unit!51553)

(declare-fun e!864728 () Unit!51553)

(assert (=> d!161303 (= lt!669408 e!864728)))

(declare-fun c!143172 () Bool)

(assert (=> d!161303 (= c!143172 lt!669406)))

(declare-fun containsKey!754 (List!36264 (_ BitVec 64)) Bool)

(assert (=> d!161303 (= lt!669406 (containsKey!754 (toList!11229 lm!249) a0!49))))

(assert (=> d!161303 (= (contains!10092 lm!249 a0!49) lt!669407)))

(declare-fun b!1553180 () Bool)

(declare-fun lt!669409 () Unit!51553)

(assert (=> b!1553180 (= e!864728 lt!669409)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!501 (List!36264 (_ BitVec 64)) Unit!51553)

(assert (=> b!1553180 (= lt!669409 (lemmaContainsKeyImpliesGetValueByKeyDefined!501 (toList!11229 lm!249) a0!49))))

(declare-datatypes ((Option!812 0))(
  ( (Some!811 (v!21990 B!2198)) (None!810) )
))
(declare-fun isDefined!553 (Option!812) Bool)

(declare-fun getValueByKey!737 (List!36264 (_ BitVec 64)) Option!812)

(assert (=> b!1553180 (isDefined!553 (getValueByKey!737 (toList!11229 lm!249) a0!49))))

(declare-fun b!1553181 () Bool)

(declare-fun Unit!51558 () Unit!51553)

(assert (=> b!1553181 (= e!864728 Unit!51558)))

(declare-fun b!1553182 () Bool)

(assert (=> b!1553182 (= e!864727 (isDefined!553 (getValueByKey!737 (toList!11229 lm!249) a0!49)))))

(assert (= (and d!161303 c!143172) b!1553180))

(assert (= (and d!161303 (not c!143172)) b!1553181))

(assert (= (and d!161303 (not res!1063156)) b!1553182))

(declare-fun m!1431271 () Bool)

(assert (=> d!161303 m!1431271))

(declare-fun m!1431273 () Bool)

(assert (=> b!1553180 m!1431273))

(declare-fun m!1431275 () Bool)

(assert (=> b!1553180 m!1431275))

(assert (=> b!1553180 m!1431275))

(declare-fun m!1431277 () Bool)

(assert (=> b!1553180 m!1431277))

(assert (=> b!1553182 m!1431275))

(assert (=> b!1553182 m!1431275))

(assert (=> b!1553182 m!1431277))

(assert (=> start!132348 d!161303))

(declare-fun d!161311 () Bool)

(assert (=> d!161311 (= (inv!57287 lm!249) (isStrictlySorted!885 (toList!11229 lm!249)))))

(declare-fun bs!44601 () Bool)

(assert (= bs!44601 d!161311))

(assert (=> bs!44601 m!1431237))

(assert (=> start!132348 d!161311))

(declare-fun b!1553196 () Bool)

(declare-fun e!864738 () Bool)

(declare-fun tp_is_empty!38217 () Bool)

(declare-fun tp!112096 () Bool)

(assert (=> b!1553196 (= e!864738 (and tp_is_empty!38217 tp!112096))))

(assert (=> b!1553125 (= tp!112084 e!864738)))

(assert (= (and b!1553125 ((_ is Cons!36260) (toList!11229 lm!249))) b!1553196))

(check-sat (not b!1553180) (not b!1553196) tp_is_empty!38217 (not b!1553155) (not d!161303) (not d!161311) (not b!1553182))
(check-sat)
