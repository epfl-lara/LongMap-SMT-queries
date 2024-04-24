; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98650 () Bool)

(assert start!98650)

(declare-fun b_free!24019 () Bool)

(declare-fun b_next!24019 () Bool)

(assert (=> start!98650 (= b_free!24019 (not b_next!24019))))

(declare-fun tp!84768 () Bool)

(declare-fun b_and!38889 () Bool)

(assert (=> start!98650 (= tp!84768 b_and!38889)))

(declare-fun b!1137411 () Bool)

(declare-fun e!647366 () Bool)

(declare-fun e!647355 () Bool)

(assert (=> b!1137411 (= e!647366 e!647355)))

(declare-fun res!758806 () Bool)

(assert (=> b!1137411 (=> (not res!758806) (not e!647355))))

(declare-datatypes ((array!73999 0))(
  ( (array!74000 (arr!35644 (Array (_ BitVec 32) (_ BitVec 64))) (size!36181 (_ BitVec 32))) )
))
(declare-fun lt!505605 () array!73999)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73999 (_ BitVec 32)) Bool)

(assert (=> b!1137411 (= res!758806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!505605 mask!1564))))

(declare-fun _keys!1208 () array!73999)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1137411 (= lt!505605 (array!74000 (store (arr!35644 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36181 _keys!1208)))))

(declare-fun b!1137412 () Bool)

(declare-datatypes ((Unit!37179 0))(
  ( (Unit!37180) )
))
(declare-fun e!647352 () Unit!37179)

(declare-fun lt!505600 () Unit!37179)

(assert (=> b!1137412 (= e!647352 lt!505600)))

(declare-fun call!49842 () Unit!37179)

(assert (=> b!1137412 (= lt!505600 call!49842)))

(declare-fun call!49840 () Bool)

(assert (=> b!1137412 call!49840))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1137413 () Bool)

(declare-fun e!647362 () Bool)

(declare-fun arrayContainsKey!0 (array!73999 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1137413 (= e!647362 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!49832 () Bool)

(declare-datatypes ((V!43193 0))(
  ( (V!43194 (val!14331 Int)) )
))
(declare-datatypes ((tuple2!18100 0))(
  ( (tuple2!18101 (_1!9061 (_ BitVec 64)) (_2!9061 V!43193)) )
))
(declare-datatypes ((List!24865 0))(
  ( (Nil!24862) (Cons!24861 (h!26079 tuple2!18100) (t!35868 List!24865)) )
))
(declare-datatypes ((ListLongMap!16077 0))(
  ( (ListLongMap!16078 (toList!8054 List!24865)) )
))
(declare-fun call!49836 () ListLongMap!16077)

(declare-fun call!49841 () ListLongMap!16077)

(assert (=> bm!49832 (= call!49836 call!49841)))

(declare-fun b!1137414 () Bool)

(declare-fun res!758823 () Bool)

(assert (=> b!1137414 (=> (not res!758823) (not e!647366))))

(assert (=> b!1137414 (= res!758823 (= (select (arr!35644 _keys!1208) i!673) k0!934))))

(declare-fun lt!505614 () ListLongMap!16077)

(declare-fun c!111444 () Bool)

(declare-fun bm!49833 () Bool)

(declare-fun call!49837 () Bool)

(declare-fun contains!6601 (ListLongMap!16077 (_ BitVec 64)) Bool)

(assert (=> bm!49833 (= call!49837 (contains!6601 (ite c!111444 lt!505614 call!49836) k0!934))))

(declare-fun zeroValue!944 () V!43193)

(declare-fun lt!505611 () ListLongMap!16077)

(declare-fun c!111443 () Bool)

(declare-fun bm!49834 () Bool)

(declare-fun call!49839 () Unit!37179)

(declare-fun minValue!944 () V!43193)

(declare-fun addStillContains!735 (ListLongMap!16077 (_ BitVec 64) V!43193 (_ BitVec 64)) Unit!37179)

(assert (=> bm!49834 (= call!49839 (addStillContains!735 (ite c!111444 lt!505614 lt!505611) (ite c!111444 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!111443 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!111444 minValue!944 (ite c!111443 zeroValue!944 minValue!944)) k0!934))))

(declare-fun b!1137415 () Bool)

(declare-fun e!647367 () Bool)

(assert (=> b!1137415 (= e!647367 true)))

(declare-fun lt!505608 () Bool)

(declare-datatypes ((List!24866 0))(
  ( (Nil!24863) (Cons!24862 (h!26080 (_ BitVec 64)) (t!35869 List!24866)) )
))
(declare-fun contains!6602 (List!24866 (_ BitVec 64)) Bool)

(assert (=> b!1137415 (= lt!505608 (contains!6602 Nil!24863 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1137416 () Bool)

(declare-fun e!647364 () Bool)

(assert (=> b!1137416 (= e!647355 (not e!647364))))

(declare-fun res!758822 () Bool)

(assert (=> b!1137416 (=> res!758822 e!647364)))

(assert (=> b!1137416 (= res!758822 (bvsgt from!1455 i!673))))

(assert (=> b!1137416 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!505601 () Unit!37179)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73999 (_ BitVec 64) (_ BitVec 32)) Unit!37179)

(assert (=> b!1137416 (= lt!505601 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1137417 () Bool)

(declare-fun res!758813 () Bool)

(assert (=> b!1137417 (=> (not res!758813) (not e!647366))))

(assert (=> b!1137417 (= res!758813 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36181 _keys!1208))))))

(declare-fun b!1137418 () Bool)

(declare-fun res!758809 () Bool)

(assert (=> b!1137418 (=> (not res!758809) (not e!647355))))

(declare-fun arrayNoDuplicates!0 (array!73999 (_ BitVec 32) List!24866) Bool)

(assert (=> b!1137418 (= res!758809 (arrayNoDuplicates!0 lt!505605 #b00000000000000000000000000000000 Nil!24863))))

(declare-fun b!1137420 () Bool)

(declare-fun c!111447 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!505607 () Bool)

(assert (=> b!1137420 (= c!111447 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!505607))))

(declare-fun e!647363 () Unit!37179)

(assert (=> b!1137420 (= e!647363 e!647352)))

(declare-fun bm!49835 () Bool)

(assert (=> bm!49835 (= call!49840 call!49837)))

(declare-fun b!1137421 () Bool)

(declare-fun res!758808 () Bool)

(assert (=> b!1137421 (=> res!758808 e!647367)))

(assert (=> b!1137421 (= res!758808 (contains!6602 Nil!24863 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!49836 () Bool)

(declare-fun call!49835 () ListLongMap!16077)

(declare-datatypes ((ValueCell!13565 0))(
  ( (ValueCellFull!13565 (v!16964 V!43193)) (EmptyCell!13565) )
))
(declare-datatypes ((array!74001 0))(
  ( (array!74002 (arr!35645 (Array (_ BitVec 32) ValueCell!13565)) (size!36182 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74001)

(declare-fun getCurrentListMapNoExtraKeys!4565 (array!73999 array!74001 (_ BitVec 32) (_ BitVec 32) V!43193 V!43193 (_ BitVec 32) Int) ListLongMap!16077)

(assert (=> bm!49836 (= call!49835 (getCurrentListMapNoExtraKeys!4565 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!49837 () Bool)

(assert (=> bm!49837 (= call!49842 call!49839)))

(declare-fun b!1137422 () Bool)

(assert (=> b!1137422 call!49840))

(declare-fun lt!505606 () Unit!37179)

(assert (=> b!1137422 (= lt!505606 call!49842)))

(assert (=> b!1137422 (= e!647363 lt!505606)))

(declare-fun b!1137423 () Bool)

(declare-fun e!647354 () Bool)

(assert (=> b!1137423 (= e!647354 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!505607) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1137424 () Bool)

(declare-fun e!647358 () Bool)

(declare-fun call!49838 () ListLongMap!16077)

(assert (=> b!1137424 (= e!647358 (= call!49838 call!49835))))

(declare-fun mapIsEmpty!44648 () Bool)

(declare-fun mapRes!44648 () Bool)

(assert (=> mapIsEmpty!44648 mapRes!44648))

(declare-fun b!1137425 () Bool)

(declare-fun Unit!37181 () Unit!37179)

(assert (=> b!1137425 (= e!647352 Unit!37181)))

(declare-fun b!1137426 () Bool)

(declare-fun res!758811 () Bool)

(assert (=> b!1137426 (=> (not res!758811) (not e!647366))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1137426 (= res!758811 (validMask!0 mask!1564))))

(declare-fun lt!505610 () array!74001)

(declare-fun bm!49838 () Bool)

(assert (=> bm!49838 (= call!49838 (getCurrentListMapNoExtraKeys!4565 lt!505605 lt!505610 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44648 () Bool)

(declare-fun tp!84767 () Bool)

(declare-fun e!647361 () Bool)

(assert (=> mapNonEmpty!44648 (= mapRes!44648 (and tp!84767 e!647361))))

(declare-fun mapRest!44648 () (Array (_ BitVec 32) ValueCell!13565))

(declare-fun mapKey!44648 () (_ BitVec 32))

(declare-fun mapValue!44648 () ValueCell!13565)

(assert (=> mapNonEmpty!44648 (= (arr!35645 _values!996) (store mapRest!44648 mapKey!44648 mapValue!44648))))

(declare-fun b!1137427 () Bool)

(declare-fun res!758810 () Bool)

(assert (=> b!1137427 (=> (not res!758810) (not e!647366))))

(assert (=> b!1137427 (= res!758810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1137428 () Bool)

(declare-fun e!647365 () Bool)

(assert (=> b!1137428 (= e!647364 e!647365)))

(declare-fun res!758816 () Bool)

(assert (=> b!1137428 (=> res!758816 e!647365)))

(assert (=> b!1137428 (= res!758816 (not (= from!1455 i!673)))))

(declare-fun lt!505602 () ListLongMap!16077)

(assert (=> b!1137428 (= lt!505602 (getCurrentListMapNoExtraKeys!4565 lt!505605 lt!505610 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2617 (Int (_ BitVec 64)) V!43193)

(assert (=> b!1137428 (= lt!505610 (array!74002 (store (arr!35645 _values!996) i!673 (ValueCellFull!13565 (dynLambda!2617 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36182 _values!996)))))

(declare-fun lt!505613 () ListLongMap!16077)

(assert (=> b!1137428 (= lt!505613 (getCurrentListMapNoExtraKeys!4565 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1137429 () Bool)

(declare-fun res!758820 () Bool)

(assert (=> b!1137429 (=> (not res!758820) (not e!647366))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1137429 (= res!758820 (validKeyInArray!0 k0!934))))

(declare-fun b!1137430 () Bool)

(declare-fun e!647359 () Unit!37179)

(declare-fun lt!505599 () Unit!37179)

(assert (=> b!1137430 (= e!647359 lt!505599)))

(declare-fun lt!505604 () Unit!37179)

(assert (=> b!1137430 (= lt!505604 (addStillContains!735 lt!505611 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun +!3509 (ListLongMap!16077 tuple2!18100) ListLongMap!16077)

(assert (=> b!1137430 (= lt!505614 (+!3509 lt!505611 (tuple2!18101 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(assert (=> b!1137430 call!49837))

(assert (=> b!1137430 (= lt!505599 call!49839)))

(assert (=> b!1137430 (contains!6601 call!49841 k0!934)))

(declare-fun b!1137431 () Bool)

(declare-fun e!647356 () Bool)

(assert (=> b!1137431 (= e!647365 e!647356)))

(declare-fun res!758817 () Bool)

(assert (=> b!1137431 (=> res!758817 e!647356)))

(assert (=> b!1137431 (= res!758817 (not (= (select (arr!35644 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1137431 e!647358))

(declare-fun c!111445 () Bool)

(assert (=> b!1137431 (= c!111445 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!505612 () Unit!37179)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!456 (array!73999 array!74001 (_ BitVec 32) (_ BitVec 32) V!43193 V!43193 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37179)

(assert (=> b!1137431 (= lt!505612 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!456 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137432 () Bool)

(declare-fun e!647353 () Bool)

(declare-fun tp_is_empty!28549 () Bool)

(assert (=> b!1137432 (= e!647353 tp_is_empty!28549)))

(declare-fun b!1137433 () Bool)

(declare-fun e!647360 () Bool)

(assert (=> b!1137433 (= e!647360 e!647367)))

(declare-fun res!758819 () Bool)

(assert (=> b!1137433 (=> res!758819 e!647367)))

(assert (=> b!1137433 (= res!758819 (or (bvsge (size!36181 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!36181 _keys!1208)) (bvsge from!1455 (size!36181 _keys!1208))))))

(assert (=> b!1137433 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24863)))

(declare-fun lt!505603 () Unit!37179)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!73999 (_ BitVec 32) (_ BitVec 32)) Unit!37179)

(assert (=> b!1137433 (= lt!505603 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1137433 e!647362))

(declare-fun res!758814 () Bool)

(assert (=> b!1137433 (=> (not res!758814) (not e!647362))))

(assert (=> b!1137433 (= res!758814 e!647354)))

(declare-fun c!111446 () Bool)

(assert (=> b!1137433 (= c!111446 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!505615 () Unit!37179)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!344 (array!73999 array!74001 (_ BitVec 32) (_ BitVec 32) V!43193 V!43193 (_ BitVec 64) (_ BitVec 32) Int) Unit!37179)

(assert (=> b!1137433 (= lt!505615 (lemmaListMapContainsThenArrayContainsFrom!344 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!505609 () Unit!37179)

(assert (=> b!1137433 (= lt!505609 e!647359)))

(assert (=> b!1137433 (= c!111444 (and (not lt!505607) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1137433 (= lt!505607 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1137434 () Bool)

(declare-fun res!758818 () Bool)

(assert (=> b!1137434 (=> (not res!758818) (not e!647366))))

(assert (=> b!1137434 (= res!758818 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24863))))

(declare-fun b!1137435 () Bool)

(assert (=> b!1137435 (= e!647361 tp_is_empty!28549)))

(declare-fun b!1137436 () Bool)

(assert (=> b!1137436 (= e!647356 e!647360)))

(declare-fun res!758815 () Bool)

(assert (=> b!1137436 (=> res!758815 e!647360)))

(assert (=> b!1137436 (= res!758815 (not (contains!6601 lt!505611 k0!934)))))

(assert (=> b!1137436 (= lt!505611 (getCurrentListMapNoExtraKeys!4565 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1137437 () Bool)

(declare-fun res!758812 () Bool)

(assert (=> b!1137437 (=> (not res!758812) (not e!647366))))

(assert (=> b!1137437 (= res!758812 (and (= (size!36182 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36181 _keys!1208) (size!36182 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1137438 () Bool)

(assert (=> b!1137438 (= e!647354 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!49839 () Bool)

(assert (=> bm!49839 (= call!49841 (+!3509 (ite c!111444 lt!505614 lt!505611) (ite c!111444 (tuple2!18101 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!111443 (tuple2!18101 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18101 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1137439 () Bool)

(declare-fun res!758821 () Bool)

(assert (=> b!1137439 (=> res!758821 e!647367)))

(declare-fun noDuplicate!1617 (List!24866) Bool)

(assert (=> b!1137439 (= res!758821 (not (noDuplicate!1617 Nil!24863)))))

(declare-fun b!1137440 () Bool)

(assert (=> b!1137440 (= e!647359 e!647363)))

(assert (=> b!1137440 (= c!111443 (and (not lt!505607) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1137441 () Bool)

(declare-fun e!647357 () Bool)

(assert (=> b!1137441 (= e!647357 (and e!647353 mapRes!44648))))

(declare-fun condMapEmpty!44648 () Bool)

(declare-fun mapDefault!44648 () ValueCell!13565)

(assert (=> b!1137441 (= condMapEmpty!44648 (= (arr!35645 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13565)) mapDefault!44648)))))

(declare-fun b!1137419 () Bool)

(declare-fun -!1200 (ListLongMap!16077 (_ BitVec 64)) ListLongMap!16077)

(assert (=> b!1137419 (= e!647358 (= call!49838 (-!1200 call!49835 k0!934)))))

(declare-fun res!758807 () Bool)

(assert (=> start!98650 (=> (not res!758807) (not e!647366))))

(assert (=> start!98650 (= res!758807 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36181 _keys!1208))))))

(assert (=> start!98650 e!647366))

(assert (=> start!98650 tp_is_empty!28549))

(declare-fun array_inv!27382 (array!73999) Bool)

(assert (=> start!98650 (array_inv!27382 _keys!1208)))

(assert (=> start!98650 true))

(assert (=> start!98650 tp!84768))

(declare-fun array_inv!27383 (array!74001) Bool)

(assert (=> start!98650 (and (array_inv!27383 _values!996) e!647357)))

(assert (= (and start!98650 res!758807) b!1137426))

(assert (= (and b!1137426 res!758811) b!1137437))

(assert (= (and b!1137437 res!758812) b!1137427))

(assert (= (and b!1137427 res!758810) b!1137434))

(assert (= (and b!1137434 res!758818) b!1137417))

(assert (= (and b!1137417 res!758813) b!1137429))

(assert (= (and b!1137429 res!758820) b!1137414))

(assert (= (and b!1137414 res!758823) b!1137411))

(assert (= (and b!1137411 res!758806) b!1137418))

(assert (= (and b!1137418 res!758809) b!1137416))

(assert (= (and b!1137416 (not res!758822)) b!1137428))

(assert (= (and b!1137428 (not res!758816)) b!1137431))

(assert (= (and b!1137431 c!111445) b!1137419))

(assert (= (and b!1137431 (not c!111445)) b!1137424))

(assert (= (or b!1137419 b!1137424) bm!49836))

(assert (= (or b!1137419 b!1137424) bm!49838))

(assert (= (and b!1137431 (not res!758817)) b!1137436))

(assert (= (and b!1137436 (not res!758815)) b!1137433))

(assert (= (and b!1137433 c!111444) b!1137430))

(assert (= (and b!1137433 (not c!111444)) b!1137440))

(assert (= (and b!1137440 c!111443) b!1137422))

(assert (= (and b!1137440 (not c!111443)) b!1137420))

(assert (= (and b!1137420 c!111447) b!1137412))

(assert (= (and b!1137420 (not c!111447)) b!1137425))

(assert (= (or b!1137422 b!1137412) bm!49837))

(assert (= (or b!1137422 b!1137412) bm!49832))

(assert (= (or b!1137422 b!1137412) bm!49835))

(assert (= (or b!1137430 bm!49835) bm!49833))

(assert (= (or b!1137430 bm!49837) bm!49834))

(assert (= (or b!1137430 bm!49832) bm!49839))

(assert (= (and b!1137433 c!111446) b!1137438))

(assert (= (and b!1137433 (not c!111446)) b!1137423))

(assert (= (and b!1137433 res!758814) b!1137413))

(assert (= (and b!1137433 (not res!758819)) b!1137439))

(assert (= (and b!1137439 (not res!758821)) b!1137421))

(assert (= (and b!1137421 (not res!758808)) b!1137415))

(assert (= (and b!1137441 condMapEmpty!44648) mapIsEmpty!44648))

(assert (= (and b!1137441 (not condMapEmpty!44648)) mapNonEmpty!44648))

(get-info :version)

(assert (= (and mapNonEmpty!44648 ((_ is ValueCellFull!13565) mapValue!44648)) b!1137435))

(assert (= (and b!1137441 ((_ is ValueCellFull!13565) mapDefault!44648)) b!1137432))

(assert (= start!98650 b!1137441))

(declare-fun b_lambda!19119 () Bool)

(assert (=> (not b_lambda!19119) (not b!1137428)))

(declare-fun t!35867 () Bool)

(declare-fun tb!8823 () Bool)

(assert (=> (and start!98650 (= defaultEntry!1004 defaultEntry!1004) t!35867) tb!8823))

(declare-fun result!18219 () Bool)

(assert (=> tb!8823 (= result!18219 tp_is_empty!28549)))

(assert (=> b!1137428 t!35867))

(declare-fun b_and!38891 () Bool)

(assert (= b_and!38889 (and (=> t!35867 result!18219) b_and!38891)))

(declare-fun m!1050099 () Bool)

(assert (=> bm!49838 m!1050099))

(declare-fun m!1050101 () Bool)

(assert (=> b!1137427 m!1050101))

(declare-fun m!1050103 () Bool)

(assert (=> b!1137415 m!1050103))

(declare-fun m!1050105 () Bool)

(assert (=> b!1137421 m!1050105))

(declare-fun m!1050107 () Bool)

(assert (=> b!1137433 m!1050107))

(declare-fun m!1050109 () Bool)

(assert (=> b!1137433 m!1050109))

(declare-fun m!1050111 () Bool)

(assert (=> b!1137433 m!1050111))

(declare-fun m!1050113 () Bool)

(assert (=> b!1137414 m!1050113))

(declare-fun m!1050115 () Bool)

(assert (=> b!1137434 m!1050115))

(declare-fun m!1050117 () Bool)

(assert (=> b!1137429 m!1050117))

(declare-fun m!1050119 () Bool)

(assert (=> b!1137411 m!1050119))

(declare-fun m!1050121 () Bool)

(assert (=> b!1137411 m!1050121))

(declare-fun m!1050123 () Bool)

(assert (=> b!1137426 m!1050123))

(declare-fun m!1050125 () Bool)

(assert (=> bm!49839 m!1050125))

(declare-fun m!1050127 () Bool)

(assert (=> b!1137418 m!1050127))

(declare-fun m!1050129 () Bool)

(assert (=> b!1137438 m!1050129))

(declare-fun m!1050131 () Bool)

(assert (=> b!1137430 m!1050131))

(declare-fun m!1050133 () Bool)

(assert (=> b!1137430 m!1050133))

(declare-fun m!1050135 () Bool)

(assert (=> b!1137430 m!1050135))

(declare-fun m!1050137 () Bool)

(assert (=> bm!49836 m!1050137))

(declare-fun m!1050139 () Bool)

(assert (=> start!98650 m!1050139))

(declare-fun m!1050141 () Bool)

(assert (=> start!98650 m!1050141))

(declare-fun m!1050143 () Bool)

(assert (=> b!1137428 m!1050143))

(declare-fun m!1050145 () Bool)

(assert (=> b!1137428 m!1050145))

(declare-fun m!1050147 () Bool)

(assert (=> b!1137428 m!1050147))

(declare-fun m!1050149 () Bool)

(assert (=> b!1137428 m!1050149))

(assert (=> b!1137413 m!1050129))

(declare-fun m!1050151 () Bool)

(assert (=> b!1137431 m!1050151))

(declare-fun m!1050153 () Bool)

(assert (=> b!1137431 m!1050153))

(declare-fun m!1050155 () Bool)

(assert (=> mapNonEmpty!44648 m!1050155))

(declare-fun m!1050157 () Bool)

(assert (=> bm!49834 m!1050157))

(declare-fun m!1050159 () Bool)

(assert (=> b!1137439 m!1050159))

(declare-fun m!1050161 () Bool)

(assert (=> b!1137419 m!1050161))

(declare-fun m!1050163 () Bool)

(assert (=> b!1137416 m!1050163))

(declare-fun m!1050165 () Bool)

(assert (=> b!1137416 m!1050165))

(declare-fun m!1050167 () Bool)

(assert (=> bm!49833 m!1050167))

(declare-fun m!1050169 () Bool)

(assert (=> b!1137436 m!1050169))

(assert (=> b!1137436 m!1050137))

(check-sat (not b!1137416) (not b!1137434) (not b!1137413) (not b!1137427) (not bm!49834) (not b!1137421) (not mapNonEmpty!44648) (not b_next!24019) (not b!1137411) (not bm!49833) b_and!38891 (not b!1137429) (not b!1137418) (not start!98650) (not b!1137438) (not b!1137428) (not bm!49836) (not b!1137430) tp_is_empty!28549 (not b!1137431) (not bm!49838) (not b!1137426) (not b!1137433) (not b_lambda!19119) (not b!1137415) (not bm!49839) (not b!1137439) (not b!1137436) (not b!1137419))
(check-sat b_and!38891 (not b_next!24019))
