; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101452 () Bool)

(assert start!101452)

(declare-fun b_free!26275 () Bool)

(declare-fun b_next!26275 () Bool)

(assert (=> start!101452 (= b_free!26275 (not b_next!26275))))

(declare-fun tp!91858 () Bool)

(declare-fun b_and!43721 () Bool)

(assert (=> start!101452 (= tp!91858 b_and!43721)))

(declare-fun b!1219202 () Bool)

(declare-fun res!809770 () Bool)

(declare-fun e!692245 () Bool)

(assert (=> b!1219202 (=> (not res!809770) (not e!692245))))

(declare-datatypes ((array!78656 0))(
  ( (array!78657 (arr!37959 (Array (_ BitVec 32) (_ BitVec 64))) (size!38497 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78656)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1219202 (= res!809770 (= (select (arr!37959 _keys!1208) i!673) k0!934))))

(declare-fun b!1219203 () Bool)

(declare-fun res!809765 () Bool)

(assert (=> b!1219203 (=> (not res!809765) (not e!692245))))

(declare-datatypes ((List!26866 0))(
  ( (Nil!26863) (Cons!26862 (h!28071 (_ BitVec 64)) (t!40112 List!26866)) )
))
(declare-fun arrayNoDuplicates!0 (array!78656 (_ BitVec 32) List!26866) Bool)

(assert (=> b!1219203 (= res!809765 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26863))))

(declare-fun b!1219204 () Bool)

(declare-fun res!809756 () Bool)

(assert (=> b!1219204 (=> (not res!809756) (not e!692245))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1219204 (= res!809756 (validMask!0 mask!1564))))

(declare-fun b!1219205 () Bool)

(declare-fun e!692248 () Bool)

(assert (=> b!1219205 (= e!692245 e!692248)))

(declare-fun res!809766 () Bool)

(assert (=> b!1219205 (=> (not res!809766) (not e!692248))))

(declare-fun lt!554177 () array!78656)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78656 (_ BitVec 32)) Bool)

(assert (=> b!1219205 (= res!809766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554177 mask!1564))))

(assert (=> b!1219205 (= lt!554177 (array!78657 (store (arr!37959 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38497 _keys!1208)))))

(declare-fun b!1219206 () Bool)

(declare-fun res!809763 () Bool)

(assert (=> b!1219206 (=> (not res!809763) (not e!692245))))

(assert (=> b!1219206 (= res!809763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1219207 () Bool)

(declare-fun e!692243 () Bool)

(declare-fun tp_is_empty!30979 () Bool)

(assert (=> b!1219207 (= e!692243 tp_is_empty!30979)))

(declare-fun b!1219208 () Bool)

(declare-fun e!692250 () Bool)

(declare-fun e!692244 () Bool)

(assert (=> b!1219208 (= e!692250 e!692244)))

(declare-fun res!809758 () Bool)

(assert (=> b!1219208 (=> res!809758 e!692244)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1219208 (= res!809758 (not (validKeyInArray!0 (select (arr!37959 _keys!1208) from!1455))))))

(declare-datatypes ((V!46433 0))(
  ( (V!46434 (val!15546 Int)) )
))
(declare-datatypes ((tuple2!20086 0))(
  ( (tuple2!20087 (_1!10054 (_ BitVec 64)) (_2!10054 V!46433)) )
))
(declare-datatypes ((List!26867 0))(
  ( (Nil!26864) (Cons!26863 (h!28072 tuple2!20086) (t!40113 List!26867)) )
))
(declare-datatypes ((ListLongMap!18055 0))(
  ( (ListLongMap!18056 (toList!9043 List!26867)) )
))
(declare-fun lt!554181 () ListLongMap!18055)

(declare-fun lt!554180 () ListLongMap!18055)

(assert (=> b!1219208 (= lt!554181 lt!554180)))

(declare-fun lt!554176 () ListLongMap!18055)

(declare-fun -!1875 (ListLongMap!18055 (_ BitVec 64)) ListLongMap!18055)

(assert (=> b!1219208 (= lt!554180 (-!1875 lt!554176 k0!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14780 0))(
  ( (ValueCellFull!14780 (v!18202 V!46433)) (EmptyCell!14780) )
))
(declare-datatypes ((array!78658 0))(
  ( (array!78659 (arr!37960 (Array (_ BitVec 32) ValueCell!14780)) (size!38498 (_ BitVec 32))) )
))
(declare-fun lt!554186 () array!78658)

(declare-fun minValue!944 () V!46433)

(declare-fun zeroValue!944 () V!46433)

(declare-fun getCurrentListMapNoExtraKeys!5481 (array!78656 array!78658 (_ BitVec 32) (_ BitVec 32) V!46433 V!46433 (_ BitVec 32) Int) ListLongMap!18055)

(assert (=> b!1219208 (= lt!554181 (getCurrentListMapNoExtraKeys!5481 lt!554177 lt!554186 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!78658)

(assert (=> b!1219208 (= lt!554176 (getCurrentListMapNoExtraKeys!5481 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40259 0))(
  ( (Unit!40260) )
))
(declare-fun lt!554183 () Unit!40259)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1110 (array!78656 array!78658 (_ BitVec 32) (_ BitVec 32) V!46433 V!46433 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40259)

(assert (=> b!1219208 (= lt!554183 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1110 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1219209 () Bool)

(declare-fun e!692246 () Bool)

(assert (=> b!1219209 (= e!692248 (not e!692246))))

(declare-fun res!809771 () Bool)

(assert (=> b!1219209 (=> res!809771 e!692246)))

(assert (=> b!1219209 (= res!809771 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!78656 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1219209 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!554178 () Unit!40259)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78656 (_ BitVec 64) (_ BitVec 32)) Unit!40259)

(assert (=> b!1219209 (= lt!554178 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1219210 () Bool)

(declare-fun e!692247 () Bool)

(assert (=> b!1219210 (= e!692247 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1219211 () Bool)

(declare-fun e!692241 () Bool)

(assert (=> b!1219211 (= e!692244 e!692241)))

(declare-fun res!809769 () Bool)

(assert (=> b!1219211 (=> res!809769 e!692241)))

(assert (=> b!1219211 (= res!809769 (not (= (select (arr!37959 _keys!1208) from!1455) k0!934)))))

(declare-fun e!692240 () Bool)

(assert (=> b!1219211 e!692240))

(declare-fun res!809762 () Bool)

(assert (=> b!1219211 (=> (not res!809762) (not e!692240))))

(declare-fun lt!554185 () ListLongMap!18055)

(declare-fun lt!554184 () V!46433)

(declare-fun +!4110 (ListLongMap!18055 tuple2!20086) ListLongMap!18055)

(declare-fun get!19369 (ValueCell!14780 V!46433) V!46433)

(assert (=> b!1219211 (= res!809762 (= lt!554185 (+!4110 lt!554180 (tuple2!20087 (select (arr!37959 _keys!1208) from!1455) (get!19369 (select (arr!37960 _values!996) from!1455) lt!554184)))))))

(declare-fun b!1219212 () Bool)

(assert (=> b!1219212 (= e!692241 true)))

(assert (=> b!1219212 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!554179 () Unit!40259)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78656 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40259)

(assert (=> b!1219212 (= lt!554179 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1219213 () Bool)

(declare-fun res!809760 () Bool)

(assert (=> b!1219213 (=> (not res!809760) (not e!692245))))

(assert (=> b!1219213 (= res!809760 (and (= (size!38498 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38497 _keys!1208) (size!38498 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!809764 () Bool)

(assert (=> start!101452 (=> (not res!809764) (not e!692245))))

(assert (=> start!101452 (= res!809764 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38497 _keys!1208))))))

(assert (=> start!101452 e!692245))

(assert (=> start!101452 tp_is_empty!30979))

(declare-fun array_inv!29012 (array!78656) Bool)

(assert (=> start!101452 (array_inv!29012 _keys!1208)))

(assert (=> start!101452 true))

(assert (=> start!101452 tp!91858))

(declare-fun e!692251 () Bool)

(declare-fun array_inv!29013 (array!78658) Bool)

(assert (=> start!101452 (and (array_inv!29013 _values!996) e!692251)))

(declare-fun b!1219201 () Bool)

(assert (=> b!1219201 (= e!692246 e!692250)))

(declare-fun res!809761 () Bool)

(assert (=> b!1219201 (=> res!809761 e!692250)))

(assert (=> b!1219201 (= res!809761 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1219201 (= lt!554185 (getCurrentListMapNoExtraKeys!5481 lt!554177 lt!554186 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1219201 (= lt!554186 (array!78659 (store (arr!37960 _values!996) i!673 (ValueCellFull!14780 lt!554184)) (size!38498 _values!996)))))

(declare-fun dynLambda!3332 (Int (_ BitVec 64)) V!46433)

(assert (=> b!1219201 (= lt!554184 (dynLambda!3332 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!554182 () ListLongMap!18055)

(assert (=> b!1219201 (= lt!554182 (getCurrentListMapNoExtraKeys!5481 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1219214 () Bool)

(declare-fun res!809759 () Bool)

(assert (=> b!1219214 (=> (not res!809759) (not e!692245))))

(assert (=> b!1219214 (= res!809759 (validKeyInArray!0 k0!934))))

(declare-fun b!1219215 () Bool)

(declare-fun e!692242 () Bool)

(assert (=> b!1219215 (= e!692242 tp_is_empty!30979)))

(declare-fun b!1219216 () Bool)

(declare-fun res!809767 () Bool)

(assert (=> b!1219216 (=> (not res!809767) (not e!692245))))

(assert (=> b!1219216 (= res!809767 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38497 _keys!1208))))))

(declare-fun b!1219217 () Bool)

(declare-fun mapRes!48355 () Bool)

(assert (=> b!1219217 (= e!692251 (and e!692243 mapRes!48355))))

(declare-fun condMapEmpty!48355 () Bool)

(declare-fun mapDefault!48355 () ValueCell!14780)

(assert (=> b!1219217 (= condMapEmpty!48355 (= (arr!37960 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14780)) mapDefault!48355)))))

(declare-fun b!1219218 () Bool)

(assert (=> b!1219218 (= e!692240 e!692247)))

(declare-fun res!809768 () Bool)

(assert (=> b!1219218 (=> res!809768 e!692247)))

(assert (=> b!1219218 (= res!809768 (not (= (select (arr!37959 _keys!1208) from!1455) k0!934)))))

(declare-fun mapIsEmpty!48355 () Bool)

(assert (=> mapIsEmpty!48355 mapRes!48355))

(declare-fun mapNonEmpty!48355 () Bool)

(declare-fun tp!91859 () Bool)

(assert (=> mapNonEmpty!48355 (= mapRes!48355 (and tp!91859 e!692242))))

(declare-fun mapRest!48355 () (Array (_ BitVec 32) ValueCell!14780))

(declare-fun mapKey!48355 () (_ BitVec 32))

(declare-fun mapValue!48355 () ValueCell!14780)

(assert (=> mapNonEmpty!48355 (= (arr!37960 _values!996) (store mapRest!48355 mapKey!48355 mapValue!48355))))

(declare-fun b!1219219 () Bool)

(declare-fun res!809757 () Bool)

(assert (=> b!1219219 (=> (not res!809757) (not e!692248))))

(assert (=> b!1219219 (= res!809757 (arrayNoDuplicates!0 lt!554177 #b00000000000000000000000000000000 Nil!26863))))

(assert (= (and start!101452 res!809764) b!1219204))

(assert (= (and b!1219204 res!809756) b!1219213))

(assert (= (and b!1219213 res!809760) b!1219206))

(assert (= (and b!1219206 res!809763) b!1219203))

(assert (= (and b!1219203 res!809765) b!1219216))

(assert (= (and b!1219216 res!809767) b!1219214))

(assert (= (and b!1219214 res!809759) b!1219202))

(assert (= (and b!1219202 res!809770) b!1219205))

(assert (= (and b!1219205 res!809766) b!1219219))

(assert (= (and b!1219219 res!809757) b!1219209))

(assert (= (and b!1219209 (not res!809771)) b!1219201))

(assert (= (and b!1219201 (not res!809761)) b!1219208))

(assert (= (and b!1219208 (not res!809758)) b!1219211))

(assert (= (and b!1219211 res!809762) b!1219218))

(assert (= (and b!1219218 (not res!809768)) b!1219210))

(assert (= (and b!1219211 (not res!809769)) b!1219212))

(assert (= (and b!1219217 condMapEmpty!48355) mapIsEmpty!48355))

(assert (= (and b!1219217 (not condMapEmpty!48355)) mapNonEmpty!48355))

(get-info :version)

(assert (= (and mapNonEmpty!48355 ((_ is ValueCellFull!14780) mapValue!48355)) b!1219215))

(assert (= (and b!1219217 ((_ is ValueCellFull!14780) mapDefault!48355)) b!1219207))

(assert (= start!101452 b!1219217))

(declare-fun b_lambda!22093 () Bool)

(assert (=> (not b_lambda!22093) (not b!1219201)))

(declare-fun t!40111 () Bool)

(declare-fun tb!11067 () Bool)

(assert (=> (and start!101452 (= defaultEntry!1004 defaultEntry!1004) t!40111) tb!11067))

(declare-fun result!22747 () Bool)

(assert (=> tb!11067 (= result!22747 tp_is_empty!30979)))

(assert (=> b!1219201 t!40111))

(declare-fun b_and!43723 () Bool)

(assert (= b_and!43721 (and (=> t!40111 result!22747) b_and!43723)))

(declare-fun m!1123529 () Bool)

(assert (=> b!1219211 m!1123529))

(declare-fun m!1123531 () Bool)

(assert (=> b!1219211 m!1123531))

(assert (=> b!1219211 m!1123531))

(declare-fun m!1123533 () Bool)

(assert (=> b!1219211 m!1123533))

(declare-fun m!1123535 () Bool)

(assert (=> b!1219211 m!1123535))

(declare-fun m!1123537 () Bool)

(assert (=> b!1219210 m!1123537))

(declare-fun m!1123539 () Bool)

(assert (=> b!1219202 m!1123539))

(declare-fun m!1123541 () Bool)

(assert (=> b!1219205 m!1123541))

(declare-fun m!1123543 () Bool)

(assert (=> b!1219205 m!1123543))

(declare-fun m!1123545 () Bool)

(assert (=> b!1219201 m!1123545))

(declare-fun m!1123547 () Bool)

(assert (=> b!1219201 m!1123547))

(declare-fun m!1123549 () Bool)

(assert (=> b!1219201 m!1123549))

(declare-fun m!1123551 () Bool)

(assert (=> b!1219201 m!1123551))

(declare-fun m!1123553 () Bool)

(assert (=> b!1219204 m!1123553))

(declare-fun m!1123555 () Bool)

(assert (=> b!1219212 m!1123555))

(declare-fun m!1123557 () Bool)

(assert (=> b!1219212 m!1123557))

(declare-fun m!1123559 () Bool)

(assert (=> b!1219208 m!1123559))

(declare-fun m!1123561 () Bool)

(assert (=> b!1219208 m!1123561))

(declare-fun m!1123563 () Bool)

(assert (=> b!1219208 m!1123563))

(declare-fun m!1123565 () Bool)

(assert (=> b!1219208 m!1123565))

(assert (=> b!1219208 m!1123529))

(declare-fun m!1123567 () Bool)

(assert (=> b!1219208 m!1123567))

(assert (=> b!1219208 m!1123529))

(declare-fun m!1123569 () Bool)

(assert (=> mapNonEmpty!48355 m!1123569))

(assert (=> b!1219218 m!1123529))

(declare-fun m!1123571 () Bool)

(assert (=> b!1219214 m!1123571))

(declare-fun m!1123573 () Bool)

(assert (=> b!1219219 m!1123573))

(declare-fun m!1123575 () Bool)

(assert (=> b!1219203 m!1123575))

(declare-fun m!1123577 () Bool)

(assert (=> b!1219209 m!1123577))

(declare-fun m!1123579 () Bool)

(assert (=> b!1219209 m!1123579))

(declare-fun m!1123581 () Bool)

(assert (=> b!1219206 m!1123581))

(declare-fun m!1123583 () Bool)

(assert (=> start!101452 m!1123583))

(declare-fun m!1123585 () Bool)

(assert (=> start!101452 m!1123585))

(check-sat (not b!1219210) (not mapNonEmpty!48355) (not b!1219209) (not b_next!26275) (not b!1219203) (not b!1219212) (not b!1219214) b_and!43723 (not b_lambda!22093) (not b!1219206) tp_is_empty!30979 (not b!1219205) (not b!1219204) (not start!101452) (not b!1219211) (not b!1219201) (not b!1219208) (not b!1219219))
(check-sat b_and!43723 (not b_next!26275))
