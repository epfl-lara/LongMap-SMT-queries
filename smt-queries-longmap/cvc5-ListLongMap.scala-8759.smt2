; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106348 () Bool)

(assert start!106348)

(declare-fun b!1264988 () Bool)

(declare-fun res!842339 () Bool)

(declare-fun e!720388 () Bool)

(assert (=> b!1264988 (=> (not res!842339) (not e!720388))))

(declare-datatypes ((B!1946 0))(
  ( (B!1947 (val!16308 Int)) )
))
(declare-datatypes ((tuple2!21134 0))(
  ( (tuple2!21135 (_1!10578 (_ BitVec 64)) (_2!10578 B!1946)) )
))
(declare-datatypes ((List!28300 0))(
  ( (Nil!28297) (Cons!28296 (h!29505 tuple2!21134) (t!41821 List!28300)) )
))
(declare-fun l!706 () List!28300)

(assert (=> b!1264988 (= res!842339 (is-Cons!28296 l!706))))

(declare-fun b!1264989 () Bool)

(declare-fun res!842338 () Bool)

(assert (=> b!1264989 (=> (not res!842338) (not e!720388))))

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!637 (List!28300 (_ BitVec 64)) Bool)

(assert (=> b!1264989 (= res!842338 (not (containsKey!637 (t!41821 l!706) key1!31)))))

(declare-fun b!1264990 () Bool)

(declare-fun res!842337 () Bool)

(assert (=> b!1264990 (=> (not res!842337) (not e!720388))))

(assert (=> b!1264990 (= res!842337 (not (containsKey!637 l!706 key1!31)))))

(declare-fun res!842341 () Bool)

(assert (=> start!106348 (=> (not res!842341) (not e!720388))))

(declare-fun isStrictlySorted!778 (List!28300) Bool)

(assert (=> start!106348 (= res!842341 (isStrictlySorted!778 l!706))))

(assert (=> start!106348 e!720388))

(declare-fun e!720389 () Bool)

(assert (=> start!106348 e!720389))

(assert (=> start!106348 true))

(declare-fun tp_is_empty!32479 () Bool)

(assert (=> start!106348 tp_is_empty!32479))

(declare-fun b!1264991 () Bool)

(assert (=> b!1264991 (= e!720388 (not true))))

(declare-fun v1!26 () B!1946)

(declare-fun removeStrictlySorted!149 (List!28300 (_ BitVec 64)) List!28300)

(declare-fun insertStrictlySorted!456 (List!28300 (_ BitVec 64) B!1946) List!28300)

(assert (=> b!1264991 (= (removeStrictlySorted!149 (insertStrictlySorted!456 (t!41821 l!706) key1!31 v1!26) key1!31) (t!41821 l!706))))

(declare-datatypes ((Unit!42171 0))(
  ( (Unit!42172) )
))
(declare-fun lt!573996 () Unit!42171)

(declare-fun lemmaInsertStrictlySortedThenRemoveIsSame!4 (List!28300 (_ BitVec 64) B!1946) Unit!42171)

(assert (=> b!1264991 (= lt!573996 (lemmaInsertStrictlySortedThenRemoveIsSame!4 (t!41821 l!706) key1!31 v1!26))))

(declare-fun b!1264992 () Bool)

(declare-fun res!842340 () Bool)

(assert (=> b!1264992 (=> (not res!842340) (not e!720388))))

(assert (=> b!1264992 (= res!842340 (isStrictlySorted!778 (t!41821 l!706)))))

(declare-fun b!1264993 () Bool)

(declare-fun tp!96284 () Bool)

(assert (=> b!1264993 (= e!720389 (and tp_is_empty!32479 tp!96284))))

(assert (= (and start!106348 res!842341) b!1264990))

(assert (= (and b!1264990 res!842337) b!1264988))

(assert (= (and b!1264988 res!842339) b!1264992))

(assert (= (and b!1264992 res!842340) b!1264989))

(assert (= (and b!1264989 res!842338) b!1264991))

(assert (= (and start!106348 (is-Cons!28296 l!706)) b!1264993))

(declare-fun m!1165371 () Bool)

(assert (=> start!106348 m!1165371))

(declare-fun m!1165373 () Bool)

(assert (=> b!1264992 m!1165373))

(declare-fun m!1165375 () Bool)

(assert (=> b!1264991 m!1165375))

(assert (=> b!1264991 m!1165375))

(declare-fun m!1165377 () Bool)

(assert (=> b!1264991 m!1165377))

(declare-fun m!1165379 () Bool)

(assert (=> b!1264991 m!1165379))

(declare-fun m!1165381 () Bool)

(assert (=> b!1264990 m!1165381))

(declare-fun m!1165383 () Bool)

(assert (=> b!1264989 m!1165383))

(push 1)

(assert (not b!1264991))

(assert (not b!1264992))

(assert (not b!1264989))

(assert (not b!1264990))

(assert tp_is_empty!32479)

(assert (not b!1264993))

(assert (not start!106348))

(check-sat)

