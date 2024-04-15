; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97874 () Bool)

(assert start!97874)

(declare-fun b_free!23581 () Bool)

(declare-fun b_next!23581 () Bool)

(assert (=> start!97874 (= b_free!23581 (not b_next!23581))))

(declare-fun tp!83447 () Bool)

(declare-fun b_and!37923 () Bool)

(assert (=> start!97874 (= tp!83447 b_and!37923)))

(declare-fun b!1120610 () Bool)

(declare-fun e!638083 () Bool)

(declare-fun tp_is_empty!28111 () Bool)

(assert (=> b!1120610 (= e!638083 tp_is_empty!28111)))

(declare-fun b!1120611 () Bool)

(declare-fun e!638078 () Bool)

(declare-fun e!638085 () Bool)

(assert (=> b!1120611 (= e!638078 (not e!638085))))

(declare-fun res!748651 () Bool)

(assert (=> b!1120611 (=> res!748651 e!638085)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1120611 (= res!748651 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!73016 0))(
  ( (array!73017 (arr!35161 (Array (_ BitVec 32) (_ BitVec 64))) (size!35699 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73016)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73016 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1120611 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36599 0))(
  ( (Unit!36600) )
))
(declare-fun lt!497923 () Unit!36599)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73016 (_ BitVec 64) (_ BitVec 32)) Unit!36599)

(assert (=> b!1120611 (= lt!497923 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1120612 () Bool)

(declare-fun e!638080 () Bool)

(assert (=> b!1120612 (= e!638080 e!638078)))

(declare-fun res!748646 () Bool)

(assert (=> b!1120612 (=> (not res!748646) (not e!638078))))

(declare-fun lt!497925 () array!73016)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73016 (_ BitVec 32)) Bool)

(assert (=> b!1120612 (= res!748646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497925 mask!1564))))

(assert (=> b!1120612 (= lt!497925 (array!73017 (store (arr!35161 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35699 _keys!1208)))))

(declare-fun res!748654 () Bool)

(assert (=> start!97874 (=> (not res!748654) (not e!638080))))

(assert (=> start!97874 (= res!748654 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35699 _keys!1208))))))

(assert (=> start!97874 e!638080))

(assert (=> start!97874 tp_is_empty!28111))

(declare-fun array_inv!27078 (array!73016) Bool)

(assert (=> start!97874 (array_inv!27078 _keys!1208)))

(assert (=> start!97874 true))

(assert (=> start!97874 tp!83447))

(declare-datatypes ((V!42609 0))(
  ( (V!42610 (val!14112 Int)) )
))
(declare-datatypes ((ValueCell!13346 0))(
  ( (ValueCellFull!13346 (v!16744 V!42609)) (EmptyCell!13346) )
))
(declare-datatypes ((array!73018 0))(
  ( (array!73019 (arr!35162 (Array (_ BitVec 32) ValueCell!13346)) (size!35700 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73018)

(declare-fun e!638082 () Bool)

(declare-fun array_inv!27079 (array!73018) Bool)

(assert (=> start!97874 (and (array_inv!27079 _values!996) e!638082)))

(declare-datatypes ((tuple2!17774 0))(
  ( (tuple2!17775 (_1!8898 (_ BitVec 64)) (_2!8898 V!42609)) )
))
(declare-datatypes ((List!24547 0))(
  ( (Nil!24544) (Cons!24543 (h!25752 tuple2!17774) (t!35111 List!24547)) )
))
(declare-datatypes ((ListLongMap!15743 0))(
  ( (ListLongMap!15744 (toList!7887 List!24547)) )
))
(declare-fun call!47002 () ListLongMap!15743)

(declare-fun call!47003 () ListLongMap!15743)

(declare-fun b!1120613 () Bool)

(declare-fun e!638084 () Bool)

(declare-fun -!1043 (ListLongMap!15743 (_ BitVec 64)) ListLongMap!15743)

(assert (=> b!1120613 (= e!638084 (= call!47002 (-!1043 call!47003 k0!934)))))

(declare-fun zeroValue!944 () V!42609)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!497920 () array!73018)

(declare-fun minValue!944 () V!42609)

(declare-fun bm!46999 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4396 (array!73016 array!73018 (_ BitVec 32) (_ BitVec 32) V!42609 V!42609 (_ BitVec 32) Int) ListLongMap!15743)

(assert (=> bm!46999 (= call!47002 (getCurrentListMapNoExtraKeys!4396 lt!497925 lt!497920 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!43984 () Bool)

(declare-fun mapRes!43984 () Bool)

(assert (=> mapIsEmpty!43984 mapRes!43984))

(declare-fun bm!47000 () Bool)

(assert (=> bm!47000 (= call!47003 (getCurrentListMapNoExtraKeys!4396 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1120614 () Bool)

(assert (=> b!1120614 (= e!638084 (= call!47002 call!47003))))

(declare-fun b!1120615 () Bool)

(declare-fun res!748649 () Bool)

(assert (=> b!1120615 (=> (not res!748649) (not e!638080))))

(assert (=> b!1120615 (= res!748649 (and (= (size!35700 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35699 _keys!1208) (size!35700 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1120616 () Bool)

(declare-fun res!748653 () Bool)

(assert (=> b!1120616 (=> (not res!748653) (not e!638080))))

(assert (=> b!1120616 (= res!748653 (= (select (arr!35161 _keys!1208) i!673) k0!934))))

(declare-fun b!1120617 () Bool)

(declare-fun res!748643 () Bool)

(assert (=> b!1120617 (=> (not res!748643) (not e!638080))))

(declare-datatypes ((List!24548 0))(
  ( (Nil!24545) (Cons!24544 (h!25753 (_ BitVec 64)) (t!35112 List!24548)) )
))
(declare-fun arrayNoDuplicates!0 (array!73016 (_ BitVec 32) List!24548) Bool)

(assert (=> b!1120617 (= res!748643 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24545))))

(declare-fun b!1120618 () Bool)

(declare-fun res!748644 () Bool)

(assert (=> b!1120618 (=> (not res!748644) (not e!638078))))

(assert (=> b!1120618 (= res!748644 (arrayNoDuplicates!0 lt!497925 #b00000000000000000000000000000000 Nil!24545))))

(declare-fun mapNonEmpty!43984 () Bool)

(declare-fun tp!83446 () Bool)

(assert (=> mapNonEmpty!43984 (= mapRes!43984 (and tp!83446 e!638083))))

(declare-fun mapRest!43984 () (Array (_ BitVec 32) ValueCell!13346))

(declare-fun mapValue!43984 () ValueCell!13346)

(declare-fun mapKey!43984 () (_ BitVec 32))

(assert (=> mapNonEmpty!43984 (= (arr!35162 _values!996) (store mapRest!43984 mapKey!43984 mapValue!43984))))

(declare-fun b!1120619 () Bool)

(declare-fun e!638081 () Bool)

(assert (=> b!1120619 (= e!638081 tp_is_empty!28111)))

(declare-fun b!1120620 () Bool)

(declare-fun res!748647 () Bool)

(assert (=> b!1120620 (=> (not res!748647) (not e!638080))))

(assert (=> b!1120620 (= res!748647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1120621 () Bool)

(declare-fun res!748652 () Bool)

(assert (=> b!1120621 (=> (not res!748652) (not e!638080))))

(assert (=> b!1120621 (= res!748652 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35699 _keys!1208))))))

(declare-fun b!1120622 () Bool)

(declare-fun e!638079 () Bool)

(assert (=> b!1120622 (= e!638079 true)))

(assert (=> b!1120622 e!638084))

(declare-fun c!109335 () Bool)

(assert (=> b!1120622 (= c!109335 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!497924 () Unit!36599)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!318 (array!73016 array!73018 (_ BitVec 32) (_ BitVec 32) V!42609 V!42609 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36599)

(assert (=> b!1120622 (= lt!497924 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!318 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1120623 () Bool)

(declare-fun res!748648 () Bool)

(assert (=> b!1120623 (=> (not res!748648) (not e!638080))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1120623 (= res!748648 (validKeyInArray!0 k0!934))))

(declare-fun b!1120624 () Bool)

(assert (=> b!1120624 (= e!638082 (and e!638081 mapRes!43984))))

(declare-fun condMapEmpty!43984 () Bool)

(declare-fun mapDefault!43984 () ValueCell!13346)

(assert (=> b!1120624 (= condMapEmpty!43984 (= (arr!35162 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13346)) mapDefault!43984)))))

(declare-fun b!1120625 () Bool)

(assert (=> b!1120625 (= e!638085 e!638079)))

(declare-fun res!748645 () Bool)

(assert (=> b!1120625 (=> res!748645 e!638079)))

(assert (=> b!1120625 (= res!748645 (not (= from!1455 i!673)))))

(declare-fun lt!497921 () ListLongMap!15743)

(assert (=> b!1120625 (= lt!497921 (getCurrentListMapNoExtraKeys!4396 lt!497925 lt!497920 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2438 (Int (_ BitVec 64)) V!42609)

(assert (=> b!1120625 (= lt!497920 (array!73019 (store (arr!35162 _values!996) i!673 (ValueCellFull!13346 (dynLambda!2438 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35700 _values!996)))))

(declare-fun lt!497922 () ListLongMap!15743)

(assert (=> b!1120625 (= lt!497922 (getCurrentListMapNoExtraKeys!4396 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1120626 () Bool)

(declare-fun res!748650 () Bool)

(assert (=> b!1120626 (=> (not res!748650) (not e!638080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1120626 (= res!748650 (validMask!0 mask!1564))))

(assert (= (and start!97874 res!748654) b!1120626))

(assert (= (and b!1120626 res!748650) b!1120615))

(assert (= (and b!1120615 res!748649) b!1120620))

(assert (= (and b!1120620 res!748647) b!1120617))

(assert (= (and b!1120617 res!748643) b!1120621))

(assert (= (and b!1120621 res!748652) b!1120623))

(assert (= (and b!1120623 res!748648) b!1120616))

(assert (= (and b!1120616 res!748653) b!1120612))

(assert (= (and b!1120612 res!748646) b!1120618))

(assert (= (and b!1120618 res!748644) b!1120611))

(assert (= (and b!1120611 (not res!748651)) b!1120625))

(assert (= (and b!1120625 (not res!748645)) b!1120622))

(assert (= (and b!1120622 c!109335) b!1120613))

(assert (= (and b!1120622 (not c!109335)) b!1120614))

(assert (= (or b!1120613 b!1120614) bm!46999))

(assert (= (or b!1120613 b!1120614) bm!47000))

(assert (= (and b!1120624 condMapEmpty!43984) mapIsEmpty!43984))

(assert (= (and b!1120624 (not condMapEmpty!43984)) mapNonEmpty!43984))

(get-info :version)

(assert (= (and mapNonEmpty!43984 ((_ is ValueCellFull!13346) mapValue!43984)) b!1120610))

(assert (= (and b!1120624 ((_ is ValueCellFull!13346) mapDefault!43984)) b!1120619))

(assert (= start!97874 b!1120624))

(declare-fun b_lambda!18533 () Bool)

(assert (=> (not b_lambda!18533) (not b!1120625)))

(declare-fun t!35110 () Bool)

(declare-fun tb!8385 () Bool)

(assert (=> (and start!97874 (= defaultEntry!1004 defaultEntry!1004) t!35110) tb!8385))

(declare-fun result!17339 () Bool)

(assert (=> tb!8385 (= result!17339 tp_is_empty!28111)))

(assert (=> b!1120625 t!35110))

(declare-fun b_and!37925 () Bool)

(assert (= b_and!37923 (and (=> t!35110 result!17339) b_and!37925)))

(declare-fun m!1035099 () Bool)

(assert (=> start!97874 m!1035099))

(declare-fun m!1035101 () Bool)

(assert (=> start!97874 m!1035101))

(declare-fun m!1035103 () Bool)

(assert (=> b!1120613 m!1035103))

(declare-fun m!1035105 () Bool)

(assert (=> b!1120611 m!1035105))

(declare-fun m!1035107 () Bool)

(assert (=> b!1120611 m!1035107))

(declare-fun m!1035109 () Bool)

(assert (=> b!1120620 m!1035109))

(declare-fun m!1035111 () Bool)

(assert (=> b!1120612 m!1035111))

(declare-fun m!1035113 () Bool)

(assert (=> b!1120612 m!1035113))

(declare-fun m!1035115 () Bool)

(assert (=> b!1120618 m!1035115))

(declare-fun m!1035117 () Bool)

(assert (=> mapNonEmpty!43984 m!1035117))

(declare-fun m!1035119 () Bool)

(assert (=> b!1120625 m!1035119))

(declare-fun m!1035121 () Bool)

(assert (=> b!1120625 m!1035121))

(declare-fun m!1035123 () Bool)

(assert (=> b!1120625 m!1035123))

(declare-fun m!1035125 () Bool)

(assert (=> b!1120625 m!1035125))

(declare-fun m!1035127 () Bool)

(assert (=> b!1120623 m!1035127))

(declare-fun m!1035129 () Bool)

(assert (=> b!1120616 m!1035129))

(declare-fun m!1035131 () Bool)

(assert (=> b!1120626 m!1035131))

(declare-fun m!1035133 () Bool)

(assert (=> b!1120617 m!1035133))

(declare-fun m!1035135 () Bool)

(assert (=> bm!47000 m!1035135))

(declare-fun m!1035137 () Bool)

(assert (=> b!1120622 m!1035137))

(declare-fun m!1035139 () Bool)

(assert (=> bm!46999 m!1035139))

(check-sat (not b!1120613) (not bm!46999) (not b!1120623) (not start!97874) (not bm!47000) (not b!1120625) (not b!1120618) (not b!1120617) (not b!1120626) (not b!1120612) b_and!37925 (not b!1120620) (not mapNonEmpty!43984) (not b_lambda!18533) tp_is_empty!28111 (not b_next!23581) (not b!1120622) (not b!1120611))
(check-sat b_and!37925 (not b_next!23581))
