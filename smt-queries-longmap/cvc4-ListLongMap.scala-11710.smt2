; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137016 () Bool)

(assert start!137016)

(declare-fun res!1079178 () Bool)

(declare-fun e!881221 () Bool)

(assert (=> start!137016 (=> (not res!1079178) (not e!881221))))

(declare-datatypes ((B!2604 0))(
  ( (B!2605 (val!19664 Int)) )
))
(declare-datatypes ((tuple2!25430 0))(
  ( (tuple2!25431 (_1!12726 (_ BitVec 64)) (_2!12726 B!2604)) )
))
(declare-datatypes ((List!36784 0))(
  ( (Nil!36781) (Cons!36780 (h!38323 tuple2!25430) (t!51698 List!36784)) )
))
(declare-fun lt!676575 () List!36784)

(declare-fun keyValue!4 () tuple2!25430)

(declare-datatypes ((ListLongMap!22769 0))(
  ( (ListLongMap!22770 (toList!11400 List!36784)) )
))
(declare-fun contains!10458 (ListLongMap!22769 (_ BitVec 64)) Bool)

(assert (=> start!137016 (= res!1079178 (contains!10458 (ListLongMap!22770 lt!676575) (_1!12726 keyValue!4)))))

(declare-datatypes ((Option!886 0))(
  ( (Some!885 (v!22377 B!2604)) (None!884) )
))
(declare-fun getValueByKey!810 (List!36784 (_ BitVec 64)) Option!886)

(assert (=> start!137016 (= (getValueByKey!810 lt!676575 (_1!12726 keyValue!4)) (Some!885 (_2!12726 keyValue!4)))))

(declare-datatypes ((Unit!52229 0))(
  ( (Unit!52230) )
))
(declare-fun lt!676576 () Unit!52229)

(declare-fun lemmaContainsTupThenGetReturnValue!396 (List!36784 (_ BitVec 64) B!2604) Unit!52229)

(assert (=> start!137016 (= lt!676576 (lemmaContainsTupThenGetReturnValue!396 lt!676575 (_1!12726 keyValue!4) (_2!12726 keyValue!4)))))

(declare-fun thiss!201 () ListLongMap!22769)

(declare-fun insertStrictlySorted!616 (List!36784 (_ BitVec 64) B!2604) List!36784)

(assert (=> start!137016 (= lt!676575 (insertStrictlySorted!616 (toList!11400 thiss!201) (_1!12726 keyValue!4) (_2!12726 keyValue!4)))))

(assert (=> start!137016 (not e!881221)))

(declare-fun e!881222 () Bool)

(declare-fun inv!58970 (ListLongMap!22769) Bool)

(assert (=> start!137016 (and (inv!58970 thiss!201) e!881222)))

(declare-fun tp_is_empty!39149 () Bool)

(assert (=> start!137016 tp_is_empty!39149))

(declare-fun b!1579679 () Bool)

(declare-fun contains!10459 (List!36784 tuple2!25430) Bool)

(assert (=> b!1579679 (= e!881221 (contains!10459 lt!676575 keyValue!4))))

(declare-fun b!1579680 () Bool)

(declare-fun tp!114366 () Bool)

(assert (=> b!1579680 (= e!881222 tp!114366)))

(assert (= (and start!137016 res!1079178) b!1579679))

(assert (= start!137016 b!1579680))

(declare-fun m!1451395 () Bool)

(assert (=> start!137016 m!1451395))

(declare-fun m!1451397 () Bool)

(assert (=> start!137016 m!1451397))

(declare-fun m!1451399 () Bool)

(assert (=> start!137016 m!1451399))

(declare-fun m!1451401 () Bool)

(assert (=> start!137016 m!1451401))

(declare-fun m!1451403 () Bool)

(assert (=> start!137016 m!1451403))

(declare-fun m!1451405 () Bool)

(assert (=> b!1579679 m!1451405))

(push 1)

(assert (not start!137016))

(assert (not b!1579679))

(assert (not b!1579680))

(assert tp_is_empty!39149)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166319 () Bool)

(declare-fun isStrictlySorted!1043 (List!36784) Bool)

(assert (=> d!166319 (= (inv!58970 thiss!201) (isStrictlySorted!1043 (toList!11400 thiss!201)))))

(declare-fun bs!45756 () Bool)

(assert (= bs!45756 d!166319))

(declare-fun m!1451407 () Bool)

(assert (=> bs!45756 m!1451407))

(assert (=> start!137016 d!166319))

(declare-fun d!166323 () Bool)

(declare-fun e!881239 () Bool)

(assert (=> d!166323 e!881239))

(declare-fun res!1079191 () Bool)

(assert (=> d!166323 (=> res!1079191 e!881239)))

(declare-fun lt!676593 () Bool)

(assert (=> d!166323 (= res!1079191 (not lt!676593))))

(declare-fun lt!676590 () Bool)

(assert (=> d!166323 (= lt!676593 lt!676590)))

(declare-fun lt!676592 () Unit!52229)

(declare-fun e!881238 () Unit!52229)

(assert (=> d!166323 (= lt!676592 e!881238)))

(declare-fun c!146469 () Bool)

(assert (=> d!166323 (= c!146469 lt!676590)))

(declare-fun containsKey!889 (List!36784 (_ BitVec 64)) Bool)

(assert (=> d!166323 (= lt!676590 (containsKey!889 (toList!11400 (ListLongMap!22770 lt!676575)) (_1!12726 keyValue!4)))))

(assert (=> d!166323 (= (contains!10458 (ListLongMap!22770 lt!676575) (_1!12726 keyValue!4)) lt!676593)))

(declare-fun b!1579709 () Bool)

(declare-fun lt!676591 () Unit!52229)

(assert (=> b!1579709 (= e!881238 lt!676591)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!546 (List!36784 (_ BitVec 64)) Unit!52229)

(assert (=> b!1579709 (= lt!676591 (lemmaContainsKeyImpliesGetValueByKeyDefined!546 (toList!11400 (ListLongMap!22770 lt!676575)) (_1!12726 keyValue!4)))))

(declare-fun isDefined!594 (Option!886) Bool)

(assert (=> b!1579709 (isDefined!594 (getValueByKey!810 (toList!11400 (ListLongMap!22770 lt!676575)) (_1!12726 keyValue!4)))))

(declare-fun b!1579710 () Bool)

(declare-fun Unit!52231 () Unit!52229)

(assert (=> b!1579710 (= e!881238 Unit!52231)))

(declare-fun b!1579711 () Bool)

(assert (=> b!1579711 (= e!881239 (isDefined!594 (getValueByKey!810 (toList!11400 (ListLongMap!22770 lt!676575)) (_1!12726 keyValue!4))))))

(assert (= (and d!166323 c!146469) b!1579709))

(assert (= (and d!166323 (not c!146469)) b!1579710))

(assert (= (and d!166323 (not res!1079191)) b!1579711))

(declare-fun m!1451423 () Bool)

(assert (=> d!166323 m!1451423))

(declare-fun m!1451425 () Bool)

(assert (=> b!1579709 m!1451425))

(declare-fun m!1451427 () Bool)

(assert (=> b!1579709 m!1451427))

(assert (=> b!1579709 m!1451427))

(declare-fun m!1451429 () Bool)

(assert (=> b!1579709 m!1451429))

(assert (=> b!1579711 m!1451427))

(assert (=> b!1579711 m!1451427))

(assert (=> b!1579711 m!1451429))

(assert (=> start!137016 d!166323))

(declare-fun d!166333 () Bool)

(assert (=> d!166333 (= (getValueByKey!810 lt!676575 (_1!12726 keyValue!4)) (Some!885 (_2!12726 keyValue!4)))))

(declare-fun lt!676597 () Unit!52229)

(declare-fun choose!2095 (List!36784 (_ BitVec 64) B!2604) Unit!52229)

(assert (=> d!166333 (= lt!676597 (choose!2095 lt!676575 (_1!12726 keyValue!4) (_2!12726 keyValue!4)))))

(declare-fun e!881249 () Bool)

(assert (=> d!166333 e!881249))

(declare-fun res!1079198 () Bool)

(assert (=> d!166333 (=> (not res!1079198) (not e!881249))))

(assert (=> d!166333 (= res!1079198 (isStrictlySorted!1043 lt!676575))))

(assert (=> d!166333 (= (lemmaContainsTupThenGetReturnValue!396 lt!676575 (_1!12726 keyValue!4) (_2!12726 keyValue!4)) lt!676597)))

(declare-fun b!1579730 () Bool)

(declare-fun res!1079199 () Bool)

(assert (=> b!1579730 (=> (not res!1079199) (not e!881249))))

(assert (=> b!1579730 (= res!1079199 (containsKey!889 lt!676575 (_1!12726 keyValue!4)))))

(declare-fun b!1579731 () Bool)

(assert (=> b!1579731 (= e!881249 (contains!10459 lt!676575 (tuple2!25431 (_1!12726 keyValue!4) (_2!12726 keyValue!4))))))

(assert (= (and d!166333 res!1079198) b!1579730))

(assert (= (and b!1579730 res!1079199) b!1579731))

(assert (=> d!166333 m!1451397))

(declare-fun m!1451441 () Bool)

(assert (=> d!166333 m!1451441))

(declare-fun m!1451443 () Bool)

(assert (=> d!166333 m!1451443))

(declare-fun m!1451445 () Bool)

(assert (=> b!1579730 m!1451445))

(declare-fun m!1451447 () Bool)

(assert (=> b!1579731 m!1451447))

(assert (=> start!137016 d!166333))

(declare-fun b!1579754 () Bool)

(declare-fun e!881262 () Option!886)

(assert (=> b!1579754 (= e!881262 (Some!885 (_2!12726 (h!38323 lt!676575))))))

(declare-fun b!1579756 () Bool)

(declare-fun e!881263 () Option!886)

(assert (=> b!1579756 (= e!881263 (getValueByKey!810 (t!51698 lt!676575) (_1!12726 keyValue!4)))))

(declare-fun d!166339 () Bool)

(declare-fun c!146486 () Bool)

(assert (=> d!166339 (= c!146486 (and (is-Cons!36780 lt!676575) (= (_1!12726 (h!38323 lt!676575)) (_1!12726 keyValue!4))))))

(assert (=> d!166339 (= (getValueByKey!810 lt!676575 (_1!12726 keyValue!4)) e!881262)))

(declare-fun b!1579757 () Bool)

(assert (=> b!1579757 (= e!881263 None!884)))

(declare-fun b!1579755 () Bool)

(assert (=> b!1579755 (= e!881262 e!881263)))

(declare-fun c!146487 () Bool)

(assert (=> b!1579755 (= c!146487 (and (is-Cons!36780 lt!676575) (not (= (_1!12726 (h!38323 lt!676575)) (_1!12726 keyValue!4)))))))

(assert (= (and d!166339 c!146486) b!1579754))

(assert (= (and d!166339 (not c!146486)) b!1579755))

(assert (= (and b!1579755 c!146487) b!1579756))

(assert (= (and b!1579755 (not c!146487)) b!1579757))

(declare-fun m!1451449 () Bool)

(assert (=> b!1579756 m!1451449))

(assert (=> start!137016 d!166339))

(declare-fun b!1579832 () Bool)

(declare-fun e!881303 () List!36784)

(declare-fun call!72474 () List!36784)

(assert (=> b!1579832 (= e!881303 call!72474)))

(declare-fun b!1579833 () Bool)

(declare-fun e!881306 () List!36784)

(declare-fun call!72475 () List!36784)

(assert (=> b!1579833 (= e!881306 call!72475)))

(declare-fun b!1579834 () Bool)

(declare-fun e!881305 () Bool)

(declare-fun lt!676629 () List!36784)

(assert (=> b!1579834 (= e!881305 (contains!10459 lt!676629 (tuple2!25431 (_1!12726 keyValue!4) (_2!12726 keyValue!4))))))

(declare-fun bm!72471 () Bool)

(declare-fun call!72476 () List!36784)

(assert (=> bm!72471 (= call!72476 call!72475)))

(declare-fun b!1579835 () Bool)

(declare-fun c!146517 () Bool)

(declare-fun c!146516 () Bool)

(declare-fun e!881307 () List!36784)

(assert (=> b!1579835 (= e!881307 (ite c!146517 (t!51698 (toList!11400 thiss!201)) (ite c!146516 (Cons!36780 (h!38323 (toList!11400 thiss!201)) (t!51698 (toList!11400 thiss!201))) Nil!36781)))))

(declare-fun c!146518 () Bool)

(declare-fun bm!72472 () Bool)

(declare-fun $colon$colon!1015 (List!36784 tuple2!25430) List!36784)

(assert (=> bm!72472 (= call!72475 ($colon$colon!1015 e!881307 (ite c!146518 (h!38323 (toList!11400 thiss!201)) (tuple2!25431 (_1!12726 keyValue!4) (_2!12726 keyValue!4)))))))

(declare-fun c!146519 () Bool)

(assert (=> bm!72472 (= c!146519 c!146518)))

(declare-fun b!1579837 () Bool)

(assert (=> b!1579837 (= e!881303 call!72474)))

(declare-fun b!1579838 () Bool)

(declare-fun res!1079220 () Bool)

(assert (=> b!1579838 (=> (not res!1079220) (not e!881305))))

(assert (=> b!1579838 (= res!1079220 (containsKey!889 lt!676629 (_1!12726 keyValue!4)))))

(declare-fun b!1579839 () Bool)

(declare-fun e!881304 () List!36784)

(assert (=> b!1579839 (= e!881306 e!881304)))

(assert (=> b!1579839 (= c!146517 (and (is-Cons!36780 (toList!11400 thiss!201)) (= (_1!12726 (h!38323 (toList!11400 thiss!201))) (_1!12726 keyValue!4))))))

(declare-fun b!1579840 () Bool)

(assert (=> b!1579840 (= e!881304 call!72476)))

(declare-fun bm!72473 () Bool)

(assert (=> bm!72473 (= call!72474 call!72476)))

(declare-fun b!1579841 () Bool)

(assert (=> b!1579841 (= c!146516 (and (is-Cons!36780 (toList!11400 thiss!201)) (bvsgt (_1!12726 (h!38323 (toList!11400 thiss!201))) (_1!12726 keyValue!4))))))

(assert (=> b!1579841 (= e!881304 e!881303)))

(declare-fun d!166341 () Bool)

(assert (=> d!166341 e!881305))

(declare-fun res!1079221 () Bool)

(assert (=> d!166341 (=> (not res!1079221) (not e!881305))))

(assert (=> d!166341 (= res!1079221 (isStrictlySorted!1043 lt!676629))))

