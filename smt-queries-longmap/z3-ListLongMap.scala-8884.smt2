; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107888 () Bool)

(assert start!107888)

(declare-fun res!847550 () Bool)

(declare-fun e!727763 () Bool)

(assert (=> start!107888 (=> (not res!847550) (not e!727763))))

(declare-datatypes ((B!2174 0))(
  ( (B!2175 (val!16683 Int)) )
))
(declare-datatypes ((tuple2!21524 0))(
  ( (tuple2!21525 (_1!10773 (_ BitVec 64)) (_2!10773 B!2174)) )
))
(declare-datatypes ((List!28682 0))(
  ( (Nil!28679) (Cons!28678 (h!29887 tuple2!21524) (t!42210 List!28682)) )
))
(declare-fun l!595 () List!28682)

(declare-fun isStrictlySorted!858 (List!28682) Bool)

(assert (=> start!107888 (= res!847550 (isStrictlySorted!858 l!595))))

(assert (=> start!107888 e!727763))

(declare-fun e!727762 () Bool)

(assert (=> start!107888 e!727762))

(assert (=> start!107888 true))

(declare-fun b!1275028 () Bool)

(declare-fun e!727761 () Bool)

(declare-fun key!173 () (_ BitVec 64))

(declare-fun containsKey!704 (List!28682 (_ BitVec 64)) Bool)

(assert (=> b!1275028 (= e!727761 (containsKey!704 Nil!28679 key!173))))

(declare-fun b!1275029 () Bool)

(declare-fun tp_is_empty!33217 () Bool)

(declare-fun tp!98079 () Bool)

(assert (=> b!1275029 (= e!727762 (and tp_is_empty!33217 tp!98079))))

(declare-fun b!1275026 () Bool)

(declare-fun res!847551 () Bool)

(assert (=> b!1275026 (=> (not res!847551) (not e!727763))))

(get-info :version)

(assert (=> b!1275026 (= res!847551 (and (or (not ((_ is Cons!28678) l!595)) (not (= (_1!10773 (h!29887 l!595)) key!173))) (or (not ((_ is Cons!28678) l!595)) (= (_1!10773 (h!29887 l!595)) key!173)) ((_ is Nil!28679) l!595)))))

(declare-fun b!1275027 () Bool)

(assert (=> b!1275027 (= e!727763 e!727761)))

(declare-fun res!847552 () Bool)

(assert (=> b!1275027 (=> res!847552 e!727761)))

(assert (=> b!1275027 (= res!847552 false)))

(assert (= (and start!107888 res!847550) b!1275026))

(assert (= (and b!1275026 res!847551) b!1275027))

(assert (= (and b!1275027 (not res!847552)) b!1275028))

(assert (= (and start!107888 ((_ is Cons!28678) l!595)) b!1275029))

(declare-fun m!1171019 () Bool)

(assert (=> start!107888 m!1171019))

(declare-fun m!1171021 () Bool)

(assert (=> b!1275028 m!1171021))

(check-sat (not start!107888) (not b!1275028) (not b!1275029) tp_is_empty!33217)
(check-sat)
(get-model)

(declare-fun d!140207 () Bool)

(declare-fun res!847575 () Bool)

(declare-fun e!727786 () Bool)

(assert (=> d!140207 (=> res!847575 e!727786)))

(assert (=> d!140207 (= res!847575 (or ((_ is Nil!28679) l!595) ((_ is Nil!28679) (t!42210 l!595))))))

(assert (=> d!140207 (= (isStrictlySorted!858 l!595) e!727786)))

(declare-fun b!1275058 () Bool)

(declare-fun e!727787 () Bool)

(assert (=> b!1275058 (= e!727786 e!727787)))

(declare-fun res!847576 () Bool)

(assert (=> b!1275058 (=> (not res!847576) (not e!727787))))

(assert (=> b!1275058 (= res!847576 (bvslt (_1!10773 (h!29887 l!595)) (_1!10773 (h!29887 (t!42210 l!595)))))))

(declare-fun b!1275059 () Bool)

(assert (=> b!1275059 (= e!727787 (isStrictlySorted!858 (t!42210 l!595)))))

(assert (= (and d!140207 (not res!847575)) b!1275058))

(assert (= (and b!1275058 res!847576) b!1275059))

(declare-fun m!1171031 () Bool)

(assert (=> b!1275059 m!1171031))

(assert (=> start!107888 d!140207))

(declare-fun d!140209 () Bool)

(declare-fun res!847581 () Bool)

(declare-fun e!727792 () Bool)

(assert (=> d!140209 (=> res!847581 e!727792)))

(assert (=> d!140209 (= res!847581 (and ((_ is Cons!28678) Nil!28679) (= (_1!10773 (h!29887 Nil!28679)) key!173)))))

(assert (=> d!140209 (= (containsKey!704 Nil!28679 key!173) e!727792)))

(declare-fun b!1275064 () Bool)

(declare-fun e!727793 () Bool)

(assert (=> b!1275064 (= e!727792 e!727793)))

(declare-fun res!847582 () Bool)

(assert (=> b!1275064 (=> (not res!847582) (not e!727793))))

(assert (=> b!1275064 (= res!847582 (and (or (not ((_ is Cons!28678) Nil!28679)) (bvsle (_1!10773 (h!29887 Nil!28679)) key!173)) ((_ is Cons!28678) Nil!28679) (bvslt (_1!10773 (h!29887 Nil!28679)) key!173)))))

(declare-fun b!1275065 () Bool)

(assert (=> b!1275065 (= e!727793 (containsKey!704 (t!42210 Nil!28679) key!173))))

(assert (= (and d!140209 (not res!847581)) b!1275064))

(assert (= (and b!1275064 res!847582) b!1275065))

(declare-fun m!1171033 () Bool)

(assert (=> b!1275065 m!1171033))

(assert (=> b!1275028 d!140209))

(declare-fun b!1275070 () Bool)

(declare-fun e!727796 () Bool)

(declare-fun tp!98088 () Bool)

(assert (=> b!1275070 (= e!727796 (and tp_is_empty!33217 tp!98088))))

(assert (=> b!1275029 (= tp!98079 e!727796)))

(assert (= (and b!1275029 ((_ is Cons!28678) (t!42210 l!595))) b!1275070))

(check-sat (not b!1275065) (not b!1275059) (not b!1275070) tp_is_empty!33217)
(check-sat)
