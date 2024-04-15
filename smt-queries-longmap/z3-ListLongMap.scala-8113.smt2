; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99538 () Bool)

(assert start!99538)

(declare-fun b_free!25123 () Bool)

(declare-fun b_next!25123 () Bool)

(assert (=> start!99538 (= b_free!25123 (not b_next!25123))))

(declare-fun tp!88083 () Bool)

(declare-fun b_and!41091 () Bool)

(assert (=> start!99538 (= tp!88083 b_and!41091)))

(declare-fun b!1177716 () Bool)

(declare-fun res!782356 () Bool)

(declare-fun e!669499 () Bool)

(assert (=> b!1177716 (=> (not res!782356) (not e!669499))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1177716 (= res!782356 (validKeyInArray!0 k0!934))))

(declare-fun b!1177718 () Bool)

(declare-fun res!782358 () Bool)

(assert (=> b!1177718 (=> (not res!782358) (not e!669499))))

(declare-datatypes ((array!76044 0))(
  ( (array!76045 (arr!36672 (Array (_ BitVec 32) (_ BitVec 64))) (size!37210 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76044)

(declare-datatypes ((List!25856 0))(
  ( (Nil!25853) (Cons!25852 (h!27061 (_ BitVec 64)) (t!37962 List!25856)) )
))
(declare-fun arrayNoDuplicates!0 (array!76044 (_ BitVec 32) List!25856) Bool)

(assert (=> b!1177718 (= res!782358 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25853))))

(declare-fun b!1177719 () Bool)

(declare-fun res!782352 () Bool)

(assert (=> b!1177719 (=> (not res!782352) (not e!669499))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1177719 (= res!782352 (= (select (arr!36672 _keys!1208) i!673) k0!934))))

(declare-fun b!1177720 () Bool)

(declare-fun e!669504 () Bool)

(assert (=> b!1177720 (= e!669499 e!669504)))

(declare-fun res!782350 () Bool)

(assert (=> b!1177720 (=> (not res!782350) (not e!669504))))

(declare-fun lt!531745 () array!76044)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76044 (_ BitVec 32)) Bool)

(assert (=> b!1177720 (= res!782350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!531745 mask!1564))))

(assert (=> b!1177720 (= lt!531745 (array!76045 (store (arr!36672 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37210 _keys!1208)))))

(declare-fun b!1177721 () Bool)

(declare-fun e!669507 () Bool)

(declare-fun e!669497 () Bool)

(assert (=> b!1177721 (= e!669507 e!669497)))

(declare-fun res!782354 () Bool)

(assert (=> b!1177721 (=> res!782354 e!669497)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1177721 (= res!782354 (not (validKeyInArray!0 (select (arr!36672 _keys!1208) from!1455))))))

(declare-datatypes ((V!44665 0))(
  ( (V!44666 (val!14883 Int)) )
))
(declare-datatypes ((tuple2!19148 0))(
  ( (tuple2!19149 (_1!9585 (_ BitVec 64)) (_2!9585 V!44665)) )
))
(declare-datatypes ((List!25857 0))(
  ( (Nil!25854) (Cons!25853 (h!27062 tuple2!19148) (t!37963 List!25857)) )
))
(declare-datatypes ((ListLongMap!17117 0))(
  ( (ListLongMap!17118 (toList!8574 List!25857)) )
))
(declare-fun lt!531753 () ListLongMap!17117)

(declare-fun lt!531754 () ListLongMap!17117)

(assert (=> b!1177721 (= lt!531753 lt!531754)))

(declare-fun lt!531747 () ListLongMap!17117)

(declare-fun -!1545 (ListLongMap!17117 (_ BitVec 64)) ListLongMap!17117)

(assert (=> b!1177721 (= lt!531754 (-!1545 lt!531747 k0!934))))

(declare-fun zeroValue!944 () V!44665)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14117 0))(
  ( (ValueCellFull!14117 (v!17520 V!44665)) (EmptyCell!14117) )
))
(declare-datatypes ((array!76046 0))(
  ( (array!76047 (arr!36673 (Array (_ BitVec 32) ValueCell!14117)) (size!37211 (_ BitVec 32))) )
))
(declare-fun lt!531742 () array!76046)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44665)

(declare-fun getCurrentListMapNoExtraKeys!5038 (array!76044 array!76046 (_ BitVec 32) (_ BitVec 32) V!44665 V!44665 (_ BitVec 32) Int) ListLongMap!17117)

(assert (=> b!1177721 (= lt!531753 (getCurrentListMapNoExtraKeys!5038 lt!531745 lt!531742 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76046)

(assert (=> b!1177721 (= lt!531747 (getCurrentListMapNoExtraKeys!5038 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38741 0))(
  ( (Unit!38742) )
))
(declare-fun lt!531749 () Unit!38741)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!809 (array!76044 array!76046 (_ BitVec 32) (_ BitVec 32) V!44665 V!44665 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38741)

(assert (=> b!1177721 (= lt!531749 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!809 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!46307 () Bool)

(declare-fun mapRes!46307 () Bool)

(declare-fun tp!88082 () Bool)

(declare-fun e!669505 () Bool)

(assert (=> mapNonEmpty!46307 (= mapRes!46307 (and tp!88082 e!669505))))

(declare-fun mapValue!46307 () ValueCell!14117)

(declare-fun mapRest!46307 () (Array (_ BitVec 32) ValueCell!14117))

(declare-fun mapKey!46307 () (_ BitVec 32))

(assert (=> mapNonEmpty!46307 (= (arr!36673 _values!996) (store mapRest!46307 mapKey!46307 mapValue!46307))))

(declare-fun b!1177722 () Bool)

(declare-fun e!669502 () Bool)

(declare-fun e!669501 () Bool)

(assert (=> b!1177722 (= e!669502 (and e!669501 mapRes!46307))))

(declare-fun condMapEmpty!46307 () Bool)

(declare-fun mapDefault!46307 () ValueCell!14117)

(assert (=> b!1177722 (= condMapEmpty!46307 (= (arr!36673 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14117)) mapDefault!46307)))))

(declare-fun b!1177723 () Bool)

(declare-fun res!782353 () Bool)

(assert (=> b!1177723 (=> (not res!782353) (not e!669499))))

(assert (=> b!1177723 (= res!782353 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37210 _keys!1208))))))

(declare-fun b!1177724 () Bool)

(declare-fun e!669496 () Bool)

(assert (=> b!1177724 (= e!669496 e!669507)))

(declare-fun res!782347 () Bool)

(assert (=> b!1177724 (=> res!782347 e!669507)))

(assert (=> b!1177724 (= res!782347 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!531755 () ListLongMap!17117)

(assert (=> b!1177724 (= lt!531755 (getCurrentListMapNoExtraKeys!5038 lt!531745 lt!531742 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!531756 () V!44665)

(assert (=> b!1177724 (= lt!531742 (array!76047 (store (arr!36673 _values!996) i!673 (ValueCellFull!14117 lt!531756)) (size!37211 _values!996)))))

(declare-fun dynLambda!2954 (Int (_ BitVec 64)) V!44665)

(assert (=> b!1177724 (= lt!531756 (dynLambda!2954 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!531743 () ListLongMap!17117)

(assert (=> b!1177724 (= lt!531743 (getCurrentListMapNoExtraKeys!5038 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1177725 () Bool)

(declare-fun res!782357 () Bool)

(assert (=> b!1177725 (=> (not res!782357) (not e!669499))))

(assert (=> b!1177725 (= res!782357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1177726 () Bool)

(declare-fun res!782349 () Bool)

(assert (=> b!1177726 (=> (not res!782349) (not e!669504))))

(assert (=> b!1177726 (= res!782349 (arrayNoDuplicates!0 lt!531745 #b00000000000000000000000000000000 Nil!25853))))

(declare-fun b!1177727 () Bool)

(assert (=> b!1177727 (= e!669504 (not e!669496))))

(declare-fun res!782351 () Bool)

(assert (=> b!1177727 (=> res!782351 e!669496)))

(assert (=> b!1177727 (= res!782351 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76044 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1177727 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!531744 () Unit!38741)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76044 (_ BitVec 64) (_ BitVec 32)) Unit!38741)

(assert (=> b!1177727 (= lt!531744 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!782348 () Bool)

(assert (=> start!99538 (=> (not res!782348) (not e!669499))))

(assert (=> start!99538 (= res!782348 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37210 _keys!1208))))))

(assert (=> start!99538 e!669499))

(declare-fun tp_is_empty!29653 () Bool)

(assert (=> start!99538 tp_is_empty!29653))

(declare-fun array_inv!28114 (array!76044) Bool)

(assert (=> start!99538 (array_inv!28114 _keys!1208)))

(assert (=> start!99538 true))

(assert (=> start!99538 tp!88083))

(declare-fun array_inv!28115 (array!76046) Bool)

(assert (=> start!99538 (and (array_inv!28115 _values!996) e!669502)))

(declare-fun b!1177717 () Bool)

(assert (=> b!1177717 (= e!669497 true)))

(declare-fun e!669500 () Bool)

(assert (=> b!1177717 e!669500))

(declare-fun res!782355 () Bool)

(assert (=> b!1177717 (=> (not res!782355) (not e!669500))))

(assert (=> b!1177717 (= res!782355 (not (= (select (arr!36672 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!531751 () Unit!38741)

(declare-fun e!669508 () Unit!38741)

(assert (=> b!1177717 (= lt!531751 e!669508)))

(declare-fun c!116782 () Bool)

(assert (=> b!1177717 (= c!116782 (= (select (arr!36672 _keys!1208) from!1455) k0!934))))

(declare-fun e!669506 () Bool)

(assert (=> b!1177717 e!669506))

(declare-fun res!782345 () Bool)

(assert (=> b!1177717 (=> (not res!782345) (not e!669506))))

(declare-fun lt!531750 () tuple2!19148)

(declare-fun +!3876 (ListLongMap!17117 tuple2!19148) ListLongMap!17117)

(assert (=> b!1177717 (= res!782345 (= lt!531755 (+!3876 lt!531754 lt!531750)))))

(declare-fun get!18745 (ValueCell!14117 V!44665) V!44665)

(assert (=> b!1177717 (= lt!531750 (tuple2!19149 (select (arr!36672 _keys!1208) from!1455) (get!18745 (select (arr!36673 _values!996) from!1455) lt!531756)))))

(declare-fun b!1177728 () Bool)

(assert (=> b!1177728 (= e!669505 tp_is_empty!29653)))

(declare-fun b!1177729 () Bool)

(declare-fun e!669498 () Bool)

(assert (=> b!1177729 (= e!669506 e!669498)))

(declare-fun res!782359 () Bool)

(assert (=> b!1177729 (=> res!782359 e!669498)))

(assert (=> b!1177729 (= res!782359 (not (= (select (arr!36672 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1177730 () Bool)

(declare-fun Unit!38743 () Unit!38741)

(assert (=> b!1177730 (= e!669508 Unit!38743)))

(declare-fun lt!531748 () Unit!38741)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76044 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38741)

(assert (=> b!1177730 (= lt!531748 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1177730 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!531746 () Unit!38741)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76044 (_ BitVec 32) (_ BitVec 32)) Unit!38741)

(assert (=> b!1177730 (= lt!531746 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1177730 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25853)))

(declare-fun lt!531752 () Unit!38741)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76044 (_ BitVec 64) (_ BitVec 32) List!25856) Unit!38741)

(assert (=> b!1177730 (= lt!531752 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25853))))

(assert (=> b!1177730 false))

(declare-fun b!1177731 () Bool)

(declare-fun Unit!38744 () Unit!38741)

(assert (=> b!1177731 (= e!669508 Unit!38744)))

(declare-fun b!1177732 () Bool)

(declare-fun res!782346 () Bool)

(assert (=> b!1177732 (=> (not res!782346) (not e!669499))))

(assert (=> b!1177732 (= res!782346 (and (= (size!37211 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37210 _keys!1208) (size!37211 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!46307 () Bool)

(assert (=> mapIsEmpty!46307 mapRes!46307))

(declare-fun b!1177733 () Bool)

(assert (=> b!1177733 (= e!669500 (= lt!531743 (+!3876 lt!531747 lt!531750)))))

(declare-fun b!1177734 () Bool)

(assert (=> b!1177734 (= e!669501 tp_is_empty!29653)))

(declare-fun b!1177735 () Bool)

(assert (=> b!1177735 (= e!669498 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1177736 () Bool)

(declare-fun res!782344 () Bool)

(assert (=> b!1177736 (=> (not res!782344) (not e!669499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1177736 (= res!782344 (validMask!0 mask!1564))))

(assert (= (and start!99538 res!782348) b!1177736))

(assert (= (and b!1177736 res!782344) b!1177732))

(assert (= (and b!1177732 res!782346) b!1177725))

(assert (= (and b!1177725 res!782357) b!1177718))

(assert (= (and b!1177718 res!782358) b!1177723))

(assert (= (and b!1177723 res!782353) b!1177716))

(assert (= (and b!1177716 res!782356) b!1177719))

(assert (= (and b!1177719 res!782352) b!1177720))

(assert (= (and b!1177720 res!782350) b!1177726))

(assert (= (and b!1177726 res!782349) b!1177727))

(assert (= (and b!1177727 (not res!782351)) b!1177724))

(assert (= (and b!1177724 (not res!782347)) b!1177721))

(assert (= (and b!1177721 (not res!782354)) b!1177717))

(assert (= (and b!1177717 res!782345) b!1177729))

(assert (= (and b!1177729 (not res!782359)) b!1177735))

(assert (= (and b!1177717 c!116782) b!1177730))

(assert (= (and b!1177717 (not c!116782)) b!1177731))

(assert (= (and b!1177717 res!782355) b!1177733))

(assert (= (and b!1177722 condMapEmpty!46307) mapIsEmpty!46307))

(assert (= (and b!1177722 (not condMapEmpty!46307)) mapNonEmpty!46307))

(get-info :version)

(assert (= (and mapNonEmpty!46307 ((_ is ValueCellFull!14117) mapValue!46307)) b!1177728))

(assert (= (and b!1177722 ((_ is ValueCellFull!14117) mapDefault!46307)) b!1177734))

(assert (= start!99538 b!1177722))

(declare-fun b_lambda!20249 () Bool)

(assert (=> (not b_lambda!20249) (not b!1177724)))

(declare-fun t!37961 () Bool)

(declare-fun tb!9927 () Bool)

(assert (=> (and start!99538 (= defaultEntry!1004 defaultEntry!1004) t!37961) tb!9927))

(declare-fun result!20429 () Bool)

(assert (=> tb!9927 (= result!20429 tp_is_empty!29653)))

(assert (=> b!1177724 t!37961))

(declare-fun b_and!41093 () Bool)

(assert (= b_and!41091 (and (=> t!37961 result!20429) b_and!41093)))

(declare-fun m!1085183 () Bool)

(assert (=> b!1177733 m!1085183))

(declare-fun m!1085185 () Bool)

(assert (=> start!99538 m!1085185))

(declare-fun m!1085187 () Bool)

(assert (=> start!99538 m!1085187))

(declare-fun m!1085189 () Bool)

(assert (=> b!1177729 m!1085189))

(declare-fun m!1085191 () Bool)

(assert (=> b!1177736 m!1085191))

(declare-fun m!1085193 () Bool)

(assert (=> b!1177721 m!1085193))

(declare-fun m!1085195 () Bool)

(assert (=> b!1177721 m!1085195))

(assert (=> b!1177721 m!1085189))

(declare-fun m!1085197 () Bool)

(assert (=> b!1177721 m!1085197))

(declare-fun m!1085199 () Bool)

(assert (=> b!1177721 m!1085199))

(declare-fun m!1085201 () Bool)

(assert (=> b!1177721 m!1085201))

(assert (=> b!1177721 m!1085189))

(declare-fun m!1085203 () Bool)

(assert (=> b!1177720 m!1085203))

(declare-fun m!1085205 () Bool)

(assert (=> b!1177720 m!1085205))

(declare-fun m!1085207 () Bool)

(assert (=> b!1177719 m!1085207))

(declare-fun m!1085209 () Bool)

(assert (=> b!1177724 m!1085209))

(declare-fun m!1085211 () Bool)

(assert (=> b!1177724 m!1085211))

(declare-fun m!1085213 () Bool)

(assert (=> b!1177724 m!1085213))

(declare-fun m!1085215 () Bool)

(assert (=> b!1177724 m!1085215))

(assert (=> b!1177717 m!1085189))

(declare-fun m!1085217 () Bool)

(assert (=> b!1177717 m!1085217))

(declare-fun m!1085219 () Bool)

(assert (=> b!1177717 m!1085219))

(assert (=> b!1177717 m!1085219))

(declare-fun m!1085221 () Bool)

(assert (=> b!1177717 m!1085221))

(declare-fun m!1085223 () Bool)

(assert (=> b!1177718 m!1085223))

(declare-fun m!1085225 () Bool)

(assert (=> b!1177727 m!1085225))

(declare-fun m!1085227 () Bool)

(assert (=> b!1177727 m!1085227))

(declare-fun m!1085229 () Bool)

(assert (=> b!1177716 m!1085229))

(declare-fun m!1085231 () Bool)

(assert (=> mapNonEmpty!46307 m!1085231))

(declare-fun m!1085233 () Bool)

(assert (=> b!1177725 m!1085233))

(declare-fun m!1085235 () Bool)

(assert (=> b!1177726 m!1085235))

(declare-fun m!1085237 () Bool)

(assert (=> b!1177735 m!1085237))

(declare-fun m!1085239 () Bool)

(assert (=> b!1177730 m!1085239))

(declare-fun m!1085241 () Bool)

(assert (=> b!1177730 m!1085241))

(declare-fun m!1085243 () Bool)

(assert (=> b!1177730 m!1085243))

(declare-fun m!1085245 () Bool)

(assert (=> b!1177730 m!1085245))

(declare-fun m!1085247 () Bool)

(assert (=> b!1177730 m!1085247))

(check-sat (not b!1177721) (not b!1177736) (not b!1177716) (not b!1177717) (not b!1177735) (not b!1177718) b_and!41093 (not start!99538) (not mapNonEmpty!46307) (not b!1177730) (not b!1177733) (not b_lambda!20249) (not b!1177727) (not b!1177724) (not b!1177726) (not b!1177720) tp_is_empty!29653 (not b_next!25123) (not b!1177725))
(check-sat b_and!41093 (not b_next!25123))
