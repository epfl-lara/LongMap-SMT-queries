; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98260 () Bool)

(assert start!98260)

(declare-fun b_free!23725 () Bool)

(declare-fun b_next!23725 () Bool)

(assert (=> start!98260 (= b_free!23725 (not b_next!23725))))

(declare-fun tp!83878 () Bool)

(declare-fun b_and!38243 () Bool)

(assert (=> start!98260 (= tp!83878 b_and!38243)))

(declare-fun b!1126149 () Bool)

(declare-fun e!641163 () Bool)

(declare-fun e!641167 () Bool)

(assert (=> b!1126149 (= e!641163 (not e!641167))))

(declare-fun res!752104 () Bool)

(assert (=> b!1126149 (=> res!752104 e!641167)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1126149 (= res!752104 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!73423 0))(
  ( (array!73424 (arr!35358 (Array (_ BitVec 32) (_ BitVec 64))) (size!35895 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73423)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73423 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1126149 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36865 0))(
  ( (Unit!36866) )
))
(declare-fun lt!500124 () Unit!36865)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73423 (_ BitVec 64) (_ BitVec 32)) Unit!36865)

(assert (=> b!1126149 (= lt!500124 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1126150 () Bool)

(declare-fun e!641168 () Bool)

(declare-fun tp_is_empty!28255 () Bool)

(assert (=> b!1126150 (= e!641168 tp_is_empty!28255)))

(declare-fun b!1126151 () Bool)

(declare-fun e!641161 () Bool)

(assert (=> b!1126151 (= e!641161 tp_is_empty!28255)))

(declare-fun b!1126152 () Bool)

(declare-fun res!752107 () Bool)

(declare-fun e!641159 () Bool)

(assert (=> b!1126152 (=> res!752107 e!641159)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1126152 (= res!752107 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!44200 () Bool)

(declare-fun mapRes!44200 () Bool)

(declare-fun tp!83879 () Bool)

(assert (=> mapNonEmpty!44200 (= mapRes!44200 (and tp!83879 e!641161))))

(declare-datatypes ((V!42801 0))(
  ( (V!42802 (val!14184 Int)) )
))
(declare-datatypes ((ValueCell!13418 0))(
  ( (ValueCellFull!13418 (v!16813 V!42801)) (EmptyCell!13418) )
))
(declare-fun mapRest!44200 () (Array (_ BitVec 32) ValueCell!13418))

(declare-fun mapKey!44200 () (_ BitVec 32))

(declare-datatypes ((array!73425 0))(
  ( (array!73426 (arr!35359 (Array (_ BitVec 32) ValueCell!13418)) (size!35896 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73425)

(declare-fun mapValue!44200 () ValueCell!13418)

(assert (=> mapNonEmpty!44200 (= (arr!35359 _values!996) (store mapRest!44200 mapKey!44200 mapValue!44200))))

(declare-fun zeroValue!944 () V!42801)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!47521 () Bool)

(declare-datatypes ((tuple2!17834 0))(
  ( (tuple2!17835 (_1!8928 (_ BitVec 64)) (_2!8928 V!42801)) )
))
(declare-datatypes ((List!24624 0))(
  ( (Nil!24621) (Cons!24620 (h!25838 tuple2!17834) (t!35333 List!24624)) )
))
(declare-datatypes ((ListLongMap!15811 0))(
  ( (ListLongMap!15812 (toList!7921 List!24624)) )
))
(declare-fun call!47525 () ListLongMap!15811)

(declare-fun minValue!944 () V!42801)

(declare-fun getCurrentListMapNoExtraKeys!4446 (array!73423 array!73425 (_ BitVec 32) (_ BitVec 32) V!42801 V!42801 (_ BitVec 32) Int) ListLongMap!15811)

(assert (=> bm!47521 (= call!47525 (getCurrentListMapNoExtraKeys!4446 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126153 () Bool)

(declare-fun e!641160 () Bool)

(assert (=> b!1126153 (= e!641160 e!641159)))

(declare-fun res!752095 () Bool)

(assert (=> b!1126153 (=> res!752095 e!641159)))

(declare-fun lt!500131 () ListLongMap!15811)

(declare-fun contains!6473 (ListLongMap!15811 (_ BitVec 64)) Bool)

(assert (=> b!1126153 (= res!752095 (not (contains!6473 lt!500131 k0!934)))))

(assert (=> b!1126153 (= lt!500131 (getCurrentListMapNoExtraKeys!4446 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126154 () Bool)

(declare-fun res!752099 () Bool)

(declare-fun e!641169 () Bool)

(assert (=> b!1126154 (=> (not res!752099) (not e!641169))))

(declare-datatypes ((List!24625 0))(
  ( (Nil!24622) (Cons!24621 (h!25839 (_ BitVec 64)) (t!35334 List!24625)) )
))
(declare-fun arrayNoDuplicates!0 (array!73423 (_ BitVec 32) List!24625) Bool)

(assert (=> b!1126154 (= res!752099 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24622))))

(declare-fun b!1126155 () Bool)

(assert (=> b!1126155 (= e!641159 true)))

(declare-fun +!3450 (ListLongMap!15811 tuple2!17834) ListLongMap!15811)

(assert (=> b!1126155 (contains!6473 (+!3450 lt!500131 (tuple2!17835 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!500126 () Unit!36865)

(declare-fun addStillContains!676 (ListLongMap!15811 (_ BitVec 64) V!42801 (_ BitVec 64)) Unit!36865)

(assert (=> b!1126155 (= lt!500126 (addStillContains!676 lt!500131 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun b!1126156 () Bool)

(declare-fun res!752100 () Bool)

(assert (=> b!1126156 (=> (not res!752100) (not e!641169))))

(assert (=> b!1126156 (= res!752100 (and (= (size!35896 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35895 _keys!1208) (size!35896 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1126157 () Bool)

(declare-fun e!641166 () Bool)

(declare-fun call!47524 () ListLongMap!15811)

(assert (=> b!1126157 (= e!641166 (= call!47524 call!47525))))

(declare-fun b!1126158 () Bool)

(assert (=> b!1126158 (= e!641169 e!641163)))

(declare-fun res!752106 () Bool)

(assert (=> b!1126158 (=> (not res!752106) (not e!641163))))

(declare-fun lt!500129 () array!73423)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73423 (_ BitVec 32)) Bool)

(assert (=> b!1126158 (= res!752106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500129 mask!1564))))

(assert (=> b!1126158 (= lt!500129 (array!73424 (store (arr!35358 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35895 _keys!1208)))))

(declare-fun b!1126159 () Bool)

(declare-fun e!641164 () Bool)

(assert (=> b!1126159 (= e!641167 e!641164)))

(declare-fun res!752096 () Bool)

(assert (=> b!1126159 (=> res!752096 e!641164)))

(assert (=> b!1126159 (= res!752096 (not (= from!1455 i!673)))))

(declare-fun lt!500128 () ListLongMap!15811)

(declare-fun lt!500130 () array!73425)

(assert (=> b!1126159 (= lt!500128 (getCurrentListMapNoExtraKeys!4446 lt!500129 lt!500130 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2524 (Int (_ BitVec 64)) V!42801)

(assert (=> b!1126159 (= lt!500130 (array!73426 (store (arr!35359 _values!996) i!673 (ValueCellFull!13418 (dynLambda!2524 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35896 _values!996)))))

(declare-fun lt!500125 () ListLongMap!15811)

(assert (=> b!1126159 (= lt!500125 (getCurrentListMapNoExtraKeys!4446 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1126160 () Bool)

(declare-fun res!752094 () Bool)

(assert (=> b!1126160 (=> (not res!752094) (not e!641169))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1126160 (= res!752094 (validKeyInArray!0 k0!934))))

(declare-fun b!1126161 () Bool)

(declare-fun res!752101 () Bool)

(assert (=> b!1126161 (=> (not res!752101) (not e!641163))))

(assert (=> b!1126161 (= res!752101 (arrayNoDuplicates!0 lt!500129 #b00000000000000000000000000000000 Nil!24622))))

(declare-fun b!1126162 () Bool)

(declare-fun res!752097 () Bool)

(assert (=> b!1126162 (=> (not res!752097) (not e!641169))))

(assert (=> b!1126162 (= res!752097 (= (select (arr!35358 _keys!1208) i!673) k0!934))))

(declare-fun b!1126163 () Bool)

(declare-fun res!752093 () Bool)

(assert (=> b!1126163 (=> (not res!752093) (not e!641169))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1126163 (= res!752093 (validMask!0 mask!1564))))

(declare-fun res!752105 () Bool)

(assert (=> start!98260 (=> (not res!752105) (not e!641169))))

(assert (=> start!98260 (= res!752105 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35895 _keys!1208))))))

(assert (=> start!98260 e!641169))

(assert (=> start!98260 tp_is_empty!28255))

(declare-fun array_inv!27198 (array!73423) Bool)

(assert (=> start!98260 (array_inv!27198 _keys!1208)))

(assert (=> start!98260 true))

(assert (=> start!98260 tp!83878))

(declare-fun e!641165 () Bool)

(declare-fun array_inv!27199 (array!73425) Bool)

(assert (=> start!98260 (and (array_inv!27199 _values!996) e!641165)))

(declare-fun mapIsEmpty!44200 () Bool)

(assert (=> mapIsEmpty!44200 mapRes!44200))

(declare-fun b!1126164 () Bool)

(declare-fun -!1107 (ListLongMap!15811 (_ BitVec 64)) ListLongMap!15811)

(assert (=> b!1126164 (= e!641166 (= call!47524 (-!1107 call!47525 k0!934)))))

(declare-fun b!1126165 () Bool)

(declare-fun res!752102 () Bool)

(assert (=> b!1126165 (=> (not res!752102) (not e!641169))))

(assert (=> b!1126165 (= res!752102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1126166 () Bool)

(assert (=> b!1126166 (= e!641165 (and e!641168 mapRes!44200))))

(declare-fun condMapEmpty!44200 () Bool)

(declare-fun mapDefault!44200 () ValueCell!13418)

(assert (=> b!1126166 (= condMapEmpty!44200 (= (arr!35359 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13418)) mapDefault!44200)))))

(declare-fun bm!47522 () Bool)

(assert (=> bm!47522 (= call!47524 (getCurrentListMapNoExtraKeys!4446 lt!500129 lt!500130 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126167 () Bool)

(declare-fun res!752103 () Bool)

(assert (=> b!1126167 (=> (not res!752103) (not e!641169))))

(assert (=> b!1126167 (= res!752103 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35895 _keys!1208))))))

(declare-fun b!1126168 () Bool)

(assert (=> b!1126168 (= e!641164 e!641160)))

(declare-fun res!752098 () Bool)

(assert (=> b!1126168 (=> res!752098 e!641160)))

(assert (=> b!1126168 (= res!752098 (not (= (select (arr!35358 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1126168 e!641166))

(declare-fun c!109988 () Bool)

(assert (=> b!1126168 (= c!109988 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!500127 () Unit!36865)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!369 (array!73423 array!73425 (_ BitVec 32) (_ BitVec 32) V!42801 V!42801 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36865)

(assert (=> b!1126168 (= lt!500127 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!369 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98260 res!752105) b!1126163))

(assert (= (and b!1126163 res!752093) b!1126156))

(assert (= (and b!1126156 res!752100) b!1126165))

(assert (= (and b!1126165 res!752102) b!1126154))

(assert (= (and b!1126154 res!752099) b!1126167))

(assert (= (and b!1126167 res!752103) b!1126160))

(assert (= (and b!1126160 res!752094) b!1126162))

(assert (= (and b!1126162 res!752097) b!1126158))

(assert (= (and b!1126158 res!752106) b!1126161))

(assert (= (and b!1126161 res!752101) b!1126149))

(assert (= (and b!1126149 (not res!752104)) b!1126159))

(assert (= (and b!1126159 (not res!752096)) b!1126168))

(assert (= (and b!1126168 c!109988) b!1126164))

(assert (= (and b!1126168 (not c!109988)) b!1126157))

(assert (= (or b!1126164 b!1126157) bm!47522))

(assert (= (or b!1126164 b!1126157) bm!47521))

(assert (= (and b!1126168 (not res!752098)) b!1126153))

(assert (= (and b!1126153 (not res!752095)) b!1126152))

(assert (= (and b!1126152 (not res!752107)) b!1126155))

(assert (= (and b!1126166 condMapEmpty!44200) mapIsEmpty!44200))

(assert (= (and b!1126166 (not condMapEmpty!44200)) mapNonEmpty!44200))

(get-info :version)

(assert (= (and mapNonEmpty!44200 ((_ is ValueCellFull!13418) mapValue!44200)) b!1126151))

(assert (= (and b!1126166 ((_ is ValueCellFull!13418) mapDefault!44200)) b!1126150))

(assert (= start!98260 b!1126166))

(declare-fun b_lambda!18705 () Bool)

(assert (=> (not b_lambda!18705) (not b!1126159)))

(declare-fun t!35332 () Bool)

(declare-fun tb!8529 () Bool)

(assert (=> (and start!98260 (= defaultEntry!1004 defaultEntry!1004) t!35332) tb!8529))

(declare-fun result!17627 () Bool)

(assert (=> tb!8529 (= result!17627 tp_is_empty!28255)))

(assert (=> b!1126159 t!35332))

(declare-fun b_and!38245 () Bool)

(assert (= b_and!38243 (and (=> t!35332 result!17627) b_and!38245)))

(declare-fun m!1040729 () Bool)

(assert (=> bm!47522 m!1040729))

(declare-fun m!1040731 () Bool)

(assert (=> mapNonEmpty!44200 m!1040731))

(declare-fun m!1040733 () Bool)

(assert (=> b!1126159 m!1040733))

(declare-fun m!1040735 () Bool)

(assert (=> b!1126159 m!1040735))

(declare-fun m!1040737 () Bool)

(assert (=> b!1126159 m!1040737))

(declare-fun m!1040739 () Bool)

(assert (=> b!1126159 m!1040739))

(declare-fun m!1040741 () Bool)

(assert (=> b!1126164 m!1040741))

(declare-fun m!1040743 () Bool)

(assert (=> b!1126162 m!1040743))

(declare-fun m!1040745 () Bool)

(assert (=> b!1126165 m!1040745))

(declare-fun m!1040747 () Bool)

(assert (=> start!98260 m!1040747))

(declare-fun m!1040749 () Bool)

(assert (=> start!98260 m!1040749))

(declare-fun m!1040751 () Bool)

(assert (=> b!1126155 m!1040751))

(assert (=> b!1126155 m!1040751))

(declare-fun m!1040753 () Bool)

(assert (=> b!1126155 m!1040753))

(declare-fun m!1040755 () Bool)

(assert (=> b!1126155 m!1040755))

(declare-fun m!1040757 () Bool)

(assert (=> b!1126158 m!1040757))

(declare-fun m!1040759 () Bool)

(assert (=> b!1126158 m!1040759))

(declare-fun m!1040761 () Bool)

(assert (=> b!1126160 m!1040761))

(declare-fun m!1040763 () Bool)

(assert (=> b!1126168 m!1040763))

(declare-fun m!1040765 () Bool)

(assert (=> b!1126168 m!1040765))

(declare-fun m!1040767 () Bool)

(assert (=> b!1126161 m!1040767))

(declare-fun m!1040769 () Bool)

(assert (=> b!1126163 m!1040769))

(declare-fun m!1040771 () Bool)

(assert (=> b!1126153 m!1040771))

(declare-fun m!1040773 () Bool)

(assert (=> b!1126153 m!1040773))

(declare-fun m!1040775 () Bool)

(assert (=> b!1126154 m!1040775))

(declare-fun m!1040777 () Bool)

(assert (=> b!1126149 m!1040777))

(declare-fun m!1040779 () Bool)

(assert (=> b!1126149 m!1040779))

(assert (=> bm!47521 m!1040773))

(check-sat (not bm!47522) (not b!1126165) (not b_next!23725) (not b!1126164) (not bm!47521) (not b!1126161) (not b!1126149) (not b!1126158) (not b_lambda!18705) (not b!1126168) tp_is_empty!28255 (not b!1126154) (not mapNonEmpty!44200) (not b!1126159) b_and!38245 (not start!98260) (not b!1126160) (not b!1126153) (not b!1126163) (not b!1126155))
(check-sat b_and!38245 (not b_next!23725))
