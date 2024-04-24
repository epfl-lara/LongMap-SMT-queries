; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99576 () Bool)

(assert start!99576)

(declare-fun b_free!24919 () Bool)

(declare-fun b_next!24919 () Bool)

(assert (=> start!99576 (= b_free!24919 (not b_next!24919))))

(declare-fun tp!87471 () Bool)

(declare-fun b_and!40707 () Bool)

(assert (=> start!99576 (= tp!87471 b_and!40707)))

(declare-fun b!1172600 () Bool)

(declare-fun res!778013 () Bool)

(declare-fun e!666593 () Bool)

(assert (=> b!1172600 (=> res!778013 e!666593)))

(declare-datatypes ((List!25647 0))(
  ( (Nil!25644) (Cons!25643 (h!26861 (_ BitVec 64)) (t!37550 List!25647)) )
))
(declare-fun contains!6875 (List!25647 (_ BitVec 64)) Bool)

(assert (=> b!1172600 (= res!778013 (contains!6875 Nil!25644 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!46001 () Bool)

(declare-fun mapRes!46001 () Bool)

(declare-fun tp!87470 () Bool)

(declare-fun e!666602 () Bool)

(assert (=> mapNonEmpty!46001 (= mapRes!46001 (and tp!87470 e!666602))))

(declare-fun mapKey!46001 () (_ BitVec 32))

(declare-datatypes ((V!44393 0))(
  ( (V!44394 (val!14781 Int)) )
))
(declare-datatypes ((ValueCell!14015 0))(
  ( (ValueCellFull!14015 (v!17415 V!44393)) (EmptyCell!14015) )
))
(declare-fun mapValue!46001 () ValueCell!14015)

(declare-fun mapRest!46001 () (Array (_ BitVec 32) ValueCell!14015))

(declare-datatypes ((array!75767 0))(
  ( (array!75768 (arr!36527 (Array (_ BitVec 32) ValueCell!14015)) (size!37064 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75767)

(assert (=> mapNonEmpty!46001 (= (arr!36527 _values!996) (store mapRest!46001 mapKey!46001 mapValue!46001))))

(declare-fun b!1172601 () Bool)

(declare-fun e!666597 () Bool)

(declare-fun e!666592 () Bool)

(assert (=> b!1172601 (= e!666597 (not e!666592))))

(declare-fun res!778008 () Bool)

(assert (=> b!1172601 (=> res!778008 e!666592)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1172601 (= res!778008 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!75769 0))(
  ( (array!75770 (arr!36528 (Array (_ BitVec 32) (_ BitVec 64))) (size!37065 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75769)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75769 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1172601 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38609 0))(
  ( (Unit!38610) )
))
(declare-fun lt!528122 () Unit!38609)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75769 (_ BitVec 64) (_ BitVec 32)) Unit!38609)

(assert (=> b!1172601 (= lt!528122 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1172602 () Bool)

(declare-fun e!666594 () Bool)

(declare-fun e!666591 () Bool)

(assert (=> b!1172602 (= e!666594 e!666591)))

(declare-fun res!778012 () Bool)

(assert (=> b!1172602 (=> res!778012 e!666591)))

(assert (=> b!1172602 (= res!778012 (not (= (select (arr!36528 _keys!1208) from!1455) k0!934)))))

(declare-fun e!666590 () Bool)

(assert (=> b!1172602 e!666590))

(declare-fun res!778016 () Bool)

(assert (=> b!1172602 (=> (not res!778016) (not e!666590))))

(declare-datatypes ((tuple2!18912 0))(
  ( (tuple2!18913 (_1!9467 (_ BitVec 64)) (_2!9467 V!44393)) )
))
(declare-datatypes ((List!25648 0))(
  ( (Nil!25645) (Cons!25644 (h!26862 tuple2!18912) (t!37551 List!25648)) )
))
(declare-datatypes ((ListLongMap!16889 0))(
  ( (ListLongMap!16890 (toList!8460 List!25648)) )
))
(declare-fun lt!528112 () ListLongMap!16889)

(declare-fun lt!528115 () V!44393)

(declare-fun lt!528120 () ListLongMap!16889)

(declare-fun +!3798 (ListLongMap!16889 tuple2!18912) ListLongMap!16889)

(declare-fun get!18656 (ValueCell!14015 V!44393) V!44393)

(assert (=> b!1172602 (= res!778016 (= lt!528120 (+!3798 lt!528112 (tuple2!18913 (select (arr!36528 _keys!1208) from!1455) (get!18656 (select (arr!36527 _values!996) from!1455) lt!528115)))))))

(declare-fun b!1172603 () Bool)

(declare-fun res!778009 () Bool)

(declare-fun e!666595 () Bool)

(assert (=> b!1172603 (=> (not res!778009) (not e!666595))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1172603 (= res!778009 (validMask!0 mask!1564))))

(declare-fun b!1172604 () Bool)

(declare-fun res!778014 () Bool)

(assert (=> b!1172604 (=> (not res!778014) (not e!666597))))

(declare-fun lt!528118 () array!75769)

(declare-fun arrayNoDuplicates!0 (array!75769 (_ BitVec 32) List!25647) Bool)

(assert (=> b!1172604 (= res!778014 (arrayNoDuplicates!0 lt!528118 #b00000000000000000000000000000000 Nil!25644))))

(declare-fun b!1172605 () Bool)

(declare-fun e!666601 () Bool)

(assert (=> b!1172605 (= e!666601 e!666594)))

(declare-fun res!778017 () Bool)

(assert (=> b!1172605 (=> res!778017 e!666594)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1172605 (= res!778017 (not (validKeyInArray!0 (select (arr!36528 _keys!1208) from!1455))))))

(declare-fun lt!528113 () ListLongMap!16889)

(assert (=> b!1172605 (= lt!528113 lt!528112)))

(declare-fun lt!528116 () ListLongMap!16889)

(declare-fun -!1514 (ListLongMap!16889 (_ BitVec 64)) ListLongMap!16889)

(assert (=> b!1172605 (= lt!528112 (-!1514 lt!528116 k0!934))))

(declare-fun zeroValue!944 () V!44393)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!528124 () array!75767)

(declare-fun minValue!944 () V!44393)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4947 (array!75769 array!75767 (_ BitVec 32) (_ BitVec 32) V!44393 V!44393 (_ BitVec 32) Int) ListLongMap!16889)

(assert (=> b!1172605 (= lt!528113 (getCurrentListMapNoExtraKeys!4947 lt!528118 lt!528124 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1172605 (= lt!528116 (getCurrentListMapNoExtraKeys!4947 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!528117 () Unit!38609)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!739 (array!75769 array!75767 (_ BitVec 32) (_ BitVec 32) V!44393 V!44393 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38609)

(assert (=> b!1172605 (= lt!528117 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!739 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1172606 () Bool)

(declare-fun res!778018 () Bool)

(assert (=> b!1172606 (=> res!778018 e!666593)))

(declare-fun noDuplicate!1624 (List!25647) Bool)

(assert (=> b!1172606 (= res!778018 (not (noDuplicate!1624 Nil!25644)))))

(declare-fun b!1172607 () Bool)

(declare-fun res!778015 () Bool)

(assert (=> b!1172607 (=> (not res!778015) (not e!666595))))

(assert (=> b!1172607 (= res!778015 (and (= (size!37064 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37065 _keys!1208) (size!37064 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1172608 () Bool)

(declare-fun tp_is_empty!29449 () Bool)

(assert (=> b!1172608 (= e!666602 tp_is_empty!29449)))

(declare-fun b!1172610 () Bool)

(assert (=> b!1172610 (= e!666592 e!666601)))

(declare-fun res!778004 () Bool)

(assert (=> b!1172610 (=> res!778004 e!666601)))

(assert (=> b!1172610 (= res!778004 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1172610 (= lt!528120 (getCurrentListMapNoExtraKeys!4947 lt!528118 lt!528124 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1172610 (= lt!528124 (array!75768 (store (arr!36527 _values!996) i!673 (ValueCellFull!14015 lt!528115)) (size!37064 _values!996)))))

(declare-fun dynLambda!2927 (Int (_ BitVec 64)) V!44393)

(assert (=> b!1172610 (= lt!528115 (dynLambda!2927 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!528121 () ListLongMap!16889)

(assert (=> b!1172610 (= lt!528121 (getCurrentListMapNoExtraKeys!4947 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1172611 () Bool)

(declare-fun res!778005 () Bool)

(assert (=> b!1172611 (=> (not res!778005) (not e!666595))))

(assert (=> b!1172611 (= res!778005 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25644))))

(declare-fun b!1172612 () Bool)

(assert (=> b!1172612 (= e!666591 e!666593)))

(declare-fun res!778010 () Bool)

(assert (=> b!1172612 (=> res!778010 e!666593)))

(assert (=> b!1172612 (= res!778010 (or (bvsge (size!37065 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37065 _keys!1208)) (bvsge from!1455 (size!37065 _keys!1208))))))

(assert (=> b!1172612 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25644)))

(declare-fun lt!528119 () Unit!38609)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75769 (_ BitVec 32) (_ BitVec 32)) Unit!38609)

(assert (=> b!1172612 (= lt!528119 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1172612 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528114 () Unit!38609)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75769 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38609)

(assert (=> b!1172612 (= lt!528114 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1172613 () Bool)

(declare-fun res!778002 () Bool)

(assert (=> b!1172613 (=> (not res!778002) (not e!666595))))

(assert (=> b!1172613 (= res!778002 (= (select (arr!36528 _keys!1208) i!673) k0!934))))

(declare-fun b!1172614 () Bool)

(declare-fun res!778001 () Bool)

(assert (=> b!1172614 (=> (not res!778001) (not e!666595))))

(assert (=> b!1172614 (= res!778001 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37065 _keys!1208))))))

(declare-fun b!1172615 () Bool)

(declare-fun e!666600 () Bool)

(assert (=> b!1172615 (= e!666590 e!666600)))

(declare-fun res!778011 () Bool)

(assert (=> b!1172615 (=> res!778011 e!666600)))

(assert (=> b!1172615 (= res!778011 (not (= (select (arr!36528 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1172616 () Bool)

(assert (=> b!1172616 (= e!666593 true)))

(declare-fun lt!528123 () Bool)

(assert (=> b!1172616 (= lt!528123 (contains!6875 Nil!25644 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1172617 () Bool)

(declare-fun e!666599 () Bool)

(declare-fun e!666598 () Bool)

(assert (=> b!1172617 (= e!666599 (and e!666598 mapRes!46001))))

(declare-fun condMapEmpty!46001 () Bool)

(declare-fun mapDefault!46001 () ValueCell!14015)

(assert (=> b!1172617 (= condMapEmpty!46001 (= (arr!36527 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14015)) mapDefault!46001)))))

(declare-fun b!1172618 () Bool)

(assert (=> b!1172618 (= e!666600 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1172619 () Bool)

(assert (=> b!1172619 (= e!666598 tp_is_empty!29449)))

(declare-fun b!1172620 () Bool)

(declare-fun res!778019 () Bool)

(assert (=> b!1172620 (=> (not res!778019) (not e!666595))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75769 (_ BitVec 32)) Bool)

(assert (=> b!1172620 (= res!778019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1172621 () Bool)

(assert (=> b!1172621 (= e!666595 e!666597)))

(declare-fun res!778003 () Bool)

(assert (=> b!1172621 (=> (not res!778003) (not e!666597))))

(assert (=> b!1172621 (= res!778003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528118 mask!1564))))

(assert (=> b!1172621 (= lt!528118 (array!75770 (store (arr!36528 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37065 _keys!1208)))))

(declare-fun mapIsEmpty!46001 () Bool)

(assert (=> mapIsEmpty!46001 mapRes!46001))

(declare-fun res!778007 () Bool)

(assert (=> start!99576 (=> (not res!778007) (not e!666595))))

(assert (=> start!99576 (= res!778007 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37065 _keys!1208))))))

(assert (=> start!99576 e!666595))

(assert (=> start!99576 tp_is_empty!29449))

(declare-fun array_inv!27986 (array!75769) Bool)

(assert (=> start!99576 (array_inv!27986 _keys!1208)))

(assert (=> start!99576 true))

(assert (=> start!99576 tp!87471))

(declare-fun array_inv!27987 (array!75767) Bool)

(assert (=> start!99576 (and (array_inv!27987 _values!996) e!666599)))

(declare-fun b!1172609 () Bool)

(declare-fun res!778006 () Bool)

(assert (=> b!1172609 (=> (not res!778006) (not e!666595))))

(assert (=> b!1172609 (= res!778006 (validKeyInArray!0 k0!934))))

(assert (= (and start!99576 res!778007) b!1172603))

(assert (= (and b!1172603 res!778009) b!1172607))

(assert (= (and b!1172607 res!778015) b!1172620))

(assert (= (and b!1172620 res!778019) b!1172611))

(assert (= (and b!1172611 res!778005) b!1172614))

(assert (= (and b!1172614 res!778001) b!1172609))

(assert (= (and b!1172609 res!778006) b!1172613))

(assert (= (and b!1172613 res!778002) b!1172621))

(assert (= (and b!1172621 res!778003) b!1172604))

(assert (= (and b!1172604 res!778014) b!1172601))

(assert (= (and b!1172601 (not res!778008)) b!1172610))

(assert (= (and b!1172610 (not res!778004)) b!1172605))

(assert (= (and b!1172605 (not res!778017)) b!1172602))

(assert (= (and b!1172602 res!778016) b!1172615))

(assert (= (and b!1172615 (not res!778011)) b!1172618))

(assert (= (and b!1172602 (not res!778012)) b!1172612))

(assert (= (and b!1172612 (not res!778010)) b!1172606))

(assert (= (and b!1172606 (not res!778018)) b!1172600))

(assert (= (and b!1172600 (not res!778013)) b!1172616))

(assert (= (and b!1172617 condMapEmpty!46001) mapIsEmpty!46001))

(assert (= (and b!1172617 (not condMapEmpty!46001)) mapNonEmpty!46001))

(get-info :version)

(assert (= (and mapNonEmpty!46001 ((_ is ValueCellFull!14015) mapValue!46001)) b!1172608))

(assert (= (and b!1172617 ((_ is ValueCellFull!14015) mapDefault!46001)) b!1172619))

(assert (= start!99576 b!1172617))

(declare-fun b_lambda!20057 () Bool)

(assert (=> (not b_lambda!20057) (not b!1172610)))

(declare-fun t!37549 () Bool)

(declare-fun tb!9723 () Bool)

(assert (=> (and start!99576 (= defaultEntry!1004 defaultEntry!1004) t!37549) tb!9723))

(declare-fun result!20021 () Bool)

(assert (=> tb!9723 (= result!20021 tp_is_empty!29449)))

(assert (=> b!1172610 t!37549))

(declare-fun b_and!40709 () Bool)

(assert (= b_and!40707 (and (=> t!37549 result!20021) b_and!40709)))

(declare-fun m!1080699 () Bool)

(assert (=> b!1172611 m!1080699))

(declare-fun m!1080701 () Bool)

(assert (=> b!1172603 m!1080701))

(declare-fun m!1080703 () Bool)

(assert (=> b!1172620 m!1080703))

(declare-fun m!1080705 () Bool)

(assert (=> b!1172606 m!1080705))

(declare-fun m!1080707 () Bool)

(assert (=> b!1172602 m!1080707))

(declare-fun m!1080709 () Bool)

(assert (=> b!1172602 m!1080709))

(assert (=> b!1172602 m!1080709))

(declare-fun m!1080711 () Bool)

(assert (=> b!1172602 m!1080711))

(declare-fun m!1080713 () Bool)

(assert (=> b!1172602 m!1080713))

(declare-fun m!1080715 () Bool)

(assert (=> b!1172600 m!1080715))

(declare-fun m!1080717 () Bool)

(assert (=> b!1172621 m!1080717))

(declare-fun m!1080719 () Bool)

(assert (=> b!1172621 m!1080719))

(declare-fun m!1080721 () Bool)

(assert (=> b!1172618 m!1080721))

(declare-fun m!1080723 () Bool)

(assert (=> b!1172601 m!1080723))

(declare-fun m!1080725 () Bool)

(assert (=> b!1172601 m!1080725))

(declare-fun m!1080727 () Bool)

(assert (=> b!1172605 m!1080727))

(declare-fun m!1080729 () Bool)

(assert (=> b!1172605 m!1080729))

(declare-fun m!1080731 () Bool)

(assert (=> b!1172605 m!1080731))

(declare-fun m!1080733 () Bool)

(assert (=> b!1172605 m!1080733))

(assert (=> b!1172605 m!1080707))

(declare-fun m!1080735 () Bool)

(assert (=> b!1172605 m!1080735))

(assert (=> b!1172605 m!1080707))

(declare-fun m!1080737 () Bool)

(assert (=> b!1172604 m!1080737))

(declare-fun m!1080739 () Bool)

(assert (=> b!1172609 m!1080739))

(assert (=> b!1172615 m!1080707))

(declare-fun m!1080741 () Bool)

(assert (=> mapNonEmpty!46001 m!1080741))

(declare-fun m!1080743 () Bool)

(assert (=> b!1172612 m!1080743))

(declare-fun m!1080745 () Bool)

(assert (=> b!1172612 m!1080745))

(declare-fun m!1080747 () Bool)

(assert (=> b!1172612 m!1080747))

(declare-fun m!1080749 () Bool)

(assert (=> b!1172612 m!1080749))

(declare-fun m!1080751 () Bool)

(assert (=> start!99576 m!1080751))

(declare-fun m!1080753 () Bool)

(assert (=> start!99576 m!1080753))

(declare-fun m!1080755 () Bool)

(assert (=> b!1172613 m!1080755))

(declare-fun m!1080757 () Bool)

(assert (=> b!1172610 m!1080757))

(declare-fun m!1080759 () Bool)

(assert (=> b!1172610 m!1080759))

(declare-fun m!1080761 () Bool)

(assert (=> b!1172610 m!1080761))

(declare-fun m!1080763 () Bool)

(assert (=> b!1172610 m!1080763))

(declare-fun m!1080765 () Bool)

(assert (=> b!1172616 m!1080765))

(check-sat (not b!1172602) (not b!1172612) (not b!1172620) (not b!1172618) (not b!1172603) (not b!1172611) b_and!40709 (not b!1172605) (not b!1172610) (not mapNonEmpty!46001) (not start!99576) tp_is_empty!29449 (not b!1172616) (not b!1172609) (not b!1172601) (not b!1172604) (not b!1172600) (not b_lambda!20057) (not b!1172621) (not b_next!24919) (not b!1172606))
(check-sat b_and!40709 (not b_next!24919))
