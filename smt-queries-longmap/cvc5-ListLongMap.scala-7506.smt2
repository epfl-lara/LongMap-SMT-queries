; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95156 () Bool)

(assert start!95156)

(declare-fun b_free!22213 () Bool)

(declare-fun b_next!22213 () Bool)

(assert (=> start!95156 (= b_free!22213 (not b_next!22213))))

(declare-fun tp!78128 () Bool)

(declare-fun b_and!35155 () Bool)

(assert (=> start!95156 (= tp!78128 b_and!35155)))

(declare-fun b!1075599 () Bool)

(declare-fun e!614734 () Bool)

(declare-fun e!614739 () Bool)

(declare-fun mapRes!40771 () Bool)

(assert (=> b!1075599 (= e!614734 (and e!614739 mapRes!40771))))

(declare-fun condMapEmpty!40771 () Bool)

(declare-datatypes ((V!39833 0))(
  ( (V!39834 (val!13062 Int)) )
))
(declare-datatypes ((ValueCell!12308 0))(
  ( (ValueCellFull!12308 (v!15687 V!39833)) (EmptyCell!12308) )
))
(declare-datatypes ((array!69017 0))(
  ( (array!69018 (arr!33194 (Array (_ BitVec 32) ValueCell!12308)) (size!33730 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69017)

(declare-fun mapDefault!40771 () ValueCell!12308)

