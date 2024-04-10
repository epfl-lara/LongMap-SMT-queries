; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107908 () Bool)

(assert start!107908)

(declare-fun res!847639 () Bool)

(declare-fun e!727866 () Bool)

(assert (=> start!107908 (=> (not res!847639) (not e!727866))))

(declare-datatypes ((B!2182 0))(
  ( (B!2183 (val!16687 Int)) )
))
(declare-datatypes ((tuple2!21456 0))(
  ( (tuple2!21457 (_1!10739 (_ BitVec 64)) (_2!10739 B!2182)) )
))
(declare-datatypes ((List!28613 0))(
  ( (Nil!28610) (Cons!28609 (h!29818 tuple2!21456) (t!42149 List!28613)) )
))
(declare-fun l!595 () List!28613)

(declare-fun isStrictlySorted!865 (List!28613) Bool)

(assert (=> start!107908 (= res!847639 (isStrictlySorted!865 l!595))))

(assert (=> start!107908 e!727866))

(declare-fun e!727867 () Bool)

(assert (=> start!107908 e!727867))

(assert (=> start!107908 true))

(declare-fun b!1275179 () Bool)

(declare-fun key!173 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1275179 (= e!727866 (and (or (not ((_ is Cons!28609) l!595)) (not (= (_1!10739 (h!29818 l!595)) key!173))) (or (not ((_ is Cons!28609) l!595)) (= (_1!10739 (h!29818 l!595)) key!173)) (not ((_ is Nil!28610) l!595))))))

(declare-fun b!1275180 () Bool)

(declare-fun tp_is_empty!33225 () Bool)

(declare-fun tp!98099 () Bool)

(assert (=> b!1275180 (= e!727867 (and tp_is_empty!33225 tp!98099))))

(assert (= (and start!107908 res!847639) b!1275179))

(assert (= (and start!107908 ((_ is Cons!28609) l!595)) b!1275180))

(declare-fun m!1171545 () Bool)

(assert (=> start!107908 m!1171545))

(check-sat (not start!107908) (not b!1275180) tp_is_empty!33225)
(check-sat)
