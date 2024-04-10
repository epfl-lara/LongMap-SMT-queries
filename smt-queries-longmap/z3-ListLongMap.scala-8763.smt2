; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106422 () Bool)

(assert start!106422)

(declare-fun res!842602 () Bool)

(declare-fun e!720703 () Bool)

(assert (=> start!106422 (=> (not res!842602) (not e!720703))))

(declare-datatypes ((B!1972 0))(
  ( (B!1973 (val!16321 Int)) )
))
(declare-datatypes ((tuple2!21160 0))(
  ( (tuple2!21161 (_1!10591 (_ BitVec 64)) (_2!10591 B!1972)) )
))
(declare-datatypes ((List!28313 0))(
  ( (Nil!28310) (Cons!28309 (h!29518 tuple2!21160) (t!41834 List!28313)) )
))
(declare-fun l!706 () List!28313)

(declare-fun isStrictlySorted!788 (List!28313) Bool)

(assert (=> start!106422 (= res!842602 (isStrictlySorted!788 l!706))))

(assert (=> start!106422 e!720703))

(declare-fun e!720704 () Bool)

(assert (=> start!106422 e!720704))

(assert (=> start!106422 true))

(declare-fun b!1265525 () Bool)

(declare-fun res!842601 () Bool)

(assert (=> b!1265525 (=> (not res!842601) (not e!720703))))

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!647 (List!28313 (_ BitVec 64)) Bool)

(assert (=> b!1265525 (= res!842601 (not (containsKey!647 l!706 key1!31)))))

(declare-fun b!1265526 () Bool)

(declare-fun ListPrimitiveSize!152 (List!28313) Int)

(assert (=> b!1265526 (= e!720703 (< (ListPrimitiveSize!152 l!706) 0))))

(declare-fun b!1265527 () Bool)

(declare-fun tp_is_empty!32505 () Bool)

(declare-fun tp!96341 () Bool)

(assert (=> b!1265527 (= e!720704 (and tp_is_empty!32505 tp!96341))))

(assert (= (and start!106422 res!842602) b!1265525))

(assert (= (and b!1265525 res!842601) b!1265526))

(get-info :version)

(assert (= (and start!106422 ((_ is Cons!28309) l!706)) b!1265527))

(declare-fun m!1165653 () Bool)

(assert (=> start!106422 m!1165653))

(declare-fun m!1165655 () Bool)

(assert (=> b!1265525 m!1165655))

(declare-fun m!1165657 () Bool)

(assert (=> b!1265526 m!1165657))

(check-sat (not b!1265527) (not start!106422) (not b!1265525) (not b!1265526) tp_is_empty!32505)
(check-sat)
(get-model)

(declare-fun d!138929 () Bool)

(declare-fun res!842619 () Bool)

(declare-fun e!720724 () Bool)

(assert (=> d!138929 (=> res!842619 e!720724)))

(assert (=> d!138929 (= res!842619 (and ((_ is Cons!28309) l!706) (= (_1!10591 (h!29518 l!706)) key1!31)))))

(assert (=> d!138929 (= (containsKey!647 l!706 key1!31) e!720724)))

(declare-fun b!1265553 () Bool)

(declare-fun e!720725 () Bool)

(assert (=> b!1265553 (= e!720724 e!720725)))

(declare-fun res!842620 () Bool)

(assert (=> b!1265553 (=> (not res!842620) (not e!720725))))

(assert (=> b!1265553 (= res!842620 (and (or (not ((_ is Cons!28309) l!706)) (bvsle (_1!10591 (h!29518 l!706)) key1!31)) ((_ is Cons!28309) l!706) (bvslt (_1!10591 (h!29518 l!706)) key1!31)))))

(declare-fun b!1265554 () Bool)

(assert (=> b!1265554 (= e!720725 (containsKey!647 (t!41834 l!706) key1!31))))

(assert (= (and d!138929 (not res!842619)) b!1265553))

(assert (= (and b!1265553 res!842620) b!1265554))

(declare-fun m!1165669 () Bool)

(assert (=> b!1265554 m!1165669))

(assert (=> b!1265525 d!138929))

(declare-fun d!138937 () Bool)

(declare-fun lt!574059 () Int)

(assert (=> d!138937 (>= lt!574059 0)))

(declare-fun e!720735 () Int)

(assert (=> d!138937 (= lt!574059 e!720735)))

(declare-fun c!123328 () Bool)

(assert (=> d!138937 (= c!123328 ((_ is Nil!28310) l!706))))

(assert (=> d!138937 (= (ListPrimitiveSize!152 l!706) lt!574059)))

(declare-fun b!1265569 () Bool)

(assert (=> b!1265569 (= e!720735 0)))

(declare-fun b!1265570 () Bool)

(assert (=> b!1265570 (= e!720735 (+ 1 (ListPrimitiveSize!152 (t!41834 l!706))))))

(assert (= (and d!138937 c!123328) b!1265569))

(assert (= (and d!138937 (not c!123328)) b!1265570))

(declare-fun m!1165673 () Bool)

(assert (=> b!1265570 m!1165673))

(assert (=> b!1265526 d!138937))

(declare-fun d!138941 () Bool)

(declare-fun res!842641 () Bool)

(declare-fun e!720752 () Bool)

(assert (=> d!138941 (=> res!842641 e!720752)))

(assert (=> d!138941 (= res!842641 (or ((_ is Nil!28310) l!706) ((_ is Nil!28310) (t!41834 l!706))))))

(assert (=> d!138941 (= (isStrictlySorted!788 l!706) e!720752)))

(declare-fun b!1265587 () Bool)

(declare-fun e!720753 () Bool)

(assert (=> b!1265587 (= e!720752 e!720753)))

(declare-fun res!842642 () Bool)

(assert (=> b!1265587 (=> (not res!842642) (not e!720753))))

(assert (=> b!1265587 (= res!842642 (bvslt (_1!10591 (h!29518 l!706)) (_1!10591 (h!29518 (t!41834 l!706)))))))

(declare-fun b!1265588 () Bool)

(assert (=> b!1265588 (= e!720753 (isStrictlySorted!788 (t!41834 l!706)))))

(assert (= (and d!138941 (not res!842641)) b!1265587))

(assert (= (and b!1265587 res!842642) b!1265588))

(declare-fun m!1165679 () Bool)

(assert (=> b!1265588 m!1165679))

(assert (=> start!106422 d!138941))

(declare-fun b!1265604 () Bool)

(declare-fun e!720763 () Bool)

(declare-fun tp!96352 () Bool)

(assert (=> b!1265604 (= e!720763 (and tp_is_empty!32505 tp!96352))))

(assert (=> b!1265527 (= tp!96341 e!720763)))

(assert (= (and b!1265527 ((_ is Cons!28309) (t!41834 l!706))) b!1265604))

(check-sat (not b!1265570) (not b!1265588) (not b!1265554) tp_is_empty!32505 (not b!1265604))
(check-sat)
