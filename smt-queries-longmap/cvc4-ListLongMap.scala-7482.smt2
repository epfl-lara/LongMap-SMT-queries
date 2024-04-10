; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94844 () Bool)

(assert start!94844)

(declare-fun b_free!22073 () Bool)

(declare-fun b_next!22073 () Bool)

(assert (=> start!94844 (= b_free!22073 (not b_next!22073))))

(declare-fun tp!77680 () Bool)

(declare-fun b_and!34915 () Bool)

(assert (=> start!94844 (= tp!77680 b_and!34915)))

(declare-fun b!1072482 () Bool)

(declare-fun e!612581 () Bool)

(declare-fun e!612582 () Bool)

(declare-fun mapRes!40534 () Bool)

(assert (=> b!1072482 (= e!612581 (and e!612582 mapRes!40534))))

(declare-fun condMapEmpty!40534 () Bool)

(declare-datatypes ((V!39645 0))(
  ( (V!39646 (val!12992 Int)) )
))
(declare-datatypes ((ValueCell!12238 0))(
  ( (ValueCellFull!12238 (v!15609 V!39645)) (EmptyCell!12238) )
))
(declare-datatypes ((array!68735 0))(
  ( (array!68736 (arr!33062 (Array (_ BitVec 32) ValueCell!12238)) (size!33598 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68735)

(declare-fun mapDefault!40534 () ValueCell!12238)

