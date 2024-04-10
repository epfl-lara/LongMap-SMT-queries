; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97458 () Bool)

(assert start!97458)

(declare-fun b_free!23429 () Bool)

(declare-fun b_next!23429 () Bool)

(assert (=> start!97458 (= b_free!23429 (not b_next!23429))))

(declare-fun tp!82586 () Bool)

(declare-fun b_and!37695 () Bool)

(assert (=> start!97458 (= tp!82586 b_and!37695)))

(declare-fun b!1112131 () Bool)

(declare-fun res!742145 () Bool)

(declare-fun e!634106 () Bool)

(assert (=> b!1112131 (=> (not res!742145) (not e!634106))))

(declare-datatypes ((array!72291 0))(
  ( (array!72292 (arr!34798 (Array (_ BitVec 32) (_ BitVec 64))) (size!35334 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72291)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72291 (_ BitVec 32)) Bool)

(assert (=> b!1112131 (= res!742145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-datatypes ((V!42045 0))(
  ( (V!42046 (val!13901 Int)) )
))
(declare-fun zeroValue!944 () V!42045)

(declare-fun lt!496467 () array!72291)

(declare-datatypes ((tuple2!17596 0))(
  ( (tuple2!17597 (_1!8809 (_ BitVec 64)) (_2!8809 V!42045)) )
))
(declare-datatypes ((List!24279 0))(
  ( (Nil!24276) (Cons!24275 (h!25484 tuple2!17596) (t!34754 List!24279)) )
))
(declare-datatypes ((ListLongMap!15565 0))(
  ( (ListLongMap!15566 (toList!7798 List!24279)) )
))
(declare-fun call!46983 () ListLongMap!15565)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13135 0))(
  ( (ValueCellFull!13135 (v!16534 V!42045)) (EmptyCell!13135) )
))
(declare-datatypes ((array!72293 0))(
  ( (array!72294 (arr!34799 (Array (_ BitVec 32) ValueCell!13135)) (size!35335 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72293)

(declare-fun minValue!944 () V!42045)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!46980 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4289 (array!72291 array!72293 (_ BitVec 32) (_ BitVec 32) V!42045 V!42045 (_ BitVec 32) Int) ListLongMap!15565)

(declare-fun dynLambda!2415 (Int (_ BitVec 64)) V!42045)

(assert (=> bm!46980 (= call!46983 (getCurrentListMapNoExtraKeys!4289 lt!496467 (array!72294 (store (arr!34799 _values!996) i!673 (ValueCellFull!13135 (dynLambda!2415 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35335 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1112132 () Bool)

(declare-fun e!634104 () Bool)

(declare-fun call!46984 () ListLongMap!15565)

(assert (=> b!1112132 (= e!634104 (= call!46983 call!46984))))

(declare-fun b!1112133 () Bool)

(declare-fun e!634100 () Bool)

(declare-fun e!634107 () Bool)

(assert (=> b!1112133 (= e!634100 (not e!634107))))

(declare-fun res!742152 () Bool)

(assert (=> b!1112133 (=> res!742152 e!634107)))

(assert (=> b!1112133 (= res!742152 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35334 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1112133 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36494 0))(
  ( (Unit!36495) )
))
(declare-fun lt!496469 () Unit!36494)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72291 (_ BitVec 64) (_ BitVec 32)) Unit!36494)

(assert (=> b!1112133 (= lt!496469 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1112134 () Bool)

(assert (=> b!1112134 (= e!634107 true)))

(assert (=> b!1112134 e!634104))

(declare-fun c!109341 () Bool)

(assert (=> b!1112134 (= c!109341 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496468 () Unit!36494)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!312 (array!72291 array!72293 (_ BitVec 32) (_ BitVec 32) V!42045 V!42045 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36494)

(assert (=> b!1112134 (= lt!496468 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!312 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1112135 () Bool)

(declare-fun res!742151 () Bool)

(assert (=> b!1112135 (=> (not res!742151) (not e!634106))))

(assert (=> b!1112135 (= res!742151 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35334 _keys!1208))))))

(declare-fun mapIsEmpty!43351 () Bool)

(declare-fun mapRes!43351 () Bool)

(assert (=> mapIsEmpty!43351 mapRes!43351))

(declare-fun b!1112136 () Bool)

(declare-fun res!742149 () Bool)

(assert (=> b!1112136 (=> (not res!742149) (not e!634106))))

(assert (=> b!1112136 (= res!742149 (and (= (size!35335 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35334 _keys!1208) (size!35335 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1112137 () Bool)

(declare-fun e!634102 () Bool)

(declare-fun tp_is_empty!27689 () Bool)

(assert (=> b!1112137 (= e!634102 tp_is_empty!27689)))

(declare-fun b!1112139 () Bool)

(declare-fun res!742147 () Bool)

(assert (=> b!1112139 (=> (not res!742147) (not e!634106))))

(declare-datatypes ((List!24280 0))(
  ( (Nil!24277) (Cons!24276 (h!25485 (_ BitVec 64)) (t!34755 List!24280)) )
))
(declare-fun arrayNoDuplicates!0 (array!72291 (_ BitVec 32) List!24280) Bool)

(assert (=> b!1112139 (= res!742147 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24277))))

(declare-fun b!1112140 () Bool)

(declare-fun res!742148 () Bool)

(assert (=> b!1112140 (=> (not res!742148) (not e!634100))))

(assert (=> b!1112140 (= res!742148 (arrayNoDuplicates!0 lt!496467 #b00000000000000000000000000000000 Nil!24277))))

(declare-fun b!1112141 () Bool)

(declare-fun e!634103 () Bool)

(assert (=> b!1112141 (= e!634103 (and e!634102 mapRes!43351))))

(declare-fun condMapEmpty!43351 () Bool)

(declare-fun mapDefault!43351 () ValueCell!13135)

