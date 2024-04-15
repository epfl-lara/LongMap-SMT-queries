; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1764 () Bool)

(assert start!1764)

(declare-fun res!9995 () Bool)

(declare-fun e!7409 () Bool)

(assert (=> start!1764 (=> (not res!9995) (not e!7409))))

(declare-datatypes ((B!452 0))(
  ( (B!453 (val!321 Int)) )
))
(declare-datatypes ((tuple2!438 0))(
  ( (tuple2!439 (_1!219 (_ BitVec 64)) (_2!219 B!452)) )
))
(declare-datatypes ((List!369 0))(
  ( (Nil!366) (Cons!365 (h!931 tuple2!438) (t!2756 List!369)) )
))
(declare-fun l!1094 () List!369)

(declare-fun isStrictlySorted!63 (List!369) Bool)

(assert (=> start!1764 (= res!9995 (isStrictlySorted!63 l!1094))))

(assert (=> start!1764 e!7409))

(declare-fun e!7407 () Bool)

(assert (=> start!1764 e!7407))

(declare-fun tp_is_empty!625 () Bool)

(assert (=> start!1764 tp_is_empty!625))

(assert (=> start!1764 true))

(declare-fun b!12402 () Bool)

(declare-fun res!9993 () Bool)

(declare-fun e!7408 () Bool)

(assert (=> b!12402 (=> (not res!9993) (not e!7408))))

(assert (=> b!12402 (= res!9993 (isStrictlySorted!63 (t!2756 l!1094)))))

(declare-fun b!12403 () Bool)

(declare-fun res!9996 () Bool)

(assert (=> b!12403 (=> (not res!9996) (not e!7408))))

(declare-fun key!303 () (_ BitVec 64))

(declare-datatypes ((Option!53 0))(
  ( (Some!52 (v!1367 B!452)) (None!51) )
))
(declare-fun lt!3134 () Option!53)

(declare-fun getValueByKey!47 (List!369 (_ BitVec 64)) Option!53)

(assert (=> b!12403 (= res!9996 (= (getValueByKey!47 (t!2756 l!1094) key!303) lt!3134))))

(declare-fun b!12404 () Bool)

(declare-fun res!9994 () Bool)

(assert (=> b!12404 (=> (not res!9994) (not e!7408))))

(get-info :version)

(assert (=> b!12404 (= res!9994 (and ((_ is Cons!365) l!1094) (not (= (_1!219 (h!931 l!1094)) key!303))))))

(declare-fun b!12405 () Bool)

(declare-fun tp!2078 () Bool)

(assert (=> b!12405 (= e!7407 (and tp_is_empty!625 tp!2078))))

(declare-fun b!12406 () Bool)

(assert (=> b!12406 (= e!7409 e!7408)))

(declare-fun res!9997 () Bool)

(assert (=> b!12406 (=> (not res!9997) (not e!7408))))

(assert (=> b!12406 (= res!9997 (= (getValueByKey!47 l!1094 key!303) lt!3134))))

(declare-fun v!194 () B!452)

(assert (=> b!12406 (= lt!3134 (Some!52 v!194))))

(declare-fun b!12407 () Bool)

(declare-fun lt!3135 () tuple2!438)

(declare-fun contains!181 (List!369 tuple2!438) Bool)

(assert (=> b!12407 (= e!7408 (not (contains!181 l!1094 lt!3135)))))

(assert (=> b!12407 (contains!181 (t!2756 l!1094) lt!3135)))

(assert (=> b!12407 (= lt!3135 (tuple2!439 key!303 v!194))))

(declare-datatypes ((Unit!274 0))(
  ( (Unit!275) )
))
(declare-fun lt!3133 () Unit!274)

(declare-fun lemmaGetValueByKeyImpliesContainsTuple!4 (List!369 (_ BitVec 64) B!452) Unit!274)

(assert (=> b!12407 (= lt!3133 (lemmaGetValueByKeyImpliesContainsTuple!4 (t!2756 l!1094) key!303 v!194))))

(assert (= (and start!1764 res!9995) b!12406))

(assert (= (and b!12406 res!9997) b!12404))

(assert (= (and b!12404 res!9994) b!12402))

(assert (= (and b!12402 res!9993) b!12403))

(assert (= (and b!12403 res!9996) b!12407))

(assert (= (and start!1764 ((_ is Cons!365) l!1094)) b!12405))

(declare-fun m!8451 () Bool)

(assert (=> b!12407 m!8451))

(declare-fun m!8453 () Bool)

(assert (=> b!12407 m!8453))

(declare-fun m!8455 () Bool)

(assert (=> b!12407 m!8455))

(declare-fun m!8457 () Bool)

(assert (=> b!12403 m!8457))

(declare-fun m!8459 () Bool)

(assert (=> b!12402 m!8459))

(declare-fun m!8461 () Bool)

(assert (=> start!1764 m!8461))

(declare-fun m!8463 () Bool)

(assert (=> b!12406 m!8463))

(check-sat tp_is_empty!625 (not b!12402) (not b!12403) (not b!12406) (not start!1764) (not b!12407) (not b!12405))
(check-sat)
(get-model)

(declare-fun d!1753 () Bool)

(declare-fun res!10032 () Bool)

(declare-fun e!7432 () Bool)

(assert (=> d!1753 (=> res!10032 e!7432)))

(assert (=> d!1753 (= res!10032 (or ((_ is Nil!366) (t!2756 l!1094)) ((_ is Nil!366) (t!2756 (t!2756 l!1094)))))))

(assert (=> d!1753 (= (isStrictlySorted!63 (t!2756 l!1094)) e!7432)))

(declare-fun b!12448 () Bool)

(declare-fun e!7433 () Bool)

(assert (=> b!12448 (= e!7432 e!7433)))

(declare-fun res!10033 () Bool)

(assert (=> b!12448 (=> (not res!10033) (not e!7433))))

(assert (=> b!12448 (= res!10033 (bvslt (_1!219 (h!931 (t!2756 l!1094))) (_1!219 (h!931 (t!2756 (t!2756 l!1094))))))))

(declare-fun b!12449 () Bool)

(assert (=> b!12449 (= e!7433 (isStrictlySorted!63 (t!2756 (t!2756 l!1094))))))

(assert (= (and d!1753 (not res!10032)) b!12448))

(assert (= (and b!12448 res!10033) b!12449))

(declare-fun m!8493 () Bool)

(assert (=> b!12449 m!8493))

(assert (=> b!12402 d!1753))

(declare-fun d!1757 () Bool)

(declare-fun lt!3156 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!9 (List!369) (InoxSet tuple2!438))

(assert (=> d!1757 (= lt!3156 (select (content!9 l!1094) lt!3135))))

(declare-fun e!7448 () Bool)

(assert (=> d!1757 (= lt!3156 e!7448)))

(declare-fun res!10048 () Bool)

(assert (=> d!1757 (=> (not res!10048) (not e!7448))))

(assert (=> d!1757 (= res!10048 ((_ is Cons!365) l!1094))))

(assert (=> d!1757 (= (contains!181 l!1094 lt!3135) lt!3156)))

(declare-fun b!12464 () Bool)

(declare-fun e!7449 () Bool)

(assert (=> b!12464 (= e!7448 e!7449)))

(declare-fun res!10049 () Bool)

(assert (=> b!12464 (=> res!10049 e!7449)))

(assert (=> b!12464 (= res!10049 (= (h!931 l!1094) lt!3135))))

(declare-fun b!12465 () Bool)

(assert (=> b!12465 (= e!7449 (contains!181 (t!2756 l!1094) lt!3135))))

(assert (= (and d!1757 res!10048) b!12464))

(assert (= (and b!12464 (not res!10049)) b!12465))

(declare-fun m!8495 () Bool)

(assert (=> d!1757 m!8495))

(declare-fun m!8497 () Bool)

(assert (=> d!1757 m!8497))

(assert (=> b!12465 m!8453))

(assert (=> b!12407 d!1757))

(declare-fun d!1763 () Bool)

(declare-fun lt!3157 () Bool)

(assert (=> d!1763 (= lt!3157 (select (content!9 (t!2756 l!1094)) lt!3135))))

(declare-fun e!7450 () Bool)

(assert (=> d!1763 (= lt!3157 e!7450)))

(declare-fun res!10050 () Bool)

(assert (=> d!1763 (=> (not res!10050) (not e!7450))))

(assert (=> d!1763 (= res!10050 ((_ is Cons!365) (t!2756 l!1094)))))

(assert (=> d!1763 (= (contains!181 (t!2756 l!1094) lt!3135) lt!3157)))

(declare-fun b!12466 () Bool)

(declare-fun e!7451 () Bool)

(assert (=> b!12466 (= e!7450 e!7451)))

(declare-fun res!10051 () Bool)

(assert (=> b!12466 (=> res!10051 e!7451)))

(assert (=> b!12466 (= res!10051 (= (h!931 (t!2756 l!1094)) lt!3135))))

(declare-fun b!12467 () Bool)

(assert (=> b!12467 (= e!7451 (contains!181 (t!2756 (t!2756 l!1094)) lt!3135))))

(assert (= (and d!1763 res!10050) b!12466))

(assert (= (and b!12466 (not res!10051)) b!12467))

(declare-fun m!8499 () Bool)

(assert (=> d!1763 m!8499))

(declare-fun m!8501 () Bool)

(assert (=> d!1763 m!8501))

(declare-fun m!8503 () Bool)

(assert (=> b!12467 m!8503))

(assert (=> b!12407 d!1763))

(declare-fun d!1765 () Bool)

(assert (=> d!1765 (contains!181 (t!2756 l!1094) (tuple2!439 key!303 v!194))))

(declare-fun lt!3164 () Unit!274)

(declare-fun choose!163 (List!369 (_ BitVec 64) B!452) Unit!274)

(assert (=> d!1765 (= lt!3164 (choose!163 (t!2756 l!1094) key!303 v!194))))

(declare-fun e!7466 () Bool)

(assert (=> d!1765 e!7466))

(declare-fun res!10066 () Bool)

(assert (=> d!1765 (=> (not res!10066) (not e!7466))))

(assert (=> d!1765 (= res!10066 (isStrictlySorted!63 (t!2756 l!1094)))))

(assert (=> d!1765 (= (lemmaGetValueByKeyImpliesContainsTuple!4 (t!2756 l!1094) key!303 v!194) lt!3164)))

(declare-fun b!12482 () Bool)

(assert (=> b!12482 (= e!7466 (= (getValueByKey!47 (t!2756 l!1094) key!303) (Some!52 v!194)))))

(assert (= (and d!1765 res!10066) b!12482))

(declare-fun m!8507 () Bool)

(assert (=> d!1765 m!8507))

(declare-fun m!8509 () Bool)

(assert (=> d!1765 m!8509))

(assert (=> d!1765 m!8459))

(assert (=> b!12482 m!8457))

(assert (=> b!12407 d!1765))

(declare-fun b!12502 () Bool)

(declare-fun e!7480 () Option!53)

(assert (=> b!12502 (= e!7480 None!51)))

(declare-fun b!12501 () Bool)

(assert (=> b!12501 (= e!7480 (getValueByKey!47 (t!2756 l!1094) key!303))))

(declare-fun d!1771 () Bool)

(declare-fun c!1105 () Bool)

(assert (=> d!1771 (= c!1105 (and ((_ is Cons!365) l!1094) (= (_1!219 (h!931 l!1094)) key!303)))))

(declare-fun e!7479 () Option!53)

(assert (=> d!1771 (= (getValueByKey!47 l!1094 key!303) e!7479)))

(declare-fun b!12500 () Bool)

(assert (=> b!12500 (= e!7479 e!7480)))

(declare-fun c!1106 () Bool)

(assert (=> b!12500 (= c!1106 (and ((_ is Cons!365) l!1094) (not (= (_1!219 (h!931 l!1094)) key!303))))))

(declare-fun b!12499 () Bool)

(assert (=> b!12499 (= e!7479 (Some!52 (_2!219 (h!931 l!1094))))))

(assert (= (and d!1771 c!1105) b!12499))

(assert (= (and d!1771 (not c!1105)) b!12500))

(assert (= (and b!12500 c!1106) b!12501))

(assert (= (and b!12500 (not c!1106)) b!12502))

(assert (=> b!12501 m!8457))

(assert (=> b!12406 d!1771))

(declare-fun d!1781 () Bool)

(declare-fun res!10075 () Bool)

(declare-fun e!7481 () Bool)

(assert (=> d!1781 (=> res!10075 e!7481)))

(assert (=> d!1781 (= res!10075 (or ((_ is Nil!366) l!1094) ((_ is Nil!366) (t!2756 l!1094))))))

(assert (=> d!1781 (= (isStrictlySorted!63 l!1094) e!7481)))

(declare-fun b!12503 () Bool)

(declare-fun e!7482 () Bool)

(assert (=> b!12503 (= e!7481 e!7482)))

(declare-fun res!10076 () Bool)

(assert (=> b!12503 (=> (not res!10076) (not e!7482))))

(assert (=> b!12503 (= res!10076 (bvslt (_1!219 (h!931 l!1094)) (_1!219 (h!931 (t!2756 l!1094)))))))

(declare-fun b!12504 () Bool)

(assert (=> b!12504 (= e!7482 (isStrictlySorted!63 (t!2756 l!1094)))))

(assert (= (and d!1781 (not res!10075)) b!12503))

(assert (= (and b!12503 res!10076) b!12504))

(assert (=> b!12504 m!8459))

(assert (=> start!1764 d!1781))

(declare-fun b!12508 () Bool)

(declare-fun e!7484 () Option!53)

(assert (=> b!12508 (= e!7484 None!51)))

(declare-fun b!12507 () Bool)

(assert (=> b!12507 (= e!7484 (getValueByKey!47 (t!2756 (t!2756 l!1094)) key!303))))

(declare-fun d!1783 () Bool)

(declare-fun c!1107 () Bool)

(assert (=> d!1783 (= c!1107 (and ((_ is Cons!365) (t!2756 l!1094)) (= (_1!219 (h!931 (t!2756 l!1094))) key!303)))))

(declare-fun e!7483 () Option!53)

(assert (=> d!1783 (= (getValueByKey!47 (t!2756 l!1094) key!303) e!7483)))

(declare-fun b!12506 () Bool)

(assert (=> b!12506 (= e!7483 e!7484)))

(declare-fun c!1108 () Bool)

(assert (=> b!12506 (= c!1108 (and ((_ is Cons!365) (t!2756 l!1094)) (not (= (_1!219 (h!931 (t!2756 l!1094))) key!303))))))

(declare-fun b!12505 () Bool)

(assert (=> b!12505 (= e!7483 (Some!52 (_2!219 (h!931 (t!2756 l!1094)))))))

(assert (= (and d!1783 c!1107) b!12505))

(assert (= (and d!1783 (not c!1107)) b!12506))

(assert (= (and b!12506 c!1108) b!12507))

(assert (= (and b!12506 (not c!1108)) b!12508))

(declare-fun m!8531 () Bool)

(assert (=> b!12507 m!8531))

(assert (=> b!12403 d!1783))

(declare-fun b!12517 () Bool)

(declare-fun e!7491 () Bool)

(declare-fun tp!2087 () Bool)

(assert (=> b!12517 (= e!7491 (and tp_is_empty!625 tp!2087))))

(assert (=> b!12405 (= tp!2078 e!7491)))

(assert (= (and b!12405 ((_ is Cons!365) (t!2756 l!1094))) b!12517))

(check-sat (not b!12507) (not b!12449) (not b!12465) (not b!12517) (not b!12482) (not b!12467) (not b!12501) (not d!1757) (not b!12504) (not d!1765) (not d!1763) tp_is_empty!625)
(check-sat)
