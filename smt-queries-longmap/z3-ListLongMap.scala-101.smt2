; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1650 () Bool)

(assert start!1650)

(declare-fun res!9751 () Bool)

(declare-fun e!7027 () Bool)

(assert (=> start!1650 (=> (not res!9751) (not e!7027))))

(declare-datatypes ((B!410 0))(
  ( (B!411 (val!300 Int)) )
))
(declare-datatypes ((tuple2!396 0))(
  ( (tuple2!397 (_1!198 (_ BitVec 64)) (_2!198 B!410)) )
))
(declare-datatypes ((List!348 0))(
  ( (Nil!345) (Cons!344 (h!910 tuple2!396) (t!2735 List!348)) )
))
(declare-datatypes ((ListLongMap!377 0))(
  ( (ListLongMap!378 (toList!204 List!348)) )
))
(declare-fun lm!265 () ListLongMap!377)

(declare-fun a!527 () (_ BitVec 64))

(declare-fun contains!172 (ListLongMap!377 (_ BitVec 64)) Bool)

(assert (=> start!1650 (= res!9751 (contains!172 lm!265 a!527))))

(assert (=> start!1650 e!7027))

(declare-fun e!7028 () Bool)

(declare-fun inv!590 (ListLongMap!377) Bool)

(assert (=> start!1650 (and (inv!590 lm!265) e!7028)))

(assert (=> start!1650 true))

(declare-fun tp_is_empty!583 () Bool)

(assert (=> start!1650 tp_is_empty!583))

(declare-fun b!11808 () Bool)

(declare-fun res!9750 () Bool)

(assert (=> b!11808 (=> (not res!9750) (not e!7027))))

(declare-fun b!100 () B!410)

(declare-datatypes ((Option!38 0))(
  ( (Some!37 (v!1352 B!410)) (None!36) )
))
(declare-fun getValueByKey!32 (List!348 (_ BitVec 64)) Option!38)

(assert (=> b!11808 (= res!9750 (= (getValueByKey!32 (toList!204 lm!265) a!527) (Some!37 b!100)))))

(declare-fun b!11809 () Bool)

(declare-fun isStrictlySorted!45 (List!348) Bool)

(assert (=> b!11809 (= e!7027 (not (isStrictlySorted!45 (toList!204 lm!265))))))

(declare-fun b!11810 () Bool)

(declare-fun tp!1979 () Bool)

(assert (=> b!11810 (= e!7028 tp!1979)))

(assert (= (and start!1650 res!9751) b!11808))

(assert (= (and b!11808 res!9750) b!11809))

(assert (= start!1650 b!11810))

(declare-fun m!8233 () Bool)

(assert (=> start!1650 m!8233))

(declare-fun m!8235 () Bool)

(assert (=> start!1650 m!8235))

(declare-fun m!8237 () Bool)

(assert (=> b!11808 m!8237))

(declare-fun m!8239 () Bool)

(assert (=> b!11809 m!8239))

(check-sat (not b!11808) (not start!1650) (not b!11810) tp_is_empty!583 (not b!11809))
(check-sat)
(get-model)

(declare-fun d!1637 () Bool)

(declare-fun e!7050 () Bool)

(assert (=> d!1637 e!7050))

(declare-fun res!9769 () Bool)

(assert (=> d!1637 (=> res!9769 e!7050)))

(declare-fun lt!3059 () Bool)

(assert (=> d!1637 (= res!9769 (not lt!3059))))

(declare-fun lt!3064 () Bool)

(assert (=> d!1637 (= lt!3059 lt!3064)))

(declare-datatypes ((Unit!259 0))(
  ( (Unit!260) )
))
(declare-fun lt!3061 () Unit!259)

(declare-fun e!7052 () Unit!259)

(assert (=> d!1637 (= lt!3061 e!7052)))

(declare-fun c!991 () Bool)

(assert (=> d!1637 (= c!991 lt!3064)))

(declare-fun containsKey!14 (List!348 (_ BitVec 64)) Bool)

(assert (=> d!1637 (= lt!3064 (containsKey!14 (toList!204 lm!265) a!527))))

(assert (=> d!1637 (= (contains!172 lm!265 a!527) lt!3059)))

(declare-fun b!11842 () Bool)

(declare-fun lt!3060 () Unit!259)

(assert (=> b!11842 (= e!7052 lt!3060)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!11 (List!348 (_ BitVec 64)) Unit!259)

(assert (=> b!11842 (= lt!3060 (lemmaContainsKeyImpliesGetValueByKeyDefined!11 (toList!204 lm!265) a!527))))

(declare-fun isDefined!12 (Option!38) Bool)

(assert (=> b!11842 (isDefined!12 (getValueByKey!32 (toList!204 lm!265) a!527))))

(declare-fun b!11844 () Bool)

(declare-fun Unit!263 () Unit!259)

(assert (=> b!11844 (= e!7052 Unit!263)))

(declare-fun b!11846 () Bool)

(assert (=> b!11846 (= e!7050 (isDefined!12 (getValueByKey!32 (toList!204 lm!265) a!527)))))

(assert (= (and d!1637 c!991) b!11842))

(assert (= (and d!1637 (not c!991)) b!11844))

(assert (= (and d!1637 (not res!9769)) b!11846))

(declare-fun m!8259 () Bool)

(assert (=> d!1637 m!8259))

(declare-fun m!8262 () Bool)

(assert (=> b!11842 m!8262))

(assert (=> b!11842 m!8237))

(assert (=> b!11842 m!8237))

(declare-fun m!8267 () Bool)

(assert (=> b!11842 m!8267))

(assert (=> b!11846 m!8237))

(assert (=> b!11846 m!8237))

(assert (=> b!11846 m!8267))

(assert (=> start!1650 d!1637))

(declare-fun d!1644 () Bool)

(assert (=> d!1644 (= (inv!590 lm!265) (isStrictlySorted!45 (toList!204 lm!265)))))

(declare-fun bs!454 () Bool)

(assert (= bs!454 d!1644))

(assert (=> bs!454 m!8239))

(assert (=> start!1650 d!1644))

(declare-fun d!1649 () Bool)

(declare-fun c!1001 () Bool)

(get-info :version)

(assert (=> d!1649 (= c!1001 (and ((_ is Cons!344) (toList!204 lm!265)) (= (_1!198 (h!910 (toList!204 lm!265))) a!527)))))

(declare-fun e!7061 () Option!38)

(assert (=> d!1649 (= (getValueByKey!32 (toList!204 lm!265) a!527) e!7061)))

(declare-fun b!11869 () Bool)

(declare-fun e!7063 () Option!38)

(assert (=> b!11869 (= e!7063 None!36)))

(declare-fun b!11863 () Bool)

(assert (=> b!11863 (= e!7061 (Some!37 (_2!198 (h!910 (toList!204 lm!265)))))))

(declare-fun b!11865 () Bool)

(assert (=> b!11865 (= e!7061 e!7063)))

(declare-fun c!1003 () Bool)

(assert (=> b!11865 (= c!1003 (and ((_ is Cons!344) (toList!204 lm!265)) (not (= (_1!198 (h!910 (toList!204 lm!265))) a!527))))))

(declare-fun b!11867 () Bool)

(assert (=> b!11867 (= e!7063 (getValueByKey!32 (t!2735 (toList!204 lm!265)) a!527))))

(assert (= (and d!1649 c!1001) b!11863))

(assert (= (and d!1649 (not c!1001)) b!11865))

(assert (= (and b!11865 c!1003) b!11867))

(assert (= (and b!11865 (not c!1003)) b!11869))

(declare-fun m!8271 () Bool)

(assert (=> b!11867 m!8271))

(assert (=> b!11808 d!1649))

(declare-fun d!1653 () Bool)

(declare-fun res!9782 () Bool)

(declare-fun e!7079 () Bool)

(assert (=> d!1653 (=> res!9782 e!7079)))

(assert (=> d!1653 (= res!9782 (or ((_ is Nil!345) (toList!204 lm!265)) ((_ is Nil!345) (t!2735 (toList!204 lm!265)))))))

(assert (=> d!1653 (= (isStrictlySorted!45 (toList!204 lm!265)) e!7079)))

(declare-fun b!11887 () Bool)

(declare-fun e!7080 () Bool)

(assert (=> b!11887 (= e!7079 e!7080)))

(declare-fun res!9783 () Bool)

(assert (=> b!11887 (=> (not res!9783) (not e!7080))))

(assert (=> b!11887 (= res!9783 (bvslt (_1!198 (h!910 (toList!204 lm!265))) (_1!198 (h!910 (t!2735 (toList!204 lm!265))))))))

(declare-fun b!11888 () Bool)

(assert (=> b!11888 (= e!7080 (isStrictlySorted!45 (t!2735 (toList!204 lm!265))))))

(assert (= (and d!1653 (not res!9782)) b!11887))

(assert (= (and b!11887 res!9783) b!11888))

(declare-fun m!8275 () Bool)

(assert (=> b!11888 m!8275))

(assert (=> b!11809 d!1653))

(declare-fun b!11901 () Bool)

(declare-fun e!7088 () Bool)

(declare-fun tp!1991 () Bool)

(assert (=> b!11901 (= e!7088 (and tp_is_empty!583 tp!1991))))

(assert (=> b!11810 (= tp!1979 e!7088)))

(assert (= (and b!11810 ((_ is Cons!344) (toList!204 lm!265))) b!11901))

(check-sat (not b!11846) (not d!1637) (not b!11842) (not d!1644) tp_is_empty!583 (not b!11867) (not b!11888) (not b!11901))
(check-sat)
