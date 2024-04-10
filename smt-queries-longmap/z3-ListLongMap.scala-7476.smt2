; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94806 () Bool)

(assert start!94806)

(declare-fun b_free!22035 () Bool)

(declare-fun b_next!22035 () Bool)

(assert (=> start!94806 (= b_free!22035 (not b_next!22035))))

(declare-fun tp!77567 () Bool)

(declare-fun b_and!34877 () Bool)

(assert (=> start!94806 (= tp!77567 b_and!34877)))

(declare-fun b!1071969 () Bool)

(declare-fun e!612183 () Bool)

(declare-fun tp_is_empty!25845 () Bool)

(assert (=> b!1071969 (= e!612183 tp_is_empty!25845)))

(declare-fun b!1071970 () Bool)

(declare-fun e!612182 () Bool)

(declare-fun mapRes!40477 () Bool)

(assert (=> b!1071970 (= e!612182 (and e!612183 mapRes!40477))))

(declare-fun condMapEmpty!40477 () Bool)

(declare-datatypes ((V!39595 0))(
  ( (V!39596 (val!12973 Int)) )
))
(declare-datatypes ((ValueCell!12219 0))(
  ( (ValueCellFull!12219 (v!15590 V!39595)) (EmptyCell!12219) )
))
(declare-datatypes ((array!68661 0))(
  ( (array!68662 (arr!33025 (Array (_ BitVec 32) ValueCell!12219)) (size!33561 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68661)

(declare-fun mapDefault!40477 () ValueCell!12219)

(assert (=> b!1071970 (= condMapEmpty!40477 (= (arr!33025 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12219)) mapDefault!40477)))))

(declare-fun res!715057 () Bool)

(declare-fun e!612180 () Bool)

(assert (=> start!94806 (=> (not res!715057) (not e!612180))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94806 (= res!715057 (validMask!0 mask!1515))))

(assert (=> start!94806 e!612180))

(assert (=> start!94806 true))

(assert (=> start!94806 tp_is_empty!25845))

(declare-fun array_inv!25534 (array!68661) Bool)

(assert (=> start!94806 (and (array_inv!25534 _values!955) e!612182)))

(assert (=> start!94806 tp!77567))

(declare-datatypes ((array!68663 0))(
  ( (array!68664 (arr!33026 (Array (_ BitVec 32) (_ BitVec 64))) (size!33562 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68663)

(declare-fun array_inv!25535 (array!68663) Bool)

(assert (=> start!94806 (array_inv!25535 _keys!1163)))

(declare-datatypes ((tuple2!16518 0))(
  ( (tuple2!16519 (_1!8270 (_ BitVec 64)) (_2!8270 V!39595)) )
))
(declare-datatypes ((List!23053 0))(
  ( (Nil!23050) (Cons!23049 (h!24258 tuple2!16518) (t!32388 List!23053)) )
))
(declare-datatypes ((ListLongMap!14487 0))(
  ( (ListLongMap!14488 (toList!7259 List!23053)) )
))
(declare-fun lt!474735 () ListLongMap!14487)

(declare-fun lt!474725 () ListLongMap!14487)

(declare-fun lt!474730 () tuple2!16518)

(declare-fun b!1071971 () Bool)

(declare-fun e!612184 () Bool)

(declare-fun +!3194 (ListLongMap!14487 tuple2!16518) ListLongMap!14487)

(assert (=> b!1071971 (= e!612184 (= lt!474725 (+!3194 lt!474735 lt!474730)))))

(declare-fun b!1071972 () Bool)

(declare-fun res!715055 () Bool)

(assert (=> b!1071972 (=> (not res!715055) (not e!612180))))

(declare-datatypes ((List!23054 0))(
  ( (Nil!23051) (Cons!23050 (h!24259 (_ BitVec 64)) (t!32389 List!23054)) )
))
(declare-fun arrayNoDuplicates!0 (array!68663 (_ BitVec 32) List!23054) Bool)

(assert (=> b!1071972 (= res!715055 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23051))))

(declare-fun b!1071973 () Bool)

(declare-fun e!612181 () Bool)

(assert (=> b!1071973 (= e!612180 (not e!612181))))

(declare-fun res!715056 () Bool)

(assert (=> b!1071973 (=> res!715056 e!612181)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071973 (= res!715056 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!474728 () ListLongMap!14487)

(assert (=> b!1071973 (= lt!474728 lt!474735)))

(declare-fun zeroValueBefore!47 () V!39595)

(declare-datatypes ((Unit!35314 0))(
  ( (Unit!35315) )
))
(declare-fun lt!474733 () Unit!35314)

(declare-fun minValue!907 () V!39595)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39595)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!863 (array!68663 array!68661 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39595 V!39595 V!39595 V!39595 (_ BitVec 32) Int) Unit!35314)

(assert (=> b!1071973 (= lt!474733 (lemmaNoChangeToArrayThenSameMapNoExtras!863 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3826 (array!68663 array!68661 (_ BitVec 32) (_ BitVec 32) V!39595 V!39595 (_ BitVec 32) Int) ListLongMap!14487)

(assert (=> b!1071973 (= lt!474735 (getCurrentListMapNoExtraKeys!3826 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071973 (= lt!474728 (getCurrentListMapNoExtraKeys!3826 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!40477 () Bool)

(declare-fun tp!77566 () Bool)

(declare-fun e!612185 () Bool)

(assert (=> mapNonEmpty!40477 (= mapRes!40477 (and tp!77566 e!612185))))

(declare-fun mapKey!40477 () (_ BitVec 32))

(declare-fun mapValue!40477 () ValueCell!12219)

(declare-fun mapRest!40477 () (Array (_ BitVec 32) ValueCell!12219))

(assert (=> mapNonEmpty!40477 (= (arr!33025 _values!955) (store mapRest!40477 mapKey!40477 mapValue!40477))))

(declare-fun b!1071974 () Bool)

(assert (=> b!1071974 (= e!612181 true)))

(declare-fun lt!474734 () ListLongMap!14487)

(declare-fun lt!474726 () ListLongMap!14487)

(declare-fun -!690 (ListLongMap!14487 (_ BitVec 64)) ListLongMap!14487)

(assert (=> b!1071974 (= lt!474734 (-!690 lt!474726 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!474729 () ListLongMap!14487)

(declare-fun lt!474732 () ListLongMap!14487)

(assert (=> b!1071974 (= lt!474729 lt!474732)))

(declare-fun lt!474731 () Unit!35314)

(declare-fun addCommutativeForDiffKeys!735 (ListLongMap!14487 (_ BitVec 64) V!39595 (_ BitVec 64) V!39595) Unit!35314)

(assert (=> b!1071974 (= lt!474731 (addCommutativeForDiffKeys!735 lt!474728 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!474724 () ListLongMap!14487)

(assert (=> b!1071974 (= (-!690 lt!474732 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474724)))

(declare-fun lt!474723 () tuple2!16518)

(assert (=> b!1071974 (= lt!474732 (+!3194 lt!474724 lt!474723))))

(declare-fun lt!474727 () Unit!35314)

(declare-fun addThenRemoveForNewKeyIsSame!60 (ListLongMap!14487 (_ BitVec 64) V!39595) Unit!35314)

(assert (=> b!1071974 (= lt!474727 (addThenRemoveForNewKeyIsSame!60 lt!474724 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1071974 (= lt!474724 (+!3194 lt!474728 lt!474730))))

(assert (=> b!1071974 e!612184))

(declare-fun res!715058 () Bool)

(assert (=> b!1071974 (=> (not res!715058) (not e!612184))))

(assert (=> b!1071974 (= res!715058 (= lt!474726 lt!474729))))

(assert (=> b!1071974 (= lt!474729 (+!3194 (+!3194 lt!474728 lt!474723) lt!474730))))

(assert (=> b!1071974 (= lt!474730 (tuple2!16519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1071974 (= lt!474723 (tuple2!16519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun getCurrentListMap!4156 (array!68663 array!68661 (_ BitVec 32) (_ BitVec 32) V!39595 V!39595 (_ BitVec 32) Int) ListLongMap!14487)

(assert (=> b!1071974 (= lt!474725 (getCurrentListMap!4156 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071974 (= lt!474726 (getCurrentListMap!4156 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071975 () Bool)

(declare-fun res!715060 () Bool)

(assert (=> b!1071975 (=> (not res!715060) (not e!612180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68663 (_ BitVec 32)) Bool)

(assert (=> b!1071975 (= res!715060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1071976 () Bool)

(declare-fun res!715059 () Bool)

(assert (=> b!1071976 (=> (not res!715059) (not e!612180))))

(assert (=> b!1071976 (= res!715059 (and (= (size!33561 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33562 _keys!1163) (size!33561 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1071977 () Bool)

(assert (=> b!1071977 (= e!612185 tp_is_empty!25845)))

(declare-fun mapIsEmpty!40477 () Bool)

(assert (=> mapIsEmpty!40477 mapRes!40477))

(assert (= (and start!94806 res!715057) b!1071976))

(assert (= (and b!1071976 res!715059) b!1071975))

(assert (= (and b!1071975 res!715060) b!1071972))

(assert (= (and b!1071972 res!715055) b!1071973))

(assert (= (and b!1071973 (not res!715056)) b!1071974))

(assert (= (and b!1071974 res!715058) b!1071971))

(assert (= (and b!1071970 condMapEmpty!40477) mapIsEmpty!40477))

(assert (= (and b!1071970 (not condMapEmpty!40477)) mapNonEmpty!40477))

(get-info :version)

(assert (= (and mapNonEmpty!40477 ((_ is ValueCellFull!12219) mapValue!40477)) b!1071977))

(assert (= (and b!1071970 ((_ is ValueCellFull!12219) mapDefault!40477)) b!1071969))

(assert (= start!94806 b!1071970))

(declare-fun m!990693 () Bool)

(assert (=> b!1071974 m!990693))

(declare-fun m!990695 () Bool)

(assert (=> b!1071974 m!990695))

(declare-fun m!990697 () Bool)

(assert (=> b!1071974 m!990697))

(declare-fun m!990699 () Bool)

(assert (=> b!1071974 m!990699))

(declare-fun m!990701 () Bool)

(assert (=> b!1071974 m!990701))

(declare-fun m!990703 () Bool)

(assert (=> b!1071974 m!990703))

(declare-fun m!990705 () Bool)

(assert (=> b!1071974 m!990705))

(assert (=> b!1071974 m!990695))

(declare-fun m!990707 () Bool)

(assert (=> b!1071974 m!990707))

(declare-fun m!990709 () Bool)

(assert (=> b!1071974 m!990709))

(declare-fun m!990711 () Bool)

(assert (=> b!1071974 m!990711))

(declare-fun m!990713 () Bool)

(assert (=> b!1071973 m!990713))

(declare-fun m!990715 () Bool)

(assert (=> b!1071973 m!990715))

(declare-fun m!990717 () Bool)

(assert (=> b!1071973 m!990717))

(declare-fun m!990719 () Bool)

(assert (=> b!1071972 m!990719))

(declare-fun m!990721 () Bool)

(assert (=> b!1071975 m!990721))

(declare-fun m!990723 () Bool)

(assert (=> b!1071971 m!990723))

(declare-fun m!990725 () Bool)

(assert (=> start!94806 m!990725))

(declare-fun m!990727 () Bool)

(assert (=> start!94806 m!990727))

(declare-fun m!990729 () Bool)

(assert (=> start!94806 m!990729))

(declare-fun m!990731 () Bool)

(assert (=> mapNonEmpty!40477 m!990731))

(check-sat (not b!1071975) (not b!1071974) (not b!1071971) (not b!1071973) tp_is_empty!25845 b_and!34877 (not mapNonEmpty!40477) (not start!94806) (not b_next!22035) (not b!1071972))
(check-sat b_and!34877 (not b_next!22035))
