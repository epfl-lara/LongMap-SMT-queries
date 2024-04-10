; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94740 () Bool)

(assert start!94740)

(declare-fun b_free!21993 () Bool)

(declare-fun b_next!21993 () Bool)

(assert (=> start!94740 (= b_free!21993 (not b_next!21993))))

(declare-fun tp!77437 () Bool)

(declare-fun b_and!34823 () Bool)

(assert (=> start!94740 (= tp!77437 b_and!34823)))

(declare-fun res!714590 () Bool)

(declare-fun e!611620 () Bool)

(assert (=> start!94740 (=> (not res!714590) (not e!611620))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94740 (= res!714590 (validMask!0 mask!1515))))

(assert (=> start!94740 e!611620))

(assert (=> start!94740 true))

(declare-fun tp_is_empty!25803 () Bool)

(assert (=> start!94740 tp_is_empty!25803))

(declare-datatypes ((V!39539 0))(
  ( (V!39540 (val!12952 Int)) )
))
(declare-datatypes ((ValueCell!12198 0))(
  ( (ValueCellFull!12198 (v!15568 V!39539)) (EmptyCell!12198) )
))
(declare-datatypes ((array!68583 0))(
  ( (array!68584 (arr!32987 (Array (_ BitVec 32) ValueCell!12198)) (size!33523 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68583)

(declare-fun e!611615 () Bool)

(declare-fun array_inv!25512 (array!68583) Bool)

(assert (=> start!94740 (and (array_inv!25512 _values!955) e!611615)))

(assert (=> start!94740 tp!77437))

(declare-datatypes ((array!68585 0))(
  ( (array!68586 (arr!32988 (Array (_ BitVec 32) (_ BitVec 64))) (size!33524 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68585)

(declare-fun array_inv!25513 (array!68585) Bool)

(assert (=> start!94740 (array_inv!25513 _keys!1163)))

(declare-fun b!1071210 () Bool)

(declare-fun e!611618 () Bool)

(assert (=> b!1071210 (= e!611618 tp_is_empty!25803)))

(declare-fun mapNonEmpty!40411 () Bool)

(declare-fun mapRes!40411 () Bool)

(declare-fun tp!77438 () Bool)

(declare-fun e!611617 () Bool)

(assert (=> mapNonEmpty!40411 (= mapRes!40411 (and tp!77438 e!611617))))

(declare-fun mapKey!40411 () (_ BitVec 32))

(declare-fun mapRest!40411 () (Array (_ BitVec 32) ValueCell!12198))

(declare-fun mapValue!40411 () ValueCell!12198)

(assert (=> mapNonEmpty!40411 (= (arr!32987 _values!955) (store mapRest!40411 mapKey!40411 mapValue!40411))))

(declare-fun b!1071211 () Bool)

(declare-fun e!611616 () Bool)

(assert (=> b!1071211 (= e!611616 true)))

(declare-datatypes ((tuple2!16484 0))(
  ( (tuple2!16485 (_1!8253 (_ BitVec 64)) (_2!8253 V!39539)) )
))
(declare-datatypes ((List!23025 0))(
  ( (Nil!23022) (Cons!23021 (h!24230 tuple2!16484) (t!32358 List!23025)) )
))
(declare-datatypes ((ListLongMap!14453 0))(
  ( (ListLongMap!14454 (toList!7242 List!23025)) )
))
(declare-fun lt!473751 () ListLongMap!14453)

(declare-fun lt!473752 () ListLongMap!14453)

(declare-fun -!677 (ListLongMap!14453 (_ BitVec 64)) ListLongMap!14453)

(assert (=> b!1071211 (= lt!473751 (-!677 lt!473752 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!473756 () ListLongMap!14453)

(declare-fun lt!473750 () ListLongMap!14453)

(assert (=> b!1071211 (= lt!473756 lt!473750)))

(declare-fun zeroValueBefore!47 () V!39539)

(declare-fun lt!473748 () ListLongMap!14453)

(declare-fun minValue!907 () V!39539)

(declare-datatypes ((Unit!35280 0))(
  ( (Unit!35281) )
))
(declare-fun lt!473758 () Unit!35280)

(declare-fun addCommutativeForDiffKeys!722 (ListLongMap!14453 (_ BitVec 64) V!39539 (_ BitVec 64) V!39539) Unit!35280)

(assert (=> b!1071211 (= lt!473758 (addCommutativeForDiffKeys!722 lt!473748 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!473747 () ListLongMap!14453)

(assert (=> b!1071211 (= (-!677 lt!473750 #b0000000000000000000000000000000000000000000000000000000000000000) lt!473747)))

(declare-fun lt!473759 () tuple2!16484)

(declare-fun +!3177 (ListLongMap!14453 tuple2!16484) ListLongMap!14453)

(assert (=> b!1071211 (= lt!473750 (+!3177 lt!473747 lt!473759))))

(declare-fun lt!473753 () Unit!35280)

(declare-fun addThenRemoveForNewKeyIsSame!47 (ListLongMap!14453 (_ BitVec 64) V!39539) Unit!35280)

(assert (=> b!1071211 (= lt!473753 (addThenRemoveForNewKeyIsSame!47 lt!473747 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!473749 () tuple2!16484)

(assert (=> b!1071211 (= lt!473747 (+!3177 lt!473748 lt!473749))))

(declare-fun e!611619 () Bool)

(assert (=> b!1071211 e!611619))

(declare-fun res!714591 () Bool)

(assert (=> b!1071211 (=> (not res!714591) (not e!611619))))

(assert (=> b!1071211 (= res!714591 (= lt!473752 lt!473756))))

(assert (=> b!1071211 (= lt!473756 (+!3177 (+!3177 lt!473748 lt!473759) lt!473749))))

(assert (=> b!1071211 (= lt!473749 (tuple2!16485 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1071211 (= lt!473759 (tuple2!16485 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!473757 () ListLongMap!14453)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39539)

(declare-fun getCurrentListMap!4143 (array!68585 array!68583 (_ BitVec 32) (_ BitVec 32) V!39539 V!39539 (_ BitVec 32) Int) ListLongMap!14453)

(assert (=> b!1071211 (= lt!473757 (getCurrentListMap!4143 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071211 (= lt!473752 (getCurrentListMap!4143 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!473755 () ListLongMap!14453)

(declare-fun b!1071212 () Bool)

(assert (=> b!1071212 (= e!611619 (= lt!473757 (+!3177 lt!473755 lt!473749)))))

(declare-fun b!1071213 () Bool)

(declare-fun res!714588 () Bool)

(assert (=> b!1071213 (=> (not res!714588) (not e!611620))))

(declare-datatypes ((List!23026 0))(
  ( (Nil!23023) (Cons!23022 (h!24231 (_ BitVec 64)) (t!32359 List!23026)) )
))
(declare-fun arrayNoDuplicates!0 (array!68585 (_ BitVec 32) List!23026) Bool)

(assert (=> b!1071213 (= res!714588 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23023))))

(declare-fun b!1071214 () Bool)

(assert (=> b!1071214 (= e!611615 (and e!611618 mapRes!40411))))

(declare-fun condMapEmpty!40411 () Bool)

(declare-fun mapDefault!40411 () ValueCell!12198)

(assert (=> b!1071214 (= condMapEmpty!40411 (= (arr!32987 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12198)) mapDefault!40411)))))

(declare-fun b!1071215 () Bool)

(declare-fun res!714587 () Bool)

(assert (=> b!1071215 (=> (not res!714587) (not e!611620))))

(assert (=> b!1071215 (= res!714587 (and (= (size!33523 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33524 _keys!1163) (size!33523 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1071216 () Bool)

(assert (=> b!1071216 (= e!611620 (not e!611616))))

(declare-fun res!714589 () Bool)

(assert (=> b!1071216 (=> res!714589 e!611616)))

(assert (=> b!1071216 (= res!714589 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1071216 (= lt!473748 lt!473755)))

(declare-fun lt!473754 () Unit!35280)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!850 (array!68585 array!68583 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39539 V!39539 V!39539 V!39539 (_ BitVec 32) Int) Unit!35280)

(assert (=> b!1071216 (= lt!473754 (lemmaNoChangeToArrayThenSameMapNoExtras!850 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3813 (array!68585 array!68583 (_ BitVec 32) (_ BitVec 32) V!39539 V!39539 (_ BitVec 32) Int) ListLongMap!14453)

(assert (=> b!1071216 (= lt!473755 (getCurrentListMapNoExtraKeys!3813 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071216 (= lt!473748 (getCurrentListMapNoExtraKeys!3813 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071217 () Bool)

(assert (=> b!1071217 (= e!611617 tp_is_empty!25803)))

(declare-fun b!1071218 () Bool)

(declare-fun res!714592 () Bool)

(assert (=> b!1071218 (=> (not res!714592) (not e!611620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68585 (_ BitVec 32)) Bool)

(assert (=> b!1071218 (= res!714592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!40411 () Bool)

(assert (=> mapIsEmpty!40411 mapRes!40411))

(assert (= (and start!94740 res!714590) b!1071215))

(assert (= (and b!1071215 res!714587) b!1071218))

(assert (= (and b!1071218 res!714592) b!1071213))

(assert (= (and b!1071213 res!714588) b!1071216))

(assert (= (and b!1071216 (not res!714589)) b!1071211))

(assert (= (and b!1071211 res!714591) b!1071212))

(assert (= (and b!1071214 condMapEmpty!40411) mapIsEmpty!40411))

(assert (= (and b!1071214 (not condMapEmpty!40411)) mapNonEmpty!40411))

(get-info :version)

(assert (= (and mapNonEmpty!40411 ((_ is ValueCellFull!12198) mapValue!40411)) b!1071217))

(assert (= (and b!1071214 ((_ is ValueCellFull!12198) mapDefault!40411)) b!1071210))

(assert (= start!94740 b!1071214))

(declare-fun m!989609 () Bool)

(assert (=> b!1071211 m!989609))

(declare-fun m!989611 () Bool)

(assert (=> b!1071211 m!989611))

(declare-fun m!989613 () Bool)

(assert (=> b!1071211 m!989613))

(assert (=> b!1071211 m!989611))

(declare-fun m!989615 () Bool)

(assert (=> b!1071211 m!989615))

(declare-fun m!989617 () Bool)

(assert (=> b!1071211 m!989617))

(declare-fun m!989619 () Bool)

(assert (=> b!1071211 m!989619))

(declare-fun m!989621 () Bool)

(assert (=> b!1071211 m!989621))

(declare-fun m!989623 () Bool)

(assert (=> b!1071211 m!989623))

(declare-fun m!989625 () Bool)

(assert (=> b!1071211 m!989625))

(declare-fun m!989627 () Bool)

(assert (=> b!1071211 m!989627))

(declare-fun m!989629 () Bool)

(assert (=> b!1071212 m!989629))

(declare-fun m!989631 () Bool)

(assert (=> b!1071213 m!989631))

(declare-fun m!989633 () Bool)

(assert (=> b!1071218 m!989633))

(declare-fun m!989635 () Bool)

(assert (=> start!94740 m!989635))

(declare-fun m!989637 () Bool)

(assert (=> start!94740 m!989637))

(declare-fun m!989639 () Bool)

(assert (=> start!94740 m!989639))

(declare-fun m!989641 () Bool)

(assert (=> b!1071216 m!989641))

(declare-fun m!989643 () Bool)

(assert (=> b!1071216 m!989643))

(declare-fun m!989645 () Bool)

(assert (=> b!1071216 m!989645))

(declare-fun m!989647 () Bool)

(assert (=> mapNonEmpty!40411 m!989647))

(check-sat (not b!1071212) tp_is_empty!25803 (not b!1071216) (not start!94740) (not mapNonEmpty!40411) (not b!1071218) (not b_next!21993) (not b!1071213) (not b!1071211) b_and!34823)
(check-sat b_and!34823 (not b_next!21993))
