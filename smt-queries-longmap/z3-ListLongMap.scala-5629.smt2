; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73560 () Bool)

(assert start!73560)

(declare-fun b_free!14475 () Bool)

(declare-fun b_next!14475 () Bool)

(assert (=> start!73560 (= b_free!14475 (not b_next!14475))))

(declare-fun tp!50928 () Bool)

(declare-fun b_and!23929 () Bool)

(assert (=> start!73560 (= tp!50928 b_and!23929)))

(declare-fun b!860184 () Bool)

(declare-fun res!584546 () Bool)

(declare-fun e!479335 () Bool)

(assert (=> b!860184 (=> res!584546 e!479335)))

(declare-datatypes ((List!16845 0))(
  ( (Nil!16842) (Cons!16841 (h!17972 (_ BitVec 64)) (t!23586 List!16845)) )
))
(declare-fun noDuplicate!1312 (List!16845) Bool)

(assert (=> b!860184 (= res!584546 (not (noDuplicate!1312 Nil!16842)))))

(declare-fun mapNonEmpty!26516 () Bool)

(declare-fun mapRes!26516 () Bool)

(declare-fun tp!50929 () Bool)

(declare-fun e!479332 () Bool)

(assert (=> mapNonEmpty!26516 (= mapRes!26516 (and tp!50929 e!479332))))

(declare-datatypes ((V!27195 0))(
  ( (V!27196 (val!8353 Int)) )
))
(declare-datatypes ((ValueCell!7866 0))(
  ( (ValueCellFull!7866 (v!10778 V!27195)) (EmptyCell!7866) )
))
(declare-fun mapRest!26516 () (Array (_ BitVec 32) ValueCell!7866))

(declare-fun mapKey!26516 () (_ BitVec 32))

(declare-datatypes ((array!49398 0))(
  ( (array!49399 (arr!23730 (Array (_ BitVec 32) ValueCell!7866)) (size!24170 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49398)

(declare-fun mapValue!26516 () ValueCell!7866)

(assert (=> mapNonEmpty!26516 (= (arr!23730 _values!688) (store mapRest!26516 mapKey!26516 mapValue!26516))))

(declare-fun res!584543 () Bool)

(declare-fun e!479331 () Bool)

(assert (=> start!73560 (=> (not res!584543) (not e!479331))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49400 0))(
  ( (array!49401 (arr!23731 (Array (_ BitVec 32) (_ BitVec 64))) (size!24171 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49400)

(assert (=> start!73560 (= res!584543 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24171 _keys!868))))))

(assert (=> start!73560 e!479331))

(declare-fun tp_is_empty!16611 () Bool)

(assert (=> start!73560 tp_is_empty!16611))

(assert (=> start!73560 true))

(assert (=> start!73560 tp!50928))

(declare-fun array_inv!18784 (array!49400) Bool)

(assert (=> start!73560 (array_inv!18784 _keys!868)))

(declare-fun e!479327 () Bool)

(declare-fun array_inv!18785 (array!49398) Bool)

(assert (=> start!73560 (and (array_inv!18785 _values!688) e!479327)))

(declare-fun b!860185 () Bool)

(declare-fun res!584536 () Bool)

(assert (=> b!860185 (=> (not res!584536) (not e!479331))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!860185 (= res!584536 (validKeyInArray!0 k0!854))))

(declare-fun b!860186 () Bool)

(assert (=> b!860186 (= e!479332 tp_is_empty!16611)))

(declare-fun mapIsEmpty!26516 () Bool)

(assert (=> mapIsEmpty!26516 mapRes!26516))

(declare-fun b!860187 () Bool)

(declare-fun res!584540 () Bool)

(assert (=> b!860187 (=> (not res!584540) (not e!479331))))

(declare-fun arrayNoDuplicates!0 (array!49400 (_ BitVec 32) List!16845) Bool)

(assert (=> b!860187 (= res!584540 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16842))))

(declare-fun b!860188 () Bool)

(declare-fun res!584534 () Bool)

(assert (=> b!860188 (=> (not res!584534) (not e!479331))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!860188 (= res!584534 (validMask!0 mask!1196))))

(declare-fun b!860189 () Bool)

(declare-fun e!479329 () Bool)

(assert (=> b!860189 (= e!479331 e!479329)))

(declare-fun res!584537 () Bool)

(assert (=> b!860189 (=> (not res!584537) (not e!479329))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!860189 (= res!584537 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((tuple2!11038 0))(
  ( (tuple2!11039 (_1!5530 (_ BitVec 64)) (_2!5530 V!27195)) )
))
(declare-datatypes ((List!16846 0))(
  ( (Nil!16843) (Cons!16842 (h!17973 tuple2!11038) (t!23587 List!16846)) )
))
(declare-datatypes ((ListLongMap!9807 0))(
  ( (ListLongMap!9808 (toList!4919 List!16846)) )
))
(declare-fun lt!387689 () ListLongMap!9807)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!387691 () array!49398)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!27195)

(declare-fun zeroValue!654 () V!27195)

(declare-fun getCurrentListMapNoExtraKeys!2897 (array!49400 array!49398 (_ BitVec 32) (_ BitVec 32) V!27195 V!27195 (_ BitVec 32) Int) ListLongMap!9807)

(assert (=> b!860189 (= lt!387689 (getCurrentListMapNoExtraKeys!2897 _keys!868 lt!387691 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27195)

(assert (=> b!860189 (= lt!387691 (array!49399 (store (arr!23730 _values!688) i!612 (ValueCellFull!7866 v!557)) (size!24170 _values!688)))))

(declare-fun lt!387685 () ListLongMap!9807)

(assert (=> b!860189 (= lt!387685 (getCurrentListMapNoExtraKeys!2897 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!860190 () Bool)

(declare-fun e!479334 () Bool)

(assert (=> b!860190 (= e!479329 (not e!479334))))

(declare-fun res!584535 () Bool)

(assert (=> b!860190 (=> res!584535 e!479334)))

(assert (=> b!860190 (= res!584535 (not (validKeyInArray!0 (select (arr!23731 _keys!868) from!1053))))))

(declare-fun lt!387693 () ListLongMap!9807)

(declare-fun lt!387688 () ListLongMap!9807)

(assert (=> b!860190 (= lt!387693 lt!387688)))

(declare-fun lt!387687 () ListLongMap!9807)

(declare-fun +!2271 (ListLongMap!9807 tuple2!11038) ListLongMap!9807)

(assert (=> b!860190 (= lt!387688 (+!2271 lt!387687 (tuple2!11039 k0!854 v!557)))))

(assert (=> b!860190 (= lt!387693 (getCurrentListMapNoExtraKeys!2897 _keys!868 lt!387691 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!860190 (= lt!387687 (getCurrentListMapNoExtraKeys!2897 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29325 0))(
  ( (Unit!29326) )
))
(declare-fun lt!387692 () Unit!29325)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!485 (array!49400 array!49398 (_ BitVec 32) (_ BitVec 32) V!27195 V!27195 (_ BitVec 32) (_ BitVec 64) V!27195 (_ BitVec 32) Int) Unit!29325)

(assert (=> b!860190 (= lt!387692 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!485 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!860191 () Bool)

(declare-fun res!584541 () Bool)

(assert (=> b!860191 (=> (not res!584541) (not e!479331))))

(assert (=> b!860191 (= res!584541 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24171 _keys!868))))))

(declare-fun b!860192 () Bool)

(declare-fun res!584542 () Bool)

(assert (=> b!860192 (=> (not res!584542) (not e!479331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49400 (_ BitVec 32)) Bool)

(assert (=> b!860192 (= res!584542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!860193 () Bool)

(declare-fun e!479328 () Bool)

(assert (=> b!860193 (= e!479328 tp_is_empty!16611)))

(declare-fun b!860194 () Bool)

(assert (=> b!860194 (= e!479335 true)))

(declare-fun lt!387694 () Bool)

(declare-fun contains!4230 (List!16845 (_ BitVec 64)) Bool)

(assert (=> b!860194 (= lt!387694 (contains!4230 Nil!16842 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860195 () Bool)

(declare-fun res!584544 () Bool)

(assert (=> b!860195 (=> (not res!584544) (not e!479331))))

(assert (=> b!860195 (= res!584544 (and (= (size!24170 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24171 _keys!868) (size!24170 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!860196 () Bool)

(declare-fun res!584538 () Bool)

(assert (=> b!860196 (=> res!584538 e!479335)))

(assert (=> b!860196 (= res!584538 (contains!4230 Nil!16842 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!860197 () Bool)

(declare-fun res!584539 () Bool)

(assert (=> b!860197 (=> (not res!584539) (not e!479331))))

(assert (=> b!860197 (= res!584539 (and (= (select (arr!23731 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!860198 () Bool)

(declare-fun e!479333 () Bool)

(assert (=> b!860198 (= e!479334 e!479333)))

(declare-fun res!584545 () Bool)

(assert (=> b!860198 (=> res!584545 e!479333)))

(assert (=> b!860198 (= res!584545 (not (= (select (arr!23731 _keys!868) from!1053) k0!854)))))

(declare-fun get!12509 (ValueCell!7866 V!27195) V!27195)

(declare-fun dynLambda!1107 (Int (_ BitVec 64)) V!27195)

(assert (=> b!860198 (= lt!387689 (+!2271 lt!387688 (tuple2!11039 (select (arr!23731 _keys!868) from!1053) (get!12509 (select (arr!23730 _values!688) from!1053) (dynLambda!1107 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!860199 () Bool)

(assert (=> b!860199 (= e!479327 (and e!479328 mapRes!26516))))

(declare-fun condMapEmpty!26516 () Bool)

(declare-fun mapDefault!26516 () ValueCell!7866)

(assert (=> b!860199 (= condMapEmpty!26516 (= (arr!23730 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7866)) mapDefault!26516)))))

(declare-fun b!860200 () Bool)

(assert (=> b!860200 (= e!479333 e!479335)))

(declare-fun res!584533 () Bool)

(assert (=> b!860200 (=> res!584533 e!479335)))

(assert (=> b!860200 (= res!584533 (or (bvsge (size!24171 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24171 _keys!868)) (bvsge from!1053 (size!24171 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!49400 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!860200 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!387686 () Unit!29325)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49400 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29325)

(assert (=> b!860200 (= lt!387686 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!860200 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16842)))

(declare-fun lt!387690 () Unit!29325)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49400 (_ BitVec 32) (_ BitVec 32)) Unit!29325)

(assert (=> b!860200 (= lt!387690 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (= (and start!73560 res!584543) b!860188))

(assert (= (and b!860188 res!584534) b!860195))

(assert (= (and b!860195 res!584544) b!860192))

(assert (= (and b!860192 res!584542) b!860187))

(assert (= (and b!860187 res!584540) b!860191))

(assert (= (and b!860191 res!584541) b!860185))

(assert (= (and b!860185 res!584536) b!860197))

(assert (= (and b!860197 res!584539) b!860189))

(assert (= (and b!860189 res!584537) b!860190))

(assert (= (and b!860190 (not res!584535)) b!860198))

(assert (= (and b!860198 (not res!584545)) b!860200))

(assert (= (and b!860200 (not res!584533)) b!860184))

(assert (= (and b!860184 (not res!584546)) b!860196))

(assert (= (and b!860196 (not res!584538)) b!860194))

(assert (= (and b!860199 condMapEmpty!26516) mapIsEmpty!26516))

(assert (= (and b!860199 (not condMapEmpty!26516)) mapNonEmpty!26516))

(get-info :version)

(assert (= (and mapNonEmpty!26516 ((_ is ValueCellFull!7866) mapValue!26516)) b!860186))

(assert (= (and b!860199 ((_ is ValueCellFull!7866) mapDefault!26516)) b!860193))

(assert (= start!73560 b!860199))

(declare-fun b_lambda!11827 () Bool)

(assert (=> (not b_lambda!11827) (not b!860198)))

(declare-fun t!23585 () Bool)

(declare-fun tb!4597 () Bool)

(assert (=> (and start!73560 (= defaultEntry!696 defaultEntry!696) t!23585) tb!4597))

(declare-fun result!8805 () Bool)

(assert (=> tb!4597 (= result!8805 tp_is_empty!16611)))

(assert (=> b!860198 t!23585))

(declare-fun b_and!23931 () Bool)

(assert (= b_and!23929 (and (=> t!23585 result!8805) b_and!23931)))

(declare-fun m!800977 () Bool)

(assert (=> b!860192 m!800977))

(declare-fun m!800979 () Bool)

(assert (=> b!860200 m!800979))

(declare-fun m!800981 () Bool)

(assert (=> b!860200 m!800981))

(declare-fun m!800983 () Bool)

(assert (=> b!860200 m!800983))

(declare-fun m!800985 () Bool)

(assert (=> b!860200 m!800985))

(declare-fun m!800987 () Bool)

(assert (=> b!860190 m!800987))

(declare-fun m!800989 () Bool)

(assert (=> b!860190 m!800989))

(declare-fun m!800991 () Bool)

(assert (=> b!860190 m!800991))

(declare-fun m!800993 () Bool)

(assert (=> b!860190 m!800993))

(declare-fun m!800995 () Bool)

(assert (=> b!860190 m!800995))

(assert (=> b!860190 m!800993))

(declare-fun m!800997 () Bool)

(assert (=> b!860190 m!800997))

(declare-fun m!800999 () Bool)

(assert (=> b!860197 m!800999))

(declare-fun m!801001 () Bool)

(assert (=> start!73560 m!801001))

(declare-fun m!801003 () Bool)

(assert (=> start!73560 m!801003))

(declare-fun m!801005 () Bool)

(assert (=> b!860196 m!801005))

(declare-fun m!801007 () Bool)

(assert (=> b!860194 m!801007))

(declare-fun m!801009 () Bool)

(assert (=> b!860185 m!801009))

(declare-fun m!801011 () Bool)

(assert (=> b!860198 m!801011))

(declare-fun m!801013 () Bool)

(assert (=> b!860198 m!801013))

(declare-fun m!801015 () Bool)

(assert (=> b!860198 m!801015))

(declare-fun m!801017 () Bool)

(assert (=> b!860198 m!801017))

(assert (=> b!860198 m!801013))

(assert (=> b!860198 m!800993))

(assert (=> b!860198 m!801015))

(declare-fun m!801019 () Bool)

(assert (=> b!860188 m!801019))

(declare-fun m!801021 () Bool)

(assert (=> mapNonEmpty!26516 m!801021))

(declare-fun m!801023 () Bool)

(assert (=> b!860187 m!801023))

(declare-fun m!801025 () Bool)

(assert (=> b!860184 m!801025))

(declare-fun m!801027 () Bool)

(assert (=> b!860189 m!801027))

(declare-fun m!801029 () Bool)

(assert (=> b!860189 m!801029))

(declare-fun m!801031 () Bool)

(assert (=> b!860189 m!801031))

(check-sat (not b!860188) (not b_next!14475) (not start!73560) (not b!860192) (not mapNonEmpty!26516) tp_is_empty!16611 (not b!860194) (not b!860200) (not b!860189) (not b!860185) (not b!860190) (not b!860196) (not b!860187) (not b!860198) b_and!23931 (not b_lambda!11827) (not b!860184))
(check-sat b_and!23931 (not b_next!14475))
