; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97148 () Bool)

(assert start!97148)

(declare-fun b!1105163 () Bool)

(declare-fun res!737394 () Bool)

(declare-fun e!630770 () Bool)

(assert (=> b!1105163 (=> (not res!737394) (not e!630770))))

(declare-datatypes ((array!71711 0))(
  ( (array!71712 (arr!34509 (Array (_ BitVec 32) (_ BitVec 64))) (size!35045 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71711)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1105163 (= res!737394 (= (select (arr!34509 _keys!1208) i!673) k!934))))

(declare-fun b!1105164 () Bool)

(declare-fun e!630772 () Bool)

(assert (=> b!1105164 (= e!630772 (not (or (bvsge #b00000000000000000000000000000000 (size!35045 _keys!1208)) (bvslt (size!35045 _keys!1208) #b01111111111111111111111111111111))))))

(declare-fun arrayContainsKey!0 (array!71711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1105164 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36266 0))(
  ( (Unit!36267) )
))
(declare-fun lt!495257 () Unit!36266)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71711 (_ BitVec 64) (_ BitVec 32)) Unit!36266)

(assert (=> b!1105164 (= lt!495257 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1105165 () Bool)

(declare-fun res!737395 () Bool)

(assert (=> b!1105165 (=> (not res!737395) (not e!630770))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105165 (= res!737395 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!42907 () Bool)

(declare-fun mapRes!42907 () Bool)

(assert (=> mapIsEmpty!42907 mapRes!42907))

(declare-fun mapNonEmpty!42907 () Bool)

(declare-fun tp!81827 () Bool)

(declare-fun e!630771 () Bool)

(assert (=> mapNonEmpty!42907 (= mapRes!42907 (and tp!81827 e!630771))))

(declare-datatypes ((V!41653 0))(
  ( (V!41654 (val!13754 Int)) )
))
(declare-datatypes ((ValueCell!12988 0))(
  ( (ValueCellFull!12988 (v!16387 V!41653)) (EmptyCell!12988) )
))
(declare-fun mapValue!42907 () ValueCell!12988)

(declare-fun mapRest!42907 () (Array (_ BitVec 32) ValueCell!12988))

(declare-datatypes ((array!71713 0))(
  ( (array!71714 (arr!34510 (Array (_ BitVec 32) ValueCell!12988)) (size!35046 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71713)

(declare-fun mapKey!42907 () (_ BitVec 32))

(assert (=> mapNonEmpty!42907 (= (arr!34510 _values!996) (store mapRest!42907 mapKey!42907 mapValue!42907))))

(declare-fun b!1105166 () Bool)

(declare-fun res!737400 () Bool)

(assert (=> b!1105166 (=> (not res!737400) (not e!630770))))

(assert (=> b!1105166 (= res!737400 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35045 _keys!1208))))))

(declare-fun b!1105167 () Bool)

(declare-fun res!737399 () Bool)

(assert (=> b!1105167 (=> (not res!737399) (not e!630770))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105167 (= res!737399 (validKeyInArray!0 k!934))))

(declare-fun b!1105168 () Bool)

(assert (=> b!1105168 (= e!630770 e!630772)))

(declare-fun res!737396 () Bool)

(assert (=> b!1105168 (=> (not res!737396) (not e!630772))))

(declare-fun lt!495256 () array!71711)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71711 (_ BitVec 32)) Bool)

(assert (=> b!1105168 (= res!737396 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495256 mask!1564))))

(assert (=> b!1105168 (= lt!495256 (array!71712 (store (arr!34509 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35045 _keys!1208)))))

(declare-fun b!1105169 () Bool)

(declare-fun e!630768 () Bool)

(declare-fun e!630773 () Bool)

(assert (=> b!1105169 (= e!630768 (and e!630773 mapRes!42907))))

(declare-fun condMapEmpty!42907 () Bool)

(declare-fun mapDefault!42907 () ValueCell!12988)

