; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107906 () Bool)

(assert start!107906)

(declare-fun res!847609 () Bool)

(declare-fun e!727831 () Bool)

(assert (=> start!107906 (=> (not res!847609) (not e!727831))))

(declare-datatypes ((B!2180 0))(
  ( (B!2181 (val!16686 Int)) )
))
(declare-datatypes ((tuple2!21530 0))(
  ( (tuple2!21531 (_1!10776 (_ BitVec 64)) (_2!10776 B!2180)) )
))
(declare-datatypes ((List!28685 0))(
  ( (Nil!28682) (Cons!28681 (h!29890 tuple2!21530) (t!42213 List!28685)) )
))
(declare-fun l!595 () List!28685)

(declare-fun isStrictlySorted!861 (List!28685) Bool)

(assert (=> start!107906 (= res!847609 (isStrictlySorted!861 l!595))))

(assert (=> start!107906 e!727831))

(declare-fun e!727832 () Bool)

(assert (=> start!107906 e!727832))

(assert (=> start!107906 true))

(declare-fun b!1275109 () Bool)

(declare-fun key!173 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1275109 (= e!727831 (and (or (not ((_ is Cons!28681) l!595)) (not (= (_1!10776 (h!29890 l!595)) key!173))) (or (not ((_ is Cons!28681) l!595)) (= (_1!10776 (h!29890 l!595)) key!173)) (not ((_ is Nil!28682) l!595))))))

(declare-fun b!1275110 () Bool)

(declare-fun tp_is_empty!33223 () Bool)

(declare-fun tp!98097 () Bool)

(assert (=> b!1275110 (= e!727832 (and tp_is_empty!33223 tp!98097))))

(assert (= (and start!107906 res!847609) b!1275109))

(assert (= (and start!107906 ((_ is Cons!28681) l!595)) b!1275110))

(declare-fun m!1171043 () Bool)

(assert (=> start!107906 m!1171043))

(check-sat (not start!107906) (not b!1275110) tp_is_empty!33223)
(check-sat)
