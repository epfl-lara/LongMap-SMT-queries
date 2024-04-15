; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1644 () Bool)

(assert start!1644)

(declare-fun res!9739 () Bool)

(declare-fun e!7009 () Bool)

(assert (=> start!1644 (=> (not res!9739) (not e!7009))))

(declare-datatypes ((B!404 0))(
  ( (B!405 (val!297 Int)) )
))
(declare-datatypes ((tuple2!390 0))(
  ( (tuple2!391 (_1!195 (_ BitVec 64)) (_2!195 B!404)) )
))
(declare-datatypes ((List!345 0))(
  ( (Nil!342) (Cons!341 (h!907 tuple2!390) (t!2732 List!345)) )
))
(declare-datatypes ((ListLongMap!371 0))(
  ( (ListLongMap!372 (toList!201 List!345)) )
))
(declare-fun lm!265 () ListLongMap!371)

(declare-fun a!527 () (_ BitVec 64))

(declare-fun contains!169 (ListLongMap!371 (_ BitVec 64)) Bool)

(assert (=> start!1644 (= res!9739 (contains!169 lm!265 a!527))))

(assert (=> start!1644 e!7009))

(declare-fun e!7010 () Bool)

(declare-fun inv!582 (ListLongMap!371) Bool)

(assert (=> start!1644 (and (inv!582 lm!265) e!7010)))

(assert (=> start!1644 true))

(declare-fun tp_is_empty!577 () Bool)

(assert (=> start!1644 tp_is_empty!577))

(declare-fun b!11788 () Bool)

(assert (=> b!11788 (= e!7009 false)))

(declare-fun b!11789 () Bool)

(declare-fun tp!1970 () Bool)

(assert (=> b!11789 (= e!7010 tp!1970)))

(assert (= (and start!1644 res!9739) b!11788))

(assert (= start!1644 b!11789))

(declare-fun m!8225 () Bool)

(assert (=> start!1644 m!8225))

(declare-fun m!8227 () Bool)

(assert (=> start!1644 m!8227))

(check-sat (not start!1644) (not b!11789) tp_is_empty!577)
(check-sat)
