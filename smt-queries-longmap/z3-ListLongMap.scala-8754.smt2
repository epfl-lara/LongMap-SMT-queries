; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106242 () Bool)

(assert start!106242)

(declare-fun res!842158 () Bool)

(declare-fun e!720124 () Bool)

(assert (=> start!106242 (=> (not res!842158) (not e!720124))))

(declare-datatypes ((B!1918 0))(
  ( (B!1919 (val!16294 Int)) )
))
(declare-datatypes ((tuple2!21106 0))(
  ( (tuple2!21107 (_1!10564 (_ BitVec 64)) (_2!10564 B!1918)) )
))
(declare-datatypes ((List!28286 0))(
  ( (Nil!28283) (Cons!28282 (h!29491 tuple2!21106) (t!41807 List!28286)) )
))
(declare-datatypes ((ListLongMap!18979 0))(
  ( (ListLongMap!18980 (toList!9505 List!28286)) )
))
(declare-fun lm!212 () ListLongMap!18979)

(declare-fun a1!67 () (_ BitVec 64))

(declare-fun contains!7626 (ListLongMap!18979 (_ BitVec 64)) Bool)

(assert (=> start!106242 (= res!842158 (not (contains!7626 lm!212 a1!67)))))

(assert (=> start!106242 e!720124))

(declare-fun e!720125 () Bool)

(declare-fun inv!44081 (ListLongMap!18979) Bool)

(assert (=> start!106242 (and (inv!44081 lm!212) e!720125)))

(assert (=> start!106242 true))

(declare-fun b!1264592 () Bool)

(declare-fun res!842157 () Bool)

(assert (=> b!1264592 (=> (not res!842157) (not e!720124))))

(declare-fun isStrictlySorted!773 (List!28286) Bool)

(assert (=> b!1264592 (= res!842157 (isStrictlySorted!773 (toList!9505 lm!212)))))

(declare-fun b!1264593 () Bool)

(declare-fun containsKey!632 (List!28286 (_ BitVec 64)) Bool)

(assert (=> b!1264593 (= e!720124 (containsKey!632 (toList!9505 lm!212) a1!67))))

(declare-fun b!1264594 () Bool)

(declare-fun tp!96224 () Bool)

(assert (=> b!1264594 (= e!720125 tp!96224)))

(assert (= (and start!106242 res!842158) b!1264592))

(assert (= (and b!1264592 res!842157) b!1264593))

(assert (= start!106242 b!1264594))

(declare-fun m!1165127 () Bool)

(assert (=> start!106242 m!1165127))

(declare-fun m!1165129 () Bool)

(assert (=> start!106242 m!1165129))

(declare-fun m!1165131 () Bool)

(assert (=> b!1264592 m!1165131))

(declare-fun m!1165133 () Bool)

(assert (=> b!1264593 m!1165133))

(check-sat (not b!1264593) (not b!1264592) (not start!106242) (not b!1264594))
(check-sat)
(get-model)

(declare-fun d!138753 () Bool)

(declare-fun res!842175 () Bool)

(declare-fun e!720142 () Bool)

(assert (=> d!138753 (=> res!842175 e!720142)))

(get-info :version)

(assert (=> d!138753 (= res!842175 (and ((_ is Cons!28282) (toList!9505 lm!212)) (= (_1!10564 (h!29491 (toList!9505 lm!212))) a1!67)))))

(assert (=> d!138753 (= (containsKey!632 (toList!9505 lm!212) a1!67) e!720142)))

(declare-fun b!1264612 () Bool)

(declare-fun e!720143 () Bool)

(assert (=> b!1264612 (= e!720142 e!720143)))

(declare-fun res!842176 () Bool)

(assert (=> b!1264612 (=> (not res!842176) (not e!720143))))

(assert (=> b!1264612 (= res!842176 (and (or (not ((_ is Cons!28282) (toList!9505 lm!212))) (bvsle (_1!10564 (h!29491 (toList!9505 lm!212))) a1!67)) ((_ is Cons!28282) (toList!9505 lm!212)) (bvslt (_1!10564 (h!29491 (toList!9505 lm!212))) a1!67)))))

(declare-fun b!1264613 () Bool)

(assert (=> b!1264613 (= e!720143 (containsKey!632 (t!41807 (toList!9505 lm!212)) a1!67))))

(assert (= (and d!138753 (not res!842175)) b!1264612))

(assert (= (and b!1264612 res!842176) b!1264613))

(declare-fun m!1165143 () Bool)

(assert (=> b!1264613 m!1165143))

(assert (=> b!1264593 d!138753))

(declare-fun d!138759 () Bool)

(declare-fun res!842191 () Bool)

(declare-fun e!720158 () Bool)

(assert (=> d!138759 (=> res!842191 e!720158)))

(assert (=> d!138759 (= res!842191 (or ((_ is Nil!28283) (toList!9505 lm!212)) ((_ is Nil!28283) (t!41807 (toList!9505 lm!212)))))))

(assert (=> d!138759 (= (isStrictlySorted!773 (toList!9505 lm!212)) e!720158)))

(declare-fun b!1264630 () Bool)

(declare-fun e!720159 () Bool)

(assert (=> b!1264630 (= e!720158 e!720159)))

(declare-fun res!842192 () Bool)

(assert (=> b!1264630 (=> (not res!842192) (not e!720159))))

(assert (=> b!1264630 (= res!842192 (bvslt (_1!10564 (h!29491 (toList!9505 lm!212))) (_1!10564 (h!29491 (t!41807 (toList!9505 lm!212))))))))

(declare-fun b!1264631 () Bool)

(assert (=> b!1264631 (= e!720159 (isStrictlySorted!773 (t!41807 (toList!9505 lm!212))))))

(assert (= (and d!138759 (not res!842191)) b!1264630))

(assert (= (and b!1264630 res!842192) b!1264631))

(declare-fun m!1165149 () Bool)

(assert (=> b!1264631 m!1165149))

(assert (=> b!1264592 d!138759))

(declare-fun d!138765 () Bool)

(declare-fun e!720181 () Bool)

(assert (=> d!138765 e!720181))

(declare-fun res!842206 () Bool)

(assert (=> d!138765 (=> res!842206 e!720181)))

(declare-fun lt!573872 () Bool)

(assert (=> d!138765 (= res!842206 (not lt!573872))))

(declare-fun lt!573871 () Bool)

(assert (=> d!138765 (= lt!573872 lt!573871)))

(declare-datatypes ((Unit!42154 0))(
  ( (Unit!42155) )
))
(declare-fun lt!573870 () Unit!42154)

(declare-fun e!720180 () Unit!42154)

(assert (=> d!138765 (= lt!573870 e!720180)))

(declare-fun c!123153 () Bool)

(assert (=> d!138765 (= c!123153 lt!573871)))

(assert (=> d!138765 (= lt!573871 (containsKey!632 (toList!9505 lm!212) a1!67))))

(assert (=> d!138765 (= (contains!7626 lm!212 a1!67) lt!573872)))

(declare-fun b!1264659 () Bool)

(declare-fun lt!573869 () Unit!42154)

(assert (=> b!1264659 (= e!720180 lt!573869)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!440 (List!28286 (_ BitVec 64)) Unit!42154)

(assert (=> b!1264659 (= lt!573869 (lemmaContainsKeyImpliesGetValueByKeyDefined!440 (toList!9505 lm!212) a1!67))))

(declare-datatypes ((Option!724 0))(
  ( (Some!723 (v!19001 B!1918)) (None!722) )
))
(declare-fun isDefined!479 (Option!724) Bool)

(declare-fun getValueByKey!673 (List!28286 (_ BitVec 64)) Option!724)

(assert (=> b!1264659 (isDefined!479 (getValueByKey!673 (toList!9505 lm!212) a1!67))))

(declare-fun b!1264660 () Bool)

(declare-fun Unit!42158 () Unit!42154)

(assert (=> b!1264660 (= e!720180 Unit!42158)))

(declare-fun b!1264661 () Bool)

(assert (=> b!1264661 (= e!720181 (isDefined!479 (getValueByKey!673 (toList!9505 lm!212) a1!67)))))

(assert (= (and d!138765 c!123153) b!1264659))

(assert (= (and d!138765 (not c!123153)) b!1264660))

(assert (= (and d!138765 (not res!842206)) b!1264661))

(assert (=> d!138765 m!1165133))

(declare-fun m!1165161 () Bool)

(assert (=> b!1264659 m!1165161))

(declare-fun m!1165163 () Bool)

(assert (=> b!1264659 m!1165163))

(assert (=> b!1264659 m!1165163))

(declare-fun m!1165165 () Bool)

(assert (=> b!1264659 m!1165165))

(assert (=> b!1264661 m!1165163))

(assert (=> b!1264661 m!1165163))

(assert (=> b!1264661 m!1165165))

(assert (=> start!106242 d!138765))

(declare-fun d!138773 () Bool)

(assert (=> d!138773 (= (inv!44081 lm!212) (isStrictlySorted!773 (toList!9505 lm!212)))))

(declare-fun bs!35781 () Bool)

(assert (= bs!35781 d!138773))

(assert (=> bs!35781 m!1165131))

(assert (=> start!106242 d!138773))

(declare-fun b!1264676 () Bool)

(declare-fun e!720191 () Bool)

(declare-fun tp_is_empty!32451 () Bool)

(declare-fun tp!96233 () Bool)

(assert (=> b!1264676 (= e!720191 (and tp_is_empty!32451 tp!96233))))

(assert (=> b!1264594 (= tp!96224 e!720191)))

(assert (= (and b!1264594 ((_ is Cons!28282) (toList!9505 lm!212))) b!1264676))

(check-sat (not b!1264613) (not d!138765) (not b!1264631) (not b!1264661) (not b!1264676) (not d!138773) tp_is_empty!32451 (not b!1264659))
(check-sat)
