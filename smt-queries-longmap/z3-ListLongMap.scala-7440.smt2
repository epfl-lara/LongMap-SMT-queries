; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94506 () Bool)

(assert start!94506)

(declare-fun b_free!21817 () Bool)

(declare-fun b_next!21817 () Bool)

(assert (=> start!94506 (= b_free!21817 (not b_next!21817))))

(declare-fun tp!76900 () Bool)

(declare-fun b_and!34593 () Bool)

(assert (=> start!94506 (= tp!76900 b_and!34593)))

(declare-fun res!713031 () Bool)

(declare-fun e!609674 () Bool)

(assert (=> start!94506 (=> (not res!713031) (not e!609674))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94506 (= res!713031 (validMask!0 mask!1515))))

(assert (=> start!94506 e!609674))

(assert (=> start!94506 true))

(declare-fun tp_is_empty!25627 () Bool)

(assert (=> start!94506 tp_is_empty!25627))

(declare-datatypes ((V!39305 0))(
  ( (V!39306 (val!12864 Int)) )
))
(declare-datatypes ((ValueCell!12110 0))(
  ( (ValueCellFull!12110 (v!15478 V!39305)) (EmptyCell!12110) )
))
(declare-datatypes ((array!68178 0))(
  ( (array!68179 (arr!32788 (Array (_ BitVec 32) ValueCell!12110)) (size!33326 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68178)

(declare-fun e!609672 () Bool)

(declare-fun array_inv!25378 (array!68178) Bool)

(assert (=> start!94506 (and (array_inv!25378 _values!955) e!609672)))

(assert (=> start!94506 tp!76900))

(declare-datatypes ((array!68180 0))(
  ( (array!68181 (arr!32789 (Array (_ BitVec 32) (_ BitVec 64))) (size!33327 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68180)

(declare-fun array_inv!25379 (array!68180) Bool)

(assert (=> start!94506 (array_inv!25379 _keys!1163)))

(declare-fun b!1068534 () Bool)

(declare-fun e!609668 () Bool)

(declare-fun mapRes!40138 () Bool)

(assert (=> b!1068534 (= e!609672 (and e!609668 mapRes!40138))))

(declare-fun condMapEmpty!40138 () Bool)

(declare-fun mapDefault!40138 () ValueCell!12110)

(assert (=> b!1068534 (= condMapEmpty!40138 (= (arr!32788 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12110)) mapDefault!40138)))))

(declare-fun b!1068535 () Bool)

(assert (=> b!1068535 (= e!609668 tp_is_empty!25627)))

(declare-fun b!1068536 () Bool)

(declare-fun res!713028 () Bool)

(assert (=> b!1068536 (=> (not res!713028) (not e!609674))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1068536 (= res!713028 (and (= (size!33326 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33327 _keys!1163) (size!33326 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1068537 () Bool)

(declare-fun e!609673 () Bool)

(declare-fun e!609670 () Bool)

(assert (=> b!1068537 (= e!609673 e!609670)))

(declare-fun res!713027 () Bool)

(assert (=> b!1068537 (=> res!713027 e!609670)))

(declare-datatypes ((tuple2!16394 0))(
  ( (tuple2!16395 (_1!8208 (_ BitVec 64)) (_2!8208 V!39305)) )
))
(declare-datatypes ((List!22932 0))(
  ( (Nil!22929) (Cons!22928 (h!24137 tuple2!16394) (t!32250 List!22932)) )
))
(declare-datatypes ((ListLongMap!14363 0))(
  ( (ListLongMap!14364 (toList!7197 List!22932)) )
))
(declare-fun lt!471962 () ListLongMap!14363)

(declare-fun contains!6270 (ListLongMap!14363 (_ BitVec 64)) Bool)

(assert (=> b!1068537 (= res!713027 (contains!6270 lt!471962 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!39305)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39305)

(declare-fun getCurrentListMap!4038 (array!68180 array!68178 (_ BitVec 32) (_ BitVec 32) V!39305 V!39305 (_ BitVec 32) Int) ListLongMap!14363)

(assert (=> b!1068537 (= lt!471962 (getCurrentListMap!4038 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40138 () Bool)

(declare-fun tp!76901 () Bool)

(declare-fun e!609671 () Bool)

(assert (=> mapNonEmpty!40138 (= mapRes!40138 (and tp!76901 e!609671))))

(declare-fun mapValue!40138 () ValueCell!12110)

(declare-fun mapKey!40138 () (_ BitVec 32))

(declare-fun mapRest!40138 () (Array (_ BitVec 32) ValueCell!12110))

(assert (=> mapNonEmpty!40138 (= (arr!32788 _values!955) (store mapRest!40138 mapKey!40138 mapValue!40138))))

(declare-fun b!1068538 () Bool)

(assert (=> b!1068538 (= e!609671 tp_is_empty!25627)))

(declare-fun b!1068539 () Bool)

(declare-fun res!713029 () Bool)

(assert (=> b!1068539 (=> (not res!713029) (not e!609674))))

(declare-datatypes ((List!22933 0))(
  ( (Nil!22930) (Cons!22929 (h!24138 (_ BitVec 64)) (t!32251 List!22933)) )
))
(declare-fun arrayNoDuplicates!0 (array!68180 (_ BitVec 32) List!22933) Bool)

(assert (=> b!1068539 (= res!713029 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22930))))

(declare-fun b!1068540 () Bool)

(assert (=> b!1068540 (= e!609670 true)))

(declare-fun -!641 (ListLongMap!14363 (_ BitVec 64)) ListLongMap!14363)

(assert (=> b!1068540 (= (-!641 lt!471962 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471962)))

(declare-datatypes ((Unit!34984 0))(
  ( (Unit!34985) )
))
(declare-fun lt!471965 () Unit!34984)

(declare-fun removeNotPresentStillSame!58 (ListLongMap!14363 (_ BitVec 64)) Unit!34984)

(assert (=> b!1068540 (= lt!471965 (removeNotPresentStillSame!58 lt!471962 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1068541 () Bool)

(assert (=> b!1068541 (= e!609674 (not e!609673))))

(declare-fun res!713030 () Bool)

(assert (=> b!1068541 (=> res!713030 e!609673)))

(assert (=> b!1068541 (= res!713030 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!471963 () ListLongMap!14363)

(declare-fun lt!471964 () ListLongMap!14363)

(assert (=> b!1068541 (= lt!471963 lt!471964)))

(declare-fun lt!471966 () Unit!34984)

(declare-fun zeroValueAfter!47 () V!39305)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!783 (array!68180 array!68178 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39305 V!39305 V!39305 V!39305 (_ BitVec 32) Int) Unit!34984)

(assert (=> b!1068541 (= lt!471966 (lemmaNoChangeToArrayThenSameMapNoExtras!783 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3789 (array!68180 array!68178 (_ BitVec 32) (_ BitVec 32) V!39305 V!39305 (_ BitVec 32) Int) ListLongMap!14363)

(assert (=> b!1068541 (= lt!471964 (getCurrentListMapNoExtraKeys!3789 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068541 (= lt!471963 (getCurrentListMapNoExtraKeys!3789 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40138 () Bool)

(assert (=> mapIsEmpty!40138 mapRes!40138))

(declare-fun b!1068542 () Bool)

(declare-fun res!713032 () Bool)

(assert (=> b!1068542 (=> (not res!713032) (not e!609674))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68180 (_ BitVec 32)) Bool)

(assert (=> b!1068542 (= res!713032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!94506 res!713031) b!1068536))

(assert (= (and b!1068536 res!713028) b!1068542))

(assert (= (and b!1068542 res!713032) b!1068539))

(assert (= (and b!1068539 res!713029) b!1068541))

(assert (= (and b!1068541 (not res!713030)) b!1068537))

(assert (= (and b!1068537 (not res!713027)) b!1068540))

(assert (= (and b!1068534 condMapEmpty!40138) mapIsEmpty!40138))

(assert (= (and b!1068534 (not condMapEmpty!40138)) mapNonEmpty!40138))

(get-info :version)

(assert (= (and mapNonEmpty!40138 ((_ is ValueCellFull!12110) mapValue!40138)) b!1068538))

(assert (= (and b!1068534 ((_ is ValueCellFull!12110) mapDefault!40138)) b!1068535))

(assert (= start!94506 b!1068534))

(declare-fun m!986623 () Bool)

(assert (=> b!1068541 m!986623))

(declare-fun m!986625 () Bool)

(assert (=> b!1068541 m!986625))

(declare-fun m!986627 () Bool)

(assert (=> b!1068541 m!986627))

(declare-fun m!986629 () Bool)

(assert (=> b!1068542 m!986629))

(declare-fun m!986631 () Bool)

(assert (=> b!1068537 m!986631))

(declare-fun m!986633 () Bool)

(assert (=> b!1068537 m!986633))

(declare-fun m!986635 () Bool)

(assert (=> start!94506 m!986635))

(declare-fun m!986637 () Bool)

(assert (=> start!94506 m!986637))

(declare-fun m!986639 () Bool)

(assert (=> start!94506 m!986639))

(declare-fun m!986641 () Bool)

(assert (=> b!1068539 m!986641))

(declare-fun m!986643 () Bool)

(assert (=> mapNonEmpty!40138 m!986643))

(declare-fun m!986645 () Bool)

(assert (=> b!1068540 m!986645))

(declare-fun m!986647 () Bool)

(assert (=> b!1068540 m!986647))

(check-sat (not b!1068537) (not mapNonEmpty!40138) (not b!1068541) (not b_next!21817) (not b!1068540) (not start!94506) (not b!1068539) b_and!34593 (not b!1068542) tp_is_empty!25627)
(check-sat b_and!34593 (not b_next!21817))
