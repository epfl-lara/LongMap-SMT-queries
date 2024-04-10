; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107826 () Bool)

(assert start!107826)

(declare-fun b!1274754 () Bool)

(declare-fun e!727527 () Bool)

(declare-fun tp_is_empty!33203 () Bool)

(declare-fun tp!98027 () Bool)

(assert (=> b!1274754 (= e!727527 (and tp_is_empty!33203 tp!98027))))

(declare-fun b!1274752 () Bool)

(declare-fun e!727526 () Bool)

(declare-fun e!727528 () Bool)

(assert (=> b!1274752 (= e!727526 e!727528)))

(declare-fun res!847379 () Bool)

(assert (=> b!1274752 (=> res!847379 e!727528)))

(declare-datatypes ((B!2160 0))(
  ( (B!2161 (val!16676 Int)) )
))
(declare-datatypes ((tuple2!21434 0))(
  ( (tuple2!21435 (_1!10728 (_ BitVec 64)) (_2!10728 B!2160)) )
))
(declare-datatypes ((List!28602 0))(
  ( (Nil!28599) (Cons!28598 (h!29807 tuple2!21434) (t!42135 List!28602)) )
))
(declare-fun l!595 () List!28602)

(declare-fun isStrictlySorted!854 (List!28602) Bool)

(assert (=> b!1274752 (= res!847379 (not (isStrictlySorted!854 (t!42135 l!595))))))

(declare-fun b!1274751 () Bool)

(declare-fun res!847380 () Bool)

(assert (=> b!1274751 (=> (not res!847380) (not e!727526))))

(declare-fun key!173 () (_ BitVec 64))

(assert (=> b!1274751 (= res!847380 (and (is-Cons!28598 l!595) (= (_1!10728 (h!29807 l!595)) key!173)))))

(declare-fun b!1274753 () Bool)

(declare-fun containsKey!702 (List!28602 (_ BitVec 64)) Bool)

(assert (=> b!1274753 (= e!727528 (containsKey!702 (t!42135 l!595) key!173))))

(declare-fun res!847381 () Bool)

(assert (=> start!107826 (=> (not res!847381) (not e!727526))))

(assert (=> start!107826 (= res!847381 (isStrictlySorted!854 l!595))))

(assert (=> start!107826 e!727526))

(assert (=> start!107826 e!727527))

(assert (=> start!107826 true))

(assert (= (and start!107826 res!847381) b!1274751))

(assert (= (and b!1274751 res!847380) b!1274752))

(assert (= (and b!1274752 (not res!847379)) b!1274753))

(assert (= (and start!107826 (is-Cons!28598 l!595)) b!1274754))

(declare-fun m!1171345 () Bool)

(assert (=> b!1274752 m!1171345))

(declare-fun m!1171347 () Bool)

(assert (=> b!1274753 m!1171347))

(declare-fun m!1171349 () Bool)

(assert (=> start!107826 m!1171349))

(push 1)

(assert (not b!1274753))

(assert (not start!107826))

(assert tp_is_empty!33203)

(assert (not b!1274754))

(assert (not b!1274752))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!140215 () Bool)

(declare-fun res!847414 () Bool)

(declare-fun e!727567 () Bool)

(assert (=> d!140215 (=> res!847414 e!727567)))

(assert (=> d!140215 (= res!847414 (and (is-Cons!28598 (t!42135 l!595)) (= (_1!10728 (h!29807 (t!42135 l!595))) key!173)))))

(assert (=> d!140215 (= (containsKey!702 (t!42135 l!595) key!173) e!727567)))

(declare-fun b!1274797 () Bool)

(declare-fun e!727568 () Bool)

(assert (=> b!1274797 (= e!727567 e!727568)))

(declare-fun res!847415 () Bool)

(assert (=> b!1274797 (=> (not res!847415) (not e!727568))))

(assert (=> b!1274797 (= res!847415 (and (or (not (is-Cons!28598 (t!42135 l!595))) (bvsle (_1!10728 (h!29807 (t!42135 l!595))) key!173)) (is-Cons!28598 (t!42135 l!595)) (bvslt (_1!10728 (h!29807 (t!42135 l!595))) key!173)))))

(declare-fun b!1274798 () Bool)

(assert (=> b!1274798 (= e!727568 (containsKey!702 (t!42135 (t!42135 l!595)) key!173))))

(assert (= (and d!140215 (not res!847414)) b!1274797))

(assert (= (and b!1274797 res!847415) b!1274798))

(declare-fun m!1171359 () Bool)

(assert (=> b!1274798 m!1171359))

(assert (=> b!1274753 d!140215))

(declare-fun d!140219 () Bool)

(declare-fun res!847420 () Bool)

(declare-fun e!727573 () Bool)

(assert (=> d!140219 (=> res!847420 e!727573)))

(assert (=> d!140219 (= res!847420 (or (is-Nil!28599 l!595) (is-Nil!28599 (t!42135 l!595))))))

(assert (=> d!140219 (= (isStrictlySorted!854 l!595) e!727573)))

(declare-fun b!1274803 () Bool)

(declare-fun e!727574 () Bool)

(assert (=> b!1274803 (= e!727573 e!727574)))

(declare-fun res!847421 () Bool)

(assert (=> b!1274803 (=> (not res!847421) (not e!727574))))

(assert (=> b!1274803 (= res!847421 (bvslt (_1!10728 (h!29807 l!595)) (_1!10728 (h!29807 (t!42135 l!595)))))))

(declare-fun b!1274804 () Bool)

(assert (=> b!1274804 (= e!727574 (isStrictlySorted!854 (t!42135 l!595)))))

(assert (= (and d!140219 (not res!847420)) b!1274803))

(assert (= (and b!1274803 res!847421) b!1274804))

(assert (=> b!1274804 m!1171345))

(assert (=> start!107826 d!140219))

(declare-fun d!140221 () Bool)

(declare-fun res!847422 () Bool)

(declare-fun e!727575 () Bool)

(assert (=> d!140221 (=> res!847422 e!727575)))

(assert (=> d!140221 (= res!847422 (or (is-Nil!28599 (t!42135 l!595)) (is-Nil!28599 (t!42135 (t!42135 l!595)))))))

