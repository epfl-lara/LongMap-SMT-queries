; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42062 () Bool)

(assert start!42062)

(declare-fun b_free!11629 () Bool)

(declare-fun b_next!11629 () Bool)

(assert (=> start!42062 (= b_free!11629 (not b_next!11629))))

(declare-fun tp!40905 () Bool)

(declare-fun b_and!20013 () Bool)

(assert (=> start!42062 (= tp!40905 b_and!20013)))

(declare-fun b!469510 () Bool)

(declare-fun e!274960 () Bool)

(assert (=> b!469510 (= e!274960 true)))

(declare-datatypes ((V!18515 0))(
  ( (V!18516 (val!6573 Int)) )
))
(declare-datatypes ((tuple2!8690 0))(
  ( (tuple2!8691 (_1!4356 (_ BitVec 64)) (_2!4356 V!18515)) )
))
(declare-datatypes ((List!8761 0))(
  ( (Nil!8758) (Cons!8757 (h!9613 tuple2!8690) (t!14712 List!8761)) )
))
(declare-datatypes ((ListLongMap!7593 0))(
  ( (ListLongMap!7594 (toList!3812 List!8761)) )
))
(declare-fun lt!212775 () ListLongMap!7593)

(declare-fun lt!212777 () tuple2!8690)

(declare-fun minValueBefore!38 () V!18515)

(declare-fun +!1737 (ListLongMap!7593 tuple2!8690) ListLongMap!7593)

(assert (=> b!469510 (= (+!1737 lt!212775 lt!212777) (+!1737 (+!1737 lt!212775 (tuple2!8691 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212777))))

(declare-fun minValueAfter!38 () V!18515)

(assert (=> b!469510 (= lt!212777 (tuple2!8691 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13723 0))(
  ( (Unit!13724) )
))
(declare-fun lt!212780 () Unit!13723)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!120 (ListLongMap!7593 (_ BitVec 64) V!18515 V!18515) Unit!13723)

(assert (=> b!469510 (= lt!212780 (addSameAsAddTwiceSameKeyDiffValues!120 lt!212775 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18515)

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!212779 () ListLongMap!7593)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29867 0))(
  ( (array!29868 (arr!14358 (Array (_ BitVec 32) (_ BitVec 64))) (size!14711 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29867)

(declare-datatypes ((ValueCell!6185 0))(
  ( (ValueCellFull!6185 (v!8857 V!18515)) (EmptyCell!6185) )
))
(declare-datatypes ((array!29869 0))(
  ( (array!29870 (arr!14359 (Array (_ BitVec 32) ValueCell!6185)) (size!14712 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29869)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2173 (array!29867 array!29869 (_ BitVec 32) (_ BitVec 32) V!18515 V!18515 (_ BitVec 32) Int) ListLongMap!7593)

(assert (=> b!469510 (= lt!212779 (getCurrentListMap!2173 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212778 () ListLongMap!7593)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!469510 (= lt!212778 (getCurrentListMap!2173 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469511 () Bool)

(declare-fun e!274961 () Bool)

(declare-fun e!274963 () Bool)

(declare-fun mapRes!21283 () Bool)

(assert (=> b!469511 (= e!274961 (and e!274963 mapRes!21283))))

(declare-fun condMapEmpty!21283 () Bool)

(declare-fun mapDefault!21283 () ValueCell!6185)

(assert (=> b!469511 (= condMapEmpty!21283 (= (arr!14359 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6185)) mapDefault!21283)))))

(declare-fun mapNonEmpty!21283 () Bool)

(declare-fun tp!40906 () Bool)

(declare-fun e!274964 () Bool)

(assert (=> mapNonEmpty!21283 (= mapRes!21283 (and tp!40906 e!274964))))

(declare-fun mapKey!21283 () (_ BitVec 32))

(declare-fun mapRest!21283 () (Array (_ BitVec 32) ValueCell!6185))

(declare-fun mapValue!21283 () ValueCell!6185)

(assert (=> mapNonEmpty!21283 (= (arr!14359 _values!833) (store mapRest!21283 mapKey!21283 mapValue!21283))))

(declare-fun b!469512 () Bool)

(declare-fun res!280612 () Bool)

(declare-fun e!274962 () Bool)

(assert (=> b!469512 (=> (not res!280612) (not e!274962))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29867 (_ BitVec 32)) Bool)

(assert (=> b!469512 (= res!280612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21283 () Bool)

(assert (=> mapIsEmpty!21283 mapRes!21283))

(declare-fun b!469513 () Bool)

(declare-fun res!280610 () Bool)

(assert (=> b!469513 (=> (not res!280610) (not e!274962))))

(assert (=> b!469513 (= res!280610 (and (= (size!14712 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14711 _keys!1025) (size!14712 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!280609 () Bool)

(assert (=> start!42062 (=> (not res!280609) (not e!274962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42062 (= res!280609 (validMask!0 mask!1365))))

(assert (=> start!42062 e!274962))

(declare-fun tp_is_empty!13057 () Bool)

(assert (=> start!42062 tp_is_empty!13057))

(assert (=> start!42062 tp!40905))

(assert (=> start!42062 true))

(declare-fun array_inv!10444 (array!29867) Bool)

(assert (=> start!42062 (array_inv!10444 _keys!1025)))

(declare-fun array_inv!10445 (array!29869) Bool)

(assert (=> start!42062 (and (array_inv!10445 _values!833) e!274961)))

(declare-fun b!469514 () Bool)

(assert (=> b!469514 (= e!274962 (not e!274960))))

(declare-fun res!280608 () Bool)

(assert (=> b!469514 (=> res!280608 e!274960)))

(assert (=> b!469514 (= res!280608 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!212774 () ListLongMap!7593)

(assert (=> b!469514 (= lt!212775 lt!212774)))

(declare-fun lt!212776 () Unit!13723)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!145 (array!29867 array!29869 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18515 V!18515 V!18515 V!18515 (_ BitVec 32) Int) Unit!13723)

(assert (=> b!469514 (= lt!212776 (lemmaNoChangeToArrayThenSameMapNoExtras!145 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1988 (array!29867 array!29869 (_ BitVec 32) (_ BitVec 32) V!18515 V!18515 (_ BitVec 32) Int) ListLongMap!7593)

(assert (=> b!469514 (= lt!212774 (getCurrentListMapNoExtraKeys!1988 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469514 (= lt!212775 (getCurrentListMapNoExtraKeys!1988 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469515 () Bool)

(assert (=> b!469515 (= e!274963 tp_is_empty!13057)))

(declare-fun b!469516 () Bool)

(declare-fun res!280611 () Bool)

(assert (=> b!469516 (=> (not res!280611) (not e!274962))))

(declare-datatypes ((List!8762 0))(
  ( (Nil!8759) (Cons!8758 (h!9614 (_ BitVec 64)) (t!14713 List!8762)) )
))
(declare-fun arrayNoDuplicates!0 (array!29867 (_ BitVec 32) List!8762) Bool)

(assert (=> b!469516 (= res!280611 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8759))))

(declare-fun b!469517 () Bool)

(assert (=> b!469517 (= e!274964 tp_is_empty!13057)))

(assert (= (and start!42062 res!280609) b!469513))

(assert (= (and b!469513 res!280610) b!469512))

(assert (= (and b!469512 res!280612) b!469516))

(assert (= (and b!469516 res!280611) b!469514))

(assert (= (and b!469514 (not res!280608)) b!469510))

(assert (= (and b!469511 condMapEmpty!21283) mapIsEmpty!21283))

(assert (= (and b!469511 (not condMapEmpty!21283)) mapNonEmpty!21283))

(get-info :version)

(assert (= (and mapNonEmpty!21283 ((_ is ValueCellFull!6185) mapValue!21283)) b!469517))

(assert (= (and b!469511 ((_ is ValueCellFull!6185) mapDefault!21283)) b!469515))

(assert (= start!42062 b!469511))

(declare-fun m!451297 () Bool)

(assert (=> b!469512 m!451297))

(declare-fun m!451299 () Bool)

(assert (=> mapNonEmpty!21283 m!451299))

(declare-fun m!451301 () Bool)

(assert (=> b!469510 m!451301))

(declare-fun m!451303 () Bool)

(assert (=> b!469510 m!451303))

(declare-fun m!451305 () Bool)

(assert (=> b!469510 m!451305))

(assert (=> b!469510 m!451303))

(declare-fun m!451307 () Bool)

(assert (=> b!469510 m!451307))

(declare-fun m!451309 () Bool)

(assert (=> b!469510 m!451309))

(declare-fun m!451311 () Bool)

(assert (=> b!469510 m!451311))

(declare-fun m!451313 () Bool)

(assert (=> b!469516 m!451313))

(declare-fun m!451315 () Bool)

(assert (=> b!469514 m!451315))

(declare-fun m!451317 () Bool)

(assert (=> b!469514 m!451317))

(declare-fun m!451319 () Bool)

(assert (=> b!469514 m!451319))

(declare-fun m!451321 () Bool)

(assert (=> start!42062 m!451321))

(declare-fun m!451323 () Bool)

(assert (=> start!42062 m!451323))

(declare-fun m!451325 () Bool)

(assert (=> start!42062 m!451325))

(check-sat (not mapNonEmpty!21283) (not b!469514) (not b_next!11629) (not b!469510) (not b!469512) tp_is_empty!13057 b_and!20013 (not b!469516) (not start!42062))
(check-sat b_and!20013 (not b_next!11629))
