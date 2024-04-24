; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74230 () Bool)

(assert start!74230)

(declare-fun b_free!14977 () Bool)

(declare-fun b_next!14977 () Bool)

(assert (=> start!74230 (= b_free!14977 (not b_next!14977))))

(declare-fun tp!52436 () Bool)

(declare-fun b_and!24739 () Bool)

(assert (=> start!74230 (= tp!52436 b_and!24739)))

(declare-fun b!872142 () Bool)

(declare-fun res!592554 () Bool)

(declare-fun e!485673 () Bool)

(assert (=> b!872142 (=> (not res!592554) (not e!485673))))

(declare-datatypes ((array!50423 0))(
  ( (array!50424 (arr!24238 (Array (_ BitVec 32) (_ BitVec 64))) (size!24679 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50423)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50423 (_ BitVec 32)) Bool)

(assert (=> b!872142 (= res!592554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!872143 () Bool)

(declare-fun e!485675 () Bool)

(declare-fun tp_is_empty!17113 () Bool)

(assert (=> b!872143 (= e!485675 tp_is_empty!17113)))

(declare-fun b!872144 () Bool)

(declare-fun res!592553 () Bool)

(assert (=> b!872144 (=> (not res!592553) (not e!485673))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!872144 (= res!592553 (and (= (select (arr!24238 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!27269 () Bool)

(declare-fun mapRes!27269 () Bool)

(declare-fun tp!52435 () Bool)

(declare-fun e!485677 () Bool)

(assert (=> mapNonEmpty!27269 (= mapRes!27269 (and tp!52435 e!485677))))

(declare-datatypes ((V!27865 0))(
  ( (V!27866 (val!8604 Int)) )
))
(declare-datatypes ((ValueCell!8117 0))(
  ( (ValueCellFull!8117 (v!11029 V!27865)) (EmptyCell!8117) )
))
(declare-fun mapValue!27269 () ValueCell!8117)

(declare-fun mapRest!27269 () (Array (_ BitVec 32) ValueCell!8117))

(declare-fun mapKey!27269 () (_ BitVec 32))

(declare-datatypes ((array!50425 0))(
  ( (array!50426 (arr!24239 (Array (_ BitVec 32) ValueCell!8117)) (size!24680 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50425)

(assert (=> mapNonEmpty!27269 (= (arr!24239 _values!688) (store mapRest!27269 mapKey!27269 mapValue!27269))))

(declare-fun res!592552 () Bool)

(assert (=> start!74230 (=> (not res!592552) (not e!485673))))

(assert (=> start!74230 (= res!592552 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24679 _keys!868))))))

(assert (=> start!74230 e!485673))

(assert (=> start!74230 tp_is_empty!17113))

(assert (=> start!74230 true))

(assert (=> start!74230 tp!52436))

(declare-fun array_inv!19192 (array!50423) Bool)

(assert (=> start!74230 (array_inv!19192 _keys!868)))

(declare-fun e!485676 () Bool)

(declare-fun array_inv!19193 (array!50425) Bool)

(assert (=> start!74230 (and (array_inv!19193 _values!688) e!485676)))

(declare-fun b!872145 () Bool)

(assert (=> b!872145 (= e!485676 (and e!485675 mapRes!27269))))

(declare-fun condMapEmpty!27269 () Bool)

(declare-fun mapDefault!27269 () ValueCell!8117)

(assert (=> b!872145 (= condMapEmpty!27269 (= (arr!24239 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8117)) mapDefault!27269)))))

(declare-fun b!872146 () Bool)

(declare-fun e!485674 () Bool)

(assert (=> b!872146 (= e!485674 (not true))))

(declare-fun v!557 () V!27865)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27865)

(declare-fun zeroValue!654 () V!27865)

(declare-fun lt!395764 () array!50425)

(declare-datatypes ((tuple2!11362 0))(
  ( (tuple2!11363 (_1!5692 (_ BitVec 64)) (_2!5692 V!27865)) )
))
(declare-datatypes ((List!17181 0))(
  ( (Nil!17178) (Cons!17177 (h!18314 tuple2!11362) (t!24210 List!17181)) )
))
(declare-datatypes ((ListLongMap!10133 0))(
  ( (ListLongMap!10134 (toList!5082 List!17181)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3126 (array!50423 array!50425 (_ BitVec 32) (_ BitVec 32) V!27865 V!27865 (_ BitVec 32) Int) ListLongMap!10133)

(declare-fun +!2471 (ListLongMap!10133 tuple2!11362) ListLongMap!10133)

(assert (=> b!872146 (= (getCurrentListMapNoExtraKeys!3126 _keys!868 lt!395764 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2471 (getCurrentListMapNoExtraKeys!3126 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11363 k0!854 v!557)))))

(declare-datatypes ((Unit!29892 0))(
  ( (Unit!29893) )
))
(declare-fun lt!395762 () Unit!29892)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!642 (array!50423 array!50425 (_ BitVec 32) (_ BitVec 32) V!27865 V!27865 (_ BitVec 32) (_ BitVec 64) V!27865 (_ BitVec 32) Int) Unit!29892)

(assert (=> b!872146 (= lt!395762 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!642 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!872147 () Bool)

(declare-fun res!592549 () Bool)

(assert (=> b!872147 (=> (not res!592549) (not e!485673))))

(declare-datatypes ((List!17182 0))(
  ( (Nil!17179) (Cons!17178 (h!18315 (_ BitVec 64)) (t!24211 List!17182)) )
))
(declare-fun arrayNoDuplicates!0 (array!50423 (_ BitVec 32) List!17182) Bool)

(assert (=> b!872147 (= res!592549 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17179))))

(declare-fun b!872148 () Bool)

(assert (=> b!872148 (= e!485677 tp_is_empty!17113)))

(declare-fun mapIsEmpty!27269 () Bool)

(assert (=> mapIsEmpty!27269 mapRes!27269))

(declare-fun b!872149 () Bool)

(declare-fun res!592550 () Bool)

(assert (=> b!872149 (=> (not res!592550) (not e!485673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872149 (= res!592550 (validMask!0 mask!1196))))

(declare-fun b!872150 () Bool)

(declare-fun res!592555 () Bool)

(assert (=> b!872150 (=> (not res!592555) (not e!485673))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!872150 (= res!592555 (validKeyInArray!0 k0!854))))

(declare-fun b!872151 () Bool)

(declare-fun res!592551 () Bool)

(assert (=> b!872151 (=> (not res!592551) (not e!485673))))

(assert (=> b!872151 (= res!592551 (and (= (size!24680 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24679 _keys!868) (size!24680 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!872152 () Bool)

(declare-fun res!592547 () Bool)

(assert (=> b!872152 (=> (not res!592547) (not e!485673))))

(assert (=> b!872152 (= res!592547 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24679 _keys!868))))))

(declare-fun b!872153 () Bool)

(assert (=> b!872153 (= e!485673 e!485674)))

(declare-fun res!592548 () Bool)

(assert (=> b!872153 (=> (not res!592548) (not e!485674))))

(assert (=> b!872153 (= res!592548 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395763 () ListLongMap!10133)

(assert (=> b!872153 (= lt!395763 (getCurrentListMapNoExtraKeys!3126 _keys!868 lt!395764 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!872153 (= lt!395764 (array!50426 (store (arr!24239 _values!688) i!612 (ValueCellFull!8117 v!557)) (size!24680 _values!688)))))

(declare-fun lt!395765 () ListLongMap!10133)

(assert (=> b!872153 (= lt!395765 (getCurrentListMapNoExtraKeys!3126 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!74230 res!592552) b!872149))

(assert (= (and b!872149 res!592550) b!872151))

(assert (= (and b!872151 res!592551) b!872142))

(assert (= (and b!872142 res!592554) b!872147))

(assert (= (and b!872147 res!592549) b!872152))

(assert (= (and b!872152 res!592547) b!872150))

(assert (= (and b!872150 res!592555) b!872144))

(assert (= (and b!872144 res!592553) b!872153))

(assert (= (and b!872153 res!592548) b!872146))

(assert (= (and b!872145 condMapEmpty!27269) mapIsEmpty!27269))

(assert (= (and b!872145 (not condMapEmpty!27269)) mapNonEmpty!27269))

(get-info :version)

(assert (= (and mapNonEmpty!27269 ((_ is ValueCellFull!8117) mapValue!27269)) b!872148))

(assert (= (and b!872145 ((_ is ValueCellFull!8117) mapDefault!27269)) b!872143))

(assert (= start!74230 b!872145))

(declare-fun m!813767 () Bool)

(assert (=> b!872153 m!813767))

(declare-fun m!813769 () Bool)

(assert (=> b!872153 m!813769))

(declare-fun m!813771 () Bool)

(assert (=> b!872153 m!813771))

(declare-fun m!813773 () Bool)

(assert (=> b!872147 m!813773))

(declare-fun m!813775 () Bool)

(assert (=> b!872150 m!813775))

(declare-fun m!813777 () Bool)

(assert (=> start!74230 m!813777))

(declare-fun m!813779 () Bool)

(assert (=> start!74230 m!813779))

(declare-fun m!813781 () Bool)

(assert (=> b!872146 m!813781))

(declare-fun m!813783 () Bool)

(assert (=> b!872146 m!813783))

(assert (=> b!872146 m!813783))

(declare-fun m!813785 () Bool)

(assert (=> b!872146 m!813785))

(declare-fun m!813787 () Bool)

(assert (=> b!872146 m!813787))

(declare-fun m!813789 () Bool)

(assert (=> b!872144 m!813789))

(declare-fun m!813791 () Bool)

(assert (=> b!872142 m!813791))

(declare-fun m!813793 () Bool)

(assert (=> b!872149 m!813793))

(declare-fun m!813795 () Bool)

(assert (=> mapNonEmpty!27269 m!813795))

(check-sat (not b!872142) (not b!872146) (not start!74230) (not b!872150) (not b_next!14977) (not b!872147) (not mapNonEmpty!27269) tp_is_empty!17113 (not b!872149) (not b!872153) b_and!24739)
(check-sat b_and!24739 (not b_next!14977))
