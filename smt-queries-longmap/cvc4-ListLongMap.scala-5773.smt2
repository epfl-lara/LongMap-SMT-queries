; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74544 () Bool)

(assert start!74544)

(declare-fun b_free!15233 () Bool)

(declare-fun b_next!15233 () Bool)

(assert (=> start!74544 (= b_free!15233 (not b_next!15233))))

(declare-fun tp!53380 () Bool)

(declare-fun b_and!25109 () Bool)

(assert (=> start!74544 (= tp!53380 b_and!25109)))

(declare-fun res!596596 () Bool)

(declare-fun e!488784 () Bool)

(assert (=> start!74544 (=> (not res!596596) (not e!488784))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51080 0))(
  ( (array!51081 (arr!24566 (Array (_ BitVec 32) (_ BitVec 64))) (size!25006 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51080)

(assert (=> start!74544 (= res!596596 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25006 _keys!868))))))

(assert (=> start!74544 e!488784))

(declare-fun tp_is_empty!17477 () Bool)

(assert (=> start!74544 tp_is_empty!17477))

(assert (=> start!74544 true))

(assert (=> start!74544 tp!53380))

(declare-fun array_inv!19362 (array!51080) Bool)

(assert (=> start!74544 (array_inv!19362 _keys!868)))

(declare-datatypes ((V!28349 0))(
  ( (V!28350 (val!8786 Int)) )
))
(declare-datatypes ((ValueCell!8299 0))(
  ( (ValueCellFull!8299 (v!11226 V!28349)) (EmptyCell!8299) )
))
(declare-datatypes ((array!51082 0))(
  ( (array!51083 (arr!24567 (Array (_ BitVec 32) ValueCell!8299)) (size!25007 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51082)

(declare-fun e!488782 () Bool)

(declare-fun array_inv!19363 (array!51082) Bool)

(assert (=> start!74544 (and (array_inv!19363 _values!688) e!488782)))

(declare-fun mapNonEmpty!27831 () Bool)

(declare-fun mapRes!27831 () Bool)

(declare-fun tp!53381 () Bool)

(declare-fun e!488781 () Bool)

(assert (=> mapNonEmpty!27831 (= mapRes!27831 (and tp!53381 e!488781))))

(declare-fun mapValue!27831 () ValueCell!8299)

(declare-fun mapRest!27831 () (Array (_ BitVec 32) ValueCell!8299))

(declare-fun mapKey!27831 () (_ BitVec 32))

(assert (=> mapNonEmpty!27831 (= (arr!24567 _values!688) (store mapRest!27831 mapKey!27831 mapValue!27831))))

(declare-fun b!878180 () Bool)

(declare-fun res!596598 () Bool)

(assert (=> b!878180 (=> (not res!596598) (not e!488784))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878180 (= res!596598 (validKeyInArray!0 k!854))))

(declare-fun b!878181 () Bool)

(declare-fun res!596597 () Bool)

(assert (=> b!878181 (=> (not res!596597) (not e!488784))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!878181 (= res!596597 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25006 _keys!868))))))

(declare-fun b!878182 () Bool)

(declare-fun res!596599 () Bool)

(assert (=> b!878182 (=> (not res!596599) (not e!488784))))

(declare-datatypes ((List!17432 0))(
  ( (Nil!17429) (Cons!17428 (h!18559 (_ BitVec 64)) (t!24521 List!17432)) )
))
(declare-fun arrayNoDuplicates!0 (array!51080 (_ BitVec 32) List!17432) Bool)

(assert (=> b!878182 (= res!596599 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17429))))

(declare-fun b!878183 () Bool)

(declare-fun res!596593 () Bool)

(assert (=> b!878183 (=> (not res!596593) (not e!488784))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878183 (= res!596593 (validMask!0 mask!1196))))

(declare-fun b!878184 () Bool)

(assert (=> b!878184 (= e!488781 tp_is_empty!17477)))

(declare-fun b!878185 () Bool)

(assert (=> b!878185 (= e!488784 false)))

(declare-fun v!557 () V!28349)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28349)

(declare-fun zeroValue!654 () V!28349)

(declare-datatypes ((tuple2!11616 0))(
  ( (tuple2!11617 (_1!5819 (_ BitVec 64)) (_2!5819 V!28349)) )
))
(declare-datatypes ((List!17433 0))(
  ( (Nil!17430) (Cons!17429 (h!18560 tuple2!11616) (t!24522 List!17433)) )
))
(declare-datatypes ((ListLongMap!10385 0))(
  ( (ListLongMap!10386 (toList!5208 List!17433)) )
))
(declare-fun lt!397208 () ListLongMap!10385)

(declare-fun getCurrentListMapNoExtraKeys!3175 (array!51080 array!51082 (_ BitVec 32) (_ BitVec 32) V!28349 V!28349 (_ BitVec 32) Int) ListLongMap!10385)

(assert (=> b!878185 (= lt!397208 (getCurrentListMapNoExtraKeys!3175 _keys!868 (array!51083 (store (arr!24567 _values!688) i!612 (ValueCellFull!8299 v!557)) (size!25007 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397209 () ListLongMap!10385)

(assert (=> b!878185 (= lt!397209 (getCurrentListMapNoExtraKeys!3175 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!878186 () Bool)

(declare-fun res!596600 () Bool)

(assert (=> b!878186 (=> (not res!596600) (not e!488784))))

(assert (=> b!878186 (= res!596600 (and (= (select (arr!24566 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!878187 () Bool)

(declare-fun res!596595 () Bool)

(assert (=> b!878187 (=> (not res!596595) (not e!488784))))

(assert (=> b!878187 (= res!596595 (and (= (size!25007 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25006 _keys!868) (size!25007 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!878188 () Bool)

(declare-fun res!596594 () Bool)

(assert (=> b!878188 (=> (not res!596594) (not e!488784))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51080 (_ BitVec 32)) Bool)

(assert (=> b!878188 (= res!596594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!878189 () Bool)

(declare-fun e!488783 () Bool)

(assert (=> b!878189 (= e!488782 (and e!488783 mapRes!27831))))

(declare-fun condMapEmpty!27831 () Bool)

(declare-fun mapDefault!27831 () ValueCell!8299)

