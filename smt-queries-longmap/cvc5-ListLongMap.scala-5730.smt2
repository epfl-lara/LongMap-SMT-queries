; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74176 () Bool)

(assert start!74176)

(declare-fun b!872551 () Bool)

(declare-fun e!485919 () Bool)

(assert (=> b!872551 (= e!485919 false)))

(declare-fun lt!395638 () Bool)

(declare-datatypes ((array!50564 0))(
  ( (array!50565 (arr!24312 (Array (_ BitVec 32) (_ BitVec 64))) (size!24752 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50564)

(declare-datatypes ((List!17267 0))(
  ( (Nil!17264) (Cons!17263 (h!18394 (_ BitVec 64)) (t!24304 List!17267)) )
))
(declare-fun arrayNoDuplicates!0 (array!50564 (_ BitVec 32) List!17267) Bool)

(assert (=> b!872551 (= lt!395638 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17264))))

(declare-fun mapIsEmpty!27425 () Bool)

(declare-fun mapRes!27425 () Bool)

(assert (=> mapIsEmpty!27425 mapRes!27425))

(declare-fun b!872552 () Bool)

(declare-fun e!485920 () Bool)

(declare-fun e!485918 () Bool)

(assert (=> b!872552 (= e!485920 (and e!485918 mapRes!27425))))

(declare-fun condMapEmpty!27425 () Bool)

(declare-datatypes ((V!28001 0))(
  ( (V!28002 (val!8655 Int)) )
))
(declare-datatypes ((ValueCell!8168 0))(
  ( (ValueCellFull!8168 (v!11080 V!28001)) (EmptyCell!8168) )
))
(declare-datatypes ((array!50566 0))(
  ( (array!50567 (arr!24313 (Array (_ BitVec 32) ValueCell!8168)) (size!24753 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50566)

(declare-fun mapDefault!27425 () ValueCell!8168)

