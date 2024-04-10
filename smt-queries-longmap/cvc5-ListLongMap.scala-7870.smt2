; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97964 () Bool)

(assert start!97964)

(declare-fun b_free!23665 () Bool)

(declare-fun b_next!23665 () Bool)

(assert (=> start!97964 (= b_free!23665 (not b_next!23665))))

(declare-fun tp!83698 () Bool)

(declare-fun b_and!38113 () Bool)

(assert (=> start!97964 (= tp!83698 b_and!38113)))

(declare-fun b!1123021 () Bool)

(declare-fun res!750291 () Bool)

(declare-fun e!639357 () Bool)

(assert (=> b!1123021 (=> (not res!750291) (not e!639357))))

(declare-datatypes ((array!73263 0))(
  ( (array!73264 (arr!35284 (Array (_ BitVec 32) (_ BitVec 64))) (size!35820 (_ BitVec 32))) )
))
(declare-fun lt!498935 () array!73263)

(declare-datatypes ((List!24555 0))(
  ( (Nil!24552) (Cons!24551 (h!25760 (_ BitVec 64)) (t!35212 List!24555)) )
))
(declare-fun arrayNoDuplicates!0 (array!73263 (_ BitVec 32) List!24555) Bool)

(assert (=> b!1123021 (= res!750291 (arrayNoDuplicates!0 lt!498935 #b00000000000000000000000000000000 Nil!24552))))

(declare-fun b!1123022 () Bool)

(declare-fun e!639356 () Bool)

(declare-fun tp_is_empty!28195 () Bool)

(assert (=> b!1123022 (= e!639356 tp_is_empty!28195)))

(declare-fun b!1123023 () Bool)

(declare-fun res!750289 () Bool)

(declare-fun e!639350 () Bool)

(assert (=> b!1123023 (=> (not res!750289) (not e!639350))))

(declare-fun _keys!1208 () array!73263)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73263 (_ BitVec 32)) Bool)

(assert (=> b!1123023 (= res!750289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1123024 () Bool)

(declare-fun res!750284 () Bool)

(assert (=> b!1123024 (=> (not res!750284) (not e!639350))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1123024 (= res!750284 (validKeyInArray!0 k!934))))

(declare-fun b!1123025 () Bool)

(declare-fun res!750288 () Bool)

(assert (=> b!1123025 (=> (not res!750288) (not e!639350))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!42721 0))(
  ( (V!42722 (val!14154 Int)) )
))
(declare-datatypes ((ValueCell!13388 0))(
  ( (ValueCellFull!13388 (v!16787 V!42721)) (EmptyCell!13388) )
))
(declare-datatypes ((array!73265 0))(
  ( (array!73266 (arr!35285 (Array (_ BitVec 32) ValueCell!13388)) (size!35821 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73265)

(assert (=> b!1123025 (= res!750288 (and (= (size!35821 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35820 _keys!1208) (size!35821 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1123026 () Bool)

(declare-fun e!639353 () Bool)

(declare-fun e!639354 () Bool)

(assert (=> b!1123026 (= e!639353 e!639354)))

(declare-fun res!750280 () Bool)

(assert (=> b!1123026 (=> res!750280 e!639354)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1123026 (= res!750280 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!42721)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42721)

(declare-fun lt!498938 () array!73265)

(declare-datatypes ((tuple2!17776 0))(
  ( (tuple2!17777 (_1!8899 (_ BitVec 64)) (_2!8899 V!42721)) )
))
(declare-datatypes ((List!24556 0))(
  ( (Nil!24553) (Cons!24552 (h!25761 tuple2!17776) (t!35213 List!24556)) )
))
(declare-datatypes ((ListLongMap!15745 0))(
  ( (ListLongMap!15746 (toList!7888 List!24556)) )
))
(declare-fun lt!498932 () ListLongMap!15745)

(declare-fun getCurrentListMapNoExtraKeys!4376 (array!73263 array!73265 (_ BitVec 32) (_ BitVec 32) V!42721 V!42721 (_ BitVec 32) Int) ListLongMap!15745)

(assert (=> b!1123026 (= lt!498932 (getCurrentListMapNoExtraKeys!4376 lt!498935 lt!498938 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2472 (Int (_ BitVec 64)) V!42721)

(assert (=> b!1123026 (= lt!498938 (array!73266 (store (arr!35285 _values!996) i!673 (ValueCellFull!13388 (dynLambda!2472 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35821 _values!996)))))

(declare-fun lt!498936 () ListLongMap!15745)

(assert (=> b!1123026 (= lt!498936 (getCurrentListMapNoExtraKeys!4376 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!750287 () Bool)

(assert (=> start!97964 (=> (not res!750287) (not e!639350))))

(assert (=> start!97964 (= res!750287 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35820 _keys!1208))))))

(assert (=> start!97964 e!639350))

(assert (=> start!97964 tp_is_empty!28195))

(declare-fun array_inv!27090 (array!73263) Bool)

(assert (=> start!97964 (array_inv!27090 _keys!1208)))

(assert (=> start!97964 true))

(assert (=> start!97964 tp!83698))

(declare-fun e!639352 () Bool)

(declare-fun array_inv!27091 (array!73265) Bool)

(assert (=> start!97964 (and (array_inv!27091 _values!996) e!639352)))

(declare-fun b!1123027 () Bool)

(assert (=> b!1123027 (= e!639357 (not e!639353))))

(declare-fun res!750286 () Bool)

(assert (=> b!1123027 (=> res!750286 e!639353)))

(assert (=> b!1123027 (= res!750286 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1123027 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36832 0))(
  ( (Unit!36833) )
))
(declare-fun lt!498933 () Unit!36832)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73263 (_ BitVec 64) (_ BitVec 32)) Unit!36832)

(assert (=> b!1123027 (= lt!498933 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1123028 () Bool)

(assert (=> b!1123028 (= e!639350 e!639357)))

(declare-fun res!750283 () Bool)

(assert (=> b!1123028 (=> (not res!750283) (not e!639357))))

(assert (=> b!1123028 (= res!750283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498935 mask!1564))))

(assert (=> b!1123028 (= lt!498935 (array!73264 (store (arr!35284 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35820 _keys!1208)))))

(declare-fun b!1123029 () Bool)

(declare-fun e!639355 () Bool)

(assert (=> b!1123029 (= e!639355 true)))

(declare-fun lt!498937 () Bool)

(declare-fun contains!6429 (ListLongMap!15745 (_ BitVec 64)) Bool)

(assert (=> b!1123029 (= lt!498937 (contains!6429 (getCurrentListMapNoExtraKeys!4376 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun b!1123030 () Bool)

(declare-fun res!750281 () Bool)

(assert (=> b!1123030 (=> (not res!750281) (not e!639350))))

(assert (=> b!1123030 (= res!750281 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35820 _keys!1208))))))

(declare-fun b!1123031 () Bool)

(declare-fun res!750292 () Bool)

(assert (=> b!1123031 (=> (not res!750292) (not e!639350))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1123031 (= res!750292 (validMask!0 mask!1564))))

(declare-fun bm!47274 () Bool)

(declare-fun call!47277 () ListLongMap!15745)

(assert (=> bm!47274 (= call!47277 (getCurrentListMapNoExtraKeys!4376 lt!498935 lt!498938 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!47278 () ListLongMap!15745)

(declare-fun b!1123032 () Bool)

(declare-fun e!639348 () Bool)

(declare-fun -!1094 (ListLongMap!15745 (_ BitVec 64)) ListLongMap!15745)

(assert (=> b!1123032 (= e!639348 (= call!47277 (-!1094 call!47278 k!934)))))

(declare-fun mapIsEmpty!44110 () Bool)

(declare-fun mapRes!44110 () Bool)

(assert (=> mapIsEmpty!44110 mapRes!44110))

(declare-fun mapNonEmpty!44110 () Bool)

(declare-fun tp!83699 () Bool)

(declare-fun e!639351 () Bool)

(assert (=> mapNonEmpty!44110 (= mapRes!44110 (and tp!83699 e!639351))))

(declare-fun mapRest!44110 () (Array (_ BitVec 32) ValueCell!13388))

(declare-fun mapKey!44110 () (_ BitVec 32))

(declare-fun mapValue!44110 () ValueCell!13388)

(assert (=> mapNonEmpty!44110 (= (arr!35285 _values!996) (store mapRest!44110 mapKey!44110 mapValue!44110))))

(declare-fun b!1123033 () Bool)

(assert (=> b!1123033 (= e!639352 (and e!639356 mapRes!44110))))

(declare-fun condMapEmpty!44110 () Bool)

(declare-fun mapDefault!44110 () ValueCell!13388)

