; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98254 () Bool)

(assert start!98254)

(declare-fun b_free!23719 () Bool)

(declare-fun b_next!23719 () Bool)

(assert (=> start!98254 (= b_free!23719 (not b_next!23719))))

(declare-fun tp!83861 () Bool)

(declare-fun b_and!38231 () Bool)

(assert (=> start!98254 (= tp!83861 b_and!38231)))

(declare-fun b!1125963 () Bool)

(declare-fun e!641062 () Bool)

(declare-fun e!641061 () Bool)

(declare-fun mapRes!44191 () Bool)

(assert (=> b!1125963 (= e!641062 (and e!641061 mapRes!44191))))

(declare-fun condMapEmpty!44191 () Bool)

(declare-datatypes ((V!42793 0))(
  ( (V!42794 (val!14181 Int)) )
))
(declare-datatypes ((ValueCell!13415 0))(
  ( (ValueCellFull!13415 (v!16810 V!42793)) (EmptyCell!13415) )
))
(declare-datatypes ((array!73411 0))(
  ( (array!73412 (arr!35352 (Array (_ BitVec 32) ValueCell!13415)) (size!35889 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73411)

(declare-fun mapDefault!44191 () ValueCell!13415)

(assert (=> b!1125963 (= condMapEmpty!44191 (= (arr!35352 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13415)) mapDefault!44191)))))

(declare-fun zeroValue!944 () V!42793)

(declare-datatypes ((array!73413 0))(
  ( (array!73414 (arr!35353 (Array (_ BitVec 32) (_ BitVec 64))) (size!35890 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73413)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17828 0))(
  ( (tuple2!17829 (_1!8925 (_ BitVec 64)) (_2!8925 V!42793)) )
))
(declare-datatypes ((List!24618 0))(
  ( (Nil!24615) (Cons!24614 (h!25832 tuple2!17828) (t!35321 List!24618)) )
))
(declare-datatypes ((ListLongMap!15805 0))(
  ( (ListLongMap!15806 (toList!7918 List!24618)) )
))
(declare-fun call!47507 () ListLongMap!15805)

(declare-fun bm!47503 () Bool)

(declare-fun minValue!944 () V!42793)

(declare-fun getCurrentListMapNoExtraKeys!4444 (array!73413 array!73411 (_ BitVec 32) (_ BitVec 32) V!42793 V!42793 (_ BitVec 32) Int) ListLongMap!15805)

(assert (=> bm!47503 (= call!47507 (getCurrentListMapNoExtraKeys!4444 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125964 () Bool)

(declare-fun res!751967 () Bool)

(declare-fun e!641069 () Bool)

(assert (=> b!1125964 (=> res!751967 e!641069)))

(assert (=> b!1125964 (= res!751967 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1125965 () Bool)

(declare-fun res!751961 () Bool)

(declare-fun e!641067 () Bool)

(assert (=> b!1125965 (=> (not res!751961) (not e!641067))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1125965 (= res!751961 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35890 _keys!1208))))))

(declare-fun b!1125966 () Bool)

(declare-fun res!751964 () Bool)

(assert (=> b!1125966 (=> (not res!751964) (not e!641067))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1125966 (= res!751964 (= (select (arr!35353 _keys!1208) i!673) k0!934))))

(declare-fun b!1125967 () Bool)

(declare-fun e!641068 () Bool)

(declare-fun tp_is_empty!28249 () Bool)

(assert (=> b!1125967 (= e!641068 tp_is_empty!28249)))

(declare-fun b!1125968 () Bool)

(declare-fun res!751965 () Bool)

(assert (=> b!1125968 (=> (not res!751965) (not e!641067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1125968 (= res!751965 (validMask!0 mask!1564))))

(declare-fun b!1125969 () Bool)

(declare-fun res!751962 () Bool)

(assert (=> b!1125969 (=> (not res!751962) (not e!641067))))

(declare-datatypes ((List!24619 0))(
  ( (Nil!24616) (Cons!24615 (h!25833 (_ BitVec 64)) (t!35322 List!24619)) )
))
(declare-fun arrayNoDuplicates!0 (array!73413 (_ BitVec 32) List!24619) Bool)

(assert (=> b!1125969 (= res!751962 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24616))))

(declare-fun b!1125970 () Bool)

(declare-fun res!751968 () Bool)

(assert (=> b!1125970 (=> (not res!751968) (not e!641067))))

(assert (=> b!1125970 (= res!751968 (and (= (size!35889 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35890 _keys!1208) (size!35889 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1125971 () Bool)

(declare-fun res!751972 () Bool)

(assert (=> b!1125971 (=> (not res!751972) (not e!641067))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1125971 (= res!751972 (validKeyInArray!0 k0!934))))

(declare-fun b!1125972 () Bool)

(declare-fun res!751971 () Bool)

(declare-fun e!641064 () Bool)

(assert (=> b!1125972 (=> (not res!751971) (not e!641064))))

(declare-fun lt!500058 () array!73413)

(assert (=> b!1125972 (= res!751971 (arrayNoDuplicates!0 lt!500058 #b00000000000000000000000000000000 Nil!24616))))

(declare-fun b!1125973 () Bool)

(declare-fun e!641070 () Bool)

(assert (=> b!1125973 (= e!641070 e!641069)))

(declare-fun res!751959 () Bool)

(assert (=> b!1125973 (=> res!751959 e!641069)))

(declare-fun lt!500052 () ListLongMap!15805)

(declare-fun contains!6471 (ListLongMap!15805 (_ BitVec 64)) Bool)

(assert (=> b!1125973 (= res!751959 (not (contains!6471 lt!500052 k0!934)))))

(assert (=> b!1125973 (= lt!500052 (getCurrentListMapNoExtraKeys!4444 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125974 () Bool)

(declare-fun e!641065 () Bool)

(assert (=> b!1125974 (= e!641065 e!641070)))

(declare-fun res!751969 () Bool)

(assert (=> b!1125974 (=> res!751969 e!641070)))

(assert (=> b!1125974 (= res!751969 (not (= (select (arr!35353 _keys!1208) from!1455) k0!934)))))

(declare-fun e!641060 () Bool)

(assert (=> b!1125974 e!641060))

(declare-fun c!109979 () Bool)

(assert (=> b!1125974 (= c!109979 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36859 0))(
  ( (Unit!36860) )
))
(declare-fun lt!500056 () Unit!36859)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!367 (array!73413 array!73411 (_ BitVec 32) (_ BitVec 32) V!42793 V!42793 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36859)

(assert (=> b!1125974 (= lt!500056 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!367 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44191 () Bool)

(declare-fun tp!83860 () Bool)

(assert (=> mapNonEmpty!44191 (= mapRes!44191 (and tp!83860 e!641068))))

(declare-fun mapKey!44191 () (_ BitVec 32))

(declare-fun mapValue!44191 () ValueCell!13415)

(declare-fun mapRest!44191 () (Array (_ BitVec 32) ValueCell!13415))

(assert (=> mapNonEmpty!44191 (= (arr!35352 _values!996) (store mapRest!44191 mapKey!44191 mapValue!44191))))

(declare-fun b!1125975 () Bool)

(declare-fun call!47506 () ListLongMap!15805)

(declare-fun -!1105 (ListLongMap!15805 (_ BitVec 64)) ListLongMap!15805)

(assert (=> b!1125975 (= e!641060 (= call!47506 (-!1105 call!47507 k0!934)))))

(declare-fun mapIsEmpty!44191 () Bool)

(assert (=> mapIsEmpty!44191 mapRes!44191))

(declare-fun b!1125976 () Bool)

(declare-fun res!751960 () Bool)

(assert (=> b!1125976 (=> (not res!751960) (not e!641067))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73413 (_ BitVec 32)) Bool)

(assert (=> b!1125976 (= res!751960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1125977 () Bool)

(assert (=> b!1125977 (= e!641069 true)))

(declare-fun +!3449 (ListLongMap!15805 tuple2!17828) ListLongMap!15805)

(assert (=> b!1125977 (contains!6471 (+!3449 lt!500052 (tuple2!17829 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!500055 () Unit!36859)

(declare-fun addStillContains!675 (ListLongMap!15805 (_ BitVec 64) V!42793 (_ BitVec 64)) Unit!36859)

(assert (=> b!1125977 (= lt!500055 (addStillContains!675 lt!500052 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun b!1125978 () Bool)

(assert (=> b!1125978 (= e!641060 (= call!47506 call!47507))))

(declare-fun b!1125979 () Bool)

(declare-fun e!641063 () Bool)

(assert (=> b!1125979 (= e!641063 e!641065)))

(declare-fun res!751958 () Bool)

(assert (=> b!1125979 (=> res!751958 e!641065)))

(assert (=> b!1125979 (= res!751958 (not (= from!1455 i!673)))))

(declare-fun lt!500057 () ListLongMap!15805)

(declare-fun lt!500059 () array!73411)

(assert (=> b!1125979 (= lt!500057 (getCurrentListMapNoExtraKeys!4444 lt!500058 lt!500059 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2522 (Int (_ BitVec 64)) V!42793)

(assert (=> b!1125979 (= lt!500059 (array!73412 (store (arr!35352 _values!996) i!673 (ValueCellFull!13415 (dynLambda!2522 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35889 _values!996)))))

(declare-fun lt!500053 () ListLongMap!15805)

(assert (=> b!1125979 (= lt!500053 (getCurrentListMapNoExtraKeys!4444 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!47504 () Bool)

(assert (=> bm!47504 (= call!47506 (getCurrentListMapNoExtraKeys!4444 lt!500058 lt!500059 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!751966 () Bool)

(assert (=> start!98254 (=> (not res!751966) (not e!641067))))

(assert (=> start!98254 (= res!751966 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35890 _keys!1208))))))

(assert (=> start!98254 e!641067))

(assert (=> start!98254 tp_is_empty!28249))

(declare-fun array_inv!27194 (array!73413) Bool)

(assert (=> start!98254 (array_inv!27194 _keys!1208)))

(assert (=> start!98254 true))

(assert (=> start!98254 tp!83861))

(declare-fun array_inv!27195 (array!73411) Bool)

(assert (=> start!98254 (and (array_inv!27195 _values!996) e!641062)))

(declare-fun b!1125980 () Bool)

(assert (=> b!1125980 (= e!641064 (not e!641063))))

(declare-fun res!751963 () Bool)

(assert (=> b!1125980 (=> res!751963 e!641063)))

(assert (=> b!1125980 (= res!751963 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1125980 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!500054 () Unit!36859)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73413 (_ BitVec 64) (_ BitVec 32)) Unit!36859)

(assert (=> b!1125980 (= lt!500054 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1125981 () Bool)

(assert (=> b!1125981 (= e!641067 e!641064)))

(declare-fun res!751970 () Bool)

(assert (=> b!1125981 (=> (not res!751970) (not e!641064))))

(assert (=> b!1125981 (= res!751970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500058 mask!1564))))

(assert (=> b!1125981 (= lt!500058 (array!73414 (store (arr!35353 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35890 _keys!1208)))))

(declare-fun b!1125982 () Bool)

(assert (=> b!1125982 (= e!641061 tp_is_empty!28249)))

(assert (= (and start!98254 res!751966) b!1125968))

(assert (= (and b!1125968 res!751965) b!1125970))

(assert (= (and b!1125970 res!751968) b!1125976))

(assert (= (and b!1125976 res!751960) b!1125969))

(assert (= (and b!1125969 res!751962) b!1125965))

(assert (= (and b!1125965 res!751961) b!1125971))

(assert (= (and b!1125971 res!751972) b!1125966))

(assert (= (and b!1125966 res!751964) b!1125981))

(assert (= (and b!1125981 res!751970) b!1125972))

(assert (= (and b!1125972 res!751971) b!1125980))

(assert (= (and b!1125980 (not res!751963)) b!1125979))

(assert (= (and b!1125979 (not res!751958)) b!1125974))

(assert (= (and b!1125974 c!109979) b!1125975))

(assert (= (and b!1125974 (not c!109979)) b!1125978))

(assert (= (or b!1125975 b!1125978) bm!47504))

(assert (= (or b!1125975 b!1125978) bm!47503))

(assert (= (and b!1125974 (not res!751969)) b!1125973))

(assert (= (and b!1125973 (not res!751959)) b!1125964))

(assert (= (and b!1125964 (not res!751967)) b!1125977))

(assert (= (and b!1125963 condMapEmpty!44191) mapIsEmpty!44191))

(assert (= (and b!1125963 (not condMapEmpty!44191)) mapNonEmpty!44191))

(get-info :version)

(assert (= (and mapNonEmpty!44191 ((_ is ValueCellFull!13415) mapValue!44191)) b!1125967))

(assert (= (and b!1125963 ((_ is ValueCellFull!13415) mapDefault!44191)) b!1125982))

(assert (= start!98254 b!1125963))

(declare-fun b_lambda!18699 () Bool)

(assert (=> (not b_lambda!18699) (not b!1125979)))

(declare-fun t!35320 () Bool)

(declare-fun tb!8523 () Bool)

(assert (=> (and start!98254 (= defaultEntry!1004 defaultEntry!1004) t!35320) tb!8523))

(declare-fun result!17615 () Bool)

(assert (=> tb!8523 (= result!17615 tp_is_empty!28249)))

(assert (=> b!1125979 t!35320))

(declare-fun b_and!38233 () Bool)

(assert (= b_and!38231 (and (=> t!35320 result!17615) b_and!38233)))

(declare-fun m!1040573 () Bool)

(assert (=> start!98254 m!1040573))

(declare-fun m!1040575 () Bool)

(assert (=> start!98254 m!1040575))

(declare-fun m!1040577 () Bool)

(assert (=> b!1125975 m!1040577))

(declare-fun m!1040579 () Bool)

(assert (=> b!1125980 m!1040579))

(declare-fun m!1040581 () Bool)

(assert (=> b!1125980 m!1040581))

(declare-fun m!1040583 () Bool)

(assert (=> b!1125971 m!1040583))

(declare-fun m!1040585 () Bool)

(assert (=> bm!47503 m!1040585))

(declare-fun m!1040587 () Bool)

(assert (=> b!1125966 m!1040587))

(declare-fun m!1040589 () Bool)

(assert (=> b!1125981 m!1040589))

(declare-fun m!1040591 () Bool)

(assert (=> b!1125981 m!1040591))

(declare-fun m!1040593 () Bool)

(assert (=> b!1125976 m!1040593))

(declare-fun m!1040595 () Bool)

(assert (=> b!1125968 m!1040595))

(declare-fun m!1040597 () Bool)

(assert (=> mapNonEmpty!44191 m!1040597))

(declare-fun m!1040599 () Bool)

(assert (=> b!1125979 m!1040599))

(declare-fun m!1040601 () Bool)

(assert (=> b!1125979 m!1040601))

(declare-fun m!1040603 () Bool)

(assert (=> b!1125979 m!1040603))

(declare-fun m!1040605 () Bool)

(assert (=> b!1125979 m!1040605))

(declare-fun m!1040607 () Bool)

(assert (=> b!1125969 m!1040607))

(declare-fun m!1040609 () Bool)

(assert (=> b!1125974 m!1040609))

(declare-fun m!1040611 () Bool)

(assert (=> b!1125974 m!1040611))

(declare-fun m!1040613 () Bool)

(assert (=> b!1125973 m!1040613))

(assert (=> b!1125973 m!1040585))

(declare-fun m!1040615 () Bool)

(assert (=> b!1125977 m!1040615))

(assert (=> b!1125977 m!1040615))

(declare-fun m!1040617 () Bool)

(assert (=> b!1125977 m!1040617))

(declare-fun m!1040619 () Bool)

(assert (=> b!1125977 m!1040619))

(declare-fun m!1040621 () Bool)

(assert (=> bm!47504 m!1040621))

(declare-fun m!1040623 () Bool)

(assert (=> b!1125972 m!1040623))

(check-sat (not b!1125969) (not b!1125981) (not b!1125980) (not b!1125979) (not b!1125973) (not start!98254) (not b_next!23719) (not b!1125971) (not mapNonEmpty!44191) (not b_lambda!18699) (not b!1125977) (not bm!47503) b_and!38233 (not b!1125968) tp_is_empty!28249 (not b!1125975) (not b!1125976) (not b!1125972) (not bm!47504) (not b!1125974))
(check-sat b_and!38233 (not b_next!23719))
