; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106350 () Bool)

(assert start!106350)

(declare-fun b!1265006 () Bool)

(declare-fun e!720395 () Bool)

(assert (=> b!1265006 (= e!720395 (not true))))

(declare-datatypes ((B!1948 0))(
  ( (B!1949 (val!16309 Int)) )
))
(declare-datatypes ((tuple2!21136 0))(
  ( (tuple2!21137 (_1!10579 (_ BitVec 64)) (_2!10579 B!1948)) )
))
(declare-datatypes ((List!28301 0))(
  ( (Nil!28298) (Cons!28297 (h!29506 tuple2!21136) (t!41822 List!28301)) )
))
(declare-fun l!706 () List!28301)

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun v1!26 () B!1948)

(declare-fun removeStrictlySorted!150 (List!28301 (_ BitVec 64)) List!28301)

(declare-fun insertStrictlySorted!457 (List!28301 (_ BitVec 64) B!1948) List!28301)

(assert (=> b!1265006 (= (removeStrictlySorted!150 (insertStrictlySorted!457 (t!41822 l!706) key1!31 v1!26) key1!31) (t!41822 l!706))))

(declare-datatypes ((Unit!42173 0))(
  ( (Unit!42174) )
))
(declare-fun lt!573999 () Unit!42173)

(declare-fun lemmaInsertStrictlySortedThenRemoveIsSame!5 (List!28301 (_ BitVec 64) B!1948) Unit!42173)

(assert (=> b!1265006 (= lt!573999 (lemmaInsertStrictlySortedThenRemoveIsSame!5 (t!41822 l!706) key1!31 v1!26))))

(declare-fun res!842355 () Bool)

(assert (=> start!106350 (=> (not res!842355) (not e!720395))))

(declare-fun isStrictlySorted!779 (List!28301) Bool)

(assert (=> start!106350 (= res!842355 (isStrictlySorted!779 l!706))))

(assert (=> start!106350 e!720395))

(declare-fun e!720394 () Bool)

(assert (=> start!106350 e!720394))

(assert (=> start!106350 true))

(declare-fun tp_is_empty!32481 () Bool)

(assert (=> start!106350 tp_is_empty!32481))

(declare-fun b!1265007 () Bool)

(declare-fun res!842353 () Bool)

(assert (=> b!1265007 (=> (not res!842353) (not e!720395))))

(declare-fun containsKey!638 (List!28301 (_ BitVec 64)) Bool)

(assert (=> b!1265007 (= res!842353 (not (containsKey!638 l!706 key1!31)))))

(declare-fun b!1265008 () Bool)

(declare-fun res!842352 () Bool)

(assert (=> b!1265008 (=> (not res!842352) (not e!720395))))

(assert (=> b!1265008 (= res!842352 (not (containsKey!638 (t!41822 l!706) key1!31)))))

(declare-fun b!1265009 () Bool)

(declare-fun res!842356 () Bool)

(assert (=> b!1265009 (=> (not res!842356) (not e!720395))))

(get-info :version)

(assert (=> b!1265009 (= res!842356 ((_ is Cons!28297) l!706))))

(declare-fun b!1265010 () Bool)

(declare-fun res!842354 () Bool)

(assert (=> b!1265010 (=> (not res!842354) (not e!720395))))

(assert (=> b!1265010 (= res!842354 (isStrictlySorted!779 (t!41822 l!706)))))

(declare-fun b!1265011 () Bool)

(declare-fun tp!96287 () Bool)

(assert (=> b!1265011 (= e!720394 (and tp_is_empty!32481 tp!96287))))

(assert (= (and start!106350 res!842355) b!1265007))

(assert (= (and b!1265007 res!842353) b!1265009))

(assert (= (and b!1265009 res!842356) b!1265010))

(assert (= (and b!1265010 res!842354) b!1265008))

(assert (= (and b!1265008 res!842352) b!1265006))

(assert (= (and start!106350 ((_ is Cons!28297) l!706)) b!1265011))

(declare-fun m!1165385 () Bool)

(assert (=> start!106350 m!1165385))

(declare-fun m!1165387 () Bool)

(assert (=> b!1265010 m!1165387))

(declare-fun m!1165389 () Bool)

(assert (=> b!1265006 m!1165389))

(assert (=> b!1265006 m!1165389))

(declare-fun m!1165391 () Bool)

(assert (=> b!1265006 m!1165391))

(declare-fun m!1165393 () Bool)

(assert (=> b!1265006 m!1165393))

(declare-fun m!1165395 () Bool)

(assert (=> b!1265008 m!1165395))

(declare-fun m!1165397 () Bool)

(assert (=> b!1265007 m!1165397))

(check-sat (not b!1265007) (not b!1265006) (not b!1265010) tp_is_empty!32481 (not b!1265008) (not start!106350) (not b!1265011))
(check-sat)
