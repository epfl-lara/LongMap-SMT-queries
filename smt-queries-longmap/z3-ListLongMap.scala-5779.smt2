; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74578 () Bool)

(assert start!74578)

(declare-fun b_free!15267 () Bool)

(declare-fun b_next!15267 () Bool)

(assert (=> start!74578 (= b_free!15267 (not b_next!15267))))

(declare-fun tp!53482 () Bool)

(declare-fun b_and!25143 () Bool)

(assert (=> start!74578 (= tp!53482 b_and!25143)))

(declare-fun b!878746 () Bool)

(declare-fun res!597008 () Bool)

(declare-fun e!489042 () Bool)

(assert (=> b!878746 (=> (not res!597008) (not e!489042))))

(declare-datatypes ((array!51148 0))(
  ( (array!51149 (arr!24600 (Array (_ BitVec 32) (_ BitVec 64))) (size!25040 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51148)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51148 (_ BitVec 32)) Bool)

(assert (=> b!878746 (= res!597008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!597010 () Bool)

(assert (=> start!74578 (=> (not res!597010) (not e!489042))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74578 (= res!597010 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25040 _keys!868))))))

(assert (=> start!74578 e!489042))

(declare-fun tp_is_empty!17511 () Bool)

(assert (=> start!74578 tp_is_empty!17511))

(assert (=> start!74578 true))

(assert (=> start!74578 tp!53482))

(declare-fun array_inv!19386 (array!51148) Bool)

(assert (=> start!74578 (array_inv!19386 _keys!868)))

(declare-datatypes ((V!28395 0))(
  ( (V!28396 (val!8803 Int)) )
))
(declare-datatypes ((ValueCell!8316 0))(
  ( (ValueCellFull!8316 (v!11243 V!28395)) (EmptyCell!8316) )
))
(declare-datatypes ((array!51150 0))(
  ( (array!51151 (arr!24601 (Array (_ BitVec 32) ValueCell!8316)) (size!25041 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51150)

(declare-fun e!489043 () Bool)

(declare-fun array_inv!19387 (array!51150) Bool)

(assert (=> start!74578 (and (array_inv!19387 _values!688) e!489043)))

(declare-fun b!878747 () Bool)

(declare-fun res!597014 () Bool)

(assert (=> b!878747 (=> (not res!597014) (not e!489042))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878747 (= res!597014 (validKeyInArray!0 k0!854))))

(declare-fun b!878748 () Bool)

(declare-fun e!489045 () Bool)

(assert (=> b!878748 (= e!489045 (not (bvslt from!1053 (size!25040 _keys!868))))))

(declare-fun v!557 () V!28395)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28395)

(declare-fun zeroValue!654 () V!28395)

(declare-fun lt!397321 () array!51150)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!11640 0))(
  ( (tuple2!11641 (_1!5831 (_ BitVec 64)) (_2!5831 V!28395)) )
))
(declare-datatypes ((List!17456 0))(
  ( (Nil!17453) (Cons!17452 (h!18583 tuple2!11640) (t!24545 List!17456)) )
))
(declare-datatypes ((ListLongMap!10409 0))(
  ( (ListLongMap!10410 (toList!5220 List!17456)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3187 (array!51148 array!51150 (_ BitVec 32) (_ BitVec 32) V!28395 V!28395 (_ BitVec 32) Int) ListLongMap!10409)

(declare-fun +!2494 (ListLongMap!10409 tuple2!11640) ListLongMap!10409)

(assert (=> b!878748 (= (getCurrentListMapNoExtraKeys!3187 _keys!868 lt!397321 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2494 (getCurrentListMapNoExtraKeys!3187 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11641 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!30014 0))(
  ( (Unit!30015) )
))
(declare-fun lt!397322 () Unit!30014)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!689 (array!51148 array!51150 (_ BitVec 32) (_ BitVec 32) V!28395 V!28395 (_ BitVec 32) (_ BitVec 64) V!28395 (_ BitVec 32) Int) Unit!30014)

(assert (=> b!878748 (= lt!397322 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!689 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!27882 () Bool)

(declare-fun mapRes!27882 () Bool)

(declare-fun tp!53483 () Bool)

(declare-fun e!489046 () Bool)

(assert (=> mapNonEmpty!27882 (= mapRes!27882 (and tp!53483 e!489046))))

(declare-fun mapRest!27882 () (Array (_ BitVec 32) ValueCell!8316))

(declare-fun mapKey!27882 () (_ BitVec 32))

(declare-fun mapValue!27882 () ValueCell!8316)

(assert (=> mapNonEmpty!27882 (= (arr!24601 _values!688) (store mapRest!27882 mapKey!27882 mapValue!27882))))

(declare-fun b!878749 () Bool)

(declare-fun res!597013 () Bool)

(assert (=> b!878749 (=> (not res!597013) (not e!489042))))

(declare-datatypes ((List!17457 0))(
  ( (Nil!17454) (Cons!17453 (h!18584 (_ BitVec 64)) (t!24546 List!17457)) )
))
(declare-fun arrayNoDuplicates!0 (array!51148 (_ BitVec 32) List!17457) Bool)

(assert (=> b!878749 (= res!597013 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17454))))

(declare-fun b!878750 () Bool)

(declare-fun res!597011 () Bool)

(assert (=> b!878750 (=> (not res!597011) (not e!489042))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878750 (= res!597011 (validMask!0 mask!1196))))

(declare-fun b!878751 () Bool)

(declare-fun res!597012 () Bool)

(assert (=> b!878751 (=> (not res!597012) (not e!489042))))

(assert (=> b!878751 (= res!597012 (and (= (select (arr!24600 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!878752 () Bool)

(declare-fun e!489041 () Bool)

(assert (=> b!878752 (= e!489043 (and e!489041 mapRes!27882))))

(declare-fun condMapEmpty!27882 () Bool)

(declare-fun mapDefault!27882 () ValueCell!8316)

(assert (=> b!878752 (= condMapEmpty!27882 (= (arr!24601 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8316)) mapDefault!27882)))))

(declare-fun b!878753 () Bool)

(declare-fun res!597009 () Bool)

(assert (=> b!878753 (=> (not res!597009) (not e!489042))))

(assert (=> b!878753 (= res!597009 (and (= (size!25041 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25040 _keys!868) (size!25041 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!878754 () Bool)

(assert (=> b!878754 (= e!489041 tp_is_empty!17511)))

(declare-fun b!878755 () Bool)

(declare-fun res!597007 () Bool)

(assert (=> b!878755 (=> (not res!597007) (not e!489042))))

(assert (=> b!878755 (= res!597007 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25040 _keys!868))))))

(declare-fun mapIsEmpty!27882 () Bool)

(assert (=> mapIsEmpty!27882 mapRes!27882))

(declare-fun b!878756 () Bool)

(assert (=> b!878756 (= e!489042 e!489045)))

(declare-fun res!597006 () Bool)

(assert (=> b!878756 (=> (not res!597006) (not e!489045))))

(assert (=> b!878756 (= res!597006 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!397323 () ListLongMap!10409)

(assert (=> b!878756 (= lt!397323 (getCurrentListMapNoExtraKeys!3187 _keys!868 lt!397321 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!878756 (= lt!397321 (array!51151 (store (arr!24601 _values!688) i!612 (ValueCellFull!8316 v!557)) (size!25041 _values!688)))))

(declare-fun lt!397320 () ListLongMap!10409)

(assert (=> b!878756 (= lt!397320 (getCurrentListMapNoExtraKeys!3187 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!878757 () Bool)

(assert (=> b!878757 (= e!489046 tp_is_empty!17511)))

(assert (= (and start!74578 res!597010) b!878750))

(assert (= (and b!878750 res!597011) b!878753))

(assert (= (and b!878753 res!597009) b!878746))

(assert (= (and b!878746 res!597008) b!878749))

(assert (= (and b!878749 res!597013) b!878755))

(assert (= (and b!878755 res!597007) b!878747))

(assert (= (and b!878747 res!597014) b!878751))

(assert (= (and b!878751 res!597012) b!878756))

(assert (= (and b!878756 res!597006) b!878748))

(assert (= (and b!878752 condMapEmpty!27882) mapIsEmpty!27882))

(assert (= (and b!878752 (not condMapEmpty!27882)) mapNonEmpty!27882))

(get-info :version)

(assert (= (and mapNonEmpty!27882 ((_ is ValueCellFull!8316) mapValue!27882)) b!878757))

(assert (= (and b!878752 ((_ is ValueCellFull!8316) mapDefault!27882)) b!878754))

(assert (= start!74578 b!878752))

(declare-fun m!818519 () Bool)

(assert (=> b!878749 m!818519))

(declare-fun m!818521 () Bool)

(assert (=> b!878746 m!818521))

(declare-fun m!818523 () Bool)

(assert (=> mapNonEmpty!27882 m!818523))

(declare-fun m!818525 () Bool)

(assert (=> b!878751 m!818525))

(declare-fun m!818527 () Bool)

(assert (=> b!878748 m!818527))

(declare-fun m!818529 () Bool)

(assert (=> b!878748 m!818529))

(assert (=> b!878748 m!818529))

(declare-fun m!818531 () Bool)

(assert (=> b!878748 m!818531))

(declare-fun m!818533 () Bool)

(assert (=> b!878748 m!818533))

(declare-fun m!818535 () Bool)

(assert (=> b!878747 m!818535))

(declare-fun m!818537 () Bool)

(assert (=> b!878750 m!818537))

(declare-fun m!818539 () Bool)

(assert (=> start!74578 m!818539))

(declare-fun m!818541 () Bool)

(assert (=> start!74578 m!818541))

(declare-fun m!818543 () Bool)

(assert (=> b!878756 m!818543))

(declare-fun m!818545 () Bool)

(assert (=> b!878756 m!818545))

(declare-fun m!818547 () Bool)

(assert (=> b!878756 m!818547))

(check-sat (not start!74578) (not b_next!15267) b_and!25143 (not b!878750) (not b!878748) tp_is_empty!17511 (not mapNonEmpty!27882) (not b!878746) (not b!878749) (not b!878747) (not b!878756))
(check-sat b_and!25143 (not b_next!15267))
