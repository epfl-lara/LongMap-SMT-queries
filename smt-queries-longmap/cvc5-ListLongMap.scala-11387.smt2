; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132398 () Bool)

(assert start!132398)

(declare-fun res!1063252 () Bool)

(declare-fun e!864884 () Bool)

(assert (=> start!132398 (=> (not res!1063252) (not e!864884))))

(declare-datatypes ((B!2198 0))(
  ( (B!2199 (val!19185 Int)) )
))
(declare-datatypes ((tuple2!24746 0))(
  ( (tuple2!24747 (_1!12384 (_ BitVec 64)) (_2!12384 B!2198)) )
))
(declare-datatypes ((List!36219 0))(
  ( (Nil!36216) (Cons!36215 (h!37661 tuple2!24746) (t!50940 List!36219)) )
))
(declare-datatypes ((ListLongMap!22355 0))(
  ( (ListLongMap!22356 (toList!11193 List!36219)) )
))
(declare-fun lm!249 () ListLongMap!22355)

(declare-fun a0!49 () (_ BitVec 64))

(declare-fun contains!10135 (ListLongMap!22355 (_ BitVec 64)) Bool)

(assert (=> start!132398 (= res!1063252 (contains!10135 lm!249 a0!49))))

(assert (=> start!132398 e!864884))

(declare-fun e!864883 () Bool)

(declare-fun inv!57287 (ListLongMap!22355) Bool)

(assert (=> start!132398 (and (inv!57287 lm!249) e!864883)))

(assert (=> start!132398 true))

(declare-fun b!1553436 () Bool)

(declare-fun res!1063251 () Bool)

(assert (=> b!1553436 (=> (not res!1063251) (not e!864884))))

(declare-fun a!523 () (_ BitVec 64))

(assert (=> b!1553436 (= res!1063251 (not (= a0!49 a!523)))))

(declare-fun b!1553437 () Bool)

(declare-fun isStrictlySorted!888 (List!36219) Bool)

(assert (=> b!1553437 (= e!864884 (not (isStrictlySorted!888 (toList!11193 lm!249))))))

(declare-fun b!1553438 () Bool)

(declare-fun tp!112083 () Bool)

(assert (=> b!1553438 (= e!864883 tp!112083)))

(assert (= (and start!132398 res!1063252) b!1553436))

(assert (= (and b!1553436 res!1063251) b!1553437))

(assert (= start!132398 b!1553438))

(declare-fun m!1432125 () Bool)

(assert (=> start!132398 m!1432125))

(declare-fun m!1432127 () Bool)

(assert (=> start!132398 m!1432127))

(declare-fun m!1432129 () Bool)

(assert (=> b!1553437 m!1432129))

(push 1)

(assert (not start!132398))

(assert (not b!1553437))

(assert (not b!1553438))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!161553 () Bool)

(declare-fun e!864918 () Bool)

(assert (=> d!161553 e!864918))

(declare-fun res!1063278 () Bool)

(assert (=> d!161553 (=> res!1063278 e!864918)))

(declare-fun lt!669689 () Bool)

(assert (=> d!161553 (= res!1063278 (not lt!669689))))

(declare-fun lt!669688 () Bool)

(assert (=> d!161553 (= lt!669689 lt!669688)))

(declare-datatypes ((Unit!51736 0))(
  ( (Unit!51737) )
))
(declare-fun lt!669691 () Unit!51736)

(declare-fun e!864917 () Unit!51736)

(assert (=> d!161553 (= lt!669691 e!864917)))

(declare-fun c!143260 () Bool)

(assert (=> d!161553 (= c!143260 lt!669688)))

(declare-fun containsKey!756 (List!36219 (_ BitVec 64)) Bool)

(assert (=> d!161553 (= lt!669688 (containsKey!756 (toList!11193 lm!249) a0!49))))

(assert (=> d!161553 (= (contains!10135 lm!249 a0!49) lt!669689)))

(declare-fun b!1553484 () Bool)

(declare-fun lt!669690 () Unit!51736)

(assert (=> b!1553484 (= e!864917 lt!669690)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!502 (List!36219 (_ BitVec 64)) Unit!51736)

(assert (=> b!1553484 (= lt!669690 (lemmaContainsKeyImpliesGetValueByKeyDefined!502 (toList!11193 lm!249) a0!49))))

(declare-datatypes ((Option!810 0))(
  ( (Some!809 (v!21994 B!2198)) (None!808) )
))
(declare-fun isDefined!550 (Option!810) Bool)

(declare-fun getValueByKey!734 (List!36219 (_ BitVec 64)) Option!810)

(assert (=> b!1553484 (isDefined!550 (getValueByKey!734 (toList!11193 lm!249) a0!49))))

(declare-fun b!1553485 () Bool)

(declare-fun Unit!51741 () Unit!51736)

(assert (=> b!1553485 (= e!864917 Unit!51741)))

(declare-fun b!1553486 () Bool)

(assert (=> b!1553486 (= e!864918 (isDefined!550 (getValueByKey!734 (toList!11193 lm!249) a0!49)))))

(assert (= (and d!161553 c!143260) b!1553484))

(assert (= (and d!161553 (not c!143260)) b!1553485))

(assert (= (and d!161553 (not res!1063278)) b!1553486))

(declare-fun m!1432153 () Bool)

(assert (=> d!161553 m!1432153))

(declare-fun m!1432155 () Bool)

(assert (=> b!1553484 m!1432155))

(declare-fun m!1432157 () Bool)

(assert (=> b!1553484 m!1432157))

(assert (=> b!1553484 m!1432157))

(declare-fun m!1432159 () Bool)

(assert (=> b!1553484 m!1432159))

(assert (=> b!1553486 m!1432157))

(assert (=> b!1553486 m!1432157))

(assert (=> b!1553486 m!1432159))

(assert (=> start!132398 d!161553))

(declare-fun d!161561 () Bool)

(assert (=> d!161561 (= (inv!57287 lm!249) (isStrictlySorted!888 (toList!11193 lm!249)))))

(declare-fun bs!44646 () Bool)

(assert (= bs!44646 d!161561))

(assert (=> bs!44646 m!1432129))

(assert (=> start!132398 d!161561))

(declare-fun d!161563 () Bool)

(declare-fun res!1063290 () Bool)

(declare-fun e!864937 () Bool)

(assert (=> d!161563 (=> res!1063290 e!864937)))

(assert (=> d!161563 (= res!1063290 (or (is-Nil!36216 (toList!11193 lm!249)) (is-Nil!36216 (t!50940 (toList!11193 lm!249)))))))

(assert (=> d!161563 (= (isStrictlySorted!888 (toList!11193 lm!249)) e!864937)))

(declare-fun b!1553510 () Bool)

(declare-fun e!864938 () Bool)

(assert (=> b!1553510 (= e!864937 e!864938)))

(declare-fun res!1063291 () Bool)

(assert (=> b!1553510 (=> (not res!1063291) (not e!864938))))

(assert (=> b!1553510 (= res!1063291 (bvslt (_1!12384 (h!37661 (toList!11193 lm!249))) (_1!12384 (h!37661 (t!50940 (toList!11193 lm!249))))))))

(declare-fun b!1553511 () Bool)

(assert (=> b!1553511 (= e!864938 (isStrictlySorted!888 (t!50940 (toList!11193 lm!249))))))

(assert (= (and d!161563 (not res!1063290)) b!1553510))

(assert (= (and b!1553510 res!1063291) b!1553511))

(declare-fun m!1432171 () Bool)

(assert (=> b!1553511 m!1432171))

(assert (=> b!1553437 d!161563))

(declare-fun b!1553516 () Bool)

(declare-fun e!864941 () Bool)

(declare-fun tp_is_empty!38219 () Bool)

(declare-fun tp!112098 () Bool)

(assert (=> b!1553516 (= e!864941 (and tp_is_empty!38219 tp!112098))))

(assert (=> b!1553438 (= tp!112083 e!864941)))

