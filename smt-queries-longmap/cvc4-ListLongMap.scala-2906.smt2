; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41582 () Bool)

(assert start!41582)

(declare-fun b_free!11249 () Bool)

(declare-fun b_next!11249 () Bool)

(assert (=> start!41582 (= b_free!11249 (not b_next!11249))))

(declare-fun tp!39744 () Bool)

(declare-fun b_and!19589 () Bool)

(assert (=> start!41582 (= tp!39744 b_and!19589)))

(declare-fun b!464461 () Bool)

(declare-fun e!271314 () Bool)

(declare-fun tp_is_empty!12677 () Bool)

(assert (=> b!464461 (= e!271314 tp_is_empty!12677)))

(declare-fun b!464462 () Bool)

(declare-fun e!271316 () Bool)

(assert (=> b!464462 (= e!271316 tp_is_empty!12677)))

(declare-fun mapIsEmpty!20692 () Bool)

(declare-fun mapRes!20692 () Bool)

(assert (=> mapIsEmpty!20692 mapRes!20692))

(declare-fun b!464463 () Bool)

(declare-fun res!277687 () Bool)

(declare-fun e!271315 () Bool)

(assert (=> b!464463 (=> (not res!277687) (not e!271315))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29141 0))(
  ( (array!29142 (arr!14002 (Array (_ BitVec 32) (_ BitVec 64))) (size!14354 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29141)

(declare-datatypes ((V!18007 0))(
  ( (V!18008 (val!6383 Int)) )
))
(declare-datatypes ((ValueCell!5995 0))(
  ( (ValueCellFull!5995 (v!8670 V!18007)) (EmptyCell!5995) )
))
(declare-datatypes ((array!29143 0))(
  ( (array!29144 (arr!14003 (Array (_ BitVec 32) ValueCell!5995)) (size!14355 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29143)

(assert (=> b!464463 (= res!277687 (and (= (size!14355 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14354 _keys!1025) (size!14355 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464464 () Bool)

(declare-fun res!277688 () Bool)

(assert (=> b!464464 (=> (not res!277688) (not e!271315))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29141 (_ BitVec 32)) Bool)

(assert (=> b!464464 (= res!277688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464465 () Bool)

(declare-fun e!271317 () Bool)

(assert (=> b!464465 (= e!271317 (and e!271314 mapRes!20692))))

(declare-fun condMapEmpty!20692 () Bool)

(declare-fun mapDefault!20692 () ValueCell!5995)

