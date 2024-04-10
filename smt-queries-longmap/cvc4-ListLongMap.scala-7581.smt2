; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95810 () Bool)

(assert start!95810)

(declare-fun b_free!22463 () Bool)

(declare-fun b_next!22463 () Bool)

(assert (=> start!95810 (= b_free!22463 (not b_next!22463))))

(declare-fun tp!79238 () Bool)

(declare-fun b_and!35601 () Bool)

(assert (=> start!95810 (= tp!79238 b_and!35601)))

(declare-fun b!1084009 () Bool)

(declare-fun e!619344 () Bool)

(declare-fun e!619348 () Bool)

(declare-fun mapRes!41452 () Bool)

(assert (=> b!1084009 (= e!619344 (and e!619348 mapRes!41452))))

(declare-fun condMapEmpty!41452 () Bool)

(declare-datatypes ((V!40413 0))(
  ( (V!40414 (val!13289 Int)) )
))
(declare-datatypes ((ValueCell!12523 0))(
  ( (ValueCellFull!12523 (v!15910 V!40413)) (EmptyCell!12523) )
))
(declare-datatypes ((array!69873 0))(
  ( (array!69874 (arr!33610 (Array (_ BitVec 32) ValueCell!12523)) (size!34146 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69873)

(declare-fun mapDefault!41452 () ValueCell!12523)

