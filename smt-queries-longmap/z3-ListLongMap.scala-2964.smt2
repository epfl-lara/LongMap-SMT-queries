; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42026 () Bool)

(assert start!42026)

(declare-fun b_free!11593 () Bool)

(declare-fun b_next!11593 () Bool)

(assert (=> start!42026 (= b_free!11593 (not b_next!11593))))

(declare-fun tp!40797 () Bool)

(declare-fun b_and!20013 () Bool)

(assert (=> start!42026 (= tp!40797 b_and!20013)))

(declare-fun b!469288 () Bool)

(declare-fun e!274773 () Bool)

(assert (=> b!469288 (= e!274773 true)))

(declare-datatypes ((V!18467 0))(
  ( (V!18468 (val!6555 Int)) )
))
(declare-datatypes ((tuple2!8546 0))(
  ( (tuple2!8547 (_1!4284 (_ BitVec 64)) (_2!4284 V!18467)) )
))
(declare-datatypes ((List!8622 0))(
  ( (Nil!8619) (Cons!8618 (h!9474 tuple2!8546) (t!14574 List!8622)) )
))
(declare-datatypes ((ListLongMap!7461 0))(
  ( (ListLongMap!7462 (toList!3746 List!8622)) )
))
(declare-fun lt!212646 () ListLongMap!7461)

(declare-fun lt!212645 () tuple2!8546)

(declare-fun minValueBefore!38 () V!18467)

(declare-fun +!1705 (ListLongMap!7461 tuple2!8546) ListLongMap!7461)

(assert (=> b!469288 (= (+!1705 lt!212646 lt!212645) (+!1705 (+!1705 lt!212646 (tuple2!8547 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212645))))

(declare-fun minValueAfter!38 () V!18467)

(assert (=> b!469288 (= lt!212645 (tuple2!8547 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13703 0))(
  ( (Unit!13704) )
))
(declare-fun lt!212643 () Unit!13703)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!111 (ListLongMap!7461 (_ BitVec 64) V!18467 V!18467) Unit!13703)

(assert (=> b!469288 (= lt!212643 (addSameAsAddTwiceSameKeyDiffValues!111 lt!212646 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18467)

(declare-fun lt!212648 () ListLongMap!7461)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29802 0))(
  ( (array!29803 (arr!14325 (Array (_ BitVec 32) (_ BitVec 64))) (size!14677 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29802)

(declare-datatypes ((ValueCell!6167 0))(
  ( (ValueCellFull!6167 (v!8846 V!18467)) (EmptyCell!6167) )
))
(declare-datatypes ((array!29804 0))(
  ( (array!29805 (arr!14326 (Array (_ BitVec 32) ValueCell!6167)) (size!14678 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29804)

(declare-fun defaultEntry!841 () Int)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2171 (array!29802 array!29804 (_ BitVec 32) (_ BitVec 32) V!18467 V!18467 (_ BitVec 32) Int) ListLongMap!7461)

(assert (=> b!469288 (= lt!212648 (getCurrentListMap!2171 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!212647 () ListLongMap!7461)

(assert (=> b!469288 (= lt!212647 (getCurrentListMap!2171 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469289 () Bool)

(declare-fun e!274772 () Bool)

(assert (=> b!469289 (= e!274772 (not e!274773))))

(declare-fun res!280463 () Bool)

(assert (=> b!469289 (=> res!280463 e!274773)))

(assert (=> b!469289 (= res!280463 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!212644 () ListLongMap!7461)

(assert (=> b!469289 (= lt!212646 lt!212644)))

(declare-fun lt!212642 () Unit!13703)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!124 (array!29802 array!29804 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18467 V!18467 V!18467 V!18467 (_ BitVec 32) Int) Unit!13703)

(assert (=> b!469289 (= lt!212642 (lemmaNoChangeToArrayThenSameMapNoExtras!124 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1964 (array!29802 array!29804 (_ BitVec 32) (_ BitVec 32) V!18467 V!18467 (_ BitVec 32) Int) ListLongMap!7461)

(assert (=> b!469289 (= lt!212644 (getCurrentListMapNoExtraKeys!1964 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469289 (= lt!212646 (getCurrentListMapNoExtraKeys!1964 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469290 () Bool)

(declare-fun res!280462 () Bool)

(assert (=> b!469290 (=> (not res!280462) (not e!274772))))

(declare-datatypes ((List!8623 0))(
  ( (Nil!8620) (Cons!8619 (h!9475 (_ BitVec 64)) (t!14575 List!8623)) )
))
(declare-fun arrayNoDuplicates!0 (array!29802 (_ BitVec 32) List!8623) Bool)

(assert (=> b!469290 (= res!280462 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8620))))

(declare-fun b!469291 () Bool)

(declare-fun e!274775 () Bool)

(declare-fun e!274774 () Bool)

(declare-fun mapRes!21229 () Bool)

(assert (=> b!469291 (= e!274775 (and e!274774 mapRes!21229))))

(declare-fun condMapEmpty!21229 () Bool)

(declare-fun mapDefault!21229 () ValueCell!6167)

(assert (=> b!469291 (= condMapEmpty!21229 (= (arr!14326 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6167)) mapDefault!21229)))))

(declare-fun b!469292 () Bool)

(declare-fun tp_is_empty!13021 () Bool)

(assert (=> b!469292 (= e!274774 tp_is_empty!13021)))

(declare-fun mapIsEmpty!21229 () Bool)

(assert (=> mapIsEmpty!21229 mapRes!21229))

(declare-fun res!280461 () Bool)

(assert (=> start!42026 (=> (not res!280461) (not e!274772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42026 (= res!280461 (validMask!0 mask!1365))))

(assert (=> start!42026 e!274772))

(assert (=> start!42026 tp_is_empty!13021))

(assert (=> start!42026 tp!40797))

(assert (=> start!42026 true))

(declare-fun array_inv!10432 (array!29802) Bool)

(assert (=> start!42026 (array_inv!10432 _keys!1025)))

(declare-fun array_inv!10433 (array!29804) Bool)

(assert (=> start!42026 (and (array_inv!10433 _values!833) e!274775)))

(declare-fun b!469293 () Bool)

(declare-fun e!274771 () Bool)

(assert (=> b!469293 (= e!274771 tp_is_empty!13021)))

(declare-fun b!469294 () Bool)

(declare-fun res!280464 () Bool)

(assert (=> b!469294 (=> (not res!280464) (not e!274772))))

(assert (=> b!469294 (= res!280464 (and (= (size!14678 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14677 _keys!1025) (size!14678 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!469295 () Bool)

(declare-fun res!280460 () Bool)

(assert (=> b!469295 (=> (not res!280460) (not e!274772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29802 (_ BitVec 32)) Bool)

(assert (=> b!469295 (= res!280460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21229 () Bool)

(declare-fun tp!40798 () Bool)

(assert (=> mapNonEmpty!21229 (= mapRes!21229 (and tp!40798 e!274771))))

(declare-fun mapValue!21229 () ValueCell!6167)

(declare-fun mapKey!21229 () (_ BitVec 32))

(declare-fun mapRest!21229 () (Array (_ BitVec 32) ValueCell!6167))

(assert (=> mapNonEmpty!21229 (= (arr!14326 _values!833) (store mapRest!21229 mapKey!21229 mapValue!21229))))

(assert (= (and start!42026 res!280461) b!469294))

(assert (= (and b!469294 res!280464) b!469295))

(assert (= (and b!469295 res!280460) b!469290))

(assert (= (and b!469290 res!280462) b!469289))

(assert (= (and b!469289 (not res!280463)) b!469288))

(assert (= (and b!469291 condMapEmpty!21229) mapIsEmpty!21229))

(assert (= (and b!469291 (not condMapEmpty!21229)) mapNonEmpty!21229))

(get-info :version)

(assert (= (and mapNonEmpty!21229 ((_ is ValueCellFull!6167) mapValue!21229)) b!469293))

(assert (= (and b!469291 ((_ is ValueCellFull!6167) mapDefault!21229)) b!469292))

(assert (= start!42026 b!469291))

(declare-fun m!451673 () Bool)

(assert (=> b!469290 m!451673))

(declare-fun m!451675 () Bool)

(assert (=> b!469288 m!451675))

(declare-fun m!451677 () Bool)

(assert (=> b!469288 m!451677))

(declare-fun m!451679 () Bool)

(assert (=> b!469288 m!451679))

(assert (=> b!469288 m!451679))

(declare-fun m!451681 () Bool)

(assert (=> b!469288 m!451681))

(declare-fun m!451683 () Bool)

(assert (=> b!469288 m!451683))

(declare-fun m!451685 () Bool)

(assert (=> b!469288 m!451685))

(declare-fun m!451687 () Bool)

(assert (=> mapNonEmpty!21229 m!451687))

(declare-fun m!451689 () Bool)

(assert (=> b!469289 m!451689))

(declare-fun m!451691 () Bool)

(assert (=> b!469289 m!451691))

(declare-fun m!451693 () Bool)

(assert (=> b!469289 m!451693))

(declare-fun m!451695 () Bool)

(assert (=> start!42026 m!451695))

(declare-fun m!451697 () Bool)

(assert (=> start!42026 m!451697))

(declare-fun m!451699 () Bool)

(assert (=> start!42026 m!451699))

(declare-fun m!451701 () Bool)

(assert (=> b!469295 m!451701))

(check-sat (not b!469290) tp_is_empty!13021 (not mapNonEmpty!21229) (not b!469295) (not b_next!11593) (not b!469289) b_and!20013 (not b!469288) (not start!42026))
(check-sat b_and!20013 (not b_next!11593))
