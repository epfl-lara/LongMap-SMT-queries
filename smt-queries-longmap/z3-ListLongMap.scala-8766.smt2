; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106476 () Bool)

(assert start!106476)

(declare-fun b!1265737 () Bool)

(declare-fun res!842772 () Bool)

(declare-fun e!720869 () Bool)

(assert (=> b!1265737 (=> (not res!842772) (not e!720869))))

(declare-datatypes ((B!1988 0))(
  ( (B!1989 (val!16329 Int)) )
))
(declare-datatypes ((tuple2!21258 0))(
  ( (tuple2!21259 (_1!10640 (_ BitVec 64)) (_2!10640 B!1988)) )
))
(declare-datatypes ((List!28405 0))(
  ( (Nil!28402) (Cons!28401 (h!29610 tuple2!21258) (t!41917 List!28405)) )
))
(declare-fun l!706 () List!28405)

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!653 (List!28405 (_ BitVec 64)) Bool)

(assert (=> b!1265737 (= res!842772 (not (containsKey!653 l!706 key1!31)))))

(declare-fun res!842771 () Bool)

(assert (=> start!106476 (=> (not res!842771) (not e!720869))))

(declare-fun isStrictlySorted!792 (List!28405) Bool)

(assert (=> start!106476 (= res!842771 (isStrictlySorted!792 l!706))))

(assert (=> start!106476 e!720869))

(declare-fun e!720868 () Bool)

(assert (=> start!106476 e!720868))

(assert (=> start!106476 true))

(declare-fun b!1265738 () Bool)

(declare-fun ListPrimitiveSize!154 (List!28405) Int)

(assert (=> b!1265738 (= e!720869 (>= (ListPrimitiveSize!154 (t!41917 l!706)) (ListPrimitiveSize!154 l!706)))))

(declare-fun b!1265739 () Bool)

(declare-fun res!842768 () Bool)

(assert (=> b!1265739 (=> (not res!842768) (not e!720869))))

(assert (=> b!1265739 (= res!842768 (not (containsKey!653 (t!41917 l!706) key1!31)))))

(declare-fun b!1265740 () Bool)

(declare-fun res!842769 () Bool)

(assert (=> b!1265740 (=> (not res!842769) (not e!720869))))

(assert (=> b!1265740 (= res!842769 (isStrictlySorted!792 (t!41917 l!706)))))

(declare-fun b!1265741 () Bool)

(declare-fun tp_is_empty!32521 () Bool)

(declare-fun tp!96392 () Bool)

(assert (=> b!1265741 (= e!720868 (and tp_is_empty!32521 tp!96392))))

(declare-fun b!1265742 () Bool)

(declare-fun res!842770 () Bool)

(assert (=> b!1265742 (=> (not res!842770) (not e!720869))))

(get-info :version)

(assert (=> b!1265742 (= res!842770 ((_ is Cons!28401) l!706))))

(assert (= (and start!106476 res!842771) b!1265737))

(assert (= (and b!1265737 res!842772) b!1265742))

(assert (= (and b!1265742 res!842770) b!1265740))

(assert (= (and b!1265740 res!842769) b!1265739))

(assert (= (and b!1265739 res!842768) b!1265738))

(assert (= (and start!106476 ((_ is Cons!28401) l!706)) b!1265741))

(declare-fun m!1165229 () Bool)

(assert (=> b!1265737 m!1165229))

(declare-fun m!1165231 () Bool)

(assert (=> b!1265740 m!1165231))

(declare-fun m!1165233 () Bool)

(assert (=> start!106476 m!1165233))

(declare-fun m!1165235 () Bool)

(assert (=> b!1265738 m!1165235))

(declare-fun m!1165237 () Bool)

(assert (=> b!1265738 m!1165237))

(declare-fun m!1165239 () Bool)

(assert (=> b!1265739 m!1165239))

(check-sat (not b!1265741) tp_is_empty!32521 (not b!1265738) (not b!1265740) (not b!1265739) (not start!106476) (not b!1265737))
(check-sat)
(get-model)

(declare-fun d!138861 () Bool)

(declare-fun res!842813 () Bool)

(declare-fun e!720896 () Bool)

(assert (=> d!138861 (=> res!842813 e!720896)))

(assert (=> d!138861 (= res!842813 (and ((_ is Cons!28401) (t!41917 l!706)) (= (_1!10640 (h!29610 (t!41917 l!706))) key1!31)))))

(assert (=> d!138861 (= (containsKey!653 (t!41917 l!706) key1!31) e!720896)))

(declare-fun b!1265797 () Bool)

(declare-fun e!720897 () Bool)

(assert (=> b!1265797 (= e!720896 e!720897)))

(declare-fun res!842814 () Bool)

(assert (=> b!1265797 (=> (not res!842814) (not e!720897))))

(assert (=> b!1265797 (= res!842814 (and (or (not ((_ is Cons!28401) (t!41917 l!706))) (bvsle (_1!10640 (h!29610 (t!41917 l!706))) key1!31)) ((_ is Cons!28401) (t!41917 l!706)) (bvslt (_1!10640 (h!29610 (t!41917 l!706))) key1!31)))))

(declare-fun b!1265798 () Bool)

(assert (=> b!1265798 (= e!720897 (containsKey!653 (t!41917 (t!41917 l!706)) key1!31))))

(assert (= (and d!138861 (not res!842813)) b!1265797))

(assert (= (and b!1265797 res!842814) b!1265798))

(declare-fun m!1165267 () Bool)

(assert (=> b!1265798 m!1165267))

(assert (=> b!1265739 d!138861))

(declare-fun d!138873 () Bool)

(declare-fun res!842831 () Bool)

(declare-fun e!720914 () Bool)

(assert (=> d!138873 (=> res!842831 e!720914)))

(assert (=> d!138873 (= res!842831 (or ((_ is Nil!28402) (t!41917 l!706)) ((_ is Nil!28402) (t!41917 (t!41917 l!706)))))))

(assert (=> d!138873 (= (isStrictlySorted!792 (t!41917 l!706)) e!720914)))

(declare-fun b!1265815 () Bool)

(declare-fun e!720915 () Bool)

(assert (=> b!1265815 (= e!720914 e!720915)))

(declare-fun res!842832 () Bool)

(assert (=> b!1265815 (=> (not res!842832) (not e!720915))))

(assert (=> b!1265815 (= res!842832 (bvslt (_1!10640 (h!29610 (t!41917 l!706))) (_1!10640 (h!29610 (t!41917 (t!41917 l!706))))))))

(declare-fun b!1265816 () Bool)

(assert (=> b!1265816 (= e!720915 (isStrictlySorted!792 (t!41917 (t!41917 l!706))))))

(assert (= (and d!138873 (not res!842831)) b!1265815))

(assert (= (and b!1265815 res!842832) b!1265816))

(declare-fun m!1165273 () Bool)

(assert (=> b!1265816 m!1165273))

(assert (=> b!1265740 d!138873))

(declare-fun d!138879 () Bool)

(declare-fun res!842833 () Bool)

(declare-fun e!720916 () Bool)

(assert (=> d!138879 (=> res!842833 e!720916)))

(assert (=> d!138879 (= res!842833 (or ((_ is Nil!28402) l!706) ((_ is Nil!28402) (t!41917 l!706))))))

(assert (=> d!138879 (= (isStrictlySorted!792 l!706) e!720916)))

(declare-fun b!1265817 () Bool)

(declare-fun e!720917 () Bool)

(assert (=> b!1265817 (= e!720916 e!720917)))

(declare-fun res!842834 () Bool)

(assert (=> b!1265817 (=> (not res!842834) (not e!720917))))

(assert (=> b!1265817 (= res!842834 (bvslt (_1!10640 (h!29610 l!706)) (_1!10640 (h!29610 (t!41917 l!706)))))))

(declare-fun b!1265818 () Bool)

(assert (=> b!1265818 (= e!720917 (isStrictlySorted!792 (t!41917 l!706)))))

(assert (= (and d!138879 (not res!842833)) b!1265817))

(assert (= (and b!1265817 res!842834) b!1265818))

(assert (=> b!1265818 m!1165231))

(assert (=> start!106476 d!138879))

(declare-fun d!138881 () Bool)

(declare-fun res!842835 () Bool)

(declare-fun e!720918 () Bool)

(assert (=> d!138881 (=> res!842835 e!720918)))

(assert (=> d!138881 (= res!842835 (and ((_ is Cons!28401) l!706) (= (_1!10640 (h!29610 l!706)) key1!31)))))

(assert (=> d!138881 (= (containsKey!653 l!706 key1!31) e!720918)))

(declare-fun b!1265819 () Bool)

(declare-fun e!720920 () Bool)

(assert (=> b!1265819 (= e!720918 e!720920)))

(declare-fun res!842837 () Bool)

(assert (=> b!1265819 (=> (not res!842837) (not e!720920))))

(assert (=> b!1265819 (= res!842837 (and (or (not ((_ is Cons!28401) l!706)) (bvsle (_1!10640 (h!29610 l!706)) key1!31)) ((_ is Cons!28401) l!706) (bvslt (_1!10640 (h!29610 l!706)) key1!31)))))

(declare-fun b!1265821 () Bool)

(assert (=> b!1265821 (= e!720920 (containsKey!653 (t!41917 l!706) key1!31))))

(assert (= (and d!138881 (not res!842835)) b!1265819))

(assert (= (and b!1265819 res!842837) b!1265821))

(assert (=> b!1265821 m!1165239))

(assert (=> b!1265737 d!138881))

(declare-fun d!138883 () Bool)

(declare-fun lt!573889 () Int)

(assert (=> d!138883 (>= lt!573889 0)))

(declare-fun e!720934 () Int)

(assert (=> d!138883 (= lt!573889 e!720934)))

(declare-fun c!123319 () Bool)

(assert (=> d!138883 (= c!123319 ((_ is Nil!28402) (t!41917 l!706)))))

(assert (=> d!138883 (= (ListPrimitiveSize!154 (t!41917 l!706)) lt!573889)))

(declare-fun b!1265839 () Bool)

(assert (=> b!1265839 (= e!720934 0)))

(declare-fun b!1265840 () Bool)

(assert (=> b!1265840 (= e!720934 (+ 1 (ListPrimitiveSize!154 (t!41917 (t!41917 l!706)))))))

(assert (= (and d!138883 c!123319) b!1265839))

(assert (= (and d!138883 (not c!123319)) b!1265840))

(declare-fun m!1165279 () Bool)

(assert (=> b!1265840 m!1165279))

(assert (=> b!1265738 d!138883))

(declare-fun d!138891 () Bool)

(declare-fun lt!573890 () Int)

(assert (=> d!138891 (>= lt!573890 0)))

(declare-fun e!720937 () Int)

(assert (=> d!138891 (= lt!573890 e!720937)))

(declare-fun c!123320 () Bool)

(assert (=> d!138891 (= c!123320 ((_ is Nil!28402) l!706))))

(assert (=> d!138891 (= (ListPrimitiveSize!154 l!706) lt!573890)))

(declare-fun b!1265843 () Bool)

(assert (=> b!1265843 (= e!720937 0)))

(declare-fun b!1265844 () Bool)

(assert (=> b!1265844 (= e!720937 (+ 1 (ListPrimitiveSize!154 (t!41917 l!706))))))

(assert (= (and d!138891 c!123320) b!1265843))

(assert (= (and d!138891 (not c!123320)) b!1265844))

(assert (=> b!1265844 m!1165235))

(assert (=> b!1265738 d!138891))

(declare-fun b!1265863 () Bool)

(declare-fun e!720948 () Bool)

(declare-fun tp!96405 () Bool)

(assert (=> b!1265863 (= e!720948 (and tp_is_empty!32521 tp!96405))))

(assert (=> b!1265741 (= tp!96392 e!720948)))

(assert (= (and b!1265741 ((_ is Cons!28401) (t!41917 l!706))) b!1265863))

(check-sat (not b!1265818) (not b!1265821) (not b!1265816) tp_is_empty!32521 (not b!1265844) (not b!1265798) (not b!1265863) (not b!1265840))
(check-sat)
