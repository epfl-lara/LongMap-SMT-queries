; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99510 () Bool)

(assert start!99510)

(declare-fun b_free!25089 () Bool)

(declare-fun b_next!25089 () Bool)

(assert (=> start!99510 (= b_free!25089 (not b_next!25089))))

(declare-fun tp!87980 () Bool)

(declare-fun b_and!41045 () Bool)

(assert (=> start!99510 (= tp!87980 b_and!41045)))

(declare-fun mapNonEmpty!46256 () Bool)

(declare-fun mapRes!46256 () Bool)

(declare-fun tp!87981 () Bool)

(declare-fun e!668918 () Bool)

(assert (=> mapNonEmpty!46256 (= mapRes!46256 (and tp!87981 e!668918))))

(declare-fun mapKey!46256 () (_ BitVec 32))

(declare-datatypes ((V!44619 0))(
  ( (V!44620 (val!14866 Int)) )
))
(declare-datatypes ((ValueCell!14100 0))(
  ( (ValueCellFull!14100 (v!17504 V!44619)) (EmptyCell!14100) )
))
(declare-fun mapValue!46256 () ValueCell!14100)

(declare-fun mapRest!46256 () (Array (_ BitVec 32) ValueCell!14100))

(declare-datatypes ((array!76045 0))(
  ( (array!76046 (arr!36672 (Array (_ BitVec 32) ValueCell!14100)) (size!37208 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76045)

(assert (=> mapNonEmpty!46256 (= (arr!36672 _values!996) (store mapRest!46256 mapKey!46256 mapValue!46256))))

(declare-fun b!1176735 () Bool)

(declare-fun tp_is_empty!29619 () Bool)

(assert (=> b!1176735 (= e!668918 tp_is_empty!29619)))

(declare-fun b!1176736 () Bool)

(declare-fun e!668911 () Bool)

(declare-fun e!668922 () Bool)

(assert (=> b!1176736 (= e!668911 e!668922)))

(declare-fun res!781595 () Bool)

(assert (=> b!1176736 (=> res!781595 e!668922)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1176736 (= res!781595 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44619)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!531169 () array!76045)

(declare-datatypes ((array!76047 0))(
  ( (array!76048 (arr!36673 (Array (_ BitVec 32) (_ BitVec 64))) (size!37209 (_ BitVec 32))) )
))
(declare-fun lt!531175 () array!76047)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44619)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!19012 0))(
  ( (tuple2!19013 (_1!9517 (_ BitVec 64)) (_2!9517 V!44619)) )
))
(declare-datatypes ((List!25750 0))(
  ( (Nil!25747) (Cons!25746 (h!26955 tuple2!19012) (t!37831 List!25750)) )
))
(declare-datatypes ((ListLongMap!16981 0))(
  ( (ListLongMap!16982 (toList!8506 List!25750)) )
))
(declare-fun lt!531170 () ListLongMap!16981)

(declare-fun getCurrentListMapNoExtraKeys!4965 (array!76047 array!76045 (_ BitVec 32) (_ BitVec 32) V!44619 V!44619 (_ BitVec 32) Int) ListLongMap!16981)

(assert (=> b!1176736 (= lt!531170 (getCurrentListMapNoExtraKeys!4965 lt!531175 lt!531169 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!531181 () V!44619)

(assert (=> b!1176736 (= lt!531169 (array!76046 (store (arr!36672 _values!996) i!673 (ValueCellFull!14100 lt!531181)) (size!37208 _values!996)))))

(declare-fun dynLambda!2930 (Int (_ BitVec 64)) V!44619)

(assert (=> b!1176736 (= lt!531181 (dynLambda!2930 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!76047)

(declare-fun lt!531180 () ListLongMap!16981)

(assert (=> b!1176736 (= lt!531180 (getCurrentListMapNoExtraKeys!4965 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun e!668913 () Bool)

(declare-fun lt!531179 () ListLongMap!16981)

(declare-fun b!1176737 () Bool)

(declare-fun lt!531176 () tuple2!19012)

(declare-fun +!3822 (ListLongMap!16981 tuple2!19012) ListLongMap!16981)

(assert (=> b!1176737 (= e!668913 (= lt!531180 (+!3822 lt!531179 lt!531176)))))

(declare-fun b!1176738 () Bool)

(declare-fun res!781601 () Bool)

(declare-fun e!668912 () Bool)

(assert (=> b!1176738 (=> (not res!781601) (not e!668912))))

(assert (=> b!1176738 (= res!781601 (and (= (size!37208 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37209 _keys!1208) (size!37208 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1176739 () Bool)

(declare-fun res!781609 () Bool)

(assert (=> b!1176739 (=> (not res!781609) (not e!668912))))

(declare-datatypes ((List!25751 0))(
  ( (Nil!25748) (Cons!25747 (h!26956 (_ BitVec 64)) (t!37832 List!25751)) )
))
(declare-fun arrayNoDuplicates!0 (array!76047 (_ BitVec 32) List!25751) Bool)

(assert (=> b!1176739 (= res!781609 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25748))))

(declare-fun mapIsEmpty!46256 () Bool)

(assert (=> mapIsEmpty!46256 mapRes!46256))

(declare-fun e!668915 () Bool)

(declare-fun b!1176740 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76047 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1176740 (= e!668915 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1176741 () Bool)

(declare-fun res!781603 () Bool)

(assert (=> b!1176741 (=> (not res!781603) (not e!668912))))

(assert (=> b!1176741 (= res!781603 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37209 _keys!1208))))))

(declare-fun b!1176742 () Bool)

(declare-fun e!668921 () Bool)

(assert (=> b!1176742 (= e!668922 e!668921)))

(declare-fun res!781600 () Bool)

(assert (=> b!1176742 (=> res!781600 e!668921)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1176742 (= res!781600 (not (validKeyInArray!0 (select (arr!36673 _keys!1208) from!1455))))))

(declare-fun lt!531182 () ListLongMap!16981)

(declare-fun lt!531173 () ListLongMap!16981)

(assert (=> b!1176742 (= lt!531182 lt!531173)))

(declare-fun -!1558 (ListLongMap!16981 (_ BitVec 64)) ListLongMap!16981)

(assert (=> b!1176742 (= lt!531173 (-!1558 lt!531179 k0!934))))

(assert (=> b!1176742 (= lt!531182 (getCurrentListMapNoExtraKeys!4965 lt!531175 lt!531169 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1176742 (= lt!531179 (getCurrentListMapNoExtraKeys!4965 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38850 0))(
  ( (Unit!38851) )
))
(declare-fun lt!531174 () Unit!38850)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!785 (array!76047 array!76045 (_ BitVec 32) (_ BitVec 32) V!44619 V!44619 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38850)

(assert (=> b!1176742 (= lt!531174 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!785 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!781605 () Bool)

(assert (=> start!99510 (=> (not res!781605) (not e!668912))))

(assert (=> start!99510 (= res!781605 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37209 _keys!1208))))))

(assert (=> start!99510 e!668912))

(assert (=> start!99510 tp_is_empty!29619))

(declare-fun array_inv!28006 (array!76047) Bool)

(assert (=> start!99510 (array_inv!28006 _keys!1208)))

(assert (=> start!99510 true))

(assert (=> start!99510 tp!87980))

(declare-fun e!668916 () Bool)

(declare-fun array_inv!28007 (array!76045) Bool)

(assert (=> start!99510 (and (array_inv!28007 _values!996) e!668916)))

(declare-fun b!1176743 () Bool)

(declare-fun res!781607 () Bool)

(assert (=> b!1176743 (=> (not res!781607) (not e!668912))))

(assert (=> b!1176743 (= res!781607 (validKeyInArray!0 k0!934))))

(declare-fun b!1176744 () Bool)

(declare-fun res!781597 () Bool)

(assert (=> b!1176744 (=> (not res!781597) (not e!668912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1176744 (= res!781597 (validMask!0 mask!1564))))

(declare-fun b!1176745 () Bool)

(assert (=> b!1176745 (= e!668921 true)))

(assert (=> b!1176745 e!668913))

(declare-fun res!781598 () Bool)

(assert (=> b!1176745 (=> (not res!781598) (not e!668913))))

(assert (=> b!1176745 (= res!781598 (not (= (select (arr!36673 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!531172 () Unit!38850)

(declare-fun e!668920 () Unit!38850)

(assert (=> b!1176745 (= lt!531172 e!668920)))

(declare-fun c!116757 () Bool)

(assert (=> b!1176745 (= c!116757 (= (select (arr!36673 _keys!1208) from!1455) k0!934))))

(declare-fun e!668914 () Bool)

(assert (=> b!1176745 e!668914))

(declare-fun res!781599 () Bool)

(assert (=> b!1176745 (=> (not res!781599) (not e!668914))))

(assert (=> b!1176745 (= res!781599 (= lt!531170 (+!3822 lt!531173 lt!531176)))))

(declare-fun get!18732 (ValueCell!14100 V!44619) V!44619)

(assert (=> b!1176745 (= lt!531176 (tuple2!19013 (select (arr!36673 _keys!1208) from!1455) (get!18732 (select (arr!36672 _values!996) from!1455) lt!531181)))))

(declare-fun b!1176746 () Bool)

(declare-fun e!668917 () Bool)

(assert (=> b!1176746 (= e!668917 (not e!668911))))

(declare-fun res!781608 () Bool)

(assert (=> b!1176746 (=> res!781608 e!668911)))

(assert (=> b!1176746 (= res!781608 (bvsgt from!1455 i!673))))

(assert (=> b!1176746 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!531183 () Unit!38850)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76047 (_ BitVec 64) (_ BitVec 32)) Unit!38850)

(assert (=> b!1176746 (= lt!531183 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1176747 () Bool)

(declare-fun Unit!38852 () Unit!38850)

(assert (=> b!1176747 (= e!668920 Unit!38852)))

(declare-fun b!1176748 () Bool)

(declare-fun res!781602 () Bool)

(assert (=> b!1176748 (=> (not res!781602) (not e!668912))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76047 (_ BitVec 32)) Bool)

(assert (=> b!1176748 (= res!781602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1176749 () Bool)

(declare-fun Unit!38853 () Unit!38850)

(assert (=> b!1176749 (= e!668920 Unit!38853)))

(declare-fun lt!531171 () Unit!38850)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76047 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38850)

(assert (=> b!1176749 (= lt!531171 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1176749 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!531178 () Unit!38850)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76047 (_ BitVec 32) (_ BitVec 32)) Unit!38850)

(assert (=> b!1176749 (= lt!531178 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1176749 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25748)))

(declare-fun lt!531177 () Unit!38850)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76047 (_ BitVec 64) (_ BitVec 32) List!25751) Unit!38850)

(assert (=> b!1176749 (= lt!531177 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25748))))

(assert (=> b!1176749 false))

(declare-fun b!1176750 () Bool)

(assert (=> b!1176750 (= e!668914 e!668915)))

(declare-fun res!781596 () Bool)

(assert (=> b!1176750 (=> res!781596 e!668915)))

(assert (=> b!1176750 (= res!781596 (not (= (select (arr!36673 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1176751 () Bool)

(declare-fun res!781606 () Bool)

(assert (=> b!1176751 (=> (not res!781606) (not e!668912))))

(assert (=> b!1176751 (= res!781606 (= (select (arr!36673 _keys!1208) i!673) k0!934))))

(declare-fun b!1176752 () Bool)

(assert (=> b!1176752 (= e!668912 e!668917)))

(declare-fun res!781604 () Bool)

(assert (=> b!1176752 (=> (not res!781604) (not e!668917))))

(assert (=> b!1176752 (= res!781604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!531175 mask!1564))))

(assert (=> b!1176752 (= lt!531175 (array!76048 (store (arr!36673 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37209 _keys!1208)))))

(declare-fun b!1176753 () Bool)

(declare-fun e!668919 () Bool)

(assert (=> b!1176753 (= e!668916 (and e!668919 mapRes!46256))))

(declare-fun condMapEmpty!46256 () Bool)

(declare-fun mapDefault!46256 () ValueCell!14100)

(assert (=> b!1176753 (= condMapEmpty!46256 (= (arr!36672 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14100)) mapDefault!46256)))))

(declare-fun b!1176754 () Bool)

(declare-fun res!781594 () Bool)

(assert (=> b!1176754 (=> (not res!781594) (not e!668917))))

(assert (=> b!1176754 (= res!781594 (arrayNoDuplicates!0 lt!531175 #b00000000000000000000000000000000 Nil!25748))))

(declare-fun b!1176755 () Bool)

(assert (=> b!1176755 (= e!668919 tp_is_empty!29619)))

(assert (= (and start!99510 res!781605) b!1176744))

(assert (= (and b!1176744 res!781597) b!1176738))

(assert (= (and b!1176738 res!781601) b!1176748))

(assert (= (and b!1176748 res!781602) b!1176739))

(assert (= (and b!1176739 res!781609) b!1176741))

(assert (= (and b!1176741 res!781603) b!1176743))

(assert (= (and b!1176743 res!781607) b!1176751))

(assert (= (and b!1176751 res!781606) b!1176752))

(assert (= (and b!1176752 res!781604) b!1176754))

(assert (= (and b!1176754 res!781594) b!1176746))

(assert (= (and b!1176746 (not res!781608)) b!1176736))

(assert (= (and b!1176736 (not res!781595)) b!1176742))

(assert (= (and b!1176742 (not res!781600)) b!1176745))

(assert (= (and b!1176745 res!781599) b!1176750))

(assert (= (and b!1176750 (not res!781596)) b!1176740))

(assert (= (and b!1176745 c!116757) b!1176749))

(assert (= (and b!1176745 (not c!116757)) b!1176747))

(assert (= (and b!1176745 res!781598) b!1176737))

(assert (= (and b!1176753 condMapEmpty!46256) mapIsEmpty!46256))

(assert (= (and b!1176753 (not condMapEmpty!46256)) mapNonEmpty!46256))

(get-info :version)

(assert (= (and mapNonEmpty!46256 ((_ is ValueCellFull!14100) mapValue!46256)) b!1176735))

(assert (= (and b!1176753 ((_ is ValueCellFull!14100) mapDefault!46256)) b!1176755))

(assert (= start!99510 b!1176753))

(declare-fun b_lambda!20233 () Bool)

(assert (=> (not b_lambda!20233) (not b!1176736)))

(declare-fun t!37830 () Bool)

(declare-fun tb!9901 () Bool)

(assert (=> (and start!99510 (= defaultEntry!1004 defaultEntry!1004) t!37830) tb!9901))

(declare-fun result!20369 () Bool)

(assert (=> tb!9901 (= result!20369 tp_is_empty!29619)))

(assert (=> b!1176736 t!37830))

(declare-fun b_and!41047 () Bool)

(assert (= b_and!41045 (and (=> t!37830 result!20369) b_and!41047)))

(declare-fun m!1084671 () Bool)

(assert (=> b!1176752 m!1084671))

(declare-fun m!1084673 () Bool)

(assert (=> b!1176752 m!1084673))

(declare-fun m!1084675 () Bool)

(assert (=> b!1176746 m!1084675))

(declare-fun m!1084677 () Bool)

(assert (=> b!1176746 m!1084677))

(declare-fun m!1084679 () Bool)

(assert (=> b!1176737 m!1084679))

(declare-fun m!1084681 () Bool)

(assert (=> b!1176751 m!1084681))

(declare-fun m!1084683 () Bool)

(assert (=> b!1176740 m!1084683))

(declare-fun m!1084685 () Bool)

(assert (=> b!1176754 m!1084685))

(declare-fun m!1084687 () Bool)

(assert (=> b!1176736 m!1084687))

(declare-fun m!1084689 () Bool)

(assert (=> b!1176736 m!1084689))

(declare-fun m!1084691 () Bool)

(assert (=> b!1176736 m!1084691))

(declare-fun m!1084693 () Bool)

(assert (=> b!1176736 m!1084693))

(declare-fun m!1084695 () Bool)

(assert (=> b!1176750 m!1084695))

(assert (=> b!1176745 m!1084695))

(declare-fun m!1084697 () Bool)

(assert (=> b!1176745 m!1084697))

(declare-fun m!1084699 () Bool)

(assert (=> b!1176745 m!1084699))

(assert (=> b!1176745 m!1084699))

(declare-fun m!1084701 () Bool)

(assert (=> b!1176745 m!1084701))

(declare-fun m!1084703 () Bool)

(assert (=> b!1176748 m!1084703))

(declare-fun m!1084705 () Bool)

(assert (=> b!1176749 m!1084705))

(declare-fun m!1084707 () Bool)

(assert (=> b!1176749 m!1084707))

(declare-fun m!1084709 () Bool)

(assert (=> b!1176749 m!1084709))

(declare-fun m!1084711 () Bool)

(assert (=> b!1176749 m!1084711))

(declare-fun m!1084713 () Bool)

(assert (=> b!1176749 m!1084713))

(declare-fun m!1084715 () Bool)

(assert (=> b!1176744 m!1084715))

(declare-fun m!1084717 () Bool)

(assert (=> b!1176742 m!1084717))

(declare-fun m!1084719 () Bool)

(assert (=> b!1176742 m!1084719))

(declare-fun m!1084721 () Bool)

(assert (=> b!1176742 m!1084721))

(declare-fun m!1084723 () Bool)

(assert (=> b!1176742 m!1084723))

(assert (=> b!1176742 m!1084695))

(declare-fun m!1084725 () Bool)

(assert (=> b!1176742 m!1084725))

(assert (=> b!1176742 m!1084695))

(declare-fun m!1084727 () Bool)

(assert (=> b!1176739 m!1084727))

(declare-fun m!1084729 () Bool)

(assert (=> b!1176743 m!1084729))

(declare-fun m!1084731 () Bool)

(assert (=> start!99510 m!1084731))

(declare-fun m!1084733 () Bool)

(assert (=> start!99510 m!1084733))

(declare-fun m!1084735 () Bool)

(assert (=> mapNonEmpty!46256 m!1084735))

(check-sat tp_is_empty!29619 (not b_lambda!20233) (not b!1176746) (not b!1176744) (not b!1176745) (not mapNonEmpty!46256) (not b!1176749) (not b!1176752) b_and!41047 (not b!1176748) (not b!1176742) (not b!1176737) (not b!1176739) (not b!1176754) (not start!99510) (not b!1176740) (not b!1176743) (not b_next!25089) (not b!1176736))
(check-sat b_and!41047 (not b_next!25089))
