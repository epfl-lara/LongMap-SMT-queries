; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106352 () Bool)

(assert start!106352)

(declare-fun b!1265024 () Bool)

(declare-fun e!720401 () Bool)

(declare-fun tp_is_empty!32483 () Bool)

(declare-fun tp!96290 () Bool)

(assert (=> b!1265024 (= e!720401 (and tp_is_empty!32483 tp!96290))))

(declare-fun b!1265025 () Bool)

(declare-fun res!842367 () Bool)

(declare-fun e!720400 () Bool)

(assert (=> b!1265025 (=> (not res!842367) (not e!720400))))

(declare-datatypes ((B!1950 0))(
  ( (B!1951 (val!16310 Int)) )
))
(declare-datatypes ((tuple2!21138 0))(
  ( (tuple2!21139 (_1!10580 (_ BitVec 64)) (_2!10580 B!1950)) )
))
(declare-datatypes ((List!28302 0))(
  ( (Nil!28299) (Cons!28298 (h!29507 tuple2!21138) (t!41823 List!28302)) )
))
(declare-fun l!706 () List!28302)

(declare-fun isStrictlySorted!780 (List!28302) Bool)

(assert (=> b!1265025 (= res!842367 (isStrictlySorted!780 (t!41823 l!706)))))

(declare-fun b!1265026 () Bool)

(declare-fun res!842368 () Bool)

(assert (=> b!1265026 (=> (not res!842368) (not e!720400))))

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!639 (List!28302 (_ BitVec 64)) Bool)

(assert (=> b!1265026 (= res!842368 (not (containsKey!639 (t!41823 l!706) key1!31)))))

(declare-fun b!1265027 () Bool)

(assert (=> b!1265027 (= e!720400 (not true))))

(declare-fun v1!26 () B!1950)

(declare-fun removeStrictlySorted!151 (List!28302 (_ BitVec 64)) List!28302)

(declare-fun insertStrictlySorted!458 (List!28302 (_ BitVec 64) B!1950) List!28302)

(assert (=> b!1265027 (= (removeStrictlySorted!151 (insertStrictlySorted!458 (t!41823 l!706) key1!31 v1!26) key1!31) (t!41823 l!706))))

(declare-datatypes ((Unit!42175 0))(
  ( (Unit!42176) )
))
(declare-fun lt!574002 () Unit!42175)

(declare-fun lemmaInsertStrictlySortedThenRemoveIsSame!6 (List!28302 (_ BitVec 64) B!1950) Unit!42175)

(assert (=> b!1265027 (= lt!574002 (lemmaInsertStrictlySortedThenRemoveIsSame!6 (t!41823 l!706) key1!31 v1!26))))

(declare-fun b!1265028 () Bool)

(declare-fun res!842370 () Bool)

(assert (=> b!1265028 (=> (not res!842370) (not e!720400))))

(assert (=> b!1265028 (= res!842370 (not (containsKey!639 l!706 key1!31)))))

(declare-fun b!1265029 () Bool)

(declare-fun res!842369 () Bool)

(assert (=> b!1265029 (=> (not res!842369) (not e!720400))))

(assert (=> b!1265029 (= res!842369 (is-Cons!28298 l!706))))

(declare-fun res!842371 () Bool)

(assert (=> start!106352 (=> (not res!842371) (not e!720400))))

(assert (=> start!106352 (= res!842371 (isStrictlySorted!780 l!706))))

(assert (=> start!106352 e!720400))

(assert (=> start!106352 e!720401))

(assert (=> start!106352 true))

(assert (=> start!106352 tp_is_empty!32483))

(assert (= (and start!106352 res!842371) b!1265028))

(assert (= (and b!1265028 res!842370) b!1265029))

(assert (= (and b!1265029 res!842369) b!1265025))

(assert (= (and b!1265025 res!842367) b!1265026))

(assert (= (and b!1265026 res!842368) b!1265027))

(assert (= (and start!106352 (is-Cons!28298 l!706)) b!1265024))

(declare-fun m!1165399 () Bool)

(assert (=> start!106352 m!1165399))

(declare-fun m!1165401 () Bool)

(assert (=> b!1265028 m!1165401))

(declare-fun m!1165403 () Bool)

(assert (=> b!1265027 m!1165403))

(assert (=> b!1265027 m!1165403))

(declare-fun m!1165405 () Bool)

(assert (=> b!1265027 m!1165405))

(declare-fun m!1165407 () Bool)

(assert (=> b!1265027 m!1165407))

(declare-fun m!1165409 () Bool)

(assert (=> b!1265026 m!1165409))

(declare-fun m!1165411 () Bool)

(assert (=> b!1265025 m!1165411))

(push 1)

(assert (not start!106352))

(assert (not b!1265028))

(assert (not b!1265027))

(assert tp_is_empty!32483)

(assert (not b!1265026))

(assert (not b!1265025))

(assert (not b!1265024))

(check-sat)

