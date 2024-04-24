; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108112 () Bool)

(assert start!108112)

(declare-fun res!848098 () Bool)

(declare-fun e!728637 () Bool)

(assert (=> start!108112 (=> (not res!848098) (not e!728637))))

(declare-datatypes ((B!2174 0))(
  ( (B!2175 (val!16683 Int)) )
))
(declare-datatypes ((tuple2!21456 0))(
  ( (tuple2!21457 (_1!10739 (_ BitVec 64)) (_2!10739 B!2174)) )
))
(declare-datatypes ((List!28637 0))(
  ( (Nil!28634) (Cons!28633 (h!29851 tuple2!21456) (t!42165 List!28637)) )
))
(declare-fun l!595 () List!28637)

(declare-fun isStrictlySorted!850 (List!28637) Bool)

(assert (=> start!108112 (= res!848098 (isStrictlySorted!850 l!595))))

(assert (=> start!108112 e!728637))

(declare-fun e!728639 () Bool)

(assert (=> start!108112 e!728639))

(assert (=> start!108112 true))

(declare-fun b!1276396 () Bool)

(declare-fun e!728638 () Bool)

(assert (=> b!1276396 (= e!728637 e!728638)))

(declare-fun res!848099 () Bool)

(assert (=> b!1276396 (=> res!848099 e!728638)))

(assert (=> b!1276396 (= res!848099 false)))

(declare-fun b!1276398 () Bool)

(declare-fun tp_is_empty!33217 () Bool)

(declare-fun tp!98078 () Bool)

(assert (=> b!1276398 (= e!728639 (and tp_is_empty!33217 tp!98078))))

(declare-fun b!1276395 () Bool)

(declare-fun res!848097 () Bool)

(assert (=> b!1276395 (=> (not res!848097) (not e!728637))))

(declare-fun key!173 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1276395 (= res!848097 (and (or (not ((_ is Cons!28633) l!595)) (not (= (_1!10739 (h!29851 l!595)) key!173))) (or (not ((_ is Cons!28633) l!595)) (= (_1!10739 (h!29851 l!595)) key!173)) ((_ is Nil!28634) l!595)))))

(declare-fun b!1276397 () Bool)

(declare-fun containsKey!706 (List!28637 (_ BitVec 64)) Bool)

(assert (=> b!1276397 (= e!728638 (containsKey!706 Nil!28634 key!173))))

(assert (= (and start!108112 res!848098) b!1276395))

(assert (= (and b!1276395 res!848097) b!1276396))

(assert (= (and b!1276396 (not res!848099)) b!1276397))

(assert (= (and start!108112 ((_ is Cons!28633) l!595)) b!1276398))

(declare-fun m!1173131 () Bool)

(assert (=> start!108112 m!1173131))

(declare-fun m!1173133 () Bool)

(assert (=> b!1276397 m!1173133))

(check-sat (not start!108112) (not b!1276397) (not b!1276398) tp_is_empty!33217)
(check-sat)
(get-model)

(declare-fun d!140767 () Bool)

(declare-fun res!848124 () Bool)

(declare-fun e!728664 () Bool)

(assert (=> d!140767 (=> res!848124 e!728664)))

(assert (=> d!140767 (= res!848124 (or ((_ is Nil!28634) l!595) ((_ is Nil!28634) (t!42165 l!595))))))

(assert (=> d!140767 (= (isStrictlySorted!850 l!595) e!728664)))

(declare-fun b!1276429 () Bool)

(declare-fun e!728665 () Bool)

(assert (=> b!1276429 (= e!728664 e!728665)))

(declare-fun res!848125 () Bool)

(assert (=> b!1276429 (=> (not res!848125) (not e!728665))))

(assert (=> b!1276429 (= res!848125 (bvslt (_1!10739 (h!29851 l!595)) (_1!10739 (h!29851 (t!42165 l!595)))))))

(declare-fun b!1276430 () Bool)

(assert (=> b!1276430 (= e!728665 (isStrictlySorted!850 (t!42165 l!595)))))

(assert (= (and d!140767 (not res!848124)) b!1276429))

(assert (= (and b!1276429 res!848125) b!1276430))

(declare-fun m!1173143 () Bool)

(assert (=> b!1276430 m!1173143))

(assert (=> start!108112 d!140767))

(declare-fun d!140773 () Bool)

(declare-fun res!848144 () Bool)

(declare-fun e!728684 () Bool)

(assert (=> d!140773 (=> res!848144 e!728684)))

(assert (=> d!140773 (= res!848144 (and ((_ is Cons!28633) Nil!28634) (= (_1!10739 (h!29851 Nil!28634)) key!173)))))

(assert (=> d!140773 (= (containsKey!706 Nil!28634 key!173) e!728684)))

(declare-fun b!1276449 () Bool)

(declare-fun e!728685 () Bool)

(assert (=> b!1276449 (= e!728684 e!728685)))

(declare-fun res!848145 () Bool)

(assert (=> b!1276449 (=> (not res!848145) (not e!728685))))

(assert (=> b!1276449 (= res!848145 (and (or (not ((_ is Cons!28633) Nil!28634)) (bvsle (_1!10739 (h!29851 Nil!28634)) key!173)) ((_ is Cons!28633) Nil!28634) (bvslt (_1!10739 (h!29851 Nil!28634)) key!173)))))

(declare-fun b!1276450 () Bool)

(assert (=> b!1276450 (= e!728685 (containsKey!706 (t!42165 Nil!28634) key!173))))

(assert (= (and d!140773 (not res!848144)) b!1276449))

(assert (= (and b!1276449 res!848145) b!1276450))

(declare-fun m!1173149 () Bool)

(assert (=> b!1276450 m!1173149))

(assert (=> b!1276397 d!140773))

(declare-fun b!1276457 () Bool)

(declare-fun e!728690 () Bool)

(declare-fun tp!98087 () Bool)

(assert (=> b!1276457 (= e!728690 (and tp_is_empty!33217 tp!98087))))

(assert (=> b!1276398 (= tp!98078 e!728690)))

(assert (= (and b!1276398 ((_ is Cons!28633) (t!42165 l!595))) b!1276457))

(check-sat (not b!1276450) (not b!1276430) (not b!1276457) tp_is_empty!33217)
(check-sat)
