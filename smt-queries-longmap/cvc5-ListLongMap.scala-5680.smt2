; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73864 () Bool)

(assert start!73864)

(declare-fun b_free!14779 () Bool)

(declare-fun b_next!14779 () Bool)

(assert (=> start!73864 (= b_free!14779 (not b_next!14779))))

(declare-fun tp!51841 () Bool)

(declare-fun b_and!24531 () Bool)

(assert (=> start!73864 (= tp!51841 b_and!24531)))

(declare-fun b!867675 () Bool)

(declare-fun res!589533 () Bool)

(declare-fun e!483308 () Bool)

(assert (=> b!867675 (=> (not res!589533) (not e!483308))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49990 0))(
  ( (array!49991 (arr!24026 (Array (_ BitVec 32) (_ BitVec 64))) (size!24466 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49990)

(assert (=> b!867675 (= res!589533 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24466 _keys!868))))))

(declare-fun b!867676 () Bool)

(declare-fun e!483310 () Bool)

(declare-fun e!483311 () Bool)

(declare-fun mapRes!26972 () Bool)

(assert (=> b!867676 (= e!483310 (and e!483311 mapRes!26972))))

(declare-fun condMapEmpty!26972 () Bool)

(declare-datatypes ((V!27601 0))(
  ( (V!27602 (val!8505 Int)) )
))
(declare-datatypes ((ValueCell!8018 0))(
  ( (ValueCellFull!8018 (v!10930 V!27601)) (EmptyCell!8018) )
))
(declare-datatypes ((array!49992 0))(
  ( (array!49993 (arr!24027 (Array (_ BitVec 32) ValueCell!8018)) (size!24467 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49992)

(declare-fun mapDefault!26972 () ValueCell!8018)

