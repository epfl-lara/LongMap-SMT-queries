; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107890 () Bool)

(assert start!107890)

(declare-fun b!1275103 () Bool)

(declare-fun e!727799 () Bool)

(declare-fun e!727801 () Bool)

(assert (=> b!1275103 (= e!727799 e!727801)))

(declare-fun res!847587 () Bool)

(assert (=> b!1275103 (=> res!847587 e!727801)))

(assert (=> b!1275103 (= res!847587 false)))

(declare-fun b!1275104 () Bool)

(declare-fun key!173 () (_ BitVec 64))

(declare-datatypes ((B!2176 0))(
  ( (B!2177 (val!16684 Int)) )
))
(declare-datatypes ((tuple2!21450 0))(
  ( (tuple2!21451 (_1!10736 (_ BitVec 64)) (_2!10736 B!2176)) )
))
(declare-datatypes ((List!28610 0))(
  ( (Nil!28607) (Cons!28606 (h!29815 tuple2!21450) (t!42146 List!28610)) )
))
(declare-fun containsKey!707 (List!28610 (_ BitVec 64)) Bool)

(assert (=> b!1275104 (= e!727801 (containsKey!707 Nil!28607 key!173))))

(declare-fun b!1275105 () Bool)

(declare-fun e!727800 () Bool)

(declare-fun tp_is_empty!33219 () Bool)

(declare-fun tp!98081 () Bool)

(assert (=> b!1275105 (= e!727800 (and tp_is_empty!33219 tp!98081))))

(declare-fun b!1275102 () Bool)

(declare-fun res!847586 () Bool)

(assert (=> b!1275102 (=> (not res!847586) (not e!727799))))

(declare-fun l!595 () List!28610)

(get-info :version)

(assert (=> b!1275102 (= res!847586 (and (or (not ((_ is Cons!28606) l!595)) (not (= (_1!10736 (h!29815 l!595)) key!173))) (or (not ((_ is Cons!28606) l!595)) (= (_1!10736 (h!29815 l!595)) key!173)) ((_ is Nil!28607) l!595)))))

(declare-fun res!847588 () Bool)

(assert (=> start!107890 (=> (not res!847588) (not e!727799))))

(declare-fun isStrictlySorted!862 (List!28610) Bool)

(assert (=> start!107890 (= res!847588 (isStrictlySorted!862 l!595))))

(assert (=> start!107890 e!727799))

(assert (=> start!107890 e!727800))

(assert (=> start!107890 true))

(assert (= (and start!107890 res!847588) b!1275102))

(assert (= (and b!1275102 res!847586) b!1275103))

(assert (= (and b!1275103 (not res!847587)) b!1275104))

(assert (= (and start!107890 ((_ is Cons!28606) l!595)) b!1275105))

(declare-fun m!1171523 () Bool)

(assert (=> b!1275104 m!1171523))

(declare-fun m!1171525 () Bool)

(assert (=> start!107890 m!1171525))

(check-sat (not b!1275104) (not start!107890) (not b!1275105) tp_is_empty!33219)
(check-sat)
(get-model)

(declare-fun d!140325 () Bool)

(declare-fun res!847626 () Bool)

(declare-fun e!727845 () Bool)

(assert (=> d!140325 (=> res!847626 e!727845)))

(assert (=> d!140325 (= res!847626 (and ((_ is Cons!28606) Nil!28607) (= (_1!10736 (h!29815 Nil!28607)) key!173)))))

(assert (=> d!140325 (= (containsKey!707 Nil!28607 key!173) e!727845)))

(declare-fun b!1275156 () Bool)

(declare-fun e!727846 () Bool)

(assert (=> b!1275156 (= e!727845 e!727846)))

(declare-fun res!847627 () Bool)

(assert (=> b!1275156 (=> (not res!847627) (not e!727846))))

(assert (=> b!1275156 (= res!847627 (and (or (not ((_ is Cons!28606) Nil!28607)) (bvsle (_1!10736 (h!29815 Nil!28607)) key!173)) ((_ is Cons!28606) Nil!28607) (bvslt (_1!10736 (h!29815 Nil!28607)) key!173)))))

(declare-fun b!1275157 () Bool)

(assert (=> b!1275157 (= e!727846 (containsKey!707 (t!42146 Nil!28607) key!173))))

(assert (= (and d!140325 (not res!847626)) b!1275156))

(assert (= (and b!1275156 res!847627) b!1275157))

(declare-fun m!1171539 () Bool)

(assert (=> b!1275157 m!1171539))

(assert (=> b!1275104 d!140325))

(declare-fun d!140329 () Bool)

(declare-fun res!847632 () Bool)

(declare-fun e!727851 () Bool)

(assert (=> d!140329 (=> res!847632 e!727851)))

(assert (=> d!140329 (= res!847632 (or ((_ is Nil!28607) l!595) ((_ is Nil!28607) (t!42146 l!595))))))

(assert (=> d!140329 (= (isStrictlySorted!862 l!595) e!727851)))

(declare-fun b!1275162 () Bool)

(declare-fun e!727852 () Bool)

(assert (=> b!1275162 (= e!727851 e!727852)))

