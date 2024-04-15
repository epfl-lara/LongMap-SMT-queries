; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73708 () Bool)

(assert start!73708)

(declare-fun b_free!14641 () Bool)

(declare-fun b_next!14641 () Bool)

(assert (=> start!73708 (= b_free!14641 (not b_next!14641))))

(declare-fun tp!51427 () Bool)

(declare-fun b_and!24235 () Bool)

(assert (=> start!73708 (= tp!51427 b_and!24235)))

(declare-fun b!864036 () Bool)

(declare-fun e!481335 () Bool)

(declare-fun e!481331 () Bool)

(assert (=> b!864036 (= e!481335 e!481331)))

(declare-fun res!587174 () Bool)

(assert (=> b!864036 (=> (not res!587174) (not e!481331))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!864036 (= res!587174 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27417 0))(
  ( (V!27418 (val!8436 Int)) )
))
(declare-datatypes ((tuple2!11184 0))(
  ( (tuple2!11185 (_1!5603 (_ BitVec 64)) (_2!5603 V!27417)) )
))
(declare-datatypes ((List!16978 0))(
  ( (Nil!16975) (Cons!16974 (h!18105 tuple2!11184) (t!23876 List!16978)) )
))
(declare-datatypes ((ListLongMap!9943 0))(
  ( (ListLongMap!9944 (toList!4987 List!16978)) )
))
(declare-fun lt!390797 () ListLongMap!9943)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!7949 0))(
  ( (ValueCellFull!7949 (v!10855 V!27417)) (EmptyCell!7949) )
))
(declare-datatypes ((array!49707 0))(
  ( (array!49708 (arr!23885 (Array (_ BitVec 32) ValueCell!7949)) (size!24327 (_ BitVec 32))) )
))
(declare-fun lt!390803 () array!49707)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49709 0))(
  ( (array!49710 (arr!23886 (Array (_ BitVec 32) (_ BitVec 64))) (size!24328 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49709)

(declare-fun minValue!654 () V!27417)

(declare-fun zeroValue!654 () V!27417)

(declare-fun getCurrentListMapNoExtraKeys!2986 (array!49709 array!49707 (_ BitVec 32) (_ BitVec 32) V!27417 V!27417 (_ BitVec 32) Int) ListLongMap!9943)

(assert (=> b!864036 (= lt!390797 (getCurrentListMapNoExtraKeys!2986 _keys!868 lt!390803 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27417)

(declare-fun _values!688 () array!49707)

(assert (=> b!864036 (= lt!390803 (array!49708 (store (arr!23885 _values!688) i!612 (ValueCellFull!7949 v!557)) (size!24327 _values!688)))))

(declare-fun lt!390806 () ListLongMap!9943)

(assert (=> b!864036 (= lt!390806 (getCurrentListMapNoExtraKeys!2986 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!864037 () Bool)

(declare-fun res!587173 () Bool)

(assert (=> b!864037 (=> (not res!587173) (not e!481335))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49709 (_ BitVec 32)) Bool)

(assert (=> b!864037 (= res!587173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!864038 () Bool)

(declare-fun e!481330 () Bool)

(declare-fun e!481334 () Bool)

(declare-fun mapRes!26765 () Bool)

(assert (=> b!864038 (= e!481330 (and e!481334 mapRes!26765))))

(declare-fun condMapEmpty!26765 () Bool)

(declare-fun mapDefault!26765 () ValueCell!7949)

(assert (=> b!864038 (= condMapEmpty!26765 (= (arr!23885 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7949)) mapDefault!26765)))))

(declare-fun b!864039 () Bool)

(declare-fun e!481337 () Bool)

(assert (=> b!864039 (= e!481331 (not e!481337))))

(declare-fun res!587168 () Bool)

(assert (=> b!864039 (=> res!587168 e!481337)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!864039 (= res!587168 (not (validKeyInArray!0 (select (arr!23886 _keys!868) from!1053))))))

(declare-fun lt!390812 () ListLongMap!9943)

(declare-fun lt!390811 () ListLongMap!9943)

(assert (=> b!864039 (= lt!390812 lt!390811)))

(declare-fun lt!390809 () ListLongMap!9943)

(declare-fun lt!390807 () tuple2!11184)

(declare-fun +!2356 (ListLongMap!9943 tuple2!11184) ListLongMap!9943)

(assert (=> b!864039 (= lt!390811 (+!2356 lt!390809 lt!390807))))

(assert (=> b!864039 (= lt!390812 (getCurrentListMapNoExtraKeys!2986 _keys!868 lt!390803 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!864039 (= lt!390807 (tuple2!11185 k0!854 v!557))))

(assert (=> b!864039 (= lt!390809 (getCurrentListMapNoExtraKeys!2986 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29490 0))(
  ( (Unit!29491) )
))
(declare-fun lt!390804 () Unit!29490)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!535 (array!49709 array!49707 (_ BitVec 32) (_ BitVec 32) V!27417 V!27417 (_ BitVec 32) (_ BitVec 64) V!27417 (_ BitVec 32) Int) Unit!29490)

(assert (=> b!864039 (= lt!390804 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!535 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!864040 () Bool)

(declare-fun e!481333 () Bool)

(declare-fun tp_is_empty!16777 () Bool)

(assert (=> b!864040 (= e!481333 tp_is_empty!16777)))

(declare-fun b!864041 () Bool)

(declare-fun e!481338 () Unit!29490)

(declare-fun Unit!29492 () Unit!29490)

(assert (=> b!864041 (= e!481338 Unit!29492)))

(declare-fun b!864042 () Bool)

(declare-fun res!587167 () Bool)

(assert (=> b!864042 (=> (not res!587167) (not e!481335))))

(assert (=> b!864042 (= res!587167 (and (= (select (arr!23886 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!864043 () Bool)

(declare-fun res!587171 () Bool)

(assert (=> b!864043 (=> (not res!587171) (not e!481335))))

(assert (=> b!864043 (= res!587171 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!26765 () Bool)

(declare-fun tp!51428 () Bool)

(assert (=> mapNonEmpty!26765 (= mapRes!26765 (and tp!51428 e!481333))))

(declare-fun mapValue!26765 () ValueCell!7949)

(declare-fun mapKey!26765 () (_ BitVec 32))

(declare-fun mapRest!26765 () (Array (_ BitVec 32) ValueCell!7949))

(assert (=> mapNonEmpty!26765 (= (arr!23885 _values!688) (store mapRest!26765 mapKey!26765 mapValue!26765))))

(declare-fun b!864044 () Bool)

(declare-fun e!481336 () Bool)

(assert (=> b!864044 (= e!481337 e!481336)))

(declare-fun res!587172 () Bool)

(assert (=> b!864044 (=> res!587172 e!481336)))

(assert (=> b!864044 (= res!587172 (= k0!854 (select (arr!23886 _keys!868) from!1053)))))

(assert (=> b!864044 (not (= (select (arr!23886 _keys!868) from!1053) k0!854))))

(declare-fun lt!390798 () Unit!29490)

(assert (=> b!864044 (= lt!390798 e!481338)))

(declare-fun c!92117 () Bool)

(assert (=> b!864044 (= c!92117 (= (select (arr!23886 _keys!868) from!1053) k0!854))))

(declare-fun lt!390801 () ListLongMap!9943)

(assert (=> b!864044 (= lt!390797 lt!390801)))

(declare-fun lt!390810 () tuple2!11184)

(assert (=> b!864044 (= lt!390801 (+!2356 lt!390811 lt!390810))))

(declare-fun lt!390799 () V!27417)

(assert (=> b!864044 (= lt!390810 (tuple2!11185 (select (arr!23886 _keys!868) from!1053) lt!390799))))

(declare-fun get!12618 (ValueCell!7949 V!27417) V!27417)

(declare-fun dynLambda!1157 (Int (_ BitVec 64)) V!27417)

(assert (=> b!864044 (= lt!390799 (get!12618 (select (arr!23885 _values!688) from!1053) (dynLambda!1157 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!864045 () Bool)

(assert (=> b!864045 (= e!481336 true)))

(assert (=> b!864045 (= lt!390801 (+!2356 (+!2356 lt!390809 lt!390810) lt!390807))))

(declare-fun lt!390808 () Unit!29490)

(declare-fun addCommutativeForDiffKeys!499 (ListLongMap!9943 (_ BitVec 64) V!27417 (_ BitVec 64) V!27417) Unit!29490)

(assert (=> b!864045 (= lt!390808 (addCommutativeForDiffKeys!499 lt!390809 k0!854 v!557 (select (arr!23886 _keys!868) from!1053) lt!390799))))

(declare-fun b!864046 () Bool)

(declare-fun res!587175 () Bool)

(assert (=> b!864046 (=> (not res!587175) (not e!481335))))

(assert (=> b!864046 (= res!587175 (and (= (size!24327 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24328 _keys!868) (size!24327 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!864047 () Bool)

(declare-fun Unit!29493 () Unit!29490)

(assert (=> b!864047 (= e!481338 Unit!29493)))

(declare-fun lt!390802 () Unit!29490)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49709 (_ BitVec 32) (_ BitVec 32)) Unit!29490)

(assert (=> b!864047 (= lt!390802 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!16979 0))(
  ( (Nil!16976) (Cons!16975 (h!18106 (_ BitVec 64)) (t!23877 List!16979)) )
))
(declare-fun arrayNoDuplicates!0 (array!49709 (_ BitVec 32) List!16979) Bool)

(assert (=> b!864047 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16976)))

(declare-fun lt!390805 () Unit!29490)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49709 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29490)

(assert (=> b!864047 (= lt!390805 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!864047 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!390800 () Unit!29490)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49709 (_ BitVec 64) (_ BitVec 32) List!16979) Unit!29490)

(assert (=> b!864047 (= lt!390800 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16976))))

(assert (=> b!864047 false))

(declare-fun mapIsEmpty!26765 () Bool)

(assert (=> mapIsEmpty!26765 mapRes!26765))

(declare-fun b!864048 () Bool)

(declare-fun res!587165 () Bool)

(assert (=> b!864048 (=> (not res!587165) (not e!481335))))

(assert (=> b!864048 (= res!587165 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16976))))

(declare-fun res!587166 () Bool)

(assert (=> start!73708 (=> (not res!587166) (not e!481335))))

(assert (=> start!73708 (= res!587166 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24328 _keys!868))))))

(assert (=> start!73708 e!481335))

(assert (=> start!73708 tp_is_empty!16777))

(assert (=> start!73708 true))

(assert (=> start!73708 tp!51427))

(declare-fun array_inv!18962 (array!49709) Bool)

(assert (=> start!73708 (array_inv!18962 _keys!868)))

(declare-fun array_inv!18963 (array!49707) Bool)

(assert (=> start!73708 (and (array_inv!18963 _values!688) e!481330)))

(declare-fun b!864049 () Bool)

(assert (=> b!864049 (= e!481334 tp_is_empty!16777)))

(declare-fun b!864050 () Bool)

(declare-fun res!587170 () Bool)

(assert (=> b!864050 (=> (not res!587170) (not e!481335))))

(assert (=> b!864050 (= res!587170 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24328 _keys!868))))))

(declare-fun b!864051 () Bool)

(declare-fun res!587169 () Bool)

(assert (=> b!864051 (=> (not res!587169) (not e!481335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!864051 (= res!587169 (validMask!0 mask!1196))))

(assert (= (and start!73708 res!587166) b!864051))

(assert (= (and b!864051 res!587169) b!864046))

(assert (= (and b!864046 res!587175) b!864037))

(assert (= (and b!864037 res!587173) b!864048))

(assert (= (and b!864048 res!587165) b!864050))

(assert (= (and b!864050 res!587170) b!864043))

(assert (= (and b!864043 res!587171) b!864042))

(assert (= (and b!864042 res!587167) b!864036))

(assert (= (and b!864036 res!587174) b!864039))

(assert (= (and b!864039 (not res!587168)) b!864044))

(assert (= (and b!864044 c!92117) b!864047))

(assert (= (and b!864044 (not c!92117)) b!864041))

(assert (= (and b!864044 (not res!587172)) b!864045))

(assert (= (and b!864038 condMapEmpty!26765) mapIsEmpty!26765))

(assert (= (and b!864038 (not condMapEmpty!26765)) mapNonEmpty!26765))

(get-info :version)

(assert (= (and mapNonEmpty!26765 ((_ is ValueCellFull!7949) mapValue!26765)) b!864040))

(assert (= (and b!864038 ((_ is ValueCellFull!7949) mapDefault!26765)) b!864049))

(assert (= start!73708 b!864038))

(declare-fun b_lambda!11975 () Bool)

(assert (=> (not b_lambda!11975) (not b!864044)))

(declare-fun t!23875 () Bool)

(declare-fun tb!4755 () Bool)

(assert (=> (and start!73708 (= defaultEntry!696 defaultEntry!696) t!23875) tb!4755))

(declare-fun result!9129 () Bool)

(assert (=> tb!4755 (= result!9129 tp_is_empty!16777)))

(assert (=> b!864044 t!23875))

(declare-fun b_and!24237 () Bool)

(assert (= b_and!24235 (and (=> t!23875 result!9129) b_and!24237)))

(declare-fun m!804831 () Bool)

(assert (=> start!73708 m!804831))

(declare-fun m!804833 () Bool)

(assert (=> start!73708 m!804833))

(declare-fun m!804835 () Bool)

(assert (=> b!864047 m!804835))

(declare-fun m!804837 () Bool)

(assert (=> b!864047 m!804837))

(declare-fun m!804839 () Bool)

(assert (=> b!864047 m!804839))

(declare-fun m!804841 () Bool)

(assert (=> b!864047 m!804841))

(declare-fun m!804843 () Bool)

(assert (=> b!864047 m!804843))

(declare-fun m!804845 () Bool)

(assert (=> b!864048 m!804845))

(declare-fun m!804847 () Bool)

(assert (=> b!864043 m!804847))

(declare-fun m!804849 () Bool)

(assert (=> b!864037 m!804849))

(declare-fun m!804851 () Bool)

(assert (=> b!864039 m!804851))

(declare-fun m!804853 () Bool)

(assert (=> b!864039 m!804853))

(declare-fun m!804855 () Bool)

(assert (=> b!864039 m!804855))

(declare-fun m!804857 () Bool)

(assert (=> b!864039 m!804857))

(assert (=> b!864039 m!804855))

(declare-fun m!804859 () Bool)

(assert (=> b!864039 m!804859))

(declare-fun m!804861 () Bool)

(assert (=> b!864039 m!804861))

(declare-fun m!804863 () Bool)

(assert (=> b!864036 m!804863))

(declare-fun m!804865 () Bool)

(assert (=> b!864036 m!804865))

(declare-fun m!804867 () Bool)

(assert (=> b!864036 m!804867))

(declare-fun m!804869 () Bool)

(assert (=> b!864042 m!804869))

(declare-fun m!804871 () Bool)

(assert (=> b!864051 m!804871))

(declare-fun m!804873 () Bool)

(assert (=> b!864045 m!804873))

(assert (=> b!864045 m!804873))

(declare-fun m!804875 () Bool)

(assert (=> b!864045 m!804875))

(assert (=> b!864045 m!804855))

(assert (=> b!864045 m!804855))

(declare-fun m!804877 () Bool)

(assert (=> b!864045 m!804877))

(declare-fun m!804879 () Bool)

(assert (=> mapNonEmpty!26765 m!804879))

(declare-fun m!804881 () Bool)

(assert (=> b!864044 m!804881))

(declare-fun m!804883 () Bool)

(assert (=> b!864044 m!804883))

(declare-fun m!804885 () Bool)

(assert (=> b!864044 m!804885))

(declare-fun m!804887 () Bool)

(assert (=> b!864044 m!804887))

(assert (=> b!864044 m!804883))

(assert (=> b!864044 m!804855))

(assert (=> b!864044 m!804885))

(check-sat (not b!864043) tp_is_empty!16777 (not b!864044) (not b!864037) (not b!864036) (not b_next!14641) (not b!864039) (not b!864048) (not b!864051) (not mapNonEmpty!26765) b_and!24237 (not b!864047) (not b_lambda!11975) (not b!864045) (not start!73708))
(check-sat b_and!24237 (not b_next!14641))
