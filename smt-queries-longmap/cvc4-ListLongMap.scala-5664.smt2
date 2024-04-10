; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73772 () Bool)

(assert start!73772)

(declare-fun b_free!14687 () Bool)

(declare-fun b_next!14687 () Bool)

(assert (=> start!73772 (= b_free!14687 (not b_next!14687))))

(declare-fun tp!51565 () Bool)

(declare-fun b_and!24353 () Bool)

(assert (=> start!73772 (= tp!51565 b_and!24353)))

(declare-fun b!865425 () Bool)

(declare-fun res!588042 () Bool)

(declare-fun e!482101 () Bool)

(assert (=> b!865425 (=> (not res!588042) (not e!482101))))

(declare-datatypes ((array!49806 0))(
  ( (array!49807 (arr!23934 (Array (_ BitVec 32) (_ BitVec 64))) (size!24374 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49806)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49806 (_ BitVec 32)) Bool)

(assert (=> b!865425 (= res!588042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!865426 () Bool)

(declare-datatypes ((Unit!29639 0))(
  ( (Unit!29640) )
))
(declare-fun e!482102 () Unit!29639)

(declare-fun Unit!29641 () Unit!29639)

(assert (=> b!865426 (= e!482102 Unit!29641)))

(declare-fun res!588040 () Bool)

(assert (=> start!73772 (=> (not res!588040) (not e!482101))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73772 (= res!588040 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24374 _keys!868))))))

(assert (=> start!73772 e!482101))

(declare-fun tp_is_empty!16823 () Bool)

(assert (=> start!73772 tp_is_empty!16823))

(assert (=> start!73772 true))

(assert (=> start!73772 tp!51565))

(declare-fun array_inv!18920 (array!49806) Bool)

(assert (=> start!73772 (array_inv!18920 _keys!868)))

(declare-datatypes ((V!27477 0))(
  ( (V!27478 (val!8459 Int)) )
))
(declare-datatypes ((ValueCell!7972 0))(
  ( (ValueCellFull!7972 (v!10884 V!27477)) (EmptyCell!7972) )
))
(declare-datatypes ((array!49808 0))(
  ( (array!49809 (arr!23935 (Array (_ BitVec 32) ValueCell!7972)) (size!24375 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49808)

(declare-fun e!482100 () Bool)

(declare-fun array_inv!18921 (array!49808) Bool)

(assert (=> start!73772 (and (array_inv!18921 _values!688) e!482100)))

(declare-fun b!865427 () Bool)

(declare-fun res!588036 () Bool)

(assert (=> b!865427 (=> (not res!588036) (not e!482101))))

(declare-datatypes ((List!17013 0))(
  ( (Nil!17010) (Cons!17009 (h!18140 (_ BitVec 64)) (t!23966 List!17013)) )
))
(declare-fun arrayNoDuplicates!0 (array!49806 (_ BitVec 32) List!17013) Bool)

(assert (=> b!865427 (= res!588036 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17010))))

(declare-fun b!865428 () Bool)

(declare-fun e!482105 () Bool)

(assert (=> b!865428 (= e!482101 e!482105)))

(declare-fun res!588038 () Bool)

(assert (=> b!865428 (=> (not res!588038) (not e!482105))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!865428 (= res!588038 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!392139 () array!49808)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11210 0))(
  ( (tuple2!11211 (_1!5616 (_ BitVec 64)) (_2!5616 V!27477)) )
))
(declare-datatypes ((List!17014 0))(
  ( (Nil!17011) (Cons!17010 (h!18141 tuple2!11210) (t!23967 List!17014)) )
))
(declare-datatypes ((ListLongMap!9979 0))(
  ( (ListLongMap!9980 (toList!5005 List!17014)) )
))
(declare-fun lt!392152 () ListLongMap!9979)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27477)

(declare-fun zeroValue!654 () V!27477)

(declare-fun getCurrentListMapNoExtraKeys!2976 (array!49806 array!49808 (_ BitVec 32) (_ BitVec 32) V!27477 V!27477 (_ BitVec 32) Int) ListLongMap!9979)

(assert (=> b!865428 (= lt!392152 (getCurrentListMapNoExtraKeys!2976 _keys!868 lt!392139 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27477)

(assert (=> b!865428 (= lt!392139 (array!49809 (store (arr!23935 _values!688) i!612 (ValueCellFull!7972 v!557)) (size!24375 _values!688)))))

(declare-fun lt!392143 () ListLongMap!9979)

(assert (=> b!865428 (= lt!392143 (getCurrentListMapNoExtraKeys!2976 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!865429 () Bool)

(declare-fun res!588037 () Bool)

(assert (=> b!865429 (=> (not res!588037) (not e!482101))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865429 (= res!588037 (validKeyInArray!0 k!854))))

(declare-fun b!865430 () Bool)

(declare-fun e!482106 () Bool)

(assert (=> b!865430 (= e!482106 true)))

(declare-fun lt!392138 () ListLongMap!9979)

(declare-fun lt!392148 () tuple2!11210)

(declare-fun lt!392140 () tuple2!11210)

(declare-fun lt!392147 () ListLongMap!9979)

(declare-fun +!2354 (ListLongMap!9979 tuple2!11210) ListLongMap!9979)

(assert (=> b!865430 (= lt!392147 (+!2354 (+!2354 lt!392138 lt!392148) lt!392140))))

(declare-fun lt!392141 () Unit!29639)

(declare-fun lt!392150 () V!27477)

(declare-fun addCommutativeForDiffKeys!523 (ListLongMap!9979 (_ BitVec 64) V!27477 (_ BitVec 64) V!27477) Unit!29639)

(assert (=> b!865430 (= lt!392141 (addCommutativeForDiffKeys!523 lt!392138 k!854 v!557 (select (arr!23934 _keys!868) from!1053) lt!392150))))

(declare-fun b!865431 () Bool)

(declare-fun res!588044 () Bool)

(assert (=> b!865431 (=> (not res!588044) (not e!482101))))

(assert (=> b!865431 (= res!588044 (and (= (select (arr!23934 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!865432 () Bool)

(declare-fun e!482107 () Bool)

(assert (=> b!865432 (= e!482107 tp_is_empty!16823)))

(declare-fun mapNonEmpty!26834 () Bool)

(declare-fun mapRes!26834 () Bool)

(declare-fun tp!51564 () Bool)

(assert (=> mapNonEmpty!26834 (= mapRes!26834 (and tp!51564 e!482107))))

(declare-fun mapValue!26834 () ValueCell!7972)

(declare-fun mapRest!26834 () (Array (_ BitVec 32) ValueCell!7972))

(declare-fun mapKey!26834 () (_ BitVec 32))

(assert (=> mapNonEmpty!26834 (= (arr!23935 _values!688) (store mapRest!26834 mapKey!26834 mapValue!26834))))

(declare-fun b!865433 () Bool)

(declare-fun res!588034 () Bool)

(assert (=> b!865433 (=> (not res!588034) (not e!482101))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!865433 (= res!588034 (validMask!0 mask!1196))))

(declare-fun b!865434 () Bool)

(declare-fun e!482099 () Bool)

(assert (=> b!865434 (= e!482100 (and e!482099 mapRes!26834))))

(declare-fun condMapEmpty!26834 () Bool)

(declare-fun mapDefault!26834 () ValueCell!7972)

