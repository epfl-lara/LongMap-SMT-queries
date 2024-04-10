; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98592 () Bool)

(assert start!98592)

(declare-fun b_free!24197 () Bool)

(declare-fun b_next!24197 () Bool)

(assert (=> start!98592 (= b_free!24197 (not b_next!24197))))

(declare-fun tp!85302 () Bool)

(declare-fun b_and!39243 () Bool)

(assert (=> start!98592 (= tp!85302 b_and!39243)))

(declare-fun b!1144075 () Bool)

(declare-fun res!762107 () Bool)

(declare-fun e!650817 () Bool)

(assert (=> b!1144075 (=> (not res!762107) (not e!650817))))

(declare-datatypes ((array!74307 0))(
  ( (array!74308 (arr!35804 (Array (_ BitVec 32) (_ BitVec 64))) (size!36340 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74307)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74307 (_ BitVec 32)) Bool)

(assert (=> b!1144075 (= res!762107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1144076 () Bool)

(declare-fun res!762106 () Bool)

(assert (=> b!1144076 (=> (not res!762106) (not e!650817))))

(declare-datatypes ((List!25012 0))(
  ( (Nil!25009) (Cons!25008 (h!26217 (_ BitVec 64)) (t!36201 List!25012)) )
))
(declare-fun arrayNoDuplicates!0 (array!74307 (_ BitVec 32) List!25012) Bool)

(assert (=> b!1144076 (= res!762106 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25009))))

(declare-fun b!1144077 () Bool)

(declare-datatypes ((Unit!37548 0))(
  ( (Unit!37549) )
))
(declare-fun e!650808 () Unit!37548)

(declare-fun Unit!37550 () Unit!37548)

(assert (=> b!1144077 (= e!650808 Unit!37550)))

(declare-datatypes ((V!43429 0))(
  ( (V!43430 (val!14420 Int)) )
))
(declare-fun zeroValue!944 () V!43429)

(declare-datatypes ((tuple2!18260 0))(
  ( (tuple2!18261 (_1!9141 (_ BitVec 64)) (_2!9141 V!43429)) )
))
(declare-datatypes ((List!25013 0))(
  ( (Nil!25010) (Cons!25009 (h!26218 tuple2!18260) (t!36202 List!25013)) )
))
(declare-datatypes ((ListLongMap!16229 0))(
  ( (ListLongMap!16230 (toList!8130 List!25013)) )
))
(declare-fun lt!510400 () ListLongMap!16229)

(declare-fun c!112632 () Bool)

(declare-fun call!51908 () ListLongMap!16229)

(declare-fun bm!51903 () Bool)

(declare-fun c!112635 () Bool)

(declare-fun minValue!944 () V!43429)

(declare-fun +!3557 (ListLongMap!16229 tuple2!18260) ListLongMap!16229)

(assert (=> bm!51903 (= call!51908 (+!3557 lt!510400 (ite (or c!112635 c!112632) (tuple2!18261 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18261 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1144078 () Bool)

(declare-fun e!650809 () Bool)

(assert (=> b!1144078 (= e!650817 e!650809)))

(declare-fun res!762100 () Bool)

(assert (=> b!1144078 (=> (not res!762100) (not e!650809))))

(declare-fun lt!510413 () array!74307)

(assert (=> b!1144078 (= res!762100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!510413 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1144078 (= lt!510413 (array!74308 (store (arr!35804 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36340 _keys!1208)))))

(declare-fun b!1144079 () Bool)

(declare-fun e!650822 () Bool)

(declare-fun call!51912 () ListLongMap!16229)

(declare-fun call!51911 () ListLongMap!16229)

(assert (=> b!1144079 (= e!650822 (= call!51912 call!51911))))

(declare-fun b!1144080 () Bool)

(declare-fun e!650814 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!74307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1144080 (= e!650814 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1144081 () Bool)

(declare-fun e!650812 () Bool)

(declare-fun e!650818 () Bool)

(assert (=> b!1144081 (= e!650812 e!650818)))

(declare-fun res!762102 () Bool)

(assert (=> b!1144081 (=> res!762102 e!650818)))

(assert (=> b!1144081 (= res!762102 (not (= from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13654 0))(
  ( (ValueCellFull!13654 (v!17057 V!43429)) (EmptyCell!13654) )
))
(declare-datatypes ((array!74309 0))(
  ( (array!74310 (arr!35805 (Array (_ BitVec 32) ValueCell!13654)) (size!36341 (_ BitVec 32))) )
))
(declare-fun lt!510398 () array!74309)

(declare-fun lt!510401 () ListLongMap!16229)

(declare-fun getCurrentListMapNoExtraKeys!4608 (array!74307 array!74309 (_ BitVec 32) (_ BitVec 32) V!43429 V!43429 (_ BitVec 32) Int) ListLongMap!16229)

(assert (=> b!1144081 (= lt!510401 (getCurrentListMapNoExtraKeys!4608 lt!510413 lt!510398 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!74309)

(declare-fun lt!510399 () V!43429)

(assert (=> b!1144081 (= lt!510398 (array!74310 (store (arr!35805 _values!996) i!673 (ValueCellFull!13654 lt!510399)) (size!36341 _values!996)))))

(declare-fun dynLambda!2646 (Int (_ BitVec 64)) V!43429)

(assert (=> b!1144081 (= lt!510399 (dynLambda!2646 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!510407 () ListLongMap!16229)

(assert (=> b!1144081 (= lt!510407 (getCurrentListMapNoExtraKeys!4608 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1144082 () Bool)

(declare-fun e!650821 () Bool)

(declare-fun e!650823 () Bool)

(declare-fun mapRes!44915 () Bool)

(assert (=> b!1144082 (= e!650821 (and e!650823 mapRes!44915))))

(declare-fun condMapEmpty!44915 () Bool)

(declare-fun mapDefault!44915 () ValueCell!13654)

