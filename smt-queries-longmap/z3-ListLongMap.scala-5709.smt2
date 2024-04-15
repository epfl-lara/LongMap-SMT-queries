; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74020 () Bool)

(assert start!74020)

(declare-fun b_free!14953 () Bool)

(declare-fun b_next!14953 () Bool)

(assert (=> start!74020 (= b_free!14953 (not b_next!14953))))

(declare-fun tp!52364 () Bool)

(declare-fun b_and!24679 () Bool)

(assert (=> start!74020 (= tp!52364 b_and!24679)))

(declare-fun b!870568 () Bool)

(declare-fun res!591774 () Bool)

(declare-fun e!484726 () Bool)

(assert (=> b!870568 (=> (not res!591774) (not e!484726))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50305 0))(
  ( (array!50306 (arr!24184 (Array (_ BitVec 32) (_ BitVec 64))) (size!24626 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50305)

(declare-datatypes ((V!27833 0))(
  ( (V!27834 (val!8592 Int)) )
))
(declare-datatypes ((ValueCell!8105 0))(
  ( (ValueCellFull!8105 (v!11011 V!27833)) (EmptyCell!8105) )
))
(declare-datatypes ((array!50307 0))(
  ( (array!50308 (arr!24185 (Array (_ BitVec 32) ValueCell!8105)) (size!24627 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50307)

(assert (=> b!870568 (= res!591774 (and (= (size!24627 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24626 _keys!868) (size!24627 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!870569 () Bool)

(declare-fun e!484728 () Bool)

(assert (=> b!870569 (= e!484728 (not true))))

(declare-fun lt!395022 () array!50307)

(declare-fun v!557 () V!27833)

(declare-fun defaultEntry!696 () Int)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27833)

(declare-fun zeroValue!654 () V!27833)

(declare-datatypes ((tuple2!11430 0))(
  ( (tuple2!11431 (_1!5726 (_ BitVec 64)) (_2!5726 V!27833)) )
))
(declare-datatypes ((List!17207 0))(
  ( (Nil!17204) (Cons!17203 (h!18334 tuple2!11430) (t!24235 List!17207)) )
))
(declare-datatypes ((ListLongMap!10189 0))(
  ( (ListLongMap!10190 (toList!5110 List!17207)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3103 (array!50305 array!50307 (_ BitVec 32) (_ BitVec 32) V!27833 V!27833 (_ BitVec 32) Int) ListLongMap!10189)

(declare-fun +!2469 (ListLongMap!10189 tuple2!11430) ListLongMap!10189)

(assert (=> b!870569 (= (getCurrentListMapNoExtraKeys!3103 _keys!868 lt!395022 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2469 (getCurrentListMapNoExtraKeys!3103 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11431 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29825 0))(
  ( (Unit!29826) )
))
(declare-fun lt!395024 () Unit!29825)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!637 (array!50305 array!50307 (_ BitVec 32) (_ BitVec 32) V!27833 V!27833 (_ BitVec 32) (_ BitVec 64) V!27833 (_ BitVec 32) Int) Unit!29825)

(assert (=> b!870569 (= lt!395024 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!637 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!870570 () Bool)

(declare-fun e!484731 () Bool)

(declare-fun tp_is_empty!17089 () Bool)

(assert (=> b!870570 (= e!484731 tp_is_empty!17089)))

(declare-fun b!870571 () Bool)

(declare-fun res!591769 () Bool)

(assert (=> b!870571 (=> (not res!591769) (not e!484726))))

(declare-datatypes ((List!17208 0))(
  ( (Nil!17205) (Cons!17204 (h!18335 (_ BitVec 64)) (t!24236 List!17208)) )
))
(declare-fun arrayNoDuplicates!0 (array!50305 (_ BitVec 32) List!17208) Bool)

(assert (=> b!870571 (= res!591769 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17205))))

(declare-fun b!870572 () Bool)

(declare-fun e!484729 () Bool)

(assert (=> b!870572 (= e!484729 tp_is_empty!17089)))

(declare-fun b!870573 () Bool)

(declare-fun res!591777 () Bool)

(assert (=> b!870573 (=> (not res!591777) (not e!484726))))

(assert (=> b!870573 (= res!591777 (and (= (select (arr!24184 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!870574 () Bool)

(declare-fun res!591770 () Bool)

(assert (=> b!870574 (=> (not res!591770) (not e!484726))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870574 (= res!591770 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27233 () Bool)

(declare-fun mapRes!27233 () Bool)

(declare-fun tp!52363 () Bool)

(assert (=> mapNonEmpty!27233 (= mapRes!27233 (and tp!52363 e!484731))))

(declare-fun mapKey!27233 () (_ BitVec 32))

(declare-fun mapValue!27233 () ValueCell!8105)

(declare-fun mapRest!27233 () (Array (_ BitVec 32) ValueCell!8105))

(assert (=> mapNonEmpty!27233 (= (arr!24185 _values!688) (store mapRest!27233 mapKey!27233 mapValue!27233))))

(declare-fun res!591773 () Bool)

(assert (=> start!74020 (=> (not res!591773) (not e!484726))))

(assert (=> start!74020 (= res!591773 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24626 _keys!868))))))

(assert (=> start!74020 e!484726))

(assert (=> start!74020 tp_is_empty!17089))

(assert (=> start!74020 true))

(assert (=> start!74020 tp!52364))

(declare-fun array_inv!19156 (array!50305) Bool)

(assert (=> start!74020 (array_inv!19156 _keys!868)))

(declare-fun e!484730 () Bool)

(declare-fun array_inv!19157 (array!50307) Bool)

(assert (=> start!74020 (and (array_inv!19157 _values!688) e!484730)))

(declare-fun mapIsEmpty!27233 () Bool)

(assert (=> mapIsEmpty!27233 mapRes!27233))

(declare-fun b!870575 () Bool)

(declare-fun res!591775 () Bool)

(assert (=> b!870575 (=> (not res!591775) (not e!484726))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50305 (_ BitVec 32)) Bool)

(assert (=> b!870575 (= res!591775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!870576 () Bool)

(assert (=> b!870576 (= e!484730 (and e!484729 mapRes!27233))))

(declare-fun condMapEmpty!27233 () Bool)

(declare-fun mapDefault!27233 () ValueCell!8105)

(assert (=> b!870576 (= condMapEmpty!27233 (= (arr!24185 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8105)) mapDefault!27233)))))

(declare-fun b!870577 () Bool)

(declare-fun res!591771 () Bool)

(assert (=> b!870577 (=> (not res!591771) (not e!484726))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870577 (= res!591771 (validKeyInArray!0 k0!854))))

(declare-fun b!870578 () Bool)

(assert (=> b!870578 (= e!484726 e!484728)))

(declare-fun res!591772 () Bool)

(assert (=> b!870578 (=> (not res!591772) (not e!484728))))

(assert (=> b!870578 (= res!591772 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395023 () ListLongMap!10189)

(assert (=> b!870578 (= lt!395023 (getCurrentListMapNoExtraKeys!3103 _keys!868 lt!395022 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!870578 (= lt!395022 (array!50308 (store (arr!24185 _values!688) i!612 (ValueCellFull!8105 v!557)) (size!24627 _values!688)))))

(declare-fun lt!395021 () ListLongMap!10189)

(assert (=> b!870578 (= lt!395021 (getCurrentListMapNoExtraKeys!3103 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!870579 () Bool)

(declare-fun res!591776 () Bool)

(assert (=> b!870579 (=> (not res!591776) (not e!484726))))

(assert (=> b!870579 (= res!591776 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24626 _keys!868))))))

(assert (= (and start!74020 res!591773) b!870574))

(assert (= (and b!870574 res!591770) b!870568))

(assert (= (and b!870568 res!591774) b!870575))

(assert (= (and b!870575 res!591775) b!870571))

(assert (= (and b!870571 res!591769) b!870579))

(assert (= (and b!870579 res!591776) b!870577))

(assert (= (and b!870577 res!591771) b!870573))

(assert (= (and b!870573 res!591777) b!870578))

(assert (= (and b!870578 res!591772) b!870569))

(assert (= (and b!870576 condMapEmpty!27233) mapIsEmpty!27233))

(assert (= (and b!870576 (not condMapEmpty!27233)) mapNonEmpty!27233))

(get-info :version)

(assert (= (and mapNonEmpty!27233 ((_ is ValueCellFull!8105) mapValue!27233)) b!870570))

(assert (= (and b!870576 ((_ is ValueCellFull!8105) mapDefault!27233)) b!870572))

(assert (= start!74020 b!870576))

(declare-fun m!811359 () Bool)

(assert (=> b!870577 m!811359))

(declare-fun m!811361 () Bool)

(assert (=> b!870569 m!811361))

(declare-fun m!811363 () Bool)

(assert (=> b!870569 m!811363))

(assert (=> b!870569 m!811363))

(declare-fun m!811365 () Bool)

(assert (=> b!870569 m!811365))

(declare-fun m!811367 () Bool)

(assert (=> b!870569 m!811367))

(declare-fun m!811369 () Bool)

(assert (=> b!870571 m!811369))

(declare-fun m!811371 () Bool)

(assert (=> mapNonEmpty!27233 m!811371))

(declare-fun m!811373 () Bool)

(assert (=> start!74020 m!811373))

(declare-fun m!811375 () Bool)

(assert (=> start!74020 m!811375))

(declare-fun m!811377 () Bool)

(assert (=> b!870575 m!811377))

(declare-fun m!811379 () Bool)

(assert (=> b!870578 m!811379))

(declare-fun m!811381 () Bool)

(assert (=> b!870578 m!811381))

(declare-fun m!811383 () Bool)

(assert (=> b!870578 m!811383))

(declare-fun m!811385 () Bool)

(assert (=> b!870574 m!811385))

(declare-fun m!811387 () Bool)

(assert (=> b!870573 m!811387))

(check-sat (not b!870577) tp_is_empty!17089 b_and!24679 (not b!870569) (not start!74020) (not b!870575) (not b!870574) (not b_next!14953) (not b!870578) (not b!870571) (not mapNonEmpty!27233))
(check-sat b_and!24679 (not b_next!14953))
