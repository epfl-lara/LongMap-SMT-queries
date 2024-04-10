; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73362 () Bool)

(assert start!73362)

(declare-fun b_free!14277 () Bool)

(declare-fun b_next!14277 () Bool)

(assert (=> start!73362 (= b_free!14277 (not b_next!14277))))

(declare-fun tp!50334 () Bool)

(declare-fun b_and!23633 () Bool)

(assert (=> start!73362 (= tp!50334 b_and!23633)))

(declare-fun b!856110 () Bool)

(declare-fun res!581450 () Bool)

(declare-fun e!477234 () Bool)

(assert (=> b!856110 (=> (not res!581450) (not e!477234))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856110 (= res!581450 (validKeyInArray!0 k0!854))))

(declare-fun b!856112 () Bool)

(declare-fun e!477238 () Bool)

(declare-fun tp_is_empty!16413 () Bool)

(assert (=> b!856112 (= e!477238 tp_is_empty!16413)))

(declare-fun b!856113 () Bool)

(declare-fun e!477233 () Bool)

(assert (=> b!856113 (= e!477233 (not true))))

(declare-datatypes ((V!26931 0))(
  ( (V!26932 (val!8254 Int)) )
))
(declare-fun v!557 () V!26931)

(declare-datatypes ((ValueCell!7767 0))(
  ( (ValueCellFull!7767 (v!10679 V!26931)) (EmptyCell!7767) )
))
(declare-datatypes ((array!49020 0))(
  ( (array!49021 (arr!23541 (Array (_ BitVec 32) ValueCell!7767)) (size!23981 (_ BitVec 32))) )
))
(declare-fun lt!385847 () array!49020)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49022 0))(
  ( (array!49023 (arr!23542 (Array (_ BitVec 32) (_ BitVec 64))) (size!23982 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49022)

(declare-fun _values!688 () array!49020)

(declare-fun minValue!654 () V!26931)

(declare-fun zeroValue!654 () V!26931)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((tuple2!10880 0))(
  ( (tuple2!10881 (_1!5451 (_ BitVec 64)) (_2!5451 V!26931)) )
))
(declare-datatypes ((List!16692 0))(
  ( (Nil!16689) (Cons!16688 (h!17819 tuple2!10880) (t!23333 List!16692)) )
))
(declare-datatypes ((ListLongMap!9649 0))(
  ( (ListLongMap!9650 (toList!4840 List!16692)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2821 (array!49022 array!49020 (_ BitVec 32) (_ BitVec 32) V!26931 V!26931 (_ BitVec 32) Int) ListLongMap!9649)

(declare-fun +!2198 (ListLongMap!9649 tuple2!10880) ListLongMap!9649)

(assert (=> b!856113 (= (getCurrentListMapNoExtraKeys!2821 _keys!868 lt!385847 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2198 (getCurrentListMapNoExtraKeys!2821 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10881 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29183 0))(
  ( (Unit!29184) )
))
(declare-fun lt!385848 () Unit!29183)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!419 (array!49022 array!49020 (_ BitVec 32) (_ BitVec 32) V!26931 V!26931 (_ BitVec 32) (_ BitVec 64) V!26931 (_ BitVec 32) Int) Unit!29183)

(assert (=> b!856113 (= lt!385848 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!419 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!856114 () Bool)

(declare-fun res!581454 () Bool)

(assert (=> b!856114 (=> (not res!581454) (not e!477234))))

(assert (=> b!856114 (= res!581454 (and (= (select (arr!23542 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!26219 () Bool)

(declare-fun mapRes!26219 () Bool)

(assert (=> mapIsEmpty!26219 mapRes!26219))

(declare-fun mapNonEmpty!26219 () Bool)

(declare-fun tp!50335 () Bool)

(assert (=> mapNonEmpty!26219 (= mapRes!26219 (and tp!50335 e!477238))))

(declare-fun mapValue!26219 () ValueCell!7767)

(declare-fun mapKey!26219 () (_ BitVec 32))

(declare-fun mapRest!26219 () (Array (_ BitVec 32) ValueCell!7767))

(assert (=> mapNonEmpty!26219 (= (arr!23541 _values!688) (store mapRest!26219 mapKey!26219 mapValue!26219))))

(declare-fun b!856115 () Bool)

(declare-fun e!477236 () Bool)

(declare-fun e!477235 () Bool)

(assert (=> b!856115 (= e!477236 (and e!477235 mapRes!26219))))

(declare-fun condMapEmpty!26219 () Bool)

(declare-fun mapDefault!26219 () ValueCell!7767)

(assert (=> b!856115 (= condMapEmpty!26219 (= (arr!23541 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7767)) mapDefault!26219)))))

(declare-fun b!856116 () Bool)

(declare-fun res!581455 () Bool)

(assert (=> b!856116 (=> (not res!581455) (not e!477234))))

(assert (=> b!856116 (= res!581455 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23982 _keys!868))))))

(declare-fun b!856117 () Bool)

(declare-fun res!581449 () Bool)

(assert (=> b!856117 (=> (not res!581449) (not e!477234))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49022 (_ BitVec 32)) Bool)

(assert (=> b!856117 (= res!581449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856118 () Bool)

(assert (=> b!856118 (= e!477235 tp_is_empty!16413)))

(declare-fun b!856119 () Bool)

(declare-fun res!581451 () Bool)

(assert (=> b!856119 (=> (not res!581451) (not e!477234))))

(assert (=> b!856119 (= res!581451 (and (= (size!23981 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23982 _keys!868) (size!23981 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856120 () Bool)

(declare-fun res!581452 () Bool)

(assert (=> b!856120 (=> (not res!581452) (not e!477234))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856120 (= res!581452 (validMask!0 mask!1196))))

(declare-fun b!856121 () Bool)

(declare-fun res!581453 () Bool)

(assert (=> b!856121 (=> (not res!581453) (not e!477234))))

(declare-datatypes ((List!16693 0))(
  ( (Nil!16690) (Cons!16689 (h!17820 (_ BitVec 64)) (t!23334 List!16693)) )
))
(declare-fun arrayNoDuplicates!0 (array!49022 (_ BitVec 32) List!16693) Bool)

(assert (=> b!856121 (= res!581453 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16690))))

(declare-fun b!856111 () Bool)

(assert (=> b!856111 (= e!477234 e!477233)))

(declare-fun res!581448 () Bool)

(assert (=> b!856111 (=> (not res!581448) (not e!477233))))

(assert (=> b!856111 (= res!581448 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!385846 () ListLongMap!9649)

(assert (=> b!856111 (= lt!385846 (getCurrentListMapNoExtraKeys!2821 _keys!868 lt!385847 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!856111 (= lt!385847 (array!49021 (store (arr!23541 _values!688) i!612 (ValueCellFull!7767 v!557)) (size!23981 _values!688)))))

(declare-fun lt!385849 () ListLongMap!9649)

(assert (=> b!856111 (= lt!385849 (getCurrentListMapNoExtraKeys!2821 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!581456 () Bool)

(assert (=> start!73362 (=> (not res!581456) (not e!477234))))

(assert (=> start!73362 (= res!581456 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23982 _keys!868))))))

(assert (=> start!73362 e!477234))

(assert (=> start!73362 tp_is_empty!16413))

(assert (=> start!73362 true))

(assert (=> start!73362 tp!50334))

(declare-fun array_inv!18650 (array!49022) Bool)

(assert (=> start!73362 (array_inv!18650 _keys!868)))

(declare-fun array_inv!18651 (array!49020) Bool)

(assert (=> start!73362 (and (array_inv!18651 _values!688) e!477236)))

(assert (= (and start!73362 res!581456) b!856120))

(assert (= (and b!856120 res!581452) b!856119))

(assert (= (and b!856119 res!581451) b!856117))

(assert (= (and b!856117 res!581449) b!856121))

(assert (= (and b!856121 res!581453) b!856116))

(assert (= (and b!856116 res!581455) b!856110))

(assert (= (and b!856110 res!581450) b!856114))

(assert (= (and b!856114 res!581454) b!856111))

(assert (= (and b!856111 res!581448) b!856113))

(assert (= (and b!856115 condMapEmpty!26219) mapIsEmpty!26219))

(assert (= (and b!856115 (not condMapEmpty!26219)) mapNonEmpty!26219))

(get-info :version)

(assert (= (and mapNonEmpty!26219 ((_ is ValueCellFull!7767) mapValue!26219)) b!856112))

(assert (= (and b!856115 ((_ is ValueCellFull!7767) mapDefault!26219)) b!856118))

(assert (= start!73362 b!856115))

(declare-fun m!797111 () Bool)

(assert (=> b!856120 m!797111))

(declare-fun m!797113 () Bool)

(assert (=> mapNonEmpty!26219 m!797113))

(declare-fun m!797115 () Bool)

(assert (=> b!856113 m!797115))

(declare-fun m!797117 () Bool)

(assert (=> b!856113 m!797117))

(assert (=> b!856113 m!797117))

(declare-fun m!797119 () Bool)

(assert (=> b!856113 m!797119))

(declare-fun m!797121 () Bool)

(assert (=> b!856113 m!797121))

(declare-fun m!797123 () Bool)

(assert (=> start!73362 m!797123))

(declare-fun m!797125 () Bool)

(assert (=> start!73362 m!797125))

(declare-fun m!797127 () Bool)

(assert (=> b!856114 m!797127))

(declare-fun m!797129 () Bool)

(assert (=> b!856110 m!797129))

(declare-fun m!797131 () Bool)

(assert (=> b!856121 m!797131))

(declare-fun m!797133 () Bool)

(assert (=> b!856111 m!797133))

(declare-fun m!797135 () Bool)

(assert (=> b!856111 m!797135))

(declare-fun m!797137 () Bool)

(assert (=> b!856111 m!797137))

(declare-fun m!797139 () Bool)

(assert (=> b!856117 m!797139))

(check-sat (not b!856117) (not mapNonEmpty!26219) (not b!856110) (not b!856113) (not b!856111) b_and!23633 (not b_next!14277) tp_is_empty!16413 (not b!856121) (not start!73362) (not b!856120))
(check-sat b_and!23633 (not b_next!14277))
