; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73870 () Bool)

(assert start!73870)

(declare-fun b_free!14803 () Bool)

(declare-fun b_next!14803 () Bool)

(assert (=> start!73870 (= b_free!14803 (not b_next!14803))))

(declare-fun tp!51914 () Bool)

(declare-fun b_and!24529 () Bool)

(assert (=> start!73870 (= tp!51914 b_and!24529)))

(declare-fun b!867868 () Bool)

(declare-fun res!589749 () Bool)

(declare-fun e!483377 () Bool)

(assert (=> b!867868 (=> (not res!589749) (not e!483377))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!50027 0))(
  ( (array!50028 (arr!24045 (Array (_ BitVec 32) (_ BitVec 64))) (size!24487 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50027)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!867868 (= res!589749 (and (= (select (arr!24045 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27008 () Bool)

(declare-fun mapRes!27008 () Bool)

(assert (=> mapIsEmpty!27008 mapRes!27008))

(declare-fun b!867869 () Bool)

(declare-fun res!589748 () Bool)

(assert (=> b!867869 (=> (not res!589748) (not e!483377))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50027 (_ BitVec 32)) Bool)

(assert (=> b!867869 (= res!589748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!867870 () Bool)

(declare-fun e!483379 () Bool)

(declare-fun e!483381 () Bool)

(assert (=> b!867870 (= e!483379 (and e!483381 mapRes!27008))))

(declare-fun condMapEmpty!27008 () Bool)

(declare-datatypes ((V!27633 0))(
  ( (V!27634 (val!8517 Int)) )
))
(declare-datatypes ((ValueCell!8030 0))(
  ( (ValueCellFull!8030 (v!10936 V!27633)) (EmptyCell!8030) )
))
(declare-datatypes ((array!50029 0))(
  ( (array!50030 (arr!24046 (Array (_ BitVec 32) ValueCell!8030)) (size!24488 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50029)

(declare-fun mapDefault!27008 () ValueCell!8030)

(assert (=> b!867870 (= condMapEmpty!27008 (= (arr!24046 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8030)) mapDefault!27008)))))

(declare-fun res!589751 () Bool)

(assert (=> start!73870 (=> (not res!589751) (not e!483377))))

(assert (=> start!73870 (= res!589751 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24487 _keys!868))))))

(assert (=> start!73870 e!483377))

(declare-fun tp_is_empty!16939 () Bool)

(assert (=> start!73870 tp_is_empty!16939))

(assert (=> start!73870 true))

(assert (=> start!73870 tp!51914))

(declare-fun array_inv!19072 (array!50027) Bool)

(assert (=> start!73870 (array_inv!19072 _keys!868)))

(declare-fun array_inv!19073 (array!50029) Bool)

(assert (=> start!73870 (and (array_inv!19073 _values!688) e!483379)))

(declare-fun b!867871 () Bool)

(declare-fun res!589746 () Bool)

(assert (=> b!867871 (=> (not res!589746) (not e!483377))))

(declare-datatypes ((List!17114 0))(
  ( (Nil!17111) (Cons!17110 (h!18241 (_ BitVec 64)) (t!24142 List!17114)) )
))
(declare-fun arrayNoDuplicates!0 (array!50027 (_ BitVec 32) List!17114) Bool)

(assert (=> b!867871 (= res!589746 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17111))))

(declare-fun b!867872 () Bool)

(declare-fun res!589747 () Bool)

(assert (=> b!867872 (=> (not res!589747) (not e!483377))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867872 (= res!589747 (validKeyInArray!0 k0!854))))

(declare-fun b!867873 () Bool)

(declare-fun e!483376 () Bool)

(assert (=> b!867873 (= e!483376 tp_is_empty!16939)))

(declare-fun b!867874 () Bool)

(assert (=> b!867874 (= e!483381 tp_is_empty!16939)))

(declare-fun mapNonEmpty!27008 () Bool)

(declare-fun tp!51913 () Bool)

(assert (=> mapNonEmpty!27008 (= mapRes!27008 (and tp!51913 e!483376))))

(declare-fun mapRest!27008 () (Array (_ BitVec 32) ValueCell!8030))

(declare-fun mapValue!27008 () ValueCell!8030)

(declare-fun mapKey!27008 () (_ BitVec 32))

(assert (=> mapNonEmpty!27008 (= (arr!24046 _values!688) (store mapRest!27008 mapKey!27008 mapValue!27008))))

(declare-fun b!867875 () Bool)

(declare-fun res!589750 () Bool)

(assert (=> b!867875 (=> (not res!589750) (not e!483377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!867875 (= res!589750 (validMask!0 mask!1196))))

(declare-fun b!867876 () Bool)

(declare-fun e!483380 () Bool)

(assert (=> b!867876 (= e!483380 (not true))))

(declare-fun lt!394123 () array!50029)

(declare-fun v!557 () V!27633)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27633)

(declare-fun zeroValue!654 () V!27633)

(declare-datatypes ((tuple2!11328 0))(
  ( (tuple2!11329 (_1!5675 (_ BitVec 64)) (_2!5675 V!27633)) )
))
(declare-datatypes ((List!17115 0))(
  ( (Nil!17112) (Cons!17111 (h!18242 tuple2!11328) (t!24143 List!17115)) )
))
(declare-datatypes ((ListLongMap!10087 0))(
  ( (ListLongMap!10088 (toList!5059 List!17115)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3052 (array!50027 array!50029 (_ BitVec 32) (_ BitVec 32) V!27633 V!27633 (_ BitVec 32) Int) ListLongMap!10087)

(declare-fun +!2423 (ListLongMap!10087 tuple2!11328) ListLongMap!10087)

(assert (=> b!867876 (= (getCurrentListMapNoExtraKeys!3052 _keys!868 lt!394123 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2423 (getCurrentListMapNoExtraKeys!3052 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11329 k0!854 v!557)))))

(declare-datatypes ((Unit!29733 0))(
  ( (Unit!29734) )
))
(declare-fun lt!394124 () Unit!29733)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!591 (array!50027 array!50029 (_ BitVec 32) (_ BitVec 32) V!27633 V!27633 (_ BitVec 32) (_ BitVec 64) V!27633 (_ BitVec 32) Int) Unit!29733)

(assert (=> b!867876 (= lt!394124 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!591 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!867877 () Bool)

(declare-fun res!589745 () Bool)

(assert (=> b!867877 (=> (not res!589745) (not e!483377))))

(assert (=> b!867877 (= res!589745 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24487 _keys!868))))))

(declare-fun b!867878 () Bool)

(assert (=> b!867878 (= e!483377 e!483380)))

(declare-fun res!589752 () Bool)

(assert (=> b!867878 (=> (not res!589752) (not e!483380))))

(assert (=> b!867878 (= res!589752 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394121 () ListLongMap!10087)

(assert (=> b!867878 (= lt!394121 (getCurrentListMapNoExtraKeys!3052 _keys!868 lt!394123 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!867878 (= lt!394123 (array!50030 (store (arr!24046 _values!688) i!612 (ValueCellFull!8030 v!557)) (size!24488 _values!688)))))

(declare-fun lt!394122 () ListLongMap!10087)

(assert (=> b!867878 (= lt!394122 (getCurrentListMapNoExtraKeys!3052 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!867879 () Bool)

(declare-fun res!589744 () Bool)

(assert (=> b!867879 (=> (not res!589744) (not e!483377))))

(assert (=> b!867879 (= res!589744 (and (= (size!24488 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24487 _keys!868) (size!24488 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73870 res!589751) b!867875))

(assert (= (and b!867875 res!589750) b!867879))

(assert (= (and b!867879 res!589744) b!867869))

(assert (= (and b!867869 res!589748) b!867871))

(assert (= (and b!867871 res!589746) b!867877))

(assert (= (and b!867877 res!589745) b!867872))

(assert (= (and b!867872 res!589747) b!867868))

(assert (= (and b!867868 res!589749) b!867878))

(assert (= (and b!867878 res!589752) b!867876))

(assert (= (and b!867870 condMapEmpty!27008) mapIsEmpty!27008))

(assert (= (and b!867870 (not condMapEmpty!27008)) mapNonEmpty!27008))

(get-info :version)

(assert (= (and mapNonEmpty!27008 ((_ is ValueCellFull!8030) mapValue!27008)) b!867873))

(assert (= (and b!867870 ((_ is ValueCellFull!8030) mapDefault!27008)) b!867874))

(assert (= start!73870 b!867870))

(declare-fun m!809109 () Bool)

(assert (=> b!867875 m!809109))

(declare-fun m!809111 () Bool)

(assert (=> b!867872 m!809111))

(declare-fun m!809113 () Bool)

(assert (=> b!867878 m!809113))

(declare-fun m!809115 () Bool)

(assert (=> b!867878 m!809115))

(declare-fun m!809117 () Bool)

(assert (=> b!867878 m!809117))

(declare-fun m!809119 () Bool)

(assert (=> b!867871 m!809119))

(declare-fun m!809121 () Bool)

(assert (=> b!867869 m!809121))

(declare-fun m!809123 () Bool)

(assert (=> b!867868 m!809123))

(declare-fun m!809125 () Bool)

(assert (=> b!867876 m!809125))

(declare-fun m!809127 () Bool)

(assert (=> b!867876 m!809127))

(assert (=> b!867876 m!809127))

(declare-fun m!809129 () Bool)

(assert (=> b!867876 m!809129))

(declare-fun m!809131 () Bool)

(assert (=> b!867876 m!809131))

(declare-fun m!809133 () Bool)

(assert (=> start!73870 m!809133))

(declare-fun m!809135 () Bool)

(assert (=> start!73870 m!809135))

(declare-fun m!809137 () Bool)

(assert (=> mapNonEmpty!27008 m!809137))

(check-sat (not b!867876) b_and!24529 (not mapNonEmpty!27008) (not b!867878) tp_is_empty!16939 (not b!867875) (not b!867871) (not b!867872) (not b!867869) (not b_next!14803) (not start!73870))
(check-sat b_and!24529 (not b_next!14803))
