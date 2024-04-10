; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42588 () Bool)

(assert start!42588)

(declare-fun b_free!12023 () Bool)

(declare-fun b_next!12023 () Bool)

(assert (=> start!42588 (= b_free!12023 (not b_next!12023))))

(declare-fun tp!42108 () Bool)

(declare-fun b_and!20503 () Bool)

(assert (=> start!42588 (= tp!42108 b_and!20503)))

(declare-fun b!475130 () Bool)

(declare-fun e!278958 () Bool)

(declare-fun tp_is_empty!13451 () Bool)

(assert (=> b!475130 (= e!278958 tp_is_empty!13451)))

(declare-fun b!475131 () Bool)

(declare-fun e!278955 () Bool)

(assert (=> b!475131 (= e!278955 tp_is_empty!13451)))

(declare-fun b!475132 () Bool)

(declare-fun res!283758 () Bool)

(declare-fun e!278956 () Bool)

(assert (=> b!475132 (=> (not res!283758) (not e!278956))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30641 0))(
  ( (array!30642 (arr!14738 (Array (_ BitVec 32) (_ BitVec 64))) (size!15090 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30641)

(declare-datatypes ((V!19039 0))(
  ( (V!19040 (val!6770 Int)) )
))
(declare-datatypes ((ValueCell!6382 0))(
  ( (ValueCellFull!6382 (v!9063 V!19039)) (EmptyCell!6382) )
))
(declare-datatypes ((array!30643 0))(
  ( (array!30644 (arr!14739 (Array (_ BitVec 32) ValueCell!6382)) (size!15091 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30643)

(assert (=> b!475132 (= res!283758 (and (= (size!15091 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15090 _keys!1025) (size!15091 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!283755 () Bool)

(assert (=> start!42588 (=> (not res!283755) (not e!278956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42588 (= res!283755 (validMask!0 mask!1365))))

(assert (=> start!42588 e!278956))

(assert (=> start!42588 tp_is_empty!13451))

(assert (=> start!42588 tp!42108))

(assert (=> start!42588 true))

(declare-fun array_inv!10634 (array!30641) Bool)

(assert (=> start!42588 (array_inv!10634 _keys!1025)))

(declare-fun e!278954 () Bool)

(declare-fun array_inv!10635 (array!30643) Bool)

(assert (=> start!42588 (and (array_inv!10635 _values!833) e!278954)))

(declare-fun mapNonEmpty!21895 () Bool)

(declare-fun mapRes!21895 () Bool)

(declare-fun tp!42109 () Bool)

(assert (=> mapNonEmpty!21895 (= mapRes!21895 (and tp!42109 e!278955))))

(declare-fun mapKey!21895 () (_ BitVec 32))

(declare-fun mapRest!21895 () (Array (_ BitVec 32) ValueCell!6382))

(declare-fun mapValue!21895 () ValueCell!6382)

(assert (=> mapNonEmpty!21895 (= (arr!14739 _values!833) (store mapRest!21895 mapKey!21895 mapValue!21895))))

(declare-fun b!475133 () Bool)

(declare-fun res!283756 () Bool)

(assert (=> b!475133 (=> (not res!283756) (not e!278956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30641 (_ BitVec 32)) Bool)

(assert (=> b!475133 (= res!283756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21895 () Bool)

(assert (=> mapIsEmpty!21895 mapRes!21895))

(declare-fun b!475134 () Bool)

(declare-fun res!283757 () Bool)

(assert (=> b!475134 (=> (not res!283757) (not e!278956))))

(declare-datatypes ((List!9006 0))(
  ( (Nil!9003) (Cons!9002 (h!9858 (_ BitVec 64)) (t!14980 List!9006)) )
))
(declare-fun arrayNoDuplicates!0 (array!30641 (_ BitVec 32) List!9006) Bool)

(assert (=> b!475134 (= res!283757 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9003))))

(declare-fun b!475135 () Bool)

(assert (=> b!475135 (= e!278954 (and e!278958 mapRes!21895))))

(declare-fun condMapEmpty!21895 () Bool)

(declare-fun mapDefault!21895 () ValueCell!6382)

