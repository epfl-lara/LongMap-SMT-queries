; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97454 () Bool)

(assert start!97454)

(declare-fun b_free!23425 () Bool)

(declare-fun b_next!23425 () Bool)

(assert (=> start!97454 (= b_free!23425 (not b_next!23425))))

(declare-fun tp!82573 () Bool)

(declare-fun b_and!37687 () Bool)

(assert (=> start!97454 (= tp!82573 b_and!37687)))

(declare-fun b!1112031 () Bool)

(declare-fun res!742081 () Bool)

(declare-fun e!634054 () Bool)

(assert (=> b!1112031 (=> (not res!742081) (not e!634054))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72283 0))(
  ( (array!72284 (arr!34794 (Array (_ BitVec 32) (_ BitVec 64))) (size!35330 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72283)

(assert (=> b!1112031 (= res!742081 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35330 _keys!1208))))))

(declare-fun res!742077 () Bool)

(assert (=> start!97454 (=> (not res!742077) (not e!634054))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97454 (= res!742077 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35330 _keys!1208))))))

(assert (=> start!97454 e!634054))

(declare-fun tp_is_empty!27685 () Bool)

(assert (=> start!97454 tp_is_empty!27685))

(declare-fun array_inv!26756 (array!72283) Bool)

(assert (=> start!97454 (array_inv!26756 _keys!1208)))

(assert (=> start!97454 true))

(assert (=> start!97454 tp!82573))

(declare-datatypes ((V!42041 0))(
  ( (V!42042 (val!13899 Int)) )
))
(declare-datatypes ((ValueCell!13133 0))(
  ( (ValueCellFull!13133 (v!16532 V!42041)) (EmptyCell!13133) )
))
(declare-datatypes ((array!72285 0))(
  ( (array!72286 (arr!34795 (Array (_ BitVec 32) ValueCell!13133)) (size!35331 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72285)

(declare-fun e!634059 () Bool)

(declare-fun array_inv!26757 (array!72285) Bool)

(assert (=> start!97454 (and (array_inv!26757 _values!996) e!634059)))

(declare-fun b!1112032 () Bool)

(declare-fun res!742085 () Bool)

(assert (=> b!1112032 (=> (not res!742085) (not e!634054))))

(declare-datatypes ((List!24275 0))(
  ( (Nil!24272) (Cons!24271 (h!25480 (_ BitVec 64)) (t!34746 List!24275)) )
))
(declare-fun arrayNoDuplicates!0 (array!72283 (_ BitVec 32) List!24275) Bool)

(assert (=> b!1112032 (= res!742085 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24272))))

(declare-fun b!1112033 () Bool)

(declare-fun e!634056 () Bool)

(assert (=> b!1112033 (= e!634056 tp_is_empty!27685)))

(declare-fun mapIsEmpty!43345 () Bool)

(declare-fun mapRes!43345 () Bool)

(assert (=> mapIsEmpty!43345 mapRes!43345))

(declare-fun b!1112034 () Bool)

(declare-fun res!742080 () Bool)

(assert (=> b!1112034 (=> (not res!742080) (not e!634054))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1112034 (= res!742080 (= (select (arr!34794 _keys!1208) i!673) k!934))))

(declare-fun b!1112035 () Bool)

(declare-fun e!634058 () Bool)

(declare-datatypes ((tuple2!17592 0))(
  ( (tuple2!17593 (_1!8807 (_ BitVec 64)) (_2!8807 V!42041)) )
))
(declare-datatypes ((List!24276 0))(
  ( (Nil!24273) (Cons!24272 (h!25481 tuple2!17592) (t!34747 List!24276)) )
))
(declare-datatypes ((ListLongMap!15561 0))(
  ( (ListLongMap!15562 (toList!7796 List!24276)) )
))
(declare-fun call!46972 () ListLongMap!15561)

(declare-fun call!46971 () ListLongMap!15561)

(assert (=> b!1112035 (= e!634058 (= call!46972 call!46971))))

(declare-fun b!1112036 () Bool)

(declare-fun res!742086 () Bool)

(assert (=> b!1112036 (=> (not res!742086) (not e!634054))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1112036 (= res!742086 (validKeyInArray!0 k!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun minValue!944 () V!42041)

(declare-fun bm!46968 () Bool)

(declare-fun zeroValue!944 () V!42041)

(declare-fun lt!496451 () array!72283)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4287 (array!72283 array!72285 (_ BitVec 32) (_ BitVec 32) V!42041 V!42041 (_ BitVec 32) Int) ListLongMap!15561)

(declare-fun dynLambda!2413 (Int (_ BitVec 64)) V!42041)

(assert (=> bm!46968 (= call!46972 (getCurrentListMapNoExtraKeys!4287 lt!496451 (array!72286 (store (arr!34795 _values!996) i!673 (ValueCellFull!13133 (dynLambda!2413 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35331 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1112037 () Bool)

(declare-fun res!742084 () Bool)

(assert (=> b!1112037 (=> (not res!742084) (not e!634054))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1112037 (= res!742084 (validMask!0 mask!1564))))

(declare-fun b!1112038 () Bool)

(declare-fun res!742078 () Bool)

(assert (=> b!1112038 (=> (not res!742078) (not e!634054))))

(assert (=> b!1112038 (= res!742078 (and (= (size!35331 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35330 _keys!1208) (size!35331 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1112039 () Bool)

(declare-fun e!634055 () Bool)

(assert (=> b!1112039 (= e!634055 true)))

(assert (=> b!1112039 e!634058))

(declare-fun c!109335 () Bool)

(assert (=> b!1112039 (= c!109335 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36490 0))(
  ( (Unit!36491) )
))
(declare-fun lt!496450 () Unit!36490)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!310 (array!72283 array!72285 (_ BitVec 32) (_ BitVec 32) V!42041 V!42041 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36490)

(assert (=> b!1112039 (= lt!496450 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!310 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1112040 () Bool)

(declare-fun e!634053 () Bool)

(assert (=> b!1112040 (= e!634053 tp_is_empty!27685)))

(declare-fun b!1112041 () Bool)

(declare-fun e!634057 () Bool)

(assert (=> b!1112041 (= e!634057 (not e!634055))))

(declare-fun res!742087 () Bool)

(assert (=> b!1112041 (=> res!742087 e!634055)))

(assert (=> b!1112041 (= res!742087 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35330 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1112041 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!496449 () Unit!36490)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72283 (_ BitVec 64) (_ BitVec 32)) Unit!36490)

(assert (=> b!1112041 (= lt!496449 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1112042 () Bool)

(declare-fun res!742083 () Bool)

(assert (=> b!1112042 (=> (not res!742083) (not e!634057))))

(assert (=> b!1112042 (= res!742083 (arrayNoDuplicates!0 lt!496451 #b00000000000000000000000000000000 Nil!24272))))

(declare-fun bm!46969 () Bool)

(assert (=> bm!46969 (= call!46971 (getCurrentListMapNoExtraKeys!4287 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1112043 () Bool)

(declare-fun -!1061 (ListLongMap!15561 (_ BitVec 64)) ListLongMap!15561)

(assert (=> b!1112043 (= e!634058 (= call!46972 (-!1061 call!46971 k!934)))))

(declare-fun b!1112044 () Bool)

(assert (=> b!1112044 (= e!634054 e!634057)))

(declare-fun res!742082 () Bool)

(assert (=> b!1112044 (=> (not res!742082) (not e!634057))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72283 (_ BitVec 32)) Bool)

(assert (=> b!1112044 (= res!742082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496451 mask!1564))))

(assert (=> b!1112044 (= lt!496451 (array!72284 (store (arr!34794 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35330 _keys!1208)))))

(declare-fun b!1112045 () Bool)

(declare-fun res!742079 () Bool)

(assert (=> b!1112045 (=> (not res!742079) (not e!634054))))

(assert (=> b!1112045 (= res!742079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!43345 () Bool)

(declare-fun tp!82574 () Bool)

(assert (=> mapNonEmpty!43345 (= mapRes!43345 (and tp!82574 e!634056))))

(declare-fun mapValue!43345 () ValueCell!13133)

(declare-fun mapKey!43345 () (_ BitVec 32))

(declare-fun mapRest!43345 () (Array (_ BitVec 32) ValueCell!13133))

(assert (=> mapNonEmpty!43345 (= (arr!34795 _values!996) (store mapRest!43345 mapKey!43345 mapValue!43345))))

(declare-fun b!1112046 () Bool)

(assert (=> b!1112046 (= e!634059 (and e!634053 mapRes!43345))))

(declare-fun condMapEmpty!43345 () Bool)

(declare-fun mapDefault!43345 () ValueCell!13133)

