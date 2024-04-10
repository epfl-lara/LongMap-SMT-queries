; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88980 () Bool)

(assert start!88980)

(declare-fun b!1020663 () Bool)

(declare-fun e!574545 () Bool)

(declare-fun tp_is_empty!23811 () Bool)

(declare-fun tp!71293 () Bool)

(assert (=> b!1020663 (= e!574545 (and tp_is_empty!23811 tp!71293))))

(declare-fun b!1020664 () Bool)

(declare-fun res!684115 () Bool)

(declare-fun e!574543 () Bool)

(assert (=> b!1020664 (=> (not res!684115) (not e!574543))))

(declare-datatypes ((B!1744 0))(
  ( (B!1745 (val!11956 Int)) )
))
(declare-datatypes ((tuple2!15458 0))(
  ( (tuple2!15459 (_1!7740 (_ BitVec 64)) (_2!7740 B!1744)) )
))
(declare-datatypes ((List!21644 0))(
  ( (Nil!21641) (Cons!21640 (h!22838 tuple2!15458) (t!30654 List!21644)) )
))
(declare-fun l!1367 () List!21644)

(declare-fun lt!449916 () tuple2!15458)

(declare-fun contains!5935 (List!21644 tuple2!15458) Bool)

(assert (=> b!1020664 (= res!684115 (contains!5935 (t!30654 l!1367) lt!449916))))

(declare-fun res!684113 () Bool)

(declare-fun e!574544 () Bool)

(assert (=> start!88980 (=> (not res!684113) (not e!574544))))

(declare-fun isStrictlySorted!709 (List!21644) Bool)

(assert (=> start!88980 (= res!684113 (isStrictlySorted!709 l!1367))))

(assert (=> start!88980 e!574544))

(assert (=> start!88980 e!574545))

(assert (=> start!88980 true))

(assert (=> start!88980 tp_is_empty!23811))

(declare-fun b!1020665 () Bool)

(assert (=> b!1020665 (= e!574544 e!574543)))

(declare-fun res!684116 () Bool)

(assert (=> b!1020665 (=> (not res!684116) (not e!574543))))

(assert (=> b!1020665 (= res!684116 (contains!5935 l!1367 lt!449916))))

(declare-fun key!393 () (_ BitVec 64))

(declare-fun value!188 () B!1744)

(assert (=> b!1020665 (= lt!449916 (tuple2!15459 key!393 value!188))))

(declare-fun b!1020666 () Bool)

(declare-fun res!684112 () Bool)

(assert (=> b!1020666 (=> (not res!684112) (not e!574543))))

(assert (=> b!1020666 (= res!684112 (isStrictlySorted!709 (t!30654 l!1367)))))

(declare-fun b!1020667 () Bool)

(declare-fun res!684114 () Bool)

(assert (=> b!1020667 (=> (not res!684114) (not e!574543))))

(get-info :version)

(assert (=> b!1020667 (= res!684114 (and ((_ is Cons!21640) l!1367) (not (= (h!22838 l!1367) lt!449916))))))

(declare-fun b!1020668 () Bool)

(declare-fun containsKey!554 (List!21644 (_ BitVec 64)) Bool)

(assert (=> b!1020668 (= e!574543 (not (containsKey!554 l!1367 key!393)))))

(assert (=> b!1020668 (containsKey!554 (t!30654 l!1367) key!393)))

(declare-datatypes ((Unit!33301 0))(
  ( (Unit!33302) )
))
(declare-fun lt!449915 () Unit!33301)

(declare-fun lemmaContainsTupleThenContainsKey!14 (List!21644 (_ BitVec 64) B!1744) Unit!33301)

(assert (=> b!1020668 (= lt!449915 (lemmaContainsTupleThenContainsKey!14 (t!30654 l!1367) key!393 value!188))))

(assert (= (and start!88980 res!684113) b!1020665))

(assert (= (and b!1020665 res!684116) b!1020667))

(assert (= (and b!1020667 res!684114) b!1020666))

(assert (= (and b!1020666 res!684112) b!1020664))

(assert (= (and b!1020664 res!684115) b!1020668))

(assert (= (and start!88980 ((_ is Cons!21640) l!1367)) b!1020663))

(declare-fun m!940503 () Bool)

(assert (=> b!1020664 m!940503))

(declare-fun m!940505 () Bool)

(assert (=> start!88980 m!940505))

(declare-fun m!940507 () Bool)

(assert (=> b!1020665 m!940507))

(declare-fun m!940509 () Bool)

(assert (=> b!1020666 m!940509))

(declare-fun m!940511 () Bool)

(assert (=> b!1020668 m!940511))

(declare-fun m!940513 () Bool)

(assert (=> b!1020668 m!940513))

(declare-fun m!940515 () Bool)

(assert (=> b!1020668 m!940515))

(check-sat tp_is_empty!23811 (not b!1020666) (not b!1020668) (not b!1020664) (not start!88980) (not b!1020665) (not b!1020663))
(check-sat)
(get-model)

(declare-fun d!122413 () Bool)

(declare-fun res!684140 () Bool)

(declare-fun e!574563 () Bool)

(assert (=> d!122413 (=> res!684140 e!574563)))

(assert (=> d!122413 (= res!684140 (and ((_ is Cons!21640) l!1367) (= (_1!7740 (h!22838 l!1367)) key!393)))))

(assert (=> d!122413 (= (containsKey!554 l!1367 key!393) e!574563)))

(declare-fun b!1020695 () Bool)

(declare-fun e!574564 () Bool)

(assert (=> b!1020695 (= e!574563 e!574564)))

(declare-fun res!684141 () Bool)

(assert (=> b!1020695 (=> (not res!684141) (not e!574564))))

(assert (=> b!1020695 (= res!684141 (and (or (not ((_ is Cons!21640) l!1367)) (bvsle (_1!7740 (h!22838 l!1367)) key!393)) ((_ is Cons!21640) l!1367) (bvslt (_1!7740 (h!22838 l!1367)) key!393)))))

(declare-fun b!1020696 () Bool)

(assert (=> b!1020696 (= e!574564 (containsKey!554 (t!30654 l!1367) key!393))))

(assert (= (and d!122413 (not res!684140)) b!1020695))

(assert (= (and b!1020695 res!684141) b!1020696))

(assert (=> b!1020696 m!940513))

(assert (=> b!1020668 d!122413))

(declare-fun d!122419 () Bool)

(declare-fun res!684146 () Bool)

(declare-fun e!574569 () Bool)

(assert (=> d!122419 (=> res!684146 e!574569)))

(assert (=> d!122419 (= res!684146 (and ((_ is Cons!21640) (t!30654 l!1367)) (= (_1!7740 (h!22838 (t!30654 l!1367))) key!393)))))

(assert (=> d!122419 (= (containsKey!554 (t!30654 l!1367) key!393) e!574569)))

(declare-fun b!1020701 () Bool)

(declare-fun e!574570 () Bool)

(assert (=> b!1020701 (= e!574569 e!574570)))

(declare-fun res!684147 () Bool)

(assert (=> b!1020701 (=> (not res!684147) (not e!574570))))

(assert (=> b!1020701 (= res!684147 (and (or (not ((_ is Cons!21640) (t!30654 l!1367))) (bvsle (_1!7740 (h!22838 (t!30654 l!1367))) key!393)) ((_ is Cons!21640) (t!30654 l!1367)) (bvslt (_1!7740 (h!22838 (t!30654 l!1367))) key!393)))))

(declare-fun b!1020702 () Bool)

(assert (=> b!1020702 (= e!574570 (containsKey!554 (t!30654 (t!30654 l!1367)) key!393))))

(assert (= (and d!122419 (not res!684146)) b!1020701))

(assert (= (and b!1020701 res!684147) b!1020702))

(declare-fun m!940531 () Bool)

(assert (=> b!1020702 m!940531))

(assert (=> b!1020668 d!122419))

(declare-fun d!122421 () Bool)

(assert (=> d!122421 (containsKey!554 (t!30654 l!1367) key!393)))

(declare-fun lt!449927 () Unit!33301)

(declare-fun choose!1678 (List!21644 (_ BitVec 64) B!1744) Unit!33301)

(assert (=> d!122421 (= lt!449927 (choose!1678 (t!30654 l!1367) key!393 value!188))))

(declare-fun e!574583 () Bool)

(assert (=> d!122421 e!574583))

(declare-fun res!684160 () Bool)

(assert (=> d!122421 (=> (not res!684160) (not e!574583))))

(assert (=> d!122421 (= res!684160 (isStrictlySorted!709 (t!30654 l!1367)))))

(assert (=> d!122421 (= (lemmaContainsTupleThenContainsKey!14 (t!30654 l!1367) key!393 value!188) lt!449927)))

(declare-fun b!1020715 () Bool)

(assert (=> b!1020715 (= e!574583 (contains!5935 (t!30654 l!1367) (tuple2!15459 key!393 value!188)))))

(assert (= (and d!122421 res!684160) b!1020715))

(assert (=> d!122421 m!940513))

(declare-fun m!940537 () Bool)

(assert (=> d!122421 m!940537))

(assert (=> d!122421 m!940509))

(declare-fun m!940539 () Bool)

(assert (=> b!1020715 m!940539))

(assert (=> b!1020668 d!122421))

(declare-fun d!122431 () Bool)

(declare-fun lt!449936 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!502 (List!21644) (InoxSet tuple2!15458))

(assert (=> d!122431 (= lt!449936 (select (content!502 (t!30654 l!1367)) lt!449916))))

(declare-fun e!574596 () Bool)

(assert (=> d!122431 (= lt!449936 e!574596)))

(declare-fun res!684174 () Bool)

(assert (=> d!122431 (=> (not res!684174) (not e!574596))))

(assert (=> d!122431 (= res!684174 ((_ is Cons!21640) (t!30654 l!1367)))))

(assert (=> d!122431 (= (contains!5935 (t!30654 l!1367) lt!449916) lt!449936)))

(declare-fun b!1020728 () Bool)

(declare-fun e!574597 () Bool)

(assert (=> b!1020728 (= e!574596 e!574597)))

(declare-fun res!684173 () Bool)

(assert (=> b!1020728 (=> res!684173 e!574597)))

(assert (=> b!1020728 (= res!684173 (= (h!22838 (t!30654 l!1367)) lt!449916))))

(declare-fun b!1020729 () Bool)

(assert (=> b!1020729 (= e!574597 (contains!5935 (t!30654 (t!30654 l!1367)) lt!449916))))

(assert (= (and d!122431 res!684174) b!1020728))

(assert (= (and b!1020728 (not res!684173)) b!1020729))

(declare-fun m!940549 () Bool)

(assert (=> d!122431 m!940549))

(declare-fun m!940551 () Bool)

(assert (=> d!122431 m!940551))

(declare-fun m!940553 () Bool)

(assert (=> b!1020729 m!940553))

(assert (=> b!1020664 d!122431))

(declare-fun d!122437 () Bool)

(declare-fun res!684193 () Bool)

(declare-fun e!574616 () Bool)

(assert (=> d!122437 (=> res!684193 e!574616)))

(assert (=> d!122437 (= res!684193 (or ((_ is Nil!21641) l!1367) ((_ is Nil!21641) (t!30654 l!1367))))))

(assert (=> d!122437 (= (isStrictlySorted!709 l!1367) e!574616)))

(declare-fun b!1020748 () Bool)

(declare-fun e!574617 () Bool)

(assert (=> b!1020748 (= e!574616 e!574617)))

(declare-fun res!684194 () Bool)

(assert (=> b!1020748 (=> (not res!684194) (not e!574617))))

(assert (=> b!1020748 (= res!684194 (bvslt (_1!7740 (h!22838 l!1367)) (_1!7740 (h!22838 (t!30654 l!1367)))))))

(declare-fun b!1020749 () Bool)

(assert (=> b!1020749 (= e!574617 (isStrictlySorted!709 (t!30654 l!1367)))))

(assert (= (and d!122437 (not res!684193)) b!1020748))

(assert (= (and b!1020748 res!684194) b!1020749))

(assert (=> b!1020749 m!940509))

(assert (=> start!88980 d!122437))

(declare-fun d!122445 () Bool)

(declare-fun lt!449938 () Bool)

(assert (=> d!122445 (= lt!449938 (select (content!502 l!1367) lt!449916))))

(declare-fun e!574618 () Bool)

(assert (=> d!122445 (= lt!449938 e!574618)))

(declare-fun res!684196 () Bool)

(assert (=> d!122445 (=> (not res!684196) (not e!574618))))

(assert (=> d!122445 (= res!684196 ((_ is Cons!21640) l!1367))))

(assert (=> d!122445 (= (contains!5935 l!1367 lt!449916) lt!449938)))

(declare-fun b!1020750 () Bool)

(declare-fun e!574619 () Bool)

(assert (=> b!1020750 (= e!574618 e!574619)))

(declare-fun res!684195 () Bool)

(assert (=> b!1020750 (=> res!684195 e!574619)))

(assert (=> b!1020750 (= res!684195 (= (h!22838 l!1367) lt!449916))))

(declare-fun b!1020751 () Bool)

(assert (=> b!1020751 (= e!574619 (contains!5935 (t!30654 l!1367) lt!449916))))

(assert (= (and d!122445 res!684196) b!1020750))

(assert (= (and b!1020750 (not res!684195)) b!1020751))

(declare-fun m!940563 () Bool)

(assert (=> d!122445 m!940563))

(declare-fun m!940565 () Bool)

(assert (=> d!122445 m!940565))

(assert (=> b!1020751 m!940503))

(assert (=> b!1020665 d!122445))

(declare-fun d!122449 () Bool)

(declare-fun res!684201 () Bool)

(declare-fun e!574624 () Bool)

(assert (=> d!122449 (=> res!684201 e!574624)))

(assert (=> d!122449 (= res!684201 (or ((_ is Nil!21641) (t!30654 l!1367)) ((_ is Nil!21641) (t!30654 (t!30654 l!1367)))))))

(assert (=> d!122449 (= (isStrictlySorted!709 (t!30654 l!1367)) e!574624)))

(declare-fun b!1020756 () Bool)

(declare-fun e!574625 () Bool)

(assert (=> b!1020756 (= e!574624 e!574625)))

(declare-fun res!684202 () Bool)

(assert (=> b!1020756 (=> (not res!684202) (not e!574625))))

(assert (=> b!1020756 (= res!684202 (bvslt (_1!7740 (h!22838 (t!30654 l!1367))) (_1!7740 (h!22838 (t!30654 (t!30654 l!1367))))))))

(declare-fun b!1020757 () Bool)

(assert (=> b!1020757 (= e!574625 (isStrictlySorted!709 (t!30654 (t!30654 l!1367))))))

(assert (= (and d!122449 (not res!684201)) b!1020756))

(assert (= (and b!1020756 res!684202) b!1020757))

(declare-fun m!940569 () Bool)

(assert (=> b!1020757 m!940569))

(assert (=> b!1020666 d!122449))

(declare-fun b!1020772 () Bool)

(declare-fun e!574636 () Bool)

(declare-fun tp!71301 () Bool)

(assert (=> b!1020772 (= e!574636 (and tp_is_empty!23811 tp!71301))))

(assert (=> b!1020663 (= tp!71293 e!574636)))

(assert (= (and b!1020663 ((_ is Cons!21640) (t!30654 l!1367))) b!1020772))

(check-sat (not d!122431) (not d!122421) (not b!1020729) (not b!1020702) (not b!1020715) (not b!1020751) (not b!1020696) (not b!1020757) tp_is_empty!23811 (not b!1020749) (not d!122445) (not b!1020772))
(check-sat)
