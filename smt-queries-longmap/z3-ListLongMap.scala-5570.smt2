; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73186 () Bool)

(assert start!73186)

(declare-fun b_free!14119 () Bool)

(declare-fun b_next!14119 () Bool)

(assert (=> start!73186 (= b_free!14119 (not b_next!14119))))

(declare-fun tp!49861 () Bool)

(declare-fun b_and!23371 () Bool)

(assert (=> start!73186 (= tp!49861 b_and!23371)))

(declare-fun b!852712 () Bool)

(declare-fun e!475545 () Bool)

(declare-fun e!475547 () Bool)

(declare-fun mapRes!25982 () Bool)

(assert (=> b!852712 (= e!475545 (and e!475547 mapRes!25982))))

(declare-fun condMapEmpty!25982 () Bool)

(declare-datatypes ((V!26721 0))(
  ( (V!26722 (val!8175 Int)) )
))
(declare-datatypes ((ValueCell!7688 0))(
  ( (ValueCellFull!7688 (v!10594 V!26721)) (EmptyCell!7688) )
))
(declare-datatypes ((array!48695 0))(
  ( (array!48696 (arr!23379 (Array (_ BitVec 32) ValueCell!7688)) (size!23821 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48695)

(declare-fun mapDefault!25982 () ValueCell!7688)

(assert (=> b!852712 (= condMapEmpty!25982 (= (arr!23379 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7688)) mapDefault!25982)))))

(declare-fun b!852713 () Bool)

(declare-fun res!579206 () Bool)

(declare-fun e!475546 () Bool)

(assert (=> b!852713 (=> (not res!579206) (not e!475546))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48697 0))(
  ( (array!48698 (arr!23380 (Array (_ BitVec 32) (_ BitVec 64))) (size!23822 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48697)

(assert (=> b!852713 (= res!579206 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23822 _keys!868))))))

(declare-fun res!579204 () Bool)

(assert (=> start!73186 (=> (not res!579204) (not e!475546))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73186 (= res!579204 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23822 _keys!868))))))

(assert (=> start!73186 e!475546))

(declare-fun tp_is_empty!16255 () Bool)

(assert (=> start!73186 tp_is_empty!16255))

(assert (=> start!73186 true))

(assert (=> start!73186 tp!49861))

(declare-fun array_inv!18622 (array!48697) Bool)

(assert (=> start!73186 (array_inv!18622 _keys!868)))

(declare-fun array_inv!18623 (array!48695) Bool)

(assert (=> start!73186 (and (array_inv!18623 _values!688) e!475545)))

(declare-fun b!852714 () Bool)

(declare-fun e!475542 () Bool)

(assert (=> b!852714 (= e!475542 tp_is_empty!16255)))

(declare-fun lt!384189 () array!48695)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10760 0))(
  ( (tuple2!10761 (_1!5391 (_ BitVec 64)) (_2!5391 V!26721)) )
))
(declare-datatypes ((List!16584 0))(
  ( (Nil!16581) (Cons!16580 (h!17711 tuple2!10760) (t!23140 List!16584)) )
))
(declare-datatypes ((ListLongMap!9519 0))(
  ( (ListLongMap!9520 (toList!4775 List!16584)) )
))
(declare-fun call!38187 () ListLongMap!9519)

(declare-fun minValue!654 () V!26721)

(declare-fun zeroValue!654 () V!26721)

(declare-fun bm!38183 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2783 (array!48697 array!48695 (_ BitVec 32) (_ BitVec 32) V!26721 V!26721 (_ BitVec 32) Int) ListLongMap!9519)

(assert (=> bm!38183 (= call!38187 (getCurrentListMapNoExtraKeys!2783 _keys!868 lt!384189 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!25982 () Bool)

(declare-fun tp!49862 () Bool)

(assert (=> mapNonEmpty!25982 (= mapRes!25982 (and tp!49862 e!475542))))

(declare-fun mapRest!25982 () (Array (_ BitVec 32) ValueCell!7688))

(declare-fun mapKey!25982 () (_ BitVec 32))

(declare-fun mapValue!25982 () ValueCell!7688)

(assert (=> mapNonEmpty!25982 (= (arr!23379 _values!688) (store mapRest!25982 mapKey!25982 mapValue!25982))))

(declare-fun b!852715 () Bool)

(declare-fun res!579207 () Bool)

(assert (=> b!852715 (=> (not res!579207) (not e!475546))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48697 (_ BitVec 32)) Bool)

(assert (=> b!852715 (= res!579207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun call!38186 () ListLongMap!9519)

(declare-fun bm!38184 () Bool)

(assert (=> bm!38184 (= call!38186 (getCurrentListMapNoExtraKeys!2783 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852716 () Bool)

(declare-fun e!475544 () Bool)

(assert (=> b!852716 (= e!475544 true)))

(declare-fun lt!384195 () tuple2!10760)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lt!384192 () V!26721)

(declare-fun lt!384196 () ListLongMap!9519)

(declare-fun +!2190 (ListLongMap!9519 tuple2!10760) ListLongMap!9519)

(assert (=> b!852716 (= (+!2190 lt!384196 lt!384195) (+!2190 (+!2190 lt!384196 (tuple2!10761 k0!854 lt!384192)) lt!384195))))

(declare-fun lt!384194 () V!26721)

(assert (=> b!852716 (= lt!384195 (tuple2!10761 k0!854 lt!384194))))

(declare-datatypes ((Unit!29049 0))(
  ( (Unit!29050) )
))
(declare-fun lt!384190 () Unit!29049)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!299 (ListLongMap!9519 (_ BitVec 64) V!26721 V!26721) Unit!29049)

(assert (=> b!852716 (= lt!384190 (addSameAsAddTwiceSameKeyDiffValues!299 lt!384196 k0!854 lt!384192 lt!384194))))

(declare-fun lt!384193 () V!26721)

(declare-fun get!12336 (ValueCell!7688 V!26721) V!26721)

(assert (=> b!852716 (= lt!384192 (get!12336 (select (arr!23379 _values!688) from!1053) lt!384193))))

(declare-fun lt!384191 () ListLongMap!9519)

(assert (=> b!852716 (= lt!384191 (+!2190 lt!384196 (tuple2!10761 (select (arr!23380 _keys!868) from!1053) lt!384194)))))

(declare-fun v!557 () V!26721)

(assert (=> b!852716 (= lt!384194 (get!12336 (select (store (arr!23379 _values!688) i!612 (ValueCellFull!7688 v!557)) from!1053) lt!384193))))

(declare-fun dynLambda!1049 (Int (_ BitVec 64)) V!26721)

(assert (=> b!852716 (= lt!384193 (dynLambda!1049 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!852716 (= lt!384196 (getCurrentListMapNoExtraKeys!2783 _keys!868 lt!384189 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852717 () Bool)

(declare-fun res!579205 () Bool)

(assert (=> b!852717 (=> (not res!579205) (not e!475546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!852717 (= res!579205 (validMask!0 mask!1196))))

(declare-fun b!852718 () Bool)

(declare-fun e!475548 () Bool)

(assert (=> b!852718 (= e!475548 (= call!38187 call!38186))))

(declare-fun b!852719 () Bool)

(declare-fun res!579202 () Bool)

(assert (=> b!852719 (=> (not res!579202) (not e!475546))))

(declare-datatypes ((List!16585 0))(
  ( (Nil!16582) (Cons!16581 (h!17712 (_ BitVec 64)) (t!23141 List!16585)) )
))
(declare-fun arrayNoDuplicates!0 (array!48697 (_ BitVec 32) List!16585) Bool)

(assert (=> b!852719 (= res!579202 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16582))))

(declare-fun b!852720 () Bool)

(declare-fun res!579201 () Bool)

(assert (=> b!852720 (=> (not res!579201) (not e!475546))))

(assert (=> b!852720 (= res!579201 (and (= (select (arr!23380 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!852721 () Bool)

(declare-fun e!475541 () Bool)

(assert (=> b!852721 (= e!475541 (not e!475544))))

(declare-fun res!579199 () Bool)

(assert (=> b!852721 (=> res!579199 e!475544)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!852721 (= res!579199 (not (validKeyInArray!0 (select (arr!23380 _keys!868) from!1053))))))

(assert (=> b!852721 e!475548))

(declare-fun c!91784 () Bool)

(assert (=> b!852721 (= c!91784 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!384197 () Unit!29049)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!391 (array!48697 array!48695 (_ BitVec 32) (_ BitVec 32) V!26721 V!26721 (_ BitVec 32) (_ BitVec 64) V!26721 (_ BitVec 32) Int) Unit!29049)

(assert (=> b!852721 (= lt!384197 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!391 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852722 () Bool)

(assert (=> b!852722 (= e!475546 e!475541)))

(declare-fun res!579198 () Bool)

(assert (=> b!852722 (=> (not res!579198) (not e!475541))))

(assert (=> b!852722 (= res!579198 (= from!1053 i!612))))

(assert (=> b!852722 (= lt!384191 (getCurrentListMapNoExtraKeys!2783 _keys!868 lt!384189 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!852722 (= lt!384189 (array!48696 (store (arr!23379 _values!688) i!612 (ValueCellFull!7688 v!557)) (size!23821 _values!688)))))

(declare-fun lt!384188 () ListLongMap!9519)

(assert (=> b!852722 (= lt!384188 (getCurrentListMapNoExtraKeys!2783 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!852723 () Bool)

(declare-fun res!579203 () Bool)

(assert (=> b!852723 (=> (not res!579203) (not e!475546))))

(assert (=> b!852723 (= res!579203 (and (= (size!23821 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23822 _keys!868) (size!23821 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!852724 () Bool)

(declare-fun res!579200 () Bool)

(assert (=> b!852724 (=> (not res!579200) (not e!475546))))

(assert (=> b!852724 (= res!579200 (validKeyInArray!0 k0!854))))

(declare-fun b!852725 () Bool)

(assert (=> b!852725 (= e!475548 (= call!38187 (+!2190 call!38186 (tuple2!10761 k0!854 v!557))))))

(declare-fun mapIsEmpty!25982 () Bool)

(assert (=> mapIsEmpty!25982 mapRes!25982))

(declare-fun b!852726 () Bool)

(assert (=> b!852726 (= e!475547 tp_is_empty!16255)))

(assert (= (and start!73186 res!579204) b!852717))

(assert (= (and b!852717 res!579205) b!852723))

(assert (= (and b!852723 res!579203) b!852715))

(assert (= (and b!852715 res!579207) b!852719))

(assert (= (and b!852719 res!579202) b!852713))

(assert (= (and b!852713 res!579206) b!852724))

(assert (= (and b!852724 res!579200) b!852720))

(assert (= (and b!852720 res!579201) b!852722))

(assert (= (and b!852722 res!579198) b!852721))

(assert (= (and b!852721 c!91784) b!852725))

(assert (= (and b!852721 (not c!91784)) b!852718))

(assert (= (or b!852725 b!852718) bm!38183))

(assert (= (or b!852725 b!852718) bm!38184))

(assert (= (and b!852721 (not res!579199)) b!852716))

(assert (= (and b!852712 condMapEmpty!25982) mapIsEmpty!25982))

(assert (= (and b!852712 (not condMapEmpty!25982)) mapNonEmpty!25982))

(get-info :version)

(assert (= (and mapNonEmpty!25982 ((_ is ValueCellFull!7688) mapValue!25982)) b!852714))

(assert (= (and b!852712 ((_ is ValueCellFull!7688) mapDefault!25982)) b!852726))

(assert (= start!73186 b!852712))

(declare-fun b_lambda!11633 () Bool)

(assert (=> (not b_lambda!11633) (not b!852716)))

(declare-fun t!23139 () Bool)

(declare-fun tb!4413 () Bool)

(assert (=> (and start!73186 (= defaultEntry!696 defaultEntry!696) t!23139) tb!4413))

(declare-fun result!8445 () Bool)

(assert (=> tb!4413 (= result!8445 tp_is_empty!16255)))

(assert (=> b!852716 t!23139))

(declare-fun b_and!23373 () Bool)

(assert (= b_and!23371 (and (=> t!23139 result!8445) b_and!23373)))

(declare-fun m!793333 () Bool)

(assert (=> b!852725 m!793333))

(declare-fun m!793335 () Bool)

(assert (=> bm!38184 m!793335))

(declare-fun m!793337 () Bool)

(assert (=> b!852716 m!793337))

(declare-fun m!793339 () Bool)

(assert (=> b!852716 m!793339))

(declare-fun m!793341 () Bool)

(assert (=> b!852716 m!793341))

(declare-fun m!793343 () Bool)

(assert (=> b!852716 m!793343))

(declare-fun m!793345 () Bool)

(assert (=> b!852716 m!793345))

(declare-fun m!793347 () Bool)

(assert (=> b!852716 m!793347))

(assert (=> b!852716 m!793339))

(declare-fun m!793349 () Bool)

(assert (=> b!852716 m!793349))

(declare-fun m!793351 () Bool)

(assert (=> b!852716 m!793351))

(declare-fun m!793353 () Bool)

(assert (=> b!852716 m!793353))

(declare-fun m!793355 () Bool)

(assert (=> b!852716 m!793355))

(declare-fun m!793357 () Bool)

(assert (=> b!852716 m!793357))

(assert (=> b!852716 m!793349))

(assert (=> b!852716 m!793353))

(declare-fun m!793359 () Bool)

(assert (=> b!852716 m!793359))

(declare-fun m!793361 () Bool)

(assert (=> b!852716 m!793361))

(declare-fun m!793363 () Bool)

(assert (=> start!73186 m!793363))

(declare-fun m!793365 () Bool)

(assert (=> start!73186 m!793365))

(declare-fun m!793367 () Bool)

(assert (=> b!852717 m!793367))

(declare-fun m!793369 () Bool)

(assert (=> b!852715 m!793369))

(assert (=> bm!38183 m!793347))

(declare-fun m!793371 () Bool)

(assert (=> mapNonEmpty!25982 m!793371))

(declare-fun m!793373 () Bool)

(assert (=> b!852720 m!793373))

(declare-fun m!793375 () Bool)

(assert (=> b!852722 m!793375))

(assert (=> b!852722 m!793361))

(declare-fun m!793377 () Bool)

(assert (=> b!852722 m!793377))

(declare-fun m!793379 () Bool)

(assert (=> b!852724 m!793379))

(declare-fun m!793381 () Bool)

(assert (=> b!852719 m!793381))

(assert (=> b!852721 m!793355))

(assert (=> b!852721 m!793355))

(declare-fun m!793383 () Bool)

(assert (=> b!852721 m!793383))

(declare-fun m!793385 () Bool)

(assert (=> b!852721 m!793385))

(check-sat (not b!852724) (not mapNonEmpty!25982) (not b!852725) (not start!73186) (not b_next!14119) (not b!852719) (not bm!38184) (not b!852722) (not bm!38183) tp_is_empty!16255 (not b!852721) (not b!852717) (not b_lambda!11633) (not b!852715) (not b!852716) b_and!23373)
(check-sat b_and!23373 (not b_next!14119))
