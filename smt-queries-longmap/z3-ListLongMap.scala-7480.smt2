; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95064 () Bool)

(assert start!95064)

(declare-fun b_free!22057 () Bool)

(declare-fun b_next!22057 () Bool)

(assert (=> start!95064 (= b_free!22057 (not b_next!22057))))

(declare-fun tp!77633 () Bool)

(declare-fun b_and!34909 () Bool)

(assert (=> start!95064 (= tp!77633 b_and!34909)))

(declare-fun b!1073593 () Bool)

(declare-fun e!613265 () Bool)

(declare-fun tp_is_empty!25867 () Bool)

(assert (=> b!1073593 (= e!613265 tp_is_empty!25867)))

(declare-datatypes ((V!39625 0))(
  ( (V!39626 (val!12984 Int)) )
))
(declare-datatypes ((tuple2!16506 0))(
  ( (tuple2!16507 (_1!8264 (_ BitVec 64)) (_2!8264 V!39625)) )
))
(declare-fun lt!475674 () tuple2!16506)

(declare-datatypes ((List!23065 0))(
  ( (Nil!23062) (Cons!23061 (h!24279 tuple2!16506) (t!32392 List!23065)) )
))
(declare-datatypes ((ListLongMap!14483 0))(
  ( (ListLongMap!14484 (toList!7257 List!23065)) )
))
(declare-fun lt!475671 () ListLongMap!14483)

(declare-fun lt!475676 () ListLongMap!14483)

(declare-fun e!613268 () Bool)

(declare-fun b!1073594 () Bool)

(declare-fun +!3220 (ListLongMap!14483 tuple2!16506) ListLongMap!14483)

(assert (=> b!1073594 (= e!613268 (= lt!475676 (+!3220 lt!475671 lt!475674)))))

(declare-fun res!715779 () Bool)

(declare-fun e!613269 () Bool)

(assert (=> start!95064 (=> (not res!715779) (not e!613269))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95064 (= res!715779 (validMask!0 mask!1515))))

(assert (=> start!95064 e!613269))

(assert (=> start!95064 true))

(assert (=> start!95064 tp_is_empty!25867))

(declare-datatypes ((ValueCell!12230 0))(
  ( (ValueCellFull!12230 (v!15597 V!39625)) (EmptyCell!12230) )
))
(declare-datatypes ((array!68745 0))(
  ( (array!68746 (arr!33061 (Array (_ BitVec 32) ValueCell!12230)) (size!33598 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68745)

(declare-fun e!613266 () Bool)

(declare-fun array_inv!25590 (array!68745) Bool)

(assert (=> start!95064 (and (array_inv!25590 _values!955) e!613266)))

(assert (=> start!95064 tp!77633))

(declare-datatypes ((array!68747 0))(
  ( (array!68748 (arr!33062 (Array (_ BitVec 32) (_ BitVec 64))) (size!33599 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68747)

(declare-fun array_inv!25591 (array!68747) Bool)

(assert (=> start!95064 (array_inv!25591 _keys!1163)))

(declare-fun b!1073595 () Bool)

(declare-fun res!715776 () Bool)

(assert (=> b!1073595 (=> (not res!715776) (not e!613269))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073595 (= res!715776 (and (= (size!33598 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33599 _keys!1163) (size!33598 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1073596 () Bool)

(declare-fun mapRes!40510 () Bool)

(assert (=> b!1073596 (= e!613266 (and e!613265 mapRes!40510))))

(declare-fun condMapEmpty!40510 () Bool)

(declare-fun mapDefault!40510 () ValueCell!12230)

(assert (=> b!1073596 (= condMapEmpty!40510 (= (arr!33061 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12230)) mapDefault!40510)))))

(declare-fun b!1073597 () Bool)

(declare-fun e!613271 () Bool)

(assert (=> b!1073597 (= e!613271 true)))

(declare-fun lt!475679 () ListLongMap!14483)

(declare-fun lt!475670 () ListLongMap!14483)

(declare-fun -!687 (ListLongMap!14483 (_ BitVec 64)) ListLongMap!14483)

(assert (=> b!1073597 (= lt!475679 (-!687 lt!475670 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!475672 () ListLongMap!14483)

(declare-fun lt!475677 () ListLongMap!14483)

(assert (=> b!1073597 (= lt!475672 lt!475677)))

(declare-fun zeroValueBefore!47 () V!39625)

(declare-datatypes ((Unit!35295 0))(
  ( (Unit!35296) )
))
(declare-fun lt!475668 () Unit!35295)

(declare-fun lt!475675 () ListLongMap!14483)

(declare-fun minValue!907 () V!39625)

(declare-fun addCommutativeForDiffKeys!744 (ListLongMap!14483 (_ BitVec 64) V!39625 (_ BitVec 64) V!39625) Unit!35295)

(assert (=> b!1073597 (= lt!475668 (addCommutativeForDiffKeys!744 lt!475675 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!475678 () ListLongMap!14483)

(assert (=> b!1073597 (= (-!687 lt!475677 #b0000000000000000000000000000000000000000000000000000000000000000) lt!475678)))

(declare-fun lt!475669 () tuple2!16506)

(assert (=> b!1073597 (= lt!475677 (+!3220 lt!475678 lt!475669))))

(declare-fun lt!475667 () Unit!35295)

(declare-fun addThenRemoveForNewKeyIsSame!62 (ListLongMap!14483 (_ BitVec 64) V!39625) Unit!35295)

(assert (=> b!1073597 (= lt!475667 (addThenRemoveForNewKeyIsSame!62 lt!475678 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1073597 (= lt!475678 (+!3220 lt!475675 lt!475674))))

(assert (=> b!1073597 e!613268))

(declare-fun res!715775 () Bool)

(assert (=> b!1073597 (=> (not res!715775) (not e!613268))))

(assert (=> b!1073597 (= res!715775 (= lt!475670 lt!475672))))

(assert (=> b!1073597 (= lt!475672 (+!3220 (+!3220 lt!475675 lt!475669) lt!475674))))

(assert (=> b!1073597 (= lt!475674 (tuple2!16507 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1073597 (= lt!475669 (tuple2!16507 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39625)

(declare-fun getCurrentListMap!4148 (array!68747 array!68745 (_ BitVec 32) (_ BitVec 32) V!39625 V!39625 (_ BitVec 32) Int) ListLongMap!14483)

(assert (=> b!1073597 (= lt!475676 (getCurrentListMap!4148 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1073597 (= lt!475670 (getCurrentListMap!4148 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073598 () Bool)

(assert (=> b!1073598 (= e!613269 (not e!613271))))

(declare-fun res!715778 () Bool)

(assert (=> b!1073598 (=> res!715778 e!613271)))

(assert (=> b!1073598 (= res!715778 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1073598 (= lt!475675 lt!475671)))

(declare-fun lt!475673 () Unit!35295)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!862 (array!68747 array!68745 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39625 V!39625 V!39625 V!39625 (_ BitVec 32) Int) Unit!35295)

(assert (=> b!1073598 (= lt!475673 (lemmaNoChangeToArrayThenSameMapNoExtras!862 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3859 (array!68747 array!68745 (_ BitVec 32) (_ BitVec 32) V!39625 V!39625 (_ BitVec 32) Int) ListLongMap!14483)

(assert (=> b!1073598 (= lt!475671 (getCurrentListMapNoExtraKeys!3859 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1073598 (= lt!475675 (getCurrentListMapNoExtraKeys!3859 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapIsEmpty!40510 () Bool)

(assert (=> mapIsEmpty!40510 mapRes!40510))

(declare-fun b!1073599 () Bool)

(declare-fun res!715777 () Bool)

(assert (=> b!1073599 (=> (not res!715777) (not e!613269))))

(declare-datatypes ((List!23066 0))(
  ( (Nil!23063) (Cons!23062 (h!24280 (_ BitVec 64)) (t!32393 List!23066)) )
))
(declare-fun arrayNoDuplicates!0 (array!68747 (_ BitVec 32) List!23066) Bool)

(assert (=> b!1073599 (= res!715777 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23063))))

(declare-fun b!1073600 () Bool)

(declare-fun res!715780 () Bool)

(assert (=> b!1073600 (=> (not res!715780) (not e!613269))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68747 (_ BitVec 32)) Bool)

(assert (=> b!1073600 (= res!715780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1073601 () Bool)

(declare-fun e!613270 () Bool)

(assert (=> b!1073601 (= e!613270 tp_is_empty!25867)))

(declare-fun mapNonEmpty!40510 () Bool)

(declare-fun tp!77632 () Bool)

(assert (=> mapNonEmpty!40510 (= mapRes!40510 (and tp!77632 e!613270))))

(declare-fun mapValue!40510 () ValueCell!12230)

(declare-fun mapKey!40510 () (_ BitVec 32))

(declare-fun mapRest!40510 () (Array (_ BitVec 32) ValueCell!12230))

(assert (=> mapNonEmpty!40510 (= (arr!33061 _values!955) (store mapRest!40510 mapKey!40510 mapValue!40510))))

(assert (= (and start!95064 res!715779) b!1073595))

(assert (= (and b!1073595 res!715776) b!1073600))

(assert (= (and b!1073600 res!715780) b!1073599))

(assert (= (and b!1073599 res!715777) b!1073598))

(assert (= (and b!1073598 (not res!715778)) b!1073597))

(assert (= (and b!1073597 res!715775) b!1073594))

(assert (= (and b!1073596 condMapEmpty!40510) mapIsEmpty!40510))

(assert (= (and b!1073596 (not condMapEmpty!40510)) mapNonEmpty!40510))

(get-info :version)

(assert (= (and mapNonEmpty!40510 ((_ is ValueCellFull!12230) mapValue!40510)) b!1073601))

(assert (= (and b!1073596 ((_ is ValueCellFull!12230) mapDefault!40510)) b!1073593))

(assert (= start!95064 b!1073596))

(declare-fun m!992805 () Bool)

(assert (=> b!1073598 m!992805))

(declare-fun m!992807 () Bool)

(assert (=> b!1073598 m!992807))

(declare-fun m!992809 () Bool)

(assert (=> b!1073598 m!992809))

(declare-fun m!992811 () Bool)

(assert (=> b!1073599 m!992811))

(declare-fun m!992813 () Bool)

(assert (=> b!1073594 m!992813))

(declare-fun m!992815 () Bool)

(assert (=> b!1073597 m!992815))

(declare-fun m!992817 () Bool)

(assert (=> b!1073597 m!992817))

(declare-fun m!992819 () Bool)

(assert (=> b!1073597 m!992819))

(declare-fun m!992821 () Bool)

(assert (=> b!1073597 m!992821))

(declare-fun m!992823 () Bool)

(assert (=> b!1073597 m!992823))

(declare-fun m!992825 () Bool)

(assert (=> b!1073597 m!992825))

(declare-fun m!992827 () Bool)

(assert (=> b!1073597 m!992827))

(declare-fun m!992829 () Bool)

(assert (=> b!1073597 m!992829))

(declare-fun m!992831 () Bool)

(assert (=> b!1073597 m!992831))

(declare-fun m!992833 () Bool)

(assert (=> b!1073597 m!992833))

(assert (=> b!1073597 m!992821))

(declare-fun m!992835 () Bool)

(assert (=> start!95064 m!992835))

(declare-fun m!992837 () Bool)

(assert (=> start!95064 m!992837))

(declare-fun m!992839 () Bool)

(assert (=> start!95064 m!992839))

(declare-fun m!992841 () Bool)

(assert (=> mapNonEmpty!40510 m!992841))

(declare-fun m!992843 () Bool)

(assert (=> b!1073600 m!992843))

(check-sat (not start!95064) (not mapNonEmpty!40510) (not b!1073600) (not b_next!22057) b_and!34909 (not b!1073599) (not b!1073598) tp_is_empty!25867 (not b!1073594) (not b!1073597))
(check-sat b_and!34909 (not b_next!22057))
