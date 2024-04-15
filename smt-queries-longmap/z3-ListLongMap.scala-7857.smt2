; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97880 () Bool)

(assert start!97880)

(declare-fun b_free!23587 () Bool)

(declare-fun b_next!23587 () Bool)

(assert (=> start!97880 (= b_free!23587 (not b_next!23587))))

(declare-fun tp!83465 () Bool)

(declare-fun b_and!37935 () Bool)

(assert (=> start!97880 (= tp!83465 b_and!37935)))

(declare-fun b!1120769 () Bool)

(declare-fun res!748752 () Bool)

(declare-fun e!638164 () Bool)

(assert (=> b!1120769 (=> (not res!748752) (not e!638164))))

(declare-datatypes ((array!73028 0))(
  ( (array!73029 (arr!35167 (Array (_ BitVec 32) (_ BitVec 64))) (size!35705 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73028)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1120769 (= res!748752 (= (select (arr!35167 _keys!1208) i!673) k0!934))))

(declare-datatypes ((V!42617 0))(
  ( (V!42618 (val!14115 Int)) )
))
(declare-fun zeroValue!944 () V!42617)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17778 0))(
  ( (tuple2!17779 (_1!8900 (_ BitVec 64)) (_2!8900 V!42617)) )
))
(declare-datatypes ((List!24552 0))(
  ( (Nil!24549) (Cons!24548 (h!25757 tuple2!17778) (t!35122 List!24552)) )
))
(declare-datatypes ((ListLongMap!15747 0))(
  ( (ListLongMap!15748 (toList!7889 List!24552)) )
))
(declare-fun call!47021 () ListLongMap!15747)

(declare-fun minValue!944 () V!42617)

(declare-fun bm!47017 () Bool)

(declare-datatypes ((ValueCell!13349 0))(
  ( (ValueCellFull!13349 (v!16747 V!42617)) (EmptyCell!13349) )
))
(declare-datatypes ((array!73030 0))(
  ( (array!73031 (arr!35168 (Array (_ BitVec 32) ValueCell!13349)) (size!35706 (_ BitVec 32))) )
))
(declare-fun lt!497977 () array!73030)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!497976 () array!73028)

(declare-fun getCurrentListMapNoExtraKeys!4397 (array!73028 array!73030 (_ BitVec 32) (_ BitVec 32) V!42617 V!42617 (_ BitVec 32) Int) ListLongMap!15747)

(assert (=> bm!47017 (= call!47021 (getCurrentListMapNoExtraKeys!4397 lt!497976 lt!497977 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1120770 () Bool)

(declare-fun res!748762 () Bool)

(assert (=> b!1120770 (=> (not res!748762) (not e!638164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73028 (_ BitVec 32)) Bool)

(assert (=> b!1120770 (= res!748762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1120771 () Bool)

(declare-fun e!638165 () Bool)

(declare-fun call!47020 () ListLongMap!15747)

(assert (=> b!1120771 (= e!638165 (= call!47021 call!47020))))

(declare-fun res!748751 () Bool)

(assert (=> start!97880 (=> (not res!748751) (not e!638164))))

(assert (=> start!97880 (= res!748751 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35705 _keys!1208))))))

(assert (=> start!97880 e!638164))

(declare-fun tp_is_empty!28117 () Bool)

(assert (=> start!97880 tp_is_empty!28117))

(declare-fun array_inv!27082 (array!73028) Bool)

(assert (=> start!97880 (array_inv!27082 _keys!1208)))

(assert (=> start!97880 true))

(assert (=> start!97880 tp!83465))

(declare-fun _values!996 () array!73030)

(declare-fun e!638166 () Bool)

(declare-fun array_inv!27083 (array!73030) Bool)

(assert (=> start!97880 (and (array_inv!27083 _values!996) e!638166)))

(declare-fun b!1120772 () Bool)

(declare-fun -!1044 (ListLongMap!15747 (_ BitVec 64)) ListLongMap!15747)

(assert (=> b!1120772 (= e!638165 (= call!47021 (-!1044 call!47020 k0!934)))))

(declare-fun mapIsEmpty!43993 () Bool)

(declare-fun mapRes!43993 () Bool)

(assert (=> mapIsEmpty!43993 mapRes!43993))

(declare-fun bm!47018 () Bool)

(assert (=> bm!47018 (= call!47020 (getCurrentListMapNoExtraKeys!4397 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1120773 () Bool)

(declare-fun res!748757 () Bool)

(declare-fun e!638161 () Bool)

(assert (=> b!1120773 (=> (not res!748757) (not e!638161))))

(declare-datatypes ((List!24553 0))(
  ( (Nil!24550) (Cons!24549 (h!25758 (_ BitVec 64)) (t!35123 List!24553)) )
))
(declare-fun arrayNoDuplicates!0 (array!73028 (_ BitVec 32) List!24553) Bool)

(assert (=> b!1120773 (= res!748757 (arrayNoDuplicates!0 lt!497976 #b00000000000000000000000000000000 Nil!24550))))

(declare-fun b!1120774 () Bool)

(declare-fun res!748756 () Bool)

(assert (=> b!1120774 (=> (not res!748756) (not e!638164))))

(assert (=> b!1120774 (= res!748756 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35705 _keys!1208))))))

(declare-fun b!1120775 () Bool)

(declare-fun e!638158 () Bool)

(assert (=> b!1120775 (= e!638158 true)))

(assert (=> b!1120775 e!638165))

(declare-fun c!109344 () Bool)

(assert (=> b!1120775 (= c!109344 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36605 0))(
  ( (Unit!36606) )
))
(declare-fun lt!497975 () Unit!36605)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!320 (array!73028 array!73030 (_ BitVec 32) (_ BitVec 32) V!42617 V!42617 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36605)

(assert (=> b!1120775 (= lt!497975 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!320 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1120776 () Bool)

(declare-fun res!748753 () Bool)

(assert (=> b!1120776 (=> (not res!748753) (not e!638164))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1120776 (= res!748753 (validMask!0 mask!1564))))

(declare-fun b!1120777 () Bool)

(declare-fun res!748754 () Bool)

(assert (=> b!1120777 (=> (not res!748754) (not e!638164))))

(assert (=> b!1120777 (= res!748754 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24550))))

(declare-fun b!1120778 () Bool)

(declare-fun e!638160 () Bool)

(assert (=> b!1120778 (= e!638161 (not e!638160))))

(declare-fun res!748761 () Bool)

(assert (=> b!1120778 (=> res!748761 e!638160)))

(assert (=> b!1120778 (= res!748761 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73028 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1120778 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!497979 () Unit!36605)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73028 (_ BitVec 64) (_ BitVec 32)) Unit!36605)

(assert (=> b!1120778 (= lt!497979 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1120779 () Bool)

(declare-fun res!748758 () Bool)

(assert (=> b!1120779 (=> (not res!748758) (not e!638164))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1120779 (= res!748758 (validKeyInArray!0 k0!934))))

(declare-fun b!1120780 () Bool)

(declare-fun e!638159 () Bool)

(assert (=> b!1120780 (= e!638166 (and e!638159 mapRes!43993))))

(declare-fun condMapEmpty!43993 () Bool)

(declare-fun mapDefault!43993 () ValueCell!13349)

(assert (=> b!1120780 (= condMapEmpty!43993 (= (arr!35168 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13349)) mapDefault!43993)))))

(declare-fun b!1120781 () Bool)

(declare-fun e!638163 () Bool)

(assert (=> b!1120781 (= e!638163 tp_is_empty!28117)))

(declare-fun b!1120782 () Bool)

(assert (=> b!1120782 (= e!638164 e!638161)))

(declare-fun res!748760 () Bool)

(assert (=> b!1120782 (=> (not res!748760) (not e!638161))))

(assert (=> b!1120782 (= res!748760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497976 mask!1564))))

(assert (=> b!1120782 (= lt!497976 (array!73029 (store (arr!35167 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35705 _keys!1208)))))

(declare-fun b!1120783 () Bool)

(assert (=> b!1120783 (= e!638160 e!638158)))

(declare-fun res!748759 () Bool)

(assert (=> b!1120783 (=> res!748759 e!638158)))

(assert (=> b!1120783 (= res!748759 (not (= from!1455 i!673)))))

(declare-fun lt!497974 () ListLongMap!15747)

(assert (=> b!1120783 (= lt!497974 (getCurrentListMapNoExtraKeys!4397 lt!497976 lt!497977 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2439 (Int (_ BitVec 64)) V!42617)

(assert (=> b!1120783 (= lt!497977 (array!73031 (store (arr!35168 _values!996) i!673 (ValueCellFull!13349 (dynLambda!2439 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35706 _values!996)))))

(declare-fun lt!497978 () ListLongMap!15747)

(assert (=> b!1120783 (= lt!497978 (getCurrentListMapNoExtraKeys!4397 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!43993 () Bool)

(declare-fun tp!83464 () Bool)

(assert (=> mapNonEmpty!43993 (= mapRes!43993 (and tp!83464 e!638163))))

(declare-fun mapKey!43993 () (_ BitVec 32))

(declare-fun mapValue!43993 () ValueCell!13349)

(declare-fun mapRest!43993 () (Array (_ BitVec 32) ValueCell!13349))

(assert (=> mapNonEmpty!43993 (= (arr!35168 _values!996) (store mapRest!43993 mapKey!43993 mapValue!43993))))

(declare-fun b!1120784 () Bool)

(assert (=> b!1120784 (= e!638159 tp_is_empty!28117)))

(declare-fun b!1120785 () Bool)

(declare-fun res!748755 () Bool)

(assert (=> b!1120785 (=> (not res!748755) (not e!638164))))

(assert (=> b!1120785 (= res!748755 (and (= (size!35706 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35705 _keys!1208) (size!35706 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!97880 res!748751) b!1120776))

(assert (= (and b!1120776 res!748753) b!1120785))

(assert (= (and b!1120785 res!748755) b!1120770))

(assert (= (and b!1120770 res!748762) b!1120777))

(assert (= (and b!1120777 res!748754) b!1120774))

(assert (= (and b!1120774 res!748756) b!1120779))

(assert (= (and b!1120779 res!748758) b!1120769))

(assert (= (and b!1120769 res!748752) b!1120782))

(assert (= (and b!1120782 res!748760) b!1120773))

(assert (= (and b!1120773 res!748757) b!1120778))

(assert (= (and b!1120778 (not res!748761)) b!1120783))

(assert (= (and b!1120783 (not res!748759)) b!1120775))

(assert (= (and b!1120775 c!109344) b!1120772))

(assert (= (and b!1120775 (not c!109344)) b!1120771))

(assert (= (or b!1120772 b!1120771) bm!47017))

(assert (= (or b!1120772 b!1120771) bm!47018))

(assert (= (and b!1120780 condMapEmpty!43993) mapIsEmpty!43993))

(assert (= (and b!1120780 (not condMapEmpty!43993)) mapNonEmpty!43993))

(get-info :version)

(assert (= (and mapNonEmpty!43993 ((_ is ValueCellFull!13349) mapValue!43993)) b!1120781))

(assert (= (and b!1120780 ((_ is ValueCellFull!13349) mapDefault!43993)) b!1120784))

(assert (= start!97880 b!1120780))

(declare-fun b_lambda!18539 () Bool)

(assert (=> (not b_lambda!18539) (not b!1120783)))

(declare-fun t!35121 () Bool)

(declare-fun tb!8391 () Bool)

(assert (=> (and start!97880 (= defaultEntry!1004 defaultEntry!1004) t!35121) tb!8391))

(declare-fun result!17351 () Bool)

(assert (=> tb!8391 (= result!17351 tp_is_empty!28117)))

(assert (=> b!1120783 t!35121))

(declare-fun b_and!37937 () Bool)

(assert (= b_and!37935 (and (=> t!35121 result!17351) b_and!37937)))

(declare-fun m!1035225 () Bool)

(assert (=> b!1120778 m!1035225))

(declare-fun m!1035227 () Bool)

(assert (=> b!1120778 m!1035227))

(declare-fun m!1035229 () Bool)

(assert (=> mapNonEmpty!43993 m!1035229))

(declare-fun m!1035231 () Bool)

(assert (=> b!1120783 m!1035231))

(declare-fun m!1035233 () Bool)

(assert (=> b!1120783 m!1035233))

(declare-fun m!1035235 () Bool)

(assert (=> b!1120783 m!1035235))

(declare-fun m!1035237 () Bool)

(assert (=> b!1120783 m!1035237))

(declare-fun m!1035239 () Bool)

(assert (=> bm!47018 m!1035239))

(declare-fun m!1035241 () Bool)

(assert (=> b!1120775 m!1035241))

(declare-fun m!1035243 () Bool)

(assert (=> b!1120769 m!1035243))

(declare-fun m!1035245 () Bool)

(assert (=> b!1120776 m!1035245))

(declare-fun m!1035247 () Bool)

(assert (=> b!1120782 m!1035247))

(declare-fun m!1035249 () Bool)

(assert (=> b!1120782 m!1035249))

(declare-fun m!1035251 () Bool)

(assert (=> bm!47017 m!1035251))

(declare-fun m!1035253 () Bool)

(assert (=> start!97880 m!1035253))

(declare-fun m!1035255 () Bool)

(assert (=> start!97880 m!1035255))

(declare-fun m!1035257 () Bool)

(assert (=> b!1120770 m!1035257))

(declare-fun m!1035259 () Bool)

(assert (=> b!1120777 m!1035259))

(declare-fun m!1035261 () Bool)

(assert (=> b!1120779 m!1035261))

(declare-fun m!1035263 () Bool)

(assert (=> b!1120773 m!1035263))

(declare-fun m!1035265 () Bool)

(assert (=> b!1120772 m!1035265))

(check-sat (not b!1120776) (not b!1120775) (not b_lambda!18539) b_and!37937 (not mapNonEmpty!43993) (not bm!47017) (not bm!47018) (not b!1120777) (not b!1120770) tp_is_empty!28117 (not b!1120773) (not start!97880) (not b!1120783) (not b_next!23587) (not b!1120779) (not b!1120778) (not b!1120782) (not b!1120772))
(check-sat b_and!37937 (not b_next!23587))
