; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1654 () Bool)

(assert start!1654)

(declare-fun res!9762 () Bool)

(declare-fun e!7039 () Bool)

(assert (=> start!1654 (=> (not res!9762) (not e!7039))))

(declare-datatypes ((B!414 0))(
  ( (B!415 (val!302 Int)) )
))
(declare-datatypes ((tuple2!400 0))(
  ( (tuple2!401 (_1!200 (_ BitVec 64)) (_2!200 B!414)) )
))
(declare-datatypes ((List!350 0))(
  ( (Nil!347) (Cons!346 (h!912 tuple2!400) (t!2737 List!350)) )
))
(declare-datatypes ((ListLongMap!381 0))(
  ( (ListLongMap!382 (toList!206 List!350)) )
))
(declare-fun lm!265 () ListLongMap!381)

(declare-fun a!527 () (_ BitVec 64))

(declare-fun contains!174 (ListLongMap!381 (_ BitVec 64)) Bool)

(assert (=> start!1654 (= res!9762 (contains!174 lm!265 a!527))))

(assert (=> start!1654 e!7039))

(declare-fun e!7040 () Bool)

(declare-fun inv!592 (ListLongMap!381) Bool)

(assert (=> start!1654 (and (inv!592 lm!265) e!7040)))

(assert (=> start!1654 true))

(declare-fun tp_is_empty!587 () Bool)

(assert (=> start!1654 tp_is_empty!587))

(declare-fun b!11826 () Bool)

(declare-fun res!9763 () Bool)

(assert (=> b!11826 (=> (not res!9763) (not e!7039))))

(declare-fun b!100 () B!414)

(declare-datatypes ((Option!40 0))(
  ( (Some!39 (v!1354 B!414)) (None!38) )
))
(declare-fun getValueByKey!34 (List!350 (_ BitVec 64)) Option!40)

(assert (=> b!11826 (= res!9763 (= (getValueByKey!34 (toList!206 lm!265) a!527) (Some!39 b!100)))))

(declare-fun b!11827 () Bool)

(declare-fun isStrictlySorted!50 (List!350) Bool)

(assert (=> b!11827 (= e!7039 (not (isStrictlySorted!50 (toList!206 lm!265))))))

(declare-fun b!11828 () Bool)

(declare-fun tp!1985 () Bool)

(assert (=> b!11828 (= e!7040 tp!1985)))

(assert (= (and start!1654 res!9762) b!11826))

(assert (= (and b!11826 res!9763) b!11827))

(assert (= start!1654 b!11828))

(declare-fun m!8253 () Bool)

(assert (=> start!1654 m!8253))

(declare-fun m!8255 () Bool)

(assert (=> start!1654 m!8255))

(declare-fun m!8257 () Bool)

(assert (=> b!11826 m!8257))

(declare-fun m!8259 () Bool)

(assert (=> b!11827 m!8259))

(push 1)

(assert tp_is_empty!587)

(assert (not start!1654))

(assert (not b!11826))

(assert (not b!11828))

(assert (not b!11827))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1637 () Bool)

(declare-fun res!9768 () Bool)

(declare-fun e!7045 () Bool)

(assert (=> d!1637 (=> res!9768 e!7045)))

(assert (=> d!1637 (= res!9768 (or (is-Nil!347 (toList!206 lm!265)) (is-Nil!347 (t!2737 (toList!206 lm!265)))))))

(assert (=> d!1637 (= (isStrictlySorted!50 (toList!206 lm!265)) e!7045)))

(declare-fun b!11833 () Bool)

(declare-fun e!7046 () Bool)

(assert (=> b!11833 (= e!7045 e!7046)))

(declare-fun res!9769 () Bool)

(assert (=> b!11833 (=> (not res!9769) (not e!7046))))

(assert (=> b!11833 (= res!9769 (bvslt (_1!200 (h!912 (toList!206 lm!265))) (_1!200 (h!912 (t!2737 (toList!206 lm!265))))))))

(declare-fun b!11834 () Bool)

(assert (=> b!11834 (= e!7046 (isStrictlySorted!50 (t!2737 (toList!206 lm!265))))))

(assert (= (and d!1637 (not res!9768)) b!11833))

(assert (= (and b!11833 res!9769) b!11834))

(declare-fun m!8261 () Bool)

(assert (=> b!11834 m!8261))

(assert (=> b!11827 d!1637))

(declare-fun d!1643 () Bool)

(declare-fun e!7062 () Bool)

(assert (=> d!1643 e!7062))

(declare-fun res!9780 () Bool)

(assert (=> d!1643 (=> res!9780 e!7062)))

(declare-fun lt!3061 () Bool)

(assert (=> d!1643 (= res!9780 (not lt!3061))))

(declare-fun lt!3062 () Bool)

(assert (=> d!1643 (= lt!3061 lt!3062)))

(declare-datatypes ((Unit!259 0))(
  ( (Unit!260) )
))
(declare-fun lt!3060 () Unit!259)

(declare-fun e!7061 () Unit!259)

(assert (=> d!1643 (= lt!3060 e!7061)))

(declare-fun c!991 () Bool)

(assert (=> d!1643 (= c!991 lt!3062)))

(declare-fun containsKey!14 (List!350 (_ BitVec 64)) Bool)

(assert (=> d!1643 (= lt!3062 (containsKey!14 (toList!206 lm!265) a!527))))

(assert (=> d!1643 (= (contains!174 lm!265 a!527) lt!3061)))

(declare-fun b!11853 () Bool)

(declare-fun lt!3059 () Unit!259)

(assert (=> b!11853 (= e!7061 lt!3059)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!11 (List!350 (_ BitVec 64)) Unit!259)

(assert (=> b!11853 (= lt!3059 (lemmaContainsKeyImpliesGetValueByKeyDefined!11 (toList!206 lm!265) a!527))))

(declare-fun isDefined!12 (Option!40) Bool)

(assert (=> b!11853 (isDefined!12 (getValueByKey!34 (toList!206 lm!265) a!527))))

(declare-fun b!11854 () Bool)

(declare-fun Unit!261 () Unit!259)

(assert (=> b!11854 (= e!7061 Unit!261)))

(declare-fun b!11855 () Bool)

(assert (=> b!11855 (= e!7062 (isDefined!12 (getValueByKey!34 (toList!206 lm!265) a!527)))))

(assert (= (and d!1643 c!991) b!11853))

(assert (= (and d!1643 (not c!991)) b!11854))

(assert (= (and d!1643 (not res!9780)) b!11855))

(declare-fun m!8265 () Bool)

(assert (=> d!1643 m!8265))

(declare-fun m!8267 () Bool)

(assert (=> b!11853 m!8267))

(assert (=> b!11853 m!8257))

(assert (=> b!11853 m!8257))

(declare-fun m!8269 () Bool)

(assert (=> b!11853 m!8269))

(assert (=> b!11855 m!8257))

(assert (=> b!11855 m!8257))

(assert (=> b!11855 m!8269))

(assert (=> start!1654 d!1643))

(declare-fun d!1647 () Bool)

(assert (=> d!1647 (= (inv!592 lm!265) (isStrictlySorted!50 (toList!206 lm!265)))))

(declare-fun bs!453 () Bool)

(assert (= bs!453 d!1647))

(assert (=> bs!453 m!8259))

(assert (=> start!1654 d!1647))

(declare-fun b!11876 () Bool)

(declare-fun e!7074 () Option!40)

(assert (=> b!11876 (= e!7074 None!38)))

(declare-fun d!1649 () Bool)

(declare-fun c!999 () Bool)

(assert (=> d!1649 (= c!999 (and (is-Cons!346 (toList!206 lm!265)) (= (_1!200 (h!912 (toList!206 lm!265))) a!527)))))

(declare-fun e!7073 () Option!40)

(assert (=> d!1649 (= (getValueByKey!34 (toList!206 lm!265) a!527) e!7073)))

(declare-fun b!11874 () Bool)

(assert (=> b!11874 (= e!7073 e!7074)))

(declare-fun c!1000 () Bool)

(assert (=> b!11874 (= c!1000 (and (is-Cons!346 (toList!206 lm!265)) (not (= (_1!200 (h!912 (toList!206 lm!265))) a!527))))))

(declare-fun b!11873 () Bool)

(assert (=> b!11873 (= e!7073 (Some!39 (_2!200 (h!912 (toList!206 lm!265)))))))

(declare-fun b!11875 () Bool)

(assert (=> b!11875 (= e!7074 (getValueByKey!34 (t!2737 (toList!206 lm!265)) a!527))))

(assert (= (and d!1649 c!999) b!11873))

(assert (= (and d!1649 (not c!999)) b!11874))

(assert (= (and b!11874 c!1000) b!11875))

(assert (= (and b!11874 (not c!1000)) b!11876))

(declare-fun m!8277 () Bool)

(assert (=> b!11875 m!8277))

(assert (=> b!11826 d!1649))

(declare-fun b!11885 () Bool)

(declare-fun e!7081 () Bool)

(declare-fun tp!1988 () Bool)

(assert (=> b!11885 (= e!7081 (and tp_is_empty!587 tp!1988))))

(assert (=> b!11828 (= tp!1985 e!7081)))

(assert (= (and b!11828 (is-Cons!346 (toList!206 lm!265))) b!11885))

(push 1)

(assert (not b!11875))

(assert tp_is_empty!587)

(assert (not b!11853))

(assert (not b!11834))

(assert (not b!11855))

(assert (not d!1643))

(assert (not b!11885))

(assert (not d!1647))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

