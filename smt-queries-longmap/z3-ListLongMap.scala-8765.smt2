; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106464 () Bool)

(assert start!106464)

(declare-fun b!1265724 () Bool)

(declare-fun res!842737 () Bool)

(declare-fun e!720845 () Bool)

(assert (=> b!1265724 (=> (not res!842737) (not e!720845))))

(declare-datatypes ((B!1984 0))(
  ( (B!1985 (val!16327 Int)) )
))
(declare-datatypes ((tuple2!21172 0))(
  ( (tuple2!21173 (_1!10597 (_ BitVec 64)) (_2!10597 B!1984)) )
))
(declare-datatypes ((List!28319 0))(
  ( (Nil!28316) (Cons!28315 (h!29524 tuple2!21172) (t!41840 List!28319)) )
))
(declare-fun l!706 () List!28319)

(get-info :version)

(assert (=> b!1265724 (= res!842737 ((_ is Cons!28315) l!706))))

(declare-fun b!1265725 () Bool)

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!653 (List!28319 (_ BitVec 64)) Bool)

(assert (=> b!1265725 (= e!720845 (containsKey!653 (t!41840 l!706) key1!31))))

(declare-fun b!1265726 () Bool)

(declare-fun res!842734 () Bool)

(assert (=> b!1265726 (=> (not res!842734) (not e!720845))))

(assert (=> b!1265726 (= res!842734 (not (containsKey!653 l!706 key1!31)))))

(declare-fun res!842735 () Bool)

(assert (=> start!106464 (=> (not res!842735) (not e!720845))))

(declare-fun isStrictlySorted!794 (List!28319) Bool)

(assert (=> start!106464 (= res!842735 (isStrictlySorted!794 l!706))))

(assert (=> start!106464 e!720845))

(declare-fun e!720844 () Bool)

(assert (=> start!106464 e!720844))

(assert (=> start!106464 true))

(declare-fun b!1265727 () Bool)

(declare-fun tp_is_empty!32517 () Bool)

(declare-fun tp!96377 () Bool)

(assert (=> b!1265727 (= e!720844 (and tp_is_empty!32517 tp!96377))))

(declare-fun b!1265728 () Bool)

(declare-fun res!842736 () Bool)

(assert (=> b!1265728 (=> (not res!842736) (not e!720845))))

(assert (=> b!1265728 (= res!842736 (isStrictlySorted!794 (t!41840 l!706)))))

(assert (= (and start!106464 res!842735) b!1265726))

(assert (= (and b!1265726 res!842734) b!1265724))

(assert (= (and b!1265724 res!842737) b!1265728))

(assert (= (and b!1265728 res!842736) b!1265725))

(assert (= (and start!106464 ((_ is Cons!28315) l!706)) b!1265727))

(declare-fun m!1165721 () Bool)

(assert (=> b!1265725 m!1165721))

(declare-fun m!1165723 () Bool)

(assert (=> b!1265726 m!1165723))

(declare-fun m!1165725 () Bool)

(assert (=> start!106464 m!1165725))

(declare-fun m!1165727 () Bool)

(assert (=> b!1265728 m!1165727))

(check-sat tp_is_empty!32517 (not b!1265725) (not b!1265728) (not b!1265727) (not b!1265726) (not start!106464))
(check-sat)
(get-model)

(declare-fun d!138970 () Bool)

(declare-fun res!842764 () Bool)

(declare-fun e!720866 () Bool)

(assert (=> d!138970 (=> res!842764 e!720866)))

(assert (=> d!138970 (= res!842764 (or ((_ is Nil!28316) (t!41840 l!706)) ((_ is Nil!28316) (t!41840 (t!41840 l!706)))))))

(assert (=> d!138970 (= (isStrictlySorted!794 (t!41840 l!706)) e!720866)))

(declare-fun b!1265758 () Bool)

(declare-fun e!720867 () Bool)

(assert (=> b!1265758 (= e!720866 e!720867)))

(declare-fun res!842765 () Bool)

(assert (=> b!1265758 (=> (not res!842765) (not e!720867))))

(assert (=> b!1265758 (= res!842765 (bvslt (_1!10597 (h!29524 (t!41840 l!706))) (_1!10597 (h!29524 (t!41840 (t!41840 l!706))))))))

(declare-fun b!1265759 () Bool)

(assert (=> b!1265759 (= e!720867 (isStrictlySorted!794 (t!41840 (t!41840 l!706))))))

(assert (= (and d!138970 (not res!842764)) b!1265758))

(assert (= (and b!1265758 res!842765) b!1265759))

(declare-fun m!1165737 () Bool)

(assert (=> b!1265759 m!1165737))

(assert (=> b!1265728 d!138970))

(declare-fun d!138975 () Bool)

(declare-fun res!842788 () Bool)

(declare-fun e!720893 () Bool)

(assert (=> d!138975 (=> res!842788 e!720893)))

(assert (=> d!138975 (= res!842788 (and ((_ is Cons!28315) (t!41840 l!706)) (= (_1!10597 (h!29524 (t!41840 l!706))) key1!31)))))

(assert (=> d!138975 (= (containsKey!653 (t!41840 l!706) key1!31) e!720893)))

(declare-fun b!1265787 () Bool)

(declare-fun e!720894 () Bool)

(assert (=> b!1265787 (= e!720893 e!720894)))

(declare-fun res!842789 () Bool)

(assert (=> b!1265787 (=> (not res!842789) (not e!720894))))

(assert (=> b!1265787 (= res!842789 (and (or (not ((_ is Cons!28315) (t!41840 l!706))) (bvsle (_1!10597 (h!29524 (t!41840 l!706))) key1!31)) ((_ is Cons!28315) (t!41840 l!706)) (bvslt (_1!10597 (h!29524 (t!41840 l!706))) key1!31)))))

(declare-fun b!1265788 () Bool)

(assert (=> b!1265788 (= e!720894 (containsKey!653 (t!41840 (t!41840 l!706)) key1!31))))

(assert (= (and d!138975 (not res!842788)) b!1265787))

(assert (= (and b!1265787 res!842789) b!1265788))

(declare-fun m!1165743 () Bool)

(assert (=> b!1265788 m!1165743))

(assert (=> b!1265725 d!138975))

(declare-fun d!138985 () Bool)

(declare-fun res!842792 () Bool)

(declare-fun e!720897 () Bool)

(assert (=> d!138985 (=> res!842792 e!720897)))

(assert (=> d!138985 (= res!842792 (and ((_ is Cons!28315) l!706) (= (_1!10597 (h!29524 l!706)) key1!31)))))

(assert (=> d!138985 (= (containsKey!653 l!706 key1!31) e!720897)))

(declare-fun b!1265791 () Bool)

(declare-fun e!720898 () Bool)

(assert (=> b!1265791 (= e!720897 e!720898)))

(declare-fun res!842793 () Bool)

(assert (=> b!1265791 (=> (not res!842793) (not e!720898))))

(assert (=> b!1265791 (= res!842793 (and (or (not ((_ is Cons!28315) l!706)) (bvsle (_1!10597 (h!29524 l!706)) key1!31)) ((_ is Cons!28315) l!706) (bvslt (_1!10597 (h!29524 l!706)) key1!31)))))

(declare-fun b!1265792 () Bool)

(assert (=> b!1265792 (= e!720898 (containsKey!653 (t!41840 l!706) key1!31))))

(assert (= (and d!138985 (not res!842792)) b!1265791))

(assert (= (and b!1265791 res!842793) b!1265792))

(assert (=> b!1265792 m!1165721))

(assert (=> b!1265726 d!138985))

(declare-fun d!138989 () Bool)

(declare-fun res!842796 () Bool)

(declare-fun e!720901 () Bool)

(assert (=> d!138989 (=> res!842796 e!720901)))

(assert (=> d!138989 (= res!842796 (or ((_ is Nil!28316) l!706) ((_ is Nil!28316) (t!41840 l!706))))))

(assert (=> d!138989 (= (isStrictlySorted!794 l!706) e!720901)))

(declare-fun b!1265795 () Bool)

(declare-fun e!720902 () Bool)

(assert (=> b!1265795 (= e!720901 e!720902)))

(declare-fun res!842797 () Bool)

(assert (=> b!1265795 (=> (not res!842797) (not e!720902))))

(assert (=> b!1265795 (= res!842797 (bvslt (_1!10597 (h!29524 l!706)) (_1!10597 (h!29524 (t!41840 l!706)))))))

(declare-fun b!1265796 () Bool)

(assert (=> b!1265796 (= e!720902 (isStrictlySorted!794 (t!41840 l!706)))))

(assert (= (and d!138989 (not res!842796)) b!1265795))

(assert (= (and b!1265795 res!842797) b!1265796))

(assert (=> b!1265796 m!1165727))

(assert (=> start!106464 d!138989))

(declare-fun b!1265806 () Bool)

(declare-fun e!720908 () Bool)

(declare-fun tp!96389 () Bool)

(assert (=> b!1265806 (= e!720908 (and tp_is_empty!32517 tp!96389))))

(assert (=> b!1265727 (= tp!96377 e!720908)))

(assert (= (and b!1265727 ((_ is Cons!28315) (t!41840 l!706))) b!1265806))

(check-sat (not b!1265759) (not b!1265792) (not b!1265796) tp_is_empty!32517 (not b!1265788) (not b!1265806))
(check-sat)
