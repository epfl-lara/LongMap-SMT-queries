; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73744 () Bool)

(assert start!73744)

(declare-fun b_free!14491 () Bool)

(declare-fun b_next!14491 () Bool)

(assert (=> start!73744 (= b_free!14491 (not b_next!14491))))

(declare-fun tp!50977 () Bool)

(declare-fun b_and!23971 () Bool)

(assert (=> start!73744 (= tp!50977 b_and!23971)))

(declare-fun b!861511 () Bool)

(declare-fun res!585221 () Bool)

(declare-fun e!480131 () Bool)

(assert (=> b!861511 (=> (not res!585221) (not e!480131))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!861511 (= res!585221 (validKeyInArray!0 k0!854))))

(declare-fun b!861512 () Bool)

(declare-fun res!585219 () Bool)

(assert (=> b!861512 (=> (not res!585219) (not e!480131))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!861512 (= res!585219 (validMask!0 mask!1196))))

(declare-fun b!861513 () Bool)

(declare-fun e!480127 () Bool)

(declare-fun tp_is_empty!16627 () Bool)

(assert (=> b!861513 (= e!480127 tp_is_empty!16627)))

(declare-fun b!861514 () Bool)

(declare-fun e!480129 () Bool)

(declare-fun e!480128 () Bool)

(declare-fun mapRes!26540 () Bool)

(assert (=> b!861514 (= e!480129 (and e!480128 mapRes!26540))))

(declare-fun condMapEmpty!26540 () Bool)

(declare-datatypes ((V!27217 0))(
  ( (V!27218 (val!8361 Int)) )
))
(declare-datatypes ((ValueCell!7874 0))(
  ( (ValueCellFull!7874 (v!10786 V!27217)) (EmptyCell!7874) )
))
(declare-datatypes ((array!49479 0))(
  ( (array!49480 (arr!23766 (Array (_ BitVec 32) ValueCell!7874)) (size!24207 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49479)

(declare-fun mapDefault!26540 () ValueCell!7874)

(assert (=> b!861514 (= condMapEmpty!26540 (= (arr!23766 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7874)) mapDefault!26540)))))

(declare-fun b!861515 () Bool)

(declare-fun e!480133 () Bool)

(assert (=> b!861515 (= e!480133 true)))

(declare-fun lt!388289 () Bool)

(declare-datatypes ((List!16814 0))(
  ( (Nil!16811) (Cons!16810 (h!17947 (_ BitVec 64)) (t!23563 List!16814)) )
))
(declare-fun contains!4214 (List!16814 (_ BitVec 64)) Bool)

(assert (=> b!861515 (= lt!388289 (contains!4214 Nil!16811 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!861516 () Bool)

(declare-fun e!480126 () Bool)

(assert (=> b!861516 (= e!480131 e!480126)))

(declare-fun res!585218 () Bool)

(assert (=> b!861516 (=> (not res!585218) (not e!480126))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!861516 (= res!585218 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!388286 () array!49479)

(declare-datatypes ((tuple2!10974 0))(
  ( (tuple2!10975 (_1!5498 (_ BitVec 64)) (_2!5498 V!27217)) )
))
(declare-datatypes ((List!16815 0))(
  ( (Nil!16812) (Cons!16811 (h!17948 tuple2!10974) (t!23564 List!16815)) )
))
(declare-datatypes ((ListLongMap!9745 0))(
  ( (ListLongMap!9746 (toList!4888 List!16815)) )
))
(declare-fun lt!388295 () ListLongMap!9745)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!49481 0))(
  ( (array!49482 (arr!23767 (Array (_ BitVec 32) (_ BitVec 64))) (size!24208 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49481)

(declare-fun minValue!654 () V!27217)

(declare-fun zeroValue!654 () V!27217)

(declare-fun getCurrentListMapNoExtraKeys!2941 (array!49481 array!49479 (_ BitVec 32) (_ BitVec 32) V!27217 V!27217 (_ BitVec 32) Int) ListLongMap!9745)

(assert (=> b!861516 (= lt!388295 (getCurrentListMapNoExtraKeys!2941 _keys!868 lt!388286 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27217)

(assert (=> b!861516 (= lt!388286 (array!49480 (store (arr!23766 _values!688) i!612 (ValueCellFull!7874 v!557)) (size!24207 _values!688)))))

(declare-fun lt!388290 () ListLongMap!9745)

(assert (=> b!861516 (= lt!388290 (getCurrentListMapNoExtraKeys!2941 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!861517 () Bool)

(declare-fun res!585214 () Bool)

(assert (=> b!861517 (=> (not res!585214) (not e!480131))))

(assert (=> b!861517 (= res!585214 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24208 _keys!868))))))

(declare-fun b!861518 () Bool)

(declare-fun res!585217 () Bool)

(assert (=> b!861518 (=> res!585217 e!480133)))

(declare-fun noDuplicate!1318 (List!16814) Bool)

(assert (=> b!861518 (= res!585217 (not (noDuplicate!1318 Nil!16811)))))

(declare-fun b!861519 () Bool)

(declare-fun e!480132 () Bool)

(declare-fun e!480125 () Bool)

(assert (=> b!861519 (= e!480132 e!480125)))

(declare-fun res!585226 () Bool)

(assert (=> b!861519 (=> res!585226 e!480125)))

(assert (=> b!861519 (= res!585226 (not (= (select (arr!23767 _keys!868) from!1053) k0!854)))))

(declare-fun lt!388291 () ListLongMap!9745)

(declare-fun +!2292 (ListLongMap!9745 tuple2!10974) ListLongMap!9745)

(declare-fun get!12536 (ValueCell!7874 V!27217) V!27217)

(declare-fun dynLambda!1122 (Int (_ BitVec 64)) V!27217)

(assert (=> b!861519 (= lt!388295 (+!2292 lt!388291 (tuple2!10975 (select (arr!23767 _keys!868) from!1053) (get!12536 (select (arr!23766 _values!688) from!1053) (dynLambda!1122 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!861520 () Bool)

(assert (=> b!861520 (= e!480128 tp_is_empty!16627)))

(declare-fun res!585216 () Bool)

(assert (=> start!73744 (=> (not res!585216) (not e!480131))))

(assert (=> start!73744 (= res!585216 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24208 _keys!868))))))

(assert (=> start!73744 e!480131))

(assert (=> start!73744 tp_is_empty!16627))

(assert (=> start!73744 true))

(assert (=> start!73744 tp!50977))

(declare-fun array_inv!18860 (array!49481) Bool)

(assert (=> start!73744 (array_inv!18860 _keys!868)))

(declare-fun array_inv!18861 (array!49479) Bool)

(assert (=> start!73744 (and (array_inv!18861 _values!688) e!480129)))

(declare-fun b!861521 () Bool)

(declare-fun res!585215 () Bool)

(assert (=> b!861521 (=> (not res!585215) (not e!480131))))

(assert (=> b!861521 (= res!585215 (and (= (select (arr!23767 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!861522 () Bool)

(declare-fun res!585220 () Bool)

(assert (=> b!861522 (=> (not res!585220) (not e!480131))))

(assert (=> b!861522 (= res!585220 (and (= (size!24207 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24208 _keys!868) (size!24207 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!861523 () Bool)

(assert (=> b!861523 (= e!480125 e!480133)))

(declare-fun res!585222 () Bool)

(assert (=> b!861523 (=> res!585222 e!480133)))

(assert (=> b!861523 (= res!585222 (or (bvsge (size!24208 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24208 _keys!868)) (bvsge from!1053 (size!24208 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!49481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!861523 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-datatypes ((Unit!29336 0))(
  ( (Unit!29337) )
))
(declare-fun lt!388288 () Unit!29336)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49481 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29336)

(assert (=> b!861523 (= lt!388288 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayNoDuplicates!0 (array!49481 (_ BitVec 32) List!16814) Bool)

(assert (=> b!861523 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16811)))

(declare-fun lt!388292 () Unit!29336)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49481 (_ BitVec 32) (_ BitVec 32)) Unit!29336)

(assert (=> b!861523 (= lt!388292 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun mapNonEmpty!26540 () Bool)

(declare-fun tp!50978 () Bool)

(assert (=> mapNonEmpty!26540 (= mapRes!26540 (and tp!50978 e!480127))))

(declare-fun mapKey!26540 () (_ BitVec 32))

(declare-fun mapRest!26540 () (Array (_ BitVec 32) ValueCell!7874))

(declare-fun mapValue!26540 () ValueCell!7874)

(assert (=> mapNonEmpty!26540 (= (arr!23766 _values!688) (store mapRest!26540 mapKey!26540 mapValue!26540))))

(declare-fun b!861524 () Bool)

(assert (=> b!861524 (= e!480126 (not e!480132))))

(declare-fun res!585223 () Bool)

(assert (=> b!861524 (=> res!585223 e!480132)))

(assert (=> b!861524 (= res!585223 (not (validKeyInArray!0 (select (arr!23767 _keys!868) from!1053))))))

(declare-fun lt!388287 () ListLongMap!9745)

(assert (=> b!861524 (= lt!388287 lt!388291)))

(declare-fun lt!388294 () ListLongMap!9745)

(assert (=> b!861524 (= lt!388291 (+!2292 lt!388294 (tuple2!10975 k0!854 v!557)))))

(assert (=> b!861524 (= lt!388287 (getCurrentListMapNoExtraKeys!2941 _keys!868 lt!388286 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!861524 (= lt!388294 (getCurrentListMapNoExtraKeys!2941 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!388293 () Unit!29336)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!483 (array!49481 array!49479 (_ BitVec 32) (_ BitVec 32) V!27217 V!27217 (_ BitVec 32) (_ BitVec 64) V!27217 (_ BitVec 32) Int) Unit!29336)

(assert (=> b!861524 (= lt!388293 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!483 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!861525 () Bool)

(declare-fun res!585225 () Bool)

(assert (=> b!861525 (=> (not res!585225) (not e!480131))))

(assert (=> b!861525 (= res!585225 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16811))))

(declare-fun mapIsEmpty!26540 () Bool)

(assert (=> mapIsEmpty!26540 mapRes!26540))

(declare-fun b!861526 () Bool)

(declare-fun res!585213 () Bool)

(assert (=> b!861526 (=> (not res!585213) (not e!480131))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49481 (_ BitVec 32)) Bool)

(assert (=> b!861526 (= res!585213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!861527 () Bool)

(declare-fun res!585224 () Bool)

(assert (=> b!861527 (=> res!585224 e!480133)))

(assert (=> b!861527 (= res!585224 (contains!4214 Nil!16811 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!73744 res!585216) b!861512))

(assert (= (and b!861512 res!585219) b!861522))

(assert (= (and b!861522 res!585220) b!861526))

(assert (= (and b!861526 res!585213) b!861525))

(assert (= (and b!861525 res!585225) b!861517))

(assert (= (and b!861517 res!585214) b!861511))

(assert (= (and b!861511 res!585221) b!861521))

(assert (= (and b!861521 res!585215) b!861516))

(assert (= (and b!861516 res!585218) b!861524))

(assert (= (and b!861524 (not res!585223)) b!861519))

(assert (= (and b!861519 (not res!585226)) b!861523))

(assert (= (and b!861523 (not res!585222)) b!861518))

(assert (= (and b!861518 (not res!585217)) b!861527))

(assert (= (and b!861527 (not res!585224)) b!861515))

(assert (= (and b!861514 condMapEmpty!26540) mapIsEmpty!26540))

(assert (= (and b!861514 (not condMapEmpty!26540)) mapNonEmpty!26540))

(get-info :version)

(assert (= (and mapNonEmpty!26540 ((_ is ValueCellFull!7874) mapValue!26540)) b!861513))

(assert (= (and b!861514 ((_ is ValueCellFull!7874) mapDefault!26540)) b!861520))

(assert (= start!73744 b!861514))

(declare-fun b_lambda!11857 () Bool)

(assert (=> (not b_lambda!11857) (not b!861519)))

(declare-fun t!23562 () Bool)

(declare-fun tb!4605 () Bool)

(assert (=> (and start!73744 (= defaultEntry!696 defaultEntry!696) t!23562) tb!4605))

(declare-fun result!8829 () Bool)

(assert (=> tb!4605 (= result!8829 tp_is_empty!16627)))

(assert (=> b!861519 t!23562))

(declare-fun b_and!23973 () Bool)

(assert (= b_and!23971 (and (=> t!23562 result!8829) b_and!23973)))

(declare-fun m!802715 () Bool)

(assert (=> mapNonEmpty!26540 m!802715))

(declare-fun m!802717 () Bool)

(assert (=> b!861524 m!802717))

(declare-fun m!802719 () Bool)

(assert (=> b!861524 m!802719))

(declare-fun m!802721 () Bool)

(assert (=> b!861524 m!802721))

(declare-fun m!802723 () Bool)

(assert (=> b!861524 m!802723))

(assert (=> b!861524 m!802721))

(declare-fun m!802725 () Bool)

(assert (=> b!861524 m!802725))

(declare-fun m!802727 () Bool)

(assert (=> b!861524 m!802727))

(declare-fun m!802729 () Bool)

(assert (=> b!861519 m!802729))

(declare-fun m!802731 () Bool)

(assert (=> b!861519 m!802731))

(declare-fun m!802733 () Bool)

(assert (=> b!861519 m!802733))

(assert (=> b!861519 m!802729))

(declare-fun m!802735 () Bool)

(assert (=> b!861519 m!802735))

(assert (=> b!861519 m!802721))

(assert (=> b!861519 m!802731))

(declare-fun m!802737 () Bool)

(assert (=> b!861525 m!802737))

(declare-fun m!802739 () Bool)

(assert (=> b!861526 m!802739))

(declare-fun m!802741 () Bool)

(assert (=> b!861518 m!802741))

(declare-fun m!802743 () Bool)

(assert (=> start!73744 m!802743))

(declare-fun m!802745 () Bool)

(assert (=> start!73744 m!802745))

(declare-fun m!802747 () Bool)

(assert (=> b!861516 m!802747))

(declare-fun m!802749 () Bool)

(assert (=> b!861516 m!802749))

(declare-fun m!802751 () Bool)

(assert (=> b!861516 m!802751))

(declare-fun m!802753 () Bool)

(assert (=> b!861512 m!802753))

(declare-fun m!802755 () Bool)

(assert (=> b!861527 m!802755))

(declare-fun m!802757 () Bool)

(assert (=> b!861521 m!802757))

(declare-fun m!802759 () Bool)

(assert (=> b!861523 m!802759))

(declare-fun m!802761 () Bool)

(assert (=> b!861523 m!802761))

(declare-fun m!802763 () Bool)

(assert (=> b!861523 m!802763))

(declare-fun m!802765 () Bool)

(assert (=> b!861523 m!802765))

(declare-fun m!802767 () Bool)

(assert (=> b!861515 m!802767))

(declare-fun m!802769 () Bool)

(assert (=> b!861511 m!802769))

(check-sat (not b!861516) (not b!861525) (not b!861519) (not b!861524) (not b!861518) tp_is_empty!16627 (not b_next!14491) b_and!23973 (not mapNonEmpty!26540) (not start!73744) (not b!861526) (not b!861511) (not b!861523) (not b_lambda!11857) (not b!861512) (not b!861527) (not b!861515))
(check-sat b_and!23973 (not b_next!14491))
