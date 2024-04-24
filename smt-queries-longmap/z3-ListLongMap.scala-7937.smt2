; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98698 () Bool)

(assert start!98698)

(declare-fun b_free!24067 () Bool)

(declare-fun b_next!24067 () Bool)

(assert (=> start!98698 (= b_free!24067 (not b_next!24067))))

(declare-fun tp!84911 () Bool)

(declare-fun b_and!38985 () Bool)

(assert (=> start!98698 (= tp!84911 b_and!38985)))

(declare-fun b!1139579 () Bool)

(declare-datatypes ((V!43257 0))(
  ( (V!43258 (val!14355 Int)) )
))
(declare-datatypes ((tuple2!18148 0))(
  ( (tuple2!18149 (_1!9085 (_ BitVec 64)) (_2!9085 V!43257)) )
))
(declare-datatypes ((List!24912 0))(
  ( (Nil!24909) (Cons!24908 (h!26126 tuple2!18148) (t!35963 List!24912)) )
))
(declare-datatypes ((ListLongMap!16125 0))(
  ( (ListLongMap!16126 (toList!8078 List!24912)) )
))
(declare-fun call!50414 () ListLongMap!16125)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6628 (ListLongMap!16125 (_ BitVec 64)) Bool)

(assert (=> b!1139579 (contains!6628 call!50414 k0!934)))

(declare-fun lt!506892 () ListLongMap!16125)

(declare-fun minValue!944 () V!43257)

(declare-datatypes ((Unit!37273 0))(
  ( (Unit!37274) )
))
(declare-fun lt!506891 () Unit!37273)

(declare-fun addStillContains!757 (ListLongMap!16125 (_ BitVec 64) V!43257 (_ BitVec 64)) Unit!37273)

(assert (=> b!1139579 (= lt!506891 (addStillContains!757 lt!506892 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(declare-fun call!50411 () Bool)

(assert (=> b!1139579 call!50411))

(declare-fun lt!506885 () ListLongMap!16125)

(declare-fun zeroValue!944 () V!43257)

(declare-fun +!3530 (ListLongMap!16125 tuple2!18148) ListLongMap!16125)

(assert (=> b!1139579 (= lt!506892 (+!3530 lt!506885 (tuple2!18149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!506896 () Unit!37273)

(declare-fun call!50412 () Unit!37273)

(assert (=> b!1139579 (= lt!506896 call!50412)))

(declare-fun e!648521 () Unit!37273)

(assert (=> b!1139579 (= e!648521 lt!506891)))

(declare-fun b!1139580 () Bool)

(declare-fun res!759882 () Bool)

(declare-fun e!648530 () Bool)

(assert (=> b!1139580 (=> (not res!759882) (not e!648530))))

(declare-datatypes ((array!74095 0))(
  ( (array!74096 (arr!35692 (Array (_ BitVec 32) (_ BitVec 64))) (size!36229 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74095)

(declare-datatypes ((List!24913 0))(
  ( (Nil!24910) (Cons!24909 (h!26127 (_ BitVec 64)) (t!35964 List!24913)) )
))
(declare-fun arrayNoDuplicates!0 (array!74095 (_ BitVec 32) List!24913) Bool)

(assert (=> b!1139580 (= res!759882 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24910))))

(declare-fun c!111859 () Bool)

(declare-fun bm!50408 () Bool)

(declare-fun c!111861 () Bool)

(assert (=> bm!50408 (= call!50414 (+!3530 (ite c!111859 lt!506892 lt!506885) (ite c!111859 (tuple2!18149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111861 (tuple2!18149 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18149 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun mapNonEmpty!44720 () Bool)

(declare-fun mapRes!44720 () Bool)

(declare-fun tp!84912 () Bool)

(declare-fun e!648527 () Bool)

(assert (=> mapNonEmpty!44720 (= mapRes!44720 (and tp!84912 e!648527))))

(declare-datatypes ((ValueCell!13589 0))(
  ( (ValueCellFull!13589 (v!16988 V!43257)) (EmptyCell!13589) )
))
(declare-fun mapValue!44720 () ValueCell!13589)

(declare-fun mapKey!44720 () (_ BitVec 32))

(declare-fun mapRest!44720 () (Array (_ BitVec 32) ValueCell!13589))

(declare-datatypes ((array!74097 0))(
  ( (array!74098 (arr!35693 (Array (_ BitVec 32) ValueCell!13589)) (size!36230 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74097)

(assert (=> mapNonEmpty!44720 (= (arr!35693 _values!996) (store mapRest!44720 mapKey!44720 mapValue!44720))))

(declare-fun lt!506884 () Bool)

(declare-fun e!648531 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun b!1139581 () Bool)

(assert (=> b!1139581 (= e!648531 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!506884) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1139582 () Bool)

(declare-fun e!648525 () Unit!37273)

(declare-fun Unit!37275 () Unit!37273)

(assert (=> b!1139582 (= e!648525 Unit!37275)))

(assert (=> b!1139582 (= lt!506884 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1139582 (= c!111859 (and (not lt!506884) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!506883 () Unit!37273)

(assert (=> b!1139582 (= lt!506883 e!648521)))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!506895 () Unit!37273)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!364 (array!74095 array!74097 (_ BitVec 32) (_ BitVec 32) V!43257 V!43257 (_ BitVec 64) (_ BitVec 32) Int) Unit!37273)

(assert (=> b!1139582 (= lt!506895 (lemmaListMapContainsThenArrayContainsFrom!364 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!111863 () Bool)

(assert (=> b!1139582 (= c!111863 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!759886 () Bool)

(assert (=> b!1139582 (= res!759886 e!648531)))

(declare-fun e!648533 () Bool)

(assert (=> b!1139582 (=> (not res!759886) (not e!648533))))

(assert (=> b!1139582 e!648533))

(declare-fun lt!506889 () Unit!37273)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74095 (_ BitVec 32) (_ BitVec 32)) Unit!37273)

(assert (=> b!1139582 (= lt!506889 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1139582 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24910)))

(declare-fun lt!506879 () Unit!37273)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74095 (_ BitVec 64) (_ BitVec 32) List!24913) Unit!37273)

(assert (=> b!1139582 (= lt!506879 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24910))))

(assert (=> b!1139582 false))

(declare-fun b!1139583 () Bool)

(declare-fun arrayContainsKey!0 (array!74095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1139583 (= e!648533 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!50409 () Bool)

(declare-fun call!50413 () Unit!37273)

(assert (=> bm!50409 (= call!50413 call!50412)))

(declare-fun b!1139584 () Bool)

(declare-fun res!759881 () Bool)

(assert (=> b!1139584 (=> (not res!759881) (not e!648530))))

(assert (=> b!1139584 (= res!759881 (and (= (size!36230 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36229 _keys!1208) (size!36230 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1139585 () Bool)

(declare-fun e!648535 () Bool)

(declare-fun e!648529 () Bool)

(assert (=> b!1139585 (= e!648535 (not e!648529))))

(declare-fun res!759880 () Bool)

(assert (=> b!1139585 (=> res!759880 e!648529)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1139585 (= res!759880 (bvsgt from!1455 i!673))))

(assert (=> b!1139585 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!506893 () Unit!37273)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74095 (_ BitVec 64) (_ BitVec 32)) Unit!37273)

(assert (=> b!1139585 (= lt!506893 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1139586 () Bool)

(declare-fun res!759879 () Bool)

(assert (=> b!1139586 (=> (not res!759879) (not e!648530))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1139586 (= res!759879 (validKeyInArray!0 k0!934))))

(declare-fun b!1139587 () Bool)

(declare-fun e!648528 () Bool)

(assert (=> b!1139587 (= e!648529 e!648528)))

(declare-fun res!759890 () Bool)

(assert (=> b!1139587 (=> res!759890 e!648528)))

(assert (=> b!1139587 (= res!759890 (not (= from!1455 i!673)))))

(declare-fun lt!506890 () array!74097)

(declare-fun lt!506880 () array!74095)

(declare-fun lt!506881 () ListLongMap!16125)

(declare-fun getCurrentListMapNoExtraKeys!4588 (array!74095 array!74097 (_ BitVec 32) (_ BitVec 32) V!43257 V!43257 (_ BitVec 32) Int) ListLongMap!16125)

(assert (=> b!1139587 (= lt!506881 (getCurrentListMapNoExtraKeys!4588 lt!506880 lt!506890 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2635 (Int (_ BitVec 64)) V!43257)

(assert (=> b!1139587 (= lt!506890 (array!74098 (store (arr!35693 _values!996) i!673 (ValueCellFull!13589 (dynLambda!2635 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36230 _values!996)))))

(declare-fun lt!506888 () ListLongMap!16125)

(assert (=> b!1139587 (= lt!506888 (getCurrentListMapNoExtraKeys!4588 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1139588 () Bool)

(declare-fun e!648532 () Unit!37273)

(declare-fun lt!506886 () Unit!37273)

(assert (=> b!1139588 (= e!648532 lt!506886)))

(assert (=> b!1139588 (= lt!506886 call!50413)))

(declare-fun call!50418 () Bool)

(assert (=> b!1139588 call!50418))

(declare-fun b!1139589 () Bool)

(declare-fun e!648526 () Unit!37273)

(declare-fun Unit!37276 () Unit!37273)

(assert (=> b!1139589 (= e!648526 Unit!37276)))

(declare-fun b!1139590 () Bool)

(assert (=> b!1139590 (= e!648530 e!648535)))

(declare-fun res!759889 () Bool)

(assert (=> b!1139590 (=> (not res!759889) (not e!648535))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74095 (_ BitVec 32)) Bool)

(assert (=> b!1139590 (= res!759889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!506880 mask!1564))))

(assert (=> b!1139590 (= lt!506880 (array!74096 (store (arr!35692 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36229 _keys!1208)))))

(declare-fun b!1139591 () Bool)

(declare-fun tp_is_empty!28597 () Bool)

(assert (=> b!1139591 (= e!648527 tp_is_empty!28597)))

(declare-fun b!1139592 () Bool)

(declare-fun res!759887 () Bool)

(assert (=> b!1139592 (=> (not res!759887) (not e!648530))))

(assert (=> b!1139592 (= res!759887 (= (select (arr!35692 _keys!1208) i!673) k0!934))))

(declare-fun b!1139593 () Bool)

(declare-fun e!648523 () Bool)

(assert (=> b!1139593 (= e!648523 true)))

(declare-fun lt!506882 () Unit!37273)

(assert (=> b!1139593 (= lt!506882 e!648525)))

(declare-fun c!111864 () Bool)

(assert (=> b!1139593 (= c!111864 (contains!6628 lt!506885 k0!934))))

(assert (=> b!1139593 (= lt!506885 (getCurrentListMapNoExtraKeys!4588 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139594 () Bool)

(declare-fun res!759891 () Bool)

(assert (=> b!1139594 (=> (not res!759891) (not e!648530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1139594 (= res!759891 (validMask!0 mask!1564))))

(declare-fun res!759888 () Bool)

(assert (=> start!98698 (=> (not res!759888) (not e!648530))))

(assert (=> start!98698 (= res!759888 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36229 _keys!1208))))))

(assert (=> start!98698 e!648530))

(assert (=> start!98698 tp_is_empty!28597))

(declare-fun array_inv!27410 (array!74095) Bool)

(assert (=> start!98698 (array_inv!27410 _keys!1208)))

(assert (=> start!98698 true))

(assert (=> start!98698 tp!84911))

(declare-fun e!648534 () Bool)

(declare-fun array_inv!27411 (array!74097) Bool)

(assert (=> start!98698 (and (array_inv!27411 _values!996) e!648534)))

(declare-fun b!1139595 () Bool)

(declare-fun e!648522 () Bool)

(assert (=> b!1139595 (= e!648522 tp_is_empty!28597)))

(declare-fun bm!50410 () Bool)

(assert (=> bm!50410 (= call!50418 call!50411)))

(declare-fun b!1139596 () Bool)

(assert (=> b!1139596 (= e!648532 e!648526)))

(declare-fun c!111860 () Bool)

(assert (=> b!1139596 (= c!111860 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!506884))))

(declare-fun b!1139597 () Bool)

(assert (=> b!1139597 (= c!111861 (and (not lt!506884) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1139597 (= e!648521 e!648532)))

(declare-fun b!1139598 () Bool)

(declare-fun res!759885 () Bool)

(assert (=> b!1139598 (=> (not res!759885) (not e!648530))))

(assert (=> b!1139598 (= res!759885 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36229 _keys!1208))))))

(declare-fun call!50417 () ListLongMap!16125)

(declare-fun bm!50411 () Bool)

(assert (=> bm!50411 (= call!50411 (contains!6628 (ite c!111859 lt!506892 call!50417) k0!934))))

(declare-fun call!50416 () ListLongMap!16125)

(declare-fun e!648520 () Bool)

(declare-fun b!1139599 () Bool)

(declare-fun call!50415 () ListLongMap!16125)

(declare-fun -!1215 (ListLongMap!16125 (_ BitVec 64)) ListLongMap!16125)

(assert (=> b!1139599 (= e!648520 (= call!50415 (-!1215 call!50416 k0!934)))))

(declare-fun b!1139600 () Bool)

(assert (=> b!1139600 call!50418))

(declare-fun lt!506887 () Unit!37273)

(assert (=> b!1139600 (= lt!506887 call!50413)))

(assert (=> b!1139600 (= e!648526 lt!506887)))

(declare-fun bm!50412 () Bool)

(assert (=> bm!50412 (= call!50416 (getCurrentListMapNoExtraKeys!4588 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!50413 () Bool)

(assert (=> bm!50413 (= call!50417 call!50414)))

(declare-fun b!1139601 () Bool)

(assert (=> b!1139601 (= e!648534 (and e!648522 mapRes!44720))))

(declare-fun condMapEmpty!44720 () Bool)

(declare-fun mapDefault!44720 () ValueCell!13589)

(assert (=> b!1139601 (= condMapEmpty!44720 (= (arr!35693 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13589)) mapDefault!44720)))))

(declare-fun b!1139602 () Bool)

(assert (=> b!1139602 (= e!648531 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1139603 () Bool)

(declare-fun res!759878 () Bool)

(assert (=> b!1139603 (=> (not res!759878) (not e!648535))))

(assert (=> b!1139603 (= res!759878 (arrayNoDuplicates!0 lt!506880 #b00000000000000000000000000000000 Nil!24910))))

(declare-fun b!1139604 () Bool)

(assert (=> b!1139604 (= e!648520 (= call!50415 call!50416))))

(declare-fun b!1139605 () Bool)

(declare-fun Unit!37277 () Unit!37273)

(assert (=> b!1139605 (= e!648525 Unit!37277)))

(declare-fun bm!50414 () Bool)

(assert (=> bm!50414 (= call!50412 (addStillContains!757 lt!506885 (ite (or c!111859 c!111861) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!111859 c!111861) zeroValue!944 minValue!944) k0!934))))

(declare-fun mapIsEmpty!44720 () Bool)

(assert (=> mapIsEmpty!44720 mapRes!44720))

(declare-fun b!1139606 () Bool)

(assert (=> b!1139606 (= e!648528 e!648523)))

(declare-fun res!759884 () Bool)

(assert (=> b!1139606 (=> res!759884 e!648523)))

(assert (=> b!1139606 (= res!759884 (not (= (select (arr!35692 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1139606 e!648520))

(declare-fun c!111862 () Bool)

(assert (=> b!1139606 (= c!111862 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!506894 () Unit!37273)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!474 (array!74095 array!74097 (_ BitVec 32) (_ BitVec 32) V!43257 V!43257 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37273)

(assert (=> b!1139606 (= lt!506894 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!474 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!50415 () Bool)

(assert (=> bm!50415 (= call!50415 (getCurrentListMapNoExtraKeys!4588 lt!506880 lt!506890 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1139607 () Bool)

(declare-fun res!759883 () Bool)

(assert (=> b!1139607 (=> (not res!759883) (not e!648530))))

(assert (=> b!1139607 (= res!759883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!98698 res!759888) b!1139594))

(assert (= (and b!1139594 res!759891) b!1139584))

(assert (= (and b!1139584 res!759881) b!1139607))

(assert (= (and b!1139607 res!759883) b!1139580))

(assert (= (and b!1139580 res!759882) b!1139598))

(assert (= (and b!1139598 res!759885) b!1139586))

(assert (= (and b!1139586 res!759879) b!1139592))

(assert (= (and b!1139592 res!759887) b!1139590))

(assert (= (and b!1139590 res!759889) b!1139603))

(assert (= (and b!1139603 res!759878) b!1139585))

(assert (= (and b!1139585 (not res!759880)) b!1139587))

(assert (= (and b!1139587 (not res!759890)) b!1139606))

(assert (= (and b!1139606 c!111862) b!1139599))

(assert (= (and b!1139606 (not c!111862)) b!1139604))

(assert (= (or b!1139599 b!1139604) bm!50415))

(assert (= (or b!1139599 b!1139604) bm!50412))

(assert (= (and b!1139606 (not res!759884)) b!1139593))

(assert (= (and b!1139593 c!111864) b!1139582))

(assert (= (and b!1139593 (not c!111864)) b!1139605))

(assert (= (and b!1139582 c!111859) b!1139579))

(assert (= (and b!1139582 (not c!111859)) b!1139597))

(assert (= (and b!1139597 c!111861) b!1139588))

(assert (= (and b!1139597 (not c!111861)) b!1139596))

(assert (= (and b!1139596 c!111860) b!1139600))

(assert (= (and b!1139596 (not c!111860)) b!1139589))

(assert (= (or b!1139588 b!1139600) bm!50409))

(assert (= (or b!1139588 b!1139600) bm!50413))

(assert (= (or b!1139588 b!1139600) bm!50410))

(assert (= (or b!1139579 bm!50410) bm!50411))

(assert (= (or b!1139579 bm!50409) bm!50414))

(assert (= (or b!1139579 bm!50413) bm!50408))

(assert (= (and b!1139582 c!111863) b!1139602))

(assert (= (and b!1139582 (not c!111863)) b!1139581))

(assert (= (and b!1139582 res!759886) b!1139583))

(assert (= (and b!1139601 condMapEmpty!44720) mapIsEmpty!44720))

(assert (= (and b!1139601 (not condMapEmpty!44720)) mapNonEmpty!44720))

(get-info :version)

(assert (= (and mapNonEmpty!44720 ((_ is ValueCellFull!13589) mapValue!44720)) b!1139591))

(assert (= (and b!1139601 ((_ is ValueCellFull!13589) mapDefault!44720)) b!1139595))

(assert (= start!98698 b!1139601))

(declare-fun b_lambda!19167 () Bool)

(assert (=> (not b_lambda!19167) (not b!1139587)))

(declare-fun t!35962 () Bool)

(declare-fun tb!8871 () Bool)

(assert (=> (and start!98698 (= defaultEntry!1004 defaultEntry!1004) t!35962) tb!8871))

(declare-fun result!18315 () Bool)

(assert (=> tb!8871 (= result!18315 tp_is_empty!28597)))

(assert (=> b!1139587 t!35962))

(declare-fun b_and!38987 () Bool)

(assert (= b_and!38985 (and (=> t!35962 result!18315) b_and!38987)))

(declare-fun m!1051755 () Bool)

(assert (=> b!1139594 m!1051755))

(declare-fun m!1051757 () Bool)

(assert (=> b!1139587 m!1051757))

(declare-fun m!1051759 () Bool)

(assert (=> b!1139587 m!1051759))

(declare-fun m!1051761 () Bool)

(assert (=> b!1139587 m!1051761))

(declare-fun m!1051763 () Bool)

(assert (=> b!1139587 m!1051763))

(declare-fun m!1051765 () Bool)

(assert (=> b!1139599 m!1051765))

(declare-fun m!1051767 () Bool)

(assert (=> b!1139586 m!1051767))

(declare-fun m!1051769 () Bool)

(assert (=> bm!50412 m!1051769))

(declare-fun m!1051771 () Bool)

(assert (=> b!1139603 m!1051771))

(declare-fun m!1051773 () Bool)

(assert (=> b!1139607 m!1051773))

(declare-fun m!1051775 () Bool)

(assert (=> b!1139593 m!1051775))

(assert (=> b!1139593 m!1051769))

(declare-fun m!1051777 () Bool)

(assert (=> bm!50408 m!1051777))

(declare-fun m!1051779 () Bool)

(assert (=> b!1139583 m!1051779))

(declare-fun m!1051781 () Bool)

(assert (=> b!1139592 m!1051781))

(declare-fun m!1051783 () Bool)

(assert (=> b!1139580 m!1051783))

(declare-fun m!1051785 () Bool)

(assert (=> b!1139606 m!1051785))

(declare-fun m!1051787 () Bool)

(assert (=> b!1139606 m!1051787))

(declare-fun m!1051789 () Bool)

(assert (=> b!1139590 m!1051789))

(declare-fun m!1051791 () Bool)

(assert (=> b!1139590 m!1051791))

(declare-fun m!1051793 () Bool)

(assert (=> mapNonEmpty!44720 m!1051793))

(declare-fun m!1051795 () Bool)

(assert (=> bm!50415 m!1051795))

(declare-fun m!1051797 () Bool)

(assert (=> bm!50414 m!1051797))

(assert (=> b!1139602 m!1051779))

(declare-fun m!1051799 () Bool)

(assert (=> b!1139579 m!1051799))

(declare-fun m!1051801 () Bool)

(assert (=> b!1139579 m!1051801))

(declare-fun m!1051803 () Bool)

(assert (=> b!1139579 m!1051803))

(declare-fun m!1051805 () Bool)

(assert (=> bm!50411 m!1051805))

(declare-fun m!1051807 () Bool)

(assert (=> start!98698 m!1051807))

(declare-fun m!1051809 () Bool)

(assert (=> start!98698 m!1051809))

(declare-fun m!1051811 () Bool)

(assert (=> b!1139582 m!1051811))

(declare-fun m!1051813 () Bool)

(assert (=> b!1139582 m!1051813))

(declare-fun m!1051815 () Bool)

(assert (=> b!1139582 m!1051815))

(declare-fun m!1051817 () Bool)

(assert (=> b!1139582 m!1051817))

(declare-fun m!1051819 () Bool)

(assert (=> b!1139585 m!1051819))

(declare-fun m!1051821 () Bool)

(assert (=> b!1139585 m!1051821))

(check-sat (not b!1139603) (not b!1139585) (not bm!50415) (not bm!50414) (not b_lambda!19167) (not b!1139586) (not start!98698) (not b!1139590) b_and!38987 (not b!1139579) tp_is_empty!28597 (not b_next!24067) (not b!1139602) (not b!1139582) (not b!1139583) (not mapNonEmpty!44720) (not b!1139606) (not b!1139607) (not bm!50411) (not bm!50408) (not bm!50412) (not b!1139594) (not b!1139587) (not b!1139580) (not b!1139599) (not b!1139593))
(check-sat b_and!38987 (not b_next!24067))
