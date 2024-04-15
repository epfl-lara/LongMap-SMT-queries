; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74510 () Bool)

(assert start!74510)

(declare-fun b_free!15217 () Bool)

(declare-fun b_next!15217 () Bool)

(assert (=> start!74510 (= b_free!15217 (not b_next!15217))))

(declare-fun tp!53333 () Bool)

(declare-fun b_and!25067 () Bool)

(assert (=> start!74510 (= tp!53333 b_and!25067)))

(declare-fun res!596295 () Bool)

(declare-fun e!488514 () Bool)

(assert (=> start!74510 (=> (not res!596295) (not e!488514))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51029 0))(
  ( (array!51030 (arr!24541 (Array (_ BitVec 32) (_ BitVec 64))) (size!24983 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51029)

(assert (=> start!74510 (= res!596295 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24983 _keys!868))))))

(assert (=> start!74510 e!488514))

(declare-fun tp_is_empty!17461 () Bool)

(assert (=> start!74510 tp_is_empty!17461))

(assert (=> start!74510 true))

(assert (=> start!74510 tp!53333))

(declare-fun array_inv!19382 (array!51029) Bool)

(assert (=> start!74510 (array_inv!19382 _keys!868)))

(declare-datatypes ((V!28329 0))(
  ( (V!28330 (val!8778 Int)) )
))
(declare-datatypes ((ValueCell!8291 0))(
  ( (ValueCellFull!8291 (v!11212 V!28329)) (EmptyCell!8291) )
))
(declare-datatypes ((array!51031 0))(
  ( (array!51032 (arr!24542 (Array (_ BitVec 32) ValueCell!8291)) (size!24984 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51031)

(declare-fun e!488516 () Bool)

(declare-fun array_inv!19383 (array!51031) Bool)

(assert (=> start!74510 (and (array_inv!19383 _values!688) e!488516)))

(declare-fun b!877677 () Bool)

(declare-fun res!596297 () Bool)

(assert (=> b!877677 (=> (not res!596297) (not e!488514))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!877677 (= res!596297 (and (= (select (arr!24541 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!877678 () Bool)

(declare-fun res!596291 () Bool)

(assert (=> b!877678 (=> (not res!596291) (not e!488514))))

(declare-datatypes ((List!17422 0))(
  ( (Nil!17419) (Cons!17418 (h!18549 (_ BitVec 64)) (t!24502 List!17422)) )
))
(declare-fun arrayNoDuplicates!0 (array!51029 (_ BitVec 32) List!17422) Bool)

(assert (=> b!877678 (= res!596291 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17419))))

(declare-fun b!877679 () Bool)

(declare-fun res!596298 () Bool)

(assert (=> b!877679 (=> (not res!596298) (not e!488514))))

(assert (=> b!877679 (= res!596298 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24983 _keys!868))))))

(declare-fun b!877680 () Bool)

(declare-fun res!596293 () Bool)

(assert (=> b!877680 (=> (not res!596293) (not e!488514))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51029 (_ BitVec 32)) Bool)

(assert (=> b!877680 (= res!596293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!877681 () Bool)

(declare-fun e!488515 () Bool)

(declare-fun mapRes!27807 () Bool)

(assert (=> b!877681 (= e!488516 (and e!488515 mapRes!27807))))

(declare-fun condMapEmpty!27807 () Bool)

(declare-fun mapDefault!27807 () ValueCell!8291)

(assert (=> b!877681 (= condMapEmpty!27807 (= (arr!24542 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8291)) mapDefault!27807)))))

(declare-fun b!877682 () Bool)

(assert (=> b!877682 (= e!488514 false)))

(declare-fun v!557 () V!28329)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!11620 0))(
  ( (tuple2!11621 (_1!5821 (_ BitVec 64)) (_2!5821 V!28329)) )
))
(declare-datatypes ((List!17423 0))(
  ( (Nil!17420) (Cons!17419 (h!18550 tuple2!11620) (t!24503 List!17423)) )
))
(declare-datatypes ((ListLongMap!10379 0))(
  ( (ListLongMap!10380 (toList!5205 List!17423)) )
))
(declare-fun lt!396924 () ListLongMap!10379)

(declare-fun minValue!654 () V!28329)

(declare-fun zeroValue!654 () V!28329)

(declare-fun getCurrentListMapNoExtraKeys!3198 (array!51029 array!51031 (_ BitVec 32) (_ BitVec 32) V!28329 V!28329 (_ BitVec 32) Int) ListLongMap!10379)

(assert (=> b!877682 (= lt!396924 (getCurrentListMapNoExtraKeys!3198 _keys!868 (array!51032 (store (arr!24542 _values!688) i!612 (ValueCellFull!8291 v!557)) (size!24984 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!396925 () ListLongMap!10379)

(assert (=> b!877682 (= lt!396925 (getCurrentListMapNoExtraKeys!3198 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!877683 () Bool)

(declare-fun e!488517 () Bool)

(assert (=> b!877683 (= e!488517 tp_is_empty!17461)))

(declare-fun b!877684 () Bool)

(assert (=> b!877684 (= e!488515 tp_is_empty!17461)))

(declare-fun b!877685 () Bool)

(declare-fun res!596292 () Bool)

(assert (=> b!877685 (=> (not res!596292) (not e!488514))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!877685 (= res!596292 (validMask!0 mask!1196))))

(declare-fun b!877686 () Bool)

(declare-fun res!596296 () Bool)

(assert (=> b!877686 (=> (not res!596296) (not e!488514))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!877686 (= res!596296 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!27807 () Bool)

(declare-fun tp!53334 () Bool)

(assert (=> mapNonEmpty!27807 (= mapRes!27807 (and tp!53334 e!488517))))

(declare-fun mapRest!27807 () (Array (_ BitVec 32) ValueCell!8291))

(declare-fun mapKey!27807 () (_ BitVec 32))

(declare-fun mapValue!27807 () ValueCell!8291)

(assert (=> mapNonEmpty!27807 (= (arr!24542 _values!688) (store mapRest!27807 mapKey!27807 mapValue!27807))))

(declare-fun mapIsEmpty!27807 () Bool)

(assert (=> mapIsEmpty!27807 mapRes!27807))

(declare-fun b!877687 () Bool)

(declare-fun res!596294 () Bool)

(assert (=> b!877687 (=> (not res!596294) (not e!488514))))

(assert (=> b!877687 (= res!596294 (and (= (size!24984 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24983 _keys!868) (size!24984 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!74510 res!596295) b!877685))

(assert (= (and b!877685 res!596292) b!877687))

(assert (= (and b!877687 res!596294) b!877680))

(assert (= (and b!877680 res!596293) b!877678))

(assert (= (and b!877678 res!596291) b!877679))

(assert (= (and b!877679 res!596298) b!877686))

(assert (= (and b!877686 res!596296) b!877677))

(assert (= (and b!877677 res!596297) b!877682))

(assert (= (and b!877681 condMapEmpty!27807) mapIsEmpty!27807))

(assert (= (and b!877681 (not condMapEmpty!27807)) mapNonEmpty!27807))

(get-info :version)

(assert (= (and mapNonEmpty!27807 ((_ is ValueCellFull!8291) mapValue!27807)) b!877683))

(assert (= (and b!877681 ((_ is ValueCellFull!8291) mapDefault!27807)) b!877684))

(assert (= start!74510 b!877681))

(declare-fun m!817203 () Bool)

(assert (=> b!877686 m!817203))

(declare-fun m!817205 () Bool)

(assert (=> b!877677 m!817205))

(declare-fun m!817207 () Bool)

(assert (=> start!74510 m!817207))

(declare-fun m!817209 () Bool)

(assert (=> start!74510 m!817209))

(declare-fun m!817211 () Bool)

(assert (=> mapNonEmpty!27807 m!817211))

(declare-fun m!817213 () Bool)

(assert (=> b!877678 m!817213))

(declare-fun m!817215 () Bool)

(assert (=> b!877682 m!817215))

(declare-fun m!817217 () Bool)

(assert (=> b!877682 m!817217))

(declare-fun m!817219 () Bool)

(assert (=> b!877682 m!817219))

(declare-fun m!817221 () Bool)

(assert (=> b!877685 m!817221))

(declare-fun m!817223 () Bool)

(assert (=> b!877680 m!817223))

(check-sat (not mapNonEmpty!27807) (not b!877680) (not start!74510) (not b!877678) (not b!877686) tp_is_empty!17461 (not b_next!15217) (not b!877685) (not b!877682) b_and!25067)
(check-sat b_and!25067 (not b_next!15217))
