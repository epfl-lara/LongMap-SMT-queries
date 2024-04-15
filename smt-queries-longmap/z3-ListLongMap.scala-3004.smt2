; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42328 () Bool)

(assert start!42328)

(declare-fun b_free!11833 () Bool)

(declare-fun b_next!11833 () Bool)

(assert (=> start!42328 (= b_free!11833 (not b_next!11833))))

(declare-fun tp!41529 () Bool)

(declare-fun b_and!20253 () Bool)

(assert (=> start!42328 (= tp!41529 b_and!20253)))

(declare-fun mapNonEmpty!21601 () Bool)

(declare-fun mapRes!21601 () Bool)

(declare-fun tp!41530 () Bool)

(declare-fun e!276833 () Bool)

(assert (=> mapNonEmpty!21601 (= mapRes!21601 (and tp!41530 e!276833))))

(declare-datatypes ((V!18787 0))(
  ( (V!18788 (val!6675 Int)) )
))
(declare-datatypes ((ValueCell!6287 0))(
  ( (ValueCellFull!6287 (v!8960 V!18787)) (EmptyCell!6287) )
))
(declare-fun mapValue!21601 () ValueCell!6287)

(declare-fun mapKey!21601 () (_ BitVec 32))

(declare-fun mapRest!21601 () (Array (_ BitVec 32) ValueCell!6287))

(declare-datatypes ((array!30265 0))(
  ( (array!30266 (arr!14553 (Array (_ BitVec 32) ValueCell!6287)) (size!14906 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30265)

(assert (=> mapNonEmpty!21601 (= (arr!14553 _values!833) (store mapRest!21601 mapKey!21601 mapValue!21601))))

(declare-fun mapIsEmpty!21601 () Bool)

(assert (=> mapIsEmpty!21601 mapRes!21601))

(declare-fun b!472149 () Bool)

(declare-fun res!282068 () Bool)

(declare-fun e!276835 () Bool)

(assert (=> b!472149 (=> (not res!282068) (not e!276835))))

(declare-datatypes ((array!30267 0))(
  ( (array!30268 (arr!14554 (Array (_ BitVec 32) (_ BitVec 64))) (size!14907 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30267)

(declare-datatypes ((List!8903 0))(
  ( (Nil!8900) (Cons!8899 (h!9755 (_ BitVec 64)) (t!14862 List!8903)) )
))
(declare-fun arrayNoDuplicates!0 (array!30267 (_ BitVec 32) List!8903) Bool)

(assert (=> b!472149 (= res!282068 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8900))))

(declare-fun b!472151 () Bool)

(declare-fun e!276831 () Bool)

(assert (=> b!472151 (= e!276831 true)))

(declare-fun minValueBefore!38 () V!18787)

(declare-fun zeroValue!794 () V!18787)

(declare-fun defaultEntry!841 () Int)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-datatypes ((tuple2!8832 0))(
  ( (tuple2!8833 (_1!4427 (_ BitVec 64)) (_2!4427 V!18787)) )
))
(declare-datatypes ((List!8904 0))(
  ( (Nil!8901) (Cons!8900 (h!9756 tuple2!8832) (t!14863 List!8904)) )
))
(declare-datatypes ((ListLongMap!7735 0))(
  ( (ListLongMap!7736 (toList!3883 List!8904)) )
))
(declare-fun lt!214103 () ListLongMap!7735)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun getCurrentListMap!2190 (array!30267 array!30265 (_ BitVec 32) (_ BitVec 32) V!18787 V!18787 (_ BitVec 32) Int) ListLongMap!7735)

(assert (=> b!472151 (= lt!214103 (getCurrentListMap!2190 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472152 () Bool)

(declare-fun res!282067 () Bool)

(assert (=> b!472152 (=> (not res!282067) (not e!276835))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30267 (_ BitVec 32)) Bool)

(assert (=> b!472152 (= res!282067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472153 () Bool)

(declare-fun e!276832 () Bool)

(declare-fun e!276834 () Bool)

(assert (=> b!472153 (= e!276832 (and e!276834 mapRes!21601))))

(declare-fun condMapEmpty!21601 () Bool)

(declare-fun mapDefault!21601 () ValueCell!6287)

(assert (=> b!472153 (= condMapEmpty!21601 (= (arr!14553 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6287)) mapDefault!21601)))))

(declare-fun b!472154 () Bool)

(declare-fun tp_is_empty!13261 () Bool)

(assert (=> b!472154 (= e!276834 tp_is_empty!13261)))

(declare-fun b!472155 () Bool)

(assert (=> b!472155 (= e!276835 (not e!276831))))

(declare-fun res!282065 () Bool)

(assert (=> b!472155 (=> res!282065 e!276831)))

(assert (=> b!472155 (= res!282065 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!214101 () ListLongMap!7735)

(declare-fun lt!214102 () ListLongMap!7735)

(assert (=> b!472155 (= lt!214101 lt!214102)))

(declare-datatypes ((Unit!13861 0))(
  ( (Unit!13862) )
))
(declare-fun lt!214104 () Unit!13861)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18787)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!212 (array!30267 array!30265 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18787 V!18787 V!18787 V!18787 (_ BitVec 32) Int) Unit!13861)

(assert (=> b!472155 (= lt!214104 (lemmaNoChangeToArrayThenSameMapNoExtras!212 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2055 (array!30267 array!30265 (_ BitVec 32) (_ BitVec 32) V!18787 V!18787 (_ BitVec 32) Int) ListLongMap!7735)

(assert (=> b!472155 (= lt!214102 (getCurrentListMapNoExtraKeys!2055 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472155 (= lt!214101 (getCurrentListMapNoExtraKeys!2055 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472156 () Bool)

(declare-fun res!282066 () Bool)

(assert (=> b!472156 (=> (not res!282066) (not e!276835))))

(assert (=> b!472156 (= res!282066 (and (= (size!14906 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14907 _keys!1025) (size!14906 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!282069 () Bool)

(assert (=> start!42328 (=> (not res!282069) (not e!276835))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42328 (= res!282069 (validMask!0 mask!1365))))

(assert (=> start!42328 e!276835))

(assert (=> start!42328 tp_is_empty!13261))

(assert (=> start!42328 tp!41529))

(assert (=> start!42328 true))

(declare-fun array_inv!10582 (array!30267) Bool)

(assert (=> start!42328 (array_inv!10582 _keys!1025)))

(declare-fun array_inv!10583 (array!30265) Bool)

(assert (=> start!42328 (and (array_inv!10583 _values!833) e!276832)))

(declare-fun b!472150 () Bool)

(assert (=> b!472150 (= e!276833 tp_is_empty!13261)))

(assert (= (and start!42328 res!282069) b!472156))

(assert (= (and b!472156 res!282066) b!472152))

(assert (= (and b!472152 res!282067) b!472149))

(assert (= (and b!472149 res!282068) b!472155))

(assert (= (and b!472155 (not res!282065)) b!472151))

(assert (= (and b!472153 condMapEmpty!21601) mapIsEmpty!21601))

(assert (= (and b!472153 (not condMapEmpty!21601)) mapNonEmpty!21601))

(get-info :version)

(assert (= (and mapNonEmpty!21601 ((_ is ValueCellFull!6287) mapValue!21601)) b!472150))

(assert (= (and b!472153 ((_ is ValueCellFull!6287) mapDefault!21601)) b!472154))

(assert (= start!42328 b!472153))

(declare-fun m!453663 () Bool)

(assert (=> b!472152 m!453663))

(declare-fun m!453665 () Bool)

(assert (=> start!42328 m!453665))

(declare-fun m!453667 () Bool)

(assert (=> start!42328 m!453667))

(declare-fun m!453669 () Bool)

(assert (=> start!42328 m!453669))

(declare-fun m!453671 () Bool)

(assert (=> b!472155 m!453671))

(declare-fun m!453673 () Bool)

(assert (=> b!472155 m!453673))

(declare-fun m!453675 () Bool)

(assert (=> b!472155 m!453675))

(declare-fun m!453677 () Bool)

(assert (=> b!472149 m!453677))

(declare-fun m!453679 () Bool)

(assert (=> b!472151 m!453679))

(declare-fun m!453681 () Bool)

(assert (=> mapNonEmpty!21601 m!453681))

(check-sat (not mapNonEmpty!21601) b_and!20253 tp_is_empty!13261 (not b!472149) (not b!472151) (not b!472152) (not start!42328) (not b!472155) (not b_next!11833))
(check-sat b_and!20253 (not b_next!11833))
