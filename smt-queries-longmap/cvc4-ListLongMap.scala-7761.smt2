; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97314 () Bool)

(assert start!97314)

(declare-fun b_free!23285 () Bool)

(declare-fun b_next!23285 () Bool)

(assert (=> start!97314 (= b_free!23285 (not b_next!23285))))

(declare-fun tp!82154 () Bool)

(declare-fun b_and!37401 () Bool)

(assert (=> start!97314 (= tp!82154 b_and!37401)))

(declare-fun b!1108495 () Bool)

(declare-fun e!632357 () Bool)

(declare-fun e!632355 () Bool)

(assert (=> b!1108495 (= e!632357 (not e!632355))))

(declare-fun res!739772 () Bool)

(assert (=> b!1108495 (=> res!739772 e!632355)))

(declare-datatypes ((array!72007 0))(
  ( (array!72008 (arr!34656 (Array (_ BitVec 32) (_ BitVec 64))) (size!35192 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72007)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1108495 (= res!739772 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35192 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72007 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1108495 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36382 0))(
  ( (Unit!36383) )
))
(declare-fun lt!495820 () Unit!36382)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72007 (_ BitVec 64) (_ BitVec 32)) Unit!36382)

(assert (=> b!1108495 (= lt!495820 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun res!739769 () Bool)

(declare-fun e!632359 () Bool)

(assert (=> start!97314 (=> (not res!739769) (not e!632359))))

(assert (=> start!97314 (= res!739769 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35192 _keys!1208))))))

(assert (=> start!97314 e!632359))

(declare-fun tp_is_empty!27545 () Bool)

(assert (=> start!97314 tp_is_empty!27545))

(declare-fun array_inv!26672 (array!72007) Bool)

(assert (=> start!97314 (array_inv!26672 _keys!1208)))

(assert (=> start!97314 true))

(assert (=> start!97314 tp!82154))

(declare-datatypes ((V!41853 0))(
  ( (V!41854 (val!13829 Int)) )
))
(declare-datatypes ((ValueCell!13063 0))(
  ( (ValueCellFull!13063 (v!16462 V!41853)) (EmptyCell!13063) )
))
(declare-datatypes ((array!72009 0))(
  ( (array!72010 (arr!34657 (Array (_ BitVec 32) ValueCell!13063)) (size!35193 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72009)

(declare-fun e!632354 () Bool)

(declare-fun array_inv!26673 (array!72009) Bool)

(assert (=> start!97314 (and (array_inv!26673 _values!996) e!632354)))

(declare-fun b!1108496 () Bool)

(assert (=> b!1108496 (= e!632355 true)))

(declare-fun e!632358 () Bool)

(assert (=> b!1108496 e!632358))

(declare-fun c!109107 () Bool)

(assert (=> b!1108496 (= c!109107 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!41853)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!41853)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!495819 () Unit!36382)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!263 (array!72007 array!72009 (_ BitVec 32) (_ BitVec 32) V!41853 V!41853 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36382)

(assert (=> b!1108496 (= lt!495819 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!263 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108497 () Bool)

(declare-datatypes ((tuple2!17476 0))(
  ( (tuple2!17477 (_1!8749 (_ BitVec 64)) (_2!8749 V!41853)) )
))
(declare-datatypes ((List!24160 0))(
  ( (Nil!24157) (Cons!24156 (h!25365 tuple2!17476) (t!34491 List!24160)) )
))
(declare-datatypes ((ListLongMap!15445 0))(
  ( (ListLongMap!15446 (toList!7738 List!24160)) )
))
(declare-fun call!46552 () ListLongMap!15445)

(declare-fun call!46551 () ListLongMap!15445)

(declare-fun -!1017 (ListLongMap!15445 (_ BitVec 64)) ListLongMap!15445)

(assert (=> b!1108497 (= e!632358 (= call!46552 (-!1017 call!46551 k!934)))))

(declare-fun b!1108498 () Bool)

(declare-fun e!632356 () Bool)

(assert (=> b!1108498 (= e!632356 tp_is_empty!27545)))

(declare-fun mapNonEmpty!43135 () Bool)

(declare-fun mapRes!43135 () Bool)

(declare-fun tp!82153 () Bool)

(declare-fun e!632360 () Bool)

(assert (=> mapNonEmpty!43135 (= mapRes!43135 (and tp!82153 e!632360))))

(declare-fun mapKey!43135 () (_ BitVec 32))

(declare-fun mapRest!43135 () (Array (_ BitVec 32) ValueCell!13063))

(declare-fun mapValue!43135 () ValueCell!13063)

(assert (=> mapNonEmpty!43135 (= (arr!34657 _values!996) (store mapRest!43135 mapKey!43135 mapValue!43135))))

(declare-fun b!1108499 () Bool)

(declare-fun res!739768 () Bool)

(assert (=> b!1108499 (=> (not res!739768) (not e!632359))))

(assert (=> b!1108499 (= res!739768 (= (select (arr!34656 _keys!1208) i!673) k!934))))

(declare-fun b!1108500 () Bool)

(declare-fun res!739776 () Bool)

(assert (=> b!1108500 (=> (not res!739776) (not e!632359))))

(declare-datatypes ((List!24161 0))(
  ( (Nil!24158) (Cons!24157 (h!25366 (_ BitVec 64)) (t!34492 List!24161)) )
))
(declare-fun arrayNoDuplicates!0 (array!72007 (_ BitVec 32) List!24161) Bool)

(assert (=> b!1108500 (= res!739776 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24158))))

(declare-fun b!1108501 () Bool)

(assert (=> b!1108501 (= e!632354 (and e!632356 mapRes!43135))))

(declare-fun condMapEmpty!43135 () Bool)

(declare-fun mapDefault!43135 () ValueCell!13063)

