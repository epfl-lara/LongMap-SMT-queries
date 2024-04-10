; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94462 () Bool)

(assert start!94462)

(declare-fun b_free!21789 () Bool)

(declare-fun b_next!21789 () Bool)

(assert (=> start!94462 (= b_free!21789 (not b_next!21789))))

(declare-fun tp!76814 () Bool)

(declare-fun b_and!34581 () Bool)

(assert (=> start!94462 (= tp!76814 b_and!34581)))

(declare-fun b!1068152 () Bool)

(declare-fun e!609370 () Bool)

(declare-fun tp_is_empty!25599 () Bool)

(assert (=> b!1068152 (= e!609370 tp_is_empty!25599)))

(declare-fun b!1068153 () Bool)

(declare-fun e!609367 () Bool)

(assert (=> b!1068153 (= e!609367 true)))

(declare-datatypes ((V!39267 0))(
  ( (V!39268 (val!12850 Int)) )
))
(declare-datatypes ((tuple2!16320 0))(
  ( (tuple2!16321 (_1!8171 (_ BitVec 64)) (_2!8171 V!39267)) )
))
(declare-datatypes ((List!22872 0))(
  ( (Nil!22869) (Cons!22868 (h!24077 tuple2!16320) (t!32197 List!22872)) )
))
(declare-datatypes ((ListLongMap!14289 0))(
  ( (ListLongMap!14290 (toList!7160 List!22872)) )
))
(declare-fun lt!471828 () ListLongMap!14289)

(declare-fun -!643 (ListLongMap!14289 (_ BitVec 64)) ListLongMap!14289)

(assert (=> b!1068153 (= (-!643 lt!471828 #b0000000000000000000000000000000000000000000000000000000000000000) lt!471828)))

(declare-datatypes ((Unit!35117 0))(
  ( (Unit!35118) )
))
(declare-fun lt!471829 () Unit!35117)

(declare-fun removeNotPresentStillSame!53 (ListLongMap!14289 (_ BitVec 64)) Unit!35117)

(assert (=> b!1068153 (= lt!471829 (removeNotPresentStillSame!53 lt!471828 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1068154 () Bool)

(declare-fun e!609373 () Bool)

(assert (=> b!1068154 (= e!609373 e!609367)))

(declare-fun res!712784 () Bool)

(assert (=> b!1068154 (=> res!712784 e!609367)))

(declare-fun contains!6292 (ListLongMap!14289 (_ BitVec 64)) Bool)

(assert (=> b!1068154 (= res!712784 (contains!6292 lt!471828 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39267)

(declare-datatypes ((ValueCell!12096 0))(
  ( (ValueCellFull!12096 (v!15464 V!39267)) (EmptyCell!12096) )
))
(declare-datatypes ((array!68181 0))(
  ( (array!68182 (arr!32790 (Array (_ BitVec 32) ValueCell!12096)) (size!33326 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68181)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39267)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68183 0))(
  ( (array!68184 (arr!32791 (Array (_ BitVec 32) (_ BitVec 64))) (size!33327 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68183)

(declare-fun getCurrentListMap!4089 (array!68183 array!68181 (_ BitVec 32) (_ BitVec 32) V!39267 V!39267 (_ BitVec 32) Int) ListLongMap!14289)

(assert (=> b!1068154 (= lt!471828 (getCurrentListMap!4089 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1068155 () Bool)

(declare-fun e!609372 () Bool)

(assert (=> b!1068155 (= e!609372 (not e!609373))))

(declare-fun res!712787 () Bool)

(assert (=> b!1068155 (=> res!712787 e!609373)))

(assert (=> b!1068155 (= res!712787 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!471830 () ListLongMap!14289)

(declare-fun lt!471832 () ListLongMap!14289)

(assert (=> b!1068155 (= lt!471830 lt!471832)))

(declare-fun lt!471831 () Unit!35117)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!39267)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!777 (array!68183 array!68181 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39267 V!39267 V!39267 V!39267 (_ BitVec 32) Int) Unit!35117)

(assert (=> b!1068155 (= lt!471831 (lemmaNoChangeToArrayThenSameMapNoExtras!777 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3740 (array!68183 array!68181 (_ BitVec 32) (_ BitVec 32) V!39267 V!39267 (_ BitVec 32) Int) ListLongMap!14289)

(assert (=> b!1068155 (= lt!471832 (getCurrentListMapNoExtraKeys!3740 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1068155 (= lt!471830 (getCurrentListMapNoExtraKeys!3740 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!712783 () Bool)

(assert (=> start!94462 (=> (not res!712783) (not e!609372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94462 (= res!712783 (validMask!0 mask!1515))))

(assert (=> start!94462 e!609372))

(assert (=> start!94462 true))

(assert (=> start!94462 tp_is_empty!25599))

(declare-fun e!609369 () Bool)

(declare-fun array_inv!25386 (array!68181) Bool)

(assert (=> start!94462 (and (array_inv!25386 _values!955) e!609369)))

(assert (=> start!94462 tp!76814))

(declare-fun array_inv!25387 (array!68183) Bool)

(assert (=> start!94462 (array_inv!25387 _keys!1163)))

(declare-fun mapNonEmpty!40093 () Bool)

(declare-fun mapRes!40093 () Bool)

(declare-fun tp!76813 () Bool)

(assert (=> mapNonEmpty!40093 (= mapRes!40093 (and tp!76813 e!609370))))

(declare-fun mapKey!40093 () (_ BitVec 32))

(declare-fun mapRest!40093 () (Array (_ BitVec 32) ValueCell!12096))

(declare-fun mapValue!40093 () ValueCell!12096)

(assert (=> mapNonEmpty!40093 (= (arr!32790 _values!955) (store mapRest!40093 mapKey!40093 mapValue!40093))))

(declare-fun b!1068156 () Bool)

(declare-fun res!712785 () Bool)

(assert (=> b!1068156 (=> (not res!712785) (not e!609372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68183 (_ BitVec 32)) Bool)

(assert (=> b!1068156 (= res!712785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1068157 () Bool)

(declare-fun e!609371 () Bool)

(assert (=> b!1068157 (= e!609371 tp_is_empty!25599)))

(declare-fun b!1068158 () Bool)

(declare-fun res!712786 () Bool)

(assert (=> b!1068158 (=> (not res!712786) (not e!609372))))

(declare-datatypes ((List!22873 0))(
  ( (Nil!22870) (Cons!22869 (h!24078 (_ BitVec 64)) (t!32198 List!22873)) )
))
(declare-fun arrayNoDuplicates!0 (array!68183 (_ BitVec 32) List!22873) Bool)

(assert (=> b!1068158 (= res!712786 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22870))))

(declare-fun b!1068159 () Bool)

(assert (=> b!1068159 (= e!609369 (and e!609371 mapRes!40093))))

(declare-fun condMapEmpty!40093 () Bool)

(declare-fun mapDefault!40093 () ValueCell!12096)

(assert (=> b!1068159 (= condMapEmpty!40093 (= (arr!32790 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12096)) mapDefault!40093)))))

(declare-fun mapIsEmpty!40093 () Bool)

(assert (=> mapIsEmpty!40093 mapRes!40093))

(declare-fun b!1068160 () Bool)

(declare-fun res!712788 () Bool)

(assert (=> b!1068160 (=> (not res!712788) (not e!609372))))

(assert (=> b!1068160 (= res!712788 (and (= (size!33326 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33327 _keys!1163) (size!33326 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94462 res!712783) b!1068160))

(assert (= (and b!1068160 res!712788) b!1068156))

(assert (= (and b!1068156 res!712785) b!1068158))

(assert (= (and b!1068158 res!712786) b!1068155))

(assert (= (and b!1068155 (not res!712787)) b!1068154))

(assert (= (and b!1068154 (not res!712784)) b!1068153))

(assert (= (and b!1068159 condMapEmpty!40093) mapIsEmpty!40093))

(assert (= (and b!1068159 (not condMapEmpty!40093)) mapNonEmpty!40093))

(get-info :version)

(assert (= (and mapNonEmpty!40093 ((_ is ValueCellFull!12096) mapValue!40093)) b!1068152))

(assert (= (and b!1068159 ((_ is ValueCellFull!12096) mapDefault!40093)) b!1068157))

(assert (= start!94462 b!1068159))

(declare-fun m!986759 () Bool)

(assert (=> b!1068155 m!986759))

(declare-fun m!986761 () Bool)

(assert (=> b!1068155 m!986761))

(declare-fun m!986763 () Bool)

(assert (=> b!1068155 m!986763))

(declare-fun m!986765 () Bool)

(assert (=> b!1068154 m!986765))

(declare-fun m!986767 () Bool)

(assert (=> b!1068154 m!986767))

(declare-fun m!986769 () Bool)

(assert (=> b!1068156 m!986769))

(declare-fun m!986771 () Bool)

(assert (=> mapNonEmpty!40093 m!986771))

(declare-fun m!986773 () Bool)

(assert (=> b!1068158 m!986773))

(declare-fun m!986775 () Bool)

(assert (=> start!94462 m!986775))

(declare-fun m!986777 () Bool)

(assert (=> start!94462 m!986777))

(declare-fun m!986779 () Bool)

(assert (=> start!94462 m!986779))

(declare-fun m!986781 () Bool)

(assert (=> b!1068153 m!986781))

(declare-fun m!986783 () Bool)

(assert (=> b!1068153 m!986783))

(check-sat (not start!94462) (not b!1068153) b_and!34581 (not b_next!21789) (not b!1068155) (not mapNonEmpty!40093) tp_is_empty!25599 (not b!1068158) (not b!1068156) (not b!1068154))
(check-sat b_and!34581 (not b_next!21789))
