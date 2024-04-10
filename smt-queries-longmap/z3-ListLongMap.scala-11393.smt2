; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132532 () Bool)

(assert start!132532)

(declare-fun res!1063611 () Bool)

(declare-fun e!865318 () Bool)

(assert (=> start!132532 (=> (not res!1063611) (not e!865318))))

(declare-datatypes ((B!2236 0))(
  ( (B!2237 (val!19204 Int)) )
))
(declare-datatypes ((tuple2!24784 0))(
  ( (tuple2!24785 (_1!12403 (_ BitVec 64)) (_2!12403 B!2236)) )
))
(declare-datatypes ((List!36238 0))(
  ( (Nil!36235) (Cons!36234 (h!37680 tuple2!24784) (t!50959 List!36238)) )
))
(declare-datatypes ((ListLongMap!22393 0))(
  ( (ListLongMap!22394 (toList!11212 List!36238)) )
))
(declare-fun lm!249 () ListLongMap!22393)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun contains!10157 (ListLongMap!22393 (_ BitVec 64)) Bool)

(assert (=> start!132532 (= res!1063611 (contains!10157 lm!249 a0!49))))

(assert (=> start!132532 e!865318))

(declare-fun e!865317 () Bool)

(declare-fun inv!57336 (ListLongMap!22393) Bool)

(assert (=> start!132532 (and (inv!57336 lm!249) e!865317)))

(assert (=> start!132532 true))

(declare-fun b!1554076 () Bool)

(declare-fun res!1063610 () Bool)

(assert (=> b!1554076 (=> (not res!1063610) (not e!865318))))

(declare-fun a!523 () (_ BitVec 64))

(assert (=> b!1554076 (= res!1063610 (not (= a0!49 a!523)))))

(declare-fun b!1554077 () Bool)

(declare-fun res!1063612 () Bool)

(assert (=> b!1554077 (=> (not res!1063612) (not e!865318))))

(declare-fun containsKey!771 (List!36238 (_ BitVec 64)) Bool)

(assert (=> b!1554077 (= res!1063612 (containsKey!771 (toList!11212 lm!249) a0!49))))

(declare-fun b!1554078 () Bool)

(declare-fun e!865319 () Bool)

(assert (=> b!1554078 (= e!865319 (= a!523 a0!49))))

(declare-fun b!1554079 () Bool)

(assert (=> b!1554079 (= e!865318 e!865319)))

(declare-fun res!1063609 () Bool)

(assert (=> b!1554079 (=> res!1063609 e!865319)))

(declare-fun isStrictlySorted!900 (List!36238) Bool)

(assert (=> b!1554079 (= res!1063609 (not (isStrictlySorted!900 (toList!11212 lm!249))))))

(declare-fun b!1554080 () Bool)

(declare-fun tp!112167 () Bool)

(assert (=> b!1554080 (= e!865317 tp!112167)))

(assert (= (and start!132532 res!1063611) b!1554076))

(assert (= (and b!1554076 res!1063610) b!1554077))

(assert (= (and b!1554077 res!1063612) b!1554079))

(assert (= (and b!1554079 (not res!1063609)) b!1554078))

(assert (= start!132532 b!1554080))

(declare-fun m!1432583 () Bool)

(assert (=> start!132532 m!1432583))

(declare-fun m!1432585 () Bool)

(assert (=> start!132532 m!1432585))

(declare-fun m!1432587 () Bool)

(assert (=> b!1554077 m!1432587))

(declare-fun m!1432589 () Bool)

(assert (=> b!1554079 m!1432589))

(check-sat (not b!1554079) (not start!132532) (not b!1554077) (not b!1554080))
(check-sat)
(get-model)

(declare-fun d!161677 () Bool)

(declare-fun res!1063635 () Bool)

(declare-fun e!865339 () Bool)

(assert (=> d!161677 (=> res!1063635 e!865339)))

(get-info :version)

(assert (=> d!161677 (= res!1063635 (or ((_ is Nil!36235) (toList!11212 lm!249)) ((_ is Nil!36235) (t!50959 (toList!11212 lm!249)))))))

(assert (=> d!161677 (= (isStrictlySorted!900 (toList!11212 lm!249)) e!865339)))

(declare-fun b!1554106 () Bool)

(declare-fun e!865340 () Bool)

(assert (=> b!1554106 (= e!865339 e!865340)))

(declare-fun res!1063636 () Bool)

(assert (=> b!1554106 (=> (not res!1063636) (not e!865340))))

(assert (=> b!1554106 (= res!1063636 (bvslt (_1!12403 (h!37680 (toList!11212 lm!249))) (_1!12403 (h!37680 (t!50959 (toList!11212 lm!249))))))))

(declare-fun b!1554107 () Bool)

(assert (=> b!1554107 (= e!865340 (isStrictlySorted!900 (t!50959 (toList!11212 lm!249))))))

(assert (= (and d!161677 (not res!1063635)) b!1554106))

(assert (= (and b!1554106 res!1063636) b!1554107))

(declare-fun m!1432601 () Bool)

(assert (=> b!1554107 m!1432601))

(assert (=> b!1554079 d!161677))

(declare-fun d!161683 () Bool)

(declare-fun e!865362 () Bool)

(assert (=> d!161683 e!865362))

(declare-fun res!1063653 () Bool)

(assert (=> d!161683 (=> res!1063653 e!865362)))

(declare-fun lt!669934 () Bool)

(assert (=> d!161683 (= res!1063653 (not lt!669934))))

(declare-fun lt!669933 () Bool)

(assert (=> d!161683 (= lt!669934 lt!669933)))

(declare-datatypes ((Unit!51776 0))(
  ( (Unit!51777) )
))
(declare-fun lt!669932 () Unit!51776)

(declare-fun e!865361 () Unit!51776)

(assert (=> d!161683 (= lt!669932 e!865361)))

(declare-fun c!143347 () Bool)

(assert (=> d!161683 (= c!143347 lt!669933)))

(assert (=> d!161683 (= lt!669933 (containsKey!771 (toList!11212 lm!249) a0!49))))

(assert (=> d!161683 (= (contains!10157 lm!249 a0!49) lt!669934)))

(declare-fun b!1554132 () Bool)

(declare-fun lt!669931 () Unit!51776)

(assert (=> b!1554132 (= e!865361 lt!669931)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!513 (List!36238 (_ BitVec 64)) Unit!51776)

(assert (=> b!1554132 (= lt!669931 (lemmaContainsKeyImpliesGetValueByKeyDefined!513 (toList!11212 lm!249) a0!49))))

(declare-datatypes ((Option!824 0))(
  ( (Some!823 (v!22008 B!2236)) (None!822) )
))
(declare-fun isDefined!561 (Option!824) Bool)

(declare-fun getValueByKey!748 (List!36238 (_ BitVec 64)) Option!824)

(assert (=> b!1554132 (isDefined!561 (getValueByKey!748 (toList!11212 lm!249) a0!49))))

(declare-fun b!1554133 () Bool)

(declare-fun Unit!51780 () Unit!51776)

(assert (=> b!1554133 (= e!865361 Unit!51780)))

(declare-fun b!1554134 () Bool)

(assert (=> b!1554134 (= e!865362 (isDefined!561 (getValueByKey!748 (toList!11212 lm!249) a0!49)))))

(assert (= (and d!161683 c!143347) b!1554132))

(assert (= (and d!161683 (not c!143347)) b!1554133))

(assert (= (and d!161683 (not res!1063653)) b!1554134))

(assert (=> d!161683 m!1432587))

(declare-fun m!1432607 () Bool)

(assert (=> b!1554132 m!1432607))

(declare-fun m!1432609 () Bool)

(assert (=> b!1554132 m!1432609))

(assert (=> b!1554132 m!1432609))

(declare-fun m!1432611 () Bool)

(assert (=> b!1554132 m!1432611))

(assert (=> b!1554134 m!1432609))

(assert (=> b!1554134 m!1432609))

(assert (=> b!1554134 m!1432611))

(assert (=> start!132532 d!161683))

(declare-fun d!161689 () Bool)

(assert (=> d!161689 (= (inv!57336 lm!249) (isStrictlySorted!900 (toList!11212 lm!249)))))

(declare-fun bs!44675 () Bool)

(assert (= bs!44675 d!161689))

(assert (=> bs!44675 m!1432589))

(assert (=> start!132532 d!161689))

(declare-fun d!161691 () Bool)

(declare-fun res!1063662 () Bool)

(declare-fun e!865375 () Bool)

(assert (=> d!161691 (=> res!1063662 e!865375)))

(assert (=> d!161691 (= res!1063662 (and ((_ is Cons!36234) (toList!11212 lm!249)) (= (_1!12403 (h!37680 (toList!11212 lm!249))) a0!49)))))

(assert (=> d!161691 (= (containsKey!771 (toList!11212 lm!249) a0!49) e!865375)))

(declare-fun b!1554151 () Bool)

(declare-fun e!865376 () Bool)

(assert (=> b!1554151 (= e!865375 e!865376)))

(declare-fun res!1063663 () Bool)

(assert (=> b!1554151 (=> (not res!1063663) (not e!865376))))

(assert (=> b!1554151 (= res!1063663 (and (or (not ((_ is Cons!36234) (toList!11212 lm!249))) (bvsle (_1!12403 (h!37680 (toList!11212 lm!249))) a0!49)) ((_ is Cons!36234) (toList!11212 lm!249)) (bvslt (_1!12403 (h!37680 (toList!11212 lm!249))) a0!49)))))

(declare-fun b!1554152 () Bool)

(assert (=> b!1554152 (= e!865376 (containsKey!771 (t!50959 (toList!11212 lm!249)) a0!49))))

(assert (= (and d!161691 (not res!1063662)) b!1554151))

(assert (= (and b!1554151 res!1063663) b!1554152))

(declare-fun m!1432625 () Bool)

(assert (=> b!1554152 m!1432625))

(assert (=> b!1554077 d!161691))

(declare-fun b!1554166 () Bool)

(declare-fun e!865386 () Bool)

(declare-fun tp_is_empty!38247 () Bool)

(declare-fun tp!112176 () Bool)

(assert (=> b!1554166 (= e!865386 (and tp_is_empty!38247 tp!112176))))

(assert (=> b!1554080 (= tp!112167 e!865386)))

(assert (= (and b!1554080 ((_ is Cons!36234) (toList!11212 lm!249))) b!1554166))

(check-sat (not b!1554132) (not b!1554107) (not b!1554152) (not d!161689) (not d!161683) (not b!1554166) (not b!1554134) tp_is_empty!38247)
(check-sat)
