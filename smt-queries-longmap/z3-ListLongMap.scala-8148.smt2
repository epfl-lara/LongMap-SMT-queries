; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99756 () Bool)

(assert start!99756)

(declare-fun b_free!25335 () Bool)

(declare-fun b_next!25335 () Bool)

(assert (=> start!99756 (= b_free!25335 (not b_next!25335))))

(declare-fun tp!88719 () Bool)

(declare-fun b_and!41537 () Bool)

(assert (=> start!99756 (= tp!88719 b_and!41537)))

(declare-fun b!1184671 () Bool)

(declare-fun res!787442 () Bool)

(declare-fun e!673566 () Bool)

(assert (=> b!1184671 (=> (not res!787442) (not e!673566))))

(declare-datatypes ((array!76529 0))(
  ( (array!76530 (arr!36914 (Array (_ BitVec 32) (_ BitVec 64))) (size!37450 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76529)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44947 0))(
  ( (V!44948 (val!14989 Int)) )
))
(declare-datatypes ((ValueCell!14223 0))(
  ( (ValueCellFull!14223 (v!17627 V!44947)) (EmptyCell!14223) )
))
(declare-datatypes ((array!76531 0))(
  ( (array!76532 (arr!36915 (Array (_ BitVec 32) ValueCell!14223)) (size!37451 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76531)

(assert (=> b!1184671 (= res!787442 (and (= (size!37451 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37450 _keys!1208) (size!37451 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!673563 () Bool)

(declare-fun b!1184672 () Bool)

(declare-fun arrayContainsKey!0 (array!76529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1184672 (= e!673563 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1184673 () Bool)

(declare-fun e!673564 () Bool)

(assert (=> b!1184673 (= e!673566 e!673564)))

(declare-fun res!787445 () Bool)

(assert (=> b!1184673 (=> (not res!787445) (not e!673564))))

(declare-fun lt!537307 () array!76529)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76529 (_ BitVec 32)) Bool)

(assert (=> b!1184673 (= res!787445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!537307 mask!1564))))

(assert (=> b!1184673 (= lt!537307 (array!76530 (store (arr!36914 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37450 _keys!1208)))))

(declare-fun b!1184674 () Bool)

(declare-fun e!673562 () Bool)

(declare-fun e!673568 () Bool)

(declare-fun mapRes!46625 () Bool)

(assert (=> b!1184674 (= e!673562 (and e!673568 mapRes!46625))))

(declare-fun condMapEmpty!46625 () Bool)

(declare-fun mapDefault!46625 () ValueCell!14223)

(assert (=> b!1184674 (= condMapEmpty!46625 (= (arr!36915 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14223)) mapDefault!46625)))))

(declare-fun mapNonEmpty!46625 () Bool)

(declare-fun tp!88718 () Bool)

(declare-fun e!673567 () Bool)

(assert (=> mapNonEmpty!46625 (= mapRes!46625 (and tp!88718 e!673567))))

(declare-fun mapRest!46625 () (Array (_ BitVec 32) ValueCell!14223))

(declare-fun mapKey!46625 () (_ BitVec 32))

(declare-fun mapValue!46625 () ValueCell!14223)

(assert (=> mapNonEmpty!46625 (= (arr!36915 _values!996) (store mapRest!46625 mapKey!46625 mapValue!46625))))

(declare-fun res!787439 () Bool)

(assert (=> start!99756 (=> (not res!787439) (not e!673566))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99756 (= res!787439 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37450 _keys!1208))))))

(assert (=> start!99756 e!673566))

(declare-fun tp_is_empty!29865 () Bool)

(assert (=> start!99756 tp_is_empty!29865))

(declare-fun array_inv!28172 (array!76529) Bool)

(assert (=> start!99756 (array_inv!28172 _keys!1208)))

(assert (=> start!99756 true))

(assert (=> start!99756 tp!88719))

(declare-fun array_inv!28173 (array!76531) Bool)

(assert (=> start!99756 (and (array_inv!28173 _values!996) e!673562)))

(declare-fun b!1184675 () Bool)

(declare-fun e!673560 () Bool)

(assert (=> b!1184675 (= e!673560 e!673563)))

(declare-fun res!787452 () Bool)

(assert (=> b!1184675 (=> res!787452 e!673563)))

(assert (=> b!1184675 (= res!787452 (not (= (select (arr!36914 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1184676 () Bool)

(declare-fun res!787451 () Bool)

(assert (=> b!1184676 (=> (not res!787451) (not e!673566))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1184676 (= res!787451 (validKeyInArray!0 k0!934))))

(declare-fun b!1184677 () Bool)

(declare-fun res!787448 () Bool)

(assert (=> b!1184677 (=> (not res!787448) (not e!673566))))

(assert (=> b!1184677 (= res!787448 (= (select (arr!36914 _keys!1208) i!673) k0!934))))

(declare-fun b!1184678 () Bool)

(assert (=> b!1184678 (= e!673567 tp_is_empty!29865)))

(declare-fun b!1184679 () Bool)

(declare-datatypes ((Unit!39229 0))(
  ( (Unit!39230) )
))
(declare-fun e!673565 () Unit!39229)

(declare-fun Unit!39231 () Unit!39229)

(assert (=> b!1184679 (= e!673565 Unit!39231)))

(declare-fun b!1184680 () Bool)

(declare-fun res!787447 () Bool)

(assert (=> b!1184680 (=> (not res!787447) (not e!673566))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1184680 (= res!787447 (validMask!0 mask!1564))))

(declare-fun b!1184681 () Bool)

(declare-fun res!787446 () Bool)

(assert (=> b!1184681 (=> (not res!787446) (not e!673566))))

(declare-datatypes ((List!25960 0))(
  ( (Nil!25957) (Cons!25956 (h!27165 (_ BitVec 64)) (t!38287 List!25960)) )
))
(declare-fun arrayNoDuplicates!0 (array!76529 (_ BitVec 32) List!25960) Bool)

(assert (=> b!1184681 (= res!787446 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25957))))

(declare-fun b!1184682 () Bool)

(declare-fun e!673570 () Bool)

(assert (=> b!1184682 (= e!673564 (not e!673570))))

(declare-fun res!787441 () Bool)

(assert (=> b!1184682 (=> res!787441 e!673570)))

(assert (=> b!1184682 (= res!787441 (bvsgt from!1455 i!673))))

(assert (=> b!1184682 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!537317 () Unit!39229)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76529 (_ BitVec 64) (_ BitVec 32)) Unit!39229)

(assert (=> b!1184682 (= lt!537317 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1184683 () Bool)

(declare-fun Unit!39232 () Unit!39229)

(assert (=> b!1184683 (= e!673565 Unit!39232)))

(declare-fun lt!537305 () Unit!39229)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76529 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39229)

(assert (=> b!1184683 (= lt!537305 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1184683 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!537313 () Unit!39229)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76529 (_ BitVec 32) (_ BitVec 32)) Unit!39229)

(assert (=> b!1184683 (= lt!537313 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1184683 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25957)))

(declare-fun lt!537314 () Unit!39229)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76529 (_ BitVec 64) (_ BitVec 32) List!25960) Unit!39229)

(assert (=> b!1184683 (= lt!537314 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25957))))

(assert (=> b!1184683 false))

(declare-fun b!1184684 () Bool)

(declare-fun e!673559 () Bool)

(assert (=> b!1184684 (= e!673559 true)))

(declare-datatypes ((tuple2!19220 0))(
  ( (tuple2!19221 (_1!9621 (_ BitVec 64)) (_2!9621 V!44947)) )
))
(declare-datatypes ((List!25961 0))(
  ( (Nil!25958) (Cons!25957 (h!27166 tuple2!19220) (t!38288 List!25961)) )
))
(declare-datatypes ((ListLongMap!17189 0))(
  ( (ListLongMap!17190 (toList!8610 List!25961)) )
))
(declare-fun lt!537309 () ListLongMap!17189)

(declare-fun lt!537312 () ListLongMap!17189)

(declare-fun -!1645 (ListLongMap!17189 (_ BitVec 64)) ListLongMap!17189)

(assert (=> b!1184684 (= (-!1645 lt!537309 k0!934) lt!537312)))

(declare-fun lt!537303 () V!44947)

(declare-fun lt!537318 () ListLongMap!17189)

(declare-fun lt!537304 () Unit!39229)

(declare-fun addRemoveCommutativeForDiffKeys!170 (ListLongMap!17189 (_ BitVec 64) V!44947 (_ BitVec 64)) Unit!39229)

(assert (=> b!1184684 (= lt!537304 (addRemoveCommutativeForDiffKeys!170 lt!537318 (select (arr!36914 _keys!1208) from!1455) lt!537303 k0!934))))

(declare-fun lt!537311 () ListLongMap!17189)

(declare-fun lt!537316 () ListLongMap!17189)

(declare-fun lt!537310 () ListLongMap!17189)

(assert (=> b!1184684 (and (= lt!537311 lt!537309) (= lt!537310 lt!537316))))

(declare-fun lt!537308 () tuple2!19220)

(declare-fun +!3907 (ListLongMap!17189 tuple2!19220) ListLongMap!17189)

(assert (=> b!1184684 (= lt!537309 (+!3907 lt!537318 lt!537308))))

(assert (=> b!1184684 (not (= (select (arr!36914 _keys!1208) from!1455) k0!934))))

(declare-fun lt!537315 () Unit!39229)

(assert (=> b!1184684 (= lt!537315 e!673565)))

(declare-fun c!117126 () Bool)

(assert (=> b!1184684 (= c!117126 (= (select (arr!36914 _keys!1208) from!1455) k0!934))))

(assert (=> b!1184684 e!673560))

(declare-fun res!787450 () Bool)

(assert (=> b!1184684 (=> (not res!787450) (not e!673560))))

(declare-fun lt!537301 () ListLongMap!17189)

(assert (=> b!1184684 (= res!787450 (= lt!537301 lt!537312))))

(assert (=> b!1184684 (= lt!537312 (+!3907 lt!537310 lt!537308))))

(assert (=> b!1184684 (= lt!537308 (tuple2!19221 (select (arr!36914 _keys!1208) from!1455) lt!537303))))

(declare-fun lt!537302 () V!44947)

(declare-fun get!18892 (ValueCell!14223 V!44947) V!44947)

(assert (=> b!1184684 (= lt!537303 (get!18892 (select (arr!36915 _values!996) from!1455) lt!537302))))

(declare-fun b!1184685 () Bool)

(declare-fun res!787453 () Bool)

(assert (=> b!1184685 (=> (not res!787453) (not e!673566))))

(assert (=> b!1184685 (= res!787453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1184686 () Bool)

(declare-fun e!673561 () Bool)

(assert (=> b!1184686 (= e!673561 e!673559)))

(declare-fun res!787443 () Bool)

(assert (=> b!1184686 (=> res!787443 e!673559)))

(assert (=> b!1184686 (= res!787443 (not (validKeyInArray!0 (select (arr!36914 _keys!1208) from!1455))))))

(assert (=> b!1184686 (= lt!537316 lt!537310)))

(assert (=> b!1184686 (= lt!537310 (-!1645 lt!537318 k0!934))))

(declare-fun zeroValue!944 () V!44947)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!537300 () array!76531)

(declare-fun minValue!944 () V!44947)

(declare-fun getCurrentListMapNoExtraKeys!5059 (array!76529 array!76531 (_ BitVec 32) (_ BitVec 32) V!44947 V!44947 (_ BitVec 32) Int) ListLongMap!17189)

(assert (=> b!1184686 (= lt!537316 (getCurrentListMapNoExtraKeys!5059 lt!537307 lt!537300 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1184686 (= lt!537318 (getCurrentListMapNoExtraKeys!5059 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!537306 () Unit!39229)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!864 (array!76529 array!76531 (_ BitVec 32) (_ BitVec 32) V!44947 V!44947 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39229)

(assert (=> b!1184686 (= lt!537306 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!864 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1184687 () Bool)

(assert (=> b!1184687 (= e!673568 tp_is_empty!29865)))

(declare-fun b!1184688 () Bool)

(declare-fun res!787449 () Bool)

(assert (=> b!1184688 (=> (not res!787449) (not e!673566))))

(assert (=> b!1184688 (= res!787449 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37450 _keys!1208))))))

(declare-fun b!1184689 () Bool)

(assert (=> b!1184689 (= e!673570 e!673561)))

(declare-fun res!787444 () Bool)

(assert (=> b!1184689 (=> res!787444 e!673561)))

(assert (=> b!1184689 (= res!787444 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1184689 (= lt!537301 (getCurrentListMapNoExtraKeys!5059 lt!537307 lt!537300 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1184689 (= lt!537300 (array!76532 (store (arr!36915 _values!996) i!673 (ValueCellFull!14223 lt!537302)) (size!37451 _values!996)))))

(declare-fun dynLambda!3010 (Int (_ BitVec 64)) V!44947)

(assert (=> b!1184689 (= lt!537302 (dynLambda!3010 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1184689 (= lt!537311 (getCurrentListMapNoExtraKeys!5059 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1184690 () Bool)

(declare-fun res!787440 () Bool)

(assert (=> b!1184690 (=> (not res!787440) (not e!673564))))

(assert (=> b!1184690 (= res!787440 (arrayNoDuplicates!0 lt!537307 #b00000000000000000000000000000000 Nil!25957))))

(declare-fun mapIsEmpty!46625 () Bool)

(assert (=> mapIsEmpty!46625 mapRes!46625))

(assert (= (and start!99756 res!787439) b!1184680))

(assert (= (and b!1184680 res!787447) b!1184671))

(assert (= (and b!1184671 res!787442) b!1184685))

(assert (= (and b!1184685 res!787453) b!1184681))

(assert (= (and b!1184681 res!787446) b!1184688))

(assert (= (and b!1184688 res!787449) b!1184676))

(assert (= (and b!1184676 res!787451) b!1184677))

(assert (= (and b!1184677 res!787448) b!1184673))

(assert (= (and b!1184673 res!787445) b!1184690))

(assert (= (and b!1184690 res!787440) b!1184682))

(assert (= (and b!1184682 (not res!787441)) b!1184689))

(assert (= (and b!1184689 (not res!787444)) b!1184686))

(assert (= (and b!1184686 (not res!787443)) b!1184684))

(assert (= (and b!1184684 res!787450) b!1184675))

(assert (= (and b!1184675 (not res!787452)) b!1184672))

(assert (= (and b!1184684 c!117126) b!1184683))

(assert (= (and b!1184684 (not c!117126)) b!1184679))

(assert (= (and b!1184674 condMapEmpty!46625) mapIsEmpty!46625))

(assert (= (and b!1184674 (not condMapEmpty!46625)) mapNonEmpty!46625))

(get-info :version)

(assert (= (and mapNonEmpty!46625 ((_ is ValueCellFull!14223) mapValue!46625)) b!1184678))

(assert (= (and b!1184674 ((_ is ValueCellFull!14223) mapDefault!46625)) b!1184687))

(assert (= start!99756 b!1184674))

(declare-fun b_lambda!20479 () Bool)

(assert (=> (not b_lambda!20479) (not b!1184689)))

(declare-fun t!38286 () Bool)

(declare-fun tb!10147 () Bool)

(assert (=> (and start!99756 (= defaultEntry!1004 defaultEntry!1004) t!38286) tb!10147))

(declare-fun result!20861 () Bool)

(assert (=> tb!10147 (= result!20861 tp_is_empty!29865)))

(assert (=> b!1184689 t!38286))

(declare-fun b_and!41539 () Bool)

(assert (= b_and!41537 (and (=> t!38286 result!20861) b_and!41539)))

(declare-fun m!1092985 () Bool)

(assert (=> b!1184689 m!1092985))

(declare-fun m!1092987 () Bool)

(assert (=> b!1184689 m!1092987))

(declare-fun m!1092989 () Bool)

(assert (=> b!1184689 m!1092989))

(declare-fun m!1092991 () Bool)

(assert (=> b!1184689 m!1092991))

(declare-fun m!1092993 () Bool)

(assert (=> b!1184682 m!1092993))

(declare-fun m!1092995 () Bool)

(assert (=> b!1184682 m!1092995))

(declare-fun m!1092997 () Bool)

(assert (=> b!1184672 m!1092997))

(declare-fun m!1092999 () Bool)

(assert (=> b!1184684 m!1092999))

(declare-fun m!1093001 () Bool)

(assert (=> b!1184684 m!1093001))

(assert (=> b!1184684 m!1092999))

(declare-fun m!1093003 () Bool)

(assert (=> b!1184684 m!1093003))

(declare-fun m!1093005 () Bool)

(assert (=> b!1184684 m!1093005))

(declare-fun m!1093007 () Bool)

(assert (=> b!1184684 m!1093007))

(declare-fun m!1093009 () Bool)

(assert (=> b!1184684 m!1093009))

(declare-fun m!1093011 () Bool)

(assert (=> b!1184684 m!1093011))

(assert (=> b!1184684 m!1093007))

(declare-fun m!1093013 () Bool)

(assert (=> b!1184676 m!1093013))

(declare-fun m!1093015 () Bool)

(assert (=> mapNonEmpty!46625 m!1093015))

(assert (=> b!1184675 m!1093007))

(declare-fun m!1093017 () Bool)

(assert (=> b!1184683 m!1093017))

(declare-fun m!1093019 () Bool)

(assert (=> b!1184683 m!1093019))

(declare-fun m!1093021 () Bool)

(assert (=> b!1184683 m!1093021))

(declare-fun m!1093023 () Bool)

(assert (=> b!1184683 m!1093023))

(declare-fun m!1093025 () Bool)

(assert (=> b!1184683 m!1093025))

(declare-fun m!1093027 () Bool)

(assert (=> b!1184681 m!1093027))

(declare-fun m!1093029 () Bool)

(assert (=> b!1184680 m!1093029))

(declare-fun m!1093031 () Bool)

(assert (=> start!99756 m!1093031))

(declare-fun m!1093033 () Bool)

(assert (=> start!99756 m!1093033))

(declare-fun m!1093035 () Bool)

(assert (=> b!1184685 m!1093035))

(declare-fun m!1093037 () Bool)

(assert (=> b!1184673 m!1093037))

(declare-fun m!1093039 () Bool)

(assert (=> b!1184673 m!1093039))

(declare-fun m!1093041 () Bool)

(assert (=> b!1184690 m!1093041))

(declare-fun m!1093043 () Bool)

(assert (=> b!1184686 m!1093043))

(declare-fun m!1093045 () Bool)

(assert (=> b!1184686 m!1093045))

(declare-fun m!1093047 () Bool)

(assert (=> b!1184686 m!1093047))

(assert (=> b!1184686 m!1093007))

(declare-fun m!1093049 () Bool)

(assert (=> b!1184686 m!1093049))

(declare-fun m!1093051 () Bool)

(assert (=> b!1184686 m!1093051))

(assert (=> b!1184686 m!1093007))

(declare-fun m!1093053 () Bool)

(assert (=> b!1184677 m!1093053))

(check-sat (not b!1184672) (not b!1184689) (not mapNonEmpty!46625) (not b_next!25335) (not b!1184681) (not b_lambda!20479) (not b!1184683) (not b!1184682) (not start!99756) (not b!1184680) (not b!1184686) (not b!1184690) (not b!1184676) (not b!1184673) b_and!41539 (not b!1184685) tp_is_empty!29865 (not b!1184684))
(check-sat b_and!41539 (not b_next!25335))
