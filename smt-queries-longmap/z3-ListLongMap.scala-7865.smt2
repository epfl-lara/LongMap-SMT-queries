; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98170 () Bool)

(assert start!98170)

(declare-fun b_free!23635 () Bool)

(declare-fun b_next!23635 () Bool)

(assert (=> start!98170 (= b_free!23635 (not b_next!23635))))

(declare-fun tp!83609 () Bool)

(declare-fun b_and!38063 () Bool)

(assert (=> start!98170 (= tp!83609 b_and!38063)))

(declare-datatypes ((V!42681 0))(
  ( (V!42682 (val!14139 Int)) )
))
(declare-fun zeroValue!944 () V!42681)

(declare-datatypes ((array!73253 0))(
  ( (array!73254 (arr!35273 (Array (_ BitVec 32) (_ BitVec 64))) (size!35810 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73253)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!17760 0))(
  ( (tuple2!17761 (_1!8891 (_ BitVec 64)) (_2!8891 V!42681)) )
))
(declare-datatypes ((List!24556 0))(
  ( (Nil!24553) (Cons!24552 (h!25770 tuple2!17760) (t!35175 List!24556)) )
))
(declare-datatypes ((ListLongMap!15737 0))(
  ( (ListLongMap!15738 (toList!7884 List!24556)) )
))
(declare-fun call!47254 () ListLongMap!15737)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!47251 () Bool)

(declare-datatypes ((ValueCell!13373 0))(
  ( (ValueCellFull!13373 (v!16768 V!42681)) (EmptyCell!13373) )
))
(declare-datatypes ((array!73255 0))(
  ( (array!73256 (arr!35274 (Array (_ BitVec 32) ValueCell!13373)) (size!35811 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73255)

(declare-fun minValue!944 () V!42681)

(declare-fun getCurrentListMapNoExtraKeys!4413 (array!73253 array!73255 (_ BitVec 32) (_ BitVec 32) V!42681 V!42681 (_ BitVec 32) Int) ListLongMap!15737)

(assert (=> bm!47251 (= call!47254 (getCurrentListMapNoExtraKeys!4413 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123508 () Bool)

(declare-fun res!750221 () Bool)

(declare-fun e!639759 () Bool)

(assert (=> b!1123508 (=> (not res!750221) (not e!639759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1123508 (= res!750221 (validMask!0 mask!1564))))

(declare-fun b!1123509 () Bool)

(declare-fun e!639760 () Bool)

(declare-fun call!47255 () ListLongMap!15737)

(assert (=> b!1123509 (= e!639760 (= call!47255 call!47254))))

(declare-fun b!1123510 () Bool)

(declare-fun e!639753 () Bool)

(assert (=> b!1123510 (= e!639759 e!639753)))

(declare-fun res!750224 () Bool)

(assert (=> b!1123510 (=> (not res!750224) (not e!639753))))

(declare-fun lt!499133 () array!73253)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73253 (_ BitVec 32)) Bool)

(assert (=> b!1123510 (= res!750224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499133 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1123510 (= lt!499133 (array!73254 (store (arr!35273 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35810 _keys!1208)))))

(declare-fun b!1123511 () Bool)

(declare-fun e!639755 () Bool)

(assert (=> b!1123511 (= e!639755 true)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!499132 () Bool)

(declare-fun contains!6447 (ListLongMap!15737 (_ BitVec 64)) Bool)

(assert (=> b!1123511 (= lt!499132 (contains!6447 (getCurrentListMapNoExtraKeys!4413 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1123512 () Bool)

(declare-fun res!750225 () Bool)

(assert (=> b!1123512 (=> (not res!750225) (not e!639759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1123512 (= res!750225 (validKeyInArray!0 k0!934))))

(declare-fun b!1123513 () Bool)

(declare-fun -!1081 (ListLongMap!15737 (_ BitVec 64)) ListLongMap!15737)

(assert (=> b!1123513 (= e!639760 (= call!47255 (-!1081 call!47254 k0!934)))))

(declare-fun b!1123514 () Bool)

(declare-fun res!750229 () Bool)

(assert (=> b!1123514 (=> (not res!750229) (not e!639759))))

(assert (=> b!1123514 (= res!750229 (and (= (size!35811 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35810 _keys!1208) (size!35811 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1123515 () Bool)

(declare-fun res!750219 () Bool)

(assert (=> b!1123515 (=> (not res!750219) (not e!639759))))

(declare-datatypes ((List!24557 0))(
  ( (Nil!24554) (Cons!24553 (h!25771 (_ BitVec 64)) (t!35176 List!24557)) )
))
(declare-fun arrayNoDuplicates!0 (array!73253 (_ BitVec 32) List!24557) Bool)

(assert (=> b!1123515 (= res!750219 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24554))))

(declare-fun b!1123516 () Bool)

(declare-fun res!750223 () Bool)

(assert (=> b!1123516 (=> (not res!750223) (not e!639759))))

(assert (=> b!1123516 (= res!750223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1123517 () Bool)

(declare-fun res!750220 () Bool)

(assert (=> b!1123517 (=> (not res!750220) (not e!639759))))

(assert (=> b!1123517 (= res!750220 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35810 _keys!1208))))))

(declare-fun bm!47252 () Bool)

(declare-fun lt!499135 () array!73255)

(assert (=> bm!47252 (= call!47255 (getCurrentListMapNoExtraKeys!4413 lt!499133 lt!499135 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123519 () Bool)

(declare-fun e!639754 () Bool)

(declare-fun tp_is_empty!28165 () Bool)

(assert (=> b!1123519 (= e!639754 tp_is_empty!28165)))

(declare-fun b!1123520 () Bool)

(declare-fun e!639762 () Bool)

(declare-fun e!639756 () Bool)

(assert (=> b!1123520 (= e!639762 e!639756)))

(declare-fun res!750217 () Bool)

(assert (=> b!1123520 (=> res!750217 e!639756)))

(assert (=> b!1123520 (= res!750217 (not (= from!1455 i!673)))))

(declare-fun lt!499138 () ListLongMap!15737)

(assert (=> b!1123520 (= lt!499138 (getCurrentListMapNoExtraKeys!4413 lt!499133 lt!499135 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2498 (Int (_ BitVec 64)) V!42681)

(assert (=> b!1123520 (= lt!499135 (array!73256 (store (arr!35274 _values!996) i!673 (ValueCellFull!13373 (dynLambda!2498 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35811 _values!996)))))

(declare-fun lt!499134 () ListLongMap!15737)

(assert (=> b!1123520 (= lt!499134 (getCurrentListMapNoExtraKeys!4413 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1123521 () Bool)

(declare-fun e!639757 () Bool)

(assert (=> b!1123521 (= e!639757 tp_is_empty!28165)))

(declare-fun b!1123522 () Bool)

(declare-fun e!639758 () Bool)

(declare-fun mapRes!44065 () Bool)

(assert (=> b!1123522 (= e!639758 (and e!639754 mapRes!44065))))

(declare-fun condMapEmpty!44065 () Bool)

(declare-fun mapDefault!44065 () ValueCell!13373)

(assert (=> b!1123522 (= condMapEmpty!44065 (= (arr!35274 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13373)) mapDefault!44065)))))

(declare-fun b!1123523 () Bool)

(assert (=> b!1123523 (= e!639753 (not e!639762))))

(declare-fun res!750222 () Bool)

(assert (=> b!1123523 (=> res!750222 e!639762)))

(assert (=> b!1123523 (= res!750222 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1123523 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36801 0))(
  ( (Unit!36802) )
))
(declare-fun lt!499137 () Unit!36801)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73253 (_ BitVec 64) (_ BitVec 32)) Unit!36801)

(assert (=> b!1123523 (= lt!499137 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!44065 () Bool)

(declare-fun tp!83608 () Bool)

(assert (=> mapNonEmpty!44065 (= mapRes!44065 (and tp!83608 e!639757))))

(declare-fun mapRest!44065 () (Array (_ BitVec 32) ValueCell!13373))

(declare-fun mapKey!44065 () (_ BitVec 32))

(declare-fun mapValue!44065 () ValueCell!13373)

(assert (=> mapNonEmpty!44065 (= (arr!35274 _values!996) (store mapRest!44065 mapKey!44065 mapValue!44065))))

(declare-fun mapIsEmpty!44065 () Bool)

(assert (=> mapIsEmpty!44065 mapRes!44065))

(declare-fun b!1123524 () Bool)

(declare-fun res!750218 () Bool)

(assert (=> b!1123524 (=> (not res!750218) (not e!639753))))

(assert (=> b!1123524 (= res!750218 (arrayNoDuplicates!0 lt!499133 #b00000000000000000000000000000000 Nil!24554))))

(declare-fun b!1123525 () Bool)

(assert (=> b!1123525 (= e!639756 e!639755)))

(declare-fun res!750226 () Bool)

(assert (=> b!1123525 (=> res!750226 e!639755)))

(assert (=> b!1123525 (= res!750226 (not (= (select (arr!35273 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1123525 e!639760))

(declare-fun c!109853 () Bool)

(assert (=> b!1123525 (= c!109853 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499136 () Unit!36801)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!343 (array!73253 array!73255 (_ BitVec 32) (_ BitVec 32) V!42681 V!42681 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36801)

(assert (=> b!1123525 (= lt!499136 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!343 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123518 () Bool)

(declare-fun res!750228 () Bool)

(assert (=> b!1123518 (=> (not res!750228) (not e!639759))))

(assert (=> b!1123518 (= res!750228 (= (select (arr!35273 _keys!1208) i!673) k0!934))))

(declare-fun res!750227 () Bool)

(assert (=> start!98170 (=> (not res!750227) (not e!639759))))

(assert (=> start!98170 (= res!750227 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35810 _keys!1208))))))

(assert (=> start!98170 e!639759))

(assert (=> start!98170 tp_is_empty!28165))

(declare-fun array_inv!27152 (array!73253) Bool)

(assert (=> start!98170 (array_inv!27152 _keys!1208)))

(assert (=> start!98170 true))

(assert (=> start!98170 tp!83609))

(declare-fun array_inv!27153 (array!73255) Bool)

(assert (=> start!98170 (and (array_inv!27153 _values!996) e!639758)))

(assert (= (and start!98170 res!750227) b!1123508))

(assert (= (and b!1123508 res!750221) b!1123514))

(assert (= (and b!1123514 res!750229) b!1123516))

(assert (= (and b!1123516 res!750223) b!1123515))

(assert (= (and b!1123515 res!750219) b!1123517))

(assert (= (and b!1123517 res!750220) b!1123512))

(assert (= (and b!1123512 res!750225) b!1123518))

(assert (= (and b!1123518 res!750228) b!1123510))

(assert (= (and b!1123510 res!750224) b!1123524))

(assert (= (and b!1123524 res!750218) b!1123523))

(assert (= (and b!1123523 (not res!750222)) b!1123520))

(assert (= (and b!1123520 (not res!750217)) b!1123525))

(assert (= (and b!1123525 c!109853) b!1123513))

(assert (= (and b!1123525 (not c!109853)) b!1123509))

(assert (= (or b!1123513 b!1123509) bm!47251))

(assert (= (or b!1123513 b!1123509) bm!47252))

(assert (= (and b!1123525 (not res!750226)) b!1123511))

(assert (= (and b!1123522 condMapEmpty!44065) mapIsEmpty!44065))

(assert (= (and b!1123522 (not condMapEmpty!44065)) mapNonEmpty!44065))

(get-info :version)

(assert (= (and mapNonEmpty!44065 ((_ is ValueCellFull!13373) mapValue!44065)) b!1123521))

(assert (= (and b!1123522 ((_ is ValueCellFull!13373) mapDefault!44065)) b!1123519))

(assert (= start!98170 b!1123522))

(declare-fun b_lambda!18615 () Bool)

(assert (=> (not b_lambda!18615) (not b!1123520)))

(declare-fun t!35174 () Bool)

(declare-fun tb!8439 () Bool)

(assert (=> (and start!98170 (= defaultEntry!1004 defaultEntry!1004) t!35174) tb!8439))

(declare-fun result!17447 () Bool)

(assert (=> tb!8439 (= result!17447 tp_is_empty!28165)))

(assert (=> b!1123520 t!35174))

(declare-fun b_and!38065 () Bool)

(assert (= b_and!38063 (and (=> t!35174 result!17447) b_and!38065)))

(declare-fun m!1038549 () Bool)

(assert (=> b!1123513 m!1038549))

(declare-fun m!1038551 () Bool)

(assert (=> b!1123512 m!1038551))

(declare-fun m!1038553 () Bool)

(assert (=> bm!47252 m!1038553))

(declare-fun m!1038555 () Bool)

(assert (=> b!1123515 m!1038555))

(declare-fun m!1038557 () Bool)

(assert (=> b!1123518 m!1038557))

(declare-fun m!1038559 () Bool)

(assert (=> bm!47251 m!1038559))

(declare-fun m!1038561 () Bool)

(assert (=> start!98170 m!1038561))

(declare-fun m!1038563 () Bool)

(assert (=> start!98170 m!1038563))

(declare-fun m!1038565 () Bool)

(assert (=> b!1123516 m!1038565))

(declare-fun m!1038567 () Bool)

(assert (=> b!1123510 m!1038567))

(declare-fun m!1038569 () Bool)

(assert (=> b!1123510 m!1038569))

(declare-fun m!1038571 () Bool)

(assert (=> b!1123525 m!1038571))

(declare-fun m!1038573 () Bool)

(assert (=> b!1123525 m!1038573))

(declare-fun m!1038575 () Bool)

(assert (=> b!1123520 m!1038575))

(declare-fun m!1038577 () Bool)

(assert (=> b!1123520 m!1038577))

(declare-fun m!1038579 () Bool)

(assert (=> b!1123520 m!1038579))

(declare-fun m!1038581 () Bool)

(assert (=> b!1123520 m!1038581))

(declare-fun m!1038583 () Bool)

(assert (=> b!1123524 m!1038583))

(declare-fun m!1038585 () Bool)

(assert (=> b!1123508 m!1038585))

(declare-fun m!1038587 () Bool)

(assert (=> mapNonEmpty!44065 m!1038587))

(assert (=> b!1123511 m!1038559))

(assert (=> b!1123511 m!1038559))

(declare-fun m!1038589 () Bool)

(assert (=> b!1123511 m!1038589))

(declare-fun m!1038591 () Bool)

(assert (=> b!1123523 m!1038591))

(declare-fun m!1038593 () Bool)

(assert (=> b!1123523 m!1038593))

(check-sat (not b!1123524) (not b_lambda!18615) (not b!1123508) (not b!1123513) tp_is_empty!28165 (not start!98170) (not b!1123525) (not b_next!23635) (not b!1123512) (not b!1123523) (not bm!47252) b_and!38065 (not b!1123515) (not bm!47251) (not mapNonEmpty!44065) (not b!1123520) (not b!1123516) (not b!1123511) (not b!1123510))
(check-sat b_and!38065 (not b_next!23635))
