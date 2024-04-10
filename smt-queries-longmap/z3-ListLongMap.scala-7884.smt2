; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98050 () Bool)

(assert start!98050)

(declare-fun b_free!23751 () Bool)

(declare-fun b_next!23751 () Bool)

(assert (=> start!98050 (= b_free!23751 (not b_next!23751))))

(declare-fun tp!83956 () Bool)

(declare-fun b_and!38285 () Bool)

(assert (=> start!98050 (= tp!83956 b_and!38285)))

(declare-fun b!1125618 () Bool)

(declare-fun e!640732 () Bool)

(declare-fun e!640736 () Bool)

(declare-fun mapRes!44239 () Bool)

(assert (=> b!1125618 (= e!640732 (and e!640736 mapRes!44239))))

(declare-fun condMapEmpty!44239 () Bool)

(declare-datatypes ((V!42835 0))(
  ( (V!42836 (val!14197 Int)) )
))
(declare-datatypes ((ValueCell!13431 0))(
  ( (ValueCellFull!13431 (v!16830 V!42835)) (EmptyCell!13431) )
))
(declare-datatypes ((array!73425 0))(
  ( (array!73426 (arr!35365 (Array (_ BitVec 32) ValueCell!13431)) (size!35901 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73425)

(declare-fun mapDefault!44239 () ValueCell!13431)

(assert (=> b!1125618 (= condMapEmpty!44239 (= (arr!35365 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13431)) mapDefault!44239)))))

(declare-fun b!1125619 () Bool)

(declare-fun res!752155 () Bool)

(declare-fun e!640729 () Bool)

(assert (=> b!1125619 (=> (not res!752155) (not e!640729))))

(declare-datatypes ((array!73427 0))(
  ( (array!73428 (arr!35366 (Array (_ BitVec 32) (_ BitVec 64))) (size!35902 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73427)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1125619 (= res!752155 (= (select (arr!35366 _keys!1208) i!673) k0!934))))

(declare-fun b!1125620 () Bool)

(declare-fun e!640735 () Bool)

(declare-datatypes ((tuple2!17842 0))(
  ( (tuple2!17843 (_1!8932 (_ BitVec 64)) (_2!8932 V!42835)) )
))
(declare-datatypes ((List!24621 0))(
  ( (Nil!24618) (Cons!24617 (h!25826 tuple2!17842) (t!35364 List!24621)) )
))
(declare-datatypes ((ListLongMap!15811 0))(
  ( (ListLongMap!15812 (toList!7921 List!24621)) )
))
(declare-fun call!47535 () ListLongMap!15811)

(declare-fun call!47536 () ListLongMap!15811)

(assert (=> b!1125620 (= e!640735 (= call!47535 call!47536))))

(declare-fun b!1125621 () Bool)

(declare-fun res!752151 () Bool)

(declare-fun e!640731 () Bool)

(assert (=> b!1125621 (=> (not res!752151) (not e!640731))))

(declare-fun lt!499921 () array!73427)

(declare-datatypes ((List!24622 0))(
  ( (Nil!24619) (Cons!24618 (h!25827 (_ BitVec 64)) (t!35365 List!24622)) )
))
(declare-fun arrayNoDuplicates!0 (array!73427 (_ BitVec 32) List!24622) Bool)

(assert (=> b!1125621 (= res!752151 (arrayNoDuplicates!0 lt!499921 #b00000000000000000000000000000000 Nil!24619))))

(declare-fun b!1125622 () Bool)

(declare-fun e!640737 () Bool)

(declare-fun e!640728 () Bool)

(assert (=> b!1125622 (= e!640737 e!640728)))

(declare-fun res!752147 () Bool)

(assert (=> b!1125622 (=> res!752147 e!640728)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1125622 (= res!752147 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!42835)

(declare-fun lt!499919 () ListLongMap!15811)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!499918 () array!73425)

(declare-fun minValue!944 () V!42835)

(declare-fun getCurrentListMapNoExtraKeys!4409 (array!73427 array!73425 (_ BitVec 32) (_ BitVec 32) V!42835 V!42835 (_ BitVec 32) Int) ListLongMap!15811)

(assert (=> b!1125622 (= lt!499919 (getCurrentListMapNoExtraKeys!4409 lt!499921 lt!499918 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2499 (Int (_ BitVec 64)) V!42835)

(assert (=> b!1125622 (= lt!499918 (array!73426 (store (arr!35365 _values!996) i!673 (ValueCellFull!13431 (dynLambda!2499 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35901 _values!996)))))

(declare-fun lt!499916 () ListLongMap!15811)

(assert (=> b!1125622 (= lt!499916 (getCurrentListMapNoExtraKeys!4409 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1125623 () Bool)

(declare-fun -!1120 (ListLongMap!15811 (_ BitVec 64)) ListLongMap!15811)

(assert (=> b!1125623 (= e!640735 (= call!47535 (-!1120 call!47536 k0!934)))))

(declare-fun b!1125624 () Bool)

(declare-fun res!752156 () Bool)

(assert (=> b!1125624 (=> (not res!752156) (not e!640729))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1125624 (= res!752156 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!44239 () Bool)

(assert (=> mapIsEmpty!44239 mapRes!44239))

(declare-fun b!1125625 () Bool)

(assert (=> b!1125625 (= e!640729 e!640731)))

(declare-fun res!752153 () Bool)

(assert (=> b!1125625 (=> (not res!752153) (not e!640731))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73427 (_ BitVec 32)) Bool)

(assert (=> b!1125625 (= res!752153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499921 mask!1564))))

(assert (=> b!1125625 (= lt!499921 (array!73428 (store (arr!35366 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35902 _keys!1208)))))

(declare-fun b!1125626 () Bool)

(declare-fun e!640733 () Bool)

(assert (=> b!1125626 (= e!640728 e!640733)))

(declare-fun res!752154 () Bool)

(assert (=> b!1125626 (=> res!752154 e!640733)))

(assert (=> b!1125626 (= res!752154 (not (= (select (arr!35366 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1125626 e!640735))

(declare-fun c!109617 () Bool)

(assert (=> b!1125626 (= c!109617 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36892 0))(
  ( (Unit!36893) )
))
(declare-fun lt!499920 () Unit!36892)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!367 (array!73427 array!73425 (_ BitVec 32) (_ BitVec 32) V!42835 V!42835 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36892)

(assert (=> b!1125626 (= lt!499920 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!367 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125628 () Bool)

(declare-fun res!752158 () Bool)

(assert (=> b!1125628 (=> (not res!752158) (not e!640729))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1125628 (= res!752158 (validMask!0 mask!1564))))

(declare-fun bm!47532 () Bool)

(assert (=> bm!47532 (= call!47535 (getCurrentListMapNoExtraKeys!4409 lt!499921 lt!499918 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!47533 () Bool)

(assert (=> bm!47533 (= call!47536 (getCurrentListMapNoExtraKeys!4409 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125629 () Bool)

(declare-fun res!752146 () Bool)

(assert (=> b!1125629 (=> (not res!752146) (not e!640729))))

(assert (=> b!1125629 (= res!752146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1125630 () Bool)

(assert (=> b!1125630 (= e!640731 (not e!640737))))

(declare-fun res!752148 () Bool)

(assert (=> b!1125630 (=> res!752148 e!640737)))

(assert (=> b!1125630 (= res!752148 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73427 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1125630 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!499917 () Unit!36892)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73427 (_ BitVec 64) (_ BitVec 32)) Unit!36892)

(assert (=> b!1125630 (= lt!499917 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1125631 () Bool)

(declare-fun res!752152 () Bool)

(assert (=> b!1125631 (=> (not res!752152) (not e!640729))))

(assert (=> b!1125631 (= res!752152 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24619))))

(declare-fun b!1125632 () Bool)

(declare-fun tp_is_empty!28281 () Bool)

(assert (=> b!1125632 (= e!640736 tp_is_empty!28281)))

(declare-fun b!1125633 () Bool)

(declare-fun res!752157 () Bool)

(assert (=> b!1125633 (=> (not res!752157) (not e!640729))))

(assert (=> b!1125633 (= res!752157 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35902 _keys!1208))))))

(declare-fun mapNonEmpty!44239 () Bool)

(declare-fun tp!83957 () Bool)

(declare-fun e!640730 () Bool)

(assert (=> mapNonEmpty!44239 (= mapRes!44239 (and tp!83957 e!640730))))

(declare-fun mapValue!44239 () ValueCell!13431)

(declare-fun mapRest!44239 () (Array (_ BitVec 32) ValueCell!13431))

(declare-fun mapKey!44239 () (_ BitVec 32))

(assert (=> mapNonEmpty!44239 (= (arr!35365 _values!996) (store mapRest!44239 mapKey!44239 mapValue!44239))))

(declare-fun b!1125634 () Bool)

(assert (=> b!1125634 (= e!640730 tp_is_empty!28281)))

(declare-fun b!1125635 () Bool)

(assert (=> b!1125635 (= e!640733 true)))

(declare-fun lt!499922 () Bool)

(declare-fun contains!6457 (ListLongMap!15811 (_ BitVec 64)) Bool)

(assert (=> b!1125635 (= lt!499922 (contains!6457 (getCurrentListMapNoExtraKeys!4409 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1125627 () Bool)

(declare-fun res!752150 () Bool)

(assert (=> b!1125627 (=> (not res!752150) (not e!640729))))

(assert (=> b!1125627 (= res!752150 (and (= (size!35901 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35902 _keys!1208) (size!35901 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!752149 () Bool)

(assert (=> start!98050 (=> (not res!752149) (not e!640729))))

(assert (=> start!98050 (= res!752149 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35902 _keys!1208))))))

(assert (=> start!98050 e!640729))

(assert (=> start!98050 tp_is_empty!28281))

(declare-fun array_inv!27148 (array!73427) Bool)

(assert (=> start!98050 (array_inv!27148 _keys!1208)))

(assert (=> start!98050 true))

(assert (=> start!98050 tp!83956))

(declare-fun array_inv!27149 (array!73425) Bool)

(assert (=> start!98050 (and (array_inv!27149 _values!996) e!640732)))

(assert (= (and start!98050 res!752149) b!1125628))

(assert (= (and b!1125628 res!752158) b!1125627))

(assert (= (and b!1125627 res!752150) b!1125629))

(assert (= (and b!1125629 res!752146) b!1125631))

(assert (= (and b!1125631 res!752152) b!1125633))

(assert (= (and b!1125633 res!752157) b!1125624))

(assert (= (and b!1125624 res!752156) b!1125619))

(assert (= (and b!1125619 res!752155) b!1125625))

(assert (= (and b!1125625 res!752153) b!1125621))

(assert (= (and b!1125621 res!752151) b!1125630))

(assert (= (and b!1125630 (not res!752148)) b!1125622))

(assert (= (and b!1125622 (not res!752147)) b!1125626))

(assert (= (and b!1125626 c!109617) b!1125623))

(assert (= (and b!1125626 (not c!109617)) b!1125620))

(assert (= (or b!1125623 b!1125620) bm!47532))

(assert (= (or b!1125623 b!1125620) bm!47533))

(assert (= (and b!1125626 (not res!752154)) b!1125635))

(assert (= (and b!1125618 condMapEmpty!44239) mapIsEmpty!44239))

(assert (= (and b!1125618 (not condMapEmpty!44239)) mapNonEmpty!44239))

(get-info :version)

(assert (= (and mapNonEmpty!44239 ((_ is ValueCellFull!13431) mapValue!44239)) b!1125634))

(assert (= (and b!1125618 ((_ is ValueCellFull!13431) mapDefault!44239)) b!1125632))

(assert (= start!98050 b!1125618))

(declare-fun b_lambda!18721 () Bool)

(assert (=> (not b_lambda!18721) (not b!1125622)))

(declare-fun t!35363 () Bool)

(declare-fun tb!8563 () Bool)

(assert (=> (and start!98050 (= defaultEntry!1004 defaultEntry!1004) t!35363) tb!8563))

(declare-fun result!17687 () Bool)

(assert (=> tb!8563 (= result!17687 tp_is_empty!28281)))

(assert (=> b!1125622 t!35363))

(declare-fun b_and!38287 () Bool)

(assert (= b_and!38285 (and (=> t!35363 result!17687) b_and!38287)))

(declare-fun m!1039729 () Bool)

(assert (=> b!1125628 m!1039729))

(declare-fun m!1039731 () Bool)

(assert (=> b!1125623 m!1039731))

(declare-fun m!1039733 () Bool)

(assert (=> b!1125621 m!1039733))

(declare-fun m!1039735 () Bool)

(assert (=> b!1125625 m!1039735))

(declare-fun m!1039737 () Bool)

(assert (=> b!1125625 m!1039737))

(declare-fun m!1039739 () Bool)

(assert (=> b!1125630 m!1039739))

(declare-fun m!1039741 () Bool)

(assert (=> b!1125630 m!1039741))

(declare-fun m!1039743 () Bool)

(assert (=> b!1125622 m!1039743))

(declare-fun m!1039745 () Bool)

(assert (=> b!1125622 m!1039745))

(declare-fun m!1039747 () Bool)

(assert (=> b!1125622 m!1039747))

(declare-fun m!1039749 () Bool)

(assert (=> b!1125622 m!1039749))

(declare-fun m!1039751 () Bool)

(assert (=> start!98050 m!1039751))

(declare-fun m!1039753 () Bool)

(assert (=> start!98050 m!1039753))

(declare-fun m!1039755 () Bool)

(assert (=> b!1125626 m!1039755))

(declare-fun m!1039757 () Bool)

(assert (=> b!1125626 m!1039757))

(declare-fun m!1039759 () Bool)

(assert (=> b!1125619 m!1039759))

(declare-fun m!1039761 () Bool)

(assert (=> b!1125624 m!1039761))

(declare-fun m!1039763 () Bool)

(assert (=> b!1125635 m!1039763))

(assert (=> b!1125635 m!1039763))

(declare-fun m!1039765 () Bool)

(assert (=> b!1125635 m!1039765))

(declare-fun m!1039767 () Bool)

(assert (=> mapNonEmpty!44239 m!1039767))

(declare-fun m!1039769 () Bool)

(assert (=> b!1125629 m!1039769))

(assert (=> bm!47533 m!1039763))

(declare-fun m!1039771 () Bool)

(assert (=> bm!47532 m!1039771))

(declare-fun m!1039773 () Bool)

(assert (=> b!1125631 m!1039773))

(check-sat (not b!1125621) b_and!38287 (not b!1125623) (not b!1125635) (not mapNonEmpty!44239) (not b!1125630) (not b!1125629) (not bm!47533) (not b!1125628) (not b_next!23751) (not start!98050) tp_is_empty!28281 (not bm!47532) (not b!1125624) (not b!1125625) (not b!1125631) (not b!1125626) (not b!1125622) (not b_lambda!18721))
(check-sat b_and!38287 (not b_next!23751))
