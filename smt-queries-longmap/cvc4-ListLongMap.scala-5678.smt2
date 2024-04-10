; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73856 () Bool)

(assert start!73856)

(declare-fun b_free!14771 () Bool)

(declare-fun b_next!14771 () Bool)

(assert (=> start!73856 (= b_free!14771 (not b_next!14771))))

(declare-fun tp!51817 () Bool)

(declare-fun b_and!24521 () Bool)

(assert (=> start!73856 (= tp!51817 b_and!24521)))

(declare-fun b!867525 () Bool)

(declare-fun res!589424 () Bool)

(declare-fun e!483241 () Bool)

(assert (=> b!867525 (=> (not res!589424) (not e!483241))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!867525 (= res!589424 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!26960 () Bool)

(declare-fun mapRes!26960 () Bool)

(declare-fun tp!51816 () Bool)

(declare-fun e!483233 () Bool)

(assert (=> mapNonEmpty!26960 (= mapRes!26960 (and tp!51816 e!483233))))

(declare-datatypes ((V!27589 0))(
  ( (V!27590 (val!8501 Int)) )
))
(declare-datatypes ((ValueCell!8014 0))(
  ( (ValueCellFull!8014 (v!10926 V!27589)) (EmptyCell!8014) )
))
(declare-fun mapRest!26960 () (Array (_ BitVec 32) ValueCell!8014))

(declare-fun mapKey!26960 () (_ BitVec 32))

(declare-datatypes ((array!49974 0))(
  ( (array!49975 (arr!24018 (Array (_ BitVec 32) ValueCell!8014)) (size!24458 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49974)

(declare-fun mapValue!26960 () ValueCell!8014)

(assert (=> mapNonEmpty!26960 (= (arr!24018 _values!688) (store mapRest!26960 mapKey!26960 mapValue!26960))))

(declare-fun b!867526 () Bool)

(declare-fun res!589428 () Bool)

(assert (=> b!867526 (=> (not res!589428) (not e!483241))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49976 0))(
  ( (array!49977 (arr!24019 (Array (_ BitVec 32) (_ BitVec 64))) (size!24459 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49976)

(assert (=> b!867526 (= res!589428 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24459 _keys!868))))))

(declare-fun b!867527 () Bool)

(declare-fun res!589425 () Bool)

(assert (=> b!867527 (=> (not res!589425) (not e!483241))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!867527 (= res!589425 (and (= (select (arr!24019 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!867528 () Bool)

(declare-datatypes ((Unit!29765 0))(
  ( (Unit!29766) )
))
(declare-fun e!483234 () Unit!29765)

(declare-fun Unit!29767 () Unit!29765)

(assert (=> b!867528 (= e!483234 Unit!29767)))

(declare-fun b!867529 () Bool)

(declare-fun e!483235 () Bool)

(declare-fun e!483239 () Bool)

(assert (=> b!867529 (= e!483235 (and e!483239 mapRes!26960))))

(declare-fun condMapEmpty!26960 () Bool)

(declare-fun mapDefault!26960 () ValueCell!8014)

