; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99990 () Bool)

(assert start!99990)

(declare-fun b_free!25333 () Bool)

(declare-fun b_next!25333 () Bool)

(assert (=> start!99990 (= b_free!25333 (not b_next!25333))))

(declare-fun tp!88712 () Bool)

(declare-fun b_and!41535 () Bool)

(assert (=> start!99990 (= tp!88712 b_and!41535)))

(declare-fun b!1185898 () Bool)

(declare-fun res!787914 () Bool)

(declare-fun e!674358 () Bool)

(assert (=> b!1185898 (=> (not res!787914) (not e!674358))))

(declare-datatypes ((array!76571 0))(
  ( (array!76572 (arr!36929 (Array (_ BitVec 32) (_ BitVec 64))) (size!37466 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76571)

(declare-datatypes ((List!25995 0))(
  ( (Nil!25992) (Cons!25991 (h!27209 (_ BitVec 64)) (t!38312 List!25995)) )
))
(declare-fun arrayNoDuplicates!0 (array!76571 (_ BitVec 32) List!25995) Bool)

(assert (=> b!1185898 (= res!787914 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25992))))

(declare-fun b!1185900 () Bool)

(declare-fun res!787911 () Bool)

(declare-fun e!674360 () Bool)

(assert (=> b!1185900 (=> (not res!787911) (not e!674360))))

(declare-fun lt!537743 () array!76571)

(assert (=> b!1185900 (= res!787911 (arrayNoDuplicates!0 lt!537743 #b00000000000000000000000000000000 Nil!25992))))

(declare-fun b!1185901 () Bool)

(declare-fun res!787907 () Bool)

(assert (=> b!1185901 (=> (not res!787907) (not e!674358))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1185901 (= res!787907 (= (select (arr!36929 _keys!1208) i!673) k0!934))))

(declare-fun b!1185902 () Bool)

(declare-fun e!674355 () Bool)

(assert (=> b!1185902 (= e!674360 (not e!674355))))

(declare-fun res!787912 () Bool)

(assert (=> b!1185902 (=> res!787912 e!674355)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1185902 (= res!787912 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76571 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1185902 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39226 0))(
  ( (Unit!39227) )
))
(declare-fun lt!537744 () Unit!39226)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76571 (_ BitVec 64) (_ BitVec 32)) Unit!39226)

(assert (=> b!1185902 (= lt!537744 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1185903 () Bool)

(declare-fun res!787909 () Bool)

(assert (=> b!1185903 (=> (not res!787909) (not e!674358))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76571 (_ BitVec 32)) Bool)

(assert (=> b!1185903 (= res!787909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1185904 () Bool)

(declare-fun res!787913 () Bool)

(assert (=> b!1185904 (=> (not res!787913) (not e!674358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1185904 (= res!787913 (validMask!0 mask!1564))))

(declare-fun b!1185905 () Bool)

(declare-fun e!674359 () Bool)

(assert (=> b!1185905 (= e!674359 true)))

(declare-datatypes ((V!44945 0))(
  ( (V!44946 (val!14988 Int)) )
))
(declare-datatypes ((tuple2!19262 0))(
  ( (tuple2!19263 (_1!9642 (_ BitVec 64)) (_2!9642 V!44945)) )
))
(declare-datatypes ((List!25996 0))(
  ( (Nil!25993) (Cons!25992 (h!27210 tuple2!19262) (t!38313 List!25996)) )
))
(declare-datatypes ((ListLongMap!17239 0))(
  ( (ListLongMap!17240 (toList!8635 List!25996)) )
))
(declare-fun lt!537735 () ListLongMap!17239)

(declare-fun lt!537741 () ListLongMap!17239)

(declare-fun -!1656 (ListLongMap!17239 (_ BitVec 64)) ListLongMap!17239)

(assert (=> b!1185905 (= (-!1656 lt!537735 k0!934) lt!537741)))

(declare-fun lt!537734 () Unit!39226)

(declare-fun lt!537740 () V!44945)

(declare-fun lt!537738 () ListLongMap!17239)

(declare-fun addRemoveCommutativeForDiffKeys!170 (ListLongMap!17239 (_ BitVec 64) V!44945 (_ BitVec 64)) Unit!39226)

(assert (=> b!1185905 (= lt!537734 (addRemoveCommutativeForDiffKeys!170 lt!537738 (select (arr!36929 _keys!1208) from!1455) lt!537740 k0!934))))

(declare-fun lt!537733 () ListLongMap!17239)

(declare-fun lt!537730 () ListLongMap!17239)

(declare-fun lt!537737 () ListLongMap!17239)

(assert (=> b!1185905 (and (= lt!537730 lt!537735) (= lt!537737 lt!537733))))

(declare-fun lt!537729 () tuple2!19262)

(declare-fun +!3954 (ListLongMap!17239 tuple2!19262) ListLongMap!17239)

(assert (=> b!1185905 (= lt!537735 (+!3954 lt!537738 lt!537729))))

(assert (=> b!1185905 (not (= (select (arr!36929 _keys!1208) from!1455) k0!934))))

(declare-fun lt!537742 () Unit!39226)

(declare-fun e!674364 () Unit!39226)

(assert (=> b!1185905 (= lt!537742 e!674364)))

(declare-fun c!117521 () Bool)

(assert (=> b!1185905 (= c!117521 (= (select (arr!36929 _keys!1208) from!1455) k0!934))))

(declare-fun e!674356 () Bool)

(assert (=> b!1185905 e!674356))

(declare-fun res!787915 () Bool)

(assert (=> b!1185905 (=> (not res!787915) (not e!674356))))

(declare-fun lt!537727 () ListLongMap!17239)

(assert (=> b!1185905 (= res!787915 (= lt!537727 lt!537741))))

(assert (=> b!1185905 (= lt!537741 (+!3954 lt!537737 lt!537729))))

(assert (=> b!1185905 (= lt!537729 (tuple2!19263 (select (arr!36929 _keys!1208) from!1455) lt!537740))))

(declare-fun lt!537728 () V!44945)

(declare-datatypes ((ValueCell!14222 0))(
  ( (ValueCellFull!14222 (v!17622 V!44945)) (EmptyCell!14222) )
))
(declare-datatypes ((array!76573 0))(
  ( (array!76574 (arr!36930 (Array (_ BitVec 32) ValueCell!14222)) (size!37467 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76573)

(declare-fun get!18943 (ValueCell!14222 V!44945) V!44945)

(assert (=> b!1185905 (= lt!537740 (get!18943 (select (arr!36930 _values!996) from!1455) lt!537728))))

(declare-fun b!1185906 () Bool)

(declare-fun e!674365 () Bool)

(declare-fun tp_is_empty!29863 () Bool)

(assert (=> b!1185906 (= e!674365 tp_is_empty!29863)))

(declare-fun mapNonEmpty!46622 () Bool)

(declare-fun mapRes!46622 () Bool)

(declare-fun tp!88713 () Bool)

(declare-fun e!674361 () Bool)

(assert (=> mapNonEmpty!46622 (= mapRes!46622 (and tp!88713 e!674361))))

(declare-fun mapRest!46622 () (Array (_ BitVec 32) ValueCell!14222))

(declare-fun mapKey!46622 () (_ BitVec 32))

(declare-fun mapValue!46622 () ValueCell!14222)

(assert (=> mapNonEmpty!46622 (= (arr!36930 _values!996) (store mapRest!46622 mapKey!46622 mapValue!46622))))

(declare-fun mapIsEmpty!46622 () Bool)

(assert (=> mapIsEmpty!46622 mapRes!46622))

(declare-fun b!1185907 () Bool)

(declare-fun res!787908 () Bool)

(assert (=> b!1185907 (=> (not res!787908) (not e!674358))))

(assert (=> b!1185907 (= res!787908 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37466 _keys!1208))))))

(declare-fun b!1185908 () Bool)

(declare-fun e!674366 () Bool)

(assert (=> b!1185908 (= e!674356 e!674366)))

(declare-fun res!787903 () Bool)

(assert (=> b!1185908 (=> res!787903 e!674366)))

(assert (=> b!1185908 (= res!787903 (not (= (select (arr!36929 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1185909 () Bool)

(assert (=> b!1185909 (= e!674361 tp_is_empty!29863)))

(declare-fun b!1185899 () Bool)

(assert (=> b!1185899 (= e!674366 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun res!787904 () Bool)

(assert (=> start!99990 (=> (not res!787904) (not e!674358))))

(assert (=> start!99990 (= res!787904 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37466 _keys!1208))))))

(assert (=> start!99990 e!674358))

(assert (=> start!99990 tp_is_empty!29863))

(declare-fun array_inv!28256 (array!76571) Bool)

(assert (=> start!99990 (array_inv!28256 _keys!1208)))

(assert (=> start!99990 true))

(assert (=> start!99990 tp!88712))

(declare-fun e!674363 () Bool)

(declare-fun array_inv!28257 (array!76573) Bool)

(assert (=> start!99990 (and (array_inv!28257 _values!996) e!674363)))

(declare-fun b!1185910 () Bool)

(declare-fun Unit!39228 () Unit!39226)

(assert (=> b!1185910 (= e!674364 Unit!39228)))

(declare-fun lt!537739 () Unit!39226)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76571 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39226)

(assert (=> b!1185910 (= lt!537739 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1185910 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!537731 () Unit!39226)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76571 (_ BitVec 32) (_ BitVec 32)) Unit!39226)

(assert (=> b!1185910 (= lt!537731 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1185910 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25992)))

(declare-fun lt!537732 () Unit!39226)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76571 (_ BitVec 64) (_ BitVec 32) List!25995) Unit!39226)

(assert (=> b!1185910 (= lt!537732 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25992))))

(assert (=> b!1185910 false))

(declare-fun b!1185911 () Bool)

(declare-fun res!787902 () Bool)

(assert (=> b!1185911 (=> (not res!787902) (not e!674358))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1185911 (= res!787902 (validKeyInArray!0 k0!934))))

(declare-fun b!1185912 () Bool)

(assert (=> b!1185912 (= e!674363 (and e!674365 mapRes!46622))))

(declare-fun condMapEmpty!46622 () Bool)

(declare-fun mapDefault!46622 () ValueCell!14222)

(assert (=> b!1185912 (= condMapEmpty!46622 (= (arr!36930 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14222)) mapDefault!46622)))))

(declare-fun b!1185913 () Bool)

(declare-fun e!674357 () Bool)

(assert (=> b!1185913 (= e!674355 e!674357)))

(declare-fun res!787905 () Bool)

(assert (=> b!1185913 (=> res!787905 e!674357)))

(assert (=> b!1185913 (= res!787905 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44945)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!537745 () array!76573)

(declare-fun minValue!944 () V!44945)

(declare-fun getCurrentListMapNoExtraKeys!5106 (array!76571 array!76573 (_ BitVec 32) (_ BitVec 32) V!44945 V!44945 (_ BitVec 32) Int) ListLongMap!17239)

(assert (=> b!1185913 (= lt!537727 (getCurrentListMapNoExtraKeys!5106 lt!537743 lt!537745 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1185913 (= lt!537745 (array!76574 (store (arr!36930 _values!996) i!673 (ValueCellFull!14222 lt!537728)) (size!37467 _values!996)))))

(declare-fun dynLambda!3068 (Int (_ BitVec 64)) V!44945)

(assert (=> b!1185913 (= lt!537728 (dynLambda!3068 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1185913 (= lt!537730 (getCurrentListMapNoExtraKeys!5106 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1185914 () Bool)

(assert (=> b!1185914 (= e!674358 e!674360)))

(declare-fun res!787916 () Bool)

(assert (=> b!1185914 (=> (not res!787916) (not e!674360))))

(assert (=> b!1185914 (= res!787916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!537743 mask!1564))))

(assert (=> b!1185914 (= lt!537743 (array!76572 (store (arr!36929 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37466 _keys!1208)))))

(declare-fun b!1185915 () Bool)

(declare-fun Unit!39229 () Unit!39226)

(assert (=> b!1185915 (= e!674364 Unit!39229)))

(declare-fun b!1185916 () Bool)

(assert (=> b!1185916 (= e!674357 e!674359)))

(declare-fun res!787906 () Bool)

(assert (=> b!1185916 (=> res!787906 e!674359)))

(assert (=> b!1185916 (= res!787906 (not (validKeyInArray!0 (select (arr!36929 _keys!1208) from!1455))))))

(assert (=> b!1185916 (= lt!537733 lt!537737)))

(assert (=> b!1185916 (= lt!537737 (-!1656 lt!537738 k0!934))))

(assert (=> b!1185916 (= lt!537733 (getCurrentListMapNoExtraKeys!5106 lt!537743 lt!537745 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1185916 (= lt!537738 (getCurrentListMapNoExtraKeys!5106 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!537736 () Unit!39226)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!877 (array!76571 array!76573 (_ BitVec 32) (_ BitVec 32) V!44945 V!44945 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39226)

(assert (=> b!1185916 (= lt!537736 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!877 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1185917 () Bool)

(declare-fun res!787910 () Bool)

(assert (=> b!1185917 (=> (not res!787910) (not e!674358))))

(assert (=> b!1185917 (= res!787910 (and (= (size!37467 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37466 _keys!1208) (size!37467 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!99990 res!787904) b!1185904))

(assert (= (and b!1185904 res!787913) b!1185917))

(assert (= (and b!1185917 res!787910) b!1185903))

(assert (= (and b!1185903 res!787909) b!1185898))

(assert (= (and b!1185898 res!787914) b!1185907))

(assert (= (and b!1185907 res!787908) b!1185911))

(assert (= (and b!1185911 res!787902) b!1185901))

(assert (= (and b!1185901 res!787907) b!1185914))

(assert (= (and b!1185914 res!787916) b!1185900))

(assert (= (and b!1185900 res!787911) b!1185902))

(assert (= (and b!1185902 (not res!787912)) b!1185913))

(assert (= (and b!1185913 (not res!787905)) b!1185916))

(assert (= (and b!1185916 (not res!787906)) b!1185905))

(assert (= (and b!1185905 res!787915) b!1185908))

(assert (= (and b!1185908 (not res!787903)) b!1185899))

(assert (= (and b!1185905 c!117521) b!1185910))

(assert (= (and b!1185905 (not c!117521)) b!1185915))

(assert (= (and b!1185912 condMapEmpty!46622) mapIsEmpty!46622))

(assert (= (and b!1185912 (not condMapEmpty!46622)) mapNonEmpty!46622))

(get-info :version)

(assert (= (and mapNonEmpty!46622 ((_ is ValueCellFull!14222) mapValue!46622)) b!1185909))

(assert (= (and b!1185912 ((_ is ValueCellFull!14222) mapDefault!46622)) b!1185906))

(assert (= start!99990 b!1185912))

(declare-fun b_lambda!20471 () Bool)

(assert (=> (not b_lambda!20471) (not b!1185913)))

(declare-fun t!38311 () Bool)

(declare-fun tb!10137 () Bool)

(assert (=> (and start!99990 (= defaultEntry!1004 defaultEntry!1004) t!38311) tb!10137))

(declare-fun result!20849 () Bool)

(assert (=> tb!10137 (= result!20849 tp_is_empty!29863)))

(assert (=> b!1185913 t!38311))

(declare-fun b_and!41537 () Bool)

(assert (= b_and!41535 (and (=> t!38311 result!20849) b_and!41537)))

(declare-fun m!1094487 () Bool)

(assert (=> b!1185914 m!1094487))

(declare-fun m!1094489 () Bool)

(assert (=> b!1185914 m!1094489))

(declare-fun m!1094491 () Bool)

(assert (=> b!1185916 m!1094491))

(declare-fun m!1094493 () Bool)

(assert (=> b!1185916 m!1094493))

(declare-fun m!1094495 () Bool)

(assert (=> b!1185916 m!1094495))

(declare-fun m!1094497 () Bool)

(assert (=> b!1185916 m!1094497))

(declare-fun m!1094499 () Bool)

(assert (=> b!1185916 m!1094499))

(declare-fun m!1094501 () Bool)

(assert (=> b!1185916 m!1094501))

(assert (=> b!1185916 m!1094495))

(declare-fun m!1094503 () Bool)

(assert (=> b!1185899 m!1094503))

(declare-fun m!1094505 () Bool)

(assert (=> b!1185904 m!1094505))

(declare-fun m!1094507 () Bool)

(assert (=> b!1185905 m!1094507))

(declare-fun m!1094509 () Bool)

(assert (=> b!1185905 m!1094509))

(assert (=> b!1185905 m!1094495))

(declare-fun m!1094511 () Bool)

(assert (=> b!1185905 m!1094511))

(assert (=> b!1185905 m!1094507))

(declare-fun m!1094513 () Bool)

(assert (=> b!1185905 m!1094513))

(declare-fun m!1094515 () Bool)

(assert (=> b!1185905 m!1094515))

(assert (=> b!1185905 m!1094495))

(declare-fun m!1094517 () Bool)

(assert (=> b!1185905 m!1094517))

(declare-fun m!1094519 () Bool)

(assert (=> b!1185898 m!1094519))

(declare-fun m!1094521 () Bool)

(assert (=> b!1185901 m!1094521))

(declare-fun m!1094523 () Bool)

(assert (=> b!1185900 m!1094523))

(declare-fun m!1094525 () Bool)

(assert (=> mapNonEmpty!46622 m!1094525))

(declare-fun m!1094527 () Bool)

(assert (=> b!1185903 m!1094527))

(declare-fun m!1094529 () Bool)

(assert (=> b!1185913 m!1094529))

(declare-fun m!1094531 () Bool)

(assert (=> b!1185913 m!1094531))

(declare-fun m!1094533 () Bool)

(assert (=> b!1185913 m!1094533))

(declare-fun m!1094535 () Bool)

(assert (=> b!1185913 m!1094535))

(declare-fun m!1094537 () Bool)

(assert (=> b!1185910 m!1094537))

(declare-fun m!1094539 () Bool)

(assert (=> b!1185910 m!1094539))

(declare-fun m!1094541 () Bool)

(assert (=> b!1185910 m!1094541))

(declare-fun m!1094543 () Bool)

(assert (=> b!1185910 m!1094543))

(declare-fun m!1094545 () Bool)

(assert (=> b!1185910 m!1094545))

(assert (=> b!1185908 m!1094495))

(declare-fun m!1094547 () Bool)

(assert (=> start!99990 m!1094547))

(declare-fun m!1094549 () Bool)

(assert (=> start!99990 m!1094549))

(declare-fun m!1094551 () Bool)

(assert (=> b!1185902 m!1094551))

(declare-fun m!1094553 () Bool)

(assert (=> b!1185902 m!1094553))

(declare-fun m!1094555 () Bool)

(assert (=> b!1185911 m!1094555))

(check-sat (not b!1185914) (not mapNonEmpty!46622) (not b_lambda!20471) (not b!1185902) (not start!99990) tp_is_empty!29863 (not b!1185903) (not b!1185905) (not b!1185898) (not b!1185916) (not b!1185900) b_and!41537 (not b!1185904) (not b!1185913) (not b!1185911) (not b!1185899) (not b!1185910) (not b_next!25333))
(check-sat b_and!41537 (not b_next!25333))
