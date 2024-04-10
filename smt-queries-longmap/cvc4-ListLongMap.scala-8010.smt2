; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98904 () Bool)

(assert start!98904)

(declare-fun b_free!24509 () Bool)

(declare-fun b_next!24509 () Bool)

(assert (=> start!98904 (= b_free!24509 (not b_next!24509))))

(declare-fun tp!86238 () Bool)

(declare-fun b_and!39867 () Bool)

(assert (=> start!98904 (= tp!86238 b_and!39867)))

(declare-fun call!55653 () Bool)

(declare-datatypes ((V!43845 0))(
  ( (V!43846 (val!14576 Int)) )
))
(declare-datatypes ((tuple2!18554 0))(
  ( (tuple2!18555 (_1!9288 (_ BitVec 64)) (_2!9288 V!43845)) )
))
(declare-datatypes ((List!25293 0))(
  ( (Nil!25290) (Cons!25289 (h!26498 tuple2!18554) (t!36794 List!25293)) )
))
(declare-datatypes ((ListLongMap!16523 0))(
  ( (ListLongMap!16524 (toList!8277 List!25293)) )
))
(declare-fun lt!520546 () ListLongMap!16523)

(declare-fun bm!55647 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun call!55654 () ListLongMap!16523)

(declare-fun c!115442 () Bool)

(declare-fun contains!6787 (ListLongMap!16523 (_ BitVec 64)) Bool)

(assert (=> bm!55647 (= call!55653 (contains!6787 (ite c!115442 lt!520546 call!55654) k!934))))

(declare-fun b!1158426 () Bool)

(declare-fun e!658773 () Bool)

(declare-fun call!55650 () ListLongMap!16523)

(declare-fun call!55651 () ListLongMap!16523)

(assert (=> b!1158426 (= e!658773 (= call!55650 call!55651))))

(declare-fun zeroValue!944 () V!43845)

(declare-datatypes ((array!74921 0))(
  ( (array!74922 (arr!36111 (Array (_ BitVec 32) (_ BitVec 64))) (size!36647 (_ BitVec 32))) )
))
(declare-fun lt!520538 () array!74921)

(declare-fun bm!55648 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13810 0))(
  ( (ValueCellFull!13810 (v!17213 V!43845)) (EmptyCell!13810) )
))
(declare-datatypes ((array!74923 0))(
  ( (array!74924 (arr!36112 (Array (_ BitVec 32) ValueCell!13810)) (size!36648 (_ BitVec 32))) )
))
(declare-fun lt!520532 () array!74923)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43845)

(declare-fun getCurrentListMapNoExtraKeys!4742 (array!74921 array!74923 (_ BitVec 32) (_ BitVec 32) V!43845 V!43845 (_ BitVec 32) Int) ListLongMap!16523)

(assert (=> bm!55648 (= call!55650 (getCurrentListMapNoExtraKeys!4742 lt!520538 lt!520532 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _keys!1208 () array!74921)

(declare-fun b!1158427 () Bool)

(declare-fun e!658774 () Bool)

(declare-fun arrayContainsKey!0 (array!74921 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1158427 (= e!658774 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1158428 () Bool)

(declare-fun e!658779 () Bool)

(declare-fun e!658778 () Bool)

(assert (=> b!1158428 (= e!658779 e!658778)))

(declare-fun res!769128 () Bool)

(assert (=> b!1158428 (=> (not res!769128) (not e!658778))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74921 (_ BitVec 32)) Bool)

(assert (=> b!1158428 (= res!769128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!520538 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1158428 (= lt!520538 (array!74922 (store (arr!36111 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36647 _keys!1208)))))

(declare-fun b!1158429 () Bool)

(declare-fun res!769122 () Bool)

(assert (=> b!1158429 (=> (not res!769122) (not e!658779))))

(declare-datatypes ((List!25294 0))(
  ( (Nil!25291) (Cons!25290 (h!26499 (_ BitVec 64)) (t!36795 List!25294)) )
))
(declare-fun arrayNoDuplicates!0 (array!74921 (_ BitVec 32) List!25294) Bool)

(assert (=> b!1158429 (= res!769122 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25291))))

(declare-fun b!1158430 () Bool)

(declare-fun +!3687 (ListLongMap!16523 tuple2!18554) ListLongMap!16523)

(assert (=> b!1158430 (contains!6787 (+!3687 lt!520546 (tuple2!18555 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-datatypes ((Unit!38172 0))(
  ( (Unit!38173) )
))
(declare-fun lt!520547 () Unit!38172)

(declare-fun call!55657 () Unit!38172)

(assert (=> b!1158430 (= lt!520547 call!55657)))

(assert (=> b!1158430 call!55653))

(declare-fun call!55655 () ListLongMap!16523)

(assert (=> b!1158430 (= lt!520546 call!55655)))

(declare-fun lt!520543 () ListLongMap!16523)

(declare-fun lt!520540 () Unit!38172)

(declare-fun addStillContains!928 (ListLongMap!16523 (_ BitVec 64) V!43845 (_ BitVec 64)) Unit!38172)

(assert (=> b!1158430 (= lt!520540 (addStillContains!928 lt!520543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k!934))))

(declare-fun e!658768 () Unit!38172)

(assert (=> b!1158430 (= e!658768 lt!520547)))

(declare-fun b!1158431 () Bool)

(declare-fun e!658776 () Bool)

(declare-fun tp_is_empty!29039 () Bool)

(assert (=> b!1158431 (= e!658776 tp_is_empty!29039)))

(declare-fun b!1158432 () Bool)

(declare-fun e!658775 () Bool)

(declare-fun e!658770 () Bool)

(assert (=> b!1158432 (= e!658775 e!658770)))

(declare-fun res!769126 () Bool)

(assert (=> b!1158432 (=> res!769126 e!658770)))

(assert (=> b!1158432 (= res!769126 (not (= (select (arr!36111 _keys!1208) from!1455) k!934)))))

(assert (=> b!1158432 e!658773))

(declare-fun c!115440 () Bool)

(assert (=> b!1158432 (= c!115440 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun _values!996 () array!74923)

(declare-fun lt!520542 () Unit!38172)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!621 (array!74921 array!74923 (_ BitVec 32) (_ BitVec 32) V!43845 V!43845 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38172)

(assert (=> b!1158432 (= lt!520542 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!621 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!55649 () Bool)

(declare-fun c!115441 () Bool)

(assert (=> bm!55649 (= call!55657 (addStillContains!928 (ite c!115442 lt!520546 lt!520543) (ite c!115442 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115441 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115442 minValue!944 (ite c!115441 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1158433 () Bool)

(declare-fun res!769127 () Bool)

(assert (=> b!1158433 (=> (not res!769127) (not e!658779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1158433 (= res!769127 (validMask!0 mask!1564))))

(declare-fun b!1158434 () Bool)

(declare-fun res!769124 () Bool)

(assert (=> b!1158434 (=> (not res!769124) (not e!658778))))

(assert (=> b!1158434 (= res!769124 (arrayNoDuplicates!0 lt!520538 #b00000000000000000000000000000000 Nil!25291))))

(declare-fun b!1158435 () Bool)

(declare-fun e!658767 () Bool)

(assert (=> b!1158435 (= e!658778 (not e!658767))))

(declare-fun res!769121 () Bool)

(assert (=> b!1158435 (=> res!769121 e!658767)))

(assert (=> b!1158435 (= res!769121 (bvsgt from!1455 i!673))))

(assert (=> b!1158435 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!520534 () Unit!38172)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74921 (_ BitVec 64) (_ BitVec 32)) Unit!38172)

(assert (=> b!1158435 (= lt!520534 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun mapNonEmpty!45383 () Bool)

(declare-fun mapRes!45383 () Bool)

(declare-fun tp!86237 () Bool)

(assert (=> mapNonEmpty!45383 (= mapRes!45383 (and tp!86237 e!658776))))

(declare-fun mapValue!45383 () ValueCell!13810)

(declare-fun mapKey!45383 () (_ BitVec 32))

(declare-fun mapRest!45383 () (Array (_ BitVec 32) ValueCell!13810))

(assert (=> mapNonEmpty!45383 (= (arr!36112 _values!996) (store mapRest!45383 mapKey!45383 mapValue!45383))))

(declare-fun b!1158436 () Bool)

(assert (=> b!1158436 (= e!658767 e!658775)))

(declare-fun res!769120 () Bool)

(assert (=> b!1158436 (=> res!769120 e!658775)))

(assert (=> b!1158436 (= res!769120 (not (= from!1455 i!673)))))

(declare-fun lt!520551 () ListLongMap!16523)

(assert (=> b!1158436 (= lt!520551 (getCurrentListMapNoExtraKeys!4742 lt!520538 lt!520532 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!520533 () V!43845)

(assert (=> b!1158436 (= lt!520532 (array!74924 (store (arr!36112 _values!996) i!673 (ValueCellFull!13810 lt!520533)) (size!36648 _values!996)))))

(declare-fun dynLambda!2747 (Int (_ BitVec 64)) V!43845)

(assert (=> b!1158436 (= lt!520533 (dynLambda!2747 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!520536 () ListLongMap!16523)

(assert (=> b!1158436 (= lt!520536 (getCurrentListMapNoExtraKeys!4742 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1158437 () Bool)

(declare-fun res!769130 () Bool)

(assert (=> b!1158437 (=> (not res!769130) (not e!658779))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1158437 (= res!769130 (validKeyInArray!0 k!934))))

(declare-fun b!1158438 () Bool)

(declare-fun lt!520531 () Bool)

(assert (=> b!1158438 (= c!115441 (and (not lt!520531) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!658771 () Unit!38172)

(assert (=> b!1158438 (= e!658768 e!658771)))

(declare-fun b!1158439 () Bool)

(declare-fun lt!520541 () Unit!38172)

(assert (=> b!1158439 (= e!658771 lt!520541)))

(declare-fun call!55656 () Unit!38172)

(assert (=> b!1158439 (= lt!520541 call!55656)))

(declare-fun call!55652 () Bool)

(assert (=> b!1158439 call!55652))

(declare-fun b!1158440 () Bool)

(declare-fun res!769132 () Bool)

(assert (=> b!1158440 (=> (not res!769132) (not e!658779))))

(assert (=> b!1158440 (= res!769132 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36647 _keys!1208))))))

(declare-fun b!1158441 () Bool)

(declare-fun res!769123 () Bool)

(assert (=> b!1158441 (=> (not res!769123) (not e!658779))))

(assert (=> b!1158441 (= res!769123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1158442 () Bool)

(assert (=> b!1158442 (= e!658774 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!520531) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!55650 () Bool)

(assert (=> bm!55650 (= call!55656 call!55657)))

(declare-fun b!1158443 () Bool)

(declare-fun e!658777 () Unit!38172)

(declare-fun Unit!38174 () Unit!38172)

(assert (=> b!1158443 (= e!658777 Unit!38174)))

(assert (=> b!1158443 (= lt!520531 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1158443 (= c!115442 (and (not lt!520531) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!520545 () Unit!38172)

(assert (=> b!1158443 (= lt!520545 e!658768)))

(declare-fun lt!520539 () Unit!38172)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!514 (array!74921 array!74923 (_ BitVec 32) (_ BitVec 32) V!43845 V!43845 (_ BitVec 64) (_ BitVec 32) Int) Unit!38172)

(assert (=> b!1158443 (= lt!520539 (lemmaListMapContainsThenArrayContainsFrom!514 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115444 () Bool)

(assert (=> b!1158443 (= c!115444 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!769131 () Bool)

(assert (=> b!1158443 (= res!769131 e!658774)))

(declare-fun e!658766 () Bool)

(assert (=> b!1158443 (=> (not res!769131) (not e!658766))))

(assert (=> b!1158443 e!658766))

(declare-fun lt!520544 () Unit!38172)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74921 (_ BitVec 32) (_ BitVec 32)) Unit!38172)

(assert (=> b!1158443 (= lt!520544 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1158443 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25291)))

(declare-fun lt!520530 () Unit!38172)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74921 (_ BitVec 64) (_ BitVec 32) List!25294) Unit!38172)

(assert (=> b!1158443 (= lt!520530 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25291))))

(assert (=> b!1158443 false))

(declare-fun b!1158444 () Bool)

(declare-fun -!1390 (ListLongMap!16523 (_ BitVec 64)) ListLongMap!16523)

(assert (=> b!1158444 (= e!658773 (= call!55650 (-!1390 call!55651 k!934)))))

(declare-fun bm!55651 () Bool)

(assert (=> bm!55651 (= call!55652 call!55653)))

(declare-fun b!1158445 () Bool)

(assert (=> b!1158445 call!55652))

(declare-fun lt!520535 () Unit!38172)

(assert (=> b!1158445 (= lt!520535 call!55656)))

(declare-fun e!658763 () Unit!38172)

(assert (=> b!1158445 (= e!658763 lt!520535)))

(declare-fun b!1158446 () Bool)

(declare-fun res!769129 () Bool)

(assert (=> b!1158446 (=> (not res!769129) (not e!658779))))

(assert (=> b!1158446 (= res!769129 (= (select (arr!36111 _keys!1208) i!673) k!934))))

(declare-fun b!1158447 () Bool)

(declare-fun res!769119 () Bool)

(assert (=> b!1158447 (=> (not res!769119) (not e!658779))))

(assert (=> b!1158447 (= res!769119 (and (= (size!36648 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36647 _keys!1208) (size!36648 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!45383 () Bool)

(assert (=> mapIsEmpty!45383 mapRes!45383))

(declare-fun res!769125 () Bool)

(assert (=> start!98904 (=> (not res!769125) (not e!658779))))

(assert (=> start!98904 (= res!769125 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36647 _keys!1208))))))

(assert (=> start!98904 e!658779))

(assert (=> start!98904 tp_is_empty!29039))

(declare-fun array_inv!27634 (array!74921) Bool)

(assert (=> start!98904 (array_inv!27634 _keys!1208)))

(assert (=> start!98904 true))

(assert (=> start!98904 tp!86238))

(declare-fun e!658769 () Bool)

(declare-fun array_inv!27635 (array!74923) Bool)

(assert (=> start!98904 (and (array_inv!27635 _values!996) e!658769)))

(declare-fun b!1158448 () Bool)

(assert (=> b!1158448 (= e!658766 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1158449 () Bool)

(declare-fun Unit!38175 () Unit!38172)

(assert (=> b!1158449 (= e!658763 Unit!38175)))

(declare-fun b!1158450 () Bool)

(declare-fun Unit!38176 () Unit!38172)

(assert (=> b!1158450 (= e!658777 Unit!38176)))

(declare-fun b!1158451 () Bool)

(declare-fun lt!520549 () ListLongMap!16523)

(declare-fun e!658764 () Bool)

(assert (=> b!1158451 (= e!658764 (= lt!520549 (getCurrentListMapNoExtraKeys!4742 lt!520538 lt!520532 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1158452 () Bool)

(declare-fun e!658772 () Bool)

(assert (=> b!1158452 (= e!658769 (and e!658772 mapRes!45383))))

(declare-fun condMapEmpty!45383 () Bool)

(declare-fun mapDefault!45383 () ValueCell!13810)

