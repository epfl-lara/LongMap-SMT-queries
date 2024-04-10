; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98908 () Bool)

(assert start!98908)

(declare-fun b_free!24513 () Bool)

(declare-fun b_next!24513 () Bool)

(assert (=> start!98908 (= b_free!24513 (not b_next!24513))))

(declare-fun tp!86249 () Bool)

(declare-fun b_and!39875 () Bool)

(assert (=> start!98908 (= tp!86249 b_and!39875)))

(declare-fun b!1158610 () Bool)

(declare-fun e!658867 () Bool)

(declare-fun e!658874 () Bool)

(assert (=> b!1158610 (= e!658867 e!658874)))

(declare-fun res!769218 () Bool)

(assert (=> b!1158610 (=> res!769218 e!658874)))

(declare-datatypes ((array!74929 0))(
  ( (array!74930 (arr!36115 (Array (_ BitVec 32) (_ BitVec 64))) (size!36651 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74929)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1158610 (= res!769218 (not (= (select (arr!36115 _keys!1208) from!1455) k0!934)))))

(declare-fun e!658871 () Bool)

(assert (=> b!1158610 e!658871))

(declare-fun c!115480 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1158610 (= c!115480 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43851 0))(
  ( (V!43852 (val!14578 Int)) )
))
(declare-fun zeroValue!944 () V!43851)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13812 0))(
  ( (ValueCellFull!13812 (v!17215 V!43851)) (EmptyCell!13812) )
))
(declare-datatypes ((array!74931 0))(
  ( (array!74932 (arr!36116 (Array (_ BitVec 32) ValueCell!13812)) (size!36652 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74931)

(declare-fun minValue!944 () V!43851)

(declare-datatypes ((Unit!38180 0))(
  ( (Unit!38181) )
))
(declare-fun lt!520663 () Unit!38180)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!622 (array!74929 array!74931 (_ BitVec 32) (_ BitVec 32) V!43851 V!43851 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38180)

(assert (=> b!1158610 (= lt!520663 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!622 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158611 () Bool)

(declare-fun res!769211 () Bool)

(declare-fun e!658877 () Bool)

(assert (=> b!1158611 (=> (not res!769211) (not e!658877))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1158611 (= res!769211 (validKeyInArray!0 k0!934))))

(declare-fun bm!55695 () Bool)

(declare-datatypes ((tuple2!18558 0))(
  ( (tuple2!18559 (_1!9290 (_ BitVec 64)) (_2!9290 V!43851)) )
))
(declare-datatypes ((List!25297 0))(
  ( (Nil!25294) (Cons!25293 (h!26502 tuple2!18558) (t!36802 List!25297)) )
))
(declare-datatypes ((ListLongMap!16527 0))(
  ( (ListLongMap!16528 (toList!8279 List!25297)) )
))
(declare-fun call!55699 () ListLongMap!16527)

(declare-fun call!55702 () ListLongMap!16527)

(assert (=> bm!55695 (= call!55699 call!55702)))

(declare-fun bm!55696 () Bool)

(declare-fun call!55701 () ListLongMap!16527)

(declare-fun getCurrentListMapNoExtraKeys!4744 (array!74929 array!74931 (_ BitVec 32) (_ BitVec 32) V!43851 V!43851 (_ BitVec 32) Int) ListLongMap!16527)

(assert (=> bm!55696 (= call!55701 (getCurrentListMapNoExtraKeys!4744 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!769217 () Bool)

(assert (=> start!98908 (=> (not res!769217) (not e!658877))))

(assert (=> start!98908 (= res!769217 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36651 _keys!1208))))))

(assert (=> start!98908 e!658877))

(declare-fun tp_is_empty!29043 () Bool)

(assert (=> start!98908 tp_is_empty!29043))

(declare-fun array_inv!27638 (array!74929) Bool)

(assert (=> start!98908 (array_inv!27638 _keys!1208)))

(assert (=> start!98908 true))

(assert (=> start!98908 tp!86249))

(declare-fun e!658868 () Bool)

(declare-fun array_inv!27639 (array!74931) Bool)

(assert (=> start!98908 (and (array_inv!27639 _values!996) e!658868)))

(declare-fun b!1158612 () Bool)

(declare-fun res!769221 () Bool)

(assert (=> b!1158612 (=> (not res!769221) (not e!658877))))

(assert (=> b!1158612 (= res!769221 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36651 _keys!1208))))))

(declare-fun b!1158613 () Bool)

(declare-fun e!658879 () Bool)

(assert (=> b!1158613 (= e!658879 tp_is_empty!29043)))

(declare-fun b!1158614 () Bool)

(declare-fun e!658880 () Bool)

(assert (=> b!1158614 (= e!658880 e!658867)))

(declare-fun res!769216 () Bool)

(assert (=> b!1158614 (=> res!769216 e!658867)))

(assert (=> b!1158614 (= res!769216 (not (= from!1455 i!673)))))

(declare-fun lt!520675 () array!74931)

(declare-fun lt!520664 () array!74929)

(declare-fun lt!520677 () ListLongMap!16527)

(assert (=> b!1158614 (= lt!520677 (getCurrentListMapNoExtraKeys!4744 lt!520664 lt!520675 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!520683 () V!43851)

(assert (=> b!1158614 (= lt!520675 (array!74932 (store (arr!36116 _values!996) i!673 (ValueCellFull!13812 lt!520683)) (size!36652 _values!996)))))

(declare-fun dynLambda!2748 (Int (_ BitVec 64)) V!43851)

(assert (=> b!1158614 (= lt!520683 (dynLambda!2748 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!520668 () ListLongMap!16527)

(assert (=> b!1158614 (= lt!520668 (getCurrentListMapNoExtraKeys!4744 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1158615 () Bool)

(declare-fun contains!6789 (ListLongMap!16527 (_ BitVec 64)) Bool)

(assert (=> b!1158615 (contains!6789 call!55702 k0!934)))

(declare-fun lt!520674 () Unit!38180)

(declare-fun call!55705 () Unit!38180)

(assert (=> b!1158615 (= lt!520674 call!55705)))

(declare-fun call!55704 () Bool)

(assert (=> b!1158615 call!55704))

(declare-fun lt!520672 () ListLongMap!16527)

(declare-fun lt!520665 () ListLongMap!16527)

(declare-fun +!3688 (ListLongMap!16527 tuple2!18558) ListLongMap!16527)

(assert (=> b!1158615 (= lt!520672 (+!3688 lt!520665 (tuple2!18559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!520671 () Unit!38180)

(declare-fun addStillContains!930 (ListLongMap!16527 (_ BitVec 64) V!43851 (_ BitVec 64)) Unit!38180)

(assert (=> b!1158615 (= lt!520671 (addStillContains!930 lt!520665 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun e!658875 () Unit!38180)

(assert (=> b!1158615 (= e!658875 lt!520674)))

(declare-fun b!1158616 () Bool)

(declare-fun e!658873 () Bool)

(assert (=> b!1158616 (= e!658873 (not e!658880))))

(declare-fun res!769222 () Bool)

(assert (=> b!1158616 (=> res!769222 e!658880)))

(assert (=> b!1158616 (= res!769222 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74929 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1158616 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!520666 () Unit!38180)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74929 (_ BitVec 64) (_ BitVec 32)) Unit!38180)

(assert (=> b!1158616 (= lt!520666 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun e!658869 () Bool)

(declare-fun b!1158617 () Bool)

(assert (=> b!1158617 (= e!658869 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1158618 () Bool)

(declare-fun res!769219 () Bool)

(assert (=> b!1158618 (=> (not res!769219) (not e!658877))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74929 (_ BitVec 32)) Bool)

(assert (=> b!1158618 (= res!769219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1158619 () Bool)

(declare-fun call!55703 () Bool)

(assert (=> b!1158619 call!55703))

(declare-fun lt!520667 () Unit!38180)

(declare-fun call!55700 () Unit!38180)

(assert (=> b!1158619 (= lt!520667 call!55700)))

(declare-fun e!658881 () Unit!38180)

(assert (=> b!1158619 (= e!658881 lt!520667)))

(declare-fun bm!55697 () Bool)

(declare-fun c!115479 () Bool)

(declare-fun c!115476 () Bool)

(assert (=> bm!55697 (= call!55705 (addStillContains!930 (ite c!115479 lt!520672 lt!520665) (ite c!115479 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!115476 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!115479 minValue!944 (ite c!115476 zeroValue!944 minValue!944)) k0!934))))

(declare-fun mapIsEmpty!45389 () Bool)

(declare-fun mapRes!45389 () Bool)

(assert (=> mapIsEmpty!45389 mapRes!45389))

(declare-fun b!1158620 () Bool)

(assert (=> b!1158620 (= e!658877 e!658873)))

(declare-fun res!769210 () Bool)

(assert (=> b!1158620 (=> (not res!769210) (not e!658873))))

(assert (=> b!1158620 (= res!769210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!520664 mask!1564))))

(assert (=> b!1158620 (= lt!520664 (array!74930 (store (arr!36115 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36651 _keys!1208)))))

(declare-fun b!1158621 () Bool)

(declare-fun lt!520678 () Bool)

(assert (=> b!1158621 (= c!115476 (and (not lt!520678) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!658878 () Unit!38180)

(assert (=> b!1158621 (= e!658875 e!658878)))

(declare-fun bm!55698 () Bool)

(assert (=> bm!55698 (= call!55704 (contains!6789 (ite c!115479 lt!520672 call!55699) k0!934))))

(declare-fun b!1158622 () Bool)

(declare-fun res!769213 () Bool)

(assert (=> b!1158622 (=> (not res!769213) (not e!658873))))

(declare-datatypes ((List!25298 0))(
  ( (Nil!25295) (Cons!25294 (h!26503 (_ BitVec 64)) (t!36803 List!25298)) )
))
(declare-fun arrayNoDuplicates!0 (array!74929 (_ BitVec 32) List!25298) Bool)

(assert (=> b!1158622 (= res!769213 (arrayNoDuplicates!0 lt!520664 #b00000000000000000000000000000000 Nil!25295))))

(declare-fun b!1158623 () Bool)

(declare-fun e!658865 () Unit!38180)

(declare-fun Unit!38182 () Unit!38180)

(assert (=> b!1158623 (= e!658865 Unit!38182)))

(declare-fun bm!55699 () Bool)

(assert (=> bm!55699 (= call!55702 (+!3688 (ite c!115479 lt!520672 lt!520665) (ite c!115479 (tuple2!18559 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!115476 (tuple2!18559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18559 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1158624 () Bool)

(declare-fun res!769214 () Bool)

(assert (=> b!1158624 (=> (not res!769214) (not e!658877))))

(assert (=> b!1158624 (= res!769214 (and (= (size!36652 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36651 _keys!1208) (size!36652 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun call!55698 () ListLongMap!16527)

(declare-fun bm!55700 () Bool)

(assert (=> bm!55700 (= call!55698 (getCurrentListMapNoExtraKeys!4744 lt!520664 lt!520675 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158625 () Bool)

(assert (=> b!1158625 (= e!658869 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!520678) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1158626 () Bool)

(assert (=> b!1158626 (= e!658871 (= call!55698 call!55701))))

(declare-fun b!1158627 () Bool)

(declare-fun res!769215 () Bool)

(assert (=> b!1158627 (=> (not res!769215) (not e!658877))))

(assert (=> b!1158627 (= res!769215 (= (select (arr!36115 _keys!1208) i!673) k0!934))))

(declare-fun e!658876 () Bool)

(declare-fun b!1158628 () Bool)

(assert (=> b!1158628 (= e!658876 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1158629 () Bool)

(assert (=> b!1158629 (= e!658874 true)))

(declare-fun e!658872 () Bool)

(assert (=> b!1158629 e!658872))

(declare-fun res!769209 () Bool)

(assert (=> b!1158629 (=> (not res!769209) (not e!658872))))

(declare-fun lt!520669 () ListLongMap!16527)

(assert (=> b!1158629 (= res!769209 (= lt!520669 lt!520665))))

(declare-fun -!1391 (ListLongMap!16527 (_ BitVec 64)) ListLongMap!16527)

(assert (=> b!1158629 (= lt!520669 (-!1391 lt!520668 k0!934))))

(declare-fun lt!520662 () V!43851)

(assert (=> b!1158629 (= (-!1391 (+!3688 lt!520665 (tuple2!18559 (select (arr!36115 _keys!1208) from!1455) lt!520662)) (select (arr!36115 _keys!1208) from!1455)) lt!520665)))

(declare-fun lt!520670 () Unit!38180)

(declare-fun addThenRemoveForNewKeyIsSame!227 (ListLongMap!16527 (_ BitVec 64) V!43851) Unit!38180)

(assert (=> b!1158629 (= lt!520670 (addThenRemoveForNewKeyIsSame!227 lt!520665 (select (arr!36115 _keys!1208) from!1455) lt!520662))))

(declare-fun get!18411 (ValueCell!13812 V!43851) V!43851)

(assert (=> b!1158629 (= lt!520662 (get!18411 (select (arr!36116 _values!996) from!1455) lt!520683))))

(declare-fun lt!520682 () Unit!38180)

(assert (=> b!1158629 (= lt!520682 e!658865)))

(declare-fun c!115477 () Bool)

(assert (=> b!1158629 (= c!115477 (contains!6789 lt!520665 k0!934))))

(assert (=> b!1158629 (= lt!520665 (getCurrentListMapNoExtraKeys!4744 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158630 () Bool)

(declare-fun res!769220 () Bool)

(assert (=> b!1158630 (=> (not res!769220) (not e!658877))))

(assert (=> b!1158630 (= res!769220 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25295))))

(declare-fun b!1158631 () Bool)

(declare-fun lt!520680 () Unit!38180)

(assert (=> b!1158631 (= e!658878 lt!520680)))

(assert (=> b!1158631 (= lt!520680 call!55700)))

(assert (=> b!1158631 call!55703))

(declare-fun b!1158632 () Bool)

(declare-fun e!658870 () Bool)

(assert (=> b!1158632 (= e!658870 tp_is_empty!29043)))

(declare-fun b!1158633 () Bool)

(declare-fun res!769223 () Bool)

(assert (=> b!1158633 (=> (not res!769223) (not e!658877))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1158633 (= res!769223 (validMask!0 mask!1564))))

(declare-fun b!1158634 () Bool)

(declare-fun Unit!38183 () Unit!38180)

(assert (=> b!1158634 (= e!658881 Unit!38183)))

(declare-fun bm!55701 () Bool)

(assert (=> bm!55701 (= call!55703 call!55704)))

(declare-fun b!1158635 () Bool)

(assert (=> b!1158635 (= e!658868 (and e!658879 mapRes!45389))))

(declare-fun condMapEmpty!45389 () Bool)

(declare-fun mapDefault!45389 () ValueCell!13812)

(assert (=> b!1158635 (= condMapEmpty!45389 (= (arr!36116 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13812)) mapDefault!45389)))))

(declare-fun bm!55702 () Bool)

(assert (=> bm!55702 (= call!55700 call!55705)))

(declare-fun b!1158636 () Bool)

(declare-fun Unit!38184 () Unit!38180)

(assert (=> b!1158636 (= e!658865 Unit!38184)))

(assert (=> b!1158636 (= lt!520678 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1158636 (= c!115479 (and (not lt!520678) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!520679 () Unit!38180)

(assert (=> b!1158636 (= lt!520679 e!658875)))

(declare-fun lt!520676 () Unit!38180)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!515 (array!74929 array!74931 (_ BitVec 32) (_ BitVec 32) V!43851 V!43851 (_ BitVec 64) (_ BitVec 32) Int) Unit!38180)

(assert (=> b!1158636 (= lt!520676 (lemmaListMapContainsThenArrayContainsFrom!515 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115475 () Bool)

(assert (=> b!1158636 (= c!115475 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!769212 () Bool)

(assert (=> b!1158636 (= res!769212 e!658869)))

(assert (=> b!1158636 (=> (not res!769212) (not e!658876))))

(assert (=> b!1158636 e!658876))

(declare-fun lt!520673 () Unit!38180)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74929 (_ BitVec 32) (_ BitVec 32)) Unit!38180)

(assert (=> b!1158636 (= lt!520673 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1158636 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25295)))

(declare-fun lt!520681 () Unit!38180)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74929 (_ BitVec 64) (_ BitVec 32) List!25298) Unit!38180)

(assert (=> b!1158636 (= lt!520681 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25295))))

(assert (=> b!1158636 false))

(declare-fun b!1158637 () Bool)

(assert (=> b!1158637 (= e!658872 (= lt!520669 (getCurrentListMapNoExtraKeys!4744 lt!520664 lt!520675 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1158638 () Bool)

(assert (=> b!1158638 (= e!658878 e!658881)))

(declare-fun c!115478 () Bool)

(assert (=> b!1158638 (= c!115478 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!520678))))

(declare-fun mapNonEmpty!45389 () Bool)

(declare-fun tp!86250 () Bool)

(assert (=> mapNonEmpty!45389 (= mapRes!45389 (and tp!86250 e!658870))))

(declare-fun mapValue!45389 () ValueCell!13812)

(declare-fun mapKey!45389 () (_ BitVec 32))

(declare-fun mapRest!45389 () (Array (_ BitVec 32) ValueCell!13812))

(assert (=> mapNonEmpty!45389 (= (arr!36116 _values!996) (store mapRest!45389 mapKey!45389 mapValue!45389))))

(declare-fun b!1158639 () Bool)

(assert (=> b!1158639 (= e!658871 (= call!55698 (-!1391 call!55701 k0!934)))))

(assert (= (and start!98908 res!769217) b!1158633))

(assert (= (and b!1158633 res!769223) b!1158624))

(assert (= (and b!1158624 res!769214) b!1158618))

(assert (= (and b!1158618 res!769219) b!1158630))

(assert (= (and b!1158630 res!769220) b!1158612))

(assert (= (and b!1158612 res!769221) b!1158611))

(assert (= (and b!1158611 res!769211) b!1158627))

(assert (= (and b!1158627 res!769215) b!1158620))

(assert (= (and b!1158620 res!769210) b!1158622))

(assert (= (and b!1158622 res!769213) b!1158616))

(assert (= (and b!1158616 (not res!769222)) b!1158614))

(assert (= (and b!1158614 (not res!769216)) b!1158610))

(assert (= (and b!1158610 c!115480) b!1158639))

(assert (= (and b!1158610 (not c!115480)) b!1158626))

(assert (= (or b!1158639 b!1158626) bm!55696))

(assert (= (or b!1158639 b!1158626) bm!55700))

(assert (= (and b!1158610 (not res!769218)) b!1158629))

(assert (= (and b!1158629 c!115477) b!1158636))

(assert (= (and b!1158629 (not c!115477)) b!1158623))

(assert (= (and b!1158636 c!115479) b!1158615))

(assert (= (and b!1158636 (not c!115479)) b!1158621))

(assert (= (and b!1158621 c!115476) b!1158631))

(assert (= (and b!1158621 (not c!115476)) b!1158638))

(assert (= (and b!1158638 c!115478) b!1158619))

(assert (= (and b!1158638 (not c!115478)) b!1158634))

(assert (= (or b!1158631 b!1158619) bm!55702))

(assert (= (or b!1158631 b!1158619) bm!55695))

(assert (= (or b!1158631 b!1158619) bm!55701))

(assert (= (or b!1158615 bm!55701) bm!55698))

(assert (= (or b!1158615 bm!55702) bm!55697))

(assert (= (or b!1158615 bm!55695) bm!55699))

(assert (= (and b!1158636 c!115475) b!1158617))

(assert (= (and b!1158636 (not c!115475)) b!1158625))

(assert (= (and b!1158636 res!769212) b!1158628))

(assert (= (and b!1158629 res!769209) b!1158637))

(assert (= (and b!1158635 condMapEmpty!45389) mapIsEmpty!45389))

(assert (= (and b!1158635 (not condMapEmpty!45389)) mapNonEmpty!45389))

(get-info :version)

(assert (= (and mapNonEmpty!45389 ((_ is ValueCellFull!13812) mapValue!45389)) b!1158632))

(assert (= (and b!1158635 ((_ is ValueCellFull!13812) mapDefault!45389)) b!1158613))

(assert (= start!98908 b!1158635))

(declare-fun b_lambda!19619 () Bool)

(assert (=> (not b_lambda!19619) (not b!1158614)))

(declare-fun t!36801 () Bool)

(declare-fun tb!9325 () Bool)

(assert (=> (and start!98908 (= defaultEntry!1004 defaultEntry!1004) t!36801) tb!9325))

(declare-fun result!19215 () Bool)

(assert (=> tb!9325 (= result!19215 tp_is_empty!29043)))

(assert (=> b!1158614 t!36801))

(declare-fun b_and!39877 () Bool)

(assert (= b_and!39875 (and (=> t!36801 result!19215) b_and!39877)))

(declare-fun m!1067789 () Bool)

(assert (=> b!1158637 m!1067789))

(declare-fun m!1067791 () Bool)

(assert (=> bm!55699 m!1067791))

(declare-fun m!1067793 () Bool)

(assert (=> start!98908 m!1067793))

(declare-fun m!1067795 () Bool)

(assert (=> start!98908 m!1067795))

(declare-fun m!1067797 () Bool)

(assert (=> b!1158639 m!1067797))

(declare-fun m!1067799 () Bool)

(assert (=> b!1158622 m!1067799))

(declare-fun m!1067801 () Bool)

(assert (=> b!1158627 m!1067801))

(declare-fun m!1067803 () Bool)

(assert (=> mapNonEmpty!45389 m!1067803))

(declare-fun m!1067805 () Bool)

(assert (=> bm!55698 m!1067805))

(declare-fun m!1067807 () Bool)

(assert (=> b!1158617 m!1067807))

(assert (=> bm!55700 m!1067789))

(declare-fun m!1067809 () Bool)

(assert (=> b!1158610 m!1067809))

(declare-fun m!1067811 () Bool)

(assert (=> b!1158610 m!1067811))

(declare-fun m!1067813 () Bool)

(assert (=> b!1158630 m!1067813))

(declare-fun m!1067815 () Bool)

(assert (=> b!1158633 m!1067815))

(declare-fun m!1067817 () Bool)

(assert (=> b!1158636 m!1067817))

(declare-fun m!1067819 () Bool)

(assert (=> b!1158636 m!1067819))

(declare-fun m!1067821 () Bool)

(assert (=> b!1158636 m!1067821))

(declare-fun m!1067823 () Bool)

(assert (=> b!1158636 m!1067823))

(declare-fun m!1067825 () Bool)

(assert (=> b!1158620 m!1067825))

(declare-fun m!1067827 () Bool)

(assert (=> b!1158620 m!1067827))

(declare-fun m!1067829 () Bool)

(assert (=> bm!55696 m!1067829))

(declare-fun m!1067831 () Bool)

(assert (=> bm!55697 m!1067831))

(declare-fun m!1067833 () Bool)

(assert (=> b!1158614 m!1067833))

(declare-fun m!1067835 () Bool)

(assert (=> b!1158614 m!1067835))

(declare-fun m!1067837 () Bool)

(assert (=> b!1158614 m!1067837))

(declare-fun m!1067839 () Bool)

(assert (=> b!1158614 m!1067839))

(declare-fun m!1067841 () Bool)

(assert (=> b!1158629 m!1067841))

(declare-fun m!1067843 () Bool)

(assert (=> b!1158629 m!1067843))

(declare-fun m!1067845 () Bool)

(assert (=> b!1158629 m!1067845))

(assert (=> b!1158629 m!1067809))

(declare-fun m!1067847 () Bool)

(assert (=> b!1158629 m!1067847))

(assert (=> b!1158629 m!1067809))

(assert (=> b!1158629 m!1067841))

(assert (=> b!1158629 m!1067809))

(declare-fun m!1067849 () Bool)

(assert (=> b!1158629 m!1067849))

(assert (=> b!1158629 m!1067829))

(declare-fun m!1067851 () Bool)

(assert (=> b!1158629 m!1067851))

(assert (=> b!1158629 m!1067843))

(declare-fun m!1067853 () Bool)

(assert (=> b!1158629 m!1067853))

(declare-fun m!1067855 () Bool)

(assert (=> b!1158615 m!1067855))

(declare-fun m!1067857 () Bool)

(assert (=> b!1158615 m!1067857))

(declare-fun m!1067859 () Bool)

(assert (=> b!1158615 m!1067859))

(declare-fun m!1067861 () Bool)

(assert (=> b!1158611 m!1067861))

(assert (=> b!1158628 m!1067807))

(declare-fun m!1067863 () Bool)

(assert (=> b!1158616 m!1067863))

(declare-fun m!1067865 () Bool)

(assert (=> b!1158616 m!1067865))

(declare-fun m!1067867 () Bool)

(assert (=> b!1158618 m!1067867))

(check-sat (not b!1158614) tp_is_empty!29043 (not bm!55698) (not bm!55700) (not b!1158620) (not b!1158611) (not bm!55696) (not b!1158615) (not b!1158629) (not b!1158622) (not b_next!24513) (not b!1158618) (not b!1158630) (not b!1158610) (not b!1158617) (not mapNonEmpty!45389) (not b!1158636) b_and!39877 (not b!1158637) (not b!1158633) (not bm!55697) (not b!1158628) (not b_lambda!19619) (not b!1158639) (not start!98908) (not bm!55699) (not b!1158616))
(check-sat b_and!39877 (not b_next!24513))
