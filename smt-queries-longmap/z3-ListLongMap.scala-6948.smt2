; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87492 () Bool)

(assert start!87492)

(declare-fun res!680258 () Bool)

(declare-fun e!569887 () Bool)

(assert (=> start!87492 (=> (not res!680258) (not e!569887))))

(declare-datatypes ((B!1394 0))(
  ( (B!1395 (val!11781 Int)) )
))
(declare-datatypes ((tuple2!15188 0))(
  ( (tuple2!15189 (_1!7605 (_ BitVec 64)) (_2!7605 B!1394)) )
))
(declare-datatypes ((List!21435 0))(
  ( (Nil!21432) (Cons!21431 (h!22629 tuple2!15188) (t!30427 List!21435)) )
))
(declare-fun l!412 () List!21435)

(declare-fun isStrictlySorted!551 (List!21435) Bool)

(assert (=> start!87492 (= res!680258 (isStrictlySorted!551 l!412))))

(assert (=> start!87492 e!569887))

(declare-fun e!569888 () Bool)

(assert (=> start!87492 e!569888))

(declare-fun tp_is_empty!23461 () Bool)

(assert (=> start!87492 tp_is_empty!23461))

(declare-fun b!1013075 () Bool)

(declare-fun res!680257 () Bool)

(assert (=> b!1013075 (=> (not res!680257) (not e!569887))))

(declare-fun value!115 () B!1394)

(get-info :version)

(assert (=> b!1013075 (= res!680257 (and ((_ is Cons!21431) l!412) (= (_2!7605 (h!22629 l!412)) value!115)))))

(declare-fun b!1013076 () Bool)

(declare-fun ListPrimitiveSize!100 (List!21435) Int)

(assert (=> b!1013076 (= e!569887 (>= (ListPrimitiveSize!100 (t!30427 l!412)) (ListPrimitiveSize!100 l!412)))))

(declare-fun b!1013077 () Bool)

(declare-fun tp!70410 () Bool)

(assert (=> b!1013077 (= e!569888 (and tp_is_empty!23461 tp!70410))))

(assert (= (and start!87492 res!680258) b!1013075))

(assert (= (and b!1013075 res!680257) b!1013076))

(assert (= (and start!87492 ((_ is Cons!21431) l!412)) b!1013077))

(declare-fun m!935719 () Bool)

(assert (=> start!87492 m!935719))

(declare-fun m!935721 () Bool)

(assert (=> b!1013076 m!935721))

(declare-fun m!935723 () Bool)

(assert (=> b!1013076 m!935723))

(check-sat (not b!1013076) (not start!87492) (not b!1013077) tp_is_empty!23461)
(check-sat)
(get-model)

(declare-fun d!120269 () Bool)

(declare-fun lt!447685 () Int)

(assert (=> d!120269 (>= lt!447685 0)))

(declare-fun e!569903 () Int)

(assert (=> d!120269 (= lt!447685 e!569903)))

(declare-fun c!102382 () Bool)

(assert (=> d!120269 (= c!102382 ((_ is Nil!21432) (t!30427 l!412)))))

(assert (=> d!120269 (= (ListPrimitiveSize!100 (t!30427 l!412)) lt!447685)))

(declare-fun b!1013100 () Bool)

(assert (=> b!1013100 (= e!569903 0)))

(declare-fun b!1013101 () Bool)

(assert (=> b!1013101 (= e!569903 (+ 1 (ListPrimitiveSize!100 (t!30427 (t!30427 l!412)))))))

(assert (= (and d!120269 c!102382) b!1013100))

(assert (= (and d!120269 (not c!102382)) b!1013101))

(declare-fun m!935737 () Bool)

(assert (=> b!1013101 m!935737))

(assert (=> b!1013076 d!120269))

(declare-fun d!120275 () Bool)

(declare-fun lt!447690 () Int)

(assert (=> d!120275 (>= lt!447690 0)))

(declare-fun e!569908 () Int)

(assert (=> d!120275 (= lt!447690 e!569908)))

(declare-fun c!102387 () Bool)

(assert (=> d!120275 (= c!102387 ((_ is Nil!21432) l!412))))

(assert (=> d!120275 (= (ListPrimitiveSize!100 l!412) lt!447690)))

(declare-fun b!1013110 () Bool)

(assert (=> b!1013110 (= e!569908 0)))

(declare-fun b!1013111 () Bool)

(assert (=> b!1013111 (= e!569908 (+ 1 (ListPrimitiveSize!100 (t!30427 l!412))))))

(assert (= (and d!120275 c!102387) b!1013110))

(assert (= (and d!120275 (not c!102387)) b!1013111))

(assert (=> b!1013111 m!935721))

(assert (=> b!1013076 d!120275))

(declare-fun d!120277 () Bool)

(declare-fun res!680275 () Bool)

(declare-fun e!569917 () Bool)

(assert (=> d!120277 (=> res!680275 e!569917)))

(assert (=> d!120277 (= res!680275 (or ((_ is Nil!21432) l!412) ((_ is Nil!21432) (t!30427 l!412))))))

(assert (=> d!120277 (= (isStrictlySorted!551 l!412) e!569917)))

(declare-fun b!1013124 () Bool)

(declare-fun e!569918 () Bool)

(assert (=> b!1013124 (= e!569917 e!569918)))

(declare-fun res!680276 () Bool)

(assert (=> b!1013124 (=> (not res!680276) (not e!569918))))

(assert (=> b!1013124 (= res!680276 (bvslt (_1!7605 (h!22629 l!412)) (_1!7605 (h!22629 (t!30427 l!412)))))))

(declare-fun b!1013125 () Bool)

(assert (=> b!1013125 (= e!569918 (isStrictlySorted!551 (t!30427 l!412)))))

(assert (= (and d!120277 (not res!680275)) b!1013124))

(assert (= (and b!1013124 res!680276) b!1013125))

(declare-fun m!935743 () Bool)

(assert (=> b!1013125 m!935743))

(assert (=> start!87492 d!120277))

(declare-fun b!1013138 () Bool)

(declare-fun e!569929 () Bool)

(declare-fun tp!70419 () Bool)

(assert (=> b!1013138 (= e!569929 (and tp_is_empty!23461 tp!70419))))

(assert (=> b!1013077 (= tp!70410 e!569929)))

(assert (= (and b!1013077 ((_ is Cons!21431) (t!30427 l!412))) b!1013138))

(check-sat (not b!1013101) (not b!1013125) (not b!1013138) (not b!1013111) tp_is_empty!23461)
(check-sat)
