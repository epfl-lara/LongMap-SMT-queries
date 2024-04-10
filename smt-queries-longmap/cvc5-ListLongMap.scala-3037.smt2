; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42596 () Bool)

(assert start!42596)

(declare-fun b_free!12031 () Bool)

(declare-fun b_next!12031 () Bool)

(assert (=> start!42596 (= b_free!12031 (not b_next!12031))))

(declare-fun tp!42133 () Bool)

(declare-fun b_and!20511 () Bool)

(assert (=> start!42596 (= tp!42133 b_and!20511)))

(declare-fun res!283804 () Bool)

(declare-fun e!279015 () Bool)

(assert (=> start!42596 (=> (not res!283804) (not e!279015))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42596 (= res!283804 (validMask!0 mask!1365))))

(assert (=> start!42596 e!279015))

(declare-fun tp_is_empty!13459 () Bool)

(assert (=> start!42596 tp_is_empty!13459))

(assert (=> start!42596 tp!42133))

(assert (=> start!42596 true))

(declare-datatypes ((array!30655 0))(
  ( (array!30656 (arr!14745 (Array (_ BitVec 32) (_ BitVec 64))) (size!15097 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30655)

(declare-fun array_inv!10640 (array!30655) Bool)

(assert (=> start!42596 (array_inv!10640 _keys!1025)))

(declare-datatypes ((V!19051 0))(
  ( (V!19052 (val!6774 Int)) )
))
(declare-datatypes ((ValueCell!6386 0))(
  ( (ValueCellFull!6386 (v!9067 V!19051)) (EmptyCell!6386) )
))
(declare-datatypes ((array!30657 0))(
  ( (array!30658 (arr!14746 (Array (_ BitVec 32) ValueCell!6386)) (size!15098 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30657)

(declare-fun e!279016 () Bool)

(declare-fun array_inv!10641 (array!30657) Bool)

(assert (=> start!42596 (and (array_inv!10641 _values!833) e!279016)))

(declare-fun b!475214 () Bool)

(declare-fun e!279014 () Bool)

(assert (=> b!475214 (= e!279014 tp_is_empty!13459)))

(declare-fun b!475215 () Bool)

(declare-fun res!283805 () Bool)

(assert (=> b!475215 (=> (not res!283805) (not e!279015))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!475215 (= res!283805 (and (= (size!15098 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15097 _keys!1025) (size!15098 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!475216 () Bool)

(declare-fun e!279017 () Bool)

(declare-fun mapRes!21907 () Bool)

(assert (=> b!475216 (= e!279016 (and e!279017 mapRes!21907))))

(declare-fun condMapEmpty!21907 () Bool)

(declare-fun mapDefault!21907 () ValueCell!6386)

