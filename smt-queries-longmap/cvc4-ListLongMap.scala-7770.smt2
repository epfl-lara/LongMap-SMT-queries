; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97368 () Bool)

(assert start!97368)

(declare-fun b_free!23339 () Bool)

(declare-fun b_next!23339 () Bool)

(assert (=> start!97368 (= b_free!23339 (not b_next!23339))))

(declare-fun tp!82315 () Bool)

(declare-fun b_and!37513 () Bool)

(assert (=> start!97368 (= tp!82315 b_and!37513)))

(declare-datatypes ((V!41925 0))(
  ( (V!41926 (val!13856 Int)) )
))
(declare-fun zeroValue!944 () V!41925)

(declare-datatypes ((array!72115 0))(
  ( (array!72116 (arr!34710 (Array (_ BitVec 32) (_ BitVec 64))) (size!35246 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72115)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!46710 () Bool)

(declare-datatypes ((ValueCell!13090 0))(
  ( (ValueCellFull!13090 (v!16489 V!41925)) (EmptyCell!13090) )
))
(declare-datatypes ((array!72117 0))(
  ( (array!72118 (arr!34711 (Array (_ BitVec 32) ValueCell!13090)) (size!35247 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72117)

(declare-fun minValue!944 () V!41925)

(declare-datatypes ((tuple2!17520 0))(
  ( (tuple2!17521 (_1!8771 (_ BitVec 64)) (_2!8771 V!41925)) )
))
(declare-datatypes ((List!24203 0))(
  ( (Nil!24200) (Cons!24199 (h!25408 tuple2!17520) (t!34588 List!24203)) )
))
(declare-datatypes ((ListLongMap!15489 0))(
  ( (ListLongMap!15490 (toList!7760 List!24203)) )
))
(declare-fun call!46713 () ListLongMap!15489)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4254 (array!72115 array!72117 (_ BitVec 32) (_ BitVec 32) V!41925 V!41925 (_ BitVec 32) Int) ListLongMap!15489)

(assert (=> bm!46710 (= call!46713 (getCurrentListMapNoExtraKeys!4254 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109869 () Bool)

(declare-fun res!740666 () Bool)

(declare-fun e!633016 () Bool)

(assert (=> b!1109869 (=> (not res!740666) (not e!633016))))

(declare-datatypes ((List!24204 0))(
  ( (Nil!24201) (Cons!24200 (h!25409 (_ BitVec 64)) (t!34589 List!24204)) )
))
(declare-fun arrayNoDuplicates!0 (array!72115 (_ BitVec 32) List!24204) Bool)

(assert (=> b!1109869 (= res!740666 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24201))))

(declare-fun b!1109870 () Bool)

(declare-fun e!633018 () Bool)

(assert (=> b!1109870 (= e!633018 true)))

(declare-fun e!633020 () Bool)

(assert (=> b!1109870 e!633020))

(declare-fun c!109200 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1109870 (= c!109200 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36426 0))(
  ( (Unit!36427) )
))
(declare-fun lt!496062 () Unit!36426)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!282 (array!72115 array!72117 (_ BitVec 32) (_ BitVec 32) V!41925 V!41925 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36426)

(assert (=> b!1109870 (= lt!496062 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!282 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109871 () Bool)

(declare-fun e!633019 () Bool)

(declare-fun e!633021 () Bool)

(declare-fun mapRes!43216 () Bool)

(assert (=> b!1109871 (= e!633019 (and e!633021 mapRes!43216))))

(declare-fun condMapEmpty!43216 () Bool)

(declare-fun mapDefault!43216 () ValueCell!13090)

