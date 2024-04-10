; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87356 () Bool)

(assert start!87356)

(declare-fun b!1012340 () Bool)

(assert (=> b!1012340 true))

(assert (=> b!1012340 true))

(declare-fun b!1012337 () Bool)

(declare-fun e!569476 () Bool)

(declare-fun tp_is_empty!23403 () Bool)

(declare-fun tp!70277 () Bool)

(assert (=> b!1012337 (= e!569476 (and tp_is_empty!23403 tp!70277))))

(declare-fun b!1012338 () Bool)

(declare-datatypes ((Unit!33061 0))(
  ( (Unit!33062) )
))
(declare-fun e!569474 () Unit!33061)

(declare-fun Unit!33063 () Unit!33061)

(assert (=> b!1012338 (= e!569474 Unit!33063)))

(declare-fun b!1012339 () Bool)

(declare-fun e!569475 () Bool)

(assert (=> b!1012339 (= e!569475 false)))

(declare-fun lt!447457 () Unit!33061)

(assert (=> b!1012339 (= lt!447457 e!569474)))

(declare-fun c!102273 () Bool)

(declare-datatypes ((List!21354 0))(
  ( (Nil!21351) (Cons!21350 (h!22548 (_ BitVec 64)) (t!30355 List!21354)) )
))
(declare-fun lt!447459 () List!21354)

(declare-fun isEmpty!790 (List!21354) Bool)

(assert (=> b!1012339 (= c!102273 (not (isEmpty!790 lt!447459)))))

(declare-datatypes ((B!1336 0))(
  ( (B!1337 (val!11752 Int)) )
))
(declare-datatypes ((tuple2!15050 0))(
  ( (tuple2!15051 (_1!7536 (_ BitVec 64)) (_2!7536 B!1336)) )
))
(declare-datatypes ((List!21355 0))(
  ( (Nil!21352) (Cons!21351 (h!22549 tuple2!15050) (t!30356 List!21355)) )
))
(declare-fun l!412 () List!21355)

(declare-fun value!115 () B!1336)

(declare-fun getKeysOf!17 (List!21355 B!1336) List!21354)

(assert (=> b!1012339 (= lt!447459 (getKeysOf!17 (t!30356 l!412) value!115))))

(declare-fun res!679977 () Bool)

(assert (=> start!87356 (=> (not res!679977) (not e!569475))))

(declare-fun isStrictlySorted!532 (List!21355) Bool)

(assert (=> start!87356 (= res!679977 (isStrictlySorted!532 l!412))))

(assert (=> start!87356 e!569475))

(assert (=> start!87356 e!569476))

(assert (=> start!87356 tp_is_empty!23403))

(declare-fun lt!447458 () Unit!33061)

(assert (=> b!1012340 (= e!569474 lt!447458)))

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!9 (List!21355 List!21354 B!1336 tuple2!15050) Unit!33061)

(assert (=> b!1012340 (= lt!447458 (lemmaForallGetValueByKeySameWithASmallerHead!9 (t!30356 l!412) lt!447459 value!115 (h!22549 l!412)))))

(declare-fun lambda!344 () Int)

(declare-fun forall!211 (List!21354 Int) Bool)

(assert (=> b!1012340 (forall!211 lt!447459 lambda!344)))

(declare-fun b!1012341 () Bool)

(declare-fun res!679976 () Bool)

(assert (=> b!1012341 (=> (not res!679976) (not e!569475))))

(get-info :version)

(assert (=> b!1012341 (= res!679976 (and ((_ is Cons!21351) l!412) (= (_2!7536 (h!22549 l!412)) value!115)))))

(assert (= (and start!87356 res!679977) b!1012341))

(assert (= (and b!1012341 res!679976) b!1012339))

(assert (= (and b!1012339 c!102273) b!1012340))

(assert (= (and b!1012339 (not c!102273)) b!1012338))

(assert (= (and start!87356 ((_ is Cons!21351) l!412)) b!1012337))

(declare-fun m!935969 () Bool)

(assert (=> b!1012339 m!935969))

(declare-fun m!935971 () Bool)

(assert (=> b!1012339 m!935971))

(declare-fun m!935973 () Bool)

(assert (=> start!87356 m!935973))

(declare-fun m!935975 () Bool)

(assert (=> b!1012340 m!935975))

(declare-fun m!935977 () Bool)

(assert (=> b!1012340 m!935977))

(check-sat (not b!1012339) (not b!1012337) tp_is_empty!23403 (not b!1012340) (not start!87356))
