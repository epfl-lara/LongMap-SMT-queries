; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98206 () Bool)

(assert start!98206)

(declare-fun b_free!23671 () Bool)

(declare-fun b_next!23671 () Bool)

(assert (=> start!98206 (= b_free!23671 (not b_next!23671))))

(declare-fun tp!83717 () Bool)

(declare-fun b_and!38135 () Bool)

(assert (=> start!98206 (= tp!83717 b_and!38135)))

(declare-fun b!1124516 () Bool)

(declare-fun e!640299 () Bool)

(assert (=> b!1124516 (= e!640299 true)))

(declare-datatypes ((V!42729 0))(
  ( (V!42730 (val!14157 Int)) )
))
(declare-fun zeroValue!944 () V!42729)

(declare-datatypes ((array!73319 0))(
  ( (array!73320 (arr!35306 (Array (_ BitVec 32) (_ BitVec 64))) (size!35843 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73319)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13391 0))(
  ( (ValueCellFull!13391 (v!16786 V!42729)) (EmptyCell!13391) )
))
(declare-datatypes ((array!73321 0))(
  ( (array!73322 (arr!35307 (Array (_ BitVec 32) ValueCell!13391)) (size!35844 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73321)

(declare-fun minValue!944 () V!42729)

(declare-fun lt!499510 () Bool)

(declare-datatypes ((tuple2!17790 0))(
  ( (tuple2!17791 (_1!8906 (_ BitVec 64)) (_2!8906 V!42729)) )
))
(declare-datatypes ((List!24582 0))(
  ( (Nil!24579) (Cons!24578 (h!25796 tuple2!17790) (t!35237 List!24582)) )
))
(declare-datatypes ((ListLongMap!15767 0))(
  ( (ListLongMap!15768 (toList!7899 List!24582)) )
))
(declare-fun contains!6457 (ListLongMap!15767 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4426 (array!73319 array!73321 (_ BitVec 32) (_ BitVec 32) V!42729 V!42729 (_ BitVec 32) Int) ListLongMap!15767)

(assert (=> b!1124516 (= lt!499510 (contains!6457 (getCurrentListMapNoExtraKeys!4426 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1124517 () Bool)

(declare-fun res!750931 () Bool)

(declare-fun e!640297 () Bool)

(assert (=> b!1124517 (=> (not res!750931) (not e!640297))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1124517 (= res!750931 (= (select (arr!35306 _keys!1208) i!673) k0!934))))

(declare-fun b!1124518 () Bool)

(declare-fun res!750927 () Bool)

(assert (=> b!1124518 (=> (not res!750927) (not e!640297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1124518 (= res!750927 (validMask!0 mask!1564))))

(declare-fun b!1124519 () Bool)

(declare-fun e!640298 () Bool)

(declare-fun e!640300 () Bool)

(assert (=> b!1124519 (= e!640298 (not e!640300))))

(declare-fun res!750924 () Bool)

(assert (=> b!1124519 (=> res!750924 e!640300)))

(assert (=> b!1124519 (= res!750924 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1124519 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36825 0))(
  ( (Unit!36826) )
))
(declare-fun lt!499513 () Unit!36825)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73319 (_ BitVec 64) (_ BitVec 32)) Unit!36825)

(assert (=> b!1124519 (= lt!499513 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1124520 () Bool)

(declare-fun res!750928 () Bool)

(assert (=> b!1124520 (=> (not res!750928) (not e!640297))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73319 (_ BitVec 32)) Bool)

(assert (=> b!1124520 (= res!750928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun call!47363 () ListLongMap!15767)

(declare-fun bm!47359 () Bool)

(declare-fun lt!499511 () array!73321)

(declare-fun lt!499514 () array!73319)

(assert (=> bm!47359 (= call!47363 (getCurrentListMapNoExtraKeys!4426 lt!499514 lt!499511 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124521 () Bool)

(declare-fun res!750929 () Bool)

(assert (=> b!1124521 (=> (not res!750929) (not e!640297))))

(assert (=> b!1124521 (= res!750929 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35843 _keys!1208))))))

(declare-fun b!1124522 () Bool)

(declare-fun e!640296 () Bool)

(assert (=> b!1124522 (= e!640296 e!640299)))

(declare-fun res!750923 () Bool)

(assert (=> b!1124522 (=> res!750923 e!640299)))

(assert (=> b!1124522 (= res!750923 (not (= (select (arr!35306 _keys!1208) from!1455) k0!934)))))

(declare-fun e!640294 () Bool)

(assert (=> b!1124522 e!640294))

(declare-fun c!109907 () Bool)

(assert (=> b!1124522 (= c!109907 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499512 () Unit!36825)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!353 (array!73319 array!73321 (_ BitVec 32) (_ BitVec 32) V!42729 V!42729 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36825)

(assert (=> b!1124522 (= lt!499512 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!353 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124523 () Bool)

(declare-fun call!47362 () ListLongMap!15767)

(declare-fun -!1092 (ListLongMap!15767 (_ BitVec 64)) ListLongMap!15767)

(assert (=> b!1124523 (= e!640294 (= call!47363 (-!1092 call!47362 k0!934)))))

(declare-fun b!1124525 () Bool)

(declare-fun e!640301 () Bool)

(declare-fun tp_is_empty!28201 () Bool)

(assert (=> b!1124525 (= e!640301 tp_is_empty!28201)))

(declare-fun mapIsEmpty!44119 () Bool)

(declare-fun mapRes!44119 () Bool)

(assert (=> mapIsEmpty!44119 mapRes!44119))

(declare-fun b!1124526 () Bool)

(declare-fun res!750925 () Bool)

(assert (=> b!1124526 (=> (not res!750925) (not e!640298))))

(declare-datatypes ((List!24583 0))(
  ( (Nil!24580) (Cons!24579 (h!25797 (_ BitVec 64)) (t!35238 List!24583)) )
))
(declare-fun arrayNoDuplicates!0 (array!73319 (_ BitVec 32) List!24583) Bool)

(assert (=> b!1124526 (= res!750925 (arrayNoDuplicates!0 lt!499514 #b00000000000000000000000000000000 Nil!24580))))

(declare-fun b!1124527 () Bool)

(assert (=> b!1124527 (= e!640300 e!640296)))

(declare-fun res!750930 () Bool)

(assert (=> b!1124527 (=> res!750930 e!640296)))

(assert (=> b!1124527 (= res!750930 (not (= from!1455 i!673)))))

(declare-fun lt!499516 () ListLongMap!15767)

(assert (=> b!1124527 (= lt!499516 (getCurrentListMapNoExtraKeys!4426 lt!499514 lt!499511 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2508 (Int (_ BitVec 64)) V!42729)

(assert (=> b!1124527 (= lt!499511 (array!73322 (store (arr!35307 _values!996) i!673 (ValueCellFull!13391 (dynLambda!2508 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35844 _values!996)))))

(declare-fun lt!499515 () ListLongMap!15767)

(assert (=> b!1124527 (= lt!499515 (getCurrentListMapNoExtraKeys!4426 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1124528 () Bool)

(declare-fun e!640302 () Bool)

(assert (=> b!1124528 (= e!640302 tp_is_empty!28201)))

(declare-fun b!1124529 () Bool)

(declare-fun res!750921 () Bool)

(assert (=> b!1124529 (=> (not res!750921) (not e!640297))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1124529 (= res!750921 (validKeyInArray!0 k0!934))))

(declare-fun b!1124530 () Bool)

(assert (=> b!1124530 (= e!640294 (= call!47363 call!47362))))

(declare-fun bm!47360 () Bool)

(assert (=> bm!47360 (= call!47362 (getCurrentListMapNoExtraKeys!4426 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124531 () Bool)

(declare-fun res!750926 () Bool)

(assert (=> b!1124531 (=> (not res!750926) (not e!640297))))

(assert (=> b!1124531 (= res!750926 (and (= (size!35844 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35843 _keys!1208) (size!35844 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!44119 () Bool)

(declare-fun tp!83716 () Bool)

(assert (=> mapNonEmpty!44119 (= mapRes!44119 (and tp!83716 e!640301))))

(declare-fun mapKey!44119 () (_ BitVec 32))

(declare-fun mapValue!44119 () ValueCell!13391)

(declare-fun mapRest!44119 () (Array (_ BitVec 32) ValueCell!13391))

(assert (=> mapNonEmpty!44119 (= (arr!35307 _values!996) (store mapRest!44119 mapKey!44119 mapValue!44119))))

(declare-fun res!750920 () Bool)

(assert (=> start!98206 (=> (not res!750920) (not e!640297))))

(assert (=> start!98206 (= res!750920 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35843 _keys!1208))))))

(assert (=> start!98206 e!640297))

(assert (=> start!98206 tp_is_empty!28201))

(declare-fun array_inv!27170 (array!73319) Bool)

(assert (=> start!98206 (array_inv!27170 _keys!1208)))

(assert (=> start!98206 true))

(assert (=> start!98206 tp!83717))

(declare-fun e!640293 () Bool)

(declare-fun array_inv!27171 (array!73321) Bool)

(assert (=> start!98206 (and (array_inv!27171 _values!996) e!640293)))

(declare-fun b!1124524 () Bool)

(assert (=> b!1124524 (= e!640293 (and e!640302 mapRes!44119))))

(declare-fun condMapEmpty!44119 () Bool)

(declare-fun mapDefault!44119 () ValueCell!13391)

(assert (=> b!1124524 (= condMapEmpty!44119 (= (arr!35307 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13391)) mapDefault!44119)))))

(declare-fun b!1124532 () Bool)

(assert (=> b!1124532 (= e!640297 e!640298)))

(declare-fun res!750919 () Bool)

(assert (=> b!1124532 (=> (not res!750919) (not e!640298))))

(assert (=> b!1124532 (= res!750919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499514 mask!1564))))

(assert (=> b!1124532 (= lt!499514 (array!73320 (store (arr!35306 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35843 _keys!1208)))))

(declare-fun b!1124533 () Bool)

(declare-fun res!750922 () Bool)

(assert (=> b!1124533 (=> (not res!750922) (not e!640297))))

(assert (=> b!1124533 (= res!750922 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24580))))

(assert (= (and start!98206 res!750920) b!1124518))

(assert (= (and b!1124518 res!750927) b!1124531))

(assert (= (and b!1124531 res!750926) b!1124520))

(assert (= (and b!1124520 res!750928) b!1124533))

(assert (= (and b!1124533 res!750922) b!1124521))

(assert (= (and b!1124521 res!750929) b!1124529))

(assert (= (and b!1124529 res!750921) b!1124517))

(assert (= (and b!1124517 res!750931) b!1124532))

(assert (= (and b!1124532 res!750919) b!1124526))

(assert (= (and b!1124526 res!750925) b!1124519))

(assert (= (and b!1124519 (not res!750924)) b!1124527))

(assert (= (and b!1124527 (not res!750930)) b!1124522))

(assert (= (and b!1124522 c!109907) b!1124523))

(assert (= (and b!1124522 (not c!109907)) b!1124530))

(assert (= (or b!1124523 b!1124530) bm!47359))

(assert (= (or b!1124523 b!1124530) bm!47360))

(assert (= (and b!1124522 (not res!750923)) b!1124516))

(assert (= (and b!1124524 condMapEmpty!44119) mapIsEmpty!44119))

(assert (= (and b!1124524 (not condMapEmpty!44119)) mapNonEmpty!44119))

(get-info :version)

(assert (= (and mapNonEmpty!44119 ((_ is ValueCellFull!13391) mapValue!44119)) b!1124525))

(assert (= (and b!1124524 ((_ is ValueCellFull!13391) mapDefault!44119)) b!1124528))

(assert (= start!98206 b!1124524))

(declare-fun b_lambda!18651 () Bool)

(assert (=> (not b_lambda!18651) (not b!1124527)))

(declare-fun t!35236 () Bool)

(declare-fun tb!8475 () Bool)

(assert (=> (and start!98206 (= defaultEntry!1004 defaultEntry!1004) t!35236) tb!8475))

(declare-fun result!17519 () Bool)

(assert (=> tb!8475 (= result!17519 tp_is_empty!28201)))

(assert (=> b!1124527 t!35236))

(declare-fun b_and!38137 () Bool)

(assert (= b_and!38135 (and (=> t!35236 result!17519) b_and!38137)))

(declare-fun m!1039379 () Bool)

(assert (=> b!1124532 m!1039379))

(declare-fun m!1039381 () Bool)

(assert (=> b!1124532 m!1039381))

(declare-fun m!1039383 () Bool)

(assert (=> bm!47359 m!1039383))

(declare-fun m!1039385 () Bool)

(assert (=> mapNonEmpty!44119 m!1039385))

(declare-fun m!1039387 () Bool)

(assert (=> b!1124527 m!1039387))

(declare-fun m!1039389 () Bool)

(assert (=> b!1124527 m!1039389))

(declare-fun m!1039391 () Bool)

(assert (=> b!1124527 m!1039391))

(declare-fun m!1039393 () Bool)

(assert (=> b!1124527 m!1039393))

(declare-fun m!1039395 () Bool)

(assert (=> b!1124523 m!1039395))

(declare-fun m!1039397 () Bool)

(assert (=> b!1124519 m!1039397))

(declare-fun m!1039399 () Bool)

(assert (=> b!1124519 m!1039399))

(declare-fun m!1039401 () Bool)

(assert (=> b!1124518 m!1039401))

(declare-fun m!1039403 () Bool)

(assert (=> bm!47360 m!1039403))

(declare-fun m!1039405 () Bool)

(assert (=> start!98206 m!1039405))

(declare-fun m!1039407 () Bool)

(assert (=> start!98206 m!1039407))

(declare-fun m!1039409 () Bool)

(assert (=> b!1124533 m!1039409))

(assert (=> b!1124516 m!1039403))

(assert (=> b!1124516 m!1039403))

(declare-fun m!1039411 () Bool)

(assert (=> b!1124516 m!1039411))

(declare-fun m!1039413 () Bool)

(assert (=> b!1124517 m!1039413))

(declare-fun m!1039415 () Bool)

(assert (=> b!1124522 m!1039415))

(declare-fun m!1039417 () Bool)

(assert (=> b!1124522 m!1039417))

(declare-fun m!1039419 () Bool)

(assert (=> b!1124529 m!1039419))

(declare-fun m!1039421 () Bool)

(assert (=> b!1124526 m!1039421))

(declare-fun m!1039423 () Bool)

(assert (=> b!1124520 m!1039423))

(check-sat (not b!1124519) (not b!1124527) b_and!38137 (not b!1124533) (not b!1124522) (not bm!47359) (not b!1124516) (not b!1124523) (not bm!47360) (not b!1124520) tp_is_empty!28201 (not b!1124518) (not b_next!23671) (not start!98206) (not b!1124526) (not b!1124532) (not mapNonEmpty!44119) (not b!1124529) (not b_lambda!18651))
(check-sat b_and!38137 (not b_next!23671))
