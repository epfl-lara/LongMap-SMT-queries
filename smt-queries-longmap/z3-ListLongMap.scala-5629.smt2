; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73540 () Bool)

(assert start!73540)

(declare-fun b_free!14473 () Bool)

(declare-fun b_next!14473 () Bool)

(assert (=> start!73540 (= b_free!14473 (not b_next!14473))))

(declare-fun tp!50924 () Bool)

(declare-fun b_and!23899 () Bool)

(assert (=> start!73540 (= tp!50924 b_and!23899)))

(declare-fun b!859892 () Bool)

(declare-fun res!584381 () Bool)

(declare-fun e!479153 () Bool)

(assert (=> b!859892 (=> (not res!584381) (not e!479153))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!859892 (= res!584381 (validMask!0 mask!1196))))

(declare-fun b!859893 () Bool)

(declare-fun e!479160 () Bool)

(declare-fun e!479159 () Bool)

(assert (=> b!859893 (= e!479160 e!479159)))

(declare-fun res!584391 () Bool)

(assert (=> b!859893 (=> res!584391 e!479159)))

(declare-datatypes ((array!49377 0))(
  ( (array!49378 (arr!23720 (Array (_ BitVec 32) (_ BitVec 64))) (size!24162 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49377)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!859893 (= res!584391 (or (bvsge (size!24162 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24162 _keys!868)) (bvsge from!1053 (size!24162 _keys!868))))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!49377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!859893 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29245 0))(
  ( (Unit!29246) )
))
(declare-fun lt!387421 () Unit!29245)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49377 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29245)

(assert (=> b!859893 (= lt!387421 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-datatypes ((List!16840 0))(
  ( (Nil!16837) (Cons!16836 (h!17967 (_ BitVec 64)) (t!23570 List!16840)) )
))
(declare-fun arrayNoDuplicates!0 (array!49377 (_ BitVec 32) List!16840) Bool)

(assert (=> b!859893 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16837)))

(declare-fun lt!387425 () Unit!29245)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49377 (_ BitVec 32) (_ BitVec 32)) Unit!29245)

(assert (=> b!859893 (= lt!387425 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!859894 () Bool)

(declare-fun res!584384 () Bool)

(assert (=> b!859894 (=> res!584384 e!479159)))

(declare-fun noDuplicate!1316 (List!16840) Bool)

(assert (=> b!859894 (= res!584384 (not (noDuplicate!1316 Nil!16837)))))

(declare-fun b!859895 () Bool)

(declare-fun res!584393 () Bool)

(assert (=> b!859895 (=> (not res!584393) (not e!479153))))

(assert (=> b!859895 (= res!584393 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24162 _keys!868))))))

(declare-fun res!584386 () Bool)

(assert (=> start!73540 (=> (not res!584386) (not e!479153))))

(assert (=> start!73540 (= res!584386 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24162 _keys!868))))))

(assert (=> start!73540 e!479153))

(declare-fun tp_is_empty!16609 () Bool)

(assert (=> start!73540 tp_is_empty!16609))

(assert (=> start!73540 true))

(assert (=> start!73540 tp!50924))

(declare-fun array_inv!18842 (array!49377) Bool)

(assert (=> start!73540 (array_inv!18842 _keys!868)))

(declare-datatypes ((V!27193 0))(
  ( (V!27194 (val!8352 Int)) )
))
(declare-datatypes ((ValueCell!7865 0))(
  ( (ValueCellFull!7865 (v!10771 V!27193)) (EmptyCell!7865) )
))
(declare-datatypes ((array!49379 0))(
  ( (array!49380 (arr!23721 (Array (_ BitVec 32) ValueCell!7865)) (size!24163 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49379)

(declare-fun e!479156 () Bool)

(declare-fun array_inv!18843 (array!49379) Bool)

(assert (=> start!73540 (and (array_inv!18843 _values!688) e!479156)))

(declare-fun b!859896 () Bool)

(declare-fun res!584385 () Bool)

(assert (=> b!859896 (=> (not res!584385) (not e!479153))))

(assert (=> b!859896 (= res!584385 (and (= (select (arr!23720 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!26513 () Bool)

(declare-fun mapRes!26513 () Bool)

(assert (=> mapIsEmpty!26513 mapRes!26513))

(declare-fun mapNonEmpty!26513 () Bool)

(declare-fun tp!50923 () Bool)

(declare-fun e!479155 () Bool)

(assert (=> mapNonEmpty!26513 (= mapRes!26513 (and tp!50923 e!479155))))

(declare-fun mapRest!26513 () (Array (_ BitVec 32) ValueCell!7865))

(declare-fun mapKey!26513 () (_ BitVec 32))

(declare-fun mapValue!26513 () ValueCell!7865)

(assert (=> mapNonEmpty!26513 (= (arr!23721 _values!688) (store mapRest!26513 mapKey!26513 mapValue!26513))))

(declare-fun b!859897 () Bool)

(declare-fun e!479154 () Bool)

(declare-fun e!479152 () Bool)

(assert (=> b!859897 (= e!479154 (not e!479152))))

(declare-fun res!584388 () Bool)

(assert (=> b!859897 (=> res!584388 e!479152)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!859897 (= res!584388 (not (validKeyInArray!0 (select (arr!23720 _keys!868) from!1053))))))

(declare-datatypes ((tuple2!11038 0))(
  ( (tuple2!11039 (_1!5530 (_ BitVec 64)) (_2!5530 V!27193)) )
))
(declare-datatypes ((List!16841 0))(
  ( (Nil!16838) (Cons!16837 (h!17968 tuple2!11038) (t!23571 List!16841)) )
))
(declare-datatypes ((ListLongMap!9797 0))(
  ( (ListLongMap!9798 (toList!4914 List!16841)) )
))
(declare-fun lt!387424 () ListLongMap!9797)

(declare-fun lt!387420 () ListLongMap!9797)

(assert (=> b!859897 (= lt!387424 lt!387420)))

(declare-fun v!557 () V!27193)

(declare-fun lt!387422 () ListLongMap!9797)

(declare-fun +!2288 (ListLongMap!9797 tuple2!11038) ListLongMap!9797)

(assert (=> b!859897 (= lt!387420 (+!2288 lt!387422 (tuple2!11039 k0!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!387427 () array!49379)

(declare-fun minValue!654 () V!27193)

(declare-fun zeroValue!654 () V!27193)

(declare-fun getCurrentListMapNoExtraKeys!2918 (array!49377 array!49379 (_ BitVec 32) (_ BitVec 32) V!27193 V!27193 (_ BitVec 32) Int) ListLongMap!9797)

(assert (=> b!859897 (= lt!387424 (getCurrentListMapNoExtraKeys!2918 _keys!868 lt!387427 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!859897 (= lt!387422 (getCurrentListMapNoExtraKeys!2918 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!387423 () Unit!29245)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!480 (array!49377 array!49379 (_ BitVec 32) (_ BitVec 32) V!27193 V!27193 (_ BitVec 32) (_ BitVec 64) V!27193 (_ BitVec 32) Int) Unit!29245)

(assert (=> b!859897 (= lt!387423 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!480 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!859898 () Bool)

(declare-fun res!584394 () Bool)

(assert (=> b!859898 (=> (not res!584394) (not e!479153))))

(assert (=> b!859898 (= res!584394 (and (= (size!24163 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24162 _keys!868) (size!24163 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!859899 () Bool)

(declare-fun res!584392 () Bool)

(assert (=> b!859899 (=> (not res!584392) (not e!479153))))

(assert (=> b!859899 (= res!584392 (validKeyInArray!0 k0!854))))

(declare-fun b!859900 () Bool)

(declare-fun res!584382 () Bool)

(assert (=> b!859900 (=> res!584382 e!479159)))

(declare-fun contains!4208 (List!16840 (_ BitVec 64)) Bool)

(assert (=> b!859900 (= res!584382 (contains!4208 Nil!16837 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!859901 () Bool)

(assert (=> b!859901 (= e!479159 true)))

(declare-fun lt!387419 () Bool)

(assert (=> b!859901 (= lt!387419 (contains!4208 Nil!16837 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!859902 () Bool)

(assert (=> b!859902 (= e!479152 e!479160)))

(declare-fun res!584390 () Bool)

(assert (=> b!859902 (=> res!584390 e!479160)))

(assert (=> b!859902 (= res!584390 (not (= (select (arr!23720 _keys!868) from!1053) k0!854)))))

(declare-fun lt!387428 () ListLongMap!9797)

(declare-fun get!12509 (ValueCell!7865 V!27193) V!27193)

(declare-fun dynLambda!1104 (Int (_ BitVec 64)) V!27193)

(assert (=> b!859902 (= lt!387428 (+!2288 lt!387420 (tuple2!11039 (select (arr!23720 _keys!868) from!1053) (get!12509 (select (arr!23721 _values!688) from!1053) (dynLambda!1104 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!859903 () Bool)

(declare-fun e!479158 () Bool)

(assert (=> b!859903 (= e!479156 (and e!479158 mapRes!26513))))

(declare-fun condMapEmpty!26513 () Bool)

(declare-fun mapDefault!26513 () ValueCell!7865)

(assert (=> b!859903 (= condMapEmpty!26513 (= (arr!23721 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7865)) mapDefault!26513)))))

(declare-fun b!859904 () Bool)

(assert (=> b!859904 (= e!479153 e!479154)))

(declare-fun res!584387 () Bool)

(assert (=> b!859904 (=> (not res!584387) (not e!479154))))

(assert (=> b!859904 (= res!584387 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!859904 (= lt!387428 (getCurrentListMapNoExtraKeys!2918 _keys!868 lt!387427 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!859904 (= lt!387427 (array!49380 (store (arr!23721 _values!688) i!612 (ValueCellFull!7865 v!557)) (size!24163 _values!688)))))

(declare-fun lt!387426 () ListLongMap!9797)

(assert (=> b!859904 (= lt!387426 (getCurrentListMapNoExtraKeys!2918 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!859905 () Bool)

(declare-fun res!584383 () Bool)

(assert (=> b!859905 (=> (not res!584383) (not e!479153))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49377 (_ BitVec 32)) Bool)

(assert (=> b!859905 (= res!584383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!859906 () Bool)

(assert (=> b!859906 (= e!479155 tp_is_empty!16609)))

(declare-fun b!859907 () Bool)

(assert (=> b!859907 (= e!479158 tp_is_empty!16609)))

(declare-fun b!859908 () Bool)

(declare-fun res!584389 () Bool)

(assert (=> b!859908 (=> (not res!584389) (not e!479153))))

(assert (=> b!859908 (= res!584389 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16837))))

(assert (= (and start!73540 res!584386) b!859892))

(assert (= (and b!859892 res!584381) b!859898))

(assert (= (and b!859898 res!584394) b!859905))

(assert (= (and b!859905 res!584383) b!859908))

(assert (= (and b!859908 res!584389) b!859895))

(assert (= (and b!859895 res!584393) b!859899))

(assert (= (and b!859899 res!584392) b!859896))

(assert (= (and b!859896 res!584385) b!859904))

(assert (= (and b!859904 res!584387) b!859897))

(assert (= (and b!859897 (not res!584388)) b!859902))

(assert (= (and b!859902 (not res!584390)) b!859893))

(assert (= (and b!859893 (not res!584391)) b!859894))

(assert (= (and b!859894 (not res!584384)) b!859900))

(assert (= (and b!859900 (not res!584382)) b!859901))

(assert (= (and b!859903 condMapEmpty!26513) mapIsEmpty!26513))

(assert (= (and b!859903 (not condMapEmpty!26513)) mapNonEmpty!26513))

(get-info :version)

(assert (= (and mapNonEmpty!26513 ((_ is ValueCellFull!7865) mapValue!26513)) b!859906))

(assert (= (and b!859903 ((_ is ValueCellFull!7865) mapDefault!26513)) b!859907))

(assert (= start!73540 b!859903))

(declare-fun b_lambda!11807 () Bool)

(assert (=> (not b_lambda!11807) (not b!859902)))

(declare-fun t!23569 () Bool)

(declare-fun tb!4587 () Bool)

(assert (=> (and start!73540 (= defaultEntry!696 defaultEntry!696) t!23569) tb!4587))

(declare-fun result!8793 () Bool)

(assert (=> tb!4587 (= result!8793 tp_is_empty!16609)))

(assert (=> b!859902 t!23569))

(declare-fun b_and!23901 () Bool)

(assert (= b_and!23899 (and (=> t!23569 result!8793) b_and!23901)))

(declare-fun m!800163 () Bool)

(assert (=> b!859901 m!800163))

(declare-fun m!800165 () Bool)

(assert (=> b!859897 m!800165))

(declare-fun m!800167 () Bool)

(assert (=> b!859897 m!800167))

(declare-fun m!800169 () Bool)

(assert (=> b!859897 m!800169))

(declare-fun m!800171 () Bool)

(assert (=> b!859897 m!800171))

(assert (=> b!859897 m!800169))

(declare-fun m!800173 () Bool)

(assert (=> b!859897 m!800173))

(declare-fun m!800175 () Bool)

(assert (=> b!859897 m!800175))

(declare-fun m!800177 () Bool)

(assert (=> b!859899 m!800177))

(declare-fun m!800179 () Bool)

(assert (=> b!859905 m!800179))

(declare-fun m!800181 () Bool)

(assert (=> b!859908 m!800181))

(declare-fun m!800183 () Bool)

(assert (=> b!859902 m!800183))

(declare-fun m!800185 () Bool)

(assert (=> b!859902 m!800185))

(declare-fun m!800187 () Bool)

(assert (=> b!859902 m!800187))

(declare-fun m!800189 () Bool)

(assert (=> b!859902 m!800189))

(assert (=> b!859902 m!800185))

(assert (=> b!859902 m!800169))

(assert (=> b!859902 m!800187))

(declare-fun m!800191 () Bool)

(assert (=> b!859900 m!800191))

(declare-fun m!800193 () Bool)

(assert (=> mapNonEmpty!26513 m!800193))

(declare-fun m!800195 () Bool)

(assert (=> b!859896 m!800195))

(declare-fun m!800197 () Bool)

(assert (=> b!859894 m!800197))

(declare-fun m!800199 () Bool)

(assert (=> start!73540 m!800199))

(declare-fun m!800201 () Bool)

(assert (=> start!73540 m!800201))

(declare-fun m!800203 () Bool)

(assert (=> b!859904 m!800203))

(declare-fun m!800205 () Bool)

(assert (=> b!859904 m!800205))

(declare-fun m!800207 () Bool)

(assert (=> b!859904 m!800207))

(declare-fun m!800209 () Bool)

(assert (=> b!859893 m!800209))

(declare-fun m!800211 () Bool)

(assert (=> b!859893 m!800211))

(declare-fun m!800213 () Bool)

(assert (=> b!859893 m!800213))

(declare-fun m!800215 () Bool)

(assert (=> b!859893 m!800215))

(declare-fun m!800217 () Bool)

(assert (=> b!859892 m!800217))

(check-sat (not b!859892) (not mapNonEmpty!26513) (not b_lambda!11807) (not b!859899) tp_is_empty!16609 (not b!859905) (not b_next!14473) (not start!73540) (not b!859901) (not b!859902) (not b!859894) (not b!859893) (not b!859897) (not b!859908) (not b!859900) b_and!23901 (not b!859904))
(check-sat b_and!23901 (not b_next!14473))
