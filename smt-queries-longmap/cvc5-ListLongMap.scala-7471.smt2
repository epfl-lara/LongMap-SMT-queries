; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94750 () Bool)

(assert start!94750)

(declare-fun b_free!22003 () Bool)

(declare-fun b_next!22003 () Bool)

(assert (=> start!94750 (= b_free!22003 (not b_next!22003))))

(declare-fun tp!77467 () Bool)

(declare-fun b_and!34833 () Bool)

(assert (=> start!94750 (= tp!77467 b_and!34833)))

(declare-fun b!1071345 () Bool)

(declare-fun e!611723 () Bool)

(declare-fun e!611722 () Bool)

(declare-fun mapRes!40426 () Bool)

(assert (=> b!1071345 (= e!611723 (and e!611722 mapRes!40426))))

(declare-fun condMapEmpty!40426 () Bool)

(declare-datatypes ((V!39553 0))(
  ( (V!39554 (val!12957 Int)) )
))
(declare-datatypes ((ValueCell!12203 0))(
  ( (ValueCellFull!12203 (v!15573 V!39553)) (EmptyCell!12203) )
))
(declare-datatypes ((array!68601 0))(
  ( (array!68602 (arr!32996 (Array (_ BitVec 32) ValueCell!12203)) (size!33532 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68601)

(declare-fun mapDefault!40426 () ValueCell!12203)

