; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73812 () Bool)

(assert start!73812)

(declare-fun b_free!14727 () Bool)

(declare-fun b_next!14727 () Bool)

(assert (=> start!73812 (= b_free!14727 (not b_next!14727))))

(declare-fun tp!51684 () Bool)

(declare-fun b_and!24433 () Bool)

(assert (=> start!73812 (= tp!51684 b_and!24433)))

(declare-fun b!866426 () Bool)

(declare-fun res!588694 () Bool)

(declare-fun e!482646 () Bool)

(assert (=> b!866426 (=> (not res!588694) (not e!482646))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49886 0))(
  ( (array!49887 (arr!23974 (Array (_ BitVec 32) (_ BitVec 64))) (size!24414 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49886)

(assert (=> b!866426 (= res!588694 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24414 _keys!868))))))

(declare-fun b!866427 () Bool)

(declare-fun res!588700 () Bool)

(assert (=> b!866427 (=> (not res!588700) (not e!482646))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27531 0))(
  ( (V!27532 (val!8479 Int)) )
))
(declare-datatypes ((ValueCell!7992 0))(
  ( (ValueCellFull!7992 (v!10904 V!27531)) (EmptyCell!7992) )
))
(declare-datatypes ((array!49888 0))(
  ( (array!49889 (arr!23975 (Array (_ BitVec 32) ValueCell!7992)) (size!24415 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49888)

(assert (=> b!866427 (= res!588700 (and (= (size!24415 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24414 _keys!868) (size!24415 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!866428 () Bool)

(declare-fun res!588701 () Bool)

(assert (=> b!866428 (=> (not res!588701) (not e!482646))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!866428 (= res!588701 (validKeyInArray!0 k0!854))))

(declare-fun b!866429 () Bool)

(declare-fun res!588696 () Bool)

(assert (=> b!866429 (=> (not res!588696) (not e!482646))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49886 (_ BitVec 32)) Bool)

(assert (=> b!866429 (= res!588696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!866430 () Bool)

(declare-fun e!482645 () Bool)

(declare-fun tp_is_empty!16863 () Bool)

(assert (=> b!866430 (= e!482645 tp_is_empty!16863)))

(declare-fun b!866431 () Bool)

(declare-fun e!482640 () Bool)

(assert (=> b!866431 (= e!482640 true)))

(declare-datatypes ((tuple2!11242 0))(
  ( (tuple2!11243 (_1!5632 (_ BitVec 64)) (_2!5632 V!27531)) )
))
(declare-fun lt!393112 () tuple2!11242)

(declare-fun lt!393111 () tuple2!11242)

(declare-datatypes ((List!17043 0))(
  ( (Nil!17040) (Cons!17039 (h!18170 tuple2!11242) (t!24036 List!17043)) )
))
(declare-datatypes ((ListLongMap!10011 0))(
  ( (ListLongMap!10012 (toList!5021 List!17043)) )
))
(declare-fun lt!393103 () ListLongMap!10011)

(declare-fun lt!393107 () ListLongMap!10011)

(declare-fun +!2368 (ListLongMap!10011 tuple2!11242) ListLongMap!10011)

(assert (=> b!866431 (= lt!393103 (+!2368 (+!2368 lt!393107 lt!393111) lt!393112))))

(declare-fun v!557 () V!27531)

(declare-fun lt!393097 () V!27531)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((Unit!29697 0))(
  ( (Unit!29698) )
))
(declare-fun lt!393102 () Unit!29697)

(declare-fun addCommutativeForDiffKeys!536 (ListLongMap!10011 (_ BitVec 64) V!27531 (_ BitVec 64) V!27531) Unit!29697)

(assert (=> b!866431 (= lt!393102 (addCommutativeForDiffKeys!536 lt!393107 k0!854 v!557 (select (arr!23974 _keys!868) from!1053) lt!393097))))

(declare-fun b!866432 () Bool)

(declare-fun res!588695 () Bool)

(assert (=> b!866432 (=> (not res!588695) (not e!482646))))

(assert (=> b!866432 (= res!588695 (and (= (select (arr!23974 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!866433 () Bool)

(declare-fun e!482643 () Bool)

(assert (=> b!866433 (= e!482646 e!482643)))

(declare-fun res!588697 () Bool)

(assert (=> b!866433 (=> (not res!588697) (not e!482643))))

(assert (=> b!866433 (= res!588697 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!393109 () array!49888)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!393106 () ListLongMap!10011)

(declare-fun minValue!654 () V!27531)

(declare-fun zeroValue!654 () V!27531)

(declare-fun getCurrentListMapNoExtraKeys!2992 (array!49886 array!49888 (_ BitVec 32) (_ BitVec 32) V!27531 V!27531 (_ BitVec 32) Int) ListLongMap!10011)

(assert (=> b!866433 (= lt!393106 (getCurrentListMapNoExtraKeys!2992 _keys!868 lt!393109 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!866433 (= lt!393109 (array!49889 (store (arr!23975 _values!688) i!612 (ValueCellFull!7992 v!557)) (size!24415 _values!688)))))

(declare-fun lt!393105 () ListLongMap!10011)

(assert (=> b!866433 (= lt!393105 (getCurrentListMapNoExtraKeys!2992 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!588698 () Bool)

(assert (=> start!73812 (=> (not res!588698) (not e!482646))))

(assert (=> start!73812 (= res!588698 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24414 _keys!868))))))

(assert (=> start!73812 e!482646))

(assert (=> start!73812 tp_is_empty!16863))

(assert (=> start!73812 true))

(assert (=> start!73812 tp!51684))

(declare-fun array_inv!18944 (array!49886) Bool)

(assert (=> start!73812 (array_inv!18944 _keys!868)))

(declare-fun e!482641 () Bool)

(declare-fun array_inv!18945 (array!49888) Bool)

(assert (=> start!73812 (and (array_inv!18945 _values!688) e!482641)))

(declare-fun b!866425 () Bool)

(declare-fun e!482647 () Bool)

(assert (=> b!866425 (= e!482647 tp_is_empty!16863)))

(declare-fun mapNonEmpty!26894 () Bool)

(declare-fun mapRes!26894 () Bool)

(declare-fun tp!51685 () Bool)

(assert (=> mapNonEmpty!26894 (= mapRes!26894 (and tp!51685 e!482647))))

(declare-fun mapKey!26894 () (_ BitVec 32))

(declare-fun mapValue!26894 () ValueCell!7992)

(declare-fun mapRest!26894 () (Array (_ BitVec 32) ValueCell!7992))

(assert (=> mapNonEmpty!26894 (= (arr!23975 _values!688) (store mapRest!26894 mapKey!26894 mapValue!26894))))

(declare-fun b!866434 () Bool)

(declare-fun res!588702 () Bool)

(assert (=> b!866434 (=> (not res!588702) (not e!482646))))

(declare-datatypes ((List!17044 0))(
  ( (Nil!17041) (Cons!17040 (h!18171 (_ BitVec 64)) (t!24037 List!17044)) )
))
(declare-fun arrayNoDuplicates!0 (array!49886 (_ BitVec 32) List!17044) Bool)

(assert (=> b!866434 (= res!588702 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17041))))

(declare-fun b!866435 () Bool)

(declare-fun e!482644 () Unit!29697)

(declare-fun Unit!29699 () Unit!29697)

(assert (=> b!866435 (= e!482644 Unit!29699)))

(declare-fun b!866436 () Bool)

(declare-fun res!588699 () Bool)

(assert (=> b!866436 (=> (not res!588699) (not e!482646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!866436 (= res!588699 (validMask!0 mask!1196))))

(declare-fun b!866437 () Bool)

(declare-fun e!482642 () Bool)

(assert (=> b!866437 (= e!482643 (not e!482642))))

(declare-fun res!588703 () Bool)

(assert (=> b!866437 (=> res!588703 e!482642)))

(assert (=> b!866437 (= res!588703 (not (validKeyInArray!0 (select (arr!23974 _keys!868) from!1053))))))

(declare-fun lt!393100 () ListLongMap!10011)

(declare-fun lt!393108 () ListLongMap!10011)

(assert (=> b!866437 (= lt!393100 lt!393108)))

(assert (=> b!866437 (= lt!393108 (+!2368 lt!393107 lt!393112))))

(assert (=> b!866437 (= lt!393100 (getCurrentListMapNoExtraKeys!2992 _keys!868 lt!393109 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!866437 (= lt!393112 (tuple2!11243 k0!854 v!557))))

(assert (=> b!866437 (= lt!393107 (getCurrentListMapNoExtraKeys!2992 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!393099 () Unit!29697)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!567 (array!49886 array!49888 (_ BitVec 32) (_ BitVec 32) V!27531 V!27531 (_ BitVec 32) (_ BitVec 64) V!27531 (_ BitVec 32) Int) Unit!29697)

(assert (=> b!866437 (= lt!393099 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!567 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!26894 () Bool)

(assert (=> mapIsEmpty!26894 mapRes!26894))

(declare-fun b!866438 () Bool)

(assert (=> b!866438 (= e!482642 e!482640)))

(declare-fun res!588704 () Bool)

(assert (=> b!866438 (=> res!588704 e!482640)))

(assert (=> b!866438 (= res!588704 (= k0!854 (select (arr!23974 _keys!868) from!1053)))))

(assert (=> b!866438 (not (= (select (arr!23974 _keys!868) from!1053) k0!854))))

(declare-fun lt!393098 () Unit!29697)

(assert (=> b!866438 (= lt!393098 e!482644)))

(declare-fun c!92311 () Bool)

(assert (=> b!866438 (= c!92311 (= (select (arr!23974 _keys!868) from!1053) k0!854))))

(assert (=> b!866438 (= lt!393106 lt!393103)))

(assert (=> b!866438 (= lt!393103 (+!2368 lt!393108 lt!393111))))

(assert (=> b!866438 (= lt!393111 (tuple2!11243 (select (arr!23974 _keys!868) from!1053) lt!393097))))

(declare-fun get!12674 (ValueCell!7992 V!27531) V!27531)

(declare-fun dynLambda!1188 (Int (_ BitVec 64)) V!27531)

(assert (=> b!866438 (= lt!393097 (get!12674 (select (arr!23975 _values!688) from!1053) (dynLambda!1188 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!866439 () Bool)

(assert (=> b!866439 (= e!482641 (and e!482645 mapRes!26894))))

(declare-fun condMapEmpty!26894 () Bool)

(declare-fun mapDefault!26894 () ValueCell!7992)

(assert (=> b!866439 (= condMapEmpty!26894 (= (arr!23975 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7992)) mapDefault!26894)))))

(declare-fun b!866440 () Bool)

(declare-fun Unit!29700 () Unit!29697)

(assert (=> b!866440 (= e!482644 Unit!29700)))

(declare-fun lt!393101 () Unit!29697)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49886 (_ BitVec 32) (_ BitVec 32)) Unit!29697)

(assert (=> b!866440 (= lt!393101 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!866440 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17041)))

(declare-fun lt!393110 () Unit!29697)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49886 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29697)

(assert (=> b!866440 (= lt!393110 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49886 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!866440 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!393104 () Unit!29697)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49886 (_ BitVec 64) (_ BitVec 32) List!17044) Unit!29697)

(assert (=> b!866440 (= lt!393104 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17041))))

(assert (=> b!866440 false))

(assert (= (and start!73812 res!588698) b!866436))

(assert (= (and b!866436 res!588699) b!866427))

(assert (= (and b!866427 res!588700) b!866429))

(assert (= (and b!866429 res!588696) b!866434))

(assert (= (and b!866434 res!588702) b!866426))

(assert (= (and b!866426 res!588694) b!866428))

(assert (= (and b!866428 res!588701) b!866432))

(assert (= (and b!866432 res!588695) b!866433))

(assert (= (and b!866433 res!588697) b!866437))

(assert (= (and b!866437 (not res!588703)) b!866438))

(assert (= (and b!866438 c!92311) b!866440))

(assert (= (and b!866438 (not c!92311)) b!866435))

(assert (= (and b!866438 (not res!588704)) b!866431))

(assert (= (and b!866439 condMapEmpty!26894) mapIsEmpty!26894))

(assert (= (and b!866439 (not condMapEmpty!26894)) mapNonEmpty!26894))

(get-info :version)

(assert (= (and mapNonEmpty!26894 ((_ is ValueCellFull!7992) mapValue!26894)) b!866425))

(assert (= (and b!866439 ((_ is ValueCellFull!7992) mapDefault!26894)) b!866430))

(assert (= start!73812 b!866439))

(declare-fun b_lambda!12079 () Bool)

(assert (=> (not b_lambda!12079) (not b!866438)))

(declare-fun t!24035 () Bool)

(declare-fun tb!4849 () Bool)

(assert (=> (and start!73812 (= defaultEntry!696 defaultEntry!696) t!24035) tb!4849))

(declare-fun result!9309 () Bool)

(assert (=> tb!4849 (= result!9309 tp_is_empty!16863)))

(assert (=> b!866438 t!24035))

(declare-fun b_and!24435 () Bool)

(assert (= b_and!24433 (and (=> t!24035 result!9309) b_and!24435)))

(declare-fun m!808083 () Bool)

(assert (=> b!866429 m!808083))

(declare-fun m!808085 () Bool)

(assert (=> start!73812 m!808085))

(declare-fun m!808087 () Bool)

(assert (=> start!73812 m!808087))

(declare-fun m!808089 () Bool)

(assert (=> b!866433 m!808089))

(declare-fun m!808091 () Bool)

(assert (=> b!866433 m!808091))

(declare-fun m!808093 () Bool)

(assert (=> b!866433 m!808093))

(declare-fun m!808095 () Bool)

(assert (=> b!866434 m!808095))

(declare-fun m!808097 () Bool)

(assert (=> b!866432 m!808097))

(declare-fun m!808099 () Bool)

(assert (=> mapNonEmpty!26894 m!808099))

(declare-fun m!808101 () Bool)

(assert (=> b!866440 m!808101))

(declare-fun m!808103 () Bool)

(assert (=> b!866440 m!808103))

(declare-fun m!808105 () Bool)

(assert (=> b!866440 m!808105))

(declare-fun m!808107 () Bool)

(assert (=> b!866440 m!808107))

(declare-fun m!808109 () Bool)

(assert (=> b!866440 m!808109))

(declare-fun m!808111 () Bool)

(assert (=> b!866428 m!808111))

(declare-fun m!808113 () Bool)

(assert (=> b!866437 m!808113))

(declare-fun m!808115 () Bool)

(assert (=> b!866437 m!808115))

(declare-fun m!808117 () Bool)

(assert (=> b!866437 m!808117))

(assert (=> b!866437 m!808115))

(declare-fun m!808119 () Bool)

(assert (=> b!866437 m!808119))

(declare-fun m!808121 () Bool)

(assert (=> b!866437 m!808121))

(declare-fun m!808123 () Bool)

(assert (=> b!866437 m!808123))

(declare-fun m!808125 () Bool)

(assert (=> b!866436 m!808125))

(declare-fun m!808127 () Bool)

(assert (=> b!866431 m!808127))

(assert (=> b!866431 m!808127))

(declare-fun m!808129 () Bool)

(assert (=> b!866431 m!808129))

(assert (=> b!866431 m!808115))

(assert (=> b!866431 m!808115))

(declare-fun m!808131 () Bool)

(assert (=> b!866431 m!808131))

(declare-fun m!808133 () Bool)

(assert (=> b!866438 m!808133))

(declare-fun m!808135 () Bool)

(assert (=> b!866438 m!808135))

(declare-fun m!808137 () Bool)

(assert (=> b!866438 m!808137))

(declare-fun m!808139 () Bool)

(assert (=> b!866438 m!808139))

(assert (=> b!866438 m!808135))

(assert (=> b!866438 m!808115))

(assert (=> b!866438 m!808137))

(check-sat tp_is_empty!16863 (not b!866429) (not b!866436) (not b!866437) (not b!866433) (not b!866431) (not mapNonEmpty!26894) (not b!866434) (not b_next!14727) (not b!866438) b_and!24435 (not start!73812) (not b_lambda!12079) (not b!866428) (not b!866440))
(check-sat b_and!24435 (not b_next!14727))
