; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98076 () Bool)

(assert start!98076)

(declare-fun b_free!23777 () Bool)

(declare-fun b_next!23777 () Bool)

(assert (=> start!98076 (= b_free!23777 (not b_next!23777))))

(declare-fun tp!84035 () Bool)

(declare-fun b_and!38337 () Bool)

(assert (=> start!98076 (= tp!84035 b_and!38337)))

(declare-fun b!1126346 () Bool)

(declare-fun e!641122 () Bool)

(declare-fun e!641127 () Bool)

(assert (=> b!1126346 (= e!641122 e!641127)))

(declare-fun res!752663 () Bool)

(assert (=> b!1126346 (=> res!752663 e!641127)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1126346 (= res!752663 (not (= from!1455 i!673)))))

(declare-datatypes ((V!42869 0))(
  ( (V!42870 (val!14210 Int)) )
))
(declare-fun zeroValue!944 () V!42869)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!73477 0))(
  ( (array!73478 (arr!35391 (Array (_ BitVec 32) (_ BitVec 64))) (size!35927 (_ BitVec 32))) )
))
(declare-fun lt!500192 () array!73477)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13444 0))(
  ( (ValueCellFull!13444 (v!16843 V!42869)) (EmptyCell!13444) )
))
(declare-datatypes ((array!73479 0))(
  ( (array!73480 (arr!35392 (Array (_ BitVec 32) ValueCell!13444)) (size!35928 (_ BitVec 32))) )
))
(declare-fun lt!500190 () array!73479)

(declare-fun minValue!944 () V!42869)

(declare-datatypes ((tuple2!17868 0))(
  ( (tuple2!17869 (_1!8945 (_ BitVec 64)) (_2!8945 V!42869)) )
))
(declare-datatypes ((List!24643 0))(
  ( (Nil!24640) (Cons!24639 (h!25848 tuple2!17868) (t!35412 List!24643)) )
))
(declare-datatypes ((ListLongMap!15837 0))(
  ( (ListLongMap!15838 (toList!7934 List!24643)) )
))
(declare-fun lt!500193 () ListLongMap!15837)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4422 (array!73477 array!73479 (_ BitVec 32) (_ BitVec 32) V!42869 V!42869 (_ BitVec 32) Int) ListLongMap!15837)

(assert (=> b!1126346 (= lt!500193 (getCurrentListMapNoExtraKeys!4422 lt!500192 lt!500190 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73479)

(declare-fun dynLambda!2512 (Int (_ BitVec 64)) V!42869)

(assert (=> b!1126346 (= lt!500190 (array!73480 (store (arr!35392 _values!996) i!673 (ValueCellFull!13444 (dynLambda!2512 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35928 _values!996)))))

(declare-fun _keys!1208 () array!73477)

(declare-fun lt!500194 () ListLongMap!15837)

(assert (=> b!1126346 (= lt!500194 (getCurrentListMapNoExtraKeys!4422 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1126347 () Bool)

(declare-fun e!641123 () Bool)

(assert (=> b!1126347 (= e!641123 true)))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!500189 () Bool)

(declare-fun contains!6467 (ListLongMap!15837 (_ BitVec 64)) Bool)

(assert (=> b!1126347 (= lt!500189 (contains!6467 (getCurrentListMapNoExtraKeys!4422 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun b!1126348 () Bool)

(declare-fun res!752654 () Bool)

(declare-fun e!641119 () Bool)

(assert (=> b!1126348 (=> (not res!752654) (not e!641119))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1126348 (= res!752654 (validMask!0 mask!1564))))

(declare-fun b!1126349 () Bool)

(declare-fun call!47614 () ListLongMap!15837)

(declare-fun call!47613 () ListLongMap!15837)

(declare-fun e!641126 () Bool)

(declare-fun -!1128 (ListLongMap!15837 (_ BitVec 64)) ListLongMap!15837)

(assert (=> b!1126349 (= e!641126 (= call!47614 (-!1128 call!47613 k!934)))))

(declare-fun b!1126350 () Bool)

(declare-fun res!752656 () Bool)

(assert (=> b!1126350 (=> (not res!752656) (not e!641119))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1126350 (= res!752656 (validKeyInArray!0 k!934))))

(declare-fun b!1126351 () Bool)

(declare-fun res!752662 () Bool)

(assert (=> b!1126351 (=> (not res!752662) (not e!641119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73477 (_ BitVec 32)) Bool)

(assert (=> b!1126351 (= res!752662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!47610 () Bool)

(assert (=> bm!47610 (= call!47614 (getCurrentListMapNoExtraKeys!4422 lt!500192 lt!500190 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126352 () Bool)

(assert (=> b!1126352 (= e!641127 e!641123)))

(declare-fun res!752658 () Bool)

(assert (=> b!1126352 (=> res!752658 e!641123)))

(assert (=> b!1126352 (= res!752658 (not (= (select (arr!35391 _keys!1208) from!1455) k!934)))))

(assert (=> b!1126352 e!641126))

(declare-fun c!109656 () Bool)

(assert (=> b!1126352 (= c!109656 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36916 0))(
  ( (Unit!36917) )
))
(declare-fun lt!500191 () Unit!36916)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!379 (array!73477 array!73479 (_ BitVec 32) (_ BitVec 32) V!42869 V!42869 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36916)

(assert (=> b!1126352 (= lt!500191 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!379 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126353 () Bool)

(declare-fun res!752653 () Bool)

(declare-fun e!641124 () Bool)

(assert (=> b!1126353 (=> (not res!752653) (not e!641124))))

(declare-datatypes ((List!24644 0))(
  ( (Nil!24641) (Cons!24640 (h!25849 (_ BitVec 64)) (t!35413 List!24644)) )
))
(declare-fun arrayNoDuplicates!0 (array!73477 (_ BitVec 32) List!24644) Bool)

(assert (=> b!1126353 (= res!752653 (arrayNoDuplicates!0 lt!500192 #b00000000000000000000000000000000 Nil!24641))))

(declare-fun b!1126354 () Bool)

(assert (=> b!1126354 (= e!641124 (not e!641122))))

(declare-fun res!752665 () Bool)

(assert (=> b!1126354 (=> res!752665 e!641122)))

(assert (=> b!1126354 (= res!752665 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73477 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1126354 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!500195 () Unit!36916)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73477 (_ BitVec 64) (_ BitVec 32)) Unit!36916)

(assert (=> b!1126354 (= lt!500195 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1126355 () Bool)

(declare-fun res!752664 () Bool)

(assert (=> b!1126355 (=> (not res!752664) (not e!641119))))

(assert (=> b!1126355 (= res!752664 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24641))))

(declare-fun res!752655 () Bool)

(assert (=> start!98076 (=> (not res!752655) (not e!641119))))

(assert (=> start!98076 (= res!752655 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35927 _keys!1208))))))

(assert (=> start!98076 e!641119))

(declare-fun tp_is_empty!28307 () Bool)

(assert (=> start!98076 tp_is_empty!28307))

(declare-fun array_inv!27166 (array!73477) Bool)

(assert (=> start!98076 (array_inv!27166 _keys!1208)))

(assert (=> start!98076 true))

(assert (=> start!98076 tp!84035))

(declare-fun e!641120 () Bool)

(declare-fun array_inv!27167 (array!73479) Bool)

(assert (=> start!98076 (and (array_inv!27167 _values!996) e!641120)))

(declare-fun bm!47611 () Bool)

(assert (=> bm!47611 (= call!47613 (getCurrentListMapNoExtraKeys!4422 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126356 () Bool)

(declare-fun res!752659 () Bool)

(assert (=> b!1126356 (=> (not res!752659) (not e!641119))))

(assert (=> b!1126356 (= res!752659 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35927 _keys!1208))))))

(declare-fun b!1126357 () Bool)

(declare-fun e!641125 () Bool)

(assert (=> b!1126357 (= e!641125 tp_is_empty!28307)))

(declare-fun b!1126358 () Bool)

(declare-fun e!641121 () Bool)

(assert (=> b!1126358 (= e!641121 tp_is_empty!28307)))

(declare-fun mapNonEmpty!44278 () Bool)

(declare-fun mapRes!44278 () Bool)

(declare-fun tp!84034 () Bool)

(assert (=> mapNonEmpty!44278 (= mapRes!44278 (and tp!84034 e!641121))))

(declare-fun mapRest!44278 () (Array (_ BitVec 32) ValueCell!13444))

(declare-fun mapValue!44278 () ValueCell!13444)

(declare-fun mapKey!44278 () (_ BitVec 32))

(assert (=> mapNonEmpty!44278 (= (arr!35392 _values!996) (store mapRest!44278 mapKey!44278 mapValue!44278))))

(declare-fun b!1126359 () Bool)

(declare-fun res!752657 () Bool)

(assert (=> b!1126359 (=> (not res!752657) (not e!641119))))

(assert (=> b!1126359 (= res!752657 (= (select (arr!35391 _keys!1208) i!673) k!934))))

(declare-fun b!1126360 () Bool)

(assert (=> b!1126360 (= e!641126 (= call!47614 call!47613))))

(declare-fun b!1126361 () Bool)

(assert (=> b!1126361 (= e!641119 e!641124)))

(declare-fun res!752661 () Bool)

(assert (=> b!1126361 (=> (not res!752661) (not e!641124))))

(assert (=> b!1126361 (= res!752661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500192 mask!1564))))

(assert (=> b!1126361 (= lt!500192 (array!73478 (store (arr!35391 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35927 _keys!1208)))))

(declare-fun mapIsEmpty!44278 () Bool)

(assert (=> mapIsEmpty!44278 mapRes!44278))

(declare-fun b!1126362 () Bool)

(declare-fun res!752660 () Bool)

(assert (=> b!1126362 (=> (not res!752660) (not e!641119))))

(assert (=> b!1126362 (= res!752660 (and (= (size!35928 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35927 _keys!1208) (size!35928 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1126363 () Bool)

(assert (=> b!1126363 (= e!641120 (and e!641125 mapRes!44278))))

(declare-fun condMapEmpty!44278 () Bool)

(declare-fun mapDefault!44278 () ValueCell!13444)

