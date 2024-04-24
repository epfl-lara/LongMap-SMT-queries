; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42068 () Bool)

(assert start!42068)

(declare-fun b_free!11635 () Bool)

(declare-fun b_next!11635 () Bool)

(assert (=> start!42068 (= b_free!11635 (not b_next!11635))))

(declare-fun tp!40924 () Bool)

(declare-fun b_and!20055 () Bool)

(assert (=> start!42068 (= tp!40924 b_and!20055)))

(declare-fun b!469792 () Bool)

(declare-fun e!275153 () Bool)

(assert (=> b!469792 (= e!275153 true)))

(declare-datatypes ((V!18523 0))(
  ( (V!18524 (val!6576 Int)) )
))
(declare-datatypes ((tuple2!8580 0))(
  ( (tuple2!8581 (_1!4301 (_ BitVec 64)) (_2!4301 V!18523)) )
))
(declare-datatypes ((List!8653 0))(
  ( (Nil!8650) (Cons!8649 (h!9505 tuple2!8580) (t!14605 List!8653)) )
))
(declare-datatypes ((ListLongMap!7495 0))(
  ( (ListLongMap!7496 (toList!3763 List!8653)) )
))
(declare-fun lt!213084 () ListLongMap!7495)

(declare-fun lt!213086 () tuple2!8580)

(declare-fun minValueBefore!38 () V!18523)

(declare-fun +!1720 (ListLongMap!7495 tuple2!8580) ListLongMap!7495)

(assert (=> b!469792 (= (+!1720 lt!213084 lt!213086) (+!1720 (+!1720 lt!213084 (tuple2!8581 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!213086))))

(declare-fun minValueAfter!38 () V!18523)

(assert (=> b!469792 (= lt!213086 (tuple2!8581 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13737 0))(
  ( (Unit!13738) )
))
(declare-fun lt!213087 () Unit!13737)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!126 (ListLongMap!7495 (_ BitVec 64) V!18523 V!18523) Unit!13737)

(assert (=> b!469792 (= lt!213087 (addSameAsAddTwiceSameKeyDiffValues!126 lt!213084 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18523)

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!213085 () ListLongMap!7495)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29886 0))(
  ( (array!29887 (arr!14367 (Array (_ BitVec 32) (_ BitVec 64))) (size!14719 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29886)

(declare-datatypes ((ValueCell!6188 0))(
  ( (ValueCellFull!6188 (v!8867 V!18523)) (EmptyCell!6188) )
))
(declare-datatypes ((array!29888 0))(
  ( (array!29889 (arr!14368 (Array (_ BitVec 32) ValueCell!6188)) (size!14720 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29888)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2186 (array!29886 array!29888 (_ BitVec 32) (_ BitVec 32) V!18523 V!18523 (_ BitVec 32) Int) ListLongMap!7495)

(assert (=> b!469792 (= lt!213085 (getCurrentListMap!2186 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!213088 () ListLongMap!7495)

(assert (=> b!469792 (= lt!213088 (getCurrentListMap!2186 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469793 () Bool)

(declare-fun e!275152 () Bool)

(declare-fun e!275149 () Bool)

(declare-fun mapRes!21292 () Bool)

(assert (=> b!469793 (= e!275152 (and e!275149 mapRes!21292))))

(declare-fun condMapEmpty!21292 () Bool)

(declare-fun mapDefault!21292 () ValueCell!6188)

(assert (=> b!469793 (= condMapEmpty!21292 (= (arr!14368 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6188)) mapDefault!21292)))))

(declare-fun b!469794 () Bool)

(declare-fun res!280779 () Bool)

(declare-fun e!275151 () Bool)

(assert (=> b!469794 (=> (not res!280779) (not e!275151))))

(assert (=> b!469794 (= res!280779 (and (= (size!14720 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14719 _keys!1025) (size!14720 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!469795 () Bool)

(declare-fun e!275154 () Bool)

(declare-fun tp_is_empty!13063 () Bool)

(assert (=> b!469795 (= e!275154 tp_is_empty!13063)))

(declare-fun b!469796 () Bool)

(declare-fun res!280777 () Bool)

(assert (=> b!469796 (=> (not res!280777) (not e!275151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29886 (_ BitVec 32)) Bool)

(assert (=> b!469796 (= res!280777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!469797 () Bool)

(declare-fun res!280778 () Bool)

(assert (=> b!469797 (=> (not res!280778) (not e!275151))))

(declare-datatypes ((List!8654 0))(
  ( (Nil!8651) (Cons!8650 (h!9506 (_ BitVec 64)) (t!14606 List!8654)) )
))
(declare-fun arrayNoDuplicates!0 (array!29886 (_ BitVec 32) List!8654) Bool)

(assert (=> b!469797 (= res!280778 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8651))))

(declare-fun mapIsEmpty!21292 () Bool)

(assert (=> mapIsEmpty!21292 mapRes!21292))

(declare-fun res!280775 () Bool)

(assert (=> start!42068 (=> (not res!280775) (not e!275151))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42068 (= res!280775 (validMask!0 mask!1365))))

(assert (=> start!42068 e!275151))

(assert (=> start!42068 tp_is_empty!13063))

(assert (=> start!42068 tp!40924))

(assert (=> start!42068 true))

(declare-fun array_inv!10458 (array!29886) Bool)

(assert (=> start!42068 (array_inv!10458 _keys!1025)))

(declare-fun array_inv!10459 (array!29888) Bool)

(assert (=> start!42068 (and (array_inv!10459 _values!833) e!275152)))

(declare-fun mapNonEmpty!21292 () Bool)

(declare-fun tp!40923 () Bool)

(assert (=> mapNonEmpty!21292 (= mapRes!21292 (and tp!40923 e!275154))))

(declare-fun mapKey!21292 () (_ BitVec 32))

(declare-fun mapValue!21292 () ValueCell!6188)

(declare-fun mapRest!21292 () (Array (_ BitVec 32) ValueCell!6188))

(assert (=> mapNonEmpty!21292 (= (arr!14368 _values!833) (store mapRest!21292 mapKey!21292 mapValue!21292))))

(declare-fun b!469798 () Bool)

(assert (=> b!469798 (= e!275151 (not e!275153))))

(declare-fun res!280776 () Bool)

(assert (=> b!469798 (=> res!280776 e!275153)))

(assert (=> b!469798 (= res!280776 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!213083 () ListLongMap!7495)

(assert (=> b!469798 (= lt!213084 lt!213083)))

(declare-fun lt!213089 () Unit!13737)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!139 (array!29886 array!29888 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18523 V!18523 V!18523 V!18523 (_ BitVec 32) Int) Unit!13737)

(assert (=> b!469798 (= lt!213089 (lemmaNoChangeToArrayThenSameMapNoExtras!139 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1979 (array!29886 array!29888 (_ BitVec 32) (_ BitVec 32) V!18523 V!18523 (_ BitVec 32) Int) ListLongMap!7495)

(assert (=> b!469798 (= lt!213083 (getCurrentListMapNoExtraKeys!1979 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469798 (= lt!213084 (getCurrentListMapNoExtraKeys!1979 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469799 () Bool)

(assert (=> b!469799 (= e!275149 tp_is_empty!13063)))

(assert (= (and start!42068 res!280775) b!469794))

(assert (= (and b!469794 res!280779) b!469796))

(assert (= (and b!469796 res!280777) b!469797))

(assert (= (and b!469797 res!280778) b!469798))

(assert (= (and b!469798 (not res!280776)) b!469792))

(assert (= (and b!469793 condMapEmpty!21292) mapIsEmpty!21292))

(assert (= (and b!469793 (not condMapEmpty!21292)) mapNonEmpty!21292))

(get-info :version)

(assert (= (and mapNonEmpty!21292 ((_ is ValueCellFull!6188) mapValue!21292)) b!469795))

(assert (= (and b!469793 ((_ is ValueCellFull!6188) mapDefault!21292)) b!469799))

(assert (= start!42068 b!469793))

(declare-fun m!452303 () Bool)

(assert (=> mapNonEmpty!21292 m!452303))

(declare-fun m!452305 () Bool)

(assert (=> b!469797 m!452305))

(declare-fun m!452307 () Bool)

(assert (=> b!469796 m!452307))

(declare-fun m!452309 () Bool)

(assert (=> start!42068 m!452309))

(declare-fun m!452311 () Bool)

(assert (=> start!42068 m!452311))

(declare-fun m!452313 () Bool)

(assert (=> start!42068 m!452313))

(declare-fun m!452315 () Bool)

(assert (=> b!469792 m!452315))

(declare-fun m!452317 () Bool)

(assert (=> b!469792 m!452317))

(declare-fun m!452319 () Bool)

(assert (=> b!469792 m!452319))

(assert (=> b!469792 m!452315))

(declare-fun m!452321 () Bool)

(assert (=> b!469792 m!452321))

(declare-fun m!452323 () Bool)

(assert (=> b!469792 m!452323))

(declare-fun m!452325 () Bool)

(assert (=> b!469792 m!452325))

(declare-fun m!452327 () Bool)

(assert (=> b!469798 m!452327))

(declare-fun m!452329 () Bool)

(assert (=> b!469798 m!452329))

(declare-fun m!452331 () Bool)

(assert (=> b!469798 m!452331))

(check-sat (not mapNonEmpty!21292) (not b!469798) tp_is_empty!13063 (not start!42068) b_and!20055 (not b_next!11635) (not b!469797) (not b!469796) (not b!469792))
(check-sat b_and!20055 (not b_next!11635))
