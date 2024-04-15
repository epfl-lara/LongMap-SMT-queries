; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41994 () Bool)

(assert start!41994)

(declare-fun b_free!11581 () Bool)

(declare-fun b_next!11581 () Bool)

(assert (=> start!41994 (= b_free!11581 (not b_next!11581))))

(declare-fun tp!40759 () Bool)

(declare-fun b_and!19953 () Bool)

(assert (=> start!41994 (= tp!40759 b_and!19953)))

(declare-fun b!468755 () Bool)

(declare-fun res!280171 () Bool)

(declare-fun e!274419 () Bool)

(assert (=> b!468755 (=> (not res!280171) (not e!274419))))

(declare-datatypes ((array!29773 0))(
  ( (array!29774 (arr!14312 (Array (_ BitVec 32) (_ BitVec 64))) (size!14665 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29773)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29773 (_ BitVec 32)) Bool)

(assert (=> b!468755 (= res!280171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!468756 () Bool)

(declare-fun e!274416 () Bool)

(declare-fun tp_is_empty!13009 () Bool)

(assert (=> b!468756 (= e!274416 tp_is_empty!13009)))

(declare-fun b!468757 () Bool)

(declare-fun e!274418 () Bool)

(declare-fun e!274417 () Bool)

(declare-fun mapRes!21208 () Bool)

(assert (=> b!468757 (= e!274418 (and e!274417 mapRes!21208))))

(declare-fun condMapEmpty!21208 () Bool)

(declare-datatypes ((V!18451 0))(
  ( (V!18452 (val!6549 Int)) )
))
(declare-datatypes ((ValueCell!6161 0))(
  ( (ValueCellFull!6161 (v!8832 V!18451)) (EmptyCell!6161) )
))
(declare-datatypes ((array!29775 0))(
  ( (array!29776 (arr!14313 (Array (_ BitVec 32) ValueCell!6161)) (size!14666 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29775)

(declare-fun mapDefault!21208 () ValueCell!6161)

(assert (=> b!468757 (= condMapEmpty!21208 (= (arr!14313 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6161)) mapDefault!21208)))))

(declare-fun b!468758 () Bool)

(declare-fun e!274421 () Bool)

(assert (=> b!468758 (= e!274419 (not e!274421))))

(declare-fun res!280175 () Bool)

(assert (=> b!468758 (=> res!280175 e!274421)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!468758 (= res!280175 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8650 0))(
  ( (tuple2!8651 (_1!4336 (_ BitVec 64)) (_2!4336 V!18451)) )
))
(declare-datatypes ((List!8722 0))(
  ( (Nil!8719) (Cons!8718 (h!9574 tuple2!8650) (t!14671 List!8722)) )
))
(declare-datatypes ((ListLongMap!7553 0))(
  ( (ListLongMap!7554 (toList!3792 List!8722)) )
))
(declare-fun lt!212124 () ListLongMap!7553)

(declare-fun lt!212119 () ListLongMap!7553)

(assert (=> b!468758 (= lt!212124 lt!212119)))

(declare-fun minValueBefore!38 () V!18451)

(declare-fun zeroValue!794 () V!18451)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((Unit!13681 0))(
  ( (Unit!13682) )
))
(declare-fun lt!212123 () Unit!13681)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18451)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!128 (array!29773 array!29775 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18451 V!18451 V!18451 V!18451 (_ BitVec 32) Int) Unit!13681)

(assert (=> b!468758 (= lt!212123 (lemmaNoChangeToArrayThenSameMapNoExtras!128 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1971 (array!29773 array!29775 (_ BitVec 32) (_ BitVec 32) V!18451 V!18451 (_ BitVec 32) Int) ListLongMap!7553)

(assert (=> b!468758 (= lt!212119 (getCurrentListMapNoExtraKeys!1971 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468758 (= lt!212124 (getCurrentListMapNoExtraKeys!1971 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468759 () Bool)

(assert (=> b!468759 (= e!274421 true)))

(declare-fun lt!212125 () tuple2!8650)

(declare-fun +!1722 (ListLongMap!7553 tuple2!8650) ListLongMap!7553)

(assert (=> b!468759 (= (+!1722 lt!212124 lt!212125) (+!1722 (+!1722 lt!212124 (tuple2!8651 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212125))))

(assert (=> b!468759 (= lt!212125 (tuple2!8651 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!212122 () Unit!13681)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!105 (ListLongMap!7553 (_ BitVec 64) V!18451 V!18451) Unit!13681)

(assert (=> b!468759 (= lt!212122 (addSameAsAddTwiceSameKeyDiffValues!105 lt!212124 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!212120 () ListLongMap!7553)

(declare-fun getCurrentListMap!2158 (array!29773 array!29775 (_ BitVec 32) (_ BitVec 32) V!18451 V!18451 (_ BitVec 32) Int) ListLongMap!7553)

(assert (=> b!468759 (= lt!212120 (getCurrentListMap!2158 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212121 () ListLongMap!7553)

(assert (=> b!468759 (= lt!212121 (getCurrentListMap!2158 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21208 () Bool)

(declare-fun tp!40758 () Bool)

(assert (=> mapNonEmpty!21208 (= mapRes!21208 (and tp!40758 e!274416))))

(declare-fun mapValue!21208 () ValueCell!6161)

(declare-fun mapKey!21208 () (_ BitVec 32))

(declare-fun mapRest!21208 () (Array (_ BitVec 32) ValueCell!6161))

(assert (=> mapNonEmpty!21208 (= (arr!14313 _values!833) (store mapRest!21208 mapKey!21208 mapValue!21208))))

(declare-fun mapIsEmpty!21208 () Bool)

(assert (=> mapIsEmpty!21208 mapRes!21208))

(declare-fun b!468761 () Bool)

(assert (=> b!468761 (= e!274417 tp_is_empty!13009)))

(declare-fun b!468762 () Bool)

(declare-fun res!280173 () Bool)

(assert (=> b!468762 (=> (not res!280173) (not e!274419))))

(assert (=> b!468762 (= res!280173 (and (= (size!14666 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14665 _keys!1025) (size!14666 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!468760 () Bool)

(declare-fun res!280172 () Bool)

(assert (=> b!468760 (=> (not res!280172) (not e!274419))))

(declare-datatypes ((List!8723 0))(
  ( (Nil!8720) (Cons!8719 (h!9575 (_ BitVec 64)) (t!14672 List!8723)) )
))
(declare-fun arrayNoDuplicates!0 (array!29773 (_ BitVec 32) List!8723) Bool)

(assert (=> b!468760 (= res!280172 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8720))))

(declare-fun res!280174 () Bool)

(assert (=> start!41994 (=> (not res!280174) (not e!274419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41994 (= res!280174 (validMask!0 mask!1365))))

(assert (=> start!41994 e!274419))

(assert (=> start!41994 tp_is_empty!13009))

(assert (=> start!41994 tp!40759))

(assert (=> start!41994 true))

(declare-fun array_inv!10412 (array!29773) Bool)

(assert (=> start!41994 (array_inv!10412 _keys!1025)))

(declare-fun array_inv!10413 (array!29775) Bool)

(assert (=> start!41994 (and (array_inv!10413 _values!833) e!274418)))

(assert (= (and start!41994 res!280174) b!468762))

(assert (= (and b!468762 res!280173) b!468755))

(assert (= (and b!468755 res!280171) b!468760))

(assert (= (and b!468760 res!280172) b!468758))

(assert (= (and b!468758 (not res!280175)) b!468759))

(assert (= (and b!468757 condMapEmpty!21208) mapIsEmpty!21208))

(assert (= (and b!468757 (not condMapEmpty!21208)) mapNonEmpty!21208))

(get-info :version)

(assert (= (and mapNonEmpty!21208 ((_ is ValueCellFull!6161) mapValue!21208)) b!468756))

(assert (= (and b!468757 ((_ is ValueCellFull!6161) mapDefault!21208)) b!468761))

(assert (= start!41994 b!468757))

(declare-fun m!450377 () Bool)

(assert (=> b!468755 m!450377))

(declare-fun m!450379 () Bool)

(assert (=> b!468758 m!450379))

(declare-fun m!450381 () Bool)

(assert (=> b!468758 m!450381))

(declare-fun m!450383 () Bool)

(assert (=> b!468758 m!450383))

(declare-fun m!450385 () Bool)

(assert (=> mapNonEmpty!21208 m!450385))

(declare-fun m!450387 () Bool)

(assert (=> b!468759 m!450387))

(declare-fun m!450389 () Bool)

(assert (=> b!468759 m!450389))

(declare-fun m!450391 () Bool)

(assert (=> b!468759 m!450391))

(assert (=> b!468759 m!450387))

(declare-fun m!450393 () Bool)

(assert (=> b!468759 m!450393))

(declare-fun m!450395 () Bool)

(assert (=> b!468759 m!450395))

(declare-fun m!450397 () Bool)

(assert (=> b!468759 m!450397))

(declare-fun m!450399 () Bool)

(assert (=> start!41994 m!450399))

(declare-fun m!450401 () Bool)

(assert (=> start!41994 m!450401))

(declare-fun m!450403 () Bool)

(assert (=> start!41994 m!450403))

(declare-fun m!450405 () Bool)

(assert (=> b!468760 m!450405))

(check-sat (not b_next!11581) b_and!19953 (not b!468759) (not start!41994) (not mapNonEmpty!21208) tp_is_empty!13009 (not b!468760) (not b!468758) (not b!468755))
(check-sat b_and!19953 (not b_next!11581))
