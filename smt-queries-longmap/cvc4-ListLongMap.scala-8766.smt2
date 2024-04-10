; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106484 () Bool)

(assert start!106484)

(declare-fun b!1265855 () Bool)

(declare-fun e!720925 () Bool)

(declare-fun tp_is_empty!32525 () Bool)

(declare-fun tp!96398 () Bool)

(assert (=> b!1265855 (= e!720925 (and tp_is_empty!32525 tp!96398))))

(declare-fun b!1265856 () Bool)

(declare-fun res!842840 () Bool)

(declare-fun e!720926 () Bool)

(assert (=> b!1265856 (=> (not res!842840) (not e!720926))))

(declare-datatypes ((B!1992 0))(
  ( (B!1993 (val!16331 Int)) )
))
(declare-datatypes ((tuple2!21180 0))(
  ( (tuple2!21181 (_1!10601 (_ BitVec 64)) (_2!10601 B!1992)) )
))
(declare-datatypes ((List!28323 0))(
  ( (Nil!28320) (Cons!28319 (h!29528 tuple2!21180) (t!41844 List!28323)) )
))
(declare-fun l!706 () List!28323)

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!657 (List!28323 (_ BitVec 64)) Bool)

(assert (=> b!1265856 (= res!842840 (not (containsKey!657 (t!41844 l!706) key1!31)))))

(declare-fun res!842839 () Bool)

(assert (=> start!106484 (=> (not res!842839) (not e!720926))))

(declare-fun isStrictlySorted!798 (List!28323) Bool)

(assert (=> start!106484 (= res!842839 (isStrictlySorted!798 l!706))))

(assert (=> start!106484 e!720926))

(assert (=> start!106484 e!720925))

(assert (=> start!106484 true))

(declare-fun b!1265857 () Bool)

(declare-fun res!842841 () Bool)

(assert (=> b!1265857 (=> (not res!842841) (not e!720926))))

(assert (=> b!1265857 (= res!842841 (is-Cons!28319 l!706))))

(declare-fun b!1265858 () Bool)

(declare-fun res!842838 () Bool)

(assert (=> b!1265858 (=> (not res!842838) (not e!720926))))

(assert (=> b!1265858 (= res!842838 (isStrictlySorted!798 (t!41844 l!706)))))

(declare-fun b!1265859 () Bool)

(declare-fun res!842842 () Bool)

(assert (=> b!1265859 (=> (not res!842842) (not e!720926))))

(assert (=> b!1265859 (= res!842842 (not (containsKey!657 l!706 key1!31)))))

(declare-fun b!1265860 () Bool)

(declare-fun ListPrimitiveSize!156 (List!28323) Int)

(assert (=> b!1265860 (= e!720926 (>= (ListPrimitiveSize!156 (t!41844 l!706)) (ListPrimitiveSize!156 l!706)))))

(assert (= (and start!106484 res!842839) b!1265859))

(assert (= (and b!1265859 res!842842) b!1265857))

(assert (= (and b!1265857 res!842841) b!1265858))

(assert (= (and b!1265858 res!842838) b!1265856))

(assert (= (and b!1265856 res!842840) b!1265860))

(assert (= (and start!106484 (is-Cons!28319 l!706)) b!1265855))

(declare-fun m!1165773 () Bool)

(assert (=> b!1265860 m!1165773))

(declare-fun m!1165775 () Bool)

(assert (=> b!1265860 m!1165775))

(declare-fun m!1165777 () Bool)

(assert (=> b!1265856 m!1165777))

(declare-fun m!1165779 () Bool)

(assert (=> b!1265859 m!1165779))

(declare-fun m!1165781 () Bool)

(assert (=> start!106484 m!1165781))

(declare-fun m!1165783 () Bool)

(assert (=> b!1265858 m!1165783))

(push 1)

(assert (not start!106484))

(assert (not b!1265859))

(assert (not b!1265860))

(assert tp_is_empty!32525)

(assert (not b!1265855))

(assert (not b!1265856))

(assert (not b!1265858))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!138997 () Bool)

(declare-fun res!842865 () Bool)

(declare-fun e!720949 () Bool)

(assert (=> d!138997 (=> res!842865 e!720949)))

(assert (=> d!138997 (= res!842865 (and (is-Cons!28319 (t!41844 l!706)) (= (_1!10601 (h!29528 (t!41844 l!706))) key1!31)))))

(assert (=> d!138997 (= (containsKey!657 (t!41844 l!706) key1!31) e!720949)))

(declare-fun b!1265883 () Bool)

(declare-fun e!720950 () Bool)

(assert (=> b!1265883 (= e!720949 e!720950)))

(declare-fun res!842866 () Bool)

(assert (=> b!1265883 (=> (not res!842866) (not e!720950))))

(assert (=> b!1265883 (= res!842866 (and (or (not (is-Cons!28319 (t!41844 l!706))) (bvsle (_1!10601 (h!29528 (t!41844 l!706))) key1!31)) (is-Cons!28319 (t!41844 l!706)) (bvslt (_1!10601 (h!29528 (t!41844 l!706))) key1!31)))))

(declare-fun b!1265884 () Bool)

(assert (=> b!1265884 (= e!720950 (containsKey!657 (t!41844 (t!41844 l!706)) key1!31))))

(assert (= (and d!138997 (not res!842865)) b!1265883))

(assert (= (and b!1265883 res!842866) b!1265884))

(declare-fun m!1165787 () Bool)

(assert (=> b!1265884 m!1165787))

(assert (=> b!1265856 d!138997))

(declare-fun d!139005 () Bool)

(declare-fun res!842881 () Bool)

(declare-fun e!720969 () Bool)

(assert (=> d!139005 (=> res!842881 e!720969)))

(assert (=> d!139005 (= res!842881 (or (is-Nil!28320 (t!41844 l!706)) (is-Nil!28320 (t!41844 (t!41844 l!706)))))))

(assert (=> d!139005 (= (isStrictlySorted!798 (t!41844 l!706)) e!720969)))

(declare-fun b!1265907 () Bool)

(declare-fun e!720970 () Bool)

(assert (=> b!1265907 (= e!720969 e!720970)))

(declare-fun res!842882 () Bool)

(assert (=> b!1265907 (=> (not res!842882) (not e!720970))))

(assert (=> b!1265907 (= res!842882 (bvslt (_1!10601 (h!29528 (t!41844 l!706))) (_1!10601 (h!29528 (t!41844 (t!41844 l!706))))))))

(declare-fun b!1265908 () Bool)

(assert (=> b!1265908 (= e!720970 (isStrictlySorted!798 (t!41844 (t!41844 l!706))))))

(assert (= (and d!139005 (not res!842881)) b!1265907))

(assert (= (and b!1265907 res!842882) b!1265908))

(declare-fun m!1165795 () Bool)

(assert (=> b!1265908 m!1165795))

(assert (=> b!1265858 d!139005))

(declare-fun d!139015 () Bool)

(declare-fun res!842883 () Bool)

(declare-fun e!720973 () Bool)

(assert (=> d!139015 (=> res!842883 e!720973)))

(assert (=> d!139015 (= res!842883 (or (is-Nil!28320 l!706) (is-Nil!28320 (t!41844 l!706))))))

(assert (=> d!139015 (= (isStrictlySorted!798 l!706) e!720973)))

(declare-fun b!1265913 () Bool)

(declare-fun e!720974 () Bool)

(assert (=> b!1265913 (= e!720973 e!720974)))

(declare-fun res!842884 () Bool)

(assert (=> b!1265913 (=> (not res!842884) (not e!720974))))

(assert (=> b!1265913 (= res!842884 (bvslt (_1!10601 (h!29528 l!706)) (_1!10601 (h!29528 (t!41844 l!706)))))))

(declare-fun b!1265914 () Bool)

(assert (=> b!1265914 (= e!720974 (isStrictlySorted!798 (t!41844 l!706)))))

(assert (= (and d!139015 (not res!842883)) b!1265913))

(assert (= (and b!1265913 res!842884) b!1265914))

(assert (=> b!1265914 m!1165783))

(assert (=> start!106484 d!139015))

(declare-fun d!139017 () Bool)

(declare-fun res!842885 () Bool)

(declare-fun e!720976 () Bool)

(assert (=> d!139017 (=> res!842885 e!720976)))

(assert (=> d!139017 (= res!842885 (and (is-Cons!28319 l!706) (= (_1!10601 (h!29528 l!706)) key1!31)))))

(assert (=> d!139017 (= (containsKey!657 l!706 key1!31) e!720976)))

(declare-fun b!1265916 () Bool)

(declare-fun e!720977 () Bool)

(assert (=> b!1265916 (= e!720976 e!720977)))

(declare-fun res!842886 () Bool)

(assert (=> b!1265916 (=> (not res!842886) (not e!720977))))

(assert (=> b!1265916 (= res!842886 (and (or (not (is-Cons!28319 l!706)) (bvsle (_1!10601 (h!29528 l!706)) key1!31)) (is-Cons!28319 l!706) (bvslt (_1!10601 (h!29528 l!706)) key1!31)))))

(declare-fun b!1265917 () Bool)

(assert (=> b!1265917 (= e!720977 (containsKey!657 (t!41844 l!706) key1!31))))

(assert (= (and d!139017 (not res!842885)) b!1265916))

(assert (= (and b!1265916 res!842886) b!1265917))

(assert (=> b!1265917 m!1165777))

(assert (=> b!1265859 d!139017))

(declare-fun d!139019 () Bool)

(declare-fun lt!574070 () Int)

(assert (=> d!139019 (>= lt!574070 0)))

(declare-fun e!720986 () Int)

(assert (=> d!139019 (= lt!574070 e!720986)))

(declare-fun c!123339 () Bool)

(assert (=> d!139019 (= c!123339 (is-Nil!28320 (t!41844 l!706)))))

(assert (=> d!139019 (= (ListPrimitiveSize!156 (t!41844 l!706)) lt!574070)))

(declare-fun b!1265932 () Bool)

(assert (=> b!1265932 (= e!720986 0)))

