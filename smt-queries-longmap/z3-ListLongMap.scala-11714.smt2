; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137074 () Bool)

(assert start!137074)

(declare-fun b!1579731 () Bool)

(declare-fun res!1079228 () Bool)

(declare-fun e!881264 () Bool)

(assert (=> b!1579731 (=> (not res!1079228) (not e!881264))))

(declare-fun key!405 () (_ BitVec 64))

(declare-datatypes ((B!2624 0))(
  ( (B!2625 (val!19674 Int)) )
))
(declare-datatypes ((tuple2!25524 0))(
  ( (tuple2!25525 (_1!12773 (_ BitVec 64)) (_2!12773 B!2624)) )
))
(declare-datatypes ((List!36835 0))(
  ( (Nil!36832) (Cons!36831 (h!38375 tuple2!25524) (t!51741 List!36835)) )
))
(declare-fun l!1390 () List!36835)

(declare-fun value!194 () B!2624)

(declare-fun contains!10421 (List!36835 tuple2!25524) Bool)

(assert (=> b!1579731 (= res!1079228 (contains!10421 l!1390 (tuple2!25525 key!405 value!194)))))

(declare-fun res!1079229 () Bool)

(assert (=> start!137074 (=> (not res!1079229) (not e!881264))))

(declare-fun isStrictlySorted!1050 (List!36835) Bool)

(assert (=> start!137074 (= res!1079229 (isStrictlySorted!1050 l!1390))))

(assert (=> start!137074 e!881264))

(declare-fun e!881263 () Bool)

(assert (=> start!137074 e!881263))

(assert (=> start!137074 true))

(declare-fun tp_is_empty!39169 () Bool)

(assert (=> start!137074 tp_is_empty!39169))

(declare-fun b!1579730 () Bool)

(declare-fun res!1079227 () Bool)

(assert (=> b!1579730 (=> (not res!1079227) (not e!881264))))

(declare-fun containsKey!896 (List!36835 (_ BitVec 64)) Bool)

(assert (=> b!1579730 (= res!1079227 (containsKey!896 l!1390 key!405))))

(declare-fun b!1579733 () Bool)

(declare-fun tp!114415 () Bool)

(assert (=> b!1579733 (= e!881263 (and tp_is_empty!39169 tp!114415))))

(declare-fun b!1579732 () Bool)

(assert (=> b!1579732 (= e!881264 false)))

(assert (= (and start!137074 res!1079229) b!1579730))

(assert (= (and b!1579730 res!1079227) b!1579731))

(assert (= (and b!1579731 res!1079228) b!1579732))

(get-info :version)

(assert (= (and start!137074 ((_ is Cons!36831) l!1390)) b!1579733))

(declare-fun m!1450719 () Bool)

(assert (=> b!1579731 m!1450719))

(declare-fun m!1450721 () Bool)

(assert (=> start!137074 m!1450721))

(declare-fun m!1450723 () Bool)

(assert (=> b!1579730 m!1450723))

(check-sat (not b!1579733) (not start!137074) (not b!1579731) (not b!1579730) tp_is_empty!39169)
(check-sat)
