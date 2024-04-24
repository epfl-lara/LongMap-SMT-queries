; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95514 () Bool)

(assert start!95514)

(declare-fun res!718110 () Bool)

(declare-fun e!616364 () Bool)

(assert (=> start!95514 (=> (not res!718110) (not e!616364))))

(declare-fun a1!69 () (_ BitVec 64))

(declare-fun a2!57 () (_ BitVec 64))

(assert (=> start!95514 (= res!718110 (not (= a1!69 a2!57)))))

(assert (=> start!95514 e!616364))

(declare-fun tp_is_empty!26065 () Bool)

(assert (=> start!95514 tp_is_empty!26065))

(assert (=> start!95514 true))

(declare-datatypes ((B!1772 0))(
  ( (B!1773 (val!13089 Int)) )
))
(declare-datatypes ((tuple2!16680 0))(
  ( (tuple2!16681 (_1!8351 (_ BitVec 64)) (_2!8351 B!1772)) )
))
(declare-datatypes ((List!23219 0))(
  ( (Nil!23216) (Cons!23215 (h!24433 tuple2!16680) (t!32570 List!23219)) )
))
(declare-datatypes ((ListLongMap!14657 0))(
  ( (ListLongMap!14658 (toList!7344 List!23219)) )
))
(declare-fun lm!214 () ListLongMap!14657)

(declare-fun e!616365 () Bool)

(declare-fun inv!37861 (ListLongMap!14657) Bool)

(assert (=> start!95514 (and (inv!37861 lm!214) e!616365)))

(declare-fun b!1078017 () Bool)

(declare-fun res!718109 () Bool)

(assert (=> b!1078017 (=> (not res!718109) (not e!616364))))

(declare-fun isStrictlySorted!712 (List!23219) Bool)

(assert (=> b!1078017 (= res!718109 (isStrictlySorted!712 (toList!7344 lm!214)))))

(declare-fun lt!478895 () tuple2!16680)

(declare-fun b!1078018 () Bool)

(declare-fun lt!478896 () tuple2!16680)

(declare-fun +!3262 (ListLongMap!14657 tuple2!16680) ListLongMap!14657)

(assert (=> b!1078018 (= e!616364 (not (= (+!3262 (+!3262 lm!214 lt!478896) lt!478895) (+!3262 (+!3262 lm!214 lt!478895) lt!478896))))))

(declare-fun b2!55 () B!1772)

(assert (=> b!1078018 (= lt!478895 (tuple2!16681 a2!57 b2!55))))

(declare-fun b1!79 () B!1772)

(assert (=> b!1078018 (= lt!478896 (tuple2!16681 a1!69 b1!79))))

(declare-fun insertStrictlySorted!386 (List!23219 (_ BitVec 64) B!1772) List!23219)

(assert (=> b!1078018 (= (insertStrictlySorted!386 (insertStrictlySorted!386 (toList!7344 lm!214) a1!69 b1!79) a2!57 b2!55) (insertStrictlySorted!386 (insertStrictlySorted!386 (toList!7344 lm!214) a2!57 b2!55) a1!69 b1!79))))

(declare-datatypes ((Unit!35419 0))(
  ( (Unit!35420) )
))
(declare-fun lt!478897 () Unit!35419)

(declare-fun lemmaInsertStrictlySortedCommutative!1 (List!23219 (_ BitVec 64) B!1772 (_ BitVec 64) B!1772) Unit!35419)

(assert (=> b!1078018 (= lt!478897 (lemmaInsertStrictlySortedCommutative!1 (toList!7344 lm!214) a1!69 b1!79 a2!57 b2!55))))

(declare-fun b!1078019 () Bool)

(declare-fun tp!78278 () Bool)

(assert (=> b!1078019 (= e!616365 tp!78278)))

(assert (= (and start!95514 res!718110) b!1078017))

(assert (= (and b!1078017 res!718109) b!1078018))

(assert (= start!95514 b!1078019))

(declare-fun m!997325 () Bool)

(assert (=> start!95514 m!997325))

(declare-fun m!997327 () Bool)

(assert (=> b!1078017 m!997327))

(declare-fun m!997329 () Bool)

(assert (=> b!1078018 m!997329))

(declare-fun m!997331 () Bool)

(assert (=> b!1078018 m!997331))

(declare-fun m!997333 () Bool)

(assert (=> b!1078018 m!997333))

(declare-fun m!997335 () Bool)

(assert (=> b!1078018 m!997335))

(assert (=> b!1078018 m!997329))

(declare-fun m!997337 () Bool)

(assert (=> b!1078018 m!997337))

(declare-fun m!997339 () Bool)

(assert (=> b!1078018 m!997339))

(assert (=> b!1078018 m!997337))

(declare-fun m!997341 () Bool)

(assert (=> b!1078018 m!997341))

(declare-fun m!997343 () Bool)

(assert (=> b!1078018 m!997343))

(assert (=> b!1078018 m!997333))

(assert (=> b!1078018 m!997343))

(declare-fun m!997345 () Bool)

(assert (=> b!1078018 m!997345))

(check-sat (not b!1078018) tp_is_empty!26065 (not b!1078017) (not start!95514) (not b!1078019))
(check-sat)
(get-model)

(declare-fun d!130193 () Bool)

(assert (=> d!130193 (= (inv!37861 lm!214) (isStrictlySorted!712 (toList!7344 lm!214)))))

(declare-fun bs!31742 () Bool)

(assert (= bs!31742 d!130193))

(assert (=> bs!31742 m!997327))

(assert (=> start!95514 d!130193))

(declare-fun d!130197 () Bool)

(declare-fun e!616394 () Bool)

(assert (=> d!130197 e!616394))

(declare-fun res!718138 () Bool)

(assert (=> d!130197 (=> (not res!718138) (not e!616394))))

(declare-fun lt!478936 () ListLongMap!14657)

(declare-fun contains!6386 (ListLongMap!14657 (_ BitVec 64)) Bool)

(assert (=> d!130197 (= res!718138 (contains!6386 lt!478936 (_1!8351 lt!478896)))))

(declare-fun lt!478935 () List!23219)

(assert (=> d!130197 (= lt!478936 (ListLongMap!14658 lt!478935))))

(declare-fun lt!478937 () Unit!35419)

(declare-fun lt!478934 () Unit!35419)

(assert (=> d!130197 (= lt!478937 lt!478934)))

(declare-datatypes ((Option!662 0))(
  ( (Some!661 (v!15704 B!1772)) (None!660) )
))
(declare-fun getValueByKey!611 (List!23219 (_ BitVec 64)) Option!662)

(assert (=> d!130197 (= (getValueByKey!611 lt!478935 (_1!8351 lt!478896)) (Some!661 (_2!8351 lt!478896)))))

(declare-fun lemmaContainsTupThenGetReturnValue!293 (List!23219 (_ BitVec 64) B!1772) Unit!35419)

(assert (=> d!130197 (= lt!478934 (lemmaContainsTupThenGetReturnValue!293 lt!478935 (_1!8351 lt!478896) (_2!8351 lt!478896)))))

(assert (=> d!130197 (= lt!478935 (insertStrictlySorted!386 (toList!7344 lm!214) (_1!8351 lt!478896) (_2!8351 lt!478896)))))

(assert (=> d!130197 (= (+!3262 lm!214 lt!478896) lt!478936)))

(declare-fun b!1078064 () Bool)

(declare-fun res!718137 () Bool)

(assert (=> b!1078064 (=> (not res!718137) (not e!616394))))

(assert (=> b!1078064 (= res!718137 (= (getValueByKey!611 (toList!7344 lt!478936) (_1!8351 lt!478896)) (Some!661 (_2!8351 lt!478896))))))

(declare-fun b!1078065 () Bool)

(declare-fun contains!6388 (List!23219 tuple2!16680) Bool)

(assert (=> b!1078065 (= e!616394 (contains!6388 (toList!7344 lt!478936) lt!478896))))

(assert (= (and d!130197 res!718138) b!1078064))

(assert (= (and b!1078064 res!718137) b!1078065))

(declare-fun m!997393 () Bool)

(assert (=> d!130197 m!997393))

(declare-fun m!997395 () Bool)

(assert (=> d!130197 m!997395))

(declare-fun m!997397 () Bool)

(assert (=> d!130197 m!997397))

(declare-fun m!997399 () Bool)

(assert (=> d!130197 m!997399))

(declare-fun m!997401 () Bool)

(assert (=> b!1078064 m!997401))

(declare-fun m!997403 () Bool)

(assert (=> b!1078065 m!997403))

(assert (=> b!1078018 d!130197))

(declare-fun b!1078140 () Bool)

(declare-fun e!616435 () List!23219)

(assert (=> b!1078140 (= e!616435 (insertStrictlySorted!386 (t!32570 (toList!7344 lm!214)) a2!57 b2!55))))

(declare-fun c!108673 () Bool)

(declare-fun bm!45742 () Bool)

(declare-fun call!45747 () List!23219)

(declare-fun $colon$colon!607 (List!23219 tuple2!16680) List!23219)

(assert (=> bm!45742 (= call!45747 ($colon$colon!607 e!616435 (ite c!108673 (h!24433 (toList!7344 lm!214)) (tuple2!16681 a2!57 b2!55))))))

(declare-fun c!108675 () Bool)

(assert (=> bm!45742 (= c!108675 c!108673)))

(declare-fun b!1078141 () Bool)

(declare-fun res!718162 () Bool)

(declare-fun e!616433 () Bool)

(assert (=> b!1078141 (=> (not res!718162) (not e!616433))))

(declare-fun lt!478956 () List!23219)

(declare-fun containsKey!585 (List!23219 (_ BitVec 64)) Bool)

(assert (=> b!1078141 (= res!718162 (containsKey!585 lt!478956 a2!57))))

(declare-fun b!1078142 () Bool)

(declare-fun e!616432 () List!23219)

(declare-fun call!45746 () List!23219)

(assert (=> b!1078142 (= e!616432 call!45746)))

(declare-fun b!1078143 () Bool)

(declare-fun e!616436 () List!23219)

(declare-fun call!45745 () List!23219)

(assert (=> b!1078143 (= e!616436 call!45745)))

(declare-fun d!130201 () Bool)

(assert (=> d!130201 e!616433))

(declare-fun res!718161 () Bool)

(assert (=> d!130201 (=> (not res!718161) (not e!616433))))

(assert (=> d!130201 (= res!718161 (isStrictlySorted!712 lt!478956))))

(declare-fun e!616434 () List!23219)

(assert (=> d!130201 (= lt!478956 e!616434)))

(get-info :version)

(assert (=> d!130201 (= c!108673 (and ((_ is Cons!23215) (toList!7344 lm!214)) (bvslt (_1!8351 (h!24433 (toList!7344 lm!214))) a2!57)))))

(assert (=> d!130201 (isStrictlySorted!712 (toList!7344 lm!214))))

(assert (=> d!130201 (= (insertStrictlySorted!386 (toList!7344 lm!214) a2!57 b2!55) lt!478956)))

(declare-fun b!1078144 () Bool)

(assert (=> b!1078144 (= e!616433 (contains!6388 lt!478956 (tuple2!16681 a2!57 b2!55)))))

(declare-fun bm!45743 () Bool)

(assert (=> bm!45743 (= call!45745 call!45746)))

(declare-fun b!1078145 () Bool)

(assert (=> b!1078145 (= e!616434 e!616432)))

(declare-fun c!108674 () Bool)

(assert (=> b!1078145 (= c!108674 (and ((_ is Cons!23215) (toList!7344 lm!214)) (= (_1!8351 (h!24433 (toList!7344 lm!214))) a2!57)))))

(declare-fun b!1078146 () Bool)

(assert (=> b!1078146 (= e!616434 call!45747)))

(declare-fun bm!45744 () Bool)

(assert (=> bm!45744 (= call!45746 call!45747)))

(declare-fun b!1078147 () Bool)

(declare-fun c!108672 () Bool)

(assert (=> b!1078147 (= e!616435 (ite c!108674 (t!32570 (toList!7344 lm!214)) (ite c!108672 (Cons!23215 (h!24433 (toList!7344 lm!214)) (t!32570 (toList!7344 lm!214))) Nil!23216)))))

(declare-fun b!1078148 () Bool)

(assert (=> b!1078148 (= e!616436 call!45745)))

(declare-fun b!1078149 () Bool)

(assert (=> b!1078149 (= c!108672 (and ((_ is Cons!23215) (toList!7344 lm!214)) (bvsgt (_1!8351 (h!24433 (toList!7344 lm!214))) a2!57)))))

(assert (=> b!1078149 (= e!616432 e!616436)))

(assert (= (and d!130201 c!108673) b!1078146))

(assert (= (and d!130201 (not c!108673)) b!1078145))

(assert (= (and b!1078145 c!108674) b!1078142))

(assert (= (and b!1078145 (not c!108674)) b!1078149))

(assert (= (and b!1078149 c!108672) b!1078148))

(assert (= (and b!1078149 (not c!108672)) b!1078143))

(assert (= (or b!1078148 b!1078143) bm!45743))

(assert (= (or b!1078142 bm!45743) bm!45744))

(assert (= (or b!1078146 bm!45744) bm!45742))

(assert (= (and bm!45742 c!108675) b!1078140))

(assert (= (and bm!45742 (not c!108675)) b!1078147))

(assert (= (and d!130201 res!718161) b!1078141))

(assert (= (and b!1078141 res!718162) b!1078144))

(declare-fun m!997437 () Bool)

(assert (=> d!130201 m!997437))

(assert (=> d!130201 m!997327))

(declare-fun m!997439 () Bool)

(assert (=> bm!45742 m!997439))

(declare-fun m!997441 () Bool)

(assert (=> b!1078144 m!997441))

(declare-fun m!997443 () Bool)

(assert (=> b!1078141 m!997443))

(declare-fun m!997445 () Bool)

(assert (=> b!1078140 m!997445))

(assert (=> b!1078018 d!130201))

(declare-fun b!1078160 () Bool)

(declare-fun e!616445 () List!23219)

(assert (=> b!1078160 (= e!616445 (insertStrictlySorted!386 (t!32570 (toList!7344 lm!214)) a1!69 b1!79))))

(declare-fun bm!45748 () Bool)

(declare-fun call!45753 () List!23219)

(declare-fun c!108681 () Bool)

(assert (=> bm!45748 (= call!45753 ($colon$colon!607 e!616445 (ite c!108681 (h!24433 (toList!7344 lm!214)) (tuple2!16681 a1!69 b1!79))))))

(declare-fun c!108683 () Bool)

(assert (=> bm!45748 (= c!108683 c!108681)))

(declare-fun b!1078161 () Bool)

(declare-fun res!718166 () Bool)

(declare-fun e!616443 () Bool)

(assert (=> b!1078161 (=> (not res!718166) (not e!616443))))

(declare-fun lt!478958 () List!23219)

(assert (=> b!1078161 (= res!718166 (containsKey!585 lt!478958 a1!69))))

(declare-fun b!1078162 () Bool)

(declare-fun e!616442 () List!23219)

(declare-fun call!45752 () List!23219)

(assert (=> b!1078162 (= e!616442 call!45752)))

(declare-fun b!1078163 () Bool)

(declare-fun e!616446 () List!23219)

(declare-fun call!45751 () List!23219)

(assert (=> b!1078163 (= e!616446 call!45751)))

(declare-fun d!130209 () Bool)

(assert (=> d!130209 e!616443))

(declare-fun res!718165 () Bool)

(assert (=> d!130209 (=> (not res!718165) (not e!616443))))

(assert (=> d!130209 (= res!718165 (isStrictlySorted!712 lt!478958))))

(declare-fun e!616444 () List!23219)

(assert (=> d!130209 (= lt!478958 e!616444)))

(assert (=> d!130209 (= c!108681 (and ((_ is Cons!23215) (toList!7344 lm!214)) (bvslt (_1!8351 (h!24433 (toList!7344 lm!214))) a1!69)))))

(assert (=> d!130209 (isStrictlySorted!712 (toList!7344 lm!214))))

(assert (=> d!130209 (= (insertStrictlySorted!386 (toList!7344 lm!214) a1!69 b1!79) lt!478958)))

(declare-fun b!1078164 () Bool)

(assert (=> b!1078164 (= e!616443 (contains!6388 lt!478958 (tuple2!16681 a1!69 b1!79)))))

(declare-fun bm!45749 () Bool)

(assert (=> bm!45749 (= call!45751 call!45752)))

(declare-fun b!1078165 () Bool)

(assert (=> b!1078165 (= e!616444 e!616442)))

(declare-fun c!108682 () Bool)

(assert (=> b!1078165 (= c!108682 (and ((_ is Cons!23215) (toList!7344 lm!214)) (= (_1!8351 (h!24433 (toList!7344 lm!214))) a1!69)))))

(declare-fun b!1078166 () Bool)

(assert (=> b!1078166 (= e!616444 call!45753)))

(declare-fun bm!45750 () Bool)

(assert (=> bm!45750 (= call!45752 call!45753)))

(declare-fun c!108680 () Bool)

(declare-fun b!1078167 () Bool)

(assert (=> b!1078167 (= e!616445 (ite c!108682 (t!32570 (toList!7344 lm!214)) (ite c!108680 (Cons!23215 (h!24433 (toList!7344 lm!214)) (t!32570 (toList!7344 lm!214))) Nil!23216)))))

(declare-fun b!1078168 () Bool)

(assert (=> b!1078168 (= e!616446 call!45751)))

(declare-fun b!1078169 () Bool)

(assert (=> b!1078169 (= c!108680 (and ((_ is Cons!23215) (toList!7344 lm!214)) (bvsgt (_1!8351 (h!24433 (toList!7344 lm!214))) a1!69)))))

(assert (=> b!1078169 (= e!616442 e!616446)))

(assert (= (and d!130209 c!108681) b!1078166))

(assert (= (and d!130209 (not c!108681)) b!1078165))

(assert (= (and b!1078165 c!108682) b!1078162))

(assert (= (and b!1078165 (not c!108682)) b!1078169))

(assert (= (and b!1078169 c!108680) b!1078168))

(assert (= (and b!1078169 (not c!108680)) b!1078163))

(assert (= (or b!1078168 b!1078163) bm!45749))

(assert (= (or b!1078162 bm!45749) bm!45750))

(assert (= (or b!1078166 bm!45750) bm!45748))

(assert (= (and bm!45748 c!108683) b!1078160))

(assert (= (and bm!45748 (not c!108683)) b!1078167))

(assert (= (and d!130209 res!718165) b!1078161))

(assert (= (and b!1078161 res!718166) b!1078164))

(declare-fun m!997463 () Bool)

(assert (=> d!130209 m!997463))

(assert (=> d!130209 m!997327))

(declare-fun m!997469 () Bool)

(assert (=> bm!45748 m!997469))

(declare-fun m!997473 () Bool)

(assert (=> b!1078164 m!997473))

(declare-fun m!997475 () Bool)

(assert (=> b!1078161 m!997475))

(declare-fun m!997477 () Bool)

(assert (=> b!1078160 m!997477))

(assert (=> b!1078018 d!130209))

(declare-fun d!130215 () Bool)

(declare-fun e!616454 () Bool)

(assert (=> d!130215 e!616454))

(declare-fun res!718174 () Bool)

(assert (=> d!130215 (=> (not res!718174) (not e!616454))))

(declare-fun lt!478970 () ListLongMap!14657)

(assert (=> d!130215 (= res!718174 (contains!6386 lt!478970 (_1!8351 lt!478895)))))

(declare-fun lt!478969 () List!23219)

(assert (=> d!130215 (= lt!478970 (ListLongMap!14658 lt!478969))))

(declare-fun lt!478971 () Unit!35419)

(declare-fun lt!478968 () Unit!35419)

(assert (=> d!130215 (= lt!478971 lt!478968)))

(assert (=> d!130215 (= (getValueByKey!611 lt!478969 (_1!8351 lt!478895)) (Some!661 (_2!8351 lt!478895)))))

(assert (=> d!130215 (= lt!478968 (lemmaContainsTupThenGetReturnValue!293 lt!478969 (_1!8351 lt!478895) (_2!8351 lt!478895)))))

(assert (=> d!130215 (= lt!478969 (insertStrictlySorted!386 (toList!7344 lm!214) (_1!8351 lt!478895) (_2!8351 lt!478895)))))

(assert (=> d!130215 (= (+!3262 lm!214 lt!478895) lt!478970)))

(declare-fun b!1078184 () Bool)

(declare-fun res!718173 () Bool)

(assert (=> b!1078184 (=> (not res!718173) (not e!616454))))

(assert (=> b!1078184 (= res!718173 (= (getValueByKey!611 (toList!7344 lt!478970) (_1!8351 lt!478895)) (Some!661 (_2!8351 lt!478895))))))

(declare-fun b!1078185 () Bool)

(assert (=> b!1078185 (= e!616454 (contains!6388 (toList!7344 lt!478970) lt!478895))))

(assert (= (and d!130215 res!718174) b!1078184))

(assert (= (and b!1078184 res!718173) b!1078185))

(declare-fun m!997493 () Bool)

(assert (=> d!130215 m!997493))

(declare-fun m!997497 () Bool)

(assert (=> d!130215 m!997497))

(declare-fun m!997499 () Bool)

(assert (=> d!130215 m!997499))

(declare-fun m!997505 () Bool)

(assert (=> d!130215 m!997505))

(declare-fun m!997509 () Bool)

(assert (=> b!1078184 m!997509))

(declare-fun m!997511 () Bool)

(assert (=> b!1078185 m!997511))

(assert (=> b!1078018 d!130215))

(declare-fun d!130221 () Bool)

(declare-fun e!616460 () Bool)

(assert (=> d!130221 e!616460))

(declare-fun res!718180 () Bool)

(assert (=> d!130221 (=> (not res!718180) (not e!616460))))

(declare-fun lt!478978 () ListLongMap!14657)

(assert (=> d!130221 (= res!718180 (contains!6386 lt!478978 (_1!8351 lt!478895)))))

(declare-fun lt!478977 () List!23219)

(assert (=> d!130221 (= lt!478978 (ListLongMap!14658 lt!478977))))

(declare-fun lt!478980 () Unit!35419)

(declare-fun lt!478976 () Unit!35419)

(assert (=> d!130221 (= lt!478980 lt!478976)))

(assert (=> d!130221 (= (getValueByKey!611 lt!478977 (_1!8351 lt!478895)) (Some!661 (_2!8351 lt!478895)))))

(assert (=> d!130221 (= lt!478976 (lemmaContainsTupThenGetReturnValue!293 lt!478977 (_1!8351 lt!478895) (_2!8351 lt!478895)))))

(assert (=> d!130221 (= lt!478977 (insertStrictlySorted!386 (toList!7344 (+!3262 lm!214 lt!478896)) (_1!8351 lt!478895) (_2!8351 lt!478895)))))

(assert (=> d!130221 (= (+!3262 (+!3262 lm!214 lt!478896) lt!478895) lt!478978)))

(declare-fun b!1078188 () Bool)

(declare-fun res!718179 () Bool)

(assert (=> b!1078188 (=> (not res!718179) (not e!616460))))

(assert (=> b!1078188 (= res!718179 (= (getValueByKey!611 (toList!7344 lt!478978) (_1!8351 lt!478895)) (Some!661 (_2!8351 lt!478895))))))

(declare-fun b!1078190 () Bool)

(assert (=> b!1078190 (= e!616460 (contains!6388 (toList!7344 lt!478978) lt!478895))))

(assert (= (and d!130221 res!718180) b!1078188))

(assert (= (and b!1078188 res!718179) b!1078190))

(declare-fun m!997525 () Bool)

(assert (=> d!130221 m!997525))

(declare-fun m!997527 () Bool)

(assert (=> d!130221 m!997527))

(declare-fun m!997529 () Bool)

(assert (=> d!130221 m!997529))

(declare-fun m!997531 () Bool)

(assert (=> d!130221 m!997531))

(declare-fun m!997533 () Bool)

(assert (=> b!1078188 m!997533))

(declare-fun m!997535 () Bool)

(assert (=> b!1078190 m!997535))

(assert (=> b!1078018 d!130221))

(declare-fun e!616466 () List!23219)

(declare-fun b!1078202 () Bool)

(assert (=> b!1078202 (= e!616466 (insertStrictlySorted!386 (t!32570 (insertStrictlySorted!386 (toList!7344 lm!214) a1!69 b1!79)) a2!57 b2!55))))

(declare-fun call!45762 () List!23219)

(declare-fun c!108693 () Bool)

(declare-fun bm!45757 () Bool)

(assert (=> bm!45757 (= call!45762 ($colon$colon!607 e!616466 (ite c!108693 (h!24433 (insertStrictlySorted!386 (toList!7344 lm!214) a1!69 b1!79)) (tuple2!16681 a2!57 b2!55))))))

(declare-fun c!108695 () Bool)

(assert (=> bm!45757 (= c!108695 c!108693)))

(declare-fun b!1078203 () Bool)

(declare-fun res!718184 () Bool)

(declare-fun e!616464 () Bool)

(assert (=> b!1078203 (=> (not res!718184) (not e!616464))))

(declare-fun lt!478985 () List!23219)

(assert (=> b!1078203 (= res!718184 (containsKey!585 lt!478985 a2!57))))

(declare-fun b!1078204 () Bool)

(declare-fun e!616463 () List!23219)

(declare-fun call!45761 () List!23219)

(assert (=> b!1078204 (= e!616463 call!45761)))

(declare-fun b!1078205 () Bool)

(declare-fun e!616467 () List!23219)

(declare-fun call!45760 () List!23219)

(assert (=> b!1078205 (= e!616467 call!45760)))

(declare-fun d!130225 () Bool)

(assert (=> d!130225 e!616464))

(declare-fun res!718183 () Bool)

(assert (=> d!130225 (=> (not res!718183) (not e!616464))))

(assert (=> d!130225 (= res!718183 (isStrictlySorted!712 lt!478985))))

(declare-fun e!616465 () List!23219)

(assert (=> d!130225 (= lt!478985 e!616465)))

(assert (=> d!130225 (= c!108693 (and ((_ is Cons!23215) (insertStrictlySorted!386 (toList!7344 lm!214) a1!69 b1!79)) (bvslt (_1!8351 (h!24433 (insertStrictlySorted!386 (toList!7344 lm!214) a1!69 b1!79))) a2!57)))))

(assert (=> d!130225 (isStrictlySorted!712 (insertStrictlySorted!386 (toList!7344 lm!214) a1!69 b1!79))))

(assert (=> d!130225 (= (insertStrictlySorted!386 (insertStrictlySorted!386 (toList!7344 lm!214) a1!69 b1!79) a2!57 b2!55) lt!478985)))

(declare-fun b!1078206 () Bool)

(assert (=> b!1078206 (= e!616464 (contains!6388 lt!478985 (tuple2!16681 a2!57 b2!55)))))

(declare-fun bm!45758 () Bool)

(assert (=> bm!45758 (= call!45760 call!45761)))

(declare-fun b!1078207 () Bool)

(assert (=> b!1078207 (= e!616465 e!616463)))

(declare-fun c!108694 () Bool)

(assert (=> b!1078207 (= c!108694 (and ((_ is Cons!23215) (insertStrictlySorted!386 (toList!7344 lm!214) a1!69 b1!79)) (= (_1!8351 (h!24433 (insertStrictlySorted!386 (toList!7344 lm!214) a1!69 b1!79))) a2!57)))))

(declare-fun b!1078208 () Bool)

(assert (=> b!1078208 (= e!616465 call!45762)))

(declare-fun bm!45759 () Bool)

(assert (=> bm!45759 (= call!45761 call!45762)))

(declare-fun b!1078209 () Bool)

(declare-fun c!108692 () Bool)

(assert (=> b!1078209 (= e!616466 (ite c!108694 (t!32570 (insertStrictlySorted!386 (toList!7344 lm!214) a1!69 b1!79)) (ite c!108692 (Cons!23215 (h!24433 (insertStrictlySorted!386 (toList!7344 lm!214) a1!69 b1!79)) (t!32570 (insertStrictlySorted!386 (toList!7344 lm!214) a1!69 b1!79))) Nil!23216)))))

(declare-fun b!1078210 () Bool)

(assert (=> b!1078210 (= e!616467 call!45760)))

(declare-fun b!1078211 () Bool)

(assert (=> b!1078211 (= c!108692 (and ((_ is Cons!23215) (insertStrictlySorted!386 (toList!7344 lm!214) a1!69 b1!79)) (bvsgt (_1!8351 (h!24433 (insertStrictlySorted!386 (toList!7344 lm!214) a1!69 b1!79))) a2!57)))))

(assert (=> b!1078211 (= e!616463 e!616467)))

(assert (= (and d!130225 c!108693) b!1078208))

(assert (= (and d!130225 (not c!108693)) b!1078207))

(assert (= (and b!1078207 c!108694) b!1078204))

(assert (= (and b!1078207 (not c!108694)) b!1078211))

(assert (= (and b!1078211 c!108692) b!1078210))

(assert (= (and b!1078211 (not c!108692)) b!1078205))

(assert (= (or b!1078210 b!1078205) bm!45758))

(assert (= (or b!1078204 bm!45758) bm!45759))

(assert (= (or b!1078208 bm!45759) bm!45757))

(assert (= (and bm!45757 c!108695) b!1078202))

(assert (= (and bm!45757 (not c!108695)) b!1078209))

(assert (= (and d!130225 res!718183) b!1078203))

(assert (= (and b!1078203 res!718184) b!1078206))

(declare-fun m!997563 () Bool)

(assert (=> d!130225 m!997563))

(assert (=> d!130225 m!997337))

(declare-fun m!997567 () Bool)

(assert (=> d!130225 m!997567))

(declare-fun m!997573 () Bool)

(assert (=> bm!45757 m!997573))

(declare-fun m!997577 () Bool)

(assert (=> b!1078206 m!997577))

(declare-fun m!997581 () Bool)

(assert (=> b!1078203 m!997581))

(declare-fun m!997583 () Bool)

(assert (=> b!1078202 m!997583))

(assert (=> b!1078018 d!130225))

(declare-fun d!130233 () Bool)

(declare-fun e!616474 () Bool)

(assert (=> d!130233 e!616474))

(declare-fun res!718190 () Bool)

(assert (=> d!130233 (=> (not res!718190) (not e!616474))))

(declare-fun lt!478993 () ListLongMap!14657)

(assert (=> d!130233 (= res!718190 (contains!6386 lt!478993 (_1!8351 lt!478896)))))

(declare-fun lt!478992 () List!23219)

(assert (=> d!130233 (= lt!478993 (ListLongMap!14658 lt!478992))))

(declare-fun lt!478994 () Unit!35419)

(declare-fun lt!478991 () Unit!35419)

(assert (=> d!130233 (= lt!478994 lt!478991)))

(assert (=> d!130233 (= (getValueByKey!611 lt!478992 (_1!8351 lt!478896)) (Some!661 (_2!8351 lt!478896)))))

(assert (=> d!130233 (= lt!478991 (lemmaContainsTupThenGetReturnValue!293 lt!478992 (_1!8351 lt!478896) (_2!8351 lt!478896)))))

(assert (=> d!130233 (= lt!478992 (insertStrictlySorted!386 (toList!7344 (+!3262 lm!214 lt!478895)) (_1!8351 lt!478896) (_2!8351 lt!478896)))))

(assert (=> d!130233 (= (+!3262 (+!3262 lm!214 lt!478895) lt!478896) lt!478993)))

(declare-fun b!1078224 () Bool)

(declare-fun res!718189 () Bool)

(assert (=> b!1078224 (=> (not res!718189) (not e!616474))))

(assert (=> b!1078224 (= res!718189 (= (getValueByKey!611 (toList!7344 lt!478993) (_1!8351 lt!478896)) (Some!661 (_2!8351 lt!478896))))))

(declare-fun b!1078225 () Bool)

(assert (=> b!1078225 (= e!616474 (contains!6388 (toList!7344 lt!478993) lt!478896))))

(assert (= (and d!130233 res!718190) b!1078224))

(assert (= (and b!1078224 res!718189) b!1078225))

(declare-fun m!997597 () Bool)

(assert (=> d!130233 m!997597))

(declare-fun m!997599 () Bool)

(assert (=> d!130233 m!997599))

(declare-fun m!997601 () Bool)

(assert (=> d!130233 m!997601))

(declare-fun m!997603 () Bool)

(assert (=> d!130233 m!997603))

(declare-fun m!997605 () Bool)

(assert (=> b!1078224 m!997605))

(declare-fun m!997607 () Bool)

(assert (=> b!1078225 m!997607))

(assert (=> b!1078018 d!130233))

(declare-fun d!130237 () Bool)

(assert (=> d!130237 (= (insertStrictlySorted!386 (insertStrictlySorted!386 (toList!7344 lm!214) a1!69 b1!79) a2!57 b2!55) (insertStrictlySorted!386 (insertStrictlySorted!386 (toList!7344 lm!214) a2!57 b2!55) a1!69 b1!79))))

(declare-fun lt!479007 () Unit!35419)

(declare-fun choose!1763 (List!23219 (_ BitVec 64) B!1772 (_ BitVec 64) B!1772) Unit!35419)

(assert (=> d!130237 (= lt!479007 (choose!1763 (toList!7344 lm!214) a1!69 b1!79 a2!57 b2!55))))

(assert (=> d!130237 (not (= a1!69 a2!57))))

(assert (=> d!130237 (= (lemmaInsertStrictlySortedCommutative!1 (toList!7344 lm!214) a1!69 b1!79 a2!57 b2!55) lt!479007)))

(declare-fun bs!31744 () Bool)

(assert (= bs!31744 d!130237))

(declare-fun m!997623 () Bool)

(assert (=> bs!31744 m!997623))

(assert (=> bs!31744 m!997337))

(assert (=> bs!31744 m!997339))

(assert (=> bs!31744 m!997337))

(assert (=> bs!31744 m!997333))

(assert (=> bs!31744 m!997335))

(assert (=> bs!31744 m!997333))

(assert (=> b!1078018 d!130237))

(declare-fun b!1078238 () Bool)

(declare-fun e!616484 () List!23219)

(assert (=> b!1078238 (= e!616484 (insertStrictlySorted!386 (t!32570 (insertStrictlySorted!386 (toList!7344 lm!214) a2!57 b2!55)) a1!69 b1!79))))

(declare-fun c!108705 () Bool)

(declare-fun call!45771 () List!23219)

(declare-fun bm!45766 () Bool)

(assert (=> bm!45766 (= call!45771 ($colon$colon!607 e!616484 (ite c!108705 (h!24433 (insertStrictlySorted!386 (toList!7344 lm!214) a2!57 b2!55)) (tuple2!16681 a1!69 b1!79))))))

(declare-fun c!108707 () Bool)

(assert (=> bm!45766 (= c!108707 c!108705)))

(declare-fun b!1078239 () Bool)

(declare-fun res!718196 () Bool)

(declare-fun e!616482 () Bool)

(assert (=> b!1078239 (=> (not res!718196) (not e!616482))))

(declare-fun lt!479009 () List!23219)

(assert (=> b!1078239 (= res!718196 (containsKey!585 lt!479009 a1!69))))

(declare-fun b!1078240 () Bool)

(declare-fun e!616481 () List!23219)

(declare-fun call!45770 () List!23219)

(assert (=> b!1078240 (= e!616481 call!45770)))

(declare-fun b!1078241 () Bool)

(declare-fun e!616485 () List!23219)

(declare-fun call!45769 () List!23219)

(assert (=> b!1078241 (= e!616485 call!45769)))

(declare-fun d!130243 () Bool)

(assert (=> d!130243 e!616482))

(declare-fun res!718195 () Bool)

(assert (=> d!130243 (=> (not res!718195) (not e!616482))))

(assert (=> d!130243 (= res!718195 (isStrictlySorted!712 lt!479009))))

(declare-fun e!616483 () List!23219)

(assert (=> d!130243 (= lt!479009 e!616483)))

(assert (=> d!130243 (= c!108705 (and ((_ is Cons!23215) (insertStrictlySorted!386 (toList!7344 lm!214) a2!57 b2!55)) (bvslt (_1!8351 (h!24433 (insertStrictlySorted!386 (toList!7344 lm!214) a2!57 b2!55))) a1!69)))))

(assert (=> d!130243 (isStrictlySorted!712 (insertStrictlySorted!386 (toList!7344 lm!214) a2!57 b2!55))))

(assert (=> d!130243 (= (insertStrictlySorted!386 (insertStrictlySorted!386 (toList!7344 lm!214) a2!57 b2!55) a1!69 b1!79) lt!479009)))

(declare-fun b!1078242 () Bool)

(assert (=> b!1078242 (= e!616482 (contains!6388 lt!479009 (tuple2!16681 a1!69 b1!79)))))

(declare-fun bm!45767 () Bool)

(assert (=> bm!45767 (= call!45769 call!45770)))

(declare-fun b!1078243 () Bool)

(assert (=> b!1078243 (= e!616483 e!616481)))

(declare-fun c!108706 () Bool)

(assert (=> b!1078243 (= c!108706 (and ((_ is Cons!23215) (insertStrictlySorted!386 (toList!7344 lm!214) a2!57 b2!55)) (= (_1!8351 (h!24433 (insertStrictlySorted!386 (toList!7344 lm!214) a2!57 b2!55))) a1!69)))))

(declare-fun b!1078244 () Bool)

(assert (=> b!1078244 (= e!616483 call!45771)))

(declare-fun bm!45768 () Bool)

(assert (=> bm!45768 (= call!45770 call!45771)))

(declare-fun b!1078245 () Bool)

(declare-fun c!108704 () Bool)

(assert (=> b!1078245 (= e!616484 (ite c!108706 (t!32570 (insertStrictlySorted!386 (toList!7344 lm!214) a2!57 b2!55)) (ite c!108704 (Cons!23215 (h!24433 (insertStrictlySorted!386 (toList!7344 lm!214) a2!57 b2!55)) (t!32570 (insertStrictlySorted!386 (toList!7344 lm!214) a2!57 b2!55))) Nil!23216)))))

(declare-fun b!1078246 () Bool)

(assert (=> b!1078246 (= e!616485 call!45769)))

(declare-fun b!1078247 () Bool)

(assert (=> b!1078247 (= c!108704 (and ((_ is Cons!23215) (insertStrictlySorted!386 (toList!7344 lm!214) a2!57 b2!55)) (bvsgt (_1!8351 (h!24433 (insertStrictlySorted!386 (toList!7344 lm!214) a2!57 b2!55))) a1!69)))))

(assert (=> b!1078247 (= e!616481 e!616485)))

(assert (= (and d!130243 c!108705) b!1078244))

(assert (= (and d!130243 (not c!108705)) b!1078243))

(assert (= (and b!1078243 c!108706) b!1078240))

(assert (= (and b!1078243 (not c!108706)) b!1078247))

(assert (= (and b!1078247 c!108704) b!1078246))

(assert (= (and b!1078247 (not c!108704)) b!1078241))

(assert (= (or b!1078246 b!1078241) bm!45767))

(assert (= (or b!1078240 bm!45767) bm!45768))

(assert (= (or b!1078244 bm!45768) bm!45766))

(assert (= (and bm!45766 c!108707) b!1078238))

(assert (= (and bm!45766 (not c!108707)) b!1078245))

(assert (= (and d!130243 res!718195) b!1078239))

(assert (= (and b!1078239 res!718196) b!1078242))

(declare-fun m!997643 () Bool)

(assert (=> d!130243 m!997643))

(assert (=> d!130243 m!997333))

(declare-fun m!997647 () Bool)

(assert (=> d!130243 m!997647))

(declare-fun m!997653 () Bool)

(assert (=> bm!45766 m!997653))

(declare-fun m!997657 () Bool)

(assert (=> b!1078242 m!997657))

(declare-fun m!997659 () Bool)

(assert (=> b!1078239 m!997659))

(declare-fun m!997661 () Bool)

(assert (=> b!1078238 m!997661))

(assert (=> b!1078018 d!130243))

(declare-fun d!130251 () Bool)

(declare-fun res!718209 () Bool)

(declare-fun e!616503 () Bool)

(assert (=> d!130251 (=> res!718209 e!616503)))

(assert (=> d!130251 (= res!718209 (or ((_ is Nil!23216) (toList!7344 lm!214)) ((_ is Nil!23216) (t!32570 (toList!7344 lm!214)))))))

(assert (=> d!130251 (= (isStrictlySorted!712 (toList!7344 lm!214)) e!616503)))

(declare-fun b!1078273 () Bool)

(declare-fun e!616504 () Bool)

(assert (=> b!1078273 (= e!616503 e!616504)))

(declare-fun res!718210 () Bool)

(assert (=> b!1078273 (=> (not res!718210) (not e!616504))))

(assert (=> b!1078273 (= res!718210 (bvslt (_1!8351 (h!24433 (toList!7344 lm!214))) (_1!8351 (h!24433 (t!32570 (toList!7344 lm!214))))))))

(declare-fun b!1078274 () Bool)

(assert (=> b!1078274 (= e!616504 (isStrictlySorted!712 (t!32570 (toList!7344 lm!214))))))

(assert (= (and d!130251 (not res!718209)) b!1078273))

(assert (= (and b!1078273 res!718210) b!1078274))

(declare-fun m!997675 () Bool)

(assert (=> b!1078274 m!997675))

(assert (=> b!1078017 d!130251))

(declare-fun b!1078281 () Bool)

(declare-fun e!616509 () Bool)

(declare-fun tp!78290 () Bool)

(assert (=> b!1078281 (= e!616509 (and tp_is_empty!26065 tp!78290))))

(assert (=> b!1078019 (= tp!78278 e!616509)))

(assert (= (and b!1078019 ((_ is Cons!23215) (toList!7344 lm!214))) b!1078281))

(check-sat (not b!1078242) (not b!1078281) (not b!1078064) (not d!130237) (not bm!45766) (not b!1078203) (not b!1078164) (not d!130197) (not d!130233) (not d!130225) (not bm!45757) (not b!1078144) (not b!1078184) (not b!1078206) (not d!130201) (not bm!45742) (not d!130193) (not b!1078202) (not b!1078274) tp_is_empty!26065 (not b!1078190) (not b!1078140) (not b!1078161) (not b!1078238) (not b!1078160) (not b!1078188) (not d!130243) (not bm!45748) (not d!130209) (not b!1078065) (not b!1078225) (not b!1078224) (not b!1078185) (not b!1078239) (not d!130221) (not d!130215) (not b!1078141))
(check-sat)
