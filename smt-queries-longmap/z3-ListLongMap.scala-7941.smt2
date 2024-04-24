; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98722 () Bool)

(assert start!98722)

(declare-fun b_free!24091 () Bool)

(declare-fun b_next!24091 () Bool)

(assert (=> start!98722 (= b_free!24091 (not b_next!24091))))

(declare-fun tp!84983 () Bool)

(declare-fun b_and!39033 () Bool)

(assert (=> start!98722 (= tp!84983 b_and!39033)))

(declare-fun e!649102 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1140647 () Bool)

(declare-fun lt!507560 () Bool)

(assert (=> b!1140647 (= e!649102 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!507560) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!44756 () Bool)

(declare-fun mapRes!44756 () Bool)

(assert (=> mapIsEmpty!44756 mapRes!44756))

(declare-fun b!1140648 () Bool)

(declare-fun res!760383 () Bool)

(declare-fun e!649099 () Bool)

(assert (=> b!1140648 (=> (not res!760383) (not e!649099))))

(declare-datatypes ((array!74143 0))(
  ( (array!74144 (arr!35716 (Array (_ BitVec 32) (_ BitVec 64))) (size!36253 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74143)

(declare-datatypes ((V!43289 0))(
  ( (V!43290 (val!14367 Int)) )
))
(declare-datatypes ((ValueCell!13601 0))(
  ( (ValueCellFull!13601 (v!17000 V!43289)) (EmptyCell!13601) )
))
(declare-datatypes ((array!74145 0))(
  ( (array!74146 (arr!35717 (Array (_ BitVec 32) ValueCell!13601)) (size!36254 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74145)

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1140648 (= res!760383 (and (= (size!36254 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36253 _keys!1208) (size!36254 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1140649 () Bool)

(declare-fun res!760382 () Bool)

(declare-fun e!649104 () Bool)

(assert (=> b!1140649 (=> (not res!760382) (not e!649104))))

(declare-fun lt!507545 () array!74143)

(declare-datatypes ((List!24934 0))(
  ( (Nil!24931) (Cons!24930 (h!26148 (_ BitVec 64)) (t!36009 List!24934)) )
))
(declare-fun arrayNoDuplicates!0 (array!74143 (_ BitVec 32) List!24934) Bool)

(assert (=> b!1140649 (= res!760382 (arrayNoDuplicates!0 lt!507545 #b00000000000000000000000000000000 Nil!24931))))

(declare-fun b!1140650 () Bool)

(declare-datatypes ((Unit!37319 0))(
  ( (Unit!37320) )
))
(declare-fun e!649096 () Unit!37319)

(declare-fun e!649106 () Unit!37319)

(assert (=> b!1140650 (= e!649096 e!649106)))

(declare-fun c!112075 () Bool)

(assert (=> b!1140650 (= c!112075 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!507560))))

(declare-fun b!1140651 () Bool)

(declare-fun res!760389 () Bool)

(assert (=> b!1140651 (=> (not res!760389) (not e!649099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1140651 (= res!760389 (validMask!0 mask!1564))))

(declare-fun b!1140652 () Bool)

(declare-fun c!112076 () Bool)

(assert (=> b!1140652 (= c!112076 (and (not lt!507560) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!649105 () Unit!37319)

(assert (=> b!1140652 (= e!649105 e!649096)))

(declare-fun b!1140653 () Bool)

(declare-fun e!649107 () Unit!37319)

(declare-fun Unit!37321 () Unit!37319)

(assert (=> b!1140653 (= e!649107 Unit!37321)))

(declare-fun b!1140654 () Bool)

(declare-fun res!760392 () Bool)

(assert (=> b!1140654 (=> (not res!760392) (not e!649099))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1140654 (= res!760392 (validKeyInArray!0 k0!934))))

(declare-fun b!1140655 () Bool)

(declare-fun res!760393 () Bool)

(assert (=> b!1140655 (=> (not res!760393) (not e!649099))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1140655 (= res!760393 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36253 _keys!1208))))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1140656 () Bool)

(declare-fun arrayContainsKey!0 (array!74143 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1140656 (= e!649102 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapNonEmpty!44756 () Bool)

(declare-fun tp!84984 () Bool)

(declare-fun e!649097 () Bool)

(assert (=> mapNonEmpty!44756 (= mapRes!44756 (and tp!84984 e!649097))))

(declare-fun mapValue!44756 () ValueCell!13601)

(declare-fun mapRest!44756 () (Array (_ BitVec 32) ValueCell!13601))

(declare-fun mapKey!44756 () (_ BitVec 32))

(assert (=> mapNonEmpty!44756 (= (arr!35717 _values!996) (store mapRest!44756 mapKey!44756 mapValue!44756))))

(declare-datatypes ((tuple2!18172 0))(
  ( (tuple2!18173 (_1!9097 (_ BitVec 64)) (_2!9097 V!43289)) )
))
(declare-datatypes ((List!24935 0))(
  ( (Nil!24932) (Cons!24931 (h!26149 tuple2!18172) (t!36010 List!24935)) )
))
(declare-datatypes ((ListLongMap!16149 0))(
  ( (ListLongMap!16150 (toList!8090 List!24935)) )
))
(declare-fun call!50703 () ListLongMap!16149)

(declare-fun b!1140657 () Bool)

(declare-fun e!649101 () Bool)

(declare-fun call!50706 () ListLongMap!16149)

(declare-fun -!1224 (ListLongMap!16149 (_ BitVec 64)) ListLongMap!16149)

(assert (=> b!1140657 (= e!649101 (= call!50703 (-!1224 call!50706 k0!934)))))

(declare-fun call!50702 () Unit!37319)

(declare-fun lt!507555 () ListLongMap!16149)

(declare-fun minValue!944 () V!43289)

(declare-fun zeroValue!944 () V!43289)

(declare-fun c!112078 () Bool)

(declare-fun bm!50696 () Bool)

(declare-fun lt!507543 () ListLongMap!16149)

(declare-fun addStillContains!767 (ListLongMap!16149 (_ BitVec 64) V!43289 (_ BitVec 64)) Unit!37319)

(assert (=> bm!50696 (= call!50702 (addStillContains!767 (ite c!112078 lt!507555 lt!507543) (ite c!112078 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112076 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112078 minValue!944 (ite c!112076 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1140658 () Bool)

(declare-fun e!649100 () Bool)

(assert (=> b!1140658 (= e!649100 true)))

(declare-fun lt!507550 () V!43289)

(declare-fun +!3539 (ListLongMap!16149 tuple2!18172) ListLongMap!16149)

(assert (=> b!1140658 (= (-!1224 (+!3539 lt!507543 (tuple2!18173 (select (arr!35716 _keys!1208) from!1455) lt!507550)) (select (arr!35716 _keys!1208) from!1455)) lt!507543)))

(declare-fun lt!507559 () Unit!37319)

(declare-fun addThenRemoveForNewKeyIsSame!84 (ListLongMap!16149 (_ BitVec 64) V!43289) Unit!37319)

(assert (=> b!1140658 (= lt!507559 (addThenRemoveForNewKeyIsSame!84 lt!507543 (select (arr!35716 _keys!1208) from!1455) lt!507550))))

(declare-fun lt!507544 () V!43289)

(declare-fun get!18159 (ValueCell!13601 V!43289) V!43289)

(assert (=> b!1140658 (= lt!507550 (get!18159 (select (arr!35717 _values!996) from!1455) lt!507544))))

(declare-fun lt!507548 () Unit!37319)

(assert (=> b!1140658 (= lt!507548 e!649107)))

(declare-fun c!112077 () Bool)

(declare-fun contains!6637 (ListLongMap!16149 (_ BitVec 64)) Bool)

(assert (=> b!1140658 (= c!112077 (contains!6637 lt!507543 k0!934))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4598 (array!74143 array!74145 (_ BitVec 32) (_ BitVec 32) V!43289 V!43289 (_ BitVec 32) Int) ListLongMap!16149)

(assert (=> b!1140658 (= lt!507543 (getCurrentListMapNoExtraKeys!4598 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!50697 () Bool)

(declare-fun call!50701 () ListLongMap!16149)

(declare-fun call!50699 () ListLongMap!16149)

(assert (=> bm!50697 (= call!50701 call!50699)))

(declare-fun b!1140659 () Bool)

(declare-fun e!649109 () Bool)

(assert (=> b!1140659 (= e!649109 e!649100)))

(declare-fun res!760395 () Bool)

(assert (=> b!1140659 (=> res!760395 e!649100)))

(assert (=> b!1140659 (= res!760395 (not (= (select (arr!35716 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1140659 e!649101))

(declare-fun c!112079 () Bool)

(assert (=> b!1140659 (= c!112079 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!507552 () Unit!37319)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!483 (array!74143 array!74145 (_ BitVec 32) (_ BitVec 32) V!43289 V!43289 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37319)

(assert (=> b!1140659 (= lt!507552 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!483 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140660 () Bool)

(declare-fun res!760388 () Bool)

(assert (=> b!1140660 (=> (not res!760388) (not e!649099))))

(assert (=> b!1140660 (= res!760388 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24931))))

(declare-fun b!1140661 () Bool)

(declare-fun Unit!37322 () Unit!37319)

(assert (=> b!1140661 (= e!649107 Unit!37322)))

(assert (=> b!1140661 (= lt!507560 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1140661 (= c!112078 (and (not lt!507560) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!507554 () Unit!37319)

(assert (=> b!1140661 (= lt!507554 e!649105)))

(declare-fun lt!507549 () Unit!37319)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!373 (array!74143 array!74145 (_ BitVec 32) (_ BitVec 32) V!43289 V!43289 (_ BitVec 64) (_ BitVec 32) Int) Unit!37319)

(assert (=> b!1140661 (= lt!507549 (lemmaListMapContainsThenArrayContainsFrom!373 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112080 () Bool)

(assert (=> b!1140661 (= c!112080 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!760385 () Bool)

(assert (=> b!1140661 (= res!760385 e!649102)))

(declare-fun e!649108 () Bool)

(assert (=> b!1140661 (=> (not res!760385) (not e!649108))))

(assert (=> b!1140661 e!649108))

(declare-fun lt!507562 () Unit!37319)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74143 (_ BitVec 32) (_ BitVec 32)) Unit!37319)

(assert (=> b!1140661 (= lt!507562 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1140661 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24931)))

(declare-fun lt!507553 () Unit!37319)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74143 (_ BitVec 64) (_ BitVec 32) List!24934) Unit!37319)

(assert (=> b!1140661 (= lt!507553 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24931))))

(assert (=> b!1140661 false))

(declare-fun bm!50698 () Bool)

(declare-fun call!50700 () Unit!37319)

(assert (=> bm!50698 (= call!50700 call!50702)))

(declare-fun res!760387 () Bool)

(assert (=> start!98722 (=> (not res!760387) (not e!649099))))

(assert (=> start!98722 (= res!760387 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36253 _keys!1208))))))

(assert (=> start!98722 e!649099))

(declare-fun tp_is_empty!28621 () Bool)

(assert (=> start!98722 tp_is_empty!28621))

(declare-fun array_inv!27426 (array!74143) Bool)

(assert (=> start!98722 (array_inv!27426 _keys!1208)))

(assert (=> start!98722 true))

(assert (=> start!98722 tp!84983))

(declare-fun e!649098 () Bool)

(declare-fun array_inv!27427 (array!74145) Bool)

(assert (=> start!98722 (and (array_inv!27427 _values!996) e!649098)))

(declare-fun b!1140662 () Bool)

(assert (=> b!1140662 (= e!649097 tp_is_empty!28621)))

(declare-fun b!1140663 () Bool)

(assert (=> b!1140663 (contains!6637 call!50699 k0!934)))

(declare-fun lt!507558 () Unit!37319)

(assert (=> b!1140663 (= lt!507558 call!50702)))

(declare-fun call!50705 () Bool)

(assert (=> b!1140663 call!50705))

(assert (=> b!1140663 (= lt!507555 (+!3539 lt!507543 (tuple2!18173 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!507546 () Unit!37319)

(assert (=> b!1140663 (= lt!507546 (addStillContains!767 lt!507543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1140663 (= e!649105 lt!507558)))

(declare-fun b!1140664 () Bool)

(declare-fun e!649110 () Bool)

(assert (=> b!1140664 (= e!649098 (and e!649110 mapRes!44756))))

(declare-fun condMapEmpty!44756 () Bool)

(declare-fun mapDefault!44756 () ValueCell!13601)

(assert (=> b!1140664 (= condMapEmpty!44756 (= (arr!35717 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13601)) mapDefault!44756)))))

(declare-fun b!1140665 () Bool)

(declare-fun Unit!37323 () Unit!37319)

(assert (=> b!1140665 (= e!649106 Unit!37323)))

(declare-fun bm!50699 () Bool)

(assert (=> bm!50699 (= call!50705 (contains!6637 (ite c!112078 lt!507555 call!50701) k0!934))))

(declare-fun b!1140666 () Bool)

(declare-fun e!649103 () Bool)

(assert (=> b!1140666 (= e!649103 e!649109)))

(declare-fun res!760391 () Bool)

(assert (=> b!1140666 (=> res!760391 e!649109)))

(assert (=> b!1140666 (= res!760391 (not (= from!1455 i!673)))))

(declare-fun lt!507561 () array!74145)

(declare-fun lt!507556 () ListLongMap!16149)

(assert (=> b!1140666 (= lt!507556 (getCurrentListMapNoExtraKeys!4598 lt!507545 lt!507561 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1140666 (= lt!507561 (array!74146 (store (arr!35717 _values!996) i!673 (ValueCellFull!13601 lt!507544)) (size!36254 _values!996)))))

(declare-fun dynLambda!2644 (Int (_ BitVec 64)) V!43289)

(assert (=> b!1140666 (= lt!507544 (dynLambda!2644 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!507551 () ListLongMap!16149)

(assert (=> b!1140666 (= lt!507551 (getCurrentListMapNoExtraKeys!4598 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!50700 () Bool)

(assert (=> bm!50700 (= call!50703 (getCurrentListMapNoExtraKeys!4598 lt!507545 lt!507561 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140667 () Bool)

(declare-fun call!50704 () Bool)

(assert (=> b!1140667 call!50704))

(declare-fun lt!507547 () Unit!37319)

(assert (=> b!1140667 (= lt!507547 call!50700)))

(assert (=> b!1140667 (= e!649106 lt!507547)))

(declare-fun b!1140668 () Bool)

(assert (=> b!1140668 (= e!649108 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1140669 () Bool)

(assert (=> b!1140669 (= e!649101 (= call!50703 call!50706))))

(declare-fun b!1140670 () Bool)

(declare-fun lt!507557 () Unit!37319)

(assert (=> b!1140670 (= e!649096 lt!507557)))

(assert (=> b!1140670 (= lt!507557 call!50700)))

(assert (=> b!1140670 call!50704))

(declare-fun bm!50701 () Bool)

(assert (=> bm!50701 (= call!50704 call!50705)))

(declare-fun b!1140671 () Bool)

(assert (=> b!1140671 (= e!649110 tp_is_empty!28621)))

(declare-fun b!1140672 () Bool)

(assert (=> b!1140672 (= e!649099 e!649104)))

(declare-fun res!760390 () Bool)

(assert (=> b!1140672 (=> (not res!760390) (not e!649104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74143 (_ BitVec 32)) Bool)

(assert (=> b!1140672 (= res!760390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!507545 mask!1564))))

(assert (=> b!1140672 (= lt!507545 (array!74144 (store (arr!35716 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36253 _keys!1208)))))

(declare-fun bm!50702 () Bool)

(assert (=> bm!50702 (= call!50706 (getCurrentListMapNoExtraKeys!4598 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1140673 () Bool)

(declare-fun res!760386 () Bool)

(assert (=> b!1140673 (=> (not res!760386) (not e!649099))))

(assert (=> b!1140673 (= res!760386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!50703 () Bool)

(assert (=> bm!50703 (= call!50699 (+!3539 (ite c!112078 lt!507555 lt!507543) (ite c!112078 (tuple2!18173 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112076 (tuple2!18173 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18173 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1140674 () Bool)

(assert (=> b!1140674 (= e!649104 (not e!649103))))

(declare-fun res!760394 () Bool)

(assert (=> b!1140674 (=> res!760394 e!649103)))

(assert (=> b!1140674 (= res!760394 (bvsgt from!1455 i!673))))

(assert (=> b!1140674 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!507542 () Unit!37319)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74143 (_ BitVec 64) (_ BitVec 32)) Unit!37319)

(assert (=> b!1140674 (= lt!507542 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1140675 () Bool)

(declare-fun res!760384 () Bool)

(assert (=> b!1140675 (=> (not res!760384) (not e!649099))))

(assert (=> b!1140675 (= res!760384 (= (select (arr!35716 _keys!1208) i!673) k0!934))))

(assert (= (and start!98722 res!760387) b!1140651))

(assert (= (and b!1140651 res!760389) b!1140648))

(assert (= (and b!1140648 res!760383) b!1140673))

(assert (= (and b!1140673 res!760386) b!1140660))

(assert (= (and b!1140660 res!760388) b!1140655))

(assert (= (and b!1140655 res!760393) b!1140654))

(assert (= (and b!1140654 res!760392) b!1140675))

(assert (= (and b!1140675 res!760384) b!1140672))

(assert (= (and b!1140672 res!760390) b!1140649))

(assert (= (and b!1140649 res!760382) b!1140674))

(assert (= (and b!1140674 (not res!760394)) b!1140666))

(assert (= (and b!1140666 (not res!760391)) b!1140659))

(assert (= (and b!1140659 c!112079) b!1140657))

(assert (= (and b!1140659 (not c!112079)) b!1140669))

(assert (= (or b!1140657 b!1140669) bm!50700))

(assert (= (or b!1140657 b!1140669) bm!50702))

(assert (= (and b!1140659 (not res!760395)) b!1140658))

(assert (= (and b!1140658 c!112077) b!1140661))

(assert (= (and b!1140658 (not c!112077)) b!1140653))

(assert (= (and b!1140661 c!112078) b!1140663))

(assert (= (and b!1140661 (not c!112078)) b!1140652))

(assert (= (and b!1140652 c!112076) b!1140670))

(assert (= (and b!1140652 (not c!112076)) b!1140650))

(assert (= (and b!1140650 c!112075) b!1140667))

(assert (= (and b!1140650 (not c!112075)) b!1140665))

(assert (= (or b!1140670 b!1140667) bm!50698))

(assert (= (or b!1140670 b!1140667) bm!50697))

(assert (= (or b!1140670 b!1140667) bm!50701))

(assert (= (or b!1140663 bm!50701) bm!50699))

(assert (= (or b!1140663 bm!50698) bm!50696))

(assert (= (or b!1140663 bm!50697) bm!50703))

(assert (= (and b!1140661 c!112080) b!1140656))

(assert (= (and b!1140661 (not c!112080)) b!1140647))

(assert (= (and b!1140661 res!760385) b!1140668))

(assert (= (and b!1140664 condMapEmpty!44756) mapIsEmpty!44756))

(assert (= (and b!1140664 (not condMapEmpty!44756)) mapNonEmpty!44756))

(get-info :version)

(assert (= (and mapNonEmpty!44756 ((_ is ValueCellFull!13601) mapValue!44756)) b!1140662))

(assert (= (and b!1140664 ((_ is ValueCellFull!13601) mapDefault!44756)) b!1140671))

(assert (= start!98722 b!1140664))

(declare-fun b_lambda!19191 () Bool)

(assert (=> (not b_lambda!19191) (not b!1140666)))

(declare-fun t!36008 () Bool)

(declare-fun tb!8895 () Bool)

(assert (=> (and start!98722 (= defaultEntry!1004 defaultEntry!1004) t!36008) tb!8895))

(declare-fun result!18363 () Bool)

(assert (=> tb!8895 (= result!18363 tp_is_empty!28621)))

(assert (=> b!1140666 t!36008))

(declare-fun b_and!39035 () Bool)

(assert (= b_and!39033 (and (=> t!36008 result!18363) b_and!39035)))

(declare-fun m!1052577 () Bool)

(assert (=> b!1140668 m!1052577))

(declare-fun m!1052579 () Bool)

(assert (=> bm!50700 m!1052579))

(declare-fun m!1052581 () Bool)

(assert (=> bm!50703 m!1052581))

(declare-fun m!1052583 () Bool)

(assert (=> mapNonEmpty!44756 m!1052583))

(declare-fun m!1052585 () Bool)

(assert (=> b!1140651 m!1052585))

(declare-fun m!1052587 () Bool)

(assert (=> b!1140666 m!1052587))

(declare-fun m!1052589 () Bool)

(assert (=> b!1140666 m!1052589))

(declare-fun m!1052591 () Bool)

(assert (=> b!1140666 m!1052591))

(declare-fun m!1052593 () Bool)

(assert (=> b!1140666 m!1052593))

(assert (=> b!1140656 m!1052577))

(declare-fun m!1052595 () Bool)

(assert (=> b!1140663 m!1052595))

(declare-fun m!1052597 () Bool)

(assert (=> b!1140663 m!1052597))

(declare-fun m!1052599 () Bool)

(assert (=> b!1140663 m!1052599))

(declare-fun m!1052601 () Bool)

(assert (=> b!1140654 m!1052601))

(declare-fun m!1052603 () Bool)

(assert (=> start!98722 m!1052603))

(declare-fun m!1052605 () Bool)

(assert (=> start!98722 m!1052605))

(declare-fun m!1052607 () Bool)

(assert (=> b!1140657 m!1052607))

(declare-fun m!1052609 () Bool)

(assert (=> b!1140674 m!1052609))

(declare-fun m!1052611 () Bool)

(assert (=> b!1140674 m!1052611))

(declare-fun m!1052613 () Bool)

(assert (=> bm!50696 m!1052613))

(declare-fun m!1052615 () Bool)

(assert (=> b!1140673 m!1052615))

(declare-fun m!1052617 () Bool)

(assert (=> b!1140658 m!1052617))

(declare-fun m!1052619 () Bool)

(assert (=> b!1140658 m!1052619))

(declare-fun m!1052621 () Bool)

(assert (=> b!1140658 m!1052621))

(declare-fun m!1052623 () Bool)

(assert (=> b!1140658 m!1052623))

(declare-fun m!1052625 () Bool)

(assert (=> b!1140658 m!1052625))

(assert (=> b!1140658 m!1052621))

(assert (=> b!1140658 m!1052623))

(declare-fun m!1052627 () Bool)

(assert (=> b!1140658 m!1052627))

(assert (=> b!1140658 m!1052619))

(declare-fun m!1052629 () Bool)

(assert (=> b!1140658 m!1052629))

(assert (=> b!1140658 m!1052623))

(declare-fun m!1052631 () Bool)

(assert (=> b!1140658 m!1052631))

(assert (=> bm!50702 m!1052617))

(declare-fun m!1052633 () Bool)

(assert (=> bm!50699 m!1052633))

(declare-fun m!1052635 () Bool)

(assert (=> b!1140649 m!1052635))

(assert (=> b!1140659 m!1052623))

(declare-fun m!1052637 () Bool)

(assert (=> b!1140659 m!1052637))

(declare-fun m!1052639 () Bool)

(assert (=> b!1140660 m!1052639))

(declare-fun m!1052641 () Bool)

(assert (=> b!1140675 m!1052641))

(declare-fun m!1052643 () Bool)

(assert (=> b!1140661 m!1052643))

(declare-fun m!1052645 () Bool)

(assert (=> b!1140661 m!1052645))

(declare-fun m!1052647 () Bool)

(assert (=> b!1140661 m!1052647))

(declare-fun m!1052649 () Bool)

(assert (=> b!1140661 m!1052649))

(declare-fun m!1052651 () Bool)

(assert (=> b!1140672 m!1052651))

(declare-fun m!1052653 () Bool)

(assert (=> b!1140672 m!1052653))

(check-sat (not mapNonEmpty!44756) (not b!1140666) (not b_lambda!19191) (not b!1140651) (not bm!50703) (not b!1140668) (not b!1140658) (not b!1140660) (not start!98722) (not b!1140663) (not b_next!24091) (not b!1140659) (not b!1140656) (not b!1140674) (not bm!50696) (not bm!50699) tp_is_empty!28621 b_and!39035 (not b!1140672) (not b!1140654) (not b!1140657) (not b!1140673) (not b!1140661) (not b!1140649) (not bm!50702) (not bm!50700))
(check-sat b_and!39035 (not b_next!24091))
