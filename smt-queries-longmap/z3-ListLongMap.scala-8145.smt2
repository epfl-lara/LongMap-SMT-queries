; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99730 () Bool)

(assert start!99730)

(declare-fun b_free!25315 () Bool)

(declare-fun b_next!25315 () Bool)

(assert (=> start!99730 (= b_free!25315 (not b_next!25315))))

(declare-fun tp!88659 () Bool)

(declare-fun b_and!41475 () Bool)

(assert (=> start!99730 (= tp!88659 b_and!41475)))

(declare-fun b!1183927 () Bool)

(declare-fun e!673124 () Bool)

(declare-fun e!673131 () Bool)

(assert (=> b!1183927 (= e!673124 e!673131)))

(declare-fun res!786936 () Bool)

(assert (=> b!1183927 (=> res!786936 e!673131)))

(declare-datatypes ((array!76424 0))(
  ( (array!76425 (arr!36862 (Array (_ BitVec 32) (_ BitVec 64))) (size!37400 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76424)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1183927 (= res!786936 (not (= (select (arr!36862 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1183928 () Bool)

(declare-fun res!786929 () Bool)

(declare-fun e!673121 () Bool)

(assert (=> b!1183928 (=> (not res!786929) (not e!673121))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1183928 (= res!786929 (validMask!0 mask!1564))))

(declare-fun b!1183929 () Bool)

(declare-fun e!673128 () Bool)

(assert (=> b!1183929 (= e!673128 true)))

(declare-datatypes ((V!44921 0))(
  ( (V!44922 (val!14979 Int)) )
))
(declare-datatypes ((tuple2!19316 0))(
  ( (tuple2!19317 (_1!9669 (_ BitVec 64)) (_2!9669 V!44921)) )
))
(declare-datatypes ((List!26026 0))(
  ( (Nil!26023) (Cons!26022 (h!27231 tuple2!19316) (t!38324 List!26026)) )
))
(declare-datatypes ((ListLongMap!17285 0))(
  ( (ListLongMap!17286 (toList!8658 List!26026)) )
))
(declare-fun lt!536543 () ListLongMap!17285)

(declare-fun lt!536549 () ListLongMap!17285)

(declare-fun -!1612 (ListLongMap!17285 (_ BitVec 64)) ListLongMap!17285)

(assert (=> b!1183929 (= (-!1612 lt!536543 k0!934) lt!536549)))

(declare-datatypes ((Unit!39061 0))(
  ( (Unit!39062) )
))
(declare-fun lt!536541 () Unit!39061)

(declare-fun lt!536540 () V!44921)

(declare-fun lt!536554 () ListLongMap!17285)

(declare-fun addRemoveCommutativeForDiffKeys!158 (ListLongMap!17285 (_ BitVec 64) V!44921 (_ BitVec 64)) Unit!39061)

(assert (=> b!1183929 (= lt!536541 (addRemoveCommutativeForDiffKeys!158 lt!536554 (select (arr!36862 _keys!1208) from!1455) lt!536540 k0!934))))

(declare-fun lt!536550 () ListLongMap!17285)

(declare-fun lt!536547 () ListLongMap!17285)

(declare-fun lt!536538 () ListLongMap!17285)

(assert (=> b!1183929 (and (= lt!536538 lt!536543) (= lt!536547 lt!536550))))

(declare-fun lt!536552 () tuple2!19316)

(declare-fun +!3944 (ListLongMap!17285 tuple2!19316) ListLongMap!17285)

(assert (=> b!1183929 (= lt!536543 (+!3944 lt!536554 lt!536552))))

(assert (=> b!1183929 (not (= (select (arr!36862 _keys!1208) from!1455) k0!934))))

(declare-fun lt!536556 () Unit!39061)

(declare-fun e!673122 () Unit!39061)

(assert (=> b!1183929 (= lt!536556 e!673122)))

(declare-fun c!117070 () Bool)

(assert (=> b!1183929 (= c!117070 (= (select (arr!36862 _keys!1208) from!1455) k0!934))))

(assert (=> b!1183929 e!673124))

(declare-fun res!786934 () Bool)

(assert (=> b!1183929 (=> (not res!786934) (not e!673124))))

(declare-fun lt!536544 () ListLongMap!17285)

(assert (=> b!1183929 (= res!786934 (= lt!536544 lt!536549))))

(assert (=> b!1183929 (= lt!536549 (+!3944 lt!536547 lt!536552))))

(assert (=> b!1183929 (= lt!536552 (tuple2!19317 (select (arr!36862 _keys!1208) from!1455) lt!536540))))

(declare-fun lt!536548 () V!44921)

(declare-datatypes ((ValueCell!14213 0))(
  ( (ValueCellFull!14213 (v!17616 V!44921)) (EmptyCell!14213) )
))
(declare-datatypes ((array!76426 0))(
  ( (array!76427 (arr!36863 (Array (_ BitVec 32) ValueCell!14213)) (size!37401 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76426)

(declare-fun get!18871 (ValueCell!14213 V!44921) V!44921)

(assert (=> b!1183929 (= lt!536540 (get!18871 (select (arr!36863 _values!996) from!1455) lt!536548))))

(declare-fun b!1183930 () Bool)

(declare-fun res!786933 () Bool)

(assert (=> b!1183930 (=> (not res!786933) (not e!673121))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1183930 (= res!786933 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37400 _keys!1208))))))

(declare-fun b!1183931 () Bool)

(declare-fun e!673129 () Bool)

(declare-fun tp_is_empty!29845 () Bool)

(assert (=> b!1183931 (= e!673129 tp_is_empty!29845)))

(declare-fun b!1183932 () Bool)

(declare-fun res!786937 () Bool)

(assert (=> b!1183932 (=> (not res!786937) (not e!673121))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1183932 (= res!786937 (and (= (size!37401 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37400 _keys!1208) (size!37401 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!786935 () Bool)

(assert (=> start!99730 (=> (not res!786935) (not e!673121))))

(assert (=> start!99730 (= res!786935 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37400 _keys!1208))))))

(assert (=> start!99730 e!673121))

(assert (=> start!99730 tp_is_empty!29845))

(declare-fun array_inv!28246 (array!76424) Bool)

(assert (=> start!99730 (array_inv!28246 _keys!1208)))

(assert (=> start!99730 true))

(assert (=> start!99730 tp!88659))

(declare-fun e!673130 () Bool)

(declare-fun array_inv!28247 (array!76426) Bool)

(assert (=> start!99730 (and (array_inv!28247 _values!996) e!673130)))

(declare-fun b!1183933 () Bool)

(declare-fun e!673127 () Bool)

(declare-fun e!673123 () Bool)

(assert (=> b!1183933 (= e!673127 (not e!673123))))

(declare-fun res!786930 () Bool)

(assert (=> b!1183933 (=> res!786930 e!673123)))

(assert (=> b!1183933 (= res!786930 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76424 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1183933 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!536542 () Unit!39061)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76424 (_ BitVec 64) (_ BitVec 32)) Unit!39061)

(assert (=> b!1183933 (= lt!536542 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1183934 () Bool)

(declare-fun res!786923 () Bool)

(assert (=> b!1183934 (=> (not res!786923) (not e!673121))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1183934 (= res!786923 (validKeyInArray!0 k0!934))))

(declare-fun b!1183935 () Bool)

(declare-fun e!673126 () Bool)

(assert (=> b!1183935 (= e!673126 e!673128)))

(declare-fun res!786928 () Bool)

(assert (=> b!1183935 (=> res!786928 e!673128)))

(assert (=> b!1183935 (= res!786928 (not (validKeyInArray!0 (select (arr!36862 _keys!1208) from!1455))))))

(assert (=> b!1183935 (= lt!536550 lt!536547)))

(assert (=> b!1183935 (= lt!536547 (-!1612 lt!536554 k0!934))))

(declare-fun zeroValue!944 () V!44921)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!536546 () array!76426)

(declare-fun minValue!944 () V!44921)

(declare-fun lt!536555 () array!76424)

(declare-fun getCurrentListMapNoExtraKeys!5113 (array!76424 array!76426 (_ BitVec 32) (_ BitVec 32) V!44921 V!44921 (_ BitVec 32) Int) ListLongMap!17285)

(assert (=> b!1183935 (= lt!536550 (getCurrentListMapNoExtraKeys!5113 lt!536555 lt!536546 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1183935 (= lt!536554 (getCurrentListMapNoExtraKeys!5113 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!536545 () Unit!39061)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!874 (array!76424 array!76426 (_ BitVec 32) (_ BitVec 32) V!44921 V!44921 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39061)

(assert (=> b!1183935 (= lt!536545 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!874 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!46595 () Bool)

(declare-fun mapRes!46595 () Bool)

(assert (=> mapIsEmpty!46595 mapRes!46595))

(declare-fun mapNonEmpty!46595 () Bool)

(declare-fun tp!88658 () Bool)

(assert (=> mapNonEmpty!46595 (= mapRes!46595 (and tp!88658 e!673129))))

(declare-fun mapRest!46595 () (Array (_ BitVec 32) ValueCell!14213))

(declare-fun mapKey!46595 () (_ BitVec 32))

(declare-fun mapValue!46595 () ValueCell!14213)

(assert (=> mapNonEmpty!46595 (= (arr!36863 _values!996) (store mapRest!46595 mapKey!46595 mapValue!46595))))

(declare-fun b!1183936 () Bool)

(declare-fun e!673132 () Bool)

(assert (=> b!1183936 (= e!673130 (and e!673132 mapRes!46595))))

(declare-fun condMapEmpty!46595 () Bool)

(declare-fun mapDefault!46595 () ValueCell!14213)

(assert (=> b!1183936 (= condMapEmpty!46595 (= (arr!36863 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14213)) mapDefault!46595)))))

(declare-fun b!1183937 () Bool)

(declare-fun res!786925 () Bool)

(assert (=> b!1183937 (=> (not res!786925) (not e!673121))))

(declare-datatypes ((List!26027 0))(
  ( (Nil!26024) (Cons!26023 (h!27232 (_ BitVec 64)) (t!38325 List!26027)) )
))
(declare-fun arrayNoDuplicates!0 (array!76424 (_ BitVec 32) List!26027) Bool)

(assert (=> b!1183937 (= res!786925 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26024))))

(declare-fun b!1183938 () Bool)

(assert (=> b!1183938 (= e!673131 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1183939 () Bool)

(declare-fun Unit!39063 () Unit!39061)

(assert (=> b!1183939 (= e!673122 Unit!39063)))

(declare-fun lt!536551 () Unit!39061)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76424 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39061)

(assert (=> b!1183939 (= lt!536551 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1183939 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!536539 () Unit!39061)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76424 (_ BitVec 32) (_ BitVec 32)) Unit!39061)

(assert (=> b!1183939 (= lt!536539 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1183939 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26024)))

(declare-fun lt!536553 () Unit!39061)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76424 (_ BitVec 64) (_ BitVec 32) List!26027) Unit!39061)

(assert (=> b!1183939 (= lt!536553 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26024))))

(assert (=> b!1183939 false))

(declare-fun b!1183940 () Bool)

(assert (=> b!1183940 (= e!673132 tp_is_empty!29845)))

(declare-fun b!1183941 () Bool)

(declare-fun res!786931 () Bool)

(assert (=> b!1183941 (=> (not res!786931) (not e!673121))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76424 (_ BitVec 32)) Bool)

(assert (=> b!1183941 (= res!786931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1183942 () Bool)

(assert (=> b!1183942 (= e!673123 e!673126)))

(declare-fun res!786926 () Bool)

(assert (=> b!1183942 (=> res!786926 e!673126)))

(assert (=> b!1183942 (= res!786926 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1183942 (= lt!536544 (getCurrentListMapNoExtraKeys!5113 lt!536555 lt!536546 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1183942 (= lt!536546 (array!76427 (store (arr!36863 _values!996) i!673 (ValueCellFull!14213 lt!536548)) (size!37401 _values!996)))))

(declare-fun dynLambda!3016 (Int (_ BitVec 64)) V!44921)

(assert (=> b!1183942 (= lt!536548 (dynLambda!3016 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1183942 (= lt!536538 (getCurrentListMapNoExtraKeys!5113 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1183943 () Bool)

(assert (=> b!1183943 (= e!673121 e!673127)))

(declare-fun res!786924 () Bool)

(assert (=> b!1183943 (=> (not res!786924) (not e!673127))))

(assert (=> b!1183943 (= res!786924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!536555 mask!1564))))

(assert (=> b!1183943 (= lt!536555 (array!76425 (store (arr!36862 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37400 _keys!1208)))))

(declare-fun b!1183944 () Bool)

(declare-fun res!786927 () Bool)

(assert (=> b!1183944 (=> (not res!786927) (not e!673121))))

(assert (=> b!1183944 (= res!786927 (= (select (arr!36862 _keys!1208) i!673) k0!934))))

(declare-fun b!1183945 () Bool)

(declare-fun res!786932 () Bool)

(assert (=> b!1183945 (=> (not res!786932) (not e!673127))))

(assert (=> b!1183945 (= res!786932 (arrayNoDuplicates!0 lt!536555 #b00000000000000000000000000000000 Nil!26024))))

(declare-fun b!1183946 () Bool)

(declare-fun Unit!39064 () Unit!39061)

(assert (=> b!1183946 (= e!673122 Unit!39064)))

(assert (= (and start!99730 res!786935) b!1183928))

(assert (= (and b!1183928 res!786929) b!1183932))

(assert (= (and b!1183932 res!786937) b!1183941))

(assert (= (and b!1183941 res!786931) b!1183937))

(assert (= (and b!1183937 res!786925) b!1183930))

(assert (= (and b!1183930 res!786933) b!1183934))

(assert (= (and b!1183934 res!786923) b!1183944))

(assert (= (and b!1183944 res!786927) b!1183943))

(assert (= (and b!1183943 res!786924) b!1183945))

(assert (= (and b!1183945 res!786932) b!1183933))

(assert (= (and b!1183933 (not res!786930)) b!1183942))

(assert (= (and b!1183942 (not res!786926)) b!1183935))

(assert (= (and b!1183935 (not res!786928)) b!1183929))

(assert (= (and b!1183929 res!786934) b!1183927))

(assert (= (and b!1183927 (not res!786936)) b!1183938))

(assert (= (and b!1183929 c!117070) b!1183939))

(assert (= (and b!1183929 (not c!117070)) b!1183946))

(assert (= (and b!1183936 condMapEmpty!46595) mapIsEmpty!46595))

(assert (= (and b!1183936 (not condMapEmpty!46595)) mapNonEmpty!46595))

(get-info :version)

(assert (= (and mapNonEmpty!46595 ((_ is ValueCellFull!14213) mapValue!46595)) b!1183931))

(assert (= (and b!1183936 ((_ is ValueCellFull!14213) mapDefault!46595)) b!1183940))

(assert (= start!99730 b!1183936))

(declare-fun b_lambda!20441 () Bool)

(assert (=> (not b_lambda!20441) (not b!1183942)))

(declare-fun t!38323 () Bool)

(declare-fun tb!10119 () Bool)

(assert (=> (and start!99730 (= defaultEntry!1004 defaultEntry!1004) t!38323) tb!10119))

(declare-fun result!20813 () Bool)

(assert (=> tb!10119 (= result!20813 tp_is_empty!29845)))

(assert (=> b!1183942 t!38323))

(declare-fun b_and!41477 () Bool)

(assert (= b_and!41475 (and (=> t!38323 result!20813) b_and!41477)))

(declare-fun m!1091675 () Bool)

(assert (=> b!1183939 m!1091675))

(declare-fun m!1091677 () Bool)

(assert (=> b!1183939 m!1091677))

(declare-fun m!1091679 () Bool)

(assert (=> b!1183939 m!1091679))

(declare-fun m!1091681 () Bool)

(assert (=> b!1183939 m!1091681))

(declare-fun m!1091683 () Bool)

(assert (=> b!1183939 m!1091683))

(declare-fun m!1091685 () Bool)

(assert (=> b!1183934 m!1091685))

(declare-fun m!1091687 () Bool)

(assert (=> b!1183943 m!1091687))

(declare-fun m!1091689 () Bool)

(assert (=> b!1183943 m!1091689))

(declare-fun m!1091691 () Bool)

(assert (=> b!1183933 m!1091691))

(declare-fun m!1091693 () Bool)

(assert (=> b!1183933 m!1091693))

(declare-fun m!1091695 () Bool)

(assert (=> b!1183942 m!1091695))

(declare-fun m!1091697 () Bool)

(assert (=> b!1183942 m!1091697))

(declare-fun m!1091699 () Bool)

(assert (=> b!1183942 m!1091699))

(declare-fun m!1091701 () Bool)

(assert (=> b!1183942 m!1091701))

(declare-fun m!1091703 () Bool)

(assert (=> b!1183927 m!1091703))

(declare-fun m!1091705 () Bool)

(assert (=> b!1183937 m!1091705))

(declare-fun m!1091707 () Bool)

(assert (=> b!1183944 m!1091707))

(declare-fun m!1091709 () Bool)

(assert (=> b!1183938 m!1091709))

(declare-fun m!1091711 () Bool)

(assert (=> b!1183941 m!1091711))

(declare-fun m!1091713 () Bool)

(assert (=> b!1183928 m!1091713))

(declare-fun m!1091715 () Bool)

(assert (=> b!1183945 m!1091715))

(declare-fun m!1091717 () Bool)

(assert (=> mapNonEmpty!46595 m!1091717))

(declare-fun m!1091719 () Bool)

(assert (=> b!1183929 m!1091719))

(declare-fun m!1091721 () Bool)

(assert (=> b!1183929 m!1091721))

(declare-fun m!1091723 () Bool)

(assert (=> b!1183929 m!1091723))

(assert (=> b!1183929 m!1091719))

(declare-fun m!1091725 () Bool)

(assert (=> b!1183929 m!1091725))

(assert (=> b!1183929 m!1091703))

(declare-fun m!1091727 () Bool)

(assert (=> b!1183929 m!1091727))

(assert (=> b!1183929 m!1091703))

(declare-fun m!1091729 () Bool)

(assert (=> b!1183929 m!1091729))

(declare-fun m!1091731 () Bool)

(assert (=> b!1183935 m!1091731))

(declare-fun m!1091733 () Bool)

(assert (=> b!1183935 m!1091733))

(declare-fun m!1091735 () Bool)

(assert (=> b!1183935 m!1091735))

(assert (=> b!1183935 m!1091703))

(declare-fun m!1091737 () Bool)

(assert (=> b!1183935 m!1091737))

(declare-fun m!1091739 () Bool)

(assert (=> b!1183935 m!1091739))

(assert (=> b!1183935 m!1091703))

(declare-fun m!1091741 () Bool)

(assert (=> start!99730 m!1091741))

(declare-fun m!1091743 () Bool)

(assert (=> start!99730 m!1091743))

(check-sat (not start!99730) (not b!1183929) (not b!1183942) (not b_lambda!20441) (not b!1183945) b_and!41477 (not b!1183938) (not b_next!25315) (not b!1183943) (not b!1183937) (not mapNonEmpty!46595) (not b!1183935) (not b!1183939) tp_is_empty!29845 (not b!1183934) (not b!1183941) (not b!1183933) (not b!1183928))
(check-sat b_and!41477 (not b_next!25315))
