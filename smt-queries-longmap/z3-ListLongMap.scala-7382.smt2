; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94056 () Bool)

(assert start!94056)

(declare-fun b_free!21471 () Bool)

(declare-fun b_next!21471 () Bool)

(assert (=> start!94056 (= b_free!21471 (not b_next!21471))))

(declare-fun tp!75844 () Bool)

(declare-fun b_and!34213 () Bool)

(assert (=> start!94056 (= tp!75844 b_and!34213)))

(declare-fun b!1063739 () Bool)

(declare-fun e!606152 () Bool)

(declare-fun tp_is_empty!25281 () Bool)

(assert (=> b!1063739 (= e!606152 tp_is_empty!25281)))

(declare-fun b!1063740 () Bool)

(declare-fun e!606154 () Bool)

(assert (=> b!1063740 (= e!606154 tp_is_empty!25281)))

(declare-fun b!1063741 () Bool)

(declare-fun res!710204 () Bool)

(declare-fun e!606156 () Bool)

(assert (=> b!1063741 (=> (not res!710204) (not e!606156))))

(declare-datatypes ((array!67561 0))(
  ( (array!67562 (arr!32485 (Array (_ BitVec 32) (_ BitVec 64))) (size!33021 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67561)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67561 (_ BitVec 32)) Bool)

(assert (=> b!1063741 (= res!710204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1063742 () Bool)

(declare-fun e!606153 () Bool)

(declare-fun mapRes!39601 () Bool)

(assert (=> b!1063742 (= e!606153 (and e!606152 mapRes!39601))))

(declare-fun condMapEmpty!39601 () Bool)

(declare-datatypes ((V!38843 0))(
  ( (V!38844 (val!12691 Int)) )
))
(declare-datatypes ((ValueCell!11937 0))(
  ( (ValueCellFull!11937 (v!15303 V!38843)) (EmptyCell!11937) )
))
(declare-datatypes ((array!67563 0))(
  ( (array!67564 (arr!32486 (Array (_ BitVec 32) ValueCell!11937)) (size!33022 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67563)

(declare-fun mapDefault!39601 () ValueCell!11937)

(assert (=> b!1063742 (= condMapEmpty!39601 (= (arr!32486 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11937)) mapDefault!39601)))))

(declare-fun res!710206 () Bool)

(assert (=> start!94056 (=> (not res!710206) (not e!606156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94056 (= res!710206 (validMask!0 mask!1515))))

(assert (=> start!94056 e!606156))

(assert (=> start!94056 true))

(assert (=> start!94056 tp_is_empty!25281))

(declare-fun array_inv!25160 (array!67563) Bool)

(assert (=> start!94056 (and (array_inv!25160 _values!955) e!606153)))

(assert (=> start!94056 tp!75844))

(declare-fun array_inv!25161 (array!67561) Bool)

(assert (=> start!94056 (array_inv!25161 _keys!1163)))

(declare-fun mapNonEmpty!39601 () Bool)

(declare-fun tp!75845 () Bool)

(assert (=> mapNonEmpty!39601 (= mapRes!39601 (and tp!75845 e!606154))))

(declare-fun mapKey!39601 () (_ BitVec 32))

(declare-fun mapValue!39601 () ValueCell!11937)

(declare-fun mapRest!39601 () (Array (_ BitVec 32) ValueCell!11937))

(assert (=> mapNonEmpty!39601 (= (arr!32486 _values!955) (store mapRest!39601 mapKey!39601 mapValue!39601))))

(declare-fun b!1063743 () Bool)

(declare-fun res!710203 () Bool)

(assert (=> b!1063743 (=> (not res!710203) (not e!606156))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1063743 (= res!710203 (and (= (size!33022 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33021 _keys!1163) (size!33022 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063744 () Bool)

(declare-fun res!710205 () Bool)

(assert (=> b!1063744 (=> (not res!710205) (not e!606156))))

(declare-datatypes ((List!22644 0))(
  ( (Nil!22641) (Cons!22640 (h!23849 (_ BitVec 64)) (t!31959 List!22644)) )
))
(declare-fun arrayNoDuplicates!0 (array!67561 (_ BitVec 32) List!22644) Bool)

(assert (=> b!1063744 (= res!710205 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22641))))

(declare-fun b!1063745 () Bool)

(assert (=> b!1063745 (= e!606156 (not true))))

(declare-datatypes ((tuple2!16066 0))(
  ( (tuple2!16067 (_1!8044 (_ BitVec 64)) (_2!8044 V!38843)) )
))
(declare-datatypes ((List!22645 0))(
  ( (Nil!22642) (Cons!22641 (h!23850 tuple2!16066) (t!31960 List!22645)) )
))
(declare-datatypes ((ListLongMap!14035 0))(
  ( (ListLongMap!14036 (toList!7033 List!22645)) )
))
(declare-fun lt!468892 () ListLongMap!14035)

(declare-fun lt!468890 () ListLongMap!14035)

(assert (=> b!1063745 (= lt!468892 lt!468890)))

(declare-fun zeroValueBefore!47 () V!38843)

(declare-datatypes ((Unit!34866 0))(
  ( (Unit!34867) )
))
(declare-fun lt!468891 () Unit!34866)

(declare-fun minValue!907 () V!38843)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38843)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!662 (array!67561 array!67563 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38843 V!38843 V!38843 V!38843 (_ BitVec 32) Int) Unit!34866)

(assert (=> b!1063745 (= lt!468891 (lemmaNoChangeToArrayThenSameMapNoExtras!662 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3625 (array!67561 array!67563 (_ BitVec 32) (_ BitVec 32) V!38843 V!38843 (_ BitVec 32) Int) ListLongMap!14035)

(assert (=> b!1063745 (= lt!468890 (getCurrentListMapNoExtraKeys!3625 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063745 (= lt!468892 (getCurrentListMapNoExtraKeys!3625 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!39601 () Bool)

(assert (=> mapIsEmpty!39601 mapRes!39601))

(assert (= (and start!94056 res!710206) b!1063743))

(assert (= (and b!1063743 res!710203) b!1063741))

(assert (= (and b!1063741 res!710204) b!1063744))

(assert (= (and b!1063744 res!710205) b!1063745))

(assert (= (and b!1063742 condMapEmpty!39601) mapIsEmpty!39601))

(assert (= (and b!1063742 (not condMapEmpty!39601)) mapNonEmpty!39601))

(get-info :version)

(assert (= (and mapNonEmpty!39601 ((_ is ValueCellFull!11937) mapValue!39601)) b!1063740))

(assert (= (and b!1063742 ((_ is ValueCellFull!11937) mapDefault!39601)) b!1063739))

(assert (= start!94056 b!1063742))

(declare-fun m!982395 () Bool)

(assert (=> b!1063745 m!982395))

(declare-fun m!982397 () Bool)

(assert (=> b!1063745 m!982397))

(declare-fun m!982399 () Bool)

(assert (=> b!1063745 m!982399))

(declare-fun m!982401 () Bool)

(assert (=> b!1063744 m!982401))

(declare-fun m!982403 () Bool)

(assert (=> mapNonEmpty!39601 m!982403))

(declare-fun m!982405 () Bool)

(assert (=> b!1063741 m!982405))

(declare-fun m!982407 () Bool)

(assert (=> start!94056 m!982407))

(declare-fun m!982409 () Bool)

(assert (=> start!94056 m!982409))

(declare-fun m!982411 () Bool)

(assert (=> start!94056 m!982411))

(check-sat (not mapNonEmpty!39601) (not b_next!21471) (not start!94056) (not b!1063741) (not b!1063744) tp_is_empty!25281 (not b!1063745) b_and!34213)
(check-sat b_and!34213 (not b_next!21471))
