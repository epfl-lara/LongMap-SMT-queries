; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88418 () Bool)

(assert start!88418)

(assert (=> start!88418 false))

(declare-fun e!572445 () Bool)

(assert (=> start!88418 e!572445))

(assert (=> start!88418 true))

(declare-fun b!1017485 () Bool)

(declare-fun tp_is_empty!23651 () Bool)

(declare-fun tp!70897 () Bool)

(assert (=> b!1017485 (= e!572445 (and tp_is_empty!23651 tp!70897))))

(declare-datatypes ((B!1584 0))(
  ( (B!1585 (val!11876 Int)) )
))
(declare-datatypes ((tuple2!15298 0))(
  ( (tuple2!15299 (_1!7660 (_ BitVec 64)) (_2!7660 B!1584)) )
))
(declare-datatypes ((List!21564 0))(
  ( (Nil!21561) (Cons!21560 (h!22758 tuple2!15298) (t!30565 List!21564)) )
))
(declare-fun l!1036 () List!21564)

(assert (= (and start!88418 (is-Cons!21560 l!1036)) b!1017485))

(push 1)

(assert (not b!1017485))

