; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74152 () Bool)

(assert start!74152)

(declare-fun b_free!14899 () Bool)

(declare-fun b_next!14899 () Bool)

(assert (=> start!74152 (= b_free!14899 (not b_next!14899))))

(declare-fun tp!52201 () Bool)

(declare-fun b_and!24661 () Bool)

(assert (=> start!74152 (= tp!52201 b_and!24661)))

(declare-fun b!870738 () Bool)

(declare-fun res!591500 () Bool)

(declare-fun e!484972 () Bool)

(assert (=> b!870738 (=> (not res!591500) (not e!484972))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50275 0))(
  ( (array!50276 (arr!24164 (Array (_ BitVec 32) (_ BitVec 64))) (size!24605 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50275)

(assert (=> b!870738 (= res!591500 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24605 _keys!868))))))

(declare-fun b!870739 () Bool)

(declare-fun res!591499 () Bool)

(assert (=> b!870739 (=> (not res!591499) (not e!484972))))

(declare-datatypes ((List!17126 0))(
  ( (Nil!17123) (Cons!17122 (h!18259 (_ BitVec 64)) (t!24155 List!17126)) )
))
(declare-fun arrayNoDuplicates!0 (array!50275 (_ BitVec 32) List!17126) Bool)

(assert (=> b!870739 (= res!591499 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17123))))

(declare-fun b!870740 () Bool)

(declare-fun e!484973 () Bool)

(declare-fun tp_is_empty!17035 () Bool)

(assert (=> b!870740 (= e!484973 tp_is_empty!17035)))

(declare-fun b!870741 () Bool)

(declare-fun res!591497 () Bool)

(assert (=> b!870741 (=> (not res!591497) (not e!484972))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50275 (_ BitVec 32)) Bool)

(assert (=> b!870741 (= res!591497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!591501 () Bool)

(assert (=> start!74152 (=> (not res!591501) (not e!484972))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74152 (= res!591501 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24605 _keys!868))))))

(assert (=> start!74152 e!484972))

(assert (=> start!74152 tp_is_empty!17035))

(assert (=> start!74152 true))

(assert (=> start!74152 tp!52201))

(declare-fun array_inv!19140 (array!50275) Bool)

(assert (=> start!74152 (array_inv!19140 _keys!868)))

(declare-datatypes ((V!27761 0))(
  ( (V!27762 (val!8565 Int)) )
))
(declare-datatypes ((ValueCell!8078 0))(
  ( (ValueCellFull!8078 (v!10990 V!27761)) (EmptyCell!8078) )
))
(declare-datatypes ((array!50277 0))(
  ( (array!50278 (arr!24165 (Array (_ BitVec 32) ValueCell!8078)) (size!24606 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50277)

(declare-fun e!484974 () Bool)

(declare-fun array_inv!19141 (array!50277) Bool)

(assert (=> start!74152 (and (array_inv!19141 _values!688) e!484974)))

(declare-fun b!870742 () Bool)

(declare-fun res!591502 () Bool)

(assert (=> b!870742 (=> (not res!591502) (not e!484972))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!870742 (= res!591502 (and (= (select (arr!24164 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27152 () Bool)

(declare-fun mapRes!27152 () Bool)

(assert (=> mapIsEmpty!27152 mapRes!27152))

(declare-fun b!870743 () Bool)

(declare-fun res!591496 () Bool)

(assert (=> b!870743 (=> (not res!591496) (not e!484972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870743 (= res!591496 (validMask!0 mask!1196))))

(declare-fun b!870744 () Bool)

(declare-fun res!591498 () Bool)

(assert (=> b!870744 (=> (not res!591498) (not e!484972))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!870744 (= res!591498 (and (= (size!24606 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24605 _keys!868) (size!24606 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27152 () Bool)

(declare-fun tp!52202 () Bool)

(declare-fun e!484970 () Bool)

(assert (=> mapNonEmpty!27152 (= mapRes!27152 (and tp!52202 e!484970))))

(declare-fun mapKey!27152 () (_ BitVec 32))

(declare-fun mapValue!27152 () ValueCell!8078)

(declare-fun mapRest!27152 () (Array (_ BitVec 32) ValueCell!8078))

(assert (=> mapNonEmpty!27152 (= (arr!24165 _values!688) (store mapRest!27152 mapKey!27152 mapValue!27152))))

(declare-fun b!870745 () Bool)

(assert (=> b!870745 (= e!484970 tp_is_empty!17035)))

(declare-fun b!870746 () Bool)

(declare-fun e!484975 () Bool)

(assert (=> b!870746 (= e!484975 (not true))))

(declare-fun v!557 () V!27761)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!395295 () array!50277)

(declare-fun minValue!654 () V!27761)

(declare-fun zeroValue!654 () V!27761)

(declare-datatypes ((tuple2!11306 0))(
  ( (tuple2!11307 (_1!5664 (_ BitVec 64)) (_2!5664 V!27761)) )
))
(declare-datatypes ((List!17127 0))(
  ( (Nil!17124) (Cons!17123 (h!18260 tuple2!11306) (t!24156 List!17127)) )
))
(declare-datatypes ((ListLongMap!10077 0))(
  ( (ListLongMap!10078 (toList!5054 List!17127)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3098 (array!50275 array!50277 (_ BitVec 32) (_ BitVec 32) V!27761 V!27761 (_ BitVec 32) Int) ListLongMap!10077)

(declare-fun +!2447 (ListLongMap!10077 tuple2!11306) ListLongMap!10077)

(assert (=> b!870746 (= (getCurrentListMapNoExtraKeys!3098 _keys!868 lt!395295 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2447 (getCurrentListMapNoExtraKeys!3098 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11307 k0!854 v!557)))))

(declare-datatypes ((Unit!29844 0))(
  ( (Unit!29845) )
))
(declare-fun lt!395297 () Unit!29844)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!618 (array!50275 array!50277 (_ BitVec 32) (_ BitVec 32) V!27761 V!27761 (_ BitVec 32) (_ BitVec 64) V!27761 (_ BitVec 32) Int) Unit!29844)

(assert (=> b!870746 (= lt!395297 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!618 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!870747 () Bool)

(declare-fun res!591495 () Bool)

(assert (=> b!870747 (=> (not res!591495) (not e!484972))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870747 (= res!591495 (validKeyInArray!0 k0!854))))

(declare-fun b!870748 () Bool)

(assert (=> b!870748 (= e!484972 e!484975)))

(declare-fun res!591494 () Bool)

(assert (=> b!870748 (=> (not res!591494) (not e!484975))))

(assert (=> b!870748 (= res!591494 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395296 () ListLongMap!10077)

(assert (=> b!870748 (= lt!395296 (getCurrentListMapNoExtraKeys!3098 _keys!868 lt!395295 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!870748 (= lt!395295 (array!50278 (store (arr!24165 _values!688) i!612 (ValueCellFull!8078 v!557)) (size!24606 _values!688)))))

(declare-fun lt!395294 () ListLongMap!10077)

(assert (=> b!870748 (= lt!395294 (getCurrentListMapNoExtraKeys!3098 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!870749 () Bool)

(assert (=> b!870749 (= e!484974 (and e!484973 mapRes!27152))))

(declare-fun condMapEmpty!27152 () Bool)

(declare-fun mapDefault!27152 () ValueCell!8078)

(assert (=> b!870749 (= condMapEmpty!27152 (= (arr!24165 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8078)) mapDefault!27152)))))

(assert (= (and start!74152 res!591501) b!870743))

(assert (= (and b!870743 res!591496) b!870744))

(assert (= (and b!870744 res!591498) b!870741))

(assert (= (and b!870741 res!591497) b!870739))

(assert (= (and b!870739 res!591499) b!870738))

(assert (= (and b!870738 res!591500) b!870747))

(assert (= (and b!870747 res!591495) b!870742))

(assert (= (and b!870742 res!591502) b!870748))

(assert (= (and b!870748 res!591494) b!870746))

(assert (= (and b!870749 condMapEmpty!27152) mapIsEmpty!27152))

(assert (= (and b!870749 (not condMapEmpty!27152)) mapNonEmpty!27152))

(get-info :version)

(assert (= (and mapNonEmpty!27152 ((_ is ValueCellFull!8078) mapValue!27152)) b!870745))

(assert (= (and b!870749 ((_ is ValueCellFull!8078) mapDefault!27152)) b!870740))

(assert (= start!74152 b!870749))

(declare-fun m!812597 () Bool)

(assert (=> b!870739 m!812597))

(declare-fun m!812599 () Bool)

(assert (=> b!870747 m!812599))

(declare-fun m!812601 () Bool)

(assert (=> b!870741 m!812601))

(declare-fun m!812603 () Bool)

(assert (=> b!870748 m!812603))

(declare-fun m!812605 () Bool)

(assert (=> b!870748 m!812605))

(declare-fun m!812607 () Bool)

(assert (=> b!870748 m!812607))

(declare-fun m!812609 () Bool)

(assert (=> b!870742 m!812609))

(declare-fun m!812611 () Bool)

(assert (=> b!870743 m!812611))

(declare-fun m!812613 () Bool)

(assert (=> mapNonEmpty!27152 m!812613))

(declare-fun m!812615 () Bool)

(assert (=> b!870746 m!812615))

(declare-fun m!812617 () Bool)

(assert (=> b!870746 m!812617))

(assert (=> b!870746 m!812617))

(declare-fun m!812619 () Bool)

(assert (=> b!870746 m!812619))

(declare-fun m!812621 () Bool)

(assert (=> b!870746 m!812621))

(declare-fun m!812623 () Bool)

(assert (=> start!74152 m!812623))

(declare-fun m!812625 () Bool)

(assert (=> start!74152 m!812625))

(check-sat (not start!74152) (not b!870747) (not b!870746) (not mapNonEmpty!27152) tp_is_empty!17035 (not b_next!14899) (not b!870739) (not b!870743) b_and!24661 (not b!870741) (not b!870748))
(check-sat b_and!24661 (not b_next!14899))
