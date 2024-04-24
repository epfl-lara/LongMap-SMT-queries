; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87748 () Bool)

(assert start!87748)

(declare-fun b!1014626 () Bool)

(declare-fun res!680874 () Bool)

(declare-fun e!570878 () Bool)

(assert (=> b!1014626 (=> (not res!680874) (not e!570878))))

(declare-datatypes ((B!1400 0))(
  ( (B!1401 (val!11784 Int)) )
))
(declare-datatypes ((tuple2!15118 0))(
  ( (tuple2!15119 (_1!7570 (_ BitVec 64)) (_2!7570 B!1400)) )
))
(declare-datatypes ((List!21392 0))(
  ( (Nil!21389) (Cons!21388 (h!22595 tuple2!15118) (t!30385 List!21392)) )
))
(declare-fun l!412 () List!21392)

(declare-fun value!115 () B!1400)

(declare-datatypes ((List!21393 0))(
  ( (Nil!21390) (Cons!21389 (h!22596 (_ BitVec 64)) (t!30386 List!21393)) )
))
(declare-fun isEmpty!817 (List!21393) Bool)

(declare-fun getKeysOf!34 (List!21392 B!1400) List!21393)

(assert (=> b!1014626 (= res!680874 (not (isEmpty!817 (getKeysOf!34 (t!30385 l!412) value!115))))))

(declare-fun b!1014627 () Bool)

(declare-fun ListPrimitiveSize!103 (List!21392) Int)

(assert (=> b!1014627 (= e!570878 (>= (ListPrimitiveSize!103 (t!30385 l!412)) (ListPrimitiveSize!103 l!412)))))

(declare-fun res!680876 () Bool)

(assert (=> start!87748 (=> (not res!680876) (not e!570878))))

(declare-fun isStrictlySorted!546 (List!21392) Bool)

(assert (=> start!87748 (= res!680876 (isStrictlySorted!546 l!412))))

(assert (=> start!87748 e!570878))

(declare-fun e!570879 () Bool)

(assert (=> start!87748 e!570879))

(declare-fun tp_is_empty!23467 () Bool)

(assert (=> start!87748 tp_is_empty!23467))

(declare-fun b!1014625 () Bool)

(declare-fun res!680875 () Bool)

(assert (=> b!1014625 (=> (not res!680875) (not e!570878))))

(get-info :version)

(assert (=> b!1014625 (= res!680875 (and ((_ is Cons!21388) l!412) (= (_2!7570 (h!22595 l!412)) value!115)))))

(declare-fun b!1014628 () Bool)

(declare-fun tp!70428 () Bool)

(assert (=> b!1014628 (= e!570879 (and tp_is_empty!23467 tp!70428))))

(assert (= (and start!87748 res!680876) b!1014625))

(assert (= (and b!1014625 res!680875) b!1014626))

(assert (= (and b!1014626 res!680874) b!1014627))

(assert (= (and start!87748 ((_ is Cons!21388) l!412)) b!1014628))

(declare-fun m!938033 () Bool)

(assert (=> b!1014626 m!938033))

(assert (=> b!1014626 m!938033))

(declare-fun m!938035 () Bool)

(assert (=> b!1014626 m!938035))

(declare-fun m!938037 () Bool)

(assert (=> b!1014627 m!938037))

(declare-fun m!938039 () Bool)

(assert (=> b!1014627 m!938039))

(declare-fun m!938041 () Bool)

(assert (=> start!87748 m!938041))

(check-sat (not b!1014627) (not b!1014626) tp_is_empty!23467 (not b!1014628) (not start!87748))
(check-sat)
(get-model)

(declare-fun d!120903 () Bool)

(assert (=> d!120903 (= (isEmpty!817 (getKeysOf!34 (t!30385 l!412) value!115)) ((_ is Nil!21390) (getKeysOf!34 (t!30385 l!412) value!115)))))

(assert (=> b!1014626 d!120903))

(declare-fun b!1014723 () Bool)

(assert (=> b!1014723 true))

(assert (=> b!1014723 true))

(assert (=> b!1014723 true))

(declare-fun bs!28934 () Bool)

(declare-fun b!1014722 () Bool)

(assert (= bs!28934 (and b!1014722 b!1014723)))

(declare-fun lt!448487 () tuple2!15118)

(declare-fun lt!448493 () List!21392)

(declare-fun lambda!497 () Int)

(declare-fun lt!448490 () tuple2!15118)

(declare-fun lambda!499 () Int)

(declare-fun lt!448488 () List!21392)

(assert (=> bs!28934 (= (= (Cons!21388 lt!448487 lt!448488) (Cons!21388 lt!448490 lt!448493)) (= lambda!499 lambda!497))))

(assert (=> b!1014722 true))

(assert (=> b!1014722 true))

(assert (=> b!1014722 true))

(declare-fun bs!28935 () Bool)

(declare-fun d!120905 () Bool)

(assert (= bs!28935 (and d!120905 b!1014723)))

(declare-fun lambda!500 () Int)

(assert (=> bs!28935 (= (= (t!30385 l!412) (Cons!21388 lt!448490 lt!448493)) (= lambda!500 lambda!497))))

(declare-fun bs!28936 () Bool)

(assert (= bs!28936 (and d!120905 b!1014722)))

(assert (=> bs!28936 (= (= (t!30385 l!412) (Cons!21388 lt!448487 lt!448488)) (= lambda!500 lambda!499))))

(assert (=> d!120905 true))

(assert (=> d!120905 true))

(declare-fun b!1014721 () Bool)

(declare-datatypes ((Unit!33109 0))(
  ( (Unit!33110) )
))
(declare-fun lt!448496 () Unit!33109)

(declare-fun e!570935 () Unit!33109)

(assert (=> b!1014721 (= lt!448496 e!570935)))

(declare-fun c!102868 () Bool)

(declare-fun call!42714 () Bool)

(assert (=> b!1014721 (= c!102868 (not call!42714))))

(declare-fun lt!448486 () List!21393)

(declare-fun call!42715 () List!21393)

(assert (=> b!1014721 (= lt!448486 call!42715)))

(declare-fun e!570932 () List!21393)

(assert (=> b!1014721 (= e!570932 call!42715)))

(declare-fun lt!448492 () Unit!33109)

(assert (=> b!1014722 (= e!570935 lt!448492)))

(assert (=> b!1014722 (= lt!448488 (t!30385 (t!30385 l!412)))))

(declare-fun lt!448489 () List!21393)

(assert (=> b!1014722 (= lt!448489 call!42715)))

(assert (=> b!1014722 (= lt!448487 (h!22595 (t!30385 l!412)))))

(declare-fun call!42716 () Unit!33109)

(assert (=> b!1014722 (= lt!448492 call!42716)))

(declare-fun call!42713 () Bool)

(assert (=> b!1014722 call!42713))

(assert (=> b!1014723 call!42713))

(declare-fun lt!448494 () Unit!33109)

(assert (=> b!1014723 (= lt!448494 call!42716)))

(assert (=> b!1014723 (= lt!448490 (h!22595 (t!30385 l!412)))))

(declare-fun lt!448491 () List!21393)

(assert (=> b!1014723 (= lt!448491 call!42715)))

(assert (=> b!1014723 (= lt!448493 (t!30385 (t!30385 l!412)))))

(declare-fun e!570933 () Unit!33109)

(assert (=> b!1014723 (= e!570933 lt!448494)))

(declare-fun bm!42710 () Bool)

(declare-fun c!102869 () Bool)

(declare-fun forall!228 (List!21393 Int) Bool)

(assert (=> bm!42710 (= call!42713 (forall!228 (ite c!102869 lt!448491 lt!448489) (ite c!102869 lambda!497 lambda!499)))))

(declare-fun bm!42711 () Bool)

(assert (=> bm!42711 (= call!42715 (getKeysOf!34 (t!30385 (t!30385 l!412)) value!115))))

(declare-fun b!1014724 () Bool)

(declare-fun Unit!33111 () Unit!33109)

(assert (=> b!1014724 (= e!570935 Unit!33111)))

(declare-fun b!1014725 () Bool)

(assert (=> b!1014725 (= e!570932 Nil!21390)))

(declare-fun bm!42712 () Bool)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!23 (List!21392 List!21393 B!1400 tuple2!15118) Unit!33109)

(assert (=> bm!42712 (= call!42716 (lemmaForallGetValueByKeySameWithASmallerHead!23 (ite c!102869 lt!448493 lt!448488) (ite c!102869 lt!448491 lt!448489) value!115 (ite c!102869 lt!448490 lt!448487)))))

(declare-fun bm!42713 () Bool)

(assert (=> bm!42713 (= call!42714 (isEmpty!817 call!42715))))

(declare-fun b!1014726 () Bool)

(declare-fun e!570934 () List!21393)

(assert (=> b!1014726 (= e!570934 e!570932)))

(declare-fun c!102870 () Bool)

(assert (=> b!1014726 (= c!102870 (and ((_ is Cons!21388) (t!30385 l!412)) (not (= (_2!7570 (h!22595 (t!30385 l!412))) value!115))))))

(declare-fun lt!448495 () List!21393)

(assert (=> d!120905 (forall!228 lt!448495 lambda!500)))

(assert (=> d!120905 (= lt!448495 e!570934)))

(assert (=> d!120905 (= c!102869 (and ((_ is Cons!21388) (t!30385 l!412)) (= (_2!7570 (h!22595 (t!30385 l!412))) value!115)))))

(assert (=> d!120905 (isStrictlySorted!546 (t!30385 l!412))))

(assert (=> d!120905 (= (getKeysOf!34 (t!30385 l!412) value!115) lt!448495)))

(declare-fun b!1014727 () Bool)

(assert (=> b!1014727 (= e!570934 (Cons!21389 (_1!7570 (h!22595 (t!30385 l!412))) call!42715))))

(declare-fun c!102867 () Bool)

(assert (=> b!1014727 (= c!102867 (not call!42714))))

(declare-fun lt!448497 () Unit!33109)

(assert (=> b!1014727 (= lt!448497 e!570933)))

(declare-fun b!1014728 () Bool)

(declare-fun Unit!33116 () Unit!33109)

(assert (=> b!1014728 (= e!570933 Unit!33116)))

(assert (= (and d!120905 c!102869) b!1014727))

(assert (= (and d!120905 (not c!102869)) b!1014726))

(assert (= (and b!1014727 c!102867) b!1014723))

(assert (= (and b!1014727 (not c!102867)) b!1014728))

(assert (= (and b!1014726 c!102870) b!1014721))

(assert (= (and b!1014726 (not c!102870)) b!1014725))

(assert (= (and b!1014721 c!102868) b!1014722))

(assert (= (and b!1014721 (not c!102868)) b!1014724))

(assert (= (or b!1014723 b!1014722) bm!42712))

(assert (= (or b!1014723 b!1014722) bm!42710))

(assert (= (or b!1014727 b!1014723 b!1014721 b!1014722) bm!42711))

(assert (= (or b!1014727 b!1014721) bm!42713))

(declare-fun m!938069 () Bool)

(assert (=> bm!42712 m!938069))

(declare-fun m!938071 () Bool)

(assert (=> bm!42711 m!938071))

(declare-fun m!938073 () Bool)

(assert (=> bm!42713 m!938073))

(declare-fun m!938075 () Bool)

(assert (=> bm!42710 m!938075))

(declare-fun m!938077 () Bool)

(assert (=> d!120905 m!938077))

(declare-fun m!938079 () Bool)

(assert (=> d!120905 m!938079))

(assert (=> b!1014626 d!120905))

(declare-fun d!120923 () Bool)

(declare-fun lt!448524 () Int)

(assert (=> d!120923 (>= lt!448524 0)))

(declare-fun e!570946 () Int)

(assert (=> d!120923 (= lt!448524 e!570946)))

(declare-fun c!102881 () Bool)

(assert (=> d!120923 (= c!102881 ((_ is Nil!21389) (t!30385 l!412)))))

(assert (=> d!120923 (= (ListPrimitiveSize!103 (t!30385 l!412)) lt!448524)))

(declare-fun b!1014767 () Bool)

(assert (=> b!1014767 (= e!570946 0)))

(declare-fun b!1014768 () Bool)

(assert (=> b!1014768 (= e!570946 (+ 1 (ListPrimitiveSize!103 (t!30385 (t!30385 l!412)))))))

(assert (= (and d!120923 c!102881) b!1014767))

(assert (= (and d!120923 (not c!102881)) b!1014768))

(declare-fun m!938091 () Bool)

(assert (=> b!1014768 m!938091))

(assert (=> b!1014627 d!120923))

(declare-fun d!120927 () Bool)

(declare-fun lt!448525 () Int)

(assert (=> d!120927 (>= lt!448525 0)))

(declare-fun e!570947 () Int)

(assert (=> d!120927 (= lt!448525 e!570947)))

(declare-fun c!102882 () Bool)

(assert (=> d!120927 (= c!102882 ((_ is Nil!21389) l!412))))

(assert (=> d!120927 (= (ListPrimitiveSize!103 l!412) lt!448525)))

(declare-fun b!1014769 () Bool)

(assert (=> b!1014769 (= e!570947 0)))

(declare-fun b!1014770 () Bool)

(assert (=> b!1014770 (= e!570947 (+ 1 (ListPrimitiveSize!103 (t!30385 l!412))))))

(assert (= (and d!120927 c!102882) b!1014769))

(assert (= (and d!120927 (not c!102882)) b!1014770))

(assert (=> b!1014770 m!938037))

(assert (=> b!1014627 d!120927))

(declare-fun d!120929 () Bool)

(declare-fun res!680911 () Bool)

(declare-fun e!570961 () Bool)

(assert (=> d!120929 (=> res!680911 e!570961)))

(assert (=> d!120929 (= res!680911 (or ((_ is Nil!21389) l!412) ((_ is Nil!21389) (t!30385 l!412))))))

(assert (=> d!120929 (= (isStrictlySorted!546 l!412) e!570961)))

(declare-fun b!1014792 () Bool)

(declare-fun e!570962 () Bool)

(assert (=> b!1014792 (= e!570961 e!570962)))

(declare-fun res!680912 () Bool)

(assert (=> b!1014792 (=> (not res!680912) (not e!570962))))

(assert (=> b!1014792 (= res!680912 (bvslt (_1!7570 (h!22595 l!412)) (_1!7570 (h!22595 (t!30385 l!412)))))))

(declare-fun b!1014793 () Bool)

(assert (=> b!1014793 (= e!570962 (isStrictlySorted!546 (t!30385 l!412)))))

(assert (= (and d!120929 (not res!680911)) b!1014792))

(assert (= (and b!1014792 res!680912) b!1014793))

(assert (=> b!1014793 m!938079))

(assert (=> start!87748 d!120929))

(declare-fun b!1014799 () Bool)

(declare-fun e!570966 () Bool)

(declare-fun tp!70443 () Bool)

(assert (=> b!1014799 (= e!570966 (and tp_is_empty!23467 tp!70443))))

(assert (=> b!1014628 (= tp!70428 e!570966)))

(assert (= (and b!1014628 ((_ is Cons!21388) (t!30385 l!412))) b!1014799))

(check-sat (not d!120905) (not bm!42711) (not b!1014770) tp_is_empty!23467 (not b!1014793) (not b!1014799) (not bm!42713) (not bm!42710) (not bm!42712) (not b!1014768))
(check-sat)
