; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98068 () Bool)

(assert start!98068)

(declare-fun b_free!23769 () Bool)

(declare-fun b_next!23769 () Bool)

(assert (=> start!98068 (= b_free!23769 (not b_next!23769))))

(declare-fun tp!84010 () Bool)

(declare-fun b_and!38321 () Bool)

(assert (=> start!98068 (= tp!84010 b_and!38321)))

(declare-fun b!1126122 () Bool)

(declare-fun e!641001 () Bool)

(declare-fun e!641003 () Bool)

(assert (=> b!1126122 (= e!641001 e!641003)))

(declare-fun res!752506 () Bool)

(assert (=> b!1126122 (=> res!752506 e!641003)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1126122 (= res!752506 (not (= from!1455 i!673)))))

(declare-datatypes ((V!42859 0))(
  ( (V!42860 (val!14206 Int)) )
))
(declare-fun zeroValue!944 () V!42859)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13440 0))(
  ( (ValueCellFull!13440 (v!16839 V!42859)) (EmptyCell!13440) )
))
(declare-datatypes ((array!73461 0))(
  ( (array!73462 (arr!35383 (Array (_ BitVec 32) ValueCell!13440)) (size!35919 (_ BitVec 32))) )
))
(declare-fun lt!500107 () array!73461)

(declare-datatypes ((array!73463 0))(
  ( (array!73464 (arr!35384 (Array (_ BitVec 32) (_ BitVec 64))) (size!35920 (_ BitVec 32))) )
))
(declare-fun lt!500105 () array!73463)

(declare-fun minValue!944 () V!42859)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!17860 0))(
  ( (tuple2!17861 (_1!8941 (_ BitVec 64)) (_2!8941 V!42859)) )
))
(declare-datatypes ((List!24636 0))(
  ( (Nil!24633) (Cons!24632 (h!25841 tuple2!17860) (t!35397 List!24636)) )
))
(declare-datatypes ((ListLongMap!15829 0))(
  ( (ListLongMap!15830 (toList!7930 List!24636)) )
))
(declare-fun lt!500108 () ListLongMap!15829)

(declare-fun getCurrentListMapNoExtraKeys!4418 (array!73463 array!73461 (_ BitVec 32) (_ BitVec 32) V!42859 V!42859 (_ BitVec 32) Int) ListLongMap!15829)

(assert (=> b!1126122 (= lt!500108 (getCurrentListMapNoExtraKeys!4418 lt!500105 lt!500107 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73461)

(declare-fun dynLambda!2508 (Int (_ BitVec 64)) V!42859)

(assert (=> b!1126122 (= lt!500107 (array!73462 (store (arr!35383 _values!996) i!673 (ValueCellFull!13440 (dynLambda!2508 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35919 _values!996)))))

(declare-fun _keys!1208 () array!73463)

(declare-fun lt!500111 () ListLongMap!15829)

(assert (=> b!1126122 (= lt!500111 (getCurrentListMapNoExtraKeys!4418 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1126123 () Bool)

(declare-fun res!752500 () Bool)

(declare-fun e!641004 () Bool)

(assert (=> b!1126123 (=> (not res!752500) (not e!641004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1126123 (= res!752500 (validMask!0 mask!1564))))

(declare-fun bm!47586 () Bool)

(declare-fun call!47590 () ListLongMap!15829)

(assert (=> bm!47586 (= call!47590 (getCurrentListMapNoExtraKeys!4418 lt!500105 lt!500107 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126124 () Bool)

(declare-fun res!752501 () Bool)

(assert (=> b!1126124 (=> (not res!752501) (not e!641004))))

(assert (=> b!1126124 (= res!752501 (and (= (size!35919 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35920 _keys!1208) (size!35919 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1126125 () Bool)

(declare-fun e!641002 () Bool)

(declare-fun tp_is_empty!28299 () Bool)

(assert (=> b!1126125 (= e!641002 tp_is_empty!28299)))

(declare-fun mapIsEmpty!44266 () Bool)

(declare-fun mapRes!44266 () Bool)

(assert (=> mapIsEmpty!44266 mapRes!44266))

(declare-fun b!1126126 () Bool)

(declare-fun res!752505 () Bool)

(assert (=> b!1126126 (=> (not res!752505) (not e!641004))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1126126 (= res!752505 (validKeyInArray!0 k0!934))))

(declare-fun b!1126127 () Bool)

(declare-fun e!640999 () Bool)

(declare-fun call!47589 () ListLongMap!15829)

(assert (=> b!1126127 (= e!640999 (= call!47590 call!47589))))

(declare-fun b!1126128 () Bool)

(declare-fun e!641007 () Bool)

(assert (=> b!1126128 (= e!641007 (and e!641002 mapRes!44266))))

(declare-fun condMapEmpty!44266 () Bool)

(declare-fun mapDefault!44266 () ValueCell!13440)

(assert (=> b!1126128 (= condMapEmpty!44266 (= (arr!35383 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13440)) mapDefault!44266)))))

(declare-fun b!1126129 () Bool)

(declare-fun res!752507 () Bool)

(assert (=> b!1126129 (=> (not res!752507) (not e!641004))))

(assert (=> b!1126129 (= res!752507 (= (select (arr!35384 _keys!1208) i!673) k0!934))))

(declare-fun b!1126130 () Bool)

(declare-fun res!752503 () Bool)

(declare-fun e!641006 () Bool)

(assert (=> b!1126130 (=> (not res!752503) (not e!641006))))

(declare-datatypes ((List!24637 0))(
  ( (Nil!24634) (Cons!24633 (h!25842 (_ BitVec 64)) (t!35398 List!24637)) )
))
(declare-fun arrayNoDuplicates!0 (array!73463 (_ BitVec 32) List!24637) Bool)

(assert (=> b!1126130 (= res!752503 (arrayNoDuplicates!0 lt!500105 #b00000000000000000000000000000000 Nil!24634))))

(declare-fun b!1126132 () Bool)

(declare-fun e!641005 () Bool)

(assert (=> b!1126132 (= e!641003 e!641005)))

(declare-fun res!752499 () Bool)

(assert (=> b!1126132 (=> res!752499 e!641005)))

(assert (=> b!1126132 (= res!752499 (not (= (select (arr!35384 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1126132 e!640999))

(declare-fun c!109644 () Bool)

(assert (=> b!1126132 (= c!109644 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36908 0))(
  ( (Unit!36909) )
))
(declare-fun lt!500109 () Unit!36908)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!375 (array!73463 array!73461 (_ BitVec 32) (_ BitVec 32) V!42859 V!42859 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36908)

(assert (=> b!1126132 (= lt!500109 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!375 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126133 () Bool)

(declare-fun e!641000 () Bool)

(assert (=> b!1126133 (= e!641000 tp_is_empty!28299)))

(declare-fun b!1126134 () Bool)

(declare-fun -!1125 (ListLongMap!15829 (_ BitVec 64)) ListLongMap!15829)

(assert (=> b!1126134 (= e!640999 (= call!47590 (-!1125 call!47589 k0!934)))))

(declare-fun b!1126135 () Bool)

(declare-fun res!752498 () Bool)

(assert (=> b!1126135 (=> (not res!752498) (not e!641004))))

(assert (=> b!1126135 (= res!752498 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35920 _keys!1208))))))

(declare-fun bm!47587 () Bool)

(assert (=> bm!47587 (= call!47589 (getCurrentListMapNoExtraKeys!4418 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44266 () Bool)

(declare-fun tp!84011 () Bool)

(assert (=> mapNonEmpty!44266 (= mapRes!44266 (and tp!84011 e!641000))))

(declare-fun mapValue!44266 () ValueCell!13440)

(declare-fun mapKey!44266 () (_ BitVec 32))

(declare-fun mapRest!44266 () (Array (_ BitVec 32) ValueCell!13440))

(assert (=> mapNonEmpty!44266 (= (arr!35383 _values!996) (store mapRest!44266 mapKey!44266 mapValue!44266))))

(declare-fun b!1126136 () Bool)

(assert (=> b!1126136 (= e!641005 true)))

(declare-fun lt!500110 () Bool)

(declare-fun contains!6464 (ListLongMap!15829 (_ BitVec 64)) Bool)

(assert (=> b!1126136 (= lt!500110 (contains!6464 (getCurrentListMapNoExtraKeys!4418 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1126137 () Bool)

(declare-fun res!752497 () Bool)

(assert (=> b!1126137 (=> (not res!752497) (not e!641004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73463 (_ BitVec 32)) Bool)

(assert (=> b!1126137 (= res!752497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1126131 () Bool)

(assert (=> b!1126131 (= e!641006 (not e!641001))))

(declare-fun res!752509 () Bool)

(assert (=> b!1126131 (=> res!752509 e!641001)))

(assert (=> b!1126131 (= res!752509 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73463 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1126131 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!500106 () Unit!36908)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73463 (_ BitVec 64) (_ BitVec 32)) Unit!36908)

(assert (=> b!1126131 (= lt!500106 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!752508 () Bool)

(assert (=> start!98068 (=> (not res!752508) (not e!641004))))

(assert (=> start!98068 (= res!752508 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35920 _keys!1208))))))

(assert (=> start!98068 e!641004))

(assert (=> start!98068 tp_is_empty!28299))

(declare-fun array_inv!27160 (array!73463) Bool)

(assert (=> start!98068 (array_inv!27160 _keys!1208)))

(assert (=> start!98068 true))

(assert (=> start!98068 tp!84010))

(declare-fun array_inv!27161 (array!73461) Bool)

(assert (=> start!98068 (and (array_inv!27161 _values!996) e!641007)))

(declare-fun b!1126138 () Bool)

(assert (=> b!1126138 (= e!641004 e!641006)))

(declare-fun res!752502 () Bool)

(assert (=> b!1126138 (=> (not res!752502) (not e!641006))))

(assert (=> b!1126138 (= res!752502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500105 mask!1564))))

(assert (=> b!1126138 (= lt!500105 (array!73464 (store (arr!35384 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35920 _keys!1208)))))

(declare-fun b!1126139 () Bool)

(declare-fun res!752504 () Bool)

(assert (=> b!1126139 (=> (not res!752504) (not e!641004))))

(assert (=> b!1126139 (= res!752504 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24634))))

(assert (= (and start!98068 res!752508) b!1126123))

(assert (= (and b!1126123 res!752500) b!1126124))

(assert (= (and b!1126124 res!752501) b!1126137))

(assert (= (and b!1126137 res!752497) b!1126139))

(assert (= (and b!1126139 res!752504) b!1126135))

(assert (= (and b!1126135 res!752498) b!1126126))

(assert (= (and b!1126126 res!752505) b!1126129))

(assert (= (and b!1126129 res!752507) b!1126138))

(assert (= (and b!1126138 res!752502) b!1126130))

(assert (= (and b!1126130 res!752503) b!1126131))

(assert (= (and b!1126131 (not res!752509)) b!1126122))

(assert (= (and b!1126122 (not res!752506)) b!1126132))

(assert (= (and b!1126132 c!109644) b!1126134))

(assert (= (and b!1126132 (not c!109644)) b!1126127))

(assert (= (or b!1126134 b!1126127) bm!47586))

(assert (= (or b!1126134 b!1126127) bm!47587))

(assert (= (and b!1126132 (not res!752499)) b!1126136))

(assert (= (and b!1126128 condMapEmpty!44266) mapIsEmpty!44266))

(assert (= (and b!1126128 (not condMapEmpty!44266)) mapNonEmpty!44266))

(get-info :version)

(assert (= (and mapNonEmpty!44266 ((_ is ValueCellFull!13440) mapValue!44266)) b!1126133))

(assert (= (and b!1126128 ((_ is ValueCellFull!13440) mapDefault!44266)) b!1126125))

(assert (= start!98068 b!1126128))

(declare-fun b_lambda!18739 () Bool)

(assert (=> (not b_lambda!18739) (not b!1126122)))

(declare-fun t!35396 () Bool)

(declare-fun tb!8581 () Bool)

(assert (=> (and start!98068 (= defaultEntry!1004 defaultEntry!1004) t!35396) tb!8581))

(declare-fun result!17723 () Bool)

(assert (=> tb!8581 (= result!17723 tp_is_empty!28299)))

(assert (=> b!1126122 t!35396))

(declare-fun b_and!38323 () Bool)

(assert (= b_and!38321 (and (=> t!35396 result!17723) b_and!38323)))

(declare-fun m!1040143 () Bool)

(assert (=> b!1126131 m!1040143))

(declare-fun m!1040145 () Bool)

(assert (=> b!1126131 m!1040145))

(declare-fun m!1040147 () Bool)

(assert (=> b!1126134 m!1040147))

(declare-fun m!1040149 () Bool)

(assert (=> b!1126122 m!1040149))

(declare-fun m!1040151 () Bool)

(assert (=> b!1126122 m!1040151))

(declare-fun m!1040153 () Bool)

(assert (=> b!1126122 m!1040153))

(declare-fun m!1040155 () Bool)

(assert (=> b!1126122 m!1040155))

(declare-fun m!1040157 () Bool)

(assert (=> b!1126126 m!1040157))

(declare-fun m!1040159 () Bool)

(assert (=> b!1126123 m!1040159))

(declare-fun m!1040161 () Bool)

(assert (=> b!1126130 m!1040161))

(declare-fun m!1040163 () Bool)

(assert (=> bm!47586 m!1040163))

(declare-fun m!1040165 () Bool)

(assert (=> b!1126129 m!1040165))

(declare-fun m!1040167 () Bool)

(assert (=> b!1126132 m!1040167))

(declare-fun m!1040169 () Bool)

(assert (=> b!1126132 m!1040169))

(declare-fun m!1040171 () Bool)

(assert (=> b!1126137 m!1040171))

(declare-fun m!1040173 () Bool)

(assert (=> b!1126136 m!1040173))

(assert (=> b!1126136 m!1040173))

(declare-fun m!1040175 () Bool)

(assert (=> b!1126136 m!1040175))

(assert (=> bm!47587 m!1040173))

(declare-fun m!1040177 () Bool)

(assert (=> b!1126138 m!1040177))

(declare-fun m!1040179 () Bool)

(assert (=> b!1126138 m!1040179))

(declare-fun m!1040181 () Bool)

(assert (=> start!98068 m!1040181))

(declare-fun m!1040183 () Bool)

(assert (=> start!98068 m!1040183))

(declare-fun m!1040185 () Bool)

(assert (=> mapNonEmpty!44266 m!1040185))

(declare-fun m!1040187 () Bool)

(assert (=> b!1126139 m!1040187))

(check-sat (not bm!47587) (not bm!47586) (not b!1126137) (not b!1126139) (not b_lambda!18739) tp_is_empty!28299 (not mapNonEmpty!44266) b_and!38323 (not b!1126136) (not b!1126132) (not b!1126134) (not b!1126131) (not start!98068) (not b!1126130) (not b!1126122) (not b!1126123) (not b!1126138) (not b!1126126) (not b_next!23769))
(check-sat b_and!38323 (not b_next!23769))
