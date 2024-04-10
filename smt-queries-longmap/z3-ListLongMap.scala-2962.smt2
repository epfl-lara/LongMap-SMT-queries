; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42010 () Bool)

(assert start!42010)

(declare-fun b_free!11583 () Bool)

(declare-fun b_next!11583 () Bool)

(assert (=> start!42010 (= b_free!11583 (not b_next!11583))))

(declare-fun tp!40765 () Bool)

(declare-fun b_and!19981 () Bool)

(assert (=> start!42010 (= tp!40765 b_and!19981)))

(declare-fun b!469050 () Bool)

(declare-fun e!274612 () Bool)

(declare-fun tp_is_empty!13011 () Bool)

(assert (=> b!469050 (= e!274612 tp_is_empty!13011)))

(declare-fun b!469051 () Bool)

(declare-fun res!280318 () Bool)

(declare-fun e!274611 () Bool)

(assert (=> b!469051 (=> (not res!280318) (not e!274611))))

(declare-datatypes ((array!29795 0))(
  ( (array!29796 (arr!14323 (Array (_ BitVec 32) (_ BitVec 64))) (size!14675 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29795)

(declare-datatypes ((List!8698 0))(
  ( (Nil!8695) (Cons!8694 (h!9550 (_ BitVec 64)) (t!14656 List!8698)) )
))
(declare-fun arrayNoDuplicates!0 (array!29795 (_ BitVec 32) List!8698) Bool)

(assert (=> b!469051 (= res!280318 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8695))))

(declare-fun mapNonEmpty!21211 () Bool)

(declare-fun mapRes!21211 () Bool)

(declare-fun tp!40764 () Bool)

(assert (=> mapNonEmpty!21211 (= mapRes!21211 (and tp!40764 e!274612))))

(declare-datatypes ((V!18453 0))(
  ( (V!18454 (val!6550 Int)) )
))
(declare-datatypes ((ValueCell!6162 0))(
  ( (ValueCellFull!6162 (v!8839 V!18453)) (EmptyCell!6162) )
))
(declare-datatypes ((array!29797 0))(
  ( (array!29798 (arr!14324 (Array (_ BitVec 32) ValueCell!6162)) (size!14676 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29797)

(declare-fun mapKey!21211 () (_ BitVec 32))

(declare-fun mapValue!21211 () ValueCell!6162)

(declare-fun mapRest!21211 () (Array (_ BitVec 32) ValueCell!6162))

(assert (=> mapNonEmpty!21211 (= (arr!14324 _values!833) (store mapRest!21211 mapKey!21211 mapValue!21211))))

(declare-fun mapIsEmpty!21211 () Bool)

(assert (=> mapIsEmpty!21211 mapRes!21211))

(declare-fun b!469053 () Bool)

(declare-fun e!274610 () Bool)

(assert (=> b!469053 (= e!274611 (not e!274610))))

(declare-fun res!280319 () Bool)

(assert (=> b!469053 (=> res!280319 e!274610)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!469053 (= res!280319 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8616 0))(
  ( (tuple2!8617 (_1!4319 (_ BitVec 64)) (_2!4319 V!18453)) )
))
(declare-datatypes ((List!8699 0))(
  ( (Nil!8696) (Cons!8695 (h!9551 tuple2!8616) (t!14657 List!8699)) )
))
(declare-datatypes ((ListLongMap!7529 0))(
  ( (ListLongMap!7530 (toList!3780 List!8699)) )
))
(declare-fun lt!212375 () ListLongMap!7529)

(declare-fun lt!212378 () ListLongMap!7529)

(assert (=> b!469053 (= lt!212375 lt!212378)))

(declare-fun minValueBefore!38 () V!18453)

(declare-fun zeroValue!794 () V!18453)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13715 0))(
  ( (Unit!13716) )
))
(declare-fun lt!212374 () Unit!13715)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18453)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!129 (array!29795 array!29797 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18453 V!18453 V!18453 V!18453 (_ BitVec 32) Int) Unit!13715)

(assert (=> b!469053 (= lt!212374 (lemmaNoChangeToArrayThenSameMapNoExtras!129 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1949 (array!29795 array!29797 (_ BitVec 32) (_ BitVec 32) V!18453 V!18453 (_ BitVec 32) Int) ListLongMap!7529)

(assert (=> b!469053 (= lt!212378 (getCurrentListMapNoExtraKeys!1949 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469053 (= lt!212375 (getCurrentListMapNoExtraKeys!1949 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469054 () Bool)

(declare-fun res!280316 () Bool)

(assert (=> b!469054 (=> (not res!280316) (not e!274611))))

(assert (=> b!469054 (= res!280316 (and (= (size!14676 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14675 _keys!1025) (size!14676 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!469055 () Bool)

(declare-fun e!274609 () Bool)

(declare-fun e!274608 () Bool)

(assert (=> b!469055 (= e!274609 (and e!274608 mapRes!21211))))

(declare-fun condMapEmpty!21211 () Bool)

(declare-fun mapDefault!21211 () ValueCell!6162)

(assert (=> b!469055 (= condMapEmpty!21211 (= (arr!14324 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6162)) mapDefault!21211)))))

(declare-fun b!469056 () Bool)

(assert (=> b!469056 (= e!274610 true)))

(declare-fun lt!212376 () tuple2!8616)

(declare-fun +!1690 (ListLongMap!7529 tuple2!8616) ListLongMap!7529)

(assert (=> b!469056 (= (+!1690 lt!212375 lt!212376) (+!1690 (+!1690 lt!212375 (tuple2!8617 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212376))))

(assert (=> b!469056 (= lt!212376 (tuple2!8617 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!212377 () Unit!13715)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!103 (ListLongMap!7529 (_ BitVec 64) V!18453 V!18453) Unit!13715)

(assert (=> b!469056 (= lt!212377 (addSameAsAddTwiceSameKeyDiffValues!103 lt!212375 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!212380 () ListLongMap!7529)

(declare-fun getCurrentListMap!2204 (array!29795 array!29797 (_ BitVec 32) (_ BitVec 32) V!18453 V!18453 (_ BitVec 32) Int) ListLongMap!7529)

(assert (=> b!469056 (= lt!212380 (getCurrentListMap!2204 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212379 () ListLongMap!7529)

(assert (=> b!469056 (= lt!212379 (getCurrentListMap!2204 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469057 () Bool)

(assert (=> b!469057 (= e!274608 tp_is_empty!13011)))

(declare-fun b!469052 () Bool)

(declare-fun res!280317 () Bool)

(assert (=> b!469052 (=> (not res!280317) (not e!274611))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29795 (_ BitVec 32)) Bool)

(assert (=> b!469052 (= res!280317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!280315 () Bool)

(assert (=> start!42010 (=> (not res!280315) (not e!274611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42010 (= res!280315 (validMask!0 mask!1365))))

(assert (=> start!42010 e!274611))

(assert (=> start!42010 tp_is_empty!13011))

(assert (=> start!42010 tp!40765))

(assert (=> start!42010 true))

(declare-fun array_inv!10336 (array!29795) Bool)

(assert (=> start!42010 (array_inv!10336 _keys!1025)))

(declare-fun array_inv!10337 (array!29797) Bool)

(assert (=> start!42010 (and (array_inv!10337 _values!833) e!274609)))

(assert (= (and start!42010 res!280315) b!469054))

(assert (= (and b!469054 res!280316) b!469052))

(assert (= (and b!469052 res!280317) b!469051))

(assert (= (and b!469051 res!280318) b!469053))

(assert (= (and b!469053 (not res!280319)) b!469056))

(assert (= (and b!469055 condMapEmpty!21211) mapIsEmpty!21211))

(assert (= (and b!469055 (not condMapEmpty!21211)) mapNonEmpty!21211))

(get-info :version)

(assert (= (and mapNonEmpty!21211 ((_ is ValueCellFull!6162) mapValue!21211)) b!469050))

(assert (= (and b!469055 ((_ is ValueCellFull!6162) mapDefault!21211)) b!469057))

(assert (= start!42010 b!469055))

(declare-fun m!451141 () Bool)

(assert (=> b!469051 m!451141))

(declare-fun m!451143 () Bool)

(assert (=> start!42010 m!451143))

(declare-fun m!451145 () Bool)

(assert (=> start!42010 m!451145))

(declare-fun m!451147 () Bool)

(assert (=> start!42010 m!451147))

(declare-fun m!451149 () Bool)

(assert (=> b!469053 m!451149))

(declare-fun m!451151 () Bool)

(assert (=> b!469053 m!451151))

(declare-fun m!451153 () Bool)

(assert (=> b!469053 m!451153))

(declare-fun m!451155 () Bool)

(assert (=> b!469052 m!451155))

(declare-fun m!451157 () Bool)

(assert (=> mapNonEmpty!21211 m!451157))

(declare-fun m!451159 () Bool)

(assert (=> b!469056 m!451159))

(declare-fun m!451161 () Bool)

(assert (=> b!469056 m!451161))

(assert (=> b!469056 m!451159))

(declare-fun m!451163 () Bool)

(assert (=> b!469056 m!451163))

(declare-fun m!451165 () Bool)

(assert (=> b!469056 m!451165))

(declare-fun m!451167 () Bool)

(assert (=> b!469056 m!451167))

(declare-fun m!451169 () Bool)

(assert (=> b!469056 m!451169))

(check-sat (not mapNonEmpty!21211) (not start!42010) b_and!19981 (not b!469051) tp_is_empty!13011 (not b!469053) (not b!469056) (not b_next!11583) (not b!469052))
(check-sat b_and!19981 (not b_next!11583))
