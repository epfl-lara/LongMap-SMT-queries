; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87540 () Bool)

(assert start!87540)

(declare-fun b!1013354 () Bool)

(assert (=> b!1013354 true))

(assert (=> b!1013354 true))

(declare-fun b!1013350 () Bool)

(declare-fun e!570043 () Bool)

(declare-fun tp_is_empty!23473 () Bool)

(declare-fun tp!70446 () Bool)

(assert (=> b!1013350 (= e!570043 (and tp_is_empty!23473 tp!70446))))

(declare-fun b!1013351 () Bool)

(declare-fun res!680347 () Bool)

(declare-fun e!570042 () Bool)

(assert (=> b!1013351 (=> (not res!680347) (not e!570042))))

(declare-datatypes ((B!1406 0))(
  ( (B!1407 (val!11787 Int)) )
))
(declare-datatypes ((tuple2!15200 0))(
  ( (tuple2!15201 (_1!7611 (_ BitVec 64)) (_2!7611 B!1406)) )
))
(declare-datatypes ((List!21444 0))(
  ( (Nil!21441) (Cons!21440 (h!22638 tuple2!15200) (t!30436 List!21444)) )
))
(declare-fun l!412 () List!21444)

(declare-fun value!115 () B!1406)

(get-info :version)

(assert (=> b!1013351 (= res!680347 (and ((_ is Cons!21440) l!412) (= (_2!7611 (h!22638 l!412)) value!115)))))

(declare-fun b!1013352 () Bool)

(declare-fun res!680346 () Bool)

(declare-fun e!570044 () Bool)

(assert (=> b!1013352 (=> res!680346 e!570044)))

(declare-fun isEmpty!821 (List!21444) Bool)

(assert (=> b!1013352 (= res!680346 (isEmpty!821 (t!30436 l!412)))))

(declare-fun res!680349 () Bool)

(assert (=> start!87540 (=> (not res!680349) (not e!570042))))

(declare-fun isStrictlySorted!557 (List!21444) Bool)

(assert (=> start!87540 (= res!680349 (isStrictlySorted!557 l!412))))

(assert (=> start!87540 e!570042))

(assert (=> start!87540 e!570043))

(assert (=> start!87540 tp_is_empty!23473))

(declare-fun b!1013353 () Bool)

(declare-fun e!570041 () Bool)

(assert (=> b!1013353 (= e!570041 e!570044)))

(declare-fun res!680351 () Bool)

(assert (=> b!1013353 (=> res!680351 e!570044)))

(assert (=> b!1013353 (= res!680351 (not (isStrictlySorted!557 (t!30436 l!412))))))

(declare-fun res!680350 () Bool)

(assert (=> b!1013354 (=> res!680350 e!570044)))

(declare-datatypes ((List!21445 0))(
  ( (Nil!21442) (Cons!21441 (h!22639 (_ BitVec 64)) (t!30437 List!21445)) )
))
(declare-fun lt!447817 () List!21445)

(declare-fun lambda!509 () Int)

(declare-fun forall!233 (List!21445 Int) Bool)

(assert (=> b!1013354 (= res!680350 (not (forall!233 lt!447817 lambda!509)))))

(declare-fun b!1013355 () Bool)

(assert (=> b!1013355 (= e!570042 e!570041)))

(declare-fun res!680348 () Bool)

(assert (=> b!1013355 (=> (not res!680348) (not e!570041))))

(declare-fun isEmpty!822 (List!21445) Bool)

(assert (=> b!1013355 (= res!680348 (not (isEmpty!822 lt!447817)))))

(declare-fun getKeysOf!37 (List!21444 B!1406) List!21445)

(assert (=> b!1013355 (= lt!447817 (getKeysOf!37 (t!30436 l!412) value!115))))

(declare-fun b!1013356 () Bool)

(declare-fun head!932 (List!21444) tuple2!15200)

(assert (=> b!1013356 (= e!570044 (bvsge (_1!7611 (h!22638 l!412)) (_1!7611 (head!932 (t!30436 l!412)))))))

(assert (= (and start!87540 res!680349) b!1013351))

(assert (= (and b!1013351 res!680347) b!1013355))

(assert (= (and b!1013355 res!680348) b!1013353))

(assert (= (and b!1013353 (not res!680351)) b!1013352))

(assert (= (and b!1013352 (not res!680346)) b!1013354))

(assert (= (and b!1013354 (not res!680350)) b!1013356))

(assert (= (and start!87540 ((_ is Cons!21440) l!412)) b!1013350))

(declare-fun m!935821 () Bool)

(assert (=> b!1013356 m!935821))

(declare-fun m!935823 () Bool)

(assert (=> b!1013352 m!935823))

(declare-fun m!935825 () Bool)

(assert (=> b!1013354 m!935825))

(declare-fun m!935827 () Bool)

(assert (=> b!1013355 m!935827))

(declare-fun m!935829 () Bool)

(assert (=> b!1013355 m!935829))

(declare-fun m!935831 () Bool)

(assert (=> start!87540 m!935831))

(declare-fun m!935833 () Bool)

(assert (=> b!1013353 m!935833))

(check-sat (not b!1013354) (not b!1013356) (not b!1013352) tp_is_empty!23473 (not b!1013355) (not b!1013353) (not b!1013350) (not start!87540))
(check-sat)
(get-model)

(declare-fun d!120321 () Bool)

(declare-fun res!680392 () Bool)

(declare-fun e!570073 () Bool)

(assert (=> d!120321 (=> res!680392 e!570073)))

(assert (=> d!120321 (= res!680392 ((_ is Nil!21442) lt!447817))))

(assert (=> d!120321 (= (forall!233 lt!447817 lambda!509) e!570073)))

(declare-fun b!1013415 () Bool)

(declare-fun e!570074 () Bool)

(assert (=> b!1013415 (= e!570073 e!570074)))

(declare-fun res!680393 () Bool)

(assert (=> b!1013415 (=> (not res!680393) (not e!570074))))

(declare-fun dynLambda!1874 (Int (_ BitVec 64)) Bool)

(assert (=> b!1013415 (= res!680393 (dynLambda!1874 lambda!509 (h!22639 lt!447817)))))

(declare-fun b!1013416 () Bool)

(assert (=> b!1013416 (= e!570074 (forall!233 (t!30437 lt!447817) lambda!509))))

(assert (= (and d!120321 (not res!680392)) b!1013415))

(assert (= (and b!1013415 res!680393) b!1013416))

(declare-fun b_lambda!15235 () Bool)

(assert (=> (not b_lambda!15235) (not b!1013415)))

(declare-fun m!935863 () Bool)

(assert (=> b!1013415 m!935863))

(declare-fun m!935865 () Bool)

(assert (=> b!1013416 m!935865))

(assert (=> b!1013354 d!120321))

(declare-fun d!120323 () Bool)

(declare-fun res!680402 () Bool)

(declare-fun e!570083 () Bool)

(assert (=> d!120323 (=> res!680402 e!570083)))

(assert (=> d!120323 (= res!680402 (or ((_ is Nil!21441) (t!30436 l!412)) ((_ is Nil!21441) (t!30436 (t!30436 l!412)))))))

(assert (=> d!120323 (= (isStrictlySorted!557 (t!30436 l!412)) e!570083)))

(declare-fun b!1013425 () Bool)

(declare-fun e!570084 () Bool)

(assert (=> b!1013425 (= e!570083 e!570084)))

(declare-fun res!680403 () Bool)

(assert (=> b!1013425 (=> (not res!680403) (not e!570084))))

(assert (=> b!1013425 (= res!680403 (bvslt (_1!7611 (h!22638 (t!30436 l!412))) (_1!7611 (h!22638 (t!30436 (t!30436 l!412))))))))

(declare-fun b!1013426 () Bool)

(assert (=> b!1013426 (= e!570084 (isStrictlySorted!557 (t!30436 (t!30436 l!412))))))

(assert (= (and d!120323 (not res!680402)) b!1013425))

(assert (= (and b!1013425 res!680403) b!1013426))

(declare-fun m!935867 () Bool)

(assert (=> b!1013426 m!935867))

(assert (=> b!1013353 d!120323))

(declare-fun d!120329 () Bool)

(assert (=> d!120329 (= (isEmpty!821 (t!30436 l!412)) ((_ is Nil!21441) (t!30436 l!412)))))

(assert (=> b!1013352 d!120329))

(declare-fun d!120333 () Bool)

(assert (=> d!120333 (= (head!932 (t!30436 l!412)) (h!22638 (t!30436 l!412)))))

(assert (=> b!1013356 d!120333))

(declare-fun d!120337 () Bool)

(declare-fun res!680410 () Bool)

(declare-fun e!570091 () Bool)

(assert (=> d!120337 (=> res!680410 e!570091)))

(assert (=> d!120337 (= res!680410 (or ((_ is Nil!21441) l!412) ((_ is Nil!21441) (t!30436 l!412))))))

(assert (=> d!120337 (= (isStrictlySorted!557 l!412) e!570091)))

(declare-fun b!1013433 () Bool)

(declare-fun e!570092 () Bool)

(assert (=> b!1013433 (= e!570091 e!570092)))

(declare-fun res!680411 () Bool)

(assert (=> b!1013433 (=> (not res!680411) (not e!570092))))

(assert (=> b!1013433 (= res!680411 (bvslt (_1!7611 (h!22638 l!412)) (_1!7611 (h!22638 (t!30436 l!412)))))))

(declare-fun b!1013434 () Bool)

(assert (=> b!1013434 (= e!570092 (isStrictlySorted!557 (t!30436 l!412)))))

(assert (= (and d!120337 (not res!680410)) b!1013433))

(assert (= (and b!1013433 res!680411) b!1013434))

(assert (=> b!1013434 m!935833))

(assert (=> start!87540 d!120337))

(declare-fun d!120339 () Bool)

(assert (=> d!120339 (= (isEmpty!822 lt!447817) ((_ is Nil!21442) lt!447817))))

(assert (=> b!1013355 d!120339))

(declare-fun bs!28898 () Bool)

(declare-fun b!1013500 () Bool)

(assert (= bs!28898 (and b!1013500 b!1013354)))

(declare-fun lambda!535 () Int)

(declare-fun lt!447912 () List!21444)

(declare-fun lt!447917 () tuple2!15200)

(assert (=> bs!28898 (= (= (Cons!21440 lt!447917 lt!447912) (t!30436 l!412)) (= lambda!535 lambda!509))))

(assert (=> b!1013500 true))

(assert (=> b!1013500 true))

(assert (=> b!1013500 true))

(declare-fun bs!28902 () Bool)

(declare-fun b!1013498 () Bool)

(assert (= bs!28902 (and b!1013498 b!1013354)))

(declare-fun lt!447916 () List!21444)

(declare-fun lt!447915 () tuple2!15200)

(declare-fun lambda!538 () Int)

(assert (=> bs!28902 (= (= (Cons!21440 lt!447915 lt!447916) (t!30436 l!412)) (= lambda!538 lambda!509))))

(declare-fun bs!28903 () Bool)

(assert (= bs!28903 (and b!1013498 b!1013500)))

(assert (=> bs!28903 (= (= (Cons!21440 lt!447915 lt!447916) (Cons!21440 lt!447917 lt!447912)) (= lambda!538 lambda!535))))

(assert (=> b!1013498 true))

(assert (=> b!1013498 true))

(assert (=> b!1013498 true))

(declare-fun bs!28908 () Bool)

(declare-fun d!120343 () Bool)

(assert (= bs!28908 (and d!120343 b!1013354)))

(declare-fun lambda!541 () Int)

(assert (=> bs!28908 (= lambda!541 lambda!509)))

(declare-fun bs!28910 () Bool)

(assert (= bs!28910 (and d!120343 b!1013500)))

(assert (=> bs!28910 (= (= (t!30436 l!412) (Cons!21440 lt!447917 lt!447912)) (= lambda!541 lambda!535))))

(declare-fun bs!28911 () Bool)

(assert (= bs!28911 (and d!120343 b!1013498)))

(assert (=> bs!28911 (= (= (t!30436 l!412) (Cons!21440 lt!447915 lt!447916)) (= lambda!541 lambda!538))))

(assert (=> d!120343 true))

(assert (=> d!120343 true))

(declare-fun lt!447914 () List!21445)

(assert (=> d!120343 (forall!233 lt!447914 lambda!541)))

(declare-fun e!570123 () List!21445)

(assert (=> d!120343 (= lt!447914 e!570123)))

(declare-fun c!102471 () Bool)

(assert (=> d!120343 (= c!102471 (and ((_ is Cons!21440) (t!30436 l!412)) (= (_2!7611 (h!22638 (t!30436 l!412))) value!115)))))

(assert (=> d!120343 (isStrictlySorted!557 (t!30436 l!412))))

(assert (=> d!120343 (= (getKeysOf!37 (t!30436 l!412) value!115) lt!447914)))

(declare-fun b!1013493 () Bool)

(declare-fun e!570125 () List!21445)

(assert (=> b!1013493 (= e!570123 e!570125)))

(declare-fun c!102468 () Bool)

(assert (=> b!1013493 (= c!102468 (and ((_ is Cons!21440) (t!30436 l!412)) (not (= (_2!7611 (h!22638 (t!30436 l!412))) value!115))))))

(declare-fun b!1013494 () Bool)

(assert (=> b!1013494 (= e!570125 Nil!21442)))

(declare-fun bm!42660 () Bool)

(declare-fun call!42664 () List!21445)

(assert (=> bm!42660 (= call!42664 (getKeysOf!37 (t!30436 (t!30436 l!412)) value!115))))

(declare-fun lt!447918 () List!21445)

(declare-fun lt!447909 () List!21445)

(declare-fun call!42665 () Bool)

(declare-fun bm!42661 () Bool)

(assert (=> bm!42661 (= call!42665 (forall!233 (ite c!102471 lt!447918 lt!447909) (ite c!102471 lambda!535 lambda!538)))))

(declare-fun b!1013495 () Bool)

(declare-datatypes ((Unit!33017 0))(
  ( (Unit!33018) )
))
(declare-fun e!570124 () Unit!33017)

(declare-fun Unit!33019 () Unit!33017)

(assert (=> b!1013495 (= e!570124 Unit!33019)))

(declare-fun b!1013496 () Bool)

(assert (=> b!1013496 (= e!570123 (Cons!21441 (_1!7611 (h!22638 (t!30436 l!412))) call!42664))))

(declare-fun c!102469 () Bool)

(declare-fun call!42663 () Bool)

(assert (=> b!1013496 (= c!102469 (not call!42663))))

(declare-fun lt!447908 () Unit!33017)

(assert (=> b!1013496 (= lt!447908 e!570124)))

(declare-fun b!1013497 () Bool)

(declare-fun lt!447919 () Unit!33017)

(declare-fun e!570126 () Unit!33017)

(assert (=> b!1013497 (= lt!447919 e!570126)))

(declare-fun c!102470 () Bool)

(assert (=> b!1013497 (= c!102470 (not call!42663))))

(declare-fun lt!447913 () List!21445)

(assert (=> b!1013497 (= lt!447913 call!42664)))

(assert (=> b!1013497 (= e!570125 call!42664)))

(declare-fun call!42666 () Unit!33017)

(declare-fun bm!42662 () Bool)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!29 (List!21444 List!21445 B!1406 tuple2!15200) Unit!33017)

(assert (=> bm!42662 (= call!42666 (lemmaForallGetValueByKeySameWithASmallerHead!29 (ite c!102471 lt!447912 lt!447916) (ite c!102471 lt!447918 lt!447909) value!115 (ite c!102471 lt!447917 lt!447915)))))

(declare-fun bm!42663 () Bool)

(assert (=> bm!42663 (= call!42663 (isEmpty!822 call!42664))))

(declare-fun lt!447910 () Unit!33017)

(assert (=> b!1013498 (= e!570126 lt!447910)))

(assert (=> b!1013498 (= lt!447916 (t!30436 (t!30436 l!412)))))

(assert (=> b!1013498 (= lt!447909 call!42664)))

(assert (=> b!1013498 (= lt!447915 (h!22638 (t!30436 l!412)))))

(assert (=> b!1013498 (= lt!447910 call!42666)))

(assert (=> b!1013498 call!42665))

(declare-fun b!1013499 () Bool)

(declare-fun Unit!33020 () Unit!33017)

(assert (=> b!1013499 (= e!570126 Unit!33020)))

(assert (=> b!1013500 call!42665))

(declare-fun lt!447911 () Unit!33017)

(assert (=> b!1013500 (= lt!447911 call!42666)))

(assert (=> b!1013500 (= lt!447917 (h!22638 (t!30436 l!412)))))

(assert (=> b!1013500 (= lt!447918 call!42664)))

(assert (=> b!1013500 (= lt!447912 (t!30436 (t!30436 l!412)))))

(assert (=> b!1013500 (= e!570124 lt!447911)))

(assert (= (and d!120343 c!102471) b!1013496))

(assert (= (and d!120343 (not c!102471)) b!1013493))

(assert (= (and b!1013496 c!102469) b!1013500))

(assert (= (and b!1013496 (not c!102469)) b!1013495))

(assert (= (and b!1013493 c!102468) b!1013497))

(assert (= (and b!1013493 (not c!102468)) b!1013494))

(assert (= (and b!1013497 c!102470) b!1013498))

(assert (= (and b!1013497 (not c!102470)) b!1013499))

(assert (= (or b!1013500 b!1013498) bm!42662))

(assert (= (or b!1013500 b!1013498) bm!42661))

(assert (= (or b!1013496 b!1013500 b!1013497 b!1013498) bm!42660))

(assert (= (or b!1013496 b!1013497) bm!42663))

(declare-fun m!935887 () Bool)

(assert (=> bm!42662 m!935887))

(declare-fun m!935889 () Bool)

(assert (=> d!120343 m!935889))

(assert (=> d!120343 m!935833))

(declare-fun m!935891 () Bool)

(assert (=> bm!42661 m!935891))

(declare-fun m!935893 () Bool)

(assert (=> bm!42660 m!935893))

(declare-fun m!935895 () Bool)

(assert (=> bm!42663 m!935895))

(assert (=> b!1013355 d!120343))

(declare-fun b!1013519 () Bool)

(declare-fun e!570133 () Bool)

(declare-fun tp!70455 () Bool)

(assert (=> b!1013519 (= e!570133 (and tp_is_empty!23473 tp!70455))))

(assert (=> b!1013350 (= tp!70446 e!570133)))

(assert (= (and b!1013350 ((_ is Cons!21440) (t!30436 l!412))) b!1013519))

(declare-fun b_lambda!15241 () Bool)

(assert (= b_lambda!15235 (or b!1013354 b_lambda!15241)))

(declare-fun bs!28915 () Bool)

(declare-fun d!120351 () Bool)

(assert (= bs!28915 (and d!120351 b!1013354)))

(declare-datatypes ((Option!574 0))(
  ( (Some!573 (v!14421 B!1406)) (None!572) )
))
(declare-fun getValueByKey!523 (List!21444 (_ BitVec 64)) Option!574)

(assert (=> bs!28915 (= (dynLambda!1874 lambda!509 (h!22639 lt!447817)) (= (getValueByKey!523 (t!30436 l!412) (h!22639 lt!447817)) (Some!573 value!115)))))

(declare-fun m!935907 () Bool)

(assert (=> bs!28915 m!935907))

(assert (=> b!1013415 d!120351))

(check-sat (not b!1013416) (not bm!42661) (not bm!42663) (not bm!42660) (not b!1013426) (not d!120343) (not bs!28915) (not bm!42662) (not b!1013434) (not b!1013519) tp_is_empty!23473 (not b_lambda!15241))
(check-sat)
