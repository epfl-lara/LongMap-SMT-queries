; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115534 () Bool)

(assert start!115534)

(declare-fun res!908685 () Bool)

(declare-fun e!774727 () Bool)

(assert (=> start!115534 (=> (not res!908685) (not e!774727))))

(declare-datatypes ((List!31891 0))(
  ( (Nil!31888) (Cons!31887 (h!33105 (_ BitVec 64)) (t!46577 List!31891)) )
))
(declare-datatypes ((tuple2!24450 0))(
  ( (tuple2!24451 (_1!12236 (_ BitVec 64)) (_2!12236 List!31891)) )
))
(declare-datatypes ((Option!787 0))(
  ( (Some!786 (v!21586 tuple2!24450)) (None!785) )
))
(declare-fun lt!601596 () Option!787)

(declare-fun isEmpty!1119 (Option!787) Bool)

(assert (=> start!115534 (= res!908685 (not (isEmpty!1119 lt!601596)))))

(declare-fun l!3677 () List!31891)

(declare-fun unapply!58 (List!31891) Option!787)

(assert (=> start!115534 (= lt!601596 (unapply!58 l!3677))))

(assert (=> start!115534 e!774727))

(assert (=> start!115534 true))

(declare-fun b!1365892 () Bool)

(declare-fun subseq!941 (List!31891 List!31891) Bool)

(assert (=> b!1365892 (= e!774727 (not (subseq!941 l!3677 l!3677)))))

(declare-fun lt!601594 () tuple2!24450)

(assert (=> b!1365892 (subseq!941 (_2!12236 lt!601594) (_2!12236 lt!601594))))

(declare-datatypes ((Unit!44966 0))(
  ( (Unit!44967) )
))
(declare-fun lt!601595 () Unit!44966)

(declare-fun lemmaListSubSeqRefl!0 (List!31891) Unit!44966)

(assert (=> b!1365892 (= lt!601595 (lemmaListSubSeqRefl!0 (_2!12236 lt!601594)))))

(declare-fun get!22761 (Option!787) tuple2!24450)

(assert (=> b!1365892 (= lt!601594 (get!22761 lt!601596))))

(assert (= (and start!115534 res!908685) b!1365892))

(declare-fun m!1250971 () Bool)

(assert (=> start!115534 m!1250971))

(declare-fun m!1250973 () Bool)

(assert (=> start!115534 m!1250973))

(declare-fun m!1250975 () Bool)

(assert (=> b!1365892 m!1250975))

(declare-fun m!1250977 () Bool)

(assert (=> b!1365892 m!1250977))

(declare-fun m!1250979 () Bool)

(assert (=> b!1365892 m!1250979))

(declare-fun m!1250981 () Bool)

(assert (=> b!1365892 m!1250981))

(check-sat (not b!1365892) (not start!115534))
(check-sat)
(get-model)

(declare-fun d!146951 () Bool)

(declare-fun res!908711 () Bool)

(declare-fun e!774752 () Bool)

(assert (=> d!146951 (=> res!908711 e!774752)))

(get-info :version)

(assert (=> d!146951 (= res!908711 ((_ is Nil!31888) l!3677))))

(assert (=> d!146951 (= (subseq!941 l!3677 l!3677) e!774752)))

(declare-fun b!1365918 () Bool)

(declare-fun e!774753 () Bool)

(assert (=> b!1365918 (= e!774753 (subseq!941 l!3677 (t!46577 l!3677)))))

(declare-fun b!1365915 () Bool)

(declare-fun e!774750 () Bool)

(assert (=> b!1365915 (= e!774752 e!774750)))

(declare-fun res!908708 () Bool)

(assert (=> b!1365915 (=> (not res!908708) (not e!774750))))

(assert (=> b!1365915 (= res!908708 ((_ is Cons!31887) l!3677))))

(declare-fun b!1365916 () Bool)

(assert (=> b!1365916 (= e!774750 e!774753)))

(declare-fun res!908709 () Bool)

(assert (=> b!1365916 (=> res!908709 e!774753)))

(declare-fun e!774751 () Bool)

(assert (=> b!1365916 (= res!908709 e!774751)))

(declare-fun res!908710 () Bool)

(assert (=> b!1365916 (=> (not res!908710) (not e!774751))))

(assert (=> b!1365916 (= res!908710 (= (h!33105 l!3677) (h!33105 l!3677)))))

(declare-fun b!1365917 () Bool)

(assert (=> b!1365917 (= e!774751 (subseq!941 (t!46577 l!3677) (t!46577 l!3677)))))

(assert (= (and d!146951 (not res!908711)) b!1365915))

(assert (= (and b!1365915 res!908708) b!1365916))

(assert (= (and b!1365916 res!908710) b!1365917))

(assert (= (and b!1365916 (not res!908709)) b!1365918))

(declare-fun m!1251007 () Bool)

(assert (=> b!1365918 m!1251007))

(declare-fun m!1251009 () Bool)

(assert (=> b!1365917 m!1251009))

(assert (=> b!1365892 d!146951))

(declare-fun d!146961 () Bool)

(declare-fun res!908723 () Bool)

(declare-fun e!774764 () Bool)

(assert (=> d!146961 (=> res!908723 e!774764)))

(assert (=> d!146961 (= res!908723 ((_ is Nil!31888) (_2!12236 lt!601594)))))

(assert (=> d!146961 (= (subseq!941 (_2!12236 lt!601594) (_2!12236 lt!601594)) e!774764)))

(declare-fun b!1365930 () Bool)

(declare-fun e!774765 () Bool)

(assert (=> b!1365930 (= e!774765 (subseq!941 (_2!12236 lt!601594) (t!46577 (_2!12236 lt!601594))))))

(declare-fun b!1365927 () Bool)

(declare-fun e!774762 () Bool)

(assert (=> b!1365927 (= e!774764 e!774762)))

(declare-fun res!908720 () Bool)

(assert (=> b!1365927 (=> (not res!908720) (not e!774762))))

(assert (=> b!1365927 (= res!908720 ((_ is Cons!31887) (_2!12236 lt!601594)))))

(declare-fun b!1365928 () Bool)

(assert (=> b!1365928 (= e!774762 e!774765)))

(declare-fun res!908721 () Bool)

(assert (=> b!1365928 (=> res!908721 e!774765)))

(declare-fun e!774763 () Bool)

(assert (=> b!1365928 (= res!908721 e!774763)))

(declare-fun res!908722 () Bool)

(assert (=> b!1365928 (=> (not res!908722) (not e!774763))))

(assert (=> b!1365928 (= res!908722 (= (h!33105 (_2!12236 lt!601594)) (h!33105 (_2!12236 lt!601594))))))

(declare-fun b!1365929 () Bool)

(assert (=> b!1365929 (= e!774763 (subseq!941 (t!46577 (_2!12236 lt!601594)) (t!46577 (_2!12236 lt!601594))))))

(assert (= (and d!146961 (not res!908723)) b!1365927))

(assert (= (and b!1365927 res!908720) b!1365928))

(assert (= (and b!1365928 res!908722) b!1365929))

(assert (= (and b!1365928 (not res!908721)) b!1365930))

(declare-fun m!1251011 () Bool)

(assert (=> b!1365930 m!1251011))

(declare-fun m!1251013 () Bool)

(assert (=> b!1365929 m!1251013))

(assert (=> b!1365892 d!146961))

(declare-fun d!146963 () Bool)

(assert (=> d!146963 (subseq!941 (_2!12236 lt!601594) (_2!12236 lt!601594))))

(declare-fun lt!601617 () Unit!44966)

(declare-fun choose!36 (List!31891) Unit!44966)

(assert (=> d!146963 (= lt!601617 (choose!36 (_2!12236 lt!601594)))))

(assert (=> d!146963 (= (lemmaListSubSeqRefl!0 (_2!12236 lt!601594)) lt!601617)))

(declare-fun bs!39166 () Bool)

(assert (= bs!39166 d!146963))

(assert (=> bs!39166 m!1250977))

(declare-fun m!1251023 () Bool)

(assert (=> bs!39166 m!1251023))

(assert (=> b!1365892 d!146963))

(declare-fun d!146969 () Bool)

(assert (=> d!146969 (= (get!22761 lt!601596) (v!21586 lt!601596))))

(assert (=> b!1365892 d!146969))

(declare-fun d!146975 () Bool)

(assert (=> d!146975 (= (isEmpty!1119 lt!601596) (not ((_ is Some!786) lt!601596)))))

(assert (=> start!115534 d!146975))

(declare-fun d!146979 () Bool)

(assert (=> d!146979 (= (unapply!58 l!3677) (ite ((_ is Nil!31888) l!3677) None!785 (Some!786 (tuple2!24451 (h!33105 l!3677) (t!46577 l!3677)))))))

(assert (=> start!115534 d!146979))

(check-sat (not b!1365930) (not b!1365917) (not b!1365918) (not d!146963) (not b!1365929))
(check-sat)
