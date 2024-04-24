; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99714 () Bool)

(assert start!99714)

(declare-fun b_free!25057 () Bool)

(declare-fun b_next!25057 () Bool)

(assert (=> start!99714 (= b_free!25057 (not b_next!25057))))

(declare-fun tp!87885 () Bool)

(declare-fun b_and!40983 () Bool)

(assert (=> start!99714 (= tp!87885 b_and!40983)))

(declare-fun b!1177000 () Bool)

(declare-fun res!781361 () Bool)

(declare-fun e!669137 () Bool)

(assert (=> b!1177000 (=> (not res!781361) (not e!669137))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1177000 (= res!781361 (validKeyInArray!0 k0!934))))

(declare-fun b!1177001 () Bool)

(declare-fun res!781355 () Bool)

(assert (=> b!1177001 (=> (not res!781355) (not e!669137))))

(declare-datatypes ((array!76033 0))(
  ( (array!76034 (arr!36660 (Array (_ BitVec 32) (_ BitVec 64))) (size!37197 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76033)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76033 (_ BitVec 32)) Bool)

(assert (=> b!1177001 (= res!781355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1177002 () Bool)

(declare-fun e!669135 () Bool)

(declare-fun tp_is_empty!29587 () Bool)

(assert (=> b!1177002 (= e!669135 tp_is_empty!29587)))

(declare-fun b!1177004 () Bool)

(declare-datatypes ((Unit!38798 0))(
  ( (Unit!38799) )
))
(declare-fun e!669144 () Unit!38798)

(declare-fun Unit!38800 () Unit!38798)

(assert (=> b!1177004 (= e!669144 Unit!38800)))

(declare-fun lt!530956 () Unit!38798)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76033 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38798)

(assert (=> b!1177004 (= lt!530956 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1177004 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!530953 () Unit!38798)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76033 (_ BitVec 32) (_ BitVec 32)) Unit!38798)

(assert (=> b!1177004 (= lt!530953 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25765 0))(
  ( (Nil!25762) (Cons!25761 (h!26979 (_ BitVec 64)) (t!37806 List!25765)) )
))
(declare-fun arrayNoDuplicates!0 (array!76033 (_ BitVec 32) List!25765) Bool)

(assert (=> b!1177004 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25762)))

(declare-fun lt!530949 () Unit!38798)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76033 (_ BitVec 64) (_ BitVec 32) List!25765) Unit!38798)

(assert (=> b!1177004 (= lt!530949 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25762))))

(assert (=> b!1177004 false))

(declare-fun mapNonEmpty!46208 () Bool)

(declare-fun mapRes!46208 () Bool)

(declare-fun tp!87884 () Bool)

(declare-fun e!669141 () Bool)

(assert (=> mapNonEmpty!46208 (= mapRes!46208 (and tp!87884 e!669141))))

(declare-fun mapKey!46208 () (_ BitVec 32))

(declare-datatypes ((V!44577 0))(
  ( (V!44578 (val!14850 Int)) )
))
(declare-datatypes ((ValueCell!14084 0))(
  ( (ValueCellFull!14084 (v!17484 V!44577)) (EmptyCell!14084) )
))
(declare-fun mapValue!46208 () ValueCell!14084)

(declare-datatypes ((array!76035 0))(
  ( (array!76036 (arr!36661 (Array (_ BitVec 32) ValueCell!14084)) (size!37198 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76035)

(declare-fun mapRest!46208 () (Array (_ BitVec 32) ValueCell!14084))

(assert (=> mapNonEmpty!46208 (= (arr!36661 _values!996) (store mapRest!46208 mapKey!46208 mapValue!46208))))

(declare-fun b!1177005 () Bool)

(declare-fun res!781350 () Bool)

(assert (=> b!1177005 (=> (not res!781350) (not e!669137))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1177005 (= res!781350 (and (= (size!37198 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37197 _keys!1208) (size!37198 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1177006 () Bool)

(declare-fun res!781356 () Bool)

(assert (=> b!1177006 (=> (not res!781356) (not e!669137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1177006 (= res!781356 (validMask!0 mask!1564))))

(declare-fun b!1177007 () Bool)

(declare-fun e!669138 () Bool)

(assert (=> b!1177007 (= e!669138 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1177008 () Bool)

(declare-fun e!669146 () Bool)

(declare-fun e!669145 () Bool)

(assert (=> b!1177008 (= e!669146 e!669145)))

(declare-fun res!781360 () Bool)

(assert (=> b!1177008 (=> res!781360 e!669145)))

(assert (=> b!1177008 (= res!781360 (not (validKeyInArray!0 (select (arr!36660 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19032 0))(
  ( (tuple2!19033 (_1!9527 (_ BitVec 64)) (_2!9527 V!44577)) )
))
(declare-datatypes ((List!25766 0))(
  ( (Nil!25763) (Cons!25762 (h!26980 tuple2!19032) (t!37807 List!25766)) )
))
(declare-datatypes ((ListLongMap!17009 0))(
  ( (ListLongMap!17010 (toList!8520 List!25766)) )
))
(declare-fun lt!530961 () ListLongMap!17009)

(declare-fun lt!530955 () ListLongMap!17009)

(assert (=> b!1177008 (= lt!530961 lt!530955)))

(declare-fun lt!530957 () ListLongMap!17009)

(declare-fun -!1561 (ListLongMap!17009 (_ BitVec 64)) ListLongMap!17009)

(assert (=> b!1177008 (= lt!530955 (-!1561 lt!530957 k0!934))))

(declare-fun zeroValue!944 () V!44577)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!530958 () array!76033)

(declare-fun minValue!944 () V!44577)

(declare-fun lt!530952 () array!76035)

(declare-fun getCurrentListMapNoExtraKeys!5002 (array!76033 array!76035 (_ BitVec 32) (_ BitVec 32) V!44577 V!44577 (_ BitVec 32) Int) ListLongMap!17009)

(assert (=> b!1177008 (= lt!530961 (getCurrentListMapNoExtraKeys!5002 lt!530958 lt!530952 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1177008 (= lt!530957 (getCurrentListMapNoExtraKeys!5002 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!530960 () Unit!38798)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!786 (array!76033 array!76035 (_ BitVec 32) (_ BitVec 32) V!44577 V!44577 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38798)

(assert (=> b!1177008 (= lt!530960 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!786 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1177009 () Bool)

(declare-fun res!781352 () Bool)

(assert (=> b!1177009 (=> (not res!781352) (not e!669137))))

(assert (=> b!1177009 (= res!781352 (= (select (arr!36660 _keys!1208) i!673) k0!934))))

(declare-fun b!1177010 () Bool)

(assert (=> b!1177010 (= e!669145 true)))

(assert (=> b!1177010 (not (= (select (arr!36660 _keys!1208) from!1455) k0!934))))

(declare-fun lt!530950 () Unit!38798)

(assert (=> b!1177010 (= lt!530950 e!669144)))

(declare-fun c!117107 () Bool)

(assert (=> b!1177010 (= c!117107 (= (select (arr!36660 _keys!1208) from!1455) k0!934))))

(declare-fun e!669139 () Bool)

(assert (=> b!1177010 e!669139))

(declare-fun res!781359 () Bool)

(assert (=> b!1177010 (=> (not res!781359) (not e!669139))))

(declare-fun lt!530962 () V!44577)

(declare-fun lt!530951 () ListLongMap!17009)

(declare-fun +!3851 (ListLongMap!17009 tuple2!19032) ListLongMap!17009)

(declare-fun get!18755 (ValueCell!14084 V!44577) V!44577)

(assert (=> b!1177010 (= res!781359 (= lt!530951 (+!3851 lt!530955 (tuple2!19033 (select (arr!36660 _keys!1208) from!1455) (get!18755 (select (arr!36661 _values!996) from!1455) lt!530962)))))))

(declare-fun b!1177011 () Bool)

(declare-fun res!781363 () Bool)

(declare-fun e!669143 () Bool)

(assert (=> b!1177011 (=> (not res!781363) (not e!669143))))

(assert (=> b!1177011 (= res!781363 (arrayNoDuplicates!0 lt!530958 #b00000000000000000000000000000000 Nil!25762))))

(declare-fun b!1177012 () Bool)

(assert (=> b!1177012 (= e!669141 tp_is_empty!29587)))

(declare-fun b!1177013 () Bool)

(assert (=> b!1177013 (= e!669137 e!669143)))

(declare-fun res!781362 () Bool)

(assert (=> b!1177013 (=> (not res!781362) (not e!669143))))

(assert (=> b!1177013 (= res!781362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!530958 mask!1564))))

(assert (=> b!1177013 (= lt!530958 (array!76034 (store (arr!36660 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37197 _keys!1208)))))

(declare-fun b!1177014 () Bool)

(declare-fun Unit!38801 () Unit!38798)

(assert (=> b!1177014 (= e!669144 Unit!38801)))

(declare-fun b!1177015 () Bool)

(declare-fun e!669142 () Bool)

(assert (=> b!1177015 (= e!669143 (not e!669142))))

(declare-fun res!781351 () Bool)

(assert (=> b!1177015 (=> res!781351 e!669142)))

(assert (=> b!1177015 (= res!781351 (bvsgt from!1455 i!673))))

(assert (=> b!1177015 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!530954 () Unit!38798)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76033 (_ BitVec 64) (_ BitVec 32)) Unit!38798)

(assert (=> b!1177015 (= lt!530954 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!781357 () Bool)

(assert (=> start!99714 (=> (not res!781357) (not e!669137))))

(assert (=> start!99714 (= res!781357 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37197 _keys!1208))))))

(assert (=> start!99714 e!669137))

(assert (=> start!99714 tp_is_empty!29587))

(declare-fun array_inv!28082 (array!76033) Bool)

(assert (=> start!99714 (array_inv!28082 _keys!1208)))

(assert (=> start!99714 true))

(assert (=> start!99714 tp!87885))

(declare-fun e!669140 () Bool)

(declare-fun array_inv!28083 (array!76035) Bool)

(assert (=> start!99714 (and (array_inv!28083 _values!996) e!669140)))

(declare-fun b!1177003 () Bool)

(assert (=> b!1177003 (= e!669142 e!669146)))

(declare-fun res!781364 () Bool)

(assert (=> b!1177003 (=> res!781364 e!669146)))

(assert (=> b!1177003 (= res!781364 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1177003 (= lt!530951 (getCurrentListMapNoExtraKeys!5002 lt!530958 lt!530952 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1177003 (= lt!530952 (array!76036 (store (arr!36661 _values!996) i!673 (ValueCellFull!14084 lt!530962)) (size!37198 _values!996)))))

(declare-fun dynLambda!2979 (Int (_ BitVec 64)) V!44577)

(assert (=> b!1177003 (= lt!530962 (dynLambda!2979 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!530959 () ListLongMap!17009)

(assert (=> b!1177003 (= lt!530959 (getCurrentListMapNoExtraKeys!5002 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1177016 () Bool)

(declare-fun res!781353 () Bool)

(assert (=> b!1177016 (=> (not res!781353) (not e!669137))))

(assert (=> b!1177016 (= res!781353 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37197 _keys!1208))))))

(declare-fun mapIsEmpty!46208 () Bool)

(assert (=> mapIsEmpty!46208 mapRes!46208))

(declare-fun b!1177017 () Bool)

(assert (=> b!1177017 (= e!669139 e!669138)))

(declare-fun res!781358 () Bool)

(assert (=> b!1177017 (=> res!781358 e!669138)))

(assert (=> b!1177017 (= res!781358 (not (= (select (arr!36660 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1177018 () Bool)

(assert (=> b!1177018 (= e!669140 (and e!669135 mapRes!46208))))

(declare-fun condMapEmpty!46208 () Bool)

(declare-fun mapDefault!46208 () ValueCell!14084)

(assert (=> b!1177018 (= condMapEmpty!46208 (= (arr!36661 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14084)) mapDefault!46208)))))

(declare-fun b!1177019 () Bool)

(declare-fun res!781354 () Bool)

(assert (=> b!1177019 (=> (not res!781354) (not e!669137))))

(assert (=> b!1177019 (= res!781354 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25762))))

(assert (= (and start!99714 res!781357) b!1177006))

(assert (= (and b!1177006 res!781356) b!1177005))

(assert (= (and b!1177005 res!781350) b!1177001))

(assert (= (and b!1177001 res!781355) b!1177019))

(assert (= (and b!1177019 res!781354) b!1177016))

(assert (= (and b!1177016 res!781353) b!1177000))

(assert (= (and b!1177000 res!781361) b!1177009))

(assert (= (and b!1177009 res!781352) b!1177013))

(assert (= (and b!1177013 res!781362) b!1177011))

(assert (= (and b!1177011 res!781363) b!1177015))

(assert (= (and b!1177015 (not res!781351)) b!1177003))

(assert (= (and b!1177003 (not res!781364)) b!1177008))

(assert (= (and b!1177008 (not res!781360)) b!1177010))

(assert (= (and b!1177010 res!781359) b!1177017))

(assert (= (and b!1177017 (not res!781358)) b!1177007))

(assert (= (and b!1177010 c!117107) b!1177004))

(assert (= (and b!1177010 (not c!117107)) b!1177014))

(assert (= (and b!1177018 condMapEmpty!46208) mapIsEmpty!46208))

(assert (= (and b!1177018 (not condMapEmpty!46208)) mapNonEmpty!46208))

(get-info :version)

(assert (= (and mapNonEmpty!46208 ((_ is ValueCellFull!14084) mapValue!46208)) b!1177012))

(assert (= (and b!1177018 ((_ is ValueCellFull!14084) mapDefault!46208)) b!1177002))

(assert (= start!99714 b!1177018))

(declare-fun b_lambda!20195 () Bool)

(assert (=> (not b_lambda!20195) (not b!1177003)))

(declare-fun t!37805 () Bool)

(declare-fun tb!9861 () Bool)

(assert (=> (and start!99714 (= defaultEntry!1004 defaultEntry!1004) t!37805) tb!9861))

(declare-fun result!20297 () Bool)

(assert (=> tb!9861 (= result!20297 tp_is_empty!29587)))

(assert (=> b!1177003 t!37805))

(declare-fun b_and!40985 () Bool)

(assert (= b_and!40983 (and (=> t!37805 result!20297) b_and!40985)))

(declare-fun m!1085199 () Bool)

(assert (=> b!1177003 m!1085199))

(declare-fun m!1085201 () Bool)

(assert (=> b!1177003 m!1085201))

(declare-fun m!1085203 () Bool)

(assert (=> b!1177003 m!1085203))

(declare-fun m!1085205 () Bool)

(assert (=> b!1177003 m!1085205))

(declare-fun m!1085207 () Bool)

(assert (=> b!1177010 m!1085207))

(declare-fun m!1085209 () Bool)

(assert (=> b!1177010 m!1085209))

(assert (=> b!1177010 m!1085209))

(declare-fun m!1085211 () Bool)

(assert (=> b!1177010 m!1085211))

(declare-fun m!1085213 () Bool)

(assert (=> b!1177010 m!1085213))

(declare-fun m!1085215 () Bool)

(assert (=> b!1177008 m!1085215))

(declare-fun m!1085217 () Bool)

(assert (=> b!1177008 m!1085217))

(assert (=> b!1177008 m!1085207))

(declare-fun m!1085219 () Bool)

(assert (=> b!1177008 m!1085219))

(assert (=> b!1177008 m!1085207))

(declare-fun m!1085221 () Bool)

(assert (=> b!1177008 m!1085221))

(declare-fun m!1085223 () Bool)

(assert (=> b!1177008 m!1085223))

(declare-fun m!1085225 () Bool)

(assert (=> b!1177013 m!1085225))

(declare-fun m!1085227 () Bool)

(assert (=> b!1177013 m!1085227))

(declare-fun m!1085229 () Bool)

(assert (=> b!1177001 m!1085229))

(declare-fun m!1085231 () Bool)

(assert (=> b!1177009 m!1085231))

(declare-fun m!1085233 () Bool)

(assert (=> b!1177019 m!1085233))

(declare-fun m!1085235 () Bool)

(assert (=> b!1177006 m!1085235))

(declare-fun m!1085237 () Bool)

(assert (=> b!1177007 m!1085237))

(declare-fun m!1085239 () Bool)

(assert (=> start!99714 m!1085239))

(declare-fun m!1085241 () Bool)

(assert (=> start!99714 m!1085241))

(declare-fun m!1085243 () Bool)

(assert (=> b!1177000 m!1085243))

(declare-fun m!1085245 () Bool)

(assert (=> mapNonEmpty!46208 m!1085245))

(declare-fun m!1085247 () Bool)

(assert (=> b!1177015 m!1085247))

(declare-fun m!1085249 () Bool)

(assert (=> b!1177015 m!1085249))

(declare-fun m!1085251 () Bool)

(assert (=> b!1177004 m!1085251))

(declare-fun m!1085253 () Bool)

(assert (=> b!1177004 m!1085253))

(declare-fun m!1085255 () Bool)

(assert (=> b!1177004 m!1085255))

(declare-fun m!1085257 () Bool)

(assert (=> b!1177004 m!1085257))

(declare-fun m!1085259 () Bool)

(assert (=> b!1177004 m!1085259))

(assert (=> b!1177017 m!1085207))

(declare-fun m!1085261 () Bool)

(assert (=> b!1177011 m!1085261))

(check-sat (not b_next!25057) (not b!1177019) tp_is_empty!29587 (not b!1177004) (not mapNonEmpty!46208) (not b_lambda!20195) (not b!1177001) (not b!1177007) (not b!1177008) b_and!40985 (not b!1177015) (not b!1177003) (not b!1177000) (not b!1177013) (not b!1177006) (not b!1177011) (not start!99714) (not b!1177010))
(check-sat b_and!40985 (not b_next!25057))
