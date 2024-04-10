; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98900 () Bool)

(assert start!98900)

(declare-fun b_free!24505 () Bool)

(declare-fun b_next!24505 () Bool)

(assert (=> start!98900 (= b_free!24505 (not b_next!24505))))

(declare-fun tp!86226 () Bool)

(declare-fun b_and!39859 () Bool)

(assert (=> start!98900 (= tp!86226 b_and!39859)))

(declare-datatypes ((V!43841 0))(
  ( (V!43842 (val!14574 Int)) )
))
(declare-fun zeroValue!944 () V!43841)

(declare-datatypes ((ValueCell!13808 0))(
  ( (ValueCellFull!13808 (v!17211 V!43841)) (EmptyCell!13808) )
))
(declare-datatypes ((array!74913 0))(
  ( (array!74914 (arr!36107 (Array (_ BitVec 32) ValueCell!13808)) (size!36643 (_ BitVec 32))) )
))
(declare-fun lt!520407 () array!74913)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!55599 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!18550 0))(
  ( (tuple2!18551 (_1!9286 (_ BitVec 64)) (_2!9286 V!43841)) )
))
(declare-datatypes ((List!25289 0))(
  ( (Nil!25286) (Cons!25285 (h!26494 tuple2!18550) (t!36786 List!25289)) )
))
(declare-datatypes ((ListLongMap!16519 0))(
  ( (ListLongMap!16520 (toList!8275 List!25289)) )
))
(declare-fun call!55608 () ListLongMap!16519)

(declare-fun minValue!944 () V!43841)

(declare-datatypes ((array!74915 0))(
  ( (array!74916 (arr!36108 (Array (_ BitVec 32) (_ BitVec 64))) (size!36644 (_ BitVec 32))) )
))
(declare-fun lt!520413 () array!74915)

(declare-fun getCurrentListMapNoExtraKeys!4740 (array!74915 array!74913 (_ BitVec 32) (_ BitVec 32) V!43841 V!43841 (_ BitVec 32) Int) ListLongMap!16519)

(assert (=> bm!55599 (= call!55608 (getCurrentListMapNoExtraKeys!4740 lt!520413 lt!520407 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158242 () Bool)

(declare-fun res!769041 () Bool)

(declare-fun e!658674 () Bool)

(assert (=> b!1158242 (=> (not res!769041) (not e!658674))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!74915)

(assert (=> b!1158242 (= res!769041 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36644 _keys!1208))))))

(declare-fun lt!520408 () ListLongMap!16519)

(declare-fun bm!55600 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun c!115403 () Bool)

(declare-datatypes ((Unit!38162 0))(
  ( (Unit!38163) )
))
(declare-fun call!55609 () Unit!38162)

(declare-fun c!115406 () Bool)

(declare-fun addStillContains!926 (ListLongMap!16519 (_ BitVec 64) V!43841 (_ BitVec 64)) Unit!38162)

(assert (=> bm!55600 (= call!55609 (addStillContains!926 lt!520408 (ite (or c!115406 c!115403) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!115406 c!115403) zeroValue!944 minValue!944) k!934))))

(declare-fun res!769039 () Bool)

(assert (=> start!98900 (=> (not res!769039) (not e!658674))))

(assert (=> start!98900 (= res!769039 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36644 _keys!1208))))))

(assert (=> start!98900 e!658674))

(declare-fun tp_is_empty!29035 () Bool)

(assert (=> start!98900 tp_is_empty!29035))

(declare-fun array_inv!27630 (array!74915) Bool)

(assert (=> start!98900 (array_inv!27630 _keys!1208)))

(assert (=> start!98900 true))

(assert (=> start!98900 tp!86226))

(declare-fun _values!996 () array!74913)

(declare-fun e!658663 () Bool)

(declare-fun array_inv!27631 (array!74913) Bool)

(assert (=> start!98900 (and (array_inv!27631 _values!996) e!658663)))

(declare-fun b!1158243 () Bool)

(declare-fun e!658667 () Unit!38162)

(declare-fun Unit!38164 () Unit!38162)

(assert (=> b!1158243 (= e!658667 Unit!38164)))

(declare-fun lt!520406 () Bool)

(assert (=> b!1158243 (= lt!520406 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (=> b!1158243 (= c!115406 (and (not lt!520406) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!520405 () Unit!38162)

(declare-fun e!658672 () Unit!38162)

(assert (=> b!1158243 (= lt!520405 e!658672)))

(declare-fun lt!520418 () Unit!38162)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!512 (array!74915 array!74913 (_ BitVec 32) (_ BitVec 32) V!43841 V!43841 (_ BitVec 64) (_ BitVec 32) Int) Unit!38162)

(assert (=> b!1158243 (= lt!520418 (lemmaListMapContainsThenArrayContainsFrom!512 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun c!115407 () Bool)

(assert (=> b!1158243 (= c!115407 (and (not (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!769034 () Bool)

(declare-fun e!658661 () Bool)

(assert (=> b!1158243 (= res!769034 e!658661)))

(declare-fun e!658675 () Bool)

(assert (=> b!1158243 (=> (not res!769034) (not e!658675))))

(assert (=> b!1158243 e!658675))

(declare-fun lt!520401 () Unit!38162)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!74915 (_ BitVec 32) (_ BitVec 32)) Unit!38162)

(assert (=> b!1158243 (= lt!520401 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25290 0))(
  ( (Nil!25287) (Cons!25286 (h!26495 (_ BitVec 64)) (t!36787 List!25290)) )
))
(declare-fun arrayNoDuplicates!0 (array!74915 (_ BitVec 32) List!25290) Bool)

(assert (=> b!1158243 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25287)))

(declare-fun lt!520398 () Unit!38162)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!74915 (_ BitVec 64) (_ BitVec 32) List!25290) Unit!38162)

(assert (=> b!1158243 (= lt!520398 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25287))))

(assert (=> b!1158243 false))

(declare-fun b!1158244 () Bool)

(declare-fun Unit!38165 () Unit!38162)

(assert (=> b!1158244 (= e!658667 Unit!38165)))

(declare-fun b!1158245 () Bool)

(declare-fun res!769038 () Bool)

(assert (=> b!1158245 (=> (not res!769038) (not e!658674))))

(assert (=> b!1158245 (= res!769038 (and (= (size!36643 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36644 _keys!1208) (size!36643 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!55601 () Bool)

(declare-fun call!55603 () Bool)

(declare-fun call!55604 () Bool)

(assert (=> bm!55601 (= call!55603 call!55604)))

(declare-fun call!55602 () ListLongMap!16519)

(declare-fun lt!520415 () ListLongMap!16519)

(declare-fun bm!55602 () Bool)

(declare-fun contains!6785 (ListLongMap!16519 (_ BitVec 64)) Bool)

(assert (=> bm!55602 (= call!55604 (contains!6785 (ite c!115406 lt!520415 call!55602) k!934))))

(declare-fun b!1158246 () Bool)

(declare-fun e!658670 () Unit!38162)

(declare-fun Unit!38166 () Unit!38162)

(assert (=> b!1158246 (= e!658670 Unit!38166)))

(declare-fun b!1158247 () Bool)

(declare-fun arrayContainsKey!0 (array!74915 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1158247 (= e!658661 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1158248 () Bool)

(declare-fun res!769035 () Bool)

(assert (=> b!1158248 (=> (not res!769035) (not e!658674))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74915 (_ BitVec 32)) Bool)

(assert (=> b!1158248 (= res!769035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1158249 () Bool)

(assert (=> b!1158249 (= e!658661 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!520406) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun call!55606 () ListLongMap!16519)

(declare-fun bm!55603 () Bool)

(assert (=> bm!55603 (= call!55606 (getCurrentListMapNoExtraKeys!4740 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158250 () Bool)

(declare-fun +!3685 (ListLongMap!16519 tuple2!18550) ListLongMap!16519)

(assert (=> b!1158250 (contains!6785 (+!3685 lt!520415 (tuple2!18551 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)) k!934)))

(declare-fun lt!520399 () Unit!38162)

(assert (=> b!1158250 (= lt!520399 (addStillContains!926 lt!520415 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k!934))))

(assert (=> b!1158250 call!55604))

(declare-fun call!55605 () ListLongMap!16519)

(assert (=> b!1158250 (= lt!520415 call!55605)))

(declare-fun lt!520411 () Unit!38162)

(assert (=> b!1158250 (= lt!520411 call!55609)))

(assert (=> b!1158250 (= e!658672 lt!520399)))

(declare-fun b!1158251 () Bool)

(declare-fun e!658669 () Bool)

(assert (=> b!1158251 (= e!658669 tp_is_empty!29035)))

(declare-fun b!1158252 () Bool)

(declare-fun e!658676 () Bool)

(assert (=> b!1158252 (= e!658676 true)))

(declare-fun e!658665 () Bool)

(assert (=> b!1158252 e!658665))

(declare-fun res!769032 () Bool)

(assert (=> b!1158252 (=> (not res!769032) (not e!658665))))

(declare-fun lt!520400 () ListLongMap!16519)

(assert (=> b!1158252 (= res!769032 (= lt!520400 lt!520408))))

(declare-fun lt!520410 () ListLongMap!16519)

(declare-fun -!1388 (ListLongMap!16519 (_ BitVec 64)) ListLongMap!16519)

(assert (=> b!1158252 (= lt!520400 (-!1388 lt!520410 k!934))))

(declare-fun lt!520403 () V!43841)

(assert (=> b!1158252 (= (-!1388 (+!3685 lt!520408 (tuple2!18551 (select (arr!36108 _keys!1208) from!1455) lt!520403)) (select (arr!36108 _keys!1208) from!1455)) lt!520408)))

(declare-fun lt!520417 () Unit!38162)

(declare-fun addThenRemoveForNewKeyIsSame!225 (ListLongMap!16519 (_ BitVec 64) V!43841) Unit!38162)

(assert (=> b!1158252 (= lt!520417 (addThenRemoveForNewKeyIsSame!225 lt!520408 (select (arr!36108 _keys!1208) from!1455) lt!520403))))

(declare-fun lt!520409 () V!43841)

(declare-fun get!18407 (ValueCell!13808 V!43841) V!43841)

(assert (=> b!1158252 (= lt!520403 (get!18407 (select (arr!36107 _values!996) from!1455) lt!520409))))

(declare-fun lt!520404 () Unit!38162)

(assert (=> b!1158252 (= lt!520404 e!658667)))

(declare-fun c!115404 () Bool)

(assert (=> b!1158252 (= c!115404 (contains!6785 lt!520408 k!934))))

(assert (=> b!1158252 (= lt!520408 (getCurrentListMapNoExtraKeys!4740 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1158253 () Bool)

(declare-fun e!658662 () Bool)

(assert (=> b!1158253 (= e!658662 tp_is_empty!29035)))

(declare-fun b!1158254 () Bool)

(declare-fun e!658677 () Unit!38162)

(assert (=> b!1158254 (= e!658677 e!658670)))

(declare-fun c!115405 () Bool)

(assert (=> b!1158254 (= c!115405 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!520406))))

(declare-fun b!1158255 () Bool)

(declare-fun res!769037 () Bool)

(declare-fun e!658664 () Bool)

(assert (=> b!1158255 (=> (not res!769037) (not e!658664))))

(assert (=> b!1158255 (= res!769037 (arrayNoDuplicates!0 lt!520413 #b00000000000000000000000000000000 Nil!25287))))

(declare-fun b!1158256 () Bool)

(declare-fun e!658668 () Bool)

(assert (=> b!1158256 (= e!658668 (= call!55608 call!55606))))

(declare-fun b!1158257 () Bool)

(declare-fun mapRes!45377 () Bool)

(assert (=> b!1158257 (= e!658663 (and e!658662 mapRes!45377))))

(declare-fun condMapEmpty!45377 () Bool)

(declare-fun mapDefault!45377 () ValueCell!13808)

