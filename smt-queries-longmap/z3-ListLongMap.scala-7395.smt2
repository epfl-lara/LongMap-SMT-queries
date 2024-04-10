; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94148 () Bool)

(assert start!94148)

(declare-fun b_free!21549 () Bool)

(declare-fun b_next!21549 () Bool)

(assert (=> start!94148 (= b_free!21549 (not b_next!21549))))

(declare-fun tp!76081 () Bool)

(declare-fun b_and!34299 () Bool)

(assert (=> start!94148 (= tp!76081 b_and!34299)))

(declare-fun mapIsEmpty!39721 () Bool)

(declare-fun mapRes!39721 () Bool)

(assert (=> mapIsEmpty!39721 mapRes!39721))

(declare-fun b!1064684 () Bool)

(declare-fun e!606838 () Bool)

(declare-fun e!606836 () Bool)

(assert (=> b!1064684 (= e!606838 (and e!606836 mapRes!39721))))

(declare-fun condMapEmpty!39721 () Bool)

(declare-datatypes ((V!38947 0))(
  ( (V!38948 (val!12730 Int)) )
))
(declare-datatypes ((ValueCell!11976 0))(
  ( (ValueCellFull!11976 (v!15342 V!38947)) (EmptyCell!11976) )
))
(declare-datatypes ((array!67705 0))(
  ( (array!67706 (arr!32556 (Array (_ BitVec 32) ValueCell!11976)) (size!33092 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67705)

(declare-fun mapDefault!39721 () ValueCell!11976)

(assert (=> b!1064684 (= condMapEmpty!39721 (= (arr!32556 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11976)) mapDefault!39721)))))

(declare-fun b!1064685 () Bool)

(declare-fun e!606837 () Bool)

(assert (=> b!1064685 (= e!606837 true)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38947)

(declare-datatypes ((tuple2!16124 0))(
  ( (tuple2!16125 (_1!8073 (_ BitVec 64)) (_2!8073 V!38947)) )
))
(declare-datatypes ((List!22695 0))(
  ( (Nil!22692) (Cons!22691 (h!23900 tuple2!16124) (t!32012 List!22695)) )
))
(declare-datatypes ((ListLongMap!14093 0))(
  ( (ListLongMap!14094 (toList!7062 List!22695)) )
))
(declare-fun lt!469322 () ListLongMap!14093)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38947)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67707 0))(
  ( (array!67708 (arr!32557 (Array (_ BitVec 32) (_ BitVec 64))) (size!33093 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67707)

(declare-fun getCurrentListMap!4022 (array!67707 array!67705 (_ BitVec 32) (_ BitVec 32) V!38947 V!38947 (_ BitVec 32) Int) ListLongMap!14093)

(assert (=> b!1064685 (= lt!469322 (getCurrentListMap!4022 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064686 () Bool)

(declare-fun e!606834 () Bool)

(assert (=> b!1064686 (= e!606834 (not e!606837))))

(declare-fun res!710745 () Bool)

(assert (=> b!1064686 (=> res!710745 e!606837)))

(assert (=> b!1064686 (= res!710745 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!469323 () ListLongMap!14093)

(declare-fun lt!469325 () ListLongMap!14093)

(assert (=> b!1064686 (= lt!469323 lt!469325)))

(declare-datatypes ((Unit!34920 0))(
  ( (Unit!34921) )
))
(declare-fun lt!469324 () Unit!34920)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!38947)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!689 (array!67707 array!67705 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38947 V!38947 V!38947 V!38947 (_ BitVec 32) Int) Unit!34920)

(assert (=> b!1064686 (= lt!469324 (lemmaNoChangeToArrayThenSameMapNoExtras!689 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3652 (array!67707 array!67705 (_ BitVec 32) (_ BitVec 32) V!38947 V!38947 (_ BitVec 32) Int) ListLongMap!14093)

(assert (=> b!1064686 (= lt!469325 (getCurrentListMapNoExtraKeys!3652 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064686 (= lt!469323 (getCurrentListMapNoExtraKeys!3652 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064687 () Bool)

(declare-fun res!710747 () Bool)

(assert (=> b!1064687 (=> (not res!710747) (not e!606834))))

(declare-datatypes ((List!22696 0))(
  ( (Nil!22693) (Cons!22692 (h!23901 (_ BitVec 64)) (t!32013 List!22696)) )
))
(declare-fun arrayNoDuplicates!0 (array!67707 (_ BitVec 32) List!22696) Bool)

(assert (=> b!1064687 (= res!710747 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22693))))

(declare-fun res!710746 () Bool)

(assert (=> start!94148 (=> (not res!710746) (not e!606834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94148 (= res!710746 (validMask!0 mask!1515))))

(assert (=> start!94148 e!606834))

(assert (=> start!94148 true))

(declare-fun tp_is_empty!25359 () Bool)

(assert (=> start!94148 tp_is_empty!25359))

(declare-fun array_inv!25210 (array!67705) Bool)

(assert (=> start!94148 (and (array_inv!25210 _values!955) e!606838)))

(assert (=> start!94148 tp!76081))

(declare-fun array_inv!25211 (array!67707) Bool)

(assert (=> start!94148 (array_inv!25211 _keys!1163)))

(declare-fun b!1064688 () Bool)

(assert (=> b!1064688 (= e!606836 tp_is_empty!25359)))

(declare-fun b!1064689 () Bool)

(declare-fun res!710744 () Bool)

(assert (=> b!1064689 (=> (not res!710744) (not e!606834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67707 (_ BitVec 32)) Bool)

(assert (=> b!1064689 (= res!710744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39721 () Bool)

(declare-fun tp!76082 () Bool)

(declare-fun e!606835 () Bool)

(assert (=> mapNonEmpty!39721 (= mapRes!39721 (and tp!76082 e!606835))))

(declare-fun mapKey!39721 () (_ BitVec 32))

(declare-fun mapRest!39721 () (Array (_ BitVec 32) ValueCell!11976))

(declare-fun mapValue!39721 () ValueCell!11976)

(assert (=> mapNonEmpty!39721 (= (arr!32556 _values!955) (store mapRest!39721 mapKey!39721 mapValue!39721))))

(declare-fun b!1064690 () Bool)

(assert (=> b!1064690 (= e!606835 tp_is_empty!25359)))

(declare-fun b!1064691 () Bool)

(declare-fun res!710743 () Bool)

(assert (=> b!1064691 (=> (not res!710743) (not e!606834))))

(assert (=> b!1064691 (= res!710743 (and (= (size!33092 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33093 _keys!1163) (size!33092 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94148 res!710746) b!1064691))

(assert (= (and b!1064691 res!710743) b!1064689))

(assert (= (and b!1064689 res!710744) b!1064687))

(assert (= (and b!1064687 res!710747) b!1064686))

(assert (= (and b!1064686 (not res!710745)) b!1064685))

(assert (= (and b!1064684 condMapEmpty!39721) mapIsEmpty!39721))

(assert (= (and b!1064684 (not condMapEmpty!39721)) mapNonEmpty!39721))

(get-info :version)

(assert (= (and mapNonEmpty!39721 ((_ is ValueCellFull!11976) mapValue!39721)) b!1064690))

(assert (= (and b!1064684 ((_ is ValueCellFull!11976) mapDefault!39721)) b!1064688))

(assert (= start!94148 b!1064684))

(declare-fun m!983189 () Bool)

(assert (=> start!94148 m!983189))

(declare-fun m!983191 () Bool)

(assert (=> start!94148 m!983191))

(declare-fun m!983193 () Bool)

(assert (=> start!94148 m!983193))

(declare-fun m!983195 () Bool)

(assert (=> b!1064687 m!983195))

(declare-fun m!983197 () Bool)

(assert (=> mapNonEmpty!39721 m!983197))

(declare-fun m!983199 () Bool)

(assert (=> b!1064686 m!983199))

(declare-fun m!983201 () Bool)

(assert (=> b!1064686 m!983201))

(declare-fun m!983203 () Bool)

(assert (=> b!1064686 m!983203))

(declare-fun m!983205 () Bool)

(assert (=> b!1064689 m!983205))

(declare-fun m!983207 () Bool)

(assert (=> b!1064685 m!983207))

(check-sat (not start!94148) (not b_next!21549) (not b!1064686) (not b!1064689) b_and!34299 (not mapNonEmpty!39721) (not b!1064685) tp_is_empty!25359 (not b!1064687))
(check-sat b_and!34299 (not b_next!21549))
