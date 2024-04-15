; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74796 () Bool)

(assert start!74796)

(declare-fun b_free!15391 () Bool)

(declare-fun b_next!15391 () Bool)

(assert (=> start!74796 (= b_free!15391 (not b_next!15391))))

(declare-fun tp!53871 () Bool)

(declare-fun b_and!25423 () Bool)

(assert (=> start!74796 (= tp!53871 b_and!25423)))

(declare-fun b!881801 () Bool)

(declare-fun e!490727 () Bool)

(declare-fun e!490728 () Bool)

(declare-fun mapRes!28083 () Bool)

(assert (=> b!881801 (= e!490727 (and e!490728 mapRes!28083))))

(declare-fun condMapEmpty!28083 () Bool)

(declare-datatypes ((V!28561 0))(
  ( (V!28562 (val!8865 Int)) )
))
(declare-datatypes ((ValueCell!8378 0))(
  ( (ValueCellFull!8378 (v!11319 V!28561)) (EmptyCell!8378) )
))
(declare-datatypes ((array!51381 0))(
  ( (array!51382 (arr!24712 (Array (_ BitVec 32) ValueCell!8378)) (size!25154 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51381)

(declare-fun mapDefault!28083 () ValueCell!8378)

(assert (=> b!881801 (= condMapEmpty!28083 (= (arr!24712 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8378)) mapDefault!28083)))))

(declare-fun b!881802 () Bool)

(declare-fun e!490730 () Bool)

(declare-fun e!490726 () Bool)

(assert (=> b!881802 (= e!490730 e!490726)))

(declare-fun res!599133 () Bool)

(assert (=> b!881802 (=> (not res!599133) (not e!490726))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!881802 (= res!599133 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11760 0))(
  ( (tuple2!11761 (_1!5891 (_ BitVec 64)) (_2!5891 V!28561)) )
))
(declare-datatypes ((List!17555 0))(
  ( (Nil!17552) (Cons!17551 (h!18682 tuple2!11760) (t!24739 List!17555)) )
))
(declare-datatypes ((ListLongMap!10519 0))(
  ( (ListLongMap!10520 (toList!5275 List!17555)) )
))
(declare-fun lt!398786 () ListLongMap!10519)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!51383 0))(
  ( (array!51384 (arr!24713 (Array (_ BitVec 32) (_ BitVec 64))) (size!25155 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51383)

(declare-fun lt!398793 () array!51381)

(declare-fun minValue!654 () V!28561)

(declare-fun zeroValue!654 () V!28561)

(declare-fun getCurrentListMapNoExtraKeys!3266 (array!51383 array!51381 (_ BitVec 32) (_ BitVec 32) V!28561 V!28561 (_ BitVec 32) Int) ListLongMap!10519)

(assert (=> b!881802 (= lt!398786 (getCurrentListMapNoExtraKeys!3266 _keys!868 lt!398793 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28561)

(assert (=> b!881802 (= lt!398793 (array!51382 (store (arr!24712 _values!688) i!612 (ValueCellFull!8378 v!557)) (size!25154 _values!688)))))

(declare-fun lt!398791 () ListLongMap!10519)

(assert (=> b!881802 (= lt!398791 (getCurrentListMapNoExtraKeys!3266 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!881803 () Bool)

(declare-fun tp_is_empty!17635 () Bool)

(assert (=> b!881803 (= e!490728 tp_is_empty!17635)))

(declare-fun res!599132 () Bool)

(assert (=> start!74796 (=> (not res!599132) (not e!490730))))

(assert (=> start!74796 (= res!599132 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25155 _keys!868))))))

(assert (=> start!74796 e!490730))

(assert (=> start!74796 tp_is_empty!17635))

(assert (=> start!74796 true))

(assert (=> start!74796 tp!53871))

(declare-fun array_inv!19510 (array!51383) Bool)

(assert (=> start!74796 (array_inv!19510 _keys!868)))

(declare-fun array_inv!19511 (array!51381) Bool)

(assert (=> start!74796 (and (array_inv!19511 _values!688) e!490727)))

(declare-fun b!881804 () Bool)

(declare-fun res!599124 () Bool)

(assert (=> b!881804 (=> (not res!599124) (not e!490730))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!881804 (= res!599124 (validKeyInArray!0 k0!854))))

(declare-fun b!881805 () Bool)

(declare-fun res!599134 () Bool)

(assert (=> b!881805 (=> (not res!599134) (not e!490730))))

(assert (=> b!881805 (= res!599134 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25155 _keys!868))))))

(declare-fun mapIsEmpty!28083 () Bool)

(assert (=> mapIsEmpty!28083 mapRes!28083))

(declare-fun b!881806 () Bool)

(declare-fun res!599128 () Bool)

(assert (=> b!881806 (=> (not res!599128) (not e!490730))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51383 (_ BitVec 32)) Bool)

(assert (=> b!881806 (= res!599128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!881807 () Bool)

(declare-fun e!490733 () Bool)

(assert (=> b!881807 (= e!490726 (not e!490733))))

(declare-fun res!599125 () Bool)

(assert (=> b!881807 (=> res!599125 e!490733)))

(assert (=> b!881807 (= res!599125 (not (validKeyInArray!0 (select (arr!24713 _keys!868) from!1053))))))

(declare-fun lt!398787 () ListLongMap!10519)

(declare-fun lt!398790 () ListLongMap!10519)

(assert (=> b!881807 (= lt!398787 lt!398790)))

(declare-fun lt!398789 () ListLongMap!10519)

(declare-fun +!2568 (ListLongMap!10519 tuple2!11760) ListLongMap!10519)

(assert (=> b!881807 (= lt!398790 (+!2568 lt!398789 (tuple2!11761 k0!854 v!557)))))

(assert (=> b!881807 (= lt!398787 (getCurrentListMapNoExtraKeys!3266 _keys!868 lt!398793 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!881807 (= lt!398789 (getCurrentListMapNoExtraKeys!3266 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30047 0))(
  ( (Unit!30048) )
))
(declare-fun lt!398788 () Unit!30047)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!733 (array!51383 array!51381 (_ BitVec 32) (_ BitVec 32) V!28561 V!28561 (_ BitVec 32) (_ BitVec 64) V!28561 (_ BitVec 32) Int) Unit!30047)

(assert (=> b!881807 (= lt!398788 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!733 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!881808 () Bool)

(declare-fun res!599129 () Bool)

(assert (=> b!881808 (=> (not res!599129) (not e!490730))))

(assert (=> b!881808 (= res!599129 (and (= (select (arr!24713 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!881809 () Bool)

(declare-fun res!599126 () Bool)

(assert (=> b!881809 (=> (not res!599126) (not e!490730))))

(declare-datatypes ((List!17556 0))(
  ( (Nil!17553) (Cons!17552 (h!18683 (_ BitVec 64)) (t!24740 List!17556)) )
))
(declare-fun arrayNoDuplicates!0 (array!51383 (_ BitVec 32) List!17556) Bool)

(assert (=> b!881809 (= res!599126 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17553))))

(declare-fun b!881810 () Bool)

(declare-fun e!490732 () Bool)

(assert (=> b!881810 (= e!490733 e!490732)))

(declare-fun res!599131 () Bool)

(assert (=> b!881810 (=> res!599131 e!490732)))

(assert (=> b!881810 (= res!599131 (not (= (select (arr!24713 _keys!868) from!1053) k0!854)))))

(declare-fun get!13018 (ValueCell!8378 V!28561) V!28561)

(declare-fun dynLambda!1256 (Int (_ BitVec 64)) V!28561)

(assert (=> b!881810 (= lt!398786 (+!2568 lt!398790 (tuple2!11761 (select (arr!24713 _keys!868) from!1053) (get!13018 (select (arr!24712 _values!688) from!1053) (dynLambda!1256 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!881811 () Bool)

(declare-fun res!599130 () Bool)

(assert (=> b!881811 (=> (not res!599130) (not e!490730))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!881811 (= res!599130 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!28083 () Bool)

(declare-fun tp!53870 () Bool)

(declare-fun e!490729 () Bool)

(assert (=> mapNonEmpty!28083 (= mapRes!28083 (and tp!53870 e!490729))))

(declare-fun mapKey!28083 () (_ BitVec 32))

(declare-fun mapValue!28083 () ValueCell!8378)

(declare-fun mapRest!28083 () (Array (_ BitVec 32) ValueCell!8378))

(assert (=> mapNonEmpty!28083 (= (arr!24712 _values!688) (store mapRest!28083 mapKey!28083 mapValue!28083))))

(declare-fun b!881812 () Bool)

(declare-fun res!599127 () Bool)

(assert (=> b!881812 (=> (not res!599127) (not e!490730))))

(assert (=> b!881812 (= res!599127 (and (= (size!25154 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25155 _keys!868) (size!25154 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!881813 () Bool)

(assert (=> b!881813 (= e!490732 (or (bvsge (size!25155 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25155 _keys!868)) (bvslt from!1053 (size!25155 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!51383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!881813 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!398785 () Unit!30047)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51383 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30047)

(assert (=> b!881813 (= lt!398785 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!881813 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17553)))

(declare-fun lt!398792 () Unit!30047)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51383 (_ BitVec 32) (_ BitVec 32)) Unit!30047)

(assert (=> b!881813 (= lt!398792 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!881814 () Bool)

(assert (=> b!881814 (= e!490729 tp_is_empty!17635)))

(assert (= (and start!74796 res!599132) b!881811))

(assert (= (and b!881811 res!599130) b!881812))

(assert (= (and b!881812 res!599127) b!881806))

(assert (= (and b!881806 res!599128) b!881809))

(assert (= (and b!881809 res!599126) b!881805))

(assert (= (and b!881805 res!599134) b!881804))

(assert (= (and b!881804 res!599124) b!881808))

(assert (= (and b!881808 res!599129) b!881802))

(assert (= (and b!881802 res!599133) b!881807))

(assert (= (and b!881807 (not res!599125)) b!881810))

(assert (= (and b!881810 (not res!599131)) b!881813))

(assert (= (and b!881801 condMapEmpty!28083) mapIsEmpty!28083))

(assert (= (and b!881801 (not condMapEmpty!28083)) mapNonEmpty!28083))

(get-info :version)

(assert (= (and mapNonEmpty!28083 ((_ is ValueCellFull!8378) mapValue!28083)) b!881814))

(assert (= (and b!881801 ((_ is ValueCellFull!8378) mapDefault!28083)) b!881803))

(assert (= start!74796 b!881801))

(declare-fun b_lambda!12583 () Bool)

(assert (=> (not b_lambda!12583) (not b!881810)))

(declare-fun t!24738 () Bool)

(declare-fun tb!5041 () Bool)

(assert (=> (and start!74796 (= defaultEntry!696 defaultEntry!696) t!24738) tb!5041))

(declare-fun result!9721 () Bool)

(assert (=> tb!5041 (= result!9721 tp_is_empty!17635)))

(assert (=> b!881810 t!24738))

(declare-fun b_and!25425 () Bool)

(assert (= b_and!25423 (and (=> t!24738 result!9721) b_and!25425)))

(declare-fun m!821207 () Bool)

(assert (=> b!881804 m!821207))

(declare-fun m!821209 () Bool)

(assert (=> start!74796 m!821209))

(declare-fun m!821211 () Bool)

(assert (=> start!74796 m!821211))

(declare-fun m!821213 () Bool)

(assert (=> b!881808 m!821213))

(declare-fun m!821215 () Bool)

(assert (=> b!881807 m!821215))

(declare-fun m!821217 () Bool)

(assert (=> b!881807 m!821217))

(declare-fun m!821219 () Bool)

(assert (=> b!881807 m!821219))

(assert (=> b!881807 m!821217))

(declare-fun m!821221 () Bool)

(assert (=> b!881807 m!821221))

(declare-fun m!821223 () Bool)

(assert (=> b!881807 m!821223))

(declare-fun m!821225 () Bool)

(assert (=> b!881807 m!821225))

(declare-fun m!821227 () Bool)

(assert (=> b!881810 m!821227))

(declare-fun m!821229 () Bool)

(assert (=> b!881810 m!821229))

(declare-fun m!821231 () Bool)

(assert (=> b!881810 m!821231))

(declare-fun m!821233 () Bool)

(assert (=> b!881810 m!821233))

(assert (=> b!881810 m!821229))

(assert (=> b!881810 m!821217))

(assert (=> b!881810 m!821231))

(declare-fun m!821235 () Bool)

(assert (=> b!881802 m!821235))

(declare-fun m!821237 () Bool)

(assert (=> b!881802 m!821237))

(declare-fun m!821239 () Bool)

(assert (=> b!881802 m!821239))

(declare-fun m!821241 () Bool)

(assert (=> b!881806 m!821241))

(declare-fun m!821243 () Bool)

(assert (=> b!881813 m!821243))

(declare-fun m!821245 () Bool)

(assert (=> b!881813 m!821245))

(declare-fun m!821247 () Bool)

(assert (=> b!881813 m!821247))

(declare-fun m!821249 () Bool)

(assert (=> b!881813 m!821249))

(declare-fun m!821251 () Bool)

(assert (=> b!881809 m!821251))

(declare-fun m!821253 () Bool)

(assert (=> b!881811 m!821253))

(declare-fun m!821255 () Bool)

(assert (=> mapNonEmpty!28083 m!821255))

(check-sat (not b!881811) (not b!881802) (not b_lambda!12583) (not b!881809) (not b!881807) tp_is_empty!17635 (not b!881804) (not start!74796) (not b!881813) b_and!25425 (not b!881806) (not b!881810) (not b_next!15391) (not mapNonEmpty!28083))
(check-sat b_and!25425 (not b_next!15391))
