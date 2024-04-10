; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73836 () Bool)

(assert start!73836)

(declare-fun b_free!14751 () Bool)

(declare-fun b_next!14751 () Bool)

(assert (=> start!73836 (= b_free!14751 (not b_next!14751))))

(declare-fun tp!51756 () Bool)

(declare-fun b_and!24481 () Bool)

(assert (=> start!73836 (= tp!51756 b_and!24481)))

(declare-fun b!867025 () Bool)

(declare-fun res!589097 () Bool)

(declare-fun e!482971 () Bool)

(assert (=> b!867025 (=> (not res!589097) (not e!482971))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27563 0))(
  ( (V!27564 (val!8491 Int)) )
))
(declare-datatypes ((ValueCell!8004 0))(
  ( (ValueCellFull!8004 (v!10916 V!27563)) (EmptyCell!8004) )
))
(declare-datatypes ((array!49934 0))(
  ( (array!49935 (arr!23998 (Array (_ BitVec 32) ValueCell!8004)) (size!24438 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49934)

(declare-datatypes ((array!49936 0))(
  ( (array!49937 (arr!23999 (Array (_ BitVec 32) (_ BitVec 64))) (size!24439 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49936)

(assert (=> b!867025 (= res!589097 (and (= (size!24438 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24439 _keys!868) (size!24438 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!867026 () Bool)

(declare-datatypes ((Unit!29729 0))(
  ( (Unit!29730) )
))
(declare-fun e!482966 () Unit!29729)

(declare-fun Unit!29731 () Unit!29729)

(assert (=> b!867026 (= e!482966 Unit!29731)))

(declare-fun lt!393677 () Unit!29729)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49936 (_ BitVec 32) (_ BitVec 32)) Unit!29729)

(assert (=> b!867026 (= lt!393677 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17062 0))(
  ( (Nil!17059) (Cons!17058 (h!18189 (_ BitVec 64)) (t!24079 List!17062)) )
))
(declare-fun arrayNoDuplicates!0 (array!49936 (_ BitVec 32) List!17062) Bool)

(assert (=> b!867026 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17059)))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lt!393674 () Unit!29729)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49936 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29729)

(assert (=> b!867026 (= lt!393674 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49936 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!867026 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!393676 () Unit!29729)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49936 (_ BitVec 64) (_ BitVec 32) List!17062) Unit!29729)

(assert (=> b!867026 (= lt!393676 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17059))))

(assert (=> b!867026 false))

(declare-fun b!867027 () Bool)

(declare-fun e!482963 () Bool)

(declare-fun e!482965 () Bool)

(assert (=> b!867027 (= e!482963 (not e!482965))))

(declare-fun res!589100 () Bool)

(assert (=> b!867027 (=> res!589100 e!482965)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867027 (= res!589100 (not (validKeyInArray!0 (select (arr!23999 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11264 0))(
  ( (tuple2!11265 (_1!5643 (_ BitVec 64)) (_2!5643 V!27563)) )
))
(declare-datatypes ((List!17063 0))(
  ( (Nil!17060) (Cons!17059 (h!18190 tuple2!11264) (t!24080 List!17063)) )
))
(declare-datatypes ((ListLongMap!10033 0))(
  ( (ListLongMap!10034 (toList!5032 List!17063)) )
))
(declare-fun lt!393686 () ListLongMap!10033)

(declare-fun lt!393687 () ListLongMap!10033)

(assert (=> b!867027 (= lt!393686 lt!393687)))

(declare-fun lt!393679 () ListLongMap!10033)

(declare-fun lt!393688 () tuple2!11264)

(declare-fun +!2378 (ListLongMap!10033 tuple2!11264) ListLongMap!10033)

(assert (=> b!867027 (= lt!393687 (+!2378 lt!393679 lt!393688))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!393673 () array!49934)

(declare-fun minValue!654 () V!27563)

(declare-fun zeroValue!654 () V!27563)

(declare-fun getCurrentListMapNoExtraKeys!3002 (array!49936 array!49934 (_ BitVec 32) (_ BitVec 32) V!27563 V!27563 (_ BitVec 32) Int) ListLongMap!10033)

(assert (=> b!867027 (= lt!393686 (getCurrentListMapNoExtraKeys!3002 _keys!868 lt!393673 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!27563)

(assert (=> b!867027 (= lt!393688 (tuple2!11265 k0!854 v!557))))

(assert (=> b!867027 (= lt!393679 (getCurrentListMapNoExtraKeys!3002 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!393683 () Unit!29729)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!574 (array!49936 array!49934 (_ BitVec 32) (_ BitVec 32) V!27563 V!27563 (_ BitVec 32) (_ BitVec 64) V!27563 (_ BitVec 32) Int) Unit!29729)

(assert (=> b!867027 (= lt!393683 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!574 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!867028 () Bool)

(declare-fun res!589093 () Bool)

(assert (=> b!867028 (=> (not res!589093) (not e!482971))))

(assert (=> b!867028 (= res!589093 (and (= (select (arr!23999 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!867029 () Bool)

(declare-fun e!482969 () Bool)

(declare-fun tp_is_empty!16887 () Bool)

(assert (=> b!867029 (= e!482969 tp_is_empty!16887)))

(declare-fun b!867030 () Bool)

(declare-fun e!482968 () Bool)

(declare-fun mapRes!26930 () Bool)

(assert (=> b!867030 (= e!482968 (and e!482969 mapRes!26930))))

(declare-fun condMapEmpty!26930 () Bool)

(declare-fun mapDefault!26930 () ValueCell!8004)

(assert (=> b!867030 (= condMapEmpty!26930 (= (arr!23998 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8004)) mapDefault!26930)))))

(declare-fun res!589092 () Bool)

(assert (=> start!73836 (=> (not res!589092) (not e!482971))))

(assert (=> start!73836 (= res!589092 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24439 _keys!868))))))

(assert (=> start!73836 e!482971))

(assert (=> start!73836 tp_is_empty!16887))

(assert (=> start!73836 true))

(assert (=> start!73836 tp!51756))

(declare-fun array_inv!18966 (array!49936) Bool)

(assert (=> start!73836 (array_inv!18966 _keys!868)))

(declare-fun array_inv!18967 (array!49934) Bool)

(assert (=> start!73836 (and (array_inv!18967 _values!688) e!482968)))

(declare-fun b!867031 () Bool)

(declare-fun e!482970 () Bool)

(assert (=> b!867031 (= e!482965 e!482970)))

(declare-fun res!589090 () Bool)

(assert (=> b!867031 (=> res!589090 e!482970)))

(assert (=> b!867031 (= res!589090 (= k0!854 (select (arr!23999 _keys!868) from!1053)))))

(assert (=> b!867031 (not (= (select (arr!23999 _keys!868) from!1053) k0!854))))

(declare-fun lt!393685 () Unit!29729)

(assert (=> b!867031 (= lt!393685 e!482966)))

(declare-fun c!92347 () Bool)

(assert (=> b!867031 (= c!92347 (= (select (arr!23999 _keys!868) from!1053) k0!854))))

(declare-fun lt!393680 () ListLongMap!10033)

(declare-fun lt!393681 () ListLongMap!10033)

(assert (=> b!867031 (= lt!393680 lt!393681)))

(declare-fun lt!393678 () tuple2!11264)

(assert (=> b!867031 (= lt!393681 (+!2378 lt!393687 lt!393678))))

(declare-fun lt!393675 () V!27563)

(assert (=> b!867031 (= lt!393678 (tuple2!11265 (select (arr!23999 _keys!868) from!1053) lt!393675))))

(declare-fun get!12690 (ValueCell!8004 V!27563) V!27563)

(declare-fun dynLambda!1196 (Int (_ BitVec 64)) V!27563)

(assert (=> b!867031 (= lt!393675 (get!12690 (select (arr!23998 _values!688) from!1053) (dynLambda!1196 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!867032 () Bool)

(declare-fun res!589096 () Bool)

(assert (=> b!867032 (=> (not res!589096) (not e!482971))))

(assert (=> b!867032 (= res!589096 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17059))))

(declare-fun b!867033 () Bool)

(declare-fun res!589095 () Bool)

(assert (=> b!867033 (=> (not res!589095) (not e!482971))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49936 (_ BitVec 32)) Bool)

(assert (=> b!867033 (= res!589095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!867034 () Bool)

(assert (=> b!867034 (= e!482970 true)))

(assert (=> b!867034 (= lt!393681 (+!2378 (+!2378 lt!393679 lt!393678) lt!393688))))

(declare-fun lt!393684 () Unit!29729)

(declare-fun addCommutativeForDiffKeys!545 (ListLongMap!10033 (_ BitVec 64) V!27563 (_ BitVec 64) V!27563) Unit!29729)

(assert (=> b!867034 (= lt!393684 (addCommutativeForDiffKeys!545 lt!393679 k0!854 v!557 (select (arr!23999 _keys!868) from!1053) lt!393675))))

(declare-fun mapIsEmpty!26930 () Bool)

(assert (=> mapIsEmpty!26930 mapRes!26930))

(declare-fun b!867035 () Bool)

(declare-fun res!589094 () Bool)

(assert (=> b!867035 (=> (not res!589094) (not e!482971))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!867035 (= res!589094 (validMask!0 mask!1196))))

(declare-fun b!867036 () Bool)

(declare-fun res!589098 () Bool)

(assert (=> b!867036 (=> (not res!589098) (not e!482971))))

(assert (=> b!867036 (= res!589098 (validKeyInArray!0 k0!854))))

(declare-fun b!867037 () Bool)

(declare-fun e!482967 () Bool)

(assert (=> b!867037 (= e!482967 tp_is_empty!16887)))

(declare-fun b!867038 () Bool)

(declare-fun res!589099 () Bool)

(assert (=> b!867038 (=> (not res!589099) (not e!482971))))

(assert (=> b!867038 (= res!589099 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24439 _keys!868))))))

(declare-fun b!867039 () Bool)

(assert (=> b!867039 (= e!482971 e!482963)))

(declare-fun res!589091 () Bool)

(assert (=> b!867039 (=> (not res!589091) (not e!482963))))

(assert (=> b!867039 (= res!589091 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!867039 (= lt!393680 (getCurrentListMapNoExtraKeys!3002 _keys!868 lt!393673 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!867039 (= lt!393673 (array!49935 (store (arr!23998 _values!688) i!612 (ValueCellFull!8004 v!557)) (size!24438 _values!688)))))

(declare-fun lt!393682 () ListLongMap!10033)

(assert (=> b!867039 (= lt!393682 (getCurrentListMapNoExtraKeys!3002 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!26930 () Bool)

(declare-fun tp!51757 () Bool)

(assert (=> mapNonEmpty!26930 (= mapRes!26930 (and tp!51757 e!482967))))

(declare-fun mapValue!26930 () ValueCell!8004)

(declare-fun mapKey!26930 () (_ BitVec 32))

(declare-fun mapRest!26930 () (Array (_ BitVec 32) ValueCell!8004))

(assert (=> mapNonEmpty!26930 (= (arr!23998 _values!688) (store mapRest!26930 mapKey!26930 mapValue!26930))))

(declare-fun b!867040 () Bool)

(declare-fun Unit!29732 () Unit!29729)

(assert (=> b!867040 (= e!482966 Unit!29732)))

(assert (= (and start!73836 res!589092) b!867035))

(assert (= (and b!867035 res!589094) b!867025))

(assert (= (and b!867025 res!589097) b!867033))

(assert (= (and b!867033 res!589095) b!867032))

(assert (= (and b!867032 res!589096) b!867038))

(assert (= (and b!867038 res!589099) b!867036))

(assert (= (and b!867036 res!589098) b!867028))

(assert (= (and b!867028 res!589093) b!867039))

(assert (= (and b!867039 res!589091) b!867027))

(assert (= (and b!867027 (not res!589100)) b!867031))

(assert (= (and b!867031 c!92347) b!867026))

(assert (= (and b!867031 (not c!92347)) b!867040))

(assert (= (and b!867031 (not res!589090)) b!867034))

(assert (= (and b!867030 condMapEmpty!26930) mapIsEmpty!26930))

(assert (= (and b!867030 (not condMapEmpty!26930)) mapNonEmpty!26930))

(get-info :version)

(assert (= (and mapNonEmpty!26930 ((_ is ValueCellFull!8004) mapValue!26930)) b!867037))

(assert (= (and b!867030 ((_ is ValueCellFull!8004) mapDefault!26930)) b!867029))

(assert (= start!73836 b!867030))

(declare-fun b_lambda!12103 () Bool)

(assert (=> (not b_lambda!12103) (not b!867031)))

(declare-fun t!24078 () Bool)

(declare-fun tb!4873 () Bool)

(assert (=> (and start!73836 (= defaultEntry!696 defaultEntry!696) t!24078) tb!4873))

(declare-fun result!9357 () Bool)

(assert (=> tb!4873 (= result!9357 tp_is_empty!16887)))

(assert (=> b!867031 t!24078))

(declare-fun b_and!24483 () Bool)

(assert (= b_and!24481 (and (=> t!24078 result!9357) b_and!24483)))

(declare-fun m!808779 () Bool)

(assert (=> b!867026 m!808779))

(declare-fun m!808781 () Bool)

(assert (=> b!867026 m!808781))

(declare-fun m!808783 () Bool)

(assert (=> b!867026 m!808783))

(declare-fun m!808785 () Bool)

(assert (=> b!867026 m!808785))

(declare-fun m!808787 () Bool)

(assert (=> b!867026 m!808787))

(declare-fun m!808789 () Bool)

(assert (=> b!867033 m!808789))

(declare-fun m!808791 () Bool)

(assert (=> b!867031 m!808791))

(declare-fun m!808793 () Bool)

(assert (=> b!867031 m!808793))

(declare-fun m!808795 () Bool)

(assert (=> b!867031 m!808795))

(declare-fun m!808797 () Bool)

(assert (=> b!867031 m!808797))

(assert (=> b!867031 m!808793))

(declare-fun m!808799 () Bool)

(assert (=> b!867031 m!808799))

(assert (=> b!867031 m!808795))

(declare-fun m!808801 () Bool)

(assert (=> b!867032 m!808801))

(declare-fun m!808803 () Bool)

(assert (=> start!73836 m!808803))

(declare-fun m!808805 () Bool)

(assert (=> start!73836 m!808805))

(declare-fun m!808807 () Bool)

(assert (=> b!867039 m!808807))

(declare-fun m!808809 () Bool)

(assert (=> b!867039 m!808809))

(declare-fun m!808811 () Bool)

(assert (=> b!867039 m!808811))

(declare-fun m!808813 () Bool)

(assert (=> b!867036 m!808813))

(declare-fun m!808815 () Bool)

(assert (=> b!867035 m!808815))

(declare-fun m!808817 () Bool)

(assert (=> mapNonEmpty!26930 m!808817))

(declare-fun m!808819 () Bool)

(assert (=> b!867027 m!808819))

(declare-fun m!808821 () Bool)

(assert (=> b!867027 m!808821))

(declare-fun m!808823 () Bool)

(assert (=> b!867027 m!808823))

(assert (=> b!867027 m!808799))

(declare-fun m!808825 () Bool)

(assert (=> b!867027 m!808825))

(assert (=> b!867027 m!808799))

(declare-fun m!808827 () Bool)

(assert (=> b!867027 m!808827))

(declare-fun m!808829 () Bool)

(assert (=> b!867028 m!808829))

(declare-fun m!808831 () Bool)

(assert (=> b!867034 m!808831))

(assert (=> b!867034 m!808831))

(declare-fun m!808833 () Bool)

(assert (=> b!867034 m!808833))

(assert (=> b!867034 m!808799))

(assert (=> b!867034 m!808799))

(declare-fun m!808835 () Bool)

(assert (=> b!867034 m!808835))

(check-sat (not b!867036) (not b!867027) (not mapNonEmpty!26930) (not b!867032) b_and!24483 (not start!73836) (not b_lambda!12103) (not b!867033) (not b_next!14751) (not b!867034) (not b!867039) (not b!867035) (not b!867031) (not b!867026) tp_is_empty!16887)
(check-sat b_and!24483 (not b_next!14751))
