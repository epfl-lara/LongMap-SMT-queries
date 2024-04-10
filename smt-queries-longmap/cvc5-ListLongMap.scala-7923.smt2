; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98378 () Bool)

(assert start!98378)

(declare-fun b_free!23983 () Bool)

(declare-fun b_next!23983 () Bool)

(assert (=> start!98378 (= b_free!23983 (not b_next!23983))))

(declare-fun tp!84659 () Bool)

(declare-fun b_and!38815 () Bool)

(assert (=> start!98378 (= tp!84659 b_and!38815)))

(declare-fun b!1134412 () Bool)

(declare-fun e!645608 () Bool)

(declare-fun tp_is_empty!28513 () Bool)

(assert (=> b!1134412 (= e!645608 tp_is_empty!28513)))

(declare-fun b!1134413 () Bool)

(declare-fun res!757327 () Bool)

(declare-fun e!645606 () Bool)

(assert (=> b!1134413 (=> (not res!757327) (not e!645606))))

(declare-datatypes ((array!73887 0))(
  ( (array!73888 (arr!35594 (Array (_ BitVec 32) (_ BitVec 64))) (size!36130 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73887)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!43145 0))(
  ( (V!43146 (val!14313 Int)) )
))
(declare-datatypes ((ValueCell!13547 0))(
  ( (ValueCellFull!13547 (v!16950 V!43145)) (EmptyCell!13547) )
))
(declare-datatypes ((array!73889 0))(
  ( (array!73890 (arr!35595 (Array (_ BitVec 32) ValueCell!13547)) (size!36131 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73889)

(assert (=> b!1134413 (= res!757327 (and (= (size!36131 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36130 _keys!1208) (size!36131 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1134414 () Bool)

(declare-fun lt!504206 () Bool)

(declare-fun e!645607 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1134414 (= e!645607 (ite (= k!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!504206) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1134415 () Bool)

(declare-fun e!645617 () Bool)

(declare-fun e!645616 () Bool)

(assert (=> b!1134415 (= e!645617 e!645616)))

(declare-fun res!757341 () Bool)

(assert (=> b!1134415 (=> res!757341 e!645616)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1134415 (= res!757341 (not (= (select (arr!35594 _keys!1208) from!1455) k!934)))))

(declare-fun e!645602 () Bool)

(assert (=> b!1134415 e!645602))

(declare-fun c!110776 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1134415 (= c!110776 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!43145)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!37169 0))(
  ( (Unit!37170) )
))
(declare-fun lt!504198 () Unit!37169)

(declare-fun minValue!944 () V!43145)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!446 (array!73887 array!73889 (_ BitVec 32) (_ BitVec 32) V!43145 V!43145 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37169)

(assert (=> b!1134415 (= lt!504198 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!446 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1134416 () Bool)

(declare-fun e!645618 () Bool)

(declare-fun e!645610 () Bool)

(declare-fun mapRes!44594 () Bool)

(assert (=> b!1134416 (= e!645618 (and e!645610 mapRes!44594))))

(declare-fun condMapEmpty!44594 () Bool)

(declare-fun mapDefault!44594 () ValueCell!13547)

