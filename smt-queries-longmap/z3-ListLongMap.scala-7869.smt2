; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98194 () Bool)

(assert start!98194)

(declare-fun b_free!23659 () Bool)

(declare-fun b_next!23659 () Bool)

(assert (=> start!98194 (= b_free!23659 (not b_next!23659))))

(declare-fun tp!83681 () Bool)

(declare-fun b_and!38111 () Bool)

(assert (=> start!98194 (= tp!83681 b_and!38111)))

(declare-datatypes ((V!42713 0))(
  ( (V!42714 (val!14151 Int)) )
))
(declare-fun zeroValue!944 () V!42713)

(declare-datatypes ((ValueCell!13385 0))(
  ( (ValueCellFull!13385 (v!16780 V!42713)) (EmptyCell!13385) )
))
(declare-datatypes ((array!73295 0))(
  ( (array!73296 (arr!35294 (Array (_ BitVec 32) ValueCell!13385)) (size!35831 (_ BitVec 32))) )
))
(declare-fun lt!499384 () array!73295)

(declare-datatypes ((tuple2!17778 0))(
  ( (tuple2!17779 (_1!8900 (_ BitVec 64)) (_2!8900 V!42713)) )
))
(declare-datatypes ((List!24572 0))(
  ( (Nil!24569) (Cons!24568 (h!25786 tuple2!17778) (t!35215 List!24572)) )
))
(declare-datatypes ((ListLongMap!15755 0))(
  ( (ListLongMap!15756 (toList!7893 List!24572)) )
))
(declare-fun call!47326 () ListLongMap!15755)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42713)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!47323 () Bool)

(declare-datatypes ((array!73297 0))(
  ( (array!73298 (arr!35295 (Array (_ BitVec 32) (_ BitVec 64))) (size!35832 (_ BitVec 32))) )
))
(declare-fun lt!499387 () array!73297)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4421 (array!73297 array!73295 (_ BitVec 32) (_ BitVec 32) V!42713 V!42713 (_ BitVec 32) Int) ListLongMap!15755)

(assert (=> bm!47323 (= call!47326 (getCurrentListMapNoExtraKeys!4421 lt!499387 lt!499384 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124181 () Bool)

(declare-fun res!750692 () Bool)

(declare-fun e!640120 () Bool)

(assert (=> b!1124181 (=> (not res!750692) (not e!640120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1124181 (= res!750692 (validMask!0 mask!1564))))

(declare-fun b!1124182 () Bool)

(declare-fun e!640119 () Bool)

(declare-fun e!640114 () Bool)

(assert (=> b!1124182 (= e!640119 (not e!640114))))

(declare-fun res!750686 () Bool)

(assert (=> b!1124182 (=> res!750686 e!640114)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1124182 (= res!750686 (bvsgt from!1455 i!673))))

(declare-fun _keys!1208 () array!73297)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1124182 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36817 0))(
  ( (Unit!36818) )
))
(declare-fun lt!499386 () Unit!36817)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73297 (_ BitVec 64) (_ BitVec 32)) Unit!36817)

(assert (=> b!1124182 (= lt!499386 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1124183 () Bool)

(declare-fun res!750687 () Bool)

(assert (=> b!1124183 (=> (not res!750687) (not e!640120))))

(declare-datatypes ((List!24573 0))(
  ( (Nil!24570) (Cons!24569 (h!25787 (_ BitVec 64)) (t!35216 List!24573)) )
))
(declare-fun arrayNoDuplicates!0 (array!73297 (_ BitVec 32) List!24573) Bool)

(assert (=> b!1124183 (= res!750687 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24570))))

(declare-fun b!1124184 () Bool)

(declare-fun res!750685 () Bool)

(assert (=> b!1124184 (=> (not res!750685) (not e!640120))))

(assert (=> b!1124184 (= res!750685 (= (select (arr!35295 _keys!1208) i!673) k0!934))))

(declare-fun b!1124185 () Bool)

(declare-fun e!640118 () Bool)

(assert (=> b!1124185 (= e!640118 true)))

(declare-fun _values!996 () array!73295)

(declare-fun lt!499388 () Bool)

(declare-fun contains!6453 (ListLongMap!15755 (_ BitVec 64)) Bool)

(assert (=> b!1124185 (= lt!499388 (contains!6453 (getCurrentListMapNoExtraKeys!4421 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1124186 () Bool)

(declare-fun e!640121 () Bool)

(assert (=> b!1124186 (= e!640114 e!640121)))

(declare-fun res!750697 () Bool)

(assert (=> b!1124186 (=> res!750697 e!640121)))

(assert (=> b!1124186 (= res!750697 (not (= from!1455 i!673)))))

(declare-fun lt!499390 () ListLongMap!15755)

(assert (=> b!1124186 (= lt!499390 (getCurrentListMapNoExtraKeys!4421 lt!499387 lt!499384 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2504 (Int (_ BitVec 64)) V!42713)

(assert (=> b!1124186 (= lt!499384 (array!73296 (store (arr!35294 _values!996) i!673 (ValueCellFull!13385 (dynLambda!2504 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35831 _values!996)))))

(declare-fun lt!499385 () ListLongMap!15755)

(assert (=> b!1124186 (= lt!499385 (getCurrentListMapNoExtraKeys!4421 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1124187 () Bool)

(declare-fun res!750694 () Bool)

(assert (=> b!1124187 (=> (not res!750694) (not e!640119))))

(assert (=> b!1124187 (= res!750694 (arrayNoDuplicates!0 lt!499387 #b00000000000000000000000000000000 Nil!24570))))

(declare-fun b!1124188 () Bool)

(declare-fun e!640116 () Bool)

(declare-fun e!640115 () Bool)

(declare-fun mapRes!44101 () Bool)

(assert (=> b!1124188 (= e!640116 (and e!640115 mapRes!44101))))

(declare-fun condMapEmpty!44101 () Bool)

(declare-fun mapDefault!44101 () ValueCell!13385)

(assert (=> b!1124188 (= condMapEmpty!44101 (= (arr!35294 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13385)) mapDefault!44101)))))

(declare-fun b!1124189 () Bool)

(declare-fun res!750695 () Bool)

(assert (=> b!1124189 (=> (not res!750695) (not e!640120))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1124189 (= res!750695 (validKeyInArray!0 k0!934))))

(declare-fun call!47327 () ListLongMap!15755)

(declare-fun e!640113 () Bool)

(declare-fun b!1124190 () Bool)

(declare-fun -!1087 (ListLongMap!15755 (_ BitVec 64)) ListLongMap!15755)

(assert (=> b!1124190 (= e!640113 (= call!47326 (-!1087 call!47327 k0!934)))))

(declare-fun b!1124191 () Bool)

(assert (=> b!1124191 (= e!640113 (= call!47326 call!47327))))

(declare-fun mapNonEmpty!44101 () Bool)

(declare-fun tp!83680 () Bool)

(declare-fun e!640122 () Bool)

(assert (=> mapNonEmpty!44101 (= mapRes!44101 (and tp!83680 e!640122))))

(declare-fun mapKey!44101 () (_ BitVec 32))

(declare-fun mapValue!44101 () ValueCell!13385)

(declare-fun mapRest!44101 () (Array (_ BitVec 32) ValueCell!13385))

(assert (=> mapNonEmpty!44101 (= (arr!35294 _values!996) (store mapRest!44101 mapKey!44101 mapValue!44101))))

(declare-fun bm!47324 () Bool)

(assert (=> bm!47324 (= call!47327 (getCurrentListMapNoExtraKeys!4421 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124192 () Bool)

(declare-fun tp_is_empty!28189 () Bool)

(assert (=> b!1124192 (= e!640122 tp_is_empty!28189)))

(declare-fun b!1124193 () Bool)

(declare-fun res!750689 () Bool)

(assert (=> b!1124193 (=> (not res!750689) (not e!640120))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73297 (_ BitVec 32)) Bool)

(assert (=> b!1124193 (= res!750689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!44101 () Bool)

(assert (=> mapIsEmpty!44101 mapRes!44101))

(declare-fun res!750688 () Bool)

(assert (=> start!98194 (=> (not res!750688) (not e!640120))))

(assert (=> start!98194 (= res!750688 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35832 _keys!1208))))))

(assert (=> start!98194 e!640120))

(assert (=> start!98194 tp_is_empty!28189))

(declare-fun array_inv!27164 (array!73297) Bool)

(assert (=> start!98194 (array_inv!27164 _keys!1208)))

(assert (=> start!98194 true))

(assert (=> start!98194 tp!83681))

(declare-fun array_inv!27165 (array!73295) Bool)

(assert (=> start!98194 (and (array_inv!27165 _values!996) e!640116)))

(declare-fun b!1124180 () Bool)

(assert (=> b!1124180 (= e!640121 e!640118)))

(declare-fun res!750691 () Bool)

(assert (=> b!1124180 (=> res!750691 e!640118)))

(assert (=> b!1124180 (= res!750691 (not (= (select (arr!35295 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1124180 e!640113))

(declare-fun c!109889 () Bool)

(assert (=> b!1124180 (= c!109889 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499389 () Unit!36817)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!350 (array!73297 array!73295 (_ BitVec 32) (_ BitVec 32) V!42713 V!42713 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36817)

(assert (=> b!1124180 (= lt!499389 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!350 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124194 () Bool)

(assert (=> b!1124194 (= e!640115 tp_is_empty!28189)))

(declare-fun b!1124195 () Bool)

(declare-fun res!750696 () Bool)

(assert (=> b!1124195 (=> (not res!750696) (not e!640120))))

(assert (=> b!1124195 (= res!750696 (and (= (size!35831 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35832 _keys!1208) (size!35831 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1124196 () Bool)

(declare-fun res!750690 () Bool)

(assert (=> b!1124196 (=> (not res!750690) (not e!640120))))

(assert (=> b!1124196 (= res!750690 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35832 _keys!1208))))))

(declare-fun b!1124197 () Bool)

(assert (=> b!1124197 (= e!640120 e!640119)))

(declare-fun res!750693 () Bool)

(assert (=> b!1124197 (=> (not res!750693) (not e!640119))))

(assert (=> b!1124197 (= res!750693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499387 mask!1564))))

(assert (=> b!1124197 (= lt!499387 (array!73298 (store (arr!35295 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35832 _keys!1208)))))

(assert (= (and start!98194 res!750688) b!1124181))

(assert (= (and b!1124181 res!750692) b!1124195))

(assert (= (and b!1124195 res!750696) b!1124193))

(assert (= (and b!1124193 res!750689) b!1124183))

(assert (= (and b!1124183 res!750687) b!1124196))

(assert (= (and b!1124196 res!750690) b!1124189))

(assert (= (and b!1124189 res!750695) b!1124184))

(assert (= (and b!1124184 res!750685) b!1124197))

(assert (= (and b!1124197 res!750693) b!1124187))

(assert (= (and b!1124187 res!750694) b!1124182))

(assert (= (and b!1124182 (not res!750686)) b!1124186))

(assert (= (and b!1124186 (not res!750697)) b!1124180))

(assert (= (and b!1124180 c!109889) b!1124190))

(assert (= (and b!1124180 (not c!109889)) b!1124191))

(assert (= (or b!1124190 b!1124191) bm!47323))

(assert (= (or b!1124190 b!1124191) bm!47324))

(assert (= (and b!1124180 (not res!750691)) b!1124185))

(assert (= (and b!1124188 condMapEmpty!44101) mapIsEmpty!44101))

(assert (= (and b!1124188 (not condMapEmpty!44101)) mapNonEmpty!44101))

(get-info :version)

(assert (= (and mapNonEmpty!44101 ((_ is ValueCellFull!13385) mapValue!44101)) b!1124192))

(assert (= (and b!1124188 ((_ is ValueCellFull!13385) mapDefault!44101)) b!1124194))

(assert (= start!98194 b!1124188))

(declare-fun b_lambda!18639 () Bool)

(assert (=> (not b_lambda!18639) (not b!1124186)))

(declare-fun t!35214 () Bool)

(declare-fun tb!8463 () Bool)

(assert (=> (and start!98194 (= defaultEntry!1004 defaultEntry!1004) t!35214) tb!8463))

(declare-fun result!17495 () Bool)

(assert (=> tb!8463 (= result!17495 tp_is_empty!28189)))

(assert (=> b!1124186 t!35214))

(declare-fun b_and!38113 () Bool)

(assert (= b_and!38111 (and (=> t!35214 result!17495) b_and!38113)))

(declare-fun m!1039103 () Bool)

(assert (=> b!1124183 m!1039103))

(declare-fun m!1039105 () Bool)

(assert (=> b!1124184 m!1039105))

(declare-fun m!1039107 () Bool)

(assert (=> b!1124185 m!1039107))

(assert (=> b!1124185 m!1039107))

(declare-fun m!1039109 () Bool)

(assert (=> b!1124185 m!1039109))

(declare-fun m!1039111 () Bool)

(assert (=> mapNonEmpty!44101 m!1039111))

(declare-fun m!1039113 () Bool)

(assert (=> b!1124190 m!1039113))

(declare-fun m!1039115 () Bool)

(assert (=> b!1124193 m!1039115))

(declare-fun m!1039117 () Bool)

(assert (=> start!98194 m!1039117))

(declare-fun m!1039119 () Bool)

(assert (=> start!98194 m!1039119))

(declare-fun m!1039121 () Bool)

(assert (=> b!1124182 m!1039121))

(declare-fun m!1039123 () Bool)

(assert (=> b!1124182 m!1039123))

(declare-fun m!1039125 () Bool)

(assert (=> bm!47323 m!1039125))

(declare-fun m!1039127 () Bool)

(assert (=> b!1124189 m!1039127))

(declare-fun m!1039129 () Bool)

(assert (=> b!1124186 m!1039129))

(declare-fun m!1039131 () Bool)

(assert (=> b!1124186 m!1039131))

(declare-fun m!1039133 () Bool)

(assert (=> b!1124186 m!1039133))

(declare-fun m!1039135 () Bool)

(assert (=> b!1124186 m!1039135))

(assert (=> bm!47324 m!1039107))

(declare-fun m!1039137 () Bool)

(assert (=> b!1124187 m!1039137))

(declare-fun m!1039139 () Bool)

(assert (=> b!1124197 m!1039139))

(declare-fun m!1039141 () Bool)

(assert (=> b!1124197 m!1039141))

(declare-fun m!1039143 () Bool)

(assert (=> b!1124181 m!1039143))

(declare-fun m!1039145 () Bool)

(assert (=> b!1124180 m!1039145))

(declare-fun m!1039147 () Bool)

(assert (=> b!1124180 m!1039147))

(check-sat (not b!1124183) (not b_next!23659) (not b_lambda!18639) (not bm!47323) (not mapNonEmpty!44101) (not b!1124190) (not start!98194) (not b!1124187) (not b!1124180) (not b!1124186) (not b!1124182) (not b!1124189) (not b!1124197) tp_is_empty!28189 (not b!1124193) (not b!1124185) (not b!1124181) (not bm!47324) b_and!38113)
(check-sat b_and!38113 (not b_next!23659))
