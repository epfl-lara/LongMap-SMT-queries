; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93858 () Bool)

(assert start!93858)

(declare-fun b_free!21331 () Bool)

(declare-fun b_next!21331 () Bool)

(assert (=> start!93858 (= b_free!21331 (not b_next!21331))))

(declare-fun tp!75415 () Bool)

(declare-fun b_and!34045 () Bool)

(assert (=> start!93858 (= tp!75415 b_and!34045)))

(declare-fun b!1061537 () Bool)

(declare-fun res!708878 () Bool)

(declare-fun e!604515 () Bool)

(assert (=> b!1061537 (=> (not res!708878) (not e!604515))))

(declare-datatypes ((array!67285 0))(
  ( (array!67286 (arr!32350 (Array (_ BitVec 32) (_ BitVec 64))) (size!32886 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67285)

(declare-datatypes ((List!22539 0))(
  ( (Nil!22536) (Cons!22535 (h!23744 (_ BitVec 64)) (t!31848 List!22539)) )
))
(declare-fun arrayNoDuplicates!0 (array!67285 (_ BitVec 32) List!22539) Bool)

(assert (=> b!1061537 (= res!708878 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22536))))

(declare-fun mapIsEmpty!39382 () Bool)

(declare-fun mapRes!39382 () Bool)

(assert (=> mapIsEmpty!39382 mapRes!39382))

(declare-fun mapNonEmpty!39382 () Bool)

(declare-fun tp!75416 () Bool)

(declare-fun e!604516 () Bool)

(assert (=> mapNonEmpty!39382 (= mapRes!39382 (and tp!75416 e!604516))))

(declare-fun mapKey!39382 () (_ BitVec 32))

(declare-datatypes ((V!38657 0))(
  ( (V!38658 (val!12621 Int)) )
))
(declare-datatypes ((ValueCell!11867 0))(
  ( (ValueCellFull!11867 (v!15231 V!38657)) (EmptyCell!11867) )
))
(declare-datatypes ((array!67287 0))(
  ( (array!67288 (arr!32351 (Array (_ BitVec 32) ValueCell!11867)) (size!32887 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67287)

(declare-fun mapRest!39382 () (Array (_ BitVec 32) ValueCell!11867))

(declare-fun mapValue!39382 () ValueCell!11867)

(assert (=> mapNonEmpty!39382 (= (arr!32351 _values!955) (store mapRest!39382 mapKey!39382 mapValue!39382))))

(declare-fun b!1061539 () Bool)

(declare-fun tp_is_empty!25141 () Bool)

(assert (=> b!1061539 (= e!604516 tp_is_empty!25141)))

(declare-fun b!1061540 () Bool)

(declare-fun e!604518 () Bool)

(declare-fun e!604514 () Bool)

(assert (=> b!1061540 (= e!604518 (and e!604514 mapRes!39382))))

(declare-fun condMapEmpty!39382 () Bool)

(declare-fun mapDefault!39382 () ValueCell!11867)

