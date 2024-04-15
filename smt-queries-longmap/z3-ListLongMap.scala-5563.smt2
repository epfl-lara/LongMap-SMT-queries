; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73144 () Bool)

(assert start!73144)

(declare-fun b_free!14077 () Bool)

(declare-fun b_next!14077 () Bool)

(assert (=> start!73144 (= b_free!14077 (not b_next!14077))))

(declare-fun tp!49736 () Bool)

(declare-fun b_and!23287 () Bool)

(assert (=> start!73144 (= tp!49736 b_and!23287)))

(declare-fun b!851725 () Bool)

(declare-fun e!475040 () Bool)

(declare-datatypes ((V!26665 0))(
  ( (V!26666 (val!8154 Int)) )
))
(declare-datatypes ((tuple2!10720 0))(
  ( (tuple2!10721 (_1!5371 (_ BitVec 64)) (_2!5371 V!26665)) )
))
(declare-datatypes ((List!16552 0))(
  ( (Nil!16549) (Cons!16548 (h!17679 tuple2!10720) (t!23066 List!16552)) )
))
(declare-datatypes ((ListLongMap!9479 0))(
  ( (ListLongMap!9480 (toList!4755 List!16552)) )
))
(declare-fun call!38061 () ListLongMap!9479)

(declare-fun call!38060 () ListLongMap!9479)

(assert (=> b!851725 (= e!475040 (= call!38061 call!38060))))

(declare-fun b!851726 () Bool)

(declare-fun e!475043 () Bool)

(assert (=> b!851726 (= e!475043 true)))

(declare-fun lt!383560 () ListLongMap!9479)

(declare-fun lt!383567 () V!26665)

(declare-fun lt!383564 () tuple2!10720)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2172 (ListLongMap!9479 tuple2!10720) ListLongMap!9479)

(assert (=> b!851726 (= (+!2172 lt!383560 lt!383564) (+!2172 (+!2172 lt!383560 (tuple2!10721 k0!854 lt!383567)) lt!383564))))

(declare-fun lt!383565 () V!26665)

(assert (=> b!851726 (= lt!383564 (tuple2!10721 k0!854 lt!383565))))

(declare-datatypes ((Unit!29017 0))(
  ( (Unit!29018) )
))
(declare-fun lt!383562 () Unit!29017)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!285 (ListLongMap!9479 (_ BitVec 64) V!26665 V!26665) Unit!29017)

(assert (=> b!851726 (= lt!383562 (addSameAsAddTwiceSameKeyDiffValues!285 lt!383560 k0!854 lt!383567 lt!383565))))

(declare-fun lt!383566 () V!26665)

(declare-datatypes ((ValueCell!7667 0))(
  ( (ValueCellFull!7667 (v!10573 V!26665)) (EmptyCell!7667) )
))
(declare-datatypes ((array!48613 0))(
  ( (array!48614 (arr!23338 (Array (_ BitVec 32) ValueCell!7667)) (size!23780 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48613)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun get!12308 (ValueCell!7667 V!26665) V!26665)

(assert (=> b!851726 (= lt!383567 (get!12308 (select (arr!23338 _values!688) from!1053) lt!383566))))

(declare-fun lt!383559 () ListLongMap!9479)

(declare-datatypes ((array!48615 0))(
  ( (array!48616 (arr!23339 (Array (_ BitVec 32) (_ BitVec 64))) (size!23781 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48615)

(assert (=> b!851726 (= lt!383559 (+!2172 lt!383560 (tuple2!10721 (select (arr!23339 _keys!868) from!1053) lt!383565)))))

(declare-fun v!557 () V!26665)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!851726 (= lt!383565 (get!12308 (select (store (arr!23338 _values!688) i!612 (ValueCellFull!7667 v!557)) from!1053) lt!383566))))

(declare-fun defaultEntry!696 () Int)

(declare-fun dynLambda!1035 (Int (_ BitVec 64)) V!26665)

(assert (=> b!851726 (= lt!383566 (dynLambda!1035 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!383563 () array!48613)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!26665)

(declare-fun zeroValue!654 () V!26665)

(declare-fun getCurrentListMapNoExtraKeys!2763 (array!48615 array!48613 (_ BitVec 32) (_ BitVec 32) V!26665 V!26665 (_ BitVec 32) Int) ListLongMap!9479)

(assert (=> b!851726 (= lt!383560 (getCurrentListMapNoExtraKeys!2763 _keys!868 lt!383563 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851727 () Bool)

(declare-fun res!578573 () Bool)

(declare-fun e!475039 () Bool)

(assert (=> b!851727 (=> (not res!578573) (not e!475039))))

(assert (=> b!851727 (= res!578573 (and (= (size!23780 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23781 _keys!868) (size!23780 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!851728 () Bool)

(declare-fun res!578575 () Bool)

(assert (=> b!851728 (=> (not res!578575) (not e!475039))))

(declare-datatypes ((List!16553 0))(
  ( (Nil!16550) (Cons!16549 (h!17680 (_ BitVec 64)) (t!23067 List!16553)) )
))
(declare-fun arrayNoDuplicates!0 (array!48615 (_ BitVec 32) List!16553) Bool)

(assert (=> b!851728 (= res!578575 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16550))))

(declare-fun b!851729 () Bool)

(assert (=> b!851729 (= e!475040 (= call!38061 (+!2172 call!38060 (tuple2!10721 k0!854 v!557))))))

(declare-fun b!851730 () Bool)

(declare-fun e!475044 () Bool)

(declare-fun e!475037 () Bool)

(declare-fun mapRes!25919 () Bool)

(assert (=> b!851730 (= e!475044 (and e!475037 mapRes!25919))))

(declare-fun condMapEmpty!25919 () Bool)

(declare-fun mapDefault!25919 () ValueCell!7667)

(assert (=> b!851730 (= condMapEmpty!25919 (= (arr!23338 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7667)) mapDefault!25919)))))

(declare-fun bm!38057 () Bool)

(assert (=> bm!38057 (= call!38061 (getCurrentListMapNoExtraKeys!2763 _keys!868 lt!383563 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851731 () Bool)

(declare-fun tp_is_empty!16213 () Bool)

(assert (=> b!851731 (= e!475037 tp_is_empty!16213)))

(declare-fun bm!38058 () Bool)

(assert (=> bm!38058 (= call!38060 (getCurrentListMapNoExtraKeys!2763 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851732 () Bool)

(declare-fun res!578572 () Bool)

(assert (=> b!851732 (=> (not res!578572) (not e!475039))))

(assert (=> b!851732 (= res!578572 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23781 _keys!868))))))

(declare-fun b!851733 () Bool)

(declare-fun e!475041 () Bool)

(assert (=> b!851733 (= e!475041 (not e!475043))))

(declare-fun res!578571 () Bool)

(assert (=> b!851733 (=> res!578571 e!475043)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!851733 (= res!578571 (not (validKeyInArray!0 (select (arr!23339 _keys!868) from!1053))))))

(assert (=> b!851733 e!475040))

(declare-fun c!91721 () Bool)

(assert (=> b!851733 (= c!91721 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!383558 () Unit!29017)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!377 (array!48615 array!48613 (_ BitVec 32) (_ BitVec 32) V!26665 V!26665 (_ BitVec 32) (_ BitVec 64) V!26665 (_ BitVec 32) Int) Unit!29017)

(assert (=> b!851733 (= lt!383558 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!377 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851734 () Bool)

(declare-fun res!578568 () Bool)

(assert (=> b!851734 (=> (not res!578568) (not e!475039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!851734 (= res!578568 (validMask!0 mask!1196))))

(declare-fun b!851735 () Bool)

(declare-fun res!578576 () Bool)

(assert (=> b!851735 (=> (not res!578576) (not e!475039))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48615 (_ BitVec 32)) Bool)

(assert (=> b!851735 (= res!578576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!851736 () Bool)

(assert (=> b!851736 (= e!475039 e!475041)))

(declare-fun res!578569 () Bool)

(assert (=> b!851736 (=> (not res!578569) (not e!475041))))

(assert (=> b!851736 (= res!578569 (= from!1053 i!612))))

(assert (=> b!851736 (= lt!383559 (getCurrentListMapNoExtraKeys!2763 _keys!868 lt!383563 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!851736 (= lt!383563 (array!48614 (store (arr!23338 _values!688) i!612 (ValueCellFull!7667 v!557)) (size!23780 _values!688)))))

(declare-fun lt!383561 () ListLongMap!9479)

(assert (=> b!851736 (= lt!383561 (getCurrentListMapNoExtraKeys!2763 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!851737 () Bool)

(declare-fun res!578570 () Bool)

(assert (=> b!851737 (=> (not res!578570) (not e!475039))))

(assert (=> b!851737 (= res!578570 (validKeyInArray!0 k0!854))))

(declare-fun b!851738 () Bool)

(declare-fun e!475042 () Bool)

(assert (=> b!851738 (= e!475042 tp_is_empty!16213)))

(declare-fun res!578574 () Bool)

(assert (=> start!73144 (=> (not res!578574) (not e!475039))))

(assert (=> start!73144 (= res!578574 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23781 _keys!868))))))

(assert (=> start!73144 e!475039))

(assert (=> start!73144 tp_is_empty!16213))

(assert (=> start!73144 true))

(assert (=> start!73144 tp!49736))

(declare-fun array_inv!18594 (array!48615) Bool)

(assert (=> start!73144 (array_inv!18594 _keys!868)))

(declare-fun array_inv!18595 (array!48613) Bool)

(assert (=> start!73144 (and (array_inv!18595 _values!688) e!475044)))

(declare-fun mapNonEmpty!25919 () Bool)

(declare-fun tp!49735 () Bool)

(assert (=> mapNonEmpty!25919 (= mapRes!25919 (and tp!49735 e!475042))))

(declare-fun mapRest!25919 () (Array (_ BitVec 32) ValueCell!7667))

(declare-fun mapKey!25919 () (_ BitVec 32))

(declare-fun mapValue!25919 () ValueCell!7667)

(assert (=> mapNonEmpty!25919 (= (arr!23338 _values!688) (store mapRest!25919 mapKey!25919 mapValue!25919))))

(declare-fun mapIsEmpty!25919 () Bool)

(assert (=> mapIsEmpty!25919 mapRes!25919))

(declare-fun b!851739 () Bool)

(declare-fun res!578577 () Bool)

(assert (=> b!851739 (=> (not res!578577) (not e!475039))))

(assert (=> b!851739 (= res!578577 (and (= (select (arr!23339 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73144 res!578574) b!851734))

(assert (= (and b!851734 res!578568) b!851727))

(assert (= (and b!851727 res!578573) b!851735))

(assert (= (and b!851735 res!578576) b!851728))

(assert (= (and b!851728 res!578575) b!851732))

(assert (= (and b!851732 res!578572) b!851737))

(assert (= (and b!851737 res!578570) b!851739))

(assert (= (and b!851739 res!578577) b!851736))

(assert (= (and b!851736 res!578569) b!851733))

(assert (= (and b!851733 c!91721) b!851729))

(assert (= (and b!851733 (not c!91721)) b!851725))

(assert (= (or b!851729 b!851725) bm!38057))

(assert (= (or b!851729 b!851725) bm!38058))

(assert (= (and b!851733 (not res!578571)) b!851726))

(assert (= (and b!851730 condMapEmpty!25919) mapIsEmpty!25919))

(assert (= (and b!851730 (not condMapEmpty!25919)) mapNonEmpty!25919))

(get-info :version)

(assert (= (and mapNonEmpty!25919 ((_ is ValueCellFull!7667) mapValue!25919)) b!851738))

(assert (= (and b!851730 ((_ is ValueCellFull!7667) mapDefault!25919)) b!851731))

(assert (= start!73144 b!851730))

(declare-fun b_lambda!11591 () Bool)

(assert (=> (not b_lambda!11591) (not b!851726)))

(declare-fun t!23065 () Bool)

(declare-fun tb!4371 () Bool)

(assert (=> (and start!73144 (= defaultEntry!696 defaultEntry!696) t!23065) tb!4371))

(declare-fun result!8361 () Bool)

(assert (=> tb!4371 (= result!8361 tp_is_empty!16213)))

(assert (=> b!851726 t!23065))

(declare-fun b_and!23289 () Bool)

(assert (= b_and!23287 (and (=> t!23065 result!8361) b_and!23289)))

(declare-fun m!792199 () Bool)

(assert (=> b!851726 m!792199))

(declare-fun m!792201 () Bool)

(assert (=> b!851726 m!792201))

(declare-fun m!792203 () Bool)

(assert (=> b!851726 m!792203))

(declare-fun m!792205 () Bool)

(assert (=> b!851726 m!792205))

(declare-fun m!792207 () Bool)

(assert (=> b!851726 m!792207))

(declare-fun m!792209 () Bool)

(assert (=> b!851726 m!792209))

(declare-fun m!792211 () Bool)

(assert (=> b!851726 m!792211))

(assert (=> b!851726 m!792207))

(declare-fun m!792213 () Bool)

(assert (=> b!851726 m!792213))

(declare-fun m!792215 () Bool)

(assert (=> b!851726 m!792215))

(assert (=> b!851726 m!792209))

(declare-fun m!792217 () Bool)

(assert (=> b!851726 m!792217))

(declare-fun m!792219 () Bool)

(assert (=> b!851726 m!792219))

(declare-fun m!792221 () Bool)

(assert (=> b!851726 m!792221))

(declare-fun m!792223 () Bool)

(assert (=> b!851726 m!792223))

(assert (=> b!851726 m!792199))

(declare-fun m!792225 () Bool)

(assert (=> b!851735 m!792225))

(declare-fun m!792227 () Bool)

(assert (=> bm!38058 m!792227))

(declare-fun m!792229 () Bool)

(assert (=> start!73144 m!792229))

(declare-fun m!792231 () Bool)

(assert (=> start!73144 m!792231))

(declare-fun m!792233 () Bool)

(assert (=> b!851728 m!792233))

(declare-fun m!792235 () Bool)

(assert (=> b!851734 m!792235))

(declare-fun m!792237 () Bool)

(assert (=> b!851729 m!792237))

(assert (=> b!851733 m!792219))

(assert (=> b!851733 m!792219))

(declare-fun m!792239 () Bool)

(assert (=> b!851733 m!792239))

(declare-fun m!792241 () Bool)

(assert (=> b!851733 m!792241))

(declare-fun m!792243 () Bool)

(assert (=> mapNonEmpty!25919 m!792243))

(declare-fun m!792245 () Bool)

(assert (=> b!851736 m!792245))

(assert (=> b!851736 m!792217))

(declare-fun m!792247 () Bool)

(assert (=> b!851736 m!792247))

(declare-fun m!792249 () Bool)

(assert (=> b!851737 m!792249))

(assert (=> bm!38057 m!792203))

(declare-fun m!792251 () Bool)

(assert (=> b!851739 m!792251))

(check-sat (not b_next!14077) tp_is_empty!16213 (not b!851736) (not bm!38057) (not mapNonEmpty!25919) (not bm!38058) (not start!73144) (not b!851729) (not b_lambda!11591) (not b!851726) (not b!851728) b_and!23289 (not b!851733) (not b!851735) (not b!851734) (not b!851737))
(check-sat b_and!23289 (not b_next!14077))
