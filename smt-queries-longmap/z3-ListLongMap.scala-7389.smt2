; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94098 () Bool)

(assert start!94098)

(declare-fun b_free!21513 () Bool)

(declare-fun b_next!21513 () Bool)

(assert (=> start!94098 (= b_free!21513 (not b_next!21513))))

(declare-fun tp!75971 () Bool)

(declare-fun b_and!34255 () Bool)

(assert (=> start!94098 (= tp!75971 b_and!34255)))

(declare-fun b!1064181 () Bool)

(declare-fun res!710457 () Bool)

(declare-fun e!606470 () Bool)

(assert (=> b!1064181 (=> (not res!710457) (not e!606470))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38899 0))(
  ( (V!38900 (val!12712 Int)) )
))
(declare-datatypes ((ValueCell!11958 0))(
  ( (ValueCellFull!11958 (v!15324 V!38899)) (EmptyCell!11958) )
))
(declare-datatypes ((array!67639 0))(
  ( (array!67640 (arr!32524 (Array (_ BitVec 32) ValueCell!11958)) (size!33060 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67639)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67641 0))(
  ( (array!67642 (arr!32525 (Array (_ BitVec 32) (_ BitVec 64))) (size!33061 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67641)

(assert (=> b!1064181 (= res!710457 (and (= (size!33060 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33061 _keys!1163) (size!33060 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064182 () Bool)

(declare-fun res!710455 () Bool)

(assert (=> b!1064182 (=> (not res!710455) (not e!606470))))

(declare-datatypes ((List!22672 0))(
  ( (Nil!22669) (Cons!22668 (h!23877 (_ BitVec 64)) (t!31987 List!22672)) )
))
(declare-fun arrayNoDuplicates!0 (array!67641 (_ BitVec 32) List!22672) Bool)

(assert (=> b!1064182 (= res!710455 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22669))))

(declare-fun b!1064183 () Bool)

(declare-fun res!710456 () Bool)

(assert (=> b!1064183 (=> (not res!710456) (not e!606470))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67641 (_ BitVec 32)) Bool)

(assert (=> b!1064183 (= res!710456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1064184 () Bool)

(declare-fun e!606471 () Bool)

(declare-fun e!606467 () Bool)

(declare-fun mapRes!39664 () Bool)

(assert (=> b!1064184 (= e!606471 (and e!606467 mapRes!39664))))

(declare-fun condMapEmpty!39664 () Bool)

(declare-fun mapDefault!39664 () ValueCell!11958)

(assert (=> b!1064184 (= condMapEmpty!39664 (= (arr!32524 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11958)) mapDefault!39664)))))

(declare-fun b!1064185 () Bool)

(assert (=> b!1064185 (= e!606470 (not true))))

(declare-datatypes ((tuple2!16098 0))(
  ( (tuple2!16099 (_1!8060 (_ BitVec 64)) (_2!8060 V!38899)) )
))
(declare-datatypes ((List!22673 0))(
  ( (Nil!22670) (Cons!22669 (h!23878 tuple2!16098) (t!31988 List!22673)) )
))
(declare-datatypes ((ListLongMap!14067 0))(
  ( (ListLongMap!14068 (toList!7049 List!22673)) )
))
(declare-fun lt!469079 () ListLongMap!14067)

(declare-fun lt!469081 () ListLongMap!14067)

(assert (=> b!1064185 (= lt!469079 lt!469081)))

(declare-fun zeroValueBefore!47 () V!38899)

(declare-fun minValue!907 () V!38899)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38899)

(declare-datatypes ((Unit!34898 0))(
  ( (Unit!34899) )
))
(declare-fun lt!469080 () Unit!34898)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!678 (array!67641 array!67639 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38899 V!38899 V!38899 V!38899 (_ BitVec 32) Int) Unit!34898)

(assert (=> b!1064185 (= lt!469080 (lemmaNoChangeToArrayThenSameMapNoExtras!678 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3641 (array!67641 array!67639 (_ BitVec 32) (_ BitVec 32) V!38899 V!38899 (_ BitVec 32) Int) ListLongMap!14067)

(assert (=> b!1064185 (= lt!469081 (getCurrentListMapNoExtraKeys!3641 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064185 (= lt!469079 (getCurrentListMapNoExtraKeys!3641 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39664 () Bool)

(declare-fun tp!75970 () Bool)

(declare-fun e!606469 () Bool)

(assert (=> mapNonEmpty!39664 (= mapRes!39664 (and tp!75970 e!606469))))

(declare-fun mapValue!39664 () ValueCell!11958)

(declare-fun mapKey!39664 () (_ BitVec 32))

(declare-fun mapRest!39664 () (Array (_ BitVec 32) ValueCell!11958))

(assert (=> mapNonEmpty!39664 (= (arr!32524 _values!955) (store mapRest!39664 mapKey!39664 mapValue!39664))))

(declare-fun b!1064186 () Bool)

(declare-fun tp_is_empty!25323 () Bool)

(assert (=> b!1064186 (= e!606469 tp_is_empty!25323)))

(declare-fun mapIsEmpty!39664 () Bool)

(assert (=> mapIsEmpty!39664 mapRes!39664))

(declare-fun res!710458 () Bool)

(assert (=> start!94098 (=> (not res!710458) (not e!606470))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94098 (= res!710458 (validMask!0 mask!1515))))

(assert (=> start!94098 e!606470))

(assert (=> start!94098 true))

(assert (=> start!94098 tp_is_empty!25323))

(declare-fun array_inv!25186 (array!67639) Bool)

(assert (=> start!94098 (and (array_inv!25186 _values!955) e!606471)))

(assert (=> start!94098 tp!75971))

(declare-fun array_inv!25187 (array!67641) Bool)

(assert (=> start!94098 (array_inv!25187 _keys!1163)))

(declare-fun b!1064180 () Bool)

(assert (=> b!1064180 (= e!606467 tp_is_empty!25323)))

(assert (= (and start!94098 res!710458) b!1064181))

(assert (= (and b!1064181 res!710457) b!1064183))

(assert (= (and b!1064183 res!710456) b!1064182))

(assert (= (and b!1064182 res!710455) b!1064185))

(assert (= (and b!1064184 condMapEmpty!39664) mapIsEmpty!39664))

(assert (= (and b!1064184 (not condMapEmpty!39664)) mapNonEmpty!39664))

(get-info :version)

(assert (= (and mapNonEmpty!39664 ((_ is ValueCellFull!11958) mapValue!39664)) b!1064186))

(assert (= (and b!1064184 ((_ is ValueCellFull!11958) mapDefault!39664)) b!1064180))

(assert (= start!94098 b!1064184))

(declare-fun m!982773 () Bool)

(assert (=> b!1064185 m!982773))

(declare-fun m!982775 () Bool)

(assert (=> b!1064185 m!982775))

(declare-fun m!982777 () Bool)

(assert (=> b!1064185 m!982777))

(declare-fun m!982779 () Bool)

(assert (=> start!94098 m!982779))

(declare-fun m!982781 () Bool)

(assert (=> start!94098 m!982781))

(declare-fun m!982783 () Bool)

(assert (=> start!94098 m!982783))

(declare-fun m!982785 () Bool)

(assert (=> b!1064183 m!982785))

(declare-fun m!982787 () Bool)

(assert (=> b!1064182 m!982787))

(declare-fun m!982789 () Bool)

(assert (=> mapNonEmpty!39664 m!982789))

(check-sat (not b!1064183) b_and!34255 (not mapNonEmpty!39664) (not start!94098) (not b!1064185) (not b_next!21513) tp_is_empty!25323 (not b!1064182))
(check-sat b_and!34255 (not b_next!21513))
