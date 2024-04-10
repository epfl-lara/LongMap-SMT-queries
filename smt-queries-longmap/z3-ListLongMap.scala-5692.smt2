; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73938 () Bool)

(assert start!73938)

(declare-fun b_free!14853 () Bool)

(declare-fun b_next!14853 () Bool)

(assert (=> start!73938 (= b_free!14853 (not b_next!14853))))

(declare-fun tp!52062 () Bool)

(declare-fun b_and!24605 () Bool)

(assert (=> start!73938 (= tp!52062 b_and!24605)))

(declare-fun b!869007 () Bool)

(declare-fun res!590536 () Bool)

(declare-fun e!483974 () Bool)

(assert (=> b!869007 (=> (not res!590536) (not e!483974))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!50126 0))(
  ( (array!50127 (arr!24094 (Array (_ BitVec 32) (_ BitVec 64))) (size!24534 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50126)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!869007 (= res!590536 (and (= (select (arr!24094 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!869008 () Bool)

(declare-fun res!590535 () Bool)

(assert (=> b!869008 (=> (not res!590535) (not e!483974))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869008 (= res!590535 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!27083 () Bool)

(declare-fun mapRes!27083 () Bool)

(declare-fun tp!52063 () Bool)

(declare-fun e!483977 () Bool)

(assert (=> mapNonEmpty!27083 (= mapRes!27083 (and tp!52063 e!483977))))

(declare-datatypes ((V!27699 0))(
  ( (V!27700 (val!8542 Int)) )
))
(declare-datatypes ((ValueCell!8055 0))(
  ( (ValueCellFull!8055 (v!10967 V!27699)) (EmptyCell!8055) )
))
(declare-fun mapRest!27083 () (Array (_ BitVec 32) ValueCell!8055))

(declare-fun mapKey!27083 () (_ BitVec 32))

(declare-datatypes ((array!50128 0))(
  ( (array!50129 (arr!24095 (Array (_ BitVec 32) ValueCell!8055)) (size!24535 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50128)

(declare-fun mapValue!27083 () ValueCell!8055)

(assert (=> mapNonEmpty!27083 (= (arr!24095 _values!688) (store mapRest!27083 mapKey!27083 mapValue!27083))))

(declare-fun b!869009 () Bool)

(declare-fun res!590537 () Bool)

(assert (=> b!869009 (=> (not res!590537) (not e!483974))))

(assert (=> b!869009 (= res!590537 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24534 _keys!868))))))

(declare-fun b!869010 () Bool)

(declare-fun res!590531 () Bool)

(assert (=> b!869010 (=> (not res!590531) (not e!483974))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869010 (= res!590531 (validMask!0 mask!1196))))

(declare-fun b!869011 () Bool)

(declare-fun res!590533 () Bool)

(assert (=> b!869011 (=> (not res!590533) (not e!483974))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50126 (_ BitVec 32)) Bool)

(assert (=> b!869011 (= res!590533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!27083 () Bool)

(assert (=> mapIsEmpty!27083 mapRes!27083))

(declare-fun res!590529 () Bool)

(assert (=> start!73938 (=> (not res!590529) (not e!483974))))

(assert (=> start!73938 (= res!590529 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24534 _keys!868))))))

(assert (=> start!73938 e!483974))

(declare-fun tp_is_empty!16989 () Bool)

(assert (=> start!73938 tp_is_empty!16989))

(assert (=> start!73938 true))

(assert (=> start!73938 tp!52062))

(declare-fun array_inv!19032 (array!50126) Bool)

(assert (=> start!73938 (array_inv!19032 _keys!868)))

(declare-fun e!483976 () Bool)

(declare-fun array_inv!19033 (array!50128) Bool)

(assert (=> start!73938 (and (array_inv!19033 _values!688) e!483976)))

(declare-fun b!869012 () Bool)

(declare-fun res!590530 () Bool)

(assert (=> b!869012 (=> (not res!590530) (not e!483974))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!869012 (= res!590530 (and (= (size!24535 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24534 _keys!868) (size!24535 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!869013 () Bool)

(declare-fun res!590534 () Bool)

(assert (=> b!869013 (=> (not res!590534) (not e!483974))))

(declare-datatypes ((List!17136 0))(
  ( (Nil!17133) (Cons!17132 (h!18263 (_ BitVec 64)) (t!24173 List!17136)) )
))
(declare-fun arrayNoDuplicates!0 (array!50126 (_ BitVec 32) List!17136) Bool)

(assert (=> b!869013 (= res!590534 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17133))))

(declare-fun b!869014 () Bool)

(declare-fun e!483979 () Bool)

(assert (=> b!869014 (= e!483976 (and e!483979 mapRes!27083))))

(declare-fun condMapEmpty!27083 () Bool)

(declare-fun mapDefault!27083 () ValueCell!8055)

(assert (=> b!869014 (= condMapEmpty!27083 (= (arr!24095 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8055)) mapDefault!27083)))))

(declare-fun b!869015 () Bool)

(assert (=> b!869015 (= e!483979 tp_is_empty!16989)))

(declare-fun b!869016 () Bool)

(declare-fun e!483978 () Bool)

(assert (=> b!869016 (= e!483974 e!483978)))

(declare-fun res!590532 () Bool)

(assert (=> b!869016 (=> (not res!590532) (not e!483978))))

(assert (=> b!869016 (= res!590532 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!394658 () array!50128)

(declare-datatypes ((tuple2!11342 0))(
  ( (tuple2!11343 (_1!5682 (_ BitVec 64)) (_2!5682 V!27699)) )
))
(declare-datatypes ((List!17137 0))(
  ( (Nil!17134) (Cons!17133 (h!18264 tuple2!11342) (t!24174 List!17137)) )
))
(declare-datatypes ((ListLongMap!10111 0))(
  ( (ListLongMap!10112 (toList!5071 List!17137)) )
))
(declare-fun lt!394660 () ListLongMap!10111)

(declare-fun minValue!654 () V!27699)

(declare-fun zeroValue!654 () V!27699)

(declare-fun getCurrentListMapNoExtraKeys!3040 (array!50126 array!50128 (_ BitVec 32) (_ BitVec 32) V!27699 V!27699 (_ BitVec 32) Int) ListLongMap!10111)

(assert (=> b!869016 (= lt!394660 (getCurrentListMapNoExtraKeys!3040 _keys!868 lt!394658 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27699)

(assert (=> b!869016 (= lt!394658 (array!50129 (store (arr!24095 _values!688) i!612 (ValueCellFull!8055 v!557)) (size!24535 _values!688)))))

(declare-fun lt!394657 () ListLongMap!10111)

(assert (=> b!869016 (= lt!394657 (getCurrentListMapNoExtraKeys!3040 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!869017 () Bool)

(assert (=> b!869017 (= e!483977 tp_is_empty!16989)))

(declare-fun b!869018 () Bool)

(assert (=> b!869018 (= e!483978 (not true))))

(declare-fun +!2412 (ListLongMap!10111 tuple2!11342) ListLongMap!10111)

(assert (=> b!869018 (= (getCurrentListMapNoExtraKeys!3040 _keys!868 lt!394658 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2412 (getCurrentListMapNoExtraKeys!3040 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11343 k0!854 v!557)))))

(declare-datatypes ((Unit!29822 0))(
  ( (Unit!29823) )
))
(declare-fun lt!394659 () Unit!29822)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!606 (array!50126 array!50128 (_ BitVec 32) (_ BitVec 32) V!27699 V!27699 (_ BitVec 32) (_ BitVec 64) V!27699 (_ BitVec 32) Int) Unit!29822)

(assert (=> b!869018 (= lt!394659 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!606 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73938 res!590529) b!869010))

(assert (= (and b!869010 res!590531) b!869012))

(assert (= (and b!869012 res!590530) b!869011))

(assert (= (and b!869011 res!590533) b!869013))

(assert (= (and b!869013 res!590534) b!869009))

(assert (= (and b!869009 res!590537) b!869008))

(assert (= (and b!869008 res!590535) b!869007))

(assert (= (and b!869007 res!590536) b!869016))

(assert (= (and b!869016 res!590532) b!869018))

(assert (= (and b!869014 condMapEmpty!27083) mapIsEmpty!27083))

(assert (= (and b!869014 (not condMapEmpty!27083)) mapNonEmpty!27083))

(get-info :version)

(assert (= (and mapNonEmpty!27083 ((_ is ValueCellFull!8055) mapValue!27083)) b!869017))

(assert (= (and b!869014 ((_ is ValueCellFull!8055) mapDefault!27083)) b!869015))

(assert (= start!73938 b!869014))

(declare-fun m!810617 () Bool)

(assert (=> b!869010 m!810617))

(declare-fun m!810619 () Bool)

(assert (=> b!869018 m!810619))

(declare-fun m!810621 () Bool)

(assert (=> b!869018 m!810621))

(assert (=> b!869018 m!810621))

(declare-fun m!810623 () Bool)

(assert (=> b!869018 m!810623))

(declare-fun m!810625 () Bool)

(assert (=> b!869018 m!810625))

(declare-fun m!810627 () Bool)

(assert (=> start!73938 m!810627))

(declare-fun m!810629 () Bool)

(assert (=> start!73938 m!810629))

(declare-fun m!810631 () Bool)

(assert (=> b!869008 m!810631))

(declare-fun m!810633 () Bool)

(assert (=> b!869007 m!810633))

(declare-fun m!810635 () Bool)

(assert (=> b!869011 m!810635))

(declare-fun m!810637 () Bool)

(assert (=> b!869016 m!810637))

(declare-fun m!810639 () Bool)

(assert (=> b!869016 m!810639))

(declare-fun m!810641 () Bool)

(assert (=> b!869016 m!810641))

(declare-fun m!810643 () Bool)

(assert (=> mapNonEmpty!27083 m!810643))

(declare-fun m!810645 () Bool)

(assert (=> b!869013 m!810645))

(check-sat (not b!869011) (not b!869016) (not b!869008) (not start!73938) tp_is_empty!16989 (not b!869010) (not mapNonEmpty!27083) (not b_next!14853) (not b!869018) (not b!869013) b_and!24605)
(check-sat b_and!24605 (not b_next!14853))
