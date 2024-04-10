; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137416 () Bool)

(assert start!137416)

(declare-fun b!1581508 () Bool)

(declare-fun res!1080487 () Bool)

(declare-fun e!882456 () Bool)

(assert (=> b!1581508 (=> (not res!1080487) (not e!882456))))

(declare-datatypes ((B!2700 0))(
  ( (B!2701 (val!19712 Int)) )
))
(declare-datatypes ((tuple2!25584 0))(
  ( (tuple2!25585 (_1!12803 (_ BitVec 64)) (_2!12803 B!2700)) )
))
(declare-datatypes ((List!36832 0))(
  ( (Nil!36829) (Cons!36828 (h!38371 tuple2!25584) (t!51746 List!36832)) )
))
(declare-fun l!1390 () List!36832)

(declare-fun isStrictlySorted!1090 (List!36832) Bool)

(assert (=> b!1581508 (= res!1080487 (isStrictlySorted!1090 (t!51746 l!1390)))))

(declare-fun b!1581509 () Bool)

(declare-fun e!882458 () Bool)

(declare-fun e!882454 () Bool)

(assert (=> b!1581509 (= e!882458 e!882454)))

(declare-fun res!1080482 () Bool)

(assert (=> b!1581509 (=> (not res!1080482) (not e!882454))))

(declare-fun lt!676977 () tuple2!25584)

(declare-fun contains!10504 (List!36832 tuple2!25584) Bool)

(assert (=> b!1581509 (= res!1080482 (contains!10504 l!1390 lt!676977))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun value!194 () B!2700)

(assert (=> b!1581509 (= lt!676977 (tuple2!25585 key!405 value!194))))

(declare-fun res!1080485 () Bool)

(assert (=> start!137416 (=> (not res!1080485) (not e!882458))))

(assert (=> start!137416 (= res!1080485 (isStrictlySorted!1090 l!1390))))

(assert (=> start!137416 e!882458))

(declare-fun e!882455 () Bool)

(assert (=> start!137416 e!882455))

(assert (=> start!137416 true))

(declare-fun tp_is_empty!39245 () Bool)

(assert (=> start!137416 tp_is_empty!39245))

(declare-fun b!1581510 () Bool)

(declare-fun e!882457 () Bool)

(declare-datatypes ((tuple2!25586 0))(
  ( (tuple2!25587 (_1!12804 tuple2!25584) (_2!12804 List!36832)) )
))
(declare-datatypes ((Option!927 0))(
  ( (Some!926 (v!22442 tuple2!25586)) (None!925) )
))
(declare-fun lt!676975 () Option!927)

(declare-fun get!26820 (Option!927) tuple2!25586)

(assert (=> b!1581510 (= e!882457 (not (is-Nil!36829 (_2!12804 (get!26820 lt!676975)))))))

(declare-fun b!1581511 () Bool)

(declare-datatypes ((Option!928 0))(
  ( (Some!927 (v!22443 B!2700)) (None!926) )
))
(declare-fun lt!676976 () Option!928)

(declare-fun getValueByKey!822 (List!36832 (_ BitVec 64)) Option!928)

(assert (=> b!1581511 (= e!882456 (not (= (getValueByKey!822 l!1390 key!405) lt!676976)))))

(assert (=> b!1581511 (= (getValueByKey!822 (t!51746 l!1390) key!405) lt!676976)))

(assert (=> b!1581511 (= lt!676976 (Some!927 value!194))))

(declare-datatypes ((Unit!52256 0))(
  ( (Unit!52257) )
))
(declare-fun lt!676974 () Unit!52256)

(declare-fun lemmaContainsTupThenGetReturnValue!402 (List!36832 (_ BitVec 64) B!2700) Unit!52256)

(assert (=> b!1581511 (= lt!676974 (lemmaContainsTupThenGetReturnValue!402 (t!51746 l!1390) key!405 value!194))))

(declare-fun b!1581512 () Bool)

(declare-fun res!1080489 () Bool)

(assert (=> b!1581512 (=> (not res!1080489) (not e!882456))))

(declare-fun containsKey!936 (List!36832 (_ BitVec 64)) Bool)

(assert (=> b!1581512 (= res!1080489 (containsKey!936 (t!51746 l!1390) key!405))))

(declare-fun b!1581513 () Bool)

(declare-fun tp!114584 () Bool)

(assert (=> b!1581513 (= e!882455 (and tp_is_empty!39245 tp!114584))))

(declare-fun b!1581514 () Bool)

(assert (=> b!1581514 (= e!882454 e!882456)))

(declare-fun res!1080488 () Bool)

(assert (=> b!1581514 (=> (not res!1080488) (not e!882456))))

(assert (=> b!1581514 (= res!1080488 e!882457)))

(declare-fun res!1080486 () Bool)

(assert (=> b!1581514 (=> res!1080486 e!882457)))

(declare-fun isEmpty!1183 (Option!927) Bool)

(assert (=> b!1581514 (= res!1080486 (isEmpty!1183 lt!676975))))

(declare-fun unapply!99 (List!36832) Option!927)

(assert (=> b!1581514 (= lt!676975 (unapply!99 l!1390))))

(declare-fun b!1581515 () Bool)

(declare-fun res!1080481 () Bool)

(assert (=> b!1581515 (=> (not res!1080481) (not e!882458))))

(assert (=> b!1581515 (= res!1080481 (containsKey!936 l!1390 key!405))))

(declare-fun b!1581516 () Bool)

(declare-fun res!1080484 () Bool)

(assert (=> b!1581516 (=> (not res!1080484) (not e!882456))))

(assert (=> b!1581516 (= res!1080484 (and (or (not (is-Cons!36828 l!1390)) (not (= (_1!12803 (h!38371 l!1390)) key!405))) (is-Cons!36828 l!1390)))))

(declare-fun b!1581517 () Bool)

(declare-fun res!1080483 () Bool)

(assert (=> b!1581517 (=> (not res!1080483) (not e!882456))))

(assert (=> b!1581517 (= res!1080483 (contains!10504 (t!51746 l!1390) lt!676977))))

(assert (= (and start!137416 res!1080485) b!1581515))

(assert (= (and b!1581515 res!1080481) b!1581509))

(assert (= (and b!1581509 res!1080482) b!1581514))

(assert (= (and b!1581514 (not res!1080486)) b!1581510))

(assert (= (and b!1581514 res!1080488) b!1581516))

(assert (= (and b!1581516 res!1080484) b!1581508))

(assert (= (and b!1581508 res!1080487) b!1581512))

(assert (= (and b!1581512 res!1080489) b!1581517))

(assert (= (and b!1581517 res!1080483) b!1581511))

(assert (= (and start!137416 (is-Cons!36828 l!1390)) b!1581513))

(declare-fun m!1452461 () Bool)

(assert (=> b!1581517 m!1452461))

(declare-fun m!1452463 () Bool)

(assert (=> b!1581510 m!1452463))

(declare-fun m!1452465 () Bool)

(assert (=> b!1581514 m!1452465))

(declare-fun m!1452467 () Bool)

(assert (=> b!1581514 m!1452467))

(declare-fun m!1452469 () Bool)

(assert (=> b!1581512 m!1452469))

(declare-fun m!1452471 () Bool)

(assert (=> b!1581508 m!1452471))

(declare-fun m!1452473 () Bool)

(assert (=> b!1581509 m!1452473))

(declare-fun m!1452475 () Bool)

(assert (=> start!137416 m!1452475))

(declare-fun m!1452477 () Bool)

(assert (=> b!1581511 m!1452477))

(declare-fun m!1452479 () Bool)

(assert (=> b!1581511 m!1452479))

(declare-fun m!1452481 () Bool)

(assert (=> b!1581511 m!1452481))

(declare-fun m!1452483 () Bool)

(assert (=> b!1581515 m!1452483))

(push 1)

(assert (not b!1581510))

(assert (not b!1581513))

(assert (not start!137416))

(assert (not b!1581514))

(assert tp_is_empty!39245)

(assert (not b!1581512))

(assert (not b!1581517))

(assert (not b!1581509))

(assert (not b!1581511))

(assert (not b!1581508))

(assert (not b!1581515))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166743 () Bool)

(declare-fun res!1080500 () Bool)

(declare-fun e!882469 () Bool)

(assert (=> d!166743 (=> res!1080500 e!882469)))

(assert (=> d!166743 (= res!1080500 (or (is-Nil!36829 l!1390) (is-Nil!36829 (t!51746 l!1390))))))

(assert (=> d!166743 (= (isStrictlySorted!1090 l!1390) e!882469)))

(declare-fun b!1581528 () Bool)

(declare-fun e!882470 () Bool)

(assert (=> b!1581528 (= e!882469 e!882470)))

(declare-fun res!1080501 () Bool)

(assert (=> b!1581528 (=> (not res!1080501) (not e!882470))))

(assert (=> b!1581528 (= res!1080501 (bvslt (_1!12803 (h!38371 l!1390)) (_1!12803 (h!38371 (t!51746 l!1390)))))))

(declare-fun b!1581529 () Bool)

(assert (=> b!1581529 (= e!882470 (isStrictlySorted!1090 (t!51746 l!1390)))))

(assert (= (and d!166743 (not res!1080500)) b!1581528))

(assert (= (and b!1581528 res!1080501) b!1581529))

(assert (=> b!1581529 m!1452471))

(assert (=> start!137416 d!166743))

(declare-fun d!166749 () Bool)

(declare-fun res!1080502 () Bool)

(declare-fun e!882471 () Bool)

(assert (=> d!166749 (=> res!1080502 e!882471)))

(assert (=> d!166749 (= res!1080502 (or (is-Nil!36829 (t!51746 l!1390)) (is-Nil!36829 (t!51746 (t!51746 l!1390)))))))

(assert (=> d!166749 (= (isStrictlySorted!1090 (t!51746 l!1390)) e!882471)))

(declare-fun b!1581530 () Bool)

(declare-fun e!882472 () Bool)

(assert (=> b!1581530 (= e!882471 e!882472)))

(declare-fun res!1080503 () Bool)

(assert (=> b!1581530 (=> (not res!1080503) (not e!882472))))

(assert (=> b!1581530 (= res!1080503 (bvslt (_1!12803 (h!38371 (t!51746 l!1390))) (_1!12803 (h!38371 (t!51746 (t!51746 l!1390))))))))

(declare-fun b!1581531 () Bool)

(assert (=> b!1581531 (= e!882472 (isStrictlySorted!1090 (t!51746 (t!51746 l!1390))))))

(assert (= (and d!166749 (not res!1080502)) b!1581530))

(assert (= (and b!1581530 res!1080503) b!1581531))

(declare-fun m!1452487 () Bool)

(assert (=> b!1581531 m!1452487))

(assert (=> b!1581508 d!166749))

(declare-fun d!166751 () Bool)

(declare-fun lt!676987 () Bool)

(declare-fun content!851 (List!36832) (Set tuple2!25584))

(assert (=> d!166751 (= lt!676987 (member lt!676977 (content!851 l!1390)))))

(declare-fun e!882496 () Bool)

(assert (=> d!166751 (= lt!676987 e!882496)))

(declare-fun res!1080523 () Bool)

(assert (=> d!166751 (=> (not res!1080523) (not e!882496))))

(assert (=> d!166751 (= res!1080523 (is-Cons!36828 l!1390))))

(assert (=> d!166751 (= (contains!10504 l!1390 lt!676977) lt!676987)))

(declare-fun b!1581558 () Bool)

(declare-fun e!882495 () Bool)

(assert (=> b!1581558 (= e!882496 e!882495)))

(declare-fun res!1080522 () Bool)

(assert (=> b!1581558 (=> res!1080522 e!882495)))

(assert (=> b!1581558 (= res!1080522 (= (h!38371 l!1390) lt!676977))))

(declare-fun b!1581559 () Bool)

(assert (=> b!1581559 (= e!882495 (contains!10504 (t!51746 l!1390) lt!676977))))

(assert (= (and d!166751 res!1080523) b!1581558))

(assert (= (and b!1581558 (not res!1080522)) b!1581559))

(declare-fun m!1452503 () Bool)

(assert (=> d!166751 m!1452503))

(declare-fun m!1452505 () Bool)

(assert (=> d!166751 m!1452505))

(assert (=> b!1581559 m!1452461))

(assert (=> b!1581509 d!166751))

(declare-fun d!166759 () Bool)

(assert (=> d!166759 (= (isEmpty!1183 lt!676975) (not (is-Some!926 lt!676975)))))

(assert (=> b!1581514 d!166759))

(declare-fun d!166761 () Bool)

(assert (=> d!166761 (= (unapply!99 l!1390) (ite (is-Nil!36829 l!1390) None!925 (Some!926 (tuple2!25587 (h!38371 l!1390) (t!51746 l!1390)))))))

(assert (=> b!1581514 d!166761))

(declare-fun d!166765 () Bool)

(declare-fun res!1080542 () Bool)

(declare-fun e!882518 () Bool)

(assert (=> d!166765 (=> res!1080542 e!882518)))

(assert (=> d!166765 (= res!1080542 (and (is-Cons!36828 l!1390) (= (_1!12803 (h!38371 l!1390)) key!405)))))

(assert (=> d!166765 (= (containsKey!936 l!1390 key!405) e!882518)))

(declare-fun b!1581590 () Bool)

(declare-fun e!882519 () Bool)

(assert (=> b!1581590 (= e!882518 e!882519)))

(declare-fun res!1080543 () Bool)

(assert (=> b!1581590 (=> (not res!1080543) (not e!882519))))

(assert (=> b!1581590 (= res!1080543 (and (or (not (is-Cons!36828 l!1390)) (bvsle (_1!12803 (h!38371 l!1390)) key!405)) (is-Cons!36828 l!1390) (bvslt (_1!12803 (h!38371 l!1390)) key!405)))))

(declare-fun b!1581591 () Bool)

(assert (=> b!1581591 (= e!882519 (containsKey!936 (t!51746 l!1390) key!405))))

(assert (= (and d!166765 (not res!1080542)) b!1581590))

(assert (= (and b!1581590 res!1080543) b!1581591))

(assert (=> b!1581591 m!1452469))

(assert (=> b!1581515 d!166765))

(declare-fun d!166777 () Bool)

(assert (=> d!166777 (= (get!26820 lt!676975) (v!22442 lt!676975))))

(assert (=> b!1581510 d!166777))

(declare-fun d!166779 () Bool)

(declare-fun lt!676990 () Bool)

(assert (=> d!166779 (= lt!676990 (member lt!676977 (content!851 (t!51746 l!1390))))))

(declare-fun e!882524 () Bool)

(assert (=> d!166779 (= lt!676990 e!882524)))

(declare-fun res!1080545 () Bool)

(assert (=> d!166779 (=> (not res!1080545) (not e!882524))))

(assert (=> d!166779 (= res!1080545 (is-Cons!36828 (t!51746 l!1390)))))

(assert (=> d!166779 (= (contains!10504 (t!51746 l!1390) lt!676977) lt!676990)))

(declare-fun b!1581596 () Bool)

(declare-fun e!882523 () Bool)

(assert (=> b!1581596 (= e!882524 e!882523)))

(declare-fun res!1080544 () Bool)

(assert (=> b!1581596 (=> res!1080544 e!882523)))

(assert (=> b!1581596 (= res!1080544 (= (h!38371 (t!51746 l!1390)) lt!676977))))

(declare-fun b!1581597 () Bool)

(assert (=> b!1581597 (= e!882523 (contains!10504 (t!51746 (t!51746 l!1390)) lt!676977))))

(assert (= (and d!166779 res!1080545) b!1581596))

(assert (= (and b!1581596 (not res!1080544)) b!1581597))

(declare-fun m!1452511 () Bool)

(assert (=> d!166779 m!1452511))

(declare-fun m!1452513 () Bool)

(assert (=> d!166779 m!1452513))

(declare-fun m!1452515 () Bool)

(assert (=> b!1581597 m!1452515))

(assert (=> b!1581517 d!166779))

(declare-fun d!166781 () Bool)

(declare-fun res!1080548 () Bool)

(declare-fun e!882526 () Bool)

(assert (=> d!166781 (=> res!1080548 e!882526)))

(assert (=> d!166781 (= res!1080548 (and (is-Cons!36828 (t!51746 l!1390)) (= (_1!12803 (h!38371 (t!51746 l!1390))) key!405)))))

(assert (=> d!166781 (= (containsKey!936 (t!51746 l!1390) key!405) e!882526)))

(declare-fun b!1581600 () Bool)

(declare-fun e!882527 () Bool)

(assert (=> b!1581600 (= e!882526 e!882527)))

(declare-fun res!1080549 () Bool)

(assert (=> b!1581600 (=> (not res!1080549) (not e!882527))))

(assert (=> b!1581600 (= res!1080549 (and (or (not (is-Cons!36828 (t!51746 l!1390))) (bvsle (_1!12803 (h!38371 (t!51746 l!1390))) key!405)) (is-Cons!36828 (t!51746 l!1390)) (bvslt (_1!12803 (h!38371 (t!51746 l!1390))) key!405)))))

(declare-fun b!1581601 () Bool)

(assert (=> b!1581601 (= e!882527 (containsKey!936 (t!51746 (t!51746 l!1390)) key!405))))

(assert (= (and d!166781 (not res!1080548)) b!1581600))

(assert (= (and b!1581600 res!1080549) b!1581601))

(declare-fun m!1452517 () Bool)

(assert (=> b!1581601 m!1452517))

(assert (=> b!1581512 d!166781))

(declare-fun d!166783 () Bool)

(declare-fun c!146611 () Bool)

(assert (=> d!166783 (= c!146611 (and (is-Cons!36828 l!1390) (= (_1!12803 (h!38371 l!1390)) key!405)))))

(declare-fun e!882538 () Option!928)

(assert (=> d!166783 (= (getValueByKey!822 l!1390 key!405) e!882538)))

(declare-fun b!1581623 () Bool)

(declare-fun e!882539 () Option!928)

(assert (=> b!1581623 (= e!882539 None!926)))

(declare-fun b!1581621 () Bool)

(assert (=> b!1581621 (= e!882538 e!882539)))

(declare-fun c!146612 () Bool)

(assert (=> b!1581621 (= c!146612 (and (is-Cons!36828 l!1390) (not (= (_1!12803 (h!38371 l!1390)) key!405))))))

(declare-fun b!1581620 () Bool)

(assert (=> b!1581620 (= e!882538 (Some!927 (_2!12803 (h!38371 l!1390))))))

(declare-fun b!1581622 () Bool)

(assert (=> b!1581622 (= e!882539 (getValueByKey!822 (t!51746 l!1390) key!405))))

(assert (= (and d!166783 c!146611) b!1581620))

(assert (= (and d!166783 (not c!146611)) b!1581621))

(assert (= (and b!1581621 c!146612) b!1581622))

(assert (= (and b!1581621 (not c!146612)) b!1581623))

(assert (=> b!1581622 m!1452479))

(assert (=> b!1581511 d!166783))

(declare-fun d!166795 () Bool)

(declare-fun c!146613 () Bool)

(assert (=> d!166795 (= c!146613 (and (is-Cons!36828 (t!51746 l!1390)) (= (_1!12803 (h!38371 (t!51746 l!1390))) key!405)))))

(declare-fun e!882544 () Option!928)

(assert (=> d!166795 (= (getValueByKey!822 (t!51746 l!1390) key!405) e!882544)))

(declare-fun b!1581633 () Bool)

(declare-fun e!882545 () Option!928)

(assert (=> b!1581633 (= e!882545 None!926)))

(declare-fun b!1581631 () Bool)

(assert (=> b!1581631 (= e!882544 e!882545)))

(declare-fun c!146614 () Bool)

(assert (=> b!1581631 (= c!146614 (and (is-Cons!36828 (t!51746 l!1390)) (not (= (_1!12803 (h!38371 (t!51746 l!1390))) key!405))))))

(declare-fun b!1581630 () Bool)

(assert (=> b!1581630 (= e!882544 (Some!927 (_2!12803 (h!38371 (t!51746 l!1390)))))))

(declare-fun b!1581632 () Bool)

(assert (=> b!1581632 (= e!882545 (getValueByKey!822 (t!51746 (t!51746 l!1390)) key!405))))

(assert (= (and d!166795 c!146613) b!1581630))

(assert (= (and d!166795 (not c!146613)) b!1581631))

(assert (= (and b!1581631 c!146614) b!1581632))

(assert (= (and b!1581631 (not c!146614)) b!1581633))

(declare-fun m!1452525 () Bool)

(assert (=> b!1581632 m!1452525))

(assert (=> b!1581511 d!166795))

(declare-fun d!166797 () Bool)

(assert (=> d!166797 (= (getValueByKey!822 (t!51746 l!1390) key!405) (Some!927 value!194))))

(declare-fun lt!676997 () Unit!52256)

(declare-fun choose!2100 (List!36832 (_ BitVec 64) B!2700) Unit!52256)

