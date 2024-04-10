; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98662 () Bool)

(assert start!98662)

(declare-fun b_free!24267 () Bool)

(declare-fun b_next!24267 () Bool)

(assert (=> start!98662 (= b_free!24267 (not b_next!24267))))

(declare-fun tp!85512 () Bool)

(declare-fun b_and!39383 () Bool)

(assert (=> start!98662 (= tp!85512 b_and!39383)))

(declare-datatypes ((V!43523 0))(
  ( (V!43524 (val!14455 Int)) )
))
(declare-fun zeroValue!944 () V!43523)

(declare-fun c!113266 () Bool)

(declare-datatypes ((tuple2!18322 0))(
  ( (tuple2!18323 (_1!9172 (_ BitVec 64)) (_2!9172 V!43523)) )
))
(declare-datatypes ((List!25073 0))(
  ( (Nil!25070) (Cons!25069 (h!26278 tuple2!18322) (t!36332 List!25073)) )
))
(declare-datatypes ((ListLongMap!16291 0))(
  ( (ListLongMap!16292 (toList!8161 List!25073)) )
))
(declare-fun call!52748 () ListLongMap!16291)

(declare-fun c!113261 () Bool)

(declare-fun lt!512622 () ListLongMap!16291)

(declare-fun bm!52743 () Bool)

(declare-fun minValue!944 () V!43523)

(declare-fun +!3584 (ListLongMap!16291 tuple2!18322) ListLongMap!16291)

(assert (=> bm!52743 (= call!52748 (+!3584 lt!512622 (ite (or c!113266 c!113261) (tuple2!18323 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1147294 () Bool)

(declare-fun res!763685 () Bool)

(declare-fun e!652606 () Bool)

(assert (=> b!1147294 (=> (not res!763685) (not e!652606))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!74441 0))(
  ( (array!74442 (arr!35871 (Array (_ BitVec 32) (_ BitVec 64))) (size!36407 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74441)

(assert (=> b!1147294 (= res!763685 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36407 _keys!1208))))))

(declare-fun b!1147295 () Bool)

(declare-fun e!652597 () Bool)

(assert (=> b!1147295 (= e!652597 true)))

(declare-fun e!652594 () Bool)

(assert (=> b!1147295 e!652594))

(declare-fun res!763677 () Bool)

(assert (=> b!1147295 (=> (not res!763677) (not e!652594))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!512619 () V!43523)

(declare-fun -!1297 (ListLongMap!16291 (_ BitVec 64)) ListLongMap!16291)

(assert (=> b!1147295 (= res!763677 (= (-!1297 (+!3584 lt!512622 (tuple2!18323 (select (arr!35871 _keys!1208) from!1455) lt!512619)) (select (arr!35871 _keys!1208) from!1455)) lt!512622))))

(declare-datatypes ((Unit!37682 0))(
  ( (Unit!37683) )
))
(declare-fun lt!512606 () Unit!37682)

(declare-fun addThenRemoveForNewKeyIsSame!145 (ListLongMap!16291 (_ BitVec 64) V!43523) Unit!37682)

(assert (=> b!1147295 (= lt!512606 (addThenRemoveForNewKeyIsSame!145 lt!512622 (select (arr!35871 _keys!1208) from!1455) lt!512619))))

(declare-fun lt!512617 () V!43523)

(declare-datatypes ((ValueCell!13689 0))(
  ( (ValueCellFull!13689 (v!17092 V!43523)) (EmptyCell!13689) )
))
(declare-datatypes ((array!74443 0))(
  ( (array!74444 (arr!35872 (Array (_ BitVec 32) ValueCell!13689)) (size!36408 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74443)

(declare-fun get!18247 (ValueCell!13689 V!43523) V!43523)

(assert (=> b!1147295 (= lt!512619 (get!18247 (select (arr!35872 _values!996) from!1455) lt!512617))))

(declare-fun lt!512603 () Unit!37682)

(declare-fun e!652600 () Unit!37682)

(assert (=> b!1147295 (= lt!512603 e!652600)))

(declare-fun c!113262 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6684 (ListLongMap!16291 (_ BitVec 64)) Bool)

(assert (=> b!1147295 (= c!113262 (contains!6684 lt!512622 k0!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4635 (array!74441 array!74443 (_ BitVec 32) (_ BitVec 32) V!43523 V!43523 (_ BitVec 32) Int) ListLongMap!16291)

(assert (=> b!1147295 (= lt!512622 (getCurrentListMapNoExtraKeys!4635 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147296 () Bool)

(declare-fun Unit!37684 () Unit!37682)

(assert (=> b!1147296 (= e!652600 Unit!37684)))

(declare-fun lt!512609 () Bool)

(assert (=> b!1147296 (= lt!512609 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1147296 (= c!113266 (and (not lt!512609) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!512613 () Unit!37682)

(declare-fun e!652602 () Unit!37682)

(assert (=> b!1147296 (= lt!512613 e!652602)))

(declare-fun lt!512608 () Unit!37682)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!430 (array!74441 array!74443 (_ BitVec 32) (_ BitVec 32) V!43523 V!43523 (_ BitVec 64) (_ BitVec 32) Int) Unit!37682)

(assert (=> b!1147296 (= lt!512608 (lemmaListMapContainsThenArrayContainsFrom!430 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113264 () Bool)

(assert (=> b!1147296 (= c!113264 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763683 () Bool)

(declare-fun e!652608 () Bool)

(assert (=> b!1147296 (= res!763683 e!652608)))

(declare-fun e!652595 () Bool)

(assert (=> b!1147296 (=> (not res!763683) (not e!652595))))

(assert (=> b!1147296 e!652595))

(declare-fun lt!512621 () Unit!37682)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74441 (_ BitVec 32) (_ BitVec 32)) Unit!37682)

(assert (=> b!1147296 (= lt!512621 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25074 0))(
  ( (Nil!25071) (Cons!25070 (h!26279 (_ BitVec 64)) (t!36333 List!25074)) )
))
(declare-fun arrayNoDuplicates!0 (array!74441 (_ BitVec 32) List!25074) Bool)

(assert (=> b!1147296 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25071)))

(declare-fun lt!512614 () Unit!37682)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74441 (_ BitVec 64) (_ BitVec 32) List!25074) Unit!37682)

(assert (=> b!1147296 (= lt!512614 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25071))))

(assert (=> b!1147296 false))

(declare-fun b!1147297 () Bool)

(declare-fun res!763684 () Bool)

(assert (=> b!1147297 (=> (not res!763684) (not e!652606))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1147297 (= res!763684 (validKeyInArray!0 k0!934))))

(declare-fun b!1147298 () Bool)

(declare-fun arrayContainsKey!0 (array!74441 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1147298 (= e!652595 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1147299 () Bool)

(declare-fun res!763688 () Bool)

(assert (=> b!1147299 (=> (not res!763688) (not e!652606))))

(assert (=> b!1147299 (= res!763688 (and (= (size!36408 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36407 _keys!1208) (size!36408 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1147300 () Bool)

(declare-fun res!763678 () Bool)

(assert (=> b!1147300 (=> (not res!763678) (not e!652606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1147300 (= res!763678 (validMask!0 mask!1564))))

(declare-fun b!1147301 () Bool)

(declare-fun e!652603 () Bool)

(declare-fun tp_is_empty!28797 () Bool)

(assert (=> b!1147301 (= e!652603 tp_is_empty!28797)))

(declare-fun mapNonEmpty!45020 () Bool)

(declare-fun mapRes!45020 () Bool)

(declare-fun tp!85511 () Bool)

(assert (=> mapNonEmpty!45020 (= mapRes!45020 (and tp!85511 e!652603))))

(declare-fun mapValue!45020 () ValueCell!13689)

(declare-fun mapKey!45020 () (_ BitVec 32))

(declare-fun mapRest!45020 () (Array (_ BitVec 32) ValueCell!13689))

(assert (=> mapNonEmpty!45020 (= (arr!35872 _values!996) (store mapRest!45020 mapKey!45020 mapValue!45020))))

(declare-fun b!1147302 () Bool)

(declare-fun e!652596 () Bool)

(declare-fun e!652593 () Bool)

(assert (=> b!1147302 (= e!652596 e!652593)))

(declare-fun res!763680 () Bool)

(assert (=> b!1147302 (=> res!763680 e!652593)))

(assert (=> b!1147302 (= res!763680 (not (= from!1455 i!673)))))

(declare-fun lt!512602 () ListLongMap!16291)

(declare-fun lt!512604 () array!74443)

(declare-fun lt!512612 () array!74441)

(assert (=> b!1147302 (= lt!512602 (getCurrentListMapNoExtraKeys!4635 lt!512612 lt!512604 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1147302 (= lt!512604 (array!74444 (store (arr!35872 _values!996) i!673 (ValueCellFull!13689 lt!512617)) (size!36408 _values!996)))))

(declare-fun dynLambda!2665 (Int (_ BitVec 64)) V!43523)

(assert (=> b!1147302 (= lt!512617 (dynLambda!2665 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!512620 () ListLongMap!16291)

(assert (=> b!1147302 (= lt!512620 (getCurrentListMapNoExtraKeys!4635 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1147303 () Bool)

(assert (=> b!1147303 (= c!113261 (and (not lt!512609) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!652592 () Unit!37682)

(assert (=> b!1147303 (= e!652602 e!652592)))

(declare-fun b!1147304 () Bool)

(declare-fun Unit!37685 () Unit!37682)

(assert (=> b!1147304 (= e!652600 Unit!37685)))

(declare-fun b!1147305 () Bool)

(declare-fun lt!512616 () ListLongMap!16291)

(assert (=> b!1147305 (contains!6684 (+!3584 lt!512616 (tuple2!18323 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!512610 () Unit!37682)

(declare-fun call!52752 () Unit!37682)

(assert (=> b!1147305 (= lt!512610 call!52752)))

(declare-fun call!52749 () Bool)

(assert (=> b!1147305 call!52749))

(assert (=> b!1147305 (= lt!512616 call!52748)))

(declare-fun lt!512618 () Unit!37682)

(declare-fun addStillContains!836 (ListLongMap!16291 (_ BitVec 64) V!43523 (_ BitVec 64)) Unit!37682)

(assert (=> b!1147305 (= lt!512618 (addStillContains!836 lt!512622 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1147305 (= e!652602 lt!512610)))

(declare-fun b!1147306 () Bool)

(declare-fun call!52746 () Bool)

(assert (=> b!1147306 call!52746))

(declare-fun lt!512611 () Unit!37682)

(declare-fun call!52751 () Unit!37682)

(assert (=> b!1147306 (= lt!512611 call!52751)))

(declare-fun e!652607 () Unit!37682)

(assert (=> b!1147306 (= e!652607 lt!512611)))

(declare-fun b!1147307 () Bool)

(assert (=> b!1147307 (= e!652608 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!512609) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!52744 () Bool)

(declare-fun call!52747 () ListLongMap!16291)

(assert (=> bm!52744 (= call!52747 (getCurrentListMapNoExtraKeys!4635 lt!512612 lt!512604 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147308 () Bool)

(declare-fun e!652601 () Bool)

(assert (=> b!1147308 (= e!652601 tp_is_empty!28797)))

(declare-fun b!1147309 () Bool)

(declare-fun res!763674 () Bool)

(assert (=> b!1147309 (=> (not res!763674) (not e!652606))))

(assert (=> b!1147309 (= res!763674 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25071))))

(declare-fun b!1147310 () Bool)

(declare-fun e!652604 () Bool)

(declare-fun call!52750 () ListLongMap!16291)

(assert (=> b!1147310 (= e!652604 (= call!52747 call!52750))))

(declare-fun b!1147311 () Bool)

(assert (=> b!1147311 (= e!652604 (= call!52747 (-!1297 call!52750 k0!934)))))

(declare-fun b!1147312 () Bool)

(declare-fun Unit!37686 () Unit!37682)

(assert (=> b!1147312 (= e!652607 Unit!37686)))

(declare-fun bm!52745 () Bool)

(declare-fun call!52753 () ListLongMap!16291)

(assert (=> bm!52745 (= call!52753 call!52748)))

(declare-fun bm!52746 () Bool)

(assert (=> bm!52746 (= call!52749 (contains!6684 (ite c!113266 lt!512616 call!52753) k0!934))))

(declare-fun res!763675 () Bool)

(assert (=> start!98662 (=> (not res!763675) (not e!652606))))

(assert (=> start!98662 (= res!763675 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36407 _keys!1208))))))

(assert (=> start!98662 e!652606))

(assert (=> start!98662 tp_is_empty!28797))

(declare-fun array_inv!27476 (array!74441) Bool)

(assert (=> start!98662 (array_inv!27476 _keys!1208)))

(assert (=> start!98662 true))

(assert (=> start!98662 tp!85512))

(declare-fun e!652605 () Bool)

(declare-fun array_inv!27477 (array!74443) Bool)

(assert (=> start!98662 (and (array_inv!27477 _values!996) e!652605)))

(declare-fun b!1147313 () Bool)

(declare-fun e!652598 () Bool)

(assert (=> b!1147313 (= e!652598 (not e!652596))))

(declare-fun res!763681 () Bool)

(assert (=> b!1147313 (=> res!763681 e!652596)))

(assert (=> b!1147313 (= res!763681 (bvsgt from!1455 i!673))))

(assert (=> b!1147313 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!512605 () Unit!37682)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74441 (_ BitVec 64) (_ BitVec 32)) Unit!37682)

(assert (=> b!1147313 (= lt!512605 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun bm!52747 () Bool)

(assert (=> bm!52747 (= call!52751 call!52752)))

(declare-fun b!1147314 () Bool)

(assert (=> b!1147314 (= e!652606 e!652598)))

(declare-fun res!763682 () Bool)

(assert (=> b!1147314 (=> (not res!763682) (not e!652598))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74441 (_ BitVec 32)) Bool)

(assert (=> b!1147314 (= res!763682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!512612 mask!1564))))

(assert (=> b!1147314 (= lt!512612 (array!74442 (store (arr!35871 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36407 _keys!1208)))))

(declare-fun bm!52748 () Bool)

(assert (=> bm!52748 (= call!52746 call!52749)))

(declare-fun b!1147315 () Bool)

(declare-fun lt!512615 () Unit!37682)

(assert (=> b!1147315 (= e!652592 lt!512615)))

(assert (=> b!1147315 (= lt!512615 call!52751)))

(assert (=> b!1147315 call!52746))

(declare-fun b!1147316 () Bool)

(assert (=> b!1147316 (= e!652605 (and e!652601 mapRes!45020))))

(declare-fun condMapEmpty!45020 () Bool)

(declare-fun mapDefault!45020 () ValueCell!13689)

(assert (=> b!1147316 (= condMapEmpty!45020 (= (arr!35872 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13689)) mapDefault!45020)))))

(declare-fun b!1147317 () Bool)

(assert (=> b!1147317 (= e!652593 e!652597)))

(declare-fun res!763686 () Bool)

(assert (=> b!1147317 (=> res!763686 e!652597)))

(assert (=> b!1147317 (= res!763686 (not (= (select (arr!35871 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1147317 e!652604))

(declare-fun c!113265 () Bool)

(assert (=> b!1147317 (= c!113265 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!512607 () Unit!37682)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!535 (array!74441 array!74443 (_ BitVec 32) (_ BitVec 32) V!43523 V!43523 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37682)

(assert (=> b!1147317 (= lt!512607 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!535 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!52749 () Bool)

(assert (=> bm!52749 (= call!52752 (addStillContains!836 (ite c!113266 lt!512616 lt!512622) (ite c!113266 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!113261 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!113266 minValue!944 (ite c!113261 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1147318 () Bool)

(declare-fun res!763676 () Bool)

(assert (=> b!1147318 (=> (not res!763676) (not e!652606))))

(assert (=> b!1147318 (= res!763676 (= (select (arr!35871 _keys!1208) i!673) k0!934))))

(declare-fun b!1147319 () Bool)

(declare-fun res!763687 () Bool)

(assert (=> b!1147319 (=> (not res!763687) (not e!652598))))

(assert (=> b!1147319 (= res!763687 (arrayNoDuplicates!0 lt!512612 #b00000000000000000000000000000000 Nil!25071))))

(declare-fun bm!52750 () Bool)

(assert (=> bm!52750 (= call!52750 (getCurrentListMapNoExtraKeys!4635 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!45020 () Bool)

(assert (=> mapIsEmpty!45020 mapRes!45020))

(declare-fun b!1147320 () Bool)

(declare-fun res!763679 () Bool)

(assert (=> b!1147320 (=> (not res!763679) (not e!652606))))

(assert (=> b!1147320 (= res!763679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1147321 () Bool)

(assert (=> b!1147321 (= e!652592 e!652607)))

(declare-fun c!113263 () Bool)

(assert (=> b!1147321 (= c!113263 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!512609))))

(declare-fun b!1147322 () Bool)

(assert (=> b!1147322 (= e!652608 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1147323 () Bool)

(assert (=> b!1147323 (= e!652594 (= (-!1297 lt!512620 k0!934) lt!512622))))

(assert (= (and start!98662 res!763675) b!1147300))

(assert (= (and b!1147300 res!763678) b!1147299))

(assert (= (and b!1147299 res!763688) b!1147320))

(assert (= (and b!1147320 res!763679) b!1147309))

(assert (= (and b!1147309 res!763674) b!1147294))

(assert (= (and b!1147294 res!763685) b!1147297))

(assert (= (and b!1147297 res!763684) b!1147318))

(assert (= (and b!1147318 res!763676) b!1147314))

(assert (= (and b!1147314 res!763682) b!1147319))

(assert (= (and b!1147319 res!763687) b!1147313))

(assert (= (and b!1147313 (not res!763681)) b!1147302))

(assert (= (and b!1147302 (not res!763680)) b!1147317))

(assert (= (and b!1147317 c!113265) b!1147311))

(assert (= (and b!1147317 (not c!113265)) b!1147310))

(assert (= (or b!1147311 b!1147310) bm!52744))

(assert (= (or b!1147311 b!1147310) bm!52750))

(assert (= (and b!1147317 (not res!763686)) b!1147295))

(assert (= (and b!1147295 c!113262) b!1147296))

(assert (= (and b!1147295 (not c!113262)) b!1147304))

(assert (= (and b!1147296 c!113266) b!1147305))

(assert (= (and b!1147296 (not c!113266)) b!1147303))

(assert (= (and b!1147303 c!113261) b!1147315))

(assert (= (and b!1147303 (not c!113261)) b!1147321))

(assert (= (and b!1147321 c!113263) b!1147306))

(assert (= (and b!1147321 (not c!113263)) b!1147312))

(assert (= (or b!1147315 b!1147306) bm!52747))

(assert (= (or b!1147315 b!1147306) bm!52745))

(assert (= (or b!1147315 b!1147306) bm!52748))

(assert (= (or b!1147305 bm!52748) bm!52746))

(assert (= (or b!1147305 bm!52747) bm!52749))

(assert (= (or b!1147305 bm!52745) bm!52743))

(assert (= (and b!1147296 c!113264) b!1147322))

(assert (= (and b!1147296 (not c!113264)) b!1147307))

(assert (= (and b!1147296 res!763683) b!1147298))

(assert (= (and b!1147295 res!763677) b!1147323))

(assert (= (and b!1147316 condMapEmpty!45020) mapIsEmpty!45020))

(assert (= (and b!1147316 (not condMapEmpty!45020)) mapNonEmpty!45020))

(get-info :version)

(assert (= (and mapNonEmpty!45020 ((_ is ValueCellFull!13689) mapValue!45020)) b!1147301))

(assert (= (and b!1147316 ((_ is ValueCellFull!13689) mapDefault!45020)) b!1147308))

(assert (= start!98662 b!1147316))

(declare-fun b_lambda!19373 () Bool)

(assert (=> (not b_lambda!19373) (not b!1147302)))

(declare-fun t!36331 () Bool)

(declare-fun tb!9079 () Bool)

(assert (=> (and start!98662 (= defaultEntry!1004 defaultEntry!1004) t!36331) tb!9079))

(declare-fun result!18723 () Bool)

(assert (=> tb!9079 (= result!18723 tp_is_empty!28797)))

(assert (=> b!1147302 t!36331))

(declare-fun b_and!39385 () Bool)

(assert (= b_and!39383 (and (=> t!36331 result!18723) b_and!39385)))

(declare-fun m!1057941 () Bool)

(assert (=> b!1147313 m!1057941))

(declare-fun m!1057943 () Bool)

(assert (=> b!1147313 m!1057943))

(declare-fun m!1057945 () Bool)

(assert (=> b!1147323 m!1057945))

(declare-fun m!1057947 () Bool)

(assert (=> b!1147317 m!1057947))

(declare-fun m!1057949 () Bool)

(assert (=> b!1147317 m!1057949))

(declare-fun m!1057951 () Bool)

(assert (=> b!1147311 m!1057951))

(declare-fun m!1057953 () Bool)

(assert (=> b!1147320 m!1057953))

(declare-fun m!1057955 () Bool)

(assert (=> b!1147300 m!1057955))

(declare-fun m!1057957 () Bool)

(assert (=> mapNonEmpty!45020 m!1057957))

(declare-fun m!1057959 () Bool)

(assert (=> b!1147302 m!1057959))

(declare-fun m!1057961 () Bool)

(assert (=> b!1147302 m!1057961))

(declare-fun m!1057963 () Bool)

(assert (=> b!1147302 m!1057963))

(declare-fun m!1057965 () Bool)

(assert (=> b!1147302 m!1057965))

(declare-fun m!1057967 () Bool)

(assert (=> b!1147295 m!1057967))

(declare-fun m!1057969 () Bool)

(assert (=> b!1147295 m!1057969))

(assert (=> b!1147295 m!1057947))

(declare-fun m!1057971 () Bool)

(assert (=> b!1147295 m!1057971))

(declare-fun m!1057973 () Bool)

(assert (=> b!1147295 m!1057973))

(assert (=> b!1147295 m!1057947))

(declare-fun m!1057975 () Bool)

(assert (=> b!1147295 m!1057975))

(assert (=> b!1147295 m!1057969))

(declare-fun m!1057977 () Bool)

(assert (=> b!1147295 m!1057977))

(assert (=> b!1147295 m!1057947))

(assert (=> b!1147295 m!1057973))

(declare-fun m!1057979 () Bool)

(assert (=> b!1147295 m!1057979))

(declare-fun m!1057981 () Bool)

(assert (=> b!1147319 m!1057981))

(assert (=> bm!52750 m!1057967))

(declare-fun m!1057983 () Bool)

(assert (=> b!1147305 m!1057983))

(assert (=> b!1147305 m!1057983))

(declare-fun m!1057985 () Bool)

(assert (=> b!1147305 m!1057985))

(declare-fun m!1057987 () Bool)

(assert (=> b!1147305 m!1057987))

(declare-fun m!1057989 () Bool)

(assert (=> b!1147298 m!1057989))

(declare-fun m!1057991 () Bool)

(assert (=> b!1147314 m!1057991))

(declare-fun m!1057993 () Bool)

(assert (=> b!1147314 m!1057993))

(assert (=> b!1147322 m!1057989))

(declare-fun m!1057995 () Bool)

(assert (=> bm!52746 m!1057995))

(declare-fun m!1057997 () Bool)

(assert (=> b!1147309 m!1057997))

(declare-fun m!1057999 () Bool)

(assert (=> bm!52744 m!1057999))

(declare-fun m!1058001 () Bool)

(assert (=> start!98662 m!1058001))

(declare-fun m!1058003 () Bool)

(assert (=> start!98662 m!1058003))

(declare-fun m!1058005 () Bool)

(assert (=> b!1147297 m!1058005))

(declare-fun m!1058007 () Bool)

(assert (=> b!1147318 m!1058007))

(declare-fun m!1058009 () Bool)

(assert (=> bm!52743 m!1058009))

(declare-fun m!1058011 () Bool)

(assert (=> b!1147296 m!1058011))

(declare-fun m!1058013 () Bool)

(assert (=> b!1147296 m!1058013))

(declare-fun m!1058015 () Bool)

(assert (=> b!1147296 m!1058015))

(declare-fun m!1058017 () Bool)

(assert (=> b!1147296 m!1058017))

(declare-fun m!1058019 () Bool)

(assert (=> bm!52749 m!1058019))

(check-sat (not mapNonEmpty!45020) (not b!1147297) (not b_next!24267) (not b!1147311) (not b!1147322) (not b!1147302) (not b!1147323) (not b!1147296) (not bm!52746) (not bm!52749) (not bm!52743) (not b!1147295) (not b!1147317) (not b!1147300) tp_is_empty!28797 (not bm!52750) (not b!1147320) (not b!1147313) (not b_lambda!19373) (not b!1147319) (not b!1147305) (not start!98662) (not bm!52744) (not b!1147314) (not b!1147309) b_and!39385 (not b!1147298))
(check-sat b_and!39385 (not b_next!24267))
