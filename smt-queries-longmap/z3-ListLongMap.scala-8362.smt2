; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101990 () Bool)

(assert start!101990)

(declare-fun b_free!26443 () Bool)

(declare-fun b_next!26443 () Bool)

(assert (=> start!101990 (= b_free!26443 (not b_next!26443))))

(declare-fun tp!92375 () Bool)

(declare-fun b_and!44149 () Bool)

(assert (=> start!101990 (= tp!92375 b_and!44149)))

(declare-fun b!1226483 () Bool)

(declare-fun e!696693 () Bool)

(assert (=> b!1226483 (= e!696693 true)))

(declare-datatypes ((V!46657 0))(
  ( (V!46658 (val!15630 Int)) )
))
(declare-datatypes ((tuple2!20162 0))(
  ( (tuple2!20163 (_1!10092 (_ BitVec 64)) (_2!10092 V!46657)) )
))
(declare-datatypes ((List!26973 0))(
  ( (Nil!26970) (Cons!26969 (h!28187 tuple2!20162) (t!40388 List!26973)) )
))
(declare-datatypes ((ListLongMap!18139 0))(
  ( (ListLongMap!18140 (toList!9085 List!26973)) )
))
(declare-fun lt!558665 () ListLongMap!18139)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!558656 () ListLongMap!18139)

(declare-fun -!1956 (ListLongMap!18139 (_ BitVec 64)) ListLongMap!18139)

(assert (=> b!1226483 (= (-!1956 lt!558665 k0!934) lt!558656)))

(declare-datatypes ((Unit!40578 0))(
  ( (Unit!40579) )
))
(declare-fun lt!558663 () Unit!40578)

(declare-datatypes ((array!79115 0))(
  ( (array!79116 (arr!38178 (Array (_ BitVec 32) (_ BitVec 64))) (size!38715 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79115)

(declare-fun lt!558661 () ListLongMap!18139)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!558667 () V!46657)

(declare-fun addRemoveCommutativeForDiffKeys!219 (ListLongMap!18139 (_ BitVec 64) V!46657 (_ BitVec 64)) Unit!40578)

(assert (=> b!1226483 (= lt!558663 (addRemoveCommutativeForDiffKeys!219 lt!558661 (select (arr!38178 _keys!1208) from!1455) lt!558667 k0!934))))

(declare-fun lt!558658 () ListLongMap!18139)

(declare-fun lt!558666 () ListLongMap!18139)

(declare-fun lt!558662 () ListLongMap!18139)

(assert (=> b!1226483 (and (= lt!558662 lt!558665) (= lt!558658 lt!558666))))

(declare-fun lt!558653 () tuple2!20162)

(declare-fun +!4184 (ListLongMap!18139 tuple2!20162) ListLongMap!18139)

(assert (=> b!1226483 (= lt!558665 (+!4184 lt!558661 lt!558653))))

(assert (=> b!1226483 (not (= (select (arr!38178 _keys!1208) from!1455) k0!934))))

(declare-fun lt!558670 () Unit!40578)

(declare-fun e!696699 () Unit!40578)

(assert (=> b!1226483 (= lt!558670 e!696699)))

(declare-fun c!120883 () Bool)

(assert (=> b!1226483 (= c!120883 (= (select (arr!38178 _keys!1208) from!1455) k0!934))))

(declare-fun e!696698 () Bool)

(assert (=> b!1226483 e!696698))

(declare-fun res!814689 () Bool)

(assert (=> b!1226483 (=> (not res!814689) (not e!696698))))

(declare-fun lt!558669 () ListLongMap!18139)

(assert (=> b!1226483 (= res!814689 (= lt!558669 lt!558656))))

(assert (=> b!1226483 (= lt!558656 (+!4184 lt!558658 lt!558653))))

(assert (=> b!1226483 (= lt!558653 (tuple2!20163 (select (arr!38178 _keys!1208) from!1455) lt!558667))))

(declare-datatypes ((ValueCell!14864 0))(
  ( (ValueCellFull!14864 (v!18288 V!46657)) (EmptyCell!14864) )
))
(declare-datatypes ((array!79117 0))(
  ( (array!79118 (arr!38179 (Array (_ BitVec 32) ValueCell!14864)) (size!38716 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79117)

(declare-fun lt!558655 () V!46657)

(declare-fun get!19546 (ValueCell!14864 V!46657) V!46657)

(assert (=> b!1226483 (= lt!558667 (get!19546 (select (arr!38179 _values!996) from!1455) lt!558655))))

(declare-fun mapNonEmpty!48619 () Bool)

(declare-fun mapRes!48619 () Bool)

(declare-fun tp!92374 () Bool)

(declare-fun e!696702 () Bool)

(assert (=> mapNonEmpty!48619 (= mapRes!48619 (and tp!92374 e!696702))))

(declare-fun mapKey!48619 () (_ BitVec 32))

(declare-fun mapValue!48619 () ValueCell!14864)

(declare-fun mapRest!48619 () (Array (_ BitVec 32) ValueCell!14864))

(assert (=> mapNonEmpty!48619 (= (arr!38179 _values!996) (store mapRest!48619 mapKey!48619 mapValue!48619))))

(declare-fun b!1226484 () Bool)

(declare-fun res!814694 () Bool)

(declare-fun e!696697 () Bool)

(assert (=> b!1226484 (=> (not res!814694) (not e!696697))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226484 (= res!814694 (validKeyInArray!0 k0!934))))

(declare-fun b!1226485 () Bool)

(declare-fun e!696701 () Bool)

(assert (=> b!1226485 (= e!696698 e!696701)))

(declare-fun res!814688 () Bool)

(assert (=> b!1226485 (=> res!814688 e!696701)))

(assert (=> b!1226485 (= res!814688 (not (= (select (arr!38178 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1226486 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1226486 (= e!696701 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1226487 () Bool)

(declare-fun Unit!40580 () Unit!40578)

(assert (=> b!1226487 (= e!696699 Unit!40580)))

(declare-fun b!1226488 () Bool)

(declare-fun res!814687 () Bool)

(assert (=> b!1226488 (=> (not res!814687) (not e!696697))))

(assert (=> b!1226488 (= res!814687 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38715 _keys!1208))))))

(declare-fun b!1226489 () Bool)

(declare-fun res!814684 () Bool)

(assert (=> b!1226489 (=> (not res!814684) (not e!696697))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1226489 (= res!814684 (and (= (size!38716 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38715 _keys!1208) (size!38716 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1226490 () Bool)

(declare-fun e!696692 () Bool)

(declare-fun tp_is_empty!31147 () Bool)

(assert (=> b!1226490 (= e!696692 tp_is_empty!31147)))

(declare-fun b!1226491 () Bool)

(declare-fun Unit!40581 () Unit!40578)

(assert (=> b!1226491 (= e!696699 Unit!40581)))

(declare-fun lt!558657 () Unit!40578)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79115 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40578)

(assert (=> b!1226491 (= lt!558657 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1226491 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!558659 () Unit!40578)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!79115 (_ BitVec 32) (_ BitVec 32)) Unit!40578)

(assert (=> b!1226491 (= lt!558659 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26974 0))(
  ( (Nil!26971) (Cons!26970 (h!28188 (_ BitVec 64)) (t!40389 List!26974)) )
))
(declare-fun arrayNoDuplicates!0 (array!79115 (_ BitVec 32) List!26974) Bool)

(assert (=> b!1226491 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26971)))

(declare-fun lt!558664 () Unit!40578)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!79115 (_ BitVec 64) (_ BitVec 32) List!26974) Unit!40578)

(assert (=> b!1226491 (= lt!558664 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26971))))

(assert (=> b!1226491 false))

(declare-fun b!1226492 () Bool)

(declare-fun e!696696 () Bool)

(declare-fun e!696694 () Bool)

(assert (=> b!1226492 (= e!696696 (not e!696694))))

(declare-fun res!814696 () Bool)

(assert (=> b!1226492 (=> res!814696 e!696694)))

(assert (=> b!1226492 (= res!814696 (bvsgt from!1455 i!673))))

(assert (=> b!1226492 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!558660 () Unit!40578)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79115 (_ BitVec 64) (_ BitVec 32)) Unit!40578)

(assert (=> b!1226492 (= lt!558660 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1226493 () Bool)

(assert (=> b!1226493 (= e!696697 e!696696)))

(declare-fun res!814685 () Bool)

(assert (=> b!1226493 (=> (not res!814685) (not e!696696))))

(declare-fun lt!558654 () array!79115)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79115 (_ BitVec 32)) Bool)

(assert (=> b!1226493 (= res!814685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!558654 mask!1564))))

(assert (=> b!1226493 (= lt!558654 (array!79116 (store (arr!38178 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38715 _keys!1208)))))

(declare-fun b!1226494 () Bool)

(declare-fun res!814698 () Bool)

(assert (=> b!1226494 (=> (not res!814698) (not e!696697))))

(assert (=> b!1226494 (= res!814698 (= (select (arr!38178 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!48619 () Bool)

(assert (=> mapIsEmpty!48619 mapRes!48619))

(declare-fun b!1226495 () Bool)

(declare-fun res!814692 () Bool)

(assert (=> b!1226495 (=> (not res!814692) (not e!696697))))

(assert (=> b!1226495 (= res!814692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1226496 () Bool)

(assert (=> b!1226496 (= e!696702 tp_is_empty!31147)))

(declare-fun b!1226497 () Bool)

(declare-fun res!814686 () Bool)

(assert (=> b!1226497 (=> (not res!814686) (not e!696697))))

(assert (=> b!1226497 (= res!814686 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26971))))

(declare-fun res!814695 () Bool)

(assert (=> start!101990 (=> (not res!814695) (not e!696697))))

(assert (=> start!101990 (= res!814695 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38715 _keys!1208))))))

(assert (=> start!101990 e!696697))

(assert (=> start!101990 tp_is_empty!31147))

(declare-fun array_inv!29126 (array!79115) Bool)

(assert (=> start!101990 (array_inv!29126 _keys!1208)))

(assert (=> start!101990 true))

(assert (=> start!101990 tp!92375))

(declare-fun e!696695 () Bool)

(declare-fun array_inv!29127 (array!79117) Bool)

(assert (=> start!101990 (and (array_inv!29127 _values!996) e!696695)))

(declare-fun b!1226482 () Bool)

(declare-fun res!814693 () Bool)

(assert (=> b!1226482 (=> (not res!814693) (not e!696697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1226482 (= res!814693 (validMask!0 mask!1564))))

(declare-fun b!1226498 () Bool)

(assert (=> b!1226498 (= e!696695 (and e!696692 mapRes!48619))))

(declare-fun condMapEmpty!48619 () Bool)

(declare-fun mapDefault!48619 () ValueCell!14864)

(assert (=> b!1226498 (= condMapEmpty!48619 (= (arr!38179 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14864)) mapDefault!48619)))))

(declare-fun b!1226499 () Bool)

(declare-fun e!696703 () Bool)

(assert (=> b!1226499 (= e!696703 e!696693)))

(declare-fun res!814691 () Bool)

(assert (=> b!1226499 (=> res!814691 e!696693)))

(assert (=> b!1226499 (= res!814691 (not (validKeyInArray!0 (select (arr!38178 _keys!1208) from!1455))))))

(assert (=> b!1226499 (= lt!558666 lt!558658)))

(assert (=> b!1226499 (= lt!558658 (-!1956 lt!558661 k0!934))))

(declare-fun zeroValue!944 () V!46657)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46657)

(declare-fun lt!558671 () array!79117)

(declare-fun getCurrentListMapNoExtraKeys!5532 (array!79115 array!79117 (_ BitVec 32) (_ BitVec 32) V!46657 V!46657 (_ BitVec 32) Int) ListLongMap!18139)

(assert (=> b!1226499 (= lt!558666 (getCurrentListMapNoExtraKeys!5532 lt!558654 lt!558671 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1226499 (= lt!558661 (getCurrentListMapNoExtraKeys!5532 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!558668 () Unit!40578)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1171 (array!79115 array!79117 (_ BitVec 32) (_ BitVec 32) V!46657 V!46657 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40578)

(assert (=> b!1226499 (= lt!558668 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1171 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1226500 () Bool)

(declare-fun res!814697 () Bool)

(assert (=> b!1226500 (=> (not res!814697) (not e!696696))))

(assert (=> b!1226500 (= res!814697 (arrayNoDuplicates!0 lt!558654 #b00000000000000000000000000000000 Nil!26971))))

(declare-fun b!1226501 () Bool)

(assert (=> b!1226501 (= e!696694 e!696703)))

(declare-fun res!814690 () Bool)

(assert (=> b!1226501 (=> res!814690 e!696703)))

(assert (=> b!1226501 (= res!814690 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1226501 (= lt!558669 (getCurrentListMapNoExtraKeys!5532 lt!558654 lt!558671 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1226501 (= lt!558671 (array!79118 (store (arr!38179 _values!996) i!673 (ValueCellFull!14864 lt!558655)) (size!38716 _values!996)))))

(declare-fun dynLambda!3429 (Int (_ BitVec 64)) V!46657)

(assert (=> b!1226501 (= lt!558655 (dynLambda!3429 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1226501 (= lt!558662 (getCurrentListMapNoExtraKeys!5532 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!101990 res!814695) b!1226482))

(assert (= (and b!1226482 res!814693) b!1226489))

(assert (= (and b!1226489 res!814684) b!1226495))

(assert (= (and b!1226495 res!814692) b!1226497))

(assert (= (and b!1226497 res!814686) b!1226488))

(assert (= (and b!1226488 res!814687) b!1226484))

(assert (= (and b!1226484 res!814694) b!1226494))

(assert (= (and b!1226494 res!814698) b!1226493))

(assert (= (and b!1226493 res!814685) b!1226500))

(assert (= (and b!1226500 res!814697) b!1226492))

(assert (= (and b!1226492 (not res!814696)) b!1226501))

(assert (= (and b!1226501 (not res!814690)) b!1226499))

(assert (= (and b!1226499 (not res!814691)) b!1226483))

(assert (= (and b!1226483 res!814689) b!1226485))

(assert (= (and b!1226485 (not res!814688)) b!1226486))

(assert (= (and b!1226483 c!120883) b!1226491))

(assert (= (and b!1226483 (not c!120883)) b!1226487))

(assert (= (and b!1226498 condMapEmpty!48619) mapIsEmpty!48619))

(assert (= (and b!1226498 (not condMapEmpty!48619)) mapNonEmpty!48619))

(get-info :version)

(assert (= (and mapNonEmpty!48619 ((_ is ValueCellFull!14864) mapValue!48619)) b!1226496))

(assert (= (and b!1226498 ((_ is ValueCellFull!14864) mapDefault!48619)) b!1226490))

(assert (= start!101990 b!1226498))

(declare-fun b_lambda!22417 () Bool)

(assert (=> (not b_lambda!22417) (not b!1226501)))

(declare-fun t!40387 () Bool)

(declare-fun tb!11235 () Bool)

(assert (=> (and start!101990 (= defaultEntry!1004 defaultEntry!1004) t!40387) tb!11235))

(declare-fun result!23091 () Bool)

(assert (=> tb!11235 (= result!23091 tp_is_empty!31147)))

(assert (=> b!1226501 t!40387))

(declare-fun b_and!44151 () Bool)

(assert (= b_and!44149 (and (=> t!40387 result!23091) b_and!44151)))

(declare-fun m!1131857 () Bool)

(assert (=> b!1226499 m!1131857))

(declare-fun m!1131859 () Bool)

(assert (=> b!1226499 m!1131859))

(declare-fun m!1131861 () Bool)

(assert (=> b!1226499 m!1131861))

(declare-fun m!1131863 () Bool)

(assert (=> b!1226499 m!1131863))

(declare-fun m!1131865 () Bool)

(assert (=> b!1226499 m!1131865))

(assert (=> b!1226499 m!1131859))

(declare-fun m!1131867 () Bool)

(assert (=> b!1226499 m!1131867))

(declare-fun m!1131869 () Bool)

(assert (=> b!1226492 m!1131869))

(declare-fun m!1131871 () Bool)

(assert (=> b!1226492 m!1131871))

(declare-fun m!1131873 () Bool)

(assert (=> b!1226501 m!1131873))

(declare-fun m!1131875 () Bool)

(assert (=> b!1226501 m!1131875))

(declare-fun m!1131877 () Bool)

(assert (=> b!1226501 m!1131877))

(declare-fun m!1131879 () Bool)

(assert (=> b!1226501 m!1131879))

(declare-fun m!1131881 () Bool)

(assert (=> start!101990 m!1131881))

(declare-fun m!1131883 () Bool)

(assert (=> start!101990 m!1131883))

(declare-fun m!1131885 () Bool)

(assert (=> b!1226486 m!1131885))

(declare-fun m!1131887 () Bool)

(assert (=> b!1226483 m!1131887))

(declare-fun m!1131889 () Bool)

(assert (=> b!1226483 m!1131889))

(declare-fun m!1131891 () Bool)

(assert (=> b!1226483 m!1131891))

(assert (=> b!1226483 m!1131887))

(assert (=> b!1226483 m!1131859))

(declare-fun m!1131893 () Bool)

(assert (=> b!1226483 m!1131893))

(declare-fun m!1131895 () Bool)

(assert (=> b!1226483 m!1131895))

(declare-fun m!1131897 () Bool)

(assert (=> b!1226483 m!1131897))

(assert (=> b!1226483 m!1131859))

(assert (=> b!1226485 m!1131859))

(declare-fun m!1131899 () Bool)

(assert (=> b!1226482 m!1131899))

(declare-fun m!1131901 () Bool)

(assert (=> b!1226497 m!1131901))

(declare-fun m!1131903 () Bool)

(assert (=> b!1226484 m!1131903))

(declare-fun m!1131905 () Bool)

(assert (=> b!1226500 m!1131905))

(declare-fun m!1131907 () Bool)

(assert (=> b!1226494 m!1131907))

(declare-fun m!1131909 () Bool)

(assert (=> b!1226495 m!1131909))

(declare-fun m!1131911 () Bool)

(assert (=> b!1226493 m!1131911))

(declare-fun m!1131913 () Bool)

(assert (=> b!1226493 m!1131913))

(declare-fun m!1131915 () Bool)

(assert (=> mapNonEmpty!48619 m!1131915))

(declare-fun m!1131917 () Bool)

(assert (=> b!1226491 m!1131917))

(declare-fun m!1131919 () Bool)

(assert (=> b!1226491 m!1131919))

(declare-fun m!1131921 () Bool)

(assert (=> b!1226491 m!1131921))

(declare-fun m!1131923 () Bool)

(assert (=> b!1226491 m!1131923))

(declare-fun m!1131925 () Bool)

(assert (=> b!1226491 m!1131925))

(check-sat (not b!1226486) (not b!1226483) tp_is_empty!31147 (not b!1226482) (not b!1226493) (not b!1226500) (not b!1226484) (not b!1226497) (not b!1226491) (not b!1226495) (not b!1226492) (not b!1226501) (not b!1226499) (not b_next!26443) (not mapNonEmpty!48619) b_and!44151 (not start!101990) (not b_lambda!22417))
(check-sat b_and!44151 (not b_next!26443))
