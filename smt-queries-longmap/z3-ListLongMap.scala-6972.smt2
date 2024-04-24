; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88410 () Bool)

(assert start!88410)

(declare-fun b!1017947 () Bool)

(assert (=> b!1017947 true))

(assert (=> b!1017947 true))

(declare-fun b!1017946 () Bool)

(declare-fun e!572769 () Bool)

(declare-datatypes ((List!21518 0))(
  ( (Nil!21515) (Cons!21514 (h!22721 (_ BitVec 64)) (t!30511 List!21518)) )
))
(declare-fun keys!40 () List!21518)

(declare-fun lambda!1030 () Int)

(declare-fun forall!285 (List!21518 Int) Bool)

(assert (=> b!1017946 (= e!572769 (not (forall!285 (t!30511 keys!40) lambda!1030)))))

(declare-datatypes ((B!1538 0))(
  ( (B!1539 (val!11853 Int)) )
))
(declare-datatypes ((tuple2!15256 0))(
  ( (tuple2!15257 (_1!7639 (_ BitVec 64)) (_2!7639 B!1538)) )
))
(declare-datatypes ((List!21519 0))(
  ( (Nil!21516) (Cons!21515 (h!22722 tuple2!15256) (t!30512 List!21519)) )
))
(declare-fun lt!449805 () List!21519)

(declare-datatypes ((Option!602 0))(
  ( (Some!601 (v!14452 B!1538)) (None!600) )
))
(declare-fun isDefined!403 (Option!602) Bool)

(declare-fun getValueByKey!551 (List!21519 (_ BitVec 64)) Option!602)

(assert (=> b!1017946 (isDefined!403 (getValueByKey!551 lt!449805 (h!22721 keys!40)))))

(declare-datatypes ((Unit!33252 0))(
  ( (Unit!33253) )
))
(declare-fun lt!449807 () Unit!33252)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!383 (List!21519 (_ BitVec 64)) Unit!33252)

(assert (=> b!1017946 (= lt!449807 (lemmaContainsKeyImpliesGetValueByKeyDefined!383 lt!449805 (h!22721 keys!40)))))

(declare-fun newHead!31 () tuple2!15256)

(declare-fun l!1114 () List!21519)

(assert (=> b!1017946 (= lt!449805 (Cons!21515 newHead!31 l!1114))))

(declare-fun containsKey!495 (List!21519 (_ BitVec 64)) Bool)

(assert (=> b!1017946 (containsKey!495 l!1114 (h!22721 keys!40))))

(declare-fun lt!449806 () Unit!33252)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!13 (List!21519 (_ BitVec 64)) Unit!33252)

(assert (=> b!1017946 (= lt!449806 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!13 l!1114 (h!22721 keys!40)))))

(declare-fun res!682408 () Bool)

(assert (=> b!1017947 (=> (not res!682408) (not e!572769))))

(assert (=> b!1017947 (= res!682408 (forall!285 keys!40 lambda!1030))))

(declare-fun res!682410 () Bool)

(assert (=> start!88410 (=> (not res!682410) (not e!572769))))

(declare-fun isStrictlySorted!609 (List!21519) Bool)

(assert (=> start!88410 (= res!682410 (isStrictlySorted!609 l!1114))))

(assert (=> start!88410 e!572769))

(declare-fun e!572770 () Bool)

(assert (=> start!88410 e!572770))

(assert (=> start!88410 true))

(declare-fun tp_is_empty!23605 () Bool)

(assert (=> start!88410 tp_is_empty!23605))

(declare-fun b!1017948 () Bool)

(declare-fun res!682406 () Bool)

(assert (=> b!1017948 (=> (not res!682406) (not e!572769))))

(declare-fun head!966 (List!21519) tuple2!15256)

(assert (=> b!1017948 (= res!682406 (bvslt (_1!7639 newHead!31) (_1!7639 (head!966 l!1114))))))

(declare-fun b!1017949 () Bool)

(declare-fun res!682409 () Bool)

(assert (=> b!1017949 (=> (not res!682409) (not e!572769))))

(declare-fun isEmpty!890 (List!21519) Bool)

(assert (=> b!1017949 (= res!682409 (not (isEmpty!890 l!1114)))))

(declare-fun b!1017950 () Bool)

(declare-fun res!682407 () Bool)

(assert (=> b!1017950 (=> (not res!682407) (not e!572769))))

(get-info :version)

(assert (=> b!1017950 (= res!682407 ((_ is Cons!21514) keys!40))))

(declare-fun b!1017951 () Bool)

(declare-fun tp!70793 () Bool)

(assert (=> b!1017951 (= e!572770 (and tp_is_empty!23605 tp!70793))))

(assert (= (and start!88410 res!682410) b!1017949))

(assert (= (and b!1017949 res!682409) b!1017947))

(assert (= (and b!1017947 res!682408) b!1017948))

(assert (= (and b!1017948 res!682406) b!1017950))

(assert (= (and b!1017950 res!682407) b!1017946))

(assert (= (and start!88410 ((_ is Cons!21515) l!1114)) b!1017951))

(declare-fun m!939873 () Bool)

(assert (=> b!1017946 m!939873))

(declare-fun m!939875 () Bool)

(assert (=> b!1017946 m!939875))

(declare-fun m!939877 () Bool)

(assert (=> b!1017946 m!939877))

(declare-fun m!939879 () Bool)

(assert (=> b!1017946 m!939879))

(declare-fun m!939881 () Bool)

(assert (=> b!1017946 m!939881))

(assert (=> b!1017946 m!939873))

(declare-fun m!939883 () Bool)

(assert (=> b!1017946 m!939883))

(declare-fun m!939885 () Bool)

(assert (=> start!88410 m!939885))

(declare-fun m!939887 () Bool)

(assert (=> b!1017948 m!939887))

(declare-fun m!939889 () Bool)

(assert (=> b!1017949 m!939889))

(declare-fun m!939891 () Bool)

(assert (=> b!1017947 m!939891))

(check-sat (not b!1017947) (not b!1017951) tp_is_empty!23605 (not b!1017948) (not b!1017949) (not start!88410) (not b!1017946))
(check-sat)
(get-model)

(declare-fun d!121777 () Bool)

(declare-fun res!682445 () Bool)

(declare-fun e!572787 () Bool)

(assert (=> d!121777 (=> res!682445 e!572787)))

(assert (=> d!121777 (= res!682445 ((_ is Nil!21515) keys!40))))

(assert (=> d!121777 (= (forall!285 keys!40 lambda!1030) e!572787)))

(declare-fun b!1018004 () Bool)

(declare-fun e!572788 () Bool)

(assert (=> b!1018004 (= e!572787 e!572788)))

(declare-fun res!682446 () Bool)

(assert (=> b!1018004 (=> (not res!682446) (not e!572788))))

(declare-fun dynLambda!1942 (Int (_ BitVec 64)) Bool)

(assert (=> b!1018004 (= res!682446 (dynLambda!1942 lambda!1030 (h!22721 keys!40)))))

(declare-fun b!1018005 () Bool)

(assert (=> b!1018005 (= e!572788 (forall!285 (t!30511 keys!40) lambda!1030))))

(assert (= (and d!121777 (not res!682445)) b!1018004))

(assert (= (and b!1018004 res!682446) b!1018005))

(declare-fun b_lambda!15541 () Bool)

(assert (=> (not b_lambda!15541) (not b!1018004)))

(declare-fun m!939933 () Bool)

(assert (=> b!1018004 m!939933))

(assert (=> b!1018005 m!939879))

(assert (=> b!1017947 d!121777))

(declare-fun d!121783 () Bool)

(declare-fun res!682461 () Bool)

(declare-fun e!572803 () Bool)

(assert (=> d!121783 (=> res!682461 e!572803)))

(assert (=> d!121783 (= res!682461 (and ((_ is Cons!21515) l!1114) (= (_1!7639 (h!22722 l!1114)) (h!22721 keys!40))))))

(assert (=> d!121783 (= (containsKey!495 l!1114 (h!22721 keys!40)) e!572803)))

(declare-fun b!1018020 () Bool)

(declare-fun e!572804 () Bool)

(assert (=> b!1018020 (= e!572803 e!572804)))

(declare-fun res!682462 () Bool)

(assert (=> b!1018020 (=> (not res!682462) (not e!572804))))

(assert (=> b!1018020 (= res!682462 (and (or (not ((_ is Cons!21515) l!1114)) (bvsle (_1!7639 (h!22722 l!1114)) (h!22721 keys!40))) ((_ is Cons!21515) l!1114) (bvslt (_1!7639 (h!22722 l!1114)) (h!22721 keys!40))))))

(declare-fun b!1018021 () Bool)

(assert (=> b!1018021 (= e!572804 (containsKey!495 (t!30512 l!1114) (h!22721 keys!40)))))

(assert (= (and d!121783 (not res!682461)) b!1018020))

(assert (= (and b!1018020 res!682462) b!1018021))

(declare-fun m!939937 () Bool)

(assert (=> b!1018021 m!939937))

(assert (=> b!1017946 d!121783))

(declare-fun b!1018042 () Bool)

(declare-fun e!572816 () Option!602)

(assert (=> b!1018042 (= e!572816 (getValueByKey!551 (t!30512 lt!449805) (h!22721 keys!40)))))

(declare-fun b!1018040 () Bool)

(declare-fun e!572815 () Option!602)

(assert (=> b!1018040 (= e!572815 (Some!601 (_2!7639 (h!22722 lt!449805))))))

(declare-fun d!121787 () Bool)

(declare-fun c!103364 () Bool)

(assert (=> d!121787 (= c!103364 (and ((_ is Cons!21515) lt!449805) (= (_1!7639 (h!22722 lt!449805)) (h!22721 keys!40))))))

(assert (=> d!121787 (= (getValueByKey!551 lt!449805 (h!22721 keys!40)) e!572815)))

(declare-fun b!1018041 () Bool)

(assert (=> b!1018041 (= e!572815 e!572816)))

(declare-fun c!103365 () Bool)

(assert (=> b!1018041 (= c!103365 (and ((_ is Cons!21515) lt!449805) (not (= (_1!7639 (h!22722 lt!449805)) (h!22721 keys!40)))))))

(declare-fun b!1018043 () Bool)

(assert (=> b!1018043 (= e!572816 None!600)))

(assert (= (and d!121787 c!103364) b!1018040))

(assert (= (and d!121787 (not c!103364)) b!1018041))

(assert (= (and b!1018041 c!103365) b!1018042))

(assert (= (and b!1018041 (not c!103365)) b!1018043))

(declare-fun m!939941 () Bool)

(assert (=> b!1018042 m!939941))

(assert (=> b!1017946 d!121787))

(declare-fun d!121791 () Bool)

(assert (=> d!121791 (containsKey!495 l!1114 (h!22721 keys!40))))

(declare-fun lt!449828 () Unit!33252)

(declare-fun choose!1655 (List!21519 (_ BitVec 64)) Unit!33252)

(assert (=> d!121791 (= lt!449828 (choose!1655 l!1114 (h!22721 keys!40)))))

(declare-fun e!572825 () Bool)

(assert (=> d!121791 e!572825))

(declare-fun res!682471 () Bool)

(assert (=> d!121791 (=> (not res!682471) (not e!572825))))

(assert (=> d!121791 (= res!682471 (isStrictlySorted!609 l!1114))))

(assert (=> d!121791 (= (lemmaGetValueByKeyIsDefinedImpliesContainsKey!13 l!1114 (h!22721 keys!40)) lt!449828)))

(declare-fun b!1018054 () Bool)

(assert (=> b!1018054 (= e!572825 (isDefined!403 (getValueByKey!551 l!1114 (h!22721 keys!40))))))

(assert (= (and d!121791 res!682471) b!1018054))

(assert (=> d!121791 m!939883))

(declare-fun m!939945 () Bool)

(assert (=> d!121791 m!939945))

(assert (=> d!121791 m!939885))

(declare-fun m!939947 () Bool)

(assert (=> b!1018054 m!939947))

(assert (=> b!1018054 m!939947))

(declare-fun m!939949 () Bool)

(assert (=> b!1018054 m!939949))

(assert (=> b!1017946 d!121791))

(declare-fun d!121797 () Bool)

(declare-fun isEmpty!893 (Option!602) Bool)

(assert (=> d!121797 (= (isDefined!403 (getValueByKey!551 lt!449805 (h!22721 keys!40))) (not (isEmpty!893 (getValueByKey!551 lt!449805 (h!22721 keys!40)))))))

(declare-fun bs!29547 () Bool)

(assert (= bs!29547 d!121797))

(assert (=> bs!29547 m!939873))

(declare-fun m!939951 () Bool)

(assert (=> bs!29547 m!939951))

(assert (=> b!1017946 d!121797))

(declare-fun d!121799 () Bool)

(declare-fun res!682474 () Bool)

(declare-fun e!572828 () Bool)

(assert (=> d!121799 (=> res!682474 e!572828)))

(assert (=> d!121799 (= res!682474 ((_ is Nil!21515) (t!30511 keys!40)))))

(assert (=> d!121799 (= (forall!285 (t!30511 keys!40) lambda!1030) e!572828)))

(declare-fun b!1018057 () Bool)

(declare-fun e!572829 () Bool)

(assert (=> b!1018057 (= e!572828 e!572829)))

(declare-fun res!682475 () Bool)

(assert (=> b!1018057 (=> (not res!682475) (not e!572829))))

(assert (=> b!1018057 (= res!682475 (dynLambda!1942 lambda!1030 (h!22721 (t!30511 keys!40))))))

(declare-fun b!1018058 () Bool)

(assert (=> b!1018058 (= e!572829 (forall!285 (t!30511 (t!30511 keys!40)) lambda!1030))))

(assert (= (and d!121799 (not res!682474)) b!1018057))

(assert (= (and b!1018057 res!682475) b!1018058))

(declare-fun b_lambda!15545 () Bool)

(assert (=> (not b_lambda!15545) (not b!1018057)))

(declare-fun m!939955 () Bool)

(assert (=> b!1018057 m!939955))

(declare-fun m!939957 () Bool)

(assert (=> b!1018058 m!939957))

(assert (=> b!1017946 d!121799))

(declare-fun d!121803 () Bool)

(assert (=> d!121803 (isDefined!403 (getValueByKey!551 lt!449805 (h!22721 keys!40)))))

(declare-fun lt!449834 () Unit!33252)

(declare-fun choose!1657 (List!21519 (_ BitVec 64)) Unit!33252)

(assert (=> d!121803 (= lt!449834 (choose!1657 lt!449805 (h!22721 keys!40)))))

(declare-fun e!572841 () Bool)

(assert (=> d!121803 e!572841))

(declare-fun res!682481 () Bool)

(assert (=> d!121803 (=> (not res!682481) (not e!572841))))

(assert (=> d!121803 (= res!682481 (isStrictlySorted!609 lt!449805))))

(assert (=> d!121803 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!383 lt!449805 (h!22721 keys!40)) lt!449834)))

(declare-fun b!1018076 () Bool)

(assert (=> b!1018076 (= e!572841 (containsKey!495 lt!449805 (h!22721 keys!40)))))

(assert (= (and d!121803 res!682481) b!1018076))

(assert (=> d!121803 m!939873))

(assert (=> d!121803 m!939873))

(assert (=> d!121803 m!939875))

(declare-fun m!939967 () Bool)

(assert (=> d!121803 m!939967))

(declare-fun m!939969 () Bool)

(assert (=> d!121803 m!939969))

(declare-fun m!939971 () Bool)

(assert (=> b!1018076 m!939971))

(assert (=> b!1017946 d!121803))

(declare-fun d!121809 () Bool)

(declare-fun res!682488 () Bool)

(declare-fun e!572848 () Bool)

(assert (=> d!121809 (=> res!682488 e!572848)))

(assert (=> d!121809 (= res!682488 (or ((_ is Nil!21516) l!1114) ((_ is Nil!21516) (t!30512 l!1114))))))

(assert (=> d!121809 (= (isStrictlySorted!609 l!1114) e!572848)))

(declare-fun b!1018083 () Bool)

(declare-fun e!572849 () Bool)

(assert (=> b!1018083 (= e!572848 e!572849)))

(declare-fun res!682489 () Bool)

(assert (=> b!1018083 (=> (not res!682489) (not e!572849))))

(assert (=> b!1018083 (= res!682489 (bvslt (_1!7639 (h!22722 l!1114)) (_1!7639 (h!22722 (t!30512 l!1114)))))))

(declare-fun b!1018084 () Bool)

(assert (=> b!1018084 (= e!572849 (isStrictlySorted!609 (t!30512 l!1114)))))

(assert (= (and d!121809 (not res!682488)) b!1018083))

(assert (= (and b!1018083 res!682489) b!1018084))

(declare-fun m!939977 () Bool)

(assert (=> b!1018084 m!939977))

(assert (=> start!88410 d!121809))

(declare-fun d!121815 () Bool)

(assert (=> d!121815 (= (head!966 l!1114) (h!22722 l!1114))))

(assert (=> b!1017948 d!121815))

(declare-fun d!121817 () Bool)

(assert (=> d!121817 (= (isEmpty!890 l!1114) ((_ is Nil!21516) l!1114))))

(assert (=> b!1017949 d!121817))

(declare-fun b!1018092 () Bool)

(declare-fun e!572855 () Bool)

(declare-fun tp!70802 () Bool)

(assert (=> b!1018092 (= e!572855 (and tp_is_empty!23605 tp!70802))))

(assert (=> b!1017951 (= tp!70793 e!572855)))

(assert (= (and b!1017951 ((_ is Cons!21515) (t!30512 l!1114))) b!1018092))

(declare-fun b_lambda!15547 () Bool)

(assert (= b_lambda!15545 (or b!1017947 b_lambda!15547)))

(declare-fun bs!29550 () Bool)

(declare-fun d!121821 () Bool)

(assert (= bs!29550 (and d!121821 b!1017947)))

(declare-fun value!178 () B!1538)

(assert (=> bs!29550 (= (dynLambda!1942 lambda!1030 (h!22721 (t!30511 keys!40))) (= (getValueByKey!551 l!1114 (h!22721 (t!30511 keys!40))) (Some!601 value!178)))))

(declare-fun m!939985 () Bool)

(assert (=> bs!29550 m!939985))

(assert (=> b!1018057 d!121821))

(declare-fun b_lambda!15549 () Bool)

(assert (= b_lambda!15541 (or b!1017947 b_lambda!15549)))

(declare-fun bs!29551 () Bool)

(declare-fun d!121823 () Bool)

(assert (= bs!29551 (and d!121823 b!1017947)))

(assert (=> bs!29551 (= (dynLambda!1942 lambda!1030 (h!22721 keys!40)) (= (getValueByKey!551 l!1114 (h!22721 keys!40)) (Some!601 value!178)))))

(assert (=> bs!29551 m!939947))

(assert (=> b!1018004 d!121823))

(check-sat (not b!1018092) (not b!1018084) tp_is_empty!23605 (not b!1018076) (not b_lambda!15547) (not bs!29550) (not b!1018058) (not b!1018054) (not d!121797) (not b!1018005) (not bs!29551) (not b!1018021) (not b_lambda!15549) (not d!121791) (not b!1018042) (not d!121803))
(check-sat)
