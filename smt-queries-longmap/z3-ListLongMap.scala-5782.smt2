; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74762 () Bool)

(assert start!74762)

(declare-fun b_free!15283 () Bool)

(declare-fun b_next!15283 () Bool)

(assert (=> start!74762 (= b_free!15283 (not b_next!15283))))

(declare-fun tp!53531 () Bool)

(declare-fun b_and!25169 () Bool)

(assert (=> start!74762 (= tp!53531 b_and!25169)))

(declare-fun b!879957 () Bool)

(declare-fun e!489787 () Bool)

(declare-fun tp_is_empty!17527 () Bool)

(assert (=> b!879957 (= e!489787 tp_is_empty!17527)))

(declare-fun res!597586 () Bool)

(declare-fun e!489788 () Bool)

(assert (=> start!74762 (=> (not res!597586) (not e!489788))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51215 0))(
  ( (array!51216 (arr!24629 (Array (_ BitVec 32) (_ BitVec 64))) (size!25070 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51215)

(assert (=> start!74762 (= res!597586 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25070 _keys!868))))))

(assert (=> start!74762 e!489788))

(assert (=> start!74762 tp_is_empty!17527))

(assert (=> start!74762 true))

(assert (=> start!74762 tp!53531))

(declare-fun array_inv!19444 (array!51215) Bool)

(assert (=> start!74762 (array_inv!19444 _keys!868)))

(declare-datatypes ((V!28417 0))(
  ( (V!28418 (val!8811 Int)) )
))
(declare-datatypes ((ValueCell!8324 0))(
  ( (ValueCellFull!8324 (v!11251 V!28417)) (EmptyCell!8324) )
))
(declare-datatypes ((array!51217 0))(
  ( (array!51218 (arr!24630 (Array (_ BitVec 32) ValueCell!8324)) (size!25071 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51217)

(declare-fun e!489793 () Bool)

(declare-fun array_inv!19445 (array!51217) Bool)

(assert (=> start!74762 (and (array_inv!19445 _values!688) e!489793)))

(declare-fun b!879958 () Bool)

(declare-fun e!489790 () Bool)

(declare-fun mapRes!27906 () Bool)

(assert (=> b!879958 (= e!489793 (and e!489790 mapRes!27906))))

(declare-fun condMapEmpty!27906 () Bool)

(declare-fun mapDefault!27906 () ValueCell!8324)

(assert (=> b!879958 (= condMapEmpty!27906 (= (arr!24630 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8324)) mapDefault!27906)))))

(declare-fun mapIsEmpty!27906 () Bool)

(assert (=> mapIsEmpty!27906 mapRes!27906))

(declare-fun b!879959 () Bool)

(declare-fun res!597592 () Bool)

(assert (=> b!879959 (=> (not res!597592) (not e!489788))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51215 (_ BitVec 32)) Bool)

(assert (=> b!879959 (= res!597592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!879960 () Bool)

(declare-fun e!489789 () Bool)

(assert (=> b!879960 (= e!489789 (bvslt from!1053 (size!25071 _values!688)))))

(declare-fun b!879961 () Bool)

(declare-fun e!489792 () Bool)

(assert (=> b!879961 (= e!489792 (not e!489789))))

(declare-fun res!597590 () Bool)

(assert (=> b!879961 (=> res!597590 e!489789)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!879961 (= res!597590 (not (validKeyInArray!0 (select (arr!24629 _keys!868) from!1053))))))

(declare-fun v!557 () V!28417)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!397778 () array!51217)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!28417)

(declare-fun zeroValue!654 () V!28417)

(declare-datatypes ((tuple2!11588 0))(
  ( (tuple2!11589 (_1!5805 (_ BitVec 64)) (_2!5805 V!28417)) )
))
(declare-datatypes ((List!17422 0))(
  ( (Nil!17419) (Cons!17418 (h!18555 tuple2!11588) (t!24503 List!17422)) )
))
(declare-datatypes ((ListLongMap!10359 0))(
  ( (ListLongMap!10360 (toList!5195 List!17422)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3237 (array!51215 array!51217 (_ BitVec 32) (_ BitVec 32) V!28417 V!28417 (_ BitVec 32) Int) ListLongMap!10359)

(declare-fun +!2513 (ListLongMap!10359 tuple2!11588) ListLongMap!10359)

(assert (=> b!879961 (= (getCurrentListMapNoExtraKeys!3237 _keys!868 lt!397778 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2513 (getCurrentListMapNoExtraKeys!3237 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11589 k0!854 v!557)))))

(declare-datatypes ((Unit!29998 0))(
  ( (Unit!29999) )
))
(declare-fun lt!397779 () Unit!29998)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!681 (array!51215 array!51217 (_ BitVec 32) (_ BitVec 32) V!28417 V!28417 (_ BitVec 32) (_ BitVec 64) V!28417 (_ BitVec 32) Int) Unit!29998)

(assert (=> b!879961 (= lt!397779 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!681 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!879962 () Bool)

(declare-fun res!597589 () Bool)

(assert (=> b!879962 (=> (not res!597589) (not e!489788))))

(declare-datatypes ((List!17423 0))(
  ( (Nil!17420) (Cons!17419 (h!18556 (_ BitVec 64)) (t!24504 List!17423)) )
))
(declare-fun arrayNoDuplicates!0 (array!51215 (_ BitVec 32) List!17423) Bool)

(assert (=> b!879962 (= res!597589 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17420))))

(declare-fun b!879963 () Bool)

(declare-fun res!597593 () Bool)

(assert (=> b!879963 (=> (not res!597593) (not e!489788))))

(assert (=> b!879963 (= res!597593 (validKeyInArray!0 k0!854))))

(declare-fun b!879964 () Bool)

(declare-fun res!597591 () Bool)

(assert (=> b!879964 (=> (not res!597591) (not e!489788))))

(assert (=> b!879964 (= res!597591 (and (= (size!25071 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25070 _keys!868) (size!25071 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27906 () Bool)

(declare-fun tp!53532 () Bool)

(assert (=> mapNonEmpty!27906 (= mapRes!27906 (and tp!53532 e!489787))))

(declare-fun mapValue!27906 () ValueCell!8324)

(declare-fun mapKey!27906 () (_ BitVec 32))

(declare-fun mapRest!27906 () (Array (_ BitVec 32) ValueCell!8324))

(assert (=> mapNonEmpty!27906 (= (arr!24630 _values!688) (store mapRest!27906 mapKey!27906 mapValue!27906))))

(declare-fun b!879965 () Bool)

(assert (=> b!879965 (= e!489788 e!489792)))

(declare-fun res!597595 () Bool)

(assert (=> b!879965 (=> (not res!597595) (not e!489792))))

(assert (=> b!879965 (= res!597595 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!397777 () ListLongMap!10359)

(assert (=> b!879965 (= lt!397777 (getCurrentListMapNoExtraKeys!3237 _keys!868 lt!397778 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!879965 (= lt!397778 (array!51218 (store (arr!24630 _values!688) i!612 (ValueCellFull!8324 v!557)) (size!25071 _values!688)))))

(declare-fun lt!397780 () ListLongMap!10359)

(assert (=> b!879965 (= lt!397780 (getCurrentListMapNoExtraKeys!3237 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!879966 () Bool)

(assert (=> b!879966 (= e!489790 tp_is_empty!17527)))

(declare-fun b!879967 () Bool)

(declare-fun res!597594 () Bool)

(assert (=> b!879967 (=> (not res!597594) (not e!489788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!879967 (= res!597594 (validMask!0 mask!1196))))

(declare-fun b!879968 () Bool)

(declare-fun res!597587 () Bool)

(assert (=> b!879968 (=> (not res!597587) (not e!489788))))

(assert (=> b!879968 (= res!597587 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25070 _keys!868))))))

(declare-fun b!879969 () Bool)

(declare-fun res!597588 () Bool)

(assert (=> b!879969 (=> (not res!597588) (not e!489788))))

(assert (=> b!879969 (= res!597588 (and (= (select (arr!24629 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!74762 res!597586) b!879967))

(assert (= (and b!879967 res!597594) b!879964))

(assert (= (and b!879964 res!597591) b!879959))

(assert (= (and b!879959 res!597592) b!879962))

(assert (= (and b!879962 res!597589) b!879968))

(assert (= (and b!879968 res!597587) b!879963))

(assert (= (and b!879963 res!597593) b!879969))

(assert (= (and b!879969 res!597588) b!879965))

(assert (= (and b!879965 res!597595) b!879961))

(assert (= (and b!879961 (not res!597590)) b!879960))

(assert (= (and b!879958 condMapEmpty!27906) mapIsEmpty!27906))

(assert (= (and b!879958 (not condMapEmpty!27906)) mapNonEmpty!27906))

(get-info :version)

(assert (= (and mapNonEmpty!27906 ((_ is ValueCellFull!8324) mapValue!27906)) b!879957))

(assert (= (and b!879958 ((_ is ValueCellFull!8324) mapDefault!27906)) b!879966))

(assert (= start!74762 b!879958))

(declare-fun m!820077 () Bool)

(assert (=> b!879965 m!820077))

(declare-fun m!820079 () Bool)

(assert (=> b!879965 m!820079))

(declare-fun m!820081 () Bool)

(assert (=> b!879965 m!820081))

(declare-fun m!820083 () Bool)

(assert (=> b!879959 m!820083))

(declare-fun m!820085 () Bool)

(assert (=> b!879962 m!820085))

(declare-fun m!820087 () Bool)

(assert (=> start!74762 m!820087))

(declare-fun m!820089 () Bool)

(assert (=> start!74762 m!820089))

(declare-fun m!820091 () Bool)

(assert (=> b!879967 m!820091))

(declare-fun m!820093 () Bool)

(assert (=> b!879969 m!820093))

(declare-fun m!820095 () Bool)

(assert (=> b!879963 m!820095))

(declare-fun m!820097 () Bool)

(assert (=> b!879961 m!820097))

(declare-fun m!820099 () Bool)

(assert (=> b!879961 m!820099))

(assert (=> b!879961 m!820097))

(declare-fun m!820101 () Bool)

(assert (=> b!879961 m!820101))

(declare-fun m!820103 () Bool)

(assert (=> b!879961 m!820103))

(assert (=> b!879961 m!820101))

(declare-fun m!820105 () Bool)

(assert (=> b!879961 m!820105))

(declare-fun m!820107 () Bool)

(assert (=> b!879961 m!820107))

(declare-fun m!820109 () Bool)

(assert (=> mapNonEmpty!27906 m!820109))

(check-sat b_and!25169 (not b!879967) (not b!879965) (not b!879962) (not mapNonEmpty!27906) (not b!879963) (not b!879961) (not start!74762) tp_is_empty!17527 (not b_next!15283) (not b!879959))
(check-sat b_and!25169 (not b_next!15283))
