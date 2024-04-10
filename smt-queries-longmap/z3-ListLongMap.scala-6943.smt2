; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87422 () Bool)

(assert start!87422)

(declare-fun b!1012867 () Bool)

(assert (=> b!1012867 true))

(assert (=> b!1012867 true))

(declare-fun b!1012865 () Bool)

(declare-datatypes ((Unit!33090 0))(
  ( (Unit!33091) )
))
(declare-fun e!569755 () Unit!33090)

(declare-fun Unit!33092 () Unit!33090)

(assert (=> b!1012865 (= e!569755 Unit!33092)))

(declare-fun b!1012866 () Bool)

(declare-fun e!569754 () Bool)

(declare-datatypes ((B!1366 0))(
  ( (B!1367 (val!11767 Int)) )
))
(declare-datatypes ((tuple2!15080 0))(
  ( (tuple2!15081 (_1!7551 (_ BitVec 64)) (_2!7551 B!1366)) )
))
(declare-datatypes ((List!21381 0))(
  ( (Nil!21378) (Cons!21377 (h!22575 tuple2!15080) (t!30382 List!21381)) )
))
(declare-fun l!412 () List!21381)

(declare-fun isStrictlySorted!547 (List!21381) Bool)

(assert (=> b!1012866 (= e!569754 (not (isStrictlySorted!547 (t!30382 l!412))))))

(declare-fun lt!447720 () Unit!33090)

(assert (=> b!1012866 (= lt!447720 e!569755)))

(declare-fun c!102354 () Bool)

(declare-datatypes ((List!21382 0))(
  ( (Nil!21379) (Cons!21378 (h!22576 (_ BitVec 64)) (t!30383 List!21382)) )
))
(declare-fun lt!447719 () List!21382)

(declare-fun isEmpty!805 (List!21382) Bool)

(assert (=> b!1012866 (= c!102354 (not (isEmpty!805 lt!447719)))))

(declare-fun value!115 () B!1366)

(declare-fun getKeysOf!29 (List!21381 B!1366) List!21382)

(assert (=> b!1012866 (= lt!447719 (getKeysOf!29 (t!30382 l!412) value!115))))

(declare-fun lt!447718 () Unit!33090)

(assert (=> b!1012867 (= e!569755 lt!447718)))

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!17 (List!21381 List!21382 B!1366 tuple2!15080) Unit!33090)

(assert (=> b!1012867 (= lt!447718 (lemmaForallGetValueByKeySameWithASmallerHead!17 (t!30382 l!412) lt!447719 value!115 (h!22575 l!412)))))

(declare-fun lambda!422 () Int)

(declare-fun forall!222 (List!21382 Int) Bool)

(assert (=> b!1012867 (forall!222 lt!447719 lambda!422)))

(declare-fun b!1012868 () Bool)

(declare-fun res!680192 () Bool)

(assert (=> b!1012868 (=> (not res!680192) (not e!569754))))

(get-info :version)

(assert (=> b!1012868 (= res!680192 (and (not (= (_2!7551 (h!22575 l!412)) value!115)) ((_ is Cons!21377) l!412)))))

(declare-fun b!1012869 () Bool)

(declare-fun e!569753 () Bool)

(declare-fun tp_is_empty!23433 () Bool)

(declare-fun tp!70349 () Bool)

(assert (=> b!1012869 (= e!569753 (and tp_is_empty!23433 tp!70349))))

(declare-fun res!680193 () Bool)

(assert (=> start!87422 (=> (not res!680193) (not e!569754))))

(assert (=> start!87422 (= res!680193 (isStrictlySorted!547 l!412))))

(assert (=> start!87422 e!569754))

(assert (=> start!87422 e!569753))

(assert (=> start!87422 tp_is_empty!23433))

(assert (= (and start!87422 res!680193) b!1012868))

(assert (= (and b!1012868 res!680192) b!1012866))

(assert (= (and b!1012866 c!102354) b!1012867))

(assert (= (and b!1012866 (not c!102354)) b!1012865))

(assert (= (and start!87422 ((_ is Cons!21377) l!412)) b!1012869))

(declare-fun m!936165 () Bool)

(assert (=> b!1012866 m!936165))

(declare-fun m!936167 () Bool)

(assert (=> b!1012866 m!936167))

(declare-fun m!936169 () Bool)

(assert (=> b!1012866 m!936169))

(declare-fun m!936171 () Bool)

(assert (=> b!1012867 m!936171))

(declare-fun m!936173 () Bool)

(assert (=> b!1012867 m!936173))

(declare-fun m!936175 () Bool)

(assert (=> start!87422 m!936175))

(check-sat (not b!1012869) tp_is_empty!23433 (not start!87422) (not b!1012867) (not b!1012866))
(check-sat)
(get-model)

(declare-fun d!120343 () Bool)

(declare-fun res!680204 () Bool)

(declare-fun e!569769 () Bool)

(assert (=> d!120343 (=> res!680204 e!569769)))

(assert (=> d!120343 (= res!680204 (or ((_ is Nil!21378) l!412) ((_ is Nil!21378) (t!30382 l!412))))))

(assert (=> d!120343 (= (isStrictlySorted!547 l!412) e!569769)))

(declare-fun b!1012897 () Bool)

(declare-fun e!569770 () Bool)

(assert (=> b!1012897 (= e!569769 e!569770)))

(declare-fun res!680205 () Bool)

(assert (=> b!1012897 (=> (not res!680205) (not e!569770))))

(assert (=> b!1012897 (= res!680205 (bvslt (_1!7551 (h!22575 l!412)) (_1!7551 (h!22575 (t!30382 l!412)))))))

(declare-fun b!1012898 () Bool)

(assert (=> b!1012898 (= e!569770 (isStrictlySorted!547 (t!30382 l!412)))))

(assert (= (and d!120343 (not res!680204)) b!1012897))

(assert (= (and b!1012897 res!680205) b!1012898))

(assert (=> b!1012898 m!936165))

(assert (=> start!87422 d!120343))

(declare-fun d!120349 () Bool)

(declare-fun res!680206 () Bool)

(declare-fun e!569771 () Bool)

(assert (=> d!120349 (=> res!680206 e!569771)))

(assert (=> d!120349 (= res!680206 (or ((_ is Nil!21378) (t!30382 l!412)) ((_ is Nil!21378) (t!30382 (t!30382 l!412)))))))

(assert (=> d!120349 (= (isStrictlySorted!547 (t!30382 l!412)) e!569771)))

(declare-fun b!1012899 () Bool)

(declare-fun e!569772 () Bool)

(assert (=> b!1012899 (= e!569771 e!569772)))

(declare-fun res!680207 () Bool)

(assert (=> b!1012899 (=> (not res!680207) (not e!569772))))

(assert (=> b!1012899 (= res!680207 (bvslt (_1!7551 (h!22575 (t!30382 l!412))) (_1!7551 (h!22575 (t!30382 (t!30382 l!412))))))))

(declare-fun b!1012900 () Bool)

(assert (=> b!1012900 (= e!569772 (isStrictlySorted!547 (t!30382 (t!30382 l!412))))))

(assert (= (and d!120349 (not res!680206)) b!1012899))

(assert (= (and b!1012899 res!680207) b!1012900))

(declare-fun m!936189 () Bool)

(assert (=> b!1012900 m!936189))

(assert (=> b!1012866 d!120349))

(declare-fun d!120351 () Bool)

(assert (=> d!120351 (= (isEmpty!805 lt!447719) ((_ is Nil!21379) lt!447719))))

(assert (=> b!1012866 d!120351))

(declare-fun bs!28848 () Bool)

(declare-fun b!1012966 () Bool)

(assert (= bs!28848 (and b!1012966 b!1012867)))

(declare-fun lambda!444 () Int)

(declare-fun lt!447807 () tuple2!15080)

(declare-fun lt!447810 () List!21381)

(assert (=> bs!28848 (= (= (Cons!21377 lt!447807 lt!447810) l!412) (= lambda!444 lambda!422))))

(assert (=> b!1012966 true))

(assert (=> b!1012966 true))

(assert (=> b!1012966 true))

(declare-fun bs!28849 () Bool)

(declare-fun b!1012964 () Bool)

(assert (= bs!28849 (and b!1012964 b!1012867)))

(declare-fun lt!447808 () tuple2!15080)

(declare-fun lambda!445 () Int)

(declare-fun lt!447813 () List!21381)

(assert (=> bs!28849 (= (= (Cons!21377 lt!447808 lt!447813) l!412) (= lambda!445 lambda!422))))

(declare-fun bs!28850 () Bool)

(assert (= bs!28850 (and b!1012964 b!1012966)))

(assert (=> bs!28850 (= (= (Cons!21377 lt!447808 lt!447813) (Cons!21377 lt!447807 lt!447810)) (= lambda!445 lambda!444))))

(assert (=> b!1012964 true))

(assert (=> b!1012964 true))

(assert (=> b!1012964 true))

(declare-fun bs!28853 () Bool)

(declare-fun d!120353 () Bool)

(assert (= bs!28853 (and d!120353 b!1012867)))

(declare-fun lambda!448 () Int)

(assert (=> bs!28853 (= (= (t!30382 l!412) l!412) (= lambda!448 lambda!422))))

(declare-fun bs!28854 () Bool)

(assert (= bs!28854 (and d!120353 b!1012966)))

(assert (=> bs!28854 (= (= (t!30382 l!412) (Cons!21377 lt!447807 lt!447810)) (= lambda!448 lambda!444))))

(declare-fun bs!28856 () Bool)

(assert (= bs!28856 (and d!120353 b!1012964)))

(assert (=> bs!28856 (= (= (t!30382 l!412) (Cons!21377 lt!447808 lt!447813)) (= lambda!448 lambda!445))))

(assert (=> d!120353 true))

(assert (=> d!120353 true))

(declare-fun bm!42607 () Bool)

(declare-fun call!42613 () List!21382)

(assert (=> bm!42607 (= call!42613 (getKeysOf!29 (t!30382 (t!30382 l!412)) value!115))))

(declare-fun bm!42608 () Bool)

(declare-fun call!42612 () Bool)

(assert (=> bm!42608 (= call!42612 (isEmpty!805 call!42613))))

(declare-fun b!1012963 () Bool)

(declare-fun e!569811 () List!21382)

(assert (=> b!1012963 (= e!569811 (Cons!21378 (_1!7551 (h!22575 (t!30382 l!412))) call!42613))))

(declare-fun c!102384 () Bool)

(assert (=> b!1012963 (= c!102384 (not call!42612))))

(declare-fun lt!447802 () Unit!33090)

(declare-fun e!569812 () Unit!33090)

(assert (=> b!1012963 (= lt!447802 e!569812)))

(declare-fun e!569814 () Unit!33090)

(declare-fun lt!447805 () Unit!33090)

(assert (=> b!1012964 (= e!569814 lt!447805)))

(assert (=> b!1012964 (= lt!447813 (t!30382 (t!30382 l!412)))))

(declare-fun lt!447804 () List!21382)

(assert (=> b!1012964 (= lt!447804 call!42613)))

(assert (=> b!1012964 (= lt!447808 (h!22575 (t!30382 l!412)))))

(declare-fun call!42610 () Unit!33090)

(assert (=> b!1012964 (= lt!447805 call!42610)))

(declare-fun call!42611 () Bool)

(assert (=> b!1012964 call!42611))

(declare-fun b!1012965 () Bool)

(declare-fun lt!447806 () Unit!33090)

(assert (=> b!1012965 (= lt!447806 e!569814)))

(declare-fun c!102385 () Bool)

(assert (=> b!1012965 (= c!102385 (not call!42612))))

(declare-fun lt!447812 () List!21382)

(assert (=> b!1012965 (= lt!447812 call!42613)))

(declare-fun e!569813 () List!21382)

(assert (=> b!1012965 (= e!569813 call!42613)))

(declare-fun lt!447803 () List!21382)

(declare-fun c!102382 () Bool)

(declare-fun bm!42609 () Bool)

(assert (=> bm!42609 (= call!42610 (lemmaForallGetValueByKeySameWithASmallerHead!17 (ite c!102382 lt!447810 lt!447813) (ite c!102382 lt!447803 lt!447804) value!115 (ite c!102382 lt!447807 lt!447808)))))

(assert (=> b!1012966 call!42611))

(declare-fun lt!447811 () Unit!33090)

(assert (=> b!1012966 (= lt!447811 call!42610)))

(assert (=> b!1012966 (= lt!447807 (h!22575 (t!30382 l!412)))))

(assert (=> b!1012966 (= lt!447803 call!42613)))

(assert (=> b!1012966 (= lt!447810 (t!30382 (t!30382 l!412)))))

(assert (=> b!1012966 (= e!569812 lt!447811)))

(declare-fun lt!447809 () List!21382)

(assert (=> d!120353 (forall!222 lt!447809 lambda!448)))

(assert (=> d!120353 (= lt!447809 e!569811)))

(assert (=> d!120353 (= c!102382 (and ((_ is Cons!21377) (t!30382 l!412)) (= (_2!7551 (h!22575 (t!30382 l!412))) value!115)))))

(assert (=> d!120353 (isStrictlySorted!547 (t!30382 l!412))))

(assert (=> d!120353 (= (getKeysOf!29 (t!30382 l!412) value!115) lt!447809)))

(declare-fun b!1012967 () Bool)

(assert (=> b!1012967 (= e!569813 Nil!21379)))

(declare-fun b!1012968 () Bool)

(declare-fun Unit!33098 () Unit!33090)

(assert (=> b!1012968 (= e!569812 Unit!33098)))

(declare-fun b!1012969 () Bool)

(declare-fun Unit!33099 () Unit!33090)

(assert (=> b!1012969 (= e!569814 Unit!33099)))

(declare-fun b!1012970 () Bool)

(assert (=> b!1012970 (= e!569811 e!569813)))

(declare-fun c!102383 () Bool)

(assert (=> b!1012970 (= c!102383 (and ((_ is Cons!21377) (t!30382 l!412)) (not (= (_2!7551 (h!22575 (t!30382 l!412))) value!115))))))

(declare-fun bm!42610 () Bool)

(assert (=> bm!42610 (= call!42611 (forall!222 (ite c!102382 lt!447803 lt!447804) (ite c!102382 lambda!444 lambda!445)))))

(assert (= (and d!120353 c!102382) b!1012963))

(assert (= (and d!120353 (not c!102382)) b!1012970))

(assert (= (and b!1012963 c!102384) b!1012966))

(assert (= (and b!1012963 (not c!102384)) b!1012968))

(assert (= (and b!1012970 c!102383) b!1012965))

(assert (= (and b!1012970 (not c!102383)) b!1012967))

(assert (= (and b!1012965 c!102385) b!1012964))

(assert (= (and b!1012965 (not c!102385)) b!1012969))

(assert (= (or b!1012966 b!1012964) bm!42609))

(assert (= (or b!1012966 b!1012964) bm!42610))

(assert (= (or b!1012963 b!1012966 b!1012964 b!1012965) bm!42607))

(assert (= (or b!1012963 b!1012965) bm!42608))

(declare-fun m!936195 () Bool)

(assert (=> bm!42609 m!936195))

(declare-fun m!936197 () Bool)

(assert (=> bm!42607 m!936197))

(declare-fun m!936199 () Bool)

(assert (=> bm!42610 m!936199))

(declare-fun m!936201 () Bool)

(assert (=> bm!42608 m!936201))

(declare-fun m!936203 () Bool)

(assert (=> d!120353 m!936203))

(assert (=> d!120353 m!936165))

(assert (=> b!1012866 d!120353))

(declare-fun bs!28866 () Bool)

(declare-fun b!1013012 () Bool)

(assert (= bs!28866 (and b!1013012 b!1012867)))

(declare-fun lambda!465 () Int)

(assert (=> bs!28866 (= (= (t!30382 l!412) l!412) (= lambda!465 lambda!422))))

(declare-fun bs!28867 () Bool)

(assert (= bs!28867 (and b!1013012 b!1012966)))

(assert (=> bs!28867 (= (= (t!30382 l!412) (Cons!21377 lt!447807 lt!447810)) (= lambda!465 lambda!444))))

(declare-fun bs!28868 () Bool)

(assert (= bs!28868 (and b!1013012 b!1012964)))

(assert (=> bs!28868 (= (= (t!30382 l!412) (Cons!21377 lt!447808 lt!447813)) (= lambda!465 lambda!445))))

(declare-fun bs!28869 () Bool)

(assert (= bs!28869 (and b!1013012 d!120353)))

(assert (=> bs!28869 (= lambda!465 lambda!448)))

(assert (=> b!1013012 true))

(assert (=> b!1013012 true))

(declare-fun bs!28878 () Bool)

(declare-fun d!120365 () Bool)

(assert (= bs!28878 (and d!120365 b!1012966)))

(declare-fun lambda!468 () Int)

(assert (=> bs!28878 (= (= (Cons!21377 (h!22575 l!412) (t!30382 l!412)) (Cons!21377 lt!447807 lt!447810)) (= lambda!468 lambda!444))))

(declare-fun bs!28879 () Bool)

(assert (= bs!28879 (and d!120365 d!120353)))

(assert (=> bs!28879 (= (= (Cons!21377 (h!22575 l!412) (t!30382 l!412)) (t!30382 l!412)) (= lambda!468 lambda!448))))

(declare-fun bs!28880 () Bool)

(assert (= bs!28880 (and d!120365 b!1013012)))

(assert (=> bs!28880 (= (= (Cons!21377 (h!22575 l!412) (t!30382 l!412)) (t!30382 l!412)) (= lambda!468 lambda!465))))

(declare-fun bs!28881 () Bool)

(assert (= bs!28881 (and d!120365 b!1012867)))

(assert (=> bs!28881 (= (= (Cons!21377 (h!22575 l!412) (t!30382 l!412)) l!412) (= lambda!468 lambda!422))))

(declare-fun bs!28882 () Bool)

(assert (= bs!28882 (and d!120365 b!1012964)))

(assert (=> bs!28882 (= (= (Cons!21377 (h!22575 l!412) (t!30382 l!412)) (Cons!21377 lt!447808 lt!447813)) (= lambda!468 lambda!445))))

(assert (=> d!120365 true))

(assert (=> d!120365 true))

(assert (=> d!120365 true))

(assert (=> d!120365 (forall!222 lt!447719 lambda!468)))

(declare-fun lt!447844 () Unit!33090)

(declare-fun choose!1627 (List!21381 List!21382 B!1366 tuple2!15080) Unit!33090)

(assert (=> d!120365 (= lt!447844 (choose!1627 (t!30382 l!412) lt!447719 value!115 (h!22575 l!412)))))

(declare-fun e!569829 () Bool)

(assert (=> d!120365 e!569829))

(declare-fun res!680241 () Bool)

(assert (=> d!120365 (=> (not res!680241) (not e!569829))))

(assert (=> d!120365 (= res!680241 (isStrictlySorted!547 (t!30382 l!412)))))

(assert (=> d!120365 (= (lemmaForallGetValueByKeySameWithASmallerHead!17 (t!30382 l!412) lt!447719 value!115 (h!22575 l!412)) lt!447844)))

(declare-fun b!1013011 () Bool)

(declare-fun res!680242 () Bool)

(assert (=> b!1013011 (=> (not res!680242) (not e!569829))))

(declare-fun isEmpty!808 (List!21381) Bool)

(assert (=> b!1013011 (= res!680242 (not (isEmpty!808 (t!30382 l!412))))))

(declare-fun res!680240 () Bool)

(assert (=> b!1013012 (=> (not res!680240) (not e!569829))))

(assert (=> b!1013012 (= res!680240 (forall!222 lt!447719 lambda!465))))

(declare-fun b!1013013 () Bool)

(declare-fun head!930 (List!21381) tuple2!15080)

(assert (=> b!1013013 (= e!569829 (bvslt (_1!7551 (h!22575 l!412)) (_1!7551 (head!930 (t!30382 l!412)))))))

(assert (= (and d!120365 res!680241) b!1013011))

(assert (= (and b!1013011 res!680242) b!1013012))

(assert (= (and b!1013012 res!680240) b!1013013))

(declare-fun m!936225 () Bool)

(assert (=> d!120365 m!936225))

(declare-fun m!936227 () Bool)

(assert (=> d!120365 m!936227))

(assert (=> d!120365 m!936165))

(declare-fun m!936229 () Bool)

(assert (=> b!1013011 m!936229))

(declare-fun m!936231 () Bool)

(assert (=> b!1013012 m!936231))

(declare-fun m!936233 () Bool)

(assert (=> b!1013013 m!936233))

(assert (=> b!1012867 d!120365))

(declare-fun d!120371 () Bool)

(declare-fun res!680261 () Bool)

(declare-fun e!569844 () Bool)

(assert (=> d!120371 (=> res!680261 e!569844)))

(assert (=> d!120371 (= res!680261 ((_ is Nil!21379) lt!447719))))

(assert (=> d!120371 (= (forall!222 lt!447719 lambda!422) e!569844)))

(declare-fun b!1013032 () Bool)

(declare-fun e!569845 () Bool)

(assert (=> b!1013032 (= e!569844 e!569845)))

(declare-fun res!680262 () Bool)

(assert (=> b!1013032 (=> (not res!680262) (not e!569845))))

(declare-fun dynLambda!1882 (Int (_ BitVec 64)) Bool)

(assert (=> b!1013032 (= res!680262 (dynLambda!1882 lambda!422 (h!22576 lt!447719)))))

(declare-fun b!1013033 () Bool)

(assert (=> b!1013033 (= e!569845 (forall!222 (t!30383 lt!447719) lambda!422))))

(assert (= (and d!120371 (not res!680261)) b!1013032))

(assert (= (and b!1013032 res!680262) b!1013033))

(declare-fun b_lambda!15241 () Bool)

(assert (=> (not b_lambda!15241) (not b!1013032)))

(declare-fun m!936255 () Bool)

(assert (=> b!1013032 m!936255))

(declare-fun m!936257 () Bool)

(assert (=> b!1013033 m!936257))

(assert (=> b!1012867 d!120371))

(declare-fun b!1013042 () Bool)

(declare-fun e!569852 () Bool)

(declare-fun tp!70355 () Bool)

(assert (=> b!1013042 (= e!569852 (and tp_is_empty!23433 tp!70355))))

(assert (=> b!1012869 (= tp!70349 e!569852)))

(assert (= (and b!1012869 ((_ is Cons!21377) (t!30382 l!412))) b!1013042))

(declare-fun b_lambda!15247 () Bool)

(assert (= b_lambda!15241 (or b!1012867 b_lambda!15247)))

(declare-fun bs!28893 () Bool)

(declare-fun d!120379 () Bool)

(assert (= bs!28893 (and d!120379 b!1012867)))

(declare-datatypes ((Option!569 0))(
  ( (Some!568 (v!14419 B!1366)) (None!567) )
))
(declare-fun getValueByKey!518 (List!21381 (_ BitVec 64)) Option!569)

(assert (=> bs!28893 (= (dynLambda!1882 lambda!422 (h!22576 lt!447719)) (= (getValueByKey!518 l!412 (h!22576 lt!447719)) (Some!568 value!115)))))

(declare-fun m!936267 () Bool)

(assert (=> bs!28893 m!936267))

(assert (=> b!1013032 d!120379))

(check-sat (not b_lambda!15247) (not b!1013033) (not bm!42609) (not bm!42607) (not b!1013012) tp_is_empty!23433 (not b!1013013) (not bs!28893) (not d!120353) (not b!1013042) (not b!1013011) (not bm!42608) (not d!120365) (not bm!42610) (not b!1012900) (not b!1012898))
(check-sat)
