; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87584 () Bool)

(assert start!87584)

(declare-fun b!1013705 () Bool)

(assert (=> b!1013705 true))

(assert (=> b!1013705 true))

(declare-datatypes ((Unit!33137 0))(
  ( (Unit!33138) )
))
(declare-fun e!570249 () Unit!33137)

(declare-fun lt!448149 () Unit!33137)

(assert (=> b!1013705 (= e!570249 lt!448149)))

(declare-datatypes ((List!21417 0))(
  ( (Nil!21414) (Cons!21413 (h!22611 (_ BitVec 64)) (t!30418 List!21417)) )
))
(declare-fun lt!448147 () List!21417)

(declare-datatypes ((B!1414 0))(
  ( (B!1415 (val!11791 Int)) )
))
(declare-fun value!115 () B!1414)

(declare-datatypes ((tuple2!15128 0))(
  ( (tuple2!15129 (_1!7575 (_ BitVec 64)) (_2!7575 B!1414)) )
))
(declare-datatypes ((List!21418 0))(
  ( (Nil!21415) (Cons!21414 (h!22612 tuple2!15128) (t!30419 List!21418)) )
))
(declare-fun l!412 () List!21418)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!29 (List!21418 List!21417 B!1414 tuple2!15128) Unit!33137)

(assert (=> b!1013705 (= lt!448149 (lemmaForallGetValueByKeySameWithASmallerHead!29 (t!30419 l!412) lt!448147 value!115 (h!22612 l!412)))))

(declare-fun lambda!548 () Int)

(declare-fun forall!234 (List!21417 Int) Bool)

(assert (=> b!1013705 (forall!234 lt!448147 lambda!548)))

(declare-fun res!680502 () Bool)

(declare-fun e!570248 () Bool)

(assert (=> start!87584 (=> (not res!680502) (not e!570248))))

(declare-fun isStrictlySorted!565 (List!21418) Bool)

(assert (=> start!87584 (= res!680502 (isStrictlySorted!565 l!412))))

(assert (=> start!87584 e!570248))

(declare-fun e!570250 () Bool)

(assert (=> start!87584 e!570250))

(declare-fun tp_is_empty!23481 () Bool)

(assert (=> start!87584 tp_is_empty!23481))

(declare-fun b!1013706 () Bool)

(declare-fun Unit!33139 () Unit!33137)

(assert (=> b!1013706 (= e!570249 Unit!33139)))

(declare-fun b!1013707 () Bool)

(declare-fun tp!70466 () Bool)

(assert (=> b!1013707 (= e!570250 (and tp_is_empty!23481 tp!70466))))

(declare-fun b!1013708 () Bool)

(declare-fun res!680501 () Bool)

(assert (=> b!1013708 (=> (not res!680501) (not e!570248))))

(get-info :version)

(assert (=> b!1013708 (= res!680501 (and ((_ is Cons!21414) l!412) (= (_2!7575 (h!22612 l!412)) value!115)))))

(declare-fun b!1013709 () Bool)

(declare-fun ListPrimitiveSize!107 (List!21418) Int)

(assert (=> b!1013709 (= e!570248 (>= (ListPrimitiveSize!107 (t!30419 l!412)) (ListPrimitiveSize!107 l!412)))))

(declare-fun lt!448148 () Unit!33137)

(assert (=> b!1013709 (= lt!448148 e!570249)))

(declare-fun c!102513 () Bool)

(declare-fun isEmpty!823 (List!21417) Bool)

(assert (=> b!1013709 (= c!102513 (not (isEmpty!823 lt!448147)))))

(declare-fun getKeysOf!41 (List!21418 B!1414) List!21417)

(assert (=> b!1013709 (= lt!448147 (getKeysOf!41 (t!30419 l!412) value!115))))

(assert (= (and start!87584 res!680502) b!1013708))

(assert (= (and b!1013708 res!680501) b!1013709))

(assert (= (and b!1013709 c!102513) b!1013705))

(assert (= (and b!1013709 (not c!102513)) b!1013706))

(assert (= (and start!87584 ((_ is Cons!21414) l!412)) b!1013707))

(declare-fun m!936539 () Bool)

(assert (=> b!1013705 m!936539))

(declare-fun m!936541 () Bool)

(assert (=> b!1013705 m!936541))

(declare-fun m!936543 () Bool)

(assert (=> start!87584 m!936543))

(declare-fun m!936545 () Bool)

(assert (=> b!1013709 m!936545))

(declare-fun m!936547 () Bool)

(assert (=> b!1013709 m!936547))

(declare-fun m!936549 () Bool)

(assert (=> b!1013709 m!936549))

(declare-fun m!936551 () Bool)

(assert (=> b!1013709 m!936551))

(check-sat (not b!1013707) (not b!1013705) (not b!1013709) tp_is_empty!23481 (not start!87584))
(check-sat)
(get-model)

(declare-fun d!120509 () Bool)

(declare-fun res!680513 () Bool)

(declare-fun e!570264 () Bool)

(assert (=> d!120509 (=> res!680513 e!570264)))

(assert (=> d!120509 (= res!680513 (or ((_ is Nil!21415) l!412) ((_ is Nil!21415) (t!30419 l!412))))))

(assert (=> d!120509 (= (isStrictlySorted!565 l!412) e!570264)))

(declare-fun b!1013737 () Bool)

(declare-fun e!570265 () Bool)

(assert (=> b!1013737 (= e!570264 e!570265)))

(declare-fun res!680514 () Bool)

(assert (=> b!1013737 (=> (not res!680514) (not e!570265))))

(assert (=> b!1013737 (= res!680514 (bvslt (_1!7575 (h!22612 l!412)) (_1!7575 (h!22612 (t!30419 l!412)))))))

(declare-fun b!1013738 () Bool)

(assert (=> b!1013738 (= e!570265 (isStrictlySorted!565 (t!30419 l!412)))))

(assert (= (and d!120509 (not res!680513)) b!1013737))

(assert (= (and b!1013737 res!680514) b!1013738))

(declare-fun m!936567 () Bool)

(assert (=> b!1013738 m!936567))

(assert (=> start!87584 d!120509))

(declare-fun bs!28950 () Bool)

(declare-fun b!1013754 () Bool)

(assert (= bs!28950 (and b!1013754 b!1013705)))

(declare-fun lambda!556 () Int)

(assert (=> bs!28950 (= (= (t!30419 l!412) l!412) (= lambda!556 lambda!548))))

(assert (=> b!1013754 true))

(assert (=> b!1013754 true))

(declare-fun bs!28951 () Bool)

(declare-fun d!120513 () Bool)

(assert (= bs!28951 (and d!120513 b!1013705)))

(declare-fun lambda!557 () Int)

(assert (=> bs!28951 (= (= (Cons!21414 (h!22612 l!412) (t!30419 l!412)) l!412) (= lambda!557 lambda!548))))

(declare-fun bs!28952 () Bool)

(assert (= bs!28952 (and d!120513 b!1013754)))

(assert (=> bs!28952 (= (= (Cons!21414 (h!22612 l!412) (t!30419 l!412)) (t!30419 l!412)) (= lambda!557 lambda!556))))

(assert (=> d!120513 true))

(assert (=> d!120513 true))

(assert (=> d!120513 true))

(assert (=> d!120513 (forall!234 lt!448147 lambda!557)))

(declare-fun lt!448165 () Unit!33137)

(declare-fun choose!1629 (List!21418 List!21417 B!1414 tuple2!15128) Unit!33137)

(assert (=> d!120513 (= lt!448165 (choose!1629 (t!30419 l!412) lt!448147 value!115 (h!22612 l!412)))))

(declare-fun e!570272 () Bool)

(assert (=> d!120513 e!570272))

(declare-fun res!680521 () Bool)

(assert (=> d!120513 (=> (not res!680521) (not e!570272))))

(assert (=> d!120513 (= res!680521 (isStrictlySorted!565 (t!30419 l!412)))))

(assert (=> d!120513 (= (lemmaForallGetValueByKeySameWithASmallerHead!29 (t!30419 l!412) lt!448147 value!115 (h!22612 l!412)) lt!448165)))

(declare-fun b!1013753 () Bool)

(declare-fun res!680522 () Bool)

(assert (=> b!1013753 (=> (not res!680522) (not e!570272))))

(declare-fun isEmpty!825 (List!21418) Bool)

(assert (=> b!1013753 (= res!680522 (not (isEmpty!825 (t!30419 l!412))))))

(declare-fun res!680523 () Bool)

(assert (=> b!1013754 (=> (not res!680523) (not e!570272))))

(assert (=> b!1013754 (= res!680523 (forall!234 lt!448147 lambda!556))))

(declare-fun b!1013755 () Bool)

(declare-fun head!935 (List!21418) tuple2!15128)

(assert (=> b!1013755 (= e!570272 (bvslt (_1!7575 (h!22612 l!412)) (_1!7575 (head!935 (t!30419 l!412)))))))

(assert (= (and d!120513 res!680521) b!1013753))

(assert (= (and b!1013753 res!680522) b!1013754))

(assert (= (and b!1013754 res!680523) b!1013755))

(declare-fun m!936571 () Bool)

(assert (=> d!120513 m!936571))

(declare-fun m!936573 () Bool)

(assert (=> d!120513 m!936573))

(assert (=> d!120513 m!936567))

(declare-fun m!936575 () Bool)

(assert (=> b!1013753 m!936575))

(declare-fun m!936577 () Bool)

(assert (=> b!1013754 m!936577))

(declare-fun m!936579 () Bool)

(assert (=> b!1013755 m!936579))

(assert (=> b!1013705 d!120513))

(declare-fun d!120521 () Bool)

(declare-fun res!680528 () Bool)

(declare-fun e!570277 () Bool)

(assert (=> d!120521 (=> res!680528 e!570277)))

(assert (=> d!120521 (= res!680528 ((_ is Nil!21414) lt!448147))))

(assert (=> d!120521 (= (forall!234 lt!448147 lambda!548) e!570277)))

(declare-fun b!1013762 () Bool)

(declare-fun e!570278 () Bool)

(assert (=> b!1013762 (= e!570277 e!570278)))

(declare-fun res!680529 () Bool)

(assert (=> b!1013762 (=> (not res!680529) (not e!570278))))

(declare-fun dynLambda!1886 (Int (_ BitVec 64)) Bool)

(assert (=> b!1013762 (= res!680529 (dynLambda!1886 lambda!548 (h!22611 lt!448147)))))

(declare-fun b!1013763 () Bool)

(assert (=> b!1013763 (= e!570278 (forall!234 (t!30418 lt!448147) lambda!548))))

(assert (= (and d!120521 (not res!680528)) b!1013762))

(assert (= (and b!1013762 res!680529) b!1013763))

(declare-fun b_lambda!15265 () Bool)

(assert (=> (not b_lambda!15265) (not b!1013762)))

(declare-fun m!936581 () Bool)

(assert (=> b!1013762 m!936581))

(declare-fun m!936583 () Bool)

(assert (=> b!1013763 m!936583))

(assert (=> b!1013705 d!120521))

(declare-fun d!120525 () Bool)

(declare-fun lt!448168 () Int)

(assert (=> d!120525 (>= lt!448168 0)))

(declare-fun e!570281 () Int)

(assert (=> d!120525 (= lt!448168 e!570281)))

(declare-fun c!102523 () Bool)

(assert (=> d!120525 (= c!102523 ((_ is Nil!21415) (t!30419 l!412)))))

(assert (=> d!120525 (= (ListPrimitiveSize!107 (t!30419 l!412)) lt!448168)))

(declare-fun b!1013768 () Bool)

(assert (=> b!1013768 (= e!570281 0)))

(declare-fun b!1013769 () Bool)

(assert (=> b!1013769 (= e!570281 (+ 1 (ListPrimitiveSize!107 (t!30419 (t!30419 l!412)))))))

(assert (= (and d!120525 c!102523) b!1013768))

(assert (= (and d!120525 (not c!102523)) b!1013769))

(declare-fun m!936585 () Bool)

(assert (=> b!1013769 m!936585))

(assert (=> b!1013709 d!120525))

(declare-fun d!120527 () Bool)

(declare-fun lt!448169 () Int)

(assert (=> d!120527 (>= lt!448169 0)))

(declare-fun e!570282 () Int)

(assert (=> d!120527 (= lt!448169 e!570282)))

(declare-fun c!102524 () Bool)

(assert (=> d!120527 (= c!102524 ((_ is Nil!21415) l!412))))

(assert (=> d!120527 (= (ListPrimitiveSize!107 l!412) lt!448169)))

(declare-fun b!1013770 () Bool)

(assert (=> b!1013770 (= e!570282 0)))

(declare-fun b!1013771 () Bool)

(assert (=> b!1013771 (= e!570282 (+ 1 (ListPrimitiveSize!107 (t!30419 l!412))))))

(assert (= (and d!120527 c!102524) b!1013770))

(assert (= (and d!120527 (not c!102524)) b!1013771))

(assert (=> b!1013771 m!936545))

(assert (=> b!1013709 d!120527))

(declare-fun d!120529 () Bool)

(assert (=> d!120529 (= (isEmpty!823 lt!448147) ((_ is Nil!21414) lt!448147))))

(assert (=> b!1013709 d!120529))

(declare-fun bs!28962 () Bool)

(declare-fun b!1013859 () Bool)

(assert (= bs!28962 (and b!1013859 b!1013705)))

(declare-fun lambda!583 () Int)

(declare-fun lt!448241 () tuple2!15128)

(declare-fun lt!448248 () List!21418)

(assert (=> bs!28962 (= (= (Cons!21414 lt!448241 lt!448248) l!412) (= lambda!583 lambda!548))))

(declare-fun bs!28963 () Bool)

(assert (= bs!28963 (and b!1013859 b!1013754)))

(assert (=> bs!28963 (= (= (Cons!21414 lt!448241 lt!448248) (t!30419 l!412)) (= lambda!583 lambda!556))))

(declare-fun bs!28965 () Bool)

(assert (= bs!28965 (and b!1013859 d!120513)))

(assert (=> bs!28965 (= (= (Cons!21414 lt!448241 lt!448248) (Cons!21414 (h!22612 l!412) (t!30419 l!412))) (= lambda!583 lambda!557))))

(assert (=> b!1013859 true))

(assert (=> b!1013859 true))

(assert (=> b!1013859 true))

(declare-fun bs!28969 () Bool)

(declare-fun b!1013857 () Bool)

(assert (= bs!28969 (and b!1013857 b!1013705)))

(declare-fun lt!448250 () tuple2!15128)

(declare-fun lambda!585 () Int)

(declare-fun lt!448242 () List!21418)

(assert (=> bs!28969 (= (= (Cons!21414 lt!448250 lt!448242) l!412) (= lambda!585 lambda!548))))

(declare-fun bs!28970 () Bool)

(assert (= bs!28970 (and b!1013857 b!1013754)))

(assert (=> bs!28970 (= (= (Cons!21414 lt!448250 lt!448242) (t!30419 l!412)) (= lambda!585 lambda!556))))

(declare-fun bs!28972 () Bool)

(assert (= bs!28972 (and b!1013857 d!120513)))

(assert (=> bs!28972 (= (= (Cons!21414 lt!448250 lt!448242) (Cons!21414 (h!22612 l!412) (t!30419 l!412))) (= lambda!585 lambda!557))))

(declare-fun bs!28974 () Bool)

(assert (= bs!28974 (and b!1013857 b!1013859)))

(assert (=> bs!28974 (= (= (Cons!21414 lt!448250 lt!448242) (Cons!21414 lt!448241 lt!448248)) (= lambda!585 lambda!583))))

(assert (=> b!1013857 true))

(assert (=> b!1013857 true))

(assert (=> b!1013857 true))

(declare-fun bs!28978 () Bool)

(declare-fun d!120531 () Bool)

(assert (= bs!28978 (and d!120531 b!1013754)))

(declare-fun lambda!587 () Int)

(assert (=> bs!28978 (= lambda!587 lambda!556)))

(declare-fun bs!28979 () Bool)

(assert (= bs!28979 (and d!120531 b!1013705)))

(assert (=> bs!28979 (= (= (t!30419 l!412) l!412) (= lambda!587 lambda!548))))

(declare-fun bs!28980 () Bool)

(assert (= bs!28980 (and d!120531 d!120513)))

(assert (=> bs!28980 (= (= (t!30419 l!412) (Cons!21414 (h!22612 l!412) (t!30419 l!412))) (= lambda!587 lambda!557))))

(declare-fun bs!28981 () Bool)

(assert (= bs!28981 (and d!120531 b!1013859)))

(assert (=> bs!28981 (= (= (t!30419 l!412) (Cons!21414 lt!448241 lt!448248)) (= lambda!587 lambda!583))))

(declare-fun bs!28982 () Bool)

(assert (= bs!28982 (and d!120531 b!1013857)))

(assert (=> bs!28982 (= (= (t!30419 l!412) (Cons!21414 lt!448250 lt!448242)) (= lambda!587 lambda!585))))

(assert (=> d!120531 true))

(assert (=> d!120531 true))

(declare-fun e!570331 () Unit!33137)

(declare-fun lt!448249 () Unit!33137)

(assert (=> b!1013857 (= e!570331 lt!448249)))

(assert (=> b!1013857 (= lt!448242 (t!30419 (t!30419 l!412)))))

(declare-fun lt!448245 () List!21417)

(declare-fun call!42717 () List!21417)

(assert (=> b!1013857 (= lt!448245 call!42717)))

(assert (=> b!1013857 (= lt!448250 (h!22612 (t!30419 l!412)))))

(declare-fun call!42714 () Unit!33137)

(assert (=> b!1013857 (= lt!448249 call!42714)))

(declare-fun call!42716 () Bool)

(assert (=> b!1013857 call!42716))

(declare-fun b!1013858 () Bool)

(declare-fun e!570330 () List!21417)

(assert (=> b!1013858 (= e!570330 Nil!21414)))

(declare-fun bm!42711 () Bool)

(declare-fun call!42715 () Bool)

(assert (=> bm!42711 (= call!42715 (isEmpty!823 call!42717))))

(assert (=> b!1013859 call!42716))

(declare-fun lt!448247 () Unit!33137)

(assert (=> b!1013859 (= lt!448247 call!42714)))

(assert (=> b!1013859 (= lt!448241 (h!22612 (t!30419 l!412)))))

(declare-fun lt!448246 () List!21417)

(assert (=> b!1013859 (= lt!448246 call!42717)))

(assert (=> b!1013859 (= lt!448248 (t!30419 (t!30419 l!412)))))

(declare-fun e!570332 () Unit!33137)

(assert (=> b!1013859 (= e!570332 lt!448247)))

(declare-fun lt!448243 () List!21417)

(assert (=> d!120531 (forall!234 lt!448243 lambda!587)))

(declare-fun e!570333 () List!21417)

(assert (=> d!120531 (= lt!448243 e!570333)))

(declare-fun c!102552 () Bool)

(assert (=> d!120531 (= c!102552 (and ((_ is Cons!21414) (t!30419 l!412)) (= (_2!7575 (h!22612 (t!30419 l!412))) value!115)))))

(assert (=> d!120531 (isStrictlySorted!565 (t!30419 l!412))))

(assert (=> d!120531 (= (getKeysOf!41 (t!30419 l!412) value!115) lt!448243)))

(declare-fun b!1013860 () Bool)

(declare-fun Unit!33145 () Unit!33137)

(assert (=> b!1013860 (= e!570332 Unit!33145)))

(declare-fun bm!42712 () Bool)

(assert (=> bm!42712 (= call!42717 (getKeysOf!41 (t!30419 (t!30419 l!412)) value!115))))

(declare-fun b!1013861 () Bool)

(declare-fun Unit!33146 () Unit!33137)

(assert (=> b!1013861 (= e!570331 Unit!33146)))

(declare-fun b!1013862 () Bool)

(declare-fun lt!448240 () Unit!33137)

(assert (=> b!1013862 (= lt!448240 e!570331)))

(declare-fun c!102549 () Bool)

(assert (=> b!1013862 (= c!102549 (not call!42715))))

(declare-fun lt!448239 () List!21417)

(assert (=> b!1013862 (= lt!448239 call!42717)))

(assert (=> b!1013862 (= e!570330 call!42717)))

(declare-fun bm!42713 () Bool)

(assert (=> bm!42713 (= call!42714 (lemmaForallGetValueByKeySameWithASmallerHead!29 (ite c!102552 lt!448248 lt!448242) (ite c!102552 lt!448246 lt!448245) value!115 (ite c!102552 lt!448241 lt!448250)))))

(declare-fun bm!42714 () Bool)

(assert (=> bm!42714 (= call!42716 (forall!234 (ite c!102552 lt!448246 lt!448245) (ite c!102552 lambda!583 lambda!585)))))

(declare-fun b!1013863 () Bool)

(assert (=> b!1013863 (= e!570333 (Cons!21413 (_1!7575 (h!22612 (t!30419 l!412))) call!42717))))

(declare-fun c!102550 () Bool)

(assert (=> b!1013863 (= c!102550 (not call!42715))))

(declare-fun lt!448244 () Unit!33137)

(assert (=> b!1013863 (= lt!448244 e!570332)))

(declare-fun b!1013864 () Bool)

(assert (=> b!1013864 (= e!570333 e!570330)))

(declare-fun c!102551 () Bool)

(assert (=> b!1013864 (= c!102551 (and ((_ is Cons!21414) (t!30419 l!412)) (not (= (_2!7575 (h!22612 (t!30419 l!412))) value!115))))))

(assert (= (and d!120531 c!102552) b!1013863))

(assert (= (and d!120531 (not c!102552)) b!1013864))

(assert (= (and b!1013863 c!102550) b!1013859))

(assert (= (and b!1013863 (not c!102550)) b!1013860))

(assert (= (and b!1013864 c!102551) b!1013862))

(assert (= (and b!1013864 (not c!102551)) b!1013858))

(assert (= (and b!1013862 c!102549) b!1013857))

(assert (= (and b!1013862 (not c!102549)) b!1013861))

(assert (= (or b!1013859 b!1013857) bm!42713))

(assert (= (or b!1013859 b!1013857) bm!42714))

(assert (= (or b!1013863 b!1013859 b!1013857 b!1013862) bm!42712))

(assert (= (or b!1013863 b!1013862) bm!42711))

(declare-fun m!936627 () Bool)

(assert (=> d!120531 m!936627))

(assert (=> d!120531 m!936567))

(declare-fun m!936629 () Bool)

(assert (=> bm!42713 m!936629))

(declare-fun m!936631 () Bool)

(assert (=> bm!42712 m!936631))

(declare-fun m!936633 () Bool)

(assert (=> bm!42711 m!936633))

(declare-fun m!936635 () Bool)

(assert (=> bm!42714 m!936635))

(assert (=> b!1013709 d!120531))

(declare-fun b!1013882 () Bool)

(declare-fun e!570345 () Bool)

(declare-fun tp!70474 () Bool)

(assert (=> b!1013882 (= e!570345 (and tp_is_empty!23481 tp!70474))))

(assert (=> b!1013707 (= tp!70466 e!570345)))

(assert (= (and b!1013707 ((_ is Cons!21414) (t!30419 l!412))) b!1013882))

(declare-fun b_lambda!15271 () Bool)

(assert (= b_lambda!15265 (or b!1013705 b_lambda!15271)))

(declare-fun bs!28983 () Bool)

(declare-fun d!120551 () Bool)

(assert (= bs!28983 (and d!120551 b!1013705)))

(declare-datatypes ((Option!573 0))(
  ( (Some!572 (v!14423 B!1414)) (None!571) )
))
(declare-fun getValueByKey!522 (List!21418 (_ BitVec 64)) Option!573)

(assert (=> bs!28983 (= (dynLambda!1886 lambda!548 (h!22611 lt!448147)) (= (getValueByKey!522 l!412 (h!22611 lt!448147)) (Some!572 value!115)))))

(declare-fun m!936641 () Bool)

(assert (=> bs!28983 m!936641))

(assert (=> b!1013762 d!120551))

(check-sat (not b!1013754) (not b!1013753) (not bm!42711) (not b!1013738) tp_is_empty!23481 (not b!1013771) (not b!1013763) (not bm!42712) (not b!1013755) (not b!1013882) (not d!120513) (not b!1013769) (not bs!28983) (not d!120531) (not bm!42713) (not b_lambda!15271) (not bm!42714))
(check-sat)
