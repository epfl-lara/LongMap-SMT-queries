; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134334 () Bool)

(assert start!134334)

(declare-fun b!1568669 () Bool)

(declare-fun res!1072320 () Bool)

(declare-fun e!874477 () Bool)

(assert (=> b!1568669 (=> (not res!1072320) (not e!874477))))

(declare-datatypes ((B!2484 0))(
  ( (B!2485 (val!19604 Int)) )
))
(declare-datatypes ((tuple2!25310 0))(
  ( (tuple2!25311 (_1!12666 (_ BitVec 64)) (_2!12666 B!2484)) )
))
(declare-datatypes ((List!36724 0))(
  ( (Nil!36721) (Cons!36720 (h!38167 tuple2!25310) (t!51632 List!36724)) )
))
(declare-fun l!750 () List!36724)

(declare-fun isStrictlySorted!997 (List!36724) Bool)

(assert (=> b!1568669 (= res!1072320 (isStrictlySorted!997 l!750))))

(declare-fun b!1568670 () Bool)

(declare-fun res!1072323 () Bool)

(assert (=> b!1568670 (=> (not res!1072323) (not e!874477))))

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun key1!37 () (_ BitVec 64))

(assert (=> b!1568670 (= res!1072323 (and (is-Cons!36720 l!750) (bvslt (_1!12666 (h!38167 l!750)) key1!37) (bvslt (_1!12666 (h!38167 l!750)) key2!21)))))

(declare-fun res!1072321 () Bool)

(assert (=> start!134334 (=> (not res!1072321) (not e!874477))))

(assert (=> start!134334 (= res!1072321 (not (= key1!37 key2!21)))))

(assert (=> start!134334 e!874477))

(declare-fun tp_is_empty!39035 () Bool)

(assert (=> start!134334 tp_is_empty!39035))

(declare-fun e!874478 () Bool)

(assert (=> start!134334 e!874478))

(assert (=> start!134334 true))

(declare-fun b!1568671 () Bool)

(declare-fun tp!114054 () Bool)

(assert (=> b!1568671 (= e!874478 (and tp_is_empty!39035 tp!114054))))

(declare-fun v1!32 () B!2484)

(declare-fun b!1568672 () Bool)

(declare-fun insertStrictlySorted!583 (List!36724 (_ BitVec 64) B!2484) List!36724)

(assert (=> b!1568672 (= e!874477 (not (isStrictlySorted!997 (insertStrictlySorted!583 l!750 key1!37 v1!32))))))

(declare-fun v2!10 () B!2484)

(assert (=> b!1568672 (= (insertStrictlySorted!583 (insertStrictlySorted!583 (t!51632 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!583 (insertStrictlySorted!583 (t!51632 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-datatypes ((Unit!52082 0))(
  ( (Unit!52083) )
))
(declare-fun lt!673219 () Unit!52082)

(declare-fun lemmaInsertStrictlySortedCommutative!9 (List!36724 (_ BitVec 64) B!2484 (_ BitVec 64) B!2484) Unit!52082)

(assert (=> b!1568672 (= lt!673219 (lemmaInsertStrictlySortedCommutative!9 (t!51632 l!750) key1!37 v1!32 key2!21 v2!10))))

(declare-fun b!1568673 () Bool)

(declare-fun res!1072322 () Bool)

(assert (=> b!1568673 (=> (not res!1072322) (not e!874477))))

(assert (=> b!1568673 (= res!1072322 (isStrictlySorted!997 (t!51632 l!750)))))

(assert (= (and start!134334 res!1072321) b!1568669))

(assert (= (and b!1568669 res!1072320) b!1568670))

(assert (= (and b!1568670 res!1072323) b!1568673))

(assert (= (and b!1568673 res!1072322) b!1568672))

(assert (= (and start!134334 (is-Cons!36720 l!750)) b!1568671))

(declare-fun m!1443277 () Bool)

(assert (=> b!1568669 m!1443277))

(declare-fun m!1443279 () Bool)

(assert (=> b!1568672 m!1443279))

(assert (=> b!1568672 m!1443279))

(declare-fun m!1443281 () Bool)

(assert (=> b!1568672 m!1443281))

(declare-fun m!1443283 () Bool)

(assert (=> b!1568672 m!1443283))

(declare-fun m!1443285 () Bool)

(assert (=> b!1568672 m!1443285))

(assert (=> b!1568672 m!1443283))

(declare-fun m!1443287 () Bool)

(assert (=> b!1568672 m!1443287))

(declare-fun m!1443289 () Bool)

(assert (=> b!1568672 m!1443289))

(assert (=> b!1568672 m!1443289))

(declare-fun m!1443291 () Bool)

(assert (=> b!1568672 m!1443291))

(declare-fun m!1443293 () Bool)

(assert (=> b!1568673 m!1443293))

(push 1)

(assert (not b!1568672))

(assert tp_is_empty!39035)

(assert (not b!1568671))

(assert (not b!1568669))

(assert (not b!1568673))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!163775 () Bool)

(assert (=> d!163775 (= (insertStrictlySorted!583 (insertStrictlySorted!583 (t!51632 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!583 (insertStrictlySorted!583 (t!51632 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-fun lt!673228 () Unit!52082)

(declare-fun choose!2080 (List!36724 (_ BitVec 64) B!2484 (_ BitVec 64) B!2484) Unit!52082)

(assert (=> d!163775 (= lt!673228 (choose!2080 (t!51632 l!750) key1!37 v1!32 key2!21 v2!10))))

(assert (=> d!163775 (not (= key1!37 key2!21))))

(assert (=> d!163775 (= (lemmaInsertStrictlySortedCommutative!9 (t!51632 l!750) key1!37 v1!32 key2!21 v2!10) lt!673228)))

(declare-fun bs!45189 () Bool)

(assert (= bs!45189 d!163775))

(declare-fun m!1443307 () Bool)

(assert (=> bs!45189 m!1443307))

(assert (=> bs!45189 m!1443279))

(assert (=> bs!45189 m!1443281))

(assert (=> bs!45189 m!1443283))

(assert (=> bs!45189 m!1443279))

(assert (=> bs!45189 m!1443283))

(assert (=> bs!45189 m!1443285))

(assert (=> b!1568672 d!163775))

(declare-fun d!163781 () Bool)

(declare-fun res!1072348 () Bool)

(declare-fun e!874511 () Bool)

(assert (=> d!163781 (=> res!1072348 e!874511)))

(assert (=> d!163781 (= res!1072348 (or (is-Nil!36721 (insertStrictlySorted!583 l!750 key1!37 v1!32)) (is-Nil!36721 (t!51632 (insertStrictlySorted!583 l!750 key1!37 v1!32)))))))

(assert (=> d!163781 (= (isStrictlySorted!997 (insertStrictlySorted!583 l!750 key1!37 v1!32)) e!874511)))

(declare-fun b!1568716 () Bool)

(declare-fun e!874512 () Bool)

(assert (=> b!1568716 (= e!874511 e!874512)))

(declare-fun res!1072349 () Bool)

(assert (=> b!1568716 (=> (not res!1072349) (not e!874512))))

(assert (=> b!1568716 (= res!1072349 (bvslt (_1!12666 (h!38167 (insertStrictlySorted!583 l!750 key1!37 v1!32))) (_1!12666 (h!38167 (t!51632 (insertStrictlySorted!583 l!750 key1!37 v1!32))))))))

(declare-fun b!1568717 () Bool)

(assert (=> b!1568717 (= e!874512 (isStrictlySorted!997 (t!51632 (insertStrictlySorted!583 l!750 key1!37 v1!32))))))

(assert (= (and d!163781 (not res!1072348)) b!1568716))

(assert (= (and b!1568716 res!1072349) b!1568717))

(declare-fun m!1443309 () Bool)

(assert (=> b!1568717 m!1443309))

(assert (=> b!1568672 d!163781))

(declare-fun b!1568870 () Bool)

(declare-fun c!144599 () Bool)

(assert (=> b!1568870 (= c!144599 (and (is-Cons!36720 l!750) (bvsgt (_1!12666 (h!38167 l!750)) key1!37)))))

(declare-fun e!874591 () List!36724)

(declare-fun e!874595 () List!36724)

(assert (=> b!1568870 (= e!874591 e!874595)))

(declare-fun b!1568871 () Bool)

(declare-fun e!874593 () List!36724)

(declare-fun call!71988 () List!36724)

(assert (=> b!1568871 (= e!874593 call!71988)))

(declare-fun e!874594 () List!36724)

(declare-fun b!1568872 () Bool)

(assert (=> b!1568872 (= e!874594 (insertStrictlySorted!583 (t!51632 l!750) key1!37 v1!32))))

(declare-fun b!1568873 () Bool)

(declare-fun call!71990 () List!36724)

(assert (=> b!1568873 (= e!874591 call!71990)))

(declare-fun b!1568874 () Bool)

(declare-fun call!71989 () List!36724)

(assert (=> b!1568874 (= e!874595 call!71989)))

(declare-fun d!163783 () Bool)

(declare-fun e!874592 () Bool)

(assert (=> d!163783 e!874592))

(declare-fun res!1072383 () Bool)

(assert (=> d!163783 (=> (not res!1072383) (not e!874592))))

(declare-fun lt!673245 () List!36724)

(assert (=> d!163783 (= res!1072383 (isStrictlySorted!997 lt!673245))))

(assert (=> d!163783 (= lt!673245 e!874593)))

(declare-fun c!144601 () Bool)

(assert (=> d!163783 (= c!144601 (and (is-Cons!36720 l!750) (bvslt (_1!12666 (h!38167 l!750)) key1!37)))))

(assert (=> d!163783 (isStrictlySorted!997 l!750)))

(assert (=> d!163783 (= (insertStrictlySorted!583 l!750 key1!37 v1!32) lt!673245)))

(declare-fun b!1568875 () Bool)

(assert (=> b!1568875 (= e!874593 e!874591)))

(declare-fun c!144600 () Bool)

(assert (=> b!1568875 (= c!144600 (and (is-Cons!36720 l!750) (= (_1!12666 (h!38167 l!750)) key1!37)))))

(declare-fun b!1568876 () Bool)

(declare-fun contains!10417 (List!36724 tuple2!25310) Bool)

(assert (=> b!1568876 (= e!874592 (contains!10417 lt!673245 (tuple2!25311 key1!37 v1!32)))))

(declare-fun bm!71985 () Bool)

(assert (=> bm!71985 (= call!71989 call!71990)))

(declare-fun bm!71986 () Bool)

(declare-fun $colon$colon!990 (List!36724 tuple2!25310) List!36724)

(assert (=> bm!71986 (= call!71988 ($colon$colon!990 e!874594 (ite c!144601 (h!38167 l!750) (tuple2!25311 key1!37 v1!32))))))

(declare-fun c!144602 () Bool)

(assert (=> bm!71986 (= c!144602 c!144601)))

(declare-fun b!1568877 () Bool)

(assert (=> b!1568877 (= e!874595 call!71989)))

(declare-fun bm!71987 () Bool)

(assert (=> bm!71987 (= call!71990 call!71988)))

(declare-fun b!1568878 () Bool)

(assert (=> b!1568878 (= e!874594 (ite c!144600 (t!51632 l!750) (ite c!144599 (Cons!36720 (h!38167 l!750) (t!51632 l!750)) Nil!36721)))))

(declare-fun b!1568879 () Bool)

(declare-fun res!1072382 () Bool)

(assert (=> b!1568879 (=> (not res!1072382) (not e!874592))))

(declare-fun containsKey!859 (List!36724 (_ BitVec 64)) Bool)

(assert (=> b!1568879 (= res!1072382 (containsKey!859 lt!673245 key1!37))))

(assert (= (and d!163783 c!144601) b!1568871))

(assert (= (and d!163783 (not c!144601)) b!1568875))

(assert (= (and b!1568875 c!144600) b!1568873))

(assert (= (and b!1568875 (not c!144600)) b!1568870))

(assert (= (and b!1568870 c!144599) b!1568874))

(assert (= (and b!1568870 (not c!144599)) b!1568877))

(assert (= (or b!1568874 b!1568877) bm!71985))

(assert (= (or b!1568873 bm!71985) bm!71987))

(assert (= (or b!1568871 bm!71987) bm!71986))

(assert (= (and bm!71986 c!144602) b!1568872))

(assert (= (and bm!71986 (not c!144602)) b!1568878))

(assert (= (and d!163783 res!1072383) b!1568879))

(assert (= (and b!1568879 res!1072382) b!1568876))

(declare-fun m!1443415 () Bool)

(assert (=> d!163783 m!1443415))

(assert (=> d!163783 m!1443277))

(declare-fun m!1443417 () Bool)

(assert (=> bm!71986 m!1443417))

(declare-fun m!1443419 () Bool)

(assert (=> b!1568879 m!1443419))

(assert (=> b!1568872 m!1443283))

(declare-fun m!1443421 () Bool)

(assert (=> b!1568876 m!1443421))

(assert (=> b!1568672 d!163783))

(declare-fun c!144603 () Bool)

(declare-fun b!1568880 () Bool)

(assert (=> b!1568880 (= c!144603 (and (is-Cons!36720 (insertStrictlySorted!583 (t!51632 l!750) key1!37 v1!32)) (bvsgt (_1!12666 (h!38167 (insertStrictlySorted!583 (t!51632 l!750) key1!37 v1!32))) key2!21)))))

(declare-fun e!874596 () List!36724)

(declare-fun e!874600 () List!36724)

(assert (=> b!1568880 (= e!874596 e!874600)))

(declare-fun b!1568881 () Bool)

(declare-fun e!874598 () List!36724)

(declare-fun call!71991 () List!36724)

(assert (=> b!1568881 (= e!874598 call!71991)))

(declare-fun b!1568882 () Bool)

(declare-fun e!874599 () List!36724)

(assert (=> b!1568882 (= e!874599 (insertStrictlySorted!583 (t!51632 (insertStrictlySorted!583 (t!51632 l!750) key1!37 v1!32)) key2!21 v2!10))))

(declare-fun b!1568883 () Bool)

(declare-fun call!71993 () List!36724)

(assert (=> b!1568883 (= e!874596 call!71993)))

(declare-fun b!1568884 () Bool)

(declare-fun call!71992 () List!36724)

(assert (=> b!1568884 (= e!874600 call!71992)))

(declare-fun d!163801 () Bool)

(declare-fun e!874597 () Bool)

(assert (=> d!163801 e!874597))

(declare-fun res!1072385 () Bool)

(assert (=> d!163801 (=> (not res!1072385) (not e!874597))))

(declare-fun lt!673246 () List!36724)

(assert (=> d!163801 (= res!1072385 (isStrictlySorted!997 lt!673246))))

(assert (=> d!163801 (= lt!673246 e!874598)))

(declare-fun c!144605 () Bool)

(assert (=> d!163801 (= c!144605 (and (is-Cons!36720 (insertStrictlySorted!583 (t!51632 l!750) key1!37 v1!32)) (bvslt (_1!12666 (h!38167 (insertStrictlySorted!583 (t!51632 l!750) key1!37 v1!32))) key2!21)))))

(assert (=> d!163801 (isStrictlySorted!997 (insertStrictlySorted!583 (t!51632 l!750) key1!37 v1!32))))

(assert (=> d!163801 (= (insertStrictlySorted!583 (insertStrictlySorted!583 (t!51632 l!750) key1!37 v1!32) key2!21 v2!10) lt!673246)))

(declare-fun b!1568885 () Bool)

(assert (=> b!1568885 (= e!874598 e!874596)))

(declare-fun c!144604 () Bool)

(assert (=> b!1568885 (= c!144604 (and (is-Cons!36720 (insertStrictlySorted!583 (t!51632 l!750) key1!37 v1!32)) (= (_1!12666 (h!38167 (insertStrictlySorted!583 (t!51632 l!750) key1!37 v1!32))) key2!21)))))

(declare-fun b!1568886 () Bool)

(assert (=> b!1568886 (= e!874597 (contains!10417 lt!673246 (tuple2!25311 key2!21 v2!10)))))

(declare-fun bm!71988 () Bool)

(assert (=> bm!71988 (= call!71992 call!71993)))

(declare-fun bm!71989 () Bool)

(assert (=> bm!71989 (= call!71991 ($colon$colon!990 e!874599 (ite c!144605 (h!38167 (insertStrictlySorted!583 (t!51632 l!750) key1!37 v1!32)) (tuple2!25311 key2!21 v2!10))))))

(declare-fun c!144606 () Bool)

(assert (=> bm!71989 (= c!144606 c!144605)))

(declare-fun b!1568887 () Bool)

(assert (=> b!1568887 (= e!874600 call!71992)))

(declare-fun bm!71990 () Bool)

(assert (=> bm!71990 (= call!71993 call!71991)))

(declare-fun b!1568888 () Bool)

(assert (=> b!1568888 (= e!874599 (ite c!144604 (t!51632 (insertStrictlySorted!583 (t!51632 l!750) key1!37 v1!32)) (ite c!144603 (Cons!36720 (h!38167 (insertStrictlySorted!583 (t!51632 l!750) key1!37 v1!32)) (t!51632 (insertStrictlySorted!583 (t!51632 l!750) key1!37 v1!32))) Nil!36721)))))

(declare-fun b!1568889 () Bool)

(declare-fun res!1072384 () Bool)

(assert (=> b!1568889 (=> (not res!1072384) (not e!874597))))

(assert (=> b!1568889 (= res!1072384 (containsKey!859 lt!673246 key2!21))))

(assert (= (and d!163801 c!144605) b!1568881))

(assert (= (and d!163801 (not c!144605)) b!1568885))

(assert (= (and b!1568885 c!144604) b!1568883))

(assert (= (and b!1568885 (not c!144604)) b!1568880))

(assert (= (and b!1568880 c!144603) b!1568884))

(assert (= (and b!1568880 (not c!144603)) b!1568887))

(assert (= (or b!1568884 b!1568887) bm!71988))

(assert (= (or b!1568883 bm!71988) bm!71990))

(assert (= (or b!1568881 bm!71990) bm!71989))

(assert (= (and bm!71989 c!144606) b!1568882))

(assert (= (and bm!71989 (not c!144606)) b!1568888))

(assert (= (and d!163801 res!1072385) b!1568889))

(assert (= (and b!1568889 res!1072384) b!1568886))

(declare-fun m!1443423 () Bool)

(assert (=> d!163801 m!1443423))

(assert (=> d!163801 m!1443283))

(declare-fun m!1443425 () Bool)

(assert (=> d!163801 m!1443425))

(declare-fun m!1443427 () Bool)

(assert (=> bm!71989 m!1443427))

(declare-fun m!1443429 () Bool)

(assert (=> b!1568889 m!1443429))

(declare-fun m!1443431 () Bool)

(assert (=> b!1568882 m!1443431))

(declare-fun m!1443433 () Bool)

(assert (=> b!1568886 m!1443433))

(assert (=> b!1568672 d!163801))

(declare-fun b!1568890 () Bool)

(declare-fun c!144607 () Bool)

(assert (=> b!1568890 (= c!144607 (and (is-Cons!36720 (t!51632 l!750)) (bvsgt (_1!12666 (h!38167 (t!51632 l!750))) key2!21)))))

(declare-fun e!874601 () List!36724)

(declare-fun e!874605 () List!36724)

(assert (=> b!1568890 (= e!874601 e!874605)))

(declare-fun b!1568891 () Bool)

(declare-fun e!874603 () List!36724)

(declare-fun call!71994 () List!36724)

(assert (=> b!1568891 (= e!874603 call!71994)))

(declare-fun e!874604 () List!36724)

(declare-fun b!1568892 () Bool)

(assert (=> b!1568892 (= e!874604 (insertStrictlySorted!583 (t!51632 (t!51632 l!750)) key2!21 v2!10))))

(declare-fun b!1568893 () Bool)

(declare-fun call!71996 () List!36724)

(assert (=> b!1568893 (= e!874601 call!71996)))

(declare-fun b!1568894 () Bool)

(declare-fun call!71995 () List!36724)

(assert (=> b!1568894 (= e!874605 call!71995)))

(declare-fun d!163803 () Bool)

(declare-fun e!874602 () Bool)

(assert (=> d!163803 e!874602))

(declare-fun res!1072387 () Bool)

(assert (=> d!163803 (=> (not res!1072387) (not e!874602))))

(declare-fun lt!673247 () List!36724)

(assert (=> d!163803 (= res!1072387 (isStrictlySorted!997 lt!673247))))

(assert (=> d!163803 (= lt!673247 e!874603)))

(declare-fun c!144609 () Bool)

(assert (=> d!163803 (= c!144609 (and (is-Cons!36720 (t!51632 l!750)) (bvslt (_1!12666 (h!38167 (t!51632 l!750))) key2!21)))))

(assert (=> d!163803 (isStrictlySorted!997 (t!51632 l!750))))

(assert (=> d!163803 (= (insertStrictlySorted!583 (t!51632 l!750) key2!21 v2!10) lt!673247)))

(declare-fun b!1568895 () Bool)

(assert (=> b!1568895 (= e!874603 e!874601)))

(declare-fun c!144608 () Bool)

(assert (=> b!1568895 (= c!144608 (and (is-Cons!36720 (t!51632 l!750)) (= (_1!12666 (h!38167 (t!51632 l!750))) key2!21)))))

(declare-fun b!1568896 () Bool)

(assert (=> b!1568896 (= e!874602 (contains!10417 lt!673247 (tuple2!25311 key2!21 v2!10)))))

(declare-fun bm!71991 () Bool)

(assert (=> bm!71991 (= call!71995 call!71996)))

(declare-fun bm!71992 () Bool)

(assert (=> bm!71992 (= call!71994 ($colon$colon!990 e!874604 (ite c!144609 (h!38167 (t!51632 l!750)) (tuple2!25311 key2!21 v2!10))))))

(declare-fun c!144610 () Bool)

(assert (=> bm!71992 (= c!144610 c!144609)))

(declare-fun b!1568897 () Bool)

(assert (=> b!1568897 (= e!874605 call!71995)))

(declare-fun bm!71993 () Bool)

(assert (=> bm!71993 (= call!71996 call!71994)))

(declare-fun b!1568898 () Bool)

(assert (=> b!1568898 (= e!874604 (ite c!144608 (t!51632 (t!51632 l!750)) (ite c!144607 (Cons!36720 (h!38167 (t!51632 l!750)) (t!51632 (t!51632 l!750))) Nil!36721)))))

(declare-fun b!1568899 () Bool)

(declare-fun res!1072386 () Bool)

(assert (=> b!1568899 (=> (not res!1072386) (not e!874602))))

(assert (=> b!1568899 (= res!1072386 (containsKey!859 lt!673247 key2!21))))

(assert (= (and d!163803 c!144609) b!1568891))

(assert (= (and d!163803 (not c!144609)) b!1568895))

(assert (= (and b!1568895 c!144608) b!1568893))

(assert (= (and b!1568895 (not c!144608)) b!1568890))

(assert (= (and b!1568890 c!144607) b!1568894))

(assert (= (and b!1568890 (not c!144607)) b!1568897))

(assert (= (or b!1568894 b!1568897) bm!71991))

(assert (= (or b!1568893 bm!71991) bm!71993))

(assert (= (or b!1568891 bm!71993) bm!71992))

(assert (= (and bm!71992 c!144610) b!1568892))

(assert (= (and bm!71992 (not c!144610)) b!1568898))

(assert (= (and d!163803 res!1072387) b!1568899))

(assert (= (and b!1568899 res!1072386) b!1568896))

(declare-fun m!1443435 () Bool)

(assert (=> d!163803 m!1443435))

(assert (=> d!163803 m!1443293))

