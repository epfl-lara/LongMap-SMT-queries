; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74546 () Bool)

(assert start!74546)

(declare-fun b_free!15253 () Bool)

(declare-fun b_next!15253 () Bool)

(assert (=> start!74546 (= b_free!15253 (not b_next!15253))))

(declare-fun tp!53442 () Bool)

(declare-fun b_and!25103 () Bool)

(assert (=> start!74546 (= tp!53442 b_and!25103)))

(declare-fun b!878271 () Bool)

(declare-fun e!488787 () Bool)

(declare-fun tp_is_empty!17497 () Bool)

(assert (=> b!878271 (= e!488787 tp_is_empty!17497)))

(declare-fun res!596730 () Bool)

(declare-fun e!488784 () Bool)

(assert (=> start!74546 (=> (not res!596730) (not e!488784))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51101 0))(
  ( (array!51102 (arr!24577 (Array (_ BitVec 32) (_ BitVec 64))) (size!25019 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51101)

(assert (=> start!74546 (= res!596730 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25019 _keys!868))))))

(assert (=> start!74546 e!488784))

(assert (=> start!74546 tp_is_empty!17497))

(assert (=> start!74546 true))

(assert (=> start!74546 tp!53442))

(declare-fun array_inv!19414 (array!51101) Bool)

(assert (=> start!74546 (array_inv!19414 _keys!868)))

(declare-datatypes ((V!28377 0))(
  ( (V!28378 (val!8796 Int)) )
))
(declare-datatypes ((ValueCell!8309 0))(
  ( (ValueCellFull!8309 (v!11230 V!28377)) (EmptyCell!8309) )
))
(declare-datatypes ((array!51103 0))(
  ( (array!51104 (arr!24578 (Array (_ BitVec 32) ValueCell!8309)) (size!25020 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51103)

(declare-fun e!488785 () Bool)

(declare-fun array_inv!19415 (array!51103) Bool)

(assert (=> start!74546 (and (array_inv!19415 _values!688) e!488785)))

(declare-fun b!878272 () Bool)

(declare-fun res!596725 () Bool)

(assert (=> b!878272 (=> (not res!596725) (not e!488784))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51101 (_ BitVec 32)) Bool)

(assert (=> b!878272 (= res!596725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!878273 () Bool)

(declare-fun mapRes!27861 () Bool)

(assert (=> b!878273 (= e!488785 (and e!488787 mapRes!27861))))

(declare-fun condMapEmpty!27861 () Bool)

(declare-fun mapDefault!27861 () ValueCell!8309)

(assert (=> b!878273 (= condMapEmpty!27861 (= (arr!24578 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8309)) mapDefault!27861)))))

(declare-fun b!878274 () Bool)

(declare-fun res!596723 () Bool)

(assert (=> b!878274 (=> (not res!596723) (not e!488784))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878274 (= res!596723 (validKeyInArray!0 k0!854))))

(declare-fun b!878275 () Bool)

(declare-fun res!596729 () Bool)

(assert (=> b!878275 (=> (not res!596729) (not e!488784))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!878275 (= res!596729 (and (= (size!25020 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25019 _keys!868) (size!25020 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!878276 () Bool)

(declare-fun res!596727 () Bool)

(assert (=> b!878276 (=> (not res!596727) (not e!488784))))

(declare-datatypes ((List!17451 0))(
  ( (Nil!17448) (Cons!17447 (h!18578 (_ BitVec 64)) (t!24531 List!17451)) )
))
(declare-fun arrayNoDuplicates!0 (array!51101 (_ BitVec 32) List!17451) Bool)

(assert (=> b!878276 (= res!596727 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17448))))

(declare-fun mapNonEmpty!27861 () Bool)

(declare-fun tp!53441 () Bool)

(declare-fun e!488783 () Bool)

(assert (=> mapNonEmpty!27861 (= mapRes!27861 (and tp!53441 e!488783))))

(declare-fun mapRest!27861 () (Array (_ BitVec 32) ValueCell!8309))

(declare-fun mapValue!27861 () ValueCell!8309)

(declare-fun mapKey!27861 () (_ BitVec 32))

(assert (=> mapNonEmpty!27861 (= (arr!24578 _values!688) (store mapRest!27861 mapKey!27861 mapValue!27861))))

(declare-fun mapIsEmpty!27861 () Bool)

(assert (=> mapIsEmpty!27861 mapRes!27861))

(declare-fun b!878277 () Bool)

(declare-fun res!596728 () Bool)

(assert (=> b!878277 (=> (not res!596728) (not e!488784))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878277 (= res!596728 (validMask!0 mask!1196))))

(declare-fun b!878278 () Bool)

(assert (=> b!878278 (= e!488784 false)))

(declare-fun v!557 () V!28377)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11650 0))(
  ( (tuple2!11651 (_1!5836 (_ BitVec 64)) (_2!5836 V!28377)) )
))
(declare-datatypes ((List!17452 0))(
  ( (Nil!17449) (Cons!17448 (h!18579 tuple2!11650) (t!24532 List!17452)) )
))
(declare-datatypes ((ListLongMap!10409 0))(
  ( (ListLongMap!10410 (toList!5220 List!17452)) )
))
(declare-fun lt!397032 () ListLongMap!10409)

(declare-fun minValue!654 () V!28377)

(declare-fun zeroValue!654 () V!28377)

(declare-fun getCurrentListMapNoExtraKeys!3213 (array!51101 array!51103 (_ BitVec 32) (_ BitVec 32) V!28377 V!28377 (_ BitVec 32) Int) ListLongMap!10409)

(assert (=> b!878278 (= lt!397032 (getCurrentListMapNoExtraKeys!3213 _keys!868 (array!51104 (store (arr!24578 _values!688) i!612 (ValueCellFull!8309 v!557)) (size!25020 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397033 () ListLongMap!10409)

(assert (=> b!878278 (= lt!397033 (getCurrentListMapNoExtraKeys!3213 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!878279 () Bool)

(declare-fun res!596726 () Bool)

(assert (=> b!878279 (=> (not res!596726) (not e!488784))))

(assert (=> b!878279 (= res!596726 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25019 _keys!868))))))

(declare-fun b!878280 () Bool)

(assert (=> b!878280 (= e!488783 tp_is_empty!17497)))

(declare-fun b!878281 () Bool)

(declare-fun res!596724 () Bool)

(assert (=> b!878281 (=> (not res!596724) (not e!488784))))

(assert (=> b!878281 (= res!596724 (and (= (select (arr!24577 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!74546 res!596730) b!878277))

(assert (= (and b!878277 res!596728) b!878275))

(assert (= (and b!878275 res!596729) b!878272))

(assert (= (and b!878272 res!596725) b!878276))

(assert (= (and b!878276 res!596727) b!878279))

(assert (= (and b!878279 res!596726) b!878274))

(assert (= (and b!878274 res!596723) b!878281))

(assert (= (and b!878281 res!596724) b!878278))

(assert (= (and b!878273 condMapEmpty!27861) mapIsEmpty!27861))

(assert (= (and b!878273 (not condMapEmpty!27861)) mapNonEmpty!27861))

(get-info :version)

(assert (= (and mapNonEmpty!27861 ((_ is ValueCellFull!8309) mapValue!27861)) b!878280))

(assert (= (and b!878273 ((_ is ValueCellFull!8309) mapDefault!27861)) b!878271))

(assert (= start!74546 b!878273))

(declare-fun m!817599 () Bool)

(assert (=> b!878274 m!817599))

(declare-fun m!817601 () Bool)

(assert (=> b!878278 m!817601))

(declare-fun m!817603 () Bool)

(assert (=> b!878278 m!817603))

(declare-fun m!817605 () Bool)

(assert (=> b!878278 m!817605))

(declare-fun m!817607 () Bool)

(assert (=> mapNonEmpty!27861 m!817607))

(declare-fun m!817609 () Bool)

(assert (=> b!878272 m!817609))

(declare-fun m!817611 () Bool)

(assert (=> start!74546 m!817611))

(declare-fun m!817613 () Bool)

(assert (=> start!74546 m!817613))

(declare-fun m!817615 () Bool)

(assert (=> b!878277 m!817615))

(declare-fun m!817617 () Bool)

(assert (=> b!878276 m!817617))

(declare-fun m!817619 () Bool)

(assert (=> b!878281 m!817619))

(check-sat (not mapNonEmpty!27861) (not b!878272) (not b!878274) (not b!878278) (not start!74546) (not b!878277) b_and!25103 (not b_next!15253) tp_is_empty!17497 (not b!878276))
(check-sat b_and!25103 (not b_next!15253))
