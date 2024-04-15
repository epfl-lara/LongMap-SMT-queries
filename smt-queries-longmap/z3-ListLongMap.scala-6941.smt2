; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87390 () Bool)

(assert start!87390)

(declare-fun b!1012468 () Bool)

(declare-fun e!569552 () Bool)

(declare-fun tp_is_empty!23419 () Bool)

(declare-fun tp!70320 () Bool)

(assert (=> b!1012468 (= e!569552 (and tp_is_empty!23419 tp!70320))))

(declare-fun b!1012466 () Bool)

(declare-fun res!680013 () Bool)

(declare-fun e!569551 () Bool)

(assert (=> b!1012466 (=> (not res!680013) (not e!569551))))

(declare-datatypes ((B!1352 0))(
  ( (B!1353 (val!11760 Int)) )
))
(declare-datatypes ((tuple2!15146 0))(
  ( (tuple2!15147 (_1!7584 (_ BitVec 64)) (_2!7584 B!1352)) )
))
(declare-datatypes ((List!21402 0))(
  ( (Nil!21399) (Cons!21398 (h!22596 tuple2!15146) (t!30394 List!21402)) )
))
(declare-fun l!412 () List!21402)

(declare-fun value!115 () B!1352)

(declare-datatypes ((List!21403 0))(
  ( (Nil!21400) (Cons!21399 (h!22597 (_ BitVec 64)) (t!30395 List!21403)) )
))
(declare-fun isEmpty!800 (List!21403) Bool)

(declare-fun getKeysOf!22 (List!21402 B!1352) List!21403)

(assert (=> b!1012466 (= res!680013 (not (isEmpty!800 (getKeysOf!22 (t!30394 l!412) value!115))))))

(declare-fun b!1012467 () Bool)

(declare-fun isStrictlySorted!536 (List!21402) Bool)

(assert (=> b!1012467 (= e!569551 (not (isStrictlySorted!536 (t!30394 l!412))))))

(declare-fun b!1012465 () Bool)

(declare-fun res!680014 () Bool)

(assert (=> b!1012465 (=> (not res!680014) (not e!569551))))

(get-info :version)

(assert (=> b!1012465 (= res!680014 (and (not (= (_2!7584 (h!22596 l!412)) value!115)) ((_ is Cons!21398) l!412)))))

(declare-fun res!680015 () Bool)

(assert (=> start!87390 (=> (not res!680015) (not e!569551))))

(assert (=> start!87390 (= res!680015 (isStrictlySorted!536 l!412))))

(assert (=> start!87390 e!569551))

(assert (=> start!87390 e!569552))

(assert (=> start!87390 tp_is_empty!23419))

(assert (= (and start!87390 res!680015) b!1012465))

(assert (= (and b!1012465 res!680014) b!1012466))

(assert (= (and b!1012466 res!680013) b!1012467))

(assert (= (and start!87390 ((_ is Cons!21398) l!412)) b!1012468))

(declare-fun m!935443 () Bool)

(assert (=> b!1012466 m!935443))

(assert (=> b!1012466 m!935443))

(declare-fun m!935445 () Bool)

(assert (=> b!1012466 m!935445))

(declare-fun m!935447 () Bool)

(assert (=> b!1012467 m!935447))

(declare-fun m!935449 () Bool)

(assert (=> start!87390 m!935449))

(check-sat tp_is_empty!23419 (not b!1012468) (not b!1012466) (not b!1012467) (not start!87390))
(check-sat)
(get-model)

(declare-fun d!120177 () Bool)

(assert (=> d!120177 (= (isEmpty!800 (getKeysOf!22 (t!30394 l!412) value!115)) ((_ is Nil!21400) (getKeysOf!22 (t!30394 l!412) value!115)))))

(assert (=> b!1012466 d!120177))

(declare-fun b!1012549 () Bool)

(assert (=> b!1012549 true))

(assert (=> b!1012549 true))

(assert (=> b!1012549 true))

(declare-fun bs!28804 () Bool)

(declare-fun b!1012547 () Bool)

(assert (= bs!28804 (and b!1012547 b!1012549)))

(declare-fun lt!447465 () tuple2!15146)

(declare-fun lambda!395 () Int)

(declare-fun lambda!393 () Int)

(declare-fun lt!447461 () List!21402)

(declare-fun lt!447467 () tuple2!15146)

(declare-fun lt!447458 () List!21402)

(assert (=> bs!28804 (= (= (Cons!21398 lt!447467 lt!447458) (Cons!21398 lt!447465 lt!447461)) (= lambda!395 lambda!393))))

(assert (=> b!1012547 true))

(assert (=> b!1012547 true))

(assert (=> b!1012547 true))

(declare-fun bs!28806 () Bool)

(declare-fun d!120181 () Bool)

(assert (= bs!28806 (and d!120181 b!1012549)))

(declare-fun lambda!398 () Int)

(assert (=> bs!28806 (= (= (t!30394 l!412) (Cons!21398 lt!447465 lt!447461)) (= lambda!398 lambda!393))))

(declare-fun bs!28807 () Bool)

(assert (= bs!28807 (and d!120181 b!1012547)))

(assert (=> bs!28807 (= (= (t!30394 l!412) (Cons!21398 lt!447467 lt!447458)) (= lambda!398 lambda!395))))

(assert (=> d!120181 true))

(assert (=> d!120181 true))

(declare-fun lt!447469 () List!21403)

(declare-fun forall!218 (List!21403 Int) Bool)

(assert (=> d!120181 (forall!218 lt!447469 lambda!398)))

(declare-fun e!569596 () List!21403)

(assert (=> d!120181 (= lt!447469 e!569596)))

(declare-fun c!102305 () Bool)

(assert (=> d!120181 (= c!102305 (and ((_ is Cons!21398) (t!30394 l!412)) (= (_2!7584 (h!22596 (t!30394 l!412))) value!115)))))

(assert (=> d!120181 (isStrictlySorted!536 (t!30394 l!412))))

(assert (=> d!120181 (= (getKeysOf!22 (t!30394 l!412) value!115) lt!447469)))

(declare-datatypes ((Unit!32965 0))(
  ( (Unit!32966) )
))
(declare-fun e!569598 () Unit!32965)

(declare-fun lt!447466 () Unit!32965)

(assert (=> b!1012547 (= e!569598 lt!447466)))

(assert (=> b!1012547 (= lt!447458 (t!30394 (t!30394 l!412)))))

(declare-fun lt!447464 () List!21403)

(declare-fun call!42553 () List!21403)

(assert (=> b!1012547 (= lt!447464 call!42553)))

(assert (=> b!1012547 (= lt!447467 (h!22596 (t!30394 l!412)))))

(declare-fun call!42551 () Unit!32965)

(assert (=> b!1012547 (= lt!447466 call!42551)))

(declare-fun call!42554 () Bool)

(assert (=> b!1012547 call!42554))

(declare-fun b!1012548 () Bool)

(assert (=> b!1012548 (= e!569596 (Cons!21399 (_1!7584 (h!22596 (t!30394 l!412))) call!42553))))

(declare-fun c!102307 () Bool)

(declare-fun call!42552 () Bool)

(assert (=> b!1012548 (= c!102307 (not call!42552))))

(declare-fun lt!447460 () Unit!32965)

(declare-fun e!569597 () Unit!32965)

(assert (=> b!1012548 (= lt!447460 e!569597)))

(declare-fun lt!447462 () List!21403)

(declare-fun bm!42548 () Bool)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!16 (List!21402 List!21403 B!1352 tuple2!15146) Unit!32965)

(assert (=> bm!42548 (= call!42551 (lemmaForallGetValueByKeySameWithASmallerHead!16 (ite c!102305 lt!447461 lt!447458) (ite c!102305 lt!447462 lt!447464) value!115 (ite c!102305 lt!447465 lt!447467)))))

(assert (=> b!1012549 call!42554))

(declare-fun lt!447468 () Unit!32965)

(assert (=> b!1012549 (= lt!447468 call!42551)))

(assert (=> b!1012549 (= lt!447465 (h!22596 (t!30394 l!412)))))

(assert (=> b!1012549 (= lt!447462 call!42553)))

(assert (=> b!1012549 (= lt!447461 (t!30394 (t!30394 l!412)))))

(assert (=> b!1012549 (= e!569597 lt!447468)))

(declare-fun bm!42549 () Bool)

(assert (=> bm!42549 (= call!42554 (forall!218 (ite c!102305 lt!447462 lt!447464) (ite c!102305 lambda!393 lambda!395)))))

(declare-fun b!1012550 () Bool)

(declare-fun Unit!32974 () Unit!32965)

(assert (=> b!1012550 (= e!569598 Unit!32974)))

(declare-fun b!1012551 () Bool)

(declare-fun Unit!32975 () Unit!32965)

(assert (=> b!1012551 (= e!569597 Unit!32975)))

(declare-fun b!1012552 () Bool)

(declare-fun e!569595 () List!21403)

(assert (=> b!1012552 (= e!569596 e!569595)))

(declare-fun c!102306 () Bool)

(assert (=> b!1012552 (= c!102306 (and ((_ is Cons!21398) (t!30394 l!412)) (not (= (_2!7584 (h!22596 (t!30394 l!412))) value!115))))))

(declare-fun b!1012553 () Bool)

(declare-fun lt!447463 () Unit!32965)

(assert (=> b!1012553 (= lt!447463 e!569598)))

(declare-fun c!102308 () Bool)

(assert (=> b!1012553 (= c!102308 (not call!42552))))

(declare-fun lt!447459 () List!21403)

(assert (=> b!1012553 (= lt!447459 call!42553)))

(assert (=> b!1012553 (= e!569595 call!42553)))

(declare-fun bm!42550 () Bool)

(assert (=> bm!42550 (= call!42553 (getKeysOf!22 (t!30394 (t!30394 l!412)) value!115))))

(declare-fun bm!42551 () Bool)

(assert (=> bm!42551 (= call!42552 (isEmpty!800 call!42553))))

(declare-fun b!1012554 () Bool)

(assert (=> b!1012554 (= e!569595 Nil!21400)))

(assert (= (and d!120181 c!102305) b!1012548))

(assert (= (and d!120181 (not c!102305)) b!1012552))

(assert (= (and b!1012548 c!102307) b!1012549))

(assert (= (and b!1012548 (not c!102307)) b!1012551))

(assert (= (and b!1012552 c!102306) b!1012553))

(assert (= (and b!1012552 (not c!102306)) b!1012554))

(assert (= (and b!1012553 c!102308) b!1012547))

(assert (= (and b!1012553 (not c!102308)) b!1012550))

(assert (= (or b!1012549 b!1012547) bm!42548))

(assert (= (or b!1012549 b!1012547) bm!42549))

(assert (= (or b!1012548 b!1012549 b!1012547 b!1012553) bm!42550))

(assert (= (or b!1012548 b!1012553) bm!42551))

(declare-fun m!935467 () Bool)

(assert (=> bm!42550 m!935467))

(declare-fun m!935469 () Bool)

(assert (=> d!120181 m!935469))

(assert (=> d!120181 m!935447))

(declare-fun m!935471 () Bool)

(assert (=> bm!42549 m!935471))

(declare-fun m!935473 () Bool)

(assert (=> bm!42551 m!935473))

(declare-fun m!935475 () Bool)

(assert (=> bm!42548 m!935475))

(assert (=> b!1012466 d!120181))

(declare-fun d!120191 () Bool)

(declare-fun res!680050 () Bool)

(declare-fun e!569620 () Bool)

(assert (=> d!120191 (=> res!680050 e!569620)))

(assert (=> d!120191 (= res!680050 (or ((_ is Nil!21399) (t!30394 l!412)) ((_ is Nil!21399) (t!30394 (t!30394 l!412)))))))

(assert (=> d!120191 (= (isStrictlySorted!536 (t!30394 l!412)) e!569620)))

(declare-fun b!1012604 () Bool)

(declare-fun e!569621 () Bool)

(assert (=> b!1012604 (= e!569620 e!569621)))

(declare-fun res!680051 () Bool)

(assert (=> b!1012604 (=> (not res!680051) (not e!569621))))

(assert (=> b!1012604 (= res!680051 (bvslt (_1!7584 (h!22596 (t!30394 l!412))) (_1!7584 (h!22596 (t!30394 (t!30394 l!412))))))))

(declare-fun b!1012605 () Bool)

(assert (=> b!1012605 (= e!569621 (isStrictlySorted!536 (t!30394 (t!30394 l!412))))))

(assert (= (and d!120191 (not res!680050)) b!1012604))

(assert (= (and b!1012604 res!680051) b!1012605))

(declare-fun m!935499 () Bool)

(assert (=> b!1012605 m!935499))

(assert (=> b!1012467 d!120191))

(declare-fun d!120197 () Bool)

(declare-fun res!680052 () Bool)

(declare-fun e!569622 () Bool)

(assert (=> d!120197 (=> res!680052 e!569622)))

(assert (=> d!120197 (= res!680052 (or ((_ is Nil!21399) l!412) ((_ is Nil!21399) (t!30394 l!412))))))

(assert (=> d!120197 (= (isStrictlySorted!536 l!412) e!569622)))

(declare-fun b!1012606 () Bool)

(declare-fun e!569623 () Bool)

(assert (=> b!1012606 (= e!569622 e!569623)))

(declare-fun res!680053 () Bool)

(assert (=> b!1012606 (=> (not res!680053) (not e!569623))))

(assert (=> b!1012606 (= res!680053 (bvslt (_1!7584 (h!22596 l!412)) (_1!7584 (h!22596 (t!30394 l!412)))))))

(declare-fun b!1012607 () Bool)

(assert (=> b!1012607 (= e!569623 (isStrictlySorted!536 (t!30394 l!412)))))

(assert (= (and d!120197 (not res!680052)) b!1012606))

(assert (= (and b!1012606 res!680053) b!1012607))

(assert (=> b!1012607 m!935447))

(assert (=> start!87390 d!120197))

(declare-fun b!1012616 () Bool)

(declare-fun e!569630 () Bool)

(declare-fun tp!70332 () Bool)

(assert (=> b!1012616 (= e!569630 (and tp_is_empty!23419 tp!70332))))

(assert (=> b!1012468 (= tp!70320 e!569630)))

(assert (= (and b!1012468 ((_ is Cons!21398) (t!30394 l!412))) b!1012616))

(check-sat (not bm!42551) (not b!1012605) (not bm!42549) tp_is_empty!23419 (not bm!42548) (not b!1012607) (not bm!42550) (not d!120181) (not b!1012616))
(check-sat)
