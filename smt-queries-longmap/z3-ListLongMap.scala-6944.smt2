; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87456 () Bool)

(assert start!87456)

(declare-fun b!1012939 () Bool)

(assert (=> b!1012939 true))

(assert (=> b!1012939 true))

(declare-fun b!1012935 () Bool)

(declare-fun res!680213 () Bool)

(declare-fun e!569790 () Bool)

(assert (=> b!1012935 (=> (not res!680213) (not e!569790))))

(declare-datatypes ((B!1370 0))(
  ( (B!1371 (val!11769 Int)) )
))
(declare-datatypes ((tuple2!15164 0))(
  ( (tuple2!15165 (_1!7593 (_ BitVec 64)) (_2!7593 B!1370)) )
))
(declare-datatypes ((List!21420 0))(
  ( (Nil!21417) (Cons!21416 (h!22614 tuple2!15164) (t!30412 List!21420)) )
))
(declare-fun l!412 () List!21420)

(declare-fun value!115 () B!1370)

(get-info :version)

(assert (=> b!1012935 (= res!680213 (and (not (= (_2!7593 (h!22614 l!412)) value!115)) ((_ is Cons!21416) l!412)))))

(declare-fun b!1012936 () Bool)

(declare-fun e!569791 () Bool)

(declare-fun tp_is_empty!23437 () Bool)

(declare-fun tp!70365 () Bool)

(assert (=> b!1012936 (= e!569791 (and tp_is_empty!23437 tp!70365))))

(declare-fun b!1012937 () Bool)

(declare-datatypes ((Unit!32992 0))(
  ( (Unit!32993) )
))
(declare-fun e!569792 () Unit!32992)

(declare-fun Unit!32994 () Unit!32992)

(assert (=> b!1012937 (= e!569792 Unit!32994)))

(declare-fun b!1012938 () Bool)

(assert (=> b!1012938 (= e!569790 false)))

(declare-fun lt!447655 () Unit!32992)

(assert (=> b!1012938 (= lt!447655 e!569792)))

(declare-fun c!102364 () Bool)

(declare-datatypes ((List!21421 0))(
  ( (Nil!21418) (Cons!21417 (h!22615 (_ BitVec 64)) (t!30413 List!21421)) )
))
(declare-fun lt!447654 () List!21421)

(declare-fun isEmpty!815 (List!21421) Bool)

(assert (=> b!1012938 (= c!102364 (not (isEmpty!815 lt!447654)))))

(declare-fun getKeysOf!31 (List!21420 B!1370) List!21421)

(assert (=> b!1012938 (= lt!447654 (getKeysOf!31 (t!30412 l!412) value!115))))

(declare-fun lt!447653 () Unit!32992)

(assert (=> b!1012939 (= e!569792 lt!447653)))

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!22 (List!21420 List!21421 B!1370 tuple2!15164) Unit!32992)

(assert (=> b!1012939 (= lt!447653 (lemmaForallGetValueByKeySameWithASmallerHead!22 (t!30412 l!412) lt!447654 value!115 (h!22614 l!412)))))

(declare-fun lambda!473 () Int)

(declare-fun forall!227 (List!21421 Int) Bool)

(assert (=> b!1012939 (forall!227 lt!447654 lambda!473)))

(declare-fun res!680212 () Bool)

(assert (=> start!87456 (=> (not res!680212) (not e!569790))))

(declare-fun isStrictlySorted!545 (List!21420) Bool)

(assert (=> start!87456 (= res!680212 (isStrictlySorted!545 l!412))))

(assert (=> start!87456 e!569790))

(assert (=> start!87456 e!569791))

(assert (=> start!87456 tp_is_empty!23437))

(assert (= (and start!87456 res!680212) b!1012935))

(assert (= (and b!1012935 res!680213) b!1012938))

(assert (= (and b!1012938 c!102364) b!1012939))

(assert (= (and b!1012938 (not c!102364)) b!1012937))

(assert (= (and start!87456 ((_ is Cons!21416) l!412)) b!1012936))

(declare-fun m!935665 () Bool)

(assert (=> b!1012938 m!935665))

(declare-fun m!935667 () Bool)

(assert (=> b!1012938 m!935667))

(declare-fun m!935669 () Bool)

(assert (=> b!1012939 m!935669))

(declare-fun m!935671 () Bool)

(assert (=> b!1012939 m!935671))

(declare-fun m!935673 () Bool)

(assert (=> start!87456 m!935673))

(check-sat tp_is_empty!23437 (not b!1012936) (not start!87456) (not b!1012939) (not b!1012938))
(check-sat)
