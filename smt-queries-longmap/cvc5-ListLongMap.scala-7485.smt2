; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94882 () Bool)

(assert start!94882)

(declare-fun b_free!22087 () Bool)

(declare-fun b_next!22087 () Bool)

(assert (=> start!94882 (= b_free!22087 (not b_next!22087))))

(declare-fun tp!77725 () Bool)

(declare-fun b_and!34941 () Bool)

(assert (=> start!94882 (= tp!77725 b_and!34941)))

(declare-fun b!1072859 () Bool)

(declare-fun e!612848 () Bool)

(declare-fun e!612846 () Bool)

(declare-fun mapRes!40558 () Bool)

(assert (=> b!1072859 (= e!612848 (and e!612846 mapRes!40558))))

(declare-fun condMapEmpty!40558 () Bool)

(declare-datatypes ((V!39665 0))(
  ( (V!39666 (val!12999 Int)) )
))
(declare-datatypes ((ValueCell!12245 0))(
  ( (ValueCellFull!12245 (v!15617 V!39665)) (EmptyCell!12245) )
))
(declare-datatypes ((array!68763 0))(
  ( (array!68764 (arr!33075 (Array (_ BitVec 32) ValueCell!12245)) (size!33611 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68763)

(declare-fun mapDefault!40558 () ValueCell!12245)

