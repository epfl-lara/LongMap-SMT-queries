; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98150 () Bool)

(assert start!98150)

(declare-fun b_free!23857 () Bool)

(declare-fun b_next!23857 () Bool)

(assert (=> start!98150 (= b_free!23857 (not b_next!23857))))

(declare-fun tp!84275 () Bool)

(declare-fun b_and!38475 () Bool)

(assert (=> start!98150 (= tp!84275 b_and!38475)))

(declare-fun b!1128468 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!642243 () Bool)

(declare-datatypes ((V!42977 0))(
  ( (V!42978 (val!14250 Int)) )
))
(declare-datatypes ((tuple2!18028 0))(
  ( (tuple2!18029 (_1!9025 (_ BitVec 64)) (_2!9025 V!42977)) )
))
(declare-datatypes ((List!24783 0))(
  ( (Nil!24780) (Cons!24779 (h!25988 tuple2!18028) (t!35623 List!24783)) )
))
(declare-datatypes ((ListLongMap!15997 0))(
  ( (ListLongMap!15998 (toList!8014 List!24783)) )
))
(declare-fun call!47830 () ListLongMap!15997)

(declare-fun call!47831 () ListLongMap!15997)

(declare-fun -!1131 (ListLongMap!15997 (_ BitVec 64)) ListLongMap!15997)

(assert (=> b!1128468 (= e!642243 (= call!47830 (-!1131 call!47831 k0!934)))))

(declare-fun b!1128469 () Bool)

(declare-fun res!754157 () Bool)

(declare-fun e!642239 () Bool)

(assert (=> b!1128469 (=> (not res!754157) (not e!642239))))

(declare-datatypes ((array!73558 0))(
  ( (array!73559 (arr!35432 (Array (_ BitVec 32) (_ BitVec 64))) (size!35970 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73558)

(declare-datatypes ((List!24784 0))(
  ( (Nil!24781) (Cons!24780 (h!25989 (_ BitVec 64)) (t!35624 List!24784)) )
))
(declare-fun arrayNoDuplicates!0 (array!73558 (_ BitVec 32) List!24784) Bool)

(assert (=> b!1128469 (= res!754157 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24781))))

(declare-fun b!1128470 () Bool)

(declare-fun e!642242 () Bool)

(assert (=> b!1128470 (= e!642239 e!642242)))

(declare-fun res!754160 () Bool)

(assert (=> b!1128470 (=> (not res!754160) (not e!642242))))

(declare-fun lt!500823 () array!73558)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73558 (_ BitVec 32)) Bool)

(assert (=> b!1128470 (= res!754160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500823 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1128470 (= lt!500823 (array!73559 (store (arr!35432 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35970 _keys!1208)))))

(declare-fun zeroValue!944 () V!42977)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!47827 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13484 0))(
  ( (ValueCellFull!13484 (v!16882 V!42977)) (EmptyCell!13484) )
))
(declare-datatypes ((array!73560 0))(
  ( (array!73561 (arr!35433 (Array (_ BitVec 32) ValueCell!13484)) (size!35971 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73560)

(declare-fun minValue!944 () V!42977)

(declare-fun getCurrentListMapNoExtraKeys!4514 (array!73558 array!73560 (_ BitVec 32) (_ BitVec 32) V!42977 V!42977 (_ BitVec 32) Int) ListLongMap!15997)

(assert (=> bm!47827 (= call!47831 (getCurrentListMapNoExtraKeys!4514 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128471 () Bool)

(declare-fun e!642244 () Bool)

(assert (=> b!1128471 (= e!642242 (not e!642244))))

(declare-fun res!754163 () Bool)

(assert (=> b!1128471 (=> res!754163 e!642244)))

(assert (=> b!1128471 (= res!754163 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73558 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1128471 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36825 0))(
  ( (Unit!36826) )
))
(declare-fun lt!500818 () Unit!36825)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73558 (_ BitVec 64) (_ BitVec 32)) Unit!36825)

(assert (=> b!1128471 (= lt!500818 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!754168 () Bool)

(assert (=> start!98150 (=> (not res!754168) (not e!642239))))

(assert (=> start!98150 (= res!754168 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35970 _keys!1208))))))

(assert (=> start!98150 e!642239))

(declare-fun tp_is_empty!28387 () Bool)

(assert (=> start!98150 tp_is_empty!28387))

(declare-fun array_inv!27264 (array!73558) Bool)

(assert (=> start!98150 (array_inv!27264 _keys!1208)))

(assert (=> start!98150 true))

(assert (=> start!98150 tp!84275))

(declare-fun e!642246 () Bool)

(declare-fun array_inv!27265 (array!73560) Bool)

(assert (=> start!98150 (and (array_inv!27265 _values!996) e!642246)))

(declare-fun b!1128472 () Bool)

(declare-fun res!754155 () Bool)

(assert (=> b!1128472 (=> (not res!754155) (not e!642239))))

(assert (=> b!1128472 (= res!754155 (= (select (arr!35432 _keys!1208) i!673) k0!934))))

(declare-fun b!1128473 () Bool)

(assert (=> b!1128473 (= e!642243 (= call!47830 call!47831))))

(declare-fun b!1128474 () Bool)

(declare-fun e!642240 () Bool)

(assert (=> b!1128474 (= e!642244 e!642240)))

(declare-fun res!754165 () Bool)

(assert (=> b!1128474 (=> res!754165 e!642240)))

(assert (=> b!1128474 (= res!754165 (not (= from!1455 i!673)))))

(declare-fun lt!500822 () array!73560)

(declare-fun lt!500821 () ListLongMap!15997)

(assert (=> b!1128474 (= lt!500821 (getCurrentListMapNoExtraKeys!4514 lt!500823 lt!500822 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2523 (Int (_ BitVec 64)) V!42977)

(assert (=> b!1128474 (= lt!500822 (array!73561 (store (arr!35433 _values!996) i!673 (ValueCellFull!13484 (dynLambda!2523 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35971 _values!996)))))

(declare-fun lt!500819 () ListLongMap!15997)

(assert (=> b!1128474 (= lt!500819 (getCurrentListMapNoExtraKeys!4514 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1128475 () Bool)

(declare-fun res!754166 () Bool)

(assert (=> b!1128475 (=> (not res!754166) (not e!642239))))

(assert (=> b!1128475 (= res!754166 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35970 _keys!1208))))))

(declare-fun b!1128476 () Bool)

(declare-fun e!642241 () Bool)

(assert (=> b!1128476 (= e!642240 e!642241)))

(declare-fun res!754164 () Bool)

(assert (=> b!1128476 (=> res!754164 e!642241)))

(assert (=> b!1128476 (= res!754164 (not (= (select (arr!35432 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1128476 e!642243))

(declare-fun c!109749 () Bool)

(assert (=> b!1128476 (= c!109749 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!500820 () Unit!36825)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!414 (array!73558 array!73560 (_ BitVec 32) (_ BitVec 32) V!42977 V!42977 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36825)

(assert (=> b!1128476 (= lt!500820 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!414 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128477 () Bool)

(declare-fun e!642245 () Bool)

(declare-fun mapRes!44398 () Bool)

(assert (=> b!1128477 (= e!642246 (and e!642245 mapRes!44398))))

(declare-fun condMapEmpty!44398 () Bool)

(declare-fun mapDefault!44398 () ValueCell!13484)

(assert (=> b!1128477 (= condMapEmpty!44398 (= (arr!35433 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13484)) mapDefault!44398)))))

(declare-fun b!1128478 () Bool)

(declare-fun e!642238 () Bool)

(assert (=> b!1128478 (= e!642238 tp_is_empty!28387)))

(declare-fun b!1128479 () Bool)

(assert (=> b!1128479 (= e!642245 tp_is_empty!28387)))

(declare-fun mapNonEmpty!44398 () Bool)

(declare-fun tp!84274 () Bool)

(assert (=> mapNonEmpty!44398 (= mapRes!44398 (and tp!84274 e!642238))))

(declare-fun mapValue!44398 () ValueCell!13484)

(declare-fun mapKey!44398 () (_ BitVec 32))

(declare-fun mapRest!44398 () (Array (_ BitVec 32) ValueCell!13484))

(assert (=> mapNonEmpty!44398 (= (arr!35433 _values!996) (store mapRest!44398 mapKey!44398 mapValue!44398))))

(declare-fun bm!47828 () Bool)

(assert (=> bm!47828 (= call!47830 (getCurrentListMapNoExtraKeys!4514 lt!500823 lt!500822 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128480 () Bool)

(declare-fun res!754156 () Bool)

(assert (=> b!1128480 (=> (not res!754156) (not e!642239))))

(assert (=> b!1128480 (= res!754156 (and (= (size!35971 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35970 _keys!1208) (size!35971 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1128481 () Bool)

(declare-fun res!754162 () Bool)

(assert (=> b!1128481 (=> (not res!754162) (not e!642239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1128481 (= res!754162 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!44398 () Bool)

(assert (=> mapIsEmpty!44398 mapRes!44398))

(declare-fun b!1128482 () Bool)

(declare-fun res!754159 () Bool)

(assert (=> b!1128482 (=> (not res!754159) (not e!642242))))

(assert (=> b!1128482 (= res!754159 (arrayNoDuplicates!0 lt!500823 #b00000000000000000000000000000000 Nil!24781))))

(declare-fun b!1128483 () Bool)

(declare-fun res!754167 () Bool)

(assert (=> b!1128483 (=> res!754167 e!642241)))

(declare-fun contains!6468 (ListLongMap!15997 (_ BitVec 64)) Bool)

(assert (=> b!1128483 (= res!754167 (not (contains!6468 (getCurrentListMapNoExtraKeys!4514 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934)))))

(declare-fun b!1128484 () Bool)

(assert (=> b!1128484 (= e!642241 (or (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!35970 _keys!1208)))))))

(declare-fun b!1128485 () Bool)

(declare-fun res!754158 () Bool)

(assert (=> b!1128485 (=> (not res!754158) (not e!642239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1128485 (= res!754158 (validKeyInArray!0 k0!934))))

(declare-fun b!1128486 () Bool)

(declare-fun res!754161 () Bool)

(assert (=> b!1128486 (=> (not res!754161) (not e!642239))))

(assert (=> b!1128486 (= res!754161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!98150 res!754168) b!1128481))

(assert (= (and b!1128481 res!754162) b!1128480))

(assert (= (and b!1128480 res!754156) b!1128486))

(assert (= (and b!1128486 res!754161) b!1128469))

(assert (= (and b!1128469 res!754157) b!1128475))

(assert (= (and b!1128475 res!754166) b!1128485))

(assert (= (and b!1128485 res!754158) b!1128472))

(assert (= (and b!1128472 res!754155) b!1128470))

(assert (= (and b!1128470 res!754160) b!1128482))

(assert (= (and b!1128482 res!754159) b!1128471))

(assert (= (and b!1128471 (not res!754163)) b!1128474))

(assert (= (and b!1128474 (not res!754165)) b!1128476))

(assert (= (and b!1128476 c!109749) b!1128468))

(assert (= (and b!1128476 (not c!109749)) b!1128473))

(assert (= (or b!1128468 b!1128473) bm!47827))

(assert (= (or b!1128468 b!1128473) bm!47828))

(assert (= (and b!1128476 (not res!754164)) b!1128483))

(assert (= (and b!1128483 (not res!754167)) b!1128484))

(assert (= (and b!1128477 condMapEmpty!44398) mapIsEmpty!44398))

(assert (= (and b!1128477 (not condMapEmpty!44398)) mapNonEmpty!44398))

(get-info :version)

(assert (= (and mapNonEmpty!44398 ((_ is ValueCellFull!13484) mapValue!44398)) b!1128478))

(assert (= (and b!1128477 ((_ is ValueCellFull!13484) mapDefault!44398)) b!1128479))

(assert (= start!98150 b!1128477))

(declare-fun b_lambda!18809 () Bool)

(assert (=> (not b_lambda!18809) (not b!1128474)))

(declare-fun t!35622 () Bool)

(declare-fun tb!8661 () Bool)

(assert (=> (and start!98150 (= defaultEntry!1004 defaultEntry!1004) t!35622) tb!8661))

(declare-fun result!17891 () Bool)

(assert (=> tb!8661 (= result!17891 tp_is_empty!28387)))

(assert (=> b!1128474 t!35622))

(declare-fun b_and!38477 () Bool)

(assert (= b_and!38475 (and (=> t!35622 result!17891) b_and!38477)))

(declare-fun m!1041537 () Bool)

(assert (=> b!1128474 m!1041537))

(declare-fun m!1041539 () Bool)

(assert (=> b!1128474 m!1041539))

(declare-fun m!1041541 () Bool)

(assert (=> b!1128474 m!1041541))

(declare-fun m!1041543 () Bool)

(assert (=> b!1128474 m!1041543))

(declare-fun m!1041545 () Bool)

(assert (=> b!1128469 m!1041545))

(declare-fun m!1041547 () Bool)

(assert (=> b!1128486 m!1041547))

(declare-fun m!1041549 () Bool)

(assert (=> b!1128470 m!1041549))

(declare-fun m!1041551 () Bool)

(assert (=> b!1128470 m!1041551))

(declare-fun m!1041553 () Bool)

(assert (=> bm!47828 m!1041553))

(declare-fun m!1041555 () Bool)

(assert (=> start!98150 m!1041555))

(declare-fun m!1041557 () Bool)

(assert (=> start!98150 m!1041557))

(declare-fun m!1041559 () Bool)

(assert (=> mapNonEmpty!44398 m!1041559))

(declare-fun m!1041561 () Bool)

(assert (=> b!1128472 m!1041561))

(declare-fun m!1041563 () Bool)

(assert (=> b!1128485 m!1041563))

(declare-fun m!1041565 () Bool)

(assert (=> b!1128481 m!1041565))

(declare-fun m!1041567 () Bool)

(assert (=> bm!47827 m!1041567))

(declare-fun m!1041569 () Bool)

(assert (=> b!1128476 m!1041569))

(declare-fun m!1041571 () Bool)

(assert (=> b!1128476 m!1041571))

(assert (=> b!1128483 m!1041567))

(assert (=> b!1128483 m!1041567))

(declare-fun m!1041573 () Bool)

(assert (=> b!1128483 m!1041573))

(declare-fun m!1041575 () Bool)

(assert (=> b!1128468 m!1041575))

(declare-fun m!1041577 () Bool)

(assert (=> b!1128482 m!1041577))

(declare-fun m!1041579 () Bool)

(assert (=> b!1128471 m!1041579))

(declare-fun m!1041581 () Bool)

(assert (=> b!1128471 m!1041581))

(check-sat (not b!1128468) (not bm!47827) (not b!1128476) (not b!1128482) (not start!98150) (not mapNonEmpty!44398) (not b!1128469) b_and!38477 tp_is_empty!28387 (not b!1128474) (not bm!47828) (not b!1128470) (not b_lambda!18809) (not b!1128486) (not b!1128485) (not b_next!23857) (not b!1128481) (not b!1128483) (not b!1128471))
(check-sat b_and!38477 (not b_next!23857))
