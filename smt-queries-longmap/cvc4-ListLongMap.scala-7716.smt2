; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96956 () Bool)

(assert start!96956)

(declare-fun b!1103063 () Bool)

(declare-fun res!735942 () Bool)

(declare-fun e!629616 () Bool)

(assert (=> b!1103063 (=> (not res!735942) (not e!629616))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103063 (= res!735942 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!42709 () Bool)

(declare-fun mapRes!42709 () Bool)

(declare-fun tp!81629 () Bool)

(declare-fun e!629615 () Bool)

(assert (=> mapNonEmpty!42709 (= mapRes!42709 (and tp!81629 e!629615))))

(declare-datatypes ((V!41493 0))(
  ( (V!41494 (val!13694 Int)) )
))
(declare-datatypes ((ValueCell!12928 0))(
  ( (ValueCellFull!12928 (v!16325 V!41493)) (EmptyCell!12928) )
))
(declare-fun mapRest!42709 () (Array (_ BitVec 32) ValueCell!12928))

(declare-fun mapKey!42709 () (_ BitVec 32))

(declare-fun mapValue!42709 () ValueCell!12928)

(declare-datatypes ((array!71473 0))(
  ( (array!71474 (arr!34396 (Array (_ BitVec 32) ValueCell!12928)) (size!34932 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71473)

(assert (=> mapNonEmpty!42709 (= (arr!34396 _values!996) (store mapRest!42709 mapKey!42709 mapValue!42709))))

(declare-fun b!1103064 () Bool)

(declare-fun e!629614 () Bool)

(declare-fun tp_is_empty!27275 () Bool)

(assert (=> b!1103064 (= e!629614 tp_is_empty!27275)))

(declare-fun b!1103065 () Bool)

(declare-fun e!629617 () Bool)

(assert (=> b!1103065 (= e!629617 (and e!629614 mapRes!42709))))

(declare-fun condMapEmpty!42709 () Bool)

(declare-fun mapDefault!42709 () ValueCell!12928)

