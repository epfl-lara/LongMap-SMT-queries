; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87288 () Bool)

(assert start!87288)

(declare-fun b!1011718 () Bool)

(declare-fun res!679710 () Bool)

(declare-fun e!569150 () Bool)

(assert (=> b!1011718 (=> (not res!679710) (not e!569150))))

(declare-datatypes ((B!1316 0))(
  ( (B!1317 (val!11742 Int)) )
))
(declare-datatypes ((tuple2!15110 0))(
  ( (tuple2!15111 (_1!7566 (_ BitVec 64)) (_2!7566 B!1316)) )
))
(declare-datatypes ((List!21369 0))(
  ( (Nil!21366) (Cons!21365 (h!22563 tuple2!15110) (t!30361 List!21369)) )
))
(declare-fun l!412 () List!21369)

(declare-fun value!115 () B!1316)

(get-info :version)

(assert (=> b!1011718 (= res!679710 (and ((_ is Cons!21365) l!412) (= (_2!7566 (h!22563 l!412)) value!115)))))

(declare-fun res!679712 () Bool)

(assert (=> start!87288 (=> (not res!679712) (not e!569150))))

(declare-fun isStrictlySorted!518 (List!21369) Bool)

(assert (=> start!87288 (= res!679712 (isStrictlySorted!518 l!412))))

(assert (=> start!87288 e!569150))

(declare-fun e!569149 () Bool)

(assert (=> start!87288 e!569149))

(declare-fun tp_is_empty!23383 () Bool)

(assert (=> start!87288 tp_is_empty!23383))

(declare-fun b!1011721 () Bool)

(declare-fun tp!70230 () Bool)

(assert (=> b!1011721 (= e!569149 (and tp_is_empty!23383 tp!70230))))

(declare-fun b!1011720 () Bool)

(assert (=> b!1011720 (= e!569150 (not (isStrictlySorted!518 (t!30361 l!412))))))

(declare-fun b!1011719 () Bool)

(declare-fun res!679711 () Bool)

(assert (=> b!1011719 (=> (not res!679711) (not e!569150))))

(declare-datatypes ((List!21370 0))(
  ( (Nil!21367) (Cons!21366 (h!22564 (_ BitVec 64)) (t!30362 List!21370)) )
))
(declare-fun isEmpty!779 (List!21370) Bool)

(declare-fun getKeysOf!7 (List!21369 B!1316) List!21370)

(assert (=> b!1011719 (= res!679711 (not (isEmpty!779 (getKeysOf!7 (t!30361 l!412) value!115))))))

(assert (= (and start!87288 res!679712) b!1011718))

(assert (= (and b!1011718 res!679710) b!1011719))

(assert (= (and b!1011719 res!679711) b!1011720))

(assert (= (and start!87288 ((_ is Cons!21365) l!412)) b!1011721))

(declare-fun m!935119 () Bool)

(assert (=> start!87288 m!935119))

(declare-fun m!935121 () Bool)

(assert (=> b!1011720 m!935121))

(declare-fun m!935123 () Bool)

(assert (=> b!1011719 m!935123))

(assert (=> b!1011719 m!935123))

(declare-fun m!935125 () Bool)

(assert (=> b!1011719 m!935125))

(check-sat tp_is_empty!23383 (not b!1011720) (not b!1011719) (not b!1011721) (not start!87288))
(check-sat)
(get-model)

(declare-fun d!120069 () Bool)

(assert (=> d!120069 (= (isEmpty!779 (getKeysOf!7 (t!30361 l!412) value!115)) ((_ is Nil!21367) (getKeysOf!7 (t!30361 l!412) value!115)))))

(assert (=> b!1011719 d!120069))

(declare-fun b!1011801 () Bool)

(assert (=> b!1011801 true))

(assert (=> b!1011801 true))

(assert (=> b!1011801 true))

(declare-fun bs!28721 () Bool)

(declare-fun b!1011811 () Bool)

(assert (= bs!28721 (and b!1011811 b!1011801)))

(declare-fun lambda!265 () Int)

(declare-fun lt!447069 () List!21369)

(declare-fun lt!447055 () tuple2!15110)

(declare-fun lambda!261 () Int)

(declare-fun lt!447054 () tuple2!15110)

(declare-fun lt!447059 () List!21369)

(assert (=> bs!28721 (= (= (Cons!21365 lt!447054 lt!447059) (Cons!21365 lt!447055 lt!447069)) (= lambda!265 lambda!261))))

(assert (=> b!1011811 true))

(assert (=> b!1011811 true))

(assert (=> b!1011811 true))

(declare-fun bs!28725 () Bool)

(declare-fun d!120071 () Bool)

(assert (= bs!28725 (and d!120071 b!1011801)))

(declare-fun lambda!269 () Int)

(assert (=> bs!28725 (= (= (t!30361 l!412) (Cons!21365 lt!447055 lt!447069)) (= lambda!269 lambda!261))))

(declare-fun bs!28728 () Bool)

(assert (= bs!28728 (and d!120071 b!1011811)))

(assert (=> bs!28728 (= (= (t!30361 l!412) (Cons!21365 lt!447054 lt!447059)) (= lambda!269 lambda!265))))

(assert (=> d!120071 true))

(assert (=> d!120071 true))

(declare-datatypes ((Unit!32917 0))(
  ( (Unit!32918) )
))
(declare-fun call!42450 () Unit!32917)

(declare-fun lt!447065 () List!21370)

(declare-fun lt!447074 () List!21370)

(declare-fun c!102181 () Bool)

(declare-fun bm!42440 () Bool)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!4 (List!21369 List!21370 B!1316 tuple2!15110) Unit!32917)

(assert (=> bm!42440 (= call!42450 (lemmaForallGetValueByKeySameWithASmallerHead!4 (ite c!102181 lt!447069 lt!447059) (ite c!102181 lt!447065 lt!447074) value!115 (ite c!102181 lt!447055 lt!447054)))))

(declare-fun bm!42441 () Bool)

(declare-fun call!42445 () List!21370)

(assert (=> bm!42441 (= call!42445 (getKeysOf!7 (t!30361 (t!30361 l!412)) value!115))))

(declare-fun call!42443 () Bool)

(assert (=> b!1011801 call!42443))

(declare-fun lt!447062 () Unit!32917)

(assert (=> b!1011801 (= lt!447062 call!42450)))

(assert (=> b!1011801 (= lt!447055 (h!22563 (t!30361 l!412)))))

(assert (=> b!1011801 (= lt!447065 call!42445)))

(assert (=> b!1011801 (= lt!447069 (t!30361 (t!30361 l!412)))))

(declare-fun e!569196 () Unit!32917)

(assert (=> b!1011801 (= e!569196 lt!447062)))

(declare-fun b!1011803 () Bool)

(declare-fun e!569199 () List!21370)

(assert (=> b!1011803 (= e!569199 Nil!21367)))

(declare-fun b!1011804 () Bool)

(declare-fun e!569193 () List!21370)

(assert (=> b!1011804 (= e!569193 (Cons!21366 (_1!7566 (h!22563 (t!30361 l!412))) call!42445))))

(declare-fun c!102185 () Bool)

(declare-fun call!42449 () Bool)

(assert (=> b!1011804 (= c!102185 (not call!42449))))

(declare-fun lt!447067 () Unit!32917)

(assert (=> b!1011804 (= lt!447067 e!569196)))

(declare-fun lt!447072 () List!21370)

(declare-fun forall!203 (List!21370 Int) Bool)

(assert (=> d!120071 (forall!203 lt!447072 lambda!269)))

(assert (=> d!120071 (= lt!447072 e!569193)))

(assert (=> d!120071 (= c!102181 (and ((_ is Cons!21365) (t!30361 l!412)) (= (_2!7566 (h!22563 (t!30361 l!412))) value!115)))))

(assert (=> d!120071 (isStrictlySorted!518 (t!30361 l!412))))

(assert (=> d!120071 (= (getKeysOf!7 (t!30361 l!412) value!115) lt!447072)))

(declare-fun b!1011805 () Bool)

(declare-fun Unit!32924 () Unit!32917)

(assert (=> b!1011805 (= e!569196 Unit!32924)))

(declare-fun b!1011807 () Bool)

(declare-fun lt!447060 () Unit!32917)

(declare-fun e!569197 () Unit!32917)

(assert (=> b!1011807 (= lt!447060 e!569197)))

(declare-fun c!102184 () Bool)

(assert (=> b!1011807 (= c!102184 (not call!42449))))

(declare-fun lt!447057 () List!21370)

(assert (=> b!1011807 (= lt!447057 call!42445)))

(assert (=> b!1011807 (= e!569199 call!42445)))

(declare-fun bm!42445 () Bool)

(assert (=> bm!42445 (= call!42443 (forall!203 (ite c!102181 lt!447065 lt!447074) (ite c!102181 lambda!261 lambda!265)))))

(declare-fun b!1011810 () Bool)

(declare-fun Unit!32925 () Unit!32917)

(assert (=> b!1011810 (= e!569197 Unit!32925)))

(declare-fun lt!447063 () Unit!32917)

(assert (=> b!1011811 (= e!569197 lt!447063)))

(assert (=> b!1011811 (= lt!447059 (t!30361 (t!30361 l!412)))))

(assert (=> b!1011811 (= lt!447074 call!42445)))

(assert (=> b!1011811 (= lt!447054 (h!22563 (t!30361 l!412)))))

(assert (=> b!1011811 (= lt!447063 call!42450)))

(assert (=> b!1011811 call!42443))

(declare-fun bm!42447 () Bool)

(assert (=> bm!42447 (= call!42449 (isEmpty!779 call!42445))))

(declare-fun b!1011814 () Bool)

(assert (=> b!1011814 (= e!569193 e!569199)))

(declare-fun c!102186 () Bool)

(assert (=> b!1011814 (= c!102186 (and ((_ is Cons!21365) (t!30361 l!412)) (not (= (_2!7566 (h!22563 (t!30361 l!412))) value!115))))))

(assert (= (and d!120071 c!102181) b!1011804))

(assert (= (and d!120071 (not c!102181)) b!1011814))

(assert (= (and b!1011804 c!102185) b!1011801))

(assert (= (and b!1011804 (not c!102185)) b!1011805))

(assert (= (and b!1011814 c!102186) b!1011807))

(assert (= (and b!1011814 (not c!102186)) b!1011803))

(assert (= (and b!1011807 c!102184) b!1011811))

(assert (= (and b!1011807 (not c!102184)) b!1011810))

(assert (= (or b!1011801 b!1011811) bm!42440))

(assert (= (or b!1011801 b!1011811) bm!42445))

(assert (= (or b!1011804 b!1011801 b!1011807 b!1011811) bm!42441))

(assert (= (or b!1011804 b!1011807) bm!42447))

(declare-fun m!935144 () Bool)

(assert (=> bm!42447 m!935144))

(declare-fun m!935149 () Bool)

(assert (=> d!120071 m!935149))

(assert (=> d!120071 m!935121))

(declare-fun m!935155 () Bool)

(assert (=> bm!42441 m!935155))

(declare-fun m!935160 () Bool)

(assert (=> bm!42445 m!935160))

(declare-fun m!935165 () Bool)

(assert (=> bm!42440 m!935165))

(assert (=> b!1011719 d!120071))

(declare-fun d!120084 () Bool)

(declare-fun res!679747 () Bool)

(declare-fun e!569218 () Bool)

(assert (=> d!120084 (=> res!679747 e!569218)))

(assert (=> d!120084 (= res!679747 (or ((_ is Nil!21366) (t!30361 l!412)) ((_ is Nil!21366) (t!30361 (t!30361 l!412)))))))

(assert (=> d!120084 (= (isStrictlySorted!518 (t!30361 l!412)) e!569218)))

(declare-fun b!1011857 () Bool)

(declare-fun e!569219 () Bool)

(assert (=> b!1011857 (= e!569218 e!569219)))

(declare-fun res!679748 () Bool)

(assert (=> b!1011857 (=> (not res!679748) (not e!569219))))

(assert (=> b!1011857 (= res!679748 (bvslt (_1!7566 (h!22563 (t!30361 l!412))) (_1!7566 (h!22563 (t!30361 (t!30361 l!412))))))))

(declare-fun b!1011858 () Bool)

(assert (=> b!1011858 (= e!569219 (isStrictlySorted!518 (t!30361 (t!30361 l!412))))))

(assert (= (and d!120084 (not res!679747)) b!1011857))

(assert (= (and b!1011857 res!679748) b!1011858))

(declare-fun m!935175 () Bool)

(assert (=> b!1011858 m!935175))

(assert (=> b!1011720 d!120084))

(declare-fun d!120089 () Bool)

(declare-fun res!679751 () Bool)

(declare-fun e!569222 () Bool)

(assert (=> d!120089 (=> res!679751 e!569222)))

(assert (=> d!120089 (= res!679751 (or ((_ is Nil!21366) l!412) ((_ is Nil!21366) (t!30361 l!412))))))

(assert (=> d!120089 (= (isStrictlySorted!518 l!412) e!569222)))

(declare-fun b!1011861 () Bool)

(declare-fun e!569223 () Bool)

(assert (=> b!1011861 (= e!569222 e!569223)))

(declare-fun res!679752 () Bool)

(assert (=> b!1011861 (=> (not res!679752) (not e!569223))))

(assert (=> b!1011861 (= res!679752 (bvslt (_1!7566 (h!22563 l!412)) (_1!7566 (h!22563 (t!30361 l!412)))))))

(declare-fun b!1011862 () Bool)

(assert (=> b!1011862 (= e!569223 (isStrictlySorted!518 (t!30361 l!412)))))

(assert (= (and d!120089 (not res!679751)) b!1011861))

(assert (= (and b!1011861 res!679752) b!1011862))

(assert (=> b!1011862 m!935121))

(assert (=> start!87288 d!120089))

(declare-fun b!1011873 () Bool)

(declare-fun e!569230 () Bool)

(declare-fun tp!70244 () Bool)

(assert (=> b!1011873 (= e!569230 (and tp_is_empty!23383 tp!70244))))

(assert (=> b!1011721 (= tp!70230 e!569230)))

(assert (= (and b!1011721 ((_ is Cons!21365) (t!30361 l!412))) b!1011873))

(check-sat (not bm!42440) tp_is_empty!23383 (not b!1011858) (not bm!42441) (not bm!42445) (not b!1011873) (not bm!42447) (not b!1011862) (not d!120071))
(check-sat)
