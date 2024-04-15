; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7614 () Bool)

(assert start!7614)

(declare-fun b!48503 () Bool)

(declare-fun res!28182 () Bool)

(declare-fun e!31139 () Bool)

(assert (=> b!48503 (=> (not res!28182) (not e!31139))))

(declare-datatypes ((B!956 0))(
  ( (B!957 (val!1098 Int)) )
))
(declare-datatypes ((tuple2!1782 0))(
  ( (tuple2!1783 (_1!902 (_ BitVec 64)) (_2!902 B!956)) )
))
(declare-datatypes ((List!1291 0))(
  ( (Nil!1288) (Cons!1287 (h!1867 tuple2!1782) (t!4318 List!1291)) )
))
(declare-fun l!1333 () List!1291)

(declare-fun newKey!147 () (_ BitVec 64))

(declare-fun containsKey!109 (List!1291 (_ BitVec 64)) Bool)

(assert (=> b!48503 (= res!28182 (not (containsKey!109 l!1333 newKey!147)))))

(declare-fun res!28180 () Bool)

(assert (=> start!7614 (=> (not res!28180) (not e!31139))))

(declare-fun isStrictlySorted!257 (List!1291) Bool)

(assert (=> start!7614 (= res!28180 (isStrictlySorted!257 l!1333))))

(assert (=> start!7614 e!31139))

(declare-fun e!31140 () Bool)

(assert (=> start!7614 e!31140))

(assert (=> start!7614 true))

(declare-fun tp_is_empty!2107 () Bool)

(assert (=> start!7614 tp_is_empty!2107))

(declare-fun b!48504 () Bool)

(declare-fun res!28181 () Bool)

(assert (=> b!48504 (=> (not res!28181) (not e!31139))))

(get-info :version)

(assert (=> b!48504 (= res!28181 (not ((_ is Nil!1288) l!1333)))))

(declare-fun b!48506 () Bool)

(declare-fun tp!6419 () Bool)

(assert (=> b!48506 (= e!31140 (and tp_is_empty!2107 tp!6419))))

(declare-fun b!48505 () Bool)

(assert (=> b!48505 (= e!31139 false)))

(declare-datatypes ((Unit!1368 0))(
  ( (Unit!1369) )
))
(declare-fun lt!20650 () Unit!1368)

(declare-fun newValue!147 () B!956)

(declare-fun lemmaInsertStrictlySortedNotContainedContent!4 (List!1291 (_ BitVec 64) B!956) Unit!1368)

(assert (=> b!48505 (= lt!20650 (lemmaInsertStrictlySortedNotContainedContent!4 (t!4318 l!1333) newKey!147 newValue!147))))

(assert (= (and start!7614 res!28180) b!48503))

(assert (= (and b!48503 res!28182) b!48504))

(assert (= (and b!48504 res!28181) b!48505))

(assert (= (and start!7614 ((_ is Cons!1287) l!1333)) b!48506))

(declare-fun m!42233 () Bool)

(assert (=> b!48503 m!42233))

(declare-fun m!42235 () Bool)

(assert (=> start!7614 m!42235))

(declare-fun m!42237 () Bool)

(assert (=> b!48505 m!42237))

(check-sat (not b!48505) (not b!48506) tp_is_empty!2107 (not start!7614) (not b!48503))
(check-sat)
