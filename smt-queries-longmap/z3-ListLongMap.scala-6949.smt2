; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87510 () Bool)

(assert start!87510)

(declare-fun b!1013164 () Bool)

(declare-fun e!569944 () Bool)

(declare-fun tp_is_empty!23467 () Bool)

(declare-fun tp!70428 () Bool)

(assert (=> b!1013164 (= e!569944 (and tp_is_empty!23467 tp!70428))))

(declare-fun b!1013162 () Bool)

(declare-fun res!680296 () Bool)

(declare-fun e!569945 () Bool)

(assert (=> b!1013162 (=> (not res!680296) (not e!569945))))

(declare-datatypes ((B!1400 0))(
  ( (B!1401 (val!11784 Int)) )
))
(declare-datatypes ((tuple2!15194 0))(
  ( (tuple2!15195 (_1!7608 (_ BitVec 64)) (_2!7608 B!1400)) )
))
(declare-datatypes ((List!21438 0))(
  ( (Nil!21435) (Cons!21434 (h!22632 tuple2!15194) (t!30430 List!21438)) )
))
(declare-fun l!412 () List!21438)

(declare-fun value!115 () B!1400)

(declare-datatypes ((List!21439 0))(
  ( (Nil!21436) (Cons!21435 (h!22633 (_ BitVec 64)) (t!30431 List!21439)) )
))
(declare-fun isEmpty!818 (List!21439) Bool)

(declare-fun getKeysOf!34 (List!21438 B!1400) List!21439)

(assert (=> b!1013162 (= res!680296 (not (isEmpty!818 (getKeysOf!34 (t!30430 l!412) value!115))))))

(declare-fun b!1013163 () Bool)

(declare-fun ListPrimitiveSize!103 (List!21438) Int)

(assert (=> b!1013163 (= e!569945 (>= (ListPrimitiveSize!103 (t!30430 l!412)) (ListPrimitiveSize!103 l!412)))))

(declare-fun b!1013161 () Bool)

(declare-fun res!680295 () Bool)

(assert (=> b!1013161 (=> (not res!680295) (not e!569945))))

(get-info :version)

(assert (=> b!1013161 (= res!680295 (and ((_ is Cons!21434) l!412) (= (_2!7608 (h!22632 l!412)) value!115)))))

(declare-fun res!680297 () Bool)

(assert (=> start!87510 (=> (not res!680297) (not e!569945))))

(declare-fun isStrictlySorted!554 (List!21438) Bool)

(assert (=> start!87510 (= res!680297 (isStrictlySorted!554 l!412))))

(assert (=> start!87510 e!569945))

(assert (=> start!87510 e!569944))

(assert (=> start!87510 tp_is_empty!23467))

(assert (= (and start!87510 res!680297) b!1013161))

(assert (= (and b!1013161 res!680295) b!1013162))

(assert (= (and b!1013162 res!680296) b!1013163))

(assert (= (and start!87510 ((_ is Cons!21434) l!412)) b!1013164))

(declare-fun m!935749 () Bool)

(assert (=> b!1013162 m!935749))

(assert (=> b!1013162 m!935749))

(declare-fun m!935751 () Bool)

(assert (=> b!1013162 m!935751))

(declare-fun m!935753 () Bool)

(assert (=> b!1013163 m!935753))

(declare-fun m!935755 () Bool)

(assert (=> b!1013163 m!935755))

(declare-fun m!935757 () Bool)

(assert (=> start!87510 m!935757))

(check-sat (not b!1013162) tp_is_empty!23467 (not b!1013164) (not start!87510) (not b!1013163))
(check-sat)
(get-model)

(declare-fun d!120289 () Bool)

(declare-fun res!680320 () Bool)

(declare-fun e!569965 () Bool)

(assert (=> d!120289 (=> res!680320 e!569965)))

(assert (=> d!120289 (= res!680320 (or ((_ is Nil!21435) l!412) ((_ is Nil!21435) (t!30430 l!412))))))

(assert (=> d!120289 (= (isStrictlySorted!554 l!412) e!569965)))

(declare-fun b!1013199 () Bool)

(declare-fun e!569966 () Bool)

(assert (=> b!1013199 (= e!569965 e!569966)))

(declare-fun res!680321 () Bool)

(assert (=> b!1013199 (=> (not res!680321) (not e!569966))))

(assert (=> b!1013199 (= res!680321 (bvslt (_1!7608 (h!22632 l!412)) (_1!7608 (h!22632 (t!30430 l!412)))))))

(declare-fun b!1013200 () Bool)

(assert (=> b!1013200 (= e!569966 (isStrictlySorted!554 (t!30430 l!412)))))

(assert (= (and d!120289 (not res!680320)) b!1013199))

(assert (= (and b!1013199 res!680321) b!1013200))

(declare-fun m!935781 () Bool)

(assert (=> b!1013200 m!935781))

(assert (=> start!87510 d!120289))

(declare-fun d!120299 () Bool)

(declare-fun lt!447701 () Int)

(assert (=> d!120299 (>= lt!447701 0)))

(declare-fun e!569970 () Int)

(assert (=> d!120299 (= lt!447701 e!569970)))

(declare-fun c!102398 () Bool)

(assert (=> d!120299 (= c!102398 ((_ is Nil!21435) (t!30430 l!412)))))

(assert (=> d!120299 (= (ListPrimitiveSize!103 (t!30430 l!412)) lt!447701)))

(declare-fun b!1013207 () Bool)

(assert (=> b!1013207 (= e!569970 0)))

(declare-fun b!1013208 () Bool)

(assert (=> b!1013208 (= e!569970 (+ 1 (ListPrimitiveSize!103 (t!30430 (t!30430 l!412)))))))

(assert (= (and d!120299 c!102398) b!1013207))

(assert (= (and d!120299 (not c!102398)) b!1013208))

(declare-fun m!935783 () Bool)

(assert (=> b!1013208 m!935783))

(assert (=> b!1013163 d!120299))

(declare-fun d!120305 () Bool)

(declare-fun lt!447702 () Int)

(assert (=> d!120305 (>= lt!447702 0)))

(declare-fun e!569971 () Int)

(assert (=> d!120305 (= lt!447702 e!569971)))

(declare-fun c!102399 () Bool)

(assert (=> d!120305 (= c!102399 ((_ is Nil!21435) l!412))))

(assert (=> d!120305 (= (ListPrimitiveSize!103 l!412) lt!447702)))

(declare-fun b!1013209 () Bool)

(assert (=> b!1013209 (= e!569971 0)))

(declare-fun b!1013210 () Bool)

(assert (=> b!1013210 (= e!569971 (+ 1 (ListPrimitiveSize!103 (t!30430 l!412))))))

(assert (= (and d!120305 c!102399) b!1013209))

(assert (= (and d!120305 (not c!102399)) b!1013210))

(assert (=> b!1013210 m!935753))

(assert (=> b!1013163 d!120305))

(declare-fun d!120307 () Bool)

(assert (=> d!120307 (= (isEmpty!818 (getKeysOf!34 (t!30430 l!412) value!115)) ((_ is Nil!21436) (getKeysOf!34 (t!30430 l!412) value!115)))))

(assert (=> b!1013162 d!120307))

(declare-fun b!1013291 () Bool)

(assert (=> b!1013291 true))

(assert (=> b!1013291 true))

(assert (=> b!1013291 true))

(declare-fun bs!28891 () Bool)

(declare-fun b!1013294 () Bool)

(assert (= bs!28891 (and b!1013294 b!1013291)))

(declare-fun lambda!502 () Int)

(declare-fun lt!447809 () List!21438)

(declare-fun lt!447807 () tuple2!15194)

(declare-fun lt!447799 () tuple2!15194)

(declare-fun lt!447804 () List!21438)

(declare-fun lambda!505 () Int)

(assert (=> bs!28891 (= (= (Cons!21434 lt!447799 lt!447804) (Cons!21434 lt!447807 lt!447809)) (= lambda!505 lambda!502))))

(assert (=> b!1013294 true))

(assert (=> b!1013294 true))

(assert (=> b!1013294 true))

(declare-fun bs!28892 () Bool)

(declare-fun d!120309 () Bool)

(assert (= bs!28892 (and d!120309 b!1013291)))

(declare-fun lambda!506 () Int)

(assert (=> bs!28892 (= (= (t!30430 l!412) (Cons!21434 lt!447807 lt!447809)) (= lambda!506 lambda!502))))

(declare-fun bs!28893 () Bool)

(assert (= bs!28893 (and d!120309 b!1013294)))

(assert (=> bs!28893 (= (= (t!30430 l!412) (Cons!21434 lt!447799 lt!447804)) (= lambda!506 lambda!505))))

(assert (=> d!120309 true))

(assert (=> d!120309 true))

(declare-fun b!1013287 () Bool)

(declare-datatypes ((Unit!33004 0))(
  ( (Unit!33005) )
))
(declare-fun e!570004 () Unit!33004)

(declare-fun Unit!33006 () Unit!33004)

(assert (=> b!1013287 (= e!570004 Unit!33006)))

(declare-fun b!1013288 () Bool)

(declare-fun e!570006 () List!21439)

(declare-fun e!570007 () List!21439)

(assert (=> b!1013288 (= e!570006 e!570007)))

(declare-fun c!102435 () Bool)

(assert (=> b!1013288 (= c!102435 (and ((_ is Cons!21434) (t!30430 l!412)) (not (= (_2!7608 (h!22632 (t!30430 l!412))) value!115))))))

(declare-fun bm!42628 () Bool)

(declare-fun call!42631 () Bool)

(declare-fun call!42632 () List!21439)

(assert (=> bm!42628 (= call!42631 (isEmpty!818 call!42632))))

(declare-fun b!1013290 () Bool)

(assert (=> b!1013290 (= e!570007 Nil!21436)))

(declare-fun bm!42629 () Bool)

(assert (=> bm!42629 (= call!42632 (getKeysOf!34 (t!30430 (t!30430 l!412)) value!115))))

(declare-fun call!42634 () Bool)

(assert (=> b!1013291 call!42634))

(declare-fun lt!447800 () Unit!33004)

(declare-fun call!42633 () Unit!33004)

(assert (=> b!1013291 (= lt!447800 call!42633)))

(assert (=> b!1013291 (= lt!447807 (h!22632 (t!30430 l!412)))))

(declare-fun lt!447810 () List!21439)

(assert (=> b!1013291 (= lt!447810 call!42632)))

(assert (=> b!1013291 (= lt!447809 (t!30430 (t!30430 l!412)))))

(assert (=> b!1013291 (= e!570004 lt!447800)))

(declare-fun bm!42630 () Bool)

(declare-fun c!102434 () Bool)

(declare-fun lt!447803 () List!21439)

(declare-fun forall!232 (List!21439 Int) Bool)

(assert (=> bm!42630 (= call!42634 (forall!232 (ite c!102434 lt!447810 lt!447803) (ite c!102434 lambda!502 lambda!505)))))

(declare-fun b!1013292 () Bool)

(declare-fun e!570005 () Unit!33004)

(declare-fun Unit!33007 () Unit!33004)

(assert (=> b!1013292 (= e!570005 Unit!33007)))

(declare-fun b!1013293 () Bool)

(assert (=> b!1013293 (= e!570006 (Cons!21435 (_1!7608 (h!22632 (t!30430 l!412))) call!42632))))

(declare-fun c!102433 () Bool)

(assert (=> b!1013293 (= c!102433 (not call!42631))))

(declare-fun lt!447801 () Unit!33004)

(assert (=> b!1013293 (= lt!447801 e!570004)))

(declare-fun lt!447806 () Unit!33004)

(assert (=> b!1013294 (= e!570005 lt!447806)))

(assert (=> b!1013294 (= lt!447804 (t!30430 (t!30430 l!412)))))

(assert (=> b!1013294 (= lt!447803 call!42632)))

(assert (=> b!1013294 (= lt!447799 (h!22632 (t!30430 l!412)))))

(assert (=> b!1013294 (= lt!447806 call!42633)))

(assert (=> b!1013294 call!42634))

(declare-fun bm!42631 () Bool)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!27 (List!21438 List!21439 B!1400 tuple2!15194) Unit!33004)

(assert (=> bm!42631 (= call!42633 (lemmaForallGetValueByKeySameWithASmallerHead!27 (ite c!102434 lt!447809 lt!447804) (ite c!102434 lt!447810 lt!447803) value!115 (ite c!102434 lt!447807 lt!447799)))))

(declare-fun lt!447808 () List!21439)

(assert (=> d!120309 (forall!232 lt!447808 lambda!506)))

(assert (=> d!120309 (= lt!447808 e!570006)))

(assert (=> d!120309 (= c!102434 (and ((_ is Cons!21434) (t!30430 l!412)) (= (_2!7608 (h!22632 (t!30430 l!412))) value!115)))))

(assert (=> d!120309 (isStrictlySorted!554 (t!30430 l!412))))

(assert (=> d!120309 (= (getKeysOf!34 (t!30430 l!412) value!115) lt!447808)))

(declare-fun b!1013289 () Bool)

(declare-fun lt!447802 () Unit!33004)

(assert (=> b!1013289 (= lt!447802 e!570005)))

(declare-fun c!102432 () Bool)

(assert (=> b!1013289 (= c!102432 (not call!42631))))

(declare-fun lt!447805 () List!21439)

(assert (=> b!1013289 (= lt!447805 call!42632)))

(assert (=> b!1013289 (= e!570007 call!42632)))

(assert (= (and d!120309 c!102434) b!1013293))

(assert (= (and d!120309 (not c!102434)) b!1013288))

(assert (= (and b!1013293 c!102433) b!1013291))

(assert (= (and b!1013293 (not c!102433)) b!1013287))

(assert (= (and b!1013288 c!102435) b!1013289))

(assert (= (and b!1013288 (not c!102435)) b!1013290))

(assert (= (and b!1013289 c!102432) b!1013294))

(assert (= (and b!1013289 (not c!102432)) b!1013292))

(assert (= (or b!1013291 b!1013294) bm!42631))

(assert (= (or b!1013291 b!1013294) bm!42630))

(assert (= (or b!1013293 b!1013291 b!1013294 b!1013289) bm!42629))

(assert (= (or b!1013293 b!1013289) bm!42628))

(declare-fun m!935809 () Bool)

(assert (=> bm!42631 m!935809))

(declare-fun m!935811 () Bool)

(assert (=> bm!42628 m!935811))

(declare-fun m!935813 () Bool)

(assert (=> bm!42629 m!935813))

(declare-fun m!935815 () Bool)

(assert (=> bm!42630 m!935815))

(declare-fun m!935817 () Bool)

(assert (=> d!120309 m!935817))

(assert (=> d!120309 m!935781))

(assert (=> b!1013162 d!120309))

(declare-fun b!1013317 () Bool)

(declare-fun e!570022 () Bool)

(declare-fun tp!70437 () Bool)

(assert (=> b!1013317 (= e!570022 (and tp_is_empty!23467 tp!70437))))

(assert (=> b!1013164 (= tp!70428 e!570022)))

(assert (= (and b!1013164 ((_ is Cons!21434) (t!30430 l!412))) b!1013317))

(check-sat (not b!1013208) tp_is_empty!23467 (not d!120309) (not bm!42630) (not b!1013317) (not bm!42629) (not b!1013210) (not bm!42631) (not b!1013200) (not bm!42628))
(check-sat)
