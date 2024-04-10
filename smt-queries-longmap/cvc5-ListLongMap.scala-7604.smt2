; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95944 () Bool)

(assert start!95944)

(declare-fun b_free!22597 () Bool)

(declare-fun b_next!22597 () Bool)

(assert (=> start!95944 (= b_free!22597 (not b_next!22597))))

(declare-fun tp!79639 () Bool)

(declare-fun b_and!35869 () Bool)

(assert (=> start!95944 (= tp!79639 b_and!35869)))

(declare-fun b!1086865 () Bool)

(declare-fun e!620855 () Bool)

(declare-fun e!620851 () Bool)

(declare-fun mapRes!41653 () Bool)

(assert (=> b!1086865 (= e!620855 (and e!620851 mapRes!41653))))

(declare-fun condMapEmpty!41653 () Bool)

(declare-datatypes ((V!40593 0))(
  ( (V!40594 (val!13356 Int)) )
))
(declare-datatypes ((ValueCell!12590 0))(
  ( (ValueCellFull!12590 (v!15977 V!40593)) (EmptyCell!12590) )
))
(declare-datatypes ((array!70129 0))(
  ( (array!70130 (arr!33738 (Array (_ BitVec 32) ValueCell!12590)) (size!34274 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70129)

(declare-fun mapDefault!41653 () ValueCell!12590)

