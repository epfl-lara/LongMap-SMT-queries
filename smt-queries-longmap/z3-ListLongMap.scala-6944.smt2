; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87458 () Bool)

(assert start!87458)

(declare-fun b!1013086 () Bool)

(assert (=> b!1013086 true))

(assert (=> b!1013086 true))

(declare-fun b!1013084 () Bool)

(declare-fun e!569876 () Bool)

(assert (=> b!1013084 (= e!569876 false)))

(declare-datatypes ((Unit!33105 0))(
  ( (Unit!33106) )
))
(declare-fun lt!447864 () Unit!33105)

(declare-fun e!569878 () Unit!33105)

(assert (=> b!1013084 (= lt!447864 e!569878)))

(declare-fun c!102399 () Bool)

(declare-datatypes ((List!21387 0))(
  ( (Nil!21384) (Cons!21383 (h!22581 (_ BitVec 64)) (t!30388 List!21387)) )
))
(declare-fun lt!447863 () List!21387)

(declare-fun isEmpty!811 (List!21387) Bool)

(assert (=> b!1013084 (= c!102399 (not (isEmpty!811 lt!447863)))))

(declare-datatypes ((B!1372 0))(
  ( (B!1373 (val!11770 Int)) )
))
(declare-datatypes ((tuple2!15086 0))(
  ( (tuple2!15087 (_1!7554 (_ BitVec 64)) (_2!7554 B!1372)) )
))
(declare-datatypes ((List!21388 0))(
  ( (Nil!21385) (Cons!21384 (h!22582 tuple2!15086) (t!30389 List!21388)) )
))
(declare-fun l!412 () List!21388)

(declare-fun value!115 () B!1372)

(declare-fun getKeysOf!32 (List!21388 B!1372) List!21387)

(assert (=> b!1013084 (= lt!447863 (getKeysOf!32 (t!30389 l!412) value!115))))

(declare-fun b!1013085 () Bool)

(declare-fun e!569877 () Bool)

(declare-fun tp_is_empty!23439 () Bool)

(declare-fun tp!70367 () Bool)

(assert (=> b!1013085 (= e!569877 (and tp_is_empty!23439 tp!70367))))

(declare-fun lt!447862 () Unit!33105)

(assert (=> b!1013086 (= e!569878 lt!447862)))

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!20 (List!21388 List!21387 B!1372 tuple2!15086) Unit!33105)

(assert (=> b!1013086 (= lt!447862 (lemmaForallGetValueByKeySameWithASmallerHead!20 (t!30389 l!412) lt!447863 value!115 (h!22582 l!412)))))

(declare-fun lambda!476 () Int)

(declare-fun forall!225 (List!21387 Int) Bool)

(assert (=> b!1013086 (forall!225 lt!447863 lambda!476)))

(declare-fun b!1013087 () Bool)

(declare-fun res!680279 () Bool)

(assert (=> b!1013087 (=> (not res!680279) (not e!569876))))

(get-info :version)

(assert (=> b!1013087 (= res!680279 (and (not (= (_2!7554 (h!22582 l!412)) value!115)) ((_ is Cons!21384) l!412)))))

(declare-fun b!1013088 () Bool)

(declare-fun Unit!33107 () Unit!33105)

(assert (=> b!1013088 (= e!569878 Unit!33107)))

(declare-fun res!680280 () Bool)

(assert (=> start!87458 (=> (not res!680280) (not e!569876))))

(declare-fun isStrictlySorted!550 (List!21388) Bool)

(assert (=> start!87458 (= res!680280 (isStrictlySorted!550 l!412))))

(assert (=> start!87458 e!569876))

(assert (=> start!87458 e!569877))

(assert (=> start!87458 tp_is_empty!23439))

(assert (= (and start!87458 res!680280) b!1013087))

(assert (= (and b!1013087 res!680279) b!1013084))

(assert (= (and b!1013084 c!102399) b!1013086))

(assert (= (and b!1013084 (not c!102399)) b!1013088))

(assert (= (and start!87458 ((_ is Cons!21384) l!412)) b!1013085))

(declare-fun m!936283 () Bool)

(assert (=> b!1013084 m!936283))

(declare-fun m!936285 () Bool)

(assert (=> b!1013084 m!936285))

(declare-fun m!936287 () Bool)

(assert (=> b!1013086 m!936287))

(declare-fun m!936289 () Bool)

(assert (=> b!1013086 m!936289))

(declare-fun m!936291 () Bool)

(assert (=> start!87458 m!936291))

(check-sat (not b!1013086) (not b!1013085) (not start!87458) (not b!1013084) tp_is_empty!23439)
