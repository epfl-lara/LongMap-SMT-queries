; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137412 () Bool)

(assert start!137412)

(declare-fun b!1581448 () Bool)

(declare-fun e!882427 () Bool)

(declare-fun tp_is_empty!39241 () Bool)

(declare-fun tp!114578 () Bool)

(assert (=> b!1581448 (= e!882427 (and tp_is_empty!39241 tp!114578))))

(declare-fun b!1581449 () Bool)

(declare-fun res!1080431 () Bool)

(declare-fun e!882424 () Bool)

(assert (=> b!1581449 (=> (not res!1080431) (not e!882424))))

(declare-datatypes ((B!2696 0))(
  ( (B!2697 (val!19710 Int)) )
))
(declare-datatypes ((tuple2!25576 0))(
  ( (tuple2!25577 (_1!12799 (_ BitVec 64)) (_2!12799 B!2696)) )
))
(declare-datatypes ((List!36830 0))(
  ( (Nil!36827) (Cons!36826 (h!38369 tuple2!25576) (t!51744 List!36830)) )
))
(declare-fun l!1390 () List!36830)

(declare-fun lt!676950 () tuple2!25576)

(declare-fun contains!10502 (List!36830 tuple2!25576) Bool)

(assert (=> b!1581449 (= res!1080431 (contains!10502 (t!51744 l!1390) lt!676950))))

(declare-fun b!1581450 () Bool)

(declare-fun res!1080434 () Bool)

(assert (=> b!1581450 (=> (not res!1080434) (not e!882424))))

(declare-fun isStrictlySorted!1088 (List!36830) Bool)

(assert (=> b!1581450 (= res!1080434 (isStrictlySorted!1088 (t!51744 l!1390)))))

(declare-fun b!1581451 () Bool)

(declare-fun e!882425 () Bool)

(declare-datatypes ((tuple2!25578 0))(
  ( (tuple2!25579 (_1!12800 tuple2!25576) (_2!12800 List!36830)) )
))
(declare-datatypes ((Option!923 0))(
  ( (Some!922 (v!22438 tuple2!25578)) (None!921) )
))
(declare-fun lt!676952 () Option!923)

(declare-fun get!26818 (Option!923) tuple2!25578)

(assert (=> b!1581451 (= e!882425 (not (is-Nil!36827 (_2!12800 (get!26818 lt!676952)))))))

(declare-fun b!1581452 () Bool)

(declare-fun e!882428 () Bool)

(declare-fun e!882426 () Bool)

(assert (=> b!1581452 (= e!882428 e!882426)))

(declare-fun res!1080432 () Bool)

(assert (=> b!1581452 (=> (not res!1080432) (not e!882426))))

(assert (=> b!1581452 (= res!1080432 (contains!10502 l!1390 lt!676950))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun value!194 () B!2696)

(assert (=> b!1581452 (= lt!676950 (tuple2!25577 key!405 value!194))))

(declare-fun b!1581453 () Bool)

(assert (=> b!1581453 (= e!882426 e!882424)))

(declare-fun res!1080433 () Bool)

(assert (=> b!1581453 (=> (not res!1080433) (not e!882424))))

(assert (=> b!1581453 (= res!1080433 e!882425)))

(declare-fun res!1080428 () Bool)

(assert (=> b!1581453 (=> res!1080428 e!882425)))

(declare-fun isEmpty!1181 (Option!923) Bool)

(assert (=> b!1581453 (= res!1080428 (isEmpty!1181 lt!676952))))

(declare-fun unapply!97 (List!36830) Option!923)

(assert (=> b!1581453 (= lt!676952 (unapply!97 l!1390))))

(declare-fun b!1581454 () Bool)

(declare-datatypes ((Option!924 0))(
  ( (Some!923 (v!22439 B!2696)) (None!922) )
))
(declare-fun lt!676951 () Option!924)

(declare-fun getValueByKey!820 (List!36830 (_ BitVec 64)) Option!924)

(assert (=> b!1581454 (= e!882424 (not (= (getValueByKey!820 l!1390 key!405) lt!676951)))))

(assert (=> b!1581454 (= (getValueByKey!820 (t!51744 l!1390) key!405) lt!676951)))

(assert (=> b!1581454 (= lt!676951 (Some!923 value!194))))

(declare-datatypes ((Unit!52252 0))(
  ( (Unit!52253) )
))
(declare-fun lt!676953 () Unit!52252)

(declare-fun lemmaContainsTupThenGetReturnValue!400 (List!36830 (_ BitVec 64) B!2696) Unit!52252)

(assert (=> b!1581454 (= lt!676953 (lemmaContainsTupThenGetReturnValue!400 (t!51744 l!1390) key!405 value!194))))

(declare-fun b!1581455 () Bool)

(declare-fun res!1080429 () Bool)

(assert (=> b!1581455 (=> (not res!1080429) (not e!882428))))

(declare-fun containsKey!934 (List!36830 (_ BitVec 64)) Bool)

(assert (=> b!1581455 (= res!1080429 (containsKey!934 l!1390 key!405))))

(declare-fun res!1080427 () Bool)

(assert (=> start!137412 (=> (not res!1080427) (not e!882428))))

(assert (=> start!137412 (= res!1080427 (isStrictlySorted!1088 l!1390))))

(assert (=> start!137412 e!882428))

(assert (=> start!137412 e!882427))

(assert (=> start!137412 true))

(assert (=> start!137412 tp_is_empty!39241))

(declare-fun b!1581456 () Bool)

(declare-fun res!1080430 () Bool)

(assert (=> b!1581456 (=> (not res!1080430) (not e!882424))))

(assert (=> b!1581456 (= res!1080430 (containsKey!934 (t!51744 l!1390) key!405))))

(declare-fun b!1581457 () Bool)

(declare-fun res!1080435 () Bool)

(assert (=> b!1581457 (=> (not res!1080435) (not e!882424))))

(assert (=> b!1581457 (= res!1080435 (and (or (not (is-Cons!36826 l!1390)) (not (= (_1!12799 (h!38369 l!1390)) key!405))) (is-Cons!36826 l!1390)))))

(assert (= (and start!137412 res!1080427) b!1581455))

(assert (= (and b!1581455 res!1080429) b!1581452))

(assert (= (and b!1581452 res!1080432) b!1581453))

(assert (= (and b!1581453 (not res!1080428)) b!1581451))

(assert (= (and b!1581453 res!1080433) b!1581457))

(assert (= (and b!1581457 res!1080435) b!1581450))

(assert (= (and b!1581450 res!1080434) b!1581456))

(assert (= (and b!1581456 res!1080430) b!1581449))

(assert (= (and b!1581449 res!1080431) b!1581454))

(assert (= (and start!137412 (is-Cons!36826 l!1390)) b!1581448))

(declare-fun m!1452413 () Bool)

(assert (=> b!1581454 m!1452413))

(declare-fun m!1452415 () Bool)

(assert (=> b!1581454 m!1452415))

(declare-fun m!1452417 () Bool)

(assert (=> b!1581454 m!1452417))

(declare-fun m!1452419 () Bool)

(assert (=> b!1581451 m!1452419))

(declare-fun m!1452421 () Bool)

(assert (=> start!137412 m!1452421))

(declare-fun m!1452423 () Bool)

(assert (=> b!1581449 m!1452423))

(declare-fun m!1452425 () Bool)

(assert (=> b!1581450 m!1452425))

(declare-fun m!1452427 () Bool)

(assert (=> b!1581453 m!1452427))

(declare-fun m!1452429 () Bool)

(assert (=> b!1581453 m!1452429))

(declare-fun m!1452431 () Bool)

(assert (=> b!1581455 m!1452431))

(declare-fun m!1452433 () Bool)

(assert (=> b!1581452 m!1452433))

(declare-fun m!1452435 () Bool)

(assert (=> b!1581456 m!1452435))

(push 1)

(assert (not b!1581456))

(assert (not b!1581453))

(assert (not b!1581454))

(assert (not b!1581449))

(assert (not b!1581448))

(assert (not b!1581452))

(assert (not b!1581450))

(assert tp_is_empty!39241)

(assert (not b!1581455))

(assert (not b!1581451))

(assert (not start!137412))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!166745 () Bool)

(declare-fun lt!676982 () Bool)

(declare-fun content!849 (List!36830) (Set tuple2!25576))

(assert (=> d!166745 (= lt!676982 (set.member lt!676950 (content!849 l!1390)))))

(declare-fun e!882482 () Bool)

(assert (=> d!166745 (= lt!676982 e!882482)))

(declare-fun res!1080513 () Bool)

(assert (=> d!166745 (=> (not res!1080513) (not e!882482))))

(assert (=> d!166745 (= res!1080513 (is-Cons!36826 l!1390))))

(assert (=> d!166745 (= (contains!10502 l!1390 lt!676950) lt!676982)))

(declare-fun b!1581540 () Bool)

(declare-fun e!882481 () Bool)

(assert (=> b!1581540 (= e!882482 e!882481)))

(declare-fun res!1080512 () Bool)

(assert (=> b!1581540 (=> res!1080512 e!882481)))

(assert (=> b!1581540 (= res!1080512 (= (h!38369 l!1390) lt!676950))))

(declare-fun b!1581541 () Bool)

(assert (=> b!1581541 (= e!882481 (contains!10502 (t!51744 l!1390) lt!676950))))

(assert (= (and d!166745 res!1080513) b!1581540))

(assert (= (and b!1581540 (not res!1080512)) b!1581541))

(declare-fun m!1452489 () Bool)

(assert (=> d!166745 m!1452489))

(declare-fun m!1452491 () Bool)

(assert (=> d!166745 m!1452491))

(assert (=> b!1581541 m!1452423))

(assert (=> b!1581452 d!166745))

(declare-fun b!1581565 () Bool)

(declare-fun e!882501 () Option!924)

(declare-fun e!882502 () Option!924)

(assert (=> b!1581565 (= e!882501 e!882502)))

(declare-fun c!146596 () Bool)

(assert (=> b!1581565 (= c!146596 (and (is-Cons!36826 l!1390) (not (= (_1!12799 (h!38369 l!1390)) key!405))))))

(declare-fun d!166753 () Bool)

(declare-fun c!146595 () Bool)

(assert (=> d!166753 (= c!146595 (and (is-Cons!36826 l!1390) (= (_1!12799 (h!38369 l!1390)) key!405)))))

(assert (=> d!166753 (= (getValueByKey!820 l!1390 key!405) e!882501)))

(declare-fun b!1581567 () Bool)

(assert (=> b!1581567 (= e!882502 None!922)))

(declare-fun b!1581564 () Bool)

(assert (=> b!1581564 (= e!882501 (Some!923 (_2!12799 (h!38369 l!1390))))))

(declare-fun b!1581566 () Bool)

(assert (=> b!1581566 (= e!882502 (getValueByKey!820 (t!51744 l!1390) key!405))))

(assert (= (and d!166753 c!146595) b!1581564))

(assert (= (and d!166753 (not c!146595)) b!1581565))

(assert (= (and b!1581565 c!146596) b!1581566))

(assert (= (and b!1581565 (not c!146596)) b!1581567))

(assert (=> b!1581566 m!1452415))

(assert (=> b!1581454 d!166753))

(declare-fun b!1581571 () Bool)

(declare-fun e!882505 () Option!924)

(declare-fun e!882506 () Option!924)

(assert (=> b!1581571 (= e!882505 e!882506)))

(declare-fun c!146598 () Bool)

(assert (=> b!1581571 (= c!146598 (and (is-Cons!36826 (t!51744 l!1390)) (not (= (_1!12799 (h!38369 (t!51744 l!1390))) key!405))))))

(declare-fun d!166763 () Bool)

(declare-fun c!146597 () Bool)

(assert (=> d!166763 (= c!146597 (and (is-Cons!36826 (t!51744 l!1390)) (= (_1!12799 (h!38369 (t!51744 l!1390))) key!405)))))

(assert (=> d!166763 (= (getValueByKey!820 (t!51744 l!1390) key!405) e!882505)))

(declare-fun b!1581573 () Bool)

(assert (=> b!1581573 (= e!882506 None!922)))

(declare-fun b!1581570 () Bool)

(assert (=> b!1581570 (= e!882505 (Some!923 (_2!12799 (h!38369 (t!51744 l!1390)))))))

(declare-fun b!1581572 () Bool)

(assert (=> b!1581572 (= e!882506 (getValueByKey!820 (t!51744 (t!51744 l!1390)) key!405))))

(assert (= (and d!166763 c!146597) b!1581570))

(assert (= (and d!166763 (not c!146597)) b!1581571))

(assert (= (and b!1581571 c!146598) b!1581572))

(assert (= (and b!1581571 (not c!146598)) b!1581573))

(declare-fun m!1452507 () Bool)

(assert (=> b!1581572 m!1452507))

(assert (=> b!1581454 d!166763))

(declare-fun d!166769 () Bool)

(assert (=> d!166769 (= (getValueByKey!820 (t!51744 l!1390) key!405) (Some!923 value!194))))

(declare-fun lt!676991 () Unit!52252)

(declare-fun choose!2098 (List!36830 (_ BitVec 64) B!2696) Unit!52252)

(assert (=> d!166769 (= lt!676991 (choose!2098 (t!51744 l!1390) key!405 value!194))))

(declare-fun e!882525 () Bool)

(assert (=> d!166769 e!882525))

(declare-fun res!1080546 () Bool)

(assert (=> d!166769 (=> (not res!1080546) (not e!882525))))

(assert (=> d!166769 (= res!1080546 (isStrictlySorted!1088 (t!51744 l!1390)))))

(assert (=> d!166769 (= (lemmaContainsTupThenGetReturnValue!400 (t!51744 l!1390) key!405 value!194) lt!676991)))

(declare-fun b!1581598 () Bool)

(declare-fun res!1080547 () Bool)

(assert (=> b!1581598 (=> (not res!1080547) (not e!882525))))

(assert (=> b!1581598 (= res!1080547 (containsKey!934 (t!51744 l!1390) key!405))))

(declare-fun b!1581599 () Bool)

(assert (=> b!1581599 (= e!882525 (contains!10502 (t!51744 l!1390) (tuple2!25577 key!405 value!194)))))

(assert (= (and d!166769 res!1080546) b!1581598))

(assert (= (and b!1581598 res!1080547) b!1581599))

(assert (=> d!166769 m!1452415))

(declare-fun m!1452519 () Bool)

(assert (=> d!166769 m!1452519))

(assert (=> d!166769 m!1452425))

(assert (=> b!1581598 m!1452435))

(declare-fun m!1452521 () Bool)

(assert (=> b!1581599 m!1452521))

(assert (=> b!1581454 d!166769))

(declare-fun d!166785 () Bool)

(assert (=> d!166785 (= (isEmpty!1181 lt!676952) (not (is-Some!922 lt!676952)))))

(assert (=> b!1581453 d!166785))

(declare-fun d!166789 () Bool)

(assert (=> d!166789 (= (unapply!97 l!1390) (ite (is-Nil!36827 l!1390) None!921 (Some!922 (tuple2!25579 (h!38369 l!1390) (t!51744 l!1390)))))))

(assert (=> b!1581453 d!166789))

(declare-fun d!166793 () Bool)

(declare-fun res!1080558 () Bool)

(declare-fun e!882546 () Bool)

(assert (=> d!166793 (=> res!1080558 e!882546)))

(assert (=> d!166793 (= res!1080558 (or (is-Nil!36827 l!1390) (is-Nil!36827 (t!51744 l!1390))))))

(assert (=> d!166793 (= (isStrictlySorted!1088 l!1390) e!882546)))

(declare-fun b!1581634 () Bool)

(declare-fun e!882547 () Bool)

(assert (=> b!1581634 (= e!882546 e!882547)))

(declare-fun res!1080559 () Bool)

(assert (=> b!1581634 (=> (not res!1080559) (not e!882547))))

(assert (=> b!1581634 (= res!1080559 (bvslt (_1!12799 (h!38369 l!1390)) (_1!12799 (h!38369 (t!51744 l!1390)))))))

(declare-fun b!1581635 () Bool)

(assert (=> b!1581635 (= e!882547 (isStrictlySorted!1088 (t!51744 l!1390)))))

(assert (= (and d!166793 (not res!1080558)) b!1581634))

(assert (= (and b!1581634 res!1080559) b!1581635))

(assert (=> b!1581635 m!1452425))

(assert (=> start!137412 d!166793))

(declare-fun d!166799 () Bool)

(declare-fun res!1080570 () Bool)

(declare-fun e!882557 () Bool)

(assert (=> d!166799 (=> res!1080570 e!882557)))

(assert (=> d!166799 (= res!1080570 (and (is-Cons!36826 l!1390) (= (_1!12799 (h!38369 l!1390)) key!405)))))

(assert (=> d!166799 (= (containsKey!934 l!1390 key!405) e!882557)))

(declare-fun b!1581650 () Bool)

(declare-fun e!882558 () Bool)

(assert (=> b!1581650 (= e!882557 e!882558)))

(declare-fun res!1080571 () Bool)

(assert (=> b!1581650 (=> (not res!1080571) (not e!882558))))

(assert (=> b!1581650 (= res!1080571 (and (or (not (is-Cons!36826 l!1390)) (bvsle (_1!12799 (h!38369 l!1390)) key!405)) (is-Cons!36826 l!1390) (bvslt (_1!12799 (h!38369 l!1390)) key!405)))))

(declare-fun b!1581651 () Bool)

(assert (=> b!1581651 (= e!882558 (containsKey!934 (t!51744 l!1390) key!405))))

(assert (= (and d!166799 (not res!1080570)) b!1581650))

(assert (= (and b!1581650 res!1080571) b!1581651))

(assert (=> b!1581651 m!1452435))

(assert (=> b!1581455 d!166799))

(declare-fun d!166805 () Bool)

(declare-fun res!1080572 () Bool)

(declare-fun e!882560 () Bool)

(assert (=> d!166805 (=> res!1080572 e!882560)))

(assert (=> d!166805 (= res!1080572 (or (is-Nil!36827 (t!51744 l!1390)) (is-Nil!36827 (t!51744 (t!51744 l!1390)))))))

(assert (=> d!166805 (= (isStrictlySorted!1088 (t!51744 l!1390)) e!882560)))

(declare-fun b!1581653 () Bool)

(declare-fun e!882561 () Bool)

(assert (=> b!1581653 (= e!882560 e!882561)))

(declare-fun res!1080573 () Bool)

(assert (=> b!1581653 (=> (not res!1080573) (not e!882561))))

(assert (=> b!1581653 (= res!1080573 (bvslt (_1!12799 (h!38369 (t!51744 l!1390))) (_1!12799 (h!38369 (t!51744 (t!51744 l!1390))))))))

(declare-fun b!1581654 () Bool)

(assert (=> b!1581654 (= e!882561 (isStrictlySorted!1088 (t!51744 (t!51744 l!1390))))))

(assert (= (and d!166805 (not res!1080572)) b!1581653))

(assert (= (and b!1581653 res!1080573) b!1581654))

(declare-fun m!1452531 () Bool)

(assert (=> b!1581654 m!1452531))

(assert (=> b!1581450 d!166805))

(declare-fun d!166807 () Bool)

(declare-fun lt!676998 () Bool)

(assert (=> d!166807 (= lt!676998 (set.member lt!676950 (content!849 (t!51744 l!1390))))))

(declare-fun e!882564 () Bool)

(assert (=> d!166807 (= lt!676998 e!882564)))

(declare-fun res!1080577 () Bool)

(assert (=> d!166807 (=> (not res!1080577) (not e!882564))))

(assert (=> d!166807 (= res!1080577 (is-Cons!36826 (t!51744 l!1390)))))

(assert (=> d!166807 (= (contains!10502 (t!51744 l!1390) lt!676950) lt!676998)))

(declare-fun b!1581657 () Bool)

(declare-fun e!882563 () Bool)

(assert (=> b!1581657 (= e!882564 e!882563)))

(declare-fun res!1080576 () Bool)

(assert (=> b!1581657 (=> res!1080576 e!882563)))

(assert (=> b!1581657 (= res!1080576 (= (h!38369 (t!51744 l!1390)) lt!676950))))

(declare-fun b!1581658 () Bool)

(assert (=> b!1581658 (= e!882563 (contains!10502 (t!51744 (t!51744 l!1390)) lt!676950))))

(assert (= (and d!166807 res!1080577) b!1581657))

(assert (= (and b!1581657 (not res!1080576)) b!1581658))

(declare-fun m!1452535 () Bool)

(assert (=> d!166807 m!1452535))

(declare-fun m!1452539 () Bool)

(assert (=> d!166807 m!1452539))

(declare-fun m!1452541 () Bool)

(assert (=> b!1581658 m!1452541))

(assert (=> b!1581449 d!166807))

(declare-fun d!166809 () Bool)

(assert (=> d!166809 (= (get!26818 lt!676952) (v!22438 lt!676952))))

(assert (=> b!1581451 d!166809))

(declare-fun d!166811 () Bool)

(declare-fun res!1080578 () Bool)

(declare-fun e!882568 () Bool)

(assert (=> d!166811 (=> res!1080578 e!882568)))

(assert (=> d!166811 (= res!1080578 (and (is-Cons!36826 (t!51744 l!1390)) (= (_1!12799 (h!38369 (t!51744 l!1390))) key!405)))))

(assert (=> d!166811 (= (containsKey!934 (t!51744 l!1390) key!405) e!882568)))

(declare-fun b!1581664 () Bool)

(declare-fun e!882569 () Bool)

(assert (=> b!1581664 (= e!882568 e!882569)))

(declare-fun res!1080579 () Bool)

(assert (=> b!1581664 (=> (not res!1080579) (not e!882569))))

(assert (=> b!1581664 (= res!1080579 (and (or (not (is-Cons!36826 (t!51744 l!1390))) (bvsle (_1!12799 (h!38369 (t!51744 l!1390))) key!405)) (is-Cons!36826 (t!51744 l!1390)) (bvslt (_1!12799 (h!38369 (t!51744 l!1390))) key!405)))))

(declare-fun b!1581665 () Bool)

(assert (=> b!1581665 (= e!882569 (containsKey!934 (t!51744 (t!51744 l!1390)) key!405))))

(assert (= (and d!166811 (not res!1080578)) b!1581664))

(assert (= (and b!1581664 res!1080579) b!1581665))

(declare-fun m!1452543 () Bool)

(assert (=> b!1581665 m!1452543))

(assert (=> b!1581456 d!166811))

(declare-fun b!1581670 () Bool)

(declare-fun e!882572 () Bool)

(declare-fun tp!114593 () Bool)

(assert (=> b!1581670 (= e!882572 (and tp_is_empty!39241 tp!114593))))

(assert (=> b!1581448 (= tp!114578 e!882572)))

(assert (= (and b!1581448 (is-Cons!36826 (t!51744 l!1390))) b!1581670))

(push 1)

