; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87760 () Bool)

(assert start!87760)

(declare-fun b!1014769 () Bool)

(assert (=> b!1014769 true))

(assert (=> b!1014769 true))

(declare-fun b!1014763 () Bool)

(declare-fun res!680876 () Bool)

(declare-fun e!570846 () Bool)

(assert (=> b!1014763 (=> res!680876 e!570846)))

(declare-datatypes ((B!1446 0))(
  ( (B!1447 (val!11807 Int)) )
))
(declare-datatypes ((tuple2!15160 0))(
  ( (tuple2!15161 (_1!7591 (_ BitVec 64)) (_2!7591 B!1446)) )
))
(declare-datatypes ((List!21446 0))(
  ( (Nil!21443) (Cons!21442 (h!22640 tuple2!15160) (t!30447 List!21446)) )
))
(declare-fun l!412 () List!21446)

(declare-fun isEmpty!843 (List!21446) Bool)

(assert (=> b!1014763 (= res!680876 (isEmpty!843 (t!30447 l!412)))))

(declare-fun b!1014764 () Bool)

(declare-fun e!570845 () Bool)

(declare-fun tp_is_empty!23513 () Bool)

(declare-fun tp!70562 () Bool)

(assert (=> b!1014764 (= e!570845 (and tp_is_empty!23513 tp!70562))))

(declare-fun b!1014765 () Bool)

(declare-fun e!570844 () Bool)

(assert (=> b!1014765 (= e!570844 e!570846)))

(declare-fun res!680878 () Bool)

(assert (=> b!1014765 (=> res!680878 e!570846)))

(declare-fun isStrictlySorted!581 (List!21446) Bool)

(assert (=> b!1014765 (= res!680878 (not (isStrictlySorted!581 (t!30447 l!412))))))

(declare-fun b!1014767 () Bool)

(declare-fun e!570847 () Bool)

(assert (=> b!1014767 (= e!570847 e!570844)))

(declare-fun res!680879 () Bool)

(assert (=> b!1014767 (=> (not res!680879) (not e!570844))))

(declare-datatypes ((List!21447 0))(
  ( (Nil!21444) (Cons!21443 (h!22641 (_ BitVec 64)) (t!30448 List!21447)) )
))
(declare-fun lt!448740 () List!21447)

(declare-fun isEmpty!844 (List!21447) Bool)

(assert (=> b!1014767 (= res!680879 (not (isEmpty!844 lt!448740)))))

(declare-fun value!115 () B!1446)

(declare-fun getKeysOf!54 (List!21446 B!1446) List!21447)

(assert (=> b!1014767 (= lt!448740 (getKeysOf!54 (t!30447 l!412) value!115))))

(declare-fun b!1014766 () Bool)

(declare-fun head!943 (List!21446) tuple2!15160)

(assert (=> b!1014766 (= e!570846 (bvsge (_1!7591 (h!22640 l!412)) (_1!7591 (head!943 (t!30447 l!412)))))))

(declare-fun res!680880 () Bool)

(assert (=> start!87760 (=> (not res!680880) (not e!570847))))

(assert (=> start!87760 (= res!680880 (isStrictlySorted!581 l!412))))

(assert (=> start!87760 e!570847))

(assert (=> start!87760 e!570845))

(assert (=> start!87760 tp_is_empty!23513))

(declare-fun b!1014768 () Bool)

(declare-fun res!680875 () Bool)

(assert (=> b!1014768 (=> (not res!680875) (not e!570847))))

(assert (=> b!1014768 (= res!680875 (and (not (= (_2!7591 (h!22640 l!412)) value!115)) (is-Cons!21442 l!412)))))

(declare-fun res!680877 () Bool)

(assert (=> b!1014769 (=> res!680877 e!570846)))

(declare-fun lambda!746 () Int)

(declare-fun forall!246 (List!21447 Int) Bool)

(assert (=> b!1014769 (= res!680877 (not (forall!246 lt!448740 lambda!746)))))

(assert (= (and start!87760 res!680880) b!1014768))

(assert (= (and b!1014768 res!680875) b!1014767))

(assert (= (and b!1014767 res!680879) b!1014765))

(assert (= (and b!1014765 (not res!680878)) b!1014763))

(assert (= (and b!1014763 (not res!680876)) b!1014769))

(assert (= (and b!1014769 (not res!680877)) b!1014766))

(assert (= (and start!87760 (is-Cons!21442 l!412)) b!1014764))

(declare-fun m!937177 () Bool)

(assert (=> b!1014763 m!937177))

(declare-fun m!937179 () Bool)

(assert (=> start!87760 m!937179))

(declare-fun m!937181 () Bool)

(assert (=> b!1014766 m!937181))

(declare-fun m!937183 () Bool)

(assert (=> b!1014765 m!937183))

(declare-fun m!937185 () Bool)

(assert (=> b!1014769 m!937185))

(declare-fun m!937187 () Bool)

(assert (=> b!1014767 m!937187))

(declare-fun m!937189 () Bool)

(assert (=> b!1014767 m!937189))

(push 1)

(assert (not b!1014766))

(assert tp_is_empty!23513)

(assert (not b!1014767))

(assert (not b!1014764))

(assert (not b!1014769))

(assert (not b!1014765))

(assert (not start!87760))

(assert (not b!1014763))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120819 () Bool)

(declare-fun res!680891 () Bool)

(declare-fun e!570858 () Bool)

(assert (=> d!120819 (=> res!680891 e!570858)))

(assert (=> d!120819 (= res!680891 (or (is-Nil!21443 l!412) (is-Nil!21443 (t!30447 l!412))))))

(assert (=> d!120819 (= (isStrictlySorted!581 l!412) e!570858)))

(declare-fun b!1014784 () Bool)

(declare-fun e!570859 () Bool)

(assert (=> b!1014784 (= e!570858 e!570859)))

(declare-fun res!680892 () Bool)

(assert (=> b!1014784 (=> (not res!680892) (not e!570859))))

(assert (=> b!1014784 (= res!680892 (bvslt (_1!7591 (h!22640 l!412)) (_1!7591 (h!22640 (t!30447 l!412)))))))

(declare-fun b!1014785 () Bool)

(assert (=> b!1014785 (= e!570859 (isStrictlySorted!581 (t!30447 l!412)))))

(assert (= (and d!120819 (not res!680891)) b!1014784))

(assert (= (and b!1014784 res!680892) b!1014785))

(assert (=> b!1014785 m!937183))

(assert (=> start!87760 d!120819))

(declare-fun d!120821 () Bool)

(declare-fun res!680897 () Bool)

(declare-fun e!570864 () Bool)

(assert (=> d!120821 (=> res!680897 e!570864)))

(assert (=> d!120821 (= res!680897 (is-Nil!21444 lt!448740))))

(assert (=> d!120821 (= (forall!246 lt!448740 lambda!746) e!570864)))

(declare-fun b!1014790 () Bool)

(declare-fun e!570865 () Bool)

(assert (=> b!1014790 (= e!570864 e!570865)))

(declare-fun res!680898 () Bool)

(assert (=> b!1014790 (=> (not res!680898) (not e!570865))))

(declare-fun dynLambda!1893 (Int (_ BitVec 64)) Bool)

(assert (=> b!1014790 (= res!680898 (dynLambda!1893 lambda!746 (h!22641 lt!448740)))))

(declare-fun b!1014791 () Bool)

(assert (=> b!1014791 (= e!570865 (forall!246 (t!30448 lt!448740) lambda!746))))

(assert (= (and d!120821 (not res!680897)) b!1014790))

(assert (= (and b!1014790 res!680898) b!1014791))

(declare-fun b_lambda!15367 () Bool)

(assert (=> (not b_lambda!15367) (not b!1014790)))

(declare-fun m!937191 () Bool)

(assert (=> b!1014790 m!937191))

(declare-fun m!937193 () Bool)

(assert (=> b!1014791 m!937193))

(assert (=> b!1014769 d!120821))

(declare-fun d!120823 () Bool)

(assert (=> d!120823 (= (isEmpty!843 (t!30447 l!412)) (is-Nil!21443 (t!30447 l!412)))))

(assert (=> b!1014763 d!120823))

(declare-fun d!120825 () Bool)

(assert (=> d!120825 (= (isEmpty!844 lt!448740) (is-Nil!21444 lt!448740))))

(assert (=> b!1014767 d!120825))

(declare-fun bs!29303 () Bool)

(declare-fun b!1014897 () Bool)

(assert (= bs!29303 (and b!1014897 b!1014769)))

(declare-fun lt!448847 () tuple2!15160)

(declare-fun lambda!771 () Int)

(declare-fun lt!448846 () List!21446)

(assert (=> bs!29303 (= (= (Cons!21442 lt!448847 lt!448846) (t!30447 l!412)) (= lambda!771 lambda!746))))

(assert (=> b!1014897 true))

(assert (=> b!1014897 true))

(assert (=> b!1014897 true))

(declare-fun bs!29304 () Bool)

(declare-fun b!1014894 () Bool)

(assert (= bs!29304 (and b!1014894 b!1014769)))

(declare-fun lt!448844 () tuple2!15160)

(declare-fun lambda!772 () Int)

(declare-fun lt!448837 () List!21446)

(assert (=> bs!29304 (= (= (Cons!21442 lt!448844 lt!448837) (t!30447 l!412)) (= lambda!772 lambda!746))))

(declare-fun bs!29305 () Bool)

(assert (= bs!29305 (and b!1014894 b!1014897)))

(assert (=> bs!29305 (= (= (Cons!21442 lt!448844 lt!448837) (Cons!21442 lt!448847 lt!448846)) (= lambda!772 lambda!771))))

(assert (=> b!1014894 true))

(assert (=> b!1014894 true))

(assert (=> b!1014894 true))

(declare-fun bs!29306 () Bool)

(declare-fun d!120827 () Bool)

(assert (= bs!29306 (and d!120827 b!1014769)))

(declare-fun lambda!773 () Int)

(assert (=> bs!29306 (= lambda!773 lambda!746)))

(declare-fun bs!29307 () Bool)

(assert (= bs!29307 (and d!120827 b!1014897)))

(assert (=> bs!29307 (= (= (t!30447 l!412) (Cons!21442 lt!448847 lt!448846)) (= lambda!773 lambda!771))))

(declare-fun bs!29308 () Bool)

(assert (= bs!29308 (and d!120827 b!1014894)))

(assert (=> bs!29308 (= (= (t!30447 l!412) (Cons!21442 lt!448844 lt!448837)) (= lambda!773 lambda!772))))

(assert (=> d!120827 true))

(assert (=> d!120827 true))

(declare-datatypes ((Unit!33193 0))(
  ( (Unit!33194) )
))
(declare-fun call!42883 () Unit!33193)

(declare-fun bm!42879 () Bool)

(declare-fun c!102787 () Bool)

(declare-fun lt!448843 () List!21447)

(declare-fun lt!448841 () List!21447)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!40 (List!21446 List!21447 B!1446 tuple2!15160) Unit!33193)

(assert (=> bm!42879 (= call!42883 (lemmaForallGetValueByKeySameWithASmallerHead!40 (ite c!102787 lt!448846 lt!448837) (ite c!102787 lt!448843 lt!448841) value!115 (ite c!102787 lt!448847 lt!448844)))))

(declare-fun b!1014892 () Bool)

(declare-fun e!570928 () List!21447)

(declare-fun call!42882 () List!21447)

(assert (=> b!1014892 (= e!570928 (Cons!21443 (_1!7591 (h!22640 (t!30447 l!412))) call!42882))))

(declare-fun c!102789 () Bool)

(declare-fun call!42885 () Bool)

(assert (=> b!1014892 (= c!102789 (not call!42885))))

(declare-fun lt!448839 () Unit!33193)

(declare-fun e!570929 () Unit!33193)

(assert (=> b!1014892 (= lt!448839 e!570929)))

(declare-fun bm!42880 () Bool)

(assert (=> bm!42880 (= call!42885 (isEmpty!844 call!42882))))

(declare-fun bm!42881 () Bool)

(declare-fun call!42884 () Bool)

(assert (=> bm!42881 (= call!42884 (forall!246 (ite c!102787 lt!448843 lt!448841) (ite c!102787 lambda!771 lambda!772)))))

(declare-fun b!1014893 () Bool)

(declare-fun lt!448838 () Unit!33193)

(declare-fun e!570927 () Unit!33193)

(assert (=> b!1014893 (= lt!448838 e!570927)))

(declare-fun c!102788 () Bool)

(assert (=> b!1014893 (= c!102788 (not call!42885))))

(declare-fun lt!448848 () List!21447)

(assert (=> b!1014893 (= lt!448848 call!42882)))

(declare-fun e!570926 () List!21447)

(assert (=> b!1014893 (= e!570926 call!42882)))

(declare-fun lt!448840 () Unit!33193)

(assert (=> b!1014894 (= e!570927 lt!448840)))

(assert (=> b!1014894 (= lt!448837 (t!30447 (t!30447 l!412)))))

(assert (=> b!1014894 (= lt!448841 call!42882)))

(assert (=> b!1014894 (= lt!448844 (h!22640 (t!30447 l!412)))))

(assert (=> b!1014894 (= lt!448840 call!42883)))

(assert (=> b!1014894 call!42884))

(declare-fun lt!448842 () List!21447)

(assert (=> d!120827 (forall!246 lt!448842 lambda!773)))

(assert (=> d!120827 (= lt!448842 e!570928)))

(assert (=> d!120827 (= c!102787 (and (is-Cons!21442 (t!30447 l!412)) (= (_2!7591 (h!22640 (t!30447 l!412))) value!115)))))

(assert (=> d!120827 (isStrictlySorted!581 (t!30447 l!412))))

(assert (=> d!120827 (= (getKeysOf!54 (t!30447 l!412) value!115) lt!448842)))

(declare-fun b!1014895 () Bool)

(assert (=> b!1014895 (= e!570928 e!570926)))

(declare-fun c!102786 () Bool)

(assert (=> b!1014895 (= c!102786 (and (is-Cons!21442 (t!30447 l!412)) (not (= (_2!7591 (h!22640 (t!30447 l!412))) value!115))))))

(declare-fun b!1014896 () Bool)

(assert (=> b!1014896 (= e!570926 Nil!21444)))

(assert (=> b!1014897 call!42884))

(declare-fun lt!448845 () Unit!33193)

(assert (=> b!1014897 (= lt!448845 call!42883)))

(assert (=> b!1014897 (= lt!448847 (h!22640 (t!30447 l!412)))))

(assert (=> b!1014897 (= lt!448843 call!42882)))

(assert (=> b!1014897 (= lt!448846 (t!30447 (t!30447 l!412)))))

(assert (=> b!1014897 (= e!570929 lt!448845)))

(declare-fun bm!42882 () Bool)

(assert (=> bm!42882 (= call!42882 (getKeysOf!54 (t!30447 (t!30447 l!412)) value!115))))

(declare-fun b!1014898 () Bool)

(declare-fun Unit!33195 () Unit!33193)

(assert (=> b!1014898 (= e!570927 Unit!33195)))

(declare-fun b!1014899 () Bool)

(declare-fun Unit!33196 () Unit!33193)

(assert (=> b!1014899 (= e!570929 Unit!33196)))

(assert (= (and d!120827 c!102787) b!1014892))

(assert (= (and d!120827 (not c!102787)) b!1014895))

(assert (= (and b!1014892 c!102789) b!1014897))

(assert (= (and b!1014892 (not c!102789)) b!1014899))

(assert (= (and b!1014895 c!102786) b!1014893))

(assert (= (and b!1014895 (not c!102786)) b!1014896))

(assert (= (and b!1014893 c!102788) b!1014894))

(assert (= (and b!1014893 (not c!102788)) b!1014898))

(assert (= (or b!1014897 b!1014894) bm!42879))

(assert (= (or b!1014897 b!1014894) bm!42881))

(assert (= (or b!1014892 b!1014897 b!1014893 b!1014894) bm!42882))

(assert (= (or b!1014892 b!1014893) bm!42880))

(declare-fun m!937231 () Bool)

(assert (=> bm!42881 m!937231))

(declare-fun m!937233 () Bool)

(assert (=> bm!42879 m!937233))

(declare-fun m!937235 () Bool)

(assert (=> bm!42880 m!937235))

(declare-fun m!937237 () Bool)

(assert (=> bm!42882 m!937237))

(declare-fun m!937239 () Bool)

(assert (=> d!120827 m!937239))

(assert (=> d!120827 m!937183))

(assert (=> b!1014767 d!120827))

(declare-fun d!120849 () Bool)

(declare-fun res!680921 () Bool)

(declare-fun e!570930 () Bool)

(assert (=> d!120849 (=> res!680921 e!570930)))

(assert (=> d!120849 (= res!680921 (or (is-Nil!21443 (t!30447 l!412)) (is-Nil!21443 (t!30447 (t!30447 l!412)))))))

