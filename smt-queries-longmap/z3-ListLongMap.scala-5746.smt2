; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74286 () Bool)

(assert start!74286)

(declare-fun b_free!15067 () Bool)

(declare-fun b_next!15067 () Bool)

(assert (=> start!74286 (= b_free!15067 (not b_next!15067))))

(declare-fun tp!52877 () Bool)

(declare-fun b_and!24817 () Bool)

(assert (=> start!74286 (= tp!52877 b_and!24817)))

(declare-fun b!874041 () Bool)

(declare-fun res!594028 () Bool)

(declare-fun e!486651 () Bool)

(assert (=> b!874041 (=> (not res!594028) (not e!486651))))

(declare-datatypes ((array!50733 0))(
  ( (array!50734 (arr!24395 (Array (_ BitVec 32) (_ BitVec 64))) (size!24837 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50733)

(declare-datatypes ((List!17323 0))(
  ( (Nil!17320) (Cons!17319 (h!18450 (_ BitVec 64)) (t!24355 List!17323)) )
))
(declare-fun arrayNoDuplicates!0 (array!50733 (_ BitVec 32) List!17323) Bool)

(assert (=> b!874041 (= res!594028 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17320))))

(declare-fun mapIsEmpty!27575 () Bool)

(declare-fun mapRes!27575 () Bool)

(assert (=> mapIsEmpty!27575 mapRes!27575))

(declare-fun res!594025 () Bool)

(assert (=> start!74286 (=> (not res!594025) (not e!486651))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74286 (= res!594025 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24837 _keys!868))))))

(assert (=> start!74286 e!486651))

(declare-fun tp_is_empty!17311 () Bool)

(assert (=> start!74286 tp_is_empty!17311))

(assert (=> start!74286 true))

(assert (=> start!74286 tp!52877))

(declare-fun array_inv!19296 (array!50733) Bool)

(assert (=> start!74286 (array_inv!19296 _keys!868)))

(declare-datatypes ((V!28129 0))(
  ( (V!28130 (val!8703 Int)) )
))
(declare-datatypes ((ValueCell!8216 0))(
  ( (ValueCellFull!8216 (v!11126 V!28129)) (EmptyCell!8216) )
))
(declare-datatypes ((array!50735 0))(
  ( (array!50736 (arr!24396 (Array (_ BitVec 32) ValueCell!8216)) (size!24838 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50735)

(declare-fun e!486648 () Bool)

(declare-fun array_inv!19297 (array!50735) Bool)

(assert (=> start!74286 (and (array_inv!19297 _values!688) e!486648)))

(declare-fun b!874042 () Bool)

(declare-fun e!486650 () Bool)

(assert (=> b!874042 (= e!486650 tp_is_empty!17311)))

(declare-fun b!874043 () Bool)

(declare-fun res!594021 () Bool)

(assert (=> b!874043 (=> (not res!594021) (not e!486651))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!874043 (= res!594021 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24837 _keys!868))))))

(declare-fun b!874044 () Bool)

(declare-fun res!594023 () Bool)

(assert (=> b!874044 (=> (not res!594023) (not e!486651))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874044 (= res!594023 (validKeyInArray!0 k0!854))))

(declare-fun b!874045 () Bool)

(declare-fun res!594027 () Bool)

(assert (=> b!874045 (=> (not res!594027) (not e!486651))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!874045 (= res!594027 (and (= (size!24838 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24837 _keys!868) (size!24838 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27575 () Bool)

(declare-fun tp!52876 () Bool)

(assert (=> mapNonEmpty!27575 (= mapRes!27575 (and tp!52876 e!486650))))

(declare-fun mapRest!27575 () (Array (_ BitVec 32) ValueCell!8216))

(declare-fun mapKey!27575 () (_ BitVec 32))

(declare-fun mapValue!27575 () ValueCell!8216)

(assert (=> mapNonEmpty!27575 (= (arr!24396 _values!688) (store mapRest!27575 mapKey!27575 mapValue!27575))))

(declare-fun b!874046 () Bool)

(declare-fun res!594022 () Bool)

(assert (=> b!874046 (=> (not res!594022) (not e!486651))))

(assert (=> b!874046 (= res!594022 (and (= (select (arr!24395 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!874047 () Bool)

(declare-fun res!594026 () Bool)

(assert (=> b!874047 (=> (not res!594026) (not e!486651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874047 (= res!594026 (validMask!0 mask!1196))))

(declare-fun b!874048 () Bool)

(declare-fun e!486649 () Bool)

(assert (=> b!874048 (= e!486648 (and e!486649 mapRes!27575))))

(declare-fun condMapEmpty!27575 () Bool)

(declare-fun mapDefault!27575 () ValueCell!8216)

(assert (=> b!874048 (= condMapEmpty!27575 (= (arr!24396 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8216)) mapDefault!27575)))))

(declare-fun b!874049 () Bool)

(declare-fun res!594024 () Bool)

(assert (=> b!874049 (=> (not res!594024) (not e!486651))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50733 (_ BitVec 32)) Bool)

(assert (=> b!874049 (= res!594024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874050 () Bool)

(assert (=> b!874050 (= e!486651 false)))

(declare-fun v!557 () V!28129)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11510 0))(
  ( (tuple2!11511 (_1!5766 (_ BitVec 64)) (_2!5766 V!28129)) )
))
(declare-datatypes ((List!17324 0))(
  ( (Nil!17321) (Cons!17320 (h!18451 tuple2!11510) (t!24356 List!17324)) )
))
(declare-datatypes ((ListLongMap!10269 0))(
  ( (ListLongMap!10270 (toList!5150 List!17324)) )
))
(declare-fun lt!395678 () ListLongMap!10269)

(declare-fun minValue!654 () V!28129)

(declare-fun zeroValue!654 () V!28129)

(declare-fun getCurrentListMapNoExtraKeys!3143 (array!50733 array!50735 (_ BitVec 32) (_ BitVec 32) V!28129 V!28129 (_ BitVec 32) Int) ListLongMap!10269)

(assert (=> b!874050 (= lt!395678 (getCurrentListMapNoExtraKeys!3143 _keys!868 (array!50736 (store (arr!24396 _values!688) i!612 (ValueCellFull!8216 v!557)) (size!24838 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395679 () ListLongMap!10269)

(assert (=> b!874050 (= lt!395679 (getCurrentListMapNoExtraKeys!3143 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!874051 () Bool)

(assert (=> b!874051 (= e!486649 tp_is_empty!17311)))

(assert (= (and start!74286 res!594025) b!874047))

(assert (= (and b!874047 res!594026) b!874045))

(assert (= (and b!874045 res!594027) b!874049))

(assert (= (and b!874049 res!594024) b!874041))

(assert (= (and b!874041 res!594028) b!874043))

(assert (= (and b!874043 res!594021) b!874044))

(assert (= (and b!874044 res!594023) b!874046))

(assert (= (and b!874046 res!594022) b!874050))

(assert (= (and b!874048 condMapEmpty!27575) mapIsEmpty!27575))

(assert (= (and b!874048 (not condMapEmpty!27575)) mapNonEmpty!27575))

(get-info :version)

(assert (= (and mapNonEmpty!27575 ((_ is ValueCellFull!8216) mapValue!27575)) b!874042))

(assert (= (and b!874048 ((_ is ValueCellFull!8216) mapDefault!27575)) b!874051))

(assert (= start!74286 b!874048))

(declare-fun m!813743 () Bool)

(assert (=> b!874050 m!813743))

(declare-fun m!813745 () Bool)

(assert (=> b!874050 m!813745))

(declare-fun m!813747 () Bool)

(assert (=> b!874050 m!813747))

(declare-fun m!813749 () Bool)

(assert (=> b!874044 m!813749))

(declare-fun m!813751 () Bool)

(assert (=> b!874049 m!813751))

(declare-fun m!813753 () Bool)

(assert (=> mapNonEmpty!27575 m!813753))

(declare-fun m!813755 () Bool)

(assert (=> b!874047 m!813755))

(declare-fun m!813757 () Bool)

(assert (=> b!874041 m!813757))

(declare-fun m!813759 () Bool)

(assert (=> start!74286 m!813759))

(declare-fun m!813761 () Bool)

(assert (=> start!74286 m!813761))

(declare-fun m!813763 () Bool)

(assert (=> b!874046 m!813763))

(check-sat (not start!74286) tp_is_empty!17311 (not b_next!15067) b_and!24817 (not b!874050) (not b!874047) (not mapNonEmpty!27575) (not b!874044) (not b!874041) (not b!874049))
(check-sat b_and!24817 (not b_next!15067))
