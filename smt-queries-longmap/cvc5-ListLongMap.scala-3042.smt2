; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42676 () Bool)

(assert start!42676)

(declare-fun b_free!12061 () Bool)

(declare-fun b_next!12061 () Bool)

(assert (=> start!42676 (= b_free!12061 (not b_next!12061))))

(declare-fun tp!42231 () Bool)

(declare-fun b_and!20573 () Bool)

(assert (=> start!42676 (= tp!42231 b_and!20573)))

(declare-fun mapNonEmpty!21961 () Bool)

(declare-fun mapRes!21961 () Bool)

(declare-fun tp!42232 () Bool)

(declare-fun e!279546 () Bool)

(assert (=> mapNonEmpty!21961 (= mapRes!21961 (and tp!42232 e!279546))))

(declare-datatypes ((V!19091 0))(
  ( (V!19092 (val!6789 Int)) )
))
(declare-datatypes ((ValueCell!6401 0))(
  ( (ValueCellFull!6401 (v!9084 V!19091)) (EmptyCell!6401) )
))
(declare-datatypes ((array!30719 0))(
  ( (array!30720 (arr!14774 (Array (_ BitVec 32) ValueCell!6401)) (size!15126 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30719)

(declare-fun mapRest!21961 () (Array (_ BitVec 32) ValueCell!6401))

(declare-fun mapValue!21961 () ValueCell!6401)

(declare-fun mapKey!21961 () (_ BitVec 32))

(assert (=> mapNonEmpty!21961 (= (arr!14774 _values!833) (store mapRest!21961 mapKey!21961 mapValue!21961))))

(declare-fun b!475999 () Bool)

(declare-fun res!284199 () Bool)

(declare-fun e!279550 () Bool)

(assert (=> b!475999 (=> (not res!284199) (not e!279550))))

(declare-datatypes ((array!30721 0))(
  ( (array!30722 (arr!14775 (Array (_ BitVec 32) (_ BitVec 64))) (size!15127 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30721)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30721 (_ BitVec 32)) Bool)

(assert (=> b!475999 (= res!284199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21961 () Bool)

(assert (=> mapIsEmpty!21961 mapRes!21961))

(declare-fun b!476000 () Bool)

(declare-fun e!279547 () Bool)

(declare-fun e!279551 () Bool)

(assert (=> b!476000 (= e!279547 (and e!279551 mapRes!21961))))

(declare-fun condMapEmpty!21961 () Bool)

(declare-fun mapDefault!21961 () ValueCell!6401)

