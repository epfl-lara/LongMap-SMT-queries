; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95346 () Bool)

(assert start!95346)

(declare-fun mapNonEmpty!40867 () Bool)

(declare-fun mapRes!40867 () Bool)

(declare-fun tp!78329 () Bool)

(declare-fun e!615828 () Bool)

(assert (=> mapNonEmpty!40867 (= mapRes!40867 (and tp!78329 e!615828))))

(declare-datatypes ((V!39913 0))(
  ( (V!39914 (val!13101 Int)) )
))
(declare-datatypes ((ValueCell!12335 0))(
  ( (ValueCellFull!12335 (v!15720 V!39913)) (EmptyCell!12335) )
))
(declare-fun mapValue!40867 () ValueCell!12335)

(declare-fun mapKey!40867 () (_ BitVec 32))

(declare-datatypes ((array!69127 0))(
  ( (array!69128 (arr!33244 (Array (_ BitVec 32) ValueCell!12335)) (size!33780 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69127)

(declare-fun mapRest!40867 () (Array (_ BitVec 32) ValueCell!12335))

(assert (=> mapNonEmpty!40867 (= (arr!33244 _values!874) (store mapRest!40867 mapKey!40867 mapValue!40867))))

(declare-fun b!1077126 () Bool)

(declare-fun e!615827 () Bool)

(declare-fun e!615826 () Bool)

(assert (=> b!1077126 (= e!615827 (and e!615826 mapRes!40867))))

(declare-fun condMapEmpty!40867 () Bool)

(declare-fun mapDefault!40867 () ValueCell!12335)

