; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1018 () Bool)

(assert start!1018)

(declare-fun b_free!347 () Bool)

(declare-fun b_next!347 () Bool)

(assert (=> start!1018 (= b_free!347 (not b_next!347))))

(declare-fun tp!1279 () Bool)

(declare-fun b_and!499 () Bool)

(assert (=> start!1018 (= tp!1279 b_and!499)))

(declare-fun b!8763 () Bool)

(declare-fun res!8131 () Bool)

(declare-fun e!5000 () Bool)

(assert (=> b!8763 (=> (not res!8131) (not e!5000))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!743 0))(
  ( (V!744 (val!218 Int)) )
))
(declare-datatypes ((ValueCell!196 0))(
  ( (ValueCellFull!196 (v!1312 V!743)) (EmptyCell!196) )
))
(declare-datatypes ((array!783 0))(
  ( (array!784 (arr!377 (Array (_ BitVec 32) ValueCell!196)) (size!439 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!783)

(declare-datatypes ((array!785 0))(
  ( (array!786 (arr!378 (Array (_ BitVec 32) (_ BitVec 64))) (size!440 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!785)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!8763 (= res!8131 (and (= (size!439 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!440 _keys!1806) (size!439 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!8764 () Bool)

(declare-fun e!4997 () Bool)

(declare-fun tp_is_empty!425 () Bool)

(assert (=> b!8764 (= e!4997 tp_is_empty!425)))

(declare-fun mapIsEmpty!617 () Bool)

(declare-fun mapRes!617 () Bool)

(assert (=> mapIsEmpty!617 mapRes!617))

(declare-fun b!8765 () Bool)

(declare-fun e!4994 () Bool)

(declare-fun e!4999 () Bool)

(assert (=> b!8765 (= e!4994 (and e!4999 mapRes!617))))

(declare-fun condMapEmpty!617 () Bool)

(declare-fun mapDefault!617 () ValueCell!196)

