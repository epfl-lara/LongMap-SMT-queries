; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73384 () Bool)

(assert start!73384)

(declare-fun b_free!14317 () Bool)

(declare-fun b_next!14317 () Bool)

(assert (=> start!73384 (= b_free!14317 (not b_next!14317))))

(declare-fun tp!50456 () Bool)

(declare-fun b_and!23647 () Bool)

(assert (=> start!73384 (= tp!50456 b_and!23647)))

(declare-fun b!856591 () Bool)

(declare-fun res!581882 () Bool)

(declare-fun e!477445 () Bool)

(assert (=> b!856591 (=> (not res!581882) (not e!477445))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856591 (= res!581882 (validKeyInArray!0 k0!854))))

(declare-fun b!856592 () Bool)

(declare-fun res!581881 () Bool)

(assert (=> b!856592 (=> (not res!581881) (not e!477445))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49081 0))(
  ( (array!49082 (arr!23572 (Array (_ BitVec 32) (_ BitVec 64))) (size!24014 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49081)

(declare-datatypes ((V!26985 0))(
  ( (V!26986 (val!8274 Int)) )
))
(declare-datatypes ((ValueCell!7787 0))(
  ( (ValueCellFull!7787 (v!10693 V!26985)) (EmptyCell!7787) )
))
(declare-datatypes ((array!49083 0))(
  ( (array!49084 (arr!23573 (Array (_ BitVec 32) ValueCell!7787)) (size!24015 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49083)

(assert (=> b!856592 (= res!581881 (and (= (size!24015 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24014 _keys!868) (size!24015 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856593 () Bool)

(declare-fun e!477448 () Bool)

(declare-fun e!477447 () Bool)

(declare-fun mapRes!26279 () Bool)

(assert (=> b!856593 (= e!477448 (and e!477447 mapRes!26279))))

(declare-fun condMapEmpty!26279 () Bool)

(declare-fun mapDefault!26279 () ValueCell!7787)

(assert (=> b!856593 (= condMapEmpty!26279 (= (arr!23573 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7787)) mapDefault!26279)))))

(declare-fun b!856594 () Bool)

(declare-fun res!581878 () Bool)

(assert (=> b!856594 (=> (not res!581878) (not e!477445))))

(declare-datatypes ((List!16724 0))(
  ( (Nil!16721) (Cons!16720 (h!17851 (_ BitVec 64)) (t!23356 List!16724)) )
))
(declare-fun arrayNoDuplicates!0 (array!49081 (_ BitVec 32) List!16724) Bool)

(assert (=> b!856594 (= res!581878 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16721))))

(declare-fun mapIsEmpty!26279 () Bool)

(assert (=> mapIsEmpty!26279 mapRes!26279))

(declare-fun res!581879 () Bool)

(assert (=> start!73384 (=> (not res!581879) (not e!477445))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73384 (= res!581879 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24014 _keys!868))))))

(assert (=> start!73384 e!477445))

(declare-fun tp_is_empty!16453 () Bool)

(assert (=> start!73384 tp_is_empty!16453))

(assert (=> start!73384 true))

(assert (=> start!73384 tp!50456))

(declare-fun array_inv!18736 (array!49081) Bool)

(assert (=> start!73384 (array_inv!18736 _keys!868)))

(declare-fun array_inv!18737 (array!49083) Bool)

(assert (=> start!73384 (and (array_inv!18737 _values!688) e!477448)))

(declare-fun b!856595 () Bool)

(declare-fun e!477446 () Bool)

(assert (=> b!856595 (= e!477445 e!477446)))

(declare-fun res!581883 () Bool)

(assert (=> b!856595 (=> (not res!581883) (not e!477446))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!856595 (= res!581883 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10920 0))(
  ( (tuple2!10921 (_1!5471 (_ BitVec 64)) (_2!5471 V!26985)) )
))
(declare-datatypes ((List!16725 0))(
  ( (Nil!16722) (Cons!16721 (h!17852 tuple2!10920) (t!23357 List!16725)) )
))
(declare-datatypes ((ListLongMap!9679 0))(
  ( (ListLongMap!9680 (toList!4855 List!16725)) )
))
(declare-fun lt!385851 () ListLongMap!9679)

(declare-fun lt!385852 () array!49083)

(declare-fun minValue!654 () V!26985)

(declare-fun zeroValue!654 () V!26985)

(declare-fun getCurrentListMapNoExtraKeys!2862 (array!49081 array!49083 (_ BitVec 32) (_ BitVec 32) V!26985 V!26985 (_ BitVec 32) Int) ListLongMap!9679)

(assert (=> b!856595 (= lt!385851 (getCurrentListMapNoExtraKeys!2862 _keys!868 lt!385852 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26985)

(assert (=> b!856595 (= lt!385852 (array!49084 (store (arr!23573 _values!688) i!612 (ValueCellFull!7787 v!557)) (size!24015 _values!688)))))

(declare-fun lt!385850 () ListLongMap!9679)

(assert (=> b!856595 (= lt!385850 (getCurrentListMapNoExtraKeys!2862 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!856596 () Bool)

(assert (=> b!856596 (= e!477446 (not true))))

(declare-fun +!2232 (ListLongMap!9679 tuple2!10920) ListLongMap!9679)

(assert (=> b!856596 (= (getCurrentListMapNoExtraKeys!2862 _keys!868 lt!385852 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2232 (getCurrentListMapNoExtraKeys!2862 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10921 k0!854 v!557)))))

(declare-datatypes ((Unit!29133 0))(
  ( (Unit!29134) )
))
(declare-fun lt!385853 () Unit!29133)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!429 (array!49081 array!49083 (_ BitVec 32) (_ BitVec 32) V!26985 V!26985 (_ BitVec 32) (_ BitVec 64) V!26985 (_ BitVec 32) Int) Unit!29133)

(assert (=> b!856596 (= lt!385853 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!429 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!856597 () Bool)

(declare-fun res!581886 () Bool)

(assert (=> b!856597 (=> (not res!581886) (not e!477445))))

(assert (=> b!856597 (= res!581886 (and (= (select (arr!23572 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!856598 () Bool)

(assert (=> b!856598 (= e!477447 tp_is_empty!16453)))

(declare-fun b!856599 () Bool)

(declare-fun e!477450 () Bool)

(assert (=> b!856599 (= e!477450 tp_is_empty!16453)))

(declare-fun mapNonEmpty!26279 () Bool)

(declare-fun tp!50455 () Bool)

(assert (=> mapNonEmpty!26279 (= mapRes!26279 (and tp!50455 e!477450))))

(declare-fun mapRest!26279 () (Array (_ BitVec 32) ValueCell!7787))

(declare-fun mapValue!26279 () ValueCell!7787)

(declare-fun mapKey!26279 () (_ BitVec 32))

(assert (=> mapNonEmpty!26279 (= (arr!23573 _values!688) (store mapRest!26279 mapKey!26279 mapValue!26279))))

(declare-fun b!856600 () Bool)

(declare-fun res!581884 () Bool)

(assert (=> b!856600 (=> (not res!581884) (not e!477445))))

(assert (=> b!856600 (= res!581884 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24014 _keys!868))))))

(declare-fun b!856601 () Bool)

(declare-fun res!581885 () Bool)

(assert (=> b!856601 (=> (not res!581885) (not e!477445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856601 (= res!581885 (validMask!0 mask!1196))))

(declare-fun b!856602 () Bool)

(declare-fun res!581880 () Bool)

(assert (=> b!856602 (=> (not res!581880) (not e!477445))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49081 (_ BitVec 32)) Bool)

(assert (=> b!856602 (= res!581880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!73384 res!581879) b!856601))

(assert (= (and b!856601 res!581885) b!856592))

(assert (= (and b!856592 res!581881) b!856602))

(assert (= (and b!856602 res!581880) b!856594))

(assert (= (and b!856594 res!581878) b!856600))

(assert (= (and b!856600 res!581884) b!856591))

(assert (= (and b!856591 res!581882) b!856597))

(assert (= (and b!856597 res!581886) b!856595))

(assert (= (and b!856595 res!581883) b!856596))

(assert (= (and b!856593 condMapEmpty!26279) mapIsEmpty!26279))

(assert (= (and b!856593 (not condMapEmpty!26279)) mapNonEmpty!26279))

(get-info :version)

(assert (= (and mapNonEmpty!26279 ((_ is ValueCellFull!7787) mapValue!26279)) b!856599))

(assert (= (and b!856593 ((_ is ValueCellFull!7787) mapDefault!26279)) b!856598))

(assert (= start!73384 b!856593))

(declare-fun m!796953 () Bool)

(assert (=> b!856601 m!796953))

(declare-fun m!796955 () Bool)

(assert (=> b!856602 m!796955))

(declare-fun m!796957 () Bool)

(assert (=> b!856595 m!796957))

(declare-fun m!796959 () Bool)

(assert (=> b!856595 m!796959))

(declare-fun m!796961 () Bool)

(assert (=> b!856595 m!796961))

(declare-fun m!796963 () Bool)

(assert (=> b!856597 m!796963))

(declare-fun m!796965 () Bool)

(assert (=> b!856596 m!796965))

(declare-fun m!796967 () Bool)

(assert (=> b!856596 m!796967))

(assert (=> b!856596 m!796967))

(declare-fun m!796969 () Bool)

(assert (=> b!856596 m!796969))

(declare-fun m!796971 () Bool)

(assert (=> b!856596 m!796971))

(declare-fun m!796973 () Bool)

(assert (=> mapNonEmpty!26279 m!796973))

(declare-fun m!796975 () Bool)

(assert (=> b!856594 m!796975))

(declare-fun m!796977 () Bool)

(assert (=> start!73384 m!796977))

(declare-fun m!796979 () Bool)

(assert (=> start!73384 m!796979))

(declare-fun m!796981 () Bool)

(assert (=> b!856591 m!796981))

(check-sat (not start!73384) (not b!856594) (not b_next!14317) (not b!856596) (not b!856602) tp_is_empty!16453 (not mapNonEmpty!26279) (not b!856601) b_and!23647 (not b!856591) (not b!856595))
(check-sat b_and!23647 (not b_next!14317))
