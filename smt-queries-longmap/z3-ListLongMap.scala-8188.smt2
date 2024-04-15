; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99988 () Bool)

(assert start!99988)

(declare-fun b_free!25573 () Bool)

(declare-fun b_next!25573 () Bool)

(assert (=> start!99988 (= b_free!25573 (not b_next!25573))))

(declare-fun tp!89432 () Bool)

(declare-fun b_and!41991 () Bool)

(assert (=> start!99988 (= tp!89432 b_and!41991)))

(declare-fun b!1191015 () Bool)

(declare-fun e!677039 () Bool)

(declare-fun e!677038 () Bool)

(assert (=> b!1191015 (= e!677039 (not e!677038))))

(declare-fun res!792193 () Bool)

(assert (=> b!1191015 (=> res!792193 e!677038)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1191015 (= res!792193 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!76928 0))(
  ( (array!76929 (arr!37114 (Array (_ BitVec 32) (_ BitVec 64))) (size!37652 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76928)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76928 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1191015 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39389 0))(
  ( (Unit!39390) )
))
(declare-fun lt!541530 () Unit!39389)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76928 (_ BitVec 64) (_ BitVec 32)) Unit!39389)

(assert (=> b!1191015 (= lt!541530 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1191017 () Bool)

(declare-fun res!792186 () Bool)

(declare-fun e!677042 () Bool)

(assert (=> b!1191017 (=> (not res!792186) (not e!677042))))

(assert (=> b!1191017 (= res!792186 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37652 _keys!1208))))))

(declare-fun b!1191018 () Bool)

(declare-fun e!677040 () Bool)

(assert (=> b!1191018 (= e!677038 e!677040)))

(declare-fun res!792191 () Bool)

(assert (=> b!1191018 (=> res!792191 e!677040)))

(assert (=> b!1191018 (= res!792191 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!45265 0))(
  ( (V!45266 (val!15108 Int)) )
))
(declare-fun zeroValue!944 () V!45265)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14342 0))(
  ( (ValueCellFull!14342 (v!17745 V!45265)) (EmptyCell!14342) )
))
(declare-datatypes ((array!76930 0))(
  ( (array!76931 (arr!37115 (Array (_ BitVec 32) ValueCell!14342)) (size!37653 (_ BitVec 32))) )
))
(declare-fun lt!541526 () array!76930)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!19528 0))(
  ( (tuple2!19529 (_1!9775 (_ BitVec 64)) (_2!9775 V!45265)) )
))
(declare-datatypes ((List!26239 0))(
  ( (Nil!26236) (Cons!26235 (h!27444 tuple2!19528) (t!38795 List!26239)) )
))
(declare-datatypes ((ListLongMap!17497 0))(
  ( (ListLongMap!17498 (toList!8764 List!26239)) )
))
(declare-fun lt!541529 () ListLongMap!17497)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!541527 () array!76928)

(declare-fun minValue!944 () V!45265)

(declare-fun getCurrentListMapNoExtraKeys!5214 (array!76928 array!76930 (_ BitVec 32) (_ BitVec 32) V!45265 V!45265 (_ BitVec 32) Int) ListLongMap!17497)

(assert (=> b!1191018 (= lt!541529 (getCurrentListMapNoExtraKeys!5214 lt!541527 lt!541526 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!76930)

(declare-fun dynLambda!3104 (Int (_ BitVec 64)) V!45265)

(assert (=> b!1191018 (= lt!541526 (array!76931 (store (arr!37115 _values!996) i!673 (ValueCellFull!14342 (dynLambda!3104 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37653 _values!996)))))

(declare-fun lt!541528 () ListLongMap!17497)

(assert (=> b!1191018 (= lt!541528 (getCurrentListMapNoExtraKeys!5214 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1191019 () Bool)

(declare-fun res!792192 () Bool)

(assert (=> b!1191019 (=> (not res!792192) (not e!677042))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1191019 (= res!792192 (validMask!0 mask!1564))))

(declare-fun b!1191020 () Bool)

(assert (=> b!1191020 (= e!677042 e!677039)))

(declare-fun res!792187 () Bool)

(assert (=> b!1191020 (=> (not res!792187) (not e!677039))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76928 (_ BitVec 32)) Bool)

(assert (=> b!1191020 (= res!792187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541527 mask!1564))))

(assert (=> b!1191020 (= lt!541527 (array!76929 (store (arr!37114 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37652 _keys!1208)))))

(declare-fun b!1191021 () Bool)

(declare-fun e!677037 () Bool)

(declare-fun e!677044 () Bool)

(declare-fun mapRes!46982 () Bool)

(assert (=> b!1191021 (= e!677037 (and e!677044 mapRes!46982))))

(declare-fun condMapEmpty!46982 () Bool)

(declare-fun mapDefault!46982 () ValueCell!14342)

(assert (=> b!1191021 (= condMapEmpty!46982 (= (arr!37115 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14342)) mapDefault!46982)))))

(declare-fun b!1191022 () Bool)

(declare-fun res!792189 () Bool)

(assert (=> b!1191022 (=> (not res!792189) (not e!677039))))

(declare-datatypes ((List!26240 0))(
  ( (Nil!26237) (Cons!26236 (h!27445 (_ BitVec 64)) (t!38796 List!26240)) )
))
(declare-fun arrayNoDuplicates!0 (array!76928 (_ BitVec 32) List!26240) Bool)

(assert (=> b!1191022 (= res!792189 (arrayNoDuplicates!0 lt!541527 #b00000000000000000000000000000000 Nil!26237))))

(declare-fun b!1191023 () Bool)

(declare-fun res!792184 () Bool)

(assert (=> b!1191023 (=> (not res!792184) (not e!677042))))

(assert (=> b!1191023 (= res!792184 (and (= (size!37653 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37652 _keys!1208) (size!37653 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1191024 () Bool)

(declare-fun tp_is_empty!30103 () Bool)

(assert (=> b!1191024 (= e!677044 tp_is_empty!30103)))

(declare-fun b!1191025 () Bool)

(declare-fun e!677041 () Bool)

(assert (=> b!1191025 (= e!677041 tp_is_empty!30103)))

(declare-fun res!792185 () Bool)

(assert (=> start!99988 (=> (not res!792185) (not e!677042))))

(assert (=> start!99988 (= res!792185 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37652 _keys!1208))))))

(assert (=> start!99988 e!677042))

(assert (=> start!99988 tp_is_empty!30103))

(declare-fun array_inv!28428 (array!76928) Bool)

(assert (=> start!99988 (array_inv!28428 _keys!1208)))

(assert (=> start!99988 true))

(assert (=> start!99988 tp!89432))

(declare-fun array_inv!28429 (array!76930) Bool)

(assert (=> start!99988 (and (array_inv!28429 _values!996) e!677037)))

(declare-fun b!1191016 () Bool)

(assert (=> b!1191016 (= e!677040 true)))

(declare-fun -!1707 (ListLongMap!17497 (_ BitVec 64)) ListLongMap!17497)

(assert (=> b!1191016 (= (getCurrentListMapNoExtraKeys!5214 lt!541527 lt!541526 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1707 (getCurrentListMapNoExtraKeys!5214 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!541525 () Unit!39389)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!957 (array!76928 array!76930 (_ BitVec 32) (_ BitVec 32) V!45265 V!45265 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39389)

(assert (=> b!1191016 (= lt!541525 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!957 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1191026 () Bool)

(declare-fun res!792183 () Bool)

(assert (=> b!1191026 (=> (not res!792183) (not e!677042))))

(assert (=> b!1191026 (= res!792183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1191027 () Bool)

(declare-fun res!792188 () Bool)

(assert (=> b!1191027 (=> (not res!792188) (not e!677042))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1191027 (= res!792188 (validKeyInArray!0 k0!934))))

(declare-fun b!1191028 () Bool)

(declare-fun res!792182 () Bool)

(assert (=> b!1191028 (=> (not res!792182) (not e!677042))))

(assert (=> b!1191028 (= res!792182 (= (select (arr!37114 _keys!1208) i!673) k0!934))))

(declare-fun b!1191029 () Bool)

(declare-fun res!792190 () Bool)

(assert (=> b!1191029 (=> (not res!792190) (not e!677042))))

(assert (=> b!1191029 (= res!792190 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26237))))

(declare-fun mapIsEmpty!46982 () Bool)

(assert (=> mapIsEmpty!46982 mapRes!46982))

(declare-fun mapNonEmpty!46982 () Bool)

(declare-fun tp!89433 () Bool)

(assert (=> mapNonEmpty!46982 (= mapRes!46982 (and tp!89433 e!677041))))

(declare-fun mapRest!46982 () (Array (_ BitVec 32) ValueCell!14342))

(declare-fun mapValue!46982 () ValueCell!14342)

(declare-fun mapKey!46982 () (_ BitVec 32))

(assert (=> mapNonEmpty!46982 (= (arr!37115 _values!996) (store mapRest!46982 mapKey!46982 mapValue!46982))))

(assert (= (and start!99988 res!792185) b!1191019))

(assert (= (and b!1191019 res!792192) b!1191023))

(assert (= (and b!1191023 res!792184) b!1191026))

(assert (= (and b!1191026 res!792183) b!1191029))

(assert (= (and b!1191029 res!792190) b!1191017))

(assert (= (and b!1191017 res!792186) b!1191027))

(assert (= (and b!1191027 res!792188) b!1191028))

(assert (= (and b!1191028 res!792182) b!1191020))

(assert (= (and b!1191020 res!792187) b!1191022))

(assert (= (and b!1191022 res!792189) b!1191015))

(assert (= (and b!1191015 (not res!792193)) b!1191018))

(assert (= (and b!1191018 (not res!792191)) b!1191016))

(assert (= (and b!1191021 condMapEmpty!46982) mapIsEmpty!46982))

(assert (= (and b!1191021 (not condMapEmpty!46982)) mapNonEmpty!46982))

(get-info :version)

(assert (= (and mapNonEmpty!46982 ((_ is ValueCellFull!14342) mapValue!46982)) b!1191025))

(assert (= (and b!1191021 ((_ is ValueCellFull!14342) mapDefault!46982)) b!1191024))

(assert (= start!99988 b!1191021))

(declare-fun b_lambda!20699 () Bool)

(assert (=> (not b_lambda!20699) (not b!1191018)))

(declare-fun t!38794 () Bool)

(declare-fun tb!10377 () Bool)

(assert (=> (and start!99988 (= defaultEntry!1004 defaultEntry!1004) t!38794) tb!10377))

(declare-fun result!21329 () Bool)

(assert (=> tb!10377 (= result!21329 tp_is_empty!30103)))

(assert (=> b!1191018 t!38794))

(declare-fun b_and!41993 () Bool)

(assert (= b_and!41991 (and (=> t!38794 result!21329) b_and!41993)))

(declare-fun m!1099025 () Bool)

(assert (=> b!1191027 m!1099025))

(declare-fun m!1099027 () Bool)

(assert (=> b!1191020 m!1099027))

(declare-fun m!1099029 () Bool)

(assert (=> b!1191020 m!1099029))

(declare-fun m!1099031 () Bool)

(assert (=> b!1191016 m!1099031))

(declare-fun m!1099033 () Bool)

(assert (=> b!1191016 m!1099033))

(assert (=> b!1191016 m!1099033))

(declare-fun m!1099035 () Bool)

(assert (=> b!1191016 m!1099035))

(declare-fun m!1099037 () Bool)

(assert (=> b!1191016 m!1099037))

(declare-fun m!1099039 () Bool)

(assert (=> b!1191018 m!1099039))

(declare-fun m!1099041 () Bool)

(assert (=> b!1191018 m!1099041))

(declare-fun m!1099043 () Bool)

(assert (=> b!1191018 m!1099043))

(declare-fun m!1099045 () Bool)

(assert (=> b!1191018 m!1099045))

(declare-fun m!1099047 () Bool)

(assert (=> mapNonEmpty!46982 m!1099047))

(declare-fun m!1099049 () Bool)

(assert (=> b!1191026 m!1099049))

(declare-fun m!1099051 () Bool)

(assert (=> start!99988 m!1099051))

(declare-fun m!1099053 () Bool)

(assert (=> start!99988 m!1099053))

(declare-fun m!1099055 () Bool)

(assert (=> b!1191022 m!1099055))

(declare-fun m!1099057 () Bool)

(assert (=> b!1191015 m!1099057))

(declare-fun m!1099059 () Bool)

(assert (=> b!1191015 m!1099059))

(declare-fun m!1099061 () Bool)

(assert (=> b!1191019 m!1099061))

(declare-fun m!1099063 () Bool)

(assert (=> b!1191028 m!1099063))

(declare-fun m!1099065 () Bool)

(assert (=> b!1191029 m!1099065))

(check-sat (not b!1191015) (not b_lambda!20699) (not start!99988) (not b!1191027) (not b!1191018) tp_is_empty!30103 (not b!1191019) (not b!1191029) (not b_next!25573) b_and!41993 (not b!1191026) (not mapNonEmpty!46982) (not b!1191022) (not b!1191020) (not b!1191016))
(check-sat b_and!41993 (not b_next!25573))
