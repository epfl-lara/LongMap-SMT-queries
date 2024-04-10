; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98972 () Bool)

(assert start!98972)

(declare-fun b_free!24577 () Bool)

(declare-fun b_next!24577 () Bool)

(assert (=> start!98972 (= b_free!24577 (not b_next!24577))))

(declare-fun tp!86441 () Bool)

(declare-fun b_and!40003 () Bool)

(assert (=> start!98972 (= tp!86441 b_and!40003)))

(declare-fun bm!56463 () Bool)

(declare-datatypes ((Unit!38307 0))(
  ( (Unit!38308) )
))
(declare-fun call!56471 () Unit!38307)

(declare-fun call!56472 () Unit!38307)

(assert (=> bm!56463 (= call!56471 call!56472)))

(declare-fun res!770651 () Bool)

(declare-fun e!660497 () Bool)

(assert (=> start!98972 (=> (not res!770651) (not e!660497))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75053 0))(
  ( (array!75054 (arr!36177 (Array (_ BitVec 32) (_ BitVec 64))) (size!36713 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75053)

(assert (=> start!98972 (= res!770651 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36713 _keys!1208))))))

(assert (=> start!98972 e!660497))

(declare-fun tp_is_empty!29107 () Bool)

(assert (=> start!98972 tp_is_empty!29107))

(declare-fun array_inv!27680 (array!75053) Bool)

(assert (=> start!98972 (array_inv!27680 _keys!1208)))

(assert (=> start!98972 true))

(assert (=> start!98972 tp!86441))

(declare-datatypes ((V!43937 0))(
  ( (V!43938 (val!14610 Int)) )
))
(declare-datatypes ((ValueCell!13844 0))(
  ( (ValueCellFull!13844 (v!17247 V!43937)) (EmptyCell!13844) )
))
(declare-datatypes ((array!75055 0))(
  ( (array!75056 (arr!36178 (Array (_ BitVec 32) ValueCell!13844)) (size!36714 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75055)

(declare-fun e!660502 () Bool)

(declare-fun array_inv!27681 (array!75055) Bool)

(assert (=> start!98972 (and (array_inv!27681 _values!996) e!660502)))

(declare-fun b!1161554 () Bool)

(declare-fun res!770663 () Bool)

(assert (=> b!1161554 (=> (not res!770663) (not e!660497))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75053 (_ BitVec 32)) Bool)

(assert (=> b!1161554 (= res!770663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1161555 () Bool)

(declare-fun res!770650 () Bool)

(assert (=> b!1161555 (=> (not res!770650) (not e!660497))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1161555 (= res!770650 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36713 _keys!1208))))))

(declare-fun b!1161556 () Bool)

(declare-fun res!770658 () Bool)

(assert (=> b!1161556 (=> (not res!770658) (not e!660497))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1161556 (= res!770658 (= (select (arr!36177 _keys!1208) i!673) k!934))))

(declare-fun b!1161557 () Bool)

(declare-fun c!116055 () Bool)

(declare-fun lt!522789 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1161557 (= c!116055 (and (not lt!522789) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!660500 () Unit!38307)

(declare-fun e!660498 () Unit!38307)

(assert (=> b!1161557 (= e!660500 e!660498)))

(declare-fun e!660507 () Bool)

(declare-fun b!1161558 () Bool)

(declare-fun arrayContainsKey!0 (array!75053 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1161558 (= e!660507 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapIsEmpty!45485 () Bool)

(declare-fun mapRes!45485 () Bool)

(assert (=> mapIsEmpty!45485 mapRes!45485))

(declare-fun b!1161559 () Bool)

(declare-datatypes ((tuple2!18616 0))(
  ( (tuple2!18617 (_1!9319 (_ BitVec 64)) (_2!9319 V!43937)) )
))
(declare-datatypes ((List!25351 0))(
  ( (Nil!25348) (Cons!25347 (h!26556 tuple2!18616) (t!36920 List!25351)) )
))
(declare-datatypes ((ListLongMap!16585 0))(
  ( (ListLongMap!16586 (toList!8308 List!25351)) )
))
(declare-fun call!56468 () ListLongMap!16585)

(declare-fun contains!6813 (ListLongMap!16585 (_ BitVec 64)) Bool)

(assert (=> b!1161559 (contains!6813 call!56468 k!934)))

(declare-fun lt!522777 () Unit!38307)

(declare-fun lt!522776 () ListLongMap!16585)

(declare-fun minValue!944 () V!43937)

(declare-fun addStillContains!954 (ListLongMap!16585 (_ BitVec 64) V!43937 (_ BitVec 64)) Unit!38307)

(assert (=> b!1161559 (= lt!522777 (addStillContains!954 lt!522776 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!56467 () Bool)

(assert (=> b!1161559 call!56467))

(declare-fun lt!522778 () ListLongMap!16585)

(declare-fun zeroValue!944 () V!43937)

(declare-fun +!3712 (ListLongMap!16585 tuple2!18616) ListLongMap!16585)

(assert (=> b!1161559 (= lt!522776 (+!3712 lt!522778 (tuple2!18617 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!522784 () Unit!38307)

(assert (=> b!1161559 (= lt!522784 call!56472)))

(assert (=> b!1161559 (= e!660500 lt!522777)))

(declare-fun b!1161560 () Bool)

(declare-fun call!56470 () Bool)

(assert (=> b!1161560 call!56470))

(declare-fun lt!522787 () Unit!38307)

(assert (=> b!1161560 (= lt!522787 call!56471)))

(declare-fun e!660503 () Unit!38307)

(assert (=> b!1161560 (= e!660503 lt!522787)))

(declare-fun b!1161561 () Bool)

(declare-fun e!660510 () Bool)

(declare-fun e!660509 () Bool)

(assert (=> b!1161561 (= e!660510 e!660509)))

(declare-fun res!770660 () Bool)

(assert (=> b!1161561 (=> res!770660 e!660509)))

(assert (=> b!1161561 (= res!770660 (not (= from!1455 i!673)))))

(declare-fun lt!522786 () ListLongMap!16585)

(declare-fun lt!522792 () array!75053)

(declare-fun lt!522781 () array!75055)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4772 (array!75053 array!75055 (_ BitVec 32) (_ BitVec 32) V!43937 V!43937 (_ BitVec 32) Int) ListLongMap!16585)

(assert (=> b!1161561 (= lt!522786 (getCurrentListMapNoExtraKeys!4772 lt!522792 lt!522781 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!522795 () V!43937)

(assert (=> b!1161561 (= lt!522781 (array!75056 (store (arr!36178 _values!996) i!673 (ValueCellFull!13844 lt!522795)) (size!36714 _values!996)))))

(declare-fun dynLambda!2768 (Int (_ BitVec 64)) V!43937)

(assert (=> b!1161561 (= lt!522795 (dynLambda!2768 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!522788 () ListLongMap!16585)

(assert (=> b!1161561 (= lt!522788 (getCurrentListMapNoExtraKeys!4772 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!56464 () Bool)

(declare-fun call!56469 () ListLongMap!16585)

(assert (=> bm!56464 (= call!56469 (getCurrentListMapNoExtraKeys!4772 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161562 () Bool)

(declare-fun call!56466 () ListLongMap!16585)

(declare-fun e!660505 () Bool)

(declare-fun -!1414 (ListLongMap!16585 (_ BitVec 64)) ListLongMap!16585)

(assert (=> b!1161562 (= e!660505 (= call!56466 (-!1414 call!56469 k!934)))))

(declare-fun b!1161563 () Bool)

(declare-fun e!660513 () Bool)

(assert (=> b!1161563 (= e!660513 true)))

(declare-fun e!660506 () Bool)

(assert (=> b!1161563 e!660506))

(declare-fun res!770657 () Bool)

(assert (=> b!1161563 (=> (not res!770657) (not e!660506))))

(declare-fun lt!522775 () ListLongMap!16585)

(assert (=> b!1161563 (= res!770657 (= lt!522775 lt!522778))))

(assert (=> b!1161563 (= lt!522775 (-!1414 lt!522788 k!934))))

(declare-fun lt!522779 () V!43937)

(assert (=> b!1161563 (= (-!1414 (+!3712 lt!522778 (tuple2!18617 (select (arr!36177 _keys!1208) from!1455) lt!522779)) (select (arr!36177 _keys!1208) from!1455)) lt!522778)))

(declare-fun lt!522794 () Unit!38307)

(declare-fun addThenRemoveForNewKeyIsSame!248 (ListLongMap!16585 (_ BitVec 64) V!43937) Unit!38307)

(assert (=> b!1161563 (= lt!522794 (addThenRemoveForNewKeyIsSame!248 lt!522778 (select (arr!36177 _keys!1208) from!1455) lt!522779))))

(declare-fun get!18454 (ValueCell!13844 V!43937) V!43937)

(assert (=> b!1161563 (= lt!522779 (get!18454 (select (arr!36178 _values!996) from!1455) lt!522795))))

(declare-fun lt!522793 () Unit!38307)

(declare-fun e!660512 () Unit!38307)

(assert (=> b!1161563 (= lt!522793 e!660512)))

(declare-fun c!116051 () Bool)

(assert (=> b!1161563 (= c!116051 (contains!6813 lt!522778 k!934))))

(assert (=> b!1161563 (= lt!522778 (getCurrentListMapNoExtraKeys!4772 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161564 () Bool)

(declare-fun Unit!38309 () Unit!38307)

(assert (=> b!1161564 (= e!660512 Unit!38309)))

(declare-fun b!1161565 () Bool)

(assert (=> b!1161565 (= e!660507 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!522789) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1161566 () Bool)

(declare-fun Unit!38310 () Unit!38307)

(assert (=> b!1161566 (= e!660512 Unit!38310)))

(assert (=> b!1161566 (= lt!522789 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun c!116052 () Bool)

(assert (=> b!1161566 (= c!116052 (and (not lt!522789) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!522783 () Unit!38307)

(assert (=> b!1161566 (= lt!522783 e!660500)))

(declare-fun lt!522791 () Unit!38307)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!539 (array!75053 array!75055 (_ BitVec 32) (_ BitVec 32) V!43937 V!43937 (_ BitVec 64) (_ BitVec 32) Int) Unit!38307)

(assert (=> b!1161566 (= lt!522791 (lemmaListMapContainsThenArrayContainsFrom!539 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!116056 () Bool)

(assert (=> b!1161566 (= c!116056 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!770649 () Bool)

(assert (=> b!1161566 (= res!770649 e!660507)))

(declare-fun e!660501 () Bool)

(assert (=> b!1161566 (=> (not res!770649) (not e!660501))))

(assert (=> b!1161566 e!660501))

(declare-fun lt!522774 () Unit!38307)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75053 (_ BitVec 32) (_ BitVec 32)) Unit!38307)

(assert (=> b!1161566 (= lt!522774 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25352 0))(
  ( (Nil!25349) (Cons!25348 (h!26557 (_ BitVec 64)) (t!36921 List!25352)) )
))
(declare-fun arrayNoDuplicates!0 (array!75053 (_ BitVec 32) List!25352) Bool)

(assert (=> b!1161566 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25349)))

(declare-fun lt!522785 () Unit!38307)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75053 (_ BitVec 64) (_ BitVec 32) List!25352) Unit!38307)

(assert (=> b!1161566 (= lt!522785 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25349))))

(assert (=> b!1161566 false))

(declare-fun b!1161567 () Bool)

(declare-fun res!770652 () Bool)

(assert (=> b!1161567 (=> (not res!770652) (not e!660497))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1161567 (= res!770652 (validKeyInArray!0 k!934))))

(declare-fun b!1161568 () Bool)

(declare-fun lt!522790 () Unit!38307)

(assert (=> b!1161568 (= e!660498 lt!522790)))

(assert (=> b!1161568 (= lt!522790 call!56471)))

(assert (=> b!1161568 call!56470))

(declare-fun bm!56465 () Bool)

(assert (=> bm!56465 (= call!56466 (getCurrentListMapNoExtraKeys!4772 lt!522792 lt!522781 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!45485 () Bool)

(declare-fun tp!86442 () Bool)

(declare-fun e!660511 () Bool)

(assert (=> mapNonEmpty!45485 (= mapRes!45485 (and tp!86442 e!660511))))

(declare-fun mapValue!45485 () ValueCell!13844)

(declare-fun mapKey!45485 () (_ BitVec 32))

(declare-fun mapRest!45485 () (Array (_ BitVec 32) ValueCell!13844))

(assert (=> mapNonEmpty!45485 (= (arr!36178 _values!996) (store mapRest!45485 mapKey!45485 mapValue!45485))))

(declare-fun b!1161569 () Bool)

(assert (=> b!1161569 (= e!660509 e!660513)))

(declare-fun res!770655 () Bool)

(assert (=> b!1161569 (=> res!770655 e!660513)))

(assert (=> b!1161569 (= res!770655 (not (= (select (arr!36177 _keys!1208) from!1455) k!934)))))

(assert (=> b!1161569 e!660505))

(declare-fun c!116054 () Bool)

(assert (=> b!1161569 (= c!116054 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!522780 () Unit!38307)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!644 (array!75053 array!75055 (_ BitVec 32) (_ BitVec 32) V!43937 V!43937 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38307)

(assert (=> b!1161569 (= lt!522780 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!644 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1161570 () Bool)

(declare-fun res!770659 () Bool)

(assert (=> b!1161570 (=> (not res!770659) (not e!660497))))

(assert (=> b!1161570 (= res!770659 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25349))))

(declare-fun b!1161571 () Bool)

(declare-fun e!660499 () Bool)

(assert (=> b!1161571 (= e!660502 (and e!660499 mapRes!45485))))

(declare-fun condMapEmpty!45485 () Bool)

(declare-fun mapDefault!45485 () ValueCell!13844)

