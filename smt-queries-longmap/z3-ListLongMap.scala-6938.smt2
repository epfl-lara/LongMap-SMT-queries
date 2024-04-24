; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87592 () Bool)

(assert start!87592)

(declare-fun b!1013652 () Bool)

(assert (=> b!1013652 true))

(assert (=> b!1013652 true))

(declare-datatypes ((Unit!33054 0))(
  ( (Unit!33055) )
))
(declare-fun e!570324 () Unit!33054)

(declare-fun lt!447965 () Unit!33054)

(assert (=> b!1013652 (= e!570324 lt!447965)))

(declare-datatypes ((List!21341 0))(
  ( (Nil!21338) (Cons!21337 (h!22544 (_ BitVec 64)) (t!30334 List!21341)) )
))
(declare-fun lt!447964 () List!21341)

(declare-datatypes ((B!1334 0))(
  ( (B!1335 (val!11751 Int)) )
))
(declare-fun value!115 () B!1334)

(declare-datatypes ((tuple2!15052 0))(
  ( (tuple2!15053 (_1!7537 (_ BitVec 64)) (_2!7537 B!1334)) )
))
(declare-datatypes ((List!21342 0))(
  ( (Nil!21339) (Cons!21338 (h!22545 tuple2!15052) (t!30335 List!21342)) )
))
(declare-fun l!412 () List!21342)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!8 (List!21342 List!21341 B!1334 tuple2!15052) Unit!33054)

(assert (=> b!1013652 (= lt!447965 (lemmaForallGetValueByKeySameWithASmallerHead!8 (t!30335 l!412) lt!447964 value!115 (h!22545 l!412)))))

(declare-fun lambda!341 () Int)

(declare-fun forall!210 (List!21341 Int) Bool)

(assert (=> b!1013652 (forall!210 lt!447964 lambda!341)))

(declare-fun res!680489 () Bool)

(declare-fun e!570323 () Bool)

(assert (=> start!87592 (=> (not res!680489) (not e!570323))))

(declare-fun isStrictlySorted!519 (List!21342) Bool)

(assert (=> start!87592 (= res!680489 (isStrictlySorted!519 l!412))))

(assert (=> start!87592 e!570323))

(declare-fun e!570322 () Bool)

(assert (=> start!87592 e!570322))

(declare-fun tp_is_empty!23401 () Bool)

(assert (=> start!87592 tp_is_empty!23401))

(declare-fun b!1013653 () Bool)

(declare-fun tp!70275 () Bool)

(assert (=> b!1013653 (= e!570322 (and tp_is_empty!23401 tp!70275))))

(declare-fun b!1013654 () Bool)

(declare-fun res!680488 () Bool)

(assert (=> b!1013654 (=> (not res!680488) (not e!570323))))

(get-info :version)

(assert (=> b!1013654 (= res!680488 (and ((_ is Cons!21338) l!412) (= (_2!7537 (h!22545 l!412)) value!115)))))

(declare-fun b!1013655 () Bool)

(assert (=> b!1013655 (= e!570323 false)))

(declare-fun lt!447963 () Unit!33054)

(assert (=> b!1013655 (= lt!447963 e!570324)))

(declare-fun c!102685 () Bool)

(declare-fun isEmpty!795 (List!21341) Bool)

(assert (=> b!1013655 (= c!102685 (not (isEmpty!795 lt!447964)))))

(declare-fun getKeysOf!16 (List!21342 B!1334) List!21341)

(assert (=> b!1013655 (= lt!447964 (getKeysOf!16 (t!30335 l!412) value!115))))

(declare-fun b!1013656 () Bool)

(declare-fun Unit!33056 () Unit!33054)

(assert (=> b!1013656 (= e!570324 Unit!33056)))

(assert (= (and start!87592 res!680489) b!1013654))

(assert (= (and b!1013654 res!680488) b!1013655))

(assert (= (and b!1013655 c!102685) b!1013652))

(assert (= (and b!1013655 (not c!102685)) b!1013656))

(assert (= (and start!87592 ((_ is Cons!21338) l!412)) b!1013653))

(declare-fun m!937625 () Bool)

(assert (=> b!1013652 m!937625))

(declare-fun m!937627 () Bool)

(assert (=> b!1013652 m!937627))

(declare-fun m!937629 () Bool)

(assert (=> start!87592 m!937629))

(declare-fun m!937631 () Bool)

(assert (=> b!1013655 m!937631))

(declare-fun m!937633 () Bool)

(assert (=> b!1013655 m!937633))

(check-sat (not b!1013652) (not b!1013653) (not b!1013655) (not start!87592) tp_is_empty!23401)
(check-sat)
