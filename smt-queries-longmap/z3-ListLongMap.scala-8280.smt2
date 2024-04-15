; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100806 () Bool)

(assert start!100806)

(declare-fun b_free!25951 () Bool)

(declare-fun b_next!25951 () Bool)

(assert (=> start!100806 (= b_free!25951 (not b_next!25951))))

(declare-fun tp!90859 () Bool)

(declare-fun b_and!42881 () Bool)

(assert (=> start!100806 (= tp!90859 b_and!42881)))

(declare-datatypes ((V!46001 0))(
  ( (V!46002 (val!15384 Int)) )
))
(declare-fun zeroValue!944 () V!46001)

(declare-datatypes ((Unit!39835 0))(
  ( (Unit!39836) )
))
(declare-fun call!58740 () Unit!39835)

(declare-fun c!118481 () Bool)

(declare-datatypes ((tuple2!19810 0))(
  ( (tuple2!19811 (_1!9916 (_ BitVec 64)) (_2!9916 V!46001)) )
))
(declare-datatypes ((List!26593 0))(
  ( (Nil!26590) (Cons!26589 (h!27798 tuple2!19810) (t!39515 List!26593)) )
))
(declare-datatypes ((ListLongMap!17779 0))(
  ( (ListLongMap!17780 (toList!8905 List!26593)) )
))
(declare-fun lt!547212 () ListLongMap!17779)

(declare-fun lt!547219 () ListLongMap!17779)

(declare-fun minValue!944 () V!46001)

(declare-fun c!118482 () Bool)

(declare-fun bm!58735 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun addStillContains!1018 (ListLongMap!17779 (_ BitVec 64) V!46001 (_ BitVec 64)) Unit!39835)

(assert (=> bm!58735 (= call!58740 (addStillContains!1018 (ite c!118481 lt!547219 lt!547212) (ite c!118481 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!118482 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!118481 minValue!944 (ite c!118482 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1206511 () Bool)

(declare-fun e!685162 () Bool)

(declare-fun e!685170 () Bool)

(assert (=> b!1206511 (= e!685162 e!685170)))

(declare-fun res!802341 () Bool)

(assert (=> b!1206511 (=> res!802341 e!685170)))

(declare-datatypes ((array!78006 0))(
  ( (array!78007 (arr!37643 (Array (_ BitVec 32) (_ BitVec 64))) (size!38181 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78006)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1206511 (= res!802341 (not (= (select (arr!37643 _keys!1208) from!1455) k0!934)))))

(declare-fun e!685174 () Bool)

(assert (=> b!1206511 e!685174))

(declare-fun c!118479 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1206511 (= c!118479 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14618 0))(
  ( (ValueCellFull!14618 (v!18028 V!46001)) (EmptyCell!14618) )
))
(declare-datatypes ((array!78008 0))(
  ( (array!78009 (arr!37644 (Array (_ BitVec 32) ValueCell!14618)) (size!38182 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78008)

(declare-fun lt!547221 () Unit!39835)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1036 (array!78006 array!78008 (_ BitVec 32) (_ BitVec 32) V!46001 V!46001 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39835)

(assert (=> b!1206511 (= lt!547221 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1036 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58736 () Bool)

(declare-fun call!58744 () Unit!39835)

(assert (=> bm!58736 (= call!58744 call!58740)))

(declare-fun b!1206512 () Bool)

(declare-fun res!802337 () Bool)

(declare-fun e!685165 () Bool)

(assert (=> b!1206512 (=> (not res!802337) (not e!685165))))

(assert (=> b!1206512 (= res!802337 (= (select (arr!37643 _keys!1208) i!673) k0!934))))

(declare-fun call!58738 () ListLongMap!17779)

(declare-fun call!58742 () Bool)

(declare-fun bm!58737 () Bool)

(declare-fun contains!6907 (ListLongMap!17779 (_ BitVec 64)) Bool)

(assert (=> bm!58737 (= call!58742 (contains!6907 (ite c!118481 lt!547219 call!58738) k0!934))))

(declare-fun b!1206513 () Bool)

(declare-fun e!685169 () Bool)

(declare-fun lt!547217 () Bool)

(assert (=> b!1206513 (= e!685169 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!547217) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1206514 () Bool)

(declare-fun c!118480 () Bool)

(assert (=> b!1206514 (= c!118480 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!547217))))

(declare-fun e!685172 () Unit!39835)

(declare-fun e!685175 () Unit!39835)

(assert (=> b!1206514 (= e!685172 e!685175)))

(declare-fun call!58739 () ListLongMap!17779)

(declare-fun lt!547220 () array!78008)

(declare-fun lt!547208 () array!78006)

(declare-fun bm!58738 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5349 (array!78006 array!78008 (_ BitVec 32) (_ BitVec 32) V!46001 V!46001 (_ BitVec 32) Int) ListLongMap!17779)

(assert (=> bm!58738 (= call!58739 (getCurrentListMapNoExtraKeys!5349 lt!547208 lt!547220 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206515 () Bool)

(declare-fun call!58743 () ListLongMap!17779)

(declare-fun -!1792 (ListLongMap!17779 (_ BitVec 64)) ListLongMap!17779)

(assert (=> b!1206515 (= e!685174 (= call!58739 (-!1792 call!58743 k0!934)))))

(declare-fun b!1206517 () Bool)

(declare-fun e!685173 () Bool)

(declare-fun e!685164 () Bool)

(declare-fun mapRes!47841 () Bool)

(assert (=> b!1206517 (= e!685173 (and e!685164 mapRes!47841))))

(declare-fun condMapEmpty!47841 () Bool)

(declare-fun mapDefault!47841 () ValueCell!14618)

(assert (=> b!1206517 (= condMapEmpty!47841 (= (arr!37644 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14618)) mapDefault!47841)))))

(declare-fun mapNonEmpty!47841 () Bool)

(declare-fun tp!90858 () Bool)

(declare-fun e!685171 () Bool)

(assert (=> mapNonEmpty!47841 (= mapRes!47841 (and tp!90858 e!685171))))

(declare-fun mapValue!47841 () ValueCell!14618)

(declare-fun mapRest!47841 () (Array (_ BitVec 32) ValueCell!14618))

(declare-fun mapKey!47841 () (_ BitVec 32))

(assert (=> mapNonEmpty!47841 (= (arr!37644 _values!996) (store mapRest!47841 mapKey!47841 mapValue!47841))))

(declare-fun b!1206518 () Bool)

(declare-fun e!685161 () Bool)

(assert (=> b!1206518 (= e!685161 true)))

(declare-datatypes ((List!26594 0))(
  ( (Nil!26591) (Cons!26590 (h!27799 (_ BitVec 64)) (t!39516 List!26594)) )
))
(declare-fun arrayNoDuplicates!0 (array!78006 (_ BitVec 32) List!26594) Bool)

(assert (=> b!1206518 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26591)))

(declare-fun lt!547215 () Unit!39835)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78006 (_ BitVec 32) (_ BitVec 32)) Unit!39835)

(assert (=> b!1206518 (= lt!547215 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun e!685160 () Bool)

(assert (=> b!1206518 e!685160))

(declare-fun res!802340 () Bool)

(assert (=> b!1206518 (=> (not res!802340) (not e!685160))))

(assert (=> b!1206518 (= res!802340 e!685169)))

(declare-fun c!118478 () Bool)

(assert (=> b!1206518 (= c!118478 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!547222 () Unit!39835)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!567 (array!78006 array!78008 (_ BitVec 32) (_ BitVec 32) V!46001 V!46001 (_ BitVec 64) (_ BitVec 32) Int) Unit!39835)

(assert (=> b!1206518 (= lt!547222 (lemmaListMapContainsThenArrayContainsFrom!567 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!547209 () Unit!39835)

(declare-fun e!685163 () Unit!39835)

(assert (=> b!1206518 (= lt!547209 e!685163)))

(assert (=> b!1206518 (= c!118481 (and (not lt!547217) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1206518 (= lt!547217 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun bm!58739 () Bool)

(declare-fun call!58741 () ListLongMap!17779)

(assert (=> bm!58739 (= call!58738 call!58741)))

(declare-fun b!1206519 () Bool)

(declare-fun arrayContainsKey!0 (array!78006 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1206519 (= e!685169 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1206520 () Bool)

(declare-fun Unit!39837 () Unit!39835)

(assert (=> b!1206520 (= e!685175 Unit!39837)))

(declare-fun b!1206521 () Bool)

(declare-fun res!802343 () Bool)

(assert (=> b!1206521 (=> (not res!802343) (not e!685165))))

(assert (=> b!1206521 (= res!802343 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26591))))

(declare-fun b!1206522 () Bool)

(declare-fun lt!547216 () Unit!39835)

(assert (=> b!1206522 (= e!685163 lt!547216)))

(declare-fun lt!547211 () Unit!39835)

(assert (=> b!1206522 (= lt!547211 (addStillContains!1018 lt!547212 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1206522 (= lt!547219 call!58741)))

(assert (=> b!1206522 call!58742))

(assert (=> b!1206522 (= lt!547216 call!58740)))

(declare-fun +!4035 (ListLongMap!17779 tuple2!19810) ListLongMap!17779)

(assert (=> b!1206522 (contains!6907 (+!4035 lt!547219 (tuple2!19811 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k0!934)))

(declare-fun b!1206523 () Bool)

(declare-fun e!685166 () Bool)

(declare-fun e!685168 () Bool)

(assert (=> b!1206523 (= e!685166 (not e!685168))))

(declare-fun res!802333 () Bool)

(assert (=> b!1206523 (=> res!802333 e!685168)))

(assert (=> b!1206523 (= res!802333 (bvsgt from!1455 i!673))))

(assert (=> b!1206523 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!547213 () Unit!39835)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78006 (_ BitVec 64) (_ BitVec 32)) Unit!39835)

(assert (=> b!1206523 (= lt!547213 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1206524 () Bool)

(declare-fun call!58745 () Bool)

(assert (=> b!1206524 call!58745))

(declare-fun lt!547223 () Unit!39835)

(assert (=> b!1206524 (= lt!547223 call!58744)))

(assert (=> b!1206524 (= e!685172 lt!547223)))

(declare-fun b!1206525 () Bool)

(assert (=> b!1206525 (= e!685168 e!685162)))

(declare-fun res!802334 () Bool)

(assert (=> b!1206525 (=> res!802334 e!685162)))

(assert (=> b!1206525 (= res!802334 (not (= from!1455 i!673)))))

(declare-fun lt!547218 () ListLongMap!17779)

(assert (=> b!1206525 (= lt!547218 (getCurrentListMapNoExtraKeys!5349 lt!547208 lt!547220 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3215 (Int (_ BitVec 64)) V!46001)

(assert (=> b!1206525 (= lt!547220 (array!78009 (store (arr!37644 _values!996) i!673 (ValueCellFull!14618 (dynLambda!3215 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38182 _values!996)))))

(declare-fun lt!547214 () ListLongMap!17779)

(assert (=> b!1206525 (= lt!547214 (getCurrentListMapNoExtraKeys!5349 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1206526 () Bool)

(assert (=> b!1206526 (= e!685165 e!685166)))

(declare-fun res!802336 () Bool)

(assert (=> b!1206526 (=> (not res!802336) (not e!685166))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78006 (_ BitVec 32)) Bool)

(assert (=> b!1206526 (= res!802336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!547208 mask!1564))))

(assert (=> b!1206526 (= lt!547208 (array!78007 (store (arr!37643 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38181 _keys!1208)))))

(declare-fun b!1206527 () Bool)

(declare-fun res!802338 () Bool)

(assert (=> b!1206527 (=> (not res!802338) (not e!685165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1206527 (= res!802338 (validKeyInArray!0 k0!934))))

(declare-fun b!1206528 () Bool)

(assert (=> b!1206528 (= e!685160 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1206529 () Bool)

(assert (=> b!1206529 (= e!685170 e!685161)))

(declare-fun res!802344 () Bool)

(assert (=> b!1206529 (=> res!802344 e!685161)))

(assert (=> b!1206529 (= res!802344 (not (contains!6907 lt!547212 k0!934)))))

(assert (=> b!1206529 (= lt!547212 (getCurrentListMapNoExtraKeys!5349 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!58740 () Bool)

(assert (=> bm!58740 (= call!58745 call!58742)))

(declare-fun b!1206530 () Bool)

(declare-fun res!802346 () Bool)

(assert (=> b!1206530 (=> (not res!802346) (not e!685165))))

(assert (=> b!1206530 (= res!802346 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38181 _keys!1208))))))

(declare-fun mapIsEmpty!47841 () Bool)

(assert (=> mapIsEmpty!47841 mapRes!47841))

(declare-fun bm!58741 () Bool)

(assert (=> bm!58741 (= call!58741 (+!4035 lt!547212 (ite (or c!118481 c!118482) (tuple2!19811 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19811 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1206531 () Bool)

(declare-fun res!802342 () Bool)

(assert (=> b!1206531 (=> (not res!802342) (not e!685165))))

(assert (=> b!1206531 (= res!802342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1206532 () Bool)

(assert (=> b!1206532 (= e!685163 e!685172)))

(assert (=> b!1206532 (= c!118482 (and (not lt!547217) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1206533 () Bool)

(declare-fun res!802339 () Bool)

(assert (=> b!1206533 (=> (not res!802339) (not e!685165))))

(assert (=> b!1206533 (= res!802339 (and (= (size!38182 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38181 _keys!1208) (size!38182 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1206534 () Bool)

(declare-fun res!802347 () Bool)

(assert (=> b!1206534 (=> (not res!802347) (not e!685165))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1206534 (= res!802347 (validMask!0 mask!1564))))

(declare-fun b!1206535 () Bool)

(declare-fun lt!547210 () Unit!39835)

(assert (=> b!1206535 (= e!685175 lt!547210)))

(assert (=> b!1206535 (= lt!547210 call!58744)))

(assert (=> b!1206535 call!58745))

(declare-fun b!1206536 () Bool)

(assert (=> b!1206536 (= e!685174 (= call!58739 call!58743))))

(declare-fun bm!58742 () Bool)

(assert (=> bm!58742 (= call!58743 (getCurrentListMapNoExtraKeys!5349 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1206537 () Bool)

(declare-fun tp_is_empty!30655 () Bool)

(assert (=> b!1206537 (= e!685164 tp_is_empty!30655)))

(declare-fun b!1206538 () Bool)

(declare-fun res!802335 () Bool)

(assert (=> b!1206538 (=> (not res!802335) (not e!685166))))

(assert (=> b!1206538 (= res!802335 (arrayNoDuplicates!0 lt!547208 #b00000000000000000000000000000000 Nil!26591))))

(declare-fun b!1206516 () Bool)

(assert (=> b!1206516 (= e!685171 tp_is_empty!30655)))

(declare-fun res!802345 () Bool)

(assert (=> start!100806 (=> (not res!802345) (not e!685165))))

(assert (=> start!100806 (= res!802345 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38181 _keys!1208))))))

(assert (=> start!100806 e!685165))

(assert (=> start!100806 tp_is_empty!30655))

(declare-fun array_inv!28786 (array!78006) Bool)

(assert (=> start!100806 (array_inv!28786 _keys!1208)))

(assert (=> start!100806 true))

(assert (=> start!100806 tp!90859))

(declare-fun array_inv!28787 (array!78008) Bool)

(assert (=> start!100806 (and (array_inv!28787 _values!996) e!685173)))

(assert (= (and start!100806 res!802345) b!1206534))

(assert (= (and b!1206534 res!802347) b!1206533))

(assert (= (and b!1206533 res!802339) b!1206531))

(assert (= (and b!1206531 res!802342) b!1206521))

(assert (= (and b!1206521 res!802343) b!1206530))

(assert (= (and b!1206530 res!802346) b!1206527))

(assert (= (and b!1206527 res!802338) b!1206512))

(assert (= (and b!1206512 res!802337) b!1206526))

(assert (= (and b!1206526 res!802336) b!1206538))

(assert (= (and b!1206538 res!802335) b!1206523))

(assert (= (and b!1206523 (not res!802333)) b!1206525))

(assert (= (and b!1206525 (not res!802334)) b!1206511))

(assert (= (and b!1206511 c!118479) b!1206515))

(assert (= (and b!1206511 (not c!118479)) b!1206536))

(assert (= (or b!1206515 b!1206536) bm!58738))

(assert (= (or b!1206515 b!1206536) bm!58742))

(assert (= (and b!1206511 (not res!802341)) b!1206529))

(assert (= (and b!1206529 (not res!802344)) b!1206518))

(assert (= (and b!1206518 c!118481) b!1206522))

(assert (= (and b!1206518 (not c!118481)) b!1206532))

(assert (= (and b!1206532 c!118482) b!1206524))

(assert (= (and b!1206532 (not c!118482)) b!1206514))

(assert (= (and b!1206514 c!118480) b!1206535))

(assert (= (and b!1206514 (not c!118480)) b!1206520))

(assert (= (or b!1206524 b!1206535) bm!58736))

(assert (= (or b!1206524 b!1206535) bm!58739))

(assert (= (or b!1206524 b!1206535) bm!58740))

(assert (= (or b!1206522 bm!58740) bm!58737))

(assert (= (or b!1206522 bm!58736) bm!58735))

(assert (= (or b!1206522 bm!58739) bm!58741))

(assert (= (and b!1206518 c!118478) b!1206519))

(assert (= (and b!1206518 (not c!118478)) b!1206513))

(assert (= (and b!1206518 res!802340) b!1206528))

(assert (= (and b!1206517 condMapEmpty!47841) mapIsEmpty!47841))

(assert (= (and b!1206517 (not condMapEmpty!47841)) mapNonEmpty!47841))

(get-info :version)

(assert (= (and mapNonEmpty!47841 ((_ is ValueCellFull!14618) mapValue!47841)) b!1206516))

(assert (= (and b!1206517 ((_ is ValueCellFull!14618) mapDefault!47841)) b!1206537))

(assert (= start!100806 b!1206517))

(declare-fun b_lambda!21367 () Bool)

(assert (=> (not b_lambda!21367) (not b!1206525)))

(declare-fun t!39514 () Bool)

(declare-fun tb!10743 () Bool)

(assert (=> (and start!100806 (= defaultEntry!1004 defaultEntry!1004) t!39514) tb!10743))

(declare-fun result!22081 () Bool)

(assert (=> tb!10743 (= result!22081 tp_is_empty!30655)))

(assert (=> b!1206525 t!39514))

(declare-fun b_and!42883 () Bool)

(assert (= b_and!42881 (and (=> t!39514 result!22081) b_and!42883)))

(declare-fun m!1111713 () Bool)

(assert (=> b!1206515 m!1111713))

(declare-fun m!1111715 () Bool)

(assert (=> b!1206538 m!1111715))

(declare-fun m!1111717 () Bool)

(assert (=> b!1206521 m!1111717))

(declare-fun m!1111719 () Bool)

(assert (=> b!1206512 m!1111719))

(declare-fun m!1111721 () Bool)

(assert (=> b!1206526 m!1111721))

(declare-fun m!1111723 () Bool)

(assert (=> b!1206526 m!1111723))

(declare-fun m!1111725 () Bool)

(assert (=> b!1206518 m!1111725))

(declare-fun m!1111727 () Bool)

(assert (=> b!1206518 m!1111727))

(declare-fun m!1111729 () Bool)

(assert (=> b!1206518 m!1111729))

(declare-fun m!1111731 () Bool)

(assert (=> start!100806 m!1111731))

(declare-fun m!1111733 () Bool)

(assert (=> start!100806 m!1111733))

(declare-fun m!1111735 () Bool)

(assert (=> bm!58742 m!1111735))

(declare-fun m!1111737 () Bool)

(assert (=> bm!58737 m!1111737))

(declare-fun m!1111739 () Bool)

(assert (=> bm!58741 m!1111739))

(declare-fun m!1111741 () Bool)

(assert (=> b!1206534 m!1111741))

(declare-fun m!1111743 () Bool)

(assert (=> b!1206525 m!1111743))

(declare-fun m!1111745 () Bool)

(assert (=> b!1206525 m!1111745))

(declare-fun m!1111747 () Bool)

(assert (=> b!1206525 m!1111747))

(declare-fun m!1111749 () Bool)

(assert (=> b!1206525 m!1111749))

(declare-fun m!1111751 () Bool)

(assert (=> b!1206522 m!1111751))

(declare-fun m!1111753 () Bool)

(assert (=> b!1206522 m!1111753))

(assert (=> b!1206522 m!1111753))

(declare-fun m!1111755 () Bool)

(assert (=> b!1206522 m!1111755))

(declare-fun m!1111757 () Bool)

(assert (=> bm!58738 m!1111757))

(declare-fun m!1111759 () Bool)

(assert (=> b!1206528 m!1111759))

(declare-fun m!1111761 () Bool)

(assert (=> bm!58735 m!1111761))

(declare-fun m!1111763 () Bool)

(assert (=> b!1206529 m!1111763))

(assert (=> b!1206529 m!1111735))

(declare-fun m!1111765 () Bool)

(assert (=> mapNonEmpty!47841 m!1111765))

(declare-fun m!1111767 () Bool)

(assert (=> b!1206527 m!1111767))

(declare-fun m!1111769 () Bool)

(assert (=> b!1206511 m!1111769))

(declare-fun m!1111771 () Bool)

(assert (=> b!1206511 m!1111771))

(declare-fun m!1111773 () Bool)

(assert (=> b!1206531 m!1111773))

(declare-fun m!1111775 () Bool)

(assert (=> b!1206523 m!1111775))

(declare-fun m!1111777 () Bool)

(assert (=> b!1206523 m!1111777))

(assert (=> b!1206519 m!1111759))

(check-sat (not b!1206534) (not b!1206522) (not bm!58737) (not b_next!25951) (not b!1206531) (not bm!58738) (not b!1206521) (not bm!58742) (not b!1206527) (not b!1206515) (not b!1206538) (not b!1206528) (not start!100806) (not bm!58741) b_and!42883 (not mapNonEmpty!47841) (not b!1206526) (not b!1206529) (not b!1206518) (not b!1206519) (not b!1206523) (not b!1206511) (not bm!58735) (not b!1206525) tp_is_empty!30655 (not b_lambda!21367))
(check-sat b_and!42883 (not b_next!25951))
