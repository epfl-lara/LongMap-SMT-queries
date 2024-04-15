; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99598 () Bool)

(assert start!99598)

(declare-fun b_free!25183 () Bool)

(declare-fun b_next!25183 () Bool)

(assert (=> start!99598 (= b_free!25183 (not b_next!25183))))

(declare-fun tp!88262 () Bool)

(declare-fun b_and!41211 () Bool)

(assert (=> start!99598 (= tp!88262 b_and!41211)))

(declare-fun b!1179677 () Bool)

(declare-fun res!783805 () Bool)

(declare-fun e!670678 () Bool)

(assert (=> b!1179677 (=> (not res!783805) (not e!670678))))

(declare-datatypes ((array!76164 0))(
  ( (array!76165 (arr!36732 (Array (_ BitVec 32) (_ BitVec 64))) (size!37270 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76164)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44745 0))(
  ( (V!44746 (val!14913 Int)) )
))
(declare-datatypes ((ValueCell!14147 0))(
  ( (ValueCellFull!14147 (v!17550 V!44745)) (EmptyCell!14147) )
))
(declare-datatypes ((array!76166 0))(
  ( (array!76167 (arr!36733 (Array (_ BitVec 32) ValueCell!14147)) (size!37271 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76166)

(assert (=> b!1179677 (= res!783805 (and (= (size!37271 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37270 _keys!1208) (size!37271 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1179678 () Bool)

(declare-fun res!783807 () Bool)

(assert (=> b!1179678 (=> (not res!783807) (not e!670678))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1179678 (= res!783807 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37270 _keys!1208))))))

(declare-fun b!1179679 () Bool)

(declare-fun res!783801 () Bool)

(assert (=> b!1179679 (=> (not res!783801) (not e!670678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1179679 (= res!783801 (validMask!0 mask!1564))))

(declare-fun b!1179680 () Bool)

(declare-fun e!670676 () Bool)

(assert (=> b!1179680 (= e!670676 true)))

(declare-fun e!670672 () Bool)

(assert (=> b!1179680 e!670672))

(declare-fun res!783799 () Bool)

(assert (=> b!1179680 (=> (not res!783799) (not e!670672))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1179680 (= res!783799 (not (= (select (arr!36732 _keys!1208) from!1455) k0!934)))))

(declare-datatypes ((Unit!38839 0))(
  ( (Unit!38840) )
))
(declare-fun lt!533102 () Unit!38839)

(declare-fun e!670673 () Unit!38839)

(assert (=> b!1179680 (= lt!533102 e!670673)))

(declare-fun c!116872 () Bool)

(assert (=> b!1179680 (= c!116872 (= (select (arr!36732 _keys!1208) from!1455) k0!934))))

(declare-fun e!670666 () Bool)

(assert (=> b!1179680 e!670666))

(declare-fun res!783809 () Bool)

(assert (=> b!1179680 (=> (not res!783809) (not e!670666))))

(declare-datatypes ((tuple2!19204 0))(
  ( (tuple2!19205 (_1!9613 (_ BitVec 64)) (_2!9613 V!44745)) )
))
(declare-datatypes ((List!25912 0))(
  ( (Nil!25909) (Cons!25908 (h!27117 tuple2!19204) (t!38078 List!25912)) )
))
(declare-datatypes ((ListLongMap!17173 0))(
  ( (ListLongMap!17174 (toList!8602 List!25912)) )
))
(declare-fun lt!533098 () ListLongMap!17173)

(declare-fun lt!533104 () tuple2!19204)

(declare-fun lt!533093 () ListLongMap!17173)

(declare-fun +!3902 (ListLongMap!17173 tuple2!19204) ListLongMap!17173)

(assert (=> b!1179680 (= res!783809 (= lt!533093 (+!3902 lt!533098 lt!533104)))))

(declare-fun lt!533100 () V!44745)

(declare-fun get!18787 (ValueCell!14147 V!44745) V!44745)

(assert (=> b!1179680 (= lt!533104 (tuple2!19205 (select (arr!36732 _keys!1208) from!1455) (get!18787 (select (arr!36733 _values!996) from!1455) lt!533100)))))

(declare-fun b!1179681 () Bool)

(declare-fun e!670675 () Bool)

(declare-fun arrayContainsKey!0 (array!76164 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1179681 (= e!670675 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!46397 () Bool)

(declare-fun mapRes!46397 () Bool)

(declare-fun tp!88263 () Bool)

(declare-fun e!670667 () Bool)

(assert (=> mapNonEmpty!46397 (= mapRes!46397 (and tp!88263 e!670667))))

(declare-fun mapRest!46397 () (Array (_ BitVec 32) ValueCell!14147))

(declare-fun mapValue!46397 () ValueCell!14147)

(declare-fun mapKey!46397 () (_ BitVec 32))

(assert (=> mapNonEmpty!46397 (= (arr!36733 _values!996) (store mapRest!46397 mapKey!46397 mapValue!46397))))

(declare-fun b!1179682 () Bool)

(declare-fun Unit!38841 () Unit!38839)

(assert (=> b!1179682 (= e!670673 Unit!38841)))

(declare-fun b!1179683 () Bool)

(declare-fun e!670669 () Bool)

(declare-fun e!670668 () Bool)

(assert (=> b!1179683 (= e!670669 e!670668)))

(declare-fun res!783810 () Bool)

(assert (=> b!1179683 (=> res!783810 e!670668)))

(assert (=> b!1179683 (= res!783810 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44745)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!533092 () array!76164)

(declare-fun lt!533101 () array!76166)

(declare-fun minValue!944 () V!44745)

(declare-fun getCurrentListMapNoExtraKeys!5060 (array!76164 array!76166 (_ BitVec 32) (_ BitVec 32) V!44745 V!44745 (_ BitVec 32) Int) ListLongMap!17173)

(assert (=> b!1179683 (= lt!533093 (getCurrentListMapNoExtraKeys!5060 lt!533092 lt!533101 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1179683 (= lt!533101 (array!76167 (store (arr!36733 _values!996) i!673 (ValueCellFull!14147 lt!533100)) (size!37271 _values!996)))))

(declare-fun dynLambda!2972 (Int (_ BitVec 64)) V!44745)

(assert (=> b!1179683 (= lt!533100 (dynLambda!2972 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!533097 () ListLongMap!17173)

(assert (=> b!1179683 (= lt!533097 (getCurrentListMapNoExtraKeys!5060 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1179684 () Bool)

(declare-fun tp_is_empty!29713 () Bool)

(assert (=> b!1179684 (= e!670667 tp_is_empty!29713)))

(declare-fun b!1179685 () Bool)

(declare-fun res!783800 () Bool)

(assert (=> b!1179685 (=> (not res!783800) (not e!670672))))

(declare-fun lt!533096 () ListLongMap!17173)

(assert (=> b!1179685 (= res!783800 (= lt!533097 (+!3902 lt!533096 lt!533104)))))

(declare-fun b!1179686 () Bool)

(declare-fun e!670674 () Bool)

(assert (=> b!1179686 (= e!670674 tp_is_empty!29713)))

(declare-fun b!1179687 () Bool)

(declare-fun e!670671 () Bool)

(assert (=> b!1179687 (= e!670671 (not e!670669))))

(declare-fun res!783802 () Bool)

(assert (=> b!1179687 (=> res!783802 e!670669)))

(assert (=> b!1179687 (= res!783802 (bvsgt from!1455 i!673))))

(assert (=> b!1179687 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!533099 () Unit!38839)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76164 (_ BitVec 64) (_ BitVec 32)) Unit!38839)

(assert (=> b!1179687 (= lt!533099 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1179688 () Bool)

(declare-fun res!783804 () Bool)

(assert (=> b!1179688 (=> (not res!783804) (not e!670678))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1179688 (= res!783804 (validKeyInArray!0 k0!934))))

(declare-fun b!1179689 () Bool)

(declare-fun Unit!38842 () Unit!38839)

(assert (=> b!1179689 (= e!670673 Unit!38842)))

(declare-fun lt!533103 () Unit!38839)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76164 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38839)

(assert (=> b!1179689 (= lt!533103 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1179689 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!533094 () Unit!38839)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76164 (_ BitVec 32) (_ BitVec 32)) Unit!38839)

(assert (=> b!1179689 (= lt!533094 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25913 0))(
  ( (Nil!25910) (Cons!25909 (h!27118 (_ BitVec 64)) (t!38079 List!25913)) )
))
(declare-fun arrayNoDuplicates!0 (array!76164 (_ BitVec 32) List!25913) Bool)

(assert (=> b!1179689 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25910)))

(declare-fun lt!533105 () Unit!38839)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76164 (_ BitVec 64) (_ BitVec 32) List!25913) Unit!38839)

(assert (=> b!1179689 (= lt!533105 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25910))))

(assert (=> b!1179689 false))

(declare-fun res!783796 () Bool)

(assert (=> start!99598 (=> (not res!783796) (not e!670678))))

(assert (=> start!99598 (= res!783796 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37270 _keys!1208))))))

(assert (=> start!99598 e!670678))

(assert (=> start!99598 tp_is_empty!29713))

(declare-fun array_inv!28158 (array!76164) Bool)

(assert (=> start!99598 (array_inv!28158 _keys!1208)))

(assert (=> start!99598 true))

(assert (=> start!99598 tp!88262))

(declare-fun e!670670 () Bool)

(declare-fun array_inv!28159 (array!76166) Bool)

(assert (=> start!99598 (and (array_inv!28159 _values!996) e!670670)))

(declare-fun b!1179690 () Bool)

(declare-fun res!783806 () Bool)

(assert (=> b!1179690 (=> (not res!783806) (not e!670678))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76164 (_ BitVec 32)) Bool)

(assert (=> b!1179690 (= res!783806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1179691 () Bool)

(assert (=> b!1179691 (= e!670678 e!670671)))

(declare-fun res!783803 () Bool)

(assert (=> b!1179691 (=> (not res!783803) (not e!670671))))

(assert (=> b!1179691 (= res!783803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!533092 mask!1564))))

(assert (=> b!1179691 (= lt!533092 (array!76165 (store (arr!36732 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37270 _keys!1208)))))

(declare-fun b!1179692 () Bool)

(declare-fun res!783811 () Bool)

(assert (=> b!1179692 (=> (not res!783811) (not e!670678))))

(assert (=> b!1179692 (= res!783811 (= (select (arr!36732 _keys!1208) i!673) k0!934))))

(declare-fun b!1179693 () Bool)

(declare-fun lt!533106 () ListLongMap!17173)

(assert (=> b!1179693 (= e!670672 (= lt!533098 lt!533106))))

(declare-fun b!1179694 () Bool)

(assert (=> b!1179694 (= e!670666 e!670675)))

(declare-fun res!783795 () Bool)

(assert (=> b!1179694 (=> res!783795 e!670675)))

(assert (=> b!1179694 (= res!783795 (not (= (select (arr!36732 _keys!1208) from!1455) k0!934)))))

(declare-fun mapIsEmpty!46397 () Bool)

(assert (=> mapIsEmpty!46397 mapRes!46397))

(declare-fun b!1179695 () Bool)

(assert (=> b!1179695 (= e!670668 e!670676)))

(declare-fun res!783797 () Bool)

(assert (=> b!1179695 (=> res!783797 e!670676)))

(assert (=> b!1179695 (= res!783797 (not (validKeyInArray!0 (select (arr!36732 _keys!1208) from!1455))))))

(assert (=> b!1179695 (= lt!533106 lt!533098)))

(declare-fun -!1566 (ListLongMap!17173 (_ BitVec 64)) ListLongMap!17173)

(assert (=> b!1179695 (= lt!533098 (-!1566 lt!533096 k0!934))))

(assert (=> b!1179695 (= lt!533106 (getCurrentListMapNoExtraKeys!5060 lt!533092 lt!533101 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1179695 (= lt!533096 (getCurrentListMapNoExtraKeys!5060 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!533095 () Unit!38839)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!830 (array!76164 array!76166 (_ BitVec 32) (_ BitVec 32) V!44745 V!44745 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38839)

(assert (=> b!1179695 (= lt!533095 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!830 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1179696 () Bool)

(declare-fun res!783798 () Bool)

(assert (=> b!1179696 (=> (not res!783798) (not e!670671))))

(assert (=> b!1179696 (= res!783798 (arrayNoDuplicates!0 lt!533092 #b00000000000000000000000000000000 Nil!25910))))

(declare-fun b!1179697 () Bool)

(assert (=> b!1179697 (= e!670670 (and e!670674 mapRes!46397))))

(declare-fun condMapEmpty!46397 () Bool)

(declare-fun mapDefault!46397 () ValueCell!14147)

(assert (=> b!1179697 (= condMapEmpty!46397 (= (arr!36733 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14147)) mapDefault!46397)))))

(declare-fun b!1179698 () Bool)

(declare-fun res!783808 () Bool)

(assert (=> b!1179698 (=> (not res!783808) (not e!670678))))

(assert (=> b!1179698 (= res!783808 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25910))))

(assert (= (and start!99598 res!783796) b!1179679))

(assert (= (and b!1179679 res!783801) b!1179677))

(assert (= (and b!1179677 res!783805) b!1179690))

(assert (= (and b!1179690 res!783806) b!1179698))

(assert (= (and b!1179698 res!783808) b!1179678))

(assert (= (and b!1179678 res!783807) b!1179688))

(assert (= (and b!1179688 res!783804) b!1179692))

(assert (= (and b!1179692 res!783811) b!1179691))

(assert (= (and b!1179691 res!783803) b!1179696))

(assert (= (and b!1179696 res!783798) b!1179687))

(assert (= (and b!1179687 (not res!783802)) b!1179683))

(assert (= (and b!1179683 (not res!783810)) b!1179695))

(assert (= (and b!1179695 (not res!783797)) b!1179680))

(assert (= (and b!1179680 res!783809) b!1179694))

(assert (= (and b!1179694 (not res!783795)) b!1179681))

(assert (= (and b!1179680 c!116872) b!1179689))

(assert (= (and b!1179680 (not c!116872)) b!1179682))

(assert (= (and b!1179680 res!783799) b!1179685))

(assert (= (and b!1179685 res!783800) b!1179693))

(assert (= (and b!1179697 condMapEmpty!46397) mapIsEmpty!46397))

(assert (= (and b!1179697 (not condMapEmpty!46397)) mapNonEmpty!46397))

(get-info :version)

(assert (= (and mapNonEmpty!46397 ((_ is ValueCellFull!14147) mapValue!46397)) b!1179684))

(assert (= (and b!1179697 ((_ is ValueCellFull!14147) mapDefault!46397)) b!1179686))

(assert (= start!99598 b!1179697))

(declare-fun b_lambda!20309 () Bool)

(assert (=> (not b_lambda!20309) (not b!1179683)))

(declare-fun t!38077 () Bool)

(declare-fun tb!9987 () Bool)

(assert (=> (and start!99598 (= defaultEntry!1004 defaultEntry!1004) t!38077) tb!9987))

(declare-fun result!20549 () Bool)

(assert (=> tb!9987 (= result!20549 tp_is_empty!29713)))

(assert (=> b!1179683 t!38077))

(declare-fun b_and!41213 () Bool)

(assert (= b_and!41211 (and (=> t!38077 result!20549) b_and!41213)))

(declare-fun m!1087163 () Bool)

(assert (=> b!1179687 m!1087163))

(declare-fun m!1087165 () Bool)

(assert (=> b!1179687 m!1087165))

(declare-fun m!1087167 () Bool)

(assert (=> b!1179681 m!1087167))

(declare-fun m!1087169 () Bool)

(assert (=> start!99598 m!1087169))

(declare-fun m!1087171 () Bool)

(assert (=> start!99598 m!1087171))

(declare-fun m!1087173 () Bool)

(assert (=> b!1179691 m!1087173))

(declare-fun m!1087175 () Bool)

(assert (=> b!1179691 m!1087175))

(declare-fun m!1087177 () Bool)

(assert (=> b!1179698 m!1087177))

(declare-fun m!1087179 () Bool)

(assert (=> b!1179696 m!1087179))

(declare-fun m!1087181 () Bool)

(assert (=> b!1179685 m!1087181))

(declare-fun m!1087183 () Bool)

(assert (=> b!1179689 m!1087183))

(declare-fun m!1087185 () Bool)

(assert (=> b!1179689 m!1087185))

(declare-fun m!1087187 () Bool)

(assert (=> b!1179689 m!1087187))

(declare-fun m!1087189 () Bool)

(assert (=> b!1179689 m!1087189))

(declare-fun m!1087191 () Bool)

(assert (=> b!1179689 m!1087191))

(declare-fun m!1087193 () Bool)

(assert (=> b!1179679 m!1087193))

(declare-fun m!1087195 () Bool)

(assert (=> b!1179695 m!1087195))

(declare-fun m!1087197 () Bool)

(assert (=> b!1179695 m!1087197))

(declare-fun m!1087199 () Bool)

(assert (=> b!1179695 m!1087199))

(declare-fun m!1087201 () Bool)

(assert (=> b!1179695 m!1087201))

(declare-fun m!1087203 () Bool)

(assert (=> b!1179695 m!1087203))

(declare-fun m!1087205 () Bool)

(assert (=> b!1179695 m!1087205))

(assert (=> b!1179695 m!1087201))

(declare-fun m!1087207 () Bool)

(assert (=> b!1179688 m!1087207))

(declare-fun m!1087209 () Bool)

(assert (=> b!1179690 m!1087209))

(assert (=> b!1179680 m!1087201))

(declare-fun m!1087211 () Bool)

(assert (=> b!1179680 m!1087211))

(declare-fun m!1087213 () Bool)

(assert (=> b!1179680 m!1087213))

(assert (=> b!1179680 m!1087213))

(declare-fun m!1087215 () Bool)

(assert (=> b!1179680 m!1087215))

(declare-fun m!1087217 () Bool)

(assert (=> b!1179683 m!1087217))

(declare-fun m!1087219 () Bool)

(assert (=> b!1179683 m!1087219))

(declare-fun m!1087221 () Bool)

(assert (=> b!1179683 m!1087221))

(declare-fun m!1087223 () Bool)

(assert (=> b!1179683 m!1087223))

(declare-fun m!1087225 () Bool)

(assert (=> b!1179692 m!1087225))

(declare-fun m!1087227 () Bool)

(assert (=> mapNonEmpty!46397 m!1087227))

(assert (=> b!1179694 m!1087201))

(check-sat b_and!41213 (not b!1179696) tp_is_empty!29713 (not b!1179690) (not b!1179688) (not b!1179691) (not b!1179695) (not b!1179683) (not b_lambda!20309) (not b!1179680) (not b!1179681) (not b!1179687) (not b!1179698) (not start!99598) (not b_next!25183) (not b!1179689) (not b!1179685) (not b!1179679) (not mapNonEmpty!46397))
(check-sat b_and!41213 (not b_next!25183))
