; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94906 () Bool)

(assert start!94906)

(declare-fun b_free!22117 () Bool)

(declare-fun b_next!22117 () Bool)

(assert (=> start!94906 (= b_free!22117 (not b_next!22117))))

(declare-fun tp!77815 () Bool)

(declare-fun b_and!34945 () Bool)

(assert (=> start!94906 (= tp!77815 b_and!34945)))

(declare-fun b!1073021 () Bool)

(declare-fun e!612979 () Bool)

(assert (=> b!1073021 (= e!612979 false)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39705 0))(
  ( (V!39706 (val!13014 Int)) )
))
(declare-datatypes ((ValueCell!12260 0))(
  ( (ValueCellFull!12260 (v!15631 V!39705)) (EmptyCell!12260) )
))
(declare-datatypes ((array!68758 0))(
  ( (array!68759 (arr!33073 (Array (_ BitVec 32) ValueCell!12260)) (size!33611 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68758)

(declare-fun minValue!907 () V!39705)

(declare-datatypes ((tuple2!16636 0))(
  ( (tuple2!16637 (_1!8329 (_ BitVec 64)) (_2!8329 V!39705)) )
))
(declare-datatypes ((List!23161 0))(
  ( (Nil!23158) (Cons!23157 (h!24366 tuple2!16636) (t!32489 List!23161)) )
))
(declare-datatypes ((ListLongMap!14605 0))(
  ( (ListLongMap!14606 (toList!7318 List!23161)) )
))
(declare-fun lt!475771 () ListLongMap!14605)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39705)

(declare-datatypes ((array!68760 0))(
  ( (array!68761 (arr!33074 (Array (_ BitVec 32) (_ BitVec 64))) (size!33612 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68760)

(declare-fun getCurrentListMapNoExtraKeys!3898 (array!68760 array!68758 (_ BitVec 32) (_ BitVec 32) V!39705 V!39705 (_ BitVec 32) Int) ListLongMap!14605)

(assert (=> b!1073021 (= lt!475771 (getCurrentListMapNoExtraKeys!3898 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39705)

(declare-fun lt!475772 () ListLongMap!14605)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073021 (= lt!475772 (getCurrentListMapNoExtraKeys!3898 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073022 () Bool)

(declare-fun res!715722 () Bool)

(assert (=> b!1073022 (=> (not res!715722) (not e!612979))))

(declare-datatypes ((List!23162 0))(
  ( (Nil!23159) (Cons!23158 (h!24367 (_ BitVec 64)) (t!32490 List!23162)) )
))
(declare-fun arrayNoDuplicates!0 (array!68760 (_ BitVec 32) List!23162) Bool)

(assert (=> b!1073022 (= res!715722 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23159))))

(declare-fun mapIsEmpty!40603 () Bool)

(declare-fun mapRes!40603 () Bool)

(assert (=> mapIsEmpty!40603 mapRes!40603))

(declare-fun b!1073023 () Bool)

(declare-fun e!612976 () Bool)

(declare-fun tp_is_empty!25927 () Bool)

(assert (=> b!1073023 (= e!612976 tp_is_empty!25927)))

(declare-fun res!715721 () Bool)

(assert (=> start!94906 (=> (not res!715721) (not e!612979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94906 (= res!715721 (validMask!0 mask!1515))))

(assert (=> start!94906 e!612979))

(assert (=> start!94906 true))

(assert (=> start!94906 tp_is_empty!25927))

(declare-fun e!612978 () Bool)

(declare-fun array_inv!25588 (array!68758) Bool)

(assert (=> start!94906 (and (array_inv!25588 _values!955) e!612978)))

(assert (=> start!94906 tp!77815))

(declare-fun array_inv!25589 (array!68760) Bool)

(assert (=> start!94906 (array_inv!25589 _keys!1163)))

(declare-fun b!1073024 () Bool)

(assert (=> b!1073024 (= e!612978 (and e!612976 mapRes!40603))))

(declare-fun condMapEmpty!40603 () Bool)

(declare-fun mapDefault!40603 () ValueCell!12260)

(assert (=> b!1073024 (= condMapEmpty!40603 (= (arr!33073 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12260)) mapDefault!40603)))))

(declare-fun b!1073025 () Bool)

(declare-fun e!612977 () Bool)

(assert (=> b!1073025 (= e!612977 tp_is_empty!25927)))

(declare-fun b!1073026 () Bool)

(declare-fun res!715720 () Bool)

(assert (=> b!1073026 (=> (not res!715720) (not e!612979))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68760 (_ BitVec 32)) Bool)

(assert (=> b!1073026 (= res!715720 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!40603 () Bool)

(declare-fun tp!77816 () Bool)

(assert (=> mapNonEmpty!40603 (= mapRes!40603 (and tp!77816 e!612977))))

(declare-fun mapValue!40603 () ValueCell!12260)

(declare-fun mapKey!40603 () (_ BitVec 32))

(declare-fun mapRest!40603 () (Array (_ BitVec 32) ValueCell!12260))

(assert (=> mapNonEmpty!40603 (= (arr!33073 _values!955) (store mapRest!40603 mapKey!40603 mapValue!40603))))

(declare-fun b!1073027 () Bool)

(declare-fun res!715723 () Bool)

(assert (=> b!1073027 (=> (not res!715723) (not e!612979))))

(assert (=> b!1073027 (= res!715723 (and (= (size!33611 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33612 _keys!1163) (size!33611 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94906 res!715721) b!1073027))

(assert (= (and b!1073027 res!715723) b!1073026))

(assert (= (and b!1073026 res!715720) b!1073022))

(assert (= (and b!1073022 res!715722) b!1073021))

(assert (= (and b!1073024 condMapEmpty!40603) mapIsEmpty!40603))

(assert (= (and b!1073024 (not condMapEmpty!40603)) mapNonEmpty!40603))

(get-info :version)

(assert (= (and mapNonEmpty!40603 ((_ is ValueCellFull!12260) mapValue!40603)) b!1073025))

(assert (= (and b!1073024 ((_ is ValueCellFull!12260) mapDefault!40603)) b!1073023))

(assert (= start!94906 b!1073024))

(declare-fun m!991597 () Bool)

(assert (=> b!1073021 m!991597))

(declare-fun m!991599 () Bool)

(assert (=> b!1073021 m!991599))

(declare-fun m!991601 () Bool)

(assert (=> b!1073022 m!991601))

(declare-fun m!991603 () Bool)

(assert (=> mapNonEmpty!40603 m!991603))

(declare-fun m!991605 () Bool)

(assert (=> b!1073026 m!991605))

(declare-fun m!991607 () Bool)

(assert (=> start!94906 m!991607))

(declare-fun m!991609 () Bool)

(assert (=> start!94906 m!991609))

(declare-fun m!991611 () Bool)

(assert (=> start!94906 m!991611))

(check-sat (not b!1073022) b_and!34945 (not b_next!22117) (not start!94906) (not b!1073026) (not b!1073021) (not mapNonEmpty!40603) tp_is_empty!25927)
(check-sat b_and!34945 (not b_next!22117))
