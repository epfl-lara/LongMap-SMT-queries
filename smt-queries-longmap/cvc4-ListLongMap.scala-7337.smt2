; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93718 () Bool)

(assert start!93718)

(declare-fun b_free!21203 () Bool)

(declare-fun b_next!21203 () Bool)

(assert (=> start!93718 (= b_free!21203 (not b_next!21203))))

(declare-fun tp!75028 () Bool)

(declare-fun b_and!33913 () Bool)

(assert (=> start!93718 (= tp!75028 b_and!33913)))

(declare-fun mapNonEmpty!39187 () Bool)

(declare-fun mapRes!39187 () Bool)

(declare-fun tp!75029 () Bool)

(declare-fun e!603509 () Bool)

(assert (=> mapNonEmpty!39187 (= mapRes!39187 (and tp!75029 e!603509))))

(declare-datatypes ((V!38485 0))(
  ( (V!38486 (val!12557 Int)) )
))
(declare-datatypes ((ValueCell!11803 0))(
  ( (ValueCellFull!11803 (v!15167 V!38485)) (EmptyCell!11803) )
))
(declare-fun mapValue!39187 () ValueCell!11803)

(declare-fun mapRest!39187 () (Array (_ BitVec 32) ValueCell!11803))

(declare-datatypes ((array!67049 0))(
  ( (array!67050 (arr!32233 (Array (_ BitVec 32) ValueCell!11803)) (size!32769 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67049)

(declare-fun mapKey!39187 () (_ BitVec 32))

(assert (=> mapNonEmpty!39187 (= (arr!32233 _values!955) (store mapRest!39187 mapKey!39187 mapValue!39187))))

(declare-fun b!1060120 () Bool)

(declare-fun tp_is_empty!25013 () Bool)

(assert (=> b!1060120 (= e!603509 tp_is_empty!25013)))

(declare-fun mapIsEmpty!39187 () Bool)

(assert (=> mapIsEmpty!39187 mapRes!39187))

(declare-fun b!1060121 () Bool)

(declare-fun e!603510 () Bool)

(declare-fun e!603507 () Bool)

(assert (=> b!1060121 (= e!603510 (and e!603507 mapRes!39187))))

(declare-fun condMapEmpty!39187 () Bool)

(declare-fun mapDefault!39187 () ValueCell!11803)

