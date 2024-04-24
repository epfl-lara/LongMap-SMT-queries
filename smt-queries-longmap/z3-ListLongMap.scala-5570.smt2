; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73372 () Bool)

(assert start!73372)

(declare-fun b_free!14119 () Bool)

(declare-fun b_next!14119 () Bool)

(assert (=> start!73372 (= b_free!14119 (not b_next!14119))))

(declare-fun tp!49861 () Bool)

(declare-fun b_and!23407 () Bool)

(assert (=> start!73372 (= tp!49861 b_and!23407)))

(declare-fun b!853854 () Bool)

(declare-fun e!476275 () Bool)

(declare-fun e!476272 () Bool)

(assert (=> b!853854 (= e!476275 e!476272)))

(declare-fun res!579661 () Bool)

(assert (=> b!853854 (=> (not res!579661) (not e!476272))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!853854 (= res!579661 (= from!1053 i!612))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48759 0))(
  ( (array!48760 (arr!23406 (Array (_ BitVec 32) (_ BitVec 64))) (size!23847 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48759)

(declare-datatypes ((V!26721 0))(
  ( (V!26722 (val!8175 Int)) )
))
(declare-datatypes ((ValueCell!7688 0))(
  ( (ValueCellFull!7688 (v!10600 V!26721)) (EmptyCell!7688) )
))
(declare-datatypes ((array!48761 0))(
  ( (array!48762 (arr!23407 (Array (_ BitVec 32) ValueCell!7688)) (size!23848 (_ BitVec 32))) )
))
(declare-fun lt!384790 () array!48761)

(declare-fun minValue!654 () V!26721)

(declare-fun zeroValue!654 () V!26721)

(declare-datatypes ((tuple2!10668 0))(
  ( (tuple2!10669 (_1!5345 (_ BitVec 64)) (_2!5345 V!26721)) )
))
(declare-datatypes ((List!16519 0))(
  ( (Nil!16516) (Cons!16515 (h!17652 tuple2!10668) (t!23076 List!16519)) )
))
(declare-datatypes ((ListLongMap!9439 0))(
  ( (ListLongMap!9440 (toList!4735 List!16519)) )
))
(declare-fun lt!384791 () ListLongMap!9439)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2792 (array!48759 array!48761 (_ BitVec 32) (_ BitVec 32) V!26721 V!26721 (_ BitVec 32) Int) ListLongMap!9439)

(assert (=> b!853854 (= lt!384791 (getCurrentListMapNoExtraKeys!2792 _keys!868 lt!384790 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26721)

(declare-fun _values!688 () array!48761)

(assert (=> b!853854 (= lt!384790 (array!48762 (store (arr!23407 _values!688) i!612 (ValueCellFull!7688 v!557)) (size!23848 _values!688)))))

(declare-fun lt!384789 () ListLongMap!9439)

(assert (=> b!853854 (= lt!384789 (getCurrentListMapNoExtraKeys!2792 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!853855 () Bool)

(declare-fun e!476278 () Bool)

(declare-fun e!476274 () Bool)

(declare-fun mapRes!25982 () Bool)

(assert (=> b!853855 (= e!476278 (and e!476274 mapRes!25982))))

(declare-fun condMapEmpty!25982 () Bool)

(declare-fun mapDefault!25982 () ValueCell!7688)

(assert (=> b!853855 (= condMapEmpty!25982 (= (arr!23407 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7688)) mapDefault!25982)))))

(declare-fun b!853856 () Bool)

(declare-fun res!579654 () Bool)

(assert (=> b!853856 (=> (not res!579654) (not e!476275))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!853856 (= res!579654 (validKeyInArray!0 k0!854))))

(declare-fun b!853857 () Bool)

(declare-fun e!476271 () Bool)

(declare-fun call!38258 () ListLongMap!9439)

(declare-fun call!38257 () ListLongMap!9439)

(assert (=> b!853857 (= e!476271 (= call!38258 call!38257))))

(declare-fun b!853858 () Bool)

(declare-fun res!579652 () Bool)

(assert (=> b!853858 (=> (not res!579652) (not e!476275))))

(declare-datatypes ((List!16520 0))(
  ( (Nil!16517) (Cons!16516 (h!17653 (_ BitVec 64)) (t!23077 List!16520)) )
))
(declare-fun arrayNoDuplicates!0 (array!48759 (_ BitVec 32) List!16520) Bool)

(assert (=> b!853858 (= res!579652 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16517))))

(declare-fun b!853859 () Bool)

(declare-fun +!2180 (ListLongMap!9439 tuple2!10668) ListLongMap!9439)

(assert (=> b!853859 (= e!476271 (= call!38258 (+!2180 call!38257 (tuple2!10669 k0!854 v!557))))))

(declare-fun b!853860 () Bool)

(declare-fun e!476276 () Bool)

(declare-fun tp_is_empty!16255 () Bool)

(assert (=> b!853860 (= e!476276 tp_is_empty!16255)))

(declare-fun bm!38254 () Bool)

(assert (=> bm!38254 (= call!38258 (getCurrentListMapNoExtraKeys!2792 _keys!868 lt!384790 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853861 () Bool)

(declare-fun e!476273 () Bool)

(assert (=> b!853861 (= e!476273 true)))

(declare-fun lt!384792 () V!26721)

(declare-fun lt!384785 () ListLongMap!9439)

(declare-fun lt!384793 () tuple2!10668)

(assert (=> b!853861 (= (+!2180 lt!384785 lt!384793) (+!2180 (+!2180 lt!384785 (tuple2!10669 k0!854 lt!384792)) lt!384793))))

(declare-fun lt!384788 () V!26721)

(assert (=> b!853861 (= lt!384793 (tuple2!10669 k0!854 lt!384788))))

(declare-datatypes ((Unit!29120 0))(
  ( (Unit!29121) )
))
(declare-fun lt!384786 () Unit!29120)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!307 (ListLongMap!9439 (_ BitVec 64) V!26721 V!26721) Unit!29120)

(assert (=> b!853861 (= lt!384786 (addSameAsAddTwiceSameKeyDiffValues!307 lt!384785 k0!854 lt!384792 lt!384788))))

(declare-fun lt!384794 () V!26721)

(declare-fun get!12344 (ValueCell!7688 V!26721) V!26721)

(assert (=> b!853861 (= lt!384792 (get!12344 (select (arr!23407 _values!688) from!1053) lt!384794))))

(assert (=> b!853861 (= lt!384791 (+!2180 lt!384785 (tuple2!10669 (select (arr!23406 _keys!868) from!1053) lt!384788)))))

(assert (=> b!853861 (= lt!384788 (get!12344 (select (store (arr!23407 _values!688) i!612 (ValueCellFull!7688 v!557)) from!1053) lt!384794))))

(declare-fun dynLambda!1054 (Int (_ BitVec 64)) V!26721)

(assert (=> b!853861 (= lt!384794 (dynLambda!1054 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!853861 (= lt!384785 (getCurrentListMapNoExtraKeys!2792 _keys!868 lt!384790 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853863 () Bool)

(declare-fun res!579658 () Bool)

(assert (=> b!853863 (=> (not res!579658) (not e!476275))))

(assert (=> b!853863 (= res!579658 (and (= (size!23848 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23847 _keys!868) (size!23848 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!38255 () Bool)

(assert (=> bm!38255 (= call!38257 (getCurrentListMapNoExtraKeys!2792 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853864 () Bool)

(assert (=> b!853864 (= e!476274 tp_is_empty!16255)))

(declare-fun b!853865 () Bool)

(declare-fun res!579653 () Bool)

(assert (=> b!853865 (=> (not res!579653) (not e!476275))))

(assert (=> b!853865 (= res!579653 (and (= (select (arr!23406 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!853866 () Bool)

(declare-fun res!579659 () Bool)

(assert (=> b!853866 (=> (not res!579659) (not e!476275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853866 (= res!579659 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25982 () Bool)

(assert (=> mapIsEmpty!25982 mapRes!25982))

(declare-fun b!853867 () Bool)

(assert (=> b!853867 (= e!476272 (not e!476273))))

(declare-fun res!579660 () Bool)

(assert (=> b!853867 (=> res!579660 e!476273)))

(assert (=> b!853867 (= res!579660 (not (validKeyInArray!0 (select (arr!23406 _keys!868) from!1053))))))

(assert (=> b!853867 e!476271))

(declare-fun c!92131 () Bool)

(assert (=> b!853867 (= c!92131 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!384787 () Unit!29120)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!385 (array!48759 array!48761 (_ BitVec 32) (_ BitVec 32) V!26721 V!26721 (_ BitVec 32) (_ BitVec 64) V!26721 (_ BitVec 32) Int) Unit!29120)

(assert (=> b!853867 (= lt!384787 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!385 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853868 () Bool)

(declare-fun res!579657 () Bool)

(assert (=> b!853868 (=> (not res!579657) (not e!476275))))

(assert (=> b!853868 (= res!579657 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23847 _keys!868))))))

(declare-fun mapNonEmpty!25982 () Bool)

(declare-fun tp!49862 () Bool)

(assert (=> mapNonEmpty!25982 (= mapRes!25982 (and tp!49862 e!476276))))

(declare-fun mapKey!25982 () (_ BitVec 32))

(declare-fun mapRest!25982 () (Array (_ BitVec 32) ValueCell!7688))

(declare-fun mapValue!25982 () ValueCell!7688)

(assert (=> mapNonEmpty!25982 (= (arr!23407 _values!688) (store mapRest!25982 mapKey!25982 mapValue!25982))))

(declare-fun b!853862 () Bool)

(declare-fun res!579655 () Bool)

(assert (=> b!853862 (=> (not res!579655) (not e!476275))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48759 (_ BitVec 32)) Bool)

(assert (=> b!853862 (= res!579655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!579656 () Bool)

(assert (=> start!73372 (=> (not res!579656) (not e!476275))))

(assert (=> start!73372 (= res!579656 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23847 _keys!868))))))

(assert (=> start!73372 e!476275))

(assert (=> start!73372 tp_is_empty!16255))

(assert (=> start!73372 true))

(assert (=> start!73372 tp!49861))

(declare-fun array_inv!18614 (array!48759) Bool)

(assert (=> start!73372 (array_inv!18614 _keys!868)))

(declare-fun array_inv!18615 (array!48761) Bool)

(assert (=> start!73372 (and (array_inv!18615 _values!688) e!476278)))

(assert (= (and start!73372 res!579656) b!853866))

(assert (= (and b!853866 res!579659) b!853863))

(assert (= (and b!853863 res!579658) b!853862))

(assert (= (and b!853862 res!579655) b!853858))

(assert (= (and b!853858 res!579652) b!853868))

(assert (= (and b!853868 res!579657) b!853856))

(assert (= (and b!853856 res!579654) b!853865))

(assert (= (and b!853865 res!579653) b!853854))

(assert (= (and b!853854 res!579661) b!853867))

(assert (= (and b!853867 c!92131) b!853859))

(assert (= (and b!853867 (not c!92131)) b!853857))

(assert (= (or b!853859 b!853857) bm!38254))

(assert (= (or b!853859 b!853857) bm!38255))

(assert (= (and b!853867 (not res!579660)) b!853861))

(assert (= (and b!853855 condMapEmpty!25982) mapIsEmpty!25982))

(assert (= (and b!853855 (not condMapEmpty!25982)) mapNonEmpty!25982))

(get-info :version)

(assert (= (and mapNonEmpty!25982 ((_ is ValueCellFull!7688) mapValue!25982)) b!853860))

(assert (= (and b!853855 ((_ is ValueCellFull!7688) mapDefault!25982)) b!853864))

(assert (= start!73372 b!853855))

(declare-fun b_lambda!11665 () Bool)

(assert (=> (not b_lambda!11665) (not b!853861)))

(declare-fun t!23075 () Bool)

(declare-fun tb!4413 () Bool)

(assert (=> (and start!73372 (= defaultEntry!696 defaultEntry!696) t!23075) tb!4413))

(declare-fun result!8445 () Bool)

(assert (=> tb!4413 (= result!8445 tp_is_empty!16255)))

(assert (=> b!853861 t!23075))

(declare-fun b_and!23409 () Bool)

(assert (= b_and!23407 (and (=> t!23075 result!8445) b_and!23409)))

(declare-fun m!795379 () Bool)

(assert (=> bm!38254 m!795379))

(declare-fun m!795381 () Bool)

(assert (=> b!853866 m!795381))

(declare-fun m!795383 () Bool)

(assert (=> b!853865 m!795383))

(declare-fun m!795385 () Bool)

(assert (=> b!853859 m!795385))

(declare-fun m!795387 () Bool)

(assert (=> bm!38255 m!795387))

(declare-fun m!795389 () Bool)

(assert (=> b!853854 m!795389))

(declare-fun m!795391 () Bool)

(assert (=> b!853854 m!795391))

(declare-fun m!795393 () Bool)

(assert (=> b!853854 m!795393))

(assert (=> b!853861 m!795379))

(declare-fun m!795395 () Bool)

(assert (=> b!853861 m!795395))

(declare-fun m!795397 () Bool)

(assert (=> b!853861 m!795397))

(declare-fun m!795399 () Bool)

(assert (=> b!853861 m!795399))

(declare-fun m!795401 () Bool)

(assert (=> b!853861 m!795401))

(declare-fun m!795403 () Bool)

(assert (=> b!853861 m!795403))

(declare-fun m!795405 () Bool)

(assert (=> b!853861 m!795405))

(assert (=> b!853861 m!795391))

(declare-fun m!795407 () Bool)

(assert (=> b!853861 m!795407))

(assert (=> b!853861 m!795405))

(declare-fun m!795409 () Bool)

(assert (=> b!853861 m!795409))

(assert (=> b!853861 m!795401))

(declare-fun m!795411 () Bool)

(assert (=> b!853861 m!795411))

(declare-fun m!795413 () Bool)

(assert (=> b!853861 m!795413))

(declare-fun m!795415 () Bool)

(assert (=> b!853861 m!795415))

(assert (=> b!853861 m!795395))

(declare-fun m!795417 () Bool)

(assert (=> b!853856 m!795417))

(declare-fun m!795419 () Bool)

(assert (=> b!853862 m!795419))

(assert (=> b!853867 m!795411))

(assert (=> b!853867 m!795411))

(declare-fun m!795421 () Bool)

(assert (=> b!853867 m!795421))

(declare-fun m!795423 () Bool)

(assert (=> b!853867 m!795423))

(declare-fun m!795425 () Bool)

(assert (=> b!853858 m!795425))

(declare-fun m!795427 () Bool)

(assert (=> mapNonEmpty!25982 m!795427))

(declare-fun m!795429 () Bool)

(assert (=> start!73372 m!795429))

(declare-fun m!795431 () Bool)

(assert (=> start!73372 m!795431))

(check-sat (not b!853854) (not b!853861) (not b_lambda!11665) (not b!853859) (not b!853866) (not bm!38255) (not mapNonEmpty!25982) b_and!23409 (not b_next!14119) (not b!853867) tp_is_empty!16255 (not start!73372) (not b!853858) (not bm!38254) (not b!853862) (not b!853856))
(check-sat b_and!23409 (not b_next!14119))
