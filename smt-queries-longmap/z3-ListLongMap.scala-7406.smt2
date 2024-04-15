; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94222 () Bool)

(assert start!94222)

(declare-fun b_free!21613 () Bool)

(declare-fun b_next!21613 () Bool)

(assert (=> start!94222 (= b_free!21613 (not b_next!21613))))

(declare-fun tp!76277 () Bool)

(declare-fun b_and!34347 () Bool)

(assert (=> start!94222 (= tp!76277 b_and!34347)))

(declare-fun b!1065456 () Bool)

(declare-fun e!607421 () Bool)

(assert (=> b!1065456 (= e!607421 true)))

(declare-datatypes ((V!39033 0))(
  ( (V!39034 (val!12762 Int)) )
))
(declare-datatypes ((tuple2!16230 0))(
  ( (tuple2!16231 (_1!8126 (_ BitVec 64)) (_2!8126 V!39033)) )
))
(declare-datatypes ((List!22779 0))(
  ( (Nil!22776) (Cons!22775 (h!23984 tuple2!16230) (t!32089 List!22779)) )
))
(declare-datatypes ((ListLongMap!14199 0))(
  ( (ListLongMap!14200 (toList!7115 List!22779)) )
))
(declare-fun lt!469825 () ListLongMap!14199)

(declare-fun lt!469821 () ListLongMap!14199)

(declare-fun -!593 (ListLongMap!14199 (_ BitVec 64)) ListLongMap!14199)

(assert (=> b!1065456 (= lt!469825 (-!593 lt!469821 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!469822 () ListLongMap!14199)

(declare-fun lt!469820 () ListLongMap!14199)

(assert (=> b!1065456 (= (-!593 lt!469822 #b0000000000000000000000000000000000000000000000000000000000000000) lt!469820)))

(declare-datatypes ((Unit!34816 0))(
  ( (Unit!34817) )
))
(declare-fun lt!469824 () Unit!34816)

(declare-fun zeroValueBefore!47 () V!39033)

(declare-fun addThenRemoveForNewKeyIsSame!11 (ListLongMap!14199 (_ BitVec 64) V!39033) Unit!34816)

(assert (=> b!1065456 (= lt!469824 (addThenRemoveForNewKeyIsSame!11 lt!469820 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!469823 () ListLongMap!14199)

(declare-fun lt!469819 () ListLongMap!14199)

(assert (=> b!1065456 (and (= lt!469821 lt!469822) (= lt!469819 lt!469823))))

(declare-fun +!3159 (ListLongMap!14199 tuple2!16230) ListLongMap!14199)

(assert (=> b!1065456 (= lt!469822 (+!3159 lt!469820 (tuple2!16231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12008 0))(
  ( (ValueCellFull!12008 (v!15373 V!39033)) (EmptyCell!12008) )
))
(declare-datatypes ((array!67774 0))(
  ( (array!67775 (arr!32590 (Array (_ BitVec 32) ValueCell!12008)) (size!33128 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67774)

(declare-fun minValue!907 () V!39033)

(declare-datatypes ((array!67776 0))(
  ( (array!67777 (arr!32591 (Array (_ BitVec 32) (_ BitVec 64))) (size!33129 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67776)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39033)

(declare-fun getCurrentListMap!3991 (array!67776 array!67774 (_ BitVec 32) (_ BitVec 32) V!39033 V!39033 (_ BitVec 32) Int) ListLongMap!14199)

(assert (=> b!1065456 (= lt!469819 (getCurrentListMap!3991 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065456 (= lt!469821 (getCurrentListMap!3991 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39820 () Bool)

(declare-fun mapRes!39820 () Bool)

(declare-fun tp!76276 () Bool)

(declare-fun e!607419 () Bool)

(assert (=> mapNonEmpty!39820 (= mapRes!39820 (and tp!76276 e!607419))))

(declare-fun mapRest!39820 () (Array (_ BitVec 32) ValueCell!12008))

(declare-fun mapKey!39820 () (_ BitVec 32))

(declare-fun mapValue!39820 () ValueCell!12008)

(assert (=> mapNonEmpty!39820 (= (arr!32590 _values!955) (store mapRest!39820 mapKey!39820 mapValue!39820))))

(declare-fun b!1065458 () Bool)

(declare-fun e!607420 () Bool)

(declare-fun tp_is_empty!25423 () Bool)

(assert (=> b!1065458 (= e!607420 tp_is_empty!25423)))

(declare-fun mapIsEmpty!39820 () Bool)

(assert (=> mapIsEmpty!39820 mapRes!39820))

(declare-fun b!1065459 () Bool)

(declare-fun res!711225 () Bool)

(declare-fun e!607424 () Bool)

(assert (=> b!1065459 (=> (not res!711225) (not e!607424))))

(assert (=> b!1065459 (= res!711225 (and (= (size!33128 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33129 _keys!1163) (size!33128 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065460 () Bool)

(declare-fun e!607423 () Bool)

(assert (=> b!1065460 (= e!607423 (and e!607420 mapRes!39820))))

(declare-fun condMapEmpty!39820 () Bool)

(declare-fun mapDefault!39820 () ValueCell!12008)

(assert (=> b!1065460 (= condMapEmpty!39820 (= (arr!32590 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12008)) mapDefault!39820)))))

(declare-fun b!1065461 () Bool)

(declare-fun res!711222 () Bool)

(assert (=> b!1065461 (=> (not res!711222) (not e!607424))))

(declare-datatypes ((List!22780 0))(
  ( (Nil!22777) (Cons!22776 (h!23985 (_ BitVec 64)) (t!32090 List!22780)) )
))
(declare-fun arrayNoDuplicates!0 (array!67776 (_ BitVec 32) List!22780) Bool)

(assert (=> b!1065461 (= res!711222 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22777))))

(declare-fun res!711224 () Bool)

(assert (=> start!94222 (=> (not res!711224) (not e!607424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94222 (= res!711224 (validMask!0 mask!1515))))

(assert (=> start!94222 e!607424))

(assert (=> start!94222 true))

(assert (=> start!94222 tp_is_empty!25423))

(declare-fun array_inv!25232 (array!67774) Bool)

(assert (=> start!94222 (and (array_inv!25232 _values!955) e!607423)))

(assert (=> start!94222 tp!76277))

(declare-fun array_inv!25233 (array!67776) Bool)

(assert (=> start!94222 (array_inv!25233 _keys!1163)))

(declare-fun b!1065457 () Bool)

(declare-fun res!711221 () Bool)

(assert (=> b!1065457 (=> (not res!711221) (not e!607424))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67776 (_ BitVec 32)) Bool)

(assert (=> b!1065457 (= res!711221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1065462 () Bool)

(assert (=> b!1065462 (= e!607419 tp_is_empty!25423)))

(declare-fun b!1065463 () Bool)

(assert (=> b!1065463 (= e!607424 (not e!607421))))

(declare-fun res!711223 () Bool)

(assert (=> b!1065463 (=> res!711223 e!607421)))

(assert (=> b!1065463 (= res!711223 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1065463 (= lt!469820 lt!469823)))

(declare-fun lt!469818 () Unit!34816)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!709 (array!67776 array!67774 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39033 V!39033 V!39033 V!39033 (_ BitVec 32) Int) Unit!34816)

(assert (=> b!1065463 (= lt!469818 (lemmaNoChangeToArrayThenSameMapNoExtras!709 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3715 (array!67776 array!67774 (_ BitVec 32) (_ BitVec 32) V!39033 V!39033 (_ BitVec 32) Int) ListLongMap!14199)

(assert (=> b!1065463 (= lt!469823 (getCurrentListMapNoExtraKeys!3715 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065463 (= lt!469820 (getCurrentListMapNoExtraKeys!3715 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94222 res!711224) b!1065459))

(assert (= (and b!1065459 res!711225) b!1065457))

(assert (= (and b!1065457 res!711221) b!1065461))

(assert (= (and b!1065461 res!711222) b!1065463))

(assert (= (and b!1065463 (not res!711223)) b!1065456))

(assert (= (and b!1065460 condMapEmpty!39820) mapIsEmpty!39820))

(assert (= (and b!1065460 (not condMapEmpty!39820)) mapNonEmpty!39820))

(get-info :version)

(assert (= (and mapNonEmpty!39820 ((_ is ValueCellFull!12008) mapValue!39820)) b!1065462))

(assert (= (and b!1065460 ((_ is ValueCellFull!12008) mapDefault!39820)) b!1065458))

(assert (= start!94222 b!1065460))

(declare-fun m!983483 () Bool)

(assert (=> b!1065463 m!983483))

(declare-fun m!983485 () Bool)

(assert (=> b!1065463 m!983485))

(declare-fun m!983487 () Bool)

(assert (=> b!1065463 m!983487))

(declare-fun m!983489 () Bool)

(assert (=> b!1065461 m!983489))

(declare-fun m!983491 () Bool)

(assert (=> mapNonEmpty!39820 m!983491))

(declare-fun m!983493 () Bool)

(assert (=> b!1065456 m!983493))

(declare-fun m!983495 () Bool)

(assert (=> b!1065456 m!983495))

(declare-fun m!983497 () Bool)

(assert (=> b!1065456 m!983497))

(declare-fun m!983499 () Bool)

(assert (=> b!1065456 m!983499))

(declare-fun m!983501 () Bool)

(assert (=> b!1065456 m!983501))

(declare-fun m!983503 () Bool)

(assert (=> b!1065456 m!983503))

(declare-fun m!983505 () Bool)

(assert (=> start!94222 m!983505))

(declare-fun m!983507 () Bool)

(assert (=> start!94222 m!983507))

(declare-fun m!983509 () Bool)

(assert (=> start!94222 m!983509))

(declare-fun m!983511 () Bool)

(assert (=> b!1065457 m!983511))

(check-sat (not b!1065461) (not start!94222) (not b!1065457) tp_is_empty!25423 b_and!34347 (not b!1065463) (not b_next!21613) (not b!1065456) (not mapNonEmpty!39820))
(check-sat b_and!34347 (not b_next!21613))
