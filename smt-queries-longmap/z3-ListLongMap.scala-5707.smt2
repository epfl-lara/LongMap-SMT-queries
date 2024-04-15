; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74008 () Bool)

(assert start!74008)

(declare-fun b_free!14941 () Bool)

(declare-fun b_next!14941 () Bool)

(assert (=> start!74008 (= b_free!14941 (not b_next!14941))))

(declare-fun tp!52327 () Bool)

(declare-fun b_and!24667 () Bool)

(assert (=> start!74008 (= tp!52327 b_and!24667)))

(declare-fun res!591611 () Bool)

(declare-fun e!484619 () Bool)

(assert (=> start!74008 (=> (not res!591611) (not e!484619))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50283 0))(
  ( (array!50284 (arr!24173 (Array (_ BitVec 32) (_ BitVec 64))) (size!24615 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50283)

(assert (=> start!74008 (= res!591611 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24615 _keys!868))))))

(assert (=> start!74008 e!484619))

(declare-fun tp_is_empty!17077 () Bool)

(assert (=> start!74008 tp_is_empty!17077))

(assert (=> start!74008 true))

(assert (=> start!74008 tp!52327))

(declare-fun array_inv!19148 (array!50283) Bool)

(assert (=> start!74008 (array_inv!19148 _keys!868)))

(declare-datatypes ((V!27817 0))(
  ( (V!27818 (val!8586 Int)) )
))
(declare-datatypes ((ValueCell!8099 0))(
  ( (ValueCellFull!8099 (v!11005 V!27817)) (EmptyCell!8099) )
))
(declare-datatypes ((array!50285 0))(
  ( (array!50286 (arr!24174 (Array (_ BitVec 32) ValueCell!8099)) (size!24616 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50285)

(declare-fun e!484621 () Bool)

(declare-fun array_inv!19149 (array!50285) Bool)

(assert (=> start!74008 (and (array_inv!19149 _values!688) e!484621)))

(declare-fun mapIsEmpty!27215 () Bool)

(declare-fun mapRes!27215 () Bool)

(assert (=> mapIsEmpty!27215 mapRes!27215))

(declare-fun b!870352 () Bool)

(declare-fun e!484622 () Bool)

(assert (=> b!870352 (= e!484622 (not true))))

(declare-fun v!557 () V!27817)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!27817)

(declare-fun zeroValue!654 () V!27817)

(declare-fun lt!394950 () array!50285)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11422 0))(
  ( (tuple2!11423 (_1!5722 (_ BitVec 64)) (_2!5722 V!27817)) )
))
(declare-datatypes ((List!17200 0))(
  ( (Nil!17197) (Cons!17196 (h!18327 tuple2!11422) (t!24228 List!17200)) )
))
(declare-datatypes ((ListLongMap!10181 0))(
  ( (ListLongMap!10182 (toList!5106 List!17200)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3099 (array!50283 array!50285 (_ BitVec 32) (_ BitVec 32) V!27817 V!27817 (_ BitVec 32) Int) ListLongMap!10181)

(declare-fun +!2466 (ListLongMap!10181 tuple2!11422) ListLongMap!10181)

(assert (=> b!870352 (= (getCurrentListMapNoExtraKeys!3099 _keys!868 lt!394950 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2466 (getCurrentListMapNoExtraKeys!3099 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11423 k0!854 v!557)))))

(declare-datatypes ((Unit!29819 0))(
  ( (Unit!29820) )
))
(declare-fun lt!394949 () Unit!29819)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!634 (array!50283 array!50285 (_ BitVec 32) (_ BitVec 32) V!27817 V!27817 (_ BitVec 32) (_ BitVec 64) V!27817 (_ BitVec 32) Int) Unit!29819)

(assert (=> b!870352 (= lt!394949 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!634 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!870353 () Bool)

(declare-fun e!484620 () Bool)

(assert (=> b!870353 (= e!484620 tp_is_empty!17077)))

(declare-fun b!870354 () Bool)

(assert (=> b!870354 (= e!484619 e!484622)))

(declare-fun res!591609 () Bool)

(assert (=> b!870354 (=> (not res!591609) (not e!484622))))

(assert (=> b!870354 (= res!591609 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394951 () ListLongMap!10181)

(assert (=> b!870354 (= lt!394951 (getCurrentListMapNoExtraKeys!3099 _keys!868 lt!394950 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!870354 (= lt!394950 (array!50286 (store (arr!24174 _values!688) i!612 (ValueCellFull!8099 v!557)) (size!24616 _values!688)))))

(declare-fun lt!394952 () ListLongMap!10181)

(assert (=> b!870354 (= lt!394952 (getCurrentListMapNoExtraKeys!3099 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!870355 () Bool)

(declare-fun e!484618 () Bool)

(assert (=> b!870355 (= e!484618 tp_is_empty!17077)))

(declare-fun b!870356 () Bool)

(declare-fun res!591612 () Bool)

(assert (=> b!870356 (=> (not res!591612) (not e!484619))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50283 (_ BitVec 32)) Bool)

(assert (=> b!870356 (= res!591612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!870357 () Bool)

(declare-fun res!591610 () Bool)

(assert (=> b!870357 (=> (not res!591610) (not e!484619))))

(declare-datatypes ((List!17201 0))(
  ( (Nil!17198) (Cons!17197 (h!18328 (_ BitVec 64)) (t!24229 List!17201)) )
))
(declare-fun arrayNoDuplicates!0 (array!50283 (_ BitVec 32) List!17201) Bool)

(assert (=> b!870357 (= res!591610 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17198))))

(declare-fun b!870358 () Bool)

(declare-fun res!591608 () Bool)

(assert (=> b!870358 (=> (not res!591608) (not e!484619))))

(assert (=> b!870358 (= res!591608 (and (= (select (arr!24173 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!870359 () Bool)

(declare-fun res!591615 () Bool)

(assert (=> b!870359 (=> (not res!591615) (not e!484619))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870359 (= res!591615 (validKeyInArray!0 k0!854))))

(declare-fun b!870360 () Bool)

(declare-fun res!591607 () Bool)

(assert (=> b!870360 (=> (not res!591607) (not e!484619))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870360 (= res!591607 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27215 () Bool)

(declare-fun tp!52328 () Bool)

(assert (=> mapNonEmpty!27215 (= mapRes!27215 (and tp!52328 e!484620))))

(declare-fun mapKey!27215 () (_ BitVec 32))

(declare-fun mapRest!27215 () (Array (_ BitVec 32) ValueCell!8099))

(declare-fun mapValue!27215 () ValueCell!8099)

(assert (=> mapNonEmpty!27215 (= (arr!24174 _values!688) (store mapRest!27215 mapKey!27215 mapValue!27215))))

(declare-fun b!870361 () Bool)

(assert (=> b!870361 (= e!484621 (and e!484618 mapRes!27215))))

(declare-fun condMapEmpty!27215 () Bool)

(declare-fun mapDefault!27215 () ValueCell!8099)

(assert (=> b!870361 (= condMapEmpty!27215 (= (arr!24174 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8099)) mapDefault!27215)))))

(declare-fun b!870362 () Bool)

(declare-fun res!591614 () Bool)

(assert (=> b!870362 (=> (not res!591614) (not e!484619))))

(assert (=> b!870362 (= res!591614 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24615 _keys!868))))))

(declare-fun b!870363 () Bool)

(declare-fun res!591613 () Bool)

(assert (=> b!870363 (=> (not res!591613) (not e!484619))))

(assert (=> b!870363 (= res!591613 (and (= (size!24616 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24615 _keys!868) (size!24616 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!74008 res!591611) b!870360))

(assert (= (and b!870360 res!591607) b!870363))

(assert (= (and b!870363 res!591613) b!870356))

(assert (= (and b!870356 res!591612) b!870357))

(assert (= (and b!870357 res!591610) b!870362))

(assert (= (and b!870362 res!591614) b!870359))

(assert (= (and b!870359 res!591615) b!870358))

(assert (= (and b!870358 res!591608) b!870354))

(assert (= (and b!870354 res!591609) b!870352))

(assert (= (and b!870361 condMapEmpty!27215) mapIsEmpty!27215))

(assert (= (and b!870361 (not condMapEmpty!27215)) mapNonEmpty!27215))

(get-info :version)

(assert (= (and mapNonEmpty!27215 ((_ is ValueCellFull!8099) mapValue!27215)) b!870353))

(assert (= (and b!870361 ((_ is ValueCellFull!8099) mapDefault!27215)) b!870355))

(assert (= start!74008 b!870361))

(declare-fun m!811179 () Bool)

(assert (=> b!870354 m!811179))

(declare-fun m!811181 () Bool)

(assert (=> b!870354 m!811181))

(declare-fun m!811183 () Bool)

(assert (=> b!870354 m!811183))

(declare-fun m!811185 () Bool)

(assert (=> b!870357 m!811185))

(declare-fun m!811187 () Bool)

(assert (=> start!74008 m!811187))

(declare-fun m!811189 () Bool)

(assert (=> start!74008 m!811189))

(declare-fun m!811191 () Bool)

(assert (=> b!870358 m!811191))

(declare-fun m!811193 () Bool)

(assert (=> b!870356 m!811193))

(declare-fun m!811195 () Bool)

(assert (=> b!870359 m!811195))

(declare-fun m!811197 () Bool)

(assert (=> b!870352 m!811197))

(declare-fun m!811199 () Bool)

(assert (=> b!870352 m!811199))

(assert (=> b!870352 m!811199))

(declare-fun m!811201 () Bool)

(assert (=> b!870352 m!811201))

(declare-fun m!811203 () Bool)

(assert (=> b!870352 m!811203))

(declare-fun m!811205 () Bool)

(assert (=> b!870360 m!811205))

(declare-fun m!811207 () Bool)

(assert (=> mapNonEmpty!27215 m!811207))

(check-sat (not b!870357) (not b!870359) (not b!870354) (not b!870352) (not mapNonEmpty!27215) (not b!870360) (not b_next!14941) (not start!74008) b_and!24667 (not b!870356) tp_is_empty!17077)
(check-sat b_and!24667 (not b_next!14941))
