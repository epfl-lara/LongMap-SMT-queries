; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99522 () Bool)

(assert start!99522)

(declare-fun b_free!25101 () Bool)

(declare-fun b_next!25101 () Bool)

(assert (=> start!99522 (= b_free!25101 (not b_next!25101))))

(declare-fun tp!88016 () Bool)

(declare-fun b_and!41069 () Bool)

(assert (=> start!99522 (= tp!88016 b_and!41069)))

(declare-fun b!1177125 () Bool)

(declare-fun e!669156 () Bool)

(declare-fun e!669149 () Bool)

(assert (=> b!1177125 (= e!669156 e!669149)))

(declare-fun res!781891 () Bool)

(assert (=> b!1177125 (=> (not res!781891) (not e!669149))))

(declare-datatypes ((array!76069 0))(
  ( (array!76070 (arr!36684 (Array (_ BitVec 32) (_ BitVec 64))) (size!37220 (_ BitVec 32))) )
))
(declare-fun lt!531452 () array!76069)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76069 (_ BitVec 32)) Bool)

(assert (=> b!1177125 (= res!781891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!531452 mask!1564))))

(declare-fun _keys!1208 () array!76069)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1177125 (= lt!531452 (array!76070 (store (arr!36684 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37220 _keys!1208)))))

(declare-fun b!1177126 () Bool)

(declare-fun res!781882 () Bool)

(assert (=> b!1177126 (=> (not res!781882) (not e!669156))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1177126 (= res!781882 (validKeyInArray!0 k0!934))))

(declare-fun res!781893 () Bool)

(assert (=> start!99522 (=> (not res!781893) (not e!669156))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99522 (= res!781893 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37220 _keys!1208))))))

(assert (=> start!99522 e!669156))

(declare-fun tp_is_empty!29631 () Bool)

(assert (=> start!99522 tp_is_empty!29631))

(declare-fun array_inv!28016 (array!76069) Bool)

(assert (=> start!99522 (array_inv!28016 _keys!1208)))

(assert (=> start!99522 true))

(assert (=> start!99522 tp!88016))

(declare-datatypes ((V!44635 0))(
  ( (V!44636 (val!14872 Int)) )
))
(declare-datatypes ((ValueCell!14106 0))(
  ( (ValueCellFull!14106 (v!17510 V!44635)) (EmptyCell!14106) )
))
(declare-datatypes ((array!76071 0))(
  ( (array!76072 (arr!36685 (Array (_ BitVec 32) ValueCell!14106)) (size!37221 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76071)

(declare-fun e!669147 () Bool)

(declare-fun array_inv!28017 (array!76071) Bool)

(assert (=> start!99522 (and (array_inv!28017 _values!996) e!669147)))

(declare-fun b!1177127 () Bool)

(declare-datatypes ((tuple2!19024 0))(
  ( (tuple2!19025 (_1!9523 (_ BitVec 64)) (_2!9523 V!44635)) )
))
(declare-datatypes ((List!25762 0))(
  ( (Nil!25759) (Cons!25758 (h!26967 tuple2!19024) (t!37855 List!25762)) )
))
(declare-datatypes ((ListLongMap!16993 0))(
  ( (ListLongMap!16994 (toList!8512 List!25762)) )
))
(declare-fun lt!531447 () ListLongMap!16993)

(declare-fun e!669146 () Bool)

(declare-fun lt!531453 () tuple2!19024)

(declare-fun lt!531444 () ListLongMap!16993)

(declare-fun +!3827 (ListLongMap!16993 tuple2!19024) ListLongMap!16993)

(assert (=> b!1177127 (= e!669146 (= lt!531447 (+!3827 lt!531444 lt!531453)))))

(declare-fun b!1177128 () Bool)

(declare-fun e!669151 () Bool)

(assert (=> b!1177128 (= e!669151 true)))

(assert (=> b!1177128 e!669146))

(declare-fun res!781896 () Bool)

(assert (=> b!1177128 (=> (not res!781896) (not e!669146))))

(assert (=> b!1177128 (= res!781896 (not (= (select (arr!36684 _keys!1208) from!1455) k0!934)))))

(declare-datatypes ((Unit!38868 0))(
  ( (Unit!38869) )
))
(declare-fun lt!531449 () Unit!38868)

(declare-fun e!669148 () Unit!38868)

(assert (=> b!1177128 (= lt!531449 e!669148)))

(declare-fun c!116775 () Bool)

(assert (=> b!1177128 (= c!116775 (= (select (arr!36684 _keys!1208) from!1455) k0!934))))

(declare-fun e!669150 () Bool)

(assert (=> b!1177128 e!669150))

(declare-fun res!781886 () Bool)

(assert (=> b!1177128 (=> (not res!781886) (not e!669150))))

(declare-fun lt!531442 () ListLongMap!16993)

(declare-fun lt!531439 () ListLongMap!16993)

(assert (=> b!1177128 (= res!781886 (= lt!531442 (+!3827 lt!531439 lt!531453)))))

(declare-fun lt!531440 () V!44635)

(declare-fun get!18741 (ValueCell!14106 V!44635) V!44635)

(assert (=> b!1177128 (= lt!531453 (tuple2!19025 (select (arr!36684 _keys!1208) from!1455) (get!18741 (select (arr!36685 _values!996) from!1455) lt!531440)))))

(declare-fun b!1177129 () Bool)

(declare-fun res!781894 () Bool)

(assert (=> b!1177129 (=> (not res!781894) (not e!669156))))

(assert (=> b!1177129 (= res!781894 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37220 _keys!1208))))))

(declare-fun b!1177130 () Bool)

(declare-fun e!669157 () Bool)

(assert (=> b!1177130 (= e!669157 tp_is_empty!29631)))

(declare-fun mapNonEmpty!46274 () Bool)

(declare-fun mapRes!46274 () Bool)

(declare-fun tp!88017 () Bool)

(declare-fun e!669152 () Bool)

(assert (=> mapNonEmpty!46274 (= mapRes!46274 (and tp!88017 e!669152))))

(declare-fun mapValue!46274 () ValueCell!14106)

(declare-fun mapKey!46274 () (_ BitVec 32))

(declare-fun mapRest!46274 () (Array (_ BitVec 32) ValueCell!14106))

(assert (=> mapNonEmpty!46274 (= (arr!36685 _values!996) (store mapRest!46274 mapKey!46274 mapValue!46274))))

(declare-fun b!1177131 () Bool)

(declare-fun res!781887 () Bool)

(assert (=> b!1177131 (=> (not res!781887) (not e!669149))))

(declare-datatypes ((List!25763 0))(
  ( (Nil!25760) (Cons!25759 (h!26968 (_ BitVec 64)) (t!37856 List!25763)) )
))
(declare-fun arrayNoDuplicates!0 (array!76069 (_ BitVec 32) List!25763) Bool)

(assert (=> b!1177131 (= res!781887 (arrayNoDuplicates!0 lt!531452 #b00000000000000000000000000000000 Nil!25760))))

(declare-fun b!1177132 () Bool)

(assert (=> b!1177132 (= e!669147 (and e!669157 mapRes!46274))))

(declare-fun condMapEmpty!46274 () Bool)

(declare-fun mapDefault!46274 () ValueCell!14106)

(assert (=> b!1177132 (= condMapEmpty!46274 (= (arr!36685 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14106)) mapDefault!46274)))))

(declare-fun b!1177133 () Bool)

(declare-fun res!781883 () Bool)

(assert (=> b!1177133 (=> (not res!781883) (not e!669156))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1177133 (= res!781883 (and (= (size!37221 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37220 _keys!1208) (size!37221 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1177134 () Bool)

(declare-fun res!781885 () Bool)

(assert (=> b!1177134 (=> (not res!781885) (not e!669156))))

(assert (=> b!1177134 (= res!781885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1177135 () Bool)

(declare-fun e!669155 () Bool)

(assert (=> b!1177135 (= e!669149 (not e!669155))))

(declare-fun res!781892 () Bool)

(assert (=> b!1177135 (=> res!781892 e!669155)))

(assert (=> b!1177135 (= res!781892 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76069 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1177135 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!531446 () Unit!38868)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76069 (_ BitVec 64) (_ BitVec 32)) Unit!38868)

(assert (=> b!1177135 (= lt!531446 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1177136 () Bool)

(declare-fun e!669153 () Bool)

(assert (=> b!1177136 (= e!669155 e!669153)))

(declare-fun res!781895 () Bool)

(assert (=> b!1177136 (=> res!781895 e!669153)))

(assert (=> b!1177136 (= res!781895 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44635)

(declare-fun minValue!944 () V!44635)

(declare-fun lt!531443 () array!76071)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4969 (array!76069 array!76071 (_ BitVec 32) (_ BitVec 32) V!44635 V!44635 (_ BitVec 32) Int) ListLongMap!16993)

(assert (=> b!1177136 (= lt!531442 (getCurrentListMapNoExtraKeys!4969 lt!531452 lt!531443 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1177136 (= lt!531443 (array!76072 (store (arr!36685 _values!996) i!673 (ValueCellFull!14106 lt!531440)) (size!37221 _values!996)))))

(declare-fun dynLambda!2933 (Int (_ BitVec 64)) V!44635)

(assert (=> b!1177136 (= lt!531440 (dynLambda!2933 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1177136 (= lt!531447 (getCurrentListMapNoExtraKeys!4969 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1177137 () Bool)

(assert (=> b!1177137 (= e!669152 tp_is_empty!29631)))

(declare-fun b!1177138 () Bool)

(declare-fun Unit!38870 () Unit!38868)

(assert (=> b!1177138 (= e!669148 Unit!38870)))

(declare-fun mapIsEmpty!46274 () Bool)

(assert (=> mapIsEmpty!46274 mapRes!46274))

(declare-fun b!1177139 () Bool)

(declare-fun Unit!38871 () Unit!38868)

(assert (=> b!1177139 (= e!669148 Unit!38871)))

(declare-fun lt!531441 () Unit!38868)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76069 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38868)

(assert (=> b!1177139 (= lt!531441 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1177139 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!531445 () Unit!38868)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76069 (_ BitVec 32) (_ BitVec 32)) Unit!38868)

(assert (=> b!1177139 (= lt!531445 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1177139 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25760)))

(declare-fun lt!531448 () Unit!38868)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76069 (_ BitVec 64) (_ BitVec 32) List!25763) Unit!38868)

(assert (=> b!1177139 (= lt!531448 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25760))))

(assert (=> b!1177139 false))

(declare-fun b!1177140 () Bool)

(declare-fun e!669145 () Bool)

(assert (=> b!1177140 (= e!669150 e!669145)))

(declare-fun res!781897 () Bool)

(assert (=> b!1177140 (=> res!781897 e!669145)))

(assert (=> b!1177140 (= res!781897 (not (= (select (arr!36684 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1177141 () Bool)

(declare-fun res!781888 () Bool)

(assert (=> b!1177141 (=> (not res!781888) (not e!669156))))

(assert (=> b!1177141 (= res!781888 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25760))))

(declare-fun b!1177142 () Bool)

(assert (=> b!1177142 (= e!669153 e!669151)))

(declare-fun res!781884 () Bool)

(assert (=> b!1177142 (=> res!781884 e!669151)))

(assert (=> b!1177142 (= res!781884 (not (validKeyInArray!0 (select (arr!36684 _keys!1208) from!1455))))))

(declare-fun lt!531450 () ListLongMap!16993)

(assert (=> b!1177142 (= lt!531450 lt!531439)))

(declare-fun -!1561 (ListLongMap!16993 (_ BitVec 64)) ListLongMap!16993)

(assert (=> b!1177142 (= lt!531439 (-!1561 lt!531444 k0!934))))

(assert (=> b!1177142 (= lt!531450 (getCurrentListMapNoExtraKeys!4969 lt!531452 lt!531443 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1177142 (= lt!531444 (getCurrentListMapNoExtraKeys!4969 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!531451 () Unit!38868)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!788 (array!76069 array!76071 (_ BitVec 32) (_ BitVec 32) V!44635 V!44635 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38868)

(assert (=> b!1177142 (= lt!531451 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!788 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1177143 () Bool)

(assert (=> b!1177143 (= e!669145 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1177144 () Bool)

(declare-fun res!781890 () Bool)

(assert (=> b!1177144 (=> (not res!781890) (not e!669156))))

(assert (=> b!1177144 (= res!781890 (= (select (arr!36684 _keys!1208) i!673) k0!934))))

(declare-fun b!1177145 () Bool)

(declare-fun res!781889 () Bool)

(assert (=> b!1177145 (=> (not res!781889) (not e!669156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1177145 (= res!781889 (validMask!0 mask!1564))))

(assert (= (and start!99522 res!781893) b!1177145))

(assert (= (and b!1177145 res!781889) b!1177133))

(assert (= (and b!1177133 res!781883) b!1177134))

(assert (= (and b!1177134 res!781885) b!1177141))

(assert (= (and b!1177141 res!781888) b!1177129))

(assert (= (and b!1177129 res!781894) b!1177126))

(assert (= (and b!1177126 res!781882) b!1177144))

(assert (= (and b!1177144 res!781890) b!1177125))

(assert (= (and b!1177125 res!781891) b!1177131))

(assert (= (and b!1177131 res!781887) b!1177135))

(assert (= (and b!1177135 (not res!781892)) b!1177136))

(assert (= (and b!1177136 (not res!781895)) b!1177142))

(assert (= (and b!1177142 (not res!781884)) b!1177128))

(assert (= (and b!1177128 res!781886) b!1177140))

(assert (= (and b!1177140 (not res!781897)) b!1177143))

(assert (= (and b!1177128 c!116775) b!1177139))

(assert (= (and b!1177128 (not c!116775)) b!1177138))

(assert (= (and b!1177128 res!781896) b!1177127))

(assert (= (and b!1177132 condMapEmpty!46274) mapIsEmpty!46274))

(assert (= (and b!1177132 (not condMapEmpty!46274)) mapNonEmpty!46274))

(get-info :version)

(assert (= (and mapNonEmpty!46274 ((_ is ValueCellFull!14106) mapValue!46274)) b!1177137))

(assert (= (and b!1177132 ((_ is ValueCellFull!14106) mapDefault!46274)) b!1177130))

(assert (= start!99522 b!1177132))

(declare-fun b_lambda!20245 () Bool)

(assert (=> (not b_lambda!20245) (not b!1177136)))

(declare-fun t!37854 () Bool)

(declare-fun tb!9913 () Bool)

(assert (=> (and start!99522 (= defaultEntry!1004 defaultEntry!1004) t!37854) tb!9913))

(declare-fun result!20393 () Bool)

(assert (=> tb!9913 (= result!20393 tp_is_empty!29631)))

(assert (=> b!1177136 t!37854))

(declare-fun b_and!41071 () Bool)

(assert (= b_and!41069 (and (=> t!37854 result!20393) b_and!41071)))

(declare-fun m!1085067 () Bool)

(assert (=> b!1177141 m!1085067))

(declare-fun m!1085069 () Bool)

(assert (=> b!1177136 m!1085069))

(declare-fun m!1085071 () Bool)

(assert (=> b!1177136 m!1085071))

(declare-fun m!1085073 () Bool)

(assert (=> b!1177136 m!1085073))

(declare-fun m!1085075 () Bool)

(assert (=> b!1177136 m!1085075))

(declare-fun m!1085077 () Bool)

(assert (=> b!1177128 m!1085077))

(declare-fun m!1085079 () Bool)

(assert (=> b!1177128 m!1085079))

(declare-fun m!1085081 () Bool)

(assert (=> b!1177128 m!1085081))

(assert (=> b!1177128 m!1085081))

(declare-fun m!1085083 () Bool)

(assert (=> b!1177128 m!1085083))

(declare-fun m!1085085 () Bool)

(assert (=> start!99522 m!1085085))

(declare-fun m!1085087 () Bool)

(assert (=> start!99522 m!1085087))

(declare-fun m!1085089 () Bool)

(assert (=> b!1177142 m!1085089))

(declare-fun m!1085091 () Bool)

(assert (=> b!1177142 m!1085091))

(declare-fun m!1085093 () Bool)

(assert (=> b!1177142 m!1085093))

(declare-fun m!1085095 () Bool)

(assert (=> b!1177142 m!1085095))

(assert (=> b!1177142 m!1085077))

(declare-fun m!1085097 () Bool)

(assert (=> b!1177142 m!1085097))

(assert (=> b!1177142 m!1085077))

(declare-fun m!1085099 () Bool)

(assert (=> b!1177131 m!1085099))

(declare-fun m!1085101 () Bool)

(assert (=> b!1177126 m!1085101))

(declare-fun m!1085103 () Bool)

(assert (=> b!1177125 m!1085103))

(declare-fun m!1085105 () Bool)

(assert (=> b!1177125 m!1085105))

(declare-fun m!1085107 () Bool)

(assert (=> b!1177139 m!1085107))

(declare-fun m!1085109 () Bool)

(assert (=> b!1177139 m!1085109))

(declare-fun m!1085111 () Bool)

(assert (=> b!1177139 m!1085111))

(declare-fun m!1085113 () Bool)

(assert (=> b!1177139 m!1085113))

(declare-fun m!1085115 () Bool)

(assert (=> b!1177139 m!1085115))

(declare-fun m!1085117 () Bool)

(assert (=> b!1177135 m!1085117))

(declare-fun m!1085119 () Bool)

(assert (=> b!1177135 m!1085119))

(assert (=> b!1177140 m!1085077))

(declare-fun m!1085121 () Bool)

(assert (=> b!1177144 m!1085121))

(declare-fun m!1085123 () Bool)

(assert (=> b!1177143 m!1085123))

(declare-fun m!1085125 () Bool)

(assert (=> b!1177127 m!1085125))

(declare-fun m!1085127 () Bool)

(assert (=> mapNonEmpty!46274 m!1085127))

(declare-fun m!1085129 () Bool)

(assert (=> b!1177145 m!1085129))

(declare-fun m!1085131 () Bool)

(assert (=> b!1177134 m!1085131))

(check-sat (not b!1177139) (not b!1177136) (not b!1177134) (not b!1177128) (not b!1177142) (not start!99522) (not b!1177126) (not b!1177127) (not b!1177135) (not b!1177131) (not b!1177125) (not b_lambda!20245) (not b_next!25101) (not b!1177145) b_and!41071 (not b!1177141) (not mapNonEmpty!46274) tp_is_empty!29631 (not b!1177143))
(check-sat b_and!41071 (not b_next!25101))
