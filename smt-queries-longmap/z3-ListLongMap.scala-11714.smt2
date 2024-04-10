; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137110 () Bool)

(assert start!137110)

(declare-fun b!1580058 () Bool)

(declare-fun e!881467 () Bool)

(declare-fun tp_is_empty!39171 () Bool)

(declare-fun tp!114417 () Bool)

(assert (=> b!1580058 (= e!881467 (and tp_is_empty!39171 tp!114417))))

(declare-fun res!1079365 () Bool)

(declare-fun e!881468 () Bool)

(assert (=> start!137110 (=> (not res!1079365) (not e!881468))))

(declare-datatypes ((B!2626 0))(
  ( (B!2627 (val!19675 Int)) )
))
(declare-datatypes ((tuple2!25458 0))(
  ( (tuple2!25459 (_1!12740 (_ BitVec 64)) (_2!12740 B!2626)) )
))
(declare-datatypes ((List!36795 0))(
  ( (Nil!36792) (Cons!36791 (h!38334 tuple2!25458) (t!51709 List!36795)) )
))
(declare-fun l!1390 () List!36795)

(declare-fun isStrictlySorted!1053 (List!36795) Bool)

(assert (=> start!137110 (= res!1079365 (isStrictlySorted!1053 l!1390))))

(assert (=> start!137110 e!881468))

(assert (=> start!137110 e!881467))

(assert (=> start!137110 true))

(assert (=> start!137110 tp_is_empty!39171))

(declare-fun b!1580057 () Bool)

(assert (=> b!1580057 (= e!881468 false)))

(declare-fun b!1580056 () Bool)

(declare-fun res!1079367 () Bool)

(assert (=> b!1580056 (=> (not res!1079367) (not e!881468))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun value!194 () B!2626)

(declare-fun contains!10467 (List!36795 tuple2!25458) Bool)

(assert (=> b!1580056 (= res!1079367 (contains!10467 l!1390 (tuple2!25459 key!405 value!194)))))

(declare-fun b!1580055 () Bool)

(declare-fun res!1079366 () Bool)

(assert (=> b!1580055 (=> (not res!1079366) (not e!881468))))

(declare-fun containsKey!899 (List!36795 (_ BitVec 64)) Bool)

(assert (=> b!1580055 (= res!1079366 (containsKey!899 l!1390 key!405))))

(assert (= (and start!137110 res!1079365) b!1580055))

(assert (= (and b!1580055 res!1079366) b!1580056))

(assert (= (and b!1580056 res!1079367) b!1580057))

(get-info :version)

(assert (= (and start!137110 ((_ is Cons!36791) l!1390)) b!1580058))

(declare-fun m!1451605 () Bool)

(assert (=> start!137110 m!1451605))

(declare-fun m!1451607 () Bool)

(assert (=> b!1580056 m!1451607))

(declare-fun m!1451609 () Bool)

(assert (=> b!1580055 m!1451609))

(check-sat (not b!1580055) tp_is_empty!39171 (not start!137110) (not b!1580056) (not b!1580058))
(check-sat)
