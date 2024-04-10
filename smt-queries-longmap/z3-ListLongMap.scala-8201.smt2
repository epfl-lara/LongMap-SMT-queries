; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100074 () Bool)

(assert start!100074)

(declare-fun b_free!25653 () Bool)

(declare-fun b_next!25653 () Bool)

(assert (=> start!100074 (= b_free!25653 (not b_next!25653))))

(declare-fun tp!89673 () Bool)

(declare-fun b_and!42173 () Bool)

(assert (=> start!100074 (= tp!89673 b_and!42173)))

(declare-fun mapIsEmpty!47102 () Bool)

(declare-fun mapRes!47102 () Bool)

(assert (=> mapIsEmpty!47102 mapRes!47102))

(declare-fun b!1193019 () Bool)

(declare-fun res!793692 () Bool)

(declare-fun e!678082 () Bool)

(assert (=> b!1193019 (=> (not res!793692) (not e!678082))))

(declare-datatypes ((array!77149 0))(
  ( (array!77150 (arr!37224 (Array (_ BitVec 32) (_ BitVec 64))) (size!37760 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77149)

(declare-datatypes ((List!26218 0))(
  ( (Nil!26215) (Cons!26214 (h!27423 (_ BitVec 64)) (t!38863 List!26218)) )
))
(declare-fun arrayNoDuplicates!0 (array!77149 (_ BitVec 32) List!26218) Bool)

(assert (=> b!1193019 (= res!793692 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26215))))

(declare-fun b!1193020 () Bool)

(declare-fun res!793698 () Bool)

(assert (=> b!1193020 (=> (not res!793698) (not e!678082))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1193020 (= res!793698 (validKeyInArray!0 k0!934))))

(declare-fun b!1193021 () Bool)

(declare-fun e!678079 () Bool)

(declare-fun e!678076 () Bool)

(assert (=> b!1193021 (= e!678079 (not e!678076))))

(declare-fun res!793694 () Bool)

(assert (=> b!1193021 (=> res!793694 e!678076)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1193021 (= res!793694 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1193021 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39578 0))(
  ( (Unit!39579) )
))
(declare-fun lt!542441 () Unit!39578)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77149 (_ BitVec 64) (_ BitVec 32)) Unit!39578)

(assert (=> b!1193021 (= lt!542441 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!793691 () Bool)

(assert (=> start!100074 (=> (not res!793691) (not e!678082))))

(assert (=> start!100074 (= res!793691 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37760 _keys!1208))))))

(assert (=> start!100074 e!678082))

(declare-fun tp_is_empty!30183 () Bool)

(assert (=> start!100074 tp_is_empty!30183))

(declare-fun array_inv!28380 (array!77149) Bool)

(assert (=> start!100074 (array_inv!28380 _keys!1208)))

(assert (=> start!100074 true))

(assert (=> start!100074 tp!89673))

(declare-datatypes ((V!45371 0))(
  ( (V!45372 (val!15148 Int)) )
))
(declare-datatypes ((ValueCell!14382 0))(
  ( (ValueCellFull!14382 (v!17786 V!45371)) (EmptyCell!14382) )
))
(declare-datatypes ((array!77151 0))(
  ( (array!77152 (arr!37225 (Array (_ BitVec 32) ValueCell!14382)) (size!37761 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77151)

(declare-fun e!678081 () Bool)

(declare-fun array_inv!28381 (array!77151) Bool)

(assert (=> start!100074 (and (array_inv!28381 _values!996) e!678081)))

(declare-fun b!1193022 () Bool)

(declare-fun e!678077 () Bool)

(assert (=> b!1193022 (= e!678076 e!678077)))

(declare-fun res!793689 () Bool)

(assert (=> b!1193022 (=> res!793689 e!678077)))

(assert (=> b!1193022 (= res!793689 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45371)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!542438 () array!77151)

(declare-datatypes ((tuple2!19474 0))(
  ( (tuple2!19475 (_1!9748 (_ BitVec 64)) (_2!9748 V!45371)) )
))
(declare-datatypes ((List!26219 0))(
  ( (Nil!26216) (Cons!26215 (h!27424 tuple2!19474) (t!38864 List!26219)) )
))
(declare-datatypes ((ListLongMap!17443 0))(
  ( (ListLongMap!17444 (toList!8737 List!26219)) )
))
(declare-fun lt!542442 () ListLongMap!17443)

(declare-fun minValue!944 () V!45371)

(declare-fun lt!542439 () array!77149)

(declare-fun getCurrentListMapNoExtraKeys!5178 (array!77149 array!77151 (_ BitVec 32) (_ BitVec 32) V!45371 V!45371 (_ BitVec 32) Int) ListLongMap!17443)

(assert (=> b!1193022 (= lt!542442 (getCurrentListMapNoExtraKeys!5178 lt!542439 lt!542438 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3108 (Int (_ BitVec 64)) V!45371)

(assert (=> b!1193022 (= lt!542438 (array!77152 (store (arr!37225 _values!996) i!673 (ValueCellFull!14382 (dynLambda!3108 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37761 _values!996)))))

(declare-fun lt!542437 () ListLongMap!17443)

(assert (=> b!1193022 (= lt!542437 (getCurrentListMapNoExtraKeys!5178 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1193023 () Bool)

(assert (=> b!1193023 (= e!678077 true)))

(declare-fun -!1762 (ListLongMap!17443 (_ BitVec 64)) ListLongMap!17443)

(assert (=> b!1193023 (= (getCurrentListMapNoExtraKeys!5178 lt!542439 lt!542438 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1762 (getCurrentListMapNoExtraKeys!5178 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!542440 () Unit!39578)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!971 (array!77149 array!77151 (_ BitVec 32) (_ BitVec 32) V!45371 V!45371 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39578)

(assert (=> b!1193023 (= lt!542440 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!971 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1193024 () Bool)

(declare-fun e!678075 () Bool)

(assert (=> b!1193024 (= e!678081 (and e!678075 mapRes!47102))))

(declare-fun condMapEmpty!47102 () Bool)

(declare-fun mapDefault!47102 () ValueCell!14382)

(assert (=> b!1193024 (= condMapEmpty!47102 (= (arr!37225 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14382)) mapDefault!47102)))))

(declare-fun b!1193025 () Bool)

(declare-fun res!793695 () Bool)

(assert (=> b!1193025 (=> (not res!793695) (not e!678082))))

(assert (=> b!1193025 (= res!793695 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37760 _keys!1208))))))

(declare-fun b!1193026 () Bool)

(declare-fun res!793690 () Bool)

(assert (=> b!1193026 (=> (not res!793690) (not e!678082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77149 (_ BitVec 32)) Bool)

(assert (=> b!1193026 (= res!793690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1193027 () Bool)

(assert (=> b!1193027 (= e!678082 e!678079)))

(declare-fun res!793697 () Bool)

(assert (=> b!1193027 (=> (not res!793697) (not e!678079))))

(assert (=> b!1193027 (= res!793697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542439 mask!1564))))

(assert (=> b!1193027 (= lt!542439 (array!77150 (store (arr!37224 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37760 _keys!1208)))))

(declare-fun b!1193028 () Bool)

(declare-fun res!793696 () Bool)

(assert (=> b!1193028 (=> (not res!793696) (not e!678079))))

(assert (=> b!1193028 (= res!793696 (arrayNoDuplicates!0 lt!542439 #b00000000000000000000000000000000 Nil!26215))))

(declare-fun b!1193029 () Bool)

(declare-fun res!793699 () Bool)

(assert (=> b!1193029 (=> (not res!793699) (not e!678082))))

(assert (=> b!1193029 (= res!793699 (and (= (size!37761 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37760 _keys!1208) (size!37761 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1193030 () Bool)

(declare-fun res!793688 () Bool)

(assert (=> b!1193030 (=> (not res!793688) (not e!678082))))

(assert (=> b!1193030 (= res!793688 (= (select (arr!37224 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!47102 () Bool)

(declare-fun tp!89672 () Bool)

(declare-fun e!678080 () Bool)

(assert (=> mapNonEmpty!47102 (= mapRes!47102 (and tp!89672 e!678080))))

(declare-fun mapKey!47102 () (_ BitVec 32))

(declare-fun mapValue!47102 () ValueCell!14382)

(declare-fun mapRest!47102 () (Array (_ BitVec 32) ValueCell!14382))

(assert (=> mapNonEmpty!47102 (= (arr!37225 _values!996) (store mapRest!47102 mapKey!47102 mapValue!47102))))

(declare-fun b!1193031 () Bool)

(assert (=> b!1193031 (= e!678075 tp_is_empty!30183)))

(declare-fun b!1193032 () Bool)

(declare-fun res!793693 () Bool)

(assert (=> b!1193032 (=> (not res!793693) (not e!678082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193032 (= res!793693 (validMask!0 mask!1564))))

(declare-fun b!1193033 () Bool)

(assert (=> b!1193033 (= e!678080 tp_is_empty!30183)))

(assert (= (and start!100074 res!793691) b!1193032))

(assert (= (and b!1193032 res!793693) b!1193029))

(assert (= (and b!1193029 res!793699) b!1193026))

(assert (= (and b!1193026 res!793690) b!1193019))

(assert (= (and b!1193019 res!793692) b!1193025))

(assert (= (and b!1193025 res!793695) b!1193020))

(assert (= (and b!1193020 res!793698) b!1193030))

(assert (= (and b!1193030 res!793688) b!1193027))

(assert (= (and b!1193027 res!793697) b!1193028))

(assert (= (and b!1193028 res!793696) b!1193021))

(assert (= (and b!1193021 (not res!793694)) b!1193022))

(assert (= (and b!1193022 (not res!793689)) b!1193023))

(assert (= (and b!1193024 condMapEmpty!47102) mapIsEmpty!47102))

(assert (= (and b!1193024 (not condMapEmpty!47102)) mapNonEmpty!47102))

(get-info :version)

(assert (= (and mapNonEmpty!47102 ((_ is ValueCellFull!14382) mapValue!47102)) b!1193033))

(assert (= (and b!1193024 ((_ is ValueCellFull!14382) mapDefault!47102)) b!1193031))

(assert (= start!100074 b!1193024))

(declare-fun b_lambda!20797 () Bool)

(assert (=> (not b_lambda!20797) (not b!1193022)))

(declare-fun t!38862 () Bool)

(declare-fun tb!10465 () Bool)

(assert (=> (and start!100074 (= defaultEntry!1004 defaultEntry!1004) t!38862) tb!10465))

(declare-fun result!21497 () Bool)

(assert (=> tb!10465 (= result!21497 tp_is_empty!30183)))

(assert (=> b!1193022 t!38862))

(declare-fun b_and!42175 () Bool)

(assert (= b_and!42173 (and (=> t!38862 result!21497) b_and!42175)))

(declare-fun m!1101315 () Bool)

(assert (=> mapNonEmpty!47102 m!1101315))

(declare-fun m!1101317 () Bool)

(assert (=> start!100074 m!1101317))

(declare-fun m!1101319 () Bool)

(assert (=> start!100074 m!1101319))

(declare-fun m!1101321 () Bool)

(assert (=> b!1193027 m!1101321))

(declare-fun m!1101323 () Bool)

(assert (=> b!1193027 m!1101323))

(declare-fun m!1101325 () Bool)

(assert (=> b!1193023 m!1101325))

(declare-fun m!1101327 () Bool)

(assert (=> b!1193023 m!1101327))

(assert (=> b!1193023 m!1101327))

(declare-fun m!1101329 () Bool)

(assert (=> b!1193023 m!1101329))

(declare-fun m!1101331 () Bool)

(assert (=> b!1193023 m!1101331))

(declare-fun m!1101333 () Bool)

(assert (=> b!1193032 m!1101333))

(declare-fun m!1101335 () Bool)

(assert (=> b!1193019 m!1101335))

(declare-fun m!1101337 () Bool)

(assert (=> b!1193022 m!1101337))

(declare-fun m!1101339 () Bool)

(assert (=> b!1193022 m!1101339))

(declare-fun m!1101341 () Bool)

(assert (=> b!1193022 m!1101341))

(declare-fun m!1101343 () Bool)

(assert (=> b!1193022 m!1101343))

(declare-fun m!1101345 () Bool)

(assert (=> b!1193030 m!1101345))

(declare-fun m!1101347 () Bool)

(assert (=> b!1193021 m!1101347))

(declare-fun m!1101349 () Bool)

(assert (=> b!1193021 m!1101349))

(declare-fun m!1101351 () Bool)

(assert (=> b!1193020 m!1101351))

(declare-fun m!1101353 () Bool)

(assert (=> b!1193028 m!1101353))

(declare-fun m!1101355 () Bool)

(assert (=> b!1193026 m!1101355))

(check-sat (not b!1193028) (not b_next!25653) (not b!1193019) (not b!1193020) tp_is_empty!30183 b_and!42175 (not b!1193026) (not b!1193032) (not b!1193021) (not start!100074) (not b!1193027) (not mapNonEmpty!47102) (not b!1193023) (not b!1193022) (not b_lambda!20797))
(check-sat b_and!42175 (not b_next!25653))
