; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94376 () Bool)

(assert start!94376)

(declare-fun b_free!21541 () Bool)

(declare-fun b_next!21541 () Bool)

(assert (=> start!94376 (= b_free!21541 (not b_next!21541))))

(declare-fun tp!76058 () Bool)

(declare-fun b_and!34301 () Bool)

(assert (=> start!94376 (= tp!76058 b_and!34301)))

(declare-fun mapNonEmpty!39709 () Bool)

(declare-fun mapRes!39709 () Bool)

(declare-fun tp!76057 () Bool)

(declare-fun e!607618 () Bool)

(assert (=> mapNonEmpty!39709 (= mapRes!39709 (and tp!76057 e!607618))))

(declare-fun mapKey!39709 () (_ BitVec 32))

(declare-datatypes ((V!38937 0))(
  ( (V!38938 (val!12726 Int)) )
))
(declare-datatypes ((ValueCell!11972 0))(
  ( (ValueCellFull!11972 (v!15334 V!38937)) (EmptyCell!11972) )
))
(declare-datatypes ((array!67747 0))(
  ( (array!67748 (arr!32571 (Array (_ BitVec 32) ValueCell!11972)) (size!33108 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67747)

(declare-fun mapValue!39709 () ValueCell!11972)

(declare-fun mapRest!39709 () (Array (_ BitVec 32) ValueCell!11972))

(assert (=> mapNonEmpty!39709 (= (arr!32571 _values!955) (store mapRest!39709 mapKey!39709 mapValue!39709))))

(declare-fun b!1065915 () Bool)

(declare-fun res!711205 () Bool)

(declare-fun e!607620 () Bool)

(assert (=> b!1065915 (=> (not res!711205) (not e!607620))))

(declare-datatypes ((array!67749 0))(
  ( (array!67750 (arr!32572 (Array (_ BitVec 32) (_ BitVec 64))) (size!33109 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67749)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67749 (_ BitVec 32)) Bool)

(assert (=> b!1065915 (= res!711205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1065916 () Bool)

(declare-fun e!607616 () Bool)

(assert (=> b!1065916 (= e!607616 true)))

(declare-datatypes ((tuple2!16108 0))(
  ( (tuple2!16109 (_1!8065 (_ BitVec 64)) (_2!8065 V!38937)) )
))
(declare-datatypes ((List!22682 0))(
  ( (Nil!22679) (Cons!22678 (h!23896 tuple2!16108) (t!31991 List!22682)) )
))
(declare-datatypes ((ListLongMap!14085 0))(
  ( (ListLongMap!14086 (toList!7058 List!22682)) )
))
(declare-fun lt!469789 () ListLongMap!14085)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38937)

(declare-fun zeroValueBefore!47 () V!38937)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4012 (array!67749 array!67747 (_ BitVec 32) (_ BitVec 32) V!38937 V!38937 (_ BitVec 32) Int) ListLongMap!14085)

(assert (=> b!1065916 (= lt!469789 (getCurrentListMap!4012 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!711206 () Bool)

(assert (=> start!94376 (=> (not res!711206) (not e!607620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94376 (= res!711206 (validMask!0 mask!1515))))

(assert (=> start!94376 e!607620))

(assert (=> start!94376 true))

(declare-fun tp_is_empty!25351 () Bool)

(assert (=> start!94376 tp_is_empty!25351))

(declare-fun e!607619 () Bool)

(declare-fun array_inv!25248 (array!67747) Bool)

(assert (=> start!94376 (and (array_inv!25248 _values!955) e!607619)))

(assert (=> start!94376 tp!76058))

(declare-fun array_inv!25249 (array!67749) Bool)

(assert (=> start!94376 (array_inv!25249 _keys!1163)))

(declare-fun b!1065917 () Bool)

(declare-fun res!711209 () Bool)

(assert (=> b!1065917 (=> (not res!711209) (not e!607620))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1065917 (= res!711209 (and (= (size!33108 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33109 _keys!1163) (size!33108 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065918 () Bool)

(declare-fun e!607617 () Bool)

(assert (=> b!1065918 (= e!607619 (and e!607617 mapRes!39709))))

(declare-fun condMapEmpty!39709 () Bool)

(declare-fun mapDefault!39709 () ValueCell!11972)

(assert (=> b!1065918 (= condMapEmpty!39709 (= (arr!32571 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11972)) mapDefault!39709)))))

(declare-fun b!1065919 () Bool)

(declare-fun res!711208 () Bool)

(assert (=> b!1065919 (=> (not res!711208) (not e!607620))))

(declare-datatypes ((List!22683 0))(
  ( (Nil!22680) (Cons!22679 (h!23897 (_ BitVec 64)) (t!31992 List!22683)) )
))
(declare-fun arrayNoDuplicates!0 (array!67749 (_ BitVec 32) List!22683) Bool)

(assert (=> b!1065919 (= res!711208 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22680))))

(declare-fun b!1065920 () Bool)

(assert (=> b!1065920 (= e!607620 (not e!607616))))

(declare-fun res!711207 () Bool)

(assert (=> b!1065920 (=> res!711207 e!607616)))

(assert (=> b!1065920 (= res!711207 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!469792 () ListLongMap!14085)

(declare-fun lt!469790 () ListLongMap!14085)

(assert (=> b!1065920 (= lt!469792 lt!469790)))

(declare-datatypes ((Unit!34915 0))(
  ( (Unit!34916) )
))
(declare-fun lt!469791 () Unit!34915)

(declare-fun zeroValueAfter!47 () V!38937)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!693 (array!67749 array!67747 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38937 V!38937 V!38937 V!38937 (_ BitVec 32) Int) Unit!34915)

(assert (=> b!1065920 (= lt!469791 (lemmaNoChangeToArrayThenSameMapNoExtras!693 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3690 (array!67749 array!67747 (_ BitVec 32) (_ BitVec 32) V!38937 V!38937 (_ BitVec 32) Int) ListLongMap!14085)

(assert (=> b!1065920 (= lt!469790 (getCurrentListMapNoExtraKeys!3690 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065920 (= lt!469792 (getCurrentListMapNoExtraKeys!3690 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065921 () Bool)

(assert (=> b!1065921 (= e!607617 tp_is_empty!25351)))

(declare-fun b!1065922 () Bool)

(assert (=> b!1065922 (= e!607618 tp_is_empty!25351)))

(declare-fun mapIsEmpty!39709 () Bool)

(assert (=> mapIsEmpty!39709 mapRes!39709))

(assert (= (and start!94376 res!711206) b!1065917))

(assert (= (and b!1065917 res!711209) b!1065915))

(assert (= (and b!1065915 res!711205) b!1065919))

(assert (= (and b!1065919 res!711208) b!1065920))

(assert (= (and b!1065920 (not res!711207)) b!1065916))

(assert (= (and b!1065918 condMapEmpty!39709) mapIsEmpty!39709))

(assert (= (and b!1065918 (not condMapEmpty!39709)) mapNonEmpty!39709))

(get-info :version)

(assert (= (and mapNonEmpty!39709 ((_ is ValueCellFull!11972) mapValue!39709)) b!1065922))

(assert (= (and b!1065918 ((_ is ValueCellFull!11972) mapDefault!39709)) b!1065921))

(assert (= start!94376 b!1065918))

(declare-fun m!984781 () Bool)

(assert (=> start!94376 m!984781))

(declare-fun m!984783 () Bool)

(assert (=> start!94376 m!984783))

(declare-fun m!984785 () Bool)

(assert (=> start!94376 m!984785))

(declare-fun m!984787 () Bool)

(assert (=> b!1065916 m!984787))

(declare-fun m!984789 () Bool)

(assert (=> mapNonEmpty!39709 m!984789))

(declare-fun m!984791 () Bool)

(assert (=> b!1065920 m!984791))

(declare-fun m!984793 () Bool)

(assert (=> b!1065920 m!984793))

(declare-fun m!984795 () Bool)

(assert (=> b!1065920 m!984795))

(declare-fun m!984797 () Bool)

(assert (=> b!1065915 m!984797))

(declare-fun m!984799 () Bool)

(assert (=> b!1065919 m!984799))

(check-sat (not b!1065919) (not b_next!21541) (not start!94376) (not b!1065916) (not b!1065920) (not mapNonEmpty!39709) b_and!34301 (not b!1065915) tp_is_empty!25351)
(check-sat b_and!34301 (not b_next!21541))
