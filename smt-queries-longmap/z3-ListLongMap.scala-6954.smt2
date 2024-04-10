; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87704 () Bool)

(assert start!87704)

(declare-fun res!680757 () Bool)

(declare-fun e!570637 () Bool)

(assert (=> start!87704 (=> (not res!680757) (not e!570637))))

(declare-datatypes ((B!1432 0))(
  ( (B!1433 (val!11800 Int)) )
))
(declare-datatypes ((tuple2!15146 0))(
  ( (tuple2!15147 (_1!7584 (_ BitVec 64)) (_2!7584 B!1432)) )
))
(declare-datatypes ((List!21432 0))(
  ( (Nil!21429) (Cons!21428 (h!22626 tuple2!15146) (t!30433 List!21432)) )
))
(declare-fun l!412 () List!21432)

(declare-fun isStrictlySorted!574 (List!21432) Bool)

(assert (=> start!87704 (= res!680757 (isStrictlySorted!574 l!412))))

(assert (=> start!87704 e!570637))

(declare-fun e!570636 () Bool)

(assert (=> start!87704 e!570636))

(declare-fun tp_is_empty!23499 () Bool)

(assert (=> start!87704 tp_is_empty!23499))

(declare-fun b!1014357 () Bool)

(declare-fun res!680756 () Bool)

(assert (=> b!1014357 (=> (not res!680756) (not e!570637))))

(declare-fun value!115 () B!1432)

(get-info :version)

(assert (=> b!1014357 (= res!680756 (and (not (= (_2!7584 (h!22626 l!412)) value!115)) ((_ is Cons!21428) l!412)))))

(declare-fun b!1014358 () Bool)

(declare-fun ListPrimitiveSize!113 (List!21432) Int)

(assert (=> b!1014358 (= e!570637 (>= (ListPrimitiveSize!113 (t!30433 l!412)) (ListPrimitiveSize!113 l!412)))))

(declare-datatypes ((List!21433 0))(
  ( (Nil!21430) (Cons!21429 (h!22627 (_ BitVec 64)) (t!30434 List!21433)) )
))
(declare-fun lt!448488 () List!21433)

(declare-fun getKeysOf!47 (List!21432 B!1432) List!21433)

(assert (=> b!1014358 (= lt!448488 (getKeysOf!47 (t!30433 l!412) value!115))))

(declare-fun b!1014359 () Bool)

(declare-fun tp!70523 () Bool)

(assert (=> b!1014359 (= e!570636 (and tp_is_empty!23499 tp!70523))))

(assert (= (and start!87704 res!680757) b!1014357))

(assert (= (and b!1014357 res!680756) b!1014358))

(assert (= (and start!87704 ((_ is Cons!21428) l!412)) b!1014359))

(declare-fun m!937019 () Bool)

(assert (=> start!87704 m!937019))

(declare-fun m!937021 () Bool)

(assert (=> b!1014358 m!937021))

(declare-fun m!937023 () Bool)

(assert (=> b!1014358 m!937023))

(declare-fun m!937025 () Bool)

(assert (=> b!1014358 m!937025))

(check-sat (not b!1014358) (not start!87704) (not b!1014359) tp_is_empty!23499)
(check-sat)
(get-model)

(declare-fun d!120761 () Bool)

(declare-fun lt!448502 () Int)

(assert (=> d!120761 (>= lt!448502 0)))

(declare-fun e!570654 () Int)

(assert (=> d!120761 (= lt!448502 e!570654)))

(declare-fun c!102668 () Bool)

(assert (=> d!120761 (= c!102668 ((_ is Nil!21429) (t!30433 l!412)))))

(assert (=> d!120761 (= (ListPrimitiveSize!113 (t!30433 l!412)) lt!448502)))

(declare-fun b!1014389 () Bool)

(assert (=> b!1014389 (= e!570654 0)))

(declare-fun b!1014390 () Bool)

(assert (=> b!1014390 (= e!570654 (+ 1 (ListPrimitiveSize!113 (t!30433 (t!30433 l!412)))))))

(assert (= (and d!120761 c!102668) b!1014389))

(assert (= (and d!120761 (not c!102668)) b!1014390))

(declare-fun m!937039 () Bool)

(assert (=> b!1014390 m!937039))

(assert (=> b!1014358 d!120761))

(declare-fun d!120763 () Bool)

(declare-fun lt!448503 () Int)

(assert (=> d!120763 (>= lt!448503 0)))

(declare-fun e!570655 () Int)

(assert (=> d!120763 (= lt!448503 e!570655)))

(declare-fun c!102669 () Bool)

(assert (=> d!120763 (= c!102669 ((_ is Nil!21429) l!412))))

(assert (=> d!120763 (= (ListPrimitiveSize!113 l!412) lt!448503)))

(declare-fun b!1014391 () Bool)

(assert (=> b!1014391 (= e!570655 0)))

(declare-fun b!1014392 () Bool)

(assert (=> b!1014392 (= e!570655 (+ 1 (ListPrimitiveSize!113 (t!30433 l!412))))))

(assert (= (and d!120763 c!102669) b!1014391))

(assert (= (and d!120763 (not c!102669)) b!1014392))

(assert (=> b!1014392 m!937021))

(assert (=> b!1014358 d!120763))

(declare-fun b!1014493 () Bool)

(assert (=> b!1014493 true))

(assert (=> b!1014493 true))

(assert (=> b!1014493 true))

(declare-fun bs!29271 () Bool)

(declare-fun b!1014498 () Bool)

(assert (= bs!29271 (and b!1014498 b!1014493)))

(declare-fun lt!448608 () List!21432)

(declare-fun lt!448607 () List!21432)

(declare-fun lambda!709 () Int)

(declare-fun lt!448606 () tuple2!15146)

(declare-fun lambda!708 () Int)

(declare-fun lt!448603 () tuple2!15146)

(assert (=> bs!29271 (= (= (Cons!21428 lt!448603 lt!448607) (Cons!21428 lt!448606 lt!448608)) (= lambda!709 lambda!708))))

(assert (=> b!1014498 true))

(assert (=> b!1014498 true))

(assert (=> b!1014498 true))

(declare-fun bs!29272 () Bool)

(declare-fun d!120765 () Bool)

(assert (= bs!29272 (and d!120765 b!1014493)))

(declare-fun lambda!710 () Int)

(assert (=> bs!29272 (= (= (t!30433 l!412) (Cons!21428 lt!448606 lt!448608)) (= lambda!710 lambda!708))))

(declare-fun bs!29273 () Bool)

(assert (= bs!29273 (and d!120765 b!1014498)))

(assert (=> bs!29273 (= (= (t!30433 l!412) (Cons!21428 lt!448603 lt!448607)) (= lambda!710 lambda!709))))

(assert (=> d!120765 true))

(assert (=> d!120765 true))

(declare-fun b!1014491 () Bool)

(declare-datatypes ((Unit!33174 0))(
  ( (Unit!33175) )
))
(declare-fun e!570708 () Unit!33174)

(declare-fun Unit!33176 () Unit!33174)

(assert (=> b!1014491 (= e!570708 Unit!33176)))

(declare-fun lt!448600 () List!21433)

(declare-fun forall!241 (List!21433 Int) Bool)

(assert (=> d!120765 (forall!241 lt!448600 lambda!710)))

