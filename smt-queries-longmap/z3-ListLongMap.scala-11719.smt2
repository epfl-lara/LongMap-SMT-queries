; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137140 () Bool)

(assert start!137140)

(declare-fun res!1079631 () Bool)

(declare-fun e!881639 () Bool)

(assert (=> start!137140 (=> (not res!1079631) (not e!881639))))

(declare-datatypes ((B!2656 0))(
  ( (B!2657 (val!19690 Int)) )
))
(declare-datatypes ((tuple2!25506 0))(
  ( (tuple2!25507 (_1!12764 (_ BitVec 64)) (_2!12764 B!2656)) )
))
(declare-datatypes ((List!36810 0))(
  ( (Nil!36807) (Cons!36806 (h!38349 tuple2!25506) (t!51724 List!36810)) )
))
(declare-fun l!1390 () List!36810)

(declare-fun isStrictlySorted!1068 (List!36810) Bool)

(assert (=> start!137140 (= res!1079631 (isStrictlySorted!1068 l!1390))))

(assert (=> start!137140 e!881639))

(declare-fun e!881638 () Bool)

(assert (=> start!137140 e!881638))

(assert (=> start!137140 true))

(declare-fun tp_is_empty!39201 () Bool)

(assert (=> start!137140 tp_is_empty!39201))

(declare-fun b!1580365 () Bool)

(declare-fun res!1079630 () Bool)

(assert (=> b!1580365 (=> (not res!1079630) (not e!881639))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!914 (List!36810 (_ BitVec 64)) Bool)

(assert (=> b!1580365 (= res!1079630 (containsKey!914 l!1390 key!405))))

(declare-fun b!1580366 () Bool)

(assert (=> b!1580366 (= e!881639 false)))

(declare-fun lt!676762 () Bool)

(declare-fun value!194 () B!2656)

(declare-fun contains!10482 (List!36810 tuple2!25506) Bool)

(assert (=> b!1580366 (= lt!676762 (contains!10482 l!1390 (tuple2!25507 key!405 value!194)))))

(declare-fun b!1580367 () Bool)

(declare-fun tp!114462 () Bool)

(assert (=> b!1580367 (= e!881638 (and tp_is_empty!39201 tp!114462))))

(assert (= (and start!137140 res!1079631) b!1580365))

(assert (= (and b!1580365 res!1079630) b!1580366))

(get-info :version)

(assert (= (and start!137140 ((_ is Cons!36806) l!1390)) b!1580367))

(declare-fun m!1451821 () Bool)

(assert (=> start!137140 m!1451821))

(declare-fun m!1451823 () Bool)

(assert (=> b!1580365 m!1451823))

(declare-fun m!1451825 () Bool)

(assert (=> b!1580366 m!1451825))

(check-sat (not b!1580365) (not start!137140) (not b!1580366) (not b!1580367) tp_is_empty!39201)
(check-sat)
