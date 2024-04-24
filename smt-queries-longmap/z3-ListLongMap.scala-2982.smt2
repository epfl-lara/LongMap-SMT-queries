; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42168 () Bool)

(assert start!42168)

(declare-fun b_free!11701 () Bool)

(declare-fun b_next!11701 () Bool)

(assert (=> start!42168 (= b_free!11701 (not b_next!11701))))

(declare-fun tp!41128 () Bool)

(declare-fun b_and!20141 () Bool)

(assert (=> start!42168 (= tp!41128 b_and!20141)))

(declare-fun mapIsEmpty!21397 () Bool)

(declare-fun mapRes!21397 () Bool)

(assert (=> mapIsEmpty!21397 mapRes!21397))

(declare-fun b!470765 () Bool)

(declare-fun res!281296 () Bool)

(declare-fun e!275827 () Bool)

(assert (=> b!470765 (=> (not res!281296) (not e!275827))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30012 0))(
  ( (array!30013 (arr!14428 (Array (_ BitVec 32) (_ BitVec 64))) (size!14780 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30012)

(declare-datatypes ((V!18611 0))(
  ( (V!18612 (val!6609 Int)) )
))
(declare-datatypes ((ValueCell!6221 0))(
  ( (ValueCellFull!6221 (v!8901 V!18611)) (EmptyCell!6221) )
))
(declare-datatypes ((array!30014 0))(
  ( (array!30015 (arr!14429 (Array (_ BitVec 32) ValueCell!6221)) (size!14781 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30014)

(assert (=> b!470765 (= res!281296 (and (= (size!14781 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14780 _keys!1025) (size!14781 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470767 () Bool)

(declare-fun e!275831 () Bool)

(declare-fun tp_is_empty!13129 () Bool)

(assert (=> b!470767 (= e!275831 tp_is_empty!13129)))

(declare-fun mapNonEmpty!21397 () Bool)

(declare-fun tp!41127 () Bool)

(assert (=> mapNonEmpty!21397 (= mapRes!21397 (and tp!41127 e!275831))))

(declare-fun mapRest!21397 () (Array (_ BitVec 32) ValueCell!6221))

(declare-fun mapKey!21397 () (_ BitVec 32))

(declare-fun mapValue!21397 () ValueCell!6221)

(assert (=> mapNonEmpty!21397 (= (arr!14429 _values!833) (store mapRest!21397 mapKey!21397 mapValue!21397))))

(declare-fun b!470768 () Bool)

(declare-fun res!281297 () Bool)

(assert (=> b!470768 (=> (not res!281297) (not e!275827))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30012 (_ BitVec 32)) Bool)

(assert (=> b!470768 (= res!281297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470769 () Bool)

(declare-fun e!275830 () Bool)

(assert (=> b!470769 (= e!275830 tp_is_empty!13129)))

(declare-fun b!470770 () Bool)

(declare-fun res!281295 () Bool)

(assert (=> b!470770 (=> (not res!281295) (not e!275827))))

(declare-datatypes ((List!8697 0))(
  ( (Nil!8694) (Cons!8693 (h!9549 (_ BitVec 64)) (t!14653 List!8697)) )
))
(declare-fun arrayNoDuplicates!0 (array!30012 (_ BitVec 32) List!8697) Bool)

(assert (=> b!470770 (= res!281295 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8694))))

(declare-fun b!470771 () Bool)

(declare-fun e!275828 () Bool)

(assert (=> b!470771 (= e!275828 (and e!275830 mapRes!21397))))

(declare-fun condMapEmpty!21397 () Bool)

(declare-fun mapDefault!21397 () ValueCell!6221)

(assert (=> b!470771 (= condMapEmpty!21397 (= (arr!14429 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6221)) mapDefault!21397)))))

(declare-fun res!281298 () Bool)

(assert (=> start!42168 (=> (not res!281298) (not e!275827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42168 (= res!281298 (validMask!0 mask!1365))))

(assert (=> start!42168 e!275827))

(assert (=> start!42168 tp_is_empty!13129))

(assert (=> start!42168 tp!41128))

(assert (=> start!42168 true))

(declare-fun array_inv!10498 (array!30012) Bool)

(assert (=> start!42168 (array_inv!10498 _keys!1025)))

(declare-fun array_inv!10499 (array!30014) Bool)

(assert (=> start!42168 (and (array_inv!10499 _values!833) e!275828)))

(declare-fun b!470766 () Bool)

(assert (=> b!470766 (= e!275827 (not true))))

(declare-datatypes ((tuple2!8624 0))(
  ( (tuple2!8625 (_1!4323 (_ BitVec 64)) (_2!4323 V!18611)) )
))
(declare-datatypes ((List!8698 0))(
  ( (Nil!8695) (Cons!8694 (h!9550 tuple2!8624) (t!14654 List!8698)) )
))
(declare-datatypes ((ListLongMap!7539 0))(
  ( (ListLongMap!7540 (toList!3785 List!8698)) )
))
(declare-fun lt!213637 () ListLongMap!7539)

(declare-fun lt!213635 () ListLongMap!7539)

(assert (=> b!470766 (= lt!213637 lt!213635)))

(declare-fun minValueBefore!38 () V!18611)

(declare-fun zeroValue!794 () V!18611)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13783 0))(
  ( (Unit!13784) )
))
(declare-fun lt!213636 () Unit!13783)

(declare-fun minValueAfter!38 () V!18611)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!160 (array!30012 array!30014 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18611 V!18611 V!18611 V!18611 (_ BitVec 32) Int) Unit!13783)

(assert (=> b!470766 (= lt!213636 (lemmaNoChangeToArrayThenSameMapNoExtras!160 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2000 (array!30012 array!30014 (_ BitVec 32) (_ BitVec 32) V!18611 V!18611 (_ BitVec 32) Int) ListLongMap!7539)

(assert (=> b!470766 (= lt!213635 (getCurrentListMapNoExtraKeys!2000 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470766 (= lt!213637 (getCurrentListMapNoExtraKeys!2000 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (= (and start!42168 res!281298) b!470765))

(assert (= (and b!470765 res!281296) b!470768))

(assert (= (and b!470768 res!281297) b!470770))

(assert (= (and b!470770 res!281295) b!470766))

(assert (= (and b!470771 condMapEmpty!21397) mapIsEmpty!21397))

(assert (= (and b!470771 (not condMapEmpty!21397)) mapNonEmpty!21397))

(get-info :version)

(assert (= (and mapNonEmpty!21397 ((_ is ValueCellFull!6221) mapValue!21397)) b!470767))

(assert (= (and b!470771 ((_ is ValueCellFull!6221) mapDefault!21397)) b!470769))

(assert (= start!42168 b!470771))

(declare-fun m!453235 () Bool)

(assert (=> b!470768 m!453235))

(declare-fun m!453237 () Bool)

(assert (=> b!470770 m!453237))

(declare-fun m!453239 () Bool)

(assert (=> mapNonEmpty!21397 m!453239))

(declare-fun m!453241 () Bool)

(assert (=> start!42168 m!453241))

(declare-fun m!453243 () Bool)

(assert (=> start!42168 m!453243))

(declare-fun m!453245 () Bool)

(assert (=> start!42168 m!453245))

(declare-fun m!453247 () Bool)

(assert (=> b!470766 m!453247))

(declare-fun m!453249 () Bool)

(assert (=> b!470766 m!453249))

(declare-fun m!453251 () Bool)

(assert (=> b!470766 m!453251))

(check-sat (not b_next!11701) (not mapNonEmpty!21397) (not b!470766) (not b!470770) tp_is_empty!13129 (not start!42168) (not b!470768) b_and!20141)
(check-sat b_and!20141 (not b_next!11701))
