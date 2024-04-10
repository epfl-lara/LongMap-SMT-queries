; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87628 () Bool)

(assert start!87628)

(declare-fun b!1013963 () Bool)

(assert (=> b!1013963 true))

(assert (=> b!1013963 true))

(declare-fun bs!29003 () Bool)

(declare-fun b!1013965 () Bool)

(assert (= bs!29003 (and b!1013965 b!1013963)))

(declare-fun lambda!614 () Int)

(declare-fun lambda!613 () Int)

(assert (=> bs!29003 (= lambda!614 lambda!613)))

(assert (=> b!1013965 true))

(assert (=> b!1013965 true))

(declare-fun b!1013961 () Bool)

(declare-fun e!570387 () Bool)

(declare-fun tp_is_empty!23489 () Bool)

(declare-fun tp!70487 () Bool)

(assert (=> b!1013961 (= e!570387 (and tp_is_empty!23489 tp!70487))))

(declare-fun b!1013962 () Bool)

(declare-datatypes ((Unit!33153 0))(
  ( (Unit!33154) )
))
(declare-fun e!570386 () Unit!33153)

(declare-fun Unit!33155 () Unit!33153)

(assert (=> b!1013962 (= e!570386 Unit!33155)))

(declare-fun res!680588 () Bool)

(declare-fun e!570388 () Bool)

(assert (=> start!87628 (=> (not res!680588) (not e!570388))))

(declare-datatypes ((B!1422 0))(
  ( (B!1423 (val!11795 Int)) )
))
(declare-datatypes ((tuple2!15136 0))(
  ( (tuple2!15137 (_1!7579 (_ BitVec 64)) (_2!7579 B!1422)) )
))
(declare-datatypes ((List!21425 0))(
  ( (Nil!21422) (Cons!21421 (h!22619 tuple2!15136) (t!30426 List!21425)) )
))
(declare-fun l!412 () List!21425)

(declare-fun isStrictlySorted!569 (List!21425) Bool)

(assert (=> start!87628 (= res!680588 (isStrictlySorted!569 l!412))))

(assert (=> start!87628 e!570388))

(assert (=> start!87628 e!570387))

(assert (=> start!87628 tp_is_empty!23489))

(declare-fun lt!448314 () Unit!33153)

(assert (=> b!1013963 (= e!570386 lt!448314)))

(declare-datatypes ((List!21426 0))(
  ( (Nil!21423) (Cons!21422 (h!22620 (_ BitVec 64)) (t!30427 List!21426)) )
))
(declare-fun lt!448312 () List!21426)

(declare-fun value!115 () B!1422)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!33 (List!21425 List!21426 B!1422 tuple2!15136) Unit!33153)

(assert (=> b!1013963 (= lt!448314 (lemmaForallGetValueByKeySameWithASmallerHead!33 (t!30426 l!412) lt!448312 value!115 (h!22619 l!412)))))

(declare-fun forall!238 (List!21426 Int) Bool)

(assert (=> b!1013963 (forall!238 lt!448312 lambda!613)))

(declare-fun b!1013964 () Bool)

(declare-fun res!680589 () Bool)

(assert (=> b!1013964 (=> (not res!680589) (not e!570388))))

(assert (=> b!1013964 (= res!680589 (and (is-Cons!21421 l!412) (= (_2!7579 (h!22619 l!412)) value!115)))))

(assert (=> b!1013965 (= e!570388 (not (forall!238 (Cons!21422 (_1!7579 (h!22619 l!412)) lt!448312) lambda!614)))))

(declare-fun lt!448313 () Unit!33153)

(assert (=> b!1013965 (= lt!448313 e!570386)))

(declare-fun c!102573 () Bool)

(declare-fun isEmpty!830 (List!21426) Bool)

(assert (=> b!1013965 (= c!102573 (not (isEmpty!830 lt!448312)))))

(declare-fun getKeysOf!45 (List!21425 B!1422) List!21426)

(assert (=> b!1013965 (= lt!448312 (getKeysOf!45 (t!30426 l!412) value!115))))

(assert (= (and start!87628 res!680588) b!1013964))

(assert (= (and b!1013964 res!680589) b!1013965))

(assert (= (and b!1013965 c!102573) b!1013963))

(assert (= (and b!1013965 (not c!102573)) b!1013962))

(assert (= (and start!87628 (is-Cons!21421 l!412)) b!1013961))

(declare-fun m!936681 () Bool)

(assert (=> start!87628 m!936681))

(declare-fun m!936683 () Bool)

(assert (=> b!1013963 m!936683))

(declare-fun m!936685 () Bool)

(assert (=> b!1013963 m!936685))

(declare-fun m!936687 () Bool)

(assert (=> b!1013965 m!936687))

(declare-fun m!936689 () Bool)

(assert (=> b!1013965 m!936689))

(declare-fun m!936691 () Bool)

(assert (=> b!1013965 m!936691))

(push 1)

(assert tp_is_empty!23489)

(assert (not b!1013965))

(assert (not b!1013961))

(assert (not b!1013963))

(assert (not start!87628))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120561 () Bool)

(declare-fun res!680598 () Bool)

(declare-fun e!570397 () Bool)

(assert (=> d!120561 (=> res!680598 e!570397)))

(assert (=> d!120561 (= res!680598 (or (is-Nil!21422 l!412) (is-Nil!21422 (t!30426 l!412))))))

(assert (=> d!120561 (= (isStrictlySorted!569 l!412) e!570397)))

(declare-fun b!1013978 () Bool)

(declare-fun e!570399 () Bool)

(assert (=> b!1013978 (= e!570397 e!570399)))

(declare-fun res!680600 () Bool)

(assert (=> b!1013978 (=> (not res!680600) (not e!570399))))

(assert (=> b!1013978 (= res!680600 (bvslt (_1!7579 (h!22619 l!412)) (_1!7579 (h!22619 (t!30426 l!412)))))))

(declare-fun b!1013980 () Bool)

(assert (=> b!1013980 (= e!570399 (isStrictlySorted!569 (t!30426 l!412)))))

(assert (= (and d!120561 (not res!680598)) b!1013978))

(assert (= (and b!1013978 res!680600) b!1013980))

(declare-fun m!936695 () Bool)

(assert (=> b!1013980 m!936695))

(assert (=> start!87628 d!120561))

(declare-fun d!120564 () Bool)

(declare-fun res!680611 () Bool)

(declare-fun e!570410 () Bool)

(assert (=> d!120564 (=> res!680611 e!570410)))

(assert (=> d!120564 (= res!680611 (is-Nil!21423 (Cons!21422 (_1!7579 (h!22619 l!412)) lt!448312)))))

(assert (=> d!120564 (= (forall!238 (Cons!21422 (_1!7579 (h!22619 l!412)) lt!448312) lambda!614) e!570410)))

(declare-fun b!1013991 () Bool)

(declare-fun e!570412 () Bool)

(assert (=> b!1013991 (= e!570410 e!570412)))

(declare-fun res!680613 () Bool)

(assert (=> b!1013991 (=> (not res!680613) (not e!570412))))

(declare-fun dynLambda!1889 (Int (_ BitVec 64)) Bool)

(assert (=> b!1013991 (= res!680613 (dynLambda!1889 lambda!614 (h!22620 (Cons!21422 (_1!7579 (h!22619 l!412)) lt!448312))))))

(declare-fun b!1013993 () Bool)

(assert (=> b!1013993 (= e!570412 (forall!238 (t!30427 (Cons!21422 (_1!7579 (h!22619 l!412)) lt!448312)) lambda!614))))

(assert (= (and d!120564 (not res!680611)) b!1013991))

(assert (= (and b!1013991 res!680613) b!1013993))

(declare-fun b_lambda!15278 () Bool)

(assert (=> (not b_lambda!15278) (not b!1013991)))

(declare-fun m!936699 () Bool)

(assert (=> b!1013991 m!936699))

(declare-fun m!936703 () Bool)

(assert (=> b!1013993 m!936703))

(assert (=> b!1013965 d!120564))

(declare-fun d!120569 () Bool)

(assert (=> d!120569 (= (isEmpty!830 lt!448312) (is-Nil!21423 lt!448312))))

(assert (=> b!1013965 d!120569))

(declare-fun bs!29004 () Bool)

(declare-fun b!1014039 () Bool)

(assert (= bs!29004 (and b!1014039 b!1013963)))

(declare-fun lt!448372 () tuple2!15136)

(declare-fun lt!448384 () List!21425)

(declare-fun lambda!628 () Int)

(assert (=> bs!29004 (= (= (Cons!21421 lt!448372 lt!448384) l!412) (= lambda!628 lambda!613))))

(declare-fun bs!29006 () Bool)

(assert (= bs!29006 (and b!1014039 b!1013965)))

(assert (=> bs!29006 (= (= (Cons!21421 lt!448372 lt!448384) l!412) (= lambda!628 lambda!614))))

(assert (=> b!1014039 true))

(assert (=> b!1014039 true))

(assert (=> b!1014039 true))

(declare-fun bs!29008 () Bool)

(declare-fun b!1014046 () Bool)

(assert (= bs!29008 (and b!1014046 b!1013963)))

(declare-fun lt!448381 () tuple2!15136)

(declare-fun lambda!632 () Int)

(declare-fun lt!448370 () List!21425)

(assert (=> bs!29008 (= (= (Cons!21421 lt!448381 lt!448370) l!412) (= lambda!632 lambda!613))))

(declare-fun bs!29010 () Bool)

(assert (= bs!29010 (and b!1014046 b!1013965)))

(assert (=> bs!29010 (= (= (Cons!21421 lt!448381 lt!448370) l!412) (= lambda!632 lambda!614))))

(declare-fun bs!29012 () Bool)

(assert (= bs!29012 (and b!1014046 b!1014039)))

(assert (=> bs!29012 (= (= (Cons!21421 lt!448381 lt!448370) (Cons!21421 lt!448372 lt!448384)) (= lambda!632 lambda!628))))

(assert (=> b!1014046 true))

(assert (=> b!1014046 true))

(assert (=> b!1014046 true))

(declare-fun bs!29014 () Bool)

(declare-fun d!120571 () Bool)

(assert (= bs!29014 (and d!120571 b!1013963)))

(declare-fun lambda!633 () Int)

(assert (=> bs!29014 (= (= (t!30426 l!412) l!412) (= lambda!633 lambda!613))))

(declare-fun bs!29016 () Bool)

(assert (= bs!29016 (and d!120571 b!1013965)))

(assert (=> bs!29016 (= (= (t!30426 l!412) l!412) (= lambda!633 lambda!614))))

(declare-fun bs!29018 () Bool)

(assert (= bs!29018 (and d!120571 b!1014039)))

(assert (=> bs!29018 (= (= (t!30426 l!412) (Cons!21421 lt!448372 lt!448384)) (= lambda!633 lambda!628))))

(declare-fun bs!29021 () Bool)

(assert (= bs!29021 (and d!120571 b!1014046)))

(assert (=> bs!29021 (= (= (t!30426 l!412) (Cons!21421 lt!448381 lt!448370)) (= lambda!633 lambda!632))))

(assert (=> d!120571 true))

(assert (=> d!120571 true))

(declare-fun b!1014034 () Bool)

(declare-fun e!570438 () List!21426)

(declare-fun call!42748 () List!21426)

(assert (=> b!1014034 (= e!570438 (Cons!21422 (_1!7579 (h!22619 (t!30426 l!412))) call!42748))))

(declare-fun c!102590 () Bool)

(declare-fun call!42752 () Bool)

(assert (=> b!1014034 (= c!102590 (not call!42752))))

(declare-fun lt!448386 () Unit!33153)

(declare-fun e!570439 () Unit!33153)

(assert (=> b!1014034 (= lt!448386 e!570439)))

(declare-fun b!1014036 () Bool)

(declare-fun Unit!33158 () Unit!33153)

(assert (=> b!1014036 (= e!570439 Unit!33158)))

(declare-fun bm!42743 () Bool)

(declare-fun lt!448385 () List!21426)

(declare-fun c!102593 () Bool)

(declare-fun lt!448377 () List!21426)

(declare-fun call!42753 () Unit!33153)

(assert (=> bm!42743 (= call!42753 (lemmaForallGetValueByKeySameWithASmallerHead!33 (ite c!102593 lt!448384 lt!448370) (ite c!102593 lt!448377 lt!448385) value!115 (ite c!102593 lt!448372 lt!448381)))))

(declare-fun call!42750 () Bool)

(assert (=> b!1014039 call!42750))

(declare-fun lt!448379 () Unit!33153)

(assert (=> b!1014039 (= lt!448379 call!42753)))

(assert (=> b!1014039 (= lt!448372 (h!22619 (t!30426 l!412)))))

(assert (=> b!1014039 (= lt!448377 call!42748)))

(assert (=> b!1014039 (= lt!448384 (t!30426 (t!30426 l!412)))))

(assert (=> b!1014039 (= e!570439 lt!448379)))

(declare-fun b!1014041 () Bool)

(declare-fun e!570435 () Unit!33153)

(declare-fun Unit!33159 () Unit!33153)

(assert (=> b!1014041 (= e!570435 Unit!33159)))

(declare-fun b!1014043 () Bool)

(declare-fun lt!448373 () Unit!33153)

(assert (=> b!1014043 (= lt!448373 e!570435)))

(declare-fun c!102591 () Bool)

(assert (=> b!1014043 (= c!102591 (not call!42752))))

(declare-fun lt!448382 () List!21426)

(assert (=> b!1014043 (= lt!448382 call!42748)))

(declare-fun e!570436 () List!21426)

(assert (=> b!1014043 (= e!570436 call!42748)))

(declare-fun bm!42744 () Bool)

(assert (=> bm!42744 (= call!42748 (getKeysOf!45 (t!30426 (t!30426 l!412)) value!115))))

(declare-fun lt!448371 () Unit!33153)

(assert (=> b!1014046 (= e!570435 lt!448371)))

(assert (=> b!1014046 (= lt!448370 (t!30426 (t!30426 l!412)))))

(assert (=> b!1014046 (= lt!448385 call!42748)))

(assert (=> b!1014046 (= lt!448381 (h!22619 (t!30426 l!412)))))

(assert (=> b!1014046 (= lt!448371 call!42753)))

(assert (=> b!1014046 call!42750))

(declare-fun b!1014048 () Bool)

(assert (=> b!1014048 (= e!570436 Nil!21423)))

(declare-fun lt!448365 () List!21426)

(assert (=> d!120571 (forall!238 lt!448365 lambda!633)))

(assert (=> d!120571 (= lt!448365 e!570438)))

(assert (=> d!120571 (= c!102593 (and (is-Cons!21421 (t!30426 l!412)) (= (_2!7579 (h!22619 (t!30426 l!412))) value!115)))))

(assert (=> d!120571 (isStrictlySorted!569 (t!30426 l!412))))

(assert (=> d!120571 (= (getKeysOf!45 (t!30426 l!412) value!115) lt!448365)))

(declare-fun bm!42746 () Bool)

(assert (=> bm!42746 (= call!42752 (isEmpty!830 call!42748))))

(declare-fun bm!42748 () Bool)

(assert (=> bm!42748 (= call!42750 (forall!238 (ite c!102593 lt!448377 lt!448385) (ite c!102593 lambda!628 lambda!632)))))

(declare-fun b!1014049 () Bool)

(assert (=> b!1014049 (= e!570438 e!570436)))

(declare-fun c!102596 () Bool)

(assert (=> b!1014049 (= c!102596 (and (is-Cons!21421 (t!30426 l!412)) (not (= (_2!7579 (h!22619 (t!30426 l!412))) value!115))))))

(assert (= (and d!120571 c!102593) b!1014034))

(assert (= (and d!120571 (not c!102593)) b!1014049))

(assert (= (and b!1014034 c!102590) b!1014039))

(assert (= (and b!1014034 (not c!102590)) b!1014036))

(assert (= (and b!1014049 c!102596) b!1014043))

(assert (= (and b!1014049 (not c!102596)) b!1014048))

(assert (= (and b!1014043 c!102591) b!1014046))

(assert (= (and b!1014043 (not c!102591)) b!1014041))

(assert (= (or b!1014039 b!1014046) bm!42743))

(assert (= (or b!1014039 b!1014046) bm!42748))

(assert (= (or b!1014034 b!1014039 b!1014043 b!1014046) bm!42744))

(assert (= (or b!1014034 b!1014043) bm!42746))

(declare-fun m!936710 () Bool)

(assert (=> bm!42746 m!936710))

(declare-fun m!936717 () Bool)

(assert (=> bm!42743 m!936717))

(declare-fun m!936719 () Bool)

(assert (=> d!120571 m!936719))

(assert (=> d!120571 m!936695))

(declare-fun m!936723 () Bool)

(assert (=> bm!42744 m!936723))

(declare-fun m!936727 () Bool)

(assert (=> bm!42748 m!936727))

(assert (=> b!1013965 d!120571))

(declare-fun bs!29023 () Bool)

(declare-fun b!1014081 () Bool)

(assert (= bs!29023 (and b!1014081 d!120571)))

(declare-fun lambda!648 () Int)

(assert (=> bs!29023 (= lambda!648 lambda!633)))

(declare-fun bs!29025 () Bool)

(assert (= bs!29025 (and b!1014081 b!1014046)))

(assert (=> bs!29025 (= (= (t!30426 l!412) (Cons!21421 lt!448381 lt!448370)) (= lambda!648 lambda!632))))

(declare-fun bs!29026 () Bool)

(assert (= bs!29026 (and b!1014081 b!1013965)))

(assert (=> bs!29026 (= (= (t!30426 l!412) l!412) (= lambda!648 lambda!614))))

(declare-fun bs!29028 () Bool)

(assert (= bs!29028 (and b!1014081 b!1013963)))

(assert (=> bs!29028 (= (= (t!30426 l!412) l!412) (= lambda!648 lambda!613))))

(declare-fun bs!29030 () Bool)

(assert (= bs!29030 (and b!1014081 b!1014039)))

(assert (=> bs!29030 (= (= (t!30426 l!412) (Cons!21421 lt!448372 lt!448384)) (= lambda!648 lambda!628))))

(assert (=> b!1014081 true))

(assert (=> b!1014081 true))

(declare-fun bs!29034 () Bool)

(declare-fun d!120583 () Bool)

(assert (= bs!29034 (and d!120583 b!1014081)))

(declare-fun lambda!650 () Int)

(assert (=> bs!29034 (= (= (Cons!21421 (h!22619 l!412) (t!30426 l!412)) (t!30426 l!412)) (= lambda!650 lambda!648))))

(declare-fun bs!29036 () Bool)

(assert (= bs!29036 (and d!120583 d!120571)))

(assert (=> bs!29036 (= (= (Cons!21421 (h!22619 l!412) (t!30426 l!412)) (t!30426 l!412)) (= lambda!650 lambda!633))))

(declare-fun bs!29038 () Bool)

(assert (= bs!29038 (and d!120583 b!1014046)))

(assert (=> bs!29038 (= (= (Cons!21421 (h!22619 l!412) (t!30426 l!412)) (Cons!21421 lt!448381 lt!448370)) (= lambda!650 lambda!632))))

(declare-fun bs!29040 () Bool)

(assert (= bs!29040 (and d!120583 b!1013965)))

(assert (=> bs!29040 (= (= (Cons!21421 (h!22619 l!412) (t!30426 l!412)) l!412) (= lambda!650 lambda!614))))

(declare-fun bs!29042 () Bool)

(assert (= bs!29042 (and d!120583 b!1013963)))

(assert (=> bs!29042 (= (= (Cons!21421 (h!22619 l!412) (t!30426 l!412)) l!412) (= lambda!650 lambda!613))))

(declare-fun bs!29044 () Bool)

(assert (= bs!29044 (and d!120583 b!1014039)))

(assert (=> bs!29044 (= (= (Cons!21421 (h!22619 l!412) (t!30426 l!412)) (Cons!21421 lt!448372 lt!448384)) (= lambda!650 lambda!628))))

(assert (=> d!120583 true))

(assert (=> d!120583 true))

(assert (=> d!120583 true))

(assert (=> d!120583 (forall!238 lt!448312 lambda!650)))

(declare-fun lt!448416 () Unit!33153)

(declare-fun choose!1633 (List!21425 List!21426 B!1422 tuple2!15136) Unit!33153)

(assert (=> d!120583 (= lt!448416 (choose!1633 (t!30426 l!412) lt!448312 value!115 (h!22619 l!412)))))

(declare-fun e!570455 () Bool)

(assert (=> d!120583 e!570455))

(declare-fun res!680632 () Bool)

(assert (=> d!120583 (=> (not res!680632) (not e!570455))))

(assert (=> d!120583 (= res!680632 (isStrictlySorted!569 (t!30426 l!412)))))

(assert (=> d!120583 (= (lemmaForallGetValueByKeySameWithASmallerHead!33 (t!30426 l!412) lt!448312 value!115 (h!22619 l!412)) lt!448416)))

(declare-fun b!1014080 () Bool)

(declare-fun res!680634 () Bool)

(assert (=> b!1014080 (=> (not res!680634) (not e!570455))))

(declare-fun isEmpty!832 (List!21425) Bool)

(assert (=> b!1014080 (= res!680634 (not (isEmpty!832 (t!30426 l!412))))))

(declare-fun res!680636 () Bool)

(assert (=> b!1014081 (=> (not res!680636) (not e!570455))))

(assert (=> b!1014081 (= res!680636 (forall!238 lt!448312 lambda!648))))

(declare-fun b!1014083 () Bool)

(declare-fun head!939 (List!21425) tuple2!15136)

(assert (=> b!1014083 (= e!570455 (bvslt (_1!7579 (h!22619 l!412)) (_1!7579 (head!939 (t!30426 l!412)))))))

(assert (= (and d!120583 res!680632) b!1014080))

(assert (= (and b!1014080 res!680634) b!1014081))

(assert (= (and b!1014081 res!680636) b!1014083))

(declare-fun m!936729 () Bool)

(assert (=> d!120583 m!936729))

(declare-fun m!936731 () Bool)

(assert (=> d!120583 m!936731))

(assert (=> d!120583 m!936695))

(declare-fun m!936735 () Bool)

(assert (=> b!1014080 m!936735))

(declare-fun m!936739 () Bool)

(assert (=> b!1014081 m!936739))

(declare-fun m!936741 () Bool)

(assert (=> b!1014083 m!936741))

(assert (=> b!1013963 d!120583))

(declare-fun d!120585 () Bool)

(declare-fun res!680638 () Bool)

(declare-fun e!570461 () Bool)

(assert (=> d!120585 (=> res!680638 e!570461)))

(assert (=> d!120585 (= res!680638 (is-Nil!21423 lt!448312))))

(assert (=> d!120585 (= (forall!238 lt!448312 lambda!613) e!570461)))

(declare-fun b!1014096 () Bool)

(declare-fun e!570462 () Bool)

(assert (=> b!1014096 (= e!570461 e!570462)))

(declare-fun res!680639 () Bool)

(assert (=> b!1014096 (=> (not res!680639) (not e!570462))))

(assert (=> b!1014096 (= res!680639 (dynLambda!1889 lambda!613 (h!22620 lt!448312)))))

(declare-fun b!1014097 () Bool)

(assert (=> b!1014097 (= e!570462 (forall!238 (t!30427 lt!448312) lambda!613))))

(assert (= (and d!120585 (not res!680638)) b!1014096))

(assert (= (and b!1014096 res!680639) b!1014097))

(declare-fun b_lambda!15283 () Bool)

(assert (=> (not b_lambda!15283) (not b!1014096)))

(declare-fun m!936749 () Bool)

(assert (=> b!1014096 m!936749))

(declare-fun m!936753 () Bool)

(assert (=> b!1014097 m!936753))

(assert (=> b!1013963 d!120585))

(declare-fun b!1014109 () Bool)

(declare-fun e!570470 () Bool)

(declare-fun tp!70493 () Bool)

(assert (=> b!1014109 (= e!570470 (and tp_is_empty!23489 tp!70493))))

(assert (=> b!1013961 (= tp!70487 e!570470)))

(assert (= (and b!1013961 (is-Cons!21421 (t!30426 l!412))) b!1014109))

(declare-fun b_lambda!15288 () Bool)

(assert (= b_lambda!15283 (or b!1013963 b_lambda!15288)))

(declare-fun bs!29054 () Bool)

(declare-fun d!120590 () Bool)

(assert (= bs!29054 (and d!120590 b!1013963)))

(declare-datatypes ((Option!575 0))(
  ( (Some!574 (v!14425 B!1422)) (None!573) )
))
(declare-fun getValueByKey!524 (List!21425 (_ BitVec 64)) Option!575)

(assert (=> bs!29054 (= (dynLambda!1889 lambda!613 (h!22620 lt!448312)) (= (getValueByKey!524 l!412 (h!22620 lt!448312)) (Some!574 value!115)))))

(declare-fun m!936759 () Bool)

(assert (=> bs!29054 m!936759))

(assert (=> b!1014096 d!120590))

(declare-fun b_lambda!15292 () Bool)

(assert (= b_lambda!15278 (or b!1013965 b_lambda!15292)))

(declare-fun bs!29055 () Bool)

(declare-fun d!120593 () Bool)

(assert (= bs!29055 (and d!120593 b!1013965)))

(assert (=> bs!29055 (= (dynLambda!1889 lambda!614 (h!22620 (Cons!21422 (_1!7579 (h!22619 l!412)) lt!448312))) (= (getValueByKey!524 l!412 (h!22620 (Cons!21422 (_1!7579 (h!22619 l!412)) lt!448312))) (Some!574 value!115)))))

(declare-fun m!936761 () Bool)

(assert (=> bs!29055 m!936761))

(assert (=> b!1013991 d!120593))

(push 1)

(assert (not d!120571))

(assert (not bs!29055))

(assert tp_is_empty!23489)

(assert (not b!1014097))

(assert (not bs!29054))

(assert (not bm!42748))

(assert (not b!1013980))

(assert (not b_lambda!15288))

(assert (not b!1014081))

(assert (not b!1013993))

(assert (not b!1014083))

(assert (not b!1014080))

(assert (not d!120583))

(assert (not bm!42746))

(assert (not b!1014109))

(assert (not bm!42743))

(assert (not bm!42744))

(assert (not b_lambda!15292))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120659 () Bool)

(declare-fun res!680683 () Bool)

(declare-fun e!570522 () Bool)

(assert (=> d!120659 (=> res!680683 e!570522)))

(assert (=> d!120659 (= res!680683 (is-Nil!21423 lt!448312))))

(assert (=> d!120659 (= (forall!238 lt!448312 lambda!648) e!570522)))

(declare-fun b!1014189 () Bool)

(declare-fun e!570523 () Bool)

(assert (=> b!1014189 (= e!570522 e!570523)))

(declare-fun res!680684 () Bool)

(assert (=> b!1014189 (=> (not res!680684) (not e!570523))))

(assert (=> b!1014189 (= res!680684 (dynLambda!1889 lambda!648 (h!22620 lt!448312)))))

(declare-fun b!1014190 () Bool)

(assert (=> b!1014190 (= e!570523 (forall!238 (t!30427 lt!448312) lambda!648))))

(assert (= (and d!120659 (not res!680683)) b!1014189))

(assert (= (and b!1014189 res!680684) b!1014190))

(declare-fun b_lambda!15325 () Bool)

(assert (=> (not b_lambda!15325) (not b!1014189)))

(declare-fun m!936875 () Bool)

(assert (=> b!1014189 m!936875))

(declare-fun m!936877 () Bool)

(assert (=> b!1014190 m!936877))

(assert (=> b!1014081 d!120659))

(declare-fun d!120661 () Bool)

(declare-fun res!680685 () Bool)

(declare-fun e!570524 () Bool)

(assert (=> d!120661 (=> res!680685 e!570524)))

(assert (=> d!120661 (= res!680685 (is-Nil!21423 (t!30427 lt!448312)))))

(assert (=> d!120661 (= (forall!238 (t!30427 lt!448312) lambda!613) e!570524)))

(declare-fun b!1014191 () Bool)

(declare-fun e!570525 () Bool)

(assert (=> b!1014191 (= e!570524 e!570525)))

(declare-fun res!680686 () Bool)

(assert (=> b!1014191 (=> (not res!680686) (not e!570525))))

(assert (=> b!1014191 (= res!680686 (dynLambda!1889 lambda!613 (h!22620 (t!30427 lt!448312))))))

(declare-fun b!1014192 () Bool)

(assert (=> b!1014192 (= e!570525 (forall!238 (t!30427 (t!30427 lt!448312)) lambda!613))))

(assert (= (and d!120661 (not res!680685)) b!1014191))

(assert (= (and b!1014191 res!680686) b!1014192))

(declare-fun b_lambda!15327 () Bool)

(assert (=> (not b_lambda!15327) (not b!1014191)))

(declare-fun m!936879 () Bool)

(assert (=> b!1014191 m!936879))

(declare-fun m!936881 () Bool)

(assert (=> b!1014192 m!936881))

(assert (=> b!1014097 d!120661))

(declare-fun bs!29191 () Bool)

(declare-fun b!1014194 () Bool)

(assert (= bs!29191 (and b!1014194 b!1014081)))

(declare-fun lambda!676 () Int)

(assert (=> bs!29191 (= (= (ite c!102593 lt!448384 lt!448370) (t!30426 l!412)) (= lambda!676 lambda!648))))

(declare-fun bs!29192 () Bool)

(assert (= bs!29192 (and b!1014194 d!120571)))

(assert (=> bs!29192 (= (= (ite c!102593 lt!448384 lt!448370) (t!30426 l!412)) (= lambda!676 lambda!633))))

(declare-fun bs!29193 () Bool)

(assert (= bs!29193 (and b!1014194 b!1014046)))

(assert (=> bs!29193 (= (= (ite c!102593 lt!448384 lt!448370) (Cons!21421 lt!448381 lt!448370)) (= lambda!676 lambda!632))))

(declare-fun bs!29194 () Bool)

(assert (= bs!29194 (and b!1014194 b!1013965)))

(assert (=> bs!29194 (= (= (ite c!102593 lt!448384 lt!448370) l!412) (= lambda!676 lambda!614))))

(declare-fun bs!29195 () Bool)

(assert (= bs!29195 (and b!1014194 d!120583)))

(assert (=> bs!29195 (= (= (ite c!102593 lt!448384 lt!448370) (Cons!21421 (h!22619 l!412) (t!30426 l!412))) (= lambda!676 lambda!650))))

(declare-fun bs!29196 () Bool)

(assert (= bs!29196 (and b!1014194 b!1013963)))

(assert (=> bs!29196 (= (= (ite c!102593 lt!448384 lt!448370) l!412) (= lambda!676 lambda!613))))

(declare-fun bs!29197 () Bool)

(assert (= bs!29197 (and b!1014194 b!1014039)))

(assert (=> bs!29197 (= (= (ite c!102593 lt!448384 lt!448370) (Cons!21421 lt!448372 lt!448384)) (= lambda!676 lambda!628))))

(assert (=> b!1014194 true))

(assert (=> b!1014194 true))

(declare-fun bs!29198 () Bool)

(declare-fun d!120663 () Bool)

(assert (= bs!29198 (and d!120663 b!1014081)))

(declare-fun lambda!677 () Int)

(assert (=> bs!29198 (= (= (Cons!21421 (ite c!102593 lt!448372 lt!448381) (ite c!102593 lt!448384 lt!448370)) (t!30426 l!412)) (= lambda!677 lambda!648))))

(declare-fun bs!29199 () Bool)

(assert (= bs!29199 (and d!120663 d!120571)))

(assert (=> bs!29199 (= (= (Cons!21421 (ite c!102593 lt!448372 lt!448381) (ite c!102593 lt!448384 lt!448370)) (t!30426 l!412)) (= lambda!677 lambda!633))))

(declare-fun bs!29200 () Bool)

(assert (= bs!29200 (and d!120663 b!1014194)))

(assert (=> bs!29200 (= (= (Cons!21421 (ite c!102593 lt!448372 lt!448381) (ite c!102593 lt!448384 lt!448370)) (ite c!102593 lt!448384 lt!448370)) (= lambda!677 lambda!676))))

(declare-fun bs!29201 () Bool)

(assert (= bs!29201 (and d!120663 b!1014046)))

(assert (=> bs!29201 (= (= (Cons!21421 (ite c!102593 lt!448372 lt!448381) (ite c!102593 lt!448384 lt!448370)) (Cons!21421 lt!448381 lt!448370)) (= lambda!677 lambda!632))))

(declare-fun bs!29202 () Bool)

(assert (= bs!29202 (and d!120663 b!1013965)))

(assert (=> bs!29202 (= (= (Cons!21421 (ite c!102593 lt!448372 lt!448381) (ite c!102593 lt!448384 lt!448370)) l!412) (= lambda!677 lambda!614))))

(declare-fun bs!29203 () Bool)

(assert (= bs!29203 (and d!120663 d!120583)))

(assert (=> bs!29203 (= (= (Cons!21421 (ite c!102593 lt!448372 lt!448381) (ite c!102593 lt!448384 lt!448370)) (Cons!21421 (h!22619 l!412) (t!30426 l!412))) (= lambda!677 lambda!650))))

(declare-fun bs!29204 () Bool)

(assert (= bs!29204 (and d!120663 b!1013963)))

(assert (=> bs!29204 (= (= (Cons!21421 (ite c!102593 lt!448372 lt!448381) (ite c!102593 lt!448384 lt!448370)) l!412) (= lambda!677 lambda!613))))

(declare-fun bs!29205 () Bool)

(assert (= bs!29205 (and d!120663 b!1014039)))

(assert (=> bs!29205 (= (= (Cons!21421 (ite c!102593 lt!448372 lt!448381) (ite c!102593 lt!448384 lt!448370)) (Cons!21421 lt!448372 lt!448384)) (= lambda!677 lambda!628))))

(assert (=> d!120663 true))

(assert (=> d!120663 true))

(assert (=> d!120663 true))

(assert (=> d!120663 (forall!238 (ite c!102593 lt!448377 lt!448385) lambda!677)))

(declare-fun lt!448458 () Unit!33153)

(assert (=> d!120663 (= lt!448458 (choose!1633 (ite c!102593 lt!448384 lt!448370) (ite c!102593 lt!448377 lt!448385) value!115 (ite c!102593 lt!448372 lt!448381)))))

(declare-fun e!570526 () Bool)

(assert (=> d!120663 e!570526))

(declare-fun res!680687 () Bool)

(assert (=> d!120663 (=> (not res!680687) (not e!570526))))

(assert (=> d!120663 (= res!680687 (isStrictlySorted!569 (ite c!102593 lt!448384 lt!448370)))))

(assert (=> d!120663 (= (lemmaForallGetValueByKeySameWithASmallerHead!33 (ite c!102593 lt!448384 lt!448370) (ite c!102593 lt!448377 lt!448385) value!115 (ite c!102593 lt!448372 lt!448381)) lt!448458)))

(declare-fun b!1014193 () Bool)

(declare-fun res!680688 () Bool)

(assert (=> b!1014193 (=> (not res!680688) (not e!570526))))

(assert (=> b!1014193 (= res!680688 (not (isEmpty!832 (ite c!102593 lt!448384 lt!448370))))))

(declare-fun res!680689 () Bool)

(assert (=> b!1014194 (=> (not res!680689) (not e!570526))))

(assert (=> b!1014194 (= res!680689 (forall!238 (ite c!102593 lt!448377 lt!448385) lambda!676))))

(declare-fun b!1014195 () Bool)

(assert (=> b!1014195 (= e!570526 (bvslt (_1!7579 (ite c!102593 lt!448372 lt!448381)) (_1!7579 (head!939 (ite c!102593 lt!448384 lt!448370)))))))

(assert (= (and d!120663 res!680687) b!1014193))

(assert (= (and b!1014193 res!680688) b!1014194))

(assert (= (and b!1014194 res!680689) b!1014195))

(declare-fun m!936899 () Bool)

(assert (=> d!120663 m!936899))

(declare-fun m!936901 () Bool)

(assert (=> d!120663 m!936901))

(declare-fun m!936903 () Bool)

(assert (=> d!120663 m!936903))

(declare-fun m!936905 () Bool)

(assert (=> b!1014193 m!936905))

(declare-fun m!936907 () Bool)

(assert (=> b!1014194 m!936907))

(declare-fun m!936909 () Bool)

(assert (=> b!1014195 m!936909))

(assert (=> bm!42743 d!120663))

(declare-fun d!120671 () Bool)

(declare-fun res!680692 () Bool)

(declare-fun e!570533 () Bool)

(assert (=> d!120671 (=> res!680692 e!570533)))

(assert (=> d!120671 (= res!680692 (is-Nil!21423 (t!30427 (Cons!21422 (_1!7579 (h!22619 l!412)) lt!448312))))))

(assert (=> d!120671 (= (forall!238 (t!30427 (Cons!21422 (_1!7579 (h!22619 l!412)) lt!448312)) lambda!614) e!570533)))

(declare-fun b!1014206 () Bool)

(declare-fun e!570534 () Bool)

(assert (=> b!1014206 (= e!570533 e!570534)))

(declare-fun res!680693 () Bool)

(assert (=> b!1014206 (=> (not res!680693) (not e!570534))))

(assert (=> b!1014206 (= res!680693 (dynLambda!1889 lambda!614 (h!22620 (t!30427 (Cons!21422 (_1!7579 (h!22619 l!412)) lt!448312)))))))

(declare-fun b!1014207 () Bool)

(assert (=> b!1014207 (= e!570534 (forall!238 (t!30427 (t!30427 (Cons!21422 (_1!7579 (h!22619 l!412)) lt!448312))) lambda!614))))

(assert (= (and d!120671 (not res!680692)) b!1014206))

(assert (= (and b!1014206 res!680693) b!1014207))

(declare-fun b_lambda!15331 () Bool)

(assert (=> (not b_lambda!15331) (not b!1014206)))

(declare-fun m!936911 () Bool)

(assert (=> b!1014206 m!936911))

(declare-fun m!936913 () Bool)

(assert (=> b!1014207 m!936913))

(assert (=> b!1013993 d!120671))

(declare-fun d!120673 () Bool)

(assert (=> d!120673 (= (head!939 (t!30426 l!412)) (h!22619 (t!30426 l!412)))))

(assert (=> b!1014083 d!120673))

(declare-fun d!120675 () Bool)

(declare-fun c!102638 () Bool)

(assert (=> d!120675 (= c!102638 (and (is-Cons!21421 l!412) (= (_1!7579 (h!22619 l!412)) (h!22620 (Cons!21422 (_1!7579 (h!22619 l!412)) lt!448312)))))))

(declare-fun e!570549 () Option!575)

(assert (=> d!120675 (= (getValueByKey!524 l!412 (h!22620 (Cons!21422 (_1!7579 (h!22619 l!412)) lt!448312))) e!570549)))

(declare-fun b!1014230 () Bool)

(assert (=> b!1014230 (= e!570549 (Some!574 (_2!7579 (h!22619 l!412))))))

(declare-fun b!1014233 () Bool)

(declare-fun e!570550 () Option!575)

(assert (=> b!1014233 (= e!570550 None!573)))

(declare-fun b!1014231 () Bool)

(assert (=> b!1014231 (= e!570549 e!570550)))

(declare-fun c!102639 () Bool)

(assert (=> b!1014231 (= c!102639 (and (is-Cons!21421 l!412) (not (= (_1!7579 (h!22619 l!412)) (h!22620 (Cons!21422 (_1!7579 (h!22619 l!412)) lt!448312))))))))

(declare-fun b!1014232 () Bool)

(assert (=> b!1014232 (= e!570550 (getValueByKey!524 (t!30426 l!412) (h!22620 (Cons!21422 (_1!7579 (h!22619 l!412)) lt!448312))))))

(assert (= (and d!120675 c!102638) b!1014230))

(assert (= (and d!120675 (not c!102638)) b!1014231))

(assert (= (and b!1014231 c!102639) b!1014232))

(assert (= (and b!1014231 (not c!102639)) b!1014233))

(declare-fun m!936931 () Bool)

(assert (=> b!1014232 m!936931))

(assert (=> bs!29055 d!120675))

(declare-fun d!120689 () Bool)

(assert (=> d!120689 (= (isEmpty!830 call!42748) (is-Nil!21423 call!42748))))

(assert (=> bm!42746 d!120689))

(declare-fun d!120691 () Bool)

(declare-fun res!680702 () Bool)

(declare-fun e!570553 () Bool)

(assert (=> d!120691 (=> res!680702 e!570553)))

(assert (=> d!120691 (= res!680702 (is-Nil!21423 lt!448312))))

(assert (=> d!120691 (= (forall!238 lt!448312 lambda!650) e!570553)))

(declare-fun b!1014236 () Bool)

(declare-fun e!570554 () Bool)

(assert (=> b!1014236 (= e!570553 e!570554)))

(declare-fun res!680703 () Bool)

(assert (=> b!1014236 (=> (not res!680703) (not e!570554))))

(assert (=> b!1014236 (= res!680703 (dynLambda!1889 lambda!650 (h!22620 lt!448312)))))

(declare-fun b!1014237 () Bool)

(assert (=> b!1014237 (= e!570554 (forall!238 (t!30427 lt!448312) lambda!650))))

(assert (= (and d!120691 (not res!680702)) b!1014236))

(assert (= (and b!1014236 res!680703) b!1014237))

(declare-fun b_lambda!15341 () Bool)

(assert (=> (not b_lambda!15341) (not b!1014236)))

(declare-fun m!936937 () Bool)

(assert (=> b!1014236 m!936937))

(declare-fun m!936939 () Bool)

(assert (=> b!1014237 m!936939))

(assert (=> d!120583 d!120691))

(declare-fun bs!29211 () Bool)

(declare-fun d!120693 () Bool)

(assert (= bs!29211 (and d!120693 b!1014081)))

(declare-fun lambda!680 () Int)

(assert (=> bs!29211 (= (= (Cons!21421 (h!22619 l!412) (t!30426 l!412)) (t!30426 l!412)) (= lambda!680 lambda!648))))

(declare-fun bs!29212 () Bool)

(assert (= bs!29212 (and d!120693 d!120571)))

(assert (=> bs!29212 (= (= (Cons!21421 (h!22619 l!412) (t!30426 l!412)) (t!30426 l!412)) (= lambda!680 lambda!633))))

(declare-fun bs!29213 () Bool)

(assert (= bs!29213 (and d!120693 b!1014194)))

(assert (=> bs!29213 (= (= (Cons!21421 (h!22619 l!412) (t!30426 l!412)) (ite c!102593 lt!448384 lt!448370)) (= lambda!680 lambda!676))))

(declare-fun bs!29214 () Bool)

(assert (= bs!29214 (and d!120693 b!1014046)))

(assert (=> bs!29214 (= (= (Cons!21421 (h!22619 l!412) (t!30426 l!412)) (Cons!21421 lt!448381 lt!448370)) (= lambda!680 lambda!632))))

(declare-fun bs!29215 () Bool)

(assert (= bs!29215 (and d!120693 b!1013965)))

(assert (=> bs!29215 (= (= (Cons!21421 (h!22619 l!412) (t!30426 l!412)) l!412) (= lambda!680 lambda!614))))

(declare-fun bs!29216 () Bool)

(assert (= bs!29216 (and d!120693 d!120583)))

(assert (=> bs!29216 (= lambda!680 lambda!650)))

(declare-fun bs!29217 () Bool)

(assert (= bs!29217 (and d!120693 b!1013963)))

(assert (=> bs!29217 (= (= (Cons!21421 (h!22619 l!412) (t!30426 l!412)) l!412) (= lambda!680 lambda!613))))

(declare-fun bs!29218 () Bool)

(assert (= bs!29218 (and d!120693 b!1014039)))

(assert (=> bs!29218 (= (= (Cons!21421 (h!22619 l!412) (t!30426 l!412)) (Cons!21421 lt!448372 lt!448384)) (= lambda!680 lambda!628))))

(declare-fun bs!29219 () Bool)

(assert (= bs!29219 (and d!120693 d!120663)))

(assert (=> bs!29219 (= (= (Cons!21421 (h!22619 l!412) (t!30426 l!412)) (Cons!21421 (ite c!102593 lt!448372 lt!448381) (ite c!102593 lt!448384 lt!448370))) (= lambda!680 lambda!677))))

(assert (=> d!120693 true))

(assert (=> d!120693 true))

(assert (=> d!120693 true))

(assert (=> d!120693 (forall!238 lt!448312 lambda!680)))

(assert (=> d!120693 true))

(declare-fun _$15!116 () Unit!33153)

(assert (=> d!120693 (= (choose!1633 (t!30426 l!412) lt!448312 value!115 (h!22619 l!412)) _$15!116)))

(declare-fun bs!29220 () Bool)

(assert (= bs!29220 d!120693))

(declare-fun m!936949 () Bool)

(assert (=> bs!29220 m!936949))

(assert (=> d!120583 d!120693))

(declare-fun d!120705 () Bool)

(declare-fun res!680704 () Bool)

(declare-fun e!570556 () Bool)

(assert (=> d!120705 (=> res!680704 e!570556)))

(assert (=> d!120705 (= res!680704 (or (is-Nil!21422 (t!30426 l!412)) (is-Nil!21422 (t!30426 (t!30426 l!412)))))))

(assert (=> d!120705 (= (isStrictlySorted!569 (t!30426 l!412)) e!570556)))

(declare-fun b!1014239 () Bool)

(declare-fun e!570557 () Bool)

(assert (=> b!1014239 (= e!570556 e!570557)))

(declare-fun res!680705 () Bool)

(assert (=> b!1014239 (=> (not res!680705) (not e!570557))))

(assert (=> b!1014239 (= res!680705 (bvslt (_1!7579 (h!22619 (t!30426 l!412))) (_1!7579 (h!22619 (t!30426 (t!30426 l!412))))))))

(declare-fun b!1014240 () Bool)

(assert (=> b!1014240 (= e!570557 (isStrictlySorted!569 (t!30426 (t!30426 l!412))))))

(assert (= (and d!120705 (not res!680704)) b!1014239))

(assert (= (and b!1014239 res!680705) b!1014240))

(declare-fun m!936951 () Bool)

(assert (=> b!1014240 m!936951))

(assert (=> d!120583 d!120705))

(declare-fun d!120707 () Bool)

(declare-fun c!102640 () Bool)

(assert (=> d!120707 (= c!102640 (and (is-Cons!21421 l!412) (= (_1!7579 (h!22619 l!412)) (h!22620 lt!448312))))))

(declare-fun e!570558 () Option!575)

(assert (=> d!120707 (= (getValueByKey!524 l!412 (h!22620 lt!448312)) e!570558)))

(declare-fun b!1014241 () Bool)

(assert (=> b!1014241 (= e!570558 (Some!574 (_2!7579 (h!22619 l!412))))))

(declare-fun b!1014244 () Bool)

(declare-fun e!570559 () Option!575)

(assert (=> b!1014244 (= e!570559 None!573)))

(declare-fun b!1014242 () Bool)

(assert (=> b!1014242 (= e!570558 e!570559)))

(declare-fun c!102641 () Bool)

(assert (=> b!1014242 (= c!102641 (and (is-Cons!21421 l!412) (not (= (_1!7579 (h!22619 l!412)) (h!22620 lt!448312)))))))

(declare-fun b!1014243 () Bool)

(assert (=> b!1014243 (= e!570559 (getValueByKey!524 (t!30426 l!412) (h!22620 lt!448312)))))

(assert (= (and d!120707 c!102640) b!1014241))

(assert (= (and d!120707 (not c!102640)) b!1014242))

(assert (= (and b!1014242 c!102641) b!1014243))

(assert (= (and b!1014242 (not c!102641)) b!1014244))

(declare-fun m!936953 () Bool)

(assert (=> b!1014243 m!936953))

(assert (=> bs!29054 d!120707))

(declare-fun d!120709 () Bool)

(declare-fun res!680706 () Bool)

(declare-fun e!570560 () Bool)

(assert (=> d!120709 (=> res!680706 e!570560)))

(assert (=> d!120709 (= res!680706 (is-Nil!21423 lt!448365))))

(assert (=> d!120709 (= (forall!238 lt!448365 lambda!633) e!570560)))

(declare-fun b!1014245 () Bool)

(declare-fun e!570561 () Bool)

(assert (=> b!1014245 (= e!570560 e!570561)))

(declare-fun res!680707 () Bool)

(assert (=> b!1014245 (=> (not res!680707) (not e!570561))))

(assert (=> b!1014245 (= res!680707 (dynLambda!1889 lambda!633 (h!22620 lt!448365)))))

(declare-fun b!1014246 () Bool)

(assert (=> b!1014246 (= e!570561 (forall!238 (t!30427 lt!448365) lambda!633))))

(assert (= (and d!120709 (not res!680706)) b!1014245))

(assert (= (and b!1014245 res!680707) b!1014246))

(declare-fun b_lambda!15353 () Bool)

(assert (=> (not b_lambda!15353) (not b!1014245)))

(declare-fun m!936955 () Bool)

(assert (=> b!1014245 m!936955))

(declare-fun m!936957 () Bool)

(assert (=> b!1014246 m!936957))

(assert (=> d!120571 d!120709))

(assert (=> d!120571 d!120705))

(declare-fun d!120711 () Bool)

(declare-fun res!680708 () Bool)

(declare-fun e!570562 () Bool)

(assert (=> d!120711 (=> res!680708 e!570562)))

(assert (=> d!120711 (= res!680708 (is-Nil!21423 (ite c!102593 lt!448377 lt!448385)))))

(assert (=> d!120711 (= (forall!238 (ite c!102593 lt!448377 lt!448385) (ite c!102593 lambda!628 lambda!632)) e!570562)))

(declare-fun b!1014247 () Bool)

(declare-fun e!570563 () Bool)

(assert (=> b!1014247 (= e!570562 e!570563)))

(declare-fun res!680709 () Bool)

(assert (=> b!1014247 (=> (not res!680709) (not e!570563))))

(assert (=> b!1014247 (= res!680709 (dynLambda!1889 (ite c!102593 lambda!628 lambda!632) (h!22620 (ite c!102593 lt!448377 lt!448385))))))

(declare-fun b!1014248 () Bool)

(assert (=> b!1014248 (= e!570563 (forall!238 (t!30427 (ite c!102593 lt!448377 lt!448385)) (ite c!102593 lambda!628 lambda!632)))))

(assert (= (and d!120711 (not res!680708)) b!1014247))

(assert (= (and b!1014247 res!680709) b!1014248))

(declare-fun b_lambda!15355 () Bool)

(assert (=> (not b_lambda!15355) (not b!1014247)))

(declare-fun m!936959 () Bool)

(assert (=> b!1014247 m!936959))

(declare-fun m!936961 () Bool)

(assert (=> b!1014248 m!936961))

(assert (=> bm!42748 d!120711))

(assert (=> b!1013980 d!120705))

(declare-fun bs!29221 () Bool)

(declare-fun b!1014251 () Bool)

(assert (= bs!29221 (and b!1014251 b!1014081)))

(declare-fun lambda!681 () Int)

(declare-fun lt!448468 () List!21425)

(declare-fun lt!448462 () tuple2!15136)

(assert (=> bs!29221 (= (= (Cons!21421 lt!448462 lt!448468) (t!30426 l!412)) (= lambda!681 lambda!648))))

(declare-fun bs!29222 () Bool)

(assert (= bs!29222 (and b!1014251 b!1014194)))

(assert (=> bs!29222 (= (= (Cons!21421 lt!448462 lt!448468) (ite c!102593 lt!448384 lt!448370)) (= lambda!681 lambda!676))))

(declare-fun bs!29223 () Bool)

(assert (= bs!29223 (and b!1014251 b!1014046)))

(assert (=> bs!29223 (= (= (Cons!21421 lt!448462 lt!448468) (Cons!21421 lt!448381 lt!448370)) (= lambda!681 lambda!632))))

