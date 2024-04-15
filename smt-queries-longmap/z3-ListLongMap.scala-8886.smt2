; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107912 () Bool)

(assert start!107912)

(declare-fun b!1275133 () Bool)

(declare-fun res!847624 () Bool)

(declare-fun e!727856 () Bool)

(assert (=> b!1275133 (=> (not res!847624) (not e!727856))))

(declare-datatypes ((B!2186 0))(
  ( (B!2187 (val!16689 Int)) )
))
(declare-datatypes ((tuple2!21536 0))(
  ( (tuple2!21537 (_1!10779 (_ BitVec 64)) (_2!10779 B!2186)) )
))
(declare-datatypes ((List!28688 0))(
  ( (Nil!28685) (Cons!28684 (h!29893 tuple2!21536) (t!42216 List!28688)) )
))
(declare-fun l!595 () List!28688)

(declare-fun key!173 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1275133 (= res!847624 (and (or (not ((_ is Cons!28684) l!595)) (not (= (_1!10779 (h!29893 l!595)) key!173))) (or (not ((_ is Cons!28684) l!595)) (= (_1!10779 (h!29893 l!595)) key!173)) (not ((_ is Nil!28685) l!595))))))

(declare-fun b!1275134 () Bool)

(declare-fun e!727854 () Bool)

(declare-fun tp_is_empty!33229 () Bool)

(declare-fun tp!98108 () Bool)

(assert (=> b!1275134 (= e!727854 (and tp_is_empty!33229 tp!98108))))

(declare-fun b!1275135 () Bool)

(declare-fun e!727853 () Bool)

(declare-fun tp!98109 () Bool)

(assert (=> b!1275135 (= e!727853 (and tp_is_empty!33229 tp!98109))))

(declare-fun res!847623 () Bool)

(assert (=> start!107912 (=> (not res!847623) (not e!727856))))

(declare-fun isStrictlySorted!864 (List!28688) Bool)

(assert (=> start!107912 (= res!847623 (isStrictlySorted!864 l!595))))

(assert (=> start!107912 e!727856))

(assert (=> start!107912 e!727853))

(assert (=> start!107912 true))

(declare-fun b!1275136 () Bool)

(declare-fun e!727855 () Bool)

(declare-fun lt!575147 () List!28688)

(declare-fun containsKey!707 (List!28688 (_ BitVec 64)) Bool)

(assert (=> b!1275136 (= e!727855 (containsKey!707 lt!575147 key!173))))

(declare-fun b!1275137 () Bool)

(assert (=> b!1275137 (= e!727856 e!727855)))

(declare-fun res!847622 () Bool)

(assert (=> b!1275137 (=> res!847622 e!727855)))

(assert (=> b!1275137 (= res!847622 (not (isStrictlySorted!864 lt!575147)))))

(declare-fun err!126 () List!28688)

(assert (=> b!1275137 (= lt!575147 err!126)))

(assert (=> b!1275137 true))

(assert (=> b!1275137 e!727854))

(assert (= (and start!107912 res!847623) b!1275133))

(assert (= (and b!1275133 res!847624) b!1275137))

(assert (= (and b!1275137 ((_ is Cons!28684) err!126)) b!1275134))

(assert (= (and b!1275137 (not res!847622)) b!1275136))

(assert (= (and start!107912 ((_ is Cons!28684) l!595)) b!1275135))

(declare-fun m!1171049 () Bool)

(assert (=> start!107912 m!1171049))

(declare-fun m!1171051 () Bool)

(assert (=> b!1275136 m!1171051))

(declare-fun m!1171053 () Bool)

(assert (=> b!1275137 m!1171053))

(check-sat (not start!107912) (not b!1275135) (not b!1275136) (not b!1275137) (not b!1275134) tp_is_empty!33229)
(check-sat)
