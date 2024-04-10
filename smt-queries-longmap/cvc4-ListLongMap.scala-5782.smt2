; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74598 () Bool)

(assert start!74598)

(declare-fun b_free!15287 () Bool)

(declare-fun b_next!15287 () Bool)

(assert (=> start!74598 (= b_free!15287 (not b_next!15287))))

(declare-fun tp!53543 () Bool)

(declare-fun b_and!25163 () Bool)

(assert (=> start!74598 (= tp!53543 b_and!25163)))

(declare-fun b!879132 () Bool)

(declare-fun res!597309 () Bool)

(declare-fun e!489251 () Bool)

(assert (=> b!879132 (=> (not res!597309) (not e!489251))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51188 0))(
  ( (array!51189 (arr!24620 (Array (_ BitVec 32) (_ BitVec 64))) (size!25060 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51188)

(assert (=> b!879132 (= res!597309 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25060 _keys!868))))))

(declare-fun mapIsEmpty!27912 () Bool)

(declare-fun mapRes!27912 () Bool)

(assert (=> mapIsEmpty!27912 mapRes!27912))

(declare-fun b!879134 () Bool)

(declare-fun res!597311 () Bool)

(assert (=> b!879134 (=> (not res!597311) (not e!489251))))

(declare-datatypes ((List!17473 0))(
  ( (Nil!17470) (Cons!17469 (h!18600 (_ BitVec 64)) (t!24562 List!17473)) )
))
(declare-fun arrayNoDuplicates!0 (array!51188 (_ BitVec 32) List!17473) Bool)

(assert (=> b!879134 (= res!597311 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17470))))

(declare-fun b!879135 () Bool)

(declare-fun e!489253 () Bool)

(declare-fun e!489250 () Bool)

(assert (=> b!879135 (= e!489253 (and e!489250 mapRes!27912))))

(declare-fun condMapEmpty!27912 () Bool)

(declare-datatypes ((V!28421 0))(
  ( (V!28422 (val!8813 Int)) )
))
(declare-datatypes ((ValueCell!8326 0))(
  ( (ValueCellFull!8326 (v!11253 V!28421)) (EmptyCell!8326) )
))
(declare-datatypes ((array!51190 0))(
  ( (array!51191 (arr!24621 (Array (_ BitVec 32) ValueCell!8326)) (size!25061 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51190)

(declare-fun mapDefault!27912 () ValueCell!8326)

