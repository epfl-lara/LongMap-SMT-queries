; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74756 () Bool)

(assert start!74756)

(declare-fun b_free!15277 () Bool)

(declare-fun b_next!15277 () Bool)

(assert (=> start!74756 (= b_free!15277 (not b_next!15277))))

(declare-fun tp!53513 () Bool)

(declare-fun b_and!25163 () Bool)

(assert (=> start!74756 (= tp!53513 b_and!25163)))

(declare-fun res!597504 () Bool)

(declare-fun e!489724 () Bool)

(assert (=> start!74756 (=> (not res!597504) (not e!489724))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51203 0))(
  ( (array!51204 (arr!24623 (Array (_ BitVec 32) (_ BitVec 64))) (size!25064 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51203)

(assert (=> start!74756 (= res!597504 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25064 _keys!868))))))

(assert (=> start!74756 e!489724))

(declare-fun tp_is_empty!17521 () Bool)

(assert (=> start!74756 tp_is_empty!17521))

(assert (=> start!74756 true))

(assert (=> start!74756 tp!53513))

(declare-fun array_inv!19438 (array!51203) Bool)

(assert (=> start!74756 (array_inv!19438 _keys!868)))

(declare-datatypes ((V!28409 0))(
  ( (V!28410 (val!8808 Int)) )
))
(declare-datatypes ((ValueCell!8321 0))(
  ( (ValueCellFull!8321 (v!11248 V!28409)) (EmptyCell!8321) )
))
(declare-datatypes ((array!51205 0))(
  ( (array!51206 (arr!24624 (Array (_ BitVec 32) ValueCell!8321)) (size!25065 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51205)

(declare-fun e!489729 () Bool)

(declare-fun array_inv!19439 (array!51205) Bool)

(assert (=> start!74756 (and (array_inv!19439 _values!688) e!489729)))

(declare-fun b!879840 () Bool)

(declare-fun e!489725 () Bool)

(declare-fun mapRes!27897 () Bool)

(assert (=> b!879840 (= e!489729 (and e!489725 mapRes!27897))))

(declare-fun condMapEmpty!27897 () Bool)

(declare-fun mapDefault!27897 () ValueCell!8321)

(assert (=> b!879840 (= condMapEmpty!27897 (= (arr!24624 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8321)) mapDefault!27897)))))

(declare-fun b!879841 () Bool)

(assert (=> b!879841 (= e!489725 tp_is_empty!17521)))

(declare-fun b!879842 () Bool)

(declare-fun e!489730 () Bool)

(assert (=> b!879842 (= e!489730 (bvslt from!1053 (size!25064 _keys!868)))))

(declare-fun b!879843 () Bool)

(declare-fun res!597505 () Bool)

(assert (=> b!879843 (=> (not res!597505) (not e!489724))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!879843 (= res!597505 (validMask!0 mask!1196))))

(declare-fun b!879844 () Bool)

(declare-fun e!489727 () Bool)

(assert (=> b!879844 (= e!489727 (not e!489730))))

(declare-fun res!597503 () Bool)

(assert (=> b!879844 (=> res!597503 e!489730)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!879844 (= res!597503 (not (validKeyInArray!0 (select (arr!24623 _keys!868) from!1053))))))

(declare-fun v!557 () V!28409)

(declare-fun lt!397742 () array!51205)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!28409)

(declare-fun zeroValue!654 () V!28409)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11582 0))(
  ( (tuple2!11583 (_1!5802 (_ BitVec 64)) (_2!5802 V!28409)) )
))
(declare-datatypes ((List!17417 0))(
  ( (Nil!17414) (Cons!17413 (h!18550 tuple2!11582) (t!24498 List!17417)) )
))
(declare-datatypes ((ListLongMap!10353 0))(
  ( (ListLongMap!10354 (toList!5192 List!17417)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3234 (array!51203 array!51205 (_ BitVec 32) (_ BitVec 32) V!28409 V!28409 (_ BitVec 32) Int) ListLongMap!10353)

(declare-fun +!2510 (ListLongMap!10353 tuple2!11582) ListLongMap!10353)

(assert (=> b!879844 (= (getCurrentListMapNoExtraKeys!3234 _keys!868 lt!397742 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2510 (getCurrentListMapNoExtraKeys!3234 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11583 k0!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29992 0))(
  ( (Unit!29993) )
))
(declare-fun lt!397741 () Unit!29992)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!678 (array!51203 array!51205 (_ BitVec 32) (_ BitVec 32) V!28409 V!28409 (_ BitVec 32) (_ BitVec 64) V!28409 (_ BitVec 32) Int) Unit!29992)

(assert (=> b!879844 (= lt!397741 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!678 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!879845 () Bool)

(declare-fun res!597501 () Bool)

(assert (=> b!879845 (=> (not res!597501) (not e!489724))))

(assert (=> b!879845 (= res!597501 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25064 _keys!868))))))

(declare-fun b!879846 () Bool)

(declare-fun res!597500 () Bool)

(assert (=> b!879846 (=> (not res!597500) (not e!489724))))

(assert (=> b!879846 (= res!597500 (validKeyInArray!0 k0!854))))

(declare-fun b!879847 () Bool)

(declare-fun e!489726 () Bool)

(assert (=> b!879847 (= e!489726 tp_is_empty!17521)))

(declare-fun b!879848 () Bool)

(declare-fun res!597497 () Bool)

(assert (=> b!879848 (=> (not res!597497) (not e!489724))))

(declare-datatypes ((List!17418 0))(
  ( (Nil!17415) (Cons!17414 (h!18551 (_ BitVec 64)) (t!24499 List!17418)) )
))
(declare-fun arrayNoDuplicates!0 (array!51203 (_ BitVec 32) List!17418) Bool)

(assert (=> b!879848 (= res!597497 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17415))))

(declare-fun b!879849 () Bool)

(declare-fun res!597496 () Bool)

(assert (=> b!879849 (=> (not res!597496) (not e!489724))))

(assert (=> b!879849 (= res!597496 (and (= (select (arr!24623 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!879850 () Bool)

(declare-fun res!597498 () Bool)

(assert (=> b!879850 (=> (not res!597498) (not e!489724))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51203 (_ BitVec 32)) Bool)

(assert (=> b!879850 (= res!597498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!879851 () Bool)

(declare-fun res!597499 () Bool)

(assert (=> b!879851 (=> (not res!597499) (not e!489724))))

(assert (=> b!879851 (= res!597499 (and (= (size!25065 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25064 _keys!868) (size!25065 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27897 () Bool)

(declare-fun tp!53514 () Bool)

(assert (=> mapNonEmpty!27897 (= mapRes!27897 (and tp!53514 e!489726))))

(declare-fun mapRest!27897 () (Array (_ BitVec 32) ValueCell!8321))

(declare-fun mapValue!27897 () ValueCell!8321)

(declare-fun mapKey!27897 () (_ BitVec 32))

(assert (=> mapNonEmpty!27897 (= (arr!24624 _values!688) (store mapRest!27897 mapKey!27897 mapValue!27897))))

(declare-fun b!879852 () Bool)

(assert (=> b!879852 (= e!489724 e!489727)))

(declare-fun res!597502 () Bool)

(assert (=> b!879852 (=> (not res!597502) (not e!489727))))

(assert (=> b!879852 (= res!597502 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!397744 () ListLongMap!10353)

(assert (=> b!879852 (= lt!397744 (getCurrentListMapNoExtraKeys!3234 _keys!868 lt!397742 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!879852 (= lt!397742 (array!51206 (store (arr!24624 _values!688) i!612 (ValueCellFull!8321 v!557)) (size!25065 _values!688)))))

(declare-fun lt!397743 () ListLongMap!10353)

(assert (=> b!879852 (= lt!397743 (getCurrentListMapNoExtraKeys!3234 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!27897 () Bool)

(assert (=> mapIsEmpty!27897 mapRes!27897))

(assert (= (and start!74756 res!597504) b!879843))

(assert (= (and b!879843 res!597505) b!879851))

(assert (= (and b!879851 res!597499) b!879850))

(assert (= (and b!879850 res!597498) b!879848))

(assert (= (and b!879848 res!597497) b!879845))

(assert (= (and b!879845 res!597501) b!879846))

(assert (= (and b!879846 res!597500) b!879849))

(assert (= (and b!879849 res!597496) b!879852))

(assert (= (and b!879852 res!597502) b!879844))

(assert (= (and b!879844 (not res!597503)) b!879842))

(assert (= (and b!879840 condMapEmpty!27897) mapIsEmpty!27897))

(assert (= (and b!879840 (not condMapEmpty!27897)) mapNonEmpty!27897))

(get-info :version)

(assert (= (and mapNonEmpty!27897 ((_ is ValueCellFull!8321) mapValue!27897)) b!879847))

(assert (= (and b!879840 ((_ is ValueCellFull!8321) mapDefault!27897)) b!879841))

(assert (= start!74756 b!879840))

(declare-fun m!819975 () Bool)

(assert (=> b!879850 m!819975))

(declare-fun m!819977 () Bool)

(assert (=> b!879844 m!819977))

(declare-fun m!819979 () Bool)

(assert (=> b!879844 m!819979))

(assert (=> b!879844 m!819977))

(declare-fun m!819981 () Bool)

(assert (=> b!879844 m!819981))

(declare-fun m!819983 () Bool)

(assert (=> b!879844 m!819983))

(assert (=> b!879844 m!819981))

(declare-fun m!819985 () Bool)

(assert (=> b!879844 m!819985))

(declare-fun m!819987 () Bool)

(assert (=> b!879844 m!819987))

(declare-fun m!819989 () Bool)

(assert (=> b!879852 m!819989))

(declare-fun m!819991 () Bool)

(assert (=> b!879852 m!819991))

(declare-fun m!819993 () Bool)

(assert (=> b!879852 m!819993))

(declare-fun m!819995 () Bool)

(assert (=> b!879848 m!819995))

(declare-fun m!819997 () Bool)

(assert (=> mapNonEmpty!27897 m!819997))

(declare-fun m!819999 () Bool)

(assert (=> b!879846 m!819999))

(declare-fun m!820001 () Bool)

(assert (=> b!879843 m!820001))

(declare-fun m!820003 () Bool)

(assert (=> start!74756 m!820003))

(declare-fun m!820005 () Bool)

(assert (=> start!74756 m!820005))

(declare-fun m!820007 () Bool)

(assert (=> b!879849 m!820007))

(check-sat (not b!879846) (not mapNonEmpty!27897) (not b!879844) (not start!74756) tp_is_empty!17521 (not b!879843) (not b!879850) (not b_next!15277) b_and!25163 (not b!879852) (not b!879848))
(check-sat b_and!25163 (not b_next!15277))
