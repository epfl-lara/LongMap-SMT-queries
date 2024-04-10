; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41546 () Bool)

(assert start!41546)

(declare-fun b_free!11213 () Bool)

(declare-fun b_next!11213 () Bool)

(assert (=> start!41546 (= b_free!11213 (not b_next!11213))))

(declare-fun tp!39637 () Bool)

(declare-fun b_and!19553 () Bool)

(assert (=> start!41546 (= tp!39637 b_and!19553)))

(declare-fun res!277469 () Bool)

(declare-fun e!271043 () Bool)

(assert (=> start!41546 (=> (not res!277469) (not e!271043))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41546 (= res!277469 (validMask!0 mask!1365))))

(assert (=> start!41546 e!271043))

(declare-fun tp_is_empty!12641 () Bool)

(assert (=> start!41546 tp_is_empty!12641))

(assert (=> start!41546 tp!39637))

(assert (=> start!41546 true))

(declare-datatypes ((array!29071 0))(
  ( (array!29072 (arr!13967 (Array (_ BitVec 32) (_ BitVec 64))) (size!14319 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29071)

(declare-fun array_inv!10092 (array!29071) Bool)

(assert (=> start!41546 (array_inv!10092 _keys!1025)))

(declare-datatypes ((V!17959 0))(
  ( (V!17960 (val!6365 Int)) )
))
(declare-datatypes ((ValueCell!5977 0))(
  ( (ValueCellFull!5977 (v!8652 V!17959)) (EmptyCell!5977) )
))
(declare-datatypes ((array!29073 0))(
  ( (array!29074 (arr!13968 (Array (_ BitVec 32) ValueCell!5977)) (size!14320 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29073)

(declare-fun e!271044 () Bool)

(declare-fun array_inv!10093 (array!29073) Bool)

(assert (=> start!41546 (and (array_inv!10093 _values!833) e!271044)))

(declare-fun b!464083 () Bool)

(declare-fun res!277470 () Bool)

(assert (=> b!464083 (=> (not res!277470) (not e!271043))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!464083 (= res!277470 (and (= (size!14320 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14319 _keys!1025) (size!14320 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464084 () Bool)

(declare-fun res!277471 () Bool)

(assert (=> b!464084 (=> (not res!277471) (not e!271043))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29071 (_ BitVec 32)) Bool)

(assert (=> b!464084 (= res!277471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!20638 () Bool)

(declare-fun mapRes!20638 () Bool)

(assert (=> mapIsEmpty!20638 mapRes!20638))

(declare-fun b!464085 () Bool)

(declare-fun e!271046 () Bool)

(assert (=> b!464085 (= e!271046 tp_is_empty!12641)))

(declare-fun b!464086 () Bool)

(declare-fun e!271045 () Bool)

(assert (=> b!464086 (= e!271044 (and e!271045 mapRes!20638))))

(declare-fun condMapEmpty!20638 () Bool)

(declare-fun mapDefault!20638 () ValueCell!5977)

