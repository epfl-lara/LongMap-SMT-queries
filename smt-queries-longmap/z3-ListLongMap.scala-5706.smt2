; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74002 () Bool)

(assert start!74002)

(declare-fun b_free!14935 () Bool)

(declare-fun b_next!14935 () Bool)

(assert (=> start!74002 (= b_free!14935 (not b_next!14935))))

(declare-fun tp!52310 () Bool)

(declare-fun b_and!24661 () Bool)

(assert (=> start!74002 (= tp!52310 b_and!24661)))

(declare-fun mapIsEmpty!27206 () Bool)

(declare-fun mapRes!27206 () Bool)

(assert (=> mapIsEmpty!27206 mapRes!27206))

(declare-fun b!870244 () Bool)

(declare-fun res!591533 () Bool)

(declare-fun e!484566 () Bool)

(assert (=> b!870244 (=> (not res!591533) (not e!484566))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!50273 0))(
  ( (array!50274 (arr!24168 (Array (_ BitVec 32) (_ BitVec 64))) (size!24610 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50273)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!870244 (= res!591533 (and (= (select (arr!24168 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!870245 () Bool)

(declare-fun e!484568 () Bool)

(declare-fun tp_is_empty!17071 () Bool)

(assert (=> b!870245 (= e!484568 tp_is_empty!17071)))

(declare-fun b!870246 () Bool)

(declare-fun res!591526 () Bool)

(assert (=> b!870246 (=> (not res!591526) (not e!484566))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870246 (= res!591526 (validMask!0 mask!1196))))

(declare-fun b!870247 () Bool)

(declare-fun e!484567 () Bool)

(assert (=> b!870247 (= e!484567 (not true))))

(declare-datatypes ((V!27809 0))(
  ( (V!27810 (val!8583 Int)) )
))
(declare-fun v!557 () V!27809)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8096 0))(
  ( (ValueCellFull!8096 (v!11002 V!27809)) (EmptyCell!8096) )
))
(declare-datatypes ((array!50275 0))(
  ( (array!50276 (arr!24169 (Array (_ BitVec 32) ValueCell!8096)) (size!24611 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50275)

(declare-fun minValue!654 () V!27809)

(declare-fun zeroValue!654 () V!27809)

(declare-fun lt!394916 () array!50275)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11420 0))(
  ( (tuple2!11421 (_1!5721 (_ BitVec 64)) (_2!5721 V!27809)) )
))
(declare-datatypes ((List!17198 0))(
  ( (Nil!17195) (Cons!17194 (h!18325 tuple2!11420) (t!24226 List!17198)) )
))
(declare-datatypes ((ListLongMap!10179 0))(
  ( (ListLongMap!10180 (toList!5105 List!17198)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3098 (array!50273 array!50275 (_ BitVec 32) (_ BitVec 32) V!27809 V!27809 (_ BitVec 32) Int) ListLongMap!10179)

(declare-fun +!2465 (ListLongMap!10179 tuple2!11420) ListLongMap!10179)

(assert (=> b!870247 (= (getCurrentListMapNoExtraKeys!3098 _keys!868 lt!394916 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2465 (getCurrentListMapNoExtraKeys!3098 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11421 k0!854 v!557)))))

(declare-datatypes ((Unit!29817 0))(
  ( (Unit!29818) )
))
(declare-fun lt!394915 () Unit!29817)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!633 (array!50273 array!50275 (_ BitVec 32) (_ BitVec 32) V!27809 V!27809 (_ BitVec 32) (_ BitVec 64) V!27809 (_ BitVec 32) Int) Unit!29817)

(assert (=> b!870247 (= lt!394915 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!633 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!870248 () Bool)

(declare-fun e!484565 () Bool)

(assert (=> b!870248 (= e!484565 (and e!484568 mapRes!27206))))

(declare-fun condMapEmpty!27206 () Bool)

(declare-fun mapDefault!27206 () ValueCell!8096)

(assert (=> b!870248 (= condMapEmpty!27206 (= (arr!24169 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8096)) mapDefault!27206)))))

(declare-fun b!870249 () Bool)

(declare-fun e!484564 () Bool)

(assert (=> b!870249 (= e!484564 tp_is_empty!17071)))

(declare-fun b!870250 () Bool)

(assert (=> b!870250 (= e!484566 e!484567)))

(declare-fun res!591527 () Bool)

(assert (=> b!870250 (=> (not res!591527) (not e!484567))))

(assert (=> b!870250 (= res!591527 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394914 () ListLongMap!10179)

(assert (=> b!870250 (= lt!394914 (getCurrentListMapNoExtraKeys!3098 _keys!868 lt!394916 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!870250 (= lt!394916 (array!50276 (store (arr!24169 _values!688) i!612 (ValueCellFull!8096 v!557)) (size!24611 _values!688)))))

(declare-fun lt!394913 () ListLongMap!10179)

(assert (=> b!870250 (= lt!394913 (getCurrentListMapNoExtraKeys!3098 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!870251 () Bool)

(declare-fun res!591534 () Bool)

(assert (=> b!870251 (=> (not res!591534) (not e!484566))))

(assert (=> b!870251 (= res!591534 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24610 _keys!868))))))

(declare-fun b!870253 () Bool)

(declare-fun res!591532 () Bool)

(assert (=> b!870253 (=> (not res!591532) (not e!484566))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870253 (= res!591532 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!27206 () Bool)

(declare-fun tp!52309 () Bool)

(assert (=> mapNonEmpty!27206 (= mapRes!27206 (and tp!52309 e!484564))))

(declare-fun mapRest!27206 () (Array (_ BitVec 32) ValueCell!8096))

(declare-fun mapValue!27206 () ValueCell!8096)

(declare-fun mapKey!27206 () (_ BitVec 32))

(assert (=> mapNonEmpty!27206 (= (arr!24169 _values!688) (store mapRest!27206 mapKey!27206 mapValue!27206))))

(declare-fun b!870254 () Bool)

(declare-fun res!591529 () Bool)

(assert (=> b!870254 (=> (not res!591529) (not e!484566))))

(assert (=> b!870254 (= res!591529 (and (= (size!24611 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24610 _keys!868) (size!24611 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!870255 () Bool)

(declare-fun res!591531 () Bool)

(assert (=> b!870255 (=> (not res!591531) (not e!484566))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50273 (_ BitVec 32)) Bool)

(assert (=> b!870255 (= res!591531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!591530 () Bool)

(assert (=> start!74002 (=> (not res!591530) (not e!484566))))

(assert (=> start!74002 (= res!591530 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24610 _keys!868))))))

(assert (=> start!74002 e!484566))

(assert (=> start!74002 tp_is_empty!17071))

(assert (=> start!74002 true))

(assert (=> start!74002 tp!52310))

(declare-fun array_inv!19144 (array!50273) Bool)

(assert (=> start!74002 (array_inv!19144 _keys!868)))

(declare-fun array_inv!19145 (array!50275) Bool)

(assert (=> start!74002 (and (array_inv!19145 _values!688) e!484565)))

(declare-fun b!870252 () Bool)

(declare-fun res!591528 () Bool)

(assert (=> b!870252 (=> (not res!591528) (not e!484566))))

(declare-datatypes ((List!17199 0))(
  ( (Nil!17196) (Cons!17195 (h!18326 (_ BitVec 64)) (t!24227 List!17199)) )
))
(declare-fun arrayNoDuplicates!0 (array!50273 (_ BitVec 32) List!17199) Bool)

(assert (=> b!870252 (= res!591528 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17196))))

(assert (= (and start!74002 res!591530) b!870246))

(assert (= (and b!870246 res!591526) b!870254))

(assert (= (and b!870254 res!591529) b!870255))

(assert (= (and b!870255 res!591531) b!870252))

(assert (= (and b!870252 res!591528) b!870251))

(assert (= (and b!870251 res!591534) b!870253))

(assert (= (and b!870253 res!591532) b!870244))

(assert (= (and b!870244 res!591533) b!870250))

(assert (= (and b!870250 res!591527) b!870247))

(assert (= (and b!870248 condMapEmpty!27206) mapIsEmpty!27206))

(assert (= (and b!870248 (not condMapEmpty!27206)) mapNonEmpty!27206))

(get-info :version)

(assert (= (and mapNonEmpty!27206 ((_ is ValueCellFull!8096) mapValue!27206)) b!870249))

(assert (= (and b!870248 ((_ is ValueCellFull!8096) mapDefault!27206)) b!870245))

(assert (= start!74002 b!870248))

(declare-fun m!811089 () Bool)

(assert (=> b!870246 m!811089))

(declare-fun m!811091 () Bool)

(assert (=> mapNonEmpty!27206 m!811091))

(declare-fun m!811093 () Bool)

(assert (=> b!870247 m!811093))

(declare-fun m!811095 () Bool)

(assert (=> b!870247 m!811095))

(assert (=> b!870247 m!811095))

(declare-fun m!811097 () Bool)

(assert (=> b!870247 m!811097))

(declare-fun m!811099 () Bool)

(assert (=> b!870247 m!811099))

(declare-fun m!811101 () Bool)

(assert (=> b!870253 m!811101))

(declare-fun m!811103 () Bool)

(assert (=> b!870250 m!811103))

(declare-fun m!811105 () Bool)

(assert (=> b!870250 m!811105))

(declare-fun m!811107 () Bool)

(assert (=> b!870250 m!811107))

(declare-fun m!811109 () Bool)

(assert (=> b!870244 m!811109))

(declare-fun m!811111 () Bool)

(assert (=> start!74002 m!811111))

(declare-fun m!811113 () Bool)

(assert (=> start!74002 m!811113))

(declare-fun m!811115 () Bool)

(assert (=> b!870252 m!811115))

(declare-fun m!811117 () Bool)

(assert (=> b!870255 m!811117))

(check-sat (not mapNonEmpty!27206) (not b!870253) b_and!24661 (not b_next!14935) (not b!870250) (not b!870246) (not start!74002) (not b!870252) tp_is_empty!17071 (not b!870247) (not b!870255))
(check-sat b_and!24661 (not b_next!14935))
