; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74714 () Bool)

(assert start!74714)

(declare-fun b_free!15235 () Bool)

(declare-fun b_next!15235 () Bool)

(assert (=> start!74714 (= b_free!15235 (not b_next!15235))))

(declare-fun tp!53387 () Bool)

(declare-fun b_and!25121 () Bool)

(assert (=> start!74714 (= tp!53387 b_and!25121)))

(declare-fun b!879116 () Bool)

(declare-fun e!489379 () Bool)

(declare-fun e!489382 () Bool)

(declare-fun mapRes!27834 () Bool)

(assert (=> b!879116 (= e!489379 (and e!489382 mapRes!27834))))

(declare-fun condMapEmpty!27834 () Bool)

(declare-datatypes ((V!28353 0))(
  ( (V!28354 (val!8787 Int)) )
))
(declare-datatypes ((ValueCell!8300 0))(
  ( (ValueCellFull!8300 (v!11227 V!28353)) (EmptyCell!8300) )
))
(declare-datatypes ((array!51127 0))(
  ( (array!51128 (arr!24585 (Array (_ BitVec 32) ValueCell!8300)) (size!25026 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51127)

(declare-fun mapDefault!27834 () ValueCell!8300)

(assert (=> b!879116 (= condMapEmpty!27834 (= (arr!24585 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8300)) mapDefault!27834)))))

(declare-fun mapIsEmpty!27834 () Bool)

(assert (=> mapIsEmpty!27834 mapRes!27834))

(declare-fun b!879117 () Bool)

(declare-fun res!596968 () Bool)

(declare-fun e!489380 () Bool)

(assert (=> b!879117 (=> (not res!596968) (not e!489380))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!879117 (= res!596968 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27834 () Bool)

(declare-fun tp!53388 () Bool)

(declare-fun e!489381 () Bool)

(assert (=> mapNonEmpty!27834 (= mapRes!27834 (and tp!53388 e!489381))))

(declare-fun mapKey!27834 () (_ BitVec 32))

(declare-fun mapRest!27834 () (Array (_ BitVec 32) ValueCell!8300))

(declare-fun mapValue!27834 () ValueCell!8300)

(assert (=> mapNonEmpty!27834 (= (arr!24585 _values!688) (store mapRest!27834 mapKey!27834 mapValue!27834))))

(declare-fun res!596967 () Bool)

(assert (=> start!74714 (=> (not res!596967) (not e!489380))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51129 0))(
  ( (array!51130 (arr!24586 (Array (_ BitVec 32) (_ BitVec 64))) (size!25027 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51129)

(assert (=> start!74714 (= res!596967 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25027 _keys!868))))))

(assert (=> start!74714 e!489380))

(declare-fun tp_is_empty!17479 () Bool)

(assert (=> start!74714 tp_is_empty!17479))

(assert (=> start!74714 true))

(assert (=> start!74714 tp!53387))

(declare-fun array_inv!19420 (array!51129) Bool)

(assert (=> start!74714 (array_inv!19420 _keys!868)))

(declare-fun array_inv!19421 (array!51127) Bool)

(assert (=> start!74714 (and (array_inv!19421 _values!688) e!489379)))

(declare-fun b!879118 () Bool)

(declare-fun res!596964 () Bool)

(assert (=> b!879118 (=> (not res!596964) (not e!489380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51129 (_ BitVec 32)) Bool)

(assert (=> b!879118 (= res!596964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!879119 () Bool)

(declare-fun res!596966 () Bool)

(assert (=> b!879119 (=> (not res!596966) (not e!489380))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!879119 (= res!596966 (and (= (select (arr!24586 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!879120 () Bool)

(declare-fun res!596963 () Bool)

(assert (=> b!879120 (=> (not res!596963) (not e!489380))))

(assert (=> b!879120 (= res!596963 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25027 _keys!868))))))

(declare-fun b!879121 () Bool)

(assert (=> b!879121 (= e!489381 tp_is_empty!17479)))

(declare-fun b!879122 () Bool)

(declare-fun res!596965 () Bool)

(assert (=> b!879122 (=> (not res!596965) (not e!489380))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!879122 (= res!596965 (validKeyInArray!0 k0!854))))

(declare-fun b!879123 () Bool)

(assert (=> b!879123 (= e!489380 false)))

(declare-fun v!557 () V!28353)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!11558 0))(
  ( (tuple2!11559 (_1!5790 (_ BitVec 64)) (_2!5790 V!28353)) )
))
(declare-datatypes ((List!17392 0))(
  ( (Nil!17389) (Cons!17388 (h!18525 tuple2!11558) (t!24473 List!17392)) )
))
(declare-datatypes ((ListLongMap!10329 0))(
  ( (ListLongMap!10330 (toList!5180 List!17392)) )
))
(declare-fun lt!397576 () ListLongMap!10329)

(declare-fun minValue!654 () V!28353)

(declare-fun zeroValue!654 () V!28353)

(declare-fun getCurrentListMapNoExtraKeys!3222 (array!51129 array!51127 (_ BitVec 32) (_ BitVec 32) V!28353 V!28353 (_ BitVec 32) Int) ListLongMap!10329)

(assert (=> b!879123 (= lt!397576 (getCurrentListMapNoExtraKeys!3222 _keys!868 (array!51128 (store (arr!24585 _values!688) i!612 (ValueCellFull!8300 v!557)) (size!25026 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397575 () ListLongMap!10329)

(assert (=> b!879123 (= lt!397575 (getCurrentListMapNoExtraKeys!3222 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!879124 () Bool)

(assert (=> b!879124 (= e!489382 tp_is_empty!17479)))

(declare-fun b!879125 () Bool)

(declare-fun res!596962 () Bool)

(assert (=> b!879125 (=> (not res!596962) (not e!489380))))

(assert (=> b!879125 (= res!596962 (and (= (size!25026 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25027 _keys!868) (size!25026 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!879126 () Bool)

(declare-fun res!596961 () Bool)

(assert (=> b!879126 (=> (not res!596961) (not e!489380))))

(declare-datatypes ((List!17393 0))(
  ( (Nil!17390) (Cons!17389 (h!18526 (_ BitVec 64)) (t!24474 List!17393)) )
))
(declare-fun arrayNoDuplicates!0 (array!51129 (_ BitVec 32) List!17393) Bool)

(assert (=> b!879126 (= res!596961 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17390))))

(assert (= (and start!74714 res!596967) b!879117))

(assert (= (and b!879117 res!596968) b!879125))

(assert (= (and b!879125 res!596962) b!879118))

(assert (= (and b!879118 res!596964) b!879126))

(assert (= (and b!879126 res!596961) b!879120))

(assert (= (and b!879120 res!596963) b!879122))

(assert (= (and b!879122 res!596965) b!879119))

(assert (= (and b!879119 res!596966) b!879123))

(assert (= (and b!879116 condMapEmpty!27834) mapIsEmpty!27834))

(assert (= (and b!879116 (not condMapEmpty!27834)) mapNonEmpty!27834))

(get-info :version)

(assert (= (and mapNonEmpty!27834 ((_ is ValueCellFull!8300) mapValue!27834)) b!879121))

(assert (= (and b!879116 ((_ is ValueCellFull!8300) mapDefault!27834)) b!879124))

(assert (= start!74714 b!879116))

(declare-fun m!819453 () Bool)

(assert (=> mapNonEmpty!27834 m!819453))

(declare-fun m!819455 () Bool)

(assert (=> b!879117 m!819455))

(declare-fun m!819457 () Bool)

(assert (=> b!879123 m!819457))

(declare-fun m!819459 () Bool)

(assert (=> b!879123 m!819459))

(declare-fun m!819461 () Bool)

(assert (=> b!879123 m!819461))

(declare-fun m!819463 () Bool)

(assert (=> b!879122 m!819463))

(declare-fun m!819465 () Bool)

(assert (=> b!879126 m!819465))

(declare-fun m!819467 () Bool)

(assert (=> start!74714 m!819467))

(declare-fun m!819469 () Bool)

(assert (=> start!74714 m!819469))

(declare-fun m!819471 () Bool)

(assert (=> b!879118 m!819471))

(declare-fun m!819473 () Bool)

(assert (=> b!879119 m!819473))

(check-sat (not b_next!15235) b_and!25121 (not b!879123) tp_is_empty!17479 (not b!879117) (not mapNonEmpty!27834) (not b!879118) (not b!879126) (not start!74714) (not b!879122))
(check-sat b_and!25121 (not b_next!15235))
