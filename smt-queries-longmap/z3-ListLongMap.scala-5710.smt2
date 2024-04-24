; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74212 () Bool)

(assert start!74212)

(declare-fun b_free!14959 () Bool)

(declare-fun b_next!14959 () Bool)

(assert (=> start!74212 (= b_free!14959 (not b_next!14959))))

(declare-fun tp!52381 () Bool)

(declare-fun b_and!24721 () Bool)

(assert (=> start!74212 (= tp!52381 b_and!24721)))

(declare-fun b!871818 () Bool)

(declare-fun e!485512 () Bool)

(declare-fun e!485510 () Bool)

(assert (=> b!871818 (= e!485512 e!485510)))

(declare-fun res!592310 () Bool)

(assert (=> b!871818 (=> (not res!592310) (not e!485510))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!871818 (= res!592310 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27841 0))(
  ( (V!27842 (val!8595 Int)) )
))
(declare-datatypes ((ValueCell!8108 0))(
  ( (ValueCellFull!8108 (v!11020 V!27841)) (EmptyCell!8108) )
))
(declare-datatypes ((array!50391 0))(
  ( (array!50392 (arr!24222 (Array (_ BitVec 32) ValueCell!8108)) (size!24663 (_ BitVec 32))) )
))
(declare-fun lt!395655 () array!50391)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!11354 0))(
  ( (tuple2!11355 (_1!5688 (_ BitVec 64)) (_2!5688 V!27841)) )
))
(declare-datatypes ((List!17172 0))(
  ( (Nil!17169) (Cons!17168 (h!18305 tuple2!11354) (t!24201 List!17172)) )
))
(declare-datatypes ((ListLongMap!10125 0))(
  ( (ListLongMap!10126 (toList!5078 List!17172)) )
))
(declare-fun lt!395657 () ListLongMap!10125)

(declare-datatypes ((array!50393 0))(
  ( (array!50394 (arr!24223 (Array (_ BitVec 32) (_ BitVec 64))) (size!24664 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50393)

(declare-fun minValue!654 () V!27841)

(declare-fun zeroValue!654 () V!27841)

(declare-fun getCurrentListMapNoExtraKeys!3122 (array!50393 array!50391 (_ BitVec 32) (_ BitVec 32) V!27841 V!27841 (_ BitVec 32) Int) ListLongMap!10125)

(assert (=> b!871818 (= lt!395657 (getCurrentListMapNoExtraKeys!3122 _keys!868 lt!395655 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27841)

(declare-fun _values!688 () array!50391)

(assert (=> b!871818 (= lt!395655 (array!50392 (store (arr!24222 _values!688) i!612 (ValueCellFull!8108 v!557)) (size!24663 _values!688)))))

(declare-fun lt!395656 () ListLongMap!10125)

(assert (=> b!871818 (= lt!395656 (getCurrentListMapNoExtraKeys!3122 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!27242 () Bool)

(declare-fun mapRes!27242 () Bool)

(declare-fun tp!52382 () Bool)

(declare-fun e!485513 () Bool)

(assert (=> mapNonEmpty!27242 (= mapRes!27242 (and tp!52382 e!485513))))

(declare-fun mapRest!27242 () (Array (_ BitVec 32) ValueCell!8108))

(declare-fun mapValue!27242 () ValueCell!8108)

(declare-fun mapKey!27242 () (_ BitVec 32))

(assert (=> mapNonEmpty!27242 (= (arr!24222 _values!688) (store mapRest!27242 mapKey!27242 mapValue!27242))))

(declare-fun b!871819 () Bool)

(declare-fun res!592311 () Bool)

(assert (=> b!871819 (=> (not res!592311) (not e!485512))))

(assert (=> b!871819 (= res!592311 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24664 _keys!868))))))

(declare-fun mapIsEmpty!27242 () Bool)

(assert (=> mapIsEmpty!27242 mapRes!27242))

(declare-fun b!871820 () Bool)

(declare-fun tp_is_empty!17095 () Bool)

(assert (=> b!871820 (= e!485513 tp_is_empty!17095)))

(declare-fun b!871821 () Bool)

(assert (=> b!871821 (= e!485510 (not true))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2468 (ListLongMap!10125 tuple2!11354) ListLongMap!10125)

(assert (=> b!871821 (= (getCurrentListMapNoExtraKeys!3122 _keys!868 lt!395655 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2468 (getCurrentListMapNoExtraKeys!3122 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11355 k0!854 v!557)))))

(declare-datatypes ((Unit!29886 0))(
  ( (Unit!29887) )
))
(declare-fun lt!395654 () Unit!29886)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!639 (array!50393 array!50391 (_ BitVec 32) (_ BitVec 32) V!27841 V!27841 (_ BitVec 32) (_ BitVec 64) V!27841 (_ BitVec 32) Int) Unit!29886)

(assert (=> b!871821 (= lt!395654 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!639 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!871822 () Bool)

(declare-fun res!592312 () Bool)

(assert (=> b!871822 (=> (not res!592312) (not e!485512))))

(declare-datatypes ((List!17173 0))(
  ( (Nil!17170) (Cons!17169 (h!18306 (_ BitVec 64)) (t!24202 List!17173)) )
))
(declare-fun arrayNoDuplicates!0 (array!50393 (_ BitVec 32) List!17173) Bool)

(assert (=> b!871822 (= res!592312 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17170))))

(declare-fun res!592308 () Bool)

(assert (=> start!74212 (=> (not res!592308) (not e!485512))))

(assert (=> start!74212 (= res!592308 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24664 _keys!868))))))

(assert (=> start!74212 e!485512))

(assert (=> start!74212 tp_is_empty!17095))

(assert (=> start!74212 true))

(assert (=> start!74212 tp!52381))

(declare-fun array_inv!19184 (array!50393) Bool)

(assert (=> start!74212 (array_inv!19184 _keys!868)))

(declare-fun e!485514 () Bool)

(declare-fun array_inv!19185 (array!50391) Bool)

(assert (=> start!74212 (and (array_inv!19185 _values!688) e!485514)))

(declare-fun b!871823 () Bool)

(declare-fun res!592305 () Bool)

(assert (=> b!871823 (=> (not res!592305) (not e!485512))))

(assert (=> b!871823 (= res!592305 (and (= (select (arr!24223 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!871824 () Bool)

(declare-fun res!592304 () Bool)

(assert (=> b!871824 (=> (not res!592304) (not e!485512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!871824 (= res!592304 (validMask!0 mask!1196))))

(declare-fun b!871825 () Bool)

(declare-fun res!592306 () Bool)

(assert (=> b!871825 (=> (not res!592306) (not e!485512))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!871825 (= res!592306 (validKeyInArray!0 k0!854))))

(declare-fun b!871826 () Bool)

(declare-fun e!485515 () Bool)

(assert (=> b!871826 (= e!485514 (and e!485515 mapRes!27242))))

(declare-fun condMapEmpty!27242 () Bool)

(declare-fun mapDefault!27242 () ValueCell!8108)

(assert (=> b!871826 (= condMapEmpty!27242 (= (arr!24222 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8108)) mapDefault!27242)))))

(declare-fun b!871827 () Bool)

(declare-fun res!592307 () Bool)

(assert (=> b!871827 (=> (not res!592307) (not e!485512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50393 (_ BitVec 32)) Bool)

(assert (=> b!871827 (= res!592307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!871828 () Bool)

(assert (=> b!871828 (= e!485515 tp_is_empty!17095)))

(declare-fun b!871829 () Bool)

(declare-fun res!592309 () Bool)

(assert (=> b!871829 (=> (not res!592309) (not e!485512))))

(assert (=> b!871829 (= res!592309 (and (= (size!24663 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24664 _keys!868) (size!24663 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!74212 res!592308) b!871824))

(assert (= (and b!871824 res!592304) b!871829))

(assert (= (and b!871829 res!592309) b!871827))

(assert (= (and b!871827 res!592307) b!871822))

(assert (= (and b!871822 res!592312) b!871819))

(assert (= (and b!871819 res!592311) b!871825))

(assert (= (and b!871825 res!592306) b!871823))

(assert (= (and b!871823 res!592305) b!871818))

(assert (= (and b!871818 res!592310) b!871821))

(assert (= (and b!871826 condMapEmpty!27242) mapIsEmpty!27242))

(assert (= (and b!871826 (not condMapEmpty!27242)) mapNonEmpty!27242))

(get-info :version)

(assert (= (and mapNonEmpty!27242 ((_ is ValueCellFull!8108) mapValue!27242)) b!871820))

(assert (= (and b!871826 ((_ is ValueCellFull!8108) mapDefault!27242)) b!871828))

(assert (= start!74212 b!871826))

(declare-fun m!813497 () Bool)

(assert (=> b!871823 m!813497))

(declare-fun m!813499 () Bool)

(assert (=> start!74212 m!813499))

(declare-fun m!813501 () Bool)

(assert (=> start!74212 m!813501))

(declare-fun m!813503 () Bool)

(assert (=> b!871827 m!813503))

(declare-fun m!813505 () Bool)

(assert (=> b!871824 m!813505))

(declare-fun m!813507 () Bool)

(assert (=> b!871825 m!813507))

(declare-fun m!813509 () Bool)

(assert (=> mapNonEmpty!27242 m!813509))

(declare-fun m!813511 () Bool)

(assert (=> b!871821 m!813511))

(declare-fun m!813513 () Bool)

(assert (=> b!871821 m!813513))

(assert (=> b!871821 m!813513))

(declare-fun m!813515 () Bool)

(assert (=> b!871821 m!813515))

(declare-fun m!813517 () Bool)

(assert (=> b!871821 m!813517))

(declare-fun m!813519 () Bool)

(assert (=> b!871818 m!813519))

(declare-fun m!813521 () Bool)

(assert (=> b!871818 m!813521))

(declare-fun m!813523 () Bool)

(assert (=> b!871818 m!813523))

(declare-fun m!813525 () Bool)

(assert (=> b!871822 m!813525))

(check-sat (not start!74212) (not mapNonEmpty!27242) (not b!871818) (not b!871822) (not b!871821) (not b!871825) (not b!871827) (not b_next!14959) b_and!24721 tp_is_empty!17095 (not b!871824))
(check-sat b_and!24721 (not b_next!14959))
