; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87392 () Bool)

(assert start!87392)

(declare-fun res!680085 () Bool)

(declare-fun e!569634 () Bool)

(assert (=> start!87392 (=> (not res!680085) (not e!569634))))

(declare-datatypes ((B!1354 0))(
  ( (B!1355 (val!11761 Int)) )
))
(declare-datatypes ((tuple2!15068 0))(
  ( (tuple2!15069 (_1!7545 (_ BitVec 64)) (_2!7545 B!1354)) )
))
(declare-datatypes ((List!21369 0))(
  ( (Nil!21366) (Cons!21365 (h!22563 tuple2!15068) (t!30370 List!21369)) )
))
(declare-fun l!412 () List!21369)

(declare-fun isStrictlySorted!541 (List!21369) Bool)

(assert (=> start!87392 (= res!680085 (isStrictlySorted!541 l!412))))

(assert (=> start!87392 e!569634))

(declare-fun e!569635 () Bool)

(assert (=> start!87392 e!569635))

(declare-fun tp_is_empty!23421 () Bool)

(assert (=> start!87392 tp_is_empty!23421))

(declare-fun b!1012607 () Bool)

(declare-fun res!680084 () Bool)

(assert (=> b!1012607 (=> (not res!680084) (not e!569634))))

(declare-fun value!115 () B!1354)

(get-info :version)

(assert (=> b!1012607 (= res!680084 (and (not (= (_2!7545 (h!22563 l!412)) value!115)) ((_ is Cons!21365) l!412)))))

(declare-fun b!1012610 () Bool)

(declare-fun tp!70322 () Bool)

(assert (=> b!1012610 (= e!569635 (and tp_is_empty!23421 tp!70322))))

(declare-fun b!1012609 () Bool)

(assert (=> b!1012609 (= e!569634 (not (isStrictlySorted!541 (t!30370 l!412))))))

(declare-fun b!1012608 () Bool)

(declare-fun res!680083 () Bool)

(assert (=> b!1012608 (=> (not res!680083) (not e!569634))))

(declare-datatypes ((List!21370 0))(
  ( (Nil!21367) (Cons!21366 (h!22564 (_ BitVec 64)) (t!30371 List!21370)) )
))
(declare-fun isEmpty!796 (List!21370) Bool)

(declare-fun getKeysOf!23 (List!21369 B!1354) List!21370)

(assert (=> b!1012608 (= res!680083 (not (isEmpty!796 (getKeysOf!23 (t!30370 l!412) value!115))))))

(assert (= (and start!87392 res!680085) b!1012607))

(assert (= (and b!1012607 res!680084) b!1012608))

(assert (= (and b!1012608 res!680083) b!1012609))

(assert (= (and start!87392 ((_ is Cons!21365) l!412)) b!1012610))

(declare-fun m!936069 () Bool)

(assert (=> start!87392 m!936069))

(declare-fun m!936071 () Bool)

(assert (=> b!1012609 m!936071))

(declare-fun m!936073 () Bool)

(assert (=> b!1012608 m!936073))

(assert (=> b!1012608 m!936073))

(declare-fun m!936075 () Bool)

(assert (=> b!1012608 m!936075))

(check-sat tp_is_empty!23421 (not b!1012610) (not b!1012608) (not b!1012609) (not start!87392))
(check-sat)
(get-model)

(declare-fun d!120315 () Bool)

(assert (=> d!120315 (= (isEmpty!796 (getKeysOf!23 (t!30370 l!412) value!115)) ((_ is Nil!21367) (getKeysOf!23 (t!30370 l!412) value!115)))))

(assert (=> b!1012608 d!120315))

(declare-fun b!1012684 () Bool)

(assert (=> b!1012684 true))

(assert (=> b!1012684 true))

(assert (=> b!1012684 true))

(declare-fun bs!28833 () Bool)

(declare-fun b!1012683 () Bool)

(assert (= bs!28833 (and b!1012683 b!1012684)))

(declare-fun lt!447647 () tuple2!15068)

(declare-fun lt!447654 () List!21369)

(declare-fun lt!447653 () tuple2!15068)

(declare-fun lambda!388 () Int)

(declare-fun lt!447651 () List!21369)

(declare-fun lambda!387 () Int)

(assert (=> bs!28833 (= (= (Cons!21365 lt!447647 lt!447654) (Cons!21365 lt!447653 lt!447651)) (= lambda!388 lambda!387))))

(assert (=> b!1012683 true))

(assert (=> b!1012683 true))

(assert (=> b!1012683 true))

(declare-fun bs!28834 () Bool)

(declare-fun d!120317 () Bool)

(assert (= bs!28834 (and d!120317 b!1012684)))

(declare-fun lambda!389 () Int)

(assert (=> bs!28834 (= (= (t!30370 l!412) (Cons!21365 lt!447653 lt!447651)) (= lambda!389 lambda!387))))

(declare-fun bs!28835 () Bool)

(assert (= bs!28835 (and d!120317 b!1012683)))

(assert (=> bs!28835 (= (= (t!30370 l!412) (Cons!21365 lt!447647 lt!447654)) (= lambda!389 lambda!388))))

(assert (=> d!120317 true))

(assert (=> d!120317 true))

(declare-fun bm!42563 () Bool)

(declare-fun call!42568 () List!21370)

(assert (=> bm!42563 (= call!42568 (getKeysOf!23 (t!30370 (t!30370 l!412)) value!115))))

(declare-fun b!1012677 () Bool)

(declare-datatypes ((Unit!33079 0))(
  ( (Unit!33080) )
))
(declare-fun e!569678 () Unit!33079)

(declare-fun Unit!33081 () Unit!33079)

(assert (=> b!1012677 (= e!569678 Unit!33081)))

(declare-fun bm!42564 () Bool)

(declare-fun lt!447655 () List!21370)

(declare-fun c!102335 () Bool)

(declare-fun call!42566 () Bool)

(declare-fun lt!447649 () List!21370)

(declare-fun forall!216 (List!21370 Int) Bool)

(assert (=> bm!42564 (= call!42566 (forall!216 (ite c!102335 lt!447649 lt!447655) (ite c!102335 lambda!387 lambda!388)))))

(declare-fun b!1012678 () Bool)

(declare-fun lt!447646 () Unit!33079)

(assert (=> b!1012678 (= lt!447646 e!569678)))

(declare-fun c!102336 () Bool)

(declare-fun call!42567 () Bool)

(assert (=> b!1012678 (= c!102336 (not call!42567))))

(declare-fun lt!447652 () List!21370)

(assert (=> b!1012678 (= lt!447652 call!42568)))

(declare-fun e!569676 () List!21370)

(assert (=> b!1012678 (= e!569676 call!42568)))

(declare-fun b!1012680 () Bool)

(declare-fun e!569679 () List!21370)

(assert (=> b!1012680 (= e!569679 (Cons!21366 (_1!7545 (h!22563 (t!30370 l!412))) call!42568))))

(declare-fun c!102333 () Bool)

(assert (=> b!1012680 (= c!102333 (not call!42567))))

(declare-fun lt!447650 () Unit!33079)

(declare-fun e!569677 () Unit!33079)

(assert (=> b!1012680 (= lt!447650 e!569677)))

(declare-fun b!1012681 () Bool)

(declare-fun Unit!33084 () Unit!33079)

(assert (=> b!1012681 (= e!569677 Unit!33084)))

(declare-fun b!1012682 () Bool)

(assert (=> b!1012682 (= e!569679 e!569676)))

(declare-fun c!102334 () Bool)

(assert (=> b!1012682 (= c!102334 (and ((_ is Cons!21365) (t!30370 l!412)) (not (= (_2!7545 (h!22563 (t!30370 l!412))) value!115))))))

(declare-fun bm!42565 () Bool)

(assert (=> bm!42565 (= call!42567 (isEmpty!796 call!42568))))

(declare-fun bm!42566 () Bool)

(declare-fun call!42569 () Unit!33079)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!14 (List!21369 List!21370 B!1354 tuple2!15068) Unit!33079)

(assert (=> bm!42566 (= call!42569 (lemmaForallGetValueByKeySameWithASmallerHead!14 (ite c!102335 lt!447651 lt!447654) (ite c!102335 lt!447649 lt!447655) value!115 (ite c!102335 lt!447653 lt!447647)))))

(declare-fun lt!447656 () Unit!33079)

(assert (=> b!1012683 (= e!569678 lt!447656)))

(assert (=> b!1012683 (= lt!447654 (t!30370 (t!30370 l!412)))))

(assert (=> b!1012683 (= lt!447655 call!42568)))

(assert (=> b!1012683 (= lt!447647 (h!22563 (t!30370 l!412)))))

(assert (=> b!1012683 (= lt!447656 call!42569)))

(assert (=> b!1012683 call!42566))

(assert (=> b!1012684 call!42566))

(declare-fun lt!447648 () Unit!33079)

(assert (=> b!1012684 (= lt!447648 call!42569)))

(assert (=> b!1012684 (= lt!447653 (h!22563 (t!30370 l!412)))))

(assert (=> b!1012684 (= lt!447649 call!42568)))

(assert (=> b!1012684 (= lt!447651 (t!30370 (t!30370 l!412)))))

(assert (=> b!1012684 (= e!569677 lt!447648)))

(declare-fun b!1012679 () Bool)

(assert (=> b!1012679 (= e!569676 Nil!21367)))

(declare-fun lt!447657 () List!21370)

(assert (=> d!120317 (forall!216 lt!447657 lambda!389)))

(assert (=> d!120317 (= lt!447657 e!569679)))

(assert (=> d!120317 (= c!102335 (and ((_ is Cons!21365) (t!30370 l!412)) (= (_2!7545 (h!22563 (t!30370 l!412))) value!115)))))

(assert (=> d!120317 (isStrictlySorted!541 (t!30370 l!412))))

(assert (=> d!120317 (= (getKeysOf!23 (t!30370 l!412) value!115) lt!447657)))

(assert (= (and d!120317 c!102335) b!1012680))

(assert (= (and d!120317 (not c!102335)) b!1012682))

(assert (= (and b!1012680 c!102333) b!1012684))

(assert (= (and b!1012680 (not c!102333)) b!1012681))

(assert (= (and b!1012682 c!102334) b!1012678))

(assert (= (and b!1012682 (not c!102334)) b!1012679))

(assert (= (and b!1012678 c!102336) b!1012683))

(assert (= (and b!1012678 (not c!102336)) b!1012677))

(assert (= (or b!1012684 b!1012683) bm!42566))

(assert (= (or b!1012684 b!1012683) bm!42564))

(assert (= (or b!1012680 b!1012684 b!1012683 b!1012678) bm!42563))

(assert (= (or b!1012680 b!1012678) bm!42565))

(declare-fun m!936087 () Bool)

(assert (=> bm!42563 m!936087))

(declare-fun m!936089 () Bool)

(assert (=> bm!42564 m!936089))

(declare-fun m!936091 () Bool)

(assert (=> bm!42565 m!936091))

(declare-fun m!936093 () Bool)

(assert (=> d!120317 m!936093))

(assert (=> d!120317 m!936071))

(declare-fun m!936095 () Bool)

(assert (=> bm!42566 m!936095))

(assert (=> b!1012608 d!120317))

(declare-fun d!120333 () Bool)

(declare-fun res!680113 () Bool)

(declare-fun e!569688 () Bool)

(assert (=> d!120333 (=> res!680113 e!569688)))

(assert (=> d!120333 (= res!680113 (or ((_ is Nil!21366) l!412) ((_ is Nil!21366) (t!30370 l!412))))))

(assert (=> d!120333 (= (isStrictlySorted!541 l!412) e!569688)))

(declare-fun b!1012709 () Bool)

(declare-fun e!569689 () Bool)

(assert (=> b!1012709 (= e!569688 e!569689)))

(declare-fun res!680114 () Bool)

(assert (=> b!1012709 (=> (not res!680114) (not e!569689))))

(assert (=> b!1012709 (= res!680114 (bvslt (_1!7545 (h!22563 l!412)) (_1!7545 (h!22563 (t!30370 l!412)))))))

(declare-fun b!1012710 () Bool)

(assert (=> b!1012710 (= e!569689 (isStrictlySorted!541 (t!30370 l!412)))))

(assert (= (and d!120333 (not res!680113)) b!1012709))

(assert (= (and b!1012709 res!680114) b!1012710))

(assert (=> b!1012710 m!936071))

(assert (=> start!87392 d!120333))

(declare-fun d!120337 () Bool)

(declare-fun res!680117 () Bool)

(declare-fun e!569692 () Bool)

(assert (=> d!120337 (=> res!680117 e!569692)))

(assert (=> d!120337 (= res!680117 (or ((_ is Nil!21366) (t!30370 l!412)) ((_ is Nil!21366) (t!30370 (t!30370 l!412)))))))

(assert (=> d!120337 (= (isStrictlySorted!541 (t!30370 l!412)) e!569692)))

(declare-fun b!1012713 () Bool)

(declare-fun e!569693 () Bool)

(assert (=> b!1012713 (= e!569692 e!569693)))

(declare-fun res!680118 () Bool)

(assert (=> b!1012713 (=> (not res!680118) (not e!569693))))

(assert (=> b!1012713 (= res!680118 (bvslt (_1!7545 (h!22563 (t!30370 l!412))) (_1!7545 (h!22563 (t!30370 (t!30370 l!412))))))))

(declare-fun b!1012714 () Bool)

(assert (=> b!1012714 (= e!569693 (isStrictlySorted!541 (t!30370 (t!30370 l!412))))))

(assert (= (and d!120337 (not res!680117)) b!1012713))

(assert (= (and b!1012713 res!680118) b!1012714))

(declare-fun m!936109 () Bool)

(assert (=> b!1012714 m!936109))

(assert (=> b!1012609 d!120337))

(declare-fun b!1012724 () Bool)

(declare-fun e!569699 () Bool)

(declare-fun tp!70331 () Bool)

(assert (=> b!1012724 (= e!569699 (and tp_is_empty!23421 tp!70331))))

(assert (=> b!1012610 (= tp!70322 e!569699)))

(assert (= (and b!1012610 ((_ is Cons!21365) (t!30370 l!412))) b!1012724))

(check-sat (not d!120317) tp_is_empty!23421 (not b!1012710) (not bm!42566) (not b!1012714) (not bm!42563) (not bm!42565) (not bm!42564) (not b!1012724))
(check-sat)
