; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94304 () Bool)

(assert start!94304)

(declare-fun b_free!21673 () Bool)

(declare-fun b_next!21673 () Bool)

(assert (=> start!94304 (= b_free!21673 (not b_next!21673))))

(declare-fun tp!76459 () Bool)

(declare-fun b_and!34419 () Bool)

(assert (=> start!94304 (= tp!76459 b_and!34419)))

(declare-fun b!1066360 () Bool)

(declare-fun res!711755 () Bool)

(declare-fun e!608083 () Bool)

(assert (=> b!1066360 (=> (not res!711755) (not e!608083))))

(declare-datatypes ((array!67892 0))(
  ( (array!67893 (arr!32648 (Array (_ BitVec 32) (_ BitVec 64))) (size!33186 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67892)

(declare-datatypes ((List!22826 0))(
  ( (Nil!22823) (Cons!22822 (h!24031 (_ BitVec 64)) (t!32138 List!22826)) )
))
(declare-fun arrayNoDuplicates!0 (array!67892 (_ BitVec 32) List!22826) Bool)

(assert (=> b!1066360 (= res!711755 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22823))))

(declare-fun b!1066361 () Bool)

(declare-fun e!608079 () Bool)

(declare-fun tp_is_empty!25483 () Bool)

(assert (=> b!1066361 (= e!608079 tp_is_empty!25483)))

(declare-fun res!711754 () Bool)

(assert (=> start!94304 (=> (not res!711754) (not e!608083))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94304 (= res!711754 (validMask!0 mask!1515))))

(assert (=> start!94304 e!608083))

(assert (=> start!94304 true))

(assert (=> start!94304 tp_is_empty!25483))

(declare-datatypes ((V!39113 0))(
  ( (V!39114 (val!12792 Int)) )
))
(declare-datatypes ((ValueCell!12038 0))(
  ( (ValueCellFull!12038 (v!15404 V!39113)) (EmptyCell!12038) )
))
(declare-datatypes ((array!67894 0))(
  ( (array!67895 (arr!32649 (Array (_ BitVec 32) ValueCell!12038)) (size!33187 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67894)

(declare-fun e!608081 () Bool)

(declare-fun array_inv!25274 (array!67894) Bool)

(assert (=> start!94304 (and (array_inv!25274 _values!955) e!608081)))

(assert (=> start!94304 tp!76459))

(declare-fun array_inv!25275 (array!67892) Bool)

(assert (=> start!94304 (array_inv!25275 _keys!1163)))

(declare-fun mapNonEmpty!39913 () Bool)

(declare-fun mapRes!39913 () Bool)

(declare-fun tp!76460 () Bool)

(assert (=> mapNonEmpty!39913 (= mapRes!39913 (and tp!76460 e!608079))))

(declare-fun mapRest!39913 () (Array (_ BitVec 32) ValueCell!12038))

(declare-fun mapValue!39913 () ValueCell!12038)

(declare-fun mapKey!39913 () (_ BitVec 32))

(assert (=> mapNonEmpty!39913 (= (arr!32649 _values!955) (store mapRest!39913 mapKey!39913 mapValue!39913))))

(declare-fun mapIsEmpty!39913 () Bool)

(assert (=> mapIsEmpty!39913 mapRes!39913))

(declare-fun b!1066362 () Bool)

(declare-fun res!711753 () Bool)

(assert (=> b!1066362 (=> (not res!711753) (not e!608083))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67892 (_ BitVec 32)) Bool)

(assert (=> b!1066362 (= res!711753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1066363 () Bool)

(declare-fun res!711756 () Bool)

(assert (=> b!1066363 (=> (not res!711756) (not e!608083))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1066363 (= res!711756 (and (= (size!33187 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33186 _keys!1163) (size!33187 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1066364 () Bool)

(declare-fun e!608078 () Bool)

(assert (=> b!1066364 (= e!608078 tp_is_empty!25483)))

(declare-fun b!1066365 () Bool)

(declare-fun e!608082 () Bool)

(assert (=> b!1066365 (= e!608083 (not e!608082))))

(declare-fun res!711757 () Bool)

(assert (=> b!1066365 (=> res!711757 e!608082)))

(assert (=> b!1066365 (= res!711757 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16282 0))(
  ( (tuple2!16283 (_1!8152 (_ BitVec 64)) (_2!8152 V!39113)) )
))
(declare-datatypes ((List!22827 0))(
  ( (Nil!22824) (Cons!22823 (h!24032 tuple2!16282) (t!32139 List!22827)) )
))
(declare-datatypes ((ListLongMap!14251 0))(
  ( (ListLongMap!14252 (toList!7141 List!22827)) )
))
(declare-fun lt!470682 () ListLongMap!14251)

(declare-fun lt!470683 () ListLongMap!14251)

(assert (=> b!1066365 (= lt!470682 lt!470683)))

(declare-fun zeroValueBefore!47 () V!39113)

(declare-datatypes ((Unit!34870 0))(
  ( (Unit!34871) )
))
(declare-fun lt!470681 () Unit!34870)

(declare-fun minValue!907 () V!39113)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39113)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!733 (array!67892 array!67894 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39113 V!39113 V!39113 V!39113 (_ BitVec 32) Int) Unit!34870)

(assert (=> b!1066365 (= lt!470681 (lemmaNoChangeToArrayThenSameMapNoExtras!733 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3739 (array!67892 array!67894 (_ BitVec 32) (_ BitVec 32) V!39113 V!39113 (_ BitVec 32) Int) ListLongMap!14251)

(assert (=> b!1066365 (= lt!470683 (getCurrentListMapNoExtraKeys!3739 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066365 (= lt!470682 (getCurrentListMapNoExtraKeys!3739 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066366 () Bool)

(assert (=> b!1066366 (= e!608082 true)))

(declare-fun lt!470676 () ListLongMap!14251)

(declare-fun lt!470679 () ListLongMap!14251)

(declare-fun -!611 (ListLongMap!14251 (_ BitVec 64)) ListLongMap!14251)

(assert (=> b!1066366 (= lt!470676 (-!611 lt!470679 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!470680 () ListLongMap!14251)

(assert (=> b!1066366 (= (-!611 lt!470680 #b0000000000000000000000000000000000000000000000000000000000000000) lt!470682)))

(declare-fun lt!470677 () Unit!34870)

(declare-fun addThenRemoveForNewKeyIsSame!29 (ListLongMap!14251 (_ BitVec 64) V!39113) Unit!34870)

(assert (=> b!1066366 (= lt!470677 (addThenRemoveForNewKeyIsSame!29 lt!470682 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!470678 () ListLongMap!14251)

(assert (=> b!1066366 (and (= lt!470679 lt!470680) (= lt!470678 lt!470683))))

(declare-fun +!3177 (ListLongMap!14251 tuple2!16282) ListLongMap!14251)

(assert (=> b!1066366 (= lt!470680 (+!3177 lt!470682 (tuple2!16283 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun getCurrentListMap!4009 (array!67892 array!67894 (_ BitVec 32) (_ BitVec 32) V!39113 V!39113 (_ BitVec 32) Int) ListLongMap!14251)

(assert (=> b!1066366 (= lt!470678 (getCurrentListMap!4009 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1066366 (= lt!470679 (getCurrentListMap!4009 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1066367 () Bool)

(assert (=> b!1066367 (= e!608081 (and e!608078 mapRes!39913))))

(declare-fun condMapEmpty!39913 () Bool)

(declare-fun mapDefault!39913 () ValueCell!12038)

(assert (=> b!1066367 (= condMapEmpty!39913 (= (arr!32649 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12038)) mapDefault!39913)))))

(assert (= (and start!94304 res!711754) b!1066363))

(assert (= (and b!1066363 res!711756) b!1066362))

(assert (= (and b!1066362 res!711753) b!1066360))

(assert (= (and b!1066360 res!711755) b!1066365))

(assert (= (and b!1066365 (not res!711757)) b!1066366))

(assert (= (and b!1066367 condMapEmpty!39913) mapIsEmpty!39913))

(assert (= (and b!1066367 (not condMapEmpty!39913)) mapNonEmpty!39913))

(get-info :version)

(assert (= (and mapNonEmpty!39913 ((_ is ValueCellFull!12038) mapValue!39913)) b!1066361))

(assert (= (and b!1066367 ((_ is ValueCellFull!12038) mapDefault!39913)) b!1066364))

(assert (= start!94304 b!1066367))

(declare-fun m!984567 () Bool)

(assert (=> start!94304 m!984567))

(declare-fun m!984569 () Bool)

(assert (=> start!94304 m!984569))

(declare-fun m!984571 () Bool)

(assert (=> start!94304 m!984571))

(declare-fun m!984573 () Bool)

(assert (=> b!1066366 m!984573))

(declare-fun m!984575 () Bool)

(assert (=> b!1066366 m!984575))

(declare-fun m!984577 () Bool)

(assert (=> b!1066366 m!984577))

(declare-fun m!984579 () Bool)

(assert (=> b!1066366 m!984579))

(declare-fun m!984581 () Bool)

(assert (=> b!1066366 m!984581))

(declare-fun m!984583 () Bool)

(assert (=> b!1066366 m!984583))

(declare-fun m!984585 () Bool)

(assert (=> mapNonEmpty!39913 m!984585))

(declare-fun m!984587 () Bool)

(assert (=> b!1066365 m!984587))

(declare-fun m!984589 () Bool)

(assert (=> b!1066365 m!984589))

(declare-fun m!984591 () Bool)

(assert (=> b!1066365 m!984591))

(declare-fun m!984593 () Bool)

(assert (=> b!1066362 m!984593))

(declare-fun m!984595 () Bool)

(assert (=> b!1066360 m!984595))

(check-sat (not b!1066365) (not b!1066360) tp_is_empty!25483 (not b_next!21673) (not mapNonEmpty!39913) (not start!94304) (not b!1066362) b_and!34419 (not b!1066366))
(check-sat b_and!34419 (not b_next!21673))
