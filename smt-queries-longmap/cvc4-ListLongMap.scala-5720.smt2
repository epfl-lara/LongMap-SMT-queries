; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74108 () Bool)

(assert start!74108)

(declare-fun b!871925 () Bool)

(declare-fun res!592670 () Bool)

(declare-fun e!485473 () Bool)

(assert (=> b!871925 (=> (not res!592670) (not e!485473))))

(declare-datatypes ((array!50452 0))(
  ( (array!50453 (arr!24257 (Array (_ BitVec 32) (_ BitVec 64))) (size!24697 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50452)

(declare-datatypes ((List!17247 0))(
  ( (Nil!17244) (Cons!17243 (h!18374 (_ BitVec 64)) (t!24284 List!17247)) )
))
(declare-fun arrayNoDuplicates!0 (array!50452 (_ BitVec 32) List!17247) Bool)

(assert (=> b!871925 (= res!592670 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17244))))

(declare-fun b!871926 () Bool)

(declare-fun e!485470 () Bool)

(declare-fun e!485469 () Bool)

(declare-fun mapRes!27338 () Bool)

(assert (=> b!871926 (= e!485470 (and e!485469 mapRes!27338))))

(declare-fun condMapEmpty!27338 () Bool)

(declare-datatypes ((V!27925 0))(
  ( (V!27926 (val!8627 Int)) )
))
(declare-datatypes ((ValueCell!8140 0))(
  ( (ValueCellFull!8140 (v!11052 V!27925)) (EmptyCell!8140) )
))
(declare-datatypes ((array!50454 0))(
  ( (array!50455 (arr!24258 (Array (_ BitVec 32) ValueCell!8140)) (size!24698 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50454)

(declare-fun mapDefault!27338 () ValueCell!8140)

