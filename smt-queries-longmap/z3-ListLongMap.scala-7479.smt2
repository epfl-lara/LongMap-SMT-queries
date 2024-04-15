; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94816 () Bool)

(assert start!94816)

(declare-fun b_free!22051 () Bool)

(declare-fun b_next!22051 () Bool)

(assert (=> start!94816 (= b_free!22051 (not b_next!22051))))

(declare-fun tp!77614 () Bool)

(declare-fun b_and!34867 () Bool)

(assert (=> start!94816 (= tp!77614 b_and!34867)))

(declare-fun b!1072032 () Bool)

(declare-fun res!715134 () Bool)

(declare-fun e!612256 () Bool)

(assert (=> b!1072032 (=> (not res!715134) (not e!612256))))

(declare-datatypes ((array!68630 0))(
  ( (array!68631 (arr!33010 (Array (_ BitVec 32) (_ BitVec 64))) (size!33548 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68630)

(declare-datatypes ((List!23106 0))(
  ( (Nil!23103) (Cons!23102 (h!24311 (_ BitVec 64)) (t!32432 List!23106)) )
))
(declare-fun arrayNoDuplicates!0 (array!68630 (_ BitVec 32) List!23106) Bool)

(assert (=> b!1072032 (= res!715134 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23103))))

(declare-fun b!1072033 () Bool)

(declare-fun e!612259 () Bool)

(declare-fun tp_is_empty!25861 () Bool)

(assert (=> b!1072033 (= e!612259 tp_is_empty!25861)))

(declare-fun b!1072034 () Bool)

(declare-fun e!612254 () Bool)

(assert (=> b!1072034 (= e!612254 true)))

(declare-datatypes ((V!39617 0))(
  ( (V!39618 (val!12981 Int)) )
))
(declare-datatypes ((tuple2!16582 0))(
  ( (tuple2!16583 (_1!8302 (_ BitVec 64)) (_2!8302 V!39617)) )
))
(declare-datatypes ((List!23107 0))(
  ( (Nil!23104) (Cons!23103 (h!24312 tuple2!16582) (t!32433 List!23107)) )
))
(declare-datatypes ((ListLongMap!14551 0))(
  ( (ListLongMap!14552 (toList!7291 List!23107)) )
))
(declare-fun lt!474844 () ListLongMap!14551)

(declare-fun lt!474846 () ListLongMap!14551)

(declare-fun -!680 (ListLongMap!14551 (_ BitVec 64)) ListLongMap!14551)

(assert (=> b!1072034 (= lt!474844 (-!680 lt!474846 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!474840 () ListLongMap!14551)

(declare-fun lt!474847 () ListLongMap!14551)

(assert (=> b!1072034 (= lt!474840 lt!474847)))

(declare-fun zeroValueBefore!47 () V!39617)

(declare-fun lt!474843 () ListLongMap!14551)

(declare-datatypes ((Unit!35159 0))(
  ( (Unit!35160) )
))
(declare-fun lt!474837 () Unit!35159)

(declare-fun minValue!907 () V!39617)

(declare-fun addCommutativeForDiffKeys!738 (ListLongMap!14551 (_ BitVec 64) V!39617 (_ BitVec 64) V!39617) Unit!35159)

(assert (=> b!1072034 (= lt!474837 (addCommutativeForDiffKeys!738 lt!474843 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!474838 () ListLongMap!14551)

(assert (=> b!1072034 (= (-!680 lt!474847 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474838)))

(declare-fun lt!474835 () tuple2!16582)

(declare-fun +!3223 (ListLongMap!14551 tuple2!16582) ListLongMap!14551)

(assert (=> b!1072034 (= lt!474847 (+!3223 lt!474838 lt!474835))))

(declare-fun lt!474839 () Unit!35159)

(declare-fun addThenRemoveForNewKeyIsSame!61 (ListLongMap!14551 (_ BitVec 64) V!39617) Unit!35159)

(assert (=> b!1072034 (= lt!474839 (addThenRemoveForNewKeyIsSame!61 lt!474838 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!474841 () tuple2!16582)

(assert (=> b!1072034 (= lt!474838 (+!3223 lt!474843 lt!474841))))

(declare-fun e!612260 () Bool)

(assert (=> b!1072034 e!612260))

(declare-fun res!715133 () Bool)

(assert (=> b!1072034 (=> (not res!715133) (not e!612260))))

(assert (=> b!1072034 (= res!715133 (= lt!474846 lt!474840))))

(assert (=> b!1072034 (= lt!474840 (+!3223 (+!3223 lt!474843 lt!474835) lt!474841))))

(assert (=> b!1072034 (= lt!474841 (tuple2!16583 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1072034 (= lt!474835 (tuple2!16583 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun lt!474842 () ListLongMap!14551)

(declare-datatypes ((ValueCell!12227 0))(
  ( (ValueCellFull!12227 (v!15597 V!39617)) (EmptyCell!12227) )
))
(declare-datatypes ((array!68632 0))(
  ( (array!68633 (arr!33011 (Array (_ BitVec 32) ValueCell!12227)) (size!33549 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68632)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39617)

(declare-fun getCurrentListMap!4093 (array!68630 array!68632 (_ BitVec 32) (_ BitVec 32) V!39617 V!39617 (_ BitVec 32) Int) ListLongMap!14551)

(assert (=> b!1072034 (= lt!474842 (getCurrentListMap!4093 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1072034 (= lt!474846 (getCurrentListMap!4093 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40501 () Bool)

(declare-fun mapRes!40501 () Bool)

(assert (=> mapIsEmpty!40501 mapRes!40501))

(declare-fun b!1072035 () Bool)

(assert (=> b!1072035 (= e!612256 (not e!612254))))

(declare-fun res!715131 () Bool)

(assert (=> b!1072035 (=> res!715131 e!612254)))

(assert (=> b!1072035 (= res!715131 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!474845 () ListLongMap!14551)

(assert (=> b!1072035 (= lt!474843 lt!474845)))

(declare-fun lt!474836 () Unit!35159)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!867 (array!68630 array!68632 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39617 V!39617 V!39617 V!39617 (_ BitVec 32) Int) Unit!35159)

(assert (=> b!1072035 (= lt!474836 (lemmaNoChangeToArrayThenSameMapNoExtras!867 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3873 (array!68630 array!68632 (_ BitVec 32) (_ BitVec 32) V!39617 V!39617 (_ BitVec 32) Int) ListLongMap!14551)

(assert (=> b!1072035 (= lt!474845 (getCurrentListMapNoExtraKeys!3873 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1072035 (= lt!474843 (getCurrentListMapNoExtraKeys!3873 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!715132 () Bool)

(assert (=> start!94816 (=> (not res!715132) (not e!612256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94816 (= res!715132 (validMask!0 mask!1515))))

(assert (=> start!94816 e!612256))

(assert (=> start!94816 true))

(assert (=> start!94816 tp_is_empty!25861))

(declare-fun e!612258 () Bool)

(declare-fun array_inv!25540 (array!68632) Bool)

(assert (=> start!94816 (and (array_inv!25540 _values!955) e!612258)))

(assert (=> start!94816 tp!77614))

(declare-fun array_inv!25541 (array!68630) Bool)

(assert (=> start!94816 (array_inv!25541 _keys!1163)))

(declare-fun b!1072036 () Bool)

(declare-fun res!715135 () Bool)

(assert (=> b!1072036 (=> (not res!715135) (not e!612256))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68630 (_ BitVec 32)) Bool)

(assert (=> b!1072036 (= res!715135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1072037 () Bool)

(declare-fun e!612255 () Bool)

(assert (=> b!1072037 (= e!612255 tp_is_empty!25861)))

(declare-fun b!1072038 () Bool)

(assert (=> b!1072038 (= e!612260 (= lt!474842 (+!3223 lt!474845 lt!474841)))))

(declare-fun mapNonEmpty!40501 () Bool)

(declare-fun tp!77615 () Bool)

(assert (=> mapNonEmpty!40501 (= mapRes!40501 (and tp!77615 e!612259))))

(declare-fun mapRest!40501 () (Array (_ BitVec 32) ValueCell!12227))

(declare-fun mapKey!40501 () (_ BitVec 32))

(declare-fun mapValue!40501 () ValueCell!12227)

(assert (=> mapNonEmpty!40501 (= (arr!33011 _values!955) (store mapRest!40501 mapKey!40501 mapValue!40501))))

(declare-fun b!1072039 () Bool)

(assert (=> b!1072039 (= e!612258 (and e!612255 mapRes!40501))))

(declare-fun condMapEmpty!40501 () Bool)

(declare-fun mapDefault!40501 () ValueCell!12227)

(assert (=> b!1072039 (= condMapEmpty!40501 (= (arr!33011 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12227)) mapDefault!40501)))))

(declare-fun b!1072040 () Bool)

(declare-fun res!715130 () Bool)

(assert (=> b!1072040 (=> (not res!715130) (not e!612256))))

(assert (=> b!1072040 (= res!715130 (and (= (size!33549 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33548 _keys!1163) (size!33549 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!94816 res!715132) b!1072040))

(assert (= (and b!1072040 res!715130) b!1072036))

(assert (= (and b!1072036 res!715135) b!1072032))

(assert (= (and b!1072032 res!715134) b!1072035))

(assert (= (and b!1072035 (not res!715131)) b!1072034))

(assert (= (and b!1072034 res!715133) b!1072038))

(assert (= (and b!1072039 condMapEmpty!40501) mapIsEmpty!40501))

(assert (= (and b!1072039 (not condMapEmpty!40501)) mapNonEmpty!40501))

(get-info :version)

(assert (= (and mapNonEmpty!40501 ((_ is ValueCellFull!12227) mapValue!40501)) b!1072033))

(assert (= (and b!1072039 ((_ is ValueCellFull!12227) mapDefault!40501)) b!1072037))

(assert (= start!94816 b!1072039))

(declare-fun m!990387 () Bool)

(assert (=> b!1072038 m!990387))

(declare-fun m!990389 () Bool)

(assert (=> start!94816 m!990389))

(declare-fun m!990391 () Bool)

(assert (=> start!94816 m!990391))

(declare-fun m!990393 () Bool)

(assert (=> start!94816 m!990393))

(declare-fun m!990395 () Bool)

(assert (=> b!1072034 m!990395))

(declare-fun m!990397 () Bool)

(assert (=> b!1072034 m!990397))

(declare-fun m!990399 () Bool)

(assert (=> b!1072034 m!990399))

(declare-fun m!990401 () Bool)

(assert (=> b!1072034 m!990401))

(declare-fun m!990403 () Bool)

(assert (=> b!1072034 m!990403))

(assert (=> b!1072034 m!990397))

(declare-fun m!990405 () Bool)

(assert (=> b!1072034 m!990405))

(declare-fun m!990407 () Bool)

(assert (=> b!1072034 m!990407))

(declare-fun m!990409 () Bool)

(assert (=> b!1072034 m!990409))

(declare-fun m!990411 () Bool)

(assert (=> b!1072034 m!990411))

(declare-fun m!990413 () Bool)

(assert (=> b!1072034 m!990413))

(declare-fun m!990415 () Bool)

(assert (=> mapNonEmpty!40501 m!990415))

(declare-fun m!990417 () Bool)

(assert (=> b!1072036 m!990417))

(declare-fun m!990419 () Bool)

(assert (=> b!1072032 m!990419))

(declare-fun m!990421 () Bool)

(assert (=> b!1072035 m!990421))

(declare-fun m!990423 () Bool)

(assert (=> b!1072035 m!990423))

(declare-fun m!990425 () Bool)

(assert (=> b!1072035 m!990425))

(check-sat (not b_next!22051) tp_is_empty!25861 (not mapNonEmpty!40501) b_and!34867 (not start!94816) (not b!1072034) (not b!1072038) (not b!1072035) (not b!1072036) (not b!1072032))
(check-sat b_and!34867 (not b_next!22051))
