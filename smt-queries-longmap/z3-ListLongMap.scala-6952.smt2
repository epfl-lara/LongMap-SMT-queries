; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87626 () Bool)

(assert start!87626)

(declare-fun b!1013945 () Bool)

(assert (=> b!1013945 true))

(assert (=> b!1013945 true))

(declare-fun bs!29002 () Bool)

(declare-fun b!1013943 () Bool)

(assert (= bs!29002 (and b!1013943 b!1013945)))

(declare-fun lambda!608 () Int)

(declare-fun lambda!607 () Int)

(assert (=> bs!29002 (= lambda!608 lambda!607)))

(assert (=> b!1013943 true))

(assert (=> b!1013943 true))

(declare-fun b!1013942 () Bool)

(declare-fun res!680582 () Bool)

(declare-fun e!570377 () Bool)

(assert (=> b!1013942 (=> (not res!680582) (not e!570377))))

(declare-datatypes ((B!1420 0))(
  ( (B!1421 (val!11794 Int)) )
))
(declare-datatypes ((tuple2!15134 0))(
  ( (tuple2!15135 (_1!7578 (_ BitVec 64)) (_2!7578 B!1420)) )
))
(declare-datatypes ((List!21423 0))(
  ( (Nil!21420) (Cons!21419 (h!22617 tuple2!15134) (t!30424 List!21423)) )
))
(declare-fun l!412 () List!21423)

(declare-fun value!115 () B!1420)

(get-info :version)

(assert (=> b!1013942 (= res!680582 (and ((_ is Cons!21419) l!412) (= (_2!7578 (h!22617 l!412)) value!115)))))

(declare-datatypes ((List!21424 0))(
  ( (Nil!21421) (Cons!21420 (h!22618 (_ BitVec 64)) (t!30425 List!21424)) )
))
(declare-fun lt!448305 () List!21424)

(declare-fun forall!237 (List!21424 Int) Bool)

(assert (=> b!1013943 (= e!570377 (not (forall!237 (Cons!21420 (_1!7578 (h!22617 l!412)) lt!448305) lambda!608)))))

(declare-datatypes ((Unit!33150 0))(
  ( (Unit!33151) )
))
(declare-fun lt!448304 () Unit!33150)

(declare-fun e!570379 () Unit!33150)

(assert (=> b!1013943 (= lt!448304 e!570379)))

(declare-fun c!102570 () Bool)

(declare-fun isEmpty!829 (List!21424) Bool)

(assert (=> b!1013943 (= c!102570 (not (isEmpty!829 lt!448305)))))

(declare-fun getKeysOf!44 (List!21423 B!1420) List!21424)

(assert (=> b!1013943 (= lt!448305 (getKeysOf!44 (t!30424 l!412) value!115))))

(declare-fun res!680583 () Bool)

(assert (=> start!87626 (=> (not res!680583) (not e!570377))))

(declare-fun isStrictlySorted!568 (List!21423) Bool)

(assert (=> start!87626 (= res!680583 (isStrictlySorted!568 l!412))))

(assert (=> start!87626 e!570377))

(declare-fun e!570378 () Bool)

(assert (=> start!87626 e!570378))

(declare-fun tp_is_empty!23487 () Bool)

(assert (=> start!87626 tp_is_empty!23487))

(declare-fun b!1013944 () Bool)

(declare-fun tp!70484 () Bool)

(assert (=> b!1013944 (= e!570378 (and tp_is_empty!23487 tp!70484))))

(declare-fun lt!448303 () Unit!33150)

(assert (=> b!1013945 (= e!570379 lt!448303)))

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!32 (List!21423 List!21424 B!1420 tuple2!15134) Unit!33150)

(assert (=> b!1013945 (= lt!448303 (lemmaForallGetValueByKeySameWithASmallerHead!32 (t!30424 l!412) lt!448305 value!115 (h!22617 l!412)))))

(assert (=> b!1013945 (forall!237 lt!448305 lambda!607)))

(declare-fun b!1013946 () Bool)

(declare-fun Unit!33152 () Unit!33150)

(assert (=> b!1013946 (= e!570379 Unit!33152)))

(assert (= (and start!87626 res!680583) b!1013942))

(assert (= (and b!1013942 res!680582) b!1013943))

(assert (= (and b!1013943 c!102570) b!1013945))

(assert (= (and b!1013943 (not c!102570)) b!1013946))

(assert (= (and start!87626 ((_ is Cons!21419) l!412)) b!1013944))

(declare-fun m!936669 () Bool)

(assert (=> b!1013943 m!936669))

(declare-fun m!936671 () Bool)

(assert (=> b!1013943 m!936671))

(declare-fun m!936673 () Bool)

(assert (=> b!1013943 m!936673))

(declare-fun m!936675 () Bool)

(assert (=> start!87626 m!936675))

(declare-fun m!936677 () Bool)

(assert (=> b!1013945 m!936677))

(declare-fun m!936679 () Bool)

(assert (=> b!1013945 m!936679))

(check-sat (not b!1013945) (not b!1013944) (not b!1013943) tp_is_empty!23487 (not start!87626))
(check-sat)
(get-model)

(declare-fun d!120575 () Bool)

(declare-fun res!680618 () Bool)

(declare-fun e!570417 () Bool)

(assert (=> d!120575 (=> res!680618 e!570417)))

(assert (=> d!120575 (= res!680618 ((_ is Nil!21421) (Cons!21420 (_1!7578 (h!22617 l!412)) lt!448305)))))

(assert (=> d!120575 (= (forall!237 (Cons!21420 (_1!7578 (h!22617 l!412)) lt!448305) lambda!608) e!570417)))

(declare-fun b!1013998 () Bool)

(declare-fun e!570418 () Bool)

(assert (=> b!1013998 (= e!570417 e!570418)))

(declare-fun res!680619 () Bool)

(assert (=> b!1013998 (=> (not res!680619) (not e!570418))))

(declare-fun dynLambda!1890 (Int (_ BitVec 64)) Bool)

(assert (=> b!1013998 (= res!680619 (dynLambda!1890 lambda!608 (h!22618 (Cons!21420 (_1!7578 (h!22617 l!412)) lt!448305))))))

(declare-fun b!1013999 () Bool)

(assert (=> b!1013999 (= e!570418 (forall!237 (t!30425 (Cons!21420 (_1!7578 (h!22617 l!412)) lt!448305)) lambda!608))))

(assert (= (and d!120575 (not res!680618)) b!1013998))

(assert (= (and b!1013998 res!680619) b!1013999))

(declare-fun b_lambda!15281 () Bool)

(assert (=> (not b_lambda!15281) (not b!1013998)))

(declare-fun m!936705 () Bool)

(assert (=> b!1013998 m!936705))

(declare-fun m!936707 () Bool)

(assert (=> b!1013999 m!936707))

(assert (=> b!1013943 d!120575))

(declare-fun d!120577 () Bool)

(assert (=> d!120577 (= (isEmpty!829 lt!448305) ((_ is Nil!21421) lt!448305))))

(assert (=> b!1013943 d!120577))

(declare-fun bs!29032 () Bool)

(declare-fun b!1014093 () Bool)

(assert (= bs!29032 (and b!1014093 b!1013945)))

(declare-fun lambda!649 () Int)

(declare-fun lt!448423 () tuple2!15134)

(declare-fun lt!448422 () List!21423)

(assert (=> bs!29032 (= (= (Cons!21419 lt!448423 lt!448422) l!412) (= lambda!649 lambda!607))))

(declare-fun bs!29033 () Bool)

(assert (= bs!29033 (and b!1014093 b!1013943)))

(assert (=> bs!29033 (= (= (Cons!21419 lt!448423 lt!448422) l!412) (= lambda!649 lambda!608))))

(assert (=> b!1014093 true))

(assert (=> b!1014093 true))

(assert (=> b!1014093 true))

(declare-fun bs!29046 () Bool)

(declare-fun b!1014087 () Bool)

(assert (= bs!29046 (and b!1014087 b!1013945)))

(declare-fun lambda!652 () Int)

(declare-fun lt!448421 () List!21423)

(declare-fun lt!448417 () tuple2!15134)

(assert (=> bs!29046 (= (= (Cons!21419 lt!448417 lt!448421) l!412) (= lambda!652 lambda!607))))

(declare-fun bs!29047 () Bool)

(assert (= bs!29047 (and b!1014087 b!1013943)))

(assert (=> bs!29047 (= (= (Cons!21419 lt!448417 lt!448421) l!412) (= lambda!652 lambda!608))))

(declare-fun bs!29048 () Bool)

(assert (= bs!29048 (and b!1014087 b!1014093)))

(assert (=> bs!29048 (= (= (Cons!21419 lt!448417 lt!448421) (Cons!21419 lt!448423 lt!448422)) (= lambda!652 lambda!649))))

(assert (=> b!1014087 true))

(assert (=> b!1014087 true))

(assert (=> b!1014087 true))

(declare-fun bs!29049 () Bool)

(declare-fun d!120579 () Bool)

(assert (= bs!29049 (and d!120579 b!1013945)))

(declare-fun lambda!653 () Int)

(assert (=> bs!29049 (= (= (t!30424 l!412) l!412) (= lambda!653 lambda!607))))

(declare-fun bs!29050 () Bool)

(assert (= bs!29050 (and d!120579 b!1013943)))

(assert (=> bs!29050 (= (= (t!30424 l!412) l!412) (= lambda!653 lambda!608))))

(declare-fun bs!29051 () Bool)

(assert (= bs!29051 (and d!120579 b!1014093)))

(assert (=> bs!29051 (= (= (t!30424 l!412) (Cons!21419 lt!448423 lt!448422)) (= lambda!653 lambda!649))))

(declare-fun bs!29052 () Bool)

(assert (= bs!29052 (and d!120579 b!1014087)))

(assert (=> bs!29052 (= (= (t!30424 l!412) (Cons!21419 lt!448417 lt!448421)) (= lambda!653 lambda!652))))

(assert (=> d!120579 true))

(assert (=> d!120579 true))

(declare-fun bm!42759 () Bool)

(declare-fun call!42764 () List!21424)

(assert (=> bm!42759 (= call!42764 (getKeysOf!44 (t!30424 (t!30424 l!412)) value!115))))

(declare-fun lt!448419 () List!21424)

(assert (=> d!120579 (forall!237 lt!448419 lambda!653)))

(declare-fun e!570457 () List!21424)

(assert (=> d!120579 (= lt!448419 e!570457)))

(declare-fun c!102606 () Bool)

(assert (=> d!120579 (= c!102606 (and ((_ is Cons!21419) (t!30424 l!412)) (= (_2!7578 (h!22617 (t!30424 l!412))) value!115)))))

(assert (=> d!120579 (isStrictlySorted!568 (t!30424 l!412))))

(assert (=> d!120579 (= (getKeysOf!44 (t!30424 l!412) value!115) lt!448419)))

(declare-fun lt!448420 () List!21424)

(declare-fun bm!42760 () Bool)

(declare-fun call!42765 () Unit!33150)

(declare-fun lt!448425 () List!21424)

(assert (=> bm!42760 (= call!42765 (lemmaForallGetValueByKeySameWithASmallerHead!32 (ite c!102606 lt!448422 lt!448421) (ite c!102606 lt!448425 lt!448420) value!115 (ite c!102606 lt!448423 lt!448417)))))

(declare-fun bm!42761 () Bool)

(declare-fun call!42763 () Bool)

(assert (=> bm!42761 (= call!42763 (isEmpty!829 call!42764))))

(declare-fun bm!42762 () Bool)

(declare-fun call!42762 () Bool)

(assert (=> bm!42762 (= call!42762 (forall!237 (ite c!102606 lt!448425 lt!448420) (ite c!102606 lambda!649 lambda!652)))))

(declare-fun b!1014086 () Bool)

(assert (=> b!1014086 (= e!570457 (Cons!21420 (_1!7578 (h!22617 (t!30424 l!412))) call!42764))))

(declare-fun c!102608 () Bool)

(assert (=> b!1014086 (= c!102608 (not call!42763))))

(declare-fun lt!448427 () Unit!33150)

(declare-fun e!570459 () Unit!33150)

(assert (=> b!1014086 (= lt!448427 e!570459)))

(declare-fun e!570460 () Unit!33150)

(declare-fun lt!448426 () Unit!33150)

(assert (=> b!1014087 (= e!570460 lt!448426)))

(assert (=> b!1014087 (= lt!448421 (t!30424 (t!30424 l!412)))))

(assert (=> b!1014087 (= lt!448420 call!42764)))

(assert (=> b!1014087 (= lt!448417 (h!22617 (t!30424 l!412)))))

(assert (=> b!1014087 (= lt!448426 call!42765)))

(assert (=> b!1014087 call!42762))

(declare-fun b!1014088 () Bool)

(declare-fun lt!448418 () Unit!33150)

(assert (=> b!1014088 (= lt!448418 e!570460)))

(declare-fun c!102609 () Bool)

(assert (=> b!1014088 (= c!102609 (not call!42763))))

(declare-fun lt!448424 () List!21424)

(assert (=> b!1014088 (= lt!448424 call!42764)))

(declare-fun e!570458 () List!21424)

(assert (=> b!1014088 (= e!570458 call!42764)))

(declare-fun b!1014089 () Bool)

(declare-fun Unit!33160 () Unit!33150)

(assert (=> b!1014089 (= e!570459 Unit!33160)))

(declare-fun b!1014090 () Bool)

(assert (=> b!1014090 (= e!570458 Nil!21421)))

(declare-fun b!1014091 () Bool)

(assert (=> b!1014091 (= e!570457 e!570458)))

(declare-fun c!102607 () Bool)

(assert (=> b!1014091 (= c!102607 (and ((_ is Cons!21419) (t!30424 l!412)) (not (= (_2!7578 (h!22617 (t!30424 l!412))) value!115))))))

(declare-fun b!1014092 () Bool)

(declare-fun Unit!33161 () Unit!33150)

(assert (=> b!1014092 (= e!570460 Unit!33161)))

(assert (=> b!1014093 call!42762))

(declare-fun lt!448428 () Unit!33150)

(assert (=> b!1014093 (= lt!448428 call!42765)))

(assert (=> b!1014093 (= lt!448423 (h!22617 (t!30424 l!412)))))

(assert (=> b!1014093 (= lt!448425 call!42764)))

(assert (=> b!1014093 (= lt!448422 (t!30424 (t!30424 l!412)))))

(assert (=> b!1014093 (= e!570459 lt!448428)))

(assert (= (and d!120579 c!102606) b!1014086))

(assert (= (and d!120579 (not c!102606)) b!1014091))

(assert (= (and b!1014086 c!102608) b!1014093))

(assert (= (and b!1014086 (not c!102608)) b!1014089))

(assert (= (and b!1014091 c!102607) b!1014088))

(assert (= (and b!1014091 (not c!102607)) b!1014090))

(assert (= (and b!1014088 c!102609) b!1014087))

(assert (= (and b!1014088 (not c!102609)) b!1014092))

(assert (= (or b!1014093 b!1014087) bm!42760))

(assert (= (or b!1014093 b!1014087) bm!42762))

(assert (= (or b!1014086 b!1014093 b!1014087 b!1014088) bm!42759))

(assert (= (or b!1014086 b!1014088) bm!42761))

(declare-fun m!936765 () Bool)

(assert (=> d!120579 m!936765))

(declare-fun m!936767 () Bool)

(assert (=> d!120579 m!936767))

(declare-fun m!936769 () Bool)

(assert (=> bm!42760 m!936769))

(declare-fun m!936771 () Bool)

(assert (=> bm!42762 m!936771))

(declare-fun m!936773 () Bool)

(assert (=> bm!42761 m!936773))

(declare-fun m!936775 () Bool)

(assert (=> bm!42759 m!936775))

(assert (=> b!1013943 d!120579))

(declare-fun bs!29057 () Bool)

(declare-fun b!1014117 () Bool)

(assert (= bs!29057 (and b!1014117 b!1014093)))

(declare-fun lambda!658 () Int)

(assert (=> bs!29057 (= (= (t!30424 l!412) (Cons!21419 lt!448423 lt!448422)) (= lambda!658 lambda!649))))

(declare-fun bs!29058 () Bool)

(assert (= bs!29058 (and b!1014117 b!1013945)))

(assert (=> bs!29058 (= (= (t!30424 l!412) l!412) (= lambda!658 lambda!607))))

(declare-fun bs!29059 () Bool)

(assert (= bs!29059 (and b!1014117 b!1014087)))

(assert (=> bs!29059 (= (= (t!30424 l!412) (Cons!21419 lt!448417 lt!448421)) (= lambda!658 lambda!652))))

(declare-fun bs!29060 () Bool)

(assert (= bs!29060 (and b!1014117 d!120579)))

(assert (=> bs!29060 (= lambda!658 lambda!653)))

(declare-fun bs!29061 () Bool)

(assert (= bs!29061 (and b!1014117 b!1013943)))

(assert (=> bs!29061 (= (= (t!30424 l!412) l!412) (= lambda!658 lambda!608))))

(assert (=> b!1014117 true))

(assert (=> b!1014117 true))

(declare-fun bs!29062 () Bool)

(declare-fun d!120597 () Bool)

(assert (= bs!29062 (and d!120597 b!1014093)))

(declare-fun lambda!659 () Int)

(assert (=> bs!29062 (= (= (Cons!21419 (h!22617 l!412) (t!30424 l!412)) (Cons!21419 lt!448423 lt!448422)) (= lambda!659 lambda!649))))

(declare-fun bs!29063 () Bool)

(assert (= bs!29063 (and d!120597 b!1014117)))

(assert (=> bs!29063 (= (= (Cons!21419 (h!22617 l!412) (t!30424 l!412)) (t!30424 l!412)) (= lambda!659 lambda!658))))

(declare-fun bs!29064 () Bool)

(assert (= bs!29064 (and d!120597 b!1013945)))

(assert (=> bs!29064 (= (= (Cons!21419 (h!22617 l!412) (t!30424 l!412)) l!412) (= lambda!659 lambda!607))))

(declare-fun bs!29065 () Bool)

(assert (= bs!29065 (and d!120597 b!1014087)))

(assert (=> bs!29065 (= (= (Cons!21419 (h!22617 l!412) (t!30424 l!412)) (Cons!21419 lt!448417 lt!448421)) (= lambda!659 lambda!652))))

(declare-fun bs!29066 () Bool)

(assert (= bs!29066 (and d!120597 d!120579)))

(assert (=> bs!29066 (= (= (Cons!21419 (h!22617 l!412) (t!30424 l!412)) (t!30424 l!412)) (= lambda!659 lambda!653))))

(declare-fun bs!29067 () Bool)

(assert (= bs!29067 (and d!120597 b!1013943)))

(assert (=> bs!29067 (= (= (Cons!21419 (h!22617 l!412) (t!30424 l!412)) l!412) (= lambda!659 lambda!608))))

(assert (=> d!120597 true))

(assert (=> d!120597 true))

(assert (=> d!120597 true))

(assert (=> d!120597 (forall!237 lt!448305 lambda!659)))

(declare-fun lt!448431 () Unit!33150)

(declare-fun choose!1634 (List!21423 List!21424 B!1420 tuple2!15134) Unit!33150)

(assert (=> d!120597 (= lt!448431 (choose!1634 (t!30424 l!412) lt!448305 value!115 (h!22617 l!412)))))

(declare-fun e!570473 () Bool)

(assert (=> d!120597 e!570473))

(declare-fun res!680648 () Bool)

(assert (=> d!120597 (=> (not res!680648) (not e!570473))))

(assert (=> d!120597 (= res!680648 (isStrictlySorted!568 (t!30424 l!412)))))

(assert (=> d!120597 (= (lemmaForallGetValueByKeySameWithASmallerHead!32 (t!30424 l!412) lt!448305 value!115 (h!22617 l!412)) lt!448431)))

(declare-fun b!1014116 () Bool)

(declare-fun res!680649 () Bool)

(assert (=> b!1014116 (=> (not res!680649) (not e!570473))))

(declare-fun isEmpty!833 (List!21423) Bool)

(assert (=> b!1014116 (= res!680649 (not (isEmpty!833 (t!30424 l!412))))))

(declare-fun res!680650 () Bool)

(assert (=> b!1014117 (=> (not res!680650) (not e!570473))))

(assert (=> b!1014117 (= res!680650 (forall!237 lt!448305 lambda!658))))

(declare-fun b!1014118 () Bool)

(declare-fun head!940 (List!21423) tuple2!15134)

(assert (=> b!1014118 (= e!570473 (bvslt (_1!7578 (h!22617 l!412)) (_1!7578 (head!940 (t!30424 l!412)))))))

(assert (= (and d!120597 res!680648) b!1014116))

(assert (= (and b!1014116 res!680649) b!1014117))

(assert (= (and b!1014117 res!680650) b!1014118))

(declare-fun m!936777 () Bool)

(assert (=> d!120597 m!936777))

(declare-fun m!936779 () Bool)

(assert (=> d!120597 m!936779))

(assert (=> d!120597 m!936767))

(declare-fun m!936781 () Bool)

(assert (=> b!1014116 m!936781))

(declare-fun m!936783 () Bool)

(assert (=> b!1014117 m!936783))

(declare-fun m!936785 () Bool)

(assert (=> b!1014118 m!936785))

(assert (=> b!1013945 d!120597))

(declare-fun d!120599 () Bool)

(declare-fun res!680651 () Bool)

(declare-fun e!570474 () Bool)

(assert (=> d!120599 (=> res!680651 e!570474)))

(assert (=> d!120599 (= res!680651 ((_ is Nil!21421) lt!448305))))

(assert (=> d!120599 (= (forall!237 lt!448305 lambda!607) e!570474)))

(declare-fun b!1014119 () Bool)

(declare-fun e!570475 () Bool)

(assert (=> b!1014119 (= e!570474 e!570475)))

(declare-fun res!680652 () Bool)

(assert (=> b!1014119 (=> (not res!680652) (not e!570475))))

(assert (=> b!1014119 (= res!680652 (dynLambda!1890 lambda!607 (h!22618 lt!448305)))))

(declare-fun b!1014120 () Bool)

(assert (=> b!1014120 (= e!570475 (forall!237 (t!30425 lt!448305) lambda!607))))

(assert (= (and d!120599 (not res!680651)) b!1014119))

(assert (= (and b!1014119 res!680652) b!1014120))

(declare-fun b_lambda!15295 () Bool)

(assert (=> (not b_lambda!15295) (not b!1014119)))

(declare-fun m!936787 () Bool)

(assert (=> b!1014119 m!936787))

(declare-fun m!936789 () Bool)

(assert (=> b!1014120 m!936789))

(assert (=> b!1013945 d!120599))

(declare-fun d!120601 () Bool)

(declare-fun res!680657 () Bool)

(declare-fun e!570480 () Bool)

(assert (=> d!120601 (=> res!680657 e!570480)))

(assert (=> d!120601 (= res!680657 (or ((_ is Nil!21420) l!412) ((_ is Nil!21420) (t!30424 l!412))))))

(assert (=> d!120601 (= (isStrictlySorted!568 l!412) e!570480)))

(declare-fun b!1014125 () Bool)

(declare-fun e!570481 () Bool)

(assert (=> b!1014125 (= e!570480 e!570481)))

(declare-fun res!680658 () Bool)

(assert (=> b!1014125 (=> (not res!680658) (not e!570481))))

(assert (=> b!1014125 (= res!680658 (bvslt (_1!7578 (h!22617 l!412)) (_1!7578 (h!22617 (t!30424 l!412)))))))

(declare-fun b!1014126 () Bool)

(assert (=> b!1014126 (= e!570481 (isStrictlySorted!568 (t!30424 l!412)))))

(assert (= (and d!120601 (not res!680657)) b!1014125))

(assert (= (and b!1014125 res!680658) b!1014126))

(assert (=> b!1014126 m!936767))

(assert (=> start!87626 d!120601))

(declare-fun b!1014131 () Bool)

(declare-fun e!570484 () Bool)

(declare-fun tp!70496 () Bool)

(assert (=> b!1014131 (= e!570484 (and tp_is_empty!23487 tp!70496))))

(assert (=> b!1013944 (= tp!70484 e!570484)))

(assert (= (and b!1013944 ((_ is Cons!21419) (t!30424 l!412))) b!1014131))

(declare-fun b_lambda!15297 () Bool)

(assert (= b_lambda!15295 (or b!1013945 b_lambda!15297)))

(declare-fun bs!29068 () Bool)

(declare-fun d!120603 () Bool)

(assert (= bs!29068 (and d!120603 b!1013945)))

(declare-datatypes ((Option!576 0))(
  ( (Some!575 (v!14426 B!1420)) (None!574) )
))
(declare-fun getValueByKey!525 (List!21423 (_ BitVec 64)) Option!576)

(assert (=> bs!29068 (= (dynLambda!1890 lambda!607 (h!22618 lt!448305)) (= (getValueByKey!525 l!412 (h!22618 lt!448305)) (Some!575 value!115)))))

(declare-fun m!936791 () Bool)

(assert (=> bs!29068 m!936791))

(assert (=> b!1014119 d!120603))

(declare-fun b_lambda!15299 () Bool)

(assert (= b_lambda!15281 (or b!1013943 b_lambda!15299)))

(declare-fun bs!29069 () Bool)

(declare-fun d!120605 () Bool)

(assert (= bs!29069 (and d!120605 b!1013943)))

(assert (=> bs!29069 (= (dynLambda!1890 lambda!608 (h!22618 (Cons!21420 (_1!7578 (h!22617 l!412)) lt!448305))) (= (getValueByKey!525 l!412 (h!22618 (Cons!21420 (_1!7578 (h!22617 l!412)) lt!448305))) (Some!575 value!115)))))

(declare-fun m!936793 () Bool)

(assert (=> bs!29069 m!936793))

(assert (=> b!1013998 d!120605))

(check-sat (not b!1014118) (not d!120579) (not bs!29068) (not bm!42761) (not bm!42762) (not b!1013999) (not bm!42760) (not b!1014120) (not b!1014126) (not b!1014131) (not bs!29069) (not b_lambda!15297) (not d!120597) (not b!1014116) (not b_lambda!15299) (not b!1014117) tp_is_empty!23487 (not bm!42759))
(check-sat)
(get-model)

(declare-fun d!120623 () Bool)

(declare-fun res!680665 () Bool)

(declare-fun e!570495 () Bool)

(assert (=> d!120623 (=> res!680665 e!570495)))

(assert (=> d!120623 (= res!680665 (or ((_ is Nil!21420) (t!30424 l!412)) ((_ is Nil!21420) (t!30424 (t!30424 l!412)))))))

(assert (=> d!120623 (= (isStrictlySorted!568 (t!30424 l!412)) e!570495)))

(declare-fun b!1014146 () Bool)

(declare-fun e!570496 () Bool)

(assert (=> b!1014146 (= e!570495 e!570496)))

(declare-fun res!680666 () Bool)

(assert (=> b!1014146 (=> (not res!680666) (not e!570496))))

(assert (=> b!1014146 (= res!680666 (bvslt (_1!7578 (h!22617 (t!30424 l!412))) (_1!7578 (h!22617 (t!30424 (t!30424 l!412))))))))

(declare-fun b!1014147 () Bool)

(assert (=> b!1014147 (= e!570496 (isStrictlySorted!568 (t!30424 (t!30424 l!412))))))

(assert (= (and d!120623 (not res!680665)) b!1014146))

(assert (= (and b!1014146 res!680666) b!1014147))

(declare-fun m!936807 () Bool)

(assert (=> b!1014147 m!936807))

(assert (=> b!1014126 d!120623))

(declare-fun d!120625 () Bool)

(assert (=> d!120625 (= (isEmpty!833 (t!30424 l!412)) ((_ is Nil!21420) (t!30424 l!412)))))

(assert (=> b!1014116 d!120625))

(declare-fun d!120629 () Bool)

(declare-fun res!680667 () Bool)

(declare-fun e!570503 () Bool)

(assert (=> d!120629 (=> res!680667 e!570503)))

(assert (=> d!120629 (= res!680667 ((_ is Nil!21421) lt!448305))))

(assert (=> d!120629 (= (forall!237 lt!448305 lambda!659) e!570503)))

(declare-fun b!1014160 () Bool)

(declare-fun e!570504 () Bool)

(assert (=> b!1014160 (= e!570503 e!570504)))

(declare-fun res!680668 () Bool)

(assert (=> b!1014160 (=> (not res!680668) (not e!570504))))

(assert (=> b!1014160 (= res!680668 (dynLambda!1890 lambda!659 (h!22618 lt!448305)))))

(declare-fun b!1014161 () Bool)

(assert (=> b!1014161 (= e!570504 (forall!237 (t!30425 lt!448305) lambda!659))))

(assert (= (and d!120629 (not res!680667)) b!1014160))

(assert (= (and b!1014160 res!680668) b!1014161))

(declare-fun b_lambda!15305 () Bool)

(assert (=> (not b_lambda!15305) (not b!1014160)))

(declare-fun m!936811 () Bool)

(assert (=> b!1014160 m!936811))

(declare-fun m!936813 () Bool)

(assert (=> b!1014161 m!936813))

(assert (=> d!120597 d!120629))

(declare-fun bs!29096 () Bool)

(declare-fun d!120631 () Bool)

(assert (= bs!29096 (and d!120631 b!1014093)))

(declare-fun lambda!667 () Int)

(assert (=> bs!29096 (= (= (Cons!21419 (h!22617 l!412) (t!30424 l!412)) (Cons!21419 lt!448423 lt!448422)) (= lambda!667 lambda!649))))

(declare-fun bs!29099 () Bool)

(assert (= bs!29099 (and d!120631 b!1014117)))

(assert (=> bs!29099 (= (= (Cons!21419 (h!22617 l!412) (t!30424 l!412)) (t!30424 l!412)) (= lambda!667 lambda!658))))

(declare-fun bs!29101 () Bool)

(assert (= bs!29101 (and d!120631 d!120597)))

(assert (=> bs!29101 (= lambda!667 lambda!659)))

(declare-fun bs!29103 () Bool)

(assert (= bs!29103 (and d!120631 b!1013945)))

(assert (=> bs!29103 (= (= (Cons!21419 (h!22617 l!412) (t!30424 l!412)) l!412) (= lambda!667 lambda!607))))

(declare-fun bs!29105 () Bool)

(assert (= bs!29105 (and d!120631 b!1014087)))

(assert (=> bs!29105 (= (= (Cons!21419 (h!22617 l!412) (t!30424 l!412)) (Cons!21419 lt!448417 lt!448421)) (= lambda!667 lambda!652))))

(declare-fun bs!29107 () Bool)

(assert (= bs!29107 (and d!120631 d!120579)))

(assert (=> bs!29107 (= (= (Cons!21419 (h!22617 l!412) (t!30424 l!412)) (t!30424 l!412)) (= lambda!667 lambda!653))))

(declare-fun bs!29109 () Bool)

(assert (= bs!29109 (and d!120631 b!1013943)))

(assert (=> bs!29109 (= (= (Cons!21419 (h!22617 l!412) (t!30424 l!412)) l!412) (= lambda!667 lambda!608))))

(assert (=> d!120631 true))

(assert (=> d!120631 true))

(assert (=> d!120631 true))

(assert (=> d!120631 (forall!237 lt!448305 lambda!667)))

(assert (=> d!120631 true))

(declare-fun _$15!113 () Unit!33150)

(assert (=> d!120631 (= (choose!1634 (t!30424 l!412) lt!448305 value!115 (h!22617 l!412)) _$15!113)))

(declare-fun bs!29112 () Bool)

(assert (= bs!29112 d!120631))

(declare-fun m!936815 () Bool)

(assert (=> bs!29112 m!936815))

(assert (=> d!120597 d!120631))

(assert (=> d!120597 d!120623))

(declare-fun bs!29113 () Bool)

(declare-fun b!1014169 () Bool)

(assert (= bs!29113 (and b!1014169 b!1014093)))

(declare-fun lambda!669 () Int)

(declare-fun lt!448449 () List!21423)

(declare-fun lt!448450 () tuple2!15134)

(assert (=> bs!29113 (= (= (Cons!21419 lt!448450 lt!448449) (Cons!21419 lt!448423 lt!448422)) (= lambda!669 lambda!649))))

(declare-fun bs!29114 () Bool)

(assert (= bs!29114 (and b!1014169 b!1014117)))

(assert (=> bs!29114 (= (= (Cons!21419 lt!448450 lt!448449) (t!30424 l!412)) (= lambda!669 lambda!658))))

(declare-fun bs!29115 () Bool)

(assert (= bs!29115 (and b!1014169 d!120597)))

(assert (=> bs!29115 (= (= (Cons!21419 lt!448450 lt!448449) (Cons!21419 (h!22617 l!412) (t!30424 l!412))) (= lambda!669 lambda!659))))

(declare-fun bs!29116 () Bool)

(assert (= bs!29116 (and b!1014169 b!1013945)))

(assert (=> bs!29116 (= (= (Cons!21419 lt!448450 lt!448449) l!412) (= lambda!669 lambda!607))))

(declare-fun bs!29117 () Bool)

(assert (= bs!29117 (and b!1014169 b!1014087)))

(assert (=> bs!29117 (= (= (Cons!21419 lt!448450 lt!448449) (Cons!21419 lt!448417 lt!448421)) (= lambda!669 lambda!652))))

(declare-fun bs!29119 () Bool)

(assert (= bs!29119 (and b!1014169 d!120579)))

(assert (=> bs!29119 (= (= (Cons!21419 lt!448450 lt!448449) (t!30424 l!412)) (= lambda!669 lambda!653))))

(declare-fun bs!29121 () Bool)

(assert (= bs!29121 (and b!1014169 d!120631)))

(assert (=> bs!29121 (= (= (Cons!21419 lt!448450 lt!448449) (Cons!21419 (h!22617 l!412) (t!30424 l!412))) (= lambda!669 lambda!667))))

(declare-fun bs!29124 () Bool)

(assert (= bs!29124 (and b!1014169 b!1013943)))

(assert (=> bs!29124 (= (= (Cons!21419 lt!448450 lt!448449) l!412) (= lambda!669 lambda!608))))

(assert (=> b!1014169 true))

(assert (=> b!1014169 true))

(assert (=> b!1014169 true))

(declare-fun bs!29132 () Bool)

(declare-fun b!1014163 () Bool)

(assert (= bs!29132 (and b!1014163 b!1014093)))

(declare-fun lt!448448 () List!21423)

(declare-fun lt!448444 () tuple2!15134)

(declare-fun lambda!671 () Int)

(assert (=> bs!29132 (= (= (Cons!21419 lt!448444 lt!448448) (Cons!21419 lt!448423 lt!448422)) (= lambda!671 lambda!649))))

(declare-fun bs!29133 () Bool)

(assert (= bs!29133 (and b!1014163 b!1014117)))

(assert (=> bs!29133 (= (= (Cons!21419 lt!448444 lt!448448) (t!30424 l!412)) (= lambda!671 lambda!658))))

(declare-fun bs!29134 () Bool)

(assert (= bs!29134 (and b!1014163 b!1013945)))

(assert (=> bs!29134 (= (= (Cons!21419 lt!448444 lt!448448) l!412) (= lambda!671 lambda!607))))

(declare-fun bs!29135 () Bool)

(assert (= bs!29135 (and b!1014163 b!1014087)))

(assert (=> bs!29135 (= (= (Cons!21419 lt!448444 lt!448448) (Cons!21419 lt!448417 lt!448421)) (= lambda!671 lambda!652))))

(declare-fun bs!29136 () Bool)

(assert (= bs!29136 (and b!1014163 d!120579)))

(assert (=> bs!29136 (= (= (Cons!21419 lt!448444 lt!448448) (t!30424 l!412)) (= lambda!671 lambda!653))))

(declare-fun bs!29138 () Bool)

(assert (= bs!29138 (and b!1014163 d!120631)))

(assert (=> bs!29138 (= (= (Cons!21419 lt!448444 lt!448448) (Cons!21419 (h!22617 l!412) (t!30424 l!412))) (= lambda!671 lambda!667))))

(declare-fun bs!29141 () Bool)

(assert (= bs!29141 (and b!1014163 b!1013943)))

(assert (=> bs!29141 (= (= (Cons!21419 lt!448444 lt!448448) l!412) (= lambda!671 lambda!608))))

(declare-fun bs!29143 () Bool)

(assert (= bs!29143 (and b!1014163 b!1014169)))

(assert (=> bs!29143 (= (= (Cons!21419 lt!448444 lt!448448) (Cons!21419 lt!448450 lt!448449)) (= lambda!671 lambda!669))))

(declare-fun bs!29145 () Bool)

(assert (= bs!29145 (and b!1014163 d!120597)))

(assert (=> bs!29145 (= (= (Cons!21419 lt!448444 lt!448448) (Cons!21419 (h!22617 l!412) (t!30424 l!412))) (= lambda!671 lambda!659))))

(assert (=> b!1014163 true))

(assert (=> b!1014163 true))

(assert (=> b!1014163 true))

(declare-fun bs!29151 () Bool)

(declare-fun d!120633 () Bool)

(assert (= bs!29151 (and d!120633 b!1014093)))

(declare-fun lambda!673 () Int)

(assert (=> bs!29151 (= (= (t!30424 (t!30424 l!412)) (Cons!21419 lt!448423 lt!448422)) (= lambda!673 lambda!649))))

(declare-fun bs!29153 () Bool)

(assert (= bs!29153 (and d!120633 b!1014117)))

(assert (=> bs!29153 (= (= (t!30424 (t!30424 l!412)) (t!30424 l!412)) (= lambda!673 lambda!658))))

(declare-fun bs!29155 () Bool)

(assert (= bs!29155 (and d!120633 b!1014163)))

(assert (=> bs!29155 (= (= (t!30424 (t!30424 l!412)) (Cons!21419 lt!448444 lt!448448)) (= lambda!673 lambda!671))))

(declare-fun bs!29156 () Bool)

(assert (= bs!29156 (and d!120633 b!1013945)))

(assert (=> bs!29156 (= (= (t!30424 (t!30424 l!412)) l!412) (= lambda!673 lambda!607))))

(declare-fun bs!29157 () Bool)

(assert (= bs!29157 (and d!120633 b!1014087)))

(assert (=> bs!29157 (= (= (t!30424 (t!30424 l!412)) (Cons!21419 lt!448417 lt!448421)) (= lambda!673 lambda!652))))

(declare-fun bs!29158 () Bool)

(assert (= bs!29158 (and d!120633 d!120579)))

(assert (=> bs!29158 (= (= (t!30424 (t!30424 l!412)) (t!30424 l!412)) (= lambda!673 lambda!653))))

(declare-fun bs!29159 () Bool)

(assert (= bs!29159 (and d!120633 d!120631)))

(assert (=> bs!29159 (= (= (t!30424 (t!30424 l!412)) (Cons!21419 (h!22617 l!412) (t!30424 l!412))) (= lambda!673 lambda!667))))

(declare-fun bs!29160 () Bool)

(assert (= bs!29160 (and d!120633 b!1013943)))

(assert (=> bs!29160 (= (= (t!30424 (t!30424 l!412)) l!412) (= lambda!673 lambda!608))))

(declare-fun bs!29161 () Bool)

(assert (= bs!29161 (and d!120633 b!1014169)))

(assert (=> bs!29161 (= (= (t!30424 (t!30424 l!412)) (Cons!21419 lt!448450 lt!448449)) (= lambda!673 lambda!669))))

(declare-fun bs!29162 () Bool)

(assert (= bs!29162 (and d!120633 d!120597)))

(assert (=> bs!29162 (= (= (t!30424 (t!30424 l!412)) (Cons!21419 (h!22617 l!412) (t!30424 l!412))) (= lambda!673 lambda!659))))

(assert (=> d!120633 true))

(assert (=> d!120633 true))

(declare-fun bm!42767 () Bool)

(declare-fun call!42772 () List!21424)

(assert (=> bm!42767 (= call!42772 (getKeysOf!44 (t!30424 (t!30424 (t!30424 l!412))) value!115))))

(declare-fun lt!448446 () List!21424)

(assert (=> d!120633 (forall!237 lt!448446 lambda!673)))

(declare-fun e!570505 () List!21424)

(assert (=> d!120633 (= lt!448446 e!570505)))

(declare-fun c!102620 () Bool)

(assert (=> d!120633 (= c!102620 (and ((_ is Cons!21419) (t!30424 (t!30424 l!412))) (= (_2!7578 (h!22617 (t!30424 (t!30424 l!412)))) value!115)))))

(assert (=> d!120633 (isStrictlySorted!568 (t!30424 (t!30424 l!412)))))

(assert (=> d!120633 (= (getKeysOf!44 (t!30424 (t!30424 l!412)) value!115) lt!448446)))

(declare-fun lt!448447 () List!21424)

(declare-fun call!42773 () Unit!33150)

(declare-fun bm!42768 () Bool)

(declare-fun lt!448452 () List!21424)

(assert (=> bm!42768 (= call!42773 (lemmaForallGetValueByKeySameWithASmallerHead!32 (ite c!102620 lt!448449 lt!448448) (ite c!102620 lt!448452 lt!448447) value!115 (ite c!102620 lt!448450 lt!448444)))))

(declare-fun bm!42769 () Bool)

(declare-fun call!42771 () Bool)

(assert (=> bm!42769 (= call!42771 (isEmpty!829 call!42772))))

(declare-fun call!42770 () Bool)

(declare-fun bm!42770 () Bool)

(assert (=> bm!42770 (= call!42770 (forall!237 (ite c!102620 lt!448452 lt!448447) (ite c!102620 lambda!669 lambda!671)))))

(declare-fun b!1014162 () Bool)

(assert (=> b!1014162 (= e!570505 (Cons!21420 (_1!7578 (h!22617 (t!30424 (t!30424 l!412)))) call!42772))))

(declare-fun c!102622 () Bool)

(assert (=> b!1014162 (= c!102622 (not call!42771))))

(declare-fun lt!448454 () Unit!33150)

(declare-fun e!570507 () Unit!33150)

(assert (=> b!1014162 (= lt!448454 e!570507)))

(declare-fun e!570508 () Unit!33150)

(declare-fun lt!448453 () Unit!33150)

(assert (=> b!1014163 (= e!570508 lt!448453)))

(assert (=> b!1014163 (= lt!448448 (t!30424 (t!30424 (t!30424 l!412))))))

(assert (=> b!1014163 (= lt!448447 call!42772)))

(assert (=> b!1014163 (= lt!448444 (h!22617 (t!30424 (t!30424 l!412))))))

(assert (=> b!1014163 (= lt!448453 call!42773)))

(assert (=> b!1014163 call!42770))

(declare-fun b!1014164 () Bool)

(declare-fun lt!448445 () Unit!33150)

(assert (=> b!1014164 (= lt!448445 e!570508)))

(declare-fun c!102623 () Bool)

(assert (=> b!1014164 (= c!102623 (not call!42771))))

(declare-fun lt!448451 () List!21424)

(assert (=> b!1014164 (= lt!448451 call!42772)))

(declare-fun e!570506 () List!21424)

(assert (=> b!1014164 (= e!570506 call!42772)))

(declare-fun b!1014165 () Bool)

(declare-fun Unit!33164 () Unit!33150)

(assert (=> b!1014165 (= e!570507 Unit!33164)))

(declare-fun b!1014166 () Bool)

(assert (=> b!1014166 (= e!570506 Nil!21421)))

(declare-fun b!1014167 () Bool)

(assert (=> b!1014167 (= e!570505 e!570506)))

(declare-fun c!102621 () Bool)

(assert (=> b!1014167 (= c!102621 (and ((_ is Cons!21419) (t!30424 (t!30424 l!412))) (not (= (_2!7578 (h!22617 (t!30424 (t!30424 l!412)))) value!115))))))

(declare-fun b!1014168 () Bool)

(declare-fun Unit!33165 () Unit!33150)

(assert (=> b!1014168 (= e!570508 Unit!33165)))

(assert (=> b!1014169 call!42770))

(declare-fun lt!448455 () Unit!33150)

(assert (=> b!1014169 (= lt!448455 call!42773)))

(assert (=> b!1014169 (= lt!448450 (h!22617 (t!30424 (t!30424 l!412))))))

(assert (=> b!1014169 (= lt!448452 call!42772)))

(assert (=> b!1014169 (= lt!448449 (t!30424 (t!30424 (t!30424 l!412))))))

(assert (=> b!1014169 (= e!570507 lt!448455)))

(assert (= (and d!120633 c!102620) b!1014162))

(assert (= (and d!120633 (not c!102620)) b!1014167))

(assert (= (and b!1014162 c!102622) b!1014169))

(assert (= (and b!1014162 (not c!102622)) b!1014165))

(assert (= (and b!1014167 c!102621) b!1014164))

(assert (= (and b!1014167 (not c!102621)) b!1014166))

(assert (= (and b!1014164 c!102623) b!1014163))

(assert (= (and b!1014164 (not c!102623)) b!1014168))

(assert (= (or b!1014169 b!1014163) bm!42768))

(assert (= (or b!1014169 b!1014163) bm!42770))

(assert (= (or b!1014162 b!1014169 b!1014163 b!1014164) bm!42767))

(assert (= (or b!1014162 b!1014164) bm!42769))

(declare-fun m!936845 () Bool)

(assert (=> d!120633 m!936845))

(assert (=> d!120633 m!936807))

(declare-fun m!936847 () Bool)

(assert (=> bm!42768 m!936847))

(declare-fun m!936849 () Bool)

(assert (=> bm!42770 m!936849))

(declare-fun m!936851 () Bool)

(assert (=> bm!42769 m!936851))

(declare-fun m!936853 () Bool)

(assert (=> bm!42767 m!936853))

(assert (=> bm!42759 d!120633))

(declare-fun bs!29163 () Bool)

(declare-fun b!1014182 () Bool)

(assert (= bs!29163 (and b!1014182 b!1014093)))

(declare-fun lambda!674 () Int)

(assert (=> bs!29163 (= (= (ite c!102606 lt!448422 lt!448421) (Cons!21419 lt!448423 lt!448422)) (= lambda!674 lambda!649))))

(declare-fun bs!29164 () Bool)

(assert (= bs!29164 (and b!1014182 b!1014117)))

(assert (=> bs!29164 (= (= (ite c!102606 lt!448422 lt!448421) (t!30424 l!412)) (= lambda!674 lambda!658))))

(declare-fun bs!29165 () Bool)

(assert (= bs!29165 (and b!1014182 b!1014163)))

(assert (=> bs!29165 (= (= (ite c!102606 lt!448422 lt!448421) (Cons!21419 lt!448444 lt!448448)) (= lambda!674 lambda!671))))

(declare-fun bs!29166 () Bool)

(assert (= bs!29166 (and b!1014182 b!1013945)))

(assert (=> bs!29166 (= (= (ite c!102606 lt!448422 lt!448421) l!412) (= lambda!674 lambda!607))))

(declare-fun bs!29167 () Bool)

(assert (= bs!29167 (and b!1014182 b!1014087)))

(assert (=> bs!29167 (= (= (ite c!102606 lt!448422 lt!448421) (Cons!21419 lt!448417 lt!448421)) (= lambda!674 lambda!652))))

(declare-fun bs!29168 () Bool)

(assert (= bs!29168 (and b!1014182 d!120579)))

(assert (=> bs!29168 (= (= (ite c!102606 lt!448422 lt!448421) (t!30424 l!412)) (= lambda!674 lambda!653))))

(declare-fun bs!29169 () Bool)

(assert (= bs!29169 (and b!1014182 d!120631)))

(assert (=> bs!29169 (= (= (ite c!102606 lt!448422 lt!448421) (Cons!21419 (h!22617 l!412) (t!30424 l!412))) (= lambda!674 lambda!667))))

(declare-fun bs!29171 () Bool)

(assert (= bs!29171 (and b!1014182 b!1013943)))

(assert (=> bs!29171 (= (= (ite c!102606 lt!448422 lt!448421) l!412) (= lambda!674 lambda!608))))

(declare-fun bs!29173 () Bool)

(assert (= bs!29173 (and b!1014182 d!120633)))

(assert (=> bs!29173 (= (= (ite c!102606 lt!448422 lt!448421) (t!30424 (t!30424 l!412))) (= lambda!674 lambda!673))))

(declare-fun bs!29174 () Bool)

(assert (= bs!29174 (and b!1014182 b!1014169)))

(assert (=> bs!29174 (= (= (ite c!102606 lt!448422 lt!448421) (Cons!21419 lt!448450 lt!448449)) (= lambda!674 lambda!669))))

(declare-fun bs!29176 () Bool)

(assert (= bs!29176 (and b!1014182 d!120597)))

(assert (=> bs!29176 (= (= (ite c!102606 lt!448422 lt!448421) (Cons!21419 (h!22617 l!412) (t!30424 l!412))) (= lambda!674 lambda!659))))

(assert (=> b!1014182 true))

(assert (=> b!1014182 true))

(declare-fun bs!29179 () Bool)

(declare-fun d!120643 () Bool)

(assert (= bs!29179 (and d!120643 b!1014093)))

(declare-fun lambda!675 () Int)

(assert (=> bs!29179 (= (= (Cons!21419 (ite c!102606 lt!448423 lt!448417) (ite c!102606 lt!448422 lt!448421)) (Cons!21419 lt!448423 lt!448422)) (= lambda!675 lambda!649))))

(declare-fun bs!29180 () Bool)

(assert (= bs!29180 (and d!120643 b!1014117)))

(assert (=> bs!29180 (= (= (Cons!21419 (ite c!102606 lt!448423 lt!448417) (ite c!102606 lt!448422 lt!448421)) (t!30424 l!412)) (= lambda!675 lambda!658))))

(declare-fun bs!29181 () Bool)

(assert (= bs!29181 (and d!120643 b!1014163)))

(assert (=> bs!29181 (= (= (Cons!21419 (ite c!102606 lt!448423 lt!448417) (ite c!102606 lt!448422 lt!448421)) (Cons!21419 lt!448444 lt!448448)) (= lambda!675 lambda!671))))

(declare-fun bs!29182 () Bool)

(assert (= bs!29182 (and d!120643 b!1013945)))

(assert (=> bs!29182 (= (= (Cons!21419 (ite c!102606 lt!448423 lt!448417) (ite c!102606 lt!448422 lt!448421)) l!412) (= lambda!675 lambda!607))))

(declare-fun bs!29183 () Bool)

(assert (= bs!29183 (and d!120643 b!1014087)))

(assert (=> bs!29183 (= (= (Cons!21419 (ite c!102606 lt!448423 lt!448417) (ite c!102606 lt!448422 lt!448421)) (Cons!21419 lt!448417 lt!448421)) (= lambda!675 lambda!652))))

(declare-fun bs!29184 () Bool)

(assert (= bs!29184 (and d!120643 d!120579)))

(assert (=> bs!29184 (= (= (Cons!21419 (ite c!102606 lt!448423 lt!448417) (ite c!102606 lt!448422 lt!448421)) (t!30424 l!412)) (= lambda!675 lambda!653))))

(declare-fun bs!29185 () Bool)

(assert (= bs!29185 (and d!120643 d!120631)))

(assert (=> bs!29185 (= (= (Cons!21419 (ite c!102606 lt!448423 lt!448417) (ite c!102606 lt!448422 lt!448421)) (Cons!21419 (h!22617 l!412) (t!30424 l!412))) (= lambda!675 lambda!667))))

(declare-fun bs!29186 () Bool)

(assert (= bs!29186 (and d!120643 b!1013943)))

(assert (=> bs!29186 (= (= (Cons!21419 (ite c!102606 lt!448423 lt!448417) (ite c!102606 lt!448422 lt!448421)) l!412) (= lambda!675 lambda!608))))

(declare-fun bs!29187 () Bool)

(assert (= bs!29187 (and d!120643 d!120633)))

(assert (=> bs!29187 (= (= (Cons!21419 (ite c!102606 lt!448423 lt!448417) (ite c!102606 lt!448422 lt!448421)) (t!30424 (t!30424 l!412))) (= lambda!675 lambda!673))))

(declare-fun bs!29188 () Bool)

(assert (= bs!29188 (and d!120643 b!1014182)))

(assert (=> bs!29188 (= (= (Cons!21419 (ite c!102606 lt!448423 lt!448417) (ite c!102606 lt!448422 lt!448421)) (ite c!102606 lt!448422 lt!448421)) (= lambda!675 lambda!674))))

(declare-fun bs!29189 () Bool)

(assert (= bs!29189 (and d!120643 b!1014169)))

(assert (=> bs!29189 (= (= (Cons!21419 (ite c!102606 lt!448423 lt!448417) (ite c!102606 lt!448422 lt!448421)) (Cons!21419 lt!448450 lt!448449)) (= lambda!675 lambda!669))))

(declare-fun bs!29190 () Bool)

(assert (= bs!29190 (and d!120643 d!120597)))

(assert (=> bs!29190 (= (= (Cons!21419 (ite c!102606 lt!448423 lt!448417) (ite c!102606 lt!448422 lt!448421)) (Cons!21419 (h!22617 l!412) (t!30424 l!412))) (= lambda!675 lambda!659))))

(assert (=> d!120643 true))

(assert (=> d!120643 true))

(assert (=> d!120643 true))

(assert (=> d!120643 (forall!237 (ite c!102606 lt!448425 lt!448420) lambda!675)))

(declare-fun lt!448457 () Unit!33150)

(assert (=> d!120643 (= lt!448457 (choose!1634 (ite c!102606 lt!448422 lt!448421) (ite c!102606 lt!448425 lt!448420) value!115 (ite c!102606 lt!448423 lt!448417)))))

(declare-fun e!570516 () Bool)

(assert (=> d!120643 e!570516))

(declare-fun res!680676 () Bool)

(assert (=> d!120643 (=> (not res!680676) (not e!570516))))

(assert (=> d!120643 (= res!680676 (isStrictlySorted!568 (ite c!102606 lt!448422 lt!448421)))))

(assert (=> d!120643 (= (lemmaForallGetValueByKeySameWithASmallerHead!32 (ite c!102606 lt!448422 lt!448421) (ite c!102606 lt!448425 lt!448420) value!115 (ite c!102606 lt!448423 lt!448417)) lt!448457)))

(declare-fun b!1014181 () Bool)

(declare-fun res!680677 () Bool)

(assert (=> b!1014181 (=> (not res!680677) (not e!570516))))

(assert (=> b!1014181 (= res!680677 (not (isEmpty!833 (ite c!102606 lt!448422 lt!448421))))))

(declare-fun res!680678 () Bool)

(assert (=> b!1014182 (=> (not res!680678) (not e!570516))))

(assert (=> b!1014182 (= res!680678 (forall!237 (ite c!102606 lt!448425 lt!448420) lambda!674))))

(declare-fun b!1014183 () Bool)

(assert (=> b!1014183 (= e!570516 (bvslt (_1!7578 (ite c!102606 lt!448423 lt!448417)) (_1!7578 (head!940 (ite c!102606 lt!448422 lt!448421)))))))

(assert (= (and d!120643 res!680676) b!1014181))

(assert (= (and b!1014181 res!680677) b!1014182))

(assert (= (and b!1014182 res!680678) b!1014183))

(declare-fun m!936883 () Bool)

(assert (=> d!120643 m!936883))

(declare-fun m!936885 () Bool)

(assert (=> d!120643 m!936885))

(declare-fun m!936887 () Bool)

(assert (=> d!120643 m!936887))

(declare-fun m!936889 () Bool)

(assert (=> b!1014181 m!936889))

(declare-fun m!936891 () Bool)

(assert (=> b!1014182 m!936891))

(declare-fun m!936893 () Bool)

(assert (=> b!1014183 m!936893))

(assert (=> bm!42760 d!120643))

(declare-fun d!120665 () Bool)

(declare-fun res!680690 () Bool)

(declare-fun e!570527 () Bool)

(assert (=> d!120665 (=> res!680690 e!570527)))

(assert (=> d!120665 (= res!680690 ((_ is Nil!21421) lt!448305))))

(assert (=> d!120665 (= (forall!237 lt!448305 lambda!658) e!570527)))

(declare-fun b!1014196 () Bool)

(declare-fun e!570528 () Bool)

(assert (=> b!1014196 (= e!570527 e!570528)))

(declare-fun res!680691 () Bool)

(assert (=> b!1014196 (=> (not res!680691) (not e!570528))))

(assert (=> b!1014196 (= res!680691 (dynLambda!1890 lambda!658 (h!22618 lt!448305)))))

(declare-fun b!1014197 () Bool)

(assert (=> b!1014197 (= e!570528 (forall!237 (t!30425 lt!448305) lambda!658))))

(assert (= (and d!120665 (not res!680690)) b!1014196))

(assert (= (and b!1014196 res!680691) b!1014197))

(declare-fun b_lambda!15329 () Bool)

(assert (=> (not b_lambda!15329) (not b!1014196)))

(declare-fun m!936895 () Bool)

(assert (=> b!1014196 m!936895))

(declare-fun m!936897 () Bool)

(assert (=> b!1014197 m!936897))

(assert (=> b!1014117 d!120665))

(declare-fun d!120667 () Bool)

(assert (=> d!120667 (= (head!940 (t!30424 l!412)) (h!22617 (t!30424 l!412)))))

(assert (=> b!1014118 d!120667))

(declare-fun b!1014210 () Bool)

(declare-fun e!570536 () Option!576)

(assert (=> b!1014210 (= e!570536 (getValueByKey!525 (t!30424 l!412) (h!22618 lt!448305)))))

(declare-fun b!1014209 () Bool)

(declare-fun e!570535 () Option!576)

(assert (=> b!1014209 (= e!570535 e!570536)))

(declare-fun c!102631 () Bool)

(assert (=> b!1014209 (= c!102631 (and ((_ is Cons!21419) l!412) (not (= (_1!7578 (h!22617 l!412)) (h!22618 lt!448305)))))))

(declare-fun d!120669 () Bool)

(declare-fun c!102630 () Bool)

(assert (=> d!120669 (= c!102630 (and ((_ is Cons!21419) l!412) (= (_1!7578 (h!22617 l!412)) (h!22618 lt!448305))))))

(assert (=> d!120669 (= (getValueByKey!525 l!412 (h!22618 lt!448305)) e!570535)))

(declare-fun b!1014208 () Bool)

(assert (=> b!1014208 (= e!570535 (Some!575 (_2!7578 (h!22617 l!412))))))

(declare-fun b!1014211 () Bool)

(assert (=> b!1014211 (= e!570536 None!574)))

(assert (= (and d!120669 c!102630) b!1014208))

(assert (= (and d!120669 (not c!102630)) b!1014209))

(assert (= (and b!1014209 c!102631) b!1014210))

(assert (= (and b!1014209 (not c!102631)) b!1014211))

(declare-fun m!936915 () Bool)

(assert (=> b!1014210 m!936915))

(assert (=> bs!29068 d!120669))

(declare-fun d!120677 () Bool)

(assert (=> d!120677 (= (isEmpty!829 call!42764) ((_ is Nil!21421) call!42764))))

(assert (=> bm!42761 d!120677))

(declare-fun d!120679 () Bool)

(declare-fun res!680694 () Bool)

(declare-fun e!570537 () Bool)

(assert (=> d!120679 (=> res!680694 e!570537)))

(assert (=> d!120679 (= res!680694 ((_ is Nil!21421) (ite c!102606 lt!448425 lt!448420)))))

(assert (=> d!120679 (= (forall!237 (ite c!102606 lt!448425 lt!448420) (ite c!102606 lambda!649 lambda!652)) e!570537)))

(declare-fun b!1014212 () Bool)

(declare-fun e!570538 () Bool)

(assert (=> b!1014212 (= e!570537 e!570538)))

(declare-fun res!680695 () Bool)

(assert (=> b!1014212 (=> (not res!680695) (not e!570538))))

(assert (=> b!1014212 (= res!680695 (dynLambda!1890 (ite c!102606 lambda!649 lambda!652) (h!22618 (ite c!102606 lt!448425 lt!448420))))))

(declare-fun b!1014213 () Bool)

(assert (=> b!1014213 (= e!570538 (forall!237 (t!30425 (ite c!102606 lt!448425 lt!448420)) (ite c!102606 lambda!649 lambda!652)))))

(assert (= (and d!120679 (not res!680694)) b!1014212))

(assert (= (and b!1014212 res!680695) b!1014213))

(declare-fun b_lambda!15333 () Bool)

(assert (=> (not b_lambda!15333) (not b!1014212)))

(declare-fun m!936917 () Bool)

(assert (=> b!1014212 m!936917))

(declare-fun m!936919 () Bool)

(assert (=> b!1014213 m!936919))

(assert (=> bm!42762 d!120679))

(declare-fun d!120681 () Bool)

(declare-fun res!680696 () Bool)

(declare-fun e!570541 () Bool)

(assert (=> d!120681 (=> res!680696 e!570541)))

(assert (=> d!120681 (= res!680696 ((_ is Nil!21421) (t!30425 lt!448305)))))

(assert (=> d!120681 (= (forall!237 (t!30425 lt!448305) lambda!607) e!570541)))

(declare-fun b!1014218 () Bool)

(declare-fun e!570542 () Bool)

(assert (=> b!1014218 (= e!570541 e!570542)))

(declare-fun res!680697 () Bool)

(assert (=> b!1014218 (=> (not res!680697) (not e!570542))))

(assert (=> b!1014218 (= res!680697 (dynLambda!1890 lambda!607 (h!22618 (t!30425 lt!448305))))))

(declare-fun b!1014219 () Bool)

(assert (=> b!1014219 (= e!570542 (forall!237 (t!30425 (t!30425 lt!448305)) lambda!607))))

(assert (= (and d!120681 (not res!680696)) b!1014218))

(assert (= (and b!1014218 res!680697) b!1014219))

(declare-fun b_lambda!15335 () Bool)

(assert (=> (not b_lambda!15335) (not b!1014218)))

(declare-fun m!936921 () Bool)

(assert (=> b!1014218 m!936921))

(declare-fun m!936923 () Bool)

(assert (=> b!1014219 m!936923))

(assert (=> b!1014120 d!120681))

(declare-fun d!120683 () Bool)

(declare-fun res!680698 () Bool)

(declare-fun e!570545 () Bool)

(assert (=> d!120683 (=> res!680698 e!570545)))

(assert (=> d!120683 (= res!680698 ((_ is Nil!21421) (t!30425 (Cons!21420 (_1!7578 (h!22617 l!412)) lt!448305))))))

(assert (=> d!120683 (= (forall!237 (t!30425 (Cons!21420 (_1!7578 (h!22617 l!412)) lt!448305)) lambda!608) e!570545)))

(declare-fun b!1014224 () Bool)

(declare-fun e!570546 () Bool)

(assert (=> b!1014224 (= e!570545 e!570546)))

(declare-fun res!680699 () Bool)

(assert (=> b!1014224 (=> (not res!680699) (not e!570546))))

(assert (=> b!1014224 (= res!680699 (dynLambda!1890 lambda!608 (h!22618 (t!30425 (Cons!21420 (_1!7578 (h!22617 l!412)) lt!448305)))))))

(declare-fun b!1014225 () Bool)

(assert (=> b!1014225 (= e!570546 (forall!237 (t!30425 (t!30425 (Cons!21420 (_1!7578 (h!22617 l!412)) lt!448305))) lambda!608))))

(assert (= (and d!120683 (not res!680698)) b!1014224))

(assert (= (and b!1014224 res!680699) b!1014225))

(declare-fun b_lambda!15337 () Bool)

(assert (=> (not b_lambda!15337) (not b!1014224)))

(declare-fun m!936925 () Bool)

(assert (=> b!1014224 m!936925))

(declare-fun m!936927 () Bool)

(assert (=> b!1014225 m!936927))

(assert (=> b!1013999 d!120683))

(declare-fun b!1014228 () Bool)

(declare-fun e!570548 () Option!576)

(assert (=> b!1014228 (= e!570548 (getValueByKey!525 (t!30424 l!412) (h!22618 (Cons!21420 (_1!7578 (h!22617 l!412)) lt!448305))))))

(declare-fun b!1014227 () Bool)

(declare-fun e!570547 () Option!576)

(assert (=> b!1014227 (= e!570547 e!570548)))

(declare-fun c!102637 () Bool)

(assert (=> b!1014227 (= c!102637 (and ((_ is Cons!21419) l!412) (not (= (_1!7578 (h!22617 l!412)) (h!22618 (Cons!21420 (_1!7578 (h!22617 l!412)) lt!448305))))))))

(declare-fun d!120685 () Bool)

(declare-fun c!102636 () Bool)

(assert (=> d!120685 (= c!102636 (and ((_ is Cons!21419) l!412) (= (_1!7578 (h!22617 l!412)) (h!22618 (Cons!21420 (_1!7578 (h!22617 l!412)) lt!448305)))))))

(assert (=> d!120685 (= (getValueByKey!525 l!412 (h!22618 (Cons!21420 (_1!7578 (h!22617 l!412)) lt!448305))) e!570547)))

(declare-fun b!1014226 () Bool)

(assert (=> b!1014226 (= e!570547 (Some!575 (_2!7578 (h!22617 l!412))))))

(declare-fun b!1014229 () Bool)

(assert (=> b!1014229 (= e!570548 None!574)))

(assert (= (and d!120685 c!102636) b!1014226))

(assert (= (and d!120685 (not c!102636)) b!1014227))

(assert (= (and b!1014227 c!102637) b!1014228))

(assert (= (and b!1014227 (not c!102637)) b!1014229))

(declare-fun m!936929 () Bool)

(assert (=> b!1014228 m!936929))

(assert (=> bs!29069 d!120685))

(declare-fun d!120687 () Bool)

(declare-fun res!680700 () Bool)

(declare-fun e!570551 () Bool)

(assert (=> d!120687 (=> res!680700 e!570551)))

(assert (=> d!120687 (= res!680700 ((_ is Nil!21421) lt!448419))))

(assert (=> d!120687 (= (forall!237 lt!448419 lambda!653) e!570551)))

(declare-fun b!1014234 () Bool)

(declare-fun e!570552 () Bool)

(assert (=> b!1014234 (= e!570551 e!570552)))

(declare-fun res!680701 () Bool)

(assert (=> b!1014234 (=> (not res!680701) (not e!570552))))

(assert (=> b!1014234 (= res!680701 (dynLambda!1890 lambda!653 (h!22618 lt!448419)))))

(declare-fun b!1014235 () Bool)

(assert (=> b!1014235 (= e!570552 (forall!237 (t!30425 lt!448419) lambda!653))))

(assert (= (and d!120687 (not res!680700)) b!1014234))

(assert (= (and b!1014234 res!680701) b!1014235))

(declare-fun b_lambda!15339 () Bool)

(assert (=> (not b_lambda!15339) (not b!1014234)))

(declare-fun m!936933 () Bool)

(assert (=> b!1014234 m!936933))

(declare-fun m!936935 () Bool)

(assert (=> b!1014235 m!936935))

(assert (=> d!120579 d!120687))

(assert (=> d!120579 d!120623))

(declare-fun b!1014238 () Bool)

(declare-fun e!570555 () Bool)

(declare-fun tp!70498 () Bool)

(assert (=> b!1014238 (= e!570555 (and tp_is_empty!23487 tp!70498))))

(assert (=> b!1014131 (= tp!70496 e!570555)))

(assert (= (and b!1014131 ((_ is Cons!21419) (t!30424 (t!30424 l!412)))) b!1014238))

(declare-fun b_lambda!15343 () Bool)

(assert (= b_lambda!15339 (or d!120579 b_lambda!15343)))

(declare-fun bs!29206 () Bool)

(declare-fun d!120695 () Bool)

(assert (= bs!29206 (and d!120695 d!120579)))

(assert (=> bs!29206 (= (dynLambda!1890 lambda!653 (h!22618 lt!448419)) (= (getValueByKey!525 (t!30424 l!412) (h!22618 lt!448419)) (Some!575 value!115)))))

(declare-fun m!936941 () Bool)

(assert (=> bs!29206 m!936941))

(assert (=> b!1014234 d!120695))

(declare-fun b_lambda!15345 () Bool)

(assert (= b_lambda!15305 (or d!120597 b_lambda!15345)))

(declare-fun bs!29207 () Bool)

(declare-fun d!120697 () Bool)

(assert (= bs!29207 (and d!120697 d!120597)))

(assert (=> bs!29207 (= (dynLambda!1890 lambda!659 (h!22618 lt!448305)) (= (getValueByKey!525 (Cons!21419 (h!22617 l!412) (t!30424 l!412)) (h!22618 lt!448305)) (Some!575 value!115)))))

(declare-fun m!936943 () Bool)

(assert (=> bs!29207 m!936943))

(assert (=> b!1014160 d!120697))

(declare-fun b_lambda!15347 () Bool)

(assert (= b_lambda!15335 (or b!1013945 b_lambda!15347)))

(declare-fun bs!29208 () Bool)

(declare-fun d!120699 () Bool)

(assert (= bs!29208 (and d!120699 b!1013945)))

(assert (=> bs!29208 (= (dynLambda!1890 lambda!607 (h!22618 (t!30425 lt!448305))) (= (getValueByKey!525 l!412 (h!22618 (t!30425 lt!448305))) (Some!575 value!115)))))

(declare-fun m!936945 () Bool)

(assert (=> bs!29208 m!936945))

(assert (=> b!1014218 d!120699))

(declare-fun b_lambda!15349 () Bool)

(assert (= b_lambda!15329 (or b!1014117 b_lambda!15349)))

(declare-fun bs!29209 () Bool)

(declare-fun d!120701 () Bool)

(assert (= bs!29209 (and d!120701 b!1014117)))

(assert (=> bs!29209 (= (dynLambda!1890 lambda!658 (h!22618 lt!448305)) (= (getValueByKey!525 (t!30424 l!412) (h!22618 lt!448305)) (Some!575 value!115)))))

(assert (=> bs!29209 m!936915))

(assert (=> b!1014196 d!120701))

(declare-fun b_lambda!15351 () Bool)

(assert (= b_lambda!15337 (or b!1013943 b_lambda!15351)))

(declare-fun bs!29210 () Bool)

(declare-fun d!120703 () Bool)

(assert (= bs!29210 (and d!120703 b!1013943)))

(assert (=> bs!29210 (= (dynLambda!1890 lambda!608 (h!22618 (t!30425 (Cons!21420 (_1!7578 (h!22617 l!412)) lt!448305)))) (= (getValueByKey!525 l!412 (h!22618 (t!30425 (Cons!21420 (_1!7578 (h!22617 l!412)) lt!448305)))) (Some!575 value!115)))))

(declare-fun m!936947 () Bool)

(assert (=> bs!29210 m!936947))

(assert (=> b!1014224 d!120703))

(check-sat (not b_lambda!15297) (not b_lambda!15299) (not b_lambda!15345) (not b_lambda!15349) (not b_lambda!15351) (not b!1014228) (not b!1014197) (not bm!42767) (not b_lambda!15333) (not b!1014161) (not b_lambda!15347) (not bs!29209) (not b!1014219) (not b_lambda!15343) (not b!1014182) (not b!1014213) (not bs!29206) (not bm!42769) (not bs!29210) (not d!120643) (not b!1014238) (not bm!42768) (not b!1014147) (not b!1014181) (not bs!29208) (not b!1014183) (not b!1014225) (not b!1014235) (not bm!42770) (not d!120631) (not d!120633) tp_is_empty!23487 (not bs!29207) (not b!1014210))
(check-sat)
