; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73216 () Bool)

(assert start!73216)

(declare-fun b_free!14149 () Bool)

(declare-fun b_next!14149 () Bool)

(assert (=> start!73216 (= b_free!14149 (not b_next!14149))))

(declare-fun tp!49952 () Bool)

(declare-fun b_and!23431 () Bool)

(assert (=> start!73216 (= tp!49952 b_and!23431)))

(declare-fun b!853417 () Bool)

(declare-fun res!579655 () Bool)

(declare-fun e!475906 () Bool)

(assert (=> b!853417 (=> (not res!579655) (not e!475906))))

(declare-datatypes ((array!48753 0))(
  ( (array!48754 (arr!23408 (Array (_ BitVec 32) (_ BitVec 64))) (size!23850 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48753)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48753 (_ BitVec 32)) Bool)

(assert (=> b!853417 (= res!579655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!853418 () Bool)

(declare-fun e!475904 () Bool)

(assert (=> b!853418 (= e!475904 true)))

(declare-datatypes ((V!26761 0))(
  ( (V!26762 (val!8190 Int)) )
))
(declare-datatypes ((tuple2!10786 0))(
  ( (tuple2!10787 (_1!5404 (_ BitVec 64)) (_2!5404 V!26761)) )
))
(declare-fun lt!384642 () tuple2!10786)

(declare-fun lt!384645 () V!26761)

(declare-datatypes ((List!16608 0))(
  ( (Nil!16605) (Cons!16604 (h!17735 tuple2!10786) (t!23194 List!16608)) )
))
(declare-datatypes ((ListLongMap!9545 0))(
  ( (ListLongMap!9546 (toList!4788 List!16608)) )
))
(declare-fun lt!384644 () ListLongMap!9545)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2200 (ListLongMap!9545 tuple2!10786) ListLongMap!9545)

(assert (=> b!853418 (= (+!2200 lt!384644 lt!384642) (+!2200 (+!2200 lt!384644 (tuple2!10787 k0!854 lt!384645)) lt!384642))))

(declare-fun lt!384640 () V!26761)

(assert (=> b!853418 (= lt!384642 (tuple2!10787 k0!854 lt!384640))))

(declare-datatypes ((Unit!29071 0))(
  ( (Unit!29072) )
))
(declare-fun lt!384643 () Unit!29071)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!308 (ListLongMap!9545 (_ BitVec 64) V!26761 V!26761) Unit!29071)

(assert (=> b!853418 (= lt!384643 (addSameAsAddTwiceSameKeyDiffValues!308 lt!384644 k0!854 lt!384645 lt!384640))))

(declare-fun lt!384641 () V!26761)

(declare-datatypes ((ValueCell!7703 0))(
  ( (ValueCellFull!7703 (v!10609 V!26761)) (EmptyCell!7703) )
))
(declare-datatypes ((array!48755 0))(
  ( (array!48756 (arr!23409 (Array (_ BitVec 32) ValueCell!7703)) (size!23851 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48755)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun get!12355 (ValueCell!7703 V!26761) V!26761)

(assert (=> b!853418 (= lt!384645 (get!12355 (select (arr!23409 _values!688) from!1053) lt!384641))))

(declare-fun lt!384638 () ListLongMap!9545)

(assert (=> b!853418 (= lt!384638 (+!2200 lt!384644 (tuple2!10787 (select (arr!23408 _keys!868) from!1053) lt!384640)))))

(declare-fun v!557 () V!26761)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!853418 (= lt!384640 (get!12355 (select (store (arr!23409 _values!688) i!612 (ValueCellFull!7703 v!557)) from!1053) lt!384641))))

(declare-fun defaultEntry!696 () Int)

(declare-fun dynLambda!1058 (Int (_ BitVec 64)) V!26761)

(assert (=> b!853418 (= lt!384641 (dynLambda!1058 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!384639 () array!48755)

(declare-fun minValue!654 () V!26761)

(declare-fun zeroValue!654 () V!26761)

(declare-fun getCurrentListMapNoExtraKeys!2796 (array!48753 array!48755 (_ BitVec 32) (_ BitVec 32) V!26761 V!26761 (_ BitVec 32) Int) ListLongMap!9545)

(assert (=> b!853418 (= lt!384644 (getCurrentListMapNoExtraKeys!2796 _keys!868 lt!384639 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853419 () Bool)

(declare-fun e!475902 () Bool)

(assert (=> b!853419 (= e!475906 e!475902)))

(declare-fun res!579648 () Bool)

(assert (=> b!853419 (=> (not res!579648) (not e!475902))))

(assert (=> b!853419 (= res!579648 (= from!1053 i!612))))

(assert (=> b!853419 (= lt!384638 (getCurrentListMapNoExtraKeys!2796 _keys!868 lt!384639 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!853419 (= lt!384639 (array!48756 (store (arr!23409 _values!688) i!612 (ValueCellFull!7703 v!557)) (size!23851 _values!688)))))

(declare-fun lt!384647 () ListLongMap!9545)

(assert (=> b!853419 (= lt!384647 (getCurrentListMapNoExtraKeys!2796 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!853420 () Bool)

(declare-fun res!579649 () Bool)

(assert (=> b!853420 (=> (not res!579649) (not e!475906))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853420 (= res!579649 (validMask!0 mask!1196))))

(declare-fun b!853421 () Bool)

(declare-fun e!475908 () Bool)

(declare-fun call!38276 () ListLongMap!9545)

(declare-fun call!38277 () ListLongMap!9545)

(assert (=> b!853421 (= e!475908 (= call!38276 (+!2200 call!38277 (tuple2!10787 k0!854 v!557))))))

(declare-fun b!853422 () Bool)

(declare-fun res!579657 () Bool)

(assert (=> b!853422 (=> (not res!579657) (not e!475906))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!853422 (= res!579657 (validKeyInArray!0 k0!854))))

(declare-fun b!853423 () Bool)

(declare-fun res!579650 () Bool)

(assert (=> b!853423 (=> (not res!579650) (not e!475906))))

(declare-datatypes ((List!16609 0))(
  ( (Nil!16606) (Cons!16605 (h!17736 (_ BitVec 64)) (t!23195 List!16609)) )
))
(declare-fun arrayNoDuplicates!0 (array!48753 (_ BitVec 32) List!16609) Bool)

(assert (=> b!853423 (= res!579650 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16606))))

(declare-fun b!853424 () Bool)

(declare-fun e!475903 () Bool)

(declare-fun e!475901 () Bool)

(declare-fun mapRes!26027 () Bool)

(assert (=> b!853424 (= e!475903 (and e!475901 mapRes!26027))))

(declare-fun condMapEmpty!26027 () Bool)

(declare-fun mapDefault!26027 () ValueCell!7703)

(assert (=> b!853424 (= condMapEmpty!26027 (= (arr!23409 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7703)) mapDefault!26027)))))

(declare-fun b!853425 () Bool)

(declare-fun res!579654 () Bool)

(assert (=> b!853425 (=> (not res!579654) (not e!475906))))

(assert (=> b!853425 (= res!579654 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23850 _keys!868))))))

(declare-fun b!853426 () Bool)

(declare-fun res!579651 () Bool)

(assert (=> b!853426 (=> (not res!579651) (not e!475906))))

(assert (=> b!853426 (= res!579651 (and (= (size!23851 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23850 _keys!868) (size!23851 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!26027 () Bool)

(declare-fun tp!49951 () Bool)

(declare-fun e!475905 () Bool)

(assert (=> mapNonEmpty!26027 (= mapRes!26027 (and tp!49951 e!475905))))

(declare-fun mapRest!26027 () (Array (_ BitVec 32) ValueCell!7703))

(declare-fun mapValue!26027 () ValueCell!7703)

(declare-fun mapKey!26027 () (_ BitVec 32))

(assert (=> mapNonEmpty!26027 (= (arr!23409 _values!688) (store mapRest!26027 mapKey!26027 mapValue!26027))))

(declare-fun b!853427 () Bool)

(assert (=> b!853427 (= e!475902 (not e!475904))))

(declare-fun res!579653 () Bool)

(assert (=> b!853427 (=> res!579653 e!475904)))

(assert (=> b!853427 (= res!579653 (not (validKeyInArray!0 (select (arr!23408 _keys!868) from!1053))))))

(assert (=> b!853427 e!475908))

(declare-fun c!91829 () Bool)

(assert (=> b!853427 (= c!91829 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!384646 () Unit!29071)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!402 (array!48753 array!48755 (_ BitVec 32) (_ BitVec 32) V!26761 V!26761 (_ BitVec 32) (_ BitVec 64) V!26761 (_ BitVec 32) Int) Unit!29071)

(assert (=> b!853427 (= lt!384646 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!402 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!26027 () Bool)

(assert (=> mapIsEmpty!26027 mapRes!26027))

(declare-fun b!853428 () Bool)

(declare-fun tp_is_empty!16285 () Bool)

(assert (=> b!853428 (= e!475901 tp_is_empty!16285)))

(declare-fun res!579652 () Bool)

(assert (=> start!73216 (=> (not res!579652) (not e!475906))))

(assert (=> start!73216 (= res!579652 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23850 _keys!868))))))

(assert (=> start!73216 e!475906))

(assert (=> start!73216 tp_is_empty!16285))

(assert (=> start!73216 true))

(assert (=> start!73216 tp!49952))

(declare-fun array_inv!18640 (array!48753) Bool)

(assert (=> start!73216 (array_inv!18640 _keys!868)))

(declare-fun array_inv!18641 (array!48755) Bool)

(assert (=> start!73216 (and (array_inv!18641 _values!688) e!475903)))

(declare-fun bm!38273 () Bool)

(assert (=> bm!38273 (= call!38277 (getCurrentListMapNoExtraKeys!2796 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853429 () Bool)

(assert (=> b!853429 (= e!475908 (= call!38276 call!38277))))

(declare-fun b!853430 () Bool)

(assert (=> b!853430 (= e!475905 tp_is_empty!16285)))

(declare-fun bm!38274 () Bool)

(assert (=> bm!38274 (= call!38276 (getCurrentListMapNoExtraKeys!2796 _keys!868 lt!384639 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853431 () Bool)

(declare-fun res!579656 () Bool)

(assert (=> b!853431 (=> (not res!579656) (not e!475906))))

(assert (=> b!853431 (= res!579656 (and (= (select (arr!23408 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73216 res!579652) b!853420))

(assert (= (and b!853420 res!579649) b!853426))

(assert (= (and b!853426 res!579651) b!853417))

(assert (= (and b!853417 res!579655) b!853423))

(assert (= (and b!853423 res!579650) b!853425))

(assert (= (and b!853425 res!579654) b!853422))

(assert (= (and b!853422 res!579657) b!853431))

(assert (= (and b!853431 res!579656) b!853419))

(assert (= (and b!853419 res!579648) b!853427))

(assert (= (and b!853427 c!91829) b!853421))

(assert (= (and b!853427 (not c!91829)) b!853429))

(assert (= (or b!853421 b!853429) bm!38274))

(assert (= (or b!853421 b!853429) bm!38273))

(assert (= (and b!853427 (not res!579653)) b!853418))

(assert (= (and b!853424 condMapEmpty!26027) mapIsEmpty!26027))

(assert (= (and b!853424 (not condMapEmpty!26027)) mapNonEmpty!26027))

(get-info :version)

(assert (= (and mapNonEmpty!26027 ((_ is ValueCellFull!7703) mapValue!26027)) b!853430))

(assert (= (and b!853424 ((_ is ValueCellFull!7703) mapDefault!26027)) b!853428))

(assert (= start!73216 b!853424))

(declare-fun b_lambda!11663 () Bool)

(assert (=> (not b_lambda!11663) (not b!853418)))

(declare-fun t!23193 () Bool)

(declare-fun tb!4443 () Bool)

(assert (=> (and start!73216 (= defaultEntry!696 defaultEntry!696) t!23193) tb!4443))

(declare-fun result!8505 () Bool)

(assert (=> tb!4443 (= result!8505 tp_is_empty!16285)))

(assert (=> b!853418 t!23193))

(declare-fun b_and!23433 () Bool)

(assert (= b_and!23431 (and (=> t!23193 result!8505) b_and!23433)))

(declare-fun m!794145 () Bool)

(assert (=> b!853417 m!794145))

(declare-fun m!794147 () Bool)

(assert (=> b!853422 m!794147))

(declare-fun m!794149 () Bool)

(assert (=> mapNonEmpty!26027 m!794149))

(declare-fun m!794151 () Bool)

(assert (=> b!853418 m!794151))

(declare-fun m!794153 () Bool)

(assert (=> b!853418 m!794153))

(declare-fun m!794155 () Bool)

(assert (=> b!853418 m!794155))

(declare-fun m!794157 () Bool)

(assert (=> b!853418 m!794157))

(declare-fun m!794159 () Bool)

(assert (=> b!853418 m!794159))

(declare-fun m!794161 () Bool)

(assert (=> b!853418 m!794161))

(declare-fun m!794163 () Bool)

(assert (=> b!853418 m!794163))

(declare-fun m!794165 () Bool)

(assert (=> b!853418 m!794165))

(declare-fun m!794167 () Bool)

(assert (=> b!853418 m!794167))

(assert (=> b!853418 m!794157))

(assert (=> b!853418 m!794161))

(declare-fun m!794169 () Bool)

(assert (=> b!853418 m!794169))

(declare-fun m!794171 () Bool)

(assert (=> b!853418 m!794171))

(assert (=> b!853418 m!794165))

(declare-fun m!794173 () Bool)

(assert (=> b!853418 m!794173))

(declare-fun m!794175 () Bool)

(assert (=> b!853418 m!794175))

(declare-fun m!794177 () Bool)

(assert (=> b!853421 m!794177))

(declare-fun m!794179 () Bool)

(assert (=> start!73216 m!794179))

(declare-fun m!794181 () Bool)

(assert (=> start!73216 m!794181))

(declare-fun m!794183 () Bool)

(assert (=> b!853419 m!794183))

(assert (=> b!853419 m!794169))

(declare-fun m!794185 () Bool)

(assert (=> b!853419 m!794185))

(declare-fun m!794187 () Bool)

(assert (=> b!853423 m!794187))

(assert (=> bm!38274 m!794151))

(declare-fun m!794189 () Bool)

(assert (=> bm!38273 m!794189))

(declare-fun m!794191 () Bool)

(assert (=> b!853431 m!794191))

(declare-fun m!794193 () Bool)

(assert (=> b!853420 m!794193))

(assert (=> b!853427 m!794173))

(assert (=> b!853427 m!794173))

(declare-fun m!794195 () Bool)

(assert (=> b!853427 m!794195))

(declare-fun m!794197 () Bool)

(assert (=> b!853427 m!794197))

(check-sat (not b!853418) (not b!853420) (not b!853427) (not b_lambda!11663) (not bm!38273) (not b!853423) (not mapNonEmpty!26027) (not bm!38274) (not b!853419) tp_is_empty!16285 (not b!853422) (not start!73216) (not b!853421) (not b!853417) b_and!23433 (not b_next!14149))
(check-sat b_and!23433 (not b_next!14149))
