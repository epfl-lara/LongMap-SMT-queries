; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99336 () Bool)

(assert start!99336)

(declare-fun b_free!24915 () Bool)

(declare-fun b_next!24915 () Bool)

(assert (=> start!99336 (= b_free!24915 (not b_next!24915))))

(declare-fun tp!87458 () Bool)

(declare-fun b_and!40697 () Bool)

(assert (=> start!99336 (= tp!87458 b_and!40697)))

(declare-fun b!1171175 () Bool)

(declare-fun e!665690 () Bool)

(declare-fun tp_is_empty!29445 () Bool)

(assert (=> b!1171175 (= e!665690 tp_is_empty!29445)))

(declare-fun b!1171177 () Bool)

(declare-fun res!777395 () Bool)

(declare-fun e!665692 () Bool)

(assert (=> b!1171177 (=> (not res!777395) (not e!665692))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1171177 (= res!777395 (validKeyInArray!0 k0!934))))

(declare-fun b!1171178 () Bool)

(declare-fun res!777391 () Bool)

(assert (=> b!1171178 (=> (not res!777391) (not e!665692))))

(declare-datatypes ((array!75709 0))(
  ( (array!75710 (arr!36504 (Array (_ BitVec 32) (_ BitVec 64))) (size!37040 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75709)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1171178 (= res!777391 (= (select (arr!36504 _keys!1208) i!673) k0!934))))

(declare-fun b!1171179 () Bool)

(declare-fun e!665683 () Bool)

(declare-fun e!665689 () Bool)

(assert (=> b!1171179 (= e!665683 e!665689)))

(declare-fun res!777392 () Bool)

(assert (=> b!1171179 (=> res!777392 e!665689)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1171179 (= res!777392 (or (bvsge (size!37040 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37040 _keys!1208)) (bvsge from!1455 (size!37040 _keys!1208))))))

(declare-datatypes ((List!25614 0))(
  ( (Nil!25611) (Cons!25610 (h!26819 (_ BitVec 64)) (t!37521 List!25614)) )
))
(declare-fun arrayNoDuplicates!0 (array!75709 (_ BitVec 32) List!25614) Bool)

(assert (=> b!1171179 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25611)))

(declare-datatypes ((Unit!38632 0))(
  ( (Unit!38633) )
))
(declare-fun lt!527555 () Unit!38632)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75709 (_ BitVec 32) (_ BitVec 32)) Unit!38632)

(assert (=> b!1171179 (= lt!527555 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun arrayContainsKey!0 (array!75709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1171179 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!527554 () Unit!38632)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75709 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38632)

(assert (=> b!1171179 (= lt!527554 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1171180 () Bool)

(declare-fun e!665691 () Bool)

(assert (=> b!1171180 (= e!665691 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1171181 () Bool)

(declare-fun e!665682 () Bool)

(declare-fun e!665681 () Bool)

(assert (=> b!1171181 (= e!665682 (not e!665681))))

(declare-fun res!777386 () Bool)

(assert (=> b!1171181 (=> res!777386 e!665681)))

(assert (=> b!1171181 (= res!777386 (bvsgt from!1455 i!673))))

(assert (=> b!1171181 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!527560 () Unit!38632)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75709 (_ BitVec 64) (_ BitVec 32)) Unit!38632)

(assert (=> b!1171181 (= lt!527560 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1171182 () Bool)

(assert (=> b!1171182 (= e!665692 e!665682)))

(declare-fun res!777380 () Bool)

(assert (=> b!1171182 (=> (not res!777380) (not e!665682))))

(declare-fun lt!527557 () array!75709)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75709 (_ BitVec 32)) Bool)

(assert (=> b!1171182 (= res!777380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527557 mask!1564))))

(assert (=> b!1171182 (= lt!527557 (array!75710 (store (arr!36504 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37040 _keys!1208)))))

(declare-fun b!1171183 () Bool)

(declare-fun res!777394 () Bool)

(assert (=> b!1171183 (=> (not res!777394) (not e!665692))))

(assert (=> b!1171183 (= res!777394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1171184 () Bool)

(declare-fun res!777387 () Bool)

(assert (=> b!1171184 (=> (not res!777387) (not e!665682))))

(assert (=> b!1171184 (= res!777387 (arrayNoDuplicates!0 lt!527557 #b00000000000000000000000000000000 Nil!25611))))

(declare-fun res!777393 () Bool)

(assert (=> start!99336 (=> (not res!777393) (not e!665692))))

(assert (=> start!99336 (= res!777393 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37040 _keys!1208))))))

(assert (=> start!99336 e!665692))

(assert (=> start!99336 tp_is_empty!29445))

(declare-fun array_inv!27900 (array!75709) Bool)

(assert (=> start!99336 (array_inv!27900 _keys!1208)))

(assert (=> start!99336 true))

(assert (=> start!99336 tp!87458))

(declare-datatypes ((V!44387 0))(
  ( (V!44388 (val!14779 Int)) )
))
(declare-datatypes ((ValueCell!14013 0))(
  ( (ValueCellFull!14013 (v!17417 V!44387)) (EmptyCell!14013) )
))
(declare-datatypes ((array!75711 0))(
  ( (array!75712 (arr!36505 (Array (_ BitVec 32) ValueCell!14013)) (size!37041 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75711)

(declare-fun e!665686 () Bool)

(declare-fun array_inv!27901 (array!75711) Bool)

(assert (=> start!99336 (and (array_inv!27901 _values!996) e!665686)))

(declare-fun b!1171176 () Bool)

(declare-fun res!777385 () Bool)

(assert (=> b!1171176 (=> (not res!777385) (not e!665692))))

(assert (=> b!1171176 (= res!777385 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25611))))

(declare-fun b!1171185 () Bool)

(declare-fun res!777383 () Bool)

(assert (=> b!1171185 (=> res!777383 e!665689)))

(declare-fun noDuplicate!1607 (List!25614) Bool)

(assert (=> b!1171185 (= res!777383 (not (noDuplicate!1607 Nil!25611)))))

(declare-fun b!1171186 () Bool)

(declare-fun res!777397 () Bool)

(assert (=> b!1171186 (=> (not res!777397) (not e!665692))))

(assert (=> b!1171186 (= res!777397 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37040 _keys!1208))))))

(declare-fun mapNonEmpty!45995 () Bool)

(declare-fun mapRes!45995 () Bool)

(declare-fun tp!87459 () Bool)

(assert (=> mapNonEmpty!45995 (= mapRes!45995 (and tp!87459 e!665690))))

(declare-fun mapRest!45995 () (Array (_ BitVec 32) ValueCell!14013))

(declare-fun mapKey!45995 () (_ BitVec 32))

(declare-fun mapValue!45995 () ValueCell!14013)

(assert (=> mapNonEmpty!45995 (= (arr!36505 _values!996) (store mapRest!45995 mapKey!45995 mapValue!45995))))

(declare-fun b!1171187 () Bool)

(declare-fun e!665684 () Bool)

(declare-fun e!665688 () Bool)

(assert (=> b!1171187 (= e!665684 e!665688)))

(declare-fun res!777384 () Bool)

(assert (=> b!1171187 (=> res!777384 e!665688)))

(assert (=> b!1171187 (= res!777384 (not (validKeyInArray!0 (select (arr!36504 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!18878 0))(
  ( (tuple2!18879 (_1!9450 (_ BitVec 64)) (_2!9450 V!44387)) )
))
(declare-datatypes ((List!25615 0))(
  ( (Nil!25612) (Cons!25611 (h!26820 tuple2!18878) (t!37522 List!25615)) )
))
(declare-datatypes ((ListLongMap!16847 0))(
  ( (ListLongMap!16848 (toList!8439 List!25615)) )
))
(declare-fun lt!527558 () ListLongMap!16847)

(declare-fun lt!527562 () ListLongMap!16847)

(assert (=> b!1171187 (= lt!527558 lt!527562)))

(declare-fun lt!527559 () ListLongMap!16847)

(declare-fun -!1509 (ListLongMap!16847 (_ BitVec 64)) ListLongMap!16847)

(assert (=> b!1171187 (= lt!527562 (-!1509 lt!527559 k0!934))))

(declare-fun zeroValue!944 () V!44387)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44387)

(declare-fun lt!527561 () array!75711)

(declare-fun getCurrentListMapNoExtraKeys!4903 (array!75709 array!75711 (_ BitVec 32) (_ BitVec 32) V!44387 V!44387 (_ BitVec 32) Int) ListLongMap!16847)

(assert (=> b!1171187 (= lt!527558 (getCurrentListMapNoExtraKeys!4903 lt!527557 lt!527561 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1171187 (= lt!527559 (getCurrentListMapNoExtraKeys!4903 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!527556 () Unit!38632)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!736 (array!75709 array!75711 (_ BitVec 32) (_ BitVec 32) V!44387 V!44387 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38632)

(assert (=> b!1171187 (= lt!527556 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!736 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!45995 () Bool)

(assert (=> mapIsEmpty!45995 mapRes!45995))

(declare-fun b!1171188 () Bool)

(declare-fun res!777379 () Bool)

(assert (=> b!1171188 (=> (not res!777379) (not e!665692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1171188 (= res!777379 (validMask!0 mask!1564))))

(declare-fun b!1171189 () Bool)

(assert (=> b!1171189 (= e!665689 true)))

(declare-fun lt!527553 () Bool)

(declare-fun contains!6845 (List!25614 (_ BitVec 64)) Bool)

(assert (=> b!1171189 (= lt!527553 (contains!6845 Nil!25611 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1171190 () Bool)

(declare-fun res!777389 () Bool)

(assert (=> b!1171190 (=> res!777389 e!665689)))

(assert (=> b!1171190 (= res!777389 (contains!6845 Nil!25611 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1171191 () Bool)

(declare-fun e!665680 () Bool)

(assert (=> b!1171191 (= e!665680 e!665691)))

(declare-fun res!777396 () Bool)

(assert (=> b!1171191 (=> res!777396 e!665691)))

(assert (=> b!1171191 (= res!777396 (not (= (select (arr!36504 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1171192 () Bool)

(declare-fun res!777390 () Bool)

(assert (=> b!1171192 (=> (not res!777390) (not e!665692))))

(assert (=> b!1171192 (= res!777390 (and (= (size!37041 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37040 _keys!1208) (size!37041 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1171193 () Bool)

(assert (=> b!1171193 (= e!665681 e!665684)))

(declare-fun res!777388 () Bool)

(assert (=> b!1171193 (=> res!777388 e!665684)))

(assert (=> b!1171193 (= res!777388 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!527550 () ListLongMap!16847)

(assert (=> b!1171193 (= lt!527550 (getCurrentListMapNoExtraKeys!4903 lt!527557 lt!527561 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!527552 () V!44387)

(assert (=> b!1171193 (= lt!527561 (array!75712 (store (arr!36505 _values!996) i!673 (ValueCellFull!14013 lt!527552)) (size!37041 _values!996)))))

(declare-fun dynLambda!2877 (Int (_ BitVec 64)) V!44387)

(assert (=> b!1171193 (= lt!527552 (dynLambda!2877 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527551 () ListLongMap!16847)

(assert (=> b!1171193 (= lt!527551 (getCurrentListMapNoExtraKeys!4903 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1171194 () Bool)

(assert (=> b!1171194 (= e!665688 e!665683)))

(declare-fun res!777381 () Bool)

(assert (=> b!1171194 (=> res!777381 e!665683)))

(assert (=> b!1171194 (= res!777381 (not (= (select (arr!36504 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1171194 e!665680))

(declare-fun res!777382 () Bool)

(assert (=> b!1171194 (=> (not res!777382) (not e!665680))))

(declare-fun +!3766 (ListLongMap!16847 tuple2!18878) ListLongMap!16847)

(declare-fun get!18618 (ValueCell!14013 V!44387) V!44387)

(assert (=> b!1171194 (= res!777382 (= lt!527550 (+!3766 lt!527562 (tuple2!18879 (select (arr!36504 _keys!1208) from!1455) (get!18618 (select (arr!36505 _values!996) from!1455) lt!527552)))))))

(declare-fun b!1171195 () Bool)

(declare-fun e!665687 () Bool)

(assert (=> b!1171195 (= e!665687 tp_is_empty!29445)))

(declare-fun b!1171196 () Bool)

(assert (=> b!1171196 (= e!665686 (and e!665687 mapRes!45995))))

(declare-fun condMapEmpty!45995 () Bool)

(declare-fun mapDefault!45995 () ValueCell!14013)

(assert (=> b!1171196 (= condMapEmpty!45995 (= (arr!36505 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14013)) mapDefault!45995)))))

(assert (= (and start!99336 res!777393) b!1171188))

(assert (= (and b!1171188 res!777379) b!1171192))

(assert (= (and b!1171192 res!777390) b!1171183))

(assert (= (and b!1171183 res!777394) b!1171176))

(assert (= (and b!1171176 res!777385) b!1171186))

(assert (= (and b!1171186 res!777397) b!1171177))

(assert (= (and b!1171177 res!777395) b!1171178))

(assert (= (and b!1171178 res!777391) b!1171182))

(assert (= (and b!1171182 res!777380) b!1171184))

(assert (= (and b!1171184 res!777387) b!1171181))

(assert (= (and b!1171181 (not res!777386)) b!1171193))

(assert (= (and b!1171193 (not res!777388)) b!1171187))

(assert (= (and b!1171187 (not res!777384)) b!1171194))

(assert (= (and b!1171194 res!777382) b!1171191))

(assert (= (and b!1171191 (not res!777396)) b!1171180))

(assert (= (and b!1171194 (not res!777381)) b!1171179))

(assert (= (and b!1171179 (not res!777392)) b!1171185))

(assert (= (and b!1171185 (not res!777383)) b!1171190))

(assert (= (and b!1171190 (not res!777389)) b!1171189))

(assert (= (and b!1171196 condMapEmpty!45995) mapIsEmpty!45995))

(assert (= (and b!1171196 (not condMapEmpty!45995)) mapNonEmpty!45995))

(get-info :version)

(assert (= (and mapNonEmpty!45995 ((_ is ValueCellFull!14013) mapValue!45995)) b!1171175))

(assert (= (and b!1171196 ((_ is ValueCellFull!14013) mapDefault!45995)) b!1171195))

(assert (= start!99336 b!1171196))

(declare-fun b_lambda!20059 () Bool)

(assert (=> (not b_lambda!20059) (not b!1171193)))

(declare-fun t!37520 () Bool)

(declare-fun tb!9727 () Bool)

(assert (=> (and start!99336 (= defaultEntry!1004 defaultEntry!1004) t!37520) tb!9727))

(declare-fun result!20021 () Bool)

(assert (=> tb!9727 (= result!20021 tp_is_empty!29445)))

(assert (=> b!1171193 t!37520))

(declare-fun b_and!40699 () Bool)

(assert (= b_and!40697 (and (=> t!37520 result!20021) b_and!40699)))

(declare-fun m!1078991 () Bool)

(assert (=> b!1171188 m!1078991))

(declare-fun m!1078993 () Bool)

(assert (=> b!1171187 m!1078993))

(declare-fun m!1078995 () Bool)

(assert (=> b!1171187 m!1078995))

(declare-fun m!1078997 () Bool)

(assert (=> b!1171187 m!1078997))

(declare-fun m!1078999 () Bool)

(assert (=> b!1171187 m!1078999))

(declare-fun m!1079001 () Bool)

(assert (=> b!1171187 m!1079001))

(declare-fun m!1079003 () Bool)

(assert (=> b!1171187 m!1079003))

(assert (=> b!1171187 m!1078999))

(declare-fun m!1079005 () Bool)

(assert (=> b!1171184 m!1079005))

(declare-fun m!1079007 () Bool)

(assert (=> b!1171176 m!1079007))

(declare-fun m!1079009 () Bool)

(assert (=> b!1171179 m!1079009))

(declare-fun m!1079011 () Bool)

(assert (=> b!1171179 m!1079011))

(declare-fun m!1079013 () Bool)

(assert (=> b!1171179 m!1079013))

(declare-fun m!1079015 () Bool)

(assert (=> b!1171179 m!1079015))

(declare-fun m!1079017 () Bool)

(assert (=> b!1171193 m!1079017))

(declare-fun m!1079019 () Bool)

(assert (=> b!1171193 m!1079019))

(declare-fun m!1079021 () Bool)

(assert (=> b!1171193 m!1079021))

(declare-fun m!1079023 () Bool)

(assert (=> b!1171193 m!1079023))

(declare-fun m!1079025 () Bool)

(assert (=> b!1171182 m!1079025))

(declare-fun m!1079027 () Bool)

(assert (=> b!1171182 m!1079027))

(declare-fun m!1079029 () Bool)

(assert (=> b!1171178 m!1079029))

(declare-fun m!1079031 () Bool)

(assert (=> start!99336 m!1079031))

(declare-fun m!1079033 () Bool)

(assert (=> start!99336 m!1079033))

(declare-fun m!1079035 () Bool)

(assert (=> b!1171190 m!1079035))

(assert (=> b!1171191 m!1078999))

(declare-fun m!1079037 () Bool)

(assert (=> b!1171180 m!1079037))

(declare-fun m!1079039 () Bool)

(assert (=> mapNonEmpty!45995 m!1079039))

(declare-fun m!1079041 () Bool)

(assert (=> b!1171181 m!1079041))

(declare-fun m!1079043 () Bool)

(assert (=> b!1171181 m!1079043))

(declare-fun m!1079045 () Bool)

(assert (=> b!1171185 m!1079045))

(declare-fun m!1079047 () Bool)

(assert (=> b!1171189 m!1079047))

(declare-fun m!1079049 () Bool)

(assert (=> b!1171183 m!1079049))

(assert (=> b!1171194 m!1078999))

(declare-fun m!1079051 () Bool)

(assert (=> b!1171194 m!1079051))

(assert (=> b!1171194 m!1079051))

(declare-fun m!1079053 () Bool)

(assert (=> b!1171194 m!1079053))

(declare-fun m!1079055 () Bool)

(assert (=> b!1171194 m!1079055))

(declare-fun m!1079057 () Bool)

(assert (=> b!1171177 m!1079057))

(check-sat (not b!1171184) (not b!1171180) (not b!1171177) tp_is_empty!29445 (not b!1171183) (not b!1171179) (not b!1171190) b_and!40699 (not b!1171185) (not b!1171176) (not b_next!24915) (not b_lambda!20059) (not b!1171193) (not b!1171188) (not mapNonEmpty!45995) (not start!99336) (not b!1171187) (not b!1171194) (not b!1171189) (not b!1171182) (not b!1171181))
(check-sat b_and!40699 (not b_next!24915))
