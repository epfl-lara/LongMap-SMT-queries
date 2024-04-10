; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94068 () Bool)

(assert start!94068)

(declare-fun b_free!21483 () Bool)

(declare-fun b_next!21483 () Bool)

(assert (=> start!94068 (= b_free!21483 (not b_next!21483))))

(declare-fun tp!75880 () Bool)

(declare-fun b_and!34225 () Bool)

(assert (=> start!94068 (= tp!75880 b_and!34225)))

(declare-fun res!710277 () Bool)

(declare-fun e!606244 () Bool)

(assert (=> start!94068 (=> (not res!710277) (not e!606244))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94068 (= res!710277 (validMask!0 mask!1515))))

(assert (=> start!94068 e!606244))

(assert (=> start!94068 true))

(declare-fun tp_is_empty!25293 () Bool)

(assert (=> start!94068 tp_is_empty!25293))

(declare-datatypes ((V!38859 0))(
  ( (V!38860 (val!12697 Int)) )
))
(declare-datatypes ((ValueCell!11943 0))(
  ( (ValueCellFull!11943 (v!15309 V!38859)) (EmptyCell!11943) )
))
(declare-datatypes ((array!67585 0))(
  ( (array!67586 (arr!32497 (Array (_ BitVec 32) ValueCell!11943)) (size!33033 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67585)

(declare-fun e!606246 () Bool)

(declare-fun array_inv!25170 (array!67585) Bool)

(assert (=> start!94068 (and (array_inv!25170 _values!955) e!606246)))

(assert (=> start!94068 tp!75880))

(declare-datatypes ((array!67587 0))(
  ( (array!67588 (arr!32498 (Array (_ BitVec 32) (_ BitVec 64))) (size!33034 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67587)

(declare-fun array_inv!25171 (array!67587) Bool)

(assert (=> start!94068 (array_inv!25171 _keys!1163)))

(declare-fun b!1063865 () Bool)

(declare-fun res!710278 () Bool)

(assert (=> b!1063865 (=> (not res!710278) (not e!606244))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67587 (_ BitVec 32)) Bool)

(assert (=> b!1063865 (= res!710278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1063866 () Bool)

(declare-fun e!606245 () Bool)

(assert (=> b!1063866 (= e!606245 tp_is_empty!25293)))

(declare-fun b!1063867 () Bool)

(declare-fun mapRes!39619 () Bool)

(assert (=> b!1063867 (= e!606246 (and e!606245 mapRes!39619))))

(declare-fun condMapEmpty!39619 () Bool)

(declare-fun mapDefault!39619 () ValueCell!11943)

(assert (=> b!1063867 (= condMapEmpty!39619 (= (arr!32497 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11943)) mapDefault!39619)))))

(declare-fun b!1063868 () Bool)

(declare-fun res!710276 () Bool)

(assert (=> b!1063868 (=> (not res!710276) (not e!606244))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1063868 (= res!710276 (and (= (size!33033 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33034 _keys!1163) (size!33033 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063869 () Bool)

(declare-fun e!606243 () Bool)

(assert (=> b!1063869 (= e!606243 tp_is_empty!25293)))

(declare-fun b!1063870 () Bool)

(assert (=> b!1063870 (= e!606244 (not true))))

(declare-datatypes ((tuple2!16076 0))(
  ( (tuple2!16077 (_1!8049 (_ BitVec 64)) (_2!8049 V!38859)) )
))
(declare-datatypes ((List!22653 0))(
  ( (Nil!22650) (Cons!22649 (h!23858 tuple2!16076) (t!31968 List!22653)) )
))
(declare-datatypes ((ListLongMap!14045 0))(
  ( (ListLongMap!14046 (toList!7038 List!22653)) )
))
(declare-fun lt!468945 () ListLongMap!14045)

(declare-fun lt!468944 () ListLongMap!14045)

(assert (=> b!1063870 (= lt!468945 lt!468944)))

(declare-fun zeroValueBefore!47 () V!38859)

(declare-fun minValue!907 () V!38859)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38859)

(declare-datatypes ((Unit!34876 0))(
  ( (Unit!34877) )
))
(declare-fun lt!468946 () Unit!34876)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!667 (array!67587 array!67585 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38859 V!38859 V!38859 V!38859 (_ BitVec 32) Int) Unit!34876)

(assert (=> b!1063870 (= lt!468946 (lemmaNoChangeToArrayThenSameMapNoExtras!667 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3630 (array!67587 array!67585 (_ BitVec 32) (_ BitVec 32) V!38859 V!38859 (_ BitVec 32) Int) ListLongMap!14045)

(assert (=> b!1063870 (= lt!468944 (getCurrentListMapNoExtraKeys!3630 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063870 (= lt!468945 (getCurrentListMapNoExtraKeys!3630 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39619 () Bool)

(declare-fun tp!75881 () Bool)

(assert (=> mapNonEmpty!39619 (= mapRes!39619 (and tp!75881 e!606243))))

(declare-fun mapKey!39619 () (_ BitVec 32))

(declare-fun mapRest!39619 () (Array (_ BitVec 32) ValueCell!11943))

(declare-fun mapValue!39619 () ValueCell!11943)

(assert (=> mapNonEmpty!39619 (= (arr!32497 _values!955) (store mapRest!39619 mapKey!39619 mapValue!39619))))

(declare-fun b!1063871 () Bool)

(declare-fun res!710275 () Bool)

(assert (=> b!1063871 (=> (not res!710275) (not e!606244))))

(declare-datatypes ((List!22654 0))(
  ( (Nil!22651) (Cons!22650 (h!23859 (_ BitVec 64)) (t!31969 List!22654)) )
))
(declare-fun arrayNoDuplicates!0 (array!67587 (_ BitVec 32) List!22654) Bool)

(assert (=> b!1063871 (= res!710275 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22651))))

(declare-fun mapIsEmpty!39619 () Bool)

(assert (=> mapIsEmpty!39619 mapRes!39619))

(assert (= (and start!94068 res!710277) b!1063868))

(assert (= (and b!1063868 res!710276) b!1063865))

(assert (= (and b!1063865 res!710278) b!1063871))

(assert (= (and b!1063871 res!710275) b!1063870))

(assert (= (and b!1063867 condMapEmpty!39619) mapIsEmpty!39619))

(assert (= (and b!1063867 (not condMapEmpty!39619)) mapNonEmpty!39619))

(get-info :version)

(assert (= (and mapNonEmpty!39619 ((_ is ValueCellFull!11943) mapValue!39619)) b!1063869))

(assert (= (and b!1063867 ((_ is ValueCellFull!11943) mapDefault!39619)) b!1063866))

(assert (= start!94068 b!1063867))

(declare-fun m!982503 () Bool)

(assert (=> start!94068 m!982503))

(declare-fun m!982505 () Bool)

(assert (=> start!94068 m!982505))

(declare-fun m!982507 () Bool)

(assert (=> start!94068 m!982507))

(declare-fun m!982509 () Bool)

(assert (=> b!1063870 m!982509))

(declare-fun m!982511 () Bool)

(assert (=> b!1063870 m!982511))

(declare-fun m!982513 () Bool)

(assert (=> b!1063870 m!982513))

(declare-fun m!982515 () Bool)

(assert (=> b!1063865 m!982515))

(declare-fun m!982517 () Bool)

(assert (=> b!1063871 m!982517))

(declare-fun m!982519 () Bool)

(assert (=> mapNonEmpty!39619 m!982519))

(check-sat (not b!1063871) (not b_next!21483) (not b!1063865) tp_is_empty!25293 (not start!94068) (not b!1063870) (not mapNonEmpty!39619) b_and!34225)
(check-sat b_and!34225 (not b_next!21483))
