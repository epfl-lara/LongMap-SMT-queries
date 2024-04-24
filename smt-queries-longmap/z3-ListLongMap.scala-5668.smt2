; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73960 () Bool)

(assert start!73960)

(declare-fun b_free!14707 () Bool)

(declare-fun b_next!14707 () Bool)

(assert (=> start!73960 (= b_free!14707 (not b_next!14707))))

(declare-fun tp!51626 () Bool)

(declare-fun b_and!24403 () Bool)

(assert (=> start!73960 (= tp!51626 b_and!24403)))

(declare-fun b!866828 () Bool)

(declare-fun res!588713 () Bool)

(declare-fun e!482956 () Bool)

(assert (=> b!866828 (=> (not res!588713) (not e!482956))))

(declare-datatypes ((array!49897 0))(
  ( (array!49898 (arr!23975 (Array (_ BitVec 32) (_ BitVec 64))) (size!24416 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49897)

(declare-datatypes ((List!16980 0))(
  ( (Nil!16977) (Cons!16976 (h!18113 (_ BitVec 64)) (t!23945 List!16980)) )
))
(declare-fun arrayNoDuplicates!0 (array!49897 (_ BitVec 32) List!16980) Bool)

(assert (=> b!866828 (= res!588713 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16977))))

(declare-fun b!866829 () Bool)

(declare-datatypes ((Unit!29660 0))(
  ( (Unit!29661) )
))
(declare-fun e!482959 () Unit!29660)

(declare-fun Unit!29662 () Unit!29660)

(assert (=> b!866829 (= e!482959 Unit!29662)))

(declare-fun b!866830 () Bool)

(declare-fun res!588716 () Bool)

(assert (=> b!866830 (=> (not res!588716) (not e!482956))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!866830 (= res!588716 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!26864 () Bool)

(declare-fun mapRes!26864 () Bool)

(declare-fun tp!51625 () Bool)

(declare-fun e!482955 () Bool)

(assert (=> mapNonEmpty!26864 (= mapRes!26864 (and tp!51625 e!482955))))

(declare-fun mapKey!26864 () (_ BitVec 32))

(declare-datatypes ((V!27505 0))(
  ( (V!27506 (val!8469 Int)) )
))
(declare-datatypes ((ValueCell!7982 0))(
  ( (ValueCellFull!7982 (v!10894 V!27505)) (EmptyCell!7982) )
))
(declare-fun mapRest!26864 () (Array (_ BitVec 32) ValueCell!7982))

(declare-fun mapValue!26864 () ValueCell!7982)

(declare-datatypes ((array!49899 0))(
  ( (array!49900 (arr!23976 (Array (_ BitVec 32) ValueCell!7982)) (size!24417 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49899)

(assert (=> mapNonEmpty!26864 (= (arr!23976 _values!688) (store mapRest!26864 mapKey!26864 mapValue!26864))))

(declare-fun b!866831 () Bool)

(declare-fun res!588710 () Bool)

(assert (=> b!866831 (=> (not res!588710) (not e!482956))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!866831 (= res!588710 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24416 _keys!868))))))

(declare-fun b!866832 () Bool)

(declare-fun e!482953 () Bool)

(declare-fun e!482954 () Bool)

(assert (=> b!866832 (= e!482953 (and e!482954 mapRes!26864))))

(declare-fun condMapEmpty!26864 () Bool)

(declare-fun mapDefault!26864 () ValueCell!7982)

(assert (=> b!866832 (= condMapEmpty!26864 (= (arr!23976 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7982)) mapDefault!26864)))))

(declare-fun b!866833 () Bool)

(declare-fun e!482957 () Bool)

(declare-fun e!482952 () Bool)

(assert (=> b!866833 (= e!482957 e!482952)))

(declare-fun res!588714 () Bool)

(assert (=> b!866833 (=> res!588714 e!482952)))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!866833 (= res!588714 (= k0!854 (select (arr!23975 _keys!868) from!1053)))))

(assert (=> b!866833 (not (= (select (arr!23975 _keys!868) from!1053) k0!854))))

(declare-fun lt!392983 () Unit!29660)

(assert (=> b!866833 (= lt!392983 e!482959)))

(declare-fun c!92563 () Bool)

(assert (=> b!866833 (= c!92563 (= (select (arr!23975 _keys!868) from!1053) k0!854))))

(declare-datatypes ((tuple2!11150 0))(
  ( (tuple2!11151 (_1!5586 (_ BitVec 64)) (_2!5586 V!27505)) )
))
(declare-datatypes ((List!16981 0))(
  ( (Nil!16978) (Cons!16977 (h!18114 tuple2!11150) (t!23946 List!16981)) )
))
(declare-datatypes ((ListLongMap!9921 0))(
  ( (ListLongMap!9922 (toList!4976 List!16981)) )
))
(declare-fun lt!392984 () ListLongMap!9921)

(declare-fun lt!392992 () ListLongMap!9921)

(assert (=> b!866833 (= lt!392984 lt!392992)))

(declare-fun lt!392986 () ListLongMap!9921)

(declare-fun lt!392980 () tuple2!11150)

(declare-fun +!2379 (ListLongMap!9921 tuple2!11150) ListLongMap!9921)

(assert (=> b!866833 (= lt!392992 (+!2379 lt!392986 lt!392980))))

(declare-fun lt!392990 () V!27505)

(assert (=> b!866833 (= lt!392980 (tuple2!11151 (select (arr!23975 _keys!868) from!1053) lt!392990))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12686 (ValueCell!7982 V!27505) V!27505)

(declare-fun dynLambda!1200 (Int (_ BitVec 64)) V!27505)

(assert (=> b!866833 (= lt!392990 (get!12686 (select (arr!23976 _values!688) from!1053) (dynLambda!1200 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!866834 () Bool)

(declare-fun e!482951 () Bool)

(assert (=> b!866834 (= e!482951 (not e!482957))))

(declare-fun res!588709 () Bool)

(assert (=> b!866834 (=> res!588709 e!482957)))

(assert (=> b!866834 (= res!588709 (not (validKeyInArray!0 (select (arr!23975 _keys!868) from!1053))))))

(declare-fun lt!392978 () ListLongMap!9921)

(assert (=> b!866834 (= lt!392978 lt!392986)))

(declare-fun lt!392982 () ListLongMap!9921)

(declare-fun lt!392979 () tuple2!11150)

(assert (=> b!866834 (= lt!392986 (+!2379 lt!392982 lt!392979))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27505)

(declare-fun zeroValue!654 () V!27505)

(declare-fun lt!392981 () array!49899)

(declare-fun getCurrentListMapNoExtraKeys!3024 (array!49897 array!49899 (_ BitVec 32) (_ BitVec 32) V!27505 V!27505 (_ BitVec 32) Int) ListLongMap!9921)

(assert (=> b!866834 (= lt!392978 (getCurrentListMapNoExtraKeys!3024 _keys!868 lt!392981 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!27505)

(assert (=> b!866834 (= lt!392979 (tuple2!11151 k0!854 v!557))))

(assert (=> b!866834 (= lt!392982 (getCurrentListMapNoExtraKeys!3024 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!392989 () Unit!29660)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!558 (array!49897 array!49899 (_ BitVec 32) (_ BitVec 32) V!27505 V!27505 (_ BitVec 32) (_ BitVec 64) V!27505 (_ BitVec 32) Int) Unit!29660)

(assert (=> b!866834 (= lt!392989 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!558 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!866835 () Bool)

(declare-fun res!588711 () Bool)

(assert (=> b!866835 (=> (not res!588711) (not e!482956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!866835 (= res!588711 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!26864 () Bool)

(assert (=> mapIsEmpty!26864 mapRes!26864))

(declare-fun b!866836 () Bool)

(declare-fun res!588708 () Bool)

(assert (=> b!866836 (=> (not res!588708) (not e!482956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49897 (_ BitVec 32)) Bool)

(assert (=> b!866836 (= res!588708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!588718 () Bool)

(assert (=> start!73960 (=> (not res!588718) (not e!482956))))

(assert (=> start!73960 (= res!588718 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24416 _keys!868))))))

(assert (=> start!73960 e!482956))

(declare-fun tp_is_empty!16843 () Bool)

(assert (=> start!73960 tp_is_empty!16843))

(assert (=> start!73960 true))

(assert (=> start!73960 tp!51626))

(declare-fun array_inv!19010 (array!49897) Bool)

(assert (=> start!73960 (array_inv!19010 _keys!868)))

(declare-fun array_inv!19011 (array!49899) Bool)

(assert (=> start!73960 (and (array_inv!19011 _values!688) e!482953)))

(declare-fun b!866837 () Bool)

(assert (=> b!866837 (= e!482954 tp_is_empty!16843)))

(declare-fun b!866838 () Bool)

(declare-fun res!588712 () Bool)

(assert (=> b!866838 (=> (not res!588712) (not e!482956))))

(assert (=> b!866838 (= res!588712 (and (= (select (arr!23975 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!866839 () Bool)

(assert (=> b!866839 (= e!482952 true)))

(assert (=> b!866839 (= lt!392992 (+!2379 (+!2379 lt!392982 lt!392980) lt!392979))))

(declare-fun lt!392991 () Unit!29660)

(declare-fun addCommutativeForDiffKeys!523 (ListLongMap!9921 (_ BitVec 64) V!27505 (_ BitVec 64) V!27505) Unit!29660)

(assert (=> b!866839 (= lt!392991 (addCommutativeForDiffKeys!523 lt!392982 k0!854 v!557 (select (arr!23975 _keys!868) from!1053) lt!392990))))

(declare-fun b!866840 () Bool)

(declare-fun Unit!29663 () Unit!29660)

(assert (=> b!866840 (= e!482959 Unit!29663)))

(declare-fun lt!392985 () Unit!29660)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49897 (_ BitVec 32) (_ BitVec 32)) Unit!29660)

(assert (=> b!866840 (= lt!392985 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!866840 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16977)))

(declare-fun lt!392993 () Unit!29660)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49897 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29660)

(assert (=> b!866840 (= lt!392993 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49897 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!866840 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!392987 () Unit!29660)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49897 (_ BitVec 64) (_ BitVec 32) List!16980) Unit!29660)

(assert (=> b!866840 (= lt!392987 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16977))))

(assert (=> b!866840 false))

(declare-fun b!866841 () Bool)

(assert (=> b!866841 (= e!482956 e!482951)))

(declare-fun res!588717 () Bool)

(assert (=> b!866841 (=> (not res!588717) (not e!482951))))

(assert (=> b!866841 (= res!588717 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!866841 (= lt!392984 (getCurrentListMapNoExtraKeys!3024 _keys!868 lt!392981 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!866841 (= lt!392981 (array!49900 (store (arr!23976 _values!688) i!612 (ValueCellFull!7982 v!557)) (size!24417 _values!688)))))

(declare-fun lt!392988 () ListLongMap!9921)

(assert (=> b!866841 (= lt!392988 (getCurrentListMapNoExtraKeys!3024 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!866842 () Bool)

(assert (=> b!866842 (= e!482955 tp_is_empty!16843)))

(declare-fun b!866843 () Bool)

(declare-fun res!588715 () Bool)

(assert (=> b!866843 (=> (not res!588715) (not e!482956))))

(assert (=> b!866843 (= res!588715 (and (= (size!24417 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24416 _keys!868) (size!24417 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73960 res!588718) b!866835))

(assert (= (and b!866835 res!588711) b!866843))

(assert (= (and b!866843 res!588715) b!866836))

(assert (= (and b!866836 res!588708) b!866828))

(assert (= (and b!866828 res!588713) b!866831))

(assert (= (and b!866831 res!588710) b!866830))

(assert (= (and b!866830 res!588716) b!866838))

(assert (= (and b!866838 res!588712) b!866841))

(assert (= (and b!866841 res!588717) b!866834))

(assert (= (and b!866834 (not res!588709)) b!866833))

(assert (= (and b!866833 c!92563) b!866840))

(assert (= (and b!866833 (not c!92563)) b!866829))

(assert (= (and b!866833 (not res!588714)) b!866839))

(assert (= (and b!866832 condMapEmpty!26864) mapIsEmpty!26864))

(assert (= (and b!866832 (not condMapEmpty!26864)) mapNonEmpty!26864))

(get-info :version)

(assert (= (and mapNonEmpty!26864 ((_ is ValueCellFull!7982) mapValue!26864)) b!866842))

(assert (= (and b!866832 ((_ is ValueCellFull!7982) mapDefault!26864)) b!866837))

(assert (= start!73960 b!866832))

(declare-fun b_lambda!12073 () Bool)

(assert (=> (not b_lambda!12073) (not b!866833)))

(declare-fun t!23944 () Bool)

(declare-fun tb!4821 () Bool)

(assert (=> (and start!73960 (= defaultEntry!696 defaultEntry!696) t!23944) tb!4821))

(declare-fun result!9261 () Bool)

(assert (=> tb!4821 (= result!9261 tp_is_empty!16843)))

(assert (=> b!866833 t!23944))

(declare-fun b_and!24405 () Bool)

(assert (= b_and!24403 (and (=> t!23944 result!9261) b_and!24405)))

(declare-fun m!808793 () Bool)

(assert (=> b!866835 m!808793))

(declare-fun m!808795 () Bool)

(assert (=> b!866838 m!808795))

(declare-fun m!808797 () Bool)

(assert (=> b!866834 m!808797))

(declare-fun m!808799 () Bool)

(assert (=> b!866834 m!808799))

(declare-fun m!808801 () Bool)

(assert (=> b!866834 m!808801))

(assert (=> b!866834 m!808799))

(declare-fun m!808803 () Bool)

(assert (=> b!866834 m!808803))

(declare-fun m!808805 () Bool)

(assert (=> b!866834 m!808805))

(declare-fun m!808807 () Bool)

(assert (=> b!866834 m!808807))

(declare-fun m!808809 () Bool)

(assert (=> b!866841 m!808809))

(declare-fun m!808811 () Bool)

(assert (=> b!866841 m!808811))

(declare-fun m!808813 () Bool)

(assert (=> b!866841 m!808813))

(declare-fun m!808815 () Bool)

(assert (=> b!866833 m!808815))

(declare-fun m!808817 () Bool)

(assert (=> b!866833 m!808817))

(declare-fun m!808819 () Bool)

(assert (=> b!866833 m!808819))

(declare-fun m!808821 () Bool)

(assert (=> b!866833 m!808821))

(assert (=> b!866833 m!808817))

(assert (=> b!866833 m!808799))

(assert (=> b!866833 m!808819))

(declare-fun m!808823 () Bool)

(assert (=> start!73960 m!808823))

(declare-fun m!808825 () Bool)

(assert (=> start!73960 m!808825))

(declare-fun m!808827 () Bool)

(assert (=> b!866839 m!808827))

(assert (=> b!866839 m!808827))

(declare-fun m!808829 () Bool)

(assert (=> b!866839 m!808829))

(assert (=> b!866839 m!808799))

(assert (=> b!866839 m!808799))

(declare-fun m!808831 () Bool)

(assert (=> b!866839 m!808831))

(declare-fun m!808833 () Bool)

(assert (=> b!866840 m!808833))

(declare-fun m!808835 () Bool)

(assert (=> b!866840 m!808835))

(declare-fun m!808837 () Bool)

(assert (=> b!866840 m!808837))

(declare-fun m!808839 () Bool)

(assert (=> b!866840 m!808839))

(declare-fun m!808841 () Bool)

(assert (=> b!866840 m!808841))

(declare-fun m!808843 () Bool)

(assert (=> mapNonEmpty!26864 m!808843))

(declare-fun m!808845 () Bool)

(assert (=> b!866830 m!808845))

(declare-fun m!808847 () Bool)

(assert (=> b!866828 m!808847))

(declare-fun m!808849 () Bool)

(assert (=> b!866836 m!808849))

(check-sat (not b!866834) (not b!866841) (not b_next!14707) b_and!24405 (not b!866836) tp_is_empty!16843 (not start!73960) (not mapNonEmpty!26864) (not b!866833) (not b!866830) (not b_lambda!12073) (not b!866839) (not b!866828) (not b!866840) (not b!866835))
(check-sat b_and!24405 (not b_next!14707))
