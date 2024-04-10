; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97436 () Bool)

(assert start!97436)

(declare-fun b_free!23407 () Bool)

(declare-fun b_next!23407 () Bool)

(assert (=> start!97436 (= b_free!23407 (not b_next!23407))))

(declare-fun tp!82519 () Bool)

(declare-fun b_and!37651 () Bool)

(assert (=> start!97436 (= tp!82519 b_and!37651)))

(declare-fun b!1111581 () Bool)

(declare-fun res!741787 () Bool)

(declare-fun e!633838 () Bool)

(assert (=> b!1111581 (=> (not res!741787) (not e!633838))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1111581 (= res!741787 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!43318 () Bool)

(declare-fun mapRes!43318 () Bool)

(declare-fun tp!82520 () Bool)

(declare-fun e!633843 () Bool)

(assert (=> mapNonEmpty!43318 (= mapRes!43318 (and tp!82520 e!633843))))

(declare-datatypes ((V!42017 0))(
  ( (V!42018 (val!13890 Int)) )
))
(declare-datatypes ((ValueCell!13124 0))(
  ( (ValueCellFull!13124 (v!16523 V!42017)) (EmptyCell!13124) )
))
(declare-fun mapRest!43318 () (Array (_ BitVec 32) ValueCell!13124))

(declare-fun mapKey!43318 () (_ BitVec 32))

(declare-fun mapValue!43318 () ValueCell!13124)

(declare-datatypes ((array!72251 0))(
  ( (array!72252 (arr!34778 (Array (_ BitVec 32) ValueCell!13124)) (size!35314 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72251)

(assert (=> mapNonEmpty!43318 (= (arr!34778 _values!996) (store mapRest!43318 mapKey!43318 mapValue!43318))))

(declare-fun b!1111582 () Bool)

(declare-fun e!633840 () Bool)

(assert (=> b!1111582 (= e!633840 true)))

(declare-fun e!633841 () Bool)

(assert (=> b!1111582 e!633841))

(declare-fun c!109308 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1111582 (= c!109308 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!42017)

(declare-datatypes ((array!72253 0))(
  ( (array!72254 (arr!34779 (Array (_ BitVec 32) (_ BitVec 64))) (size!35315 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72253)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun minValue!944 () V!42017)

(declare-datatypes ((Unit!36480 0))(
  ( (Unit!36481) )
))
(declare-fun lt!496368 () Unit!36480)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!305 (array!72253 array!72251 (_ BitVec 32) (_ BitVec 32) V!42017 V!42017 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36480)

(assert (=> b!1111582 (= lt!496368 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!305 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111583 () Bool)

(declare-fun res!741784 () Bool)

(assert (=> b!1111583 (=> (not res!741784) (not e!633838))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1111583 (= res!741784 (validKeyInArray!0 k!934))))

(declare-fun b!1111584 () Bool)

(declare-datatypes ((tuple2!17582 0))(
  ( (tuple2!17583 (_1!8802 (_ BitVec 64)) (_2!8802 V!42017)) )
))
(declare-datatypes ((List!24265 0))(
  ( (Nil!24262) (Cons!24261 (h!25470 tuple2!17582) (t!34718 List!24265)) )
))
(declare-datatypes ((ListLongMap!15551 0))(
  ( (ListLongMap!15552 (toList!7791 List!24265)) )
))
(declare-fun call!46918 () ListLongMap!15551)

(declare-fun call!46917 () ListLongMap!15551)

(assert (=> b!1111584 (= e!633841 (= call!46918 call!46917))))

(declare-fun lt!496369 () array!72253)

(declare-fun bm!46914 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4282 (array!72253 array!72251 (_ BitVec 32) (_ BitVec 32) V!42017 V!42017 (_ BitVec 32) Int) ListLongMap!15551)

(declare-fun dynLambda!2409 (Int (_ BitVec 64)) V!42017)

(assert (=> bm!46914 (= call!46918 (getCurrentListMapNoExtraKeys!4282 lt!496369 (array!72252 (store (arr!34778 _values!996) i!673 (ValueCellFull!13124 (dynLambda!2409 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35314 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1111585 () Bool)

(declare-fun e!633842 () Bool)

(assert (=> b!1111585 (= e!633838 e!633842)))

(declare-fun res!741783 () Bool)

(assert (=> b!1111585 (=> (not res!741783) (not e!633842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72253 (_ BitVec 32)) Bool)

(assert (=> b!1111585 (= res!741783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496369 mask!1564))))

(assert (=> b!1111585 (= lt!496369 (array!72254 (store (arr!34779 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35315 _keys!1208)))))

(declare-fun b!1111587 () Bool)

(declare-fun res!741786 () Bool)

(assert (=> b!1111587 (=> (not res!741786) (not e!633838))))

(assert (=> b!1111587 (= res!741786 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35315 _keys!1208))))))

(declare-fun mapIsEmpty!43318 () Bool)

(assert (=> mapIsEmpty!43318 mapRes!43318))

(declare-fun b!1111588 () Bool)

(declare-fun tp_is_empty!27667 () Bool)

(assert (=> b!1111588 (= e!633843 tp_is_empty!27667)))

(declare-fun b!1111589 () Bool)

(declare-fun e!633837 () Bool)

(declare-fun e!633839 () Bool)

(assert (=> b!1111589 (= e!633837 (and e!633839 mapRes!43318))))

(declare-fun condMapEmpty!43318 () Bool)

(declare-fun mapDefault!43318 () ValueCell!13124)

