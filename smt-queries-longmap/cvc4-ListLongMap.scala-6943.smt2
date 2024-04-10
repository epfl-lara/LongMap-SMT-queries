; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87424 () Bool)

(assert start!87424)

(declare-fun b!1012888 () Bool)

(assert (=> b!1012888 true))

(assert (=> b!1012888 true))

(declare-fun b!1012884 () Bool)

(declare-fun e!569764 () Bool)

(declare-fun tp_is_empty!23435 () Bool)

(declare-fun tp!70352 () Bool)

(assert (=> b!1012884 (= e!569764 (and tp_is_empty!23435 tp!70352))))

(declare-fun b!1012885 () Bool)

(declare-fun res!680199 () Bool)

(declare-fun e!569762 () Bool)

(assert (=> b!1012885 (=> (not res!680199) (not e!569762))))

(declare-datatypes ((B!1368 0))(
  ( (B!1369 (val!11768 Int)) )
))
(declare-datatypes ((tuple2!15082 0))(
  ( (tuple2!15083 (_1!7552 (_ BitVec 64)) (_2!7552 B!1368)) )
))
(declare-datatypes ((List!21383 0))(
  ( (Nil!21380) (Cons!21379 (h!22577 tuple2!15082) (t!30384 List!21383)) )
))
(declare-fun l!412 () List!21383)

(declare-fun value!115 () B!1368)

(assert (=> b!1012885 (= res!680199 (and (not (= (_2!7552 (h!22577 l!412)) value!115)) (is-Cons!21379 l!412)))))

(declare-fun b!1012886 () Bool)

(declare-fun isStrictlySorted!548 (List!21383) Bool)

(assert (=> b!1012886 (= e!569762 (not (isStrictlySorted!548 (t!30384 l!412))))))

(declare-datatypes ((Unit!33093 0))(
  ( (Unit!33094) )
))
(declare-fun lt!447728 () Unit!33093)

(declare-fun e!569763 () Unit!33093)

(assert (=> b!1012886 (= lt!447728 e!569763)))

(declare-fun c!102357 () Bool)

(declare-datatypes ((List!21384 0))(
  ( (Nil!21381) (Cons!21380 (h!22578 (_ BitVec 64)) (t!30385 List!21384)) )
))
(declare-fun lt!447729 () List!21384)

(declare-fun isEmpty!806 (List!21384) Bool)

(assert (=> b!1012886 (= c!102357 (not (isEmpty!806 lt!447729)))))

(declare-fun getKeysOf!30 (List!21383 B!1368) List!21384)

(assert (=> b!1012886 (= lt!447729 (getKeysOf!30 (t!30384 l!412) value!115))))

(declare-fun res!680198 () Bool)

(assert (=> start!87424 (=> (not res!680198) (not e!569762))))

(assert (=> start!87424 (= res!680198 (isStrictlySorted!548 l!412))))

(assert (=> start!87424 e!569762))

(assert (=> start!87424 e!569764))

(assert (=> start!87424 tp_is_empty!23435))

(declare-fun b!1012887 () Bool)

(declare-fun Unit!33095 () Unit!33093)

(assert (=> b!1012887 (= e!569763 Unit!33095)))

(declare-fun lt!447727 () Unit!33093)

(assert (=> b!1012888 (= e!569763 lt!447727)))

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!18 (List!21383 List!21384 B!1368 tuple2!15082) Unit!33093)

(assert (=> b!1012888 (= lt!447727 (lemmaForallGetValueByKeySameWithASmallerHead!18 (t!30384 l!412) lt!447729 value!115 (h!22577 l!412)))))

(declare-fun lambda!425 () Int)

(declare-fun forall!223 (List!21384 Int) Bool)

(assert (=> b!1012888 (forall!223 lt!447729 lambda!425)))

(assert (= (and start!87424 res!680198) b!1012885))

(assert (= (and b!1012885 res!680199) b!1012886))

(assert (= (and b!1012886 c!102357) b!1012888))

(assert (= (and b!1012886 (not c!102357)) b!1012887))

(assert (= (and start!87424 (is-Cons!21379 l!412)) b!1012884))

(declare-fun m!936177 () Bool)

(assert (=> b!1012886 m!936177))

(declare-fun m!936179 () Bool)

(assert (=> b!1012886 m!936179))

(declare-fun m!936181 () Bool)

(assert (=> b!1012886 m!936181))

(declare-fun m!936183 () Bool)

(assert (=> start!87424 m!936183))

(declare-fun m!936185 () Bool)

(assert (=> b!1012888 m!936185))

(declare-fun m!936187 () Bool)

(assert (=> b!1012888 m!936187))

(push 1)

(assert (not b!1012884))

(assert (not b!1012886))

(assert (not start!87424))

(assert (not b!1012888))

(assert tp_is_empty!23435)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120345 () Bool)

(declare-fun res!680216 () Bool)

(declare-fun e!569781 () Bool)

(assert (=> d!120345 (=> res!680216 e!569781)))

(assert (=> d!120345 (= res!680216 (or (is-Nil!21380 l!412) (is-Nil!21380 (t!30384 l!412))))))

(assert (=> d!120345 (= (isStrictlySorted!548 l!412) e!569781)))

(declare-fun b!1012909 () Bool)

(declare-fun e!569782 () Bool)

(assert (=> b!1012909 (= e!569781 e!569782)))

(declare-fun res!680217 () Bool)

(assert (=> b!1012909 (=> (not res!680217) (not e!569782))))

(assert (=> b!1012909 (= res!680217 (bvslt (_1!7552 (h!22577 l!412)) (_1!7552 (h!22577 (t!30384 l!412)))))))

(declare-fun b!1012910 () Bool)

(assert (=> b!1012910 (= e!569782 (isStrictlySorted!548 (t!30384 l!412)))))

(assert (= (and d!120345 (not res!680216)) b!1012909))

(assert (= (and b!1012909 res!680217) b!1012910))

(assert (=> b!1012910 m!936177))

(assert (=> start!87424 d!120345))

(declare-fun d!120355 () Bool)

(declare-fun res!680218 () Bool)

(declare-fun e!569783 () Bool)

(assert (=> d!120355 (=> res!680218 e!569783)))

(assert (=> d!120355 (= res!680218 (or (is-Nil!21380 (t!30384 l!412)) (is-Nil!21380 (t!30384 (t!30384 l!412)))))))

(assert (=> d!120355 (= (isStrictlySorted!548 (t!30384 l!412)) e!569783)))

(declare-fun b!1012911 () Bool)

(declare-fun e!569784 () Bool)

(assert (=> b!1012911 (= e!569783 e!569784)))

(declare-fun res!680219 () Bool)

(assert (=> b!1012911 (=> (not res!680219) (not e!569784))))

(assert (=> b!1012911 (= res!680219 (bvslt (_1!7552 (h!22577 (t!30384 l!412))) (_1!7552 (h!22577 (t!30384 (t!30384 l!412))))))))

(declare-fun b!1012912 () Bool)

(assert (=> b!1012912 (= e!569784 (isStrictlySorted!548 (t!30384 (t!30384 l!412))))))

(assert (= (and d!120355 (not res!680218)) b!1012911))

(assert (= (and b!1012911 res!680219) b!1012912))

(declare-fun m!936191 () Bool)

(assert (=> b!1012912 m!936191))

(assert (=> b!1012886 d!120355))

(declare-fun d!120357 () Bool)

(assert (=> d!120357 (= (isEmpty!806 lt!447729) (is-Nil!21381 lt!447729))))

(assert (=> b!1012886 d!120357))

(declare-fun bs!28852 () Bool)

(declare-fun b!1012984 () Bool)

(assert (= bs!28852 (and b!1012984 b!1012888)))

(declare-fun lt!447833 () List!21383)

(declare-fun lambda!447 () Int)

(declare-fun lt!447835 () tuple2!15082)

(assert (=> bs!28852 (= (= (Cons!21379 lt!447835 lt!447833) l!412) (= lambda!447 lambda!425))))

(assert (=> b!1012984 true))

(assert (=> b!1012984 true))

(assert (=> b!1012984 true))

(declare-fun bs!28857 () Bool)

(declare-fun b!1012987 () Bool)

(assert (= bs!28857 (and b!1012987 b!1012888)))

(declare-fun lt!447831 () List!21383)

(declare-fun lambda!450 () Int)

(declare-fun lt!447829 () tuple2!15082)

(assert (=> bs!28857 (= (= (Cons!21379 lt!447829 lt!447831) l!412) (= lambda!450 lambda!425))))

(declare-fun bs!28859 () Bool)

(assert (= bs!28859 (and b!1012987 b!1012984)))

(assert (=> bs!28859 (= (= (Cons!21379 lt!447829 lt!447831) (Cons!21379 lt!447835 lt!447833)) (= lambda!450 lambda!447))))

(assert (=> b!1012987 true))

(assert (=> b!1012987 true))

(assert (=> b!1012987 true))

(declare-fun bs!28860 () Bool)

(declare-fun d!120361 () Bool)

(assert (= bs!28860 (and d!120361 b!1012888)))

(declare-fun lambda!452 () Int)

(assert (=> bs!28860 (= (= (t!30384 l!412) l!412) (= lambda!452 lambda!425))))

(declare-fun bs!28862 () Bool)

(assert (= bs!28862 (and d!120361 b!1012984)))

(assert (=> bs!28862 (= (= (t!30384 l!412) (Cons!21379 lt!447835 lt!447833)) (= lambda!452 lambda!447))))

(declare-fun bs!28864 () Bool)

(assert (= bs!28864 (and d!120361 b!1012987)))

(assert (=> bs!28864 (= (= (t!30384 l!412) (Cons!21379 lt!447829 lt!447831)) (= lambda!452 lambda!450))))

(assert (=> d!120361 true))

(assert (=> d!120361 true))

(declare-fun b!1012981 () Bool)

(declare-fun e!569821 () List!21384)

(declare-fun call!42621 () List!21384)

(assert (=> b!1012981 (= e!569821 (Cons!21380 (_1!7552 (h!22577 (t!30384 l!412))) call!42621))))

(declare-fun c!102391 () Bool)

(declare-fun call!42618 () Bool)

(assert (=> b!1012981 (= c!102391 (not call!42618))))

(declare-fun lt!447827 () Unit!33093)

(declare-fun e!569819 () Unit!33093)

(assert (=> b!1012981 (= lt!447827 e!569819)))

(declare-fun b!1012982 () Bool)

(declare-fun e!569822 () List!21384)

(assert (=> b!1012982 (= e!569822 Nil!21381)))

(declare-fun lt!447837 () List!21384)

(declare-fun call!42620 () Bool)

(declare-fun lt!447834 () List!21384)

(declare-fun c!102393 () Bool)

(declare-fun bm!42615 () Bool)

(assert (=> bm!42615 (= call!42620 (forall!223 (ite c!102393 lt!447837 lt!447834) (ite c!102393 lambda!447 lambda!450)))))

(declare-fun bm!42616 () Bool)

(assert (=> bm!42616 (= call!42621 (getKeysOf!30 (t!30384 (t!30384 l!412)) value!115))))

(declare-fun b!1012983 () Bool)

(assert (=> b!1012983 (= e!569821 e!569822)))

(declare-fun c!102390 () Bool)

(assert (=> b!1012983 (= c!102390 (and (is-Cons!21379 (t!30384 l!412)) (not (= (_2!7552 (h!22577 (t!30384 l!412))) value!115))))))

(assert (=> b!1012984 call!42620))

(declare-fun lt!447836 () Unit!33093)

(declare-fun call!42619 () Unit!33093)

(assert (=> b!1012984 (= lt!447836 call!42619)))

(assert (=> b!1012984 (= lt!447835 (h!22577 (t!30384 l!412)))))

(assert (=> b!1012984 (= lt!447837 call!42621)))

(assert (=> b!1012984 (= lt!447833 (t!30384 (t!30384 l!412)))))

(assert (=> b!1012984 (= e!569819 lt!447836)))

(declare-fun b!1012985 () Bool)

(declare-fun lt!447830 () Unit!33093)

(declare-fun e!569820 () Unit!33093)

(assert (=> b!1012985 (= lt!447830 e!569820)))

(declare-fun c!102392 () Bool)

(assert (=> b!1012985 (= c!102392 (not call!42618))))

(declare-fun lt!447826 () List!21384)

(assert (=> b!1012985 (= lt!447826 call!42621)))

(assert (=> b!1012985 (= e!569822 call!42621)))

(declare-fun bm!42617 () Bool)

(assert (=> bm!42617 (= call!42618 (isEmpty!806 call!42621))))

(declare-fun b!1012986 () Bool)

(declare-fun Unit!33100 () Unit!33093)

(assert (=> b!1012986 (= e!569819 Unit!33100)))

(declare-fun bm!42618 () Bool)

(assert (=> bm!42618 (= call!42619 (lemmaForallGetValueByKeySameWithASmallerHead!18 (ite c!102393 lt!447833 lt!447831) (ite c!102393 lt!447837 lt!447834) value!115 (ite c!102393 lt!447835 lt!447829)))))

(declare-fun lt!447832 () List!21384)

(assert (=> d!120361 (forall!223 lt!447832 lambda!452)))

(assert (=> d!120361 (= lt!447832 e!569821)))

(assert (=> d!120361 (= c!102393 (and (is-Cons!21379 (t!30384 l!412)) (= (_2!7552 (h!22577 (t!30384 l!412))) value!115)))))

(assert (=> d!120361 (isStrictlySorted!548 (t!30384 l!412))))

(assert (=> d!120361 (= (getKeysOf!30 (t!30384 l!412) value!115) lt!447832)))

(declare-fun lt!447828 () Unit!33093)

(assert (=> b!1012987 (= e!569820 lt!447828)))

(assert (=> b!1012987 (= lt!447831 (t!30384 (t!30384 l!412)))))

(assert (=> b!1012987 (= lt!447834 call!42621)))

(assert (=> b!1012987 (= lt!447829 (h!22577 (t!30384 l!412)))))

(assert (=> b!1012987 (= lt!447828 call!42619)))

(assert (=> b!1012987 call!42620))

(declare-fun b!1012988 () Bool)

(declare-fun Unit!33101 () Unit!33093)

(assert (=> b!1012988 (= e!569820 Unit!33101)))

(assert (= (and d!120361 c!102393) b!1012981))

(assert (= (and d!120361 (not c!102393)) b!1012983))

(assert (= (and b!1012981 c!102391) b!1012984))

(assert (= (and b!1012981 (not c!102391)) b!1012986))

(assert (= (and b!1012983 c!102390) b!1012985))

(assert (= (and b!1012983 (not c!102390)) b!1012982))

(assert (= (and b!1012985 c!102392) b!1012987))

(assert (= (and b!1012985 (not c!102392)) b!1012988))

(assert (= (or b!1012984 b!1012987) bm!42618))

(assert (= (or b!1012984 b!1012987) bm!42615))

(assert (= (or b!1012981 b!1012984 b!1012985 b!1012987) bm!42616))

(assert (= (or b!1012981 b!1012985) bm!42617))

(declare-fun m!936206 () Bool)

(assert (=> bm!42615 m!936206))

(declare-fun m!936211 () Bool)

(assert (=> bm!42616 m!936211))

(declare-fun m!936215 () Bool)

(assert (=> bm!42617 m!936215))

(declare-fun m!936217 () Bool)

(assert (=> d!120361 m!936217))

(assert (=> d!120361 m!936177))

(declare-fun m!936223 () Bool)

(assert (=> bm!42618 m!936223))

(assert (=> b!1012886 d!120361))

(declare-fun bs!28871 () Bool)

(declare-fun b!1013018 () Bool)

(assert (= bs!28871 (and b!1013018 b!1012888)))

(declare-fun lambda!467 () Int)

(assert (=> bs!28871 (= (= (t!30384 l!412) l!412) (= lambda!467 lambda!425))))

(declare-fun bs!28873 () Bool)

(assert (= bs!28873 (and b!1013018 b!1012984)))

(assert (=> bs!28873 (= (= (t!30384 l!412) (Cons!21379 lt!447835 lt!447833)) (= lambda!467 lambda!447))))

(declare-fun bs!28875 () Bool)

(assert (= bs!28875 (and b!1013018 b!1012987)))

(assert (=> bs!28875 (= (= (t!30384 l!412) (Cons!21379 lt!447829 lt!447831)) (= lambda!467 lambda!450))))

(declare-fun bs!28877 () Bool)

(assert (= bs!28877 (and b!1013018 d!120361)))

(assert (=> bs!28877 (= lambda!467 lambda!452)))

(assert (=> b!1013018 true))

(assert (=> b!1013018 true))

(declare-fun bs!28884 () Bool)

(declare-fun d!120369 () Bool)

(assert (= bs!28884 (and d!120369 b!1012984)))

(declare-fun lambda!470 () Int)

(assert (=> bs!28884 (= (= (Cons!21379 (h!22577 l!412) (t!30384 l!412)) (Cons!21379 lt!447835 lt!447833)) (= lambda!470 lambda!447))))

(declare-fun bs!28886 () Bool)

(assert (= bs!28886 (and d!120369 d!120361)))

(assert (=> bs!28886 (= (= (Cons!21379 (h!22577 l!412) (t!30384 l!412)) (t!30384 l!412)) (= lambda!470 lambda!452))))

(declare-fun bs!28888 () Bool)

(assert (= bs!28888 (and d!120369 b!1012888)))

(assert (=> bs!28888 (= (= (Cons!21379 (h!22577 l!412) (t!30384 l!412)) l!412) (= lambda!470 lambda!425))))

(declare-fun bs!28890 () Bool)

(assert (= bs!28890 (and d!120369 b!1012987)))

(assert (=> bs!28890 (= (= (Cons!21379 (h!22577 l!412) (t!30384 l!412)) (Cons!21379 lt!447829 lt!447831)) (= lambda!470 lambda!450))))

(declare-fun bs!28892 () Bool)

(assert (= bs!28892 (and d!120369 b!1013018)))

(assert (=> bs!28892 (= (= (Cons!21379 (h!22577 l!412) (t!30384 l!412)) (t!30384 l!412)) (= lambda!470 lambda!467))))

(assert (=> d!120369 true))

(assert (=> d!120369 true))

(assert (=> d!120369 true))

(assert (=> d!120369 (forall!223 lt!447729 lambda!470)))

(declare-fun lt!447846 () Unit!33093)

(declare-fun choose!1628 (List!21383 List!21384 B!1368 tuple2!15082) Unit!33093)

(assert (=> d!120369 (= lt!447846 (choose!1628 (t!30384 l!412) lt!447729 value!115 (h!22577 l!412)))))

(declare-fun e!569831 () Bool)

(assert (=> d!120369 e!569831))

(declare-fun res!680246 () Bool)

(assert (=> d!120369 (=> (not res!680246) (not e!569831))))

(assert (=> d!120369 (= res!680246 (isStrictlySorted!548 (t!30384 l!412)))))

(assert (=> d!120369 (= (lemmaForallGetValueByKeySameWithASmallerHead!18 (t!30384 l!412) lt!447729 value!115 (h!22577 l!412)) lt!447846)))

(declare-fun b!1013017 () Bool)

(declare-fun res!680247 () Bool)

(assert (=> b!1013017 (=> (not res!680247) (not e!569831))))

(declare-fun isEmpty!809 (List!21383) Bool)

(assert (=> b!1013017 (= res!680247 (not (isEmpty!809 (t!30384 l!412))))))

(declare-fun res!680248 () Bool)

(assert (=> b!1013018 (=> (not res!680248) (not e!569831))))

(assert (=> b!1013018 (= res!680248 (forall!223 lt!447729 lambda!467))))

(declare-fun b!1013019 () Bool)

(declare-fun head!931 (List!21383) tuple2!15082)

(assert (=> b!1013019 (= e!569831 (bvslt (_1!7552 (h!22577 l!412)) (_1!7552 (head!931 (t!30384 l!412)))))))

(assert (= (and d!120369 res!680246) b!1013017))

(assert (= (and b!1013017 res!680247) b!1013018))

(assert (= (and b!1013018 res!680248) b!1013019))

(declare-fun m!936239 () Bool)

(assert (=> d!120369 m!936239))

(declare-fun m!936245 () Bool)

(assert (=> d!120369 m!936245))

(assert (=> d!120369 m!936177))

