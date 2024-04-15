; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100306 () Bool)

(assert start!100306)

(declare-fun b_free!25699 () Bool)

(declare-fun b_next!25699 () Bool)

(assert (=> start!100306 (= b_free!25699 (not b_next!25699))))

(declare-fun tp!90045 () Bool)

(declare-fun b_and!42243 () Bool)

(assert (=> start!100306 (= tp!90045 b_and!42243)))

(declare-fun b!1196939 () Bool)

(declare-fun res!796592 () Bool)

(declare-fun e!679990 () Bool)

(assert (=> b!1196939 (=> (not res!796592) (not e!679990))))

(declare-datatypes ((array!77466 0))(
  ( (array!77467 (arr!37380 (Array (_ BitVec 32) (_ BitVec 64))) (size!37918 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77466)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77466 (_ BitVec 32)) Bool)

(assert (=> b!1196939 (= res!796592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!47405 () Bool)

(declare-fun mapRes!47405 () Bool)

(declare-fun tp!90044 () Bool)

(declare-fun e!679992 () Bool)

(assert (=> mapNonEmpty!47405 (= mapRes!47405 (and tp!90044 e!679992))))

(declare-fun mapKey!47405 () (_ BitVec 32))

(declare-datatypes ((V!45633 0))(
  ( (V!45634 (val!15246 Int)) )
))
(declare-datatypes ((ValueCell!14480 0))(
  ( (ValueCellFull!14480 (v!17883 V!45633)) (EmptyCell!14480) )
))
(declare-fun mapRest!47405 () (Array (_ BitVec 32) ValueCell!14480))

(declare-fun mapValue!47405 () ValueCell!14480)

(declare-datatypes ((array!77468 0))(
  ( (array!77469 (arr!37381 (Array (_ BitVec 32) ValueCell!14480)) (size!37919 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77468)

(assert (=> mapNonEmpty!47405 (= (arr!37381 _values!996) (store mapRest!47405 mapKey!47405 mapValue!47405))))

(declare-fun b!1196940 () Bool)

(declare-fun res!796597 () Bool)

(assert (=> b!1196940 (=> (not res!796597) (not e!679990))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1196940 (= res!796597 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37918 _keys!1208))))))

(declare-fun b!1196941 () Bool)

(declare-fun e!679993 () Bool)

(declare-fun tp_is_empty!30379 () Bool)

(assert (=> b!1196941 (= e!679993 tp_is_empty!30379)))

(declare-fun b!1196942 () Bool)

(declare-fun res!796593 () Bool)

(assert (=> b!1196942 (=> (not res!796593) (not e!679990))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1196942 (= res!796593 (and (= (size!37919 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37918 _keys!1208) (size!37919 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1196943 () Bool)

(declare-fun e!679987 () Bool)

(declare-datatypes ((tuple2!19614 0))(
  ( (tuple2!19615 (_1!9818 (_ BitVec 64)) (_2!9818 V!45633)) )
))
(declare-datatypes ((List!26391 0))(
  ( (Nil!26388) (Cons!26387 (h!27596 tuple2!19614) (t!39073 List!26391)) )
))
(declare-datatypes ((ListLongMap!17583 0))(
  ( (ListLongMap!17584 (toList!8807 List!26391)) )
))
(declare-fun call!57196 () ListLongMap!17583)

(declare-fun call!57195 () ListLongMap!17583)

(assert (=> b!1196943 (= e!679987 (= call!57196 call!57195))))

(declare-fun b!1196944 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1744 (ListLongMap!17583 (_ BitVec 64)) ListLongMap!17583)

(assert (=> b!1196944 (= e!679987 (= call!57196 (-!1744 call!57195 k0!934)))))

(declare-fun res!796590 () Bool)

(assert (=> start!100306 (=> (not res!796590) (not e!679990))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100306 (= res!796590 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37918 _keys!1208))))))

(assert (=> start!100306 e!679990))

(assert (=> start!100306 tp_is_empty!30379))

(declare-fun array_inv!28612 (array!77466) Bool)

(assert (=> start!100306 (array_inv!28612 _keys!1208)))

(assert (=> start!100306 true))

(assert (=> start!100306 tp!90045))

(declare-fun e!679991 () Bool)

(declare-fun array_inv!28613 (array!77468) Bool)

(assert (=> start!100306 (and (array_inv!28613 _values!996) e!679991)))

(declare-fun b!1196945 () Bool)

(declare-fun e!679989 () Bool)

(declare-fun e!679988 () Bool)

(assert (=> b!1196945 (= e!679989 (not e!679988))))

(declare-fun res!796596 () Bool)

(assert (=> b!1196945 (=> res!796596 e!679988)))

(assert (=> b!1196945 (= res!796596 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!37918 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!77466 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196945 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39561 0))(
  ( (Unit!39562) )
))
(declare-fun lt!543000 () Unit!39561)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77466 (_ BitVec 64) (_ BitVec 32)) Unit!39561)

(assert (=> b!1196945 (= lt!543000 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1196946 () Bool)

(declare-fun res!796591 () Bool)

(assert (=> b!1196946 (=> (not res!796591) (not e!679990))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196946 (= res!796591 (validKeyInArray!0 k0!934))))

(declare-fun b!1196947 () Bool)

(declare-fun res!796598 () Bool)

(assert (=> b!1196947 (=> (not res!796598) (not e!679990))))

(declare-datatypes ((List!26392 0))(
  ( (Nil!26389) (Cons!26388 (h!27597 (_ BitVec 64)) (t!39074 List!26392)) )
))
(declare-fun arrayNoDuplicates!0 (array!77466 (_ BitVec 32) List!26392) Bool)

(assert (=> b!1196947 (= res!796598 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26389))))

(declare-fun b!1196948 () Bool)

(declare-fun res!796594 () Bool)

(assert (=> b!1196948 (=> (not res!796594) (not e!679989))))

(declare-fun lt!542999 () array!77466)

(assert (=> b!1196948 (= res!796594 (arrayNoDuplicates!0 lt!542999 #b00000000000000000000000000000000 Nil!26389))))

(declare-fun b!1196949 () Bool)

(declare-fun res!796599 () Bool)

(assert (=> b!1196949 (=> (not res!796599) (not e!679990))))

(assert (=> b!1196949 (= res!796599 (= (select (arr!37380 _keys!1208) i!673) k0!934))))

(declare-fun b!1196950 () Bool)

(assert (=> b!1196950 (= e!679992 tp_is_empty!30379)))

(declare-fun zeroValue!944 () V!45633)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!57192 () Bool)

(declare-fun minValue!944 () V!45633)

(declare-fun getCurrentListMapNoExtraKeys!5257 (array!77466 array!77468 (_ BitVec 32) (_ BitVec 32) V!45633 V!45633 (_ BitVec 32) Int) ListLongMap!17583)

(declare-fun dynLambda!3141 (Int (_ BitVec 64)) V!45633)

(assert (=> bm!57192 (= call!57196 (getCurrentListMapNoExtraKeys!5257 lt!542999 (array!77469 (store (arr!37381 _values!996) i!673 (ValueCellFull!14480 (dynLambda!3141 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37919 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1196951 () Bool)

(assert (=> b!1196951 (= e!679991 (and e!679993 mapRes!47405))))

(declare-fun condMapEmpty!47405 () Bool)

(declare-fun mapDefault!47405 () ValueCell!14480)

(assert (=> b!1196951 (= condMapEmpty!47405 (= (arr!37381 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14480)) mapDefault!47405)))))

(declare-fun b!1196952 () Bool)

(declare-fun res!796600 () Bool)

(assert (=> b!1196952 (=> (not res!796600) (not e!679990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196952 (= res!796600 (validMask!0 mask!1564))))

(declare-fun b!1196953 () Bool)

(assert (=> b!1196953 (= e!679990 e!679989)))

(declare-fun res!796595 () Bool)

(assert (=> b!1196953 (=> (not res!796595) (not e!679989))))

(assert (=> b!1196953 (= res!796595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542999 mask!1564))))

(assert (=> b!1196953 (= lt!542999 (array!77467 (store (arr!37380 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37918 _keys!1208)))))

(declare-fun bm!57193 () Bool)

(assert (=> bm!57193 (= call!57195 (getCurrentListMapNoExtraKeys!5257 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!47405 () Bool)

(assert (=> mapIsEmpty!47405 mapRes!47405))

(declare-fun b!1196954 () Bool)

(assert (=> b!1196954 (= e!679988 (bvslt i!673 (size!37919 _values!996)))))

(assert (=> b!1196954 e!679987))

(declare-fun c!117337 () Bool)

(assert (=> b!1196954 (= c!117337 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!542998 () Unit!39561)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!995 (array!77466 array!77468 (_ BitVec 32) (_ BitVec 32) V!45633 V!45633 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39561)

(assert (=> b!1196954 (= lt!542998 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!995 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!100306 res!796590) b!1196952))

(assert (= (and b!1196952 res!796600) b!1196942))

(assert (= (and b!1196942 res!796593) b!1196939))

(assert (= (and b!1196939 res!796592) b!1196947))

(assert (= (and b!1196947 res!796598) b!1196940))

(assert (= (and b!1196940 res!796597) b!1196946))

(assert (= (and b!1196946 res!796591) b!1196949))

(assert (= (and b!1196949 res!796599) b!1196953))

(assert (= (and b!1196953 res!796595) b!1196948))

(assert (= (and b!1196948 res!796594) b!1196945))

(assert (= (and b!1196945 (not res!796596)) b!1196954))

(assert (= (and b!1196954 c!117337) b!1196944))

(assert (= (and b!1196954 (not c!117337)) b!1196943))

(assert (= (or b!1196944 b!1196943) bm!57192))

(assert (= (or b!1196944 b!1196943) bm!57193))

(assert (= (and b!1196951 condMapEmpty!47405) mapIsEmpty!47405))

(assert (= (and b!1196951 (not condMapEmpty!47405)) mapNonEmpty!47405))

(get-info :version)

(assert (= (and mapNonEmpty!47405 ((_ is ValueCellFull!14480) mapValue!47405)) b!1196950))

(assert (= (and b!1196951 ((_ is ValueCellFull!14480) mapDefault!47405)) b!1196941))

(assert (= start!100306 b!1196951))

(declare-fun b_lambda!20825 () Bool)

(assert (=> (not b_lambda!20825) (not bm!57192)))

(declare-fun t!39072 () Bool)

(declare-fun tb!10503 () Bool)

(assert (=> (and start!100306 (= defaultEntry!1004 defaultEntry!1004) t!39072) tb!10503))

(declare-fun result!21587 () Bool)

(assert (=> tb!10503 (= result!21587 tp_is_empty!30379)))

(assert (=> bm!57192 t!39072))

(declare-fun b_and!42245 () Bool)

(assert (= b_and!42243 (and (=> t!39072 result!21587) b_and!42245)))

(declare-fun m!1103519 () Bool)

(assert (=> b!1196947 m!1103519))

(declare-fun m!1103521 () Bool)

(assert (=> b!1196953 m!1103521))

(declare-fun m!1103523 () Bool)

(assert (=> b!1196953 m!1103523))

(declare-fun m!1103525 () Bool)

(assert (=> b!1196939 m!1103525))

(declare-fun m!1103527 () Bool)

(assert (=> b!1196952 m!1103527))

(declare-fun m!1103529 () Bool)

(assert (=> bm!57192 m!1103529))

(declare-fun m!1103531 () Bool)

(assert (=> bm!57192 m!1103531))

(declare-fun m!1103533 () Bool)

(assert (=> bm!57192 m!1103533))

(declare-fun m!1103535 () Bool)

(assert (=> mapNonEmpty!47405 m!1103535))

(declare-fun m!1103537 () Bool)

(assert (=> b!1196946 m!1103537))

(declare-fun m!1103539 () Bool)

(assert (=> b!1196949 m!1103539))

(declare-fun m!1103541 () Bool)

(assert (=> b!1196954 m!1103541))

(declare-fun m!1103543 () Bool)

(assert (=> b!1196945 m!1103543))

(declare-fun m!1103545 () Bool)

(assert (=> b!1196945 m!1103545))

(declare-fun m!1103547 () Bool)

(assert (=> start!100306 m!1103547))

(declare-fun m!1103549 () Bool)

(assert (=> start!100306 m!1103549))

(declare-fun m!1103551 () Bool)

(assert (=> bm!57193 m!1103551))

(declare-fun m!1103553 () Bool)

(assert (=> b!1196948 m!1103553))

(declare-fun m!1103555 () Bool)

(assert (=> b!1196944 m!1103555))

(check-sat (not b!1196939) (not b!1196954) tp_is_empty!30379 (not b_next!25699) (not b!1196944) (not start!100306) (not b!1196953) (not bm!57192) (not bm!57193) (not b!1196952) b_and!42245 (not mapNonEmpty!47405) (not b!1196945) (not b!1196946) (not b!1196947) (not b!1196948) (not b_lambda!20825))
(check-sat b_and!42245 (not b_next!25699))
