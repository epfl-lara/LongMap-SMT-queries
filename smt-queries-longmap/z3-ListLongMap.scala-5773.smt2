; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74542 () Bool)

(assert start!74542)

(declare-fun b_free!15231 () Bool)

(declare-fun b_next!15231 () Bool)

(assert (=> start!74542 (= b_free!15231 (not b_next!15231))))

(declare-fun tp!53375 () Bool)

(declare-fun b_and!25107 () Bool)

(assert (=> start!74542 (= tp!53375 b_and!25107)))

(declare-fun b!878147 () Bool)

(declare-fun e!488766 () Bool)

(declare-fun tp_is_empty!17475 () Bool)

(assert (=> b!878147 (= e!488766 tp_is_empty!17475)))

(declare-fun mapIsEmpty!27828 () Bool)

(declare-fun mapRes!27828 () Bool)

(assert (=> mapIsEmpty!27828 mapRes!27828))

(declare-fun b!878148 () Bool)

(declare-fun res!596576 () Bool)

(declare-fun e!488767 () Bool)

(assert (=> b!878148 (=> (not res!596576) (not e!488767))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878148 (= res!596576 (validMask!0 mask!1196))))

(declare-fun b!878149 () Bool)

(declare-fun e!488768 () Bool)

(assert (=> b!878149 (= e!488768 tp_is_empty!17475)))

(declare-fun b!878150 () Bool)

(declare-fun res!596572 () Bool)

(assert (=> b!878150 (=> (not res!596572) (not e!488767))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51076 0))(
  ( (array!51077 (arr!24564 (Array (_ BitVec 32) (_ BitVec 64))) (size!25004 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51076)

(assert (=> b!878150 (= res!596572 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25004 _keys!868))))))

(declare-fun b!878151 () Bool)

(declare-fun res!596571 () Bool)

(assert (=> b!878151 (=> (not res!596571) (not e!488767))))

(declare-datatypes ((List!17430 0))(
  ( (Nil!17427) (Cons!17426 (h!18557 (_ BitVec 64)) (t!24519 List!17430)) )
))
(declare-fun arrayNoDuplicates!0 (array!51076 (_ BitVec 32) List!17430) Bool)

(assert (=> b!878151 (= res!596571 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17427))))

(declare-fun b!878152 () Bool)

(declare-fun res!596573 () Bool)

(assert (=> b!878152 (=> (not res!596573) (not e!488767))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!878152 (= res!596573 (and (= (select (arr!24564 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!878153 () Bool)

(assert (=> b!878153 (= e!488767 false)))

(declare-datatypes ((V!28347 0))(
  ( (V!28348 (val!8785 Int)) )
))
(declare-fun v!557 () V!28347)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!8298 0))(
  ( (ValueCellFull!8298 (v!11225 V!28347)) (EmptyCell!8298) )
))
(declare-datatypes ((array!51078 0))(
  ( (array!51079 (arr!24565 (Array (_ BitVec 32) ValueCell!8298)) (size!25005 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51078)

(declare-fun minValue!654 () V!28347)

(declare-fun zeroValue!654 () V!28347)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!11614 0))(
  ( (tuple2!11615 (_1!5818 (_ BitVec 64)) (_2!5818 V!28347)) )
))
(declare-datatypes ((List!17431 0))(
  ( (Nil!17428) (Cons!17427 (h!18558 tuple2!11614) (t!24520 List!17431)) )
))
(declare-datatypes ((ListLongMap!10383 0))(
  ( (ListLongMap!10384 (toList!5207 List!17431)) )
))
(declare-fun lt!397203 () ListLongMap!10383)

(declare-fun getCurrentListMapNoExtraKeys!3174 (array!51076 array!51078 (_ BitVec 32) (_ BitVec 32) V!28347 V!28347 (_ BitVec 32) Int) ListLongMap!10383)

(assert (=> b!878153 (= lt!397203 (getCurrentListMapNoExtraKeys!3174 _keys!868 (array!51079 (store (arr!24565 _values!688) i!612 (ValueCellFull!8298 v!557)) (size!25005 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397202 () ListLongMap!10383)

(assert (=> b!878153 (= lt!397202 (getCurrentListMapNoExtraKeys!3174 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!596575 () Bool)

(assert (=> start!74542 (=> (not res!596575) (not e!488767))))

(assert (=> start!74542 (= res!596575 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25004 _keys!868))))))

(assert (=> start!74542 e!488767))

(assert (=> start!74542 tp_is_empty!17475))

(assert (=> start!74542 true))

(assert (=> start!74542 tp!53375))

(declare-fun array_inv!19360 (array!51076) Bool)

(assert (=> start!74542 (array_inv!19360 _keys!868)))

(declare-fun e!488769 () Bool)

(declare-fun array_inv!19361 (array!51078) Bool)

(assert (=> start!74542 (and (array_inv!19361 _values!688) e!488769)))

(declare-fun b!878154 () Bool)

(declare-fun res!596570 () Bool)

(assert (=> b!878154 (=> (not res!596570) (not e!488767))))

(assert (=> b!878154 (= res!596570 (and (= (size!25005 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25004 _keys!868) (size!25005 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!878155 () Bool)

(assert (=> b!878155 (= e!488769 (and e!488768 mapRes!27828))))

(declare-fun condMapEmpty!27828 () Bool)

(declare-fun mapDefault!27828 () ValueCell!8298)

(assert (=> b!878155 (= condMapEmpty!27828 (= (arr!24565 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8298)) mapDefault!27828)))))

(declare-fun mapNonEmpty!27828 () Bool)

(declare-fun tp!53374 () Bool)

(assert (=> mapNonEmpty!27828 (= mapRes!27828 (and tp!53374 e!488766))))

(declare-fun mapValue!27828 () ValueCell!8298)

(declare-fun mapRest!27828 () (Array (_ BitVec 32) ValueCell!8298))

(declare-fun mapKey!27828 () (_ BitVec 32))

(assert (=> mapNonEmpty!27828 (= (arr!24565 _values!688) (store mapRest!27828 mapKey!27828 mapValue!27828))))

(declare-fun b!878156 () Bool)

(declare-fun res!596574 () Bool)

(assert (=> b!878156 (=> (not res!596574) (not e!488767))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51076 (_ BitVec 32)) Bool)

(assert (=> b!878156 (= res!596574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!878157 () Bool)

(declare-fun res!596569 () Bool)

(assert (=> b!878157 (=> (not res!596569) (not e!488767))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878157 (= res!596569 (validKeyInArray!0 k0!854))))

(assert (= (and start!74542 res!596575) b!878148))

(assert (= (and b!878148 res!596576) b!878154))

(assert (= (and b!878154 res!596570) b!878156))

(assert (= (and b!878156 res!596574) b!878151))

(assert (= (and b!878151 res!596571) b!878150))

(assert (= (and b!878150 res!596572) b!878157))

(assert (= (and b!878157 res!596569) b!878152))

(assert (= (and b!878152 res!596573) b!878153))

(assert (= (and b!878155 condMapEmpty!27828) mapIsEmpty!27828))

(assert (= (and b!878155 (not condMapEmpty!27828)) mapNonEmpty!27828))

(get-info :version)

(assert (= (and mapNonEmpty!27828 ((_ is ValueCellFull!8298) mapValue!27828)) b!878147))

(assert (= (and b!878155 ((_ is ValueCellFull!8298) mapDefault!27828)) b!878149))

(assert (= start!74542 b!878155))

(declare-fun m!818115 () Bool)

(assert (=> b!878152 m!818115))

(declare-fun m!818117 () Bool)

(assert (=> b!878148 m!818117))

(declare-fun m!818119 () Bool)

(assert (=> b!878157 m!818119))

(declare-fun m!818121 () Bool)

(assert (=> start!74542 m!818121))

(declare-fun m!818123 () Bool)

(assert (=> start!74542 m!818123))

(declare-fun m!818125 () Bool)

(assert (=> mapNonEmpty!27828 m!818125))

(declare-fun m!818127 () Bool)

(assert (=> b!878156 m!818127))

(declare-fun m!818129 () Bool)

(assert (=> b!878151 m!818129))

(declare-fun m!818131 () Bool)

(assert (=> b!878153 m!818131))

(declare-fun m!818133 () Bool)

(assert (=> b!878153 m!818133))

(declare-fun m!818135 () Bool)

(assert (=> b!878153 m!818135))

(check-sat (not b!878156) (not mapNonEmpty!27828) (not b!878157) b_and!25107 (not b!878148) (not b_next!15231) (not b!878153) (not b!878151) tp_is_empty!17475 (not start!74542))
(check-sat b_and!25107 (not b_next!15231))
