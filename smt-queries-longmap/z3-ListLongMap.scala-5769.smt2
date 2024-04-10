; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74518 () Bool)

(assert start!74518)

(declare-fun b_free!15207 () Bool)

(declare-fun b_next!15207 () Bool)

(assert (=> start!74518 (= b_free!15207 (not b_next!15207))))

(declare-fun tp!53302 () Bool)

(declare-fun b_and!25083 () Bool)

(assert (=> start!74518 (= tp!53302 b_and!25083)))

(declare-fun b!877751 () Bool)

(declare-fun res!596285 () Bool)

(declare-fun e!488590 () Bool)

(assert (=> b!877751 (=> (not res!596285) (not e!488590))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!51030 0))(
  ( (array!51031 (arr!24541 (Array (_ BitVec 32) (_ BitVec 64))) (size!24981 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51030)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!877751 (= res!596285 (and (= (select (arr!24541 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!596288 () Bool)

(assert (=> start!74518 (=> (not res!596288) (not e!488590))))

(assert (=> start!74518 (= res!596288 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24981 _keys!868))))))

(assert (=> start!74518 e!488590))

(declare-fun tp_is_empty!17451 () Bool)

(assert (=> start!74518 tp_is_empty!17451))

(assert (=> start!74518 true))

(assert (=> start!74518 tp!53302))

(declare-fun array_inv!19344 (array!51030) Bool)

(assert (=> start!74518 (array_inv!19344 _keys!868)))

(declare-datatypes ((V!28315 0))(
  ( (V!28316 (val!8773 Int)) )
))
(declare-datatypes ((ValueCell!8286 0))(
  ( (ValueCellFull!8286 (v!11213 V!28315)) (EmptyCell!8286) )
))
(declare-datatypes ((array!51032 0))(
  ( (array!51033 (arr!24542 (Array (_ BitVec 32) ValueCell!8286)) (size!24982 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51032)

(declare-fun e!488588 () Bool)

(declare-fun array_inv!19345 (array!51032) Bool)

(assert (=> start!74518 (and (array_inv!19345 _values!688) e!488588)))

(declare-fun mapIsEmpty!27792 () Bool)

(declare-fun mapRes!27792 () Bool)

(assert (=> mapIsEmpty!27792 mapRes!27792))

(declare-fun b!877752 () Bool)

(declare-fun res!596287 () Bool)

(assert (=> b!877752 (=> (not res!596287) (not e!488590))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!877752 (= res!596287 (validKeyInArray!0 k0!854))))

(declare-fun b!877753 () Bool)

(declare-fun res!596284 () Bool)

(assert (=> b!877753 (=> (not res!596284) (not e!488590))))

(assert (=> b!877753 (= res!596284 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24981 _keys!868))))))

(declare-fun mapNonEmpty!27792 () Bool)

(declare-fun tp!53303 () Bool)

(declare-fun e!488587 () Bool)

(assert (=> mapNonEmpty!27792 (= mapRes!27792 (and tp!53303 e!488587))))

(declare-fun mapKey!27792 () (_ BitVec 32))

(declare-fun mapRest!27792 () (Array (_ BitVec 32) ValueCell!8286))

(declare-fun mapValue!27792 () ValueCell!8286)

(assert (=> mapNonEmpty!27792 (= (arr!24542 _values!688) (store mapRest!27792 mapKey!27792 mapValue!27792))))

(declare-fun b!877754 () Bool)

(declare-fun res!596283 () Bool)

(assert (=> b!877754 (=> (not res!596283) (not e!488590))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!877754 (= res!596283 (and (= (size!24982 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24981 _keys!868) (size!24982 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!877755 () Bool)

(declare-fun e!488586 () Bool)

(assert (=> b!877755 (= e!488588 (and e!488586 mapRes!27792))))

(declare-fun condMapEmpty!27792 () Bool)

(declare-fun mapDefault!27792 () ValueCell!8286)

(assert (=> b!877755 (= condMapEmpty!27792 (= (arr!24542 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8286)) mapDefault!27792)))))

(declare-fun b!877756 () Bool)

(declare-fun res!596281 () Bool)

(assert (=> b!877756 (=> (not res!596281) (not e!488590))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!877756 (= res!596281 (validMask!0 mask!1196))))

(declare-fun b!877757 () Bool)

(assert (=> b!877757 (= e!488586 tp_is_empty!17451)))

(declare-fun b!877758 () Bool)

(declare-fun res!596286 () Bool)

(assert (=> b!877758 (=> (not res!596286) (not e!488590))))

(declare-datatypes ((List!17415 0))(
  ( (Nil!17412) (Cons!17411 (h!18542 (_ BitVec 64)) (t!24504 List!17415)) )
))
(declare-fun arrayNoDuplicates!0 (array!51030 (_ BitVec 32) List!17415) Bool)

(assert (=> b!877758 (= res!596286 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17412))))

(declare-fun b!877759 () Bool)

(assert (=> b!877759 (= e!488590 false)))

(declare-fun v!557 () V!28315)

(declare-datatypes ((tuple2!11600 0))(
  ( (tuple2!11601 (_1!5811 (_ BitVec 64)) (_2!5811 V!28315)) )
))
(declare-datatypes ((List!17416 0))(
  ( (Nil!17413) (Cons!17412 (h!18543 tuple2!11600) (t!24505 List!17416)) )
))
(declare-datatypes ((ListLongMap!10369 0))(
  ( (ListLongMap!10370 (toList!5200 List!17416)) )
))
(declare-fun lt!397131 () ListLongMap!10369)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28315)

(declare-fun zeroValue!654 () V!28315)

(declare-fun getCurrentListMapNoExtraKeys!3167 (array!51030 array!51032 (_ BitVec 32) (_ BitVec 32) V!28315 V!28315 (_ BitVec 32) Int) ListLongMap!10369)

(assert (=> b!877759 (= lt!397131 (getCurrentListMapNoExtraKeys!3167 _keys!868 (array!51033 (store (arr!24542 _values!688) i!612 (ValueCellFull!8286 v!557)) (size!24982 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397130 () ListLongMap!10369)

(assert (=> b!877759 (= lt!397130 (getCurrentListMapNoExtraKeys!3167 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!877760 () Bool)

(declare-fun res!596282 () Bool)

(assert (=> b!877760 (=> (not res!596282) (not e!488590))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51030 (_ BitVec 32)) Bool)

(assert (=> b!877760 (= res!596282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!877761 () Bool)

(assert (=> b!877761 (= e!488587 tp_is_empty!17451)))

(assert (= (and start!74518 res!596288) b!877756))

(assert (= (and b!877756 res!596281) b!877754))

(assert (= (and b!877754 res!596283) b!877760))

(assert (= (and b!877760 res!596282) b!877758))

(assert (= (and b!877758 res!596286) b!877753))

(assert (= (and b!877753 res!596284) b!877752))

(assert (= (and b!877752 res!596287) b!877751))

(assert (= (and b!877751 res!596285) b!877759))

(assert (= (and b!877755 condMapEmpty!27792) mapIsEmpty!27792))

(assert (= (and b!877755 (not condMapEmpty!27792)) mapNonEmpty!27792))

(get-info :version)

(assert (= (and mapNonEmpty!27792 ((_ is ValueCellFull!8286) mapValue!27792)) b!877761))

(assert (= (and b!877755 ((_ is ValueCellFull!8286) mapDefault!27792)) b!877757))

(assert (= start!74518 b!877755))

(declare-fun m!817851 () Bool)

(assert (=> mapNonEmpty!27792 m!817851))

(declare-fun m!817853 () Bool)

(assert (=> b!877758 m!817853))

(declare-fun m!817855 () Bool)

(assert (=> b!877751 m!817855))

(declare-fun m!817857 () Bool)

(assert (=> b!877752 m!817857))

(declare-fun m!817859 () Bool)

(assert (=> b!877760 m!817859))

(declare-fun m!817861 () Bool)

(assert (=> b!877759 m!817861))

(declare-fun m!817863 () Bool)

(assert (=> b!877759 m!817863))

(declare-fun m!817865 () Bool)

(assert (=> b!877759 m!817865))

(declare-fun m!817867 () Bool)

(assert (=> b!877756 m!817867))

(declare-fun m!817869 () Bool)

(assert (=> start!74518 m!817869))

(declare-fun m!817871 () Bool)

(assert (=> start!74518 m!817871))

(check-sat (not b!877759) (not b!877752) (not start!74518) (not b!877760) b_and!25083 (not b!877758) (not b!877756) (not b_next!15207) (not mapNonEmpty!27792) tp_is_empty!17451)
(check-sat b_and!25083 (not b_next!15207))
