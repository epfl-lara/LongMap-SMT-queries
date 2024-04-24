; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74696 () Bool)

(assert start!74696)

(declare-fun b_free!15217 () Bool)

(declare-fun b_next!15217 () Bool)

(assert (=> start!74696 (= b_free!15217 (not b_next!15217))))

(declare-fun tp!53333 () Bool)

(declare-fun b_and!25103 () Bool)

(assert (=> start!74696 (= tp!53333 b_and!25103)))

(declare-fun b!878819 () Bool)

(declare-fun res!596750 () Bool)

(declare-fun e!489246 () Bool)

(assert (=> b!878819 (=> (not res!596750) (not e!489246))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!51091 0))(
  ( (array!51092 (arr!24567 (Array (_ BitVec 32) (_ BitVec 64))) (size!25008 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51091)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!878819 (= res!596750 (and (= (select (arr!24567 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!878820 () Bool)

(assert (=> b!878820 (= e!489246 false)))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!28329 0))(
  ( (V!28330 (val!8778 Int)) )
))
(declare-datatypes ((ValueCell!8291 0))(
  ( (ValueCellFull!8291 (v!11218 V!28329)) (EmptyCell!8291) )
))
(declare-datatypes ((array!51093 0))(
  ( (array!51094 (arr!24568 (Array (_ BitVec 32) ValueCell!8291)) (size!25009 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51093)

(declare-fun minValue!654 () V!28329)

(declare-fun zeroValue!654 () V!28329)

(declare-fun v!557 () V!28329)

(declare-datatypes ((tuple2!11542 0))(
  ( (tuple2!11543 (_1!5782 (_ BitVec 64)) (_2!5782 V!28329)) )
))
(declare-datatypes ((List!17377 0))(
  ( (Nil!17374) (Cons!17373 (h!18510 tuple2!11542) (t!24458 List!17377)) )
))
(declare-datatypes ((ListLongMap!10313 0))(
  ( (ListLongMap!10314 (toList!5172 List!17377)) )
))
(declare-fun lt!397522 () ListLongMap!10313)

(declare-fun getCurrentListMapNoExtraKeys!3214 (array!51091 array!51093 (_ BitVec 32) (_ BitVec 32) V!28329 V!28329 (_ BitVec 32) Int) ListLongMap!10313)

(assert (=> b!878820 (= lt!397522 (getCurrentListMapNoExtraKeys!3214 _keys!868 (array!51094 (store (arr!24568 _values!688) i!612 (ValueCellFull!8291 v!557)) (size!25009 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397521 () ListLongMap!10313)

(assert (=> b!878820 (= lt!397521 (getCurrentListMapNoExtraKeys!3214 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!27807 () Bool)

(declare-fun mapRes!27807 () Bool)

(assert (=> mapIsEmpty!27807 mapRes!27807))

(declare-fun b!878821 () Bool)

(declare-fun res!596746 () Bool)

(assert (=> b!878821 (=> (not res!596746) (not e!489246))))

(declare-datatypes ((List!17378 0))(
  ( (Nil!17375) (Cons!17374 (h!18511 (_ BitVec 64)) (t!24459 List!17378)) )
))
(declare-fun arrayNoDuplicates!0 (array!51091 (_ BitVec 32) List!17378) Bool)

(assert (=> b!878821 (= res!596746 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17375))))

(declare-fun mapNonEmpty!27807 () Bool)

(declare-fun tp!53334 () Bool)

(declare-fun e!489243 () Bool)

(assert (=> mapNonEmpty!27807 (= mapRes!27807 (and tp!53334 e!489243))))

(declare-fun mapKey!27807 () (_ BitVec 32))

(declare-fun mapRest!27807 () (Array (_ BitVec 32) ValueCell!8291))

(declare-fun mapValue!27807 () ValueCell!8291)

(assert (=> mapNonEmpty!27807 (= (arr!24568 _values!688) (store mapRest!27807 mapKey!27807 mapValue!27807))))

(declare-fun b!878822 () Bool)

(declare-fun tp_is_empty!17461 () Bool)

(assert (=> b!878822 (= e!489243 tp_is_empty!17461)))

(declare-fun b!878823 () Bool)

(declare-fun res!596745 () Bool)

(assert (=> b!878823 (=> (not res!596745) (not e!489246))))

(assert (=> b!878823 (= res!596745 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25008 _keys!868))))))

(declare-fun b!878825 () Bool)

(declare-fun e!489244 () Bool)

(declare-fun e!489247 () Bool)

(assert (=> b!878825 (= e!489244 (and e!489247 mapRes!27807))))

(declare-fun condMapEmpty!27807 () Bool)

(declare-fun mapDefault!27807 () ValueCell!8291)

(assert (=> b!878825 (= condMapEmpty!27807 (= (arr!24568 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8291)) mapDefault!27807)))))

(declare-fun b!878826 () Bool)

(declare-fun res!596752 () Bool)

(assert (=> b!878826 (=> (not res!596752) (not e!489246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51091 (_ BitVec 32)) Bool)

(assert (=> b!878826 (= res!596752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!878827 () Bool)

(assert (=> b!878827 (= e!489247 tp_is_empty!17461)))

(declare-fun b!878828 () Bool)

(declare-fun res!596749 () Bool)

(assert (=> b!878828 (=> (not res!596749) (not e!489246))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878828 (= res!596749 (validMask!0 mask!1196))))

(declare-fun b!878829 () Bool)

(declare-fun res!596747 () Bool)

(assert (=> b!878829 (=> (not res!596747) (not e!489246))))

(assert (=> b!878829 (= res!596747 (and (= (size!25009 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25008 _keys!868) (size!25009 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!596748 () Bool)

(assert (=> start!74696 (=> (not res!596748) (not e!489246))))

(assert (=> start!74696 (= res!596748 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25008 _keys!868))))))

(assert (=> start!74696 e!489246))

(assert (=> start!74696 tp_is_empty!17461))

(assert (=> start!74696 true))

(assert (=> start!74696 tp!53333))

(declare-fun array_inv!19410 (array!51091) Bool)

(assert (=> start!74696 (array_inv!19410 _keys!868)))

(declare-fun array_inv!19411 (array!51093) Bool)

(assert (=> start!74696 (and (array_inv!19411 _values!688) e!489244)))

(declare-fun b!878824 () Bool)

(declare-fun res!596751 () Bool)

(assert (=> b!878824 (=> (not res!596751) (not e!489246))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878824 (= res!596751 (validKeyInArray!0 k0!854))))

(assert (= (and start!74696 res!596748) b!878828))

(assert (= (and b!878828 res!596749) b!878829))

(assert (= (and b!878829 res!596747) b!878826))

(assert (= (and b!878826 res!596752) b!878821))

(assert (= (and b!878821 res!596746) b!878823))

(assert (= (and b!878823 res!596745) b!878824))

(assert (= (and b!878824 res!596751) b!878819))

(assert (= (and b!878819 res!596750) b!878820))

(assert (= (and b!878825 condMapEmpty!27807) mapIsEmpty!27807))

(assert (= (and b!878825 (not condMapEmpty!27807)) mapNonEmpty!27807))

(get-info :version)

(assert (= (and mapNonEmpty!27807 ((_ is ValueCellFull!8291) mapValue!27807)) b!878822))

(assert (= (and b!878825 ((_ is ValueCellFull!8291) mapDefault!27807)) b!878827))

(assert (= start!74696 b!878825))

(declare-fun m!819255 () Bool)

(assert (=> mapNonEmpty!27807 m!819255))

(declare-fun m!819257 () Bool)

(assert (=> b!878819 m!819257))

(declare-fun m!819259 () Bool)

(assert (=> b!878828 m!819259))

(declare-fun m!819261 () Bool)

(assert (=> b!878824 m!819261))

(declare-fun m!819263 () Bool)

(assert (=> start!74696 m!819263))

(declare-fun m!819265 () Bool)

(assert (=> start!74696 m!819265))

(declare-fun m!819267 () Bool)

(assert (=> b!878820 m!819267))

(declare-fun m!819269 () Bool)

(assert (=> b!878820 m!819269))

(declare-fun m!819271 () Bool)

(assert (=> b!878820 m!819271))

(declare-fun m!819273 () Bool)

(assert (=> b!878826 m!819273))

(declare-fun m!819275 () Bool)

(assert (=> b!878821 m!819275))

(check-sat (not b_next!15217) (not b!878828) (not b!878820) (not b!878826) (not start!74696) b_and!25103 (not b!878821) (not b!878824) (not mapNonEmpty!27807) tp_is_empty!17461)
(check-sat b_and!25103 (not b_next!15217))
