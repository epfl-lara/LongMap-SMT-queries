; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94364 () Bool)

(assert start!94364)

(declare-fun b_free!21705 () Bool)

(declare-fun b_next!21705 () Bool)

(assert (=> start!94364 (= b_free!21705 (not b_next!21705))))

(declare-fun tp!76559 () Bool)

(declare-fun b_and!34489 () Bool)

(assert (=> start!94364 (= tp!76559 b_and!34489)))

(declare-fun b!1067058 () Bool)

(declare-fun res!712122 () Bool)

(declare-fun e!608558 () Bool)

(assert (=> b!1067058 (=> (not res!712122) (not e!608558))))

(declare-datatypes ((array!68015 0))(
  ( (array!68016 (arr!32708 (Array (_ BitVec 32) (_ BitVec 64))) (size!33244 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68015)

(declare-datatypes ((List!22811 0))(
  ( (Nil!22808) (Cons!22807 (h!24016 (_ BitVec 64)) (t!32134 List!22811)) )
))
(declare-fun arrayNoDuplicates!0 (array!68015 (_ BitVec 32) List!22811) Bool)

(assert (=> b!1067058 (= res!712122 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22808))))

(declare-fun b!1067059 () Bool)

(declare-fun res!712123 () Bool)

(assert (=> b!1067059 (=> (not res!712123) (not e!608558))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68015 (_ BitVec 32)) Bool)

(assert (=> b!1067059 (= res!712123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1067060 () Bool)

(declare-fun e!608555 () Bool)

(declare-fun tp_is_empty!25515 () Bool)

(assert (=> b!1067060 (= e!608555 tp_is_empty!25515)))

(declare-fun b!1067061 () Bool)

(declare-fun res!712121 () Bool)

(assert (=> b!1067061 (=> (not res!712121) (not e!608558))))

(declare-datatypes ((V!39155 0))(
  ( (V!39156 (val!12808 Int)) )
))
(declare-datatypes ((ValueCell!12054 0))(
  ( (ValueCellFull!12054 (v!15422 V!39155)) (EmptyCell!12054) )
))
(declare-datatypes ((array!68017 0))(
  ( (array!68018 (arr!32709 (Array (_ BitVec 32) ValueCell!12054)) (size!33245 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68017)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1067061 (= res!712121 (and (= (size!33245 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33244 _keys!1163) (size!33245 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1067062 () Bool)

(assert (=> b!1067062 (= e!608558 (not true))))

(declare-datatypes ((tuple2!16252 0))(
  ( (tuple2!16253 (_1!8137 (_ BitVec 64)) (_2!8137 V!39155)) )
))
(declare-datatypes ((List!22812 0))(
  ( (Nil!22809) (Cons!22808 (h!24017 tuple2!16252) (t!32135 List!22812)) )
))
(declare-datatypes ((ListLongMap!14221 0))(
  ( (ListLongMap!14222 (toList!7126 List!22812)) )
))
(declare-fun lt!471285 () ListLongMap!14221)

(declare-fun lt!471284 () ListLongMap!14221)

(assert (=> b!1067062 (= lt!471285 lt!471284)))

(declare-fun zeroValueBefore!47 () V!39155)

(declare-datatypes ((Unit!35049 0))(
  ( (Unit!35050) )
))
(declare-fun lt!471283 () Unit!35049)

(declare-fun minValue!907 () V!39155)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39155)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!747 (array!68015 array!68017 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39155 V!39155 V!39155 V!39155 (_ BitVec 32) Int) Unit!35049)

(assert (=> b!1067062 (= lt!471283 (lemmaNoChangeToArrayThenSameMapNoExtras!747 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3710 (array!68015 array!68017 (_ BitVec 32) (_ BitVec 32) V!39155 V!39155 (_ BitVec 32) Int) ListLongMap!14221)

(assert (=> b!1067062 (= lt!471284 (getCurrentListMapNoExtraKeys!3710 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1067062 (= lt!471285 (getCurrentListMapNoExtraKeys!3710 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1067063 () Bool)

(declare-fun e!608556 () Bool)

(assert (=> b!1067063 (= e!608556 tp_is_empty!25515)))

(declare-fun b!1067064 () Bool)

(declare-fun e!608559 () Bool)

(declare-fun mapRes!39964 () Bool)

(assert (=> b!1067064 (= e!608559 (and e!608556 mapRes!39964))))

(declare-fun condMapEmpty!39964 () Bool)

(declare-fun mapDefault!39964 () ValueCell!12054)

(assert (=> b!1067064 (= condMapEmpty!39964 (= (arr!32709 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12054)) mapDefault!39964)))))

(declare-fun mapIsEmpty!39964 () Bool)

(assert (=> mapIsEmpty!39964 mapRes!39964))

(declare-fun res!712124 () Bool)

(assert (=> start!94364 (=> (not res!712124) (not e!608558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94364 (= res!712124 (validMask!0 mask!1515))))

(assert (=> start!94364 e!608558))

(assert (=> start!94364 true))

(assert (=> start!94364 tp_is_empty!25515))

(declare-fun array_inv!25324 (array!68017) Bool)

(assert (=> start!94364 (and (array_inv!25324 _values!955) e!608559)))

(assert (=> start!94364 tp!76559))

(declare-fun array_inv!25325 (array!68015) Bool)

(assert (=> start!94364 (array_inv!25325 _keys!1163)))

(declare-fun mapNonEmpty!39964 () Bool)

(declare-fun tp!76558 () Bool)

(assert (=> mapNonEmpty!39964 (= mapRes!39964 (and tp!76558 e!608555))))

(declare-fun mapKey!39964 () (_ BitVec 32))

(declare-fun mapValue!39964 () ValueCell!12054)

(declare-fun mapRest!39964 () (Array (_ BitVec 32) ValueCell!12054))

(assert (=> mapNonEmpty!39964 (= (arr!32709 _values!955) (store mapRest!39964 mapKey!39964 mapValue!39964))))

(assert (= (and start!94364 res!712124) b!1067061))

(assert (= (and b!1067061 res!712121) b!1067059))

(assert (= (and b!1067059 res!712123) b!1067058))

(assert (= (and b!1067058 res!712122) b!1067062))

(assert (= (and b!1067064 condMapEmpty!39964) mapIsEmpty!39964))

(assert (= (and b!1067064 (not condMapEmpty!39964)) mapNonEmpty!39964))

(get-info :version)

(assert (= (and mapNonEmpty!39964 ((_ is ValueCellFull!12054) mapValue!39964)) b!1067060))

(assert (= (and b!1067064 ((_ is ValueCellFull!12054) mapDefault!39964)) b!1067063))

(assert (= start!94364 b!1067064))

(declare-fun m!985773 () Bool)

(assert (=> b!1067062 m!985773))

(declare-fun m!985775 () Bool)

(assert (=> b!1067062 m!985775))

(declare-fun m!985777 () Bool)

(assert (=> b!1067062 m!985777))

(declare-fun m!985779 () Bool)

(assert (=> start!94364 m!985779))

(declare-fun m!985781 () Bool)

(assert (=> start!94364 m!985781))

(declare-fun m!985783 () Bool)

(assert (=> start!94364 m!985783))

(declare-fun m!985785 () Bool)

(assert (=> b!1067059 m!985785))

(declare-fun m!985787 () Bool)

(assert (=> b!1067058 m!985787))

(declare-fun m!985789 () Bool)

(assert (=> mapNonEmpty!39964 m!985789))

(check-sat (not b_next!21705) (not mapNonEmpty!39964) (not b!1067059) (not b!1067058) b_and!34489 tp_is_empty!25515 (not b!1067062) (not start!94364))
(check-sat b_and!34489 (not b_next!21705))
