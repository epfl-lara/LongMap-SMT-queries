; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73360 () Bool)

(assert start!73360)

(declare-fun b_free!14293 () Bool)

(declare-fun b_next!14293 () Bool)

(assert (=> start!73360 (= b_free!14293 (not b_next!14293))))

(declare-fun tp!50383 () Bool)

(declare-fun b_and!23623 () Bool)

(assert (=> start!73360 (= tp!50383 b_and!23623)))

(declare-fun mapIsEmpty!26243 () Bool)

(declare-fun mapRes!26243 () Bool)

(assert (=> mapIsEmpty!26243 mapRes!26243))

(declare-fun b!856159 () Bool)

(declare-fun res!581558 () Bool)

(declare-fun e!477231 () Bool)

(assert (=> b!856159 (=> (not res!581558) (not e!477231))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49037 0))(
  ( (array!49038 (arr!23550 (Array (_ BitVec 32) (_ BitVec 64))) (size!23992 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49037)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!856159 (= res!581558 (and (= (select (arr!23550 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!856160 () Bool)

(declare-fun res!581562 () Bool)

(assert (=> b!856160 (=> (not res!581562) (not e!477231))))

(assert (=> b!856160 (= res!581562 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23992 _keys!868))))))

(declare-fun b!856161 () Bool)

(declare-fun e!477230 () Bool)

(assert (=> b!856161 (= e!477231 e!477230)))

(declare-fun res!581555 () Bool)

(assert (=> b!856161 (=> (not res!581555) (not e!477230))))

(assert (=> b!856161 (= res!581555 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!26953 0))(
  ( (V!26954 (val!8262 Int)) )
))
(declare-datatypes ((ValueCell!7775 0))(
  ( (ValueCellFull!7775 (v!10681 V!26953)) (EmptyCell!7775) )
))
(declare-datatypes ((array!49039 0))(
  ( (array!49040 (arr!23551 (Array (_ BitVec 32) ValueCell!7775)) (size!23993 (_ BitVec 32))) )
))
(declare-fun lt!385708 () array!49039)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10902 0))(
  ( (tuple2!10903 (_1!5462 (_ BitVec 64)) (_2!5462 V!26953)) )
))
(declare-datatypes ((List!16708 0))(
  ( (Nil!16705) (Cons!16704 (h!17835 tuple2!10902) (t!23340 List!16708)) )
))
(declare-datatypes ((ListLongMap!9661 0))(
  ( (ListLongMap!9662 (toList!4846 List!16708)) )
))
(declare-fun lt!385707 () ListLongMap!9661)

(declare-fun minValue!654 () V!26953)

(declare-fun zeroValue!654 () V!26953)

(declare-fun getCurrentListMapNoExtraKeys!2853 (array!49037 array!49039 (_ BitVec 32) (_ BitVec 32) V!26953 V!26953 (_ BitVec 32) Int) ListLongMap!9661)

(assert (=> b!856161 (= lt!385707 (getCurrentListMapNoExtraKeys!2853 _keys!868 lt!385708 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26953)

(declare-fun _values!688 () array!49039)

(assert (=> b!856161 (= lt!385708 (array!49040 (store (arr!23551 _values!688) i!612 (ValueCellFull!7775 v!557)) (size!23993 _values!688)))))

(declare-fun lt!385706 () ListLongMap!9661)

(assert (=> b!856161 (= lt!385706 (getCurrentListMapNoExtraKeys!2853 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!26243 () Bool)

(declare-fun tp!50384 () Bool)

(declare-fun e!477234 () Bool)

(assert (=> mapNonEmpty!26243 (= mapRes!26243 (and tp!50384 e!477234))))

(declare-fun mapRest!26243 () (Array (_ BitVec 32) ValueCell!7775))

(declare-fun mapValue!26243 () ValueCell!7775)

(declare-fun mapKey!26243 () (_ BitVec 32))

(assert (=> mapNonEmpty!26243 (= (arr!23551 _values!688) (store mapRest!26243 mapKey!26243 mapValue!26243))))

(declare-fun b!856162 () Bool)

(assert (=> b!856162 (= e!477230 (not true))))

(declare-fun +!2225 (ListLongMap!9661 tuple2!10902) ListLongMap!9661)

(assert (=> b!856162 (= (getCurrentListMapNoExtraKeys!2853 _keys!868 lt!385708 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2225 (getCurrentListMapNoExtraKeys!2853 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10903 k0!854 v!557)))))

(declare-datatypes ((Unit!29119 0))(
  ( (Unit!29120) )
))
(declare-fun lt!385709 () Unit!29119)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!422 (array!49037 array!49039 (_ BitVec 32) (_ BitVec 32) V!26953 V!26953 (_ BitVec 32) (_ BitVec 64) V!26953 (_ BitVec 32) Int) Unit!29119)

(assert (=> b!856162 (= lt!385709 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!422 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!856163 () Bool)

(declare-fun e!477232 () Bool)

(declare-fun e!477229 () Bool)

(assert (=> b!856163 (= e!477232 (and e!477229 mapRes!26243))))

(declare-fun condMapEmpty!26243 () Bool)

(declare-fun mapDefault!26243 () ValueCell!7775)

(assert (=> b!856163 (= condMapEmpty!26243 (= (arr!23551 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7775)) mapDefault!26243)))))

(declare-fun b!856164 () Bool)

(declare-fun res!581557 () Bool)

(assert (=> b!856164 (=> (not res!581557) (not e!477231))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856164 (= res!581557 (validKeyInArray!0 k0!854))))

(declare-fun b!856166 () Bool)

(declare-fun res!581560 () Bool)

(assert (=> b!856166 (=> (not res!581560) (not e!477231))))

(assert (=> b!856166 (= res!581560 (and (= (size!23993 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23992 _keys!868) (size!23993 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856167 () Bool)

(declare-fun tp_is_empty!16429 () Bool)

(assert (=> b!856167 (= e!477229 tp_is_empty!16429)))

(declare-fun b!856168 () Bool)

(declare-fun res!581554 () Bool)

(assert (=> b!856168 (=> (not res!581554) (not e!477231))))

(declare-datatypes ((List!16709 0))(
  ( (Nil!16706) (Cons!16705 (h!17836 (_ BitVec 64)) (t!23341 List!16709)) )
))
(declare-fun arrayNoDuplicates!0 (array!49037 (_ BitVec 32) List!16709) Bool)

(assert (=> b!856168 (= res!581554 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16706))))

(declare-fun b!856169 () Bool)

(declare-fun res!581559 () Bool)

(assert (=> b!856169 (=> (not res!581559) (not e!477231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856169 (= res!581559 (validMask!0 mask!1196))))

(declare-fun b!856170 () Bool)

(assert (=> b!856170 (= e!477234 tp_is_empty!16429)))

(declare-fun res!581561 () Bool)

(assert (=> start!73360 (=> (not res!581561) (not e!477231))))

(assert (=> start!73360 (= res!581561 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23992 _keys!868))))))

(assert (=> start!73360 e!477231))

(assert (=> start!73360 tp_is_empty!16429))

(assert (=> start!73360 true))

(assert (=> start!73360 tp!50383))

(declare-fun array_inv!18724 (array!49037) Bool)

(assert (=> start!73360 (array_inv!18724 _keys!868)))

(declare-fun array_inv!18725 (array!49039) Bool)

(assert (=> start!73360 (and (array_inv!18725 _values!688) e!477232)))

(declare-fun b!856165 () Bool)

(declare-fun res!581556 () Bool)

(assert (=> b!856165 (=> (not res!581556) (not e!477231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49037 (_ BitVec 32)) Bool)

(assert (=> b!856165 (= res!581556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!73360 res!581561) b!856169))

(assert (= (and b!856169 res!581559) b!856166))

(assert (= (and b!856166 res!581560) b!856165))

(assert (= (and b!856165 res!581556) b!856168))

(assert (= (and b!856168 res!581554) b!856160))

(assert (= (and b!856160 res!581562) b!856164))

(assert (= (and b!856164 res!581557) b!856159))

(assert (= (and b!856159 res!581558) b!856161))

(assert (= (and b!856161 res!581555) b!856162))

(assert (= (and b!856163 condMapEmpty!26243) mapIsEmpty!26243))

(assert (= (and b!856163 (not condMapEmpty!26243)) mapNonEmpty!26243))

(get-info :version)

(assert (= (and mapNonEmpty!26243 ((_ is ValueCellFull!7775) mapValue!26243)) b!856170))

(assert (= (and b!856163 ((_ is ValueCellFull!7775) mapDefault!26243)) b!856167))

(assert (= start!73360 b!856163))

(declare-fun m!796593 () Bool)

(assert (=> mapNonEmpty!26243 m!796593))

(declare-fun m!796595 () Bool)

(assert (=> b!856161 m!796595))

(declare-fun m!796597 () Bool)

(assert (=> b!856161 m!796597))

(declare-fun m!796599 () Bool)

(assert (=> b!856161 m!796599))

(declare-fun m!796601 () Bool)

(assert (=> b!856159 m!796601))

(declare-fun m!796603 () Bool)

(assert (=> b!856168 m!796603))

(declare-fun m!796605 () Bool)

(assert (=> b!856169 m!796605))

(declare-fun m!796607 () Bool)

(assert (=> b!856162 m!796607))

(declare-fun m!796609 () Bool)

(assert (=> b!856162 m!796609))

(assert (=> b!856162 m!796609))

(declare-fun m!796611 () Bool)

(assert (=> b!856162 m!796611))

(declare-fun m!796613 () Bool)

(assert (=> b!856162 m!796613))

(declare-fun m!796615 () Bool)

(assert (=> start!73360 m!796615))

(declare-fun m!796617 () Bool)

(assert (=> start!73360 m!796617))

(declare-fun m!796619 () Bool)

(assert (=> b!856165 m!796619))

(declare-fun m!796621 () Bool)

(assert (=> b!856164 m!796621))

(check-sat (not mapNonEmpty!26243) (not b!856161) (not b!856168) (not b!856164) b_and!23623 (not b!856165) (not b_next!14293) (not start!73360) (not b!856169) (not b!856162) tp_is_empty!16429)
(check-sat b_and!23623 (not b_next!14293))
