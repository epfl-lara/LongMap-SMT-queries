; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99702 () Bool)

(assert start!99702)

(declare-fun b_free!25281 () Bool)

(declare-fun b_next!25281 () Bool)

(assert (=> start!99702 (= b_free!25281 (not b_next!25281))))

(declare-fun tp!88557 () Bool)

(declare-fun b_and!41429 () Bool)

(assert (=> start!99702 (= tp!88557 b_and!41429)))

(declare-fun b!1182997 () Bool)

(declare-fun res!786224 () Bool)

(declare-fun e!672593 () Bool)

(assert (=> b!1182997 (=> (not res!786224) (not e!672593))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1182997 (= res!786224 (validKeyInArray!0 k0!934))))

(declare-fun res!786232 () Bool)

(assert (=> start!99702 (=> (not res!786232) (not e!672593))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76425 0))(
  ( (array!76426 (arr!36862 (Array (_ BitVec 32) (_ BitVec 64))) (size!37398 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76425)

(assert (=> start!99702 (= res!786232 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37398 _keys!1208))))))

(assert (=> start!99702 e!672593))

(declare-fun tp_is_empty!29811 () Bool)

(assert (=> start!99702 tp_is_empty!29811))

(declare-fun array_inv!28142 (array!76425) Bool)

(assert (=> start!99702 (array_inv!28142 _keys!1208)))

(assert (=> start!99702 true))

(assert (=> start!99702 tp!88557))

(declare-datatypes ((V!44875 0))(
  ( (V!44876 (val!14962 Int)) )
))
(declare-datatypes ((ValueCell!14196 0))(
  ( (ValueCellFull!14196 (v!17600 V!44875)) (EmptyCell!14196) )
))
(declare-datatypes ((array!76427 0))(
  ( (array!76428 (arr!36863 (Array (_ BitVec 32) ValueCell!14196)) (size!37399 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76427)

(declare-fun e!672595 () Bool)

(declare-fun array_inv!28143 (array!76427) Bool)

(assert (=> start!99702 (and (array_inv!28143 _values!996) e!672595)))

(declare-fun b!1182998 () Bool)

(declare-fun e!672589 () Bool)

(assert (=> b!1182998 (= e!672589 true)))

(declare-datatypes ((tuple2!19180 0))(
  ( (tuple2!19181 (_1!9601 (_ BitVec 64)) (_2!9601 V!44875)) )
))
(declare-datatypes ((List!25920 0))(
  ( (Nil!25917) (Cons!25916 (h!27125 tuple2!19180) (t!38193 List!25920)) )
))
(declare-datatypes ((ListLongMap!17149 0))(
  ( (ListLongMap!17150 (toList!8590 List!25920)) )
))
(declare-fun lt!535769 () ListLongMap!17149)

(declare-fun lt!535775 () ListLongMap!17149)

(declare-fun -!1625 (ListLongMap!17149 (_ BitVec 64)) ListLongMap!17149)

(assert (=> b!1182998 (= (-!1625 lt!535769 k0!934) lt!535775)))

(declare-fun lt!535776 () ListLongMap!17149)

(declare-datatypes ((Unit!39146 0))(
  ( (Unit!39147) )
))
(declare-fun lt!535777 () Unit!39146)

(declare-fun lt!535765 () V!44875)

(declare-fun addRemoveCommutativeForDiffKeys!153 (ListLongMap!17149 (_ BitVec 64) V!44875 (_ BitVec 64)) Unit!39146)

(assert (=> b!1182998 (= lt!535777 (addRemoveCommutativeForDiffKeys!153 lt!535776 (select (arr!36862 _keys!1208) from!1455) lt!535765 k0!934))))

(declare-fun lt!535762 () ListLongMap!17149)

(declare-fun lt!535772 () ListLongMap!17149)

(declare-fun lt!535767 () ListLongMap!17149)

(assert (=> b!1182998 (and (= lt!535772 lt!535769) (= lt!535762 lt!535767))))

(declare-fun lt!535770 () tuple2!19180)

(declare-fun +!3890 (ListLongMap!17149 tuple2!19180) ListLongMap!17149)

(assert (=> b!1182998 (= lt!535769 (+!3890 lt!535776 lt!535770))))

(assert (=> b!1182998 (not (= (select (arr!36862 _keys!1208) from!1455) k0!934))))

(declare-fun lt!535761 () Unit!39146)

(declare-fun e!672594 () Unit!39146)

(assert (=> b!1182998 (= lt!535761 e!672594)))

(declare-fun c!117045 () Bool)

(assert (=> b!1182998 (= c!117045 (= (select (arr!36862 _keys!1208) from!1455) k0!934))))

(declare-fun e!672596 () Bool)

(assert (=> b!1182998 e!672596))

(declare-fun res!786237 () Bool)

(assert (=> b!1182998 (=> (not res!786237) (not e!672596))))

(declare-fun lt!535764 () ListLongMap!17149)

(assert (=> b!1182998 (= res!786237 (= lt!535764 lt!535775))))

(assert (=> b!1182998 (= lt!535775 (+!3890 lt!535762 lt!535770))))

(assert (=> b!1182998 (= lt!535770 (tuple2!19181 (select (arr!36862 _keys!1208) from!1455) lt!535765))))

(declare-fun lt!535766 () V!44875)

(declare-fun get!18857 (ValueCell!14196 V!44875) V!44875)

(assert (=> b!1182998 (= lt!535765 (get!18857 (select (arr!36863 _values!996) from!1455) lt!535766))))

(declare-fun b!1182999 () Bool)

(declare-fun res!786234 () Bool)

(assert (=> b!1182999 (=> (not res!786234) (not e!672593))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1182999 (= res!786234 (= (select (arr!36862 _keys!1208) i!673) k0!934))))

(declare-fun b!1183000 () Bool)

(declare-fun e!672598 () Bool)

(assert (=> b!1183000 (= e!672598 e!672589)))

(declare-fun res!786225 () Bool)

(assert (=> b!1183000 (=> res!786225 e!672589)))

(assert (=> b!1183000 (= res!786225 (not (validKeyInArray!0 (select (arr!36862 _keys!1208) from!1455))))))

(assert (=> b!1183000 (= lt!535767 lt!535762)))

(assert (=> b!1183000 (= lt!535762 (-!1625 lt!535776 k0!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44875)

(declare-fun zeroValue!944 () V!44875)

(declare-fun lt!535763 () array!76425)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!535774 () array!76427)

(declare-fun getCurrentListMapNoExtraKeys!5041 (array!76425 array!76427 (_ BitVec 32) (_ BitVec 32) V!44875 V!44875 (_ BitVec 32) Int) ListLongMap!17149)

(assert (=> b!1183000 (= lt!535767 (getCurrentListMapNoExtraKeys!5041 lt!535763 lt!535774 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1183000 (= lt!535776 (getCurrentListMapNoExtraKeys!5041 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!535773 () Unit!39146)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!847 (array!76425 array!76427 (_ BitVec 32) (_ BitVec 32) V!44875 V!44875 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39146)

(assert (=> b!1183000 (= lt!535773 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!847 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1183001 () Bool)

(declare-fun res!786238 () Bool)

(assert (=> b!1183001 (=> (not res!786238) (not e!672593))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76425 (_ BitVec 32)) Bool)

(assert (=> b!1183001 (= res!786238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!46544 () Bool)

(declare-fun mapRes!46544 () Bool)

(declare-fun tp!88556 () Bool)

(declare-fun e!672587 () Bool)

(assert (=> mapNonEmpty!46544 (= mapRes!46544 (and tp!88556 e!672587))))

(declare-fun mapKey!46544 () (_ BitVec 32))

(declare-fun mapValue!46544 () ValueCell!14196)

(declare-fun mapRest!46544 () (Array (_ BitVec 32) ValueCell!14196))

(assert (=> mapNonEmpty!46544 (= (arr!36863 _values!996) (store mapRest!46544 mapKey!46544 mapValue!46544))))

(declare-fun mapIsEmpty!46544 () Bool)

(assert (=> mapIsEmpty!46544 mapRes!46544))

(declare-fun b!1183002 () Bool)

(declare-fun e!672588 () Bool)

(assert (=> b!1183002 (= e!672596 e!672588)))

(declare-fun res!786227 () Bool)

(assert (=> b!1183002 (=> res!786227 e!672588)))

(assert (=> b!1183002 (= res!786227 (not (= (select (arr!36862 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1183003 () Bool)

(declare-fun Unit!39148 () Unit!39146)

(assert (=> b!1183003 (= e!672594 Unit!39148)))

(declare-fun b!1183004 () Bool)

(declare-fun res!786233 () Bool)

(assert (=> b!1183004 (=> (not res!786233) (not e!672593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1183004 (= res!786233 (validMask!0 mask!1564))))

(declare-fun b!1183005 () Bool)

(declare-fun res!786236 () Bool)

(assert (=> b!1183005 (=> (not res!786236) (not e!672593))))

(assert (=> b!1183005 (= res!786236 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37398 _keys!1208))))))

(declare-fun b!1183006 () Bool)

(declare-fun e!672597 () Bool)

(assert (=> b!1183006 (= e!672597 tp_is_empty!29811)))

(declare-fun b!1183007 () Bool)

(declare-fun e!672592 () Bool)

(assert (=> b!1183007 (= e!672592 e!672598)))

(declare-fun res!786228 () Bool)

(assert (=> b!1183007 (=> res!786228 e!672598)))

(assert (=> b!1183007 (= res!786228 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1183007 (= lt!535764 (getCurrentListMapNoExtraKeys!5041 lt!535763 lt!535774 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1183007 (= lt!535774 (array!76428 (store (arr!36863 _values!996) i!673 (ValueCellFull!14196 lt!535766)) (size!37399 _values!996)))))

(declare-fun dynLambda!2995 (Int (_ BitVec 64)) V!44875)

(assert (=> b!1183007 (= lt!535766 (dynLambda!2995 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1183007 (= lt!535772 (getCurrentListMapNoExtraKeys!5041 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1183008 () Bool)

(declare-fun arrayContainsKey!0 (array!76425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1183008 (= e!672588 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1183009 () Bool)

(declare-fun res!786231 () Bool)

(declare-fun e!672591 () Bool)

(assert (=> b!1183009 (=> (not res!786231) (not e!672591))))

(declare-datatypes ((List!25921 0))(
  ( (Nil!25918) (Cons!25917 (h!27126 (_ BitVec 64)) (t!38194 List!25921)) )
))
(declare-fun arrayNoDuplicates!0 (array!76425 (_ BitVec 32) List!25921) Bool)

(assert (=> b!1183009 (= res!786231 (arrayNoDuplicates!0 lt!535763 #b00000000000000000000000000000000 Nil!25918))))

(declare-fun b!1183010 () Bool)

(declare-fun res!786230 () Bool)

(assert (=> b!1183010 (=> (not res!786230) (not e!672593))))

(assert (=> b!1183010 (= res!786230 (and (= (size!37399 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37398 _keys!1208) (size!37399 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1183011 () Bool)

(assert (=> b!1183011 (= e!672593 e!672591)))

(declare-fun res!786229 () Bool)

(assert (=> b!1183011 (=> (not res!786229) (not e!672591))))

(assert (=> b!1183011 (= res!786229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!535763 mask!1564))))

(assert (=> b!1183011 (= lt!535763 (array!76426 (store (arr!36862 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37398 _keys!1208)))))

(declare-fun b!1183012 () Bool)

(declare-fun Unit!39149 () Unit!39146)

(assert (=> b!1183012 (= e!672594 Unit!39149)))

(declare-fun lt!535771 () Unit!39146)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76425 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39146)

(assert (=> b!1183012 (= lt!535771 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1183012 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!535778 () Unit!39146)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76425 (_ BitVec 32) (_ BitVec 32)) Unit!39146)

(assert (=> b!1183012 (= lt!535778 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1183012 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25918)))

(declare-fun lt!535768 () Unit!39146)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76425 (_ BitVec 64) (_ BitVec 32) List!25921) Unit!39146)

(assert (=> b!1183012 (= lt!535768 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25918))))

(assert (=> b!1183012 false))

(declare-fun b!1183013 () Bool)

(assert (=> b!1183013 (= e!672591 (not e!672592))))

(declare-fun res!786226 () Bool)

(assert (=> b!1183013 (=> res!786226 e!672592)))

(assert (=> b!1183013 (= res!786226 (bvsgt from!1455 i!673))))

(assert (=> b!1183013 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!535779 () Unit!39146)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76425 (_ BitVec 64) (_ BitVec 32)) Unit!39146)

(assert (=> b!1183013 (= lt!535779 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1183014 () Bool)

(assert (=> b!1183014 (= e!672595 (and e!672597 mapRes!46544))))

(declare-fun condMapEmpty!46544 () Bool)

(declare-fun mapDefault!46544 () ValueCell!14196)

(assert (=> b!1183014 (= condMapEmpty!46544 (= (arr!36863 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14196)) mapDefault!46544)))))

(declare-fun b!1183015 () Bool)

(assert (=> b!1183015 (= e!672587 tp_is_empty!29811)))

(declare-fun b!1183016 () Bool)

(declare-fun res!786235 () Bool)

(assert (=> b!1183016 (=> (not res!786235) (not e!672593))))

(assert (=> b!1183016 (= res!786235 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25918))))

(assert (= (and start!99702 res!786232) b!1183004))

(assert (= (and b!1183004 res!786233) b!1183010))

(assert (= (and b!1183010 res!786230) b!1183001))

(assert (= (and b!1183001 res!786238) b!1183016))

(assert (= (and b!1183016 res!786235) b!1183005))

(assert (= (and b!1183005 res!786236) b!1182997))

(assert (= (and b!1182997 res!786224) b!1182999))

(assert (= (and b!1182999 res!786234) b!1183011))

(assert (= (and b!1183011 res!786229) b!1183009))

(assert (= (and b!1183009 res!786231) b!1183013))

(assert (= (and b!1183013 (not res!786226)) b!1183007))

(assert (= (and b!1183007 (not res!786228)) b!1183000))

(assert (= (and b!1183000 (not res!786225)) b!1182998))

(assert (= (and b!1182998 res!786237) b!1183002))

(assert (= (and b!1183002 (not res!786227)) b!1183008))

(assert (= (and b!1182998 c!117045) b!1183012))

(assert (= (and b!1182998 (not c!117045)) b!1183003))

(assert (= (and b!1183014 condMapEmpty!46544) mapIsEmpty!46544))

(assert (= (and b!1183014 (not condMapEmpty!46544)) mapNonEmpty!46544))

(get-info :version)

(assert (= (and mapNonEmpty!46544 ((_ is ValueCellFull!14196) mapValue!46544)) b!1183015))

(assert (= (and b!1183014 ((_ is ValueCellFull!14196) mapDefault!46544)) b!1183006))

(assert (= start!99702 b!1183014))

(declare-fun b_lambda!20425 () Bool)

(assert (=> (not b_lambda!20425) (not b!1183007)))

(declare-fun t!38192 () Bool)

(declare-fun tb!10093 () Bool)

(assert (=> (and start!99702 (= defaultEntry!1004 defaultEntry!1004) t!38192) tb!10093))

(declare-fun result!20753 () Bool)

(assert (=> tb!10093 (= result!20753 tp_is_empty!29811)))

(assert (=> b!1183007 t!38192))

(declare-fun b_and!41431 () Bool)

(assert (= b_and!41429 (and (=> t!38192 result!20753) b_and!41431)))

(declare-fun m!1091095 () Bool)

(assert (=> b!1183009 m!1091095))

(declare-fun m!1091097 () Bool)

(assert (=> b!1182999 m!1091097))

(declare-fun m!1091099 () Bool)

(assert (=> b!1183002 m!1091099))

(declare-fun m!1091101 () Bool)

(assert (=> b!1183012 m!1091101))

(declare-fun m!1091103 () Bool)

(assert (=> b!1183012 m!1091103))

(declare-fun m!1091105 () Bool)

(assert (=> b!1183012 m!1091105))

(declare-fun m!1091107 () Bool)

(assert (=> b!1183012 m!1091107))

(declare-fun m!1091109 () Bool)

(assert (=> b!1183012 m!1091109))

(declare-fun m!1091111 () Bool)

(assert (=> start!99702 m!1091111))

(declare-fun m!1091113 () Bool)

(assert (=> start!99702 m!1091113))

(declare-fun m!1091115 () Bool)

(assert (=> b!1183013 m!1091115))

(declare-fun m!1091117 () Bool)

(assert (=> b!1183013 m!1091117))

(declare-fun m!1091119 () Bool)

(assert (=> b!1183008 m!1091119))

(declare-fun m!1091121 () Bool)

(assert (=> b!1183016 m!1091121))

(declare-fun m!1091123 () Bool)

(assert (=> b!1182997 m!1091123))

(declare-fun m!1091125 () Bool)

(assert (=> b!1183007 m!1091125))

(declare-fun m!1091127 () Bool)

(assert (=> b!1183007 m!1091127))

(declare-fun m!1091129 () Bool)

(assert (=> b!1183007 m!1091129))

(declare-fun m!1091131 () Bool)

(assert (=> b!1183007 m!1091131))

(declare-fun m!1091133 () Bool)

(assert (=> mapNonEmpty!46544 m!1091133))

(declare-fun m!1091135 () Bool)

(assert (=> b!1183000 m!1091135))

(declare-fun m!1091137 () Bool)

(assert (=> b!1183000 m!1091137))

(declare-fun m!1091139 () Bool)

(assert (=> b!1183000 m!1091139))

(declare-fun m!1091141 () Bool)

(assert (=> b!1183000 m!1091141))

(assert (=> b!1183000 m!1091099))

(declare-fun m!1091143 () Bool)

(assert (=> b!1183000 m!1091143))

(assert (=> b!1183000 m!1091099))

(declare-fun m!1091145 () Bool)

(assert (=> b!1182998 m!1091145))

(declare-fun m!1091147 () Bool)

(assert (=> b!1182998 m!1091147))

(assert (=> b!1182998 m!1091145))

(declare-fun m!1091149 () Bool)

(assert (=> b!1182998 m!1091149))

(assert (=> b!1182998 m!1091099))

(declare-fun m!1091151 () Bool)

(assert (=> b!1182998 m!1091151))

(declare-fun m!1091153 () Bool)

(assert (=> b!1182998 m!1091153))

(declare-fun m!1091155 () Bool)

(assert (=> b!1182998 m!1091155))

(assert (=> b!1182998 m!1091099))

(declare-fun m!1091157 () Bool)

(assert (=> b!1183011 m!1091157))

(declare-fun m!1091159 () Bool)

(assert (=> b!1183011 m!1091159))

(declare-fun m!1091161 () Bool)

(assert (=> b!1183001 m!1091161))

(declare-fun m!1091163 () Bool)

(assert (=> b!1183004 m!1091163))

(check-sat (not b!1182998) (not b!1183012) (not b!1183001) (not b_lambda!20425) (not b!1182997) (not b!1183008) (not b_next!25281) (not start!99702) b_and!41431 (not b!1183011) (not b!1183007) (not b!1183009) tp_is_empty!29811 (not b!1183000) (not b!1183004) (not mapNonEmpty!46544) (not b!1183013) (not b!1183016))
(check-sat b_and!41431 (not b_next!25281))
