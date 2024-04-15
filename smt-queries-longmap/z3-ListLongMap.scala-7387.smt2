; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94078 () Bool)

(assert start!94078)

(declare-fun b_free!21499 () Bool)

(declare-fun b_next!21499 () Bool)

(assert (=> start!94078 (= b_free!21499 (not b_next!21499))))

(declare-fun tp!75929 () Bool)

(declare-fun b_and!34215 () Bool)

(assert (=> start!94078 (= tp!75929 b_and!34215)))

(declare-fun b!1063880 () Bool)

(declare-fun e!606272 () Bool)

(assert (=> b!1063880 (= e!606272 (not true))))

(declare-datatypes ((V!38881 0))(
  ( (V!38882 (val!12705 Int)) )
))
(declare-datatypes ((tuple2!16146 0))(
  ( (tuple2!16147 (_1!8084 (_ BitVec 64)) (_2!8084 V!38881)) )
))
(declare-datatypes ((List!22696 0))(
  ( (Nil!22693) (Cons!22692 (h!23901 tuple2!16146) (t!32002 List!22696)) )
))
(declare-datatypes ((ListLongMap!14115 0))(
  ( (ListLongMap!14116 (toList!7073 List!22696)) )
))
(declare-fun lt!468818 () ListLongMap!14115)

(declare-fun lt!468817 () ListLongMap!14115)

(assert (=> b!1063880 (= lt!468818 lt!468817)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun minValue!907 () V!38881)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38881)

(declare-datatypes ((Unit!34737 0))(
  ( (Unit!34738) )
))
(declare-fun lt!468816 () Unit!34737)

(declare-datatypes ((ValueCell!11951 0))(
  ( (ValueCellFull!11951 (v!15316 V!38881)) (EmptyCell!11951) )
))
(declare-datatypes ((array!67556 0))(
  ( (array!67557 (arr!32483 (Array (_ BitVec 32) ValueCell!11951)) (size!33021 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67556)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38881)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67558 0))(
  ( (array!67559 (arr!32484 (Array (_ BitVec 32) (_ BitVec 64))) (size!33022 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67558)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!673 (array!67558 array!67556 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38881 V!38881 V!38881 V!38881 (_ BitVec 32) Int) Unit!34737)

(assert (=> b!1063880 (= lt!468816 (lemmaNoChangeToArrayThenSameMapNoExtras!673 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3679 (array!67558 array!67556 (_ BitVec 32) (_ BitVec 32) V!38881 V!38881 (_ BitVec 32) Int) ListLongMap!14115)

(assert (=> b!1063880 (= lt!468817 (getCurrentListMapNoExtraKeys!3679 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063880 (= lt!468818 (getCurrentListMapNoExtraKeys!3679 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063881 () Bool)

(declare-fun res!710304 () Bool)

(assert (=> b!1063881 (=> (not res!710304) (not e!606272))))

(declare-datatypes ((List!22697 0))(
  ( (Nil!22694) (Cons!22693 (h!23902 (_ BitVec 64)) (t!32003 List!22697)) )
))
(declare-fun arrayNoDuplicates!0 (array!67558 (_ BitVec 32) List!22697) Bool)

(assert (=> b!1063881 (= res!710304 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22694))))

(declare-fun b!1063882 () Bool)

(declare-fun e!606270 () Bool)

(declare-fun tp_is_empty!25309 () Bool)

(assert (=> b!1063882 (= e!606270 tp_is_empty!25309)))

(declare-fun b!1063883 () Bool)

(declare-fun res!710303 () Bool)

(assert (=> b!1063883 (=> (not res!710303) (not e!606272))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67558 (_ BitVec 32)) Bool)

(assert (=> b!1063883 (= res!710303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1063884 () Bool)

(declare-fun e!606269 () Bool)

(assert (=> b!1063884 (= e!606269 tp_is_empty!25309)))

(declare-fun mapIsEmpty!39643 () Bool)

(declare-fun mapRes!39643 () Bool)

(assert (=> mapIsEmpty!39643 mapRes!39643))

(declare-fun res!710305 () Bool)

(assert (=> start!94078 (=> (not res!710305) (not e!606272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94078 (= res!710305 (validMask!0 mask!1515))))

(assert (=> start!94078 e!606272))

(assert (=> start!94078 true))

(assert (=> start!94078 tp_is_empty!25309))

(declare-fun e!606273 () Bool)

(declare-fun array_inv!25162 (array!67556) Bool)

(assert (=> start!94078 (and (array_inv!25162 _values!955) e!606273)))

(assert (=> start!94078 tp!75929))

(declare-fun array_inv!25163 (array!67558) Bool)

(assert (=> start!94078 (array_inv!25163 _keys!1163)))

(declare-fun mapNonEmpty!39643 () Bool)

(declare-fun tp!75928 () Bool)

(assert (=> mapNonEmpty!39643 (= mapRes!39643 (and tp!75928 e!606270))))

(declare-fun mapKey!39643 () (_ BitVec 32))

(declare-fun mapValue!39643 () ValueCell!11951)

(declare-fun mapRest!39643 () (Array (_ BitVec 32) ValueCell!11951))

(assert (=> mapNonEmpty!39643 (= (arr!32483 _values!955) (store mapRest!39643 mapKey!39643 mapValue!39643))))

(declare-fun b!1063885 () Bool)

(assert (=> b!1063885 (= e!606273 (and e!606269 mapRes!39643))))

(declare-fun condMapEmpty!39643 () Bool)

(declare-fun mapDefault!39643 () ValueCell!11951)

(assert (=> b!1063885 (= condMapEmpty!39643 (= (arr!32483 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11951)) mapDefault!39643)))))

(declare-fun b!1063886 () Bool)

(declare-fun res!710302 () Bool)

(assert (=> b!1063886 (=> (not res!710302) (not e!606272))))

(assert (=> b!1063886 (= res!710302 (and (= (size!33021 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33022 _keys!1163) (size!33021 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94078 res!710305) b!1063886))

(assert (= (and b!1063886 res!710302) b!1063883))

(assert (= (and b!1063883 res!710303) b!1063881))

(assert (= (and b!1063881 res!710304) b!1063880))

(assert (= (and b!1063885 condMapEmpty!39643) mapIsEmpty!39643))

(assert (= (and b!1063885 (not condMapEmpty!39643)) mapNonEmpty!39643))

(get-info :version)

(assert (= (and mapNonEmpty!39643 ((_ is ValueCellFull!11951) mapValue!39643)) b!1063882))

(assert (= (and b!1063885 ((_ is ValueCellFull!11951) mapDefault!39643)) b!1063884))

(assert (= start!94078 b!1063885))

(declare-fun m!982021 () Bool)

(assert (=> b!1063881 m!982021))

(declare-fun m!982023 () Bool)

(assert (=> start!94078 m!982023))

(declare-fun m!982025 () Bool)

(assert (=> start!94078 m!982025))

(declare-fun m!982027 () Bool)

(assert (=> start!94078 m!982027))

(declare-fun m!982029 () Bool)

(assert (=> mapNonEmpty!39643 m!982029))

(declare-fun m!982031 () Bool)

(assert (=> b!1063880 m!982031))

(declare-fun m!982033 () Bool)

(assert (=> b!1063880 m!982033))

(declare-fun m!982035 () Bool)

(assert (=> b!1063880 m!982035))

(declare-fun m!982037 () Bool)

(assert (=> b!1063883 m!982037))

(check-sat b_and!34215 (not b!1063883) tp_is_empty!25309 (not start!94078) (not b!1063881) (not b!1063880) (not b_next!21499) (not mapNonEmpty!39643))
(check-sat b_and!34215 (not b_next!21499))
