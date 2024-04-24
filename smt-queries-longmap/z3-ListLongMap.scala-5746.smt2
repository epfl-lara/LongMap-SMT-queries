; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74472 () Bool)

(assert start!74472)

(declare-fun b_free!15067 () Bool)

(declare-fun b_next!15067 () Bool)

(assert (=> start!74472 (= b_free!15067 (not b_next!15067))))

(declare-fun tp!52876 () Bool)

(declare-fun b_and!24853 () Bool)

(assert (=> start!74472 (= tp!52876 b_and!24853)))

(declare-fun b!875183 () Bool)

(declare-fun res!594482 () Bool)

(declare-fun e!487378 () Bool)

(assert (=> b!875183 (=> (not res!594482) (not e!487378))))

(declare-datatypes ((array!50805 0))(
  ( (array!50806 (arr!24426 (Array (_ BitVec 32) (_ BitVec 64))) (size!24867 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50805)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50805 (_ BitVec 32)) Bool)

(assert (=> b!875183 (= res!594482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!875184 () Bool)

(declare-fun res!594478 () Bool)

(assert (=> b!875184 (=> (not res!594478) (not e!487378))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!875184 (= res!594478 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24867 _keys!868))))))

(declare-fun b!875185 () Bool)

(declare-fun res!594476 () Bool)

(assert (=> b!875185 (=> (not res!594476) (not e!487378))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875185 (= res!594476 (validKeyInArray!0 k0!854))))

(declare-fun b!875186 () Bool)

(assert (=> b!875186 (= e!487378 false)))

(declare-datatypes ((V!28129 0))(
  ( (V!28130 (val!8703 Int)) )
))
(declare-fun v!557 () V!28129)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8216 0))(
  ( (ValueCellFull!8216 (v!11132 V!28129)) (EmptyCell!8216) )
))
(declare-datatypes ((array!50807 0))(
  ( (array!50808 (arr!24427 (Array (_ BitVec 32) ValueCell!8216)) (size!24868 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50807)

(declare-fun minValue!654 () V!28129)

(declare-fun zeroValue!654 () V!28129)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((tuple2!11432 0))(
  ( (tuple2!11433 (_1!5727 (_ BitVec 64)) (_2!5727 V!28129)) )
))
(declare-datatypes ((List!17278 0))(
  ( (Nil!17275) (Cons!17274 (h!18411 tuple2!11432) (t!24311 List!17278)) )
))
(declare-datatypes ((ListLongMap!10203 0))(
  ( (ListLongMap!10204 (toList!5117 List!17278)) )
))
(declare-fun lt!396275 () ListLongMap!10203)

(declare-fun getCurrentListMapNoExtraKeys!3160 (array!50805 array!50807 (_ BitVec 32) (_ BitVec 32) V!28129 V!28129 (_ BitVec 32) Int) ListLongMap!10203)

(assert (=> b!875186 (= lt!396275 (getCurrentListMapNoExtraKeys!3160 _keys!868 (array!50808 (store (arr!24427 _values!688) i!612 (ValueCellFull!8216 v!557)) (size!24868 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!396276 () ListLongMap!10203)

(assert (=> b!875186 (= lt!396276 (getCurrentListMapNoExtraKeys!3160 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!875187 () Bool)

(declare-fun e!487382 () Bool)

(declare-fun e!487381 () Bool)

(declare-fun mapRes!27575 () Bool)

(assert (=> b!875187 (= e!487382 (and e!487381 mapRes!27575))))

(declare-fun condMapEmpty!27575 () Bool)

(declare-fun mapDefault!27575 () ValueCell!8216)

(assert (=> b!875187 (= condMapEmpty!27575 (= (arr!24427 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8216)) mapDefault!27575)))))

(declare-fun b!875188 () Bool)

(declare-fun res!594475 () Bool)

(assert (=> b!875188 (=> (not res!594475) (not e!487378))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!875188 (= res!594475 (validMask!0 mask!1196))))

(declare-fun res!594477 () Bool)

(assert (=> start!74472 (=> (not res!594477) (not e!487378))))

(assert (=> start!74472 (= res!594477 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24867 _keys!868))))))

(assert (=> start!74472 e!487378))

(declare-fun tp_is_empty!17311 () Bool)

(assert (=> start!74472 tp_is_empty!17311))

(assert (=> start!74472 true))

(assert (=> start!74472 tp!52876))

(declare-fun array_inv!19324 (array!50805) Bool)

(assert (=> start!74472 (array_inv!19324 _keys!868)))

(declare-fun array_inv!19325 (array!50807) Bool)

(assert (=> start!74472 (and (array_inv!19325 _values!688) e!487382)))

(declare-fun b!875189 () Bool)

(declare-fun res!594479 () Bool)

(assert (=> b!875189 (=> (not res!594479) (not e!487378))))

(assert (=> b!875189 (= res!594479 (and (= (size!24868 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24867 _keys!868) (size!24868 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!875190 () Bool)

(declare-fun res!594481 () Bool)

(assert (=> b!875190 (=> (not res!594481) (not e!487378))))

(assert (=> b!875190 (= res!594481 (and (= (select (arr!24426 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27575 () Bool)

(assert (=> mapIsEmpty!27575 mapRes!27575))

(declare-fun b!875191 () Bool)

(assert (=> b!875191 (= e!487381 tp_is_empty!17311)))

(declare-fun b!875192 () Bool)

(declare-fun e!487380 () Bool)

(assert (=> b!875192 (= e!487380 tp_is_empty!17311)))

(declare-fun mapNonEmpty!27575 () Bool)

(declare-fun tp!52877 () Bool)

(assert (=> mapNonEmpty!27575 (= mapRes!27575 (and tp!52877 e!487380))))

(declare-fun mapKey!27575 () (_ BitVec 32))

(declare-fun mapRest!27575 () (Array (_ BitVec 32) ValueCell!8216))

(declare-fun mapValue!27575 () ValueCell!8216)

(assert (=> mapNonEmpty!27575 (= (arr!24427 _values!688) (store mapRest!27575 mapKey!27575 mapValue!27575))))

(declare-fun b!875193 () Bool)

(declare-fun res!594480 () Bool)

(assert (=> b!875193 (=> (not res!594480) (not e!487378))))

(declare-datatypes ((List!17279 0))(
  ( (Nil!17276) (Cons!17275 (h!18412 (_ BitVec 64)) (t!24312 List!17279)) )
))
(declare-fun arrayNoDuplicates!0 (array!50805 (_ BitVec 32) List!17279) Bool)

(assert (=> b!875193 (= res!594480 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17276))))

(assert (= (and start!74472 res!594477) b!875188))

(assert (= (and b!875188 res!594475) b!875189))

(assert (= (and b!875189 res!594479) b!875183))

(assert (= (and b!875183 res!594482) b!875193))

(assert (= (and b!875193 res!594480) b!875184))

(assert (= (and b!875184 res!594478) b!875185))

(assert (= (and b!875185 res!594476) b!875190))

(assert (= (and b!875190 res!594481) b!875186))

(assert (= (and b!875187 condMapEmpty!27575) mapIsEmpty!27575))

(assert (= (and b!875187 (not condMapEmpty!27575)) mapNonEmpty!27575))

(get-info :version)

(assert (= (and mapNonEmpty!27575 ((_ is ValueCellFull!8216) mapValue!27575)) b!875192))

(assert (= (and b!875187 ((_ is ValueCellFull!8216) mapDefault!27575)) b!875191))

(assert (= start!74472 b!875187))

(declare-fun m!815791 () Bool)

(assert (=> b!875185 m!815791))

(declare-fun m!815793 () Bool)

(assert (=> b!875186 m!815793))

(declare-fun m!815795 () Bool)

(assert (=> b!875186 m!815795))

(declare-fun m!815797 () Bool)

(assert (=> b!875186 m!815797))

(declare-fun m!815799 () Bool)

(assert (=> b!875193 m!815799))

(declare-fun m!815801 () Bool)

(assert (=> b!875188 m!815801))

(declare-fun m!815803 () Bool)

(assert (=> b!875190 m!815803))

(declare-fun m!815805 () Bool)

(assert (=> b!875183 m!815805))

(declare-fun m!815807 () Bool)

(assert (=> start!74472 m!815807))

(declare-fun m!815809 () Bool)

(assert (=> start!74472 m!815809))

(declare-fun m!815811 () Bool)

(assert (=> mapNonEmpty!27575 m!815811))

(check-sat b_and!24853 (not b!875185) (not b_next!15067) (not b!875186) (not start!74472) (not b!875188) (not b!875193) (not b!875183) tp_is_empty!17311 (not mapNonEmpty!27575))
(check-sat b_and!24853 (not b_next!15067))
