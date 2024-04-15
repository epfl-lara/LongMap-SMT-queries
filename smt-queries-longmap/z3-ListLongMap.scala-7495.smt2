; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94936 () Bool)

(assert start!94936)

(declare-fun b_free!22147 () Bool)

(declare-fun b_next!22147 () Bool)

(assert (=> start!94936 (= b_free!22147 (not b_next!22147))))

(declare-fun tp!77906 () Bool)

(declare-fun b_and!34975 () Bool)

(assert (=> start!94936 (= tp!77906 b_and!34975)))

(declare-fun b!1073336 () Bool)

(declare-fun res!715903 () Bool)

(declare-fun e!613201 () Bool)

(assert (=> b!1073336 (=> (not res!715903) (not e!613201))))

(declare-datatypes ((array!68810 0))(
  ( (array!68811 (arr!33099 (Array (_ BitVec 32) (_ BitVec 64))) (size!33637 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68810)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68810 (_ BitVec 32)) Bool)

(assert (=> b!1073336 (= res!715903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!715902 () Bool)

(assert (=> start!94936 (=> (not res!715902) (not e!613201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94936 (= res!715902 (validMask!0 mask!1515))))

(assert (=> start!94936 e!613201))

(assert (=> start!94936 true))

(declare-fun tp_is_empty!25957 () Bool)

(assert (=> start!94936 tp_is_empty!25957))

(declare-datatypes ((V!39745 0))(
  ( (V!39746 (val!13029 Int)) )
))
(declare-datatypes ((ValueCell!12275 0))(
  ( (ValueCellFull!12275 (v!15646 V!39745)) (EmptyCell!12275) )
))
(declare-datatypes ((array!68812 0))(
  ( (array!68813 (arr!33100 (Array (_ BitVec 32) ValueCell!12275)) (size!33638 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68812)

(declare-fun e!613202 () Bool)

(declare-fun array_inv!25608 (array!68812) Bool)

(assert (=> start!94936 (and (array_inv!25608 _values!955) e!613202)))

(assert (=> start!94936 tp!77906))

(declare-fun array_inv!25609 (array!68810) Bool)

(assert (=> start!94936 (array_inv!25609 _keys!1163)))

(declare-fun mapIsEmpty!40648 () Bool)

(declare-fun mapRes!40648 () Bool)

(assert (=> mapIsEmpty!40648 mapRes!40648))

(declare-fun b!1073337 () Bool)

(assert (=> b!1073337 (= e!613201 false)))

(declare-datatypes ((tuple2!16656 0))(
  ( (tuple2!16657 (_1!8339 (_ BitVec 64)) (_2!8339 V!39745)) )
))
(declare-datatypes ((List!23180 0))(
  ( (Nil!23177) (Cons!23176 (h!24385 tuple2!16656) (t!32508 List!23180)) )
))
(declare-datatypes ((ListLongMap!14625 0))(
  ( (ListLongMap!14626 (toList!7328 List!23180)) )
))
(declare-fun lt!475862 () ListLongMap!14625)

(declare-fun minValue!907 () V!39745)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39745)

(declare-fun getCurrentListMapNoExtraKeys!3908 (array!68810 array!68812 (_ BitVec 32) (_ BitVec 32) V!39745 V!39745 (_ BitVec 32) Int) ListLongMap!14625)

(assert (=> b!1073337 (= lt!475862 (getCurrentListMapNoExtraKeys!3908 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39745)

(declare-fun lt!475861 () ListLongMap!14625)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073337 (= lt!475861 (getCurrentListMapNoExtraKeys!3908 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073338 () Bool)

(declare-fun res!715900 () Bool)

(assert (=> b!1073338 (=> (not res!715900) (not e!613201))))

(declare-datatypes ((List!23181 0))(
  ( (Nil!23178) (Cons!23177 (h!24386 (_ BitVec 64)) (t!32509 List!23181)) )
))
(declare-fun arrayNoDuplicates!0 (array!68810 (_ BitVec 32) List!23181) Bool)

(assert (=> b!1073338 (= res!715900 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23178))))

(declare-fun b!1073339 () Bool)

(declare-fun res!715901 () Bool)

(assert (=> b!1073339 (=> (not res!715901) (not e!613201))))

(assert (=> b!1073339 (= res!715901 (and (= (size!33638 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33637 _keys!1163) (size!33638 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1073340 () Bool)

(declare-fun e!613204 () Bool)

(assert (=> b!1073340 (= e!613204 tp_is_empty!25957)))

(declare-fun mapNonEmpty!40648 () Bool)

(declare-fun tp!77905 () Bool)

(assert (=> mapNonEmpty!40648 (= mapRes!40648 (and tp!77905 e!613204))))

(declare-fun mapKey!40648 () (_ BitVec 32))

(declare-fun mapRest!40648 () (Array (_ BitVec 32) ValueCell!12275))

(declare-fun mapValue!40648 () ValueCell!12275)

(assert (=> mapNonEmpty!40648 (= (arr!33100 _values!955) (store mapRest!40648 mapKey!40648 mapValue!40648))))

(declare-fun b!1073341 () Bool)

(declare-fun e!613205 () Bool)

(assert (=> b!1073341 (= e!613205 tp_is_empty!25957)))

(declare-fun b!1073342 () Bool)

(assert (=> b!1073342 (= e!613202 (and e!613205 mapRes!40648))))

(declare-fun condMapEmpty!40648 () Bool)

(declare-fun mapDefault!40648 () ValueCell!12275)

(assert (=> b!1073342 (= condMapEmpty!40648 (= (arr!33100 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12275)) mapDefault!40648)))))

(assert (= (and start!94936 res!715902) b!1073339))

(assert (= (and b!1073339 res!715901) b!1073336))

(assert (= (and b!1073336 res!715903) b!1073338))

(assert (= (and b!1073338 res!715900) b!1073337))

(assert (= (and b!1073342 condMapEmpty!40648) mapIsEmpty!40648))

(assert (= (and b!1073342 (not condMapEmpty!40648)) mapNonEmpty!40648))

(get-info :version)

(assert (= (and mapNonEmpty!40648 ((_ is ValueCellFull!12275) mapValue!40648)) b!1073340))

(assert (= (and b!1073342 ((_ is ValueCellFull!12275) mapDefault!40648)) b!1073341))

(assert (= start!94936 b!1073342))

(declare-fun m!991837 () Bool)

(assert (=> b!1073337 m!991837))

(declare-fun m!991839 () Bool)

(assert (=> b!1073337 m!991839))

(declare-fun m!991841 () Bool)

(assert (=> start!94936 m!991841))

(declare-fun m!991843 () Bool)

(assert (=> start!94936 m!991843))

(declare-fun m!991845 () Bool)

(assert (=> start!94936 m!991845))

(declare-fun m!991847 () Bool)

(assert (=> b!1073336 m!991847))

(declare-fun m!991849 () Bool)

(assert (=> b!1073338 m!991849))

(declare-fun m!991851 () Bool)

(assert (=> mapNonEmpty!40648 m!991851))

(check-sat (not b!1073338) tp_is_empty!25957 (not start!94936) (not b_next!22147) (not b!1073337) (not mapNonEmpty!40648) b_and!34975 (not b!1073336))
(check-sat b_and!34975 (not b_next!22147))
