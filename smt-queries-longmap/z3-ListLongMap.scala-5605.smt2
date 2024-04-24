; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73582 () Bool)

(assert start!73582)

(declare-fun b_free!14329 () Bool)

(declare-fun b_next!14329 () Bool)

(assert (=> start!73582 (= b_free!14329 (not b_next!14329))))

(declare-fun tp!50491 () Bool)

(declare-fun b_and!23695 () Bool)

(assert (=> start!73582 (= tp!50491 b_and!23695)))

(declare-fun b!857949 () Bool)

(declare-fun e!478285 () Bool)

(declare-fun e!478284 () Bool)

(declare-fun mapRes!26297 () Bool)

(assert (=> b!857949 (= e!478285 (and e!478284 mapRes!26297))))

(declare-fun condMapEmpty!26297 () Bool)

(declare-datatypes ((V!27001 0))(
  ( (V!27002 (val!8280 Int)) )
))
(declare-datatypes ((ValueCell!7793 0))(
  ( (ValueCellFull!7793 (v!10705 V!27001)) (EmptyCell!7793) )
))
(declare-datatypes ((array!49167 0))(
  ( (array!49168 (arr!23610 (Array (_ BitVec 32) ValueCell!7793)) (size!24051 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49167)

(declare-fun mapDefault!26297 () ValueCell!7793)

(assert (=> b!857949 (= condMapEmpty!26297 (= (arr!23610 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7793)) mapDefault!26297)))))

(declare-fun b!857950 () Bool)

(declare-fun res!582496 () Bool)

(declare-fun e!478288 () Bool)

(assert (=> b!857950 (=> (not res!582496) (not e!478288))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49169 0))(
  ( (array!49170 (arr!23611 (Array (_ BitVec 32) (_ BitVec 64))) (size!24052 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49169)

(assert (=> b!857950 (= res!582496 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24052 _keys!868))))))

(declare-fun b!857951 () Bool)

(declare-fun res!582502 () Bool)

(assert (=> b!857951 (=> (not res!582502) (not e!478288))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857951 (= res!582502 (validMask!0 mask!1196))))

(declare-fun b!857952 () Bool)

(declare-fun res!582501 () Bool)

(assert (=> b!857952 (=> (not res!582501) (not e!478288))))

(declare-datatypes ((List!16685 0))(
  ( (Nil!16682) (Cons!16681 (h!17818 (_ BitVec 64)) (t!23318 List!16685)) )
))
(declare-fun arrayNoDuplicates!0 (array!49169 (_ BitVec 32) List!16685) Bool)

(assert (=> b!857952 (= res!582501 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16682))))

(declare-fun res!582495 () Bool)

(assert (=> start!73582 (=> (not res!582495) (not e!478288))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73582 (= res!582495 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24052 _keys!868))))))

(assert (=> start!73582 e!478288))

(declare-fun tp_is_empty!16465 () Bool)

(assert (=> start!73582 tp_is_empty!16465))

(assert (=> start!73582 true))

(assert (=> start!73582 tp!50491))

(declare-fun array_inv!18756 (array!49169) Bool)

(assert (=> start!73582 (array_inv!18756 _keys!868)))

(declare-fun array_inv!18757 (array!49167) Bool)

(assert (=> start!73582 (and (array_inv!18757 _values!688) e!478285)))

(declare-fun b!857953 () Bool)

(declare-fun e!478283 () Bool)

(assert (=> b!857953 (= e!478288 e!478283)))

(declare-fun res!582498 () Bool)

(assert (=> b!857953 (=> (not res!582498) (not e!478283))))

(assert (=> b!857953 (= res!582498 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!386520 () array!49167)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10840 0))(
  ( (tuple2!10841 (_1!5431 (_ BitVec 64)) (_2!5431 V!27001)) )
))
(declare-datatypes ((List!16686 0))(
  ( (Nil!16683) (Cons!16682 (h!17819 tuple2!10840) (t!23319 List!16686)) )
))
(declare-datatypes ((ListLongMap!9611 0))(
  ( (ListLongMap!9612 (toList!4821 List!16686)) )
))
(declare-fun lt!386521 () ListLongMap!9611)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27001)

(declare-fun zeroValue!654 () V!27001)

(declare-fun getCurrentListMapNoExtraKeys!2877 (array!49169 array!49167 (_ BitVec 32) (_ BitVec 32) V!27001 V!27001 (_ BitVec 32) Int) ListLongMap!9611)

(assert (=> b!857953 (= lt!386521 (getCurrentListMapNoExtraKeys!2877 _keys!868 lt!386520 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27001)

(assert (=> b!857953 (= lt!386520 (array!49168 (store (arr!23610 _values!688) i!612 (ValueCellFull!7793 v!557)) (size!24051 _values!688)))))

(declare-fun lt!386519 () ListLongMap!9611)

(assert (=> b!857953 (= lt!386519 (getCurrentListMapNoExtraKeys!2877 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!26297 () Bool)

(declare-fun tp!50492 () Bool)

(declare-fun e!478287 () Bool)

(assert (=> mapNonEmpty!26297 (= mapRes!26297 (and tp!50492 e!478287))))

(declare-fun mapRest!26297 () (Array (_ BitVec 32) ValueCell!7793))

(declare-fun mapKey!26297 () (_ BitVec 32))

(declare-fun mapValue!26297 () ValueCell!7793)

(assert (=> mapNonEmpty!26297 (= (arr!23610 _values!688) (store mapRest!26297 mapKey!26297 mapValue!26297))))

(declare-fun b!857954 () Bool)

(declare-fun res!582499 () Bool)

(assert (=> b!857954 (=> (not res!582499) (not e!478288))))

(assert (=> b!857954 (= res!582499 (and (= (size!24051 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24052 _keys!868) (size!24051 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!857955 () Bool)

(assert (=> b!857955 (= e!478284 tp_is_empty!16465)))

(declare-fun b!857956 () Bool)

(declare-fun res!582497 () Bool)

(assert (=> b!857956 (=> (not res!582497) (not e!478288))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49169 (_ BitVec 32)) Bool)

(assert (=> b!857956 (= res!582497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857957 () Bool)

(assert (=> b!857957 (= e!478283 (not true))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2232 (ListLongMap!9611 tuple2!10840) ListLongMap!9611)

(assert (=> b!857957 (= (getCurrentListMapNoExtraKeys!2877 _keys!868 lt!386520 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2232 (getCurrentListMapNoExtraKeys!2877 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10841 k0!854 v!557)))))

(declare-datatypes ((Unit!29220 0))(
  ( (Unit!29221) )
))
(declare-fun lt!386522 () Unit!29220)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!430 (array!49169 array!49167 (_ BitVec 32) (_ BitVec 32) V!27001 V!27001 (_ BitVec 32) (_ BitVec 64) V!27001 (_ BitVec 32) Int) Unit!29220)

(assert (=> b!857957 (= lt!386522 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!430 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!857958 () Bool)

(declare-fun res!582500 () Bool)

(assert (=> b!857958 (=> (not res!582500) (not e!478288))))

(assert (=> b!857958 (= res!582500 (and (= (select (arr!23611 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!857959 () Bool)

(declare-fun res!582494 () Bool)

(assert (=> b!857959 (=> (not res!582494) (not e!478288))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857959 (= res!582494 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!26297 () Bool)

(assert (=> mapIsEmpty!26297 mapRes!26297))

(declare-fun b!857960 () Bool)

(assert (=> b!857960 (= e!478287 tp_is_empty!16465)))

(assert (= (and start!73582 res!582495) b!857951))

(assert (= (and b!857951 res!582502) b!857954))

(assert (= (and b!857954 res!582499) b!857956))

(assert (= (and b!857956 res!582497) b!857952))

(assert (= (and b!857952 res!582501) b!857950))

(assert (= (and b!857950 res!582496) b!857959))

(assert (= (and b!857959 res!582494) b!857958))

(assert (= (and b!857958 res!582500) b!857953))

(assert (= (and b!857953 res!582498) b!857957))

(assert (= (and b!857949 condMapEmpty!26297) mapIsEmpty!26297))

(assert (= (and b!857949 (not condMapEmpty!26297)) mapNonEmpty!26297))

(get-info :version)

(assert (= (and mapNonEmpty!26297 ((_ is ValueCellFull!7793) mapValue!26297)) b!857960))

(assert (= (and b!857949 ((_ is ValueCellFull!7793) mapDefault!26297)) b!857955))

(assert (= start!73582 b!857949))

(declare-fun m!799181 () Bool)

(assert (=> b!857953 m!799181))

(declare-fun m!799183 () Bool)

(assert (=> b!857953 m!799183))

(declare-fun m!799185 () Bool)

(assert (=> b!857953 m!799185))

(declare-fun m!799187 () Bool)

(assert (=> b!857951 m!799187))

(declare-fun m!799189 () Bool)

(assert (=> b!857959 m!799189))

(declare-fun m!799191 () Bool)

(assert (=> b!857957 m!799191))

(declare-fun m!799193 () Bool)

(assert (=> b!857957 m!799193))

(assert (=> b!857957 m!799193))

(declare-fun m!799195 () Bool)

(assert (=> b!857957 m!799195))

(declare-fun m!799197 () Bool)

(assert (=> b!857957 m!799197))

(declare-fun m!799199 () Bool)

(assert (=> b!857952 m!799199))

(declare-fun m!799201 () Bool)

(assert (=> b!857958 m!799201))

(declare-fun m!799203 () Bool)

(assert (=> start!73582 m!799203))

(declare-fun m!799205 () Bool)

(assert (=> start!73582 m!799205))

(declare-fun m!799207 () Bool)

(assert (=> b!857956 m!799207))

(declare-fun m!799209 () Bool)

(assert (=> mapNonEmpty!26297 m!799209))

(check-sat (not b!857951) (not b!857953) (not start!73582) (not mapNonEmpty!26297) b_and!23695 (not b!857956) (not b!857957) tp_is_empty!16465 (not b_next!14329) (not b!857959) (not b!857952))
(check-sat b_and!23695 (not b_next!14329))
