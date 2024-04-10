; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88476 () Bool)

(assert start!88476)

(declare-fun b!1017762 () Bool)

(declare-fun res!682561 () Bool)

(declare-fun e!572612 () Bool)

(assert (=> b!1017762 (=> (not res!682561) (not e!572612))))

(declare-datatypes ((B!1600 0))(
  ( (B!1601 (val!11884 Int)) )
))
(declare-datatypes ((tuple2!15314 0))(
  ( (tuple2!15315 (_1!7668 (_ BitVec 64)) (_2!7668 B!1600)) )
))
(declare-datatypes ((List!21572 0))(
  ( (Nil!21569) (Cons!21568 (h!22766 tuple2!15314) (t!30573 List!21572)) )
))
(declare-fun l!1036 () List!21572)

(declare-fun isStrictlySorted!643 (List!21572) Bool)

(assert (=> b!1017762 (= res!682561 (isStrictlySorted!643 (t!30573 l!1036)))))

(declare-fun b!1017763 () Bool)

(declare-fun ListPrimitiveSize!131 (List!21572) Int)

(assert (=> b!1017763 (= e!572612 (>= (ListPrimitiveSize!131 (t!30573 l!1036)) (ListPrimitiveSize!131 l!1036)))))

(declare-fun b!1017764 () Bool)

(declare-fun e!572613 () Bool)

(declare-fun tp_is_empty!23667 () Bool)

(declare-fun tp!70939 () Bool)

(assert (=> b!1017764 (= e!572613 (and tp_is_empty!23667 tp!70939))))

(declare-fun b!1017765 () Bool)

(declare-fun res!682564 () Bool)

(assert (=> b!1017765 (=> (not res!682564) (not e!572612))))

(declare-fun key!271 () (_ BitVec 64))

(declare-datatypes ((Option!627 0))(
  ( (Some!626 (v!14477 B!1600)) (None!625) )
))
(declare-fun isDefined!423 (Option!627) Bool)

(declare-fun getValueByKey!576 (List!21572 (_ BitVec 64)) Option!627)

(assert (=> b!1017765 (= res!682564 (isDefined!423 (getValueByKey!576 (t!30573 l!1036) key!271)))))

(declare-fun b!1017766 () Bool)

(declare-fun res!682563 () Bool)

(assert (=> b!1017766 (=> (not res!682563) (not e!572612))))

(get-info :version)

(assert (=> b!1017766 (= res!682563 (and ((_ is Cons!21568) l!1036) (not (= (_1!7668 (h!22766 l!1036)) key!271))))))

(declare-fun b!1017767 () Bool)

(declare-fun res!682562 () Bool)

(assert (=> b!1017767 (=> (not res!682562) (not e!572612))))

(assert (=> b!1017767 (= res!682562 (isDefined!423 (getValueByKey!576 l!1036 key!271)))))

(declare-fun res!682565 () Bool)

(assert (=> start!88476 (=> (not res!682565) (not e!572612))))

(assert (=> start!88476 (= res!682565 (isStrictlySorted!643 l!1036))))

(assert (=> start!88476 e!572612))

(assert (=> start!88476 e!572613))

(assert (=> start!88476 true))

(assert (= (and start!88476 res!682565) b!1017767))

(assert (= (and b!1017767 res!682562) b!1017766))

(assert (= (and b!1017766 res!682563) b!1017762))

(assert (= (and b!1017762 res!682561) b!1017765))

(assert (= (and b!1017765 res!682564) b!1017763))

(assert (= (and start!88476 ((_ is Cons!21568) l!1036)) b!1017764))

(declare-fun m!938957 () Bool)

(assert (=> b!1017762 m!938957))

(declare-fun m!938959 () Bool)

(assert (=> b!1017767 m!938959))

(assert (=> b!1017767 m!938959))

(declare-fun m!938961 () Bool)

(assert (=> b!1017767 m!938961))

(declare-fun m!938963 () Bool)

(assert (=> b!1017765 m!938963))

(assert (=> b!1017765 m!938963))

(declare-fun m!938965 () Bool)

(assert (=> b!1017765 m!938965))

(declare-fun m!938967 () Bool)

(assert (=> start!88476 m!938967))

(declare-fun m!938969 () Bool)

(assert (=> b!1017763 m!938969))

(declare-fun m!938971 () Bool)

(assert (=> b!1017763 m!938971))

(check-sat (not b!1017767) (not b!1017763) tp_is_empty!23667 (not b!1017765) (not b!1017764) (not b!1017762) (not start!88476))
(check-sat)
(get-model)

(declare-fun d!121697 () Bool)

(declare-fun lt!449477 () Int)

(assert (=> d!121697 (>= lt!449477 0)))

(declare-fun e!572648 () Int)

(assert (=> d!121697 (= lt!449477 e!572648)))

(declare-fun c!103072 () Bool)

(assert (=> d!121697 (= c!103072 ((_ is Nil!21569) (t!30573 l!1036)))))

(assert (=> d!121697 (= (ListPrimitiveSize!131 (t!30573 l!1036)) lt!449477)))

(declare-fun b!1017828 () Bool)

(assert (=> b!1017828 (= e!572648 0)))

(declare-fun b!1017829 () Bool)

(assert (=> b!1017829 (= e!572648 (+ 1 (ListPrimitiveSize!131 (t!30573 (t!30573 l!1036)))))))

(assert (= (and d!121697 c!103072) b!1017828))

(assert (= (and d!121697 (not c!103072)) b!1017829))

(declare-fun m!938999 () Bool)

(assert (=> b!1017829 m!938999))

(assert (=> b!1017763 d!121697))

(declare-fun d!121711 () Bool)

(declare-fun lt!449478 () Int)

(assert (=> d!121711 (>= lt!449478 0)))

(declare-fun e!572649 () Int)

(assert (=> d!121711 (= lt!449478 e!572649)))

(declare-fun c!103073 () Bool)

(assert (=> d!121711 (= c!103073 ((_ is Nil!21569) l!1036))))

(assert (=> d!121711 (= (ListPrimitiveSize!131 l!1036) lt!449478)))

(declare-fun b!1017830 () Bool)

(assert (=> b!1017830 (= e!572649 0)))

(declare-fun b!1017831 () Bool)

(assert (=> b!1017831 (= e!572649 (+ 1 (ListPrimitiveSize!131 (t!30573 l!1036))))))

(assert (= (and d!121711 c!103073) b!1017830))

(assert (= (and d!121711 (not c!103073)) b!1017831))

(assert (=> b!1017831 m!938969))

(assert (=> b!1017763 d!121711))

(declare-fun d!121713 () Bool)

(declare-fun res!682601 () Bool)

(declare-fun e!572673 () Bool)

(assert (=> d!121713 (=> res!682601 e!572673)))

(assert (=> d!121713 (= res!682601 (or ((_ is Nil!21569) l!1036) ((_ is Nil!21569) (t!30573 l!1036))))))

(assert (=> d!121713 (= (isStrictlySorted!643 l!1036) e!572673)))

(declare-fun b!1017871 () Bool)

(declare-fun e!572674 () Bool)

(assert (=> b!1017871 (= e!572673 e!572674)))

(declare-fun res!682602 () Bool)

(assert (=> b!1017871 (=> (not res!682602) (not e!572674))))

(assert (=> b!1017871 (= res!682602 (bvslt (_1!7668 (h!22766 l!1036)) (_1!7668 (h!22766 (t!30573 l!1036)))))))

(declare-fun b!1017872 () Bool)

(assert (=> b!1017872 (= e!572674 (isStrictlySorted!643 (t!30573 l!1036)))))

(assert (= (and d!121713 (not res!682601)) b!1017871))

(assert (= (and b!1017871 res!682602) b!1017872))

(assert (=> b!1017872 m!938957))

(assert (=> start!88476 d!121713))

(declare-fun d!121725 () Bool)

(declare-fun isEmpty!915 (Option!627) Bool)

(assert (=> d!121725 (= (isDefined!423 (getValueByKey!576 (t!30573 l!1036) key!271)) (not (isEmpty!915 (getValueByKey!576 (t!30573 l!1036) key!271))))))

(declare-fun bs!29630 () Bool)

(assert (= bs!29630 d!121725))

(assert (=> bs!29630 m!938963))

(declare-fun m!939011 () Bool)

(assert (=> bs!29630 m!939011))

(assert (=> b!1017765 d!121725))

(declare-fun b!1017885 () Bool)

(declare-fun e!572681 () Option!627)

(assert (=> b!1017885 (= e!572681 None!625)))

(declare-fun b!1017882 () Bool)

(declare-fun e!572680 () Option!627)

(assert (=> b!1017882 (= e!572680 (Some!626 (_2!7668 (h!22766 (t!30573 l!1036)))))))

(declare-fun b!1017884 () Bool)

(assert (=> b!1017884 (= e!572681 (getValueByKey!576 (t!30573 (t!30573 l!1036)) key!271))))

(declare-fun b!1017883 () Bool)

(assert (=> b!1017883 (= e!572680 e!572681)))

(declare-fun c!103091 () Bool)

(assert (=> b!1017883 (= c!103091 (and ((_ is Cons!21568) (t!30573 l!1036)) (not (= (_1!7668 (h!22766 (t!30573 l!1036))) key!271))))))

(declare-fun d!121727 () Bool)

(declare-fun c!103090 () Bool)

(assert (=> d!121727 (= c!103090 (and ((_ is Cons!21568) (t!30573 l!1036)) (= (_1!7668 (h!22766 (t!30573 l!1036))) key!271)))))

(assert (=> d!121727 (= (getValueByKey!576 (t!30573 l!1036) key!271) e!572680)))

(assert (= (and d!121727 c!103090) b!1017882))

(assert (= (and d!121727 (not c!103090)) b!1017883))

(assert (= (and b!1017883 c!103091) b!1017884))

(assert (= (and b!1017883 (not c!103091)) b!1017885))

(declare-fun m!939013 () Bool)

(assert (=> b!1017884 m!939013))

(assert (=> b!1017765 d!121727))

(declare-fun d!121729 () Bool)

(assert (=> d!121729 (= (isDefined!423 (getValueByKey!576 l!1036 key!271)) (not (isEmpty!915 (getValueByKey!576 l!1036 key!271))))))

(declare-fun bs!29631 () Bool)

(assert (= bs!29631 d!121729))

(assert (=> bs!29631 m!938959))

(declare-fun m!939015 () Bool)

(assert (=> bs!29631 m!939015))

(assert (=> b!1017767 d!121729))

(declare-fun b!1017889 () Bool)

(declare-fun e!572683 () Option!627)

(assert (=> b!1017889 (= e!572683 None!625)))

(declare-fun b!1017886 () Bool)

(declare-fun e!572682 () Option!627)

(assert (=> b!1017886 (= e!572682 (Some!626 (_2!7668 (h!22766 l!1036))))))

(declare-fun b!1017888 () Bool)

(assert (=> b!1017888 (= e!572683 (getValueByKey!576 (t!30573 l!1036) key!271))))

(declare-fun b!1017887 () Bool)

(assert (=> b!1017887 (= e!572682 e!572683)))

(declare-fun c!103093 () Bool)

(assert (=> b!1017887 (= c!103093 (and ((_ is Cons!21568) l!1036) (not (= (_1!7668 (h!22766 l!1036)) key!271))))))

(declare-fun d!121731 () Bool)

(declare-fun c!103092 () Bool)

(assert (=> d!121731 (= c!103092 (and ((_ is Cons!21568) l!1036) (= (_1!7668 (h!22766 l!1036)) key!271)))))

(assert (=> d!121731 (= (getValueByKey!576 l!1036 key!271) e!572682)))

(assert (= (and d!121731 c!103092) b!1017886))

(assert (= (and d!121731 (not c!103092)) b!1017887))

(assert (= (and b!1017887 c!103093) b!1017888))

(assert (= (and b!1017887 (not c!103093)) b!1017889))

(assert (=> b!1017888 m!938963))

(assert (=> b!1017767 d!121731))

(declare-fun d!121733 () Bool)

(declare-fun res!682603 () Bool)

(declare-fun e!572684 () Bool)

(assert (=> d!121733 (=> res!682603 e!572684)))

(assert (=> d!121733 (= res!682603 (or ((_ is Nil!21569) (t!30573 l!1036)) ((_ is Nil!21569) (t!30573 (t!30573 l!1036)))))))

(assert (=> d!121733 (= (isStrictlySorted!643 (t!30573 l!1036)) e!572684)))

(declare-fun b!1017890 () Bool)

(declare-fun e!572685 () Bool)

(assert (=> b!1017890 (= e!572684 e!572685)))

(declare-fun res!682604 () Bool)

(assert (=> b!1017890 (=> (not res!682604) (not e!572685))))

(assert (=> b!1017890 (= res!682604 (bvslt (_1!7668 (h!22766 (t!30573 l!1036))) (_1!7668 (h!22766 (t!30573 (t!30573 l!1036))))))))

(declare-fun b!1017891 () Bool)

(assert (=> b!1017891 (= e!572685 (isStrictlySorted!643 (t!30573 (t!30573 l!1036))))))

(assert (= (and d!121733 (not res!682603)) b!1017890))

(assert (= (and b!1017890 res!682604) b!1017891))

(declare-fun m!939017 () Bool)

(assert (=> b!1017891 m!939017))

(assert (=> b!1017762 d!121733))

(declare-fun b!1017896 () Bool)

(declare-fun e!572688 () Bool)

(declare-fun tp!70951 () Bool)

(assert (=> b!1017896 (= e!572688 (and tp_is_empty!23667 tp!70951))))

(assert (=> b!1017764 (= tp!70939 e!572688)))

(assert (= (and b!1017764 ((_ is Cons!21568) (t!30573 l!1036))) b!1017896))

(check-sat (not b!1017872) tp_is_empty!23667 (not b!1017891) (not b!1017831) (not b!1017829) (not d!121725) (not b!1017896) (not b!1017884) (not b!1017888) (not d!121729))
(check-sat)
