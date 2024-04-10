; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98732 () Bool)

(assert start!98732)

(declare-fun b_free!24337 () Bool)

(declare-fun b_next!24337 () Bool)

(assert (=> start!98732 (= b_free!24337 (not b_next!24337))))

(declare-fun tp!85721 () Bool)

(declare-fun b_and!39523 () Bool)

(assert (=> start!98732 (= tp!85721 b_and!39523)))

(declare-datatypes ((array!74581 0))(
  ( (array!74582 (arr!35941 (Array (_ BitVec 32) (_ BitVec 64))) (size!36477 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74581)

(declare-fun e!654378 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1150514 () Bool)

(declare-fun arrayContainsKey!0 (array!74581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1150514 (= e!654378 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1150515 () Bool)

(declare-fun e!654385 () Bool)

(declare-fun e!654381 () Bool)

(assert (=> b!1150515 (= e!654385 e!654381)))

(declare-fun res!765253 () Bool)

(assert (=> b!1150515 (=> (not res!765253) (not e!654381))))

(declare-fun lt!514873 () array!74581)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74581 (_ BitVec 32)) Bool)

(assert (=> b!1150515 (= res!765253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!514873 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1150515 (= lt!514873 (array!74582 (store (arr!35941 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36477 _keys!1208)))))

(declare-fun b!1150516 () Bool)

(declare-fun e!654384 () Bool)

(declare-fun tp_is_empty!28867 () Bool)

(assert (=> b!1150516 (= e!654384 tp_is_empty!28867)))

(declare-datatypes ((V!43617 0))(
  ( (V!43618 (val!14490 Int)) )
))
(declare-fun zeroValue!944 () V!43617)

(declare-datatypes ((tuple2!18392 0))(
  ( (tuple2!18393 (_1!9207 (_ BitVec 64)) (_2!9207 V!43617)) )
))
(declare-datatypes ((List!25141 0))(
  ( (Nil!25138) (Cons!25137 (h!26346 tuple2!18392) (t!36470 List!25141)) )
))
(declare-datatypes ((ListLongMap!16361 0))(
  ( (ListLongMap!16362 (toList!8196 List!25141)) )
))
(declare-fun call!53591 () ListLongMap!16361)

(declare-fun c!113894 () Bool)

(declare-fun c!113891 () Bool)

(declare-fun minValue!944 () V!43617)

(declare-fun bm!53583 () Bool)

(declare-fun lt!514871 () ListLongMap!16361)

(declare-fun +!3615 (ListLongMap!16361 tuple2!18392) ListLongMap!16361)

(assert (=> bm!53583 (= call!53591 (+!3615 lt!514871 (ite (or c!113894 c!113891) (tuple2!18393 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1150517 () Bool)

(declare-fun e!654379 () Bool)

(assert (=> b!1150517 (= e!654379 true)))

(declare-fun e!654389 () Bool)

(assert (=> b!1150517 e!654389))

(declare-fun res!765259 () Bool)

(assert (=> b!1150517 (=> (not res!765259) (not e!654389))))

(declare-fun lt!514856 () ListLongMap!16361)

(assert (=> b!1150517 (= res!765259 (= lt!514856 lt!514871))))

(declare-fun lt!514859 () ListLongMap!16361)

(declare-fun -!1328 (ListLongMap!16361 (_ BitVec 64)) ListLongMap!16361)

(assert (=> b!1150517 (= lt!514856 (-!1328 lt!514859 k!934))))

(declare-fun lt!514872 () V!43617)

(assert (=> b!1150517 (= (-!1328 (+!3615 lt!514871 (tuple2!18393 (select (arr!35941 _keys!1208) from!1455) lt!514872)) (select (arr!35941 _keys!1208) from!1455)) lt!514871)))

(declare-datatypes ((Unit!37835 0))(
  ( (Unit!37836) )
))
(declare-fun lt!514868 () Unit!37835)

(declare-fun addThenRemoveForNewKeyIsSame!171 (ListLongMap!16361 (_ BitVec 64) V!43617) Unit!37835)

(assert (=> b!1150517 (= lt!514868 (addThenRemoveForNewKeyIsSame!171 lt!514871 (select (arr!35941 _keys!1208) from!1455) lt!514872))))

(declare-fun lt!514862 () V!43617)

(declare-datatypes ((ValueCell!13724 0))(
  ( (ValueCellFull!13724 (v!17127 V!43617)) (EmptyCell!13724) )
))
(declare-datatypes ((array!74583 0))(
  ( (array!74584 (arr!35942 (Array (_ BitVec 32) ValueCell!13724)) (size!36478 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74583)

(declare-fun get!18297 (ValueCell!13724 V!43617) V!43617)

(assert (=> b!1150517 (= lt!514872 (get!18297 (select (arr!35942 _values!996) from!1455) lt!514862))))

(declare-fun lt!514865 () Unit!37835)

(declare-fun e!654391 () Unit!37835)

(assert (=> b!1150517 (= lt!514865 e!654391)))

(declare-fun c!113892 () Bool)

(declare-fun contains!6716 (ListLongMap!16361 (_ BitVec 64)) Bool)

(assert (=> b!1150517 (= c!113892 (contains!6716 lt!514871 k!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4668 (array!74581 array!74583 (_ BitVec 32) (_ BitVec 32) V!43617 V!43617 (_ BitVec 32) Int) ListLongMap!16361)

(assert (=> b!1150517 (= lt!514871 (getCurrentListMapNoExtraKeys!4668 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150518 () Bool)

(declare-fun Unit!37837 () Unit!37835)

(assert (=> b!1150518 (= e!654391 Unit!37837)))

(declare-fun b!1150519 () Bool)

(declare-fun res!765263 () Bool)

(assert (=> b!1150519 (=> (not res!765263) (not e!654381))))

(declare-datatypes ((List!25142 0))(
  ( (Nil!25139) (Cons!25138 (h!26347 (_ BitVec 64)) (t!36471 List!25142)) )
))
(declare-fun arrayNoDuplicates!0 (array!74581 (_ BitVec 32) List!25142) Bool)

(assert (=> b!1150519 (= res!765263 (arrayNoDuplicates!0 lt!514873 #b00000000000000000000000000000000 Nil!25139))))

(declare-fun b!1150520 () Bool)

(declare-fun e!654382 () Unit!37835)

(declare-fun lt!514861 () Unit!37835)

(assert (=> b!1150520 (= e!654382 lt!514861)))

(declare-fun call!53592 () Unit!37835)

(assert (=> b!1150520 (= lt!514861 call!53592)))

(declare-fun call!53589 () Bool)

(assert (=> b!1150520 call!53589))

(declare-fun b!1150521 () Bool)

(declare-fun res!765257 () Bool)

(assert (=> b!1150521 (=> (not res!765257) (not e!654385))))

(assert (=> b!1150521 (= res!765257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1150522 () Bool)

(declare-fun lt!514874 () Bool)

(declare-fun e!654390 () Bool)

(assert (=> b!1150522 (= e!654390 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!514874) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1150523 () Bool)

(declare-fun e!654393 () Bool)

(assert (=> b!1150523 (= e!654381 (not e!654393))))

(declare-fun res!765258 () Bool)

(assert (=> b!1150523 (=> res!765258 e!654393)))

(assert (=> b!1150523 (= res!765258 (bvsgt from!1455 i!673))))

(assert (=> b!1150523 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!514857 () Unit!37835)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74581 (_ BitVec 64) (_ BitVec 32)) Unit!37835)

(assert (=> b!1150523 (= lt!514857 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1150524 () Bool)

(declare-fun res!765251 () Bool)

(assert (=> b!1150524 (=> (not res!765251) (not e!654385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1150524 (= res!765251 (validMask!0 mask!1564))))

(declare-fun bm!53585 () Bool)

(declare-fun call!53590 () ListLongMap!16361)

(assert (=> bm!53585 (= call!53590 call!53591)))

(declare-fun b!1150525 () Bool)

(declare-fun lt!514864 () ListLongMap!16361)

(assert (=> b!1150525 (contains!6716 (+!3615 lt!514864 (tuple2!18393 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!514858 () Unit!37835)

(declare-fun addStillContains!865 (ListLongMap!16361 (_ BitVec 64) V!43617 (_ BitVec 64)) Unit!37835)

(assert (=> b!1150525 (= lt!514858 (addStillContains!865 lt!514864 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(declare-fun call!53587 () Bool)

(assert (=> b!1150525 call!53587))

(assert (=> b!1150525 (= lt!514864 call!53591)))

(declare-fun lt!514860 () Unit!37835)

(declare-fun call!53586 () Unit!37835)

(assert (=> b!1150525 (= lt!514860 call!53586)))

(declare-fun e!654392 () Unit!37835)

(assert (=> b!1150525 (= e!654392 lt!514858)))

(declare-fun bm!53586 () Bool)

(assert (=> bm!53586 (= call!53592 call!53586)))

(declare-fun b!1150526 () Bool)

(assert (=> b!1150526 call!53589))

(declare-fun lt!514863 () Unit!37835)

(assert (=> b!1150526 (= lt!514863 call!53592)))

(declare-fun e!654380 () Unit!37835)

(assert (=> b!1150526 (= e!654380 lt!514863)))

(declare-fun b!1150527 () Bool)

(declare-fun res!765254 () Bool)

(assert (=> b!1150527 (=> (not res!765254) (not e!654385))))

(assert (=> b!1150527 (= res!765254 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25139))))

(declare-fun call!53588 () ListLongMap!16361)

(declare-fun e!654377 () Bool)

(declare-fun b!1150528 () Bool)

(declare-fun call!53593 () ListLongMap!16361)

(assert (=> b!1150528 (= e!654377 (= call!53593 (-!1328 call!53588 k!934)))))

(declare-fun b!1150529 () Bool)

(assert (=> b!1150529 (= e!654377 (= call!53593 call!53588))))

(declare-fun bm!53587 () Bool)

(assert (=> bm!53587 (= call!53587 (contains!6716 (ite c!113894 lt!514864 call!53590) k!934))))

(declare-fun b!1150530 () Bool)

(declare-fun Unit!37838 () Unit!37835)

(assert (=> b!1150530 (= e!654391 Unit!37838)))

(assert (=> b!1150530 (= lt!514874 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1150530 (= c!113894 (and (not lt!514874) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!514855 () Unit!37835)

(assert (=> b!1150530 (= lt!514855 e!654392)))

(declare-fun lt!514869 () Unit!37835)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!458 (array!74581 array!74583 (_ BitVec 32) (_ BitVec 32) V!43617 V!43617 (_ BitVec 64) (_ BitVec 32) Int) Unit!37835)

(assert (=> b!1150530 (= lt!514869 (lemmaListMapContainsThenArrayContainsFrom!458 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!113893 () Bool)

(assert (=> b!1150530 (= c!113893 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!765262 () Bool)

(assert (=> b!1150530 (= res!765262 e!654390)))

(assert (=> b!1150530 (=> (not res!765262) (not e!654378))))

(assert (=> b!1150530 e!654378))

(declare-fun lt!514875 () Unit!37835)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74581 (_ BitVec 32) (_ BitVec 32)) Unit!37835)

(assert (=> b!1150530 (= lt!514875 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1150530 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25139)))

(declare-fun lt!514867 () Unit!37835)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74581 (_ BitVec 64) (_ BitVec 32) List!25142) Unit!37835)

(assert (=> b!1150530 (= lt!514867 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25139))))

(assert (=> b!1150530 false))

(declare-fun bm!53588 () Bool)

(assert (=> bm!53588 (= call!53588 (getCurrentListMapNoExtraKeys!4668 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!53589 () Bool)

(assert (=> bm!53589 (= call!53589 call!53587)))

(declare-fun lt!514866 () array!74583)

(declare-fun b!1150531 () Bool)

(assert (=> b!1150531 (= e!654389 (= lt!514856 (getCurrentListMapNoExtraKeys!4668 lt!514873 lt!514866 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!53584 () Bool)

(assert (=> bm!53584 (= call!53593 (getCurrentListMapNoExtraKeys!4668 lt!514873 lt!514866 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!765255 () Bool)

(assert (=> start!98732 (=> (not res!765255) (not e!654385))))

(assert (=> start!98732 (= res!765255 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36477 _keys!1208))))))

(assert (=> start!98732 e!654385))

(assert (=> start!98732 tp_is_empty!28867))

(declare-fun array_inv!27526 (array!74581) Bool)

(assert (=> start!98732 (array_inv!27526 _keys!1208)))

(assert (=> start!98732 true))

(assert (=> start!98732 tp!85721))

(declare-fun e!654387 () Bool)

(declare-fun array_inv!27527 (array!74583) Bool)

(assert (=> start!98732 (and (array_inv!27527 _values!996) e!654387)))

(declare-fun b!1150532 () Bool)

(declare-fun e!654383 () Bool)

(assert (=> b!1150532 (= e!654393 e!654383)))

(declare-fun res!765249 () Bool)

(assert (=> b!1150532 (=> res!765249 e!654383)))

(assert (=> b!1150532 (= res!765249 (not (= from!1455 i!673)))))

(declare-fun lt!514870 () ListLongMap!16361)

(assert (=> b!1150532 (= lt!514870 (getCurrentListMapNoExtraKeys!4668 lt!514873 lt!514866 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1150532 (= lt!514866 (array!74584 (store (arr!35942 _values!996) i!673 (ValueCellFull!13724 lt!514862)) (size!36478 _values!996)))))

(declare-fun dynLambda!2691 (Int (_ BitVec 64)) V!43617)

(assert (=> b!1150532 (= lt!514862 (dynLambda!2691 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1150532 (= lt!514859 (getCurrentListMapNoExtraKeys!4668 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!45125 () Bool)

(declare-fun mapRes!45125 () Bool)

(assert (=> mapIsEmpty!45125 mapRes!45125))

(declare-fun b!1150533 () Bool)

(declare-fun res!765261 () Bool)

(assert (=> b!1150533 (=> (not res!765261) (not e!654385))))

(assert (=> b!1150533 (= res!765261 (and (= (size!36478 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36477 _keys!1208) (size!36478 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1150534 () Bool)

(assert (=> b!1150534 (= e!654390 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1150535 () Bool)

(declare-fun e!654386 () Bool)

(assert (=> b!1150535 (= e!654387 (and e!654386 mapRes!45125))))

(declare-fun condMapEmpty!45125 () Bool)

(declare-fun mapDefault!45125 () ValueCell!13724)

