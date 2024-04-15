; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74032 () Bool)

(assert start!74032)

(declare-fun b_free!14965 () Bool)

(declare-fun b_next!14965 () Bool)

(assert (=> start!74032 (= b_free!14965 (not b_next!14965))))

(declare-fun tp!52400 () Bool)

(declare-fun b_and!24691 () Bool)

(assert (=> start!74032 (= tp!52400 b_and!24691)))

(declare-fun b!870784 () Bool)

(declare-fun res!591938 () Bool)

(declare-fun e!484837 () Bool)

(assert (=> b!870784 (=> (not res!591938) (not e!484837))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50329 0))(
  ( (array!50330 (arr!24196 (Array (_ BitVec 32) (_ BitVec 64))) (size!24638 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50329)

(declare-datatypes ((V!27849 0))(
  ( (V!27850 (val!8598 Int)) )
))
(declare-datatypes ((ValueCell!8111 0))(
  ( (ValueCellFull!8111 (v!11017 V!27849)) (EmptyCell!8111) )
))
(declare-datatypes ((array!50331 0))(
  ( (array!50332 (arr!24197 (Array (_ BitVec 32) ValueCell!8111)) (size!24639 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50331)

(assert (=> b!870784 (= res!591938 (and (= (size!24639 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24638 _keys!868) (size!24639 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!870785 () Bool)

(declare-fun res!591939 () Bool)

(assert (=> b!870785 (=> (not res!591939) (not e!484837))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!870785 (= res!591939 (and (= (select (arr!24196 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!870786 () Bool)

(declare-fun e!484835 () Bool)

(declare-fun e!484834 () Bool)

(declare-fun mapRes!27251 () Bool)

(assert (=> b!870786 (= e!484835 (and e!484834 mapRes!27251))))

(declare-fun condMapEmpty!27251 () Bool)

(declare-fun mapDefault!27251 () ValueCell!8111)

(assert (=> b!870786 (= condMapEmpty!27251 (= (arr!24197 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8111)) mapDefault!27251)))))

(declare-fun b!870787 () Bool)

(declare-fun tp_is_empty!17101 () Bool)

(assert (=> b!870787 (= e!484834 tp_is_empty!17101)))

(declare-fun b!870788 () Bool)

(declare-fun res!591933 () Bool)

(assert (=> b!870788 (=> (not res!591933) (not e!484837))))

(declare-datatypes ((List!17218 0))(
  ( (Nil!17215) (Cons!17214 (h!18345 (_ BitVec 64)) (t!24246 List!17218)) )
))
(declare-fun arrayNoDuplicates!0 (array!50329 (_ BitVec 32) List!17218) Bool)

(assert (=> b!870788 (= res!591933 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17215))))

(declare-fun b!870789 () Bool)

(declare-fun e!484836 () Bool)

(assert (=> b!870789 (= e!484836 (not true))))

(declare-fun v!557 () V!27849)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!395093 () array!50331)

(declare-fun minValue!654 () V!27849)

(declare-fun zeroValue!654 () V!27849)

(declare-datatypes ((tuple2!11442 0))(
  ( (tuple2!11443 (_1!5732 (_ BitVec 64)) (_2!5732 V!27849)) )
))
(declare-datatypes ((List!17219 0))(
  ( (Nil!17216) (Cons!17215 (h!18346 tuple2!11442) (t!24247 List!17219)) )
))
(declare-datatypes ((ListLongMap!10201 0))(
  ( (ListLongMap!10202 (toList!5116 List!17219)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3109 (array!50329 array!50331 (_ BitVec 32) (_ BitVec 32) V!27849 V!27849 (_ BitVec 32) Int) ListLongMap!10201)

(declare-fun +!2475 (ListLongMap!10201 tuple2!11442) ListLongMap!10201)

(assert (=> b!870789 (= (getCurrentListMapNoExtraKeys!3109 _keys!868 lt!395093 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2475 (getCurrentListMapNoExtraKeys!3109 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11443 k0!854 v!557)))))

(declare-datatypes ((Unit!29837 0))(
  ( (Unit!29838) )
))
(declare-fun lt!395094 () Unit!29837)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!643 (array!50329 array!50331 (_ BitVec 32) (_ BitVec 32) V!27849 V!27849 (_ BitVec 32) (_ BitVec 64) V!27849 (_ BitVec 32) Int) Unit!29837)

(assert (=> b!870789 (= lt!395094 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!643 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!870790 () Bool)

(declare-fun e!484838 () Bool)

(assert (=> b!870790 (= e!484838 tp_is_empty!17101)))

(declare-fun b!870791 () Bool)

(declare-fun res!591932 () Bool)

(assert (=> b!870791 (=> (not res!591932) (not e!484837))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50329 (_ BitVec 32)) Bool)

(assert (=> b!870791 (= res!591932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!870792 () Bool)

(declare-fun res!591936 () Bool)

(assert (=> b!870792 (=> (not res!591936) (not e!484837))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870792 (= res!591936 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!27251 () Bool)

(declare-fun tp!52399 () Bool)

(assert (=> mapNonEmpty!27251 (= mapRes!27251 (and tp!52399 e!484838))))

(declare-fun mapKey!27251 () (_ BitVec 32))

(declare-fun mapRest!27251 () (Array (_ BitVec 32) ValueCell!8111))

(declare-fun mapValue!27251 () ValueCell!8111)

(assert (=> mapNonEmpty!27251 (= (arr!24197 _values!688) (store mapRest!27251 mapKey!27251 mapValue!27251))))

(declare-fun b!870793 () Bool)

(declare-fun res!591931 () Bool)

(assert (=> b!870793 (=> (not res!591931) (not e!484837))))

(assert (=> b!870793 (= res!591931 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24638 _keys!868))))))

(declare-fun mapIsEmpty!27251 () Bool)

(assert (=> mapIsEmpty!27251 mapRes!27251))

(declare-fun res!591935 () Bool)

(assert (=> start!74032 (=> (not res!591935) (not e!484837))))

(assert (=> start!74032 (= res!591935 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24638 _keys!868))))))

(assert (=> start!74032 e!484837))

(assert (=> start!74032 tp_is_empty!17101))

(assert (=> start!74032 true))

(assert (=> start!74032 tp!52400))

(declare-fun array_inv!19166 (array!50329) Bool)

(assert (=> start!74032 (array_inv!19166 _keys!868)))

(declare-fun array_inv!19167 (array!50331) Bool)

(assert (=> start!74032 (and (array_inv!19167 _values!688) e!484835)))

(declare-fun b!870794 () Bool)

(assert (=> b!870794 (= e!484837 e!484836)))

(declare-fun res!591934 () Bool)

(assert (=> b!870794 (=> (not res!591934) (not e!484836))))

(assert (=> b!870794 (= res!591934 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!395096 () ListLongMap!10201)

(assert (=> b!870794 (= lt!395096 (getCurrentListMapNoExtraKeys!3109 _keys!868 lt!395093 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!870794 (= lt!395093 (array!50332 (store (arr!24197 _values!688) i!612 (ValueCellFull!8111 v!557)) (size!24639 _values!688)))))

(declare-fun lt!395095 () ListLongMap!10201)

(assert (=> b!870794 (= lt!395095 (getCurrentListMapNoExtraKeys!3109 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!870795 () Bool)

(declare-fun res!591937 () Bool)

(assert (=> b!870795 (=> (not res!591937) (not e!484837))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870795 (= res!591937 (validMask!0 mask!1196))))

(assert (= (and start!74032 res!591935) b!870795))

(assert (= (and b!870795 res!591937) b!870784))

(assert (= (and b!870784 res!591938) b!870791))

(assert (= (and b!870791 res!591932) b!870788))

(assert (= (and b!870788 res!591933) b!870793))

(assert (= (and b!870793 res!591931) b!870792))

(assert (= (and b!870792 res!591936) b!870785))

(assert (= (and b!870785 res!591939) b!870794))

(assert (= (and b!870794 res!591934) b!870789))

(assert (= (and b!870786 condMapEmpty!27251) mapIsEmpty!27251))

(assert (= (and b!870786 (not condMapEmpty!27251)) mapNonEmpty!27251))

(get-info :version)

(assert (= (and mapNonEmpty!27251 ((_ is ValueCellFull!8111) mapValue!27251)) b!870790))

(assert (= (and b!870786 ((_ is ValueCellFull!8111) mapDefault!27251)) b!870787))

(assert (= start!74032 b!870786))

(declare-fun m!811539 () Bool)

(assert (=> b!870788 m!811539))

(declare-fun m!811541 () Bool)

(assert (=> b!870794 m!811541))

(declare-fun m!811543 () Bool)

(assert (=> b!870794 m!811543))

(declare-fun m!811545 () Bool)

(assert (=> b!870794 m!811545))

(declare-fun m!811547 () Bool)

(assert (=> b!870795 m!811547))

(declare-fun m!811549 () Bool)

(assert (=> b!870789 m!811549))

(declare-fun m!811551 () Bool)

(assert (=> b!870789 m!811551))

(assert (=> b!870789 m!811551))

(declare-fun m!811553 () Bool)

(assert (=> b!870789 m!811553))

(declare-fun m!811555 () Bool)

(assert (=> b!870789 m!811555))

(declare-fun m!811557 () Bool)

(assert (=> b!870792 m!811557))

(declare-fun m!811559 () Bool)

(assert (=> b!870791 m!811559))

(declare-fun m!811561 () Bool)

(assert (=> b!870785 m!811561))

(declare-fun m!811563 () Bool)

(assert (=> mapNonEmpty!27251 m!811563))

(declare-fun m!811565 () Bool)

(assert (=> start!74032 m!811565))

(declare-fun m!811567 () Bool)

(assert (=> start!74032 m!811567))

(check-sat (not b!870794) tp_is_empty!17101 (not b!870789) (not b!870792) (not b!870788) (not b!870791) (not start!74032) (not b_next!14965) (not mapNonEmpty!27251) b_and!24691 (not b!870795))
(check-sat b_and!24691 (not b_next!14965))
