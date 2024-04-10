; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98738 () Bool)

(assert start!98738)

(declare-fun b_free!24343 () Bool)

(declare-fun b_next!24343 () Bool)

(assert (=> start!98738 (= b_free!24343 (not b_next!24343))))

(declare-fun tp!85739 () Bool)

(declare-fun b_and!39535 () Bool)

(assert (=> start!98738 (= tp!85739 b_and!39535)))

(declare-fun b!1150790 () Bool)

(declare-fun call!53663 () Bool)

(assert (=> b!1150790 call!53663))

(declare-datatypes ((Unit!37847 0))(
  ( (Unit!37848) )
))
(declare-fun lt!515067 () Unit!37847)

(declare-fun call!53658 () Unit!37847)

(assert (=> b!1150790 (= lt!515067 call!53658)))

(declare-fun e!654530 () Unit!37847)

(assert (=> b!1150790 (= e!654530 lt!515067)))

(declare-fun b!1150791 () Bool)

(declare-fun res!765387 () Bool)

(declare-fun e!654536 () Bool)

(assert (=> b!1150791 (=> (not res!765387) (not e!654536))))

(declare-datatypes ((array!74593 0))(
  ( (array!74594 (arr!35947 (Array (_ BitVec 32) (_ BitVec 64))) (size!36483 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74593)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1150791 (= res!765387 (= (select (arr!35947 _keys!1208) i!673) k!934))))

(declare-fun b!1150792 () Bool)

(declare-fun res!765395 () Bool)

(assert (=> b!1150792 (=> (not res!765395) (not e!654536))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1150792 (= res!765395 (validKeyInArray!0 k!934))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun e!654546 () Bool)

(declare-fun b!1150793 () Bool)

(declare-fun arrayContainsKey!0 (array!74593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1150793 (= e!654546 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1150794 () Bool)

(declare-fun e!654543 () Unit!37847)

(declare-fun lt!515062 () Unit!37847)

(assert (=> b!1150794 (= e!654543 lt!515062)))

(assert (=> b!1150794 (= lt!515062 call!53658)))

(assert (=> b!1150794 call!53663))

(declare-fun b!1150795 () Bool)

(declare-fun e!654542 () Bool)

(assert (=> b!1150795 (= e!654542 true)))

(declare-fun e!654534 () Bool)

(assert (=> b!1150795 e!654534))

(declare-fun res!765390 () Bool)

(assert (=> b!1150795 (=> (not res!765390) (not e!654534))))

(declare-datatypes ((V!43625 0))(
  ( (V!43626 (val!14493 Int)) )
))
(declare-datatypes ((tuple2!18398 0))(
  ( (tuple2!18399 (_1!9210 (_ BitVec 64)) (_2!9210 V!43625)) )
))
(declare-datatypes ((List!25146 0))(
  ( (Nil!25143) (Cons!25142 (h!26351 tuple2!18398) (t!36481 List!25146)) )
))
(declare-datatypes ((ListLongMap!16367 0))(
  ( (ListLongMap!16368 (toList!8199 List!25146)) )
))
(declare-fun lt!515053 () ListLongMap!16367)

(declare-fun lt!515054 () ListLongMap!16367)

(assert (=> b!1150795 (= res!765390 (= lt!515053 lt!515054))))

(declare-fun lt!515064 () ListLongMap!16367)

(declare-fun -!1330 (ListLongMap!16367 (_ BitVec 64)) ListLongMap!16367)

(assert (=> b!1150795 (= lt!515053 (-!1330 lt!515064 k!934))))

(declare-fun lt!515059 () V!43625)

(declare-fun +!3617 (ListLongMap!16367 tuple2!18398) ListLongMap!16367)

(assert (=> b!1150795 (= (-!1330 (+!3617 lt!515054 (tuple2!18399 (select (arr!35947 _keys!1208) from!1455) lt!515059)) (select (arr!35947 _keys!1208) from!1455)) lt!515054)))

(declare-fun lt!515071 () Unit!37847)

(declare-fun addThenRemoveForNewKeyIsSame!173 (ListLongMap!16367 (_ BitVec 64) V!43625) Unit!37847)

(assert (=> b!1150795 (= lt!515071 (addThenRemoveForNewKeyIsSame!173 lt!515054 (select (arr!35947 _keys!1208) from!1455) lt!515059))))

(declare-fun lt!515069 () V!43625)

(declare-datatypes ((ValueCell!13727 0))(
  ( (ValueCellFull!13727 (v!17130 V!43625)) (EmptyCell!13727) )
))
(declare-datatypes ((array!74595 0))(
  ( (array!74596 (arr!35948 (Array (_ BitVec 32) ValueCell!13727)) (size!36484 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74595)

(declare-fun get!18301 (ValueCell!13727 V!43625) V!43625)

(assert (=> b!1150795 (= lt!515059 (get!18301 (select (arr!35948 _values!996) from!1455) lt!515069))))

(declare-fun lt!515066 () Unit!37847)

(declare-fun e!654538 () Unit!37847)

(assert (=> b!1150795 (= lt!515066 e!654538)))

(declare-fun c!113948 () Bool)

(declare-fun contains!6718 (ListLongMap!16367 (_ BitVec 64)) Bool)

(assert (=> b!1150795 (= c!113948 (contains!6718 lt!515054 k!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43625)

(declare-fun zeroValue!944 () V!43625)

(declare-fun getCurrentListMapNoExtraKeys!4671 (array!74593 array!74595 (_ BitVec 32) (_ BitVec 32) V!43625 V!43625 (_ BitVec 32) Int) ListLongMap!16367)

(assert (=> b!1150795 (= lt!515054 (getCurrentListMapNoExtraKeys!4671 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150796 () Bool)

(declare-fun Unit!37849 () Unit!37847)

(assert (=> b!1150796 (= e!654538 Unit!37849)))

(declare-fun b!1150797 () Bool)

(declare-fun Unit!37850 () Unit!37847)

(assert (=> b!1150797 (= e!654530 Unit!37850)))

(declare-fun b!1150798 () Bool)

(declare-fun e!654531 () Bool)

(assert (=> b!1150798 (= e!654536 e!654531)))

(declare-fun res!765397 () Bool)

(assert (=> b!1150798 (=> (not res!765397) (not e!654531))))

(declare-fun lt!515055 () array!74593)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74593 (_ BitVec 32)) Bool)

(assert (=> b!1150798 (= res!765397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!515055 mask!1564))))

(assert (=> b!1150798 (= lt!515055 (array!74594 (store (arr!35947 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36483 _keys!1208)))))

(declare-fun res!765384 () Bool)

(assert (=> start!98738 (=> (not res!765384) (not e!654536))))

(assert (=> start!98738 (= res!765384 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36483 _keys!1208))))))

(assert (=> start!98738 e!654536))

(declare-fun tp_is_empty!28873 () Bool)

(assert (=> start!98738 tp_is_empty!28873))

(declare-fun array_inv!27530 (array!74593) Bool)

(assert (=> start!98738 (array_inv!27530 _keys!1208)))

(assert (=> start!98738 true))

(assert (=> start!98738 tp!85739))

(declare-fun e!654544 () Bool)

(declare-fun array_inv!27531 (array!74595) Bool)

(assert (=> start!98738 (and (array_inv!27531 _values!996) e!654544)))

(declare-fun mapNonEmpty!45134 () Bool)

(declare-fun mapRes!45134 () Bool)

(declare-fun tp!85740 () Bool)

(declare-fun e!654540 () Bool)

(assert (=> mapNonEmpty!45134 (= mapRes!45134 (and tp!85740 e!654540))))

(declare-fun mapValue!45134 () ValueCell!13727)

(declare-fun mapRest!45134 () (Array (_ BitVec 32) ValueCell!13727))

(declare-fun mapKey!45134 () (_ BitVec 32))

(assert (=> mapNonEmpty!45134 (= (arr!35948 _values!996) (store mapRest!45134 mapKey!45134 mapValue!45134))))

(declare-fun e!654532 () Bool)

(declare-fun lt!515057 () Bool)

(declare-fun b!1150799 () Bool)

(assert (=> b!1150799 (= e!654532 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!515057) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1150800 () Bool)

(declare-fun e!654535 () Bool)

(declare-fun e!654541 () Bool)

(assert (=> b!1150800 (= e!654535 e!654541)))

(declare-fun res!765394 () Bool)

(assert (=> b!1150800 (=> res!765394 e!654541)))

(assert (=> b!1150800 (= res!765394 (not (= from!1455 i!673)))))

(declare-fun lt!515070 () array!74595)

(declare-fun lt!515052 () ListLongMap!16367)

(assert (=> b!1150800 (= lt!515052 (getCurrentListMapNoExtraKeys!4671 lt!515055 lt!515070 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1150800 (= lt!515070 (array!74596 (store (arr!35948 _values!996) i!673 (ValueCellFull!13727 lt!515069)) (size!36484 _values!996)))))

(declare-fun dynLambda!2694 (Int (_ BitVec 64)) V!43625)

(assert (=> b!1150800 (= lt!515069 (dynLambda!2694 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1150800 (= lt!515064 (getCurrentListMapNoExtraKeys!4671 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!53655 () Bool)

(declare-fun call!53660 () Bool)

(assert (=> bm!53655 (= call!53663 call!53660)))

(declare-fun b!1150801 () Bool)

(declare-fun e!654537 () Bool)

(assert (=> b!1150801 (= e!654537 tp_is_empty!28873)))

(declare-fun c!113945 () Bool)

(declare-fun call!53662 () Unit!37847)

(declare-fun c!113947 () Bool)

(declare-fun bm!53656 () Bool)

(declare-fun addStillContains!867 (ListLongMap!16367 (_ BitVec 64) V!43625 (_ BitVec 64)) Unit!37847)

(assert (=> bm!53656 (= call!53662 (addStillContains!867 lt!515054 (ite (or c!113945 c!113947) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!113945 c!113947) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1150802 () Bool)

(assert (=> b!1150802 (= e!654543 e!654530)))

(declare-fun c!113946 () Bool)

(assert (=> b!1150802 (= c!113946 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!515057))))

(declare-fun b!1150803 () Bool)

(declare-fun res!765393 () Bool)

(assert (=> b!1150803 (=> (not res!765393) (not e!654536))))

(assert (=> b!1150803 (= res!765393 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36483 _keys!1208))))))

(declare-fun b!1150804 () Bool)

(declare-fun res!765396 () Bool)

(assert (=> b!1150804 (=> (not res!765396) (not e!654536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1150804 (= res!765396 (validMask!0 mask!1564))))

(declare-fun b!1150805 () Bool)

(declare-fun res!765389 () Bool)

(assert (=> b!1150805 (=> (not res!765389) (not e!654531))))

(declare-datatypes ((List!25147 0))(
  ( (Nil!25144) (Cons!25143 (h!26352 (_ BitVec 64)) (t!36482 List!25147)) )
))
(declare-fun arrayNoDuplicates!0 (array!74593 (_ BitVec 32) List!25147) Bool)

(assert (=> b!1150805 (= res!765389 (arrayNoDuplicates!0 lt!515055 #b00000000000000000000000000000000 Nil!25144))))

(declare-fun b!1150806 () Bool)

(declare-fun res!765392 () Bool)

(assert (=> b!1150806 (=> (not res!765392) (not e!654536))))

(assert (=> b!1150806 (= res!765392 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25144))))

(declare-fun bm!53657 () Bool)

(declare-fun call!53661 () ListLongMap!16367)

(assert (=> bm!53657 (= call!53661 (getCurrentListMapNoExtraKeys!4671 lt!515055 lt!515070 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!53664 () ListLongMap!16367)

(declare-fun bm!53658 () Bool)

(assert (=> bm!53658 (= call!53664 (+!3617 lt!515054 (ite (or c!113945 c!113947) (tuple2!18399 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18399 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1150807 () Bool)

(assert (=> b!1150807 (= e!654534 (= lt!515053 (getCurrentListMapNoExtraKeys!4671 lt!515055 lt!515070 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun bm!53659 () Bool)

(declare-fun call!53659 () ListLongMap!16367)

(assert (=> bm!53659 (= call!53659 (getCurrentListMapNoExtraKeys!4671 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1150808 () Bool)

(declare-fun res!765398 () Bool)

(assert (=> b!1150808 (=> (not res!765398) (not e!654536))))

(assert (=> b!1150808 (= res!765398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1150809 () Bool)

(declare-fun res!765386 () Bool)

(assert (=> b!1150809 (=> (not res!765386) (not e!654536))))

(assert (=> b!1150809 (= res!765386 (and (= (size!36484 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36483 _keys!1208) (size!36484 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1150810 () Bool)

(assert (=> b!1150810 (= e!654541 e!654542)))

(declare-fun res!765385 () Bool)

(assert (=> b!1150810 (=> res!765385 e!654542)))

(assert (=> b!1150810 (= res!765385 (not (= (select (arr!35947 _keys!1208) from!1455) k!934)))))

(declare-fun e!654539 () Bool)

(assert (=> b!1150810 e!654539))

(declare-fun c!113949 () Bool)

(assert (=> b!1150810 (= c!113949 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!515063 () Unit!37847)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!567 (array!74593 array!74595 (_ BitVec 32) (_ BitVec 32) V!43625 V!43625 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37847)

(assert (=> b!1150810 (= lt!515063 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!567 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!45134 () Bool)

(assert (=> mapIsEmpty!45134 mapRes!45134))

(declare-fun b!1150811 () Bool)

(assert (=> b!1150811 (= e!654544 (and e!654537 mapRes!45134))))

(declare-fun condMapEmpty!45134 () Bool)

(declare-fun mapDefault!45134 () ValueCell!13727)

