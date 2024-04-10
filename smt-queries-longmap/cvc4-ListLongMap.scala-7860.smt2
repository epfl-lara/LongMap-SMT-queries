; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97908 () Bool)

(assert start!97908)

(declare-fun b_free!23609 () Bool)

(declare-fun b_next!23609 () Bool)

(assert (=> start!97908 (= b_free!23609 (not b_next!23609))))

(declare-fun tp!83530 () Bool)

(declare-fun b_and!38001 () Bool)

(assert (=> start!97908 (= tp!83530 b_and!38001)))

(declare-fun b!1121481 () Bool)

(declare-fun res!749221 () Bool)

(declare-fun e!638544 () Bool)

(assert (=> b!1121481 (=> (not res!749221) (not e!638544))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((array!73159 0))(
  ( (array!73160 (arr!35232 (Array (_ BitVec 32) (_ BitVec 64))) (size!35768 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73159)

(assert (=> b!1121481 (= res!749221 (= (select (arr!35232 _keys!1208) i!673) k!934))))

(declare-fun b!1121482 () Bool)

(declare-fun e!638537 () Bool)

(assert (=> b!1121482 (= e!638544 e!638537)))

(declare-fun res!749222 () Bool)

(assert (=> b!1121482 (=> (not res!749222) (not e!638537))))

(declare-fun lt!498374 () array!73159)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73159 (_ BitVec 32)) Bool)

(assert (=> b!1121482 (= res!749222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498374 mask!1564))))

(assert (=> b!1121482 (= lt!498374 (array!73160 (store (arr!35232 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35768 _keys!1208)))))

(declare-fun b!1121483 () Bool)

(declare-fun res!749219 () Bool)

(assert (=> b!1121483 (=> (not res!749219) (not e!638544))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1121483 (= res!749219 (validMask!0 mask!1564))))

(declare-fun b!1121484 () Bool)

(declare-fun e!638540 () Bool)

(assert (=> b!1121484 (= e!638537 (not e!638540))))

(declare-fun res!749226 () Bool)

(assert (=> b!1121484 (=> res!749226 e!638540)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1121484 (= res!749226 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1121484 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36790 0))(
  ( (Unit!36791) )
))
(declare-fun lt!498377 () Unit!36790)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73159 (_ BitVec 64) (_ BitVec 32)) Unit!36790)

(assert (=> b!1121484 (= lt!498377 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1121485 () Bool)

(declare-fun res!749225 () Bool)

(assert (=> b!1121485 (=> (not res!749225) (not e!638544))))

(assert (=> b!1121485 (= res!749225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1121486 () Bool)

(declare-datatypes ((V!42645 0))(
  ( (V!42646 (val!14126 Int)) )
))
(declare-datatypes ((tuple2!17730 0))(
  ( (tuple2!17731 (_1!8876 (_ BitVec 64)) (_2!8876 V!42645)) )
))
(declare-datatypes ((List!24514 0))(
  ( (Nil!24511) (Cons!24510 (h!25719 tuple2!17730) (t!35115 List!24514)) )
))
(declare-datatypes ((ListLongMap!15699 0))(
  ( (ListLongMap!15700 (toList!7865 List!24514)) )
))
(declare-fun call!47109 () ListLongMap!15699)

(declare-fun call!47110 () ListLongMap!15699)

(declare-fun e!638538 () Bool)

(declare-fun -!1075 (ListLongMap!15699 (_ BitVec 64)) ListLongMap!15699)

(assert (=> b!1121486 (= e!638538 (= call!47110 (-!1075 call!47109 k!934)))))

(declare-fun b!1121487 () Bool)

(declare-fun res!749220 () Bool)

(assert (=> b!1121487 (=> (not res!749220) (not e!638544))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1121487 (= res!749220 (validKeyInArray!0 k!934))))

(declare-fun mapIsEmpty!44026 () Bool)

(declare-fun mapRes!44026 () Bool)

(assert (=> mapIsEmpty!44026 mapRes!44026))

(declare-fun zeroValue!944 () V!42645)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!47106 () Bool)

(declare-datatypes ((ValueCell!13360 0))(
  ( (ValueCellFull!13360 (v!16759 V!42645)) (EmptyCell!13360) )
))
(declare-datatypes ((array!73161 0))(
  ( (array!73162 (arr!35233 (Array (_ BitVec 32) ValueCell!13360)) (size!35769 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73161)

(declare-fun minValue!944 () V!42645)

(declare-fun getCurrentListMapNoExtraKeys!4354 (array!73159 array!73161 (_ BitVec 32) (_ BitVec 32) V!42645 V!42645 (_ BitVec 32) Int) ListLongMap!15699)

(assert (=> bm!47106 (= call!47109 (getCurrentListMapNoExtraKeys!4354 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121489 () Bool)

(declare-fun e!638539 () Bool)

(declare-fun tp_is_empty!28139 () Bool)

(assert (=> b!1121489 (= e!638539 tp_is_empty!28139)))

(declare-fun lt!498376 () array!73161)

(declare-fun bm!47107 () Bool)

(assert (=> bm!47107 (= call!47110 (getCurrentListMapNoExtraKeys!4354 lt!498374 lt!498376 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121490 () Bool)

(declare-fun res!749224 () Bool)

(assert (=> b!1121490 (=> (not res!749224) (not e!638544))))

(assert (=> b!1121490 (= res!749224 (and (= (size!35769 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35768 _keys!1208) (size!35769 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1121491 () Bool)

(declare-fun e!638541 () Bool)

(assert (=> b!1121491 (= e!638541 tp_is_empty!28139)))

(declare-fun b!1121492 () Bool)

(declare-fun e!638536 () Bool)

(assert (=> b!1121492 (= e!638536 (and e!638541 mapRes!44026))))

(declare-fun condMapEmpty!44026 () Bool)

(declare-fun mapDefault!44026 () ValueCell!13360)

