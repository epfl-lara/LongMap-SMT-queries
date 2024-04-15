; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74516 () Bool)

(assert start!74516)

(declare-fun b_free!15223 () Bool)

(declare-fun b_next!15223 () Bool)

(assert (=> start!74516 (= b_free!15223 (not b_next!15223))))

(declare-fun tp!53351 () Bool)

(declare-fun b_and!25073 () Bool)

(assert (=> start!74516 (= tp!53351 b_and!25073)))

(declare-fun mapIsEmpty!27816 () Bool)

(declare-fun mapRes!27816 () Bool)

(assert (=> mapIsEmpty!27816 mapRes!27816))

(declare-fun b!877776 () Bool)

(declare-fun res!596368 () Bool)

(declare-fun e!488560 () Bool)

(assert (=> b!877776 (=> (not res!596368) (not e!488560))))

(declare-datatypes ((array!51041 0))(
  ( (array!51042 (arr!24547 (Array (_ BitVec 32) (_ BitVec 64))) (size!24989 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51041)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51041 (_ BitVec 32)) Bool)

(assert (=> b!877776 (= res!596368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!877777 () Bool)

(assert (=> b!877777 (= e!488560 false)))

(declare-datatypes ((V!28337 0))(
  ( (V!28338 (val!8781 Int)) )
))
(declare-fun v!557 () V!28337)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!8294 0))(
  ( (ValueCellFull!8294 (v!11215 V!28337)) (EmptyCell!8294) )
))
(declare-datatypes ((array!51043 0))(
  ( (array!51044 (arr!24548 (Array (_ BitVec 32) ValueCell!8294)) (size!24990 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51043)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28337)

(declare-fun zeroValue!654 () V!28337)

(declare-datatypes ((tuple2!11624 0))(
  ( (tuple2!11625 (_1!5823 (_ BitVec 64)) (_2!5823 V!28337)) )
))
(declare-datatypes ((List!17427 0))(
  ( (Nil!17424) (Cons!17423 (h!18554 tuple2!11624) (t!24507 List!17427)) )
))
(declare-datatypes ((ListLongMap!10383 0))(
  ( (ListLongMap!10384 (toList!5207 List!17427)) )
))
(declare-fun lt!396942 () ListLongMap!10383)

(declare-fun getCurrentListMapNoExtraKeys!3200 (array!51041 array!51043 (_ BitVec 32) (_ BitVec 32) V!28337 V!28337 (_ BitVec 32) Int) ListLongMap!10383)

(assert (=> b!877777 (= lt!396942 (getCurrentListMapNoExtraKeys!3200 _keys!868 (array!51044 (store (arr!24548 _values!688) i!612 (ValueCellFull!8294 v!557)) (size!24990 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!396943 () ListLongMap!10383)

(assert (=> b!877777 (= lt!396943 (getCurrentListMapNoExtraKeys!3200 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!877778 () Bool)

(declare-fun res!596369 () Bool)

(assert (=> b!877778 (=> (not res!596369) (not e!488560))))

(declare-datatypes ((List!17428 0))(
  ( (Nil!17425) (Cons!17424 (h!18555 (_ BitVec 64)) (t!24508 List!17428)) )
))
(declare-fun arrayNoDuplicates!0 (array!51041 (_ BitVec 32) List!17428) Bool)

(assert (=> b!877778 (= res!596369 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17425))))

(declare-fun b!877779 () Bool)

(declare-fun res!596363 () Bool)

(assert (=> b!877779 (=> (not res!596363) (not e!488560))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!877779 (= res!596363 (and (= (select (arr!24547 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!596364 () Bool)

(assert (=> start!74516 (=> (not res!596364) (not e!488560))))

(assert (=> start!74516 (= res!596364 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24989 _keys!868))))))

(assert (=> start!74516 e!488560))

(declare-fun tp_is_empty!17467 () Bool)

(assert (=> start!74516 tp_is_empty!17467))

(assert (=> start!74516 true))

(assert (=> start!74516 tp!53351))

(declare-fun array_inv!19386 (array!51041) Bool)

(assert (=> start!74516 (array_inv!19386 _keys!868)))

(declare-fun e!488558 () Bool)

(declare-fun array_inv!19387 (array!51043) Bool)

(assert (=> start!74516 (and (array_inv!19387 _values!688) e!488558)))

(declare-fun b!877780 () Bool)

(declare-fun res!596370 () Bool)

(assert (=> b!877780 (=> (not res!596370) (not e!488560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!877780 (= res!596370 (validMask!0 mask!1196))))

(declare-fun b!877781 () Bool)

(declare-fun res!596365 () Bool)

(assert (=> b!877781 (=> (not res!596365) (not e!488560))))

(assert (=> b!877781 (= res!596365 (and (= (size!24990 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24989 _keys!868) (size!24990 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!877782 () Bool)

(declare-fun res!596367 () Bool)

(assert (=> b!877782 (=> (not res!596367) (not e!488560))))

(assert (=> b!877782 (= res!596367 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24989 _keys!868))))))

(declare-fun b!877783 () Bool)

(declare-fun res!596366 () Bool)

(assert (=> b!877783 (=> (not res!596366) (not e!488560))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!877783 (= res!596366 (validKeyInArray!0 k0!854))))

(declare-fun b!877784 () Bool)

(declare-fun e!488562 () Bool)

(assert (=> b!877784 (= e!488558 (and e!488562 mapRes!27816))))

(declare-fun condMapEmpty!27816 () Bool)

(declare-fun mapDefault!27816 () ValueCell!8294)

(assert (=> b!877784 (= condMapEmpty!27816 (= (arr!24548 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8294)) mapDefault!27816)))))

(declare-fun mapNonEmpty!27816 () Bool)

(declare-fun tp!53352 () Bool)

(declare-fun e!488559 () Bool)

(assert (=> mapNonEmpty!27816 (= mapRes!27816 (and tp!53352 e!488559))))

(declare-fun mapRest!27816 () (Array (_ BitVec 32) ValueCell!8294))

(declare-fun mapValue!27816 () ValueCell!8294)

(declare-fun mapKey!27816 () (_ BitVec 32))

(assert (=> mapNonEmpty!27816 (= (arr!24548 _values!688) (store mapRest!27816 mapKey!27816 mapValue!27816))))

(declare-fun b!877785 () Bool)

(assert (=> b!877785 (= e!488562 tp_is_empty!17467)))

(declare-fun b!877786 () Bool)

(assert (=> b!877786 (= e!488559 tp_is_empty!17467)))

(assert (= (and start!74516 res!596364) b!877780))

(assert (= (and b!877780 res!596370) b!877781))

(assert (= (and b!877781 res!596365) b!877776))

(assert (= (and b!877776 res!596368) b!877778))

(assert (= (and b!877778 res!596369) b!877782))

(assert (= (and b!877782 res!596367) b!877783))

(assert (= (and b!877783 res!596366) b!877779))

(assert (= (and b!877779 res!596363) b!877777))

(assert (= (and b!877784 condMapEmpty!27816) mapIsEmpty!27816))

(assert (= (and b!877784 (not condMapEmpty!27816)) mapNonEmpty!27816))

(get-info :version)

(assert (= (and mapNonEmpty!27816 ((_ is ValueCellFull!8294) mapValue!27816)) b!877786))

(assert (= (and b!877784 ((_ is ValueCellFull!8294) mapDefault!27816)) b!877785))

(assert (= start!74516 b!877784))

(declare-fun m!817269 () Bool)

(assert (=> b!877783 m!817269))

(declare-fun m!817271 () Bool)

(assert (=> b!877777 m!817271))

(declare-fun m!817273 () Bool)

(assert (=> b!877777 m!817273))

(declare-fun m!817275 () Bool)

(assert (=> b!877777 m!817275))

(declare-fun m!817277 () Bool)

(assert (=> mapNonEmpty!27816 m!817277))

(declare-fun m!817279 () Bool)

(assert (=> b!877780 m!817279))

(declare-fun m!817281 () Bool)

(assert (=> b!877776 m!817281))

(declare-fun m!817283 () Bool)

(assert (=> b!877779 m!817283))

(declare-fun m!817285 () Bool)

(assert (=> start!74516 m!817285))

(declare-fun m!817287 () Bool)

(assert (=> start!74516 m!817287))

(declare-fun m!817289 () Bool)

(assert (=> b!877778 m!817289))

(check-sat (not start!74516) (not b!877777) tp_is_empty!17467 b_and!25073 (not mapNonEmpty!27816) (not b!877780) (not b_next!15223) (not b!877778) (not b!877783) (not b!877776))
(check-sat b_and!25073 (not b_next!15223))
