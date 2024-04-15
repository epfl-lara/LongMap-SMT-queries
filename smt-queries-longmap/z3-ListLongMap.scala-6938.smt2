; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87354 () Bool)

(assert start!87354)

(declare-fun b!1012189 () Bool)

(assert (=> b!1012189 true))

(assert (=> b!1012189 true))

(declare-fun res!679910 () Bool)

(declare-fun e!569389 () Bool)

(assert (=> start!87354 (=> (not res!679910) (not e!569389))))

(declare-datatypes ((B!1334 0))(
  ( (B!1335 (val!11751 Int)) )
))
(declare-datatypes ((tuple2!15128 0))(
  ( (tuple2!15129 (_1!7575 (_ BitVec 64)) (_2!7575 B!1334)) )
))
(declare-datatypes ((List!21387 0))(
  ( (Nil!21384) (Cons!21383 (h!22581 tuple2!15128) (t!30379 List!21387)) )
))
(declare-fun l!412 () List!21387)

(declare-fun isStrictlySorted!527 (List!21387) Bool)

(assert (=> start!87354 (= res!679910 (isStrictlySorted!527 l!412))))

(assert (=> start!87354 e!569389))

(declare-fun e!569390 () Bool)

(assert (=> start!87354 e!569390))

(declare-fun tp_is_empty!23401 () Bool)

(assert (=> start!87354 tp_is_empty!23401))

(declare-fun b!1012188 () Bool)

(declare-datatypes ((Unit!32944 0))(
  ( (Unit!32945) )
))
(declare-fun e!569388 () Unit!32944)

(declare-fun Unit!32946 () Unit!32944)

(assert (=> b!1012188 (= e!569388 Unit!32946)))

(declare-fun lt!447249 () Unit!32944)

(assert (=> b!1012189 (= e!569388 lt!447249)))

(declare-datatypes ((List!21388 0))(
  ( (Nil!21385) (Cons!21384 (h!22582 (_ BitVec 64)) (t!30380 List!21388)) )
))
(declare-fun lt!447248 () List!21388)

(declare-fun value!115 () B!1334)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!10 (List!21387 List!21388 B!1334 tuple2!15128) Unit!32944)

(assert (=> b!1012189 (= lt!447249 (lemmaForallGetValueByKeySameWithASmallerHead!10 (t!30379 l!412) lt!447248 value!115 (h!22581 l!412)))))

(declare-fun lambda!341 () Int)

(declare-fun forall!212 (List!21388 Int) Bool)

(assert (=> b!1012189 (forall!212 lt!447248 lambda!341)))

(declare-fun b!1012190 () Bool)

(declare-fun res!679909 () Bool)

(assert (=> b!1012190 (=> (not res!679909) (not e!569389))))

(get-info :version)

(assert (=> b!1012190 (= res!679909 (and ((_ is Cons!21383) l!412) (= (_2!7575 (h!22581 l!412)) value!115)))))

(declare-fun b!1012191 () Bool)

(declare-fun tp!70275 () Bool)

(assert (=> b!1012191 (= e!569390 (and tp_is_empty!23401 tp!70275))))

(declare-fun b!1012192 () Bool)

(assert (=> b!1012192 (= e!569389 false)))

(declare-fun lt!447250 () Unit!32944)

(assert (=> b!1012192 (= lt!447250 e!569388)))

(declare-fun c!102238 () Bool)

(declare-fun isEmpty!794 (List!21388) Bool)

(assert (=> b!1012192 (= c!102238 (not (isEmpty!794 lt!447248)))))

(declare-fun getKeysOf!16 (List!21387 B!1334) List!21388)

(assert (=> b!1012192 (= lt!447248 (getKeysOf!16 (t!30379 l!412) value!115))))

(assert (= (and start!87354 res!679910) b!1012190))

(assert (= (and b!1012190 res!679909) b!1012192))

(assert (= (and b!1012192 c!102238) b!1012189))

(assert (= (and b!1012192 (not c!102238)) b!1012188))

(assert (= (and start!87354 ((_ is Cons!21383) l!412)) b!1012191))

(declare-fun m!935341 () Bool)

(assert (=> start!87354 m!935341))

(declare-fun m!935343 () Bool)

(assert (=> b!1012189 m!935343))

(declare-fun m!935345 () Bool)

(assert (=> b!1012189 m!935345))

(declare-fun m!935347 () Bool)

(assert (=> b!1012192 m!935347))

(declare-fun m!935349 () Bool)

(assert (=> b!1012192 m!935349))

(check-sat tp_is_empty!23401 (not b!1012189) (not b!1012191) (not b!1012192) (not start!87354))
(check-sat)
