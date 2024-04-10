; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98970 () Bool)

(assert start!98970)

(declare-fun b_free!24575 () Bool)

(declare-fun b_next!24575 () Bool)

(assert (=> start!98970 (= b_free!24575 (not b_next!24575))))

(declare-fun tp!86436 () Bool)

(declare-fun b_and!39999 () Bool)

(assert (=> start!98970 (= tp!86436 b_and!39999)))

(declare-datatypes ((V!43933 0))(
  ( (V!43934 (val!14609 Int)) )
))
(declare-fun zeroValue!944 () V!43933)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!75049 0))(
  ( (array!75050 (arr!36175 (Array (_ BitVec 32) (_ BitVec 64))) (size!36711 (_ BitVec 32))) )
))
(declare-fun lt!522724 () array!75049)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun e!660458 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!43933)

(declare-fun b!1161462 () Bool)

(declare-datatypes ((ValueCell!13843 0))(
  ( (ValueCellFull!13843 (v!17246 V!43933)) (EmptyCell!13843) )
))
(declare-datatypes ((array!75051 0))(
  ( (array!75052 (arr!36176 (Array (_ BitVec 32) ValueCell!13843)) (size!36712 (_ BitVec 32))) )
))
(declare-fun lt!522728 () array!75051)

(declare-datatypes ((tuple2!18614 0))(
  ( (tuple2!18615 (_1!9318 (_ BitVec 64)) (_2!9318 V!43933)) )
))
(declare-datatypes ((List!25350 0))(
  ( (Nil!25347) (Cons!25346 (h!26555 tuple2!18614) (t!36917 List!25350)) )
))
(declare-datatypes ((ListLongMap!16583 0))(
  ( (ListLongMap!16584 (toList!8307 List!25350)) )
))
(declare-fun lt!522709 () ListLongMap!16583)

(declare-fun getCurrentListMapNoExtraKeys!4771 (array!75049 array!75051 (_ BitVec 32) (_ BitVec 32) V!43933 V!43933 (_ BitVec 32) Int) ListLongMap!16583)

(assert (=> b!1161462 (= e!660458 (= lt!522709 (getCurrentListMapNoExtraKeys!4771 lt!522724 lt!522728 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun c!116035 () Bool)

(declare-fun bm!56439 () Bool)

(declare-fun lt!522718 () ListLongMap!16583)

(declare-fun c!116038 () Bool)

(declare-fun call!56449 () ListLongMap!16583)

(declare-fun lt!522725 () ListLongMap!16583)

(declare-fun +!3711 (ListLongMap!16583 tuple2!18614) ListLongMap!16583)

(assert (=> bm!56439 (= call!56449 (+!3711 (ite c!116038 lt!522725 lt!522718) (ite c!116038 (tuple2!18615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!116035 (tuple2!18615 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18615 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1161463 () Bool)

(declare-fun lt!522708 () Bool)

(assert (=> b!1161463 (= c!116035 (and (not lt!522708) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!38305 0))(
  ( (Unit!38306) )
))
(declare-fun e!660460 () Unit!38305)

(declare-fun e!660447 () Unit!38305)

(assert (=> b!1161463 (= e!660460 e!660447)))

(declare-fun _keys!1208 () array!75049)

(declare-fun bm!56440 () Bool)

(declare-fun call!56445 () ListLongMap!16583)

(declare-fun _values!996 () array!75051)

(assert (=> bm!56440 (= call!56445 (getCurrentListMapNoExtraKeys!4771 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!770618 () Bool)

(declare-fun e!660452 () Bool)

(assert (=> start!98970 (=> (not res!770618) (not e!660452))))

(assert (=> start!98970 (= res!770618 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36711 _keys!1208))))))

(assert (=> start!98970 e!660452))

(declare-fun tp_is_empty!29105 () Bool)

(assert (=> start!98970 tp_is_empty!29105))

(declare-fun array_inv!27678 (array!75049) Bool)

(assert (=> start!98970 (array_inv!27678 _keys!1208)))

(assert (=> start!98970 true))

(assert (=> start!98970 tp!86436))

(declare-fun e!660453 () Bool)

(declare-fun array_inv!27679 (array!75051) Bool)

(assert (=> start!98970 (and (array_inv!27679 _values!996) e!660453)))

(declare-fun call!56448 () Unit!38305)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun bm!56441 () Bool)

(declare-fun addStillContains!953 (ListLongMap!16583 (_ BitVec 64) V!43933 (_ BitVec 64)) Unit!38305)

(assert (=> bm!56441 (= call!56448 (addStillContains!953 (ite c!116038 lt!522725 lt!522718) (ite c!116038 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!116035 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!116038 minValue!944 (ite c!116035 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1161464 () Bool)

(declare-fun e!660446 () Bool)

(declare-fun arrayContainsKey!0 (array!75049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1161464 (= e!660446 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun e!660459 () Bool)

(declare-fun b!1161465 () Bool)

(assert (=> b!1161465 (= e!660459 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun mapIsEmpty!45482 () Bool)

(declare-fun mapRes!45482 () Bool)

(assert (=> mapIsEmpty!45482 mapRes!45482))

(declare-fun b!1161466 () Bool)

(assert (=> b!1161466 (= e!660459 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!522708) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun call!56446 () ListLongMap!16583)

(declare-fun bm!56442 () Bool)

(declare-fun call!56442 () Bool)

(declare-fun contains!6812 (ListLongMap!16583 (_ BitVec 64)) Bool)

(assert (=> bm!56442 (= call!56442 (contains!6812 (ite c!116038 lt!522725 call!56446) k!934))))

(declare-fun mapNonEmpty!45482 () Bool)

(declare-fun tp!86435 () Bool)

(declare-fun e!660456 () Bool)

(assert (=> mapNonEmpty!45482 (= mapRes!45482 (and tp!86435 e!660456))))

(declare-fun mapKey!45482 () (_ BitVec 32))

(declare-fun mapValue!45482 () ValueCell!13843)

(declare-fun mapRest!45482 () (Array (_ BitVec 32) ValueCell!13843))

(assert (=> mapNonEmpty!45482 (= (arr!36176 _values!996) (store mapRest!45482 mapKey!45482 mapValue!45482))))

(declare-fun b!1161467 () Bool)

(declare-fun e!660450 () Bool)

(assert (=> b!1161467 (= e!660450 tp_is_empty!29105)))

(declare-fun b!1161468 () Bool)

(declare-fun res!770614 () Bool)

(assert (=> b!1161468 (=> (not res!770614) (not e!660452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1161468 (= res!770614 (validMask!0 mask!1564))))

(declare-fun b!1161469 () Bool)

(declare-fun res!770617 () Bool)

(assert (=> b!1161469 (=> (not res!770617) (not e!660452))))

(assert (=> b!1161469 (= res!770617 (and (= (size!36712 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36711 _keys!1208) (size!36712 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1161470 () Bool)

(declare-fun e!660448 () Bool)

(declare-fun e!660454 () Bool)

(assert (=> b!1161470 (= e!660448 (not e!660454))))

(declare-fun res!770607 () Bool)

(assert (=> b!1161470 (=> res!770607 e!660454)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1161470 (= res!770607 (bvsgt from!1455 i!673))))

(assert (=> b!1161470 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!522715 () Unit!38305)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75049 (_ BitVec 64) (_ BitVec 32)) Unit!38305)

(assert (=> b!1161470 (= lt!522715 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1161471 () Bool)

(declare-fun e!660462 () Unit!38305)

(assert (=> b!1161471 (= e!660447 e!660462)))

(declare-fun c!116036 () Bool)

(assert (=> b!1161471 (= c!116036 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!522708))))

(declare-fun b!1161472 () Bool)

(declare-fun res!770610 () Bool)

(assert (=> b!1161472 (=> (not res!770610) (not e!660452))))

(assert (=> b!1161472 (= res!770610 (= (select (arr!36175 _keys!1208) i!673) k!934))))

(declare-fun bm!56443 () Bool)

(assert (=> bm!56443 (= call!56446 call!56449)))

(declare-fun b!1161473 () Bool)

(assert (=> b!1161473 (= e!660453 (and e!660450 mapRes!45482))))

(declare-fun condMapEmpty!45482 () Bool)

(declare-fun mapDefault!45482 () ValueCell!13843)

