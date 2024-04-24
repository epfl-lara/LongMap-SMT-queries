; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94238 () Bool)

(assert start!94238)

(declare-fun b_free!21439 () Bool)

(declare-fun b_next!21439 () Bool)

(assert (=> start!94238 (= b_free!21439 (not b_next!21439))))

(declare-fun tp!75745 () Bool)

(declare-fun b_and!34181 () Bool)

(assert (=> start!94238 (= tp!75745 b_and!34181)))

(declare-fun b!1064487 () Bool)

(declare-fun res!710390 () Bool)

(declare-fun e!606585 () Bool)

(assert (=> b!1064487 (=> (not res!710390) (not e!606585))))

(declare-datatypes ((array!67541 0))(
  ( (array!67542 (arr!32470 (Array (_ BitVec 32) (_ BitVec 64))) (size!33007 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67541)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67541 (_ BitVec 32)) Bool)

(assert (=> b!1064487 (= res!710390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1064488 () Bool)

(declare-fun e!606581 () Bool)

(assert (=> b!1064488 (= e!606581 true)))

(declare-datatypes ((V!38801 0))(
  ( (V!38802 (val!12675 Int)) )
))
(declare-datatypes ((tuple2!16028 0))(
  ( (tuple2!16029 (_1!8025 (_ BitVec 64)) (_2!8025 V!38801)) )
))
(declare-datatypes ((List!22604 0))(
  ( (Nil!22601) (Cons!22600 (h!23818 tuple2!16028) (t!31909 List!22604)) )
))
(declare-datatypes ((ListLongMap!14005 0))(
  ( (ListLongMap!14006 (toList!7018 List!22604)) )
))
(declare-fun lt!469054 () ListLongMap!14005)

(declare-fun -!578 (ListLongMap!14005 (_ BitVec 64)) ListLongMap!14005)

(assert (=> b!1064488 (= (-!578 lt!469054 #b0000000000000000000000000000000000000000000000000000000000000000) lt!469054)))

(declare-datatypes ((Unit!34837 0))(
  ( (Unit!34838) )
))
(declare-fun lt!469051 () Unit!34837)

(declare-fun removeNotPresentStillSame!29 (ListLongMap!14005 (_ BitVec 64)) Unit!34837)

(assert (=> b!1064488 (= lt!469051 (removeNotPresentStillSame!29 lt!469054 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1064489 () Bool)

(declare-fun res!710386 () Bool)

(assert (=> b!1064489 (=> (not res!710386) (not e!606585))))

(declare-datatypes ((ValueCell!11921 0))(
  ( (ValueCellFull!11921 (v!15282 V!38801)) (EmptyCell!11921) )
))
(declare-datatypes ((array!67543 0))(
  ( (array!67544 (arr!32471 (Array (_ BitVec 32) ValueCell!11921)) (size!33008 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67543)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1064489 (= res!710386 (and (= (size!33008 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33007 _keys!1163) (size!33008 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39550 () Bool)

(declare-fun mapRes!39550 () Bool)

(assert (=> mapIsEmpty!39550 mapRes!39550))

(declare-fun b!1064490 () Bool)

(declare-fun e!606587 () Bool)

(declare-fun tp_is_empty!25249 () Bool)

(assert (=> b!1064490 (= e!606587 tp_is_empty!25249)))

(declare-fun b!1064491 () Bool)

(declare-fun res!710387 () Bool)

(assert (=> b!1064491 (=> (not res!710387) (not e!606585))))

(declare-datatypes ((List!22605 0))(
  ( (Nil!22602) (Cons!22601 (h!23819 (_ BitVec 64)) (t!31910 List!22605)) )
))
(declare-fun arrayNoDuplicates!0 (array!67541 (_ BitVec 32) List!22605) Bool)

(assert (=> b!1064491 (= res!710387 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22602))))

(declare-fun b!1064492 () Bool)

(declare-fun e!606582 () Bool)

(declare-fun e!606586 () Bool)

(assert (=> b!1064492 (= e!606582 (and e!606586 mapRes!39550))))

(declare-fun condMapEmpty!39550 () Bool)

(declare-fun mapDefault!39550 () ValueCell!11921)

(assert (=> b!1064492 (= condMapEmpty!39550 (= (arr!32471 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11921)) mapDefault!39550)))))

(declare-fun b!1064493 () Bool)

(assert (=> b!1064493 (= e!606586 tp_is_empty!25249)))

(declare-fun b!1064494 () Bool)

(declare-fun e!606583 () Bool)

(assert (=> b!1064494 (= e!606583 e!606581)))

(declare-fun res!710391 () Bool)

(assert (=> b!1064494 (=> res!710391 e!606581)))

(declare-fun contains!6271 (ListLongMap!14005 (_ BitVec 64)) Bool)

(assert (=> b!1064494 (= res!710391 (contains!6271 lt!469054 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!38801)

(declare-fun minValue!907 () V!38801)

(declare-fun defaultEntry!963 () Int)

(declare-fun getCurrentListMap!3996 (array!67541 array!67543 (_ BitVec 32) (_ BitVec 32) V!38801 V!38801 (_ BitVec 32) Int) ListLongMap!14005)

(assert (=> b!1064494 (= lt!469054 (getCurrentListMap!3996 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39550 () Bool)

(declare-fun tp!75746 () Bool)

(assert (=> mapNonEmpty!39550 (= mapRes!39550 (and tp!75746 e!606587))))

(declare-fun mapValue!39550 () ValueCell!11921)

(declare-fun mapKey!39550 () (_ BitVec 32))

(declare-fun mapRest!39550 () (Array (_ BitVec 32) ValueCell!11921))

(assert (=> mapNonEmpty!39550 (= (arr!32471 _values!955) (store mapRest!39550 mapKey!39550 mapValue!39550))))

(declare-fun b!1064495 () Bool)

(assert (=> b!1064495 (= e!606585 (not e!606583))))

(declare-fun res!710389 () Bool)

(assert (=> b!1064495 (=> res!710389 e!606583)))

(assert (=> b!1064495 (= res!710389 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!469052 () ListLongMap!14005)

(declare-fun lt!469053 () ListLongMap!14005)

(assert (=> b!1064495 (= lt!469052 lt!469053)))

(declare-fun lt!469055 () Unit!34837)

(declare-fun zeroValueAfter!47 () V!38801)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!660 (array!67541 array!67543 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38801 V!38801 V!38801 V!38801 (_ BitVec 32) Int) Unit!34837)

(assert (=> b!1064495 (= lt!469055 (lemmaNoChangeToArrayThenSameMapNoExtras!660 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3657 (array!67541 array!67543 (_ BitVec 32) (_ BitVec 32) V!38801 V!38801 (_ BitVec 32) Int) ListLongMap!14005)

(assert (=> b!1064495 (= lt!469053 (getCurrentListMapNoExtraKeys!3657 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064495 (= lt!469052 (getCurrentListMapNoExtraKeys!3657 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!710388 () Bool)

(assert (=> start!94238 (=> (not res!710388) (not e!606585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94238 (= res!710388 (validMask!0 mask!1515))))

(assert (=> start!94238 e!606585))

(assert (=> start!94238 true))

(assert (=> start!94238 tp_is_empty!25249))

(declare-fun array_inv!25170 (array!67543) Bool)

(assert (=> start!94238 (and (array_inv!25170 _values!955) e!606582)))

(assert (=> start!94238 tp!75745))

(declare-fun array_inv!25171 (array!67541) Bool)

(assert (=> start!94238 (array_inv!25171 _keys!1163)))

(assert (= (and start!94238 res!710388) b!1064489))

(assert (= (and b!1064489 res!710386) b!1064487))

(assert (= (and b!1064487 res!710390) b!1064491))

(assert (= (and b!1064491 res!710387) b!1064495))

(assert (= (and b!1064495 (not res!710389)) b!1064494))

(assert (= (and b!1064494 (not res!710391)) b!1064488))

(assert (= (and b!1064492 condMapEmpty!39550) mapIsEmpty!39550))

(assert (= (and b!1064492 (not condMapEmpty!39550)) mapNonEmpty!39550))

(get-info :version)

(assert (= (and mapNonEmpty!39550 ((_ is ValueCellFull!11921) mapValue!39550)) b!1064490))

(assert (= (and b!1064492 ((_ is ValueCellFull!11921) mapDefault!39550)) b!1064493))

(assert (= start!94238 b!1064492))

(declare-fun m!983533 () Bool)

(assert (=> b!1064488 m!983533))

(declare-fun m!983535 () Bool)

(assert (=> b!1064488 m!983535))

(declare-fun m!983537 () Bool)

(assert (=> start!94238 m!983537))

(declare-fun m!983539 () Bool)

(assert (=> start!94238 m!983539))

(declare-fun m!983541 () Bool)

(assert (=> start!94238 m!983541))

(declare-fun m!983543 () Bool)

(assert (=> b!1064494 m!983543))

(declare-fun m!983545 () Bool)

(assert (=> b!1064494 m!983545))

(declare-fun m!983547 () Bool)

(assert (=> b!1064495 m!983547))

(declare-fun m!983549 () Bool)

(assert (=> b!1064495 m!983549))

(declare-fun m!983551 () Bool)

(assert (=> b!1064495 m!983551))

(declare-fun m!983553 () Bool)

(assert (=> b!1064487 m!983553))

(declare-fun m!983555 () Bool)

(assert (=> b!1064491 m!983555))

(declare-fun m!983557 () Bool)

(assert (=> mapNonEmpty!39550 m!983557))

(check-sat tp_is_empty!25249 (not b!1064491) (not start!94238) (not mapNonEmpty!39550) b_and!34181 (not b!1064494) (not b!1064487) (not b!1064488) (not b!1064495) (not b_next!21439))
(check-sat b_and!34181 (not b_next!21439))
