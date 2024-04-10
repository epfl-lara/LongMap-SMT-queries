; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107910 () Bool)

(assert start!107910)

(declare-fun res!847642 () Bool)

(declare-fun e!727872 () Bool)

(assert (=> start!107910 (=> (not res!847642) (not e!727872))))

(declare-datatypes ((B!2184 0))(
  ( (B!2185 (val!16688 Int)) )
))
(declare-datatypes ((tuple2!21458 0))(
  ( (tuple2!21459 (_1!10740 (_ BitVec 64)) (_2!10740 B!2184)) )
))
(declare-datatypes ((List!28614 0))(
  ( (Nil!28611) (Cons!28610 (h!29819 tuple2!21458) (t!42150 List!28614)) )
))
(declare-fun l!595 () List!28614)

(declare-fun isStrictlySorted!866 (List!28614) Bool)

(assert (=> start!107910 (= res!847642 (isStrictlySorted!866 l!595))))

(assert (=> start!107910 e!727872))

(declare-fun e!727873 () Bool)

(assert (=> start!107910 e!727873))

(assert (=> start!107910 true))

(declare-fun b!1275185 () Bool)

(declare-fun key!173 () (_ BitVec 64))

(assert (=> b!1275185 (= e!727872 (and (or (not (is-Cons!28610 l!595)) (not (= (_1!10740 (h!29819 l!595)) key!173))) (or (not (is-Cons!28610 l!595)) (= (_1!10740 (h!29819 l!595)) key!173)) (not (is-Nil!28611 l!595))))))

(declare-fun b!1275186 () Bool)

(declare-fun tp_is_empty!33227 () Bool)

(declare-fun tp!98102 () Bool)

(assert (=> b!1275186 (= e!727873 (and tp_is_empty!33227 tp!98102))))

(assert (= (and start!107910 res!847642) b!1275185))

(assert (= (and start!107910 (is-Cons!28610 l!595)) b!1275186))

(declare-fun m!1171547 () Bool)

(assert (=> start!107910 m!1171547))

(push 1)

