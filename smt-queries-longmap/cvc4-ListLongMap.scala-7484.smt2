; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94856 () Bool)

(assert start!94856)

(declare-fun b_free!22085 () Bool)

(declare-fun b_next!22085 () Bool)

(assert (=> start!94856 (= b_free!22085 (not b_next!22085))))

(declare-fun tp!77716 () Bool)

(declare-fun b_and!34927 () Bool)

(assert (=> start!94856 (= tp!77716 b_and!34927)))

(declare-fun mapIsEmpty!40552 () Bool)

(declare-fun mapRes!40552 () Bool)

(assert (=> mapIsEmpty!40552 mapRes!40552))

(declare-fun b!1072652 () Bool)

(declare-fun res!715513 () Bool)

(declare-fun e!612719 () Bool)

(assert (=> b!1072652 (=> (not res!715513) (not e!612719))))

(declare-datatypes ((array!68757 0))(
  ( (array!68758 (arr!33073 (Array (_ BitVec 32) (_ BitVec 64))) (size!33609 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68757)

(declare-datatypes ((List!23090 0))(
  ( (Nil!23087) (Cons!23086 (h!24295 (_ BitVec 64)) (t!32425 List!23090)) )
))
(declare-fun arrayNoDuplicates!0 (array!68757 (_ BitVec 32) List!23090) Bool)

(assert (=> b!1072652 (= res!715513 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23087))))

(declare-fun mapNonEmpty!40552 () Bool)

(declare-fun tp!77717 () Bool)

(declare-fun e!612718 () Bool)

(assert (=> mapNonEmpty!40552 (= mapRes!40552 (and tp!77717 e!612718))))

(declare-datatypes ((V!39661 0))(
  ( (V!39662 (val!12998 Int)) )
))
(declare-datatypes ((ValueCell!12244 0))(
  ( (ValueCellFull!12244 (v!15615 V!39661)) (EmptyCell!12244) )
))
(declare-fun mapValue!40552 () ValueCell!12244)

(declare-fun mapKey!40552 () (_ BitVec 32))

(declare-datatypes ((array!68759 0))(
  ( (array!68760 (arr!33074 (Array (_ BitVec 32) ValueCell!12244)) (size!33610 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68759)

(declare-fun mapRest!40552 () (Array (_ BitVec 32) ValueCell!12244))

(assert (=> mapNonEmpty!40552 (= (arr!33074 _values!955) (store mapRest!40552 mapKey!40552 mapValue!40552))))

(declare-fun b!1072653 () Bool)

(declare-fun e!612714 () Bool)

(assert (=> b!1072653 (= e!612714 (bvsle #b00000000000000000000000000000000 (size!33609 _keys!1163)))))

(declare-fun b!1072654 () Bool)

(declare-fun e!612712 () Bool)

(declare-fun e!612713 () Bool)

(assert (=> b!1072654 (= e!612712 (and e!612713 mapRes!40552))))

(declare-fun condMapEmpty!40552 () Bool)

(declare-fun mapDefault!40552 () ValueCell!12244)

