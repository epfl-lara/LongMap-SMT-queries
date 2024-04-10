; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1652 () Bool)

(assert start!1652)

(declare-fun res!9756 () Bool)

(declare-fun e!7034 () Bool)

(assert (=> start!1652 (=> (not res!9756) (not e!7034))))

(declare-datatypes ((B!412 0))(
  ( (B!413 (val!301 Int)) )
))
(declare-datatypes ((tuple2!402 0))(
  ( (tuple2!403 (_1!201 (_ BitVec 64)) (_2!201 B!412)) )
))
(declare-datatypes ((List!353 0))(
  ( (Nil!350) (Cons!349 (h!915 tuple2!402) (t!2740 List!353)) )
))
(declare-datatypes ((ListLongMap!383 0))(
  ( (ListLongMap!384 (toList!207 List!353)) )
))
(declare-fun lm!265 () ListLongMap!383)

(declare-fun a!527 () (_ BitVec 64))

(declare-fun contains!175 (ListLongMap!383 (_ BitVec 64)) Bool)

(assert (=> start!1652 (= res!9756 (contains!175 lm!265 a!527))))

(assert (=> start!1652 e!7034))

(declare-fun e!7033 () Bool)

(declare-fun inv!591 (ListLongMap!383) Bool)

(assert (=> start!1652 (and (inv!591 lm!265) e!7033)))

(assert (=> start!1652 true))

(declare-fun tp_is_empty!585 () Bool)

(assert (=> start!1652 tp_is_empty!585))

(declare-fun b!11817 () Bool)

(declare-fun res!9757 () Bool)

(assert (=> b!11817 (=> (not res!9757) (not e!7034))))

(declare-fun b!100 () B!412)

(declare-datatypes ((Option!39 0))(
  ( (Some!38 (v!1353 B!412)) (None!37) )
))
(declare-fun getValueByKey!33 (List!353 (_ BitVec 64)) Option!39)

(assert (=> b!11817 (= res!9757 (= (getValueByKey!33 (toList!207 lm!265) a!527) (Some!38 b!100)))))

(declare-fun b!11818 () Bool)

(declare-fun isStrictlySorted!52 (List!353) Bool)

(assert (=> b!11818 (= e!7034 (not (isStrictlySorted!52 (toList!207 lm!265))))))

(declare-fun b!11819 () Bool)

(declare-fun tp!1982 () Bool)

(assert (=> b!11819 (= e!7033 tp!1982)))

(assert (= (and start!1652 res!9756) b!11817))

(assert (= (and b!11817 res!9757) b!11818))

(assert (= start!1652 b!11819))

(declare-fun m!8245 () Bool)

(assert (=> start!1652 m!8245))

(declare-fun m!8247 () Bool)

(assert (=> start!1652 m!8247))

(declare-fun m!8249 () Bool)

(assert (=> b!11817 m!8249))

(declare-fun m!8251 () Bool)

(assert (=> b!11818 m!8251))

(check-sat (not b!11817) tp_is_empty!585 (not b!11819) (not start!1652) (not b!11818))
(check-sat)
(get-model)

(declare-fun d!1638 () Bool)

(declare-fun res!9768 () Bool)

(declare-fun e!7053 () Bool)

(assert (=> d!1638 (=> res!9768 e!7053)))

(get-info :version)

(assert (=> d!1638 (= res!9768 (or ((_ is Nil!350) (toList!207 lm!265)) ((_ is Nil!350) (t!2740 (toList!207 lm!265)))))))

(assert (=> d!1638 (= (isStrictlySorted!52 (toList!207 lm!265)) e!7053)))

(declare-fun b!11849 () Bool)

(declare-fun e!7054 () Bool)

(assert (=> b!11849 (= e!7053 e!7054)))

(declare-fun res!9769 () Bool)

(assert (=> b!11849 (=> (not res!9769) (not e!7054))))

(assert (=> b!11849 (= res!9769 (bvslt (_1!201 (h!915 (toList!207 lm!265))) (_1!201 (h!915 (t!2740 (toList!207 lm!265))))))))

(declare-fun b!11850 () Bool)

(assert (=> b!11850 (= e!7054 (isStrictlySorted!52 (t!2740 (toList!207 lm!265))))))

(assert (= (and d!1638 (not res!9768)) b!11849))

(assert (= (and b!11849 res!9769) b!11850))

(declare-fun m!8261 () Bool)

(assert (=> b!11850 m!8261))

(assert (=> b!11818 d!1638))

(declare-fun d!1643 () Bool)

(declare-fun c!1003 () Bool)

(assert (=> d!1643 (= c!1003 (and ((_ is Cons!349) (toList!207 lm!265)) (= (_1!201 (h!915 (toList!207 lm!265))) a!527)))))

(declare-fun e!7075 () Option!39)

(assert (=> d!1643 (= (getValueByKey!33 (toList!207 lm!265) a!527) e!7075)))

(declare-fun b!11879 () Bool)

(assert (=> b!11879 (= e!7075 (Some!38 (_2!201 (h!915 (toList!207 lm!265)))))))

(declare-fun b!11880 () Bool)

(declare-fun e!7076 () Option!39)

(assert (=> b!11880 (= e!7075 e!7076)))

(declare-fun c!1004 () Bool)

(assert (=> b!11880 (= c!1004 (and ((_ is Cons!349) (toList!207 lm!265)) (not (= (_1!201 (h!915 (toList!207 lm!265))) a!527))))))

(declare-fun b!11882 () Bool)

(assert (=> b!11882 (= e!7076 None!37)))

(declare-fun b!11881 () Bool)

(assert (=> b!11881 (= e!7076 (getValueByKey!33 (t!2740 (toList!207 lm!265)) a!527))))

(assert (= (and d!1643 c!1003) b!11879))

(assert (= (and d!1643 (not c!1003)) b!11880))

(assert (= (and b!11880 c!1004) b!11881))

(assert (= (and b!11880 (not c!1004)) b!11882))

(declare-fun m!8271 () Bool)

(assert (=> b!11881 m!8271))

(assert (=> b!11817 d!1643))

(declare-fun d!1653 () Bool)

(declare-fun e!7091 () Bool)

(assert (=> d!1653 e!7091))

(declare-fun res!9788 () Bool)

(assert (=> d!1653 (=> res!9788 e!7091)))

(declare-fun lt!3068 () Bool)

(assert (=> d!1653 (= res!9788 (not lt!3068))))

(declare-fun lt!3069 () Bool)

(assert (=> d!1653 (= lt!3068 lt!3069)))

(declare-datatypes ((Unit!249 0))(
  ( (Unit!250) )
))
(declare-fun lt!3070 () Unit!249)

(declare-fun e!7089 () Unit!249)

(assert (=> d!1653 (= lt!3070 e!7089)))

(declare-fun c!1011 () Bool)

(assert (=> d!1653 (= c!1011 lt!3069)))

(declare-fun containsKey!14 (List!353 (_ BitVec 64)) Bool)

(assert (=> d!1653 (= lt!3069 (containsKey!14 (toList!207 lm!265) a!527))))

(assert (=> d!1653 (= (contains!175 lm!265 a!527) lt!3068)))

(declare-fun b!11901 () Bool)

(declare-fun lt!3067 () Unit!249)

(assert (=> b!11901 (= e!7089 lt!3067)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!11 (List!353 (_ BitVec 64)) Unit!249)

(assert (=> b!11901 (= lt!3067 (lemmaContainsKeyImpliesGetValueByKeyDefined!11 (toList!207 lm!265) a!527))))

(declare-fun isDefined!12 (Option!39) Bool)

(assert (=> b!11901 (isDefined!12 (getValueByKey!33 (toList!207 lm!265) a!527))))

(declare-fun b!11902 () Bool)

(declare-fun Unit!253 () Unit!249)

(assert (=> b!11902 (= e!7089 Unit!253)))

(declare-fun b!11903 () Bool)

(assert (=> b!11903 (= e!7091 (isDefined!12 (getValueByKey!33 (toList!207 lm!265) a!527)))))

(assert (= (and d!1653 c!1011) b!11901))

(assert (= (and d!1653 (not c!1011)) b!11902))

(assert (= (and d!1653 (not res!9788)) b!11903))

(declare-fun m!8275 () Bool)

(assert (=> d!1653 m!8275))

(declare-fun m!8280 () Bool)

(assert (=> b!11901 m!8280))

(assert (=> b!11901 m!8249))

(assert (=> b!11901 m!8249))

(declare-fun m!8285 () Bool)

(assert (=> b!11901 m!8285))

(assert (=> b!11903 m!8249))

(assert (=> b!11903 m!8249))

(assert (=> b!11903 m!8285))

(assert (=> start!1652 d!1653))

(declare-fun d!1655 () Bool)

(assert (=> d!1655 (= (inv!591 lm!265) (isStrictlySorted!52 (toList!207 lm!265)))))

(declare-fun bs!453 () Bool)

(assert (= bs!453 d!1655))

(assert (=> bs!453 m!8251))

(assert (=> start!1652 d!1655))

(declare-fun b!11923 () Bool)

(declare-fun e!7103 () Bool)

(declare-fun tp!1993 () Bool)

(assert (=> b!11923 (= e!7103 (and tp_is_empty!585 tp!1993))))

(assert (=> b!11819 (= tp!1982 e!7103)))

(assert (= (and b!11819 ((_ is Cons!349) (toList!207 lm!265))) b!11923))

(check-sat (not d!1655) (not d!1653) (not b!11901) (not b!11881) (not b!11903) tp_is_empty!585 (not b!11923) (not b!11850))
(check-sat)
