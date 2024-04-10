; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74306 () Bool)

(assert start!74306)

(declare-fun b_free!15069 () Bool)

(declare-fun b_next!15069 () Bool)

(assert (=> start!74306 (= b_free!15069 (not b_next!15069))))

(declare-fun tp!52881 () Bool)

(declare-fun b_and!24845 () Bool)

(assert (=> start!74306 (= tp!52881 b_and!24845)))

(declare-fun b!874313 () Bool)

(declare-fun e!486813 () Bool)

(declare-fun tp_is_empty!17313 () Bool)

(assert (=> b!874313 (= e!486813 tp_is_empty!17313)))

(declare-fun b!874314 () Bool)

(declare-fun e!486815 () Bool)

(declare-fun e!486811 () Bool)

(declare-fun mapRes!27578 () Bool)

(assert (=> b!874314 (= e!486815 (and e!486811 mapRes!27578))))

(declare-fun condMapEmpty!27578 () Bool)

(declare-datatypes ((V!28131 0))(
  ( (V!28132 (val!8704 Int)) )
))
(declare-datatypes ((ValueCell!8217 0))(
  ( (ValueCellFull!8217 (v!11133 V!28131)) (EmptyCell!8217) )
))
(declare-datatypes ((array!50754 0))(
  ( (array!50755 (arr!24405 (Array (_ BitVec 32) ValueCell!8217)) (size!24845 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50754)

(declare-fun mapDefault!27578 () ValueCell!8217)

(assert (=> b!874314 (= condMapEmpty!27578 (= (arr!24405 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8217)) mapDefault!27578)))))

(declare-fun res!594162 () Bool)

(declare-fun e!486814 () Bool)

(assert (=> start!74306 (=> (not res!594162) (not e!486814))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50756 0))(
  ( (array!50757 (arr!24406 (Array (_ BitVec 32) (_ BitVec 64))) (size!24846 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50756)

(assert (=> start!74306 (= res!594162 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24846 _keys!868))))))

(assert (=> start!74306 e!486814))

(assert (=> start!74306 tp_is_empty!17313))

(assert (=> start!74306 true))

(assert (=> start!74306 tp!52881))

(declare-fun array_inv!19250 (array!50756) Bool)

(assert (=> start!74306 (array_inv!19250 _keys!868)))

(declare-fun array_inv!19251 (array!50754) Bool)

(assert (=> start!74306 (and (array_inv!19251 _values!688) e!486815)))

(declare-fun b!874315 () Bool)

(declare-fun res!594157 () Bool)

(assert (=> b!874315 (=> (not res!594157) (not e!486814))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874315 (= res!594157 (validMask!0 mask!1196))))

(declare-fun b!874316 () Bool)

(declare-fun res!594160 () Bool)

(assert (=> b!874316 (=> (not res!594160) (not e!486814))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50756 (_ BitVec 32)) Bool)

(assert (=> b!874316 (= res!594160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874317 () Bool)

(declare-fun res!594158 () Bool)

(assert (=> b!874317 (=> (not res!594158) (not e!486814))))

(declare-datatypes ((List!17325 0))(
  ( (Nil!17322) (Cons!17321 (h!18452 (_ BitVec 64)) (t!24366 List!17325)) )
))
(declare-fun arrayNoDuplicates!0 (array!50756 (_ BitVec 32) List!17325) Bool)

(assert (=> b!874317 (= res!594158 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17322))))

(declare-fun mapIsEmpty!27578 () Bool)

(assert (=> mapIsEmpty!27578 mapRes!27578))

(declare-fun b!874318 () Bool)

(assert (=> b!874318 (= e!486814 false)))

(declare-fun v!557 () V!28131)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28131)

(declare-datatypes ((tuple2!11504 0))(
  ( (tuple2!11505 (_1!5763 (_ BitVec 64)) (_2!5763 V!28131)) )
))
(declare-datatypes ((List!17326 0))(
  ( (Nil!17323) (Cons!17322 (h!18453 tuple2!11504) (t!24367 List!17326)) )
))
(declare-datatypes ((ListLongMap!10273 0))(
  ( (ListLongMap!10274 (toList!5152 List!17326)) )
))
(declare-fun lt!395920 () ListLongMap!10273)

(declare-fun zeroValue!654 () V!28131)

(declare-fun getCurrentListMapNoExtraKeys!3119 (array!50756 array!50754 (_ BitVec 32) (_ BitVec 32) V!28131 V!28131 (_ BitVec 32) Int) ListLongMap!10273)

(assert (=> b!874318 (= lt!395920 (getCurrentListMapNoExtraKeys!3119 _keys!868 (array!50755 (store (arr!24405 _values!688) i!612 (ValueCellFull!8217 v!557)) (size!24845 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395921 () ListLongMap!10273)

(assert (=> b!874318 (= lt!395921 (getCurrentListMapNoExtraKeys!3119 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!874319 () Bool)

(declare-fun res!594155 () Bool)

(assert (=> b!874319 (=> (not res!594155) (not e!486814))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874319 (= res!594155 (validKeyInArray!0 k0!854))))

(declare-fun b!874320 () Bool)

(assert (=> b!874320 (= e!486811 tp_is_empty!17313)))

(declare-fun mapNonEmpty!27578 () Bool)

(declare-fun tp!52882 () Bool)

(assert (=> mapNonEmpty!27578 (= mapRes!27578 (and tp!52882 e!486813))))

(declare-fun mapValue!27578 () ValueCell!8217)

(declare-fun mapKey!27578 () (_ BitVec 32))

(declare-fun mapRest!27578 () (Array (_ BitVec 32) ValueCell!8217))

(assert (=> mapNonEmpty!27578 (= (arr!24405 _values!688) (store mapRest!27578 mapKey!27578 mapValue!27578))))

(declare-fun b!874321 () Bool)

(declare-fun res!594161 () Bool)

(assert (=> b!874321 (=> (not res!594161) (not e!486814))))

(assert (=> b!874321 (= res!594161 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24846 _keys!868))))))

(declare-fun b!874322 () Bool)

(declare-fun res!594156 () Bool)

(assert (=> b!874322 (=> (not res!594156) (not e!486814))))

(assert (=> b!874322 (= res!594156 (and (= (select (arr!24406 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!874323 () Bool)

(declare-fun res!594159 () Bool)

(assert (=> b!874323 (=> (not res!594159) (not e!486814))))

(assert (=> b!874323 (= res!594159 (and (= (size!24845 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24846 _keys!868) (size!24845 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!74306 res!594162) b!874315))

(assert (= (and b!874315 res!594157) b!874323))

(assert (= (and b!874323 res!594159) b!874316))

(assert (= (and b!874316 res!594160) b!874317))

(assert (= (and b!874317 res!594158) b!874321))

(assert (= (and b!874321 res!594161) b!874319))

(assert (= (and b!874319 res!594155) b!874322))

(assert (= (and b!874322 res!594156) b!874318))

(assert (= (and b!874314 condMapEmpty!27578) mapIsEmpty!27578))

(assert (= (and b!874314 (not condMapEmpty!27578)) mapNonEmpty!27578))

(get-info :version)

(assert (= (and mapNonEmpty!27578 ((_ is ValueCellFull!8217) mapValue!27578)) b!874313))

(assert (= (and b!874314 ((_ is ValueCellFull!8217) mapDefault!27578)) b!874320))

(assert (= start!74306 b!874314))

(declare-fun m!814523 () Bool)

(assert (=> b!874319 m!814523))

(declare-fun m!814525 () Bool)

(assert (=> b!874315 m!814525))

(declare-fun m!814527 () Bool)

(assert (=> b!874322 m!814527))

(declare-fun m!814529 () Bool)

(assert (=> b!874316 m!814529))

(declare-fun m!814531 () Bool)

(assert (=> b!874317 m!814531))

(declare-fun m!814533 () Bool)

(assert (=> b!874318 m!814533))

(declare-fun m!814535 () Bool)

(assert (=> b!874318 m!814535))

(declare-fun m!814537 () Bool)

(assert (=> b!874318 m!814537))

(declare-fun m!814539 () Bool)

(assert (=> mapNonEmpty!27578 m!814539))

(declare-fun m!814541 () Bool)

(assert (=> start!74306 m!814541))

(declare-fun m!814543 () Bool)

(assert (=> start!74306 m!814543))

(check-sat (not b_next!15069) (not b!874316) (not b!874315) (not b!874318) (not mapNonEmpty!27578) (not b!874317) (not start!74306) (not b!874319) tp_is_empty!17313 b_and!24845)
(check-sat b_and!24845 (not b_next!15069))
