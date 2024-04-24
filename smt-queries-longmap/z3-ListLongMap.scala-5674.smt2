; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73996 () Bool)

(assert start!73996)

(declare-fun b_free!14743 () Bool)

(declare-fun b_next!14743 () Bool)

(assert (=> start!73996 (= b_free!14743 (not b_next!14743))))

(declare-fun tp!51734 () Bool)

(declare-fun b_and!24475 () Bool)

(assert (=> start!73996 (= tp!51734 b_and!24475)))

(declare-fun b!867728 () Bool)

(declare-fun res!589304 () Bool)

(declare-fun e!483440 () Bool)

(assert (=> b!867728 (=> (not res!589304) (not e!483440))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49969 0))(
  ( (array!49970 (arr!24011 (Array (_ BitVec 32) (_ BitVec 64))) (size!24452 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49969)

(declare-datatypes ((V!27553 0))(
  ( (V!27554 (val!8487 Int)) )
))
(declare-datatypes ((ValueCell!8000 0))(
  ( (ValueCellFull!8000 (v!10912 V!27553)) (EmptyCell!8000) )
))
(declare-datatypes ((array!49971 0))(
  ( (array!49972 (arr!24012 (Array (_ BitVec 32) ValueCell!8000)) (size!24453 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49971)

(assert (=> b!867728 (= res!589304 (and (= (size!24453 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24452 _keys!868) (size!24453 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!867729 () Bool)

(declare-fun e!483441 () Bool)

(assert (=> b!867729 (= e!483441 true)))

(declare-datatypes ((tuple2!11184 0))(
  ( (tuple2!11185 (_1!5603 (_ BitVec 64)) (_2!5603 V!27553)) )
))
(declare-datatypes ((List!17010 0))(
  ( (Nil!17007) (Cons!17006 (h!18143 tuple2!11184) (t!24011 List!17010)) )
))
(declare-datatypes ((ListLongMap!9955 0))(
  ( (ListLongMap!9956 (toList!4993 List!17010)) )
))
(declare-fun lt!393855 () ListLongMap!9955)

(declare-fun lt!393848 () tuple2!11184)

(declare-fun lt!393843 () tuple2!11184)

(declare-fun lt!393842 () ListLongMap!9955)

(declare-fun +!2396 (ListLongMap!9955 tuple2!11184) ListLongMap!9955)

(assert (=> b!867729 (= lt!393855 (+!2396 (+!2396 lt!393842 lt!393848) lt!393843))))

(declare-fun v!557 () V!27553)

(declare-datatypes ((Unit!29722 0))(
  ( (Unit!29723) )
))
(declare-fun lt!393845 () Unit!29722)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lt!393856 () V!27553)

(declare-fun addCommutativeForDiffKeys!537 (ListLongMap!9955 (_ BitVec 64) V!27553 (_ BitVec 64) V!27553) Unit!29722)

(assert (=> b!867729 (= lt!393845 (addCommutativeForDiffKeys!537 lt!393842 k0!854 v!557 (select (arr!24011 _keys!868) from!1053) lt!393856))))

(declare-fun b!867730 () Bool)

(declare-fun res!589312 () Bool)

(assert (=> b!867730 (=> (not res!589312) (not e!483440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!867730 (= res!589312 (validMask!0 mask!1196))))

(declare-fun b!867731 () Bool)

(declare-fun e!483437 () Bool)

(assert (=> b!867731 (= e!483437 e!483441)))

(declare-fun res!589308 () Bool)

(assert (=> b!867731 (=> res!589308 e!483441)))

(assert (=> b!867731 (= res!589308 (= k0!854 (select (arr!24011 _keys!868) from!1053)))))

(assert (=> b!867731 (not (= (select (arr!24011 _keys!868) from!1053) k0!854))))

(declare-fun lt!393849 () Unit!29722)

(declare-fun e!483445 () Unit!29722)

(assert (=> b!867731 (= lt!393849 e!483445)))

(declare-fun c!92617 () Bool)

(assert (=> b!867731 (= c!92617 (= (select (arr!24011 _keys!868) from!1053) k0!854))))

(declare-fun lt!393851 () ListLongMap!9955)

(assert (=> b!867731 (= lt!393851 lt!393855)))

(declare-fun lt!393853 () ListLongMap!9955)

(assert (=> b!867731 (= lt!393855 (+!2396 lt!393853 lt!393848))))

(assert (=> b!867731 (= lt!393848 (tuple2!11185 (select (arr!24011 _keys!868) from!1053) lt!393856))))

(declare-fun defaultEntry!696 () Int)

(declare-fun get!12713 (ValueCell!8000 V!27553) V!27553)

(declare-fun dynLambda!1215 (Int (_ BitVec 64)) V!27553)

(assert (=> b!867731 (= lt!393856 (get!12713 (select (arr!24012 _values!688) from!1053) (dynLambda!1215 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!867732 () Bool)

(declare-fun e!483443 () Bool)

(declare-fun tp_is_empty!16879 () Bool)

(assert (=> b!867732 (= e!483443 tp_is_empty!16879)))

(declare-fun mapNonEmpty!26918 () Bool)

(declare-fun mapRes!26918 () Bool)

(declare-fun tp!51733 () Bool)

(declare-fun e!483442 () Bool)

(assert (=> mapNonEmpty!26918 (= mapRes!26918 (and tp!51733 e!483442))))

(declare-fun mapRest!26918 () (Array (_ BitVec 32) ValueCell!8000))

(declare-fun mapValue!26918 () ValueCell!8000)

(declare-fun mapKey!26918 () (_ BitVec 32))

(assert (=> mapNonEmpty!26918 (= (arr!24012 _values!688) (store mapRest!26918 mapKey!26918 mapValue!26918))))

(declare-fun b!867733 () Bool)

(declare-fun res!589307 () Bool)

(assert (=> b!867733 (=> (not res!589307) (not e!483440))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867733 (= res!589307 (validKeyInArray!0 k0!854))))

(declare-fun b!867734 () Bool)

(assert (=> b!867734 (= e!483442 tp_is_empty!16879)))

(declare-fun b!867735 () Bool)

(declare-fun res!589303 () Bool)

(assert (=> b!867735 (=> (not res!589303) (not e!483440))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!867735 (= res!589303 (and (= (select (arr!24011 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!867736 () Bool)

(declare-fun res!589306 () Bool)

(assert (=> b!867736 (=> (not res!589306) (not e!483440))))

(assert (=> b!867736 (= res!589306 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24452 _keys!868))))))

(declare-fun b!867737 () Bool)

(declare-fun e!483439 () Bool)

(assert (=> b!867737 (= e!483440 e!483439)))

(declare-fun res!589302 () Bool)

(assert (=> b!867737 (=> (not res!589302) (not e!483439))))

(assert (=> b!867737 (= res!589302 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!393854 () array!49971)

(declare-fun minValue!654 () V!27553)

(declare-fun zeroValue!654 () V!27553)

(declare-fun getCurrentListMapNoExtraKeys!3037 (array!49969 array!49971 (_ BitVec 32) (_ BitVec 32) V!27553 V!27553 (_ BitVec 32) Int) ListLongMap!9955)

(assert (=> b!867737 (= lt!393851 (getCurrentListMapNoExtraKeys!3037 _keys!868 lt!393854 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!867737 (= lt!393854 (array!49972 (store (arr!24012 _values!688) i!612 (ValueCellFull!8000 v!557)) (size!24453 _values!688)))))

(declare-fun lt!393844 () ListLongMap!9955)

(assert (=> b!867737 (= lt!393844 (getCurrentListMapNoExtraKeys!3037 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!867738 () Bool)

(assert (=> b!867738 (= e!483439 (not e!483437))))

(declare-fun res!589311 () Bool)

(assert (=> b!867738 (=> res!589311 e!483437)))

(assert (=> b!867738 (= res!589311 (not (validKeyInArray!0 (select (arr!24011 _keys!868) from!1053))))))

(declare-fun lt!393857 () ListLongMap!9955)

(assert (=> b!867738 (= lt!393857 lt!393853)))

(assert (=> b!867738 (= lt!393853 (+!2396 lt!393842 lt!393843))))

(assert (=> b!867738 (= lt!393857 (getCurrentListMapNoExtraKeys!3037 _keys!868 lt!393854 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!867738 (= lt!393843 (tuple2!11185 k0!854 v!557))))

(assert (=> b!867738 (= lt!393842 (getCurrentListMapNoExtraKeys!3037 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!393847 () Unit!29722)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!569 (array!49969 array!49971 (_ BitVec 32) (_ BitVec 32) V!27553 V!27553 (_ BitVec 32) (_ BitVec 64) V!27553 (_ BitVec 32) Int) Unit!29722)

(assert (=> b!867738 (= lt!393847 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!569 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!589310 () Bool)

(assert (=> start!73996 (=> (not res!589310) (not e!483440))))

(assert (=> start!73996 (= res!589310 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24452 _keys!868))))))

(assert (=> start!73996 e!483440))

(assert (=> start!73996 tp_is_empty!16879))

(assert (=> start!73996 true))

(assert (=> start!73996 tp!51734))

(declare-fun array_inv!19032 (array!49969) Bool)

(assert (=> start!73996 (array_inv!19032 _keys!868)))

(declare-fun e!483438 () Bool)

(declare-fun array_inv!19033 (array!49971) Bool)

(assert (=> start!73996 (and (array_inv!19033 _values!688) e!483438)))

(declare-fun b!867739 () Bool)

(declare-fun Unit!29724 () Unit!29722)

(assert (=> b!867739 (= e!483445 Unit!29724)))

(declare-fun lt!393846 () Unit!29722)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49969 (_ BitVec 32) (_ BitVec 32)) Unit!29722)

(assert (=> b!867739 (= lt!393846 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17011 0))(
  ( (Nil!17008) (Cons!17007 (h!18144 (_ BitVec 64)) (t!24012 List!17011)) )
))
(declare-fun arrayNoDuplicates!0 (array!49969 (_ BitVec 32) List!17011) Bool)

(assert (=> b!867739 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17008)))

(declare-fun lt!393850 () Unit!29722)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49969 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29722)

(assert (=> b!867739 (= lt!393850 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49969 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!867739 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!393852 () Unit!29722)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49969 (_ BitVec 64) (_ BitVec 32) List!17011) Unit!29722)

(assert (=> b!867739 (= lt!393852 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17008))))

(assert (=> b!867739 false))

(declare-fun b!867740 () Bool)

(declare-fun res!589305 () Bool)

(assert (=> b!867740 (=> (not res!589305) (not e!483440))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49969 (_ BitVec 32)) Bool)

(assert (=> b!867740 (= res!589305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!867741 () Bool)

(assert (=> b!867741 (= e!483438 (and e!483443 mapRes!26918))))

(declare-fun condMapEmpty!26918 () Bool)

(declare-fun mapDefault!26918 () ValueCell!8000)

(assert (=> b!867741 (= condMapEmpty!26918 (= (arr!24012 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8000)) mapDefault!26918)))))

(declare-fun b!867742 () Bool)

(declare-fun res!589309 () Bool)

(assert (=> b!867742 (=> (not res!589309) (not e!483440))))

(assert (=> b!867742 (= res!589309 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17008))))

(declare-fun b!867743 () Bool)

(declare-fun Unit!29725 () Unit!29722)

(assert (=> b!867743 (= e!483445 Unit!29725)))

(declare-fun mapIsEmpty!26918 () Bool)

(assert (=> mapIsEmpty!26918 mapRes!26918))

(assert (= (and start!73996 res!589310) b!867730))

(assert (= (and b!867730 res!589312) b!867728))

(assert (= (and b!867728 res!589304) b!867740))

(assert (= (and b!867740 res!589305) b!867742))

(assert (= (and b!867742 res!589309) b!867736))

(assert (= (and b!867736 res!589306) b!867733))

(assert (= (and b!867733 res!589307) b!867735))

(assert (= (and b!867735 res!589303) b!867737))

(assert (= (and b!867737 res!589302) b!867738))

(assert (= (and b!867738 (not res!589311)) b!867731))

(assert (= (and b!867731 c!92617) b!867739))

(assert (= (and b!867731 (not c!92617)) b!867743))

(assert (= (and b!867731 (not res!589308)) b!867729))

(assert (= (and b!867741 condMapEmpty!26918) mapIsEmpty!26918))

(assert (= (and b!867741 (not condMapEmpty!26918)) mapNonEmpty!26918))

(get-info :version)

(assert (= (and mapNonEmpty!26918 ((_ is ValueCellFull!8000) mapValue!26918)) b!867734))

(assert (= (and b!867741 ((_ is ValueCellFull!8000) mapDefault!26918)) b!867732))

(assert (= start!73996 b!867741))

(declare-fun b_lambda!12109 () Bool)

(assert (=> (not b_lambda!12109) (not b!867731)))

(declare-fun t!24010 () Bool)

(declare-fun tb!4857 () Bool)

(assert (=> (and start!73996 (= defaultEntry!696 defaultEntry!696) t!24010) tb!4857))

(declare-fun result!9333 () Bool)

(assert (=> tb!4857 (= result!9333 tp_is_empty!16879)))

(assert (=> b!867731 t!24010))

(declare-fun b_and!24477 () Bool)

(assert (= b_and!24475 (and (=> t!24010 result!9333) b_and!24477)))

(declare-fun m!809837 () Bool)

(assert (=> b!867738 m!809837))

(declare-fun m!809839 () Bool)

(assert (=> b!867738 m!809839))

(declare-fun m!809841 () Bool)

(assert (=> b!867738 m!809841))

(declare-fun m!809843 () Bool)

(assert (=> b!867738 m!809843))

(assert (=> b!867738 m!809841))

(declare-fun m!809845 () Bool)

(assert (=> b!867738 m!809845))

(declare-fun m!809847 () Bool)

(assert (=> b!867738 m!809847))

(declare-fun m!809849 () Bool)

(assert (=> b!867735 m!809849))

(declare-fun m!809851 () Bool)

(assert (=> b!867742 m!809851))

(declare-fun m!809853 () Bool)

(assert (=> b!867731 m!809853))

(declare-fun m!809855 () Bool)

(assert (=> b!867731 m!809855))

(declare-fun m!809857 () Bool)

(assert (=> b!867731 m!809857))

(declare-fun m!809859 () Bool)

(assert (=> b!867731 m!809859))

(assert (=> b!867731 m!809855))

(assert (=> b!867731 m!809841))

(assert (=> b!867731 m!809857))

(declare-fun m!809861 () Bool)

(assert (=> start!73996 m!809861))

(declare-fun m!809863 () Bool)

(assert (=> start!73996 m!809863))

(declare-fun m!809865 () Bool)

(assert (=> b!867740 m!809865))

(declare-fun m!809867 () Bool)

(assert (=> mapNonEmpty!26918 m!809867))

(declare-fun m!809869 () Bool)

(assert (=> b!867737 m!809869))

(declare-fun m!809871 () Bool)

(assert (=> b!867737 m!809871))

(declare-fun m!809873 () Bool)

(assert (=> b!867737 m!809873))

(declare-fun m!809875 () Bool)

(assert (=> b!867733 m!809875))

(declare-fun m!809877 () Bool)

(assert (=> b!867739 m!809877))

(declare-fun m!809879 () Bool)

(assert (=> b!867739 m!809879))

(declare-fun m!809881 () Bool)

(assert (=> b!867739 m!809881))

(declare-fun m!809883 () Bool)

(assert (=> b!867739 m!809883))

(declare-fun m!809885 () Bool)

(assert (=> b!867739 m!809885))

(declare-fun m!809887 () Bool)

(assert (=> b!867729 m!809887))

(assert (=> b!867729 m!809887))

(declare-fun m!809889 () Bool)

(assert (=> b!867729 m!809889))

(assert (=> b!867729 m!809841))

(assert (=> b!867729 m!809841))

(declare-fun m!809891 () Bool)

(assert (=> b!867729 m!809891))

(declare-fun m!809893 () Bool)

(assert (=> b!867730 m!809893))

(check-sat (not b!867740) (not b!867730) (not mapNonEmpty!26918) (not b!867733) b_and!24477 (not b!867738) (not start!73996) (not b_lambda!12109) tp_is_empty!16879 (not b!867729) (not b_next!14743) (not b!867737) (not b!867731) (not b!867739) (not b!867742))
(check-sat b_and!24477 (not b_next!14743))
