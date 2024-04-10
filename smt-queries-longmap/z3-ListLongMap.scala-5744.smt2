; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74294 () Bool)

(assert start!74294)

(declare-fun b_free!15057 () Bool)

(declare-fun b_next!15057 () Bool)

(assert (=> start!74294 (= b_free!15057 (not b_next!15057))))

(declare-fun tp!52846 () Bool)

(declare-fun b_and!24833 () Bool)

(assert (=> start!74294 (= tp!52846 b_and!24833)))

(declare-fun b!874115 () Bool)

(declare-fun res!594013 () Bool)

(declare-fun e!486723 () Bool)

(assert (=> b!874115 (=> (not res!594013) (not e!486723))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!50730 0))(
  ( (array!50731 (arr!24393 (Array (_ BitVec 32) (_ BitVec 64))) (size!24833 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50730)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!874115 (= res!594013 (and (= (select (arr!24393 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27560 () Bool)

(declare-fun mapRes!27560 () Bool)

(assert (=> mapIsEmpty!27560 mapRes!27560))

(declare-fun b!874117 () Bool)

(declare-fun res!594014 () Bool)

(assert (=> b!874117 (=> (not res!594014) (not e!486723))))

(assert (=> b!874117 (= res!594014 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24833 _keys!868))))))

(declare-fun b!874118 () Bool)

(declare-fun e!486722 () Bool)

(declare-fun tp_is_empty!17301 () Bool)

(assert (=> b!874118 (= e!486722 tp_is_empty!17301)))

(declare-fun b!874119 () Bool)

(declare-fun res!594017 () Bool)

(assert (=> b!874119 (=> (not res!594017) (not e!486723))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50730 (_ BitVec 32)) Bool)

(assert (=> b!874119 (= res!594017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874120 () Bool)

(declare-fun e!486724 () Bool)

(assert (=> b!874120 (= e!486724 tp_is_empty!17301)))

(declare-fun b!874116 () Bool)

(declare-fun res!594012 () Bool)

(assert (=> b!874116 (=> (not res!594012) (not e!486723))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874116 (= res!594012 (validMask!0 mask!1196))))

(declare-fun res!594015 () Bool)

(assert (=> start!74294 (=> (not res!594015) (not e!486723))))

(assert (=> start!74294 (= res!594015 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24833 _keys!868))))))

(assert (=> start!74294 e!486723))

(assert (=> start!74294 tp_is_empty!17301))

(assert (=> start!74294 true))

(assert (=> start!74294 tp!52846))

(declare-fun array_inv!19244 (array!50730) Bool)

(assert (=> start!74294 (array_inv!19244 _keys!868)))

(declare-datatypes ((V!28115 0))(
  ( (V!28116 (val!8698 Int)) )
))
(declare-datatypes ((ValueCell!8211 0))(
  ( (ValueCellFull!8211 (v!11127 V!28115)) (EmptyCell!8211) )
))
(declare-datatypes ((array!50732 0))(
  ( (array!50733 (arr!24394 (Array (_ BitVec 32) ValueCell!8211)) (size!24834 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50732)

(declare-fun e!486721 () Bool)

(declare-fun array_inv!19245 (array!50732) Bool)

(assert (=> start!74294 (and (array_inv!19245 _values!688) e!486721)))

(declare-fun b!874121 () Bool)

(declare-fun res!594011 () Bool)

(assert (=> b!874121 (=> (not res!594011) (not e!486723))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!874121 (= res!594011 (and (= (size!24834 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24833 _keys!868) (size!24834 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!874122 () Bool)

(assert (=> b!874122 (= e!486721 (and e!486724 mapRes!27560))))

(declare-fun condMapEmpty!27560 () Bool)

(declare-fun mapDefault!27560 () ValueCell!8211)

(assert (=> b!874122 (= condMapEmpty!27560 (= (arr!24394 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8211)) mapDefault!27560)))))

(declare-fun mapNonEmpty!27560 () Bool)

(declare-fun tp!52845 () Bool)

(assert (=> mapNonEmpty!27560 (= mapRes!27560 (and tp!52845 e!486722))))

(declare-fun mapRest!27560 () (Array (_ BitVec 32) ValueCell!8211))

(declare-fun mapKey!27560 () (_ BitVec 32))

(declare-fun mapValue!27560 () ValueCell!8211)

(assert (=> mapNonEmpty!27560 (= (arr!24394 _values!688) (store mapRest!27560 mapKey!27560 mapValue!27560))))

(declare-fun b!874123 () Bool)

(assert (=> b!874123 (= e!486723 false)))

(declare-fun v!557 () V!28115)

(declare-fun minValue!654 () V!28115)

(declare-fun zeroValue!654 () V!28115)

(declare-datatypes ((tuple2!11498 0))(
  ( (tuple2!11499 (_1!5760 (_ BitVec 64)) (_2!5760 V!28115)) )
))
(declare-datatypes ((List!17317 0))(
  ( (Nil!17314) (Cons!17313 (h!18444 tuple2!11498) (t!24358 List!17317)) )
))
(declare-datatypes ((ListLongMap!10267 0))(
  ( (ListLongMap!10268 (toList!5149 List!17317)) )
))
(declare-fun lt!395885 () ListLongMap!10267)

(declare-fun defaultEntry!696 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3116 (array!50730 array!50732 (_ BitVec 32) (_ BitVec 32) V!28115 V!28115 (_ BitVec 32) Int) ListLongMap!10267)

(assert (=> b!874123 (= lt!395885 (getCurrentListMapNoExtraKeys!3116 _keys!868 (array!50733 (store (arr!24394 _values!688) i!612 (ValueCellFull!8211 v!557)) (size!24834 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395884 () ListLongMap!10267)

(assert (=> b!874123 (= lt!395884 (getCurrentListMapNoExtraKeys!3116 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!874124 () Bool)

(declare-fun res!594016 () Bool)

(assert (=> b!874124 (=> (not res!594016) (not e!486723))))

(declare-datatypes ((List!17318 0))(
  ( (Nil!17315) (Cons!17314 (h!18445 (_ BitVec 64)) (t!24359 List!17318)) )
))
(declare-fun arrayNoDuplicates!0 (array!50730 (_ BitVec 32) List!17318) Bool)

(assert (=> b!874124 (= res!594016 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17315))))

(declare-fun b!874125 () Bool)

(declare-fun res!594018 () Bool)

(assert (=> b!874125 (=> (not res!594018) (not e!486723))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874125 (= res!594018 (validKeyInArray!0 k0!854))))

(assert (= (and start!74294 res!594015) b!874116))

(assert (= (and b!874116 res!594012) b!874121))

(assert (= (and b!874121 res!594011) b!874119))

(assert (= (and b!874119 res!594017) b!874124))

(assert (= (and b!874124 res!594016) b!874117))

(assert (= (and b!874117 res!594014) b!874125))

(assert (= (and b!874125 res!594018) b!874115))

(assert (= (and b!874115 res!594013) b!874123))

(assert (= (and b!874122 condMapEmpty!27560) mapIsEmpty!27560))

(assert (= (and b!874122 (not condMapEmpty!27560)) mapNonEmpty!27560))

(get-info :version)

(assert (= (and mapNonEmpty!27560 ((_ is ValueCellFull!8211) mapValue!27560)) b!874118))

(assert (= (and b!874122 ((_ is ValueCellFull!8211) mapDefault!27560)) b!874120))

(assert (= start!74294 b!874122))

(declare-fun m!814391 () Bool)

(assert (=> b!874125 m!814391))

(declare-fun m!814393 () Bool)

(assert (=> b!874115 m!814393))

(declare-fun m!814395 () Bool)

(assert (=> b!874124 m!814395))

(declare-fun m!814397 () Bool)

(assert (=> b!874119 m!814397))

(declare-fun m!814399 () Bool)

(assert (=> b!874123 m!814399))

(declare-fun m!814401 () Bool)

(assert (=> b!874123 m!814401))

(declare-fun m!814403 () Bool)

(assert (=> b!874123 m!814403))

(declare-fun m!814405 () Bool)

(assert (=> start!74294 m!814405))

(declare-fun m!814407 () Bool)

(assert (=> start!74294 m!814407))

(declare-fun m!814409 () Bool)

(assert (=> mapNonEmpty!27560 m!814409))

(declare-fun m!814411 () Bool)

(assert (=> b!874116 m!814411))

(check-sat (not b!874125) b_and!24833 tp_is_empty!17301 (not b!874123) (not b_next!15057) (not b!874119) (not mapNonEmpty!27560) (not start!74294) (not b!874124) (not b!874116))
(check-sat b_and!24833 (not b_next!15057))
