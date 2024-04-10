; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73428 () Bool)

(assert start!73428)

(declare-fun b_free!14343 () Bool)

(declare-fun b_next!14343 () Bool)

(assert (=> start!73428 (= b_free!14343 (not b_next!14343))))

(declare-fun tp!50532 () Bool)

(declare-fun b_and!23699 () Bool)

(assert (=> start!73428 (= tp!50532 b_and!23699)))

(declare-fun b!857298 () Bool)

(declare-fun res!582340 () Bool)

(declare-fun e!477830 () Bool)

(assert (=> b!857298 (=> (not res!582340) (not e!477830))))

(declare-datatypes ((array!49150 0))(
  ( (array!49151 (arr!23606 (Array (_ BitVec 32) (_ BitVec 64))) (size!24046 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49150)

(declare-datatypes ((List!16742 0))(
  ( (Nil!16739) (Cons!16738 (h!17869 (_ BitVec 64)) (t!23383 List!16742)) )
))
(declare-fun arrayNoDuplicates!0 (array!49150 (_ BitVec 32) List!16742) Bool)

(assert (=> b!857298 (= res!582340 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16739))))

(declare-fun mapIsEmpty!26318 () Bool)

(declare-fun mapRes!26318 () Bool)

(assert (=> mapIsEmpty!26318 mapRes!26318))

(declare-fun b!857299 () Bool)

(declare-fun res!582347 () Bool)

(assert (=> b!857299 (=> (not res!582347) (not e!477830))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857299 (= res!582347 (validMask!0 mask!1196))))

(declare-fun b!857300 () Bool)

(declare-fun e!477829 () Bool)

(declare-fun tp_is_empty!16479 () Bool)

(assert (=> b!857300 (= e!477829 tp_is_empty!16479)))

(declare-fun res!582342 () Bool)

(assert (=> start!73428 (=> (not res!582342) (not e!477830))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73428 (= res!582342 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24046 _keys!868))))))

(assert (=> start!73428 e!477830))

(assert (=> start!73428 tp_is_empty!16479))

(assert (=> start!73428 true))

(assert (=> start!73428 tp!50532))

(declare-fun array_inv!18694 (array!49150) Bool)

(assert (=> start!73428 (array_inv!18694 _keys!868)))

(declare-datatypes ((V!27019 0))(
  ( (V!27020 (val!8287 Int)) )
))
(declare-datatypes ((ValueCell!7800 0))(
  ( (ValueCellFull!7800 (v!10712 V!27019)) (EmptyCell!7800) )
))
(declare-datatypes ((array!49152 0))(
  ( (array!49153 (arr!23607 (Array (_ BitVec 32) ValueCell!7800)) (size!24047 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49152)

(declare-fun e!477828 () Bool)

(declare-fun array_inv!18695 (array!49152) Bool)

(assert (=> start!73428 (and (array_inv!18695 _values!688) e!477828)))

(declare-fun b!857301 () Bool)

(declare-fun e!477827 () Bool)

(assert (=> b!857301 (= e!477828 (and e!477827 mapRes!26318))))

(declare-fun condMapEmpty!26318 () Bool)

(declare-fun mapDefault!26318 () ValueCell!7800)

(assert (=> b!857301 (= condMapEmpty!26318 (= (arr!23607 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7800)) mapDefault!26318)))))

(declare-fun b!857302 () Bool)

(declare-fun e!477831 () Bool)

(assert (=> b!857302 (= e!477830 e!477831)))

(declare-fun res!582339 () Bool)

(assert (=> b!857302 (=> (not res!582339) (not e!477831))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!857302 (= res!582339 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27019)

(declare-fun zeroValue!654 () V!27019)

(declare-fun lt!386245 () array!49152)

(declare-datatypes ((tuple2!10934 0))(
  ( (tuple2!10935 (_1!5478 (_ BitVec 64)) (_2!5478 V!27019)) )
))
(declare-datatypes ((List!16743 0))(
  ( (Nil!16740) (Cons!16739 (h!17870 tuple2!10934) (t!23384 List!16743)) )
))
(declare-datatypes ((ListLongMap!9703 0))(
  ( (ListLongMap!9704 (toList!4867 List!16743)) )
))
(declare-fun lt!386242 () ListLongMap!9703)

(declare-fun getCurrentListMapNoExtraKeys!2848 (array!49150 array!49152 (_ BitVec 32) (_ BitVec 32) V!27019 V!27019 (_ BitVec 32) Int) ListLongMap!9703)

(assert (=> b!857302 (= lt!386242 (getCurrentListMapNoExtraKeys!2848 _keys!868 lt!386245 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27019)

(assert (=> b!857302 (= lt!386245 (array!49153 (store (arr!23607 _values!688) i!612 (ValueCellFull!7800 v!557)) (size!24047 _values!688)))))

(declare-fun lt!386243 () ListLongMap!9703)

(assert (=> b!857302 (= lt!386243 (getCurrentListMapNoExtraKeys!2848 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!857303 () Bool)

(declare-fun res!582345 () Bool)

(assert (=> b!857303 (=> (not res!582345) (not e!477830))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49150 (_ BitVec 32)) Bool)

(assert (=> b!857303 (= res!582345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857304 () Bool)

(declare-fun res!582343 () Bool)

(assert (=> b!857304 (=> (not res!582343) (not e!477830))))

(assert (=> b!857304 (= res!582343 (and (= (size!24047 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24046 _keys!868) (size!24047 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!857305 () Bool)

(declare-fun res!582341 () Bool)

(assert (=> b!857305 (=> (not res!582341) (not e!477830))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857305 (= res!582341 (validKeyInArray!0 k0!854))))

(declare-fun b!857306 () Bool)

(declare-fun res!582344 () Bool)

(assert (=> b!857306 (=> (not res!582344) (not e!477830))))

(assert (=> b!857306 (= res!582344 (and (= (select (arr!23606 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!857307 () Bool)

(declare-fun res!582346 () Bool)

(assert (=> b!857307 (=> (not res!582346) (not e!477830))))

(assert (=> b!857307 (= res!582346 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24046 _keys!868))))))

(declare-fun mapNonEmpty!26318 () Bool)

(declare-fun tp!50533 () Bool)

(assert (=> mapNonEmpty!26318 (= mapRes!26318 (and tp!50533 e!477829))))

(declare-fun mapKey!26318 () (_ BitVec 32))

(declare-fun mapRest!26318 () (Array (_ BitVec 32) ValueCell!7800))

(declare-fun mapValue!26318 () ValueCell!7800)

(assert (=> mapNonEmpty!26318 (= (arr!23607 _values!688) (store mapRest!26318 mapKey!26318 mapValue!26318))))

(declare-fun b!857308 () Bool)

(assert (=> b!857308 (= e!477827 tp_is_empty!16479)))

(declare-fun b!857309 () Bool)

(assert (=> b!857309 (= e!477831 (not true))))

(declare-fun +!2221 (ListLongMap!9703 tuple2!10934) ListLongMap!9703)

(assert (=> b!857309 (= (getCurrentListMapNoExtraKeys!2848 _keys!868 lt!386245 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2221 (getCurrentListMapNoExtraKeys!2848 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10935 k0!854 v!557)))))

(declare-datatypes ((Unit!29229 0))(
  ( (Unit!29230) )
))
(declare-fun lt!386244 () Unit!29229)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!442 (array!49150 array!49152 (_ BitVec 32) (_ BitVec 32) V!27019 V!27019 (_ BitVec 32) (_ BitVec 64) V!27019 (_ BitVec 32) Int) Unit!29229)

(assert (=> b!857309 (= lt!386244 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!442 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73428 res!582342) b!857299))

(assert (= (and b!857299 res!582347) b!857304))

(assert (= (and b!857304 res!582343) b!857303))

(assert (= (and b!857303 res!582345) b!857298))

(assert (= (and b!857298 res!582340) b!857307))

(assert (= (and b!857307 res!582346) b!857305))

(assert (= (and b!857305 res!582341) b!857306))

(assert (= (and b!857306 res!582344) b!857302))

(assert (= (and b!857302 res!582339) b!857309))

(assert (= (and b!857301 condMapEmpty!26318) mapIsEmpty!26318))

(assert (= (and b!857301 (not condMapEmpty!26318)) mapNonEmpty!26318))

(get-info :version)

(assert (= (and mapNonEmpty!26318 ((_ is ValueCellFull!7800) mapValue!26318)) b!857300))

(assert (= (and b!857301 ((_ is ValueCellFull!7800) mapDefault!26318)) b!857308))

(assert (= start!73428 b!857301))

(declare-fun m!798101 () Bool)

(assert (=> b!857309 m!798101))

(declare-fun m!798103 () Bool)

(assert (=> b!857309 m!798103))

(assert (=> b!857309 m!798103))

(declare-fun m!798105 () Bool)

(assert (=> b!857309 m!798105))

(declare-fun m!798107 () Bool)

(assert (=> b!857309 m!798107))

(declare-fun m!798109 () Bool)

(assert (=> b!857306 m!798109))

(declare-fun m!798111 () Bool)

(assert (=> b!857305 m!798111))

(declare-fun m!798113 () Bool)

(assert (=> b!857298 m!798113))

(declare-fun m!798115 () Bool)

(assert (=> b!857302 m!798115))

(declare-fun m!798117 () Bool)

(assert (=> b!857302 m!798117))

(declare-fun m!798119 () Bool)

(assert (=> b!857302 m!798119))

(declare-fun m!798121 () Bool)

(assert (=> b!857303 m!798121))

(declare-fun m!798123 () Bool)

(assert (=> mapNonEmpty!26318 m!798123))

(declare-fun m!798125 () Bool)

(assert (=> b!857299 m!798125))

(declare-fun m!798127 () Bool)

(assert (=> start!73428 m!798127))

(declare-fun m!798129 () Bool)

(assert (=> start!73428 m!798129))

(check-sat tp_is_empty!16479 (not b!857303) b_and!23699 (not b!857298) (not b!857302) (not mapNonEmpty!26318) (not start!73428) (not b_next!14343) (not b!857299) (not b!857309) (not b!857305))
(check-sat b_and!23699 (not b_next!14343))
