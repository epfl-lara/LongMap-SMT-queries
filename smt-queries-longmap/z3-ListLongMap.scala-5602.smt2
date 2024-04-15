; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73378 () Bool)

(assert start!73378)

(declare-fun b_free!14311 () Bool)

(declare-fun b_next!14311 () Bool)

(assert (=> start!73378 (= b_free!14311 (not b_next!14311))))

(declare-fun tp!50437 () Bool)

(declare-fun b_and!23641 () Bool)

(assert (=> start!73378 (= tp!50437 b_and!23641)))

(declare-fun b!856483 () Bool)

(declare-fun res!581799 () Bool)

(declare-fun e!477394 () Bool)

(assert (=> b!856483 (=> (not res!581799) (not e!477394))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!49069 0))(
  ( (array!49070 (arr!23566 (Array (_ BitVec 32) (_ BitVec 64))) (size!24008 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49069)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!856483 (= res!581799 (and (= (select (arr!23566 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!856484 () Bool)

(declare-fun e!477395 () Bool)

(declare-fun e!477393 () Bool)

(declare-fun mapRes!26270 () Bool)

(assert (=> b!856484 (= e!477395 (and e!477393 mapRes!26270))))

(declare-fun condMapEmpty!26270 () Bool)

(declare-datatypes ((V!26977 0))(
  ( (V!26978 (val!8271 Int)) )
))
(declare-datatypes ((ValueCell!7784 0))(
  ( (ValueCellFull!7784 (v!10690 V!26977)) (EmptyCell!7784) )
))
(declare-datatypes ((array!49071 0))(
  ( (array!49072 (arr!23567 (Array (_ BitVec 32) ValueCell!7784)) (size!24009 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49071)

(declare-fun mapDefault!26270 () ValueCell!7784)

(assert (=> b!856484 (= condMapEmpty!26270 (= (arr!23567 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7784)) mapDefault!26270)))))

(declare-fun b!856485 () Bool)

(declare-fun res!581798 () Bool)

(assert (=> b!856485 (=> (not res!581798) (not e!477394))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856485 (= res!581798 (validMask!0 mask!1196))))

(declare-fun b!856486 () Bool)

(declare-fun res!581804 () Bool)

(assert (=> b!856486 (=> (not res!581804) (not e!477394))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49069 (_ BitVec 32)) Bool)

(assert (=> b!856486 (= res!581804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856487 () Bool)

(declare-fun res!581797 () Bool)

(assert (=> b!856487 (=> (not res!581797) (not e!477394))))

(assert (=> b!856487 (= res!581797 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24008 _keys!868))))))

(declare-fun mapIsEmpty!26270 () Bool)

(assert (=> mapIsEmpty!26270 mapRes!26270))

(declare-fun res!581803 () Bool)

(assert (=> start!73378 (=> (not res!581803) (not e!477394))))

(assert (=> start!73378 (= res!581803 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24008 _keys!868))))))

(assert (=> start!73378 e!477394))

(declare-fun tp_is_empty!16447 () Bool)

(assert (=> start!73378 tp_is_empty!16447))

(assert (=> start!73378 true))

(assert (=> start!73378 tp!50437))

(declare-fun array_inv!18730 (array!49069) Bool)

(assert (=> start!73378 (array_inv!18730 _keys!868)))

(declare-fun array_inv!18731 (array!49071) Bool)

(assert (=> start!73378 (and (array_inv!18731 _values!688) e!477395)))

(declare-fun b!856488 () Bool)

(declare-fun e!477391 () Bool)

(assert (=> b!856488 (= e!477391 tp_is_empty!16447)))

(declare-fun mapNonEmpty!26270 () Bool)

(declare-fun tp!50438 () Bool)

(assert (=> mapNonEmpty!26270 (= mapRes!26270 (and tp!50438 e!477391))))

(declare-fun mapRest!26270 () (Array (_ BitVec 32) ValueCell!7784))

(declare-fun mapValue!26270 () ValueCell!7784)

(declare-fun mapKey!26270 () (_ BitVec 32))

(assert (=> mapNonEmpty!26270 (= (arr!23567 _values!688) (store mapRest!26270 mapKey!26270 mapValue!26270))))

(declare-fun b!856489 () Bool)

(assert (=> b!856489 (= e!477393 tp_is_empty!16447)))

(declare-fun b!856490 () Bool)

(declare-fun e!477396 () Bool)

(assert (=> b!856490 (= e!477396 (not true))))

(declare-fun v!557 () V!26977)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!385816 () array!49071)

(declare-fun minValue!654 () V!26977)

(declare-fun zeroValue!654 () V!26977)

(declare-datatypes ((tuple2!10914 0))(
  ( (tuple2!10915 (_1!5468 (_ BitVec 64)) (_2!5468 V!26977)) )
))
(declare-datatypes ((List!16718 0))(
  ( (Nil!16715) (Cons!16714 (h!17845 tuple2!10914) (t!23350 List!16718)) )
))
(declare-datatypes ((ListLongMap!9673 0))(
  ( (ListLongMap!9674 (toList!4852 List!16718)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2859 (array!49069 array!49071 (_ BitVec 32) (_ BitVec 32) V!26977 V!26977 (_ BitVec 32) Int) ListLongMap!9673)

(declare-fun +!2230 (ListLongMap!9673 tuple2!10914) ListLongMap!9673)

(assert (=> b!856490 (= (getCurrentListMapNoExtraKeys!2859 _keys!868 lt!385816 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2230 (getCurrentListMapNoExtraKeys!2859 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10915 k0!854 v!557)))))

(declare-datatypes ((Unit!29129 0))(
  ( (Unit!29130) )
))
(declare-fun lt!385815 () Unit!29129)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!427 (array!49069 array!49071 (_ BitVec 32) (_ BitVec 32) V!26977 V!26977 (_ BitVec 32) (_ BitVec 64) V!26977 (_ BitVec 32) Int) Unit!29129)

(assert (=> b!856490 (= lt!385815 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!427 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!856491 () Bool)

(declare-fun res!581800 () Bool)

(assert (=> b!856491 (=> (not res!581800) (not e!477394))))

(assert (=> b!856491 (= res!581800 (and (= (size!24009 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24008 _keys!868) (size!24009 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856492 () Bool)

(declare-fun res!581801 () Bool)

(assert (=> b!856492 (=> (not res!581801) (not e!477394))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856492 (= res!581801 (validKeyInArray!0 k0!854))))

(declare-fun b!856493 () Bool)

(declare-fun res!581805 () Bool)

(assert (=> b!856493 (=> (not res!581805) (not e!477394))))

(declare-datatypes ((List!16719 0))(
  ( (Nil!16716) (Cons!16715 (h!17846 (_ BitVec 64)) (t!23351 List!16719)) )
))
(declare-fun arrayNoDuplicates!0 (array!49069 (_ BitVec 32) List!16719) Bool)

(assert (=> b!856493 (= res!581805 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16716))))

(declare-fun b!856494 () Bool)

(assert (=> b!856494 (= e!477394 e!477396)))

(declare-fun res!581802 () Bool)

(assert (=> b!856494 (=> (not res!581802) (not e!477396))))

(assert (=> b!856494 (= res!581802 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!385814 () ListLongMap!9673)

(assert (=> b!856494 (= lt!385814 (getCurrentListMapNoExtraKeys!2859 _keys!868 lt!385816 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!856494 (= lt!385816 (array!49072 (store (arr!23567 _values!688) i!612 (ValueCellFull!7784 v!557)) (size!24009 _values!688)))))

(declare-fun lt!385817 () ListLongMap!9673)

(assert (=> b!856494 (= lt!385817 (getCurrentListMapNoExtraKeys!2859 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!73378 res!581803) b!856485))

(assert (= (and b!856485 res!581798) b!856491))

(assert (= (and b!856491 res!581800) b!856486))

(assert (= (and b!856486 res!581804) b!856493))

(assert (= (and b!856493 res!581805) b!856487))

(assert (= (and b!856487 res!581797) b!856492))

(assert (= (and b!856492 res!581801) b!856483))

(assert (= (and b!856483 res!581799) b!856494))

(assert (= (and b!856494 res!581802) b!856490))

(assert (= (and b!856484 condMapEmpty!26270) mapIsEmpty!26270))

(assert (= (and b!856484 (not condMapEmpty!26270)) mapNonEmpty!26270))

(get-info :version)

(assert (= (and mapNonEmpty!26270 ((_ is ValueCellFull!7784) mapValue!26270)) b!856488))

(assert (= (and b!856484 ((_ is ValueCellFull!7784) mapDefault!26270)) b!856489))

(assert (= start!73378 b!856484))

(declare-fun m!796863 () Bool)

(assert (=> b!856493 m!796863))

(declare-fun m!796865 () Bool)

(assert (=> start!73378 m!796865))

(declare-fun m!796867 () Bool)

(assert (=> start!73378 m!796867))

(declare-fun m!796869 () Bool)

(assert (=> b!856492 m!796869))

(declare-fun m!796871 () Bool)

(assert (=> b!856483 m!796871))

(declare-fun m!796873 () Bool)

(assert (=> mapNonEmpty!26270 m!796873))

(declare-fun m!796875 () Bool)

(assert (=> b!856486 m!796875))

(declare-fun m!796877 () Bool)

(assert (=> b!856490 m!796877))

(declare-fun m!796879 () Bool)

(assert (=> b!856490 m!796879))

(assert (=> b!856490 m!796879))

(declare-fun m!796881 () Bool)

(assert (=> b!856490 m!796881))

(declare-fun m!796883 () Bool)

(assert (=> b!856490 m!796883))

(declare-fun m!796885 () Bool)

(assert (=> b!856494 m!796885))

(declare-fun m!796887 () Bool)

(assert (=> b!856494 m!796887))

(declare-fun m!796889 () Bool)

(assert (=> b!856494 m!796889))

(declare-fun m!796891 () Bool)

(assert (=> b!856485 m!796891))

(check-sat (not b!856494) (not b!856492) (not b!856493) (not mapNonEmpty!26270) (not b!856490) (not b!856486) (not b_next!14311) b_and!23641 tp_is_empty!16447 (not start!73378) (not b!856485))
(check-sat b_and!23641 (not b_next!14311))
