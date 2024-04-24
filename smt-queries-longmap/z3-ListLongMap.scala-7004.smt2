; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89170 () Bool)

(assert start!89170)

(declare-fun b!1021715 () Bool)

(declare-fun e!575193 () Bool)

(declare-fun e!575195 () Bool)

(assert (=> b!1021715 (= e!575193 e!575195)))

(declare-fun res!684430 () Bool)

(assert (=> b!1021715 (=> (not res!684430) (not e!575195))))

(declare-datatypes ((B!1730 0))(
  ( (B!1731 (val!11949 Int)) )
))
(declare-datatypes ((tuple2!15448 0))(
  ( (tuple2!15449 (_1!7735 (_ BitVec 64)) (_2!7735 B!1730)) )
))
(declare-datatypes ((List!21626 0))(
  ( (Nil!21623) (Cons!21622 (h!22829 tuple2!15448) (t!30628 List!21626)) )
))
(declare-fun l!1367 () List!21626)

(declare-fun lt!450368 () tuple2!15448)

(declare-fun contains!5951 (List!21626 tuple2!15448) Bool)

(assert (=> b!1021715 (= res!684430 (contains!5951 l!1367 lt!450368))))

(declare-fun key!393 () (_ BitVec 64))

(declare-fun value!188 () B!1730)

(assert (=> b!1021715 (= lt!450368 (tuple2!15449 key!393 value!188))))

(declare-fun b!1021716 () Bool)

(declare-fun e!575194 () Bool)

(assert (=> b!1021716 (= e!575195 e!575194)))

(declare-fun res!684429 () Bool)

(assert (=> b!1021716 (=> res!684429 e!575194)))

(declare-fun isStrictlySorted!690 (List!21626) Bool)

(assert (=> b!1021716 (= res!684429 (not (isStrictlySorted!690 (t!30628 l!1367))))))

(declare-fun res!684428 () Bool)

(assert (=> start!89170 (=> (not res!684428) (not e!575193))))

(assert (=> start!89170 (= res!684428 (isStrictlySorted!690 l!1367))))

(assert (=> start!89170 e!575193))

(declare-fun e!575196 () Bool)

(assert (=> start!89170 e!575196))

(assert (=> start!89170 true))

(declare-fun tp_is_empty!23797 () Bool)

(assert (=> start!89170 tp_is_empty!23797))

(declare-fun b!1021717 () Bool)

(assert (=> b!1021717 (= e!575194 (not (contains!5951 (t!30628 l!1367) lt!450368)))))

(declare-fun b!1021718 () Bool)

(declare-fun tp!71254 () Bool)

(assert (=> b!1021718 (= e!575196 (and tp_is_empty!23797 tp!71254))))

(declare-fun b!1021719 () Bool)

(declare-fun res!684431 () Bool)

(assert (=> b!1021719 (=> (not res!684431) (not e!575195))))

(get-info :version)

(assert (=> b!1021719 (= res!684431 (and ((_ is Cons!21622) l!1367) (not (= (h!22829 l!1367) lt!450368))))))

(assert (= (and start!89170 res!684428) b!1021715))

(assert (= (and b!1021715 res!684430) b!1021719))

(assert (= (and b!1021719 res!684431) b!1021716))

(assert (= (and b!1021716 (not res!684429)) b!1021717))

(assert (= (and start!89170 ((_ is Cons!21622) l!1367)) b!1021718))

(declare-fun m!942015 () Bool)

(assert (=> b!1021715 m!942015))

(declare-fun m!942017 () Bool)

(assert (=> b!1021716 m!942017))

(declare-fun m!942019 () Bool)

(assert (=> start!89170 m!942019))

(declare-fun m!942021 () Bool)

(assert (=> b!1021717 m!942021))

(check-sat (not b!1021716) (not b!1021718) (not b!1021715) tp_is_empty!23797 (not start!89170) (not b!1021717))
(check-sat)
(get-model)

(declare-fun d!122813 () Bool)

(declare-fun res!684468 () Bool)

(declare-fun e!575233 () Bool)

(assert (=> d!122813 (=> res!684468 e!575233)))

(assert (=> d!122813 (= res!684468 (or ((_ is Nil!21623) (t!30628 l!1367)) ((_ is Nil!21623) (t!30628 (t!30628 l!1367)))))))

(assert (=> d!122813 (= (isStrictlySorted!690 (t!30628 l!1367)) e!575233)))

(declare-fun b!1021760 () Bool)

(declare-fun e!575234 () Bool)

(assert (=> b!1021760 (= e!575233 e!575234)))

(declare-fun res!684469 () Bool)

(assert (=> b!1021760 (=> (not res!684469) (not e!575234))))

(assert (=> b!1021760 (= res!684469 (bvslt (_1!7735 (h!22829 (t!30628 l!1367))) (_1!7735 (h!22829 (t!30628 (t!30628 l!1367))))))))

(declare-fun b!1021761 () Bool)

(assert (=> b!1021761 (= e!575234 (isStrictlySorted!690 (t!30628 (t!30628 l!1367))))))

(assert (= (and d!122813 (not res!684468)) b!1021760))

(assert (= (and b!1021760 res!684469) b!1021761))

(declare-fun m!942039 () Bool)

(assert (=> b!1021761 m!942039))

(assert (=> b!1021716 d!122813))

(declare-fun d!122817 () Bool)

(declare-fun lt!450382 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!500 (List!21626) (InoxSet tuple2!15448))

(assert (=> d!122817 (= lt!450382 (select (content!500 l!1367) lt!450368))))

(declare-fun e!575252 () Bool)

(assert (=> d!122817 (= lt!450382 e!575252)))

(declare-fun res!684487 () Bool)

(assert (=> d!122817 (=> (not res!684487) (not e!575252))))

(assert (=> d!122817 (= res!684487 ((_ is Cons!21622) l!1367))))

(assert (=> d!122817 (= (contains!5951 l!1367 lt!450368) lt!450382)))

(declare-fun b!1021780 () Bool)

(declare-fun e!575251 () Bool)

(assert (=> b!1021780 (= e!575252 e!575251)))

(declare-fun res!684486 () Bool)

(assert (=> b!1021780 (=> res!684486 e!575251)))

(assert (=> b!1021780 (= res!684486 (= (h!22829 l!1367) lt!450368))))

(declare-fun b!1021781 () Bool)

(assert (=> b!1021781 (= e!575251 (contains!5951 (t!30628 l!1367) lt!450368))))

(assert (= (and d!122817 res!684487) b!1021780))

(assert (= (and b!1021780 (not res!684486)) b!1021781))

(declare-fun m!942047 () Bool)

(assert (=> d!122817 m!942047))

(declare-fun m!942049 () Bool)

(assert (=> d!122817 m!942049))

(assert (=> b!1021781 m!942021))

(assert (=> b!1021715 d!122817))

(declare-fun d!122823 () Bool)

(declare-fun res!684490 () Bool)

(declare-fun e!575255 () Bool)

(assert (=> d!122823 (=> res!684490 e!575255)))

(assert (=> d!122823 (= res!684490 (or ((_ is Nil!21623) l!1367) ((_ is Nil!21623) (t!30628 l!1367))))))

(assert (=> d!122823 (= (isStrictlySorted!690 l!1367) e!575255)))

(declare-fun b!1021784 () Bool)

(declare-fun e!575256 () Bool)

(assert (=> b!1021784 (= e!575255 e!575256)))

(declare-fun res!684491 () Bool)

(assert (=> b!1021784 (=> (not res!684491) (not e!575256))))

(assert (=> b!1021784 (= res!684491 (bvslt (_1!7735 (h!22829 l!1367)) (_1!7735 (h!22829 (t!30628 l!1367)))))))

(declare-fun b!1021785 () Bool)

(assert (=> b!1021785 (= e!575256 (isStrictlySorted!690 (t!30628 l!1367)))))

(assert (= (and d!122823 (not res!684490)) b!1021784))

(assert (= (and b!1021784 res!684491) b!1021785))

(assert (=> b!1021785 m!942017))

(assert (=> start!89170 d!122823))

(declare-fun d!122827 () Bool)

(declare-fun lt!450384 () Bool)

(assert (=> d!122827 (= lt!450384 (select (content!500 (t!30628 l!1367)) lt!450368))))

(declare-fun e!575260 () Bool)

(assert (=> d!122827 (= lt!450384 e!575260)))

(declare-fun res!684495 () Bool)

(assert (=> d!122827 (=> (not res!684495) (not e!575260))))

(assert (=> d!122827 (= res!684495 ((_ is Cons!21622) (t!30628 l!1367)))))

(assert (=> d!122827 (= (contains!5951 (t!30628 l!1367) lt!450368) lt!450384)))

(declare-fun b!1021788 () Bool)

(declare-fun e!575259 () Bool)

(assert (=> b!1021788 (= e!575260 e!575259)))

(declare-fun res!684494 () Bool)

(assert (=> b!1021788 (=> res!684494 e!575259)))

(assert (=> b!1021788 (= res!684494 (= (h!22829 (t!30628 l!1367)) lt!450368))))

(declare-fun b!1021789 () Bool)

(assert (=> b!1021789 (= e!575259 (contains!5951 (t!30628 (t!30628 l!1367)) lt!450368))))

(assert (= (and d!122827 res!684495) b!1021788))

(assert (= (and b!1021788 (not res!684494)) b!1021789))

(declare-fun m!942059 () Bool)

(assert (=> d!122827 m!942059))

(declare-fun m!942061 () Bool)

(assert (=> d!122827 m!942061))

(declare-fun m!942063 () Bool)

(assert (=> b!1021789 m!942063))

(assert (=> b!1021717 d!122827))

(declare-fun b!1021804 () Bool)

(declare-fun e!575271 () Bool)

(declare-fun tp!71265 () Bool)

(assert (=> b!1021804 (= e!575271 (and tp_is_empty!23797 tp!71265))))

(assert (=> b!1021718 (= tp!71254 e!575271)))

(assert (= (and b!1021718 ((_ is Cons!21622) (t!30628 l!1367))) b!1021804))

(check-sat (not b!1021804) (not d!122817) (not b!1021785) (not d!122827) (not b!1021781) (not b!1021761) tp_is_empty!23797 (not b!1021789))
(check-sat)
