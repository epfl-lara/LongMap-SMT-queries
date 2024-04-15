; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99610 () Bool)

(assert start!99610)

(declare-fun b_free!25195 () Bool)

(declare-fun b_next!25195 () Bool)

(assert (=> start!99610 (= b_free!25195 (not b_next!25195))))

(declare-fun tp!88298 () Bool)

(declare-fun b_and!41235 () Bool)

(assert (=> start!99610 (= tp!88298 b_and!41235)))

(declare-fun b!1180085 () Bool)

(declare-fun res!784111 () Bool)

(declare-fun e!670908 () Bool)

(assert (=> b!1180085 (=> (not res!784111) (not e!670908))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1180085 (= res!784111 (validMask!0 mask!1564))))

(declare-fun b!1180086 () Bool)

(declare-fun res!784109 () Bool)

(assert (=> b!1180086 (=> (not res!784109) (not e!670908))))

(declare-datatypes ((array!76188 0))(
  ( (array!76189 (arr!36744 (Array (_ BitVec 32) (_ BitVec 64))) (size!37282 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76188)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1180086 (= res!784109 (= (select (arr!36744 _keys!1208) i!673) k0!934))))

(declare-fun b!1180087 () Bool)

(declare-fun e!670910 () Bool)

(declare-fun e!670907 () Bool)

(assert (=> b!1180087 (= e!670910 e!670907)))

(declare-fun res!784101 () Bool)

(assert (=> b!1180087 (=> res!784101 e!670907)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1180087 (= res!784101 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44761 0))(
  ( (V!44762 (val!14919 Int)) )
))
(declare-fun zeroValue!944 () V!44761)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19214 0))(
  ( (tuple2!19215 (_1!9618 (_ BitVec 64)) (_2!9618 V!44761)) )
))
(declare-datatypes ((List!25922 0))(
  ( (Nil!25919) (Cons!25918 (h!27127 tuple2!19214) (t!38100 List!25922)) )
))
(declare-datatypes ((ListLongMap!17183 0))(
  ( (ListLongMap!17184 (toList!8607 List!25922)) )
))
(declare-fun lt!533365 () ListLongMap!17183)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!533372 () array!76188)

(declare-fun minValue!944 () V!44761)

(declare-datatypes ((ValueCell!14153 0))(
  ( (ValueCellFull!14153 (v!17556 V!44761)) (EmptyCell!14153) )
))
(declare-datatypes ((array!76190 0))(
  ( (array!76191 (arr!36745 (Array (_ BitVec 32) ValueCell!14153)) (size!37283 (_ BitVec 32))) )
))
(declare-fun lt!533373 () array!76190)

(declare-fun getCurrentListMapNoExtraKeys!5065 (array!76188 array!76190 (_ BitVec 32) (_ BitVec 32) V!44761 V!44761 (_ BitVec 32) Int) ListLongMap!17183)

(assert (=> b!1180087 (= lt!533365 (getCurrentListMapNoExtraKeys!5065 lt!533372 lt!533373 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!533364 () V!44761)

(declare-fun _values!996 () array!76190)

(assert (=> b!1180087 (= lt!533373 (array!76191 (store (arr!36745 _values!996) i!673 (ValueCellFull!14153 lt!533364)) (size!37283 _values!996)))))

(declare-fun dynLambda!2977 (Int (_ BitVec 64)) V!44761)

(assert (=> b!1180087 (= lt!533364 (dynLambda!2977 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!533366 () ListLongMap!17183)

(assert (=> b!1180087 (= lt!533366 (getCurrentListMapNoExtraKeys!5065 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1180088 () Bool)

(declare-fun e!670904 () Bool)

(declare-fun tp_is_empty!29725 () Bool)

(assert (=> b!1180088 (= e!670904 tp_is_empty!29725)))

(declare-fun b!1180089 () Bool)

(declare-datatypes ((Unit!38860 0))(
  ( (Unit!38861) )
))
(declare-fun e!670901 () Unit!38860)

(declare-fun Unit!38862 () Unit!38860)

(assert (=> b!1180089 (= e!670901 Unit!38862)))

(declare-fun lt!533368 () Unit!38860)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76188 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38860)

(assert (=> b!1180089 (= lt!533368 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76188 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1180089 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!533371 () Unit!38860)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76188 (_ BitVec 32) (_ BitVec 32)) Unit!38860)

(assert (=> b!1180089 (= lt!533371 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25923 0))(
  ( (Nil!25920) (Cons!25919 (h!27128 (_ BitVec 64)) (t!38101 List!25923)) )
))
(declare-fun arrayNoDuplicates!0 (array!76188 (_ BitVec 32) List!25923) Bool)

(assert (=> b!1180089 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25920)))

(declare-fun lt!533367 () Unit!38860)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76188 (_ BitVec 64) (_ BitVec 32) List!25923) Unit!38860)

(assert (=> b!1180089 (= lt!533367 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25920))))

(assert (=> b!1180089 false))

(declare-fun b!1180090 () Bool)

(declare-fun e!670902 () Bool)

(assert (=> b!1180090 (= e!670908 e!670902)))

(declare-fun res!784112 () Bool)

(assert (=> b!1180090 (=> (not res!784112) (not e!670902))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76188 (_ BitVec 32)) Bool)

(assert (=> b!1180090 (= res!784112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!533372 mask!1564))))

(assert (=> b!1180090 (= lt!533372 (array!76189 (store (arr!36744 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37282 _keys!1208)))))

(declare-fun b!1180091 () Bool)

(declare-fun e!670905 () Bool)

(declare-fun e!670912 () Bool)

(assert (=> b!1180091 (= e!670905 e!670912)))

(declare-fun res!784113 () Bool)

(assert (=> b!1180091 (=> res!784113 e!670912)))

(assert (=> b!1180091 (= res!784113 (not (= (select (arr!36744 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1180092 () Bool)

(declare-fun res!784110 () Bool)

(assert (=> b!1180092 (=> (not res!784110) (not e!670908))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1180092 (= res!784110 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!46415 () Bool)

(declare-fun mapRes!46415 () Bool)

(declare-fun tp!88299 () Bool)

(declare-fun e!670900 () Bool)

(assert (=> mapNonEmpty!46415 (= mapRes!46415 (and tp!88299 e!670900))))

(declare-fun mapValue!46415 () ValueCell!14153)

(declare-fun mapRest!46415 () (Array (_ BitVec 32) ValueCell!14153))

(declare-fun mapKey!46415 () (_ BitVec 32))

(assert (=> mapNonEmpty!46415 (= (arr!36745 _values!996) (store mapRest!46415 mapKey!46415 mapValue!46415))))

(declare-fun b!1180093 () Bool)

(declare-fun res!784106 () Bool)

(assert (=> b!1180093 (=> (not res!784106) (not e!670908))))

(assert (=> b!1180093 (= res!784106 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25920))))

(declare-fun b!1180094 () Bool)

(declare-fun Unit!38863 () Unit!38860)

(assert (=> b!1180094 (= e!670901 Unit!38863)))

(declare-fun res!784105 () Bool)

(assert (=> start!99610 (=> (not res!784105) (not e!670908))))

(assert (=> start!99610 (= res!784105 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37282 _keys!1208))))))

(assert (=> start!99610 e!670908))

(assert (=> start!99610 tp_is_empty!29725))

(declare-fun array_inv!28168 (array!76188) Bool)

(assert (=> start!99610 (array_inv!28168 _keys!1208)))

(assert (=> start!99610 true))

(assert (=> start!99610 tp!88298))

(declare-fun e!670909 () Bool)

(declare-fun array_inv!28169 (array!76190) Bool)

(assert (=> start!99610 (and (array_inv!28169 _values!996) e!670909)))

(declare-fun b!1180095 () Bool)

(declare-fun e!670911 () Bool)

(assert (=> b!1180095 (= e!670911 true)))

(declare-fun e!670903 () Bool)

(assert (=> b!1180095 e!670903))

(declare-fun res!784108 () Bool)

(assert (=> b!1180095 (=> (not res!784108) (not e!670903))))

(assert (=> b!1180095 (= res!784108 (not (= (select (arr!36744 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!533370 () Unit!38860)

(assert (=> b!1180095 (= lt!533370 e!670901)))

(declare-fun c!116890 () Bool)

(assert (=> b!1180095 (= c!116890 (= (select (arr!36744 _keys!1208) from!1455) k0!934))))

(assert (=> b!1180095 e!670905))

(declare-fun res!784103 () Bool)

(assert (=> b!1180095 (=> (not res!784103) (not e!670905))))

(declare-fun lt!533375 () ListLongMap!17183)

(declare-fun lt!533363 () tuple2!19214)

(declare-fun +!3906 (ListLongMap!17183 tuple2!19214) ListLongMap!17183)

(assert (=> b!1180095 (= res!784103 (= lt!533365 (+!3906 lt!533375 lt!533363)))))

(declare-fun get!18795 (ValueCell!14153 V!44761) V!44761)

(assert (=> b!1180095 (= lt!533363 (tuple2!19215 (select (arr!36744 _keys!1208) from!1455) (get!18795 (select (arr!36745 _values!996) from!1455) lt!533364)))))

(declare-fun b!1180096 () Bool)

(declare-fun res!784107 () Bool)

(assert (=> b!1180096 (=> (not res!784107) (not e!670903))))

(declare-fun lt!533374 () ListLongMap!17183)

(assert (=> b!1180096 (= res!784107 (= lt!533366 (+!3906 lt!533374 lt!533363)))))

(declare-fun b!1180097 () Bool)

(declare-fun res!784117 () Bool)

(assert (=> b!1180097 (=> (not res!784117) (not e!670902))))

(assert (=> b!1180097 (= res!784117 (arrayNoDuplicates!0 lt!533372 #b00000000000000000000000000000000 Nil!25920))))

(declare-fun b!1180098 () Bool)

(assert (=> b!1180098 (= e!670907 e!670911)))

(declare-fun res!784102 () Bool)

(assert (=> b!1180098 (=> res!784102 e!670911)))

(assert (=> b!1180098 (= res!784102 (not (validKeyInArray!0 (select (arr!36744 _keys!1208) from!1455))))))

(declare-fun lt!533362 () ListLongMap!17183)

(assert (=> b!1180098 (= lt!533362 lt!533375)))

(declare-fun -!1570 (ListLongMap!17183 (_ BitVec 64)) ListLongMap!17183)

(assert (=> b!1180098 (= lt!533375 (-!1570 lt!533374 k0!934))))

(assert (=> b!1180098 (= lt!533362 (getCurrentListMapNoExtraKeys!5065 lt!533372 lt!533373 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1180098 (= lt!533374 (getCurrentListMapNoExtraKeys!5065 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!533376 () Unit!38860)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!834 (array!76188 array!76190 (_ BitVec 32) (_ BitVec 32) V!44761 V!44761 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38860)

(assert (=> b!1180098 (= lt!533376 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!834 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!46415 () Bool)

(assert (=> mapIsEmpty!46415 mapRes!46415))

(declare-fun b!1180099 () Bool)

(declare-fun res!784115 () Bool)

(assert (=> b!1180099 (=> (not res!784115) (not e!670908))))

(assert (=> b!1180099 (= res!784115 (and (= (size!37283 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37282 _keys!1208) (size!37283 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1180100 () Bool)

(assert (=> b!1180100 (= e!670912 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1180101 () Bool)

(assert (=> b!1180101 (= e!670900 tp_is_empty!29725)))

(declare-fun b!1180102 () Bool)

(assert (=> b!1180102 (= e!670909 (and e!670904 mapRes!46415))))

(declare-fun condMapEmpty!46415 () Bool)

(declare-fun mapDefault!46415 () ValueCell!14153)

(assert (=> b!1180102 (= condMapEmpty!46415 (= (arr!36745 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14153)) mapDefault!46415)))))

(declare-fun b!1180103 () Bool)

(declare-fun res!784104 () Bool)

(assert (=> b!1180103 (=> (not res!784104) (not e!670908))))

(assert (=> b!1180103 (= res!784104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1180104 () Bool)

(assert (=> b!1180104 (= e!670903 (= lt!533375 lt!533362))))

(declare-fun b!1180105 () Bool)

(assert (=> b!1180105 (= e!670902 (not e!670910))))

(declare-fun res!784116 () Bool)

(assert (=> b!1180105 (=> res!784116 e!670910)))

(assert (=> b!1180105 (= res!784116 (bvsgt from!1455 i!673))))

(assert (=> b!1180105 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!533369 () Unit!38860)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76188 (_ BitVec 64) (_ BitVec 32)) Unit!38860)

(assert (=> b!1180105 (= lt!533369 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1180106 () Bool)

(declare-fun res!784114 () Bool)

(assert (=> b!1180106 (=> (not res!784114) (not e!670908))))

(assert (=> b!1180106 (= res!784114 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37282 _keys!1208))))))

(assert (= (and start!99610 res!784105) b!1180085))

(assert (= (and b!1180085 res!784111) b!1180099))

(assert (= (and b!1180099 res!784115) b!1180103))

(assert (= (and b!1180103 res!784104) b!1180093))

(assert (= (and b!1180093 res!784106) b!1180106))

(assert (= (and b!1180106 res!784114) b!1180092))

(assert (= (and b!1180092 res!784110) b!1180086))

(assert (= (and b!1180086 res!784109) b!1180090))

(assert (= (and b!1180090 res!784112) b!1180097))

(assert (= (and b!1180097 res!784117) b!1180105))

(assert (= (and b!1180105 (not res!784116)) b!1180087))

(assert (= (and b!1180087 (not res!784101)) b!1180098))

(assert (= (and b!1180098 (not res!784102)) b!1180095))

(assert (= (and b!1180095 res!784103) b!1180091))

(assert (= (and b!1180091 (not res!784113)) b!1180100))

(assert (= (and b!1180095 c!116890) b!1180089))

(assert (= (and b!1180095 (not c!116890)) b!1180094))

(assert (= (and b!1180095 res!784108) b!1180096))

(assert (= (and b!1180096 res!784107) b!1180104))

(assert (= (and b!1180102 condMapEmpty!46415) mapIsEmpty!46415))

(assert (= (and b!1180102 (not condMapEmpty!46415)) mapNonEmpty!46415))

(get-info :version)

(assert (= (and mapNonEmpty!46415 ((_ is ValueCellFull!14153) mapValue!46415)) b!1180101))

(assert (= (and b!1180102 ((_ is ValueCellFull!14153) mapDefault!46415)) b!1180088))

(assert (= start!99610 b!1180102))

(declare-fun b_lambda!20321 () Bool)

(assert (=> (not b_lambda!20321) (not b!1180087)))

(declare-fun t!38099 () Bool)

(declare-fun tb!9999 () Bool)

(assert (=> (and start!99610 (= defaultEntry!1004 defaultEntry!1004) t!38099) tb!9999))

(declare-fun result!20573 () Bool)

(assert (=> tb!9999 (= result!20573 tp_is_empty!29725)))

(assert (=> b!1180087 t!38099))

(declare-fun b_and!41237 () Bool)

(assert (= b_and!41235 (and (=> t!38099 result!20573) b_and!41237)))

(declare-fun m!1087559 () Bool)

(assert (=> b!1180087 m!1087559))

(declare-fun m!1087561 () Bool)

(assert (=> b!1180087 m!1087561))

(declare-fun m!1087563 () Bool)

(assert (=> b!1180087 m!1087563))

(declare-fun m!1087565 () Bool)

(assert (=> b!1180087 m!1087565))

(declare-fun m!1087567 () Bool)

(assert (=> b!1180091 m!1087567))

(declare-fun m!1087569 () Bool)

(assert (=> b!1180093 m!1087569))

(assert (=> b!1180095 m!1087567))

(declare-fun m!1087571 () Bool)

(assert (=> b!1180095 m!1087571))

(declare-fun m!1087573 () Bool)

(assert (=> b!1180095 m!1087573))

(assert (=> b!1180095 m!1087573))

(declare-fun m!1087575 () Bool)

(assert (=> b!1180095 m!1087575))

(declare-fun m!1087577 () Bool)

(assert (=> b!1180089 m!1087577))

(declare-fun m!1087579 () Bool)

(assert (=> b!1180089 m!1087579))

(declare-fun m!1087581 () Bool)

(assert (=> b!1180089 m!1087581))

(declare-fun m!1087583 () Bool)

(assert (=> b!1180089 m!1087583))

(declare-fun m!1087585 () Bool)

(assert (=> b!1180089 m!1087585))

(declare-fun m!1087587 () Bool)

(assert (=> b!1180086 m!1087587))

(declare-fun m!1087589 () Bool)

(assert (=> b!1180096 m!1087589))

(declare-fun m!1087591 () Bool)

(assert (=> mapNonEmpty!46415 m!1087591))

(declare-fun m!1087593 () Bool)

(assert (=> start!99610 m!1087593))

(declare-fun m!1087595 () Bool)

(assert (=> start!99610 m!1087595))

(declare-fun m!1087597 () Bool)

(assert (=> b!1180097 m!1087597))

(declare-fun m!1087599 () Bool)

(assert (=> b!1180105 m!1087599))

(declare-fun m!1087601 () Bool)

(assert (=> b!1180105 m!1087601))

(declare-fun m!1087603 () Bool)

(assert (=> b!1180103 m!1087603))

(declare-fun m!1087605 () Bool)

(assert (=> b!1180100 m!1087605))

(declare-fun m!1087607 () Bool)

(assert (=> b!1180085 m!1087607))

(declare-fun m!1087609 () Bool)

(assert (=> b!1180092 m!1087609))

(declare-fun m!1087611 () Bool)

(assert (=> b!1180090 m!1087611))

(declare-fun m!1087613 () Bool)

(assert (=> b!1180090 m!1087613))

(declare-fun m!1087615 () Bool)

(assert (=> b!1180098 m!1087615))

(declare-fun m!1087617 () Bool)

(assert (=> b!1180098 m!1087617))

(declare-fun m!1087619 () Bool)

(assert (=> b!1180098 m!1087619))

(assert (=> b!1180098 m!1087567))

(declare-fun m!1087621 () Bool)

(assert (=> b!1180098 m!1087621))

(declare-fun m!1087623 () Bool)

(assert (=> b!1180098 m!1087623))

(assert (=> b!1180098 m!1087567))

(check-sat (not b!1180098) (not start!99610) (not b_next!25195) tp_is_empty!29725 (not b!1180100) b_and!41237 (not b!1180092) (not b!1180095) (not b_lambda!20321) (not b!1180103) (not b!1180093) (not b!1180085) (not b!1180096) (not b!1180089) (not b!1180090) (not b!1180087) (not b!1180097) (not b!1180105) (not mapNonEmpty!46415))
(check-sat b_and!41237 (not b_next!25195))
