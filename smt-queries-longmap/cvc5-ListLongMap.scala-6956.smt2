; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87756 () Bool)

(assert start!87756)

(declare-fun b!1014718 () Bool)

(assert (=> b!1014718 true))

(assert (=> b!1014718 true))

(declare-fun b!1014713 () Bool)

(declare-fun e!570823 () Bool)

(declare-fun tp_is_empty!23509 () Bool)

(declare-fun tp!70556 () Bool)

(assert (=> b!1014713 (= e!570823 (and tp_is_empty!23509 tp!70556))))

(declare-fun b!1014714 () Bool)

(declare-fun e!570822 () Bool)

(declare-datatypes ((B!1442 0))(
  ( (B!1443 (val!11805 Int)) )
))
(declare-datatypes ((tuple2!15156 0))(
  ( (tuple2!15157 (_1!7589 (_ BitVec 64)) (_2!7589 B!1442)) )
))
(declare-datatypes ((List!21442 0))(
  ( (Nil!21439) (Cons!21438 (h!22636 tuple2!15156) (t!30443 List!21442)) )
))
(declare-fun l!412 () List!21442)

(declare-fun head!941 (List!21442) tuple2!15156)

(assert (=> b!1014714 (= e!570822 (bvsge (_1!7589 (h!22636 l!412)) (_1!7589 (head!941 (t!30443 l!412)))))))

(declare-fun res!680841 () Bool)

(declare-fun e!570821 () Bool)

(assert (=> start!87756 (=> (not res!680841) (not e!570821))))

(declare-fun isStrictlySorted!579 (List!21442) Bool)

(assert (=> start!87756 (= res!680841 (isStrictlySorted!579 l!412))))

(assert (=> start!87756 e!570821))

(assert (=> start!87756 e!570823))

(assert (=> start!87756 tp_is_empty!23509))

(declare-fun b!1014715 () Bool)

(declare-fun res!680839 () Bool)

(assert (=> b!1014715 (=> (not res!680839) (not e!570821))))

(declare-fun value!115 () B!1442)

(assert (=> b!1014715 (= res!680839 (and (not (= (_2!7589 (h!22636 l!412)) value!115)) (is-Cons!21438 l!412)))))

(declare-fun b!1014716 () Bool)

(declare-fun res!680844 () Bool)

(assert (=> b!1014716 (=> res!680844 e!570822)))

(declare-fun isEmpty!839 (List!21442) Bool)

(assert (=> b!1014716 (= res!680844 (isEmpty!839 (t!30443 l!412)))))

(declare-fun b!1014717 () Bool)

(declare-fun e!570820 () Bool)

(assert (=> b!1014717 (= e!570820 e!570822)))

(declare-fun res!680842 () Bool)

(assert (=> b!1014717 (=> res!680842 e!570822)))

(assert (=> b!1014717 (= res!680842 (not (isStrictlySorted!579 (t!30443 l!412))))))

(declare-fun res!680840 () Bool)

(assert (=> b!1014718 (=> res!680840 e!570822)))

(declare-datatypes ((List!21443 0))(
  ( (Nil!21440) (Cons!21439 (h!22637 (_ BitVec 64)) (t!30444 List!21443)) )
))
(declare-fun lt!448734 () List!21443)

(declare-fun lambda!740 () Int)

(declare-fun forall!244 (List!21443 Int) Bool)

(assert (=> b!1014718 (= res!680840 (not (forall!244 lt!448734 lambda!740)))))

(declare-fun b!1014719 () Bool)

(assert (=> b!1014719 (= e!570821 e!570820)))

(declare-fun res!680843 () Bool)

(assert (=> b!1014719 (=> (not res!680843) (not e!570820))))

(declare-fun isEmpty!840 (List!21443) Bool)

(assert (=> b!1014719 (= res!680843 (not (isEmpty!840 lt!448734)))))

(declare-fun getKeysOf!52 (List!21442 B!1442) List!21443)

(assert (=> b!1014719 (= lt!448734 (getKeysOf!52 (t!30443 l!412) value!115))))

(assert (= (and start!87756 res!680841) b!1014715))

(assert (= (and b!1014715 res!680839) b!1014719))

(assert (= (and b!1014719 res!680843) b!1014717))

(assert (= (and b!1014717 (not res!680842)) b!1014716))

(assert (= (and b!1014716 (not res!680844)) b!1014718))

(assert (= (and b!1014718 (not res!680840)) b!1014714))

(assert (= (and start!87756 (is-Cons!21438 l!412)) b!1014713))

(declare-fun m!937149 () Bool)

(assert (=> b!1014719 m!937149))

(declare-fun m!937151 () Bool)

(assert (=> b!1014719 m!937151))

(declare-fun m!937153 () Bool)

(assert (=> start!87756 m!937153))

(declare-fun m!937155 () Bool)

(assert (=> b!1014714 m!937155))

(declare-fun m!937157 () Bool)

(assert (=> b!1014716 m!937157))

(declare-fun m!937159 () Bool)

(assert (=> b!1014717 m!937159))

(declare-fun m!937161 () Bool)

(assert (=> b!1014718 m!937161))

(push 1)

(assert tp_is_empty!23509)

(assert (not start!87756))

(assert (not b!1014719))

(assert (not b!1014717))

(assert (not b!1014716))

(assert (not b!1014713))

(assert (not b!1014714))

(assert (not b!1014718))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120811 () Bool)

(assert (=> d!120811 (= (head!941 (t!30443 l!412)) (h!22636 (t!30443 l!412)))))

(assert (=> b!1014714 d!120811))

(declare-fun d!120813 () Bool)

(declare-fun res!680885 () Bool)

(declare-fun e!570852 () Bool)

(assert (=> d!120813 (=> res!680885 e!570852)))

(assert (=> d!120813 (= res!680885 (or (is-Nil!21439 l!412) (is-Nil!21439 (t!30443 l!412))))))

(assert (=> d!120813 (= (isStrictlySorted!579 l!412) e!570852)))

(declare-fun b!1014778 () Bool)

(declare-fun e!570853 () Bool)

(assert (=> b!1014778 (= e!570852 e!570853)))

(declare-fun res!680886 () Bool)

(assert (=> b!1014778 (=> (not res!680886) (not e!570853))))

(assert (=> b!1014778 (= res!680886 (bvslt (_1!7589 (h!22636 l!412)) (_1!7589 (h!22636 (t!30443 l!412)))))))

(declare-fun b!1014779 () Bool)

(assert (=> b!1014779 (= e!570853 (isStrictlySorted!579 (t!30443 l!412)))))

(assert (= (and d!120813 (not res!680885)) b!1014778))

(assert (= (and b!1014778 res!680886) b!1014779))

(assert (=> b!1014779 m!937159))

(assert (=> start!87756 d!120813))

(declare-fun d!120815 () Bool)

(assert (=> d!120815 (= (isEmpty!840 lt!448734) (is-Nil!21440 lt!448734))))

(assert (=> b!1014719 d!120815))

(declare-fun bs!29295 () Bool)

(declare-fun b!1014839 () Bool)

(assert (= bs!29295 (and b!1014839 b!1014718)))

(declare-fun lambda!762 () Int)

(declare-fun lt!448807 () List!21442)

(declare-fun lt!448808 () tuple2!15156)

(assert (=> bs!29295 (= (= (Cons!21438 lt!448808 lt!448807) (t!30443 l!412)) (= lambda!762 lambda!740))))

(assert (=> b!1014839 true))

(assert (=> b!1014839 true))

(assert (=> b!1014839 true))

(declare-fun bs!29296 () Bool)

(declare-fun b!1014834 () Bool)

(assert (= bs!29296 (and b!1014834 b!1014718)))

(declare-fun lt!448802 () tuple2!15156)

(declare-fun lambda!763 () Int)

(declare-fun lt!448809 () List!21442)

(assert (=> bs!29296 (= (= (Cons!21438 lt!448802 lt!448809) (t!30443 l!412)) (= lambda!763 lambda!740))))

(declare-fun bs!29297 () Bool)

(assert (= bs!29297 (and b!1014834 b!1014839)))

(assert (=> bs!29297 (= (= (Cons!21438 lt!448802 lt!448809) (Cons!21438 lt!448808 lt!448807)) (= lambda!763 lambda!762))))

(assert (=> b!1014834 true))

(assert (=> b!1014834 true))

(assert (=> b!1014834 true))

(declare-fun bs!29298 () Bool)

(declare-fun d!120817 () Bool)

(assert (= bs!29298 (and d!120817 b!1014718)))

(declare-fun lambda!764 () Int)

(assert (=> bs!29298 (= lambda!764 lambda!740)))

(declare-fun bs!29299 () Bool)

(assert (= bs!29299 (and d!120817 b!1014839)))

(assert (=> bs!29299 (= (= (t!30443 l!412) (Cons!21438 lt!448808 lt!448807)) (= lambda!764 lambda!762))))

(declare-fun bs!29300 () Bool)

(assert (= bs!29300 (and d!120817 b!1014834)))

(assert (=> bs!29300 (= (= (t!30443 l!412) (Cons!21438 lt!448802 lt!448809)) (= lambda!764 lambda!763))))

(assert (=> d!120817 true))

(assert (=> d!120817 true))

(declare-datatypes ((Unit!33187 0))(
  ( (Unit!33188) )
))
(declare-fun e!570887 () Unit!33187)

(declare-fun lt!448806 () Unit!33187)

(assert (=> b!1014834 (= e!570887 lt!448806)))

(assert (=> b!1014834 (= lt!448809 (t!30443 (t!30443 l!412)))))

(declare-fun lt!448812 () List!21443)

(declare-fun call!42873 () List!21443)

(assert (=> b!1014834 (= lt!448812 call!42873)))

(assert (=> b!1014834 (= lt!448802 (h!22636 (t!30443 l!412)))))

(declare-fun call!42870 () Unit!33187)

(assert (=> b!1014834 (= lt!448806 call!42870)))

(declare-fun call!42871 () Bool)

(assert (=> b!1014834 call!42871))

(declare-fun lt!448804 () List!21443)

(declare-fun c!102776 () Bool)

(declare-fun bm!42867 () Bool)

(assert (=> bm!42867 (= call!42871 (forall!244 (ite c!102776 lt!448804 lt!448812) (ite c!102776 lambda!762 lambda!763)))))

(declare-fun b!1014835 () Bool)

(declare-fun e!570889 () List!21443)

(assert (=> b!1014835 (= e!570889 Nil!21440)))

(declare-fun b!1014836 () Bool)

(declare-fun Unit!33191 () Unit!33187)

(assert (=> b!1014836 (= e!570887 Unit!33191)))

(declare-fun b!1014837 () Bool)

(declare-fun e!570886 () List!21443)

(assert (=> b!1014837 (= e!570886 e!570889)))

(declare-fun c!102775 () Bool)

(assert (=> b!1014837 (= c!102775 (and (is-Cons!21438 (t!30443 l!412)) (not (= (_2!7589 (h!22636 (t!30443 l!412))) value!115))))))

(declare-fun b!1014838 () Bool)

(declare-fun e!570888 () Unit!33187)

(declare-fun Unit!33192 () Unit!33187)

(assert (=> b!1014838 (= e!570888 Unit!33192)))

(declare-fun lt!448801 () List!21443)

(assert (=> d!120817 (forall!244 lt!448801 lambda!764)))

(assert (=> d!120817 (= lt!448801 e!570886)))

(assert (=> d!120817 (= c!102776 (and (is-Cons!21438 (t!30443 l!412)) (= (_2!7589 (h!22636 (t!30443 l!412))) value!115)))))

(assert (=> d!120817 (isStrictlySorted!579 (t!30443 l!412))))

(assert (=> d!120817 (= (getKeysOf!52 (t!30443 l!412) value!115) lt!448801)))

(declare-fun bm!42868 () Bool)

(assert (=> bm!42868 (= call!42873 (getKeysOf!52 (t!30443 (t!30443 l!412)) value!115))))

(assert (=> b!1014839 call!42871))

(declare-fun lt!448803 () Unit!33187)

(assert (=> b!1014839 (= lt!448803 call!42870)))

(assert (=> b!1014839 (= lt!448808 (h!22636 (t!30443 l!412)))))

(assert (=> b!1014839 (= lt!448804 call!42873)))

(assert (=> b!1014839 (= lt!448807 (t!30443 (t!30443 l!412)))))

(assert (=> b!1014839 (= e!570888 lt!448803)))

(declare-fun b!1014840 () Bool)

(assert (=> b!1014840 (= e!570886 (Cons!21439 (_1!7589 (h!22636 (t!30443 l!412))) call!42873))))

(declare-fun c!102774 () Bool)

(declare-fun call!42872 () Bool)

(assert (=> b!1014840 (= c!102774 (not call!42872))))

(declare-fun lt!448805 () Unit!33187)

(assert (=> b!1014840 (= lt!448805 e!570888)))

(declare-fun b!1014841 () Bool)

(declare-fun lt!448810 () Unit!33187)

(assert (=> b!1014841 (= lt!448810 e!570887)))

(declare-fun c!102777 () Bool)

(assert (=> b!1014841 (= c!102777 (not call!42872))))

(declare-fun lt!448811 () List!21443)

(assert (=> b!1014841 (= lt!448811 call!42873)))

(assert (=> b!1014841 (= e!570889 call!42873)))

(declare-fun bm!42869 () Bool)

(assert (=> bm!42869 (= call!42872 (isEmpty!840 call!42873))))

(declare-fun bm!42870 () Bool)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!39 (List!21442 List!21443 B!1442 tuple2!15156) Unit!33187)

(assert (=> bm!42870 (= call!42870 (lemmaForallGetValueByKeySameWithASmallerHead!39 (ite c!102776 lt!448807 lt!448809) (ite c!102776 lt!448804 lt!448812) value!115 (ite c!102776 lt!448808 lt!448802)))))

(assert (= (and d!120817 c!102776) b!1014840))

(assert (= (and d!120817 (not c!102776)) b!1014837))

(assert (= (and b!1014840 c!102774) b!1014839))

(assert (= (and b!1014840 (not c!102774)) b!1014838))

(assert (= (and b!1014837 c!102775) b!1014841))

(assert (= (and b!1014837 (not c!102775)) b!1014835))

(assert (= (and b!1014841 c!102777) b!1014834))

(assert (= (and b!1014841 (not c!102777)) b!1014836))

(assert (= (or b!1014839 b!1014834) bm!42870))

(assert (= (or b!1014839 b!1014834) bm!42867))

(assert (= (or b!1014840 b!1014839 b!1014834 b!1014841) bm!42868))

(assert (= (or b!1014840 b!1014841) bm!42869))

(declare-fun m!937207 () Bool)

(assert (=> d!120817 m!937207))

(assert (=> d!120817 m!937159))

(declare-fun m!937209 () Bool)

(assert (=> bm!42867 m!937209))

(declare-fun m!937211 () Bool)

(assert (=> bm!42869 m!937211))

(declare-fun m!937213 () Bool)

(assert (=> bm!42870 m!937213))

(declare-fun m!937215 () Bool)

(assert (=> bm!42868 m!937215))

(assert (=> b!1014719 d!120817))

(declare-fun d!120835 () Bool)

(declare-fun res!680905 () Bool)

(declare-fun e!570896 () Bool)

(assert (=> d!120835 (=> res!680905 e!570896)))

(assert (=> d!120835 (= res!680905 (or (is-Nil!21439 (t!30443 l!412)) (is-Nil!21439 (t!30443 (t!30443 l!412)))))))

(assert (=> d!120835 (= (isStrictlySorted!579 (t!30443 l!412)) e!570896)))

(declare-fun b!1014850 () Bool)

(declare-fun e!570897 () Bool)

(assert (=> b!1014850 (= e!570896 e!570897)))

(declare-fun res!680906 () Bool)

(assert (=> b!1014850 (=> (not res!680906) (not e!570897))))

(assert (=> b!1014850 (= res!680906 (bvslt (_1!7589 (h!22636 (t!30443 l!412))) (_1!7589 (h!22636 (t!30443 (t!30443 l!412))))))))

(declare-fun b!1014851 () Bool)

(assert (=> b!1014851 (= e!570897 (isStrictlySorted!579 (t!30443 (t!30443 l!412))))))

(assert (= (and d!120835 (not res!680905)) b!1014850))

(assert (= (and b!1014850 res!680906) b!1014851))

(declare-fun m!937217 () Bool)

(assert (=> b!1014851 m!937217))

(assert (=> b!1014717 d!120835))

(declare-fun d!120837 () Bool)

(declare-fun res!680919 () Bool)

(declare-fun e!570910 () Bool)

(assert (=> d!120837 (=> res!680919 e!570910)))

(assert (=> d!120837 (= res!680919 (is-Nil!21440 lt!448734))))

(assert (=> d!120837 (= (forall!244 lt!448734 lambda!740) e!570910)))

(declare-fun b!1014866 () Bool)

(declare-fun e!570911 () Bool)

(assert (=> b!1014866 (= e!570910 e!570911)))

(declare-fun res!680920 () Bool)

(assert (=> b!1014866 (=> (not res!680920) (not e!570911))))

(declare-fun dynLambda!1891 (Int (_ BitVec 64)) Bool)

(assert (=> b!1014866 (= res!680920 (dynLambda!1891 lambda!740 (h!22637 lt!448734)))))

(declare-fun b!1014867 () Bool)

(assert (=> b!1014867 (= e!570911 (forall!244 (t!30444 lt!448734) lambda!740))))

(assert (= (and d!120837 (not res!680919)) b!1014866))

(assert (= (and b!1014866 res!680920) b!1014867))

(declare-fun b_lambda!15371 () Bool)

(assert (=> (not b_lambda!15371) (not b!1014866)))

(declare-fun m!937223 () Bool)

(assert (=> b!1014866 m!937223))

(declare-fun m!937225 () Bool)

(assert (=> b!1014867 m!937225))

(assert (=> b!1014718 d!120837))

(declare-fun d!120843 () Bool)

(assert (=> d!120843 (= (isEmpty!839 (t!30443 l!412)) (is-Nil!21439 (t!30443 l!412)))))

(assert (=> b!1014716 d!120843))

(declare-fun b!1014883 () Bool)

(declare-fun e!570921 () Bool)

(declare-fun tp!70568 () Bool)

(assert (=> b!1014883 (= e!570921 (and tp_is_empty!23509 tp!70568))))

(assert (=> b!1014713 (= tp!70556 e!570921)))

(assert (= (and b!1014713 (is-Cons!21438 (t!30443 l!412))) b!1014883))

(declare-fun b_lambda!15375 () Bool)

(assert (= b_lambda!15371 (or b!1014718 b_lambda!15375)))

(declare-fun bs!29302 () Bool)

(declare-fun d!120847 () Bool)

(assert (= bs!29302 (and d!120847 b!1014718)))

(declare-datatypes ((Option!577 0))(
  ( (Some!576 (v!14427 B!1442)) (None!575) )
))
(declare-fun getValueByKey!526 (List!21442 (_ BitVec 64)) Option!577)

(assert (=> bs!29302 (= (dynLambda!1891 lambda!740 (h!22637 lt!448734)) (= (getValueByKey!526 (t!30443 l!412) (h!22637 lt!448734)) (Some!576 value!115)))))

(declare-fun m!937229 () Bool)

(assert (=> bs!29302 m!937229))

(assert (=> b!1014866 d!120847))

(push 1)

(assert (not bm!42868))

(assert (not d!120817))

(assert (not bs!29302))

(assert (not b!1014883))

(assert (not b!1014779))

(assert (not b!1014867))

(assert (not b!1014851))

(assert (not bm!42870))

(assert tp_is_empty!23509)

(assert (not bm!42869))

(assert (not b_lambda!15375))

(assert (not bm!42867))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

