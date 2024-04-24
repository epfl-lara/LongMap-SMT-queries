; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73690 () Bool)

(assert start!73690)

(declare-fun b_free!14437 () Bool)

(declare-fun b_next!14437 () Bool)

(assert (=> start!73690 (= b_free!14437 (not b_next!14437))))

(declare-fun tp!50815 () Bool)

(declare-fun b_and!23863 () Bool)

(assert (=> start!73690 (= tp!50815 b_and!23863)))

(declare-fun b!860101 () Bool)

(declare-fun e!479408 () Bool)

(declare-fun e!479404 () Bool)

(declare-fun mapRes!26459 () Bool)

(assert (=> b!860101 (= e!479408 (and e!479404 mapRes!26459))))

(declare-fun condMapEmpty!26459 () Bool)

(declare-datatypes ((V!27145 0))(
  ( (V!27146 (val!8334 Int)) )
))
(declare-datatypes ((ValueCell!7847 0))(
  ( (ValueCellFull!7847 (v!10759 V!27145)) (EmptyCell!7847) )
))
(declare-datatypes ((array!49375 0))(
  ( (array!49376 (arr!23714 (Array (_ BitVec 32) ValueCell!7847)) (size!24155 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49375)

(declare-fun mapDefault!26459 () ValueCell!7847)

(assert (=> b!860101 (= condMapEmpty!26459 (= (arr!23714 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7847)) mapDefault!26459)))))

(declare-fun b!860102 () Bool)

(declare-fun res!584102 () Bool)

(declare-fun e!479406 () Bool)

(assert (=> b!860102 (=> (not res!584102) (not e!479406))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!860102 (= res!584102 (validKeyInArray!0 k0!854))))

(declare-fun b!860103 () Bool)

(declare-fun e!479410 () Bool)

(assert (=> b!860103 (= e!479406 e!479410)))

(declare-fun res!584100 () Bool)

(assert (=> b!860103 (=> (not res!584100) (not e!479410))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!860103 (= res!584100 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!387490 () array!49375)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!10928 0))(
  ( (tuple2!10929 (_1!5475 (_ BitVec 64)) (_2!5475 V!27145)) )
))
(declare-datatypes ((List!16767 0))(
  ( (Nil!16764) (Cons!16763 (h!17900 tuple2!10928) (t!23462 List!16767)) )
))
(declare-datatypes ((ListLongMap!9699 0))(
  ( (ListLongMap!9700 (toList!4865 List!16767)) )
))
(declare-fun lt!387493 () ListLongMap!9699)

(declare-datatypes ((array!49377 0))(
  ( (array!49378 (arr!23715 (Array (_ BitVec 32) (_ BitVec 64))) (size!24156 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49377)

(declare-fun minValue!654 () V!27145)

(declare-fun zeroValue!654 () V!27145)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2921 (array!49377 array!49375 (_ BitVec 32) (_ BitVec 32) V!27145 V!27145 (_ BitVec 32) Int) ListLongMap!9699)

(assert (=> b!860103 (= lt!387493 (getCurrentListMapNoExtraKeys!2921 _keys!868 lt!387490 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27145)

(assert (=> b!860103 (= lt!387490 (array!49376 (store (arr!23714 _values!688) i!612 (ValueCellFull!7847 v!557)) (size!24155 _values!688)))))

(declare-fun lt!387497 () ListLongMap!9699)

(assert (=> b!860103 (= lt!387497 (getCurrentListMapNoExtraKeys!2921 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!860104 () Bool)

(declare-fun e!479405 () Bool)

(assert (=> b!860104 (= e!479410 (not e!479405))))

(declare-fun res!584105 () Bool)

(assert (=> b!860104 (=> res!584105 e!479405)))

(assert (=> b!860104 (= res!584105 (not (validKeyInArray!0 (select (arr!23715 _keys!868) from!1053))))))

(declare-fun lt!387492 () ListLongMap!9699)

(declare-fun lt!387495 () ListLongMap!9699)

(assert (=> b!860104 (= lt!387492 lt!387495)))

(declare-fun lt!387496 () ListLongMap!9699)

(declare-fun +!2271 (ListLongMap!9699 tuple2!10928) ListLongMap!9699)

(assert (=> b!860104 (= lt!387495 (+!2271 lt!387496 (tuple2!10929 k0!854 v!557)))))

(assert (=> b!860104 (= lt!387492 (getCurrentListMapNoExtraKeys!2921 _keys!868 lt!387490 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!860104 (= lt!387496 (getCurrentListMapNoExtraKeys!2921 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29296 0))(
  ( (Unit!29297) )
))
(declare-fun lt!387494 () Unit!29296)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!467 (array!49377 array!49375 (_ BitVec 32) (_ BitVec 32) V!27145 V!27145 (_ BitVec 32) (_ BitVec 64) V!27145 (_ BitVec 32) Int) Unit!29296)

(assert (=> b!860104 (= lt!387494 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!467 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!860105 () Bool)

(declare-fun e!479403 () Bool)

(assert (=> b!860105 (= e!479403 true)))

(declare-datatypes ((List!16768 0))(
  ( (Nil!16765) (Cons!16764 (h!17901 (_ BitVec 64)) (t!23463 List!16768)) )
))
(declare-fun arrayNoDuplicates!0 (array!49377 (_ BitVec 32) List!16768) Bool)

(assert (=> b!860105 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16765)))

(declare-fun lt!387491 () Unit!29296)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49377 (_ BitVec 32) (_ BitVec 32)) Unit!29296)

(assert (=> b!860105 (= lt!387491 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!860106 () Bool)

(declare-fun tp_is_empty!16573 () Bool)

(assert (=> b!860106 (= e!479404 tp_is_empty!16573)))

(declare-fun b!860107 () Bool)

(declare-fun res!584101 () Bool)

(assert (=> b!860107 (=> (not res!584101) (not e!479406))))

(assert (=> b!860107 (= res!584101 (and (= (select (arr!23715 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!860108 () Bool)

(declare-fun res!584104 () Bool)

(assert (=> b!860108 (=> (not res!584104) (not e!479406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!860108 (= res!584104 (validMask!0 mask!1196))))

(declare-fun res!584106 () Bool)

(assert (=> start!73690 (=> (not res!584106) (not e!479406))))

(assert (=> start!73690 (= res!584106 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24156 _keys!868))))))

(assert (=> start!73690 e!479406))

(assert (=> start!73690 tp_is_empty!16573))

(assert (=> start!73690 true))

(assert (=> start!73690 tp!50815))

(declare-fun array_inv!18824 (array!49377) Bool)

(assert (=> start!73690 (array_inv!18824 _keys!868)))

(declare-fun array_inv!18825 (array!49375) Bool)

(assert (=> start!73690 (and (array_inv!18825 _values!688) e!479408)))

(declare-fun mapNonEmpty!26459 () Bool)

(declare-fun tp!50816 () Bool)

(declare-fun e!479409 () Bool)

(assert (=> mapNonEmpty!26459 (= mapRes!26459 (and tp!50816 e!479409))))

(declare-fun mapValue!26459 () ValueCell!7847)

(declare-fun mapRest!26459 () (Array (_ BitVec 32) ValueCell!7847))

(declare-fun mapKey!26459 () (_ BitVec 32))

(assert (=> mapNonEmpty!26459 (= (arr!23714 _values!688) (store mapRest!26459 mapKey!26459 mapValue!26459))))

(declare-fun b!860109 () Bool)

(assert (=> b!860109 (= e!479405 e!479403)))

(declare-fun res!584103 () Bool)

(assert (=> b!860109 (=> res!584103 e!479403)))

(assert (=> b!860109 (= res!584103 (not (= (select (arr!23715 _keys!868) from!1053) k0!854)))))

(declare-fun get!12500 (ValueCell!7847 V!27145) V!27145)

(declare-fun dynLambda!1104 (Int (_ BitVec 64)) V!27145)

(assert (=> b!860109 (= lt!387493 (+!2271 lt!387495 (tuple2!10929 (select (arr!23715 _keys!868) from!1053) (get!12500 (select (arr!23714 _values!688) from!1053) (dynLambda!1104 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!860110 () Bool)

(declare-fun res!584109 () Bool)

(assert (=> b!860110 (=> (not res!584109) (not e!479406))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49377 (_ BitVec 32)) Bool)

(assert (=> b!860110 (= res!584109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!860111 () Bool)

(declare-fun res!584110 () Bool)

(assert (=> b!860111 (=> (not res!584110) (not e!479406))))

(assert (=> b!860111 (= res!584110 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24156 _keys!868))))))

(declare-fun b!860112 () Bool)

(declare-fun res!584108 () Bool)

(assert (=> b!860112 (=> (not res!584108) (not e!479406))))

(assert (=> b!860112 (= res!584108 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16765))))

(declare-fun b!860113 () Bool)

(assert (=> b!860113 (= e!479409 tp_is_empty!16573)))

(declare-fun b!860114 () Bool)

(declare-fun res!584107 () Bool)

(assert (=> b!860114 (=> (not res!584107) (not e!479406))))

(assert (=> b!860114 (= res!584107 (and (= (size!24155 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24156 _keys!868) (size!24155 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!26459 () Bool)

(assert (=> mapIsEmpty!26459 mapRes!26459))

(assert (= (and start!73690 res!584106) b!860108))

(assert (= (and b!860108 res!584104) b!860114))

(assert (= (and b!860114 res!584107) b!860110))

(assert (= (and b!860110 res!584109) b!860112))

(assert (= (and b!860112 res!584108) b!860111))

(assert (= (and b!860111 res!584110) b!860102))

(assert (= (and b!860102 res!584102) b!860107))

(assert (= (and b!860107 res!584101) b!860103))

(assert (= (and b!860103 res!584100) b!860104))

(assert (= (and b!860104 (not res!584105)) b!860109))

(assert (= (and b!860109 (not res!584103)) b!860105))

(assert (= (and b!860101 condMapEmpty!26459) mapIsEmpty!26459))

(assert (= (and b!860101 (not condMapEmpty!26459)) mapNonEmpty!26459))

(get-info :version)

(assert (= (and mapNonEmpty!26459 ((_ is ValueCellFull!7847) mapValue!26459)) b!860113))

(assert (= (and b!860101 ((_ is ValueCellFull!7847) mapDefault!26459)) b!860106))

(assert (= start!73690 b!860101))

(declare-fun b_lambda!11803 () Bool)

(assert (=> (not b_lambda!11803) (not b!860109)))

(declare-fun t!23461 () Bool)

(declare-fun tb!4551 () Bool)

(assert (=> (and start!73690 (= defaultEntry!696 defaultEntry!696) t!23461) tb!4551))

(declare-fun result!8721 () Bool)

(assert (=> tb!4551 (= result!8721 tp_is_empty!16573)))

(assert (=> b!860109 t!23461))

(declare-fun b_and!23865 () Bool)

(assert (= b_and!23863 (and (=> t!23461 result!8721) b_and!23865)))

(declare-fun m!801233 () Bool)

(assert (=> b!860108 m!801233))

(declare-fun m!801235 () Bool)

(assert (=> b!860102 m!801235))

(declare-fun m!801237 () Bool)

(assert (=> b!860109 m!801237))

(declare-fun m!801239 () Bool)

(assert (=> b!860109 m!801239))

(declare-fun m!801241 () Bool)

(assert (=> b!860109 m!801241))

(declare-fun m!801243 () Bool)

(assert (=> b!860109 m!801243))

(assert (=> b!860109 m!801239))

(declare-fun m!801245 () Bool)

(assert (=> b!860109 m!801245))

(assert (=> b!860109 m!801241))

(declare-fun m!801247 () Bool)

(assert (=> start!73690 m!801247))

(declare-fun m!801249 () Bool)

(assert (=> start!73690 m!801249))

(declare-fun m!801251 () Bool)

(assert (=> b!860104 m!801251))

(declare-fun m!801253 () Bool)

(assert (=> b!860104 m!801253))

(assert (=> b!860104 m!801245))

(declare-fun m!801255 () Bool)

(assert (=> b!860104 m!801255))

(assert (=> b!860104 m!801245))

(declare-fun m!801257 () Bool)

(assert (=> b!860104 m!801257))

(declare-fun m!801259 () Bool)

(assert (=> b!860104 m!801259))

(declare-fun m!801261 () Bool)

(assert (=> b!860112 m!801261))

(declare-fun m!801263 () Bool)

(assert (=> mapNonEmpty!26459 m!801263))

(declare-fun m!801265 () Bool)

(assert (=> b!860103 m!801265))

(declare-fun m!801267 () Bool)

(assert (=> b!860103 m!801267))

(declare-fun m!801269 () Bool)

(assert (=> b!860103 m!801269))

(declare-fun m!801271 () Bool)

(assert (=> b!860107 m!801271))

(declare-fun m!801273 () Bool)

(assert (=> b!860110 m!801273))

(declare-fun m!801275 () Bool)

(assert (=> b!860105 m!801275))

(declare-fun m!801277 () Bool)

(assert (=> b!860105 m!801277))

(check-sat (not b!860112) (not mapNonEmpty!26459) (not b_lambda!11803) (not b!860104) (not b!860108) (not start!73690) (not b!860105) (not b_next!14437) b_and!23865 (not b!860110) (not b!860102) tp_is_empty!16573 (not b!860103) (not b!860109))
(check-sat b_and!23865 (not b_next!14437))
