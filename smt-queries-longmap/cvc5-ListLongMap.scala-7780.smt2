; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97424 () Bool)

(assert start!97424)

(declare-fun b_free!23395 () Bool)

(declare-fun b_next!23395 () Bool)

(assert (=> start!97424 (= b_free!23395 (not b_next!23395))))

(declare-fun tp!82484 () Bool)

(declare-fun b_and!37627 () Bool)

(assert (=> start!97424 (= tp!82484 b_and!37627)))

(declare-fun b!1111281 () Bool)

(declare-fun e!633695 () Bool)

(declare-fun tp_is_empty!27655 () Bool)

(assert (=> b!1111281 (= e!633695 tp_is_empty!27655)))

(declare-fun e!633696 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1111282 () Bool)

(declare-datatypes ((V!42001 0))(
  ( (V!42002 (val!13884 Int)) )
))
(declare-datatypes ((tuple2!17570 0))(
  ( (tuple2!17571 (_1!8796 (_ BitVec 64)) (_2!8796 V!42001)) )
))
(declare-datatypes ((List!24253 0))(
  ( (Nil!24250) (Cons!24249 (h!25458 tuple2!17570) (t!34694 List!24253)) )
))
(declare-datatypes ((ListLongMap!15539 0))(
  ( (ListLongMap!15540 (toList!7785 List!24253)) )
))
(declare-fun call!46882 () ListLongMap!15539)

(declare-fun call!46881 () ListLongMap!15539)

(declare-fun -!1054 (ListLongMap!15539 (_ BitVec 64)) ListLongMap!15539)

(assert (=> b!1111282 (= e!633696 (= call!46882 (-!1054 call!46881 k!934)))))

(declare-fun b!1111283 () Bool)

(declare-fun res!741583 () Bool)

(declare-fun e!633698 () Bool)

(assert (=> b!1111283 (=> (not res!741583) (not e!633698))))

(declare-datatypes ((array!72227 0))(
  ( (array!72228 (arr!34766 (Array (_ BitVec 32) (_ BitVec 64))) (size!35302 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72227)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72227 (_ BitVec 32)) Bool)

(assert (=> b!1111283 (= res!741583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1111284 () Bool)

(declare-fun res!741591 () Bool)

(assert (=> b!1111284 (=> (not res!741591) (not e!633698))))

(declare-datatypes ((List!24254 0))(
  ( (Nil!24251) (Cons!24250 (h!25459 (_ BitVec 64)) (t!34695 List!24254)) )
))
(declare-fun arrayNoDuplicates!0 (array!72227 (_ BitVec 32) List!24254) Bool)

(assert (=> b!1111284 (= res!741591 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24251))))

(declare-fun zeroValue!944 () V!42001)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13118 0))(
  ( (ValueCellFull!13118 (v!16517 V!42001)) (EmptyCell!13118) )
))
(declare-datatypes ((array!72229 0))(
  ( (array!72230 (arr!34767 (Array (_ BitVec 32) ValueCell!13118)) (size!35303 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72229)

(declare-fun minValue!944 () V!42001)

(declare-fun bm!46878 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4277 (array!72227 array!72229 (_ BitVec 32) (_ BitVec 32) V!42001 V!42001 (_ BitVec 32) Int) ListLongMap!15539)

(assert (=> bm!46878 (= call!46881 (getCurrentListMapNoExtraKeys!4277 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111285 () Bool)

(declare-fun e!633692 () Bool)

(declare-fun e!633697 () Bool)

(assert (=> b!1111285 (= e!633692 (not e!633697))))

(declare-fun res!741584 () Bool)

(assert (=> b!1111285 (=> res!741584 e!633697)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1111285 (= res!741584 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35302 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72227 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1111285 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36470 0))(
  ( (Unit!36471) )
))
(declare-fun lt!496314 () Unit!36470)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72227 (_ BitVec 64) (_ BitVec 32)) Unit!36470)

(assert (=> b!1111285 (= lt!496314 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1111286 () Bool)

(declare-fun res!741590 () Bool)

(assert (=> b!1111286 (=> (not res!741590) (not e!633698))))

(assert (=> b!1111286 (= res!741590 (and (= (size!35303 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35302 _keys!1208) (size!35303 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1111287 () Bool)

(assert (=> b!1111287 (= e!633696 (= call!46882 call!46881))))

(declare-fun mapIsEmpty!43300 () Bool)

(declare-fun mapRes!43300 () Bool)

(assert (=> mapIsEmpty!43300 mapRes!43300))

(declare-fun b!1111288 () Bool)

(declare-fun res!741588 () Bool)

(assert (=> b!1111288 (=> (not res!741588) (not e!633698))))

(assert (=> b!1111288 (= res!741588 (= (select (arr!34766 _keys!1208) i!673) k!934))))

(declare-fun b!1111289 () Bool)

(declare-fun res!741582 () Bool)

(assert (=> b!1111289 (=> (not res!741582) (not e!633698))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1111289 (= res!741582 (validKeyInArray!0 k!934))))

(declare-fun b!1111290 () Bool)

(declare-fun e!633694 () Bool)

(assert (=> b!1111290 (= e!633694 (and e!633695 mapRes!43300))))

(declare-fun condMapEmpty!43300 () Bool)

(declare-fun mapDefault!43300 () ValueCell!13118)

