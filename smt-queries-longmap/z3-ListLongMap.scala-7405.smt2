; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94224 () Bool)

(assert start!94224)

(declare-fun b_free!21609 () Bool)

(declare-fun b_next!21609 () Bool)

(assert (=> start!94224 (= b_free!21609 (not b_next!21609))))

(declare-fun tp!76264 () Bool)

(declare-fun b_and!34369 () Bool)

(assert (=> start!94224 (= tp!76264 b_and!34369)))

(declare-fun b!1065561 () Bool)

(declare-fun e!607480 () Bool)

(assert (=> b!1065561 (= e!607480 true)))

(declare-datatypes ((V!39027 0))(
  ( (V!39028 (val!12760 Int)) )
))
(declare-datatypes ((tuple2!16174 0))(
  ( (tuple2!16175 (_1!8098 (_ BitVec 64)) (_2!8098 V!39027)) )
))
(declare-datatypes ((List!22740 0))(
  ( (Nil!22737) (Cons!22736 (h!23945 tuple2!16174) (t!32059 List!22740)) )
))
(declare-datatypes ((ListLongMap!14143 0))(
  ( (ListLongMap!14144 (toList!7087 List!22740)) )
))
(declare-fun lt!469975 () ListLongMap!14143)

(declare-fun lt!469971 () ListLongMap!14143)

(declare-fun -!602 (ListLongMap!14143 (_ BitVec 64)) ListLongMap!14143)

(assert (=> b!1065561 (= lt!469975 (-!602 lt!469971 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!469972 () ListLongMap!14143)

(declare-fun lt!469977 () ListLongMap!14143)

(assert (=> b!1065561 (= (-!602 lt!469972 #b0000000000000000000000000000000000000000000000000000000000000000) lt!469977)))

(declare-datatypes ((Unit!34967 0))(
  ( (Unit!34968) )
))
(declare-fun lt!469973 () Unit!34967)

(declare-fun zeroValueBefore!47 () V!39027)

(declare-fun addThenRemoveForNewKeyIsSame!11 (ListLongMap!14143 (_ BitVec 64) V!39027) Unit!34967)

(assert (=> b!1065561 (= lt!469973 (addThenRemoveForNewKeyIsSame!11 lt!469977 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!469974 () ListLongMap!14143)

(declare-fun lt!469976 () ListLongMap!14143)

(assert (=> b!1065561 (and (= lt!469971 lt!469972) (= lt!469976 lt!469974))))

(declare-fun +!3133 (ListLongMap!14143 tuple2!16174) ListLongMap!14143)

(assert (=> b!1065561 (= lt!469972 (+!3133 lt!469977 (tuple2!16175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12006 0))(
  ( (ValueCellFull!12006 (v!15372 V!39027)) (EmptyCell!12006) )
))
(declare-datatypes ((array!67825 0))(
  ( (array!67826 (arr!32615 (Array (_ BitVec 32) ValueCell!12006)) (size!33151 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67825)

(declare-datatypes ((array!67827 0))(
  ( (array!67828 (arr!32616 (Array (_ BitVec 32) (_ BitVec 64))) (size!33152 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67827)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39027)

(declare-fun minValue!907 () V!39027)

(declare-fun getCurrentListMap!4046 (array!67827 array!67825 (_ BitVec 32) (_ BitVec 32) V!39027 V!39027 (_ BitVec 32) Int) ListLongMap!14143)

(assert (=> b!1065561 (= lt!469976 (getCurrentListMap!4046 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065561 (= lt!469971 (getCurrentListMap!4046 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39814 () Bool)

(declare-fun mapRes!39814 () Bool)

(assert (=> mapIsEmpty!39814 mapRes!39814))

(declare-fun b!1065562 () Bool)

(declare-fun e!607479 () Bool)

(declare-fun tp_is_empty!25419 () Bool)

(assert (=> b!1065562 (= e!607479 tp_is_empty!25419)))

(declare-fun mapNonEmpty!39814 () Bool)

(declare-fun tp!76265 () Bool)

(assert (=> mapNonEmpty!39814 (= mapRes!39814 (and tp!76265 e!607479))))

(declare-fun mapKey!39814 () (_ BitVec 32))

(declare-fun mapValue!39814 () ValueCell!12006)

(declare-fun mapRest!39814 () (Array (_ BitVec 32) ValueCell!12006))

(assert (=> mapNonEmpty!39814 (= (arr!32615 _values!955) (store mapRest!39814 mapKey!39814 mapValue!39814))))

(declare-fun b!1065563 () Bool)

(declare-fun res!711262 () Bool)

(declare-fun e!607476 () Bool)

(assert (=> b!1065563 (=> (not res!711262) (not e!607476))))

(declare-datatypes ((List!22741 0))(
  ( (Nil!22738) (Cons!22737 (h!23946 (_ BitVec 64)) (t!32060 List!22741)) )
))
(declare-fun arrayNoDuplicates!0 (array!67827 (_ BitVec 32) List!22741) Bool)

(assert (=> b!1065563 (= res!711262 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22738))))

(declare-fun b!1065564 () Bool)

(assert (=> b!1065564 (= e!607476 (not e!607480))))

(declare-fun res!711263 () Bool)

(assert (=> b!1065564 (=> res!711263 e!607480)))

(assert (=> b!1065564 (= res!711263 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1065564 (= lt!469977 lt!469974)))

(declare-fun lt!469970 () Unit!34967)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!710 (array!67827 array!67825 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39027 V!39027 V!39027 V!39027 (_ BitVec 32) Int) Unit!34967)

(assert (=> b!1065564 (= lt!469970 (lemmaNoChangeToArrayThenSameMapNoExtras!710 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3673 (array!67827 array!67825 (_ BitVec 32) (_ BitVec 32) V!39027 V!39027 (_ BitVec 32) Int) ListLongMap!14143)

(assert (=> b!1065564 (= lt!469974 (getCurrentListMapNoExtraKeys!3673 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065564 (= lt!469977 (getCurrentListMapNoExtraKeys!3673 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065565 () Bool)

(declare-fun e!607477 () Bool)

(declare-fun e!607481 () Bool)

(assert (=> b!1065565 (= e!607477 (and e!607481 mapRes!39814))))

(declare-fun condMapEmpty!39814 () Bool)

(declare-fun mapDefault!39814 () ValueCell!12006)

(assert (=> b!1065565 (= condMapEmpty!39814 (= (arr!32615 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12006)) mapDefault!39814)))))

(declare-fun b!1065566 () Bool)

(assert (=> b!1065566 (= e!607481 tp_is_empty!25419)))

(declare-fun b!1065567 () Bool)

(declare-fun res!711260 () Bool)

(assert (=> b!1065567 (=> (not res!711260) (not e!607476))))

(assert (=> b!1065567 (= res!711260 (and (= (size!33151 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33152 _keys!1163) (size!33151 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065568 () Bool)

(declare-fun res!711264 () Bool)

(assert (=> b!1065568 (=> (not res!711264) (not e!607476))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67827 (_ BitVec 32)) Bool)

(assert (=> b!1065568 (= res!711264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!711261 () Bool)

(assert (=> start!94224 (=> (not res!711261) (not e!607476))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94224 (= res!711261 (validMask!0 mask!1515))))

(assert (=> start!94224 e!607476))

(assert (=> start!94224 true))

(assert (=> start!94224 tp_is_empty!25419))

(declare-fun array_inv!25254 (array!67825) Bool)

(assert (=> start!94224 (and (array_inv!25254 _values!955) e!607477)))

(assert (=> start!94224 tp!76264))

(declare-fun array_inv!25255 (array!67827) Bool)

(assert (=> start!94224 (array_inv!25255 _keys!1163)))

(assert (= (and start!94224 res!711261) b!1065567))

(assert (= (and b!1065567 res!711260) b!1065568))

(assert (= (and b!1065568 res!711264) b!1065563))

(assert (= (and b!1065563 res!711262) b!1065564))

(assert (= (and b!1065564 (not res!711263)) b!1065561))

(assert (= (and b!1065565 condMapEmpty!39814) mapIsEmpty!39814))

(assert (= (and b!1065565 (not condMapEmpty!39814)) mapNonEmpty!39814))

(get-info :version)

(assert (= (and mapNonEmpty!39814 ((_ is ValueCellFull!12006) mapValue!39814)) b!1065562))

(assert (= (and b!1065565 ((_ is ValueCellFull!12006) mapDefault!39814)) b!1065566))

(assert (= start!94224 b!1065565))

(declare-fun m!984049 () Bool)

(assert (=> mapNonEmpty!39814 m!984049))

(declare-fun m!984051 () Bool)

(assert (=> start!94224 m!984051))

(declare-fun m!984053 () Bool)

(assert (=> start!94224 m!984053))

(declare-fun m!984055 () Bool)

(assert (=> start!94224 m!984055))

(declare-fun m!984057 () Bool)

(assert (=> b!1065564 m!984057))

(declare-fun m!984059 () Bool)

(assert (=> b!1065564 m!984059))

(declare-fun m!984061 () Bool)

(assert (=> b!1065564 m!984061))

(declare-fun m!984063 () Bool)

(assert (=> b!1065561 m!984063))

(declare-fun m!984065 () Bool)

(assert (=> b!1065561 m!984065))

(declare-fun m!984067 () Bool)

(assert (=> b!1065561 m!984067))

(declare-fun m!984069 () Bool)

(assert (=> b!1065561 m!984069))

(declare-fun m!984071 () Bool)

(assert (=> b!1065561 m!984071))

(declare-fun m!984073 () Bool)

(assert (=> b!1065561 m!984073))

(declare-fun m!984075 () Bool)

(assert (=> b!1065563 m!984075))

(declare-fun m!984077 () Bool)

(assert (=> b!1065568 m!984077))

(check-sat b_and!34369 (not b!1065564) (not b!1065561) (not b!1065563) (not mapNonEmpty!39814) (not b!1065568) tp_is_empty!25419 (not b_next!21609) (not start!94224))
(check-sat b_and!34369 (not b_next!21609))
