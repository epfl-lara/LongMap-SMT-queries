; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96958 () Bool)

(assert start!96958)

(declare-fun b!1103078 () Bool)

(declare-fun res!735949 () Bool)

(declare-fun e!629630 () Bool)

(assert (=> b!1103078 (=> (not res!735949) (not e!629630))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103078 (= res!735949 (validMask!0 mask!1564))))

(declare-fun res!735948 () Bool)

(assert (=> start!96958 (=> (not res!735948) (not e!629630))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!71475 0))(
  ( (array!71476 (arr!34397 (Array (_ BitVec 32) (_ BitVec 64))) (size!34933 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71475)

(assert (=> start!96958 (= res!735948 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34933 _keys!1208))))))

(assert (=> start!96958 e!629630))

(declare-fun array_inv!26492 (array!71475) Bool)

(assert (=> start!96958 (array_inv!26492 _keys!1208)))

(assert (=> start!96958 true))

(declare-datatypes ((V!41497 0))(
  ( (V!41498 (val!13695 Int)) )
))
(declare-datatypes ((ValueCell!12929 0))(
  ( (ValueCellFull!12929 (v!16326 V!41497)) (EmptyCell!12929) )
))
(declare-datatypes ((array!71477 0))(
  ( (array!71478 (arr!34398 (Array (_ BitVec 32) ValueCell!12929)) (size!34934 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71477)

(declare-fun e!629631 () Bool)

(declare-fun array_inv!26493 (array!71477) Bool)

(assert (=> start!96958 (and (array_inv!26493 _values!996) e!629631)))

(declare-fun mapIsEmpty!42712 () Bool)

(declare-fun mapRes!42712 () Bool)

(assert (=> mapIsEmpty!42712 mapRes!42712))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun b!1103079 () Bool)

(assert (=> b!1103079 (= e!629630 (and (= (size!34934 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34933 _keys!1208) (size!34934 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011) (= (size!34933 _keys!1208) (bvadd #b00000000000000000000000000000001 mask!1564)) (bvsgt #b00000000000000000000000000000000 (size!34933 _keys!1208))))))

(declare-fun b!1103080 () Bool)

(declare-fun e!629628 () Bool)

(declare-fun tp_is_empty!27277 () Bool)

(assert (=> b!1103080 (= e!629628 tp_is_empty!27277)))

(declare-fun mapNonEmpty!42712 () Bool)

(declare-fun tp!81632 () Bool)

(declare-fun e!629629 () Bool)

(assert (=> mapNonEmpty!42712 (= mapRes!42712 (and tp!81632 e!629629))))

(declare-fun mapKey!42712 () (_ BitVec 32))

(declare-fun mapRest!42712 () (Array (_ BitVec 32) ValueCell!12929))

(declare-fun mapValue!42712 () ValueCell!12929)

(assert (=> mapNonEmpty!42712 (= (arr!34398 _values!996) (store mapRest!42712 mapKey!42712 mapValue!42712))))

(declare-fun b!1103081 () Bool)

(assert (=> b!1103081 (= e!629629 tp_is_empty!27277)))

(declare-fun b!1103082 () Bool)

(assert (=> b!1103082 (= e!629631 (and e!629628 mapRes!42712))))

(declare-fun condMapEmpty!42712 () Bool)

(declare-fun mapDefault!42712 () ValueCell!12929)

