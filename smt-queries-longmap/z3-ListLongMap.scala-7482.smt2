; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95076 () Bool)

(assert start!95076)

(declare-fun b_free!22069 () Bool)

(declare-fun b_next!22069 () Bool)

(assert (=> start!95076 (= b_free!22069 (not b_next!22069))))

(declare-fun tp!77669 () Bool)

(declare-fun b_and!34921 () Bool)

(assert (=> start!95076 (= tp!77669 b_and!34921)))

(declare-fun b!1073756 () Bool)

(declare-fun e!613393 () Bool)

(declare-fun e!613396 () Bool)

(declare-fun mapRes!40528 () Bool)

(assert (=> b!1073756 (= e!613393 (and e!613396 mapRes!40528))))

(declare-fun condMapEmpty!40528 () Bool)

(declare-datatypes ((V!39641 0))(
  ( (V!39642 (val!12990 Int)) )
))
(declare-datatypes ((ValueCell!12236 0))(
  ( (ValueCellFull!12236 (v!15603 V!39641)) (EmptyCell!12236) )
))
(declare-datatypes ((array!68767 0))(
  ( (array!68768 (arr!33072 (Array (_ BitVec 32) ValueCell!12236)) (size!33609 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68767)

(declare-fun mapDefault!40528 () ValueCell!12236)

(assert (=> b!1073756 (= condMapEmpty!40528 (= (arr!33072 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12236)) mapDefault!40528)))))

(declare-fun e!613397 () Bool)

(declare-datatypes ((tuple2!16516 0))(
  ( (tuple2!16517 (_1!8269 (_ BitVec 64)) (_2!8269 V!39641)) )
))
(declare-datatypes ((List!23074 0))(
  ( (Nil!23071) (Cons!23070 (h!24288 tuple2!16516) (t!32401 List!23074)) )
))
(declare-datatypes ((ListLongMap!14493 0))(
  ( (ListLongMap!14494 (toList!7262 List!23074)) )
))
(declare-fun lt!475908 () ListLongMap!14493)

(declare-fun lt!475909 () ListLongMap!14493)

(declare-fun b!1073757 () Bool)

(declare-fun lt!475906 () tuple2!16516)

(declare-fun +!3225 (ListLongMap!14493 tuple2!16516) ListLongMap!14493)

(assert (=> b!1073757 (= e!613397 (= lt!475908 (+!3225 lt!475909 lt!475906)))))

(declare-fun b!1073758 () Bool)

(declare-fun res!715883 () Bool)

(declare-fun e!613392 () Bool)

(assert (=> b!1073758 (=> (not res!715883) (not e!613392))))

(declare-datatypes ((array!68769 0))(
  ( (array!68770 (arr!33073 (Array (_ BitVec 32) (_ BitVec 64))) (size!33610 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68769)

(declare-datatypes ((List!23075 0))(
  ( (Nil!23072) (Cons!23071 (h!24289 (_ BitVec 64)) (t!32402 List!23075)) )
))
(declare-fun arrayNoDuplicates!0 (array!68769 (_ BitVec 32) List!23075) Bool)

(assert (=> b!1073758 (= res!715883 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23072))))

(declare-fun b!1073759 () Bool)

(declare-fun e!613394 () Bool)

(assert (=> b!1073759 (= e!613394 true)))

(declare-fun lt!475904 () ListLongMap!14493)

(declare-fun lt!475907 () ListLongMap!14493)

(declare-fun -!691 (ListLongMap!14493 (_ BitVec 64)) ListLongMap!14493)

(assert (=> b!1073759 (= lt!475904 (-!691 lt!475907 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!475901 () ListLongMap!14493)

(declare-fun lt!475903 () ListLongMap!14493)

(assert (=> b!1073759 (= lt!475901 lt!475903)))

(declare-fun zeroValueBefore!47 () V!39641)

(declare-datatypes ((Unit!35303 0))(
  ( (Unit!35304) )
))
(declare-fun lt!475905 () Unit!35303)

(declare-fun lt!475910 () ListLongMap!14493)

(declare-fun minValue!907 () V!39641)

(declare-fun addCommutativeForDiffKeys!748 (ListLongMap!14493 (_ BitVec 64) V!39641 (_ BitVec 64) V!39641) Unit!35303)

(assert (=> b!1073759 (= lt!475905 (addCommutativeForDiffKeys!748 lt!475910 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!475913 () ListLongMap!14493)

(assert (=> b!1073759 (= (-!691 lt!475903 #b0000000000000000000000000000000000000000000000000000000000000000) lt!475913)))

(declare-fun lt!475912 () tuple2!16516)

(assert (=> b!1073759 (= lt!475903 (+!3225 lt!475913 lt!475912))))

(declare-fun lt!475902 () Unit!35303)

(declare-fun addThenRemoveForNewKeyIsSame!66 (ListLongMap!14493 (_ BitVec 64) V!39641) Unit!35303)

(assert (=> b!1073759 (= lt!475902 (addThenRemoveForNewKeyIsSame!66 lt!475913 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1073759 (= lt!475913 (+!3225 lt!475910 lt!475906))))

(assert (=> b!1073759 e!613397))

(declare-fun res!715888 () Bool)

(assert (=> b!1073759 (=> (not res!715888) (not e!613397))))

(assert (=> b!1073759 (= res!715888 (= lt!475907 lt!475901))))

(assert (=> b!1073759 (= lt!475901 (+!3225 (+!3225 lt!475910 lt!475912) lt!475906))))

(assert (=> b!1073759 (= lt!475906 (tuple2!16517 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1073759 (= lt!475912 (tuple2!16517 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39641)

(declare-fun getCurrentListMap!4152 (array!68769 array!68767 (_ BitVec 32) (_ BitVec 32) V!39641 V!39641 (_ BitVec 32) Int) ListLongMap!14493)

(assert (=> b!1073759 (= lt!475908 (getCurrentListMap!4152 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1073759 (= lt!475907 (getCurrentListMap!4152 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1073760 () Bool)

(declare-fun tp_is_empty!25879 () Bool)

(assert (=> b!1073760 (= e!613396 tp_is_empty!25879)))

(declare-fun b!1073761 () Bool)

(declare-fun e!613391 () Bool)

(assert (=> b!1073761 (= e!613391 tp_is_empty!25879)))

(declare-fun b!1073762 () Bool)

(declare-fun res!715885 () Bool)

(assert (=> b!1073762 (=> (not res!715885) (not e!613392))))

(assert (=> b!1073762 (= res!715885 (and (= (size!33609 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33610 _keys!1163) (size!33609 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1073763 () Bool)

(declare-fun res!715887 () Bool)

(assert (=> b!1073763 (=> (not res!715887) (not e!613392))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68769 (_ BitVec 32)) Bool)

(assert (=> b!1073763 (= res!715887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!40528 () Bool)

(declare-fun tp!77668 () Bool)

(assert (=> mapNonEmpty!40528 (= mapRes!40528 (and tp!77668 e!613391))))

(declare-fun mapRest!40528 () (Array (_ BitVec 32) ValueCell!12236))

(declare-fun mapValue!40528 () ValueCell!12236)

(declare-fun mapKey!40528 () (_ BitVec 32))

(assert (=> mapNonEmpty!40528 (= (arr!33072 _values!955) (store mapRest!40528 mapKey!40528 mapValue!40528))))

(declare-fun mapIsEmpty!40528 () Bool)

(assert (=> mapIsEmpty!40528 mapRes!40528))

(declare-fun res!715886 () Bool)

(assert (=> start!95076 (=> (not res!715886) (not e!613392))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95076 (= res!715886 (validMask!0 mask!1515))))

(assert (=> start!95076 e!613392))

(assert (=> start!95076 true))

(assert (=> start!95076 tp_is_empty!25879))

(declare-fun array_inv!25600 (array!68767) Bool)

(assert (=> start!95076 (and (array_inv!25600 _values!955) e!613393)))

(assert (=> start!95076 tp!77669))

(declare-fun array_inv!25601 (array!68769) Bool)

(assert (=> start!95076 (array_inv!25601 _keys!1163)))

(declare-fun b!1073755 () Bool)

(assert (=> b!1073755 (= e!613392 (not e!613394))))

(declare-fun res!715884 () Bool)

(assert (=> b!1073755 (=> res!715884 e!613394)))

(assert (=> b!1073755 (= res!715884 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1073755 (= lt!475910 lt!475909)))

(declare-fun lt!475911 () Unit!35303)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!865 (array!68769 array!68767 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39641 V!39641 V!39641 V!39641 (_ BitVec 32) Int) Unit!35303)

(assert (=> b!1073755 (= lt!475911 (lemmaNoChangeToArrayThenSameMapNoExtras!865 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3862 (array!68769 array!68767 (_ BitVec 32) (_ BitVec 32) V!39641 V!39641 (_ BitVec 32) Int) ListLongMap!14493)

(assert (=> b!1073755 (= lt!475909 (getCurrentListMapNoExtraKeys!3862 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1073755 (= lt!475910 (getCurrentListMapNoExtraKeys!3862 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!95076 res!715886) b!1073762))

(assert (= (and b!1073762 res!715885) b!1073763))

(assert (= (and b!1073763 res!715887) b!1073758))

(assert (= (and b!1073758 res!715883) b!1073755))

(assert (= (and b!1073755 (not res!715884)) b!1073759))

(assert (= (and b!1073759 res!715888) b!1073757))

(assert (= (and b!1073756 condMapEmpty!40528) mapIsEmpty!40528))

(assert (= (and b!1073756 (not condMapEmpty!40528)) mapNonEmpty!40528))

(get-info :version)

(assert (= (and mapNonEmpty!40528 ((_ is ValueCellFull!12236) mapValue!40528)) b!1073761))

(assert (= (and b!1073756 ((_ is ValueCellFull!12236) mapDefault!40528)) b!1073760))

(assert (= start!95076 b!1073756))

(declare-fun m!993045 () Bool)

(assert (=> b!1073759 m!993045))

(declare-fun m!993047 () Bool)

(assert (=> b!1073759 m!993047))

(assert (=> b!1073759 m!993045))

(declare-fun m!993049 () Bool)

(assert (=> b!1073759 m!993049))

(declare-fun m!993051 () Bool)

(assert (=> b!1073759 m!993051))

(declare-fun m!993053 () Bool)

(assert (=> b!1073759 m!993053))

(declare-fun m!993055 () Bool)

(assert (=> b!1073759 m!993055))

(declare-fun m!993057 () Bool)

(assert (=> b!1073759 m!993057))

(declare-fun m!993059 () Bool)

(assert (=> b!1073759 m!993059))

(declare-fun m!993061 () Bool)

(assert (=> b!1073759 m!993061))

(declare-fun m!993063 () Bool)

(assert (=> b!1073759 m!993063))

(declare-fun m!993065 () Bool)

(assert (=> b!1073763 m!993065))

(declare-fun m!993067 () Bool)

(assert (=> b!1073757 m!993067))

(declare-fun m!993069 () Bool)

(assert (=> start!95076 m!993069))

(declare-fun m!993071 () Bool)

(assert (=> start!95076 m!993071))

(declare-fun m!993073 () Bool)

(assert (=> start!95076 m!993073))

(declare-fun m!993075 () Bool)

(assert (=> b!1073755 m!993075))

(declare-fun m!993077 () Bool)

(assert (=> b!1073755 m!993077))

(declare-fun m!993079 () Bool)

(assert (=> b!1073755 m!993079))

(declare-fun m!993081 () Bool)

(assert (=> mapNonEmpty!40528 m!993081))

(declare-fun m!993083 () Bool)

(assert (=> b!1073758 m!993083))

(check-sat (not start!95076) (not b!1073755) (not b_next!22069) b_and!34921 (not b!1073763) tp_is_empty!25879 (not b!1073757) (not b!1073758) (not mapNonEmpty!40528) (not b!1073759))
(check-sat b_and!34921 (not b_next!22069))
