; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97664 () Bool)

(assert start!97664)

(declare-fun b!1116186 () Bool)

(declare-fun res!745245 () Bool)

(declare-fun e!635974 () Bool)

(assert (=> b!1116186 (=> (not res!745245) (not e!635974))))

(declare-datatypes ((array!72687 0))(
  ( (array!72688 (arr!34996 (Array (_ BitVec 32) (_ BitVec 64))) (size!35532 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72687)

(declare-datatypes ((List!24362 0))(
  ( (Nil!24359) (Cons!24358 (h!25567 (_ BitVec 64)) (t!34843 List!24362)) )
))
(declare-fun arrayNoDuplicates!0 (array!72687 (_ BitVec 32) List!24362) Bool)

(assert (=> b!1116186 (= res!745245 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24359))))

(declare-fun b!1116187 () Bool)

(declare-fun e!635979 () Bool)

(assert (=> b!1116187 (= e!635979 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72687 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1116187 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36634 0))(
  ( (Unit!36635) )
))
(declare-fun lt!497095 () Unit!36634)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72687 (_ BitVec 64) (_ BitVec 32)) Unit!36634)

(assert (=> b!1116187 (= lt!497095 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1116188 () Bool)

(declare-fun res!745250 () Bool)

(assert (=> b!1116188 (=> (not res!745250) (not e!635974))))

(assert (=> b!1116188 (= res!745250 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35532 _keys!1208))))))

(declare-fun b!1116189 () Bool)

(declare-fun e!635977 () Bool)

(declare-fun tp_is_empty!27895 () Bool)

(assert (=> b!1116189 (= e!635977 tp_is_empty!27895)))

(declare-fun b!1116190 () Bool)

(declare-fun e!635976 () Bool)

(declare-fun mapRes!43660 () Bool)

(assert (=> b!1116190 (= e!635976 (and e!635977 mapRes!43660))))

(declare-fun condMapEmpty!43660 () Bool)

(declare-datatypes ((V!42321 0))(
  ( (V!42322 (val!14004 Int)) )
))
(declare-datatypes ((ValueCell!13238 0))(
  ( (ValueCellFull!13238 (v!16637 V!42321)) (EmptyCell!13238) )
))
(declare-datatypes ((array!72689 0))(
  ( (array!72690 (arr!34997 (Array (_ BitVec 32) ValueCell!13238)) (size!35533 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72689)

(declare-fun mapDefault!43660 () ValueCell!13238)

