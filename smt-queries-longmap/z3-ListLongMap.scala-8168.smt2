; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100110 () Bool)

(assert start!100110)

(declare-fun b_free!25453 () Bool)

(declare-fun b_next!25453 () Bool)

(assert (=> start!100110 (= b_free!25453 (not b_next!25453))))

(declare-fun tp!89073 () Bool)

(declare-fun b_and!41775 () Bool)

(assert (=> start!100110 (= tp!89073 b_and!41775)))

(declare-fun b!1189608 () Bool)

(declare-fun res!790604 () Bool)

(declare-fun e!676512 () Bool)

(assert (=> b!1189608 (=> (not res!790604) (not e!676512))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1189608 (= res!790604 (validKeyInArray!0 k0!934))))

(declare-fun b!1189609 () Bool)

(declare-fun res!790607 () Bool)

(assert (=> b!1189609 (=> (not res!790607) (not e!676512))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!76807 0))(
  ( (array!76808 (arr!37047 (Array (_ BitVec 32) (_ BitVec 64))) (size!37584 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76807)

(assert (=> b!1189609 (= res!790607 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37584 _keys!1208))))))

(declare-fun b!1189610 () Bool)

(declare-fun res!790597 () Bool)

(assert (=> b!1189610 (=> (not res!790597) (not e!676512))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76807 (_ BitVec 32)) Bool)

(assert (=> b!1189610 (= res!790597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1189611 () Bool)

(declare-fun res!790599 () Bool)

(assert (=> b!1189611 (=> (not res!790599) (not e!676512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1189611 (= res!790599 (validMask!0 mask!1564))))

(declare-fun b!1189612 () Bool)

(declare-fun res!790606 () Bool)

(assert (=> b!1189612 (=> (not res!790606) (not e!676512))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45105 0))(
  ( (V!45106 (val!15048 Int)) )
))
(declare-datatypes ((ValueCell!14282 0))(
  ( (ValueCellFull!14282 (v!17682 V!45105)) (EmptyCell!14282) )
))
(declare-datatypes ((array!76809 0))(
  ( (array!76810 (arr!37048 (Array (_ BitVec 32) ValueCell!14282)) (size!37585 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76809)

(assert (=> b!1189612 (= res!790606 (and (= (size!37585 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37584 _keys!1208) (size!37585 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1189613 () Bool)

(declare-fun e!676513 () Bool)

(assert (=> b!1189613 (= e!676513 true)))

(declare-fun zeroValue!944 () V!45105)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!541126 () array!76809)

(declare-fun minValue!944 () V!45105)

(declare-fun lt!541121 () array!76807)

(declare-datatypes ((tuple2!19358 0))(
  ( (tuple2!19359 (_1!9690 (_ BitVec 64)) (_2!9690 V!45105)) )
))
(declare-datatypes ((List!26099 0))(
  ( (Nil!26096) (Cons!26095 (h!27313 tuple2!19358) (t!38536 List!26099)) )
))
(declare-datatypes ((ListLongMap!17335 0))(
  ( (ListLongMap!17336 (toList!8683 List!26099)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5151 (array!76807 array!76809 (_ BitVec 32) (_ BitVec 32) V!45105 V!45105 (_ BitVec 32) Int) ListLongMap!17335)

(declare-fun -!1702 (ListLongMap!17335 (_ BitVec 64)) ListLongMap!17335)

(assert (=> b!1189613 (= (getCurrentListMapNoExtraKeys!5151 lt!541121 lt!541126 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1702 (getCurrentListMapNoExtraKeys!5151 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39407 0))(
  ( (Unit!39408) )
))
(declare-fun lt!541124 () Unit!39407)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!917 (array!76807 array!76809 (_ BitVec 32) (_ BitVec 32) V!45105 V!45105 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39407)

(assert (=> b!1189613 (= lt!541124 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!917 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1189614 () Bool)

(declare-fun e!676511 () Bool)

(assert (=> b!1189614 (= e!676512 e!676511)))

(declare-fun res!790598 () Bool)

(assert (=> b!1189614 (=> (not res!790598) (not e!676511))))

(assert (=> b!1189614 (= res!790598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541121 mask!1564))))

(assert (=> b!1189614 (= lt!541121 (array!76808 (store (arr!37047 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37584 _keys!1208)))))

(declare-fun mapNonEmpty!46802 () Bool)

(declare-fun mapRes!46802 () Bool)

(declare-fun tp!89072 () Bool)

(declare-fun e!676514 () Bool)

(assert (=> mapNonEmpty!46802 (= mapRes!46802 (and tp!89072 e!676514))))

(declare-fun mapKey!46802 () (_ BitVec 32))

(declare-fun mapRest!46802 () (Array (_ BitVec 32) ValueCell!14282))

(declare-fun mapValue!46802 () ValueCell!14282)

(assert (=> mapNonEmpty!46802 (= (arr!37048 _values!996) (store mapRest!46802 mapKey!46802 mapValue!46802))))

(declare-fun b!1189615 () Bool)

(declare-fun e!676510 () Bool)

(declare-fun tp_is_empty!29983 () Bool)

(assert (=> b!1189615 (= e!676510 tp_is_empty!29983)))

(declare-fun b!1189616 () Bool)

(declare-fun res!790600 () Bool)

(assert (=> b!1189616 (=> (not res!790600) (not e!676511))))

(declare-datatypes ((List!26100 0))(
  ( (Nil!26097) (Cons!26096 (h!27314 (_ BitVec 64)) (t!38537 List!26100)) )
))
(declare-fun arrayNoDuplicates!0 (array!76807 (_ BitVec 32) List!26100) Bool)

(assert (=> b!1189616 (= res!790600 (arrayNoDuplicates!0 lt!541121 #b00000000000000000000000000000000 Nil!26097))))

(declare-fun b!1189618 () Bool)

(declare-fun e!676507 () Bool)

(assert (=> b!1189618 (= e!676507 (and e!676510 mapRes!46802))))

(declare-fun condMapEmpty!46802 () Bool)

(declare-fun mapDefault!46802 () ValueCell!14282)

(assert (=> b!1189618 (= condMapEmpty!46802 (= (arr!37048 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14282)) mapDefault!46802)))))

(declare-fun b!1189619 () Bool)

(declare-fun res!790601 () Bool)

(assert (=> b!1189619 (=> (not res!790601) (not e!676512))))

(assert (=> b!1189619 (= res!790601 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26097))))

(declare-fun b!1189620 () Bool)

(assert (=> b!1189620 (= e!676514 tp_is_empty!29983)))

(declare-fun b!1189621 () Bool)

(declare-fun res!790605 () Bool)

(assert (=> b!1189621 (=> (not res!790605) (not e!676512))))

(assert (=> b!1189621 (= res!790605 (= (select (arr!37047 _keys!1208) i!673) k0!934))))

(declare-fun res!790596 () Bool)

(assert (=> start!100110 (=> (not res!790596) (not e!676512))))

(assert (=> start!100110 (= res!790596 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37584 _keys!1208))))))

(assert (=> start!100110 e!676512))

(assert (=> start!100110 tp_is_empty!29983))

(declare-fun array_inv!28332 (array!76807) Bool)

(assert (=> start!100110 (array_inv!28332 _keys!1208)))

(assert (=> start!100110 true))

(assert (=> start!100110 tp!89073))

(declare-fun array_inv!28333 (array!76809) Bool)

(assert (=> start!100110 (and (array_inv!28333 _values!996) e!676507)))

(declare-fun b!1189617 () Bool)

(declare-fun e!676509 () Bool)

(assert (=> b!1189617 (= e!676509 e!676513)))

(declare-fun res!790602 () Bool)

(assert (=> b!1189617 (=> res!790602 e!676513)))

(assert (=> b!1189617 (= res!790602 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541123 () ListLongMap!17335)

(assert (=> b!1189617 (= lt!541123 (getCurrentListMapNoExtraKeys!5151 lt!541121 lt!541126 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3109 (Int (_ BitVec 64)) V!45105)

(assert (=> b!1189617 (= lt!541126 (array!76810 (store (arr!37048 _values!996) i!673 (ValueCellFull!14282 (dynLambda!3109 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37585 _values!996)))))

(declare-fun lt!541122 () ListLongMap!17335)

(assert (=> b!1189617 (= lt!541122 (getCurrentListMapNoExtraKeys!5151 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!46802 () Bool)

(assert (=> mapIsEmpty!46802 mapRes!46802))

(declare-fun b!1189622 () Bool)

(assert (=> b!1189622 (= e!676511 (not e!676509))))

(declare-fun res!790603 () Bool)

(assert (=> b!1189622 (=> res!790603 e!676509)))

(assert (=> b!1189622 (= res!790603 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1189622 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!541125 () Unit!39407)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76807 (_ BitVec 64) (_ BitVec 32)) Unit!39407)

(assert (=> b!1189622 (= lt!541125 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!100110 res!790596) b!1189611))

(assert (= (and b!1189611 res!790599) b!1189612))

(assert (= (and b!1189612 res!790606) b!1189610))

(assert (= (and b!1189610 res!790597) b!1189619))

(assert (= (and b!1189619 res!790601) b!1189609))

(assert (= (and b!1189609 res!790607) b!1189608))

(assert (= (and b!1189608 res!790604) b!1189621))

(assert (= (and b!1189621 res!790605) b!1189614))

(assert (= (and b!1189614 res!790598) b!1189616))

(assert (= (and b!1189616 res!790600) b!1189622))

(assert (= (and b!1189622 (not res!790603)) b!1189617))

(assert (= (and b!1189617 (not res!790602)) b!1189613))

(assert (= (and b!1189618 condMapEmpty!46802) mapIsEmpty!46802))

(assert (= (and b!1189618 (not condMapEmpty!46802)) mapNonEmpty!46802))

(get-info :version)

(assert (= (and mapNonEmpty!46802 ((_ is ValueCellFull!14282) mapValue!46802)) b!1189620))

(assert (= (and b!1189618 ((_ is ValueCellFull!14282) mapDefault!46802)) b!1189615))

(assert (= start!100110 b!1189618))

(declare-fun b_lambda!20591 () Bool)

(assert (=> (not b_lambda!20591) (not b!1189617)))

(declare-fun t!38535 () Bool)

(declare-fun tb!10257 () Bool)

(assert (=> (and start!100110 (= defaultEntry!1004 defaultEntry!1004) t!38535) tb!10257))

(declare-fun result!21089 () Bool)

(assert (=> tb!10257 (= result!21089 tp_is_empty!29983)))

(assert (=> b!1189617 t!38535))

(declare-fun b_and!41777 () Bool)

(assert (= b_and!41775 (and (=> t!38535 result!21089) b_and!41777)))

(declare-fun m!1098687 () Bool)

(assert (=> b!1189611 m!1098687))

(declare-fun m!1098689 () Bool)

(assert (=> mapNonEmpty!46802 m!1098689))

(declare-fun m!1098691 () Bool)

(assert (=> b!1189619 m!1098691))

(declare-fun m!1098693 () Bool)

(assert (=> b!1189621 m!1098693))

(declare-fun m!1098695 () Bool)

(assert (=> b!1189622 m!1098695))

(declare-fun m!1098697 () Bool)

(assert (=> b!1189622 m!1098697))

(declare-fun m!1098699 () Bool)

(assert (=> b!1189616 m!1098699))

(declare-fun m!1098701 () Bool)

(assert (=> b!1189613 m!1098701))

(declare-fun m!1098703 () Bool)

(assert (=> b!1189613 m!1098703))

(assert (=> b!1189613 m!1098703))

(declare-fun m!1098705 () Bool)

(assert (=> b!1189613 m!1098705))

(declare-fun m!1098707 () Bool)

(assert (=> b!1189613 m!1098707))

(declare-fun m!1098709 () Bool)

(assert (=> b!1189608 m!1098709))

(declare-fun m!1098711 () Bool)

(assert (=> b!1189617 m!1098711))

(declare-fun m!1098713 () Bool)

(assert (=> b!1189617 m!1098713))

(declare-fun m!1098715 () Bool)

(assert (=> b!1189617 m!1098715))

(declare-fun m!1098717 () Bool)

(assert (=> b!1189617 m!1098717))

(declare-fun m!1098719 () Bool)

(assert (=> start!100110 m!1098719))

(declare-fun m!1098721 () Bool)

(assert (=> start!100110 m!1098721))

(declare-fun m!1098723 () Bool)

(assert (=> b!1189610 m!1098723))

(declare-fun m!1098725 () Bool)

(assert (=> b!1189614 m!1098725))

(declare-fun m!1098727 () Bool)

(assert (=> b!1189614 m!1098727))

(check-sat (not b!1189619) (not b!1189613) (not b_next!25453) tp_is_empty!29983 (not mapNonEmpty!46802) (not start!100110) (not b!1189608) (not b!1189610) (not b!1189617) (not b!1189622) (not b!1189614) (not b_lambda!20591) (not b!1189611) b_and!41777 (not b!1189616))
(check-sat b_and!41777 (not b_next!25453))
