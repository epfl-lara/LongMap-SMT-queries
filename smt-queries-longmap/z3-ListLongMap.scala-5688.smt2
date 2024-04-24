; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74080 () Bool)

(assert start!74080)

(declare-fun b_free!14827 () Bool)

(declare-fun b_next!14827 () Bool)

(assert (=> start!74080 (= b_free!14827 (not b_next!14827))))

(declare-fun tp!51985 () Bool)

(declare-fun b_and!24589 () Bool)

(assert (=> start!74080 (= tp!51985 b_and!24589)))

(declare-fun b!869442 () Bool)

(declare-fun res!590527 () Bool)

(declare-fun e!484326 () Bool)

(assert (=> b!869442 (=> (not res!590527) (not e!484326))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50135 0))(
  ( (array!50136 (arr!24094 (Array (_ BitVec 32) (_ BitVec 64))) (size!24535 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50135)

(declare-datatypes ((V!27665 0))(
  ( (V!27666 (val!8529 Int)) )
))
(declare-datatypes ((ValueCell!8042 0))(
  ( (ValueCellFull!8042 (v!10954 V!27665)) (EmptyCell!8042) )
))
(declare-datatypes ((array!50137 0))(
  ( (array!50138 (arr!24095 (Array (_ BitVec 32) ValueCell!8042)) (size!24536 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50137)

(assert (=> b!869442 (= res!590527 (and (= (size!24536 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24535 _keys!868) (size!24536 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!27044 () Bool)

(declare-fun mapRes!27044 () Bool)

(assert (=> mapIsEmpty!27044 mapRes!27044))

(declare-fun b!869444 () Bool)

(declare-fun res!590525 () Bool)

(assert (=> b!869444 (=> (not res!590525) (not e!484326))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869444 (= res!590525 (validMask!0 mask!1196))))

(declare-fun b!869445 () Bool)

(declare-fun res!590530 () Bool)

(assert (=> b!869445 (=> (not res!590530) (not e!484326))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!869445 (= res!590530 (and (= (select (arr!24094 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!27044 () Bool)

(declare-fun tp!51986 () Bool)

(declare-fun e!484323 () Bool)

(assert (=> mapNonEmpty!27044 (= mapRes!27044 (and tp!51986 e!484323))))

(declare-fun mapKey!27044 () (_ BitVec 32))

(declare-fun mapRest!27044 () (Array (_ BitVec 32) ValueCell!8042))

(declare-fun mapValue!27044 () ValueCell!8042)

(assert (=> mapNonEmpty!27044 (= (arr!24095 _values!688) (store mapRest!27044 mapKey!27044 mapValue!27044))))

(declare-fun b!869446 () Bool)

(declare-fun res!590524 () Bool)

(assert (=> b!869446 (=> (not res!590524) (not e!484326))))

(assert (=> b!869446 (= res!590524 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24535 _keys!868))))))

(declare-fun b!869447 () Bool)

(declare-fun res!590529 () Bool)

(assert (=> b!869447 (=> (not res!590529) (not e!484326))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869447 (= res!590529 (validKeyInArray!0 k0!854))))

(declare-fun b!869448 () Bool)

(declare-fun e!484327 () Bool)

(declare-fun e!484322 () Bool)

(assert (=> b!869448 (= e!484327 (and e!484322 mapRes!27044))))

(declare-fun condMapEmpty!27044 () Bool)

(declare-fun mapDefault!27044 () ValueCell!8042)

(assert (=> b!869448 (= condMapEmpty!27044 (= (arr!24095 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8042)) mapDefault!27044)))))

(declare-fun b!869443 () Bool)

(declare-fun e!484325 () Bool)

(assert (=> b!869443 (= e!484326 e!484325)))

(declare-fun res!590526 () Bool)

(assert (=> b!869443 (=> (not res!590526) (not e!484325))))

(assert (=> b!869443 (= res!590526 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394865 () array!50137)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11250 0))(
  ( (tuple2!11251 (_1!5636 (_ BitVec 64)) (_2!5636 V!27665)) )
))
(declare-datatypes ((List!17073 0))(
  ( (Nil!17070) (Cons!17069 (h!18206 tuple2!11250) (t!24102 List!17073)) )
))
(declare-datatypes ((ListLongMap!10021 0))(
  ( (ListLongMap!10022 (toList!5026 List!17073)) )
))
(declare-fun lt!394864 () ListLongMap!10021)

(declare-fun minValue!654 () V!27665)

(declare-fun zeroValue!654 () V!27665)

(declare-fun getCurrentListMapNoExtraKeys!3070 (array!50135 array!50137 (_ BitVec 32) (_ BitVec 32) V!27665 V!27665 (_ BitVec 32) Int) ListLongMap!10021)

(assert (=> b!869443 (= lt!394864 (getCurrentListMapNoExtraKeys!3070 _keys!868 lt!394865 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27665)

(assert (=> b!869443 (= lt!394865 (array!50138 (store (arr!24095 _values!688) i!612 (ValueCellFull!8042 v!557)) (size!24536 _values!688)))))

(declare-fun lt!394862 () ListLongMap!10021)

(assert (=> b!869443 (= lt!394862 (getCurrentListMapNoExtraKeys!3070 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!590522 () Bool)

(assert (=> start!74080 (=> (not res!590522) (not e!484326))))

(assert (=> start!74080 (= res!590522 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24535 _keys!868))))))

(assert (=> start!74080 e!484326))

(declare-fun tp_is_empty!16963 () Bool)

(assert (=> start!74080 tp_is_empty!16963))

(assert (=> start!74080 true))

(assert (=> start!74080 tp!51985))

(declare-fun array_inv!19086 (array!50135) Bool)

(assert (=> start!74080 (array_inv!19086 _keys!868)))

(declare-fun array_inv!19087 (array!50137) Bool)

(assert (=> start!74080 (and (array_inv!19087 _values!688) e!484327)))

(declare-fun b!869449 () Bool)

(assert (=> b!869449 (= e!484322 tp_is_empty!16963)))

(declare-fun b!869450 () Bool)

(declare-fun res!590528 () Bool)

(assert (=> b!869450 (=> (not res!590528) (not e!484326))))

(declare-datatypes ((List!17074 0))(
  ( (Nil!17071) (Cons!17070 (h!18207 (_ BitVec 64)) (t!24103 List!17074)) )
))
(declare-fun arrayNoDuplicates!0 (array!50135 (_ BitVec 32) List!17074) Bool)

(assert (=> b!869450 (= res!590528 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17071))))

(declare-fun b!869451 () Bool)

(assert (=> b!869451 (= e!484323 tp_is_empty!16963)))

(declare-fun b!869452 () Bool)

(assert (=> b!869452 (= e!484325 (not true))))

(declare-fun +!2422 (ListLongMap!10021 tuple2!11250) ListLongMap!10021)

(assert (=> b!869452 (= (getCurrentListMapNoExtraKeys!3070 _keys!868 lt!394865 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2422 (getCurrentListMapNoExtraKeys!3070 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11251 k0!854 v!557)))))

(declare-datatypes ((Unit!29794 0))(
  ( (Unit!29795) )
))
(declare-fun lt!394863 () Unit!29794)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!593 (array!50135 array!50137 (_ BitVec 32) (_ BitVec 32) V!27665 V!27665 (_ BitVec 32) (_ BitVec 64) V!27665 (_ BitVec 32) Int) Unit!29794)

(assert (=> b!869452 (= lt!394863 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!593 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!869453 () Bool)

(declare-fun res!590523 () Bool)

(assert (=> b!869453 (=> (not res!590523) (not e!484326))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50135 (_ BitVec 32)) Bool)

(assert (=> b!869453 (= res!590523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!74080 res!590522) b!869444))

(assert (= (and b!869444 res!590525) b!869442))

(assert (= (and b!869442 res!590527) b!869453))

(assert (= (and b!869453 res!590523) b!869450))

(assert (= (and b!869450 res!590528) b!869446))

(assert (= (and b!869446 res!590524) b!869447))

(assert (= (and b!869447 res!590529) b!869445))

(assert (= (and b!869445 res!590530) b!869443))

(assert (= (and b!869443 res!590526) b!869452))

(assert (= (and b!869448 condMapEmpty!27044) mapIsEmpty!27044))

(assert (= (and b!869448 (not condMapEmpty!27044)) mapNonEmpty!27044))

(get-info :version)

(assert (= (and mapNonEmpty!27044 ((_ is ValueCellFull!8042) mapValue!27044)) b!869451))

(assert (= (and b!869448 ((_ is ValueCellFull!8042) mapDefault!27044)) b!869449))

(assert (= start!74080 b!869448))

(declare-fun m!811517 () Bool)

(assert (=> b!869452 m!811517))

(declare-fun m!811519 () Bool)

(assert (=> b!869452 m!811519))

(assert (=> b!869452 m!811519))

(declare-fun m!811521 () Bool)

(assert (=> b!869452 m!811521))

(declare-fun m!811523 () Bool)

(assert (=> b!869452 m!811523))

(declare-fun m!811525 () Bool)

(assert (=> b!869453 m!811525))

(declare-fun m!811527 () Bool)

(assert (=> b!869445 m!811527))

(declare-fun m!811529 () Bool)

(assert (=> mapNonEmpty!27044 m!811529))

(declare-fun m!811531 () Bool)

(assert (=> b!869443 m!811531))

(declare-fun m!811533 () Bool)

(assert (=> b!869443 m!811533))

(declare-fun m!811535 () Bool)

(assert (=> b!869443 m!811535))

(declare-fun m!811537 () Bool)

(assert (=> b!869447 m!811537))

(declare-fun m!811539 () Bool)

(assert (=> b!869450 m!811539))

(declare-fun m!811541 () Bool)

(assert (=> b!869444 m!811541))

(declare-fun m!811543 () Bool)

(assert (=> start!74080 m!811543))

(declare-fun m!811545 () Bool)

(assert (=> start!74080 m!811545))

(check-sat (not b!869450) tp_is_empty!16963 (not b!869443) (not b_next!14827) (not start!74080) (not b!869444) b_and!24589 (not b!869453) (not b!869447) (not b!869452) (not mapNonEmpty!27044))
(check-sat b_and!24589 (not b_next!14827))
