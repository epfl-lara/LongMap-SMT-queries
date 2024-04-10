; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98664 () Bool)

(assert start!98664)

(declare-fun b_free!24269 () Bool)

(declare-fun b_next!24269 () Bool)

(assert (=> start!98664 (= b_free!24269 (not b_next!24269))))

(declare-fun tp!85517 () Bool)

(declare-fun b_and!39387 () Bool)

(assert (=> start!98664 (= tp!85517 b_and!39387)))

(declare-fun b!1147386 () Bool)

(declare-fun res!763732 () Bool)

(declare-fun e!652657 () Bool)

(assert (=> b!1147386 (=> (not res!763732) (not e!652657))))

(declare-datatypes ((array!74445 0))(
  ( (array!74446 (arr!35873 (Array (_ BitVec 32) (_ BitVec 64))) (size!36409 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74445)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!43525 0))(
  ( (V!43526 (val!14456 Int)) )
))
(declare-datatypes ((ValueCell!13690 0))(
  ( (ValueCellFull!13690 (v!17093 V!43525)) (EmptyCell!13690) )
))
(declare-datatypes ((array!74447 0))(
  ( (array!74448 (arr!35874 (Array (_ BitVec 32) ValueCell!13690)) (size!36410 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74447)

(assert (=> b!1147386 (= res!763732 (and (= (size!36410 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36409 _keys!1208) (size!36410 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1147387 () Bool)

(declare-fun res!763720 () Bool)

(assert (=> b!1147387 (=> (not res!763720) (not e!652657))))

(declare-datatypes ((List!25075 0))(
  ( (Nil!25072) (Cons!25071 (h!26280 (_ BitVec 64)) (t!36336 List!25075)) )
))
(declare-fun arrayNoDuplicates!0 (array!74445 (_ BitVec 32) List!25075) Bool)

(assert (=> b!1147387 (= res!763720 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25072))))

(declare-fun lt!512670 () Bool)

(declare-fun b!1147388 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!652644 () Bool)

(assert (=> b!1147388 (= e!652644 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!512670) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1147389 () Bool)

(declare-fun arrayContainsKey!0 (array!74445 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1147389 (= e!652644 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1147390 () Bool)

(declare-fun res!763733 () Bool)

(assert (=> b!1147390 (=> (not res!763733) (not e!652657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1147390 (= res!763733 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!45023 () Bool)

(declare-fun mapRes!45023 () Bool)

(declare-fun tp!85518 () Bool)

(declare-fun e!652647 () Bool)

(assert (=> mapNonEmpty!45023 (= mapRes!45023 (and tp!85518 e!652647))))

(declare-fun mapValue!45023 () ValueCell!13690)

(declare-fun mapRest!45023 () (Array (_ BitVec 32) ValueCell!13690))

(declare-fun mapKey!45023 () (_ BitVec 32))

(assert (=> mapNonEmpty!45023 (= (arr!35874 _values!996) (store mapRest!45023 mapKey!45023 mapValue!45023))))

(declare-fun b!1147391 () Bool)

(declare-datatypes ((Unit!37687 0))(
  ( (Unit!37688) )
))
(declare-fun e!652649 () Unit!37687)

(declare-fun Unit!37689 () Unit!37687)

(assert (=> b!1147391 (= e!652649 Unit!37689)))

(assert (=> b!1147391 (= lt!512670 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!113282 () Bool)

(assert (=> b!1147391 (= c!113282 (and (not lt!512670) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!512680 () Unit!37687)

(declare-fun e!652655 () Unit!37687)

(assert (=> b!1147391 (= lt!512680 e!652655)))

(declare-fun zeroValue!944 () V!43525)

(declare-fun lt!512672 () Unit!37687)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43525)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!431 (array!74445 array!74447 (_ BitVec 32) (_ BitVec 32) V!43525 V!43525 (_ BitVec 64) (_ BitVec 32) Int) Unit!37687)

(assert (=> b!1147391 (= lt!512672 (lemmaListMapContainsThenArrayContainsFrom!431 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113280 () Bool)

(assert (=> b!1147391 (= c!113280 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!763723 () Bool)

(assert (=> b!1147391 (= res!763723 e!652644)))

(declare-fun e!652656 () Bool)

(assert (=> b!1147391 (=> (not res!763723) (not e!652656))))

(assert (=> b!1147391 e!652656))

(declare-fun lt!512684 () Unit!37687)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74445 (_ BitVec 32) (_ BitVec 32)) Unit!37687)

(assert (=> b!1147391 (= lt!512684 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1147391 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25072)))

(declare-fun lt!512671 () Unit!37687)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74445 (_ BitVec 64) (_ BitVec 32) List!25075) Unit!37687)

(assert (=> b!1147391 (= lt!512671 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25072))))

(assert (=> b!1147391 false))

(declare-fun b!1147392 () Bool)

(declare-fun tp_is_empty!28799 () Bool)

(assert (=> b!1147392 (= e!652647 tp_is_empty!28799)))

(declare-fun mapIsEmpty!45023 () Bool)

(assert (=> mapIsEmpty!45023 mapRes!45023))

(declare-fun bm!52767 () Bool)

(declare-fun call!52774 () Unit!37687)

(declare-fun call!52770 () Unit!37687)

(assert (=> bm!52767 (= call!52774 call!52770)))

(declare-fun b!1147393 () Bool)

(declare-fun e!652648 () Unit!37687)

(declare-fun lt!512669 () Unit!37687)

(assert (=> b!1147393 (= e!652648 lt!512669)))

(assert (=> b!1147393 (= lt!512669 call!52774)))

(declare-fun call!52773 () Bool)

(assert (=> b!1147393 call!52773))

(declare-fun b!1147394 () Bool)

(declare-fun e!652646 () Bool)

(declare-fun e!652658 () Bool)

(assert (=> b!1147394 (= e!652646 e!652658)))

(declare-fun res!763725 () Bool)

(assert (=> b!1147394 (=> res!763725 e!652658)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1147394 (= res!763725 (not (= from!1455 i!673)))))

(declare-fun lt!512678 () array!74447)

(declare-datatypes ((tuple2!18324 0))(
  ( (tuple2!18325 (_1!9173 (_ BitVec 64)) (_2!9173 V!43525)) )
))
(declare-datatypes ((List!25076 0))(
  ( (Nil!25073) (Cons!25072 (h!26281 tuple2!18324) (t!36337 List!25076)) )
))
(declare-datatypes ((ListLongMap!16293 0))(
  ( (ListLongMap!16294 (toList!8162 List!25076)) )
))
(declare-fun lt!512681 () ListLongMap!16293)

(declare-fun lt!512677 () array!74445)

(declare-fun getCurrentListMapNoExtraKeys!4636 (array!74445 array!74447 (_ BitVec 32) (_ BitVec 32) V!43525 V!43525 (_ BitVec 32) Int) ListLongMap!16293)

(assert (=> b!1147394 (= lt!512681 (getCurrentListMapNoExtraKeys!4636 lt!512677 lt!512678 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!512665 () V!43525)

(assert (=> b!1147394 (= lt!512678 (array!74448 (store (arr!35874 _values!996) i!673 (ValueCellFull!13690 lt!512665)) (size!36410 _values!996)))))

(declare-fun dynLambda!2666 (Int (_ BitVec 64)) V!43525)

(assert (=> b!1147394 (= lt!512665 (dynLambda!2666 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!512667 () ListLongMap!16293)

(assert (=> b!1147394 (= lt!512667 (getCurrentListMapNoExtraKeys!4636 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1147395 () Bool)

(declare-fun e!652659 () Bool)

(assert (=> b!1147395 (= e!652657 e!652659)))

(declare-fun res!763726 () Bool)

(assert (=> b!1147395 (=> (not res!763726) (not e!652659))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74445 (_ BitVec 32)) Bool)

(assert (=> b!1147395 (= res!763726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!512677 mask!1564))))

(assert (=> b!1147395 (= lt!512677 (array!74446 (store (arr!35873 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36409 _keys!1208)))))

(declare-fun b!1147396 () Bool)

(declare-fun res!763724 () Bool)

(assert (=> b!1147396 (=> (not res!763724) (not e!652657))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1147396 (= res!763724 (validKeyInArray!0 k!934))))

(declare-fun call!52777 () ListLongMap!16293)

(declare-fun bm!52768 () Bool)

(assert (=> bm!52768 (= call!52777 (getCurrentListMapNoExtraKeys!4636 lt!512677 lt!512678 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!763722 () Bool)

(assert (=> start!98664 (=> (not res!763722) (not e!652657))))

(assert (=> start!98664 (= res!763722 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36409 _keys!1208))))))

(assert (=> start!98664 e!652657))

(assert (=> start!98664 tp_is_empty!28799))

(declare-fun array_inv!27478 (array!74445) Bool)

(assert (=> start!98664 (array_inv!27478 _keys!1208)))

(assert (=> start!98664 true))

(assert (=> start!98664 tp!85517))

(declare-fun e!652645 () Bool)

(declare-fun array_inv!27479 (array!74447) Bool)

(assert (=> start!98664 (and (array_inv!27479 _values!996) e!652645)))

(declare-fun b!1147397 () Bool)

(declare-fun e!652650 () Bool)

(assert (=> b!1147397 (= e!652658 e!652650)))

(declare-fun res!763730 () Bool)

(assert (=> b!1147397 (=> res!763730 e!652650)))

(assert (=> b!1147397 (= res!763730 (not (= (select (arr!35873 _keys!1208) from!1455) k!934)))))

(declare-fun e!652651 () Bool)

(assert (=> b!1147397 e!652651))

(declare-fun c!113279 () Bool)

(assert (=> b!1147397 (= c!113279 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!512682 () Unit!37687)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!536 (array!74445 array!74447 (_ BitVec 32) (_ BitVec 32) V!43525 V!43525 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37687)

(assert (=> b!1147397 (= lt!512682 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!536 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147398 () Bool)

(declare-fun res!763728 () Bool)

(assert (=> b!1147398 (=> (not res!763728) (not e!652659))))

(assert (=> b!1147398 (= res!763728 (arrayNoDuplicates!0 lt!512677 #b00000000000000000000000000000000 Nil!25072))))

(declare-fun b!1147399 () Bool)

(declare-fun res!763731 () Bool)

(assert (=> b!1147399 (=> (not res!763731) (not e!652657))))

(assert (=> b!1147399 (= res!763731 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36409 _keys!1208))))))

(declare-fun b!1147400 () Bool)

(declare-fun e!652654 () Unit!37687)

(declare-fun Unit!37690 () Unit!37687)

(assert (=> b!1147400 (= e!652654 Unit!37690)))

(declare-fun b!1147401 () Bool)

(declare-fun lt!512666 () ListLongMap!16293)

(declare-fun contains!6685 (ListLongMap!16293 (_ BitVec 64)) Bool)

(declare-fun +!3585 (ListLongMap!16293 tuple2!18324) ListLongMap!16293)

(assert (=> b!1147401 (contains!6685 (+!3585 lt!512666 (tuple2!18325 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!512676 () Unit!37687)

(declare-fun addStillContains!837 (ListLongMap!16293 (_ BitVec 64) V!43525 (_ BitVec 64)) Unit!37687)

(assert (=> b!1147401 (= lt!512676 (addStillContains!837 lt!512666 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!52772 () Bool)

(assert (=> b!1147401 call!52772))

(declare-fun call!52776 () ListLongMap!16293)

(assert (=> b!1147401 (= lt!512666 call!52776)))

(declare-fun lt!512685 () Unit!37687)

(assert (=> b!1147401 (= lt!512685 call!52770)))

(assert (=> b!1147401 (= e!652655 lt!512676)))

(declare-fun b!1147402 () Bool)

(declare-fun c!113281 () Bool)

(assert (=> b!1147402 (= c!113281 (and (not lt!512670) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1147402 (= e!652655 e!652648)))

(declare-fun b!1147403 () Bool)

(declare-fun e!652653 () Bool)

(assert (=> b!1147403 (= e!652653 tp_is_empty!28799)))

(declare-fun bm!52769 () Bool)

(declare-fun lt!512675 () ListLongMap!16293)

(assert (=> bm!52769 (= call!52776 (+!3585 lt!512675 (ite (or c!113282 c!113281) (tuple2!18325 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18325 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1147404 () Bool)

(assert (=> b!1147404 call!52773))

(declare-fun lt!512668 () Unit!37687)

(assert (=> b!1147404 (= lt!512668 call!52774)))

(assert (=> b!1147404 (= e!652654 lt!512668)))

(declare-fun b!1147405 () Bool)

(assert (=> b!1147405 (= e!652648 e!652654)))

(declare-fun c!113284 () Bool)

(assert (=> b!1147405 (= c!113284 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!512670))))

(declare-fun b!1147406 () Bool)

(declare-fun res!763729 () Bool)

(assert (=> b!1147406 (=> (not res!763729) (not e!652657))))

(assert (=> b!1147406 (= res!763729 (= (select (arr!35873 _keys!1208) i!673) k!934))))

(declare-fun b!1147407 () Bool)

(declare-fun call!52775 () ListLongMap!16293)

(declare-fun -!1298 (ListLongMap!16293 (_ BitVec 64)) ListLongMap!16293)

(assert (=> b!1147407 (= e!652651 (= call!52777 (-!1298 call!52775 k!934)))))

(declare-fun bm!52770 () Bool)

(assert (=> bm!52770 (= call!52775 (getCurrentListMapNoExtraKeys!4636 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147408 () Bool)

(declare-fun e!652652 () Bool)

(assert (=> b!1147408 (= e!652652 (= (-!1298 lt!512667 k!934) lt!512675))))

(declare-fun b!1147409 () Bool)

(assert (=> b!1147409 (= e!652651 (= call!52777 call!52775))))

(declare-fun b!1147410 () Bool)

(declare-fun Unit!37691 () Unit!37687)

(assert (=> b!1147410 (= e!652649 Unit!37691)))

(declare-fun bm!52771 () Bool)

(declare-fun call!52771 () ListLongMap!16293)

(assert (=> bm!52771 (= call!52771 call!52776)))

(declare-fun b!1147411 () Bool)

(assert (=> b!1147411 (= e!652650 true)))

(assert (=> b!1147411 e!652652))

(declare-fun res!763719 () Bool)

(assert (=> b!1147411 (=> (not res!763719) (not e!652652))))

(declare-fun lt!512679 () V!43525)

(assert (=> b!1147411 (= res!763719 (= (-!1298 (+!3585 lt!512675 (tuple2!18325 (select (arr!35873 _keys!1208) from!1455) lt!512679)) (select (arr!35873 _keys!1208) from!1455)) lt!512675))))

(declare-fun lt!512673 () Unit!37687)

(declare-fun addThenRemoveForNewKeyIsSame!146 (ListLongMap!16293 (_ BitVec 64) V!43525) Unit!37687)

(assert (=> b!1147411 (= lt!512673 (addThenRemoveForNewKeyIsSame!146 lt!512675 (select (arr!35873 _keys!1208) from!1455) lt!512679))))

(declare-fun get!18248 (ValueCell!13690 V!43525) V!43525)

(assert (=> b!1147411 (= lt!512679 (get!18248 (select (arr!35874 _values!996) from!1455) lt!512665))))

(declare-fun lt!512683 () Unit!37687)

(assert (=> b!1147411 (= lt!512683 e!652649)))

(declare-fun c!113283 () Bool)

(assert (=> b!1147411 (= c!113283 (contains!6685 lt!512675 k!934))))

(assert (=> b!1147411 (= lt!512675 (getCurrentListMapNoExtraKeys!4636 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1147412 () Bool)

(assert (=> b!1147412 (= e!652659 (not e!652646))))

(declare-fun res!763721 () Bool)

(assert (=> b!1147412 (=> res!763721 e!652646)))

(assert (=> b!1147412 (= res!763721 (bvsgt from!1455 i!673))))

(assert (=> b!1147412 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!512674 () Unit!37687)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74445 (_ BitVec 64) (_ BitVec 32)) Unit!37687)

(assert (=> b!1147412 (= lt!512674 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1147413 () Bool)

(assert (=> b!1147413 (= e!652645 (and e!652653 mapRes!45023))))

(declare-fun condMapEmpty!45023 () Bool)

(declare-fun mapDefault!45023 () ValueCell!13690)

