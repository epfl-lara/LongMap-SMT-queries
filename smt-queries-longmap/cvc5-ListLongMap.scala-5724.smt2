; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74140 () Bool)

(assert start!74140)

(declare-fun b!872173 () Bool)

(declare-fun e!485647 () Bool)

(declare-fun tp_is_empty!17179 () Bool)

(assert (=> b!872173 (= e!485647 tp_is_empty!17179)))

(declare-fun b!872174 () Bool)

(declare-fun e!485649 () Bool)

(assert (=> b!872174 (= e!485649 false)))

(declare-fun lt!395584 () Bool)

(declare-datatypes ((array!50492 0))(
  ( (array!50493 (arr!24276 (Array (_ BitVec 32) (_ BitVec 64))) (size!24716 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50492)

(declare-datatypes ((List!17254 0))(
  ( (Nil!17251) (Cons!17250 (h!18381 (_ BitVec 64)) (t!24291 List!17254)) )
))
(declare-fun arrayNoDuplicates!0 (array!50492 (_ BitVec 32) List!17254) Bool)

(assert (=> b!872174 (= lt!395584 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17251))))

(declare-fun b!872175 () Bool)

(declare-fun e!485646 () Bool)

(declare-fun e!485648 () Bool)

(declare-fun mapRes!27371 () Bool)

(assert (=> b!872175 (= e!485646 (and e!485648 mapRes!27371))))

(declare-fun condMapEmpty!27371 () Bool)

(declare-datatypes ((V!27953 0))(
  ( (V!27954 (val!8637 Int)) )
))
(declare-datatypes ((ValueCell!8150 0))(
  ( (ValueCellFull!8150 (v!11062 V!27953)) (EmptyCell!8150) )
))
(declare-datatypes ((array!50494 0))(
  ( (array!50495 (arr!24277 (Array (_ BitVec 32) ValueCell!8150)) (size!24717 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50494)

(declare-fun mapDefault!27371 () ValueCell!8150)

