; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42492 () Bool)

(assert start!42492)

(declare-fun b_free!11947 () Bool)

(declare-fun b_next!11947 () Bool)

(assert (=> start!42492 (= b_free!11947 (not b_next!11947))))

(declare-fun tp!41877 () Bool)

(declare-fun b_and!20415 () Bool)

(assert (=> start!42492 (= tp!41877 b_and!20415)))

(declare-fun mapNonEmpty!21778 () Bool)

(declare-fun mapRes!21778 () Bool)

(declare-fun tp!41878 () Bool)

(declare-fun e!278238 () Bool)

(assert (=> mapNonEmpty!21778 (= mapRes!21778 (and tp!41878 e!278238))))

(declare-datatypes ((V!18939 0))(
  ( (V!18940 (val!6732 Int)) )
))
(declare-datatypes ((ValueCell!6344 0))(
  ( (ValueCellFull!6344 (v!9024 V!18939)) (EmptyCell!6344) )
))
(declare-datatypes ((array!30503 0))(
  ( (array!30504 (arr!14670 (Array (_ BitVec 32) ValueCell!6344)) (size!15022 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30503)

(declare-fun mapRest!21778 () (Array (_ BitVec 32) ValueCell!6344))

(declare-fun mapValue!21778 () ValueCell!6344)

(declare-fun mapKey!21778 () (_ BitVec 32))

(assert (=> mapNonEmpty!21778 (= (arr!14670 _values!833) (store mapRest!21778 mapKey!21778 mapValue!21778))))

(declare-fun b!474117 () Bool)

(declare-fun e!278242 () Bool)

(declare-fun e!278239 () Bool)

(assert (=> b!474117 (= e!278242 (and e!278239 mapRes!21778))))

(declare-fun condMapEmpty!21778 () Bool)

(declare-fun mapDefault!21778 () ValueCell!6344)

