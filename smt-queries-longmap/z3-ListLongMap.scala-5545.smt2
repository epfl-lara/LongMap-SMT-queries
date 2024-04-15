; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73036 () Bool)

(assert start!73036)

(declare-fun b_free!13969 () Bool)

(declare-fun b_next!13969 () Bool)

(assert (=> start!73036 (= b_free!13969 (not b_next!13969))))

(declare-fun tp!49412 () Bool)

(declare-fun b_and!23071 () Bool)

(assert (=> start!73036 (= tp!49412 b_and!23071)))

(declare-fun b!849187 () Bool)

(declare-fun res!576948 () Bool)

(declare-fun e!473745 () Bool)

(assert (=> b!849187 (=> (not res!576948) (not e!473745))))

(declare-datatypes ((array!48411 0))(
  ( (array!48412 (arr!23237 (Array (_ BitVec 32) (_ BitVec 64))) (size!23679 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48411)

(declare-datatypes ((List!16476 0))(
  ( (Nil!16473) (Cons!16472 (h!17603 (_ BitVec 64)) (t!22882 List!16476)) )
))
(declare-fun arrayNoDuplicates!0 (array!48411 (_ BitVec 32) List!16476) Bool)

(assert (=> b!849187 (= res!576948 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16473))))

(declare-datatypes ((V!26521 0))(
  ( (V!26522 (val!8100 Int)) )
))
(declare-datatypes ((tuple2!10630 0))(
  ( (tuple2!10631 (_1!5326 (_ BitVec 64)) (_2!5326 V!26521)) )
))
(declare-datatypes ((List!16477 0))(
  ( (Nil!16474) (Cons!16473 (h!17604 tuple2!10630) (t!22883 List!16477)) )
))
(declare-datatypes ((ListLongMap!9389 0))(
  ( (ListLongMap!9390 (toList!4710 List!16477)) )
))
(declare-fun call!37737 () ListLongMap!9389)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26521)

(declare-fun zeroValue!654 () V!26521)

(declare-datatypes ((ValueCell!7613 0))(
  ( (ValueCellFull!7613 (v!10519 V!26521)) (EmptyCell!7613) )
))
(declare-datatypes ((array!48413 0))(
  ( (array!48414 (arr!23238 (Array (_ BitVec 32) ValueCell!7613)) (size!23680 (_ BitVec 32))) )
))
(declare-fun lt!382037 () array!48413)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun bm!37733 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2720 (array!48411 array!48413 (_ BitVec 32) (_ BitVec 32) V!26521 V!26521 (_ BitVec 32) Int) ListLongMap!9389)

(assert (=> bm!37733 (= call!37737 (getCurrentListMapNoExtraKeys!2720 _keys!868 lt!382037 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849188 () Bool)

(declare-fun e!473743 () Bool)

(assert (=> b!849188 (= e!473745 e!473743)))

(declare-fun res!576957 () Bool)

(assert (=> b!849188 (=> (not res!576957) (not e!473743))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!849188 (= res!576957 (= from!1053 i!612))))

(declare-fun lt!382035 () ListLongMap!9389)

(assert (=> b!849188 (= lt!382035 (getCurrentListMapNoExtraKeys!2720 _keys!868 lt!382037 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26521)

(declare-fun _values!688 () array!48413)

(assert (=> b!849188 (= lt!382037 (array!48414 (store (arr!23238 _values!688) i!612 (ValueCellFull!7613 v!557)) (size!23680 _values!688)))))

(declare-fun lt!382036 () ListLongMap!9389)

(assert (=> b!849188 (= lt!382036 (getCurrentListMapNoExtraKeys!2720 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!576949 () Bool)

(assert (=> start!73036 (=> (not res!576949) (not e!473745))))

(assert (=> start!73036 (= res!576949 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23679 _keys!868))))))

(assert (=> start!73036 e!473745))

(declare-fun tp_is_empty!16105 () Bool)

(assert (=> start!73036 tp_is_empty!16105))

(assert (=> start!73036 true))

(assert (=> start!73036 tp!49412))

(declare-fun array_inv!18526 (array!48411) Bool)

(assert (=> start!73036 (array_inv!18526 _keys!868)))

(declare-fun e!473746 () Bool)

(declare-fun array_inv!18527 (array!48413) Bool)

(assert (=> start!73036 (and (array_inv!18527 _values!688) e!473746)))

(declare-fun mapNonEmpty!25757 () Bool)

(declare-fun mapRes!25757 () Bool)

(declare-fun tp!49411 () Bool)

(declare-fun e!473741 () Bool)

(assert (=> mapNonEmpty!25757 (= mapRes!25757 (and tp!49411 e!473741))))

(declare-fun mapValue!25757 () ValueCell!7613)

(declare-fun mapKey!25757 () (_ BitVec 32))

(declare-fun mapRest!25757 () (Array (_ BitVec 32) ValueCell!7613))

(assert (=> mapNonEmpty!25757 (= (arr!23238 _values!688) (store mapRest!25757 mapKey!25757 mapValue!25757))))

(declare-fun mapIsEmpty!25757 () Bool)

(assert (=> mapIsEmpty!25757 mapRes!25757))

(declare-fun b!849189 () Bool)

(declare-fun res!576952 () Bool)

(assert (=> b!849189 (=> (not res!576952) (not e!473745))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!849189 (= res!576952 (and (= (select (arr!23237 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!849190 () Bool)

(declare-fun res!576956 () Bool)

(assert (=> b!849190 (=> (not res!576956) (not e!473745))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!849190 (= res!576956 (validMask!0 mask!1196))))

(declare-fun b!849191 () Bool)

(declare-fun e!473744 () Bool)

(declare-fun call!37736 () ListLongMap!9389)

(assert (=> b!849191 (= e!473744 (= call!37737 call!37736))))

(declare-fun b!849192 () Bool)

(declare-fun e!473748 () Bool)

(assert (=> b!849192 (= e!473748 tp_is_empty!16105)))

(declare-fun b!849193 () Bool)

(declare-fun res!576954 () Bool)

(assert (=> b!849193 (=> (not res!576954) (not e!473745))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48411 (_ BitVec 32)) Bool)

(assert (=> b!849193 (= res!576954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!849194 () Bool)

(declare-fun res!576951 () Bool)

(assert (=> b!849194 (=> (not res!576951) (not e!473745))))

(assert (=> b!849194 (= res!576951 (and (= (size!23680 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23679 _keys!868) (size!23680 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!849195 () Bool)

(declare-fun res!576953 () Bool)

(assert (=> b!849195 (=> (not res!576953) (not e!473745))))

(assert (=> b!849195 (= res!576953 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23679 _keys!868))))))

(declare-fun b!849196 () Bool)

(declare-fun e!473742 () Bool)

(assert (=> b!849196 (= e!473742 true)))

(declare-fun +!2137 (ListLongMap!9389 tuple2!10630) ListLongMap!9389)

(declare-fun get!12239 (ValueCell!7613 V!26521) V!26521)

(declare-fun dynLambda!1002 (Int (_ BitVec 64)) V!26521)

(assert (=> b!849196 (= lt!382035 (+!2137 (getCurrentListMapNoExtraKeys!2720 _keys!868 lt!382037 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10631 (select (arr!23237 _keys!868) from!1053) (get!12239 (select (arr!23238 lt!382037) from!1053) (dynLambda!1002 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!849197 () Bool)

(assert (=> b!849197 (= e!473746 (and e!473748 mapRes!25757))))

(declare-fun condMapEmpty!25757 () Bool)

(declare-fun mapDefault!25757 () ValueCell!7613)

(assert (=> b!849197 (= condMapEmpty!25757 (= (arr!23238 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7613)) mapDefault!25757)))))

(declare-fun b!849198 () Bool)

(assert (=> b!849198 (= e!473744 (= call!37737 (+!2137 call!37736 (tuple2!10631 k0!854 v!557))))))

(declare-fun b!849199 () Bool)

(assert (=> b!849199 (= e!473741 tp_is_empty!16105)))

(declare-fun bm!37734 () Bool)

(assert (=> bm!37734 (= call!37736 (getCurrentListMapNoExtraKeys!2720 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849200 () Bool)

(declare-fun res!576950 () Bool)

(assert (=> b!849200 (=> (not res!576950) (not e!473745))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!849200 (= res!576950 (validKeyInArray!0 k0!854))))

(declare-fun b!849201 () Bool)

(assert (=> b!849201 (= e!473743 (not e!473742))))

(declare-fun res!576955 () Bool)

(assert (=> b!849201 (=> res!576955 e!473742)))

(assert (=> b!849201 (= res!576955 (not (validKeyInArray!0 (select (arr!23237 _keys!868) from!1053))))))

(assert (=> b!849201 e!473744))

(declare-fun c!91559 () Bool)

(assert (=> b!849201 (= c!91559 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28949 0))(
  ( (Unit!28950) )
))
(declare-fun lt!382034 () Unit!28949)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!349 (array!48411 array!48413 (_ BitVec 32) (_ BitVec 32) V!26521 V!26521 (_ BitVec 32) (_ BitVec 64) V!26521 (_ BitVec 32) Int) Unit!28949)

(assert (=> b!849201 (= lt!382034 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!349 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73036 res!576949) b!849190))

(assert (= (and b!849190 res!576956) b!849194))

(assert (= (and b!849194 res!576951) b!849193))

(assert (= (and b!849193 res!576954) b!849187))

(assert (= (and b!849187 res!576948) b!849195))

(assert (= (and b!849195 res!576953) b!849200))

(assert (= (and b!849200 res!576950) b!849189))

(assert (= (and b!849189 res!576952) b!849188))

(assert (= (and b!849188 res!576957) b!849201))

(assert (= (and b!849201 c!91559) b!849198))

(assert (= (and b!849201 (not c!91559)) b!849191))

(assert (= (or b!849198 b!849191) bm!37733))

(assert (= (or b!849198 b!849191) bm!37734))

(assert (= (and b!849201 (not res!576955)) b!849196))

(assert (= (and b!849197 condMapEmpty!25757) mapIsEmpty!25757))

(assert (= (and b!849197 (not condMapEmpty!25757)) mapNonEmpty!25757))

(get-info :version)

(assert (= (and mapNonEmpty!25757 ((_ is ValueCellFull!7613) mapValue!25757)) b!849199))

(assert (= (and b!849197 ((_ is ValueCellFull!7613) mapDefault!25757)) b!849192))

(assert (= start!73036 b!849197))

(declare-fun b_lambda!11483 () Bool)

(assert (=> (not b_lambda!11483) (not b!849196)))

(declare-fun t!22881 () Bool)

(declare-fun tb!4263 () Bool)

(assert (=> (and start!73036 (= defaultEntry!696 defaultEntry!696) t!22881) tb!4263))

(declare-fun result!8145 () Bool)

(assert (=> tb!4263 (= result!8145 tp_is_empty!16105)))

(assert (=> b!849196 t!22881))

(declare-fun b_and!23073 () Bool)

(assert (= b_and!23071 (and (=> t!22881 result!8145) b_and!23073)))

(declare-fun m!789353 () Bool)

(assert (=> b!849193 m!789353))

(declare-fun m!789355 () Bool)

(assert (=> bm!37734 m!789355))

(declare-fun m!789357 () Bool)

(assert (=> start!73036 m!789357))

(declare-fun m!789359 () Bool)

(assert (=> start!73036 m!789359))

(declare-fun m!789361 () Bool)

(assert (=> b!849200 m!789361))

(declare-fun m!789363 () Bool)

(assert (=> b!849190 m!789363))

(declare-fun m!789365 () Bool)

(assert (=> mapNonEmpty!25757 m!789365))

(declare-fun m!789367 () Bool)

(assert (=> b!849198 m!789367))

(declare-fun m!789369 () Bool)

(assert (=> b!849187 m!789369))

(declare-fun m!789371 () Bool)

(assert (=> b!849201 m!789371))

(assert (=> b!849201 m!789371))

(declare-fun m!789373 () Bool)

(assert (=> b!849201 m!789373))

(declare-fun m!789375 () Bool)

(assert (=> b!849201 m!789375))

(declare-fun m!789377 () Bool)

(assert (=> b!849196 m!789377))

(declare-fun m!789379 () Bool)

(assert (=> b!849196 m!789379))

(declare-fun m!789381 () Bool)

(assert (=> b!849196 m!789381))

(declare-fun m!789383 () Bool)

(assert (=> b!849196 m!789383))

(assert (=> b!849196 m!789377))

(assert (=> b!849196 m!789371))

(assert (=> b!849196 m!789379))

(assert (=> b!849196 m!789383))

(declare-fun m!789385 () Bool)

(assert (=> b!849196 m!789385))

(assert (=> bm!37733 m!789383))

(declare-fun m!789387 () Bool)

(assert (=> b!849189 m!789387))

(declare-fun m!789389 () Bool)

(assert (=> b!849188 m!789389))

(declare-fun m!789391 () Bool)

(assert (=> b!849188 m!789391))

(declare-fun m!789393 () Bool)

(assert (=> b!849188 m!789393))

(check-sat (not bm!37734) (not b!849201) (not b_next!13969) (not b!849200) (not b_lambda!11483) (not start!73036) (not b!849198) (not mapNonEmpty!25757) (not bm!37733) (not b!849190) tp_is_empty!16105 b_and!23073 (not b!849187) (not b!849196) (not b!849188) (not b!849193))
(check-sat b_and!23073 (not b_next!13969))
