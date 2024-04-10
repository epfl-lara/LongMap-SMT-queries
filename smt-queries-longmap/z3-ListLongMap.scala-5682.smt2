; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73878 () Bool)

(assert start!73878)

(declare-fun b_free!14793 () Bool)

(declare-fun b_next!14793 () Bool)

(assert (=> start!73878 (= b_free!14793 (not b_next!14793))))

(declare-fun tp!51883 () Bool)

(declare-fun b_and!24545 () Bool)

(assert (=> start!73878 (= tp!51883 b_and!24545)))

(declare-fun b!867927 () Bool)

(declare-fun res!589723 () Bool)

(declare-fun e!483434 () Bool)

(assert (=> b!867927 (=> (not res!589723) (not e!483434))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!867927 (= res!589723 (validMask!0 mask!1196))))

(declare-fun b!867928 () Bool)

(declare-fun res!589727 () Bool)

(assert (=> b!867928 (=> (not res!589727) (not e!483434))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!50018 0))(
  ( (array!50019 (arr!24040 (Array (_ BitVec 32) (_ BitVec 64))) (size!24480 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50018)

(declare-datatypes ((V!27619 0))(
  ( (V!27620 (val!8512 Int)) )
))
(declare-datatypes ((ValueCell!8025 0))(
  ( (ValueCellFull!8025 (v!10937 V!27619)) (EmptyCell!8025) )
))
(declare-datatypes ((array!50020 0))(
  ( (array!50021 (arr!24041 (Array (_ BitVec 32) ValueCell!8025)) (size!24481 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50020)

(assert (=> b!867928 (= res!589727 (and (= (size!24481 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24480 _keys!868) (size!24481 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!867929 () Bool)

(declare-fun res!589720 () Bool)

(assert (=> b!867929 (=> (not res!589720) (not e!483434))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867929 (= res!589720 (validKeyInArray!0 k0!854))))

(declare-fun b!867930 () Bool)

(declare-fun res!589725 () Bool)

(assert (=> b!867930 (=> (not res!589725) (not e!483434))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!867930 (= res!589725 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24480 _keys!868))))))

(declare-fun mapNonEmpty!26993 () Bool)

(declare-fun mapRes!26993 () Bool)

(declare-fun tp!51882 () Bool)

(declare-fun e!483437 () Bool)

(assert (=> mapNonEmpty!26993 (= mapRes!26993 (and tp!51882 e!483437))))

(declare-fun mapKey!26993 () (_ BitVec 32))

(declare-fun mapValue!26993 () ValueCell!8025)

(declare-fun mapRest!26993 () (Array (_ BitVec 32) ValueCell!8025))

(assert (=> mapNonEmpty!26993 (= (arr!24041 _values!688) (store mapRest!26993 mapKey!26993 mapValue!26993))))

(declare-fun b!867931 () Bool)

(declare-fun e!483439 () Bool)

(declare-fun tp_is_empty!16929 () Bool)

(assert (=> b!867931 (= e!483439 tp_is_empty!16929)))

(declare-fun b!867932 () Bool)

(declare-fun e!483435 () Bool)

(assert (=> b!867932 (= e!483435 (not true))))

(declare-fun lt!394300 () array!50020)

(declare-fun v!557 () V!27619)

(declare-fun defaultEntry!696 () Int)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27619)

(declare-fun zeroValue!654 () V!27619)

(declare-datatypes ((tuple2!11296 0))(
  ( (tuple2!11297 (_1!5659 (_ BitVec 64)) (_2!5659 V!27619)) )
))
(declare-datatypes ((List!17095 0))(
  ( (Nil!17092) (Cons!17091 (h!18222 tuple2!11296) (t!24132 List!17095)) )
))
(declare-datatypes ((ListLongMap!10065 0))(
  ( (ListLongMap!10066 (toList!5048 List!17095)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3017 (array!50018 array!50020 (_ BitVec 32) (_ BitVec 32) V!27619 V!27619 (_ BitVec 32) Int) ListLongMap!10065)

(declare-fun +!2392 (ListLongMap!10065 tuple2!11296) ListLongMap!10065)

(assert (=> b!867932 (= (getCurrentListMapNoExtraKeys!3017 _keys!868 lt!394300 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2392 (getCurrentListMapNoExtraKeys!3017 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11297 k0!854 v!557)))))

(declare-datatypes ((Unit!29782 0))(
  ( (Unit!29783) )
))
(declare-fun lt!394298 () Unit!29782)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!586 (array!50018 array!50020 (_ BitVec 32) (_ BitVec 32) V!27619 V!27619 (_ BitVec 32) (_ BitVec 64) V!27619 (_ BitVec 32) Int) Unit!29782)

(assert (=> b!867932 (= lt!394298 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!586 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!26993 () Bool)

(assert (=> mapIsEmpty!26993 mapRes!26993))

(declare-fun b!867934 () Bool)

(assert (=> b!867934 (= e!483437 tp_is_empty!16929)))

(declare-fun b!867935 () Bool)

(declare-fun res!589726 () Bool)

(assert (=> b!867935 (=> (not res!589726) (not e!483434))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50018 (_ BitVec 32)) Bool)

(assert (=> b!867935 (= res!589726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!867936 () Bool)

(assert (=> b!867936 (= e!483434 e!483435)))

(declare-fun res!589719 () Bool)

(assert (=> b!867936 (=> (not res!589719) (not e!483435))))

(assert (=> b!867936 (= res!589719 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394299 () ListLongMap!10065)

(assert (=> b!867936 (= lt!394299 (getCurrentListMapNoExtraKeys!3017 _keys!868 lt!394300 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!867936 (= lt!394300 (array!50021 (store (arr!24041 _values!688) i!612 (ValueCellFull!8025 v!557)) (size!24481 _values!688)))))

(declare-fun lt!394297 () ListLongMap!10065)

(assert (=> b!867936 (= lt!394297 (getCurrentListMapNoExtraKeys!3017 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!867937 () Bool)

(declare-fun res!589722 () Bool)

(assert (=> b!867937 (=> (not res!589722) (not e!483434))))

(assert (=> b!867937 (= res!589722 (and (= (select (arr!24040 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!867938 () Bool)

(declare-fun e!483438 () Bool)

(assert (=> b!867938 (= e!483438 (and e!483439 mapRes!26993))))

(declare-fun condMapEmpty!26993 () Bool)

(declare-fun mapDefault!26993 () ValueCell!8025)

(assert (=> b!867938 (= condMapEmpty!26993 (= (arr!24041 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8025)) mapDefault!26993)))))

(declare-fun res!589724 () Bool)

(assert (=> start!73878 (=> (not res!589724) (not e!483434))))

(assert (=> start!73878 (= res!589724 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24480 _keys!868))))))

(assert (=> start!73878 e!483434))

(assert (=> start!73878 tp_is_empty!16929))

(assert (=> start!73878 true))

(assert (=> start!73878 tp!51883))

(declare-fun array_inv!18996 (array!50018) Bool)

(assert (=> start!73878 (array_inv!18996 _keys!868)))

(declare-fun array_inv!18997 (array!50020) Bool)

(assert (=> start!73878 (and (array_inv!18997 _values!688) e!483438)))

(declare-fun b!867933 () Bool)

(declare-fun res!589721 () Bool)

(assert (=> b!867933 (=> (not res!589721) (not e!483434))))

(declare-datatypes ((List!17096 0))(
  ( (Nil!17093) (Cons!17092 (h!18223 (_ BitVec 64)) (t!24133 List!17096)) )
))
(declare-fun arrayNoDuplicates!0 (array!50018 (_ BitVec 32) List!17096) Bool)

(assert (=> b!867933 (= res!589721 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17093))))

(assert (= (and start!73878 res!589724) b!867927))

(assert (= (and b!867927 res!589723) b!867928))

(assert (= (and b!867928 res!589727) b!867935))

(assert (= (and b!867935 res!589726) b!867933))

(assert (= (and b!867933 res!589721) b!867930))

(assert (= (and b!867930 res!589725) b!867929))

(assert (= (and b!867929 res!589720) b!867937))

(assert (= (and b!867937 res!589722) b!867936))

(assert (= (and b!867936 res!589719) b!867932))

(assert (= (and b!867938 condMapEmpty!26993) mapIsEmpty!26993))

(assert (= (and b!867938 (not condMapEmpty!26993)) mapNonEmpty!26993))

(get-info :version)

(assert (= (and mapNonEmpty!26993 ((_ is ValueCellFull!8025) mapValue!26993)) b!867934))

(assert (= (and b!867938 ((_ is ValueCellFull!8025) mapDefault!26993)) b!867931))

(assert (= start!73878 b!867938))

(declare-fun m!809717 () Bool)

(assert (=> b!867927 m!809717))

(declare-fun m!809719 () Bool)

(assert (=> b!867937 m!809719))

(declare-fun m!809721 () Bool)

(assert (=> b!867932 m!809721))

(declare-fun m!809723 () Bool)

(assert (=> b!867932 m!809723))

(assert (=> b!867932 m!809723))

(declare-fun m!809725 () Bool)

(assert (=> b!867932 m!809725))

(declare-fun m!809727 () Bool)

(assert (=> b!867932 m!809727))

(declare-fun m!809729 () Bool)

(assert (=> b!867936 m!809729))

(declare-fun m!809731 () Bool)

(assert (=> b!867936 m!809731))

(declare-fun m!809733 () Bool)

(assert (=> b!867936 m!809733))

(declare-fun m!809735 () Bool)

(assert (=> mapNonEmpty!26993 m!809735))

(declare-fun m!809737 () Bool)

(assert (=> start!73878 m!809737))

(declare-fun m!809739 () Bool)

(assert (=> start!73878 m!809739))

(declare-fun m!809741 () Bool)

(assert (=> b!867933 m!809741))

(declare-fun m!809743 () Bool)

(assert (=> b!867929 m!809743))

(declare-fun m!809745 () Bool)

(assert (=> b!867935 m!809745))

(check-sat (not b!867929) (not b!867936) (not b!867935) (not b_next!14793) (not start!73878) b_and!24545 (not mapNonEmpty!26993) (not b!867927) (not b!867933) (not b!867932) tp_is_empty!16929)
(check-sat b_and!24545 (not b_next!14793))
