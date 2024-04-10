; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87374 () Bool)

(assert start!87374)

(declare-fun res!680037 () Bool)

(declare-fun e!569548 () Bool)

(assert (=> start!87374 (=> (not res!680037) (not e!569548))))

(declare-datatypes ((B!1348 0))(
  ( (B!1349 (val!11758 Int)) )
))
(declare-datatypes ((tuple2!15062 0))(
  ( (tuple2!15063 (_1!7542 (_ BitVec 64)) (_2!7542 B!1348)) )
))
(declare-datatypes ((List!21363 0))(
  ( (Nil!21360) (Cons!21359 (h!22557 tuple2!15062) (t!30364 List!21363)) )
))
(declare-fun l!412 () List!21363)

(declare-fun isStrictlySorted!538 (List!21363) Bool)

(assert (=> start!87374 (= res!680037 (isStrictlySorted!538 l!412))))

(assert (=> start!87374 e!569548))

(declare-fun e!569547 () Bool)

(assert (=> start!87374 e!569547))

(declare-fun tp_is_empty!23415 () Bool)

(assert (=> start!87374 tp_is_empty!23415))

(declare-fun b!1012446 () Bool)

(declare-fun res!680036 () Bool)

(assert (=> b!1012446 (=> (not res!680036) (not e!569548))))

(declare-fun value!115 () B!1348)

(get-info :version)

(assert (=> b!1012446 (= res!680036 (and (not (= (_2!7542 (h!22557 l!412)) value!115)) ((_ is Cons!21359) l!412)))))

(declare-fun b!1012447 () Bool)

(assert (=> b!1012447 (= e!569548 (not (isStrictlySorted!538 (t!30364 l!412))))))

(declare-datatypes ((List!21364 0))(
  ( (Nil!21361) (Cons!21360 (h!22558 (_ BitVec 64)) (t!30365 List!21364)) )
))
(declare-fun lt!447474 () List!21364)

(declare-fun getKeysOf!20 (List!21363 B!1348) List!21364)

(assert (=> b!1012447 (= lt!447474 (getKeysOf!20 (t!30364 l!412) value!115))))

(declare-fun b!1012448 () Bool)

(declare-fun tp!70304 () Bool)

(assert (=> b!1012448 (= e!569547 (and tp_is_empty!23415 tp!70304))))

(assert (= (and start!87374 res!680037) b!1012446))

(assert (= (and b!1012446 res!680036) b!1012447))

(assert (= (and start!87374 ((_ is Cons!21359) l!412)) b!1012448))

(declare-fun m!936013 () Bool)

(assert (=> start!87374 m!936013))

(declare-fun m!936015 () Bool)

(assert (=> b!1012447 m!936015))

(declare-fun m!936017 () Bool)

(assert (=> b!1012447 m!936017))

(check-sat (not start!87374) (not b!1012447) (not b!1012448) tp_is_empty!23415)
(check-sat)
(get-model)

(declare-fun d!120297 () Bool)

(declare-fun res!680054 () Bool)

(declare-fun e!569565 () Bool)

(assert (=> d!120297 (=> res!680054 e!569565)))

(assert (=> d!120297 (= res!680054 (or ((_ is Nil!21360) l!412) ((_ is Nil!21360) (t!30364 l!412))))))

(assert (=> d!120297 (= (isStrictlySorted!538 l!412) e!569565)))

(declare-fun b!1012468 () Bool)

(declare-fun e!569566 () Bool)

(assert (=> b!1012468 (= e!569565 e!569566)))

(declare-fun res!680055 () Bool)

(assert (=> b!1012468 (=> (not res!680055) (not e!569566))))

(assert (=> b!1012468 (= res!680055 (bvslt (_1!7542 (h!22557 l!412)) (_1!7542 (h!22557 (t!30364 l!412)))))))

(declare-fun b!1012469 () Bool)

(assert (=> b!1012469 (= e!569566 (isStrictlySorted!538 (t!30364 l!412)))))

(assert (= (and d!120297 (not res!680054)) b!1012468))

(assert (= (and b!1012468 res!680055) b!1012469))

(assert (=> b!1012469 m!936015))

(assert (=> start!87374 d!120297))

(declare-fun d!120303 () Bool)

(declare-fun res!680056 () Bool)

(declare-fun e!569567 () Bool)

(assert (=> d!120303 (=> res!680056 e!569567)))

(assert (=> d!120303 (= res!680056 (or ((_ is Nil!21360) (t!30364 l!412)) ((_ is Nil!21360) (t!30364 (t!30364 l!412)))))))

(assert (=> d!120303 (= (isStrictlySorted!538 (t!30364 l!412)) e!569567)))

(declare-fun b!1012470 () Bool)

(declare-fun e!569568 () Bool)

(assert (=> b!1012470 (= e!569567 e!569568)))

(declare-fun res!680057 () Bool)

(assert (=> b!1012470 (=> (not res!680057) (not e!569568))))

(assert (=> b!1012470 (= res!680057 (bvslt (_1!7542 (h!22557 (t!30364 l!412))) (_1!7542 (h!22557 (t!30364 (t!30364 l!412))))))))

(declare-fun b!1012471 () Bool)

(assert (=> b!1012471 (= e!569568 (isStrictlySorted!538 (t!30364 (t!30364 l!412))))))

(assert (= (and d!120303 (not res!680056)) b!1012470))

(assert (= (and b!1012470 res!680057) b!1012471))

(declare-fun m!936027 () Bool)

(assert (=> b!1012471 m!936027))

(assert (=> b!1012447 d!120303))

(declare-fun b!1012530 () Bool)

(assert (=> b!1012530 true))

(assert (=> b!1012530 true))

(assert (=> b!1012530 true))

(declare-fun bs!28821 () Bool)

(declare-fun b!1012528 () Bool)

(assert (= bs!28821 (and b!1012528 b!1012530)))

(declare-fun lt!447560 () List!21363)

(declare-fun lambda!366 () Int)

(declare-fun lambda!362 () Int)

(declare-fun lt!447556 () tuple2!15062)

(declare-fun lt!447551 () List!21363)

(declare-fun lt!447554 () tuple2!15062)

(assert (=> bs!28821 (= (= (Cons!21359 lt!447556 lt!447560) (Cons!21359 lt!447554 lt!447551)) (= lambda!366 lambda!362))))

(assert (=> b!1012528 true))

(assert (=> b!1012528 true))

(assert (=> b!1012528 true))

(declare-fun bs!28823 () Bool)

(declare-fun d!120305 () Bool)

(assert (= bs!28823 (and d!120305 b!1012530)))

(declare-fun lambda!368 () Int)

(assert (=> bs!28823 (= (= (t!30364 l!412) (Cons!21359 lt!447554 lt!447551)) (= lambda!368 lambda!362))))

(declare-fun bs!28824 () Bool)

(assert (= bs!28824 (and d!120305 b!1012528)))

(assert (=> bs!28824 (= (= (t!30364 l!412) (Cons!21359 lt!447556 lt!447560)) (= lambda!368 lambda!366))))

(assert (=> d!120305 true))

(assert (=> d!120305 true))

(declare-fun b!1012527 () Bool)

(declare-datatypes ((Unit!33067 0))(
  ( (Unit!33068) )
))
(declare-fun lt!447561 () Unit!33067)

(declare-fun e!569602 () Unit!33067)

(assert (=> b!1012527 (= lt!447561 e!569602)))

(declare-fun c!102301 () Bool)

(declare-fun call!42533 () Bool)

(assert (=> b!1012527 (= c!102301 (not call!42533))))

(declare-fun lt!447553 () List!21364)

(declare-fun call!42531 () List!21364)

(assert (=> b!1012527 (= lt!447553 call!42531)))

(declare-fun e!569599 () List!21364)

(assert (=> b!1012527 (= e!569599 call!42531)))

(declare-fun bm!42527 () Bool)

(declare-fun isEmpty!792 (List!21364) Bool)

(assert (=> bm!42527 (= call!42533 (isEmpty!792 call!42531))))

(declare-fun call!42530 () Unit!33067)

(declare-fun lt!447550 () List!21364)

(declare-fun bm!42528 () Bool)

(declare-fun lt!447559 () List!21364)

(declare-fun c!102302 () Bool)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!11 (List!21363 List!21364 B!1348 tuple2!15062) Unit!33067)

(assert (=> bm!42528 (= call!42530 (lemmaForallGetValueByKeySameWithASmallerHead!11 (ite c!102302 lt!447551 lt!447560) (ite c!102302 lt!447550 lt!447559) value!115 (ite c!102302 lt!447554 lt!447556)))))

(declare-fun lt!447558 () Unit!33067)

(assert (=> b!1012528 (= e!569602 lt!447558)))

(assert (=> b!1012528 (= lt!447560 (t!30364 (t!30364 l!412)))))

(assert (=> b!1012528 (= lt!447559 call!42531)))

(assert (=> b!1012528 (= lt!447556 (h!22557 (t!30364 l!412)))))

(assert (=> b!1012528 (= lt!447558 call!42530)))

(declare-fun call!42532 () Bool)

(assert (=> b!1012528 call!42532))

(declare-fun bm!42529 () Bool)

(declare-fun forall!213 (List!21364 Int) Bool)

(assert (=> bm!42529 (= call!42532 (forall!213 (ite c!102302 lt!447550 lt!447559) (ite c!102302 lambda!362 lambda!366)))))

(declare-fun b!1012529 () Bool)

(declare-fun e!569601 () List!21364)

(assert (=> b!1012529 (= e!569601 e!569599)))

(declare-fun c!102303 () Bool)

(assert (=> b!1012529 (= c!102303 (and ((_ is Cons!21359) (t!30364 l!412)) (not (= (_2!7542 (h!22557 (t!30364 l!412))) value!115))))))

(assert (=> b!1012530 call!42532))

(declare-fun lt!447557 () Unit!33067)

(assert (=> b!1012530 (= lt!447557 call!42530)))

(assert (=> b!1012530 (= lt!447554 (h!22557 (t!30364 l!412)))))

(assert (=> b!1012530 (= lt!447550 call!42531)))

(assert (=> b!1012530 (= lt!447551 (t!30364 (t!30364 l!412)))))

(declare-fun e!569600 () Unit!33067)

(assert (=> b!1012530 (= e!569600 lt!447557)))

(declare-fun b!1012526 () Bool)

(declare-fun Unit!33071 () Unit!33067)

(assert (=> b!1012526 (= e!569600 Unit!33071)))

(declare-fun lt!447552 () List!21364)

(assert (=> d!120305 (forall!213 lt!447552 lambda!368)))

(assert (=> d!120305 (= lt!447552 e!569601)))

(assert (=> d!120305 (= c!102302 (and ((_ is Cons!21359) (t!30364 l!412)) (= (_2!7542 (h!22557 (t!30364 l!412))) value!115)))))

(assert (=> d!120305 (isStrictlySorted!538 (t!30364 l!412))))

(assert (=> d!120305 (= (getKeysOf!20 (t!30364 l!412) value!115) lt!447552)))

(declare-fun b!1012531 () Bool)

(assert (=> b!1012531 (= e!569601 (Cons!21360 (_1!7542 (h!22557 (t!30364 l!412))) call!42531))))

(declare-fun c!102304 () Bool)

(assert (=> b!1012531 (= c!102304 (not call!42533))))

(declare-fun lt!447555 () Unit!33067)

(assert (=> b!1012531 (= lt!447555 e!569600)))

(declare-fun bm!42530 () Bool)

(assert (=> bm!42530 (= call!42531 (getKeysOf!20 (t!30364 (t!30364 l!412)) value!115))))

(declare-fun b!1012532 () Bool)

(assert (=> b!1012532 (= e!569599 Nil!21361)))

(declare-fun b!1012533 () Bool)

(declare-fun Unit!33072 () Unit!33067)

(assert (=> b!1012533 (= e!569602 Unit!33072)))

(assert (= (and d!120305 c!102302) b!1012531))

(assert (= (and d!120305 (not c!102302)) b!1012529))

(assert (= (and b!1012531 c!102304) b!1012530))

(assert (= (and b!1012531 (not c!102304)) b!1012526))

(assert (= (and b!1012529 c!102303) b!1012527))

(assert (= (and b!1012529 (not c!102303)) b!1012532))

(assert (= (and b!1012527 c!102301) b!1012528))

(assert (= (and b!1012527 (not c!102301)) b!1012533))

(assert (= (or b!1012530 b!1012528) bm!42528))

(assert (= (or b!1012530 b!1012528) bm!42529))

(assert (= (or b!1012531 b!1012530 b!1012527 b!1012528) bm!42530))

(assert (= (or b!1012531 b!1012527) bm!42527))

(declare-fun m!936031 () Bool)

(assert (=> bm!42527 m!936031))

(declare-fun m!936033 () Bool)

(assert (=> bm!42530 m!936033))

(declare-fun m!936035 () Bool)

(assert (=> bm!42528 m!936035))

(declare-fun m!936037 () Bool)

(assert (=> d!120305 m!936037))

(assert (=> d!120305 m!936015))

(declare-fun m!936039 () Bool)

(assert (=> bm!42529 m!936039))

(assert (=> b!1012447 d!120305))

(declare-fun b!1012558 () Bool)

(declare-fun e!569609 () Bool)

(declare-fun tp!70310 () Bool)

(assert (=> b!1012558 (= e!569609 (and tp_is_empty!23415 tp!70310))))

(assert (=> b!1012448 (= tp!70304 e!569609)))

(assert (= (and b!1012448 ((_ is Cons!21359) (t!30364 l!412))) b!1012558))

(check-sat (not d!120305) (not b!1012471) (not bm!42528) (not b!1012469) (not bm!42530) (not bm!42529) tp_is_empty!23415 (not b!1012558) (not bm!42527))
(check-sat)
