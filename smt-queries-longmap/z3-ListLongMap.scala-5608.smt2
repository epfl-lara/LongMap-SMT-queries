; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73600 () Bool)

(assert start!73600)

(declare-fun b_free!14347 () Bool)

(declare-fun b_next!14347 () Bool)

(assert (=> start!73600 (= b_free!14347 (not b_next!14347))))

(declare-fun tp!50545 () Bool)

(declare-fun b_and!23713 () Bool)

(assert (=> start!73600 (= tp!50545 b_and!23713)))

(declare-fun b!858273 () Bool)

(declare-fun res!582745 () Bool)

(declare-fun e!478450 () Bool)

(assert (=> b!858273 (=> (not res!582745) (not e!478450))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49203 0))(
  ( (array!49204 (arr!23628 (Array (_ BitVec 32) (_ BitVec 64))) (size!24069 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49203)

(assert (=> b!858273 (= res!582745 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24069 _keys!868))))))

(declare-fun b!858274 () Bool)

(declare-fun res!582744 () Bool)

(assert (=> b!858274 (=> (not res!582744) (not e!478450))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858274 (= res!582744 (validKeyInArray!0 k0!854))))

(declare-fun b!858275 () Bool)

(declare-fun e!478449 () Bool)

(assert (=> b!858275 (= e!478450 e!478449)))

(declare-fun res!582739 () Bool)

(assert (=> b!858275 (=> (not res!582739) (not e!478449))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!858275 (= res!582739 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27025 0))(
  ( (V!27026 (val!8289 Int)) )
))
(declare-datatypes ((tuple2!10858 0))(
  ( (tuple2!10859 (_1!5440 (_ BitVec 64)) (_2!5440 V!27025)) )
))
(declare-datatypes ((List!16701 0))(
  ( (Nil!16698) (Cons!16697 (h!17834 tuple2!10858) (t!23334 List!16701)) )
))
(declare-datatypes ((ListLongMap!9629 0))(
  ( (ListLongMap!9630 (toList!4830 List!16701)) )
))
(declare-fun lt!386627 () ListLongMap!9629)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!7802 0))(
  ( (ValueCellFull!7802 (v!10714 V!27025)) (EmptyCell!7802) )
))
(declare-datatypes ((array!49205 0))(
  ( (array!49206 (arr!23629 (Array (_ BitVec 32) ValueCell!7802)) (size!24070 (_ BitVec 32))) )
))
(declare-fun lt!386630 () array!49205)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27025)

(declare-fun zeroValue!654 () V!27025)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2886 (array!49203 array!49205 (_ BitVec 32) (_ BitVec 32) V!27025 V!27025 (_ BitVec 32) Int) ListLongMap!9629)

(assert (=> b!858275 (= lt!386627 (getCurrentListMapNoExtraKeys!2886 _keys!868 lt!386630 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27025)

(declare-fun _values!688 () array!49205)

(assert (=> b!858275 (= lt!386630 (array!49206 (store (arr!23629 _values!688) i!612 (ValueCellFull!7802 v!557)) (size!24070 _values!688)))))

(declare-fun lt!386629 () ListLongMap!9629)

(assert (=> b!858275 (= lt!386629 (getCurrentListMapNoExtraKeys!2886 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!26324 () Bool)

(declare-fun mapRes!26324 () Bool)

(assert (=> mapIsEmpty!26324 mapRes!26324))

(declare-fun b!858276 () Bool)

(declare-fun e!478445 () Bool)

(declare-fun e!478447 () Bool)

(assert (=> b!858276 (= e!478445 (and e!478447 mapRes!26324))))

(declare-fun condMapEmpty!26324 () Bool)

(declare-fun mapDefault!26324 () ValueCell!7802)

(assert (=> b!858276 (= condMapEmpty!26324 (= (arr!23629 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7802)) mapDefault!26324)))))

(declare-fun b!858277 () Bool)

(declare-fun res!582738 () Bool)

(assert (=> b!858277 (=> (not res!582738) (not e!478450))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49203 (_ BitVec 32)) Bool)

(assert (=> b!858277 (= res!582738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!858278 () Bool)

(declare-fun res!582741 () Bool)

(assert (=> b!858278 (=> (not res!582741) (not e!478450))))

(assert (=> b!858278 (= res!582741 (and (= (size!24070 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24069 _keys!868) (size!24070 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!858279 () Bool)

(declare-fun res!582742 () Bool)

(assert (=> b!858279 (=> (not res!582742) (not e!478450))))

(declare-datatypes ((List!16702 0))(
  ( (Nil!16699) (Cons!16698 (h!17835 (_ BitVec 64)) (t!23335 List!16702)) )
))
(declare-fun arrayNoDuplicates!0 (array!49203 (_ BitVec 32) List!16702) Bool)

(assert (=> b!858279 (= res!582742 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16699))))

(declare-fun b!858280 () Bool)

(declare-fun res!582737 () Bool)

(assert (=> b!858280 (=> (not res!582737) (not e!478450))))

(assert (=> b!858280 (= res!582737 (and (= (select (arr!23628 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!858281 () Bool)

(declare-fun e!478446 () Bool)

(declare-fun tp_is_empty!16483 () Bool)

(assert (=> b!858281 (= e!478446 tp_is_empty!16483)))

(declare-fun mapNonEmpty!26324 () Bool)

(declare-fun tp!50546 () Bool)

(assert (=> mapNonEmpty!26324 (= mapRes!26324 (and tp!50546 e!478446))))

(declare-fun mapKey!26324 () (_ BitVec 32))

(declare-fun mapRest!26324 () (Array (_ BitVec 32) ValueCell!7802))

(declare-fun mapValue!26324 () ValueCell!7802)

(assert (=> mapNonEmpty!26324 (= (arr!23629 _values!688) (store mapRest!26324 mapKey!26324 mapValue!26324))))

(declare-fun b!858282 () Bool)

(assert (=> b!858282 (= e!478447 tp_is_empty!16483)))

(declare-fun b!858283 () Bool)

(assert (=> b!858283 (= e!478449 (not true))))

(declare-fun +!2240 (ListLongMap!9629 tuple2!10858) ListLongMap!9629)

(assert (=> b!858283 (= (getCurrentListMapNoExtraKeys!2886 _keys!868 lt!386630 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2240 (getCurrentListMapNoExtraKeys!2886 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10859 k0!854 v!557)))))

(declare-datatypes ((Unit!29236 0))(
  ( (Unit!29237) )
))
(declare-fun lt!386628 () Unit!29236)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!438 (array!49203 array!49205 (_ BitVec 32) (_ BitVec 32) V!27025 V!27025 (_ BitVec 32) (_ BitVec 64) V!27025 (_ BitVec 32) Int) Unit!29236)

(assert (=> b!858283 (= lt!386628 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!438 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!582743 () Bool)

(assert (=> start!73600 (=> (not res!582743) (not e!478450))))

(assert (=> start!73600 (= res!582743 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24069 _keys!868))))))

(assert (=> start!73600 e!478450))

(assert (=> start!73600 tp_is_empty!16483))

(assert (=> start!73600 true))

(assert (=> start!73600 tp!50545))

(declare-fun array_inv!18766 (array!49203) Bool)

(assert (=> start!73600 (array_inv!18766 _keys!868)))

(declare-fun array_inv!18767 (array!49205) Bool)

(assert (=> start!73600 (and (array_inv!18767 _values!688) e!478445)))

(declare-fun b!858284 () Bool)

(declare-fun res!582740 () Bool)

(assert (=> b!858284 (=> (not res!582740) (not e!478450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!858284 (= res!582740 (validMask!0 mask!1196))))

(assert (= (and start!73600 res!582743) b!858284))

(assert (= (and b!858284 res!582740) b!858278))

(assert (= (and b!858278 res!582741) b!858277))

(assert (= (and b!858277 res!582738) b!858279))

(assert (= (and b!858279 res!582742) b!858273))

(assert (= (and b!858273 res!582745) b!858274))

(assert (= (and b!858274 res!582744) b!858280))

(assert (= (and b!858280 res!582737) b!858275))

(assert (= (and b!858275 res!582739) b!858283))

(assert (= (and b!858276 condMapEmpty!26324) mapIsEmpty!26324))

(assert (= (and b!858276 (not condMapEmpty!26324)) mapNonEmpty!26324))

(get-info :version)

(assert (= (and mapNonEmpty!26324 ((_ is ValueCellFull!7802) mapValue!26324)) b!858281))

(assert (= (and b!858276 ((_ is ValueCellFull!7802) mapDefault!26324)) b!858282))

(assert (= start!73600 b!858276))

(declare-fun m!799451 () Bool)

(assert (=> b!858280 m!799451))

(declare-fun m!799453 () Bool)

(assert (=> b!858283 m!799453))

(declare-fun m!799455 () Bool)

(assert (=> b!858283 m!799455))

(assert (=> b!858283 m!799455))

(declare-fun m!799457 () Bool)

(assert (=> b!858283 m!799457))

(declare-fun m!799459 () Bool)

(assert (=> b!858283 m!799459))

(declare-fun m!799461 () Bool)

(assert (=> b!858284 m!799461))

(declare-fun m!799463 () Bool)

(assert (=> b!858279 m!799463))

(declare-fun m!799465 () Bool)

(assert (=> mapNonEmpty!26324 m!799465))

(declare-fun m!799467 () Bool)

(assert (=> start!73600 m!799467))

(declare-fun m!799469 () Bool)

(assert (=> start!73600 m!799469))

(declare-fun m!799471 () Bool)

(assert (=> b!858274 m!799471))

(declare-fun m!799473 () Bool)

(assert (=> b!858275 m!799473))

(declare-fun m!799475 () Bool)

(assert (=> b!858275 m!799475))

(declare-fun m!799477 () Bool)

(assert (=> b!858275 m!799477))

(declare-fun m!799479 () Bool)

(assert (=> b!858277 m!799479))

(check-sat (not b_next!14347) (not b!858284) (not b!858283) (not mapNonEmpty!26324) tp_is_empty!16483 (not b!858275) b_and!23713 (not b!858277) (not start!73600) (not b!858279) (not b!858274))
(check-sat b_and!23713 (not b_next!14347))
