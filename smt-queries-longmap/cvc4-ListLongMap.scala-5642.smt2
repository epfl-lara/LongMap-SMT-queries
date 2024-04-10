; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73640 () Bool)

(assert start!73640)

(declare-fun b_free!14555 () Bool)

(declare-fun b_next!14555 () Bool)

(assert (=> start!73640 (= b_free!14555 (not b_next!14555))))

(declare-fun tp!51169 () Bool)

(declare-fun b_and!24089 () Bool)

(assert (=> start!73640 (= tp!51169 b_and!24089)))

(declare-fun b!862126 () Bool)

(declare-fun e!480319 () Bool)

(declare-fun e!480324 () Bool)

(assert (=> b!862126 (= e!480319 (not e!480324))))

(declare-fun res!585866 () Bool)

(assert (=> b!862126 (=> res!585866 e!480324)))

(declare-datatypes ((array!49546 0))(
  ( (array!49547 (arr!23804 (Array (_ BitVec 32) (_ BitVec 64))) (size!24244 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49546)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!862126 (= res!585866 (not (validKeyInArray!0 (select (arr!23804 _keys!868) from!1053))))))

(declare-datatypes ((V!27301 0))(
  ( (V!27302 (val!8393 Int)) )
))
(declare-datatypes ((tuple2!11098 0))(
  ( (tuple2!11099 (_1!5560 (_ BitVec 64)) (_2!5560 V!27301)) )
))
(declare-datatypes ((List!16907 0))(
  ( (Nil!16904) (Cons!16903 (h!18034 tuple2!11098) (t!23728 List!16907)) )
))
(declare-datatypes ((ListLongMap!9867 0))(
  ( (ListLongMap!9868 (toList!4949 List!16907)) )
))
(declare-fun lt!388978 () ListLongMap!9867)

(declare-fun lt!388977 () ListLongMap!9867)

(assert (=> b!862126 (= lt!388978 lt!388977)))

(declare-fun v!557 () V!27301)

(declare-fun lt!388976 () ListLongMap!9867)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2299 (ListLongMap!9867 tuple2!11098) ListLongMap!9867)

(assert (=> b!862126 (= lt!388977 (+!2299 lt!388976 (tuple2!11099 k!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7906 0))(
  ( (ValueCellFull!7906 (v!10818 V!27301)) (EmptyCell!7906) )
))
(declare-datatypes ((array!49548 0))(
  ( (array!49549 (arr!23805 (Array (_ BitVec 32) ValueCell!7906)) (size!24245 (_ BitVec 32))) )
))
(declare-fun lt!388974 () array!49548)

(declare-fun minValue!654 () V!27301)

(declare-fun zeroValue!654 () V!27301)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2925 (array!49546 array!49548 (_ BitVec 32) (_ BitVec 32) V!27301 V!27301 (_ BitVec 32) Int) ListLongMap!9867)

(assert (=> b!862126 (= lt!388978 (getCurrentListMapNoExtraKeys!2925 _keys!868 lt!388974 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!49548)

(assert (=> b!862126 (= lt!388976 (getCurrentListMapNoExtraKeys!2925 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29429 0))(
  ( (Unit!29430) )
))
(declare-fun lt!388983 () Unit!29429)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!509 (array!49546 array!49548 (_ BitVec 32) (_ BitVec 32) V!27301 V!27301 (_ BitVec 32) (_ BitVec 64) V!27301 (_ BitVec 32) Int) Unit!29429)

(assert (=> b!862126 (= lt!388983 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!509 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!862127 () Bool)

(declare-fun e!480320 () Unit!29429)

(declare-fun Unit!29431 () Unit!29429)

(assert (=> b!862127 (= e!480320 Unit!29431)))

(declare-fun b!862128 () Bool)

(assert (=> b!862128 (= e!480324 true)))

(assert (=> b!862128 (not (= (select (arr!23804 _keys!868) from!1053) k!854))))

(declare-fun lt!388979 () Unit!29429)

(assert (=> b!862128 (= lt!388979 e!480320)))

(declare-fun c!92053 () Bool)

(assert (=> b!862128 (= c!92053 (= (select (arr!23804 _keys!868) from!1053) k!854))))

(declare-fun lt!388984 () ListLongMap!9867)

(declare-fun get!12562 (ValueCell!7906 V!27301) V!27301)

(declare-fun dynLambda!1134 (Int (_ BitVec 64)) V!27301)

(assert (=> b!862128 (= lt!388984 (+!2299 lt!388977 (tuple2!11099 (select (arr!23804 _keys!868) from!1053) (get!12562 (select (arr!23805 _values!688) from!1053) (dynLambda!1134 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!862129 () Bool)

(declare-fun res!585857 () Bool)

(declare-fun e!480325 () Bool)

(assert (=> b!862129 (=> (not res!585857) (not e!480325))))

(assert (=> b!862129 (= res!585857 (and (= (size!24245 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24244 _keys!868) (size!24245 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!862130 () Bool)

(declare-fun e!480321 () Bool)

(declare-fun tp_is_empty!16691 () Bool)

(assert (=> b!862130 (= e!480321 tp_is_empty!16691)))

(declare-fun res!585858 () Bool)

(assert (=> start!73640 (=> (not res!585858) (not e!480325))))

(assert (=> start!73640 (= res!585858 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24244 _keys!868))))))

(assert (=> start!73640 e!480325))

(assert (=> start!73640 tp_is_empty!16691))

(assert (=> start!73640 true))

(assert (=> start!73640 tp!51169))

(declare-fun array_inv!18834 (array!49546) Bool)

(assert (=> start!73640 (array_inv!18834 _keys!868)))

(declare-fun e!480318 () Bool)

(declare-fun array_inv!18835 (array!49548) Bool)

(assert (=> start!73640 (and (array_inv!18835 _values!688) e!480318)))

(declare-fun b!862131 () Bool)

(declare-fun res!585859 () Bool)

(assert (=> b!862131 (=> (not res!585859) (not e!480325))))

(declare-datatypes ((List!16908 0))(
  ( (Nil!16905) (Cons!16904 (h!18035 (_ BitVec 64)) (t!23729 List!16908)) )
))
(declare-fun arrayNoDuplicates!0 (array!49546 (_ BitVec 32) List!16908) Bool)

(assert (=> b!862131 (= res!585859 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16905))))

(declare-fun b!862132 () Bool)

(declare-fun res!585863 () Bool)

(assert (=> b!862132 (=> (not res!585863) (not e!480325))))

(assert (=> b!862132 (= res!585863 (and (= (select (arr!23804 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!862133 () Bool)

(declare-fun res!585865 () Bool)

(assert (=> b!862133 (=> (not res!585865) (not e!480325))))

(assert (=> b!862133 (= res!585865 (validKeyInArray!0 k!854))))

(declare-fun b!862134 () Bool)

(declare-fun e!480322 () Bool)

(assert (=> b!862134 (= e!480322 tp_is_empty!16691)))

(declare-fun mapNonEmpty!26636 () Bool)

(declare-fun mapRes!26636 () Bool)

(declare-fun tp!51168 () Bool)

(assert (=> mapNonEmpty!26636 (= mapRes!26636 (and tp!51168 e!480321))))

(declare-fun mapRest!26636 () (Array (_ BitVec 32) ValueCell!7906))

(declare-fun mapKey!26636 () (_ BitVec 32))

(declare-fun mapValue!26636 () ValueCell!7906)

(assert (=> mapNonEmpty!26636 (= (arr!23805 _values!688) (store mapRest!26636 mapKey!26636 mapValue!26636))))

(declare-fun b!862135 () Bool)

(declare-fun Unit!29432 () Unit!29429)

(assert (=> b!862135 (= e!480320 Unit!29432)))

(declare-fun lt!388982 () Unit!29429)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49546 (_ BitVec 32) (_ BitVec 32)) Unit!29429)

(assert (=> b!862135 (= lt!388982 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!862135 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16905)))

(declare-fun lt!388975 () Unit!29429)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49546 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29429)

(assert (=> b!862135 (= lt!388975 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49546 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!862135 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388981 () Unit!29429)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49546 (_ BitVec 64) (_ BitVec 32) List!16908) Unit!29429)

(assert (=> b!862135 (= lt!388981 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!16905))))

(assert (=> b!862135 false))

(declare-fun mapIsEmpty!26636 () Bool)

(assert (=> mapIsEmpty!26636 mapRes!26636))

(declare-fun b!862136 () Bool)

(declare-fun res!585862 () Bool)

(assert (=> b!862136 (=> (not res!585862) (not e!480325))))

(assert (=> b!862136 (= res!585862 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24244 _keys!868))))))

(declare-fun b!862137 () Bool)

(declare-fun res!585861 () Bool)

(assert (=> b!862137 (=> (not res!585861) (not e!480325))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49546 (_ BitVec 32)) Bool)

(assert (=> b!862137 (= res!585861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!862138 () Bool)

(declare-fun res!585864 () Bool)

(assert (=> b!862138 (=> (not res!585864) (not e!480325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!862138 (= res!585864 (validMask!0 mask!1196))))

(declare-fun b!862139 () Bool)

(assert (=> b!862139 (= e!480325 e!480319)))

(declare-fun res!585860 () Bool)

(assert (=> b!862139 (=> (not res!585860) (not e!480319))))

(assert (=> b!862139 (= res!585860 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!862139 (= lt!388984 (getCurrentListMapNoExtraKeys!2925 _keys!868 lt!388974 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!862139 (= lt!388974 (array!49549 (store (arr!23805 _values!688) i!612 (ValueCellFull!7906 v!557)) (size!24245 _values!688)))))

(declare-fun lt!388980 () ListLongMap!9867)

(assert (=> b!862139 (= lt!388980 (getCurrentListMapNoExtraKeys!2925 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!862140 () Bool)

(assert (=> b!862140 (= e!480318 (and e!480322 mapRes!26636))))

(declare-fun condMapEmpty!26636 () Bool)

(declare-fun mapDefault!26636 () ValueCell!7906)

