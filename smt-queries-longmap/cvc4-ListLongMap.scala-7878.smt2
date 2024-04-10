; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98016 () Bool)

(assert start!98016)

(declare-fun b_free!23717 () Bool)

(declare-fun b_next!23717 () Bool)

(assert (=> start!98016 (= b_free!23717 (not b_next!23717))))

(declare-fun tp!83855 () Bool)

(declare-fun b_and!38217 () Bool)

(assert (=> start!98016 (= tp!83855 b_and!38217)))

(declare-fun res!751397 () Bool)

(declare-fun e!640182 () Bool)

(assert (=> start!98016 (=> (not res!751397) (not e!640182))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73361 0))(
  ( (array!73362 (arr!35333 (Array (_ BitVec 32) (_ BitVec 64))) (size!35869 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73361)

(assert (=> start!98016 (= res!751397 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35869 _keys!1208))))))

(assert (=> start!98016 e!640182))

(declare-fun tp_is_empty!28247 () Bool)

(assert (=> start!98016 tp_is_empty!28247))

(declare-fun array_inv!27122 (array!73361) Bool)

(assert (=> start!98016 (array_inv!27122 _keys!1208)))

(assert (=> start!98016 true))

(assert (=> start!98016 tp!83855))

(declare-datatypes ((V!42789 0))(
  ( (V!42790 (val!14180 Int)) )
))
(declare-datatypes ((ValueCell!13414 0))(
  ( (ValueCellFull!13414 (v!16813 V!42789)) (EmptyCell!13414) )
))
(declare-datatypes ((array!73363 0))(
  ( (array!73364 (arr!35334 (Array (_ BitVec 32) ValueCell!13414)) (size!35870 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73363)

(declare-fun e!640174 () Bool)

(declare-fun array_inv!27123 (array!73363) Bool)

(assert (=> start!98016 (and (array_inv!27123 _values!996) e!640174)))

(declare-fun b!1124574 () Bool)

(declare-fun e!640172 () Bool)

(declare-fun e!640177 () Bool)

(assert (=> b!1124574 (= e!640172 e!640177)))

(declare-fun res!751396 () Bool)

(assert (=> b!1124574 (=> res!751396 e!640177)))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1124574 (= res!751396 (not (= (select (arr!35333 _keys!1208) from!1455) k!934)))))

(declare-fun e!640176 () Bool)

(assert (=> b!1124574 e!640176))

(declare-fun c!109566 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1124574 (= c!109566 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!42789)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!36866 0))(
  ( (Unit!36867) )
))
(declare-fun lt!499520 () Unit!36866)

(declare-fun minValue!944 () V!42789)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!357 (array!73361 array!73363 (_ BitVec 32) (_ BitVec 32) V!42789 V!42789 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36866)

(assert (=> b!1124574 (= lt!499520 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!357 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124575 () Bool)

(declare-fun e!640178 () Bool)

(declare-fun e!640173 () Bool)

(assert (=> b!1124575 (= e!640178 (not e!640173))))

(declare-fun res!751395 () Bool)

(assert (=> b!1124575 (=> res!751395 e!640173)))

(assert (=> b!1124575 (= res!751395 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1124575 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!499518 () Unit!36866)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73361 (_ BitVec 64) (_ BitVec 32)) Unit!36866)

(assert (=> b!1124575 (= lt!499518 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-datatypes ((tuple2!17814 0))(
  ( (tuple2!17815 (_1!8918 (_ BitVec 64)) (_2!8918 V!42789)) )
))
(declare-datatypes ((List!24593 0))(
  ( (Nil!24590) (Cons!24589 (h!25798 tuple2!17814) (t!35302 List!24593)) )
))
(declare-datatypes ((ListLongMap!15783 0))(
  ( (ListLongMap!15784 (toList!7907 List!24593)) )
))
(declare-fun call!47433 () ListLongMap!15783)

(declare-fun bm!47430 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4395 (array!73361 array!73363 (_ BitVec 32) (_ BitVec 32) V!42789 V!42789 (_ BitVec 32) Int) ListLongMap!15783)

(assert (=> bm!47430 (= call!47433 (getCurrentListMapNoExtraKeys!4395 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124576 () Bool)

(declare-fun res!751398 () Bool)

(assert (=> b!1124576 (=> (not res!751398) (not e!640182))))

(assert (=> b!1124576 (= res!751398 (= (select (arr!35333 _keys!1208) i!673) k!934))))

(declare-fun b!1124577 () Bool)

(declare-fun res!751401 () Bool)

(assert (=> b!1124577 (=> (not res!751401) (not e!640182))))

(declare-datatypes ((List!24594 0))(
  ( (Nil!24591) (Cons!24590 (h!25799 (_ BitVec 64)) (t!35303 List!24594)) )
))
(declare-fun arrayNoDuplicates!0 (array!73361 (_ BitVec 32) List!24594) Bool)

(assert (=> b!1124577 (= res!751401 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24591))))

(declare-fun b!1124578 () Bool)

(declare-fun e!640175 () Bool)

(assert (=> b!1124578 (= e!640175 tp_is_empty!28247)))

(declare-fun call!47434 () ListLongMap!15783)

(declare-fun bm!47431 () Bool)

(declare-fun lt!499515 () array!73361)

(declare-fun lt!499516 () array!73363)

(assert (=> bm!47431 (= call!47434 (getCurrentListMapNoExtraKeys!4395 lt!499515 lt!499516 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124579 () Bool)

(declare-fun e!640181 () Bool)

(assert (=> b!1124579 (= e!640177 e!640181)))

(declare-fun res!751403 () Bool)

(assert (=> b!1124579 (=> res!751403 e!640181)))

(declare-fun lt!499513 () ListLongMap!15783)

(declare-fun contains!6445 (ListLongMap!15783 (_ BitVec 64)) Bool)

(assert (=> b!1124579 (= res!751403 (not (contains!6445 lt!499513 k!934)))))

(assert (=> b!1124579 (= lt!499513 (getCurrentListMapNoExtraKeys!4395 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1124580 () Bool)

(declare-fun res!751405 () Bool)

(assert (=> b!1124580 (=> (not res!751405) (not e!640182))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1124580 (= res!751405 (validKeyInArray!0 k!934))))

(declare-fun b!1124581 () Bool)

(declare-fun e!640179 () Bool)

(declare-fun mapRes!44188 () Bool)

(assert (=> b!1124581 (= e!640174 (and e!640179 mapRes!44188))))

(declare-fun condMapEmpty!44188 () Bool)

(declare-fun mapDefault!44188 () ValueCell!13414)

