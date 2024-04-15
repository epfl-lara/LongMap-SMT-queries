; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115300 () Bool)

(assert start!115300)

(declare-fun res!908138 () Bool)

(declare-fun e!773850 () Bool)

(assert (=> start!115300 (=> (not res!908138) (not e!773850))))

(declare-datatypes ((List!31904 0))(
  ( (Nil!31901) (Cons!31900 (h!33109 (_ BitVec 64)) (t!46590 List!31904)) )
))
(declare-datatypes ((tuple2!24468 0))(
  ( (tuple2!24469 (_1!12245 (_ BitVec 64)) (_2!12245 List!31904)) )
))
(declare-datatypes ((Option!794 0))(
  ( (Some!793 (v!21590 tuple2!24468)) (None!792) )
))
(declare-fun lt!600931 () Option!794)

(declare-fun isEmpty!1121 (Option!794) Bool)

(assert (=> start!115300 (= res!908138 (not (isEmpty!1121 lt!600931)))))

(declare-fun l!3677 () List!31904)

(declare-fun unapply!58 (List!31904) Option!794)

(assert (=> start!115300 (= lt!600931 (unapply!58 l!3677))))

(assert (=> start!115300 e!773850))

(assert (=> start!115300 true))

(declare-fun b!1364521 () Bool)

(declare-fun subseq!941 (List!31904 List!31904) Bool)

(assert (=> b!1364521 (= e!773850 (not (subseq!941 l!3677 l!3677)))))

(declare-fun lt!600932 () tuple2!24468)

(assert (=> b!1364521 (subseq!941 (_2!12245 lt!600932) (_2!12245 lt!600932))))

(declare-datatypes ((Unit!44868 0))(
  ( (Unit!44869) )
))
(declare-fun lt!600933 () Unit!44868)

(declare-fun lemmaListSubSeqRefl!0 (List!31904) Unit!44868)

(assert (=> b!1364521 (= lt!600933 (lemmaListSubSeqRefl!0 (_2!12245 lt!600932)))))

(declare-fun get!22717 (Option!794) tuple2!24468)

(assert (=> b!1364521 (= lt!600932 (get!22717 lt!600931))))

(assert (= (and start!115300 res!908138) b!1364521))

(declare-fun m!1248853 () Bool)

(assert (=> start!115300 m!1248853))

(declare-fun m!1248855 () Bool)

(assert (=> start!115300 m!1248855))

(declare-fun m!1248857 () Bool)

(assert (=> b!1364521 m!1248857))

(declare-fun m!1248859 () Bool)

(assert (=> b!1364521 m!1248859))

(declare-fun m!1248861 () Bool)

(assert (=> b!1364521 m!1248861))

(declare-fun m!1248863 () Bool)

(assert (=> b!1364521 m!1248863))

(check-sat (not b!1364521) (not start!115300))
(check-sat)
(get-model)

(declare-fun b!1364537 () Bool)

(declare-fun e!773865 () Bool)

(declare-fun e!773868 () Bool)

(assert (=> b!1364537 (= e!773865 e!773868)))

(declare-fun res!908153 () Bool)

(assert (=> b!1364537 (=> res!908153 e!773868)))

(declare-fun e!773867 () Bool)

(assert (=> b!1364537 (= res!908153 e!773867)))

(declare-fun res!908155 () Bool)

(assert (=> b!1364537 (=> (not res!908155) (not e!773867))))

(assert (=> b!1364537 (= res!908155 (= (h!33109 l!3677) (h!33109 l!3677)))))

(declare-fun b!1364536 () Bool)

(declare-fun e!773866 () Bool)

(assert (=> b!1364536 (= e!773866 e!773865)))

(declare-fun res!908154 () Bool)

(assert (=> b!1364536 (=> (not res!908154) (not e!773865))))

(get-info :version)

(assert (=> b!1364536 (= res!908154 ((_ is Cons!31900) l!3677))))

(declare-fun b!1364539 () Bool)

(assert (=> b!1364539 (= e!773868 (subseq!941 l!3677 (t!46590 l!3677)))))

(declare-fun d!146379 () Bool)

(declare-fun res!908156 () Bool)

(assert (=> d!146379 (=> res!908156 e!773866)))

(assert (=> d!146379 (= res!908156 ((_ is Nil!31901) l!3677))))

(assert (=> d!146379 (= (subseq!941 l!3677 l!3677) e!773866)))

(declare-fun b!1364538 () Bool)

(assert (=> b!1364538 (= e!773867 (subseq!941 (t!46590 l!3677) (t!46590 l!3677)))))

(assert (= (and d!146379 (not res!908156)) b!1364536))

(assert (= (and b!1364536 res!908154) b!1364537))

(assert (= (and b!1364537 res!908155) b!1364538))

(assert (= (and b!1364537 (not res!908153)) b!1364539))

(declare-fun m!1248889 () Bool)

(assert (=> b!1364539 m!1248889))

(declare-fun m!1248891 () Bool)

(assert (=> b!1364538 m!1248891))

(assert (=> b!1364521 d!146379))

(declare-fun b!1364541 () Bool)

(declare-fun e!773869 () Bool)

(declare-fun e!773872 () Bool)

(assert (=> b!1364541 (= e!773869 e!773872)))

(declare-fun res!908157 () Bool)

(assert (=> b!1364541 (=> res!908157 e!773872)))

(declare-fun e!773871 () Bool)

(assert (=> b!1364541 (= res!908157 e!773871)))

(declare-fun res!908159 () Bool)

(assert (=> b!1364541 (=> (not res!908159) (not e!773871))))

(assert (=> b!1364541 (= res!908159 (= (h!33109 (_2!12245 lt!600932)) (h!33109 (_2!12245 lt!600932))))))

(declare-fun b!1364540 () Bool)

(declare-fun e!773870 () Bool)

(assert (=> b!1364540 (= e!773870 e!773869)))

(declare-fun res!908158 () Bool)

(assert (=> b!1364540 (=> (not res!908158) (not e!773869))))

(assert (=> b!1364540 (= res!908158 ((_ is Cons!31900) (_2!12245 lt!600932)))))

(declare-fun b!1364543 () Bool)

(assert (=> b!1364543 (= e!773872 (subseq!941 (_2!12245 lt!600932) (t!46590 (_2!12245 lt!600932))))))

(declare-fun d!146389 () Bool)

(declare-fun res!908160 () Bool)

(assert (=> d!146389 (=> res!908160 e!773870)))

(assert (=> d!146389 (= res!908160 ((_ is Nil!31901) (_2!12245 lt!600932)))))

(assert (=> d!146389 (= (subseq!941 (_2!12245 lt!600932) (_2!12245 lt!600932)) e!773870)))

(declare-fun b!1364542 () Bool)

(assert (=> b!1364542 (= e!773871 (subseq!941 (t!46590 (_2!12245 lt!600932)) (t!46590 (_2!12245 lt!600932))))))

(assert (= (and d!146389 (not res!908160)) b!1364540))

(assert (= (and b!1364540 res!908158) b!1364541))

(assert (= (and b!1364541 res!908159) b!1364542))

(assert (= (and b!1364541 (not res!908157)) b!1364543))

(declare-fun m!1248893 () Bool)

(assert (=> b!1364543 m!1248893))

(declare-fun m!1248895 () Bool)

(assert (=> b!1364542 m!1248895))

(assert (=> b!1364521 d!146389))

(declare-fun d!146391 () Bool)

(assert (=> d!146391 (subseq!941 (_2!12245 lt!600932) (_2!12245 lt!600932))))

(declare-fun lt!600954 () Unit!44868)

(declare-fun choose!36 (List!31904) Unit!44868)

(assert (=> d!146391 (= lt!600954 (choose!36 (_2!12245 lt!600932)))))

(assert (=> d!146391 (= (lemmaListSubSeqRefl!0 (_2!12245 lt!600932)) lt!600954)))

(declare-fun bs!39122 () Bool)

(assert (= bs!39122 d!146391))

(assert (=> bs!39122 m!1248859))

(declare-fun m!1248897 () Bool)

(assert (=> bs!39122 m!1248897))

(assert (=> b!1364521 d!146391))

(declare-fun d!146397 () Bool)

(assert (=> d!146397 (= (get!22717 lt!600931) (v!21590 lt!600931))))

(assert (=> b!1364521 d!146397))

(declare-fun d!146399 () Bool)

(assert (=> d!146399 (= (isEmpty!1121 lt!600931) (not ((_ is Some!793) lt!600931)))))

(assert (=> start!115300 d!146399))

(declare-fun d!146401 () Bool)

(assert (=> d!146401 (= (unapply!58 l!3677) (ite ((_ is Nil!31901) l!3677) None!792 (Some!793 (tuple2!24469 (h!33109 l!3677) (t!46590 l!3677)))))))

(assert (=> start!115300 d!146401))

(check-sat (not b!1364539) (not b!1364538) (not b!1364542) (not d!146391) (not b!1364543))
(check-sat)
