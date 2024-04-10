; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74122 () Bool)

(assert start!74122)

(declare-fun b!871984 () Bool)

(declare-fun res!592694 () Bool)

(declare-fun e!485511 () Bool)

(assert (=> b!871984 (=> (not res!592694) (not e!485511))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871984 (= res!592694 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27344 () Bool)

(declare-fun mapRes!27344 () Bool)

(declare-fun tp!52543 () Bool)

(declare-fun e!485515 () Bool)

(assert (=> mapNonEmpty!27344 (= mapRes!27344 (and tp!52543 e!485515))))

(declare-datatypes ((V!27929 0))(
  ( (V!27930 (val!8628 Int)) )
))
(declare-datatypes ((ValueCell!8141 0))(
  ( (ValueCellFull!8141 (v!11053 V!27929)) (EmptyCell!8141) )
))
(declare-fun mapValue!27344 () ValueCell!8141)

(declare-fun mapKey!27344 () (_ BitVec 32))

(declare-fun mapRest!27344 () (Array (_ BitVec 32) ValueCell!8141))

(declare-datatypes ((array!50458 0))(
  ( (array!50459 (arr!24259 (Array (_ BitVec 32) ValueCell!8141)) (size!24699 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50458)

(assert (=> mapNonEmpty!27344 (= (arr!24259 _values!688) (store mapRest!27344 mapKey!27344 mapValue!27344))))

(declare-fun b!871985 () Bool)

(declare-fun e!485514 () Bool)

(declare-fun e!485513 () Bool)

(assert (=> b!871985 (= e!485514 (and e!485513 mapRes!27344))))

(declare-fun condMapEmpty!27344 () Bool)

(declare-fun mapDefault!27344 () ValueCell!8141)

