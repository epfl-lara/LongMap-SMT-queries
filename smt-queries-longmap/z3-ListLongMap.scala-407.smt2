; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7614 () Bool)

(assert start!7614)

(declare-fun b!48582 () Bool)

(declare-fun res!28210 () Bool)

(declare-fun e!31188 () Bool)

(assert (=> b!48582 (=> (not res!28210) (not e!31188))))

(declare-datatypes ((B!958 0))(
  ( (B!959 (val!1099 Int)) )
))
(declare-datatypes ((tuple2!1780 0))(
  ( (tuple2!1781 (_1!901 (_ BitVec 64)) (_2!901 B!958)) )
))
(declare-datatypes ((List!1296 0))(
  ( (Nil!1293) (Cons!1292 (h!1872 tuple2!1780) (t!4324 List!1296)) )
))
(declare-fun l!1333 () List!1296)

(get-info :version)

(assert (=> b!48582 (= res!28210 (not ((_ is Nil!1293) l!1333)))))

(declare-fun b!48583 () Bool)

(assert (=> b!48583 (= e!31188 false)))

(declare-datatypes ((Unit!1365 0))(
  ( (Unit!1366) )
))
(declare-fun lt!20669 () Unit!1365)

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun newValue!147 () B!958)

(declare-fun lemmaInsertStrictlySortedNotContainedContent!5 (List!1296 (_ BitVec 64) B!958) Unit!1365)

(assert (=> b!48583 (= lt!20669 (lemmaInsertStrictlySortedNotContainedContent!5 (t!4324 l!1333) newKey!147 newValue!147))))

(declare-fun b!48584 () Bool)

(declare-fun e!31189 () Bool)

(declare-fun tp_is_empty!2109 () Bool)

(declare-fun tp!6422 () Bool)

(assert (=> b!48584 (= e!31189 (and tp_is_empty!2109 tp!6422))))

(declare-fun b!48581 () Bool)

(declare-fun res!28209 () Bool)

(assert (=> b!48581 (=> (not res!28209) (not e!31188))))

(declare-fun containsKey!112 (List!1296 (_ BitVec 64)) Bool)

(assert (=> b!48581 (= res!28209 (not (containsKey!112 l!1333 newKey!147)))))

(declare-fun res!28211 () Bool)

(assert (=> start!7614 (=> (not res!28211) (not e!31188))))

(declare-fun isStrictlySorted!263 (List!1296) Bool)

(assert (=> start!7614 (= res!28211 (isStrictlySorted!263 l!1333))))

(assert (=> start!7614 e!31188))

(assert (=> start!7614 e!31189))

(assert (=> start!7614 true))

(assert (=> start!7614 tp_is_empty!2109))

(assert (= (and start!7614 res!28211) b!48581))

(assert (= (and b!48581 res!28209) b!48582))

(assert (= (and b!48582 res!28210) b!48583))

(assert (= (and start!7614 ((_ is Cons!1292) l!1333)) b!48584))

(declare-fun m!42321 () Bool)

(assert (=> b!48583 m!42321))

(declare-fun m!42323 () Bool)

(assert (=> b!48581 m!42323))

(declare-fun m!42325 () Bool)

(assert (=> start!7614 m!42325))

(check-sat tp_is_empty!2109 (not start!7614) (not b!48584) (not b!48581) (not b!48583))
