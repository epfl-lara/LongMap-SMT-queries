; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94752 () Bool)

(assert start!94752)

(declare-fun b_free!22005 () Bool)

(declare-fun b_next!22005 () Bool)

(assert (=> start!94752 (= b_free!22005 (not b_next!22005))))

(declare-fun tp!77474 () Bool)

(declare-fun b_and!34835 () Bool)

(assert (=> start!94752 (= tp!77474 b_and!34835)))

(declare-fun mapIsEmpty!40429 () Bool)

(declare-fun mapRes!40429 () Bool)

(assert (=> mapIsEmpty!40429 mapRes!40429))

(declare-fun res!714699 () Bool)

(declare-fun e!611742 () Bool)

(assert (=> start!94752 (=> (not res!714699) (not e!611742))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94752 (= res!714699 (validMask!0 mask!1515))))

(assert (=> start!94752 e!611742))

(assert (=> start!94752 true))

(declare-fun tp_is_empty!25815 () Bool)

(assert (=> start!94752 tp_is_empty!25815))

(declare-datatypes ((V!39555 0))(
  ( (V!39556 (val!12958 Int)) )
))
(declare-datatypes ((ValueCell!12204 0))(
  ( (ValueCellFull!12204 (v!15574 V!39555)) (EmptyCell!12204) )
))
(declare-datatypes ((array!68603 0))(
  ( (array!68604 (arr!32997 (Array (_ BitVec 32) ValueCell!12204)) (size!33533 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68603)

(declare-fun e!611744 () Bool)

(declare-fun array_inv!25516 (array!68603) Bool)

(assert (=> start!94752 (and (array_inv!25516 _values!955) e!611744)))

(assert (=> start!94752 tp!77474))

(declare-datatypes ((array!68605 0))(
  ( (array!68606 (arr!32998 (Array (_ BitVec 32) (_ BitVec 64))) (size!33534 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68605)

(declare-fun array_inv!25517 (array!68605) Bool)

(assert (=> start!94752 (array_inv!25517 _keys!1163)))

(declare-fun mapNonEmpty!40429 () Bool)

(declare-fun tp!77473 () Bool)

(declare-fun e!611741 () Bool)

(assert (=> mapNonEmpty!40429 (= mapRes!40429 (and tp!77473 e!611741))))

(declare-fun mapRest!40429 () (Array (_ BitVec 32) ValueCell!12204))

(declare-fun mapKey!40429 () (_ BitVec 32))

(declare-fun mapValue!40429 () ValueCell!12204)

(assert (=> mapNonEmpty!40429 (= (arr!32997 _values!955) (store mapRest!40429 mapKey!40429 mapValue!40429))))

(declare-fun b!1071372 () Bool)

(declare-fun res!714698 () Bool)

(assert (=> b!1071372 (=> (not res!714698) (not e!611742))))

(declare-datatypes ((List!23033 0))(
  ( (Nil!23030) (Cons!23029 (h!24238 (_ BitVec 64)) (t!32366 List!23033)) )
))
(declare-fun arrayNoDuplicates!0 (array!68605 (_ BitVec 32) List!23033) Bool)

(assert (=> b!1071372 (= res!714698 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23030))))

(declare-fun b!1071373 () Bool)

(declare-fun e!611747 () Bool)

(assert (=> b!1071373 (= e!611747 tp_is_empty!25815)))

(declare-fun b!1071374 () Bool)

(declare-fun res!714697 () Bool)

(assert (=> b!1071374 (=> (not res!714697) (not e!611742))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68605 (_ BitVec 32)) Bool)

(assert (=> b!1071374 (= res!714697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1071375 () Bool)

(declare-fun res!714700 () Bool)

(assert (=> b!1071375 (=> (not res!714700) (not e!611742))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071375 (= res!714700 (and (= (size!33533 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33534 _keys!1163) (size!33533 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1071376 () Bool)

(declare-fun e!611743 () Bool)

(assert (=> b!1071376 (= e!611742 (not e!611743))))

(declare-fun res!714696 () Bool)

(assert (=> b!1071376 (=> res!714696 e!611743)))

(assert (=> b!1071376 (= res!714696 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!16492 0))(
  ( (tuple2!16493 (_1!8257 (_ BitVec 64)) (_2!8257 V!39555)) )
))
(declare-datatypes ((List!23034 0))(
  ( (Nil!23031) (Cons!23030 (h!24239 tuple2!16492) (t!32367 List!23034)) )
))
(declare-datatypes ((ListLongMap!14461 0))(
  ( (ListLongMap!14462 (toList!7246 List!23034)) )
))
(declare-fun lt!473988 () ListLongMap!14461)

(declare-fun lt!473992 () ListLongMap!14461)

(assert (=> b!1071376 (= lt!473988 lt!473992)))

(declare-fun zeroValueBefore!47 () V!39555)

(declare-datatypes ((Unit!35288 0))(
  ( (Unit!35289) )
))
(declare-fun lt!473991 () Unit!35288)

(declare-fun minValue!907 () V!39555)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39555)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!854 (array!68605 array!68603 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39555 V!39555 V!39555 V!39555 (_ BitVec 32) Int) Unit!35288)

(assert (=> b!1071376 (= lt!473991 (lemmaNoChangeToArrayThenSameMapNoExtras!854 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3817 (array!68605 array!68603 (_ BitVec 32) (_ BitVec 32) V!39555 V!39555 (_ BitVec 32) Int) ListLongMap!14461)

(assert (=> b!1071376 (= lt!473992 (getCurrentListMapNoExtraKeys!3817 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071376 (= lt!473988 (getCurrentListMapNoExtraKeys!3817 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071377 () Bool)

(declare-fun e!611745 () Bool)

(declare-fun lt!473982 () tuple2!16492)

(declare-fun lt!473993 () ListLongMap!14461)

(declare-fun +!3181 (ListLongMap!14461 tuple2!16492) ListLongMap!14461)

(assert (=> b!1071377 (= e!611745 (= lt!473993 (+!3181 lt!473992 lt!473982)))))

(declare-fun b!1071378 () Bool)

(assert (=> b!1071378 (= e!611743 true)))

(declare-fun lt!473987 () ListLongMap!14461)

(declare-fun lt!473985 () ListLongMap!14461)

(declare-fun -!679 (ListLongMap!14461 (_ BitVec 64)) ListLongMap!14461)

(assert (=> b!1071378 (= lt!473987 (-!679 lt!473985 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!473983 () ListLongMap!14461)

(declare-fun lt!473989 () ListLongMap!14461)

(assert (=> b!1071378 (= lt!473983 lt!473989)))

(declare-fun lt!473984 () Unit!35288)

(declare-fun addCommutativeForDiffKeys!724 (ListLongMap!14461 (_ BitVec 64) V!39555 (_ BitVec 64) V!39555) Unit!35288)

(assert (=> b!1071378 (= lt!473984 (addCommutativeForDiffKeys!724 lt!473988 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!473986 () ListLongMap!14461)

(assert (=> b!1071378 (= (-!679 lt!473989 #b0000000000000000000000000000000000000000000000000000000000000000) lt!473986)))

(declare-fun lt!473990 () tuple2!16492)

(assert (=> b!1071378 (= lt!473989 (+!3181 lt!473986 lt!473990))))

(declare-fun lt!473981 () Unit!35288)

(declare-fun addThenRemoveForNewKeyIsSame!49 (ListLongMap!14461 (_ BitVec 64) V!39555) Unit!35288)

(assert (=> b!1071378 (= lt!473981 (addThenRemoveForNewKeyIsSame!49 lt!473986 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(assert (=> b!1071378 (= lt!473986 (+!3181 lt!473988 lt!473982))))

(assert (=> b!1071378 e!611745))

(declare-fun res!714695 () Bool)

(assert (=> b!1071378 (=> (not res!714695) (not e!611745))))

(assert (=> b!1071378 (= res!714695 (= lt!473985 lt!473983))))

(assert (=> b!1071378 (= lt!473983 (+!3181 (+!3181 lt!473988 lt!473990) lt!473982))))

(assert (=> b!1071378 (= lt!473982 (tuple2!16493 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1071378 (= lt!473990 (tuple2!16493 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun getCurrentListMap!4145 (array!68605 array!68603 (_ BitVec 32) (_ BitVec 32) V!39555 V!39555 (_ BitVec 32) Int) ListLongMap!14461)

(assert (=> b!1071378 (= lt!473993 (getCurrentListMap!4145 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1071378 (= lt!473985 (getCurrentListMap!4145 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071379 () Bool)

(assert (=> b!1071379 (= e!611744 (and e!611747 mapRes!40429))))

(declare-fun condMapEmpty!40429 () Bool)

(declare-fun mapDefault!40429 () ValueCell!12204)

(assert (=> b!1071379 (= condMapEmpty!40429 (= (arr!32997 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12204)) mapDefault!40429)))))

(declare-fun b!1071380 () Bool)

(assert (=> b!1071380 (= e!611741 tp_is_empty!25815)))

(assert (= (and start!94752 res!714699) b!1071375))

(assert (= (and b!1071375 res!714700) b!1071374))

(assert (= (and b!1071374 res!714697) b!1071372))

(assert (= (and b!1071372 res!714698) b!1071376))

(assert (= (and b!1071376 (not res!714696)) b!1071378))

(assert (= (and b!1071378 res!714695) b!1071377))

(assert (= (and b!1071379 condMapEmpty!40429) mapIsEmpty!40429))

(assert (= (and b!1071379 (not condMapEmpty!40429)) mapNonEmpty!40429))

(get-info :version)

(assert (= (and mapNonEmpty!40429 ((_ is ValueCellFull!12204) mapValue!40429)) b!1071380))

(assert (= (and b!1071379 ((_ is ValueCellFull!12204) mapDefault!40429)) b!1071373))

(assert (= start!94752 b!1071379))

(declare-fun m!989849 () Bool)

(assert (=> b!1071374 m!989849))

(declare-fun m!989851 () Bool)

(assert (=> b!1071376 m!989851))

(declare-fun m!989853 () Bool)

(assert (=> b!1071376 m!989853))

(declare-fun m!989855 () Bool)

(assert (=> b!1071376 m!989855))

(declare-fun m!989857 () Bool)

(assert (=> start!94752 m!989857))

(declare-fun m!989859 () Bool)

(assert (=> start!94752 m!989859))

(declare-fun m!989861 () Bool)

(assert (=> start!94752 m!989861))

(declare-fun m!989863 () Bool)

(assert (=> b!1071372 m!989863))

(declare-fun m!989865 () Bool)

(assert (=> b!1071377 m!989865))

(declare-fun m!989867 () Bool)

(assert (=> b!1071378 m!989867))

(declare-fun m!989869 () Bool)

(assert (=> b!1071378 m!989869))

(declare-fun m!989871 () Bool)

(assert (=> b!1071378 m!989871))

(declare-fun m!989873 () Bool)

(assert (=> b!1071378 m!989873))

(declare-fun m!989875 () Bool)

(assert (=> b!1071378 m!989875))

(declare-fun m!989877 () Bool)

(assert (=> b!1071378 m!989877))

(declare-fun m!989879 () Bool)

(assert (=> b!1071378 m!989879))

(declare-fun m!989881 () Bool)

(assert (=> b!1071378 m!989881))

(assert (=> b!1071378 m!989871))

(declare-fun m!989883 () Bool)

(assert (=> b!1071378 m!989883))

(declare-fun m!989885 () Bool)

(assert (=> b!1071378 m!989885))

(declare-fun m!989887 () Bool)

(assert (=> mapNonEmpty!40429 m!989887))

(check-sat b_and!34835 (not start!94752) (not mapNonEmpty!40429) (not b_next!22005) (not b!1071378) (not b!1071374) (not b!1071372) tp_is_empty!25815 (not b!1071377) (not b!1071376))
(check-sat b_and!34835 (not b_next!22005))
