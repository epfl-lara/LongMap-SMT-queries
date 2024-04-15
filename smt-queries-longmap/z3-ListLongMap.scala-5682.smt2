; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73858 () Bool)

(assert start!73858)

(declare-fun b_free!14791 () Bool)

(declare-fun b_next!14791 () Bool)

(assert (=> start!73858 (= b_free!14791 (not b_next!14791))))

(declare-fun tp!51877 () Bool)

(declare-fun b_and!24517 () Bool)

(assert (=> start!73858 (= tp!51877 b_and!24517)))

(declare-fun b!867652 () Bool)

(declare-fun res!589590 () Bool)

(declare-fun e!483273 () Bool)

(assert (=> b!867652 (=> (not res!589590) (not e!483273))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867652 (= res!589590 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!26990 () Bool)

(declare-fun mapRes!26990 () Bool)

(assert (=> mapIsEmpty!26990 mapRes!26990))

(declare-fun b!867653 () Bool)

(declare-fun res!589589 () Bool)

(assert (=> b!867653 (=> (not res!589589) (not e!483273))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50003 0))(
  ( (array!50004 (arr!24033 (Array (_ BitVec 32) (_ BitVec 64))) (size!24475 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50003)

(declare-datatypes ((V!27617 0))(
  ( (V!27618 (val!8511 Int)) )
))
(declare-datatypes ((ValueCell!8024 0))(
  ( (ValueCellFull!8024 (v!10930 V!27617)) (EmptyCell!8024) )
))
(declare-datatypes ((array!50005 0))(
  ( (array!50006 (arr!24034 (Array (_ BitVec 32) ValueCell!8024)) (size!24476 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50005)

(assert (=> b!867653 (= res!589589 (and (= (size!24476 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24475 _keys!868) (size!24476 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!867654 () Bool)

(declare-fun res!589586 () Bool)

(assert (=> b!867654 (=> (not res!589586) (not e!483273))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!867654 (= res!589586 (and (= (select (arr!24033 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!867655 () Bool)

(declare-fun e!483272 () Bool)

(declare-fun tp_is_empty!16927 () Bool)

(assert (=> b!867655 (= e!483272 tp_is_empty!16927)))

(declare-fun mapNonEmpty!26990 () Bool)

(declare-fun tp!51878 () Bool)

(assert (=> mapNonEmpty!26990 (= mapRes!26990 (and tp!51878 e!483272))))

(declare-fun mapRest!26990 () (Array (_ BitVec 32) ValueCell!8024))

(declare-fun mapValue!26990 () ValueCell!8024)

(declare-fun mapKey!26990 () (_ BitVec 32))

(assert (=> mapNonEmpty!26990 (= (arr!24034 _values!688) (store mapRest!26990 mapKey!26990 mapValue!26990))))

(declare-fun b!867656 () Bool)

(declare-fun e!483271 () Bool)

(assert (=> b!867656 (= e!483271 tp_is_empty!16927)))

(declare-fun b!867657 () Bool)

(declare-fun res!589587 () Bool)

(assert (=> b!867657 (=> (not res!589587) (not e!483273))))

(declare-datatypes ((List!17106 0))(
  ( (Nil!17103) (Cons!17102 (h!18233 (_ BitVec 64)) (t!24134 List!17106)) )
))
(declare-fun arrayNoDuplicates!0 (array!50003 (_ BitVec 32) List!17106) Bool)

(assert (=> b!867657 (= res!589587 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17103))))

(declare-fun res!589585 () Bool)

(assert (=> start!73858 (=> (not res!589585) (not e!483273))))

(assert (=> start!73858 (= res!589585 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24475 _keys!868))))))

(assert (=> start!73858 e!483273))

(assert (=> start!73858 tp_is_empty!16927))

(assert (=> start!73858 true))

(assert (=> start!73858 tp!51877))

(declare-fun array_inv!19064 (array!50003) Bool)

(assert (=> start!73858 (array_inv!19064 _keys!868)))

(declare-fun e!483268 () Bool)

(declare-fun array_inv!19065 (array!50005) Bool)

(assert (=> start!73858 (and (array_inv!19065 _values!688) e!483268)))

(declare-fun b!867658 () Bool)

(declare-fun res!589588 () Bool)

(assert (=> b!867658 (=> (not res!589588) (not e!483273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!867658 (= res!589588 (validMask!0 mask!1196))))

(declare-fun b!867659 () Bool)

(declare-fun e!483270 () Bool)

(assert (=> b!867659 (= e!483273 e!483270)))

(declare-fun res!589583 () Bool)

(assert (=> b!867659 (=> (not res!589583) (not e!483270))))

(assert (=> b!867659 (= res!589583 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!394051 () array!50005)

(declare-datatypes ((tuple2!11318 0))(
  ( (tuple2!11319 (_1!5670 (_ BitVec 64)) (_2!5670 V!27617)) )
))
(declare-datatypes ((List!17107 0))(
  ( (Nil!17104) (Cons!17103 (h!18234 tuple2!11318) (t!24135 List!17107)) )
))
(declare-datatypes ((ListLongMap!10077 0))(
  ( (ListLongMap!10078 (toList!5054 List!17107)) )
))
(declare-fun lt!394052 () ListLongMap!10077)

(declare-fun minValue!654 () V!27617)

(declare-fun zeroValue!654 () V!27617)

(declare-fun getCurrentListMapNoExtraKeys!3047 (array!50003 array!50005 (_ BitVec 32) (_ BitVec 32) V!27617 V!27617 (_ BitVec 32) Int) ListLongMap!10077)

(assert (=> b!867659 (= lt!394052 (getCurrentListMapNoExtraKeys!3047 _keys!868 lt!394051 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27617)

(assert (=> b!867659 (= lt!394051 (array!50006 (store (arr!24034 _values!688) i!612 (ValueCellFull!8024 v!557)) (size!24476 _values!688)))))

(declare-fun lt!394050 () ListLongMap!10077)

(assert (=> b!867659 (= lt!394050 (getCurrentListMapNoExtraKeys!3047 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!867660 () Bool)

(declare-fun res!589584 () Bool)

(assert (=> b!867660 (=> (not res!589584) (not e!483273))))

(assert (=> b!867660 (= res!589584 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24475 _keys!868))))))

(declare-fun b!867661 () Bool)

(assert (=> b!867661 (= e!483268 (and e!483271 mapRes!26990))))

(declare-fun condMapEmpty!26990 () Bool)

(declare-fun mapDefault!26990 () ValueCell!8024)

(assert (=> b!867661 (= condMapEmpty!26990 (= (arr!24034 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8024)) mapDefault!26990)))))

(declare-fun b!867662 () Bool)

(assert (=> b!867662 (= e!483270 (not true))))

(declare-fun +!2420 (ListLongMap!10077 tuple2!11318) ListLongMap!10077)

(assert (=> b!867662 (= (getCurrentListMapNoExtraKeys!3047 _keys!868 lt!394051 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2420 (getCurrentListMapNoExtraKeys!3047 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11319 k0!854 v!557)))))

(declare-datatypes ((Unit!29727 0))(
  ( (Unit!29728) )
))
(declare-fun lt!394049 () Unit!29727)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!588 (array!50003 array!50005 (_ BitVec 32) (_ BitVec 32) V!27617 V!27617 (_ BitVec 32) (_ BitVec 64) V!27617 (_ BitVec 32) Int) Unit!29727)

(assert (=> b!867662 (= lt!394049 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!588 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!867663 () Bool)

(declare-fun res!589582 () Bool)

(assert (=> b!867663 (=> (not res!589582) (not e!483273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50003 (_ BitVec 32)) Bool)

(assert (=> b!867663 (= res!589582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!73858 res!589585) b!867658))

(assert (= (and b!867658 res!589588) b!867653))

(assert (= (and b!867653 res!589589) b!867663))

(assert (= (and b!867663 res!589582) b!867657))

(assert (= (and b!867657 res!589587) b!867660))

(assert (= (and b!867660 res!589584) b!867652))

(assert (= (and b!867652 res!589590) b!867654))

(assert (= (and b!867654 res!589586) b!867659))

(assert (= (and b!867659 res!589583) b!867662))

(assert (= (and b!867661 condMapEmpty!26990) mapIsEmpty!26990))

(assert (= (and b!867661 (not condMapEmpty!26990)) mapNonEmpty!26990))

(get-info :version)

(assert (= (and mapNonEmpty!26990 ((_ is ValueCellFull!8024) mapValue!26990)) b!867655))

(assert (= (and b!867661 ((_ is ValueCellFull!8024) mapDefault!26990)) b!867656))

(assert (= start!73858 b!867661))

(declare-fun m!808929 () Bool)

(assert (=> b!867654 m!808929))

(declare-fun m!808931 () Bool)

(assert (=> b!867658 m!808931))

(declare-fun m!808933 () Bool)

(assert (=> b!867657 m!808933))

(declare-fun m!808935 () Bool)

(assert (=> b!867662 m!808935))

(declare-fun m!808937 () Bool)

(assert (=> b!867662 m!808937))

(assert (=> b!867662 m!808937))

(declare-fun m!808939 () Bool)

(assert (=> b!867662 m!808939))

(declare-fun m!808941 () Bool)

(assert (=> b!867662 m!808941))

(declare-fun m!808943 () Bool)

(assert (=> start!73858 m!808943))

(declare-fun m!808945 () Bool)

(assert (=> start!73858 m!808945))

(declare-fun m!808947 () Bool)

(assert (=> b!867659 m!808947))

(declare-fun m!808949 () Bool)

(assert (=> b!867659 m!808949))

(declare-fun m!808951 () Bool)

(assert (=> b!867659 m!808951))

(declare-fun m!808953 () Bool)

(assert (=> b!867663 m!808953))

(declare-fun m!808955 () Bool)

(assert (=> b!867652 m!808955))

(declare-fun m!808957 () Bool)

(assert (=> mapNonEmpty!26990 m!808957))

(check-sat tp_is_empty!16927 (not b_next!14791) (not b!867662) (not b!867657) (not b!867652) (not start!73858) (not b!867663) b_and!24517 (not mapNonEmpty!26990) (not b!867658) (not b!867659))
(check-sat b_and!24517 (not b_next!14791))
