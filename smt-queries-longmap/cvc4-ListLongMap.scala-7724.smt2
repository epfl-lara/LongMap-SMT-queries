; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97034 () Bool)

(assert start!97034)

(declare-fun res!736313 () Bool)

(declare-fun e!630047 () Bool)

(assert (=> start!97034 (=> (not res!736313) (not e!630047))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!71569 0))(
  ( (array!71570 (arr!34441 (Array (_ BitVec 32) (_ BitVec 64))) (size!34977 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71569)

(assert (=> start!97034 (= res!736313 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34977 _keys!1208))))))

(assert (=> start!97034 e!630047))

(declare-fun array_inv!26522 (array!71569) Bool)

(assert (=> start!97034 (array_inv!26522 _keys!1208)))

(assert (=> start!97034 true))

(declare-datatypes ((V!41557 0))(
  ( (V!41558 (val!13718 Int)) )
))
(declare-datatypes ((ValueCell!12952 0))(
  ( (ValueCellFull!12952 (v!16350 V!41557)) (EmptyCell!12952) )
))
(declare-datatypes ((array!71571 0))(
  ( (array!71572 (arr!34442 (Array (_ BitVec 32) ValueCell!12952)) (size!34978 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71571)

(declare-fun e!630049 () Bool)

(declare-fun array_inv!26523 (array!71571) Bool)

(assert (=> start!97034 (and (array_inv!26523 _values!996) e!630049)))

(declare-fun mapNonEmpty!42790 () Bool)

(declare-fun mapRes!42790 () Bool)

(declare-fun tp!81710 () Bool)

(declare-fun e!630048 () Bool)

(assert (=> mapNonEmpty!42790 (= mapRes!42790 (and tp!81710 e!630048))))

(declare-fun mapValue!42790 () ValueCell!12952)

(declare-fun mapKey!42790 () (_ BitVec 32))

(declare-fun mapRest!42790 () (Array (_ BitVec 32) ValueCell!12952))

(assert (=> mapNonEmpty!42790 (= (arr!34442 _values!996) (store mapRest!42790 mapKey!42790 mapValue!42790))))

(declare-fun mapIsEmpty!42790 () Bool)

(assert (=> mapIsEmpty!42790 mapRes!42790))

(declare-fun b!1103690 () Bool)

(declare-fun e!630050 () Bool)

(assert (=> b!1103690 (= e!630049 (and e!630050 mapRes!42790))))

(declare-fun condMapEmpty!42790 () Bool)

(declare-fun mapDefault!42790 () ValueCell!12952)

