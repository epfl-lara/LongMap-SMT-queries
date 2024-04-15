; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98468 () Bool)

(assert start!98468)

(declare-fun b_free!24079 () Bool)

(declare-fun b_next!24079 () Bool)

(assert (=> start!98468 (= b_free!24079 (not b_next!24079))))

(declare-fun tp!84947 () Bool)

(declare-fun b_and!38985 () Bool)

(assert (=> start!98468 (= tp!84947 b_and!38985)))

(declare-fun bm!50464 () Bool)

(declare-datatypes ((V!43273 0))(
  ( (V!43274 (val!14361 Int)) )
))
(declare-datatypes ((tuple2!18236 0))(
  ( (tuple2!18237 (_1!9129 (_ BitVec 64)) (_2!9129 V!43273)) )
))
(declare-datatypes ((List!24976 0))(
  ( (Nil!24973) (Cons!24972 (h!26181 tuple2!18236) (t!36038 List!24976)) )
))
(declare-datatypes ((ListLongMap!16205 0))(
  ( (ListLongMap!16206 (toList!8118 List!24976)) )
))
(declare-fun call!50467 () ListLongMap!16205)

(declare-fun call!50472 () ListLongMap!16205)

(assert (=> bm!50464 (= call!50467 call!50472)))

(declare-fun mapNonEmpty!44738 () Bool)

(declare-fun mapRes!44738 () Bool)

(declare-fun tp!84948 () Bool)

(declare-fun e!647912 () Bool)

(assert (=> mapNonEmpty!44738 (= mapRes!44738 (and tp!84948 e!647912))))

(declare-fun mapKey!44738 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13595 0))(
  ( (ValueCellFull!13595 (v!16997 V!43273)) (EmptyCell!13595) )
))
(declare-fun mapRest!44738 () (Array (_ BitVec 32) ValueCell!13595))

(declare-datatypes ((array!74000 0))(
  ( (array!74001 (arr!35651 (Array (_ BitVec 32) ValueCell!13595)) (size!36189 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74000)

(declare-fun mapValue!44738 () ValueCell!13595)

(assert (=> mapNonEmpty!44738 (= (arr!35651 _values!996) (store mapRest!44738 mapKey!44738 mapValue!44738))))

(declare-fun mapIsEmpty!44738 () Bool)

(assert (=> mapIsEmpty!44738 mapRes!44738))

(declare-fun call!50473 () ListLongMap!16205)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!647899 () Bool)

(declare-fun call!50471 () ListLongMap!16205)

(declare-fun b!1138700 () Bool)

(declare-fun -!1207 (ListLongMap!16205 (_ BitVec 64)) ListLongMap!16205)

(assert (=> b!1138700 (= e!647899 (= call!50471 (-!1207 call!50473 k0!934)))))

(declare-fun bm!50465 () Bool)

(declare-datatypes ((Unit!37170 0))(
  ( (Unit!37171) )
))
(declare-fun call!50469 () Unit!37170)

(declare-fun call!50468 () Unit!37170)

(assert (=> bm!50465 (= call!50469 call!50468)))

(declare-fun b!1138701 () Bool)

(declare-fun e!647911 () Unit!37170)

(declare-fun Unit!37172 () Unit!37170)

(assert (=> b!1138701 (= e!647911 Unit!37172)))

(declare-fun lt!506533 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1138701 (= lt!506533 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!111546 () Bool)

(assert (=> b!1138701 (= c!111546 (and (not lt!506533) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!506538 () Unit!37170)

(declare-fun e!647909 () Unit!37170)

(assert (=> b!1138701 (= lt!506538 e!647909)))

(declare-fun zeroValue!944 () V!43273)

(declare-datatypes ((array!74002 0))(
  ( (array!74003 (arr!35652 (Array (_ BitVec 32) (_ BitVec 64))) (size!36190 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74002)

(declare-fun lt!506527 () Unit!37170)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43273)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!368 (array!74002 array!74000 (_ BitVec 32) (_ BitVec 32) V!43273 V!43273 (_ BitVec 64) (_ BitVec 32) Int) Unit!37170)

(assert (=> b!1138701 (= lt!506527 (lemmaListMapContainsThenArrayContainsFrom!368 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111543 () Bool)

(assert (=> b!1138701 (= c!111543 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!759562 () Bool)

(declare-fun e!647901 () Bool)

(assert (=> b!1138701 (= res!759562 e!647901)))

(declare-fun e!647900 () Bool)

(assert (=> b!1138701 (=> (not res!759562) (not e!647900))))

(assert (=> b!1138701 e!647900))

(declare-fun lt!506531 () Unit!37170)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74002 (_ BitVec 32) (_ BitVec 32)) Unit!37170)

(assert (=> b!1138701 (= lt!506531 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!24977 0))(
  ( (Nil!24974) (Cons!24973 (h!26182 (_ BitVec 64)) (t!36039 List!24977)) )
))
(declare-fun arrayNoDuplicates!0 (array!74002 (_ BitVec 32) List!24977) Bool)

(assert (=> b!1138701 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24974)))

(declare-fun lt!506528 () Unit!37170)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74002 (_ BitVec 64) (_ BitVec 32) List!24977) Unit!37170)

(assert (=> b!1138701 (= lt!506528 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24974))))

(assert (=> b!1138701 false))

(declare-fun b!1138702 () Bool)

(declare-fun e!647903 () Bool)

(declare-fun tp_is_empty!28609 () Bool)

(assert (=> b!1138702 (= e!647903 tp_is_empty!28609)))

(declare-fun b!1138704 () Bool)

(declare-fun res!759566 () Bool)

(declare-fun e!647910 () Bool)

(assert (=> b!1138704 (=> (not res!759566) (not e!647910))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1138704 (= res!759566 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36190 _keys!1208))))))

(declare-fun b!1138705 () Bool)

(declare-fun res!759559 () Bool)

(assert (=> b!1138705 (=> (not res!759559) (not e!647910))))

(assert (=> b!1138705 (= res!759559 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24974))))

(declare-fun b!1138706 () Bool)

(declare-fun arrayContainsKey!0 (array!74002 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1138706 (= e!647900 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1138707 () Bool)

(assert (=> b!1138707 (= e!647901 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!506533) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1138708 () Bool)

(declare-fun call!50470 () Bool)

(assert (=> b!1138708 call!50470))

(declare-fun lt!506537 () Unit!37170)

(assert (=> b!1138708 (= lt!506537 call!50469)))

(declare-fun e!647898 () Unit!37170)

(assert (=> b!1138708 (= e!647898 lt!506537)))

(declare-fun b!1138709 () Bool)

(declare-fun res!759556 () Bool)

(assert (=> b!1138709 (=> (not res!759556) (not e!647910))))

(assert (=> b!1138709 (= res!759556 (and (= (size!36189 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36190 _keys!1208) (size!36189 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1138710 () Bool)

(declare-fun e!647905 () Unit!37170)

(assert (=> b!1138710 (= e!647905 e!647898)))

(declare-fun c!111547 () Bool)

(assert (=> b!1138710 (= c!111547 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!506533))))

(declare-fun b!1138711 () Bool)

(declare-fun res!759563 () Bool)

(declare-fun e!647902 () Bool)

(assert (=> b!1138711 (=> (not res!759563) (not e!647902))))

(declare-fun lt!506535 () array!74002)

(assert (=> b!1138711 (= res!759563 (arrayNoDuplicates!0 lt!506535 #b00000000000000000000000000000000 Nil!24974))))

(declare-fun lt!506534 () array!74000)

(declare-fun bm!50466 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4613 (array!74002 array!74000 (_ BitVec 32) (_ BitVec 32) V!43273 V!43273 (_ BitVec 32) Int) ListLongMap!16205)

(assert (=> bm!50466 (= call!50471 (getCurrentListMapNoExtraKeys!4613 lt!506535 lt!506534 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138712 () Bool)

(declare-fun Unit!37173 () Unit!37170)

(assert (=> b!1138712 (= e!647898 Unit!37173)))

(declare-fun b!1138713 () Bool)

(declare-fun res!759568 () Bool)

(assert (=> b!1138713 (=> (not res!759568) (not e!647910))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74002 (_ BitVec 32)) Bool)

(assert (=> b!1138713 (= res!759568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!50467 () Bool)

(declare-fun call!50474 () Bool)

(assert (=> bm!50467 (= call!50470 call!50474)))

(declare-fun bm!50468 () Bool)

(assert (=> bm!50468 (= call!50473 (getCurrentListMapNoExtraKeys!4613 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138714 () Bool)

(declare-fun e!647906 () Bool)

(assert (=> b!1138714 (= e!647902 (not e!647906))))

(declare-fun res!759560 () Bool)

(assert (=> b!1138714 (=> res!759560 e!647906)))

(assert (=> b!1138714 (= res!759560 (bvsgt from!1455 i!673))))

(assert (=> b!1138714 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!506541 () Unit!37170)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74002 (_ BitVec 64) (_ BitVec 32)) Unit!37170)

(assert (=> b!1138714 (= lt!506541 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1138715 () Bool)

(assert (=> b!1138715 (= e!647912 tp_is_empty!28609)))

(declare-fun b!1138716 () Bool)

(declare-fun e!647908 () Bool)

(assert (=> b!1138716 (= e!647906 e!647908)))

(declare-fun res!759557 () Bool)

(assert (=> b!1138716 (=> res!759557 e!647908)))

(assert (=> b!1138716 (= res!759557 (not (= from!1455 i!673)))))

(declare-fun lt!506543 () ListLongMap!16205)

(assert (=> b!1138716 (= lt!506543 (getCurrentListMapNoExtraKeys!4613 lt!506535 lt!506534 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2601 (Int (_ BitVec 64)) V!43273)

(assert (=> b!1138716 (= lt!506534 (array!74001 (store (arr!35651 _values!996) i!673 (ValueCellFull!13595 (dynLambda!2601 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36189 _values!996)))))

(declare-fun lt!506530 () ListLongMap!16205)

(assert (=> b!1138716 (= lt!506530 (getCurrentListMapNoExtraKeys!4613 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1138717 () Bool)

(declare-fun Unit!37174 () Unit!37170)

(assert (=> b!1138717 (= e!647911 Unit!37174)))

(declare-fun b!1138718 () Bool)

(declare-fun res!759561 () Bool)

(assert (=> b!1138718 (=> (not res!759561) (not e!647910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1138718 (= res!759561 (validMask!0 mask!1564))))

(declare-fun b!1138719 () Bool)

(declare-fun e!647904 () Bool)

(assert (=> b!1138719 (= e!647904 (and e!647903 mapRes!44738))))

(declare-fun condMapEmpty!44738 () Bool)

(declare-fun mapDefault!44738 () ValueCell!13595)

(assert (=> b!1138719 (= condMapEmpty!44738 (= (arr!35651 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13595)) mapDefault!44738)))))

(declare-fun c!111544 () Bool)

(declare-fun lt!506540 () ListLongMap!16205)

(declare-fun lt!506529 () ListLongMap!16205)

(declare-fun bm!50469 () Bool)

(declare-fun addStillContains!764 (ListLongMap!16205 (_ BitVec 64) V!43273 (_ BitVec 64)) Unit!37170)

(assert (=> bm!50469 (= call!50468 (addStillContains!764 (ite c!111546 lt!506529 lt!506540) (ite c!111546 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111544 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111546 minValue!944 (ite c!111544 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1138720 () Bool)

(declare-fun res!759567 () Bool)

(assert (=> b!1138720 (=> (not res!759567) (not e!647910))))

(assert (=> b!1138720 (= res!759567 (= (select (arr!35652 _keys!1208) i!673) k0!934))))

(declare-fun bm!50470 () Bool)

(declare-fun contains!6590 (ListLongMap!16205 (_ BitVec 64)) Bool)

(assert (=> bm!50470 (= call!50474 (contains!6590 (ite c!111546 lt!506529 call!50467) k0!934))))

(declare-fun b!1138721 () Bool)

(assert (=> b!1138721 (= c!111544 (and (not lt!506533) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1138721 (= e!647909 e!647905)))

(declare-fun b!1138722 () Bool)

(declare-fun e!647913 () Bool)

(assert (=> b!1138722 (= e!647913 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!36190 _keys!1208))))))

(declare-fun lt!506539 () Unit!37170)

(assert (=> b!1138722 (= lt!506539 e!647911)))

(declare-fun c!111545 () Bool)

(assert (=> b!1138722 (= c!111545 (contains!6590 lt!506540 k0!934))))

(assert (=> b!1138722 (= lt!506540 (getCurrentListMapNoExtraKeys!4613 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138723 () Bool)

(assert (=> b!1138723 (= e!647908 e!647913)))

(declare-fun res!759558 () Bool)

(assert (=> b!1138723 (=> res!759558 e!647913)))

(assert (=> b!1138723 (= res!759558 (not (= (select (arr!35652 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1138723 e!647899))

(declare-fun c!111548 () Bool)

(assert (=> b!1138723 (= c!111548 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!506542 () Unit!37170)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!492 (array!74002 array!74000 (_ BitVec 32) (_ BitVec 32) V!43273 V!43273 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37170)

(assert (=> b!1138723 (= lt!506542 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!492 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1138724 () Bool)

(assert (=> b!1138724 (= e!647910 e!647902)))

(declare-fun res!759569 () Bool)

(assert (=> b!1138724 (=> (not res!759569) (not e!647902))))

(assert (=> b!1138724 (= res!759569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!506535 mask!1564))))

(assert (=> b!1138724 (= lt!506535 (array!74003 (store (arr!35652 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36190 _keys!1208)))))

(declare-fun b!1138725 () Bool)

(assert (=> b!1138725 (= e!647901 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!50471 () Bool)

(declare-fun +!3545 (ListLongMap!16205 tuple2!18236) ListLongMap!16205)

(assert (=> bm!50471 (= call!50472 (+!3545 lt!506540 (ite (or c!111546 c!111544) (tuple2!18237 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18237 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1138726 () Bool)

(assert (=> b!1138726 (= e!647899 (= call!50471 call!50473))))

(declare-fun b!1138727 () Bool)

(declare-fun res!759564 () Bool)

(assert (=> b!1138727 (=> (not res!759564) (not e!647910))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1138727 (= res!759564 (validKeyInArray!0 k0!934))))

(declare-fun b!1138728 () Bool)

(declare-fun lt!506544 () Unit!37170)

(assert (=> b!1138728 (= e!647905 lt!506544)))

(assert (=> b!1138728 (= lt!506544 call!50469)))

(assert (=> b!1138728 call!50470))

(declare-fun res!759565 () Bool)

(assert (=> start!98468 (=> (not res!759565) (not e!647910))))

(assert (=> start!98468 (= res!759565 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36190 _keys!1208))))))

(assert (=> start!98468 e!647910))

(assert (=> start!98468 tp_is_empty!28609))

(declare-fun array_inv!27400 (array!74002) Bool)

(assert (=> start!98468 (array_inv!27400 _keys!1208)))

(assert (=> start!98468 true))

(assert (=> start!98468 tp!84947))

(declare-fun array_inv!27401 (array!74000) Bool)

(assert (=> start!98468 (and (array_inv!27401 _values!996) e!647904)))

(declare-fun b!1138703 () Bool)

(assert (=> b!1138703 (contains!6590 (+!3545 lt!506529 (tuple2!18237 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun lt!506536 () Unit!37170)

(assert (=> b!1138703 (= lt!506536 call!50468)))

(assert (=> b!1138703 call!50474))

(assert (=> b!1138703 (= lt!506529 call!50472)))

(declare-fun lt!506532 () Unit!37170)

(assert (=> b!1138703 (= lt!506532 (addStillContains!764 lt!506540 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1138703 (= e!647909 lt!506536)))

(assert (= (and start!98468 res!759565) b!1138718))

(assert (= (and b!1138718 res!759561) b!1138709))

(assert (= (and b!1138709 res!759556) b!1138713))

(assert (= (and b!1138713 res!759568) b!1138705))

(assert (= (and b!1138705 res!759559) b!1138704))

(assert (= (and b!1138704 res!759566) b!1138727))

(assert (= (and b!1138727 res!759564) b!1138720))

(assert (= (and b!1138720 res!759567) b!1138724))

(assert (= (and b!1138724 res!759569) b!1138711))

(assert (= (and b!1138711 res!759563) b!1138714))

(assert (= (and b!1138714 (not res!759560)) b!1138716))

(assert (= (and b!1138716 (not res!759557)) b!1138723))

(assert (= (and b!1138723 c!111548) b!1138700))

(assert (= (and b!1138723 (not c!111548)) b!1138726))

(assert (= (or b!1138700 b!1138726) bm!50466))

(assert (= (or b!1138700 b!1138726) bm!50468))

(assert (= (and b!1138723 (not res!759558)) b!1138722))

(assert (= (and b!1138722 c!111545) b!1138701))

(assert (= (and b!1138722 (not c!111545)) b!1138717))

(assert (= (and b!1138701 c!111546) b!1138703))

(assert (= (and b!1138701 (not c!111546)) b!1138721))

(assert (= (and b!1138721 c!111544) b!1138728))

(assert (= (and b!1138721 (not c!111544)) b!1138710))

(assert (= (and b!1138710 c!111547) b!1138708))

(assert (= (and b!1138710 (not c!111547)) b!1138712))

(assert (= (or b!1138728 b!1138708) bm!50465))

(assert (= (or b!1138728 b!1138708) bm!50464))

(assert (= (or b!1138728 b!1138708) bm!50467))

(assert (= (or b!1138703 bm!50467) bm!50470))

(assert (= (or b!1138703 bm!50465) bm!50469))

(assert (= (or b!1138703 bm!50464) bm!50471))

(assert (= (and b!1138701 c!111543) b!1138725))

(assert (= (and b!1138701 (not c!111543)) b!1138707))

(assert (= (and b!1138701 res!759562) b!1138706))

(assert (= (and b!1138719 condMapEmpty!44738) mapIsEmpty!44738))

(assert (= (and b!1138719 (not condMapEmpty!44738)) mapNonEmpty!44738))

(get-info :version)

(assert (= (and mapNonEmpty!44738 ((_ is ValueCellFull!13595) mapValue!44738)) b!1138715))

(assert (= (and b!1138719 ((_ is ValueCellFull!13595) mapDefault!44738)) b!1138702))

(assert (= start!98468 b!1138719))

(declare-fun b_lambda!19167 () Bool)

(assert (=> (not b_lambda!19167) (not b!1138716)))

(declare-fun t!36037 () Bool)

(declare-fun tb!8883 () Bool)

(assert (=> (and start!98468 (= defaultEntry!1004 defaultEntry!1004) t!36037) tb!8883))

(declare-fun result!18339 () Bool)

(assert (=> tb!8883 (= result!18339 tp_is_empty!28609)))

(assert (=> b!1138716 t!36037))

(declare-fun b_and!38987 () Bool)

(assert (= b_and!38985 (and (=> t!36037 result!18339) b_and!38987)))

(declare-fun m!1049987 () Bool)

(assert (=> b!1138701 m!1049987))

(declare-fun m!1049989 () Bool)

(assert (=> b!1138701 m!1049989))

(declare-fun m!1049991 () Bool)

(assert (=> b!1138701 m!1049991))

(declare-fun m!1049993 () Bool)

(assert (=> b!1138701 m!1049993))

(declare-fun m!1049995 () Bool)

(assert (=> bm!50471 m!1049995))

(declare-fun m!1049997 () Bool)

(assert (=> b!1138713 m!1049997))

(declare-fun m!1049999 () Bool)

(assert (=> b!1138720 m!1049999))

(declare-fun m!1050001 () Bool)

(assert (=> b!1138718 m!1050001))

(declare-fun m!1050003 () Bool)

(assert (=> bm!50468 m!1050003))

(declare-fun m!1050005 () Bool)

(assert (=> b!1138716 m!1050005))

(declare-fun m!1050007 () Bool)

(assert (=> b!1138716 m!1050007))

(declare-fun m!1050009 () Bool)

(assert (=> b!1138716 m!1050009))

(declare-fun m!1050011 () Bool)

(assert (=> b!1138716 m!1050011))

(declare-fun m!1050013 () Bool)

(assert (=> bm!50469 m!1050013))

(declare-fun m!1050015 () Bool)

(assert (=> start!98468 m!1050015))

(declare-fun m!1050017 () Bool)

(assert (=> start!98468 m!1050017))

(declare-fun m!1050019 () Bool)

(assert (=> mapNonEmpty!44738 m!1050019))

(declare-fun m!1050021 () Bool)

(assert (=> b!1138703 m!1050021))

(assert (=> b!1138703 m!1050021))

(declare-fun m!1050023 () Bool)

(assert (=> b!1138703 m!1050023))

(declare-fun m!1050025 () Bool)

(assert (=> b!1138703 m!1050025))

(declare-fun m!1050027 () Bool)

(assert (=> b!1138700 m!1050027))

(declare-fun m!1050029 () Bool)

(assert (=> b!1138711 m!1050029))

(declare-fun m!1050031 () Bool)

(assert (=> bm!50470 m!1050031))

(declare-fun m!1050033 () Bool)

(assert (=> b!1138706 m!1050033))

(declare-fun m!1050035 () Bool)

(assert (=> b!1138723 m!1050035))

(declare-fun m!1050037 () Bool)

(assert (=> b!1138723 m!1050037))

(declare-fun m!1050039 () Bool)

(assert (=> b!1138727 m!1050039))

(declare-fun m!1050041 () Bool)

(assert (=> b!1138722 m!1050041))

(assert (=> b!1138722 m!1050003))

(declare-fun m!1050043 () Bool)

(assert (=> b!1138724 m!1050043))

(declare-fun m!1050045 () Bool)

(assert (=> b!1138724 m!1050045))

(assert (=> b!1138725 m!1050033))

(declare-fun m!1050047 () Bool)

(assert (=> b!1138714 m!1050047))

(declare-fun m!1050049 () Bool)

(assert (=> b!1138714 m!1050049))

(declare-fun m!1050051 () Bool)

(assert (=> b!1138705 m!1050051))

(declare-fun m!1050053 () Bool)

(assert (=> bm!50466 m!1050053))

(check-sat (not b!1138727) (not b!1138725) (not mapNonEmpty!44738) (not b!1138706) b_and!38987 (not b!1138714) (not bm!50471) (not b_lambda!19167) (not b!1138713) (not b!1138716) (not b!1138705) (not bm!50468) (not b!1138700) (not b!1138723) (not b!1138701) (not b!1138703) tp_is_empty!28609 (not b!1138711) (not start!98468) (not b!1138722) (not b!1138724) (not b!1138718) (not bm!50469) (not bm!50470) (not b_next!24079) (not bm!50466))
(check-sat b_and!38987 (not b_next!24079))
