; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100020 () Bool)

(assert start!100020)

(declare-fun b_free!25363 () Bool)

(declare-fun b_next!25363 () Bool)

(assert (=> start!100020 (= b_free!25363 (not b_next!25363))))

(declare-fun tp!88802 () Bool)

(declare-fun b_and!41595 () Bool)

(assert (=> start!100020 (= tp!88802 b_and!41595)))

(declare-fun b!1186828 () Bool)

(declare-fun res!788591 () Bool)

(declare-fun e!674901 () Bool)

(assert (=> b!1186828 (=> (not res!788591) (not e!674901))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!76631 0))(
  ( (array!76632 (arr!36959 (Array (_ BitVec 32) (_ BitVec 64))) (size!37496 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76631)

(assert (=> b!1186828 (= res!788591 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37496 _keys!1208))))))

(declare-fun b!1186829 () Bool)

(declare-fun res!788583 () Bool)

(assert (=> b!1186829 (=> (not res!788583) (not e!674901))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1186829 (= res!788583 (= (select (arr!36959 _keys!1208) i!673) k0!934))))

(declare-fun b!1186830 () Bool)

(declare-fun res!788586 () Bool)

(assert (=> b!1186830 (=> (not res!788586) (not e!674901))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76631 (_ BitVec 32)) Bool)

(assert (=> b!1186830 (= res!788586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1186831 () Bool)

(declare-fun e!674905 () Bool)

(declare-fun e!674904 () Bool)

(assert (=> b!1186831 (= e!674905 (not e!674904))))

(declare-fun res!788590 () Bool)

(assert (=> b!1186831 (=> res!788590 e!674904)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1186831 (= res!788590 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76631 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1186831 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39276 0))(
  ( (Unit!39277) )
))
(declare-fun lt!538588 () Unit!39276)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76631 (_ BitVec 64) (_ BitVec 32)) Unit!39276)

(assert (=> b!1186831 (= lt!538588 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1186832 () Bool)

(declare-fun e!674903 () Unit!39276)

(declare-fun Unit!39278 () Unit!39276)

(assert (=> b!1186832 (= e!674903 Unit!39278)))

(declare-fun b!1186833 () Bool)

(declare-fun e!674897 () Bool)

(assert (=> b!1186833 (= e!674904 e!674897)))

(declare-fun res!788588 () Bool)

(assert (=> b!1186833 (=> res!788588 e!674897)))

(assert (=> b!1186833 (= res!788588 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!44985 0))(
  ( (V!44986 (val!15003 Int)) )
))
(declare-fun zeroValue!944 () V!44985)

(declare-datatypes ((tuple2!19288 0))(
  ( (tuple2!19289 (_1!9655 (_ BitVec 64)) (_2!9655 V!44985)) )
))
(declare-datatypes ((List!26023 0))(
  ( (Nil!26020) (Cons!26019 (h!27237 tuple2!19288) (t!38370 List!26023)) )
))
(declare-datatypes ((ListLongMap!17265 0))(
  ( (ListLongMap!17266 (toList!8648 List!26023)) )
))
(declare-fun lt!538590 () ListLongMap!17265)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14237 0))(
  ( (ValueCellFull!14237 (v!17637 V!44985)) (EmptyCell!14237) )
))
(declare-datatypes ((array!76633 0))(
  ( (array!76634 (arr!36960 (Array (_ BitVec 32) ValueCell!14237)) (size!37497 (_ BitVec 32))) )
))
(declare-fun lt!538587 () array!76633)

(declare-fun minValue!944 () V!44985)

(declare-fun lt!538583 () array!76631)

(declare-fun getCurrentListMapNoExtraKeys!5119 (array!76631 array!76633 (_ BitVec 32) (_ BitVec 32) V!44985 V!44985 (_ BitVec 32) Int) ListLongMap!17265)

(assert (=> b!1186833 (= lt!538590 (getCurrentListMapNoExtraKeys!5119 lt!538583 lt!538587 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!76633)

(declare-fun lt!538593 () V!44985)

(assert (=> b!1186833 (= lt!538587 (array!76634 (store (arr!36960 _values!996) i!673 (ValueCellFull!14237 lt!538593)) (size!37497 _values!996)))))

(declare-fun dynLambda!3080 (Int (_ BitVec 64)) V!44985)

(assert (=> b!1186833 (= lt!538593 (dynLambda!3080 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!538597 () ListLongMap!17265)

(assert (=> b!1186833 (= lt!538597 (getCurrentListMapNoExtraKeys!5119 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!46667 () Bool)

(declare-fun mapRes!46667 () Bool)

(declare-fun tp!88803 () Bool)

(declare-fun e!674895 () Bool)

(assert (=> mapNonEmpty!46667 (= mapRes!46667 (and tp!88803 e!674895))))

(declare-fun mapKey!46667 () (_ BitVec 32))

(declare-fun mapValue!46667 () ValueCell!14237)

(declare-fun mapRest!46667 () (Array (_ BitVec 32) ValueCell!14237))

(assert (=> mapNonEmpty!46667 (= (arr!36960 _values!996) (store mapRest!46667 mapKey!46667 mapValue!46667))))

(declare-fun b!1186834 () Bool)

(declare-fun res!788582 () Bool)

(assert (=> b!1186834 (=> (not res!788582) (not e!674901))))

(assert (=> b!1186834 (= res!788582 (and (= (size!37497 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37496 _keys!1208) (size!37497 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1186835 () Bool)

(declare-fun res!788579 () Bool)

(assert (=> b!1186835 (=> (not res!788579) (not e!674901))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1186835 (= res!788579 (validKeyInArray!0 k0!934))))

(declare-fun b!1186836 () Bool)

(declare-fun e!674906 () Bool)

(declare-fun e!674900 () Bool)

(assert (=> b!1186836 (= e!674906 (and e!674900 mapRes!46667))))

(declare-fun condMapEmpty!46667 () Bool)

(declare-fun mapDefault!46667 () ValueCell!14237)

(assert (=> b!1186836 (= condMapEmpty!46667 (= (arr!36960 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14237)) mapDefault!46667)))))

(declare-fun b!1186837 () Bool)

(declare-fun e!674899 () Bool)

(assert (=> b!1186837 (= e!674899 true)))

(declare-fun lt!538599 () ListLongMap!17265)

(declare-fun lt!538598 () ListLongMap!17265)

(declare-fun -!1668 (ListLongMap!17265 (_ BitVec 64)) ListLongMap!17265)

(assert (=> b!1186837 (= (-!1668 lt!538599 k0!934) lt!538598)))

(declare-fun lt!538600 () ListLongMap!17265)

(declare-fun lt!538585 () Unit!39276)

(declare-fun lt!538594 () V!44985)

(declare-fun addRemoveCommutativeForDiffKeys!181 (ListLongMap!17265 (_ BitVec 64) V!44985 (_ BitVec 64)) Unit!39276)

(assert (=> b!1186837 (= lt!538585 (addRemoveCommutativeForDiffKeys!181 lt!538600 (select (arr!36959 _keys!1208) from!1455) lt!538594 k0!934))))

(declare-fun lt!538584 () ListLongMap!17265)

(declare-fun lt!538589 () ListLongMap!17265)

(assert (=> b!1186837 (and (= lt!538597 lt!538599) (= lt!538584 lt!538589))))

(declare-fun lt!538586 () tuple2!19288)

(declare-fun +!3965 (ListLongMap!17265 tuple2!19288) ListLongMap!17265)

(assert (=> b!1186837 (= lt!538599 (+!3965 lt!538600 lt!538586))))

(assert (=> b!1186837 (not (= (select (arr!36959 _keys!1208) from!1455) k0!934))))

(declare-fun lt!538595 () Unit!39276)

(assert (=> b!1186837 (= lt!538595 e!674903)))

(declare-fun c!117566 () Bool)

(assert (=> b!1186837 (= c!117566 (= (select (arr!36959 _keys!1208) from!1455) k0!934))))

(declare-fun e!674902 () Bool)

(assert (=> b!1186837 e!674902))

(declare-fun res!788585 () Bool)

(assert (=> b!1186837 (=> (not res!788585) (not e!674902))))

(assert (=> b!1186837 (= res!788585 (= lt!538590 lt!538598))))

(assert (=> b!1186837 (= lt!538598 (+!3965 lt!538584 lt!538586))))

(assert (=> b!1186837 (= lt!538586 (tuple2!19289 (select (arr!36959 _keys!1208) from!1455) lt!538594))))

(declare-fun get!18964 (ValueCell!14237 V!44985) V!44985)

(assert (=> b!1186837 (= lt!538594 (get!18964 (select (arr!36960 _values!996) from!1455) lt!538593))))

(declare-fun mapIsEmpty!46667 () Bool)

(assert (=> mapIsEmpty!46667 mapRes!46667))

(declare-fun res!788584 () Bool)

(assert (=> start!100020 (=> (not res!788584) (not e!674901))))

(assert (=> start!100020 (= res!788584 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37496 _keys!1208))))))

(assert (=> start!100020 e!674901))

(declare-fun tp_is_empty!29893 () Bool)

(assert (=> start!100020 tp_is_empty!29893))

(declare-fun array_inv!28280 (array!76631) Bool)

(assert (=> start!100020 (array_inv!28280 _keys!1208)))

(assert (=> start!100020 true))

(assert (=> start!100020 tp!88802))

(declare-fun array_inv!28281 (array!76633) Bool)

(assert (=> start!100020 (and (array_inv!28281 _values!996) e!674906)))

(declare-fun b!1186838 () Bool)

(declare-fun res!788581 () Bool)

(assert (=> b!1186838 (=> (not res!788581) (not e!674901))))

(declare-datatypes ((List!26024 0))(
  ( (Nil!26021) (Cons!26020 (h!27238 (_ BitVec 64)) (t!38371 List!26024)) )
))
(declare-fun arrayNoDuplicates!0 (array!76631 (_ BitVec 32) List!26024) Bool)

(assert (=> b!1186838 (= res!788581 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26021))))

(declare-fun b!1186839 () Bool)

(assert (=> b!1186839 (= e!674895 tp_is_empty!29893)))

(declare-fun b!1186840 () Bool)

(assert (=> b!1186840 (= e!674901 e!674905)))

(declare-fun res!788578 () Bool)

(assert (=> b!1186840 (=> (not res!788578) (not e!674905))))

(assert (=> b!1186840 (= res!788578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!538583 mask!1564))))

(assert (=> b!1186840 (= lt!538583 (array!76632 (store (arr!36959 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37496 _keys!1208)))))

(declare-fun b!1186841 () Bool)

(assert (=> b!1186841 (= e!674900 tp_is_empty!29893)))

(declare-fun e!674898 () Bool)

(declare-fun b!1186842 () Bool)

(assert (=> b!1186842 (= e!674898 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1186843 () Bool)

(assert (=> b!1186843 (= e!674897 e!674899)))

(declare-fun res!788577 () Bool)

(assert (=> b!1186843 (=> res!788577 e!674899)))

(assert (=> b!1186843 (= res!788577 (not (validKeyInArray!0 (select (arr!36959 _keys!1208) from!1455))))))

(assert (=> b!1186843 (= lt!538589 lt!538584)))

(assert (=> b!1186843 (= lt!538584 (-!1668 lt!538600 k0!934))))

(assert (=> b!1186843 (= lt!538589 (getCurrentListMapNoExtraKeys!5119 lt!538583 lt!538587 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1186843 (= lt!538600 (getCurrentListMapNoExtraKeys!5119 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!538592 () Unit!39276)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!888 (array!76631 array!76633 (_ BitVec 32) (_ BitVec 32) V!44985 V!44985 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39276)

(assert (=> b!1186843 (= lt!538592 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!888 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1186844 () Bool)

(declare-fun Unit!39279 () Unit!39276)

(assert (=> b!1186844 (= e!674903 Unit!39279)))

(declare-fun lt!538582 () Unit!39276)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76631 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39276)

(assert (=> b!1186844 (= lt!538582 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1186844 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!538591 () Unit!39276)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76631 (_ BitVec 32) (_ BitVec 32)) Unit!39276)

(assert (=> b!1186844 (= lt!538591 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1186844 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26021)))

(declare-fun lt!538596 () Unit!39276)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76631 (_ BitVec 64) (_ BitVec 32) List!26024) Unit!39276)

(assert (=> b!1186844 (= lt!538596 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26021))))

(assert (=> b!1186844 false))

(declare-fun b!1186845 () Bool)

(declare-fun res!788580 () Bool)

(assert (=> b!1186845 (=> (not res!788580) (not e!674905))))

(assert (=> b!1186845 (= res!788580 (arrayNoDuplicates!0 lt!538583 #b00000000000000000000000000000000 Nil!26021))))

(declare-fun b!1186846 () Bool)

(assert (=> b!1186846 (= e!674902 e!674898)))

(declare-fun res!788589 () Bool)

(assert (=> b!1186846 (=> res!788589 e!674898)))

(assert (=> b!1186846 (= res!788589 (not (= (select (arr!36959 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1186847 () Bool)

(declare-fun res!788587 () Bool)

(assert (=> b!1186847 (=> (not res!788587) (not e!674901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1186847 (= res!788587 (validMask!0 mask!1564))))

(assert (= (and start!100020 res!788584) b!1186847))

(assert (= (and b!1186847 res!788587) b!1186834))

(assert (= (and b!1186834 res!788582) b!1186830))

(assert (= (and b!1186830 res!788586) b!1186838))

(assert (= (and b!1186838 res!788581) b!1186828))

(assert (= (and b!1186828 res!788591) b!1186835))

(assert (= (and b!1186835 res!788579) b!1186829))

(assert (= (and b!1186829 res!788583) b!1186840))

(assert (= (and b!1186840 res!788578) b!1186845))

(assert (= (and b!1186845 res!788580) b!1186831))

(assert (= (and b!1186831 (not res!788590)) b!1186833))

(assert (= (and b!1186833 (not res!788588)) b!1186843))

(assert (= (and b!1186843 (not res!788577)) b!1186837))

(assert (= (and b!1186837 res!788585) b!1186846))

(assert (= (and b!1186846 (not res!788589)) b!1186842))

(assert (= (and b!1186837 c!117566) b!1186844))

(assert (= (and b!1186837 (not c!117566)) b!1186832))

(assert (= (and b!1186836 condMapEmpty!46667) mapIsEmpty!46667))

(assert (= (and b!1186836 (not condMapEmpty!46667)) mapNonEmpty!46667))

(get-info :version)

(assert (= (and mapNonEmpty!46667 ((_ is ValueCellFull!14237) mapValue!46667)) b!1186839))

(assert (= (and b!1186836 ((_ is ValueCellFull!14237) mapDefault!46667)) b!1186841))

(assert (= start!100020 b!1186836))

(declare-fun b_lambda!20501 () Bool)

(assert (=> (not b_lambda!20501) (not b!1186833)))

(declare-fun t!38369 () Bool)

(declare-fun tb!10167 () Bool)

(assert (=> (and start!100020 (= defaultEntry!1004 defaultEntry!1004) t!38369) tb!10167))

(declare-fun result!20909 () Bool)

(assert (=> tb!10167 (= result!20909 tp_is_empty!29893)))

(assert (=> b!1186833 t!38369))

(declare-fun b_and!41597 () Bool)

(assert (= b_and!41595 (and (=> t!38369 result!20909) b_and!41597)))

(declare-fun m!1095537 () Bool)

(assert (=> b!1186830 m!1095537))

(declare-fun m!1095539 () Bool)

(assert (=> b!1186838 m!1095539))

(declare-fun m!1095541 () Bool)

(assert (=> b!1186840 m!1095541))

(declare-fun m!1095543 () Bool)

(assert (=> b!1186840 m!1095543))

(declare-fun m!1095545 () Bool)

(assert (=> start!100020 m!1095545))

(declare-fun m!1095547 () Bool)

(assert (=> start!100020 m!1095547))

(declare-fun m!1095549 () Bool)

(assert (=> b!1186847 m!1095549))

(declare-fun m!1095551 () Bool)

(assert (=> b!1186846 m!1095551))

(declare-fun m!1095553 () Bool)

(assert (=> mapNonEmpty!46667 m!1095553))

(declare-fun m!1095555 () Bool)

(assert (=> b!1186843 m!1095555))

(declare-fun m!1095557 () Bool)

(assert (=> b!1186843 m!1095557))

(declare-fun m!1095559 () Bool)

(assert (=> b!1186843 m!1095559))

(assert (=> b!1186843 m!1095551))

(assert (=> b!1186843 m!1095551))

(declare-fun m!1095561 () Bool)

(assert (=> b!1186843 m!1095561))

(declare-fun m!1095563 () Bool)

(assert (=> b!1186843 m!1095563))

(declare-fun m!1095565 () Bool)

(assert (=> b!1186844 m!1095565))

(declare-fun m!1095567 () Bool)

(assert (=> b!1186844 m!1095567))

(declare-fun m!1095569 () Bool)

(assert (=> b!1186844 m!1095569))

(declare-fun m!1095571 () Bool)

(assert (=> b!1186844 m!1095571))

(declare-fun m!1095573 () Bool)

(assert (=> b!1186844 m!1095573))

(declare-fun m!1095575 () Bool)

(assert (=> b!1186842 m!1095575))

(declare-fun m!1095577 () Bool)

(assert (=> b!1186829 m!1095577))

(declare-fun m!1095579 () Bool)

(assert (=> b!1186837 m!1095579))

(declare-fun m!1095581 () Bool)

(assert (=> b!1186837 m!1095581))

(assert (=> b!1186837 m!1095579))

(assert (=> b!1186837 m!1095551))

(declare-fun m!1095583 () Bool)

(assert (=> b!1186837 m!1095583))

(declare-fun m!1095585 () Bool)

(assert (=> b!1186837 m!1095585))

(declare-fun m!1095587 () Bool)

(assert (=> b!1186837 m!1095587))

(declare-fun m!1095589 () Bool)

(assert (=> b!1186837 m!1095589))

(assert (=> b!1186837 m!1095551))

(declare-fun m!1095591 () Bool)

(assert (=> b!1186833 m!1095591))

(declare-fun m!1095593 () Bool)

(assert (=> b!1186833 m!1095593))

(declare-fun m!1095595 () Bool)

(assert (=> b!1186833 m!1095595))

(declare-fun m!1095597 () Bool)

(assert (=> b!1186833 m!1095597))

(declare-fun m!1095599 () Bool)

(assert (=> b!1186845 m!1095599))

(declare-fun m!1095601 () Bool)

(assert (=> b!1186835 m!1095601))

(declare-fun m!1095603 () Bool)

(assert (=> b!1186831 m!1095603))

(declare-fun m!1095605 () Bool)

(assert (=> b!1186831 m!1095605))

(check-sat (not b!1186837) (not b!1186830) (not b!1186844) (not b_lambda!20501) (not b!1186845) (not start!100020) (not mapNonEmpty!46667) (not b!1186833) (not b!1186843) tp_is_empty!29893 (not b!1186840) (not b!1186838) (not b!1186835) (not b!1186847) (not b!1186831) (not b!1186842) b_and!41597 (not b_next!25363))
(check-sat b_and!41597 (not b_next!25363))
