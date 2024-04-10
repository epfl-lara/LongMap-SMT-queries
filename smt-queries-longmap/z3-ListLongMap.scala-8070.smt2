; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99288 () Bool)

(assert start!99288)

(declare-fun b_free!24867 () Bool)

(declare-fun b_next!24867 () Bool)

(assert (=> start!99288 (= b_free!24867 (not b_next!24867))))

(declare-fun tp!87315 () Bool)

(declare-fun b_and!40601 () Bool)

(assert (=> start!99288 (= tp!87315 b_and!40601)))

(declare-fun b!1169730 () Bool)

(declare-fun e!664825 () Bool)

(declare-fun e!664821 () Bool)

(assert (=> b!1169730 (= e!664825 e!664821)))

(declare-fun res!776201 () Bool)

(assert (=> b!1169730 (=> res!776201 e!664821)))

(declare-datatypes ((array!75617 0))(
  ( (array!75618 (arr!36458 (Array (_ BitVec 32) (_ BitVec 64))) (size!36994 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75617)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1169730 (= res!776201 (not (validKeyInArray!0 (select (arr!36458 _keys!1208) from!1455))))))

(declare-datatypes ((V!44323 0))(
  ( (V!44324 (val!14755 Int)) )
))
(declare-datatypes ((tuple2!18840 0))(
  ( (tuple2!18841 (_1!9431 (_ BitVec 64)) (_2!9431 V!44323)) )
))
(declare-datatypes ((List!25576 0))(
  ( (Nil!25573) (Cons!25572 (h!26781 tuple2!18840) (t!37435 List!25576)) )
))
(declare-datatypes ((ListLongMap!16809 0))(
  ( (ListLongMap!16810 (toList!8420 List!25576)) )
))
(declare-fun lt!526752 () ListLongMap!16809)

(declare-fun lt!526746 () ListLongMap!16809)

(assert (=> b!1169730 (= lt!526752 lt!526746)))

(declare-fun lt!526750 () ListLongMap!16809)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1491 (ListLongMap!16809 (_ BitVec 64)) ListLongMap!16809)

(assert (=> b!1169730 (= lt!526746 (-!1491 lt!526750 k0!934))))

(declare-fun zeroValue!944 () V!44323)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13989 0))(
  ( (ValueCellFull!13989 (v!17393 V!44323)) (EmptyCell!13989) )
))
(declare-datatypes ((array!75619 0))(
  ( (array!75620 (arr!36459 (Array (_ BitVec 32) ValueCell!13989)) (size!36995 (_ BitVec 32))) )
))
(declare-fun lt!526743 () array!75619)

(declare-fun minValue!944 () V!44323)

(declare-fun lt!526748 () array!75617)

(declare-fun getCurrentListMapNoExtraKeys!4884 (array!75617 array!75619 (_ BitVec 32) (_ BitVec 32) V!44323 V!44323 (_ BitVec 32) Int) ListLongMap!16809)

(assert (=> b!1169730 (= lt!526752 (getCurrentListMapNoExtraKeys!4884 lt!526748 lt!526743 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75619)

(assert (=> b!1169730 (= lt!526750 (getCurrentListMapNoExtraKeys!4884 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38592 0))(
  ( (Unit!38593) )
))
(declare-fun lt!526745 () Unit!38592)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!718 (array!75617 array!75619 (_ BitVec 32) (_ BitVec 32) V!44323 V!44323 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38592)

(assert (=> b!1169730 (= lt!526745 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!718 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1169731 () Bool)

(declare-fun res!776206 () Bool)

(declare-fun e!664820 () Bool)

(assert (=> b!1169731 (=> (not res!776206) (not e!664820))))

(assert (=> b!1169731 (= res!776206 (= (select (arr!36458 _keys!1208) i!673) k0!934))))

(declare-fun b!1169732 () Bool)

(declare-fun res!776211 () Bool)

(assert (=> b!1169732 (=> (not res!776211) (not e!664820))))

(assert (=> b!1169732 (= res!776211 (validKeyInArray!0 k0!934))))

(declare-fun b!1169733 () Bool)

(declare-fun e!664817 () Bool)

(declare-fun arrayContainsKey!0 (array!75617 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1169733 (= e!664817 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1169734 () Bool)

(declare-fun e!664816 () Bool)

(declare-fun e!664822 () Bool)

(assert (=> b!1169734 (= e!664816 (not e!664822))))

(declare-fun res!776203 () Bool)

(assert (=> b!1169734 (=> res!776203 e!664822)))

(assert (=> b!1169734 (= res!776203 (bvsgt from!1455 i!673))))

(assert (=> b!1169734 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!526744 () Unit!38592)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75617 (_ BitVec 64) (_ BitVec 32)) Unit!38592)

(assert (=> b!1169734 (= lt!526744 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!45923 () Bool)

(declare-fun mapRes!45923 () Bool)

(declare-fun tp!87314 () Bool)

(declare-fun e!664823 () Bool)

(assert (=> mapNonEmpty!45923 (= mapRes!45923 (and tp!87314 e!664823))))

(declare-fun mapRest!45923 () (Array (_ BitVec 32) ValueCell!13989))

(declare-fun mapValue!45923 () ValueCell!13989)

(declare-fun mapKey!45923 () (_ BitVec 32))

(assert (=> mapNonEmpty!45923 (= (arr!36459 _values!996) (store mapRest!45923 mapKey!45923 mapValue!45923))))

(declare-fun b!1169735 () Bool)

(declare-fun e!664818 () Bool)

(declare-fun e!664815 () Bool)

(assert (=> b!1169735 (= e!664818 (and e!664815 mapRes!45923))))

(declare-fun condMapEmpty!45923 () Bool)

(declare-fun mapDefault!45923 () ValueCell!13989)

(assert (=> b!1169735 (= condMapEmpty!45923 (= (arr!36459 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13989)) mapDefault!45923)))))

(declare-fun b!1169737 () Bool)

(declare-fun res!776198 () Bool)

(assert (=> b!1169737 (=> (not res!776198) (not e!664820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75617 (_ BitVec 32)) Bool)

(assert (=> b!1169737 (= res!776198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1169738 () Bool)

(declare-fun tp_is_empty!29397 () Bool)

(assert (=> b!1169738 (= e!664815 tp_is_empty!29397)))

(declare-fun mapIsEmpty!45923 () Bool)

(assert (=> mapIsEmpty!45923 mapRes!45923))

(declare-fun b!1169739 () Bool)

(declare-fun res!776210 () Bool)

(assert (=> b!1169739 (=> (not res!776210) (not e!664820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1169739 (= res!776210 (validMask!0 mask!1564))))

(declare-fun b!1169740 () Bool)

(assert (=> b!1169740 (= e!664821 true)))

(declare-fun e!664824 () Bool)

(assert (=> b!1169740 e!664824))

(declare-fun res!776209 () Bool)

(assert (=> b!1169740 (=> (not res!776209) (not e!664824))))

(declare-fun lt!526751 () V!44323)

(declare-fun lt!526747 () ListLongMap!16809)

(declare-fun +!3750 (ListLongMap!16809 tuple2!18840) ListLongMap!16809)

(declare-fun get!18586 (ValueCell!13989 V!44323) V!44323)

(assert (=> b!1169740 (= res!776209 (= lt!526747 (+!3750 lt!526746 (tuple2!18841 (select (arr!36458 _keys!1208) from!1455) (get!18586 (select (arr!36459 _values!996) from!1455) lt!526751)))))))

(declare-fun b!1169741 () Bool)

(assert (=> b!1169741 (= e!664820 e!664816)))

(declare-fun res!776212 () Bool)

(assert (=> b!1169741 (=> (not res!776212) (not e!664816))))

(assert (=> b!1169741 (= res!776212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526748 mask!1564))))

(assert (=> b!1169741 (= lt!526748 (array!75618 (store (arr!36458 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36994 _keys!1208)))))

(declare-fun b!1169742 () Bool)

(assert (=> b!1169742 (= e!664823 tp_is_empty!29397)))

(declare-fun b!1169743 () Bool)

(declare-fun res!776199 () Bool)

(assert (=> b!1169743 (=> (not res!776199) (not e!664820))))

(assert (=> b!1169743 (= res!776199 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36994 _keys!1208))))))

(declare-fun res!776207 () Bool)

(assert (=> start!99288 (=> (not res!776207) (not e!664820))))

(assert (=> start!99288 (= res!776207 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36994 _keys!1208))))))

(assert (=> start!99288 e!664820))

(assert (=> start!99288 tp_is_empty!29397))

(declare-fun array_inv!27866 (array!75617) Bool)

(assert (=> start!99288 (array_inv!27866 _keys!1208)))

(assert (=> start!99288 true))

(assert (=> start!99288 tp!87315))

(declare-fun array_inv!27867 (array!75619) Bool)

(assert (=> start!99288 (and (array_inv!27867 _values!996) e!664818)))

(declare-fun b!1169736 () Bool)

(declare-fun res!776204 () Bool)

(assert (=> b!1169736 (=> (not res!776204) (not e!664820))))

(assert (=> b!1169736 (= res!776204 (and (= (size!36995 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36994 _keys!1208) (size!36995 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1169744 () Bool)

(assert (=> b!1169744 (= e!664824 e!664817)))

(declare-fun res!776200 () Bool)

(assert (=> b!1169744 (=> res!776200 e!664817)))

(assert (=> b!1169744 (= res!776200 (not (= (select (arr!36458 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1169745 () Bool)

(declare-fun res!776202 () Bool)

(assert (=> b!1169745 (=> (not res!776202) (not e!664820))))

(declare-datatypes ((List!25577 0))(
  ( (Nil!25574) (Cons!25573 (h!26782 (_ BitVec 64)) (t!37436 List!25577)) )
))
(declare-fun arrayNoDuplicates!0 (array!75617 (_ BitVec 32) List!25577) Bool)

(assert (=> b!1169745 (= res!776202 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25574))))

(declare-fun b!1169746 () Bool)

(assert (=> b!1169746 (= e!664822 e!664825)))

(declare-fun res!776208 () Bool)

(assert (=> b!1169746 (=> res!776208 e!664825)))

(assert (=> b!1169746 (= res!776208 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1169746 (= lt!526747 (getCurrentListMapNoExtraKeys!4884 lt!526748 lt!526743 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1169746 (= lt!526743 (array!75620 (store (arr!36459 _values!996) i!673 (ValueCellFull!13989 lt!526751)) (size!36995 _values!996)))))

(declare-fun dynLambda!2861 (Int (_ BitVec 64)) V!44323)

(assert (=> b!1169746 (= lt!526751 (dynLambda!2861 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526749 () ListLongMap!16809)

(assert (=> b!1169746 (= lt!526749 (getCurrentListMapNoExtraKeys!4884 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1169747 () Bool)

(declare-fun res!776205 () Bool)

(assert (=> b!1169747 (=> (not res!776205) (not e!664816))))

(assert (=> b!1169747 (= res!776205 (arrayNoDuplicates!0 lt!526748 #b00000000000000000000000000000000 Nil!25574))))

(assert (= (and start!99288 res!776207) b!1169739))

(assert (= (and b!1169739 res!776210) b!1169736))

(assert (= (and b!1169736 res!776204) b!1169737))

(assert (= (and b!1169737 res!776198) b!1169745))

(assert (= (and b!1169745 res!776202) b!1169743))

(assert (= (and b!1169743 res!776199) b!1169732))

(assert (= (and b!1169732 res!776211) b!1169731))

(assert (= (and b!1169731 res!776206) b!1169741))

(assert (= (and b!1169741 res!776212) b!1169747))

(assert (= (and b!1169747 res!776205) b!1169734))

(assert (= (and b!1169734 (not res!776203)) b!1169746))

(assert (= (and b!1169746 (not res!776208)) b!1169730))

(assert (= (and b!1169730 (not res!776201)) b!1169740))

(assert (= (and b!1169740 res!776209) b!1169744))

(assert (= (and b!1169744 (not res!776200)) b!1169733))

(assert (= (and b!1169735 condMapEmpty!45923) mapIsEmpty!45923))

(assert (= (and b!1169735 (not condMapEmpty!45923)) mapNonEmpty!45923))

(get-info :version)

(assert (= (and mapNonEmpty!45923 ((_ is ValueCellFull!13989) mapValue!45923)) b!1169742))

(assert (= (and b!1169735 ((_ is ValueCellFull!13989) mapDefault!45923)) b!1169738))

(assert (= start!99288 b!1169735))

(declare-fun b_lambda!20011 () Bool)

(assert (=> (not b_lambda!20011) (not b!1169746)))

(declare-fun t!37434 () Bool)

(declare-fun tb!9679 () Bool)

(assert (=> (and start!99288 (= defaultEntry!1004 defaultEntry!1004) t!37434) tb!9679))

(declare-fun result!19925 () Bool)

(assert (=> tb!9679 (= result!19925 tp_is_empty!29397)))

(assert (=> b!1169746 t!37434))

(declare-fun b_and!40603 () Bool)

(assert (= b_and!40601 (and (=> t!37434 result!19925) b_and!40603)))

(declare-fun m!1077579 () Bool)

(assert (=> b!1169732 m!1077579))

(declare-fun m!1077581 () Bool)

(assert (=> b!1169739 m!1077581))

(declare-fun m!1077583 () Bool)

(assert (=> b!1169730 m!1077583))

(declare-fun m!1077585 () Bool)

(assert (=> b!1169730 m!1077585))

(declare-fun m!1077587 () Bool)

(assert (=> b!1169730 m!1077587))

(declare-fun m!1077589 () Bool)

(assert (=> b!1169730 m!1077589))

(declare-fun m!1077591 () Bool)

(assert (=> b!1169730 m!1077591))

(declare-fun m!1077593 () Bool)

(assert (=> b!1169730 m!1077593))

(assert (=> b!1169730 m!1077591))

(declare-fun m!1077595 () Bool)

(assert (=> b!1169747 m!1077595))

(declare-fun m!1077597 () Bool)

(assert (=> b!1169746 m!1077597))

(declare-fun m!1077599 () Bool)

(assert (=> b!1169746 m!1077599))

(declare-fun m!1077601 () Bool)

(assert (=> b!1169746 m!1077601))

(declare-fun m!1077603 () Bool)

(assert (=> b!1169746 m!1077603))

(declare-fun m!1077605 () Bool)

(assert (=> b!1169745 m!1077605))

(declare-fun m!1077607 () Bool)

(assert (=> b!1169737 m!1077607))

(declare-fun m!1077609 () Bool)

(assert (=> b!1169741 m!1077609))

(declare-fun m!1077611 () Bool)

(assert (=> b!1169741 m!1077611))

(declare-fun m!1077613 () Bool)

(assert (=> mapNonEmpty!45923 m!1077613))

(assert (=> b!1169744 m!1077591))

(declare-fun m!1077615 () Bool)

(assert (=> b!1169734 m!1077615))

(declare-fun m!1077617 () Bool)

(assert (=> b!1169734 m!1077617))

(assert (=> b!1169740 m!1077591))

(declare-fun m!1077619 () Bool)

(assert (=> b!1169740 m!1077619))

(assert (=> b!1169740 m!1077619))

(declare-fun m!1077621 () Bool)

(assert (=> b!1169740 m!1077621))

(declare-fun m!1077623 () Bool)

(assert (=> b!1169740 m!1077623))

(declare-fun m!1077625 () Bool)

(assert (=> start!99288 m!1077625))

(declare-fun m!1077627 () Bool)

(assert (=> start!99288 m!1077627))

(declare-fun m!1077629 () Bool)

(assert (=> b!1169731 m!1077629))

(declare-fun m!1077631 () Bool)

(assert (=> b!1169733 m!1077631))

(check-sat b_and!40603 tp_is_empty!29397 (not b_lambda!20011) (not b!1169733) (not b!1169747) (not b!1169745) (not b!1169737) (not mapNonEmpty!45923) (not start!99288) (not b!1169741) (not b!1169732) (not b!1169746) (not b!1169739) (not b!1169740) (not b!1169730) (not b!1169734) (not b_next!24867))
(check-sat b_and!40603 (not b_next!24867))
