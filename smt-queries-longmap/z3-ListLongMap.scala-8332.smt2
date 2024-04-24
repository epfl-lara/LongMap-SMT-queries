; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101654 () Bool)

(assert start!101654)

(declare-fun b_free!26263 () Bool)

(declare-fun b_next!26263 () Bool)

(assert (=> start!101654 (= b_free!26263 (not b_next!26263))))

(declare-fun tp!91820 () Bool)

(declare-fun b_and!43699 () Bool)

(assert (=> start!101654 (= tp!91820 b_and!43699)))

(declare-datatypes ((array!78751 0))(
  ( (array!78752 (arr!38001 (Array (_ BitVec 32) (_ BitVec 64))) (size!38538 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78751)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun e!692838 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1220103 () Bool)

(declare-fun arrayContainsKey!0 (array!78751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1220103 (= e!692838 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1220104 () Bool)

(declare-fun res!809992 () Bool)

(declare-fun e!692833 () Bool)

(assert (=> b!1220104 (=> (not res!809992) (not e!692833))))

(assert (=> b!1220104 (= res!809992 (= (select (arr!38001 _keys!1208) i!673) k0!934))))

(declare-fun b!1220105 () Bool)

(declare-fun e!692836 () Bool)

(declare-fun e!692839 () Bool)

(assert (=> b!1220105 (= e!692836 e!692839)))

(declare-fun res!809986 () Bool)

(assert (=> b!1220105 (=> res!809986 e!692839)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1220105 (= res!809986 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46417 0))(
  ( (V!46418 (val!15540 Int)) )
))
(declare-fun zeroValue!944 () V!46417)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!554571 () array!78751)

(declare-fun minValue!944 () V!46417)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!20006 0))(
  ( (tuple2!20007 (_1!10014 (_ BitVec 64)) (_2!10014 V!46417)) )
))
(declare-datatypes ((List!26816 0))(
  ( (Nil!26813) (Cons!26812 (h!28030 tuple2!20006) (t!40051 List!26816)) )
))
(declare-datatypes ((ListLongMap!17983 0))(
  ( (ListLongMap!17984 (toList!9007 List!26816)) )
))
(declare-fun lt!554572 () ListLongMap!17983)

(declare-datatypes ((ValueCell!14774 0))(
  ( (ValueCellFull!14774 (v!18192 V!46417)) (EmptyCell!14774) )
))
(declare-datatypes ((array!78753 0))(
  ( (array!78754 (arr!38002 (Array (_ BitVec 32) ValueCell!14774)) (size!38539 (_ BitVec 32))) )
))
(declare-fun lt!554573 () array!78753)

(declare-fun getCurrentListMapNoExtraKeys!5464 (array!78751 array!78753 (_ BitVec 32) (_ BitVec 32) V!46417 V!46417 (_ BitVec 32) Int) ListLongMap!17983)

(assert (=> b!1220105 (= lt!554572 (getCurrentListMapNoExtraKeys!5464 lt!554571 lt!554573 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!78753)

(declare-fun lt!554568 () V!46417)

(assert (=> b!1220105 (= lt!554573 (array!78754 (store (arr!38002 _values!996) i!673 (ValueCellFull!14774 lt!554568)) (size!38539 _values!996)))))

(declare-fun dynLambda!3366 (Int (_ BitVec 64)) V!46417)

(assert (=> b!1220105 (= lt!554568 (dynLambda!3366 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!554577 () ListLongMap!17983)

(assert (=> b!1220105 (= lt!554577 (getCurrentListMapNoExtraKeys!5464 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1220106 () Bool)

(declare-fun e!692840 () Bool)

(assert (=> b!1220106 (= e!692840 true)))

(declare-fun e!692835 () Bool)

(assert (=> b!1220106 e!692835))

(declare-fun res!809993 () Bool)

(assert (=> b!1220106 (=> (not res!809993) (not e!692835))))

(declare-fun lt!554570 () ListLongMap!17983)

(declare-fun +!4118 (ListLongMap!17983 tuple2!20006) ListLongMap!17983)

(declare-fun get!19416 (ValueCell!14774 V!46417) V!46417)

(assert (=> b!1220106 (= res!809993 (= lt!554572 (+!4118 lt!554570 (tuple2!20007 (select (arr!38001 _keys!1208) from!1455) (get!19416 (select (arr!38002 _values!996) from!1455) lt!554568)))))))

(declare-fun b!1220107 () Bool)

(declare-fun e!692842 () Bool)

(assert (=> b!1220107 (= e!692842 (not e!692836))))

(declare-fun res!809984 () Bool)

(assert (=> b!1220107 (=> res!809984 e!692836)))

(assert (=> b!1220107 (= res!809984 (bvsgt from!1455 i!673))))

(assert (=> b!1220107 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40370 0))(
  ( (Unit!40371) )
))
(declare-fun lt!554569 () Unit!40370)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78751 (_ BitVec 64) (_ BitVec 32)) Unit!40370)

(assert (=> b!1220107 (= lt!554569 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1220108 () Bool)

(assert (=> b!1220108 (= e!692833 e!692842)))

(declare-fun res!809985 () Bool)

(assert (=> b!1220108 (=> (not res!809985) (not e!692842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78751 (_ BitVec 32)) Bool)

(assert (=> b!1220108 (= res!809985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554571 mask!1564))))

(assert (=> b!1220108 (= lt!554571 (array!78752 (store (arr!38001 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38538 _keys!1208)))))

(declare-fun b!1220109 () Bool)

(declare-fun res!809987 () Bool)

(assert (=> b!1220109 (=> (not res!809987) (not e!692833))))

(assert (=> b!1220109 (= res!809987 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38538 _keys!1208))))))

(declare-fun b!1220110 () Bool)

(assert (=> b!1220110 (= e!692839 e!692840)))

(declare-fun res!809979 () Bool)

(assert (=> b!1220110 (=> res!809979 e!692840)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1220110 (= res!809979 (not (validKeyInArray!0 (select (arr!38001 _keys!1208) from!1455))))))

(declare-fun lt!554575 () ListLongMap!17983)

(assert (=> b!1220110 (= lt!554575 lt!554570)))

(declare-fun lt!554574 () ListLongMap!17983)

(declare-fun -!1896 (ListLongMap!17983 (_ BitVec 64)) ListLongMap!17983)

(assert (=> b!1220110 (= lt!554570 (-!1896 lt!554574 k0!934))))

(assert (=> b!1220110 (= lt!554575 (getCurrentListMapNoExtraKeys!5464 lt!554571 lt!554573 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1220110 (= lt!554574 (getCurrentListMapNoExtraKeys!5464 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!554576 () Unit!40370)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1111 (array!78751 array!78753 (_ BitVec 32) (_ BitVec 32) V!46417 V!46417 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40370)

(assert (=> b!1220110 (= lt!554576 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1111 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1220111 () Bool)

(declare-fun res!809991 () Bool)

(assert (=> b!1220111 (=> (not res!809991) (not e!692833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1220111 (= res!809991 (validMask!0 mask!1564))))

(declare-fun b!1220112 () Bool)

(declare-fun res!809982 () Bool)

(assert (=> b!1220112 (=> (not res!809982) (not e!692833))))

(assert (=> b!1220112 (= res!809982 (and (= (size!38539 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38538 _keys!1208) (size!38539 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1220113 () Bool)

(declare-fun res!809983 () Bool)

(assert (=> b!1220113 (=> (not res!809983) (not e!692833))))

(assert (=> b!1220113 (= res!809983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1220114 () Bool)

(declare-fun res!809980 () Bool)

(assert (=> b!1220114 (=> (not res!809980) (not e!692833))))

(assert (=> b!1220114 (= res!809980 (validKeyInArray!0 k0!934))))

(declare-fun res!809990 () Bool)

(assert (=> start!101654 (=> (not res!809990) (not e!692833))))

(assert (=> start!101654 (= res!809990 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38538 _keys!1208))))))

(assert (=> start!101654 e!692833))

(declare-fun tp_is_empty!30967 () Bool)

(assert (=> start!101654 tp_is_empty!30967))

(declare-fun array_inv!28992 (array!78751) Bool)

(assert (=> start!101654 (array_inv!28992 _keys!1208)))

(assert (=> start!101654 true))

(assert (=> start!101654 tp!91820))

(declare-fun e!692837 () Bool)

(declare-fun array_inv!28993 (array!78753) Bool)

(assert (=> start!101654 (and (array_inv!28993 _values!996) e!692837)))

(declare-fun b!1220115 () Bool)

(assert (=> b!1220115 (= e!692835 e!692838)))

(declare-fun res!809989 () Bool)

(assert (=> b!1220115 (=> res!809989 e!692838)))

(assert (=> b!1220115 (= res!809989 (not (= (select (arr!38001 _keys!1208) from!1455) k0!934)))))

(declare-fun mapIsEmpty!48334 () Bool)

(declare-fun mapRes!48334 () Bool)

(assert (=> mapIsEmpty!48334 mapRes!48334))

(declare-fun b!1220116 () Bool)

(declare-fun e!692841 () Bool)

(assert (=> b!1220116 (= e!692841 tp_is_empty!30967)))

(declare-fun mapNonEmpty!48334 () Bool)

(declare-fun tp!91819 () Bool)

(declare-fun e!692843 () Bool)

(assert (=> mapNonEmpty!48334 (= mapRes!48334 (and tp!91819 e!692843))))

(declare-fun mapValue!48334 () ValueCell!14774)

(declare-fun mapRest!48334 () (Array (_ BitVec 32) ValueCell!14774))

(declare-fun mapKey!48334 () (_ BitVec 32))

(assert (=> mapNonEmpty!48334 (= (arr!38002 _values!996) (store mapRest!48334 mapKey!48334 mapValue!48334))))

(declare-fun b!1220117 () Bool)

(declare-fun res!809981 () Bool)

(assert (=> b!1220117 (=> (not res!809981) (not e!692842))))

(declare-datatypes ((List!26817 0))(
  ( (Nil!26814) (Cons!26813 (h!28031 (_ BitVec 64)) (t!40052 List!26817)) )
))
(declare-fun arrayNoDuplicates!0 (array!78751 (_ BitVec 32) List!26817) Bool)

(assert (=> b!1220117 (= res!809981 (arrayNoDuplicates!0 lt!554571 #b00000000000000000000000000000000 Nil!26814))))

(declare-fun b!1220118 () Bool)

(assert (=> b!1220118 (= e!692837 (and e!692841 mapRes!48334))))

(declare-fun condMapEmpty!48334 () Bool)

(declare-fun mapDefault!48334 () ValueCell!14774)

(assert (=> b!1220118 (= condMapEmpty!48334 (= (arr!38002 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14774)) mapDefault!48334)))))

(declare-fun b!1220119 () Bool)

(declare-fun res!809988 () Bool)

(assert (=> b!1220119 (=> (not res!809988) (not e!692833))))

(assert (=> b!1220119 (= res!809988 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26814))))

(declare-fun b!1220120 () Bool)

(assert (=> b!1220120 (= e!692843 tp_is_empty!30967)))

(assert (= (and start!101654 res!809990) b!1220111))

(assert (= (and b!1220111 res!809991) b!1220112))

(assert (= (and b!1220112 res!809982) b!1220113))

(assert (= (and b!1220113 res!809983) b!1220119))

(assert (= (and b!1220119 res!809988) b!1220109))

(assert (= (and b!1220109 res!809987) b!1220114))

(assert (= (and b!1220114 res!809980) b!1220104))

(assert (= (and b!1220104 res!809992) b!1220108))

(assert (= (and b!1220108 res!809985) b!1220117))

(assert (= (and b!1220117 res!809981) b!1220107))

(assert (= (and b!1220107 (not res!809984)) b!1220105))

(assert (= (and b!1220105 (not res!809986)) b!1220110))

(assert (= (and b!1220110 (not res!809979)) b!1220106))

(assert (= (and b!1220106 res!809993) b!1220115))

(assert (= (and b!1220115 (not res!809989)) b!1220103))

(assert (= (and b!1220118 condMapEmpty!48334) mapIsEmpty!48334))

(assert (= (and b!1220118 (not condMapEmpty!48334)) mapNonEmpty!48334))

(get-info :version)

(assert (= (and mapNonEmpty!48334 ((_ is ValueCellFull!14774) mapValue!48334)) b!1220120))

(assert (= (and b!1220118 ((_ is ValueCellFull!14774) mapDefault!48334)) b!1220116))

(assert (= start!101654 b!1220118))

(declare-fun b_lambda!22047 () Bool)

(assert (=> (not b_lambda!22047) (not b!1220105)))

(declare-fun t!40050 () Bool)

(declare-fun tb!11055 () Bool)

(assert (=> (and start!101654 (= defaultEntry!1004 defaultEntry!1004) t!40050) tb!11055))

(declare-fun result!22721 () Bool)

(assert (=> tb!11055 (= result!22721 tp_is_empty!30967)))

(assert (=> b!1220105 t!40050))

(declare-fun b_and!43701 () Bool)

(assert (= b_and!43699 (and (=> t!40050 result!22721) b_and!43701)))

(declare-fun m!1125169 () Bool)

(assert (=> b!1220106 m!1125169))

(declare-fun m!1125171 () Bool)

(assert (=> b!1220106 m!1125171))

(assert (=> b!1220106 m!1125171))

(declare-fun m!1125173 () Bool)

(assert (=> b!1220106 m!1125173))

(declare-fun m!1125175 () Bool)

(assert (=> b!1220106 m!1125175))

(declare-fun m!1125177 () Bool)

(assert (=> b!1220104 m!1125177))

(declare-fun m!1125179 () Bool)

(assert (=> b!1220103 m!1125179))

(declare-fun m!1125181 () Bool)

(assert (=> b!1220105 m!1125181))

(declare-fun m!1125183 () Bool)

(assert (=> b!1220105 m!1125183))

(declare-fun m!1125185 () Bool)

(assert (=> b!1220105 m!1125185))

(declare-fun m!1125187 () Bool)

(assert (=> b!1220105 m!1125187))

(declare-fun m!1125189 () Bool)

(assert (=> b!1220113 m!1125189))

(declare-fun m!1125191 () Bool)

(assert (=> mapNonEmpty!48334 m!1125191))

(assert (=> b!1220115 m!1125169))

(declare-fun m!1125193 () Bool)

(assert (=> b!1220108 m!1125193))

(declare-fun m!1125195 () Bool)

(assert (=> b!1220108 m!1125195))

(declare-fun m!1125197 () Bool)

(assert (=> start!101654 m!1125197))

(declare-fun m!1125199 () Bool)

(assert (=> start!101654 m!1125199))

(declare-fun m!1125201 () Bool)

(assert (=> b!1220114 m!1125201))

(declare-fun m!1125203 () Bool)

(assert (=> b!1220119 m!1125203))

(declare-fun m!1125205 () Bool)

(assert (=> b!1220107 m!1125205))

(declare-fun m!1125207 () Bool)

(assert (=> b!1220107 m!1125207))

(declare-fun m!1125209 () Bool)

(assert (=> b!1220117 m!1125209))

(declare-fun m!1125211 () Bool)

(assert (=> b!1220111 m!1125211))

(declare-fun m!1125213 () Bool)

(assert (=> b!1220110 m!1125213))

(declare-fun m!1125215 () Bool)

(assert (=> b!1220110 m!1125215))

(assert (=> b!1220110 m!1125169))

(declare-fun m!1125217 () Bool)

(assert (=> b!1220110 m!1125217))

(assert (=> b!1220110 m!1125169))

(declare-fun m!1125219 () Bool)

(assert (=> b!1220110 m!1125219))

(declare-fun m!1125221 () Bool)

(assert (=> b!1220110 m!1125221))

(check-sat (not b!1220114) b_and!43701 (not b!1220117) tp_is_empty!30967 (not b!1220111) (not b!1220113) (not b!1220107) (not start!101654) (not b!1220106) (not b!1220108) (not b!1220110) (not b!1220103) (not mapNonEmpty!48334) (not b!1220105) (not b_lambda!22047) (not b!1220119) (not b_next!26263))
(check-sat b_and!43701 (not b_next!26263))
