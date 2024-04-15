; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101530 () Bool)

(assert start!101530)

(declare-fun b_free!26323 () Bool)

(declare-fun b_next!26323 () Bool)

(assert (=> start!101530 (= b_free!26323 (not b_next!26323))))

(declare-fun tp!92006 () Bool)

(declare-fun b_and!43835 () Bool)

(assert (=> start!101530 (= tp!92006 b_and!43835)))

(declare-fun b!1220769 () Bool)

(declare-fun e!693208 () Bool)

(declare-fun tp_is_empty!31027 () Bool)

(assert (=> b!1220769 (= e!693208 tp_is_empty!31027)))

(declare-datatypes ((array!78754 0))(
  ( (array!78755 (arr!38007 (Array (_ BitVec 32) (_ BitVec 64))) (size!38545 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78754)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun e!693214 () Bool)

(declare-fun b!1220770 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78754 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1220770 (= e!693214 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1220771 () Bool)

(declare-fun res!810984 () Bool)

(declare-fun e!693216 () Bool)

(assert (=> b!1220771 (=> (not res!810984) (not e!693216))))

(assert (=> b!1220771 (= res!810984 (= (select (arr!38007 _keys!1208) i!673) k0!934))))

(declare-fun b!1220772 () Bool)

(declare-fun res!810981 () Bool)

(assert (=> b!1220772 (=> (not res!810981) (not e!693216))))

(assert (=> b!1220772 (= res!810981 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38545 _keys!1208))))))

(declare-fun b!1220774 () Bool)

(declare-fun e!693209 () Bool)

(declare-fun e!693206 () Bool)

(assert (=> b!1220774 (= e!693209 (not e!693206))))

(declare-fun res!810987 () Bool)

(assert (=> b!1220774 (=> res!810987 e!693206)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1220774 (= res!810987 (bvsgt from!1455 i!673))))

(assert (=> b!1220774 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40299 0))(
  ( (Unit!40300) )
))
(declare-fun lt!555098 () Unit!40299)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78754 (_ BitVec 64) (_ BitVec 32)) Unit!40299)

(assert (=> b!1220774 (= lt!555098 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!48430 () Bool)

(declare-fun mapRes!48430 () Bool)

(assert (=> mapIsEmpty!48430 mapRes!48430))

(declare-fun b!1220775 () Bool)

(declare-fun res!810983 () Bool)

(assert (=> b!1220775 (=> (not res!810983) (not e!693216))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46497 0))(
  ( (V!46498 (val!15570 Int)) )
))
(declare-datatypes ((ValueCell!14804 0))(
  ( (ValueCellFull!14804 (v!18227 V!46497)) (EmptyCell!14804) )
))
(declare-datatypes ((array!78756 0))(
  ( (array!78757 (arr!38008 (Array (_ BitVec 32) ValueCell!14804)) (size!38546 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78756)

(assert (=> b!1220775 (= res!810983 (and (= (size!38546 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38545 _keys!1208) (size!38546 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1220776 () Bool)

(declare-fun e!693211 () Bool)

(assert (=> b!1220776 (= e!693211 e!693214)))

(declare-fun res!810985 () Bool)

(assert (=> b!1220776 (=> res!810985 e!693214)))

(assert (=> b!1220776 (= res!810985 (not (= (select (arr!38007 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1220777 () Bool)

(declare-fun e!693207 () Bool)

(assert (=> b!1220777 (= e!693207 tp_is_empty!31027)))

(declare-fun b!1220778 () Bool)

(declare-fun res!810975 () Bool)

(assert (=> b!1220778 (=> (not res!810975) (not e!693216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1220778 (= res!810975 (validMask!0 mask!1564))))

(declare-fun b!1220779 () Bool)

(assert (=> b!1220779 (= e!693216 e!693209)))

(declare-fun res!810978 () Bool)

(assert (=> b!1220779 (=> (not res!810978) (not e!693209))))

(declare-fun lt!555091 () array!78754)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78754 (_ BitVec 32)) Bool)

(assert (=> b!1220779 (= res!810978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!555091 mask!1564))))

(assert (=> b!1220779 (= lt!555091 (array!78755 (store (arr!38007 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38545 _keys!1208)))))

(declare-fun b!1220780 () Bool)

(declare-fun e!693212 () Bool)

(assert (=> b!1220780 (= e!693212 (and e!693207 mapRes!48430))))

(declare-fun condMapEmpty!48430 () Bool)

(declare-fun mapDefault!48430 () ValueCell!14804)

(assert (=> b!1220780 (= condMapEmpty!48430 (= (arr!38008 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14804)) mapDefault!48430)))))

(declare-fun b!1220781 () Bool)

(declare-fun res!810982 () Bool)

(assert (=> b!1220781 (=> (not res!810982) (not e!693216))))

(assert (=> b!1220781 (= res!810982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!48430 () Bool)

(declare-fun tp!92005 () Bool)

(assert (=> mapNonEmpty!48430 (= mapRes!48430 (and tp!92005 e!693208))))

(declare-fun mapValue!48430 () ValueCell!14804)

(declare-fun mapKey!48430 () (_ BitVec 32))

(declare-fun mapRest!48430 () (Array (_ BitVec 32) ValueCell!14804))

(assert (=> mapNonEmpty!48430 (= (arr!38008 _values!996) (store mapRest!48430 mapKey!48430 mapValue!48430))))

(declare-fun b!1220782 () Bool)

(declare-fun e!693215 () Bool)

(assert (=> b!1220782 (= e!693215 (or (bvsge (size!38545 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38545 _keys!1208)) (bvslt from!1455 (size!38545 _keys!1208))))))

(declare-datatypes ((List!26907 0))(
  ( (Nil!26904) (Cons!26903 (h!28112 (_ BitVec 64)) (t!40201 List!26907)) )
))
(declare-fun arrayNoDuplicates!0 (array!78754 (_ BitVec 32) List!26907) Bool)

(assert (=> b!1220782 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26904)))

(declare-fun lt!555092 () Unit!40299)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78754 (_ BitVec 32) (_ BitVec 32)) Unit!40299)

(assert (=> b!1220782 (= lt!555092 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1220782 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!555093 () Unit!40299)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78754 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40299)

(assert (=> b!1220782 (= lt!555093 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1220783 () Bool)

(declare-fun e!693210 () Bool)

(assert (=> b!1220783 (= e!693206 e!693210)))

(declare-fun res!810980 () Bool)

(assert (=> b!1220783 (=> res!810980 e!693210)))

(assert (=> b!1220783 (= res!810980 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46497)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46497)

(declare-datatypes ((tuple2!20128 0))(
  ( (tuple2!20129 (_1!10075 (_ BitVec 64)) (_2!10075 V!46497)) )
))
(declare-datatypes ((List!26908 0))(
  ( (Nil!26905) (Cons!26904 (h!28113 tuple2!20128) (t!40202 List!26908)) )
))
(declare-datatypes ((ListLongMap!18097 0))(
  ( (ListLongMap!18098 (toList!9064 List!26908)) )
))
(declare-fun lt!555087 () ListLongMap!18097)

(declare-fun lt!555097 () array!78756)

(declare-fun getCurrentListMapNoExtraKeys!5500 (array!78754 array!78756 (_ BitVec 32) (_ BitVec 32) V!46497 V!46497 (_ BitVec 32) Int) ListLongMap!18097)

(assert (=> b!1220783 (= lt!555087 (getCurrentListMapNoExtraKeys!5500 lt!555091 lt!555097 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!555094 () V!46497)

(assert (=> b!1220783 (= lt!555097 (array!78757 (store (arr!38008 _values!996) i!673 (ValueCellFull!14804 lt!555094)) (size!38546 _values!996)))))

(declare-fun dynLambda!3348 (Int (_ BitVec 64)) V!46497)

(assert (=> b!1220783 (= lt!555094 (dynLambda!3348 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!555089 () ListLongMap!18097)

(assert (=> b!1220783 (= lt!555089 (getCurrentListMapNoExtraKeys!5500 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!810989 () Bool)

(assert (=> start!101530 (=> (not res!810989) (not e!693216))))

(assert (=> start!101530 (= res!810989 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38545 _keys!1208))))))

(assert (=> start!101530 e!693216))

(assert (=> start!101530 tp_is_empty!31027))

(declare-fun array_inv!29044 (array!78754) Bool)

(assert (=> start!101530 (array_inv!29044 _keys!1208)))

(assert (=> start!101530 true))

(assert (=> start!101530 tp!92006))

(declare-fun array_inv!29045 (array!78756) Bool)

(assert (=> start!101530 (and (array_inv!29045 _values!996) e!693212)))

(declare-fun b!1220773 () Bool)

(declare-fun res!810976 () Bool)

(assert (=> b!1220773 (=> (not res!810976) (not e!693216))))

(assert (=> b!1220773 (= res!810976 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26904))))

(declare-fun b!1220784 () Bool)

(declare-fun res!810974 () Bool)

(assert (=> b!1220784 (=> (not res!810974) (not e!693209))))

(assert (=> b!1220784 (= res!810974 (arrayNoDuplicates!0 lt!555091 #b00000000000000000000000000000000 Nil!26904))))

(declare-fun b!1220785 () Bool)

(declare-fun e!693217 () Bool)

(assert (=> b!1220785 (= e!693210 e!693217)))

(declare-fun res!810977 () Bool)

(assert (=> b!1220785 (=> res!810977 e!693217)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1220785 (= res!810977 (not (validKeyInArray!0 (select (arr!38007 _keys!1208) from!1455))))))

(declare-fun lt!555096 () ListLongMap!18097)

(declare-fun lt!555095 () ListLongMap!18097)

(assert (=> b!1220785 (= lt!555096 lt!555095)))

(declare-fun lt!555088 () ListLongMap!18097)

(declare-fun -!1892 (ListLongMap!18097 (_ BitVec 64)) ListLongMap!18097)

(assert (=> b!1220785 (= lt!555095 (-!1892 lt!555088 k0!934))))

(assert (=> b!1220785 (= lt!555096 (getCurrentListMapNoExtraKeys!5500 lt!555091 lt!555097 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1220785 (= lt!555088 (getCurrentListMapNoExtraKeys!5500 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!555090 () Unit!40299)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1127 (array!78754 array!78756 (_ BitVec 32) (_ BitVec 32) V!46497 V!46497 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40299)

(assert (=> b!1220785 (= lt!555090 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1127 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1220786 () Bool)

(declare-fun res!810988 () Bool)

(assert (=> b!1220786 (=> (not res!810988) (not e!693216))))

(assert (=> b!1220786 (= res!810988 (validKeyInArray!0 k0!934))))

(declare-fun b!1220787 () Bool)

(assert (=> b!1220787 (= e!693217 e!693215)))

(declare-fun res!810986 () Bool)

(assert (=> b!1220787 (=> res!810986 e!693215)))

(assert (=> b!1220787 (= res!810986 (not (= (select (arr!38007 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1220787 e!693211))

(declare-fun res!810979 () Bool)

(assert (=> b!1220787 (=> (not res!810979) (not e!693211))))

(declare-fun +!4127 (ListLongMap!18097 tuple2!20128) ListLongMap!18097)

(declare-fun get!19404 (ValueCell!14804 V!46497) V!46497)

(assert (=> b!1220787 (= res!810979 (= lt!555087 (+!4127 lt!555095 (tuple2!20129 (select (arr!38007 _keys!1208) from!1455) (get!19404 (select (arr!38008 _values!996) from!1455) lt!555094)))))))

(assert (= (and start!101530 res!810989) b!1220778))

(assert (= (and b!1220778 res!810975) b!1220775))

(assert (= (and b!1220775 res!810983) b!1220781))

(assert (= (and b!1220781 res!810982) b!1220773))

(assert (= (and b!1220773 res!810976) b!1220772))

(assert (= (and b!1220772 res!810981) b!1220786))

(assert (= (and b!1220786 res!810988) b!1220771))

(assert (= (and b!1220771 res!810984) b!1220779))

(assert (= (and b!1220779 res!810978) b!1220784))

(assert (= (and b!1220784 res!810974) b!1220774))

(assert (= (and b!1220774 (not res!810987)) b!1220783))

(assert (= (and b!1220783 (not res!810980)) b!1220785))

(assert (= (and b!1220785 (not res!810977)) b!1220787))

(assert (= (and b!1220787 res!810979) b!1220776))

(assert (= (and b!1220776 (not res!810985)) b!1220770))

(assert (= (and b!1220787 (not res!810986)) b!1220782))

(assert (= (and b!1220780 condMapEmpty!48430) mapIsEmpty!48430))

(assert (= (and b!1220780 (not condMapEmpty!48430)) mapNonEmpty!48430))

(get-info :version)

(assert (= (and mapNonEmpty!48430 ((_ is ValueCellFull!14804) mapValue!48430)) b!1220769))

(assert (= (and b!1220780 ((_ is ValueCellFull!14804) mapDefault!48430)) b!1220777))

(assert (= start!101530 b!1220780))

(declare-fun b_lambda!22179 () Bool)

(assert (=> (not b_lambda!22179) (not b!1220783)))

(declare-fun t!40200 () Bool)

(declare-fun tb!11115 () Bool)

(assert (=> (and start!101530 (= defaultEntry!1004 defaultEntry!1004) t!40200) tb!11115))

(declare-fun result!22845 () Bool)

(assert (=> tb!11115 (= result!22845 tp_is_empty!31027)))

(assert (=> b!1220783 t!40200))

(declare-fun b_and!43837 () Bool)

(assert (= b_and!43835 (and (=> t!40200 result!22845) b_and!43837)))

(declare-fun m!1125153 () Bool)

(assert (=> b!1220787 m!1125153))

(declare-fun m!1125155 () Bool)

(assert (=> b!1220787 m!1125155))

(assert (=> b!1220787 m!1125155))

(declare-fun m!1125157 () Bool)

(assert (=> b!1220787 m!1125157))

(declare-fun m!1125159 () Bool)

(assert (=> b!1220787 m!1125159))

(declare-fun m!1125161 () Bool)

(assert (=> start!101530 m!1125161))

(declare-fun m!1125163 () Bool)

(assert (=> start!101530 m!1125163))

(declare-fun m!1125165 () Bool)

(assert (=> b!1220783 m!1125165))

(declare-fun m!1125167 () Bool)

(assert (=> b!1220783 m!1125167))

(declare-fun m!1125169 () Bool)

(assert (=> b!1220783 m!1125169))

(declare-fun m!1125171 () Bool)

(assert (=> b!1220783 m!1125171))

(assert (=> b!1220776 m!1125153))

(declare-fun m!1125173 () Bool)

(assert (=> mapNonEmpty!48430 m!1125173))

(declare-fun m!1125175 () Bool)

(assert (=> b!1220784 m!1125175))

(declare-fun m!1125177 () Bool)

(assert (=> b!1220773 m!1125177))

(declare-fun m!1125179 () Bool)

(assert (=> b!1220779 m!1125179))

(declare-fun m!1125181 () Bool)

(assert (=> b!1220779 m!1125181))

(declare-fun m!1125183 () Bool)

(assert (=> b!1220786 m!1125183))

(declare-fun m!1125185 () Bool)

(assert (=> b!1220782 m!1125185))

(declare-fun m!1125187 () Bool)

(assert (=> b!1220782 m!1125187))

(declare-fun m!1125189 () Bool)

(assert (=> b!1220782 m!1125189))

(declare-fun m!1125191 () Bool)

(assert (=> b!1220782 m!1125191))

(declare-fun m!1125193 () Bool)

(assert (=> b!1220774 m!1125193))

(declare-fun m!1125195 () Bool)

(assert (=> b!1220774 m!1125195))

(declare-fun m!1125197 () Bool)

(assert (=> b!1220778 m!1125197))

(declare-fun m!1125199 () Bool)

(assert (=> b!1220785 m!1125199))

(declare-fun m!1125201 () Bool)

(assert (=> b!1220785 m!1125201))

(declare-fun m!1125203 () Bool)

(assert (=> b!1220785 m!1125203))

(declare-fun m!1125205 () Bool)

(assert (=> b!1220785 m!1125205))

(assert (=> b!1220785 m!1125153))

(declare-fun m!1125207 () Bool)

(assert (=> b!1220785 m!1125207))

(assert (=> b!1220785 m!1125153))

(declare-fun m!1125209 () Bool)

(assert (=> b!1220771 m!1125209))

(declare-fun m!1125211 () Bool)

(assert (=> b!1220781 m!1125211))

(declare-fun m!1125213 () Bool)

(assert (=> b!1220770 m!1125213))

(check-sat (not b!1220783) tp_is_empty!31027 (not b!1220785) (not b!1220779) (not b!1220786) (not b_next!26323) (not b!1220778) (not b!1220770) (not b!1220782) (not b!1220781) (not b!1220784) (not b!1220773) (not start!101530) (not b_lambda!22179) (not b!1220774) (not b!1220787) b_and!43837 (not mapNonEmpty!48430))
(check-sat b_and!43837 (not b_next!26323))
