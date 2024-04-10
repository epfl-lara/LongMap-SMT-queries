; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87802 () Bool)

(assert start!87802)

(declare-fun b!1014959 () Bool)

(assert (=> b!1014959 true))

(assert (=> b!1014959 true))

(declare-fun b!1014957 () Bool)

(declare-fun res!680940 () Bool)

(declare-fun e!570959 () Bool)

(assert (=> b!1014957 (=> (not res!680940) (not e!570959))))

(declare-datatypes ((B!1452 0))(
  ( (B!1453 (val!11810 Int)) )
))
(declare-datatypes ((tuple2!15166 0))(
  ( (tuple2!15167 (_1!7594 (_ BitVec 64)) (_2!7594 B!1452)) )
))
(declare-datatypes ((List!21452 0))(
  ( (Nil!21449) (Cons!21448 (h!22646 tuple2!15166) (t!30453 List!21452)) )
))
(declare-fun l!412 () List!21452)

(declare-fun value!115 () B!1452)

(assert (=> b!1014957 (= res!680940 (and (not (= (_2!7594 (h!22646 l!412)) value!115)) (is-Cons!21448 l!412)))))

(declare-fun b!1014958 () Bool)

(declare-fun e!570961 () Bool)

(declare-fun tp_is_empty!23519 () Bool)

(declare-fun tp!70580 () Bool)

(assert (=> b!1014958 (= e!570961 (and tp_is_empty!23519 tp!70580))))

(declare-datatypes ((Unit!33203 0))(
  ( (Unit!33204) )
))
(declare-fun e!570960 () Unit!33203)

(declare-fun lt!448874 () Unit!33203)

(assert (=> b!1014959 (= e!570960 lt!448874)))

(declare-datatypes ((List!21453 0))(
  ( (Nil!21450) (Cons!21449 (h!22647 (_ BitVec 64)) (t!30454 List!21453)) )
))
(declare-fun lt!448875 () List!21453)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!43 (List!21452 List!21453 B!1452 tuple2!15166) Unit!33203)

(assert (=> b!1014959 (= lt!448874 (lemmaForallGetValueByKeySameWithASmallerHead!43 (t!30453 l!412) lt!448875 value!115 (h!22646 l!412)))))

(declare-fun lambda!782 () Int)

(declare-fun forall!249 (List!21453 Int) Bool)

(assert (=> b!1014959 (forall!249 lt!448875 lambda!782)))

(declare-fun b!1014960 () Bool)

(declare-fun Unit!33205 () Unit!33203)

(assert (=> b!1014960 (= e!570960 Unit!33205)))

(declare-fun b!1014961 () Bool)

(declare-fun ListPrimitiveSize!120 (List!21452) Int)

(assert (=> b!1014961 (= e!570959 (>= (ListPrimitiveSize!120 (t!30453 l!412)) (ListPrimitiveSize!120 l!412)))))

(declare-fun lt!448873 () Unit!33203)

(assert (=> b!1014961 (= lt!448873 e!570960)))

(declare-fun c!102798 () Bool)

(declare-fun isEmpty!847 (List!21453) Bool)

(assert (=> b!1014961 (= c!102798 (not (isEmpty!847 lt!448875)))))

(declare-fun getKeysOf!57 (List!21452 B!1452) List!21453)

(assert (=> b!1014961 (= lt!448875 (getKeysOf!57 (t!30453 l!412) value!115))))

(declare-fun res!680939 () Bool)

(assert (=> start!87802 (=> (not res!680939) (not e!570959))))

(declare-fun isStrictlySorted!584 (List!21452) Bool)

(assert (=> start!87802 (= res!680939 (isStrictlySorted!584 l!412))))

(assert (=> start!87802 e!570959))

(assert (=> start!87802 e!570961))

(assert (=> start!87802 tp_is_empty!23519))

(assert (= (and start!87802 res!680939) b!1014957))

(assert (= (and b!1014957 res!680940) b!1014961))

(assert (= (and b!1014961 c!102798) b!1014959))

(assert (= (and b!1014961 (not c!102798)) b!1014960))

(assert (= (and start!87802 (is-Cons!21448 l!412)) b!1014958))

(declare-fun m!937273 () Bool)

(assert (=> b!1014959 m!937273))

(declare-fun m!937275 () Bool)

(assert (=> b!1014959 m!937275))

(declare-fun m!937277 () Bool)

(assert (=> b!1014961 m!937277))

(declare-fun m!937279 () Bool)

(assert (=> b!1014961 m!937279))

(declare-fun m!937281 () Bool)

(assert (=> b!1014961 m!937281))

(declare-fun m!937283 () Bool)

(assert (=> b!1014961 m!937283))

(declare-fun m!937285 () Bool)

(assert (=> start!87802 m!937285))

(push 1)

(assert (not b!1014959))

(assert tp_is_empty!23519)

(assert (not b!1014961))

(assert (not start!87802))

(assert (not b!1014958))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!120869 () Bool)

(declare-fun lt!448885 () Int)

(assert (=> d!120869 (>= lt!448885 0)))

(declare-fun e!570983 () Int)

(assert (=> d!120869 (= lt!448885 e!570983)))

(declare-fun c!102805 () Bool)

(assert (=> d!120869 (= c!102805 (is-Nil!21449 (t!30453 l!412)))))

(assert (=> d!120869 (= (ListPrimitiveSize!120 (t!30453 l!412)) lt!448885)))

(declare-fun b!1015001 () Bool)

(assert (=> b!1015001 (= e!570983 0)))

(declare-fun b!1015002 () Bool)

(assert (=> b!1015002 (= e!570983 (+ 1 (ListPrimitiveSize!120 (t!30453 (t!30453 l!412)))))))

(assert (= (and d!120869 c!102805) b!1015001))

(assert (= (and d!120869 (not c!102805)) b!1015002))

(declare-fun m!937305 () Bool)

(assert (=> b!1015002 m!937305))

(assert (=> b!1014961 d!120869))

(declare-fun d!120875 () Bool)

(declare-fun lt!448892 () Int)

(assert (=> d!120875 (>= lt!448892 0)))

(declare-fun e!570990 () Int)

(assert (=> d!120875 (= lt!448892 e!570990)))

(declare-fun c!102812 () Bool)

(assert (=> d!120875 (= c!102812 (is-Nil!21449 l!412))))

(assert (=> d!120875 (= (ListPrimitiveSize!120 l!412) lt!448892)))

(declare-fun b!1015015 () Bool)

(assert (=> b!1015015 (= e!570990 0)))

(declare-fun b!1015016 () Bool)

(assert (=> b!1015016 (= e!570990 (+ 1 (ListPrimitiveSize!120 (t!30453 l!412))))))

(assert (= (and d!120875 c!102812) b!1015015))

(assert (= (and d!120875 (not c!102812)) b!1015016))

(assert (=> b!1015016 m!937277))

(assert (=> b!1014961 d!120875))

(declare-fun d!120879 () Bool)

(assert (=> d!120879 (= (isEmpty!847 lt!448875) (is-Nil!21450 lt!448875))))

(assert (=> b!1014961 d!120879))

(declare-fun bs!29345 () Bool)

(declare-fun b!1015117 () Bool)

(assert (= bs!29345 (and b!1015117 b!1014959)))

(declare-fun lt!448991 () tuple2!15166)

(declare-fun lambda!819 () Int)

(declare-fun lt!448995 () List!21452)

(assert (=> bs!29345 (= (= (Cons!21448 lt!448991 lt!448995) l!412) (= lambda!819 lambda!782))))

(assert (=> b!1015117 true))

(assert (=> b!1015117 true))

(assert (=> b!1015117 true))

(declare-fun bs!29346 () Bool)

(declare-fun b!1015111 () Bool)

(assert (= bs!29346 (and b!1015111 b!1014959)))

(declare-fun lt!448998 () List!21452)

(declare-fun lambda!820 () Int)

(declare-fun lt!448999 () tuple2!15166)

(assert (=> bs!29346 (= (= (Cons!21448 lt!448999 lt!448998) l!412) (= lambda!820 lambda!782))))

(declare-fun bs!29347 () Bool)

(assert (= bs!29347 (and b!1015111 b!1015117)))

(assert (=> bs!29347 (= (= (Cons!21448 lt!448999 lt!448998) (Cons!21448 lt!448991 lt!448995)) (= lambda!820 lambda!819))))

(assert (=> b!1015111 true))

(assert (=> b!1015111 true))

(assert (=> b!1015111 true))

(declare-fun bs!29348 () Bool)

(declare-fun d!120885 () Bool)

(assert (= bs!29348 (and d!120885 b!1014959)))

(declare-fun lambda!821 () Int)

(assert (=> bs!29348 (= (= (t!30453 l!412) l!412) (= lambda!821 lambda!782))))

(declare-fun bs!29349 () Bool)

(assert (= bs!29349 (and d!120885 b!1015117)))

(assert (=> bs!29349 (= (= (t!30453 l!412) (Cons!21448 lt!448991 lt!448995)) (= lambda!821 lambda!819))))

(declare-fun bs!29350 () Bool)

(assert (= bs!29350 (and d!120885 b!1015111)))

(assert (=> bs!29350 (= (= (t!30453 l!412) (Cons!21448 lt!448999 lt!448998)) (= lambda!821 lambda!820))))

(assert (=> d!120885 true))

(assert (=> d!120885 true))

(declare-fun c!102843 () Bool)

(declare-fun call!42921 () Bool)

(declare-fun lt!448992 () List!21453)

(declare-fun lt!448990 () List!21453)

(declare-fun bm!42915 () Bool)

(assert (=> bm!42915 (= call!42921 (forall!249 (ite c!102843 lt!448990 lt!448992) (ite c!102843 lambda!819 lambda!820)))))

(declare-fun b!1015110 () Bool)

(declare-fun e!571045 () List!21453)

(declare-fun e!571043 () List!21453)

(assert (=> b!1015110 (= e!571045 e!571043)))

(declare-fun c!102846 () Bool)

(assert (=> b!1015110 (= c!102846 (and (is-Cons!21448 (t!30453 l!412)) (not (= (_2!7594 (h!22646 (t!30453 l!412))) value!115))))))

(declare-fun e!571044 () Unit!33203)

(declare-fun lt!449001 () Unit!33203)

(assert (=> b!1015111 (= e!571044 lt!449001)))

(assert (=> b!1015111 (= lt!448998 (t!30453 (t!30453 l!412)))))

(declare-fun call!42918 () List!21453)

(assert (=> b!1015111 (= lt!448992 call!42918)))

(assert (=> b!1015111 (= lt!448999 (h!22646 (t!30453 l!412)))))

(declare-fun call!42920 () Unit!33203)

(assert (=> b!1015111 (= lt!449001 call!42920)))

(assert (=> b!1015111 call!42921))

(declare-fun b!1015112 () Bool)

(declare-fun e!571042 () Unit!33203)

(declare-fun Unit!33210 () Unit!33203)

(assert (=> b!1015112 (= e!571042 Unit!33210)))

(declare-fun lt!448993 () List!21453)

(assert (=> d!120885 (forall!249 lt!448993 lambda!821)))

(assert (=> d!120885 (= lt!448993 e!571045)))

(assert (=> d!120885 (= c!102843 (and (is-Cons!21448 (t!30453 l!412)) (= (_2!7594 (h!22646 (t!30453 l!412))) value!115)))))

(assert (=> d!120885 (isStrictlySorted!584 (t!30453 l!412))))

(assert (=> d!120885 (= (getKeysOf!57 (t!30453 l!412) value!115) lt!448993)))

(declare-fun b!1015113 () Bool)

(declare-fun Unit!33211 () Unit!33203)

(assert (=> b!1015113 (= e!571044 Unit!33211)))

(declare-fun b!1015114 () Bool)

(declare-fun lt!448997 () Unit!33203)

(assert (=> b!1015114 (= lt!448997 e!571044)))

(declare-fun c!102844 () Bool)

(declare-fun call!42919 () Bool)

(assert (=> b!1015114 (= c!102844 (not call!42919))))

(declare-fun lt!448994 () List!21453)

(assert (=> b!1015114 (= lt!448994 call!42918)))

(assert (=> b!1015114 (= e!571043 call!42918)))

(declare-fun b!1015115 () Bool)

(assert (=> b!1015115 (= e!571043 Nil!21450)))

(declare-fun bm!42916 () Bool)

(assert (=> bm!42916 (= call!42919 (isEmpty!847 call!42918))))

(declare-fun bm!42917 () Bool)

(assert (=> bm!42917 (= call!42920 (lemmaForallGetValueByKeySameWithASmallerHead!43 (ite c!102843 lt!448995 lt!448998) (ite c!102843 lt!448990 lt!448992) value!115 (ite c!102843 lt!448991 lt!448999)))))

(declare-fun b!1015116 () Bool)

(assert (=> b!1015116 (= e!571045 (Cons!21449 (_1!7594 (h!22646 (t!30453 l!412))) call!42918))))

(declare-fun c!102845 () Bool)

(assert (=> b!1015116 (= c!102845 (not call!42919))))

(declare-fun lt!449000 () Unit!33203)

(assert (=> b!1015116 (= lt!449000 e!571042)))

(declare-fun bm!42918 () Bool)

(assert (=> bm!42918 (= call!42918 (getKeysOf!57 (t!30453 (t!30453 l!412)) value!115))))

(assert (=> b!1015117 call!42921))

(declare-fun lt!448996 () Unit!33203)

(assert (=> b!1015117 (= lt!448996 call!42920)))

(assert (=> b!1015117 (= lt!448991 (h!22646 (t!30453 l!412)))))

(assert (=> b!1015117 (= lt!448990 call!42918)))

(assert (=> b!1015117 (= lt!448995 (t!30453 (t!30453 l!412)))))

(assert (=> b!1015117 (= e!571042 lt!448996)))

(assert (= (and d!120885 c!102843) b!1015116))

(assert (= (and d!120885 (not c!102843)) b!1015110))

(assert (= (and b!1015116 c!102845) b!1015117))

(assert (= (and b!1015116 (not c!102845)) b!1015112))

(assert (= (and b!1015110 c!102846) b!1015114))

(assert (= (and b!1015110 (not c!102846)) b!1015115))

(assert (= (and b!1015114 c!102844) b!1015111))

