; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37692 () Bool)

(assert start!37692)

(declare-fun b_free!8795 () Bool)

(declare-fun b_next!8795 () Bool)

(assert (=> start!37692 (= b_free!8795 (not b_next!8795))))

(declare-fun tp!31136 () Bool)

(declare-fun b_and!16037 () Bool)

(assert (=> start!37692 (= tp!31136 b_and!16037)))

(declare-fun b!386207 () Bool)

(declare-fun e!234321 () Bool)

(declare-fun e!234326 () Bool)

(declare-fun mapRes!15765 () Bool)

(assert (=> b!386207 (= e!234321 (and e!234326 mapRes!15765))))

(declare-fun condMapEmpty!15765 () Bool)

(declare-datatypes ((V!13727 0))(
  ( (V!13728 (val!4778 Int)) )
))
(declare-datatypes ((ValueCell!4390 0))(
  ( (ValueCellFull!4390 (v!6975 V!13727)) (EmptyCell!4390) )
))
(declare-datatypes ((array!22833 0))(
  ( (array!22834 (arr!10885 (Array (_ BitVec 32) ValueCell!4390)) (size!11237 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22833)

(declare-fun mapDefault!15765 () ValueCell!4390)

