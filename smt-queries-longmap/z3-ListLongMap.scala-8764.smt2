; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106446 () Bool)

(assert start!106446)

(declare-fun b!1265628 () Bool)

(declare-fun e!720775 () Bool)

(declare-datatypes ((B!1978 0))(
  ( (B!1979 (val!16324 Int)) )
))
(declare-datatypes ((tuple2!21166 0))(
  ( (tuple2!21167 (_1!10594 (_ BitVec 64)) (_2!10594 B!1978)) )
))
(declare-datatypes ((List!28316 0))(
  ( (Nil!28313) (Cons!28312 (h!29521 tuple2!21166) (t!41837 List!28316)) )
))
(declare-fun l!706 () List!28316)

(declare-fun isStrictlySorted!791 (List!28316) Bool)

(assert (=> b!1265628 (= e!720775 (not (isStrictlySorted!791 (t!41837 l!706))))))

(declare-fun b!1265629 () Bool)

(declare-fun e!720776 () Bool)

(declare-fun tp_is_empty!32511 () Bool)

(declare-fun tp!96359 () Bool)

(assert (=> b!1265629 (= e!720776 (and tp_is_empty!32511 tp!96359))))

(declare-fun b!1265626 () Bool)

(declare-fun res!842662 () Bool)

(assert (=> b!1265626 (=> (not res!842662) (not e!720775))))

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!650 (List!28316 (_ BitVec 64)) Bool)

(assert (=> b!1265626 (= res!842662 (not (containsKey!650 l!706 key1!31)))))

(declare-fun b!1265627 () Bool)

(declare-fun res!842661 () Bool)

(assert (=> b!1265627 (=> (not res!842661) (not e!720775))))

(get-info :version)

(assert (=> b!1265627 (= res!842661 ((_ is Cons!28312) l!706))))

(declare-fun res!842660 () Bool)

(assert (=> start!106446 (=> (not res!842660) (not e!720775))))

(assert (=> start!106446 (= res!842660 (isStrictlySorted!791 l!706))))

(assert (=> start!106446 e!720775))

(assert (=> start!106446 e!720776))

(assert (=> start!106446 true))

(assert (= (and start!106446 res!842660) b!1265626))

(assert (= (and b!1265626 res!842662) b!1265627))

(assert (= (and b!1265627 res!842661) b!1265628))

(assert (= (and start!106446 ((_ is Cons!28312) l!706)) b!1265629))

(declare-fun m!1165689 () Bool)

(assert (=> b!1265628 m!1165689))

(declare-fun m!1165691 () Bool)

(assert (=> b!1265626 m!1165691))

(declare-fun m!1165693 () Bool)

(assert (=> start!106446 m!1165693))

(check-sat tp_is_empty!32511 (not start!106446) (not b!1265626) (not b!1265629) (not b!1265628))
(check-sat)
(get-model)

(declare-fun d!138947 () Bool)

(declare-fun res!842684 () Bool)

(declare-fun e!720795 () Bool)

(assert (=> d!138947 (=> res!842684 e!720795)))

(assert (=> d!138947 (= res!842684 (and ((_ is Cons!28312) l!706) (= (_1!10594 (h!29521 l!706)) key1!31)))))

(assert (=> d!138947 (= (containsKey!650 l!706 key1!31) e!720795)))

(declare-fun b!1265654 () Bool)

(declare-fun e!720796 () Bool)

(assert (=> b!1265654 (= e!720795 e!720796)))

(declare-fun res!842685 () Bool)

(assert (=> b!1265654 (=> (not res!842685) (not e!720796))))

(assert (=> b!1265654 (= res!842685 (and (or (not ((_ is Cons!28312) l!706)) (bvsle (_1!10594 (h!29521 l!706)) key1!31)) ((_ is Cons!28312) l!706) (bvslt (_1!10594 (h!29521 l!706)) key1!31)))))

(declare-fun b!1265655 () Bool)

(assert (=> b!1265655 (= e!720796 (containsKey!650 (t!41837 l!706) key1!31))))

(assert (= (and d!138947 (not res!842684)) b!1265654))

(assert (= (and b!1265654 res!842685) b!1265655))

(declare-fun m!1165701 () Bool)

(assert (=> b!1265655 m!1165701))

(assert (=> b!1265626 d!138947))

(declare-fun d!138953 () Bool)

(declare-fun res!842696 () Bool)

(declare-fun e!720807 () Bool)

(assert (=> d!138953 (=> res!842696 e!720807)))

(assert (=> d!138953 (= res!842696 (or ((_ is Nil!28313) (t!41837 l!706)) ((_ is Nil!28313) (t!41837 (t!41837 l!706)))))))

(assert (=> d!138953 (= (isStrictlySorted!791 (t!41837 l!706)) e!720807)))

(declare-fun b!1265666 () Bool)

(declare-fun e!720808 () Bool)

(assert (=> b!1265666 (= e!720807 e!720808)))

(declare-fun res!842697 () Bool)

(assert (=> b!1265666 (=> (not res!842697) (not e!720808))))

(assert (=> b!1265666 (= res!842697 (bvslt (_1!10594 (h!29521 (t!41837 l!706))) (_1!10594 (h!29521 (t!41837 (t!41837 l!706))))))))

(declare-fun b!1265667 () Bool)

(assert (=> b!1265667 (= e!720808 (isStrictlySorted!791 (t!41837 (t!41837 l!706))))))

(assert (= (and d!138953 (not res!842696)) b!1265666))

(assert (= (and b!1265666 res!842697) b!1265667))

(declare-fun m!1165707 () Bool)

(assert (=> b!1265667 m!1165707))

(assert (=> b!1265628 d!138953))

(declare-fun d!138961 () Bool)

(declare-fun res!842698 () Bool)

(declare-fun e!720809 () Bool)

(assert (=> d!138961 (=> res!842698 e!720809)))

(assert (=> d!138961 (= res!842698 (or ((_ is Nil!28313) l!706) ((_ is Nil!28313) (t!41837 l!706))))))

(assert (=> d!138961 (= (isStrictlySorted!791 l!706) e!720809)))

(declare-fun b!1265668 () Bool)

(declare-fun e!720810 () Bool)

(assert (=> b!1265668 (= e!720809 e!720810)))

(declare-fun res!842699 () Bool)

(assert (=> b!1265668 (=> (not res!842699) (not e!720810))))

(assert (=> b!1265668 (= res!842699 (bvslt (_1!10594 (h!29521 l!706)) (_1!10594 (h!29521 (t!41837 l!706)))))))

(declare-fun b!1265669 () Bool)

(assert (=> b!1265669 (= e!720810 (isStrictlySorted!791 (t!41837 l!706)))))

(assert (= (and d!138961 (not res!842698)) b!1265668))

(assert (= (and b!1265668 res!842699) b!1265669))

(assert (=> b!1265669 m!1165689))

(assert (=> start!106446 d!138961))

(declare-fun b!1265674 () Bool)

(declare-fun e!720813 () Bool)

(declare-fun tp!96365 () Bool)

(assert (=> b!1265674 (= e!720813 (and tp_is_empty!32511 tp!96365))))

(assert (=> b!1265629 (= tp!96359 e!720813)))

(assert (= (and b!1265629 ((_ is Cons!28312) (t!41837 l!706))) b!1265674))

(check-sat (not b!1265655) (not b!1265667) tp_is_empty!32511 (not b!1265669) (not b!1265674))
(check-sat)
