; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136840 () Bool)

(assert start!136840)

(declare-fun res!1078770 () Bool)

(declare-fun e!880681 () Bool)

(assert (=> start!136840 (=> (not res!1078770) (not e!880681))))

(declare-datatypes ((B!2560 0))(
  ( (B!2561 (val!19642 Int)) )
))
(declare-datatypes ((tuple2!25386 0))(
  ( (tuple2!25387 (_1!12704 (_ BitVec 64)) (_2!12704 B!2560)) )
))
(declare-datatypes ((List!36762 0))(
  ( (Nil!36759) (Cons!36758 (h!38301 tuple2!25386) (t!51676 List!36762)) )
))
(declare-datatypes ((ListLongMap!22725 0))(
  ( (ListLongMap!22726 (toList!11378 List!36762)) )
))
(declare-fun lm!251 () ListLongMap!22725)

(declare-fun a0!51 () (_ BitVec 64))

(declare-fun contains!10434 (ListLongMap!22725 (_ BitVec 64)) Bool)

(assert (=> start!136840 (= res!1078770 (not (contains!10434 lm!251 a0!51)))))

(assert (=> start!136840 e!880681))

(declare-fun e!880682 () Bool)

(declare-fun inv!58913 (ListLongMap!22725) Bool)

(assert (=> start!136840 (and (inv!58913 lm!251) e!880682)))

(assert (=> start!136840 true))

(declare-fun b!1578836 () Bool)

(assert (=> b!1578836 (= e!880681 false)))

(declare-fun b!1578837 () Bool)

(declare-fun tp!114255 () Bool)

(assert (=> b!1578837 (= e!880682 tp!114255)))

(assert (= (and start!136840 res!1078770) b!1578836))

(assert (= start!136840 b!1578837))

(declare-fun m!1450877 () Bool)

(assert (=> start!136840 m!1450877))

(declare-fun m!1450879 () Bool)

(assert (=> start!136840 m!1450879))

(check-sat (not start!136840) (not b!1578837))
(check-sat)
