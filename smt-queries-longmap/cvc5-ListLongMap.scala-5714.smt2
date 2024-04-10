; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74068 () Bool)

(assert start!74068)

(declare-fun b_free!14983 () Bool)

(declare-fun b_next!14983 () Bool)

(assert (=> start!74068 (= b_free!14983 (not b_next!14983))))

(declare-fun tp!52452 () Bool)

(declare-fun b_and!24735 () Bool)

(assert (=> start!74068 (= tp!52452 b_and!24735)))

(declare-fun b!871347 () Bool)

(declare-fun res!592288 () Bool)

(declare-fun e!485144 () Bool)

(assert (=> b!871347 (=> (not res!592288) (not e!485144))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50378 0))(
  ( (array!50379 (arr!24220 (Array (_ BitVec 32) (_ BitVec 64))) (size!24660 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50378)

(assert (=> b!871347 (= res!592288 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24660 _keys!868))))))

(declare-fun res!592291 () Bool)

(assert (=> start!74068 (=> (not res!592291) (not e!485144))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74068 (= res!592291 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24660 _keys!868))))))

(assert (=> start!74068 e!485144))

(declare-fun tp_is_empty!17119 () Bool)

(assert (=> start!74068 tp_is_empty!17119))

(assert (=> start!74068 true))

(assert (=> start!74068 tp!52452))

(declare-fun array_inv!19124 (array!50378) Bool)

(assert (=> start!74068 (array_inv!19124 _keys!868)))

(declare-datatypes ((V!27873 0))(
  ( (V!27874 (val!8607 Int)) )
))
(declare-datatypes ((ValueCell!8120 0))(
  ( (ValueCellFull!8120 (v!11032 V!27873)) (EmptyCell!8120) )
))
(declare-datatypes ((array!50380 0))(
  ( (array!50381 (arr!24221 (Array (_ BitVec 32) ValueCell!8120)) (size!24661 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50380)

(declare-fun e!485148 () Bool)

(declare-fun array_inv!19125 (array!50380) Bool)

(assert (=> start!74068 (and (array_inv!19125 _values!688) e!485148)))

(declare-fun mapNonEmpty!27278 () Bool)

(declare-fun mapRes!27278 () Bool)

(declare-fun tp!52453 () Bool)

(declare-fun e!485149 () Bool)

(assert (=> mapNonEmpty!27278 (= mapRes!27278 (and tp!52453 e!485149))))

(declare-fun mapValue!27278 () ValueCell!8120)

(declare-fun mapKey!27278 () (_ BitVec 32))

(declare-fun mapRest!27278 () (Array (_ BitVec 32) ValueCell!8120))

(assert (=> mapNonEmpty!27278 (= (arr!24221 _values!688) (store mapRest!27278 mapKey!27278 mapValue!27278))))

(declare-fun b!871348 () Bool)

(declare-fun e!485147 () Bool)

(assert (=> b!871348 (= e!485148 (and e!485147 mapRes!27278))))

(declare-fun condMapEmpty!27278 () Bool)

(declare-fun mapDefault!27278 () ValueCell!8120)

