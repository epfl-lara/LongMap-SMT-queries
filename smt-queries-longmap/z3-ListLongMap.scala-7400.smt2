; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94194 () Bool)

(assert start!94194)

(declare-fun b_free!21579 () Bool)

(declare-fun b_next!21579 () Bool)

(assert (=> start!94194 (= b_free!21579 (not b_next!21579))))

(declare-fun tp!76175 () Bool)

(declare-fun b_and!34339 () Bool)

(assert (=> start!94194 (= tp!76175 b_and!34339)))

(declare-fun b!1065197 () Bool)

(declare-fun e!607204 () Bool)

(declare-fun e!607202 () Bool)

(assert (=> b!1065197 (= e!607204 (not e!607202))))

(declare-fun res!711035 () Bool)

(assert (=> b!1065197 (=> res!711035 e!607202)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065197 (= res!711035 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!38987 0))(
  ( (V!38988 (val!12745 Int)) )
))
(declare-datatypes ((tuple2!16150 0))(
  ( (tuple2!16151 (_1!8086 (_ BitVec 64)) (_2!8086 V!38987)) )
))
(declare-datatypes ((List!22718 0))(
  ( (Nil!22715) (Cons!22714 (h!23923 tuple2!16150) (t!32037 List!22718)) )
))
(declare-datatypes ((ListLongMap!14119 0))(
  ( (ListLongMap!14120 (toList!7075 List!22718)) )
))
(declare-fun lt!469623 () ListLongMap!14119)

(declare-fun lt!469618 () ListLongMap!14119)

(assert (=> b!1065197 (= lt!469623 lt!469618)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38987)

(declare-datatypes ((Unit!34943 0))(
  ( (Unit!34944) )
))
(declare-fun lt!469620 () Unit!34943)

(declare-datatypes ((ValueCell!11991 0))(
  ( (ValueCellFull!11991 (v!15357 V!38987)) (EmptyCell!11991) )
))
(declare-datatypes ((array!67765 0))(
  ( (array!67766 (arr!32585 (Array (_ BitVec 32) ValueCell!11991)) (size!33121 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67765)

(declare-fun minValue!907 () V!38987)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38987)

(declare-datatypes ((array!67767 0))(
  ( (array!67768 (arr!32586 (Array (_ BitVec 32) (_ BitVec 64))) (size!33122 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67767)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!700 (array!67767 array!67765 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38987 V!38987 V!38987 V!38987 (_ BitVec 32) Int) Unit!34943)

(assert (=> b!1065197 (= lt!469620 (lemmaNoChangeToArrayThenSameMapNoExtras!700 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3663 (array!67767 array!67765 (_ BitVec 32) (_ BitVec 32) V!38987 V!38987 (_ BitVec 32) Int) ListLongMap!14119)

(assert (=> b!1065197 (= lt!469618 (getCurrentListMapNoExtraKeys!3663 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065197 (= lt!469623 (getCurrentListMapNoExtraKeys!3663 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065198 () Bool)

(declare-fun res!711034 () Bool)

(assert (=> b!1065198 (=> (not res!711034) (not e!607204))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67767 (_ BitVec 32)) Bool)

(assert (=> b!1065198 (= res!711034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!711031 () Bool)

(assert (=> start!94194 (=> (not res!711031) (not e!607204))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94194 (= res!711031 (validMask!0 mask!1515))))

(assert (=> start!94194 e!607204))

(assert (=> start!94194 true))

(declare-fun tp_is_empty!25389 () Bool)

(assert (=> start!94194 tp_is_empty!25389))

(declare-fun e!607203 () Bool)

(declare-fun array_inv!25230 (array!67765) Bool)

(assert (=> start!94194 (and (array_inv!25230 _values!955) e!607203)))

(assert (=> start!94194 tp!76175))

(declare-fun array_inv!25231 (array!67767) Bool)

(assert (=> start!94194 (array_inv!25231 _keys!1163)))

(declare-fun mapIsEmpty!39769 () Bool)

(declare-fun mapRes!39769 () Bool)

(assert (=> mapIsEmpty!39769 mapRes!39769))

(declare-fun b!1065199 () Bool)

(declare-fun e!607205 () Bool)

(assert (=> b!1065199 (= e!607205 tp_is_empty!25389)))

(declare-fun b!1065200 () Bool)

(assert (=> b!1065200 (= e!607203 (and e!607205 mapRes!39769))))

(declare-fun condMapEmpty!39769 () Bool)

(declare-fun mapDefault!39769 () ValueCell!11991)

(assert (=> b!1065200 (= condMapEmpty!39769 (= (arr!32585 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11991)) mapDefault!39769)))))

(declare-fun mapNonEmpty!39769 () Bool)

(declare-fun tp!76174 () Bool)

(declare-fun e!607208 () Bool)

(assert (=> mapNonEmpty!39769 (= mapRes!39769 (and tp!76174 e!607208))))

(declare-fun mapRest!39769 () (Array (_ BitVec 32) ValueCell!11991))

(declare-fun mapValue!39769 () ValueCell!11991)

(declare-fun mapKey!39769 () (_ BitVec 32))

(assert (=> mapNonEmpty!39769 (= (arr!32585 _values!955) (store mapRest!39769 mapKey!39769 mapValue!39769))))

(declare-fun b!1065201 () Bool)

(declare-fun res!711036 () Bool)

(assert (=> b!1065201 (=> (not res!711036) (not e!607204))))

(declare-datatypes ((List!22719 0))(
  ( (Nil!22716) (Cons!22715 (h!23924 (_ BitVec 64)) (t!32038 List!22719)) )
))
(declare-fun arrayNoDuplicates!0 (array!67767 (_ BitVec 32) List!22719) Bool)

(assert (=> b!1065201 (= res!711036 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22716))))

(declare-fun b!1065202 () Bool)

(declare-fun res!711032 () Bool)

(assert (=> b!1065202 (=> (not res!711032) (not e!607204))))

(assert (=> b!1065202 (= res!711032 (and (= (size!33121 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33122 _keys!1163) (size!33121 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065203 () Bool)

(assert (=> b!1065203 (= e!607202 true)))

(declare-fun lt!469619 () Bool)

(declare-fun contains!6266 (ListLongMap!14119 (_ BitVec 64)) Bool)

(assert (=> b!1065203 (= lt!469619 (contains!6266 lt!469623 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!607206 () Bool)

(assert (=> b!1065203 e!607206))

(declare-fun res!711033 () Bool)

(assert (=> b!1065203 (=> (not res!711033) (not e!607206))))

(declare-fun lt!469621 () ListLongMap!14119)

(declare-fun +!3121 (ListLongMap!14119 tuple2!16150) ListLongMap!14119)

(assert (=> b!1065203 (= res!711033 (= lt!469621 (+!3121 lt!469623 (tuple2!16151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun lt!469622 () ListLongMap!14119)

(declare-fun getCurrentListMap!4034 (array!67767 array!67765 (_ BitVec 32) (_ BitVec 32) V!38987 V!38987 (_ BitVec 32) Int) ListLongMap!14119)

(assert (=> b!1065203 (= lt!469622 (getCurrentListMap!4034 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1065203 (= lt!469621 (getCurrentListMap!4034 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065204 () Bool)

(assert (=> b!1065204 (= e!607206 (= lt!469622 lt!469618))))

(declare-fun b!1065205 () Bool)

(assert (=> b!1065205 (= e!607208 tp_is_empty!25389)))

(assert (= (and start!94194 res!711031) b!1065202))

(assert (= (and b!1065202 res!711032) b!1065198))

(assert (= (and b!1065198 res!711034) b!1065201))

(assert (= (and b!1065201 res!711036) b!1065197))

(assert (= (and b!1065197 (not res!711035)) b!1065203))

(assert (= (and b!1065203 res!711033) b!1065204))

(assert (= (and b!1065200 condMapEmpty!39769) mapIsEmpty!39769))

(assert (= (and b!1065200 (not condMapEmpty!39769)) mapNonEmpty!39769))

(get-info :version)

(assert (= (and mapNonEmpty!39769 ((_ is ValueCellFull!11991) mapValue!39769)) b!1065205))

(assert (= (and b!1065200 ((_ is ValueCellFull!11991) mapDefault!39769)) b!1065199))

(assert (= start!94194 b!1065200))

(declare-fun m!983607 () Bool)

(assert (=> mapNonEmpty!39769 m!983607))

(declare-fun m!983609 () Bool)

(assert (=> b!1065201 m!983609))

(declare-fun m!983611 () Bool)

(assert (=> start!94194 m!983611))

(declare-fun m!983613 () Bool)

(assert (=> start!94194 m!983613))

(declare-fun m!983615 () Bool)

(assert (=> start!94194 m!983615))

(declare-fun m!983617 () Bool)

(assert (=> b!1065198 m!983617))

(declare-fun m!983619 () Bool)

(assert (=> b!1065203 m!983619))

(declare-fun m!983621 () Bool)

(assert (=> b!1065203 m!983621))

(declare-fun m!983623 () Bool)

(assert (=> b!1065203 m!983623))

(declare-fun m!983625 () Bool)

(assert (=> b!1065203 m!983625))

(declare-fun m!983627 () Bool)

(assert (=> b!1065197 m!983627))

(declare-fun m!983629 () Bool)

(assert (=> b!1065197 m!983629))

(declare-fun m!983631 () Bool)

(assert (=> b!1065197 m!983631))

(check-sat (not b!1065197) b_and!34339 (not mapNonEmpty!39769) (not b!1065198) (not b!1065203) tp_is_empty!25389 (not start!94194) (not b_next!21579) (not b!1065201))
(check-sat b_and!34339 (not b_next!21579))
