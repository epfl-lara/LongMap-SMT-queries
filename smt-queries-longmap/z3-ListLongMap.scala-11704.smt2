; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136810 () Bool)

(assert start!136810)

(declare-fun b!1578541 () Bool)

(declare-fun res!1078654 () Bool)

(declare-fun e!880499 () Bool)

(assert (=> b!1578541 (=> res!1078654 e!880499)))

(declare-datatypes ((B!2564 0))(
  ( (B!2565 (val!19644 Int)) )
))
(declare-datatypes ((tuple2!25458 0))(
  ( (tuple2!25459 (_1!12740 (_ BitVec 64)) (_2!12740 B!2564)) )
))
(declare-datatypes ((List!36805 0))(
  ( (Nil!36802) (Cons!36801 (h!38345 tuple2!25458) (t!51711 List!36805)) )
))
(declare-datatypes ((ListLongMap!22797 0))(
  ( (ListLongMap!22798 (toList!11414 List!36805)) )
))
(declare-fun lm!251 () ListLongMap!22797)

(declare-fun a0!51 () (_ BitVec 64))

(declare-fun containsKey!872 (List!36805 (_ BitVec 64)) Bool)

(assert (=> b!1578541 (= res!1078654 (containsKey!872 (toList!11414 lm!251) a0!51))))

(declare-fun res!1078653 () Bool)

(declare-fun e!880497 () Bool)

(assert (=> start!136810 (=> (not res!1078653) (not e!880497))))

(declare-fun contains!10391 (ListLongMap!22797 (_ BitVec 64)) Bool)

(assert (=> start!136810 (= res!1078653 (not (contains!10391 lm!251 a0!51)))))

(assert (=> start!136810 e!880497))

(declare-fun e!880498 () Bool)

(declare-fun inv!58920 (ListLongMap!22797) Bool)

(assert (=> start!136810 (and (inv!58920 lm!251) e!880498)))

(assert (=> start!136810 true))

(declare-fun b!1578542 () Bool)

(declare-fun tp!114262 () Bool)

(assert (=> b!1578542 (= e!880498 tp!114262)))

(declare-fun b!1578543 () Bool)

(assert (=> b!1578543 (= e!880497 e!880499)))

(declare-fun res!1078656 () Bool)

(assert (=> b!1578543 (=> res!1078656 e!880499)))

(declare-fun isStrictlySorted!1023 (List!36805) Bool)

(assert (=> b!1578543 (= res!1078656 (not (isStrictlySorted!1023 (toList!11414 lm!251))))))

(declare-fun b!1578544 () Bool)

(declare-fun res!1078655 () Bool)

(assert (=> b!1578544 (=> (not res!1078655) (not e!880497))))

(declare-fun a!525 () (_ BitVec 64))

(assert (=> b!1578544 (= res!1078655 (not (= a!525 a0!51)))))

(declare-fun b!1578545 () Bool)

(assert (=> b!1578545 (= e!880499 (= a0!51 a!525))))

(assert (= (and start!136810 res!1078653) b!1578544))

(assert (= (and b!1578544 res!1078655) b!1578543))

(assert (= (and b!1578543 (not res!1078656)) b!1578541))

(assert (= (and b!1578541 (not res!1078654)) b!1578545))

(assert (= start!136810 b!1578542))

(declare-fun m!1450005 () Bool)

(assert (=> b!1578541 m!1450005))

(declare-fun m!1450007 () Bool)

(assert (=> start!136810 m!1450007))

(declare-fun m!1450009 () Bool)

(assert (=> start!136810 m!1450009))

(declare-fun m!1450011 () Bool)

(assert (=> b!1578543 m!1450011))

(check-sat (not b!1578541) (not b!1578543) (not start!136810) (not b!1578542))
(check-sat)
(get-model)

(declare-fun d!165917 () Bool)

(declare-fun res!1078689 () Bool)

(declare-fun e!880526 () Bool)

(assert (=> d!165917 (=> res!1078689 e!880526)))

(get-info :version)

(assert (=> d!165917 (= res!1078689 (and ((_ is Cons!36801) (toList!11414 lm!251)) (= (_1!12740 (h!38345 (toList!11414 lm!251))) a0!51)))))

(assert (=> d!165917 (= (containsKey!872 (toList!11414 lm!251) a0!51) e!880526)))

(declare-fun b!1578584 () Bool)

(declare-fun e!880527 () Bool)

(assert (=> b!1578584 (= e!880526 e!880527)))

(declare-fun res!1078690 () Bool)

(assert (=> b!1578584 (=> (not res!1078690) (not e!880527))))

(assert (=> b!1578584 (= res!1078690 (and (or (not ((_ is Cons!36801) (toList!11414 lm!251))) (bvsle (_1!12740 (h!38345 (toList!11414 lm!251))) a0!51)) ((_ is Cons!36801) (toList!11414 lm!251)) (bvslt (_1!12740 (h!38345 (toList!11414 lm!251))) a0!51)))))

(declare-fun b!1578585 () Bool)

(assert (=> b!1578585 (= e!880527 (containsKey!872 (t!51711 (toList!11414 lm!251)) a0!51))))

(assert (= (and d!165917 (not res!1078689)) b!1578584))

(assert (= (and b!1578584 res!1078690) b!1578585))

(declare-fun m!1450029 () Bool)

(assert (=> b!1578585 m!1450029))

(assert (=> b!1578541 d!165917))

(declare-fun d!165923 () Bool)

(declare-fun res!1078703 () Bool)

(declare-fun e!880540 () Bool)

(assert (=> d!165923 (=> res!1078703 e!880540)))

(assert (=> d!165923 (= res!1078703 (or ((_ is Nil!36802) (toList!11414 lm!251)) ((_ is Nil!36802) (t!51711 (toList!11414 lm!251)))))))

(assert (=> d!165923 (= (isStrictlySorted!1023 (toList!11414 lm!251)) e!880540)))

(declare-fun b!1578598 () Bool)

(declare-fun e!880541 () Bool)

(assert (=> b!1578598 (= e!880540 e!880541)))

(declare-fun res!1078704 () Bool)

(assert (=> b!1578598 (=> (not res!1078704) (not e!880541))))

(assert (=> b!1578598 (= res!1078704 (bvslt (_1!12740 (h!38345 (toList!11414 lm!251))) (_1!12740 (h!38345 (t!51711 (toList!11414 lm!251))))))))

(declare-fun b!1578599 () Bool)

(assert (=> b!1578599 (= e!880541 (isStrictlySorted!1023 (t!51711 (toList!11414 lm!251))))))

(assert (= (and d!165923 (not res!1078703)) b!1578598))

(assert (= (and b!1578598 res!1078704) b!1578599))

(declare-fun m!1450035 () Bool)

(assert (=> b!1578599 m!1450035))

(assert (=> b!1578543 d!165923))

(declare-fun d!165929 () Bool)

(declare-fun e!880561 () Bool)

(assert (=> d!165929 e!880561))

(declare-fun res!1078716 () Bool)

(assert (=> d!165929 (=> res!1078716 e!880561)))

(declare-fun lt!676075 () Bool)

(assert (=> d!165929 (= res!1078716 (not lt!676075))))

(declare-fun lt!676076 () Bool)

(assert (=> d!165929 (= lt!676075 lt!676076)))

(declare-datatypes ((Unit!52009 0))(
  ( (Unit!52010) )
))
(declare-fun lt!676077 () Unit!52009)

(declare-fun e!880560 () Unit!52009)

(assert (=> d!165929 (= lt!676077 e!880560)))

(declare-fun c!146232 () Bool)

(assert (=> d!165929 (= c!146232 lt!676076)))

(assert (=> d!165929 (= lt!676076 (containsKey!872 (toList!11414 lm!251) a0!51))))

(assert (=> d!165929 (= (contains!10391 lm!251 a0!51) lt!676075)))

(declare-fun b!1578625 () Bool)

(declare-fun lt!676074 () Unit!52009)

(assert (=> b!1578625 (= e!880560 lt!676074)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!538 (List!36805 (_ BitVec 64)) Unit!52009)

(assert (=> b!1578625 (= lt!676074 (lemmaContainsKeyImpliesGetValueByKeyDefined!538 (toList!11414 lm!251) a0!51))))

(declare-datatypes ((Option!877 0))(
  ( (Some!876 (v!22359 B!2564)) (None!875) )
))
(declare-fun isDefined!590 (Option!877) Bool)

(declare-fun getValueByKey!802 (List!36805 (_ BitVec 64)) Option!877)

(assert (=> b!1578625 (isDefined!590 (getValueByKey!802 (toList!11414 lm!251) a0!51))))

(declare-fun b!1578626 () Bool)

(declare-fun Unit!52013 () Unit!52009)

(assert (=> b!1578626 (= e!880560 Unit!52013)))

(declare-fun b!1578627 () Bool)

(assert (=> b!1578627 (= e!880561 (isDefined!590 (getValueByKey!802 (toList!11414 lm!251) a0!51)))))

(assert (= (and d!165929 c!146232) b!1578625))

(assert (= (and d!165929 (not c!146232)) b!1578626))

(assert (= (and d!165929 (not res!1078716)) b!1578627))

(assert (=> d!165929 m!1450005))

(declare-fun m!1450045 () Bool)

(assert (=> b!1578625 m!1450045))

(declare-fun m!1450047 () Bool)

(assert (=> b!1578625 m!1450047))

(assert (=> b!1578625 m!1450047))

(declare-fun m!1450049 () Bool)

(assert (=> b!1578625 m!1450049))

(assert (=> b!1578627 m!1450047))

(assert (=> b!1578627 m!1450047))

(assert (=> b!1578627 m!1450049))

(assert (=> start!136810 d!165929))

(declare-fun d!165937 () Bool)

(assert (=> d!165937 (= (inv!58920 lm!251) (isStrictlySorted!1023 (toList!11414 lm!251)))))

(declare-fun bs!45676 () Bool)

(assert (= bs!45676 d!165937))

(assert (=> bs!45676 m!1450011))

(assert (=> start!136810 d!165937))

(declare-fun b!1578640 () Bool)

(declare-fun e!880572 () Bool)

(declare-fun tp_is_empty!39109 () Bool)

(declare-fun tp!114271 () Bool)

(assert (=> b!1578640 (= e!880572 (and tp_is_empty!39109 tp!114271))))

(assert (=> b!1578542 (= tp!114262 e!880572)))

(assert (= (and b!1578542 ((_ is Cons!36801) (toList!11414 lm!251))) b!1578640))

(check-sat tp_is_empty!39109 (not d!165929) (not b!1578640) (not d!165937) (not b!1578625) (not b!1578585) (not b!1578599) (not b!1578627))
(check-sat)
