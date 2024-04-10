; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108016 () Bool)

(assert start!108016)

(declare-fun b!1275838 () Bool)

(declare-fun e!728421 () Bool)

(declare-fun e!728422 () Bool)

(declare-fun mapRes!51461 () Bool)

(assert (=> b!1275838 (= e!728421 (and e!728422 mapRes!51461))))

(declare-fun condMapEmpty!51461 () Bool)

(declare-datatypes ((V!49489 0))(
  ( (V!49490 (val!16719 Int)) )
))
(declare-datatypes ((ValueCell!15746 0))(
  ( (ValueCellFull!15746 (v!19316 V!49489)) (EmptyCell!15746) )
))
(declare-datatypes ((array!83680 0))(
  ( (array!83681 (arr!40352 (Array (_ BitVec 32) ValueCell!15746)) (size!40902 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83680)

(declare-fun mapDefault!51461 () ValueCell!15746)

