; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42168 () Bool)

(assert start!42168)

(declare-fun b_free!11701 () Bool)

(declare-fun b_next!11701 () Bool)

(assert (=> start!42168 (= b_free!11701 (not b_next!11701))))

(declare-fun tp!41127 () Bool)

(declare-fun b_and!20105 () Bool)

(assert (=> start!42168 (= tp!41127 b_and!20105)))

(declare-fun res!281175 () Bool)

(declare-fun e!275696 () Bool)

(assert (=> start!42168 (=> (not res!281175) (not e!275696))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42168 (= res!281175 (validMask!0 mask!1365))))

(assert (=> start!42168 e!275696))

(declare-fun tp_is_empty!13129 () Bool)

(assert (=> start!42168 tp_is_empty!13129))

(assert (=> start!42168 tp!41127))

(assert (=> start!42168 true))

(declare-datatypes ((array!30007 0))(
  ( (array!30008 (arr!14426 (Array (_ BitVec 32) (_ BitVec 64))) (size!14779 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30007)

(declare-fun array_inv!10492 (array!30007) Bool)

(assert (=> start!42168 (array_inv!10492 _keys!1025)))

(declare-datatypes ((V!18611 0))(
  ( (V!18612 (val!6609 Int)) )
))
(declare-datatypes ((ValueCell!6221 0))(
  ( (ValueCellFull!6221 (v!8894 V!18611)) (EmptyCell!6221) )
))
(declare-datatypes ((array!30009 0))(
  ( (array!30010 (arr!14427 (Array (_ BitVec 32) ValueCell!6221)) (size!14780 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30009)

(declare-fun e!275692 () Bool)

(declare-fun array_inv!10493 (array!30009) Bool)

(assert (=> start!42168 (and (array_inv!10493 _values!833) e!275692)))

(declare-fun b!470555 () Bool)

(declare-fun res!281176 () Bool)

(assert (=> b!470555 (=> (not res!281176) (not e!275696))))

(declare-datatypes ((List!8805 0))(
  ( (Nil!8802) (Cons!8801 (h!9657 (_ BitVec 64)) (t!14760 List!8805)) )
))
(declare-fun arrayNoDuplicates!0 (array!30007 (_ BitVec 32) List!8805) Bool)

(assert (=> b!470555 (= res!281176 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8802))))

(declare-fun b!470556 () Bool)

(declare-fun e!275694 () Bool)

(assert (=> b!470556 (= e!275694 tp_is_empty!13129)))

(declare-fun b!470557 () Bool)

(declare-fun res!281173 () Bool)

(assert (=> b!470557 (=> (not res!281173) (not e!275696))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30007 (_ BitVec 32)) Bool)

(assert (=> b!470557 (= res!281173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470558 () Bool)

(declare-fun res!281174 () Bool)

(assert (=> b!470558 (=> (not res!281174) (not e!275696))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!470558 (= res!281174 (and (= (size!14780 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14779 _keys!1025) (size!14780 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470559 () Bool)

(assert (=> b!470559 (= e!275696 (not true))))

(declare-datatypes ((tuple2!8736 0))(
  ( (tuple2!8737 (_1!4379 (_ BitVec 64)) (_2!4379 V!18611)) )
))
(declare-datatypes ((List!8806 0))(
  ( (Nil!8803) (Cons!8802 (h!9658 tuple2!8736) (t!14761 List!8806)) )
))
(declare-datatypes ((ListLongMap!7639 0))(
  ( (ListLongMap!7640 (toList!3835 List!8806)) )
))
(declare-fun lt!213391 () ListLongMap!7639)

(declare-fun lt!213390 () ListLongMap!7639)

(assert (=> b!470559 (= lt!213391 lt!213390)))

(declare-fun minValueBefore!38 () V!18611)

(declare-fun zeroValue!794 () V!18611)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13771 0))(
  ( (Unit!13772) )
))
(declare-fun lt!213389 () Unit!13771)

(declare-fun minValueAfter!38 () V!18611)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!167 (array!30007 array!30009 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18611 V!18611 V!18611 V!18611 (_ BitVec 32) Int) Unit!13771)

(assert (=> b!470559 (= lt!213389 (lemmaNoChangeToArrayThenSameMapNoExtras!167 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2010 (array!30007 array!30009 (_ BitVec 32) (_ BitVec 32) V!18611 V!18611 (_ BitVec 32) Int) ListLongMap!7639)

(assert (=> b!470559 (= lt!213390 (getCurrentListMapNoExtraKeys!2010 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470559 (= lt!213391 (getCurrentListMapNoExtraKeys!2010 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470560 () Bool)

(declare-fun e!275695 () Bool)

(declare-fun mapRes!21397 () Bool)

(assert (=> b!470560 (= e!275692 (and e!275695 mapRes!21397))))

(declare-fun condMapEmpty!21397 () Bool)

(declare-fun mapDefault!21397 () ValueCell!6221)

(assert (=> b!470560 (= condMapEmpty!21397 (= (arr!14427 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6221)) mapDefault!21397)))))

(declare-fun mapNonEmpty!21397 () Bool)

(declare-fun tp!41128 () Bool)

(assert (=> mapNonEmpty!21397 (= mapRes!21397 (and tp!41128 e!275694))))

(declare-fun mapRest!21397 () (Array (_ BitVec 32) ValueCell!6221))

(declare-fun mapKey!21397 () (_ BitVec 32))

(declare-fun mapValue!21397 () ValueCell!6221)

(assert (=> mapNonEmpty!21397 (= (arr!14427 _values!833) (store mapRest!21397 mapKey!21397 mapValue!21397))))

(declare-fun b!470561 () Bool)

(assert (=> b!470561 (= e!275695 tp_is_empty!13129)))

(declare-fun mapIsEmpty!21397 () Bool)

(assert (=> mapIsEmpty!21397 mapRes!21397))

(assert (= (and start!42168 res!281175) b!470558))

(assert (= (and b!470558 res!281174) b!470557))

(assert (= (and b!470557 res!281173) b!470555))

(assert (= (and b!470555 res!281176) b!470559))

(assert (= (and b!470560 condMapEmpty!21397) mapIsEmpty!21397))

(assert (= (and b!470560 (not condMapEmpty!21397)) mapNonEmpty!21397))

(get-info :version)

(assert (= (and mapNonEmpty!21397 ((_ is ValueCellFull!6221) mapValue!21397)) b!470556))

(assert (= (and b!470560 ((_ is ValueCellFull!6221) mapDefault!21397)) b!470561))

(assert (= start!42168 b!470560))

(declare-fun m!452319 () Bool)

(assert (=> b!470559 m!452319))

(declare-fun m!452321 () Bool)

(assert (=> b!470559 m!452321))

(declare-fun m!452323 () Bool)

(assert (=> b!470559 m!452323))

(declare-fun m!452325 () Bool)

(assert (=> start!42168 m!452325))

(declare-fun m!452327 () Bool)

(assert (=> start!42168 m!452327))

(declare-fun m!452329 () Bool)

(assert (=> start!42168 m!452329))

(declare-fun m!452331 () Bool)

(assert (=> b!470557 m!452331))

(declare-fun m!452333 () Bool)

(assert (=> b!470555 m!452333))

(declare-fun m!452335 () Bool)

(assert (=> mapNonEmpty!21397 m!452335))

(check-sat (not b_next!11701) (not b!470555) (not b!470557) b_and!20105 (not start!42168) (not b!470559) tp_is_empty!13129 (not mapNonEmpty!21397))
(check-sat b_and!20105 (not b_next!11701))
