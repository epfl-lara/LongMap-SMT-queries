; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98306 () Bool)

(assert start!98306)

(declare-fun b_free!23941 () Bool)

(declare-fun b_next!23941 () Bool)

(assert (=> start!98306 (= b_free!23941 (not b_next!23941))))

(declare-fun tp!84530 () Bool)

(declare-fun b_and!38713 () Bool)

(assert (=> start!98306 (= tp!84530 b_and!38713)))

(declare-fun mapIsEmpty!44528 () Bool)

(declare-fun mapRes!44528 () Bool)

(assert (=> mapIsEmpty!44528 mapRes!44528))

(declare-datatypes ((array!73801 0))(
  ( (array!73802 (arr!35552 (Array (_ BitVec 32) (_ BitVec 64))) (size!36088 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73801)

(declare-fun b!1132417 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun e!644488 () Bool)

(declare-fun arrayContainsKey!0 (array!73801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1132417 (= e!644488 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!48811 () Bool)

(declare-datatypes ((V!43089 0))(
  ( (V!43090 (val!14292 Int)) )
))
(declare-datatypes ((tuple2!18018 0))(
  ( (tuple2!18019 (_1!9020 (_ BitVec 64)) (_2!9020 V!43089)) )
))
(declare-datatypes ((List!24781 0))(
  ( (Nil!24778) (Cons!24777 (h!25986 tuple2!18018) (t!35714 List!24781)) )
))
(declare-datatypes ((ListLongMap!15987 0))(
  ( (ListLongMap!15988 (toList!8009 List!24781)) )
))
(declare-fun call!48817 () ListLongMap!15987)

(declare-fun call!48815 () ListLongMap!15987)

(assert (=> bm!48811 (= call!48817 call!48815)))

(declare-fun b!1132418 () Bool)

(declare-fun c!110417 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!503135 () Bool)

(assert (=> b!1132418 (= c!110417 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!503135))))

(declare-datatypes ((Unit!37107 0))(
  ( (Unit!37108) )
))
(declare-fun e!644489 () Unit!37107)

(declare-fun e!644496 () Unit!37107)

(assert (=> b!1132418 (= e!644489 e!644496)))

(declare-fun b!1132419 () Bool)

(declare-fun res!756293 () Bool)

(declare-fun e!644487 () Bool)

(assert (=> b!1132419 (=> (not res!756293) (not e!644487))))

(declare-datatypes ((List!24782 0))(
  ( (Nil!24779) (Cons!24778 (h!25987 (_ BitVec 64)) (t!35715 List!24782)) )
))
(declare-fun arrayNoDuplicates!0 (array!73801 (_ BitVec 32) List!24782) Bool)

(assert (=> b!1132419 (= res!756293 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24779))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!43089)

(declare-fun bm!48812 () Bool)

(declare-fun zeroValue!944 () V!43089)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun call!48814 () ListLongMap!15987)

(declare-datatypes ((ValueCell!13526 0))(
  ( (ValueCellFull!13526 (v!16928 V!43089)) (EmptyCell!13526) )
))
(declare-datatypes ((array!73803 0))(
  ( (array!73804 (arr!35553 (Array (_ BitVec 32) ValueCell!13526)) (size!36089 (_ BitVec 32))) )
))
(declare-fun lt!503130 () array!73803)

(declare-fun lt!503127 () array!73801)

(declare-fun getCurrentListMapNoExtraKeys!4496 (array!73801 array!73803 (_ BitVec 32) (_ BitVec 32) V!43089 V!43089 (_ BitVec 32) Int) ListLongMap!15987)

(assert (=> bm!48812 (= call!48814 (getCurrentListMapNoExtraKeys!4496 lt!503127 lt!503130 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!48819 () ListLongMap!15987)

(declare-fun _values!996 () array!73803)

(declare-fun bm!48813 () Bool)

(assert (=> bm!48813 (= call!48819 (getCurrentListMapNoExtraKeys!4496 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132420 () Bool)

(declare-fun e!644484 () Bool)

(declare-fun tp_is_empty!28471 () Bool)

(assert (=> b!1132420 (= e!644484 tp_is_empty!28471)))

(declare-fun bm!48814 () Bool)

(declare-fun call!48818 () Bool)

(declare-fun call!48816 () Bool)

(assert (=> bm!48814 (= call!48818 call!48816)))

(declare-fun lt!503134 () ListLongMap!15987)

(declare-fun bm!48815 () Bool)

(declare-fun c!110420 () Bool)

(declare-fun contains!6533 (ListLongMap!15987 (_ BitVec 64)) Bool)

(assert (=> bm!48815 (= call!48816 (contains!6533 (ite c!110420 lt!503134 call!48817) k!934))))

(declare-fun b!1132421 () Bool)

(declare-fun res!756296 () Bool)

(assert (=> b!1132421 (=> (not res!756296) (not e!644487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1132421 (= res!756296 (validMask!0 mask!1564))))

(declare-fun b!1132422 () Bool)

(declare-fun e!644485 () Unit!37107)

(assert (=> b!1132422 (= e!644485 e!644489)))

(declare-fun c!110419 () Bool)

(assert (=> b!1132422 (= c!110419 (and (not lt!503135) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!756295 () Bool)

(assert (=> start!98306 (=> (not res!756295) (not e!644487))))

(assert (=> start!98306 (= res!756295 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36088 _keys!1208))))))

(assert (=> start!98306 e!644487))

(assert (=> start!98306 tp_is_empty!28471))

(declare-fun array_inv!27270 (array!73801) Bool)

(assert (=> start!98306 (array_inv!27270 _keys!1208)))

(assert (=> start!98306 true))

(assert (=> start!98306 tp!84530))

(declare-fun e!644493 () Bool)

(declare-fun array_inv!27271 (array!73803) Bool)

(assert (=> start!98306 (and (array_inv!27271 _values!996) e!644493)))

(declare-fun b!1132423 () Bool)

(declare-fun lt!503131 () Unit!37107)

(assert (=> b!1132423 (= e!644496 lt!503131)))

(declare-fun call!48820 () Unit!37107)

(assert (=> b!1132423 (= lt!503131 call!48820)))

(assert (=> b!1132423 call!48818))

(declare-fun b!1132424 () Bool)

(declare-fun res!756297 () Bool)

(assert (=> b!1132424 (=> (not res!756297) (not e!644487))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1132424 (= res!756297 (validKeyInArray!0 k!934))))

(declare-fun b!1132425 () Bool)

(declare-fun e!644495 () Bool)

(declare-fun e!644491 () Bool)

(assert (=> b!1132425 (= e!644495 e!644491)))

(declare-fun res!756292 () Bool)

(assert (=> b!1132425 (=> res!756292 e!644491)))

(declare-fun lt!503138 () ListLongMap!15987)

(assert (=> b!1132425 (= res!756292 (not (contains!6533 lt!503138 k!934)))))

(assert (=> b!1132425 (= lt!503138 (getCurrentListMapNoExtraKeys!4496 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1132426 () Bool)

(assert (=> b!1132426 call!48818))

(declare-fun lt!503137 () Unit!37107)

(assert (=> b!1132426 (= lt!503137 call!48820)))

(assert (=> b!1132426 (= e!644489 lt!503137)))

(declare-fun b!1132427 () Bool)

(declare-fun e!644483 () Bool)

(assert (=> b!1132427 (= e!644483 tp_is_empty!28471)))

(declare-fun bm!48816 () Bool)

(declare-fun call!48821 () Unit!37107)

(assert (=> bm!48816 (= call!48820 call!48821)))

(declare-fun mapNonEmpty!44528 () Bool)

(declare-fun tp!84531 () Bool)

(assert (=> mapNonEmpty!44528 (= mapRes!44528 (and tp!84531 e!644483))))

(declare-fun mapValue!44528 () ValueCell!13526)

(declare-fun mapKey!44528 () (_ BitVec 32))

(declare-fun mapRest!44528 () (Array (_ BitVec 32) ValueCell!13526))

(assert (=> mapNonEmpty!44528 (= (arr!35553 _values!996) (store mapRest!44528 mapKey!44528 mapValue!44528))))

(declare-fun b!1132428 () Bool)

(declare-fun Unit!37109 () Unit!37107)

(assert (=> b!1132428 (= e!644496 Unit!37109)))

(declare-fun b!1132429 () Bool)

(declare-fun e!644492 () Bool)

(declare-fun e!644494 () Bool)

(assert (=> b!1132429 (= e!644492 e!644494)))

(declare-fun res!756289 () Bool)

(assert (=> b!1132429 (=> res!756289 e!644494)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1132429 (= res!756289 (not (= from!1455 i!673)))))

(declare-fun lt!503129 () ListLongMap!15987)

(assert (=> b!1132429 (= lt!503129 (getCurrentListMapNoExtraKeys!4496 lt!503127 lt!503130 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2566 (Int (_ BitVec 64)) V!43089)

(assert (=> b!1132429 (= lt!503130 (array!73804 (store (arr!35553 _values!996) i!673 (ValueCellFull!13526 (dynLambda!2566 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36089 _values!996)))))

(declare-fun lt!503133 () ListLongMap!15987)

(assert (=> b!1132429 (= lt!503133 (getCurrentListMapNoExtraKeys!4496 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!48817 () Bool)

(declare-fun addStillContains!715 (ListLongMap!15987 (_ BitVec 64) V!43089 (_ BitVec 64)) Unit!37107)

(assert (=> bm!48817 (= call!48821 (addStillContains!715 (ite c!110420 lt!503134 lt!503138) (ite c!110420 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!110419 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!110420 minValue!944 (ite c!110419 zeroValue!944 minValue!944)) k!934))))

(declare-fun b!1132430 () Bool)

(assert (=> b!1132430 (= e!644493 (and e!644484 mapRes!44528))))

(declare-fun condMapEmpty!44528 () Bool)

(declare-fun mapDefault!44528 () ValueCell!13526)

