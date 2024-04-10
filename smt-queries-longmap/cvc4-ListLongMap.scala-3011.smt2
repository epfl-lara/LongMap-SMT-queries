; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42404 () Bool)

(assert start!42404)

(declare-fun b_free!11879 () Bool)

(declare-fun b_next!11879 () Bool)

(assert (=> start!42404 (= b_free!11879 (not b_next!11879))))

(declare-fun tp!41670 () Bool)

(declare-fun b_and!20335 () Bool)

(assert (=> start!42404 (= tp!41670 b_and!20335)))

(declare-fun b!473120 () Bool)

(declare-fun res!282600 () Bool)

(declare-fun e!277515 () Bool)

(assert (=> b!473120 (=> (not res!282600) (not e!277515))))

(declare-datatypes ((array!30373 0))(
  ( (array!30374 (arr!14606 (Array (_ BitVec 32) (_ BitVec 64))) (size!14958 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30373)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30373 (_ BitVec 32)) Bool)

(assert (=> b!473120 (= res!282600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!282599 () Bool)

(assert (=> start!42404 (=> (not res!282599) (not e!277515))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42404 (= res!282599 (validMask!0 mask!1365))))

(assert (=> start!42404 e!277515))

(declare-fun tp_is_empty!13307 () Bool)

(assert (=> start!42404 tp_is_empty!13307))

(assert (=> start!42404 tp!41670))

(assert (=> start!42404 true))

(declare-fun array_inv!10536 (array!30373) Bool)

(assert (=> start!42404 (array_inv!10536 _keys!1025)))

(declare-datatypes ((V!18847 0))(
  ( (V!18848 (val!6698 Int)) )
))
(declare-datatypes ((ValueCell!6310 0))(
  ( (ValueCellFull!6310 (v!8989 V!18847)) (EmptyCell!6310) )
))
(declare-datatypes ((array!30375 0))(
  ( (array!30376 (arr!14607 (Array (_ BitVec 32) ValueCell!6310)) (size!14959 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30375)

(declare-fun e!277516 () Bool)

(declare-fun array_inv!10537 (array!30375) Bool)

(assert (=> start!42404 (and (array_inv!10537 _values!833) e!277516)))

(declare-fun mapNonEmpty!21673 () Bool)

(declare-fun mapRes!21673 () Bool)

(declare-fun tp!41671 () Bool)

(declare-fun e!277514 () Bool)

(assert (=> mapNonEmpty!21673 (= mapRes!21673 (and tp!41671 e!277514))))

(declare-fun mapKey!21673 () (_ BitVec 32))

(declare-fun mapValue!21673 () ValueCell!6310)

(declare-fun mapRest!21673 () (Array (_ BitVec 32) ValueCell!6310))

(assert (=> mapNonEmpty!21673 (= (arr!14607 _values!833) (store mapRest!21673 mapKey!21673 mapValue!21673))))

(declare-fun b!473121 () Bool)

(declare-fun e!277517 () Bool)

(assert (=> b!473121 (= e!277516 (and e!277517 mapRes!21673))))

(declare-fun condMapEmpty!21673 () Bool)

(declare-fun mapDefault!21673 () ValueCell!6310)

