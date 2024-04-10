; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97376 () Bool)

(assert start!97376)

(declare-fun b_free!23347 () Bool)

(declare-fun b_next!23347 () Bool)

(assert (=> start!97376 (= b_free!23347 (not b_next!23347))))

(declare-fun tp!82340 () Bool)

(declare-fun b_and!37529 () Bool)

(assert (=> start!97376 (= tp!82340 b_and!37529)))

(declare-fun b!1110069 () Bool)

(declare-fun e!633117 () Bool)

(assert (=> b!1110069 (= e!633117 true)))

(declare-fun e!633114 () Bool)

(assert (=> b!1110069 e!633114))

(declare-fun c!109212 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1110069 (= c!109212 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!41937 0))(
  ( (V!41938 (val!13860 Int)) )
))
(declare-fun zeroValue!944 () V!41937)

(declare-datatypes ((array!72131 0))(
  ( (array!72132 (arr!34718 (Array (_ BitVec 32) (_ BitVec 64))) (size!35254 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72131)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((Unit!36432 0))(
  ( (Unit!36433) )
))
(declare-fun lt!496100 () Unit!36432)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((ValueCell!13094 0))(
  ( (ValueCellFull!13094 (v!16493 V!41937)) (EmptyCell!13094) )
))
(declare-datatypes ((array!72133 0))(
  ( (array!72134 (arr!34719 (Array (_ BitVec 32) ValueCell!13094)) (size!35255 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72133)

(declare-fun minValue!944 () V!41937)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!285 (array!72131 array!72133 (_ BitVec 32) (_ BitVec 32) V!41937 V!41937 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36432)

(assert (=> b!1110069 (= lt!496100 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!285 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110070 () Bool)

(declare-fun res!740799 () Bool)

(declare-fun e!633112 () Bool)

(assert (=> b!1110070 (=> (not res!740799) (not e!633112))))

(assert (=> b!1110070 (= res!740799 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35254 _keys!1208))))))

(declare-fun b!1110071 () Bool)

(declare-fun e!633110 () Bool)

(declare-fun e!633116 () Bool)

(declare-fun mapRes!43228 () Bool)

(assert (=> b!1110071 (= e!633110 (and e!633116 mapRes!43228))))

(declare-fun condMapEmpty!43228 () Bool)

(declare-fun mapDefault!43228 () ValueCell!13094)

