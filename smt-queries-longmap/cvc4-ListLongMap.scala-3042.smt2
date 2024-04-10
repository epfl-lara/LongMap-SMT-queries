; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42680 () Bool)

(assert start!42680)

(declare-fun b_free!12065 () Bool)

(declare-fun b_next!12065 () Bool)

(assert (=> start!42680 (= b_free!12065 (not b_next!12065))))

(declare-fun tp!42244 () Bool)

(declare-fun b_and!20577 () Bool)

(assert (=> start!42680 (= tp!42244 b_and!20577)))

(declare-fun mapNonEmpty!21967 () Bool)

(declare-fun mapRes!21967 () Bool)

(declare-fun tp!42243 () Bool)

(declare-fun e!279583 () Bool)

(assert (=> mapNonEmpty!21967 (= mapRes!21967 (and tp!42243 e!279583))))

(declare-datatypes ((V!19095 0))(
  ( (V!19096 (val!6791 Int)) )
))
(declare-datatypes ((ValueCell!6403 0))(
  ( (ValueCellFull!6403 (v!9086 V!19095)) (EmptyCell!6403) )
))
(declare-datatypes ((array!30727 0))(
  ( (array!30728 (arr!14778 (Array (_ BitVec 32) ValueCell!6403)) (size!15130 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30727)

(declare-fun mapRest!21967 () (Array (_ BitVec 32) ValueCell!6403))

(declare-fun mapValue!21967 () ValueCell!6403)

(declare-fun mapKey!21967 () (_ BitVec 32))

(assert (=> mapNonEmpty!21967 (= (arr!14778 _values!833) (store mapRest!21967 mapKey!21967 mapValue!21967))))

(declare-fun b!476047 () Bool)

(declare-fun res!284228 () Bool)

(declare-fun e!279587 () Bool)

(assert (=> b!476047 (=> (not res!284228) (not e!279587))))

(declare-datatypes ((array!30729 0))(
  ( (array!30730 (arr!14779 (Array (_ BitVec 32) (_ BitVec 64))) (size!15131 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30729)

(declare-datatypes ((List!9033 0))(
  ( (Nil!9030) (Cons!9029 (h!9885 (_ BitVec 64)) (t!15013 List!9033)) )
))
(declare-fun arrayNoDuplicates!0 (array!30729 (_ BitVec 32) List!9033) Bool)

(assert (=> b!476047 (= res!284228 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9030))))

(declare-fun b!476048 () Bool)

(declare-fun tp_is_empty!13493 () Bool)

(assert (=> b!476048 (= e!279583 tp_is_empty!13493)))

(declare-fun b!476049 () Bool)

(declare-fun e!279582 () Bool)

(assert (=> b!476049 (= e!279587 (not e!279582))))

(declare-fun res!284225 () Bool)

(assert (=> b!476049 (=> res!284225 e!279582)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!476049 (= res!284225 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!8956 0))(
  ( (tuple2!8957 (_1!4489 (_ BitVec 64)) (_2!4489 V!19095)) )
))
(declare-datatypes ((List!9034 0))(
  ( (Nil!9031) (Cons!9030 (h!9886 tuple2!8956) (t!15014 List!9034)) )
))
(declare-datatypes ((ListLongMap!7869 0))(
  ( (ListLongMap!7870 (toList!3950 List!9034)) )
))
(declare-fun lt!216927 () ListLongMap!7869)

(declare-fun lt!216926 () ListLongMap!7869)

(assert (=> b!476049 (= lt!216927 lt!216926)))

(declare-fun minValueBefore!38 () V!19095)

(declare-fun zeroValue!794 () V!19095)

(declare-datatypes ((Unit!14024 0))(
  ( (Unit!14025) )
))
(declare-fun lt!216928 () Unit!14024)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!19095)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!266 (array!30729 array!30727 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!19095 V!19095 V!19095 V!19095 (_ BitVec 32) Int) Unit!14024)

(assert (=> b!476049 (= lt!216928 (lemmaNoChangeToArrayThenSameMapNoExtras!266 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2106 (array!30729 array!30727 (_ BitVec 32) (_ BitVec 32) V!19095 V!19095 (_ BitVec 32) Int) ListLongMap!7869)

(assert (=> b!476049 (= lt!216926 (getCurrentListMapNoExtraKeys!2106 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!476049 (= lt!216927 (getCurrentListMapNoExtraKeys!2106 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!284227 () Bool)

(assert (=> start!42680 (=> (not res!284227) (not e!279587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42680 (= res!284227 (validMask!0 mask!1365))))

(assert (=> start!42680 e!279587))

(assert (=> start!42680 tp_is_empty!13493))

(assert (=> start!42680 tp!42244))

(assert (=> start!42680 true))

(declare-fun array_inv!10664 (array!30729) Bool)

(assert (=> start!42680 (array_inv!10664 _keys!1025)))

(declare-fun e!279585 () Bool)

(declare-fun array_inv!10665 (array!30727) Bool)

(assert (=> start!42680 (and (array_inv!10665 _values!833) e!279585)))

(declare-fun b!476050 () Bool)

(declare-fun res!284226 () Bool)

(assert (=> b!476050 (=> (not res!284226) (not e!279587))))

(assert (=> b!476050 (= res!284226 (and (= (size!15130 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15131 _keys!1025) (size!15130 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!476051 () Bool)

(declare-fun e!279586 () Bool)

(assert (=> b!476051 (= e!279585 (and e!279586 mapRes!21967))))

(declare-fun condMapEmpty!21967 () Bool)

(declare-fun mapDefault!21967 () ValueCell!6403)

