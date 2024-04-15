; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74540 () Bool)

(assert start!74540)

(declare-fun b_free!15247 () Bool)

(declare-fun b_next!15247 () Bool)

(assert (=> start!74540 (= b_free!15247 (not b_next!15247))))

(declare-fun tp!53424 () Bool)

(declare-fun b_and!25097 () Bool)

(assert (=> start!74540 (= tp!53424 b_and!25097)))

(declare-fun b!878172 () Bool)

(declare-fun e!488742 () Bool)

(declare-fun tp_is_empty!17491 () Bool)

(assert (=> b!878172 (= e!488742 tp_is_empty!17491)))

(declare-fun res!596658 () Bool)

(declare-fun e!488740 () Bool)

(assert (=> start!74540 (=> (not res!596658) (not e!488740))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51089 0))(
  ( (array!51090 (arr!24571 (Array (_ BitVec 32) (_ BitVec 64))) (size!25013 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51089)

(assert (=> start!74540 (= res!596658 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25013 _keys!868))))))

(assert (=> start!74540 e!488740))

(assert (=> start!74540 tp_is_empty!17491))

(assert (=> start!74540 true))

(assert (=> start!74540 tp!53424))

(declare-fun array_inv!19410 (array!51089) Bool)

(assert (=> start!74540 (array_inv!19410 _keys!868)))

(declare-datatypes ((V!28369 0))(
  ( (V!28370 (val!8793 Int)) )
))
(declare-datatypes ((ValueCell!8306 0))(
  ( (ValueCellFull!8306 (v!11227 V!28369)) (EmptyCell!8306) )
))
(declare-datatypes ((array!51091 0))(
  ( (array!51092 (arr!24572 (Array (_ BitVec 32) ValueCell!8306)) (size!25014 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51091)

(declare-fun e!488741 () Bool)

(declare-fun array_inv!19411 (array!51091) Bool)

(assert (=> start!74540 (and (array_inv!19411 _values!688) e!488741)))

(declare-fun b!878173 () Bool)

(declare-fun res!596652 () Bool)

(assert (=> b!878173 (=> (not res!596652) (not e!488740))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878173 (= res!596652 (validKeyInArray!0 k0!854))))

(declare-fun b!878174 () Bool)

(declare-fun e!488739 () Bool)

(declare-fun mapRes!27852 () Bool)

(assert (=> b!878174 (= e!488741 (and e!488739 mapRes!27852))))

(declare-fun condMapEmpty!27852 () Bool)

(declare-fun mapDefault!27852 () ValueCell!8306)

(assert (=> b!878174 (= condMapEmpty!27852 (= (arr!24572 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8306)) mapDefault!27852)))))

(declare-fun b!878175 () Bool)

(assert (=> b!878175 (= e!488740 false)))

(declare-datatypes ((tuple2!11644 0))(
  ( (tuple2!11645 (_1!5833 (_ BitVec 64)) (_2!5833 V!28369)) )
))
(declare-datatypes ((List!17446 0))(
  ( (Nil!17443) (Cons!17442 (h!18573 tuple2!11644) (t!24526 List!17446)) )
))
(declare-datatypes ((ListLongMap!10403 0))(
  ( (ListLongMap!10404 (toList!5217 List!17446)) )
))
(declare-fun lt!397015 () ListLongMap!10403)

(declare-fun v!557 () V!28369)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28369)

(declare-fun zeroValue!654 () V!28369)

(declare-fun getCurrentListMapNoExtraKeys!3210 (array!51089 array!51091 (_ BitVec 32) (_ BitVec 32) V!28369 V!28369 (_ BitVec 32) Int) ListLongMap!10403)

(assert (=> b!878175 (= lt!397015 (getCurrentListMapNoExtraKeys!3210 _keys!868 (array!51092 (store (arr!24572 _values!688) i!612 (ValueCellFull!8306 v!557)) (size!25014 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397014 () ListLongMap!10403)

(assert (=> b!878175 (= lt!397014 (getCurrentListMapNoExtraKeys!3210 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!878176 () Bool)

(declare-fun res!596651 () Bool)

(assert (=> b!878176 (=> (not res!596651) (not e!488740))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51089 (_ BitVec 32)) Bool)

(assert (=> b!878176 (= res!596651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!27852 () Bool)

(assert (=> mapIsEmpty!27852 mapRes!27852))

(declare-fun b!878177 () Bool)

(declare-fun res!596656 () Bool)

(assert (=> b!878177 (=> (not res!596656) (not e!488740))))

(assert (=> b!878177 (= res!596656 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25013 _keys!868))))))

(declare-fun mapNonEmpty!27852 () Bool)

(declare-fun tp!53423 () Bool)

(assert (=> mapNonEmpty!27852 (= mapRes!27852 (and tp!53423 e!488742))))

(declare-fun mapValue!27852 () ValueCell!8306)

(declare-fun mapRest!27852 () (Array (_ BitVec 32) ValueCell!8306))

(declare-fun mapKey!27852 () (_ BitVec 32))

(assert (=> mapNonEmpty!27852 (= (arr!24572 _values!688) (store mapRest!27852 mapKey!27852 mapValue!27852))))

(declare-fun b!878178 () Bool)

(assert (=> b!878178 (= e!488739 tp_is_empty!17491)))

(declare-fun b!878179 () Bool)

(declare-fun res!596657 () Bool)

(assert (=> b!878179 (=> (not res!596657) (not e!488740))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878179 (= res!596657 (validMask!0 mask!1196))))

(declare-fun b!878180 () Bool)

(declare-fun res!596653 () Bool)

(assert (=> b!878180 (=> (not res!596653) (not e!488740))))

(assert (=> b!878180 (= res!596653 (and (= (size!25014 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25013 _keys!868) (size!25014 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!878181 () Bool)

(declare-fun res!596655 () Bool)

(assert (=> b!878181 (=> (not res!596655) (not e!488740))))

(declare-datatypes ((List!17447 0))(
  ( (Nil!17444) (Cons!17443 (h!18574 (_ BitVec 64)) (t!24527 List!17447)) )
))
(declare-fun arrayNoDuplicates!0 (array!51089 (_ BitVec 32) List!17447) Bool)

(assert (=> b!878181 (= res!596655 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17444))))

(declare-fun b!878182 () Bool)

(declare-fun res!596654 () Bool)

(assert (=> b!878182 (=> (not res!596654) (not e!488740))))

(assert (=> b!878182 (= res!596654 (and (= (select (arr!24571 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!74540 res!596658) b!878179))

(assert (= (and b!878179 res!596657) b!878180))

(assert (= (and b!878180 res!596653) b!878176))

(assert (= (and b!878176 res!596651) b!878181))

(assert (= (and b!878181 res!596655) b!878177))

(assert (= (and b!878177 res!596656) b!878173))

(assert (= (and b!878173 res!596652) b!878182))

(assert (= (and b!878182 res!596654) b!878175))

(assert (= (and b!878174 condMapEmpty!27852) mapIsEmpty!27852))

(assert (= (and b!878174 (not condMapEmpty!27852)) mapNonEmpty!27852))

(get-info :version)

(assert (= (and mapNonEmpty!27852 ((_ is ValueCellFull!8306) mapValue!27852)) b!878172))

(assert (= (and b!878174 ((_ is ValueCellFull!8306) mapDefault!27852)) b!878178))

(assert (= start!74540 b!878174))

(declare-fun m!817533 () Bool)

(assert (=> b!878182 m!817533))

(declare-fun m!817535 () Bool)

(assert (=> b!878176 m!817535))

(declare-fun m!817537 () Bool)

(assert (=> start!74540 m!817537))

(declare-fun m!817539 () Bool)

(assert (=> start!74540 m!817539))

(declare-fun m!817541 () Bool)

(assert (=> mapNonEmpty!27852 m!817541))

(declare-fun m!817543 () Bool)

(assert (=> b!878181 m!817543))

(declare-fun m!817545 () Bool)

(assert (=> b!878175 m!817545))

(declare-fun m!817547 () Bool)

(assert (=> b!878175 m!817547))

(declare-fun m!817549 () Bool)

(assert (=> b!878175 m!817549))

(declare-fun m!817551 () Bool)

(assert (=> b!878173 m!817551))

(declare-fun m!817553 () Bool)

(assert (=> b!878179 m!817553))

(check-sat (not b!878173) (not mapNonEmpty!27852) (not b!878176) (not b_next!15247) tp_is_empty!17491 (not start!74540) b_and!25097 (not b!878179) (not b!878181) (not b!878175))
(check-sat b_and!25097 (not b_next!15247))
