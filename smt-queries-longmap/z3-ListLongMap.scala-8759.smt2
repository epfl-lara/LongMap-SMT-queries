; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106344 () Bool)

(assert start!106344)

(declare-fun b!1264906 () Bool)

(declare-fun res!842300 () Bool)

(declare-fun e!720344 () Bool)

(assert (=> b!1264906 (=> (not res!842300) (not e!720344))))

(declare-datatypes ((B!1946 0))(
  ( (B!1947 (val!16308 Int)) )
))
(declare-datatypes ((tuple2!21216 0))(
  ( (tuple2!21217 (_1!10619 (_ BitVec 64)) (_2!10619 B!1946)) )
))
(declare-datatypes ((List!28384 0))(
  ( (Nil!28381) (Cons!28380 (h!29589 tuple2!21216) (t!41896 List!28384)) )
))
(declare-fun l!706 () List!28384)

(declare-fun isStrictlySorted!774 (List!28384) Bool)

(assert (=> b!1264906 (= res!842300 (isStrictlySorted!774 (t!41896 l!706)))))

(declare-fun b!1264907 () Bool)

(declare-fun res!842298 () Bool)

(assert (=> b!1264907 (=> (not res!842298) (not e!720344))))

(get-info :version)

(assert (=> b!1264907 (= res!842298 ((_ is Cons!28380) l!706))))

(declare-fun b!1264908 () Bool)

(assert (=> b!1264908 (= e!720344 (not true))))

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun v1!26 () B!1946)

(declare-fun removeStrictlySorted!149 (List!28384 (_ BitVec 64)) List!28384)

(declare-fun insertStrictlySorted!457 (List!28384 (_ BitVec 64) B!1946) List!28384)

(assert (=> b!1264908 (= (removeStrictlySorted!149 (insertStrictlySorted!457 (t!41896 l!706) key1!31 v1!26) key1!31) (t!41896 l!706))))

(declare-datatypes ((Unit!42021 0))(
  ( (Unit!42022) )
))
(declare-fun lt!573817 () Unit!42021)

(declare-fun lemmaInsertStrictlySortedThenRemoveIsSame!4 (List!28384 (_ BitVec 64) B!1946) Unit!42021)

(assert (=> b!1264908 (= lt!573817 (lemmaInsertStrictlySortedThenRemoveIsSame!4 (t!41896 l!706) key1!31 v1!26))))

(declare-fun b!1264909 () Bool)

(declare-fun e!720343 () Bool)

(declare-fun tp_is_empty!32479 () Bool)

(declare-fun tp!96284 () Bool)

(assert (=> b!1264909 (= e!720343 (and tp_is_empty!32479 tp!96284))))

(declare-fun b!1264910 () Bool)

(declare-fun res!842299 () Bool)

(assert (=> b!1264910 (=> (not res!842299) (not e!720344))))

(declare-fun containsKey!635 (List!28384 (_ BitVec 64)) Bool)

(assert (=> b!1264910 (= res!842299 (not (containsKey!635 l!706 key1!31)))))

(declare-fun b!1264911 () Bool)

(declare-fun res!842297 () Bool)

(assert (=> b!1264911 (=> (not res!842297) (not e!720344))))

(assert (=> b!1264911 (= res!842297 (not (containsKey!635 (t!41896 l!706) key1!31)))))

(declare-fun res!842301 () Bool)

(assert (=> start!106344 (=> (not res!842301) (not e!720344))))

(assert (=> start!106344 (= res!842301 (isStrictlySorted!774 l!706))))

(assert (=> start!106344 e!720344))

(assert (=> start!106344 e!720343))

(assert (=> start!106344 true))

(assert (=> start!106344 tp_is_empty!32479))

(assert (= (and start!106344 res!842301) b!1264910))

(assert (= (and b!1264910 res!842299) b!1264907))

(assert (= (and b!1264907 res!842298) b!1264906))

(assert (= (and b!1264906 res!842300) b!1264911))

(assert (= (and b!1264911 res!842297) b!1264908))

(assert (= (and start!106344 ((_ is Cons!28380) l!706)) b!1264909))

(declare-fun m!1164851 () Bool)

(assert (=> b!1264911 m!1164851))

(declare-fun m!1164853 () Bool)

(assert (=> b!1264906 m!1164853))

(declare-fun m!1164855 () Bool)

(assert (=> b!1264910 m!1164855))

(declare-fun m!1164857 () Bool)

(assert (=> start!106344 m!1164857))

(declare-fun m!1164859 () Bool)

(assert (=> b!1264908 m!1164859))

(assert (=> b!1264908 m!1164859))

(declare-fun m!1164861 () Bool)

(assert (=> b!1264908 m!1164861))

(declare-fun m!1164863 () Bool)

(assert (=> b!1264908 m!1164863))

(check-sat (not b!1264911) (not b!1264909) tp_is_empty!32479 (not b!1264910) (not start!106344) (not b!1264908) (not b!1264906))
(check-sat)
