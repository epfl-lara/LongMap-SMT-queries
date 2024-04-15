; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97286 () Bool)

(assert start!97286)

(declare-fun b_free!23263 () Bool)

(declare-fun b_next!23263 () Bool)

(assert (=> start!97286 (= b_free!23263 (not b_next!23263))))

(declare-fun tp!82087 () Bool)

(declare-fun b_and!37337 () Bool)

(assert (=> start!97286 (= tp!82087 b_and!37337)))

(declare-datatypes ((V!41825 0))(
  ( (V!41826 (val!13818 Int)) )
))
(declare-fun zeroValue!944 () V!41825)

(declare-datatypes ((array!71864 0))(
  ( (array!71865 (arr!34585 (Array (_ BitVec 32) (_ BitVec 64))) (size!35123 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71864)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!46459 () Bool)

(declare-fun minValue!944 () V!41825)

(declare-datatypes ((ValueCell!13052 0))(
  ( (ValueCellFull!13052 (v!16450 V!41825)) (EmptyCell!13052) )
))
(declare-datatypes ((array!71866 0))(
  ( (array!71867 (arr!34586 (Array (_ BitVec 32) ValueCell!13052)) (size!35124 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71866)

(declare-datatypes ((tuple2!17512 0))(
  ( (tuple2!17513 (_1!8767 (_ BitVec 64)) (_2!8767 V!41825)) )
))
(declare-datatypes ((List!24170 0))(
  ( (Nil!24167) (Cons!24166 (h!25375 tuple2!17512) (t!34470 List!24170)) )
))
(declare-datatypes ((ListLongMap!15481 0))(
  ( (ListLongMap!15482 (toList!7756 List!24170)) )
))
(declare-fun call!46463 () ListLongMap!15481)

(declare-fun getCurrentListMapNoExtraKeys!4273 (array!71864 array!71866 (_ BitVec 32) (_ BitVec 32) V!41825 V!41825 (_ BitVec 32) Int) ListLongMap!15481)

(assert (=> bm!46459 (= call!46463 (getCurrentListMapNoExtraKeys!4273 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun bm!46460 () Bool)

(declare-fun call!46462 () ListLongMap!15481)

(declare-fun lt!495522 () array!71864)

(declare-fun dynLambda!2341 (Int (_ BitVec 64)) V!41825)

(assert (=> bm!46460 (= call!46462 (getCurrentListMapNoExtraKeys!4273 lt!495522 (array!71867 (store (arr!34586 _values!996) i!673 (ValueCellFull!13052 (dynLambda!2341 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35124 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107829 () Bool)

(declare-fun e!632020 () Bool)

(declare-fun tp_is_empty!27523 () Bool)

(assert (=> b!1107829 (= e!632020 tp_is_empty!27523)))

(declare-fun b!1107830 () Bool)

(declare-fun e!632021 () Bool)

(assert (=> b!1107830 (= e!632021 tp_is_empty!27523)))

(declare-fun b!1107831 () Bool)

(declare-fun e!632015 () Bool)

(declare-fun mapRes!43102 () Bool)

(assert (=> b!1107831 (= e!632015 (and e!632021 mapRes!43102))))

(declare-fun condMapEmpty!43102 () Bool)

(declare-fun mapDefault!43102 () ValueCell!13052)

(assert (=> b!1107831 (= condMapEmpty!43102 (= (arr!34586 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13052)) mapDefault!43102)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!632019 () Bool)

(declare-fun b!1107832 () Bool)

(declare-fun -!979 (ListLongMap!15481 (_ BitVec 64)) ListLongMap!15481)

(assert (=> b!1107832 (= e!632019 (= call!46462 (-!979 call!46463 k0!934)))))

(declare-fun b!1107833 () Bool)

(declare-fun e!632018 () Bool)

(declare-fun e!632016 () Bool)

(assert (=> b!1107833 (= e!632018 (not e!632016))))

(declare-fun res!739340 () Bool)

(assert (=> b!1107833 (=> res!739340 e!632016)))

(assert (=> b!1107833 (= res!739340 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35123 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71864 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1107833 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36173 0))(
  ( (Unit!36174) )
))
(declare-fun lt!495521 () Unit!36173)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71864 (_ BitVec 64) (_ BitVec 32)) Unit!36173)

(assert (=> b!1107833 (= lt!495521 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1107834 () Bool)

(assert (=> b!1107834 (= e!632019 (= call!46462 call!46463))))

(declare-fun b!1107835 () Bool)

(declare-fun res!739337 () Bool)

(assert (=> b!1107835 (=> (not res!739337) (not e!632018))))

(declare-datatypes ((List!24171 0))(
  ( (Nil!24168) (Cons!24167 (h!25376 (_ BitVec 64)) (t!34471 List!24171)) )
))
(declare-fun arrayNoDuplicates!0 (array!71864 (_ BitVec 32) List!24171) Bool)

(assert (=> b!1107835 (= res!739337 (arrayNoDuplicates!0 lt!495522 #b00000000000000000000000000000000 Nil!24168))))

(declare-fun b!1107828 () Bool)

(declare-fun res!739344 () Bool)

(declare-fun e!632017 () Bool)

(assert (=> b!1107828 (=> (not res!739344) (not e!632017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1107828 (= res!739344 (validMask!0 mask!1564))))

(declare-fun res!739341 () Bool)

(assert (=> start!97286 (=> (not res!739341) (not e!632017))))

(assert (=> start!97286 (= res!739341 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35123 _keys!1208))))))

(assert (=> start!97286 e!632017))

(assert (=> start!97286 tp_is_empty!27523))

(declare-fun array_inv!26670 (array!71864) Bool)

(assert (=> start!97286 (array_inv!26670 _keys!1208)))

(assert (=> start!97286 true))

(assert (=> start!97286 tp!82087))

(declare-fun array_inv!26671 (array!71866) Bool)

(assert (=> start!97286 (and (array_inv!26671 _values!996) e!632015)))

(declare-fun b!1107836 () Bool)

(declare-fun res!739345 () Bool)

(assert (=> b!1107836 (=> (not res!739345) (not e!632017))))

(assert (=> b!1107836 (= res!739345 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35123 _keys!1208))))))

(declare-fun b!1107837 () Bool)

(declare-fun res!739336 () Bool)

(assert (=> b!1107837 (=> (not res!739336) (not e!632017))))

(assert (=> b!1107837 (= res!739336 (= (select (arr!34585 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!43102 () Bool)

(declare-fun tp!82088 () Bool)

(assert (=> mapNonEmpty!43102 (= mapRes!43102 (and tp!82088 e!632020))))

(declare-fun mapKey!43102 () (_ BitVec 32))

(declare-fun mapRest!43102 () (Array (_ BitVec 32) ValueCell!13052))

(declare-fun mapValue!43102 () ValueCell!13052)

(assert (=> mapNonEmpty!43102 (= (arr!34586 _values!996) (store mapRest!43102 mapKey!43102 mapValue!43102))))

(declare-fun b!1107838 () Bool)

(assert (=> b!1107838 (= e!632016 true)))

(assert (=> b!1107838 e!632019))

(declare-fun c!109053 () Bool)

(assert (=> b!1107838 (= c!109053 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!495520 () Unit!36173)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!252 (array!71864 array!71866 (_ BitVec 32) (_ BitVec 32) V!41825 V!41825 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36173)

(assert (=> b!1107838 (= lt!495520 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!252 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107839 () Bool)

(assert (=> b!1107839 (= e!632017 e!632018)))

(declare-fun res!739339 () Bool)

(assert (=> b!1107839 (=> (not res!739339) (not e!632018))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71864 (_ BitVec 32)) Bool)

(assert (=> b!1107839 (= res!739339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495522 mask!1564))))

(assert (=> b!1107839 (= lt!495522 (array!71865 (store (arr!34585 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35123 _keys!1208)))))

(declare-fun b!1107840 () Bool)

(declare-fun res!739343 () Bool)

(assert (=> b!1107840 (=> (not res!739343) (not e!632017))))

(assert (=> b!1107840 (= res!739343 (and (= (size!35124 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35123 _keys!1208) (size!35124 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!43102 () Bool)

(assert (=> mapIsEmpty!43102 mapRes!43102))

(declare-fun b!1107841 () Bool)

(declare-fun res!739342 () Bool)

(assert (=> b!1107841 (=> (not res!739342) (not e!632017))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1107841 (= res!739342 (validKeyInArray!0 k0!934))))

(declare-fun b!1107842 () Bool)

(declare-fun res!739338 () Bool)

(assert (=> b!1107842 (=> (not res!739338) (not e!632017))))

(assert (=> b!1107842 (= res!739338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1107843 () Bool)

(declare-fun res!739335 () Bool)

(assert (=> b!1107843 (=> (not res!739335) (not e!632017))))

(assert (=> b!1107843 (= res!739335 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24168))))

(assert (= (and start!97286 res!739341) b!1107828))

(assert (= (and b!1107828 res!739344) b!1107840))

(assert (= (and b!1107840 res!739343) b!1107842))

(assert (= (and b!1107842 res!739338) b!1107843))

(assert (= (and b!1107843 res!739335) b!1107836))

(assert (= (and b!1107836 res!739345) b!1107841))

(assert (= (and b!1107841 res!739342) b!1107837))

(assert (= (and b!1107837 res!739336) b!1107839))

(assert (= (and b!1107839 res!739339) b!1107835))

(assert (= (and b!1107835 res!739337) b!1107833))

(assert (= (and b!1107833 (not res!739340)) b!1107838))

(assert (= (and b!1107838 c!109053) b!1107832))

(assert (= (and b!1107838 (not c!109053)) b!1107834))

(assert (= (or b!1107832 b!1107834) bm!46460))

(assert (= (or b!1107832 b!1107834) bm!46459))

(assert (= (and b!1107831 condMapEmpty!43102) mapIsEmpty!43102))

(assert (= (and b!1107831 (not condMapEmpty!43102)) mapNonEmpty!43102))

(get-info :version)

(assert (= (and mapNonEmpty!43102 ((_ is ValueCellFull!13052) mapValue!43102)) b!1107829))

(assert (= (and b!1107831 ((_ is ValueCellFull!13052) mapDefault!43102)) b!1107830))

(assert (= start!97286 b!1107831))

(declare-fun b_lambda!18265 () Bool)

(assert (=> (not b_lambda!18265) (not bm!46460)))

(declare-fun t!34469 () Bool)

(declare-fun tb!8121 () Bool)

(assert (=> (and start!97286 (= defaultEntry!1004 defaultEntry!1004) t!34469) tb!8121))

(declare-fun result!16811 () Bool)

(assert (=> tb!8121 (= result!16811 tp_is_empty!27523)))

(assert (=> bm!46460 t!34469))

(declare-fun b_and!37339 () Bool)

(assert (= b_and!37337 (and (=> t!34469 result!16811) b_and!37339)))

(declare-fun m!1025973 () Bool)

(assert (=> bm!46459 m!1025973))

(declare-fun m!1025975 () Bool)

(assert (=> start!97286 m!1025975))

(declare-fun m!1025977 () Bool)

(assert (=> start!97286 m!1025977))

(declare-fun m!1025979 () Bool)

(assert (=> mapNonEmpty!43102 m!1025979))

(declare-fun m!1025981 () Bool)

(assert (=> b!1107838 m!1025981))

(declare-fun m!1025983 () Bool)

(assert (=> b!1107828 m!1025983))

(declare-fun m!1025985 () Bool)

(assert (=> b!1107837 m!1025985))

(declare-fun m!1025987 () Bool)

(assert (=> b!1107833 m!1025987))

(declare-fun m!1025989 () Bool)

(assert (=> b!1107833 m!1025989))

(declare-fun m!1025991 () Bool)

(assert (=> b!1107841 m!1025991))

(declare-fun m!1025993 () Bool)

(assert (=> b!1107832 m!1025993))

(declare-fun m!1025995 () Bool)

(assert (=> b!1107835 m!1025995))

(declare-fun m!1025997 () Bool)

(assert (=> b!1107842 m!1025997))

(declare-fun m!1025999 () Bool)

(assert (=> bm!46460 m!1025999))

(declare-fun m!1026001 () Bool)

(assert (=> bm!46460 m!1026001))

(declare-fun m!1026003 () Bool)

(assert (=> bm!46460 m!1026003))

(declare-fun m!1026005 () Bool)

(assert (=> b!1107839 m!1026005))

(declare-fun m!1026007 () Bool)

(assert (=> b!1107839 m!1026007))

(declare-fun m!1026009 () Bool)

(assert (=> b!1107843 m!1026009))

(check-sat (not b_next!23263) (not bm!46459) (not b!1107828) (not b!1107841) (not b!1107843) (not mapNonEmpty!43102) (not b!1107832) (not b!1107839) b_and!37339 (not b!1107833) (not b!1107835) (not b!1107842) tp_is_empty!27523 (not bm!46460) (not b!1107838) (not start!97286) (not b_lambda!18265))
(check-sat b_and!37339 (not b_next!23263))
