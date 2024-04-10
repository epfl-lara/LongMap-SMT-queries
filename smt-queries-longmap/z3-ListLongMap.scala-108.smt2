; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1766 () Bool)

(assert start!1766)

(declare-fun b!12420 () Bool)

(declare-fun res!10011 () Bool)

(declare-fun e!7418 () Bool)

(assert (=> b!12420 (=> (not res!10011) (not e!7418))))

(declare-datatypes ((B!454 0))(
  ( (B!455 (val!322 Int)) )
))
(declare-datatypes ((tuple2!444 0))(
  ( (tuple2!445 (_1!222 (_ BitVec 64)) (_2!222 B!454)) )
))
(declare-datatypes ((List!374 0))(
  ( (Nil!371) (Cons!370 (h!936 tuple2!444) (t!2761 List!374)) )
))
(declare-fun l!1094 () List!374)

(declare-fun key!303 () (_ BitVec 64))

(get-info :version)

(assert (=> b!12420 (= res!10011 (and ((_ is Cons!370) l!1094) (not (= (_1!222 (h!936 l!1094)) key!303))))))

(declare-fun b!12421 () Bool)

(declare-fun res!10008 () Bool)

(assert (=> b!12421 (=> (not res!10008) (not e!7418))))

(declare-fun isStrictlySorted!67 (List!374) Bool)

(assert (=> b!12421 (= res!10008 (isStrictlySorted!67 (t!2761 l!1094)))))

(declare-fun b!12423 () Bool)

(declare-fun res!10012 () Bool)

(assert (=> b!12423 (=> (not res!10012) (not e!7418))))

(declare-datatypes ((Option!54 0))(
  ( (Some!53 (v!1368 B!454)) (None!52) )
))
(declare-fun lt!3144 () Option!54)

(declare-fun getValueByKey!48 (List!374 (_ BitVec 64)) Option!54)

(assert (=> b!12423 (= res!10012 (= (getValueByKey!48 (t!2761 l!1094) key!303) lt!3144))))

(declare-fun b!12422 () Bool)

(declare-fun e!7417 () Bool)

(declare-fun tp_is_empty!627 () Bool)

(declare-fun tp!2081 () Bool)

(assert (=> b!12422 (= e!7417 (and tp_is_empty!627 tp!2081))))

(declare-fun res!10010 () Bool)

(declare-fun e!7416 () Bool)

(assert (=> start!1766 (=> (not res!10010) (not e!7416))))

(assert (=> start!1766 (= res!10010 (isStrictlySorted!67 l!1094))))

(assert (=> start!1766 e!7416))

(assert (=> start!1766 e!7417))

(assert (=> start!1766 tp_is_empty!627))

(assert (=> start!1766 true))

(declare-fun b!12424 () Bool)

(assert (=> b!12424 (= e!7416 e!7418)))

(declare-fun res!10009 () Bool)

(assert (=> b!12424 (=> (not res!10009) (not e!7418))))

(assert (=> b!12424 (= res!10009 (= (getValueByKey!48 l!1094 key!303) lt!3144))))

(declare-fun v!194 () B!454)

(assert (=> b!12424 (= lt!3144 (Some!53 v!194))))

(declare-fun b!12425 () Bool)

(declare-fun lt!3142 () tuple2!444)

(declare-fun contains!184 (List!374 tuple2!444) Bool)

(assert (=> b!12425 (= e!7418 (not (contains!184 l!1094 lt!3142)))))

(assert (=> b!12425 (contains!184 (t!2761 l!1094) lt!3142)))

(assert (=> b!12425 (= lt!3142 (tuple2!445 key!303 v!194))))

(declare-datatypes ((Unit!266 0))(
  ( (Unit!267) )
))
(declare-fun lt!3143 () Unit!266)

(declare-fun lemmaGetValueByKeyImpliesContainsTuple!5 (List!374 (_ BitVec 64) B!454) Unit!266)

(assert (=> b!12425 (= lt!3143 (lemmaGetValueByKeyImpliesContainsTuple!5 (t!2761 l!1094) key!303 v!194))))

(assert (= (and start!1766 res!10010) b!12424))

(assert (= (and b!12424 res!10009) b!12420))

(assert (= (and b!12420 res!10011) b!12421))

(assert (= (and b!12421 res!10008) b!12423))

(assert (= (and b!12423 res!10012) b!12425))

(assert (= (and start!1766 ((_ is Cons!370) l!1094)) b!12422))

(declare-fun m!8467 () Bool)

(assert (=> b!12424 m!8467))

(declare-fun m!8469 () Bool)

(assert (=> b!12425 m!8469))

(declare-fun m!8471 () Bool)

(assert (=> b!12425 m!8471))

(declare-fun m!8473 () Bool)

(assert (=> b!12425 m!8473))

(declare-fun m!8475 () Bool)

(assert (=> b!12423 m!8475))

(declare-fun m!8477 () Bool)

(assert (=> start!1766 m!8477))

(declare-fun m!8479 () Bool)

(assert (=> b!12421 m!8479))

(check-sat (not b!12422) (not b!12423) (not b!12424) (not b!12425) (not start!1766) (not b!12421) tp_is_empty!627)
(check-sat)
(get-model)

(declare-fun b!12453 () Bool)

(declare-fun e!7432 () Option!54)

(declare-fun e!7433 () Option!54)

(assert (=> b!12453 (= e!7432 e!7433)))

(declare-fun c!1106 () Bool)

(assert (=> b!12453 (= c!1106 (and ((_ is Cons!370) (t!2761 l!1094)) (not (= (_1!222 (h!936 (t!2761 l!1094))) key!303))))))

(declare-fun b!12452 () Bool)

(assert (=> b!12452 (= e!7432 (Some!53 (_2!222 (h!936 (t!2761 l!1094)))))))

(declare-fun b!12454 () Bool)

(assert (=> b!12454 (= e!7433 (getValueByKey!48 (t!2761 (t!2761 l!1094)) key!303))))

(declare-fun d!1753 () Bool)

(declare-fun c!1105 () Bool)

(assert (=> d!1753 (= c!1105 (and ((_ is Cons!370) (t!2761 l!1094)) (= (_1!222 (h!936 (t!2761 l!1094))) key!303)))))

(assert (=> d!1753 (= (getValueByKey!48 (t!2761 l!1094) key!303) e!7432)))

(declare-fun b!12455 () Bool)

(assert (=> b!12455 (= e!7433 None!52)))

(assert (= (and d!1753 c!1105) b!12452))

(assert (= (and d!1753 (not c!1105)) b!12453))

(assert (= (and b!12453 c!1106) b!12454))

(assert (= (and b!12453 (not c!1106)) b!12455))

(declare-fun m!8495 () Bool)

(assert (=> b!12454 m!8495))

(assert (=> b!12423 d!1753))

(declare-fun d!1759 () Bool)

(declare-fun res!10032 () Bool)

(declare-fun e!7446 () Bool)

(assert (=> d!1759 (=> res!10032 e!7446)))

(assert (=> d!1759 (= res!10032 (or ((_ is Nil!371) l!1094) ((_ is Nil!371) (t!2761 l!1094))))))

(assert (=> d!1759 (= (isStrictlySorted!67 l!1094) e!7446)))

(declare-fun b!12476 () Bool)

(declare-fun e!7447 () Bool)

(assert (=> b!12476 (= e!7446 e!7447)))

(declare-fun res!10033 () Bool)

(assert (=> b!12476 (=> (not res!10033) (not e!7447))))

(assert (=> b!12476 (= res!10033 (bvslt (_1!222 (h!936 l!1094)) (_1!222 (h!936 (t!2761 l!1094)))))))

(declare-fun b!12477 () Bool)

(assert (=> b!12477 (= e!7447 (isStrictlySorted!67 (t!2761 l!1094)))))

(assert (= (and d!1759 (not res!10032)) b!12476))

(assert (= (and b!12476 res!10033) b!12477))

(assert (=> b!12477 m!8479))

(assert (=> start!1766 d!1759))

(declare-fun d!1761 () Bool)

(declare-fun res!10034 () Bool)

(declare-fun e!7450 () Bool)

(assert (=> d!1761 (=> res!10034 e!7450)))

(assert (=> d!1761 (= res!10034 (or ((_ is Nil!371) (t!2761 l!1094)) ((_ is Nil!371) (t!2761 (t!2761 l!1094)))))))

(assert (=> d!1761 (= (isStrictlySorted!67 (t!2761 l!1094)) e!7450)))

(declare-fun b!12482 () Bool)

(declare-fun e!7451 () Bool)

(assert (=> b!12482 (= e!7450 e!7451)))

(declare-fun res!10035 () Bool)

(assert (=> b!12482 (=> (not res!10035) (not e!7451))))

(assert (=> b!12482 (= res!10035 (bvslt (_1!222 (h!936 (t!2761 l!1094))) (_1!222 (h!936 (t!2761 (t!2761 l!1094))))))))

(declare-fun b!12483 () Bool)

(assert (=> b!12483 (= e!7451 (isStrictlySorted!67 (t!2761 (t!2761 l!1094))))))

(assert (= (and d!1761 (not res!10034)) b!12482))

(assert (= (and b!12482 res!10035) b!12483))

(declare-fun m!8497 () Bool)

(assert (=> b!12483 m!8497))

(assert (=> b!12421 d!1761))

(declare-fun d!1763 () Bool)

(declare-fun lt!3158 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!9 (List!374) (InoxSet tuple2!444))

(assert (=> d!1763 (= lt!3158 (select (content!9 l!1094) lt!3142))))

(declare-fun e!7466 () Bool)

(assert (=> d!1763 (= lt!3158 e!7466)))

(declare-fun res!10047 () Bool)

(assert (=> d!1763 (=> (not res!10047) (not e!7466))))

(assert (=> d!1763 (= res!10047 ((_ is Cons!370) l!1094))))

(assert (=> d!1763 (= (contains!184 l!1094 lt!3142) lt!3158)))

(declare-fun b!12502 () Bool)

(declare-fun e!7467 () Bool)

(assert (=> b!12502 (= e!7466 e!7467)))

(declare-fun res!10046 () Bool)

(assert (=> b!12502 (=> res!10046 e!7467)))

(assert (=> b!12502 (= res!10046 (= (h!936 l!1094) lt!3142))))

(declare-fun b!12503 () Bool)

(assert (=> b!12503 (= e!7467 (contains!184 (t!2761 l!1094) lt!3142))))

(assert (= (and d!1763 res!10047) b!12502))

(assert (= (and b!12502 (not res!10046)) b!12503))

(declare-fun m!8503 () Bool)

(assert (=> d!1763 m!8503))

(declare-fun m!8505 () Bool)

(assert (=> d!1763 m!8505))

(assert (=> b!12503 m!8471))

(assert (=> b!12425 d!1763))

(declare-fun d!1771 () Bool)

(declare-fun lt!3159 () Bool)

(assert (=> d!1771 (= lt!3159 (select (content!9 (t!2761 l!1094)) lt!3142))))

(declare-fun e!7470 () Bool)

(assert (=> d!1771 (= lt!3159 e!7470)))

(declare-fun res!10051 () Bool)

(assert (=> d!1771 (=> (not res!10051) (not e!7470))))

(assert (=> d!1771 (= res!10051 ((_ is Cons!370) (t!2761 l!1094)))))

(assert (=> d!1771 (= (contains!184 (t!2761 l!1094) lt!3142) lt!3159)))

(declare-fun b!12506 () Bool)

(declare-fun e!7471 () Bool)

(assert (=> b!12506 (= e!7470 e!7471)))

(declare-fun res!10050 () Bool)

(assert (=> b!12506 (=> res!10050 e!7471)))

(assert (=> b!12506 (= res!10050 (= (h!936 (t!2761 l!1094)) lt!3142))))

(declare-fun b!12507 () Bool)

(assert (=> b!12507 (= e!7471 (contains!184 (t!2761 (t!2761 l!1094)) lt!3142))))

(assert (= (and d!1771 res!10051) b!12506))

(assert (= (and b!12506 (not res!10050)) b!12507))

(declare-fun m!8507 () Bool)

(assert (=> d!1771 m!8507))

(declare-fun m!8509 () Bool)

(assert (=> d!1771 m!8509))

(declare-fun m!8511 () Bool)

(assert (=> b!12507 m!8511))

(assert (=> b!12425 d!1771))

(declare-fun d!1773 () Bool)

(assert (=> d!1773 (contains!184 (t!2761 l!1094) (tuple2!445 key!303 v!194))))

(declare-fun lt!3164 () Unit!266)

(declare-fun choose!164 (List!374 (_ BitVec 64) B!454) Unit!266)

(assert (=> d!1773 (= lt!3164 (choose!164 (t!2761 l!1094) key!303 v!194))))

(declare-fun e!7482 () Bool)

(assert (=> d!1773 e!7482))

(declare-fun res!10062 () Bool)

(assert (=> d!1773 (=> (not res!10062) (not e!7482))))

(assert (=> d!1773 (= res!10062 (isStrictlySorted!67 (t!2761 l!1094)))))

(assert (=> d!1773 (= (lemmaGetValueByKeyImpliesContainsTuple!5 (t!2761 l!1094) key!303 v!194) lt!3164)))

(declare-fun b!12518 () Bool)

(assert (=> b!12518 (= e!7482 (= (getValueByKey!48 (t!2761 l!1094) key!303) (Some!53 v!194)))))

(assert (= (and d!1773 res!10062) b!12518))

(declare-fun m!8525 () Bool)

(assert (=> d!1773 m!8525))

(declare-fun m!8527 () Bool)

(assert (=> d!1773 m!8527))

(assert (=> d!1773 m!8479))

(assert (=> b!12518 m!8475))

(assert (=> b!12425 d!1773))

(declare-fun b!12520 () Bool)

(declare-fun e!7483 () Option!54)

(declare-fun e!7484 () Option!54)

(assert (=> b!12520 (= e!7483 e!7484)))

(declare-fun c!1122 () Bool)

(assert (=> b!12520 (= c!1122 (and ((_ is Cons!370) l!1094) (not (= (_1!222 (h!936 l!1094)) key!303))))))

(declare-fun b!12519 () Bool)

(assert (=> b!12519 (= e!7483 (Some!53 (_2!222 (h!936 l!1094))))))

(declare-fun b!12521 () Bool)

(assert (=> b!12521 (= e!7484 (getValueByKey!48 (t!2761 l!1094) key!303))))

(declare-fun d!1783 () Bool)

(declare-fun c!1121 () Bool)

(assert (=> d!1783 (= c!1121 (and ((_ is Cons!370) l!1094) (= (_1!222 (h!936 l!1094)) key!303)))))

(assert (=> d!1783 (= (getValueByKey!48 l!1094 key!303) e!7483)))

(declare-fun b!12522 () Bool)

(assert (=> b!12522 (= e!7484 None!52)))

(assert (= (and d!1783 c!1121) b!12519))

(assert (= (and d!1783 (not c!1121)) b!12520))

(assert (= (and b!12520 c!1122) b!12521))

(assert (= (and b!12520 (not c!1122)) b!12522))

(assert (=> b!12521 m!8475))

(assert (=> b!12424 d!1783))

(declare-fun b!12531 () Bool)

(declare-fun e!7491 () Bool)

(declare-fun tp!2087 () Bool)

(assert (=> b!12531 (= e!7491 (and tp_is_empty!627 tp!2087))))

(assert (=> b!12422 (= tp!2081 e!7491)))

(assert (= (and b!12422 ((_ is Cons!370) (t!2761 l!1094))) b!12531))

(check-sat (not b!12454) (not d!1771) (not d!1763) (not d!1773) (not b!12531) tp_is_empty!627 (not b!12483) (not b!12521) (not b!12503) (not b!12477) (not b!12518) (not b!12507))
(check-sat)
