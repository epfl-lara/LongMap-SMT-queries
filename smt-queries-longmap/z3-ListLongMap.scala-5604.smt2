; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73576 () Bool)

(assert start!73576)

(declare-fun b_free!14323 () Bool)

(declare-fun b_next!14323 () Bool)

(assert (=> start!73576 (= b_free!14323 (not b_next!14323))))

(declare-fun tp!50473 () Bool)

(declare-fun b_and!23689 () Bool)

(assert (=> start!73576 (= tp!50473 b_and!23689)))

(declare-fun b!857841 () Bool)

(declare-fun res!582421 () Bool)

(declare-fun e!478233 () Bool)

(assert (=> b!857841 (=> (not res!582421) (not e!478233))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857841 (= res!582421 (validKeyInArray!0 k0!854))))

(declare-fun b!857842 () Bool)

(declare-fun res!582418 () Bool)

(assert (=> b!857842 (=> (not res!582418) (not e!478233))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49155 0))(
  ( (array!49156 (arr!23604 (Array (_ BitVec 32) (_ BitVec 64))) (size!24045 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49155)

(assert (=> b!857842 (= res!582418 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24045 _keys!868))))))

(declare-fun res!582420 () Bool)

(assert (=> start!73576 (=> (not res!582420) (not e!478233))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73576 (= res!582420 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24045 _keys!868))))))

(assert (=> start!73576 e!478233))

(declare-fun tp_is_empty!16459 () Bool)

(assert (=> start!73576 tp_is_empty!16459))

(assert (=> start!73576 true))

(assert (=> start!73576 tp!50473))

(declare-fun array_inv!18752 (array!49155) Bool)

(assert (=> start!73576 (array_inv!18752 _keys!868)))

(declare-datatypes ((V!26993 0))(
  ( (V!26994 (val!8277 Int)) )
))
(declare-datatypes ((ValueCell!7790 0))(
  ( (ValueCellFull!7790 (v!10702 V!26993)) (EmptyCell!7790) )
))
(declare-datatypes ((array!49157 0))(
  ( (array!49158 (arr!23605 (Array (_ BitVec 32) ValueCell!7790)) (size!24046 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49157)

(declare-fun e!478234 () Bool)

(declare-fun array_inv!18753 (array!49157) Bool)

(assert (=> start!73576 (and (array_inv!18753 _values!688) e!478234)))

(declare-fun b!857843 () Bool)

(declare-fun e!478232 () Bool)

(assert (=> b!857843 (= e!478232 (not true))))

(declare-fun v!557 () V!26993)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!386485 () array!49157)

(declare-fun minValue!654 () V!26993)

(declare-fun zeroValue!654 () V!26993)

(declare-datatypes ((tuple2!10834 0))(
  ( (tuple2!10835 (_1!5428 (_ BitVec 64)) (_2!5428 V!26993)) )
))
(declare-datatypes ((List!16680 0))(
  ( (Nil!16677) (Cons!16676 (h!17813 tuple2!10834) (t!23313 List!16680)) )
))
(declare-datatypes ((ListLongMap!9605 0))(
  ( (ListLongMap!9606 (toList!4818 List!16680)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2874 (array!49155 array!49157 (_ BitVec 32) (_ BitVec 32) V!26993 V!26993 (_ BitVec 32) Int) ListLongMap!9605)

(declare-fun +!2230 (ListLongMap!9605 tuple2!10834) ListLongMap!9605)

(assert (=> b!857843 (= (getCurrentListMapNoExtraKeys!2874 _keys!868 lt!386485 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2230 (getCurrentListMapNoExtraKeys!2874 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10835 k0!854 v!557)))))

(declare-datatypes ((Unit!29216 0))(
  ( (Unit!29217) )
))
(declare-fun lt!386484 () Unit!29216)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!428 (array!49155 array!49157 (_ BitVec 32) (_ BitVec 32) V!26993 V!26993 (_ BitVec 32) (_ BitVec 64) V!26993 (_ BitVec 32) Int) Unit!29216)

(assert (=> b!857843 (= lt!386484 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!428 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!26288 () Bool)

(declare-fun mapRes!26288 () Bool)

(declare-fun tp!50474 () Bool)

(declare-fun e!478229 () Bool)

(assert (=> mapNonEmpty!26288 (= mapRes!26288 (and tp!50474 e!478229))))

(declare-fun mapRest!26288 () (Array (_ BitVec 32) ValueCell!7790))

(declare-fun mapValue!26288 () ValueCell!7790)

(declare-fun mapKey!26288 () (_ BitVec 32))

(assert (=> mapNonEmpty!26288 (= (arr!23605 _values!688) (store mapRest!26288 mapKey!26288 mapValue!26288))))

(declare-fun b!857844 () Bool)

(declare-fun res!582419 () Bool)

(assert (=> b!857844 (=> (not res!582419) (not e!478233))))

(assert (=> b!857844 (= res!582419 (and (= (select (arr!23604 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!857845 () Bool)

(assert (=> b!857845 (= e!478233 e!478232)))

(declare-fun res!582417 () Bool)

(assert (=> b!857845 (=> (not res!582417) (not e!478232))))

(assert (=> b!857845 (= res!582417 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!386486 () ListLongMap!9605)

(assert (=> b!857845 (= lt!386486 (getCurrentListMapNoExtraKeys!2874 _keys!868 lt!386485 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!857845 (= lt!386485 (array!49158 (store (arr!23605 _values!688) i!612 (ValueCellFull!7790 v!557)) (size!24046 _values!688)))))

(declare-fun lt!386483 () ListLongMap!9605)

(assert (=> b!857845 (= lt!386483 (getCurrentListMapNoExtraKeys!2874 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!857846 () Bool)

(assert (=> b!857846 (= e!478229 tp_is_empty!16459)))

(declare-fun b!857847 () Bool)

(declare-fun res!582416 () Bool)

(assert (=> b!857847 (=> (not res!582416) (not e!478233))))

(assert (=> b!857847 (= res!582416 (and (= (size!24046 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24045 _keys!868) (size!24046 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!857848 () Bool)

(declare-fun res!582415 () Bool)

(assert (=> b!857848 (=> (not res!582415) (not e!478233))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49155 (_ BitVec 32)) Bool)

(assert (=> b!857848 (= res!582415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857849 () Bool)

(declare-fun res!582414 () Bool)

(assert (=> b!857849 (=> (not res!582414) (not e!478233))))

(declare-datatypes ((List!16681 0))(
  ( (Nil!16678) (Cons!16677 (h!17814 (_ BitVec 64)) (t!23314 List!16681)) )
))
(declare-fun arrayNoDuplicates!0 (array!49155 (_ BitVec 32) List!16681) Bool)

(assert (=> b!857849 (= res!582414 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16678))))

(declare-fun b!857850 () Bool)

(declare-fun res!582413 () Bool)

(assert (=> b!857850 (=> (not res!582413) (not e!478233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857850 (= res!582413 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!26288 () Bool)

(assert (=> mapIsEmpty!26288 mapRes!26288))

(declare-fun b!857851 () Bool)

(declare-fun e!478231 () Bool)

(assert (=> b!857851 (= e!478231 tp_is_empty!16459)))

(declare-fun b!857852 () Bool)

(assert (=> b!857852 (= e!478234 (and e!478231 mapRes!26288))))

(declare-fun condMapEmpty!26288 () Bool)

(declare-fun mapDefault!26288 () ValueCell!7790)

(assert (=> b!857852 (= condMapEmpty!26288 (= (arr!23605 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7790)) mapDefault!26288)))))

(assert (= (and start!73576 res!582420) b!857850))

(assert (= (and b!857850 res!582413) b!857847))

(assert (= (and b!857847 res!582416) b!857848))

(assert (= (and b!857848 res!582415) b!857849))

(assert (= (and b!857849 res!582414) b!857842))

(assert (= (and b!857842 res!582418) b!857841))

(assert (= (and b!857841 res!582421) b!857844))

(assert (= (and b!857844 res!582419) b!857845))

(assert (= (and b!857845 res!582417) b!857843))

(assert (= (and b!857852 condMapEmpty!26288) mapIsEmpty!26288))

(assert (= (and b!857852 (not condMapEmpty!26288)) mapNonEmpty!26288))

(get-info :version)

(assert (= (and mapNonEmpty!26288 ((_ is ValueCellFull!7790) mapValue!26288)) b!857846))

(assert (= (and b!857852 ((_ is ValueCellFull!7790) mapDefault!26288)) b!857851))

(assert (= start!73576 b!857852))

(declare-fun m!799091 () Bool)

(assert (=> start!73576 m!799091))

(declare-fun m!799093 () Bool)

(assert (=> start!73576 m!799093))

(declare-fun m!799095 () Bool)

(assert (=> b!857844 m!799095))

(declare-fun m!799097 () Bool)

(assert (=> b!857845 m!799097))

(declare-fun m!799099 () Bool)

(assert (=> b!857845 m!799099))

(declare-fun m!799101 () Bool)

(assert (=> b!857845 m!799101))

(declare-fun m!799103 () Bool)

(assert (=> b!857850 m!799103))

(declare-fun m!799105 () Bool)

(assert (=> b!857848 m!799105))

(declare-fun m!799107 () Bool)

(assert (=> mapNonEmpty!26288 m!799107))

(declare-fun m!799109 () Bool)

(assert (=> b!857841 m!799109))

(declare-fun m!799111 () Bool)

(assert (=> b!857843 m!799111))

(declare-fun m!799113 () Bool)

(assert (=> b!857843 m!799113))

(assert (=> b!857843 m!799113))

(declare-fun m!799115 () Bool)

(assert (=> b!857843 m!799115))

(declare-fun m!799117 () Bool)

(assert (=> b!857843 m!799117))

(declare-fun m!799119 () Bool)

(assert (=> b!857849 m!799119))

(check-sat tp_is_empty!16459 (not b!857843) (not b!857850) (not b_next!14323) (not start!73576) b_and!23689 (not b!857845) (not mapNonEmpty!26288) (not b!857841) (not b!857848) (not b!857849))
(check-sat b_and!23689 (not b_next!14323))
