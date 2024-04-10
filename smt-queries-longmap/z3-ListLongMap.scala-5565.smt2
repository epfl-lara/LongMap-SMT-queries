; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73176 () Bool)

(assert start!73176)

(declare-fun b_free!14091 () Bool)

(declare-fun b_next!14091 () Bool)

(assert (=> start!73176 (= b_free!14091 (not b_next!14091))))

(declare-fun tp!49776 () Bool)

(declare-fun b_and!23341 () Bool)

(assert (=> start!73176 (= tp!49776 b_and!23341)))

(declare-fun b!852293 () Bool)

(declare-fun res!578890 () Bool)

(declare-fun e!475357 () Bool)

(assert (=> b!852293 (=> (not res!578890) (not e!475357))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!852293 (= res!578890 (validMask!0 mask!1196))))

(declare-fun bm!38125 () Bool)

(declare-datatypes ((V!26683 0))(
  ( (V!26684 (val!8161 Int)) )
))
(declare-datatypes ((tuple2!10716 0))(
  ( (tuple2!10717 (_1!5369 (_ BitVec 64)) (_2!5369 V!26683)) )
))
(declare-datatypes ((List!16550 0))(
  ( (Nil!16547) (Cons!16546 (h!17677 tuple2!10716) (t!23087 List!16550)) )
))
(declare-datatypes ((ListLongMap!9485 0))(
  ( (ListLongMap!9486 (toList!4758 List!16550)) )
))
(declare-fun call!38129 () ListLongMap!9485)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!48652 0))(
  ( (array!48653 (arr!23357 (Array (_ BitVec 32) (_ BitVec 64))) (size!23797 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48652)

(declare-datatypes ((ValueCell!7674 0))(
  ( (ValueCellFull!7674 (v!10586 V!26683)) (EmptyCell!7674) )
))
(declare-datatypes ((array!48654 0))(
  ( (array!48655 (arr!23358 (Array (_ BitVec 32) ValueCell!7674)) (size!23798 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48654)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26683)

(declare-fun zeroValue!654 () V!26683)

(declare-fun getCurrentListMapNoExtraKeys!2740 (array!48652 array!48654 (_ BitVec 32) (_ BitVec 32) V!26683 V!26683 (_ BitVec 32) Int) ListLongMap!9485)

(assert (=> bm!38125 (= call!38129 (getCurrentListMapNoExtraKeys!2740 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852295 () Bool)

(declare-fun res!578893 () Bool)

(assert (=> b!852295 (=> (not res!578893) (not e!475357))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!852295 (= res!578893 (and (= (select (arr!23357 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!852296 () Bool)

(declare-fun e!475355 () Bool)

(assert (=> b!852296 (= e!475355 true)))

(declare-fun lt!384011 () tuple2!10716)

(declare-fun lt!384012 () ListLongMap!9485)

(declare-fun lt!384010 () V!26683)

(declare-fun +!2156 (ListLongMap!9485 tuple2!10716) ListLongMap!9485)

(assert (=> b!852296 (= (+!2156 lt!384012 lt!384011) (+!2156 (+!2156 lt!384012 (tuple2!10717 k0!854 lt!384010)) lt!384011))))

(declare-fun lt!384013 () V!26683)

(assert (=> b!852296 (= lt!384011 (tuple2!10717 k0!854 lt!384013))))

(declare-datatypes ((Unit!29093 0))(
  ( (Unit!29094) )
))
(declare-fun lt!384008 () Unit!29093)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!284 (ListLongMap!9485 (_ BitVec 64) V!26683 V!26683) Unit!29093)

(assert (=> b!852296 (= lt!384008 (addSameAsAddTwiceSameKeyDiffValues!284 lt!384012 k0!854 lt!384010 lt!384013))))

(declare-fun lt!384004 () V!26683)

(declare-fun get!12312 (ValueCell!7674 V!26683) V!26683)

(assert (=> b!852296 (= lt!384010 (get!12312 (select (arr!23358 _values!688) from!1053) lt!384004))))

(declare-fun lt!384006 () ListLongMap!9485)

(assert (=> b!852296 (= lt!384006 (+!2156 lt!384012 (tuple2!10717 (select (arr!23357 _keys!868) from!1053) lt!384013)))))

(declare-fun v!557 () V!26683)

(assert (=> b!852296 (= lt!384013 (get!12312 (select (store (arr!23358 _values!688) i!612 (ValueCellFull!7674 v!557)) from!1053) lt!384004))))

(declare-fun dynLambda!1038 (Int (_ BitVec 64)) V!26683)

(assert (=> b!852296 (= lt!384004 (dynLambda!1038 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!384009 () array!48654)

(assert (=> b!852296 (= lt!384012 (getCurrentListMapNoExtraKeys!2740 _keys!868 lt!384009 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun call!38128 () ListLongMap!9485)

(declare-fun bm!38126 () Bool)

(assert (=> bm!38126 (= call!38128 (getCurrentListMapNoExtraKeys!2740 _keys!868 lt!384009 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852297 () Bool)

(declare-fun e!475360 () Bool)

(declare-fun tp_is_empty!16227 () Bool)

(assert (=> b!852297 (= e!475360 tp_is_empty!16227)))

(declare-fun b!852298 () Bool)

(declare-fun e!475358 () Bool)

(assert (=> b!852298 (= e!475358 (= call!38128 call!38129))))

(declare-fun mapNonEmpty!25940 () Bool)

(declare-fun mapRes!25940 () Bool)

(declare-fun tp!49777 () Bool)

(declare-fun e!475354 () Bool)

(assert (=> mapNonEmpty!25940 (= mapRes!25940 (and tp!49777 e!475354))))

(declare-fun mapRest!25940 () (Array (_ BitVec 32) ValueCell!7674))

(declare-fun mapValue!25940 () ValueCell!7674)

(declare-fun mapKey!25940 () (_ BitVec 32))

(assert (=> mapNonEmpty!25940 (= (arr!23358 _values!688) (store mapRest!25940 mapKey!25940 mapValue!25940))))

(declare-fun res!578896 () Bool)

(assert (=> start!73176 (=> (not res!578896) (not e!475357))))

(assert (=> start!73176 (= res!578896 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23797 _keys!868))))))

(assert (=> start!73176 e!475357))

(assert (=> start!73176 tp_is_empty!16227))

(assert (=> start!73176 true))

(assert (=> start!73176 tp!49776))

(declare-fun array_inv!18526 (array!48652) Bool)

(assert (=> start!73176 (array_inv!18526 _keys!868)))

(declare-fun e!475356 () Bool)

(declare-fun array_inv!18527 (array!48654) Bool)

(assert (=> start!73176 (and (array_inv!18527 _values!688) e!475356)))

(declare-fun b!852294 () Bool)

(assert (=> b!852294 (= e!475354 tp_is_empty!16227)))

(declare-fun b!852299 () Bool)

(assert (=> b!852299 (= e!475358 (= call!38128 (+!2156 call!38129 (tuple2!10717 k0!854 v!557))))))

(declare-fun b!852300 () Bool)

(declare-fun e!475359 () Bool)

(assert (=> b!852300 (= e!475357 e!475359)))

(declare-fun res!578889 () Bool)

(assert (=> b!852300 (=> (not res!578889) (not e!475359))))

(assert (=> b!852300 (= res!578889 (= from!1053 i!612))))

(assert (=> b!852300 (= lt!384006 (getCurrentListMapNoExtraKeys!2740 _keys!868 lt!384009 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!852300 (= lt!384009 (array!48655 (store (arr!23358 _values!688) i!612 (ValueCellFull!7674 v!557)) (size!23798 _values!688)))))

(declare-fun lt!384005 () ListLongMap!9485)

(assert (=> b!852300 (= lt!384005 (getCurrentListMapNoExtraKeys!2740 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!852301 () Bool)

(declare-fun res!578897 () Bool)

(assert (=> b!852301 (=> (not res!578897) (not e!475357))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!852301 (= res!578897 (validKeyInArray!0 k0!854))))

(declare-fun b!852302 () Bool)

(declare-fun res!578888 () Bool)

(assert (=> b!852302 (=> (not res!578888) (not e!475357))))

(declare-datatypes ((List!16551 0))(
  ( (Nil!16548) (Cons!16547 (h!17678 (_ BitVec 64)) (t!23088 List!16551)) )
))
(declare-fun arrayNoDuplicates!0 (array!48652 (_ BitVec 32) List!16551) Bool)

(assert (=> b!852302 (= res!578888 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16548))))

(declare-fun b!852303 () Bool)

(assert (=> b!852303 (= e!475359 (not e!475355))))

(declare-fun res!578891 () Bool)

(assert (=> b!852303 (=> res!578891 e!475355)))

(assert (=> b!852303 (= res!578891 (not (validKeyInArray!0 (select (arr!23357 _keys!868) from!1053))))))

(assert (=> b!852303 e!475358))

(declare-fun c!91807 () Bool)

(assert (=> b!852303 (= c!91807 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!384007 () Unit!29093)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!386 (array!48652 array!48654 (_ BitVec 32) (_ BitVec 32) V!26683 V!26683 (_ BitVec 32) (_ BitVec 64) V!26683 (_ BitVec 32) Int) Unit!29093)

(assert (=> b!852303 (= lt!384007 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!386 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!25940 () Bool)

(assert (=> mapIsEmpty!25940 mapRes!25940))

(declare-fun b!852304 () Bool)

(declare-fun res!578895 () Bool)

(assert (=> b!852304 (=> (not res!578895) (not e!475357))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48652 (_ BitVec 32)) Bool)

(assert (=> b!852304 (= res!578895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!852305 () Bool)

(assert (=> b!852305 (= e!475356 (and e!475360 mapRes!25940))))

(declare-fun condMapEmpty!25940 () Bool)

(declare-fun mapDefault!25940 () ValueCell!7674)

(assert (=> b!852305 (= condMapEmpty!25940 (= (arr!23358 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7674)) mapDefault!25940)))))

(declare-fun b!852306 () Bool)

(declare-fun res!578894 () Bool)

(assert (=> b!852306 (=> (not res!578894) (not e!475357))))

(assert (=> b!852306 (= res!578894 (and (= (size!23798 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23797 _keys!868) (size!23798 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!852307 () Bool)

(declare-fun res!578892 () Bool)

(assert (=> b!852307 (=> (not res!578892) (not e!475357))))

(assert (=> b!852307 (= res!578892 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23797 _keys!868))))))

(assert (= (and start!73176 res!578896) b!852293))

(assert (= (and b!852293 res!578890) b!852306))

(assert (= (and b!852306 res!578894) b!852304))

(assert (= (and b!852304 res!578895) b!852302))

(assert (= (and b!852302 res!578888) b!852307))

(assert (= (and b!852307 res!578892) b!852301))

(assert (= (and b!852301 res!578897) b!852295))

(assert (= (and b!852295 res!578893) b!852300))

(assert (= (and b!852300 res!578889) b!852303))

(assert (= (and b!852303 c!91807) b!852299))

(assert (= (and b!852303 (not c!91807)) b!852298))

(assert (= (or b!852299 b!852298) bm!38126))

(assert (= (or b!852299 b!852298) bm!38125))

(assert (= (and b!852303 (not res!578891)) b!852296))

(assert (= (and b!852305 condMapEmpty!25940) mapIsEmpty!25940))

(assert (= (and b!852305 (not condMapEmpty!25940)) mapNonEmpty!25940))

(get-info :version)

(assert (= (and mapNonEmpty!25940 ((_ is ValueCellFull!7674) mapValue!25940)) b!852294))

(assert (= (and b!852305 ((_ is ValueCellFull!7674) mapDefault!25940)) b!852297))

(assert (= start!73176 b!852305))

(declare-fun b_lambda!11623 () Bool)

(assert (=> (not b_lambda!11623) (not b!852296)))

(declare-fun t!23086 () Bool)

(declare-fun tb!4393 () Bool)

(assert (=> (and start!73176 (= defaultEntry!696 defaultEntry!696) t!23086) tb!4393))

(declare-fun result!8397 () Bool)

(assert (=> tb!4393 (= result!8397 tp_is_empty!16227)))

(assert (=> b!852296 t!23086))

(declare-fun b_and!23343 () Bool)

(assert (= b_and!23341 (and (=> t!23086 result!8397) b_and!23343)))

(declare-fun m!793333 () Bool)

(assert (=> b!852299 m!793333))

(declare-fun m!793335 () Bool)

(assert (=> b!852295 m!793335))

(declare-fun m!793337 () Bool)

(assert (=> b!852301 m!793337))

(declare-fun m!793339 () Bool)

(assert (=> b!852304 m!793339))

(declare-fun m!793341 () Bool)

(assert (=> b!852300 m!793341))

(declare-fun m!793343 () Bool)

(assert (=> b!852300 m!793343))

(declare-fun m!793345 () Bool)

(assert (=> b!852300 m!793345))

(declare-fun m!793347 () Bool)

(assert (=> bm!38125 m!793347))

(declare-fun m!793349 () Bool)

(assert (=> b!852296 m!793349))

(declare-fun m!793351 () Bool)

(assert (=> b!852296 m!793351))

(declare-fun m!793353 () Bool)

(assert (=> b!852296 m!793353))

(declare-fun m!793355 () Bool)

(assert (=> b!852296 m!793355))

(declare-fun m!793357 () Bool)

(assert (=> b!852296 m!793357))

(declare-fun m!793359 () Bool)

(assert (=> b!852296 m!793359))

(declare-fun m!793361 () Bool)

(assert (=> b!852296 m!793361))

(assert (=> b!852296 m!793349))

(assert (=> b!852296 m!793343))

(assert (=> b!852296 m!793353))

(declare-fun m!793363 () Bool)

(assert (=> b!852296 m!793363))

(assert (=> b!852296 m!793357))

(declare-fun m!793365 () Bool)

(assert (=> b!852296 m!793365))

(declare-fun m!793367 () Bool)

(assert (=> b!852296 m!793367))

(declare-fun m!793369 () Bool)

(assert (=> b!852296 m!793369))

(declare-fun m!793371 () Bool)

(assert (=> b!852296 m!793371))

(declare-fun m!793373 () Bool)

(assert (=> b!852302 m!793373))

(declare-fun m!793375 () Bool)

(assert (=> start!73176 m!793375))

(declare-fun m!793377 () Bool)

(assert (=> start!73176 m!793377))

(assert (=> bm!38126 m!793361))

(assert (=> b!852303 m!793369))

(assert (=> b!852303 m!793369))

(declare-fun m!793379 () Bool)

(assert (=> b!852303 m!793379))

(declare-fun m!793381 () Bool)

(assert (=> b!852303 m!793381))

(declare-fun m!793383 () Bool)

(assert (=> mapNonEmpty!25940 m!793383))

(declare-fun m!793385 () Bool)

(assert (=> b!852293 m!793385))

(check-sat (not bm!38125) (not b!852303) (not b!852293) (not b!852301) (not b!852296) (not mapNonEmpty!25940) tp_is_empty!16227 b_and!23343 (not bm!38126) (not start!73176) (not b_lambda!11623) (not b!852302) (not b!852304) (not b_next!14091) (not b!852299) (not b!852300))
(check-sat b_and!23343 (not b_next!14091))
