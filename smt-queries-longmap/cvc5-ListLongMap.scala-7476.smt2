; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94804 () Bool)

(assert start!94804)

(declare-fun b_free!22033 () Bool)

(declare-fun b_next!22033 () Bool)

(assert (=> start!94804 (= b_free!22033 (not b_next!22033))))

(declare-fun tp!77561 () Bool)

(declare-fun b_and!34875 () Bool)

(assert (=> start!94804 (= tp!77561 b_and!34875)))

(declare-fun b!1071942 () Bool)

(declare-fun e!612164 () Bool)

(declare-fun e!612159 () Bool)

(declare-fun mapRes!40474 () Bool)

(assert (=> b!1071942 (= e!612164 (and e!612159 mapRes!40474))))

(declare-fun condMapEmpty!40474 () Bool)

(declare-datatypes ((V!39593 0))(
  ( (V!39594 (val!12972 Int)) )
))
(declare-datatypes ((ValueCell!12218 0))(
  ( (ValueCellFull!12218 (v!15589 V!39593)) (EmptyCell!12218) )
))
(declare-datatypes ((array!68659 0))(
  ( (array!68660 (arr!33024 (Array (_ BitVec 32) ValueCell!12218)) (size!33560 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68659)

(declare-fun mapDefault!40474 () ValueCell!12218)

