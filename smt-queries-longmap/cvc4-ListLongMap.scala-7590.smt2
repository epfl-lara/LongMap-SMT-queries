; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95864 () Bool)

(assert start!95864)

(declare-fun b_free!22517 () Bool)

(declare-fun b_next!22517 () Bool)

(assert (=> start!95864 (= b_free!22517 (not b_next!22517))))

(declare-fun tp!79400 () Bool)

(declare-fun b_and!35709 () Bool)

(assert (=> start!95864 (= tp!79400 b_and!35709)))

(declare-fun b!1085105 () Bool)

(declare-fun e!619896 () Bool)

(declare-fun e!619894 () Bool)

(declare-fun mapRes!41533 () Bool)

(assert (=> b!1085105 (= e!619896 (and e!619894 mapRes!41533))))

(declare-fun condMapEmpty!41533 () Bool)

(declare-datatypes ((V!40485 0))(
  ( (V!40486 (val!13316 Int)) )
))
(declare-datatypes ((ValueCell!12550 0))(
  ( (ValueCellFull!12550 (v!15937 V!40485)) (EmptyCell!12550) )
))
(declare-datatypes ((array!69975 0))(
  ( (array!69976 (arr!33661 (Array (_ BitVec 32) ValueCell!12550)) (size!34197 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69975)

(declare-fun mapDefault!41533 () ValueCell!12550)

