; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75132 () Bool)

(assert start!75132)

(declare-fun res!601419 () Bool)

(declare-fun e!492887 () Bool)

(assert (=> start!75132 (=> (not res!601419) (not e!492887))))

(declare-datatypes ((B!1270 0))(
  ( (B!1271 (val!8941 Int)) )
))
(declare-datatypes ((tuple2!11876 0))(
  ( (tuple2!11877 (_1!5949 (_ BitVec 64)) (_2!5949 B!1270)) )
))
(declare-datatypes ((List!17657 0))(
  ( (Nil!17654) (Cons!17653 (h!18784 tuple2!11876) (t!24934 List!17657)) )
))
(declare-fun l!906 () List!17657)

(declare-fun isStrictlySorted!478 (List!17657) Bool)

(assert (=> start!75132 (= res!601419 (isStrictlySorted!478 l!906))))

(assert (=> start!75132 e!492887))

(declare-fun e!492888 () Bool)

(assert (=> start!75132 e!492888))

(assert (=> start!75132 true))

(declare-fun tp_is_empty!17781 () Bool)

(assert (=> start!75132 tp_is_empty!17781))

(declare-fun b!885614 () Bool)

(declare-fun res!601420 () Bool)

(assert (=> b!885614 (=> (not res!601420) (not e!492887))))

(declare-fun key1!49 () (_ BitVec 64))

(get-info :version)

(assert (=> b!885614 (= res!601420 (or (not ((_ is Cons!17653) l!906)) (bvsge (_1!5949 (h!18784 l!906)) key1!49)))))

(declare-fun b!885615 () Bool)

(declare-fun v1!38 () B!1270)

(declare-fun insertStrictlySorted!295 (List!17657 (_ BitVec 64) B!1270) List!17657)

(assert (=> b!885615 (= e!492887 (not (isStrictlySorted!478 (insertStrictlySorted!295 l!906 key1!49 v1!38))))))

(declare-fun b!885616 () Bool)

(declare-fun tp!54287 () Bool)

(assert (=> b!885616 (= e!492888 (and tp_is_empty!17781 tp!54287))))

(assert (= (and start!75132 res!601419) b!885614))

(assert (= (and b!885614 res!601420) b!885615))

(assert (= (and start!75132 ((_ is Cons!17653) l!906)) b!885616))

(declare-fun m!825787 () Bool)

(assert (=> start!75132 m!825787))

(declare-fun m!825789 () Bool)

(assert (=> b!885615 m!825789))

(assert (=> b!885615 m!825789))

(declare-fun m!825791 () Bool)

(assert (=> b!885615 m!825791))

(check-sat (not start!75132) (not b!885615) (not b!885616) tp_is_empty!17781)
(check-sat)
(get-model)

(declare-fun d!109421 () Bool)

(declare-fun res!601431 () Bool)

(declare-fun e!492899 () Bool)

(assert (=> d!109421 (=> res!601431 e!492899)))

(assert (=> d!109421 (= res!601431 (or ((_ is Nil!17654) l!906) ((_ is Nil!17654) (t!24934 l!906))))))

(assert (=> d!109421 (= (isStrictlySorted!478 l!906) e!492899)))

(declare-fun b!885630 () Bool)

(declare-fun e!492900 () Bool)

(assert (=> b!885630 (= e!492899 e!492900)))

(declare-fun res!601432 () Bool)

(assert (=> b!885630 (=> (not res!601432) (not e!492900))))

(assert (=> b!885630 (= res!601432 (bvslt (_1!5949 (h!18784 l!906)) (_1!5949 (h!18784 (t!24934 l!906)))))))

(declare-fun b!885631 () Bool)

(assert (=> b!885631 (= e!492900 (isStrictlySorted!478 (t!24934 l!906)))))

(assert (= (and d!109421 (not res!601431)) b!885630))

(assert (= (and b!885630 res!601432) b!885631))

(declare-fun m!825799 () Bool)

(assert (=> b!885631 m!825799))

(assert (=> start!75132 d!109421))

(declare-fun d!109427 () Bool)

(declare-fun res!601433 () Bool)

(declare-fun e!492901 () Bool)

(assert (=> d!109427 (=> res!601433 e!492901)))

(assert (=> d!109427 (= res!601433 (or ((_ is Nil!17654) (insertStrictlySorted!295 l!906 key1!49 v1!38)) ((_ is Nil!17654) (t!24934 (insertStrictlySorted!295 l!906 key1!49 v1!38)))))))

(assert (=> d!109427 (= (isStrictlySorted!478 (insertStrictlySorted!295 l!906 key1!49 v1!38)) e!492901)))

(declare-fun b!885632 () Bool)

(declare-fun e!492902 () Bool)

(assert (=> b!885632 (= e!492901 e!492902)))

(declare-fun res!601434 () Bool)

(assert (=> b!885632 (=> (not res!601434) (not e!492902))))

(assert (=> b!885632 (= res!601434 (bvslt (_1!5949 (h!18784 (insertStrictlySorted!295 l!906 key1!49 v1!38))) (_1!5949 (h!18784 (t!24934 (insertStrictlySorted!295 l!906 key1!49 v1!38))))))))

(declare-fun b!885633 () Bool)

(assert (=> b!885633 (= e!492902 (isStrictlySorted!478 (t!24934 (insertStrictlySorted!295 l!906 key1!49 v1!38))))))

(assert (= (and d!109427 (not res!601433)) b!885632))

(assert (= (and b!885632 res!601434) b!885633))

(declare-fun m!825801 () Bool)

(assert (=> b!885633 m!825801))

(assert (=> b!885615 d!109427))

(declare-fun bm!39125 () Bool)

(declare-fun call!39129 () List!17657)

(declare-fun call!39130 () List!17657)

(assert (=> bm!39125 (= call!39129 call!39130)))

(declare-fun e!492933 () Bool)

(declare-fun lt!401038 () List!17657)

(declare-fun b!885670 () Bool)

(declare-fun contains!4293 (List!17657 tuple2!11876) Bool)

(assert (=> b!885670 (= e!492933 (contains!4293 lt!401038 (tuple2!11877 key1!49 v1!38)))))

(declare-fun b!885671 () Bool)

(declare-fun res!601456 () Bool)

(assert (=> b!885671 (=> (not res!601456) (not e!492933))))

(declare-fun containsKey!410 (List!17657 (_ BitVec 64)) Bool)

(assert (=> b!885671 (= res!601456 (containsKey!410 lt!401038 key1!49))))

(declare-fun b!885672 () Bool)

(declare-fun e!492932 () List!17657)

(assert (=> b!885672 (= e!492932 call!39130)))

(declare-fun b!885673 () Bool)

(declare-fun c!93327 () Bool)

(declare-fun e!492929 () List!17657)

(declare-fun c!93326 () Bool)

(assert (=> b!885673 (= e!492929 (ite c!93327 (t!24934 l!906) (ite c!93326 (Cons!17653 (h!18784 l!906) (t!24934 l!906)) Nil!17654)))))

(declare-fun d!109429 () Bool)

(assert (=> d!109429 e!492933))

(declare-fun res!601455 () Bool)

(assert (=> d!109429 (=> (not res!601455) (not e!492933))))

(assert (=> d!109429 (= res!601455 (isStrictlySorted!478 lt!401038))))

(declare-fun e!492931 () List!17657)

(assert (=> d!109429 (= lt!401038 e!492931)))

(declare-fun c!93328 () Bool)

(assert (=> d!109429 (= c!93328 (and ((_ is Cons!17653) l!906) (bvslt (_1!5949 (h!18784 l!906)) key1!49)))))

(assert (=> d!109429 (isStrictlySorted!478 l!906)))

(assert (=> d!109429 (= (insertStrictlySorted!295 l!906 key1!49 v1!38) lt!401038)))

(declare-fun b!885674 () Bool)

(assert (=> b!885674 (= e!492929 (insertStrictlySorted!295 (t!24934 l!906) key1!49 v1!38))))

(declare-fun b!885675 () Bool)

(declare-fun e!492930 () List!17657)

(assert (=> b!885675 (= e!492930 call!39129)))

(declare-fun b!885676 () Bool)

(assert (=> b!885676 (= e!492931 e!492932)))

(assert (=> b!885676 (= c!93327 (and ((_ is Cons!17653) l!906) (= (_1!5949 (h!18784 l!906)) key1!49)))))

(declare-fun b!885677 () Bool)

(assert (=> b!885677 (= e!492930 call!39129)))

(declare-fun bm!39126 () Bool)

(declare-fun call!39128 () List!17657)

(assert (=> bm!39126 (= call!39130 call!39128)))

(declare-fun b!885678 () Bool)

(assert (=> b!885678 (= e!492931 call!39128)))

(declare-fun b!885679 () Bool)

(assert (=> b!885679 (= c!93326 (and ((_ is Cons!17653) l!906) (bvsgt (_1!5949 (h!18784 l!906)) key1!49)))))

(assert (=> b!885679 (= e!492932 e!492930)))

(declare-fun bm!39127 () Bool)

(declare-fun $colon$colon!545 (List!17657 tuple2!11876) List!17657)

(assert (=> bm!39127 (= call!39128 ($colon$colon!545 e!492929 (ite c!93328 (h!18784 l!906) (tuple2!11877 key1!49 v1!38))))))

(declare-fun c!93329 () Bool)

(assert (=> bm!39127 (= c!93329 c!93328)))

(assert (= (and d!109429 c!93328) b!885678))

(assert (= (and d!109429 (not c!93328)) b!885676))

(assert (= (and b!885676 c!93327) b!885672))

(assert (= (and b!885676 (not c!93327)) b!885679))

(assert (= (and b!885679 c!93326) b!885677))

(assert (= (and b!885679 (not c!93326)) b!885675))

(assert (= (or b!885677 b!885675) bm!39125))

(assert (= (or b!885672 bm!39125) bm!39126))

(assert (= (or b!885678 bm!39126) bm!39127))

(assert (= (and bm!39127 c!93329) b!885674))

(assert (= (and bm!39127 (not c!93329)) b!885673))

(assert (= (and d!109429 res!601455) b!885671))

(assert (= (and b!885671 res!601456) b!885670))

(declare-fun m!825811 () Bool)

(assert (=> b!885670 m!825811))

(declare-fun m!825813 () Bool)

(assert (=> d!109429 m!825813))

(assert (=> d!109429 m!825787))

(declare-fun m!825815 () Bool)

(assert (=> b!885671 m!825815))

(declare-fun m!825817 () Bool)

(assert (=> b!885674 m!825817))

(declare-fun m!825819 () Bool)

(assert (=> bm!39127 m!825819))

(assert (=> b!885615 d!109429))

(declare-fun b!885708 () Bool)

(declare-fun e!492948 () Bool)

(declare-fun tp!54293 () Bool)

(assert (=> b!885708 (= e!492948 (and tp_is_empty!17781 tp!54293))))

(assert (=> b!885616 (= tp!54287 e!492948)))

(assert (= (and b!885616 ((_ is Cons!17653) (t!24934 l!906))) b!885708))

(check-sat (not b!885631) tp_is_empty!17781 (not b!885671) (not d!109429) (not b!885674) (not b!885633) (not bm!39127) (not b!885708) (not b!885670))
(check-sat)
