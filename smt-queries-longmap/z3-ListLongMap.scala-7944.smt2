; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98740 () Bool)

(assert start!98740)

(declare-fun b_free!24109 () Bool)

(declare-fun b_next!24109 () Bool)

(assert (=> start!98740 (= b_free!24109 (not b_next!24109))))

(declare-fun tp!85038 () Bool)

(declare-fun b_and!39069 () Bool)

(assert (=> start!98740 (= tp!85038 b_and!39069)))

(declare-fun b!1141448 () Bool)

(declare-datatypes ((array!74179 0))(
  ( (array!74180 (arr!35734 (Array (_ BitVec 32) (_ BitVec 64))) (size!36271 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74179)

(declare-fun e!649534 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!74179 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1141448 (= e!649534 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1141449 () Bool)

(declare-fun res!760765 () Bool)

(declare-fun e!649536 () Bool)

(assert (=> b!1141449 (=> (not res!760765) (not e!649536))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!43313 0))(
  ( (V!43314 (val!14376 Int)) )
))
(declare-datatypes ((ValueCell!13610 0))(
  ( (ValueCellFull!13610 (v!17009 V!43313)) (EmptyCell!13610) )
))
(declare-datatypes ((array!74181 0))(
  ( (array!74182 (arr!35735 (Array (_ BitVec 32) ValueCell!13610)) (size!36272 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74181)

(assert (=> b!1141449 (= res!760765 (and (= (size!36272 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36271 _keys!1208) (size!36272 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1141450 () Bool)

(declare-fun e!649532 () Bool)

(declare-fun e!649541 () Bool)

(assert (=> b!1141450 (= e!649532 e!649541)))

(declare-fun res!760773 () Bool)

(assert (=> b!1141450 (=> res!760773 e!649541)))

(assert (=> b!1141450 (= res!760773 (not (= (select (arr!35734 _keys!1208) from!1455) k0!934)))))

(declare-fun e!649528 () Bool)

(assert (=> b!1141450 e!649528))

(declare-fun c!112241 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1141450 (= c!112241 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!43313)

(declare-fun minValue!944 () V!43313)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!37361 0))(
  ( (Unit!37362) )
))
(declare-fun lt!508117 () Unit!37361)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!490 (array!74179 array!74181 (_ BitVec 32) (_ BitVec 32) V!43313 V!43313 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37361)

(assert (=> b!1141450 (= lt!508117 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!490 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141451 () Bool)

(declare-fun e!649542 () Bool)

(assert (=> b!1141451 (= e!649542 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1141452 () Bool)

(declare-fun res!760769 () Bool)

(assert (=> b!1141452 (=> (not res!760769) (not e!649536))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1141452 (= res!760769 (validKeyInArray!0 k0!934))))

(declare-fun b!1141453 () Bool)

(declare-fun call!50919 () Bool)

(assert (=> b!1141453 call!50919))

(declare-fun lt!508121 () Unit!37361)

(declare-fun call!50915 () Unit!37361)

(assert (=> b!1141453 (= lt!508121 call!50915)))

(declare-fun e!649529 () Unit!37361)

(assert (=> b!1141453 (= e!649529 lt!508121)))

(declare-fun b!1141454 () Bool)

(declare-fun e!649543 () Bool)

(declare-fun tp_is_empty!28639 () Bool)

(assert (=> b!1141454 (= e!649543 tp_is_empty!28639)))

(declare-fun b!1141455 () Bool)

(declare-fun e!649533 () Unit!37361)

(declare-fun Unit!37363 () Unit!37361)

(assert (=> b!1141455 (= e!649533 Unit!37363)))

(declare-fun b!1141456 () Bool)

(declare-fun c!112237 () Bool)

(declare-fun lt!508125 () Bool)

(assert (=> b!1141456 (= c!112237 (and (not lt!508125) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!649538 () Unit!37361)

(declare-fun e!649531 () Unit!37361)

(assert (=> b!1141456 (= e!649538 e!649531)))

(declare-fun b!1141457 () Bool)

(declare-datatypes ((tuple2!18190 0))(
  ( (tuple2!18191 (_1!9106 (_ BitVec 64)) (_2!9106 V!43313)) )
))
(declare-datatypes ((List!24952 0))(
  ( (Nil!24949) (Cons!24948 (h!26166 tuple2!18190) (t!36045 List!24952)) )
))
(declare-datatypes ((ListLongMap!16167 0))(
  ( (ListLongMap!16168 (toList!8099 List!24952)) )
))
(declare-fun call!50918 () ListLongMap!16167)

(declare-fun contains!6646 (ListLongMap!16167 (_ BitVec 64)) Bool)

(assert (=> b!1141457 (contains!6646 call!50918 k0!934)))

(declare-fun lt!508123 () Unit!37361)

(declare-fun call!50916 () Unit!37361)

(assert (=> b!1141457 (= lt!508123 call!50916)))

(declare-fun call!50920 () Bool)

(assert (=> b!1141457 call!50920))

(declare-fun lt!508120 () ListLongMap!16167)

(declare-fun lt!508112 () ListLongMap!16167)

(declare-fun +!3548 (ListLongMap!16167 tuple2!18190) ListLongMap!16167)

(assert (=> b!1141457 (= lt!508120 (+!3548 lt!508112 (tuple2!18191 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun lt!508124 () Unit!37361)

(declare-fun addStillContains!776 (ListLongMap!16167 (_ BitVec 64) V!43313 (_ BitVec 64)) Unit!37361)

(assert (=> b!1141457 (= lt!508124 (addStillContains!776 lt!508112 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(assert (=> b!1141457 (= e!649538 lt!508123)))

(declare-fun b!1141458 () Bool)

(declare-fun res!760770 () Bool)

(declare-fun e!649537 () Bool)

(assert (=> b!1141458 (=> (not res!760770) (not e!649537))))

(declare-fun lt!508128 () array!74179)

(declare-datatypes ((List!24953 0))(
  ( (Nil!24950) (Cons!24949 (h!26167 (_ BitVec 64)) (t!36046 List!24953)) )
))
(declare-fun arrayNoDuplicates!0 (array!74179 (_ BitVec 32) List!24953) Bool)

(assert (=> b!1141458 (= res!760770 (arrayNoDuplicates!0 lt!508128 #b00000000000000000000000000000000 Nil!24950))))

(declare-fun b!1141459 () Bool)

(declare-fun e!649530 () Bool)

(assert (=> b!1141459 (= e!649530 tp_is_empty!28639)))

(declare-fun b!1141460 () Bool)

(declare-fun e!649540 () Bool)

(assert (=> b!1141460 (= e!649540 e!649532)))

(declare-fun res!760771 () Bool)

(assert (=> b!1141460 (=> res!760771 e!649532)))

(assert (=> b!1141460 (= res!760771 (not (= from!1455 i!673)))))

(declare-fun lt!508116 () ListLongMap!16167)

(declare-fun lt!508118 () array!74181)

(declare-fun getCurrentListMapNoExtraKeys!4607 (array!74179 array!74181 (_ BitVec 32) (_ BitVec 32) V!43313 V!43313 (_ BitVec 32) Int) ListLongMap!16167)

(assert (=> b!1141460 (= lt!508116 (getCurrentListMapNoExtraKeys!4607 lt!508128 lt!508118 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!508113 () V!43313)

(assert (=> b!1141460 (= lt!508118 (array!74182 (store (arr!35735 _values!996) i!673 (ValueCellFull!13610 lt!508113)) (size!36272 _values!996)))))

(declare-fun dynLambda!2650 (Int (_ BitVec 64)) V!43313)

(assert (=> b!1141460 (= lt!508113 (dynLambda!2650 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!508115 () ListLongMap!16167)

(assert (=> b!1141460 (= lt!508115 (getCurrentListMapNoExtraKeys!4607 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!44783 () Bool)

(declare-fun mapRes!44783 () Bool)

(declare-fun tp!85037 () Bool)

(assert (=> mapNonEmpty!44783 (= mapRes!44783 (and tp!85037 e!649530))))

(declare-fun mapValue!44783 () ValueCell!13610)

(declare-fun mapRest!44783 () (Array (_ BitVec 32) ValueCell!13610))

(declare-fun mapKey!44783 () (_ BitVec 32))

(assert (=> mapNonEmpty!44783 (= (arr!35735 _values!996) (store mapRest!44783 mapKey!44783 mapValue!44783))))

(declare-fun bm!50912 () Bool)

(assert (=> bm!50912 (= call!50919 call!50920)))

(declare-fun b!1141461 () Bool)

(declare-fun call!50921 () ListLongMap!16167)

(declare-fun call!50917 () ListLongMap!16167)

(assert (=> b!1141461 (= e!649528 (= call!50921 call!50917))))

(declare-fun call!50922 () ListLongMap!16167)

(declare-fun c!112240 () Bool)

(declare-fun bm!50913 () Bool)

(assert (=> bm!50913 (= call!50920 (contains!6646 (ite c!112240 lt!508120 call!50922) k0!934))))

(declare-fun b!1141462 () Bool)

(declare-fun res!760763 () Bool)

(assert (=> b!1141462 (=> (not res!760763) (not e!649536))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74179 (_ BitVec 32)) Bool)

(assert (=> b!1141462 (= res!760763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!50914 () Bool)

(assert (=> bm!50914 (= call!50918 (+!3548 (ite c!112240 lt!508120 lt!508112) (ite c!112240 (tuple2!18191 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!112237 (tuple2!18191 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18191 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun bm!50915 () Bool)

(assert (=> bm!50915 (= call!50922 call!50918)))

(declare-fun b!1141463 () Bool)

(declare-fun Unit!37364 () Unit!37361)

(assert (=> b!1141463 (= e!649529 Unit!37364)))

(declare-fun b!1141464 () Bool)

(assert (=> b!1141464 (= e!649536 e!649537)))

(declare-fun res!760762 () Bool)

(assert (=> b!1141464 (=> (not res!760762) (not e!649537))))

(assert (=> b!1141464 (= res!760762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!508128 mask!1564))))

(assert (=> b!1141464 (= lt!508128 (array!74180 (store (arr!35734 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36271 _keys!1208)))))

(declare-fun b!1141465 () Bool)

(declare-fun -!1233 (ListLongMap!16167 (_ BitVec 64)) ListLongMap!16167)

(assert (=> b!1141465 (= e!649528 (= call!50921 (-!1233 call!50917 k0!934)))))

(declare-fun mapIsEmpty!44783 () Bool)

(assert (=> mapIsEmpty!44783 mapRes!44783))

(declare-fun res!760761 () Bool)

(assert (=> start!98740 (=> (not res!760761) (not e!649536))))

(assert (=> start!98740 (= res!760761 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36271 _keys!1208))))))

(assert (=> start!98740 e!649536))

(assert (=> start!98740 tp_is_empty!28639))

(declare-fun array_inv!27438 (array!74179) Bool)

(assert (=> start!98740 (array_inv!27438 _keys!1208)))

(assert (=> start!98740 true))

(assert (=> start!98740 tp!85038))

(declare-fun e!649535 () Bool)

(declare-fun array_inv!27439 (array!74181) Bool)

(assert (=> start!98740 (and (array_inv!27439 _values!996) e!649535)))

(declare-fun bm!50916 () Bool)

(assert (=> bm!50916 (= call!50915 call!50916)))

(declare-fun b!1141466 () Bool)

(declare-fun res!760760 () Bool)

(assert (=> b!1141466 (=> (not res!760760) (not e!649536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1141466 (= res!760760 (validMask!0 mask!1564))))

(declare-fun b!1141467 () Bool)

(declare-fun Unit!37365 () Unit!37361)

(assert (=> b!1141467 (= e!649533 Unit!37365)))

(assert (=> b!1141467 (= lt!508125 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1141467 (= c!112240 (and (not lt!508125) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!508119 () Unit!37361)

(assert (=> b!1141467 (= lt!508119 e!649538)))

(declare-fun lt!508111 () Unit!37361)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!381 (array!74179 array!74181 (_ BitVec 32) (_ BitVec 32) V!43313 V!43313 (_ BitVec 64) (_ BitVec 32) Int) Unit!37361)

(assert (=> b!1141467 (= lt!508111 (lemmaListMapContainsThenArrayContainsFrom!381 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112239 () Bool)

(assert (=> b!1141467 (= c!112239 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!760764 () Bool)

(assert (=> b!1141467 (= res!760764 e!649542)))

(assert (=> b!1141467 (=> (not res!760764) (not e!649534))))

(assert (=> b!1141467 e!649534))

(declare-fun lt!508127 () Unit!37361)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74179 (_ BitVec 32) (_ BitVec 32)) Unit!37361)

(assert (=> b!1141467 (= lt!508127 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1141467 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!24950)))

(declare-fun lt!508129 () Unit!37361)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74179 (_ BitVec 64) (_ BitVec 32) List!24953) Unit!37361)

(assert (=> b!1141467 (= lt!508129 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!24950))))

(assert (=> b!1141467 false))

(declare-fun b!1141468 () Bool)

(assert (=> b!1141468 (= e!649535 (and e!649543 mapRes!44783))))

(declare-fun condMapEmpty!44783 () Bool)

(declare-fun mapDefault!44783 () ValueCell!13610)

(assert (=> b!1141468 (= condMapEmpty!44783 (= (arr!35735 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13610)) mapDefault!44783)))))

(declare-fun b!1141469 () Bool)

(assert (=> b!1141469 (= e!649541 true)))

(declare-fun lt!508114 () V!43313)

(assert (=> b!1141469 (= (-!1233 (+!3548 lt!508112 (tuple2!18191 (select (arr!35734 _keys!1208) from!1455) lt!508114)) (select (arr!35734 _keys!1208) from!1455)) lt!508112)))

(declare-fun lt!508109 () Unit!37361)

(declare-fun addThenRemoveForNewKeyIsSame!93 (ListLongMap!16167 (_ BitVec 64) V!43313) Unit!37361)

(assert (=> b!1141469 (= lt!508109 (addThenRemoveForNewKeyIsSame!93 lt!508112 (select (arr!35734 _keys!1208) from!1455) lt!508114))))

(declare-fun get!18174 (ValueCell!13610 V!43313) V!43313)

(assert (=> b!1141469 (= lt!508114 (get!18174 (select (arr!35735 _values!996) from!1455) lt!508113))))

(declare-fun lt!508126 () Unit!37361)

(assert (=> b!1141469 (= lt!508126 e!649533)))

(declare-fun c!112238 () Bool)

(assert (=> b!1141469 (= c!112238 (contains!6646 lt!508112 k0!934))))

(assert (=> b!1141469 (= lt!508112 (getCurrentListMapNoExtraKeys!4607 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141470 () Bool)

(assert (=> b!1141470 (= e!649531 e!649529)))

(declare-fun c!112242 () Bool)

(assert (=> b!1141470 (= c!112242 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!508125))))

(declare-fun b!1141471 () Bool)

(assert (=> b!1141471 (= e!649542 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!508125) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1141472 () Bool)

(declare-fun res!760772 () Bool)

(assert (=> b!1141472 (=> (not res!760772) (not e!649536))))

(assert (=> b!1141472 (= res!760772 (= (select (arr!35734 _keys!1208) i!673) k0!934))))

(declare-fun b!1141473 () Bool)

(declare-fun lt!508122 () Unit!37361)

(assert (=> b!1141473 (= e!649531 lt!508122)))

(assert (=> b!1141473 (= lt!508122 call!50915)))

(assert (=> b!1141473 call!50919))

(declare-fun bm!50917 () Bool)

(assert (=> bm!50917 (= call!50916 (addStillContains!776 (ite c!112240 lt!508120 lt!508112) (ite c!112240 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!112237 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!112240 minValue!944 (ite c!112237 zeroValue!944 minValue!944)) k0!934))))

(declare-fun bm!50918 () Bool)

(assert (=> bm!50918 (= call!50917 (getCurrentListMapNoExtraKeys!4607 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141474 () Bool)

(declare-fun res!760767 () Bool)

(assert (=> b!1141474 (=> (not res!760767) (not e!649536))))

(assert (=> b!1141474 (= res!760767 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24950))))

(declare-fun bm!50919 () Bool)

(assert (=> bm!50919 (= call!50921 (getCurrentListMapNoExtraKeys!4607 lt!508128 lt!508118 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1141475 () Bool)

(declare-fun res!760766 () Bool)

(assert (=> b!1141475 (=> (not res!760766) (not e!649536))))

(assert (=> b!1141475 (= res!760766 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36271 _keys!1208))))))

(declare-fun b!1141476 () Bool)

(assert (=> b!1141476 (= e!649537 (not e!649540))))

(declare-fun res!760768 () Bool)

(assert (=> b!1141476 (=> res!760768 e!649540)))

(assert (=> b!1141476 (= res!760768 (bvsgt from!1455 i!673))))

(assert (=> b!1141476 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!508110 () Unit!37361)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74179 (_ BitVec 64) (_ BitVec 32)) Unit!37361)

(assert (=> b!1141476 (= lt!508110 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!98740 res!760761) b!1141466))

(assert (= (and b!1141466 res!760760) b!1141449))

(assert (= (and b!1141449 res!760765) b!1141462))

(assert (= (and b!1141462 res!760763) b!1141474))

(assert (= (and b!1141474 res!760767) b!1141475))

(assert (= (and b!1141475 res!760766) b!1141452))

(assert (= (and b!1141452 res!760769) b!1141472))

(assert (= (and b!1141472 res!760772) b!1141464))

(assert (= (and b!1141464 res!760762) b!1141458))

(assert (= (and b!1141458 res!760770) b!1141476))

(assert (= (and b!1141476 (not res!760768)) b!1141460))

(assert (= (and b!1141460 (not res!760771)) b!1141450))

(assert (= (and b!1141450 c!112241) b!1141465))

(assert (= (and b!1141450 (not c!112241)) b!1141461))

(assert (= (or b!1141465 b!1141461) bm!50919))

(assert (= (or b!1141465 b!1141461) bm!50918))

(assert (= (and b!1141450 (not res!760773)) b!1141469))

(assert (= (and b!1141469 c!112238) b!1141467))

(assert (= (and b!1141469 (not c!112238)) b!1141455))

(assert (= (and b!1141467 c!112240) b!1141457))

(assert (= (and b!1141467 (not c!112240)) b!1141456))

(assert (= (and b!1141456 c!112237) b!1141473))

(assert (= (and b!1141456 (not c!112237)) b!1141470))

(assert (= (and b!1141470 c!112242) b!1141453))

(assert (= (and b!1141470 (not c!112242)) b!1141463))

(assert (= (or b!1141473 b!1141453) bm!50916))

(assert (= (or b!1141473 b!1141453) bm!50915))

(assert (= (or b!1141473 b!1141453) bm!50912))

(assert (= (or b!1141457 bm!50912) bm!50913))

(assert (= (or b!1141457 bm!50916) bm!50917))

(assert (= (or b!1141457 bm!50915) bm!50914))

(assert (= (and b!1141467 c!112239) b!1141451))

(assert (= (and b!1141467 (not c!112239)) b!1141471))

(assert (= (and b!1141467 res!760764) b!1141448))

(assert (= (and b!1141468 condMapEmpty!44783) mapIsEmpty!44783))

(assert (= (and b!1141468 (not condMapEmpty!44783)) mapNonEmpty!44783))

(get-info :version)

(assert (= (and mapNonEmpty!44783 ((_ is ValueCellFull!13610) mapValue!44783)) b!1141459))

(assert (= (and b!1141468 ((_ is ValueCellFull!13610) mapDefault!44783)) b!1141454))

(assert (= start!98740 b!1141468))

(declare-fun b_lambda!19209 () Bool)

(assert (=> (not b_lambda!19209) (not b!1141460)))

(declare-fun t!36044 () Bool)

(declare-fun tb!8913 () Bool)

(assert (=> (and start!98740 (= defaultEntry!1004 defaultEntry!1004) t!36044) tb!8913))

(declare-fun result!18399 () Bool)

(assert (=> tb!8913 (= result!18399 tp_is_empty!28639)))

(assert (=> b!1141460 t!36044))

(declare-fun b_and!39071 () Bool)

(assert (= b_and!39069 (and (=> t!36044 result!18399) b_and!39071)))

(declare-fun m!1053279 () Bool)

(assert (=> b!1141469 m!1053279))

(declare-fun m!1053281 () Bool)

(assert (=> b!1141469 m!1053281))

(declare-fun m!1053283 () Bool)

(assert (=> b!1141469 m!1053283))

(assert (=> b!1141469 m!1053283))

(declare-fun m!1053285 () Bool)

(assert (=> b!1141469 m!1053285))

(declare-fun m!1053287 () Bool)

(assert (=> b!1141469 m!1053287))

(declare-fun m!1053289 () Bool)

(assert (=> b!1141469 m!1053289))

(assert (=> b!1141469 m!1053281))

(declare-fun m!1053291 () Bool)

(assert (=> b!1141469 m!1053291))

(assert (=> b!1141469 m!1053285))

(assert (=> b!1141469 m!1053285))

(declare-fun m!1053293 () Bool)

(assert (=> b!1141469 m!1053293))

(declare-fun m!1053295 () Bool)

(assert (=> bm!50919 m!1053295))

(declare-fun m!1053297 () Bool)

(assert (=> b!1141452 m!1053297))

(declare-fun m!1053299 () Bool)

(assert (=> b!1141467 m!1053299))

(declare-fun m!1053301 () Bool)

(assert (=> b!1141467 m!1053301))

(declare-fun m!1053303 () Bool)

(assert (=> b!1141467 m!1053303))

(declare-fun m!1053305 () Bool)

(assert (=> b!1141467 m!1053305))

(declare-fun m!1053307 () Bool)

(assert (=> b!1141465 m!1053307))

(assert (=> bm!50918 m!1053279))

(declare-fun m!1053309 () Bool)

(assert (=> b!1141474 m!1053309))

(declare-fun m!1053311 () Bool)

(assert (=> b!1141457 m!1053311))

(declare-fun m!1053313 () Bool)

(assert (=> b!1141457 m!1053313))

(declare-fun m!1053315 () Bool)

(assert (=> b!1141457 m!1053315))

(declare-fun m!1053317 () Bool)

(assert (=> mapNonEmpty!44783 m!1053317))

(declare-fun m!1053319 () Bool)

(assert (=> b!1141451 m!1053319))

(declare-fun m!1053321 () Bool)

(assert (=> bm!50914 m!1053321))

(declare-fun m!1053323 () Bool)

(assert (=> b!1141466 m!1053323))

(declare-fun m!1053325 () Bool)

(assert (=> b!1141462 m!1053325))

(declare-fun m!1053327 () Bool)

(assert (=> b!1141460 m!1053327))

(declare-fun m!1053329 () Bool)

(assert (=> b!1141460 m!1053329))

(declare-fun m!1053331 () Bool)

(assert (=> b!1141460 m!1053331))

(declare-fun m!1053333 () Bool)

(assert (=> b!1141460 m!1053333))

(declare-fun m!1053335 () Bool)

(assert (=> b!1141472 m!1053335))

(assert (=> b!1141448 m!1053319))

(declare-fun m!1053337 () Bool)

(assert (=> bm!50913 m!1053337))

(declare-fun m!1053339 () Bool)

(assert (=> b!1141458 m!1053339))

(assert (=> b!1141450 m!1053285))

(declare-fun m!1053341 () Bool)

(assert (=> b!1141450 m!1053341))

(declare-fun m!1053343 () Bool)

(assert (=> b!1141464 m!1053343))

(declare-fun m!1053345 () Bool)

(assert (=> b!1141464 m!1053345))

(declare-fun m!1053347 () Bool)

(assert (=> start!98740 m!1053347))

(declare-fun m!1053349 () Bool)

(assert (=> start!98740 m!1053349))

(declare-fun m!1053351 () Bool)

(assert (=> bm!50917 m!1053351))

(declare-fun m!1053353 () Bool)

(assert (=> b!1141476 m!1053353))

(declare-fun m!1053355 () Bool)

(assert (=> b!1141476 m!1053355))

(check-sat (not b!1141458) (not bm!50918) (not b!1141462) (not b!1141464) tp_is_empty!28639 (not b!1141457) (not b!1141451) (not b!1141460) (not b!1141452) (not bm!50917) (not b!1141469) (not b_next!24109) (not b!1141450) (not b!1141467) (not b_lambda!19209) (not bm!50913) (not bm!50914) (not bm!50919) (not start!98740) (not b!1141448) (not b!1141474) (not mapNonEmpty!44783) b_and!39071 (not b!1141465) (not b!1141476) (not b!1141466))
(check-sat b_and!39071 (not b_next!24109))
