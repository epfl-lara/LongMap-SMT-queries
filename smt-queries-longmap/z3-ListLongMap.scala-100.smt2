; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1646 () Bool)

(assert start!1646)

(declare-fun res!9742 () Bool)

(declare-fun e!7015 () Bool)

(assert (=> start!1646 (=> (not res!9742) (not e!7015))))

(declare-datatypes ((B!406 0))(
  ( (B!407 (val!298 Int)) )
))
(declare-datatypes ((tuple2!396 0))(
  ( (tuple2!397 (_1!198 (_ BitVec 64)) (_2!198 B!406)) )
))
(declare-datatypes ((List!350 0))(
  ( (Nil!347) (Cons!346 (h!912 tuple2!396) (t!2737 List!350)) )
))
(declare-datatypes ((ListLongMap!377 0))(
  ( (ListLongMap!378 (toList!204 List!350)) )
))
(declare-fun lm!265 () ListLongMap!377)

(declare-fun a!527 () (_ BitVec 64))

(declare-fun contains!172 (ListLongMap!377 (_ BitVec 64)) Bool)

(assert (=> start!1646 (= res!9742 (contains!172 lm!265 a!527))))

(assert (=> start!1646 e!7015))

(declare-fun e!7016 () Bool)

(declare-fun inv!583 (ListLongMap!377) Bool)

(assert (=> start!1646 (and (inv!583 lm!265) e!7016)))

(assert (=> start!1646 true))

(declare-fun tp_is_empty!579 () Bool)

(assert (=> start!1646 tp_is_empty!579))

(declare-fun b!11794 () Bool)

(assert (=> b!11794 (= e!7015 false)))

(declare-fun b!11795 () Bool)

(declare-fun tp!1973 () Bool)

(assert (=> b!11795 (= e!7016 tp!1973)))

(assert (= (and start!1646 res!9742) b!11794))

(assert (= start!1646 b!11795))

(declare-fun m!8229 () Bool)

(assert (=> start!1646 m!8229))

(declare-fun m!8231 () Bool)

(assert (=> start!1646 m!8231))

(check-sat (not start!1646) (not b!11795) tp_is_empty!579)
(check-sat)
