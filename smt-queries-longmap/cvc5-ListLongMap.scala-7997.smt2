; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98822 () Bool)

(assert start!98822)

(declare-fun b_free!24427 () Bool)

(declare-fun b_next!24427 () Bool)

(assert (=> start!98822 (= b_free!24427 (not b_next!24427))))

(declare-fun tp!85992 () Bool)

(declare-fun b_and!39703 () Bool)

(assert (=> start!98822 (= tp!85992 b_and!39703)))

(declare-fun b!1154654 () Bool)

(declare-fun c!114702 () Bool)

(declare-fun lt!517845 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1154654 (= c!114702 (and (not lt!517845) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!38012 0))(
  ( (Unit!38013) )
))
(declare-fun e!656686 () Unit!38012)

(declare-fun e!656674 () Unit!38012)

(assert (=> b!1154654 (= e!656686 e!656674)))

(declare-fun b!1154655 () Bool)

(declare-fun res!767278 () Bool)

(declare-fun e!656678 () Bool)

(assert (=> b!1154655 (=> (not res!767278) (not e!656678))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((array!74761 0))(
  ( (array!74762 (arr!36031 (Array (_ BitVec 32) (_ BitVec 64))) (size!36567 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74761)

(assert (=> b!1154655 (= res!767278 (= (select (arr!36031 _keys!1208) i!673) k!934))))

(declare-fun b!1154656 () Bool)

(declare-fun res!767279 () Bool)

(declare-fun e!656682 () Bool)

(assert (=> b!1154656 (=> (not res!767279) (not e!656682))))

(declare-fun lt!517828 () array!74761)

(declare-datatypes ((List!25222 0))(
  ( (Nil!25219) (Cons!25218 (h!26427 (_ BitVec 64)) (t!36641 List!25222)) )
))
(declare-fun arrayNoDuplicates!0 (array!74761 (_ BitVec 32) List!25222) Bool)

(assert (=> b!1154656 (= res!767279 (arrayNoDuplicates!0 lt!517828 #b00000000000000000000000000000000 Nil!25219))))

(declare-fun b!1154657 () Bool)

(declare-fun e!656679 () Bool)

(assert (=> b!1154657 (= e!656679 true)))

(declare-fun e!656673 () Bool)

(assert (=> b!1154657 e!656673))

(declare-fun res!767287 () Bool)

(assert (=> b!1154657 (=> (not res!767287) (not e!656673))))

(declare-datatypes ((V!43737 0))(
  ( (V!43738 (val!14535 Int)) )
))
(declare-datatypes ((tuple2!18478 0))(
  ( (tuple2!18479 (_1!9250 (_ BitVec 64)) (_2!9250 V!43737)) )
))
(declare-datatypes ((List!25223 0))(
  ( (Nil!25220) (Cons!25219 (h!26428 tuple2!18478) (t!36642 List!25223)) )
))
(declare-datatypes ((ListLongMap!16447 0))(
  ( (ListLongMap!16448 (toList!8239 List!25223)) )
))
(declare-fun lt!517843 () ListLongMap!16447)

(declare-fun lt!517826 () ListLongMap!16447)

(assert (=> b!1154657 (= res!767287 (= lt!517843 lt!517826))))

(declare-fun lt!517834 () ListLongMap!16447)

(declare-fun -!1359 (ListLongMap!16447 (_ BitVec 64)) ListLongMap!16447)

(assert (=> b!1154657 (= lt!517843 (-!1359 lt!517834 k!934))))

(declare-fun lt!517824 () V!43737)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun +!3652 (ListLongMap!16447 tuple2!18478) ListLongMap!16447)

(assert (=> b!1154657 (= (-!1359 (+!3652 lt!517826 (tuple2!18479 (select (arr!36031 _keys!1208) from!1455) lt!517824)) (select (arr!36031 _keys!1208) from!1455)) lt!517826)))

(declare-fun lt!517825 () Unit!38012)

(declare-fun addThenRemoveForNewKeyIsSame!199 (ListLongMap!16447 (_ BitVec 64) V!43737) Unit!38012)

(assert (=> b!1154657 (= lt!517825 (addThenRemoveForNewKeyIsSame!199 lt!517826 (select (arr!36031 _keys!1208) from!1455) lt!517824))))

(declare-datatypes ((ValueCell!13769 0))(
  ( (ValueCellFull!13769 (v!17172 V!43737)) (EmptyCell!13769) )
))
(declare-datatypes ((array!74763 0))(
  ( (array!74764 (arr!36032 (Array (_ BitVec 32) ValueCell!13769)) (size!36568 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74763)

(declare-fun lt!517835 () V!43737)

(declare-fun get!18355 (ValueCell!13769 V!43737) V!43737)

(assert (=> b!1154657 (= lt!517824 (get!18355 (select (arr!36032 _values!996) from!1455) lt!517835))))

(declare-fun lt!517831 () Unit!38012)

(declare-fun e!656680 () Unit!38012)

(assert (=> b!1154657 (= lt!517831 e!656680)))

(declare-fun c!114703 () Bool)

(declare-fun contains!6752 (ListLongMap!16447 (_ BitVec 64)) Bool)

(assert (=> b!1154657 (= c!114703 (contains!6752 lt!517826 k!934))))

(declare-fun zeroValue!944 () V!43737)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43737)

(declare-fun getCurrentListMapNoExtraKeys!4708 (array!74761 array!74763 (_ BitVec 32) (_ BitVec 32) V!43737 V!43737 (_ BitVec 32) Int) ListLongMap!16447)

(assert (=> b!1154657 (= lt!517826 (getCurrentListMapNoExtraKeys!4708 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!54663 () Bool)

(declare-fun call!54666 () Unit!38012)

(declare-fun call!54668 () Unit!38012)

(assert (=> bm!54663 (= call!54666 call!54668)))

(declare-fun b!1154658 () Bool)

(declare-fun e!656683 () Bool)

(declare-fun tp_is_empty!28957 () Bool)

(assert (=> b!1154658 (= e!656683 tp_is_empty!28957)))

(declare-fun b!1154659 () Bool)

(declare-fun Unit!38014 () Unit!38012)

(assert (=> b!1154659 (= e!656680 Unit!38014)))

(declare-fun call!54671 () ListLongMap!16447)

(declare-fun b!1154660 () Bool)

(declare-fun call!54672 () ListLongMap!16447)

(declare-fun e!656685 () Bool)

(assert (=> b!1154660 (= e!656685 (= call!54672 (-!1359 call!54671 k!934)))))

(declare-fun b!1154661 () Bool)

(declare-fun res!767288 () Bool)

(assert (=> b!1154661 (=> (not res!767288) (not e!656678))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1154661 (= res!767288 (validKeyInArray!0 k!934))))

(declare-fun e!656681 () Bool)

(declare-fun b!1154662 () Bool)

(assert (=> b!1154662 (= e!656681 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!517845) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1154663 () Bool)

(declare-fun call!54670 () Bool)

(assert (=> b!1154663 call!54670))

(declare-fun lt!517832 () Unit!38012)

(assert (=> b!1154663 (= lt!517832 call!54666)))

(declare-fun e!656675 () Unit!38012)

(assert (=> b!1154663 (= e!656675 lt!517832)))

(declare-fun b!1154664 () Bool)

(declare-fun res!767283 () Bool)

(assert (=> b!1154664 (=> (not res!767283) (not e!656678))))

(assert (=> b!1154664 (= res!767283 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25219))))

(declare-fun b!1154665 () Bool)

(declare-fun res!767284 () Bool)

(assert (=> b!1154665 (=> (not res!767284) (not e!656678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1154665 (= res!767284 (validMask!0 mask!1564))))

(declare-fun res!767282 () Bool)

(assert (=> start!98822 (=> (not res!767282) (not e!656678))))

(assert (=> start!98822 (= res!767282 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36567 _keys!1208))))))

(assert (=> start!98822 e!656678))

(assert (=> start!98822 tp_is_empty!28957))

(declare-fun array_inv!27576 (array!74761) Bool)

(assert (=> start!98822 (array_inv!27576 _keys!1208)))

(assert (=> start!98822 true))

(assert (=> start!98822 tp!85992))

(declare-fun e!656676 () Bool)

(declare-fun array_inv!27577 (array!74763) Bool)

(assert (=> start!98822 (and (array_inv!27577 _values!996) e!656676)))

(declare-fun b!1154666 () Bool)

(declare-fun Unit!38015 () Unit!38012)

(assert (=> b!1154666 (= e!656675 Unit!38015)))

(declare-fun bm!54664 () Bool)

(declare-fun call!54667 () ListLongMap!16447)

(declare-fun call!54673 () ListLongMap!16447)

(assert (=> bm!54664 (= call!54667 call!54673)))

(declare-fun b!1154667 () Bool)

(assert (=> b!1154667 (= e!656678 e!656682)))

(declare-fun res!767285 () Bool)

(assert (=> b!1154667 (=> (not res!767285) (not e!656682))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74761 (_ BitVec 32)) Bool)

(assert (=> b!1154667 (= res!767285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!517828 mask!1564))))

(assert (=> b!1154667 (= lt!517828 (array!74762 (store (arr!36031 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36567 _keys!1208)))))

(declare-fun b!1154668 () Bool)

(declare-fun res!767280 () Bool)

(assert (=> b!1154668 (=> (not res!767280) (not e!656678))))

(assert (=> b!1154668 (= res!767280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1154669 () Bool)

(declare-fun e!656677 () Bool)

(declare-fun e!656688 () Bool)

(assert (=> b!1154669 (= e!656677 e!656688)))

(declare-fun res!767275 () Bool)

(assert (=> b!1154669 (=> res!767275 e!656688)))

(assert (=> b!1154669 (= res!767275 (not (= from!1455 i!673)))))

(declare-fun lt!517842 () array!74763)

(declare-fun lt!517829 () ListLongMap!16447)

(assert (=> b!1154669 (= lt!517829 (getCurrentListMapNoExtraKeys!4708 lt!517828 lt!517842 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1154669 (= lt!517842 (array!74764 (store (arr!36032 _values!996) i!673 (ValueCellFull!13769 lt!517835)) (size!36568 _values!996)))))

(declare-fun dynLambda!2720 (Int (_ BitVec 64)) V!43737)

(assert (=> b!1154669 (= lt!517835 (dynLambda!2720 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1154669 (= lt!517834 (getCurrentListMapNoExtraKeys!4708 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1154670 () Bool)

(declare-fun lt!517827 () Unit!38012)

(assert (=> b!1154670 (= e!656674 lt!517827)))

(assert (=> b!1154670 (= lt!517827 call!54666)))

(assert (=> b!1154670 call!54670))

(declare-fun bm!54665 () Bool)

(assert (=> bm!54665 (= call!54671 (getCurrentListMapNoExtraKeys!4708 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1154671 () Bool)

(declare-fun arrayContainsKey!0 (array!74761 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1154671 (= e!656681 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1154672 () Bool)

(assert (=> b!1154672 (= e!656682 (not e!656677))))

(declare-fun res!767274 () Bool)

(assert (=> b!1154672 (=> res!767274 e!656677)))

(assert (=> b!1154672 (= res!767274 (bvsgt from!1455 i!673))))

(assert (=> b!1154672 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!517844 () Unit!38012)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74761 (_ BitVec 64) (_ BitVec 32)) Unit!38012)

(assert (=> b!1154672 (= lt!517844 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1154673 () Bool)

(declare-fun res!767286 () Bool)

(assert (=> b!1154673 (=> (not res!767286) (not e!656678))))

(assert (=> b!1154673 (= res!767286 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36567 _keys!1208))))))

(declare-fun b!1154674 () Bool)

(declare-fun mapRes!45260 () Bool)

(assert (=> b!1154674 (= e!656676 (and e!656683 mapRes!45260))))

(declare-fun condMapEmpty!45260 () Bool)

(declare-fun mapDefault!45260 () ValueCell!13769)

