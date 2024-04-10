; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87512 () Bool)

(assert start!87512)

(declare-fun b!1013304 () Bool)

(declare-fun res!680367 () Bool)

(declare-fun e!570027 () Bool)

(assert (=> b!1013304 (=> (not res!680367) (not e!570027))))

(declare-datatypes ((B!1402 0))(
  ( (B!1403 (val!11785 Int)) )
))
(declare-datatypes ((tuple2!15116 0))(
  ( (tuple2!15117 (_1!7569 (_ BitVec 64)) (_2!7569 B!1402)) )
))
(declare-datatypes ((List!21405 0))(
  ( (Nil!21402) (Cons!21401 (h!22599 tuple2!15116) (t!30406 List!21405)) )
))
(declare-fun l!412 () List!21405)

(declare-fun value!115 () B!1402)

(declare-datatypes ((List!21406 0))(
  ( (Nil!21403) (Cons!21402 (h!22600 (_ BitVec 64)) (t!30407 List!21406)) )
))
(declare-fun isEmpty!814 (List!21406) Bool)

(declare-fun getKeysOf!35 (List!21405 B!1402) List!21406)

(assert (=> b!1013304 (= res!680367 (not (isEmpty!814 (getKeysOf!35 (t!30406 l!412) value!115))))))

(declare-fun b!1013303 () Bool)

(declare-fun res!680366 () Bool)

(assert (=> b!1013303 (=> (not res!680366) (not e!570027))))

(get-info :version)

(assert (=> b!1013303 (= res!680366 (and ((_ is Cons!21401) l!412) (= (_2!7569 (h!22599 l!412)) value!115)))))

(declare-fun b!1013306 () Bool)

(declare-fun e!570028 () Bool)

(declare-fun tp_is_empty!23469 () Bool)

(declare-fun tp!70430 () Bool)

(assert (=> b!1013306 (= e!570028 (and tp_is_empty!23469 tp!70430))))

(declare-fun res!680365 () Bool)

(assert (=> start!87512 (=> (not res!680365) (not e!570027))))

(declare-fun isStrictlySorted!559 (List!21405) Bool)

(assert (=> start!87512 (= res!680365 (isStrictlySorted!559 l!412))))

(assert (=> start!87512 e!570027))

(assert (=> start!87512 e!570028))

(assert (=> start!87512 tp_is_empty!23469))

(declare-fun b!1013305 () Bool)

(declare-fun ListPrimitiveSize!104 (List!21405) Int)

(assert (=> b!1013305 (= e!570027 (>= (ListPrimitiveSize!104 (t!30406 l!412)) (ListPrimitiveSize!104 l!412)))))

(assert (= (and start!87512 res!680365) b!1013303))

(assert (= (and b!1013303 res!680366) b!1013304))

(assert (= (and b!1013304 res!680367) b!1013305))

(assert (= (and start!87512 ((_ is Cons!21401) l!412)) b!1013306))

(declare-fun m!936367 () Bool)

(assert (=> b!1013304 m!936367))

(assert (=> b!1013304 m!936367))

(declare-fun m!936369 () Bool)

(assert (=> b!1013304 m!936369))

(declare-fun m!936371 () Bool)

(assert (=> start!87512 m!936371))

(declare-fun m!936373 () Bool)

(assert (=> b!1013305 m!936373))

(declare-fun m!936375 () Bool)

(assert (=> b!1013305 m!936375))

(check-sat (not b!1013304) tp_is_empty!23469 (not b!1013306) (not b!1013305) (not start!87512))
(check-sat)
(get-model)

(declare-fun d!120435 () Bool)

(assert (=> d!120435 (= (isEmpty!814 (getKeysOf!35 (t!30406 l!412) value!115)) ((_ is Nil!21403) (getKeysOf!35 (t!30406 l!412) value!115)))))

(assert (=> b!1013304 d!120435))

(declare-fun b!1013440 () Bool)

(assert (=> b!1013440 true))

(assert (=> b!1013440 true))

(assert (=> b!1013440 true))

(declare-fun bs!28920 () Bool)

(declare-fun b!1013436 () Bool)

(assert (= bs!28920 (and b!1013436 b!1013440)))

(declare-fun lambda!505 () Int)

(declare-fun lt!448002 () tuple2!15116)

(declare-fun lambda!504 () Int)

(declare-fun lt!448001 () List!21405)

(declare-fun lt!448005 () tuple2!15116)

(declare-fun lt!448008 () List!21405)

(assert (=> bs!28920 (= (= (Cons!21401 lt!448005 lt!448008) (Cons!21401 lt!448002 lt!448001)) (= lambda!505 lambda!504))))

(assert (=> b!1013436 true))

(assert (=> b!1013436 true))

(assert (=> b!1013436 true))

(declare-fun bs!28921 () Bool)

(declare-fun d!120441 () Bool)

(assert (= bs!28921 (and d!120441 b!1013440)))

(declare-fun lambda!506 () Int)

(assert (=> bs!28921 (= (= (t!30406 l!412) (Cons!21401 lt!448002 lt!448001)) (= lambda!506 lambda!504))))

(declare-fun bs!28922 () Bool)

(assert (= bs!28922 (and d!120441 b!1013436)))

(assert (=> bs!28922 (= (= (t!30406 l!412) (Cons!21401 lt!448005 lt!448008)) (= lambda!506 lambda!505))))

(assert (=> d!120441 true))

(assert (=> d!120441 true))

(declare-fun b!1013433 () Bool)

(declare-fun e!570096 () List!21406)

(assert (=> b!1013433 (= e!570096 Nil!21403)))

(declare-fun lt!448007 () List!21406)

(declare-fun forall!229 (List!21406 Int) Bool)

(assert (=> d!120441 (forall!229 lt!448007 lambda!506)))

(declare-fun e!570093 () List!21406)

(assert (=> d!120441 (= lt!448007 e!570093)))

(declare-fun c!102464 () Bool)

(assert (=> d!120441 (= c!102464 (and ((_ is Cons!21401) (t!30406 l!412)) (= (_2!7569 (h!22599 (t!30406 l!412))) value!115)))))

(assert (=> d!120441 (isStrictlySorted!559 (t!30406 l!412))))

(assert (=> d!120441 (= (getKeysOf!35 (t!30406 l!412) value!115) lt!448007)))

(declare-fun lt!448006 () List!21406)

(declare-fun bm!42651 () Bool)

(declare-datatypes ((Unit!33119 0))(
  ( (Unit!33120) )
))
(declare-fun call!42657 () Unit!33119)

(declare-fun lt!448010 () List!21406)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!24 (List!21405 List!21406 B!1402 tuple2!15116) Unit!33119)

(assert (=> bm!42651 (= call!42657 (lemmaForallGetValueByKeySameWithASmallerHead!24 (ite c!102464 lt!448001 lt!448008) (ite c!102464 lt!448010 lt!448006) value!115 (ite c!102464 lt!448002 lt!448005)))))

(declare-fun bm!42652 () Bool)

(declare-fun call!42654 () List!21406)

(assert (=> bm!42652 (= call!42654 (getKeysOf!35 (t!30406 (t!30406 l!412)) value!115))))

(declare-fun b!1013434 () Bool)

(assert (=> b!1013434 (= e!570093 e!570096)))

(declare-fun c!102466 () Bool)

(assert (=> b!1013434 (= c!102466 (and ((_ is Cons!21401) (t!30406 l!412)) (not (= (_2!7569 (h!22599 (t!30406 l!412))) value!115))))))

(declare-fun b!1013435 () Bool)

(assert (=> b!1013435 (= e!570093 (Cons!21402 (_1!7569 (h!22599 (t!30406 l!412))) call!42654))))

(declare-fun c!102467 () Bool)

(declare-fun call!42655 () Bool)

(assert (=> b!1013435 (= c!102467 (not call!42655))))

(declare-fun lt!448000 () Unit!33119)

(declare-fun e!570095 () Unit!33119)

(assert (=> b!1013435 (= lt!448000 e!570095)))

(declare-fun bm!42653 () Bool)

(assert (=> bm!42653 (= call!42655 (isEmpty!814 call!42654))))

(declare-fun e!570094 () Unit!33119)

(declare-fun lt!448004 () Unit!33119)

(assert (=> b!1013436 (= e!570094 lt!448004)))

(assert (=> b!1013436 (= lt!448008 (t!30406 (t!30406 l!412)))))

(assert (=> b!1013436 (= lt!448006 call!42654)))

(assert (=> b!1013436 (= lt!448005 (h!22599 (t!30406 l!412)))))

(assert (=> b!1013436 (= lt!448004 call!42657)))

(declare-fun call!42656 () Bool)

(assert (=> b!1013436 call!42656))

(declare-fun b!1013437 () Bool)

(declare-fun Unit!33121 () Unit!33119)

(assert (=> b!1013437 (= e!570095 Unit!33121)))

