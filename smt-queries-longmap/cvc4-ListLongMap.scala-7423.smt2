; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94378 () Bool)

(assert start!94378)

(declare-fun b_free!21719 () Bool)

(declare-fun b_next!21719 () Bool)

(assert (=> start!94378 (= b_free!21719 (not b_next!21719))))

(declare-fun tp!76600 () Bool)

(declare-fun b_and!34503 () Bool)

(assert (=> start!94378 (= tp!76600 b_and!34503)))

(declare-fun mapNonEmpty!39985 () Bool)

(declare-fun mapRes!39985 () Bool)

(declare-fun tp!76601 () Bool)

(declare-fun e!608660 () Bool)

(assert (=> mapNonEmpty!39985 (= mapRes!39985 (and tp!76601 e!608660))))

(declare-fun mapKey!39985 () (_ BitVec 32))

(declare-datatypes ((V!39173 0))(
  ( (V!39174 (val!12815 Int)) )
))
(declare-datatypes ((ValueCell!12061 0))(
  ( (ValueCellFull!12061 (v!15429 V!39173)) (EmptyCell!12061) )
))
(declare-fun mapValue!39985 () ValueCell!12061)

(declare-fun mapRest!39985 () (Array (_ BitVec 32) ValueCell!12061))

(declare-datatypes ((array!68043 0))(
  ( (array!68044 (arr!32722 (Array (_ BitVec 32) ValueCell!12061)) (size!33258 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68043)

(assert (=> mapNonEmpty!39985 (= (arr!32722 _values!955) (store mapRest!39985 mapKey!39985 mapValue!39985))))

(declare-fun b!1067205 () Bool)

(declare-fun e!608663 () Bool)

(declare-fun tp_is_empty!25529 () Bool)

(assert (=> b!1067205 (= e!608663 tp_is_empty!25529)))

(declare-fun b!1067206 () Bool)

(declare-fun e!608661 () Bool)

(assert (=> b!1067206 (= e!608661 (and e!608663 mapRes!39985))))

(declare-fun condMapEmpty!39985 () Bool)

(declare-fun mapDefault!39985 () ValueCell!12061)

