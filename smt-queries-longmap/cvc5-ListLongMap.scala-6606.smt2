; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83520 () Bool)

(assert start!83520)

(declare-fun b_free!19507 () Bool)

(declare-fun b_next!19507 () Bool)

(assert (=> start!83520 (= b_free!19507 (not b_next!19507))))

(declare-fun tp!67809 () Bool)

(declare-fun b_and!31109 () Bool)

(assert (=> start!83520 (= tp!67809 b_and!31109)))

(declare-fun mapNonEmpty!35626 () Bool)

(declare-fun mapRes!35626 () Bool)

(declare-fun tp!67808 () Bool)

(declare-fun e!549921 () Bool)

(assert (=> mapNonEmpty!35626 (= mapRes!35626 (and tp!67808 e!549921))))

(declare-datatypes ((V!34865 0))(
  ( (V!34866 (val!11256 Int)) )
))
(declare-datatypes ((ValueCell!10724 0))(
  ( (ValueCellFull!10724 (v!13815 V!34865)) (EmptyCell!10724) )
))
(declare-datatypes ((array!60853 0))(
  ( (array!60854 (arr!29290 (Array (_ BitVec 32) ValueCell!10724)) (size!29769 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60853)

(declare-fun mapValue!35626 () ValueCell!10724)

(declare-fun mapKey!35626 () (_ BitVec 32))

(declare-fun mapRest!35626 () (Array (_ BitVec 32) ValueCell!10724))

(assert (=> mapNonEmpty!35626 (= (arr!29290 _values!1425) (store mapRest!35626 mapKey!35626 mapValue!35626))))

(declare-fun mapIsEmpty!35626 () Bool)

(assert (=> mapIsEmpty!35626 mapRes!35626))

(declare-fun b!975768 () Bool)

(declare-fun e!549917 () Bool)

(declare-fun e!549922 () Bool)

(assert (=> b!975768 (= e!549917 (and e!549922 mapRes!35626))))

(declare-fun condMapEmpty!35626 () Bool)

(declare-fun mapDefault!35626 () ValueCell!10724)

