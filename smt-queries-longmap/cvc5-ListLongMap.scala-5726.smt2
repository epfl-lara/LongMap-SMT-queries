; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74152 () Bool)

(assert start!74152)

(declare-fun b!872299 () Bool)

(declare-fun res!592874 () Bool)

(declare-fun e!485739 () Bool)

(assert (=> b!872299 (=> (not res!592874) (not e!485739))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872299 (= res!592874 (validMask!0 mask!1196))))

(declare-fun b!872300 () Bool)

(declare-fun res!592877 () Bool)

(assert (=> b!872300 (=> (not res!592877) (not e!485739))))

(declare-datatypes ((array!50516 0))(
  ( (array!50517 (arr!24288 (Array (_ BitVec 32) (_ BitVec 64))) (size!24728 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50516)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50516 (_ BitVec 32)) Bool)

(assert (=> b!872300 (= res!592877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27389 () Bool)

(declare-fun mapRes!27389 () Bool)

(declare-fun tp!52588 () Bool)

(declare-fun e!485736 () Bool)

(assert (=> mapNonEmpty!27389 (= mapRes!27389 (and tp!52588 e!485736))))

(declare-fun mapKey!27389 () (_ BitVec 32))

(declare-datatypes ((V!27969 0))(
  ( (V!27970 (val!8643 Int)) )
))
(declare-datatypes ((ValueCell!8156 0))(
  ( (ValueCellFull!8156 (v!11068 V!27969)) (EmptyCell!8156) )
))
(declare-fun mapValue!27389 () ValueCell!8156)

(declare-fun mapRest!27389 () (Array (_ BitVec 32) ValueCell!8156))

(declare-datatypes ((array!50518 0))(
  ( (array!50519 (arr!24289 (Array (_ BitVec 32) ValueCell!8156)) (size!24729 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50518)

(assert (=> mapNonEmpty!27389 (= (arr!24289 _values!688) (store mapRest!27389 mapKey!27389 mapValue!27389))))

(declare-fun b!872301 () Bool)

(declare-fun e!485737 () Bool)

(declare-fun e!485740 () Bool)

(assert (=> b!872301 (= e!485737 (and e!485740 mapRes!27389))))

(declare-fun condMapEmpty!27389 () Bool)

(declare-fun mapDefault!27389 () ValueCell!8156)

