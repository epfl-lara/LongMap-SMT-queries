; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95336 () Bool)

(assert start!95336)

(declare-fun b!1077088 () Bool)

(declare-fun e!615795 () Bool)

(declare-fun e!615798 () Bool)

(declare-fun mapRes!40861 () Bool)

(assert (=> b!1077088 (= e!615795 (and e!615798 mapRes!40861))))

(declare-fun condMapEmpty!40861 () Bool)

(declare-datatypes ((V!39909 0))(
  ( (V!39910 (val!13100 Int)) )
))
(declare-datatypes ((ValueCell!12334 0))(
  ( (ValueCellFull!12334 (v!15719 V!39909)) (EmptyCell!12334) )
))
(declare-datatypes ((array!69123 0))(
  ( (array!69124 (arr!33243 (Array (_ BitVec 32) ValueCell!12334)) (size!33779 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69123)

(declare-fun mapDefault!40861 () ValueCell!12334)

