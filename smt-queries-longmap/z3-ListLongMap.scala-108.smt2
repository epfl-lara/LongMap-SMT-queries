; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1764 () Bool)

(assert start!1764)

(declare-fun b!12396 () Bool)

(declare-fun e!7404 () Bool)

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

(declare-fun lt!3135 () tuple2!438)

(declare-fun contains!181 (List!369 tuple2!438) Bool)

(assert (=> b!12396 (= e!7404 (not (contains!181 l!1094 lt!3135)))))

(assert (=> b!12396 (contains!181 (t!2756 l!1094) lt!3135)))

(declare-fun key!303 () (_ BitVec 64))

(declare-fun v!194 () B!452)

(assert (=> b!12396 (= lt!3135 (tuple2!439 key!303 v!194))))

(declare-datatypes ((Unit!274 0))(
  ( (Unit!275) )
))
(declare-fun lt!3133 () Unit!274)

(declare-fun lemmaGetValueByKeyImpliesContainsTuple!4 (List!369 (_ BitVec 64) B!452) Unit!274)

(assert (=> b!12396 (= lt!3133 (lemmaGetValueByKeyImpliesContainsTuple!4 (t!2756 l!1094) key!303 v!194))))

(declare-fun b!12397 () Bool)

(declare-fun e!7405 () Bool)

(declare-fun tp_is_empty!625 () Bool)

(declare-fun tp!2078 () Bool)

(assert (=> b!12397 (= e!7405 (and tp_is_empty!625 tp!2078))))

(declare-fun b!12398 () Bool)

(declare-fun res!9995 () Bool)

(assert (=> b!12398 (=> (not res!9995) (not e!7404))))

(declare-fun isStrictlySorted!60 (List!369) Bool)

(assert (=> b!12398 (= res!9995 (isStrictlySorted!60 (t!2756 l!1094)))))

(declare-fun b!12399 () Bool)

(declare-fun res!9991 () Bool)

(assert (=> b!12399 (=> (not res!9991) (not e!7404))))

(declare-datatypes ((Option!53 0))(
  ( (Some!52 (v!1367 B!452)) (None!51) )
))
(declare-fun lt!3134 () Option!53)

(declare-fun getValueByKey!47 (List!369 (_ BitVec 64)) Option!53)

(assert (=> b!12399 (= res!9991 (= (getValueByKey!47 (t!2756 l!1094) key!303) lt!3134))))

(declare-fun b!12401 () Bool)

(declare-fun e!7403 () Bool)

(assert (=> b!12401 (= e!7403 e!7404)))

(declare-fun res!9993 () Bool)

(assert (=> b!12401 (=> (not res!9993) (not e!7404))))

(assert (=> b!12401 (= res!9993 (= (getValueByKey!47 l!1094 key!303) lt!3134))))

(assert (=> b!12401 (= lt!3134 (Some!52 v!194))))

(declare-fun b!12400 () Bool)

(declare-fun res!9994 () Bool)

(assert (=> b!12400 (=> (not res!9994) (not e!7404))))

(get-info :version)

(assert (=> b!12400 (= res!9994 (and ((_ is Cons!365) l!1094) (not (= (_1!219 (h!931 l!1094)) key!303))))))

(declare-fun res!9992 () Bool)

(assert (=> start!1764 (=> (not res!9992) (not e!7403))))

(assert (=> start!1764 (= res!9992 (isStrictlySorted!60 l!1094))))

(assert (=> start!1764 e!7403))

(assert (=> start!1764 e!7405))

(assert (=> start!1764 tp_is_empty!625))

(assert (=> start!1764 true))

(assert (= (and start!1764 res!9992) b!12401))

(assert (= (and b!12401 res!9993) b!12400))

(assert (= (and b!12400 res!9994) b!12398))

(assert (= (and b!12398 res!9995) b!12399))

(assert (= (and b!12399 res!9991) b!12396))

(assert (= (and start!1764 ((_ is Cons!365) l!1094)) b!12397))

(declare-fun m!8445 () Bool)

(assert (=> b!12398 m!8445))

(declare-fun m!8447 () Bool)

(assert (=> start!1764 m!8447))

(declare-fun m!8449 () Bool)

(assert (=> b!12401 m!8449))

(declare-fun m!8451 () Bool)

(assert (=> b!12399 m!8451))

(declare-fun m!8453 () Bool)

(assert (=> b!12396 m!8453))

(declare-fun m!8455 () Bool)

(assert (=> b!12396 m!8455))

(declare-fun m!8457 () Bool)

(assert (=> b!12396 m!8457))

(check-sat (not start!1764) (not b!12397) (not b!12399) (not b!12401) tp_is_empty!625 (not b!12396) (not b!12398))
(check-sat)
(get-model)

(declare-fun d!1749 () Bool)

(declare-fun lt!3156 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!9 (List!369) (InoxSet tuple2!438))

(assert (=> d!1749 (= lt!3156 (select (content!9 l!1094) lt!3135))))

(declare-fun e!7433 () Bool)

(assert (=> d!1749 (= lt!3156 e!7433)))

(declare-fun res!10030 () Bool)

(assert (=> d!1749 (=> (not res!10030) (not e!7433))))

(assert (=> d!1749 (= res!10030 ((_ is Cons!365) l!1094))))

(assert (=> d!1749 (= (contains!181 l!1094 lt!3135) lt!3156)))

(declare-fun b!12450 () Bool)

(declare-fun e!7432 () Bool)

(assert (=> b!12450 (= e!7433 e!7432)))

(declare-fun res!10031 () Bool)

(assert (=> b!12450 (=> res!10031 e!7432)))

(assert (=> b!12450 (= res!10031 (= (h!931 l!1094) lt!3135))))

(declare-fun b!12451 () Bool)

(assert (=> b!12451 (= e!7432 (contains!181 (t!2756 l!1094) lt!3135))))

(assert (= (and d!1749 res!10030) b!12450))

(assert (= (and b!12450 (not res!10031)) b!12451))

(declare-fun m!8487 () Bool)

(assert (=> d!1749 m!8487))

(declare-fun m!8489 () Bool)

(assert (=> d!1749 m!8489))

(assert (=> b!12451 m!8455))

(assert (=> b!12396 d!1749))

(declare-fun d!1753 () Bool)

(declare-fun lt!3157 () Bool)

(assert (=> d!1753 (= lt!3157 (select (content!9 (t!2756 l!1094)) lt!3135))))

(declare-fun e!7435 () Bool)

(assert (=> d!1753 (= lt!3157 e!7435)))

(declare-fun res!10032 () Bool)

(assert (=> d!1753 (=> (not res!10032) (not e!7435))))

(assert (=> d!1753 (= res!10032 ((_ is Cons!365) (t!2756 l!1094)))))

(assert (=> d!1753 (= (contains!181 (t!2756 l!1094) lt!3135) lt!3157)))

(declare-fun b!12452 () Bool)

(declare-fun e!7434 () Bool)

(assert (=> b!12452 (= e!7435 e!7434)))

(declare-fun res!10033 () Bool)

(assert (=> b!12452 (=> res!10033 e!7434)))

(assert (=> b!12452 (= res!10033 (= (h!931 (t!2756 l!1094)) lt!3135))))

(declare-fun b!12453 () Bool)

(assert (=> b!12453 (= e!7434 (contains!181 (t!2756 (t!2756 l!1094)) lt!3135))))

(assert (= (and d!1753 res!10032) b!12452))

(assert (= (and b!12452 (not res!10033)) b!12453))

(declare-fun m!8491 () Bool)

(assert (=> d!1753 m!8491))

(declare-fun m!8493 () Bool)

(assert (=> d!1753 m!8493))

(declare-fun m!8495 () Bool)

(assert (=> b!12453 m!8495))

(assert (=> b!12396 d!1753))

(declare-fun d!1755 () Bool)

(assert (=> d!1755 (contains!181 (t!2756 l!1094) (tuple2!439 key!303 v!194))))

(declare-fun lt!3160 () Unit!274)

(declare-fun choose!165 (List!369 (_ BitVec 64) B!452) Unit!274)

(assert (=> d!1755 (= lt!3160 (choose!165 (t!2756 l!1094) key!303 v!194))))

(declare-fun e!7448 () Bool)

(assert (=> d!1755 e!7448))

(declare-fun res!10042 () Bool)

(assert (=> d!1755 (=> (not res!10042) (not e!7448))))

(assert (=> d!1755 (= res!10042 (isStrictlySorted!60 (t!2756 l!1094)))))

(assert (=> d!1755 (= (lemmaGetValueByKeyImpliesContainsTuple!4 (t!2756 l!1094) key!303 v!194) lt!3160)))

(declare-fun b!12470 () Bool)

(assert (=> b!12470 (= e!7448 (= (getValueByKey!47 (t!2756 l!1094) key!303) (Some!52 v!194)))))

(assert (= (and d!1755 res!10042) b!12470))

(declare-fun m!8501 () Bool)

(assert (=> d!1755 m!8501))

(declare-fun m!8503 () Bool)

(assert (=> d!1755 m!8503))

(assert (=> d!1755 m!8445))

(assert (=> b!12470 m!8451))

(assert (=> b!12396 d!1755))

(declare-fun b!12492 () Bool)

(declare-fun e!7464 () Option!53)

(assert (=> b!12492 (= e!7464 None!51)))

(declare-fun b!12491 () Bool)

(assert (=> b!12491 (= e!7464 (getValueByKey!47 (t!2756 l!1094) key!303))))

(declare-fun b!12490 () Bool)

(declare-fun e!7463 () Option!53)

(assert (=> b!12490 (= e!7463 e!7464)))

(declare-fun c!1112 () Bool)

(assert (=> b!12490 (= c!1112 (and ((_ is Cons!365) l!1094) (not (= (_1!219 (h!931 l!1094)) key!303))))))

(declare-fun d!1765 () Bool)

(declare-fun c!1111 () Bool)

(assert (=> d!1765 (= c!1111 (and ((_ is Cons!365) l!1094) (= (_1!219 (h!931 l!1094)) key!303)))))

(assert (=> d!1765 (= (getValueByKey!47 l!1094 key!303) e!7463)))

(declare-fun b!12489 () Bool)

(assert (=> b!12489 (= e!7463 (Some!52 (_2!219 (h!931 l!1094))))))

(assert (= (and d!1765 c!1111) b!12489))

(assert (= (and d!1765 (not c!1111)) b!12490))

(assert (= (and b!12490 c!1112) b!12491))

(assert (= (and b!12490 (not c!1112)) b!12492))

(assert (=> b!12491 m!8451))

(assert (=> b!12401 d!1765))

(declare-fun d!1769 () Bool)

(declare-fun res!10061 () Bool)

(declare-fun e!7473 () Bool)

(assert (=> d!1769 (=> res!10061 e!7473)))

(assert (=> d!1769 (= res!10061 (or ((_ is Nil!366) l!1094) ((_ is Nil!366) (t!2756 l!1094))))))

(assert (=> d!1769 (= (isStrictlySorted!60 l!1094) e!7473)))

(declare-fun b!12501 () Bool)

(declare-fun e!7476 () Bool)

(assert (=> b!12501 (= e!7473 e!7476)))

(declare-fun res!10062 () Bool)

(assert (=> b!12501 (=> (not res!10062) (not e!7476))))

(assert (=> b!12501 (= res!10062 (bvslt (_1!219 (h!931 l!1094)) (_1!219 (h!931 (t!2756 l!1094)))))))

(declare-fun b!12502 () Bool)

(assert (=> b!12502 (= e!7476 (isStrictlySorted!60 (t!2756 l!1094)))))

(assert (= (and d!1769 (not res!10061)) b!12501))

(assert (= (and b!12501 res!10062) b!12502))

(assert (=> b!12502 m!8445))

(assert (=> start!1764 d!1769))

(declare-fun b!12508 () Bool)

(declare-fun e!7478 () Option!53)

(assert (=> b!12508 (= e!7478 None!51)))

(declare-fun b!12507 () Bool)

(assert (=> b!12507 (= e!7478 (getValueByKey!47 (t!2756 (t!2756 l!1094)) key!303))))

(declare-fun b!12506 () Bool)

(declare-fun e!7477 () Option!53)

(assert (=> b!12506 (= e!7477 e!7478)))

(declare-fun c!1114 () Bool)

(assert (=> b!12506 (= c!1114 (and ((_ is Cons!365) (t!2756 l!1094)) (not (= (_1!219 (h!931 (t!2756 l!1094))) key!303))))))

(declare-fun d!1775 () Bool)

(declare-fun c!1113 () Bool)

(assert (=> d!1775 (= c!1113 (and ((_ is Cons!365) (t!2756 l!1094)) (= (_1!219 (h!931 (t!2756 l!1094))) key!303)))))

(assert (=> d!1775 (= (getValueByKey!47 (t!2756 l!1094) key!303) e!7477)))

(declare-fun b!12505 () Bool)

(assert (=> b!12505 (= e!7477 (Some!52 (_2!219 (h!931 (t!2756 l!1094)))))))

(assert (= (and d!1775 c!1113) b!12505))

(assert (= (and d!1775 (not c!1113)) b!12506))

(assert (= (and b!12506 c!1114) b!12507))

(assert (= (and b!12506 (not c!1114)) b!12508))

(declare-fun m!8517 () Bool)

(assert (=> b!12507 m!8517))

(assert (=> b!12399 d!1775))

(declare-fun d!1777 () Bool)

(declare-fun res!10065 () Bool)

(declare-fun e!7479 () Bool)

(assert (=> d!1777 (=> res!10065 e!7479)))

(assert (=> d!1777 (= res!10065 (or ((_ is Nil!366) (t!2756 l!1094)) ((_ is Nil!366) (t!2756 (t!2756 l!1094)))))))

(assert (=> d!1777 (= (isStrictlySorted!60 (t!2756 l!1094)) e!7479)))

(declare-fun b!12509 () Bool)

(declare-fun e!7480 () Bool)

(assert (=> b!12509 (= e!7479 e!7480)))

(declare-fun res!10066 () Bool)

(assert (=> b!12509 (=> (not res!10066) (not e!7480))))

(assert (=> b!12509 (= res!10066 (bvslt (_1!219 (h!931 (t!2756 l!1094))) (_1!219 (h!931 (t!2756 (t!2756 l!1094))))))))

(declare-fun b!12510 () Bool)

(assert (=> b!12510 (= e!7480 (isStrictlySorted!60 (t!2756 (t!2756 l!1094))))))

(assert (= (and d!1777 (not res!10065)) b!12509))

(assert (= (and b!12509 res!10066) b!12510))

(declare-fun m!8519 () Bool)

(assert (=> b!12510 m!8519))

(assert (=> b!12398 d!1777))

(declare-fun b!12518 () Bool)

(declare-fun e!7486 () Bool)

(declare-fun tp!2087 () Bool)

(assert (=> b!12518 (= e!7486 (and tp_is_empty!625 tp!2087))))

(assert (=> b!12397 (= tp!2078 e!7486)))

(assert (= (and b!12397 ((_ is Cons!365) (t!2756 l!1094))) b!12518))

(check-sat (not b!12453) (not b!12518) (not b!12491) (not b!12451) (not d!1755) (not b!12502) (not b!12510) (not d!1749) tp_is_empty!625 (not b!12507) (not b!12470) (not d!1753))
(check-sat)
