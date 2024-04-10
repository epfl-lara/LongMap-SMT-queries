; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41624 () Bool)

(assert start!41624)

(declare-fun b_free!11277 () Bool)

(declare-fun b_next!11277 () Bool)

(assert (=> start!41624 (= b_free!11277 (not b_next!11277))))

(declare-fun tp!39832 () Bool)

(declare-fun b_and!19625 () Bool)

(assert (=> start!41624 (= tp!39832 b_and!19625)))

(declare-fun mapNonEmpty!20737 () Bool)

(declare-fun mapRes!20737 () Bool)

(declare-fun tp!39831 () Bool)

(declare-fun e!271580 () Bool)

(assert (=> mapNonEmpty!20737 (= mapRes!20737 (and tp!39831 e!271580))))

(declare-datatypes ((V!18045 0))(
  ( (V!18046 (val!6397 Int)) )
))
(declare-datatypes ((ValueCell!6009 0))(
  ( (ValueCellFull!6009 (v!8684 V!18045)) (EmptyCell!6009) )
))
(declare-datatypes ((array!29195 0))(
  ( (array!29196 (arr!14028 (Array (_ BitVec 32) ValueCell!6009)) (size!14380 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29195)

(declare-fun mapRest!20737 () (Array (_ BitVec 32) ValueCell!6009))

(declare-fun mapValue!20737 () ValueCell!6009)

(declare-fun mapKey!20737 () (_ BitVec 32))

(assert (=> mapNonEmpty!20737 (= (arr!14028 _values!833) (store mapRest!20737 mapKey!20737 mapValue!20737))))

(declare-fun mapIsEmpty!20737 () Bool)

(assert (=> mapIsEmpty!20737 mapRes!20737))

(declare-fun b!464840 () Bool)

(declare-fun e!271581 () Bool)

(declare-fun e!271578 () Bool)

(assert (=> b!464840 (= e!271581 (and e!271578 mapRes!20737))))

(declare-fun condMapEmpty!20737 () Bool)

(declare-fun mapDefault!20737 () ValueCell!6009)

(assert (=> b!464840 (= condMapEmpty!20737 (= (arr!14028 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6009)) mapDefault!20737)))))

(declare-fun b!464841 () Bool)

(declare-fun e!271579 () Bool)

(assert (=> b!464841 (= e!271579 (not true))))

(declare-datatypes ((tuple2!8380 0))(
  ( (tuple2!8381 (_1!4201 (_ BitVec 64)) (_2!4201 V!18045)) )
))
(declare-datatypes ((List!8472 0))(
  ( (Nil!8469) (Cons!8468 (h!9324 tuple2!8380) (t!14420 List!8472)) )
))
(declare-datatypes ((ListLongMap!7293 0))(
  ( (ListLongMap!7294 (toList!3662 List!8472)) )
))
(declare-fun lt!209890 () ListLongMap!7293)

(declare-fun lt!209891 () ListLongMap!7293)

(assert (=> b!464841 (= lt!209890 lt!209891)))

(declare-fun minValueBefore!38 () V!18045)

(declare-fun zeroValue!794 () V!18045)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((Unit!13492 0))(
  ( (Unit!13493) )
))
(declare-fun lt!209892 () Unit!13492)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29197 0))(
  ( (array!29198 (arr!14029 (Array (_ BitVec 32) (_ BitVec 64))) (size!14381 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29197)

(declare-fun minValueAfter!38 () V!18045)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!22 (array!29197 array!29195 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18045 V!18045 V!18045 V!18045 (_ BitVec 32) Int) Unit!13492)

(assert (=> b!464841 (= lt!209892 (lemmaNoChangeToArrayThenSameMapNoExtras!22 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1842 (array!29197 array!29195 (_ BitVec 32) (_ BitVec 32) V!18045 V!18045 (_ BitVec 32) Int) ListLongMap!7293)

(assert (=> b!464841 (= lt!209891 (getCurrentListMapNoExtraKeys!1842 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464841 (= lt!209890 (getCurrentListMapNoExtraKeys!1842 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464842 () Bool)

(declare-fun res!277885 () Bool)

(assert (=> b!464842 (=> (not res!277885) (not e!271579))))

(assert (=> b!464842 (= res!277885 (and (= (size!14380 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14381 _keys!1025) (size!14380 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!277887 () Bool)

(assert (=> start!41624 (=> (not res!277887) (not e!271579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41624 (= res!277887 (validMask!0 mask!1365))))

(assert (=> start!41624 e!271579))

(declare-fun tp_is_empty!12705 () Bool)

(assert (=> start!41624 tp_is_empty!12705))

(assert (=> start!41624 tp!39832))

(assert (=> start!41624 true))

(declare-fun array_inv!10130 (array!29197) Bool)

(assert (=> start!41624 (array_inv!10130 _keys!1025)))

(declare-fun array_inv!10131 (array!29195) Bool)

(assert (=> start!41624 (and (array_inv!10131 _values!833) e!271581)))

(declare-fun b!464843 () Bool)

(assert (=> b!464843 (= e!271578 tp_is_empty!12705)))

(declare-fun b!464844 () Bool)

(assert (=> b!464844 (= e!271580 tp_is_empty!12705)))

(declare-fun b!464845 () Bool)

(declare-fun res!277884 () Bool)

(assert (=> b!464845 (=> (not res!277884) (not e!271579))))

(declare-datatypes ((List!8473 0))(
  ( (Nil!8470) (Cons!8469 (h!9325 (_ BitVec 64)) (t!14421 List!8473)) )
))
(declare-fun arrayNoDuplicates!0 (array!29197 (_ BitVec 32) List!8473) Bool)

(assert (=> b!464845 (= res!277884 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8470))))

(declare-fun b!464846 () Bool)

(declare-fun res!277886 () Bool)

(assert (=> b!464846 (=> (not res!277886) (not e!271579))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29197 (_ BitVec 32)) Bool)

(assert (=> b!464846 (= res!277886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!41624 res!277887) b!464842))

(assert (= (and b!464842 res!277885) b!464846))

(assert (= (and b!464846 res!277886) b!464845))

(assert (= (and b!464845 res!277884) b!464841))

(assert (= (and b!464840 condMapEmpty!20737) mapIsEmpty!20737))

(assert (= (and b!464840 (not condMapEmpty!20737)) mapNonEmpty!20737))

(get-info :version)

(assert (= (and mapNonEmpty!20737 ((_ is ValueCellFull!6009) mapValue!20737)) b!464844))

(assert (= (and b!464840 ((_ is ValueCellFull!6009) mapDefault!20737)) b!464843))

(assert (= start!41624 b!464840))

(declare-fun m!447161 () Bool)

(assert (=> mapNonEmpty!20737 m!447161))

(declare-fun m!447163 () Bool)

(assert (=> b!464845 m!447163))

(declare-fun m!447165 () Bool)

(assert (=> b!464841 m!447165))

(declare-fun m!447167 () Bool)

(assert (=> b!464841 m!447167))

(declare-fun m!447169 () Bool)

(assert (=> b!464841 m!447169))

(declare-fun m!447171 () Bool)

(assert (=> start!41624 m!447171))

(declare-fun m!447173 () Bool)

(assert (=> start!41624 m!447173))

(declare-fun m!447175 () Bool)

(assert (=> start!41624 m!447175))

(declare-fun m!447177 () Bool)

(assert (=> b!464846 m!447177))

(check-sat tp_is_empty!12705 (not b!464845) (not b_next!11277) (not start!41624) (not b!464846) (not mapNonEmpty!20737) (not b!464841) b_and!19625)
(check-sat b_and!19625 (not b_next!11277))
