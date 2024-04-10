; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137138 () Bool)

(assert start!137138)

(declare-fun res!1079625 () Bool)

(declare-fun e!881632 () Bool)

(assert (=> start!137138 (=> (not res!1079625) (not e!881632))))

(declare-datatypes ((B!2654 0))(
  ( (B!2655 (val!19689 Int)) )
))
(declare-datatypes ((tuple2!25504 0))(
  ( (tuple2!25505 (_1!12763 (_ BitVec 64)) (_2!12763 B!2654)) )
))
(declare-datatypes ((List!36809 0))(
  ( (Nil!36806) (Cons!36805 (h!38348 tuple2!25504) (t!51723 List!36809)) )
))
(declare-fun l!1390 () List!36809)

(declare-fun isStrictlySorted!1067 (List!36809) Bool)

(assert (=> start!137138 (= res!1079625 (isStrictlySorted!1067 l!1390))))

(assert (=> start!137138 e!881632))

(declare-fun e!881633 () Bool)

(assert (=> start!137138 e!881633))

(assert (=> start!137138 true))

(declare-fun tp_is_empty!39199 () Bool)

(assert (=> start!137138 tp_is_empty!39199))

(declare-fun b!1580356 () Bool)

(declare-fun res!1079624 () Bool)

(assert (=> b!1580356 (=> (not res!1079624) (not e!881632))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!913 (List!36809 (_ BitVec 64)) Bool)

(assert (=> b!1580356 (= res!1079624 (containsKey!913 l!1390 key!405))))

(declare-fun b!1580357 () Bool)

(assert (=> b!1580357 (= e!881632 false)))

(declare-fun value!194 () B!2654)

(declare-fun lt!676759 () Bool)

(declare-fun contains!10481 (List!36809 tuple2!25504) Bool)

(assert (=> b!1580357 (= lt!676759 (contains!10481 l!1390 (tuple2!25505 key!405 value!194)))))

(declare-fun b!1580358 () Bool)

(declare-fun tp!114459 () Bool)

(assert (=> b!1580358 (= e!881633 (and tp_is_empty!39199 tp!114459))))

(assert (= (and start!137138 res!1079625) b!1580356))

(assert (= (and b!1580356 res!1079624) b!1580357))

(assert (= (and start!137138 (is-Cons!36805 l!1390)) b!1580358))

(declare-fun m!1451815 () Bool)

(assert (=> start!137138 m!1451815))

(declare-fun m!1451817 () Bool)

(assert (=> b!1580356 m!1451817))

(declare-fun m!1451819 () Bool)

(assert (=> b!1580357 m!1451819))

(push 1)

(assert (not start!137138))

(assert (not b!1580356))

(assert tp_is_empty!39199)

(assert (not b!1580358))

(assert (not b!1580357))

(check-sat)

