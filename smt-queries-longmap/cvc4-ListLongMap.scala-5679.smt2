; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73862 () Bool)

(assert start!73862)

(declare-fun b_free!14777 () Bool)

(declare-fun b_next!14777 () Bool)

(assert (=> start!73862 (= b_free!14777 (not b_next!14777))))

(declare-fun tp!51834 () Bool)

(declare-fun b_and!24529 () Bool)

(assert (=> start!73862 (= tp!51834 b_and!24529)))

(declare-fun res!589508 () Bool)

(declare-fun e!483292 () Bool)

(assert (=> start!73862 (=> (not res!589508) (not e!483292))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49986 0))(
  ( (array!49987 (arr!24024 (Array (_ BitVec 32) (_ BitVec 64))) (size!24464 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49986)

(assert (=> start!73862 (= res!589508 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24464 _keys!868))))))

(assert (=> start!73862 e!483292))

(declare-fun tp_is_empty!16913 () Bool)

(assert (=> start!73862 tp_is_empty!16913))

(assert (=> start!73862 true))

(assert (=> start!73862 tp!51834))

(declare-fun array_inv!18982 (array!49986) Bool)

(assert (=> start!73862 (array_inv!18982 _keys!868)))

(declare-datatypes ((V!27597 0))(
  ( (V!27598 (val!8504 Int)) )
))
(declare-datatypes ((ValueCell!8017 0))(
  ( (ValueCellFull!8017 (v!10929 V!27597)) (EmptyCell!8017) )
))
(declare-datatypes ((array!49988 0))(
  ( (array!49989 (arr!24025 (Array (_ BitVec 32) ValueCell!8017)) (size!24465 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49988)

(declare-fun e!483290 () Bool)

(declare-fun array_inv!18983 (array!49988) Bool)

(assert (=> start!73862 (and (array_inv!18983 _values!688) e!483290)))

(declare-fun b!867639 () Bool)

(declare-fun res!589509 () Bool)

(assert (=> b!867639 (=> (not res!589509) (not e!483292))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!867639 (= res!589509 (and (= (select (arr!24024 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!26969 () Bool)

(declare-fun mapRes!26969 () Bool)

(assert (=> mapIsEmpty!26969 mapRes!26969))

(declare-fun b!867640 () Bool)

(declare-fun e!483291 () Bool)

(assert (=> b!867640 (= e!483291 tp_is_empty!16913)))

(declare-fun b!867641 () Bool)

(declare-fun res!589504 () Bool)

(assert (=> b!867641 (=> (not res!589504) (not e!483292))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49986 (_ BitVec 32)) Bool)

(assert (=> b!867641 (= res!589504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!867642 () Bool)

(declare-fun e!483294 () Bool)

(assert (=> b!867642 (= e!483294 tp_is_empty!16913)))

(declare-fun b!867643 () Bool)

(declare-fun res!589511 () Bool)

(assert (=> b!867643 (=> (not res!589511) (not e!483292))))

(declare-datatypes ((List!17082 0))(
  ( (Nil!17079) (Cons!17078 (h!18209 (_ BitVec 64)) (t!24119 List!17082)) )
))
(declare-fun arrayNoDuplicates!0 (array!49986 (_ BitVec 32) List!17082) Bool)

(assert (=> b!867643 (= res!589511 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17079))))

(declare-fun b!867644 () Bool)

(declare-fun res!589506 () Bool)

(assert (=> b!867644 (=> (not res!589506) (not e!483292))))

(assert (=> b!867644 (= res!589506 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24464 _keys!868))))))

(declare-fun b!867645 () Bool)

(declare-fun e!483295 () Bool)

(assert (=> b!867645 (= e!483295 (not true))))

(declare-fun v!557 () V!27597)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!394202 () array!49988)

(declare-fun minValue!654 () V!27597)

(declare-fun zeroValue!654 () V!27597)

(declare-datatypes ((tuple2!11282 0))(
  ( (tuple2!11283 (_1!5652 (_ BitVec 64)) (_2!5652 V!27597)) )
))
(declare-datatypes ((List!17083 0))(
  ( (Nil!17080) (Cons!17079 (h!18210 tuple2!11282) (t!24120 List!17083)) )
))
(declare-datatypes ((ListLongMap!10051 0))(
  ( (ListLongMap!10052 (toList!5041 List!17083)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3010 (array!49986 array!49988 (_ BitVec 32) (_ BitVec 32) V!27597 V!27597 (_ BitVec 32) Int) ListLongMap!10051)

(declare-fun +!2387 (ListLongMap!10051 tuple2!11282) ListLongMap!10051)

(assert (=> b!867645 (= (getCurrentListMapNoExtraKeys!3010 _keys!868 lt!394202 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2387 (getCurrentListMapNoExtraKeys!3010 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11283 k!854 v!557)))))

(declare-datatypes ((Unit!29772 0))(
  ( (Unit!29773) )
))
(declare-fun lt!394201 () Unit!29772)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!581 (array!49986 array!49988 (_ BitVec 32) (_ BitVec 32) V!27597 V!27597 (_ BitVec 32) (_ BitVec 64) V!27597 (_ BitVec 32) Int) Unit!29772)

(assert (=> b!867645 (= lt!394201 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!581 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!867646 () Bool)

(assert (=> b!867646 (= e!483292 e!483295)))

(declare-fun res!589510 () Bool)

(assert (=> b!867646 (=> (not res!589510) (not e!483295))))

(assert (=> b!867646 (= res!589510 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394204 () ListLongMap!10051)

(assert (=> b!867646 (= lt!394204 (getCurrentListMapNoExtraKeys!3010 _keys!868 lt!394202 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!867646 (= lt!394202 (array!49989 (store (arr!24025 _values!688) i!612 (ValueCellFull!8017 v!557)) (size!24465 _values!688)))))

(declare-fun lt!394203 () ListLongMap!10051)

(assert (=> b!867646 (= lt!394203 (getCurrentListMapNoExtraKeys!3010 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!867647 () Bool)

(declare-fun res!589503 () Bool)

(assert (=> b!867647 (=> (not res!589503) (not e!483292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!867647 (= res!589503 (validMask!0 mask!1196))))

(declare-fun b!867648 () Bool)

(declare-fun res!589507 () Bool)

(assert (=> b!867648 (=> (not res!589507) (not e!483292))))

(assert (=> b!867648 (= res!589507 (and (= (size!24465 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24464 _keys!868) (size!24465 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!867649 () Bool)

(declare-fun res!589505 () Bool)

(assert (=> b!867649 (=> (not res!589505) (not e!483292))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867649 (= res!589505 (validKeyInArray!0 k!854))))

(declare-fun b!867650 () Bool)

(assert (=> b!867650 (= e!483290 (and e!483294 mapRes!26969))))

(declare-fun condMapEmpty!26969 () Bool)

(declare-fun mapDefault!26969 () ValueCell!8017)

