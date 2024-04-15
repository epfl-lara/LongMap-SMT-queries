; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87312 () Bool)

(assert start!87312)

(declare-fun b!1011893 () Bool)

(assert (=> b!1011893 true))

(assert (=> b!1011893 true))

(declare-fun b!1011891 () Bool)

(declare-fun res!679771 () Bool)

(declare-fun e!569238 () Bool)

(assert (=> b!1011891 (=> (not res!679771) (not e!569238))))

(declare-datatypes ((B!1322 0))(
  ( (B!1323 (val!11745 Int)) )
))
(declare-datatypes ((tuple2!15116 0))(
  ( (tuple2!15117 (_1!7569 (_ BitVec 64)) (_2!7569 B!1322)) )
))
(declare-datatypes ((List!21375 0))(
  ( (Nil!21372) (Cons!21371 (h!22569 tuple2!15116) (t!30367 List!21375)) )
))
(declare-fun l!412 () List!21375)

(declare-fun head!920 (List!21375) tuple2!15116)

(assert (=> b!1011891 (= res!679771 (bvslt (_1!7569 (h!22569 l!412)) (_1!7569 (head!920 (t!30367 l!412)))))))

(declare-fun res!679773 () Bool)

(assert (=> b!1011893 (=> (not res!679773) (not e!569238))))

(declare-datatypes ((List!21376 0))(
  ( (Nil!21373) (Cons!21372 (h!22570 (_ BitVec 64)) (t!30368 List!21376)) )
))
(declare-fun lt!447091 () List!21376)

(declare-fun lambda!274 () Int)

(declare-fun forall!206 (List!21376 Int) Bool)

(assert (=> b!1011893 (= res!679773 (forall!206 lt!447091 lambda!274))))

(declare-fun b!1011894 () Bool)

(declare-fun res!679770 () Bool)

(declare-fun e!569239 () Bool)

(assert (=> b!1011894 (=> (not res!679770) (not e!569239))))

(declare-fun value!115 () B!1322)

(get-info :version)

(assert (=> b!1011894 (= res!679770 (and ((_ is Cons!21371) l!412) (= (_2!7569 (h!22569 l!412)) value!115)))))

(declare-fun b!1011895 () Bool)

(declare-fun res!679774 () Bool)

(assert (=> b!1011895 (=> (not res!679774) (not e!569238))))

(declare-fun isStrictlySorted!521 (List!21375) Bool)

(assert (=> b!1011895 (= res!679774 (isStrictlySorted!521 (t!30367 l!412)))))

(declare-fun b!1011896 () Bool)

(declare-fun res!679772 () Bool)

(assert (=> b!1011896 (=> (not res!679772) (not e!569238))))

(declare-fun isEmpty!782 (List!21375) Bool)

(assert (=> b!1011896 (= res!679772 (not (isEmpty!782 (t!30367 l!412))))))

(declare-fun b!1011897 () Bool)

(assert (=> b!1011897 (= e!569239 e!569238)))

(declare-fun res!679769 () Bool)

(assert (=> b!1011897 (=> (not res!679769) (not e!569238))))

(declare-fun isEmpty!783 (List!21376) Bool)

(assert (=> b!1011897 (= res!679769 (not (isEmpty!783 lt!447091)))))

(declare-fun getKeysOf!10 (List!21375 B!1322) List!21376)

(assert (=> b!1011897 (= lt!447091 (getKeysOf!10 (t!30367 l!412) value!115))))

(declare-fun b!1011898 () Bool)

(assert (=> b!1011898 (= e!569238 (not (forall!206 lt!447091 lambda!274)))))

(declare-fun res!679775 () Bool)

(assert (=> start!87312 (=> (not res!679775) (not e!569239))))

(assert (=> start!87312 (= res!679775 (isStrictlySorted!521 l!412))))

(assert (=> start!87312 e!569239))

(declare-fun e!569240 () Bool)

(assert (=> start!87312 e!569240))

(declare-fun tp_is_empty!23389 () Bool)

(assert (=> start!87312 tp_is_empty!23389))

(declare-fun b!1011892 () Bool)

(declare-fun tp!70248 () Bool)

(assert (=> b!1011892 (= e!569240 (and tp_is_empty!23389 tp!70248))))

(assert (= (and start!87312 res!679775) b!1011894))

(assert (= (and b!1011894 res!679770) b!1011897))

(assert (= (and b!1011897 res!679769) b!1011895))

(assert (= (and b!1011895 res!679774) b!1011896))

(assert (= (and b!1011896 res!679772) b!1011893))

(assert (= (and b!1011893 res!679773) b!1011891))

(assert (= (and b!1011891 res!679771) b!1011898))

(assert (= (and start!87312 ((_ is Cons!21371) l!412)) b!1011892))

(declare-fun m!935179 () Bool)

(assert (=> b!1011893 m!935179))

(declare-fun m!935181 () Bool)

(assert (=> b!1011896 m!935181))

(declare-fun m!935183 () Bool)

(assert (=> b!1011895 m!935183))

(declare-fun m!935185 () Bool)

(assert (=> b!1011891 m!935185))

(assert (=> b!1011898 m!935179))

(declare-fun m!935187 () Bool)

(assert (=> start!87312 m!935187))

(declare-fun m!935189 () Bool)

(assert (=> b!1011897 m!935189))

(declare-fun m!935191 () Bool)

(assert (=> b!1011897 m!935191))

(check-sat (not start!87312) tp_is_empty!23389 (not b!1011893) (not b!1011895) (not b!1011896) (not b!1011892) (not b!1011897) (not b!1011898) (not b!1011891))
(check-sat)
