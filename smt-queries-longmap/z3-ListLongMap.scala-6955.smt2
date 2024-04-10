; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87728 () Bool)

(assert start!87728)

(declare-fun b!1014536 () Bool)

(declare-fun res!680799 () Bool)

(declare-fun e!570729 () Bool)

(assert (=> b!1014536 (=> (not res!680799) (not e!570729))))

(declare-datatypes ((B!1438 0))(
  ( (B!1439 (val!11803 Int)) )
))
(declare-datatypes ((tuple2!15152 0))(
  ( (tuple2!15153 (_1!7587 (_ BitVec 64)) (_2!7587 B!1438)) )
))
(declare-datatypes ((List!21438 0))(
  ( (Nil!21435) (Cons!21434 (h!22632 tuple2!15152) (t!30439 List!21438)) )
))
(declare-fun l!412 () List!21438)

(declare-fun value!115 () B!1438)

(get-info :version)

(assert (=> b!1014536 (= res!680799 (and (not (= (_2!7587 (h!22632 l!412)) value!115)) ((_ is Cons!21434) l!412)))))

(declare-fun b!1014538 () Bool)

(declare-fun ListPrimitiveSize!116 (List!21438) Int)

(assert (=> b!1014538 (= e!570729 (>= (ListPrimitiveSize!116 (t!30439 l!412)) (ListPrimitiveSize!116 l!412)))))

(declare-fun res!680797 () Bool)

(assert (=> start!87728 (=> (not res!680797) (not e!570729))))

(declare-fun isStrictlySorted!577 (List!21438) Bool)

(assert (=> start!87728 (= res!680797 (isStrictlySorted!577 l!412))))

(assert (=> start!87728 e!570729))

(declare-fun e!570730 () Bool)

(assert (=> start!87728 e!570730))

(declare-fun tp_is_empty!23505 () Bool)

(assert (=> start!87728 tp_is_empty!23505))

(declare-fun b!1014537 () Bool)

(declare-fun res!680798 () Bool)

(assert (=> b!1014537 (=> (not res!680798) (not e!570729))))

(declare-datatypes ((List!21439 0))(
  ( (Nil!21436) (Cons!21435 (h!22633 (_ BitVec 64)) (t!30440 List!21439)) )
))
(declare-fun isEmpty!837 (List!21439) Bool)

(declare-fun getKeysOf!50 (List!21438 B!1438) List!21439)

(assert (=> b!1014537 (= res!680798 (not (isEmpty!837 (getKeysOf!50 (t!30439 l!412) value!115))))))

(declare-fun b!1014539 () Bool)

(declare-fun tp!70541 () Bool)

(assert (=> b!1014539 (= e!570730 (and tp_is_empty!23505 tp!70541))))

(assert (= (and start!87728 res!680797) b!1014536))

(assert (= (and b!1014536 res!680799) b!1014537))

(assert (= (and b!1014537 res!680798) b!1014538))

(assert (= (and start!87728 ((_ is Cons!21434) l!412)) b!1014539))

(declare-fun m!937087 () Bool)

(assert (=> b!1014538 m!937087))

(declare-fun m!937089 () Bool)

(assert (=> b!1014538 m!937089))

(declare-fun m!937091 () Bool)

(assert (=> start!87728 m!937091))

(declare-fun m!937093 () Bool)

(assert (=> b!1014537 m!937093))

(assert (=> b!1014537 m!937093))

(declare-fun m!937095 () Bool)

(assert (=> b!1014537 m!937095))

(check-sat (not b!1014537) (not b!1014539) tp_is_empty!23505 (not start!87728) (not b!1014538))
(check-sat)
(get-model)

(declare-fun d!120775 () Bool)

(declare-fun res!680813 () Bool)

(declare-fun e!570741 () Bool)

(assert (=> d!120775 (=> res!680813 e!570741)))

(assert (=> d!120775 (= res!680813 (or ((_ is Nil!21435) l!412) ((_ is Nil!21435) (t!30439 l!412))))))

(assert (=> d!120775 (= (isStrictlySorted!577 l!412) e!570741)))

(declare-fun b!1014556 () Bool)

(declare-fun e!570742 () Bool)

(assert (=> b!1014556 (= e!570741 e!570742)))

(declare-fun res!680814 () Bool)

(assert (=> b!1014556 (=> (not res!680814) (not e!570742))))

(assert (=> b!1014556 (= res!680814 (bvslt (_1!7587 (h!22632 l!412)) (_1!7587 (h!22632 (t!30439 l!412)))))))

(declare-fun b!1014557 () Bool)

(assert (=> b!1014557 (= e!570742 (isStrictlySorted!577 (t!30439 l!412)))))

(assert (= (and d!120775 (not res!680813)) b!1014556))

(assert (= (and b!1014556 res!680814) b!1014557))

(declare-fun m!937107 () Bool)

(assert (=> b!1014557 m!937107))

(assert (=> start!87728 d!120775))

(declare-fun d!120779 () Bool)

(declare-fun lt!448616 () Int)

(assert (=> d!120779 (>= lt!448616 0)))

(declare-fun e!570751 () Int)

(assert (=> d!120779 (= lt!448616 e!570751)))

(declare-fun c!102708 () Bool)

(assert (=> d!120779 (= c!102708 ((_ is Nil!21435) (t!30439 l!412)))))

(assert (=> d!120779 (= (ListPrimitiveSize!116 (t!30439 l!412)) lt!448616)))

(declare-fun b!1014570 () Bool)

(assert (=> b!1014570 (= e!570751 0)))

(declare-fun b!1014571 () Bool)

(assert (=> b!1014571 (= e!570751 (+ 1 (ListPrimitiveSize!116 (t!30439 (t!30439 l!412)))))))

(assert (= (and d!120779 c!102708) b!1014570))

(assert (= (and d!120779 (not c!102708)) b!1014571))

(declare-fun m!937111 () Bool)

(assert (=> b!1014571 m!937111))

(assert (=> b!1014538 d!120779))

(declare-fun d!120783 () Bool)

(declare-fun lt!448617 () Int)

(assert (=> d!120783 (>= lt!448617 0)))

(declare-fun e!570754 () Int)

(assert (=> d!120783 (= lt!448617 e!570754)))

(declare-fun c!102711 () Bool)

(assert (=> d!120783 (= c!102711 ((_ is Nil!21435) l!412))))

(assert (=> d!120783 (= (ListPrimitiveSize!116 l!412) lt!448617)))

(declare-fun b!1014574 () Bool)

(assert (=> b!1014574 (= e!570754 0)))

(declare-fun b!1014575 () Bool)

(assert (=> b!1014575 (= e!570754 (+ 1 (ListPrimitiveSize!116 (t!30439 l!412))))))

(assert (= (and d!120783 c!102711) b!1014574))

(assert (= (and d!120783 (not c!102711)) b!1014575))

(assert (=> b!1014575 m!937087))

(assert (=> b!1014538 d!120783))

(declare-fun d!120785 () Bool)

(assert (=> d!120785 (= (isEmpty!837 (getKeysOf!50 (t!30439 l!412) value!115)) ((_ is Nil!21436) (getKeysOf!50 (t!30439 l!412) value!115)))))

(assert (=> b!1014537 d!120785))

(declare-fun b!1014638 () Bool)

(assert (=> b!1014638 true))

(assert (=> b!1014638 true))

(assert (=> b!1014638 true))

(declare-fun bs!29277 () Bool)

(declare-fun b!1014639 () Bool)

(assert (= bs!29277 (and b!1014639 b!1014638)))

(declare-fun lambda!723 () Int)

(declare-fun lt!448694 () tuple2!15152)

(declare-fun lt!448686 () tuple2!15152)

(declare-fun lt!448685 () List!21438)

(declare-fun lambda!725 () Int)

(declare-fun lt!448689 () List!21438)

(assert (=> bs!29277 (= (= (Cons!21434 lt!448694 lt!448685) (Cons!21434 lt!448686 lt!448689)) (= lambda!725 lambda!723))))

(assert (=> b!1014639 true))

(assert (=> b!1014639 true))

(assert (=> b!1014639 true))

(declare-fun bs!29279 () Bool)

(declare-fun d!120789 () Bool)

(assert (= bs!29279 (and d!120789 b!1014638)))

(declare-fun lambda!727 () Int)

(assert (=> bs!29279 (= (= (t!30439 l!412) (Cons!21434 lt!448686 lt!448689)) (= lambda!727 lambda!723))))

(declare-fun bs!29281 () Bool)

(assert (= bs!29281 (and d!120789 b!1014639)))

(assert (=> bs!29281 (= (= (t!30439 l!412) (Cons!21434 lt!448694 lt!448685)) (= lambda!727 lambda!725))))

(assert (=> d!120789 true))

(assert (=> d!120789 true))

(declare-fun b!1014634 () Bool)

(declare-fun e!570790 () List!21439)

(assert (=> b!1014634 (= e!570790 Nil!21436)))

(declare-fun lt!448687 () List!21439)

(declare-fun forall!242 (List!21439 Int) Bool)

(assert (=> d!120789 (forall!242 lt!448687 lambda!727)))

(declare-fun e!570787 () List!21439)

(assert (=> d!120789 (= lt!448687 e!570787)))

(declare-fun c!102739 () Bool)

(assert (=> d!120789 (= c!102739 (and ((_ is Cons!21434) (t!30439 l!412)) (= (_2!7587 (h!22632 (t!30439 l!412))) value!115)))))

(assert (=> d!120789 (isStrictlySorted!577 (t!30439 l!412))))

(assert (=> d!120789 (= (getKeysOf!50 (t!30439 l!412) value!115) lt!448687)))

(declare-fun b!1014635 () Bool)

(declare-datatypes ((Unit!33177 0))(
  ( (Unit!33178) )
))
(declare-fun e!570788 () Unit!33177)

(declare-fun Unit!33179 () Unit!33177)

(assert (=> b!1014635 (= e!570788 Unit!33179)))

(declare-fun bm!42827 () Bool)

(declare-fun call!42833 () Bool)

(declare-fun call!42831 () List!21439)

(assert (=> bm!42827 (= call!42833 (isEmpty!837 call!42831))))

(declare-fun b!1014636 () Bool)

(assert (=> b!1014636 (= e!570787 (Cons!21435 (_1!7587 (h!22632 (t!30439 l!412))) call!42831))))

(declare-fun c!102741 () Bool)

(assert (=> b!1014636 (= c!102741 (not call!42833))))

(declare-fun lt!448692 () Unit!33177)

(assert (=> b!1014636 (= lt!448692 e!570788)))

(declare-fun b!1014637 () Bool)

(declare-fun lt!448691 () Unit!33177)

(declare-fun e!570789 () Unit!33177)

(assert (=> b!1014637 (= lt!448691 e!570789)))

(declare-fun c!102740 () Bool)

(assert (=> b!1014637 (= c!102740 (not call!42833))))

(declare-fun lt!448690 () List!21439)

(assert (=> b!1014637 (= lt!448690 call!42831)))

(assert (=> b!1014637 (= e!570790 call!42831)))

(declare-fun call!42832 () Bool)

(assert (=> b!1014638 call!42832))

(declare-fun lt!448688 () Unit!33177)

(declare-fun call!42830 () Unit!33177)

(assert (=> b!1014638 (= lt!448688 call!42830)))

(assert (=> b!1014638 (= lt!448686 (h!22632 (t!30439 l!412)))))

(declare-fun lt!448693 () List!21439)

(assert (=> b!1014638 (= lt!448693 call!42831)))

(assert (=> b!1014638 (= lt!448689 (t!30439 (t!30439 l!412)))))

(assert (=> b!1014638 (= e!570788 lt!448688)))

(declare-fun lt!448695 () List!21439)

(declare-fun bm!42828 () Bool)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!36 (List!21438 List!21439 B!1438 tuple2!15152) Unit!33177)

(assert (=> bm!42828 (= call!42830 (lemmaForallGetValueByKeySameWithASmallerHead!36 (ite c!102739 lt!448689 lt!448685) (ite c!102739 lt!448693 lt!448695) value!115 (ite c!102739 lt!448686 lt!448694)))))

(declare-fun lt!448684 () Unit!33177)

(assert (=> b!1014639 (= e!570789 lt!448684)))

(assert (=> b!1014639 (= lt!448685 (t!30439 (t!30439 l!412)))))

(assert (=> b!1014639 (= lt!448695 call!42831)))

(assert (=> b!1014639 (= lt!448694 (h!22632 (t!30439 l!412)))))

(assert (=> b!1014639 (= lt!448684 call!42830)))

(assert (=> b!1014639 call!42832))

(declare-fun bm!42829 () Bool)

(assert (=> bm!42829 (= call!42832 (forall!242 (ite c!102739 lt!448693 lt!448695) (ite c!102739 lambda!723 lambda!725)))))

(declare-fun bm!42830 () Bool)

(assert (=> bm!42830 (= call!42831 (getKeysOf!50 (t!30439 (t!30439 l!412)) value!115))))

(declare-fun b!1014640 () Bool)

(assert (=> b!1014640 (= e!570787 e!570790)))

(declare-fun c!102738 () Bool)

(assert (=> b!1014640 (= c!102738 (and ((_ is Cons!21434) (t!30439 l!412)) (not (= (_2!7587 (h!22632 (t!30439 l!412))) value!115))))))

(declare-fun b!1014641 () Bool)

(declare-fun Unit!33183 () Unit!33177)

(assert (=> b!1014641 (= e!570789 Unit!33183)))

(assert (= (and d!120789 c!102739) b!1014636))

(assert (= (and d!120789 (not c!102739)) b!1014640))

(assert (= (and b!1014636 c!102741) b!1014638))

(assert (= (and b!1014636 (not c!102741)) b!1014635))

(assert (= (and b!1014640 c!102738) b!1014637))

(assert (= (and b!1014640 (not c!102738)) b!1014634))

(assert (= (and b!1014637 c!102740) b!1014639))

(assert (= (and b!1014637 (not c!102740)) b!1014641))

(assert (= (or b!1014638 b!1014639) bm!42828))

(assert (= (or b!1014638 b!1014639) bm!42829))

(assert (= (or b!1014636 b!1014638 b!1014637 b!1014639) bm!42830))

(assert (= (or b!1014636 b!1014637) bm!42827))

(declare-fun m!937119 () Bool)

(assert (=> bm!42829 m!937119))

(declare-fun m!937127 () Bool)

(assert (=> bm!42828 m!937127))

(declare-fun m!937129 () Bool)

(assert (=> bm!42830 m!937129))

(declare-fun m!937133 () Bool)

(assert (=> bm!42827 m!937133))

(declare-fun m!937135 () Bool)

(assert (=> d!120789 m!937135))

(assert (=> d!120789 m!937107))

(assert (=> b!1014537 d!120789))

(declare-fun b!1014670 () Bool)

(declare-fun e!570799 () Bool)

(declare-fun tp!70549 () Bool)

(assert (=> b!1014670 (= e!570799 (and tp_is_empty!23505 tp!70549))))

(assert (=> b!1014539 (= tp!70541 e!570799)))

(assert (= (and b!1014539 ((_ is Cons!21434) (t!30439 l!412))) b!1014670))

(check-sat (not b!1014670) (not bm!42829) tp_is_empty!23505 (not b!1014557) (not b!1014571) (not b!1014575) (not bm!42828) (not bm!42827) (not d!120789) (not bm!42830))
(check-sat)
