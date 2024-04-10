; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97138 () Bool)

(assert start!97138)

(declare-fun mapNonEmpty!42892 () Bool)

(declare-fun mapRes!42892 () Bool)

(declare-fun tp!81812 () Bool)

(declare-fun e!630682 () Bool)

(assert (=> mapNonEmpty!42892 (= mapRes!42892 (and tp!81812 e!630682))))

(declare-fun mapKey!42892 () (_ BitVec 32))

(declare-datatypes ((V!41641 0))(
  ( (V!41642 (val!13749 Int)) )
))
(declare-datatypes ((ValueCell!12983 0))(
  ( (ValueCellFull!12983 (v!16382 V!41641)) (EmptyCell!12983) )
))
(declare-fun mapValue!42892 () ValueCell!12983)

(declare-fun mapRest!42892 () (Array (_ BitVec 32) ValueCell!12983))

(declare-datatypes ((array!71691 0))(
  ( (array!71692 (arr!34499 (Array (_ BitVec 32) ValueCell!12983)) (size!35035 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71691)

(assert (=> mapNonEmpty!42892 (= (arr!34499 _values!996) (store mapRest!42892 mapKey!42892 mapValue!42892))))

(declare-fun b!1104967 () Bool)

(declare-fun res!737247 () Bool)

(declare-fun e!630681 () Bool)

(assert (=> b!1104967 (=> (not res!737247) (not e!630681))))

(declare-datatypes ((array!71693 0))(
  ( (array!71694 (arr!34500 (Array (_ BitVec 32) (_ BitVec 64))) (size!35036 (_ BitVec 32))) )
))
(declare-fun lt!495226 () array!71693)

(declare-datatypes ((List!24066 0))(
  ( (Nil!24063) (Cons!24062 (h!25271 (_ BitVec 64)) (t!34331 List!24066)) )
))
(declare-fun arrayNoDuplicates!0 (array!71693 (_ BitVec 32) List!24066) Bool)

(assert (=> b!1104967 (= res!737247 (arrayNoDuplicates!0 lt!495226 #b00000000000000000000000000000000 Nil!24063))))

(declare-fun b!1104968 () Bool)

(declare-fun res!737250 () Bool)

(declare-fun e!630680 () Bool)

(assert (=> b!1104968 (=> (not res!737250) (not e!630680))))

(declare-fun _keys!1208 () array!71693)

(assert (=> b!1104968 (= res!737250 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24063))))

(declare-fun res!737249 () Bool)

(assert (=> start!97138 (=> (not res!737249) (not e!630680))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97138 (= res!737249 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35036 _keys!1208))))))

(assert (=> start!97138 e!630680))

(declare-fun array_inv!26558 (array!71693) Bool)

(assert (=> start!97138 (array_inv!26558 _keys!1208)))

(assert (=> start!97138 true))

(declare-fun e!630678 () Bool)

(declare-fun array_inv!26559 (array!71691) Bool)

(assert (=> start!97138 (and (array_inv!26559 _values!996) e!630678)))

(declare-fun b!1104969 () Bool)

(declare-fun res!737246 () Bool)

(assert (=> b!1104969 (=> (not res!737246) (not e!630680))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1104969 (= res!737246 (validKeyInArray!0 k!934))))

(declare-fun b!1104970 () Bool)

(declare-fun res!737248 () Bool)

(assert (=> b!1104970 (=> (not res!737248) (not e!630680))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71693 (_ BitVec 32)) Bool)

(assert (=> b!1104970 (= res!737248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1104971 () Bool)

(declare-fun e!630679 () Bool)

(assert (=> b!1104971 (= e!630678 (and e!630679 mapRes!42892))))

(declare-fun condMapEmpty!42892 () Bool)

(declare-fun mapDefault!42892 () ValueCell!12983)

