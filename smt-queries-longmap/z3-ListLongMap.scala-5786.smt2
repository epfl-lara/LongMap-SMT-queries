; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74640 () Bool)

(assert start!74640)

(declare-fun b_free!15307 () Bool)

(declare-fun b_next!15307 () Bool)

(assert (=> start!74640 (= b_free!15307 (not b_next!15307))))

(declare-fun tp!53610 () Bool)

(declare-fun b_and!25207 () Bool)

(assert (=> start!74640 (= tp!53610 b_and!25207)))

(declare-fun mapIsEmpty!27948 () Bool)

(declare-fun mapRes!27948 () Bool)

(assert (=> mapIsEmpty!27948 mapRes!27948))

(declare-fun b!879561 () Bool)

(declare-fun res!597599 () Bool)

(declare-fun e!489473 () Bool)

(assert (=> b!879561 (=> (not res!597599) (not e!489473))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!879561 (= res!597599 (validKeyInArray!0 k0!854))))

(declare-fun res!597594 () Bool)

(assert (=> start!74640 (=> (not res!597594) (not e!489473))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51211 0))(
  ( (array!51212 (arr!24630 (Array (_ BitVec 32) (_ BitVec 64))) (size!25072 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51211)

(assert (=> start!74640 (= res!597594 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25072 _keys!868))))))

(assert (=> start!74640 e!489473))

(declare-fun tp_is_empty!17551 () Bool)

(assert (=> start!74640 tp_is_empty!17551))

(assert (=> start!74640 true))

(assert (=> start!74640 tp!53610))

(declare-fun array_inv!19452 (array!51211) Bool)

(assert (=> start!74640 (array_inv!19452 _keys!868)))

(declare-datatypes ((V!28449 0))(
  ( (V!28450 (val!8823 Int)) )
))
(declare-datatypes ((ValueCell!8336 0))(
  ( (ValueCellFull!8336 (v!11265 V!28449)) (EmptyCell!8336) )
))
(declare-datatypes ((array!51213 0))(
  ( (array!51214 (arr!24631 (Array (_ BitVec 32) ValueCell!8336)) (size!25073 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51213)

(declare-fun e!489478 () Bool)

(declare-fun array_inv!19453 (array!51213) Bool)

(assert (=> start!74640 (and (array_inv!19453 _values!688) e!489478)))

(declare-fun b!879562 () Bool)

(declare-fun e!489474 () Bool)

(assert (=> b!879562 (= e!489473 e!489474)))

(declare-fun res!597592 () Bool)

(assert (=> b!879562 (=> (not res!597592) (not e!489474))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!879562 (= res!597592 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((tuple2!11688 0))(
  ( (tuple2!11689 (_1!5855 (_ BitVec 64)) (_2!5855 V!28449)) )
))
(declare-datatypes ((List!17487 0))(
  ( (Nil!17484) (Cons!17483 (h!18614 tuple2!11688) (t!24587 List!17487)) )
))
(declare-datatypes ((ListLongMap!10447 0))(
  ( (ListLongMap!10448 (toList!5239 List!17487)) )
))
(declare-fun lt!397551 () ListLongMap!10447)

(declare-fun lt!397552 () array!51213)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28449)

(declare-fun zeroValue!654 () V!28449)

(declare-fun getCurrentListMapNoExtraKeys!3231 (array!51211 array!51213 (_ BitVec 32) (_ BitVec 32) V!28449 V!28449 (_ BitVec 32) Int) ListLongMap!10447)

(assert (=> b!879562 (= lt!397551 (getCurrentListMapNoExtraKeys!3231 _keys!868 lt!397552 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28449)

(assert (=> b!879562 (= lt!397552 (array!51214 (store (arr!24631 _values!688) i!612 (ValueCellFull!8336 v!557)) (size!25073 _values!688)))))

(declare-fun lt!397555 () ListLongMap!10447)

(assert (=> b!879562 (= lt!397555 (getCurrentListMapNoExtraKeys!3231 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!879563 () Bool)

(declare-fun e!489475 () Bool)

(assert (=> b!879563 (= e!489475 true)))

(declare-fun lt!397557 () ListLongMap!10447)

(declare-fun +!2535 (ListLongMap!10447 tuple2!11688) ListLongMap!10447)

(declare-fun get!12957 (ValueCell!8336 V!28449) V!28449)

(declare-fun dynLambda!1229 (Int (_ BitVec 64)) V!28449)

(assert (=> b!879563 (= lt!397551 (+!2535 lt!397557 (tuple2!11689 (select (arr!24630 _keys!868) from!1053) (get!12957 (select (arr!24631 _values!688) from!1053) (dynLambda!1229 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!879564 () Bool)

(declare-fun e!489479 () Bool)

(assert (=> b!879564 (= e!489479 tp_is_empty!17551)))

(declare-fun b!879565 () Bool)

(declare-fun res!597595 () Bool)

(assert (=> b!879565 (=> (not res!597595) (not e!489473))))

(assert (=> b!879565 (= res!597595 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25072 _keys!868))))))

(declare-fun b!879566 () Bool)

(declare-fun res!597593 () Bool)

(assert (=> b!879566 (=> (not res!597593) (not e!489473))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51211 (_ BitVec 32)) Bool)

(assert (=> b!879566 (= res!597593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!879567 () Bool)

(declare-fun e!489477 () Bool)

(assert (=> b!879567 (= e!489477 tp_is_empty!17551)))

(declare-fun b!879568 () Bool)

(declare-fun res!597598 () Bool)

(assert (=> b!879568 (=> (not res!597598) (not e!489473))))

(assert (=> b!879568 (= res!597598 (and (= (size!25073 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25072 _keys!868) (size!25073 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!879569 () Bool)

(declare-fun res!597601 () Bool)

(assert (=> b!879569 (=> (not res!597601) (not e!489473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!879569 (= res!597601 (validMask!0 mask!1196))))

(declare-fun b!879570 () Bool)

(assert (=> b!879570 (= e!489478 (and e!489479 mapRes!27948))))

(declare-fun condMapEmpty!27948 () Bool)

(declare-fun mapDefault!27948 () ValueCell!8336)

(assert (=> b!879570 (= condMapEmpty!27948 (= (arr!24631 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8336)) mapDefault!27948)))))

(declare-fun b!879571 () Bool)

(declare-fun res!597600 () Bool)

(assert (=> b!879571 (=> (not res!597600) (not e!489473))))

(declare-datatypes ((List!17488 0))(
  ( (Nil!17485) (Cons!17484 (h!18615 (_ BitVec 64)) (t!24588 List!17488)) )
))
(declare-fun arrayNoDuplicates!0 (array!51211 (_ BitVec 32) List!17488) Bool)

(assert (=> b!879571 (= res!597600 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17485))))

(declare-fun b!879572 () Bool)

(declare-fun res!597597 () Bool)

(assert (=> b!879572 (=> (not res!597597) (not e!489473))))

(assert (=> b!879572 (= res!597597 (and (= (select (arr!24630 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!879573 () Bool)

(assert (=> b!879573 (= e!489474 (not e!489475))))

(declare-fun res!597596 () Bool)

(assert (=> b!879573 (=> res!597596 e!489475)))

(assert (=> b!879573 (= res!597596 (not (validKeyInArray!0 (select (arr!24630 _keys!868) from!1053))))))

(declare-fun lt!397554 () ListLongMap!10447)

(assert (=> b!879573 (= lt!397554 lt!397557)))

(declare-fun lt!397553 () ListLongMap!10447)

(assert (=> b!879573 (= lt!397557 (+!2535 lt!397553 (tuple2!11689 k0!854 v!557)))))

(assert (=> b!879573 (= lt!397554 (getCurrentListMapNoExtraKeys!3231 _keys!868 lt!397552 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!879573 (= lt!397553 (getCurrentListMapNoExtraKeys!3231 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29981 0))(
  ( (Unit!29982) )
))
(declare-fun lt!397556 () Unit!29981)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!702 (array!51211 array!51213 (_ BitVec 32) (_ BitVec 32) V!28449 V!28449 (_ BitVec 32) (_ BitVec 64) V!28449 (_ BitVec 32) Int) Unit!29981)

(assert (=> b!879573 (= lt!397556 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!702 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!27948 () Bool)

(declare-fun tp!53609 () Bool)

(assert (=> mapNonEmpty!27948 (= mapRes!27948 (and tp!53609 e!489477))))

(declare-fun mapKey!27948 () (_ BitVec 32))

(declare-fun mapRest!27948 () (Array (_ BitVec 32) ValueCell!8336))

(declare-fun mapValue!27948 () ValueCell!8336)

(assert (=> mapNonEmpty!27948 (= (arr!24631 _values!688) (store mapRest!27948 mapKey!27948 mapValue!27948))))

(assert (= (and start!74640 res!597594) b!879569))

(assert (= (and b!879569 res!597601) b!879568))

(assert (= (and b!879568 res!597598) b!879566))

(assert (= (and b!879566 res!597593) b!879571))

(assert (= (and b!879571 res!597600) b!879565))

(assert (= (and b!879565 res!597595) b!879561))

(assert (= (and b!879561 res!597599) b!879572))

(assert (= (and b!879572 res!597597) b!879562))

(assert (= (and b!879562 res!597592) b!879573))

(assert (= (and b!879573 (not res!597596)) b!879563))

(assert (= (and b!879570 condMapEmpty!27948) mapIsEmpty!27948))

(assert (= (and b!879570 (not condMapEmpty!27948)) mapNonEmpty!27948))

(get-info :version)

(assert (= (and mapNonEmpty!27948 ((_ is ValueCellFull!8336) mapValue!27948)) b!879567))

(assert (= (and b!879570 ((_ is ValueCellFull!8336) mapDefault!27948)) b!879564))

(assert (= start!74640 b!879570))

(declare-fun b_lambda!12397 () Bool)

(assert (=> (not b_lambda!12397) (not b!879563)))

(declare-fun t!24586 () Bool)

(declare-fun tb!4957 () Bool)

(assert (=> (and start!74640 (= defaultEntry!696 defaultEntry!696) t!24586) tb!4957))

(declare-fun result!9547 () Bool)

(assert (=> tb!4957 (= result!9547 tp_is_empty!17551)))

(assert (=> b!879563 t!24586))

(declare-fun b_and!25209 () Bool)

(assert (= b_and!25207 (and (=> t!24586 result!9547) b_and!25209)))

(declare-fun m!818801 () Bool)

(assert (=> b!879573 m!818801))

(declare-fun m!818803 () Bool)

(assert (=> b!879573 m!818803))

(declare-fun m!818805 () Bool)

(assert (=> b!879573 m!818805))

(assert (=> b!879573 m!818803))

(declare-fun m!818807 () Bool)

(assert (=> b!879573 m!818807))

(declare-fun m!818809 () Bool)

(assert (=> b!879573 m!818809))

(declare-fun m!818811 () Bool)

(assert (=> b!879573 m!818811))

(declare-fun m!818813 () Bool)

(assert (=> b!879562 m!818813))

(declare-fun m!818815 () Bool)

(assert (=> b!879562 m!818815))

(declare-fun m!818817 () Bool)

(assert (=> b!879562 m!818817))

(declare-fun m!818819 () Bool)

(assert (=> b!879563 m!818819))

(declare-fun m!818821 () Bool)

(assert (=> b!879563 m!818821))

(declare-fun m!818823 () Bool)

(assert (=> b!879563 m!818823))

(assert (=> b!879563 m!818819))

(declare-fun m!818825 () Bool)

(assert (=> b!879563 m!818825))

(assert (=> b!879563 m!818803))

(assert (=> b!879563 m!818821))

(declare-fun m!818827 () Bool)

(assert (=> b!879561 m!818827))

(declare-fun m!818829 () Bool)

(assert (=> start!74640 m!818829))

(declare-fun m!818831 () Bool)

(assert (=> start!74640 m!818831))

(declare-fun m!818833 () Bool)

(assert (=> b!879572 m!818833))

(declare-fun m!818835 () Bool)

(assert (=> b!879566 m!818835))

(declare-fun m!818837 () Bool)

(assert (=> b!879571 m!818837))

(declare-fun m!818839 () Bool)

(assert (=> mapNonEmpty!27948 m!818839))

(declare-fun m!818841 () Bool)

(assert (=> b!879569 m!818841))

(check-sat (not b!879562) (not mapNonEmpty!27948) b_and!25209 (not b!879563) (not b_lambda!12397) tp_is_empty!17551 (not b!879569) (not b_next!15307) (not b!879566) (not b!879561) (not start!74640) (not b!879571) (not b!879573))
(check-sat b_and!25209 (not b_next!15307))
