; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98582 () Bool)

(assert start!98582)

(declare-fun b_free!24187 () Bool)

(declare-fun b_next!24187 () Bool)

(assert (=> start!98582 (= b_free!24187 (not b_next!24187))))

(declare-fun tp!85271 () Bool)

(declare-fun b_and!39223 () Bool)

(assert (=> start!98582 (= tp!85271 b_and!39223)))

(declare-fun b!1143630 () Bool)

(declare-fun res!761903 () Bool)

(declare-fun e!650574 () Bool)

(assert (=> b!1143630 (=> (not res!761903) (not e!650574))))

(declare-datatypes ((array!74287 0))(
  ( (array!74288 (arr!35794 (Array (_ BitVec 32) (_ BitVec 64))) (size!36330 (_ BitVec 32))) )
))
(declare-fun lt!510101 () array!74287)

(declare-datatypes ((List!25003 0))(
  ( (Nil!25000) (Cons!24999 (h!26208 (_ BitVec 64)) (t!36182 List!25003)) )
))
(declare-fun arrayNoDuplicates!0 (array!74287 (_ BitVec 32) List!25003) Bool)

(assert (=> b!1143630 (= res!761903 (arrayNoDuplicates!0 lt!510101 #b00000000000000000000000000000000 Nil!25000))))

(declare-fun mapIsEmpty!44900 () Bool)

(declare-fun mapRes!44900 () Bool)

(assert (=> mapIsEmpty!44900 mapRes!44900))

(declare-fun _keys!1208 () array!74287)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun b!1143631 () Bool)

(declare-fun e!650576 () Bool)

(declare-fun arrayContainsKey!0 (array!74287 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1143631 (= e!650576 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1143632 () Bool)

(declare-fun e!650583 () Bool)

(declare-fun tp_is_empty!28717 () Bool)

(assert (=> b!1143632 (= e!650583 tp_is_empty!28717)))

(declare-fun b!1143633 () Bool)

(declare-fun e!650577 () Bool)

(declare-fun e!650572 () Bool)

(assert (=> b!1143633 (= e!650577 e!650572)))

(declare-fun res!761893 () Bool)

(assert (=> b!1143633 (=> res!761893 e!650572)))

(assert (=> b!1143633 (= res!761893 (not (= (select (arr!35794 _keys!1208) from!1455) k!934)))))

(declare-fun e!650571 () Bool)

(assert (=> b!1143633 e!650571))

(declare-fun c!112545 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1143633 (= c!112545 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!43417 0))(
  ( (V!43418 (val!14415 Int)) )
))
(declare-fun zeroValue!944 () V!43417)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((Unit!37532 0))(
  ( (Unit!37533) )
))
(declare-fun lt!510098 () Unit!37532)

(declare-datatypes ((ValueCell!13649 0))(
  ( (ValueCellFull!13649 (v!17052 V!43417)) (EmptyCell!13649) )
))
(declare-datatypes ((array!74289 0))(
  ( (array!74290 (arr!35795 (Array (_ BitVec 32) ValueCell!13649)) (size!36331 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74289)

(declare-fun minValue!944 () V!43417)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!513 (array!74287 array!74289 (_ BitVec 32) (_ BitVec 32) V!43417 V!43417 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37532)

(assert (=> b!1143633 (= lt!510098 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!513 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!650580 () Bool)

(declare-fun b!1143634 () Bool)

(assert (=> b!1143634 (= e!650580 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun c!112541 () Bool)

(declare-datatypes ((tuple2!18250 0))(
  ( (tuple2!18251 (_1!9136 (_ BitVec 64)) (_2!9136 V!43417)) )
))
(declare-datatypes ((List!25004 0))(
  ( (Nil!25001) (Cons!25000 (h!26209 tuple2!18250) (t!36183 List!25004)) )
))
(declare-datatypes ((ListLongMap!16219 0))(
  ( (ListLongMap!16220 (toList!8125 List!25004)) )
))
(declare-fun lt!510094 () ListLongMap!16219)

(declare-fun call!51789 () Unit!37532)

(declare-fun c!112542 () Bool)

(declare-fun bm!51783 () Bool)

(declare-fun addStillContains!810 (ListLongMap!16219 (_ BitVec 64) V!43417 (_ BitVec 64)) Unit!37532)

(assert (=> bm!51783 (= call!51789 (addStillContains!810 lt!510094 (ite (or c!112541 c!112542) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!112541 c!112542) zeroValue!944 minValue!944) k!934))))

(declare-fun b!1143635 () Bool)

(declare-fun lt!510090 () Bool)

(assert (=> b!1143635 (= c!112542 (and (not lt!510090) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!650568 () Unit!37532)

(declare-fun e!650575 () Unit!37532)

(assert (=> b!1143635 (= e!650568 e!650575)))

(declare-fun b!1143636 () Bool)

(declare-fun res!761900 () Bool)

(declare-fun e!650582 () Bool)

(assert (=> b!1143636 (=> (not res!761900) (not e!650582))))

(assert (=> b!1143636 (= res!761900 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36330 _keys!1208))))))

(declare-fun b!1143637 () Bool)

(declare-fun e!650581 () Bool)

(assert (=> b!1143637 (= e!650581 tp_is_empty!28717)))

(declare-fun b!1143638 () Bool)

(declare-fun e!650573 () Unit!37532)

(declare-fun Unit!37534 () Unit!37532)

(assert (=> b!1143638 (= e!650573 Unit!37534)))

(assert (=> b!1143638 (= lt!510090 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1143638 (= c!112541 (and (not lt!510090) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!510097 () Unit!37532)

(assert (=> b!1143638 (= lt!510097 e!650568)))

(declare-fun lt!510102 () Unit!37532)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!403 (array!74287 array!74289 (_ BitVec 32) (_ BitVec 32) V!43417 V!43417 (_ BitVec 64) (_ BitVec 32) Int) Unit!37532)

(assert (=> b!1143638 (= lt!510102 (lemmaListMapContainsThenArrayContainsFrom!403 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!112546 () Bool)

(assert (=> b!1143638 (= c!112546 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!761898 () Bool)

(assert (=> b!1143638 (= res!761898 e!650576)))

(assert (=> b!1143638 (=> (not res!761898) (not e!650580))))

(assert (=> b!1143638 e!650580))

(declare-fun lt!510085 () Unit!37532)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74287 (_ BitVec 32) (_ BitVec 32)) Unit!37532)

(assert (=> b!1143638 (= lt!510085 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1143638 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25000)))

(declare-fun lt!510087 () Unit!37532)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74287 (_ BitVec 64) (_ BitVec 32) List!25003) Unit!37532)

(assert (=> b!1143638 (= lt!510087 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25000))))

(assert (=> b!1143638 false))

(declare-fun b!1143639 () Bool)

(declare-fun res!761895 () Bool)

(assert (=> b!1143639 (=> (not res!761895) (not e!650582))))

(assert (=> b!1143639 (= res!761895 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25000))))

(declare-fun b!1143640 () Bool)

(assert (=> b!1143640 (= e!650576 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!510090) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1143641 () Bool)

(declare-fun res!761897 () Bool)

(assert (=> b!1143641 (=> (not res!761897) (not e!650582))))

(assert (=> b!1143641 (= res!761897 (= (select (arr!35794 _keys!1208) i!673) k!934))))

(declare-fun b!1143642 () Bool)

(declare-fun res!761891 () Bool)

(assert (=> b!1143642 (=> (not res!761891) (not e!650582))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1143642 (= res!761891 (validKeyInArray!0 k!934))))

(declare-fun b!1143643 () Bool)

(declare-fun call!51788 () ListLongMap!16219)

(declare-fun call!51786 () ListLongMap!16219)

(assert (=> b!1143643 (= e!650571 (= call!51788 call!51786))))

(declare-fun b!1143644 () Bool)

(declare-fun e!650578 () Bool)

(assert (=> b!1143644 (= e!650578 (and e!650581 mapRes!44900))))

(declare-fun condMapEmpty!44900 () Bool)

(declare-fun mapDefault!44900 () ValueCell!13649)

