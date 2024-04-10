; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101460 () Bool)

(assert start!101460)

(declare-fun b_free!26277 () Bool)

(declare-fun b_next!26277 () Bool)

(assert (=> start!101460 (= b_free!26277 (not b_next!26277))))

(declare-fun tp!91865 () Bool)

(declare-fun b_and!43743 () Bool)

(assert (=> start!101460 (= tp!91865 b_and!43743)))

(declare-fun b!1219369 () Bool)

(declare-fun e!692356 () Bool)

(declare-fun tp_is_empty!30981 () Bool)

(assert (=> b!1219369 (= e!692356 tp_is_empty!30981)))

(declare-datatypes ((array!78739 0))(
  ( (array!78740 (arr!38000 (Array (_ BitVec 32) (_ BitVec 64))) (size!38536 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78739)

(declare-fun b!1219370 () Bool)

(declare-fun e!692354 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1219370 (= e!692354 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1219371 () Bool)

(declare-fun res!809872 () Bool)

(declare-fun e!692345 () Bool)

(assert (=> b!1219371 (=> (not res!809872) (not e!692345))))

(assert (=> b!1219371 (= res!809872 (= (select (arr!38000 _keys!1208) i!673) k0!934))))

(declare-fun b!1219373 () Bool)

(declare-fun res!809880 () Bool)

(assert (=> b!1219373 (=> (not res!809880) (not e!692345))))

(declare-datatypes ((List!26807 0))(
  ( (Nil!26804) (Cons!26803 (h!28012 (_ BitVec 64)) (t!40064 List!26807)) )
))
(declare-fun arrayNoDuplicates!0 (array!78739 (_ BitVec 32) List!26807) Bool)

(assert (=> b!1219373 (= res!809880 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26804))))

(declare-fun b!1219374 () Bool)

(declare-fun e!692352 () Bool)

(assert (=> b!1219374 (= e!692352 tp_is_empty!30981)))

(declare-fun b!1219375 () Bool)

(declare-fun res!809876 () Bool)

(assert (=> b!1219375 (=> (not res!809876) (not e!692345))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78739 (_ BitVec 32)) Bool)

(assert (=> b!1219375 (= res!809876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1219376 () Bool)

(declare-fun e!692350 () Bool)

(assert (=> b!1219376 (= e!692350 true)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1219376 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-datatypes ((Unit!40406 0))(
  ( (Unit!40407) )
))
(declare-fun lt!554392 () Unit!40406)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78739 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40406)

(assert (=> b!1219376 (= lt!554392 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapIsEmpty!48358 () Bool)

(declare-fun mapRes!48358 () Bool)

(assert (=> mapIsEmpty!48358 mapRes!48358))

(declare-fun b!1219377 () Bool)

(declare-fun e!692348 () Bool)

(declare-fun e!692351 () Bool)

(assert (=> b!1219377 (= e!692348 e!692351)))

(declare-fun res!809873 () Bool)

(assert (=> b!1219377 (=> res!809873 e!692351)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1219377 (= res!809873 (not (validKeyInArray!0 (select (arr!38000 _keys!1208) from!1455))))))

(declare-datatypes ((V!46435 0))(
  ( (V!46436 (val!15547 Int)) )
))
(declare-datatypes ((tuple2!20006 0))(
  ( (tuple2!20007 (_1!10014 (_ BitVec 64)) (_2!10014 V!46435)) )
))
(declare-datatypes ((List!26808 0))(
  ( (Nil!26805) (Cons!26804 (h!28013 tuple2!20006) (t!40065 List!26808)) )
))
(declare-datatypes ((ListLongMap!17975 0))(
  ( (ListLongMap!17976 (toList!9003 List!26808)) )
))
(declare-fun lt!554397 () ListLongMap!17975)

(declare-fun lt!554391 () ListLongMap!17975)

(assert (=> b!1219377 (= lt!554397 lt!554391)))

(declare-fun lt!554395 () ListLongMap!17975)

(declare-fun -!1915 (ListLongMap!17975 (_ BitVec 64)) ListLongMap!17975)

(assert (=> b!1219377 (= lt!554391 (-!1915 lt!554395 k0!934))))

(declare-fun zeroValue!944 () V!46435)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!554393 () array!78739)

(declare-datatypes ((ValueCell!14781 0))(
  ( (ValueCellFull!14781 (v!18204 V!46435)) (EmptyCell!14781) )
))
(declare-datatypes ((array!78741 0))(
  ( (array!78742 (arr!38001 (Array (_ BitVec 32) ValueCell!14781)) (size!38537 (_ BitVec 32))) )
))
(declare-fun lt!554390 () array!78741)

(declare-fun minValue!944 () V!46435)

(declare-fun getCurrentListMapNoExtraKeys!5428 (array!78739 array!78741 (_ BitVec 32) (_ BitVec 32) V!46435 V!46435 (_ BitVec 32) Int) ListLongMap!17975)

(assert (=> b!1219377 (= lt!554397 (getCurrentListMapNoExtraKeys!5428 lt!554393 lt!554390 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78741)

(assert (=> b!1219377 (= lt!554395 (getCurrentListMapNoExtraKeys!5428 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!554398 () Unit!40406)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1122 (array!78739 array!78741 (_ BitVec 32) (_ BitVec 32) V!46435 V!46435 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40406)

(assert (=> b!1219377 (= lt!554398 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1122 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1219378 () Bool)

(declare-fun e!692346 () Bool)

(assert (=> b!1219378 (= e!692346 (and e!692356 mapRes!48358))))

(declare-fun condMapEmpty!48358 () Bool)

(declare-fun mapDefault!48358 () ValueCell!14781)

(assert (=> b!1219378 (= condMapEmpty!48358 (= (arr!38001 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14781)) mapDefault!48358)))))

(declare-fun b!1219379 () Bool)

(declare-fun e!692355 () Bool)

(assert (=> b!1219379 (= e!692345 e!692355)))

(declare-fun res!809874 () Bool)

(assert (=> b!1219379 (=> (not res!809874) (not e!692355))))

(assert (=> b!1219379 (= res!809874 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554393 mask!1564))))

(assert (=> b!1219379 (= lt!554393 (array!78740 (store (arr!38000 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38536 _keys!1208)))))

(declare-fun b!1219380 () Bool)

(declare-fun res!809866 () Bool)

(assert (=> b!1219380 (=> (not res!809866) (not e!692345))))

(assert (=> b!1219380 (= res!809866 (validKeyInArray!0 k0!934))))

(declare-fun b!1219381 () Bool)

(declare-fun e!692353 () Bool)

(assert (=> b!1219381 (= e!692355 (not e!692353))))

(declare-fun res!809877 () Bool)

(assert (=> b!1219381 (=> res!809877 e!692353)))

(assert (=> b!1219381 (= res!809877 (bvsgt from!1455 i!673))))

(assert (=> b!1219381 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!554400 () Unit!40406)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78739 (_ BitVec 64) (_ BitVec 32)) Unit!40406)

(assert (=> b!1219381 (= lt!554400 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1219382 () Bool)

(declare-fun res!809879 () Bool)

(assert (=> b!1219382 (=> (not res!809879) (not e!692345))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1219382 (= res!809879 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!48358 () Bool)

(declare-fun tp!91864 () Bool)

(assert (=> mapNonEmpty!48358 (= mapRes!48358 (and tp!91864 e!692352))))

(declare-fun mapRest!48358 () (Array (_ BitVec 32) ValueCell!14781))

(declare-fun mapKey!48358 () (_ BitVec 32))

(declare-fun mapValue!48358 () ValueCell!14781)

(assert (=> mapNonEmpty!48358 (= (arr!38001 _values!996) (store mapRest!48358 mapKey!48358 mapValue!48358))))

(declare-fun b!1219383 () Bool)

(assert (=> b!1219383 (= e!692351 e!692350)))

(declare-fun res!809875 () Bool)

(assert (=> b!1219383 (=> res!809875 e!692350)))

(assert (=> b!1219383 (= res!809875 (not (= (select (arr!38000 _keys!1208) from!1455) k0!934)))))

(declare-fun e!692347 () Bool)

(assert (=> b!1219383 e!692347))

(declare-fun res!809868 () Bool)

(assert (=> b!1219383 (=> (not res!809868) (not e!692347))))

(declare-fun lt!554399 () V!46435)

(declare-fun lt!554396 () ListLongMap!17975)

(declare-fun +!4072 (ListLongMap!17975 tuple2!20006) ListLongMap!17975)

(declare-fun get!19379 (ValueCell!14781 V!46435) V!46435)

(assert (=> b!1219383 (= res!809868 (= lt!554396 (+!4072 lt!554391 (tuple2!20007 (select (arr!38000 _keys!1208) from!1455) (get!19379 (select (arr!38001 _values!996) from!1455) lt!554399)))))))

(declare-fun b!1219384 () Bool)

(declare-fun res!809878 () Bool)

(assert (=> b!1219384 (=> (not res!809878) (not e!692345))))

(assert (=> b!1219384 (= res!809878 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38536 _keys!1208))))))

(declare-fun b!1219372 () Bool)

(assert (=> b!1219372 (= e!692347 e!692354)))

(declare-fun res!809870 () Bool)

(assert (=> b!1219372 (=> res!809870 e!692354)))

(assert (=> b!1219372 (= res!809870 (not (= (select (arr!38000 _keys!1208) from!1455) k0!934)))))

(declare-fun res!809871 () Bool)

(assert (=> start!101460 (=> (not res!809871) (not e!692345))))

(assert (=> start!101460 (= res!809871 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38536 _keys!1208))))))

(assert (=> start!101460 e!692345))

(assert (=> start!101460 tp_is_empty!30981))

(declare-fun array_inv!28920 (array!78739) Bool)

(assert (=> start!101460 (array_inv!28920 _keys!1208)))

(assert (=> start!101460 true))

(assert (=> start!101460 tp!91865))

(declare-fun array_inv!28921 (array!78741) Bool)

(assert (=> start!101460 (and (array_inv!28921 _values!996) e!692346)))

(declare-fun b!1219385 () Bool)

(declare-fun res!809869 () Bool)

(assert (=> b!1219385 (=> (not res!809869) (not e!692345))))

(assert (=> b!1219385 (= res!809869 (and (= (size!38537 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38536 _keys!1208) (size!38537 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1219386 () Bool)

(assert (=> b!1219386 (= e!692353 e!692348)))

(declare-fun res!809867 () Bool)

(assert (=> b!1219386 (=> res!809867 e!692348)))

(assert (=> b!1219386 (= res!809867 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1219386 (= lt!554396 (getCurrentListMapNoExtraKeys!5428 lt!554393 lt!554390 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1219386 (= lt!554390 (array!78742 (store (arr!38001 _values!996) i!673 (ValueCellFull!14781 lt!554399)) (size!38537 _values!996)))))

(declare-fun dynLambda!3310 (Int (_ BitVec 64)) V!46435)

(assert (=> b!1219386 (= lt!554399 (dynLambda!3310 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!554394 () ListLongMap!17975)

(assert (=> b!1219386 (= lt!554394 (getCurrentListMapNoExtraKeys!5428 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1219387 () Bool)

(declare-fun res!809865 () Bool)

(assert (=> b!1219387 (=> (not res!809865) (not e!692355))))

(assert (=> b!1219387 (= res!809865 (arrayNoDuplicates!0 lt!554393 #b00000000000000000000000000000000 Nil!26804))))

(assert (= (and start!101460 res!809871) b!1219382))

(assert (= (and b!1219382 res!809879) b!1219385))

(assert (= (and b!1219385 res!809869) b!1219375))

(assert (= (and b!1219375 res!809876) b!1219373))

(assert (= (and b!1219373 res!809880) b!1219384))

(assert (= (and b!1219384 res!809878) b!1219380))

(assert (= (and b!1219380 res!809866) b!1219371))

(assert (= (and b!1219371 res!809872) b!1219379))

(assert (= (and b!1219379 res!809874) b!1219387))

(assert (= (and b!1219387 res!809865) b!1219381))

(assert (= (and b!1219381 (not res!809877)) b!1219386))

(assert (= (and b!1219386 (not res!809867)) b!1219377))

(assert (= (and b!1219377 (not res!809873)) b!1219383))

(assert (= (and b!1219383 res!809868) b!1219372))

(assert (= (and b!1219372 (not res!809870)) b!1219370))

(assert (= (and b!1219383 (not res!809875)) b!1219376))

(assert (= (and b!1219378 condMapEmpty!48358) mapIsEmpty!48358))

(assert (= (and b!1219378 (not condMapEmpty!48358)) mapNonEmpty!48358))

(get-info :version)

(assert (= (and mapNonEmpty!48358 ((_ is ValueCellFull!14781) mapValue!48358)) b!1219374))

(assert (= (and b!1219378 ((_ is ValueCellFull!14781) mapDefault!48358)) b!1219369))

(assert (= start!101460 b!1219378))

(declare-fun b_lambda!22105 () Bool)

(assert (=> (not b_lambda!22105) (not b!1219386)))

(declare-fun t!40063 () Bool)

(declare-fun tb!11077 () Bool)

(assert (=> (and start!101460 (= defaultEntry!1004 defaultEntry!1004) t!40063) tb!11077))

(declare-fun result!22759 () Bool)

(assert (=> tb!11077 (= result!22759 tp_is_empty!30981)))

(assert (=> b!1219386 t!40063))

(declare-fun b_and!43745 () Bool)

(assert (= b_and!43743 (and (=> t!40063 result!22759) b_and!43745)))

(declare-fun m!1124151 () Bool)

(assert (=> start!101460 m!1124151))

(declare-fun m!1124153 () Bool)

(assert (=> start!101460 m!1124153))

(declare-fun m!1124155 () Bool)

(assert (=> b!1219387 m!1124155))

(declare-fun m!1124157 () Bool)

(assert (=> b!1219386 m!1124157))

(declare-fun m!1124159 () Bool)

(assert (=> b!1219386 m!1124159))

(declare-fun m!1124161 () Bool)

(assert (=> b!1219386 m!1124161))

(declare-fun m!1124163 () Bool)

(assert (=> b!1219386 m!1124163))

(declare-fun m!1124165 () Bool)

(assert (=> b!1219373 m!1124165))

(declare-fun m!1124167 () Bool)

(assert (=> b!1219370 m!1124167))

(declare-fun m!1124169 () Bool)

(assert (=> b!1219383 m!1124169))

(declare-fun m!1124171 () Bool)

(assert (=> b!1219383 m!1124171))

(assert (=> b!1219383 m!1124171))

(declare-fun m!1124173 () Bool)

(assert (=> b!1219383 m!1124173))

(declare-fun m!1124175 () Bool)

(assert (=> b!1219383 m!1124175))

(declare-fun m!1124177 () Bool)

(assert (=> mapNonEmpty!48358 m!1124177))

(declare-fun m!1124179 () Bool)

(assert (=> b!1219379 m!1124179))

(declare-fun m!1124181 () Bool)

(assert (=> b!1219379 m!1124181))

(declare-fun m!1124183 () Bool)

(assert (=> b!1219376 m!1124183))

(declare-fun m!1124185 () Bool)

(assert (=> b!1219376 m!1124185))

(declare-fun m!1124187 () Bool)

(assert (=> b!1219375 m!1124187))

(assert (=> b!1219372 m!1124169))

(declare-fun m!1124189 () Bool)

(assert (=> b!1219377 m!1124189))

(declare-fun m!1124191 () Bool)

(assert (=> b!1219377 m!1124191))

(assert (=> b!1219377 m!1124169))

(declare-fun m!1124193 () Bool)

(assert (=> b!1219377 m!1124193))

(declare-fun m!1124195 () Bool)

(assert (=> b!1219377 m!1124195))

(assert (=> b!1219377 m!1124169))

(declare-fun m!1124197 () Bool)

(assert (=> b!1219377 m!1124197))

(declare-fun m!1124199 () Bool)

(assert (=> b!1219381 m!1124199))

(declare-fun m!1124201 () Bool)

(assert (=> b!1219381 m!1124201))

(declare-fun m!1124203 () Bool)

(assert (=> b!1219371 m!1124203))

(declare-fun m!1124205 () Bool)

(assert (=> b!1219382 m!1124205))

(declare-fun m!1124207 () Bool)

(assert (=> b!1219380 m!1124207))

(check-sat (not b!1219377) (not start!101460) (not mapNonEmpty!48358) (not b!1219381) (not b!1219375) (not b!1219373) (not b!1219386) (not b!1219387) (not b!1219380) (not b!1219376) tp_is_empty!30981 (not b!1219382) (not b_next!26277) (not b!1219379) b_and!43745 (not b_lambda!22105) (not b!1219370) (not b!1219383))
(check-sat b_and!43745 (not b_next!26277))
