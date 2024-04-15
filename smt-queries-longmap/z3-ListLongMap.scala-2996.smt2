; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42266 () Bool)

(assert start!42266)

(declare-fun b_free!11785 () Bool)

(declare-fun b_next!11785 () Bool)

(assert (=> start!42266 (= b_free!11785 (not b_next!11785))))

(declare-fun tp!41382 () Bool)

(declare-fun b_and!20197 () Bool)

(assert (=> start!42266 (= tp!41382 b_and!20197)))

(declare-fun b!471522 () Bool)

(declare-fun res!281708 () Bool)

(declare-fun e!276378 () Bool)

(assert (=> b!471522 (=> (not res!281708) (not e!276378))))

(declare-datatypes ((array!30171 0))(
  ( (array!30172 (arr!14507 (Array (_ BitVec 32) (_ BitVec 64))) (size!14860 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30171)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30171 (_ BitVec 32)) Bool)

(assert (=> b!471522 (= res!281708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471523 () Bool)

(declare-fun e!276380 () Bool)

(declare-fun e!276377 () Bool)

(declare-fun mapRes!21526 () Bool)

(assert (=> b!471523 (= e!276380 (and e!276377 mapRes!21526))))

(declare-fun condMapEmpty!21526 () Bool)

(declare-datatypes ((V!18723 0))(
  ( (V!18724 (val!6651 Int)) )
))
(declare-datatypes ((ValueCell!6263 0))(
  ( (ValueCellFull!6263 (v!8936 V!18723)) (EmptyCell!6263) )
))
(declare-datatypes ((array!30173 0))(
  ( (array!30174 (arr!14508 (Array (_ BitVec 32) ValueCell!6263)) (size!14861 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30173)

(declare-fun mapDefault!21526 () ValueCell!6263)

(assert (=> b!471523 (= condMapEmpty!21526 (= (arr!14508 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6263)) mapDefault!21526)))))

(declare-fun res!281711 () Bool)

(assert (=> start!42266 (=> (not res!281711) (not e!276378))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42266 (= res!281711 (validMask!0 mask!1365))))

(assert (=> start!42266 e!276378))

(declare-fun tp_is_empty!13213 () Bool)

(assert (=> start!42266 tp_is_empty!13213))

(assert (=> start!42266 tp!41382))

(assert (=> start!42266 true))

(declare-fun array_inv!10552 (array!30171) Bool)

(assert (=> start!42266 (array_inv!10552 _keys!1025)))

(declare-fun array_inv!10553 (array!30173) Bool)

(assert (=> start!42266 (and (array_inv!10553 _values!833) e!276380)))

(declare-fun mapNonEmpty!21526 () Bool)

(declare-fun tp!41383 () Bool)

(declare-fun e!276381 () Bool)

(assert (=> mapNonEmpty!21526 (= mapRes!21526 (and tp!41383 e!276381))))

(declare-fun mapValue!21526 () ValueCell!6263)

(declare-fun mapRest!21526 () (Array (_ BitVec 32) ValueCell!6263))

(declare-fun mapKey!21526 () (_ BitVec 32))

(assert (=> mapNonEmpty!21526 (= (arr!14508 _values!833) (store mapRest!21526 mapKey!21526 mapValue!21526))))

(declare-fun b!471524 () Bool)

(assert (=> b!471524 (= e!276381 tp_is_empty!13213)))

(declare-fun b!471525 () Bool)

(assert (=> b!471525 (= e!276377 tp_is_empty!13213)))

(declare-fun mapIsEmpty!21526 () Bool)

(assert (=> mapIsEmpty!21526 mapRes!21526))

(declare-fun b!471526 () Bool)

(assert (=> b!471526 (= e!276378 (not true))))

(declare-datatypes ((tuple2!8792 0))(
  ( (tuple2!8793 (_1!4407 (_ BitVec 64)) (_2!4407 V!18723)) )
))
(declare-datatypes ((List!8865 0))(
  ( (Nil!8862) (Cons!8861 (h!9717 tuple2!8792) (t!14822 List!8865)) )
))
(declare-datatypes ((ListLongMap!7695 0))(
  ( (ListLongMap!7696 (toList!3863 List!8865)) )
))
(declare-fun lt!213807 () ListLongMap!7695)

(declare-fun lt!213808 () ListLongMap!7695)

(assert (=> b!471526 (= lt!213807 lt!213808)))

(declare-fun minValueBefore!38 () V!18723)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun zeroValue!794 () V!18723)

(declare-datatypes ((Unit!13827 0))(
  ( (Unit!13828) )
))
(declare-fun lt!213809 () Unit!13827)

(declare-fun minValueAfter!38 () V!18723)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!195 (array!30171 array!30173 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18723 V!18723 V!18723 V!18723 (_ BitVec 32) Int) Unit!13827)

(assert (=> b!471526 (= lt!213809 (lemmaNoChangeToArrayThenSameMapNoExtras!195 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2038 (array!30171 array!30173 (_ BitVec 32) (_ BitVec 32) V!18723 V!18723 (_ BitVec 32) Int) ListLongMap!7695)

(assert (=> b!471526 (= lt!213808 (getCurrentListMapNoExtraKeys!2038 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471526 (= lt!213807 (getCurrentListMapNoExtraKeys!2038 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471527 () Bool)

(declare-fun res!281709 () Bool)

(assert (=> b!471527 (=> (not res!281709) (not e!276378))))

(assert (=> b!471527 (= res!281709 (and (= (size!14861 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14860 _keys!1025) (size!14861 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471528 () Bool)

(declare-fun res!281710 () Bool)

(assert (=> b!471528 (=> (not res!281710) (not e!276378))))

(declare-datatypes ((List!8866 0))(
  ( (Nil!8863) (Cons!8862 (h!9718 (_ BitVec 64)) (t!14823 List!8866)) )
))
(declare-fun arrayNoDuplicates!0 (array!30171 (_ BitVec 32) List!8866) Bool)

(assert (=> b!471528 (= res!281710 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8863))))

(assert (= (and start!42266 res!281711) b!471527))

(assert (= (and b!471527 res!281709) b!471522))

(assert (= (and b!471522 res!281708) b!471528))

(assert (= (and b!471528 res!281710) b!471526))

(assert (= (and b!471523 condMapEmpty!21526) mapIsEmpty!21526))

(assert (= (and b!471523 (not condMapEmpty!21526)) mapNonEmpty!21526))

(get-info :version)

(assert (= (and mapNonEmpty!21526 ((_ is ValueCellFull!6263) mapValue!21526)) b!471524))

(assert (= (and b!471523 ((_ is ValueCellFull!6263) mapDefault!21526)) b!471525))

(assert (= start!42266 b!471523))

(declare-fun m!453141 () Bool)

(assert (=> b!471522 m!453141))

(declare-fun m!453143 () Bool)

(assert (=> b!471526 m!453143))

(declare-fun m!453145 () Bool)

(assert (=> b!471526 m!453145))

(declare-fun m!453147 () Bool)

(assert (=> b!471526 m!453147))

(declare-fun m!453149 () Bool)

(assert (=> start!42266 m!453149))

(declare-fun m!453151 () Bool)

(assert (=> start!42266 m!453151))

(declare-fun m!453153 () Bool)

(assert (=> start!42266 m!453153))

(declare-fun m!453155 () Bool)

(assert (=> b!471528 m!453155))

(declare-fun m!453157 () Bool)

(assert (=> mapNonEmpty!21526 m!453157))

(check-sat (not b!471522) (not mapNonEmpty!21526) (not b_next!11785) (not b!471528) tp_is_empty!13213 b_and!20197 (not b!471526) (not start!42266))
(check-sat b_and!20197 (not b_next!11785))
