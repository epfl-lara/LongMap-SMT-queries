; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42594 () Bool)

(assert start!42594)

(declare-fun b_free!12029 () Bool)

(declare-fun b_next!12029 () Bool)

(assert (=> start!42594 (= b_free!12029 (not b_next!12029))))

(declare-fun tp!42127 () Bool)

(declare-fun b_and!20509 () Bool)

(assert (=> start!42594 (= tp!42127 b_and!20509)))

(declare-fun b!475193 () Bool)

(declare-fun e!279000 () Bool)

(declare-fun tp_is_empty!13457 () Bool)

(assert (=> b!475193 (= e!279000 tp_is_empty!13457)))

(declare-fun b!475194 () Bool)

(declare-fun res!283794 () Bool)

(declare-fun e!279002 () Bool)

(assert (=> b!475194 (=> (not res!283794) (not e!279002))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30651 0))(
  ( (array!30652 (arr!14743 (Array (_ BitVec 32) (_ BitVec 64))) (size!15095 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30651)

(declare-datatypes ((V!19047 0))(
  ( (V!19048 (val!6773 Int)) )
))
(declare-datatypes ((ValueCell!6385 0))(
  ( (ValueCellFull!6385 (v!9066 V!19047)) (EmptyCell!6385) )
))
(declare-datatypes ((array!30653 0))(
  ( (array!30654 (arr!14744 (Array (_ BitVec 32) ValueCell!6385)) (size!15096 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30653)

(declare-fun mask!1365 () (_ BitVec 32))

(assert (=> b!475194 (= res!283794 (and (= (size!15096 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15095 _keys!1025) (size!15096 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!475195 () Bool)

(declare-fun res!283792 () Bool)

(assert (=> b!475195 (=> (not res!283792) (not e!279002))))

(declare-datatypes ((List!9009 0))(
  ( (Nil!9006) (Cons!9005 (h!9861 (_ BitVec 64)) (t!14983 List!9009)) )
))
(declare-fun arrayNoDuplicates!0 (array!30651 (_ BitVec 32) List!9009) Bool)

(assert (=> b!475195 (= res!283792 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9006))))

(declare-fun b!475196 () Bool)

(declare-fun res!283793 () Bool)

(assert (=> b!475196 (=> (not res!283793) (not e!279002))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30651 (_ BitVec 32)) Bool)

(assert (=> b!475196 (= res!283793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!283791 () Bool)

(assert (=> start!42594 (=> (not res!283791) (not e!279002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42594 (= res!283791 (validMask!0 mask!1365))))

(assert (=> start!42594 e!279002))

(assert (=> start!42594 tp_is_empty!13457))

(assert (=> start!42594 tp!42127))

(assert (=> start!42594 true))

(declare-fun array_inv!10638 (array!30651) Bool)

(assert (=> start!42594 (array_inv!10638 _keys!1025)))

(declare-fun e!278999 () Bool)

(declare-fun array_inv!10639 (array!30653) Bool)

(assert (=> start!42594 (and (array_inv!10639 _values!833) e!278999)))

(declare-fun b!475197 () Bool)

(assert (=> b!475197 (= e!279002 false)))

(declare-fun zeroValue!794 () V!19047)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8930 0))(
  ( (tuple2!8931 (_1!4476 (_ BitVec 64)) (_2!4476 V!19047)) )
))
(declare-datatypes ((List!9010 0))(
  ( (Nil!9007) (Cons!9006 (h!9862 tuple2!8930) (t!14984 List!9010)) )
))
(declare-datatypes ((ListLongMap!7843 0))(
  ( (ListLongMap!7844 (toList!3937 List!9010)) )
))
(declare-fun lt!216406 () ListLongMap!7843)

(declare-fun minValueAfter!38 () V!19047)

(declare-fun getCurrentListMapNoExtraKeys!2094 (array!30651 array!30653 (_ BitVec 32) (_ BitVec 32) V!19047 V!19047 (_ BitVec 32) Int) ListLongMap!7843)

(assert (=> b!475197 (= lt!216406 (getCurrentListMapNoExtraKeys!2094 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!19047)

(declare-fun lt!216407 () ListLongMap!7843)

(assert (=> b!475197 (= lt!216407 (getCurrentListMapNoExtraKeys!2094 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21904 () Bool)

(declare-fun mapRes!21904 () Bool)

(declare-fun tp!42126 () Bool)

(declare-fun e!279003 () Bool)

(assert (=> mapNonEmpty!21904 (= mapRes!21904 (and tp!42126 e!279003))))

(declare-fun mapKey!21904 () (_ BitVec 32))

(declare-fun mapValue!21904 () ValueCell!6385)

(declare-fun mapRest!21904 () (Array (_ BitVec 32) ValueCell!6385))

(assert (=> mapNonEmpty!21904 (= (arr!14744 _values!833) (store mapRest!21904 mapKey!21904 mapValue!21904))))

(declare-fun mapIsEmpty!21904 () Bool)

(assert (=> mapIsEmpty!21904 mapRes!21904))

(declare-fun b!475198 () Bool)

(assert (=> b!475198 (= e!279003 tp_is_empty!13457)))

(declare-fun b!475199 () Bool)

(assert (=> b!475199 (= e!278999 (and e!279000 mapRes!21904))))

(declare-fun condMapEmpty!21904 () Bool)

(declare-fun mapDefault!21904 () ValueCell!6385)

