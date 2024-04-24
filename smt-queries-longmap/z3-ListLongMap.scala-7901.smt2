; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98386 () Bool)

(assert start!98386)

(declare-fun b_free!23851 () Bool)

(declare-fun b_next!23851 () Bool)

(assert (=> start!98386 (= b_free!23851 (not b_next!23851))))

(declare-fun tp!84257 () Bool)

(declare-fun b_and!38495 () Bool)

(assert (=> start!98386 (= tp!84257 b_and!38495)))

(declare-fun b!1129754 () Bool)

(declare-fun e!643087 () Bool)

(declare-fun e!643083 () Bool)

(assert (=> b!1129754 (= e!643087 e!643083)))

(declare-fun res!754637 () Bool)

(assert (=> b!1129754 (=> (not res!754637) (not e!643083))))

(declare-datatypes ((array!73665 0))(
  ( (array!73666 (arr!35479 (Array (_ BitVec 32) (_ BitVec 64))) (size!36016 (_ BitVec 32))) )
))
(declare-fun lt!501473 () array!73665)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73665 (_ BitVec 32)) Bool)

(assert (=> b!1129754 (= res!754637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!501473 mask!1564))))

(declare-fun _keys!1208 () array!73665)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1129754 (= lt!501473 (array!73666 (store (arr!35479 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36016 _keys!1208)))))

(declare-fun b!1129755 () Bool)

(declare-fun e!643091 () Bool)

(declare-fun e!643090 () Bool)

(assert (=> b!1129755 (= e!643091 e!643090)))

(declare-fun res!754630 () Bool)

(assert (=> b!1129755 (=> res!754630 e!643090)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1129755 (= res!754630 (not (= (select (arr!35479 _keys!1208) from!1455) k0!934)))))

(declare-fun e!643088 () Bool)

(assert (=> b!1129755 e!643088))

(declare-fun c!110177 () Bool)

(assert (=> b!1129755 (= c!110177 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!42969 0))(
  ( (V!42970 (val!14247 Int)) )
))
(declare-fun zeroValue!944 () V!42969)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!36953 0))(
  ( (Unit!36954) )
))
(declare-fun lt!501474 () Unit!36953)

(declare-datatypes ((ValueCell!13481 0))(
  ( (ValueCellFull!13481 (v!16876 V!42969)) (EmptyCell!13481) )
))
(declare-datatypes ((array!73667 0))(
  ( (array!73668 (arr!35480 (Array (_ BitVec 32) ValueCell!13481)) (size!36017 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73667)

(declare-fun minValue!944 () V!42969)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!405 (array!73665 array!73667 (_ BitVec 32) (_ BitVec 32) V!42969 V!42969 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36953)

(assert (=> b!1129755 (= lt!501474 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!405 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((tuple2!17948 0))(
  ( (tuple2!17949 (_1!8985 (_ BitVec 64)) (_2!8985 V!42969)) )
))
(declare-datatypes ((List!24726 0))(
  ( (Nil!24723) (Cons!24722 (h!25940 tuple2!17948) (t!35561 List!24726)) )
))
(declare-datatypes ((ListLongMap!15925 0))(
  ( (ListLongMap!15926 (toList!7978 List!24726)) )
))
(declare-fun call!47902 () ListLongMap!15925)

(declare-fun bm!47899 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4498 (array!73665 array!73667 (_ BitVec 32) (_ BitVec 32) V!42969 V!42969 (_ BitVec 32) Int) ListLongMap!15925)

(assert (=> bm!47899 (= call!47902 (getCurrentListMapNoExtraKeys!4498 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129756 () Bool)

(declare-fun e!643085 () Bool)

(assert (=> b!1129756 (= e!643085 e!643091)))

(declare-fun res!754639 () Bool)

(assert (=> b!1129756 (=> res!754639 e!643091)))

(assert (=> b!1129756 (= res!754639 (not (= from!1455 i!673)))))

(declare-fun lt!501478 () ListLongMap!15925)

(declare-fun lt!501475 () array!73667)

(assert (=> b!1129756 (= lt!501478 (getCurrentListMapNoExtraKeys!4498 lt!501473 lt!501475 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2564 (Int (_ BitVec 64)) V!42969)

(assert (=> b!1129756 (= lt!501475 (array!73668 (store (arr!35480 _values!996) i!673 (ValueCellFull!13481 (dynLambda!2564 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36017 _values!996)))))

(declare-fun lt!501477 () ListLongMap!15925)

(assert (=> b!1129756 (= lt!501477 (getCurrentListMapNoExtraKeys!4498 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun call!47903 () ListLongMap!15925)

(declare-fun bm!47900 () Bool)

(assert (=> bm!47900 (= call!47903 (getCurrentListMapNoExtraKeys!4498 lt!501473 lt!501475 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1129757 () Bool)

(declare-fun res!754635 () Bool)

(assert (=> b!1129757 (=> (not res!754635) (not e!643083))))

(declare-datatypes ((List!24727 0))(
  ( (Nil!24724) (Cons!24723 (h!25941 (_ BitVec 64)) (t!35562 List!24727)) )
))
(declare-fun arrayNoDuplicates!0 (array!73665 (_ BitVec 32) List!24727) Bool)

(assert (=> b!1129757 (= res!754635 (arrayNoDuplicates!0 lt!501473 #b00000000000000000000000000000000 Nil!24724))))

(declare-fun b!1129758 () Bool)

(declare-fun res!754627 () Bool)

(assert (=> b!1129758 (=> (not res!754627) (not e!643087))))

(assert (=> b!1129758 (= res!754627 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24724))))

(declare-fun mapNonEmpty!44389 () Bool)

(declare-fun mapRes!44389 () Bool)

(declare-fun tp!84256 () Bool)

(declare-fun e!643092 () Bool)

(assert (=> mapNonEmpty!44389 (= mapRes!44389 (and tp!84256 e!643092))))

(declare-fun mapRest!44389 () (Array (_ BitVec 32) ValueCell!13481))

(declare-fun mapValue!44389 () ValueCell!13481)

(declare-fun mapKey!44389 () (_ BitVec 32))

(assert (=> mapNonEmpty!44389 (= (arr!35480 _values!996) (store mapRest!44389 mapKey!44389 mapValue!44389))))

(declare-fun b!1129759 () Bool)

(declare-fun res!754633 () Bool)

(assert (=> b!1129759 (=> (not res!754633) (not e!643087))))

(assert (=> b!1129759 (= res!754633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1129760 () Bool)

(declare-fun tp_is_empty!28381 () Bool)

(assert (=> b!1129760 (= e!643092 tp_is_empty!28381)))

(declare-fun b!1129761 () Bool)

(declare-fun res!754632 () Bool)

(assert (=> b!1129761 (=> (not res!754632) (not e!643087))))

(assert (=> b!1129761 (= res!754632 (and (= (size!36017 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36016 _keys!1208) (size!36017 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1129762 () Bool)

(declare-fun e!643086 () Bool)

(declare-fun e!643089 () Bool)

(assert (=> b!1129762 (= e!643086 (and e!643089 mapRes!44389))))

(declare-fun condMapEmpty!44389 () Bool)

(declare-fun mapDefault!44389 () ValueCell!13481)

(assert (=> b!1129762 (= condMapEmpty!44389 (= (arr!35480 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13481)) mapDefault!44389)))))

(declare-fun b!1129763 () Bool)

(declare-fun res!754631 () Bool)

(assert (=> b!1129763 (=> (not res!754631) (not e!643087))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1129763 (= res!754631 (validMask!0 mask!1564))))

(declare-fun res!754638 () Bool)

(assert (=> start!98386 (=> (not res!754638) (not e!643087))))

(assert (=> start!98386 (= res!754638 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36016 _keys!1208))))))

(assert (=> start!98386 e!643087))

(assert (=> start!98386 tp_is_empty!28381))

(declare-fun array_inv!27278 (array!73665) Bool)

(assert (=> start!98386 (array_inv!27278 _keys!1208)))

(assert (=> start!98386 true))

(assert (=> start!98386 tp!84257))

(declare-fun array_inv!27279 (array!73667) Bool)

(assert (=> start!98386 (and (array_inv!27279 _values!996) e!643086)))

(declare-fun b!1129764 () Bool)

(declare-fun -!1146 (ListLongMap!15925 (_ BitVec 64)) ListLongMap!15925)

(assert (=> b!1129764 (= e!643088 (= call!47903 (-!1146 call!47902 k0!934)))))

(declare-fun b!1129765 () Bool)

(declare-fun res!754628 () Bool)

(assert (=> b!1129765 (=> (not res!754628) (not e!643087))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1129765 (= res!754628 (validKeyInArray!0 k0!934))))

(declare-fun b!1129766 () Bool)

(assert (=> b!1129766 (= e!643089 tp_is_empty!28381)))

(declare-fun b!1129767 () Bool)

(assert (=> b!1129767 (= e!643083 (not e!643085))))

(declare-fun res!754634 () Bool)

(assert (=> b!1129767 (=> res!754634 e!643085)))

(assert (=> b!1129767 (= res!754634 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1129767 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!501476 () Unit!36953)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73665 (_ BitVec 64) (_ BitVec 32)) Unit!36953)

(assert (=> b!1129767 (= lt!501476 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1129768 () Bool)

(assert (=> b!1129768 (= e!643088 (= call!47903 call!47902))))

(declare-fun b!1129769 () Bool)

(declare-fun res!754636 () Bool)

(assert (=> b!1129769 (=> (not res!754636) (not e!643087))))

(assert (=> b!1129769 (= res!754636 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36016 _keys!1208))))))

(declare-fun mapIsEmpty!44389 () Bool)

(assert (=> mapIsEmpty!44389 mapRes!44389))

(declare-fun b!1129770 () Bool)

(assert (=> b!1129770 (= e!643090 true)))

(declare-fun lt!501472 () Bool)

(declare-fun contains!6518 (ListLongMap!15925 (_ BitVec 64)) Bool)

(assert (=> b!1129770 (= lt!501472 (contains!6518 (getCurrentListMapNoExtraKeys!4498 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1129771 () Bool)

(declare-fun res!754629 () Bool)

(assert (=> b!1129771 (=> (not res!754629) (not e!643087))))

(assert (=> b!1129771 (= res!754629 (= (select (arr!35479 _keys!1208) i!673) k0!934))))

(assert (= (and start!98386 res!754638) b!1129763))

(assert (= (and b!1129763 res!754631) b!1129761))

(assert (= (and b!1129761 res!754632) b!1129759))

(assert (= (and b!1129759 res!754633) b!1129758))

(assert (= (and b!1129758 res!754627) b!1129769))

(assert (= (and b!1129769 res!754636) b!1129765))

(assert (= (and b!1129765 res!754628) b!1129771))

(assert (= (and b!1129771 res!754629) b!1129754))

(assert (= (and b!1129754 res!754637) b!1129757))

(assert (= (and b!1129757 res!754635) b!1129767))

(assert (= (and b!1129767 (not res!754634)) b!1129756))

(assert (= (and b!1129756 (not res!754639)) b!1129755))

(assert (= (and b!1129755 c!110177) b!1129764))

(assert (= (and b!1129755 (not c!110177)) b!1129768))

(assert (= (or b!1129764 b!1129768) bm!47900))

(assert (= (or b!1129764 b!1129768) bm!47899))

(assert (= (and b!1129755 (not res!754630)) b!1129770))

(assert (= (and b!1129762 condMapEmpty!44389) mapIsEmpty!44389))

(assert (= (and b!1129762 (not condMapEmpty!44389)) mapNonEmpty!44389))

(get-info :version)

(assert (= (and mapNonEmpty!44389 ((_ is ValueCellFull!13481) mapValue!44389)) b!1129760))

(assert (= (and b!1129762 ((_ is ValueCellFull!13481) mapDefault!44389)) b!1129766))

(assert (= start!98386 b!1129762))

(declare-fun b_lambda!18831 () Bool)

(assert (=> (not b_lambda!18831) (not b!1129756)))

(declare-fun t!35560 () Bool)

(declare-fun tb!8655 () Bool)

(assert (=> (and start!98386 (= defaultEntry!1004 defaultEntry!1004) t!35560) tb!8655))

(declare-fun result!17879 () Bool)

(assert (=> tb!8655 (= result!17879 tp_is_empty!28381)))

(assert (=> b!1129756 t!35560))

(declare-fun b_and!38497 () Bool)

(assert (= b_and!38495 (and (=> t!35560 result!17879) b_and!38497)))

(declare-fun m!1043705 () Bool)

(assert (=> b!1129763 m!1043705))

(declare-fun m!1043707 () Bool)

(assert (=> b!1129765 m!1043707))

(declare-fun m!1043709 () Bool)

(assert (=> bm!47899 m!1043709))

(declare-fun m!1043711 () Bool)

(assert (=> b!1129755 m!1043711))

(declare-fun m!1043713 () Bool)

(assert (=> b!1129755 m!1043713))

(declare-fun m!1043715 () Bool)

(assert (=> b!1129754 m!1043715))

(declare-fun m!1043717 () Bool)

(assert (=> b!1129754 m!1043717))

(assert (=> b!1129770 m!1043709))

(assert (=> b!1129770 m!1043709))

(declare-fun m!1043719 () Bool)

(assert (=> b!1129770 m!1043719))

(declare-fun m!1043721 () Bool)

(assert (=> b!1129764 m!1043721))

(declare-fun m!1043723 () Bool)

(assert (=> b!1129756 m!1043723))

(declare-fun m!1043725 () Bool)

(assert (=> b!1129756 m!1043725))

(declare-fun m!1043727 () Bool)

(assert (=> b!1129756 m!1043727))

(declare-fun m!1043729 () Bool)

(assert (=> b!1129756 m!1043729))

(declare-fun m!1043731 () Bool)

(assert (=> b!1129759 m!1043731))

(declare-fun m!1043733 () Bool)

(assert (=> mapNonEmpty!44389 m!1043733))

(declare-fun m!1043735 () Bool)

(assert (=> b!1129771 m!1043735))

(declare-fun m!1043737 () Bool)

(assert (=> b!1129758 m!1043737))

(declare-fun m!1043739 () Bool)

(assert (=> start!98386 m!1043739))

(declare-fun m!1043741 () Bool)

(assert (=> start!98386 m!1043741))

(declare-fun m!1043743 () Bool)

(assert (=> b!1129757 m!1043743))

(declare-fun m!1043745 () Bool)

(assert (=> b!1129767 m!1043745))

(declare-fun m!1043747 () Bool)

(assert (=> b!1129767 m!1043747))

(declare-fun m!1043749 () Bool)

(assert (=> bm!47900 m!1043749))

(check-sat (not start!98386) (not mapNonEmpty!44389) (not b!1129764) (not b!1129757) tp_is_empty!28381 (not b!1129758) (not bm!47900) (not b!1129765) (not b_lambda!18831) (not b!1129763) (not b!1129759) b_and!38497 (not b_next!23851) (not b!1129770) (not b!1129756) (not bm!47899) (not b!1129767) (not b!1129754) (not b!1129755))
(check-sat b_and!38497 (not b_next!23851))
