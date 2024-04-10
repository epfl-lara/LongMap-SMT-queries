; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73086 () Bool)

(assert start!73086)

(declare-fun b_free!14001 () Bool)

(declare-fun b_next!14001 () Bool)

(assert (=> start!73086 (= b_free!14001 (not b_next!14001))))

(declare-fun tp!49506 () Bool)

(declare-fun b_and!23161 () Bool)

(assert (=> start!73086 (= tp!49506 b_and!23161)))

(declare-fun b!850178 () Bool)

(declare-fun e!474278 () Bool)

(assert (=> b!850178 (= e!474278 true)))

(declare-datatypes ((V!26563 0))(
  ( (V!26564 (val!8116 Int)) )
))
(declare-datatypes ((tuple2!10634 0))(
  ( (tuple2!10635 (_1!5328 (_ BitVec 64)) (_2!5328 V!26563)) )
))
(declare-fun lt!382662 () tuple2!10634)

(declare-datatypes ((List!16479 0))(
  ( (Nil!16476) (Cons!16475 (h!17606 tuple2!10634) (t!22926 List!16479)) )
))
(declare-datatypes ((ListLongMap!9403 0))(
  ( (ListLongMap!9404 (toList!4717 List!16479)) )
))
(declare-fun lt!382659 () ListLongMap!9403)

(declare-fun lt!382654 () V!26563)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2119 (ListLongMap!9403 tuple2!10634) ListLongMap!9403)

(assert (=> b!850178 (= (+!2119 lt!382659 lt!382662) (+!2119 (+!2119 lt!382659 (tuple2!10635 k0!854 lt!382654)) lt!382662))))

(declare-fun lt!382661 () V!26563)

(assert (=> b!850178 (= lt!382662 (tuple2!10635 k0!854 lt!382661))))

(declare-datatypes ((Unit!29029 0))(
  ( (Unit!29030) )
))
(declare-fun lt!382656 () Unit!29029)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!256 (ListLongMap!9403 (_ BitVec 64) V!26563 V!26563) Unit!29029)

(assert (=> b!850178 (= lt!382656 (addSameAsAddTwiceSameKeyDiffValues!256 lt!382659 k0!854 lt!382654 lt!382661))))

(declare-fun lt!382657 () V!26563)

(declare-datatypes ((ValueCell!7629 0))(
  ( (ValueCellFull!7629 (v!10541 V!26563)) (EmptyCell!7629) )
))
(declare-datatypes ((array!48478 0))(
  ( (array!48479 (arr!23270 (Array (_ BitVec 32) ValueCell!7629)) (size!23710 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48478)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun get!12254 (ValueCell!7629 V!26563) V!26563)

(assert (=> b!850178 (= lt!382654 (get!12254 (select (arr!23270 _values!688) from!1053) lt!382657))))

(declare-fun lt!382658 () ListLongMap!9403)

(declare-datatypes ((array!48480 0))(
  ( (array!48481 (arr!23271 (Array (_ BitVec 32) (_ BitVec 64))) (size!23711 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48480)

(assert (=> b!850178 (= lt!382658 (+!2119 lt!382659 (tuple2!10635 (select (arr!23271 _keys!868) from!1053) lt!382661)))))

(declare-fun v!557 () V!26563)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!850178 (= lt!382661 (get!12254 (select (store (arr!23270 _values!688) i!612 (ValueCellFull!7629 v!557)) from!1053) lt!382657))))

(declare-fun defaultEntry!696 () Int)

(declare-fun dynLambda!1010 (Int (_ BitVec 64)) V!26563)

(assert (=> b!850178 (= lt!382657 (dynLambda!1010 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!26563)

(declare-fun zeroValue!654 () V!26563)

(declare-fun lt!382663 () array!48478)

(declare-fun getCurrentListMapNoExtraKeys!2699 (array!48480 array!48478 (_ BitVec 32) (_ BitVec 32) V!26563 V!26563 (_ BitVec 32) Int) ListLongMap!9403)

(assert (=> b!850178 (= lt!382659 (getCurrentListMapNoExtraKeys!2699 _keys!868 lt!382663 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850179 () Bool)

(declare-fun res!577546 () Bool)

(declare-fun e!474275 () Bool)

(assert (=> b!850179 (=> (not res!577546) (not e!474275))))

(assert (=> b!850179 (= res!577546 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23711 _keys!868))))))

(declare-fun b!850180 () Bool)

(declare-fun e!474277 () Bool)

(assert (=> b!850180 (= e!474277 (not e!474278))))

(declare-fun res!577545 () Bool)

(assert (=> b!850180 (=> res!577545 e!474278)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850180 (= res!577545 (not (validKeyInArray!0 (select (arr!23271 _keys!868) from!1053))))))

(declare-fun e!474276 () Bool)

(assert (=> b!850180 e!474276))

(declare-fun c!91672 () Bool)

(assert (=> b!850180 (= c!91672 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!382655 () Unit!29029)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!358 (array!48480 array!48478 (_ BitVec 32) (_ BitVec 32) V!26563 V!26563 (_ BitVec 32) (_ BitVec 64) V!26563 (_ BitVec 32) Int) Unit!29029)

(assert (=> b!850180 (= lt!382655 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!358 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850181 () Bool)

(declare-fun e!474274 () Bool)

(declare-fun tp_is_empty!16137 () Bool)

(assert (=> b!850181 (= e!474274 tp_is_empty!16137)))

(declare-fun b!850182 () Bool)

(declare-fun call!37858 () ListLongMap!9403)

(declare-fun call!37859 () ListLongMap!9403)

(assert (=> b!850182 (= e!474276 (= call!37858 call!37859))))

(declare-fun b!850183 () Bool)

(declare-fun e!474280 () Bool)

(declare-fun mapRes!25805 () Bool)

(assert (=> b!850183 (= e!474280 (and e!474274 mapRes!25805))))

(declare-fun condMapEmpty!25805 () Bool)

(declare-fun mapDefault!25805 () ValueCell!7629)

(assert (=> b!850183 (= condMapEmpty!25805 (= (arr!23270 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7629)) mapDefault!25805)))))

(declare-fun b!850184 () Bool)

(declare-fun e!474273 () Bool)

(assert (=> b!850184 (= e!474273 tp_is_empty!16137)))

(declare-fun mapIsEmpty!25805 () Bool)

(assert (=> mapIsEmpty!25805 mapRes!25805))

(declare-fun res!577538 () Bool)

(assert (=> start!73086 (=> (not res!577538) (not e!474275))))

(assert (=> start!73086 (= res!577538 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23711 _keys!868))))))

(assert (=> start!73086 e!474275))

(assert (=> start!73086 tp_is_empty!16137))

(assert (=> start!73086 true))

(assert (=> start!73086 tp!49506))

(declare-fun array_inv!18466 (array!48480) Bool)

(assert (=> start!73086 (array_inv!18466 _keys!868)))

(declare-fun array_inv!18467 (array!48478) Bool)

(assert (=> start!73086 (and (array_inv!18467 _values!688) e!474280)))

(declare-fun b!850185 () Bool)

(declare-fun res!577544 () Bool)

(assert (=> b!850185 (=> (not res!577544) (not e!474275))))

(assert (=> b!850185 (= res!577544 (validKeyInArray!0 k0!854))))

(declare-fun bm!37855 () Bool)

(assert (=> bm!37855 (= call!37858 (getCurrentListMapNoExtraKeys!2699 _keys!868 lt!382663 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850186 () Bool)

(assert (=> b!850186 (= e!474276 (= call!37858 (+!2119 call!37859 (tuple2!10635 k0!854 v!557))))))

(declare-fun bm!37856 () Bool)

(assert (=> bm!37856 (= call!37859 (getCurrentListMapNoExtraKeys!2699 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850187 () Bool)

(declare-fun res!577539 () Bool)

(assert (=> b!850187 (=> (not res!577539) (not e!474275))))

(declare-datatypes ((List!16480 0))(
  ( (Nil!16477) (Cons!16476 (h!17607 (_ BitVec 64)) (t!22927 List!16480)) )
))
(declare-fun arrayNoDuplicates!0 (array!48480 (_ BitVec 32) List!16480) Bool)

(assert (=> b!850187 (= res!577539 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16477))))

(declare-fun b!850188 () Bool)

(declare-fun res!577541 () Bool)

(assert (=> b!850188 (=> (not res!577541) (not e!474275))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48480 (_ BitVec 32)) Bool)

(assert (=> b!850188 (= res!577541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!850189 () Bool)

(declare-fun res!577547 () Bool)

(assert (=> b!850189 (=> (not res!577547) (not e!474275))))

(assert (=> b!850189 (= res!577547 (and (= (size!23710 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23711 _keys!868) (size!23710 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!850190 () Bool)

(declare-fun res!577543 () Bool)

(assert (=> b!850190 (=> (not res!577543) (not e!474275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!850190 (= res!577543 (validMask!0 mask!1196))))

(declare-fun b!850191 () Bool)

(declare-fun res!577540 () Bool)

(assert (=> b!850191 (=> (not res!577540) (not e!474275))))

(assert (=> b!850191 (= res!577540 (and (= (select (arr!23271 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!850192 () Bool)

(assert (=> b!850192 (= e!474275 e!474277)))

(declare-fun res!577542 () Bool)

(assert (=> b!850192 (=> (not res!577542) (not e!474277))))

(assert (=> b!850192 (= res!577542 (= from!1053 i!612))))

(assert (=> b!850192 (= lt!382658 (getCurrentListMapNoExtraKeys!2699 _keys!868 lt!382663 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!850192 (= lt!382663 (array!48479 (store (arr!23270 _values!688) i!612 (ValueCellFull!7629 v!557)) (size!23710 _values!688)))))

(declare-fun lt!382660 () ListLongMap!9403)

(assert (=> b!850192 (= lt!382660 (getCurrentListMapNoExtraKeys!2699 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!25805 () Bool)

(declare-fun tp!49507 () Bool)

(assert (=> mapNonEmpty!25805 (= mapRes!25805 (and tp!49507 e!474273))))

(declare-fun mapRest!25805 () (Array (_ BitVec 32) ValueCell!7629))

(declare-fun mapValue!25805 () ValueCell!7629)

(declare-fun mapKey!25805 () (_ BitVec 32))

(assert (=> mapNonEmpty!25805 (= (arr!23270 _values!688) (store mapRest!25805 mapKey!25805 mapValue!25805))))

(assert (= (and start!73086 res!577538) b!850190))

(assert (= (and b!850190 res!577543) b!850189))

(assert (= (and b!850189 res!577547) b!850188))

(assert (= (and b!850188 res!577541) b!850187))

(assert (= (and b!850187 res!577539) b!850179))

(assert (= (and b!850179 res!577546) b!850185))

(assert (= (and b!850185 res!577544) b!850191))

(assert (= (and b!850191 res!577540) b!850192))

(assert (= (and b!850192 res!577542) b!850180))

(assert (= (and b!850180 c!91672) b!850186))

(assert (= (and b!850180 (not c!91672)) b!850182))

(assert (= (or b!850186 b!850182) bm!37855))

(assert (= (or b!850186 b!850182) bm!37856))

(assert (= (and b!850180 (not res!577545)) b!850178))

(assert (= (and b!850183 condMapEmpty!25805) mapIsEmpty!25805))

(assert (= (and b!850183 (not condMapEmpty!25805)) mapNonEmpty!25805))

(get-info :version)

(assert (= (and mapNonEmpty!25805 ((_ is ValueCellFull!7629) mapValue!25805)) b!850184))

(assert (= (and b!850183 ((_ is ValueCellFull!7629) mapDefault!25805)) b!850181))

(assert (= start!73086 b!850183))

(declare-fun b_lambda!11533 () Bool)

(assert (=> (not b_lambda!11533) (not b!850178)))

(declare-fun t!22925 () Bool)

(declare-fun tb!4303 () Bool)

(assert (=> (and start!73086 (= defaultEntry!696 defaultEntry!696) t!22925) tb!4303))

(declare-fun result!8217 () Bool)

(assert (=> tb!4303 (= result!8217 tp_is_empty!16137)))

(assert (=> b!850178 t!22925))

(declare-fun b_and!23163 () Bool)

(assert (= b_and!23161 (and (=> t!22925 result!8217) b_and!23163)))

(declare-fun m!790899 () Bool)

(assert (=> bm!37855 m!790899))

(declare-fun m!790901 () Bool)

(assert (=> b!850188 m!790901))

(declare-fun m!790903 () Bool)

(assert (=> mapNonEmpty!25805 m!790903))

(declare-fun m!790905 () Bool)

(assert (=> b!850185 m!790905))

(declare-fun m!790907 () Bool)

(assert (=> bm!37856 m!790907))

(declare-fun m!790909 () Bool)

(assert (=> start!73086 m!790909))

(declare-fun m!790911 () Bool)

(assert (=> start!73086 m!790911))

(declare-fun m!790913 () Bool)

(assert (=> b!850191 m!790913))

(declare-fun m!790915 () Bool)

(assert (=> b!850190 m!790915))

(declare-fun m!790917 () Bool)

(assert (=> b!850178 m!790917))

(declare-fun m!790919 () Bool)

(assert (=> b!850178 m!790919))

(declare-fun m!790921 () Bool)

(assert (=> b!850178 m!790921))

(declare-fun m!790923 () Bool)

(assert (=> b!850178 m!790923))

(assert (=> b!850178 m!790899))

(declare-fun m!790925 () Bool)

(assert (=> b!850178 m!790925))

(declare-fun m!790927 () Bool)

(assert (=> b!850178 m!790927))

(declare-fun m!790929 () Bool)

(assert (=> b!850178 m!790929))

(assert (=> b!850178 m!790921))

(declare-fun m!790931 () Bool)

(assert (=> b!850178 m!790931))

(assert (=> b!850178 m!790923))

(declare-fun m!790933 () Bool)

(assert (=> b!850178 m!790933))

(assert (=> b!850178 m!790927))

(declare-fun m!790935 () Bool)

(assert (=> b!850178 m!790935))

(declare-fun m!790937 () Bool)

(assert (=> b!850178 m!790937))

(declare-fun m!790939 () Bool)

(assert (=> b!850178 m!790939))

(declare-fun m!790941 () Bool)

(assert (=> b!850186 m!790941))

(assert (=> b!850180 m!790937))

(assert (=> b!850180 m!790937))

(declare-fun m!790943 () Bool)

(assert (=> b!850180 m!790943))

(declare-fun m!790945 () Bool)

(assert (=> b!850180 m!790945))

(declare-fun m!790947 () Bool)

(assert (=> b!850192 m!790947))

(assert (=> b!850192 m!790929))

(declare-fun m!790949 () Bool)

(assert (=> b!850192 m!790949))

(declare-fun m!790951 () Bool)

(assert (=> b!850187 m!790951))

(check-sat (not mapNonEmpty!25805) (not bm!37856) (not b!850185) tp_is_empty!16137 (not bm!37855) (not b!850186) (not b!850187) (not b!850180) (not b!850188) (not b!850192) (not start!73086) (not b_lambda!11533) (not b!850190) (not b!850178) (not b_next!14001) b_and!23163)
(check-sat b_and!23163 (not b_next!14001))
