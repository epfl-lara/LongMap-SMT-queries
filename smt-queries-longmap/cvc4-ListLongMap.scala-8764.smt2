; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106448 () Bool)

(assert start!106448)

(declare-fun res!842671 () Bool)

(declare-fun e!720782 () Bool)

(assert (=> start!106448 (=> (not res!842671) (not e!720782))))

(declare-datatypes ((B!1980 0))(
  ( (B!1981 (val!16325 Int)) )
))
(declare-datatypes ((tuple2!21168 0))(
  ( (tuple2!21169 (_1!10595 (_ BitVec 64)) (_2!10595 B!1980)) )
))
(declare-datatypes ((List!28317 0))(
  ( (Nil!28314) (Cons!28313 (h!29522 tuple2!21168) (t!41838 List!28317)) )
))
(declare-fun l!706 () List!28317)

(declare-fun isStrictlySorted!792 (List!28317) Bool)

(assert (=> start!106448 (= res!842671 (isStrictlySorted!792 l!706))))

(assert (=> start!106448 e!720782))

(declare-fun e!720781 () Bool)

(assert (=> start!106448 e!720781))

(assert (=> start!106448 true))

(declare-fun b!1265640 () Bool)

(assert (=> b!1265640 (= e!720782 (not (isStrictlySorted!792 (t!41838 l!706))))))

(declare-fun b!1265641 () Bool)

(declare-fun tp_is_empty!32513 () Bool)

(declare-fun tp!96362 () Bool)

(assert (=> b!1265641 (= e!720781 (and tp_is_empty!32513 tp!96362))))

(declare-fun b!1265638 () Bool)

(declare-fun res!842669 () Bool)

(assert (=> b!1265638 (=> (not res!842669) (not e!720782))))

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!651 (List!28317 (_ BitVec 64)) Bool)

(assert (=> b!1265638 (= res!842669 (not (containsKey!651 l!706 key1!31)))))

(declare-fun b!1265639 () Bool)

(declare-fun res!842670 () Bool)

(assert (=> b!1265639 (=> (not res!842670) (not e!720782))))

(assert (=> b!1265639 (= res!842670 (is-Cons!28313 l!706))))

(assert (= (and start!106448 res!842671) b!1265638))

(assert (= (and b!1265638 res!842669) b!1265639))

(assert (= (and b!1265639 res!842670) b!1265640))

(assert (= (and start!106448 (is-Cons!28313 l!706)) b!1265641))

(declare-fun m!1165695 () Bool)

(assert (=> start!106448 m!1165695))

(declare-fun m!1165697 () Bool)

(assert (=> b!1265640 m!1165697))

(declare-fun m!1165699 () Bool)

(assert (=> b!1265638 m!1165699))

(push 1)

(assert (not b!1265641))

(assert (not b!1265638))

(assert (not start!106448))

(assert tp_is_empty!32513)

(assert (not b!1265640))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!138951 () Bool)

(declare-fun res!842690 () Bool)

(declare-fun e!720801 () Bool)

(assert (=> d!138951 (=> res!842690 e!720801)))

(assert (=> d!138951 (= res!842690 (and (is-Cons!28313 l!706) (= (_1!10595 (h!29522 l!706)) key1!31)))))

(assert (=> d!138951 (= (containsKey!651 l!706 key1!31) e!720801)))

(declare-fun b!1265660 () Bool)

(declare-fun e!720802 () Bool)

(assert (=> b!1265660 (= e!720801 e!720802)))

(declare-fun res!842691 () Bool)

(assert (=> b!1265660 (=> (not res!842691) (not e!720802))))

(assert (=> b!1265660 (= res!842691 (and (or (not (is-Cons!28313 l!706)) (bvsle (_1!10595 (h!29522 l!706)) key1!31)) (is-Cons!28313 l!706) (bvslt (_1!10595 (h!29522 l!706)) key1!31)))))

(declare-fun b!1265661 () Bool)

(assert (=> b!1265661 (= e!720802 (containsKey!651 (t!41838 l!706) key1!31))))

(assert (= (and d!138951 (not res!842690)) b!1265660))

(assert (= (and b!1265660 res!842691) b!1265661))

(declare-fun m!1165705 () Bool)

(assert (=> b!1265661 m!1165705))

(assert (=> b!1265638 d!138951))

(declare-fun d!138959 () Bool)

(declare-fun res!842708 () Bool)

(declare-fun e!720822 () Bool)

(assert (=> d!138959 (=> res!842708 e!720822)))

(assert (=> d!138959 (= res!842708 (or (is-Nil!28314 l!706) (is-Nil!28314 (t!41838 l!706))))))

(assert (=> d!138959 (= (isStrictlySorted!792 l!706) e!720822)))

(declare-fun b!1265683 () Bool)

(declare-fun e!720823 () Bool)

(assert (=> b!1265683 (= e!720822 e!720823)))

(declare-fun res!842709 () Bool)

(assert (=> b!1265683 (=> (not res!842709) (not e!720823))))

(assert (=> b!1265683 (= res!842709 (bvslt (_1!10595 (h!29522 l!706)) (_1!10595 (h!29522 (t!41838 l!706)))))))

(declare-fun b!1265684 () Bool)

(assert (=> b!1265684 (= e!720823 (isStrictlySorted!792 (t!41838 l!706)))))

(assert (= (and d!138959 (not res!842708)) b!1265683))

(assert (= (and b!1265683 res!842709) b!1265684))

(assert (=> b!1265684 m!1165697))

(assert (=> start!106448 d!138959))

(declare-fun d!138963 () Bool)

(declare-fun res!842710 () Bool)

(declare-fun e!720824 () Bool)

(assert (=> d!138963 (=> res!842710 e!720824)))

(assert (=> d!138963 (= res!842710 (or (is-Nil!28314 (t!41838 l!706)) (is-Nil!28314 (t!41838 (t!41838 l!706)))))))

