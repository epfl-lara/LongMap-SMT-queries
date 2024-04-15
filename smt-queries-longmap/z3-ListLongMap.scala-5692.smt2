; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73918 () Bool)

(assert start!73918)

(declare-fun b_free!14851 () Bool)

(declare-fun b_next!14851 () Bool)

(assert (=> start!73918 (= b_free!14851 (not b_next!14851))))

(declare-fun tp!52058 () Bool)

(declare-fun b_and!24577 () Bool)

(assert (=> start!73918 (= tp!52058 b_and!24577)))

(declare-fun b!868732 () Bool)

(declare-fun res!590400 () Bool)

(declare-fun e!483811 () Bool)

(assert (=> b!868732 (=> (not res!590400) (not e!483811))))

(declare-datatypes ((array!50117 0))(
  ( (array!50118 (arr!24090 (Array (_ BitVec 32) (_ BitVec 64))) (size!24532 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50117)

(declare-datatypes ((List!17148 0))(
  ( (Nil!17145) (Cons!17144 (h!18275 (_ BitVec 64)) (t!24176 List!17148)) )
))
(declare-fun arrayNoDuplicates!0 (array!50117 (_ BitVec 32) List!17148) Bool)

(assert (=> b!868732 (= res!590400 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17145))))

(declare-fun b!868733 () Bool)

(declare-fun e!483813 () Bool)

(assert (=> b!868733 (= e!483811 e!483813)))

(declare-fun res!590396 () Bool)

(assert (=> b!868733 (=> (not res!590396) (not e!483813))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!868733 (= res!590396 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27697 0))(
  ( (V!27698 (val!8541 Int)) )
))
(declare-datatypes ((tuple2!11364 0))(
  ( (tuple2!11365 (_1!5693 (_ BitVec 64)) (_2!5693 V!27697)) )
))
(declare-datatypes ((List!17149 0))(
  ( (Nil!17146) (Cons!17145 (h!18276 tuple2!11364) (t!24177 List!17149)) )
))
(declare-datatypes ((ListLongMap!10123 0))(
  ( (ListLongMap!10124 (toList!5077 List!17149)) )
))
(declare-fun lt!394412 () ListLongMap!10123)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!8054 0))(
  ( (ValueCellFull!8054 (v!10960 V!27697)) (EmptyCell!8054) )
))
(declare-datatypes ((array!50119 0))(
  ( (array!50120 (arr!24091 (Array (_ BitVec 32) ValueCell!8054)) (size!24533 (_ BitVec 32))) )
))
(declare-fun lt!394411 () array!50119)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27697)

(declare-fun zeroValue!654 () V!27697)

(declare-fun getCurrentListMapNoExtraKeys!3070 (array!50117 array!50119 (_ BitVec 32) (_ BitVec 32) V!27697 V!27697 (_ BitVec 32) Int) ListLongMap!10123)

(assert (=> b!868733 (= lt!394412 (getCurrentListMapNoExtraKeys!3070 _keys!868 lt!394411 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27697)

(declare-fun _values!688 () array!50119)

(assert (=> b!868733 (= lt!394411 (array!50120 (store (arr!24091 _values!688) i!612 (ValueCellFull!8054 v!557)) (size!24533 _values!688)))))

(declare-fun lt!394409 () ListLongMap!10123)

(assert (=> b!868733 (= lt!394409 (getCurrentListMapNoExtraKeys!3070 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!868734 () Bool)

(declare-fun res!590393 () Bool)

(assert (=> b!868734 (=> (not res!590393) (not e!483811))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!868734 (= res!590393 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!27080 () Bool)

(declare-fun mapRes!27080 () Bool)

(assert (=> mapIsEmpty!27080 mapRes!27080))

(declare-fun b!868735 () Bool)

(declare-fun res!590398 () Bool)

(assert (=> b!868735 (=> (not res!590398) (not e!483811))))

(assert (=> b!868735 (= res!590398 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24532 _keys!868))))))

(declare-fun b!868736 () Bool)

(declare-fun res!590395 () Bool)

(assert (=> b!868736 (=> (not res!590395) (not e!483811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!868736 (= res!590395 (validMask!0 mask!1196))))

(declare-fun b!868737 () Bool)

(assert (=> b!868737 (= e!483813 (not true))))

(declare-fun +!2439 (ListLongMap!10123 tuple2!11364) ListLongMap!10123)

(assert (=> b!868737 (= (getCurrentListMapNoExtraKeys!3070 _keys!868 lt!394411 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2439 (getCurrentListMapNoExtraKeys!3070 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11365 k0!854 v!557)))))

(declare-datatypes ((Unit!29765 0))(
  ( (Unit!29766) )
))
(declare-fun lt!394410 () Unit!29765)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!607 (array!50117 array!50119 (_ BitVec 32) (_ BitVec 32) V!27697 V!27697 (_ BitVec 32) (_ BitVec 64) V!27697 (_ BitVec 32) Int) Unit!29765)

(assert (=> b!868737 (= lt!394410 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!607 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!868738 () Bool)

(declare-fun e!483810 () Bool)

(declare-fun tp_is_empty!16987 () Bool)

(assert (=> b!868738 (= e!483810 tp_is_empty!16987)))

(declare-fun b!868739 () Bool)

(declare-fun e!483808 () Bool)

(declare-fun e!483812 () Bool)

(assert (=> b!868739 (= e!483808 (and e!483812 mapRes!27080))))

(declare-fun condMapEmpty!27080 () Bool)

(declare-fun mapDefault!27080 () ValueCell!8054)

(assert (=> b!868739 (= condMapEmpty!27080 (= (arr!24091 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8054)) mapDefault!27080)))))

(declare-fun b!868740 () Bool)

(declare-fun res!590394 () Bool)

(assert (=> b!868740 (=> (not res!590394) (not e!483811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50117 (_ BitVec 32)) Bool)

(assert (=> b!868740 (= res!590394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!868741 () Bool)

(assert (=> b!868741 (= e!483812 tp_is_empty!16987)))

(declare-fun b!868742 () Bool)

(declare-fun res!590392 () Bool)

(assert (=> b!868742 (=> (not res!590392) (not e!483811))))

(assert (=> b!868742 (= res!590392 (and (= (select (arr!24090 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!27080 () Bool)

(declare-fun tp!52057 () Bool)

(assert (=> mapNonEmpty!27080 (= mapRes!27080 (and tp!52057 e!483810))))

(declare-fun mapValue!27080 () ValueCell!8054)

(declare-fun mapKey!27080 () (_ BitVec 32))

(declare-fun mapRest!27080 () (Array (_ BitVec 32) ValueCell!8054))

(assert (=> mapNonEmpty!27080 (= (arr!24091 _values!688) (store mapRest!27080 mapKey!27080 mapValue!27080))))

(declare-fun res!590399 () Bool)

(assert (=> start!73918 (=> (not res!590399) (not e!483811))))

(assert (=> start!73918 (= res!590399 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24532 _keys!868))))))

(assert (=> start!73918 e!483811))

(assert (=> start!73918 tp_is_empty!16987))

(assert (=> start!73918 true))

(assert (=> start!73918 tp!52058))

(declare-fun array_inv!19100 (array!50117) Bool)

(assert (=> start!73918 (array_inv!19100 _keys!868)))

(declare-fun array_inv!19101 (array!50119) Bool)

(assert (=> start!73918 (and (array_inv!19101 _values!688) e!483808)))

(declare-fun b!868743 () Bool)

(declare-fun res!590397 () Bool)

(assert (=> b!868743 (=> (not res!590397) (not e!483811))))

(assert (=> b!868743 (= res!590397 (and (= (size!24533 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24532 _keys!868) (size!24533 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73918 res!590399) b!868736))

(assert (= (and b!868736 res!590395) b!868743))

(assert (= (and b!868743 res!590397) b!868740))

(assert (= (and b!868740 res!590394) b!868732))

(assert (= (and b!868732 res!590400) b!868735))

(assert (= (and b!868735 res!590398) b!868734))

(assert (= (and b!868734 res!590393) b!868742))

(assert (= (and b!868742 res!590392) b!868733))

(assert (= (and b!868733 res!590396) b!868737))

(assert (= (and b!868739 condMapEmpty!27080) mapIsEmpty!27080))

(assert (= (and b!868739 (not condMapEmpty!27080)) mapNonEmpty!27080))

(get-info :version)

(assert (= (and mapNonEmpty!27080 ((_ is ValueCellFull!8054) mapValue!27080)) b!868738))

(assert (= (and b!868739 ((_ is ValueCellFull!8054) mapDefault!27080)) b!868741))

(assert (= start!73918 b!868739))

(declare-fun m!809829 () Bool)

(assert (=> b!868732 m!809829))

(declare-fun m!809831 () Bool)

(assert (=> b!868733 m!809831))

(declare-fun m!809833 () Bool)

(assert (=> b!868733 m!809833))

(declare-fun m!809835 () Bool)

(assert (=> b!868733 m!809835))

(declare-fun m!809837 () Bool)

(assert (=> b!868737 m!809837))

(declare-fun m!809839 () Bool)

(assert (=> b!868737 m!809839))

(assert (=> b!868737 m!809839))

(declare-fun m!809841 () Bool)

(assert (=> b!868737 m!809841))

(declare-fun m!809843 () Bool)

(assert (=> b!868737 m!809843))

(declare-fun m!809845 () Bool)

(assert (=> b!868734 m!809845))

(declare-fun m!809847 () Bool)

(assert (=> mapNonEmpty!27080 m!809847))

(declare-fun m!809849 () Bool)

(assert (=> b!868736 m!809849))

(declare-fun m!809851 () Bool)

(assert (=> b!868740 m!809851))

(declare-fun m!809853 () Bool)

(assert (=> start!73918 m!809853))

(declare-fun m!809855 () Bool)

(assert (=> start!73918 m!809855))

(declare-fun m!809857 () Bool)

(assert (=> b!868742 m!809857))

(check-sat (not b!868737) b_and!24577 (not b!868736) tp_is_empty!16987 (not b!868732) (not mapNonEmpty!27080) (not b!868740) (not b!868733) (not b!868734) (not start!73918) (not b_next!14851))
(check-sat b_and!24577 (not b_next!14851))
