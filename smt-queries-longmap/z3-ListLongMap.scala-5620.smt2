; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73672 () Bool)

(assert start!73672)

(declare-fun b_free!14419 () Bool)

(declare-fun b_next!14419 () Bool)

(assert (=> start!73672 (= b_free!14419 (not b_next!14419))))

(declare-fun tp!50761 () Bool)

(declare-fun b_and!23827 () Bool)

(assert (=> start!73672 (= tp!50761 b_and!23827)))

(declare-fun b!859705 () Bool)

(declare-fun res!583808 () Bool)

(declare-fun e!479188 () Bool)

(assert (=> b!859705 (=> (not res!583808) (not e!479188))))

(declare-datatypes ((array!49339 0))(
  ( (array!49340 (arr!23696 (Array (_ BitVec 32) (_ BitVec 64))) (size!24137 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49339)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49339 (_ BitVec 32)) Bool)

(assert (=> b!859705 (= res!583808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!859706 () Bool)

(declare-fun e!479187 () Bool)

(declare-fun e!479189 () Bool)

(assert (=> b!859706 (= e!479187 (not e!479189))))

(declare-fun res!583813 () Bool)

(assert (=> b!859706 (=> res!583813 e!479189)))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!859706 (= res!583813 (not (validKeyInArray!0 (select (arr!23696 _keys!868) from!1053))))))

(declare-datatypes ((V!27121 0))(
  ( (V!27122 (val!8325 Int)) )
))
(declare-datatypes ((tuple2!10916 0))(
  ( (tuple2!10917 (_1!5469 (_ BitVec 64)) (_2!5469 V!27121)) )
))
(declare-datatypes ((List!16755 0))(
  ( (Nil!16752) (Cons!16751 (h!17888 tuple2!10916) (t!23432 List!16755)) )
))
(declare-datatypes ((ListLongMap!9687 0))(
  ( (ListLongMap!9688 (toList!4859 List!16755)) )
))
(declare-fun lt!387277 () ListLongMap!9687)

(declare-fun lt!387276 () ListLongMap!9687)

(assert (=> b!859706 (= lt!387277 lt!387276)))

(declare-fun v!557 () V!27121)

(declare-fun lt!387279 () ListLongMap!9687)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2265 (ListLongMap!9687 tuple2!10916) ListLongMap!9687)

(assert (=> b!859706 (= lt!387276 (+!2265 lt!387279 (tuple2!10917 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!7838 0))(
  ( (ValueCellFull!7838 (v!10750 V!27121)) (EmptyCell!7838) )
))
(declare-datatypes ((array!49341 0))(
  ( (array!49342 (arr!23697 (Array (_ BitVec 32) ValueCell!7838)) (size!24138 (_ BitVec 32))) )
))
(declare-fun lt!387274 () array!49341)

(declare-fun minValue!654 () V!27121)

(declare-fun zeroValue!654 () V!27121)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2915 (array!49339 array!49341 (_ BitVec 32) (_ BitVec 32) V!27121 V!27121 (_ BitVec 32) Int) ListLongMap!9687)

(assert (=> b!859706 (= lt!387277 (getCurrentListMapNoExtraKeys!2915 _keys!868 lt!387274 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!49341)

(assert (=> b!859706 (= lt!387279 (getCurrentListMapNoExtraKeys!2915 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29282 0))(
  ( (Unit!29283) )
))
(declare-fun lt!387280 () Unit!29282)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!461 (array!49339 array!49341 (_ BitVec 32) (_ BitVec 32) V!27121 V!27121 (_ BitVec 32) (_ BitVec 64) V!27121 (_ BitVec 32) Int) Unit!29282)

(assert (=> b!859706 (= lt!387280 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!461 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!859707 () Bool)

(declare-fun res!583803 () Bool)

(assert (=> b!859707 (=> (not res!583803) (not e!479188))))

(assert (=> b!859707 (= res!583803 (and (= (size!24138 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24137 _keys!868) (size!24138 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!859708 () Bool)

(declare-fun e!479192 () Bool)

(assert (=> b!859708 (= e!479192 true)))

(declare-datatypes ((List!16756 0))(
  ( (Nil!16753) (Cons!16752 (h!17889 (_ BitVec 64)) (t!23433 List!16756)) )
))
(declare-fun arrayNoDuplicates!0 (array!49339 (_ BitVec 32) List!16756) Bool)

(assert (=> b!859708 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16753)))

(declare-fun lt!387281 () Unit!29282)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49339 (_ BitVec 32) (_ BitVec 32)) Unit!29282)

(assert (=> b!859708 (= lt!387281 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!859709 () Bool)

(declare-fun res!583811 () Bool)

(assert (=> b!859709 (=> (not res!583811) (not e!479188))))

(assert (=> b!859709 (= res!583811 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16753))))

(declare-fun b!859710 () Bool)

(declare-fun e!479194 () Bool)

(declare-fun e!479193 () Bool)

(declare-fun mapRes!26432 () Bool)

(assert (=> b!859710 (= e!479194 (and e!479193 mapRes!26432))))

(declare-fun condMapEmpty!26432 () Bool)

(declare-fun mapDefault!26432 () ValueCell!7838)

(assert (=> b!859710 (= condMapEmpty!26432 (= (arr!23697 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7838)) mapDefault!26432)))))

(declare-fun b!859711 () Bool)

(declare-fun res!583812 () Bool)

(assert (=> b!859711 (=> (not res!583812) (not e!479188))))

(assert (=> b!859711 (= res!583812 (and (= (select (arr!23696 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!859712 () Bool)

(declare-fun res!583807 () Bool)

(assert (=> b!859712 (=> (not res!583807) (not e!479188))))

(assert (=> b!859712 (= res!583807 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24137 _keys!868))))))

(declare-fun mapIsEmpty!26432 () Bool)

(assert (=> mapIsEmpty!26432 mapRes!26432))

(declare-fun b!859713 () Bool)

(declare-fun tp_is_empty!16555 () Bool)

(assert (=> b!859713 (= e!479193 tp_is_empty!16555)))

(declare-fun b!859714 () Bool)

(declare-fun res!583804 () Bool)

(assert (=> b!859714 (=> (not res!583804) (not e!479188))))

(assert (=> b!859714 (= res!583804 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!26432 () Bool)

(declare-fun tp!50762 () Bool)

(declare-fun e!479190 () Bool)

(assert (=> mapNonEmpty!26432 (= mapRes!26432 (and tp!50762 e!479190))))

(declare-fun mapKey!26432 () (_ BitVec 32))

(declare-fun mapValue!26432 () ValueCell!7838)

(declare-fun mapRest!26432 () (Array (_ BitVec 32) ValueCell!7838))

(assert (=> mapNonEmpty!26432 (= (arr!23697 _values!688) (store mapRest!26432 mapKey!26432 mapValue!26432))))

(declare-fun b!859715 () Bool)

(assert (=> b!859715 (= e!479188 e!479187)))

(declare-fun res!583809 () Bool)

(assert (=> b!859715 (=> (not res!583809) (not e!479187))))

(assert (=> b!859715 (= res!583809 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!387278 () ListLongMap!9687)

(assert (=> b!859715 (= lt!387278 (getCurrentListMapNoExtraKeys!2915 _keys!868 lt!387274 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!859715 (= lt!387274 (array!49342 (store (arr!23697 _values!688) i!612 (ValueCellFull!7838 v!557)) (size!24138 _values!688)))))

(declare-fun lt!387275 () ListLongMap!9687)

(assert (=> b!859715 (= lt!387275 (getCurrentListMapNoExtraKeys!2915 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!859716 () Bool)

(declare-fun res!583810 () Bool)

(assert (=> b!859716 (=> (not res!583810) (not e!479188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!859716 (= res!583810 (validMask!0 mask!1196))))

(declare-fun b!859717 () Bool)

(assert (=> b!859717 (= e!479190 tp_is_empty!16555)))

(declare-fun b!859718 () Bool)

(assert (=> b!859718 (= e!479189 e!479192)))

(declare-fun res!583806 () Bool)

(assert (=> b!859718 (=> res!583806 e!479192)))

(assert (=> b!859718 (= res!583806 (not (= (select (arr!23696 _keys!868) from!1053) k0!854)))))

(declare-fun get!12489 (ValueCell!7838 V!27121) V!27121)

(declare-fun dynLambda!1099 (Int (_ BitVec 64)) V!27121)

(assert (=> b!859718 (= lt!387278 (+!2265 lt!387276 (tuple2!10917 (select (arr!23696 _keys!868) from!1053) (get!12489 (select (arr!23697 _values!688) from!1053) (dynLambda!1099 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!583805 () Bool)

(assert (=> start!73672 (=> (not res!583805) (not e!479188))))

(assert (=> start!73672 (= res!583805 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24137 _keys!868))))))

(assert (=> start!73672 e!479188))

(assert (=> start!73672 tp_is_empty!16555))

(assert (=> start!73672 true))

(assert (=> start!73672 tp!50761))

(declare-fun array_inv!18810 (array!49339) Bool)

(assert (=> start!73672 (array_inv!18810 _keys!868)))

(declare-fun array_inv!18811 (array!49341) Bool)

(assert (=> start!73672 (and (array_inv!18811 _values!688) e!479194)))

(assert (= (and start!73672 res!583805) b!859716))

(assert (= (and b!859716 res!583810) b!859707))

(assert (= (and b!859707 res!583803) b!859705))

(assert (= (and b!859705 res!583808) b!859709))

(assert (= (and b!859709 res!583811) b!859712))

(assert (= (and b!859712 res!583807) b!859714))

(assert (= (and b!859714 res!583804) b!859711))

(assert (= (and b!859711 res!583812) b!859715))

(assert (= (and b!859715 res!583809) b!859706))

(assert (= (and b!859706 (not res!583813)) b!859718))

(assert (= (and b!859718 (not res!583806)) b!859708))

(assert (= (and b!859710 condMapEmpty!26432) mapIsEmpty!26432))

(assert (= (and b!859710 (not condMapEmpty!26432)) mapNonEmpty!26432))

(get-info :version)

(assert (= (and mapNonEmpty!26432 ((_ is ValueCellFull!7838) mapValue!26432)) b!859717))

(assert (= (and b!859710 ((_ is ValueCellFull!7838) mapDefault!26432)) b!859713))

(assert (= start!73672 b!859710))

(declare-fun b_lambda!11785 () Bool)

(assert (=> (not b_lambda!11785) (not b!859718)))

(declare-fun t!23431 () Bool)

(declare-fun tb!4533 () Bool)

(assert (=> (and start!73672 (= defaultEntry!696 defaultEntry!696) t!23431) tb!4533))

(declare-fun result!8685 () Bool)

(assert (=> tb!4533 (= result!8685 tp_is_empty!16555)))

(assert (=> b!859718 t!23431))

(declare-fun b_and!23829 () Bool)

(assert (= b_and!23827 (and (=> t!23431 result!8685) b_and!23829)))

(declare-fun m!800819 () Bool)

(assert (=> b!859708 m!800819))

(declare-fun m!800821 () Bool)

(assert (=> b!859708 m!800821))

(declare-fun m!800823 () Bool)

(assert (=> b!859705 m!800823))

(declare-fun m!800825 () Bool)

(assert (=> b!859718 m!800825))

(declare-fun m!800827 () Bool)

(assert (=> b!859718 m!800827))

(declare-fun m!800829 () Bool)

(assert (=> b!859718 m!800829))

(declare-fun m!800831 () Bool)

(assert (=> b!859718 m!800831))

(assert (=> b!859718 m!800827))

(declare-fun m!800833 () Bool)

(assert (=> b!859718 m!800833))

(assert (=> b!859718 m!800829))

(declare-fun m!800835 () Bool)

(assert (=> b!859706 m!800835))

(declare-fun m!800837 () Bool)

(assert (=> b!859706 m!800837))

(assert (=> b!859706 m!800833))

(declare-fun m!800839 () Bool)

(assert (=> b!859706 m!800839))

(assert (=> b!859706 m!800833))

(declare-fun m!800841 () Bool)

(assert (=> b!859706 m!800841))

(declare-fun m!800843 () Bool)

(assert (=> b!859706 m!800843))

(declare-fun m!800845 () Bool)

(assert (=> b!859709 m!800845))

(declare-fun m!800847 () Bool)

(assert (=> b!859716 m!800847))

(declare-fun m!800849 () Bool)

(assert (=> mapNonEmpty!26432 m!800849))

(declare-fun m!800851 () Bool)

(assert (=> start!73672 m!800851))

(declare-fun m!800853 () Bool)

(assert (=> start!73672 m!800853))

(declare-fun m!800855 () Bool)

(assert (=> b!859711 m!800855))

(declare-fun m!800857 () Bool)

(assert (=> b!859715 m!800857))

(declare-fun m!800859 () Bool)

(assert (=> b!859715 m!800859))

(declare-fun m!800861 () Bool)

(assert (=> b!859715 m!800861))

(declare-fun m!800863 () Bool)

(assert (=> b!859714 m!800863))

(check-sat (not b!859715) (not b_lambda!11785) (not start!73672) (not b!859714) (not mapNonEmpty!26432) (not b!859705) (not b_next!14419) (not b!859709) b_and!23829 (not b!859718) (not b!859706) tp_is_empty!16555 (not b!859708) (not b!859716))
(check-sat b_and!23829 (not b_next!14419))
